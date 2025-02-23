from fastapi import FastAPI, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy import func, desc, distinct, case
from . import models, schemas
from .database import engine, get_db
from typing import List, Optional, Dict
from collections import defaultdict
from datetime import date

# Create tables
models.Base.metadata.create_all(bind=engine)

app = FastAPI(title="Olympic Games API")

# 1. Medal Ranking Endpoint
@app.get("/api/medal-ranking")
def get_medal_ranking(
    db: Session = Depends(get_db),
    year: Optional[int] = Query(None, description="Filter by specific year"),
    top_n: Optional[int] = Query(10, description="Number of top countries to return")
):
    try:
        query = db.query(
            models.MedalTally.country,
            func.sum(models.MedalTally.gold).label('total_gold'),
            func.sum(models.MedalTally.silver).label('total_silver'),
            func.sum(models.MedalTally.bronze).label('total_bronze'),
            func.sum(models.MedalTally.total).label('grand_total')
        ).group_by(models.MedalTally.country)

        if year:
            query = query.filter(models.MedalTally.year == year)

        results = query.order_by(desc('grand_total')).limit(top_n).all()

        # Format data for charts in the new structure
        chart_data = [
            {
                "xAxis": r.country,
                "gold": r.total_gold,
                "silver": r.total_silver,
                "bronze": r.total_bronze
            } for r in results
        ]

        # Get available years for dropdown
        years = db.query(models.MedalTally.year).distinct().order_by(models.MedalTally.year).all()
        
        return {
            "data": chart_data,
            "chart_type": "bar",
            "filters": {
                "years": [year[0] for year in years]
            }
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# 2. Medal Comparison Endpoint
@app.get("/api/medal-comparison")
def get_medal_comparison(
    db: Session = Depends(get_db),
    country: Optional[str] = Query(None, description="Filter by country"),
    start_year: Optional[int] = Query(None, description="Start year"),
    end_year: Optional[int] = Query(None, description="End year")
):
    try:
        query = db.query(
            models.MedalTally.year,
            models.MedalTally.country,
            func.sum(models.MedalTally.total).label('total_medals')
        ).group_by(models.MedalTally.year, models.MedalTally.country)

        if country:
            query = query.filter(models.MedalTally.country == country)
        if start_year:
            query = query.filter(models.MedalTally.year >= start_year)
        if end_year:
            query = query.filter(models.MedalTally.year <= end_year)

        results = query.order_by(models.MedalTally.year).all()

        # Format data for line chart
        chart_data = [
            {
                "xAxis": result.year,
                "medals": result.total_medals
            }
            for result in results
        ]

        years = sorted(set(r.year for r in results))

        return {
            "chart_data": chart_data,
            "chart_type": "line",
            "country": country,
            "filters": {
                "years": years
            }
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/gender-distribution")
def get_gender_distribution(db: Session = Depends(get_db)):
    try:
        # Query to get gender counts
        results = db.query(
            models.AthleteProfile.sex,
            func.count(models.AthleteProfile.athlete_id).label('count')
        ).group_by(
            models.AthleteProfile.sex
        ).all()

        # Calculate total for percentages
        total_athletes = sum(r.count for r in results)

        # Format data for donut chart
        chart_data = []
        for result in results:
            if result.sex:  # Skip if gender is None
                # Handle "Male" and "Female" values
                gender = result.sex.lower()  # Convert to lowercase for consistency
                percentage = round((result.count / total_athletes) * 100, 2)
                chart_data.append({
                    "gender": gender,
                    "athletes": result.count,
                    "percentage": percentage
                })

        return {
            "data": chart_data,
            "total_athletes": total_athletes
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/top-athletes")
def get_top_athletes(db: Session = Depends(get_db)):
    try:
        # Query to get athlete information and medal counts
        query = db.query(
            models.AthleteProfile.name,
            models.AthleteProfile.country,
            func.count(case([(models.EventResult.medal == 'Gold', 1)])).label('gold'),
            func.count(case([(models.EventResult.medal == 'Silver', 1)])).label('silver'),
            func.count(case([(models.EventResult.medal == 'Bronze', 1)])).label('bronze')
        ).join(
            models.EventResult,
            models.AthleteProfile.athlete_id == models.EventResult.athlete_id  # Changed to match on athlete_id
        ).group_by(
            models.AthleteProfile.name,
            models.AthleteProfile.country
        ).having(
            # Count only where medal is not null
            func.count(models.EventResult.medal.isnot(None)) > 0
        ).order_by(
            desc('gold'),
            desc('silver'),
            desc('bronze')
        ).limit(10)

        results = query.all()

        # Format data for bar chart
        chart_data = [
            {
                "xAxis": result.name,
                "gold": result.gold,
                "silver": result.silver,
                "bronze": result.bronze,
                "total": result.gold + result.silver + result.bronze,
                "country": result.country
            } for result in results
        ]

        # Sort by total medals, then by gold, silver, bronze
        chart_data.sort(key=lambda x: (x["total"], x["gold"], x["silver"], x["bronze"]), reverse=True)

        return {
            "data": chart_data,
            "chart_type": "stacked-bar",
            "title": "Top 10 Olympic Athletes by Medal Count",
            "colors": {
                "gold": "#FFD700",
                "silver": "#C0C0C0",
                "bronze": "#CD7F32"
            }
        }
    except Exception as e:
        print(f"Error: {str(e)}")  # Debug print
        raise HTTPException(status_code=500, detail=str(e))




# Overview APIs
@app.get("/api/stats/total-athletes")
def get_total_athletes(db: Session = Depends(get_db)):
    try:
        total = db.query(func.count(func.distinct(models.AthleteProfile.athlete_id))).scalar()
        return {"total_athletes": total}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/stats/total-olympics")
def get_total_olympics(db: Session = Depends(get_db)):
    try:
        total = db.query(func.count(func.distinct(models.GamesSummary.edition))).scalar()
        return {"total_olympics": total}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/stats/total-medals")
def get_total_medals(db: Session = Depends(get_db)):
    try:
        result = db.query(
            func.sum(models.MedalTally.gold).label('gold'),
            func.sum(models.MedalTally.silver).label('silver'),
            func.sum(models.MedalTally.bronze).label('bronze')
        ).first()
        
        total_medals = result.gold + result.silver + result.bronze
        return {
            "total_medals": total_medals,
            "breakdown": {
                "gold": result.gold,
                "silver": result.silver,
                "bronze": result.bronze
            }
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/stats/total-sports")
def get_total_sports(db: Session = Depends(get_db)):
    try:
        total = db.query(func.count(func.distinct(models.EventResult.sport))).scalar()
        return {"total_sports": total}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/stats/total-countries")
def get_total_countries(db: Session = Depends(get_db)):
    try:
        total = db.query(func.count(func.distinct(models.CountryProfile.noc))).scalar()
        return {"total_countries": total}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))



from fastapi import FastAPI, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy import func, desc
from . import models, schemas
from .database import engine, get_db
from typing import List, Optional, Dict
from collections import defaultdict
from datetime import date

# Create tables
models.Base.metadata.create_all(bind=engine)

app = FastAPI(title="Olympic Games API")

# Athletes endpoints
@app.get("/athletes/", response_model=List[schemas.AthleteBase])
def read_athletes(
    db: Session = Depends(get_db),
    skip: int = 0,
    limit: int = 10,
    country: Optional[str] = None,
    sport: Optional[str] = None,
    sort_by: Optional[str] = None
):
    try:
        query = db.query(models.AthleteProfile)
        if country:
            query = query.filter(models.AthleteProfile.country_noc == country)
        if sort_by:
            query = query.order_by(desc(sort_by))
        return query.offset(skip).limit(limit).all()
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error retrieving athletes data: {str(e)}"
        )

# Countries endpoints
@app.get("/countries/", response_model=List[schemas.CountryBase])
def read_countries(
    db: Session = Depends(get_db),
    skip: int = 0,
    limit: int = 10,
    search: Optional[str] = None
):
    try:
        query = db.query(models.CountryProfile)
        if search:
            query = query.filter(models.CountryProfile.country.ilike(f"%{search}%"))
        return query.offset(skip).limit(limit).all()
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error retrieving countries data: {str(e)}"
        )

# Events endpoints
@app.get("/events/", response_model=List[schemas.EventResultBase])
def read_events(
    db: Session = Depends(get_db),
    skip: int = 0,
    limit: int = 10,
    sport: Optional[str] = None,
    edition: Optional[str] = None
):
    try:
        query = db.query(models.EventResult)
        if sport:
            query = query.filter(models.EventResult.sport == sport)
        if edition:
            query = query.filter(models.EventResult.edition == edition)
        return query.offset(skip).limit(limit).all()
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error retrieving events data: {str(e)}"
        )

# Games endpoints
@app.get("/games/", response_model=List[schemas.GamesSummaryBase])
def read_games(
    db: Session = Depends(get_db),
    skip: int = 0,
    limit: int = 10,
    year: Optional[int] = None,
    sort: Optional[str] = Query(None, enum=['year', '-year'])
):
    try:
        query = db.query(models.GamesSummary)
        if year:
            query = query.filter(models.GamesSummary.year == year)
        if sort == 'year':
            query = query.order_by(models.GamesSummary.year)
        elif sort == '-year':
            query = query.order_by(desc(models.GamesSummary.year))
        
        results = query.offset(skip).limit(limit).all()
        
        # Convert None values to empty strings for required string fields
        for result in results:
            if result.start_date is None:
                result.start_date = ""
            if result.end_date is None:
                result.end_date = ""
            if result.isheld is None:  # Changed from isHeld to isheld
                result.isheld = ""
                
        return results
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error retrieving games data: {str(e)}"
        )

# Medal tallies endpoints
@app.get("/medals/", response_model=List[schemas.MedalTallyBase])
def read_medals(
    db: Session = Depends(get_db),
    skip: int = 0,
    limit: int = 10,
    country: Optional[str] = None,
    year: Optional[int] = None,
    sort_by: Optional[str] = Query(None, enum=['total', 'gold', 'silver', 'bronze'])
):
    try:
        query = db.query(models.MedalTally)
        if country:
            query = query.filter(models.MedalTally.country_noc == country)
        if year:
            query = query.filter(models.MedalTally.year == year)
        if sort_by:
            query = query.order_by(desc(getattr(models.MedalTally, sort_by)))
        return query.offset(skip).limit(limit).all()
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error retrieving medals data: {str(e)}"
        )

# 1. Medal Ranking Endpoint
@app.get("/medal-ranking")
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
@app.get("/medal-comparison")
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

# 3. Athlete Performance Endpoint
@app.get("/athlete-performance")
def get_athlete_performance(
    db: Session = Depends(get_db),
    sport: Optional[str] = Query(None, description="Filter by sport"),
    year: Optional[int] = Query(None, description="Filter by year")
):
    try:
        query = db.query(
            models.EventResult.sport,
            models.EventResult.event_title,
            models.EventResult.result_detail,
            models.EventResult.edition
        ).join(
            models.GamesSummary,
            models.EventResult.edition_id == models.GamesSummary.edition_id
        )

        if sport:
            query = query.filter(models.EventResult.sport == sport)
        if year:
            query = query.filter(models.GamesSummary.year == year)

        results = query.all()

        # Format data for charts (simplified for example)
        chart_data = {
            "labels": [r.event_title for r in results],
            "datasets": [{
                "label": "Results",
                "data": [r.result_detail for r in results]
            }]
        }

        # Get available sports for dropdown
        sports = db.query(models.EventResult.sport).distinct().order_by(models.EventResult.sport).all()

        return {
            "chart_data": chart_data,
            "chart_type": "scatter",
            "filters": {
                "sports": [sport[0] for sport in sports]
            }
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# 4. Athlete Experience Endpoint
@app.get("/athlete-experience")
def get_athlete_experience(
    db: Session = Depends(get_db),
    country: Optional[str] = Query(None, description="Filter by country")
):
    try:
        query = db.query(
            models.AthleteProfile.name,
            models.AthleteProfile.country,
            models.AthleteProfile.special_notes
        )

        if country:
            query = query.filter(models.AthleteProfile.country == country)

        results = query.all()

        # Format data for charts in the new structure
        chart_data = [
            {
                "xAxis": r.name,
                "appearances": len(r.special_notes.split(',')) if r.special_notes else 0
            } for r in results
        ]

        # Get available countries for dropdown
        countries = db.query(models.AthleteProfile.country).distinct().order_by(models.AthleteProfile.country).all()

        return {
            "data": chart_data,
            "chart_type": "bar",
            "filters": {
                "countries": [country[0] for country in countries]
            }
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

# 5. Olympic Hosts Endpoint
@app.get("/olympic-hosts")
def get_olympic_hosts(
    db: Session = Depends(get_db),
    start_year: Optional[int] = Query(None, description="Start year"),
    end_year: Optional[int] = Query(None, description="End year")
):
    try:
        query = db.query(
            models.GamesSummary.year,
            models.GamesSummary.city,
            models.GamesSummary.country_noc
        ).order_by(models.GamesSummary.year)

        if start_year:
            query = query.filter(models.GamesSummary.year >= start_year)
        if end_year:
            query = query.filter(models.GamesSummary.year <= end_year)

        results = query.all()

        # Count hosts by country for pie chart
        host_counts = defaultdict(int)
        for result in results:
            host_counts[result.country_noc] += 1

        chart_data = {
            "labels": list(host_counts.keys()),
            "datasets": [{
                "data": list(host_counts.values()),
                "backgroundColor": [
                    "#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0", "#9966FF",
                    "#FF9F40", "#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0"
                ]
            }]
        }

        # Get available years for dropdown
        years = db.query(models.GamesSummary.year).distinct().order_by(models.GamesSummary.year).all()

        return {
            "chart_data": chart_data,
            "chart_type": "pie",
            "filters": {
                "years": [year[0] for year in years]
            }
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


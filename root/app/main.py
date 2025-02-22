from fastapi import FastAPI, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from . import models, schemas
from .database import engine, get_db
from typing import List, Optional
from sqlalchemy import desc

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

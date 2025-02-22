from pydantic import BaseModel
from typing import Optional, List
from datetime import date

class AthleteBase(BaseModel):
    name: str
    sex: str
    born: Optional[date]
    height: Optional[str]
    weight: Optional[str]
    country: str
    country_noc: str
    description: Optional[str]
    special_notes: Optional[str]

class AthleteCreate(AthleteBase):
    athlete_id: str

class Athlete(AthleteBase):
    athlete_id: str

    class Config:
        orm_mode = True

class CountryBase(BaseModel):
    country: str
    noc: str

    class Config:
        orm_mode = True

class EventResultBase(BaseModel):
    event_title: str
    edition: str
    sport: str
    result_date: Optional[str]
    result_location: Optional[str]
    result_detail: Optional[str]

    class Config:
        orm_mode = True

class GamesSummaryBase(BaseModel):
    edition: str
    edition_id: int
    edition_url: Optional[str] = None
    year: int
    city: Optional[str] = None
    country_flag_url: Optional[str] = None
    country_noc: Optional[str] = None
    start_date: Optional[str] = None
    end_date: Optional[str] = None
    competition_date: Optional[str] = None
    isheld: Optional[str] = None  # Changed from isHeld to isheld

    class Config:
        from_attributes = True

class MedalTallyBase(BaseModel):
    edition: str
    year: int
    country: str
    country_noc: str
    gold: int
    silver: int
    bronze: int
    total: int

    class Config:
        orm_mode = True

class UserBase(BaseModel):
    username: str
    email: str
    full_name: Optional[str] = None
    is_active: bool = True

class UserCreate(UserBase):
    pass

class User(UserBase):
    id: int

    class Config:
        orm_mode = True

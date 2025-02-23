from pydantic import BaseModel
from typing import Optional, List
from datetime import date

class AthleteBase(BaseModel):
    athlete_id: str
    name: Optional[str]
    sex: Optional[str]
    born: Optional[date]
    height: Optional[str]
    weight: Optional[str]
    country: Optional[str]
    country_noc: Optional[str]
    description: Optional[str]
    special_notes: Optional[str]

    class Config:
        orm_mode = True

class AthleteCreate(AthleteBase):
    athlete_id: str

class Athlete(AthleteBase):
    athlete_id: str

    class Config:
        orm_mode = True

class CountryBase(BaseModel):
    noc: str
    country: Optional[str]

    class Config:
        orm_mode = True

class EventResultBase(BaseModel):
    result_id: int
    event_title: Optional[str]
    edition: Optional[str]
    edition_id: Optional[int]
    sport: Optional[str]
    sport_url: Optional[str]
    result_date: Optional[str]
    result_location: Optional[str]
    result_participants: Optional[str]
    result_format: Optional[str]
    result_detail: Optional[str]
    result_description: Optional[str]

    class Config:
        orm_mode = True

class GamesSummaryBase(BaseModel):
    edition: str
    edition_id: Optional[int]
    edition_url: Optional[str]
    year: Optional[int]
    city: Optional[str]
    country_flag_url: Optional[str]
    country_noc: Optional[str]
    start_date: Optional[str]
    end_date: Optional[str]
    competition_date: Optional[str]
    isheld: Optional[str]

    class Config:
        orm_mode = True

class MedalTallyBase(BaseModel):
    edition: str
    edition_id: int
    year: Optional[int]
    country: Optional[str]
    country_noc: str
    gold: Optional[int]
    silver: Optional[int]
    bronze: Optional[int]
    total: Optional[int]

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

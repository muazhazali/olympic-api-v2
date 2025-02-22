from sqlalchemy import Column, Integer, String, Boolean, Date, Text
from .database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(50), unique=True, index=True)
    email = Column(String(100), unique=True, index=True)
    full_name = Column(String(100))
    is_active = Column(Boolean, default=True)

class AthleteProfile(Base):
    __tablename__ = "olympic_athlete_biography"

    athlete_id = Column(String(20), primary_key=True)
    name = Column(String(255))
    sex = Column(String(10))
    born = Column(Date)
    height = Column(String(10))
    weight = Column(String(10))
    country = Column(String(255))
    country_noc = Column(String(3))
    description = Column(Text)
    special_notes = Column(Text)

class CountryProfile(Base):
    __tablename__ = "olympic_country_profiles"
    noc = Column(String(3), primary_key=True)
    country = Column(String(255))

class EventResult(Base):
    __tablename__ = "olympic_event_results"
    result_id = Column(Integer, primary_key=True)
    event_title = Column(Text)
    edition = Column(String(255))
    edition_id = Column(Integer)
    sport = Column(String(255))
    sport_url = Column(String(255))
    result_date = Column(String(255))
    result_location = Column(Text)
    result_participants = Column(Text)
    result_format = Column(Text)
    result_detail = Column(Text)
    result_description = Column(Text)

class GamesSummary(Base):
    __tablename__ = "olympic_games_summary"
    edition = Column(String(255), primary_key=True)
    edition_id = Column(Integer)
    edition_url = Column(String(255))
    year = Column(Integer)
    city = Column(String(255))
    country_flag_url = Column(String(255))
    country_noc = Column(String(3))
    start_date = Column(String(20))
    end_date = Column(String(20))
    competition_date = Column(String(50))
    isheld = Column(String(50))  # Keep only this one, remove isHeld

class MedalTally(Base):
    __tablename__ = "olympic_medal_tally_history"
    edition = Column(String(255), primary_key=True)
    edition_id = Column(Integer, primary_key=True)
    year = Column(Integer)
    country = Column(String(255))
    country_noc = Column(String(3), primary_key=True)
    gold = Column(Integer)
    silver = Column(Integer)
    bronze = Column(Integer)
    total = Column(Integer)

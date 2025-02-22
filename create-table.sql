-- Create Olympic_Athlete_Biography Table
CREATE TABLE Olympic_Athlete_Biography (
    athlete_id INT PRIMARY KEY,
    name VARCHAR(255),
    sex VARCHAR(10),
    born DATE,
    height INT,
    weight INT,
    country VARCHAR(255),
    country_noc VARCHAR(3),
    description TEXT,
    special_notes TEXT
);

-- Create Olympic_Athlete_Event_Details Table
CREATE TABLE Olympic_Athlete_Event_Details (
    edition VARCHAR(255),
    edition_id INT,
    country_noc VARCHAR(3),
    sport VARCHAR(255),
    event VARCHAR(255),
    result_id INT,
    athlete VARCHAR(255),
    athlete_id INT,
    pos VARCHAR(50),
    medal VARCHAR(10),
    isTeamSport BOOLEAN
);

-- Create Olympic_Country_Profiles Table
CREATE TABLE Olympic_Country_Profiles (
    noc VARCHAR(3) PRIMARY KEY,
    country VARCHAR(255)
);

-- Create Olympic_Event_Results Table
CREATE TABLE Olympic_Event_Results (
    result_id INT PRIMARY KEY,
    event_title TEXT,
    edition VARCHAR(255),
    edition_id INT,
    sport VARCHAR(255),
    sport_url VARCHAR(255),
    result_date VARCHAR(255),
    result_location TEXT,
    result_participants TEXT,
    result_format TEXT,
    result_detail TEXT,
    result_description TEXT
);

-- Create Olympic_Games_Summary Table
CREATE TABLE Olympic_Games_Summary (
    edition VARCHAR(255) PRIMARY KEY,
    edition_id INT,
    edition_url VARCHAR(255),
    year INT,
    city VARCHAR(255),
    country_flag_url VARCHAR(255),
    country_noc VARCHAR(3),
    start_date DATE,
    end_date DATE,
    competition_date VARCHAR(255),
    isHeld BOOLEAN
);

-- Create Olympic_Medal_Tally_History Table
CREATE TABLE Olympic_Medal_Tally_History (
    edition VARCHAR(255),
    edition_id INT,
    year INT,
    country VARCHAR(255),
    country_noc VARCHAR(3),
    gold INT,
    silver INT,
    bronze INT,
    total INT,
    PRIMARY KEY (edition, edition_id, country_noc)
);
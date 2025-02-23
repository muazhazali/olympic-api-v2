# Olympic Games API Documentation

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Database Setup](#database-setup)
- [API Endpoints](#api-endpoints)
- [Load Testing](#load-testing)
- [Database Schema](#database-schema)
- [Error Handling](#error-handling)

## Overview

The Olympic Games API is a comprehensive RESTful service that provides historical data about the Olympic Games. This API offers various endpoints to access medal statistics, athlete information, gender distribution data, and other Olympic-related metrics.

## Features

- Medal rankings by country and year
- Historical medal comparisons
- Gender distribution statistics
- Top athletes' performance data
- Olympic Games statistics and overview
- Real-time data processing
- Comprehensive error handling
- Load testing support

## Technology Stack

- **Backend Framework**: FastAPI (Python)
- **Database**: MySQL
- **ORM**: SQLAlchemy
- **Testing**: Locust for load testing
- **Documentation**: OpenAPI/Swagger UI
- **Python Version**: 3.8+

## Getting Started

### Prerequisites

- Python 3.8 or higher
- MySQL Server
- Git (for version control)
- pip (Python package manager)

### Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd olympic-api-v2
   ```

2. Create and activate a virtual environment:

   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\activate

   # Linux/MacOS
   python -m venv venv
   source venv/bin/activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Database Setup

1. Create a MySQL database
2. Execute the SQL scripts in the following order:
   ```bash
   mysql -u your_username -p your_database < create-table.sql
   mysql -u your_username -p your_database < insert.sql
   ```

## API Endpoints

### 1. Medal Ranking

**Endpoint**: `/api/medal-ranking`
**Method**: GET
**Parameters**:

- `year` (optional): Filter by specific Olympic year
- `top_n` (optional): Number of top countries to return (default: 10)

**Response Format**:

```json
{
    "data": [
        {
            "xAxis": "country_name",
            "gold": number,
            "silver": number,
            "bronze": number
        }
    ],
    "chart_type": "bar",
    "filters": {
        "years": [list_of_years]
    }
}
```

### 2. Medal Comparison

**Endpoint**: `/api/medal-comparison`
**Method**: GET
**Parameters**:

- `start_year` (optional): Start year for comparison
- `end_year` (optional): End year for comparison

**Response Format**:

```json
{
    "chart_data": [
        {
            "xAxis": "year",
            "country1": number,
            "country2": number,
            ...
        }
    ],
    "chart_type": "line",
    "countries": [list_of_countries],
    "filters": {
        "years": [available_years]
    },
    "colors": {
        "country": "color_code"
    }
}
```

### 3. Gender Distribution

**Endpoint**: `/api/gender-distribution`
**Method**: GET

**Response Format**:

```json
{
    "data": [
        {
            "gender": "male/female",
            "athletes": number,
            "percentage": number
        }
    ],
    "total_athletes": number
}
```

### 4. Top Athletes

**Endpoint**: `/api/top-athletes`
**Method**: GET

**Response Format**:

```json
{
    "data": [
        {
            "xAxis": "athlete_name",
            "gold": number,
            "silver": number,
            "bronze": number,
            "total": number,
            "country": "country_name"
        }
    ],
    "chart_type": "stacked-bar",
    "title": "Top 10 Olympic Athletes by Medal Count",
    "colors": {
        "gold": "#FFD700",
        "silver": "#C0C0C0",
        "bronze": "#CD7F32"
    }
}
```

### 5. Gender Trend

**Endpoint**: `/api/gender-trend`
**Method**: GET

**Response Format**:

```json
{
    "data": [
        {
            "xAxis": "year",
            "male": number,
            "female": number
        }
    ],
    "chart_type": "line",
    "title": "Gender Distribution Trend Over Years",
    "colors": {
        "male": "#2196F3",
        "female": "#FF4081"
    }
}
```

### 6. Overview Statistics

**Endpoints**:

- `/api/stats/total-athletes`: Get total number of athletes
- `/api/stats/total-olympics`: Get total number of Olympic Games
- `/api/stats/total-medals`: Get total medals awarded
- `/api/stats/total-sports`: Get total number of sports

## Load Testing

The API includes Locust-based load testing capabilities for performance evaluation.

### Running Load Tests

1. Start the FastAPI server:

   ```bash
   cd root
   uvicorn app.main:app --reload
   ```

2. In a new terminal, run Locust:

   ```bash
   python -m locust -f root/tests/locustfile.py
   ```

3. Access the Locust web interface:
   - Open `http://localhost:8089` in your browser
   - Set number of users and spawn rate
   - Set host URL (e.g., `http://localhost:8000`)
   - Start the test

### Test Scenarios

The load tests include:

- Regular user behavior simulation
- Intensive load testing
- Random parameter generation
- Multiple endpoint testing
- Response time monitoring

## Database Schema

### Tables

1. **olympic_athlete_biography**

   - athlete_id (PK)
   - name
   - sex
   - born
   - height
   - weight
   - country
   - country_noc
   - description
   - special_notes

2. **olympic_country_profiles**

   - noc (PK)
   - country

3. **olympic_athlete_event_details**

   - result_id (PK)
   - edition
   - edition_id
   - country_noc
   - sport
   - event
   - athlete
   - athlete_id
   - pos
   - medal
   - isTeamSport

4. **olympic_games_summary**

   - edition (PK)
   - edition_id
   - edition_url
   - year
   - city
   - country_flag_url
   - country_noc
   - start_date
   - end_date
   - competition_date
   - isheld

5. **olympic_medal_tally_history**
   - edition (PK)
   - edition_id (PK)
   - year
   - country
   - country_noc (PK)
   - gold
   - silver
   - bronze
   - total

## Error Handling

The API implements comprehensive error handling:

- 400 Bad Request: Invalid parameters
- 404 Not Found: Resource not found
- 500 Internal Server Error: Server-side issues

All errors return JSON responses with:

```json
{
  "detail": "Error message description"
}
```

---

For more information or support, please contact the development team.

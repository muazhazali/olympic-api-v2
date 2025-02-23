from locust import HttpUser, task, between
import random

class OlympicAPIUser(HttpUser):
    wait_time = between(1, 3)  # Wait between 1-3 seconds between tasks
    
    def on_start(self):
        """Initialize any data needed for the tests"""
        # Years range based on typical Olympic data
        self.years = list(range(1896, 2024, 4))
    
    @task(2)
    def test_medal_ranking(self):
        # Test without parameters (default)
        self.client.get("/api/medal-ranking")
        
        # Test with random year
        year = random.choice(self.years)
        self.client.get(f"/api/medal-ranking?year={year}")
        
        # Test with different top_n
        top_n = random.choice([5, 10, 15, 20])
        self.client.get(f"/api/medal-ranking?top_n={top_n}")
    
    @task(2)
    def test_medal_comparison(self):
        # Test without parameters
        self.client.get("/api/medal-comparison")
        
        # Test with date range
        start_year = random.choice(self.years[:-1])
        end_year = random.choice([y for y in self.years if y > start_year])
        self.client.get(f"/api/medal-comparison?start_year={start_year}&end_year={end_year}")
    
    @task(1)
    def test_gender_distribution(self):
        # Simple GET request as this endpoint doesn't take parameters
        self.client.get("/api/gender-distribution")
    
    @task(2)
    def test_top_athletes(self):
        # Simple GET request as this endpoint doesn't take parameters
        self.client.get("/api/top-athletes")
    
    @task(1)
    def test_gender_trend(self):
        # Simple GET request as this endpoint doesn't take parameters
        self.client.get("/api/gender-trend")
    
    @task(3)
    def test_overview_stats(self):
        # Test all overview endpoints
        self.client.get("/api/stats/total-athletes")
        self.client.get("/api/stats/total-olympics")
        self.client.get("/api/stats/total-medals")
        self.client.get("/api/stats/total-sports")

class OlympicAPILoadTest(OlympicAPIUser):
    """
    A separate user class for more intensive load testing
    with different wait times and task weights
    """
    wait_time = between(0.1, 1.0)  # Faster requests for load testing
    
    @task(5)  # Higher weight on medal ranking as it's likely most accessed
    def test_medal_ranking_load(self):
        self.client.get("/api/medal-ranking")
    
    @task(3)
    def test_medal_comparison_load(self):
        self.client.get("/api/medal-comparison")
    
    @task(2)
    def test_overview_endpoints_load(self):
        # Test all overview endpoints in sequence
        endpoints = [
            "/api/stats/total-athletes",
            "/api/stats/total-olympics",
            "/api/stats/total-medals",
            "/api/stats/total-sports"
        ]
        for endpoint in endpoints:
            self.client.get(endpoint) 
{% docs __overview__ %}
# Airbnb Data Models – Overview

Welcome to the Airbnb analytics project.

This project transforms raw source data into clean, analytics-ready datasets for business analysis and reporting.

## Data Flow
1. **Sources** – Raw Airbnb data from hosts, listings, and reviews.
2. **Staging (`stg_`)** – Light cleaning & standardization.
3. **Dimensions (`dim_`)** – Entity-level tables, one row per ID.
4. **Facts (`fct_`)** – Event-level transaction data.
5. **Marts (`mart_`)** – Final reporting tables for BI tools.

## Key Datasets
- **`dim_listings_w_hosts`** – Listings enriched with host & room type info.
- **`fct_reviews_cleansed`** – Cleaned review events with sentiment scoring.
- **`mart_listings_reviews`** – Listings joined to reviews with aggregated KPIs.

---
📌 *For technical details, click a model name in the left sidebar.*
{% enddocs %}
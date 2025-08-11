{% docs mart_listings_reviews %}

# mart_listings_reviews

Aggregated Airbnb listing-level review metrics, joining `dim_listings_w_hosts`
with `fct_reviews_cleansed`.

---

## Purpose
This **incremental model**:
- Pulls only records with an `UPDATED_AT` newer than the max in the existing table.
- Aggregates total reviews per listing.
- Calculates sentiment statistics via the `get_sentiment_stats` macro.
- Tracks the most recent review date.

**Grain:** One row per `LISTING_ID`.

---

## Columns
- **LISTING_ID** → Unique Airbnb listing identifier.
- **LISTING_NAME** → Name of the listing.
- **ROOM_TYPE** → Type of room (Entire home, Private room, etc.).
- **TOTAL_REVIEW** → Total number of reviews for the listing.
- **positive_review_pct** → % of reviews with positive sentiment.
- **neutral_review_pct** → % of reviews with neutral sentiment.
- **negative_review_pct** → % of reviews with negative sentiment.
- **LATEST_REVIEW_DATE** → Date of the latest review.
- **CREATED_AT** → Timestamp when the listing record was created.
- **UPDATED_AT** → Timestamp when the listing record was last updated.

{% enddocs %}
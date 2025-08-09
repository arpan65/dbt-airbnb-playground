{{ config(
    materialized='incremental',
    unique_key='LISTING_ID',
    on_schema_change='fail'
) }}

WITH LISTINGS_HOSTS_REVIEWS AS (
    SELECT
        d.LISTING_ID,
        d.LISTING_NAME,
        d.ROOM_TYPE,
        f.REVIEW_DATE,
        f.REVIEW_SENTIMENT
    FROM {{ ref('mart_listings_w_hosts') }} d
    JOIN {{ ref('fct_reviews_cleansed') }} f
        ON d.LISTING_ID = f.LISTING_ID
    {% if is_incremental() %}
        WHERE f.REVIEW_DATE > (SELECT MAX(REVIEW_DATE) FROM {{ this }})
    {% endif %}
)

SELECT
  LISTING_ID,
  LISTING_NAME,
  ROOM_TYPE,
  COUNT(*) AS TOTAL_REVIEW,
  {{ get_sentiment_stats('REVIEW_SENTIMENT') }},
  MAX(REVIEW_DATE) AS LATEST_REVIEW_DATE
FROM LISTINGS_HOSTS_REVIEWS
GROUP BY
  LISTING_ID,
  LISTING_NAME,
  ROOM_TYPE
ORDER BY TOTAL_REVIEW DESC

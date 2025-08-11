{% set max_updated_at = none %}

{% if is_incremental() and execute %}
  {% set relation_exists = adapter.get_relation(
      database=this.database,
      schema=this.schema,
      identifier=this.identifier
  ) %}
  {% if relation_exists %}
    {% set max_updated_at_query %}
      SELECT MAX("UPDATED_AT") FROM {{ this }}
    {% endset %}
    {% set max_updated_at_result = run_query(max_updated_at_query) %}
    {% if max_updated_at_result and max_updated_at_result.columns[0].values()[0] is not none %}
      {% set max_updated_at = max_updated_at_result.columns[0].values()[0] %}
    {% endif %}
  {% endif %}
{% endif %}

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
        f.REVIEW_SENTIMENT,
        d.CREATED_AT,
        d.UPDATED_AT
    FROM {{ ref('dim_listings_w_hosts') }} d
    JOIN {{ ref('fct_reviews_cleansed') }} f
        ON d.LISTING_ID = f.LISTING_ID

    {% if is_incremental() and max_updated_at is not none %}
        WHERE d.UPDATED_AT > '{{ max_updated_at }}'
    {% endif %}
)

SELECT
    LISTING_ID,
    LISTING_NAME,
    ROOM_TYPE,
    COUNT(*) AS TOTAL_REVIEW,
    {{ get_sentiment_stats('REVIEW_SENTIMENT') }},
    MAX(REVIEW_DATE) AS LATEST_REVIEW_DATE,
    CREATED_AT,
    UPDATED_AT
FROM LISTINGS_HOSTS_REVIEWS
GROUP BY
    LISTING_ID,
    LISTING_NAME,
    ROOM_TYPE,
    CREATED_AT,
    UPDATED_AT
ORDER BY TOTAL_REVIEW DESC
dim_listings-- macros/test_dim_listings_min_nights.sql

{% test dim_listings_min_nights(model) %}

SELECT *
FROM {{ model }}
WHERE minimum_nights < 1

{% endtest %}
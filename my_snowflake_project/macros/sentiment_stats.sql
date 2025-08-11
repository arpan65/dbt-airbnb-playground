{% macro get_sentiment_stats(column_name) %}

    SUM(CASE WHEN {{ column_name }} = 'positive' THEN 1 ELSE 0 END) AS POSITIVE_REVIEW,
    SUM(CASE WHEN {{ column_name }} = 'negative' THEN 1 ELSE 0 END) AS NEGATIVE_REVIEW,
    SUM(CASE WHEN {{ column_name }} = 'neutral' THEN 1 ELSE 0 END) AS NEUTRAL_REVIEW,
    ROUND((POSITIVE_REVIEW/TOTAL_REVIEW)*100,2) AS POSITIVE_REVIEW_RATE,
    ROUND((NEGATIVE_REVIEW/TOTAL_REVIEW)*100,2) AS NEGATIVE_REVIEW_RATE
{%endmacro%}    
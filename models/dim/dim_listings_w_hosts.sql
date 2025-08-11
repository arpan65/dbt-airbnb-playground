WITH listings AS (
    SELECT * FROM {{ref('dim_listings_cleansed')}}
),
hosts AS (
    SELECT * FROM {{ref('dim_hosts_cleansed')}}
),
room_type_mapping AS (
    SELECT * FROM {{ref('room_type_mapping')}}
)
SELECT 
listings.*,
hosts.host_name,
room_type_mapping.description
FROM listings
LEFT JOIN hosts ON listings.host_id = hosts.host_id LEFT JOIN room_type_mapping ON listings.room_type = room_type_mapping.room_type_name
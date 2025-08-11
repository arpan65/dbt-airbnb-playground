WITH dim_hosts_cleansed AS (
    SELECT
    host_id,
    NVL(host_name, 'Anonymous') AS host_name,created_at,updated_at
    FROM {{ref('src_hosts')}}
)
SELECT * FROM dim_hosts_cleansed
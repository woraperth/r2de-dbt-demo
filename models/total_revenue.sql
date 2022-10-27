SELECT SUM(total_price) AS total_rev FROM {{ ref('revenue') }}
WHERE Refunded IS FALSE
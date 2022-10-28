SELECT SUM(total_price) AS total_rev
FROM {{ ref('sales_table') }}
WHERE Refunded IS FALSE
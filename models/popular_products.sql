{% set groups = ["batteries", "laptop", "headphone"] %}

WITH products_with_group AS
(SELECT
    *,
    CASE
    {% for group in groups %}
    WHEN lower(Product) LIKE '%{{ group }}%' THEN '{{group}}'
    {% endfor %}
    ELSE 'other'
    END AS product_group
FROM {{ ref('sales_table') }})
SELECT product_group, SUM(Quantity_Ordered) AS sale_count
FROM products_with_group
GROUP BY 1
ORDER BY sale_count DESC
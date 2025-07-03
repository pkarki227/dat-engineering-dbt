SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    p.product_id,
    o.quantity,
    p.price,
    (p.price * o.quantity) AS total_order_value
FROM "postgres"."public"."dim_orders" o
LEFT JOIN "postgres"."public"."dim_customers" c
    ON o.customer_id = c.customer_id
LEFT JOIN "postgres"."public"."dim_products" p
    ON o.product_id = p.product_id
WHERE c.customer_id IS NOT NULL
  AND p.product_id IS NOT NULL
-- models/example/dim_orders.sql

SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    status
FROM "postgres"."public"."stg_orders"
WHERE status IN ('completed', 'shipped', 'delivered')
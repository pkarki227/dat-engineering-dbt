
  create view "postgres"."public"."dim_orders__dbt_tmp"
    
    
  as (
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
  );
-- models/dim_customers.sql

SELECT
    customer_id,
    customer_name,
    gender,
    age,
    email,
    phone_number,
    city,
    signup_date,
    is_active
FROM {{ source('staging', 'stg_customers') }}
WHERE is_active = TRUE

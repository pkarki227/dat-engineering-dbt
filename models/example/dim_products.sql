SELECT
        product_id,
        product_name,
        category,
        -- Ensure price is a valid positive float
        CASE 
            WHEN price IS NOT NULL AND price > 0 THEN price 
            ELSE 1.0 
        END AS price     
FROM {{ source('staging', 'stg_products') }}


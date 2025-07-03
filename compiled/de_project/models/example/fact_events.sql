with source as (
    select
        event_id,
        timestamp,
        event_type,
        customer_id,
        order_id,
        metadata
    from public.stg_event_logs
),

transformed as (
    select
        md5(cast(coalesce(cast(timestamp as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(event_type as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as event_surrogate_id,

        event_id,
        timestamp as event_time,
        event_type,
        customer_id,
        order_id,

        (metadata::json ->> 'cart_items')::int as cart_items,
        (metadata::json ->> 'cart_total')::numeric as cart_total,

        case
            when extract(hour from timestamp) between 7 and 9
              or extract(hour from timestamp) between 16 and 18 then true
            else false
        end as is_peak,

        current_timestamp as created_at
    from source
    where
        order_id is not null
        and (metadata::json ->> 'cart_items') is not null
        and (metadata::json ->> 'cart_total') is not null
)

select * from transformed

    
    

select
    event_surrogate_id as unique_field,
    count(*) as n_records

from "postgres"."public"."fact_events"
where event_surrogate_id is not null
group by event_surrogate_id
having count(*) > 1



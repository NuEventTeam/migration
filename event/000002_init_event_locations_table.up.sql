create table if not exists event_locations (
    id bigserial primary key,
    event_id bigint not null references events(id),
    address varchar(50) not null,
    longitude numeric(20,12) not null,
    latitude numeric(20,12) not null,
    seats integer,
    starts_at timestamp not null,
    ends_at timestamp not null,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    archived_at timestamp,
    deleted_at timestamp
);

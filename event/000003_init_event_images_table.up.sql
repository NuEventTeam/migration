create table if not exists event_images(
    id bigserial primary key,
    event_id bigint not null references events(id),
    url varchar(100) not null unique,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    archived_at timestamp not null default  now(),
    deleted_at timestamp
)

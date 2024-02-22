create table if not exists event_roles(
    id bigserial primary key,
    name varchar(20) not null,
    event_id bigint not null references events(id),
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
)

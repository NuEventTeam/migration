create table if not exists event_permissions(
    id bigserial primary key,
    name varchar(20) not null,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
)

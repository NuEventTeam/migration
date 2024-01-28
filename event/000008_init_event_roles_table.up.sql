create table if not exists event_roles(
    id bigserial primary key,
    permission_id bigint references event_permissions(id),
    name varchar(20) not null,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
)
create table  if not exists event_managers(
    id bigserial primary key,
    title varchar(30) not null,
    user_id bigint references users(id),
    role_id bigint references event_roles(id),
    event_id biginy reference events(id)
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
)

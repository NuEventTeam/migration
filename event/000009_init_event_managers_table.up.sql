create table  if not exists event_managers(
    id bigserial primary key,
    event_id bigint references  events(id),
    user_id bigint references users(user_id),
    role_id bigint references event_roles(id),
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
)

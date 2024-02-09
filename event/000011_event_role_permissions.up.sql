create table if not exists event_role_permissions(
      id bigserial primary key,
      permission_id bigint references event_permissions(id),
      role_id bigint references event_roles(id),
      created_at timestamp not null default now(),
      updated_at timestamp not null default now(),
      deleted_at timestamp
)

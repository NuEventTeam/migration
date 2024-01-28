create table if not exists event_categories(
    id bigserial primary key,
    event_id bigint not null references events(id),
    category_id bigint not null references categories(id),
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
)

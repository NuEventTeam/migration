create table if not exists chat_members(
    id bigserial primary key,
    user_id bigint not null default 0,
    event_id bigint not null default 0,
    role_id bigint not null default 0,
    create_at timestamp default  now()
)

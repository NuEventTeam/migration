create table if not exists chat_pinned_messages(
    id bigserial primary key,
    event_id bigint not null default 0,
    message_id bigint not null default 0,
    created_at timestamp not null default now()
);

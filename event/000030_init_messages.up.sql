create table if not exists chat_messages(
    id bigserial primary key not null,
    user_id bigint not null references users(id),
    event_id bigint not null references events(id),
    created_at timestamp not null default  now(),
    messages text
)

create table if not exists comments(
    id bigserial primary key,
    parent_id bigint,
    text text not null,
    event_id bigint not null references events(id),
    author_id bigint not null references users(id)
);

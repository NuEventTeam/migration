create table if not exists banned_event_followers(
  id bigserial primary key,
  event_id bigint not null references events(id),
  user_id bigint  unique not null  references users(id)  ,
  created_at timestamp not null default now()
)

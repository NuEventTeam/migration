create table if not exists banned_user_followers(
      id bigserial primary key,
      user_id bigint not null references users(user_id),
      banned_user_id bigint   unique not null references users(user_id)  ,
      created_at timestamp not null default now()
)

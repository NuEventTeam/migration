create table if not exists user_followers(
 id bigserial primary key,
 user_id bigint not null references users(id),
 follower_id bigint unique not null references  users(id) ,
 created_at timestamp not null default now()
);

CREATE INDEX user_id_index
    ON user_followers (user_id);

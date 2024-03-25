CREATE TABLE user_preferences (
    id SERIAL PRIMARY KEY,
    user_id bigint REFERENCES users(id),
    category_id bigint references categories(id),
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
);

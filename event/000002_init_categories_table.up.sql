CREATE TABLE categories (
    id bigserial PRIMARY KEY,
    name VARCHAR(20),
    created_at timestamp not null  default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
);

CREATE TABLE if not exists users (
    id SERIAL PRIMARY KEY,
    password TEXT NOT NULL,
    phone TEXT not null UNIQUE,
    created_at timestamp DEFAULT now(),
    updated_at timestamp DEFAULT now(),
    deleted_at timestamp
    );

CREATE INDEX user_phone_index ON users(phone);

CREATE TABLE users (
       id SERIAL PRIMARY KEY,
       password TEXT NOT NULL,
       phone TEXT not null UNIQUE,
       created_at datetime DEFAULT now(),
       updated_at datetime DEFAULT now(),
       deleted_at datetime
);


CREATE TABLE one_time_passwords (
    id SERIAL PRIMARY KEY,
    phone TEXT not null ,
    code TEXT not null ,
    type SMALLINT NOT NULL,
    expires_at datetime,
    created_at datetime DEFAULT CURRENT_TIMESTAMP
);

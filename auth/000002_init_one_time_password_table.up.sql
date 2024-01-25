
CREATE TABLE if not exists one_time_passwords (
      id SERIAL PRIMARY KEY,
      phone TEXT not null ,
      code TEXT not null ,
      type SMALLINT NOT NULL,
      expires_at timestamp,
      created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

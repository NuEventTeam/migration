
CREATE TABLE if not exists one_time_passwords (
      id SERIAL PRIMARY KEY,
      phone TEXT not null ,
      code TEXT not null ,
      type SMALLINT NOT NULL,
      expires_at timestamp not null ,
      created_at timestamp DEFAULT CURRENT_TIMESTAMP,
      deleted_at timestamp
);
CREATE INDEX otp_index ON one_time_passwords(code, phone);

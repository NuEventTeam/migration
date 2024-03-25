CREATE TABLE users (
       id bigserial PRIMARY KEY,
       phone VARCHAR(20),
       username varchar(15) unique,
       firstname varchar(15),
       lastname  varchar(15),
       birthdate date,
       profile_image varchar(50),
       password TEXT NOT NULL,
       follower_count bigint not null default 0,
       created_at TIMESTAMP DEFAULT now(),
       deleted_at TIMESTAMP
);

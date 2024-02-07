CREATE TABLE users (
       id bigserial PRIMARY KEY,
       user_id bigint UNIQUE NOT NULL,
       phone VARCHAR(20),
       username varchar(15) unique,
       firstname varchar(15) not null,
       lastname  varchar(15),
       birthdate date not null,
       profile_image varchar(50),
       created_at TIMESTAMP DEFAULT now(),
       deleted_at TIMESTAMP
);

CREATE TABLE categories (
    id bigserial PRIMARY KEY,
    name VARCHAR(20),
    created_at timestamp not null  default now(),
    updated_at timestamp not null default now(),
    deleted_at timestamp
);

INSERT INTO categories (name) VALUES
('Academic'),
('Art'),
('Basketball'),
('Business'),
('Chemistry'),
('Computer Science'),
('Cooking'),
('Culture'),
('Dance'),
('Design'),
('Education'),
('Finance'),
('Fitness'),
('Football'),
('Foreign Language'),
('Games'),
('Guest talk'),
('Gym'),
('Investments'),
('IT'),
('Literature'),
('Martial arts'),
('Math'),
('Motorsport'),
('Movie'),
('Philosophy'),
('Physics'),
('Politics'),
('Psychology'),
('Reading'),
('Robotics'),
('Running'),
('Swimming'),
('Theatre'),
('Volleyball'),
('Writing');
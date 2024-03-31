ALTER TABLE comments
    ADD created_at timestamp not null default  now();

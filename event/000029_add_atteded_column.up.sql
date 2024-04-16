ALTER TABLE event_followers
    ADD  attended bool not null default false;
ALTER TABLE event_followers
    ADD  updated_at timestamp not null default now() ;

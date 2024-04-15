ALTER TABLE event_followers
    ADD CONSTRAINT uq_event_id_user_id_comb UNIQUE(event_id, user_id);

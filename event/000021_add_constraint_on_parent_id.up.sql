ALTER TABLE comments
    ADD CONSTRAINT FK_ParentID
        FOREIGN KEY (parent_id) REFERENCES comments(id);

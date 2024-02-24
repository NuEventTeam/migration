create table if not exists events (
    id bigserial primary key,
    title varchar(30) not null,
    description varchar(400) null,
    age_min smallint,
    age_max smallint,
    attendees_count bigint not null default 0,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    archived_at timestamp,
    deleted_at timestamp
);

CREATE INDEX event_index ON events(id);

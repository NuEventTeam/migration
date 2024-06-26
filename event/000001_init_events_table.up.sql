create table if not exists events (
    id bigserial primary key,
    title varchar(30) not null,
    description varchar(400) null,
    age_min smallint,
    age_max smallint,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    status smallint not null default 1,
    archived_at timestamp,
    deleted_at timestamp
);

CREATE INDEX event_index ON events(id);

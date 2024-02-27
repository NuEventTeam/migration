create table if  not exists tokens(
    id bigserial primary key,
    token text not null,
    phone varchar(11) ,
    user_id bigint ,
    token_type smallint not null,
    created_at timestamp not null default now(),
    expires_at timestamp not null
);

create index tokens_index on tokens(token);

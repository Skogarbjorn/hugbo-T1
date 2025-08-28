CREATE TABLE IF NOT EXISTS users (
    id serial primary key,
    name varchar(128) not null,
    email varchar(128) not null unique,
    password varchar(256) not null,
    created timestamp with time zone not null default current_timestamp,
    updated timestamp with time zone not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS companies (
    id serial primary key,
    name varchar(256) not null,
    active boolean not null default true,
    created timestamp with time zone not null default current_timestamp,
    updated timestamp with time zone not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS locations (
    id serial primary key,
    company_id int references companies(id) not null,
    name varchar(128) not null,
    address varchar(256) not null,
    active boolean not null default true,
    created timestamp with time zone not null default current_timestamp,
    updated timestamp with time zone not null default current_timestamp
    unique(company_id, address)
);

CREATE TABLE IF NOT EXISTS user_company_contracts (
    id serial primary key,
    user_id int references users(id) not null,
    company_id int references companies(id) not null,
    contract_settings JSONB,
    role check (role in ('employee', 'manager')) not null,
    active boolean not null default true,
    created timestamp with time zone not null default current_timestamp,
    updated timestamp with time zone not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS tasks (
    id serial primary key,
    company_id int references companies(id) not null,
    name text not null,
    description text,
    active boolean default true,
    is_finished boolean default false,
    created timestamp with time zone not null default current_timestamp,
    updated timestamp with time zone not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS task_locations (
    task_id int references tasks(id) on delete cascade,
    location_id int references locations(id) on delete cascade,
    active boolean default true,
    is_finished boolean default false,
    created timestamp with time zone not null default current_timestamp,
    updated timestamp with time zone not null default current_timestamp,
    primary key (task_id, location_id)
);

CREATE TABLE IF NOT EXISTS shifts (
    id serial primary key,
    contract_id int references user_company_contracts(id) not null,
    location_id int references locations(id),
    task_id int references
)

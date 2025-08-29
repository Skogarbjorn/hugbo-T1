CREATE TABLE IF NOT EXISTS users (
    id serial primary key,
    name varchar(128) not null,
    email varchar(128) not null unique,
    password varchar(256) not null,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS companies (
    id serial primary key,
    name varchar(256) not null,
    active boolean not null default true,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS locations (
    id serial primary key,
    company_id int references companies(id) not null,
    name varchar(128) not null,
    address varchar(256) not null,
    active boolean not null default true,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
    unique(company_id, address)
);

CREATE TABLE IF NOT EXISTS user_company_contracts (
    id serial primary key,
    user_id int references users(id) not null,
    company_id int references companies(id) not null,
    contract_settings JSONB,
    role text check (role in ('employee', 'manager')) not null,
    active boolean not null default true,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS tasks (
    id serial primary key,
    company_id int references companies(id) not null on delete cascade,
    location_id int references locations(id) on delete cascade,
    name text not null,
    description text,
    active boolean default true,
    is_finished boolean default false,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS shifts (
    id serial primary key,
    contract_id int references user_company_contracts(id) not null,
    start_ts timestamptz not null,
    end_ts timestamptz,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS shift_tasks (
    id serial primary key,
    shift_id int references shifts(id) not null on delete cascade,
    task_id int references tasks(id),
    start_ts timestamptz not null,
    end_ts timestamptz,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS shift_locations (
    id serial primary key,
    shift_id int references shifts(id) not null on delete cascade,
    location_id int references locations(id) not null on delete cascade,
    start_ts timestamptz NOT NULL,
    end_ts timestamptz,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS shift_breaks (
    id serial primary key,
    shift_id int references shifts(id) not null on delete cascade,
    break_type text not null,
    start_ts timestamptz not null,
    end_ts timestamptz,
    duration interval GENERATED ALWAYS AS (end_ts - start_ts) STORED,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS shift_notes (
    id serial primary key,
    shift_id int references shifts(id) not null on delete cascade,
    note text not null,
    created_by int references users(id),
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS shift_flags (
    id serial primary key,
    shift_id int references shifts(id) not null on delete cascade,
    flag_type text not null,
    value text not null,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS shift_change_requests (
    id serial primary key,
    shift_id int references shifts(id) not null on delete cascade,
    user_id int references users(id) not null,
    reason text,
    requested_changes JSONB not null,
    status text not null default 'pending',
    reviewed_by int references users(id),
    reviewed_at timestamptz,
    created timestamptz not null default current_timestamp,
    updated timestamptz not null default current_timestamp
);

CREATE TABLE IF NOT EXISTS audit_log (
    id serial primary key,
    actor_id int references users(id),
    entity_type text not null,
    entity_id int not null,
    action text not null,
    before_json jsonb,
    after_json jsonb,
    at_ts timestamptz not null default current_timestamp
);


-- FUNCTIONS

CREATE OR REPLACE FUNCTION audit_trigger()
RETURNS trigger AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_log(actor_id, entity_type, entity_id, action, before_json, after_json)
    VALUES (
        COALESCE(NULLIF(current_setting('app.user_id', true), ''), NULL)::INT,
        TG_TABLE_NAME,
        OLD.id,
        TG_OP,
        row_to_json(OLD)::jsonb,
        NULL
    );
    RETURN OLD;

  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_log(actor_id, entity_type, entity_id, action, before_json, after_json)
    VALUES (
        COALESCE(NULLIF(current_setting('app.user_id', true), ''), NULL)::INT,
        TG_TABLE_NAME,
        NEW.id,
        TG_OP,
        row_to_json(OLD)::jsonb,
        row_to_json(NEW)::jsonb
    );
    RETURN NEW;

  ELSIF TG_OP = 'INSERT' THEN
    INSERT INTO audit_log(actor_id, entity_type, entity_id, action, before_json, after_json)
    VALUES (
        COALESCE(NULLIF(current_setting('app.user_id', true), ''), NULL)::INT,
        TG_TABLE_NAME,
        NEW.id,
        TG_OP,
        NULL,
        row_to_json(NEW)::jsonb
        );
    RETURN NEW;
  END IF;
END;
$$ LANGUAGE plpgsql;

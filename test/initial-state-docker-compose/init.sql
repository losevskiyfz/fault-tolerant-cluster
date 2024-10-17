-- init.sql
CREATE EXTENSION IF NOT EXISTS pg_cron;

CREATE SCHEMA IF NOT EXISTS dblink;
CREATE EXTENSION IF NOT EXISTS dblink SCHEMA dblink;

CREATE SCHEMA IF NOT EXISTS jobmon;
CREATE EXTENSION IF NOT EXISTS pg_jobmon SCHEMA jobmon;

CREATE SCHEMA IF NOT EXISTS partman;
CREATE EXTENSION IF NOT EXISTS pg_partman SCHEMA partman;

CREATE TABLE measurement (
    id uuid NOT NULL,
    meas_ts timestamptz NOT NULL,
    "version" int4 NOT NULL,
    created_by varchar(255) NULL,
    created_date timestamp NULL,
    last_modified_by varchar(255) NULL,
    last_modified_date timestamp NULL,
    tenant varchar(255) NULL,
    param_id uuid NOT NULL,
    object_type_id uuid NOT NULL,
    object_id uuid NOT NULL,
    system_id int8 NOT NULL,
    meas_val numeric(38, 18) NOT null
) PARTITION BY RANGE (meas_ts);

CREATE INDEX idx_measurement_object ON measurement USING btree (object_id);
CREATE INDEX idx_measurement_object_type ON measurement USING btree (object_type_id);
CREATE INDEX idx_measurement_param ON measurement USING btree (param_id);
CREATE INDEX idx_measurement_system ON measurement USING btree (system_id);
CREATE INDEX measurement_meas_ts_idx ON measurement USING BRIN (meas_ts);
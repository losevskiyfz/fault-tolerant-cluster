-- init.sql
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
);
CREATE INDEX idx_measurement_object ON measurement USING btree (object_id);
CREATE INDEX idx_measurement_object_type ON measurement USING btree (object_type_id);
CREATE INDEX idx_measurement_param ON measurement USING btree (param_id);
CREATE INDEX idx_measurement_system ON measurement USING btree (system_id);
CREATE INDEX measurement_meas_ts_idx ON measurement USING BRIN (meas_ts);
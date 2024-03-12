do
$dwh_staging$
    begin
        CREATE TABLE staging.lnk_department_locations
        (
            lnk_department_locations_seq numeric(12) primary key,
            hub_department_seq           char(32),
            hub_location_seq             char(32),
            lnk_load_dts                 date,
            hub_rec_src                  varchar(12),

            CONSTRAINT fk_lnk_department_locations_hub_department FOREIGN KEY (hub_department_seq)
                REFERENCES staging.hub_department (hub_department_key)
                ON DELETE SET NULL,

            CONSTRAINT fk_lnk_department_locations_hub_location FOREIGN KEY (hub_location_seq)
                REFERENCES staging.hub_location (hub_location_key)
                ON DELETE SET NULL
        );
    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        CREATE TABLE presentation.lnk_department_locations
        (
            lnk_department_locations_seq numeric(12) primary key,
            hub_department_seq           char(32),
            hub_location_seq             char(32),
            lnk_load_dts                 date,
            hub_rec_src                  varchar(12),

            CONSTRAINT fk_lnk_department_locations_hub_department FOREIGN KEY (hub_department_seq)
                REFERENCES presentation.hub_department (hub_department_key)
                ON DELETE SET NULL,

            CONSTRAINT fk_lnk_department_locations_hub_location FOREIGN KEY (hub_location_seq)
                REFERENCES presentation.hub_location (hub_location_key)
                ON DELETE SET NULL
        );

    end;
$dwh_presentation$;



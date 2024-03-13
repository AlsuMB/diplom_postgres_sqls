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

do
$generation$
    begin
        INSERT INTO presentation.lnk_department_locations
        SELECT random() * 899999999999 + 100000000000,
               md5(random()::text)::char(32),
               md5(random()::text)::char(32),
               NOW() + (random() * (NOW() + '-900 days' - NOW())) + '-30 days',
               md5(random()::text)::varchar(12)
        FROM generate_series(1, 100);
    end;
$generation$;

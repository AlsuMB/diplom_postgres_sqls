do
$dwh_staging$
    begin
        --         drop table staging.sat_locations;
--         drop table presentation.sat_locations;

        create table staging.sat_locations
        (
            hub_location_key char(32)
                constraint fk_sat_locations_hub_location
                    references staging.hub_location
                    on delete set null,
            sat_load_dts     date,
            hash_diff        char(32),
            sat_rec_src      varchar(12),

            street_address        varchar(40),
            city varchar(30),
            state_province varchar(25),
            postal_code varchar(12),
            primary key (hub_location_key, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_locations
        (
            hub_location_key char(32)
                constraint fk_sat_locations_hub_location
                    references presentation.hub_location
                    on delete set null,
            sat_load_dts     date,
            hash_diff        char(32),
            sat_rec_src      varchar(12),

            street_address        varchar(40),
            city varchar(30),
            state_province varchar(25),
            postal_code varchar(12),
            primary key (hub_location_key, sat_load_dts)
        );
    end;
$dwh_presentation$;



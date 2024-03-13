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

            street_address   varchar(40),
            city             varchar(30),
            state_province   varchar(25),
            postal_code      varchar(12),
            primary key (hub_location_key, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_locations
        (
            hub_location_key int
                constraint fk_sat_locations_hub_location
                    references presentation.hub_location
                    on delete set null,
            sat_load_dts     date,
            hash_diff        char(32),
            sat_rec_src      varchar(12),
            street_address   varchar(40),
            city             varchar(30),
            state_province   varchar(25),
            postal_code      varchar(12),
            primary key (hub_location_key, sat_load_dts)
        );
    end;
$dwh_presentation$;


do
$generation$
    begin
        INSERT INTO presentation.sat_locations
        SELECT (random() * 99 + 1)::int,
               NOW() + (random() * (NOW() + '-90 days' - NOW())) + '-30 days',
               md5(random()::text)::char(32),
               md5(random()::text)::varchar(12),
               md5(random()::text)::varchar(40),
               md5(random()::text)::varchar(30),
               md5(random()::text)::varchar(25),
               md5(random()::text)::varchar(12)
        FROM generate_series(1, 5);
    end;
$generation$;


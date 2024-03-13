do
$dwh_staging$
    begin
--         drop table staging.hub_location CASCADE ;
--         drop table presentation.hub_location CASCADE ;

        CREATE TABLE staging.hub_location
        (
            hub_location_key serial primary key,
            location_name    varchar(50),
            hub_load_dts     date,
            hub_rec_src      varchar(12)
        );

    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        CREATE TABLE presentation.hub_location
        (
            hub_location_key serial primary key,
            location_name    varchar(50),
            hub_load_dts     date,
            hub_rec_src      varchar(12)
        );

    end;
$dwh_presentation$;

do
$generation$
    begin
        INSERT INTO presentation.hub_location(location_name, hub_load_dts, hub_rec_src)
        SELECT
               md5(random()::text)::varchar(50),
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               md5(random()::text)::varchar(12)
        FROM generate_series(1, 100);
    end;
$generation$;

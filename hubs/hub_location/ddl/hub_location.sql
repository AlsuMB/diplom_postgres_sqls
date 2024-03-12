do
$dwh_staging$
    begin
        drop table staging.hub_location;
        drop table presentation.hub_location;

        CREATE TABLE staging.hub_location
        (
            hub_location_key char(32) primary key,
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
            hub_location_key char(32) primary key,
            location_name    varchar(50),
            hub_load_dts     date,
            hub_rec_src      varchar(12)
        );

    end;
$dwh_presentation$;



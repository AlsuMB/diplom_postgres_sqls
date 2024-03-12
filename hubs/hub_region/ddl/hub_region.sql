do
$dwh_staging$
    begin
        CREATE TABLE staging.hub_region
        (
            hub_region_key char(32) primary key,
            region_name    varchar(25),
            hub_load_dts     date,
            hub_rec_src      varchar(12)
        );

    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        CREATE TABLE presentation.hub_region
        (
            hub_region_key char(32) primary key,
            region_name    varchar(25),
            hub_load_dts     date,
            hub_rec_src      varchar(12)
        );

    end;
$dwh_presentation$;



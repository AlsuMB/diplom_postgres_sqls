do
$dwh_staging$
    begin
--         drop table staging.sat_regions;
--         drop table presentation.sat_regions;

        create table staging.sat_regions
        (
            hub_region_key char(32)
                constraint fk_sat_locations_hub_location
                    references staging.hub_location
                    on delete set null,
            sat_load_dts     date,
            region_id int,
            hash_diff char(32),
            sat_rec_src      varchar(12),
            primary key (hub_region_key, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_regions
        (
            hub_region_key char(32)
                constraint fk_sat_locations_hub_location
                    references presentation.hub_location
                    on delete set null,
            sat_load_dts     date,
            region_id int,
            hash_diff char(32),
            sat_rec_src      varchar(12),
            primary key (hub_region_key, sat_load_dts)
        );
    end;
$dwh_presentation$;



do
$dwh_staging$
    begin
--         drop table staging.lnk_region_country;
--         drop table presentation.lnk_region_country;

        create table staging.lnk_region_country
        (
            lnk_region_country_key  numeric(12) primary key,
            hub_region_key   char(32)
                constraint fk_lnk_location_country_hub_location_key
                    references staging.hub_location
                    on delete set null,
            hub_country_key char(32)
                constraint fk_lnk_location_country_hub_country_key
                    references staging.hub_country
                    on delete set null,
            country_abbrv char(2),
            region_name varchar(25),
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.lnk_region_country
        (
            lnk_region_country_key  numeric(12) primary key,
            hub_region_key   char(32)
                constraint fk_lnk_location_country_hub_location_key
                    references presentation.hub_location
                    on delete set null,
            hub_country_key char(32)
                constraint fk_lnk_location_country_hub_country_key
                    references presentation.hub_country
                    on delete set null,
            country_abbrv char(2),
            region_name varchar(25),
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;



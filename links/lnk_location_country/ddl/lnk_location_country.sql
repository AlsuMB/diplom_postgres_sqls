do
$dwh_staging$
    begin
--         drop table staging.lnk_location_country;
--         drop table presentation.lnk_location_country;

        create table staging.lnk_location_country
        (
            lnk_location_key  numeric(12) primary key,
            hub_location_key   char(32)
                constraint fk_lnk_location_country_hub_location_key
                    references staging.hub_location
                    on delete set null,
            hub_country_key char(32)
                constraint fk_lnk_location_country_hub_country_key
                    references staging.hub_country
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.lnk_location_country
        (
            lnk_location_key  numeric(12) primary key,
            hub_location_key   char(32)
                constraint fk_lnk_location_country_hub_location_key
                    references presentation.hub_location
                    on delete set null,
            hub_country_key char(32)
                constraint fk_lnk_location_country_hub_country_key
                    references presentation.hub_country
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;



do
$dwh_staging$
    begin
--         drop table staging.sat_countries;
--         drop table presentation.sat_countries;

        create table staging.sat_countries
        (
            hub_country_key char(32)
            constraint fk_sat_countries_hub_country_key
                    references staging.hub_country
                    on delete set null,
            sat_load_dts date,
            hash_diff char(32),
            sat_rec_src varchar(12),
            country_name varchar(40),
            primary key (hub_country_key, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_countries
        (
            hub_country_key char(32)
            constraint fk_sat_countries_hub_country_key
                    references presentation.hub_country
                    on delete set null,
            sat_load_dts date,
            hash_diff char(32),
            sat_rec_src varchar(12),
            country_name varchar(40),
            primary key (hub_country_key, sat_load_dts)
        );
    end;
$dwh_presentation$;



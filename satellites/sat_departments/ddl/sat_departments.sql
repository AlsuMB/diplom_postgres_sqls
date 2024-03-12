do
$dwh_staging$
    begin
--         drop table staging.sat_departments;
--         drop table presentation.sat_departments;

        create table staging.sat_departments
        (
            hub_departments_seq char(32)
            constraint fk_sat_countries_hub_country_key
                    references staging.hub_country
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            department_name char(32),
            sat_rec_src varchar(12),
            primary key (hub_departments_seq, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_departments
        (
            hub_departments_seq char(32)
            constraint fk_sat_countries_hub_country_key
                    references presentation.hub_country
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            department_name char(32),
            sat_rec_src varchar(12),
            primary key (hub_departments_seq, sat_load_dts)
        );
    end;
$dwh_presentation$;



do
$dwh_staging$
    begin
--         drop table staging.sat_departments;
--         drop table presentation.sat_departments;

        create table staging.sat_departments
        (
            hub_departments_seq int
            constraint fk_sat_countries_hub_department
                    references staging.hub_department
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
            hub_departments_seq int
            constraint fk_sat_countries_hub_department
                    references presentation.hub_department
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            department_name char(32),
            sat_rec_src varchar(12),
            primary key (hub_departments_seq, sat_load_dts)
        );
    end;
$dwh_presentation$;

do
$generation$
    begin
        INSERT INTO presentation.sat_departments
        SELECT (random() * 99 + 3)::int,
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               md5(random()::text)::char(32),
               md5(random()::text)::varchar(12)
--                NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
--                md5(random()::text)::varchar(12)
        FROM generate_series(1, 5);
    end;
$generation$;


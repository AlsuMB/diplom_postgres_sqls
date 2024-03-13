do
$dwh_staging$
    begin
--         drop table staging.sat_employees;
--         drop table presentation.sat_employees;

        create table staging.sat_employees
        (
            lnk_employees_seq numeric(12)
            constraint fk_sat_employees_lnk_employees_seq
                    references staging.lnk_employee_current_info
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            first_name varchar(20),
            last_name varchar(25),
            email varchar(25),
            phone_number varchar(20),
            hire_date date,
            salary numeric(8, 2),
            commission_pct numeric(2, 2),
            sat_rec_src varchar(12),
            primary key (lnk_employees_seq, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_employees
        (
            lnk_employees_seq int
            constraint fk_sat_employees_lnk_employees_seq
                    references presentation.lnk_employee_current_info
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            first_name varchar(20),
            last_name varchar(25),
            email varchar(25),
            phone_number varchar(20),
            hire_date date,
            salary numeric(8, 2),
            commission_pct numeric(2, 2),
            sat_rec_src varchar(12),
            primary key (lnk_employees_seq, sat_load_dts)
        );
    end;
$dwh_presentation$;

do
$generation$
    begin
        INSERT INTO presentation.sat_employees
        SELECT (random() * 99 + 3)::int,
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               md5(random()::text)::varchar(20),
               md5(random()::text)::varchar(25),
               md5(random()::text)::varchar(25),
               md5(random()::text)::varchar(20),
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               (random() * 100000 + 11),
               (random()),
--                md5(random()::text)::char(32),
               md5(random()::text)::varchar(12)
--                NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
--                md5(random()::text)::varchar(12)
        FROM generate_series(1, 5);
    end;
$generation$;

do
$dwh_staging$
    begin
--         drop table staging.rhlnk_employees;
--         drop table presentation.rhlnk_employees;

        create table staging.rhlnk_employees
        (
            rhlnk_employees_key  numeric(12) primary key,
            hub_employee_manager_seq   numeric(12)
                constraint fk_rhlnk_employees_hub_employee_manager_seq
                    references staging.hub_employee
                    on delete set null,
            hub_employee_seq numeric(12)
                constraint fk_rhlnk_employees_hub_employee_seq
                    references staging.hub_employee
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.rhlnk_employees
        (
            rhlnk_employees_key  serial primary key,
            hub_employee_manager_seq   int
                constraint fk_rhlnk_employees_hub_employee_manager_seq
                    references presentation.hub_employee
                    on delete set null,
            hub_employee_seq int
                constraint fk_rhlnk_employees_hub_employee_seq
                    references presentation.hub_employee
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;

do
$generation$
    begin
        INSERT INTO presentation.rhlnk_employees(hub_employee_manager_seq, hub_employee_seq, lnk_load_dts, hub_rec_src)
        SELECT
            (random() * 99 + 1)::int,
            (random() * 99 + 1)::int,
--             (random() * 99 + 1)::int,
               NOW() + (random() * (NOW() + '-90 days' - NOW())) + '30 days',
--                NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               md5(random()::text)::varchar(12)
--                md5(random()::text)::varchar(12)
--                NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
--                md5(random()::text)::varchar(12)
        FROM generate_series(1, 20);
    end;
$generation$;


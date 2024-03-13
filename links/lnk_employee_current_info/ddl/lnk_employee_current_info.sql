do
$dwh_staging$
    begin
        create table staging.lnk_employee_current_info
        (
            lnk_employees_seq  serial primary key,
            hub_employee_seq   int
                constraint fk_lnk_employee_current_info_hub_employee_seq
                    references staging.hub_employee
                    on delete set null,
            hub_department_seq int
                constraint fk_lnk_employee_current_info_hub_department_seq
                    references staging.hub_department
                    on delete set null,
            hub_job_seq        numeric(12)
                constraint fk_lnk_employee_current_info_hub_job_seq
                    references staging.hub_job
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.lnk_employee_current_info
        (
            lnk_employees_seq  serial primary key,
            hub_employee_seq   int
                constraint fk_lnk_employee_current_info_hub_employee_seq
                    references presentation.hub_employee
                    on delete set null,
            hub_department_seq int
                constraint fk_lnk_employee_current_info_hub_department_seq
                    references presentation.hub_department
                    on delete set null,
            hub_job_seq        int
                constraint fk_lnk_employee_current_info_hub_job_seq
                    references presentation.hub_job
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;

do
$generation$
    begin
        INSERT INTO presentation.lnk_employee_current_info(hub_employee_seq, hub_department_seq, hub_job_seq, lnk_load_dts, hub_rec_src)
        SELECT
            (random() * 99 + 1)::int,
            (random() * 99 + 3)::int,
            (random() * 99 + 1)::int,
               NOW() + (random() * (NOW() + '-90 days' - NOW())) + '-30 days',
--                NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               md5(random()::text)::varchar(12)
--                md5(random()::text)::varchar(12)
--                NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
--                md5(random()::text)::varchar(12)
        FROM generate_series(1, 20);
    end;
$generation$;

do
$dwh_staging$
    begin
        create table staging.lnk_employee_current_info
        (
            lnk_employees_seq  numeric(12) primary key,
            hub_employee_seq   numeric(12)
                constraint fk_lnk_employee_current_info_hub_employee_seq
                    references staging.hub_employee
                    on delete set null,
            hub_department_seq char(32)
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
            lnk_employees_seq  numeric(12) primary key,
            hub_employee_seq   numeric(12)
                constraint fk_lnk_employee_current_info_hub_employee_seq
                    references presentation.hub_employee
                    on delete set null,
            hub_department_seq char(32)
                constraint fk_lnk_employee_current_info_hub_department_seq
                    references presentation.hub_department
                    on delete set null,
            hub_job_seq        numeric(12)
                constraint fk_lnk_employee_current_info_hub_job_seq
                    references presentation.hub_job
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;



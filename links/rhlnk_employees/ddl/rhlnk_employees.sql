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
            rhlnk_employees_key  numeric(12) primary key,
            hub_employee_manager_seq   numeric(12)
                constraint fk_rhlnk_employees_hub_employee_manager_seq
                    references presentation.hub_employee
                    on delete set null,
            hub_employee_seq numeric(12)
                constraint fk_rhlnk_employees_hub_employee_seq
                    references presentation.hub_employee
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;



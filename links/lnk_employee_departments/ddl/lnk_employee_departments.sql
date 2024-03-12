do
$dwh_staging$
    begin
        drop table staging.lnk_employee_departments;
        drop table presentation.lnk_employee_departments;

        create table staging.lnk_employee_departments
        (
            lnk_departments_seq  numeric(12) primary key,
            hub_employee_seq   numeric(12)
                constraint fk_lnk_employee_departments_hub_employee_seq
                    references staging.hub_employee
                    on delete set null,
            hub_department_seq char(32)
                constraint fk_lnk_employee_departments_hub_department_seq
                    references staging.hub_department
                    on delete set null,
            hub_location_seq        char(32)
                constraint fk_lnk_employee_departments_hub_location_seq
                    references staging.hub_location
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.lnk_employee_departments
        (
            lnk_departments_seq  numeric(12) primary key,
            hub_employee_seq   numeric(12)
                constraint fk_lnk_employee_departments_hub_employee_seq
                    references presentation.hub_employee
                    on delete set null,
            hub_department_seq char(32)
                constraint fk_lnk_employee_departments_hub_department_seq
                    references presentation.hub_department
                    on delete set null,
            hub_location_seq        char(32)
                constraint fk_lnk_employee_departments_hub_location_seq
                    references presentation.hub_location
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;



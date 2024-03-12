do
$dwh_staging$
    begin
--         drop table staging.lnk_job_history;
--         drop table presentation.lnk_job_history;

        create table staging.lnk_job_history
        (
            lnk_job_history_seq  numeric(12) primary key,
            hub_employee_seq   numeric(12)
                constraint fk_lnk_job_history_hub_employee_seq
                    references staging.hub_employee
                    on delete set null,
            hub_department_seq char(32)
                constraint fk_lnk_job_history_hub_department_seq
                    references staging.hub_department
                    on delete set null,
            hub_job_seq        numeric(12)
                constraint fk_lnk_job_history_hub_job_seq
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
        create table presentation.lnk_job_history
        (
            lnk_job_history_seq  numeric(12) primary key,
            hub_employee_seq   numeric(12)
                constraint fk_lnk_job_history_hub_employee_seq
                    references presentation.hub_employee
                    on delete set null,
            hub_department_seq char(32)
                constraint fk_lnk_job_history_hub_department_seq
                    references presentation.hub_department
                    on delete set null,
            hub_job_seq        numeric(12)
                constraint fk_lnk_job_history_hub_job_seq
                    references presentation.hub_job
                    on delete set null,
            lnk_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_presentation$;



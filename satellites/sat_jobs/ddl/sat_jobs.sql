do
$dwh_staging$
    begin
--         drop table staging.sat_jobs;
--         drop table presentation.sat_jobs;

        create table staging.sat_jobs
        (
            hub_sat_jobs_seq numeric(12)
            constraint fk_sat_jobs_hub_job
                    references staging.hub_job
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            job_title varchar(35),
            min_salary numeric(6),
            max_salary numeric(6),
            sat_rec_src varchar(12),
            primary key (hub_sat_jobs_seq, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_jobs
        (
            hub_sat_jobs_seq numeric(12)
            constraint fk_sat_jobs_hub_job
                    references presentation.hub_job
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            job_title varchar(35),
            min_salary numeric(6),
            max_salary numeric(6),
            sat_rec_src varchar(12),
            primary key (hub_sat_jobs_seq, sat_load_dts)
        );
    end;
$dwh_presentation$;



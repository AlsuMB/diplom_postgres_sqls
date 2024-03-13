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
            hub_sat_jobs_seq int
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

do
$generation$
    begin
        INSERT INTO presentation.sat_jobs
        SELECT (random() * 99 + 1)::int,
               NOW() + (random() * (NOW() + '-90 days' - NOW())) + '-30 days',
               NOW() + (random() * (NOW() + '-90 days' - NOW())) + '-30 days',
               md5(random()::text)::varchar(35),
               (random() * 100000 + 1),
               (random() * 100000 + 1),
--                md5(random()::text)::char(32),
               md5(random()::text)::varchar(12)
--                NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
--                md5(random()::text)::varchar(12)
        FROM generate_series(1, 5);
    end;
$generation$;

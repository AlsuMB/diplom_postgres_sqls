do
$dwh_staging$
    begin
--         DROP TABLE staging.hub_job CASCADE ;
--         DROP TABLE presentation.hub_job CASCADE ;
        CREATE TABLE staging.hub_job
        (
            hub_job_seq  serial primary key,
            job_id       numeric(6),
            hub_load_dts date,
            hub_rec_src  varchar(12)
        );

    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        CREATE TABLE presentation.hub_job
        (
            hub_job_seq  serial primary key,
            job_id       numeric(6),
            hub_load_dts date,
            hub_rec_src  varchar(12)
        );

    end;
$dwh_presentation$;

do
$generation$
    begin
        INSERT INTO presentation.hub_job(job_id, hub_load_dts, hub_rec_src)
        SELECT
               random() * 899999 + 100000,
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               md5(random()::text)::varchar(12)
        FROM generate_series(1, 100);
    end;
$generation$;

do
$dwh_staging$
    begin
        CREATE TABLE staging.hub_job
        (
            hub_job_seq  numeric(12) primary key,
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
            hub_job_seq  numeric(12) primary key,
            job_id       numeric(6),
            hub_load_dts date,
            hub_rec_src  varchar(12)
        );

    end;
$dwh_presentation$;



do
$dwh_staging$
    begin
        CREATE TABLE staging.hub_start_date
        (
            hub_start_date_seq numeric(12) primary key,
            start_date         date,
            hub_load_dts       date,
            hub_rec_src        varchar(12)
        );
    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        CREATE TABLE presentation.hub_start_date
        (
            hub_start_date_seq numeric(12) primary key,
            start_date         date,
            hub_load_dts       date,
            hub_rec_src        varchar(12)
        );

    end;
$dwh_presentation$;



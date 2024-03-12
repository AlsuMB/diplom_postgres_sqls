do
$dwh_staging$
    begin
        CREATE TABLE staging.hub_department
        (
            hub_department_key char(32) primary key,
            department_id      numeric(4),
            hub_load_dts       date,
            hub_rec_src        varchar(12)
        );

    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        CREATE TABLE presentation.hub_department
        (
            hub_department_key char(32) primary key,
            department_id      numeric(4),
            hub_load_dts       date,
            hub_rec_src        varchar(12)
        );

    end;
$dwh_presentation$;



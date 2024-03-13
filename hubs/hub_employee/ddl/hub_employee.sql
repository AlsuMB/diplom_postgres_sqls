do
$dwh_staging$
    begin
--         DROP TABLE staging.hub_employee CASCADE ;
--         DROP TABLE presentation.hub_employee CASCADE ;
        CREATE TABLE staging.hub_employee
        (
            hub_employee_seq serial primary key,
            employee_id      numeric(6),
            hub_load_dts       date,
            hub_rec_src        varchar(12)
        );

    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        CREATE TABLE presentation.hub_employee
        (
            hub_employee_seq serial primary key,
            employee_id      numeric(6),
            hub_load_dts       date,
            hub_rec_src        varchar(12)
        );

    end;
$dwh_presentation$;

do
$generation$
    begin
        INSERT INTO presentation.hub_employee(employee_id, hub_load_dts, hub_rec_src)
        SELECT
               random() * 899999 + 100000,
               NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days',
               md5(random()::text)::varchar(12)
        FROM generate_series(1, 100);
    end;
$generation$;

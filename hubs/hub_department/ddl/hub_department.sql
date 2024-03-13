do
$dwh_staging$
    begin
        DROP TABLE staging.hub_department CASCADE ;
        DROP TABLE presentation.hub_department CASCADE ;
        CREATE TABLE staging.hub_department
        (
            hub_department_key serial primary key,
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
            hub_department_key serial primary key,
            department_id      numeric(4),
            hub_load_dts       date,
            hub_rec_src        varchar(12)
        );

    end;
$dwh_presentation$;


do
$generation$
    begin
        INSERT INTO presentation.hub_department(department_id, hub_load_dts, hub_rec_src)
        SELECT
               random() * 8999 + 1000,
               (NOW() + (random() * (NOW() + '90 days' - NOW())) + '30 days'),
               md5(random()::text)::varchar(12)
        FROM generate_series(1, 100);
    end;
$generation$;
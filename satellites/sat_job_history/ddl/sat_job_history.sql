do
$dwh_staging$
    begin
--         drop table staging.sat_job_history;
--         drop table presentation.sat_job_history;

        create table staging.sat_job_history
        (
            lnk_job_history_seq numeric(12)
            constraint fk_sat_job_history_lnk_job_history
                    references staging.lnk_job_history
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            end_date date,
            sat_rec_src varchar(12),
            primary key (lnk_job_history_seq, sat_load_dts)
        );


    end;
$dwh_staging$;



do
$dwh_presentation$
    begin
        create table presentation.sat_job_history
        (
            lnk_job_history_seq numeric(12)
            constraint fk_sat_job_history_lnk_job_history
                    references presentation.lnk_job_history
                    on delete set null,
            sat_load_dts date,
            sat_load_dts_edts date,
            end_date date,
            sat_rec_src varchar(12),
            primary key (lnk_job_history_seq, sat_load_dts)
        );
    end;
$dwh_presentation$;



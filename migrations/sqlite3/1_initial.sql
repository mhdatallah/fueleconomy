-- +migrate Up
CREATE TABLE vehicles (
    id                       integer primary key autoincrement,
    updated                  timestamp default current_timestamp,
    atv_type                 varchar(255),
    charge_time_120v         real,
    charge_time_240v         real,
    charge_time_240vb        real,
    charger_240v_dscr        varchar(255),
    charger_240vb_dscr       varchar(255),
    cylinders                integer,
    drive_axle_type          varchar(255),
    e_city                   real,
    e_comb                   real,
    e_highway                real,
    e_motor                  varchar(255),
    eng_displacement         real,
    eng_dscr                 varchar(255),
    eng_id                   integer,
    epa_created_on           timestamp,
    epa_id                   integer unique,
    epa_modified_on          timestamp,
    f1_barrels_per_year      real,
    f1_co2                   real,
    f1_co2_tailpipe          real,
    f1_fuel_cost             integer,
    f1_fuel_type             varchar(255),
    f1_ghg_score             integer,
    f1_mpg_city              real,
    f1_mpg_city_unadj        real,
    f1_mpg_city_unrounded    real,
    f1_mpg_comb              real,
    f1_mpg_comb_unrounded    real,
    f1_mpg_highway           real,
    f1_mpg_highway_unrounded real,
    f1_mpg_highway_unadj     real,
    f1_range                 real,
    f2_barrels_per_year      real,
    f2_co2                   real,
    f2_co2_tailpipe          real,
    f2_fuel_cost             integer,
    f2_fuel_type             varchar(255),
    f2_ghg_score             integer,
    f2_mpg_city              real,
    f2_mpg_city_unadj        real,
    f2_mpg_city_unrounded    real,
    f2_mpg_comb              real,
    f2_mpg_comb_unrounded    real,
    f2_mpg_highway           real,
    f2_mpg_highway_unrounded real,
    f2_mpg_highway_unadj     real,
    f2_range                 real,
    f2_range_city            real,
    f2_range_highway         real,
    fuel_economy_score       real,
    fuel_type                varchar(255),
    is_guzzler               boolean,
    is_phev_blended          boolean,
    has_mpg_data             boolean,
    has_supercharger         boolean,
    has_turbocharger         boolean,
    luggage_volume_2door     integer,
    luggage_volume_4door     integer,
    luggage_volume_hatch     integer,
    make                     varchar(255),
    manufacturer_code        varchar(255),
    model                    varchar(255),
    mpg_data                 varchar(255),
    passenger_volume_2door   integer,
    passenger_volume_4door   integer,
    passenger_volume_hatch   integer,
    phev_cd_city             real,
    phev_cd_comb             real,
    phev_cd_highway          real,
    phev_mpg_city            real,
    phev_mpg_comb            real,
    phev_mpg_highway         real,
    phev_uf_city             real,
    phev_uf_comb             real,
    phev_uf_highway          real,
    size_class               varchar(255),
    start_stop               varchar(255),
    trans_dscr               varchar(255),
    transition               varchar(255),
    year                     integer,
    you_save_spend           integer
);

CREATE TABLE emissions_info (
    id                       integer primary key autoincrement,
    updated                  timestamp default current_timestamp,
    emission_std_code        varchar(255),
    emission_std_txt         varchar(255),
    engine_family_id         varchar(255),
    epa_id                   integer references vehicles(epa_id) on delete cascade on update cascade,
    f1_smog_rating           integer,
    f2_smog_rating           integer,
    sales_area               integer,
    smartway_score           integer
);

CREATE TABLE fuel_prices (
    id                       integer primary key autoincrement,
    updated                  timestamp default current_timestamp,
    cng                      real,
    diesel                   real,
    e85                      real,
    electricity              real,
    gas_midgrade             real,
    gas_premium              real,
    gas_regular              real,
    liquid_propane           real
);

-- +migrate Down
DROP TABLE emissions_info;
DROP TABLE vehicles;
DROP TABLE fuel_prices;

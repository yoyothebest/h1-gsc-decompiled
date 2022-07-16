// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_058F["player_death_explosion"] = loadfx( "fx/explosions/player_death_explosion" );
    level._id_058F["hallway_steam_flood"] = loadfx( "fx/smoke/hallway_steam_flood" );
    level._id_058F["hallway_steam_loop"] = loadfx( "fx/smoke/hallway_steam_loop" );
    level._id_058F["steam_jet_med"] = loadfx( "fx/smoke/h1_steam_jet_med" );
    level._id_058F["steam_jet_med_loop"] = loadfx( "fx/smoke/h1_steam_jet_med_loop" );
    level._id_058F["steam_jet_med_loop_rand"] = loadfx( "fx/smoke/h1_steam_jet_med_loop_random" );
    level._id_058F["glow_stick_glow_pile"] = loadfx( "fx/misc/glow_stick_glow_pile" );
    level._id_058F["launchtube_fire"] = loadfx( "fx/fire/launchtube_fire" );
    level._id_058F["launchtube_smokeloop"] = loadfx( "fx/smoke/launchtube_smokeloop" );
    level._id_058F["launchtube_fire_light"] = loadfx( "fx/misc/launchtube_fire_light" );
    level._id_058F["fog_bog_a"] = loadfx( "fx/weather/fog_launch_b" );
    level._id_058F["fog_launchb_red"] = loadfx( "fx/weather/fog_launchb_red" );
    level._id_058F["shower_wall_large"] = loadfx( "fx/distortion/shower_wall_large" );
    level._id_058F["shower_spray"] = loadfx( "fx/misc/shower_spray" );
    level._id_058F["shower_steam"] = loadfx( "fx/misc/shower_steam" );
    level._id_058F["rain_noise"] = loadfx( "fx/weather/rain_noise" );
    level._id_058F["rain_noise_ud"] = loadfx( "fx/weather/rain_noise_ud" );
    level._id_058F["light_glow_emergency_mist"] = loadfx( "fx/misc/light_glow_emergency_mist" );
    level._id_058F["fire_alarm_strobe"] = loadfx( "vfx/lights/light_fire_alarm_strobe_mwr" );
    level._id_058F["emergency_light_strobe"] = loadfx( "vfx/map/fusion/fus_light_red_strobe_mwr" );
    level._id_058F["steam_column_rising_lachfac_b"] = loadfx( "vfx/steam/steam_column_rising_lachfac_b" );
    level._id_058F["steam_launch_b"] = loadfx( "vfx/steam/steam_col_launch_b" );
    level._id_058F["ambient_particles_bright_vent"] = loadfx( "vfx/dust/ambient_particles_bright_vent" );
    level._id_058F["water_drip"] = loadfx( "vfx/water/falling_drip_ceil_launch_b" );
    level._id_058F["water_trickle"] = loadfx( "vfx/water/falling_pipe_water_trickle_straight_continue" );
    level._id_058F["splash_up"] = loadfx( "fx/water/splash_launch_b" );
    level._id_058F["flare_sm"] = loadfx( "vfx/lensflare/launch_b_flare_sm" );
    level._id_058F["snow_tube"] = loadfx( "fx/snow/snow_launch_b_tube" );
    level._id_058F["mote_cone"] = loadfx( "fx/dust/launch_b_mote_cone" );
    level._id_058F["flies"] = loadfx( "vfx/map/mp_clowntown/sewage_flies_launch_b" );
    level._id_058F["fire_wreckage_ground"] = loadfx( "vfx/fire/kitchen_fire_launch_b" );
    level._id_058F["spark_spit"] = loadfx( "vfx/sparks/launch_b_spark_spit" );
    level._id_058F["fog_oriented_edge_fade"] = loadfx( "vfx/fog/fog_oriented_edge_fade_launch_b" );
    level._id_058F["light_beams"] = loadfx( "fx/smoke/light_beam_launch_b" );
    _id_A538::set_custom_global_fx( "light_red_pulse_spritelight_origin", "vfx/map/betrayal/btr_emergency_nolight_pulse_spritelight" );
    common_scripts\_pipes::override_pipe_fx( "steam", "fx/smoke/h1_steam_jet_med" );
    common_scripts\_pipes::override_pipe_fx( "impact", "vfx/weaponimpact/small_metalhit_1" );
    common_scripts\_pipes::override_pipe_fx( "water", "fx/water/launch_b_pipe_spray" );
    level.c4_explosion_fx_override = loadfx( "vfx/explosion/explosion_wall_breach_add" );
    maps\createfx\launchfacility_b_fx::main();
    maps\createfx\launchfacility_b_sound::main();
}

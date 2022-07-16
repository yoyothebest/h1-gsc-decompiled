// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_058F["headshot1"] = loadfx( "fx/impacts/flesh_hit_head_fatal_exit" );
    level._id_058F["headshot2"] = loadfx( "fx/impacts/flesh_hit_splat_large" );
    level._id_058F["headshot3"] = loadfx( "fx/impacts/flesh_hit_body_fatal_exit" );
    level._id_058F["blood_pool"] = loadfx( "fx/impacts/deathfx_bloodpool" );
    level._id_058F["flesh_hit"] = loadfx( "fx/impacts/flesh_hit" );
    level._id_058F["blood"] = loadfx( "fx/impacts/sniper_escape_blood" );
    level._id_058F["cloud"] = loadfx( "fx/misc/ac130_cloud" );
    level._id_058F["cloud_tunnel"] = loadfx( "fx/weather/cloud_tunnel" );
    level._id_058F["light_beams"] = loadfx( "fx/smoke/light_beam_airplane" );
    level._id_058F["light_beams_lg"] = loadfx( "fx/smoke/light_beam_airplane_lg" );
    level._id_058F["cloud_windows"] = loadfx( "fx/weather/h1_airplane_window_clouds" );
    level._id_058F["suitcase_explosion"] = loadfx( "fx/explosions/h1_airplane_explode" );
    level._id_058F["airplane_explosion"] = loadfx( "fx/explosions/h1_airplane_explode" );
    level._id_058F["player_death_explosion"] = loadfx( "fx/explosions/player_death_explosion" );
    level._id_058F["fuselage_explosion1"] = loadfx( "fx/explosions/fuselage_explosion1" );
    level._id_058F["fuselage_explosion10"] = loadfx( "fx/explosions/decompression_exp1" );
    level._id_058F["fuselage_explosion_wind_suck"] = loadfx( "fx/dust/decompression_exitdoor_dust" );
    level._id_058F["fuselage_explosion_cabin_dust1"] = loadfx( "fx/dust/decompression_cabin_dust" );
    level._id_058F["fuselage_explosion_cabin_dust2"] = loadfx( "fx/dust/decompression_cabin_dust_short" );
    level._id_058F["fuselage_breach_airleak1"] = loadfx( "fx/misc/cargoship_sinking_steam_leak" );
    level._id_058F["fuselage_breach_airleak2"] = loadfx( "fx/smoke/decompression_leak" );
    level._id_058F["exit_door_dust"] = loadfx( "fx/dust/decompression_cabin_dust" );
    level._id_058F["exit_door_wind_suck"] = loadfx( "fx/dust/decompression_exitdoor_dust" );
    level._id_058F["door_kick_dust"] = loadfx( "fx/dust/dust_airplane_doorkick" );
    level._id_058F["goggles_cracks"] = loadfx( "vfx/ui/goggles_cracks" );
    level._id_058F["slow_mo_overlay"] = loadfx( "vfx/ui/h1_airplane_slow_mo_overlay" );
    maps\createfx\airplane_fx::main();
    maps\createfx\airplane_sound::main();
}

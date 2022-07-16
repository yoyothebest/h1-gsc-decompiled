// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_A539::_id_422D( "ch_streetlight_02_FX_origin", "fx/misc/lighthaze" );
    _id_A539::_id_422D( "me_streetlight_01_FX_origin", "fx/misc/lighthaze_bog_a" );
    _id_A539::_id_422D( "ch_street_light_01_on", "fx/misc/lighthaze" );
    _id_A539::_id_422D( "com_wall_streetlamp_on", "fx/misc/light_glow_white_dim" );
    _id_A539::_id_422D( "lamp_post_globe_on", "fx/misc/light_glow_white" );
    _id_A539::_id_422D( "highway_lamp_post", "fx/misc/lighthaze_villassault" );
    _id_A539::_id_422D( "cs_cargoship_spotlight_on_FX_origin", "fx/misc/lighthaze" );
    _id_A539::_id_422D( "com_tires_burning01_FX_origin", "fx/fire/tire_fire_med" );
    _id_A539::_id_422D( "icbm_powerlinetower_FX_origin", "fx/misc/power_tower_light_red_blink" );
    _id_A539::_id_422D( "icbm_mainframe_FX_origin", "fx/props/icbm_mainframe_lightblink" );
    _id_A539::_id_422D( "lighthaze_oilrig_FX_origin", "fx/misc/lighthaze_oilrig" );
    _id_A539::_id_422D( "lighthaze_white_FX_origin", "fx/misc/lighthaze_white" );
    _id_A539::_id_422D( "light_glow_walllight_white_FX_origin", "fx/misc/light_glow_walllight_white" );
    _id_A539::_id_422D( "fluorescent_glow_FX_origin", "fx/misc/fluorescent_glow" );
    _id_A539::_id_422D( "light_glow_industrial_FX_origin", "fx/misc/light_glow_industrial" );
    _id_A539::_id_422D( "light_glow_white_bulb_FX_origin", "fx/misc/light_glow_white_bulb" );
    _id_A539::_id_422D( "light_glow_white_lamp_FX_origin", "fx/misc/light_glow_white_lamp" );
    _id_A539::_id_422D( "highrise_blinky_tower", "fx/misc/power_tower_light_red_blink_large" );
    _id_A539::_id_422D( "light_red_steady_FX_origin", "fx/misc/tower_light_red_steady", -2 );
    _id_A539::_id_422D( "light_blue_steady_FX_origin", "fx/misc/tower_light_blue_steady", -2 );
    _id_A539::_id_422D( "light_orange_steady_FX_origin", "fx/misc/tower_light_orange_steady", -2 );
    _id_A539::_id_422D( "glow_stick_pile_FX_origin", "fx/misc/glow_stick_glow_pile", -2 );
    _id_A539::_id_422D( "light_pulse_red_FX_origin", "fx/misc/light_glow_red_generic_pulse", -2 );
    _id_A539::_id_422D( "light_pulse_red_FX_origin", "fx/misc/light_glow_red_generic_pulse", -2 );
    _id_A539::_id_422D( "light_pulse_orange_FX_origin", "fx/misc/light_glow_orange_generic_pulse", -2 );
    _id_A539::_id_422D( "light_red_blink_FX_origin", "fx/misc/power_tower_light_red_blink", -2 );
    _id_A539::_id_422D( "flare_ambient_FX_origin", "fx/misc/flare_ambient", undefined, undefined, "emt_road_flare_burn" );
    _id_A539::_id_422D( "me_dumpster_fire_FX_origin", "fx/fire/firelp_med_pm", undefined, undefined, "fire_dumpster_medium" );
    _id_A539::_id_422D( "barrel_fireFX_origin", "fx/fire/firelp_barrel_pm", undefined, undefined, "fire_barrel_small" );
    _id_A539::_id_422D( "cnd_laptop_001_open_on_FX_origin", "vfx/ambient/props/laptop_dust" );
    _id_A539::_id_422D( "cnd_glowstick_FX_origin", "fx/misc/glow_stick_glow_orange" );
}

override_global_fx( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5["targetname"] = var_0;
    var_5["fxFile"] = var_1;
    var_5["delay"] = var_2;
    var_5["fxName"] = var_3;
    var_5["soundalias"] = var_4;
    level.global_fx_override[var_0] = var_5;
}

set_custom_global_fx( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5["targetname"] = var_0;
    var_5["fxFile"] = var_1;
    var_5["delay"] = var_2;
    var_5["fxName"] = var_3;
    var_5["soundalias"] = var_4;
    level.global_fx_custom[var_0] = var_5;
}

create_custom_global_fx()
{
    if ( !isdefined( level.global_fx_custom ) )
        return;

    foreach ( var_1 in level.global_fx_custom )
    {
        var_2 = var_1["targetname"];
        var_3 = var_1["fxFile"];
        var_4 = var_1["delay"];
        var_5 = var_1["fxName"];
        var_6 = var_1["soundalias"];
        _id_A539::_id_422D( var_2, var_3, var_4, var_5, var_6 );
    }
}

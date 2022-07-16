// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

beautiful_corner()
{
    if ( !common_scripts\_ca_beautiful_corner::_id_4DD7() )
        return 0;

    common_scripts\utility::_id_383D( "lighting_player_interior" );
    common_scripts\utility::_id_383D( "player_made_it" );
    common_scripts\utility::_id_383D( "seaknight_guards_boarding" );
    common_scripts\_ca_blockout::init();
    maps\village_defend_fx::main();
    maps\village_defend_anim::main();
    maps\village_defend_precache::main();
    maps\createart\village_defend_art::main();
    _id_A550::main();
    level thread maps\village_defend_amb::main();
    maps\village_defend_lighting::main();
    thread _id_6504();
    thread player_position();
    beautiful_corner_settings();
    common_scripts\_ca_beautiful_corner::activate();
    return 1;
}

beautiful_corner_settings()
{
    level.beautiful_weapon = "m4_gl_mp";
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_0" );
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_1" );
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_2" );
    level.beautiful_visions["beautiful_corner_0"] = "village_defend";
    level.beautiful_visions["beautiful_corner_1"] = "village_defend";
    level.beautiful_visions["beautiful_corner_2"] = "village_defend";
    level.beautiful_lightsets["beautiful_corner_0"] = "village_defend";
    level.beautiful_lightsets["beautiful_corner_1"] = "village_defend";
    level.beautiful_lightsets["beautiful_corner_2"] = "village_defend";
    level.beautiful_cluts["beautiful_corner_0"] = "clut_village_defend_base";
    level.beautiful_cluts["beautiful_corner_1"] = "clut_village_defend_base";
    level.beautiful_cluts["beautiful_corner_2"] = "clut_village_defend_base";
    level.beautiful_dof["beautiful_corner_0"]["fstop"] = 3.3;
    level.beautiful_dof["beautiful_corner_0"]["focus_distance"] = 500;
    level.beautiful_dof["beautiful_corner_0"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_0"]["aperture_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_1"]["fstop"] = 2.45;
    level.beautiful_dof["beautiful_corner_1"]["focus_distance"] = 500;
    level.beautiful_dof["beautiful_corner_1"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_1"]["aperture_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_2"]["fstop"] = 2.0;
    level.beautiful_dof["beautiful_corner_2"]["focus_distance"] = 1000.0;
    level.beautiful_dof["beautiful_corner_2"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_2"]["aperture_speed"] = 1.0;
}

player_position()
{
    var_0 = getent( "info_player_start", "classname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
}

_id_6504()
{
    remove_barbed_wire_walls( "southern_hill_barbed_wire_wall_1" );
    remove_barbed_wire_walls( "southern_hill_barbed_wire_wall_2" );
    remove_barbed_wire_walls( "southern_hill_barbed_wire_wall_3" );
}

remove_barbed_wire_walls( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 delete();
}

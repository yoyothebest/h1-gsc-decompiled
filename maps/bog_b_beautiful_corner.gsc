// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

beautiful_corner()
{
    if ( !common_scripts\_ca_beautiful_corner::_id_4DD7() )
        return 0;

    setup_flags();
    common_scripts\_ca_blockout::init();
    maps\bog_b_precache::main();
    _id_A5A8::_id_186C( "bog_mortar", "vehicle_m1a1_abrams", undefined, "script_vehicle" );
    _id_A5A8::_id_1856( 999, 500, 1500 );
    maps\createart\bog_b_art::main();
    maps\bog_b_fx::main();
    _id_A550::main();
    maps\bog_b_anim::main();
    thread maps\bog_b_amb::main();
    maps\bog_b_lighting::main();
    thread maps\bog_b::rotate_fans();
    thread remove_all_weapons();
    thread _id_6504();
    thread player_position();
    beautiful_corner_settings();
    common_scripts\_ca_beautiful_corner::activate();
    return 1;
}

setup_flags()
{
    common_scripts\utility::_id_383D( "tank_clear_to_shoot" );
    common_scripts\utility::_id_383D( "door_idle_guy_idling" );
    common_scripts\utility::_id_383D( "price_at_spotter" );
    common_scripts\utility::_id_383D( "ok_to_do_spotting" );
    common_scripts\utility::_id_383D( "tank_in_final_position" );
    common_scripts\utility::_id_383D( "tank_turret_aimed_at_t72" );
    common_scripts\utility::_id_383D( "friendly_reactions_over" );
    common_scripts\utility::_id_383D( "t72_in_final_position" );
    common_scripts\utility::_id_383D( "t72_exploded" );
    common_scripts\utility::_id_383D( "abrams_move_shoot_t72" );
    common_scripts\utility::_id_383D( "abrams_advance_to_end_level" );
    common_scripts\utility::_id_383D( "allowTankFire" );
    common_scripts\utility::_id_383D( "aa_bog_b_zone_bog" );
    common_scripts\utility::_id_383D( "aa_bog_b_zone_streets" );
    common_scripts\utility::_id_383D( "aa_bog_b_zone_alley" );
    common_scripts\utility::_id_383D( "dumpster_pushed" );
    common_scripts\utility::_id_383D( "seaknight_dialog_done" );
    common_scripts\utility::_id_383D( "alley_cleared" );
    common_scripts\utility::_id_383D( "start_dumpster_push" );
    common_scripts\utility::_id_383D( "player_passed_dumpster" );
    common_scripts\utility::_id_383D( "truck_crush_tank_in_position" );
}
#using_animtree("generic_human");

beautiful_corner_settings()
{
    level._id_78AC["beautiful_guy"]["bc_casual_idle"][0] = %casual_stand_idle;
    level.beautiful_weapon = "m4_gl_mp";
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_alley" );
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_store" );
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_apartment" );
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_backalley" );
    level.beautiful_views = common_scripts\utility::_id_0CDA( level.beautiful_views, "beautiful_corner_griggs" );
    level.beautiful_visions["beautiful_corner_alley"] = "bog_b_street_part01";
    level.beautiful_visions["beautiful_corner_apartment"] = "bog_b";
    level.beautiful_visions["beautiful_corner_backalley"] = "bog_b_street_part01";
    level.beautiful_visions["beautiful_corner_store"] = "bog_b_street_part01";
    level.beautiful_visions["beautiful_corner_griggs"] = "bog_b_street_part01";
    level.beautiful_lightsets["beautiful_corner_alley"] = "bog_b";
    level.beautiful_lightsets["beautiful_corner_apartment"] = "beauty_apt";
    level.beautiful_lightsets["beautiful_corner_backalley"] = "bog_b";
    level.beautiful_lightsets["beautiful_corner_store"] = "beauty_store";
    level.beautiful_lightsets["beautiful_corner_griggs"] = "beauty_griggs";
    level.beautiful_cluts["beautiful_corner_alley"] = "clut_bog_b";
    level.beautiful_cluts["beautiful_corner_apartment"] = "clut_bog_b_int";
    level.beautiful_cluts["beautiful_corner_backalley"] = "clut_bog_b";
    level.beautiful_cluts["beautiful_corner_store"] = "clut_bog_b_int";
    level.beautiful_cluts["beautiful_corner_griggs"] = "clut_bog_b";
    level.beautiful_dof["beautiful_corner_apartment"]["fstop"] = 3.3;
    level.beautiful_dof["beautiful_corner_apartment"]["focus_distance"] = 415.0;
    level.beautiful_dof["beautiful_corner_apartment"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_apartment"]["aperture_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_store"]["fstop"] = 2.45;
    level.beautiful_dof["beautiful_corner_store"]["focus_distance"] = 154.0;
    level.beautiful_dof["beautiful_corner_store"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_store"]["aperture_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_griggs"]["fstop"] = 2.0;
    level.beautiful_dof["beautiful_corner_griggs"]["focus_distance"] = 75.0;
    level.beautiful_dof["beautiful_corner_griggs"]["focus_speed"] = 1.0;
    level.beautiful_dof["beautiful_corner_griggs"]["aperture_speed"] = 1.0;
}

remove_all_weapons()
{
    var_0 = getentarray( "weapon_dragunov", "classname" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "weapon_rpg_player", "classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "weapon_saw", "classname" ) );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

player_position()
{
    var_0 = getent( "info_player_start", "classname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
}

_id_6504()
{
    var_0 = getent( "alley_door", "targetname" );
    var_0 _meth_82B3( -140, 0.5, 0, 0 );
    getent( "alley_door_player_clip", "targetname" ) delete();
}

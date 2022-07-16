// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_cargoship_precache::main();
    maps\mp\mp_cargoship_fx::main();
    maps\createart\mp_cargoship_art::main();
    maps\mp\_load::main();
    maps\mp\_compass::_id_8324( "compass_map_mp_cargoship" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
    thread animated_cranes();
    thread animated_boats_precache();
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_tonemapHighlightRange", 0 );
    setdvar( "compassmaxrange", "2100" );
    misc_rotate_fans();
    maps\mp\_fx_trigger::main();

    if ( level._id_01B3 == "dom" )
    {
        level.domborderfx["friendly"]["_a"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["friendly"]["_b"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["friendly"]["_c"] = "vfx/unique/vfx_marker_dom_med";
        level.domborderfx["enemy"]["_a"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["enemy"]["_b"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["enemy"]["_c"] = "vfx/unique/vfx_marker_dom_red_med";
        level.domborderfx["neutral"]["_a"] = "vfx/unique/vfx_marker_dom_w_mid";
        level.domborderfx["neutral"]["_b"] = "vfx/unique/vfx_marker_dom_w_mid";
        level.domborderfx["neutral"]["_c"] = "vfx/unique/vfx_marker_dom_w_mid";
    }

    maps\mp\gametypes\_teams::setfactiontableoverride( "marines", maps\mp\gametypes\_teams::getteamheadiconcol(), "h1_headicon_marines_night" );
    maps\mp\gametypes\_teams::setfactiontableoverride( "opfor", maps\mp\gametypes\_teams::getteamheadiconcol(), "h1_headicon_opfor_night" );
    level.killconfirmeddogtagenemy = "h1_dogtag_enemy_animated_night";
    level.killconfirmeddogtagfriend = "h1_dogtag_friend_animated_night";
    level.bombsquadmodelc4 = "weapon_c4_bombsquad_mw1_night";
    level.bombsquadmodelclaymore = "weapon_claymore_bombsquad_mw1_night";
    level.oldschoolfxtype = "unlit";
}

misc_rotate_fans()
{
    _func_16C( "rotate_Z_L" );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate_custom", "targetname" ), ::fan_blade_rotate_custom );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate", "targetname" ), ::_id_366A );
}

fan_blade_rotate_custom()
{
    self _meth_8277( "rotate_Z_L" );
}

_id_366A()
{
    var_0 = 600;

    for (;;)
    {
        self _meth_82B9( ( 0, 150, 0 ), var_0 );
        wait(var_0);
    }
}

animated_cranes()
{
    _func_16C( "h1_mp_crane_idle_1" );
    _func_16C( "h1_mp_crane_idle_2" );
    var_0 = getent( "crane1", "targetname" );
    var_1 = getent( "crane2", "targetname" );
    var_0 _meth_8277( "h1_mp_crane_idle_1" );
    var_1 _meth_8277( "h1_mp_crane_idle_2" );
}

animated_boats_precache()
{
    _func_16C( "h1_mp_lifeboat_idle_1" );
    _func_16C( "h1_mp_lifeboat_idle_2" );
    _func_16C( "h1_mp_lifeboat_idle_3" );
    var_0 = getentarray( "animated_boat", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::animated_boats );
}
#using_animtree("animated_props_dlc");

animated_boats()
{
    var_0 = [];
    var_1 = [];
    var_0[0] = "h1_mp_lifeboat_idle_1";
    var_1[0] = %h1_mp_lifeboat_idle_1;
    var_0[1] = "h1_mp_lifeboat_idle_2";
    var_1[1] = %h1_mp_lifeboat_idle_2;
    var_0[2] = "h1_mp_lifeboat_idle_3";
    var_1[2] = %h1_mp_lifeboat_idle_3;

    for (;;)
    {
        var_2 = _func_0B2( 3 );
        self _meth_8277( var_0[var_2] );
        wait(getanimlength( var_1[var_2] ));
    }
}

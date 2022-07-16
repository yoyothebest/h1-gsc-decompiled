// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::_id_8301();
    maps\mp\gametypes\_globallogic::_id_8301();

    if ( _func_13E() )
    {
        level._id_4DE0 = ::_id_4DE0;
        [[ level._id_4DE0 ]]();
        level thread maps\mp\_utility::_id_7307();
    }
    else
    {
        maps\mp\_utility::_id_72F9( level._id_01B3, 5 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 3 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 1 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
    }

    maps\mp\_utility::_id_7FD9( 5 );

    if ( isdefined( game["round_time_to_beat"] ) )
    {
        maps\mp\_utility::_id_7FD9( game["round_time_to_beat"] );
        game["round_time_to_beat"] = undefined;
    }

    if ( !isdefined( game["time_to_beat_axis"] ) )
        game["time_to_beat_axis"] = 0;

    if ( !isdefined( game["time_to_beat_allies"] ) )
        game["time_to_beat_allies"] = 0;

    maps\mp\_utility::setcarrierloadouts();
    level.assists_count_disabled = 1;
    level._id_91EB = 1;
    level._id_62F8 = 1;
    level._id_662E = 1;
    level._id_64BB = 1;
    level._id_6823 = maps\mp\_utility::_id_3FDB( "scr_ctf_ping_carrier", 1 );
    level._id_A32B = maps\mp\_utility::_id_3FDB( "scr_ctf_win_by_captures", 0 );
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64D3 = ::_id_64D3;
    level._id_64F0 = ::_id_64F0;
    level._id_64B2 = ::_id_64B2;
    level.onoutcomenotify = ::onoutcomenotify;

    if ( !isdefined( game["shut_out"] ) )
    {
        game["shut_out"]["axis"] = 1;
        game["shut_out"]["allies"] = 1;
    }

    if ( level._id_A32B )
        setdynamicdvar( "scr_ctf_scorelimit", 0 );

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    level._id_386A = maps\mp\_utility::_id_3FDB( "scr_ctf_returntime", 30 );
    game["dialog"]["gametype"] = "ctf_intro";
    game["dialog"]["offense_obj"] = "ctf_start";
    game["dialog"]["defense_obj"] = "ctf_start";
    thread _id_64C8();
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    setdynamicdvar( "scr_ctf_roundlimit", 1 );
    maps\mp\_utility::_id_72F6( "ctf", 1 );
    setdynamicdvar( "scr_ctf_winlimit", 1 );
    maps\mp\_utility::_id_72FE( "ctf", 1 );
    setdynamicdvar( "scr_ctf_halftime", 1 );
    maps\mp\_utility::_id_72EF( "ctf", 1 );
    setdynamicdvar( "scr_ctf_returntime", _func_13D( "ctfData", "returnTime" ) );
    setdynamicdvar( "scr_ctf_ping_carrier", _func_13D( "ctfData", "enemyCarrierIcon" ) );
    setdynamicdvar( "scr_ctf_win_by_captures", _func_13D( "ctfData", "winByCaptures" ) );
    setdynamicdvar( "scr_ctf_flag_pick_up_time_friendly", _func_13D( "ctfData", "pickupTime" ) );
    setdynamicdvar( "scr_ctf_flag_pick_up_time_enemy", _func_13D( "ctfData", "pickupTime" ) );
}

_id_64EC()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( maps\mp\_utility::_id_516C( game["status"] ) )
        game["switchedsides"] = !game["switchedsides"];

    if ( game["status"] == "halftime" )
        setomnvar( "ui_current_round", 2 );
    else if ( game["status"] == "overtime" )
        setomnvar( "ui_current_round", 3 );
    else if ( game["status"] == "overtime_halftime" )
        setomnvar( "ui_current_round", 4 );

    if ( !isdefined( game["original_defenders"] ) )
        game["original_defenders"] = game["defenders"];

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    if ( !level._id_A32B )
    {
        game["teamScores"][game["attackers"]] = 0;
        _func_160( game["attackers"], 0 );
        game["teamScores"][game["defenders"]] = 0;
        _func_160( game["defenders"], 0 );
    }

    _func_161( "auto_change" );
    level._id_386E["marines"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_usmc_blue" );
    level._id_386E["marines"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_usmc_red" );
    level._id_386E["sas"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_sas_blue" );
    level._id_386E["sas"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_sas_red" );
    level._id_386E["opfor"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_arab_blue" );
    level._id_386E["opfor"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_arab_red" );
    level._id_386E["russian"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_spet_blue" );
    level._id_386E["russian"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_spet_red" );
    level._id_3865["marines"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_usmc_blue_grnd" );
    level._id_3865["marines"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_usmc_red_grnd" );
    level._id_3865["sas"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_sas_blue_grnd" );
    level._id_3865["sas"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_sas_red_grnd" );
    level._id_3865["opfor"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_arab_blue_grnd" );
    level._id_3865["opfor"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_arab_red_grnd" );
    level._id_3865["russian"]["friendly"] = loadfx( "vfx/unique/vfx_ctf_spet_blue_grnd" );
    level._id_3865["russian"]["enemy"] = loadfx( "vfx/unique/vfx_ctf_spet_red_grnd" );
    flagbasefxdefault();

    if ( level._id_8A7C )
    {
        maps\mp\_utility::_id_7FC4( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER" );
        maps\mp\_utility::_id_7FC4( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER" );
    }
    else
    {
        maps\mp\_utility::_id_7FC4( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_SCORE" );
        maps\mp\_utility::_id_7FC4( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_SCORE" );
    }

    maps\mp\_utility::_id_7FC5( game["attackers"], &"OBJECTIVES_CTF" );
    maps\mp\_utility::_id_7FC5( game["defenders"], &"OBJECTIVES_CTF" );
    maps\mp\_utility::_id_7FC3( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_HINT" );
    maps\mp\_utility::_id_7FC3( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_HINT" );
    _id_4E24();
    var_2[0] = "ctf";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    level thread _id_24AB();
    level thread _id_9B63();
}

flagbasefxdefault()
{
    setflagbasefx( "vfx/unique/vfx_marker_ctf", "vfx/unique/vfx_marker_ctf_red" );
}

flagbasefxdark()
{
    setflagbasefx( "vfx/unique/vfx_marker_ctf_drk", "vfx/unique/vfx_marker_ctf_red_drk" );
}

setflagbasefx( var_0, var_1 )
{
    if ( !isdefined( level._id_385D ) )
        level._id_385D = [];

    var_2 = [ "marines", "sas", "opfor", "russian" ];

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( level._id_385D[var_4] ) )
            level._id_385D[var_4] = [];

        if ( !isdefined( level._id_385D[var_4]["friendly"] ) )
            level._id_385D[var_4]["friendly"] = loadfx( var_0 );

        if ( !isdefined( level._id_385D[var_4]["enemy"] ) )
            level._id_385D[var_4]["enemy"] = loadfx( var_1 );
    }
}

_id_4E24()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_ctf_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_ctf_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "allies", "mp_ctf_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "axis", "mp_ctf_spawn" );
    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
}

_id_40D2()
{
    var_0 = self._id_04A7;

    if ( level._id_9C14 && level._id_4C6D )
    {
        if ( game["switchedsides"] )
            var_0 = maps\mp\_utility::_id_4067( var_0 );

        var_1 = maps\mp\gametypes\_spawnlogic::getrandomstartspawn( "mp_ctf_spawn_" + var_0 + "_start" );
    }
    else
    {
        var_2 = maps\mp\gametypes\_spawnlogic::_id_411F( var_0 );
        var_1 = maps\mp\gametypes\_spawnscoring::getspawnpoint_ctf( var_2, var_0 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_9B63()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_9AFC();
        var_0 thread _id_9B59();
        var_0 thread _id_9B11();
    }
}

_id_9AFC()
{
    waitframe;
    maps\mp\_utility::_id_7F6B( self._id_0308["captures"] );
}

_id_9B59()
{
    waitframe;
    self.assists = self._id_0308["returns"];
}

_id_9B11()
{
    waitframe;
    maps\mp\_utility::_id_7F6C( self._id_0308["defends"] );
}

_id_24AB()
{
    level._id_3866["allies"] = "tag_origin";
    level._id_1BB4["allies"] = "tag_origin";
    level._id_3866["axis"] = "tag_origin";
    level._id_1BB4["axis"] = "tag_origin";
    level._id_4B43 = "waypoint_escort";
    level._id_4B42 = "waypoint_escort";
    level._id_4B45 = "waypoint_kill";
    level._id_4B44 = "waypoint_kill";
    level._id_4B34 = "waypoint_capture_flag";
    level._id_4B33 = "waypoint_capture_flag";
    level._id_4B3B = "waypoint_defend_flag";
    level._id_4B3A = "waypoint_defend_flag";
    level._id_4B4F = "waypoint_return_flag";
    level._id_4B4E = "waypoint_return_flag";
    level._id_4B52 = "waypoint_waitfor_flag";
    level._id_4B51 = "waypoint_waitfor_flag";
    level._id_4B2E = "waypoint_esports_ctf_taken_blue";
    level._id_4B2F = "waypoint_esports_ctf_taken_red";
    level._id_4B3C = "waypoint_esports_ctf_dropped_blue";
    level._id_4B3D = "waypoint_esports_ctf_dropped_red";
    level._id_4B2C = "waypoint_esports_ctf_flag_blue";
    level._id_4B2D = "waypoint_esports_ctf_flag_red";
    level._id_4B46 = "waypoint_esports_ctf_flag_missing_blue";
    level._id_4B47 = "waypoint_esports_ctf_flag_missing_red";
    level._id_91EF[game["defenders"]] = _id_2442( game["defenders"] );
    level._id_91EF[game["attackers"]] = _id_2442( game["attackers"] );
    level._id_1B60[game["defenders"]] = _id_23E7( game["defenders"] );
    level._id_1B60[game["attackers"]] = _id_23E7( game["attackers"] );
    _id_0D76();
    _id_64E1( "allies" );
    _id_64E1( "axis" );
}

_id_64E1( var_0 )
{
    if ( var_0 == "allies" )
    {
        level._id_0A84 = 0;
        level._id_0A83 = -1;
    }
    else
    {
        level._id_1219 = 0;
        level._id_1218 = -1;
    }

    level notify( "update_flag_status" );
}

_id_64C4( var_0 )
{
    var_1 = var_0._id_0308["team"];

    if ( var_1 == "allies" )
    {
        var_0._id_02D2 = 1;
        level._id_1219 = 2;
        level._id_1218 = var_0 _meth_81B5();
    }
    else
    {
        var_0._id_02D2 = 2;
        level._id_0A84 = 2;
        level._id_0A83 = var_0 _meth_81B5();
    }

    level notify( "update_flag_status" );
}

_id_6470( var_0 )
{
    if ( var_0 == "allies" )
    {
        level._id_0A84 = 1;
        level._id_0A83 = -1;
    }
    else
    {
        level._id_1219 = 1;
        level._id_1218 = -1;
    }

    level notify( "update_flag_status" );
}

_id_6D77()
{
    if ( !isdefined( self._id_04A7 ) || !isdefined( level._id_0A84 ) )
        return;

    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    if ( self._id_04A7 == "allies" || self._id_04A7 == "spectator" )
    {
        var_0 = level._id_0A84;
        var_1 = level._id_0A83;
        var_2 = level._id_1219;
        var_3 = level._id_1218;
    }
    else if ( self._id_04A7 == "axis" )
    {
        var_0 = level._id_1219;
        var_1 = level._id_1218;
        var_2 = level._id_0A84;
        var_3 = level._id_0A83;
    }
    else
        return;

    self _meth_82F8( "ui_ctf_friendly_status", var_0 );
    self _meth_82F8( "ui_ctf_friendly_carrier_clientnum", var_1 );
    self _meth_82F8( "ui_ctf_enemy_status", var_2 );
    self _meth_82F8( "ui_ctf_enemy_carrier_clientnum", var_3 );
    self _meth_82F8( "ui_ctf_status_changed", 1 );
}

_id_6D78()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_6D77();
        playerupdatetimetobeatomnvars();
    }
}

_id_6D8E()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_6D77();
    thread _id_6D78();

    for (;;)
    {
        level waittill( "update_flag_status" );
        _id_6D77();
    }
}

_id_4878( var_0 )
{
    level waittill( "game_ended" );

    if ( isdefined( var_0 ) )
        var_0.alpha = 0;
}

_id_2442( var_0 )
{
    var_1 = var_0;

    if ( game["switchedsides"] )
        var_1 = maps\mp\_utility::_id_4067( var_0 );

    var_2 = getent( "ctf_zone_" + var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        common_scripts\utility::_id_334F( "No ctf_zone_" + var_1 + " trigger found in map." );
    else
    {
        var_3[0] = getent( "ctf_flag_" + var_1, "targetname" );

        if ( !isdefined( var_3[0] ) )
        {
            common_scripts\utility::_id_334F( "No ctf_flag_" + var_1 + " script_model found in map." );
            return;
        }

        var_4 = spawn( "trigger_radius", var_2._id_02E2, 0, 96, var_2._id_01E8 );
        var_2 = var_4;
        var_3[0] _meth_80B3( level._id_3866[var_0] );
        var_3[0]._id_63C7 = var_3[0] _meth_80C0( 0 );
        var_5 = var_3[0]._id_02E2 + ( 0, 0, 32 );
        var_6 = var_3[0]._id_02E2 + ( 0, 0, -32 );
        var_7 = _func_06B( var_5, var_6, 0, undefined );
        var_3[0]._id_02E2 = var_7["position"];
        var_8 = maps\mp\gametypes\_gameobjects::_id_23E9( var_0, var_2, var_3, ( 0, 0, 85 ) );
        var_9 = getdvarfloat( "scr_ctf_flag_pick_up_time_friendly", 0.0 );

        if ( var_9 > 0 )
            var_8 maps\mp\gametypes\_gameobjects::_id_802E( "friendly", var_9 );

        var_10 = getdvarfloat( "scr_ctf_flag_pick_up_time_enemy", 0.0 );

        if ( var_10 > 0 )
            var_8 maps\mp\gametypes\_gameobjects::_id_802E( "enemy", var_10 );

        var_8 maps\mp\gametypes\_gameobjects::_id_802D( "enemy", &"MP_GRABBING_FLAG" );
        var_8 maps\mp\gametypes\_gameobjects::_id_802D( "friendly", &"MP_RETURNING_FLAG" );
        var_8 maps\mp\gametypes\_gameobjects::_id_0AA1( "enemy" );
        var_8 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
        var_8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B42 );
        var_8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B43 );

        if ( level._id_6823 != 2 )
        {
            var_8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B44 );
            var_8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B45 );
        }
        else
        {
            var_8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", undefined );
            var_8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", undefined );
        }

        if ( maps\mp\_utility::_id_50C4() )
            var_8._id_6313 = 2.5;

        var_8._id_630B = 1;
        var_8._id_0AB5 = 1;
        var_8._id_740F = 1;
        var_8._id_64C2 = ::_id_64C2;
        var_8._id_64C3 = ::_id_64C2;
        var_8._id_646F = ::_id_646F;
        var_8._id_64E0 = ::_id_64E0;
        var_8._id_4273 = ::_id_426E;
        var_8._id_1AFB = ::_id_1AF8;
        var_8._id_4273 = ::_id_4272;
        var_8._id_63DF = var_2._id_0351;
        var_8._id_02E2 = var_2._id_02E2;
        var_8.highestspawndistratio = 0.0;

        if ( level._id_6823 == 0 )
            var_8._id_630B = 0;

        if ( var_0 == "allies" )
        {
            var_8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B2C );
            var_8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B2C );
            setomnvar( "ui_mlg_game_mode_status_1", 0 );
        }
        else
        {
            var_8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B2D );
            var_8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B2D );
            setomnvar( "ui_mlg_game_mode_status_2", 0 );
        }

        thread maps\mp\_utility::streamcarrierweaponstoplayers( var_8, [ maps\mp\_utility::_id_4067( var_1 ) ], ::shouldstreamcarrierclasstoplayer );
        var_8 thread _id_3860();
    }
}

shouldstreamcarrierclasstoplayer( var_0, var_1 )
{
    if ( isdefined( var_0._id_1BAF ) && var_0._id_1BAF == var_1 )
        return 0;

    return 1;
}

_id_23E7( var_0 )
{
    var_1 = var_0;

    if ( game["switchedsides"] )
        var_1 = maps\mp\_utility::_id_4067( var_0 );

    var_2 = getent( "ctf_zone_" + var_1, "targetname" );
    var_3 = [];
    var_4 = maps\mp\gametypes\_gameobjects::_id_244C( var_0, var_2, var_3, ( 0, 0, 85 ) );
    var_4 maps\mp\gametypes\_gameobjects::_id_0AB2( "friendly" );
    var_4 maps\mp\gametypes\_gameobjects::_id_8352( "any" );
    var_4 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B3A );
    var_4 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B3B );
    var_4 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B33 );
    var_4 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B34 );
    var_4 maps\mp\gametypes\_gameobjects::_id_834C( 0 );
    var_4 maps\mp\gametypes\_gameobjects::_id_7F99( level._id_91EF[maps\mp\_utility::_id_4067( var_0 )] );
    var_4._id_64F8 = ::_id_64F8;
    var_4._id_6459 = ::_id_6459;
    var_5 = var_2._id_02E2 + ( 0, 0, 32 );
    var_6 = var_2._id_02E2 + ( 0, 0, -32 );
    var_7 = _func_06B( var_5, var_6, 0, undefined );
    var_4._id_1307 = var_7["position"];
    var_4._id_1306 = var_7["normal"];
    var_4 thread _id_1B5F();
    return var_4;
}

_id_6454( var_0 )
{
    var_1 = var_0._id_0308["team"];

    if ( var_1 == maps\mp\gametypes\_gameobjects::_id_4078() )
        self._id_04C5._id_0351 = 1024;
    else
        self._id_04C5._id_0351 = self._id_63DF;
}

_id_648E( var_0, var_1, var_2 )
{
    self._id_04C5._id_0351 = self._id_63DF;
}

_id_64C2( var_0 )
{
    self notify( "picked_up" );
    var_1 = var_0._id_0308["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    _id_3861();

    if ( var_1 == maps\mp\gametypes\_gameobjects::_id_4078() )
    {
        thread _id_74DE();
        maps\mp\_utility::_id_564B( "flag_returned", var_1, "status" );
        maps\mp\_utility::_id_6DDD( "mp_obj_notify_pos_med", var_1 );
        maps\mp\_utility::_id_564B( "enemy_flag_returned", var_2, "status" );
        maps\mp\_utility::_id_6DDD( "mp_obj_notify_neg_med", var_2 );
        var_0 thread maps\mp\_events::_id_3869();
        _id_64E1( var_1 );
    }
    else
    {
        if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_1] ) )
        {
            var_0 thread _id_A009( self );
            var_0 thread maps\mp\_utility::applycarrierclass();
        }
        else
            var_0 _id_0DFA( self );

        thread bringhomeflagvo( var_0, var_1 );
        thread getflagbackvo( var_2 );
        _id_64C4( var_0 );
        maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B42 );
        maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B43 );

        if ( level._id_6823 != 2 )
        {
            maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B44 );
            maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B45 );
        }
        else
        {
            maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", undefined );
            maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", undefined );
        }

        level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
        level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_8352( "friendly" );
        level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B51 );
        level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B52 );
        var_3 = [ var_0 ];
        maps\mp\_utility::_id_564B( "enemy_flag_taken", var_1, "status" );
        maps\mp\_utility::_id_6DDD( "mp_obj_notify_pos_sml", var_1, var_3 );
        var_0 _meth_82F1( "h1_mp_flag_grab" );
        maps\mp\_utility::_id_564B( "flag_taken", var_2, "status" );
        maps\mp\_utility::_id_6DDD( "mp_obj_notify_neg_sml", var_2 );

        if ( maps\mp\gametypes\_gameobjects::_id_4078() == "allies" )
        {
            level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B46 );
            level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B46 );
            maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B2E );
            maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B2E );
            setomnvar( "ui_mlg_game_mode_status_1", var_0 _meth_81B5() );
        }
        else
        {
            level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B47 );
            level._id_1B60[var_2] maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B47 );
            maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B2F );
            maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B2F );
            setomnvar( "ui_mlg_game_mode_status_2", var_0 _meth_81B5() );
        }

        var_0 thread maps\mp\_events::_id_3868();
    }
}

bringhomeflagvo( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "reset" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    for (;;)
    {
        wait 15;

        if ( level._id_91EF[var_1] maps\mp\gametypes\_gameobjects::_id_511C() )
            var_0 maps\mp\_utility::_id_5655( "enemy_flag_bringhome", "status" );
    }
}

getflagbackvo( var_0 )
{
    level endon( "game_ended" );
    self endon( "reset" );
    var_1 = getflagstatus( var_0 );

    if ( var_1 == 1 )
        return;

    for (;;)
    {
        wait 15;
        maps\mp\_utility::_id_564B( "flag_getback", var_0, "status" );
    }
}

getflagstatus( var_0 )
{
    if ( var_0 == "allies" )
        return level._id_0A84;

    if ( var_0 == "axis" )
        return level._id_1219;
}

_id_74DE()
{
    maps\mp\gametypes\_gameobjects::_id_74DF();
}

_id_646F( var_0 )
{
    var_1 = maps\mp\gametypes\_gameobjects::_id_4078();
    var_2 = level._id_65B3[var_1];
    maps\mp\gametypes\_gameobjects::_id_0AA1( "any" );
    maps\mp\gametypes\_gameobjects::_id_8352( "any" );
    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B4E );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B4F );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B33 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B34 );
    _id_6470( var_1 );

    if ( var_1 == "allies" )
    {
        maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B3C );
        maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B3C );
        setomnvar( "ui_mlg_game_mode_status_1", 0 - level._id_386A );
    }
    else
    {
        maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B3D );
        maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B3D );
        setomnvar( "ui_mlg_game_mode_status_2", 0 - level._id_386A );
    }

    if ( isdefined( var_0 ) )
    {
        var_0._id_02D2 = 0;

        if ( isdefined( var_0._id_1BB4 ) )
            var_0 _id_2980();
    }

    maps\mp\_utility::_id_564B( "flag_dropped", var_1, "status" );
    maps\mp\_utility::_id_6DDD( "mp_obj_notify_neg_sml", var_1 );
    maps\mp\_utility::_id_564B( "enemy_flag_dropped", var_2, "status" );
    maps\mp\_utility::_id_6DDD( "mp_obj_notify_pos_sml", var_2 );
    thread _id_3860();
    thread _id_74DC();
}

_id_74DC()
{
    self endon( "picked_up" );
    self endon( "reset" );
    wait(level._id_386A);
    var_0 = maps\mp\gametypes\_gameobjects::_id_4078();
    var_1 = level._id_65B3[var_0];
    maps\mp\_utility::_id_564B( "flag_returned", var_0, "status" );
    maps\mp\_utility::_id_6DDD( "mp_obj_notify_pos_med", var_0 );
    maps\mp\_utility::_id_564B( "enemy_flag_returned", var_1, "status" );
    maps\mp\_utility::_id_6DDD( "mp_obj_notify_neg_med", var_1 );
    thread _id_74DE();
}

_id_64E0()
{
    var_0 = maps\mp\gametypes\_gameobjects::_id_4078();
    var_1 = level._id_65B3[var_0];
    maps\mp\gametypes\_gameobjects::_id_0AA1( "enemy" );
    maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B42 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B43 );

    if ( level._id_6823 != 2 )
    {
        maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B44 );
        maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B45 );
    }
    else
    {
        maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", undefined );
        maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", undefined );
    }

    thread _id_3860();
    _id_64E1( var_0 );
    level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_0AB2( "friendly" );
    level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_8352( "any" );
    level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B3A );
    level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B3B );
    level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B33 );
    level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B34 );

    if ( var_0 == "allies" )
    {
        level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", undefined );
        level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", undefined );
        maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B2C );
        maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B2C );
        setomnvar( "ui_mlg_game_mode_status_1", 0 );
    }
    else
    {
        level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", undefined );
        level._id_1B60[var_0] maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", undefined );
        maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B2D );
        maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B2D );
        setomnvar( "ui_mlg_game_mode_status_2", 0 );
    }
}

_id_64F8( var_0 )
{
    var_1 = var_0._id_0308["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    maps\mp\_utility::_id_564B( "enemy_flag_captured", var_1, "status" );
    maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_taken", var_1 );
    maps\mp\_utility::_id_564B( "flag_captured", var_2, "status" );
    maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_lost", var_2 );
    var_0 thread maps\mp\_events::_id_385F();

    if ( !maps\mp\_utility::_id_4E3F() )
        maps\mp\gametypes\_gamescores::_id_420C( var_1, 1 );

    game["shut_out"][var_2] = 0;

    if ( isdefined( var_0 ) )
    {
        var_0._id_02D2 = 0;

        if ( isdefined( var_0._id_1BB4 ) )
            var_0 _id_2980();
    }

    if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_1] ) )
        var_0 thread maps\mp\_utility::removecarrierclass();

    level._id_91EF[var_2] _id_74DE();

    if ( maps\mp\gametypes\_gameobjects::_id_4078() == "allies" )
        setomnvar( "ui_mlg_game_mode_status_1", 0 );
    else
        setomnvar( "ui_mlg_game_mode_status_2", 0 );

    level thread _id_1D19( var_1 );
}

settimetobeat( var_0 )
{
    var_1 = maps\mp\_utility::_id_412C();
    var_2 = "time_to_beat_" + var_0;

    if ( !game[var_2] || var_1 < game[var_2] )
    {
        game[var_2] = var_1;
        updatetimetobeatomnvar();
    }
}

updatetimetobeatomnvar()
{
    foreach ( var_1 in level._id_0323 )
        var_1 playerupdatetimetobeatomnvars();
}

playerupdatetimetobeatomnvars()
{
    var_0 = [ "allies", "axis" ];

    foreach ( var_2 in var_0 )
    {
        if ( self._id_04A7 == var_2 )
        {
            self _meth_82F8( "ui_friendly_time_to_beat", game["time_to_beat_" + var_2] );
            continue;
        }

        self _meth_82F8( "ui_enemy_time_to_beat", game["time_to_beat_" + var_2] );
    }
}

_id_1D19( var_0 )
{
    var_1 = "roundsWon";

    if ( level._id_A32B )
        var_1 = "teamScores";

    if ( maps\mp\_utility::_id_4E3F() )
    {
        level._id_374D = var_0;
        settimetobeat( var_0 );

        if ( game["status"] == "overtime" )
        {
            game["teamScoredFirstHalf"] = var_0;
            game["round_time_to_beat"] = maps\mp\_utility::_id_4024();
            level thread maps\mp\gametypes\_gamelogic::_id_315F( "overtime_halftime", game["end_reason"]["score_limit_reached"] );
        }
        else if ( game["status"] == "overtime_halftime" )
        {
            _id_9B5B( var_0 );
            game["teamScores"][var_0]++;
            level thread maps\mp\gametypes\_gamelogic::_id_315F( var_0, game["end_reason"]["score_limit_reached"] );
        }
    }
    else if ( game["teamScores"][var_0] == maps\mp\_utility::_id_415E( "scorelimit" ) )
    {
        _id_9B5B( var_0 );

        if ( game["status"] == "normal" )
        {
            game["roundMillisecondsAlreadyPassed"] = maps\mp\_utility::_id_412C();
            level thread maps\mp\gametypes\_gamelogic::_id_315F( "halftime", game["end_reason"]["score_limit_reached"] );
        }
        else if ( game["status"] == "halftime" )
        {
            var_2 = var_0;

            if ( game[var_1]["axis"] == game[var_1]["allies"] )
            {
                var_2 = "overtime";
                level._id_374D = "none";
            }

            level thread maps\mp\gametypes\_gamelogic::_id_315F( var_2, game["end_reason"]["score_limit_reached"] );
        }
    }
}

_id_9B5B( var_0 )
{
    level._id_374D = var_0;
    game["roundsWon"][var_0]++;
}

onoutcomenotify( var_0, var_1, var_2, var_3 )
{
    if ( !level._id_A32B )
    {
        if ( maps\mp\_utility::_id_5092( var_3 ) || var_0 == "halftime" || var_0 == "overtime" )
        {
            _func_160( "allies", game["roundsWon"]["allies"] );
            _func_160( "axis", game["roundsWon"]["axis"] );
        }
    }
}

_id_64B2( var_0 )
{
    _id_64F0();
}

_id_64F0()
{
    level._id_374D = "none";
    var_0 = "roundsWon";

    if ( level._id_A32B )
        var_0 = "teamScores";

    if ( maps\mp\_utility::_id_4E3F() )
    {
        if ( game["status"] == "overtime" )
            level thread maps\mp\gametypes\_gamelogic::_id_315F( "overtime_halftime", game["end_reason"]["time_limit_reached"] );
        else if ( game["status"] == "overtime_halftime" )
        {
            var_1 = game["teamScoredFirstHalf"];

            if ( isdefined( var_1 ) )
            {
                _id_9B5B( var_1 );
                game["teamScores"][var_1]++;
            }

            var_2 = "tie";

            if ( game[var_0]["axis"] > game[var_0]["allies"] )
                var_2 = "axis";

            if ( game[var_0]["allies"] > game[var_0]["axis"] )
                var_2 = "allies";

            level thread maps\mp\gametypes\_gamelogic::_id_315F( var_2, game["end_reason"]["time_limit_reached"] );
        }
    }
    else if ( game["status"] == "halftime" )
    {
        var_2 = "tie";

        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_2 = "axis";

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            var_2 = "allies";

        if ( var_2 == "axis" || var_2 == "allies" )
            _id_9B5B( var_2 );

        if ( game[var_0]["axis"] == game[var_0]["allies"] )
            var_2 = "overtime";

        level thread maps\mp\gametypes\_gamelogic::_id_315F( var_2, game["end_reason"]["time_limit_reached"] );
    }
    else
    {
        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            _id_9B5B( "axis" );

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            _id_9B5B( "allies" );

        level thread maps\mp\gametypes\_gamelogic::_id_315F( "halftime", game["end_reason"]["time_limit_reached"] );
    }
}

_id_A009( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self waittill( "applyLoadout" );
    _id_0DFA( var_0 );
}

_id_6459( var_0 )
{

}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) && _func_1AD( var_1 ) && var_1._id_0308["team"] != self._id_0308["team"] )
    {
        var_10 = isdefined( var_4 ) && maps\mp\_utility::_id_513D( var_4 );

        if ( isdefined( var_1._id_1BB4 ) && !var_10 )
            var_1 thread maps\mp\_events::_id_53B6();

        if ( isdefined( self._id_1BB4 ) )
        {
            var_1 thread maps\mp\_events::_id_5368( var_9 );
            _id_2980();
            return;
        }

        if ( var_10 )
            return;

        var_11 = 65536;

        foreach ( var_13 in level._id_1B60 )
        {
            var_14 = _func_225( var_1._id_02E2, var_13._id_24C8 );
            var_15 = _func_225( self._id_02E2, var_13._id_24C8 );

            if ( var_13._id_663A == var_1._id_04A7 )
            {
                if ( var_14 < var_11 || var_15 < var_11 )
                {
                    var_1 thread maps\mp\_events::_id_27AE( self, var_9 );
                    var_1 maps\mp\_utility::_id_7F6C( var_1._id_0308["defends"] );
                }
            }

            if ( var_13._id_663A == self._id_04A7 )
            {
                if ( var_14 < var_11 || var_15 < var_11 )
                    var_1 thread maps\mp\_events::_id_0D52( self, var_9 );
            }
        }
    }
    else if ( isdefined( self._id_1BB4 ) )
        _id_2980();
}

_id_0DFA( var_0 )
{
    var_1 = level._id_65B3[self._id_0308["team"]];
    self _meth_801D( level._id_1BB4[var_1], "J_SpineUpper", 1 );
    self._id_1BB4 = level._id_1BB4[var_1];
    var_0 thread _id_3860();
}

_id_426E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "lost_ctf_flag" );
    self waittill( "goliath_equipped" );
    wait 1.0;

    if ( isdefined( self._id_1BB4 ) )
        self _meth_801D( self._id_1BB4, "J_SpineUpper", 1 );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_3860();
}

_id_1AF8( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 maps\mp\_utility::_id_5131() )
        return 0;

    return 1;
}

_id_4272()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self waittill( "goliath_equipped" );

    if ( isdefined( self._id_1BB6 ) )
    {
        self._id_1BB4 = undefined;
        self._id_1BB6 thread maps\mp\gametypes\_gameobjects::_id_7F5D();
    }
}

_id_2980()
{
    self notify( "lost_ctf_flag" );
    var_0 = "J_SpineUpper";
    self _meth_802A( self._id_1BB4, var_0 );
    self._id_1BB4 = undefined;
}

_id_0D76()
{
    var_0 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_ctf_spawn" );
    level._id_9201["axis"] = [];
    level._id_9201["allies"] = [];

    foreach ( var_2 in var_0 )
    {
        var_2._id_91EA = _id_4034( var_2 );

        if ( var_2._id_91EA == "axis" )
        {
            level._id_9201["axis"][level._id_9201["axis"].size] = var_2;
            continue;
        }

        level._id_9201["allies"][level._id_9201["allies"].size] = var_2;
    }
}

_id_71EC()
{
    var_0 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_ctf_spawn" );
    level._id_9201["axis"] = [];
    level._id_9201["allies"] = [];

    foreach ( var_2 in var_0 )
    {
        var_2._id_91EA = _id_3DE5( var_2 );

        if ( var_2._id_91EA == "axis" )
        {
            level._id_9201["axis"][level._id_9201["axis"].size] = var_2;
            continue;
        }

        level._id_9201["allies"][level._id_9201["allies"].size] = var_2;
    }
}

_id_3DE5( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnlogic::_id_5170();
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in level._id_1B60 )
    {
        var_6 = undefined;

        if ( var_1 )
            var_6 = _func_214( var_0._id_02E2, var_5._id_24C8, 999999 );

        if ( !isdefined( var_6 ) || var_6 == -1 )
            var_6 = _func_0F0( var_5._id_24C8, var_0._id_02E2 );

        if ( !isdefined( var_2 ) || var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    return var_2._id_663A;
}

_id_4034( var_0 )
{
    var_1 = maps\mp\gametypes\_spawnlogic::_id_5170();
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;

    if ( var_1 )
    {
        var_3 = _func_214( var_0._id_02E2, level._id_91EF["allies"]._id_02E2, 999999 );
        var_4 = _func_214( var_0._id_02E2, level._id_91EF["axis"]._id_02E2, 999999 );
    }

    if ( !isdefined( var_3 ) || var_3 == -1 )
        var_3 = _func_0F0( level._id_91EF["allies"]._id_02E2, var_0._id_02E2 );

    if ( !isdefined( var_4 ) || var_4 == -1 )
        var_4 = _func_0F0( level._id_91EF["axis"]._id_02E2, var_0._id_02E2 );

    if ( isdefined( var_0._id_0398 ) )
    {
        if ( game["switchedsides"] && var_0._id_0398 == "axis_override" || !game["switchedsides"] && var_0._id_0398 == "allies_override" )
        {
            var_2 = "allies";
            var_0.friendlyflag = level._id_91EF["allies"];
            var_0.friendlyflagdist = var_3;
            var_0.enemyflagdist = var_4;
        }
        else if ( game["switchedsides"] && var_0._id_0398 == "allies_override" || !game["switchedsides"] && var_0._id_0398 == "axis_override" )
        {
            var_2 = "axis";
            var_0.friendlyflag = level._id_91EF["axis"];
            var_0.friendlyflagdist = var_4;
            var_0.enemyflagdist = var_3;
        }
    }

    if ( !isdefined( var_2 ) )
    {
        var_2 = common_scripts\utility::_id_9294( var_3 < var_4, "allies", "axis" );
        var_0.friendlyflag = common_scripts\utility::_id_9294( var_3 < var_4, level._id_91EF["allies"], level._id_91EF["axis"] );
        var_0.friendlyflagdist = common_scripts\utility::_id_9294( var_3 < var_4, var_3, var_4 );
        var_0.enemyflagdist = common_scripts\utility::_id_9294( var_3 > var_4, var_3, var_4 );
    }

    var_5 = var_0.friendlyflagdist / var_0.enemyflagdist;

    if ( var_0.friendlyflag.highestspawndistratio < var_5 )
        var_0.friendlyflag.highestspawndistratio = var_5;

    return var_2;
}

_id_3861()
{
    _id_3A9A();
}

_id_3860()
{
    waitframe;

    if ( isdefined( self._id_1BAF ) )
        _id_3A9B( level._id_386E, self._id_1BAF, "J_SpineUpper" );
    else
    {
        var_0 = self._id_9E9C[0];
        _id_3A99( level._id_3865, var_0._id_02E2, anglestoforward( var_0.angles ) );
    }
}

_id_1B5F()
{
    waitframe;
    _id_3A99( level._id_385D, self._id_1307, self._id_1306 );
}

_id_3A9A()
{
    if ( isdefined( self._id_3AAB ) )
        self._id_3AAB delete();

    if ( isdefined( self._id_32AC ) )
        self._id_32AC delete();
}

_id_3A9B( var_0, var_1, var_2 )
{
    var_3 = self._id_663A;
    var_4 = var_0[game[var_3]]["friendly"];
    var_5 = var_0[game[var_3]]["enemy"];
    _id_3A9A();
    self._id_3AAB = _id_89EC( var_4, var_3, var_1, var_2 );
    self._id_32AC = _id_89EC( var_5, maps\mp\_utility::_id_4067( var_3 ), var_1, var_2 );
}

_id_3A99( var_0, var_1, var_2 )
{
    var_3 = self._id_663A;
    var_4 = var_0[game[var_3]]["friendly"];
    var_5 = var_0[game[var_3]]["enemy"];
    _id_3A9A();
    self._id_3AAB = maps\mp\_utility::_id_89DD( var_4, var_3, var_1, var_2 );
    self._id_32AC = maps\mp\_utility::_id_89DD( var_5, maps\mp\_utility::_id_4067( var_3 ), var_1, var_2 );
}

_id_89EC( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_2C9( var_0, var_2, var_3 );
    var_4 maps\mp\_utility::_id_3BB8( var_1 );
    return var_4;
}

_id_1B5E()
{
    foreach ( var_1 in level._id_91EF )
    {
        if ( var_1._id_9E9C.size )
        {
            var_2 = var_1._id_9E9C[0]._id_02E2 + ( 0, 0, 32 );
            var_3 = var_1._id_9E9C[0]._id_02E2 + ( 0, 0, -32 );
            var_4 = _func_06B( var_2, var_3, 0, undefined );
            var_5 = _func_115( var_4["normal"] );
            var_1._id_1306 = anglestoforward( var_5 );
            var_1._id_1307 = var_4["position"];
            var_1 thread _id_3860();
            var_6 = level._id_1B60[var_1._id_663A];
            var_6._id_1306 = var_1._id_1306;
            var_6._id_1307 = var_1._id_1307;
            var_6 thread _id_1B5F();
        }
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_6D8E();
    }
}

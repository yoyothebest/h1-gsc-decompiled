// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

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
        maps\mp\_utility::_id_72F9( level._id_01B3, 30 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 300 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 1 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
    }

    level._id_91EB = 1;
    level._id_7130 = maps\mp\_utility::_id_3FDB( "scr_hp_radom_selection", 0 );
    level._id_4AA8 = 0;
    level._id_A3F2 = 60;
    level._id_4DE4 = maps\mp\_utility::_id_3FDB( "scr_hp_zone_delay", 0 );
    level._id_6C6D = 6;
    level._id_78A3 = 0;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64D3 = ::_id_64D3;
    level._id_64DA = ::_id_64DA;
    game["dialog"]["gametype"] = "hpt_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    if ( !level._id_4DE4 )
    {
        game["dialog"]["offense_obj"] = "null";
        game["dialog"]["defense_obj"] = "null";
    }

    game["objective_active"] = "mp_killstreak_radar";
    game["objective_gained_sound"] = "h1_mp_war_objective_taken";
    game["objective_lost_sound"] = "h1_mp_war_objective_lost";
    game["objective_contested_sound"] = "mp_obj_notify_neg_sml";
    level._id_5594 = 0;
    level._id_A3F8 = [];
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    maps\mp\_utility::_id_72F6( level._id_01B3, 1 );
    maps\mp\_utility::_id_72FE( level._id_01B3, 1 );
    maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
    setdynamicdvar( "scr_hp_radom_selection", _func_13D( "hpData", "randomZones" ) );
    setdynamicdvar( "scr_hp_zone_delay", _func_13D( "hpData", "initDelay" ) );
}

_id_64DA()
{
    level._id_62FD = &"MP_CONTROL_KOTH";
    level._id_62FB = &"MP_CAPTURE_KOTH";
    level._id_62FC = &"MP_DEFEND_KOTH";
    level._id_4B4A = "waypoint_captureneutral";
    level._id_4B49 = "waypoint_captureneutral";
    level._id_4B32 = "waypoint_capture";
    level._id_4B31 = "waypoint_capture";
    level._id_4B39 = "waypoint_defend";
    level._id_4B38 = "waypoint_defend";
    level._id_4B36 = "waypoint_contested";
    level._id_4B35 = "waypoint_contested";
    level._id_4B4B = "waypoint_esports_hardpoint_white";
    level._id_4B30 = "waypoint_esports_hardpoint_blue";
    level._id_4B4D = "waypoint_esports_hardpoint_red";
    level._id_4B37 = "waypoint_contested";
    level._id_A3F7 = &"MP_KOTH_AVAILABLE_IN";
    level._id_A3F1 = &"MP_KOTH_MOVING_IN";
}

_id_9B41( var_0, var_1 )
{
    game["strings"]["objective_hint_allies"] = var_0;
    game["strings"]["objective_hint_axis"] = var_1;
}

_id_9B40( var_0 )
{
    _id_9B41( var_0, var_0 );
}

_id_64EC()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    maps\mp\_utility::_id_7FC5( "allies", &"OBJECTIVES_KOTH" );
    maps\mp\_utility::_id_7FC5( "axis", &"OBJECTIVES_KOTH" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_KOTH" );
        maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_KOTH" );
    }
    else
    {
        maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_KOTH_SCORE" );
        maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_KOTH_SCORE" );
    }

    if ( level._id_4DE4 )
        _id_9B40( level._id_62FD );
    else
        _id_9B40( level._id_62FB );

    _func_161( "auto_change" );
    _id_4E26();
    var_2[0] = "hp";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    setomnvar( "ui_mlg_game_mode_status_2", 0 );
    level thread _id_64C8();
    level thread _id_8348();
    level thread _id_46CD();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_3BFA = 0;
        var_0._id_02D2 = 0;
        var_0._id_940F = [];
    }
}

_id_4E26()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_hp_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_hp_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "allies", "mp_hp_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "axis", "mp_hp_spawn" );
    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
}

_id_40D2()
{
    var_0 = self._id_0308["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::_id_4067( var_0 );

    if ( level._id_9C14 && level._id_4C6D )
        var_1 = maps\mp\gametypes\_spawnlogic::getrandomstartspawn( "mp_hp_spawn_" + var_0 + "_start" );
    else
    {
        var_2 = maps\mp\gametypes\_spawnlogic::_id_411F( var_0 );
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D6( var_2 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_4AA9()
{
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_9B98();
    setomnvar( "ui_mlg_game_mode_status_1", level._id_A3DD._id_3BF8._id_62AF["allies"] );
    setomnvar( "ui_mlg_game_mode_status_2", level._id_A3DD._id_3BF8._id_62AF["axis"] );
}

_id_892F()
{
    if ( level._id_7130 )
        level._id_A3DD = _id_4046();
    else
        level._id_A3DD = _id_4045();

    _id_7FBB();
    level._id_A3DD namedborderhidden();
}

_id_4AA7()
{
    level endon( "game_ended" );
    level endon( "zone_moved" );
    level._id_4AA8 = gettime();

    for (;;)
    {
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_0AB2( "any" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_834C( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_834B( &"MP_CAPTURING_OBJECTIVE" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 1 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_600A( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_1AC3( 1 );
        level._id_A3DD._id_3BF8._id_64F8 = ::_id_64FF;
        var_0 = level common_scripts\utility::_id_A070( "zone_captured", "zone_destroyed" );

        if ( var_0 == "zone_destroyed" )
            continue;

        var_1 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

        if ( var_1 == "allies" )
            _id_9B41( level._id_62FC, level._id_62FB );
        else if ( var_1 == "axis" )
            _id_9B41( level._id_62FB, level._id_62FC );
        else
            _id_9B41( level._id_62FB, level._id_62FB );

        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
        level._id_A3DD._id_3BF8._id_64F8 = undefined;
        level._id_A3DD._id_3BF8._id_64F6 = ::_id_6502;
        level._id_A3DD._id_3BF8._id_6462 = ::_id_6500;
        level._id_A3DD._id_3BF8._id_64F4 = ::_id_6501;
        level waittill( "zone_destroyed", var_2 );
        thread _id_39CB( var_1 );

        if ( isdefined( var_2 ) )
        {
            level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FDA( var_2 );
            continue;
        }

        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FDA( "none" );
    }
}

_id_9B20()
{
    for (;;)
    {
        foreach ( var_1 in level._id_0323 )
        {
            var_2 = var_1;

            if ( var_1._id_04A7 == "spectator" || var_1._id_03BC == "spectator" )
                var_2 = var_1 _meth_8299();

            if ( !maps\mp\_utility::_id_5189( var_2 ) )
            {
                var_1 _id_7F7A( var_1, 0 );
                continue;
            }

            if ( var_2._id_940F.size == 0 )
            {
                var_1 _id_7F7A( var_1, 0 );
                continue;
            }

            foreach ( var_4 in var_2._id_940F )
            {
                if ( var_4 == level._id_A3DD._id_3BF8._id_04C5 )
                {
                    var_1 _id_7F7A( var_1, 1 );
                    break;
                }

                var_1 _id_7F7A( var_1, 0 );
            }
        }

        wait 0.05;
    }
}

_id_7F7A( var_0, var_1 )
{
    var_2 = 0;

    if ( var_1 )
    {
        var_2 = 1;

        if ( isdefined( level._id_A3DD._id_3BF8._id_50E5 ) && level._id_A3DD._id_3BF8._id_50E5 )
            var_2 = 2;
    }

    if ( var_2 != var_0._id_3BFA )
    {
        var_0 _meth_82F8( "ui_hardpoint", var_2 );
        var_0._id_3BFA = var_2;
        var_0._id_02D2 = var_2;
    }
}

_id_46CD()
{
    level endon( "game_ended" );
    level._id_A3F5 = -100000;
    level._id_A3DD = _id_3F97();
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    level childthread _id_9B20();

    for (;;)
    {
        maps\mp\_utility::_id_6DDD( "mp_suitcase_pickup" );
        maps\mp\_utility::_id_38F7( "gamemode_objective" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 1 );
        level._id_A3DD._id_3BF8._id_64F7 = ::_id_4AA9;
        level._id_A3F5 = gettime();

        if ( level._id_4DE4 )
        {
            _id_8354( level._id_A3DD );
            level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_8352( "any" );
            level._id_A3DD namedborderneutral();
            _id_9B40( level._id_62FD );
            setomnvar( "ui_hardpoint_timer", gettime() + 1000 * level._id_4DE4 );
            wait(level._id_4DE4);
        }

        waitframe;
        _id_7FBB( level._id_A3DD );
        maps\mp\_utility::_id_564B( "hp_online", undefined, "gamemode_objective" );
        _id_9B40( level._id_62FB );
        level thread maps\mp\_utility::_id_6DDD( game["objective_active"] );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_3114();
        level._id_A3DD._id_3BF8._id_1B4B = 0;
        level._id_A3DD namedborderneutral();

        if ( level._id_A3F2 )
        {
            thread _id_5F9D( level._id_A3F2 );
            setomnvar( "ui_hardpoint_timer", gettime() + 1000 * level._id_A3F2 );
        }
        else
            level._id_A3F0 = 0;

        _id_4AA7();
        var_0 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();
        level._id_A3DD._id_3BF8._id_557E = undefined;
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_2B1E();
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FDA( "neutral" );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_600A( 0 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", undefined );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", undefined );
        level._id_A3DD namedborderhidden();
        level notify( "zone_reset" );

        if ( isdefined( level._id_4AA5 ) && level._id_4AA5 == 1 )
            level waittill( "ready_for_next_hp_zone" );

        _id_892F();
        wait 0.5;
        thread _id_39CB( var_0 );
        wait 0.5;
    }
}

_id_39CB( var_0 )
{
    var_1 = level._id_0323;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3._id_0308["team"] == var_0 )
        {
            var_3 notify( "force_spawn" );
            wait 0.1;
        }
    }
}

_id_64FF( var_0 )
{
    var_1 = var_0._id_0308["team"];
    var_2 = maps\mp\_utility::_id_4067( var_1 );
    var_3 = gettime();
    var_0 _meth_8026( "zone captured" );
    level._id_A3DD._id_3BF8._id_50E5 = 0;
    level._id_9C14 = 0;
    _id_802A( var_1 );
    level._id_A3DD namedborderowned( var_1 );

    if ( !isdefined( self._id_557E ) || self._id_557E != var_1 )
    {
        var_4 = [];
        var_5 = _func_1D3( self._id_940D[var_1] );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            var_4[var_5[var_6]] = self._id_940D[var_1][var_5[var_6]];

        level thread _id_41B9( var_4, var_3, var_1, self._id_557E );
        level thread maps\mp\_utility::_id_564B( "hp_secured", var_1, "gamemode_objective" );
        level thread maps\mp\_utility::_id_564B( "hp_lost", var_2, "gamemode_objective" );
    }

    level thread maps\mp\_utility::_id_6DDD( game["objective_gained_sound"], var_1 );
    level thread maps\mp\_utility::_id_6DDD( game["objective_lost_sound"], var_2 );
    level._id_4AA6 = var_1;
    maps\mp\gametypes\_gameobjects::_id_7FDA( var_1 );

    if ( isdefined( self._id_557E ) && self._id_557E != var_1 )
    {
        for ( var_7 = 0; var_7 < level._id_0323.size; var_7++ )
        {
            var_0 = level._id_0323[var_7];

            if ( var_0._id_0308["team"] == var_1 )
            {
                if ( isdefined( var_0.lastkilldefendertime ) && var_0.lastkilldefendertime + 500 > gettime() )
                    var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_killedLastContester" );
            }
        }
    }

    level thread _id_1206( var_1, self._id_557E );
    self._id_1B4B++;
    self._id_557E = var_1;
    maps\mp\gametypes\_gameobjects::_id_600A( 1 );
    level notify( "zone_captured" );
    level notify( "zone_captured" + var_1 );
}

_id_41B9( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_1D3( var_0 );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_6 = var_0[var_4[var_5]]._id_0318;
        var_6 _id_9AFB( var_3 );

        if ( !_id_519A( var_6 ) )
        {
            var_6 maps\mp\gametypes\_misions::_id_6FF6( "ch_hpcaptures" );

            if ( level._id_4AA8 + 500 > var_1 )
                var_6 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_immediateCapture" );

            var_6 thread maps\mp\_events::_id_7C06();
        }
        else
        {

        }

        wait 0.05;
    }
}

namedbordervisible( var_0, var_1 )
{
    if ( !isdefined( self.namedborders[var_0] ) )
        return;

    foreach ( var_3 in self.namedborders[var_0] )
    {
        var_3 notify( "stopShowFXToTeam" );

        if ( var_1 )
        {
            var_3._id_8D56 = "show";
            var_3 _meth_8055();
            continue;
        }

        var_3._id_8D56 = "hide";
        var_3 _meth_8056();
    }
}

namedbordershowtoteam( var_0, var_1 )
{
    if ( !isdefined( self.namedborders[var_0] ) )
        return;

    foreach ( var_3 in self.namedborders[var_0] )
    {
        var_3._id_8D56 = "showToTeam";
        var_3 notify( "stopShowFXToTeam" );
        var_3 thread maps\mp\_utility::_id_850E( var_1 );
    }
}

namedborderhidden()
{
    namedbordervisible( "neutral", 0 );
    namedbordervisible( "contested", 0 );
    namedbordervisible( "friendly", 0 );
    namedbordervisible( "enemy", 0 );
}

namedborderneutral()
{
    namedbordervisible( "neutral", 1 );
    namedbordervisible( "contested", 0 );
    namedbordervisible( "friendly", 0 );
    namedbordervisible( "enemy", 0 );
}

namedbordercontested()
{
    namedbordervisible( "neutral", 0 );
    namedbordervisible( "contested", 1 );
    namedbordervisible( "friendly", 0 );
    namedbordervisible( "enemy", 0 );
}

namedborderowned( var_0 )
{
    namedbordervisible( "neutral", 0 );
    namedbordervisible( "contested", 0 );
    namedbordershowtoteam( "friendly", var_0 );
    namedbordershowtoteam( "enemy", maps\mp\_utility::_id_4067( var_0 ) );
}

_id_6502()
{
    level notify( "zone_destroyed" );
    level._id_4AA6 = "neutral";
    level._id_A3DD._id_3BF8._id_50E5 = 0;

    if ( self._id_62AF["axis"] == 0 && self._id_62AF["allies"] == 0 )
    {
        level._id_A3DD._id_3BF8._id_A1CB = 1;
        _id_7FBB();
        level._id_A3DD namedborderneutral();
    }
}

_id_6500()
{
    var_0 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();
    level._id_A3DD._id_3BF8._id_A1C1 = 1;
    level._id_A3DD._id_3BF8._id_50E5 = 1;
    _id_7F40();
    level._id_A3DD namedbordercontested();
    level thread maps\mp\_utility::_id_6DDD( game["objective_contested_sound"] );
    maps\mp\_utility::_id_564B( "hp_contested", undefined, "gamemode_objective" );
}

_id_6501( var_0 )
{
    level._id_A3DD._id_3BF8._id_50E5 = 0;
    _id_802A( var_0 );
    level._id_A3DD namedborderowned( var_0 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F3A( var_0 );
}

_id_7FBB( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_A3DD;

    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B49 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B4A );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B49 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B4A );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B4B );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B4B );
}

_id_8354( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_A3DD;

    var_1 = "waypoint_waitfor_flag_neutral";
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", var_1 );
    var_0._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", var_1 );
}

_id_7F40()
{
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B35 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B36 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B35 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B36 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B37 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B37 );
}

_id_802A( var_0 )
{
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", level._id_4B38 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", level._id_4B39 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", level._id_4B31 );
    level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", level._id_4B32 );

    if ( var_0 == "allies" )
    {
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B30 );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B30 );
    }
    else
    {
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", level._id_4B4D );
        level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", level._id_4B4D );
    }
}

_id_5F9D( var_0 )
{
    level endon( "game_ended" );
    level endon( "zone_reset" );
    level._id_A3F4 = gettime() + var_0 * 1000;
    level._id_A3F0 = 0;
    wait(var_0);

    if ( !isdefined( level._id_A3DD._id_3BF8._id_A1C1 ) || level._id_A3DD._id_3BF8._id_A1C1 == 0 )
    {
        if ( !isdefined( level._id_A3DD._id_3BF8._id_A1CB ) || level._id_A3DD._id_3BF8._id_A1CB == 0 )
        {
            var_1 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

            foreach ( var_3 in level._id_0323 )
            {
                if ( var_3._id_0308["team"] == var_1 )
                    var_3 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_controlZoneEntirely" );
            }
        }
    }

    level._id_A3F0 = 1;
    level notify( "zone_moved" );
}

_id_1206( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "zone_destroyed" );
    level endon( "zone_reset" );
    level endon( "zone_moved" );
    level notify( "awardCapturePointsRunning" );
    level endon( "awardCapturePointsRunning" );
    var_2 = 1;
    var_3 = 1;

    while ( !level._id_3BDA )
    {
        wait(var_2);
        maps\mp\gametypes\_hostmigration::_id_A0DD();

        if ( !level._id_A3DD._id_3BF8._id_50E5 )
        {
            if ( level._id_78A3 )
                var_3 = level._id_A3DD._id_3BF8._id_62AF[var_0];

            var_4 = level._id_A3DD._id_3BF8._id_940D[var_0];
            var_5 = _func_1D3( var_4 );

            for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            {
                var_7 = var_4[var_5[var_6]]._id_0318;

                if ( !_func_1AD( var_7 ) )
                    continue;

                var_7 thread maps\mp\_events::holdhardpointevent();
            }

            maps\mp\gametypes\_gamescores::_id_420C( var_0, var_3 );
        }
    }
}

_id_20CC( var_0, var_1 )
{
    var_2 = var_0._id_7A18;
    var_3 = var_1._id_7A18;

    if ( !isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( !isdefined( var_2 ) && isdefined( var_3 ) )
        return 1;

    if ( isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( var_2 > var_3 )
        return 1;

    return 0;
}

_id_4179( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return undefined;

    var_2 = 1;

    for ( var_3 = var_1.size; var_2; var_3-- )
    {
        var_2 = 0;

        for ( var_4 = 0; var_4 < var_3 - 1; var_4++ )
        {
            if ( _id_20CC( var_1[var_4], var_1[var_4 + 1] ) )
            {
                var_5 = var_1[var_4];
                var_1[var_4] = var_1[var_4 + 1];
                var_1[var_4 + 1] = var_5;
                var_2 = 1;
            }
        }
    }

    return var_1;
}

_id_8348()
{
    var_0 = _id_4179( "hp_zone_center" );
    var_1 = getentarray( "hp_zone_trigger", "targetname" );
    level._id_A3F6 = _id_59F1( var_0, var_1 );
    var_2 = _id_4179( "hp_zone_center_augmented" );
    var_3 = getentarray( "hp_zone_trigger_augmented", "targetname" );

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
    {
        var_2 = _id_59F1( var_2, var_3 );

        if ( maps\mp\_utility::_id_50C4() )
        {
            foreach ( var_5 in var_2 )
            {
                for ( var_6 = 0; var_6 < level._id_A3F6.size; var_6++ )
                {
                    if ( level._id_A3F6[var_6]._id_7A18 == var_5._id_7A18 )
                        level._id_A3F6[var_6] = var_5;
                }
            }
        }
    }

    level._id_09E2 = level._id_A3F6;
    return 1;
}

_id_59F1( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = 0;
        var_4 = var_0[var_2];
        var_4._id_9754 = undefined;

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            if ( var_4 _meth_80AB( var_1[var_5] ) )
            {
                if ( isdefined( var_4._id_9754 ) )
                {
                    var_3 = 1;
                    break;
                }

                var_4._id_9754 = var_1[var_5];
                break;
            }
        }

        if ( !isdefined( var_4._id_9754 ) )
        {
            if ( !var_3 )
                continue;
        }

        var_4._id_9820 = var_4._id_9754._id_02E2;
        var_6 = [];
        var_6[0] = var_4;
        var_4.namedborders = [];

        if ( isdefined( var_4._id_04A4 ) )
        {
            var_7 = getentarray( var_4._id_04A4, "targetname" );

            foreach ( var_9 in var_7 )
            {
                var_10 = var_9._id_0398;

                if ( isdefined( var_10 ) )
                {
                    if ( !isdefined( var_4.namedborders[var_10] ) )
                        var_4.namedborders[var_10] = [];

                    var_11 = var_4.namedborders[var_10].size;
                    var_4.namedborders[var_10][var_11] = var_9;
                    continue;
                }

                var_6[var_6.size] = var_9;
            }
        }

        var_4._id_3BF8 = maps\mp\gametypes\_gameobjects::_id_244C( "neutral", var_4._id_9754, var_6, ( 0, 0, 0 ) );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_2B1E();
        _id_7FBB( var_4 );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", undefined );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", undefined );
        var_4._id_3BF8 maps\mp\gametypes\_gameobjects::_id_7FB5( 0 );
        var_4._id_9754._id_9C09 = var_4._id_3BF8;
        var_4._id_3BF8._id_6316["allies"] _meth_8518( var_4._id_9754 );
        var_4._id_3BF8._id_6316["axis"] _meth_8518( var_4._id_9754 );
        var_4._id_3BF8._id_6316["mlg"] _meth_8518( var_4._id_9754 );
        var_4 _id_8326();
        var_4 namedborderhidden();
    }

    return var_0;
}

_id_8326()
{
    var_0 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_hp_spawn" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_2B82 = _func_0F0( var_0[var_1]._id_02E2, self._id_02E2 );

    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        for ( var_3 = var_1 - 1; var_3 >= 0 && var_2._id_2B82 < var_0[var_3]._id_2B82; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];

        var_0[var_3 + 1] = var_2;
    }

    var_4 = [];
    var_5 = [];
    var_6 = [];
    var_7 = [];
    var_8 = var_0.size / 3;

    for ( var_1 = 0; var_1 <= var_8; var_1++ )
        var_4[var_4.size] = var_0[var_1];

    while ( var_1 < var_0.size )
    {
        var_7[var_7.size] = var_0[var_1];

        if ( var_1 <= var_8 * 2 )
            var_5[var_5.size] = var_0[var_1];
        else
            var_6[var_6.size] = var_0[var_1];

        var_1++;
    }

    self._id_3BF8._id_6078 = var_4;
    self._id_3BF8._id_5C10 = var_5;
    self._id_3BF8._id_366E = var_6;
    self._id_3BF8._id_65C2 = var_7;
}

_id_3F97()
{
    var_0 = level._id_A3F6[0];
    level._id_6F7B = 0;
    return var_0;
}

_id_4045()
{
    var_0 = ( level._id_6F7B + 1 ) % level._id_A3F6.size;
    var_1 = level._id_A3F6[var_0];
    level._id_6F7B = var_0;
    return var_1;
}

_id_854A()
{
    level._id_A3F8 = common_scripts\utility::_id_0CF5( level._id_A3F6 );

    if ( level._id_A3DD == level._id_A3F8[0] )
        level._id_A3F8 = maps\mp\_utility::_id_9001( level._id_A3F8, 0, _func_0B4( 1, level._id_A3F8.size ) );
}

_id_4046()
{
    if ( level._id_A3F8.size == 0 )
        _id_854A();

    var_0 = level._id_A3F8[0];
    var_1 = [];

    for ( var_2 = 1; var_2 < level._id_A3F8.size; var_2++ )
        var_1[var_2 - 1] = level._id_A3F8[var_2];

    level._id_A3F8 = var_1;
    return var_0;
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !_func_1AD( var_1 ) )
        return;

    if ( maps\mp\gametypes\_damage::_id_510E( self, var_1 ) )
        return;

    if ( var_1 == self )
        return;

    if ( !isdefined( level._id_A3DD ) )
        return;

    var_10 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

    if ( !isdefined( var_10 ) || var_10 == "neutral" )
        return;

    if ( isdefined( var_4 ) && maps\mp\_utility::_id_513D( var_4 ) )
        return;

    var_11 = 0;

    if ( !level._id_A3DD._id_3BF8._id_50E5 && var_1 _meth_80AB( level._id_A3DD._id_9754 ) )
    {
        var_11 = 1;
        var_1 thread maps\mp\_events::_id_53B4( self, var_9 );
    }

    if ( self _meth_80AB( level._id_A3DD._id_9754 ) )
    {
        var_1.lastkilldefendertime = gettime();

        if ( var_11 )
            return;

        if ( self._id_04A7 == var_10 )
            var_1 thread maps\mp\_events::_id_0D52( self, var_9 );
        else
        {
            var_1 maps\mp\gametypes\_misions::_id_6FF6( "ch_hp_zoneDefense" );
            var_1 thread maps\mp\_events::_id_27AE( self, var_9 );
            var_1 maps\mp\_utility::_id_7F6C( var_1._id_0308["defends"] );
        }
    }
}

_id_648D( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_A3F6.size; var_1++ )
        level._id_A3F6[var_1]._id_3BF8 maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
}

_id_9AFB( var_0 )
{
    if ( !isdefined( self._id_1B44 ) )
    {
        self._id_6294 = 0;
        self._id_1B44 = 0;
    }

    if ( !isdefined( var_0 ) || var_0 == "neutral" )
        return;

    self._id_6294++;
    var_1 = maps\mp\_utility::_id_412C() / 60000;

    if ( _func_1AD( self ) && isdefined( self._id_9372["total"] ) )
        var_1 = _func_0E1( self._id_9372["total"], 1 ) / 60;

    self._id_1B44 = self._id_6294 / var_1;

    if ( self._id_1B44 > self._id_6294 )
        self._id_1B44 = self._id_6294;
}

_id_519A( var_0 )
{
    if ( !level._id_7137 )
        return 0;

    if ( var_0._id_1B44 > level._id_6C6D )
        return 1;

    return 0;
}

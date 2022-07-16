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
        maps\mp\_utility::_id_72F7( level._id_01B3, 1, 0, 9 );
        maps\mp\_utility::_id_72F9( level._id_01B3, 3 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 0 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 3 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 2 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
    }

    maps\mp\_utility::_id_7FD9( 3 );
    level._id_62F8 = 1;
    level._id_91EB = 1;
    level._id_64DA = ::_id_64DA;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64E9 = ::_id_64E9;
    level._id_6466 = ::_id_6466;
    level._id_64F0 = ::_id_64F0;
    level._id_64BF = ::_id_64BF;

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    level.dd = 1;
    level.bombsplanted = 0;
    level.ddbombmodel = [] setbombtimerdvar();
    setuibombtimer( "_a", 0 );
    setuibombtimer( "_b", 0 );
    game["dialog"]["gametype"] = "dmo_intro";
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    var_0 = _func_13D( "demData", "roundLength" );
    setdynamicdvar( "scr_dd_timelimit", var_0 );
    maps\mp\_utility::_id_72F9( "dd", var_0 );
    var_1 = _func_13D( "demData", "roundSwitch" );
    setdynamicdvar( "scr_dd_roundswitch", var_1 );
    maps\mp\_utility::_id_72F7( "dd", var_1, 0, 9 );
    setdynamicdvar( "scr_dd_bombtimer", _func_13D( "demData", "bombTimer" ) );
    setdynamicdvar( "scr_dd_planttime", _func_13D( "demData", "plantTime" ) );
    setdynamicdvar( "scr_dd_defusetime", _func_13D( "demData", "defuseTime" ) );
    setdynamicdvar( "scr_dd_silentplant", _func_13D( "demData", "silentPlant" ) );
    level.ddtimetoadd = _func_13D( "demData", "extraTime" );
    setdynamicdvar( "scr_dd_addtime", level.ddtimetoadd );
    setdynamicdvar( "scr_dd_roundlimit", 3 );
    maps\mp\_utility::_id_72F6( "dd", 3 );
    setdynamicdvar( "scr_dd_winlimit", 2 );
    maps\mp\_utility::_id_72FE( "dd", 2 );
    setdynamicdvar( "scr_dd_halftime", 0 );
    maps\mp\_utility::_id_72EF( "dd", 0 );
}

_id_64DA()
{
    maps\mp\gametypes\common_bomb_gameobject::_id_64DA();
}

_id_64EC()
{
    if ( game["roundsPlayed"] == 2 )
        game["status"] = "overtime";

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    level._id_9C14 = 1;
    _func_161( "manual_change" );

    if ( maps\mp\_utility::_id_4E3F() )
        game["dialog"]["defense_obj"] = "obj_destroy";

    maps\mp\gametypes\common_bomb_gameobject::loadbombfx();
    maps\mp\_utility::_id_7FC5( game["attackers"], &"OBJECTIVES_DD_ATTACKER" );
    maps\mp\_utility::_id_7FC5( game["defenders"], &"OBJECTIVES_DD_DEFENDER" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::_id_7FC4( game["attackers"], &"OBJECTIVES_DD_ATTACKER" );
        maps\mp\_utility::_id_7FC4( game["defenders"], &"OBJECTIVES_DD_DEFENDER" );
    }
    else
    {
        maps\mp\_utility::_id_7FC4( game["attackers"], &"OBJECTIVES_DD_ATTACKER_SCORE" );
        maps\mp\_utility::_id_7FC4( game["defenders"], &"OBJECTIVES_DD_DEFENDER_SCORE" );
    }

    if ( maps\mp\_utility::_id_4E3F() )
    {
        maps\mp\_utility::_id_7FC3( game["attackers"], &"OBJECTIVES_DD_OVERTIME_HINT" );
        maps\mp\_utility::_id_7FC3( game["defenders"], &"OBJECTIVES_DD_OVERTIME_HINT" );
    }
    else
    {
        maps\mp\_utility::_id_7FC3( game["attackers"], &"OBJECTIVES_DD_ATTACKER_HINT" );
        maps\mp\_utility::_id_7FC3( game["defenders"], &"OBJECTIVES_DD_DEFENDER_HINT" );
    }

    _id_4E26();
    thread _id_9B22();
    thread waittoprocess();
    var_2 = maps\mp\_utility::_id_415E( "winlimit" );
    var_3[0] = "dd";
    var_3[1] = "dd_bombzone";
    var_3[2] = "blocker";
    maps\mp\gametypes\_gameobjects::main( var_3 );
    thread _id_1549();
}

_id_4E26()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_082F( game["defenders"], "mp_dd_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_dd_spawn_defender_start" );
    maps\mp\gametypes\_spawnlogic::_id_082F( game["attackers"], "mp_dd_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_dd_spawn_attacker_start" );
    level.spawn_defenders = [];
    level.spawn_defenders_a = [];
    level.spawn_defenders_a = [];
    level.spawn_defenders_b = [];
    level.spawn_defenders_b = [];
    level.spawn_attackers = [];
    level.spawn_attackers_a = [];
    level.spawn_attackers_a = [];
    level.spawn_attackers_b = [];
    level.spawn_attackers_b = [];
    var_0 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_dd_spawn" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_0398 ) )
        {
            spawnpointerror( var_2 );
            continue;
        }

        switch ( var_2._id_0398 )
        {
            case "defender":
                level.spawn_defenders[level.spawn_defenders.size] = var_2;
                level.spawn_defenders_a[level.spawn_defenders_a.size] = var_2;
                level.spawn_defenders_b[level.spawn_defenders_b.size] = var_2;
                continue;
            case "defender_a":
                level.spawn_defenders_a[level.spawn_defenders_a.size] = var_2;
                continue;
            case "defender_b":
                level.spawn_defenders_b[level.spawn_defenders_b.size] = var_2;
                continue;
            case "attacker":
                level.spawn_attackers[level.spawn_attackers.size] = var_2;
                level.spawn_attackers_a[level.spawn_attackers_a.size] = var_2;
                level.spawn_attackers_b[level.spawn_attackers_b.size] = var_2;
                continue;
            case "attacker_a":
                level.spawn_attackers_a[level.spawn_attackers_a.size] = var_2;
                continue;
            case "attacker_b":
                level.spawn_attackers_b[level.spawn_attackers_b.size] = var_2;
                continue;
            default:
                spawnpointerror( var_2 );
                continue;
        }
    }

    if ( maps\mp\_utility::_id_5092( level.dd_flip_respawns ) )
    {
        var_4 = level.spawn_defenders;
        level.spawn_defenders = level.spawn_attackers;
        level.spawn_attackers = var_4;
        var_4 = level.spawn_defenders_a;
        level.spawn_defenders_a = level.spawn_attackers_a;
        level.spawn_attackers_a = var_4;
        var_4 = level.spawn_defenders_b;
        level.spawn_defenders_b = level.spawn_attackers_b;
        level.spawn_attackers_b = var_4;
    }

    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    level.aplanted = 0;
    level.bplanted = 0;
    _func_141( level._id_5986 );
}

spawnpointerror( var_0 )
{

}

waittoprocess()
{
    level endon( "game_end" );

    for (;;)
    {
        if ( level._id_4C6D == 0 )
            break;

        wait 0.05;
    }

    level._id_9C14 = 0;
}

_id_40D2()
{
    var_0 = self._id_0308["team"];

    if ( level._id_9C14 )
    {
        if ( var_0 == game["attackers"] )
            var_1 = maps\mp\gametypes\_spawnlogic::getrandomstartspawn( "mp_dd_spawn_attacker_start" );
        else
            var_1 = maps\mp\gametypes\_spawnlogic::getrandomstartspawn( "mp_dd_spawn_defender_start" );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( maps\mp\_utility::_id_4E3F() )
            var_2 = level.spawn_attackers;
        else if ( !level.aplanted && !level.bplanted )
            var_2 = level.spawn_attackers;
        else if ( level.aplanted && !level.bplanted )
            var_2 = level.spawn_attackers_a;
        else if ( level.bplanted && !level.aplanted )
            var_2 = level.spawn_attackers_b;
        else
            var_2 = level.spawn_attackers;

        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( var_2 );
    }
    else
    {
        if ( maps\mp\_utility::_id_4E3F() )
            var_2 = level.spawn_defenders;
        else if ( !level.aplanted && !level.bplanted )
            var_2 = level.spawn_defenders;
        else if ( level.aplanted && !level.bplanted )
            var_2 = level.spawn_defenders_a;
        else if ( level.bplanted && !level.aplanted )
            var_2 = level.spawn_defenders_b;
        else
            var_2 = level.spawn_defenders;

        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( var_2 );
    }

    return var_1;
}

_id_64E9()
{
    if ( maps\mp\_utility::_id_4E3F() || self._id_0308["team"] == game["attackers"] )
    {
        self._id_5174 = 0;
        self._id_50EF = 0;
        self._id_50C8 = 1;
    }
    else
    {
        self._id_5174 = 0;
        self._id_50EF = 0;
        self._id_50C8 = 0;
    }

    self _meth_82F8( "ui_carrying_bomb", self._id_50C8 );
    maps\mp\_utility::_id_7F6B( 0 );

    if ( isdefined( self._id_0308["plants"] ) )
        maps\mp\_utility::_id_7F6B( self._id_0308["plants"] );

    maps\mp\_utility::_id_7F6C( 0 );

    if ( isdefined( self._id_0308["defuses"] ) )
        maps\mp\_utility::_id_7F6C( self._id_0308["defuses"] );

    level notify( "spawned_player" );
}

dd_endgame( var_0, var_1 )
{
    if ( var_0 == "tie" )
        level._id_374D = "none";
    else
        level._id_374D = var_0;

    thread maps\mp\gametypes\_gamelogic::_id_315F( var_0, var_1 );
}

_id_6466( var_0 )
{
    if ( level._id_1540 || level._id_1536 )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_1545 )
            dd_endgame( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
        else
            dd_endgame( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level._id_1545 )
            return;

        level thread dd_endgame( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread dd_endgame( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

_id_64BF( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::_id_40C1( "kill" );
    var_4 = var_0._id_04A7;

    if ( game["state"] == "postgame" && ( var_0._id_04A7 == game["defenders"] || !level._id_1545 ) )
        var_1._id_373E = 1;

    if ( var_0._id_5174 || var_0._id_50EF )
    {
        var_1 thread maps\mp\_events::_id_27AE( var_0, var_2 );

        if ( var_0._id_5174 )
            var_1 maps\mp\gametypes\_misions::_id_6FF6( "ch_" + level._id_01B3 + "_interrupt" );

        if ( var_0._id_50EF )
            var_1 maps\mp\gametypes\_misions::_id_6FF6( "ch_" + level._id_01B3 + "_protector" );
    }
}

_id_64F0()
{
    if ( maps\mp\_utility::_id_4E3F() )
        dd_endgame( "tie", game["end_reason"]["time_limit_reached"] );
    else
        dd_endgame( game["defenders"], game["end_reason"]["time_limit_reached"] );
}

_id_9B22()
{
    level._id_688D = maps\mp\_utility::_id_2FCF( "planttime", 5, 0, 20 );
    level._id_27BF = maps\mp\_utility::_id_2FCF( "defusetime", 5, 0, 20 );
    level._id_1551 = maps\mp\_utility::_id_2FD0( "bombtimer", 45, 1, 300 );
    level.ddtimetoadd = maps\mp\_utility::_id_2FCF( "addtime", 2, 0, 5 );
    level._id_8572 = maps\mp\_utility::_id_2FD0( "silentplant", 0, 0, 1 );
}

verifybombzones( var_0 )
{
    var_1 = "";

    if ( var_0.size != 3 )
    {
        var_2 = 0;
        var_3 = 0;
        var_4 = 0;

        foreach ( var_6 in var_0 )
        {
            if ( _func_120( _func_123( var_6._id_0394 ), "a" ) )
            {
                var_2 = 1;
                continue;
            }

            if ( _func_120( _func_123( var_6._id_0394 ), "b" ) )
            {
                var_3 = 1;
                continue;
            }

            if ( _func_120( _func_123( var_6._id_0394 ), "c" ) )
                var_4 = 1;
        }

        if ( !var_2 )
            var_1 += " A ";

        if ( !var_3 )
            var_1 += " B ";

        if ( !var_4 )
            var_1 += " C ";
    }

    if ( var_1 != "" )
        return;
}

_id_1549()
{
    waitframe;
    level._id_1545 = 0;
    level._id_1536 = 0;
    level._id_1540 = 0;
    level._id_1555 = [];
    var_0 = getentarray( "dd_bombzone", "targetname" );
    verifybombzones( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_3 = getentarray( var_2._id_04A4, "targetname" );
        var_4 = getent( var_3[0]._id_04A4, "targetname" );
        var_5 = var_2._id_0394;
        var_6 = getent( "dd_bombzone_clip" + var_5, "targetname" );

        if ( maps\mp\_utility::_id_4E3F() )
        {
            if ( var_5 == "_a" || var_5 == "_b" )
            {
                var_2 delete();
                var_3[0] delete();
                var_4 delete();
                var_6 delete();
                continue;
            }

            var_2._id_0394 = "_a";
            var_7 = maps\mp\gametypes\common_bomb_gameobject::createbombzoneobject( "neutral", "any", "any", var_2, level.ddbomb, 0 );
            maps\mp\_utility::_id_7FAE( var_7, "waypoint_targetneutral" );
        }
        else
        {
            if ( var_5 == "_c" )
            {
                var_2 delete();
                var_3[0] delete();
                var_4 delete();
                var_6 delete();
                continue;
            }

            var_7 = maps\mp\gametypes\common_bomb_gameobject::createbombzoneobject( game["defenders"], "enemy", "any", var_2, level.ddbomb, 1 );

            if ( game["defenders"] == "allies" )
                maps\mp\_utility::_id_7FAE( var_7, "waypoint_esports_sab_target_axis" );
            else
                maps\mp\_utility::_id_7FAE( var_7, "waypoint_esports_sab_target_allies" );
        }

        var_7._id_6454 = ::_id_6454;
        var_7._id_648E = ::_id_648E;
        var_7._id_64F8 = ::onuseobject;
        var_7._id_6459 = ::_id_6459;
        level._id_1555[level._id_1555.size] = var_7;
    }
}

onuseobject( var_0 )
{
    var_1 = var_0._id_0308["team"];
    var_2 = level._id_65B3[var_1];

    if ( maps\mp\_utility::_id_4E3F() && self.bombplantedon == 0 || !maps\mp\_utility::_id_4E3F() && !maps\mp\gametypes\_gameobjects::_id_510F( var_0._id_0308["team"] ) )
    {
        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerplantbomb( 0, var_1, var_2 );

        if ( game["defenders"] == "allies" )
            maps\mp\_utility::_id_7FAE( self, "waypoint_esports_sab_planted_axis" );
        else
            maps\mp\_utility::_id_7FAE( self, "waypoint_esports_sab_planted_allies" );

        level thread _id_1545( self, var_0 );
    }
    else
    {
        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerdefusebomb( "defuse", var_1, var_2 );

        if ( game["defenders"] == "allies" )
            maps\mp\_utility::_id_7FAE( self, "waypoint_esports_sab_target_axis" );
        else
            maps\mp\_utility::_id_7FAE( self, "waypoint_esports_sab_target_allies" );

        level thread _id_1536( self );
    }
}

_id_6454( var_0 )
{
    if ( maps\mp\_utility::_id_4E3F() && self.bombplantedon == 1 || !maps\mp\_utility::_id_4E3F() && maps\mp\gametypes\_gameobjects::_id_510F( var_0._id_0308["team"] ) )
    {
        var_1 = var_0 getclosestbombmodel();
        maps\mp\gametypes\common_bomb_gameobject::onbegindefusebomb( var_0, var_1 );
    }
    else
        maps\mp\gametypes\common_bomb_gameobject::onbeginplantbomb( var_0 );
}

getclosestbombmodel()
{
    var_0 = 9000000;
    var_1 = undefined;

    if ( isdefined( level.ddbombmodel ) )
    {
        foreach ( var_3 in level.ddbombmodel )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_4 = _func_0F0( self._id_02E2, var_3._id_02E2 );

            if ( var_4 < var_0 )
            {
                var_0 = var_4;
                var_1 = var_3;
            }
        }
    }

    return var_1;
}

_id_648E( var_0, var_1, var_2 )
{
    var_3 = isdefined( var_1 ) && var_1._id_50EF && !var_2;
    maps\mp\gametypes\common_bomb_gameobject::onendusebomb( var_1, var_3 );
}

_id_6459( var_0 )
{
    var_0 _meth_826A( &"MP_BOMBSITE_IN_USE" );
}

_id_64E0()
{

}

_id_1545( var_0, var_1 )
{
    var_0 endon( "defused" );
    level.bombsplanted += 1;
    var_2 = var_1._id_04A7;
    setbombtimerdvar();
    level._id_1545 = 1;

    if ( var_0._id_0241 == "_a" )
        level.aplanted = 1;
    else
        level.bplanted = 1;

    dropbombmodel( var_1, var_0._id_0241 );

    if ( maps\mp\_utility::_id_4E3F() )
        var_0 maps\mp\gametypes\_gameobjects::_id_7FDA( level._id_65B3[var_1._id_04A7] );

    var_0 maps\mp\gametypes\common_bomb_gameobject::setupzonefordefusing( !maps\mp\_utility::_id_4E3F() );
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombplanted( level.ddbombmodel[var_0._id_0241]._id_02E2 + ( 0, 0, 1 ) );
    var_0 _id_1552( var_0 );
    maps\mp\_utility::_id_7FAE( var_0, undefined );
    var_0._id_9345 maps\mp\gametypes\common_bomb_gameobject::_id_8F06();
    level.bombsplanted -= 1;

    if ( var_0._id_0241 == "_a" )
        level.aplanted = 0;
    else
        level.bplanted = 0;

    var_0 restarttimer();
    var_0 setbombtimerdvar();
    setuibombtimer( var_0._id_0241, 0 );

    if ( level._id_3BDA )
        return;

    level notify( "bomb_exploded" + var_0._id_0241 );
    level._id_1540 += 1;
    var_3 = var_0._id_24C8;
    level.ddbombmodel[var_0._id_0241] delete();
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombexploded( var_3, 200, var_1 );
    var_0 maps\mp\gametypes\_gameobjects::_id_2B1E();
    var_4 = 0;

    if ( !maps\mp\_utility::_id_4E3F() && level._id_1540 < 2 && level.ddtimetoadd > 0 )
    {
        var_5 = maps\mp\_utility::_id_412B();

        if ( var_5 > 0 )
        {
            maps\mp\_utility::_id_7FD8( "timelimit", maps\mp\_utility::_id_415E( "timelimit" ) + level.ddtimetoadd );

            foreach ( var_7 in level._id_0323 )
                var_7 thread maps\mp\gametypes\_hud_message::_id_8A68( "time_added" );

            var_4 = 1;
        }
    }

    var_9 = maps\mp\_utility::_id_4E3F() || level._id_1540 > 1;

    if ( var_9 )
    {
        _func_142( 0 );
        level._id_9366 = 1;
    }

    wait 2;

    if ( var_9 )
        dd_endgame( var_2, game["end_reason"]["target_destroyed"] );
    else if ( var_4 )
        level thread maps\mp\_utility::_id_91FA( "callout_time_added", var_1 );
}

setbombtimerdvar()
{
    if ( level.bombsplanted == 1 )
        setomnvar( "ui_bomb_timer", 2 );
    else if ( level.bombsplanted == 2 )
        setomnvar( "ui_bomb_timer", 3 );
    else
        setomnvar( "ui_bomb_timer", 0 );
}

dropbombmodel( var_0, var_1 )
{
    var_2 = _func_06B( var_0._id_02E2 + ( 0, 0, 20 ), var_0._id_02E2 - ( 0, 0, 2000 ), 0, var_0 );
    var_3 = _func_0B3( 360 );
    var_4 = ( _func_0B7( var_3 ), _func_0B6( var_3 ), 0 );
    var_4 = _func_114( var_4 - var_2["normal"] * _func_0F6( var_4, var_2["normal"] ) );
    var_5 = _func_115( var_4 );
    level.ddbombmodel[var_1] = spawn( "script_model", var_2["position"] );
    level.ddbombmodel[var_1].angles = var_5;
    level.ddbombmodel[var_1] _meth_80B3( "wpn_h1_briefcase_bomb_npc" );
}

restarttimer()
{
    if ( level.bombsplanted <= 0 )
    {
        maps\mp\gametypes\_gamelogic::_id_74BC();
        level._id_9370 = gettime() - level.timepausestart;
        level._id_9366 = 0;
    }
}

_id_1552( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" + var_0._id_0241 );

    if ( maps\mp\_utility::_id_4E3F() )
        var_0.waittime = level._id_1551;
    else
        var_0.waittime = level._id_1551;

    level thread _id_9AEB( var_0 );

    while ( var_0.waittime >= 0 )
    {
        var_0.waittime--;

        if ( var_0.waittime >= 0 )
            wait 1;

        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_9AEB( var_0 )
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "bomb_defused" + var_0._id_0241 );
    level endon( "bomb_exploded" + var_0._id_0241 );
    var_1 = var_0.waittime * 1000 + gettime();
    setuibombtimer( var_0._id_0241, var_1 );
    level waittill( "host_migration_begin" );
    var_2 = maps\mp\gametypes\_hostmigration::_id_A0DD();

    if ( var_2 > 0 )
        setuibombtimer( var_0._id_0241, var_1 + var_2 );
}

_id_1536( var_0 )
{
    var_0.bombplantedon = 0;
    var_0 notify( "defused" );
    var_0._id_9345 maps\mp\gametypes\common_bomb_gameobject::_id_8F06();
    level.bombsplanted -= 1;
    var_0 restarttimer();
    setbombtimerdvar();
    setuibombtimer( var_0._id_0241, 0 );
    level notify( "bomb_defused" + var_0._id_0241 );
    level.ddbombmodel[var_0._id_0241] delete();

    if ( maps\mp\_utility::_id_4E3F() )
    {
        var_0 maps\mp\gametypes\_gameobjects::_id_7FDA( "neutral" );
        var_0 maps\mp\gametypes\common_bomb_gameobject::resetbombzone( level.ddbomb, "any", "any", 0 );
    }
    else
        var_0 maps\mp\gametypes\common_bomb_gameobject::resetbombzone( level.ddbomb, "enemy", "any", 1 );
}

setuibombtimer( var_0, var_1 )
{
    if ( var_0 == "_a" )
        setomnvar( "ui_bomb_timer_endtime", var_1 );
    else
        setomnvar( "ui_bomb_timer_endtime_2", var_1 );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_64DA()
{
    maps\mp\gametypes\common_bomb_gameobject::_id_64DA();
}

_id_9B22()
{
    level._id_688D = maps\mp\_utility::_id_2FCF( "planttime", 5, 0, 20 );
    level._id_27BF = maps\mp\_utility::_id_2FCF( "defusetime", 5, 0, 20 );
    level._id_1551 = maps\mp\_utility::_id_2FCF( "bombtimer", 45, 1, 300 );
    level._id_5FE2 = maps\mp\_utility::_id_2FD0( "multibomb", 0, 0, 1 );
    level._id_8572 = maps\mp\_utility::_id_2FD0( "silentplant", 0, 0, 1 );
}

_id_517B( var_0 )
{
    if ( isdefined( level._id_1555 ) )
    {
        foreach ( var_2 in level._id_1555 )
        {
            if ( _func_0F0( self._id_02E2, var_2._id_04C5._id_02E2 ) < 4096 )
                return 0;
        }
    }

    return 1;
}

_id_64BF( var_0, var_1, var_2 )
{
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

    if ( waseliminatedbyenemy( var_0, var_1 ) )
    {
        var_3 = _id_5140( var_1 );
        var_1 thread maps\mp\_events::_id_305C( var_3, var_0 );
    }
}

waseliminatedbyenemy( var_0, var_1 )
{
    if ( maps\mp\gametypes\_damage::_id_510E( var_0, var_1 ) )
        return 0;

    if ( var_0 maps\mp\gametypes\_playerlogic::_id_5A62() )
        return 0;

    return 1;
}

_id_64C2( var_0 )
{
    maps\mp\gametypes\common_bomb_gameobject::oncarrybombpickup( var_0, game["attackers"] );

    if ( var_0._id_04A7 == "allies" )
        var_0._id_02D2 = 1;
    else
        var_0._id_02D2 = 2;

    if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_0._id_04A7] ) )
    {
        var_0.isrespawningwithbombcarrierclass = 1;
        var_0 thread maps\mp\_utility::applycarrierclass();
    }

    if ( !level._id_1536 )
    {
        maps\mp\_utility::_id_91FA( "callout_bombtaken", var_0, var_0._id_04A7 );
        maps\mp\_utility::_id_564B( "bomb_taken", var_0._id_0308["team"] );
    }
}

_id_1549()
{
    level._id_1545 = 0;
    level._id_1536 = 0;
    level._id_1540 = 0;
    var_0 = getent( "sd_bomb_pickup_trig", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        common_scripts\utility::_id_334F( "No sd_bomb_pickup_trig trigger found in map." );
        return;
    }

    var_1 = maps\mp\gametypes\common_bomb_gameobject::getcarrybombvisuals( "sd_bomb" );

    if ( !isdefined( var_1 ) )
    {
        common_scripts\utility::_id_334F( "No sd_bomb script_model found in map." );
        return;
    }

    if ( !level._id_5FE2 )
    {
        level._id_7B74 = maps\mp\gametypes\common_bomb_gameobject::createbombcarryobject( game["attackers"], "friendly", var_0, var_1 );
        thread maps\mp\_utility::streamcarrierweaponstoplayers( level._id_7B74, [ game["attackers"] ], ::shouldstreamcarrierclasstoplayer );

        if ( game["attackers"] == "allies" )
            maps\mp\_utility::_id_7FAE( level._id_7B74, "waypoint_bomb_green" );
        else
            maps\mp\_utility::_id_7FAE( level._id_7B74, "waypoint_bomb_red" );

        level._id_7B74._id_64C2 = ::_id_64C2;
        level._id_7B74._id_646F = ::_id_646F;
    }
    else
    {
        var_0 delete();
        var_1[0] delete();
    }

    level._id_1555 = [];
    var_2 = getentarray( "bombzone", "targetname" );
    var_3 = getentarray( "bombzone_augmented", "targetname" );

    if ( maps\mp\_utility::_id_50C4() )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = var_3[var_4]._id_0394;

            for ( var_6 = 0; var_6 < var_2.size; var_6++ )
            {
                if ( var_2[var_6]._id_0394 == var_5 )
                {
                    _id_7397( var_2[var_6] );
                    break;
                }
            }
        }
    }
    else
    {
        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
            _id_7397( var_3[var_7] );
    }

    var_2 = common_scripts\utility::_id_0CDD( var_2, var_3 );

    for ( var_7 = 0; var_7 < var_2.size; var_7++ )
    {
        var_0 = var_2[var_7];
        var_1 = getentarray( var_2[var_7]._id_04A4, "targetname" );
        var_8 = undefined;

        if ( !level._id_5FE2 )
            var_8 = level._id_7B74;

        var_9 = maps\mp\gametypes\common_bomb_gameobject::createbombzoneobject( game["defenders"], "enemy", "any", var_0, var_8, 1 );
        maps\mp\_utility::_id_7FAE( var_9, "waypoint_esports_snd_target" + var_9._id_0241 + "_white" );
        var_9._id_6454 = ::_id_6454;
        var_9._id_648E = ::_id_648E;
        var_9._id_64F8 = ::_id_64FB;
        var_9._id_6459 = ::_id_6459;
        level._id_1555[level._id_1555.size] = var_9;
        var_9._id_1538 = getent( var_1[0]._id_04A4, "targetname" );
        var_9._id_1538._id_02E2 += ( 0, 0, -10000 );
        var_9._id_1538._id_0241 = var_9._id_0241;
        var_9._id_1538 _meth_852A( 1 );
    }

    for ( var_7 = 0; var_7 < level._id_1555.size; var_7++ )
    {
        var_10 = [];

        for ( var_11 = 0; var_11 < level._id_1555.size; var_11++ )
        {
            if ( var_11 != var_7 )
                var_10[var_10.size] = level._id_1555[var_11];
        }

        level._id_1555[var_7]._id_65B1 = var_10;
    }

    setomnvar( "ui_mlg_game_mode_status_1", 0 );
}

shouldstreamcarrierclasstoplayer( var_0, var_1 )
{
    if ( level._id_1545 )
        return 0;

    if ( isdefined( var_0._id_1BAF ) && var_0._id_1BAF == var_1 )
        return 0;

    return 1;
}

_id_7397( var_0 )
{
    var_1 = getentarray( "script_brushmodel", "classname" );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3._id_79F4 ) || var_3._id_79F4 != "bombzone" )
            continue;

        if ( !isdefined( var_3._id_0394 ) )
            continue;

        if ( _func_120( var_3._id_0394, var_0._id_0394 ) && _func_120( var_3._id_0394, var_0._id_04A6 ) )
            var_3 delete();
    }

    var_5 = getentarray( var_0._id_04A4, "targetname" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7._id_04A4 ) )
        {
            var_8 = getentarray( var_7._id_04A4, "targetname" );

            foreach ( var_10 in var_8 )
                var_10 delete();
        }

        var_7 delete();
    }

    var_0 delete();
}

_id_64FB( var_0 )
{
    if ( !maps\mp\gametypes\_gameobjects::_id_510F( var_0._id_0308["team"] ) )
    {
        level thread _id_1545( self, var_0 );

        for ( var_1 = 0; var_1 < level._id_1555.size; var_1++ )
        {
            if ( level._id_1555[var_1] == self )
            {
                var_2 = level._id_1555[var_1] maps\mp\gametypes\_gameobjects::_id_3FFA();
                maps\mp\_utility::_id_7FAE( level._id_1555[var_1], "waypoint_esports_snd_planted" + var_2 );
                continue;
            }

            level._id_1555[var_1] maps\mp\gametypes\_gameobjects::_id_2B1E();
            maps\mp\_utility::_id_7FAE( level._id_1555[var_1], undefined );
        }

        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerplantbomb( 1, game["attackers"], game["defenders"] );

        if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_0._id_04A7] ) )
        {
            var_0 thread maps\mp\_utility::removecarrierclass();
            return;
        }
    }
    else
        self.bombplantedon = 0;
}

_id_6454( var_0 )
{
    if ( maps\mp\gametypes\_gameobjects::_id_510F( var_0._id_0308["team"] ) )
        maps\mp\gametypes\common_bomb_gameobject::onbegindefusebomb( var_0, level._id_7B75 );
    else
    {
        maps\mp\gametypes\common_bomb_gameobject::onbeginplantbomb( var_0 );

        if ( level._id_5FE2 )
        {
            for ( var_1 = 0; var_1 < self._id_65B1.size; var_1++ )
            {
                self._id_65B1[var_1] maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
                self._id_65B1[var_1] maps\mp\gametypes\_gameobjects::_id_8352( "friendly" );
            }
        }
    }
}

_id_648E( var_0, var_1, var_2 )
{
    if ( var_1._id_5174 && level._id_5FE2 && !var_2 )
    {
        for ( var_3 = 0; var_3 < self._id_65B1.size; var_3++ )
        {
            self._id_65B1[var_3] maps\mp\gametypes\_gameobjects::_id_0AB2( "enemy" );
            self._id_65B1[var_3] maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        }
    }

    var_4 = isdefined( var_1 ) && var_1._id_50EF && !var_2;
    maps\mp\gametypes\common_bomb_gameobject::onendusebomb( var_1, var_4 );
}

_id_1546( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 _meth_807E( level._id_7B75 );
    var_0 _meth_8083();

    while ( var_0 _meth_830E() == self._id_9C1C )
        waittillframeend;

    var_0 _meth_8051();
}

_id_1545( var_0, var_1 )
{
    level._id_1545 = 1;
    var_1._id_02D2 = 0;
    level._id_27BB = _func_0BC( gettime() + level._id_1551 * 1000 );
    _func_142( level._id_27BB );
    setomnvar( "ui_bomb_timer", 1 );

    if ( !level._id_5FE2 )
    {
        level._id_7B74 maps\mp\gametypes\_gameobjects::_id_0AA1( "none" );
        level._id_7B74 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
        maps\mp\_utility::_id_7FAE( level._id_7B74, undefined );
        level._id_7B74 maps\mp\gametypes\_gameobjects::_id_7F5D();
        level._id_7B75 = level._id_7B74._id_9E9C[0];
    }
    else
    {
        level._id_7B75 = spawn( "script_model", var_1._id_02E2 );
        level._id_7B75.angles = var_1.angles;
        level._id_7B75 _meth_80B3( "wpn_h1_briefcase_bomb_npc" );
    }

    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombplanted( level._id_7B75._id_02E2 + ( 0, 0, 1 ) );
    var_0 maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
    var_0 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    var_2 = var_0 maps\mp\gametypes\_gameobjects::_id_3FFA();
    var_3 = var_0._id_1538;
    var_3._id_02E2 = level._id_7B75._id_02E2;
    var_4 = [];
    var_5 = maps\mp\gametypes\_gameobjects::_id_244C( game["defenders"], var_3, var_4, ( 0, 0, 32 ) );
    var_5._id_0241 = var_2;
    var_5 maps\mp\gametypes\common_bomb_gameobject::setupzonefordefusing( 1 );
    var_5._id_6454 = ::_id_6454;
    var_5._id_648E = ::_id_648E;
    var_5._id_64F8 = ::_id_64FA;
    var_5._id_6242 = 1;
    var_5._id_4B53 = "defuseObject";

    if ( var_2 == "_a" || var_2 == "_A" )
        setomnvar( "ui_mlg_game_mode_status_1", 1 );
    else if ( var_2 == "_b" || var_2 == "_B" )
        setomnvar( "ui_mlg_game_mode_status_1", 2 );

    _id_1552( var_5 isbombsiteb() );
    setomnvar( "ui_bomb_timer", 0 );
    setbombendtime( 0, var_5 isbombsiteb() );
    var_0._id_9345 maps\mp\gametypes\common_bomb_gameobject::_id_8F06();

    if ( level._id_3BDA || level._id_1536 )
        return;

    level._id_1540 = 1;
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    var_6 = level._id_7B75._id_02E2;
    var_6 += ( 0, 0, 10 );
    level._id_7B75 _meth_8056();
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombexploded( var_6, 300, var_1 );

    for ( var_7 = 0; var_7 < level._id_1555.size; var_7++ )
        level._id_1555[var_7] maps\mp\gametypes\_gameobjects::_id_2B1E();

    var_5 maps\mp\gametypes\_gameobjects::_id_2B1E();
    _func_142( 0 );
    wait 3;
    _id_7B56( game["attackers"], game["end_reason"]["target_destroyed"] );
}

isbombsiteb()
{
    return self._id_0241 == "_b" || self._id_0241 == "_B";
}

setbombendtime( var_0, var_1 )
{
    if ( var_1 )
        setomnvar( "ui_bomb_timer_endtime_2", var_0 );
    else
        setomnvar( "ui_bomb_timer_endtime", var_0 );
}

_id_1552( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    var_1 = _func_0BC( level._id_1551 * 1000 + gettime() );
    setbombendtime( var_1, var_0 );
    level thread _id_4663( var_1, var_0 );
    maps\mp\gametypes\_hostmigration::_id_A051( level._id_1551 );
}

_id_4663( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    setbombendtime( 0, var_1 );
    var_2 = maps\mp\gametypes\_hostmigration::_id_A0DD();

    if ( var_2 > 0 )
        setbombendtime( var_0 + var_2, var_1 );
}

_id_646F( var_0 )
{
    maps\mp\gametypes\common_bomb_gameobject::oncarrybombdrop( game["attackers"], game["defenders"] );
}

_id_64FA( var_0 )
{
    var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerdefusebomb( getdefusetype( var_0 ), game["defenders"], game["attackers"] );
    thread _id_1536( isbombsiteb() );
}

getdefusetype( var_0 )
{
    var_1 = "defuse";

    if ( isdefined( level._id_1544 ) && maps\mp\_utility::_id_5189( level._id_1544 ) )
        var_1 = "ninja_defuse";

    if ( _id_5140( var_0 ) )
        var_1 = "last_man_defuse";

    return var_1;
}

_id_5140( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 == var_0 )
            continue;

        if ( var_2 maps\mp\gametypes\_playerlogic::_id_5A62() )
            return 0;

        if ( maps\mp\_utility::_id_5189( var_2 ) )
            return 0;
    }

    return 1;
}

_id_1536( var_0 )
{
    maps\mp\gametypes\_gameobjects::_id_2B1E();
    level._id_1536 = 1;
    setbombendtime( 0, var_0 );
    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    level notify( "bomb_defused" );
    wait 1.5;
    _func_142( 0 );
    _id_7B56( game["defenders"], game["end_reason"]["bomb_defused"] );
}

_id_6459( var_0 )
{
    var_0 _meth_826A( &"MP_CANT_PLANT_WITHOUT_BOMB" );
}

_id_64F0()
{
    _id_7B56( game["defenders"], game["end_reason"]["time_limit_reached"] );
}

_id_7B56( var_0, var_1 )
{
    level._id_374D = var_0;

    if ( var_0 == game["attackers"] )
    {
        if ( !isdefined( game["attackerWinCount"] ) )
            game["attackerWinCount"] = 0;

        game["attackerWinCount"]++;
    }
    else if ( var_0 == game["defenders"] )
    {
        if ( !isdefined( game["defenderWinCount"] ) )
            game["defenderWinCount"] = 0;

        game["defenderWinCount"]++;
    }

    if ( var_1 == game["end_reason"]["target_destroyed"] || var_1 == game["end_reason"]["bomb_defused"] )
    {
        var_2 = 1;

        foreach ( var_4 in level._id_1555 )
        {
            if ( isdefined( level._id_3743[var_0] ) && level._id_3743[var_0] == var_4._id_534E )
            {
                var_2 = 0;
                break;
            }
        }

        if ( var_2 )
            maps\mp\gametypes\_damage::_id_334E();
    }

    maps\mp\gametypes\_gamescores::_id_420C( var_0, 1 );
    thread maps\mp\gametypes\_gamelogic::_id_315F( var_0, var_1 );
}

_id_1CF1()
{
    wait 0.05;
    var_0 = 0;

    if ( !level._id_09DD[game["attackers"]] )
    {
        level._id_8A4A[game["attackers"]]._id_0AA7 = 1;
        var_0 = 1;
    }

    if ( !level._id_09DD[game["defenders"]] )
    {
        level._id_8A4A[game["defenders"]]._id_0AA7 = 1;
        var_0 = 1;
    }

    if ( var_0 )
        maps\mp\gametypes\_spectating::_id_9B72();
}

onplayerdisconnect()
{
    level endon( "game_ended" );
    self notify( "onPlayerDisconnect" );
    self endon( "onPlayerDisconnect" );
    self waittill( "disconnect" );
    thread _id_1CF1();
}

_id_6466( var_0 )
{
    if ( level._id_1540 || level._id_1536 )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_1545 )
            _id_7B56( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
        else
            _id_7B56( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level._id_1545 )
            return;

        level thread _id_7B56( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread _id_7B56( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

_id_64C0( var_0 )
{
    if ( level._id_1540 || level._id_1536 )
        return;

    var_1 = maps\mp\_utility::_id_3FFC( var_0 );
    var_1 thread _id_41F0();
}

_id_41F0()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_A0ED( 3 );
    var_0 = maps\mp\_utility::_id_4067( self._id_0308["team"] );
    level thread maps\mp\_utility::_id_91FA( "callout_lastteammemberalive", self, self._id_0308["team"] );
    level thread maps\mp\_utility::_id_91FA( "callout_lastenemyalive", self, var_0 );
    level notify( "last_alive", self );
    maps\mp\gametypes\_misions::_id_55BC();
}

_id_64E0()
{

}

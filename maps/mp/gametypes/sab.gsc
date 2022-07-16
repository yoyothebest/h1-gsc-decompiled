// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::_id_8301();
    maps\mp\gametypes\_globallogic::_id_8301();
    level._id_62F8 = 1;
    level._id_91EB = 1;

    if ( _func_13E() )
    {
        level._id_4DE0 = ::_id_4DE0;
        [[ level._id_4DE0 ]]();
        level thread maps\mp\_utility::_id_7307();
    }
    else
    {
        maps\mp\_utility::_id_72F7( level._id_01B3, 0, 0, 9 );
        maps\mp\_utility::_id_72F9( level._id_01B3, 10 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 0 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 0 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
        setdynamicdvar( "scr_killcount_persists", 0 );
    }

    maps\mp\_utility::setcarrierloadouts();
    level.classicgamemode = 1;

    if ( !intiebreaker() )
    {
        level._id_64DA = ::_id_64DA;
        level._id_64EC = ::_id_64EC;
        level._id_40D2 = ::_id_40D2;
        level._id_64E9 = ::_id_64E9;
        level._id_64C0 = ::_id_64C0;
        level._id_64F0 = ::_id_64F0;
        level._id_6466 = ::_id_6466;
        level._id_64BF = ::_id_64BF;
        level.overridewasonlyround = ::wasonlyroundsab;
        game["dialog"]["gametype"] = "sabotage";
        game["dialog"]["offense_obj"] = "capture_objs";
        game["dialog"]["defense_obj"] = "capture_objs";
    }
    else
    {
        level._id_64EC = ::_id_64EC;
        level._id_40D2 = ::_id_40D2;
        level._id_64E9 = ::_id_64E9;
        game["dialog"]["gametype"] = "sabotage";
        game["dialog"]["offense_obj"] = "boost";
        game["dialog"]["defense_obj"] = "boost";
        maps\mp\_utility::_id_7FD8( "numlives", 1 );
        maps\mp\_utility::_id_7FD8( "timeLimit", 0 );
    }

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    var_0 = getent( "sab_bomb_defuse_allies", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_0 = getent( "sab_bomb_defuse_axis", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    setomnvar( "ui_bomb_timer_endtime", 0 );
}

wasonlyroundsab()
{
    if ( maps\mp\_utility::_id_415E( "roundlimit" ) == 0 && maps\mp\_utility::_id_415E( "winlimit" ) == 1 )
        return 1;

    return 0;
}

intiebreaker()
{
    return maps\mp\_utility::_id_5092( game["tiebreaker"] );
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    setdynamicdvar( "scr_sab_bombtimer", _func_13D( "sabData", "bombTimer" ) );
    setdynamicdvar( "scr_sab_planttime", _func_13D( "sabData", "plantTime" ) );
    setdynamicdvar( "scr_sab_defusetime", _func_13D( "sabData", "defuseTime" ) );
    setdynamicdvar( "scr_sab_hotpotato", _func_13D( "sabData", "sharedBombTimer" ) );
    setdynamicdvar( "scr_sab_silentplant", _func_13D( "sabData", "silentPlant" ) );
    var_0 = _func_13D( "sabData", "roundSwitch" );
    setdynamicdvar( "scr_sab_roundswitch", var_0 );
    maps\mp\_utility::_id_72F7( "sab", var_0, 0, 9 );
    setdynamicdvar( "scr_sab_roundlimit", 0 );
    maps\mp\_utility::_id_72F6( "sab", 0 );
    var_1 = _func_13D( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_sab_winlimit", var_1 );
    maps\mp\_utility::_id_72FE( "sab", var_1 );
    setdynamicdvar( "scr_sab_halftime", 0 );
    maps\mp\_utility::_id_72EF( "sab", 0 );
}

_id_64DA()
{
    maps\mp\gametypes\common_bomb_gameobject::_id_64DA();
}

_id_64EC()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    _func_161( "auto_change" );

    if ( !intiebreaker() )
    {
        maps\mp\_utility::_id_7FC5( "allies", &"OBJECTIVES_SAB" );
        maps\mp\_utility::_id_7FC5( "axis", &"OBJECTIVES_SAB" );

        if ( level._id_8A7C )
        {
            maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_SAB" );
            maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_SAB" );
        }
        else
        {
            maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_SAB_SCORE" );
            maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_SAB_SCORE" );
        }

        maps\mp\_utility::_id_7FC3( "allies", &"OBJECTIVES_SAB_HINT" );
        maps\mp\_utility::_id_7FC3( "axis", &"OBJECTIVES_SAB_HINT" );
    }
    else
    {
        maps\mp\_utility::_id_7FC5( "allies", &"OBJECTIVES_WAR" );
        maps\mp\_utility::_id_7FC5( "axis", &"OBJECTIVES_WAR" );

        if ( level._id_8A7C )
        {
            maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_WAR" );
            maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_WAR" );
        }
        else
        {
            maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_WAR_SCORE" );
            maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_WAR_SCORE" );
        }

        maps\mp\_utility::_id_7FC3( "allies", &"OBJECTIVES_WAR_HINT" );
        maps\mp\_utility::_id_7FC3( "axis", &"OBJECTIVES_WAR_HINT" );
    }

    _id_4E26();

    if ( intiebreaker() )
    {
        setdvar( "bg_compassShowEnemies", 1 );
        var_0[0] = "war";
        maps\mp\gametypes\_gameobjects::main( var_0 );
        return;
    }

    var_0[0] = "sab";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    thread _id_9B22();
    thread sabotage();
    thread maps\mp\gametypes\_spectating::allowallyteamspectating();
}

_id_4E26()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_sab_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_sab_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "allies", "mp_sab_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "axis", "mp_sab_spawn" );
    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
    level.spawn_axis = [];
    level.spawn_axis_planted = [];
    level.spawn_axis_planted = [];
    level.spawn_axis_planted = [];
    level._id_88C7 = [];
    level.spawn_allies_planted = [];
    level.spawn_allies_planted = [];
    level.spawn_allies_planted = [];
    var_0 = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_sab_spawn" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_0398 ) )
        {
            spawnpointerror( var_2 );
            continue;
        }

        switch ( var_2._id_0398 )
        {
            case "axis":
                level.spawn_axis[level.spawn_axis.size] = var_2;
            case "axis_planted":
                level.spawn_axis_planted[level.spawn_axis_planted.size] = var_2;
                continue;
            case "allies":
                level._id_88C7[level._id_88C7.size] = var_2;
            case "allies_planted":
                level.spawn_allies_planted[level.spawn_allies_planted.size] = var_2;
                continue;
            default:
                spawnpointerror( var_2 );
                continue;
        }
    }
}

spawnpointerror( var_0 )
{

}

_id_40D2()
{
    var_0 = self._id_0308["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::_id_4067( var_0 );

    if ( level._id_9C14 )
        var_1 = maps\mp\gametypes\_spawnlogic::getrandomstartspawn( "mp_sab_spawn_" + var_0 + "_start" );
    else if ( isdefined( level._id_1545 ) && level._id_1545 && ( isdefined( level._id_1544 ) && var_0 == level._id_1544._id_04A7 ) )
    {
        if ( var_0 == "axis" )
            var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_axis_planted );
        else
            var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_allies_planted );
    }
    else if ( var_0 == "axis" )
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_axis );
    else
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( level._id_88C7 );

    return var_1;
}

_id_64E9()
{
    self._id_5174 = 0;
    self._id_50EF = 0;
    self._id_50C8 = 0;
    self _meth_82F8( "ui_carrying_bomb", self._id_50C8 );

    if ( intiebreaker() )
        thread setplayersuddendeathvalues();
}

_id_9B22()
{
    level._id_688D = maps\mp\_utility::_id_2FCF( "planttime", 5, 0, 20 );
    level._id_27BF = maps\mp\_utility::_id_2FCF( "defusetime", 5, 0, 20 );
    level._id_1551 = maps\mp\_utility::_id_2FCF( "bombtimer", 45, 1, 300 );
    level.hotpotato = maps\mp\_utility::_id_2FD0( "hotpotato", 1, 0, 1 );
    level._id_8572 = maps\mp\_utility::_id_2FD0( "silentplant", 0, 0, 1 );
}

sabotage()
{
    level._id_1545 = 0;
    level._id_1540 = 0;
    maps\mp\gametypes\common_bomb_gameobject::loadbombfx();
    var_0 = getent( "sab_bomb_pickup_trig", "targetname" );

    if ( !isdefined( var_0 ) )
        common_scripts\utility::_id_334F( "No sab_bomb_pickup_trig trigger found in map." );
    else
    {
        var_1 = maps\mp\gametypes\common_bomb_gameobject::getcarrybombvisuals( "sab_bomb" );

        if ( !isdefined( var_1 ) )
        {
            common_scripts\utility::_id_334F( "No sab_bomb script_model found in map." );
            return;
        }

        level._id_7749 = maps\mp\gametypes\common_bomb_gameobject::createbombcarryobject( "neutral", "any", var_0, var_1 );
        thread maps\mp\_utility::streamcarrierweaponstoplayers( level._id_7749, [ "allies", "axis" ], ::shouldstreamcarrierclasstoplayer );
        level._id_7749._id_630A = 1;
        level._id_7749._id_64C2 = ::_id_64C2;
        level._id_7749._id_646F = ::_id_646F;
        level._id_7749._id_6316["allies"].archived = 1;
        level._id_7749._id_6316["axis"].archived = 1;
        level._id_7749._id_1142 = 60.0;
        maps\mp\_utility::_id_7FAE( level._id_7749, "waypoint_bomb" );

        if ( !isdefined( getent( "sab_bomb_axis", "targetname" ) ) )
        {
            common_scripts\utility::_id_334F( "No sab_bomb_axis trigger found in map." );
            return;
        }

        if ( !isdefined( getent( "sab_bomb_allies", "targetname" ) ) )
        {
            common_scripts\utility::_id_334F( "No sab_bomb_allies trigger found in map." );
            return;
        }

        if ( game["switchedsides"] )
        {
            level._id_1555["allies"] = createbombzone( "allies", getent( "sab_bomb_axis", "targetname" ) );
            level._id_1555["axis"] = createbombzone( "axis", getent( "sab_bomb_allies", "targetname" ) );
            return;
        }

        level._id_1555["allies"] = createbombzone( "allies", getent( "sab_bomb_allies", "targetname" ) );
        level._id_1555["axis"] = createbombzone( "axis", getent( "sab_bomb_axis", "targetname" ) );
    }
}

shouldstreamcarrierclasstoplayer( var_0, var_1 )
{
    if ( var_1._id_04A7 == var_0 maps\mp\gametypes\_gameobjects::_id_4078() )
        return 0;

    return 1;
}

createbombzone( var_0, var_1 )
{
    var_2 = getentarray( var_1._id_04A4, "targetname" );
    var_3 = maps\mp\gametypes\common_bomb_gameobject::createbombzoneobject( var_0, "enemy", "none", var_1, level._id_7749, 0 );
    maps\mp\_utility::_id_7FAE( var_3, "waypoint_esports_sab_target" + var_3._id_0241 );
    var_3._id_64F8 = ::_id_64F8;
    var_3._id_6454 = ::_id_6454;
    var_3._id_648E = ::_id_648E;
    var_3._id_6459 = ::_id_6459;
    return var_3;
}

_id_6454( var_0 )
{
    if ( !maps\mp\gametypes\_gameobjects::_id_510F( var_0._id_0308["team"] ) )
        maps\mp\gametypes\common_bomb_gameobject::onbeginplantbomb( var_0 );
    else
        maps\mp\gametypes\common_bomb_gameobject::onbegindefusebomb( var_0, level.sabbombmodel );
}

_id_648E( var_0, var_1, var_2 )
{
    var_3 = isdefined( var_1 ) && var_1._id_50EF;
    maps\mp\gametypes\common_bomb_gameobject::onendusebomb( var_1, var_3 );
}

_id_64C2( var_0 )
{
    self._id_1142 = 60.0;
    level._id_9C14 = 0;
    var_1 = var_0._id_0308["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    var_3 = undefined;

    if ( var_1 == maps\mp\gametypes\_gameobjects::_id_4078() )
        var_3 = var_1;

    maps\mp\gametypes\common_bomb_gameobject::oncarrybombpickup( var_0, var_3 );
    var_0 maps\mp\_utility::_id_5655( "obj_destroy", "bomb" );
    var_4[0] = var_0;
    maps\mp\_utility::_id_564B( "bomb_taken", var_1, "bomb", var_4 );

    if ( !level._id_8A7C )
    {
        maps\mp\_utility::_id_564B( "bomb_lost", var_2, "bomb" );
        maps\mp\_utility::_id_564B( "obj_defend", var_2, "bomb" );
    }

    if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_1] ) )
        var_0 thread maps\mp\_utility::applycarrierclass();

    maps\mp\gametypes\_gameobjects::_id_7FDA( var_1 );
    maps\mp\gametypes\_gameobjects::_id_8352( "any" );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", "waypoint_target" );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", "waypoint_kill" );
    maps\mp\_utility::_id_7FAE( self, "waypoint_bomb" );
    level._id_1555[var_1] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    level._id_1555[var_2] maps\mp\gametypes\_gameobjects::_id_8352( "any" );
}

_id_646F( var_0 )
{
    if ( !level._id_1545 )
    {
        var_1 = maps\mp\gametypes\_gameobjects::_id_4078();
        maps\mp\gametypes\common_bomb_gameobject::oncarrybombdrop( var_1, level._id_65B3[var_1] );
        maps\mp\gametypes\_gameobjects::_id_7FDA( "neutral" );
        maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", "waypoint_bomb" );
        maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", "waypoint_bomb" );
        maps\mp\_utility::_id_7FAE( self, "waypoint_bomb" );
        level._id_1555["allies"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
        level._id_1555["axis"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    }
}

_id_64F8( var_0 )
{
    var_1 = var_0._id_0308["team"];
    var_2 = level._id_65B3[var_1];

    if ( !maps\mp\gametypes\_gameobjects::_id_510F( var_0._id_0308["team"] ) )
    {
        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerplantbomb( 1, var_1, var_2 );
        var_3 = maps\mp\gametypes\_gameobjects::_id_3FFA();
        maps\mp\_utility::_id_7FAE( self, "waypoint_esports_sab_planted" + var_3 );
        level thread _id_1545( self, var_0 );

        if ( isdefined( level.carrierloadouts ) && isdefined( level.carrierloadouts[var_1] ) )
        {
            var_0 thread maps\mp\_utility::removecarrierclass();
            return;
        }
    }
    else
    {
        var_0 maps\mp\gametypes\common_bomb_gameobject::onplayerdefusebomb( getdefusetype( var_0 ), var_1, var_2 );
        level thread _id_1536( self, var_0, var_1 );
    }
}

getdefusetype( var_0 )
{
    var_1 = "defuse";

    if ( isdefined( level._id_1544 ) && level._id_1544._id_1547 + 3000 + level._id_27BF * 1000 > gettime() && maps\mp\_utility::_id_5189( level._id_1544 ) )
        var_1 = "ninja_defuse";

    return var_1;
}

_id_6459( var_0 )
{
    var_0 _meth_826A( &"MP_CANT_PLANT_WITHOUT_BOMB" );
}

_id_1545( var_0, var_1 )
{
    level endon( "overtime" );
    level._id_1545 = 1;
    var_2 = var_1._id_0308["team"];
    var_0 maps\mp\gametypes\common_bomb_gameobject::setupzonefordefusing( 0 );
    level.bombplantedby = var_2;
    level._id_7749._id_1142 = undefined;
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_0AA1( "none" );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    maps\mp\_utility::_id_7FAE( level._id_7749, undefined );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_7F5D();
    level.sabbombmodel = level._id_7749._id_9E9C[0];
    setomnvar( "ui_bomb_timer", 1 );
    level._id_27BB = _func_0BC( gettime() + level._id_1551 * 1000 );
    _func_142( level._id_27BB );
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombplanted( level.sabbombmodel._id_02E2 + ( 0, 0, 1 ) );
    var_3 = var_0 maps\mp\gametypes\_gameobjects::_id_3FFA();

    if ( var_3 == "_allies" )
        setomnvar( "ui_mlg_game_mode_status_1", 1 );
    else if ( var_3 == "_axis" )
        setomnvar( "ui_mlg_game_mode_status_1", 2 );

    _id_1552();
    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_bomb_timer_endtime", 0 );
    var_0._id_9345 maps\mp\gametypes\common_bomb_gameobject::_id_8F06();

    if ( level._id_3BDA )
        return;

    if ( !level._id_1545 && level.hotpotato )
    {
        var_4 = ( gettime() - level.timepausestart ) / 1000;
        level._id_1551 -= var_4;
    }

    if ( !level._id_1545 )
        return;

    var_5 = level._id_7749._id_9E9C[0]._id_02E2;
    level._id_1540 = 1;
    setdvar( "ui_danger_team", "BombExploded" );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    var_0 maps\mp\gametypes\common_bomb_gameobject::onbombexploded( var_5, 200, var_1 );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    level._id_1555["allies"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    level._id_1555["axis"] maps\mp\gametypes\_gameobjects::_id_8352( "none" );
    var_0 maps\mp\gametypes\_gameobjects::_id_2B1E();

    if ( level._id_3BDA )
        return;

    _func_142( 0 );
    maps\mp\gametypes\_gamescores::_id_0640( var_2, 1 );
    maps\mp\gametypes\_gamescores::_id_9B84( var_2 );
    wait 3;
    level._id_374D = var_2;
    thread maps\mp\gametypes\_gamelogic::_id_315F( var_2, game["end_reason"]["target_destroyed"] );
}

_id_1552()
{
    level endon( "bomb_defused" );
    level endon( "overtime_ended" );
    level endon( "game_ended" );
    var_0 = _func_0BC( level._id_1551 * 1000 + gettime() );
    setomnvar( "ui_bomb_timer_endtime", var_0 );
    level thread _id_4663( var_0 );
    maps\mp\gametypes\_hostmigration::_id_A051( level._id_1551 );
}

_id_4663( var_0 )
{
    level endon( "bomb_defused" );
    level endon( "overtime_ended" );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    var_1 = maps\mp\gametypes\_hostmigration::_id_A0DD();

    if ( var_1 > 0 )
        setomnvar( "ui_bomb_timer_endtime", var_0 + var_1 );
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
}

_id_64F0()
{
    if ( maps\mp\_utility::_id_5092( level.insuddendeath ) )
        return;

    thread suddendeaththread();
}

suddendeaththread()
{
    level endon( "game_ended" );
    level._id_9366 = 1;
    level.insuddendeath = 1;

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        level._id_0323[var_0] thread sabforcerespawn();
        level._id_0323[var_0] thread setplayersuddendeathvalues();
    }

    setdvar( "bg_compassShowEnemies", 1 );
    maps\mp\_utility::_id_7FD8( "numlives", 1 );
    level.sabsuddendeathtime = 90;
    var_1 = 0;

    while ( var_1 < level.sabsuddendeathtime )
    {
        if ( !level._id_1545 )
        {
            var_1 += 1;
            _func_142( gettime() + ( level.sabsuddendeathtime - var_1 ) * 1000 );
        }

        wait 1.0;
    }

    level._id_374D = "none";
    thread maps\mp\gametypes\_gamelogic::_id_315F( "tie", game["end_reason"]["tie"] );
}

sabforcerespawn()
{
    self endon( "spawned_player" );
    self endon( "spawn" );
    self endon( "disconnect" );

    if ( !self._id_4745 )
        return;

    self notify( "force_spawn" );
    wait 0.05;

    if ( self._id_03BC != "playing" || self._id_01E6 <= 0 )
    {
        while ( self._id_01E6 <= 0 )
        {
            self notify( "force_spawn" );

            if ( maps\mp\_utility::_id_5129() )
            {
                self._id_1AB3 = 1;
                maps\mp\_utility::_id_1EF2();
            }
            else if ( self._id_03BC == "spectator" && !self._id_A04D && !maps\mp\_utility::_id_5092( self._id_A04E ) )
                thread sabwaitandspawnclient();

            wait 0.25;
        }
    }
}

sabwaitandspawnclient()
{
    self endon( "disconnect" );
    self._id_A04D = 1;
    maps\mp\gametypes\_playerlogic::_id_A008();

    if ( isdefined( self ) )
        self._id_A04D = 0;
}

setplayersuddendeathvalues()
{
    self endon( "disconnect" );
    self _meth_82FA( "cg_deadChatWithDead", 1, "cg_deadChatWithTeam", 0, "cg_deadHearTeamLiving", 0, "cg_deadHearAllLiving", 0, "cg_everyoneHearsEveryone", 0 );
    maps\mp\_utility::_id_3BE1( "prematch_done" );

    while ( self._id_03BC != "playing" || self._id_01E6 <= 0 )
        wait 0.05;

    thread maps\mp\gametypes\_hud_message::_id_8A68( "sab_overtime" );
}

_id_6466( var_0 )
{
    level._id_374D = "none";

    if ( level._id_1540 )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_1545 )
        {
            level._id_374D = level.bombplantedby;
            maps\mp\gametypes\_gamescores::_id_0640( level.bombplantedby, 1 );
            maps\mp\gametypes\_gamescores::_id_9B84( level.bombplantedby );
            thread maps\mp\gametypes\_gamelogic::_id_315F( level.bombplantedby, game["end_reason"][level.bombplantedby + "_mission_accomplished"] );
        }
        else
            thread maps\mp\gametypes\_gamelogic::_id_315F( "tie", game["end_reason"]["tie"] );
    }
    else if ( level._id_1545 )
    {
        if ( var_0 == level.bombplantedby )
        {
            level.plantingteamdead = 1;
            return;
        }

        level._id_374D = level.bombplantedby;
        maps\mp\gametypes\_gamescores::_id_0640( level.bombplantedby, 1 );
        maps\mp\gametypes\_gamescores::_id_9B84( level.bombplantedby );
        thread maps\mp\gametypes\_gamelogic::_id_315F( level.bombplantedby, game["end_reason"][level._id_65B3[level.bombplantedby] + "_eliminated"] );
    }
    else
    {
        level._id_374D = level._id_65B3[var_0];
        maps\mp\gametypes\_gamescores::_id_0640( level._id_65B3[var_0], 1 );
        maps\mp\gametypes\_gamescores::_id_9B84( level._id_65B3[var_0] );
        thread maps\mp\gametypes\_gamelogic::_id_315F( level._id_65B3[var_0], game["end_reason"][var_0 + "_eliminated"] );
    }
}

_id_1536( var_0, var_1, var_2 )
{
    var_0.bombplantedon = 0;

    if ( maps\mp\_utility::_id_5092( level.insuddendeath ) && isdefined( level.plantingteamdead ) )
    {
        maps\mp\gametypes\_gamescores::_id_0640( var_2, 1 );
        maps\mp\gametypes\_gamescores::_id_9B84( var_2 );
        level._id_374D = var_2;
        thread maps\mp\gametypes\_gamelogic::_id_315F( var_2, game["end_reason"]["bomb_defused"] );
        return;
    }

    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_bomb_timer_endtime", 0 );
    maps\mp\gametypes\_gamelogic::_id_74BC();
    level._id_1545 = 0;

    if ( !maps\mp\_utility::_id_5092( level.insuddendeath ) )
        level._id_9366 = 0;

    level notify( "bomb_defused" );
    var_0 maps\mp\gametypes\common_bomb_gameobject::resetbombzone( level._id_7749, "enemy", "none", 0 );
    maps\mp\_utility::_id_7FAE( var_0, "waypoint_esports_sab_target" + var_0._id_0241 );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_0AA1( "any" );
    level._id_7749 maps\mp\gametypes\_gameobjects::_id_7FE2( var_1 );
}

_id_64C0( var_0 )
{
    if ( level._id_1540 )
        return;

    var_1 = maps\mp\_utility::_id_3FFC( var_0 );
    var_1 thread _id_41F0();
}

_id_64BF( var_0, var_1, var_2, var_0 )
{
    if ( var_1._id_5174 )
    {
        thread maps\mp\_matchdata::_id_5838( var_0, "planting" );
        var_2 thread maps\mp\_events::_id_27AE( var_1, var_0 );
    }
    else if ( var_1._id_50C8 )
        thread maps\mp\_matchdata::_id_5838( var_0, "carrying" );
    else if ( var_1._id_50EF )
    {
        thread maps\mp\_matchdata::_id_5838( var_0, "defusing" );
        var_2 thread maps\mp\_events::_id_27AE( var_1, var_0 );
    }
}

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
        maps\mp\_utility::_id_72F7( level._id_01B3, 0, 0, 9 );
        maps\mp\_utility::_id_72F9( level._id_01B3, 10 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 75 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 1 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
    }

    level._id_91EB = 1;
    level.classicgamemode = 1;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64BF = ::_id_64BF;

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    game["dialog"]["gametype"] = "team_deathmtch";
    game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    setdynamicdvar( "scr_war_roundswitch", 0 );
    maps\mp\_utility::_id_72F7( "war", 0, 0, 9 );
    setdynamicdvar( "scr_war_roundlimit", 1 );
    maps\mp\_utility::_id_72F6( "war", 1 );
    setdynamicdvar( "scr_war_winlimit", 1 );
    maps\mp\_utility::_id_72FE( "war", 1 );
    setdynamicdvar( "scr_war_halftime", 0 );
    maps\mp\_utility::_id_72EF( "war", 0 );
}

_id_64EC()
{
    _func_161( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

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
    _id_4E26();
    var_2[0] = level._id_01B3;
    maps\mp\gametypes\_gameobjects::main( var_2 );
}

_id_4E26()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_tdm_spawn_allies_start" );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_tdm_spawn_axis_start" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "axis", "mp_tdm_spawn" );
    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
}

_id_40D2()
{
    var_0 = self._id_0308["team"];

    if ( game["switchedsides"] )
        var_0 = maps\mp\_utility::_id_4067( var_0 );

    if ( level._id_9C14 && level._id_4C6D )
        var_1 = maps\mp\gametypes\_spawnlogic::getbeststartspawn( "mp_tdm_spawn_" + var_0 + "_start" );
    else
    {
        var_2 = maps\mp\gametypes\_spawnlogic::_id_411F( var_0 );
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( var_2, var_0 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_64BF( var_0, var_1, var_2 )
{
    level maps\mp\gametypes\_gamescores::_id_420C( var_1._id_0308["team"], 1 );

    if ( game["state"] == "postgame" && game["teamScores"][var_1._id_04A7] > game["teamScores"][level._id_65B3[var_1._id_04A7]] )
        var_1._id_373E = 1;
}

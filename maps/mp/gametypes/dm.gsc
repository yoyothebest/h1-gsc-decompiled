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
        maps\mp\_utility::_id_72F9( level._id_01B3, 10 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 30 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 30 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
    }

    level.classicgamemode = 1;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64BF = ::_id_64BF;
    level._id_64D5 = ::_id_64D5;

    if ( getdvarint( "party_maxPlayers", 18 ) == 2 )
        level.xpgamemodescale = 2;

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    _func_15E( "ffa" );
    game["dialog"]["gametype"] = "freeforall";
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F( 1 );
    setdynamicdvar( "scr_dm_winlimit", 1 );
    maps\mp\_utility::_id_72FE( "dm", 1 );
    setdynamicdvar( "scr_dm_roundlimit", 1 );
    maps\mp\_utility::_id_72F6( "dm", 1 );
    setdynamicdvar( "scr_dm_halftime", 0 );
    maps\mp\_utility::_id_72EF( "dm", 0 );
}

_id_64EC()
{
    _func_161( "auto_change" );
    maps\mp\_utility::_id_7FC5( "allies", &"OBJECTIVES_DM" );
    maps\mp\_utility::_id_7FC5( "axis", &"OBJECTIVES_DM" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_DM" );
        maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_DM" );
    }
    else
    {
        maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_DM_SCORE" );
        maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_DM_SCORE" );
    }

    maps\mp\_utility::_id_7FC3( "allies", &"OBJECTIVES_DM_HINT" );
    maps\mp\_utility::_id_7FC3( "axis", &"OBJECTIVES_DM_HINT" );
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_082F( "allies", "mp_dm_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "axis", "mp_dm_spawn" );
    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
    var_0[0] = "dm";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level._id_70A2 = 1;
}

_id_40D2()
{
    if ( level._id_4C6D )
        var_0 = maps\mp\gametypes\_spawnlogic::getstartspawnffa( self._id_04A7 );
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::_id_411F( self._id_04A7 );
        var_0 = maps\mp\gametypes\_spawnscoring::_id_40D5( var_1 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_0 );
    return var_0;
}

_id_64BF( var_0, var_1, var_2 )
{
    var_3 = 0;

    foreach ( var_5 in level._id_0323 )
    {
        if ( isdefined( var_5._id_038D ) && var_5._id_038D > var_3 )
            var_3 = var_5._id_038D;
    }

    if ( game["state"] == "postgame" && var_1._id_038D >= var_3 )
        var_1._id_373E = 1;
}

_id_64D5( var_0, var_1, var_2 )
{
    var_3 = maps\mp\gametypes\_rank::_id_40C1( var_0 );
    var_1 maps\mp\_utility::_id_7F6B( var_1._id_0167 + var_3 );
    var_1 maps\mp\gametypes\_gamescores::_id_9B65( var_1, var_3 );

    if ( isscoringevent( var_0 ) )
        return 1;
    else
        return 0;
}

isscoringevent( var_0 )
{
    switch ( var_0 )
    {
        case "kill":
        case "airstrike_mp_kill":
        case "helicopter_mp_kill":
            return 1;
    }

    return 0;
}

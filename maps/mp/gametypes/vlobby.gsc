// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    maps\mp\gametypes\_globallogic::init();
    maps\mp\gametypes\_callbacksetup::_id_8301();
    maps\mp\gametypes\_globallogic::_id_8301();
    level._id_7137 = 0;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64E9 = ::_id_64E9;
    maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
    maps\mp\_utility::_id_72F9( level._id_01B3, 0 );
    maps\mp\_utility::_id_72F8( level._id_01B3, 1 );
    maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
    level._id_1E38 = level._id_1E2E;
    level._id_1E2E = ::_id_5BB1;
    game["menu_team"] = "main";
    game["menu_class_allies"] = "main";
    game["menu_class_axis"] = "main";
    game["menu_changeclass_allies"] = "main";
    game["menu_changeclass_axis"] = "main";
    game["menu_changeclass"] = "menu_cac_assault";
    game["allies"] = "sentinel_vl";
    game["axis"] = "atlas";
}

_id_5BB1( var_0 )
{
    level._id_4C6D = 1;
    self._id_4729 = 0;
    [[ level._id_1E38 ]]( var_0 );
}

_id_64EC()
{
    _func_161( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    maps\mp\_utility::_id_7FC5( "allies", &"OBJECTIVES_WAR" );
    maps\mp\_utility::_id_7FC5( "axis", &"OBJECTIVES_WAR" );
    maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_WAR" );
    maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_WAR" );
    maps\mp\_utility::_id_7FC3( "allies", &"OBJECTIVES_WAR" );
    maps\mp\_utility::_id_7FC3( "axis", &"OBJECTIVES_WAR" );
    _id_4D5D();
    var_0[0] = level._id_01B3;
    maps\mp\gametypes\_gameobjects::main( var_0 );
    level._id_6F09 = 0;
    level._id_6F0A = 0;
}

_id_4D5D()
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

_id_40D2( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
        {
            if ( level._id_0323[var_1] == self )
            {
                var_0 = var_1;
                break;
            }
        }
    }

    var_2 = getentarray( "player_pos", "targetname" );
    var_3 = undefined;

    foreach ( var_3 in var_2 )
    {
        if ( var_3._id_0398 == "" + var_0 )
            break;
    }

    if ( !isdefined( var_3 ) )
        var_3 = var_2[0];

    self._id_117A = var_3;
    return var_3;
}

_id_64E9()
{
    if ( isdefined( level._id_9EAA ) )
        self [[ level._id_9EAA ]]();
}

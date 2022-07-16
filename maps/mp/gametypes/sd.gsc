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
        maps\mp\_utility::_id_72F9( level._id_01B3, 2.5 );
        maps\mp\_utility::_id_72F8( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 0 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 4 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 1 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
        setdynamicdvar( "scr_killcount_persists", 0 );
    }

    level._id_62F8 = 1;
    level._id_91EB = 1;
    level.classicgamemode = 1;
    level._id_64DA = maps\mp\gametypes\common_sd_sr::_id_64DA;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64E9 = ::_id_64E9;
    level._id_64D3 = ::_id_64D3;
    level._id_6466 = maps\mp\gametypes\common_sd_sr::_id_6466;
    level._id_64C0 = maps\mp\gametypes\common_sd_sr::_id_64C0;
    level._id_64F0 = maps\mp\gametypes\common_sd_sr::_id_64F0;
    level._id_64BF = maps\mp\gametypes\common_sd_sr::_id_64BF;
    level._id_3BF5 = maps\mp\gametypes\common_sd_sr::_id_517B;
    level._id_0AAB = 0;

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    game["dialog"]["gametype"] = "searchdestroy";
    game["dialog"]["offense_obj"] = "obj_destroy";
    game["dialog"]["defense_obj"] = "obj_defend";
    maps\mp\gametypes\common_sd_sr::setbombendtime( 0, 0 );
    maps\mp\gametypes\common_sd_sr::setbombendtime( 0, 1 );
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    var_0 = _func_13D( "sdData", "roundLength" );
    setdynamicdvar( "scr_sd_timelimit", var_0 );
    maps\mp\_utility::_id_72F9( "sd", var_0 );
    var_1 = _func_13D( "sdData", "roundSwitch" );
    setdynamicdvar( "scr_sd_roundswitch", var_1 );
    maps\mp\_utility::_id_72F7( "sd", var_1, 0, 9 );
    var_2 = _func_13D( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_sd_winlimit", var_2 );
    maps\mp\_utility::_id_72FE( "sd", var_2 );
    setdynamicdvar( "scr_sd_bombtimer", _func_13D( "sdData", "bombTimer" ) );
    setdynamicdvar( "scr_sd_planttime", _func_13D( "sdData", "plantTime" ) );
    setdynamicdvar( "scr_sd_defusetime", _func_13D( "sdData", "defuseTime" ) );
    setdynamicdvar( "scr_sd_multibomb", _func_13D( "sdData", "multiBomb" ) );
    setdynamicdvar( "scr_sd_silentplant", _func_13D( "sdData", "silentPlant" ) );
    setdynamicdvar( "scr_sd_roundlimit", 0 );
    maps\mp\_utility::_id_72F6( "sd", 0 );
    setdynamicdvar( "scr_sd_scorelimit", 1 );
    maps\mp\_utility::_id_72F8( "sd", 1 );
    setdynamicdvar( "scr_sd_halftime", 0 );
    maps\mp\_utility::_id_72EF( "sd", 0 );
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

    _func_161( "manual_change" );
    maps\mp\gametypes\common_bomb_gameobject::loadbombfx();
    maps\mp\_utility::_id_7FC5( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
    maps\mp\_utility::_id_7FC5( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::_id_7FC4( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
        maps\mp\_utility::_id_7FC4( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );
    }
    else
    {
        maps\mp\_utility::_id_7FC4( game["attackers"], &"OBJECTIVES_SD_ATTACKER_SCORE" );
        maps\mp\_utility::_id_7FC4( game["defenders"], &"OBJECTIVES_SD_DEFENDER_SCORE" );
    }

    maps\mp\_utility::_id_7FC3( game["attackers"], &"OBJECTIVES_SD_ATTACKER_HINT" );
    maps\mp\_utility::_id_7FC3( game["defenders"], &"OBJECTIVES_SD_DEFENDER_HINT" );
    _id_4E26();
    var_2[0] = "sd";
    var_2[1] = "bombzone";
    var_2[2] = "blocker";
    maps\mp\gametypes\_gameobjects::main( var_2 );
    thread maps\mp\gametypes\common_sd_sr::_id_9B22();
    maps\mp\_utility::setcarrierloadouts();
    thread maps\mp\gametypes\common_sd_sr::_id_1549();
    thread maps\mp\gametypes\_spectating::allowallyteamspectating();
}

_id_4E26()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_sd_spawn_attacker" );
    maps\mp\gametypes\_spawnlogic::_id_0831( "mp_sd_spawn_defender" );
    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
}

_id_40D2()
{
    var_0 = "mp_sd_spawn_defender";

    if ( self._id_0308["team"] == game["attackers"] )
        var_0 = "mp_sd_spawn_attacker";

    var_1 = maps\mp\gametypes\_spawnlogic::getbeststartspawn( var_0 );
    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_64E9()
{
    var_0 = maps\mp\_utility::_id_5092( self.isrespawningwithbombcarrierclass );

    if ( maps\mp\_utility::_id_5112( self ) )
    {
        self._id_5174 = 0;
        self._id_50EF = 0;

        if ( !var_0 )
        {
            self._id_50C8 = 0;
            self._id_02D2 = 0;
        }
    }

    if ( _func_1AD( self ) && !var_0 )
    {
        if ( level._id_5FE2 && self._id_0308["team"] == game["attackers"] )
            self _meth_82F8( "ui_carrying_bomb", 1 );
        else
            self _meth_82F8( "ui_carrying_bomb", 0 );
    }

    maps\mp\_utility::_id_7F6B( 0 );

    if ( isdefined( self._id_0308["plants"] ) )
        maps\mp\_utility::_id_7F6B( self._id_0308["plants"] );

    maps\mp\_utility::_id_7F6C( 0 );

    if ( isdefined( self._id_0308["defuses"] ) )
        maps\mp\_utility::_id_7F6C( self._id_0308["defuses"] );

    self.isrespawningwithbombcarrierclass = undefined;
    level notify( "spawned_player" );
    thread maps\mp\gametypes\common_sd_sr::onplayerdisconnect();
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( _func_1AD( self ) )
        self _meth_82F8( "ui_carrying_bomb", 0 );

    thread maps\mp\gametypes\common_sd_sr::_id_1CF1();
}

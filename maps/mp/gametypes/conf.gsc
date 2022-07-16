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
        maps\mp\_utility::_id_72F8( level._id_01B3, 65 );
        maps\mp\_utility::_id_72F6( level._id_01B3, 1 );
        maps\mp\_utility::_id_72FE( level._id_01B3, 1 );
        maps\mp\_utility::_id_72F4( level._id_01B3, 0 );
        maps\mp\_utility::_id_72EF( level._id_01B3, 0 );
        level._id_59E6 = 0;
        level._id_59EB = 0;
    }

    level._id_91EB = 1;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64BF = ::_id_64BF;
    level.killstreak_kills = getdvarint( "scr_conf_killstreak_kill", 1 );
    level.killstreak_tag_friendly = getdvarint( "scr_conf_killstreak_tag_friendly", 0 );
    level.killstreak_tag_enemy = getdvarint( "scr_conf_killstreak_tag_enemy", 0 );

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    game["dialog"]["gametype"] = "kc_intro";
    game["dialog"]["kill_confirmed"] = "kc_killconfirmed";
    game["dialog"]["kill_denied"] = "kc_killdenied";
    game["dialog"]["kill_lost"] = "kc_killlost";
    game["dialog"]["defense_obj"] = "kc_start";
    game["dialog"]["offense_obj"] = "kc_start";
    level._id_20E9["vanish"] = loadfx( "vfx/unique/dogtag_vanish" );
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    setdynamicdvar( "scr_conf_roundswitch", 0 );
    maps\mp\_utility::_id_72F7( "conf", 0, 0, 9 );
    setdynamicdvar( "scr_conf_roundlimit", 1 );
    maps\mp\_utility::_id_72F6( "conf", 1 );
    setdynamicdvar( "scr_conf_winlimit", 1 );
    maps\mp\_utility::_id_72FE( "conf", 1 );
    setdynamicdvar( "scr_conf_halftime", 0 );
    maps\mp\_utility::_id_72EF( "conf", 0 );
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = _func_13D( "confData", "killstreakPointsType" );

    if ( var_3 == 2 )
    {
        var_0 = 1;
        var_2 = 1;
    }
    else if ( var_3 == 1 )
        var_2 = 1;
    else
        var_0 = 1;

    setdynamicdvar( "scr_conf_killstreak_kill", var_0 );
    setdynamicdvar( "scr_conf_killstreak_tag_friendly", var_1 );
    setdynamicdvar( "scr_conf_killstreak_tag_enemy", var_2 );
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

    maps\mp\_utility::_id_7FC5( "allies", &"OBJECTIVES_CONF" );
    maps\mp\_utility::_id_7FC5( "axis", &"OBJECTIVES_CONF" );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_CONF" );
        maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_CONF" );
    }
    else
    {
        maps\mp\_utility::_id_7FC4( "allies", &"OBJECTIVES_CONF_SCORE" );
        maps\mp\_utility::_id_7FC4( "axis", &"OBJECTIVES_CONF_SCORE" );
    }

    maps\mp\_utility::_id_7FC3( "allies", &"OBJECTIVES_CONF_HINT" );
    maps\mp\_utility::_id_7FC3( "axis", &"OBJECTIVES_CONF_HINT" );
    _id_4E26();
    level._id_2CDF = [];
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
        var_1 = maps\mp\gametypes\_spawnscoring::_id_40D3( var_2 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_1 );
    return var_1;
}

_id_64BF( var_0, var_1, var_2 )
{
    level thread _id_899E( var_0, var_1 );

    if ( game["state"] == "postgame" && game["teamScores"][var_1._id_04A7] > game["teamScores"][level._id_65B3[var_1._id_04A7]] )
        var_1._id_373E = 1;
}

_id_899E( var_0, var_1 )
{
    var_2 = var_0._id_0308["team"];

    if ( isdefined( level._id_2CDF[var_0._id_4450] ) )
    {
        playfx( level._id_20E9["vanish"], level._id_2CDF[var_0._id_4450]._id_24C8 );
        level._id_2CDF[var_0._id_4450] notify( "reset" );
    }
    else
    {
        if ( !isdefined( level.killconfirmeddogtagenemy ) )
            level.killconfirmeddogtagenemy = "h1_dogtag_enemy_animated";

        if ( !isdefined( level.killconfirmeddogtagfriend ) )
            level.killconfirmeddogtagfriend = "h1_dogtag_friend_animated";

        var_3[0] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[0] _meth_80B3( level.killconfirmeddogtagenemy );
        var_3[1] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[1] _meth_80B3( level.killconfirmeddogtagfriend );
        var_4 = spawn( "trigger_radius", ( 0, 0, 0 ), 0, 32, 32 );
        level._id_2CDF[var_0._id_4450] = maps\mp\gametypes\_gameobjects::_id_244C( "any", var_4, var_3, ( 0, 0, 16 ) );
        maps\mp\_utility::_id_0603( level._id_2CDF[var_0._id_4450]._id_6305 );
        maps\mp\_utility::_id_0603( level._id_2CDF[var_0._id_4450]._id_6306 );
        maps\mp\_utility::_id_0603( level._id_2CDF[var_0._id_4450]._id_6309 );
        maps\mp\gametypes\_objpoints::_id_2859( level._id_2CDF[var_0._id_4450]._id_6316["allies"] );
        maps\mp\gametypes\_objpoints::_id_2859( level._id_2CDF[var_0._id_4450]._id_6316["axis"] );
        maps\mp\gametypes\_objpoints::_id_2859( level._id_2CDF[var_0._id_4450]._id_6316["mlg"] );
        level._id_2CDF[var_0._id_4450] maps\mp\gametypes\_gameobjects::_id_834C( 0 );
        level._id_2CDF[var_0._id_4450]._id_64F8 = ::_id_64F8;
        level._id_2CDF[var_0._id_4450]._id_9E07 = var_0;
        level._id_2CDF[var_0._id_4450]._id_9E0A = var_2;
        level._id_2CDF[var_0._id_4450]._id_6304 = maps\mp\gametypes\_gameobjects::_id_4041();
        objective_add( level._id_2CDF[var_0._id_4450]._id_6304, "invisible", ( 0, 0, 0 ) );
        objective_icon( level._id_2CDF[var_0._id_4450]._id_6304, "waypoint_dogtags" );
        level._id_2CDF[var_0._id_4450].objidself = maps\mp\gametypes\_gameobjects::_id_4041();
        objective_add( level._id_2CDF[var_0._id_4450].objidself, "invisible", ( 0, 0, 0 ) );
        objective_icon( level._id_2CDF[var_0._id_4450].objidself, "waypoint_dogtags_friendlys" );
        level thread _id_1EF9( var_0 );
        var_0 thread _id_910A( level._id_2CDF[var_0._id_4450] );
    }

    var_5 = var_0._id_02E2 + ( 0, 0, 14 );
    level._id_2CDF[var_0._id_4450]._id_24C8 = var_5;
    level._id_2CDF[var_0._id_4450]._id_04C5._id_02E2 = var_5;
    level._id_2CDF[var_0._id_4450]._id_9E9C[0]._id_02E2 = var_5;
    level._id_2CDF[var_0._id_4450]._id_9E9C[1]._id_02E2 = var_5;
    level._id_2CDF[var_0._id_4450] maps\mp\gametypes\_gameobjects::_id_4DE3();
    level._id_2CDF[var_0._id_4450] maps\mp\gametypes\_gameobjects::_id_0AB2( "any" );
    level._id_2CDF[var_0._id_4450]._id_9E9C[0] thread _id_8535( level._id_2CDF[var_0._id_4450], maps\mp\_utility::_id_4067( var_2 ) );
    level._id_2CDF[var_0._id_4450]._id_9E9C[1] thread _id_8535( level._id_2CDF[var_0._id_4450], var_2 );
    level._id_2CDF[var_0._id_4450].attacker = var_1;
    objective_position( level._id_2CDF[var_0._id_4450]._id_6304, var_5 );
    objective_state( level._id_2CDF[var_0._id_4450]._id_6304, "active" );
    objective_playerenemyteam( level._id_2CDF[var_0._id_4450]._id_6304, var_0 _meth_81B5() );
    objective_position( level._id_2CDF[var_0._id_4450].objidself, var_5 );
    objective_state( level._id_2CDF[var_0._id_4450].objidself, "active" );
    objective_player( level._id_2CDF[var_0._id_4450].objidself, var_0 _meth_81B5() );
    _func_1A8( var_5, "mp_killconfirm_tags_drop" );
    level._id_2CDF[var_0._id_4450]._id_9E9C[0] _meth_8275( "mp_dogtag_spin" );
    level._id_2CDF[var_0._id_4450]._id_9E9C[1] _meth_8275( "mp_dogtag_spin" );
}

_id_8535( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "reset" );
    self _meth_8056();

    foreach ( var_3 in level._id_0323 )
    {
        if ( var_3._id_04A7 == var_1 )
            self _meth_8007( var_3 );

        if ( var_3._id_04A7 == "spectator" && var_1 == "allies" )
            self _meth_8007( var_3 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self _meth_8056();

        foreach ( var_3 in level._id_0323 )
        {
            if ( var_3._id_04A7 == var_1 )
                self _meth_8007( var_3 );

            if ( var_3._id_04A7 == "spectator" && var_1 == "allies" )
                self _meth_8007( var_3 );

            if ( var_0._id_9E0A == var_3._id_04A7 && var_3 == var_0.attacker )
                objective_state( var_0._id_6304, "invisible" );
        }
    }
}

_id_64F8( var_0 )
{
    if ( isdefined( var_0._id_02E5 ) )
        var_0 = var_0._id_02E5;

    var_1 = var_0._id_0308["team"];

    if ( var_1 == self._id_9E0A )
    {
        self._id_04C5 _meth_809C( "mp_kc_tag_denied" );

        if ( _func_1AD( var_0 ) )
            var_0 maps\mp\_utility::_id_5655( "kill_denied" );

        if ( isdefined( self.attacker ) && _func_1AD( self.attacker ) )
            self.attacker maps\mp\_utility::_id_5655( "kc_killlost" );

        var_2 = self._id_9E07 == var_0;
        var_0 maps\mp\_events::_id_5359( var_2 );

        if ( level.killstreak_tag_friendly )
            maps\mp\gametypes\_damage::incrementkillstreak( var_0 );
    }
    else
    {
        self._id_04C5 _meth_809C( "mp_kc_tag_collected" );

        if ( _func_1AD( self.attacker ) && self.attacker != var_0 )
            level thread maps\mp\gametypes\_rank::_id_1208( "team_confirmed", self.attacker );

        var_0 maps\mp\_events::_id_5356();

        if ( _func_1AD( var_0 ) )
            var_0 maps\mp\_utility::_id_5655( "kill_confirmed" );

        var_0 maps\mp\gametypes\_gamescores::_id_420C( var_1, 1 );

        if ( level.killstreak_tag_enemy )
            maps\mp\gametypes\_damage::incrementkillstreak( var_0 );
    }

    level thread maps\mp\_events::_id_5ED2( var_0 );
    _id_7461();
}

_id_7461()
{
    self.attacker = undefined;
    self notify( "reset" );
    self._id_9E9C[0] _meth_8056();
    self._id_9E9C[1] _meth_8056();
    self._id_24C8 = ( 0, 0, 1000 );
    self._id_04C5._id_02E2 = ( 0, 0, 1000 );
    self._id_9E9C[0]._id_02E2 = ( 0, 0, 1000 );
    self._id_9E9C[1]._id_02E2 = ( 0, 0, 1000 );
    maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
    objective_state( self._id_6304, "invisible" );
    objective_state( self.objidself, "invisible" );
}

_id_910A( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        var_0._id_9E0A = self._id_0308["team"];
        var_0 _id_7461();
    }
}

_id_1EF9( var_0 )
{
    level endon( "game_ended" );
    var_1 = var_0._id_4450;
    var_0 waittill( "disconnect" );

    if ( isdefined( level._id_2CDF[var_1] ) )
    {
        level._id_2CDF[var_1] maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
        playfx( level._id_20E9["vanish"], level._id_2CDF[var_1]._id_24C8 );
        level._id_2CDF[var_1] notify( "reset" );
        wait 0.05;

        if ( isdefined( level._id_2CDF[var_1] ) )
        {
            objective_delete( level._id_2CDF[var_1]._id_6304 );
            objective_delete( level._id_2CDF[var_1].objidself );
            level._id_2CDF[var_1]._id_04C5 delete();

            for ( var_2 = 0; var_2 < level._id_2CDF[var_1]._id_9E9C.size; var_2++ )
                level._id_2CDF[var_1]._id_9E9C[var_2] delete();

            level._id_2CDF[var_1] notify( "deleted" );
            level._id_2CDF[var_1] = undefined;
        }
    }
}

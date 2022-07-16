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
    level.classicgamemode = 1;
    level._id_2D73 = 1;
    level._id_64EC = ::_id_64EC;
    level._id_40D2 = ::_id_40D2;
    level._id_64E9 = ::_id_64E9;
    level._id_64D3 = ::_id_64D3;

    if ( level._id_59E6 || level._id_59EB )
        level._id_5D51 = maps\mp\gametypes\_damage::_id_3BF6;

    level.hqautodestroytime = getdvarint( "scr_koth_autodestroytime", 60 );
    level.hqspawntime = getdvarint( "scr_koth_spawntime", 0 );
    level._id_1B5D = getdvarint( "scr_koth_captureTime", 20 );
    level.destroytime = getdvarint( "scr_koth_destroyTime", 10 );
    level.delayplayer = getdvarint( "scr_koth_delayPlayer", 0 );
    level.spawndelay = level.hqautodestroytime;
    level.hqclassicmode = getdvarint( "scr_koth_classicMode", 1 );
    level.captureinsteadofdestroy = !level.hqclassicmode;
    level.iconoffset = ( 0, 0, 32 );
    level.timerdisplay = [];
    level._id_64E2 = ::getrespawndelay;
    game["dialog"]["gametype"] = "headquarters";
}

_id_4DE0()
{
    maps\mp\_utility::_id_7F3F();
    setdynamicdvar( "scr_koth_autodestroytime", _func_13D( "hqData", "HQLifetime" ) );
    setdynamicdvar( "scr_koth_spawntime", _func_13D( "hqData", "HQActivateDelay" ) );
    setdynamicdvar( "scr_koth_classicMode", _func_13D( "hqData", "HQClassicMode" ) );
    setdynamicdvar( "scr_koth_roundswitch", 1 );
    maps\mp\_utility::_id_72F7( "koth", 1, 0, 9 );
    setdynamicdvar( "scr_koth_roundlimit", 1 );
    maps\mp\_utility::_id_72F6( "koth", 1 );
    setdynamicdvar( "scr_koth_winlimit", 1 );
    maps\mp\_utility::_id_72FE( "koth", 1 );
    setdynamicdvar( "scr_koth_halftime", 0 );
    maps\mp\_utility::_id_72EF( "koth", 0 );
    setdynamicdvar( "scr_koth_capturetime", 20 );
    setdynamicdvar( "scr_koth_destroytime", 10 );
    setdynamicdvar( "scr_koth_delayPlayer", 0 );
    setdynamicdvar( "scr_koth_spawnDelay", 60 );
}

_id_9B41( var_0, var_1 )
{
    game["strings"]["objective_hint_allies"] = level.objectivehint[var_0]._id_8F1D;
    game["strings"]["objective_hint_axis"] = level.objectivehint[var_1]._id_8F1D;

    for ( var_2 = 0; var_2 < level._id_0323.size; var_2++ )
    {
        var_3 = level._id_0323[var_2];

        if ( isdefined( var_3._id_0308["team"] ) && var_3._id_0308["team"] != "spectator" )
        {
            var_4 = maps\mp\_utility::_id_405A( var_3._id_0308["team"] );
            var_3 thread maps\mp\gametypes\_hud_message::_id_4909( var_4 );
        }
    }
}

getrespawndelay()
{
    maps\mp\_utility::_id_1EF5( "hq_respawn" );

    if ( !isdefined( level.radioobject ) )
        return undefined;

    var_0 = level.radioobject maps\mp\gametypes\_gameobjects::_id_4078();

    if ( self._id_0308["team"] == var_0 )
    {
        if ( !isdefined( level.hqdestroytime ) )
            return undefined;

        if ( level.spawndelay == 0 )
            return undefined;

        var_1 = ( level.hqdestroytime - gettime() ) / 1000;
        var_1 += 1.0;

        if ( level.spawndelay >= level.hqautodestroytime )
        {
            if ( level.hqclassicmode )
                maps\mp\_utility::_id_7FA5( "hq_respawn", &"MP_WAITING_FOR_HQ", undefined, 10 );
            else
                maps\mp\_utility::_id_7FA5( "hq_respawn", &"MP_WAITING_FOR_HQ_CAPTURE", undefined, 10 );

            self _meth_82F8( "ui_hide_spawn_timer", 1 );
        }

        if ( !_func_1A1( self ) )
            self.forcespawnnearteammates = 1;

        if ( level.delayplayer )
            return _func_0BF( level.spawndelay, var_1 );
        else
        {
            self._id_747A = undefined;
            return _func_0BC( var_1 ) % level.spawndelay;
        }
    }
}

hintstruct( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_8F1D = var_0;
    var_2._id_0204 = var_1;
    return var_2;
}

_id_64EC()
{
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

    level.objectivehint["prepare"] = hintstruct( &"MP_CONTROL_HQ", 0 );
    level.objectivehint["capture"] = hintstruct( &"MP_CAPTURE_HQ", 1 );
    level.objectivehint["destroy"] = hintstruct( &"MP_DESTROY_HQ", 2 );
    level.objectivehint["defend"] = hintstruct( &"MP_DEFEND_HQ", 3 );

    if ( !level.hqclassicmode )
        level.objectivehint["destroy"] = level.objectivehint["capture"];

    if ( level.hqspawntime )
        _id_9B41( "prepare", "prepare" );
    else
        _id_9B41( "capture", "capture" );

    _func_161( "auto_change" );
    _id_4E26();
    var_0[0] = "hq";
    maps\mp\gametypes\_gameobjects::main( var_0 );
    thread setupradios();
    thread hqmainloop();
    thread maps\mp\gametypes\_spectating::allowallyteamspectating();
}

_id_4E26()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    maps\mp\gametypes\_spawnlogic::_id_082F( "allies", "mp_tdm_spawn" );
    maps\mp\gametypes\_spawnlogic::_id_082F( "axis", "mp_tdm_spawn" );
    level._id_5986 = maps\mp\gametypes\_spawnlogic::_id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
    level.spawn_all = maps\mp\gametypes\_spawnlogic::_id_40DD( "mp_tdm_spawn" );

    if ( !level.spawn_all.size )
    {
        maps\mp\gametypes\_callbacksetup::_id_06BF();
        return;
    }
}

timerdisplayshow( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        level.timerdisplay["allies"] = var_1;

    if ( isdefined( var_2 ) )
        level.timerdisplay["axis"] = var_2;

    if ( isdefined( var_0 ) )
        setomnvar( "ui_bomb_timer_endtime", var_0 );

    foreach ( var_4 in level._id_0323 )
        var_4 timerdisplaytoplayer();
}

timerdisplayhide()
{
    level.timerdisplay["allies"] = undefined;
    level.timerdisplay["axis"] = undefined;
    setomnvar( "ui_bomb_timer_endtime", 0 );

    foreach ( var_1 in level._id_0323 )
        var_1 timerdisplaytoplayer();
}

timerdisplaytoplayer()
{
    var_0 = level.timerdisplay[self._id_04A7];

    if ( !isdefined( var_0 ) )
        var_0 = "none";

    var_1["none"] = 0;
    var_1["spawning"] = 1;
    var_1["despawning"] = 2;
    var_1["reinforcements"] = 3;
    var_2 = var_1[var_0];
    self _meth_82F8( "ui_hud_message_index", var_2 );
}

hqmainloop()
{
    level endon( "game_ended" );
    level.hqrevealtime = -100000;
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    wait 5;
    thread hidetimerdisplayongameend();
    var_0 = maps\mp\gametypes\_gameobjects::_id_4041();
    objective_add( var_0, "invisible", ( 0, 0, 0 ) );

    for (;;)
    {
        var_1 = pickradiotospawn();
        var_1 makeradioactive();
        maps\mp\_utility::_id_6DDD( "mp_suitcase_pickup" );
        maps\mp\_utility::_id_564B( "hq_located" );
        var_2 = var_1._id_3BF8;
        level.radioobject = var_2;
        var_2 makeradiovisible();
        var_1._id_9E5A = 1;
        level.hqrevealtime = gettime();

        if ( level.hqspawntime )
        {
            var_3 = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_next_hq", var_1._id_02E2 + level.iconoffset, "all", "waypoint_targetneutral" );
            var_3 _meth_80DA( 1, 1 );
            objective_position( var_0, var_1._id_9820 );
            objective_icon( var_0, "waypoint_targetneutral" );
            objective_state( var_0, "active" );
            _id_9B41( "prepare", "prepare" );
            timerdisplayshow( gettime() + 1000 * level.hqspawntime, "spawning", "spawning" );
            wait(level.hqspawntime);
            maps\mp\gametypes\_objpoints::_id_2859( var_3 );
            objective_state( var_0, "invisible" );
        }

        timerdisplayhide();
        waitframe;
        maps\mp\_utility::_id_564B( "hq_online" );
        _id_9B41( "capture", "capture" );
        maps\mp\_utility::_id_6DDD( "mp_killstreak_radar" );
        var_2 maps\mp\gametypes\_gameobjects::_id_0AB2( "any" );
        var_2 maps\mp\gametypes\_gameobjects::_id_834C( level._id_1B5D );
        var_2 maps\mp\gametypes\_gameobjects::_id_834B( &"MP_CAPTURING_HQ" );
        var_2 updateicons();
        var_2 maps\mp\gametypes\_gameobjects::_id_8352( "any" );
        var_2._id_64F8 = ::onradiocapture;
        var_2._id_6454 = ::_id_6454;
        var_2._id_648E = ::_id_648E;
        var_2.onnumtouchingchanged = ::onnumtouchingchanged;
        var_2._id_6242 = 1;
        var_2.contesteduiprogress = 1;
        var_2._id_4B53 = "kothZone";
        level waittill( "hq_captured" );
        var_4 = var_2 maps\mp\gametypes\_gameobjects::_id_4078();
        var_5 = maps\mp\_utility::_id_4067( var_4 );

        if ( level.hqautodestroytime )
            thread destroyhqaftertime( level.hqautodestroytime );
        else
            level.hqdestroyedbytimer = 0;

        for (;;)
        {
            var_4 = var_2 maps\mp\gametypes\_gameobjects::_id_4078();
            var_5 = maps\mp\_utility::_id_4067( var_4 );

            if ( var_4 == "allies" )
                _id_9B41( "defend", "destroy" );
            else
                _id_9B41( "destroy", "defend" );

            var_2 maps\mp\gametypes\_gameobjects::_id_0AB2( "enemy" );
            var_2 updateicons();

            if ( level.hqclassicmode )
                var_2 maps\mp\gametypes\_gameobjects::_id_834B( &"MP_DESTROYING_HQ" );

            var_2._id_64F8 = ::onradiodestroy;

            if ( level.hqautodestroytime )
            {
                var_6 = "despawning";

                if ( level.hqclassicmode )
                    var_6 = "reinforcements";

                var_7 = "despawning";

                if ( var_4 == "allies" )
                    timerdisplayshow( level.hqdestroytime, var_6, var_7 );
                else
                    timerdisplayshow( level.hqdestroytime, var_7, var_6 );
            }

            level waittill( "hq_destroyed" );
            timerdisplayhide();

            if ( level.hqclassicmode || level.hqdestroyedbytimer )
                break;

            thread _id_39CB( var_4 );
            var_2 maps\mp\gametypes\_gameobjects::_id_7FDA( maps\mp\_utility::_id_4067( var_4 ) );
        }

        level notify( "hq_reset" );
        var_2 maps\mp\gametypes\_gameobjects::_id_0AB2( "none" );
        var_2 maps\mp\gametypes\_gameobjects::_id_7FDA( "neutral" );
        var_2 makeradioinvisible();
        var_1._id_9E5A = 0;
        var_1 makeradioinactive();
        level.radioobject = undefined;
        thread _id_39CB( var_4 );
        wait 6.0;
    }
}

updateicons()
{
    if ( !isdefined( self._id_04C5 ) )
        return;

    var_0 = "waypoint_captureneutral";
    var_1 = "waypoint_captureneutral";
    var_2 = "waypoint_captureneutral";

    if ( self._id_62AF["axis"] && self._id_62AF["allies"] )
    {
        var_0 = "waypoint_contested";
        var_1 = "waypoint_contested";
        var_2 = "waypoint_contested";
    }
    else if ( self._id_663A == "neutral" )
    {
        if ( self._id_62AF["axis"] || self._id_62AF["allies"] )
        {
            var_0 = "waypoint_losing";
            var_1 = "waypoint_taking";

            if ( self._id_62AF["allies"] )
                var_2 = "waypoint_esports_koth_taking_blue";
            else
                var_2 = "waypoint_esports_koth_taking_red";
        }
        else
        {
            var_0 = "waypoint_captureneutral";
            var_1 = "waypoint_captureneutral";
            var_2 = "waypoint_captureneutral";
        }
    }
    else if ( self._id_62AF[maps\mp\_utility::_id_4067( self._id_663A )] )
    {
        var_0 = "waypoint_losing";
        var_1 = "waypoint_taking";

        if ( self._id_663A == "allies" )
            var_2 = "waypoint_esports_koth_losing_blue";
        else
            var_2 = "waypoint_esports_koth_losing_red";
    }
    else
    {
        var_0 = "waypoint_defend";
        var_1 = "waypoint_capture";

        if ( self._id_663A == "allies" )
            var_2 = "waypoint_esports_koth_taken_blue";
        else
            var_2 = "waypoint_esports_koth_taken_red";
    }

    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", var_0 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", var_0 );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", var_1 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", var_1 );
    maps\mp\_utility::_id_7FAE( self, var_2 );
}

hidetimerdisplayongameend( var_0 )
{
    level waittill( "game_ended" );
    timerdisplayhide();
}

_id_39CB( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2._id_0308["team"] == var_0 )
        {
            var_2 maps\mp\_utility::_id_1EF5( "hq_respawn" );

            if ( !_func_1A1( var_2 ) )
                var_2.forcespawnnearteammates = 1;

            var_2 notify( "force_spawn" );
        }
    }
}

_id_6454( var_0 )
{
    updateicons();
}

_id_648E( var_0, var_1, var_2 )
{
    updateicons();
}

onnumtouchingchanged( var_0, var_1, var_2 )
{
    updateicons();
}

onradiocapture( var_0 )
{
    var_1 = var_0._id_0308["team"];

    foreach ( var_3 in self._id_940D[var_1] )
    {
        var_4 = var_3._id_0318;
        var_4 maps\mp\_events::hqcaptureevent();
    }

    var_6 = maps\mp\gametypes\_gameobjects::_id_4078();
    maps\mp\gametypes\_gameobjects::_id_7FDA( var_1 );

    if ( level.hqclassicmode )
        maps\mp\gametypes\_gameobjects::_id_834C( level.destroytime );

    var_7 = "axis";

    if ( var_1 == "axis" )
        var_7 = "allies";

    maps\mp\_utility::_id_564B( "hq_secured", var_1 );
    maps\mp\_utility::_id_564B( "hq_enemy_captured", var_7 );
    thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_taken", var_1 );
    thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_lost", var_7 );
    level thread awardhqpoints( var_1 );
    var_0 notify( "objective", "captured" );
    level notify( "hq_captured" );
}

onradiodestroy( var_0 )
{
    var_1 = var_0._id_0308["team"];
    var_2 = "axis";

    if ( var_1 == "axis" )
        var_2 = "allies";

    foreach ( var_4 in self._id_940D[var_1] )
    {
        var_5 = var_4._id_0318;

        if ( !level.hqclassicmode )
        {
            var_5 maps\mp\_events::hqcaptureevent();
            continue;
        }

        var_5 maps\mp\_events::hqdestroyevent();
    }

    if ( !level.hqclassicmode )
    {
        maps\mp\_utility::_id_564B( "hq_secured", var_1 );
        maps\mp\_utility::_id_564B( "hq_enemy_captured", var_2 );
    }
    else
    {
        maps\mp\_utility::_id_564B( "hq_secured", var_1 );
        maps\mp\_utility::_id_564B( "hq_enemy_destroyed", var_2 );
    }

    thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_taken", var_1 );
    thread maps\mp\_utility::_id_6DDD( "h1_mp_war_objective_lost", var_2 );
    level notify( "hq_destroyed" );

    if ( !level.hqclassicmode )
        level thread awardhqpoints( var_1 );
}

destroyhqaftertime( var_0 )
{
    level endon( "game_ended" );
    level endon( "hq_reset" );
    level.hqdestroytime = gettime() + var_0 * 1000;
    level.hqdestroyedbytimer = 0;
    wait(var_0);
    level.hqdestroyedbytimer = 1;
    maps\mp\_utility::_id_564B( "hq_offline" );
    level notify( "hq_destroyed" );
}

awardhqpoints( var_0 )
{
    level endon( "game_ended" );
    level endon( "hq_destroyed" );
    level notify( "awardHQPointsRunning" );
    level endon( "awardHQPointsRunning" );
    var_1 = 12;
    var_2 = 5;
    var_3 = 5;
    var_4 = 5;
    var_5 = 5;
    var_6 = 0;

    while ( !level._id_3BDA )
    {
        maps\mp\gametypes\_gamescores::_id_420C( var_0, var_4 );
        var_6++;
        wait(var_5);
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_40D2()
{
    var_0 = undefined;

    if ( isdefined( level.radioobject ) )
    {
        var_1 = level.radioobject maps\mp\gametypes\_gameobjects::_id_4078();

        if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        {
            if ( self._id_0308["team"] == var_1 )
                var_0 = maps\mp\gametypes\_legacyspawnlogic::_id_40D7( level.spawn_all, level.radioobject._id_6078 );
            else if ( level.spawndelay >= level.hqautodestroytime && gettime() > level.hqrevealtime + 10000 )
                var_0 = maps\mp\gametypes\_legacyspawnlogic::_id_40D7( level.spawn_all );
            else
                var_0 = maps\mp\gametypes\_legacyspawnlogic::_id_40D7( level.spawn_all, level.radioobject._id_65C2 );
        }
        else if ( self._id_0308["team"] == var_1 )
        {
            var_2 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.radioobject._id_6078 );
            var_3 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_all );

            if ( var_2 == var_3 )
                var_0 = var_2;
            else
                var_0 = var_3;
        }
        else
        {
            var_2 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.radioobject._id_65C2 );
            var_3 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_all );

            if ( var_2 == var_3 )
                var_0 = var_2;
            else
                var_0 = var_3;
        }
    }

    if ( !isdefined( var_0 ) )
        var_0 = maps\mp\gametypes\_spawnscoring::_id_40D3( level.spawn_all );

    return var_0;
}

_id_64E9()
{
    maps\mp\_utility::_id_1EF5( "hq_respawn" );
    self.forcespawnnearteammates = undefined;
    timerdisplaytoplayer();
    self _meth_82F8( "ui_hide_spawn_timer", 0 );
}

setupradios()
{
    var_0 = [];
    var_1 = getentarray( "hq_hardpoint", "targetname" );

    if ( var_1.size < 2 )
        var_0[var_0.size] = "There are not at least 2 entities with targetname \"radio\"";

    var_2 = getentarray( "radiotrigger", "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = 0;
        var_5 = var_1[var_3];
        var_5._id_9754 = undefined;

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            if ( var_5 _meth_80AB( var_2[var_6] ) )
            {
                if ( isdefined( var_5._id_9754 ) )
                {
                    var_0[var_0.size] = "Radio at " + var_5._id_02E2 + " is touching more than one \"radiotrigger\" trigger";
                    var_4 = 1;
                    break;
                }

                var_5._id_9754 = var_2[var_6];
                break;
            }
        }

        if ( !isdefined( var_5._id_9754 ) )
        {
            if ( !var_4 )
            {
                var_0[var_0.size] = "Radio at " + var_5._id_02E2 + " is not inside any \"radiotrigger\" trigger";
                continue;
            }
        }

        var_5._id_9820 = var_5._id_9754._id_02E2;
        var_7 = [];
        var_7[0] = var_5;
        var_8 = getentarray( var_5._id_04A4, "targetname" );

        for ( var_6 = 0; var_6 < var_8.size; var_6++ )
            var_7[var_7.size] = var_8[var_6];

        var_5._id_9E9C = var_7;
        var_5 makeradioinvisible();
        var_5._id_9E5A = 0;
    }

    if ( var_0.size > 0 )
    {
        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {

        }

        common_scripts\utility::_id_334F( "Map errors. See above" );
        maps\mp\gametypes\_callbacksetup::_id_06BF();
    }
    else
    {
        level.radios = var_1;
        level.prevradio = undefined;
        level.prevradio2 = undefined;
    }
}

makeradiovisible()
{
    maps\mp\gametypes\_gameobjects::_id_7FB5( 1 );

    for ( var_0 = 0; var_0 < self._id_9E9C.size; var_0++ )
    {
        if ( self._id_9E9C[var_0].classname == "script_brushmodel" )
            self._id_9E9C[var_0] _meth_8059();
    }
}

makeradioinvisible()
{
    maps\mp\gametypes\_gameobjects::_id_7FB5( 0 );

    for ( var_0 = 0; var_0 < self._id_9E9C.size; var_0++ )
    {
        if ( self._id_9E9C[var_0].classname == "script_brushmodel" )
            self._id_9E9C[var_0] _meth_805A();
    }
}

makeradioactive()
{
    self._id_3BF8 = maps\mp\gametypes\_gameobjects::_id_244C( "neutral", self._id_9754, self._id_9E9C, self._id_02E2 - self._id_9820 + level.iconoffset );
    self._id_3BF8 makeradioinvisible();
    self._id_9E5A = 0;
    self._id_9754._id_9C09 = self._id_3BF8;
    _id_8326();
}

makeradioinactive()
{
    self._id_3BF8 maps\mp\gametypes\_gameobjects::_id_2874();
    self._id_3BF8 = undefined;
}

_id_8326()
{
    var_0 = level.spawn_all;

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
    var_6 = var_0.size / 3;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_1 <= var_6 || var_0[var_1]._id_2B82 <= 490000 )
            var_4[var_4.size] = var_0[var_1];

        if ( var_1 > var_6 || var_0[var_1]._id_2B82 > 1000000 )
        {
            if ( var_5.size < 10 || var_0[var_1]._id_2B82 < 2250000 )
                var_5[var_5.size] = var_0[var_1];
        }
    }

    self._id_3BF8._id_6078 = var_4;
    self._id_3BF8._id_65C2 = var_5;
}

pickradiotospawn()
{
    var_0 = [];
    var_1 = [];

    foreach ( var_3 in level._id_0323 )
    {
        if ( var_3._id_04A7 == "spectator" )
            continue;

        if ( !_func_1A1( var_3 ) )
            continue;

        var_3._id_2B6C = 0;

        if ( var_3._id_04A7 == "allies" )
        {
            var_0[var_0.size] = var_3;
            continue;
        }

        var_1[var_1.size] = var_3;
    }

    if ( !var_0.size || !var_1.size )
    {
        for ( var_5 = level.radios[_func_0B2( level.radios.size )]; isdefined( level.prevradio ) && var_5 == level.prevradio; var_5 = level.radios[_func_0B2( level.radios.size )] )
        {

        }

        level.prevradio2 = level.prevradio;
        level.prevradio = var_5;
        return var_5;
    }

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        for ( var_7 = var_6 + 1; var_7 < var_0.size; var_7++ )
        {
            var_8 = _func_0F0( var_0[var_6]._id_02E2, var_0[var_7]._id_02E2 );
            var_0[var_6]._id_2B6C += var_8;
            var_0[var_7]._id_2B6C += var_8;
        }
    }

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        for ( var_7 = var_6 + 1; var_7 < var_1.size; var_7++ )
        {
            var_8 = _func_0F0( var_1[var_6]._id_02E2, var_1[var_7]._id_02E2 );
            var_1[var_6]._id_2B6C += var_8;
            var_1[var_7]._id_2B6C += var_8;
        }
    }

    var_9 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_2B6C < var_9._id_2B6C )
            var_9 = var_3;
    }

    var_12["allies"] = var_9._id_02E2;
    var_9 = var_1[0];

    foreach ( var_3 in var_1 )
    {
        if ( var_3._id_2B6C < var_9._id_2B6C )
            var_9 = var_3;
    }

    var_12["axis"] = var_1[0]._id_02E2;
    var_15 = undefined;
    var_16 = undefined;

    for ( var_6 = 0; var_6 < level.radios.size; var_6++ )
    {
        var_5 = level.radios[var_6];
        var_17 = _func_0BE( _func_0EE( var_5._id_02E2, var_12["allies"] ) - _func_0EE( var_5._id_02E2, var_12["axis"] ) );

        if ( isdefined( level.prevradio ) && var_5 == level.prevradio )
            continue;

        if ( isdefined( level.prevradio2 ) && var_5 == level.prevradio2 )
        {
            if ( level.radios.size > 2 )
                continue;
            else
                var_17 += 512;
        }

        if ( !isdefined( var_16 ) || var_17 < var_16 )
        {
            var_16 = var_17;
            var_15 = var_5;
        }
    }

    level.prevradio2 = level.prevradio;
    level.prevradio = var_15;
    return var_15;
}

_id_64D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = self;

    if ( !_func_1AD( var_1 ) )
        return;

    if ( maps\mp\gametypes\_damage::_id_510E( var_10, var_1 ) )
        return;

    if ( var_1 == var_10 )
        return;

    if ( isdefined( var_4 ) && maps\mp\_utility::_id_513D( var_4 ) )
        return;

    if ( !isdefined( level.radioobject ) )
        return;

    var_11 = level.radioobject maps\mp\gametypes\_gameobjects::_id_3F30();

    if ( var_1 _meth_80AB( level.radioobject._id_04C5 ) )
    {
        if ( var_11 == var_1._id_04A7 && !level.radioobject._id_8AF1 )
        {
            var_1 thread maps\mp\_events::_id_53B4( var_10, var_9 );
            return;
        }
    }

    var_12 = level.radioobject maps\mp\gametypes\_gameobjects::_id_4078();

    if ( var_10 _meth_80AB( level.radioobject._id_04C5 ) )
    {
        if ( var_12 == var_1._id_04A7 )
            var_1 thread maps\mp\_events::_id_27AE( var_10, var_9 );
    }
}

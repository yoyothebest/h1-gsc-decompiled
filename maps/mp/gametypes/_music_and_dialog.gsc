// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    game["music"]["spawn_allies"] = maps\mp\gametypes\_teams::_id_411E( "allies" );
    game["music"]["victory_allies"] = maps\mp\gametypes\_teams::_id_4121( "allies" );
    game["music"]["defeat_allies"] = "mp_defeat";
    game["music"]["winning_allies"] = "mp_time_running_out_winning";
    game["music"]["losing_allies"] = "mp_time_running_out_losing";
    game["voice"]["allies"] = maps\mp\gametypes\_teams::_id_4120( "allies" ) + "1mc_";
    game["music"]["spawn_axis"] = maps\mp\gametypes\_teams::_id_411E( "axis" );
    game["music"]["victory_axis"] = maps\mp\gametypes\_teams::_id_4121( "axis" );
    game["music"]["defeat_axis"] = "mp_defeat";
    game["music"]["winning_axis"] = "mp_time_running_out_winning";
    game["music"]["losing_axis"] = "mp_time_running_out_losing";
    game["voice"]["axis"] = maps\mp\gametypes\_teams::_id_4120( "axis" ) + "1mc_";
    game["music"]["losing_time"] = "null";
    game["music"]["suspense"] = [];
    game["music"]["suspense"][game["music"]["suspense"].size] = "mp_suspense_01";
    game["music"]["suspense"][game["music"]["suspense"].size] = "mp_suspense_02";
    game["music"]["suspense"][game["music"]["suspense"].size] = "mp_suspense_03";
    game["music"]["suspense"][game["music"]["suspense"].size] = "mp_suspense_04";
    game["music"]["suspense"][game["music"]["suspense"].size] = "mp_suspense_05";
    game["music"]["suspense"][game["music"]["suspense"].size] = "mp_suspense_06";
    game["dialog"]["mission_success"] = "mission_success";
    game["dialog"]["mission_failure"] = "mission_fail";
    game["dialog"]["mission_draw"] = "draw";
    game["dialog"]["round_success"] = "encourage_win";
    game["dialog"]["round_failure"] = "encourage_lost";
    game["dialog"]["round_draw"] = "draw";
    game["dialog"]["timesup"] = "timesup";
    game["dialog"]["winning_time"] = "winning";
    game["dialog"]["losing_time"] = "losing";
    game["dialog"]["winning_score"] = "winning";
    game["dialog"]["losing_score"] = "losing";
    game["dialog"]["lead_lost"] = "lead_lost";
    game["dialog"]["lead_tied"] = "tied";
    game["dialog"]["lead_taken"] = "lead_taken";
    game["dialog"]["last_alive"] = "lastalive";
    game["dialog"]["boost"] = "boost";

    if ( !isdefined( game["dialog"]["offense_obj"] ) )
        game["dialog"]["offense_obj"] = "boost";

    if ( !isdefined( game["dialog"]["defense_obj"] ) )
        game["dialog"]["defense_obj"] = "boost";

    game["dialog"]["hardcore"] = "hardcore";
    game["dialog"]["highspeed"] = "highspeed";
    game["dialog"]["tactical"] = "tactical";
    game["dialog"]["challenge"] = "challengecomplete";
    game["dialog"]["promotion"] = "promotion";
    game["dialog"]["bomb_taken"] = "bomb_taken";
    game["dialog"]["bomb_lost"] = "bomb_lost";
    game["dialog"]["bomb_planted"] = "bomb_planted";
    game["dialog"]["bomb_defused"] = "bomb_defused";
    game["dialog"]["obj_taken"] = "securedobj";
    game["dialog"]["obj_lost"] = "lostobj";
    game["dialog"]["obj_defend"] = "obj_defend";
    game["dialog"]["obj_destroy"] = "obj_destroy";
    game["dialog"]["obj_capture"] = "gbl_secureobj";
    game["dialog"]["objs_capture"] = "gbl_secureobjs";
    game["dialog"]["move_to_new"] = "new_positions";
    game["dialog"]["push_forward"] = "gbl_rally";
    game["dialog"]["attack"] = "attack";
    game["dialog"]["defend"] = "defend";
    game["dialog"]["offense"] = "offense";
    game["dialog"]["defense"] = "defense";
    game["dialog"]["halftime"] = "halftime";
    game["dialog"]["overtime"] = "overtime";
    game["dialog"]["side_switch"] = "switching";
    game["dialog"]["flag_taken"] = "ctf_retrieveflagally";
    game["dialog"]["enemy_flag_taken"] = "ctf_enemyflagcapd";
    game["dialog"]["flag_dropped"] = "ctf_enemydropflag";
    game["dialog"]["enemy_flag_dropped"] = "ctf_allydropflag";
    game["dialog"]["flag_returned"] = "ctf_allyflagback";
    game["dialog"]["enemy_flag_returned"] = "ctf_enemyflagback";
    game["dialog"]["flag_captured"] = "ctf_enemycapflag";
    game["dialog"]["enemy_flag_captured"] = "ctf_allycapflag";
    game["dialog"]["flag_getback"] = "ctf_retrieveflagally";
    game["dialog"]["enemy_flag_bringhome"] = "ctf_bringhomflag";
    game["dialog"]["hq_located"] = "hq_located";
    game["dialog"]["hq_enemy_captured"] = "hq_captured";
    game["dialog"]["hq_enemy_destroyed"] = "hq_destroyed";
    game["dialog"]["hq_secured"] = "hq_secured";
    game["dialog"]["hq_offline"] = "hq_offline";
    game["dialog"]["hq_online"] = "hq_online";
    game["dialog"]["hp_online"] = "hpt_identified";
    game["dialog"]["hp_lost"] = "hpt_enemycap";
    game["dialog"]["hp_contested"] = "hpt_contested";
    game["dialog"]["hp_secured"] = "hpt_allyown";
    game["dialog"]["securing_a"] = "securing_a";
    game["dialog"]["securing_b"] = "securing_b";
    game["dialog"]["securing_c"] = "securing_c";
    game["dialog"]["secured_a"] = "secure_a";
    game["dialog"]["secured_b"] = "secure_b";
    game["dialog"]["secured_c"] = "secure_c";
    game["dialog"]["losing_a"] = "losing_a";
    game["dialog"]["losing_b"] = "losing_b";
    game["dialog"]["losing_c"] = "losing_c";
    game["dialog"]["lost_a"] = "lost_a";
    game["dialog"]["lost_b"] = "lost_b";
    game["dialog"]["lost_c"] = "lost_c";
    game["dialog"]["enemy_has_a"] = "enemy_has_a";
    game["dialog"]["enemy_has_b"] = "enemy_has_b";
    game["dialog"]["enemy_has_c"] = "enemy_has_c";
    game["dialog"]["lost_all"] = "take_positions";
    game["dialog"]["secure_all"] = "positions_lock";
    game["dialog"]["destroy_sentry"] = "ks_sentrygun_destroyed";
    game["dialog"]["sentry_gone"] = "sentry_gone";
    game["dialog"]["sentry_destroyed"] = "sentry_destroyed";
    game["dialog"]["ti_gone"] = "ti_cancelled";
    game["dialog"]["ti_destroyed"] = "ti_blocked";
    game["dialog"]["ims_destroyed"] = "ims_destroyed";
    game["dialog"]["lbguard_destroyed"] = "lbguard_destroyed";
    game["dialog"]["ballistic_vest_destroyed"] = "ballistic_vest_destroyed";
    game["dialog"]["remote_sentry_destroyed"] = "remote_sentry_destroyed";
    game["dialog"]["sam_destroyed"] = "sam_destroyed";
    game["dialog"]["sam_gone"] = "sam_gone";
    game["dialog"]["claymore_destroyed"] = "null";
    game["dialog"]["mine_destroyed"] = "null";
    game["dialog"]["ti_destroyed"] = "gbl_tactinsertlost";
    game["dialog"]["lockouts"] = [];
    game["dialog"]["lockouts"]["ks_uav_allyuse"] = 6;
    level thread _id_64C8();
    level thread _id_64B7();
    level thread _id_6006();
    level thread _id_64B1();
    level thread _id_64E4();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
        var_0 thread _id_374E();
    }
}

_id_64D6()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );

    if ( getdvar( "virtuallobbyactive" ) == "0" )
    {
        if ( !level._id_8A7C || level._id_8A7C && !isdefined( level._id_6A41 ) )
        {
            if ( !maps\mp\_utility::issecondarysplitscreenplayer() )
                self _meth_82F1( game["music"]["spawn_" + self._id_04A7] );

            if ( level._id_8A7C )
                level._id_6A41 = 1;
        }

        if ( isdefined( game["dialog"]["gametype"] ) && ( !level._id_8A7C || self == level._id_0323[0] ) )
        {
            if ( isdefined( game["dialog"]["allies_gametype"] ) && self._id_04A7 == "allies" )
                maps\mp\_utility::_id_5655( "allies_gametype" );
            else if ( isdefined( game["dialog"]["axis_gametype"] ) && self._id_04A7 == "axis" )
                maps\mp\_utility::_id_5655( "axis_gametype" );
            else if ( !maps\mp\_utility::issecondarysplitscreenplayer() )
                maps\mp\_utility::_id_5655( "gametype" );
        }

        maps\mp\_utility::_id_3BE1( "prematch_done" );

        if ( self._id_04A7 == game["attackers"] )
        {
            if ( !maps\mp\_utility::issecondarysplitscreenplayer() )
                maps\mp\_utility::_id_5655( "offense_obj", "introboost" );
        }
        else if ( !maps\mp\_utility::issecondarysplitscreenplayer() )
            maps\mp\_utility::_id_5655( "defense_obj", "introboost" );
    }
}

_id_64B7()
{
    level endon( "game_ended" );
    level waittill( "last_alive", var_0 );

    if ( !_func_1A1( var_0 ) )
        return;

    var_0 maps\mp\_utility::_id_5655( "last_alive" );
}

_id_64E4()
{
    level waittill( "round_switch", var_0 );

    switch ( var_0 )
    {
        case "halftime":
            foreach ( var_2 in level._id_0323 )
            {
                if ( var_2 maps\mp\_utility::issecondarysplitscreenplayer() )
                    continue;

                var_2 maps\mp\_utility::_id_5655( "halftime" );
            }

            break;
        case "overtime":
            foreach ( var_2 in level._id_0323 )
            {
                if ( var_2 maps\mp\_utility::issecondarysplitscreenplayer() )
                    continue;

                var_2 maps\mp\_utility::_id_5655( "overtime" );
            }

            break;
        default:
            foreach ( var_2 in level._id_0323 )
            {
                if ( var_2 maps\mp\_utility::issecondarysplitscreenplayer() )
                    continue;

                var_2 maps\mp\_utility::_id_5655( "side_switch" );
            }

            break;
    }
}

_id_64B1()
{
    level thread _id_7660();
    level thread _id_3C04();
    level waittill( "game_win", var_0 );

    if ( level._id_91EB )
    {
        if ( level._id_8A7C )
        {
            if ( var_0 == "allies" )
                maps\mp\_utility::_id_6DDD( game["music"]["victory_allies"], "allies" );
            else if ( var_0 == "axis" )
                maps\mp\_utility::_id_6DDD( game["music"]["victory_axis"], "axis" );
            else
            {
                maps\mp\_utility::_id_6DDD( game["music"]["defeat_allies"], "allies" );
                maps\mp\_utility::_id_6DDD( game["music"]["defeat_axis"], "axis" );
            }
        }
        else if ( var_0 == "allies" )
        {
            maps\mp\_utility::_id_6DDD( game["music"]["victory_allies"], "allies" );
            maps\mp\_utility::_id_6DDD( game["music"]["defeat_axis"], "axis" );
        }
        else if ( var_0 == "axis" )
        {
            maps\mp\_utility::_id_6DDD( game["music"]["victory_axis"], "axis" );
            maps\mp\_utility::_id_6DDD( game["music"]["defeat_allies"], "allies" );
        }
        else
        {
            maps\mp\_utility::_id_6DDD( game["music"]["defeat_allies"], "allies" );
            maps\mp\_utility::_id_6DDD( game["music"]["defeat_axis"], "axis" );
        }
    }
    else
    {
        foreach ( var_2 in level._id_0323 )
        {
            if ( var_2 maps\mp\_utility::issecondarysplitscreenplayer() )
                continue;

            if ( var_2._id_0308["team"] != "allies" && var_2._id_0308["team"] != "axis" )
            {
                var_2 _meth_82F1( game["music"]["defeat_allies"] );
                continue;
            }

            if ( isdefined( var_0 ) && _func_1AD( var_0 ) && var_2 == var_0 )
            {
                var_2 _meth_82F1( game["music"]["victory_" + var_2._id_0308["team"]] );
                continue;
            }

            if ( !level._id_8A7C )
                var_2 _meth_82F1( game["music"]["defeat_" + var_2._id_0308["team"]] );
        }
    }
}

_id_7660()
{
    level waittill( "round_win", var_0 );
    var_1 = level._id_7653 / 4;

    if ( var_1 > 0 )
        wait(var_1);

    if ( !isdefined( var_0 ) || _func_1AD( var_0 ) )
        return;

    if ( var_0 == "allies" )
    {
        maps\mp\_utility::_id_564B( "round_success", "allies" );
        maps\mp\_utility::_id_564B( "round_failure", "axis" );
    }
    else if ( var_0 == "axis" )
    {
        maps\mp\_utility::_id_564B( "round_success", "axis" );
        maps\mp\_utility::_id_564B( "round_failure", "allies" );
    }
}

_id_3C04()
{
    level waittill( "game_win", var_0 );
    var_1 = level._id_6E8C / 2;

    if ( var_1 > 0 )
        wait(var_1);

    if ( !isdefined( var_0 ) || _func_1AD( var_0 ) )
        return;

    if ( var_0 == "allies" )
    {
        maps\mp\_utility::_id_564B( "mission_success", "allies" );
        maps\mp\_utility::_id_564B( "mission_failure", "axis" );
    }
    else if ( var_0 == "axis" )
    {
        if ( isdefined( level._id_511D ) )
            [[ level._id_49DE ]]();
        else
        {
            maps\mp\_utility::_id_564B( "mission_success", "axis" );
            maps\mp\_utility::_id_564B( "mission_failure", "allies" );
        }
    }
    else
        maps\mp\_utility::_id_564B( "mission_draw" );
}

_id_6006()
{
    level endon( "game_ended" );

    if ( !level._id_46CA && getdvar( "virtualLobbyActive" ) == "0" )
        thread _id_9000();

    level waittill( "match_ending_soon", var_0 );

    if ( maps\mp\_utility::_id_415E( "roundlimit" ) == 1 || game["roundsPlayed"] == maps\mp\_utility::_id_415E( "roundlimit" ) - 1 )
    {
        if ( !level._id_8A7C )
        {
            if ( var_0 == "time" )
            {
                if ( level._id_91EB )
                {
                    if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
                    {
                        if ( !level._id_46CA )
                        {
                            maps\mp\_utility::_id_6DDD( game["music"]["winning_allies"], "allies" );
                            maps\mp\_utility::_id_6DDD( game["music"]["losing_axis"], "axis" );
                        }

                        maps\mp\_utility::_id_564B( "winning_time", "allies" );
                        maps\mp\_utility::_id_564B( "losing_time", "axis" );
                    }
                    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
                    {
                        if ( !level._id_46CA )
                        {
                            maps\mp\_utility::_id_6DDD( game["music"]["winning_axis"], "axis" );
                            maps\mp\_utility::_id_6DDD( game["music"]["losing_allies"], "allies" );
                        }

                        maps\mp\_utility::_id_564B( "winning_time", "axis" );
                        maps\mp\_utility::_id_564B( "losing_time", "allies" );
                    }
                }
                else
                {
                    if ( !level._id_46CA )
                        maps\mp\_utility::_id_6DDD( game["music"]["losing_time"] );

                    maps\mp\_utility::_id_564B( "timesup" );
                }
            }
            else if ( var_0 == "score" )
            {
                if ( level._id_91EB )
                {
                    if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
                    {
                        if ( !level._id_46CA )
                        {
                            maps\mp\_utility::_id_6DDD( game["music"]["winning_allies"], "allies" );
                            maps\mp\_utility::_id_6DDD( game["music"]["losing_axis"], "axis" );
                        }

                        maps\mp\_utility::_id_564B( "winning_score", "allies" );
                        maps\mp\_utility::_id_564B( "losing_score", "axis" );
                    }
                    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
                    {
                        if ( !level._id_46CA )
                        {
                            maps\mp\_utility::_id_6DDD( game["music"]["winning_axis"], "axis" );
                            maps\mp\_utility::_id_6DDD( game["music"]["losing_allies"], "allies" );
                        }

                        maps\mp\_utility::_id_564B( "winning_score", "axis" );
                        maps\mp\_utility::_id_564B( "losing_score", "allies" );
                    }
                }
                else
                {
                    var_1 = maps\mp\gametypes\_gamescores::_id_3FC9();
                    var_2 = maps\mp\gametypes\_gamescores::_id_4010();
                    var_3[0] = var_1;

                    if ( !level._id_46CA )
                    {
                        var_1 _meth_82F1( game["music"]["winning_" + var_1._id_0308["team"]] );

                        foreach ( var_5 in level._id_0323 )
                        {
                            if ( var_5 == var_1 )
                                continue;

                            var_5 _meth_82F1( game["music"]["losing_" + var_5._id_0308["team"]] );
                        }
                    }

                    var_1 maps\mp\_utility::_id_5655( "winning_score" );
                    maps\mp\_utility::_id_5658( "losing_score", var_2 );
                }
            }

            level waittill( "match_ending_very_soon" );
            maps\mp\_utility::_id_564B( "timesup" );
        }
    }
    else
    {
        if ( !level._id_46CA )
            maps\mp\_utility::_id_6DDD( game["music"]["losing_allies"] );

        maps\mp\_utility::_id_564B( "timesup" );
    }
}

_id_9000()
{
    level endon( "game_ended" );
    level endon( "match_ending_soon" );
    var_0 = game["music"]["suspense"].size;
    wait 120;

    for (;;)
    {
        wait(_func_0B5( 60, 120 ));
        maps\mp\_utility::_id_6DDD( game["music"]["suspense"][_func_0B2( var_0 )] );
    }
}

_id_374E()
{
    self waittill( "showing_final_killcam" );
}

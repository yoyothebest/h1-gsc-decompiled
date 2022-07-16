// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_64AF( var_0 )
{
    if ( isdefined( level._id_39DF ) )
        return;

    level endon( "abort_forfeit" );
    level thread _id_39E0();
    level._id_39DF = 1;

    if ( !level._id_91EB && level._id_0323.size > 1 )
        wait 10;
    else
        wait 1.05;

    level._id_39DE = 0;
    var_1 = 20.0;
    _id_59E1( var_1 );
    var_2 = &"";

    if ( !isdefined( var_0 ) )
    {
        level._id_374D = "none";
        var_2 = game["end_reason"]["players_forfeited"];
        var_3 = level._id_0323[0];
    }
    else if ( var_0 == "axis" )
    {
        level._id_374D = "axis";
        var_2 = game["end_reason"]["allies_forfeited"];

        if ( level._id_01B3 == "infect" )
            var_2 = game["end_reason"]["survivors_forfeited"];

        var_3 = "axis";
    }
    else if ( var_0 == "allies" )
    {
        level._id_374D = "allies";
        var_2 = game["end_reason"]["axis_forfeited"];

        if ( level._id_01B3 == "infect" )
            var_2 = game["end_reason"]["infected_forfeited"];

        var_3 = "allies";
    }
    else if ( level._id_5FEC && _func_120( var_0, "team_" ) )
        var_3 = var_0;
    else
    {
        level._id_374D = "none";
        var_3 = "tie";
    }

    level._id_39B8 = 1;

    if ( _func_1AD( var_3 ) )
        logstring( "forfeit, win: " + var_3 _meth_8293() + "(" + var_3._id_02A7 + ")" );
    else
        logstring( "forfeit, win: " + var_3 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );

    thread _id_315F( var_3, var_2 );
}

_id_39E0()
{
    level endon( "game_ended" );
    level waittill( "abort_forfeit" );
    level._id_39DE = 1;
    setomnvar( "ui_match_countdown", 0 );
    setomnvar( "ui_match_countdown_title", 0 );
    setomnvar( "ui_match_countdown_toggle", 0 );
}

_id_59E2( var_0 )
{
    waitframe;
    level endon( "match_forfeit_timer_beginning" );
    setomnvar( "ui_match_countdown_title", 3 );
    setomnvar( "ui_match_countdown_toggle", 1 );

    while ( var_0 > 0 && !level._id_3BDA && !level._id_39DE && !level._id_4C6D )
    {
        setomnvar( "ui_match_countdown", var_0 );
        wait 1;
        var_0--;
    }
}

_id_59E1( var_0 )
{
    level notify( "match_forfeit_timer_beginning" );
    var_1 = _func_0BC( var_0 );
    _id_59E2( var_1 );
    setomnvar( "ui_match_countdown", 0 );
    setomnvar( "ui_match_countdown_title", 0 );
    setomnvar( "ui_match_countdown_toggle", 0 );
}

_id_2784( var_0 )
{
    level._id_374D = "none";

    if ( var_0 == "allies" )
    {
        logstring( "team eliminated, win: opfor, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        level._id_374D = "axis";
        thread _id_315F( "axis", game["end_reason"]["allies_eliminated"] );
    }
    else if ( var_0 == "axis" )
    {
        logstring( "team eliminated, win: allies, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        level._id_374D = "allies";
        thread _id_315F( "allies", game["end_reason"]["axis_eliminated"] );
    }
    else
    {
        logstring( "tie, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        level._id_374D = "none";

        if ( level._id_91EB )
            thread _id_315F( "tie", game["end_reason"]["tie"] );
        else
            thread _id_315F( undefined, game["end_reason"]["tie"] );
    }
}

_id_2786( var_0 )
{
    if ( level._id_91EB )
    {
        var_1 = maps\mp\_utility::_id_3FFC( var_0 );
        var_1 thread _id_41F0();
    }
    else
    {
        var_1 = maps\mp\_utility::_id_3FFC();
        logstring( "last one alive, win: " + var_1._id_02A7 );
        level._id_374D = "none";
        thread _id_315F( var_1, game["end_reason"]["enemies_eliminated"] );
    }

    return 1;
}

_id_2787()
{
    var_0 = undefined;
    level._id_374D = "none";

    if ( level._id_91EB )
    {
        if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
            var_0 = "tie";
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            level._id_374D = "axis";
            var_0 = "axis";
        }
        else
        {
            level._id_374D = "allies";
            var_0 = "allies";
        }

        logstring( "time limit, win: " + var_0 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_0 = maps\mp\gametypes\_gamescores::_id_3FC9();

        if ( isdefined( var_0 ) )
            logstring( "time limit, win: " + var_0._id_02A7 );
        else
            logstring( "time limit, tie" );
    }

    thread _id_315F( var_0, game["end_reason"]["time_limit_reached"] );
}

_id_2785( var_0 )
{
    var_1 = undefined;
    level._id_374D = "none";
    thread _id_315F( "halftime", game["end_reason"][var_0] );
}

_id_39BC()
{
    if ( level._id_4A31 || level._id_39B8 )
        return;

    var_0 = undefined;
    level._id_374D = "none";

    if ( level._id_91EB )
    {
        if ( isdefined( level._id_511D ) )
            var_0 = "axis";
        else if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
            var_0 = "tie";
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            level._id_374D = "axis";
            var_0 = "axis";
        }
        else
        {
            level._id_374D = "allies";
            var_0 = "allies";
        }

        logstring( "host ended game, win: " + var_0 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_0 = maps\mp\gametypes\_gamescores::_id_3FC9();

        if ( isdefined( var_0 ) )
            logstring( "host ended game, win: " + var_0._id_02A7 );
        else
            logstring( "host ended game, tie" );
    }

    level._id_39B8 = 1;
    level._id_4A31 = 1;

    if ( level._id_8A7C )
        var_1 = game["end_reason"]["ended_game"];
    else
        var_1 = game["end_reason"]["host_ended_game"];

    _func_268( 1 );
    thread _id_315F( var_0, var_1 );
}

_id_64E6()
{
    var_0 = game["end_reason"]["score_limit_reached"];
    var_1 = undefined;
    level._id_374D = "none";

    if ( level._id_5FEC )
    {
        var_1 = maps\mp\gametypes\_gamescores::_id_416F();

        if ( var_1 == "none" )
            var_1 = "tie";
    }
    else if ( level._id_91EB )
    {
        if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
            var_1 = "tie";
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            var_1 = "axis";
            level._id_374D = "axis";
        }
        else
        {
            var_1 = "allies";
            level._id_374D = "allies";
        }

        logstring( "scorelimit, win: " + var_1 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_1 = maps\mp\gametypes\_gamescores::_id_3FC9();

        if ( isdefined( var_1 ) )
            logstring( "scorelimit, win: " + var_1._id_02A7 );
        else
            logstring( "scorelimit, tie" );
    }

    thread _id_315F( var_1, var_0 );
}

_id_9B1F()
{
    if ( maps\mp\_utility::_id_59E3() && !level._id_4C6D && !getdvarint( "force_ranking" ) && ( !isdefined( level._id_2B11 ) || !level._id_2B11 ) && !maps\mp\_utility::_id_4FA6() )
    {
        if ( level._id_5FEC )
        {
            var_0 = 0;
            var_1 = 0;

            for ( var_2 = 0; var_2 < level._id_91F7.size; var_2++ )
            {
                var_0 += level._id_91ED[level._id_91F7[var_2]];

                if ( level._id_91ED[level._id_91F7[var_2]] )
                    var_1 += 1;
            }

            for ( var_2 = 0; var_2 < level._id_91F7.size; var_2++ )
            {
                if ( var_0 == level._id_91ED[level._id_91F7[var_2]] && game["state"] == "playing" )
                {
                    thread _id_64AF( level._id_91F7[var_2] );
                    return;
                }
            }

            if ( var_1 > 1 )
            {
                level._id_39DF = undefined;
                level notify( "abort_forfeit" );
            }
        }
        else if ( level._id_91EB )
        {
            if ( level._id_91ED["allies"] < 1 && level._id_91ED["axis"] > 0 && game["state"] == "playing" )
            {
                thread _id_64AF( "axis" );
                return;
            }

            if ( level._id_91ED["axis"] < 1 && level._id_91ED["allies"] > 0 && game["state"] == "playing" )
            {
                thread _id_64AF( "allies" );
                return;
            }

            if ( level._id_91ED["axis"] > 0 && level._id_91ED["allies"] > 0 )
            {
                level._id_39DF = undefined;
                level notify( "abort_forfeit" );
            }
        }
        else
        {
            if ( level._id_91ED["allies"] + level._id_91ED["axis"] == 1 && game["state"] == "playing" )
            {
                thread _id_64AF();
                return;
            }

            if ( level._id_91ED["axis"] + level._id_91ED["allies"] > 1 )
            {
                level._id_39DF = undefined;
                level notify( "abort_forfeit" );
            }
        }
    }

    if ( isdefined( level.ongameeventlives ) )
        self [[ level.ongameeventlives ]]();
    else
    {
        if ( !maps\mp\_utility::_id_3FAA() && ( !isdefined( level._id_2B28 ) || !level._id_2B28 ) )
            return;

        if ( !maps\mp\_utility::_id_3BE2() )
            return;

        if ( level._id_4C6D )
            return;

        if ( level._id_5FEC )
            return;

        if ( level._id_91EB )
        {
            var_3["allies"] = level._id_57B9["allies"];
            var_3["axis"] = level._id_57B9["axis"];

            if ( isdefined( level._id_2B28 ) && level._id_2B28 )
            {
                var_3["allies"] = 0;
                var_3["axis"] = 0;
            }

            if ( !level._id_09DD["allies"] && !level._id_09DD["axis"] && !var_3["allies"] && !var_3["axis"] )
                return [[ level._id_6466 ]]( "all" );

            if ( !level._id_09DD["allies"] && !var_3["allies"] )
                return [[ level._id_6466 ]]( "allies" );

            if ( !level._id_09DD["axis"] && !var_3["axis"] )
                return [[ level._id_6466 ]]( "axis" );

            var_4 = level._id_09DD["allies"] == 1 && !var_3["allies"];
            var_5 = level._id_09DD["axis"] == 1 && !var_3["axis"];

            if ( ( var_4 || var_5 ) && !isdefined( level._id_1702 ) )
            {
                var_6 = undefined;

                if ( var_4 && !isdefined( level._id_648B["allies"] ) )
                {
                    level._id_648B["allies"] = gettime();
                    var_7 = [[ level._id_64C0 ]]( "allies" );

                    if ( isdefined( var_7 ) )
                    {
                        if ( !isdefined( var_6 ) )
                            var_6 = var_7;

                        var_6 = var_6 || var_7;
                    }
                }

                if ( var_5 && !isdefined( level._id_648B["axis"] ) )
                {
                    level._id_648B["axis"] = gettime();
                    var_8 = [[ level._id_64C0 ]]( "axis" );

                    if ( isdefined( var_8 ) )
                    {
                        if ( !isdefined( var_6 ) )
                            var_6 = var_8;

                        var_6 = var_6 || var_8;
                    }
                }

                return var_6;
                return;
            }

            return;
        }

        if ( !level._id_09DD["allies"] && !level._id_09DD["axis"] && ( !level._id_57B9["allies"] && !level._id_57B9["axis"] ) )
            return [[ level._id_6466 ]]( "all" );

        var_9 = maps\mp\_utility::_id_4093();

        if ( var_9.size == 1 )
            return [[ level._id_64C0 ]]( "all" );
    }
}

_id_A0DA()
{
    if ( !isdefined( level._id_374D ) )
        return 0;

    level waittill( "final_killcam_done" );
    return 1;
}

_id_9365( var_0 )
{
    _func_142( gettime() + _func_0BC( var_0 * 1000 ) );
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 _meth_8056();

    if ( var_0 >= 10.0 )
        wait(var_0 - 10.0);

    for (;;)
    {
        var_1 _meth_809C( "ui_mp_timer_countdown" );
        wait 1.0;
    }
}

_id_A02B( var_0 )
{
    var_1 = gettime();
    var_2 = var_1 + var_0 * 1000 - 200;

    if ( var_0 > 5 )
        var_3 = gettime() + getdvarint( "min_wait_for_players" ) * 1000;
    else
        var_3 = 0;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        var_4 = level._id_214B;
    else
        var_4 = level._id_214B / 3;

    var_5 = 0;

    for (;;)
    {
        if ( isdefined( game["roundsPlayed"] ) && game["roundsPlayed"] )
            break;

        var_6 = level._id_5A4D;
        var_7 = gettime();

        if ( var_6 >= var_4 && var_7 > var_3 || var_7 > var_2 )
            break;

        wait 0.05;
    }
}

_id_6F09()
{
    level endon( "game_ended" );
    level._id_214B = getdvarint( "party_partyPlayerCountNum" );

    if ( level._id_6F09 > 0 )
    {
        level._id_A048 = 1;
        _id_59F0();
        level._id_A048 = 0;
    }
    else
        _id_59EF();

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        level._id_0323[var_0] maps\mp\_utility::_id_3A32( 0 );
        level._id_0323[var_0] _meth_831B();
        level._id_0323[var_0] _meth_800C();
        var_1 = maps\mp\_utility::_id_405A( level._id_0323[var_0]._id_0308["team"] );

        if ( !isdefined( var_1 ) || !level._id_0323[var_0]._id_4745 )
            continue;

        level._id_0323[var_0] thread maps\mp\gametypes\_hud_message::_id_4909( var_1 );
    }

    if ( game["state"] != "playing" )
        return;
}

_id_42F3()
{
    level endon( "game_ended" );

    if ( !isdefined( game["clientActive"] ) )
    {
        while ( _func_285() == 0 )
            wait 0.05;

        game["clientActive"] = 1;
    }

    while ( level._id_4C6D > 0 )
    {
        wait 1.0;
        level._id_4C6D--;
    }

    level notify( "grace_period_ending" );
    wait 0.05;
    maps\mp\_utility::_id_3BE0( "graceperiod_done" );
    level._id_4C6D = 0;

    if ( game["state"] != "playing" )
        return;

    level thread _id_9B1F();
}

_id_7F85( var_0, var_1 )
{
    var_0 notify( "hasDoneCombat" );
    var_0._id_4729 = var_1;

    if ( !_id_4728( var_0 ) && var_1 )
    {
        var_0._id_0308["hasDoneAnyCombat"] = 1;

        if ( isdefined( var_0._id_0308["hasMatchLoss"] ) && var_0._id_0308["hasMatchLoss"] )
            return;

        _id_9B30( var_0 );
    }
}

_id_4728( var_0 )
{
    return isdefined( var_0._id_0308["hasDoneAnyCombat"] );
}

_id_9BA7( var_0 )
{
    if ( !var_0 maps\mp\_utility::_id_7139() )
        return;

    if ( !_id_4728( var_0 ) && !( level._id_01B3 == "infect" ) && !maps\mp\_utility::ishodgepodgeph() )
        return;

    var_0 maps\mp\gametypes\_persistence::_id_8D50( "losses", -1 );
    var_0 maps\mp\gametypes\_persistence::_id_8D50( "wins", 1 );
    var_0 maps\mp\_utility::_id_9B47( "winLossRatio", "wins", "losses" );
    var_0 maps\mp\gametypes\_persistence::_id_8D50( "currentWinStreak", 1 );
    var_1 = var_0 maps\mp\gametypes\_persistence::_id_8D68( "currentWinStreak" );

    if ( var_1 > var_0 maps\mp\gametypes\_persistence::_id_8D68( "winStreak" ) )
        var_0 maps\mp\gametypes\_persistence::_id_8D78( "winStreak", var_1 );

    var_0 maps\mp\gametypes\_persistence::_id_8D7A( "round", "win", 1 );
    var_0 maps\mp\gametypes\_persistence::_id_8D7A( "round", "loss", 0 );
    var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_" + level._id_01B3 + "_wins" );
    var_0._id_20B1 = 1;
    var_2 = maps\mp\_utility::_id_4015();

    if ( var_2 == "mp_crash_snow" )
        var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_wc_wins" );
    else if ( var_2 == "mp_farm_spring" )
        var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_stpatty_wins" );
    else if ( var_2 == "mp_bog_summer" )
        var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_summer_wins" );

    if ( level._id_0323.size > 5 )
    {
        _id_8FDE( var_0 );

        switch ( level._id_01B3 )
        {
            case "war":
                if ( game["teamScores"][var_0._id_04A7] >= game["teamScores"][maps\mp\_utility::_id_4067( var_0._id_04A7 )] + 20 )
                    var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_war_crushing" );

                break;
            case "hp":
                if ( game["teamScores"][var_0._id_04A7] >= game["teamScores"][maps\mp\_utility::_id_4067( var_0._id_04A7 )] + 70 )
                {

                }

                break;
            case "conf":
                if ( game["teamScores"][var_0._id_04A7] >= game["teamScores"][maps\mp\_utility::_id_4067( var_0._id_04A7 )] + 15 )
                {

                }

                break;
            case "ball":
                if ( game["teamScores"][var_0._id_04A7] >= game["teamScores"][maps\mp\_utility::_id_4067( var_0._id_04A7 )] + 7 )
                {

                }

                break;
            case "infect":
                if ( var_0._id_04A7 == "allies" )
                {
                    if ( game["teamScores"][var_0._id_04A7] >= 4 )
                    {

                    }

                    if ( game["teamScores"][maps\mp\_utility::_id_4067( var_0._id_04A7 )] == 1 )
                    {

                    }
                }

                break;
            case "dm":
                if ( isdefined( level._id_6861["all"][0] ) )
                {
                    var_3 = level._id_6861["all"][0];
                    var_4 = 9999;

                    if ( var_0 == var_3 )
                    {
                        foreach ( var_6 in level._id_0323 )
                        {
                            if ( var_0 == var_6 )
                                continue;

                            var_7 = var_0._id_038D - var_6._id_038D;

                            if ( var_7 < var_4 )
                                var_4 = var_7;
                        }

                        if ( var_4 >= 7 )
                            var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_dm_crushing" );
                    }
                }

                break;
            case "gun":
                foreach ( var_10 in level._id_0323 )
                {
                    if ( var_0 == var_10 )
                        continue;

                    if ( var_0._id_038D < var_10._id_038D + 5 )
                        break;
                }

                break;
            case "ctf":
            case "twar":
                if ( game["shut_out"][var_0._id_04A7] )
                {

                }

                break;
        }
    }
}

_id_8FDE( var_0 )
{
    var_1 = 0;
    var_2 = 9999;

    foreach ( var_4 in level._id_0323 )
    {
        if ( var_4._id_0239 > var_1 )
            var_1 = var_4._id_0239;

        if ( var_4._id_010D < var_2 )
            var_2 = var_4._id_010D;
    }

    if ( var_0._id_0239 >= var_1 && var_0._id_010D <= var_2 && var_0._id_0239 > 0 && !_func_0CF( var_0 ) )
        var_0 maps\mp\gametypes\_misions::_id_6FF6( "ch_superstar" );
}

_id_1D07()
{
    if ( level._id_01B3 == "dom" )
    {
        foreach ( var_1 in level._id_2CF9 )
        {
            if ( !isdefined( var_1._id_6631 ) || !var_1._id_6631 )
                continue;

            var_2 = var_1 maps\mp\gametypes\_gameobjects::_id_4078();

            foreach ( var_4 in level._id_0323 )
            {
                if ( var_4._id_04A7 != var_2 )
                    continue;

                switch ( var_1._id_0241 )
                {
                    case "_a":
                        var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_dom_alphalock" );
                        continue;
                    case "_b":
                        var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_dom_bravolock" );
                        continue;
                    case "_c":
                        var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_dom_charlielock" );
                        continue;
                }
            }
        }
    }
}

_id_9B30( var_0 )
{
    if ( !var_0 maps\mp\_utility::_id_7139() )
        return;

    if ( !_id_4728( var_0 ) && !maps\mp\_utility::ishodgepodgeph() )
        return;

    var_0._id_0308["hasMatchLoss"] = 1;
    var_0 maps\mp\gametypes\_persistence::_id_8D50( "losses", 1 );
    var_0 maps\mp\_utility::_id_9B47( "winLossRatio", "wins", "losses" );
    var_0 maps\mp\gametypes\_persistence::_id_8D50( "gamesPlayed", 1 );
    var_0 maps\mp\gametypes\_persistence::_id_8D7A( "round", "loss", 1 );
}

_id_9B89( var_0 )
{
    if ( !var_0 maps\mp\_utility::_id_7139() )
        return;

    if ( !_id_4728( var_0 ) && !maps\mp\_utility::ishodgepodgeph() )
        return;

    var_0 maps\mp\gametypes\_persistence::_id_8D50( "losses", -1 );
    var_0 maps\mp\gametypes\_persistence::_id_8D50( "ties", 1 );
    var_0 maps\mp\_utility::_id_9B47( "winLossRatio", "wins", "losses" );
    var_0 maps\mp\gametypes\_persistence::_id_8D78( "currentWinStreak", 0 );
    var_0._id_20B0 = 1;
}

_id_9BA6( var_0 )
{
    if ( maps\mp\_utility::_id_6FD0() )
        return;

    if ( !isdefined( var_0 ) || isdefined( var_0 ) && isstring( var_0 ) && var_0 == "tie" )
    {
        foreach ( var_2 in level._id_0323 )
        {
            if ( isdefined( var_2._id_214A ) )
                continue;

            if ( statlossprevention( var_2 ) )
            {
                updatestatlossprevention( var_2 );
                continue;
            }

            if ( level._id_4A31 && var_2 _meth_8298() )
            {
                var_2 maps\mp\gametypes\_persistence::_id_8D78( "currentWinStreak", 0 );
                continue;
            }

            _id_9B89( var_2 );
        }
    }
    else if ( _func_1AD( var_0 ) )
    {
        var_4[0] = var_0;

        if ( level._id_0323.size > 5 )
            var_4 = maps\mp\gametypes\_gamescores::_id_3FCA( 3 );

        foreach ( var_2 in level._id_0323 )
        {
            if ( isdefined( var_2._id_214A ) )
                continue;

            if ( level._id_4A31 && var_2 _meth_8298() )
            {
                var_2 maps\mp\gametypes\_persistence::_id_8D78( "currentWinStreak", 0 );
                continue;
            }

            if ( common_scripts\utility::_id_0CE4( var_4, var_2 ) )
            {
                _id_9BA7( var_2 );
                continue;
            }

            if ( statlossprevention( var_2 ) )
                updatestatlossprevention( var_2 );
        }
    }
    else if ( isstring( var_0 ) )
    {
        foreach ( var_2 in level._id_0323 )
        {
            if ( isdefined( var_2._id_214A ) )
                continue;

            if ( level._id_4A31 && var_2 _meth_8298() )
            {
                var_2 maps\mp\gametypes\_persistence::_id_8D78( "currentWinStreak", 0 );
                continue;
            }

            if ( var_2._id_0308["team"] == var_0 )
            {
                _id_9BA7( var_2 );
                continue;
            }

            if ( statlossprevention( var_2 ) )
            {
                updatestatlossprevention( var_2 );
                continue;
            }

            var_2 maps\mp\gametypes\_persistence::_id_8D78( "currentWinStreak", 0 );
        }
    }

    if ( level._id_0323.size > 5 )
    {
        var_4 = maps\mp\gametypes\_gamescores::_id_3FCA( 3 );

        for ( var_9 = 0; var_9 < var_4.size; var_9++ )
        {
            if ( var_9 == 0 )
                var_4[var_9] maps\mp\gametypes\_misions::_id_6FF6( "ch_mvp" );

            var_4[var_9] maps\mp\gametypes\_misions::_id_6FF6( "ch_superior" );
        }
    }
}

updatestatlossprevention( var_0 )
{
    if ( !var_0 maps\mp\_utility::_id_7139() )
        return;

    if ( !_id_4728( var_0 ) && !( level._id_01B3 == "infect" ) && !maps\mp\_utility::ishodgepodgeph() )
        return;

    var_0 maps\mp\gametypes\_persistence::_id_8D50( "losses", -1 );
    var_0.displaystatlossui = 1;
}

statlossprevention( var_0 )
{
    if ( !isdefined( var_0._id_0308["absoluteJoinTime"] ) || !isdefined( game["absoluteStartTime"] ) )
        return 0;

    var_1 = var_0._id_0308["absoluteJoinTime"] - game["absoluteStartTime"];
    var_2 = 95;

    if ( var_1 >= var_2 )
        return 1;

    return 0;
}

_id_3A35( var_0 )
{
    self endon( "disconnect" );
    maps\mp\_utility::_id_1EF6();

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    self _meth_8322();
    self _meth_8268();
    wait(var_0);
    maps\mp\_utility::_id_3A32( 1 );
}

_id_9B34( var_0 )
{
    if ( !game["timePassed"] )
        return;

    if ( !maps\mp\_utility::_id_59E3() )
        return;

    if ( level._id_91EB )
    {
        if ( var_0 == "allies" )
        {
            var_1 = "allies";
            var_2 = "axis";
        }
        else if ( var_0 == "axis" )
        {
            var_1 = "axis";
            var_2 = "allies";
        }
        else
        {
            var_1 = "tie";
            var_2 = "tie";
        }

        if ( var_1 != "tie" )
            _func_15B( var_1 );

        foreach ( var_4 in level._id_0323 )
        {
            if ( isdefined( var_4._id_214A ) )
                continue;

            if ( !var_4 maps\mp\_utility::_id_7139() )
                continue;

            if ( var_4._id_9372["total"] < 1 || var_4._id_0308["participation"] < 1 )
            {
                if ( level._id_01B3 != "infect" && level._id_01B3 != "sd" )
                    continue;
            }

            if ( level._id_4A31 && var_4 _meth_8298() )
                continue;

            if ( !_id_4728( var_4 ) && !( level._id_01B3 == "infect" ) && !maps\mp\_utility::ishodgepodgeph() )
                continue;

            var_5 = 0;

            if ( var_1 == "tie" )
            {
                var_5 = maps\mp\gametypes\_rank::_id_40C1( "tie" );
                var_4._id_2A4F = 1;
                var_4._id_520A = 0;
            }
            else if ( isdefined( var_4._id_0308["team"] ) && var_4._id_0308["team"] == var_1 )
            {
                var_5 = maps\mp\gametypes\_rank::_id_40C1( "win" );
                var_4._id_520A = 1;
            }
            else if ( isdefined( var_4._id_0308["team"] ) && var_4._id_0308["team"] == var_2 )
            {
                var_5 = maps\mp\gametypes\_rank::_id_40C1( "loss" );
                var_4._id_520A = 0;
            }

            var_4._id_59DF = _func_0BC( var_5 );
        }
    }
    else
    {
        foreach ( var_4 in level._id_0323 )
        {
            if ( isdefined( var_4._id_214A ) )
                continue;

            if ( !var_4 maps\mp\_utility::_id_7139() )
                continue;

            if ( var_4._id_9372["total"] < 1 || var_4._id_0308["participation"] < 1 )
                continue;

            if ( level._id_4A31 && var_4 _meth_8298() )
                continue;

            if ( !_id_4728( var_4 ) )
                continue;

            var_4._id_520A = 0;

            for ( var_8 = 0; var_8 < _func_0BF( level._id_6861["all"].size, 3 ); var_8++ )
            {
                if ( level._id_6861["all"][var_8] != var_4 )
                    continue;

                var_4._id_520A = 1;
            }

            var_5 = 0;

            if ( var_4._id_520A )
                var_5 = maps\mp\gametypes\_rank::_id_40C1( "win" );
            else
                var_5 = maps\mp\gametypes\_rank::_id_40C1( "loss" );

            var_4._id_59DF = _func_0BC( var_5 );
        }
    }

    foreach ( var_4 in level._id_0323 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_4._id_520A ) )
            continue;

        var_11 = "loss";

        if ( var_4._id_520A )
            var_11 = "win";

        if ( isdefined( var_4._id_2A4F ) && var_4._id_2A4F )
            var_11 = "tie";

        var_4 thread _id_41F2( var_11, var_4._id_59DF );
    }
}

_id_41F2( var_0, var_1 )
{
    self endon( "disconnect" );
    level waittill( "give_match_bonus" );
    maps\mp\gametypes\_rank::_id_41FF( var_0, var_1 );
    maps\mp\_utility::_id_584D();
}

setplayerrank( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_0239 ) || !isdefined( var_0._id_010D ) )
        return;

    var_1 = var_0._id_9372["total"] / 60.0;
    var_2 = var_1 >= 2.0;

    if ( !var_2 )
        return;

    var_3 = var_0._id_0239;
    var_4 = var_0._id_010D;
    var_5 = _func_0BD( var_3 - var_4 ) * 1000.0;
    var_6 = _func_0BC( var_5 / var_1 );
    _func_177( var_0, var_0._id_1F0F, var_6 );
}

_id_8359( var_0 )
{
    var_1 = level._id_0323;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        setplayerrank( var_3 );
    }
}

_id_1D20( var_0 )
{
    if ( isdefined( level._id_9366 ) && level._id_9366 )
        return;

    if ( game["state"] != "playing" )
    {
        _func_142( 0 );
        return;
    }

    if ( maps\mp\_utility::_id_412B() <= 0 )
    {
        if ( isdefined( level._id_8D41 ) )
            _func_142( level._id_8D41 );
        else
            _func_142( 0 );

        return;
    }

    if ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
    {
        _func_142( 0 );
        return;
    }

    if ( !isdefined( level._id_8D41 ) )
        return;

    if ( maps\mp\_utility::_id_4130() > level._id_9371 )
        _func_268( 1 );

    var_1 = _id_4131();

    if ( maps\mp\_utility::_id_3FC0() && game["status"] != "halftime" )
        _func_142( gettime() + _func_0BC( var_1 ) - _func_0BC( maps\mp\_utility::_id_412B() * 60 * 1000 * 0.5 ) );
    else
        _func_142( gettime() + _func_0BC( var_1 ) );

    if ( var_1 > 0 )
    {
        if ( maps\mp\_utility::_id_3FC0() && _id_1D0A( var_0 ) )
            [[ level._id_64B2 ]]( "time_limit_reached" );

        return;
    }

    [[ level._id_64F0 ]]();
}

_id_1D0B()
{
    if ( !level._id_44FD )
        return 0;

    if ( !level._id_91EB )
        return 0;

    if ( game["status"] != "normal" )
        return 0;

    var_0 = maps\mp\_utility::_id_415E( "scorelimit" );

    if ( var_0 )
    {
        if ( game["teamScores"]["allies"] >= var_0 || game["teamScores"]["axis"] >= var_0 )
            return 0;

        var_1 = _func_0BC( var_0 / 2 + 0.5 );

        if ( game["teamScores"]["allies"] >= var_1 || game["teamScores"]["axis"] >= var_1 )
        {
            game["roundMillisecondsAlreadyPassed"] = maps\mp\_utility::_id_412C();

            if ( level.halftimeonscorelimitsettimetobeat )
                game["round_time_to_beat"] = maps\mp\_utility::_id_4024();

            return 1;
        }
    }

    return 0;
}

_id_1D0A( var_0 )
{
    if ( !level._id_91EB )
        return 0;

    if ( game["status"] != "normal" )
        return 0;

    if ( maps\mp\_utility::_id_412B() )
    {
        var_1 = maps\mp\_utility::_id_412B() * 60 * 1000 * 0.5;

        if ( maps\mp\_utility::_id_412C() >= var_1 && var_0 < var_1 && var_0 > 0 )
        {
            game["roundMillisecondsAlreadyPassed"] = maps\mp\_utility::_id_412C();
            return 1;
        }
    }

    return 0;
}

_id_4131()
{
    var_0 = maps\mp\_utility::_id_412C();
    var_1 = maps\mp\_utility::_id_412B();
    var_2 = var_1 * 60 * 1000;

    if ( maps\mp\_utility::_id_3FC0() && game["status"] == "halftime" && isdefined( level._id_381C ) )
    {
        var_3 = var_2 * 0.5;

        if ( level._id_381C < var_3 )
        {
            if ( level._id_44FD && level.halftimeonscorelimitsettimetobeat )
                var_0 = var_2 - level._id_381C + var_0 - level._id_381C;
            else
                var_0 += var_3 - level._id_381C;
        }
    }

    return var_2 - var_0;
}

_id_1D1F( var_0 )
{
    if ( maps\mp\_utility::_id_415E( "scorelimit" ) <= 0 || maps\mp\_utility::_id_5160() )
        return;

    if ( isdefined( level._id_78A1 ) && level._id_78A1 )
        return;

    if ( level._id_01B3 == "conf" )
        return;

    if ( !level._id_91EB )
        return;

    if ( maps\mp\_utility::ishodgepodgemm() )
        return;

    if ( maps\mp\_utility::_id_412C() < 60000 )
        return;

    var_1 = _id_3389( var_0 );

    if ( var_1 < 2 )
        level notify( "match_ending_soon", "score" );
}

_id_1D16()
{
    if ( maps\mp\_utility::_id_415E( "scorelimit" ) <= 0 || maps\mp\_utility::_id_5160() )
        return;

    if ( level._id_91EB )
        return;

    if ( maps\mp\_utility::_id_412C() < 60000 )
        return;

    var_0 = _id_3389();
    var_1 = 2;

    if ( level._id_01B3 == "gun" )
        var_1 = 1;

    if ( var_0 < var_1 )
        level notify( "match_ending_soon", "score" );
}

_id_1D1A()
{
    if ( maps\mp\_utility::_id_5160() )
        return;

    if ( isdefined( level._id_78A1 ) && level._id_78A1 )
        return;

    if ( game["state"] != "playing" )
        return;

    if ( maps\mp\_utility::_id_415E( "scorelimit" ) <= 0 )
        return;

    if ( maps\mp\_utility::_id_5092( level.checkscorelimitonframeend ) )
    {
        self notify( "checkScoreLimit" );
        self endon( "checkScoreLimit" );
        waitframe;
    }

    if ( maps\mp\_utility::_id_3FC0() && _id_1D0B() )
        return [[ level._id_64B2 ]]( "score_limit_reached" );
    else if ( level._id_5FEC )
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < level._id_91F7.size; var_1++ )
        {
            if ( game["teamScores"][level._id_91F7[var_1]] >= maps\mp\_utility::_id_415E( "scorelimit" ) )
                var_0 = 1;
        }

        if ( !var_0 )
            return;
    }
    else if ( level._id_91EB )
    {
        if ( game["teamScores"]["allies"] < maps\mp\_utility::_id_415E( "scorelimit" ) && game["teamScores"]["axis"] < maps\mp\_utility::_id_415E( "scorelimit" ) )
            return;
    }
    else
    {
        if ( !_func_1AD( self ) )
            return;

        var_2 = maps\mp\_utility::_id_415E( "scorelimit" );

        if ( var_2 != 0 )
        {
            var_3 = self._id_038D / var_2 * 100;

            if ( var_3 > level._id_78A2 )
                _func_267( 1 );
        }

        if ( self._id_038D < var_2 )
            return;
    }

    _id_64E6();
}

_id_9B22()
{
    level endon( "game_ended" );

    while ( game["state"] == "playing" )
    {
        if ( isdefined( level._id_8D41 ) )
        {
            if ( _id_4131() < 3000 )
            {
                wait 0.1;
                continue;
            }
        }

        wait 1;
    }
}

_id_59F0()
{
    level endon( "devgui_end_graceperiod" );
    setomnvar( "ui_match_countdown_title", 6 );
    setomnvar( "ui_match_countdown_toggle", 0 );

    if ( level._id_00E3 )
        setomnvar( "ui_cg_world_blur", 1 );

    _func_288( "mpIntro", 0 );
    _id_A02B( level._id_6F09 );

    if ( level._id_6F0A > 0 && !isdefined( level._id_4A39 ) )
        _id_59ED( level._id_6F0A );
    else
        setomnvar( "ui_match_countdown_title", 0 );
}

_id_59EE( var_0 )
{
    waitframe;
    level endon( "match_start_timer_beginning" );
    setomnvar( "ui_match_countdown_title", 1 );
    setomnvar( "ui_match_countdown_toggle", 1 );

    while ( var_0 > 0 && !level._id_3BDA )
    {
        setomnvar( "ui_match_countdown", var_0 );
        var_0--;

        if ( level._id_00E3 )
            setomnvar( "ui_cg_world_blur", 1 );

        wait 1;
    }

    if ( level._id_00E3 )
        setomnvar( "ui_cg_world_blur_fade_out", 1 );

    if ( !maps\mp\_utility::_id_6FD0() && !maps\mp\_utility::_id_5092( level._id_511D ) && !maps\mp\_utility::_id_5092( level.iszombiegame ) )
    {
        if ( level._id_A3AA > 1 )
        {
            foreach ( var_2 in level._id_0323 )
                var_2 thread maps\mp\gametypes\_hud_message::_id_8A68( "double_xp" );
        }
        else if ( level.xpscalewithparty > 1 )
        {
            foreach ( var_2 in level._id_0323 )
            {
                if ( maps\mp\_utility::_id_5092( var_2.inpartywithotherplayers ) )
                    var_2 thread maps\mp\gametypes\_hud_message::_id_8A68( "double_xp" );
            }
        }
    }

    setomnvar( "ui_match_countdown_toggle", 0 );
    setomnvar( "ui_match_countdown", 0 );
    setomnvar( "ui_match_countdown_title", 0 );
}

matchstarting()
{
    setomnvar( "ui_match_countdown_title", 2 );
    level endon( "match_forfeit_timer_beginning" );
    wait 1.5;
    setomnvar( "ui_match_countdown_title", 0 );
}

_id_59ED( var_0 )
{
    self notify( "matchStartTimer" );
    self endon( "matchStartTimer" );
    level notify( "match_start_timer_beginning" );
    var_1 = _func_0BC( var_0 );
    childthread matchstartvisionfadeout( var_1 );

    if ( var_1 >= 2 )
        _id_59EE( var_1 );
    else
    {
        if ( level._id_00E3 )
            setomnvar( "ui_cg_world_blur_fade_out", 1 );

        if ( !maps\mp\_utility::_id_6FD0() && !maps\mp\_utility::_id_5092( level._id_511D ) && !maps\mp\_utility::_id_5092( level.iszombiegame ) )
        {
            if ( level._id_A3AA > 1 )
            {
                foreach ( var_3 in level._id_0323 )
                    var_3 thread maps\mp\gametypes\_hud_message::_id_8A68( "double_xp" );
            }
            else if ( level.xpscalewithparty > 1 )
            {
                foreach ( var_3 in level._id_0323 )
                {
                    if ( maps\mp\_utility::_id_5092( var_3.inpartywithotherplayers ) )
                        var_3 thread maps\mp\gametypes\_hud_message::_id_8A68( "double_xp" );
                }
            }
        }
    }
}

matchstartvisionfadeout( var_0 )
{
    if ( var_0 > 2 )
        wait(var_0 - 2);

    var_1 = 3.0;

    if ( var_0 < 2 )
        var_1 = 1.0;

    _func_143( "", var_1 );
    _func_288( "", var_1 );
}

_id_59EF()
{
    _func_143( "", 0 );
    _func_288( "", 0 );
}

calculateroundswitchfortiebreakerround()
{
    var_0 = _id_3F1A();
    var_1 = 0;

    if ( isdefined( game["attackerWinCount"] ) )
        var_1 = game["attackerWinCount"];

    var_2 = 0;

    if ( isdefined( game["defenderWinCount"] ) )
        var_2 = game["defenderWinCount"];

    if ( var_1 > 0 || var_2 > 0 )
    {
        if ( var_1 > var_2 )
        {
            if ( var_0 != game["attackers"] )
                game["switchedsides"] = !game["switchedsides"];
        }
        else if ( var_2 > var_1 )
        {
            if ( var_0 != game["defenders"] )
                game["switchedsides"] = !game["switchedsides"];
        }
        else if ( var_0 != game["defenders"] )
            game["switchedsides"] = !game["switchedsides"];
    }
    else if ( var_0 != game["defenders"] )
        game["switchedsides"] = !game["switchedsides"];
}

_id_64E4()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    var_0 = maps\mp\_utility::_id_415E( "winlimit" );

    if ( game["roundsWon"]["allies"] == var_0 - 1 && game["roundsWon"]["axis"] == var_0 - 1 )
    {
        calculateroundswitchfortiebreakerround();
        level._id_44FF = "overtime";

        if ( var_0 > 1 )
            game["tiebreaker"] = 1;

        game["dynamicEvent_Overtime"] = 1;
    }
    else
    {
        level._id_44FF = "halftime";
        game["switchedsides"] = !game["switchedsides"];
    }
}

_id_1D18()
{
    if ( !level._id_91EB )
        return 0;

    if ( !isdefined( level._id_765A ) || !level._id_765A )
        return 0;

    if ( game["roundsPlayed"] % level._id_765A == 0 )
    {
        _id_64E4();
        return 1;
    }

    return 0;
}

_id_9381()
{
    if ( level._id_3BDA )
    {
        var_0 = ( gettime() - level._id_3BDC ) / 1000;
        var_1 = level._id_6E8C - var_0;

        if ( var_1 < 0 )
            return 0;

        return var_1;
    }

    if ( maps\mp\_utility::_id_412B() <= 0 )
        return undefined;

    if ( !isdefined( level._id_8D41 ) )
        return undefined;

    var_2 = maps\mp\_utility::_id_412B();
    var_0 = ( gettime() - level._id_8D41 ) / 1000;
    var_1 = maps\mp\_utility::_id_412B() * 60 - var_0;

    if ( isdefined( level._id_9370 ) )
        var_1 += level._id_9370;

    return var_1 + level._id_6E8C;
}

_id_3A28()
{
    if ( isdefined( self._id_67CE ) )
    {
        if ( isdefined( self._id_67CE[0] ) )
        {
            self._id_67CE[0] maps\mp\gametypes\_hud_util::_id_28E9();
            self._id_67CF[0] maps\mp\gametypes\_hud_util::_id_28E9();
        }

        if ( isdefined( self._id_67CE[1] ) )
        {
            self._id_67CE[1] maps\mp\gametypes\_hud_util::_id_28E9();
            self._id_67CF[1] maps\mp\gametypes\_hud_util::_id_28E9();
        }

        if ( isdefined( self._id_67CE[2] ) )
        {
            self._id_67CE[2] maps\mp\gametypes\_hud_util::_id_28E9();
            self._id_67CF[2] maps\mp\gametypes\_hud_util::_id_28E9();
        }
    }

    self notify( "perks_hidden" );
    self._id_58A4 maps\mp\gametypes\_hud_util::_id_28E9();
    self._id_58AB maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( self._id_7041 ) )
        self._id_7041 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( self._id_7042 ) )
        self._id_7042 maps\mp\gametypes\_hud_util::_id_28E9();
}

_id_3FCF()
{
    var_0 = getentarray( "player", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] _meth_8298() )
            return var_0[var_1];
    }
}

_id_4A32()
{
    var_0 = _id_3FCF();

    if ( isdefined( var_0 ) && !var_0._id_4745 && !isdefined( var_0._id_7C68 ) )
        return 1;

    return 0;
}

_id_7655( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
        var_3 maps\mp\gametypes\_damage::streamfinalkillcam();

    waitforsplashesdone();

    if ( !var_1 )
    {
        wait(var_0);
        var_5 = level._id_0323;

        foreach ( var_3 in var_5 )
            var_3 _meth_82F8( "ui_round_end", 0 );

        level notify( "round_end_finished" );
        return;
    }

    wait(var_0 / 2);
    level notify( "give_match_bonus" );
    wait(var_0 / 2);
    waitforsplashesdone();
    var_5 = level._id_0323;

    foreach ( var_3 in var_5 )
        var_3 _meth_82F8( "ui_round_end", 0 );

    level notify( "round_end_finished" );
}

waitforsplashesdone()
{
    var_0 = 15;
    var_1 = gettime() + var_0 * 1000;
    var_2 = 0;

    while ( !var_2 && gettime() < var_1 )
    {
        wait 0.5;
        var_3 = level._id_0323;
        var_2 = 1;

        foreach ( var_5 in var_3 )
        {
            if ( !var_5 maps\mp\gametypes\_hud_message::_id_50F5() )
                continue;

            var_2 = 0;
            break;
        }
    }
}

_id_7654( var_0 )
{
    self _meth_818A( 0, 128, 512, 4000, 6, 1.8 );
}

_id_19F9()
{
    maps\mp\_load::main();
    maps\mp\_utility::_id_56DB( "round_over", 0 );
    maps\mp\_utility::_id_56DB( "game_over", 0 );
    maps\mp\_utility::_id_56DB( "block_notifies", 0 );
    level._id_6F09 = 0;
    level._id_6F0A = 0;
    level._id_6E89 = 0;
    level._id_020B = 0;
    setdvar( "bg_compassShowEnemies", getdvar( "scr_game_forceuav" ) );

    if ( !isdefined( game["gamestarted"] ) )
    {
        game["clientid"] = 0;
        var_0 = _func_0FD( "allieschar" );

        if ( !isdefined( var_0 ) || var_0 == "" )
        {
            if ( !isdefined( game["allies"] ) )
                var_0 = "marines";
            else
                var_0 = game["allies"];
        }

        var_1 = _func_0FD( "axischar" );

        if ( !isdefined( var_1 ) || var_1 == "" )
        {
            if ( !isdefined( game["axis"] ) )
                var_1 = "opfor";
            else
                var_1 = game["axis"];
        }

        if ( level._id_5FEC )
        {
            var_2 = _func_0FD( "allieschar" );

            if ( !isdefined( var_2 ) || var_2 == "" )
                var_2 = "delta_multicam";

            for ( var_3 = 0; var_3 < level._id_91F7.size; var_3++ )
                game[level._id_91F7[var_3]] = var_2;
        }

        game["allies"] = var_0;
        game["axis"] = var_1;

        if ( !isdefined( game["attackers"] ) || !isdefined( game["defenders"] ) )
            thread common_scripts\utility::_id_334F( "No attackers or defenders team defined in level .gsc." );

        if ( !isdefined( game["attackers"] ) )
            game["attackers"] = "allies";

        if ( !isdefined( game["defenders"] ) )
            game["defenders"] = "axis";

        if ( !isdefined( game["state"] ) )
            game["state"] = "playing";

        if ( level._id_91EB )
        {
            game["strings"]["waiting_for_teams"] = &"MP_WAITING_FOR_TEAMS";
            game["strings"]["opponent_forfeiting_in"] = &"MP_OPPONENT_FORFEITING_IN";
        }
        else
        {
            game["strings"]["waiting_for_teams"] = &"MP_WAITING_FOR_MORE_PLAYERS";
            game["strings"]["opponent_forfeiting_in"] = &"MP_OPPONENT_FORFEITING_IN";
        }

        game["strings"]["press_to_spawn"] = &"PLATFORM_PRESS_TO_SPAWN";
        game["strings"]["match_starting_in"] = &"MP_MATCH_STARTING_IN";
        game["strings"]["match_resuming_in"] = &"MP_MATCH_RESUMING_IN";
        game["strings"]["waiting_for_players"] = &"MP_WAITING_FOR_PLAYERS";
        game["strings"]["spawn_tag_wait"] = &"MP_SPAWN_TAG_WAIT";
        game["strings"]["spawn_next_round"] = &"MP_SPAWN_NEXT_ROUND";
        game["strings"]["waiting_to_spawn"] = &"MP_WAITING_TO_SPAWN";
        game["strings"]["match_starting"] = &"MP_MATCH_STARTING";
        game["strings"]["change_team"] = &"MP_CHANGE_TEAM_NEXT_SPAWN";
        game["strings"]["change_team_cancel"] = &"MP_CHANGE_TEAM_CANCEL";
        game["strings"]["change_team_wait"] = &"MP_CHANGE_TEAM_WAIT";
        game["strings"]["change_class"] = &"MP_CHANGE_CLASS_NEXT_SPAWN";
        game["strings"]["change_class_cancel"] = &"MP_CHANGE_CLASS_CANCEL";
        game["strings"]["change_class_wait"] = &"MP_CHANGE_CLASS_WAIT";
        game["strings"]["last_stand"] = &"MPUI_LAST_STAND";
        game["strings"]["final_stand"] = &"MPUI_FINAL_STAND";
        game["strings"]["cowards_way"] = &"PLATFORM_COWARDS_WAY_OUT";
        game["strings"]["tie"] = &"MP_MATCH_TIE";
        game["colors"]["blue"] = ( 0.25, 0.25, 0.75 );
        game["colors"]["red"] = ( 0.75, 0.25, 0.25 );
        game["colors"]["white"] = ( 1, 1, 1 );
        game["colors"]["black"] = ( 0, 0, 0 );
        game["colors"]["grey"] = ( 0.5, 0.5, 0.5 );
        game["colors"]["green"] = ( 0.25, 0.75, 0.25 );
        game["colors"]["yellow"] = ( 0.65, 0.65, 0 );
        game["colors"]["orange"] = ( 1, 0.45, 0 );
        game["colors"]["cyan"] = ( 0.35, 0.7, 0.9 );
        game["strings"]["allies_name"] = maps\mp\gametypes\_teams::_id_411B( "allies" );
        game["icons"]["allies"] = maps\mp\gametypes\_teams::_id_4118( "allies" );
        game["colors"]["allies"] = maps\mp\gametypes\_teams::_id_410B( "allies" );
        game["strings"]["axis_name"] = maps\mp\gametypes\_teams::_id_411B( "axis" );
        game["icons"]["axis"] = maps\mp\gametypes\_teams::_id_4118( "axis" );
        game["colors"]["axis"] = maps\mp\gametypes\_teams::_id_410B( "axis" );

        if ( game["colors"]["allies"] == ( 0, 0, 0 ) )
            game["colors"]["allies"] = ( 0.5, 0.5, 0.5 );

        if ( game["colors"]["axis"] == ( 0, 0, 0 ) )
            game["colors"]["axis"] = ( 0.5, 0.5, 0.5 );

        [[ level._id_64DA ]]();
        setdvarifuninitialized( "min_wait_for_players", 5 );

        if ( level._id_2153 )
        {
            if ( !level._id_8A7C )
            {
                if ( _func_282() )
                    level._id_6F09 = maps\mp\gametypes\_tweakables::_id_4142( "game", "graceperiod_ds" );
                else
                    level._id_6F09 = maps\mp\gametypes\_tweakables::_id_4142( "game", "graceperiod" );

                level._id_6F0A = maps\mp\gametypes\_tweakables::_id_4142( "game", "matchstarttime" );
            }
        }
        else
        {
            if ( _func_282() )
                level._id_6F09 = maps\mp\gametypes\_tweakables::_id_4142( "game", "playerwaittime_ds" );
            else
                level._id_6F09 = maps\mp\gametypes\_tweakables::_id_4142( "game", "playerwaittime" );

            level._id_6F0A = maps\mp\gametypes\_tweakables::_id_4142( "game", "matchstarttime" );
        }
    }
    else
    {
        setdvarifuninitialized( "min_wait_for_players", 5 );

        if ( level._id_2153 )
        {
            if ( !level._id_8A7C )
            {
                level._id_6F09 = 5;
                level._id_6F0A = maps\mp\gametypes\_tweakables::_id_4142( "game", "roundstarttime" );
            }
        }
        else
        {
            level._id_6F09 = 5;
            level._id_6F0A = maps\mp\gametypes\_tweakables::_id_4142( "game", "roundstarttime" );
        }
    }

    if ( !isdefined( game["status"] ) )
        game["status"] = "normal";

    if ( game["status"] != "overtime" && game["status"] != "halftime" && game["status"] != "overtime_halftime" )
    {
        game["teamScores"]["allies"] = 0;
        game["teamScores"]["axis"] = 0;

        if ( level._id_5FEC )
        {
            for ( var_3 = 0; var_3 < level._id_91F7.size; var_3++ )
                game["teamScores"][level._id_91F7[var_3]] = 0;
        }
    }

    if ( !isdefined( game["timePassed"] ) )
        game["timePassed"] = 0;

    if ( !isdefined( game["roundsPlayed"] ) )
        game["roundsPlayed"] = 0;

    setomnvar( "ui_current_round", game["roundsPlayed"] + 1 );

    if ( !isdefined( game["roundsWon"] ) )
        game["roundsWon"] = [];

    if ( level._id_91EB )
    {
        if ( !isdefined( game["roundsWon"]["axis"] ) )
            game["roundsWon"]["axis"] = 0;

        if ( !isdefined( game["roundsWon"]["allies"] ) )
            game["roundsWon"]["allies"] = 0;

        if ( level._id_5FEC )
        {
            for ( var_3 = 0; var_3 < level._id_91F7.size; var_3++ )
            {
                if ( !isdefined( game["roundsWon"][level._id_91F7[var_3]] ) )
                    game["roundsWon"][level._id_91F7[var_3]] = 0;
            }
        }
    }

    level._id_3BDA = 0;
    level._id_39B8 = 0;
    level._id_4A31 = 0;
    level._id_46CA = getdvarint( "g_hardcore" );

    if ( level._id_46CA )
        logstring( "game mode: hardcore" );

    level.oldschool = getdvarint( "g_oldschool" );

    if ( level.oldschool )
        logstring( "game mode: oldschool" );

    level._id_2A55 = getdvarint( "scr_diehard" );

    if ( !level._id_91EB )
        level._id_2A55 = 0;

    if ( level._id_2A55 )
        logstring( "game mode: diehard" );

    level._id_53A1 = getdvarint( "scr_game_hardpoints" );

    if ( !isdefined( level.iszombiegame ) )
        level.iszombiegame = 0;

    level._id_9C14 = 1;
    level._id_6301 = 1;
    level._id_1317 = 1;
    level._id_5A22 = 2;
    thread maps\mp\gametypes\_hodgepodge::init();
    thread maps\mp\gametypes\_persistence::init();
    thread maps\mp\gametypes\_menus::init();
    thread maps\mp\gametypes\_hud::init();
    thread maps\mp\gametypes\_serversettings::init();
    thread maps\mp\gametypes\_teams::init();
    thread maps\mp\gametypes\_weapons::init();
    thread maps\mp\gametypes\_killcam::init();
    thread maps\mp\gametypes\_shellshock::init();
    thread maps\mp\gametypes\_deathicons::init();
    thread maps\mp\gametypes\_damagefeedback::init();
    thread maps\mp\gametypes\_healthoverlay::init();
    thread maps\mp\gametypes\_spectating::init();
    thread maps\mp\gametypes\_objpoints::init();
    thread maps\mp\gametypes\_gameobjects::init();
    thread maps\mp\gametypes\_spawnlogic::init();
    thread maps\mp\gametypes\_oldschool::init();
    thread maps\mp\gametypes\_battlechatter_mp::init();
    thread maps\mp\gametypes\_music_and_dialog::init();
    thread maps\mp\_matchdata::init();
    thread maps\mp\_awards::init();
    thread maps\mp\_skill::init();
    thread maps\mp\_areas::init();
    thread maps\mp\perks\_perks::init();
    thread maps\mp\_events::init();
    thread maps\mp\gametypes\_damage::_id_4DBE();
    thread maps\mp\_snd_common_mp::init();
    thread maps\mp\_utility::_id_1876();

    if ( level._id_91EB )
        thread maps\mp\gametypes\_friendicons::init();

    thread maps\mp\gametypes\_hud_message::init();
    thread maps\mp\gametypes\_divisions::init();
    thread maps\mp\gametypes\_hardpoints::init();

    foreach ( var_5 in game["strings"] )
        precachestring( var_5 );

    game["gamestarted"] = 1;

    if ( !isdefined( game["absoluteStartTime"] ) )
        game["absoluteStartTime"] = _func_13C();

    level._id_5A4D = 0;
    level._id_A2AB["allies"] = 0;
    level._id_A2AB["axis"] = 0;
    level._id_560E["allies"] = 0;
    level._id_560E["axis"] = 0;
    level._id_A2AD["allies"] = 0;
    level._id_A2AD["axis"] = 0;
    level._id_09DE["allies"] = [];
    level._id_09DE["axis"] = [];
    level._id_0722 = [];

    if ( level._id_5FEC )
    {
        for ( var_3 = 0; var_3 < level._id_91F7.size; var_3++ )
        {
            level._id_0699[level._id_91F7[var_3]] = 0;
            level._id_05DC[level._id_91F7[var_3]] = 0;
            level._id_069A[level._id_91F7[var_3]] = 0;
            level._id_054C[level._id_91F7[var_3]] = [];
        }
    }

    setdvar( "ui_scorelimit", 0 );
    setdvar( "ui_allow_teamchange", 1 );

    if ( maps\mp\_utility::_id_3FAA() )
        setdvar( "g_deadChat", 0 );
    else
        setdvar( "g_deadChat", 1 );

    var_7 = getdvarfloat( "scr_" + level._id_01B3 + "_waverespawndelay" );

    if ( var_7 > 0 )
    {
        level._id_A2AB["allies"] = var_7;
        level._id_A2AB["axis"] = var_7;
        level._id_560E["allies"] = 0;
        level._id_560E["axis"] = 0;

        if ( level._id_5FEC )
        {
            for ( var_3 = 0; var_3 < level._id_91F7.size; var_3++ )
            {
                level._id_0699[level._id_91F7[var_3]] = var_7;
                level._id_05DC[level._id_91F7[var_3]] = 0;
            }
        }

        level thread _id_A2B0();
    }

    maps\mp\_utility::_id_3BDF( "prematch_done", 0 );
    level._id_42F3 = 15;
    level._id_4C6D = level._id_42F3;
    maps\mp\_utility::_id_3BDF( "graceperiod_done", 0 );
    level._id_7653 = 4;
    level._id_44FE = 4;
    level._id_615A = getentarray( "noragdoll", "targetname" );

    if ( level._id_91EB )
    {
        maps\mp\gametypes\_gamescores::_id_9B84( "axis" );
        maps\mp\gametypes\_gamescores::_id_9B84( "allies" );

        if ( level._id_5FEC )
        {
            for ( var_3 = 0; var_3 < level._id_91F7.size; var_3++ )
                maps\mp\gametypes\_gamescores::_id_9B84( level._id_91F7[var_3] );
        }
    }
    else
        thread maps\mp\gametypes\_gamescores::_id_4DD5();

    thread _id_9B95();
    level notify( "update_scorelimit" );
    [[ level._id_64EC ]]();
    level._id_78A2 = getdvarint( "scr_" + level._id_01B3 + "_score_percentage_cut_off", 80 );
    level._id_9371 = getdvarint( "scr_" + level._id_01B3 + "_time_percentage_cut_off", 80 );

    if ( !level._id_2153 && ( getdvar( "dedicated" ) == "dedicated LAN server" || getdvar( "dedicated" ) == "dedicated internet server" ) )
        thread _id_9D8B();

    _id_7F2A();
    thread _id_8D19();
    level thread maps\mp\_utility::_id_9BA3();
    level thread _id_9367();
    level thread maps\mp\gametypes\_damage::_id_2C7C();
}

_id_7F2A()
{
    if ( game["attackers"] == "axis" )
        var_0 = 1;
    else if ( game["attackers"] == "allies" )
        var_0 = 2;
    else
        var_0 = 0;

    setomnvar( "ui_attacking_team", var_0 );
}

_id_19EC()
{
    _func_178();

    if ( !level._id_3BDA )
        level thread _id_39BC();
}

_id_9D8B()
{
    for (;;)
    {
        if ( level._id_7137 )
            _func_16E( 0 );

        if ( !getdvarint( "xblive_privatematch" ) )
            _func_16E( 0 );

        if ( getdvar( "dedicated" ) != "dedicated LAN server" && getdvar( "dedicated" ) != "dedicated internet server" )
            _func_16E( 0 );

        wait 5;
    }
}

_id_9367()
{
    level endon( "game_ended" );
    var_0 = maps\mp\_utility::_id_412C();

    while ( game["state"] == "playing" )
    {
        thread _id_1D20( var_0 );
        var_0 = maps\mp\_utility::_id_412C();

        if ( isdefined( level._id_8D41 ) )
        {
            if ( _id_4131() < 3000 )
            {
                common_scripts\utility::_id_A0A0( "updateTimeLimit", 0.1 );
                continue;
            }
        }

        common_scripts\utility::_id_A0A0( "updateTimeLimit", 1 );
    }
}

_id_9B95()
{
    for (;;)
    {
        level common_scripts\utility::_id_A087( "update_scorelimit", "update_winlimit" );

        if ( !maps\mp\_utility::_id_5194() || !maps\mp\_utility::_id_5160() )
        {
            setdvar( "ui_scorelimit", maps\mp\_utility::_id_415E( "scorelimit" ) );
            thread _id_1D1A();
            continue;
        }

        setdvar( "ui_scorelimit", maps\mp\_utility::_id_415E( "winlimit" ) );
    }
}

_id_9364()
{
    level endon( "game_ended" );
    wait 0.05;
    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0 _meth_8056();

    while ( game["state"] == "playing" )
    {
        if ( !level._id_937B && maps\mp\_utility::_id_412B() )
        {
            var_1 = _id_4131() / 1000;
            var_2 = _func_0BC( var_1 + 0.5 );
            var_3 = _func_0BC( maps\mp\_utility::_id_412B() * 60 * 0.5 );

            if ( maps\mp\_utility::_id_3FC0() && var_2 > var_3 )
                var_2 -= var_3;

            if ( var_2 >= 30 && var_2 <= 60 )
                level notify( "match_ending_soon", "time" );

            if ( var_2 <= 10 || var_2 <= 30 && var_2 % 2 == 0 )
            {
                level notify( "match_ending_very_soon" );

                if ( var_2 == 0 )
                    break;

                var_0 _meth_809C( "ui_mp_timer_countdown" );
            }

            if ( var_1 - _func_0E2( var_1 ) >= 0.05 )
                wait(var_1 - _func_0E2( var_1 ));
        }

        wait 1.0;
    }
}

_id_3C01()
{
    level endon( "game_ended" );
    level waittill( "prematch_over" );
    level._id_8D41 = gettime();
    level._id_2B30 = 0;
    level.matchdurationstarttime = gettime();

    if ( isdefined( game["roundMillisecondsAlreadyPassed"] ) )
    {
        level._id_8D41 -= game["roundMillisecondsAlreadyPassed"];
        level._id_381C = game["roundMillisecondsAlreadyPassed"];
        game["roundMillisecondsAlreadyPassed"] = undefined;
    }

    var_0 = gettime();

    while ( game["state"] == "playing" )
    {
        if ( !level._id_937B )
            game["timePassed"] += gettime() - var_0;

        var_0 = gettime();
        wait 1.0;
    }
}

_id_9B8C()
{
    var_0 = level._id_937C || isdefined( level._id_4A39 );

    if ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
        var_0 = 0;

    if ( !level._id_937B && var_0 )
    {
        level._id_937B = 1;
        level._id_937A = gettime();
    }
    else if ( level._id_937B && !var_0 )
    {
        level._id_937B = 0;
        level._id_2B30 += gettime() - level._id_937A;
        level notify( "updateTimeLimit" );
    }
}

_id_6727()
{
    level._id_937C = 1;
    _id_9B8C();
}

_id_74BC()
{
    level._id_937C = 0;
    _id_9B8C();
}

_id_8D19()
{
    thread _id_3C01();
    level._id_937B = 0;
    level._id_937C = 0;

    if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        thread maps\mp\gametypes\_legacyspawnlogic::spawnperframeupdate();

    setdvar( "ui_inprematch", 1 );
    _id_6F09();
    maps\mp\_utility::_id_3BE0( "prematch_done" );
    level notify( "prematch_over" );
    setdvar( "ui_inprematch", 0 );
    level._id_6F07 = gettime();
    _id_9B8C();
    thread _id_9364();
    thread _id_42F3();
    thread maps\mp\gametypes\_misions::_id_7650();
    thread maps\mp\_matchdata::_id_59EC();
    var_0 = isdefined( level._id_511D ) && level._id_511D;
    var_1 = isdefined( level.iszombiegame ) && level.iszombiegame;

    if ( var_0 || var_1 )
        thread updategameduration();

    if ( !maps\mp\_utility::_id_4FA6() )
        level thread maps\mp\_utility::gameplayactivewatch();

    _func_246();
}

_id_A2B0()
{
    level endon( "game_ended" );

    while ( game["state"] == "playing" )
    {
        var_0 = gettime();

        if ( var_0 - level._id_560E["allies"] > level._id_A2AB["allies"] * 1000 )
        {
            level notify( "wave_respawn_allies" );
            level._id_560E["allies"] = var_0;
            level._id_A2AD["allies"] = 0;
        }

        if ( var_0 - level._id_560E["axis"] > level._id_A2AB["axis"] * 1000 )
        {
            level notify( "wave_respawn_axis" );
            level._id_560E["axis"] = var_0;
            level._id_A2AD["axis"] = 0;
        }

        if ( level._id_5FEC )
        {
            for ( var_1 = 0; var_1 < level._id_91F7.size; var_1++ )
            {
                if ( var_0 - level._id_560E[level._id_91F7[var_1]] > level._id_0699[level._id_91F7[var_1]] * 1000 )
                {
                    var_2 = "wave_rewpawn_" + level._id_91F7[var_1];
                    level notify( var_2 );
                    level._id_560E[level._id_91F7[var_1]] = var_0;
                    level._id_A2AD[level._id_91F7[var_1]] = 0;
                }
            }
        }

        wait 0.05;
    }
}

_id_3F1A()
{
    var_0["allies"] = 0;
    var_0["axis"] = 0;
    var_1["allies"] = 0;
    var_1["axis"] = 0;
    var_2["allies"] = 0;
    var_2["axis"] = 0;

    foreach ( var_4 in level._id_0323 )
    {
        var_5 = var_4._id_0308["team"];

        if ( isdefined( var_5 ) && ( var_5 == "allies" || var_5 == "axis" ) )
        {
            var_0[var_5] += var_4._id_038D;
            var_1[var_5] += var_4._id_0239;
            var_2[var_5] += var_4._id_010D;
        }
    }

    if ( var_0["allies"] > var_0["axis"] )
        return "allies";
    else if ( var_0["axis"] > var_0["allies"] )
        return "axis";

    if ( var_1["allies"] > var_1["axis"] )
        return "allies";
    else if ( var_1["axis"] > var_1["allies"] )
        return "axis";

    if ( var_2["allies"] < var_2["axis"] )
        return "allies";
    else if ( var_2["axis"] < var_2["allies"] )
        return "axis";

    if ( _func_0B2( 2 ) == 0 )
        return "allies";

    return "axis";
}

_id_7138( var_0 )
{
    if ( !maps\mp\_utility::_id_A1CA() )
        return;

    var_0 = _id_3FAB( var_0, 0 );

    if ( maps\mp\_utility::_id_59E3() )
    {
        _id_8359();

        if ( _id_4A32() )
        {
            level._id_4A31 = 1;
            logstring( "host idled out" );
            _func_0FB();
        }

        _id_9B34( var_0 );
    }

    _id_9BA6( var_0 );
}

outcomenotifytoallplayers( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.onoutcomenotify ) )
        [[ level.onoutcomenotify ]]( var_0, var_1, var_2, var_3 );

    foreach ( var_5 in level._id_0323 )
    {
        if ( isdefined( var_5._id_214A ) )
            continue;

        if ( isdefined( var_5.displaystatlossui ) && var_5.displaystatlossui )
            var_6 = game["end_reason"]["stat_loss_prevention"];
        else
            var_6 = var_2;

        if ( level._id_91EB )
        {
            var_5 thread maps\mp\gametypes\_hud_message::_id_91F9( var_0, var_1, var_6, var_3 );
            continue;
        }

        var_5 thread maps\mp\gametypes\_hud_message::_id_65B5( var_0, var_6 );
    }
}

_id_2B65( var_0, var_1 )
{
    outcomenotifytoallplayers( var_0, 1, var_1 );

    if ( !maps\mp\_utility::_id_A1CA() )
        level notify( "round_win", var_0 );

    if ( maps\mp\_utility::_id_A1CA() )
        _id_7655( level._id_7653, 0 );
    else
        _id_7655( level._id_7653, 1 );
}

_id_2B60( var_0, var_1 )
{
    outcomenotifytoallplayers( var_0, 0, var_1, 1 );
    level notify( "game_win", var_0 );
    _id_7655( level._id_6E8C, 1 );
}

_id_2B66( var_0 )
{
    var_1 = level._id_44FF;

    if ( var_1 == "halftime" )
    {
        if ( maps\mp\_utility::_id_415E( "roundlimit" ) )
        {
            if ( game["roundsPlayed"] * 2 == maps\mp\_utility::_id_415E( "roundlimit" ) )
                var_1 = "halftime";
            else
                var_1 = "intermission";
        }
        else if ( maps\mp\_utility::_id_415E( "winlimit" ) )
        {
            if ( game["roundsPlayed"] == maps\mp\_utility::_id_415E( "winlimit" ) - 1 )
                var_1 = "halftime";
            else
                var_1 = "intermission";
        }
        else
            var_1 = "intermission";
    }

    level notify( "round_switch", var_1 );
    var_2 = 0;

    if ( var_0 != game["switchedsides"] )
        var_2 = game["end_reason"]["switching_sides"];

    outcomenotifytoallplayers( var_1, 1, var_2 );
    _id_7655( level._id_44FE, 0 );
}

arraytostring( var_0 )
{
    var_1 = "";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_1 += var_0[var_2];

        if ( var_2 != var_0.size - 1 )
            var_1 += ",";
    }

    return var_1;
}

recordendgamecomscoreevent( var_0 )
{
    var_1 = level._id_0323;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        recordendgamecomscoreeventforplayer( var_1[var_2], var_0 );
}

recordendgamecomscoreeventforplayer( var_0, var_1 )
{
    var_2 = var_1;

    if ( isdefined( var_0._id_04A7 ) && var_1 == var_0._id_04A7 )
        var_2 = "win";
    else if ( var_1 == "allies" || var_1 == "axis" )
        var_2 = "lose";

    var_3 = "";
    var_4 = "";
    var_5 = "";
    var_6 = "";
    var_7 = "";
    var_8 = "";
    var_9 = "";
    var_10 = "";
    var_11 = var_0._id_04A7;
    var_12 = var_0._id_1E2E;

    if ( isdefined( var_11 ) && isdefined( var_12 ) && var_12 != "" )
    {
        var_13 = var_0 maps\mp\gametypes\_class::_id_4009( var_11, var_12, undefined, undefined, 1 );
        var_3 = var_13._id_0336;
        var_4 = var_13._id_033B;
        var_5 = var_13._id_03AA;
        var_6 = var_13._id_03AE;
        var_7 = var_13._id_0155;
        var_8 = var_13._id_02D6;
        var_9 = arraytostring( var_13._id_0306 );
        var_10 = "";
    }

    _func_2FC( "end_match" );
    _func_2FD( "game_variant", "mp" );
    var_14 = _func_130( "gametype" );
    _func_2FD( "game_mode", var_14 );
    var_15 = _func_130( "privateMatch" );
    _func_2FD( "private_match", var_15 );
    var_16 = _func_130( "map" );
    _func_2FD( "game_map", var_16 );
    _func_2FD( "player_xuid", var_0 _meth_8293() );
    var_17 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "kills" );
    _func_2FD( "match_kills", var_17 );
    var_18 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "deaths" );
    _func_2FD( "match_deaths", var_18 );
    var_19 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "totalXp" );
    _func_2FD( "match_xp", var_19 );
    var_20 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "score" );
    _func_2FD( "match_score", var_20 );
    var_21 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "captures" );
    _func_2FD( "match_captures", var_21 );
    var_22 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "defends" );
    _func_2FD( "match_defends", var_22 );
    var_23 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "headshots" );
    _func_2FD( "match_headshots", var_23 );
    var_24 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "plants" );
    _func_2FD( "match_plants", var_24 );
    var_25 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "defuses" );
    _func_2FD( "match_defuses", var_25 );
    var_26 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "returns" );
    _func_2FD( "match_returns", var_26 );
    _func_2FD( "prestige_max", var_0._id_0308["prestige"] );
    _func_2FD( "level_max", var_0._id_0308["rank"] );
    _func_2FD( "match_result", var_2 );
    var_27 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "timePlayed" );
    _func_2FD( "match_duration", var_27 );

    if ( var_0._id_1F0F <= 30 && var_0._id_1F0F != _func_130( "playerCount" ) )
    {
        var_28 = _func_130( "players", var_0._id_1F0F, "startHits" );
        var_29 = _func_130( "players", var_0._id_1F0F, "endHits" );
        var_30 = _func_130( "players", var_0._id_1F0F, "startMisses" );
        var_31 = _func_130( "players", var_0._id_1F0F, "endMisses" );
        var_32 = var_29 + var_31 - var_28 + var_30;
        var_33 = var_29 - var_28;
        _func_2FD( "match_shots", var_32 );
        _func_2FD( "match_hits", var_33 );
    }
    else
    {
        _func_2FD( "match_shots", 0 );
        _func_2FD( "match_hits", 0 );
    }

    _func_2FD( "loadout_perks", var_9 );
    _func_2FD( "loadout_lethal", var_7 );
    _func_2FD( "loadout_tactical", var_8 );
    _func_2FD( "loadout_scorestreaks", var_10 );
    _func_2FD( "loadout_primary_weapon", var_3 );
    _func_2FD( "loadout_secondary_weapon", var_5 );
    _func_2FD( "loadout_primary_attachments", var_4 );
    _func_2FD( "loadout_secondary_attachments", var_6 );
    var_34 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "bestScore" );
    _func_2FD( "best_score", common_scripts\utility::_id_93F2( var_34 ) );
    var_35 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "bestKills" );
    _func_2FD( "best_kills", common_scripts\utility::_id_93F2( var_35 ) );
    var_36 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "kills" );
    _func_2FD( "total_kills", var_36 );
    var_37 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "deaths" );
    _func_2FD( "total_deaths", var_37 );
    var_38 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "wins" );
    _func_2FD( "total_wins", var_38 );
    var_39 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "experience" );
    _func_2FD( "total_xp", var_39 );
    _func_2FE();
}

_id_3A30( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    foreach ( var_3 in level._id_0323 )
    {
        var_3 _meth_800D();
        var_3 thread _id_3A35( var_0 );
        var_3 thread _id_7654( 4.0 );
        var_3 _id_3A28();

        if ( isdefined( var_1 ) && var_1 )
        {
            if ( level._id_8A7C || var_3 _meth_82CA() )
                var_3 _meth_82FA( "cg_everyoneHearsEveryone", 1, "cg_fovscale", 0.75 );
            else
                var_3 _meth_82FA( "cg_everyoneHearsEveryone", 1, "cg_fovScale", 1 );

            var_3 _meth_82F8( "fov_scale", 1 );
            continue;
        }

        var_3 _meth_82FA( "cg_everyoneHearsEveryone", 1 );
    }

    if ( isdefined( level._id_08A1 ) )
    {
        foreach ( var_6 in level._id_08A1 )
            var_6 maps\mp\_utility::_id_3A32( 1 );
    }
}

_id_3164( var_0, var_1 )
{
    setdvar( "bg_compassShowEnemies", 0 );
    handlekillstreaksonroundswitch( 0 );
    _id_3A30( 1.0, 1 );

    foreach ( var_3 in level._id_0323 )
    {
        var_3._id_0308["stats"] = var_3._id_8D77;
        var_3._id_0308["segments"] = var_3._id_7C58;
    }

    level notify( "round_switch", "overtime" );
    var_5 = 0;
    var_6 = 0;
    var_7 = var_0 == "overtime";

    if ( level._id_01B3 == "ctf" )
    {
        if ( var_0 == "overtime_halftime" )
            var_6 = 1;

        var_0 = "tie";
        var_5 = 1;
        var_7 = 1;

        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_0 = "axis";

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            var_0 = "allies";
    }

    outcomenotifytoallplayers( var_0, var_5, var_1 );
    _id_7655( level._id_7653, 0 );

    if ( level._id_01B3 == "ctf" )
        var_0 = "overtime_halftime";

    if ( isdefined( level._id_374D ) && var_7 )
    {
        foreach ( var_3 in level._id_0323 )
            var_3 notify( "reset_outcome" );

        level notify( "game_cleanup" );
        _id_A0DA();

        if ( level._id_01B3 == "ctf" && !var_6 )
        {
            var_0 = "overtime";
            var_1 = game["end_reason"]["tie"];
        }

        outcomenotifytoallplayers( var_0, 0, var_1 );
        _id_7655( level._id_44FE, 0 );
    }

    game["status"] = var_0;
    level notify( "restarting" );
    game["state"] = "playing";
    setdvar( "ui_game_state", game["state"] );
    _func_16D( 1 );
}

handlekillstreaksonroundswitch( var_0 )
{
    var_1 = isdefined( level.killcountpersistsoverrounds ) && level.killcountpersistsoverrounds != 0;

    if ( var_0 && ( maps\mp\_utility::_id_A1CC() || maps\mp\_utility::_id_A1CA() ) )
        var_1 = 0;

    foreach ( var_3 in level._id_0323 )
    {
        if ( !var_1 )
        {
            var_3._id_0308["cur_kill_streak"] = 0;
            var_3 _meth_82F8( "ks_count1", 0 );
            continue;
        }

        var_4 = _func_0BC( var_3 _meth_8443( "ks_count1" ) );
        var_3._id_0308["cur_kill_count"] = var_4;
    }
}

_id_3161( var_0 )
{
    setdvar( "bg_compassShowEnemies", 0 );
    handlekillstreaksonroundswitch( 0 );
    var_1 = "halftime";
    var_2 = 1;

    if ( isdefined( level._id_44FC ) && !level._id_44FC )
        var_2 = 0;

    if ( var_2 )
    {
        game["switchedsides"] = !game["switchedsides"];
        var_3 = game["end_reason"]["switching_sides"];
    }
    else
        var_3 = var_0;

    _id_3A30( 1.0, 1 );

    if ( level._id_01B3 == "ctf" )
    {
        var_3 = var_0;
        var_1 = "tie";

        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_1 = "axis";

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            var_1 = "allies";
    }

    foreach ( var_5 in level._id_0323 )
    {
        var_5._id_0308["stats"] = var_5._id_8D77;
        var_5._id_0308["segments"] = var_5._id_7C58;
    }

    level notify( "round_switch", "halftime" );
    outcomenotifytoallplayers( var_1, 1, var_3 );
    _id_7655( level._id_7653, 0 );

    if ( isdefined( level._id_374D ) )
    {
        foreach ( var_5 in level._id_0323 )
            var_5 notify( "reset_outcome" );

        level notify( "game_cleanup" );
        _id_A0DA();
        var_9 = game["end_reason"]["switching_sides"];

        if ( !var_2 )
            var_9 = var_3;

        outcomenotifytoallplayers( "halftime", 1, var_9 );
        _id_7655( level._id_44FE, 0 );
    }

    game["status"] = "halftime";
    level notify( "restarting" );
    game["state"] = "playing";
    setdvar( "ui_game_state", game["state"] );
    _func_16D( 1 );
}

updategameduration()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = getgameduration();
        setomnvar( "ui_game_duration", var_0 * 1000 );
        wait 1.0;
    }
}

getgameduration()
{
    var_0 = maps\mp\_utility::getgametimepassedseconds();

    if ( isdefined( level._id_511D ) && level._id_511D )
        var_0 = gamedurationclamp( var_0 );

    return var_0;
}

gamedurationclamp( var_0 )
{
    if ( var_0 > 86399 )
        return 86399;

    return var_0;
}

_id_315F( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( game["state"] == "postgame" || level._id_3BDA )
        return;

    game["state"] = "postgame";
    setdvar( "ui_game_state", "postgame" );
    level._id_3BDC = gettime();
    level._id_3BDA = 1;
    level._id_4C6D = 0;
    level notify( "game_ended", var_0 );
    maps\mp\_utility::_id_56DD( "game_over" );
    maps\mp\_utility::_id_56DD( "block_notifies" );
    var_3 = getgameduration();
    setomnvar( "ui_game_duration", var_3 * 1000 );
    maps\mp\_utility::setgameplayactive( 0 );
    waittillframeend;
    _func_142( 0 );
    _func_12F( "gameLengthSeconds", var_3 );
    _func_12F( "endTimeUTC", _func_13C() );
    _id_1D07();

    if ( isdefined( var_0 ) && isstring( var_0 ) && maps\mp\_utility::_id_516C( var_0 ) )
    {
        level._id_374D = "none";
        level._id_3748[level._id_374D] = maps\mp\_utility::_id_40C7();
        _id_3164( var_0, var_1 );
        return;
    }

    if ( isdefined( var_0 ) && isstring( var_0 ) && var_0 == "halftime" )
    {
        level._id_374D = "none";
        level._id_3748[level._id_374D] = maps\mp\_utility::_id_40C7();
        _id_3161( var_1 );
        return;
    }

    if ( isdefined( level._id_374D ) )
        level._id_3748[level._id_374D] = maps\mp\_utility::_id_40C7();

    game["roundsPlayed"]++;

    if ( level._id_01B3 != "ctf" )
        setomnvar( "ui_current_round", game["roundsPlayed"] );

    if ( level._id_91EB )
    {
        if ( ( var_0 == "axis" || var_0 == "allies" ) && level._id_01B3 != "ctf" )
            game["roundsWon"][var_0]++;

        maps\mp\gametypes\_gamescores::_id_9B84( "axis" );
        maps\mp\gametypes\_gamescores::_id_9B84( "allies" );
    }
    else if ( isdefined( var_0 ) && _func_1AD( var_0 ) )
        game["roundsWon"][var_0._id_4450]++;

    maps\mp\gametypes\_gamescores::_id_9B49();
    _id_7138( var_0 );
    handlekillstreaksonroundswitch( 1 );

    foreach ( var_5 in level._id_0323 )
        var_5 _meth_82F9( "ui_opensummary", 1 );

    setdvar( "g_deadChat", 1 );
    setdvar( "ui_allow_teamchange", 0 );
    setdvar( "bg_compassShowEnemies", 0 );
    _id_3A30( 1.0, 1 );
    var_7 = game["switchedsides"];

    if ( !maps\mp\_utility::_id_A1CC() && !var_2 )
    {
        _id_2B65( var_0, var_1 );

        if ( isdefined( level._id_374D ) )
        {
            foreach ( var_5 in level._id_0323 )
                var_5 notify( "reset_outcome" );

            level notify( "game_cleanup" );
            _id_A0DA();
        }

        if ( !maps\mp\_utility::_id_A1CA() )
        {
            maps\mp\_utility::_id_56DA( "block_notifies" );

            if ( _id_1D18() )
                _id_2B66( var_7 );

            foreach ( var_5 in level._id_0323 )
            {
                var_5._id_0308["stats"] = var_5._id_8D77;
                var_5._id_0308["segments"] = var_5._id_7C58;
            }

            level notify( "restarting" );
            game["state"] = "playing";
            setdvar( "ui_game_state", "playing" );
            _func_16D( 1 );
            return;
        }

        if ( !level._id_39B8 )
            var_1 = _id_9B14( var_0 );
    }

    if ( !isdefined( game["clientMatchDataDef"] ) )
    {
        game["clientMatchDataDef"] = "mp/clientmatchdata.ddl";
        _func_138( game["clientMatchDataDef"] );
    }

    maps\mp\gametypes\_misions::_id_7652( var_0 );
    var_0 = _id_3FAB( var_0, 1 );

    if ( level._id_91EB )
    {
        setomnvar( "ui_game_victor", 0 );

        if ( var_0 == "allies" )
            setomnvar( "ui_game_victor", 2 );
        else if ( var_0 == "axis" )
            setomnvar( "ui_game_victor", 1 );
    }

    _id_2B60( var_0, var_1 );
    var_12 = gettime();

    if ( isdefined( level._id_374D ) && maps\mp\_utility::_id_A1CC() )
    {
        foreach ( var_5 in level._id_0323 )
            var_5 notify( "reset_outcome" );

        level notify( "game_cleanup" );
        _id_A0DA();
    }

    maps\mp\_utility::_id_56DA( "block_notifies" );
    level._id_020B = 1;
    level notify( "spawning_intermission" );

    foreach ( var_5 in level._id_0323 )
    {
        var_5 _meth_8322();
        var_5 _meth_8268();
        var_5 notify( "reset_outcome" );
        var_5 _meth_82F8( "ui_toggle_final_scoreboard", 1 );
        var_5 thread maps\mp\gametypes\_playerlogic::_id_89E9();
    }

    _id_6FFC();
    maps\mp\_skill::_id_6FDD();
    wait 1.0;
    _id_1D04();
    _id_9B03();

    if ( level._id_91EB )
    {
        if ( var_0 == "axis" || var_0 == "allies" )
            _func_12F( "victor", var_0 );
        else
            _func_12F( "victor", "none" );

        _func_12F( "alliesScore", game["teamScores"]["allies"] );
        _func_12F( "axisScore", game["teamScores"]["axis"] );
        _func_248( var_0 );
    }
    else
        _func_12F( "victor", "none" );

    level maps\mp\_matchdata::_id_31B7();

    foreach ( var_5 in level._id_0323 )
    {
        if ( var_5 maps\mp\_utility::_id_7139() )
            var_5 maps\mp\_matchdata::_id_5825();

        var_5 maps\mp\gametypes\_playerlogic::_id_5848();
    }

    _func_12F( "host", maps\mp\gametypes\_playerlogic::truncateplayername( level._id_4A3E ) );

    if ( maps\mp\_utility::_id_59E3() )
    {
        _func_12F( "playlistVersion", _func_283() );
        _func_12F( "playlistID", _func_284() );
        _func_12F( "isDedicated", _func_282() );
    }

    _func_12F( "levelMaxClients", level._id_5A29 );
    _func_131();
    var_19 = _func_130( "victor" );
    recordendgamecomscoreevent( var_19 );

    foreach ( var_5 in level._id_0323 )
    {
        var_5._id_0308["stats"] = var_5._id_8D77;
        var_5._id_0308["segments"] = var_5._id_7C58;
    }

    _func_249();
    var_22 = 0;

    if ( isdefined( level.endgamewaitfunc ) )
        [[ level.endgamewaitfunc ]]( var_2, level._id_6E89, var_22, var_0 );
    else if ( !var_2 && !level._id_6E89 )
    {
        if ( !maps\mp\_utility::_id_A1CC() )
            wait(6.0 + var_22);
        else
            wait(_func_0BF( 10.0, 4.0 + var_22 + level._id_6E89 ));
    }
    else
        wait(_func_0BF( 10.0, 4.0 + var_22 + level._id_6E89 ));

    var_23 = "_gamelogic.gsc";
    var_24 = "all";

    if ( level._id_91EB && isdefined( var_0 ) )
        var_24 = var_0;

    var_25 = "undefined";

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case 1:
                var_25 = "MP_SCORE_LIMIT_REACHED";
                break;
            case 2:
                var_25 = "MP_TIME_LIMIT_REACHED";
                break;
            case 3:
                var_25 = "MP_PLAYERS_FORFEITED";
                break;
            case 4:
                var_25 = "MP_TARGET_DESTROYED";
                break;
            case 5:
                var_25 = "MP_BOMB_DEFUSED";
                break;
            case 6:
                var_25 = "MP_SAS_ELIMINATED";
                break;
            case 7:
                var_25 = "MP_SPETSNAZ_ELIMINATED";
                break;
            case 8:
                var_25 = "MP_SAS_FORFEITED";
                break;
            case 9:
                var_25 = "MP_SPETSNAZ_FORFEITED";
                break;
            case 10:
                var_25 = "MP_SAS_MISSION_ACCOMPLISHED";
                break;
            case 11:
                var_25 = "MP_SPETSNAZ_MISSION_ACCOMPLISHED";
                break;
            case 12:
                var_25 = "MP_ENEMIES_ELIMINATED";
                break;
            case 13:
                var_25 = "MP_MATCH_TIE";
                break;
            case 14:
                var_25 = "GAME_OBJECTIVECOMPLETED";
                break;
            case 15:
                var_25 = "GAME_OBJECTIVEFAILED";
                break;
            case 16:
                var_25 = "MP_SWITCHING_SIDES";
                break;
            case 17:
                var_25 = "MP_ROUND_LIMIT_REACHED";
                break;
            case 18:
                var_25 = "MP_ENDED_GAME";
                break;
            case 19:
                var_25 = "MP_HOST_ENDED_GAME";
                break;
            case 20:
                var_25 = "MP_PREVENT_STAT_LOSS";
                break;
            default:
                break;
        }
    }

    if ( !isdefined( var_12 ) )
        var_12 = -1;

    var_26 = 15;
    var_27 = var_26;
    var_28 = _func_130( "playerCount" );
    var_29 = _func_130( "lifeCount" );

    if ( !isdefined( level._id_59E0 ) )
    {
        var_30 = 0;
        var_31 = 0;
        var_32 = 0;
        var_33 = 0;
        var_34 = 0;
        var_35 = 0;
        var_36 = 0;
    }
    else
    {
        if ( isdefined( level._id_59E0["botJoinCount"] ) )
            var_30 = level._id_59E0["botJoinCount"];
        else
            var_30 = 0;

        if ( isdefined( level._id_59E0["deathCount"] ) )
            var_31 = level._id_59E0["deathCount"];
        else
            var_31 = 0;

        if ( isdefined( level._id_59E0["badSpawnDiedTooFastCount"] ) )
            var_32 = level._id_59E0["badSpawnDiedTooFastCount"];
        else
            var_32 = 0;

        if ( isdefined( level._id_59E0["badSpawnKilledTooFastCount"] ) )
            var_33 = level._id_59E0["badSpawnKilledTooFastCount"];
        else
            var_33 = 0;

        if ( isdefined( level._id_59E0["badSpawnDmgDealtCount"] ) )
            var_34 = level._id_59E0["badSpawnDmgDealtCount"];
        else
            var_34 = 0;

        if ( isdefined( level._id_59E0["badSpawnDmgReceivedCount"] ) )
            var_35 = level._id_59E0["badSpawnDmgReceivedCount"];
        else
            var_35 = 0;

        if ( isdefined( level._id_59E0["badSpawnByAnyMeansCount"] ) )
            var_36 = level._id_59E0["badSpawnByAnyMeansCount"];
        else
            var_36 = 0;
    }

    var_37 = 0;
    _func_104( "script_mp_match_end: script_file %s, gameTime %d, match_winner %s, win_reason %s, version %d, joinCount %d, botJoinCount %d, spawnCount %d, deathCount %d, badSpawnDiedTooFastCount %d, badSpawnKilledTooFastCount %d, badSpawnDmgDealtCount %d, badSpawnDmgReceivedCount %d, badSpawnByAnyMeansCount %d, sightTraceMethodsUsed %d", var_23, var_12, var_24, var_25, var_27, var_28, var_30, var_29, var_31, var_32, var_33, var_34, var_35, var_36, var_37 );

    if ( isdefined( level._id_511D ) && level._id_511D )
    {
        if ( isdefined( level._id_A3D3 ) && level._id_A3D3 )
            setdvar( "cg_drawCrosshair", 1 );
    }

    level notify( "exitLevel_called" );
    _func_16E( 0 );
}

clearallnonplayerentities()
{
    var_0 = _func_1F2();

    foreach ( var_2 in var_0 )
        var_2 delete();

    maps\mp\gametypes\_objpoints::deleteallobjpoints();

    if ( isdefined( level._id_99BB ) )
    {
        foreach ( var_5 in level._id_99BB )
            var_5 delete();
    }
}

_id_3FAB( var_0, var_1 )
{
    if ( !isstring( var_0 ) )
        return var_0;

    var_2 = var_0;

    if ( level._id_91EB && ( maps\mp\_utility::_id_5194() || level._id_01B3 == "ctf" ) && level._id_3BDA )
    {
        var_3 = "roundsWon";

        if ( isdefined( level._id_A32B ) && level._id_A32B )
            var_3 = "teamScores";

        if ( game[var_3]["allies"] == game[var_3]["axis"] )
            var_2 = "tie";
        else if ( game[var_3]["axis"] > game[var_3]["allies"] )
            var_2 = "axis";
        else
            var_2 = "allies";
    }

    if ( var_1 && ( var_2 == "allies" || var_2 == "axis" ) )
        level._id_374D = var_2;

    return var_2;
}

_id_9B14( var_0 )
{
    if ( !level._id_91EB )
        return 1;

    if ( maps\mp\_utility::_id_4925() )
        return game["end_reason"]["round_limit_reached"];

    if ( maps\mp\_utility::_id_492B() )
        return game["end_reason"]["score_limit_reached"];

    return game["end_reason"]["objective_completed"];
}

_id_3389( var_0 )
{
    var_1 = _id_40C3( var_0 );
    var_2 = _id_40C4( var_0 );
    var_3 = 999999;

    if ( var_1 )
        var_3 = var_2 / var_1;

    return var_3;
}

_id_40C3( var_0 )
{
    var_1 = maps\mp\_utility::_id_415E( "scorelimit" );
    var_2 = maps\mp\_utility::_id_412B();
    var_3 = maps\mp\_utility::_id_412C() / 60000 + 0.0001;

    if ( _func_1AD( self ) )
        var_4 = self._id_038D / var_3;
    else
        var_4 = _func_15F( var_0 ) / var_3;

    return var_4;
}

_id_40C4( var_0 )
{
    var_1 = maps\mp\_utility::_id_415E( "scorelimit" );

    if ( _func_1AD( self ) )
        var_2 = var_1 - self._id_038D;
    else
        var_2 = var_1 - _func_15F( var_0 );

    return var_2;
}

_id_41F0()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_A0ED( 3 );
    thread maps\mp\_utility::_id_91FA( "callout_lastteammemberalive", self, self._id_0308["team"] );

    if ( level._id_5FEC )
    {
        foreach ( var_1 in level._id_91F7 )
        {
            if ( self._id_0308["team"] != var_1 )
                thread maps\mp\_utility::_id_91FA( "callout_lastenemyalive", self, var_1 );
        }
    }
    else
    {
        var_3 = maps\mp\_utility::_id_4067( self._id_0308["team"] );
        thread maps\mp\_utility::_id_91FA( "callout_lastenemyalive", self, var_3 );
    }

    level notify( "last_alive", self );
}

_id_6FFC()
{
    var_0 = 0;

    foreach ( var_2 in level._id_0323 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2._id_1F10 = var_0;
        var_0++;

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
            var_2._id_1F10 = var_2 _meth_81B5();

        _func_136( "players", var_2._id_1F10, "name", maps\mp\gametypes\_playerlogic::extractplayername( var_2._id_02A7 ) );
        _func_136( "players", var_2._id_1F10, "clanTag", maps\mp\gametypes\_playerlogic::extractclantag( var_2._id_02A7 ) );
        _func_136( "players", var_2._id_1F10, "xuid", var_2._id_0537 );
        var_3 = 0;
        var_4 = 0;

        if ( isdefined( var_2._id_0308["rank"] ) )
            var_3 = var_2._id_0308["rank"];

        if ( isdefined( var_2._id_0308["prestige"] ) )
            var_4 = var_2._id_0308["prestige"];

        _func_136( "players", var_2._id_1F10, "rank", var_3 );
        _func_136( "players", var_2._id_1F10, "prestige", var_4 );
    }

    maps\mp\_awards::_id_0D70();
    maps\mp\_scoreboard::_id_6FFD();
    _func_139();
    _func_244();
}

_id_9501( var_0, var_1 )
{
    thread _id_9315( var_0, 1, "deaths" );
}

_id_94B6( var_0, var_1, var_2 )
{
    if ( isdefined( self ) && _func_1AD( self ) )
    {
        if ( var_1 != "MOD_FALLING" )
        {
            if ( maps\mp\_utility::_id_5150( var_1 ) && _func_120( var_0, "tactical" ) )
                return;

            var_3 = maps\mp\gametypes\_weapons::ismeleeinventoryweapon( var_0 );

            if ( var_3 )
                thread threadedincmeleekill();

            if ( maps\mp\_utility::_id_5150( var_1 ) && !_func_120( var_0, "riotshield" ) && !_func_120( var_0, "combatknife" ) && !var_3 )
            {
                thread threadedincmeleekill();
                return;
            }
            else if ( maps\mp\_utility::_id_50F3( var_0 ) )
            {
                thread threadedincdestructiblekill();
                return;
            }

            thread _id_9315( var_0, 1, "kills" );
            var_4 = 0;

            if ( isdefined( var_2 ) && isdefined( var_2.firedads ) )
                var_4 = var_2.firedads;
            else
                var_4 = self _meth_833D();

            if ( var_4 < 0.2 )
                thread _id_9315( var_0, 1, "hipfirekills" );
        }

        if ( var_1 == "MOD_HEAD_SHOT" )
            thread _id_9315( var_0, 1, "headShots" );
    }
}

_id_8356( var_0, var_1, var_2 )
{
    if ( !var_1 )
        return;

    var_3 = maps\mp\_utility::_id_4167( var_0 );

    if ( var_3 == "killstreak" || var_3 == "other" )
        return;

    if ( maps\mp\_utility::_id_50FE( var_0 ) )
        return;

    if ( maps\mp\_utility::_id_50C9( var_0 ) )
        return;

    if ( var_3 == "weapon_grenade" || var_3 == "weapon_explosive" )
    {
        var_4 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );
        var_4 = maps\mp\_utility::_id_8F5C( var_4, "_mp" );
        maps\mp\gametypes\_persistence::_id_4C40( var_4, var_2, var_1 );
        maps\mp\_matchdata::_id_584C( var_4, var_2, var_1 );
        return;
    }

    var_5 = maps\mp\gametypes\_weapons::isprimaryorsecondaryprojectileweapon( var_0 );
    var_6 = _func_122( var_0, 0, 4 ) == "alt_";
    var_7 = maps\mp\gametypes\_weapons::ismeleeinventoryweapon( var_0 );

    if ( var_2 != "timeInUse" && var_2 != "deaths" && !var_5 && !var_6 && !var_7 )
    {
        var_8 = var_0;
        var_0 = self _meth_830E();

        if ( var_0 != var_8 && maps\mp\_utility::_id_513D( var_0 ) )
            return;
    }

    if ( !isdefined( self._id_94FB ) )
        self._id_94FB = var_0;

    if ( var_0 != self._id_94FB )
    {
        maps\mp\gametypes\_persistence::_id_9BA4();
        self._id_94FB = var_0;
        self._id_2515 = 0;
    }

    switch ( var_2 )
    {
        case "shots":
            self._id_94FC++;
            self._id_2515++;
            break;
        case "hits":
            self._id_94F9++;
            break;
        case "headShots":
            self._id_94F7++;
            break;
        case "kills":
            self._id_94FA++;
            break;
        case "hipfirekills":
            self._id_94F8++;
            break;
        case "timeInUse":
            self._id_94FD += var_1;
            break;
    }

    if ( var_2 == "deaths" )
    {
        var_9 = maps\mp\_utility::_id_3F11( var_0 );

        if ( !maps\mp\_utility::_id_50D1( var_9 ) && !maps\mp\_utility::_id_50D2( var_9 ) && !maps\mp\_utility::iscacmeleeweapon( var_9 ) )
            return;

        var_10 = maps\mp\_utility::_id_4163( var_0 );
        maps\mp\gametypes\_persistence::_id_4C40( var_9, var_2, var_1 );
        maps\mp\_matchdata::_id_584C( var_9, "deaths", var_1 );

        foreach ( var_12 in var_10 )
            maps\mp\gametypes\_persistence::_id_4C3D( var_12, var_2, var_1 );
    }
}

_id_7F93( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( var_0 ) )
    {
        var_1 _id_8356( var_2, 1, "hits" );
        return;
    }

    if ( !isdefined( var_0._id_6C5E ) )
        var_0._id_6C5E = [];

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_0._id_6C5E.size; var_4++ )
    {
        if ( var_0._id_6C5E[var_4] == self )
        {
            var_3 = 0;
            break;
        }
    }

    if ( var_3 )
    {
        var_0._id_6C5E[var_0._id_6C5E.size] = self;
        var_1 _id_8356( var_2, 1, "hits" );
    }
}

_id_9315( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    waitframe;
    _id_8356( var_0, var_1, var_2 );
}

threadedincmeleekill()
{
    self endon( "disconnect" );
    waitframe;
    maps\mp\gametypes\_persistence::incrementmeleestat();
}

threadedincdestructiblekill()
{
    self endon( "disconnect" );
    waitframe;
    maps\mp\gametypes\_persistence::incrementdestructiblestat();
}

_id_1D04()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 maps\mp\_utility::_id_7139() )
        {
            var_2 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "kills" );
            var_3 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "deaths" );
            var_4 = var_1._id_0308["summary"]["xp"];
            var_5 = var_1._id_038D;
            var_6 = _id_40B9( var_1 );
            var_7 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "bestKills" );
            var_8 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "mostDeaths" );
            var_9 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "mostXp" );
            var_10 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "bestScore" );
            var_11 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "bestAccuracy" );

            if ( var_2 > var_7 )
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestKills", var_2 );

            if ( var_4 > var_9 )
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "mostXp", var_4 );

            if ( var_3 > var_8 )
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "mostDeaths", var_3 );

            if ( var_5 > var_10 )
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestScore", var_5 );

            if ( var_6 > var_11 )
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestAccuracy", var_6 );

            var_1 _id_1CFE();
            var_1 maps\mp\_matchdata::_id_5849( var_4, "totalXp" );
            var_1 maps\mp\_matchdata::_id_5849( var_1._id_0308["summary"]["score"], "scoreXp" );
            var_1 maps\mp\_matchdata::_id_5849( var_1._id_0308["summary"]["challenge"], "challengeXp" );
            var_1 maps\mp\_matchdata::_id_5849( var_1._id_0308["summary"]["match"], "matchXp" );
            var_1 maps\mp\_matchdata::_id_5849( var_1._id_0308["summary"]["misc"], "miscXp" );
        }

        if ( isdefined( var_1._id_0308["confirmed"] ) )
            var_1 maps\mp\_matchdata::_id_5839();

        if ( isdefined( var_1._id_0308["denied"] ) )
            var_1 maps\mp\_matchdata::_id_583A();
    }
}

_id_40B9( var_0 )
{
    var_1 = _func_0BD( var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "totalShots" ) - var_0._id_0308["previous_shots"] );

    if ( var_1 == 0 )
        return 0;

    var_2 = _func_0BD( var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "hits" ) - var_0._id_0308["previous_hits"] );
    var_3 = _func_0E9( var_2 / var_1, 0.0, 1.0 ) * 10000.0;
    return _func_0BC( var_3 );
}

_id_1CFE()
{
    var_0 = maps\mp\_matchdata::_id_1877();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_2 = maps\mp\_utility::_id_3F11( var_2 );
        var_3 = maps\mp\_utility::_id_4167( var_2 );

        if ( !maps\mp\_utility::_id_513D( var_2 ) && var_3 != "killstreak" && var_3 != "other" )
        {
            var_4 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "bestWeapon", "kills" );
            var_5 = 0;

            if ( isdefined( self._id_0308["mpWeaponStats"][var_2] ) && isdefined( self._id_0308["mpWeaponStats"][var_2]["kills"] ) )
            {
                var_5 = self._id_0308["mpWeaponStats"][var_2]["kills"];

                if ( var_5 > var_4 )
                {
                    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestWeapon", "kills", var_5 );
                    var_6 = 0;

                    if ( isdefined( self._id_0308["mpWeaponStats"][var_2]["shots"] ) )
                        var_6 = self._id_0308["mpWeaponStats"][var_2]["shots"];

                    var_7 = 0;

                    if ( isdefined( self._id_0308["mpWeaponStats"][var_2]["headShots"] ) )
                        var_7 = self._id_0308["mpWeaponStats"][var_2]["headShots"];

                    var_8 = 0;

                    if ( isdefined( self._id_0308["mpWeaponStats"][var_2]["hits"] ) )
                        var_8 = self._id_0308["mpWeaponStats"][var_2]["hits"];

                    var_9 = 0;

                    if ( isdefined( self._id_0308["mpWeaponStats"][var_2]["deaths"] ) )
                        var_9 = self._id_0308["mpWeaponStats"][var_2]["deaths"];

                    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestWeapon", "shots", var_6 );
                    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestWeapon", "headShots", var_7 );
                    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestWeapon", "hits", var_8 );
                    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestWeapon", "deaths", var_9 );
                    var_10 = _func_0BC( _func_1BB( "mp/statstable.csv", 4, var_2, 0 ) );
                    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "bestWeaponIndex", var_10 );
                }
            }
        }
    }
}

_id_9B07()
{
    var_0 = 5;
    var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "numTrends" );
    var_1++;

    if ( var_1 > var_0 )
    {
        var_1 = var_0;

        if ( var_0 > 1 )
        {
            for ( var_2 = 0; var_2 < var_0 - 1; var_2++ )
            {
                var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_2 + 1, "timestamp" );
                var_4 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_2 + 1, "kills" );
                var_5 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_2 + 1, "deaths" );
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_2, "timestamp", var_3 );
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_2, "kills", var_4 );
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_2, "deaths", var_5 );
            }
        }
    }

    var_3 = maps\mp\_utility::gettimeutc_for_stat_recording();
    var_4 = self._id_0239;
    var_5 = self._id_010D;
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_1 - 1, "timestamp", var_3 );
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_1 - 1, "kills", var_4 );
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "trend", var_1 - 1, "deaths", var_5 );
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "numTrends", var_1 );
}

_id_9B04()
{
    var_0 = maps\mp\_utility::gettimeutc_for_stat_recording();
    _id_7F3C( "timeStampLastGame", var_0 );
    _id_4C3E( "numMatches", 1 );
    _id_4C3E( "timePlayed", self._id_9372["total"] );
    _id_4C3E( "kills", self._id_0239 );
    _id_4C3E( "deaths", self._id_010D );
    _id_4C3E( "xpEarned", self._id_0308["summary"]["xp"] );

    if ( isdefined( self._id_20B1 ) )
        _id_4C3E( "wins", 1 );

    if ( isdefined( self._id_20B0 ) )
        _id_4C3E( "ties", 1 );

    var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", level._id_01B3, "timeStampFirstGame" );

    if ( var_1 == 0 )
        _id_7F3C( "timeStampFirstGame", var_0 );
}

_id_4C3E( var_0, var_1 )
{
    var_2 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", level._id_01B3, var_0 );
    var_2 += var_1;
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", level._id_01B3, var_0, var_2 );
}

_id_7F3C( var_0, var_1 )
{
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", level._id_01B3, var_0, var_1 );
}

_id_7F3D( var_0, var_1 )
{
    var_2 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", level._id_01B3, var_0 );

    if ( var_1 > var_2 )
        _id_7F3C( var_0, var_1 );
}

_id_9B06()
{
    if ( level._id_01B3 == "war" || level._id_01B3 == "dm" )
    {
        _id_9B04();
        var_0 = self._id_010D;

        if ( var_0 == 0 )
            var_0 = 1;

        var_1 = _func_0BC( self._id_0239 / var_0 ) * 1000;
        _id_7F3D( "mostkills", self._id_0239 );
        _id_7F3D( "bestkdr", var_1 );
    }
    else if ( level._id_01B3 == "ctf" )
    {
        _id_9B04();
        var_2 = maps\mp\_utility::_id_4081( "captures" );
        var_3 = maps\mp\_utility::_id_4081( "returns" );
        _id_4C3E( "captures", var_2 );
        _id_4C3E( "returns", var_3 );
        _id_7F3D( "mostcaptures", var_2 );
        _id_7F3D( "mostreturns", var_3 );
    }
    else if ( level._id_01B3 == "dom" )
    {
        _id_9B04();
        var_2 = maps\mp\_utility::_id_4081( "captures" );
        var_4 = maps\mp\_utility::_id_4081( "defends" );
        _id_4C3E( "captures", var_2 );
        _id_4C3E( "defends", var_4 );
        _id_7F3D( "mostcaptures", var_2 );
        _id_7F3D( "mostdefends", var_4 );
    }
    else if ( level._id_01B3 == "conf" )
    {
        _id_9B04();
        var_5 = maps\mp\_utility::_id_4081( "confirmed" );
        var_6 = maps\mp\_utility::_id_4081( "denied" );
        _id_4C3E( "confirms", var_5 );
        _id_4C3E( "denies", var_6 );
        _id_7F3D( "mostconfirms", var_5 );
        _id_7F3D( "mostdenies", var_6 );
    }
    else if ( level._id_01B3 == "sd" )
    {
        _id_9B04();
        var_7 = maps\mp\_utility::_id_4081( "plants" );
        var_8 = maps\mp\_utility::_id_4081( "defuses" );
        var_9 = maps\mp\_utility::_id_4081( "destructions" );
        _id_4C3E( "plants", var_7 );
        _id_4C3E( "defuses", var_8 );
        _id_4C3E( "detonates", var_9 );
        _id_7F3D( "mostplants", var_7 );
        _id_7F3D( "mostdefuses", var_8 );
        _id_7F3D( "mostdetonates", var_9 );
    }
    else if ( level._id_01B3 == "hp" )
    {
        _id_9B04();
        var_2 = maps\mp\_utility::_id_4081( "captures" );
        var_4 = maps\mp\_utility::_id_4081( "defends" );
        var_10 = maps\mp\_utility::_id_4081( "captureTime" );
        _id_4C3E( "captures", var_2 );
        _id_4C3E( "defends", var_4 );
        _id_4C3E( "captureTime", var_10 );
        _id_7F3D( "mostcaptures", var_2 );
        _id_7F3D( "mostdefends", var_4 );
        _id_7F3D( "mostCaptureTime", var_10 );
    }
    else if ( level._id_01B3 == "sr" )
    {
        _id_9B04();
        var_7 = maps\mp\_utility::_id_4081( "plants" );
        var_8 = maps\mp\_utility::_id_4081( "defuses" );
        var_9 = maps\mp\_utility::_id_4081( "destructions" );
        var_5 = maps\mp\_utility::_id_4081( "confirmed" );
        var_6 = maps\mp\_utility::_id_4081( "denied" );
        _id_4C3E( "plants", var_7 );
        _id_4C3E( "defuses", var_8 );
        _id_4C3E( "detonates", var_9 );
        _id_4C3E( "confirms", var_5 );
        _id_4C3E( "denies", var_6 );
        _id_7F3D( "mostplants", var_7 );
        _id_7F3D( "mostdefuses", var_8 );
        _id_7F3D( "mostdetonates", var_9 );
        _id_7F3D( "mostconfirms", var_5 );
        _id_7F3D( "mostdenies", var_6 );
    }
    else if ( level._id_01B3 == "infect" )
    {
        _id_9B04();
        var_11 = maps\mp\_utility::_id_408F( "contagious" );
        var_12 = self._id_0239 - var_11;
        _id_4C3E( "infectedKills", var_12 );
        _id_4C3E( "survivorKills", var_11 );
        _id_7F3D( "mostInfectedKills", var_12 );
        _id_7F3D( "mostSurvivorKills", var_11 );
    }
    else if ( level._id_01B3 == "gun" )
    {
        _id_9B04();
        var_13 = maps\mp\_utility::_id_408F( "levelup" );
        var_14 = maps\mp\_utility::_id_408F( "humiliation" );
        _id_4C3E( "gunPromotions", var_13 );
        _id_4C3E( "stabs", var_14 );
        _id_7F3D( "mostGunPromotions", var_13 );
        _id_7F3D( "mostStabs", var_14 );
    }
    else if ( level._id_01B3 == "ball" )
    {
        _id_9B04();
        var_15 = maps\mp\_utility::_id_408F( "fieldgoal" ) + maps\mp\_utility::_id_408F( "touchdown" ) * 2;
        var_16 = maps\mp\_utility::_id_408F( "killedBallCarrier" );
        _id_4C3E( "pointsScored", var_15 );
        _id_4C3E( "killedBallCarrier", var_16 );
        _id_7F3D( "mostPointsScored", var_15 );
        _id_7F3D( "mostKilledBallCarrier", var_16 );
    }
    else if ( level._id_01B3 == "twar" )
    {
        _id_9B04();
        var_2 = maps\mp\_utility::_id_4081( "captures" );
        var_17 = maps\mp\_utility::_id_408F( "kill_while_capture" );
        _id_4C3E( "captures", var_2 );
        _id_4C3E( "killWhileCaptures", var_17 );
        _id_7F3D( "mostCaptures", var_2 );
        _id_7F3D( "mostKillWhileCaptures", var_17 );
    }
    else if ( level._id_01B3 == "sab" )
    {
        _id_9B04();
        var_7 = maps\mp\_utility::_id_4081( "plants" );
        var_8 = maps\mp\_utility::_id_4081( "defuses" );
        var_9 = maps\mp\_utility::_id_4081( "destructions" );
        _id_4C3E( "plants", var_7 );
        _id_4C3E( "defuses", var_8 );
        _id_4C3E( "detonates", var_9 );
        _id_7F3D( "mostplants", var_7 );
        _id_7F3D( "mostdefuses", var_8 );
        _id_7F3D( "mostdetonates", var_9 );
    }
    else if ( level._id_01B3 == "koth" )
    {
        _id_9B04();
        var_2 = maps\mp\_utility::_id_4081( "captures" );
        var_4 = maps\mp\_utility::_id_4081( "defends" );
        _id_4C3E( "captures", var_2 );
        _id_4C3E( "defends", var_4 );
        _id_7F3D( "mostcaptures", var_2 );
        _id_7F3D( "mostdefends", var_4 );
    }
    else if ( level._id_01B3 == "dd" )
    {
        _id_9B04();
        var_7 = maps\mp\_utility::_id_4081( "plants" );
        var_8 = maps\mp\_utility::_id_4081( "defuses" );
        var_9 = maps\mp\_utility::_id_4081( "destructions" );
        _id_4C3E( "plants", var_7 );
        _id_4C3E( "defuses", var_8 );
        _id_4C3E( "detonates", var_9 );
        _id_7F3D( "mostplants", var_7 );
        _id_7F3D( "mostdefuses", var_8 );
        _id_7F3D( "mostdetonates", var_9 );
    }
}

_id_9B05()
{
    _id_9B07();
    _id_9B06();
}

_id_9B03()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 maps\mp\_utility::_id_7139() )
            var_1 _id_9B05();

        level maps\mp\gametypes\_playerlogic::_id_A361( var_1 );
    }
}

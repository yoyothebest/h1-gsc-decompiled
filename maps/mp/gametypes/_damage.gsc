// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_51C5()
{
    if ( isdefined( self._id_907E ) )
        return 1;

    return 0;
}

_id_51D1()
{
    var_0 = maps\mp\gametypes\_teams::_id_2242();
    var_0[self._id_566D]--;
    var_0[self._id_528C]++;
    return var_0[self._id_528C] - var_0[self._id_566D] < 2;
}

_id_510E( var_0, var_1 )
{
    if ( !level._id_91EB )
        return 0;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( !_func_1AD( var_1 ) && !isdefined( var_1._id_04A7 ) )
        return 0;

    if ( var_0._id_04A7 != var_1._id_04A7 )
        return 0;

    if ( var_0 == var_1 )
        return 0;

    return 1;
}

_id_5364( var_0 )
{
    if ( !_func_1AD( var_0 ) )
        return 0;

    if ( var_0 != self )
        return 0;

    return 1;
}

_id_4682()
{
    if ( !level._id_91EB )
        return;

    if ( self._id_528C == "spectator" || !_id_51D1() )
    {
        self thread [[ level._id_64FE ]]( "suicide" );
        maps\mp\_utility::_id_4C2E( "suicides", 1 );
        self._id_8FAF = maps\mp\_utility::_id_4081( "suicides" );
    }
}

_id_4690( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_04A7 ) )
    {
        _id_4681( var_2, var_3 );
        return;
    }

    if ( level._id_91EB && var_0._id_04A7 != self._id_04A7 || !level._id_91EB )
    {
        if ( isdefined( level._id_64BF ) && ( _func_1AD( var_0 ) || _func_1FF( var_0 ) ) && var_0._id_04A7 != "spectator" )
            [[ level._id_64BF ]]( self, var_0, var_1 );
    }
}

_id_4202( var_0 )
{
    var_1 = _func_0BC( _func_0E1( 0, maps\mp\gametypes\_gamescores::_id_05B8( self ) - var_0 ) );
    maps\mp\gametypes\_gamescores::_id_063D( self, var_1 );
}

_id_4681( var_0, var_1 )
{
    self thread [[ level._id_64FE ]]( "suicide" );
    maps\mp\_utility::_id_4C2E( "suicides", 1 );
    self._id_8FAF = maps\mp\_utility::_id_4081( "suicides" );

    if ( !maps\mp\_utility::_id_6FD0() && self._id_8FAF == 15 )
        thread delayedsuicidekick();

    var_2 = maps\mp\gametypes\_tweakables::_id_4142( "game", "suicidepointloss" );
    _id_4202( var_2 );

    if ( var_0 == "MOD_SUICIDE" && var_1 == "none" && isdefined( self._id_933E ) )
        self._id_55A5 = gettime();

    if ( isdefined( level._id_64ED ) )
        [[ level._id_64ED ]]( self );

    if ( isdefined( self._id_3A97 ) )
        self _meth_826A( &"MP_FRIENDLY_FIRE_WILL_NOT" );

    self._id_0308["suicideSpawnDelay"] = maps\mp\gametypes\_tweakables::_id_4142( "game", "suicidespawndelay" );
}

delayedsuicidekick()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait(_func_0B4( 1, 60 ));
    _func_13F( self _meth_81B5() );
}

_id_4661( var_0 )
{
    var_0 thread [[ level._id_64FE ]]( "teamkill" );
    var_0._id_0308["teamkills"] += 1.0;
    var_0._id_0308["totalTeamKills"] += 1.0;
    var_0._id_91F3++;

    if ( maps\mp\gametypes\_tweakables::_id_4142( "team", "teamkillpointloss" ) )
    {
        var_1 = maps\mp\gametypes\_rank::_id_40C1( "kill" );
        var_0 _id_4202( var_1 );
    }

    var_2 = var_0 maps\mp\gametypes\_playerlogic::_id_91F2();

    if ( var_2 > 0 )
    {
        var_0._id_0308["teamKillPunish"] = 1;
        var_0 maps\mp\_utility::_id_066F();
    }

    var_3 = maps\mp\gametypes\_tweakables::_id_4142( "team", "teamkillkicklimit" );

    if ( var_3 > 0 )
    {
        var_4 = var_0._id_0308["totalTeamKills"];

        if ( var_4 >= var_3 )
            thread _id_3AA9( var_0 );
    }
}

_id_3AA9( var_0 )
{
    waitframe;
    _func_13F( var_0 _meth_81B5(), "EXE_PLAYERKICKED_TEAMKILL" );
    level thread maps\mp\gametypes\_gamelogic::_id_9B1F();
}

incrementkillstreak( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "none";

    if ( _func_1A1( var_0 ) )
    {
        if ( var_0 maps\mp\_utility::_id_537A( var_1, var_3 ) )
        {
            var_0._id_0308["cur_kill_streak"]++;
            var_0._id_023B = var_0._id_0308["cur_kill_streak"];
            var_0 notify( "kill_streak_increased" );
            var_0 _meth_82F8( "ks_count1", var_0._id_023B );

            if ( isdefined( level.hardpointitems ) )
                var_0 thread maps\mp\gametypes\_hardpoints::givehardpointitemforstreak();

            if ( !maps\mp\_utility::_id_513D( var_2 ) )
                var_0._id_0308["cur_kill_streak_for_nuke"]++;

            var_4 = 30;

            if ( var_0 maps\mp\_utility::_id_05CB( "specialty_hardline" ) )
                var_4--;
        }

        var_0 maps\mp\_utility::_id_7FEB( "longestkillstreak", var_0._id_0308["cur_kill_streak"] );

        if ( var_0._id_0308["cur_kill_streak"] > var_0 maps\mp\_utility::_id_4081( "longestStreak" ) )
            var_0 maps\mp\_utility::_id_7FE1( "longestStreak", var_0._id_0308["cur_kill_streak"] );
    }

    if ( var_0._id_0308["cur_kill_streak"] > var_0 maps\mp\gametypes\_persistence::_id_8D6A( "round", "killStreak" ) )
        var_0 maps\mp\gametypes\_persistence::_id_8D7A( "round", "killStreak", var_0._id_0308["cur_kill_streak"] );

    if ( var_0 maps\mp\_utility::_id_7139() )
    {
        if ( var_0._id_0308["cur_kill_streak"] > var_0._id_533C )
        {
            var_0 maps\mp\gametypes\_persistence::_id_8D78( "killStreak", var_0._id_0308["cur_kill_streak"] );
            var_0._id_533C = var_0._id_0308["cur_kill_streak"];
        }
    }

    level notify( "player_got_killstreak_" + var_0._id_0308["cur_kill_streak"], var_0 );
    var_0 notify( "got_killstreak", var_0._id_0308["cur_kill_streak"] );
}

_id_466B( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 thread maps\mp\_events::_id_5360( var_0, self, var_3, var_4, var_2 );
    var_1 _meth_83C4();

    if ( var_4 == "MOD_HEAD_SHOT" )
    {
        var_1 _meth_82F1( "mp_headshot_killer" );
        self _meth_809C( "mp_headshot_killed" );
    }

    var_1 thread maps\mp\_events::_id_5361( self, var_3, var_4 );

    if ( level.killstreak_kills )
        incrementkillstreak( var_1, var_2, var_4 );

    var_1._id_0308["cur_death_streak"] = 0;
    var_5 = maps\mp\gametypes\_tweakables::_id_4142( "game", "deathpointloss" );
    _id_4202( var_5 );
    var_1 notify( "killed_enemy" );

    if ( isdefined( level._id_64BF ) && var_1._id_0308["team"] != "spectator" )
        [[ level._id_64BF ]]( self, var_1, var_0 );

    var_6 = maps\mp\_flashgrenades::getlastflashbangattacker();

    if ( maps\mp\_flashgrenades::_id_5107() && isdefined( maps\mp\_utility::_id_0683( var_6 ) ) && var_6 != var_1 )
        var_6 thread maps\mp\_events::_id_6FF4( self, "assist_flash" );
    else
        var_6 = undefined;

    var_7 = maps\mp\gametypes\_weapons::getlastconcussionattacker();

    if ( maps\mp\gametypes\_weapons::isconcussed() && isdefined( maps\mp\_utility::_id_0683( var_7 ) ) && var_7 != var_1 )
        var_7 thread maps\mp\_events::_id_6FF4( self, "assist_concussion" );
    else
        var_7 = undefined;

    if ( isdefined( self._id_0E34 ) )
    {
        foreach ( var_9 in self._id_0E34 )
        {
            if ( !isdefined( maps\mp\_utility::_id_0683( var_9 ) ) )
                continue;

            if ( var_9 == var_1 )
                continue;

            if ( isdefined( var_6 ) && var_9 == var_6 )
                continue;

            if ( isdefined( var_7 ) && var_9 == var_7 )
                continue;

            if ( self == var_9 )
                continue;

            var_9 thread maps\mp\_events::_id_6FF4( self );
        }
    }

    if ( !level._id_91EB )
    {
        self._id_0E34 = [];
        return;
    }

    level thread maps\mp\gametypes\_battlechatter_mp::_id_7827( var_1, "kill", 0.75 );

    if ( !maps\mp\_utility::_id_513D( var_3 ) )
    {
        var_11 = [];

        foreach ( var_13 in level._id_99E9[var_1._id_04A7] )
        {
            if ( !isdefined( var_13._id_02E5 ) || var_13._id_02E5 == var_1 )
                continue;

            if ( common_scripts\utility::_id_0CE4( var_11, var_13._id_02E5 ) )
                continue;

            var_11[var_11.size] = var_13._id_02E5;
            var_13._id_02E5 thread maps\mp\_events::_id_6FF4( self, "assist_uav" );
            var_13._id_02E5 thread maps\mp\gametypes\_misions::_id_6FF6( "ch_uav_assist" );
        }
    }

    if ( isdefined( self._id_9105 ) )
        self._id_9105 = undefined;

    if ( isdefined( self._id_0E34 ) )
        self._id_0E34 = [];
}

_id_517D( var_0 )
{
    if ( _func_1B8( var_0 ) == "non-player" )
        return 0;

    if ( _func_1B8( var_0 ) == "turret" )
        return 0;

    if ( _func_1E4( var_0 ) == "primary" || _func_1E4( var_0 ) == "altmode" )
        return 1;

    return 0;
}

_id_19F5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    _id_6CD8( var_0, var_1, self, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 0, 0 );
}

_id_19F4( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _id_25AE( var_0, var_4, var_3, var_2, 0, var_1 );

    if ( isdefined( level._id_511D ) && level._id_511D )
    {
        var_8 = 0;

        if ( level._id_0323.size > 1 )
            var_8 = 1;
        else if ( self._id_4744 )
            var_8 = 1;

        if ( var_8 )
            var_0 _meth_82C4();

        [[ level._id_1A02 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, 0 );
    }
}

_id_19ED()
{
    self delete();
}

_id_5631( var_0, var_1 )
{

}

_id_6CD8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_2 endon( "spawned" );
    var_2 notify( "killed_player" );

    if ( isdefined( var_2._id_6EFA ) )
        var_2 [[ var_2._id_6EFA ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

    var_2 maps\mp\gametypes\_playerlogic::_id_7463();
    var_2._id_06B7 = 0;
    var_2._id_67D0 = 0;
    var_2._id_7C89 = 0;
    var_1 = maps\mp\_utility::_id_0683( var_1 );

    if ( isdefined( var_1 ) )
        var_1._id_0D77 = undefined;

    if ( !isdefined( var_2._id_4B56 ) )
    {
        if ( var_4 == "MOD_SUICIDE" )
            var_2._id_4B56 = 0;
        else if ( var_4 == "MOD_GRENADE" && ( _func_120( var_5, "fraggrenade" ) || _func_120( var_5, "thermobaric_grenade" ) ) && var_3 == 100000 )
            var_2._id_4B56 = 0;
        else if ( level._id_01A7 >= 2 )
            var_2._id_4B56 = 0;
        else
        {

        }
    }

    var_18 = maps\mp\_utility::_id_5150( var_4 ) && ( _func_120( var_5, "knife" ) || _func_120( var_5, "tactical" ) );

    if ( var_18 )
    {
        if ( isdefined( common_scripts\utility::_id_3FA8( "exo_knife_blood" ) ) )
        {
            if ( isdefined( var_7 ) && isdefined( var_6 ) && isdefined( _id_3FCC( var_7 ) ) )
                _func_15A( var_2 _meth_8184( _id_3FCC( var_7 ) ), var_6 );
            else
                _func_15A( var_2 _meth_8184( "j_neck" ), anglestoforward( var_2 _meth_8185( "j_neck" ) ) );
        }
    }

    maps\mp\gametypes\_weapons::_id_728B();

    if ( !var_10 )
    {
        if ( isdefined( var_2._id_315F ) )
            maps\mp\_utility::_id_74FA( 2 );
        else
        {
            maps\mp\_utility::_id_74FA( 0 );
            var_2 _meth_80B9();
        }
    }
    else
    {
        var_2._id_3693 = 1;
        self notify( "death", var_1, var_4, var_5 );
    }

    if ( game["state"] == "postgame" )
        return;

    var_19 = 0;

    if ( !_func_1AD( var_0 ) && isdefined( var_0._id_0340 ) )
        var_20 = var_0._id_0340;
    else if ( isdefined( var_1 ) && _func_1AD( var_1 ) && var_1 _meth_830F() != "none" )
        var_20 = var_1 _meth_830F();
    else if ( _func_120( var_5, "alt_" ) )
        var_20 = _func_122( var_5, 4, var_5.size );
    else
        var_20 = undefined;

    if ( isdefined( var_2._id_9C06 ) )
    {
        var_2._id_9C06 = undefined;
        var_2 _id_32D4();
        var_21 = var_1 == var_2;
        var_0 = var_2._id_55EC._id_3020;
        var_1 = maps\mp\_utility::_id_0683( var_2._id_55EC.attacker );
        var_3 = var_2._id_55EC._id_4B54;
        var_4 = var_2._id_55EC._id_867C;
        var_5 = var_2._id_55EC._id_9024;
        var_20 = var_2._id_55EC._id_8AA5;
        var_6 = var_2._id_55EC._id_9C68;
        var_7 = var_2._id_55EC._id_83CE;

        if ( var_21 )
            var_19 = ( gettime() - var_2._id_55EC._id_55F1 ) / 1000;

        var_2._id_55EC = undefined;
    }

    if ( ( !isdefined( var_1 ) || var_1.classname == "trigger_hurt" || var_1.classname == "worldspawn" || var_1 == var_2 ) && isdefined( self._id_0E34 ) )
    {
        var_22 = undefined;

        foreach ( var_24 in self._id_0E34 )
        {
            if ( !isdefined( maps\mp\_utility::_id_0683( var_24 ) ) )
                continue;

            if ( !isdefined( var_2._id_0E2C[var_24._id_4450]._id_00FA ) )
                continue;

            if ( var_24 == var_2 || level._id_91EB && var_24._id_04A7 == var_2._id_04A7 )
                continue;

            if ( var_2._id_0E2C[var_24._id_4450]._id_5606 + 2500 < gettime() && ( var_1 != var_2 && ( isdefined( var_2._id_0249 ) && var_2._id_0249 ) ) )
                continue;

            if ( var_2._id_0E2C[var_24._id_4450]._id_00FA > 1 && !isdefined( var_22 ) )
            {
                var_22 = var_24;
                continue;
            }

            if ( isdefined( var_22 ) && var_2._id_0E2C[var_24._id_4450]._id_00FA > var_2._id_0E2C[var_22._id_4450]._id_00FA )
                var_22 = var_24;
        }

        if ( isdefined( var_22 ) )
        {
            var_1 = var_22;
            var_1._id_0D77 = 1;
            var_5 = var_2._id_0E2C[var_22._id_4450]._id_0513;
            var_6 = var_2._id_0E2C[var_22._id_4450]._id_9C68;
            var_7 = var_2._id_0E2C[var_22._id_4450]._id_83CE;
            var_8 = var_2._id_0E2C[var_22._id_4450]._id_034B;
            var_4 = var_2._id_0E2C[var_22._id_4450]._id_867C;
            var_3 = var_2._id_0E2C[var_22._id_4450]._id_00FA;
            var_20 = var_2._id_0E2C[var_22._id_4450]._id_8AA5;
            var_0 = var_1;
        }
    }
    else if ( isdefined( var_1 ) )
        var_1._id_0D77 = undefined;

    if ( maps\mp\_utility::_id_5117( var_5, var_7, var_4, var_1 ) )
        var_4 = "MOD_HEAD_SHOT";
    else if ( !maps\mp\_utility::_id_5150( var_4 ) && !isdefined( var_2._id_626B ) )
        var_2 maps\mp\_utility::_id_6A3F();

    var_26 = _id_510E( var_2, var_1 );

    if ( isdefined( var_1 ) )
    {
        if ( var_1.code_classname == "script_vehicle" && isdefined( var_1._id_02E5 ) )
            var_1 = var_1._id_02E5;

        if ( var_1.code_classname == "misc_turret" && isdefined( var_1._id_02E5 ) )
        {
            if ( isdefined( var_1._id_9C7E ) )
                var_1._id_9C7E notify( "killedPlayer", var_2 );

            var_1 = var_1._id_02E5;
        }

        if ( var_1.code_classname == "script_model" && isdefined( var_1._id_02E5 ) )
        {
            var_1 = var_1._id_02E5;

            if ( !_id_510E( var_2, var_1 ) && var_1 != var_2 )
                var_1 notify( "crushed_enemy" );
        }
    }

    if ( var_4 != "MOD_SUICIDE" && ( maps\mp\_utility::_id_50AD( var_2 ) || maps\mp\_utility::_id_50AD( var_1 ) ) && isdefined( level._id_161B ) && isdefined( level._id_161B["get_attacker_ent"] ) )
    {
        var_27 = [[ level._id_161B["get_attacker_ent"] ]]( var_1, var_0 );

        if ( isdefined( var_27 ) )
        {
            if ( maps\mp\_utility::_id_50AD( var_2 ) )
                var_2 _meth_8360( "death", var_5, var_27._id_02E2, var_2._id_02E2, var_27 );

            if ( maps\mp\_utility::_id_50AD( var_1 ) )
            {
                var_28 = 1;

                if ( var_27.classname == "script_vehicle" && isdefined( var_27._id_4818 ) || var_27.classname == "rocket" || var_27.classname == "misc_turret" )
                    var_28 = 0;

                if ( var_28 )
                    var_1 _meth_8360( "kill", var_5, var_27._id_02E2, var_2._id_02E2, var_2 );
            }
        }
    }

    var_29 = var_2 _meth_830E();

    if ( !isdefined( var_2._id_08A2 ) )
        var_2 thread [[ level._id_A2D8 ]]( var_1, var_4 );
    else
        var_2._id_08A2 thread [[ level._id_A2D8 ]]( var_1, var_4 );

    if ( !var_10 )
        var_2 maps\mp\_utility::_id_9B69( "dead" );

    var_30 = isdefined( var_2._id_3693 ) && var_2._id_3693 && isdefined( var_2._id_907E ) && var_2._id_907E;

    if ( !var_30 )
        var_2 maps\mp\gametypes\_playerlogic::_id_73A4();

    if ( !isdefined( var_2._id_907E ) && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        var_31 = var_2;

        if ( isdefined( var_2._id_20BD ) )
            var_31 = var_2._id_20BD;

        var_31 maps\mp\_utility::_id_4C2E( "deaths", 1 );
        var_31._id_010D = var_31 maps\mp\_utility::_id_4081( "deaths" );
        var_31 maps\mp\_utility::_id_9B47( "kdRatio", "kills", "deaths" );
        var_31 maps\mp\gametypes\_persistence::_id_8D7A( "round", "deaths", var_31._id_010D );
        var_31 maps\mp\_utility::_id_4C2F( "deaths", 1 );
    }

    var_32 = _func_166( var_2, var_1, var_5, var_4 );
    var_33 = var_32["weaponIndex"];
    var_34 = var_32["customIndex"];
    var_35 = var_32["isAlternate"];
    var_36 = 0;
    var_2 _id_584A( self._id_56F7, var_1, var_3, var_4, var_5, var_20, var_7 );
    var_2 maps\mp\_matchdata::_id_5846( 1 );
    var_2 maps\mp\_matchdata::_id_5845( self._id_56F7, var_1, var_3, var_4, var_5, var_20, var_7, var_29 );

    if ( maps\mp\_utility::_id_5150( var_4 ) && _func_1AD( var_1 ) && !_func_120( var_5, "riotshield" ) )
    {
        var_1 maps\mp\_utility::_id_4C2F( "knifekills", 1 );
        var_1 _meth_8580();
        var_1.meleeweaponbloodytime = gettime();
    }

    if ( var_2 _id_51C5() )
        _id_4682();
    else if ( !_func_1AD( var_1 ) || _func_1AD( var_1 ) && var_4 == "MOD_FALLING" )
    {
        _id_4690( var_1, self._id_56F7, var_4, var_7 );

        if ( _func_1FF( var_1 ) )
            var_36 = 1;
    }
    else if ( var_1 == var_2 && ( isdefined( var_0 ) && ( !isdefined( var_0._id_5169 ) || var_0._id_5169 == 0 ) ) )
        _id_4681( var_4, var_7 );
    else if ( var_26 )
    {
        if ( !isdefined( var_2._id_626B ) )
            _id_4661( var_1 );
    }
    else
    {
        if ( var_4 == "MOD_GRENADE" && var_0 == var_1 || var_4 == "MOD_IMPACT" || var_4 == "MOD_GRENADE_SPLASH" || var_4 == "MOD_EXPLOSIVE" )
            _id_07CC( var_2, var_1, var_0, var_5, var_3, ( 0, 0, 0 ), var_6, var_7, var_8, var_4 );

        var_36 = 1;

        if ( _func_0CF( var_2 ) && isdefined( level._id_161B ) && isdefined( level._id_161B["should_do_killcam"] ) )
            var_36 = var_2 [[ level._id_161B["should_do_killcam"] ]]();
        else if ( _func_28E( var_2 ) )
            var_36 = 0;

        if ( isdefined( var_0 ) && ( !isdefined( var_0._id_5169 ) || var_0._id_5169 == 0 ) )
        {
            _id_466B( self._id_56F7, var_1, var_0, var_5, var_4 );
            var_2 thread maps\mp\gametypes\_misions::_id_6CD7( var_0, var_1, var_3, var_4, var_5, var_20, var_7, var_1._id_029E, var_11 );
        }

        var_2._id_0308["cur_death_streak"]++;

        if ( _func_1AD( var_1 ) && var_2 maps\mp\_utility::_id_5131() )
            var_1 thread maps\mp\_utility::_id_91FA( "callout_killed_juggernaut", var_1 );
    }

    var_37 = 0;
    var_38 = undefined;

    if ( isdefined( self._id_6F68 ) )
    {
        var_37 = 1;
        var_38 = self._id_6F68;
        self._id_6F68 = undefined;
    }

    if ( _func_1AD( var_1 ) && var_1 != self && ( !level._id_91EB || level._id_91EB && self._id_04A7 != var_1._id_04A7 ) )
    {
        if ( var_37 && isdefined( var_38 ) )
            var_39 = var_38;
        else
            var_39 = self._id_5598;

        if ( !var_11 )
            thread maps\mp\gametypes\_gamelogic::_id_9501( var_39, var_4 );

        var_1 thread maps\mp\gametypes\_gamelogic::_id_94B6( var_5, var_4, var_0 );
    }

    var_2._id_A1D1 = undefined;

    if ( isdefined( var_2._id_907E ) )
        var_2._id_A1D1 = 1;

    var_2 _id_7456();
    var_2._id_0246 = var_1;
    var_2._id_55AF = var_0;

    if ( !isdefined( var_2._id_08A2 ) )
        var_2._id_5593 = var_2._id_02E2;
    else
        var_2._id_5593 = var_2._id_08A2._id_02E2;

    var_2._id_2671 = gettime();
    var_2._id_A152 = 0;
    var_2._id_74FD = 0;
    var_2._id_77E4 = 0;
    var_40 = maps\mp\_awards::_id_4136( var_2 ) - var_2._id_7898;
    var_2 maps\mp\_utility::_id_7FEB( "mostScorePerLife", var_40 );
    var_41 = undefined;

    if ( maps\mp\_utility::_id_5193() )
    {
        var_36 = 1;
        var_10 = 0;
        var_41 = self._id_534D;
        self waittill( "final_rocket_corpse_death" );
    }
    else
    {
        if ( var_10 )
        {
            var_36 = 0;

            if ( !isdefined( var_2._id_08A2 ) )
                var_9 = var_2 _meth_801C( var_0, var_4, var_5, var_7, var_6 );
        }

        if ( var_11 )
        {
            var_36 = 0;
            thread maps\mp\gametypes\_deathicons::_id_07DE( var_2, var_2, var_2._id_04A7, 5.0, var_1, 1 );
        }
        else if ( isdefined( var_2._id_487B ) && var_2._id_487B )
        {
            var_2 _meth_8005();
            thread maps\mp\gametypes\_deathicons::_id_07DE( var_2, var_2, var_2._id_04A7, 5.0, var_1, 0 );
        }
        else if ( !isdefined( var_2._id_08A2 ) )
        {
            var_2.body = var_2 _meth_826D( var_9, var_2._id_5598 );

            if ( var_10 )
                var_2 _meth_8005();

            if ( var_2 _meth_801A() || var_2 _meth_82DD() || !var_2 _meth_833E() || isdefined( var_2._id_626B ) )
                var_2.body _meth_8023();

            if ( !isdefined( var_2._id_907E ) )
                thread maps\mp\gametypes\_deathicons::_id_07DE( var_2.body, var_2, var_2._id_04A7, 5.0, var_1, 0 );

            thread _id_27EE( var_2.body, var_7, var_6, var_5, var_0, var_4 );
        }
        else if ( !isdefined( var_2._id_907E ) )
            thread maps\mp\gametypes\_deathicons::_id_07DE( var_2._id_08A2, var_2, var_2._id_04A7, 5.0, var_1, 0 );
    }

    var_2 thread [[ level._id_64D3 ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, self._id_56F7 );

    if ( _func_0CF( var_2 ) && isdefined( level._id_161B ) && isdefined( level._id_161B["on_killed"] ) )
        var_2 thread [[ level._id_161B["on_killed"] ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, self._id_56F7 );

    if ( maps\mp\_utility::_id_5112( var_1 ) )
        var_42 = var_1 _meth_81B5();
    else
        var_42 = -1;

    if ( !isdefined( var_41 ) && isdefined( var_1 ) )
        var_41 = var_2 _id_3FDF( var_1, var_0, var_5 );

    var_43 = -1;
    var_44 = 0;
    var_45 = 0;

    if ( isdefined( var_41 ) )
    {
        var_43 = var_41 _meth_81B5();
        var_44 = var_41.birthtime;

        if ( isdefined( var_41._id_5352 ) )
        {
            var_44 = var_41._id_5352;
            var_45 = 1;
        }

        if ( !isdefined( var_44 ) )
            var_44 = 0;
    }

    if ( isdefined( var_1 ) && isdefined( var_1._id_55DF ) )
        var_46 = ( gettime() - var_1._id_55DF ) / 1000.0;
    else
        var_46 = 0;

    if ( var_4 != "MOD_SUICIDE" && !( !isdefined( var_1 ) || var_1.classname == "trigger_hurt" || var_1.classname == "worldspawn" || var_1 == var_2 ) )
        _id_7289( 5.0, var_2, var_1, var_42, var_43, var_44, var_5, var_33, var_34, var_35, var_19, var_8, var_4, "normal", var_45 );

    if ( maps\mp\gametypes\_killcam::_id_5354( var_2, var_36 ) )
    {
        var_47 = maps\mp\gametypes\_playerlogic::_id_9382( 1 );
        var_48 = maps\mp\gametypes\_gamelogic::_id_9381();
        var_49 = maps\mp\gametypes\_killcam::_id_5353( var_44, var_5, 0, var_47, var_48, var_45, 0 );
        var_46 = maps\mp\gametypes\_killcam::killcamadjustalivetime( var_46, var_42, var_43 );
        var_50 = maps\mp\gametypes\_killcam::killcamarchivetime( var_49, var_46, var_19, var_8 / 1000 );
        var_2 maps\mp\gametypes\_killcam::_id_6EF9( var_0, var_1, var_50, var_29 );
    }
    else if ( maps\mp\_utility::_id_51E8( var_2._id_1E2E ) && !var_11 )
        var_2 maps\mp\gametypes\_playerlogic::streamclass();

    var_51 = gettime() + 5000;

    if ( !var_10 && !var_11 )
    {
        var_52 = var_2 maps\mp\gametypes\_playerlogic::getrespawndelay() > 0;
        var_53 = !( maps\mp\_utility::_id_3FAA() && !var_2._id_0308["lives"] );

        if ( var_52 || !var_53 )
            var_2 maps\mp\_utility::streamnextspectatorweaponsifnecessary( 1 );

        wait 0.25;
        var_2 thread maps\mp\gametypes\_killcam::_id_1AB5();

        if ( !maps\mp\_utility::_id_5092( level.movecompareactive ) )
        {
            wait 0.25;
            self._id_747A = gettime() + 1000;
            var_47 = maps\mp\gametypes\_playerlogic::_id_9382( 1 );

            if ( var_47 < 1 )
                var_47 = 1;

            wait 1.0;
        }

        if ( isdefined( self.killcamstream ) )
        {
            while ( maps\mp\gametypes\_killcam::_id_5354( var_2, var_36 ) && _func_1AD( self ) && _func_1AD( var_1 ) && !self _meth_8420( self.killcamstream.cust, self.killcamstream._id_A2E6 ) && gettime() < var_51 )
                waittillframeend;
        }

        var_2 notify( "death_delay_finished" );
    }

    var_54 = ( gettime() - var_2._id_2671 ) / 1000;
    self._id_747A = gettime();
    var_55 = gettime() >= var_51;

    if ( maps\mp\gametypes\_killcam::_id_5354( var_2, var_36 ) && !var_55 )
    {
        var_53 = !( maps\mp\_utility::_id_3FAA() && !var_2._id_0308["lives"] );
        var_47 = maps\mp\gametypes\_playerlogic::_id_9382( 1 );
        var_60 = var_53 && var_47 <= 0;

        if ( !var_53 )
        {
            var_47 = -1;
            level notify( "player_eliminated", var_2 );
        }

        var_2 maps\mp\gametypes\_killcam::_id_534B( var_0, var_42, var_43, var_44, var_5, var_33, var_34, var_35, var_54 + var_19, var_8, var_47, var_60, maps\mp\gametypes\_gamelogic::_id_9381(), var_1, var_2, var_4, "normal", var_46, var_45 );
    }

    if ( game["state"] != "playing" )
    {
        if ( !level._id_8516 )
        {
            var_2 maps\mp\_utility::_id_9B69( "dead" );
            var_2 maps\mp\_utility::_id_1EF2();
        }

        return;
    }

    var_61 = maps\mp\_utility::_id_3FAA();
    var_62 = self._id_0308["lives"];

    if ( !var_11 && maps\mp\_utility::_id_51E8( var_2._id_1E2E ) )
        var_2 thread maps\mp\gametypes\_playerlogic::_id_8998();
}

victimcorpsecontentsfixcollats( var_0 )
{
    if ( !isdefined( self.body ) || !isdefined( var_0 ) || !isdefined( self._id_0E2C ) || !isdefined( self._id_0E2C[var_0._id_4450] ) )
        return;

    self.body endon( "death" );
    var_1 = self._id_0E2C[var_0._id_4450]._id_9F44;
    var_2 = self._id_0E2C[var_0._id_4450]._id_9C68;
    var_3 = self._id_0E2C[var_0._id_4450]._id_0513;
    var_4 = self._id_0E2C[var_0._id_4450]._id_867C;

    if ( !isdefined( var_1 ) || !isdefined( var_2 ) || !isdefined( var_3 ) || !isdefined( var_4 ) )
        return;

    if ( !shouldadjustdamagemultipliercollats( var_3, var_4 ) )
        return;

    var_5 = anglestoforward( var_2 );
    var_6 = var_1 + var_2 * -0.01;
    var_7 = self.body _meth_80C0( 0 );

    if ( !isdefined( level.collatsent ) )
    {
        level.collatsent = spawn( "script_model", var_6 );
        level.collatsent _meth_8056();
    }
    else
        level.collatsent._id_02E2 = var_6;

    var_0 attackersetnewcollatsmultiplier( var_3 );
    waittillframeend;

    if ( isdefined( self.body ) )
        self.body _meth_80C0( var_7 );
}

shouldadjustdamagemultipliercollats( var_0, var_1 )
{
    if ( var_1 != "MOD_RIFLE_BULLET" && var_1 != "MOD_PISTOL_BULLET" && var_1 != "MOD_HEAD_SHOT" )
        return 0;

    var_2 = maps\mp\_utility::_id_3F11( var_0 );

    switch ( var_2 )
    {
        case "h1_m14":
        case "h1_barrett":
        case "h1_dragunov":
        case "h1_m21":
        case "h1_m40a3":
        case "h1_remington700":
            return 1;
        default:
            break;
    }

    return 0;
}

attackersetnewcollatsmultiplier( var_0 )
{
    var_1 = attackergetpenetratetypemultiplier( var_0 );

    if ( !isdefined( self.collatsdata ) )
        self.collatsdata = spawnstruct();

    if ( !isdefined( self.collatsdata.collatstime ) || self.collatsdata.collatstime != gettime() )
    {
        self.collatsdata.collatstime = gettime();
        self.collatsdata.nextcollatsmultiplier = 1;
    }

    self.collatsdata.nextcollatsmultiplier -= var_1;
}

attackergetpenetratetypemultiplier( var_0 )
{
    var_1 = maps\mp\_utility::_id_3F11( var_0 );
    var_2 = 0;

    switch ( var_1 )
    {
        case "h1_m14":
        case "h1_m60e4":
        case "h1_rpd":
        case "h1_saw":
        case "h1_barrett":
        case "h1_dragunov":
        case "h1_m21":
        case "h1_m40a3":
        case "h1_remington700":
            var_2 = 40.0;
            break;
        case "h1_ak47":
        case "h1_g3":
        case "h1_g36c":
        case "h1_m16":
        case "h1_m4":
        case "h1_mp44":
        case "h1_ak74u":
            var_2 = 34.0;
            break;
        case "h1_mp5":
        case "h1_p90":
        case "h1_skorpion":
        case "h1_uzi":
        case "h1_m1014":
        case "h1_winchester1200":
            var_2 = 24.0;
            break;
        default:
            break;
    }

    if ( maps\mp\_utility::_id_05CB( "specialty_bulletpenetration" ) )
        var_2 *= 2.0;

    if ( var_2 > 0 )
        var_2 = 1.0 / var_2;

    return var_2;
}

victimmodifydamageforcollats( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) || !isdefined( var_1.collatsdata ) || !isdefined( var_1.collatsdata.collatstime ) || var_1.collatsdata.collatstime != gettime() )
        return var_0;

    var_4 = var_1.collatsdata.nextcollatsmultiplier;
    var_5 = var_1 _meth_8501( var_3, var_2 );
    var_6 = _func_0BC( var_0 / var_5 + 1 );
    var_7 = _func_0BC( var_6 / var_4 + 1 );
    var_8 = _func_0BC( var_7 * var_5 );
    return var_8;
}

_id_A0FC()
{
    self endon( "randomSpawnPressed" );
    self._id_52D5 _meth_80CC( &"PLATFORM_PRESS_TO_TEAMSPAWN" );
    self._id_52D5.alpha = 1;
    self._id_52D4 _meth_80CC( &"PLATFORM_PRESS_TO_RESPAWN" );
    self._id_52D4.alpha = 1;
    thread _id_A062();
    thread _id_A05D();

    if ( isdefined( self._id_85BF ) && self._id_85BF )
        var_0 = 8;
    else
        var_0 = 9;

    if ( isdefined( self._id_937E ) )
        var_1 = _func_0BC( _func_0E3( var_0 - ( gettime() - self._id_937E ) / 1000 ) );
    else
        var_1 = var_0;

    self._id_66A6 = 0;
    wait 0.5;

    for ( var_2 = var_1; var_2 > 0; var_2-- )
    {
        maps\mp\_utility::_id_7FA5( "kc_info", &"MP_TIME_TILL_SPAWN", var_1, 1, 1 );
        wait 1;
    }

    self._id_52D4.alpha = 0;
    self._id_52D5.alpha = 0;
    maps\mp\_utility::_id_1EF5( "kc_info" );
    self notify( "abort_fireteam_spawn" );
}

_id_A05D()
{
    self endon( "disconnect" );
    self endon( "abort_fireteam_spawn" );

    while ( self _meth_8339() )
        wait 0.05;

    while ( !self _meth_8339() )
    {
        wait 0.05;

        if ( !maps\mp\_utility::_id_5189( self._id_66A5 ) )
            break;
    }

    self._id_66A6 = 0;
    self notify( "randomSpawnPressed" );
    self._id_52D4.alpha = 0;
    self._id_52D5.alpha = 0;
    maps\mp\_utility::_id_1EF5( "kc_info" );
    self notify( "abort_fireteam_spawn" );
}

_id_A062()
{
    self endon( "disconnect" );
    self endon( "abort_fireteam_spawn" );

    while ( self _meth_833A() )
        wait 0.05;

    while ( !self _meth_833A() )
        wait 0.05;

    self._id_66A6 = 1;
    self _meth_82F1( "copycat_steal_class" );
    self notify( "teamSpawnPressed" );
    self._id_52D4.alpha = 0;
    self._id_52D5.alpha = 0;
}

_id_1CFF()
{
    if ( level._id_2A55 != 1 )
        return 0;

    if ( !maps\mp\_utility::_id_3FAA() )
        return 0;

    if ( level._id_57B9[self._id_04A7] > 0 )
        return 0;

    foreach ( var_1 in level._id_0323 )
    {
        if ( !_func_1A1( var_1 ) )
            continue;

        if ( var_1._id_04A7 != self._id_04A7 )
            continue;

        if ( var_1 == self )
            continue;

        if ( !var_1._id_4E3C )
            return 0;
    }

    foreach ( var_1 in level._id_0323 )
    {
        if ( !_func_1A1( var_1 ) )
            continue;

        if ( var_1._id_04A7 != self._id_04A7 )
            continue;

        if ( var_1._id_4E3C && var_1 != self )
            var_1 _id_55E7( 0 );
    }

    return 1;
}

_id_4DBE()
{
    level._id_3742 = [];
    level._id_374C = [];
    level._id_373F = [];
    level._id_3740 = [];
    level._id_3743 = [];
    level._id_3744 = [];
    level._id_3747 = [];
    level.finalkillcam_weaponindex = [];
    level.finalkillcam_customindex = [];
    level.finalkillcam_isalternate = [];
    level._id_3741 = [];
    level._id_3745 = [];
    level._id_3749 = [];
    level._id_3748 = [];
    level._id_3746 = [];
    level._id_374A = [];
    level._id_374B = [];

    if ( level._id_5FEC )
    {
        foreach ( var_1 in level._id_91F7 )
        {
            level._id_3742[var_1] = undefined;
            level._id_374C[var_1] = undefined;
            level._id_373F[var_1] = undefined;
            level._id_3740[var_1] = undefined;
            level._id_3743[var_1] = undefined;
            level._id_3744[var_1] = undefined;
            level._id_3747[var_1] = undefined;
            level.finalkillcam_weaponindex[var_1] = undefined;
            level.finalkillcam_customindex[var_1] = undefined;
            level.finalkillcam_isalternate[var_1] = undefined;
            level._id_3741[var_1] = undefined;
            level._id_3745[var_1] = undefined;
            level._id_3749[var_1] = undefined;
            level._id_3748[var_1] = undefined;
            level._id_3746[var_1] = undefined;
            level._id_374A[var_1] = undefined;
            level._id_374B[var_1] = undefined;
        }
    }
    else
    {
        level._id_3742["axis"] = undefined;
        level._id_374C["axis"] = undefined;
        level._id_373F["axis"] = undefined;
        level._id_3740["axis"] = undefined;
        level._id_3743["axis"] = undefined;
        level._id_3744["axis"] = undefined;
        level._id_3747["axis"] = undefined;
        level.finalkillcam_weaponindex["axis"] = undefined;
        level.finalkillcam_customindex["axis"] = undefined;
        level.finalkillcam_isalternate["axis"] = undefined;
        level._id_3741["axis"] = undefined;
        level._id_3745["axis"] = undefined;
        level._id_3749["axis"] = undefined;
        level._id_3748["axis"] = undefined;
        level._id_3746["axis"] = undefined;
        level._id_374A["axis"] = undefined;
        level._id_374B["axis"] = undefined;
        level._id_3742["allies"] = undefined;
        level._id_374C["allies"] = undefined;
        level._id_373F["allies"] = undefined;
        level._id_3740["allies"] = undefined;
        level._id_3743["allies"] = undefined;
        level._id_3744["allies"] = undefined;
        level._id_3747["allies"] = undefined;
        level.finalkillcam_weaponindex["allies"] = undefined;
        level.finalkillcam_customindex["allies"] = undefined;
        level.finalkillcam_isalternate["allies"] = undefined;
        level._id_3741["allies"] = undefined;
        level._id_3745["allies"] = undefined;
        level._id_3749["allies"] = undefined;
        level._id_3748["allies"] = undefined;
        level._id_3746["allies"] = undefined;
        level._id_374A["allies"] = undefined;
        level._id_374B["allies"] = undefined;
    }

    level._id_3742["none"] = undefined;
    level._id_374C["none"] = undefined;
    level._id_373F["none"] = undefined;
    level._id_3740["none"] = undefined;
    level._id_3743["none"] = undefined;
    level._id_3744["none"] = undefined;
    level._id_3747["none"] = undefined;
    level.finalkillcam_weaponindex["none"] = undefined;
    level.finalkillcam_customindex["none"] = undefined;
    level.finalkillcam_isalternate["none"] = undefined;
    level._id_3741["none"] = undefined;
    level._id_3745["none"] = undefined;
    level._id_3749["none"] = undefined;
    level._id_3748["none"] = undefined;
    level._id_3746["none"] = undefined;
    level._id_374A["none"] = undefined;
    level._id_374B["none"] = undefined;
    level._id_374D = undefined;
}

_id_7289( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14 )
{
    if ( level._id_91EB && isdefined( var_2._id_04A7 ) )
    {
        level._id_3742[var_2._id_04A7] = var_0;
        level._id_374C[var_2._id_04A7] = var_1;
        level._id_373F[var_2._id_04A7] = var_2;
        level._id_3740[var_2._id_04A7] = var_3;
        level._id_3743[var_2._id_04A7] = var_4;
        level._id_3744[var_2._id_04A7] = var_5;
        level._id_3747[var_2._id_04A7] = var_6;
        level.finalkillcam_weaponindex[var_2._id_04A7] = var_7;
        level.finalkillcam_customindex[var_2._id_04A7] = var_8;
        level.finalkillcam_isalternate[var_2._id_04A7] = var_9;
        level._id_3741[var_2._id_04A7] = var_10;
        level._id_3745[var_2._id_04A7] = var_11;
        level._id_3749[var_2._id_04A7] = maps\mp\_utility::_id_40C7();
        level._id_3748[var_2._id_04A7] = maps\mp\_utility::_id_40C7();
        level._id_3746[var_2._id_04A7] = var_12;
        level._id_374A[var_2._id_04A7] = var_13;
        level._id_374B[var_2._id_04A7] = isdefined( var_14 ) && var_14;
    }

    level._id_3742["none"] = var_0;
    level._id_374C["none"] = var_1;
    level._id_373F["none"] = var_2;
    level._id_3740["none"] = var_3;
    level._id_3743["none"] = var_4;
    level._id_3744["none"] = var_5;
    level._id_3747["none"] = var_6;
    level.finalkillcam_weaponindex["none"] = var_7;
    level.finalkillcam_customindex["none"] = var_8;
    level.finalkillcam_isalternate["none"] = var_9;
    level._id_3741["none"] = var_10;
    level._id_3745["none"] = var_11;
    level._id_3749["none"] = maps\mp\_utility::_id_40C7();
    level._id_3748["none"] = maps\mp\_utility::_id_40C7();
    level._id_3748["none"] = maps\mp\_utility::_id_40C7();
    level._id_3746["none"] = var_12;
    level._id_374A["none"] = var_13;
    level._id_374B["none"] = isdefined( var_14 ) && var_14;
}

_id_334E()
{
    if ( level._id_5FEC )
    {
        for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
        {
            level._id_3742[level._id_91F7[var_0]] = undefined;
            level._id_374C[level._id_91F7[var_0]] = undefined;
            level._id_373F[level._id_91F7[var_0]] = undefined;
            level._id_3740[level._id_91F7[var_0]] = undefined;
            level._id_3743[level._id_91F7[var_0]] = undefined;
            level._id_3744[level._id_91F7[var_0]] = undefined;
            level._id_3747[level._id_91F7[var_0]] = undefined;
            level.finalkillcam_weaponindex[level._id_91F7[var_0]] = undefined;
            level.finalkillcam_customindex[level._id_91F7[var_0]] = undefined;
            level.finalkillcam_isalternate[level._id_91F7[var_0]] = undefined;
            level._id_3741[level._id_91F7[var_0]] = undefined;
            level._id_3745[level._id_91F7[var_0]] = undefined;
            level._id_3749[level._id_91F7[var_0]] = undefined;
            level._id_3748[level._id_91F7[var_0]] = undefined;
            level._id_3746[level._id_91F7[var_0]] = undefined;
            level._id_374A[level._id_91F7[var_0]] = undefined;
            level._id_374B[level._id_91F7[var_0]] = undefined;
        }
    }
    else
    {
        level._id_3742["axis"] = undefined;
        level._id_374C["axis"] = undefined;
        level._id_373F["axis"] = undefined;
        level._id_3740["axis"] = undefined;
        level._id_3743["axis"] = undefined;
        level._id_3744["axis"] = undefined;
        level._id_3747["axis"] = undefined;
        level.finalkillcam_weaponindex["axis"] = undefined;
        level.finalkillcam_customindex["axis"] = undefined;
        level.finalkillcam_isalternate["axis"] = undefined;
        level._id_3741["axis"] = undefined;
        level._id_3745["axis"] = undefined;
        level._id_3749["axis"] = undefined;
        level._id_3748["axis"] = undefined;
        level._id_3746["axis"] = undefined;
        level._id_374A["axis"] = undefined;
        level._id_374B["axis"] = undefined;
        level._id_3742["allies"] = undefined;
        level._id_374C["allies"] = undefined;
        level._id_373F["allies"] = undefined;
        level._id_3740["allies"] = undefined;
        level._id_3743["allies"] = undefined;
        level._id_3744["allies"] = undefined;
        level._id_3747["allies"] = undefined;
        level.finalkillcam_weaponindex["allies"] = undefined;
        level.finalkillcam_customindex["allies"] = undefined;
        level.finalkillcam_isalternate["allies"] = undefined;
        level._id_3741["allies"] = undefined;
        level._id_3745["allies"] = undefined;
        level._id_3749["allies"] = undefined;
        level._id_3748["allies"] = undefined;
        level._id_3746["allies"] = undefined;
        level._id_374A["allies"] = undefined;
        level._id_374B["allies"] = undefined;
    }

    level._id_3742["none"] = undefined;
    level._id_374C["none"] = undefined;
    level._id_373F["none"] = undefined;
    level._id_3740["none"] = undefined;
    level._id_3743["none"] = undefined;
    level._id_3744["none"] = undefined;
    level._id_3747["none"] = undefined;
    level.finalkillcam_weaponindex["none"] = undefined;
    level.finalkillcam_customindex["none"] = undefined;
    level.finalkillcam_isalternate["none"] = undefined;
    level._id_3741["none"] = undefined;
    level._id_3745["none"] = undefined;
    level._id_3749["none"] = undefined;
    level._id_3748["none"] = undefined;
    level._id_3746["none"] = undefined;
    level._id_374A["none"] = undefined;
    level._id_374B["none"] = undefined;
    level._id_374D = undefined;
}

streamfinalkillcam()
{
    if ( _func_0CF( self ) )
        return;

    var_0 = "none";

    if ( isdefined( level._id_374D ) )
        var_0 = level._id_374D;

    var_1 = level._id_374C[var_0];
    var_2 = level._id_373F[var_0];
    var_3 = level._id_3748[var_0];
    var_4 = level._id_3749[var_0];

    if ( !finalkillcamvalid( var_1, var_2, var_3, var_4 ) )
        return;

    var_5 = level._id_3744[var_0];
    var_6 = level._id_3747[var_0];
    var_7 = level._id_374B[var_0];
    var_8 = level._id_3745[var_0];
    var_9 = level._id_3741[var_0];
    var_10 = ( gettime() - var_1._id_2671 ) / 1000;
    var_11 = var_10 + var_9;
    var_12 = maps\mp\gametypes\_killcam::_id_5353( var_5, var_6, var_11, 0, getkillcambuffertime(), var_7, 1 );
    var_13 = var_12 + var_11 + var_8 / 1000;
    self _meth_852B( 1 );
    thread maps\mp\gametypes\_killcam::_id_6EF9( level._id_373F[var_0], level._id_373F[var_0], var_13, "none" );
}

streamcheck( var_0 )
{
    level endon( "stream_end" );

    foreach ( var_2 in level._id_0323 )
    {
        if ( _func_0CF( var_2 ) )
            continue;

        if ( isdefined( var_2.killcamstream ) )
        {
            var_3 = [];

            if ( var_2.killcamstream._id_A2E6.size > 0 )
                var_3[0] = var_2.killcamstream._id_A2E6[0];

            while ( _func_1AD( var_2 ) && _func_1AD( var_0 ) && !var_2 _meth_8420( var_2.killcamstream.cust, var_3 ) )
                waittillframeend;
        }
    }

    level notify( "stream_end" );
}

resetonlystreamactive()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( !_func_0CF( var_1 ) )
            var_1 _meth_852B( 0 );
    }
}

streamtimeout( var_0 )
{
    level endon( "stream_end" );
    wait(var_0);
    level notify( "stream_end" );
}

waitforstream( var_0 )
{
    thread streamtimeout( 5.0 );
    streamcheck( var_0 );
}

getkillcambuffertime()
{
    return 15;
}

finalkillcamvalid( var_0, var_1, var_2, var_3 )
{
    var_4 = isdefined( var_0 ) && isdefined( var_1 );

    if ( var_4 )
    {
        var_5 = getkillcambuffertime();
        var_6 = var_2 - var_3;

        if ( var_6 <= var_5 )
            return 1;
    }

    return 0;
}

endfinalkillcam()
{
    resetonlystreamactive();
    level._id_8516 = 0;
    level notify( "final_killcam_done" );
}

_id_2C7C()
{
    level waittill( "round_end_finished" );
    level._id_8516 = 1;
    var_0 = "none";

    if ( isdefined( level._id_374D ) )
        var_0 = level._id_374D;

    var_1 = level._id_3742[var_0];
    var_2 = level._id_374C[var_0];
    var_3 = level._id_373F[var_0];
    var_4 = level._id_3740[var_0];
    var_5 = level._id_3743[var_0];
    var_6 = level._id_3744[var_0];
    var_7 = level._id_374B[var_0];
    var_8 = level._id_3747[var_0];
    var_9 = level.finalkillcam_weaponindex[var_0];
    var_10 = level.finalkillcam_customindex[var_0];
    var_11 = level.finalkillcam_isalternate[var_0];
    var_12 = level._id_3741[var_0];
    var_13 = level._id_3745[var_0];
    var_14 = level._id_3749[var_0];
    var_15 = level._id_3748[var_0];
    var_16 = level._id_3746[var_0];
    var_17 = level._id_374A[var_0];

    if ( !finalkillcamvalid( var_2, var_3, var_15, var_14 ) )
    {
        endfinalkillcam();
        return;
    }

    if ( isdefined( var_3 ) )
    {
        var_3._id_373E = 1;
        var_0 = "none";

        if ( level._id_91EB && isdefined( var_3._id_04A7 ) )
            var_0 = var_3._id_04A7;

        switch ( level._id_3747[var_0] )
        {
            case "artillery_mp":
                var_3 maps\mp\gametypes\_misions::_id_6FF6( "ch_finishingtouch" );
                break;
            default:
                break;
        }
    }

    waitforstream( var_3 );
    var_18 = ( gettime() - var_2._id_2671 ) / 1000;

    foreach ( var_20 in level._id_0323 )
    {
        var_20 maps\mp\_utility::_id_74FA( 0 );
        var_20 _meth_82D6( 0, 0 );
        var_20._id_0238 = var_2 _meth_81B5();

        if ( isdefined( var_3 ) && isdefined( var_3._id_55DF ) )
            var_21 = ( gettime() - var_3._id_55DF ) / 1000.0;
        else
            var_21 = 0;

        var_20 thread maps\mp\gametypes\_killcam::_id_534B( var_3, var_4, var_5, var_6, var_8, var_9, var_10, var_11, var_18 + var_12, var_13, 0, 1, getkillcambuffertime(), var_3, var_2, var_16, var_17, var_21, var_7 );
    }

    wait 0.1;

    while ( _id_0C98() )
        wait 0.05;

    endfinalkillcam();
}

_id_0C98()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( isdefined( var_1._id_534B ) )
            return 1;
    }

    return 0;
}

_id_7456()
{
    self._id_5363 = [];
    self._id_907E = undefined;
    self._id_528C = undefined;
    self._id_566D = undefined;
    self.farsightchallengecounter = 0;
    self.humiliationfinderscounter = [];
    self._id_0308["cur_kill_streak"] = 0;
    self._id_0308["cur_kill_streak_for_nuke"] = 0;
    self._id_023B = 0;
    self _meth_82F8( "ks_count1", 0 );
    maps\mp\gametypes\_gameobjects::_id_2984();
}

_id_3FDF( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_2A50 ) && var_0._id_2A50 && isdefined( var_0._id_9940 ) )
    {
        var_0._id_2A50 = undefined;
        return var_0._id_9940._id_534D;
    }

    switch ( var_2 )
    {
        case "artillery_mp":
        case "bomb_site_mp":
        case "bouncingbetty_mp":
            return var_1._id_534D;
        case "none":
            if ( isdefined( var_1._id_04A6 ) && var_1._id_04A6 == "care_package" )
                return var_1._id_534D;

            break;
        case "ac130_105mm_mp":
        case "ac130_40mm_mp":
        case "ac130_25mm_mp":
            return undefined;
    }

    if ( maps\mp\_utility::_id_50F3( var_2 ) || maps\mp\_utility::_id_50C9( var_2 ) )
    {
        if ( isdefined( var_1._id_534D ) && !var_0 _id_0E2F() )
            return var_1._id_534D;
        else
            return undefined;
    }

    if ( !isdefined( var_1 ) || var_0 == var_1 && !_func_1FF( var_0 ) )
        return undefined;

    return var_1;
}

_id_0E2F()
{
    if ( !isdefined( self ) )
        return 0;

    if ( isdefined( level._id_1D48 ) && isdefined( level._id_1D48._id_4473 ) && self == level._id_1D48._id_4473 )
        return 1;

    if ( isdefined( self._id_9C26 ) && self._id_9C26 )
        return 1;

    if ( isdefined( self._id_9C25 ) && self._id_9C25 )
        return 1;

    return 0;
}

_id_4923( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5[0] = 2;
    var_5[1] = 3;
    var_5[2] = 5;
    var_5[3] = 7;

    if ( !getdvarint( "scr_hitloc_debug" ) )
        return;

    if ( !isdefined( var_0._id_4924 ) )
    {
        for ( var_6 = 0; var_6 < 6; var_6++ )
            var_0 _meth_82F9( "ui_hitloc_" + var_6, "" );

        var_0._id_4924 = 1;
    }

    if ( level._id_8A7C || !_func_1AD( var_0 ) )
        return;

    var_7 = 6;

    if ( !isdefined( var_0._id_25A2 ) )
    {
        var_0._id_25A2 = [];

        for ( var_6 = 0; var_6 < var_7; var_6++ )
        {
            var_0._id_25A2[var_6] = spawnstruct();
            var_0._id_25A2[var_6]._id_00FA = 0;
            var_0._id_25A2[var_6]._id_4922 = "";
            var_0._id_25A2[var_6]._id_175E = 0;
            var_0._id_25A2[var_6]._id_529A = 0;
            var_0._id_25A2[var_6]._id_204B = 0;
        }

        var_0._id_25A3 = 0;
        var_0._id_25A4 = undefined;
    }

    for ( var_6 = var_7 - 1; var_6 > 0; var_6-- )
    {
        var_0._id_25A2[var_6]._id_00FA = var_0._id_25A2[var_6 - 1]._id_00FA;
        var_0._id_25A2[var_6]._id_4922 = var_0._id_25A2[var_6 - 1]._id_4922;
        var_0._id_25A2[var_6]._id_175E = var_0._id_25A2[var_6 - 1]._id_175E;
        var_0._id_25A2[var_6]._id_529A = var_0._id_25A2[var_6 - 1]._id_529A;
        var_0._id_25A2[var_6]._id_204B = var_0._id_25A2[var_6 - 1]._id_204B;
    }

    var_0._id_25A2[0]._id_00FA = var_2;
    var_0._id_25A2[0]._id_4922 = var_3;
    var_0._id_25A2[0]._id_175E = var_4 & level._id_4B5C;
    var_0._id_25A2[0]._id_529A = var_1 maps\mp\_utility::_id_5131();

    if ( isdefined( var_0._id_25A4 ) && var_0._id_25A4 != var_1 )
    {
        var_0._id_25A3++;

        if ( var_0._id_25A3 == var_5.size )
            var_0._id_25A3 = 0;
    }

    var_0._id_25A4 = var_1;
    var_0._id_25A2[0]._id_204B = var_0._id_25A3;

    for ( var_6 = 0; var_6 < var_7; var_6++ )
    {
        var_8 = "^" + var_5[var_0._id_25A2[var_6]._id_204B];

        if ( var_0._id_25A2[var_6]._id_4922 != "" )
        {
            var_9 = var_8 + var_0._id_25A2[var_6]._id_4922;

            if ( var_0._id_25A2[var_6]._id_175E )
                var_9 += " (BP)";

            if ( var_0._id_25A2[var_6]._id_529A )
                var_9 += " (Jugg)";

            var_0 _meth_82F9( "ui_hitloc_" + var_6, var_9 );
        }

        var_0 _meth_82F9( "ui_hitloc_damage_" + var_6, var_8 + var_0._id_25A2[var_6]._id_00FA );
    }
}

_id_5116( var_0 )
{
    if ( !maps\mp\_utility::_id_05CB( "specialty_stun_resistance" ) )
        return 0;

    switch ( var_0 )
    {

    }

    return 0;
}

victimcanupdatefinalattackerdata( var_0 )
{
    if ( !isdefined( self._id_9C06 ) )
        return 1;

    if ( !isdefined( self._id_55EC ) || !isdefined( self._id_55EC.attacker ) )
        return 1;

    if ( !isdefined( var_0 ) )
        return 1;

    return self._id_55EC.attacker == var_0;
}

_id_19F2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( getdvarint( "virtuallobbyactive", 0 ) )
        return "virtuallobbyactive";

    var_1 = maps\mp\_utility::_id_0683( var_1 );
    var_11 = maps\mp\_utility::_id_8F5C( var_6, "_lefthand" );

    if ( isdefined( var_5 ) && var_5 == "MOD_CRUSH" && isdefined( var_0 ) && isdefined( var_0.classname ) && var_0.classname == "script_vehicle" )
        return "crushed";

    if ( !maps\mp\_utility::_id_5189( var_2 ) && !isdefined( var_2._id_4E3D ) )
        return "!isReallyAlive( victim )";

    if ( isdefined( var_1 ) && var_1.classname == "script_origin" && isdefined( var_1._id_04D9 ) && var_1._id_04D9 == "soft_landing" )
        return "soft_landing";

    if ( var_2 _id_5116( var_6 ) )
        return "specialty_stun_resistance";

    if ( isdefined( level._id_4A39 ) )
        return "level.hostMigrationTimer";

    if ( var_5 == "MOD_FALLING" )
        var_2 thread _id_3064( var_3 );

    if ( var_5 == "MOD_EXPLOSIVE_BULLET" && var_3 != 1 )
    {
        var_3 *= getdvarfloat( "scr_explBulletMod" );
        var_3 = _func_0BC( var_3 );
    }

    if ( isdefined( var_1 ) && var_1.classname == "worldspawn" )
        var_1 = undefined;

    if ( isdefined( var_1 ) && isdefined( var_1._id_4473 ) )
        var_1 = var_1._id_4473;

    var_12 = maps\mp\_utility::_id_0E30( var_2, var_1 );
    var_13 = isdefined( var_1 ) && isdefined( var_0 ) && isdefined( var_2 ) && _func_1AD( var_1 ) && var_1 == var_0 && var_1 == var_2 && !isdefined( var_0._id_6E29 );

    if ( var_13 )
        return "attackerIsInflictorVictim";

    var_14 = 0.0;

    if ( var_4 & level._id_4B61 )
    {
        var_14 = 0.0;
        var_3 = 0.0;
    }
    else if ( var_9 == "shield" )
    {
        if ( var_12 && level._id_01A7 == 0 )
            return "attackerIsHittingTeammate";

        if ( var_5 == "MOD_PISTOL_BULLET" || var_5 == "MOD_RIFLE_BULLET" || var_5 == "MOD_EXPLOSIVE_BULLET" && !var_12 )
        {
            if ( _func_1AD( var_1 ) )
            {
                var_1._id_5576 = var_2;
                var_1._id_5577 = gettime();
            }

            if ( maps\mp\_utility::_id_50FE( var_6 ) )
                var_16 = 25;
            else
                var_16 = maps\mp\perks\_perks::_id_198D( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9 );

            var_2._id_83C6 += var_16;

            if ( !maps\mp\_utility::_id_50FE( var_6 ) || common_scripts\utility::_id_2006() )
                var_2._id_83C5++;

            if ( var_2._id_83C5 >= level._id_7557 )
            {
                var_2._id_83C6 = 0;
                var_2._id_83C5 = 0;
            }
        }

        if ( var_4 & level._id_4B5E )
        {
            var_9 = "none";

            if ( !( var_4 & level._id_4B5F ) )
                var_3 *= 0.0;
        }
        else if ( var_4 & level._id_4B60 )
        {
            if ( isdefined( var_0 ) && isdefined( var_0._id_8F6C ) && var_0._id_8F6C == var_2 )
                var_3 = 51;

            var_9 = "none";
        }
        else
            return "hit shield";
    }
    else if ( maps\mp\_utility::_id_5150( var_5 ) && _func_120( var_6, "riotshield" ) )
    {
        if ( !( var_12 && level._id_01A7 == 0 ) )
        {
            var_14 = 0.0;
            var_2 _meth_8187( 0.0 );
        }
    }

    if ( !var_12 )
        var_3 = maps\mp\perks\_perks::_id_198D( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_0 );

    if ( isdefined( level._id_5D51 ) )
        var_3 = [[ level._id_5D51 ]]( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9 );

    var_17 = isdefined( var_1 ) && !isdefined( var_1._id_4473 ) && ( var_1.classname == "script_vehicle" || var_1.classname == "misc_turret" || var_1.classname == "script_model" );
    var_12 = maps\mp\_utility::_id_0E30( var_2, var_1 );

    if ( !var_3 )
        return "!iDamage";

    var_2._id_4B56 = var_4;
    var_2._id_4B62 = gettime();

    if ( game["state"] == "postgame" )
        return "game[ state ] == postgame";

    if ( var_2._id_03BD == "spectator" )
        return "victim.sessionteam == spectator";

    if ( isdefined( var_2._id_1AC6 ) && !var_2._id_1AC6 )
        return "!victim.canDoCombat";

    if ( isdefined( var_1 ) && _func_1AD( var_1 ) && isdefined( var_1._id_1AC6 ) && !var_1._id_1AC6 )
        return "!eAttacker.canDoCombat";

    if ( isdefined( var_1 ) && _func_1A1( var_1 ) && !isdefined( var_1._id_67D0 ) )
        var_1._id_67D0 = 0;

    if ( var_17 && var_12 )
    {
        if ( var_5 == "MOD_CRUSH" )
        {
            var_2 maps\mp\_utility::_id_066F();
            return "suicide crush";
        }

        if ( !level._id_01A7 )
            return "!level.friendlyfire";
    }

    if ( _func_0CF( self ) )
        self [[ level._id_161B["on_damaged"] ]]( var_1, var_3, var_5, var_6, var_0, var_9 );

    if ( !isdefined( var_8 ) )
        var_4 |= level._id_4B58;

    var_18 = 0;

    if ( var_2._id_01E6 == var_2._id_0271 && ( !isdefined( var_2._id_0249 ) || !var_2._id_0249 ) || !isdefined( var_2._id_0E34 ) && !isdefined( var_2._id_0249 ) )
    {
        var_2._id_0E34 = [];
        var_2._id_0E2C = [];
    }

    if ( maps\mp\_utility::_id_5117( var_6, var_9, var_5, var_1 ) )
        var_5 = "MOD_HEAD_SHOT";

    if ( maps\mp\gametypes\_tweakables::_id_4142( "game", "onlyheadshots" ) )
    {
        if ( var_5 == "MOD_PISTOL_BULLET" || var_5 == "MOD_RIFLE_BULLET" || var_5 == "MOD_EXPLOSIVE_BULLET" || var_5 == "MOD_IMPACT" )
            return "getTweakableValue( game, onlyheadshots )";
        else if ( var_5 == "MOD_HEAD_SHOT" )
        {
            if ( var_2 maps\mp\_utility::_id_5131() )
                var_3 = 75;
            else
                var_3 = 150;
        }
    }

    if ( var_6 == "none" && isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_0117 ) && _func_120( var_0._id_0117, "vehicle_" ) )
            var_6 = "destructible_car";
    }

    if ( var_6 == "destructible_toy" && isdefined( var_0 ) )
    {
        var_19 = var_0 _meth_8438();

        if ( _func_120( var_19, "destpv_" ) )
            var_6 = "destructible_car";
    }

    if ( gettime() < var_2._id_03DC + level._id_53A8 )
    {
        var_20 = _func_0BC( _func_0E1( var_2._id_01E6 / 4, 1 ) );

        if ( var_3 >= var_20 && maps\mp\_utility::_id_513D( var_6 ) && !maps\mp\_utility::_id_5150( var_5 ) )
            var_3 = var_20;
    }

    if ( !( var_4 & level._id_4B59 ) )
    {
        if ( !level._id_91EB && var_17 && isdefined( var_1._id_02E5 ) && var_1._id_02E5 == var_2 )
        {
            if ( var_5 == "MOD_CRUSH" )
                var_2 maps\mp\_utility::_id_066F();

            return "ffa suicide";
        }

        if ( ( _func_120( var_5, "MOD_GRENADE" ) || _func_120( var_5, "MOD_EXPLOSIVE" ) || _func_120( var_5, "MOD_PROJECTILE" ) ) && isdefined( var_0 ) && isdefined( var_1 ) )
        {
            if ( var_2 != var_1 && var_0.classname == "grenade" && var_2._id_55DF + 3500 > gettime() && isdefined( var_2._id_55DD ) && _func_0EE( var_0._id_02E2, var_2._id_55DD._id_02E2 ) < 250 )
                return "spawnkill grenade protection";

            if ( var_2 victimcanupdatefinalattackerdata( var_1 ) )
            {
                var_2._id_357E = [];
                var_2._id_357E["damageTime"] = gettime();
                var_2._id_357E["damageId"] = var_0 _meth_81B5();
                var_2._id_357E["returnToSender"] = 0;
                var_2._id_357E["counterKill"] = 0;
                var_2._id_357E["chainKill"] = 0;
                var_2._id_357E["cookedKill"] = 0;
                var_2._id_357E["throwbackKill"] = 0;
                var_2._id_357E["suicideGrenadeKill"] = 0;
                var_2._id_357E["weapon"] = var_6;
                var_21 = _func_120( var_6, "h1_frag" );

                if ( var_1 != var_2 )
                {
                    if ( ( _func_120( var_6, "c4_" ) || _func_120( var_6, "claymore_" ) ) && isdefined( var_1 ) && isdefined( var_0._id_02E5 ) )
                    {
                        var_2._id_357E["returnToSender"] = var_0._id_02E5 == var_2;
                        var_2._id_357E["counterKill"] = isdefined( var_0._id_A1C3 );
                        var_2._id_357E["chainKill"] = isdefined( var_0._id_A1C0 );
                        var_2._id_357E["bulletPenetrationKill"] = isdefined( var_0._id_A1C5 );
                        var_2._id_357E["cookedKill"] = 0;
                    }

                    if ( isdefined( var_1._id_55A5 ) && var_1._id_55A5 >= gettime() - 50 && var_21 )
                        var_2._id_357E["suicideGrenadeKill"] = 1;
                }

                if ( var_21 )
                {
                    var_2._id_357E["cookedKill"] = isdefined( var_0._id_50E8 );
                    var_2._id_357E["throwbackKill"] = isdefined( var_0._id_9337 );
                }

                var_2._id_357E["stickKill"] = isdefined( var_0._id_51BB ) && var_0._id_51BB == "enemy";
                var_2._id_357E["stickFriendlyKill"] = isdefined( var_0._id_51BB ) && var_0._id_51BB == "friendly";
            }

            if ( _func_1AD( var_1 ) && var_1 != self )
                maps\mp\gametypes\_gamelogic::_id_7F93( var_0, var_1, var_6 );
        }

        if ( _func_120( var_5, "MOD_IMPACT" ) && ( var_6 == "m320_mp" || _func_120( var_6, "gl" ) || _func_120( var_6, "gp25" ) ) )
        {
            if ( _func_1AD( var_1 ) && var_1 != self )
                maps\mp\gametypes\_gamelogic::_id_7F93( var_0, var_1, var_6 );
        }

        if ( _func_1AD( var_1 ) && isdefined( var_1._id_0308["participation"] ) )
            var_1._id_0308["participation"]++;
        else if ( _func_1AD( var_1 ) )
            var_1._id_0308["participation"] = 1;

        if ( var_12 )
        {
            if ( level._id_01A7 == 0 || !_func_1AD( var_1 ) && level._id_01A7 != 1 )
            {
                if ( var_6 == "artillery_mp" )
                    var_2 _id_25AE( var_0, var_6, var_5, var_3, var_4, var_1 );

                return "friendly fire";
            }
            else if ( level._id_01A7 == 1 )
            {
                if ( var_3 < 1 )
                    var_3 = 1;

                if ( var_2 maps\mp\_utility::_id_5131() )
                    var_3 = maps\mp\perks\_perks::_id_198D( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9 );

                var_2._id_5591 = 0;
                var_2 _id_379A( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
            }
            else if ( level._id_01A7 == 2 && maps\mp\_utility::_id_5189( var_1 ) )
            {
                var_3 = _func_0BC( var_3 * 0.5 );

                if ( var_3 < 1 )
                    var_3 = 1;

                var_1._id_5591 = 0;
                var_1._id_3A97 = 1;
                var_1 _id_379A( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
                var_1._id_3A97 = undefined;
            }
            else if ( level._id_01A7 == 3 && maps\mp\_utility::_id_5189( var_1 ) )
            {
                var_3 = _func_0BC( var_3 * 0.5 );

                if ( var_3 < 1 )
                    var_3 = 1;

                var_2._id_5591 = 0;
                var_1._id_5591 = 0;
                var_2 _id_379A( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );

                if ( maps\mp\_utility::_id_5189( var_1 ) )
                {
                    var_1._id_3A97 = 1;
                    var_1 _id_379A( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
                    var_1._id_3A97 = undefined;
                }
            }

            var_18 = 1;
        }
        else
        {
            if ( var_3 < 1 )
                var_3 = 1;

            if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
                _id_07CC( var_2, var_1, var_0, var_6, var_3, var_7, var_8, var_9, var_10, var_5 );

            if ( isdefined( var_1 ) && !_func_1AD( var_1 ) && isdefined( var_1._id_02E5 ) && ( !isdefined( var_1._id_78CD ) || !var_1._id_78CD ) )
                _id_07CC( var_2, var_1._id_02E5, var_0, var_6, var_3, var_7, var_8, var_9, var_10, var_5 );
            else if ( isdefined( var_1 ) && !_func_1AD( var_1 ) && isdefined( var_1._id_7C02 ) && isdefined( var_1._id_78CD ) && var_1._id_78CD )
                _id_07CC( var_2, var_1._id_7C02, var_0, var_6, var_3, var_7, var_8, var_9, var_10, var_5 );

            if ( var_5 == "MOD_EXPLOSIVE" || var_5 == "MOD_GRENADE_SPLASH" && var_3 < var_2._id_01E6 )
                var_2 notify( "survived_explosion", var_1 );

            if ( isdefined( var_1 ) && _func_1AD( var_1 ) && isdefined( var_6 ) )
                var_1 thread maps\mp\gametypes\_weapons::_id_1D0E( var_6, var_2 );

            if ( var_2 victimcanupdatefinalattackerdata( var_1 ) )
            {
                var_2._id_0E33 = undefined;

                if ( isdefined( var_1 ) && _func_1AD( var_1 ) && isdefined( var_6 ) && var_1 != var_2 )
                    var_2._id_0E33 = var_1._id_02E2;

                if ( _func_120( var_5, "MOD_GRENADE" ) && isdefined( var_0 ) && isdefined( var_0._id_50E8 ) )
                    var_2._id_A1C2 = gettime();
                else
                    var_2._id_A1C2 = undefined;

                if ( _func_120( var_5, "MOD_IMPACT" ) && isdefined( var_0 ) && isdefined( var_0._id_725E ) && var_0._id_725E )
                    var_2._id_A1D0 = 1;
                else
                    var_2._id_A1D0 = 0;
            }

            var_2._id_5591 = isdefined( var_1 ) && var_1 != var_2;

            if ( var_2._id_5591 )
            {
                var_22 = gettime();
                var_1._id_259A[var_2._id_4450] = var_22;
                var_2._id_558F = var_22;
            }

            var_2 _id_379A( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
            var_2 thread maps\mp\gametypes\_misions::_id_6C82( var_0, var_1, var_3, var_5, var_6, var_9 );
        }

        if ( var_3 > 0 && var_5 != "MOD_FALLING" )
            var_2 _meth_82F8( "ui_damage_flash", 1 );

        if ( var_17 && isdefined( var_1._id_4473 ) )
            var_23 = var_1._id_4473;
        else
            var_23 = var_1;

        if ( isdefined( var_23 ) && ( var_23 != var_2 || maps\mp\_utility::_id_513D( var_6 ) ) && var_3 > 0 && ( !isdefined( var_9 ) || var_9 != "shield" ) )
        {
            if ( !maps\mp\_utility::_id_5189( var_2 ) )
                var_24 = "killshot";
            else if ( var_4 & level._id_4B61 )
                var_24 = "stun";
            else if ( isdefined( var_2._id_348F ) && var_2._id_348F == 1 )
                var_24 = "hitmorehealth";
            else if ( var_2 maps\mp\_utility::_id_05CB( "specialty_armorvest" ) )
                var_24 = "hitmorehealth";
            else if ( _func_188( var_5 ) && var_2 maps\mp\_utility::_id_05CB( "specialty_blastshield2" ) )
                var_24 = "hitblastshield";
            else if ( isdefined( var_2._id_5714 ) && var_5 != "MOD_HEAD_SHOT" && !maps\mp\_utility::_id_510C( var_6, var_5, var_1 ) )
                var_24 = "hitlightarmor";
            else if ( var_2 maps\mp\_utility::_id_5131() )
                var_24 = "hitjuggernaut";
            else if ( !_id_84BD( var_6 ) )
                var_24 = "none";
            else if ( isdefined( var_2._id_348F ) && var_2._id_348F )
                var_24 = "hitjuggernaut";
            else
                var_24 = "standard";

            var_23 thread maps\mp\gametypes\_damagefeedback::_id_9B0C( var_24 );
        }

        maps\mp\gametypes\_gamelogic::_id_7F85( var_2, 1 );
    }

    if ( isdefined( var_1 ) && var_1 != var_2 && !var_18 )
        level._id_9C14 = 0;

    if ( var_2._id_03BC != "dead" )
    {
        var_25 = var_2 _meth_81B5();
        var_26 = var_2._id_02A7;
        var_27 = var_2._id_0308["team"];
        var_28 = var_2._id_4450;
        var_29 = "";

        if ( _func_1AD( var_1 ) )
        {
            var_30 = var_1 _meth_81B5();
            var_31 = var_1._id_4450;
            var_32 = var_1._id_02A7;
            var_29 = var_1._id_0308["team"];
        }
        else
        {
            var_30 = -1;
            var_31 = "";
            var_32 = "";
            var_29 = "world";
        }

        if ( _func_1AD( var_1 ) )
        {
            var_33 = var_1._id_02A7;
            var_34 = var_1._id_02E2;
            var_35 = var_1._id_56F7;
        }
        else
        {
            var_33 = "world";
            var_34 = var_2._id_02E2;
            var_35 = -1;
        }

        var_36 = gettime();

        if ( !_func_1FF( var_2 ) && isdefined( var_2._id_89E4 ) && isdefined( var_2._id_89E4._id_03DC ) )
        {
            var_37 = ( var_36 - var_2._id_89E4._id_03DC ) / 1000.0;

            if ( var_37 <= 3.0 && var_2._id_89E4._id_25AC == 0 )
            {
                if ( !isdefined( level._id_59E0 ) )
                    level._id_59E0 = [];

                if ( !isdefined( level._id_59E0["badSpawnDmgReceivedCount"] ) )
                    level._id_59E0["badSpawnDmgReceivedCount"] = 1;
                else
                    level._id_59E0["badSpawnDmgReceivedCount"]++;

                var_2._id_89E4._id_25AC = 1;

                if ( var_2._id_89E4._id_126D == 0 )
                {
                    if ( !isdefined( level._id_59E0["badSpawnByAnyMeansCount"] ) )
                        level._id_59E0["badSpawnByAnyMeansCount"] = 1;
                    else
                        level._id_59E0["badSpawnByAnyMeansCount"]++;

                    var_2._id_89E4._id_126D = 1;
                }
            }
        }
        else
            var_37 = -1;

        if ( isdefined( var_1 ) && isdefined( var_1._id_89E4 ) && isdefined( var_1._id_89E4._id_03DC ) && _func_1AD( var_1 ) )
        {
            var_38 = ( var_36 - var_1._id_89E4._id_03DC ) / 1000.0;

            if ( var_38 <= 3.0 && var_1._id_89E4._id_2596 == 0 )
            {
                if ( !isdefined( level._id_59E0 ) )
                    level._id_59E0 = [];

                if ( !isdefined( level._id_59E0["badSpawnDmgDealtCount"] ) )
                    level._id_59E0["badSpawnDmgDealtCount"] = 1;
                else
                    level._id_59E0["badSpawnDmgDealtCount"]++;

                var_1._id_89E4._id_2596 = 1;

                if ( var_1._id_89E4._id_126D == 0 )
                {
                    if ( !isdefined( level._id_59E0["badSpawnByAnyMeansCount"] ) )
                        level._id_59E0["badSpawnByAnyMeansCount"] = 1;
                    else
                        level._id_59E0["badSpawnByAnyMeansCount"]++;

                    var_1._id_89E4._id_126D = 1;
                }
            }
        }
        else
            var_38 = -1;

        if ( !_func_1FF( var_2 ) )
            _func_105( var_2._id_02E2, "script_mp_damage: player_name %s, player_angles %v, hit_loc %s, attacker_name %s, attacker_pos %v, damage %d, weapon %s, damage_type %s, gameTime %d, life_id %d, attacker_life_id %d, spawnToDamageReceivedTime %f, spawnToDamageDealtTime %f", var_2._id_02A7, var_2.angles, var_9, var_33, var_34, var_3, var_6, var_5, var_36, var_2._id_56F7, var_35, var_37, var_38 );

        _func_164( "D;" + var_28 + ";" + var_25 + ";" + var_27 + ";" + var_26 + ";" + var_31 + ";" + var_30 + ";" + var_29 + ";" + var_32 + ";" + var_6 + ";" + var_3 + ";" + var_5 + ";" + var_9 + "\\n" );
    }

    _id_4923( var_1, var_2, var_3, var_9, var_4 );

    if ( _func_1FF( self ) )
        self [[ maps\mp\agents\_agent_utility::_id_08A6( "on_damaged_finished" ) ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

    return "finished";
}

_id_84BD( var_0 )
{
    switch ( var_0 )
    {
        case "artillery_mp":
            return 0;
    }

    return 1;
}

_id_07CC( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_0._id_0E2C ) )
        var_0._id_0E2C = [];

    if ( !isdefined( var_0._id_0E2C[var_1._id_4450] ) )
    {
        var_0._id_0E34[var_1._id_4450] = var_1;
        var_0._id_0E2C[var_1._id_4450] = spawnstruct();
        var_0._id_0E2C[var_1._id_4450]._id_00FA = 0;
        var_0._id_0E2C[var_1._id_4450]._id_0E2D = var_1;
        var_0._id_0E2C[var_1._id_4450]._id_3822 = gettime();
    }

    if ( maps\mp\gametypes\_weapons::_id_5185( var_3 ) && !maps\mp\gametypes\_weapons::_id_51A7( var_3 ) )
        var_0._id_0E2C[var_1._id_4450]._id_5184 = 1;

    var_0._id_0E2C[var_1._id_4450]._id_00FA += var_4;
    var_0._id_0E2C[var_1._id_4450]._id_0513 = var_3;
    var_0._id_0E2C[var_1._id_4450]._id_9F44 = var_5;
    var_0._id_0E2C[var_1._id_4450]._id_9C68 = var_6;
    var_0._id_0E2C[var_1._id_4450]._id_83CE = var_7;
    var_0._id_0E2C[var_1._id_4450]._id_034B = var_8;
    var_0._id_0E2C[var_1._id_4450]._id_867C = var_9;
    var_0._id_0E2C[var_1._id_4450]._id_0E2D = var_1;
    var_0._id_0E2C[var_1._id_4450]._id_5606 = gettime();

    if ( isdefined( var_2 ) && !_func_1AD( var_2 ) && isdefined( var_2._id_0340 ) )
        var_0._id_0E2C[var_1._id_4450]._id_8AA5 = var_2._id_0340;
    else if ( isdefined( var_1 ) && _func_1AD( var_1 ) && var_1 _meth_830F() != "none" )
        var_0._id_0E2C[var_1._id_4450]._id_8AA5 = var_1 _meth_830F();
    else
        var_0._id_0E2C[var_1._id_4450]._id_8AA5 = undefined;

    if ( !isdefined( var_0._id_32AE ) )
        var_0._id_32AE = [];

    if ( _func_1AD( var_1 ) )
    {
        if ( !isdefined( var_0._id_32AE[var_1._id_4450] ) )
            var_0._id_32AE[var_1._id_4450] = 0;

        var_0._id_32AE[var_1._id_4450]++;
        var_0._id_55D8 = var_1._id_1F0F;
    }
}

_id_7445()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    _id_1EEC();
    wait 1.75;
    self._id_0E34 = [];
    self._id_0E2C = [];
}

_id_1EEC()
{
    self._id_32AE = [];
    self._id_2515 = 0;
}

_id_1EED()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3;

        if ( isdefined( self._id_32AE ) && self._id_32AE.size > 0 )
        {
            continue;
            continue;
        }

        self._id_2515 = 0;
    }
}

_id_19F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = _id_19F2( var_0, var_1, self, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_379A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = 0;

    if ( maps\mp\_utility::_id_51E3() && var_2 >= self._id_01E6 && !( var_3 & level._id_4B61 ) && !isdefined( self._id_4E3D ) && !self _meth_851F() )
        var_11 = 1;

    if ( isdefined( level._id_511D ) && level._id_511D )
        var_11 = 0;

    if ( var_11 || maps\mp\_utility::_id_5193() )
    {
        if ( !isdefined( var_7 ) )
            var_7 = ( 0, 0, 0 );

        if ( !isdefined( var_1 ) && !isdefined( var_0 ) )
        {
            var_1 = self;
            var_0 = var_1;
        }

        _id_6CD8( var_0, var_1, self, var_2, var_4, var_5, var_7, var_8, var_9, 0, 1, 0 );
    }
    else
    {
        if ( !_id_19EF( var_0, var_1, var_2 - var_2 * var_10, var_3, var_4, var_5, var_6, var_7, var_8, var_9 ) )
            return;

        if ( !_func_1A1( self ) )
            return;

        if ( _func_1AD( self ) )
        {
            var_12 = self _meth_8266( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

            if ( isdefined( var_12 ) )
                thread finishplayerdamage_impactfxwrapper( var_12[0], var_12[1], var_12[2], var_12[3], var_12[4], var_12[5], var_12[6] );
        }
    }

    if ( var_4 == "MOD_EXPLOSIVE_BULLET" )
        self _meth_8186( "damage_mp", getdvarfloat( "scr_csmode" ) );

    _id_25AE( var_0, var_5, var_4, var_2, var_3, var_1 );
}

finishplayerdamage_impactfxwrapper( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    waitframe;

    if ( !isdefined( self ) || !isdefined( var_0 ) )
        return;

    self _meth_8532( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_19F6( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = spawnstruct();
    var_9._id_3020 = var_0;
    var_9.attacker = var_1;
    var_9._id_4B54 = var_2;
    var_9._id_0E33 = var_1._id_02E2;

    if ( var_1 == self )
        var_9._id_867C = "MOD_SUICIDE";
    else
        var_9._id_867C = var_3;

    var_9._id_9024 = var_4;

    if ( isdefined( var_1 ) && _func_1AD( var_1 ) && var_1 _meth_830F() != "none" )
        var_9._id_8AA5 = var_1 _meth_830F();
    else
        var_9._id_8AA5 = undefined;

    var_9._id_9C68 = var_5;
    var_9._id_83CE = var_6;
    var_9._id_55F1 = gettime();
    var_10 = _id_5A5B( var_4, var_3, var_6 );

    if ( isdefined( self._id_315F ) )
        var_10 = 0;

    if ( level._id_2A55 )
    {
        if ( level._id_91ED[self._id_04A7] <= 1 )
            var_10 = 0;
        else if ( maps\mp\_utility::_id_51CC() )
        {
            var_10 = 0;
            maps\mp\_utility::_id_53B0( self._id_04A7 );
        }
    }

    if ( !var_10 )
    {
        self._id_55EC = var_9;
        self._id_9C06 = 1;
        maps\mp\_utility::_id_066F();
    }
    else
    {
        self._id_4E3C = 1;
        var_11 = spawnstruct();

        if ( maps\mp\_utility::_id_05CB( "specialty_finalstand" ) )
        {
            var_11._id_93A2 = game["strings"]["final_stand"];
            var_11._id_4B48 = level._id_8A3C;
        }
        else
        {
            var_11._id_93A2 = game["strings"]["last_stand"];
            var_11._id_4B48 = level._id_8A3C;
        }

        var_11._id_01BD = ( 1, 0, 0 );
        var_11._id_8899 = "mp_last_stand";
        var_11._id_0136 = 2.0;
        var_11._id_7454 = 1;
        self._id_01E6 = 1;
        thread maps\mp\gametypes\_hud_message::_id_622E( var_11 );

        if ( maps\mp\_utility::_id_05CB( "specialty_finalstand" ) )
        {
            self._id_55EC = var_9;
            self._id_4C5A = 1;
            var_12 = self _meth_82CD();

            foreach ( var_14 in var_12 )
                self _meth_830C( var_14 );

            common_scripts\utility::_id_0586();
            thread _id_3112();
            thread _id_55F2( 20, 1 );
        }
        else
        {
            if ( level._id_2A55 )
            {
                var_1 thread maps\mp\_events::_id_5361( self, var_4, var_3 );
                self._id_55EC = var_9;
                common_scripts\utility::_id_0587();
                thread _id_55F2( 20, 0 );
                common_scripts\utility::_id_0586();
                return;
            }

            self._id_55EC = var_9;
            self._id_9C06 = 1;
            var_16 = undefined;
            var_17 = self _meth_8309();

            foreach ( var_14 in var_17 )
            {
                if ( maps\mp\gametypes\_weapons::_id_51A7( var_14 ) )
                    var_16 = var_14;
            }

            handlelaststandweaponsmwr( var_16 );
            thread _id_55F2( 10, 0 );
        }
    }
}

handlelaststandweaponsmwr( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "h1_beretta_mp";

    var_1 = self _meth_812E() && !self _meth_82EB();
    var_2 = self _meth_812E() && self _meth_82EB();
    var_3 = self _meth_8308();

    foreach ( var_5 in var_3 )
    {
        if ( maps\mp\gametypes\_class::_id_51F2( var_5 ) && var_1 )
            continue;

        if ( maps\mp\gametypes\_class::_id_51EA( var_5 ) && var_2 )
            continue;

        self _meth_830C( var_5 );
    }

    maps\mp\gametypes\_hardpoints::giveownedhardpointitem();
    maps\mp\_utility::_id_05C0( var_0 );
    self _meth_832F( var_0 );
    self _meth_8312( var_0 );
    common_scripts\utility::_id_0586();
    self _meth_84BB();

    if ( var_2 )
        self _meth_82F3( "h1_fraggrenade_mp", 1 );
    else
        self _meth_831C();
}

_id_2A52( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    wait(var_0);
    self._id_9C06 = 1;
    maps\mp\_utility::_id_066F();
}

_id_29B2()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self waittill( "detonate" );
    self._id_9C06 = 1;
    _id_1970();
}

_id_29B1()
{
    self endon( "detonate" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_1970();
}

_id_1970()
{
    self _meth_809C( "detpack_explo_default" );
    self._id_1971 = playfx( level._id_196F, self._id_02E2 );
    _func_189( self._id_02E2, 312, 100, 100, self );

    if ( _func_1A1( self ) )
        maps\mp\_utility::_id_066F();
}

_id_3112()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_3A32( 1 );
    wait 0.3;
    maps\mp\_utility::_id_3A32( 0 );
}

handlelaststanddisconnect()
{
    if ( isdefined( self ) && maps\mp\_utility::_id_5092( self._id_4E3C ) && isdefined( self._id_55EC ) )
    {
        var_0 = self._id_55EC._id_3020;
        var_1 = self._id_55EC.attacker;
        var_2 = self._id_55EC._id_4B54;
        var_3 = self._id_55EC._id_867C;
        var_4 = self._id_55EC._id_9024;
        var_5 = self._id_55EC._id_8AA5;
        var_6 = self._id_55EC._id_9C68;
        var_7 = self._id_55EC._id_83CE;
        _id_6CD8( var_0, var_1, self, var_2, var_3, var_4, var_6, var_7, 0, 0, 0, 1 );
    }
}

_id_55F2( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "revive" );
    level endon( "game_ended" );
    level notify( "player_last_stand" );
    thread _id_55F6();
    self._id_0249 = 1;

    if ( !var_1 && ( !isdefined( self._id_4C14 ) || !self._id_4C14 ) )
    {
        thread _id_55E5();
        maps\mp\_utility::_id_7FA5( "last_stand", &"PLATFORM_COWARDS_WAY_OUT", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
        thread _id_55E9();
    }

    if ( level._id_2A55 == 1 && level._id_2A55 != 2 )
    {
        var_2 = spawn( "script_model", self._id_02E2 );
        var_2 _meth_80B3( "tag_origin" );
        var_2 _meth_80DC( "HINT_NOICON" );
        var_2 _meth_80DD( &"PLATFORM_REVIVE" );
        var_2 _id_74FE( self );
        var_2 endon( "death" );
        var_3 = _func_1AB( self._id_04A7 );
        var_3 _meth_80CE( "waypoint_revive", 8, 8 );
        var_3 _meth_80DA( 1, 1 );
        var_3 _meth_80CF( self );
        var_3 thread _id_28F1( var_2 );
        var_3.color = ( 0.33, 0.75, 0.24 );
        maps\mp\_utility::_id_6A3F();

        if ( var_1 )
        {
            wait(var_0);

            if ( self._id_4C5A )
                thread _id_55E7( var_1, var_2 );
        }

        return;
    }
    else if ( level._id_2A55 == 2 )
    {
        thread _id_55E9();
        var_2 = spawn( "script_model", self._id_02E2 );
        var_2 _meth_80B3( "tag_origin" );
        var_2 _meth_80DC( "HINT_NOICON" );
        var_2 _meth_80DD( &"PLATFORM_REVIVE" );
        var_2 _id_74FE( self );
        var_2 endon( "death" );
        var_3 = _func_1AB( self._id_04A7 );
        var_3 _meth_80CE( "waypoint_revive", 8, 8 );
        var_3 _meth_80DA( 1, 1 );
        var_3 _meth_80CF( self );
        var_3 thread _id_28F1( var_2 );
        var_3.color = ( 0.33, 0.75, 0.24 );
        maps\mp\_utility::_id_6A3F();

        if ( var_1 )
        {
            wait(var_0);

            if ( self._id_4C5A )
                thread _id_55E7( var_1, var_2 );
        }

        wait(var_0 / 3);
        var_3.color = ( 1, 0.64, 0 );

        while ( var_2._id_020D )
            wait 0.05;

        maps\mp\_utility::_id_6A3F();
        wait(var_0 / 3);
        var_3.color = ( 1, 0, 0 );

        while ( var_2._id_020D )
            wait 0.05;

        maps\mp\_utility::_id_6A3F();
        wait(var_0 / 3);

        while ( var_2._id_020D )
            wait 0.05;

        wait 0.05;
        thread _id_55E7( var_1 );
        return;
    }

    thread _id_55E9();
    wait(var_0);
    thread _id_55E7( var_1 );
}

_id_5A3B( var_0, var_1 )
{
    self endon( "stop_maxHealthOverlay" );
    self endon( "revive" );
    self endon( "death" );

    for (;;)
    {
        self._id_01E6 -= 1;
        self._id_0271 = var_0;
        wait 0.05;
        self._id_0271 = 50;
        self._id_01E6 += 1;
        wait 0.5;
    }
}

_id_55E7( var_0, var_1 )
{
    if ( var_0 )
    {
        self._id_0249 = undefined;
        self._id_4C5A = 0;
        self notify( "revive" );
        maps\mp\_utility::_id_1EF5( "last_stand" );
        maps\mp\gametypes\_playerlogic::_id_55ED();

        if ( isdefined( var_1 ) )
            var_1 delete();
    }
    else
    {
        self._id_9C06 = 1;
        self._id_13AB = 0;
        maps\mp\_utility::_id_066F();
    }
}

_id_55E5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "revive" );

    for (;;)
    {
        if ( self _meth_8339() )
        {
            var_0 = gettime();

            while ( self _meth_8339() )
            {
                wait 0.05;

                if ( gettime() - var_0 > 700 )
                    break;
            }

            if ( gettime() - var_0 > 700 )
                break;
        }

        wait 0.05;
    }

    thread _id_55E7( 0 );
}

_id_55E9()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "revive" );

    while ( !level._id_3BDA )
    {
        self._id_01E6 = 2;
        wait 0.05;
        self._id_01E6 = 1;
        wait 0.5;
    }

    self._id_01E6 = self._id_0271;
}

_id_55F6()
{
    self endon( "disconnect" );
    self endon( "revive" );
    level endon( "game_ended" );
    self waittill( "death" );
    maps\mp\_utility::_id_1EF5( "last_stand" );
    self._id_0249 = undefined;
}

_id_5A5B( var_0, var_1, var_2 )
{
    if ( var_1 == "MOD_TRIGGER_HURT" )
        return 0;

    if ( var_1 != "MOD_PISTOL_BULLET" && var_1 != "MOD_RIFLE_BULLET" && var_1 != "MOD_FALLING" && var_1 != "MOD_EXPLOSIVE_BULLET" )
        return 0;

    if ( var_1 == "MOD_IMPACT" && ( var_0 == "m79_mp" || _func_120( var_0, "gl_" ) ) )
        return 0;

    if ( maps\mp\_utility::_id_5117( var_0, var_2, var_1 ) )
        return 0;

    if ( maps\mp\_utility::_id_51E3() )
        return 0;

    return 1;
}

_id_32D4()
{
    if ( !isdefined( self._id_55EC.attacker ) )
        self._id_55EC.attacker = self;
}

_id_3FCB( var_0 )
{
    switch ( var_0 )
    {
        case "head":
        case "helmet":
        case "neck":
            return 60;
        case "torso_upper":
        case "right_arm_upper":
        case "left_arm_lower":
        case "left_hand":
        case "left_arm_upper":
        case "right_hand":
        case "right_arm_lower":
        case "gun":
            return 48;
        case "torso_lower":
            return 40;
        case "left_leg_upper":
        case "right_leg_upper":
            return 32;
        case "right_leg_lower":
        case "left_leg_lower":
            return 10;
        case "left_foot":
        case "right_foot":
            return 5;
    }

    return 48;
}

_id_3FCC( var_0 )
{
    switch ( var_0 )
    {
        case "helmet":
            return "j_neck";
        case "head":
            return "j_neck";
        case "neck":
            return "j_neck";
        case "torso_upper":
            return "j_neck";
        case "right_arm_upper":
            return "J_Shoulder_RI";
        case "left_arm_upper":
            return "J_Shoulder_LE";
        case "right_arm_lower":
            return "J_Elbow_RI";
        case "left_arm_lower":
            return "J_Elbow_LE";
        case "right_hand":
            return "J_Wrist_RI";
        case "left_hand":
            return "J_Wrist_LE";
        case "gun":
            return "J_Wrist_RI";
        case "torso_lower":
            return "J_SpineLower";
        case "right_leg_upper":
            return "J_Hip_RI";
        case "left_leg_upper":
            return "J_Hip_LE";
        case "right_leg_lower":
            return "J_Knee_RI";
        case "left_leg_lower":
            return "J_Knee_LE";
        case "right_foot":
            return "J_Ankle_RI";
        case "left_foot":
            return "J_Ankle_LE";
    }

    return undefined;
}

_id_27EE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0 ) )
    {
        var_6 = var_0 _meth_801B();

        if ( animhasnotetrack( var_6, "ignore_ragdoll" ) )
            return;
    }

    if ( isdefined( level._id_615A ) && level._id_615A.size )
    {
        foreach ( var_8 in level._id_615A )
        {
            if ( _func_0F0( var_0._id_02E2, var_8._id_02E2 ) < 65536 )
                return;
        }
    }

    if ( level.oldschool )
    {
        if ( !isdefined( var_2 ) )
            var_2 = ( 0, 0, 0 );

        var_10 = var_0._id_02E2 + ( 0, 0, _id_3FCB( var_1 ) );
        var_10 -= var_2 * 20;
        var_11 = 40;
        var_12 = 0.75;

        if ( var_5 == "MOD_IMPACT" || var_5 == "MOD_EXPLOSIVE" || _func_120( var_5, "MOD_GRENADE" ) || _func_120( var_5, "MOD_PROJECTILE" ) || var_1 == "head" || var_1 == "helmet" )
            var_12 = 2.5;

        var_0 _meth_8023( 1 );
        _func_17E( var_10, var_11, var_11 / 2, var_12 );
        return;
    }

    wait 0.2;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 _meth_81E3() )
        return;

    var_6 = var_0 _meth_801B();
    var_13 = 0.35;

    if ( animhasnotetrack( var_6, "start_ragdoll" ) )
    {
        var_14 = getnotetracktimes( var_6, "start_ragdoll" );

        if ( isdefined( var_14 ) )
            var_13 = var_14[0];
    }

    var_15 = var_13 * getanimlength( var_6 );
    wait(var_15);

    if ( isdefined( var_0 ) )
        var_0 _meth_8023();
}

_id_25AE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread maps\mp\gametypes\_weapons::_id_64FD( var_0, var_1, var_2, var_3, var_5 );
    var_6 = gettime();

    if ( !isdefined( self.lastdamagerumbletime ) || var_6 > self.lastdamagerumbletime )
    {
        self.lastdamagerumbletime = var_6;
        self _meth_80AF( "sniper_fire" );
    }
}

_id_74FE( var_0 )
{
    var_1 = var_0._id_04A7;
    self _meth_804F( var_0, "tag_origin" );
    self._id_02E5 = var_0;
    self._id_020D = 0;
    self _meth_80C1();
    _id_9B96( var_1 );
    thread _id_9514( var_1 );
    thread _id_7500( var_1 );
    thread _id_285C();
}

_id_285C()
{
    self endon( "death" );
    self._id_02E5 common_scripts\utility::_id_A069( "death", "disconnect" );
    self delete();
}

_id_9B96( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_0 == var_2._id_04A7 && var_2 != self._id_02E5 )
        {
            self _meth_800A( var_2 );
            continue;
        }

        self _meth_800B( var_2 );
    }
}

_id_9514( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "joined_team" );
        _id_9B96( var_0 );
    }
}

_id_9500( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "player_last_stand" );
        _id_9B96( var_0 );
    }
}

_id_7500( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        self._id_02E5._id_13AB = 1;

        if ( isdefined( var_1._id_13AB ) && var_1._id_13AB )
        {
            self._id_02E5._id_13AB = 0;
            continue;
        }

        self _meth_80C2();
        self._id_02E5 maps\mp\_utility::_id_3A32( 1 );
        var_2 = reviveholdthink( var_1 );
        self._id_02E5._id_13AB = 0;

        if ( !_func_1A1( self._id_02E5 ) )
        {
            self delete();
            return;
        }

        self._id_02E5 maps\mp\_utility::_id_3A32( 0 );

        if ( var_2 )
        {
            level thread maps\mp\gametypes\_rank::_id_1208( "reviver", var_1 );
            self._id_02E5._id_0249 = undefined;
            self._id_02E5 maps\mp\_utility::_id_1EF5( "last_stand" );
            self._id_02E5._id_5F7B = level._id_1317;

            if ( self._id_02E5 maps\mp\_utility::_id_05CB( "specialty_lightweight" ) )
                self._id_02E5._id_5F7B = maps\mp\_utility::_id_5761();

            self._id_02E5 common_scripts\utility::_id_0595();
            self._id_02E5._id_0271 = 100;
            self._id_02E5 maps\mp\gametypes\_weapons::_id_9B3D();
            self._id_02E5 maps\mp\gametypes\_playerlogic::_id_55ED();
            self._id_02E5 maps\mp\_utility::_id_41F8( "specialty_pistoldeath", 0 );
            self._id_02E5._id_13AB = 0;
            self delete();
            return;
        }

        self _meth_80C1();
        _id_9B96( var_0 );
    }
}

reviveholdthink( var_0, var_1, var_2 )
{
    var_3 = 3000;
    var_4 = spawn( "script_origin", self._id_02E2 );
    var_4 _meth_8056();
    var_0 _meth_807E( var_4 );
    var_0 _meth_8083();

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_2 )
        var_0 common_scripts\utility::_id_0587();

    self._id_24C9 = 0;
    self._id_020D = 1;
    self._id_9C10 = 0;

    if ( isdefined( var_1 ) )
        self._id_9C19 = var_1;
    else
        self._id_9C19 = var_3;

    if ( isdefined( level._id_511D ) && level._id_511D )
        var_0 thread personalusebaroldstyle( self );
    else
        var_0 thread _id_67E5( self );

    thread reviveholdthink_cleanup( var_0, var_2, var_4 );
    var_5 = reviveholdthinkloop( var_0 );
    self._id_020D = 0;
    var_4 delete();

    if ( isdefined( var_5 ) && var_5 )
    {
        self._id_02E5 thread maps\mp\gametypes\_hud_message::_id_6C6F( "revived", var_0 );
        self._id_02E5._id_4E3C = 0;
        return 1;
    }

    return 0;
}

reviveholdthink_cleanup( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_A06A( self, "death", var_2, "death" );

    if ( !_func_29C( var_2 ) )
        var_2 delete();

    if ( isdefined( var_0 ) && maps\mp\_utility::_id_5189( var_0 ) )
    {
        var_0 _meth_8051();

        if ( var_1 )
            var_0 common_scripts\utility::_id_0595();
    }
}

_id_67E5( var_0 )
{
    self _meth_82F8( "ui_use_bar_text", 3 );
    self _meth_82F8( "ui_use_bar_start_time", _func_0BC( gettime() ) );
    var_1 = undefined;

    if ( isdefined( var_0 ) && isdefined( var_0._id_02E5 ) )
    {
        var_1 = var_0._id_02E5;
        var_1 _meth_82F8( "ui_use_bar_text", 4 );
        var_1 _meth_82F8( "ui_use_bar_start_time", _func_0BC( gettime() ) );
    }

    var_2 = -1;

    while ( maps\mp\_utility::_id_5189( self ) && isdefined( var_0 ) && var_0._id_020D && !level._id_3BDA && isdefined( self ) )
    {
        if ( var_2 != var_0._id_9C10 )
        {
            if ( var_0._id_24C9 > var_0._id_9C19 )
                var_0._id_24C9 = var_0._id_9C19;

            if ( var_0._id_9C10 > 0 )
            {
                var_3 = gettime();
                var_4 = var_0._id_24C9 / var_0._id_9C19;
                var_5 = var_3 + ( 1 - var_4 ) * var_0._id_9C19 / var_0._id_9C10;
                self _meth_82F8( "ui_use_bar_end_time", _func_0BC( var_5 ) );

                if ( isdefined( var_1 ) )
                    var_1 _meth_82F8( "ui_use_bar_end_time", _func_0BC( var_5 ) );
            }

            var_2 = var_0._id_9C10;
        }

        wait 0.05;
    }

    if ( isdefined( self ) )
        self _meth_82F8( "ui_use_bar_end_time", 0 );

    if ( isdefined( var_1 ) )
        var_1 _meth_82F8( "ui_use_bar_end_time", 0 );
}

personalusebaroldstyle( var_0 )
{
    var_1 = maps\mp\gametypes\_hud_util::_id_2435();
    var_2 = maps\mp\gametypes\_hud_util::_id_2436();
    var_2 _meth_80CC( &"MPUI_REVIVING" );
    var_3 = var_0._id_02E5 maps\mp\gametypes\_hud_util::_id_2435();
    var_4 = var_0._id_02E5 maps\mp\gametypes\_hud_util::_id_2436();
    var_4 _meth_80CC( &"MPUI_BEING_REVIVED" );
    var_5 = -1;

    while ( maps\mp\_utility::_id_5189( self ) && isdefined( var_0 ) && var_0._id_020D && !level._id_3BDA && isdefined( self ) )
    {
        if ( var_5 != var_0._id_9C10 )
        {
            if ( var_0._id_24C9 > var_0._id_9C19 )
                var_0._id_24C9 = var_0._id_9C19;

            var_1 maps\mp\gametypes\_hud_util::_id_9AF7( var_0._id_24C9 / var_0._id_9C19, 1000 / var_0._id_9C19 * var_0._id_9C10 );
            var_3 maps\mp\gametypes\_hud_util::_id_9AF7( var_0._id_24C9 / var_0._id_9C19, 1000 / var_0._id_9C19 * var_0._id_9C10 );

            if ( !var_0._id_9C10 )
            {
                var_1 maps\mp\gametypes\_hud_util::_id_4871();
                var_2 maps\mp\gametypes\_hud_util::_id_4871();
                var_3 maps\mp\gametypes\_hud_util::_id_4871();
                var_4 maps\mp\gametypes\_hud_util::_id_4871();
            }
            else
            {
                var_1 maps\mp\gametypes\_hud_util::_id_850A();
                var_2 maps\mp\gametypes\_hud_util::_id_850A();
                var_3 maps\mp\gametypes\_hud_util::_id_850A();
                var_4 maps\mp\gametypes\_hud_util::_id_850A();
            }
        }

        var_5 = var_0._id_9C10;
        wait 0.05;
    }

    if ( isdefined( var_1 ) )
        var_1 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( var_2 ) )
        var_2 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( var_3 ) )
        var_3 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( var_4 ) )
        var_4 maps\mp\gametypes\_hud_util::_id_28E9();
}

reviveholdthinkloop( var_0 )
{
    level endon( "game_ended" );
    self._id_02E5 endon( "death" );
    self._id_02E5 endon( "disconnect" );

    while ( maps\mp\_utility::_id_5189( var_0 ) && var_0 _meth_8339() && self._id_24C9 < self._id_9C19 && !( isdefined( var_0._id_4E3C ) && var_0._id_4E3C ) )
    {
        self._id_24C9 += 50 * self._id_9C10;
        self._id_9C10 = 1;

        if ( self._id_24C9 >= self._id_9C19 )
        {
            self._id_020D = 0;
            return maps\mp\_utility::_id_5189( var_0 );
        }

        wait 0.05;
    }

    return 0;
}

_id_19EF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( self._id_5591 ) && self._id_5591 && var_2 >= self._id_01E6 && isdefined( self._id_20AB ) && self._id_20AB == "specialty_endgame" )
    {
        maps\mp\_utility::_id_41F8( "specialty_endgame", 0 );
        return 0;
    }

    return 1;
}

_id_3064( var_0 )
{
    _func_17E( self._id_02E2, 64, 64, 1 );
    var_1 = [];

    for ( var_2 = 0; var_2 < 360; var_2 += 30 )
    {
        var_3 = _func_0B7( var_2 ) * 16;
        var_4 = _func_0B6( var_2 ) * 16;
        var_5 = _func_06B( self._id_02E2 + ( var_3, var_4, 4 ), self._id_02E2 + ( var_3, var_4, -6 ), 1, self );

        if ( isdefined( var_5["entity"] ) && isdefined( var_5["entity"]._id_04A6 ) && ( var_5["entity"]._id_04A6 == "destructible_vehicle" || var_5["entity"]._id_04A6 == "destructible_toy" ) )
            var_1[var_1.size] = var_5["entity"];
    }

    if ( var_1.size )
    {
        var_6 = spawn( "script_origin", self._id_02E2 );
        var_6 _meth_8056();
        var_6._id_04D9 = "soft_landing";
        var_6._id_293A = var_1;
        _func_189( self._id_02E2, 64, 100, 100, var_6 );
        wait 0.1;
        var_6 delete();
    }
}

_id_0602( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0._id_04A7;

    foreach ( var_6 in level._id_0323 )
    {
        var_7 = var_6._id_04A7;

        if ( var_7 == "spectator" )
        {
            var_6 _meth_8269( &"MP_OBITUARY_NEUTRAL", var_1._id_02A7, var_0._id_02A7 );
            continue;
        }

        if ( var_7 == var_4 )
        {
            var_6 _meth_8269( &"MP_OBITUARY_ENEMY", var_1._id_02A7, var_0._id_02A7 );
            continue;
        }

        var_6 _meth_8269( &"MP_OBITUARY_FRIENDLY", var_1._id_02A7, var_0._id_02A7 );
    }
}

_id_584A( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = self _meth_81B5();
    var_8 = self._id_02A7;
    var_9 = self._id_04A7;
    var_10 = self._id_4450;

    if ( _func_1AD( var_1 ) )
    {
        var_11 = var_1._id_4450;
        var_12 = var_1._id_02A7;
        var_13 = var_1._id_04A7;
        var_14 = var_1 _meth_81B5();
        var_15 = var_1._id_0537 + "(" + var_12 + ")";
    }
    else
    {
        var_11 = "";
        var_12 = "";
        var_13 = "world";
        var_14 = -1;
        var_15 = "none";
    }

    _func_164( "K;" + var_10 + ";" + var_7 + ";" + var_9 + ";" + var_8 + ";" + var_11 + ";" + var_14 + ";" + var_13 + ";" + var_12 + ";" + var_4 + ";" + var_2 + ";" + var_3 + ";" + var_6 + "\\n" );
}

_id_28F1( var_0 )
{
    var_0 waittill( "death" );
    self _meth_808A();
}

_id_3BF6( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_1 ) && _func_1AD( var_1 ) && _func_1A1( var_1 ) )
    {
        if ( level._id_59E6 )
            var_2 *= level._id_59E6;

        if ( level._id_59EB )
            var_1._id_01E6 = _func_0BC( _func_0BF( _func_0BD( var_1._id_0271 ), _func_0BD( var_1._id_01E6 + 20 ) ) );
    }

    return var_2;
}

_id_7F65( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = "normal";

    if ( !isdefined( var_3 ) )
        var_3 = ::_id_5D4F;

    self _meth_82BC( 1 );

    if ( isdefined( self.classname ) && self.classname != "script_vehicle" )
        self _meth_8491( 1 );

    self._id_01E6 = 999999;
    self._id_0271 = var_0;
    self._id_0101 = 0;
    self._id_1485 = var_4;
    self._id_259D = var_1;
    self._id_258E = ::_id_6FF7;
    self._id_5D50 = var_3;
    self._id_646B = var_2;
    self._id_0E31 = [];
}

_id_6FF7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( self ) )
        return;

    if ( !( isdefined( level._id_511D ) && level._id_511D ) && !( isdefined( level.iszombiegame ) && level.iszombiegame ) && isdefined( var_1 ) && !maps\mp\_utility::_id_5112( var_1 ) )
        return;

    if ( isdefined( var_1 ) && !maps\mp\gametypes\_weapons::_id_3AA6( self._id_02E5, var_1 ) )
        return;

    var_1 _meth_80AF( "damage_light" );

    if ( isdefined( self._id_50EB ) && self._id_50EB )
        return;

    if ( isdefined( self._id_5146 ) && self._id_5146 )
        return;

    if ( isdefined( self._id_8EE1 ) && self._id_8EE1 )
        return;

    var_12 = var_2;

    if ( isdefined( var_5 ) )
    {
        var_13 = maps\mp\_utility::_id_8F5C( var_5, "_lefthand" );

        switch ( var_13 )
        {
            case "h1_smokegrenade_mp":
                return;
        }

        if ( isdefined( level._id_511D ) && level._id_511D )
            self.damageloc = var_11;

        var_12 = [[ self._id_5D50 ]]( var_1, var_5, var_4, var_2 );

        if ( isdefined( level._id_511D ) && level._id_511D )
            self.damageloc = undefined;
    }

    if ( var_12 < 0 )
        return 1;

    if ( isdefined( var_3 ) && var_3 & level._id_4B5C )
        self._id_A1C5 = 1;

    self._id_A1C3 = 1;
    self._id_0101 += var_12;
    maps\mp\gametypes\_hardpoints::_id_539C( var_1, var_5, self );

    if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
    {
        var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( self._id_259D );

        if ( _id_5159( var_1 ) )
            self._id_0E31[self._id_0E31.size] = var_1;
    }

    if ( self._id_0101 >= self._id_0271 )
    {
        if ( self._id_1485 && _func_1AD( var_1 ) )
            var_1 notify( "destroyed_killstreak", var_5 );

        if ( self.classname == "script_vehicle" || self.classname == "script_model" )
        {
            var_14 = maps\mp\_utility::_id_3F11( var_5 );

            if ( maps\mp\_utility::_id_514D( var_14 ) )
                var_14 = maps\mp\gametypes\_class::_id_3F10( var_14 );

            var_15 = maps\mp\gametypes\_misions::_id_3CE8( var_5, var_14 );
        }

        self._id_8EE1 = 1;
        self thread [[ self._id_646B ]]( var_1, var_5, var_4, var_2 );
    }
}

_id_5159( var_0 )
{
    foreach ( var_2 in self._id_0E31 )
    {
        if ( var_0 == var_2 )
            return 0;
    }

    return 1;
}

_id_5D4F( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3;
    var_4 = _id_4667( var_1, var_2, var_4 );
    var_4 = _id_4669( var_1, var_2, var_4 );
    var_4 = _id_4662( var_1, var_2, var_4 );
    var_4 = _id_4649( var_1, var_2, var_4, var_0 );
    return var_4;
}

_id_4669( var_0, var_1, var_2 )
{
    var_3 = var_2;

    switch ( var_0 )
    {
        case "bomb_site_mp":
        case "stinger_mp":
            self._id_54C0 = 1;
            var_3 = self._id_0271 + 1;
            break;
    }

    return var_3;
}

_id_4662( var_0, var_1, var_2 )
{
    var_3 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );

    if ( _func_188( var_1 ) )
    {
        switch ( var_3 )
        {
            case "h1_fraggrenade_mp":
                var_2 *= 4;
                break;
            default:
                if ( maps\mp\_utility::_id_51BA( var_0, "alt_" ) )
                    var_2 *= 3;

                break;
        }
    }

    return var_2;
}

_id_4667( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::_id_5150( var_1 ) )
    {
        var_3 = _func_0BC( self._id_0271 / 3 ) + 1;

        if ( var_3 > var_2 )
            return var_3;
    }

    return var_2;
}

_id_4649( var_0, var_1, var_2, var_3 )
{
    if ( var_1 == "MOD_RIFLE_BULLET" || var_1 == "MOD_PISTOL_BULLET" )
    {
        if ( var_3 maps\mp\_utility::_id_05CB( "specialty_armorpiercing" ) || maps\mp\_utility::_id_510C( var_0, var_1, var_3 ) )
            return var_2 * level._id_0CD2;
    }

    return var_2;
}

_id_64B6( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = undefined;

    if ( isdefined( var_0 ) && isdefined( self._id_02E5 ) )
    {
        if ( isdefined( var_0._id_02E5 ) && _func_1AD( var_0._id_02E5 ) )
            var_0 = var_0._id_02E5;

        if ( var_0 == self._id_02E5 )
            return;

        if ( _func_0D1( self._id_02E5 ) && _func_0D1( var_0 ) )
        {
            if ( !isalliedsentient( self._id_02E5, var_0 ) )
                var_8 = var_0;
        }
        else if ( level._id_91EB )
        {
            if ( self._id_02E5._id_04A7 != var_0._id_04A7 )
                var_8 = var_0;
        }
        else if ( self._id_02E5 != var_0 )
            var_8 = var_0;
    }

    if ( isdefined( var_8 ) )
    {
        var_8 notify( "destroyed_killstreak", var_1 );
        var_8 maps\mp\_utility::_id_4C2F( var_4, 1 );
        level thread maps\mp\gametypes\_rank::_id_1208( var_4, var_8, var_1, undefined, var_2 );

        if ( isdefined( var_6 ) )
            level thread maps\mp\_utility::_id_91FA( var_6, var_8 );

        if ( isdefined( var_7 ) && var_7 )
            level thread maps\mp\gametypes\_misions::_id_9D78( self._id_02E5, self, undefined, var_8, var_3, var_2, var_1 );
    }

    thread maps\mp\_events::_id_1D24( var_8 );

    if ( isdefined( self._id_02E5 ) && isdefined( var_5 ) )
        self._id_02E5 thread maps\mp\_utility::_id_5655( var_5, undefined, undefined, self._id_02E2 );
}

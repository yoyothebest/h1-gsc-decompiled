// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    game["round_end"]["draw"] = 1;
    game["round_end"]["round_draw"] = 2;
    game["round_end"]["round_win"] = 3;
    game["round_end"]["round_loss"] = 4;
    game["round_end"]["victory"] = 5;
    game["round_end"]["defeat"] = 6;
    game["round_end"]["halftime"] = 7;
    game["round_end"]["overtime"] = 8;
    game["round_end"]["roundend"] = 9;
    game["round_end"]["intermission"] = 10;
    game["round_end"]["side_switch"] = 11;
    game["round_end"]["match_bonus"] = 12;
    game["round_end"]["tie"] = 13;
    game["round_end"]["game_end"] = 14;
    game["round_end"]["spectator"] = 15;
    game["end_reason"]["score_limit_reached"] = 1;
    game["end_reason"]["time_limit_reached"] = 2;
    game["end_reason"]["players_forfeited"] = 3;
    game["end_reason"]["target_destroyed"] = 4;
    game["end_reason"]["bomb_defused"] = 5;
    game["end_reason"]["allies_eliminated"] = 6;
    game["end_reason"]["axis_eliminated"] = 7;
    game["end_reason"]["allies_forfeited"] = 8;
    game["end_reason"]["axis_forfeited"] = 9;
    game["end_reason"]["allies_mission_accomplished"] = 10;
    game["end_reason"]["axis_mission_accomplished"] = 11;
    game["end_reason"]["enemies_eliminated"] = 12;
    game["end_reason"]["tie"] = 13;
    game["end_reason"]["objective_completed"] = 14;
    game["end_reason"]["objective_failed"] = 15;
    game["end_reason"]["switching_sides"] = 16;
    game["end_reason"]["round_limit_reached"] = 17;
    game["end_reason"]["ended_game"] = 18;
    game["end_reason"]["host_ended_game"] = 19;
    game["end_reason"]["stat_loss_prevention"] = 20;
    game["end_reason"]["survivors_eliminated"] = 99;
    game["end_reason"]["zombies_completed"] = 99;
    game["end_reason"]["zombie_extraction_failed"] = 99;
    game["end_reason"]["survivors_eliminated"] = 99;
    game["end_reason"]["infected_eliminated"] = 99;
    game["end_reason"]["survivors_forfeited"] = 99;
    game["end_reason"]["infected_forfeited"] = 99;
    game["strings"]["overtime"] = &"MP_OVERTIME";
    level.lua_splash_type_none = 0;
    level.lua_splash_type_killstreak = 1;
    level.lua_splash_type_medal = 2;
    level.lua_splash_type_challenge = 3;
    level.lua_splash_type_rankup = 4;
    level.lua_splash_type_generic = 5;
    level thread _id_64C8();
    setdvar( "scr_lua_splashes", "1" );
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_58A7();
        var_0 thread _id_4DF5();
        var_0 thread manageluasplashtimers();
    }
}

_id_4909( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_6238 = var_0;
    _id_622E( var_1 );
}

_id_4DF5()
{
    if ( level._id_8A7C || self _meth_82CA() )
    {
        var_0 = 1.5;
        var_1 = 1.85;
        var_2 = 24;
        var_3 = "objective";
        var_4 = "TOP";
        var_5 = "BOTTOM";
        var_6 = 94;
        var_7 = 0;
    }
    else
    {
        var_0 = 2.5;
        var_1 = 1.35;
        var_2 = 30;
        var_3 = "objective";
        var_4 = "TOP";
        var_5 = "BOTTOM";
        var_6 = 94;
        var_7 = 0;
    }

    self._id_623A = maps\mp\gametypes\_hud_util::_id_2401( var_3, var_0 );
    self._id_623A maps\mp\gametypes\_hud_util::_id_7FEE( var_4, undefined, var_7, var_6 );
    self._id_623A._id_01ED = 1;
    self._id_623A.archived = 0;
    self._id_623A.alpha = 0;
    self._id_6238 = maps\mp\gametypes\_hud_util::_id_2401( var_3, var_1 );
    self._id_6238 maps\mp\gametypes\_hud_util::_id_7FDC( self._id_623A );
    self._id_6238 maps\mp\gametypes\_hud_util::_id_7FEE( var_4, var_5, 0, 0 );
    self._id_6238._id_01ED = 1;
    self._id_6238.archived = 0;
    self._id_6238.alpha = 0;
    self._id_6239 = maps\mp\gametypes\_hud_util::_id_2401( var_3, var_1 );
    self._id_6239 maps\mp\gametypes\_hud_util::_id_7FDC( self._id_623A );
    self._id_6239 maps\mp\gametypes\_hud_util::_id_7FEE( var_4, var_5, 0, 0 );
    self._id_6239._id_01ED = 1;
    self._id_6239.archived = 0;
    self._id_6239.alpha = 0;
    self._id_622D = maps\mp\gametypes\_hud_util::_id_2420( "white", var_2, var_2 );
    self._id_622D maps\mp\gametypes\_hud_util::_id_7FDC( self._id_6239 );
    self._id_622D maps\mp\gametypes\_hud_util::_id_7FEE( var_4, var_5, 0, 0 );
    self._id_622D._id_01ED = 1;
    self._id_622D.archived = 0;
    self._id_622D.alpha = 0;
    self._id_6233 = maps\mp\gametypes\_hud_util::_id_2420( "white", var_2, var_2 );
    self._id_6233 maps\mp\gametypes\_hud_util::_id_7FDC( self._id_622D );
    self._id_6233 maps\mp\gametypes\_hud_util::_id_7FEE( "CENTER", "CENTER", 0, 0 );
    self._id_6233._id_01ED = 1;
    self._id_6233.archived = 0;
    self._id_6233.alpha = 0;
    self._id_2CE9 = [];
    self._id_2CE9[0] = undefined;
    self._id_2CE9[1] = undefined;
    self._id_2CE9[2] = undefined;
    self._id_2CE9[3] = undefined;
    self._id_8A6B = [];
    self._id_8A6B[0] = [];
    self._id_8A6B[1] = [];
    self._id_8A6B[2] = [];
    self._id_8A6B[3] = [];
}

_id_63DB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6._id_93A2 = var_0;
    var_6._id_6238 = var_1;
    var_6._id_4B48 = var_2;
    var_6._id_01BD = var_3;
    var_6._id_8899 = var_4;
    var_6._id_0136 = var_5;
    _id_622E( var_6 );
}

_id_622E( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !isdefined( var_0._id_8631 ) )
        var_0._id_8631 = 0;

    var_1 = var_0._id_8631;

    if ( !isdefined( var_0._id_04D9 ) )
        var_0._id_04D9 = "";

    if ( !isdefined( self._id_2CE9[var_1] ) )
    {
        thread _id_8521( var_0 );
        return;
    }

    self._id_8A6B[var_1][self._id_8A6B[var_1].size] = var_0;
}

_id_2B40( var_0 )
{
    waitframe;
    var_1 = self._id_8A6B[var_0][0];

    if ( !isdefined( var_1 ) )
        return;

    for ( var_2 = 1; var_2 < self._id_8A6B[var_0].size; var_2++ )
        self._id_8A6B[var_0][var_2 - 1] = self._id_8A6B[var_0][var_2];

    self._id_8A6B[var_0][var_2 - 1] = undefined;

    if ( isdefined( var_1._id_02A7 ) )
        _id_06F0( var_1 );
    else
        _id_8521( var_1 );
}

_id_7018()
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "disconnect" );
    var_0 = spawnstruct();
    var_1 = "promotion";
    var_0._id_02A7 = var_1;
    var_0._id_04D9 = _func_1BB( _id_3E83(), 0, var_1, 11 );
    var_0._id_8899 = _func_1BB( _id_3E83(), 0, var_1, 9 );
    var_0._id_8631 = 0;
    thread _id_06F0( var_0 );
}

_id_8521( var_0 )
{
    self endon( "disconnect" );

    if ( maps\mp\_utility::_id_5092( var_0._id_7454 ) )
        self endon( "death" );

    var_1 = var_0._id_8631;

    if ( level._id_3BDA )
    {
        if ( isdefined( var_0._id_04D9 ) && var_0._id_04D9 == "rank" )
        {
            self _meth_82F9( "ui_promotion", 1 );
            self._id_6E8A = 1;
        }

        if ( self._id_8A6B[var_1].size )
            thread _id_2B40( var_1 );

        return;
    }

    self._id_2CE9[var_1] = var_0;

    if ( maps\mp\_utility::_id_5092( var_0._id_7454 ) )
        thread _id_7454();

    thread _id_7453();
    _id_A054( 0 );

    if ( isdefined( var_0._id_0136 ) )
        var_2 = var_0._id_0136;
    else if ( level._id_3BDA )
        var_2 = 2.0;
    else
        var_2 = 4.0;

    if ( isdefined( var_0._id_8899 ) )
        self _meth_82F1( var_0._id_8899 );

    if ( isdefined( var_0._id_565B ) )
        maps\mp\_utility::_id_5655( var_0._id_565B );

    var_3 = var_0._id_01BD;
    var_4 = self._id_623A;

    if ( isdefined( var_0._id_93A2 ) )
    {
        if ( isdefined( var_0._id_93A0 ) )
            self._id_623A._id_0241 = var_0._id_93A0;
        else
            self._id_623A._id_0241 = &"";

        if ( isdefined( var_0._id_93A0 ) && !isdefined( var_0._id_939F ) )
            self._id_623A _meth_80D9( var_0._id_93A2 );
        else
            self._id_623A _meth_80CC( var_0._id_93A2 );

        if ( isdefined( var_3 ) )
            self._id_623A._id_01BD = var_3;

        self._id_623A.alpha = 1;
        self._id_623A _meth_8086( var_2 * 1.25 );
        self._id_623A.alpha = 0;
    }

    if ( isdefined( var_0._id_92BC ) )
        var_3 = var_0._id_92BC;

    if ( isdefined( var_0._id_6238 ) )
    {
        if ( isdefined( var_0._id_92BF ) )
            self._id_6238._id_0241 = var_0._id_92BF;
        else
            self._id_6238._id_0241 = &"";

        if ( isdefined( var_0._id_92BF ) && !isdefined( var_0._id_92BE ) )
            self._id_6238 _meth_80D9( var_0._id_6238 );
        else
            self._id_6238 _meth_80CC( var_0._id_6238 );

        if ( isdefined( var_3 ) )
            self._id_6238._id_01BD = var_3;

        self._id_6238.alpha = 1;
        self._id_6238 _meth_8086( var_2 * 1.25 );
        self._id_6238.alpha = 0;
        var_4 = self._id_6238;
    }

    if ( isdefined( var_0._id_6239 ) )
    {
        self._id_6239 maps\mp\gametypes\_hud_util::_id_7FDC( var_4 );

        if ( isdefined( var_0._id_92BA ) )
            self._id_6239._id_0241 = var_0._id_92BA;
        else
            self._id_6239._id_0241 = &"";

        self._id_6239 _meth_80CC( var_0._id_6239 );

        if ( isdefined( var_3 ) )
            self._id_6239._id_01BD = var_3;

        self._id_6239.alpha = 1;
        self._id_6239 _meth_8086( var_2 * 1.25 );
        self._id_6239.alpha = 0;
        var_4 = self._id_6239;
    }

    if ( isdefined( var_0._id_4B48 ) )
    {
        self._id_622D maps\mp\gametypes\_hud_util::_id_7FDC( var_4 );

        if ( level._id_8A7C || self _meth_82CA() )
            self._id_622D _meth_80CE( var_0._id_4B48, 30, 30 );
        else
            self._id_622D _meth_80CE( var_0._id_4B48, 60, 60 );

        self._id_622D.alpha = 0;

        if ( isdefined( var_0._id_4B4C ) )
        {
            self._id_622D _meth_8086( 0.15 );
            self._id_622D.alpha = 1;
            var_0._id_65F7 = 0;
            self._id_6233 maps\mp\gametypes\_hud_util::_id_7FDC( self._id_622D );
            self._id_6233 maps\mp\gametypes\_hud_util::_id_7FEE( "CENTER", "CENTER", 0, var_0._id_65F7 );
            self._id_6233 _meth_80CE( var_0._id_4B4C, 511, 511 );
            self._id_6233.alpha = 0;
            self._id_6233.color = game["colors"]["orange"];
            self._id_6233 _meth_8086( 0.4 );
            self._id_6233.alpha = 0.85;
            self._id_6233 _meth_8087( 0.4, 32, 32 );
            _id_A054( var_2 );
            self._id_622D _meth_8086( 0.75 );
            self._id_622D.alpha = 0;
            self._id_6233 _meth_8086( 0.75 );
            self._id_6233.alpha = 0;
        }
        else
        {
            self._id_622D _meth_8086( 1.0 );
            self._id_622D.alpha = 1;
            _id_A054( var_2 );
            self._id_622D _meth_8086( 0.75 );
            self._id_622D.alpha = 0;
        }
    }
    else
        _id_A054( var_2 );

    self notify( "notifyMessageDone" );
    self._id_2CE9[var_1] = undefined;

    if ( self._id_8A6B[var_1].size )
        thread _id_2B40( var_1 );
}

_id_21C7( var_0, var_1 )
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( level._id_3BDA )
        return;

    var_2 = spawnstruct();
    var_2._id_02A7 = var_0;
    var_2._id_04D9 = _func_1BB( _id_3E83(), 0, var_0, 11 );
    var_2._id_6547 = 0;
    var_2._id_8899 = _func_1BB( _id_3E83(), 0, var_0, 9 );
    var_2._id_565B = var_1;
    var_2._id_8631 = 0;
    thread _id_06F0( var_2 );
}

_id_53A9( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( !isdefined( self ) )
        return;

    if ( level._id_3BDA )
        return;

    if ( isdefined( var_2 ) )
        var_0 += ( "_" + var_2 );

    if ( !isdefined( var_4 ) )
        var_4 = -1;

    if ( getdvarint( "scr_lua_splashes" ) )
    {
        var_5 = _func_1BF( "mp/splashTable.csv", 0, var_0 );

        if ( var_5 >= 0 )
        {
            self _meth_8561( &"killstreak_splash", 3, var_5, var_1, var_4 );
            self _meth_8579( &"killstreak_splash", 3, var_5, var_1, var_4 );
            insertluasplash( level.lua_splash_type_killstreak, var_5 );
        }

        return;
    }

    var_6 = spawnstruct();
    var_6._id_02A7 = var_0;
    var_6._id_04D9 = _func_1BB( _id_3E83(), 0, var_0, 11 );
    var_6._id_6547 = var_1;
    var_6._id_8899 = maps\mp\_utility::_id_3FF7( var_0 );
    var_6._id_565B = var_0;
    var_6._id_565C = "killstreak_earned";
    var_6._id_8631 = 0;
    var_6.killstreakslot = var_4;

    if ( isdefined( var_3 ) && _func_0CE( var_3 ) )
    {
        if ( var_3.size > 0 )
            var_6._id_5D54 = _func_1BF( level._id_53DC, level._id_53D9, var_3[0] );

        if ( var_3.size > 1 )
            var_6._id_5D55 = _func_1BF( level._id_53DC, level._id_53D9, var_3[1] );

        if ( var_3.size > 2 )
            var_6._id_5D56 = _func_1BF( level._id_53DC, level._id_53D9, var_3[2] );
    }

    thread _id_06F0( var_6 );
}

_id_1C64( var_0, var_1, var_2 )
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "disconnect" );
    waitframe;
    wait 0.05;

    for ( var_3 = var_2 - 1; var_3 >= var_1; var_3-- )
    {
        var_4 = maps\mp\gametypes\_hud_util::_id_1C4E( var_0, var_3 );

        if ( var_4 == 0 )
            var_4 = 1;

        if ( var_0 == "ch_longersprint_pro" || var_0 == "ch_longersprint_pro_daily" || var_0 == "ch_longersprint_pro_weekly" )
            var_4 = _func_0BC( var_4 / 528 );
        else if ( var_0 == "ch_exomech_frontier" )
            var_4 = _func_0BC( var_4 / 528 );

        if ( getdvarint( "scr_lua_splashes" ) )
        {
            var_5 = _func_1BB( "mp/allChallengesTable.csv", 0, var_0, 28 );

            if ( var_5 != "" )
            {
                var_6 = _func_0BC( var_5 );
                self _meth_8561( &"challenge_splash", 3, var_6, var_3, var_4 );
                self _meth_8579( &"challenge_splash", 3, var_6, var_3, var_4 );
                insertluasplash( level.lua_splash_type_challenge, var_6 );
            }

            continue;
        }

        var_7 = spawnstruct();
        var_7._id_02A7 = var_0;
        var_7._id_04D9 = _func_1BB( _id_3E83(), 0, var_0, 11 );
        var_7.challengetier = var_3;
        var_7._id_6547 = var_4;
        var_7._id_8899 = _func_1BB( _id_3E83(), 0, var_0, 9 );
        var_7._id_8631 = 0;
        thread _id_06F0( var_7 );
    }
}

medalsplashnotify( var_0 )
{
    if ( getdvarint( "scr_lua_splashes" ) )
    {
        var_1 = _func_1BF( "mp/splashTable.csv", 0, var_0 );

        if ( var_1 >= 0 )
        {
            self _meth_8561( &"medal_splash", 1, var_1 );
            self _meth_8579( &"medal_splash", 1, var_1 );
            insertluasplash( level.lua_splash_type_medal, var_1 );
            return;
        }
    }
    else
        _id_8A68( var_0 );
}

_id_8A68( var_0, var_1, var_2 )
{
    if ( !_func_1AD( self ) )
        return;

    if ( getdvarint( "scr_lua_splashes" ) )
    {
        var_3 = _func_1BF( "mp/splashTable.csv", 0, var_0 );

        if ( var_3 >= 0 )
        {
            if ( isdefined( var_1 ) )
            {
                self _meth_8561( &"generic_splash_number", 2, var_3, var_1 );
                self _meth_8562( &"generic_splash_number", 2, var_3, var_1 );
            }
            else
            {
                self _meth_8561( &"generic_splash", 1, var_3 );
                self _meth_8562( &"generic_splash", 1, var_3 );
            }

            insertluasplash( level.lua_splash_type_generic, var_3 );
        }

        return;
    }

    self endon( "disconnect" );
    wait 0.05;
    var_4 = spawnstruct();
    var_4._id_02A7 = var_0;
    var_4._id_04D9 = _func_1BB( _id_3E83(), 0, var_0, 11 );
    var_4._id_6547 = var_1;
    var_4._id_8899 = _func_1BB( _id_3E83(), 0, var_4._id_02A7, 9 );

    if ( !isdefined( var_2 ) )
        var_2 = -1;

    var_4.killstreakslot = var_2;
    var_4._id_8631 = 0;
    thread _id_06F0( var_4 );
}

_id_713B( var_0, var_1, var_2 )
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( !isdefined( self ) )
        return;

    if ( level._id_3BDA )
        return;

    if ( getdvarint( "scr_lua_splashes" ) )
    {
        var_3 = _func_1BF( "mp/splashTable.csv", 0, var_0 );

        if ( var_3 >= 0 )
        {
            self _meth_8561( &"rankup_splash", 3, var_3, var_1, var_2 );
            self _meth_8579( &"rankup_splash", 3, var_3, var_1, var_2 );
            insertluasplash( level.lua_splash_type_rankup, var_3 );
        }

        return;
    }

    var_4 = spawnstruct();
    var_4._id_02A7 = var_0;
    var_4._id_04D9 = _func_1BB( _id_3E83(), 0, var_0, 11 );
    var_4._id_8899 = _func_1BB( _id_3E83(), 0, var_0, 9 );
    var_4._id_0354 = var_1;
    var_4._id_032E = var_2;
    var_4._id_8631 = 0;
    thread _id_06F0( var_4 );
}

_id_6C6F( var_0, var_1, var_2 )
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( !isdefined( self ) )
        return;

    if ( level._id_3BDA )
        return;

    var_3 = spawnstruct();
    var_3._id_02A7 = var_0;
    var_3._id_04D9 = _func_1BB( _id_3E83(), 0, var_0, 11 );
    var_3._id_6547 = var_2;
    var_3._id_8899 = _func_1BB( _id_3E83(), 0, var_0, 9 );
    var_3._id_6C6E = var_1;
    var_3._id_8631 = 0;

    if ( var_3._id_04D9 == "playercard_splash" )
        var_3._id_8631 = 1;

    thread _id_06F0( var_3 );
}

_id_06F0( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 = var_0._id_8631;

    if ( !isdefined( var_0._id_04D9 ) )
        var_0._id_04D9 = "";

    if ( !isdefined( self._id_2CE9[var_1] ) )
    {
        thread _id_06F1( var_0 );
        return;
    }
    else
    {
        switch ( var_0._id_04D9 )
        {
            case "urgent_splash":
                self._id_6238.alpha = 0;
                self._id_6239.alpha = 0;
                self._id_622D.alpha = 0;
                self _meth_82F8( "ui_splash_idx", -1 );
                self _meth_82F8( "ui_splash_killstreak_mod_1", -1 );
                self _meth_82F8( "ui_splash_killstreak_mod_2", -1 );
                self _meth_82F8( "ui_splash_killstreak_mod_3", -1 );
                self _meth_82F8( "ui_splash_killstreak_idx", -1 );
                thread _id_06F1( var_0 );
                return;
            case "splash":
            case "killstreak_splash":
            case "killstreak_coop_splash":
                if ( self._id_2CE9[var_1]._id_04D9 != "splash" && self._id_2CE9[var_1]._id_04D9 != "urgent_splash" && self._id_2CE9[var_1]._id_04D9 != "killstreak_coop_splash" && self._id_2CE9[var_1]._id_04D9 != "killstreak_splash" && self._id_2CE9[var_1]._id_04D9 != "challenge_splash" && self._id_2CE9[var_1]._id_04D9 != "promotion_splash" && self._id_2CE9[var_1]._id_04D9 != "intel_splash" && self._id_2CE9[var_1]._id_04D9 != "rankup_splash" )
                {
                    self._id_6238.alpha = 0;
                    self._id_6239.alpha = 0;
                    self._id_622D.alpha = 0;
                    thread _id_06F1( var_0 );
                    return;
                }

                break;
        }
    }

    if ( var_0._id_04D9 == "challenge_splash" || var_0._id_04D9 == "killstreak_splash" || var_0._id_04D9 == "killstreak_coop_splash" )
    {
        for ( var_2 = self._id_8A6B[var_1].size; var_2 > 0; var_2-- )
            self._id_8A6B[var_1][var_2] = self._id_8A6B[var_1][var_2 - 1];

        self._id_8A6B[var_1][0] = var_0;
    }
    else
        self._id_8A6B[var_1][self._id_8A6B[var_1].size] = var_0;
}

_id_06F1( var_0 )
{
    self endon( "disconnect" );
    var_1 = var_0._id_8631;

    if ( level._id_3BDA )
    {
        if ( isdefined( var_0._id_04D9 ) && ( var_0._id_04D9 == "promotion_splash" || var_0._id_04D9 == "promotion_weapon_splash" ) )
        {
            self _meth_82F9( "ui_promotion", 1 );
            self._id_6E8A = 1;
        }
        else if ( isdefined( var_0._id_04D9 ) && var_0._id_04D9 == "challenge_splash" )
        {
            self._id_0308["postGameChallenges"]++;
            self _meth_82F9( "ui_challenge_" + self._id_0308["postGameChallenges"] + "_ref", var_0._id_02A7 );
        }

        if ( self._id_8A6B[var_1].size )
            thread _id_2B40( var_1 );

        return;
    }

    if ( _func_1BB( _id_3E83(), 0, var_0._id_02A7, 0 ) != "" )
    {
        var_2 = _func_1BF( _id_3E83(), 0, var_0._id_02A7 );
        var_3 = maps\mp\_utility::_id_8F5A( _func_1BC( _id_3E83(), var_2, 4 ) );

        switch ( var_0._id_04D9 )
        {
            case "killstreak_splash":
            case "killstreak_coop_splash":
                if ( isdefined( var_0.killstreakslot ) && !level._id_2153 )
                    self _meth_82F8( "ui_splash_killstreak_slot_idx", var_0.killstreakslot );

                self _meth_82F8( "ui_splash_killstreak_idx", var_2 );

                if ( isdefined( var_0._id_6C6E ) && var_0._id_6C6E != self )
                    self _meth_82F8( "ui_splash_killstreak_clientnum", var_0._id_6C6E _meth_81B5() );
                else
                    self _meth_82F8( "ui_splash_killstreak_clientnum", -1 );

                if ( isdefined( var_0._id_6547 ) )
                    self _meth_82F8( "ui_splash_killstreak_optional_number", var_0._id_6547 );
                else
                    self _meth_82F8( "ui_splash_killstreak_optional_number", 0 );

                if ( isdefined( var_0._id_5D54 ) )
                    self _meth_82F8( "ui_splash_killstreak_mod_1", var_0._id_5D54 );
                else
                    self _meth_82F8( "ui_splash_killstreak_mod_1", -1 );

                if ( isdefined( var_0._id_5D55 ) )
                    self _meth_82F8( "ui_splash_killstreak_mod_2", var_0._id_5D55 );
                else
                    self _meth_82F8( "ui_splash_killstreak_mod_2", -1 );

                if ( isdefined( var_0._id_5D56 ) )
                    self _meth_82F8( "ui_splash_killstreak_mod_3", var_0._id_5D56 );
                else
                    self _meth_82F8( "ui_splash_killstreak_mod_3", -1 );

                break;
            case "playercard_splash":
                if ( isdefined( var_0._id_6C6E ) )
                {
                    self _meth_82F8( "ui_splash_playercard_idx", var_2 );

                    if ( _func_1AD( var_0._id_6C6E ) )
                        self _meth_82F8( "ui_splash_playercard_clientnum", var_0._id_6C6E _meth_81B5() );

                    if ( isdefined( var_0._id_6547 ) )
                        self _meth_82F8( "ui_splash_playercard_optional_number", var_0._id_6547 );
                }

                break;
            case "splash":
            case "urgent_splash":
            case "intel_splash":
                self _meth_82F8( "ui_splash_idx", var_2 );

                if ( isdefined( var_0._id_6547 ) )
                    self _meth_82F8( "ui_splash_optional_number", var_0._id_6547 );

                break;
            case "rankup_splash":
                self _meth_82F8( "ui_rankup_splash_idx", var_2 );

                if ( isdefined( var_0._id_0354 ) )
                    self _meth_82F8( "ui_rank_splash_rank", var_0._id_0354 );

                if ( isdefined( var_0._id_032E ) )
                    self _meth_82F8( "ui_rank_splash_prestige", var_0._id_032E );

                break;
            case "challenge_splash":
            case "perk_challenge_splash":
                var_2 = _func_0BC( _func_1BB( "mp/allchallengestable.csv", 0, var_0._id_02A7, 28 ) );
                self _meth_82F8( "ui_challenge_splash_idx", var_2 );

                if ( isdefined( var_0.challengetier ) )
                    self _meth_82F8( "ui_challenge_splash_tier", var_0.challengetier );

                if ( isdefined( var_0._id_6547 ) )
                    self _meth_82F8( "ui_challenge_splash_optional_number", var_0._id_6547 );

                break;
            default:
                break;
        }

        self._id_2CE9[var_1] = var_0;

        if ( isdefined( var_0._id_8899 ) && var_0._id_8899 != "" )
            self _meth_82F1( var_0._id_8899 );

        if ( isdefined( var_0._id_565B ) )
        {
            if ( isdefined( var_0._id_565C ) )
                maps\mp\_utility::_id_5655( var_0._id_565B, var_0._id_565C, 1 );
            else
                maps\mp\_utility::_id_5655( var_0._id_565B );
        }

        self notify( "actionNotifyMessage" + var_1 );
        self endon( "actionNotifyMessage" + var_1 );
        wait(var_3 + 0.5);
        self._id_2CE9[var_1] = undefined;
    }

    if ( self._id_8A6B[var_1].size )
        thread _id_2B40( var_1 );
}

_id_A054( var_0 )
{
    var_1 = 0.05;

    while ( !_id_1ADA() )
        wait(var_1);

    while ( var_0 > 0 )
    {
        wait(var_1);

        if ( _id_1ADA() )
            var_0 -= var_1;
    }
}

_id_1ADA()
{
    if ( maps\mp\_flashgrenades::_id_5107() )
        return 0;

    return 1;
}

_id_7454()
{
    self endon( "notifyMessageDone" );
    self endon( "disconnect" );
    self waittill( "death" );
    _id_7452();
}

_id_7453()
{
    self notify( "resetOnCancel" );
    self endon( "resetOnCancel" );
    self endon( "notifyMessageDone" );
    self endon( "disconnect" );
    level waittill( "cancel_notify" );
    _id_7452();
}

_id_7452()
{
    self._id_623A _meth_8086( 0.05 );
    self._id_623A.alpha = 0;
    self._id_6238.alpha = 0;
    self._id_622D.alpha = 0;
    self._id_6233.alpha = 0;
    self._id_2CE9[0] = undefined;
    self._id_2CE9[1] = undefined;
    self._id_2CE9[2] = undefined;
    self._id_2CE9[3] = undefined;
}

_id_58A7()
{
    self endon( "disconnect" );
    self._id_58A6 = [];
    var_0 = "objective";

    if ( isdefined( level._id_58A5 ) )
        var_0 = level._id_58A5;

    var_1 = -140;
    var_2 = level._id_58A8;
    var_3 = 1.25;

    if ( level._id_8A7C || self _meth_82CA() && !_func_0CF( self ) )
    {
        var_2 = level._id_58A8 * 1.4;
        var_3 *= 1.5;
    }

    self._id_58A4 = maps\mp\gametypes\_hud_util::_id_2401( var_0, var_2 );
    self._id_58A4 _meth_80CC( "" );
    self._id_58A4.archived = 0;
    self._id_58A4._id_03D4 = 10;
    self._id_58A4._id_03C3 = 0;
    self._id_58A4 maps\mp\gametypes\_hud_util::_id_7FEE( "CENTER", level._id_58AA, 0, var_1 );
    self._id_58AB = maps\mp\gametypes\_hud_util::_id_2401( "default", var_3 );
    self._id_58AB maps\mp\gametypes\_hud_util::_id_7FDC( self._id_58A4 );
    self._id_58AB maps\mp\gametypes\_hud_util::_id_7FEE( "TOP", "BOTTOM", 0, 0 );
    self._id_58AB _meth_80CC( "" );
    self._id_58AB.archived = 0;
    self._id_58AB._id_03D4 = 10;
    self._id_58AB._id_03C3 = 0;
}

_id_65B6( var_0 )
{
    if ( level._id_91EB )
    {
        if ( var_0 == "tie" )
            _id_59E4( "draw" );
        else if ( var_0 == self._id_04A7 )
            _id_59E4( "victory" );
        else
            _id_59E4( "defeat" );
    }
    else if ( var_0 == self )
        _id_59E4( "victory" );
    else
        _id_59E4( "defeat" );
}

_id_59E4( var_0 )
{
    var_1 = self._id_04A7;
    var_2 = maps\mp\gametypes\_hud_util::_id_2401( "bigfixed", 1.0 );
    var_2 maps\mp\gametypes\_hud_util::_id_7FEE( "TOP", undefined, 0, 50 );
    var_2._id_0198 = 1;
    var_2._id_01BC = 1;
    var_2._id_01ED = 0;
    var_2.archived = 0;
    var_2 _meth_80CC( game["strings"][var_0] );
    var_2.alpha = 0;
    var_2 _meth_8086( 0.5 );
    var_2.alpha = 1;

    switch ( var_0 )
    {
        case "victory":
            var_2._id_01BD = game["colors"]["cyan"];
            break;
        default:
            var_2._id_01BD = game["colors"]["orange"];
            break;
    }

    var_3 = maps\mp\gametypes\_hud_util::_id_2420( game["icons"][var_1], 64, 64 );
    var_3 maps\mp\gametypes\_hud_util::_id_7FDC( var_2 );
    var_3 maps\mp\gametypes\_hud_util::_id_7FEE( "TOP", "BOTTOM", 0, 30 );
    var_3._id_0198 = 1;
    var_3._id_01ED = 0;
    var_3.archived = 0;
    var_3.alpha = 0;
    var_3 _meth_8086( 0.5 );
    var_3.alpha = 1;
    wait 3.0;
    var_2 maps\mp\gametypes\_hud_util::_id_28E9();
    var_3 maps\mp\gametypes\_hud_util::_id_28E9();
}

_id_50F5()
{
    if ( isdefined( self._id_2CE9 ) )
    {
        if ( isdefined( self._id_2CE9[0] ) )
            return 1;

        if ( isdefined( self._id_2CE9[1] ) )
            return 1;

        if ( isdefined( self._id_2CE9[2] ) )
            return 1;

        if ( isdefined( self._id_2CE9[3] ) )
            return 1;
    }

    if ( isdoingluasplash() )
        return 1;

    return 0;
}

_id_91F9( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    self notify( "reset_outcome" );
    thread _id_56B5( 32, 1 );
    wait 0.5;
    var_4 = self._id_0308["team"];

    if ( !isdefined( var_4 ) || var_4 != "allies" && var_4 != "axis" )
        var_4 = "allies";

    while ( _id_50F5() )
        wait 0.05;

    self endon( "reset_outcome" );
    var_5 = 0;

    if ( level._id_01B3 == "ctf" && isdefined( var_3 ) && var_3 )
        var_5 = 1;

    if ( var_0 == "halftime" )
    {
        self _meth_82F8( "ui_round_end_title", game["round_end"]["halftime"] );
        var_0 = "allies";

        if ( level._id_01B3 == "ctf" )
            var_5 = 1;
    }
    else if ( var_0 == "intermission" )
    {
        self _meth_82F8( "ui_round_end_title", game["round_end"]["intermission"] );
        var_0 = "allies";
    }
    else if ( var_0 == "roundend" )
    {
        self _meth_82F8( "ui_round_end_title", game["round_end"]["roundend"] );
        var_0 = "allies";
    }
    else if ( maps\mp\_utility::_id_516C( var_0 ) )
    {
        self _meth_82F8( "ui_round_end_title", game["round_end"]["overtime"] );

        if ( level._id_01B3 == "ctf" && var_0 == "overtime" )
            var_5 = 1;

        var_0 = "allies";
    }
    else if ( var_0 == "tie" )
    {
        if ( var_1 )
            self _meth_82F8( "ui_round_end_title", game["round_end"]["round_draw"] );
        else
            self _meth_82F8( "ui_round_end_title", game["round_end"]["draw"] );

        var_0 = "allies";
    }
    else if ( self _meth_842D() )
        self _meth_82F8( "ui_round_end_title", game["round_end"]["spectator"] );
    else if ( isdefined( self._id_0308["team"] ) && var_0 == var_4 )
    {
        if ( var_1 )
            self _meth_82F8( "ui_round_end_title", game["round_end"]["round_win"] );
        else
            self _meth_82F8( "ui_round_end_title", game["round_end"]["victory"] );
    }
    else if ( var_1 )
        self _meth_82F8( "ui_round_end_title", game["round_end"]["round_loss"] );
    else
        self _meth_82F8( "ui_round_end_title", game["round_end"]["defeat"] );

    self _meth_82F8( "ui_round_end_reason", var_2 );

    if ( var_5 && !level._id_A32B )
    {
        self _meth_82F8( "ui_round_end_friendly_score", game["roundsWon"][var_4] );
        self _meth_82F8( "ui_round_end_enemy_score", game["roundsWon"][level._id_65B3[var_4]] );
    }
    else if ( !maps\mp\_utility::_id_5194() || !maps\mp\_utility::_id_5160() )
    {
        self _meth_82F8( "ui_round_end_friendly_score", maps\mp\gametypes\_gamescores::_id_05BD( var_4 ) );
        self _meth_82F8( "ui_round_end_enemy_score", maps\mp\gametypes\_gamescores::_id_05BD( level._id_65B3[var_4] ) );
    }
    else
    {
        self _meth_82F8( "ui_round_end_friendly_score", game["roundsWon"][var_4] );
        self _meth_82F8( "ui_round_end_enemy_score", game["roundsWon"][level._id_65B3[var_4]] );
    }

    if ( isdefined( self._id_59DF ) )
        self _meth_82F8( "ui_round_end_match_bonus", self._id_59DF );

    if ( isdefined( game["round_time_to_beat"] ) )
        self _meth_82F8( "ui_round_end_stopwatch", _func_0BC( game["round_time_to_beat"] * 60 ) );

    self _meth_82F8( "ui_round_end", 1 );
}

_id_65B5( var_0, var_1 )
{
    self endon( "disconnect" );
    self notify( "reset_outcome" );

    while ( _id_50F5() )
        wait 0.05;

    self endon( "reset_outcome" );
    var_2 = level._id_6861["all"];
    var_3 = var_2[0];
    var_4 = var_2[1];
    var_5 = var_2[2];
    var_6 = 0;

    if ( isdefined( var_3 ) && self._id_038D == var_3._id_038D && self._id_010D == var_3._id_010D )
    {
        if ( self != var_3 )
            var_6 = 1;
        else if ( isdefined( var_4 ) && var_4._id_038D == var_3._id_038D && var_4._id_010D == var_3._id_010D )
            var_6 = 1;
    }

    if ( var_6 )
        self _meth_82F8( "ui_round_end_title", game["round_end"]["tie"] );
    else if ( isdefined( var_3 ) && self == var_3 )
        self _meth_82F8( "ui_round_end_title", game["round_end"]["victory"] );
    else
        self _meth_82F8( "ui_round_end_title", game["round_end"]["defeat"] );

    self _meth_82F8( "ui_round_end_reason", var_1 );

    if ( isdefined( self._id_59DF ) )
        self _meth_82F8( "ui_round_end_match_bonus", self._id_59DF );

    self _meth_82F8( "ui_round_end", 1 );
    self waittill( "update_outcome" );
}

_id_1AEA( var_0 )
{

}

_id_56B5( var_0, var_1 )
{
    self _meth_82D6( var_0, var_1 );
}

_id_3E83()
{
    return "mp/splashTable.csv";
}

isdoingluasplash()
{
    return maps\mp\_utility::_id_5092( self.luasplashactive );
}

manageluasplashtimers()
{
    self endon( "disconnect" );
    self.luasplashactive = 0;
    self.luasplashqueue = [];
    self.luasplashcurrenttype = level.lua_splash_type_none;
    self.luasplashnextintrocompletetime = 0;
    self.luasplashnextoutrocompletetime = 0;

    for (;;)
    {
        if ( !self.luasplashqueue.size )
            self waittill( "luaSplashTimerUpdate" );

        if ( !self.luasplashqueue.size )
            continue;

        var_0 = self.luasplashqueue[0];
        self.luasplashqueue = maps\mp\_utility::_id_0CFA( self.luasplashqueue, 0 );
        self.luasplashcurrenttype = var_0.splashtype;

        if ( var_0.splashtype == level.lua_splash_type_killstreak )
        {
            var_1 = _func_0BC( 1000.0 * _func_0BD( _func_1BC( "mp/splashTable.csv", var_0.splashdata, 4 ) ) );

            if ( !var_1 )
                continue;

            self.luasplashnextintrocompletetime = gettime() + var_1;
            self.luasplashnextoutrocompletetime = gettime() + var_1;
        }
        else if ( var_0.splashtype == level.lua_splash_type_medal )
        {
            var_1 = _func_0BC( 1000.0 * _func_0BD( _func_1BC( "mp/splashTable.csv", var_0.splashdata, 4 ) ) );

            if ( !var_1 )
                continue;

            self.luasplashnextintrocompletetime = gettime() + 250;
            self.luasplashnextoutrocompletetime = gettime() + var_1;
        }
        else if ( var_0.splashtype == level.lua_splash_type_challenge )
        {
            var_2 = _func_1BB( "mp/allchallengestable.csv", 28, var_0.splashdata, 0 );

            if ( var_2 == "" )
                continue;

            var_1 = _func_0BC( 1000.0 * _func_0BD( _func_1BB( "mp/splashTable.csv", 0, var_2, 4 ) ) );

            if ( !var_1 )
                continue;

            self.luasplashnextintrocompletetime = gettime() + var_1;
            self.luasplashnextoutrocompletetime = gettime() + var_1;
        }
        else if ( var_0.splashtype == level.lua_splash_type_rankup )
        {
            var_1 = _func_0BC( 1000.0 * _func_0BD( _func_1BC( "mp/splashTable.csv", var_0.splashdata, 4 ) ) );

            if ( !var_1 )
                continue;

            self.luasplashnextintrocompletetime = gettime() + var_1;
            self.luasplashnextoutrocompletetime = gettime() + var_1;
        }
        else
        {
            var_1 = _func_0BC( 1000.0 * _func_0BD( _func_1BC( "mp/splashTable.csv", var_0.splashdata, 4 ) ) );

            if ( !var_1 )
                continue;

            self.luasplashnextintrocompletetime = gettime() + 250;
            self.luasplashnextoutrocompletetime = gettime() + var_1;
        }

        self.luasplashactive = 1;

        if ( gettime() < self.luasplashnextintrocompletetime )
        {
            var_3 = ( self.luasplashnextintrocompletetime - gettime() ) * 0.001;
            wait(var_3);
        }

        while ( gettime() < self.luasplashnextoutrocompletetime )
        {
            if ( self.luasplashqueue.size > 0 )
            {
                if ( self.luasplashcurrenttype == level.lua_splash_type_none || self.luasplashqueue[0].splashtype == self.luasplashcurrenttype )
                    break;
            }

            var_3 = ( self.luasplashnextoutrocompletetime - gettime() ) * 0.001;
            common_scripts\utility::_id_A0A0( "luaSplashTimerUpdate", var_3 );
        }

        self.luasplashactive = 0;
    }
}

insertluasplash( var_0, var_1 )
{
    if ( !isdefined( self.luasplashqueue ) )
        return;

    if ( var_0 == level.lua_splash_type_medal )
    {
        for ( var_2 = 0; var_2 < self.luasplashqueue.size; var_2++ )
        {
            if ( self.luasplashqueue[var_2].splashtype == var_0 && self.luasplashqueue[var_2].splashdata == var_1 )
                return;
        }
    }

    var_3 = spawnstruct();
    var_3.splashtype = var_0;
    var_3.splashdata = var_1;

    if ( var_0 == level.lua_splash_type_killstreak )
    {
        var_4 = undefined;

        for ( var_2 = 0; var_2 < self.luasplashqueue.size; var_2++ )
        {
            if ( self.luasplashqueue[var_2].splashtype != level.lua_splash_type_killstreak )
            {
                var_4 = var_2;
                break;
            }
        }

        if ( isdefined( var_4 ) )
        {
            self.luasplashqueue = common_scripts\utility::_id_0CED( self.luasplashqueue, var_3, var_4 );
            self notify( "luaSplashTimerUpdate" );
            return;
        }
    }

    self.luasplashqueue[self.luasplashqueue.size] = var_3;
    self notify( "luaSplashTimerUpdate" );
}

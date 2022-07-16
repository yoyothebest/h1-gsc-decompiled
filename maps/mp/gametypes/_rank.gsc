// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_A3AA = _id_4170();
    level.xpscalewithparty = getxpscalewithparty();
    level._id_A3A5 = [];
    level._id_713A = [];
    level._id_5A50 = _func_0BC( _func_1BB( "mp/rankTable.csv", 0, "maxrank", 1 ) );
    level.maxprestige = _func_0BC( _func_1BB( "mp/rankIconTable.csv", 0, "maxPrestige", 1 ) );
    level.maxrankformaxprestige = _func_0BC( _func_1BB( "mp/rankTable.csv", 0, "maxrankformaxprestige", 1 ) );

    if ( !isdefined( level.xpgamemodescale ) )
        level.xpgamemodescale = 1;

    var_0 = 0;

    for ( var_1 = _func_1BB( "mp/rankTable.csv", 0, var_0, 1 ); isdefined( var_1 ) && var_1 != ""; var_1 = _func_1BB( "mp/rankTable.csv", 0, var_0, 1 ) )
    {
        level._id_713A[var_0][1] = _func_1BB( "mp/rankTable.csv", 0, var_0, 1 );
        level._id_713A[var_0][2] = _func_1BB( "mp/rankTable.csv", 0, var_0, 2 );
        level._id_713A[var_0][3] = _func_1BB( "mp/rankTable.csv", 0, var_0, 3 );
        level._id_713A[var_0][7] = _func_1BB( "mp/rankTable.csv", 0, var_0, 7 );
        var_0++;
    }

    level.maxxp = _func_0BC( level._id_713A[level._id_5A50][7] );
    level.maxxponext = _func_0BC( level._id_713A[level._id_5A50][3] );
    maps\mp\gametypes\_misions::_id_1878();
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !_func_0CF( var_0 ) && var_0 maps\mp\_utility::_id_7139() )
        {
            var_1 = var_0 _id_409B();
            var_2 = var_0 maps\mp\gametypes\_persistence::_id_8D68( "experience" );

            if ( var_2 < 0 )
                var_2 = 0;

            var_3 = var_0 _meth_84FE() - var_2;
            var_4 = var_0 _meth_84FE();
        }
        else if ( _func_0CF( var_0 ) )
        {
            var_0 maps\mp\_utility::_id_7EA5();
            var_2 = var_0._id_0308["rankxp"];
            var_1 = var_0._id_0308["prestige"];
            var_3 = 0;
            var_4 = var_2;
        }
        else
        {
            var_1 = 0;
            var_2 = 0;
            var_3 = 0;
            var_4 = var_2;
        }

        var_0._id_0308["rankxp"] = var_2;
        var_0._id_0308["redeemedxp"] = var_3;
        var_0._id_0308["prestige"] = var_1;

        if ( !isdefined( var_0._id_0308["participation"] ) )
            var_0._id_0308["participation"] = 0;

        var_5 = _func_2EC( var_0 _id_4137(), var_1 );
        var_0._id_0308["rank"] = var_5;

        if ( _func_0CF( var_0 ) )
            var_0 maps\mp\_utility::set_rank_options_for_bot();

        var_0._id_A3AB = 0;
        var_0._id_6E8A = 0;
        var_0._id_357F[0] = 0;
        var_0 _meth_829D( var_5, var_1 );
        var_0 thread processprestigemasteryonspawn( var_1, var_2 );
        var_0 syncxpomnvars();

        if ( var_0._id_1F0F < level._id_5A42 )
        {
            _func_12F( "players", var_0._id_1F0F, "Prestige", var_1 );
            _func_12F( "players", var_0._id_1F0F, "rankAtStart", maps\mp\_utility::_id_1E28( var_0._id_0308["rank"] ) );
        }

        if ( !isdefined( var_0._id_0308["postGameChallenges"] ) )
            var_0 _meth_82FA( "ui_challenge_1_ref", "", "ui_challenge_2_ref", "", "ui_challenge_3_ref", "", "ui_challenge_4_ref", "", "ui_challenge_5_ref", "", "ui_challenge_6_ref", "", "ui_challenge_7_ref", "" );

        var_0 _meth_82F9( "ui_promotion", 0 );

        if ( !isdefined( var_0._id_0308["summary"] ) )
        {
            var_0._id_0308["summary"] = [];
            var_0._id_0308["summary"]["xp"] = 0;
            var_0._id_0308["summary"]["score"] = 0;
            var_0._id_0308["summary"]["challenge"] = 0;
            var_0._id_0308["summary"]["match"] = 0;
            var_0._id_0308["summary"]["misc"] = 0;
            var_0._id_0308["summary"]["entitlementXP"] = 0;
            var_0._id_0308["summary"]["clanWarsXP"] = 0;
            var_0._id_0308["summary"]["matchStartXp"] = var_4;
        }

        if ( getdvar( "virtualLobbyActive" ) != "1" )
        {
            var_0 _meth_82F9( "ui_opensummary", 0 );
            var_0 thread maps\mp\gametypes\_misions::_id_9AFE();
        }

        var_0 thread _id_64D6();
    }
}

processprestigemasteryonspawn( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = processprestigemastery( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        self waittill( "spawned_player" );
        maps\mp\_utility::_id_3BE1( "prematch_done" );
        thread maps\mp\gametypes\_hud_message::_id_8A68( var_2 );
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
        self waittill( "spawned_player" );
}

_id_4170()
{
    var_0 = getdvarint( "scr_xpscale" );

    if ( var_0 > 4 || var_0 < 0 )
        _func_16E( 0 );

    return var_0;
}

getxpscalewithparty()
{
    var_0 = getdvarint( "scr_xpscalewithparty" );

    if ( var_0 > 4 || var_0 < 0 )
        _func_16E( 0 );

    return var_0;
}

_id_518A( var_0 )
{
    if ( isdefined( level._id_A3A5[var_0] ) )
        return 1;
    else
        return 0;
}

_id_72FF( var_0, var_1, var_2, var_3 )
{
    level._id_A3A5[var_0]["value"] = var_1;
    level._id_A3A5[var_0]["allowPlayerScore"] = 0;
    level._id_A3A5[var_0]["playSplash"] = 0;

    if ( isdefined( var_2 ) && var_2 )
        level._id_A3A5[var_0]["allowPlayerScore"] = 1;

    if ( isdefined( var_3 ) && var_3 )
        level._id_A3A5[var_0]["playSplash"] = 1;
}

_id_0AAE( var_0 )
{
    return level._id_A3A5[var_0]["allowPlayerScore"];
}

_id_84A4( var_0 )
{
    return level._id_A3A5[var_0]["playSplash"];
}

_id_40C1( var_0 )
{
    var_1 = "scr_" + level._id_01B3 + "_score_" + var_0;

    if ( getdvar( var_1 ) != "" )
        return getdvarint( var_1 );

    return level._id_A3A5[var_0]["value"];
}

_id_40AF( var_0 )
{
    if ( var_0 > level._id_5A50 )
    {
        var_1 = var_0 - level._id_5A50;
        return level.maxxp + ( var_1 - 1 ) * level.maxxponext;
    }
    else
        return _func_0BC( level._id_713A[var_0][2] );
}

_id_40B0( var_0 )
{
    if ( var_0 > level._id_5A50 )
        return level.maxxponext;
    else
        return _func_0BC( level._id_713A[var_0][3] );
}

_id_40AE( var_0 )
{
    if ( var_0 > level._id_5A50 )
    {
        var_1 = var_0 - level._id_5A50;
        return level.maxxp + var_1 * level.maxxponext;
    }
    else
        return _func_0BC( level._id_713A[var_0][7] );
}

_id_40AC( var_0 )
{
    if ( var_0 > level._id_5A50 )
        return &"RANK_PARAGON_FULL";
    else
        return _func_1BD( "mp/rankTable.csv", 0, var_0, 16 );
}

_id_40AD( var_0 )
{
    if ( var_0 > level._id_5A50 )
        return var_0 + 1;
    else
        return _func_0BC( _func_1BB( "mp/rankTable.csv", 0, var_0, 13 ) );
}

_id_1208( var_0, var_1, var_2, var_3, var_4 )
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    if ( _id_84A4( var_0 ) )
        var_1 thread maps\mp\gametypes\_hud_message::medalsplashnotify( var_0 );

    var_1 _id_41FF( var_0, undefined, var_2, var_4, undefined, var_3 );

    if ( _id_0AAE( var_0 ) )
        var_1 maps\mp\gametypes\_gamescores::_id_41FC( var_0, var_1, var_3 );
}

_id_41FF( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( self._id_02E5 ) && !_func_1FE( self ) )
    {
        self._id_02E5 _id_41FF( var_0, var_1, var_2, var_3, var_4, var_5 );
        return;
    }

    if ( _func_0CF( self ) )
        return;

    if ( !_func_1AD( self ) )
        return;

    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( level._id_91EB && ( !level._id_91ED["allies"] || !level._id_91ED["axis"] ) && var_0 != "win" )
        return;

    if ( !level._id_91EB && level._id_91ED["allies"] + level._id_91ED["axis"] < 2 && var_0 != "win" )
        return;

    if ( isdefined( level._id_2B23 ) && level._id_2B23 )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = _id_40C1( var_0 );

    if ( var_1 == 0 )
        return;

    if ( var_1 > 0 && !isdefined( self._id_5895 ) )
    {
        self._id_5895 = 1;
        _func_2BA( self._id_0537 );
    }

    var_6 = var_1;
    var_7 = 0;

    switch ( var_0 )
    {
        case "challenge":
        case "tie":
        case "win":
        case "loss":
            break;
        default:
            if ( level._id_A3AA > 1 )
                var_6 = _func_0BC( var_6 * level._id_A3AA );

            if ( level.xpscalewithparty > 1 && maps\mp\_utility::_id_5092( self.inpartywithotherplayers ) )
                var_6 = _func_0BC( var_6 * level.xpscalewithparty );

            if ( level.xpgamemodescale > 1 )
                var_6 = _func_0BC( var_6 * level.xpgamemodescale );

            if ( self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "hasDoubleXPItem" ) )
                var_6 = _func_0BC( var_6 * 2 );

            if ( isdefined( level._id_626D ) && level._id_626D )
            {
                if ( level._id_91EB && level._id_6274._id_04A7 == self._id_04A7 )
                    var_6 *= level._id_6274._id_A3A9;
                else if ( !level._id_91EB && level._id_6274._id_0318 == self )
                    var_6 *= level._id_6274._id_A3A9;

                var_6 = _func_0BC( var_6 );
            }

            var_7 = self _meth_852E();
            break;
    }

    var_8 = _func_0BC( var_6 * var_7 );
    var_9 = _id_40B1();
    _id_4C31( var_6 + var_8 );

    if ( maps\mp\_utility::_id_7139() && _id_9B52( var_9 ) )
        thread _id_9B53();

    _id_9089();
    syncxpomnvars();
    var_10 = maps\mp\gametypes\_misions::_id_5205( var_4 );

    if ( var_10 )
        var_2 = self _meth_830E();

    if ( var_0 == "shield_damage" )
    {
        var_2 = self _meth_830E();
        var_3 = "MOD_MELEE";
    }

    self._id_0308["summary"]["clanWarsXP"] += var_8;
    self._id_0308["summary"]["xp"] += ( var_6 + var_8 );

    switch ( var_0 )
    {
        case "tie":
        case "win":
        case "loss":
            self._id_0308["summary"]["match"] += var_6;
            break;
        case "challenge":
            self._id_0308["summary"]["challenge"] += var_6;
            break;
        default:
            if ( _id_518A( var_0 ) )
                self._id_0308["summary"]["score"] += var_6;
            else
                self._id_0308["summary"]["misc"] += var_6;

            break;
    }
}

_id_9B52( var_0 )
{
    var_1 = _id_40A9();

    if ( var_1 == self._id_0308["rank"] )
        return 0;

    var_2 = self._id_0308["rank"];
    self._id_0308["rank"] = var_1;
    self _meth_829D( var_1 );
    return 1;
}

_id_9B53()
{
    self endon( "disconnect" );
    self notify( "update_rank" );
    self endon( "update_rank" );
    var_0 = self._id_0308["team"];

    if ( !isdefined( var_0 ) )
        return;

    if ( !maps\mp\_utility::_id_56D9( "game_over" ) )
        level common_scripts\utility::_id_A0A0( "game_over", 0.25 );

    var_1 = self._id_0308["rank"];
    var_2 = self._id_0308["prestige"];

    if ( ( var_1 + 1 ) % 50 == 0 )
    {
        var_3 = var_1 + 1;
        maps\mp\gametypes\_misions::_id_6FF6( "ch_" + var_3 + "_paragon" );
    }

    thread maps\mp\gametypes\_hud_message::_id_713B( "ranked_up", var_1, var_2 );

    if ( var_1 <= level._id_5A50 )
    {
        var_4 = level._id_713A[var_1][1];
        var_5 = _func_0BC( var_4[var_4.size - 1] );

        if ( var_5 > 1 )
            return;
    }

    var_6 = _id_40AC( var_1 );

    for ( var_7 = 0; var_7 < level._id_0323.size; var_7++ )
    {
        var_8 = level._id_0323[var_7];
        var_9 = var_8._id_0308["team"];

        if ( isdefined( var_9 ) && var_8 != self )
        {
            if ( var_9 == var_0 )
            {
                if ( var_1 > level._id_5A50 )
                {
                    var_8 _meth_8269( &"RANK_PLAYER_WAS_PROMOTED_N", self, var_6, var_1 + 1 );
                    continue;
                }

                var_8 _meth_8269( &"RANK_PLAYER_WAS_PROMOTED", self, var_6 );
            }
        }
    }
}

_id_A3A6( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( var_1 == 0 )
        return;

    self notify( "xpPointsPopup" );
    self endon( "xpPointsPopup" );
    var_2 = _func_1BF( "mp/xp_event_table.csv", 0, var_0 );

    if ( getdvarint( "scr_lua_score" ) )
    {
        if ( var_2 >= 0 )
        {
            self _meth_8561( &"score_event", 2, var_2, var_1 );
            self _meth_8579( &"score_event", 2, var_2, var_1 );
        }

        return;
    }

    self._id_A3AB += var_1;
    self _meth_82F8( "ui_points_popup", self._id_A3AB );

    if ( !isdefined( var_2 ) || isdefined( var_2 ) && var_2 == -1 )
    {

    }
    else
        self _meth_82F8( "ui_points_popup_event", var_2 );

    wait 1;
    self._id_A3AB = 0;
}

_id_40A9()
{
    var_0 = _id_4137();
    var_1 = self._id_0308["rank"];
    var_2 = _id_409B();

    if ( var_0 < _id_40AF( var_1 ) + _id_40B0( var_1 ) )
        return var_1;
    else
        return _func_2EC( var_0, var_2 );
}

_id_409B()
{
    if ( _func_0CF( self ) && isdefined( self._id_0308["prestige_fake"] ) )
        return self._id_0308["prestige_fake"];
    else
        return maps\mp\gametypes\_persistence::_id_8D68( "prestige" );
}

_id_40B1()
{
    if ( isdefined( self._id_0308["rankxp"] ) )
        return self._id_0308["rankxp"];
    else
        return 0;
}

_id_40B3()
{
    if ( isdefined( self._id_0308["redeemedxp"] ) )
        return self._id_0308["redeemedxp"];
    else
        return 0;
}

_id_4137()
{
    return _id_40B1() + _id_40B3();
}

_id_4C31( var_0 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_1 = _id_40B1();
    var_2 = self._id_0308["prestige"];
    var_3 = level._id_5A50;

    if ( var_2 >= level.maxprestige )
        var_3 = level.maxrankformaxprestige;

    var_4 = _id_40AE( var_3 ) - _id_40B3();
    var_5 = _func_0BC( _func_0BF( var_1, var_4 ) ) + var_0;

    if ( var_5 > var_4 )
        var_5 = var_4;

    self._id_0308["rankxp"] = var_5;
    var_6 = processprestigemastery( var_2, var_5 );

    if ( isdefined( var_6 ) )
        thread maps\mp\gametypes\_hud_message::_id_8A68( var_6 );
}

processprestigemastery( var_0, var_1 )
{
    var_2 = _id_40AE( level._id_5A50 ) - _id_40B3();
    var_3 = _id_40AE( level.maxrankformaxprestige - 1 ) - _id_40B3();

    if ( var_0 == level.maxprestige && var_1 >= var_3 && !isdefined( self._id_0308["prestigeMaster2"] ) )
    {
        var_4 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_prestige_max" );
        var_5 = var_4 >= 3;
        self._id_0308["prestigeMaster2"] = self _meth_853E();

        if ( isdefined( self._id_0308["prestigeMaster2"] ) && !var_5 )
            return "prestigeMaster2";
    }

    if ( var_0 == level.maxprestige && var_1 >= var_2 && !isdefined( self._id_0308["prestigeMaster"] ) )
    {
        var_4 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_prestige_max" );
        var_5 = var_4 >= 2;
        self._id_0308["prestigeMaster"] = self _meth_853E();

        if ( isdefined( self._id_0308["prestigeMaster"] ) && !var_5 )
            return "prestigeMaster";
    }

    return undefined;
}

syncxpomnvars()
{
    var_0 = self._id_0308["rankxp"];
    var_1 = self._id_0308["rank"];
    var_2 = self._id_0308["prestige"];
    var_3 = _id_40AF( var_1 );
    var_4 = _id_40AE( var_1 );
    var_5 = 0;

    if ( var_4 - var_3 > 0 )
    {
        var_5 = ( var_0 - var_3 ) / ( var_4 - var_3 );
        var_5 = _func_0E9( var_5, 0.0, 1.0 );
    }

    if ( var_2 == level.maxprestige && var_1 == level.maxrankformaxprestige )
        var_5 = 1.0;

    self _meth_82F8( "ui_player_xp_rank", var_1 );
    self _meth_82F8( "ui_player_xp_pct", var_5 );
    self _meth_82F8( "ui_player_xp_prestige", var_2 );
}

_id_9089()
{
    var_0 = _id_40B1();
    maps\mp\gametypes\_persistence::_id_8D78( "experience", var_0 );
}

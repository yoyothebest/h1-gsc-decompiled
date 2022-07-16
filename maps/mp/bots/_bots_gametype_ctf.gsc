// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    _id_805B();
}

_id_8072()
{
    level._id_161B["crate_can_use"] = ::_id_2363;
    level._id_161B["gametype_think"] = ::_id_15E6;
    level._id_161B["get_watch_node_chance"] = ::_id_15E5;
}

_id_805B()
{
    level._id_161F = ::_id_24AC;
    level._id_1622 = ::_id_24AD;
    level._id_161C = ::_id_3CC2;
    level._id_161D = ::_id_3CC3;
    level.bot_gametype_allowed_to_switch_to_defender = ::bot_ctf_can_switch_to_defender;
    level.bot_gametype_human_player_always_attacker = ::bot_ctf_player_always_attacker;
    maps\mp\bots\_bots_util::_id_172D();

    while ( !isdefined( level._id_91EF ) )
        wait 0.05;

    level._id_91EF["allies"]._id_0394 = "allies";
    level._id_91EF["axis"]._id_0394 = "axis";
    maps\mp\bots\_bots_gametype_common::_id_15BF( level._id_91EF, "flag_" );
    var_0 = _func_207( level._id_91EF["allies"]._id_02E2 );

    if ( isdefined( var_0 ) )
        _func_1F8( var_0, "allies" );

    var_0 = _func_207( level._id_91EF["axis"]._id_02E2 );

    if ( isdefined( var_0 ) )
        _func_1F8( var_0, "axis" );

    level._id_1B60["allies"]._id_6071 = level._id_91EF["allies"]._id_6071;
    level._id_1B60["axis"]._id_6071 = level._id_91EF["axis"]._id_6071;
    thread _id_15E4();
    level._id_1628 = 1;
}

_id_2363( var_0 )
{
    if ( _func_1FF( self ) && !isdefined( var_0._id_175D ) )
        return 0;

    if ( bot_ctf_player_has_flag() )
        return 0;

    return bot_ctf_flag_is_home_of_team( self._id_04A7 );
}

_id_15E6()
{
    self notify( "bot_ctf_think" );
    self endon( "bot_ctf_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self._id_60BA = 0;
    self _meth_834F( "separation", 0 );
    self _meth_834F( "use_obj_path_style", 1 );
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        wait 0.05;

        if ( self._id_01E6 <= 0 )
            continue;

        if ( !isdefined( self._id_759A ) )
            maps\mp\bots\_bots_gametype_common::_id_1627();

        if ( bot_ctf_flag_is_home_of_team( self._id_04A7 ) )
        {
            if ( isdefined( level.bot_known_flag_carrier_loc ) && isdefined( level.bot_known_flag_carrier_loc[level._id_65B3[self._id_04A7]] ) )
                level.bot_known_flag_carrier_loc[level._id_65B3[self._id_04A7]] = undefined;
        }

        var_2 = 0;

        if ( self._id_759A == "attacker" )
        {
            if ( bot_ctf_player_has_flag() )
                var_2 = 1;
            else if ( !bot_ctf_enemy_team_flag_is_picked_up() )
                var_2 = _func_0F0( self._id_02E2, level._id_91EF[level._id_65B3[self._id_04A7]]._id_24C8 ) < _func_0E8( _id_3D6F() );
        }
        else if ( !bot_ctf_flag_is_home_of_team( self._id_04A7 ) )
            var_2 = !bot_ctf_my_team_flag_is_picked_up();

        self _meth_834F( "force_sprint", var_2 );
        var_1 = 0;

        if ( bot_ctf_player_has_flag() )
        {
            if ( bot_ctf_flag_is_home_of_team( self._id_04A7 ) )
            {
                _id_1EAC();
                var_1 = 1;

                if ( !var_0 )
                {
                    var_0 = 1;
                    self _meth_8377( "scripted" );
                }

                self _meth_8352( level._id_1B60[self._id_04A7]._id_24C8, 16, "critical" );
            }
            else if ( maps\mp\bots\_bots_gametype_common::_id_1625( self._id_04A7 ) == 1 )
                bot_ctf_recover_flag();
            else if ( gettime() > self._id_60BA )
            {
                _id_1EAC();
                var_3 = _func_0C6( level._id_1B60[self._id_04A7]._id_24C8, 900, 0, 300 );
                var_4 = self _meth_8362( var_3, var_3.size * 0.15, "node_hide_anywhere" );

                if ( !isdefined( var_4 ) )
                    var_4 = level._id_1B60[self._id_04A7]._id_6071;

                var_5 = self _meth_8353( var_4, "critical" );

                if ( var_5 )
                    self._id_60BA = gettime() + 15000;
            }
        }
        else if ( self._id_759A == "attacker" )
        {
            if ( bot_ctf_enemy_team_flag_is_picked_up() )
            {
                if ( !maps\mp\bots\_bots_util::_id_1659() )
                {
                    _id_1EAC();
                    self _meth_8354();
                    var_6 = level._id_91EF[level._id_65B3[self._id_04A7]]._id_1BAF;
                    maps\mp\bots\_bots_strategy::_id_1646( var_6, 500 );
                }
            }
            else
            {
                _id_1EAC();

                if ( self _meth_835B() == "critical" )
                    self _meth_8354();

                self _meth_8352( level._id_91EF[level._id_65B3[self._id_04A7]]._id_24C8, 16, "objective", undefined, 300 );
            }
        }
        else if ( !bot_ctf_flag_is_home_of_team( self._id_04A7 ) )
            bot_ctf_recover_flag();
        else if ( !_id_5071() )
        {
            self _meth_8354();
            var_7["score_flags"] = "strict_los";
            var_7["entrance_points_index"] = "flag_" + level._id_91EF[self._id_04A7]._id_0394;
            var_7["nearest_node_to_center"] = level._id_91EF[self._id_04A7]._id_6071;
            maps\mp\bots\_bots_strategy::_id_16C2( level._id_91EF[self._id_04A7]._id_24C8, _id_3D6F(), var_7 );
        }

        if ( var_0 && !var_1 )
        {
            var_0 = 0;
            self _meth_8377( undefined );
        }
    }
}

bot_ctf_recover_flag()
{
    var_0 = undefined;
    var_1 = level._id_91EF[self._id_04A7];
    var_2 = var_1._id_1BAF;

    if ( !isdefined( var_2 ) )
        var_0 = var_1._id_24C8;
    else if ( self _meth_836D( var_2 ) )
    {
        var_0 = var_2._id_02E2;

        if ( self _meth_8379( "strategyLevel" ) > 0 && !bot_ctf_flag_is_home_of_team( self._id_04A7 ) )
        {
            if ( !isdefined( level.bot_known_flag_carrier_loc ) )
                level.bot_known_flag_carrier_loc = [];

            if ( !isdefined( level.bot_known_flag_carrier_loc[var_2._id_04A7] ) )
                level.bot_known_flag_carrier_loc[var_2._id_04A7] = [];

            level.bot_known_flag_carrier_loc[var_2._id_04A7]["origin"] = var_0;
            level.bot_known_flag_carrier_loc[var_2._id_04A7]["time"] = gettime();
        }
    }
    else if ( isdefined( var_1.curcarrierorigin ) )
    {
        if ( isdefined( var_1._id_20D0["friendly"] ) )
        {
            if ( var_1._id_630B )
                var_0 = var_1.curcarrierorigin;
            else
                var_0 = var_2._id_02E2;
        }
    }
    else
        var_0 = var_1._id_24C8;

    if ( isdefined( var_0 ) )
    {
        _id_1EAC();
        self _meth_8352( var_0, 16, "critical" );
    }
    else
    {
        var_3 = undefined;
        var_4 = undefined;

        if ( self _meth_8379( "strategyLevel" ) > 0 )
        {
            if ( isdefined( level.bot_known_flag_carrier_loc ) && isdefined( level.bot_known_flag_carrier_loc[var_2._id_04A7] ) )
            {
                var_4 = gettime() - level.bot_known_flag_carrier_loc[var_2._id_04A7]["time"];

                if ( var_4 < 10000 )
                    var_3 = level.bot_known_flag_carrier_loc[var_2._id_04A7]["origin"];
            }
        }

        if ( isdefined( var_3 ) )
        {
            if ( var_4 < 5000 )
            {
                _id_1EAC();
                self _meth_8352( var_3, 16, "critical" );
            }
            else if ( !maps\mp\bots\_bots_util::_id_1661() )
            {
                maps\mp\bots\_bots_strategy::_id_15EF();
                maps\mp\bots\_bots_strategy::_id_16AD( var_3, 400 );
            }
        }
        else
        {
            _id_1EAC();
            var_5 = self _meth_835B();

            if ( var_5 == "objective" || var_5 == "critical" )
                self _meth_8354();

            maps\mp\bots\_bots_personality::_id_9AD2();
        }
    }
}

_id_1EAC()
{
    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();
}

_id_5071()
{
    return maps\mp\bots\_bots_util::_id_1662();
}

_id_3D6F()
{
    if ( _func_1A1( self ) && !isdefined( level._id_703F ) )
    {
        var_0 = self _meth_835D();
        var_1 = ( var_0[0] + var_0[1] ) / 2;
        level._id_703F = _func_0BF( 800, var_1 / 5.5 );
    }

    if ( !isdefined( level._id_703F ) )
        return 900;

    return level._id_703F;
}

_id_24AC( var_0 )
{
    var_1 = maps\mp\bots\_bots_gametype_common::_id_1625( var_0 );

    if ( var_1 == 1 )
        return 1;

    if ( bot_ctf_flag_is_home_of_team( var_0 ) )
        var_2 = var_1 * 0.67;
    else if ( bot_ctf_flag_is_home_of_team( level._id_65B3[var_0] ) )
        var_2 = var_1 * 0.5;
    else
        var_2 = var_1 * 0.4;

    var_3 = _func_0BC( _func_0E4( var_2 ) );
    var_4 = game["teamScores"][var_0];
    var_5 = game["teamScores"][common_scripts\utility::_id_3D4F( var_0 )];

    if ( var_4 + 1 < var_5 )
        var_3 = _func_0BC( _func_0BF( var_3 + 1, var_1 ) );

    return var_3;
}

_id_24AD( var_0 )
{
    var_1 = maps\mp\bots\_bots_gametype_common::_id_1625( var_0 );
    return var_1 - _id_24AC( var_0 );
}

_id_3CC2( var_0 )
{
    return maps\mp\bots\_bots_gametype_common::_id_1623( var_0, level._id_1B60[var_0]._id_24C8, _id_3D6F() );
}

_id_3CC3( var_0 )
{
    return maps\mp\bots\_bots_gametype_common::_id_1624( var_0, level._id_1B60[var_0]._id_24C8, _id_3D6F() );
}

_id_15E4()
{
    level notify( "bot_ctf_ai_director_update" );
    level endon( "bot_ctf_ai_director_update" );
    level endon( "game_ended" );
    thread maps\mp\bots\_bots_gametype_common::_id_161E();
}

_id_15E5( var_0 )
{
    if ( var_0 == self._id_6122 )
        return 1.0;

    if ( !_id_5071() )
        return 1.0;

    var_1 = var_0 maps\mp\bots\_bots_util::_id_6126( "flag_allies", "flag_axis" );

    if ( var_1 )
        return 1.0;

    return 0.2;
}

bot_ctf_flag_is_home_of_team( var_0 )
{
    return level._id_91EF[var_0] maps\mp\gametypes\_gameobjects::_id_511C();
}

bot_ctf_flag_picked_up_of_team( var_0 )
{
    return isdefined( level._id_91EF[var_0]._id_1BAF );
}

bot_ctf_my_team_flag_is_picked_up()
{
    return bot_ctf_flag_picked_up_of_team( self._id_04A7 );
}

bot_ctf_enemy_team_flag_is_picked_up()
{
    return bot_ctf_flag_picked_up_of_team( level._id_65B3[self._id_04A7] );
}

bot_ctf_player_has_flag()
{
    return isdefined( self._id_1BB4 );
}

bot_ctf_can_switch_to_defender()
{
    if ( bot_ctf_player_has_flag() )
        return 0;

    return 1;
}

bot_ctf_player_always_attacker()
{
    if ( bot_ctf_player_has_flag() )
        return 1;

    return 0;
}

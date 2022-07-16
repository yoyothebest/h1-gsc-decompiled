// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_164F = 0;

    if ( level._id_00E3 )
        level._id_164F = 1;

    _id_8072();
    _id_805C();
    level thread maps\mp\bots\_bots_util::_id_16A4( maps\mp\bots\_bots_util::_id_1725 );
}

_id_8072()
{
    level._id_161B["crate_can_use"] = ::_id_2363;
    level._id_161B["gametype_think"] = ::_id_15FF;
    level._id_161B["should_start_cautious_approach"] = ::_id_847C;
    level._id_161B["leader_dialog"] = ::_id_15FD;

    if ( !level._id_164F )
        level._id_161B["get_watch_node_chance"] = ::_id_15FC;
}

_id_2363( var_0 )
{
    if ( _func_1FF( self ) && !isdefined( var_0._id_175D ) )
        return 0;

    if ( !maps\mp\_utility::_id_51CE( self ) )
        return 1;

    return maps\mp\bots\_bots_util::_id_1662();
}

monitor_flag_control()
{
    self notify( "monitor_flag_control" );
    self endon( "monitor_flag_control" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 1;
        var_0 = maps\mp\gametypes\dom::_id_3F98();

        if ( var_0 != "neutral" )
        {
            var_1 = _func_207( self._id_02E2 );

            if ( isdefined( var_1 ) )
                _func_1F8( var_1, var_0 );
        }
    }
}

_id_5DA3()
{
    self notify( "monitor_flag_ownership" );
    self endon( "monitor_flag_ownership" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = maps\mp\gametypes\dom::_id_3F98();

    for (;;)
    {
        var_1 = maps\mp\gametypes\dom::_id_3F98();

        if ( var_1 != var_0 )
            level notify( "flag_changed_ownership" );

        var_0 = var_1;
        wait 0.05;
    }
}

_id_805C()
{
    maps\mp\bots\_bots_util::_id_172D();
    var_0 = _id_162A();

    if ( var_0.size > 3 )
    {
        while ( !isdefined( level._id_9217 ) )
            wait 0.05;

        var_1 = [];

        foreach ( var_3 in var_0 )
        {
            if ( !isdefined( var_1[var_3._id_9258] ) )
                var_1[var_3._id_9258] = [];

            var_1[var_3._id_9258] = common_scripts\utility::_id_0CDA( var_1[var_3._id_9258], var_3 );
        }

        foreach ( var_7, var_6 in var_1 )
        {
            level._id_3323 = 0;
            _id_15C1( var_6 );
            maps\mp\bots\_bots_gametype_common::_id_15BF( var_6, var_7 + "_flag", level._id_164F );
        }
    }
    else
    {
        maps\mp\bots\_bots_gametype_common::_id_15BF( var_0, "flag", level._id_164F );
        _id_15C1( var_0 );
        thread _id_172C( var_0 );
    }

    foreach ( var_3 in var_0 )
    {
        var_3 thread monitor_flag_control();
        var_3 thread _id_5DA3();

        if ( var_3._id_0394 != "_a" && var_3._id_0394 != "_b" && var_3._id_0394 != "_c" )
        {

        }

        var_3._id_6139 = maps\mp\bots\_bots_gametype_common::bot_get_valid_nodes_in_trigger( var_3 );
        var_3._id_5566["allies"] = 0;
        var_3._id_5566["axis"] = 0;
    }

    level._id_15FE = [];
    level._id_15FE["axis"] = [];
    level._id_15FE["allies"] = [];
    level._id_1628 = 1;
}

_id_172C( var_0 )
{
    level endon( "game_ended" );
    level waittill( "dom_flags_moved" );
    maps\mp\bots\_bots_gametype_common::_id_15BF( var_0, "flag", level._id_164F, 1 );
    _id_15C1( var_0 );

    foreach ( var_2 in var_0 )
        var_2._id_6139 = maps\mp\bots\_bots_gametype_common::bot_get_valid_nodes_in_trigger( var_2 );

    foreach ( var_5 in level._id_669D )
    {
        if ( maps\mp\_utility::_id_50B1( var_5 ) )
            var_5._id_399C = 1;
    }
}

_id_162A()
{
    if ( isdefined( level._id_09E0 ) )
        return level._id_09E0;
    else
        return level._id_386B;
}

_id_15C1( var_0 )
{
    if ( !isdefined( level._id_3838 ) )
        level._id_3838 = [];

    for ( var_1 = 0; var_1 < var_0.size - 1; var_1++ )
    {
        for ( var_2 = var_1 + 1; var_2 < var_0.size; var_2++ )
        {
            var_3 = _func_0EE( var_0[var_1]._id_02E2, var_0[var_2]._id_02E2 );
            var_4 = _id_3D6E( var_0[var_1] );
            var_5 = _id_3D6E( var_0[var_2] );
            level._id_3838[var_4][var_5] = var_3;
            level._id_3838[var_5][var_4] = var_3;
        }
    }
}

_id_847C( var_0 )
{
    if ( var_0 )
    {
        if ( self._id_24E5 maps\mp\gametypes\dom::_id_3F98() == "neutral" && _id_383C( self._id_24E5 ) )
        {
            var_1 = _id_3CF7( self._id_55DD._id_02E2 );

            if ( var_1 == self._id_24E5 )
                return 0;
            else
            {
                var_2 = _id_3E06( var_1, self._id_24E5 );
                var_3 = _func_0F0( var_1._id_02E2, self._id_24E5._id_02E2 );
                var_4 = _func_0F0( var_2._id_02E2, self._id_24E5._id_02E2 );

                if ( var_3 < var_4 )
                    return 0;
            }
        }
    }

    return maps\mp\bots\_bots_strategy::_id_847B( var_0 );
}

_id_15FA()
{
    return 0;
}

_id_15FB()
{
    return 0;
}

_id_15FF()
{
    self notify( "bot_dom_think" );
    self endon( "bot_dom_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self._id_399C = 0;
    self._id_609D = 0;
    self._id_60C1 = 0;
    self _meth_834F( "separation", 0 );
    self _meth_834F( "grenade_objectives", 1 );
    self _meth_834F( "use_obj_path_style", 1 );

    for (;;)
    {
        maps\mp\bots\_bots_util::_id_1723();
        var_0 = gettime();

        if ( var_0 > self._id_60C1 )
        {
            self._id_60C1 = gettime() + 10000;
            self._id_8F23 = self _meth_8379( "strategyLevel" );
        }

        if ( var_0 > self._id_609D || self._id_399C )
        {
            if ( _id_8461() )
                self._id_609D = var_0 + 5000;
            else
            {
                self._id_399C = 0;
                _id_15D7();
                self._id_609D = var_0 + _func_0B4( 30000, 45000 );
            }
        }

        common_scripts\utility::_id_A0A0( "needs_new_flag_goal", 1.0 );
    }
}

_id_8461()
{
    if ( self._id_399C )
        return 0;

    if ( !maps\mp\bots\_bots_util::_id_165A() )
        return 0;

    if ( self._id_24E5 maps\mp\gametypes\dom::_id_3F98() == self._id_04A7 )
        return 0;

    var_0 = _id_3D6D();

    if ( _func_0F0( self._id_02E2, self._id_24E5._id_02E2 ) < var_0 * 2 * ( var_0 * 2 ) )
    {
        var_1 = _id_3CC4( self._id_04A7 );

        if ( var_1.size == 2 && !common_scripts\utility::_id_0CE4( var_1, self._id_24E5 ) && !_id_15A9() )
            return 0;

        return 1;
    }

    return 0;
}

_id_3E14()
{
    return level._id_15FE[self._id_04A7];
}

_id_46F7()
{
    var_0 = _id_3E14();
    return var_0.size > 0;
}

_id_383B( var_0 )
{
    return !_id_383C( var_0 );
}

_id_383C( var_0 )
{
    return var_0._id_9C09._id_3818;
}

_id_15D7()
{
    var_0 = undefined;
    var_1 = [];
    var_2 = [];
    var_3 = 1;
    var_4 = _id_3E14();

    if ( var_4.size > 0 )
        var_5 = var_4;
    else
        var_5 = level._id_386B;

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6] maps\mp\gametypes\dom::_id_3F98();

        if ( var_3 )
        {
            if ( _id_383B( var_5[var_6] ) )
                var_3 = 0;
            else
            {

            }
        }

        if ( var_7 != self._id_04A7 )
        {
            var_1[var_1.size] = var_5[var_6];
            continue;
        }

        var_2[var_2.size] = var_5[var_6];
    }

    var_8 = undefined;

    if ( var_1.size == 3 )
        var_8 = 1;
    else if ( var_1.size == 2 )
    {
        if ( var_2.size == 1 )
        {
            if ( !_id_16F8( var_2[0], 1 ) )
                var_8 = 1;
            else
                var_8 = !_id_16F7( 0.34 );

            if ( maps\mp\bots\_bots_util::_id_1636( self._id_04A7 ) == 1 )
                var_8 = 1;
        }
        else if ( var_2.size == 0 )
            var_8 = 1;
    }
    else if ( var_1.size == 1 )
    {
        if ( var_2.size == 2 )
        {
            if ( _id_15A9() )
            {
                if ( !_id_16F8( var_2[0], 2 ) && !_id_16F8( var_2[1], 2 ) )
                    var_8 = 1;
                else if ( self._id_8F23 == 0 )
                    var_8 = !_id_16F7( 0.34 );
                else
                    var_8 = !_id_16F7( 0.5 );
            }
            else
                var_8 = 0;
        }
        else if ( var_2.size == 1 )
        {
            if ( !_id_16F8( var_2[0], 1 ) )
                var_8 = 1;
            else
                var_8 = !_id_16F7( 0.34 );
        }
        else if ( var_2.size == 0 )
            var_8 = 1;
    }
    else if ( var_1.size == 0 )
        var_8 = 0;

    if ( var_8 )
    {
        if ( var_1.size > 1 )
            var_9 = common_scripts\utility::_id_3CCB( self._id_02E2, var_1 );
        else
            var_9 = var_1;

        if ( var_3 && !_id_46F7() )
        {
            var_10 = _id_3DF6( var_9[0], 1 );

            if ( var_10 < _id_5C2D() )
                var_11 = 0;
            else
            {
                var_12 = 20;
                var_13 = 65;
                var_14 = 15;

                if ( self._id_8F23 == 0 )
                {
                    var_12 = 50;
                    var_13 = 25;
                    var_14 = 25;
                }
                else if ( self._id_8F23 == 1 )
                {
                    var_12 = 40;
                    var_13 = 40;
                    var_14 = 20;
                }

                var_15 = _func_0B2( 100 );

                if ( var_15 < var_12 )
                    var_11 = 0;
                else if ( var_15 < var_12 + var_13 )
                    var_11 = 1;
                else
                    var_11 = 2;
            }

            var_16 = undefined;

            if ( var_11 == 0 )
                var_16 = "critical";

            _id_1B47( var_9[var_11], var_16 );
            return;
        }

        if ( var_9.size == 1 )
            var_0 = var_9[0];
        else if ( _func_0F0( var_9[0]._id_02E2, self._id_02E2 ) < 102400 )
            var_0 = var_9[0];
        else
        {
            var_17 = [];
            var_18 = [];

            for ( var_6 = 0; var_6 < var_9.size; var_6++ )
            {
                var_19 = _func_0EE( var_9[var_6]._id_02E2, self._id_02E2 );
                var_18[var_6] = var_19;
                var_17[var_6] = var_19;
            }

            if ( var_2.size == 1 )
            {
                var_20 = 1.5;

                for ( var_6 = 0; var_6 < var_17.size; var_6++ )
                    var_17[var_6] += level._id_3838[_id_3D6E( var_9[var_6] )][_id_3D6E( var_2[0] )] * var_20;
            }

            if ( self._id_8F23 == 0 )
            {
                var_15 = _func_0B2( 100 );

                if ( var_15 < 50 )
                    var_0 = var_9[0];
                else if ( var_15 < 50 + 50 / ( var_9.size - 1 ) )
                    var_0 = var_9[1];
                else
                    var_0 = var_9[2];
            }
            else if ( var_17.size == 2 )
            {
                var_21[0] = 50;
                var_21[1] = 50;

                for ( var_6 = 0; var_6 < var_9.size; var_6++ )
                {
                    if ( var_17[var_6] < var_17[1 - var_6] )
                    {
                        var_21[var_6] += 20;
                        var_21[1 - var_6] = var_21[1 - var_6] - 20;
                    }

                    if ( var_18[var_6] < 640 )
                    {
                        var_21[var_6] += 15;
                        var_21[1 - var_6] = var_21[1 - var_6] - 15;
                    }

                    if ( var_9[var_6] maps\mp\gametypes\dom::_id_3F98() == "neutral" )
                    {
                        var_21[var_6] += 15;
                        var_21[1 - var_6] = var_21[1 - var_6] - 15;
                    }
                }

                var_15 = _func_0B2( 100 );

                if ( var_15 < var_21[0] )
                    var_0 = var_9[0];
                else
                    var_0 = var_9[1];
            }
            else if ( var_17.size == 3 )
            {
                var_21[0] = 34;
                var_21[1] = 33;
                var_21[2] = 33;

                for ( var_6 = 0; var_6 < var_9.size; var_6++ )
                {
                    var_22 = ( var_6 + 1 ) % 3;
                    var_23 = ( var_6 + 2 ) % 3;

                    if ( var_17[var_6] < var_17[var_22] && var_17[var_6] < var_17[var_23] )
                    {
                        var_21[var_6] += 36;
                        var_21[var_22] -= 18;
                        var_21[var_23] -= 18;
                    }

                    if ( var_18[var_6] < 640 )
                    {
                        var_21[var_6] += 15;
                        var_21[var_22] -= 7;
                        var_21[var_23] -= 8;
                    }

                    if ( var_9[var_6] maps\mp\gametypes\dom::_id_3F98() == "neutral" )
                    {
                        var_21[var_6] += 15;
                        var_21[var_22] -= 7;
                        var_21[var_23] -= 8;
                    }
                }

                var_15 = _func_0B2( 100 );

                if ( var_15 < var_21[0] )
                    var_0 = var_9[0];
                else if ( var_15 < var_21[0] + var_21[1] )
                    var_0 = var_9[1];
                else
                    var_0 = var_9[2];
            }
        }
    }
    else
    {
        if ( var_2.size > 1 )
            var_24 = common_scripts\utility::_id_3CCB( self._id_02E2, var_2 );
        else
            var_24 = var_2;

        foreach ( var_26 in var_24 )
        {
            if ( _id_16F8( var_26, var_2.size ) )
            {
                var_0 = var_26;
                break;
            }
        }

        if ( !isdefined( var_0 ) )
        {
            if ( self._id_8F23 == 0 )
                var_0 = var_2[0];
            else if ( var_24.size == 2 )
            {
                var_28 = _id_3E06( var_24[0], var_24[1] );
                var_29 = common_scripts\utility::_id_3CCB( var_28._id_02E2, var_24 );
                var_15 = _func_0B2( 100 );

                if ( var_15 < 70 )
                    var_0 = var_29[0];
                else
                    var_0 = var_29[1];
            }
            else
                var_0 = var_24[0];
        }
    }

    if ( var_8 )
        _id_1B47( var_0 );
    else
        _id_27A4( var_0 );
}

_id_5C2D()
{
    var_0 = maps\mp\bots\_bots_util::_id_1636( self._id_04A7 );
    return _func_0E3( var_0 / 3 );
}

_id_15A9()
{
    if ( self._id_8F23 == 0 )
        return 1;

    var_0 = _id_3E14();

    if ( var_0.size == 3 )
        return 1;

    var_1 = maps\mp\gametypes\_gamescores::_id_05BD( common_scripts\utility::_id_3D4F( self._id_04A7 ) );
    var_2 = maps\mp\gametypes\_gamescores::_id_05BD( self._id_04A7 );
    var_3 = 200 - var_1;
    var_4 = 200 - var_2;
    var_5 = var_4 * 0.5 > var_3;
    return var_5;
}

_id_16F7( var_0 )
{
    if ( _func_0B3( 1 ) < var_0 )
        return 1;

    var_1 = level._id_16B2[self._id_67DF];

    if ( var_1 == "stationary" )
        return 1;
    else if ( var_1 == "active" )
        return 0;
}

_id_1B47( var_0, var_1, var_2 )
{
    self._id_24E5 = var_0;

    if ( _id_15FB() )
    {
        var_3["override_goal_type"] = var_1;
        var_3["entrance_points_index"] = _id_3D6E( var_0 );
        maps\mp\bots\_bots_strategy::_id_16C2( var_0._id_02E2, _id_3D6F(), var_3 );
    }
    else
    {
        var_3["override_goal_type"] = var_1;
        var_3["entrance_points_index"] = _id_3D6E( var_0 );
        maps\mp\bots\_bots_strategy::_id_15D2( var_0._id_02E2, var_0._id_6139, var_0, var_3 );
    }

    if ( !isdefined( var_2 ) || !var_2 )
        thread _id_5DA4( var_0 );
}

_id_27A4( var_0 )
{
    self._id_24E5 = var_0;

    if ( _id_15FA() )
    {
        var_1["entrance_points_index"] = _id_3D6E( var_0 );
        maps\mp\bots\_bots_strategy::_id_15D2( var_0._id_02E2, var_0._id_6139, var_0, var_1 );
    }
    else
    {
        var_1["entrance_points_index"] = _id_3D6E( var_0 );
        var_1["nearest_node_to_center"] = var_0._id_6071;
        maps\mp\bots\_bots_strategy::_id_16C2( var_0._id_02E2, _id_3D6F(), var_1 );
    }

    thread _id_5DA4( var_0 );
}

_id_3D6D()
{
    if ( !isdefined( level._id_1B4A ) )
        level._id_1B4A = 158;

    return level._id_1B4A;
}

_id_3D6F()
{
    if ( !isdefined( level._id_703F ) )
    {
        var_0 = self _meth_835D();
        var_1 = ( var_0[0] + var_0[1] ) / 2;
        level._id_703F = _func_0BF( 1000, var_1 / 3.5 );
    }

    return level._id_703F;
}

_id_15FD( var_0, var_1 )
{
    if ( _func_120( var_0, "losing" ) && var_0 != "losing_score" && var_0 != "losing_time" )
    {
        var_2 = _func_122( var_0, var_0.size - 2 );
        var_3 = _id_3E69( var_2 );

        if ( _id_15A8( var_3 ) )
        {
            self _meth_8360( "known_enemy", undefined, var_3._id_02E2 );

            if ( !isdefined( self._id_553D ) || gettime() - self._id_553D > 10000 )
            {
                if ( maps\mp\bots\_bots_util::_id_1662() )
                {
                    var_4 = _func_0F0( self._id_02E2, var_3._id_02E2 ) < 490000;
                    var_5 = _id_1663( var_3 );

                    if ( var_4 || var_5 )
                    {
                        _id_1B47( var_3 );
                        self._id_553D = gettime();
                    }
                }
            }
        }
    }
    else if ( _func_120( var_0, "secured" ) )
    {
        var_2 = _func_122( var_0, var_0.size - 2 );
        var_6 = _id_3E69( var_2 );
        var_6._id_5566[self._id_04A7] = gettime();
    }

    maps\mp\bots\_bots_util::_id_1681( var_0, var_1 );
}

_id_15A8( var_0 )
{
    var_1 = _id_3E14();

    if ( var_1.size == 0 )
        return 1;

    if ( common_scripts\utility::_id_0CE4( var_1, var_0 ) )
        return 1;

    return 0;
}

_id_5DA4( var_0 )
{
    self notify( "monitor_flag_status" );
    self endon( "monitor_flag_status" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = _id_3DF8( self._id_04A7 );
    var_2 = _id_3D6D() * _id_3D6D();
    var_3 = _id_3D6D() * 3 * ( _id_3D6D() * 3 );
    var_4 = 1;

    while ( var_4 )
    {
        var_5 = 0;
        var_6 = var_0 maps\mp\gametypes\dom::_id_3F98();
        var_7 = _id_3DF8( self._id_04A7 );
        var_8 = _id_3D4E( self._id_04A7 );

        if ( maps\mp\bots\_bots_util::_id_165A() )
        {
            if ( var_6 == self._id_04A7 && var_0._id_9C09._id_1E22 == "none" )
            {
                if ( !_id_15FA() )
                    var_5 = 1;
            }

            if ( var_7 == 2 && var_6 != self._id_04A7 && !_id_15A9() )
            {
                if ( _func_0F0( self._id_02E2, var_0._id_02E2 ) > var_2 )
                    var_5 = 1;
            }

            foreach ( var_10 in var_8 )
            {
                if ( var_10 != var_0 && _id_15A8( var_10 ) )
                {
                    if ( _func_0F0( self._id_02E2, var_10._id_02E2 ) < var_3 )
                        var_5 = 1;
                }
            }

            if ( self _meth_80AB( var_0 ) && var_0._id_9C09._id_9C10 <= 0 )
            {
                if ( self _meth_8363() )
                {
                    var_12 = self _meth_8358();
                    var_13 = self _meth_8359();

                    if ( _func_0F0( self._id_02E2, var_12 ) < _func_0E8( var_13 ) )
                    {
                        var_14 = self _meth_8385();

                        if ( isdefined( var_14 ) )
                        {
                            var_15 = undefined;

                            foreach ( var_17 in var_0._id_6139 )
                            {
                                if ( !_func_204( var_17, var_14, 1 ) )
                                {
                                    var_15 = var_17._id_02E2;
                                    break;
                                }
                            }

                            if ( isdefined( var_15 ) )
                            {
                                self._id_27B3 = var_15;
                                self notify( "defend_force_node_recalculation" );
                            }
                        }
                    }
                }
            }
        }

        if ( maps\mp\bots\_bots_util::_id_1662() )
        {
            if ( var_6 != self._id_04A7 )
            {
                if ( !_id_15FB() )
                    var_5 = 1;
            }
            else if ( var_7 == 1 && var_1 > 1 )
                var_5 = 1;
        }

        var_1 = var_7;

        if ( var_5 )
        {
            self._id_399C = 1;
            var_4 = 0;
            self notify( "needs_new_flag_goal" );
            continue;
        }

        var_19 = level common_scripts\utility::_id_A0A2( "flag_changed_ownership", 1 + _func_0B5( 0, 2 ) );

        if ( !( isdefined( var_19 ) && var_19 == "timeout" ) )
        {
            var_20 = _func_0E1( ( 3 - self._id_8F23 ) * 1.0 + _func_0B5( -0.5, 0.5 ), 0 );
            wait(var_20);
        }
    }
}

_id_15FC( var_0 )
{
    if ( var_0 == self._id_6122 )
        return 1.0;

    if ( !isdefined( self._id_24E5 ) )
        return 1.0;

    var_1 = 0;
    var_2 = _id_3D6E( self._id_24E5 );
    var_3 = _id_3CC4( self._id_04A7 );

    foreach ( var_5 in var_3 )
    {
        if ( var_5 != self._id_24E5 )
        {
            var_1 = var_0 maps\mp\bots\_bots_util::_id_6126( var_2, _id_3D6E( var_5 ) );

            if ( var_1 )
            {
                var_6 = _id_3E06( self._id_24E5, var_5 );
                var_7 = var_6 maps\mp\gametypes\dom::_id_3F98();

                if ( var_7 != self._id_04A7 )
                {
                    if ( var_0 maps\mp\bots\_bots_util::_id_6126( var_2, _id_3D6E( var_6 ) ) )
                        var_1 = 0;
                }
            }
        }
    }

    if ( var_1 )
        return 0.2;

    return 1.0;
}

_id_3D6E( var_0 )
{
    var_1 = "";

    if ( isdefined( var_0._id_9258 ) )
        var_1 += ( var_0._id_9258 + "_" );

    var_1 += ( "flag" + var_0._id_0394 );
    return var_1;
}

_id_3E06( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_386B.size; var_2++ )
    {
        if ( level._id_386B[var_2] != var_0 && level._id_386B[var_2] != var_1 )
            return level._id_386B[var_2];
    }
}

_id_3E6A( var_0 )
{
    var_1 = "_" + _func_123( var_0 );
    return _id_3E69( var_1 );
}

_id_3E69( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_386B.size; var_1++ )
    {
        if ( level._id_386B[var_1]._id_0394 == var_0 )
            return level._id_386B[var_1];
    }
}

_id_3CF7( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in level._id_386B )
    {
        var_5 = _func_0F0( var_4._id_02E2, var_0 );

        if ( !isdefined( var_2 ) || var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_3DF6( var_0, var_1 )
{
    var_2 = 0;
    var_3 = _id_3D6D();

    foreach ( var_5 in level._id_669D )
    {
        if ( !isdefined( var_5._id_04A7 ) )
            continue;

        if ( var_5._id_04A7 == self._id_04A7 && var_5 != self && maps\mp\_utility::_id_51CE( var_5 ) )
        {
            if ( _func_0CF( var_5 ) )
            {
                if ( var_5 _id_165B( var_0 ) )
                    var_2++;

                continue;
            }

            if ( !isdefined( var_1 ) || !var_1 )
            {
                if ( var_5 _meth_80AB( var_0 ) )
                    var_2++;
            }
        }
    }

    return var_2;
}

_id_165B( var_0 )
{
    if ( !maps\mp\bots\_bots_util::_id_165A() )
        return 0;

    return _id_170C( var_0 );
}

_id_1663( var_0 )
{
    if ( !maps\mp\bots\_bots_util::_id_1662() )
        return 0;

    return _id_170C( var_0 );
}

_id_170C( var_0 )
{
    return self._id_24E5 == var_0;
}

_id_3DF8( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_386B.size; var_2++ )
    {
        var_3 = level._id_386B[var_2] maps\mp\gametypes\dom::_id_3F98();

        if ( var_3 == var_0 )
            var_1++;
    }

    return var_1;
}

_id_3D4E( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_386B.size; var_2++ )
    {
        var_3 = level._id_386B[var_2] maps\mp\gametypes\dom::_id_3F98();

        if ( var_3 == common_scripts\utility::_id_3D4F( var_0 ) )
            var_1 = common_scripts\utility::_id_0CDA( var_1, level._id_386B[var_2] );
    }

    return var_1;
}

_id_3CC4( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_386B.size; var_2++ )
    {
        var_3 = level._id_386B[var_2] maps\mp\gametypes\dom::_id_3F98();

        if ( var_3 == var_0 )
            var_1 = common_scripts\utility::_id_0CDA( var_1, level._id_386B[var_2] );
    }

    return var_1;
}

_id_16F8( var_0, var_1 )
{
    var_2 = _id_3DD6( var_1 );
    var_3 = _id_3E31( var_0 );
    return var_3.size < var_2;
}

_id_3DD6( var_0 )
{
    var_1 = maps\mp\bots\_bots_util::_id_1636( self._id_04A7 );

    if ( var_0 == 1 )
        return _func_0E3( var_1 / 6 );
    else
        return _func_0E3( var_1 / 3 );
}

_id_3E31( var_0 )
{
    var_1 = _id_3D6F();
    var_2 = [];

    foreach ( var_4 in level._id_669D )
    {
        if ( !isdefined( var_4._id_04A7 ) )
            continue;

        if ( var_4._id_04A7 == self._id_04A7 && var_4 != self && maps\mp\_utility::_id_51CE( var_4 ) )
        {
            if ( _func_0CF( var_4 ) )
            {
                if ( var_4 _id_1663( var_0 ) )
                    var_2 = common_scripts\utility::_id_0CDA( var_2, var_4 );

                continue;
            }

            var_5 = gettime() - var_0._id_5566[self._id_04A7];

            if ( var_5 < 10000 )
                continue;

            if ( _func_0F0( var_0._id_02E2, var_4._id_02E2 ) < var_1 * var_1 )
                var_2 = common_scripts\utility::_id_0CDA( var_2, var_4 );
        }
    }

    return var_2;
}

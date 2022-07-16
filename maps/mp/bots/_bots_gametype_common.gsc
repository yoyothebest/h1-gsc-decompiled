// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_15BE()
{
    var_0 = [];
    var_1 = [];
    var_2 = 0;

    foreach ( var_4 in level._id_1555 )
    {
        var_0[var_2] = common_scripts\utility::_id_710E( var_4._id_174F )._id_02E2;
        var_1[var_2] = "zone" + var_4._id_0241;
        var_2++;
    }

    _id_15BD( var_0, var_1 );
}

_id_15BF( var_0, var_1, var_2, var_3 )
{
    wait 1.0;
    var_4 = [];
    var_5 = [];
    var_6 = 0;

    foreach ( var_10, var_8 in var_0 )
    {
        if ( isdefined( var_0[var_10]._id_174E ) )
            var_4[var_6] = var_0[var_10]._id_174E._id_02E2;
        else
        {
            var_0[var_10]._id_6071 = _func_0C8( var_0[var_10]._id_02E2 );

            if ( !isdefined( var_0[var_10]._id_6071 ) )
            {
                var_9 = _func_0C7( var_0[var_10]._id_02E2, 256, 0 );

                if ( var_9.size > 0 )
                    var_0[var_10]._id_6071 = var_9[0];
            }

            if ( !isdefined( var_0[var_10]._id_6071 ) )
                continue;

            if ( _func_0EE( var_0[var_10]._id_6071._id_02E2, var_0[var_10]._id_02E2 ) > 128 )
            {
                var_0[var_10]._id_6071 = undefined;
                continue;
            }

            var_4[var_6] = var_0[var_10]._id_6071._id_02E2;
        }

        var_5[var_6] = var_1 + var_0[var_10]._id_0394;
        var_6++;
    }

    _id_15BD( var_4, var_5, var_2, var_3 );
}

_id_15BD( var_0, var_1, var_2, var_3 )
{
    var_4 = !isdefined( var_2 ) || !var_2;
    var_5 = isdefined( var_3 ) && var_3;
    wait 0.1;

    if ( var_5 && var_4 )
    {
        var_6 = _func_0C5();

        foreach ( var_8 in var_6 )
            var_8._id_6444 = undefined;
    }

    var_10 = [];

    for ( var_11 = 0; var_11 < var_0.size; var_11++ )
    {
        var_12 = var_1[var_11];
        var_10[var_12] = _func_212( var_0[var_11] );
        wait 0.05;

        for ( var_13 = 0; var_13 < var_10[var_12].size; var_13++ )
        {
            var_14 = var_10[var_12][var_13];
            var_14._id_506F = 1;
            var_14._id_7020[var_12] = maps\mp\bots\_bots_util::_id_332B( var_14._id_02E2, var_0[var_11], "prone" );
            wait 0.05;
            var_14._id_2480[var_12] = maps\mp\bots\_bots_util::_id_332B( var_14._id_02E2, var_0[var_11], "crouch" );
            wait 0.05;
        }
    }

    var_15 = [];

    if ( var_4 )
    {
        for ( var_11 = 0; var_11 < var_0.size; var_11++ )
        {
            for ( var_13 = var_11 + 1; var_13 < var_0.size; var_13++ )
            {
                var_16 = maps\mp\bots\_bots_util::_id_3D64( var_0[var_11], var_0[var_13] );

                foreach ( var_8 in var_16 )
                    var_8._id_6444[var_1[var_11]][var_1[var_13]] = 1;
            }
        }
    }

    if ( !isdefined( level._id_3321 ) )
        level._id_3321 = [];

    if ( !isdefined( level._id_3320 ) )
        level._id_3320 = [];

    if ( !isdefined( level._id_3322 ) )
        level._id_3322 = [];

    if ( var_5 )
    {
        level._id_3321 = var_0;
        level._id_3320 = var_1;
        level._id_3322 = var_10;
    }
    else
    {
        level._id_3321 = common_scripts\utility::_id_0CDD( level._id_3321, var_0 );
        level._id_3320 = common_scripts\utility::_id_0CDD( level._id_3320, var_1 );
        level._id_3322 = common_scripts\utility::_id_0CE1( level._id_3322, var_10 );
    }

    level._id_3323 = 1;
}

_id_15A3( var_0, var_1 )
{
    if ( var_1.classname == "trigger_radius" )
    {
        var_2 = _func_0C6( var_1._id_02E2, var_1._id_0351, 0, 100 );
        var_3 = common_scripts\utility::_id_0CF7( var_2, var_0 );

        if ( var_3.size > 0 )
            var_0 = common_scripts\utility::_id_0CDD( var_0, var_3 );
    }
    else if ( var_1.classname == "trigger_multiple" || var_1.classname == "trigger_use_touch" )
    {
        var_4[0] = var_1 _meth_821A( 1, 1, 1 );
        var_4[1] = var_1 _meth_821A( 1, 1, -1 );
        var_4[2] = var_1 _meth_821A( 1, -1, 1 );
        var_4[3] = var_1 _meth_821A( 1, -1, -1 );
        var_4[4] = var_1 _meth_821A( -1, 1, 1 );
        var_4[5] = var_1 _meth_821A( -1, 1, -1 );
        var_4[6] = var_1 _meth_821A( -1, -1, 1 );
        var_4[7] = var_1 _meth_821A( -1, -1, -1 );
        var_5 = 0;

        foreach ( var_7 in var_4 )
        {
            var_8 = _func_0EE( var_7, var_1._id_02E2 );

            if ( var_8 > var_5 )
                var_5 = var_8;
        }

        var_2 = _func_0C6( var_1._id_02E2, var_5, 0, 200 );

        foreach ( var_11 in var_2 )
        {
            if ( !_func_22F( var_11._id_02E2, var_1 ) )
            {
                if ( _func_22F( var_11._id_02E2 + ( 0, 0, 40 ), var_1 ) || _func_22F( var_11._id_02E2 + ( 0, 0, 80 ), var_1 ) || _func_22F( var_11._id_02E2 + ( 0, 0, 120 ), var_1 ) )
                {
                    if ( var_11._id_04D9 != "Begin" && var_11._id_04D9 != "End" )
                        var_0 = common_scripts\utility::_id_0CDA( var_0, var_11 );
                }
            }
        }
    }

    return var_0;
}

_id_16F1()
{
    wait 1.0;
    _id_16F2( level._id_1555 );
    level._id_16EA = 1;
}

_id_16F2( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_174F ) )
            var_2._id_174F = bot_get_valid_nodes_in_trigger( var_2._id_04C5 );
    }
}

_id_1625( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_669D )
    {
        if ( maps\mp\_utility::_id_51CE( var_3 ) && isdefined( var_3._id_04A7 ) && var_3._id_04A7 == var_0 )
            var_1++;
    }

    return var_1;
}

_id_1623( var_0, var_1, var_2 )
{
    var_3 = _id_1626( "attacker", var_0 );

    foreach ( var_5 in level._id_0323 )
    {
        if ( !_func_0CF( var_5 ) && isdefined( var_5._id_04A7 ) && var_5._id_04A7 == var_0 )
        {
            if ( var_5 bot_gametype_human_player_always_considered_attacker() || _func_0F0( var_1, var_5._id_02E2 ) > _func_0E8( var_2 ) )
                var_3 = common_scripts\utility::_id_0CDA( var_3, var_5 );
        }
    }

    return var_3;
}

_id_1624( var_0, var_1, var_2 )
{
    var_3 = _id_1626( "defender", var_0 );

    foreach ( var_5 in level._id_0323 )
    {
        if ( !_func_0CF( var_5 ) && isdefined( var_5._id_04A7 ) && var_5._id_04A7 == var_0 )
        {
            if ( var_5 bot_gametype_human_player_always_considered_defender() || _func_0F0( var_1, var_5._id_02E2 ) <= _func_0E8( var_2 ) )
                var_3 = common_scripts\utility::_id_0CDA( var_3, var_5 );
        }
    }

    return var_3;
}

bot_gametype_human_player_always_considered_attacker()
{
    if ( isdefined( level.bot_gametype_human_player_always_attacker ) )
        return self [[ level.bot_gametype_human_player_always_attacker ]]();

    return 0;
}

bot_gametype_human_player_always_considered_defender()
{
    if ( isdefined( level.bot_gametype_human_player_always_defender ) )
        return self [[ level.bot_gametype_human_player_always_defender ]]();

    return 0;
}

_id_1629( var_0 )
{
    self._id_759A = var_0;
    self _meth_8354();
    maps\mp\bots\_bots_strategy::_id_15EF();
}

_id_1626( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level._id_669D )
    {
        if ( isdefined( var_4._id_04A7 ) && _func_1A1( var_4 ) && maps\mp\_utility::_id_51CE( var_4 ) && var_4._id_04A7 == var_1 && isdefined( var_4._id_759A ) && var_4._id_759A == var_0 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_1627()
{
    var_0 = [[ level._id_161C ]]( self._id_04A7 );
    var_1 = [[ level._id_161D ]]( self._id_04A7 );
    var_2 = [[ level._id_161F ]]( self._id_04A7 );
    var_3 = [[ level._id_1622 ]]( self._id_04A7 );
    var_4 = level._id_16B2[self._id_67DF];

    if ( var_4 == "active" )
    {
        if ( var_0.size >= var_2 )
        {
            var_5 = 0;

            foreach ( var_7 in var_0 )
            {
                if ( _func_0CF( var_7 ) && level._id_16B2[var_7._id_67DF] == "stationary" && var_7 bot_can_switch_to_defender() )
                {
                    var_7._id_759A = undefined;
                    var_5 = 1;
                    break;
                }
            }

            if ( var_5 )
            {
                _id_1629( "attacker" );
                return;
            }

            _id_1629( "defender" );
            return;
        }
        else
            _id_1629( "attacker" );
    }
    else if ( var_4 == "stationary" )
    {
        if ( var_1.size >= var_3 )
        {
            var_5 = 0;

            foreach ( var_10 in var_1 )
            {
                if ( _func_0CF( var_10 ) && level._id_16B2[var_10._id_67DF] == "active" && var_10 bot_can_switch_to_attacker() )
                {
                    var_10._id_759A = undefined;
                    var_5 = 1;
                    break;
                }
            }

            if ( var_5 )
            {
                _id_1629( "defender" );
                return;
            }

            _id_1629( "attacker" );
            return;
        }
        else
            _id_1629( "defender" );
    }
}

_id_161E()
{
    level notify( "bot_gametype_attacker_defender_ai_director_update" );
    level endon( "bot_gametype_attacker_defender_ai_director_update" );
    level endon( "game_ended" );
    var_0 = [ "allies", "axis" ];
    var_1 = gettime() + 2000;

    for (;;)
    {
        if ( gettime() > var_1 )
        {
            var_1 = gettime() + 1000;

            foreach ( var_3 in var_0 )
            {
                var_4 = [[ level._id_161C ]]( var_3 );
                var_5 = [[ level._id_161D ]]( var_3 );
                var_6 = [[ level._id_161F ]]( var_3 );
                var_7 = [[ level._id_1622 ]]( var_3 );

                if ( var_4.size > var_6 )
                {
                    var_8 = [];
                    var_9 = 0;

                    foreach ( var_11 in var_4 )
                    {
                        if ( _func_0CF( var_11 ) && var_11 bot_can_switch_to_defender() )
                        {
                            if ( level._id_16B2[var_11._id_67DF] == "stationary" )
                            {
                                var_11 _id_1629( "defender" );
                                var_9 = 1;
                                break;
                                continue;
                            }

                            var_8 = common_scripts\utility::_id_0CDA( var_8, var_11 );
                        }
                    }

                    if ( !var_9 && var_8.size > 0 )
                        common_scripts\utility::_id_710E( var_8 ) _id_1629( "defender" );
                }

                if ( var_5.size > var_7 )
                {
                    var_13 = [];
                    var_14 = 0;

                    foreach ( var_16 in var_5 )
                    {
                        if ( _func_0CF( var_16 ) && var_16 bot_can_switch_to_attacker() )
                        {
                            if ( level._id_16B2[var_16._id_67DF] == "active" )
                            {
                                var_16 _id_1629( "attacker" );
                                var_14 = 1;
                                break;
                                continue;
                            }

                            var_13 = common_scripts\utility::_id_0CDA( var_13, var_16 );
                        }
                    }

                    if ( !var_14 && var_13.size > 0 )
                        common_scripts\utility::_id_710E( var_13 ) _id_1629( "attacker" );
                }
            }
        }

        wait 0.05;
    }
}

bot_can_switch_to_attacker()
{
    if ( isdefined( level.bot_gametype_allowed_to_switch_to_attacker ) )
        return self [[ level.bot_gametype_allowed_to_switch_to_attacker ]]();

    return 1;
}

bot_can_switch_to_defender()
{
    if ( isdefined( level.bot_gametype_allowed_to_switch_to_defender ) )
        return self [[ level.bot_gametype_allowed_to_switch_to_defender ]]();

    return 1;
}

bot_verify_and_cache_bombzones( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_1555 )
    {

    }

    if ( !var_1 )
        _id_15BE();

    return !var_1;
}

bot_get_valid_nodes_in_trigger( var_0 )
{
    var_1 = _func_203( var_0 );
    var_1 = _id_15A3( var_1, var_0 );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !var_4 _meth_8384() && var_4._id_04D9 != "Begin" && var_4._id_04D9 != "End" )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

bot_cache_entrances_to_zones( var_0 )
{
    var_1 = [];
    var_2 = [];
    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        var_6 = 0;
        var_5._id_3320 = [];
        var_5._id_A3E0 = _id_19D8( var_5 );
        var_5._id_1C10 = _id_A3E5( var_5, 0, 0 );
        var_7 = [ ( 0, 0, 0 ), ( 1, 1, 0 ), ( 1, -1, 0 ), ( -1, 1, 0 ), ( -1, -1, 0 ) ];

        foreach ( var_9 in var_7 )
        {
            var_10 = _id_A3E5( var_5, var_9[0], var_9[1] );
            var_1[var_3] = var_10._id_02E2;
            var_11 = var_5._id_0394 + "_" + var_6;
            var_2[var_3] = var_11;
            var_5._id_3320[var_5._id_3320.size] = var_11;
            var_3++;
            var_6++;
        }
    }

    _id_15BD( var_1, var_2, 1 );
}

_id_19D8( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_5C31 = ( 999999, 999999, 999999 );
    var_1._id_5A10 = ( -999999, -999999, -999999 );

    foreach ( var_3 in var_0._id_6139 )
    {
        var_1._id_5C31 = ( _func_0BF( var_3._id_02E2[0], var_1._id_5C31[0] ), _func_0BF( var_3._id_02E2[1], var_1._id_5C31[1] ), _func_0BF( var_3._id_02E2[2], var_1._id_5C31[2] ) );
        var_1._id_5A10 = ( _func_0E1( var_3._id_02E2[0], var_1._id_5A10[0] ), _func_0E1( var_3._id_02E2[1], var_1._id_5A10[1] ), _func_0E1( var_3._id_02E2[2], var_1._id_5A10[2] ) );
    }

    var_1._id_1C0F = ( ( var_1._id_5C31[0] + var_1._id_5A10[0] ) / 2, ( var_1._id_5C31[1] + var_1._id_5A10[1] ) / 2, ( var_1._id_5C31[2] + var_1._id_5A10[2] ) / 2 );
    var_1._id_44FB = ( var_1._id_5A10[0] - var_1._id_1C0F[0], var_1._id_5A10[1] - var_1._id_1C0F[1], var_1._id_5A10[2] - var_1._id_1C0F[2] );
    var_1._id_0351 = _func_0E1( var_1._id_44FB[0], var_1._id_44FB[1] );
    return var_1;
}

_id_A3E5( var_0, var_1, var_2 )
{
    var_3 = ( var_0._id_A3E0._id_1C0F[0] + var_1 * var_0._id_A3E0._id_44FB[0], var_0._id_A3E0._id_1C0F[1] + var_2 * var_0._id_A3E0._id_44FB[1], 0 );
    var_4 = undefined;
    var_5 = 9999999;

    foreach ( var_7 in var_0._id_6139 )
    {
        var_8 = _func_225( var_7._id_02E2, var_3 );

        if ( var_8 < var_5 )
        {
            var_5 = var_8;
            var_4 = var_7;
        }
    }

    return var_4;
}

_id_5E23()
{
    self notify( "monitor_zone_control" );
    self endon( "monitor_zone_control" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = _func_207( self._id_02E2 );

    for (;;)
    {
        var_1 = "none";

        if ( isdefined( self._id_3BF8 ) )
            var_1 = self._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

        if ( var_1 == "neutral" || var_1 == "none" )
            _func_1F8( var_0, "free" );
        else
            _func_1F8( var_0, var_1 );

        wait 1.0;
    }
}

monitor_bombzone_control()
{
    self notify( "monitor_bombzone_control" );
    self endon( "monitor_bombzone_control" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = _func_207( self._id_24C8 );

    for (;;)
    {
        if ( self.bombplantedon )
            var_1 = common_scripts\utility::_id_3D4F( self._id_663A );
        else
            var_1 = self._id_663A;

        if ( var_1 == "neutral" )
            var_1 = "free";

        _func_1F8( var_0, var_1 );
        wait 1.0;
    }
}

_id_3759( var_0 )
{
    var_1 = undefined;
    var_2 = 999999999;

    foreach ( var_4 in level._id_1555 )
    {
        var_5 = _func_0F0( var_4._id_24C8, var_0._id_02E2 );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_3DC9( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level._id_669D )
    {
        if ( !isdefined( var_4._id_04A7 ) )
            continue;

        if ( maps\mp\_utility::_id_5189( var_4 ) && maps\mp\_utility::_id_51CE( var_4 ) && var_4._id_04A7 == var_0 )
        {
            if ( !isdefined( var_1 ) || var_1 && _func_0CF( var_4 ) && isdefined( var_4._id_759A ) )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

get_bombzone_node_to_plant_on( var_0, var_1 )
{
    if ( var_0._id_174F.size >= 2 )
    {
        if ( var_1 )
            var_2 = self _meth_837E( var_0._id_174F, "node_exposed" );
        else
            var_2 = self _meth_837E( var_0._id_174F, "node_hide_anywhere", "ignore_occupancy" );

        var_3 = self _meth_8379( "strategyLevel" ) * 0.3;
        var_4 = ( self _meth_8379( "strategyLevel" ) + 1 ) * 0.15;
        var_5 = common_scripts\utility::_id_0CF5( var_0._id_174F );

        foreach ( var_7 in var_5 )
        {
            if ( !common_scripts\utility::_id_0CE4( var_2, var_7 ) )
                var_2[var_2.size] = var_7;
        }

        if ( _func_0B3( 1.0 ) < var_3 )
        {
            return var_2[0];
            return;
        }

        if ( _func_0B3( 1.0 ) < var_4 )
        {
            return var_2[1];
            return;
        }

        return common_scripts\utility::_id_710E( var_2 );
        return;
        return;
    }
    else
        return var_0._id_174F[0];
}

get_bombzone_node_to_defuse_on( var_0 )
{
    var_1 = self _meth_837E( var_0._id_174F, "node_hide_anywhere", "ignore_occupancy" );
    var_2 = self _meth_8379( "strategyLevel" ) * 0.3;
    var_3 = ( self _meth_8379( "strategyLevel" ) + 1 ) * 0.15;
    var_4 = common_scripts\utility::_id_0CF5( var_0._id_174F );

    foreach ( var_6 in var_4 )
    {
        if ( !common_scripts\utility::_id_0CE4( var_1, var_6 ) )
            var_1[var_1.size] = var_6;
    }

    if ( _func_0B3( 1.0 ) < var_2 )
        return var_1[0];
    else if ( _func_0B3( 1.0 ) < var_3 )
        return var_1[1];
    else
        return common_scripts\utility::_id_710E( var_1 );
}

bombzone_press_use( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;

    if ( self _meth_8379( "strategyLevel" ) == 1 )
        var_4 = 40;
    else if ( self _meth_8379( "strategyLevel" ) >= 2 )
        var_4 = 80;

    if ( _func_0B2( 100 ) < var_4 && !( isdefined( var_3 ) && var_3 ) )
    {
        self _meth_8350( "prone" );
        wait 0.2;
    }

    if ( self _meth_8379( "strategyLevel" ) > 0 && !var_2 )
    {
        childthread _id_621B();
        childthread _id_6214();
    }

    self _meth_837C( "use", var_0 );
    var_5 = maps\mp\bots\_bots_util::_id_1724( var_0, var_1, "use_interrupted" );
    self _meth_8350( "none" );
    self _meth_837D( "use" );
    var_6 = var_5 == var_1;
    return var_6;
}

_id_621B()
{
    var_0 = _id_3759( self );
    self waittill( "bulletwhizby", var_1 );

    if ( !isdefined( var_1._id_04A7 ) || var_1._id_04A7 != self._id_04A7 )
    {
        var_2 = var_0._id_9C19 - var_0._id_24C9;

        if ( var_2 > 1000 )
            self notify( "use_interrupted" );
    }
}

_id_6214()
{
    self waittill( "damage", var_0, var_1 );

    if ( !isdefined( var_1._id_04A7 ) || var_1._id_04A7 != self._id_04A7 )
        self notify( "use_interrupted" );
}

get_ai_hearing_bomb_plant_sound( var_0 )
{
    var_1 = [];
    var_2 = _id_3DC9( common_scripts\utility::_id_3D4F( self._id_04A7 ) );

    foreach ( var_4 in var_2 )
    {
        if ( !_func_0CF( var_4 ) )
            continue;

        var_5 = 0;

        if ( var_0 == "plant" )
            var_5 = 300 + var_4 _meth_8379( "strategyLevel" ) * 100;
        else if ( var_0 == "defuse" )
            var_5 = 500 + var_4 _meth_8379( "strategyLevel" ) * 500;

        if ( _func_0F0( var_4._id_02E2, self._id_02E2 ) < _func_0E8( var_5 ) )
            var_1[var_1.size] = var_4;
    }

    return var_1;
}

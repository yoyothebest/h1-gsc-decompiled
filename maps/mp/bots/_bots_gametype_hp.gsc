// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    _id_805E();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::_id_164E;
    level._id_161B["should_start_cautious_approach"] = ::_id_847D;
}

_id_805E()
{
    maps\mp\bots\_bots_util::_id_172D();
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_09E2.size; var_1++ )
    {
        var_2 = level._id_09E2[var_1];
        var_2._id_0394 = "zone_" + var_1;
        var_2 thread maps\mp\bots\_bots_gametype_common::_id_5E23();
        var_3 = 0;

        if ( isdefined( var_2._id_9754._id_97CC ) && var_2._id_9754._id_97CC )
        {
            var_2._id_9754 common_scripts\utility::_id_97CE();
            var_3 = 1;
        }

        var_2._id_6139 = maps\mp\bots\_bots_gametype_common::bot_get_valid_nodes_in_trigger( var_2._id_9754 );

        if ( var_3 )
            var_2._id_9754 common_scripts\utility::_id_97CC();
    }

    level.bot_set_zone_nodes = 1;

    if ( !var_0 )
    {
        level._id_164D = 1;
        var_4 = level._id_A3DD;

        if ( !isdefined( var_4 ) )
            var_4 = common_scripts\utility::_id_710E( level._id_09E2 );

        maps\mp\bots\_bots_gametype_common::bot_cache_entrances_to_zones( [ var_4 ] );
        level.bot_gametype_zones_precached[var_4 _meth_81B5()] = 1;
        level._id_1628 = 1;
        thread bot_cache_entrances_to_other_zones( var_4 );
    }
}

bot_cache_entrances_to_other_zones( var_0 )
{
    for ( var_1 = common_scripts\utility::_id_0CF6( level._id_09E2, var_0 ); var_1.size > 0; var_1 = common_scripts\utility::_id_0CF6( var_1, var_2 ) )
    {
        var_2 = undefined;
        var_3 = level._id_A3DD;

        if ( isdefined( var_3 ) && common_scripts\utility::_id_0CE4( var_1, var_3 ) )
            var_2 = var_3;
        else
            var_2 = common_scripts\utility::_id_710E( var_1 );

        maps\mp\bots\_bots_gametype_common::bot_cache_entrances_to_zones( [ var_2 ] );
        level.bot_gametype_zones_precached[var_2 _meth_81B5()] = 1;
    }
}

_id_164E()
{
    self notify( "bot_hp_think" );
    self endon( "bot_hp_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self _meth_834F( "separation", 0 );
    self _meth_834F( "grenade_objectives", 1 );
    var_0 = undefined;
    var_1 = level._id_A3DD;

    for (;;)
    {
        wait 0.05;

        if ( self._id_01E6 <= 0 )
            continue;

        if ( !isdefined( level._id_A3DD ) || !isdefined( level.bot_gametype_zones_precached[level._id_A3DD _meth_81B5()] ) )
        {
            if ( maps\mp\bots\_bots_util::_id_165D() )
                maps\mp\bots\_bots_strategy::_id_15EF();

            self._id_2507 = undefined;
            self [[ self._id_67E1 ]]();
            continue;
        }

        if ( var_1 != level._id_A3DD )
        {
            var_0 = undefined;
            var_1 = level._id_A3DD;
        }

        if ( isdefined( level._id_A3F4 ) && !isdefined( var_0 ) && level._id_7130 == 0 && level._id_164D )
        {
            var_2 = level._id_A3F4 - gettime();

            if ( var_2 > 0 && var_2 < 10000 )
            {
                var_3 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078() == self._id_04A7;

                if ( !var_3 )
                {
                    var_4 = level._id_A3DD._id_A3E0._id_0351 * 6;

                    if ( var_2 < 5000 )
                        var_4 = level._id_A3DD._id_A3E0._id_0351 * 3;

                    var_5 = _func_0EE( level._id_A3DD._id_A3E0._id_1C0F, self._id_02E2 );

                    if ( var_5 > var_4 )
                        var_0 = _id_16F6();
                }
                else
                {
                    var_6 = maps\mp\bots\_bots_util::_id_1636( self._id_04A7 );
                    var_7 = _func_0E3( var_6 / 2 );

                    if ( var_2 < 5000 )
                        var_7 = _func_0E3( var_6 / 3 );

                    var_8 = _id_1638( level._id_A3DD );

                    if ( var_8 + 1 > var_7 )
                        var_0 = _id_16F6();
                }
            }
        }

        var_9 = level._id_A3DD;

        if ( isdefined( var_0 ) && var_0 )
            var_9 = level._id_A3F6[( level._id_6F7B + 1 ) % level._id_A3F6.size];

        if ( !_id_165C( var_9 ) )
            _id_15D0( var_9 );
    }
}

_id_16F6()
{
    if ( level._id_7130 )
        return 0;
    else
    {
        var_0 = self _meth_8379( "strategyLevel" );
        var_1 = 0;

        if ( var_0 == 1 )
            var_1 = 0.1;
        else if ( var_0 == 2 )
            var_1 = 0.5;
        else if ( var_0 == 3 )
            var_1 = 0.8;

        return _func_0B3( 1.0 ) < var_1;
    }
}

_id_1638( var_0 )
{
    return _id_163E( var_0 ).size;
}

_id_163E( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_669D )
    {
        if ( var_3 != self && maps\mp\_utility::_id_51CE( var_3 ) && isalliedsentient( self, var_3 ) )
        {
            if ( var_3 _meth_80AB( level._id_A3DD._id_9754 ) )
            {
                if ( !_func_0CF( var_3 ) || var_3 _id_165C( var_0 ) )
                    var_1[var_1.size] = var_3;
            }
        }
    }

    return var_1;
}

_id_165C( var_0 )
{
    if ( !maps\mp\bots\_bots_util::_id_165A() )
        return 0;

    return self._id_2507 == var_0;
}

_id_15D0( var_0 )
{
    self._id_2507 = var_0;
    var_1["entrance_points_index"] = var_0._id_3320;
    var_1["override_origin_node"] = var_0._id_1C10;
    maps\mp\bots\_bots_strategy::_id_15D2( var_0._id_02E2, var_0._id_6139, var_0._id_9754, var_1 );
}

_id_847D( var_0 )
{
    if ( var_0 )
    {
        var_1 = level._id_A3DD._id_3BF8 maps\mp\gametypes\_gameobjects::_id_4078();

        if ( var_1 == "neutral" || var_1 == self._id_04A7 )
            return 0;
    }

    return maps\mp\bots\_bots_strategy::_id_847B( var_0 );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_167A()
{
    var_0 = gettime();

    if ( !isdefined( level._id_5383 ) )
    {
        _id_16CC( "radar_mp", ::_id_167B, ::bot_can_use_uav );
        _id_16CC( "airstrike_mp", ::_id_166A, ::bot_can_use_airstrike );
        _id_16CC( "helicopter_mp", ::_id_167B, ::bot_can_use_helicopter );
    }
}

_id_16CC( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_5383 ) )
        level._id_5383 = [];

    level._id_5383[var_0] = var_1;

    if ( !isdefined( level._id_5382 ) )
        level._id_5382 = [];

    level._id_5382[var_0] = var_2;

    if ( !isdefined( level._id_5384 ) )
        level._id_5384 = [];

    level._id_5384[var_0] = var_3;

    if ( !isdefined( level._id_1707 ) )
        level._id_1707 = [];

    level._id_1707[level._id_1707.size] = var_0;
}

_id_1713()
{
    self notify( "bot_think_killstreak" );
    self endon( "bot_think_killstreak" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_5383 ) )
        wait 0.05;

    for (;;)
    {
        wait(_func_0B5( 2.0, 4.0 ));

        if ( maps\mp\bots\_bots_util::_id_15AB() )
        {
            var_0 = self._id_0308["hardPointItem"];

            if ( isdefined( var_0 ) )
            {
                if ( isdefined( self._id_167C ) && isdefined( self._id_167C[var_0] ) && gettime() < self._id_167C[var_0] )
                    continue;

                var_1 = level._id_5382[var_0];

                if ( isdefined( var_1 ) && !self [[ var_1 ]]( var_0 ) )
                    continue;

                var_2 = level._id_5383[var_0];

                if ( isdefined( var_2 ) )
                {
                    var_3 = self [[ var_2 ]]( var_0, var_1 );

                    if ( !isdefined( var_3 ) || var_3 == 0 )
                    {
                        if ( !isdefined( self._id_167C ) )
                            self._id_167C = [];

                        self._id_167C[var_0] = gettime() + 5000;
                    }
                }
                else
                {

                }
            }
        }
    }
}

_id_1677()
{

}

_id_166B( var_0 )
{
    return 0;
}

bot_can_use_uav( var_0 )
{
    if ( !maps\mp\gametypes\_hardpoints::playerhasuavactive() )
        return 1;

    return 0;
}

bot_can_use_airstrike( var_0 )
{
    if ( isdefined( level._id_099C ) )
        return 0;

    return 1;
}

bot_can_use_helicopter( var_0 )
{
    if ( isdefined( level._id_1D48 ) )
        return 0;

    return 1;
}

_id_167B( var_0, var_1 )
{
    wait(_func_0B4( 3, 5 ));

    if ( !maps\mp\bots\_bots_util::_id_15AB() )
        return 1;

    if ( isdefined( var_1 ) && !self [[ var_1 ]]( var_0 ) )
        return 0;

    _id_1708( var_0 );
    return 1;
}

_id_1708( var_0 )
{
    self _meth_8312( var_0 );
}

bot_killstreak_get_zone_enemies()
{
    var_0 = [];

    foreach ( var_2 in level._id_0323 )
    {
        if ( !isalliedsentient( self, var_2 ) && _func_1A1( var_2 ) )
            var_0[var_0.size] = var_2;
    }

    var_4 = [];

    for ( var_5 = 0; var_5 < level._id_A3EF; var_5++ )
        var_4[var_5] = [];

    foreach ( var_7 in var_0 )
    {
        var_8 = var_7 _meth_8385();

        if ( !isdefined( var_8 ) )
        {
            var_9 = _func_0C7( var_7._id_02E2, 256, 0 );

            if ( var_9.size > 0 )
                var_8 = var_9[0];
        }

        if ( isdefined( var_8 ) )
        {
            var_10 = _func_20B( var_8 );
            var_4[var_10] = common_scripts\utility::_id_0CDA( var_4[var_10], var_7 );
        }
    }

    return var_4;
}

_id_166A( var_0, var_1 )
{
    wait(_func_0B4( 3, 5 ));

    if ( !maps\mp\bots\_bots_util::_id_15AB() )
        return;

    var_2 = _func_207( self._id_02E2 );

    if ( !isdefined( var_2 ) )
        return;

    if ( isdefined( var_1 ) && !self [[ var_1 ]]( var_0 ) )
        return 0;

    self _meth_834F( "disable_movement", 1 );
    _id_1708( var_0 );
    wait 2.0;

    if ( !isdefined( self._id_7C6F ) )
    {
        self _meth_834F( "disable_movement", 0 );
        return;
    }

    var_3 = _func_0BE( level._id_1698[0] - level._id_169C );
    var_4 = _func_0BE( level._id_1698[0] - level._id_1699 );
    var_5 = _func_0BE( level._id_1698[1] - level._id_169D );
    var_6 = _func_0BE( level._id_1698[1] - level._id_169A );
    var_7 = ( var_3 + var_4 + var_5 + var_6 ) / 4.0;
    var_8 = bot_killstreak_get_zone_enemies();
    var_9 = [];
    var_10 = [];

    for ( var_11 = 0; var_11 < level._id_A3EF; var_11++ )
    {
        if ( var_11 != var_2 && _func_1FC( var_11 ) < 0.25 )
        {
            var_12 = spawnstruct();
            var_12.zonenum = var_11;
            var_12.disttomapcenter = _func_0EE( level._id_1698, _func_20A( var_11 ) );
            var_13 = [];
            var_14 = var_8[var_11];

            foreach ( var_16 in var_14 )
            {
                if ( maps\mp\gametypes\_hardpoints::playerhasuavactive() )
                {
                    var_13[var_13.size] = var_16;
                    continue;
                }

                if ( isdefined( var_16._id_55D9 ) && gettime() - var_16._id_55D9 < 1500 )
                {
                    if ( !_func_2FB( var_16 _meth_830E() ) )
                        var_13[var_13.size] = var_16;
                }
            }

            var_12.enemieslist = var_13;

            if ( var_13.size > 0 )
                var_9[var_9.size] = var_12;

            var_10[var_10.size] = var_12;
        }
    }

    foreach ( var_19 in var_10 )
    {
        var_20 = var_19.enemieslist.size * 100;
        var_21 = _func_0E9( 1.0 - var_19.disttomapcenter / var_7, 0.0, 1.0 );
        var_20 += var_21 * 100;
        var_19._id_0523 = var_20;
    }

    var_23 = var_9;

    if ( var_23.size == 0 )
        var_23 = var_10;

    var_24 = 0;

    foreach ( var_19 in var_23 )
        var_24 += var_19._id_0523;

    if ( var_24 > 0 )
    {
        var_27 = _func_0B3( var_24 );
        var_28 = undefined;

        for ( var_29 = 0; var_27 >= 0; var_29++ )
        {
            var_28 = var_23[var_29];
            var_27 -= var_28._id_0523;
        }

        var_14 = var_28.enemieslist;
        var_30 = _func_20A( var_28.zonenum );

        foreach ( var_16 in var_14 )
            var_30 += var_16._id_02E2;

        var_30 /= ( var_14.size + 1 );
        var_33 = undefined;
        var_34 = _func_0C7( var_30, 256, 0 );

        if ( var_34.size > 0 )
        {
            var_33 = self _meth_8362( var_34, var_34.size * 0.25, "node_traffic" );
            var_35 = var_34[0]._id_02E2;
        }

        if ( isdefined( var_33 ) )
            var_35 = var_33._id_02E2;
        else
            var_35 = var_30;
    }
    else
        var_35 = _func_20A( _func_0B2( level._id_A3EF ) );

    self notify( "confirm_location", var_35 );
    self waittill( "stop_location_selection" );
    wait 1.0;
    self _meth_834F( "disable_movement", 0 );
}

_id_1718()
{
    self notify( "bot_think_watch_aerial_killstreak" );
    self endon( "bot_think_watch_aerial_killstreak" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( level._id_552D ) )
        level._id_552D = -10000;

    if ( !isdefined( level._id_5387 ) )
    {
        level._id_5387["allies"] = [];
        level._id_5387["axis"] = [];
    }

    if ( !isdefined( level._id_0886 ) )
    {
        level._id_0886["allies"] = 0;
        level._id_0886["axis"] = 0;
    }

    var_0 = 0;
    var_1 = _func_0B5( 0.05, 4.0 );

    for (;;)
    {
        wait(var_1);
        var_1 = _func_0B5( 0.05, 4.0 );

        if ( maps\mp\bots\_bots_util::_id_1664() )
            continue;

        if ( self _meth_8379( "strategyLevel" ) == 0 )
            continue;

        var_2 = 0;
        var_3 = get_enemy_helicopter( self._id_04A7 );

        if ( isdefined( var_3 ) )
        {
            var_2 = 1;

            if ( !_id_1660( var_3 ) )
                childthread _id_5D60( var_3 );
        }

        if ( enemy_airstrike_exists( self._id_04A7 ) )
        {
            if ( level._id_91EB )
                _id_988C( "airstrike", ::enemy_airstrike_exists );

            var_2 = 1;
        }

        if ( !var_0 && var_2 )
        {
            var_0 = 1;
            self _meth_834F( "hide_indoors", 1 );
        }

        if ( var_0 && !var_2 )
        {
            var_0 = 0;
            self _meth_834F( "hide_indoors", 0 );
        }

        level._id_0886[self._id_04A7] = var_2;
    }
}

_id_1660( var_0 )
{
    if ( !isdefined( self._id_0887 ) )
        return 0;

    return common_scripts\utility::_id_0CE4( self._id_0887, var_0 );
}

_id_5D60( var_0 )
{
    if ( !isdefined( self._id_0887 ) )
        self._id_0887 = [];

    self._id_0887[self._id_0887.size] = var_0;
    var_1 = _func_114( ( var_0._id_02E2 - self._id_02E2 ) * ( 1, 1, 0 ) );

    while ( _func_1A1( var_0 ) )
    {
        var_2 = _func_114( ( var_0._id_02E2 - self._id_02E2 ) * ( 1, 1, 0 ) );
        var_3 = _func_0F6( var_1, var_2 );

        if ( var_3 <= 0 )
        {
            var_1 = var_2;
            self notify( "defend_force_node_recalculation" );
        }

        wait 0.05;
    }

    self._id_0887 = common_scripts\utility::_id_0CF6( self._id_0887, var_0 );
}

_id_988C( var_0, var_1 )
{
    if ( !isdefined( level._id_5387[self._id_04A7][var_0] ) )
        level._id_5387[self._id_04A7][var_0] = 0;

    if ( !level._id_5387[self._id_04A7][var_0] )
    {
        level._id_5387[self._id_04A7][var_0] = 1;
        level thread _id_5D95( self._id_04A7, var_0, var_1 );
    }
}

_id_5D95( var_0, var_1, var_2 )
{
    var_3 = 0.5;

    while ( [[ var_2 ]]( var_0 ) )
    {
        if ( gettime() > level._id_552D + 4000 )
        {
            _func_213( "", 5.0, var_0, "only_sky" );
            level._id_552D = gettime();
        }

        wait(var_3);
    }

    level._id_5387[var_0][var_1] = 0;
}

get_enemy_helicopter( var_0 )
{
    if ( isdefined( level._id_1D48 ) )
    {
        if ( level._id_91EB )
        {
            if ( level._id_1D48._id_04A7 != var_0 )
                return level._id_1D48;
        }
        else if ( level._id_1D48._id_02E5 != self )
            return level._id_1D48;
    }

    return undefined;
}

enemy_airstrike_exists( var_0 )
{
    if ( isdefined( level._id_0D33 ) )
    {
        foreach ( var_2 in level._id_0D33 )
        {
            if ( level._id_91EB )
            {
                if ( var_2._id_04A7 != var_0 )
                    return 1;

                continue;
            }

            return 1;
        }
    }

    return 0;
}

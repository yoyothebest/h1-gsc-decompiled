// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    bot_sab_start();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::bot_sab_think;
    level._id_161B["notify_enemy_bots_bomb_used"] = ::_id_6206;
}

bot_sab_start()
{
    if ( maps\mp\_utility::_id_5092( game["tiebreaker"] ) )
    {
        maps\mp\bots\_bots_gametype_war::main();
        return;
    }

    setup_bot_sab();
}

setup_bot_sab()
{
    maps\mp\bots\_bots_gametype_common::_id_16F1();
    maps\mp\bots\_bots_util::_id_172D();
    var_0 = maps\mp\bots\_bots_gametype_common::bot_verify_and_cache_bombzones( [ "_allies", "_axis" ] );

    if ( var_0 )
    {
        foreach ( var_2 in level._id_1555 )
            var_2 thread maps\mp\bots\_bots_gametype_common::monitor_bombzone_control();

        level._id_703F = 600;
        level._id_1628 = 1;
    }
}

bot_sab_think()
{
    self notify( "bot_sab_think" );
    self endon( "bot_sab_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "owner_disconnect" );

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self _meth_834F( "separation", 0 );
    self _meth_834F( "grenade_objectives", 1 );
    var_0 = undefined;
    var_1 = _func_0B2( 100 ) < self _meth_8379( "strategyLevel" ) * 25;
    var_2 = ( 0, 0, 0 );
    self._id_27BC = 0;

    for (;;)
    {
        wait 0.05;

        if ( !level._id_1545 )
        {
            var_3 = bot_sab_get_bomb_carrier();

            if ( !isdefined( var_3 ) || var_3._id_04A7 == self._id_04A7 )
                var_0 = undefined;

            if ( !isdefined( var_3 ) )
            {
                if ( maps\mp\bots\_bots_util::_id_165D() )
                    maps\mp\bots\_bots_strategy::_id_15EF();

                self _meth_8352( level._id_7749._id_24C8, 16, "critical" );
            }
            else if ( var_3 == self )
            {
                var_4 = level._id_1555[common_scripts\utility::_id_3D4F( self._id_04A7 )];
                clear_non_tactical_goal();
                plant_bomb( var_4 );
            }
            else if ( var_3._id_04A7 == self._id_04A7 )
            {
                if ( !maps\mp\bots\_bots_util::_id_165F( var_3 ) )
                {
                    clear_non_tactical_goal();
                    maps\mp\bots\_bots_strategy::_id_1646( var_3, 400 );
                }
            }
            else if ( gettime() > level._id_7749._id_5588 )
            {
                var_5 = level._id_1555[self._id_04A7];

                if ( !isdefined( var_0 ) )
                {
                    var_6 = _func_0EE( self._id_02E2, level._id_7749._id_24C8 );
                    var_7 = _func_0EE( self._id_02E2, var_5._id_24C8 );

                    if ( _func_0B3( 1.0 ) < 0.75 || var_6 < var_7 )
                        var_0 = "hunt_carrier";
                    else
                        var_0 = "defend_zone";

                    if ( maps\mp\bots\_bots_util::_id_165D() )
                        maps\mp\bots\_bots_strategy::_id_15EF();

                    clear_non_tactical_goal();
                }

                if ( var_0 == "hunt_carrier" )
                {
                    if ( !maps\mp\bots\_bots_util::_id_172A( var_2, level._id_7749._id_24C8 ) )
                    {
                        var_2 = level._id_7749._id_24C8;
                        var_8 = var_2 - ( 0, 0, 75 );
                        var_9 = var_1 && _func_0EE( var_8, var_5._id_24C8 ) > level._id_703F;

                        if ( var_9 )
                        {
                            var_10 = undefined;
                            var_11 = _func_205( var_8, common_scripts\utility::_id_710E( var_5._id_174F )._id_02E2 );

                            if ( isdefined( var_11 ) && var_11.size > 0 )
                                var_10 = var_11[_func_0BC( var_11.size * _func_0B5( 0.25, 0.75 ) )]._id_02E2;

                            if ( isdefined( var_10 ) && maps\mp\bots\_bots_personality::_id_3753( var_10, 512 ) )
                                self _meth_8353( self._id_6121, "guard", self._id_0B68 );
                            else
                                var_9 = 0;
                        }

                        if ( !var_9 )
                            self _meth_8352( var_8, 32, "guard" );
                    }
                }
                else if ( var_0 == "defend_zone" )
                {
                    if ( !bot_is_protecting_point( var_5._id_24C8 ) )
                    {
                        var_12["score_flags"] = "strict_los";
                        var_12["override_origin_node"] = common_scripts\utility::_id_710E( var_5._id_174F );
                        maps\mp\bots\_bots_strategy::_id_16C2( var_5._id_24C8, level._id_703F, var_12 );
                    }
                }
            }

            continue;
        }

        var_13 = bot_sab_get_zone_planted_on();

        if ( var_13._id_663A != self._id_04A7 )
        {
            if ( !bot_is_protecting_point( level._id_7749._id_24C8 ) )
            {
                var_12["score_flags"] = "strongly_avoid_center";
                maps\mp\bots\_bots_strategy::_id_16C2( level._id_7749._id_24C8, level._id_703F, var_12 );
            }
        }
        else
        {
            var_14 = bot_sab_get_bomb_defuser();

            if ( !isdefined( var_14 ) )
                self._id_759A = "defuser";
            else if ( _func_0CF( var_14 ) )
            {
                var_15 = _func_0EE( self._id_02E2, var_13._id_24C8 );
                var_16 = _func_0EE( var_14._id_02E2, var_13._id_24C8 );

                if ( var_15 < var_16 * 0.9 )
                {
                    self._id_759A = "defuser";
                    var_14 bot_sab_clear_role();
                }
            }

            if ( isdefined( self._id_759A ) && self._id_759A == "defuser" )
                defuse_bomb( var_13 );
            else if ( !bot_is_protecting_point( var_13._id_24C8 ) )
            {
                var_12["min_goal_time"] = 2;
                var_12["max_goal_time"] = 4;
                var_12["override_origin_node"] = common_scripts\utility::_id_710E( var_13._id_174F );
                maps\mp\bots\_bots_strategy::_id_16C2( var_13._id_24C8, level._id_703F, var_12 );
            }
        }
    }
}

_id_3E56()
{
    if ( level._id_1545 )
        return level._id_27BB;
    else
        return gettime() + maps\mp\gametypes\_gamelogic::_id_4131();
}

clear_non_tactical_goal()
{
    if ( self _meth_835B() != "tactical" )
        self _meth_8354();
}

plant_bomb( var_0 )
{
    self endon( "change_role" );
    var_1 = maps\mp\bots\_bots_gametype_common::get_bombzone_node_to_plant_on( var_0, 0 );
    self _meth_8352( var_1._id_02E2, 0, "critical" );
    var_2 = maps\mp\bots\_bots_util::_id_172E( undefined, "change_role" );

    if ( var_2 == "goal" )
    {
        var_3 = _id_3E56() - gettime();
        var_4 = var_3 - level._id_688D * 2 * 1000;
        var_5 = gettime() + var_4;

        if ( var_4 > 0 )
            maps\mp\bots\_bots_util::_id_172F( var_4 );

        var_6 = var_5 > 0 && gettime() >= var_5;
        var_7 = maps\mp\bots\_bots_gametype_common::bombzone_press_use( level._id_688D + 2, "bomb_planted", var_6 );
        clear_non_tactical_goal();
    }
}

defuse_bomb( var_0 )
{
    self endon( "change_role" );
    self _meth_8377( "scripted" );
    var_1 = maps\mp\bots\_bots_gametype_common::get_bombzone_node_to_defuse_on( var_0 )._id_02E2;
    self _meth_8352( var_1, 20, "critical" );
    var_2 = maps\mp\bots\_bots_util::_id_172E( undefined, "change_role" );

    if ( var_2 == "bad_path" )
    {
        self._id_27BC++;

        if ( self._id_27BC >= 4 )
        {
            for (;;)
            {
                var_3 = _func_0C7( var_1, 50, 0 );
                var_4 = self._id_27BC - 4;

                if ( var_3.size <= var_4 )
                {
                    var_5 = _func_202( var_1, 50, self );

                    if ( isdefined( var_5 ) )
                        self _meth_8352( var_5, 20, "critical" );
                    else
                        break;
                }
                else
                    self _meth_8352( var_3[var_4]._id_02E2, 20, "critical" );

                var_2 = maps\mp\bots\_bots_util::_id_172E( undefined, "change_role" );

                if ( var_2 == "bad_path" )
                {
                    self._id_27BC++;
                    continue;
                }

                break;
            }
        }
    }

    if ( var_2 == "goal" )
    {
        var_6 = _id_3E56() - gettime();
        var_7 = var_6 - level._id_27BF * 2 * 1000;
        var_8 = gettime() + var_7;

        if ( var_7 > 0 )
            maps\mp\bots\_bots_util::_id_172F( var_7 );

        var_9 = var_8 > 0 && gettime() >= var_8;
        var_10 = maps\mp\bots\_bots_gametype_common::bombzone_press_use( level._id_27BF + 2, "bomb_defused", var_9 );

        if ( !var_10 && self._id_27BC >= 4 )
            self._id_27BC++;

        clear_non_tactical_goal();

        if ( var_10 )
            bot_sab_clear_role();
    }
}

bot_sab_clear_role()
{
    self._id_759A = undefined;
    clear_non_tactical_goal();
    self _meth_8377( undefined );
    maps\mp\bots\_bots_strategy::_id_15EF();
    self notify( "change_role" );
    self._id_27BC = 0;
}

bot_is_protecting_point( var_0 )
{
    return maps\mp\bots\_bots_util::_id_1662() && maps\mp\bots\_bots_util::_id_165E( var_0 );
}

bot_sab_get_bomb_carrier()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( maps\mp\_utility::_id_5189( var_1 ) && maps\mp\_utility::_id_5092( var_1._id_50C8 ) )
            return var_1;
    }
}

bot_sab_get_bomb_defuser()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( maps\mp\_utility::_id_5189( var_1 ) && !_func_0CF( var_1 ) )
        {
            if ( var_1._id_50EF )
                return var_1;
        }
    }

    foreach ( var_1 in level._id_0323 )
    {
        if ( maps\mp\_utility::_id_5189( var_1 ) && _func_0CF( var_1 ) )
        {
            if ( isdefined( var_1._id_759A ) && var_1._id_759A == "defuser" )
                return var_1;
        }
    }

    return undefined;
}

bot_sab_get_zone_planted_on()
{
    foreach ( var_1 in level._id_1555 )
    {
        if ( var_1.bombplantedon )
            return var_1;
    }
}

_id_6206( var_0 )
{
    var_1 = maps\mp\bots\_bots_gametype_common::get_ai_hearing_bomb_plant_sound( var_0 );
    var_2 = maps\mp\bots\_bots_gametype_common::_id_3759( self );

    foreach ( var_4 in var_1 )
        var_4 thread investigate_someone_using_bomb( var_2 );
}

investigate_someone_using_bomb( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    self _meth_8353( common_scripts\utility::_id_710E( var_0._id_174F ), "critical" );
    var_1 = maps\mp\bots\_bots_util::_id_172E();

    if ( var_1 == "goal" )
    {
        wait 2;
        clear_non_tactical_goal();
    }
}

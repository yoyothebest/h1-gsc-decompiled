// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    bot_dd_start();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::bot_dd_think;
    level._id_161B["notify_enemy_bots_bomb_used"] = ::_id_6206;
}

bot_dd_start()
{
    setup_bot_dd();
}

setup_bot_dd()
{
    maps\mp\bots\_bots_gametype_common::_id_16F1();
    maps\mp\bots\_bots_util::_id_172D();
    var_0 = maps\mp\bots\_bots_gametype_common::bot_verify_and_cache_bombzones( [ "_a", "_b" ] );

    if ( var_0 )
    {
        foreach ( var_2 in level._id_1555 )
            var_2 thread maps\mp\bots\_bots_gametype_common::monitor_bombzone_control();

        thread bot_dd_ai_director_update();
        level._id_1628 = 1;
    }
}

bot_dd_think()
{
    self notify( "bot_dd_think" );
    self endon( "bot_dd_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "owner_disconnect" );

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self _meth_834F( "separation", 0 );
    self _meth_834F( "grenade_objectives", 1 );
    self.current_bombzone = undefined;
    self._id_27BC = 0;

    for (;;)
    {
        wait 0.05;

        if ( isdefined( self.current_bombzone ) && !bombzone_is_active( self.current_bombzone ) )
        {
            self.current_bombzone = undefined;
            bot_dd_clear_role();
        }

        if ( maps\mp\_utility::_id_4E3F() )
            var_0 = level._id_1555[0]._id_663A != self._id_04A7;
        else
            var_0 = self._id_04A7 == game["attackers"];

        if ( var_0 )
        {
            bot_pick_new_zone( "attack" );

            if ( !isdefined( self.current_bombzone ) )
                continue;

            bot_try_switch_attack_zone();
            bot_choose_attack_role();

            if ( self._id_759A == "sweep_zone" )
            {
                if ( !maps\mp\bots\_bots_util::_id_165E( self.current_bombzone._id_24C8 ) )
                {
                    var_1["min_goal_time"] = 2;
                    var_1["max_goal_time"] = 4;
                    var_1["override_origin_node"] = common_scripts\utility::_id_710E( self.current_bombzone._id_174F );
                    maps\mp\bots\_bots_strategy::_id_16C2( self.current_bombzone._id_24C8, level._id_703F, var_1 );
                }
            }
            else if ( self._id_759A == "defend_zone" )
            {
                if ( !maps\mp\bots\_bots_util::_id_165E( level.ddbombmodel[self.current_bombzone._id_0241]._id_02E2 ) )
                {
                    var_1["score_flags"] = "strongly_avoid_center";
                    maps\mp\bots\_bots_strategy::_id_16C2( level.ddbombmodel[self.current_bombzone._id_0241]._id_02E2, level._id_703F, var_1 );
                }
            }
            else if ( self._id_759A == "investigate_someone_using_bomb" )
                investigate_someone_using_bomb();
            else if ( self._id_759A == "atk_bomber" )
                plant_bomb();

            continue;
        }

        bot_pick_new_zone( "defend" );

        if ( !isdefined( self.current_bombzone ) )
            continue;

        bot_choose_defend_role();

        if ( self._id_759A == "defend_zone" )
        {
            if ( !maps\mp\bots\_bots_util::_id_165E( self.current_bombzone._id_24C8 ) )
            {
                var_1["score_flags"] = "strict_los";
                var_1["override_origin_node"] = common_scripts\utility::_id_710E( self.current_bombzone._id_174F );
                maps\mp\bots\_bots_strategy::_id_16C2( self.current_bombzone._id_24C8, level._id_703F, var_1 );
            }

            continue;
        }

        if ( self._id_759A == "investigate_someone_using_bomb" )
        {
            investigate_someone_using_bomb();
            continue;
        }

        if ( self._id_759A == "defuser" )
            defuse_bomb();
    }
}

_id_6206( var_0 )
{
    var_1 = maps\mp\bots\_bots_gametype_common::_id_3759( self );
    var_2 = maps\mp\bots\_bots_gametype_common::get_ai_hearing_bomb_plant_sound( var_0 );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4.current_bombzone ) && var_1 == var_4.current_bombzone )
            var_4 bot_dd_set_role( "investigate_someone_using_bomb" );
    }
}

plant_bomb()
{
    self endon( "change_role" );
    var_0 = maps\mp\bots\_bots_gametype_common::get_bombzone_node_to_plant_on( self.current_bombzone, 0 );
    self _meth_8352( var_0._id_02E2, 0, "critical" );
    var_1 = maps\mp\bots\_bots_util::_id_172E( undefined, "change_role" );

    if ( var_1 == "goal" )
    {
        var_2 = maps\mp\gametypes\_gamelogic::_id_4131();
        var_3 = var_2 - level._id_688D * 2 * 1000;
        var_4 = gettime() + var_3;

        if ( var_3 > 0 )
            maps\mp\bots\_bots_util::_id_172F( var_3 );

        var_5 = var_4 > 0 && gettime() >= var_4;
        var_6 = maps\mp\bots\_bots_gametype_common::bombzone_press_use( level._id_688D + 2, "bomb_planted", var_5 );
        self _meth_8354();

        if ( var_6 )
            bot_dd_clear_role();
    }
}

defuse_bomb()
{
    self endon( "change_role" );
    self _meth_8377( "scripted" );
    var_0 = maps\mp\bots\_bots_gametype_common::get_bombzone_node_to_defuse_on( self.current_bombzone )._id_02E2;
    self _meth_8352( var_0, 20, "critical" );
    var_1 = maps\mp\bots\_bots_util::_id_172E( undefined, "change_role" );

    if ( var_1 == "bad_path" )
    {
        self._id_27BC++;

        if ( self._id_27BC >= 4 )
        {
            for (;;)
            {
                var_2 = _func_0C7( var_0, 50, 0 );
                var_3 = self._id_27BC - 4;

                if ( var_2.size <= var_3 )
                {
                    var_4 = _func_202( var_0, 50, self );

                    if ( isdefined( var_4 ) )
                        self _meth_8352( var_4, 20, "critical" );
                    else
                        break;
                }
                else
                    self _meth_8352( var_2[var_3]._id_02E2, 20, "critical" );

                var_1 = maps\mp\bots\_bots_util::_id_172E( undefined, "change_role" );

                if ( var_1 == "bad_path" )
                {
                    self._id_27BC++;
                    continue;
                }

                break;
            }
        }
    }

    if ( var_1 == "goal" )
    {
        var_5 = self.current_bombzone.waittime * 1000;
        var_6 = var_5 - level._id_27BF * 2 * 1000;
        var_7 = gettime() + var_6;

        if ( var_6 > 0 )
            maps\mp\bots\_bots_util::_id_172F( var_6 );

        var_8 = var_7 > 0 && gettime() >= var_7;
        var_9 = maps\mp\bots\_bots_gametype_common::bombzone_press_use( level._id_27BF + 2, "bomb_defused", var_8 );

        if ( !var_9 && self._id_27BC >= 4 )
            self._id_27BC++;

        self _meth_8354();

        if ( var_9 )
            bot_dd_clear_role();
    }
}

investigate_someone_using_bomb()
{
    self endon( "change_role" );

    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    self _meth_8353( common_scripts\utility::_id_710E( self.current_bombzone._id_174F ), "critical" );
    var_0 = maps\mp\bots\_bots_util::_id_172E();

    if ( var_0 == "goal" )
    {
        wait 2;
        bot_dd_clear_role();
    }
}

get_player_defusing_zone( var_0 )
{
    var_1 = get_players_at_zone( var_0, self._id_04A7 );

    foreach ( var_3 in var_1 )
    {
        if ( !_func_0CF( var_3 ) )
        {
            if ( var_3._id_50EF )
                return var_3;
        }
    }

    foreach ( var_3 in var_1 )
    {
        if ( _func_0CF( var_3 ) )
        {
            if ( isdefined( var_3._id_759A ) && var_3._id_759A == "defuser" )
                return var_3;
        }
    }

    return undefined;
}

get_player_planting_zone( var_0 )
{
    var_1 = get_players_at_zone( var_0, self._id_04A7 );

    foreach ( var_3 in var_1 )
    {
        if ( !_func_0CF( var_3 ) )
        {
            if ( var_3._id_5174 )
                return var_3;
        }
    }

    foreach ( var_3 in var_1 )
    {
        if ( _func_0CF( var_3 ) )
        {
            if ( isdefined( var_3._id_759A ) && var_3._id_759A == "atk_bomber" )
                return var_3;
        }
    }

    return undefined;
}

bombzone_is_active( var_0 )
{
    if ( var_0._id_9E5B == "any" )
        return 1;

    return 0;
}

get_active_bombzones()
{
    var_0 = [];

    foreach ( var_2 in level._id_1555 )
    {
        if ( bombzone_is_active( var_2 ) )
            var_0[var_0.size] = var_2;
    }

    return var_0;
}

get_players_at_zone( var_0, var_1 )
{
    var_2 = [];
    var_3 = maps\mp\bots\_bots_gametype_common::_id_3DC9( var_1 );

    foreach ( var_5 in var_3 )
    {
        if ( _func_0CF( var_5 ) )
        {
            if ( isdefined( var_5.current_bombzone ) && var_5.current_bombzone == var_0 )
                var_2 = common_scripts\utility::_id_0CDA( var_2, var_5 );

            continue;
        }

        if ( _func_0F0( var_5._id_02E2, var_0._id_24C8 ) < level._id_703F * level._id_703F )
            var_2 = common_scripts\utility::_id_0CDA( var_2, var_5 );
    }

    return var_2;
}

bot_pick_dd_zone_with_fewer_defenders( var_0, var_1 )
{
    var_2[0] = get_players_at_zone( var_0[0], game["defenders"] ).size;
    var_2[1] = get_players_at_zone( var_0[1], game["defenders"] ).size;

    if ( var_2[0] > var_2[1] + var_1 )
        return var_0[1];
    else if ( var_2[0] + var_1 < var_2[1] )
        return var_0[0];
}

bot_pick_new_zone( var_0 )
{
    var_1 = undefined;

    if ( var_0 == "attack" )
        var_1 = bot_choose_attack_zone();
    else if ( var_0 == "defend" )
        var_1 = bot_choose_defend_zone();

    if ( isdefined( var_1 ) && ( !isdefined( self.current_bombzone ) || self.current_bombzone != var_1 ) )
    {
        self.current_bombzone = var_1;
        bot_dd_clear_role();
    }
}

bot_choose_defend_zone()
{
    var_0 = get_active_bombzones();
    var_1 = undefined;

    if ( var_0.size == 1 )
        var_1 = var_0[0];
    else if ( var_0.size == 2 )
    {
        var_2[0] = get_players_at_zone( var_0[0], game["defenders"] ).size;
        var_2[1] = get_players_at_zone( var_0[1], game["defenders"] ).size;
        var_3[0] = is_bomb_planted_on( var_0[0] );
        var_3[1] = is_bomb_planted_on( var_0[1] );

        if ( var_3[0] && var_3[1] || !var_3[0] && !var_3[1] )
        {
            var_4 = 0;

            if ( isdefined( self.current_bombzone ) )
                var_4 = 1;

            var_1 = bot_pick_dd_zone_with_fewer_defenders( var_0, var_4 );

            if ( !isdefined( var_1 ) && !isdefined( self.current_bombzone ) )
                var_1 = common_scripts\utility::_id_710E( var_0 );
        }
        else if ( var_3[0] || var_3[1] )
        {
            var_5 = common_scripts\utility::_id_9294( var_3[0], 0, 1 );
            var_6 = common_scripts\utility::_id_9294( !var_3[0], 0, 1 );

            if ( var_2[var_5] > var_2[var_6] + 2 )
                var_1 = var_0[var_6];
            else if ( var_2[var_5] <= var_2[var_6] )
                var_1 = var_0[var_5];
            else if ( !isdefined( self.current_bombzone ) )
            {
                if ( var_2[var_5] >= var_2[var_6] + 2 )
                    var_1 = var_0[var_6];
                else if ( var_2[var_5] < var_2[var_6] + 2 )
                    var_1 = var_0[var_5];
            }
        }
    }

    return var_1;
}

get_other_active_zone( var_0 )
{
    var_1 = get_active_bombzones();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 != var_0 )
            return var_3;
    }
}

bot_choose_attack_zone()
{
    if ( isdefined( self.current_bombzone ) )
        return;

    if ( !isdefined( level.current_zone_target ) || !bombzone_is_active( level.current_zone_target ) || gettime() > level.next_target_switch_time )
    {
        level.next_target_switch_time = gettime() + 1000 * _func_0B4( 30, 45 );
        level.current_zone_target = common_scripts\utility::_id_710E( get_active_bombzones() );
    }

    if ( !isdefined( level.current_zone_target ) )
        return;

    var_0 = level.current_zone_target;
    var_1 = get_other_active_zone( var_0 );
    self.current_bombzone = undefined;

    if ( isdefined( var_1 ) )
    {
        if ( _func_0B3( 1.0 ) < 0.25 )
            return var_1;
    }

    return var_0;
}

bot_try_switch_attack_zone()
{
    var_0 = get_other_active_zone( self.current_bombzone );

    if ( isdefined( var_0 ) )
    {
        var_1 = _func_0EE( self._id_02E2, self.current_bombzone._id_24C8 );
        var_2 = _func_0EE( self._id_02E2, var_0._id_24C8 );

        if ( var_2 < var_1 * 0.6 )
            self.current_bombzone = var_0;
    }
}

bot_choose_attack_role()
{
    if ( isdefined( self._id_759A ) )
    {
        if ( self._id_759A == "investigate_someone_using_bomb" )
            return;
    }

    var_0 = undefined;

    if ( is_bomb_planted_on( self.current_bombzone ) )
        var_0 = "defend_zone";
    else
    {
        var_1 = get_player_planting_zone( self.current_bombzone );

        if ( !isdefined( var_1 ) || var_1 == self )
            var_0 = "atk_bomber";
        else if ( _func_0CF( var_1 ) )
        {
            var_2 = _func_0EE( self._id_02E2, self.current_bombzone._id_24C8 );
            var_3 = _func_0EE( var_1._id_02E2, self.current_bombzone._id_24C8 );

            if ( var_2 < var_3 * 0.9 )
            {
                var_0 = "atk_bomber";
                var_1 bot_dd_clear_role();
            }
        }
    }

    if ( !isdefined( var_0 ) )
        var_0 = "sweep_zone";

    bot_dd_set_role( var_0 );
}

bot_choose_defend_role()
{
    if ( isdefined( self._id_759A ) )
    {
        if ( self._id_759A == "investigate_someone_using_bomb" )
            return;
    }

    var_0 = undefined;

    if ( is_bomb_planted_on( self.current_bombzone ) )
    {
        var_1 = get_player_defusing_zone( self.current_bombzone );

        if ( !isdefined( var_1 ) || var_1 == self )
            var_0 = "defuser";
        else if ( _func_0CF( var_1 ) )
        {
            var_2 = _func_0EE( self._id_02E2, self.current_bombzone._id_24C8 );
            var_3 = _func_0EE( var_1._id_02E2, self.current_bombzone._id_24C8 );

            if ( var_2 < var_3 * 0.9 )
            {
                var_0 = "defuser";
                var_1 bot_dd_clear_role();
            }
        }
    }

    if ( !isdefined( var_0 ) )
        var_0 = "defend_zone";

    bot_dd_set_role( var_0 );
}

bot_dd_set_role( var_0 )
{
    if ( !isdefined( self._id_759A ) || self._id_759A != var_0 )
    {
        bot_dd_clear_role();
        self._id_759A = var_0;
    }
}

bot_dd_clear_role()
{
    self._id_759A = undefined;
    self _meth_8354();
    self _meth_8377( undefined );
    maps\mp\bots\_bots_strategy::_id_15EF();
    self notify( "change_role" );
    self._id_27BC = 0;
}

bot_dd_ai_director_update()
{
    level notify( "bot_dd_ai_director_update" );
    level endon( "bot_dd_ai_director_update" );
    level endon( "game_ended" );
    level._id_703F = 725;

    for (;;)
    {
        foreach ( var_1 in level._id_1555 )
        {
            foreach ( var_3 in level._id_0323 )
            {
                if ( isdefined( var_3._id_759A ) && isdefined( var_3.current_bombzone ) && var_3.current_bombzone == var_1 )
                {
                    if ( !bombzone_is_active( var_1 ) )
                    {
                        if ( var_3._id_759A == "atk_bomber" || var_3._id_759A == "defuser" )
                            var_3 bot_dd_clear_role();

                        continue;
                    }

                    if ( is_bomb_planted_on( var_1 ) )
                    {
                        if ( var_3._id_759A == "atk_bomber" )
                            var_3 bot_dd_clear_role();
                    }
                }
            }
        }

        wait 0.5;
    }
}

is_bomb_planted_on( var_0 )
{
    return maps\mp\_utility::_id_5092( var_0.bombplantedon );
}

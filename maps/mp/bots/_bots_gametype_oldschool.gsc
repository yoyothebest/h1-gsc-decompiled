// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

bot_oldschool_init()
{
    if ( !level.oldschool )
        return;

    while ( !isdefined( level.allpickupstracked ) )
        wait 0.05;

    level.bot_oldschool_pickup_struct_array = [];
    var_0 = getentarray( "oldschool_pickup", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_7A99 ) && var_2._id_7A99 == "bots_ignore" )
            continue;

        var_3 = spawnstruct();
        var_3._id_02E2 = var_2._id_02E2;
        var_3._id_6071 = bot_oldschool_pickup_get_nearest_node( var_2 );
        var_3._id_4411 = var_2.groundpoint;
        var_3.respawntime = var_2.respawntime;

        if ( bot_oldschool_pickup_isweapon( var_2 ) )
        {
            var_3._id_04D9 = "weapon";
            var_3._id_A2DF = bot_oldschool_pickup_get_weapon_name( var_2 );
        }
        else if ( bot_oldschool_pickup_isperk( var_2 ) )
        {
            var_3._id_04D9 = "perk";
            var_3._id_67CF = bot_oldschool_pickup_get_perk_name( var_2 );
        }

        level.bot_oldschool_pickup_struct_array[level.bot_oldschool_pickup_struct_array.size] = var_3;
    }

    maps\mp\bots\_bots_util::_id_172D();

    if ( !isdefined( level.bot_oldschool_primary_weapon_priorities ) )
    {
        level.bot_oldschool_primary_weapon_priorities["camper"] = [];
        level.bot_oldschool_primary_weapon_priorities["camper"]["pistol"] = 0;
        level.bot_oldschool_primary_weapon_priorities["camper"]["spread"] = 2;
        level.bot_oldschool_primary_weapon_priorities["camper"]["smg"] = 4;
        level.bot_oldschool_primary_weapon_priorities["camper"]["rifle"] = 6;
        level.bot_oldschool_primary_weapon_priorities["camper"]["mg"] = 8;
        level.bot_oldschool_primary_weapon_priorities["camper"]["sniper"] = 10;
        level.bot_oldschool_primary_weapon_priorities["cqb"] = [];
        level.bot_oldschool_primary_weapon_priorities["cqb"]["sniper"] = 0;
        level.bot_oldschool_primary_weapon_priorities["cqb"]["pistol"] = 0;
        level.bot_oldschool_primary_weapon_priorities["cqb"]["mg"] = 2;
        level.bot_oldschool_primary_weapon_priorities["cqb"]["rifle"] = 5;
        level.bot_oldschool_primary_weapon_priorities["cqb"]["spread"] = 10;
        level.bot_oldschool_primary_weapon_priorities["cqb"]["smg"] = 10;
        level.bot_oldschool_primary_weapon_priorities["run_and_gun"] = [];
        level.bot_oldschool_primary_weapon_priorities["run_and_gun"]["sniper"] = 0;
        level.bot_oldschool_primary_weapon_priorities["run_and_gun"]["spread"] = 0;
        level.bot_oldschool_primary_weapon_priorities["run_and_gun"]["pistol"] = 0;
        level.bot_oldschool_primary_weapon_priorities["run_and_gun"]["smg"] = 5;
        level.bot_oldschool_primary_weapon_priorities["run_and_gun"]["rifle"] = 10;
        level.bot_oldschool_primary_weapon_priorities["run_and_gun"]["mg"] = 10;
    }

    if ( !isdefined( level.bot_oldschool_secondary_weapon_priorities ) )
    {
        level.bot_oldschool_secondary_weapon_priorities["camper"] = [];
        level.bot_oldschool_secondary_weapon_priorities["camper"]["rifle"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["camper"]["mg"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["camper"]["sniper"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["camper"]["pistol"] = 5;
        level.bot_oldschool_secondary_weapon_priorities["camper"]["spread"] = 10;
        level.bot_oldschool_secondary_weapon_priorities["camper"]["smg"] = 10;
        level.bot_oldschool_secondary_weapon_priorities["cqb"] = [];
        level.bot_oldschool_secondary_weapon_priorities["cqb"]["rifle"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["cqb"]["mg"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["cqb"]["sniper"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["cqb"]["spread"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["cqb"]["smg"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["cqb"]["pistol"] = 10;
        level.bot_oldschool_secondary_weapon_priorities["run_and_gun"] = [];
        level.bot_oldschool_secondary_weapon_priorities["run_and_gun"]["rifle"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["run_and_gun"]["mg"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["run_and_gun"]["sniper"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["run_and_gun"]["spread"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["run_and_gun"]["smg"] = 0;
        level.bot_oldschool_secondary_weapon_priorities["run_and_gun"]["pistol"] = 10;
    }

    if ( !isdefined( level.bot_oldschool_pickup_memory_time_seen ) )
    {
        level.bot_oldschool_pickup_memory_time_seen["recruit"] = 10000;
        level.bot_oldschool_pickup_memory_time_seen["regular"] = 20000;
        level.bot_oldschool_pickup_memory_time_seen["hardened"] = 30000;
    }

    if ( !isdefined( level.bot_oldschool_pickup_memory_picked_up ) )
    {
        level.bot_oldschool_pickup_memory_picked_up["recruit"] = 20000;
        level.bot_oldschool_pickup_memory_picked_up["regular"] = 40000;
        level.bot_oldschool_pickup_memory_picked_up["hardened"] = 60000;
    }

    if ( !isdefined( level.bot_oldschool_pickup_close_radius_self_sq ) )
        level.bot_oldschool_pickup_close_radius_self_sq = 490000;

    if ( !isdefined( level.bot_oldschool_pickup_close_obj_radius_self_sq ) )
        level.bot_oldschool_pickup_close_obj_radius_self_sq = 250000;

    if ( !isdefined( level.bot_oldschool_pickup_close_crit_radius_self_sq ) )
        level.bot_oldschool_pickup_close_crit_radius_self_sq = 160000;

    if ( !isdefined( level.bot_oldschool_use_radius_sq ) )
        level.bot_oldschool_use_radius_sq = _func_0E8( getdvarfloat( "player_useRadius" ) );

    if ( !isdefined( level.bot_oldschool_weapon_switch_time ) )
    {
        level.bot_oldschool_weapon_switch_time["veteran"]["min"] = 0.75;
        level.bot_oldschool_weapon_switch_time["veteran"]["max"] = 0.85;
        level.bot_oldschool_weapon_switch_time["hardened"]["min"] = 0.85;
        level.bot_oldschool_weapon_switch_time["hardened"]["max"] = 1.0;
        level.bot_oldschool_weapon_switch_time["regular"]["min"] = 1.0;
        level.bot_oldschool_weapon_switch_time["regular"]["max"] = 1.25;
        level.bot_oldschool_weapon_switch_time["recruit"]["min"] = 1.25;
        level.bot_oldschool_weapon_switch_time["recruit"]["max"] = 2.0;
    }

    if ( !isdefined( level.bot_oldschool_weapon_pickup_time ) )
    {
        level.bot_oldschool_weapon_pickup_time["veteran"]["min"] = 0.5;
        level.bot_oldschool_weapon_pickup_time["veteran"]["max"] = 0.6;
        level.bot_oldschool_weapon_pickup_time["hardened"]["min"] = 0.6;
        level.bot_oldschool_weapon_pickup_time["hardened"]["max"] = 0.75;
        level.bot_oldschool_weapon_pickup_time["regular"]["min"] = 0.75;
        level.bot_oldschool_weapon_pickup_time["regular"]["max"] = 1.25;
        level.bot_oldschool_weapon_pickup_time["recruit"]["min"] = 1.25;
        level.bot_oldschool_weapon_pickup_time["recruit"]["max"] = 2.5;
    }

    if ( !isdefined( level.bot_oldschool_perk_pickup_time ) )
    {
        level.bot_oldschool_perk_pickup_time["veteran"]["min"] = 0.05;
        level.bot_oldschool_perk_pickup_time["veteran"]["max"] = 0.1;
        level.bot_oldschool_perk_pickup_time["hardened"]["min"] = 0.1;
        level.bot_oldschool_perk_pickup_time["hardened"]["max"] = 0.25;
        level.bot_oldschool_perk_pickup_time["regular"]["min"] = 0.25;
        level.bot_oldschool_perk_pickup_time["regular"]["max"] = 0.5;
        level.bot_oldschool_perk_pickup_time["recruit"]["min"] = 0.5;
        level.bot_oldschool_perk_pickup_time["recruit"]["max"] = 1.0;
    }

    level.override_find_camp_node = ::oldschool_attempt_camp_pickup;
}

bot_think_oldschool()
{
    self notify( "bot_think_oldschool" );
    self endon( "bot_think_oldschool" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !level.oldschool )
        return;

    thread bot_oldschool_track_pickups_in_sight();
    childthread bot_oldschool_handle_pickup_goals();
}

bot_oldschool_pickup_get_nearest_node( var_0 )
{
    if ( !isdefined( var_0._id_19DB ) )
    {
        var_0._id_6071 = _func_0C8( var_0._id_02E2 );

        if ( !isdefined( var_0._id_6071 ) )
            var_0._id_6071 = _func_0C8( var_0.groundpoint );

        var_0._id_19DB = 1;
    }

    return var_0._id_6071;
}

bot_oldschool_init_pickups()
{
    while ( !isdefined( level.bot_oldschool_pickup_struct_array ) )
        wait 0.05;

    self.pickup_array = [];
    var_0 = self _meth_8379( "strategyLevel" );
    var_1 = var_0 / 3.0;

    foreach ( var_3 in level.bot_oldschool_pickup_struct_array )
    {
        var_4 = spawnstruct();
        var_4._id_6685 = var_3;
        var_4._id_02E2 = var_3._id_02E2;
        var_4._id_6071 = var_3._id_6071;
        var_4._id_4411 = var_3._id_4411;
        var_4._id_04D9 = var_3._id_04D9;
        var_4._id_A2DF = var_3._id_A2DF;
        var_4._id_67CF = var_3._id_67CF;
        var_4.respawntime = var_3.respawntime;
        var_4.last_time_seen = 0;
        var_4.sight_time = 0;
        var_4.next_valid_time = 0;
        var_4.last_pickup_time = 0;
        var_4.always_known = _func_0B3( 1.0 ) < var_1;
        self.pickup_array[self.pickup_array.size] = var_4;
    }
}

bot_oldschool_track_pickups_in_sight()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self.pickup_array ) )
        return;

    bot_oldschool_init_pickups();
    var_0 = self _meth_8379( "averageEnemySightTime" ) / 1000.0;
    var_1 = var_0 * 0.7;

    for (;;)
    {
        var_2 = common_scripts\utility::_id_710E( [ 0.1, 0.15, 0.2 ] );
        wait(var_2);
        var_3 = self _meth_8385();

        if ( !isdefined( var_3 ) )
            continue;

        var_4 = gettime();
        var_5 = self _meth_8371();
        var_6 = self _meth_8576();

        foreach ( var_8 in self.pickup_array )
        {
            if ( !isdefined( var_8._id_030F ) )
                var_8._id_030F = bot_oldschool_get_pickup_ent_for_struct( var_8 );

            var_9 = 0;

            if ( _func_0F0( self._id_02E2, var_8._id_02E2 ) < 1600 )
            {
                var_9 = 1;
                var_8.sight_time = var_1;
            }
            else if ( bot_oldschool_pickup_is_probably_visible( var_8, var_3, var_5, var_6 ) )
                var_9 = bot_oldschool_pickup_trace_passed( var_8 );

            if ( var_9 )
            {
                if ( var_8.sight_time < var_1 )
                {
                    var_10 = _func_114( var_8._id_02E2 - self._id_02E2 );
                    var_11 = anglestoforward( self _meth_8338() );
                    var_12 = _func_0F6( var_10, var_11 );
                    var_13 = _func_0E9( ( var_12 - var_5 ) / ( 1.0 - var_5 ), 0.0, 1.0 );
                    var_14 = _func_0EE( self._id_02E2, var_8._id_02E2 );
                    var_15 = _func_0E9( ( var_14 - 3000 ) / -2500, 0.0, 1.0 );
                    var_16 = ( var_2 * var_13 + var_2 * var_15 ) * 0.5;
                    var_8.sight_time = _func_0BF( var_8.sight_time + var_16, var_1 );
                }
            }
            else if ( var_8.sight_time > 0 )
                var_8.sight_time = _func_0E1( var_8.sight_time - var_2, 0 );

            if ( var_8.sight_time >= var_1 )
            {
                var_8.last_time_seen = var_4;

                if ( !isdefined( var_8._id_030F ) )
                {
                    bot_oldschool_update_pickup_recharge_time( var_4, var_8 );
                    continue;
                }

                var_17 = 0;

                if ( var_8.last_pickup_time > 0 && gettime() - var_8.last_pickup_time < var_8.respawntime * 1000 )
                    var_17 = 1;

                if ( !var_17 )
                    bot_oldschool_reset_pickup_recharge_time( var_8 );
            }
        }

        wait 0.25;
    }
}

bot_oldschool_handle_pickup_goals()
{
    var_0 = undefined;

    for (;;)
    {
        wait 0.5;

        if ( !_func_1A1( self ) || maps\mp\_utility::_id_5092( self._id_4E3C ) || maps\mp\bots\_bots_util::_id_1664() || self _meth_8339() )
            continue;

        var_1 = maps\mp\bots\_bots_strategy::bot_get_active_tactical_goals_of_type( "oldschool_pickup" );
        var_2 = self _meth_835B();

        if ( var_2 == "tactical" )
        {
            var_3 = 0;

            if ( var_1.size > 0 )
                var_3 = maps\mp\bots\_bots_util::_id_172A( self _meth_8358(), var_1[0]._id_62E1._id_4411 );

            if ( !var_3 )
            {
                if ( var_1.size > 0 )
                    self notify( "stop_tactical_goal" );

                continue;
            }
        }

        if ( maps\mp\bots\_bots_strategy::_id_1649( "oldschool_pickup" ) && self.tactical_goal_in_action_thread )
            continue;

        if ( maps\mp\bots\_bots_util::_id_1650( 1000 ) )
            continue;

        if ( isdefined( self._id_759A ) && self._id_759A == "defuser" )
            continue;

        var_4 = gettime();
        var_5 = [];

        foreach ( var_7 in self.pickup_array )
        {
            if ( bot_oldschool_pickup_is_recharging( var_4, var_7 ) )
                continue;

            if ( !bot_oldschool_bot_remembers_pickup( var_4, var_7 ) )
                continue;

            var_5[var_5.size] = var_7;
        }

        var_9 = common_scripts\utility::_id_3CCB( self._id_02E2, var_5 );

        if ( isdefined( var_0 ) )
            var_10 = var_0;
        else
        {
            var_10 = "normal";

            if ( var_2 == "critical" )
                var_10 = "critical";
            else if ( maps\mp\bots\_bots_util::_id_165D() || var_2 == "objective" )
                var_10 = "objective";
        }

        var_11 = undefined;

        foreach ( var_7 in var_9 )
        {
            if ( var_7._id_04D9 == "weapon" )
            {
                var_13 = bot_oldschool_pickup_get_desired_weapon_pickup_action( var_7._id_A2DF );

                if ( bot_oldschool_should_pickup_weapon( var_13, var_7, var_10 ) )
                {
                    var_11["pickup_struct"] = var_7;
                    var_11["action"] = var_13["action"];
                    var_11["weapon_to_replace"] = var_13["weapon_to_replace"];
                    break;
                }

                continue;
            }

            if ( var_7._id_04D9 == "perk" )
            {
                if ( bot_oldschool_should_pickup_perk( var_7, var_10 ) )
                {
                    var_11["pickup_struct"] = var_7;
                    var_11["action"] = "pickup_perk";
                    break;
                }

                continue;
            }
        }

        if ( var_1.size > 0 )
        {
            if ( isdefined( var_11 ) && maps\mp\bots\_bots_strategy::_id_1649( "oldschool_pickup", var_11["pickup_struct"] ) )
                continue;

            var_15 = _func_0F0( self._id_02E2, var_1[0]._id_62E1._id_02E2 );

            if ( var_15 <= level.bot_oldschool_use_radius_sq )
                continue;

            maps\mp\bots\_bots_strategy::_id_15A1( "oldschool_pickup" );
            wait 0.25;
        }

        if ( isdefined( var_11 ) )
        {
            var_16 = spawnstruct();
            var_16._id_62E1 = var_11["pickup_struct"];
            var_16._id_79FE = 40;
            var_16._id_844D = ::bot_oldschool_pickup_deleted;

            if ( var_10 == "normal" )
                var_16._id_79FF = "guard";

            var_16.clear_prev_goal = 1;
            var_16.short_term_goal = 1;

            if ( var_11["action"] == "pickup_weapon" )
            {
                var_16._id_06ED = ::bot_oldschool_pickup_weapon;
                var_16.optional_params = var_11["weapon_to_replace"];
            }
            else if ( var_11["action"] == "pickup_perk" )
                var_16._id_06ED = ::bot_oldschool_pickup_perk;
            else if ( var_11["action"] == "pickup_ammo" )
                var_16._id_06ED = ::bot_oldschool_pickup_ammo;
            else
            {

            }

            maps\mp\bots\_bots_strategy::_id_16A9( "oldschool_pickup", var_11["pickup_struct"]._id_4411, 20, var_16 );
            var_0 = var_10;
            continue;
        }

        var_0 = undefined;
    }
}

bot_oldschool_bot_remembers_pickup( var_0, var_1 )
{
    if ( var_1.always_known )
        return 1;

    if ( var_1.last_time_seen > 0 )
    {
        var_2 = var_0 - var_1.last_time_seen;

        if ( var_2 <= level.bot_oldschool_pickup_memory_time_seen[self._id_2A5F] )
            return 1;
    }

    if ( var_1.last_pickup_time > 0 )
    {
        var_3 = var_0 - var_1.last_pickup_time;

        if ( var_3 <= level.bot_oldschool_pickup_memory_picked_up[self._id_2A5F] )
            return 1;
    }

    if ( maps\mp\bots\_bots_strategy::_id_1649( "oldschool_pickup", var_1 ) )
        return 1;

    return 0;
}

bot_oldschool_can_currently_see_pickup( var_0, var_1 )
{
    return var_0 - var_1.last_time_seen <= 500;
}

bot_oldschool_get_pickup_ent_for_struct( var_0 )
{
    var_1 = getentarray( "oldschool_pickup", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( _func_225( var_0._id_02E2, var_3._id_02E2 ) < 16 )
            return var_3;
    }

    return undefined;
}

bot_oldschool_pickup_is_recharging( var_0, var_1 )
{
    return var_0 < var_1.next_valid_time;
}

bot_oldschool_update_pickup_recharge_time( var_0, var_1 )
{
    if ( !bot_oldschool_pickup_is_recharging( var_0, var_1 ) )
    {
        var_2 = ( 4 - self _meth_8379( "strategyLevel" ) ) * 0.15;
        var_3 = _func_0B5( 1.0 - var_2, 1.0 + var_2 );
        var_4 = var_1.respawntime * var_3;
        var_1.next_valid_time = var_0 + var_4 * 1000;
    }
}

bot_oldschool_reset_pickup_recharge_time( var_0 )
{
    var_0.next_valid_time = 0;
}

bot_oldschool_update_pickup_time( var_0, var_1 )
{
    var_1.last_pickup_time = var_0;
}

bot_oldschool_should_pickup_weapon( var_0, var_1, var_2 )
{
    if ( var_2 != "normal" && var_0["action"] != "do_not_pickup" )
    {
        if ( bot_oldschool_nearly_out_of_ammo_for_active_weapon() )
            return 1;

        return bot_oldschool_should_pursue_pickup( var_1, var_2 );
    }

    if ( var_0["action"] == "pickup_weapon" )
    {
        var_3 = _func_1B8( var_1._id_A2DF );

        if ( var_3 == "rocketlauncher" || var_3 == "grenade" )
            return bot_oldschool_should_pursue_pickup( var_1, "normal" );

        return 1;
    }
    else if ( var_0["action"] == "pickup_ammo" )
    {
        if ( bot_oldschool_nearly_out_of_ammo_for_active_weapon() )
            return 1;

        return bot_oldschool_should_pursue_pickup( var_1, "normal" );
    }

    return 0;
}

bot_oldschool_should_pickup_perk( var_0, var_1 )
{
    if ( maps\mp\_utility::_id_05CB( var_0._id_67CF ) )
        return 0;

    if ( var_1 != "normal" )
        return bot_oldschool_should_pursue_pickup( var_0, var_1 );

    if ( self._id_67DF == "camper" )
        return bot_oldschool_should_pursue_pickup( var_0, "normal" );

    return 1;
}

bot_oldschool_should_pursue_pickup( var_0, var_1 )
{
    var_2 = var_1 == "normal";

    if ( var_2 && self _meth_8363() )
    {
        var_3 = self _meth_8358();
        var_4 = self _meth_8359();

        if ( _func_0F0( self._id_02E2, var_3 ) < _func_0E8( var_4 ) )
        {
            var_5 = 0;
            var_6 = maps\mp\bots\_bots_strategy::bot_get_active_tactical_goals_of_type( "oldschool_pickup" );

            if ( var_6.size == 1 )
                var_5 = maps\mp\bots\_bots_util::_id_172A( var_3, var_6[0]._id_62E1._id_4411 );

            if ( !var_5 )
                return 0;
        }
    }

    var_7 = level.bot_oldschool_pickup_close_radius_self_sq;

    if ( var_1 == "critical" )
        var_7 = level.bot_oldschool_pickup_close_crit_radius_self_sq;
    else if ( var_1 == "objective" )
        var_7 = level.bot_oldschool_pickup_close_obj_radius_self_sq;

    if ( _func_0F0( self._id_02E2, var_0._id_02E2 ) < var_7 )
        return 1;

    return 0;
}

bot_oldschool_pickup_weapon( var_0 )
{
    if ( maps\mp\bots\_bots_util::_id_1650( 1000 ) )
    {
        while ( maps\mp\bots\_bots_util::_id_1650( 1000 ) )
            wait 0.05;
    }
    else
    {
        var_1 = _func_0B5( level.bot_oldschool_weapon_pickup_time[self._id_2A5F]["min"], level.bot_oldschool_weapon_pickup_time[self._id_2A5F]["max"] ) * 0.5;
        wait(var_1);
    }

    if ( isdefined( var_0._id_62E1 ) && !bot_oldschool_pickup_is_recharging( gettime(), var_0._id_62E1 ) )
    {
        if ( isdefined( var_0.optional_params ) )
        {
            var_2 = self _meth_830E() != var_0.optional_params;
            self _meth_8312( var_0.optional_params );

            if ( var_2 )
            {
                var_3 = _func_0B5( level.bot_oldschool_weapon_switch_time[self._id_2A5F]["min"], level.bot_oldschool_weapon_switch_time[self._id_2A5F]["max"] );
                wait(var_3);
            }
        }

        self _meth_837C( "use", 1.0 );
        var_4 = gettime();

        while ( !self _meth_8311( var_0._id_62E1._id_A2DF ) && gettime() - var_4 < 1000.0 || gettime() - var_4 <= 100 )
            wait 0.05;

        var_5 = _func_0B5( level.bot_oldschool_weapon_pickup_time[self._id_2A5F]["min"], level.bot_oldschool_weapon_pickup_time[self._id_2A5F]["max"] );
        var_6 = 0;

        if ( self _meth_8311( var_0._id_62E1._id_A2DF ) && _func_1B8( var_0._id_62E1._id_A2DF ) != "grenade" )
        {
            self _meth_8312( var_0._id_62E1._id_A2DF );

            if ( _func_1B8( var_0._id_62E1._id_A2DF ) == "rocketlauncher" )
                var_6 = 0.75;
        }

        wait(var_5 + var_6);
        self _meth_8312( "none" );
        var_7 = gettime();
        bot_oldschool_update_pickup_recharge_time( var_7, var_0._id_62E1 );
        bot_oldschool_update_pickup_time( var_7, var_0._id_62E1 );
    }
}

bot_oldschool_pickup_ammo( var_0 )
{
    var_1 = gettime();
    bot_oldschool_update_pickup_recharge_time( var_1, var_0._id_62E1 );
    bot_oldschool_update_pickup_time( var_1, var_0._id_62E1 );
}

bot_oldschool_pickup_perk( var_0 )
{
    if ( maps\mp\bots\_bots_util::_id_1650( 1000 ) )
    {
        while ( maps\mp\bots\_bots_util::_id_1650( 1000 ) )
            wait 0.05;
    }
    else
    {
        var_1 = _func_0B5( level.bot_oldschool_perk_pickup_time[self._id_2A5F]["min"], level.bot_oldschool_perk_pickup_time[self._id_2A5F]["max"] ) * 0.5;
        wait(var_1);
    }

    if ( isdefined( var_0._id_62E1 ) && !bot_oldschool_pickup_is_recharging( gettime(), var_0._id_62E1 ) )
    {
        self _meth_837C( "use", 1.0 );
        var_2 = gettime();

        while ( !maps\mp\_utility::_id_05CB( var_0._id_62E1._id_67CF ) && gettime() - var_2 < 1000.0 || gettime() - var_2 <= 100 )
            wait 0.05;

        var_3 = _func_0B5( level.bot_oldschool_perk_pickup_time[self._id_2A5F]["min"], level.bot_oldschool_perk_pickup_time[self._id_2A5F]["max"] );
        wait(var_3);
        var_4 = gettime();
        bot_oldschool_update_pickup_recharge_time( var_4, var_0._id_62E1 );
        bot_oldschool_update_pickup_time( var_4, var_0._id_62E1 );
    }
}

bot_oldschool_pickup_deleted( var_0 )
{
    if ( !isdefined( var_0._id_62E1 ) || bot_oldschool_pickup_is_recharging( gettime(), var_0._id_62E1 ) )
        return 1;

    return 0;
}

bot_oldschool_pickup_get_desired_weapon_pickup_action( var_0 )
{
    var_1["action"] = "do_not_pickup";
    var_2 = _func_1B8( var_0 );

    if ( var_2 == "grenade" )
    {
        if ( maps\mp\gametypes\_class::_id_51F2( var_0 ) )
        {
            var_3 = 0;
            var_4 = self _meth_8317();

            if ( var_4 != "none" )
                var_3 = self _meth_82F5( var_4 );

            if ( var_3 > 0 )
            {
                if ( var_0 == var_4 )
                {
                    if ( bot_oldschool_is_valid_ammo_pickup( var_0 ) )
                        var_1["action"] = "pickup_ammo";
                }
            }
            else if ( !self _meth_8311( var_0 ) )
                var_1["action"] = "pickup_weapon";
            else if ( bot_oldschool_is_valid_ammo_pickup( var_0 ) )
                var_1["action"] = "pickup_ammo";
        }
        else if ( bot_oldschool_is_valid_ammo_pickup( var_0 ) )
            var_1["action"] = "pickup_ammo";

        return var_1;
    }
    else if ( var_2 == "rocketlauncher" )
    {
        if ( !self _meth_8311( var_0 ) )
            var_1["action"] = "pickup_weapon";
        else if ( bot_oldschool_is_valid_ammo_pickup( var_0 ) )
            var_1["action"] = "pickup_ammo";

        return var_1;
    }

    var_5 = self._id_67DF;

    if ( var_5 == "default" )
        var_5 = "run_and_gun";

    var_6 = maps\mp\bots\_bots_util::bot_get_active_and_stowed_weapons();
    var_7 = _func_1B8( var_6["active"] );
    var_8 = _func_1B8( var_6["stowed"] );
    var_9 = bot_oldschool_calculate_primary_and_secondary_weapons( var_5, var_6["active"], var_7, var_6["stowed"], var_8 );
    var_10 = bot_oldschool_get_weapon_primary_priority( var_5, var_2 );
    var_11 = bot_oldschool_get_weapon_primary_priority( var_5, var_9["primary"]["class"] );
    var_11 += bot_oldschool_adjust_weapon_priority( var_9["primary"]["weap"], var_7 );

    if ( var_10 > var_11 )
    {
        var_1["action"] = "pickup_weapon";
        var_1["weapon_to_replace"] = var_9["primary"]["weap"];
        return var_1;
    }

    var_12 = bot_oldschool_get_weapon_secondary_priority( var_5, var_2 );
    var_13 = bot_oldschool_get_weapon_secondary_priority( var_5, var_9["secondary"]["class"] );
    var_13 += bot_oldschool_adjust_weapon_priority( var_9["secondary"]["weap"], var_8 );

    if ( var_12 > var_13 )
    {
        var_1["action"] = "pickup_weapon";
        var_1["weapon_to_replace"] = var_9["secondary"]["weap"];
        return var_1;
    }

    if ( bot_oldschool_is_valid_ammo_pickup( var_0 ) )
        var_1["action"] = "pickup_ammo";

    return var_1;
}

bot_oldschool_is_valid_ammo_pickup( var_0 )
{
    if ( self _meth_8379( "strategyLevel" ) > 0 )
    {
        if ( !self _meth_8574( var_0 ) )
            return 0;

        var_1 = self _meth_8575( var_0 );

        if ( var_1 <= 0 )
            return 0;
    }

    return 1;
}

bot_oldschool_adjust_weapon_priority( var_0, var_1 )
{
    if ( maps\mp\_utility::_id_3F11( var_0 ) == "h1_skorpion" )
        return -1;

    if ( bot_oldschool_nearly_out_of_ammo_for_weapon( var_0, var_1 ) )
        return -10;

    return 0;
}

bot_oldschool_nearly_out_of_ammo_for_active_weapon()
{
    var_0 = maps\mp\bots\_bots_util::bot_get_active_and_stowed_weapons();
    var_1 = _func_1B8( var_0["active"] );

    if ( bot_oldschool_nearly_out_of_ammo_for_weapon( var_0["active"], var_1 ) )
        return 1;

    return 0;
}

bot_oldschool_nearly_out_of_ammo_for_weapon( var_0, var_1 )
{
    if ( var_1 == "grenade" )
    {
        if ( self _meth_82F5( var_0 ) <= 0 )
            return 1;
    }
    else
    {
        var_2 = self _meth_82F6( var_0 );
        var_3 = self _meth_82F5( var_0 );
        var_4 = _func_1B1( var_0, self );

        if ( var_2 + var_3 <= var_4 )
            return 1;
    }

    return 0;
}

bot_oldschool_calculate_primary_and_secondary_weapons( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = bot_oldschool_get_weapon_primary_priority( var_0, var_2 );
    var_6 = bot_oldschool_get_weapon_secondary_priority( var_0, var_2 );
    var_7 = bot_oldschool_get_weapon_primary_priority( var_0, var_4 );
    var_8 = bot_oldschool_get_weapon_secondary_priority( var_0, var_4 );
    var_9["primary"] = [];
    var_9["secondary"] = [];
    var_10 = var_5 - var_7;
    var_11 = var_6 - var_8;

    if ( var_10 >= var_11 )
    {
        var_9["primary"]["weap"] = var_1;
        var_9["primary"]["class"] = var_2;
        var_9["secondary"]["weap"] = var_3;
        var_9["secondary"]["class"] = var_4;
    }
    else
    {
        var_9["primary"]["weap"] = var_3;
        var_9["primary"]["class"] = var_4;
        var_9["secondary"]["weap"] = var_1;
        var_9["secondary"]["class"] = var_2;
    }

    return var_9;
}

bot_oldschool_get_weapon_primary_priority( var_0, var_1 )
{
    return level.bot_oldschool_primary_weapon_priorities[var_0][var_1];
}

bot_oldschool_get_weapon_secondary_priority( var_0, var_1 )
{
    return level.bot_oldschool_secondary_weapon_priorities[var_0][var_1];
}

bot_oldschool_pickup_isweapon( var_0 )
{
    return _func_120( var_0.classname, "weapon_" );
}

bot_oldschool_pickup_get_weapon_name( var_0 )
{
    return var_0 maps\mp\gametypes\_weapons::_id_3FDC();
}

bot_oldschool_pickup_isperk( var_0 )
{
    return var_0.classname == "script_model";
}

bot_oldschool_pickup_get_perk_name( var_0 )
{
    return var_0._id_0398;
}

bot_oldschool_pickup_is_probably_visible( var_0, var_1, var_2, var_3 )
{
    if ( !_func_204( var_0._id_6071, var_1, 1 ) )
        return 0;

    var_4 = var_0._id_02E2 - self _meth_80AA();
    var_5 = _func_0F3( var_4 );
    var_6 = anglestoforward( self _meth_8338() );
    var_7 = _func_0F6( var_4, var_6 );

    if ( var_7 < 0 || var_7 * var_7 < var_5 * var_2 * var_2 )
        return 0;

    if ( var_3 > var_2 )
    {
        var_4 = ( var_6[0] * _func_0F2( var_4 ), var_6[1] * _func_0F2( var_4 ), var_4[2] );
        var_5 = _func_0F3( var_4 );
        var_7 = _func_0F6( var_4, var_6 );

        if ( var_7 < 0 || var_7 * var_7 < var_5 * ( var_3 * var_3 ) )
            return 0;
    }

    return 1;
}

bot_oldschool_pickup_trace_passed( var_0 )
{
    if ( _func_08E( self _meth_80AA(), var_0._id_02E2 + ( 0, 0, 30 ), 1, self, var_0._id_030F, 0 ) )
        return 1;

    return _func_08E( self _meth_80AA(), var_0._id_02E2, 1, self, var_0._id_030F, 0 );
}

oldschool_attempt_camp_pickup()
{
    if ( _func_0B3( 1.0 ) < 0.5 )
        return 0;

    if ( maps\mp\bots\_bots_strategy::_id_1649( "oldschool_pickup" ) )
        return 0;

    var_0 = [];
    var_1 = gettime();

    foreach ( var_3 in self.pickup_array )
    {
        if ( bot_oldschool_pickup_is_recharging( var_1, var_3 ) )
            continue;

        if ( !bot_oldschool_bot_remembers_pickup( var_1, var_3 ) )
            continue;

        var_0[var_0.size] = var_3;
    }

    if ( var_0.size == 0 )
        return 0;

    var_5 = common_scripts\utility::_id_3CCB( self._id_02E2, var_0 );
    var_6 = var_5[0];

    if ( maps\mp\bots\_bots_personality::_id_3753( var_6._id_02E2, 512 ) )
        return 1;

    return 0;
}

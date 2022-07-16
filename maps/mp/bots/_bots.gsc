// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level._id_2409 ) && level._id_2409 )
        return;

    if ( getdvarint( "virtualLobbyActive" ) == 1 )
        return;

    if ( getdvarint( "r_reflectionProbeGenerate" ) == 1 )
        return;

    _id_8072();
    maps\mp\bots\_bots_personality::_id_825A();
    level._id_1262 = ::badplace_cylinder;
    level._id_1263 = ::badplace_delete;

    if ( isdefined( level.bot_killstreak_setup_func ) )
        [[ level.bot_killstreak_setup_func ]]();
    else
        maps\mp\bots\_bots_ks::_id_167A();

    maps\mp\bots\_bots_loadout::init();
    level thread init();
}

_id_8072()
{
    level._id_161B = [];
    level._id_161B["bots_spawn"] = ::_id_88D8;
    level._id_161B["bots_add_scavenger_bag"] = ::_id_15A4;
    level._id_161B["bots_add_to_level_targets"] = maps\mp\bots\_bots_util::_id_15A6;
    level._id_161B["bots_remove_from_level_targets"] = maps\mp\bots\_bots_util::_id_16CD;
    level._id_161B["bots_make_entity_sentient"] = ::_id_1697;
    level._id_161B["think"] = ::_id_170F;
    level._id_161B["on_killed"] = ::_id_6440;
    level._id_161B["should_do_killcam"] = ::_id_16F9;
    level._id_161B["get_attacker_ent"] = maps\mp\bots\_bots_util::_id_1634;
    level._id_161B["should_pickup_weapons"] = ::_id_16FB;
    level._id_161B["on_damaged"] = ::_id_15E9;
    level._id_161B["gametype_think"] = ::_id_277D;
    level._id_161B["leader_dialog"] = maps\mp\bots\_bots_util::_id_1681;
    level._id_161B["player_spawned"] = ::_id_16BA;
    level._id_161B["should_start_cautious_approach"] = maps\mp\bots\_bots_strategy::_id_847B;
    level._id_161B["know_enemies_on_start"] = ::_id_167D;
    level._id_161B["bot_get_rank_xp_and_prestige"] = ::_id_163B;
    level._id_161B["bot_set_rank_options"] = ::bot_set_rank_options;
    level._id_161B["ai_3d_sighting_model"] = ::_id_159F;
    level._id_161B["dropped_weapon_think"] = ::_id_1716;
    level._id_161B["dropped_weapon_cancel"] = ::_id_847F;
    level._id_161B["crate_can_use"] = ::_id_2364;
    level._id_161B["post_teleport"] = ::_id_16BC;
    level._id_16C9 = [];
    level._id_16C9["allies"] = maps\mp\bots\_bots_personality::_id_16C8;
    level._id_16C9["axis"] = maps\mp\bots\_bots_personality::_id_16C8;
    level._id_1611["capture"] = maps\mp\bots\_bots_strategy::_id_375F;
    level._id_1611["capture_zone"] = maps\mp\bots\_bots_strategy::_id_3760;
    level._id_1611["protect"] = maps\mp\bots\_bots_strategy::_id_3762;
    level._id_1611["bodyguard"] = maps\mp\bots\_bots_strategy::_id_375E;
    level._id_1611["patrol"] = maps\mp\bots\_bots_strategy::_id_3761;
    maps\mp\bots\_bots_gametype_war::_id_8072();
}

codecallback_leaderdialog( var_0, var_1 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["leader_dialog"] ) )
        self [[ level._id_161B["leader_dialog"] ]]( var_0, var_1 );
}

init()
{
    thread _id_5E06();
    thread _id_171A();
    _id_4D93();

    if ( !_id_84AE() )
        return;

    _id_72C0();
    var_0 = _func_1F6();

    if ( var_0 == "enabled_fill_open" || var_0 == "enabled_fill_open_dev" )
    {
        _func_12F( "hasBots", 1 );
        level thread _id_15DF();
    }
    else
        level thread _id_16A5();
}

_id_4D93()
{
    if ( !isdefined( level._id_237E ) )
        level._id_237E = 500;

    if ( !isdefined( level._id_237A ) )
        level._id_237A = 3000;

    level._id_16AC = 3000;
    level._id_16CF["recruit"] = "rpg_mp";
    level._id_16CF["regular"] = "rpg_mp";
    level._id_16CF["hardened"] = "rpg_mp";
    level._id_16CF["veteran"] = "rpg_mp";
    level._id_160A = "h1_ak47";
    level._id_A3EF = _func_206();
    _id_4D94();
    level thread maps\mp\bots\_bots_gametype_oldschool::bot_oldschool_init();
}

_id_4D94()
{
    if ( isdefined( level._id_925C ) )
        var_0 = [[ level._id_925C ]]();
    else
        var_0 = _func_0C5();

    level._id_169C = 0;
    level._id_1699 = 0;
    level._id_169D = 0;
    level._id_169A = 0;
    level._id_169E = 0;
    level._id_169B = 0;

    if ( var_0.size > 1 )
    {
        level._id_169C = var_0[0]._id_02E2[0];
        level._id_1699 = var_0[0]._id_02E2[0];
        level._id_169D = var_0[0]._id_02E2[1];
        level._id_169A = var_0[0]._id_02E2[1];
        level._id_169E = var_0[0]._id_02E2[2];
        level._id_169B = var_0[0]._id_02E2[2];

        for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1]._id_02E2;

            if ( var_2[0] < level._id_169C )
                level._id_169C = var_2[0];

            if ( var_2[0] > level._id_1699 )
                level._id_1699 = var_2[0];

            if ( var_2[1] < level._id_169D )
                level._id_169D = var_2[1];

            if ( var_2[1] > level._id_169A )
                level._id_169A = var_2[1];

            if ( var_2[2] < level._id_169E )
                level._id_169E = var_2[2];

            if ( var_2[2] > level._id_169B )
                level._id_169B = var_2[2];
        }
    }

    level._id_1698 = ( ( level._id_169C + level._id_1699 ) / 2, ( level._id_169D + level._id_169A ) / 2, ( level._id_169E + level._id_169B ) / 2 );
    level._id_1729 = 1;
}

_id_16BC()
{
    level._id_1729 = undefined;
    _id_4D94();
}

_id_84AE()
{
    return 1;
}

_id_72C0()
{
    wait 1;

    foreach ( var_1 in level._id_0323 )
    {
        if ( _func_1FE( var_1 ) )
        {
            var_1._id_3344 = 1;
            var_1._id_170E = var_1._id_04A7;
            var_1._id_1703 = 1;
            var_1 thread [[ level._id_161B["think"] ]]();
        }
    }
}

_id_16BA()
{
    _id_16EC();
}

_id_16EC()
{
    if ( !isdefined( self._id_15D8 ) )
    {
        if ( !_id_1620() )
        {
            while ( !isdefined( level._id_1695 ) )
                wait 0.05;

            if ( isdefined( self._id_6613 ) )
                self._id_15D8 = [[ self._id_6613 ]]();
            else
                self._id_15D8 = maps\mp\bots\_bots_personality::_id_16F3();
        }
        else
            self._id_15D8 = self._id_1E2E;
    }
}

_id_A1F1()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !_func_0CF( var_0 ) && level._id_0323.size > 0 )
        {
            level._id_6D3C = common_scripts\utility::_id_0CDA( level._id_6D3C, var_0 );
            childthread _id_174A( var_0 );
            childthread _id_1749( var_0 );
            childthread _id_174B( var_0 );
        }
    }
}

_id_174A( var_0 )
{
    var_0 endon( "bots_human_disconnected" );

    while ( !common_scripts\utility::_id_0CE4( level._id_0323, var_0 ) )
        wait 0.05;

    var_0 notify( "bots_human_spawned" );
}

_id_1749( var_0 )
{
    var_0 endon( "bots_human_spawned" );
    var_0 waittill( "disconnect" );
    var_0 notify( "bots_human_disconnected" );
}

_id_174B( var_0 )
{
    var_0 common_scripts\utility::_id_A069( "bots_human_spawned", "bots_human_disconnected" );
    level._id_6D3C = common_scripts\utility::_id_0CF6( level._id_6D3C, var_0 );
}

_id_5DD8()
{
    level._id_6D3C = [];
    childthread _id_A1F1();

    for (;;)
    {
        if ( level._id_6D3C.size > 0 )
            level._id_6729 = 1;
        else
            level._id_6729 = 0;

        wait 0.5;
    }
}

_id_15C5( var_0 )
{
    if ( maps\mp\_utility::_id_59E3() )
        return 1;

    if ( !level._id_91EB )
        return 1;

    if ( maps\mp\gametypes\_teams::_id_3FDD( var_0 ) )
        return 1;

    return 0;
}

_id_15AA()
{
    if ( isdefined( level._id_1744 ) && level._id_1744 )
        return 0;

    if ( isdefined( level._id_59EA ) && level._id_59EA )
        return 0;

    return 1;
}

_id_15DF( var_0, var_1 )
{
    level endon( "game_ended" );
    self notify( "bot_connect_monitor" );
    self endon( "bot_connect_monitor" );
    level._id_6729 = 0;
    childthread _id_5DD8();
    maps\mp\gametypes\_hostmigration::_id_A052( 0.5 );
    var_2 = 1.5;

    if ( !isdefined( level._id_15DB ) )
        level._id_15DB = 0;

    if ( !isdefined( level._id_15DC ) )
        level._id_15DC = 0;

    if ( !isdefined( level._id_15DA ) )
        level._id_15DA = 0;

    for (;;)
    {
        if ( level._id_6729 )
        {
            maps\mp\gametypes\_hostmigration::_id_A052( var_2 );
            continue;
        }

        var_3 = isdefined( level._id_1748 ) || !level._id_91EB;
        var_4 = _func_279( 0 );
        var_5 = _func_279( 1 );
        var_6 = _func_27B( 0 );
        var_7 = _func_27B( 1 );
        var_11 = "allies";

        if ( isdefined( level.bot_last_team_ally ) )
            var_11 = level.bot_last_team_ally;

        var_12 = "axis";

        if ( isdefined( level.bot_last_team_enemy ) )
            var_12 = level.bot_last_team_enemy;

        var_13 = _id_15D9();
        var_14 = _id_1BC7( var_13, "humans" );

        if ( var_14 > 1 )
        {
            var_15 = _id_1632();

            if ( !maps\mp\_utility::_id_59E3() && isdefined( var_15 ) && var_15 != "spectator" )
            {
                var_11 = var_15;
                var_12 = maps\mp\_utility::_id_4067( var_15 );
            }
            else
            {
                var_16 = _id_1BC7( var_13, "humans_allies" );
                var_17 = _id_1BC7( var_13, "humans_axis" );

                if ( var_17 > var_16 )
                {
                    var_11 = "axis";
                    var_12 = "allies";
                }
            }
        }
        else
        {
            var_18 = _id_3DA3();

            if ( isdefined( var_18 ) )
            {
                var_19 = var_18 _id_163A();

                if ( isdefined( var_19 ) && var_19 != "spectator" )
                {
                    var_11 = var_19;
                    var_12 = maps\mp\_utility::_id_4067( var_19 );
                }
            }
        }

        level.bot_last_team_ally = var_11;
        level.bot_last_team_enemy = var_12;
        var_20 = maps\mp\bots\_bots_util::_id_163D();
        var_21 = maps\mp\bots\_bots_util::_id_163D();
        var_22 = maps\mp\bots\_bots_util::_id_162C();

        if ( var_20 + var_21 < var_22 )
        {
            if ( var_20 < var_4 )
                var_20++;
            else if ( var_21 < var_5 )
                var_21++;
        }

        var_23 = _id_1BC7( var_13, "humans_" + var_11 );
        var_24 = _id_1BC7( var_13, "humans_" + var_12 );
        var_25 = var_23 + var_24;
        var_26 = _id_1BC7( var_13, "spectator" );
        var_27 = 0;

        for ( var_28 = 0; var_26 > 0; var_26-- )
        {
            var_29 = var_23 + var_27 + 1 <= var_20;
            var_30 = var_24 + var_28 + 1 <= var_21;

            if ( var_29 && !var_30 )
            {
                var_27++;
                continue;
            }

            if ( !var_29 && var_30 )
            {
                var_28++;
                continue;
            }

            if ( var_29 && var_30 )
            {
                if ( var_26 % 2 == 1 )
                {
                    var_27++;
                    continue;
                }

                var_28++;
            }
        }

        var_31 = _id_1BC7( var_13, "bots_" + var_11 );
        var_32 = _id_1BC7( var_13, "bots_" + var_12 );
        var_33 = var_31 + var_32;

        if ( var_33 > 0 )
            level._id_15DB = 1;

        var_34 = 0;

        if ( !level._id_15DA )
        {
            var_34 = !_id_1633();

            if ( !var_34 )
                level._id_15DA = 1;
        }

        if ( var_34 )
        {
            var_35 = !_func_2C3();
            var_36 = !var_3 && var_5 != var_4 && !level._id_15DB && ( level._id_15DC < 10 || !maps\mp\_utility::_id_3BDD( "prematch_done" ) );
            var_37 = 0;

            if ( var_35 || var_36 || var_37 )
            {
                level._id_15DC += var_2;
                maps\mp\gametypes\_hostmigration::_id_A052( var_2 );
                continue;
            }
        }

        var_38 = _func_0BC( _func_0BF( var_20 - var_23 - var_27, var_4 ) );
        var_39 = _func_0BC( _func_0BF( var_21 - var_24 - var_28, var_5 ) );
        var_40 = 1;
        var_41 = var_38 + var_39 + var_14;
        var_42 = var_4 + var_5 + var_14;

        for ( var_43 = [ -1, -1 ]; var_41 < var_22 && var_41 < var_42; var_40 = !var_40 )
        {
            if ( var_40 && var_38 < var_4 && _id_15C5( var_11 ) )
                var_38++;
            else if ( !var_40 && var_39 < var_5 && _id_15C5( var_12 ) )
                var_39++;

            var_41 = var_38 + var_39 + var_14;

            if ( var_43[var_40] == var_41 )
                break;

            var_43[var_40] = var_41;
        }

        level._id_169F[var_11] = _func_0BC( var_38 + var_23 + var_27 );
        level._id_169F[var_12] = _func_0BC( var_39 + var_24 + var_28 );
        _id_9AC6();

        if ( var_4 == var_5 && !var_3 && var_27 == 1 && var_28 == 0 && var_39 > 0 )
        {
            if ( !isdefined( level._id_16C1 ) && maps\mp\_utility::_id_3BDD( "prematch_done" ) )
                level._id_16C1 = gettime();

            if ( var_34 && ( !isdefined( level._id_16C1 ) || gettime() - level._id_16C1 < 10000 ) )
                var_39--;
        }

        var_45 = var_38 - var_31;
        var_46 = var_39 - var_32;
        var_47 = 1;

        if ( var_3 )
        {
            var_48 = var_20 + var_21;
            var_49 = var_4 + var_5;
            var_50 = var_23 + var_24;
            var_51 = var_31 + var_32;
            var_52 = _func_0BC( _func_0BF( var_48 - var_50, var_49 ) );
            var_53 = var_52 - var_51;

            if ( var_53 == 0 )
                var_47 = 0;
            else if ( var_53 > 0 )
            {
                var_45 = _func_0BC( var_53 / 2 ) + var_53 % 2;
                var_46 = _func_0BC( var_53 / 2 );
            }
            else if ( var_53 < 0 )
            {
                var_54 = var_53 * -1;
                var_45 = -1 * _func_0BC( _func_0BF( var_54, var_31 ) );
                var_46 = -1 * ( var_54 + var_45 );
            }
        }
        else if ( !maps\mp\_utility::_id_59E3() && ( var_45 * var_46 < 0 && maps\mp\_utility::_id_3BDD( "prematch_done" ) && _id_15AA() ) )
        {
            var_55 = _func_0BC( _func_0BF( _func_0BE( var_45 ), _func_0BE( var_46 ) ) );

            if ( var_45 > 0 )
                _id_5F03( var_55, var_12, var_11, var_6 );
            else if ( var_46 > 0 )
                _id_5F03( var_55, var_11, var_12, var_7 );

            var_47 = 0;
        }

        if ( var_47 )
        {
            if ( var_46 < 0 )
                _id_2F3E( var_46 * -1, var_12 );

            if ( var_45 < 0 )
                _id_2F3E( var_45 * -1, var_11 );

            if ( var_46 > 0 )
                level thread _id_88D8( var_46, var_12, undefined, undefined, "spawned_enemies", var_7 );

            if ( var_45 > 0 )
                level thread _id_88D8( var_45, var_11, undefined, undefined, "spawned_allies", var_6 );

            if ( var_46 > 0 && var_45 > 0 )
                level common_scripts\utility::_id_A09A( "spawned_enemies", "spawned_allies" );
            else if ( var_46 > 0 )
                level waittill( "spawned_enemies" );
            else if ( var_45 > 0 )
                level waittill( "spawned_allies" );
        }

        if ( var_7 != var_6 )
        {
            _id_174C( var_12, var_7 );
            _id_174C( var_11, var_6 );
        }

        maps\mp\gametypes\_hostmigration::_id_A052( var_2 );
    }
}

_id_16A5()
{
    level endon( "game_ended" );
    self notify( "bot_monitor_team_limits" );
    self endon( "bot_monitor_team_limits" );
    maps\mp\gametypes\_hostmigration::_id_A052( 0.5 );
    var_0 = 1.5;

    for (;;)
    {
        level._id_169F["allies"] = 0;
        level._id_169F["axis"] = 0;

        foreach ( var_2 in level._id_0323 )
        {
            if ( isdefined( var_2._id_04A7 ) && ( var_2._id_04A7 == "allies" || var_2._id_04A7 == "axis" ) )
                level._id_169F[var_2._id_04A7]++;
        }

        _id_9AC6();
        maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
    }
}

_id_9AC6()
{
    if ( isdefined( level._id_08A1 ) )
    {
        foreach ( var_1 in level._id_08A1 )
        {
            if ( isdefined( var_1._id_50A6 ) && var_1._id_50A6 )
            {
                if ( maps\mp\_utility::_id_51CE( var_1 ) && isdefined( var_1._id_04A7 ) && ( var_1._id_04A7 == "allies" || var_1._id_04A7 == "axis" ) )
                    level._id_169F[var_1._id_04A7]++;
            }
        }
    }
}

_id_163A()
{
    if ( isdefined( self._id_04A7 ) )
        return self._id_04A7;

    if ( isdefined( self._id_0308["team"] ) )
        return self._id_0308["team"];

    return undefined;
}

_id_1632()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( !_func_0CF( var_1 ) && var_1 _meth_8298() )
            return var_1 _id_163A();
    }

    return "spectator";
}

_id_1633()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level._id_0323 )
    {
        if ( !_func_0CF( var_4 ) )
        {
            if ( var_4 _meth_8298() )
                var_0 = 1;

            if ( _id_6BB8( var_4 ) )
            {
                var_1 = 1;

                if ( var_4 _meth_8298() )
                    var_2 = 1;
            }
        }
    }

    return var_2 || var_1 && !var_0;
}

_id_6BB8( var_0 )
{
    if ( isdefined( var_0._id_04A7 ) && var_0._id_04A7 != "spectator" )
        return 1;

    if ( isdefined( var_0._id_8A4B ) && var_0._id_8A4B )
        return 1;

    if ( var_0 _meth_842D() )
        return 1;

    return 0;
}

_id_15D9()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
    {
        var_2 = level._id_0323[var_1];

        if ( isdefined( var_2 ) && isdefined( var_2._id_04A7 ) )
        {
            var_0 = _id_1BC6( var_0, "all" );
            var_0 = _id_1BC6( var_0, var_2._id_04A7 );

            if ( _func_1FE( var_2 ) )
            {
                var_0 = _id_1BC6( var_0, "bots" );
                var_0 = _id_1BC6( var_0, "bots_" + var_2._id_04A7 );
                continue;
            }

            var_0 = _id_1BC6( var_0, "humans" );
            var_0 = _id_1BC6( var_0, "humans_" + var_2._id_04A7 );
        }
    }

    return var_0;
}

_id_1BC6( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = [];

    if ( !isdefined( var_0[var_1] ) )
        var_0[var_1] = 0;

    var_0[var_1] += 1;
    return var_0;
}

_id_1BC7( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_0[var_1] ) )
        return 0;

    return var_0[var_1];
}

_id_5F03( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in level._id_0323 )
    {
        if ( !isdefined( var_5._id_04A7 ) )
            continue;

        if ( isdefined( var_5._id_2148 ) && var_5._id_2148 && _func_1FE( var_5 ) && var_5._id_04A7 == var_1 )
        {
            var_5._id_170E = var_2;

            if ( isdefined( var_3 ) )
                var_5 maps\mp\bots\_bots_util::_id_16EB( var_3 );

            var_5 notify( "luinotifyserver", "team_select", _id_1696( var_2 ) );
            wait 0.05;
            var_5 notify( "luinotifyserver", "class_select", var_5._id_15D8 );
            var_0--;

            if ( var_0 <= 0 )
            {
                break;
                continue;
            }

            wait 0.1;
        }
    }
}

_id_174C( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
    {
        if ( !isdefined( var_3._id_04A7 ) )
            continue;

        if ( isdefined( var_3._id_2148 ) && var_3._id_2148 && _func_1FE( var_3 ) && var_3._id_04A7 == var_0 )
        {
            if ( var_1 != var_3 _meth_8369() )
                var_3 maps\mp\bots\_bots_util::_id_16EB( var_1 );
        }
    }
}

_id_1603()
{
    _func_13F( self._id_3314, "EXE_PLAYERKICKED_BOT_BALANCE" );
    wait 0.1;
}

_id_2F3E( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level._id_0323 )
    {
        if ( isdefined( var_4._id_2148 ) && var_4._id_2148 && _func_1FE( var_4 ) && ( !isdefined( var_1 ) || isdefined( var_4._id_04A7 ) && var_4._id_04A7 == var_1 ) )
            var_2[var_2.size] = var_4;
    }

    for ( var_6 = var_2.size - 1; var_6 >= 0; var_6-- )
    {
        if ( var_0 <= 0 )
            break;

        if ( !maps\mp\_utility::_id_5189( var_2[var_6] ) )
        {
            var_2[var_6] _id_1603();
            var_2 = common_scripts\utility::_id_0CF6( var_2, var_2[var_6] );
            var_0--;
        }
    }

    for ( var_6 = var_2.size - 1; var_6 >= 0; var_6-- )
    {
        if ( var_0 <= 0 )
            break;

        var_2[var_6] _id_1603();
        var_0--;
    }
}

_id_1696( var_0 )
{
    if ( var_0 == "axis" )
        return 0;
    else if ( var_0 == "allies" )
        return 1;
    else if ( var_0 == "autoassign" || var_0 == "random" )
        return 2;
    else
        return 3;
}

_id_88D7( var_0, var_1, var_2 )
{
    var_3 = gettime() + 60000;

    while ( !self _meth_8415() )
    {
        if ( gettime() >= var_3 )
        {
            _func_13F( self._id_3314, "EXE_PLAYERKICKED_BOT_BALANCE" );
            var_2._id_06BA = 1;
            return;
        }

        wait 0.05;

        if ( !isdefined( self ) )
        {
            var_2._id_06BA = 1;
            return;
        }
    }

    maps\mp\gametypes\_hostmigration::_id_A052( _func_0B5( 0.25, 2.0 ) );

    if ( !isdefined( self ) )
    {
        var_2._id_06BA = 1;
        return;
    }

    self _meth_8416();
    self._id_3344 = 1;
    self._id_170E = var_0;

    if ( isdefined( var_2._id_2A5F ) )
        maps\mp\bots\_bots_util::_id_16EB( var_2._id_2A5F );

    if ( isdefined( var_1 ) )
        self [[ var_1 ]]();

    self thread [[ level._id_161B["think"] ]]();
    var_2._id_71D4 = 1;
}

_id_88D8( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = gettime() + 10000;
    var_7 = [];
    var_8 = var_7.size;

    while ( level._id_0323.size < maps\mp\bots\_bots_util::_id_162C() && var_7.size < var_0 && gettime() < var_6 )
    {
        maps\mp\gametypes\_hostmigration::_id_A052( 0.05 );
        var_9 = _func_289( "" );

        if ( !isdefined( var_9 ) )
        {
            if ( isdefined( var_3 ) && var_3 )
            {
                if ( isdefined( var_4 ) )
                    self notify( var_4 );

                return;
            }

            maps\mp\gametypes\_hostmigration::_id_A052( 1 );
            continue;
            continue;
        }

        var_10 = spawnstruct();
        var_10._id_159E = var_9;
        var_10._id_71D4 = 0;
        var_10._id_06BA = 0;
        var_10._id_0204 = var_8;
        var_10._id_2A5F = var_5;
        var_7[var_7.size] = var_10;
        var_10._id_159E thread _id_88D7( var_1, var_2, var_10 );
        var_8++;
    }

    var_11 = 0;
    var_6 = gettime() + 60000;

    while ( var_11 < var_7.size && gettime() < var_6 )
    {
        var_11 = 0;

        foreach ( var_10 in var_7 )
        {
            if ( var_10._id_71D4 || var_10._id_06BA )
                var_11++;
        }

        wait 0.05;
    }

    if ( isdefined( var_4 ) )
        self notify( var_4 );
}

_id_1621()
{
    if ( maps\mp\_utility::_id_59E3() && self._id_03BD != "none" )
        var_0 = 0;
    else if ( !maps\mp\_utility::_id_59E3() && !maps\mp\_utility::forceautoassign() && maps\mp\_utility::_id_0AB0() )
        var_0 = 1;
    else
        var_0 = 0;

    return !var_0;
}

_id_1620()
{
    return isdefined( level._id_1746 ) && level._id_1746;
}

_id_170F()
{
    self notify( "bot_think" );
    self endon( "bot_think" );
    self endon( "disconnect" );

    while ( !isdefined( self._id_0308["team"] ) )
        wait 0.05;

    level._id_4722 = 1;

    if ( _id_1621() )
        self._id_170E = self._id_0308["team"];

    var_0 = self._id_170E;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_0308["team"];

    self._id_3314 = self _meth_81B5();
    var_1 = 0;

    if ( !isdefined( self._id_1703 ) )
    {
        var_1 = 1;
        self._id_1703 = 1;

        if ( !_id_1621() )
        {
            var_2 = self._id_0308["team"] != "spectator" && !isdefined( self._id_170E );

            if ( !var_2 )
            {
                self notify( "luinotifyserver", "team_select", _id_1696( var_0 ) );
                wait 0.5;

                if ( self._id_0308["team"] == "spectator" )
                {
                    _id_1603();
                    return;
                }
            }
        }
    }

    for (;;)
    {
        maps\mp\bots\_bots_util::_id_16EB( self _meth_8369() );
        self._id_2A5F = self _meth_8369();
        var_3 = self _meth_8379( "advancedPersonality" );

        if ( var_1 && isdefined( var_3 ) && var_3 != 0 )
            maps\mp\bots\_bots_personality::_id_15B0();

        maps\mp\bots\_bots_personality::_id_15AD();

        if ( var_1 )
        {
            _id_16EC();

            if ( !_id_1620() )
            {
                if ( maps\mp\_utility::ishodgepodgeph() && var_0 == game["attackers"] && game["roundsPlayed"] > 0 )
                    wait 0.5;

                self notify( "luinotifyserver", "class_select", self._id_15D8 );
            }

            if ( self._id_01E6 == 0 )
                self waittill( "spawned_player" );

            if ( isdefined( level._id_161B ) && isdefined( level._id_161B["know_enemies_on_start"] ) )
                self thread [[ level._id_161B["know_enemies_on_start"] ]]();

            var_1 = 0;
        }

        maps\mp\bots\_bots_loadout::bot_modify_behavior_from_loadout();
        bot_modify_behavior_from_tweakables();
        _id_16D0();
        wait 0.1;
        self waittill( "death" );
        _id_7476();
        self waittill( "spawned_player" );
    }
}

bot_set_rank_options()
{
    if ( !isdefined( self._id_0308["shouldApplyEmblemToWeapon"] ) )
        self._id_0308["shouldApplyEmblemToWeapon"] = self._id_0308["rank"] >= 29 && common_scripts\utility::_id_2006();

    if ( !isdefined( self._id_0308["shouldApplyEmblemToCharacter"] ) )
        self._id_0308["shouldApplyEmblemToCharacter"] = self._id_0308["rank"] >= 19 && common_scripts\utility::_id_2006();
}

bot_modify_behavior_from_tweakables()
{
    if ( maps\mp\gametypes\_tweakables::_id_4142( "game", "onlyheadshots" ) )
        self _meth_834F( "only_headshots", 1 );
}

_id_7476()
{
    self endon( "started_spawnPlayer" );

    while ( !self._id_A04D )
        wait 0.05;

    if ( maps\mp\gametypes\_playerlogic::_id_6081() )
    {
        while ( self._id_A04D )
        {
            if ( self._id_03BC == "spectator" )
            {
                if ( getdvarint( "numlives" ) == 0 || self._id_0308["lives"] > 0 )
                    self _meth_837C( "use", 0.5 );
            }

            wait 1.0;
        }
    }
}

_id_1667()
{
    return self _meth_837B();
}

_id_163B()
{
    var_0 = spawnstruct();

    if ( !_id_1667() )
    {
        if ( !isdefined( self._id_0308["rankxp"] ) )
            self._id_0308["rankxp"] = 0;

        if ( !isdefined( self._id_0308["prestige"] ) )
            self._id_0308["prestige"] = 0;

        var_0._id_713C = self._id_0308["rankxp"];
        var_0._id_032E = self._id_0308["prestige"];
        return var_0;
    }

    var_1 = self _meth_8369();
    var_2 = "bot_rank_" + var_1;
    var_3 = "bot_prestige_" + var_1;
    var_4 = self._id_0308[var_2];
    var_5 = self._id_0308[var_3];
    var_6 = undefined;

    if ( isdefined( var_4 ) )
        var_0._id_713C = var_4;
    else
    {
        if ( !isdefined( var_6 ) )
            var_6 = _id_16CA( var_1 );

        var_7 = var_6["rank"];
        var_8 = maps\mp\gametypes\_rank::_id_40AF( var_7 );
        var_9 = maps\mp\gametypes\_rank::_id_40AE( var_7 );
        var_10 = _func_0B4( var_8, var_9 );
        self._id_0308[var_2] = var_10;
        var_0._id_713C = var_10;
    }

    if ( isdefined( var_5 ) )
        var_0._id_032E = var_5;
    else
    {
        if ( !isdefined( var_6 ) )
            var_6 = _id_16CA( var_1 );

        var_11 = var_6["prestige"];
        self._id_0308[var_3] = var_11;
        var_0._id_032E = var_11;
    }

    return var_0;
}

_id_159F( var_0 )
{
    thread _id_15A0( var_0 );
}

_id_15A0( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( _func_1A1( self ) && !self _meth_836D( var_0 ) && common_scripts\utility::_id_A347( self._id_02E2, self _meth_8338(), var_0._id_02E2, self _meth_8371() ) )
            self _meth_8375( var_0, var_0._id_02E2 );

        wait 0.1;
    }
}

_id_16CA( var_0 )
{
    var_1 = [];
    var_1["rank"] = 0;
    var_1["prestige"] = 0;

    if ( var_0 == "default" )
        return var_1;

    if ( !isdefined( level._id_16D3 ) )
    {
        level._id_16D3 = [];
        level._id_16D3["recruit"][0] = 0;
        level._id_16D3["recruit"][1] = 1;
        level._id_16D3["regular"][0] = 20;
        level._id_16D3["regular"][1] = 28;
        level._id_16D3["hardened"][0] = 40;
        level._id_16D3["hardened"][1] = 48;
        level._id_16D3["veteran"][0] = 50;
        level._id_16D3["veteran"][1] = 54;
    }

    if ( !isdefined( level._id_16D2 ) )
    {
        level._id_16D2 = [];
        level._id_16D2["recruit"][0] = 0;
        level._id_16D2["recruit"][1] = 0;
        level._id_16D2["regular"][0] = 0;
        level._id_16D2["regular"][1] = 0;
        level._id_16D2["hardened"][0] = 0;
        level._id_16D2["hardened"][1] = 0;
        level._id_16D2["veteran"][0] = 0;
        level._id_16D2["veteran"][1] = level.maxprestige;
    }

    var_1["rank"] = _func_0B4( level._id_16D3[var_0][0], level._id_16D3[var_0][1] + 1 );
    var_1["prestige"] = _func_0B4( level._id_16D2[var_0][0], level._id_16D2[var_0][1] + 1 );
    return var_1;
}

_id_2364( var_0 )
{
    if ( _func_1FF( self ) && !isdefined( var_0._id_175D ) )
        return 0;

    return 1;
}

_id_3DA3()
{
    var_0 = undefined;
    var_1 = getentarray( "player", "classname" );

    if ( isdefined( var_1 ) )
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            if ( isdefined( var_1[var_2] ) && isdefined( var_1[var_2]._id_2148 ) && var_1[var_2]._id_2148 && !_func_0CF( var_1[var_2] ) && ( !isdefined( var_0 ) || var_0._id_04A7 == "spectator" ) )
                var_0 = var_1[var_2];
        }
    }

    return var_0;
}

_id_15E9( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( self ) || !_func_1A1( self ) )
        return;

    if ( var_2 == "MOD_FALLING" || var_2 == "MOD_SUICIDE" )
        return;

    if ( var_1 <= 0 )
        return;

    if ( !isdefined( var_4 ) )
    {
        if ( !isdefined( var_0 ) )
            return;

        var_4 = var_0;
    }

    if ( isdefined( var_4 ) )
    {
        if ( level._id_91EB )
        {
            if ( isdefined( var_4._id_04A7 ) && var_4._id_04A7 == self._id_04A7 )
                return;
            else if ( isdefined( var_0 ) && isdefined( var_0._id_04A7 ) && var_0._id_04A7 == self._id_04A7 )
                return;
        }

        var_6 = maps\mp\bots\_bots_util::_id_1634( var_0, var_4 );

        if ( isdefined( var_6 ) )
            self _meth_8357( var_6 );
    }
}

_id_6440( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self _meth_8356();
    self _meth_8354();
    var_10 = maps\mp\bots\_bots_util::_id_1634( var_1, var_0 );

    if ( isdefined( var_10 ) && var_10.classname == "misc_turret" && isdefined( var_10._id_1D48 ) )
        var_10 = var_10._id_1D48;

    if ( isdefined( var_10 ) && ( var_10.classname == "script_vehicle" || var_10.classname == "script_model" ) && isdefined( var_10._id_4818 ) )
    {
        var_11 = self _meth_8379( "launcherRespawnChance" );

        if ( _func_0B3( 1.0 ) < var_11 )
            self._id_7477 = 1;
    }
}

_id_16F9()
{
    var_5 = 0.0;
    var_6 = self _meth_8369();

    if ( var_6 == "recruit" )
        var_5 = 0.1;
    else if ( var_6 == "regular" )
        var_5 = 0.4;
    else if ( var_6 == "hardened" )
        var_5 = 0.7;
    else if ( var_6 == "veteran" )
        var_5 = 1.0;

    return _func_0B3( 1.0 ) < 1.0 - var_5;
}

_id_16FB()
{
    if ( maps\mp\_utility::_id_5131() )
        return 0;

    return 1;
}

_id_16D0()
{
    thread _id_1719();
    thread maps\mp\bots\_bots_strategy::_id_1717();
    self thread [[ level._id_161B["dropped_weapon_think"] ]]();
    thread maps\mp\bots\_bots_gametype_oldschool::bot_think_oldschool();
    thread maps\mp\bots\_bots_ks::_id_1713();
    thread maps\mp\bots\_bots_ks::_id_1718();
    thread _id_1712();
}

_id_1719( var_0 )
{
    var_1 = "spawned_player";

    if ( isdefined( var_0 ) && var_0 )
        var_1 = "death";

    self notify( "bot_think_watch_enemy" );
    self endon( "bot_think_watch_enemy" );
    self endon( var_1 );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_5523 = 0;

    for (;;)
    {
        if ( isdefined( self._id_0142 ) )
        {
            if ( self _meth_836D( self._id_0142 ) )
                self._id_5523 = gettime();
        }

        wait 0.05;
    }
}

_id_1716()
{
    self notify( "bot_think_seek_dropped_weapons" );
    self endon( "bot_think_seek_dropped_weapons" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = 0;

        if ( maps\mp\bots\_bots_util::_id_16AB() )
        {
            if ( self [[ level._id_161B["should_pickup_weapons"] ]]() && !maps\mp\bots\_bots_util::_id_1664() )
            {
                var_1 = getentarray( "dropped_weapon", "targetname" );
                var_2 = common_scripts\utility::_id_3CCB( self._id_02E2, var_1 );

                if ( var_2.size > 0 )
                {
                    var_3 = var_2[0];
                    _id_16D9( var_3 );
                }
            }
        }

        wait(_func_0B5( 0.25, 0.75 ));
    }
}

_id_16D9( var_0 )
{
    if ( maps\mp\bots\_bots_strategy::_id_1649( "seek_dropped_weapon", var_0 ) == 0 )
    {
        var_1 = undefined;

        if ( var_0._id_04A6 == "dropped_weapon" )
        {
            var_2 = 1;
            var_3 = self _meth_8309();

            foreach ( var_5 in var_3 )
            {
                if ( var_0._id_029C == _func_043( var_5 ) )
                    var_2 = 0;
            }

            if ( var_2 )
                var_1 = ::_id_16B9;
        }

        var_7 = spawnstruct();
        var_7._id_62E1 = var_0;
        var_7._id_79FE = 12;
        var_7._id_844D = level._id_161B["dropped_weapon_cancel"];
        var_7._id_06ED = var_1;
        maps\mp\bots\_bots_strategy::_id_16A9( "seek_dropped_weapon", var_0._id_02E2, 100, var_7 );
    }
}

_id_16B9( var_0 )
{
    self _meth_837C( "use", 2 );
    wait 2;
}

_id_847F( var_0 )
{
    if ( !isdefined( var_0._id_62E1 ) )
        return 1;

    if ( var_0._id_62E1._id_04A6 == "dropped_weapon" )
    {
        if ( maps\mp\bots\_bots_util::_id_1641() > 0 )
            return 1;
    }
    else if ( var_0._id_62E1._id_04A6 == "dropped_knife" )
    {
        if ( maps\mp\bots\_bots_util::_id_1650() )
        {
            self._id_425A = undefined;
            return 1;
        }
    }

    return 0;
}

_id_167D()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( gettime() > 15000 )
        return;

    while ( !maps\mp\_utility::_id_3BE2() || !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
        wait 0.05;

    var_0 = undefined;
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level._id_0323.size; var_2++ )
    {
        var_3 = level._id_0323[var_2];

        if ( isdefined( var_3 ) && isdefined( self._id_04A7 ) && isdefined( var_3._id_04A7 ) && !isalliedsentient( self, var_3 ) )
        {
            if ( !isdefined( var_3._id_1706 ) )
                var_0 = var_3;

            if ( _func_0CF( var_3 ) && !isdefined( var_3._id_1705 ) )
                var_1 = var_3;
        }
    }

    if ( isdefined( var_0 ) )
    {
        self._id_1705 = 1;
        var_0._id_1706 = 1;
        self _meth_8169( var_0 );
    }

    if ( isdefined( var_1 ) )
    {
        var_1._id_1705 = 1;
        self._id_1706 = 1;
        var_1 _meth_8169( self );
    }
}

_id_1697( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        return self _meth_813B( var_0, var_1 );
    else
        return self _meth_813B( var_0 );
}

_id_1712()
{
    self notify( "bot_think_gametype" );
    self endon( "bot_think_gametype" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    self thread [[ level._id_161B["gametype_think"] ]]();
}

_id_277D()
{

}

_id_5E06()
{
    maps\mp\bots\_bots_util::_id_172D();
    level.bot_smoke_sight_clip_small = getent( "smoke_grenade_sight_clip_small", "targetname" );

    if ( !isdefined( level.bot_smoke_sight_clip_small ) )
        return;

    level.bot_smoke_sight_clip_medium = getent( "smoke_grenade_sight_clip_medium", "targetname" );

    if ( !isdefined( level.bot_smoke_sight_clip_medium ) )
        return;

    level.bot_smoke_sight_clip_large = getent( "smoke_grenade_sight_clip_large", "targetname" );

    if ( !isdefined( level.bot_smoke_sight_clip_large ) )
        return;

    for (;;)
    {
        level waittill( "smoke", var_0, var_1 );
        var_2 = maps\mp\_utility::_id_8F5C( var_1, "_lefthand" );

        if ( var_2 == "h1_smokegrenade_mp" )
            var_0 thread _id_460E();
    }
}

_id_460E()
{
    self waittill( "explode", var_0 );
    var_1 = common_scripts\utility::_id_8959();
    var_1 _meth_8055();
    var_1._id_02E2 = var_0;
    var_2 = 0.3;
    wait(var_2);
    var_2 = 0.65;
    var_1 _meth_8274( level.bot_smoke_sight_clip_small );
    wait(var_2);
    var_2 = 1.5;
    var_1 _meth_8274( level.bot_smoke_sight_clip_medium );
    wait(var_2);
    var_2 = 7.95;
    var_1 _meth_8274( level.bot_smoke_sight_clip_large );
    wait(var_2);
    var_1 delete();
}

_id_15A4( var_0 )
{
    var_1 = 0;
    var_0._id_175D = "scavenger_bag";
    var_0._id_175B = 1;

    if ( !isdefined( level._id_16D4 ) )
        level._id_16D4 = [];

    foreach ( var_4, var_3 in level._id_16D4 )
    {
        if ( !isdefined( var_3 ) )
        {
            var_1 = 1;
            level._id_16D4[var_4] = var_0;
            break;
        }
    }

    if ( !var_1 )
        level._id_16D4[level._id_16D4.size] = var_0;

    foreach ( var_6 in level._id_669D )
    {
        if ( _func_0CF( var_6 ) && var_6 maps\mp\_utility::_id_05CB( "specialty_scavenger" ) )
            var_6 notify( "new_crate_to_take" );
    }
}

_id_171A()
{
    var_0 = getentarray( "bot_flag_set", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_0398 ) )
            continue;

        var_2 thread _id_1618( var_2._id_0398 );
    }
}

_id_1618( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( maps\mp\_utility::_id_50AD( var_1 ) )
        {
            var_1 notify( "flag_trigger_set_" + var_0 );
            var_1 _meth_834F( var_0, 1 );
            var_1 thread _id_1619( var_0 );
        }
    }
}

_id_1619( var_0 )
{
    self endon( "flag_trigger_set_" + var_0 );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    waittillframeend;
    waitframe;
    self _meth_834F( var_0, 0 );
}

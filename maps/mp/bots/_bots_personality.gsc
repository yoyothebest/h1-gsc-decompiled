// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_825A()
{
    level._id_16B0 = [];
    level._id_16B1 = [];
    level._id_16B0["active"][0] = "default";
    level._id_16B0["active"][1] = "run_and_gun";
    level._id_16B0["active"][2] = "cqb";
    level._id_16B0["stationary"][0] = "camper";
    level._id_16B2 = [];

    foreach ( var_5, var_1 in level._id_16B0 )
    {
        foreach ( var_3 in var_1 )
        {
            level._id_16B2[var_3] = var_5;
            level._id_16B1[level._id_16B1.size] = var_3;
        }
    }

    level._id_16B3 = [];
    level._id_16B3["active"] = 4;
    level._id_16B3["stationary"] = 1;
    level._id_16AE = [];
    level._id_16AE["default"] = ::_id_4D30;
    level._id_16AE["camper"] = ::_id_4D2F;
    level._id_16AF["default"] = ::_id_9AD2;
    level._id_16AF["camper"] = ::_id_9AD1;
}

_id_15AD()
{
    self._id_67DF = self _meth_8364();
    self._id_0308["personality"] = self._id_67DF;
    self._id_67E0 = level._id_16AE[self._id_67DF];

    if ( !isdefined( self._id_67E0 ) )
        self._id_67E0 = level._id_16AE["default"];

    self [[ self._id_67E0 ]]();
    self._id_67E1 = level._id_16AF[self._id_67DF];

    if ( !isdefined( self._id_67E1 ) )
        self._id_67E1 = level._id_16AF["default"];
}

_id_15B0()
{
    if ( isdefined( self._id_67E2 ) && self._id_67E2 )
        return;

    if ( isdefined( self._id_0308["personality"] ) )
    {
        self _meth_8367( self._id_0308["personality"] );
        return;
    }

    var_0 = self._id_04A7;

    if ( !isdefined( var_0 ) && !isdefined( self._id_170E ) )
        var_0 = self._id_0308["team"];

    var_1 = _func_1D3( level._id_16B3 );
    var_2 = [];
    var_3 = [];

    foreach ( var_9, var_5 in level._id_16B0 )
    {
        var_3[var_9] = 0;

        foreach ( var_7 in var_5 )
            var_2[var_7] = 0;
    }

    foreach ( var_11 in level._id_669D )
    {
        if ( var_11 == self )
            continue;

        if ( !maps\mp\_utility::_id_51CE( var_11 ) || !isdefined( var_11._id_46E0 ) )
            continue;

        if ( isdefined( var_11._id_04A7 ) && var_11._id_04A7 == var_0 || !level._id_91EB )
        {
            var_7 = var_11 _meth_8364();
            var_9 = level._id_16B2[var_7];
            var_2[var_7] += 1;
            var_3[var_9] += 1;
        }
    }

    var_13 = [];

    foreach ( var_15 in var_1 )
        var_13[var_15] = _func_0BC( var_3[var_15] / level._id_16B3[var_15] );

    var_17 = undefined;

    for ( var_18 = 0; var_18 < var_1.size && !isdefined( var_17 ); var_18++ )
    {
        var_19 = var_1[var_18];
        var_20 = 1;

        for ( var_21 = 0; var_21 < var_1.size; var_21++ )
        {
            var_22 = var_1[var_21];

            if ( var_19 != var_22 )
            {
                if ( var_13[var_19] >= var_13[var_22] )
                    var_20 = 0;
            }
        }

        if ( var_20 )
            var_17 = var_19;
    }

    if ( !isdefined( var_17 ) )
    {
        var_23 = [];

        foreach ( var_15 in var_1 )
            var_23[var_15] = level._id_16B3[var_15] - var_3[var_15] % level._id_16B3[var_15];

        var_26 = 0;

        foreach ( var_15 in var_1 )
            var_26 += var_23[var_15];

        var_29 = _func_0B3( var_26 );

        foreach ( var_15 in var_1 )
        {
            if ( var_29 < var_23[var_15] )
            {
                var_17 = var_15;
                break;
            }

            var_29 -= var_23[var_15];
        }
    }

    var_32 = undefined;
    var_33 = undefined;
    var_34 = 9999;
    var_35 = undefined;
    var_36 = -9999;
    var_37 = common_scripts\utility::_id_0CF5( level._id_16B0[var_17] );

    foreach ( var_7 in var_37 )
    {
        if ( var_2[var_7] < var_34 )
        {
            var_33 = var_7;
            var_34 = var_2[var_7];
        }

        if ( var_2[var_7] > var_36 )
        {
            var_35 = var_7;
            var_36 = var_2[var_7];
        }
    }

    if ( var_36 - var_34 >= 2 )
        var_32 = var_33;
    else
        var_32 = common_scripts\utility::_id_710E( level._id_16B0[var_17] );

    if ( self _meth_8364() != var_32 )
        self _meth_8367( var_32 );

    self._id_46E0 = 1;
}

_id_4D2F()
{
    _id_1EA3();
}

_id_4D30()
{
    _id_1EA3();
}

_id_9AD1()
{
    if ( _id_8476() && !maps\mp\bots\_bots_util::_id_165D() && !maps\mp\bots\_bots_util::_id_1664() )
    {
        var_0 = self _meth_835B();
        var_1 = 0;

        if ( !isdefined( self._id_1A41 ) )
            self._id_1A41 = 0;

        var_2 = var_0 == "hunt";
        var_3 = gettime() > self._id_1A41 + 10000;

        if ( ( !var_2 || var_3 ) && !maps\mp\bots\_bots_util::_id_16AB() )
        {
            if ( !self _meth_8363() )
                _id_16C7();

            if ( isdefined( level.override_find_camp_node ) )
                var_1 = [[ level.override_find_camp_node ]]();

            if ( !var_1 )
            {
                var_1 = _id_3757();

                if ( !var_1 )
                    self._id_1A41 = gettime();
            }
        }

        if ( isdefined( var_1 ) && var_1 )
        {
            self._id_0B62 = maps\mp\bots\_bots_util::_id_16C3( "bot_find_ambush_entrances", ::_id_160F, self._id_6121, 1 );
            var_4 = maps\mp\bots\_bots_strategy::_id_162B( "trap_directional", "trap", "c4" );

            if ( isdefined( var_4 ) )
            {
                var_5 = gettime();
                maps\mp\bots\_bots_strategy::_id_16E8( var_4, self._id_0B62, self._id_6121, self._id_0B68 );
                var_5 = gettime() - var_5;

                if ( var_5 > 0 && isdefined( self._id_0B61 ) && isdefined( self._id_6121 ) )
                {
                    self._id_0B61 += var_5;
                    self._id_6121._id_15AC = self._id_0B61 + 10000;
                }
            }

            if ( !maps\mp\bots\_bots_strategy::_id_1649() && !maps\mp\bots\_bots_util::_id_165D() && isdefined( self._id_6121 ) )
            {
                self _meth_8353( self._id_6121, "camp", self._id_0B68 );
                thread _id_1ED2( "bad_path", "node_relinquished", "out_of_ammo" );
                thread _id_A1ED();
                thread _id_15A2( "clear_camper_data", "goal" );
                thread _id_1732( "clear_camper_data", "bot_add_ambush_time_delayed", self._id_0B62, self._id_0B68 );
                return;
            }
        }
        else
        {
            if ( var_0 == "camp" )
                self _meth_8354();

            _id_9AD2();
        }
    }
}

_id_9AD2()
{
    var_0 = undefined;
    var_1 = self _meth_8363();

    if ( var_1 )
        var_0 = self _meth_8358();

    if ( !maps\mp\bots\_bots_strategy::_id_1649() && !maps\mp\bots\_bots_util::_id_1664() )
    {
        var_2 = undefined;
        var_3 = undefined;

        if ( var_1 )
        {
            var_2 = _func_0F0( self._id_02E2, var_0 );
            var_3 = self _meth_8359();
            var_4 = var_3 * 2;

            if ( isdefined( self._id_16A1 ) && var_2 < var_4 * var_4 )
            {
                var_5 = _func_1FA( "investigated" );
                _func_1FB( 0, gettime() - self._id_16A2, 1, self._id_16A1, var_4, "kill", var_5, self );
                _func_1FB( 0, gettime() - self._id_16A2, 1, self._id_16A1, var_4, "death", var_5, self );
                self._id_16A1 = undefined;
                self._id_16A2 = undefined;
            }
        }

        if ( !var_1 || var_2 < var_3 * var_3 )
        {
            var_6 = _id_16C7();
            var_7 = 25;

            if ( maps\mp\_utility::_id_5092( self.encourage_explosive_use ) )
                var_7 = 50;

            if ( var_6 && _func_0B3( 100 ) < var_7 )
            {
                var_8 = maps\mp\bots\_bots_strategy::_id_162B( "trap_directional", "trap" );

                if ( isdefined( var_8 ) )
                {
                    var_9 = self _meth_8358();

                    if ( isdefined( var_9 ) )
                    {
                        var_10 = _func_0C8( var_9 );

                        if ( isdefined( var_10 ) )
                        {
                            var_11 = _id_160F( var_10, 0 );
                            var_12 = maps\mp\bots\_bots_strategy::_id_16E8( var_8, var_11, var_10 );

                            if ( !isdefined( var_12 ) || var_12 )
                            {
                                self _meth_8354();
                                var_6 = _id_16C7();
                            }
                        }
                    }
                }
            }

            if ( var_6 )
                thread _id_1ED2( "enemy", "bad_path", "goal", "node_relinquished", "search_end" );
        }
    }
}

_id_1ED2( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "clear_script_goal_on" );
    self endon( "clear_script_goal_on" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "start_tactical_goal" );
    var_5 = self _meth_8358();
    var_6 = 1;

    while ( var_6 )
    {
        var_7 = common_scripts\utility::_id_A070( var_0, var_1, var_2, var_3, var_4, "script_goal_changed" );
        var_6 = 0;
        var_8 = 1;

        if ( var_7 == "node_relinquished" || var_7 == "goal" || var_7 == "script_goal_changed" )
        {
            if ( !self _meth_8363() )
                var_8 = 0;
            else
            {
                var_9 = self _meth_8358();
                var_8 = maps\mp\bots\_bots_util::_id_172A( var_5, var_9 );
            }
        }

        if ( var_7 == "enemy" && isdefined( self._id_0142 ) )
        {
            var_8 = 0;
            var_6 = 1;
        }

        if ( var_8 )
            self _meth_8354();
    }
}

_id_A1ED()
{
    self notify( "watch_out_of_ammo" );
    self endon( "watch_out_of_ammo" );
    self endon( "death" );
    self endon( "disconnect" );

    while ( !maps\mp\bots\_bots_util::_id_16AB() )
        wait 0.5;

    self notify( "out_of_ammo" );
}

_id_15A2( var_0, var_1 )
{
    self notify( "bot_add_ambush_time_delayed" );
    self endon( "bot_add_ambush_time_delayed" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        self endon( var_0 );

    self endon( "node_relinquished" );
    self endon( "bad_path" );
    var_2 = gettime();

    if ( isdefined( var_1 ) )
        self waittill( var_1 );

    if ( isdefined( self._id_0B61 ) && isdefined( self._id_6121 ) )
    {
        self._id_0B61 += gettime() - var_2;
        self._id_6121._id_15AC = self._id_0B61 + 10000;
    }

    self notify( "bot_add_ambush_time_delayed" );
}

_id_1732( var_0, var_1, var_2, var_3 )
{
    self notify( "bot_watch_entrances_delayed" );

    if ( var_2.size > 0 )
    {
        self endon( "bot_watch_entrances_delayed" );
        self endon( "death" );
        self endon( "disconnect" );
        self endon( var_0 );
        self endon( "node_relinquished" );
        self endon( "bad_path" );

        if ( isdefined( var_1 ) )
            self waittill( var_1 );

        self endon( "path_enemy" );
        childthread maps\mp\bots\_bots_util::_id_1736( var_2, var_3, 0, self._id_0B61 );
        childthread _id_16A8();
    }
}

_id_16A8()
{
    self notify( "bot_monitor_watch_entrances_camp" );
    self endon( "bot_monitor_watch_entrances_camp" );
    self notify( "bot_monitor_watch_entrances" );
    self endon( "bot_monitor_watch_entrances" );
    self endon( "disconnect" );
    self endon( "death" );

    while ( !isdefined( self._id_A1EA ) )
        wait 0.05;

    while ( isdefined( self._id_A1EA ) )
    {
        foreach ( var_1 in self._id_A1EA )
            var_1._id_A1E9[self._id_3314] = 1.0;

        maps\mp\bots\_bots_strategy::_id_6FBD( 0.5 );
        wait(_func_0B5( 0.5, 0.75 ));
    }
}

_id_160F( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = [];
    var_3 = _func_212( var_0._id_02E2 );

    if ( isdefined( var_3 ) && var_3.size > 0 )
    {
        wait 0.05;
        var_4 = var_0._id_04D9 != "Cover Stand" && var_0._id_04D9 != "Conceal Stand";

        if ( var_4 && var_1 )
            var_3 = self _meth_837E( var_3, "node_exposure_vis", var_0._id_02E2, "crouch" );

        foreach ( var_6 in var_3 )
        {
            if ( _func_0F0( self._id_02E2, var_6._id_02E2 ) < 90000 )
                continue;

            if ( var_4 && var_1 )
            {
                wait 0.05;

                if ( !maps\mp\bots\_bots_util::_id_332B( var_6._id_02E2, var_0._id_02E2, "crouch" ) )
                    continue;
            }

            var_2[var_2.size] = var_6;
        }
    }

    return var_2;
}

_id_160B( var_0 )
{
    var_1 = [];
    var_2 = gettime();
    var_3 = var_0.size;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( !isdefined( var_5._id_15AC ) || var_2 > var_5._id_15AC )
            var_1[var_1.size] = var_5;
    }

    return var_1;
}

_id_160C( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = [];
    var_5 = var_2 * var_2;

    if ( level._id_91EB )
    {
        foreach ( var_7 in level._id_669D )
        {
            if ( !maps\mp\_utility::_id_5189( var_7 ) )
                continue;

            if ( !isdefined( var_7._id_04A7 ) )
                continue;

            if ( var_7._id_04A7 == var_1._id_04A7 && var_7 != var_1 && isdefined( var_7._id_6121 ) )
                var_4[var_4.size] = var_7._id_6121._id_02E2;
        }
    }

    var_9 = var_4.size;
    var_10 = var_0.size;

    for ( var_11 = 0; var_11 < var_10; var_11++ )
    {
        var_12 = 0;
        var_13 = var_0[var_11];

        for ( var_14 = 0; !var_12 && var_14 < var_9; var_14++ )
        {
            var_15 = _func_0F0( var_4[var_14], var_13._id_02E2 );
            var_12 = var_15 < var_5;
        }

        if ( !var_12 )
            var_3[var_3.size] = var_13;
    }

    return var_3;
}

_id_1EA3()
{
    self notify( "clear_camper_data" );

    if ( isdefined( self._id_6121 ) && isdefined( self._id_6121._id_15AC ) )
        self._id_6121._id_15AC = undefined;

    self._id_6121 = undefined;
    self._id_6E21 = undefined;
    self._id_0B68 = undefined;
    self._id_0B62 = undefined;
    self._id_0B60 = _func_0B4( 20000, 30000 );
    self._id_0B61 = -1;
}

_id_8476()
{
    if ( maps\mp\bots\_bots_strategy::_id_1649() )
        return 0;

    if ( gettime() > self._id_0B61 )
        return 1;

    if ( !self _meth_8363() )
        return 1;

    return 0;
}

_id_3757()
{
    self notify( "find_camp_node" );
    self endon( "find_camp_node" );
    return maps\mp\bots\_bots_util::_id_16C3( "find_camp_node_worker", ::_id_3758 );
}

_id_3758()
{
    self notify( "find_camp_node_worker" );
    self endon( "find_camp_node_worker" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_1EA3();

    if ( level._id_A3EF <= 0 )
        return 0;

    var_0 = _func_207( self._id_02E2 );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = self _meth_8338();

    if ( isdefined( var_0 ) )
    {
        var_4 = _func_1F9( var_0, self._id_04A7, -1, "enemy_predict", ">", 0, "ally", "<", 1 );

        if ( !isdefined( var_4 ) )
            var_4 = _func_1F9( var_0, self._id_04A7, -1, "enemy_predict", ">", 0 );

        if ( isdefined( var_4 ) )
        {
            var_5 = _func_20D( var_4 );
            var_6 = _func_215( var_5 );

            if ( var_6.size == 0 )
                var_4 = undefined;
        }

        if ( !isdefined( var_4 ) )
        {
            var_7 = -1;
            var_8 = -1;

            for ( var_9 = 0; var_9 < level._id_A3EF; var_9++ )
            {
                var_5 = _func_20D( var_9 );
                var_6 = _func_215( var_5 );

                if ( var_6.size > 0 )
                {
                    var_10 = common_scripts\utility::_id_710E( _func_208( var_9 ) );
                    var_11 = isdefined( var_10._id_04A6 ) && var_10._id_04A6 == "no_bot_random_path";

                    if ( !var_11 )
                    {
                        var_12 = _func_225( _func_20A( var_9 ), self._id_02E2 );

                        if ( var_12 > var_7 )
                        {
                            var_7 = var_12;
                            var_8 = var_9;
                        }
                    }
                }
            }

            var_4 = var_8;
        }

        var_13 = _func_209( var_0, var_4 );

        if ( !isdefined( var_13 ) || var_13.size == 0 )
            return 0;

        for ( var_14 = 0; var_14 <= _func_0BC( var_13.size / 2 ); var_14++ )
        {
            var_1 = var_13[var_14];
            var_2 = var_13[_func_0BC( _func_0BF( var_14 + 1, var_13.size - 1 ) )];

            if ( _func_1F7( var_2, self._id_04A7, "enemy_predict" ) != 0 )
                break;
        }

        if ( isdefined( var_1 ) && isdefined( var_2 ) && var_1 != var_2 )
        {
            var_3 = _func_20A( var_2 ) - _func_20A( var_1 );
            var_3 = _func_115( var_3 );
        }
    }

    var_15 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_16 = 1;
        var_17 = 1;
        var_18 = 0;

        while ( var_16 )
        {
            var_19 = _func_20C( var_1, 800 * var_17, 1 );

            if ( var_19.size > 1024 )
                var_19 = _func_208( var_1, 0 );

            wait 0.05;
            var_20 = _func_0B2( 100 );

            if ( var_20 < 66 && var_20 >= 33 )
                var_3 = ( var_3[0], var_3[1] + 45, 0 );
            else if ( var_20 < 33 )
                var_3 = ( var_3[0], var_3[1] - 45, 0 );

            if ( var_19.size > 0 )
            {
                while ( var_19.size > 1024 )
                    var_19[var_19.size - 1] = undefined;

                var_21 = _func_0BC( _func_0E9( var_19.size * 0.15, 1, 10 ) );

                if ( var_18 )
                    var_19 = self _meth_836F( var_19, var_21, var_21, "node_camp", anglestoforward( var_3 ), "lenient" );
                else
                    var_19 = self _meth_836F( var_19, var_21, var_21, "node_camp", anglestoforward( var_3 ) );

                var_19 = _id_160B( var_19 );

                if ( !isdefined( self._id_1A47 ) || !self._id_1A47 )
                {
                    var_22 = 800;
                    var_19 = _id_160C( var_19, self, var_22 );
                }

                if ( var_19.size > 0 )
                    var_15 = common_scripts\utility::_id_711C( var_19 );
            }

            if ( isdefined( var_15 ) )
                var_16 = 0;
            else if ( isdefined( self._id_1A43 ) )
            {
                if ( var_17 == 1 && !var_18 )
                    var_17 = 3;
                else if ( var_17 == 3 && !var_18 )
                    var_18 = 1;
                else if ( var_17 == 3 && var_18 )
                    var_16 = 0;
            }
            else
                var_16 = 0;

            if ( var_16 )
                wait 0.05;
        }
    }

    if ( !isdefined( var_15 ) || !self _meth_835E( var_15 ) )
        return 0;

    self._id_6121 = var_15;
    self._id_0B61 = gettime() + self._id_0B60;
    self._id_6121._id_15AC = self._id_0B61;
    self._id_0B68 = var_3[1];
    return 1;
}

_id_3753( var_0, var_1 )
{
    _id_1EA3();

    if ( isdefined( var_0 ) )
        self._id_6E21 = var_0;
    else
    {
        var_2 = undefined;
        var_3 = _func_0C6( self._id_02E2, 5000, 0, 2000 );

        if ( var_3.size > 0 )
            var_2 = self _meth_8362( var_3, var_3.size * 0.25, "node_traffic" );

        if ( isdefined( var_2 ) )
            self._id_6E21 = var_2._id_02E2;
        else
            return 0;
    }

    var_4 = 2000;

    if ( isdefined( var_1 ) )
        var_4 = var_1;

    var_5 = _func_0C6( self._id_6E21, var_4, 0, 1000 );
    var_6 = undefined;

    if ( var_5.size > 0 )
    {
        var_7 = _func_0BC( _func_0E1( 1, _func_0BC( var_5.size * 0.15 ) ) );
        var_5 = self _meth_836F( var_5, var_7, var_7, "node_ambush", self._id_6E21 );
    }

    var_5 = _id_160B( var_5 );

    if ( var_5.size > 0 )
        var_6 = common_scripts\utility::_id_711C( var_5 );

    if ( !isdefined( var_6 ) || !self _meth_835E( var_6 ) )
        return 0;

    self._id_6121 = var_6;
    self._id_0B61 = gettime() + self._id_0B60;
    self._id_6121._id_15AC = self._id_0B61;
    var_8 = _func_114( self._id_6E21 - self._id_6121._id_02E2 );
    var_9 = _func_115( var_8 );
    self._id_0B68 = var_9[1];
    return 1;
}

_id_16C7()
{
    if ( maps\mp\bots\_bots_util::_id_1664() )
        return 0;

    var_0 = level._id_16C9[self._id_04A7];
    return self [[ var_0 ]]();
}

_id_16C8()
{
    var_0 = 0;
    var_1 = 50;

    if ( self._id_67DF == "camper" )
        var_1 = 0;

    var_2 = undefined;

    if ( _func_0B2( 100 ) < var_1 )
        var_2 = maps\mp\bots\_bots_util::_id_16CB();

    if ( !isdefined( var_2 ) )
    {
        var_3 = self _meth_835F();

        if ( isdefined( var_3 ) )
            var_2 = var_3._id_02E2;
    }

    if ( isdefined( var_2 ) )
        var_0 = self _meth_8352( var_2, 128, "hunt" );

    return var_0;
}

_id_16F3()
{
    if ( maps\mp\bots\_bots_loadout::_id_16F4() )
        return "callback";
    else
        return "class0";
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_1637( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_0C6( self._id_02E2, var_1, var_0 );
    var_5 = [];
    var_6 = self _meth_8385();
    var_7 = anglestoforward( self _meth_8338() );
    var_8 = _func_114( var_7 * ( 1, 1, 0 ) );

    foreach ( var_10 in var_4 )
    {
        var_11 = _func_114( ( var_10._id_02E2 - self._id_02E2 ) * ( 1, 1, 0 ) );
        var_12 = _func_0F6( var_11, var_8 );

        if ( var_12 > var_2 )
        {
            if ( !var_3 || isdefined( var_6 ) && _func_204( var_10, var_6, 1 ) )
                var_5[var_5.size] = var_10;
        }
    }

    return var_5;
}

_id_1644( var_0, var_1 )
{
    if ( var_0 == "none" )
        return var_1 == "none";
    else if ( var_0 == "hunt" )
        return var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "guard" )
        return var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "objective" )
        return var_1 == "objective" || var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "critical" )
        return var_1 == "critical" || var_1 == "objective" || var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "tactical" )
        return 1;
}

_id_16ED( var_0 )
{
    self _meth_8367( var_0 );
    maps\mp\bots\_bots_personality::_id_15AD();
    self _meth_8354();
}

_id_16EB( var_0, var_1 )
{
    if ( var_0 == "default" )
        var_0 = _id_15D6();

    var_3 = self _meth_8369();
    self _meth_8368( var_0 );

    if ( _func_1AD( self ) && var_3 != var_0 )
    {
        maps\mp\_utility::_id_7EA5();
        var_4 = _func_2EC( maps\mp\gametypes\_rank::_id_4137(), 0 );
        self._id_0308["rank"] = var_4;
        var_5 = self._id_0308["prestige"];
        self _meth_829D( var_4, var_5 );
    }
}

_id_15D6()
{
    if ( !isdefined( level._id_15F8 ) )
    {
        level._id_15F8 = [];
        level._id_15F8[level._id_15F8.size] = "easy";
        level._id_15F8[level._id_15F8.size] = "normal";
        level._id_15F8[level._id_15F8.size] = "hard";
    }

    if ( !isdefined( level.bot_next_difficulty_type_index ) )
        level.bot_next_difficulty_type_index = [];

    if ( !isdefined( level.bot_next_difficulty_type_index["allies"] ) )
        level.bot_next_difficulty_type_index["allies"] = 0;

    if ( !isdefined( level.bot_next_difficulty_type_index["axis"] ) )
        level.bot_next_difficulty_type_index["axis"] = 0;

    if ( !isdefined( level.bot_next_difficulty_type_index["all"] ) )
        level.bot_next_difficulty_type_index["all"] = 0;

    if ( !isdefined( self._id_0308["bot_chosen_difficulty"] ) )
    {
        var_0 = undefined;

        if ( level._id_91EB )
        {
            var_1 = self._id_04A7;

            if ( !isdefined( var_1 ) )
                var_1 = self._id_170E;

            if ( !isdefined( var_1 ) )
                var_1 = self._id_0308["team"];
        }
        else
            var_1 = "all";

        var_0 = level.bot_next_difficulty_type_index[var_1];
        var_2 = level._id_15F8[var_0];
        self._id_0308["bot_chosen_difficulty"] = get_difficulty_for_difficulty_type( var_2 );
        level.bot_next_difficulty_type_index[var_1] = ( level.bot_next_difficulty_type_index[var_1] + 1 ) % level._id_15F8.size;
    }

    return self._id_0308["bot_chosen_difficulty"];
}

get_difficulty_for_difficulty_type( var_0 )
{
    if ( var_0 == "easy" )
        return "recruit";
    else if ( var_0 == "normal" )
        return "regular";
    else if ( var_0 == "hard" )
        return common_scripts\utility::_id_710E( [ "hardened", "veteran" ] );
    else
    {

    }
}

_id_165A()
{
    if ( _id_165D() )
    {
        if ( self._id_15F7 == "capture" || self._id_15F7 == "capture_zone" )
            return 1;
    }

    return 0;
}

_id_1661()
{
    if ( _id_165D() )
    {
        if ( self._id_15F7 == "patrol" )
            return 1;
    }

    return 0;
}

_id_1662()
{
    if ( _id_165D() )
    {
        if ( self._id_15F7 == "protect" )
            return 1;
    }

    return 0;
}

_id_1659()
{
    if ( _id_165D() )
    {
        if ( self._id_15F7 == "bodyguard" )
            return 1;
    }

    return 0;
}

_id_165D()
{
    return isdefined( self._id_15F1 );
}

_id_165E( var_0 )
{
    if ( _id_165D() )
    {
        if ( _id_172A( self._id_15F2, var_0 ) )
            return 1;
    }

    return 0;
}

_id_165F( var_0 )
{
    if ( _id_1659() && self._id_15EE == var_0 )
        return 1;

    return 0;
}

_id_332B( var_0, var_1, var_2 )
{
    var_3 = ( 0, 0, 11 );
    var_4 = ( 0, 0, 40 );
    var_5 = undefined;

    if ( var_2 == "stand" )
        return 1;
    else if ( var_2 == "crouch" )
        var_5 = var_4;
    else if ( var_2 == "prone" )
        var_5 = var_3;

    return _func_08E( var_1 + var_5, var_0 + var_5, 0, undefined );
}

_id_3D64( var_0, var_1 )
{
    var_2 = _id_3AE9( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        var_2 = _id_7347( var_2 );
        var_2 = _id_3CBC( var_2 );
    }

    return var_2;
}

_id_3AEA( var_0, var_1 )
{
    return _func_214( var_0, var_1 );
}

_id_3AE9( var_0, var_1 )
{
    return _func_205( var_0, var_1 );
}

_id_3AE5( var_0, var_1, var_2 )
{
    return _func_202( var_0, var_1, var_2 );
}

_id_6126( var_0, var_1 )
{
    if ( !isdefined( self._id_6444 ) )
        return 0;

    if ( isdefined( self._id_6444[var_0] ) && isdefined( self._id_6444[var_0][var_1] ) && self._id_6444[var_0][var_1] )
        return 1;

    if ( isdefined( self._id_6444[var_1] ) && isdefined( self._id_6444[var_1][var_0] ) && self._id_6444[var_1][var_0] )
        return 1;

    return 0;
}

_id_3CBC( var_0 )
{
    var_1 = var_0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = _func_215( var_0[var_2] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( !common_scripts\utility::_id_0CE4( var_1, var_3[var_4] ) )
                var_1 = common_scripts\utility::_id_0CDA( var_1, var_3[var_4] );
        }
    }

    return var_1;
}

_id_3EBE( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( _func_204( var_4, var_1, 1 ) )
            var_2 = common_scripts\utility::_id_0CDA( var_2, var_4 );
    }

    return var_2;
}

_id_7347( var_0 )
{
    var_0[var_0.size - 1] = undefined;
    var_0[0] = undefined;
    return common_scripts\utility::_id_0D01( var_0 );
}

_id_172D( var_0 )
{
    while ( !_id_15BC( var_0 ) )
        wait 0.5;
}

_id_15BC( var_0 )
{
    if ( _func_1F6() != "off" )
        return 1;

    if ( isdefined( level._id_08E7 ) && level._id_08E7 )
        return 1;

    if ( _id_1745( var_0 ) )
        return 1;

    return 0;
}

_id_172F( var_0 )
{
    var_1 = gettime();

    for (;;)
    {
        if ( isdefined( var_0 ) )
        {
            if ( gettime() > var_1 + var_0 )
                return;
        }

        if ( !isdefined( self._id_0142 ) )
            return;
        else if ( !_id_1650() )
            return;

        wait 0.05;
    }
}

_id_1650( var_0 )
{
    if ( self._id_5523 == 0 )
        return 0;

    var_1 = gettime() - self._id_5523;
    var_2 = level._id_16AC;

    if ( isdefined( var_0 ) )
        var_2 = var_0;

    return var_1 < var_2;
}

_id_172E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) && isdefined( var_2 ) )
    {

    }

    var_3 = [ "goal", "bad_path", "no_path", "node_relinquished", "script_goal_changed" ];

    if ( isdefined( var_1 ) )
        var_3[var_3.size] = var_1;

    if ( isdefined( var_2 ) )
        var_3[var_3.size] = var_2;

    if ( isdefined( var_0 ) )
        var_4 = common_scripts\utility::_id_A06B( var_3, var_0 );
    else
        var_4 = common_scripts\utility::_id_A06D( var_3 );

    return var_4;
}

_id_1724( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    childthread _id_9BD5();
    var_3 = common_scripts\utility::_id_A073( var_0, var_1, var_2, "use_button_no_longer_pressed", "finished_use" );
    self notify( "stop_usebutton_watcher" );
    return var_3;
}

_id_9BD5( var_0, var_1 )
{
    self endon( "stop_usebutton_watcher" );
    wait 0.05;

    while ( self _meth_8339() )
        wait 0.05;

    self notify( "use_button_no_longer_pressed" );
}

_id_1745( var_0 )
{
    foreach ( var_2 in level._id_669D )
    {
        if ( _func_0CF( var_2 ) )
        {
            if ( isdefined( var_0 ) && var_0 )
            {
                if ( !maps\mp\_utility::_id_51CE( var_2 ) )
                    continue;
            }

            return 1;
        }
    }

    return 0;
}

_id_162D( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_3323 ) && !isdefined( self._id_27B4 ) )
        return undefined;

    if ( _func_0CE( var_1 ) )
    {
        if ( isdefined( var_2 ) && var_2 )
        {
            var_3 = undefined;
            var_4 = 999999999;

            foreach ( var_6 in var_1 )
            {
                var_7 = common_scripts\utility::_id_0CE8( level._id_3320, var_6 );
                var_8 = level._id_3321[var_7];
                var_9 = _func_0F0( self._id_02E2, var_8 );

                if ( var_9 < var_4 )
                {
                    var_3 = var_6;
                    var_4 = var_9;
                }
            }

            var_1 = var_3;
        }
        else
            var_1 = common_scripts\utility::_id_710E( var_1 );
    }

    var_11 = [];

    if ( isdefined( self._id_27B4 ) )
        var_11 = self._id_27B4;
    else
        var_11 = level._id_3322[var_1];

    if ( !isdefined( var_0 ) || var_0 == "stand" )
        return var_11;
    else if ( var_0 == "crouch" )
    {
        var_12 = [];

        foreach ( var_14 in var_11 )
        {
            if ( var_14._id_2480[var_1] )
                var_12 = common_scripts\utility::_id_0CDA( var_12, var_14 );
        }

        return var_12;
    }
    else if ( var_0 == "prone" )
    {
        var_12 = [];

        foreach ( var_14 in var_11 )
        {
            if ( var_14._id_7020[var_1] )
                var_12 = common_scripts\utility::_id_0CDA( var_12, var_14 );
        }

        return var_12;
    }

    return undefined;
}

_id_1615( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = self._id_15EE _meth_8336();

    if ( _func_0F3( var_4 ) > 100 )
    {
        var_5 = _func_0C6( var_0, var_1 * 1.75, var_1 * 0.5, 500 );
        var_6 = [];
        var_7 = _func_114( var_4 );

        for ( var_8 = 0; var_8 < var_5.size; var_8++ )
        {
            var_9 = _func_114( var_5[var_8]._id_02E2 - self._id_15EE._id_02E2 );

            if ( _func_0F6( var_9, var_7 ) > 0.1 )
                var_6[var_6.size] = var_5[var_8];
        }
    }
    else
        var_6 = _func_0C6( var_0, var_1, 0, 500 );

    if ( isdefined( var_2 ) && var_2 )
    {
        var_10 = _func_114( self._id_15EE._id_02E2 - self._id_02E2 );
        var_11 = var_6;
        var_6 = [];

        foreach ( var_13 in var_11 )
        {
            var_9 = _func_114( var_13._id_02E2 - self._id_15EE._id_02E2 );

            if ( _func_0F6( var_10, var_9 ) > 0.2 )
                var_6[var_6.size] = var_13;
        }
    }

    var_15 = [];
    var_16 = [];
    var_17 = [];

    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
    {
        var_18 = _func_0F0( var_6[var_8]._id_02E2, var_0 ) > 10000;
        var_19 = _func_0BE( var_6[var_8]._id_02E2[2] - self._id_15EE._id_02E2[2] ) < 50;

        if ( var_18 )
            var_15[var_15.size] = var_6[var_8];

        if ( var_19 )
            var_16[var_16.size] = var_6[var_8];

        if ( var_18 && var_19 )
            var_17[var_17.size] = var_6[var_8];

        if ( var_8 % 100 == 99 )
            wait 0.05;
    }

    if ( var_17.size > 0 )
        var_3 = self _meth_8362( var_17, var_17.size * 0.15, "node_capture", var_0, undefined, self._id_27B5 );

    if ( !isdefined( var_3 ) )
    {
        wait 0.05;

        if ( var_16.size > 0 )
            var_3 = self _meth_8362( var_16, var_16.size * 0.15, "node_capture", var_0, undefined, self._id_27B5 );

        if ( !isdefined( var_3 ) && var_15.size > 0 )
        {
            wait 0.05;
            var_3 = self _meth_8362( var_15, var_15.size * 0.15, "node_capture", var_0, undefined, self._id_27B5 );
        }
    }

    return var_3;
}

_id_1613( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = _func_0C6( var_0, var_1, 0, 500 );

    if ( var_4.size > 0 )
        var_3 = self _meth_8362( var_4, var_4.size * 0.15, "node_capture", var_0, var_2, self._id_27B5 );

    return var_3;
}

_id_1614( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.size > 0 )
        var_2 = self _meth_8362( var_0, var_0.size * 0.15, "node_capture", undefined, var_1, self._id_27B5 );

    return var_2;
}

_id_1612( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = _func_0C6( var_0, var_1, 0, 500 );

    if ( var_3.size > 0 )
        var_2 = self _meth_8362( var_3, var_3.size * 0.15, "node_protect", var_0, self._id_27B5 );

    return var_2;
}

_id_16B7( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = undefined;
    var_6 = _func_0C6( var_0, var_1, 0, 500 );

    if ( isdefined( var_6 ) && var_6.size >= 2 )
        var_5 = _id_1616( var_6, var_2 );

    if ( !isdefined( var_5 ) )
    {
        if ( !isdefined( var_3 ) )
            var_3 = 0;

        if ( !isdefined( var_4 ) )
            var_4 = 1;

        var_7 = _func_0B5( self._id_15F5 * var_3, self._id_15F5 * var_4 );
        var_8 = anglestoforward( ( 0, _func_0B2( 360 ), 0 ) );
        var_5 = var_0 + var_8 * var_7;
    }

    return var_5;
}

_id_16B6( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_1.size >= 2 )
        var_3 = _id_1616( var_1, var_2 );

    if ( !isdefined( var_3 ) )
    {
        var_4 = common_scripts\utility::_id_710E( var_1 );
        var_5 = var_4._id_02E2 - var_0;
        var_3 = var_0 + _func_114( var_5 ) * _func_0F1( var_5 ) * _func_0B3( 1.0 );
    }

    return var_3;
}

_id_1616( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = common_scripts\utility::_id_0CF5( var_0 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        for ( var_5 = var_4 + 1; var_5 < var_3.size; var_5++ )
        {
            var_6 = var_3[var_4];
            var_7 = var_3[var_5];

            if ( _func_204( var_6, var_7, 1 ) )
            {
                var_2 = ( ( var_6._id_02E2[0] + var_7._id_02E2[0] ) * 0.5, ( var_6._id_02E2[1] + var_7._id_02E2[1] ) * 0.5, ( var_6._id_02E2[2] + var_7._id_02E2[2] ) * 0.5 );

                if ( isdefined( var_1 ) && self [[ var_1 ]]( var_2 ) == 1 )
                    return var_2;
            }
        }
    }

    return var_2;
}

_id_27A8()
{
    if ( isdefined( self._id_15F4 ) )
        return self._id_15F4._id_02E2;
    else if ( isdefined( self._id_15F2 ) )
        return self._id_15F2;

    return undefined;
}

_id_15AB()
{
    if ( maps\mp\_utility::_id_513B() )
        return 0;

    if ( _id_1664() )
        return 0;

    if ( self _meth_833F() )
        return 0;

    if ( isdefined( level._id_6273 ) )
        return 0;

    if ( isdefined( self._id_9A04 ) && self._id_9A04 )
        return 0;

    if ( isdefined( self._id_219B ) && self._id_219B )
        return 0;

    if ( self _meth_8461() )
        return 0;

    if ( maps\mp\_utility::_id_3FAA() > 0 )
    {
        var_0 = 1;

        foreach ( var_2 in level._id_669D )
        {
            if ( _func_1A1( var_2 ) && !isalliedsentient( self, var_2 ) )
                var_0 = 0;
        }

        if ( var_0 )
            return 0;
    }

    if ( !_id_1650( 500 ) )
        return 1;

    if ( !_func_1A1( self._id_0142 ) )
        return 1;

    return 0;
}

_id_16CB()
{
    var_0 = undefined;
    var_1 = _func_1FA( "investigated", "killer_died" );
    var_2 = _func_1FA( "investigated" );
    var_3 = common_scripts\utility::_id_710E( _func_1F5( 0, gettime() - 10000, 1, "death", var_1, self ) );

    if ( isdefined( var_3 ) )
    {
        var_0 = var_3;
        self._id_16A2 = 10000;
    }
    else
    {
        var_4 = undefined;

        if ( self _meth_835B() != "none" )
            var_4 = self _meth_8358();

        var_5 = _func_1F5( 0, gettime() - 45000, 1, "kill", var_2, self );
        var_6 = _func_1F5( 0, gettime() - 45000, 1, "death", var_1, self );
        var_3 = common_scripts\utility::_id_710E( common_scripts\utility::_id_0CDD( var_5, var_6 ) );

        if ( isdefined( var_3 ) > 0 && ( !isdefined( var_4 ) || _func_0F0( var_4, var_3 ) > 1000000 ) )
        {
            var_0 = var_3;
            self._id_16A2 = 45000;
        }
    }

    if ( isdefined( var_0 ) )
    {
        var_7 = _func_207( var_0 );
        var_8 = _func_207( self._id_02E2 );

        if ( isdefined( var_7 ) && isdefined( var_8 ) && var_8 != var_7 )
        {
            var_9 = _func_1F7( var_7, self._id_04A7, "ally" ) + _func_1F7( var_7, self._id_04A7, "path_ally" );

            if ( var_9 > 1 )
                var_0 = undefined;
        }
    }

    if ( isdefined( var_0 ) )
        self._id_16A1 = var_0;

    return var_0;
}

_id_1601( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{

}

_id_1602( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{

}

_id_1600( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_1641()
{
    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self._id_A2DD ) && self._id_A2DD.size > 0 )
        var_1 = self._id_A2DD;
    else
        var_1 = self _meth_8309();

    foreach ( var_3 in var_1 )
    {
        var_0 += self _meth_82F5( var_3 );
        var_0 += self _meth_82F6( var_3 );
    }

    return var_0;
}

_id_16AB()
{
    var_0 = undefined;

    if ( isdefined( self._id_A2DD ) && self._id_A2DD.size > 0 )
        var_0 = self._id_A2DD;
    else
        var_0 = self _meth_8309();

    foreach ( var_2 in var_0 )
    {
        if ( self _meth_82F5( var_2 ) > 0 )
            return 0;

        if ( self _meth_82F6( var_2 ) > 0 )
            return 0;
    }

    return 1;
}

_id_162E()
{
    var_0 = 0;
    var_1 = self _meth_82CB();

    foreach ( var_3 in var_1 )
        var_0 += self _meth_82F6( var_3 );

    return var_0;
}

bot_item_matches_purpose( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "trap_directional":
            switch ( var_1 )
            {
                case "h1_claymore_mp":
                    return 1;
            }

            break;
        case "c4":
            switch ( var_1 )
            {
                case "h1_c4_mp":
                    return 1;
            }

            break;
    }

    return 0;
}

_id_1736( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self notify( "bot_watch_nodes" );
    self endon( "bot_watch_nodes" );
    self endon( "bot_watch_nodes_stop" );
    self endon( "using_remote" );
    self endon( "disconnect" );
    self endon( "death" );

    if ( isdefined( var_4 ) )
        self endon( var_4 );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    if ( isdefined( var_6 ) )
        self endon( var_6 );

    if ( isdefined( var_7 ) )
        self endon( var_7 );

    wait 1.0;
    var_8 = 1;
    var_9 = _func_0E8( self _meth_8359() );

    while ( var_8 )
    {
        if ( self _meth_8363() && self _meth_8373() )
        {
            if ( _func_0F0( self _meth_8358(), self._id_02E2 ) < var_9 )
            {
                if ( _func_0F1( self _meth_8336() ) <= 1 )
                    var_8 = 0;
            }
        }

        if ( var_8 )
            wait 0.05;
    }

    var_10 = self._id_02E2;
    var_11 = ( 0, 0, self _meth_82EF() );

    if ( isdefined( var_0 ) )
    {
        self._id_A1EA = [];

        foreach ( var_13 in var_0 )
        {
            var_14 = 0;

            if ( _func_225( self._id_02E2, var_13._id_02E2 ) <= 40 )
                var_14 = 1;

            var_15 = self _meth_80AA();
            var_16 = _func_0F6( ( 0, 0, 1 ), _func_114( var_13._id_02E2 + var_11 - var_15 ) );

            if ( _func_0BE( var_16 ) > 0.92 )
                var_14 = 1;

            if ( !var_14 )
                self._id_A1EA[self._id_A1EA.size] = var_13;
        }
    }

    if ( !isdefined( self._id_A1EA ) )
        return;

    thread _id_A1EB();
    self._id_A1EA = common_scripts\utility::_id_0CF5( self._id_A1EA );

    foreach ( var_13 in self._id_A1EA )
        var_13._id_A1E9[self._id_3314] = 1.0;

    var_20 = gettime();
    var_21 = var_20;
    var_22 = [];
    var_23 = undefined;

    if ( isdefined( var_1 ) )
        var_23 = ( 0, var_1, 0 );

    var_24 = isdefined( var_23 ) && isdefined( var_2 );
    var_25 = undefined;

    for (;;)
    {
        var_26 = gettime();
        self notify( "still_watching_nodes" );
        var_27 = self _meth_8371();

        if ( isdefined( var_3 ) && var_26 >= var_3 )
            return;

        if ( maps\mp\bots\_bots_strategy::_id_1649() )
        {
            self _meth_836B( undefined );
            wait 0.2;
            continue;
        }

        if ( !self _meth_8363() || !self _meth_8373() )
        {
            wait 0.2;
            continue;
        }

        if ( isdefined( var_25 ) && var_25._id_A1E9[self._id_3314] == 0.0 )
            var_21 = var_26;

        if ( self._id_A1EA.size > 0 )
        {
            var_28 = 0;

            if ( isdefined( self._id_0142 ) )
            {
                var_29 = self _meth_81C5( self._id_0142 );
                var_30 = self _meth_81C4( self._id_0142 );

                if ( var_30 && var_26 - var_30 < 5000 )
                {
                    var_31 = _func_114( var_29 - self._id_02E2 );
                    var_32 = 0;

                    for ( var_33 = 0; var_33 < self._id_A1EA.size; var_33++ )
                    {
                        var_34 = _func_114( self._id_A1EA[var_33]._id_02E2 - self._id_02E2 );
                        var_35 = _func_0F6( var_31, var_34 );

                        if ( var_35 > var_32 )
                        {
                            var_32 = var_35;
                            var_25 = self._id_A1EA[var_33];
                            var_28 = 1;
                        }
                    }
                }
            }

            if ( !var_28 && var_26 >= var_21 )
            {
                var_36 = [];

                for ( var_33 = 0; var_33 < self._id_A1EA.size; var_33++ )
                {
                    var_13 = self._id_A1EA[var_33];
                    var_37 = var_13 _meth_837F();

                    if ( var_24 && !common_scripts\utility::_id_A347( self._id_02E2, var_23, var_13._id_02E2, var_2 ) )
                        continue;

                    if ( _func_225( self._id_02E2, var_13._id_02E2 ) <= 10 )
                        continue;

                    if ( !isdefined( var_22[var_37] ) )
                        var_22[var_37] = 0;

                    if ( common_scripts\utility::_id_A347( self._id_02E2, self _meth_8338(), var_13._id_02E2, var_27 ) )
                        var_22[var_37] = var_26;

                    for ( var_38 = 0; var_38 < var_36.size; var_38++ )
                    {
                        if ( var_22[var_36[var_38] _meth_837F()] > var_22[var_37] )
                            break;
                    }

                    var_36 = common_scripts\utility::_id_0CED( var_36, var_13, var_38 );
                }

                var_25 = undefined;

                for ( var_33 = 0; var_33 < var_36.size; var_33++ )
                {
                    if ( _func_0B3( 1 ) > var_36[var_33]._id_A1E9[self._id_3314] )
                        continue;

                    var_25 = var_36[var_33];
                    var_21 = var_26 + _func_0B4( 3000, 5000 );
                    break;
                }
            }

            if ( isdefined( var_25 ) )
            {
                var_39 = var_25._id_02E2 + var_11;

                if ( _func_225( self._id_02E2, var_39 ) <= 10 )
                {
                    self _meth_836B( undefined );
                    var_25 = undefined;
                    var_21 = 0;
                }
                else
                    self _meth_836B( var_39, 0.4, "script_search" );
            }
        }

        wait 0.2;
    }
}

_id_A1EC()
{
    self notify( "bot_watch_nodes_stop" );

    if ( isdefined( self._id_A1EA ) )
    {
        foreach ( var_1 in self._id_A1EA )
            var_1._id_A1E9[self._id_3314] = undefined;
    }

    self._id_A1EA = undefined;
}

_id_A1EB()
{
    self notify( "watch_nodes_aborted" );
    self endon( "watch_nodes_aborted" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A073( 0.5, "still_watching_nodes" );

        if ( !isdefined( var_0 ) || var_0 != "still_watching_nodes" )
        {
            _id_A1EC();
            return;
        }
    }
}

_id_1681( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 != ( 0, 0, 0 ) )
    {
        if ( !common_scripts\utility::_id_A347( self._id_02E2, self _meth_8338(), var_1, self _meth_8371() ) )
        {
            var_2 = self _meth_836C( var_1 );

            if ( isdefined( var_2 ) )
                self _meth_836B( var_2 + ( 0, 0, 40 ), 1.0, "script_seek" );
        }

        self _meth_8360( "known_enemy", undefined, var_1 );
    }
}

_id_1634( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1.classname ) )
    {
        if ( var_1.classname == "grenade" )
        {
            if ( isdefined( var_0 ) && var_0.classname == "worldspawn" )
                return undefined;

            if ( !_id_1608( var_1 ) )
                return var_0;
        }
        else if ( var_1.classname == "rocket" )
        {
            if ( isdefined( var_1._id_9CC4 ) )
                return var_1._id_9CC4;

            if ( isdefined( var_1._id_04D9 ) && ( var_1._id_04D9 == "remote" || var_1._id_04D9 == "odin" ) )
                return var_1;

            if ( isdefined( var_1._id_02E5 ) )
                return var_1._id_02E5;
        }
        else if ( var_1.classname == "worldspawn" || var_1.classname == "trigger_hurt" )
            return undefined;

        return var_1;
    }

    return var_0;
}

_id_1608( var_0 )
{
    var_1 = var_0._id_A2C6;

    if ( !isdefined( var_1 ) )
        var_1 = var_0._id_A2DF;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( _func_120( var_1, "c4_mp" ) )
        return 1;

    if ( _func_120( var_1, "claymore_mp" ) )
        return 1;

    if ( _func_120( var_1, "proximity_explosive_mp" ) )
        return 1;

    return 0;
}

_id_172A( var_0, var_1 )
{
    return var_0[0] == var_1[0] && var_0[1] == var_1[1] && var_0[2] == var_1[2];
}

_id_15A6( var_0 )
{
    var_0._id_488B = [];

    if ( var_0._id_1657 == "use" )
        _id_15A7( var_0 );
    else if ( var_0._id_1657 == "damage" )
        _id_15A5( var_0 );
    else
    {

    }
}

_id_16CD( var_0 )
{
    var_0._id_0AFF = 1;
    level._id_56D1 = common_scripts\utility::_id_0CF6( level._id_56D1, var_0 );
}

_id_15A7( var_0 )
{
    if ( !_func_120( var_0.code_classname, "trigger_use" ) )
        return;

    if ( !isdefined( var_0._id_04A4 ) )
        return;

    if ( isdefined( var_0._id_170B ) )
        return;

    if ( !isdefined( var_0._id_9BE9 ) )
        return;

    var_1 = _func_0C4( var_0._id_04A4, "targetname" );

    if ( var_1.size != 1 )
        return;

    var_0._id_170B = var_1[0];

    if ( !isdefined( level._id_56D1 ) )
        level._id_56D1 = [];

    level._id_56D1 = common_scripts\utility::_id_0CDA( level._id_56D1, var_0 );
}

_id_15A5( var_0 )
{
    if ( !_func_120( var_0.code_classname, "trigger_damage" ) )
        return;

    var_1 = _func_0C4( var_0._id_04A4, "targetname" );

    if ( var_1.size != 2 )
        return;

    var_0._id_170D = var_1;

    if ( !isdefined( level._id_56D1 ) )
        level._id_56D1 = [];

    level._id_56D1 = common_scripts\utility::_id_0CDA( level._id_56D1, var_0 );
}

_id_163C( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_5, var_4 in var_0 )
    {
        if ( var_2 == var_1 )
            return var_5;

        var_2++;
    }

    return undefined;
}

_id_1642( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_A3EF; var_2++ )
    {
        var_3 = _func_20D( var_2 );
        var_3._id_9E7E = 0;
    }

    var_4 = _func_20D( var_0 );
    return _id_1643( var_4, var_1 );
}

_id_1643( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = _func_20B( var_0 );
    var_0._id_9E7E = 1;
    var_3 = _func_215( var_0 );

    foreach ( var_5 in var_3 )
    {
        if ( !var_5._id_9E7E )
        {
            var_6 = _func_0EE( var_0._id_02E2, var_5._id_02E2 );

            if ( var_6 < var_1 )
            {
                var_7 = _id_1643( var_5, var_1 - var_6 );
                var_2 = common_scripts\utility::_id_0CDD( var_7, var_2 );
            }
        }
    }

    return var_2;
}

_id_15E2( var_0 )
{
    return isdefined( var_0 ) && isdefined( var_0._id_20B9 ) && var_0._id_20B9;
}

_id_1636( var_0 )
{
    return level._id_169F[var_0];
}

_id_163D()
{
    return _func_0BC( _id_162C() / 2 );
}

_id_162C()
{
    var_0 = getdvarint( "party_maxplayers", 0 );
    var_0 = _func_0E1( var_0, getdvarint( "party_maxPrivatePartyPlayers", 0 ) );

    if ( var_0 > level._id_5A29 )
        return level._id_5A29;

    return var_0;
}

_id_16C4()
{
    self notify( "bot_queued_process_level_thread" );
    self endon( "bot_queued_process_level_thread" );
    wait 0.05;

    for (;;)
    {
        if ( isdefined( level._id_16C6 ) && level._id_16C6.size > 0 )
        {
            var_0 = level._id_16C6[0];

            if ( isdefined( var_0 ) && isdefined( var_0._id_02E5 ) )
            {
                var_1 = undefined;

                if ( isdefined( var_0._id_6694 ) )
                    var_1 = var_0._id_02E5 [[ var_0._id_3AE4 ]]( var_0._id_6691, var_0._id_6692, var_0._id_6693, var_0._id_6694 );
                else if ( isdefined( var_0._id_6693 ) )
                    var_1 = var_0._id_02E5 [[ var_0._id_3AE4 ]]( var_0._id_6691, var_0._id_6692, var_0._id_6693 );
                else if ( isdefined( var_0._id_6692 ) )
                    var_1 = var_0._id_02E5 [[ var_0._id_3AE4 ]]( var_0._id_6691, var_0._id_6692 );
                else if ( isdefined( var_0._id_6691 ) )
                    var_1 = var_0._id_02E5 [[ var_0._id_3AE4 ]]( var_0._id_6691 );
                else
                    var_1 = var_0._id_02E5 [[ var_0._id_3AE4 ]]();

                var_0._id_02E5 notify( var_0._id_603E, var_1 );
            }

            var_2 = [];

            for ( var_3 = 1; var_3 < level._id_16C6.size; var_3++ )
                var_2[var_3 - 1] = level._id_16C6[var_3];

            level._id_16C6 = var_2;
        }

        wait 0.05;
    }
}

_id_16C3( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_16C6 ) )
        level._id_16C6 = [];

    foreach ( var_8, var_7 in level._id_16C6 )
    {
        if ( var_7._id_02E5 == self && var_7._id_02A7 == var_0 )
        {
            self notify( var_7._id_02A7 );
            level._id_16C6[var_8] = undefined;
        }
    }

    var_7 = spawnstruct();
    var_7._id_02E5 = self;
    var_7._id_02A7 = var_0;
    var_7._id_603E = var_7._id_02A7 + "_done";
    var_7._id_3AE4 = var_1;
    var_7._id_6691 = var_2;
    var_7._id_6692 = var_3;
    var_7._id_6693 = var_4;
    var_7._id_6694 = var_5;
    level._id_16C6[level._id_16C6.size] = var_7;

    if ( !isdefined( level._id_16C5 ) )
    {
        level._id_16C5 = 1;
        level thread _id_16C4();
    }

    self waittill( var_7._id_603E, var_9 );
    return var_9;
}

_id_1664()
{
    return maps\mp\_utility::_id_51E3() || self _meth_806A();
}

_id_1635( var_0 )
{
    var_1 = undefined;

    if ( isdefined( self._id_A2DD ) && self._id_A2DD.size > 0 )
        var_1 = self._id_A2DD;
    else
        var_1 = self _meth_8309();

    foreach ( var_3 in var_1 )
    {
        var_4 = _func_1B1( var_3 );
        var_5 = self _meth_82F6( var_3 );

        if ( var_5 <= var_4 )
            return 1;

        if ( self _meth_8331( var_3 ) <= var_0 )
            return 1;
    }

    return 0;
}

_id_16BB( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 256;

    if ( !isdefined( var_2 ) )
        var_2 = 50;

    var_3 = _func_0C7( var_0, var_1, 0, var_2, "Path" );

    foreach ( var_5 in var_3 )
    {
        var_6 = var_0 + ( 0, 0, 30 );
        var_7 = var_5._id_02E2 + ( 0, 0, 30 );
        var_8 = _func_08F( var_6, var_7 );

        if ( _id_172A( var_8, var_7 ) )
            return 1;

        wait 0.05;
    }

    return 0;
}

_id_16A4( var_0 )
{
    level endon( "game_ended" );
    self notify( "bot_monitor_enemy_camp_spots" );
    self endon( "bot_monitor_enemy_camp_spots" );
    level._id_3205 = [];
    level._id_3204 = [];
    level._id_3203 = [];

    for (;;)
    {
        wait 1.0;
        var_1 = [];

        if ( !isdefined( var_0 ) )
            continue;

        foreach ( var_3 in level._id_669D )
        {
            if ( !isdefined( var_3._id_04A7 ) )
                continue;

            if ( var_3 [[ var_0 ]]() && !isdefined( var_1[var_3._id_04A7] ) )
            {
                level._id_3203[var_3._id_04A7] = undefined;
                level._id_3205[var_3._id_04A7] = var_3 _meth_8432( 1 );

                if ( isdefined( level._id_3205[var_3._id_04A7] ) )
                {
                    if ( !isdefined( level._id_3204[var_3._id_04A7] ) || !common_scripts\utility::_id_0CE4( level._id_3205[var_3._id_04A7], level._id_3204[var_3._id_04A7] ) )
                        level._id_3204[var_3._id_04A7] = common_scripts\utility::_id_710E( level._id_3205[var_3._id_04A7] );

                    if ( isdefined( level._id_3204[var_3._id_04A7] ) )
                    {
                        var_4 = [];

                        foreach ( var_6 in level._id_669D )
                        {
                            if ( !isdefined( var_6._id_04A7 ) )
                                continue;

                            if ( var_6 [[ var_0 ]]() && var_6._id_04A7 == var_3._id_04A7 )
                                var_4[var_4.size] = var_6;
                        }

                        var_4 = _func_1BA( var_4, level._id_3204[var_3._id_04A7] );

                        if ( var_4.size > 0 )
                            level._id_3203[var_3._id_04A7] = var_4[0];
                    }
                }

                var_1[var_3._id_04A7] = 1;
            }
        }
    }
}

_id_1725()
{
    if ( !isdefined( self ) )
        return 0;

    if ( !_func_0CF( self ) )
        return 0;

    if ( !isdefined( self._id_04A7 ) )
        return 0;

    if ( self._id_04A7 == "spectator" )
        return 0;

    if ( !_func_1A1( self ) )
        return 0;

    if ( !maps\mp\_utility::_id_50B1( self ) )
        return 0;

    if ( !isdefined( self._id_67DF ) || self._id_67DF == "camper" )
        return 0;

    return 1;
}

_id_1723()
{
    if ( !isdefined( level._id_3203 ) )
        return;

    if ( !isdefined( level._id_3203[self._id_04A7] ) )
        return;

    if ( level._id_3203[self._id_04A7] == self )
    {
        maps\mp\bots\_bots_strategy::_id_15EF();
        self _meth_8352( level._id_3204[self._id_04A7], 128, "objective", undefined, 256 );
        _id_172E();
    }
}

_id_161A( var_0, var_1 )
{
    self notify( "bot_force_stance_for_time" );
    self endon( "bot_force_stance_for_time" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self _meth_8350( var_0 );
    wait(var_1);
    self _meth_8350( "none" );
}

bot_disable_movement_for_time( var_0 )
{
    self notify( "bot_disable_movement_for_time" );
    self endon( "bot_disable_movement_for_time" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self _meth_834F( "disable_movement", 1 );
    wait(var_0);
    self _meth_834F( "disable_movement", 0 );
}

bot_get_active_and_stowed_weapons()
{
    var_0["active"] = self _meth_830E();

    if ( _func_1B8( var_0["active"] ) == "rocketlauncher" || !maps\mp\gametypes\_weapons::_id_5185( var_0["active"] ) )
        var_0["active"] = common_scripts\utility::_id_3FFD();

    var_1 = self _meth_8309();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 != var_0["active"] )
            var_0["stowed"] = var_3;
    }

    return var_0;
}

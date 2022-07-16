// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7E5B( var_0, var_1 )
{
    var_2 = undefined;
    var_0 = _func_123( var_0 );
    var_3["friendly"] = 3;
    var_3["enemy"] = 4;
    var_3["objective"] = 5;
    var_3["neutral"] = 0;
    var_2 = var_3[var_0];
    self _meth_83F8( var_2, var_1 );
}

_id_500C()
{
    if ( _func_140() || getdvar( "coop" ) == "1" )
        return 1;

    return 0;
}

_id_500D()
{
    if ( _func_140() )
        return 0;

    if ( !_id_500C() )
        return 0;

    return 1;
}

_id_5062( var_0 )
{
    if ( var_0 _id_32DC( "laststand_downed" ) )
        return var_0 _id_32D8( "laststand_downed" );

    if ( isdefined( var_0._id_0249 ) )
        return var_0._id_0249;

    return !_func_1A1( var_0 );
}

_id_5063( var_0 )
{
    if ( !isdefined( var_0._id_2D91 ) )
        return 0;

    return var_0._id_2D91;
}

_id_536C( var_0 )
{
    if ( _id_55E1() )
    {
        if ( isdefined( level._id_55E2 ) )
            return var_0 [[ level._id_55E2 ]]();
    }

    return 0;
}

_id_5087()
{
    return _id_5083() && getdvarint( "so_survival" ) > 0;
}

_id_55E1()
{
    return isdefined( level._id_55E4 ) && level._id_55E4 > 0;
}

_id_5083()
{
    return getdvarint( "specialops" ) >= 1;
}

_id_21A3( var_0, var_1 )
{
    var_2 = "";

    if ( var_0 < 0 )
        var_2 += "-";

    var_0 = _id_7612( var_0, 1, 0 );
    var_3 = var_0 * 100;
    var_3 = _func_0BC( var_3 );
    var_3 = _func_0BE( var_3 );
    var_4 = var_3 / 6000;
    var_4 = _func_0BC( var_4 );
    var_2 += var_4;
    var_5 = var_3 / 100;
    var_5 = _func_0BC( var_5 );
    var_5 -= var_4 * 60;

    if ( var_5 < 10 )
        var_2 += ( ":0" + var_5 );
    else
        var_2 += ( ":" + var_5 );

    if ( isdefined( var_1 ) && var_1 )
    {
        var_6 = var_3;
        var_6 -= var_4 * 6000;
        var_6 -= var_5 * 100;
        var_6 = _func_0BC( var_6 / 10 );
        var_2 += ( "." + var_6 );
    }

    return var_2;
}

_id_7612( var_0, var_1, var_2 )
{
    var_1 = _func_0BC( var_1 );

    if ( var_1 < 0 || var_1 > 4 )
        return var_0;

    var_3 = 1;

    for ( var_4 = 1; var_4 <= var_1; var_4++ )
        var_3 *= 10;

    var_5 = var_0 * var_3;

    if ( !isdefined( var_2 ) || var_2 )
        var_5 = _func_0E2( var_5 );
    else
        var_5 = _func_0E3( var_5 );

    var_0 = var_5 / var_3;
    return var_0;
}

_id_7613( var_0, var_1, var_2 )
{
    var_3 = var_0 / 1000;
    var_3 = _id_7612( var_3, var_1, var_2 );
    var_0 = var_3 * 1000;
    return _func_0BC( var_0 );
}

can_set_vision_set( var_0 )
{
    return !isdefined( level.can_change_vision_set_function ) || [[ level.can_change_vision_set_function ]]( var_0 );
}

_id_7F00( var_0, var_1, var_2 )
{
    if ( isdefined( level.pre_set_vision_set_function ) )
        [[ level.pre_set_vision_set_function ]]( var_0 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !var_2 && !can_set_vision_set( var_0 ) )
        return;

    if ( _id_A5A5::_id_4D74( var_0 ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( _func_1AD( self ) )
        self _meth_82D1( var_0, var_1 );
    else
    {
        _func_143( var_0, var_1 );
        setdvar( "vision_set_current", var_0 );
    }
}

_id_7F01( var_0, var_1 )
{
    _id_7F00( var_0, var_1 );
}

can_set_light_set( var_0 )
{
    return !isdefined( level.can_change_light_set_function ) || [[ level.can_change_light_set_function ]]( var_0 );
}

set_light_set_player( var_0, var_1 )
{
    if ( isdefined( level.pre_set_light_set_function ) )
        [[ level.pre_set_light_set_function ]]( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !var_1 && !can_set_light_set( var_0 ) )
        return;

    level._id_0318.current_lightset = var_0;
    self _meth_83BE( level._id_0318.current_lightset );
}

_id_8FB6( var_0, var_1, var_2 )
{
    var_2 = _func_0BC( var_2 * 20 );
    var_3 = [];

    for ( var_4 = 0; var_4 < 3; var_4++ )
        var_3[var_4] = ( var_0[var_4] - var_1[var_4] ) / var_2;

    var_5 = [];

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        wait 0.05;

        for ( var_6 = 0; var_6 < 3; var_6++ )
            var_5[var_6] = var_0[var_6] - var_3[var_6] * var_4;

        _func_047( var_5[0], var_5[1], var_5[2] );
    }

    _func_047( var_1[0], var_1[1], var_1[2] );
}

_id_32E0( var_0 )
{
    while ( isdefined( self ) && !self._id_32D8[var_0] )
        self waittill( var_0 );
}

_id_32E3( var_0 )
{
    while ( isdefined( self ) && !self._id_32D8[var_0] )
        self waittill( var_0 );
}

_id_32E1( var_0, var_1 )
{
    while ( isdefined( self ) )
    {
        if ( _id_32D8( var_0 ) )
            return;

        if ( _id_32D8( var_1 ) )
            return;

        common_scripts\utility::_id_A087( var_0, var_1 );
    }
}

_id_32E2( var_0, var_1 )
{
    var_2 = gettime();

    while ( isdefined( self ) )
    {
        if ( self._id_32D8[var_0] )
            break;

        if ( gettime() >= var_2 + var_1 * 1000 )
            break;

        _id_A5A5::_id_32ED( var_0, var_1 );
    }
}

_id_32E4( var_0 )
{
    while ( isdefined( self ) && self._id_32D8[var_0] )
        self waittill( var_0 );
}

ent_flag_waitopen_or_timeout( var_0, var_1 )
{
    var_2 = gettime();

    while ( isdefined( self ) && self._id_32D8[var_0] )
    {
        if ( gettime() >= var_2 + var_1 * 1000 )
            break;

        _id_A5A5::_id_32ED( var_0, var_1 );
    }
}

_id_32D9( var_0 )
{

}

_id_32E5( var_0, var_1 )
{
    while ( isdefined( self ) )
    {
        if ( !_id_32D8( var_0 ) )
            return;

        if ( !_id_32D8( var_1 ) )
            return;

        common_scripts\utility::_id_A087( var_0, var_1 );
    }
}

_id_32DD( var_0 )
{
    if ( !isdefined( self._id_32D8 ) )
    {
        self._id_32D8 = [];
        self._id_32E6 = [];
    }

    self._id_32D8[var_0] = 0;
}

_id_32DC( var_0 )
{
    if ( isdefined( self._id_32D8 ) && isdefined( self._id_32D8[var_0] ) )
        return 1;

    return 0;
}

_id_32DF( var_0, var_1 )
{
    self endon( "death" );
    wait(var_1);
    _id_32DE( var_0 );
}

_id_32DE( var_0 )
{
    self._id_32D8[var_0] = 1;
    self notify( var_0 );
}

_id_32DA( var_0, var_1 )
{
    if ( self._id_32D8[var_0] )
    {
        self._id_32D8[var_0] = 0;
        self notify( var_0 );
    }

    if ( isdefined( var_1 ) && var_1 )
        self._id_32D8[var_0] = undefined;
}

_id_32DB( var_0, var_1 )
{
    wait(var_1);
    _id_32DA( var_0 );
}

_id_32D8( var_0 )
{
    return self._id_32D8[var_0];
}

_id_3D06( var_0, var_1, var_2, var_3 )
{
    if ( !var_0.size )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = level._id_0318;

    if ( !isdefined( var_3 ) )
        var_3 = -1;

    var_4 = var_1._id_02E2;

    if ( isdefined( var_2 ) && var_2 )
        var_4 = var_1 _meth_80AA();

    var_5 = undefined;
    var_6 = var_1 _meth_8338();
    var_7 = anglestoforward( var_6 );
    var_8 = -1;

    foreach ( var_10 in var_0 )
    {
        var_11 = _func_115( var_10._id_02E2 - var_4 );
        var_12 = anglestoforward( var_11 );
        var_13 = _func_0F6( var_7, var_12 );

        if ( var_13 < var_8 )
            continue;

        if ( var_13 < var_3 )
            continue;

        var_8 = var_13;
        var_5 = var_10;
    }

    return var_5;
}

_id_3CF9( var_0, var_1, var_2 )
{
    if ( !var_0.size )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = level._id_0318;

    var_3 = var_1._id_02E2;

    if ( isdefined( var_2 ) && var_2 )
        var_3 = var_1 _meth_80AA();

    var_4 = undefined;
    var_5 = var_1 _meth_8338();
    var_6 = anglestoforward( var_5 );
    var_7 = -1;

    for ( var_8 = 0; var_8 < var_0.size; var_8++ )
    {
        var_9 = _func_115( var_0[var_8]._id_02E2 - var_3 );
        var_10 = anglestoforward( var_9 );
        var_11 = _func_0F6( var_6, var_10 );

        if ( var_11 < var_7 )
            continue;

        var_7 = var_11;
        var_4 = var_8;
    }

    return var_4;
}

flag_wait_trigger( var_0, var_1 )
{
    _id_A5A5::_id_05AE( var_0, var_1 );
}

_id_3847( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_383D( var_0 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_1 thread _id_A5A5::_id_05AE( var_0, var_2 );
    return var_1;
}

_id_3848( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_383D( var_0 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_1[var_3] thread _id_A5A5::_id_05AE( var_0, 0 );

    return var_1;
}

_id_3840( var_0, var_1 )
{
    wait(var_1);
    common_scripts\utility::_id_383F( var_0 );
}

_id_3832( var_0, var_1 )
{
    wait(var_1);
    common_scripts\utility::_id_3831( var_0 );
}

save_time_played()
{
    var_0 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "career", "duration_total_seconds" );

    if ( isdefined( var_0 ) )
    {
        var_0 += _func_0BC( ( gettime() - level.lasttimeplayedregister ) / 1000 );
        level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "career", "duration_total_seconds", var_0 );
    }
}

_id_56C0()
{
    save_time_played();

    if ( _id_0CC3() )
        return;

    if ( level._id_5CDE )
        return;

    if ( common_scripts\utility::_id_382E( "game_saving" ) )
        return;

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        var_1 = level._id_0323[var_0];

        if ( !_func_1A1( var_1 ) )
            return;
    }

    common_scripts\utility::_id_383F( "game_saving" );
    var_2 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "career", "levels", level._id_038E, "level_complete" );

    if ( isdefined( var_2 ) )
    {
        if ( !var_2 )
        {
            level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "career", "levels", level._id_038E, "level_complete", 1 );
            level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "career", "levels", level._id_038E, "level_difficulty", level._id_3BFE );
            level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "career", "levels", level._id_038E, "level_completion_timestamp", gettimeutc() );
        }
        else
        {
            var_3 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "career", "levels", level._id_038E, "level_difficulty" );

            if ( level._id_3BFE > var_3 )
                level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "career", "levels", level._id_038E, "level_difficulty", level._id_3BFE );
        }
    }

    var_4 = "levelshots / autosave / autosave_" + level._id_038E + "end";
    _func_085( "levelend", &"AUTOSAVE_AUTOSAVE", var_4, 1, 1 );
    common_scripts\utility::_id_3831( "game_saving" );
}

_id_075D( var_0, var_1, var_2 )
{
    level._id_05A7[var_0] = [];
    level._id_05A7[var_0]["func"] = var_1;
    level._id_05A7[var_0]["msg"] = var_2;
}

_id_7349( var_0 )
{
    level._id_05A7[var_0] = undefined;
}

_id_1154()
{

}

_id_1156()
{

}

_id_1158()
{

}

_id_1143( var_0 )
{
    thread _id_1145( var_0 );
}

_id_1144( var_0 )
{
    thread _id_1145( var_0, undefined, undefined, 1 );
}

_id_1145( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_24C2 ) )
        level._id_24C2 = 1;

    var_4 = "levelshots/autosave/autosave_" + level._id_038E + level._id_24C2;
    var_5 = level _id_A514::_id_9896( level._id_24C2, "autosave", var_4, var_1, var_2, var_3, var_0 );

    if ( isdefined( var_5 ) && var_5 )
        level._id_24C2++;
}

_id_1151( var_0, var_1 )
{
    thread _id_1145( var_0, var_1 );
}

_id_26AD( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 5;

    if ( isdefined( var_3 ) )
    {
        var_3 endon( "death" );
        var_1 = var_3._id_02E2;
    }

    for ( var_4 = 0; var_4 < var_2 * 20; var_4++ )
    {
        if ( !isdefined( var_3 ) )
        {

        }
        else
        {

        }

        wait 0.05;
    }
}

_id_26AE( var_0, var_1 )
{
    self notify( "debug_message_ai" );
    self endon( "debug_message_ai" );
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 5;

    for ( var_2 = 0; var_2 < var_1 * 20; var_2++ )
        wait 0.05;
}

_id_26AF( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        level notify( var_0 + var_3 );
        level endon( var_0 + var_3 );
    }
    else
    {
        level notify( var_0 );
        level endon( var_0 );
    }

    if ( !isdefined( var_2 ) )
        var_2 = 5;

    for ( var_4 = 0; var_4 < var_2 * 20; var_4++ )
        wait 0.05;
}

_id_032C( var_0 )
{
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1._id_02E2 = level._id_0318 _meth_8097();
    var_1 _meth_80B3( var_0 );
    var_1 delete();
}

_id_1FDF( var_0, var_1 )
{
    return var_0 >= var_1;
}

_id_3670( var_0, var_1 )
{
    return var_0 <= var_1;
}

_id_3F39( var_0, var_1, var_2 )
{
    return _id_A5A5::_id_20CB( var_0, var_1, var_2, ::_id_1FDF );
}

_id_3D00( var_0, var_1, var_2 )
{
    var_3 = var_1[0];
    var_4 = _func_0EE( var_0, var_3 );

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = _func_0EE( var_0, var_1[var_5] );

        if ( var_6 >= var_4 )
            continue;

        var_4 = var_6;
        var_3 = var_1[var_5];
    }

    if ( !isdefined( var_2 ) || var_4 <= var_2 )
        return var_3;

    return undefined;
}

_id_3D69( var_0, var_1 )
{
    if ( var_1.size < 1 )
        return;

    var_2 = _func_0EE( var_1[0] _meth_8097(), var_0 );
    var_3 = var_1[0];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = _func_0EE( var_1[var_4] _meth_8097(), var_0 );

        if ( var_5 < var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

_id_3ECF( var_0, var_1, var_2 )
{
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( _func_0EE( var_1[var_4]._id_02E2, var_0 ) <= var_2 )
            var_3[var_3.size] = var_1[var_4];
    }

    return var_3;
}

_id_3E12( var_0, var_1, var_2 )
{
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( _func_0EE( var_1[var_4]._id_02E2, var_0 ) > var_2 )
            var_3[var_3.size] = var_1[var_4];
    }

    return var_3;
}

_id_3CFA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 9999999;

    if ( var_1.size < 1 )
        return;

    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( !_func_1A1( var_1[var_4] ) )
            continue;

        var_5 = _func_0EE( var_1[var_4]._id_02E2, var_0 );

        if ( var_5 >= var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

_id_3D95( var_0, var_1, var_2 )
{
    if ( !var_2.size )
        return;

    var_3 = undefined;
    var_4 = _func_115( var_1 - var_0 );
    var_5 = anglestoforward( var_4 );
    var_6 = -1;

    foreach ( var_8 in var_2 )
    {
        var_4 = _func_115( var_8._id_02E2 - var_0 );
        var_9 = anglestoforward( var_4 );
        var_10 = _func_0F6( var_5, var_9 );

        if ( var_10 < var_6 )
            continue;

        var_6 = var_10;
        var_3 = var_8;
    }

    return var_3;
}

_id_3CF8( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 9999999;

    if ( var_1.size < 1 )
        return;

    var_3 = undefined;

    foreach ( var_7, var_5 in var_1 )
    {
        var_6 = _func_0EE( var_5._id_02E2, var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_7;
    }

    return var_3;
}

_id_3CF6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return undefined;

    var_3 = 0;

    if ( isdefined( var_2 ) && var_2.size )
    {
        var_4 = [];

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
            var_4[var_5] = 0;

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            for ( var_6 = 0; var_6 < var_2.size; var_6++ )
            {
                if ( var_1[var_5] == var_2[var_6] )
                    var_4[var_5] = 1;
            }
        }

        var_7 = 0;

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            if ( !var_4[var_5] && isdefined( var_1[var_5] ) )
            {
                var_7 = 1;
                var_3 = _func_0EE( var_0, var_1[var_5]._id_02E2 );
                var_8 = var_5;
                var_5 = var_1.size + 1;
            }
        }

        if ( !var_7 )
            return undefined;
    }
    else
    {
        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            if ( isdefined( var_1[var_5] ) )
            {
                var_3 = _func_0EE( var_0, var_1[0]._id_02E2 );
                var_8 = var_5;
                var_5 = var_1.size + 1;
            }
        }
    }

    var_8 = undefined;

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        if ( isdefined( var_1[var_5] ) )
        {
            var_4 = 0;

            if ( isdefined( var_2 ) )
            {
                for ( var_6 = 0; var_6 < var_2.size; var_6++ )
                {
                    if ( var_1[var_5] == var_2[var_6] )
                        var_4 = 1;
                }
            }

            if ( !var_4 )
            {
                var_9 = _func_0EE( var_0, var_1[var_5]._id_02E2 );

                if ( var_9 <= var_3 )
                {
                    var_3 = var_9;
                    var_8 = var_5;
                }
            }
        }
    }

    if ( isdefined( var_8 ) )
        return var_1[var_8];
    else
        return undefined;
}

_id_3CFE( var_0 )
{
    if ( level._id_0323.size == 1 )
        return level._id_0318;

    var_1 = common_scripts\utility::_id_3F33( var_0, level._id_0323 );
    return var_1;
}

_id_3CFF( var_0 )
{
    if ( level._id_0323.size == 1 )
        return level._id_0318;

    var_1 = _id_3E33();
    var_2 = common_scripts\utility::_id_3F33( var_0, var_1 );
    return var_2;
}

_id_3E33()
{
    var_0 = [];

    foreach ( var_2 in level._id_0323 )
    {
        if ( _id_5062( var_2 ) )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_3CEE( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        var_3 = _func_0D9( var_1 );
    else
        var_3 = _func_0D9();

    if ( var_3.size == 0 )
        return undefined;

    if ( isdefined( var_2 ) )
        var_3 = common_scripts\utility::_id_0CF7( var_3, var_2 );

    return common_scripts\utility::_id_3F33( var_0, var_3 );
}

_id_3CEF( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        var_3 = _func_0D9( var_1 );
    else
        var_3 = _func_0D9();

    if ( var_3.size == 0 )
        return undefined;

    return _id_3CF6( var_0, var_3, var_2 );
}

_id_3E3D( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = _func_0EE( var_0, var_1 );

    var_3 = _func_0E1( 0.01, _func_0EE( var_0, var_1 ) );
    var_4 = _func_114( var_1 - var_0 );
    var_5 = var_2 - var_0;
    var_6 = _func_0F6( var_5, var_4 );
    var_6 /= var_3;
    var_6 = _func_0E9( var_6, 0, 1 );
    return var_6;
}

_id_1A4F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !_id_6E1B( var_0 ) )
        return 0;

    if ( !_func_08E( self _meth_80AA(), var_0, var_1, self ) )
        return 0;

    return 1;
}

_id_6E1B( var_0 )
{
    var_1 = anglestoforward( self.angles );
    var_2 = _func_114( var_0 - self._id_02E2 );
    var_3 = _func_0F6( var_1, var_2 );
    return var_3 > 0.766;
}

_id_8EA4()
{
    self notify( "stop_magic_bullet_shield" );

    if ( self._id_01E6 > self.mbs_oldhealth )
        self._id_01E6 = self.mbs_oldhealth;

    self.a._id_60DD = self.mbs_anim_nextstandinghitdying;

    if ( _func_0CF( self ) )
        self.attackeraccuracy = 1;

    self.mbs_oldhealth = undefined;
    self.mbs_anim_nextstandinghitdying = undefined;
    self._id_58D7 = undefined;
    self notify( "internal_stop_magic_bullet_shield" );
}

_id_58D5()
{

}

_id_58D7( var_0, var_1, var_2, var_3, var_4 )
{
    if ( _func_0CF( self ) )
    {

    }
    else
        self._id_01E6 = 100000;

    self endon( "internal_stop_magic_bullet_shield" );

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = self._id_01E6;

    self.mbs_oldhealth = var_3;

    if ( _func_0CF( self ) )
    {
        self.mbs_anim_nextstandinghitdying = self.a._id_60DD;
        self.attackeraccuracy = 0;
        self.a._id_2B18 = 1;
        self.a._id_60DD = 0;
    }

    self notify( "magic_bullet_shield" );
    self._id_58D7 = 1;
    self._id_6159 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 100000000;

    for (;;)
    {
        self._id_01E6 = var_1;
        self._id_0271 = self._id_01E6 * var_4;
        var_3 = self._id_01E6;
        self waittill( "pain" );

        if ( var_3 == self._id_01E6 )
            continue;

        if ( var_2 > 0 )
            thread _id_4BA6( var_2 );

        thread turret_ignore_me_timer( 5 );
    }
}

_id_2AB1()
{
    self.a._id_2B18 = 1;
}

_id_30CF()
{
    self.a._id_2B18 = 0;
}

_id_30A4()
{
    self._id_85B9 = undefined;
}

_id_2A7F()
{
    self._id_85B9 = 1;
}

_id_27F2()
{
    _id_58D7( 1 );
}

_id_3DA5()
{
    return self._id_01FF;
}

_id_7E5E( var_0 )
{
    self._id_01FF = var_0;
}

_id_7E5D( var_0 )
{
    self._id_01FB = var_0;
}

_id_7E5F( var_0 )
{
    self._id_4BBB = var_0;
}

_id_7E20( var_0 )
{
    self._id_0179 = var_0;
}

_id_3E16()
{
    return self._id_02E6;
}

_id_7E91( var_0 )
{
    self._id_02E6 = var_0;
}

_id_4BA6( var_0 )
{
    self notify( "new_ignore_me_timer" );
    self endon( "new_ignore_me_timer" );
    self endon( "death" );
    self endon( "pain" );

    if ( !isdefined( self._id_4BA7 ) )
        self._id_4BA7 = self._id_01FF;

    var_1 = _func_0D9( "bad_guys" );

    foreach ( var_3 in var_1 )
    {
        if ( !_func_1A1( var_3._id_0142 ) )
            continue;

        if ( var_3._id_0142 != self )
            continue;

        var_3 _meth_816A();
    }

    self._id_01FF = 1;
    wait(var_0);
    self._id_01FF = self._id_4BA7;
    self._id_4BA7 = undefined;
}

turret_ignore_me_timer( var_0 )
{
    self endon( "death" );
    self endon( "pain" );
    self._id_04D5 = 1;
    wait(var_0);
    self._id_04D5 = 0;
}

_id_280D( var_0 )
{
    common_scripts\_exploder::_id_280E( var_0 );
}

_id_484F( var_0 )
{
    common_scripts\_exploder::_id_4850( var_0 );
}

_id_84CE( var_0 )
{
    common_scripts\_exploder::_id_84CF( var_0 );
}

_id_8E7E( var_0 )
{
    common_scripts\_exploder::_id_8E7F( var_0 );
}

_id_3D5F( var_0 )
{
    return common_scripts\_exploder::_id_3D60( var_0 );
}

_id_38EF( var_0 )
{
    _id_A581::_id_38F1( var_0 );
}

_id_7DB9( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 2.0;

    level.ambient = var_0;

    if ( isdefined( level._id_0B47 ) && isdefined( level._id_0B47[var_0] ) )
        _func_126( level._id_0B47[var_0], var_1 );
}

set_ambient_preh1( var_0, var_1 )
{
    _id_A5E7::_id_123A( var_0, var_1 );
}

_id_3992( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 4;

    thread _id_3993( var_0, var_1, var_2, var_3 );
}
#using_animtree("generic_human");

_id_6614()
{
    if ( isdefined( self.a._id_253B ) )
    {
        self.a._id_0CD8["crawl"] = self.a._id_253B["crawl"];
        self.a._id_0CD8["death"] = self.a._id_253B["death"];
        self.a._id_238A = self.a._id_253B["blood_fx_rate"];

        if ( isdefined( self.a._id_253B["blood_fx"] ) )
            self.a._id_2389 = self.a._id_253B["blood_fx"];
    }

    self.a._id_0CD8["stand_2_crawl"] = [];
    self.a._id_0CD8["stand_2_crawl"][0] = %dying_stand_2_crawl_v3;

    if ( isdefined( self._id_6142 ) )
        self.a._id_6E5A = "prone";

    self _meth_8193( "face angle", self.a._id_3991 );
    self.a._id_3991 = undefined;
}

_id_3993( var_0, var_1, var_2, var_3 )
{
    self._id_39C2 = 1;
    self.a._id_399D = var_1;
    self._id_6159 = 1;
    self._id_6142 = var_3;
    self.a._id_253B = var_2;
    self._id_238F = ::_id_6614;
    self._id_0271 = 100000;
    self._id_01E6 = 100000;
    _id_30CF();

    if ( !isdefined( var_3 ) || var_3 == 0 )
        self.a._id_3991 = var_0 + 181.02;
    else
    {
        self.a._id_3991 = var_0;
        thread animscripts\notetracks::_id_61DE();
    }
}

_id_6092()
{
    self endon( "death" );

    for (;;)
    {
        var_0 = self _meth_83B2();

        if ( var_0 )
        {
            var_1 = common_scripts\utility::_id_A070( "exo_dodge", "player_boost_land", "disable_high_jump" );

            if ( !isdefined( var_1 ) || var_1 == "player_boost_land" || var_1 == "disable_high_jump" )
                continue;

            if ( !isdefined( self._id_6092 ) )
                self._id_6092 = 1;

            common_scripts\utility::_id_A069( "player_boost_land", "disable_high_jump" );
            waittillframeend;
            self._id_6092 = undefined;
        }

        waittillframeend;
    }
}

_id_1CD4()
{
    if ( getdvar( "mapname", "undefined" ) != "sanfran_b" )
        return;

    if ( !isdefined( level._id_0318._id_594D ) || !level._id_0318._id_594D )
        level._id_0318._id_594D = 1;

    wait 2.0;
    level._id_0318._id_594D = undefined;
}

_id_5DA9( var_0, var_1, var_2 )
{
    if ( var_1 != "MOD_GRENADE" )
    {
        var_0._id_3CAB = undefined;
        return;
    }

    if ( !isdefined( var_0._id_3CAB ) )
        var_0._id_3CAB = 1;
    else
        var_0._id_3CAB++;

    if ( var_0._id_3CAB == 4 )
        _id_41DD( "SMART_GRENADE_KILL" );

    wait 0.1;
    var_0._id_3CAB = undefined;
}

_id_8C0F()
{
    _id_0761( "axis", ::_id_5D98 );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::_id_5D98 );
    level._id_43EA = 0;
    level._id_0318._id_3351 = [];
}

_id_5D98()
{
    for (;;)
    {
        var_0 = undefined;
        self waittill( "grenade_fire", var_0, var_1 );
        var_0._id_9A29 = level._id_43EA;
        level._id_43EA++;
        var_0._id_02E5 = self._id_9A29;
        var_0 thread _id_3352();
        var_0 thread _id_3351();
    }
}

_id_3352()
{
    var_0 = level._id_0318;
    var_1 = self._id_9A29;

    while ( isdefined( self ) )
    {
        var_2 = var_0._id_02E2 - self._id_02E2;
        var_3 = _func_20E( "fraggrenade" ) + 23;
        var_4 = _func_0E8( var_3 );
        var_5 = _func_0F3( var_2 );

        if ( var_5 > var_4 )
        {
            if ( isdefined( var_0._id_3351[self._id_9A29] ) )
                var_0._id_3351[self._id_9A29] = undefined;
        }
        else if ( !isdefined( var_0._id_3351[self._id_9A29] ) )
        {
            if ( isdefined( self._id_02E5 ) )
                var_0._id_3351[self._id_9A29] = 1;
        }

        waittillframeend;
    }

    if ( isdefined( var_0._id_3351[var_1] ) )
        var_0._id_3351[var_1] = undefined;
}

_id_3351()
{
    var_0 = level._id_0318;

    while ( isdefined( self ) )
    {
        if ( isdefined( var_0._id_3351[self._id_9A29] ) )
        {
            var_1 = level._id_0318 common_scripts\utility::_id_A073( 4, "exo_dodge" );

            if ( isdefined( var_1 ) && var_1 == "exo_dodge" )
                thread _id_1CC2();

            continue;
        }

        waittillframeend;
    }
}

_id_1CC2()
{
    level._id_0318 endon( "death" );

    while ( isdefined( self ) )
    {
        var_0 = level._id_0318 _id_A084( 1, "damage" );

        if ( isdefined( var_0 ) && _func_0CE( var_0 ) )
        {
            if ( var_0[5] == "MOD_GRENADE_SPLASH" && !isdefined( level._id_0318._id_3353 ) )
            {
                if ( var_0[2]._id_9A29 == self._id_02E5 && isdefined( level._id_0318._id_3351[self._id_9A29] ) )
                    level._id_0318._id_3353 = 1;
            }

            continue;
        }

        waittillframeend;
    }
}

_id_3354()
{
    var_0 = self _meth_8212( "ach_escapeArtist" ) + 1;

    if ( var_0 == 20 )
        _id_41DD( "GRENADE_DODGE" );

    self _meth_8213( "ach_escapeArtist", var_0 );
}

_id_A084( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 != "death" )
        self endon( "death" );

    var_2 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread common_scripts\utility::_id_A0BB( var_1, var_2 );

    var_2 childthread common_scripts\utility::_id_0676( var_0 );
    var_2 waittill( "returned", var_3 );
    var_2 notify( "die" );
    return var_3;
}

_id_83D0()
{
    precacheshellshock( "default" );
    self waittill( "death" );

    if ( isdefined( self._id_8A2B ) )
        return;

    if ( getdvar( "r_texturebits" ) == "16" )
        return;

    self _meth_8186( "default", 3 );
}

_id_6D8B()
{
    self endon( "death" );
    self endon( "stop_unresolved_collision_script" );
    _id_743C();
    childthread _id_6D8C();

    for (;;)
    {
        if ( self._id_04DF )
        {
            self._id_04DF = 0;

            if ( self._id_9A58 >= 20 )
            {
                if ( isdefined( self._id_4632 ) )
                    self [[ self._id_4632 ]]();
                else
                    _id_2790();
            }
        }
        else
            _id_743C();

        wait 0.05;
    }
}

playerwatch_register_crusher( var_0 )
{
    if ( !isdefined( level._id_0318.crushers ) )
    {
        level._id_0318 thread playerwatch_unresolved_crusher_collision();
        level._id_0318.crushers = [];
    }

    level._id_0318.crushers[level._id_0318.crushers.size] = var_0;
}

playerwatch_unregister_crusher( var_0 )
{
    if ( isdefined( level._id_0318.crushers ) && _id_503B( level._id_0318.crushers, var_0 ) )
        level._id_0318.crushers = common_scripts\utility::_id_0CF6( level._id_0318.crushers, var_0 );
}

playerwatch_unresolved_crusher_collision()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "unresolved_collision", var_0 );

        if ( isdefined( level._id_0318.crushers ) )
        {
            if ( common_scripts\utility::_id_0CE4( level._id_0318.crushers, var_0 ) )
                self _meth_8053( 10000, self._id_02E2, self, self, "MOD_CRUSH" );
        }

        wait 0.05;
    }
}

_id_6D8C()
{
    for (;;)
    {
        self waittill( "unresolved_collision" );
        self._id_04DF = 1;
        self._id_9A58++;
    }
}

_id_743C()
{
    self._id_04DF = 0;
    self._id_9A58 = 0;
}

_id_2790()
{
    var_0 = _func_0C7( self._id_02E2, 300, 0, 200, "Path" );

    if ( var_0.size )
    {
        self _meth_8434();
        self _meth_8094();
        self _meth_8335( var_0[0]._id_02E2 );
        _id_743C();
    }
    else
        self _meth_8054();
}

_id_8EAF()
{
    self notify( "stop_unresolved_collision_script" );
    _id_743C();
}

_id_2826( var_0, var_1 )
{
    var_0 endon( "death" );
    self waittill( "death" );

    if ( isdefined( var_0 ) )
    {
        if ( var_0 _meth_807B() )
            var_0 waittill( var_1 );

        var_0 delete();
    }
}

_id_5014()
{
    return _func_0D1( self ) && !_func_1A1( self );
}

_id_69C5( var_0, var_1, var_2, var_3, var_4 )
{
    if ( _id_5014() )
        return;

    if ( !_func_1CA( var_0 ) )
        return;

    var_5 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_5 endon( "death" );
    thread _id_2826( var_5, "sounddone" );

    if ( isdefined( var_1 ) )
        var_5 _meth_804F( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    else
    {
        var_5._id_02E2 = self._id_02E2;
        var_5.angles = self.angles;
        var_5 _meth_804F( self );
    }

    var_5 _meth_809C( var_0, "sounddone" );

    if ( isdefined( var_2 ) )
    {
        if ( !isdefined( _id_A5A5::_id_9FBD( var_5 ) ) )
            var_5 _meth_80AE();

        wait 0.05;
    }
    else
        var_5 waittill( "sounddone" );

    if ( isdefined( var_3 ) )
        self notify( var_3 );

    var_5 delete();
}

_id_69C6( var_0, var_1 )
{
    _id_69C5( var_0, var_1, 1 );
}

_id_69C4( var_0, var_1 )
{
    _id_69C5( var_0, undefined, undefined, var_1 );
}

_id_6976( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_6 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_6 endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_2 )
        thread common_scripts\utility::_id_2825( var_6 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( var_3 )
        thread _id_282C( var_6 );

    if ( isdefined( var_1 ) )
        var_6 _meth_804F( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    else
    {
        var_6._id_02E2 = self._id_02E2;
        var_6.angles = self.angles;
        var_6 _meth_804F( self );
    }

    if ( isdefined( var_4 ) && var_4 > 0 )
        var_6 _meth_8070( 0 );

    var_6 _meth_8077( var_0 );

    if ( isdefined( var_4 ) && var_4 > 0 )
        var_6 _meth_8071( 1, var_4 );

    self waittill( "stop sound" + var_0 );

    if ( isdefined( var_5 ) && var_5 > 0 )
    {
        var_6 _meth_8071( 0, var_5 );
        wait(var_5 + 0.05);
    }

    var_6 _meth_80AD( var_0 );
    var_6 delete();
}

_id_282C( var_0 )
{
    var_0 endon( "death" );

    while ( isdefined( self ) )
        wait 0.05;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_7805()
{
    var_0 = _func_0D9( "allies" );
    var_1 = 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_79EE ) )
            continue;

        game["character" + var_1] = var_0[var_2] codescripts\character::_id_7802();
        var_1++;
    }

    game["total characters"] = var_1;
}

_id_88F1( var_0 )
{
    if ( !_func_1A1( var_0 ) )
        return 1;

    if ( !isdefined( var_0._id_3797 ) )
        var_0 common_scripts\utility::_id_A087( "finished spawning", "death" );

    if ( _func_1A1( var_0 ) )
        return 0;

    return 1;
}

_id_894D( var_0 )
{
    codescripts\character::_id_032C( var_0 );
    self waittill( "spawned", var_1 );

    if ( _id_88F1( var_1 ) )
        return;

    var_1 codescripts\character::_id_6099();
    var_1 codescripts\character::_id_57BD( var_0 );
}

_id_52E5( var_0, var_1 )
{
    iprintlnbold( var_0, var_1["key1"] );
}

_id_9E15( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        _id_A526::_id_2DE7( var_0 );
        wait 0.05;
    }
}

_id_0D61( var_0 )
{
    if ( isdefined( var_0 ) )
        self._id_0C72 = var_0;

    self _meth_8117( level._id_78B1[self._id_0C72] );
}

_id_0D68()
{
    if ( _func_0CE( level._id_78B5[self._id_0C72] ) )
    {
        var_0 = _func_0B2( level._id_78B5[self._id_0C72].size );
        self _meth_80B3( level._id_78B5[self._id_0C72][var_0] );
    }
    else
        self _meth_80B3( level._id_78B5[self._id_0C72] );
}

_id_88D1( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    var_3 = spawn( "script_model", var_1 );
    var_3._id_0C72 = var_0;
    var_3 _id_0D61();
    var_3 _id_0D68();

    if ( isdefined( var_2 ) )
        var_3.angles = var_2;

    return var_3;
}

_id_980D( var_0, var_1 )
{
    var_2 = getent( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        return;

    var_2 waittill( "trigger", var_3 );
    level notify( var_0, var_3 );
    return var_3;
}

_id_980E( var_0 )
{
    return _id_980D( var_0, "targetname" );
}

_id_7E27( var_0, var_1 )
{
    thread _id_7E2A( var_0, var_1, ::_id_A07E, "set_flag_on_dead" );
}

_id_7E28( var_0, var_1 )
{
    thread _id_7E2A( var_0, var_1, ::_id_A07F, "set_flag_on_dead_or_dying" );
}

_id_7E2B( var_0, var_1 )
{
    thread _id_7E2A( var_0, var_1, ::_id_3092, "set_flag_on_spawned" );
}

_id_3092( var_0 )
{
    return;
}

_id_7E2C( var_0, var_1 )
{
    self waittill( "spawned", var_2 );

    if ( _id_88F1( var_2 ) )
        return;

    var_0._id_08B4[var_0._id_08B4.size] = var_2;
    _id_32DE( var_1 );
}

_id_7E2A( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_08B4 = [];

    foreach ( var_7, var_6 in var_0 )
        var_6 _id_32DD( var_3 );

    common_scripts\utility::_id_0D13( var_0, ::_id_7E2C, var_4, var_3 );

    foreach ( var_7, var_6 in var_0 )
        var_6 _id_32E0( var_3 );

    [[ var_2 ]]( var_4._id_08B4 );
    common_scripts\utility::_id_383F( var_1 );
}

_id_7E2E( var_0, var_1 )
{
    if ( !common_scripts\utility::_id_382E( var_1 ) )
    {
        var_0 waittill( "trigger", var_2 );
        common_scripts\utility::_id_383F( var_1 );
        return var_2;
    }
}

_id_7E2D( var_0 )
{
    if ( common_scripts\utility::_id_382E( var_0 ) )
        return;

    var_1 = getent( var_0, "targetname" );
    var_1 waittill( "trigger" );
    common_scripts\utility::_id_383F( var_0 );
}

_id_503B( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == var_1 )
            return 1;
    }

    return 0;
}

_id_A07E( var_0, var_1, var_2 )
{
    var_10 = spawnstruct();

    if ( isdefined( var_2 ) )
    {
        var_10 endon( "thread_timed_out" );
        var_10 thread _id_A082( var_2 );
    }

    var_10.count = var_0.size;

    if ( isdefined( var_1 ) && var_1 < var_10.count )
        var_10.count = var_1;

    common_scripts\utility::_id_0D13( var_0, ::_id_A081, var_10 );

    while ( var_10.count > 0 )
        var_10 waittill( "waittill_dead guy died" );
}

_id_A07F( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        if ( _func_1A1( var_5 ) && !var_5._id_01FE )
            var_3[var_3.size] = var_5;
    }

    var_0 = var_3;
    var_7 = spawnstruct();

    if ( isdefined( var_2 ) )
    {
        var_7 endon( "thread_timed_out" );
        var_7 thread _id_A082( var_2 );
    }

    var_7.count = var_0.size;

    if ( isdefined( var_1 ) && var_1 < var_7.count )
        var_7.count = var_1;

    common_scripts\utility::_id_0D13( var_0, ::_id_A080, var_7 );

    while ( var_7.count > 0 )
        var_7 waittill( "waittill_dead_guy_dead_or_dying" );
}

_id_A081( var_0 )
{
    self waittill( "death" );
    var_0.count--;
    var_0 notify( "waittill_dead guy died" );
}

_id_A080( var_0 )
{
    common_scripts\utility::_id_A087( "death", "pain_death" );
    var_0.count--;
    var_0 notify( "waittill_dead_guy_dead_or_dying" );
}

_id_A082( var_0 )
{
    wait(var_0);
    self notify( "thread_timed_out" );
}

_id_A066( var_0 )
{
    while ( level._id_054A[var_0]._id_89CC || level._id_054A[var_0]._id_0949 )
        wait 0.25;
}

_id_A067( var_0, var_1 )
{
    while ( level._id_054A[var_0]._id_89CC + level._id_054A[var_0]._id_0949 > var_1 )
        wait 0.25;
}

_id_3CB5( var_0 )
{
    return level._id_054A[var_0]._id_89CC + level._id_054A[var_0]._id_0949;
}

_id_3CB6( var_0 )
{
    return level._id_054A[var_0]._id_0949;
}

_id_3CB4( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_054A[var_0]._id_08B4.size; var_2++ )
    {
        if ( !_func_1A1( level._id_054A[var_0]._id_08B4[var_2] ) )
            continue;

        var_1[var_1.size] = level._id_054A[var_0]._id_08B4[var_2];
    }

    return var_1;
}

_id_A09C( var_0 )
{
    self endon( "damage" );
    self endon( "death" );
    self waittillmatch( "single anim", var_0 );
}

_id_3DC5( var_0, var_1 )
{
    var_2 = _id_3DC6( var_0, var_1 );

    if ( var_2.size > 1 )
        return undefined;

    return var_2[0];
}

_id_3DC6( var_0, var_1 )
{
    var_2 = _func_0DA( "all", "all" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( !_func_1A1( var_5 ) )
            continue;

        switch ( var_1 )
        {
            case "targetname":
                if ( isdefined( var_5._id_04A6 ) && var_5._id_04A6 == var_0 )
                    var_3[var_3.size] = var_5;

                continue;
            case "script_noteworthy":
                if ( isdefined( var_5._id_0398 ) && var_5._id_0398 == var_0 )
                    var_3[var_3.size] = var_5;

                continue;
        }
    }

    return var_3;
}

_id_3EB2( var_0, var_1 )
{
    var_2 = _id_3EB6( var_0, var_1 );

    if ( !var_2.size )
        return undefined;

    return var_2[0];
}

_id_3EB6( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );
    var_3 = [];
    var_4 = [];

    foreach ( var_6 in var_2 )
    {
        if ( var_6.code_classname != "script_vehicle" )
            continue;

        var_4[0] = var_6;

        if ( _func_1A2( var_6 ) )
        {
            if ( isdefined( var_6._id_555C ) )
            {
                var_4[0] = var_6._id_555C;
                var_3 = _id_0CF2( var_3, var_4 );
            }

            continue;
        }

        var_3 = _id_0CF2( var_3, var_4 );
    }

    return var_3;
}

_id_3DC7( var_0, var_1, var_2 )
{
    var_3 = _id_3DC8( var_0, var_1, var_2 );

    if ( var_3.size > 1 )
        return undefined;

    return var_3[0];
}

_id_3DC8( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "all";

    var_3 = _func_0DA( "allies", var_2 );
    var_3 = common_scripts\utility::_id_0CDD( var_3, _func_0DA( "axis", var_2 ) );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        switch ( var_1 )
        {
            case "targetname":
                if ( isdefined( var_3[var_5]._id_04A6 ) && var_3[var_5]._id_04A6 == var_0 )
                    var_4[var_4.size] = var_3[var_5];

                continue;
            case "script_noteworthy":
                if ( isdefined( var_3[var_5]._id_0398 ) && var_3[var_5]._id_0398 == var_0 )
                    var_4[var_4.size] = var_3[var_5];

                continue;
        }
    }

    return var_4;
}

_id_3C5E( var_0, var_1 )
{
    if ( isdefined( level._id_3C5D[var_0] ) )
    {
        if ( level._id_3C5D[var_0] )
        {
            wait 0.05;

            if ( _func_1A1( self ) )
                self notify( "gather_delay_finished" + var_0 + var_1 );

            return;
        }

        level waittill( var_0 );

        if ( _func_1A1( self ) )
            self notify( "gather_delay_finished" + var_0 + var_1 );

        return;
    }

    level._id_3C5D[var_0] = 0;
    wait(var_1);
    level._id_3C5D[var_0] = 1;
    level notify( var_0 );

    if ( _func_1A1( self ) )
        self notify( "gat    her_delay_finished" + var_0 + var_1 );
}

_id_3C5D( var_0, var_1 )
{
    thread _id_3C5E( var_0, var_1 );
    self waittill( "gather_delay_finished" + var_0 + var_1 );
}

_id_264F( var_0 )
{
    self waittill( "death" );
    level notify( var_0 );
}

_id_3F2E( var_0 )
{
    if ( var_0 == 0 )
        return "0";

    if ( var_0 == 1 )
        return "1";

    if ( var_0 == 2 )
        return "2";

    if ( var_0 == 3 )
        return "3";

    if ( var_0 == 4 )
        return "4";

    if ( var_0 == 5 )
        return "5";

    if ( var_0 == 6 )
        return "6";

    if ( var_0 == 7 )
        return "7";

    if ( var_0 == 8 )
        return "8";

    if ( var_0 == 9 )
        return "9";
}

_id_4006( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];
        var_5 = var_4._id_0396;

        if ( !isdefined( var_5 ) )
            continue;

        if ( !isdefined( var_1[var_5] ) )
            continue;

        var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_0CF3( var_0, var_1 )
{
    if ( !var_0.size )
        return var_1;

    if ( !var_1.size )
        return var_0;

    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];
        var_2[var_4._id_0396] = 1;
    }

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];

        if ( isdefined( var_2[var_4._id_0396] ) )
            continue;

        var_2[var_4._id_0396] = 1;
        var_0[var_0.size] = var_4;
    }

    return var_0;
}

_id_0CF2( var_0, var_1 )
{
    if ( var_0.size == 0 )
        return var_1;

    if ( var_1.size == 0 )
        return var_0;

    var_2 = var_0;

    foreach ( var_4 in var_1 )
    {
        var_5 = 0;

        foreach ( var_7 in var_0 )
        {
            if ( var_7 == var_4 )
            {
                var_5 = 1;
                break;
            }
        }

        if ( var_5 )
        {
            continue;
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_0CE7( var_0, var_1 )
{
    var_2 = var_0;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( _id_503B( var_0, var_1[var_3] ) )
            var_2 = common_scripts\utility::_id_0CF6( var_2, var_1[var_3] );
    }

    return var_2;
}

_id_0CE3( var_0, var_1 )
{
    if ( var_0.size != var_1.size )
        return 0;

    foreach ( var_5, var_3 in var_0 )
    {
        if ( !isdefined( var_1[var_5] ) )
            return 0;

        var_4 = var_1[var_5];

        if ( var_4 != var_3 )
            return 0;
    }

    return 1;
}

_id_4005()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = common_scripts\utility::_id_3DC3();

        foreach ( var_3 in var_1 )
        {
            var_4 = _func_1ED( var_3, "script_linkname" );
            var_0 = common_scripts\utility::_id_0CDD( var_0, var_4 );
        }
    }

    return var_0;
}

_id_2DB7( var_0, var_1, var_2, var_3, var_4 )
{
    for (;;)
        wait 0.05;
}

_id_2DBE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_5 = gettime() + var_5 * 1000;

    while ( gettime() < var_5 )
    {
        wait 0.05;

        if ( !isdefined( var_1 ) || !isdefined( var_1._id_02E2 ) )
            return;
    }
}

_id_2DB9( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_2DBE( var_1, var_0, var_2, var_3, var_4, var_5 );
}

_id_2DBA( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_5 = gettime() + var_5 * 1000;

    while ( gettime() < var_5 )
        wait 0.05;
}

_id_2DBB( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_5 endon( var_6 );

    for (;;)
        wait 0.05;
}

_id_2DBF( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_5 endon( var_6 );

    for (;;)
        common_scripts\utility::_id_2DB8( var_0, var_1, var_2, var_3, var_4, 0.05 );
}

_id_2DBC( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_6 = gettime() + var_6 * 1000;
    var_1 *= var_2;

    while ( gettime() < var_6 )
    {
        wait 0.05;

        if ( !isdefined( var_0 ) || !isdefined( var_0._id_02E2 ) )
            return;
    }
}

_id_2DA5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_7 ) )
        var_8 = var_7;
    else
        var_8 = 16;

    var_9 = 360 / var_8;
    var_10 = [];

    for ( var_11 = 0; var_11 < var_8; var_11++ )
    {
        var_12 = var_9 * var_11;
        var_13 = _func_0B7( var_12 ) * var_1;
        var_14 = _func_0B6( var_12 ) * var_1;
        var_15 = var_0[0] + var_13;
        var_16 = var_0[1] + var_14;
        var_17 = var_0[2];
        var_10[var_10.size] = ( var_15, var_16, var_17 );
    }

    thread _id_2DA4( var_10, var_2, var_3, var_4, var_5, var_6 );
}

_id_2DA2( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 16;
    var_7 = 360 / var_6;
    var_8 = [];

    for ( var_9 = 0; var_9 < var_6; var_9++ )
    {
        var_10 = var_7 * var_9;
        var_11 = _func_0B7( var_10 ) * var_1;
        var_12 = _func_0B6( var_10 ) * var_1;
        var_13 = var_0[0] + var_11;
        var_14 = var_0[1] + var_12;
        var_15 = var_0[2];
        var_8[var_8.size] = ( var_13, var_14, var_15 );
    }

    thread _id_2DA3( var_8, var_2, var_3, var_4, var_5 );
}

_id_2DA3( var_0, var_1, var_2, var_3, var_4 )
{
    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( var_5 + 1 >= var_0.size )
            var_7 = var_0[0];
        else
            var_7 = var_0[var_5 + 1];

        thread common_scripts\utility::_id_2DB8( var_6, var_7, var_1, var_2, var_3, var_4 );
    }
}

_id_2DA4( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        var_7 = var_0[var_6];

        if ( var_6 + 1 >= var_0.size )
            var_8 = var_0[0];
        else
            var_8 = var_0[var_6 + 1];

        thread _id_2DBF( var_7, var_8, var_1, var_2, var_3, var_4, var_5 );
    }
}

_id_1EB4()
{
    self notify( "enemy" );
    self _meth_816A();
}

_id_1332( var_0 )
{
    if ( !isdefined( level._id_132D ) )
    {
        level._id_132D = [];
        level._id_132D["axis"] = 1;
        level._id_132D["allies"] = 1;
        level._id_132D["neutral"] = 1;
    }

    if ( isdefined( var_0 ) )
    {
        level._id_132D[var_0] = 0;
        var_1 = _func_0D9( var_0 );
    }
    else
    {
        level._id_132D["axis"] = 0;
        level._id_132D["allies"] = 0;
        level._id_132D["neutral"] = 0;
        var_1 = _func_0D9();
    }

    if ( !isdefined( anim._id_1CA5 ) || !anim._id_1CA5 )
        return;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2]._id_132D = 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !_func_1A1( var_3 ) )
            continue;

        if ( !var_3._id_1CA5 )
            continue;

        if ( !var_3._id_51B3 )
            continue;

        var_3 _id_A5A5::_id_9FFA();
    }

    var_4 = gettime() - anim._id_5602["allies"];

    if ( var_4 < 1500 )
        wait(var_4 / 1000);

    if ( isdefined( var_0 ) )
        level notify( var_0 + " done speaking" );
    else
        level notify( "done speaking" );
}

_id_1333( var_0 )
{
    thread _id_1334( var_0 );
}

_id_1334( var_0 )
{
    if ( !isdefined( level._id_132D ) )
    {
        level._id_132D = [];
        level._id_132D["axis"] = 1;
        level._id_132D["allies"] = 1;
        level._id_132D["neutral"] = 1;
    }

    if ( !anim._id_1CA5 )
        return;

    wait 1.5;

    if ( isdefined( var_0 ) )
    {
        level._id_132D[var_0] = 1;
        var_1 = _func_0D9( var_0 );
    }
    else
    {
        level._id_132D["axis"] = 1;
        level._id_132D["allies"] = 1;
        level._id_132D["neutral"] = 1;
        var_1 = _func_0D9();
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _id_7DDF( 1 );
}

_id_7DDF( var_0 )
{
    if ( !isdefined( anim._id_1CA5 ) || !anim._id_1CA5 )
        return;

    if ( self._id_04D9 == "dog" )
        return;

    if ( var_0 )
    {
        if ( isdefined( self._id_795C ) && !self._id_795C )
            self._id_132D = 0;
        else
            self._id_132D = 1;
    }
    else
    {
        self._id_132D = 0;

        if ( isdefined( self._id_51B3 ) && self._id_51B3 )
            self waittill( "done speaking" );
    }
}

_id_7ED2( var_0, var_1 )
{
    if ( !anim._id_1CA5 )
        return;

    var_2 = _func_1D3( anim._id_2244 );
    var_3 = common_scripts\utility::_id_0CE4( var_2, var_1 );

    if ( !var_3 )
        return;

    var_4 = _func_0D9( var_0 );

    foreach ( var_6 in var_4 )
    {
        var_6 _id_7DB4( var_1 );
        waittillframeend;
    }
}

_id_7DB4( var_0 )
{
    if ( !anim._id_1CA5 )
        return;

    var_1 = _func_1D3( anim._id_2244 );
    var_2 = common_scripts\utility::_id_0CE4( var_1, var_0 );

    if ( !var_2 )
        return;

    if ( self._id_04D9 == "dog" )
        return;

    if ( isdefined( self._id_51B3 ) && self._id_51B3 )
    {
        self waittill( "done speaking" );
        wait 0.1;
    }

    animscripts\battlechatter_ai::_id_73AE();
    waitframe;
    self._id_9F32 = var_0;
    animscripts\battlechatter_ai::_id_0850();
}

_id_38CD( var_0 )
{
    thread _id_7E33( 1, var_0 );
}

_id_38CC( var_0 )
{
    thread _id_7E33( 0, var_0 );
}

_id_7E33( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "allies";

    if ( !anim._id_1CA5 )
        return;

    wait 1.5;
    level._id_38CB[var_1] = var_0;
    var_2 = [];
    var_2 = _func_0D9( var_1 );
    common_scripts\utility::_id_0D13( var_2, ::_id_7E32, var_0 );
}

_id_7E32( var_0 )
{
    self._id_38CB = var_0;
}

_id_3AA3()
{
    var_0 = _func_0D9( "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( _func_1A1( var_2 ) )
            var_2 _id_7E41( 0 );
    }

    level._id_3AA1 = 0;
}

_id_3AA4()
{
    var_0 = _func_0D9( "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( _func_1A1( var_2 ) )
            var_2 _id_7E41( 1 );
    }

    level._id_3AA1 = 1;
}

_id_7E41( var_0 )
{
    if ( var_0 )
        self._id_3AA2 = undefined;
    else
        self._id_3AA2 = 1;
}

_id_261F( var_0 )
{
    if ( !_func_1AD( self ) )
        return;

    switch ( var_0 )
    {
        case "mason":
        case "hudson":
        case "reznov":
            level._id_25FA._id_6AA4 = _func_122( var_0, 0, 3 );
            break;
        default:
            level._id_25FA._id_6AA4 = "mas";
            break;
    }

    self._id_25FC = level._id_25FA._id_6AA4;
}

_id_2606( var_0 )
{
    if ( _func_0CF( self ) && _func_1A1( self ) )
    {
        if ( var_0 )
            self._id_2601 = 1;
        else
            self._id_2601 = 0;
    }
    else
    {

    }
}

_id_3DFD( var_0 )
{
    var_1 = getentarray( "objective", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2]._id_0398 == var_0 )
            return var_1[var_2]._id_02E2;
    }
}

_id_3DFC( var_0 )
{
    var_1 = getentarray( "objective_event", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2]._id_0398 == var_0 )
            return var_1[var_2];
    }
}

_id_A0A4()
{
    _id_A5A5::_id_A0A6( 1 );
}

_id_A0A5()
{
    _id_A5A5::_id_A0A6( 0 );
}

_id_272C()
{
    self notify( "Debug origin" );
    self endon( "Debug origin" );
    self endon( "death" );

    for (;;)
    {
        var_0 = anglestoforward( self.angles );
        var_1 = var_0 * 30;
        var_2 = var_0 * 20;
        var_3 = anglestoright( self.angles );
        var_4 = var_3 * -10;
        var_3 *= 10;
        wait 0.05;
    }
}

_id_3DC0()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = common_scripts\utility::_id_3DC3();

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = common_scripts\utility::_id_40FB( var_1[var_2], "script_linkname" );

            if ( isdefined( var_3 ) )
                var_0[var_0.size] = var_3;
        }
    }

    return var_0;
}

_id_3DB1( var_0 )
{
    var_1 = self;

    while ( isdefined( var_1._id_04A4 ) )
    {
        wait 0.05;

        if ( isdefined( var_1._id_04A4 ) )
        {
            switch ( var_0 )
            {
                case "vehiclenode":
                    var_1 = _func_1EC( var_1._id_04A4, "targetname" );
                    break;
                case "pathnode":
                    var_1 = _func_0C3( var_1._id_04A4, "targetname" );
                    break;
                case "ent":
                    var_1 = getent( var_1._id_04A4, "targetname" );
                    break;
                case "struct":
                    var_1 = common_scripts\utility::_id_40FB( var_1._id_04A4, "targetname" );
                    break;
                default:
            }

            continue;
        }

        break;
    }

    var_2 = var_1;
    return var_2;
}

_id_6BFC( var_0 )
{
    var_1 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_1 _meth_804F( level._id_0318 );

    if ( isdefined( var_0 ) )
        thread _id_936B( var_0 );

    self _meth_81AB( var_1 );

    if ( !isdefined( self._id_63CC ) )
        self._id_63CC = self._id_01C4;

    self._id_01C4 = 300;
    common_scripts\utility::_id_A069( "goal", "timeout" );

    if ( isdefined( self._id_63CC ) )
    {
        self._id_01C4 = self._id_63CC;
        self._id_63CC = undefined;
    }

    var_1 delete();
}

_id_936B( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self notify( "timeout" );
}

_id_7E3F()
{
    if ( isdefined( self._id_7E3E ) )
        return;

    self._id_63CA = self._id_02F6;
    self._id_63D7 = self._id_02F7;
    self._id_63D8 = self._id_0273;
    self._id_02F6 = 8;
    self._id_02F7 = 8;
    self._id_0273 = 1;
    self._id_7E3E = 1;
}

_id_9A61()
{
    if ( !isdefined( self._id_7E3E ) )
        return;

    self._id_02F6 = self._id_63CA;
    self._id_02F7 = self._id_63D7;
    self._id_0273 = self._id_63D8;
    self._id_7E3E = undefined;
}

_id_0CFE( var_0 )
{
    var_1 = [];
    var_2 = _func_1D3( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( !_func_1A1( var_0[var_4] ) )
            continue;

        var_1[var_4] = var_0[var_4];
    }

    return var_1;
}

_id_0CFD( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !_func_1A1( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_0CFF( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !_func_1A1( var_3 ) )
            continue;

        if ( var_3 _id_2CE7() )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_0CFB( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3] != var_1 )
            var_2[var_2.size] = var_0[var_3];
    }

    return var_2;
}

_id_0CFA( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size - 1; var_2++ )
    {
        if ( var_2 == var_1 )
        {
            var_0[var_2] = var_0[var_2 + 1];
            var_1++;
        }
    }

    var_0[var_0.size - 1] = undefined;
    return var_0;
}

_id_0CF4( var_0, var_1, var_2 )
{
    foreach ( var_5, var_4 in var_0 )
        var_4 notify( var_1, var_2 );
}

_id_8F62()
{
    var_0 = spawnstruct();
    var_0._id_0CD8 = [];
    var_0._id_55AE = 0;
    return var_0;
}

_id_8F65( var_0, var_1 )
{
    var_0._id_0CD8[var_0._id_55AE] = var_1;
    var_1._id_8F61 = var_0._id_55AE;
    var_0._id_55AE++;
}

_id_8F66( var_0, var_1 )
{
    _id_8F6B( var_0, var_1 );
    var_0._id_0CD8[var_0._id_55AE - 1] = undefined;
    var_0._id_55AE--;
}

_id_8F67( var_0, var_1 )
{
    if ( isdefined( var_0._id_0CD8[var_0._id_55AE - 1] ) )
    {
        var_0._id_0CD8[var_1] = var_0._id_0CD8[var_0._id_55AE - 1];
        var_0._id_0CD8[var_1]._id_8F61 = var_1;
        var_0._id_0CD8[var_0._id_55AE - 1] = undefined;
        var_0._id_55AE = var_0._id_0CD8.size;
    }
    else
    {
        var_0._id_0CD8[var_1] = undefined;
        _id_8F68( var_0 );
    }
}

_id_8F68( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0._id_0CD8 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    var_0._id_0CD8 = var_1;

    foreach ( var_6, var_3 in var_0._id_0CD8 )
        var_3._id_8F61 = var_6;

    var_0._id_55AE = var_0._id_0CD8.size;
}

_id_8F6B( var_0, var_1 )
{
    var_0 _id_A5A5::_id_8F6A( var_0._id_0CD8[var_0._id_55AE - 1], var_1 );
}

_id_8F69( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1; var_2++ )
        var_0 _id_A5A5::_id_8F6A( var_0._id_0CD8[var_2], var_0._id_0CD8[_func_0B2( var_0._id_55AE )] );
}

_id_3EB0()
{
    if ( level._id_2153 )
        return " + usereload";
    else
        return " + activate";
}

_id_2534( var_0 )
{
    var_1 = [];
    var_1[0] = self;
    var_2 = _id_3CEF( self._id_02E2, self._id_04A7, var_1 );

    if ( isdefined( var_2 ) && _func_0EE( var_2._id_02E2, self._id_02E2 ) > 384 )
        var_2 = undefined;

    animscripts\battlechatter_ai::_id_139A();
    var_3 = _func_124( var_0, "_" );

    if ( !var_3.size )
        return;

    if ( var_3[0] == "move" )
    {
        if ( var_3.size > 1 )
            var_4 = var_3[1];
        else
            var_4 = "generic";

        animscripts\battlechatter_ai::addgenericaliasex( "order", "move", var_4 );
    }
    else if ( var_3[0] == "infantry" )
    {
        animscripts\battlechatter_ai::addgenericaliasex( "threat", "infantry", var_3[1] );

        if ( var_3.size > 2 && var_3[2] != "inbound" )
            animscripts\battlechatter_ai::addgenericaliasex( "direction", "relative", var_3[2] );
        else if ( var_3.size > 2 )
            animscripts\battlechatter_ai::addgenericaliasex( "direction", "inbound", var_3[3] );
    }
    else if ( var_3[0] == "vehicle" )
    {
        animscripts\battlechatter_ai::addgenericaliasex( "threat", "vehicle", var_3[1] );

        if ( var_3.size > 2 && var_3[2] != "inbound" )
            animscripts\battlechatter_ai::addgenericaliasex( "direction", "relative", var_3[2] );
        else if ( var_3.size > 2 )
            animscripts\battlechatter_ai::addgenericaliasex( "direction", "inbound", var_3[3] );
    }

    animscripts\battlechatter_ai::_id_3158( 2000 );
}

_id_3E75( var_0, var_1 )
{
    var_2 = _func_1A9();

    if ( level._id_2153 )
    {
        var_2._id_0530 = 68;
        var_2._id_0538 = 35;
    }
    else
    {
        var_2._id_0530 = 58;
        var_2._id_0538 = 95;
    }

    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2._id_01F3 = "left";
    var_2._id_0501 = "middle";

    if ( isdefined( var_1 ) )
        var_3 = var_1;
    else
        var_3 = level._id_3580;

    var_2 _meth_80D7( var_3, var_0, "hudStopwatch", 64, 64 );
    return var_2;
}

_id_62F0( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_071A.size; var_2++ )
    {
        if ( level._id_071A[var_2] != var_0 )
            continue;

        var_1 = 1;
        break;
    }

    return var_1;
}

_id_62F1( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_4C12.size; var_2++ )
    {
        if ( level._id_4C12[var_2] != var_0 )
            continue;

        var_1 = 1;
        break;
    }

    return var_1;
}

_id_7E88( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_071A.size; var_2++ )
    {
        if ( level._id_071A[var_2] == var_0 )
            continue;

        var_1[var_1.size] = level._id_071A[var_2];
    }

    level._id_071A = var_1;
    var_3 = 0;

    for ( var_2 = 0; var_2 < level._id_4C12.size; var_2++ )
    {
        if ( level._id_4C12[var_2] != var_0 )
            continue;

        var_3 = 1;
    }

    if ( !var_3 )
        level._id_4C12[level._id_4C12.size] = var_0;
}

_id_7E87( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_4C12.size; var_2++ )
    {
        if ( level._id_4C12[var_2] == var_0 )
            continue;

        var_1[var_1.size] = level._id_4C12[var_2];
    }

    level._id_4C12 = var_1;
    var_3 = 0;

    for ( var_2 = 0; var_2 < level._id_071A.size; var_2++ )
    {
        if ( level._id_071A[var_2] != var_0 )
            continue;

        var_3 = 1;
    }

    if ( !var_3 )
        level._id_071A[level._id_071A.size] = var_0;
}

_id_5CDF()
{
    if ( level._id_5CDE )
        return;

    if ( isdefined( level._id_60D6 ) )
        return;

    save_time_played();
    _func_0D6( "ammoCounterHide", 1 );
    level._id_5CDE = 1;
    common_scripts\utility::_id_383F( "missionfailed" );

    if ( _id_0CC3() )
        return;

    if ( getdvar( "failure_disabled" ) == "1" )
        return;

    if ( isdefined( level._id_5CD1 ) )
    {
        thread [[ level._id_5CD1 ]]();
        return;
    }

    _id_A5A5::_id_5CD7( 0 );
    _func_057();
}

_id_7E7D( var_0 )
{
    level._id_5CD1 = var_0;
}

_id_0392()
{
    if ( isdefined( self._id_0392 ) )
    {
        wait(self._id_0392);
        return 1;
    }
    else if ( isdefined( self._id_798E ) && isdefined( self._id_798D ) )
    {
        wait(_func_0B5( self._id_798E, self._id_798D ));
        return 1;
    }

    return 0;
}

_id_7B20()
{
    var_0 = gettime();

    if ( isdefined( self._id_7B20 ) )
    {
        wait(self._id_7B20);

        if ( isdefined( self._id_7B21 ) )
            self._id_7B20 += self._id_7B21;
    }
    else if ( isdefined( self._id_7B23 ) && isdefined( self._id_7B22 ) )
    {
        wait(_func_0B5( self._id_7B23, self._id_7B22 ));

        if ( isdefined( self._id_7B21 ) )
        {
            self._id_7B23 += self._id_7B21;
            self._id_7B22 += self._id_7B21;
        }
    }

    return gettime() - var_0;
}

_id_4493( var_0 )
{
    _id_A5A9::_id_4492( var_0 );
}

_id_44AD( var_0, var_1 )
{
    _id_A5A9::_id_44AC( var_0, var_1 );
}

_id_3D7A( var_0, var_1 )
{
    var_2 = _func_0D9( var_0 );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = var_2[var_4];

        if ( !isdefined( var_5._id_79E6 ) )
            continue;

        if ( var_5._id_79E6 != var_1 )
            continue;

        var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_3CBE()
{
    var_0 = _func_0D9( "allies" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !isdefined( var_3._id_79E6 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_3CC0( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_04A4;

    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, var_2 );
    var_2 = _func_0C4( var_0, "targetname" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, var_2 );
    var_2 = common_scripts\utility::_id_40FD( var_0, "targetname" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, var_2 );
    var_2 = _func_1ED( var_0, "targetname" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, var_2 );
    return var_1;
}

_id_309A()
{
    if ( isdefined( self._id_79E6 ) )
        return;

    if ( !isdefined( self._id_63A1 ) )
        return;

    _id_7E38( self._id_63A1 );
    self._id_63A1 = undefined;
}

_id_309B()
{
    self._id_2D2E = 1;
    _id_309A();
}

_id_2A74()
{
    if ( isdefined( self._id_609C ) )
    {
        self endon( "death" );
        self waittill( "done_setting_new_color" );
    }

    self _meth_8160();

    if ( !isdefined( self._id_79E6 ) )
        return;

    self._id_63A1 = self._id_79E6;
    level._id_0D22[self._id_04A7][self._id_79E6] = common_scripts\utility::_id_0CF6( level._id_0D22[self._id_04A7][self._id_79E6], self );
    _id_A51C::_id_5674();
    self._id_79E6 = undefined;
    self._id_250C = undefined;
}

_id_1EB8()
{
    _id_2A74();
}

_id_1CC0( var_0 )
{
    var_1 = level._id_2048[_func_123( var_0 )];

    if ( isdefined( self._id_79E6 ) && var_1 == self._id_79E6 )
        return 1;
    else
        return 0;
}

_id_3D79()
{
    var_0 = self._id_79E6;
    return var_0;
}

_id_8439( var_0 )
{
    return level._id_2048[_func_123( var_0 )];
}

_id_7E38( var_0 )
{
    var_1 = _id_8439( var_0 );

    if ( !_func_0CF( self ) )
    {
        _id_7E39( var_1 );
        return;
    }

    if ( self._id_04A7 == "allies" )
    {
        self._id_017D = 1;
        self._id_017E = 64;
        self._id_02F6 = 0;
        self._id_02F7 = 0;
    }

    self._id_7976 = undefined;
    self._id_7975 = undefined;
    self._id_63A1 = undefined;

    if ( isdefined( self._id_79E6 ) )
        level._id_0D22[self._id_04A7][self._id_79E6] = common_scripts\utility::_id_0CF6( level._id_0D22[self._id_04A7][self._id_79E6], self );

    self._id_79E6 = var_1;
    level._id_0D22[self._id_04A7][self._id_79E6] = common_scripts\utility::_id_0CDA( level._id_0D22[self._id_04A7][self._id_79E6], self );
    thread _id_A5A5::new_color_being_set( var_1 );
}

_id_7E39( var_0 )
{
    self._id_79E6 = var_0;
    self._id_63A1 = undefined;
}

_id_51BE( var_0, var_1 )
{
    var_2 = _func_124( var_0, " " );
    var_3 = [];
    var_4 = [];

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_6 = undefined;

        if ( _func_120( var_2[var_5], "r" ) )
            var_6 = "r";
        else if ( _func_120( var_2[var_5], "b" ) )
            var_6 = "b";
        else if ( _func_120( var_2[var_5], "y" ) )
            var_6 = "y";
        else if ( _func_120( var_2[var_5], "c" ) )
            var_6 = "c";
        else if ( _func_120( var_2[var_5], "g" ) )
            var_6 = "g";
        else if ( _func_120( var_2[var_5], "p" ) )
            var_6 = "p";
        else if ( _func_120( var_2[var_5], "o" ) )
            var_6 = "o";
        else if ( _func_120( var_2[var_5], "w" ) )
            var_6 = "w";
        else if ( _func_120( var_2[var_5], "a" ) )
            var_6 = "a";
        else if ( _func_120( var_2[var_5], "l" ) )
            var_6 = "l";
        else
        {

        }

        var_4[var_6] = var_2[var_5];
        var_3[var_3.size] = var_6;
    }

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        level.arrays_of_colorcoded_spawners[var_1][var_2[var_5]] = common_scripts\utility::_id_0D01( level.arrays_of_colorcoded_spawners[var_1][var_2[var_5]] );

        for ( var_7 = 0; var_7 < level.arrays_of_colorcoded_spawners[var_1][var_2[var_5]].size; var_7++ )
            level.arrays_of_colorcoded_spawners[var_1][var_2[var_5]][var_7]._id_250C = var_2[var_5];
    }

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        level._id_0D22[var_1][var_3[var_5]] = _id_0CFD( level._id_0D22[var_1][var_3[var_5]] );
        level._id_250D[var_1][var_3[var_5]] = var_4[var_3[var_5]];
    }

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        thread _id_A51C::_id_51BD( var_2[var_5], var_3[var_5], var_1 );
}

_id_1EA5( var_0, var_1 )
{

}

_id_1E95( var_0 )
{

}

_id_7402()
{
    thread _id_A51C::_id_2050();
}

_id_2ACC()
{
    self._id_7402 = undefined;
    self notify( "_disable_reinforcement" );
}

_id_8EB9()
{
    self notify( "_disable_reinforcement" );
}

_id_8E61( var_0, var_1 )
{

}

_id_8944( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = "allies";

    thread _id_A51C::_id_2055( var_0, var_1 );
}

_id_1ECF()
{
    level._id_24DC = [];
}

_id_7EA2( var_0, var_1 )
{
    if ( !isdefined( level._id_24DC ) )
        level._id_24DC = [];

    var_0 = _id_8439( var_0 );
    var_1 = _id_8439( var_1 );
    level._id_24DC[var_0] = var_1;

    if ( !isdefined( level._id_24DC[var_1] ) )
        _id_7E19( var_1 );
}

set_promotion_order_preh1( var_0, var_1 )
{

}

_id_7E19( var_0 )
{
    if ( !isdefined( level._id_24DC ) )
        level._id_24DC = [];

    level._id_24DC[var_0] = "none";
}

set_empty_promotion_order_preh1( var_0 )
{

}

_id_46E8()
{
    if ( self._id_04A7 == "axis" )
        return isdefined( self._id_7976 ) || isdefined( self._id_79E6 );

    return isdefined( self._id_7975 ) || isdefined( self._id_79E6 );
}

_id_3D0E()
{

}

_id_3D0A()
{

}

_id_38C5( var_0 )
{
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self _meth_80AF( "damage_heavy" );
        wait 0.05;
    }
}

_id_38C2( var_0 )
{
    self endon( "death" );
    self endon( "flashed" );
    wait 0.2;
    self _meth_8134( 0 );
    wait(var_0 + 2);
    self _meth_8134( 1 );
}

_id_60ED( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [ 0.8, 0.7, 0.7, 0.6 ];
    var_6 = [ 1.0, 0.8, 0.6, 0.6 ];

    foreach ( var_12, var_8 in var_6 )
    {
        var_9 = ( var_1 - 0.85 ) / 0.15;

        if ( var_9 > var_2 )
            var_2 = var_9;

        if ( var_2 < 0.25 )
            var_2 = 0.25;

        var_10 = 0.3;

        if ( var_1 > 1 - var_10 )
            var_1 = 1.0;
        else
            var_1 /= ( 1 - var_10 );

        if ( var_4 != self._id_04A7 )
            var_11 = var_1 * var_2 * 6.0;
        else
            var_11 = var_1 * var_2 * 3.0;

        if ( var_11 < 0.25 )
            continue;

        var_11 = var_8 * var_11;

        if ( isdefined( self._id_5A38 ) && var_11 > self._id_5A38 )
            var_11 = self._id_5A38;

        self._id_38B6 = var_4;
        self notify( "flashed" );
        self._id_38B1 = gettime() + var_11 * 1000;
        self _meth_8186( "flashbang", var_11 );
        thread _id_A5DC::aud_set_flashbang();
        common_scripts\utility::_id_383F( "player_flashed" );

        if ( var_1 * var_2 > 0.5 )
            thread _id_38C2( var_11 );

        wait(var_5[var_12]);
    }

    thread _id_A5A5::_id_9A25( 0.05 );
}

_id_38C1()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "flashbang", var_0, var_1, var_2, var_3, var_4 );

        if ( "1" == getdvar( "noflash" ) )
            continue;

        if ( _id_5062( self ) )
            continue;

        if ( isdefined( self._id_9336 ) )
        {
            var_5 = 0.8;
            var_6 = 1.0 - var_5;
            self._id_9336 = undefined;

            if ( var_1 < var_6 )
                continue;

            var_1 = ( var_1 - var_6 ) / var_5;
        }

        var_7 = ( var_1 - 0.85 ) / 0.15;

        if ( var_7 > var_2 )
            var_2 = var_7;

        if ( var_2 < 0.25 )
            var_2 = 0.25;

        var_8 = 0.3;

        if ( var_1 > 1 - var_8 )
            var_1 = 1.0;
        else
            var_1 /= ( 1 - var_8 );

        if ( var_4 != self._id_04A7 )
            var_9 = var_1 * var_2 * 6.0;
        else
            var_9 = var_1 * var_2 * 3.0;

        if ( var_9 < 0.25 )
            continue;

        if ( isdefined( self._id_5A38 ) && var_9 > self._id_5A38 )
            var_9 = self._id_5A38;

        self._id_38B6 = var_4;
        self notify( "flashed" );
        self._id_38B1 = gettime() + var_9 * 1000;
        self _meth_8186( "flashbang", var_9 );
        thread _id_A5DC::aud_set_flashbang();
        self _meth_83BF( "flashed", 0.1 );
        common_scripts\utility::_id_383F( "player_flashed" );
        thread _id_A5A5::_id_9A25( var_9 );
        wait 0.1;

        if ( isdefined( level._id_0318._id_60E6 ) && level._id_0318._id_60E6 )
            level._id_0318 _meth_83BF( level.nightvisionlightset, 0.1 );
        else
            self _meth_83C0( 0.1 );

        if ( var_1 * var_2 > 0.5 )
            thread _id_38C2( var_9 );

        if ( var_9 > 2 )
            thread _id_38C5( 0.75 );
        else
            thread _id_38C5( 0.25 );

        if ( var_4 != "allies" )
            thread _id_38C3( var_9, var_4 );
    }
}

_id_38C3( var_0, var_1 )
{
    wait 0.05;
    var_2 = _func_0D9( "allies" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( _func_0F0( var_2[var_3]._id_02E2, self._id_02E2 ) < 122500 )
        {
            var_4 = var_0 + _func_0B5( -1000, 1500 );

            if ( var_4 > 4.5 )
                var_4 = 4.5;
            else if ( var_4 < 0.25 )
                continue;

            var_5 = gettime() + var_4 * 1000;

            if ( !isdefined( var_2[var_3]._id_38B1 ) || var_2[var_3]._id_38B1 < var_5 )
            {
                var_2[var_3]._id_38B6 = var_1;
                var_2[var_3] _id_38AB( var_4 );
            }
        }
    }
}

_id_748D()
{
    common_scripts\_createfx::_id_748A();
}

_id_6720( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
                var_3 common_scripts\utility::_id_671F();

            return;
        }
    }
    else
    {
        foreach ( var_6 in level._id_2417 )
        {
            if ( !isdefined( var_6._id_9C42["exploder"] ) )
                continue;

            if ( var_6._id_9C42["exploder"] != var_0 )
                continue;

            var_6 common_scripts\utility::_id_671F();
        }
    }
}

_id_748E( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
                var_3 _id_748D();

            return;
        }
    }
    else
    {
        foreach ( var_6 in level._id_2417 )
        {
            if ( !isdefined( var_6._id_9C42["exploder"] ) )
                continue;

            if ( var_6._id_9C42["exploder"] != var_0 )
                continue;

            var_6 _id_748D();
        }
    }
}

_id_3FA9( var_0 )
{
    var_1 = [];

    if ( isdefined( level._id_2415 ) )
    {
        var_2 = level._id_2415[var_0];

        if ( isdefined( var_2 ) )
            var_1 = var_2;
    }
    else
    {
        for ( var_3 = 0; var_3 < level._id_2417.size; var_3++ )
        {
            if ( level._id_2417[var_3]._id_9C42["fxid"] == var_0 )
                var_1[var_1.size] = level._id_2417[var_3];
        }
    }

    return var_1;
}

_id_4BB0( var_0 )
{
    self notify( "ignoreAllEnemies_threaded" );
    self endon( "ignoreAllEnemies_threaded" );

    if ( var_0 )
    {
        self._id_63B7 = self _meth_817C();
        var_1 = undefined;
        createthreatbiasgroup( "ignore_everybody" );
        self _meth_817B( "ignore_everybody" );
        var_2 = [];
        var_2["axis"] = "allies";
        var_2["allies"] = "axis";
        var_3 = _func_0D9( var_2[self._id_04A7] );
        var_4 = [];

        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
            var_4[var_3[var_5] _meth_817C()] = 1;

        var_6 = _func_1D3( var_4 );

        for ( var_5 = 0; var_5 < var_6.size; var_5++ )
            setthreatbias( var_6[var_5], "ignore_everybody", 0 );
    }
    else
    {
        var_1 = undefined;

        if ( self._id_63B7 != "" )
            self _meth_817B( self._id_63B7 );

        self._id_63B7 = undefined;
    }
}

_id_9CB3()
{
    _id_A5AA::_id_9D16();
}

_id_9D1F()
{
    thread _id_A5AA::_id_9D20();
}

_id_9CF5( var_0 )
{
    _id_A5AA::_id_9CF7( var_0 );
}

_id_9CFC( var_0 )
{
    _id_A5AA::_id_9CFD( var_0 );
}

_id_9CBF( var_0, var_1 )
{
    _id_A5A8::_id_9D17( var_0, var_1 );
}

_id_4417( var_0 )
{
    return _func_06B( var_0, var_0 + ( 0, 0, -100000 ), 0, self, 0, 0, 0, 0, 0, 1, 0, 1 )["position"];
}

_id_1C72( var_0 )
{
    self._id_6B4E += var_0;
    self notify( "update_health_packets" );

    if ( self._id_6B4E >= 3 )
        self._id_6B4E = 3;
}

_id_4155( var_0 )
{
    var_1 = _id_4156( var_0 );
    return var_1[0];
}

_id_4156( var_0 )
{
    return _id_A5AA::_id_05BE( var_0 );
}

_id_28B0( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_079D();

    if ( !isdefined( level._id_8B83 ) )
        level._id_8B83 = [];

    level._id_8B83[var_0] = _id_079E( var_0, var_1, var_2, var_3, [ var_4 ], var_5 );
}

player_fudge_moveto( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 200;

    var_2 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_2._id_02E2 = level._id_0318._id_02E2;
    level._id_0318 _meth_807E( var_2 );
    var_3 = _func_0EE( level._id_0318._id_02E2, var_0 );
    var_4 = var_3 / var_1;
    var_2 _meth_82AA( var_0, var_3 / var_1, 0.05, 0.05 );
    wait(var_4);
    level._id_0318 _meth_8051();
}

_id_079C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_079D();
    var_0 = _func_123( var_0 );

    if ( isdefined( var_4 ) )
    {
        if ( var_4.size > 2 )
        {
            var_6 = [];
            var_6[0] = var_4[0];
            var_6[1] = var_4[1];
            var_4 = var_6;
        }

        if ( !isdefined( level._id_8CDE ) )
            level._id_8CDE = [];

        foreach ( var_8 in var_4 )
        {
            if ( !common_scripts\utility::_id_0CE4( level._id_8CDE, var_8 ) )
                level._id_8CDE[level._id_8CDE.size] = var_8;
        }
    }

    if ( isdefined( level._id_8B83 ) && isdefined( level._id_8B83[var_0] ) )
        var_11 = level._id_8B83[var_0];
    else
        var_11 = _id_079E( var_0, var_1, var_2, var_3, var_4, var_5 );

    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( level._id_8B83 ) )
        {

        }
        else if ( !_func_120( var_0, "no_game" ) )
        {
            if ( !isdefined( level._id_8B83[var_0] ) )
                return;
        }
    }

    level._id_8BB5[level._id_8BB5.size] = var_11;
    level._id_8B34[var_0] = var_11;
}

_id_7EC4( var_0, var_1 )
{
    if ( !isdefined( level._id_8B34 ) )
        return;

    if ( !isdefined( level._id_8B34[var_0] ) )
        return;

    var_0 = _func_123( var_0 );

    if ( var_1.size > 2 )
    {
        var_2 = [];
        var_2[0] = var_1[0];
        var_2[1] = var_1[1];
        var_1 = var_2;
    }

    if ( !isdefined( level._id_8CDE ) )
        level._id_8CDE = [];

    foreach ( var_4 in var_1 )
    {
        if ( !common_scripts\utility::_id_0CE4( level._id_8CDE, var_4 ) )
            level._id_8CDE[level._id_8CDE.size] = var_4;
    }

    level._id_8B34[var_0]["transients_to_load"] = var_1;
}

_id_5056()
{
    return _func_120( level._id_8C36, "no_game" );
}

_id_079E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];
    var_6["name"] = var_0;
    var_6["start_func"] = var_1;
    var_6["start_loc_string"] = var_2;
    var_6["logic_func"] = var_3;
    var_6["transients_to_load"] = var_4;
    var_6["catchup_function"] = var_5;
    return var_6;
}

_id_079D()
{
    if ( !isdefined( level._id_8BB5 ) )
        level._id_8BB5 = [];
}

_id_56C2()
{
    return level._id_8BB5.size > 1;
}

_id_7E0C( var_0 )
{
    level._id_278C = var_0;
}

_id_278B( var_0 )
{
    level._id_278B = var_0;
}

_id_5777( var_0, var_1, var_2, var_3 )
{
    thread _id_A5A5::_id_5778( var_0, var_1, var_2, var_3 );
}

_id_A348( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_114( ( var_2[0], var_2[1], 0 ) - ( var_0[0], var_0[1], 0 ) );
    var_5 = anglestoforward( ( 0, var_1[1], 0 ) );
    return _func_0F6( var_5, var_4 ) >= var_3;
}

_id_3D46( var_0, var_1, var_2 )
{
    var_3 = _func_114( var_2 - var_0 );
    var_4 = anglestoforward( var_1 );
    var_5 = _func_0F6( var_4, var_3 );
    return var_5;
}

_id_A349( var_0, var_1 )
{
    var_2 = undefined;

    for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
    {
        var_4 = level._id_0323[var_3] _meth_80AA();
        var_2 = common_scripts\utility::_id_A347( var_4, level._id_0323[var_3] _meth_8338(), var_0, var_1 );

        if ( !var_2 )
            return 0;
    }

    return 1;
}

waitspread( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
    {
        var_1 = var_0;
        var_0 = 0;
    }

    wait(_func_0B5( var_0, var_1 ));

    if ( 1 )
        return;

    var_2 = undefined;

    if ( !isdefined( level._id_071C ) )
    {
        level._id_071C = 1;
        level._id_9FE1 = 0;
        var_2 = level._id_9FE1;
        level._id_9FE1++;
        thread _id_A5A5::_id_A05E( var_0, var_1 );
    }
    else
    {
        var_2 = level._id_9FE1;
        level._id_9FE1++;
        waitframe;
    }

    waitframe;
    wait(level._id_9FE0[var_2]);
}

_id_9F8C( var_0, var_1 )
{
    var_2 = var_1 * 1000 - ( gettime() - var_0 );
    var_2 *= 0.001;

    if ( var_2 > 0 )
        wait(var_2);
}

_id_134E()
{
    anim._id_7B40 = gettime();
}

_id_2A32( var_0 )
{
    var_1 = _func_294( var_0, "squelchname" );

    if ( self == level || var_1 != "" )
    {
        _id_70BD( var_0, undefined, var_1 );
        return;
    }

    _id_134E();
    _id_A510::_id_0C21( self, var_0 );
}

_id_3C8D( var_0, var_1 )
{
    _id_134E();
    _id_A510::_id_0BCF( self, var_0, undefined, undefined, var_1 );
}

_id_70BD( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_6BCD ) )
    {
        var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_3 _meth_804F( level._id_0318, "", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        level._id_6BCD = var_3;
    }

    _id_134E();

    if ( !isdefined( var_1 ) )
        return level._id_6BCD _id_3AF2( ::_id_70C3, var_0, var_2 );
    else
        return level._id_6BCD _id_3AF8( var_1, ::_id_70C3, var_0, var_2 );
}

_id_70C3( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    level._id_6BCF = 0;

    if ( var_1 != "none" && isdefined( level._id_78B9["squelches"][var_1] ) )
        _id_69C5( level._id_78B9["squelches"][var_1]["on"], undefined, 1 );

    var_2 = 0;

    if ( isdefined( level._id_78B9[var_0] ) )
        var_2 = _id_69C5( level._id_78B9[var_0], undefined, 1 );
    else
        var_2 = _id_69C5( var_0, undefined, 1 );

    if ( var_1 != "none" && isdefined( level._id_78B9["squelches"][var_1] ) )
        thread _id_70CC( var_1 );

    return var_2;
}

_id_70C1( var_0 )
{
    if ( !isdefined( level._id_6BCE ) )
        level._id_6BCE = [];

    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    level._id_6BCE[level._id_6BCE.size] = var_1;
    var_1 endon( "death" );
    thread _id_2826( var_1, "sounddone" );
    var_1._id_02E2 = level._id_6BCD._id_02E2;
    var_1.angles = level._id_6BCD.angles;
    var_1 _meth_804F( level._id_6BCD );
    var_1 _meth_809C( level._id_78B9[var_0], "sounddone" );

    if ( !isdefined( _id_A5A5::_id_9FBD( var_1 ) ) )
        var_1 _meth_80AE();

    wait 0.05;
    level._id_6BCE = common_scripts\utility::_id_0CF6( level._id_6BCE, var_1 );
    var_1 delete();
}

_id_70C9()
{
    if ( !isdefined( level._id_6BCD ) )
        return;

    level._id_6BCD delete();
}

_id_70C2()
{
    if ( !isdefined( level._id_6BCE ) )
        return;

    foreach ( var_1 in level._id_6BCE )
    {
        if ( isdefined( var_1 ) )
        {
            var_1 _meth_80AE();
            wait 0.05;
            var_1 delete();
        }
    }

    level._id_6BCE = undefined;
}

_id_70BE()
{
    if ( !isdefined( level._id_6BCD ) )
        return;

    level._id_6BCD _id_3AF4();
}

_id_70C7( var_0 )
{
    if ( !isdefined( level._id_6BCD ) )
        return;

    if ( !isdefined( level._id_6BCD._id_3AF2 ) )
        return;

    var_1 = [];
    var_2 = 0;
    var_3 = level._id_6BCD._id_3AF2.size;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        if ( var_4 == 0 && isdefined( level._id_6BCD._id_3AF2[0]._id_3AF5 ) && isdefined( level._id_6BCD._id_3AF2[0]._id_3AF5 ) )
        {
            var_1[var_1.size] = level._id_6BCD._id_3AF2[var_4];
            continue;
        }

        if ( isdefined( level._id_6BCD._id_3AF2[var_4]._id_6682 ) && level._id_6BCD._id_3AF2[var_4]._id_6682 == var_0 )
        {
            level._id_6BCD._id_3AF2[var_4] notify( "death" );
            level._id_6BCD._id_3AF2[var_4] = undefined;
            var_2 = 1;
            continue;
        }

        var_1[var_1.size] = level._id_6BCD._id_3AF2[var_4];
    }

    if ( var_2 )
        level._id_6BCD._id_3AF2 = var_1;
}

_id_70BF( var_0 )
{
    if ( !isdefined( level._id_6BCD ) )
    {
        var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_1 _meth_804F( level._id_0318, "", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        level._id_6BCD = var_1;
    }

    level._id_6BCD _id_69C5( level._id_78B9[var_0], undefined, 1 );
}

_id_70C8( var_0 )
{
    return _id_70BD( var_0, 0.05 );
}

_id_866C( var_0, var_1 )
{
    var_2 = _func_294( var_0, "squelchname" );
    _id_A5A5::_id_07AF( var_0 );
    _id_70BD( var_0, var_1, var_2 );
}

_id_866D( var_0 )
{
    _id_A5A5::_id_07AF( var_0 );
    _id_70C9();
    _id_70BF( var_0 );
}

_id_866F( var_0 )
{
    _id_A5A5::_id_07AF( var_0 );
    _id_70C1( var_0 );
}

_id_865D( var_0 )
{
    _id_A5A5::_id_07A9( var_0 );
    _id_2A32( var_0 );
}

_id_865E( var_0 )
{
    _id_A5A5::_id_07AA( var_0 );
    _id_3C8D( var_0 );
}

_id_70CC( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 0.1;

    level._id_6BCF = 1;
    wait(var_1);

    if ( isdefined( level._id_6BCD ) && level._id_6BCF == 1 )
        level._id_6BCD _id_3AF2( ::_id_69C5, level._id_78B9["squelches"][var_0]["off"], undefined, 1 );
}

_id_70C4( var_0, var_1 )
{
    _id_70BD( var_0, undefined, var_1 );
}

_id_48C6( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();

    if ( isdefined( var_1 ) && var_1 == 1 )
        var_3._id_141D = _func_1A9();

    var_3._id_305F = _func_1A9();
    var_3 _id_48DA( var_2 );
    var_3._id_305F _meth_80CC( var_0 );
    return var_3;
}

_id_48C9()
{
    self notify( "death" );

    if ( isdefined( self._id_305F ) )
        self._id_305F _meth_808A();

    if ( isdefined( self._id_141D ) )
        self._id_141D _meth_808A();
}

_id_48DA( var_0 )
{
    if ( level._id_2153 )
        self._id_305F._id_0189 = 2;
    else
        self._id_305F._id_0189 = 1.6;

    self._id_305F._id_0530 = 0;
    self._id_305F._id_0538 = -40;
    self._id_305F.alignx = "center";
    self._id_305F.aligny = "bottom";
    self._id_305F._id_01F3 = "center";
    self._id_305F._id_0501 = "middle";
    self._id_305F._id_03D4 = 1;
    self._id_305F.alpha = 0.8;

    if ( !isdefined( self._id_141D ) )
        return;

    self._id_141D._id_0530 = 0;
    self._id_141D._id_0538 = -40;
    self._id_141D.alignx = "center";
    self._id_141D.aligny = "middle";
    self._id_141D._id_01F3 = "center";
    self._id_141D._id_0501 = "middle";
    self._id_141D._id_03D4 = -1;

    if ( level._id_2153 )
        self._id_141D _meth_80CE( "popmenu_bg", 650, 52 );
    else
        self._id_141D _meth_80CE( "popmenu_bg", 650, 42 );

    if ( !isdefined( var_0 ) )
        var_0 = 0.5;

    self._id_141D.alpha = var_0;
}

_id_8F53( var_0 )
{
    return "" + var_0;
}

_id_5086( var_0 )
{
    var_1 = _func_0BD( var_0 );
    return _id_8F53( var_1 ) == var_0;
}

_id_4BB3( var_0, var_1 )
{
    setignoremegroup( var_0, var_1 );
    setignoremegroup( var_1, var_0 );
}

_id_0761( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5["function"] = var_1;
    var_5["param1"] = var_2;
    var_5["param2"] = var_3;
    var_5["param3"] = var_4;
    level._id_88FE[var_0][level._id_88FE[var_0].size] = var_5;
}

_id_735B( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_88FE[var_0].size; var_3++ )
    {
        if ( level._id_88FE[var_0][var_3]["function"] != var_1 )
            var_2[var_2.size] = level._id_88FE[var_0][var_3];
    }

    level._id_88FE[var_0] = var_2;
}

_id_3416( var_0, var_1 )
{
    if ( !isdefined( level._id_88FE ) )
        return 0;

    for ( var_2 = 0; var_2 < level._id_88FE[var_0].size; var_2++ )
    {
        if ( level._id_88FE[var_0][var_2]["function"] == var_1 )
            return 1;
    }

    return 0;
}

_id_7380( var_0 )
{
    var_1 = [];

    foreach ( var_3 in self._id_8900 )
    {
        if ( var_3["function"] == var_0 )
            continue;

        var_1[var_1.size] = var_3;
    }

    self._id_8900 = var_1;
}

_id_0798( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    foreach ( var_7 in self._id_8900 )
    {
        if ( var_7["function"] == var_0 )
            return;
    }

    var_9 = [];
    var_9["function"] = var_0;
    var_9["param1"] = var_1;
    var_9["param2"] = var_2;
    var_9["param3"] = var_3;
    var_9["param4"] = var_4;
    var_9["param5"] = var_5;
    self._id_8900[self._id_8900.size] = var_9;
}

_id_0CE5( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] delete();
}

_id_0CEE( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_8054();
}

_id_4BAC( var_0 )
{
    self endon( "death" );
    self._id_0202 = 1;

    if ( isdefined( var_0 ) )
        wait(var_0);
    else
        wait 0.5;

    self._id_0202 = 0;
}

_id_070A( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 _id_0706();
}

_id_0709( var_0 )
{
    var_1 = getent( var_0, "script_noteworthy" );
    var_1 _id_0706();
}

_id_2AE8( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 common_scripts\utility::_id_97CC();
}

_id_2AE7( var_0 )
{
    var_1 = getent( var_0, "script_noteworthy" );
    var_1 common_scripts\utility::_id_97CC();
}

_id_3101( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 common_scripts\utility::_id_97CE();
}

_id_3100( var_0 )
{
    var_1 = getent( var_0, "script_noteworthy" );
    var_1 common_scripts\utility::_id_97CE();
}

_id_5036()
{
    return isdefined( level._id_483A[_id_3CB7()] );
}

_id_3CB7()
{
    if ( !isdefined( self._id_9A29 ) )
        _id_7DB5();

    return self._id_9A29;
}

_id_7DB5()
{
    self._id_9A29 = "ai" + level._id_0908;
    self._id_0908 = level._id_0908;
    level._id_0908++;
}

_id_5926()
{
    level._id_483A[self._id_9A29] = 1;
}

_id_9A4B()
{
    level._id_483A[self._id_9A29] = undefined;
}

_id_3D94()
{
    var_0 = [];
    var_1 = _func_0D9( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _id_5036() )
            var_0[var_0.size] = var_1[var_2];
    }

    return var_0;
}

_id_7ED3( var_0, var_1 )
{
    var_2 = _func_0D9( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3]._id_02E6 = var_1;
}

_id_733F( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !_func_1A1( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_735E( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] _id_5036() )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

remove_all_animnamed_guys_from_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_0C72 ) )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

_id_7339( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];

        if ( !isdefined( var_4._id_79E6 ) )
            continue;

        if ( var_4._id_79E6 == var_1 )
            continue;

        var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_7372( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];

        if ( !isdefined( var_4._id_0398 ) )
            continue;

        if ( var_4._id_0398 == var_1 )
            continue;

        var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_3CF4( var_0, var_1 )
{
    var_2 = _id_3D7A( "allies", var_0 );
    var_2 = _id_735E( var_2 );

    if ( !isdefined( var_1 ) )
        var_3 = level._id_0318._id_02E2;
    else
        var_3 = var_1;

    return common_scripts\utility::_id_3F33( var_3, var_2 );
}

_id_738F( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !_func_120( var_0[var_3].classname, var_1 ) )
            continue;

        var_2[var_2.size] = var_0[var_3];
    }

    return var_2;
}

_id_7390( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !_func_120( var_0[var_3]._id_029C, var_1 ) )
            continue;

        var_2[var_2.size] = var_0[var_3];
    }

    return var_2;
}

_id_3CF5( var_0, var_1, var_2 )
{
    var_3 = _id_3D7A( "allies", var_0 );
    var_3 = _id_735E( var_3 );

    if ( !isdefined( var_2 ) )
        var_4 = level._id_0318._id_02E2;
    else
        var_4 = var_2;

    var_3 = _id_738F( var_3, var_1 );
    return common_scripts\utility::_id_3F33( var_4, var_3 );
}

_id_7016( var_0, var_1 )
{
    for (;;)
    {
        var_2 = _id_3CF4( var_0 );

        if ( !_func_1A1( var_2 ) )
        {
            wait 1;
            continue;
        }

        var_2 _id_7E38( var_1 );
        return;
    }
}

_id_4E8A( var_0, var_1 )
{
    for (;;)
    {
        var_2 = _id_3CF4( var_0 );

        if ( !_func_1A1( var_2 ) )
            return;

        var_2 _id_7E38( var_1 );
        return;
    }
}

_id_4E8B( var_0, var_1, var_2 )
{
    for (;;)
    {
        var_3 = _id_3CF5( var_0, var_2 );

        if ( !_func_1A1( var_3 ) )
            return;

        var_3 _id_7E38( var_1 );
        return;
    }
}

_id_7017( var_0, var_1, var_2 )
{
    for (;;)
    {
        var_3 = _id_3CF5( var_0, var_2 );

        if ( !_func_1A1( var_3 ) )
        {
            wait 1;
            continue;
        }

        var_3 _id_7E38( var_1 );
        return;
    }
}

_id_7540( var_0 )
{
    self _meth_8193( "face angle", var_0 );
    self._id_0254 = 1;
}

_id_7549()
{
    self._id_0254 = 0;
}

_id_4E8D( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = [];

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( var_3 || !_func_120( var_6.classname, var_2 ) )
        {
            var_4[var_4.size] = var_6;
            continue;
        }

        var_3 = 1;
        var_6 _id_7E38( var_1 );
    }

    return var_4;
}

_id_4E8C( var_0, var_1 )
{
    var_2 = 0;
    var_3 = [];

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( var_2 )
        {
            var_3[var_3.size] = var_5;
            continue;
        }

        var_2 = 1;
        var_5 _id_7E38( var_1 );
    }

    return var_3;
}

_id_9FBB( var_0 )
{
    _id_A5A5::_id_9FC3( var_0, "script_noteworthy" );
}

_id_9FC0( var_0 )
{
    _id_A5A5::_id_9FC3( var_0, "targetname" );
}

_id_9FA1( var_0, var_1 )
{
    if ( common_scripts\utility::_id_382E( var_0 ) )
        return;

    level endon( var_0 );
    wait(var_1);
}

_id_9FB3( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
}

_id_9FC8( var_0 )
{
    self endon( "trigger" );
    wait(var_0);
}

_id_9F94( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_3 = [];
    var_3 = common_scripts\utility::_id_0CDD( var_3, getentarray( var_0, "targetname" ) );
    var_3 = common_scripts\utility::_id_0CDD( var_3, getentarray( var_1, "targetname" ) );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_2 thread _id_A5A5::_id_32EE( var_3[var_4] );

    var_2 waittill( "done" );
}

_id_2F2A( var_0 )
{
    var_1 = _id_A581::_id_89C1( var_0 );
    return var_1;
}

_id_2F29( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_2 = _id_A581::_id_89C1( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        var_2 [[ level._id_2EC0 ]]();

    var_2._id_88FE = var_0._id_8900;
    var_2 thread _id_A581::_id_76B6();
    var_2._id_03D9 = var_0;
    return var_2;
}

_id_9002( var_0 )
{
    return _id_A581::_id_89C8( var_0 );
}

_id_9007( var_0 )
{
    return _id_A581::_id_89C9( var_0 );
}

_id_3EA3()
{
    if ( isdefined( self._id_79D3 ) )
        return self._id_79D3;

    if ( isdefined( self._id_0398 ) )
        return self._id_0398;
}

_id_7E0B()
{
    self._id_02F7 = 350;
    self._id_02F6 = 350;
}

_id_22DA( var_0 )
{
    if ( var_0 == "on" )
        _id_30B0();
    else
        _id_2A8D();
}

_id_30B0( var_0 )
{
    if ( self._id_04D9 == "dog" )
        return;

    if ( !isdefined( var_0 ) )
        self._id_22DD = 1;

    self._id_22E0 = 1;
    self._id_04CB = 0.2;
    level thread animscripts\cqb::_id_377E();
}

_id_2A8D()
{
    if ( self._id_04D9 == "dog" )
        return;

    if ( isdefined( self._id_22DD ) )
        self.cqbdisabledtime = gettime();

    self._id_22E0 = undefined;
    self._id_22DD = undefined;
    self._id_04CB = 0.3;
    self._id_22D6 = undefined;
}

_id_30EB()
{
    self._id_1944 = 1;
}

_id_2ACB()
{
    self._id_1944 = undefined;
}

_id_22CF( var_0 )
{
    if ( !isdefined( var_0 ) )
        self._id_22D8 = undefined;
    else
    {
        self._id_22D8 = var_0;

        if ( !isdefined( var_0._id_02E2 ) )
            return;
    }
}

_id_7E3A( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
        self._id_39CD = 1;
    else
        self._id_39CD = undefined;
}

_id_2BC3( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
        [[ var_0 ]]( var_1 );
    else
        [[ var_0 ]]();

    if ( isdefined( var_3 ) )
        [[ var_2 ]]( var_3 );
    else
        [[ var_2 ]]();
}

scrub()
{
    _id_A581::_id_7B48();
}

_id_7C82( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        self notify( var_0, var_1 );
    else
        self notify( var_0 );
}

_id_A098( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3 endon( "complete" );
    var_3 _id_27EF( var_2, ::_id_7C82, "complete" );
    self waittillmatch( var_0, var_1 );
}

_id_284E( var_0 )
{
    var_0 notify( "deleted" );
    var_0 delete();
}

_id_3815( var_0 )
{
    if ( !isdefined( self._id_9405 ) )
        self._id_9405 = [];

    if ( isdefined( self._id_9405[var_0._id_9A29] ) )
        return 0;

    self._id_9405[var_0._id_9A29] = 1;
    return 1;
}

_id_3EF5( var_0 )
{
    return level._id_78AC[self._id_0C72][var_0];
}

_id_4718( var_0 )
{
    return isdefined( level._id_78AC[self._id_0C72][var_0] );
}

_id_3EF6( var_0, var_1 )
{
    return level._id_78AC[var_1][var_0];
}

_id_3EF7( var_0 )
{
    return level._id_78AC["generic"][var_0];
}

_id_0764( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_97A8 ) )
    {
        level._id_97A8 = [];
        level._id_97A7 = [];
        level.trigger_hint_doubleline = [];
    }

    if ( isdefined( level._id_97A8[var_0] ) )
    {

    }

    level._id_97A8[var_0] = var_1;
    precachestring( var_1 );

    if ( isdefined( var_2 ) )
        level._id_97A7[var_0] = var_2;

    if ( isdefined( var_3 ) )
        level.trigger_hint_doubleline[var_0] = var_3;
}

_id_84DB( var_0 )
{
    thread _id_A5A5::_id_8514( var_0 );
}

_id_4857( var_0 )
{
    var_0._id_936B = 1;
}

_id_37C1( var_0, var_1 )
{
    var_2 = spawn( "trigger_radius", var_0, 0, var_1, 48 );

    for (;;)
    {
        var_2 waittill( "trigger", var_3 );
        level._id_0318 _meth_8053( 5, var_0 );
    }
}

_id_1F0B( var_0, var_1 )
{
    setthreatbias( var_0, var_1, 0 );
    setthreatbias( var_1, var_0, 0 );
}

_id_933B()
{
    animscripts\combat_utility::_id_933C();
}

_id_0CDF( var_0, var_1 )
{
    if ( !var_0.size )
        return var_1;

    var_2 = _func_1D3( var_1 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_0[var_2[var_3]] = var_1[var_2[var_3]];

    return var_0;
}

_id_7E60( var_0 )
{
    self._id_0201 = var_0;
}

_id_7E50( var_0 )
{
    self._id_01C4 = var_0;
}

_id_988B()
{
    var_0 = self._id_3584;

    for (;;)
    {
        var_1 = self _meth_8095();

        if ( _id_88F1( var_1 ) )
        {
            wait 1;
            continue;
        }

        return var_1;
    }
}

_id_7DB8( var_0 )
{
    self.allowdeath = var_0;
}

_id_7EAB( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        self._id_0B0D = var_1;
    else
        self._id_0B0D = 1;

    if ( !isdefined( var_2 ) || var_2 )
        _id_2AEA();

    self._id_76AF = level._id_78AC[self._id_0C72][var_0];
    self._id_A108 = self._id_76AF;
}

_id_7E15()
{
    self.a._id_5F5B = "walk";
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self._id_7A79 = 1;
}

_id_7DF0( var_0, var_1, var_2, var_3 )
{
    animscripts\animset::_id_4C85( var_0, var_1, var_2, var_3 );
}

_id_7E80( var_0, var_1, var_2 )
{
    var_3 = animscripts\utility::_id_5864( var_0 );

    if ( _func_0CE( var_1 ) )
    {
        var_3["straight"] = var_1[0];
        var_3["move_f"] = var_1[0];
        var_3["move_l"] = var_1[1];
        var_3["move_r"] = var_1[2];
        var_3["move_b"] = var_1[3];
    }
    else
    {
        var_3["straight"] = var_1;
        var_3["move_f"] = var_1;
    }

    if ( isdefined( var_2 ) )
        var_3["sprint"] = var_2;

    self._id_2563[var_0] = var_3;
}

_id_7E44( var_0 )
{
    var_1 = level._id_78AC["generic"][var_0];

    if ( _func_0CE( var_1 ) )
        self._id_8A2F = var_1;
    else
        self._id_8A2F[0] = var_1;
}

_id_7E5C( var_0 )
{
    var_1 = level._id_78AC[self._id_0C72][var_0];

    if ( _func_0CE( var_1 ) )
        self._id_8A2F = var_1;
    else
        self._id_8A2F[0] = var_1;
}

_id_1EBA()
{
    self._id_8A2F = undefined;
    self notify( "stop_specialidle" );
}

_id_7E45( var_0, var_1, var_2 )
{
    _id_7E46( var_0, undefined, var_1, var_2 );
}

_id_1EBB()
{
    self notify( "movemode" );
    _id_3102();
    self._id_76AF = undefined;
    self._id_A108 = undefined;
}

_id_7E46( var_0, var_1, var_2, var_3 )
{
    self notify( "movemode" );

    if ( !isdefined( var_2 ) || var_2 )
        self._id_0B0D = 1;
    else
        self._id_0B0D = undefined;

    if ( !isdefined( var_3 ) || var_3 )
        _id_2AEA();

    self._id_76AF = level._id_78AC["generic"][var_0];
    self._id_A108 = self._id_76AF;

    if ( isdefined( var_1 ) )
    {
        self._id_76AE = level._id_78AC["generic"][var_1];
        self._id_A107 = self._id_76AE;
    }
    else
    {
        self._id_76AE = undefined;
        self._id_A107 = undefined;
    }
}

_id_7EAC( var_0, var_1, var_2, var_3 )
{
    self notify( "movemode" );

    if ( !isdefined( var_2 ) || var_2 )
        self._id_0B0D = 1;
    else
        self._id_0B0D = undefined;

    if ( !isdefined( var_3 ) || var_3 )
        _id_2AEA();

    self._id_76AF = level._id_78AC[self._id_0C72][var_0];
    self._id_A108 = self._id_76AF;

    if ( isdefined( var_1 ) )
    {
        self._id_76AE = level._id_78AC[self._id_0C72][var_1];
        self._id_A107 = self._id_76AE;
    }
    else
    {
        self._id_76AE = undefined;
        self._id_A107 = undefined;
    }
}

_id_1ED1()
{
    self notify( "clear_run_anim" );
    self notify( "movemode" );

    if ( self._id_04D9 == "dog" )
    {
        self.a._id_5F5B = "run";
        self._id_2AF3 = 0;
        self._id_2B0E = 0;
        self._id_7A79 = undefined;
        return;
    }

    if ( !isdefined( self._id_1BC4 ) )
        _id_3102();

    self._id_0B0D = undefined;
    self._id_76AF = undefined;
    self._id_A108 = undefined;
    self._id_76AE = undefined;
    self._id_A107 = undefined;
}

_id_273B( var_0, var_1 )
{
    setdvarifuninitialized( var_0, var_1 );
    return getdvarfloat( var_0 );
}

_id_6802( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "stop_physicsjolt" );

    if ( !isdefined( var_0 ) || !isdefined( var_1 ) || !isdefined( var_2 ) )
    {
        var_0 = 400;
        var_1 = 256;
        var_2 = ( 0, 0, 0.075 );
    }

    var_3 = var_0 * var_0;
    var_4 = 3;
    var_5 = var_2;

    for (;;)
    {
        wait 0.1;
        var_2 = var_5;

        if ( self.code_classname == "script_vehicle" )
        {
            var_6 = self _meth_8282();

            if ( var_6 < var_4 )
            {
                var_7 = var_6 / var_4;
                var_2 = var_5 * var_7;
            }
        }

        var_8 = _func_0F0( self._id_02E2, level._id_0318._id_02E2 );
        var_7 = var_3 / var_8;

        if ( var_7 > 1 )
            var_7 = 1;

        var_2 *= var_7;
        var_9 = var_2[0] + var_2[1] + var_2[2];

        if ( var_9 > 0.025 )
            _func_181( self._id_02E2, var_0, var_1, var_2[2], var_2[2] * 2.0 );
    }
}

_id_7E48( var_0 )
{
    self _meth_81AB( var_0 );
}

_id_0706( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        _id_0707( var_2 );
    else
        common_scripts\utility::_id_0D13( getentarray( var_0, var_1 ), ::_id_0707, var_2 );
}

_id_0707( var_0 )
{
    if ( isdefined( self._id_7975 ) )
    {
        self.activated_color_trigger = 1;
        _id_A51C::activate_color_trigger( "allies" );
    }

    if ( isdefined( self._id_7976 ) )
    {
        self.activated_color_trigger = 1;
        _id_A51C::activate_color_trigger( "axis" );
    }

    self notify( "trigger", var_0 );
}

_id_7C71()
{
    self delete();
}

_id_736F( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( var_3 _id_46E8() )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_1EA7()
{
    _id_1EDA( "axis" );
    _id_1EDA( "allies" );
}

_id_1EDA( var_0 )
{
    level._id_250D[var_0]["r"] = undefined;
    level._id_250D[var_0]["b"] = undefined;
    level._id_250D[var_0]["c"] = undefined;
    level._id_250D[var_0]["y"] = undefined;
    level._id_250D[var_0]["p"] = undefined;
    level._id_250D[var_0]["o"] = undefined;
    level._id_250D[var_0]["g"] = undefined;
    level._id_250D[var_0]["w"] = undefined;
    level._id_250D[var_0]["a"] = undefined;
    level._id_250D[var_0]["l"] = undefined;
}

_id_3E5A()
{
    var_0 = [];
    var_0["r"] = ( 1, 0, 0 );
    var_0["o"] = ( 1, 0.5, 0 );
    var_0["y"] = ( 1, 1, 0 );
    var_0["g"] = ( 0, 1, 0 );
    var_0["c"] = ( 0, 1, 1 );
    var_0["b"] = ( 0, 0, 1 );
    var_0["p"] = ( 1, 0, 1 );
    var_0["w"] = ( 1, 1, 1 );
    var_0["a"] = ( 0, 0.9, 1 );
    var_0["l"] = ( 0.8, 1, 0 );
    return var_0;
}

_id_61FD( var_0, var_1 )
{
    self endon( "death" );

    if ( var_1 > 0 )
        wait(var_1);

    if ( !isdefined( self ) )
        return;

    self notify( var_0 );
}

_id_4462()
{
    if ( _func_0CF( self ) )
        animscripts\shared::_id_6869( self._id_0513, "none" );
    else
    {
        _id_2975( self._id_0513 );
        self _meth_802A( _func_043( self._id_0513 ), "tag_weapon_right" );
    }
}

_id_4461()
{
    if ( _func_0CF( self ) )
        animscripts\shared::_id_6869( self._id_0513, "right" );
    else
    {
        self _meth_801D( _func_043( self._id_0513 ), "tag_weapon_right" );
        _id_9AEE( self._id_0513 );
    }
}

_id_9AEE( var_0 )
{
    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        var_1 = _func_2BC( var_0 );
        var_2 = _id_0CFA( var_1, 0 );

        foreach ( var_4 in var_2 )
            self _meth_801D( var_4["worldModel"], var_4["attachTag"] );

        self _meth_8500( var_0 );
    }
}

_id_2975( var_0 )
{
    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        var_1 = _func_2BC( var_0 );
        var_2 = _id_0CFA( var_1, 0 );

        foreach ( var_4 in var_2 )
            self _meth_802A( var_4["worldModel"], var_4["attachTag"], 0 );
    }
}

_id_0DEC( var_0 )
{
    var_1 = level._id_0318 _meth_830E();
    var_2 = _func_2BC( var_1 );
    var_3 = var_2[0]["weapon"];
    var_4 = _id_0CFA( var_2, 0 );
    var_0 _meth_801D( var_3, "TAG_WEAPON_RIGHT", 1 );

    foreach ( var_6 in var_4 )
        var_0 _meth_801D( var_6["attachment"], var_6["attachTag"] );

    var_0 _meth_8500( var_1 );
}

_id_685D( var_0, var_1 )
{
    if ( !animscripts\utility::_id_095B( var_0 ) )
        animscripts\init::_id_4E32( var_0 );

    animscripts\shared::_id_6869( var_0, var_1 );
}

_id_39D0( var_0, var_1 )
{
    if ( !animscripts\init::_id_5208( var_0 ) )
        animscripts\init::_id_4E32( var_0 );

    var_2 = self._id_0513 != "none";
    var_3 = animscripts\utility::_id_9C3A();
    var_4 = var_1 == "sidearm";
    var_5 = var_1 == "secondary";

    if ( var_2 && var_3 != var_4 )
    {
        if ( var_3 )
            var_6 = "none";
        else if ( var_5 )
            var_6 = "back";
        else
            var_6 = "chest";

        animscripts\shared::_id_6869( self._id_0513, var_6 );
        self._id_560F = self._id_0513;
    }
    else
        self._id_560F = var_0;

    animscripts\shared::_id_6869( var_0, "right" );

    if ( var_4 )
        self._id_855D = var_0;
    else if ( var_5 )
        self._id_03B3 = var_0;
    else
        self._id_0340 = var_0;

    self._id_0513 = var_0;
    self._id_18B0 = _func_1B1( self._id_0513 );
    self notify( "weapon_switch_done" );
}

_id_5696( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    _id_A5A5::_id_5698( level._id_0318, var_0, var_1, var_2, var_3, var_4, var_5, var_6, 0 );
}

lerp_player_view_to_tag_smoothly( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    _id_A5A5::lerp_player_view_to_tag_smoothly_internal( level._id_0318, var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

lerp_player_view_to_tag_preh1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _id_A5A5::_id_5698( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, 0 );
}

_id_5697( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _id_A5A5::_id_5698( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, 1 );
}

_id_5693( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_9 = _id_3E25();
    var_10 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_10._id_02E2 = var_9._id_02E2;
    var_10.angles = var_9 _meth_8338();

    if ( isdefined( var_8 ) && var_8 )
        var_9 _meth_807E( var_10, "", var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_4 ) )
        var_9 _meth_807E( var_10, "", var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_3 ) )
        var_9 _meth_807E( var_10, "", var_3 );
    else
        var_9 _meth_807E( var_10 );

    var_10 _meth_82AA( var_0, var_2, var_2 * 0.25 );
    var_10 _meth_82B1( var_1, var_2, var_2 * 0.25 );
    wait(var_2);
    var_10 delete();
}

_id_5699( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _id_A5A5::_id_569A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, 0 );
}

_id_5695( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = _id_3E25();
    var_10 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_10._id_02E2 = var_9 _id_3E24();
    var_10.angles = var_9 _meth_8338();

    if ( isdefined( var_8 ) )
        var_9 _meth_807F( var_10, "", var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_4 ) )
        var_9 _meth_807F( var_10, "", var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_3 ) )
        var_9 _meth_807F( var_10, "", var_3 );
    else
        var_9 _meth_807F( var_10 );

    var_10 _meth_82AA( var_0, var_2, var_2 * 0.25 );
    var_10 _meth_82B1( var_1, var_2, var_2 * 0.25 );
    wait(var_2);
    var_10 delete();
}

lerp_player_view_to_position_leave_linked( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = _id_3E25();
    var_9 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_9._id_02E2 = level._id_0318 _id_3E24();
    var_9.angles = var_8 _meth_8338();

    if ( isdefined( var_4 ) )
        var_8 _meth_807F( var_9, "", var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_3 ) )
        var_8 _meth_807F( var_9, "", var_3 );
    else
        var_8 _meth_807F( var_9 );

    var_9 _meth_82AA( var_0, var_2, var_2 * 0.25 );
    var_9 _meth_82B1( var_1, var_2, var_2 * 0.25 );
    wait(var_2);
    return var_9;
}

_id_9373( var_0 )
{
    wait(var_0);
}

_id_6BA7( var_0 )
{
    var_1 = level._id_0318._id_02E2;

    for (;;)
    {
        if ( _func_0EE( var_1, level._id_0318._id_02E2 ) > var_0 )
            break;

        wait 0.05;
    }
}

_id_A089( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    thread _id_A5A5::_id_A08A( var_4, var_0, var_1 );
    thread _id_A5A5::_id_A08A( var_4, var_2, var_3 );
    var_4 waittill( "done" );
}

_id_A099( var_0 )
{
    self waittill( var_0 );
}

_id_2B4A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_3E25();

    if ( isdefined( level._id_97A7[var_0] ) )
    {
        if ( var_5 [[ level._id_97A7[var_0] ]]() )
            return;

        var_5 thread _id_A5A5::_id_490D( level._id_97A8[var_0], level._id_97A7[var_0], var_1, var_2, var_3, undefined, undefined, var_4, level.trigger_hint_doubleline[var_0] );
    }
    else
        var_5 thread _id_A5A5::_id_490D( level._id_97A8[var_0], undefined, undefined, undefined, undefined, undefined, undefined, var_4, level.trigger_hint_doubleline[var_0] );
}

_id_48F9( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_A5A5::_id_48FA( var_0 );

    if ( !isdefined( var_1 ) )
        _id_2B4A( var_0, var_2, var_3, var_4, var_5 );
    else
        _id_2B4F( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_48FC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3E25();

    if ( var_6 [[ level._id_97A7[var_0] ]]() )
        return;

    _id_A5A5::_id_48FA( var_0 );
    var_6 thread _id_A5A5::_id_490D( level._id_97A8[var_0], level._id_97A7[var_0], var_3, var_4, var_5, var_1, var_2, undefined, level.trigger_hint_doubleline[var_0] );
}

_id_0746( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_97A8 ) )
    {
        level._id_97A8 = [];
        level._id_97A7 = [];
    }

    level._id_97A8[var_0] = var_1;
    level._id_48D2[var_0]["gamepad"] = var_1;
    level._id_48D2[var_0]["pc"] = var_3;
    level._id_48D2[var_0]["southpaw"] = var_4;
    precachestring( var_1 );

    if ( isdefined( var_3 ) )
        precachestring( var_3 );

    if ( isdefined( var_4 ) )
        precachestring( var_4 );

    if ( isdefined( var_2 ) )
        level._id_97A7[var_0] = var_2;
}

_id_4689()
{
    if ( !isdefined( level._id_48EB ) )
        level._id_48EB = [];

    for (;;)
    {
        level._id_48EB = common_scripts\utility::_id_0D01( level._id_48EB );

        if ( isdefined( level._id_48EB ) && isdefined( level._id_0318 ) )
        {
            foreach ( var_1 in level._id_48EB )
            {
                if ( level._id_0318 common_scripts\utility::_id_5064() )
                {
                    var_1 _meth_80DD( var_1._id_42E0 );
                    continue;
                }

                var_1 _meth_80DD( var_1._id_673B );
            }
        }

        wait 0.1;
    }
}

_id_07E4( var_0, var_1 )
{
    if ( !isdefined( level._id_48EB ) )
    {
        thread _id_4689();
        level._id_48EB = [];
    }

    var_2 = 0;

    foreach ( var_4 in level._id_48EB )
    {
        if ( self == var_4 )
        {
            var_4._id_42E0 = var_0;
            var_4._id_673B = var_1;
            var_2 = 1;
            break;
        }
    }

    if ( !var_2 )
    {
        self._id_42E0 = var_0;
        self._id_673B = var_1;
        level._id_48EB = common_scripts\utility::_id_0CDA( level._id_48EB, self );
    }
}

_id_2B4F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3E25();

    if ( var_6 [[ level._id_97A7[var_0] ]]() )
        return;

    var_6 thread _id_A5A5::_id_490D( level._id_97A8[var_0], level._id_97A7[var_0], var_2, var_3, var_4, var_1, undefined, var_5, level.trigger_hint_doubleline[var_0] );
}

_id_2B50( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3E25();

    if ( var_6 [[ level._id_97A7[var_0] ]]() )
        return;

    var_6 thread _id_A5A5::_id_490D( level._id_97A8[var_0], level._id_97A7[var_0], var_3, var_4, var_5, var_1, var_2, undefined, level.trigger_hint_doubleline[var_0] );
}

_id_2B4C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_10 = _id_A5A5::_id_48E2( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    thread _id_2B4A( var_10, var_7, var_8, var_9 );
    thread _id_A5A5::_id_48E3( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_2B4D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_7 ) )
        var_7 = 0;

    var_11 = _id_A5A5::_id_48E2( var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
    thread _id_2B4F( var_11, var_1, var_8, var_9, var_10 );
    thread _id_A5A5::_id_48E3( var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_2B4E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( var_8 ) )
        var_8 = 0;

    var_12 = _id_A5A5::_id_48E2( var_0, var_3, var_4, var_5, var_6, var_7, var_8 );
    thread _id_2B50( var_12, var_1, var_2, var_9, var_10, var_11 );
    thread _id_A5A5::_id_48E3( var_0, var_3, var_4, var_5, var_6, var_7, var_8 );
}

_id_1CC6( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        return [[ level._id_97A7[var_0] ]]( var_1, var_2, var_3 );

    if ( isdefined( var_2 ) )
        return [[ level._id_97A7[var_0] ]]( var_1, var_2 );

    if ( isdefined( var_1 ) )
        return [[ level._id_97A7[var_0] ]]( var_1 );

    return [[ level._id_97A7[var_0] ]]();
}

_id_3FAC( var_0 )
{
    return level._id_78AC["generic"][var_0];
}

_id_30AA()
{
    self._id_796C = 1;
}

_id_2A86()
{
    self._id_796C = 0;
    self notify( "stop_being_careful" );
}

_id_30F1()
{
    self._id_8AA8 = 1;
}

_id_2AD2()
{
    self._id_8AA8 = undefined;
}

_id_2A85()
{
    self._id_2AF7 = 1;
}

_id_30A9()
{
    self._id_2AF7 = undefined;
}

_id_1EB2( var_0 )
{
    setdvar( var_0, "" );
}

_id_7E24()
{
    self._id_017D = 1;
}

_id_7E23()
{
    self._id_017D = 0;
}

_id_88C3( var_0, var_1 )
{
    if ( isdefined( self._id_7990 ) )
    {
        self endon( "death" );
        wait(self._id_7990);
    }

    var_2 = undefined;
    var_3 = isdefined( self._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );

    if ( isdefined( self._id_79EB ) || isdefined( var_0 ) )
    {
        if ( !isdefined( self._id_79AD ) )
            var_2 = self _meth_8096( var_3 );
        else
            var_2 = _id_2F29( self );
    }
    else if ( !isdefined( self._id_79AD ) )
        var_2 = self _meth_8095( var_3 );
    else
        var_2 = _id_2F29( self );

    if ( isdefined( var_1 ) && var_1 && _func_1A1( var_2 ) )
        var_2 _id_58D7();

    if ( !isdefined( self._id_79AD ) )
        _id_88F1( var_2 );

    if ( isdefined( self._id_7ACD ) )
        self delete();

    if ( isdefined( var_2 ) )
        var_2._id_03D9 = self;

    if ( isdefined( var_2 ) && !isdefined( var_2._id_04A6 ) )
    {
        if ( isdefined( self._id_04A6 ) )
            var_2._id_04A6 = self._id_04A6 + "_AI";
    }

    return var_2;
}

_id_3AF2( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6 thread _id_A5A5::_id_3AF6( self, var_0, var_1, var_2, var_3, var_4, var_5 );
    return _id_A5A5::_id_3AFA( var_6 );
}

_id_3AF8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawnstruct();
    var_7 thread _id_A5A5::_id_3AF6( self, var_1, var_2, var_3, var_4, var_5, var_6 );

    if ( isdefined( var_7._id_3AF5 ) || var_7 common_scripts\utility::_id_A073( var_0, "function_stack_func_begun" ) != "timeout" )
        return _id_A5A5::_id_3AFA( var_7 );
    else
    {
        var_7 notify( "death" );
        return 0;
    }
}

_id_3AF4()
{
    var_0 = [];

    if ( isdefined( self._id_3AF2[0] ) && isdefined( self._id_3AF2[0]._id_3AF5 ) )
        var_0[0] = self._id_3AF2[0];

    self._id_3AF2 = undefined;
    self notify( "clear_function_stack" );
    waitframe;

    if ( !var_0.size )
        return;

    if ( !var_0[0]._id_3AF5 )
        return;

    self._id_3AF2 = var_0;
}

_id_3CAD()
{
    if ( isdefined( self._id_3CAD ) )
        return;

    self._id_71E9 = self _meth_8097();
    self _meth_82AA( self._id_71E9 + ( 0, 0, -10000 ), 0.2 );
    self._id_3CAD = 1;
}

_id_3CAE()
{
    if ( !isdefined( self._id_3CAD ) )
        return;

    self _meth_82AA( self._id_71E9, 0.2 );
    self waittill( "movedone" );
    self._id_3CAD = undefined;
}

_id_2A9D()
{
    self._id_2B0E = 1;
}

_id_30BD()
{
    self._id_2B0E = undefined;
}

_id_2AEA()
{
    self._id_623F = 1;
}

_id_3102()
{
    self._id_623F = undefined;
}

_id_2A7A()
{
    self._id_2AF3 = 1;
}

_id_30A1()
{
    self endon( "death" );
    waitframe;
    self._id_2AF3 = undefined;
}

_id_7DE2( var_0, var_1 )
{
    _func_074( var_0, var_1 );
}

_id_7E4E( var_0 )
{
    self._id_01C4 = var_0;
}

_id_7E4B( var_0 )
{
    self._id_5558 = var_0;
    self._id_5559 = undefined;
    self._id_5557 = undefined;
    self _meth_81A9( var_0 );
}

_id_7E4C( var_0 )
{
    var_1 = _func_0C3( var_0, "targetname" );
    _id_7E4B( var_1 );
}

_id_7E4D( var_0 )
{
    self._id_5558 = undefined;
    self._id_5559 = var_0;
    self._id_5557 = undefined;
    self _meth_81AA( var_0 );
}

_id_7E47( var_0 )
{
    _id_7E4D( var_0._id_02E2 );
    self._id_5557 = var_0;
}

_id_62EC( var_0 )
{
    _id_A5A5::_id_62F4( var_0 );
    objective_state( var_0, "done" );
    level notify( "objective_complete" + var_0 );
}

_id_4697( var_0, var_1, var_2, var_3 )
{
    var_4 = 1;

    if ( isdefined( var_1 ) )
        var_4 = !var_1;

    if ( isdefined( var_2 ) )
        level endon( var_2 );

    if ( isdefined( var_3 ) )
        level waittill( var_3 );

    var_5 = "signal_" + var_0;

    if ( var_4 )
        self _meth_814F( _id_3FAC( var_5 ), 1, 0, 1.1 );
    else
        _id_A510::_id_0BC9( self, var_5 );
}

_id_0D08( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        var_5.count = 1;

        if ( _func_122( var_5.classname, 7, 10 ) == "veh" )
        {
            var_6 = var_5 _id_8975();

            if ( isdefined( var_6._id_04A4 ) && !isdefined( var_6._id_7A40 ) )
                var_6 thread _id_A5A8::_id_427A();

            var_3[var_3.size] = var_6;
            continue;
        }

        var_6 = var_5 _id_88C3( var_1 );

        if ( !var_2 )
        {

        }

        var_3[var_3.size] = var_6;
    }

    if ( !var_2 )
    {

    }

    return var_3;
}

_id_0D0A( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_4 = [];

    foreach ( var_6 in var_0 )
    {
        var_6.count = 1;

        if ( _func_122( var_6.classname, 7, 10 ) == "veh" )
        {
            var_7 = var_6 _id_8975();

            if ( isdefined( var_7._id_04A4 ) && !isdefined( var_7._id_7A40 ) )
                var_7 thread _id_A5A8::_id_427A();

            var_4[var_4.size] = var_7;
            continue;
        }

        var_7 = var_6 _id_88C3( 1 );
        var_4 = common_scripts\utility::_id_0CDA( var_4, var_7 );

        if ( isdefined( var_3 ) )
        {
            wait(var_3);
            continue;
        }

        waittillframeend;
    }

    if ( !var_2 )
    {

    }

    return var_4;
}

_id_0D0F( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( var_0, "targetname" );

    if ( isdefined( level._id_893E ) )
    {
        var_5 = common_scripts\utility::_id_40FD( var_0, "targetname" );

        if ( isdefined( var_3 ) && var_3 )
            _id_286F( var_5 );

        var_6 = _id_A581::_id_3E35( var_5 );
        var_4 = common_scripts\utility::_id_0CDD( var_4, var_6 );
    }

    return _id_0D08( var_4, var_1, var_2 );
}

_id_0D11( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = getentarray( var_0, "targetname" );

    if ( isdefined( level._id_893E ) )
    {
        var_6 = common_scripts\utility::_id_40FD( var_0, "targetname" );

        if ( isdefined( var_4 ) && var_4 )
            _id_286F( var_6 );

        var_7 = _id_A581::_id_3E35( var_6 );
        var_5 = common_scripts\utility::_id_0CDD( var_5, var_7 );
    }

    return _id_0D0A( var_5, var_1, var_3, var_2 );
}

get_guy_with_script_noteworthy_from_spawner( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );
    var_2 = _id_0D08( var_1 );
    return var_2[0];
}

get_guy_with_targetname_from_spawner( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    var_2 = _id_0D08( var_1 );
    return var_2[0];
}

get_guys_with_targetname_from_spawner( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    return _id_0D08( var_1 );
}

_id_0D0E( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( var_0, "script_noteworthy" );

    if ( isdefined( level._id_893E ) )
    {
        var_5 = common_scripts\utility::_id_40FD( var_0, "script_noteworthy" );

        if ( isdefined( var_3 ) && var_3 )
            _id_286F( var_5 );

        var_6 = _id_A581::_id_3E35( var_5 );
        var_4 = common_scripts\utility::_id_0CDD( var_4, var_6 );
    }

    return _id_0D08( var_4, var_1, var_2 );
}

_id_894B( var_0, var_1 )
{
    var_2 = getent( var_0, "script_noteworthy" );
    var_3 = var_2 _id_88C3( var_1 );
    return var_3;
}

_id_895D( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_3 = var_2 _id_88C3( var_1 );
    return var_3;
}

_id_0757( var_0, var_1, var_2 )
{
    if ( getdvarint( "loc_warnings", 0 ) )
        return;

    if ( !isdefined( level._id_2A18 ) )
        level._id_2A18 = [];

    var_3 = 0;

    for (;;)
    {
        if ( !isdefined( level._id_2A18[var_3] ) )
            break;

        var_3++;
    }

    var_4 = "^3";

    if ( isdefined( var_2 ) )
    {
        switch ( var_2 )
        {
            case "r":
            case "red":
                var_4 = "^1";
                break;
            case "g":
            case "green":
                var_4 = "^2";
                break;
            case "y":
            case "yellow":
                var_4 = "^3";
                break;
            case "b":
            case "blue":
                var_4 = "^4";
                break;
            case "c":
            case "cyan":
                var_4 = "^5";
                break;
            case "p":
            case "purple":
                var_4 = "^6";
                break;
            case "w":
            case "white":
                var_4 = "^7";
                break;
            case "bl":
            case "black":
                var_4 = "^8";
                break;
        }
    }

    level._id_2A18[var_3] = 1;
    var_5 = _id_A546::_id_2401( "default", 1.5 );
    var_5._id_57F4 = 0;
    var_5.alignx = "left";
    var_5.aligny = "top";
    var_5._id_0198 = 1;
    var_5._id_03D4 = 20;
    var_5.alpha = 0;
    var_5 _meth_8086( 0.5 );
    var_5.alpha = 1;
    var_5._id_0530 = 40;
    var_5._id_0538 = 260 + var_3 * 18;
    var_5._id_0241 = " " + var_4 + "< " + var_0 + " > ^7" + var_1;
    var_5.color = ( 1, 1, 1 );
    wait 2;
    var_6 = 40;
    var_5 _meth_8086( 6 );
    var_5.alpha = 0;

    for ( var_7 = 0; var_7 < var_6; var_7++ )
    {
        var_5.color = ( 1, 1, 0 / ( var_6 - var_7 ) );
        wait 0.05;
    }

    wait 4;
    var_5 _meth_808A();
    level._id_2A18[var_3] = undefined;
}

_id_290B()
{
    common_scripts\_destructible::_id_2AA1();
}

_id_290F()
{
    common_scripts\_destructible::_id_3995();
}

_id_7E52( var_0 )
{
    self._id_01D0 = var_0;
}

_id_3E24()
{
    var_0 = self._id_02E2;
    var_1 = anglestoup( self _meth_8338() );
    var_2 = self _meth_82EF();
    var_3 = var_0 + ( 0, 0, var_2 );
    var_4 = var_0 + var_1 * var_2;
    var_5 = var_3 - var_4;
    var_6 = var_0 + var_5;
    return var_6;
}

_id_7DDD( var_0 )
{
    self._id_1300 = var_0;
}

_id_7DF3()
{
    if ( !isdefined( level._id_2153 ) )
        level._id_2153 = getdvar( "consoleGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0532 ) )
        level._id_0532 = getdvar( "xenonGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0349 ) )
        level._id_0349 = getdvar( "ps3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_02FC ) )
        level._id_02FC = getdvar( "pccgGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0531 ) )
        level._id_0531 = getdvar( "xb3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_034A ) )
        level._id_034A = getdvar( "ps4Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_02FB ) )
        level._id_02FB = !level._id_2153 && !level._id_02FC;
    else
    {

    }

    if ( !isdefined( level.pcuwp ) )
        level.pcuwp = getdvar( "pcUWPGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_00E3 ) )
        level._id_00E3 = level._id_0349 || level._id_02FC || level._id_0532;
    else
    {

    }

    if ( !isdefined( level._id_02AF ) )
        level._id_02AF = level._id_02FB || level._id_034A || level._id_0531;
    else
    {

    }
}

_id_502F()
{
    return level._id_02AF;
}

_id_114E( var_0 )
{
    return _id_A514::_id_055C( var_0 );
}

_id_114F()
{
    return _id_A514::_id_055C( 1 );
}

_id_7E43( var_0 )
{
    self._id_2652 = _id_3FAC( var_0 );
}

_id_7E06( var_0 )
{
    self._id_2652 = _id_3EF5( var_0 );
}

_id_1EAB()
{
    self._id_2652 = undefined;
}

_id_4B09( var_0 )
{
    wait 0.75;

    if ( isdefined( var_0 ) )
        self _meth_809C( var_0 );
    else
        self _meth_809C( "door_wood_slow_open" );

    wait 1;
    self _meth_82B1( self.angles + ( 0, 70, 0 ), 2, 0.5, 0 );

    if ( self.classname == "script_brushmodel" )
        self _meth_805A();

    self waittill( "rotatedone" );
    self _meth_82B1( self.angles + ( 0, 40, 0 ), 2, 0, 2 );
}

_id_6666( var_0 )
{
    wait 1.35;

    if ( isdefined( var_0 ) )
        self _meth_809C( var_0 );
    else
        self _meth_809C( "door_wood_slow_open" );

    self _meth_82B1( self.angles + ( 0, 70, 0 ), 2, 0.5, 0 );
    self _meth_805A();
    self waittill( "rotatedone" );
    self _meth_82B1( self.angles + ( 0, 40, 0 ), 2, 0, 2 );
}

_id_5689( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
        var_3 _meth_8032( var_1, var_0 );

    wait(var_0);
}

_id_568B( var_0, var_1 )
{
    var_2 = getdvarfloat( "cg_fovscale" );
    var_3 = _func_0BC( var_0 / 0.05 );
    var_4 = ( var_1 - var_2 ) / var_3;
    var_5 = var_2;

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        var_5 += var_4;
        _func_0D6( "cg_fovscale", var_5 );
        wait 0.05;
    }

    _func_0D6( "cg_fovscale", var_1 );
}

_id_7065()
{
    animscripts\shared::_id_6869( self._id_0513, "none" );
    self._id_0513 = "none";
}

_id_0CA2()
{
    _id_A513::_id_7E35( 0 );
}

_id_0CA1()
{
    _id_A513::_id_7E35( 1 );
}

_id_0C3D()
{
    self _meth_8143();
    self notify( "stop_loop" );
    self notify( "single anim", "end" );
    self notify( "looping anim", "end" );
}

_id_2AC2()
{
    self.a._id_2B20 = 1;
    self.allowpain = 0;
}

_id_30D9()
{
    self.a._id_2B20 = 0;
    self.allowpain = 1;
}

_id_057D()
{
    self delete();
}

_id_05D9()
{
    self _meth_8054();
}

_id_5346()
{
    if ( _func_1AD( self ) )
    {
        if ( common_scripts\utility::_id_3839( "special_op_terminated" ) && common_scripts\utility::_id_382E( "special_op_terminated" ) )
            return 0;

        if ( _id_5062( self ) )
            self _meth_80F2();
    }

    self _meth_80EE( 0 );
    self _meth_8054();
    return 1;
}

_id_0635( var_0 )
{
    self _meth_816B( var_0 );
}

_id_056A()
{
    self _meth_816C();
}

_id_0679()
{
    self _meth_8051();
}

_id_2AC0( var_0 )
{
    var_1 = _func_1D3( level._id_05C3[var_0] );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        level._id_05C3[var_0][var_1[var_2]]._id_587B delete();
        level._id_05C3[var_0][var_1[var_2]] = undefined;
    }
}

_id_0639( var_0 )
{
    self _meth_81E2( var_0 );
}

_id_05E1( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        self _meth_804F( var_0, var_1, var_2, var_3 );
        return;
    }

    if ( isdefined( var_2 ) )
    {
        self _meth_804F( var_0, var_1, var_2 );
        return;
    }

    if ( isdefined( var_1 ) )
    {
        self _meth_804F( var_0, var_1 );
        return;
    }

    self _meth_804F( var_0 );
}

_id_0D18( var_0, var_1, var_2 )
{
    var_3 = _func_1D3( var_0 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_6 = var_3[var_5];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        var_6 = var_3[var_5];
        var_4[var_6] = spawnstruct();
        var_4[var_6]._id_0558 = 1;
        var_4[var_6] thread _id_A5A5::_id_0D19( var_0[var_6], var_1, var_2 );
    }

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        var_6 = var_3[var_5];

        if ( isdefined( var_0[var_6] ) && var_4[var_6]._id_0558 )
            var_4[var_6] waittill( "_array_wait" );
    }
}

_id_2A51()
{
    self _meth_8054( ( 0, 0, 0 ) );
}

_id_4026( var_0 )
{
    return level._id_78B5[var_0];
}

_id_50A9()
{
    return self _meth_833D() > 0.5;
}

_id_7438()
{
    level._id_0318._id_04B1 = _func_0BC( _id_A537::_id_3DD0( "threatbias", 1 ) );
}

_id_A0AC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_5 ) )
        var_5 = level._id_0318;

    var_6 = spawnstruct();

    if ( isdefined( var_3 ) )
        var_6 thread _id_61FD( "timeout", var_3 );

    var_6 endon( "timeout" );

    if ( !isdefined( var_0 ) )
        var_0 = 0.92;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_7 = _func_0BC( var_1 * 20 );
    var_8 = var_7;
    self endon( "death" );
    var_9 = _func_0CF( self );
    var_10 = undefined;

    for (;;)
    {
        if ( var_9 )
            var_10 = self _meth_80AA();
        else
            var_10 = self._id_02E2;

        if ( var_5 _id_6B91( var_10, var_0, var_2, var_4 ) )
        {
            var_8--;

            if ( var_8 <= 0 )
                return 1;
        }
        else
            var_8 = var_7;

        wait 0.05;
    }
}

_id_A0AD( var_0, var_1, var_2, var_3 )
{
    _id_A0AC( var_1, var_0, var_2, undefined, var_3 );
}

_id_6B91( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0.8;

    var_4 = _id_3E25();
    var_5 = var_4 _meth_80AA();
    var_6 = _func_115( var_0 - var_5 );
    var_7 = anglestoforward( var_6 );
    var_8 = var_4 _meth_8338();
    var_9 = anglestoforward( var_8 );
    var_10 = _func_0F6( var_7, var_9 );

    if ( var_10 < var_1 )
        return 0;

    if ( isdefined( var_2 ) )
        return 1;

    var_11 = _func_06B( var_0, var_5, 0, var_3 );
    return var_11["fraction"] == 1;
}

_id_3021( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < level._id_0323.size; var_4++ )
    {
        if ( level._id_0323[var_4] _id_6B91( var_0, var_1, var_2, var_3 ) )
            return 1;
    }

    return 0;
}

_id_6A98( var_0, var_1 )
{
    var_2 = gettime();

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( isdefined( var_0._id_6D46 ) && var_0._id_6D46 + var_1 >= var_2 )
        return var_0._id_6D45;

    var_0._id_6D46 = var_2;

    if ( !common_scripts\utility::_id_A347( level._id_0318._id_02E2, level._id_0318.angles, var_0._id_02E2, 0.766 ) )
    {
        var_0._id_6D45 = 0;
        return 0;
    }

    var_3 = level._id_0318 _meth_80AA();
    var_4 = var_0._id_02E2;

    if ( _func_08E( var_3, var_4, 1, level._id_0318, var_0 ) )
    {
        var_0._id_6D45 = 1;
        return 1;
    }

    var_5 = var_0 _meth_80AA();

    if ( _func_08E( var_3, var_5, 1, level._id_0318, var_0 ) )
    {
        var_0._id_6D45 = 1;
        return 1;
    }

    var_6 = ( var_5 + var_4 ) * 0.5;

    if ( _func_08E( var_3, var_6, 1, level._id_0318, var_0 ) )
    {
        var_0._id_6D45 = 1;
        return 1;
    }

    var_0._id_6D45 = 0;
    return 0;
}

_id_6D3D( var_0, var_1 )
{
    var_2 = var_0 * var_0;

    for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
    {
        if ( _func_0F0( var_1, level._id_0323[var_3]._id_02E2 ) < var_2 )
            return 1;
    }

    return 0;
}

_id_08D6( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_2 = 0.75;

    if ( _func_140() )
        var_2 = 0.65;

    while ( var_0.size > 0 )
    {
        wait 1;

        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            if ( !isdefined( var_0[var_3] ) || !_func_1A1( var_0[var_3] ) )
            {
                var_0 = common_scripts\utility::_id_0CF6( var_0, var_0[var_3] );
                continue;
            }

            if ( _id_6D3D( var_1, var_0[var_3]._id_02E2 ) )
                continue;

            if ( _id_3021( var_0[var_3]._id_02E2 + ( 0, 0, 48 ), var_2, 1 ) )
                continue;

            if ( isdefined( var_0[var_3]._id_58D7 ) )
                var_0[var_3] _id_8EA4();

            var_0[var_3] delete();
            var_0 = common_scripts\utility::_id_0CF6( var_0, var_0[var_3] );
        }
    }
}

_id_07BE( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_1A08 = self;
    var_4._id_3AE4 = var_0;
    var_4._id_6695 = [];

    if ( isdefined( var_1 ) )
        var_4._id_6695[var_4._id_6695.size] = var_1;

    if ( isdefined( var_2 ) )
        var_4._id_6695[var_4._id_6695.size] = var_2;

    if ( isdefined( var_3 ) )
        var_4._id_6695[var_4._id_6695.size] = var_3;

    level._id_9F83[level._id_9F83.size] = var_4;
}

_id_072E( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_1A08 = self;
    var_4._id_3AE4 = var_0;
    var_4._id_6695 = [];

    if ( isdefined( var_1 ) )
        var_4._id_6695[var_4._id_6695.size] = var_1;

    if ( isdefined( var_2 ) )
        var_4._id_6695[var_4._id_6695.size] = var_2;

    if ( isdefined( var_3 ) )
        var_4._id_6695[var_4._id_6695.size] = var_3;

    level._id_06BD[level._id_06BD.size] = var_4;
}

_id_075F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6._id_1A08 = self;
    var_6._id_3AE4 = var_0;
    var_6._id_6695 = [];

    if ( isdefined( var_1 ) )
        var_6._id_6695[var_6._id_6695.size] = var_1;

    if ( isdefined( var_2 ) )
        var_6._id_6695[var_6._id_6695.size] = var_2;

    if ( isdefined( var_3 ) )
        var_6._id_6695[var_6._id_6695.size] = var_3;

    if ( isdefined( var_4 ) )
        var_6._id_6695[var_6._id_6695.size] = var_4;

    if ( isdefined( var_5 ) )
        var_6._id_6695[var_6._id_6695.size] = var_5;

    level._id_76AB[level._id_76AB.size] = var_6;
}

_id_073C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6._id_1A08 = self;
    var_6._id_3AE4 = var_0;
    var_6._id_6695 = [];

    if ( isdefined( var_1 ) )
        var_6._id_6695[var_6._id_6695.size] = var_1;

    if ( isdefined( var_2 ) )
        var_6._id_6695[var_6._id_6695.size] = var_2;

    if ( isdefined( var_3 ) )
        var_6._id_6695[var_6._id_6695.size] = var_3;

    if ( isdefined( var_4 ) )
        var_6._id_6695[var_6._id_6695.size] = var_4;

    if ( isdefined( var_5 ) )
        var_6._id_6695[var_6._id_6695.size] = var_5;

    level._id_76A7[level._id_76A7.size] = var_6;
}

_id_077B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6._id_3AE4 = var_0;
    var_6._id_6695 = [];

    if ( isdefined( var_1 ) )
        var_6._id_6695[var_6._id_6695.size] = var_1;

    if ( isdefined( var_2 ) )
        var_6._id_6695[var_6._id_6695.size] = var_2;

    if ( isdefined( var_3 ) )
        var_6._id_6695[var_6._id_6695.size] = var_3;

    if ( isdefined( var_4 ) )
        var_6._id_6695[var_6._id_6695.size] = var_4;

    if ( isdefined( var_5 ) )
        var_6._id_6695[var_6._id_6695.size] = var_5;

    level._id_76AD[level._id_76AD.size] = var_6;
}

_id_075B( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_1A08 = self;
    var_1._id_315B = var_0;
    level._id_2BDE[level._id_2BDE.size] = var_1;
}

_id_2BDD()
{
    _id_2BDC( level._id_9F83.size - 1 );
}

_id_2BDC( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = spawnstruct();
    var_2 = level._id_9F83;
    var_3 = level._id_2BDE;
    var_4 = level._id_76AB;
    var_5 = level._id_76A7;
    var_6 = level._id_76AD;
    var_7 = level._id_06BD;
    level._id_9F83 = [];
    level._id_76AB = [];
    level._id_2BDE = [];
    level._id_06BD = [];
    level._id_76A7 = [];
    level._id_76AD = [];
    var_1.count = var_2.size;
    var_1 common_scripts\utility::_id_0CF0( var_2, _id_A5A5::_id_A091, var_3 );
    var_1 thread _id_A5A5::_id_2BB5( var_7 );
    var_1 endon( "any_funcs_aborted" );

    for (;;)
    {
        if ( var_1.count <= var_0 )
            break;

        var_1 waittill( "func_ended" );
    }

    var_1 notify( "all_funcs_ended" );
    common_scripts\utility::_id_0CF0( var_4, _id_A5A5::_id_33EC, [] );
    common_scripts\utility::_id_0CF0( var_5, _id_A5A5::_id_33EA );
    common_scripts\utility::_id_0CF0( var_6, _id_A5A5::_id_33EB );
}

_id_2BC1()
{
    var_0 = spawnstruct();
    var_1 = level._id_76AB;
    level._id_76AB = [];

    foreach ( var_3 in var_1 )
        level _id_A5A5::_id_33EC( var_3, [] );

    var_0 notify( "all_funcs_ended" );
}

_id_5016()
{
    if ( isdefined( level._id_39B6 ) && level._id_39B6 == 1 )
        return 0;

    if ( isdefined( level._id_278C ) && level._id_278C == level._id_8C36 )
        return 1;

    if ( isdefined( level._id_278B ) )
        return level._id_8C36 == "default";

    if ( _id_56C2() )
        return level._id_8C36 == level._id_8BB5[0]["name"];

    return level._id_8C36 == "default";
}

_id_39A6()
{
    level._id_39B6 = 1;
}

_id_502A()
{
    if ( !_id_56C2() )
        return 1;

    return level._id_8C36 == level._id_8BB5[0]["name"];
}

_id_4FFC( var_0 )
{
    var_1 = 0;

    if ( level._id_8C36 == var_0 )
        return 0;

    if ( level._id_8C36 == "default" )
        return 0;

    for ( var_2 = 0; var_2 < level._id_8BB5.size; var_2++ )
    {
        if ( level._id_8BB5[var_2]["name"] == var_0 )
        {
            var_1 = 1;
            continue;
        }

        if ( level._id_8BB5[var_2]["name"] == level._id_8C36 )
            return var_1;
    }
}

is_start_or_after_start( var_0 )
{
    if ( level._id_8C36 == var_0 )
        return 1;

    if ( _id_4FFC( var_0 ) )
        return 1;

    return 0;
}

_id_058E( var_0, var_1, var_2, var_3 )
{
    _func_18C( var_0, var_1, var_2, var_3 );
}

_id_A299( var_0, var_1 )
{
    self endon( "death" );
    var_2 = 0;

    if ( isdefined( var_1 ) )
        var_2 = 1;

    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::_id_382F( var_0 );
        level endon( var_0 );
    }

    for (;;)
    {
        wait(_func_0B5( 0.15, 0.3 ));
        var_3 = self._id_02E2 + ( 0, 0, 150 );
        var_4 = self._id_02E2 - ( 0, 0, 150 );
        var_5 = _func_06B( var_3, var_4, 0, undefined );

        if ( !_func_120( var_5["surfacetype"], "water" ) )
            continue;

        var_6 = "water_movement";

        if ( _func_1AD( self ) )
        {
            if ( _func_0EE( self _meth_8336(), ( 0, 0, 0 ) ) < 5 )
                var_6 = "water_stop";
        }
        else if ( isdefined( level._id_058F["water_" + self.a._id_5F5B] ) )
            var_6 = "water_" + self.a._id_5F5B;

        var_7 = common_scripts\utility::_id_3FA8( var_6 );
        var_3 = var_5["position"];
        var_8 = ( 0, self.angles[1], 0 );
        var_9 = anglestoforward( var_8 );
        var_10 = anglestoup( var_8 );
        playfx( var_7, var_3, var_10, var_9 );

        if ( var_6 != "water_stop" && var_2 )
            thread common_scripts\utility::_id_69C2( var_1, var_3 );
    }
}

_id_6D5A( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::_id_382F( var_0 );
        level endon( var_0 );
    }

    for (;;)
    {
        wait(_func_0B5( 0.25, 0.5 ));
        var_1 = self._id_02E2 + ( 0, 0, 0 );
        var_2 = self._id_02E2 - ( 0, 0, 5 );
        var_3 = _func_06B( var_1, var_2, 0, undefined );
        var_4 = anglestoforward( self.angles );
        var_5 = _func_0EE( self _meth_8336(), ( 0, 0, 0 ) );

        if ( isdefined( self._id_9C7E ) )
            continue;

        if ( var_3["surfacetype"] != "snow" )
            continue;

        if ( var_5 <= 10 )
            continue;

        var_6 = "snow_movement";

        if ( _func_0EE( self _meth_8336(), ( 0, 0, 0 ) ) <= 154 )
            playfx( common_scripts\utility::_id_3FA8( "footstep_snow_small" ), var_3["position"], var_3["normal"], var_4 );

        if ( _func_0EE( self _meth_8336(), ( 0, 0, 0 ) ) > 154 )
            playfx( common_scripts\utility::_id_3FA8( "footstep_snow" ), var_3["position"], var_3["normal"], var_4 );
    }
}

_id_5CEC( var_0 )
{
    var_1 = 60;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        self _meth_803D( var_0, var_0 + "_off", ( var_1 - var_2 ) / var_1 );
        wait 0.05;
    }
}

_id_5CEA( var_0 )
{
    var_1 = 60;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        self _meth_803D( var_0, var_0 + "_off", var_2 / var_1 );
        wait 0.05;
    }
}

_id_5972( var_0, var_1 )
{
    var_0 endon( "death" );
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    for (;;)
    {
        self._id_02E2 = var_0._id_02E2 + var_1;
        self.angles = var_0.angles;
        wait 0.05;
    }
}

_id_60D6()
{
    _id_A530::_id_05FF();
}

_id_590F( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5[var_5.size] = var_0;

    if ( isdefined( var_1 ) )
        var_5[var_5.size] = var_1;

    if ( isdefined( var_2 ) )
        var_5[var_5.size] = var_2;

    if ( isdefined( var_3 ) )
        var_5[var_5.size] = var_3;

    if ( isdefined( var_4 ) )
        var_5[var_5.size] = var_4;

    return var_5;
}

_id_3601()
{
    level._id_361A = 1;
}

_id_615C()
{
    level._id_361A = 0;
}

_id_4088()
{
    var_0 = self _meth_8308();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_1[var_3] = self _meth_82F5( var_3 );
    }

    var_4 = 0;

    if ( isdefined( var_1["claymore"] ) && var_1["claymore"] > 0 )
        var_4 = var_1["claymore"];

    return var_4;
}

_id_0694( var_0 )
{
    wait(var_0);
}

_id_0696( var_0, var_1 )
{
    self waittillmatch( var_0, var_1 );
}

_id_063E( var_0, var_1 )
{
    _func_0D6( var_0, var_1 );
}

_id_569C( var_0, var_1, var_2 )
{
    var_3 = getdvarfloat( var_0 );
    level notify( var_0 + "_lerp_savedDvar" );
    level endon( var_0 + "_lerp_savedDvar" );
    var_4 = var_1 - var_3;
    var_5 = 0.05;
    var_6 = _func_0BC( var_2 / var_5 );

    for ( var_7 = var_4 / var_6; var_6; var_6-- )
    {
        var_3 += var_7;
        _func_0D6( var_0, var_3 );
        wait(var_5);
    }

    _func_0D6( var_0, var_1 );
}

_id_569D( var_0, var_1, var_2, var_3 )
{
    if ( _id_502F() )
        _id_569C( var_0, var_2, var_3 );
    else
        _id_569C( var_0, var_1, var_3 );
}

_id_41DD( var_0 )
{
    if ( ( _id_5017() || common_scripts\utility::_id_382E( "has_cheated" ) || maps\_cheat::is_cheating() ) && !( var_0 == "LOOK_SHARP" || var_0 == "EYES_AND_EARS" ) )
        return;

    foreach ( var_2 in level._id_0323 )
        var_2 _meth_80FB( var_0 );
}

_id_6B2D( var_0 )
{
    if ( _id_5017() )
        return;

    self _meth_80FB( var_0 );
}

_id_076A( var_0 )
{
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 _meth_80C0( 0 );
    var_1 _meth_80B3( "weapon_javelin_obj" );
    var_1._id_02E2 = self._id_02E2;
    var_1.angles = self.angles;
    _id_07BE( ::_id_2828 );

    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::_id_382F( var_0 );
        _id_07BE( common_scripts\utility::_id_384A, var_0 );
    }

    _id_2BDD();
    var_1 delete();
}

_id_073B( var_0 )
{
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 _meth_80C0( 0 );
    var_1 _meth_80B3( "weapon_c4_obj" );
    var_1._id_02E2 = self._id_02E2;
    var_1.angles = self.angles;
    _id_07BE( ::_id_2828 );

    if ( isdefined( var_0 ) )
    {
        common_scripts\utility::_id_382F( var_0 );
        _id_07BE( common_scripts\utility::_id_384A, var_0 );
    }

    _id_2BDD();
    var_1 delete();
}

_id_2828()
{
    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        wait 0.05;
    }
}

_id_8648()
{
    common_scripts\utility::_id_383F( "disable_slowmo_cheat" );
}

_id_863E()
{
    common_scripts\utility::_id_3831( "disable_slowmo_cheat" );
}

_id_8646( var_0 )
{
    level._id_8637._id_8A56 = var_0;
}

_id_8645( var_0 )
{
    level._id_8637._id_8A53 = var_0;
}

_id_8643( var_0 )
{
    level._id_8637._id_56A9 = var_0;
}

_id_8644( var_0 )
{
    level._id_8637._id_56AA = var_0;
}

_id_8640()
{
    if ( isdefined( level._id_610E ) && level._id_610E )
        return;

    _func_0B1( level._id_8637._id_8A53, level._id_8637._id_8A56, level._id_8637._id_56A9 );
}

_id_8641()
{
    if ( isdefined( level._id_610E ) && level._id_610E )
        return;

    _func_0B1( level._id_8637._id_8A56, level._id_8637._id_8A53, level._id_8637._id_56AA );
}

_id_075A( var_0, var_1, var_2, var_3 )
{
    level._id_3010[var_0]["magnitude"] = var_1;
    level._id_3010[var_0]["duration"] = var_2;
    level._id_3010[var_0]["radius"] = var_3;
}

_id_0CC3()
{
    return getdvar( "arcademode" ) == "1";
}

arcademode_checkpoint( var_0, var_1 )
{

}

arcademode_kill( var_0, var_1, var_2 )
{
    if ( getdvar( "arcademode" ) != "1" )
        return;

    thread maps\_arcademode::arcademode_add_points( var_0, 1, var_1, var_2 );
}

arcademode_damage( var_0, var_1, var_2 )
{

}

_id_0CC5()
{
    if ( !isdefined( level._id_0CC4 ) )
        return;

    level notify( "arcadeMode_remove_timer" );
    level._id_0CC6 = gettime();
    level._id_0CC4 _meth_808A();
    level._id_0CC4 = undefined;
}

_id_6008( var_0, var_1, var_2 )
{
    level._id_055B._id_555B = var_0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    _func_076( 0 );
    _func_075( var_0, 0, 1.0, 1, var_2 );
}

_id_5FFE( var_0, var_1, var_2, var_3, var_4 )
{
    thread _id_A5A5::_id_5FFF( var_0, var_1, var_2, var_3, var_4 );
}

_id_6001( var_0, var_1, var_2, var_3, var_4 )
{
    thread _id_A5A5::_id_5FFF( var_0, var_1, var_2, var_3, var_4, 1 );
}

_id_6003( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) && var_1 > 0 )
    {
        thread _id_A5A5::_id_6004( var_0, var_1, var_2, var_3 );
        return;
    }

    _id_6005();
    _id_6008( var_0, var_2, var_3 );
}

_id_5FFC( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( isdefined( level._id_055B._id_555B ) )
        _func_076( var_1, level._id_055B._id_555B, var_3 );
    else
        iprintln( "^3WARNING!  script music_crossfade(): No previous song was played - no previous song to crossfade from - not fading out anything" );

    level._id_055B._id_555B = var_0;
    _func_075( var_0, var_1, var_2, 0, var_3 );
    level endon( "stop_music" );
    wait(var_1);
    level notify( "done_crossfading" );
}

_id_6005( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 <= 0 )
        _func_076();
    else
        _func_076( var_0 );

    level notify( "stop_music" );
}

_id_6B6F()
{
    var_0 = getentarray( "grenade", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( var_2._id_029C == "weapon_claymore" )
            continue;

        for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
        {
            var_4 = level._id_0323[var_3];

            if ( _func_0F0( var_2._id_02E2, var_4._id_02E2 ) < 75625 )
                return 1;
        }
    }

    return 0;
}

_id_6ACB()
{
    return getdvarint( "player_died_recently", "0" ) > 0;
}

_id_09E3( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( !var_2 _meth_80AB( var_0 ) )
            return 0;
    }

    return 1;
}

_id_0C95( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 _meth_80AB( var_0 ) )
            return 1;
    }

    return 0;
}

_id_3F58()
{
    if ( level._id_3BFE < 1 )
        return "easy";

    if ( level._id_3BFE < 2 )
        return "medium";

    if ( level._id_3BFE < 3 )
        return "hard";

    return "fu";
}

_id_3F0E()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level._id_0323 )
    {
        var_0 += var_4._id_02E2[0];
        var_1 += var_4._id_02E2[1];
        var_2 += var_4._id_02E2[2];
    }

    var_0 /= level._id_0323.size;
    var_1 /= level._id_0323.size;
    var_2 /= level._id_0323.size;
    return ( var_0, var_1, var_2 );
}

_id_3CD1( var_0 )
{
    var_1 = ( 0, 0, 0 );

    foreach ( var_3 in var_0 )
        var_1 += var_3._id_02E2;

    return var_1 * 1.0 / var_0.size;
}

_id_3C8C()
{
    self._id_257E = [];
    self endon( "entitydeleted" );
    self endon( "stop_generic_damage_think" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        foreach ( var_8 in self._id_257E )
            thread [[ var_8 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    }
}

_id_0749( var_0 )
{
    self._id_257E[self._id_257E.size] = var_0;
}

_id_733C( var_0 )
{
    var_1 = [];

    foreach ( var_3 in self._id_257E )
    {
        if ( var_3 == var_0 )
            continue;

        var_1[var_1.size] = var_3;
    }

    self._id_257E = var_1;
}

_id_4210( var_0, var_1 )
{
    if ( isdefined( level._id_A3A1 ) && level._id_A3A1 && isdefined( level._id_A3A2 ) )
        self [[ level._id_A3A2 ]]( var_0, var_1 );
}

_id_6DC0( var_0 )
{
    self _meth_82F1( var_0 );
}

_id_3116( var_0 )
{
    if ( level._id_0323.size < 1 )
        return;

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_0 == 1 )
        {
            var_2 _meth_831B();
            continue;
        }

        var_2 _meth_831A();
    }
}

_id_923F( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in var_0 )
    {
        if ( isdefined( var_5._id_0398 ) && var_5._id_0398 == "player1" )
        {
            var_1 = var_5;
            continue;
        }

        if ( isdefined( var_5._id_0398 ) && var_5._id_0398 == "player2" )
        {
            var_2 = var_5;
            continue;
        }

        if ( !isdefined( var_1 ) )
            var_1 = var_5;

        if ( !isdefined( var_2 ) )
            var_2 = var_5;
    }

    foreach ( var_8 in level._id_0323 )
    {
        if ( var_8 == level._id_0318 )
            var_3 = var_1;
        else if ( var_8 == level._id_6C5B )
            var_3 = var_2;

        var_8 _meth_8335( var_3._id_02E2 );
        var_8 _meth_8337( var_3.angles );
    }
}

_id_923E( var_0 )
{
    level._id_0318 _meth_8335( var_0._id_02E2 );

    if ( isdefined( var_0.angles ) )
        level._id_0318 _meth_8337( var_0.angles );
}

_id_9723()
{
    var_0 = [];

    if ( isdefined( self._id_330D ) )
        var_0 = self._id_330D;

    if ( isdefined( self._id_0151 ) )
        var_0[var_0.size] = self._id_0151;

    common_scripts\utility::_id_0CF0( var_0, _id_A5A5::_id_9724 );
}

_id_651D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    level._id_0318 endon( "stop_opening_fov" );
    wait(var_0);
    level._id_0318 _meth_807F( var_1, var_2, 1, var_3, var_4, var_5, var_6, 1 );
}

_id_3CB8( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    if ( !isdefined( var_1 ) )
        var_1 = "all";

    var_3 = _func_0DA( var_0, var_1 );
    var_4 = [];

    foreach ( var_6 in var_3 )
    {
        if ( var_6 _meth_80AB( self ) )
            var_4[var_4.size] = var_6;
    }

    return var_4;
}

_id_3D49( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    var_1 = [];

    if ( var_0 == "all" )
    {
        var_1 = _id_0CF2( level._id_2F1A["allies"]._id_0CD8, level._id_2F1A["axis"]._id_0CD8 );
        var_1 = _id_0CF2( var_1, level._id_2F1A["neutral"]._id_0CD8 );
    }
    else
        var_1 = level._id_2F1A[var_0]._id_0CD8;

    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( var_4 _meth_80AB( self ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_3D4A( var_0 )
{
    var_1 = _id_0CF2( level._id_2F1A["allies"]._id_0CD8, level._id_2F1A["axis"]._id_0CD8 );
    var_1 = _id_0CF2( var_1, level._id_2F1A["neutral"]._id_0CD8 );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( isdefined( var_4._id_04A6 ) && var_4._id_04A6 == var_0 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_3E07( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_0 == var_2 )
            continue;

        return var_2;
    }
}

_id_7DF8( var_0 )
{
    self.count = var_0;
}

_id_396A( var_0, var_1, var_2, var_3 )
{
    self notify( "_utility::follow_path" );
    self endon( "_utility::follow_path" );
    self endon( "death" );
    var_4 = undefined;

    if ( !isdefined( var_0.classname ) )
    {
        if ( !isdefined( var_0._id_04D9 ) )
            var_4 = "struct";
        else
            var_4 = "node";
    }
    else
        var_4 = "entity";

    if ( !isdefined( var_1 ) )
        var_1 = 300;

    var_5 = self._id_79E9;
    self._id_79E9 = 1;
    _id_A581::_id_4241( var_0, var_4, var_2, var_1, var_3 );
    self._id_79E9 = var_5;
}

_id_30BC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 250;

    if ( !isdefined( var_1 ) )
        var_1 = 100;

    if ( !isdefined( var_2 ) )
        var_2 = var_0 * 2;

    if ( !isdefined( var_3 ) )
        var_3 = var_0 * 1.25;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    self._id_2D2C = var_5;
    thread _id_A5A5::_id_2FE4( var_0, var_1, var_2, var_3, var_4 );
}

_id_2A9B()
{
    self notify( "stop_dynamic_run_speed" );
}

_id_6BFE()
{
    self endon( "death" );
    self endon( "stop_player_seek" );
    var_0 = 1200;

    if ( _id_46FE() )
        var_0 = 250;

    var_1 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

    for (;;)
    {
        wait 2;
        self._id_01C4 = var_1;
        var_2 = _id_3CFE( self._id_02E2 );
        self _meth_81AB( var_2 );
        var_1 -= 175;

        if ( var_1 < var_0 )
        {
            var_1 = var_0;
            return;
        }
    }
}

_id_6BFD()
{
    self notify( "stop_player_seek" );
}

_id_A08E( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = 5;

    var_3 = gettime() + var_2 * 1000;

    while ( isdefined( var_0 ) )
    {
        if ( _func_0EE( var_0._id_02E2, self._id_02E2 ) <= var_1 )
            break;

        if ( gettime() > var_3 )
            break;

        wait 0.1;
    }
}

_id_A08D( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "death" );

    while ( isdefined( var_0 ) )
    {
        if ( _func_0EE( var_0._id_02E2, self._id_02E2 ) <= var_1 )
            break;

        wait 0.1;
    }
}

_id_A08F( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "death" );

    while ( isdefined( var_0 ) )
    {
        if ( _func_0EE( var_0._id_02E2, self._id_02E2 ) > var_1 )
            break;

        wait 0.1;
    }
}

_id_46FE()
{
    self endon( "death" );

    if ( !isdefined( self._id_0513 ) )
        return 0;

    if ( _func_1B8( self._id_0513 ) == "spread" )
        return 1;

    return 0;
}

_id_5185( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( _func_1E4( var_0 ) != "primary" )
        return 0;

    switch ( _func_1B8( var_0 ) )
    {
        case "mg":
        case "pistol":
        case "rocketlauncher":
        case "spread":
        case "smg":
        case "sniper":
        case "rifle":
            return 1;
        default:
            return 0;
    }
}

_id_6B4A()
{
    var_0 = self _meth_8308();

    if ( !isdefined( var_0 ) )
        return 0;

    foreach ( var_2 in var_0 )
    {
        if ( _func_120( var_2, "thermal" ) )
            return 1;
    }

    return 0;
}

_id_A0C4( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = self._id_01C4;

    for (;;)
    {
        self waittill( "goal" );

        if ( _func_0EE( self._id_02E2, var_0 ) < var_1 + 10 )
            break;
    }
}

_id_6C20( var_0, var_1 )
{
    var_2 = _func_0BC( getdvar( "g_speed" ) );

    if ( !isdefined( level._id_0318._id_3BC4 ) )
        level._id_0318._id_3BC4 = var_2;

    var_3 = _func_0BC( level._id_0318._id_3BC4 * var_0 * 0.01 );
    level._id_0318 _id_6C22( var_3, var_1 );
}

_id_149D( var_0, var_1 )
{
    var_2 = self;

    if ( !_func_1AD( var_2 ) )
        var_2 = level._id_0318;

    if ( !isdefined( var_2._id_5F7A ) )
        var_2._id_5F7A = 1.0;

    var_3 = var_0 * 0.01;
    var_2 _id_149B( var_3, var_1 );
}

_id_6C22( var_0, var_1 )
{
    var_2 = _func_0BC( getdvar( "g_speed" ) );

    if ( !isdefined( level._id_0318._id_3BC4 ) )
        level._id_0318._id_3BC4 = var_2;

    var_3 = _id_A5A5::_id_3BC5;
    var_4 = _id_A5A5::_id_3BC6;
    level._id_0318 thread _id_6C21( var_0, var_1, var_3, var_4, "player_speed_set" );
}

_id_6A7A( var_0, var_1 )
{
    var_2 = _id_A5A5::_id_3BC1;
    var_3 = _id_A5A5::_id_3BC2;
    level._id_0318 thread _id_6C21( var_0, var_1, var_2, var_3, "player_bob_scale_set" );
}

_id_149B( var_0, var_1 )
{
    var_2 = self;

    if ( !_func_1AD( var_2 ) )
        var_2 = level._id_0318;

    if ( !isdefined( var_2._id_5F7A ) )
        var_2._id_5F7A = 1.0;

    var_3 = _id_A5A5::_id_5F75;
    var_4 = _id_A5A5::_id_5F79;
    var_2 thread _id_6C21( var_0, var_1, var_3, var_4, "blend_movespeedscale" );
}

_id_6C21( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( var_4 );
    self endon( var_4 );
    var_5 = [[ var_2 ]]();
    var_6 = var_0;

    if ( isdefined( var_1 ) )
    {
        var_7 = var_6 - var_5;
        var_8 = 0.05;
        var_9 = var_1 / var_8;
        var_10 = var_7 / var_9;

        while ( _func_0BE( var_6 - var_5 ) > _func_0BE( var_10 * 1.1 ) )
        {
            var_5 += var_10;
            [[ var_3 ]]( var_5 );
            wait(var_8);
        }
    }

    [[ var_3 ]]( var_6 );
}

_id_6C1D( var_0 )
{
    if ( !isdefined( level._id_0318._id_3BC4 ) )
        return;

    level._id_0318 _id_6C22( level._id_0318._id_3BC4, var_0 );
    waitframe;
    level._id_0318._id_3BC4 = undefined;
}

_id_149C( var_0 )
{
    var_1 = self;

    if ( !_func_1AD( var_1 ) )
        var_1 = level._id_0318;

    if ( !isdefined( var_1._id_5F7A ) )
        return;

    var_1 _id_149B( 1.0, var_0 );
    waitframe;
    var_1._id_5F7A = undefined;
}

_id_9219( var_0 )
{
    if ( _func_1AD( self ) )
    {
        self _meth_8335( var_0._id_02E2 );
        self _meth_8337( var_0.angles );
    }
    else
        self _meth_81CA( var_0._id_02E2, var_0.angles );
}

_id_924D( var_0, var_1 )
{
    var_2 = var_0 _meth_8184( var_1 );
    var_3 = var_0 _meth_8185( var_1 );
    self _meth_8094();

    if ( _func_1AD( self ) )
    {
        self _meth_8335( var_2 );
        self _meth_8337( var_3 );
    }
    else if ( _func_0CF( self ) )
        self _meth_81CA( var_2, var_3 );
    else
    {
        self._id_02E2 = var_2;
        self.angles = var_3;
    }
}

_id_920E( var_0 )
{
    self _meth_81CA( var_0._id_02E2, var_0.angles );
    self _meth_81AA( self._id_02E2 );
    self _meth_81A9( var_0 );
}

_id_5F00( var_0 )
{
    foreach ( var_2 in level._id_2417 )
        var_2._id_9C42["origin"] += var_0;
}

_id_51AA()
{
    return isdefined( self._id_8626 );
}

_id_139F( var_0, var_1, var_2 )
{
    var_3 = self;
    var_3 thread _id_69C4( "foot_slide_plr_start" );

    if ( _func_1CA( "foot_slide_plr_loop" ) )
        var_3 thread _id_6976( "foot_slide_plr_loop" );

    var_4 = isdefined( level._id_254B );

    if ( !isdefined( var_0 ) )
        var_0 = var_3 _meth_8336() + ( 0, 0, -10 );

    if ( !isdefined( var_1 ) )
        var_1 = 10;

    if ( !isdefined( var_2 ) )
    {
        if ( isdefined( level._id_8621 ) )
            var_2 = level._id_8621;
        else
            var_2 = 0.035;
    }

    var_5 = spawn( "script_origin", var_3._id_02E2 );
    var_5.angles = var_3.angles;
    var_3._id_8626 = var_5;
    var_5 _meth_82AF( ( 0, 0, 15 ), 15, var_0 );

    if ( var_4 )
        var_3 _meth_8082( var_5, undefined, 1 );
    else
        var_3 _meth_807E( var_5 );

    var_3 _meth_831A();
    var_3 _meth_811C( 0 );
    var_3 _meth_811B( 1 );
    var_3 _meth_811A( 0 );
    var_3 thread _id_A5A5::_id_2D7B( var_5, var_1, var_2 );
}

_id_31C7()
{
    var_0 = self;
    var_0 notify( "stop soundfoot_slide_plr_loop" );
    var_0 thread _id_69C4( "foot_slide_plr_end" );
    var_0 _meth_8051();
    var_0 _meth_82EE( var_0._id_8626._id_03CB );
    var_0._id_8626 delete();
    var_0 _meth_831B();
    var_0 _meth_811C( 1 );
    var_0 _meth_811B( 1 );
    var_0 _meth_811A( 1 );
    var_0 notify( "stop_sliding" );
}

_id_8975()
{
    return _id_A5A8::_id_9D41( self );
}

_id_3F89( var_0 )
{
    var_1 = _id_A59E::_id_3DCA();
    var_2 = [];

    foreach ( var_6, var_4 in var_1 )
    {
        if ( !_func_120( var_6, "flag" ) )
            continue;

        var_5 = getentarray( var_6, "classname" );
        var_2 = common_scripts\utility::_id_0CDD( var_2, var_5 );
    }

    var_7 = _id_A59E::_id_3DCB();

    foreach ( var_9, var_4 in var_7 )
    {
        if ( !_func_120( var_9, "flag" ) )
            continue;

        var_5 = getentarray( var_9, "targetname" );
        var_2 = common_scripts\utility::_id_0CDD( var_2, var_5 );
    }

    var_10 = undefined;

    foreach ( var_12 in var_2 )
    {
        if ( var_12._id_79D3 == var_0 )
            return var_12;
    }
}

_id_3F84( var_0 )
{
    var_1 = _id_A59E::_id_3DCA();
    var_2 = [];

    foreach ( var_6, var_4 in var_1 )
    {
        if ( !_func_120( var_6, "flag" ) )
            continue;

        var_5 = getentarray( var_6, "classname" );
        var_2 = common_scripts\utility::_id_0CDD( var_2, var_5 );
    }

    var_7 = _id_A59E::_id_3DCB();

    foreach ( var_9, var_4 in var_7 )
    {
        if ( !_func_120( var_9, "flag" ) )
            continue;

        var_5 = getentarray( var_9, "targetname" );
        var_2 = common_scripts\utility::_id_0CDD( var_2, var_5 );
    }

    var_10 = [];

    foreach ( var_12 in var_2 )
    {
        if ( var_12._id_79D3 == var_0 )
            var_10[var_10.size] = var_12;
    }

    return var_10;
}

_id_7F0F( var_0, var_1 )
{
    return ( var_0[0], var_0[1], var_1 );
}

_id_07C2( var_0, var_1 )
{
    return ( var_0[0], var_0[1], var_0[2] + var_1 );
}

_id_7F0E( var_0, var_1 )
{
    return ( var_0[0], var_1, var_0[2] );
}

_id_7F0D( var_0, var_1 )
{
    return ( var_1, var_0[1], var_0[2] );
}

_id_6C4E()
{
    var_0 = self _meth_830E();

    if ( !isdefined( var_0 ) )
        return 0;

    if ( _func_120( _func_123( var_0 ), "rpg" ) )
        return 1;

    if ( _func_120( _func_123( var_0 ), "stinger" ) )
        return 1;

    if ( _func_120( _func_123( var_0 ), "at4" ) )
        return 1;

    if ( _func_120( _func_123( var_0 ), "javelin" ) )
        return 1;

    return 0;
}

_id_2CE7()
{
    return isdefined( self.a._id_2CE7 );
}

_id_3E58( var_0, var_1 )
{
    if ( _id_500C() )
    {

    }

    var_2 = _id_3E25();

    if ( !isdefined( var_0 ) )
        var_0 = "steady_rumble";

    var_3 = spawn( "script_origin", var_2 _meth_80AA() );

    if ( !isdefined( var_1 ) || !_func_2C2( var_1 ) )
        var_3._id_4E9E = 1;
    else
        var_3._id_4E9E = var_1;

    var_3 thread _id_A5A5::_id_9AD8( var_2, var_0 );
    return var_3;
}

_id_7EAA( var_0 )
{
    self._id_4E9E = var_0;
}

_id_768F( var_0 )
{
    thread _id_7690( 1, var_0 );
}

_id_768E( var_0 )
{
    thread _id_7690( 0, var_0 );
}

_id_7690( var_0, var_1 )
{
    self notify( "new_ramp" );
    self endon( "new_ramp" );
    self endon( "death" );
    var_2 = var_1 * 20;
    var_3 = var_0 - self._id_4E9E;
    var_4 = var_3 / var_2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        self._id_4E9E += var_4;
        wait 0.05;
    }

    self._id_4E9E = var_0;
}

_id_3E25()
{
    if ( isdefined( self ) )
    {
        if ( !_id_503B( level._id_0323, self ) )
            return level._id_0318;
        else
            return self;
    }
    else
        return level._id_0318;
}

_id_3E26()
{
    return _func_0BC( self _meth_8211( "gameskill" ) );
}

_id_4236( var_0 )
{
    if ( isdefined( self._id_614D ) )
        return;

    self._id_614D = self._id_029C;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_029C + "_obj";

    self _meth_80B3( var_0 );
}

_id_8EEC( var_0 )
{
    if ( !isdefined( self._id_614D ) )
        return;

    self _meth_80B3( self._id_614D );
    self._id_614D = undefined;
}

_id_0CE6( var_0, var_1, var_2 )
{
    var_3 = [];
    var_1 = var_2 - var_1;

    foreach ( var_5 in var_0 )
    {
        var_3[var_3.size] = var_5;

        if ( var_3.size == var_2 )
        {
            var_3 = common_scripts\utility::_id_0CF5( var_3 );

            for ( var_6 = var_1; var_6 < var_3.size; var_6++ )
                var_3[var_6] delete();

            var_3 = [];
        }
    }

    var_8 = [];

    foreach ( var_5 in var_0 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        var_8[var_8.size] = var_5;
    }

    return var_8;
}

_id_A095( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.5;

    self endon( "death" );

    while ( isdefined( self ) )
    {
        if ( _func_0EE( var_0, self._id_02E2 ) <= var_1 )
            break;

        wait(var_2);
    }
}

_id_07B3( var_0 )
{
    var_1 = spawnstruct();
    var_1 thread _id_A5A5::_id_07B4( var_0 );
    return var_1;
}

_id_9499( var_0, var_1, var_2 )
{
    var_3 = self _meth_8184( var_1 );
    var_4 = self _meth_8185( var_1 );
    _id_9498( var_0, var_3, var_4, var_2 );
}

_id_9498( var_0, var_1, var_2, var_3 )
{
    var_4 = anglestoforward( var_2 );
    var_5 = _func_06B( var_1, var_1 + var_4 * var_3, 0, undefined );

    if ( var_5["fraction"] >= 1 )
        return;

    var_6 = var_5["surfacetype"];

    if ( !isdefined( level._id_9491[var_0][var_6] ) )
        var_6 = "default";

    var_7 = level._id_9491[var_0][var_6];

    if ( isdefined( var_7["fx"] ) )
        playfx( var_7["fx"], var_5["position"], var_5["normal"] );

    if ( isdefined( var_7["fx_array"] ) )
    {
        foreach ( var_9 in var_7["fx_array"] )
            playfx( var_9, var_5["position"], var_5["normal"] );
    }

    if ( isdefined( var_7["sound"] ) )
        level thread common_scripts\utility::_id_69C2( var_7["sound"], var_5["position"] );

    if ( isdefined( var_7["rumble"] ) )
    {
        var_11 = _id_3E25();
        var_11 _meth_80AF( var_7["rumble"] );
    }
}

_id_2ADA()
{
    self._id_02AD = 0;
}

_id_30F7()
{
    self._id_02AD = _func_0E8( 512 );
}

_id_30C9( var_0 )
{
    self._id_4795 = 1;
    self._id_6109 = 1;
    self._id_04E8 = 1;

    if ( !isdefined( var_0 ) || !var_0 )
    {
        self._id_2D3B = 1;
        self._id_0270 = 64;
        self._id_02F7 = 2048;
        _id_2ADA();
    }

    self._id_8A35 = animscripts\animset::_id_4797;
    self._id_2563["run"] = animscripts\utility::_id_5864( "heat_run" );
}

_id_2AAB()
{
    self._id_4795 = undefined;
    self._id_6109 = undefined;
    self._id_2D3B = undefined;
    self._id_04E8 = 0;
    self._id_0270 = _func_2E5();
    self._id_8A35 = undefined;
    self._id_2563 = undefined;
}

_id_4153()
{
    return _func_1F2();
}

_id_48B0( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( isdefined( var_3 ) )
        var_2 -= 14;

    var_4 = var_2;

    if ( level._id_2153 )
        var_4 -= 1;

    var_5 = 0.5;
    level endon( "clearing_hints" );

    if ( isdefined( level._id_4903 ) )
        level._id_4903 _id_A546::_id_28E9();

    _id_A546::_id_0763( var_3, var_2, 0.5 );
    level._id_4903 = _id_A546::_id_2401( "timer", 0.5 );
    level._id_4903 _id_A546::_id_7FEE( "TOP", undefined, 0, 127 + var_4 );
    level._id_4903._id_01ED = 1;
    level._id_4903._id_01EB = 1;
    level._id_4903.color = ( 1, 1, 1 );
    level._id_4903 _meth_80CC( var_0 );
    level._id_4903.alpha = 0;
    level._id_4903 _meth_8086( 0.5 );
    level._id_4903.alpha = 1;
    wait 0.5;
    level._id_4903 endon( "death" );

    if ( isdefined( var_1 ) )
        wait(var_1);
    else
        return;

    level._id_4903 _meth_8086( var_5 );
    level._id_4903.alpha = 0;
    _id_A546::fade_hint_background( var_5 );
    wait(var_5);
    _id_A546::clear_hint_background();
    level._id_4903 _id_A546::_id_28E9();
}

_id_48CB( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( isdefined( level._id_4903 ) )
    {
        if ( var_0 > 0 )
            level._id_4903 _meth_8086( var_0 );

        level._id_4903.alpha = 0;
        _id_A546::fade_hint_background( var_0 );

        if ( var_0 > 0 )
            wait(var_0);
    }

    level notify( "clearing_hints" );
}

_id_5306( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_382E[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    foreach ( var_4 in level._id_265B[var_0] )
    {
        foreach ( var_6 in var_4 )
        {
            if ( _func_1A1( var_6 ) )
            {
                var_6 thread _id_A5A5::_id_5307( var_1, var_2 );
                continue;
            }

            var_6 delete();
        }
    }
}

_id_3E2E( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = "player_view_controller";

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    var_4 = var_0 _meth_8184( var_1 );
    var_5 = spawnturret( "misc_turret", var_4, var_3 );
    var_5.angles = var_0 _meth_8185( var_1 );
    var_5 _meth_80B3( "tag_turret" );
    var_5 _meth_804F( var_0, var_1, var_2, ( 0, 0, 0 ) );
    var_5 _meth_80C2();
    var_5 _meth_8056();
    var_5 _meth_8067( "manual" );
    return var_5;
}

_id_239F( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4 childthread _id_A5A5::_id_6FDF( var_0, self, var_1, var_2, var_3 );
    return var_4;
}

_id_7EE7( var_0, var_1 )
{
    if ( isdefined( self._id_9A97 ) )
        self._id_9A97 = [];

    if ( !isdefined( var_1 ) || var_1 )
        self._id_9A97[var_0] = 1;
    else
        self._id_9A97[var_0] = undefined;
}

_id_5096( var_0 )
{
    if ( !isdefined( self._id_9A97 ) )
        return 0;

    return isdefined( self._id_9A97[var_0] );
}

_id_8F10( var_0 )
{
    if ( !isdefined( self._id_8F19 ) )
        self._id_8F19 = [];

    if ( !isdefined( self._id_9A97 ) )
        self._id_9A97 = [];

    var_1 = [];
    var_2 = self _meth_8308();
    var_3 = self _meth_830E();

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( self._id_9A97[var_5] ) )
            continue;

        var_1[var_5] = [];
        var_1[var_5]["clip_left"] = self _meth_82F5( var_5, "left" );
        var_1[var_5]["clip_right"] = self _meth_82F5( var_5, "right" );
        var_1[var_5]["stock"] = self _meth_82F6( var_5 );
    }

    if ( !isdefined( var_0 ) )
        var_0 = "default";

    self._id_8F19[var_0] = [];

    if ( isdefined( self._id_9A97[var_3] ) )
    {
        var_7 = self _meth_8309();

        foreach ( var_5 in var_7 )
        {
            if ( !isdefined( self._id_9A97[var_5] ) )
            {
                var_3 = var_5;
                break;
            }
        }
    }

    self._id_8F19[var_0]["current_weapon"] = var_3;
    self._id_8F19[var_0]["inventory"] = var_1;
}

_id_74A0( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "default";

    if ( !isdefined( self._id_8F19 ) || !isdefined( self._id_8F19[var_0] ) )
        return;

    self _meth_830D();

    foreach ( var_3, var_2 in self._id_8F19[var_0]["inventory"] )
    {
        if ( _func_1E4( var_3 ) != "altmode" )
            self _meth_830B( var_3 );

        self _meth_82F3( var_3, var_2["clip_left"], "left" );
        self _meth_82F3( var_3, var_2["clip_right"], "right" );
        self _meth_82F4( var_3, var_2["stock"] );
    }

    var_4 = self._id_8F19[var_0]["current_weapon"];

    if ( var_4 != "none" )
        self _meth_8312( var_4 );
}

_id_3E78()
{
    var_0 = self _meth_8308();

    if ( isdefined( self._id_9A97 ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( isdefined( self._id_9A97[var_2] ) )
                var_0 = common_scripts\utility::_id_0CF6( var_0, var_2 );
        }
    }

    return var_0;
}

_id_3E79()
{
    var_0 = self _meth_8309();

    if ( isdefined( self._id_9A97 ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( isdefined( self._id_9A97[var_2] ) )
                var_0 = common_scripts\utility::_id_0CF6( var_0, var_2 );
        }
    }

    return var_0;
}

_id_3E77()
{
    var_0 = self _meth_830F();

    if ( isdefined( self._id_9A97 ) && isdefined( self._id_9A97[var_0] ) )
        var_0 = _id_3D6C();

    return var_0;
}

_id_3E76()
{
    var_0 = self _meth_830E();

    if ( isdefined( self._id_9A97 ) && isdefined( self._id_9A97[var_0] ) )
        var_0 = _id_3D6C();

    return var_0;
}

_id_3D6C()
{
    var_0 = _id_3E79();

    if ( var_0.size > 0 )
        var_1 = var_0[0];
    else
        var_1 = "none";

    return var_1;
}

_id_484D()
{
    switch ( self.code_classname )
    {
        case "script_model":
        case "script_vehicle":
        case "light_spot":
            self _meth_8056();
            break;
        case "script_brushmodel":
            self _meth_8056();
            self _meth_82BB();

            if ( self._id_03DA & 1 )
                self _meth_805A();

            break;
        case "trigger_radius":
        case "trigger_multiple":
        case "trigger_use":
        case "trigger_use_touch":
        case "trigger_multiple_flag_set":
        case "trigger_multiple_breachIcon":
        case "trigger_multiple_flag_lookat":
        case "trigger_multiple_flag_looking":
            common_scripts\utility::_id_97CC();
            break;
        default:
    }
}

_id_84CA()
{
    switch ( self.code_classname )
    {
        case "script_model":
        case "script_vehicle":
        case "light_spot":
            self _meth_8055();
            break;
        case "script_brushmodel":
            self _meth_8055();
            self _meth_82BA();

            if ( self._id_03DA & 1 )
                self _meth_8059();

            break;
        case "trigger_radius":
        case "trigger_multiple":
        case "trigger_use":
        case "trigger_use_touch":
        case "trigger_multiple_flag_set":
        case "trigger_multiple_breachIcon":
        case "trigger_multiple_flag_lookat":
        case "trigger_multiple_flag_looking":
            common_scripts\utility::_id_97CE();
            break;
        default:
    }
}

_id_062B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        self _meth_82B3( var_0, var_1, var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self _meth_82B3( var_0, var_1, var_2 );
    else
        self _meth_82B3( var_0, var_1 );
}

_id_7E81( var_0, var_1, var_2 )
{
    self notify( "set_moveplaybackrate" );
    self endon( "set_moveplaybackrate" );

    if ( isdefined( var_2 ) && var_2 )
        thread _id_7E82( var_0, var_1 );

    if ( !isdefined( self._id_5F66 ) )
        self._id_5F66 = self._id_5F65;

    if ( isdefined( var_1 ) )
    {
        var_3 = var_0 - self._id_5F65;
        var_4 = 0.05;
        var_5 = var_1 / var_4;
        var_6 = var_3 / var_5;

        while ( _func_0BE( var_0 - self._id_5F65 ) > _func_0BE( var_6 * 1.1 ) )
        {
            self._id_5F65 += var_6;
            wait(var_4);
        }
    }

    self._id_5F65 = var_0;
}

_id_749E( var_0, var_1 )
{
    self notify( "set_moveplaybackrate" );
    self endon( "set_moveplaybackrate" );

    if ( isdefined( var_1 ) && var_1 )
        thread _id_749F( var_0 );

    _id_7E81( self._id_5F66, var_0, 0 );
    self._id_5F66 = undefined;
}

_id_7E82( var_0, var_1 )
{
    self notify( "set_moveplaybackrate" );
    self endon( "set_moveplaybackrate" );

    if ( !isdefined( self._id_5F98 ) )
        self._id_5F98 = self._id_5F97;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_0 - self._id_5F97;
        var_3 = 0.05;
        var_4 = var_1 / var_3;
        var_5 = var_2 / var_4;

        while ( _func_0BE( var_0 - self._id_5F97 ) > _func_0BE( var_5 * 1.1 ) )
        {
            self._id_5F97 += var_5;
            wait(var_3);
        }
    }

    self._id_5F97 = var_0;
}

_id_749F( var_0 )
{
    self notify( "set_moveplaybackrate" );
    self endon( "set_moveplaybackrate" );
    _id_7E82( self._id_5F98, var_0 );
    self._id_5F98 = undefined;
}

_id_0D0B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    foreach ( var_7 in var_0 )
        var_7 thread _id_0798( var_1, var_2, var_3, var_4, var_5 );
}

_id_0D0D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = getentarray( var_0, "targetname" );
    _id_0D0B( var_6, var_1, var_2, var_3, var_4, var_5 );
}

_id_0D0C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = getentarray( var_0, "script_noteworthy" );
    _id_0D0B( var_6, var_1, var_2, var_3, var_4, var_5 );
}

_id_30BA()
{
    self._id_2D34 = 1;
}

_id_2A9A()
{
    self._id_2D34 = undefined;
}

_id_23DB( var_0 )
{
    if ( !isdefined( level._id_8FCE ) )
        level._id_8FCE = [];

    var_1 = spawnstruct();
    var_1._id_02A7 = var_0;
    level._id_8FCE[var_0] = var_1;
    return var_1;
}

_id_23DF( var_0 )
{
    if ( !isdefined( level._id_9E6D ) )
        level._id_9E6D = [];

    var_1 = spawnstruct();
    var_1._id_02A7 = var_0;
    var_1._id_85CD = 0;
    var_1._id_85CF = 0;
    var_1._id_85CE = 0;
    var_1._id_479F = 0;
    var_1._id_479E = 0;
    var_1._id_47A0 = 1000;
    level._id_9E6D[_func_123( var_0 )] = var_1;
    return var_1;
}

_id_3EBF( var_0 )
{
    if ( !isdefined( level._id_9E6D ) )
        level._id_9E6D = [];

    var_1 = level._id_9E6D[_func_123( var_0 )];

    if ( _id_9C21() && isdefined( var_1 ) && isdefined( var_1._id_4775 ) )
        var_1 = level._id_9E6D[_func_123( var_1._id_4775 )];

    return var_1;
}

_id_23B6( var_0 )
{
    if ( !isdefined( level._id_395D ) )
        level._id_395D = [];

    var_1 = spawnstruct();
    var_1._id_02A7 = var_0;
    level._id_395D[_func_123( var_0 )] = var_1;
    return var_1;
}

_id_3D76( var_0 )
{
    if ( !isdefined( level._id_395D ) )
        level._id_395D = [];

    var_1 = level._id_395D[_func_123( var_0 )];
    return var_1;
}

_id_4D56()
{
    if ( !isdefined( self._id_3961 ) )
    {
        self._id_3961 = spawnstruct();
        self._id_3961._id_3964 = "";
        self._id_3961._id_04B7 = 0;
    }
}

_id_9C21()
{
    if ( !isdefined( level._id_2153 ) )
        _id_7DF3();

    return _id_502F();
}

_id_395E( var_0, var_1 )
{
    if ( !_func_1AD( self ) )
        _id_A513::_id_4CF3();
    else
        _id_4D56();

    if ( !isdefined( level._id_395D ) )
        level._id_395D = [];

    var_2 = level._id_395D[_func_123( var_0 )];

    if ( !isdefined( var_2 ) )
        var_2 = level._id_9E6D[_func_123( var_0 )];

    if ( isdefined( var_2 ) && isdefined( var_2._id_4775 ) && _id_9C21() )
    {
        if ( isdefined( level._id_395D[_func_123( var_2._id_4775 )] ) )
            var_2 = level._id_395D[_func_123( var_2._id_4775 )];
        else if ( isdefined( level._id_9E6D ) )
            var_2 = level._id_9E6D[_func_123( var_2._id_4775 )];
    }

    if ( !isdefined( var_1 ) )
        var_1 = var_2._id_971C;

    if ( !_func_1AD( self ) )
    {
        common_scripts\utility::_id_7E36( var_2, var_1 );
        level._id_3961._id_3964 = var_0;
        level._id_3961._id_04B7 = var_1;
    }
    else
    {
        if ( var_0 != "" && self._id_3961._id_3964 == var_0 && self._id_3961._id_04B7 == var_1 )
            return;

        common_scripts\utility::_id_7E36( var_2, var_1 );
        self._id_3961._id_3964 = var_0;
        self._id_3961._id_04B7 = var_1;
    }
}

_id_9E6E( var_0, var_1 )
{
    var_2 = _id_9E6C( var_0, var_1 );

    if ( var_2 )
    {
        if ( level._id_00E3 && isdefined( _id_3EBF( var_0 + "_cg" ) ) )
            _id_395E( var_0 + "_cg", var_1 );
        else if ( isdefined( _id_3EBF( var_0 ) ) )
            _id_395E( var_0, var_1 );
        else
            _func_237( var_1 );
    }
}

_id_4D57()
{
    if ( !isdefined( self._id_9E72 ) )
    {
        self._id_9E72 = spawnstruct();
        self._id_9E72._id_9E6B = "";
        self._id_9E72._id_04B7 = 0;
    }
}

_id_9E6C( var_0, var_1 )
{
    if ( !_func_1AD( self ) )
    {
        var_2 = 1;

        if ( !isdefined( level._id_9E72 ) )
        {
            level._id_9E72 = spawnstruct();
            level._id_9E72._id_9E6B = "";
            level._id_9E72._id_04B7 = 0;
            var_2 = 0;
        }

        if ( var_0 != "" && level._id_9E72._id_9E6B == var_0 && level._id_9E72._id_04B7 == var_1 )
            return 0;

        level._id_9E72._id_9E6B = var_0;
        level._id_9E72._id_04B7 = var_1;

        if ( var_2 && getdvarint( "scr_art_tweak" ) != 0 )
        {

        }
        else
            _id_7F00( var_0, var_1 );

        level._id_58BC = var_0;
        setdvar( "vision_set_current", var_0 );
    }
    else
    {
        _id_4D57();

        if ( var_0 != "" && self._id_9E72._id_9E6B == var_0 && self._id_9E72._id_04B7 == var_1 )
            return 0;

        self._id_9E72._id_9E6B = var_0;
        self._id_9E72._id_04B7 = var_1;
        _id_7F01( var_0, var_1 );
    }

    return 1;
}

_id_30FA()
{
    thread _id_30FB();
}

_id_30FB()
{
    self endon( "death" );

    for (;;)
    {
        self._id_91F1 = 1;
        wait 0.05;
    }
}

_id_2ADF()
{
    self._id_91F1 = undefined;
}

_id_061D( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        _func_189( var_0, var_1, var_2, var_3 );
    else
        _func_189( var_0, var_1, var_2, var_3, var_4 );
}

_id_59D3( var_0 )
{
    var_1 = getentarray( "destructible_toy", "targetname" );
    var_2 = getentarray( "destructible_vehicle", "targetname" );
    var_3 = common_scripts\utility::_id_0CDD( var_1, var_2 );

    foreach ( var_5 in var_0 )
        var_5._id_293A = [];

    foreach ( var_8 in var_3 )
    {
        foreach ( var_5 in var_0 )
        {
            if ( !var_5 _meth_80AB( var_8 ) )
                continue;

            var_5 _id_A5A5::_id_7064( var_8 );
            break;
        }
    }
}

_id_4EA7()
{
    var_0 = [];
    var_0[0] = [ "interactive_birds", "targetname" ];
    var_0[1] = [ "interactive_vulture", "targetname" ];
    var_0[2] = [ "interactive_fish", "script_noteworthy" ];
    return var_0;
}

_id_59D5( var_0 )
{
    var_1 = _id_4EA7();
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        var_5 = getentarray( var_4[0], var_4[1] );
        var_2 = common_scripts\utility::_id_0CDD( var_2, var_5 );
    }

    foreach ( var_8 in var_2 )
    {
        if ( !isdefined( level._id_05D3[var_8._id_4EA5]._id_781F ) )
            continue;

        foreach ( var_11 in var_0 )
        {
            if ( !var_11 _meth_80AB( var_8 ) )
                continue;

            if ( !isdefined( var_11._id_4EA8 ) )
                var_11._id_4EA8 = [];

            var_11._id_4EA8[var_11._id_4EA8.size] = var_8 [[ level._id_05D3[var_8._id_4EA5]._id_781F ]]();
        }
    }
}

_id_06FF()
{
    if ( !isdefined( self._id_4EA8 ) )
        return;

    foreach ( var_1 in self._id_4EA8 )
        var_1 [[ level._id_05D3[var_1._id_4EA5]._id_57D5 ]]();

    self._id_4EA8 = undefined;
}

_id_2815( var_0 )
{
    _id_59D5( var_0 );

    foreach ( var_2 in var_0 )
        var_2._id_4EA8 = undefined;
}

_id_59D4( var_0 )
{
    if ( getdvar( "createfx" ) != "" )
        return;

    var_1 = getentarray( "script_brushmodel", "classname" );
    var_2 = getentarray( "script_model", "classname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_1[var_1.size] = var_2[var_3];

    foreach ( var_5 in var_0 )
    {
        foreach ( var_7 in var_1 )
        {
            if ( isdefined( var_7._id_7AA6 ) )
                var_7._id_79BF = var_7._id_7AA6;

            if ( !isdefined( var_7._id_79BF ) )
                continue;

            if ( !isdefined( var_7._id_029C ) )
                continue;

            if ( var_7.code_classname != "script_model" )
                continue;

            if ( !var_7 _meth_80AB( var_5 ) )
                continue;

            var_7._id_59D6 = 1;
        }
    }
}

_id_06FA()
{
    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );

    foreach ( var_2 in level._id_2417 )
    {
        if ( !isdefined( var_2._id_9C42["masked_exploder"] ) )
            continue;

        var_0._id_02E2 = var_2._id_9C42["origin"];
        var_0.angles = var_2._id_9C42["angles"];

        if ( !var_0 _meth_80AB( self ) )
            continue;

        var_3 = var_2._id_9C42["masked_exploder"];
        var_4 = var_2._id_9C42["masked_exploder_spawnflags"];
        var_5 = var_2._id_9C42["masked_exploder_script_disconnectpaths"];
        var_6 = spawn( "script_model", ( 0, 0, 0 ), var_4 );
        var_6 _meth_80B3( var_3 );
        var_6._id_02E2 = var_2._id_9C42["origin"];
        var_6.angles = var_2._id_9C42["angles"];
        var_2._id_9C42["masked_exploder"] = undefined;
        var_2._id_9C42["masked_exploder_spawnflags"] = undefined;
        var_2._id_9C42["masked_exploder_script_disconnectpaths"] = undefined;
        var_6._id_2B34 = var_5;
        var_6._id_79BF = var_2._id_9C42["exploder"];
        common_scripts\_exploder::_id_814F( var_6 );
        var_2._id_029C = var_6;
    }

    var_0 delete();
}

_id_6EBA( var_0 )
{
    var_1 = common_scripts\_destructible_types::getinfoindex( var_0 );

    if ( var_1 != -1 )
        return;

    if ( !isdefined( level._id_2911 ) )
        level._id_2911 = [];

    var_2 = spawnstruct();
    var_2.destuctableinfo = common_scripts\_destructible_types::maketype( var_0 );
    var_2 thread common_scripts\_destructible::_id_6EBB();
}

_id_2809( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
        var_3._id_293A = [];

    var_5 = [ "destructible_toy", "destructible_vehicle" ];
    var_6 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    foreach ( var_8 in var_5 )
    {
        var_9 = getentarray( var_8, "targetname" );

        foreach ( var_11 in var_9 )
        {
            foreach ( var_3 in var_0 )
            {
                if ( var_1 )
                {
                    var_6++;
                    var_6 %= 5;

                    if ( var_6 == 1 )
                        wait 0.05;
                }

                if ( !var_3 _meth_80AB( var_11 ) )
                    continue;

                var_11 delete();
                break;
            }
        }
    }
}

_id_280F( var_0, var_1 )
{
    var_2 = getentarray( "script_brushmodel", "classname" );
    var_3 = getentarray( "script_model", "classname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_2[var_2.size] = var_3[var_4];

    var_5 = [];
    var_6 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_7 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    foreach ( var_9 in var_0 )
    {
        foreach ( var_11 in var_2 )
        {
            if ( !isdefined( var_11._id_79BF ) )
                continue;

            var_6._id_02E2 = var_11 _meth_8097();

            if ( !var_9 _meth_80AB( var_6 ) )
                continue;

            var_5[var_5.size] = var_11;
        }
    }

    _id_0CE5( var_5 );
    var_6 delete();
}

_id_06F7()
{
    if ( !isdefined( self._id_293A ) )
        return;

    foreach ( var_1 in self._id_293A )
    {
        var_2 = spawn( "script_model", ( 0, 0, 0 ) );
        var_2 _meth_80B3( var_1._id_948C );
        var_2._id_02E2 = var_1._id_02E2;
        var_2.angles = var_1.angles;
        var_2._id_0398 = var_1._id_0398;
        var_2._id_04A6 = var_1._id_04A6;
        var_2._id_04A4 = var_1._id_04A4;
        var_2._id_7A26 = var_1._id_7A26;
        var_2._id_0117 = var_1._id_0117;
        var_2._id_7A7E = var_1._id_7A7E;
        var_2 common_scripts\_destructible::_id_80B1( 1 );
    }

    self._id_293A = [];
}

_id_7F71( var_0 )
{
    self._id_38A8 = var_0;
}

_id_38A7()
{
    var_0 = self._id_38B1 - gettime();

    if ( var_0 < 0 )
        return 0;

    return var_0 * 0.001;
}

_id_38A9()
{
    return _id_38A7() > 0;
}

_id_38AB( var_0 )
{
    if ( isdefined( self._id_38A8 ) && self._id_38A8 )
        return;

    var_1 = gettime() + var_0 * 1000.0;

    if ( isdefined( self._id_38B1 ) )
        self._id_38B1 = _func_0E1( self._id_38B1, var_1 );
    else
        self._id_38B1 = var_1;

    self notify( "flashed" );
    self _meth_816F( 1 );
}

_id_A0C7()
{
    for (;;)
    {
        var_0 = _func_0DA( "axis", "all" );
        var_1 = 0;

        foreach ( var_3 in var_0 )
        {
            if ( !_func_1A1( var_3 ) )
                continue;

            if ( var_3 _meth_80AB( self ) )
            {
                var_1 = 1;
                break;
            }

            wait 0.0125;
        }

        if ( !var_1 )
        {
            var_5 = _id_3CB8( "axis" );

            if ( !var_5.size )
                break;
        }

        wait 0.05;
    }
}

_id_A0C8()
{
    var_0 = 0;

    for (;;)
    {
        var_1 = _func_0DA( "axis", "all" );
        var_2 = 0;

        foreach ( var_4 in var_1 )
        {
            if ( !_func_1A1( var_4 ) )
                continue;

            if ( var_4 _meth_80AB( self ) )
            {
                if ( var_4 _id_2CE7() )
                    continue;

                var_2 = 1;
                var_0 = 1;
                break;
            }

            wait 0.0125;
        }

        if ( !var_2 )
        {
            var_6 = _id_3CB8( "axis" );

            if ( !var_6.size )
                break;
            else
                var_0 = 1;
        }

        wait 0.05;
    }

    return var_0;
}

_id_A0C9( var_0 )
{
    _id_A0C7();
    common_scripts\utility::_id_383F( var_0 );
}

_id_A0BD( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_2 _id_A0C9( var_1 );
}

_id_6A96()
{
    level._id_0318 _id_32DA( "player_zero_attacker_accuracy" );
    level._id_0318._id_0200 = 0;
    level._id_0318 _id_A537::_id_9AD3();
}

_id_6AA1()
{
    level._id_0318 _id_32DE( "player_zero_attacker_accuracy" );
    level._id_0318.attackeraccuracy = 0;
    level._id_0318._id_0200 = 1;
}

_id_7E98( var_0 )
{
    var_1 = _id_3E25();
    var_1._id_4441._id_6A64 = var_0;
    var_1 _id_A537::_id_9AD3();
}

_id_0CEB( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
        var_1[var_3._id_7A99] = var_3;

    return var_1;
}

_id_0CEA( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
        var_1[var_3.classname] = var_3;

    return var_1;
}

_id_0CEC( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3._id_7A18;

        if ( isdefined( var_4 ) )
            var_1[var_4] = var_3;
    }

    return var_1;
}

_id_07A3( var_0 )
{
    if ( isdefined( var_0 ) )
        self._id_685A = var_0;
    else
        self._id_685A = getent( self._id_04A4, "targetname" );

    self _meth_804F( self._id_685A );
}

_id_38AC()
{
    self._id_38B1 = undefined;
    self _meth_816F( 0 );
}

_id_3F82( var_0, var_1 )
{
    var_2 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    return common_scripts\utility::_id_40FB( var_0, var_1 );
}

_id_43E9()
{
    thread _id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    _id_2A6E( var_0 );
}

_id_31B8()
{
    self waittill( "death" );
    waitframe;
    self notify( "end_explode" );
}

_id_2A6E( var_0 )
{
    _func_1C7( "grenade_rumble", var_0 );
    _func_18C( 0.3, 0.5, var_0, 400 );

    foreach ( var_2 in level._id_0323 )
    {
        if ( _func_0EE( var_0, var_2._id_02E2 ) > 600 )
            continue;

        if ( var_2 _meth_81DA( var_0 ) )
            var_2 thread _id_2A70( var_0 );
    }
}

_id_6BE5( var_0, var_1, var_2, var_3 )
{
    return _id_6BE3( "shotgun", level._id_0318, var_0, var_1, var_2, var_3 );
}

_id_6BE3( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._id_0318;

    var_1 _meth_811B( 0 );
    var_1 _meth_811C( 0 );
    var_1 _meth_831A();
    var_6 = common_scripts\utility::_id_8959();
    var_6 _meth_804F( self, "tag_passenger", _id_6BE4( var_0 ), ( 0, 0, 0 ) );
    var_6._id_6ACE = common_scripts\utility::_id_8959();
    var_6._id_6ACE _meth_804F( self, "tag_body", _id_6BE2( var_0 ), ( 0, 0, 0 ) );

    if ( !isdefined( var_2 ) )
        var_2 = 90;

    if ( !isdefined( var_3 ) )
        var_3 = 90;

    if ( !isdefined( var_4 ) )
        var_4 = 40;

    if ( !isdefined( var_5 ) )
        var_5 = 40;

    var_1 _meth_831A();
    var_1 _meth_807E( var_6, "tag_origin", 0.8, var_2, var_3, var_4, var_5 );
    var_1._id_4B06 = var_6;
    return var_6;
}

_id_6BE4( var_0 )
{
    switch ( var_0 )
    {
        case "shotgun":
            return ( -5, 10, -34 );
        case "backleft":
            return ( -45, 45, -34 );
        case "backright":
            return ( -45, 5, -34 );
    }
}

_id_6BE2( var_0 )
{
    switch ( var_0 )
    {
        case "shotgun":
            return ( -8, -90, -12.6 );
        case "backleft":
            return ( -58, 85, -12.6 );
        case "backright":
            return ( -58, -95, -12.6 );
    }
}

_id_6B87( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = self;
    var_2 = level._id_0318;

    if ( _func_1AD( self ) )
    {
        var_2 = self;
        var_1 = var_2._id_4B06;
    }

    var_1 _meth_8051();

    if ( !var_0 )
    {
        var_3 = 0.6;
        var_1 _meth_82AA( var_1._id_6ACE._id_02E2, var_3, var_3 * 0.5, var_3 * 0.5 );
        wait(var_3);
    }

    var_2 _meth_8051();
    var_2 _meth_831B();
    var_2 _meth_811B( 1 );
    var_2 _meth_811C( 1 );
    var_2._id_4B06 = undefined;
    var_1._id_6ACE delete();
    var_1 delete();
}

_id_2A70( var_0, var_1 )
{
    var_2 = _id_791D( var_0 );

    foreach ( var_5, var_4 in var_2 )
        thread _id_A537::_id_43E7( var_5 );
}

_id_14BA( var_0 )
{
    if ( !isdefined( self._id_258D ) )
        return;

    var_1 = _id_791D( self._id_258D._id_02E2 );

    foreach ( var_4, var_3 in var_1 )
        thread _id_A537::_id_14B6( var_4 );
}

_id_791D( var_0 )
{
    var_1 = _func_114( anglestoforward( self.angles ) );
    var_2 = _func_114( anglestoright( self.angles ) );
    var_3 = _func_114( var_0 - self._id_02E2 );
    var_4 = _func_0F6( var_3, var_1 );
    var_5 = _func_0F6( var_3, var_2 );
    var_6 = [];
    var_7 = self _meth_830E();

    if ( var_4 > 0 && var_4 > 0.5 && _func_1B7( var_7 ) != "riotshield" )
        var_6["bottom"] = 1;

    if ( _func_0BE( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            var_6["right"] = 1;
        else
            var_6["left"] = 1;
    }

    return var_6;
}

_id_66EF( var_0 )
{
    if ( !isdefined( self._id_63B4 ) )
        self._id_63B4 = self._id_02FA;

    self._id_02FA = var_0;
}

_id_66F0()
{
    if ( isdefined( self._id_63B4 ) )
        return;

    self._id_63B4 = self._id_02FA;
    self._id_02FA = 0;
}

_id_66EE()
{
    self._id_02FA = self._id_63B4;
    self._id_63B4 = undefined;
}

_id_A10D()
{
    if ( isdefined( self._id_63C0 ) )
        return;

    self._id_63BF = self._id_050F;
    self._id_63C0 = self._id_0510;
    self._id_050F = 0;
    self._id_0510 = 0;
}

_id_A10B()
{
    if ( !isdefined( self._id_63C0 ) )
    {
        self._id_63BF = self._id_050F;
        self._id_63C0 = self._id_0510;
    }

    self._id_050F = 999999999;
    self._id_0510 = 999999999;
}

_id_50A0()
{
    return isdefined( self._id_63C0 ) || isdefined( self._id_63BF );
}

_id_A10C()
{
    self._id_050F = self._id_63BF;
    self._id_0510 = self._id_63C0;
    self._id_63BF = undefined;
    self._id_63C0 = undefined;
}

_id_30CC()
{
    thread _id_4BB8();
}

_id_4BB8()
{
    self endon( "disable_ignorerandombulletdamage_drone" );
    self endon( "death" );
    self._id_0200 = 1;
    self._id_3652 = self._id_01E6;
    self._id_01E6 = 1000000;

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !_func_1AD( var_1 ) && _func_0D1( var_1 ) )
        {
            if ( isdefined( var_1._id_0142 ) && var_1._id_0142 != self )
                continue;
        }

        self._id_3652 -= var_0;

        if ( self._id_3652 <= 0 )
            break;
    }

    self _meth_8054();
}

_id_7DE4( var_0 )
{
    self._id_04EF = var_0;
}

_id_2AAE()
{
    if ( !_func_1A1( self ) )
        return;

    if ( !isdefined( self._id_0200 ) )
        return;

    self notify( "disable_ignorerandombulletdamage_drone" );
    self._id_0200 = undefined;
    self._id_01E6 = self._id_3652;
}

_id_936E( var_0 )
{
    var_1 = spawnstruct();
    var_1 _id_27EF( var_0, ::_id_7C82, "timeout" );
    return var_1;
}

_id_27EF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread _id_A5A5::_id_27F1( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_27CF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    childthread _id_A5A5::_id_27D0( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_386F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );

    if ( !_func_0CE( var_0 ) )
        var_0 = [ var_0, 0 ];

    thread _id_A5A5::_id_3870( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_A0F5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );

    if ( !_func_0CE( var_0 ) )
        var_0 = [ var_0, 0 ];

    thread _id_A5A5::_id_A0F6( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_30B4( var_0 )
{
    var_0 *= 1000;
    self._id_0127 = 1;
    self._id_0104 = var_0;
    self._id_6097 = undefined;
}

_id_2A90()
{
    self._id_0127 = 0;
    self._id_6097 = 1;
}

_id_7E54( var_0, var_1 )
{
    level._id_0885 = var_0;
    level._id_0884 = var_1;
}

_id_742F( var_0 )
{
    level._id_5574[var_0] = gettime();
}

_id_7DFC( var_0 )
{
    level._id_2545 = var_0;
    thread _id_A537::_id_745C();
}

_id_1EA9()
{
    level._id_2545 = undefined;
    thread _id_A537::_id_745C();
}

_id_7F0C( var_0, var_1, var_2 )
{
    _id_A511::_id_4D79();

    if ( isdefined( var_2 ) )
        level._id_A32C._id_9C65 = var_2;

    level._id_A32C._id_0355 = var_1;
    level._id_A32C._id_0523 = var_0;
    level notify( "windchange", "strong" );
}

_id_8F56( var_0 )
{
    if ( var_0.size > 1 )
        return 0;

    var_1 = [];
    var_1["0"] = 1;
    var_1["1"] = 1;
    var_1["2"] = 1;
    var_1["3"] = 1;
    var_1["4"] = 1;
    var_1["5"] = 1;
    var_1["6"] = 1;
    var_1["7"] = 1;
    var_1["8"] = 1;
    var_1["9"] = 1;

    if ( isdefined( var_1[var_0] ) )
        return 1;

    return 0;
}

_id_7DE0( var_0, var_1 )
{
    level._id_132D[var_0] = var_1;
    _id_A5A5::_id_9AA1();
}

_id_62EB( var_0 )
{
    for ( var_1 = 0; var_1 < 8; var_1++ )
        _func_112( var_0, var_1, ( 0, 0, 0 ) );
}

_id_3DDB( var_0 )
{
    var_1 = [];
    var_1["minutes"] = 0;

    for ( var_1["seconds"] = _func_0BC( var_0 / 1000 ); var_1["seconds"] >= 60; var_1["seconds"] -= 60 )
        var_1["minutes"]++;

    if ( var_1["seconds"] < 10 )
        var_1["seconds"] = "0" + var_1["seconds"];

    return var_1;
}

_id_6B4B( var_0 )
{
    var_1 = level._id_0318 _meth_8309();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return 1;
    }

    return 0;
}

_id_62B1( var_0 )
{
    if ( !isdefined( level._id_62B2 ) )
        level._id_62B2 = [];

    if ( !isdefined( level._id_62B2[var_0] ) )
        level._id_62B2[var_0] = level._id_62B2.size + 1;

    return level._id_62B2[var_0];
}

_id_62C1( var_0 )
{
    return isdefined( level._id_62B2 ) && isdefined( level._id_62B2[var_0] );
}

_id_6BA2( var_0 )
{
    self _meth_80FE( var_0 );
    self._id_2E18 = var_0;
}

_id_6AD1()
{
    self _meth_80FF();
    self._id_2E18 = undefined;
}

_id_42FE( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_4 - var_2;
    var_6 = var_3 - var_1;
    var_7 = var_5 / var_6;
    var_0 -= var_3;
    var_0 = var_7 * var_0;
    var_0 += var_4;
    return var_0;
}

_id_3097()
{
    self._id_7142 = 1;
}

_id_2A72()
{
    self._id_7142 = undefined;
}

_id_3098( var_0 )
{
    var_0 _id_3097();
}

_id_2A73( var_0 )
{
    var_0 _id_2A72();
}

enable_achievement_reinforcement_denied( var_0, var_1 )
{
    self.h1_achieve_reinforce_denied_heli = var_0;
    self.h1_achieve_reinforce_denied_rig = var_1;
    thread h1_achievement_reinforcement_denied_watch();
}

disable_achievement_reinforcement_denied()
{
    self notify( "stop_reinforce_denied_watch" );
}

h1_achievement_reinforcement_denied_watch()
{
    self endon( "stop_reinforce_denied_watch" );
    self waittill( "rope_death", var_0 );

    if ( var_0 == level._id_0318 )
    {
        var_1 = self.h1_achieve_reinforce_denied_heli;
        var_2 = self.h1_achieve_reinforce_denied_rig;

        if ( !isdefined( var_1.h1_achieve_reinforce_denied_count ) || !isdefined( var_1.h1_achieve_reinforce_denied_count[var_2] ) )
            var_1.h1_achieve_reinforce_denied_count[var_2] = 0;

        var_1.h1_achieve_reinforce_denied_count[var_2]++;

        if ( var_1.h1_achieve_reinforce_denied_count[var_2] == 3 )
            _id_41DD( "REINFORCEMENT_DENIED" );
    }
}

_id_6007( var_0 )
{
    var_1 = _func_1BB( "sound/soundlength.csv", 0, var_0, 1 );

    if ( !isdefined( var_1 ) || var_1 == "" )
        return -1;

    var_1 = _func_0BC( var_1 );
    var_1 *= 0.001;
    return var_1;
}

_id_500A( var_0 )
{
    var_1 = _func_0E0( var_0 );
    return var_1["count"];
}

_id_576B( var_0, var_1, var_2 )
{
    var_3 = var_2 - var_1;
    var_4 = var_0 * var_3;
    var_5 = var_1 + var_4;
    return var_5;
}

_id_27B8( var_0 )
{
    level._id_57D6 = var_0;
}

_id_927B( var_0 )
{
    _id_27B8( var_0 );
    level._id_927C = var_0;
}

_id_927D( var_0 )
{
    level._id_110D = var_0;
}

_id_3B91( var_0, var_1 )
{
    thread _id_3B92( var_0, var_1 );
}

_id_3B92( var_0, var_1 )
{
    var_2 = getent( var_0, "script_noteworthy" );
    var_2 notify( "new_volume_command" );
    var_2 endon( "new_volume_command" );
    wait 0.05;
    _id_3B90( var_2, var_1 );
}

_id_3B90( var_0, var_1 )
{
    var_0._id_3B78 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
        _id_0D14( var_0._id_3B23, common_scripts\utility::_id_671F );
    else
        common_scripts\utility::_id_0D13( var_0._id_3B23, common_scripts\utility::_id_671F );
}

_id_0D14( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 5;

    var_4 = [];

    foreach ( var_6 in var_0 )
    {
        var_4[var_4.size] = var_6;
        var_3++;
        var_3 %= var_2;

        if ( var_2 == 0 )
        {
            common_scripts\utility::_id_0D13( var_4, var_1 );
            wait 0.05;
            var_4 = [];
        }
    }
}

_id_3B94( var_0 )
{
    thread _id_3B95( var_0 );
}

_id_3B95( var_0 )
{
    var_1 = getent( var_0, "script_noteworthy" );
    var_1 notify( "new_volume_command" );
    var_1 endon( "new_volume_command" );
    wait 0.05;

    if ( !isdefined( var_1._id_3B78 ) )
        return;

    var_1._id_3B78 = undefined;
    _id_3B93( var_1 );
}

_id_3B93( var_0 )
{
    common_scripts\utility::_id_0D13( var_0._id_3B23, ::_id_748D );
}

_id_3836( var_0 )
{
    if ( !isdefined( level._id_3834 ) )
        level._id_3834 = [];

    if ( !isdefined( level._id_3834[var_0] ) )
        level._id_3834[var_0] = 1;
    else
        level._id_3834[var_0]++;
}

_id_3835( var_0 )
{
    level._id_3834[var_0]--;
    level._id_3834[var_0] = _func_0BC( _func_0E1( 0, level._id_3834[var_0] ) );

    if ( level._id_3834[var_0] )
        return;

    common_scripts\utility::_id_383F( var_0 );
}

_id_3837( var_0, var_1 )
{
    level._id_3834[var_0] = var_1;
}

_id_0741( var_0, var_1 )
{
    if ( !isdefined( level._id_1E6A ) )
        level._id_1E6A = [];

    if ( !isdefined( level._id_1E6A[var_1] ) )
        level._id_1E6A[var_1] = [];

    level._id_1E6A[var_1][level._id_1E6A[var_1].size] = var_0;
}

_id_1E6A( var_0 )
{
    var_1 = level._id_1E6A[var_0];
    var_1 = common_scripts\utility::_id_0D01( var_1 );
    _id_0CE5( var_1 );
    level._id_1E6A[var_0] = undefined;
}

_id_1E6B( var_0 )
{
    if ( !isdefined( level._id_1E6A ) )
        return;

    if ( !isdefined( level._id_1E6A[var_0] ) )
        return;

    var_1 = level._id_1E6A[var_0];
    var_1 = common_scripts\utility::_id_0D01( var_1 );

    foreach ( var_3 in var_1 )
    {
        if ( !_func_0CF( var_3 ) )
            continue;

        if ( !_func_1A1( var_3 ) )
            continue;

        if ( !isdefined( var_3._id_58D7 ) )
            continue;

        if ( !var_3._id_58D7 )
            continue;

        var_3 _id_8EA4();
    }

    _id_0CE5( var_1 );
    level._id_1E6A[var_0] = undefined;
}

_id_07B6( var_0 )
{
    if ( !isdefined( self._id_97A0 ) )
        thread _id_A5A5::_id_07B5();

    self._id_97A0[self._id_97A0.size] = var_0;
}

_id_3EEC()
{
    var_0 = [];
    var_1 = getentarray();

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3.classname ) )
            continue;

        if ( _func_120( var_3.classname, "weapon_" ) )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_70BA( var_0 )
{
    level._id_78B9[var_0] = var_0;
}

_id_5F42( var_0, var_1, var_2 )
{
    self notify( "newmove" );
    self endon( "newmove" );

    if ( !isdefined( var_2 ) )
        var_2 = 200;

    var_3 = _func_0EE( self._id_02E2, var_0 );
    var_4 = var_3 / var_2;
    var_5 = _func_114( var_0 - self._id_02E2 );
    self _meth_82AA( var_0, var_4, 0, 0 );
    self _meth_82B1( var_1, var_4, 0, 0 );
    wait(var_4);

    if ( !isdefined( self ) )
        return;

    self._id_0500 = var_5 * var_3 / var_4;
}

_id_383E( var_0 )
{
    level endon( var_0 );
    self waittill( "death" );
    common_scripts\utility::_id_383F( var_0 );
}

_id_30B2()
{
    level._id_259F = 1;
}

_id_2A8E()
{
    level._id_259F = 0;
}

_id_5011()
{
    if ( !getdvarint( "cg_drawDamageFeedbackOption" ) )
        return 0;

    return isdefined( level._id_259F ) && level._id_259F;
}

_id_30B3()
{
    level._id_25A0 = 1;
}

_id_2A8F()
{
    level._id_25A0 = 0;
}

_id_5012()
{
    return isdefined( level._id_25A0 ) && level._id_25A0;
}

_id_074C()
{
    _id_A524::_id_5E3F();
}

_id_733D()
{
    _id_A524::_id_8EF9();
}

_id_5017()
{
    if ( getdvar( "e3demo" ) == "1" )
        return 1;

    return 0;
}

_id_286E( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::_id_40FD( var_0, var_1 );
    _id_286F( var_3, var_2 );
}

_id_286D( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0._id_0396;

    if ( isdefined( var_1 ) && isdefined( level._id_8F64["script_linkname"] ) && isdefined( level._id_8F64["script_linkname"][var_1] ) )
    {
        foreach ( var_4, var_3 in level._id_8F64["script_linkname"][var_1] )
        {
            if ( isdefined( var_3 ) && var_0 == var_3 )
                level._id_8F64["script_linkname"][var_1][var_4] = undefined;
        }

        if ( level._id_8F64["script_linkname"][var_1].size == 0 )
            level._id_8F64["script_linkname"][var_1] = undefined;
    }

    var_1 = var_0._id_0398;

    if ( isdefined( var_1 ) && isdefined( level._id_8F64["script_noteworthy"] ) && isdefined( level._id_8F64["script_noteworthy"][var_1] ) )
    {
        foreach ( var_4, var_3 in level._id_8F64["script_noteworthy"][var_1] )
        {
            if ( isdefined( var_3 ) && var_0 == var_3 )
                level._id_8F64["script_noteworthy"][var_1][var_4] = undefined;
        }

        if ( level._id_8F64["script_noteworthy"][var_1].size == 0 )
            level._id_8F64["script_noteworthy"][var_1] = undefined;
    }

    var_1 = var_0._id_04A4;

    if ( isdefined( var_1 ) && isdefined( level._id_8F64["target"] ) && isdefined( level._id_8F64["target"][var_1] ) )
    {
        foreach ( var_4, var_3 in level._id_8F64["target"][var_1] )
        {
            if ( isdefined( var_3 ) && var_0 == var_3 )
                level._id_8F64["target"][var_1][var_4] = undefined;
        }

        if ( level._id_8F64["target"][var_1].size == 0 )
            level._id_8F64["target"][var_1] = undefined;
    }

    var_1 = var_0._id_04A6;

    if ( isdefined( var_1 ) && isdefined( level._id_8F64["targetname"] ) && isdefined( level._id_8F64["targetname"][var_1] ) )
    {
        foreach ( var_4, var_3 in level._id_8F64["targetname"][var_1] )
        {
            if ( isdefined( var_3 ) && var_0 == var_3 )
                level._id_8F64["targetname"][var_1][var_4] = undefined;
        }

        if ( level._id_8F64["targetname"][var_1].size == 0 )
            level._id_8F64["targetname"][var_1] = undefined;
    }

    if ( isdefined( level._id_8F60 ) )
    {
        foreach ( var_4, var_3 in level._id_8F60 )
        {
            if ( var_0 == var_3 )
                level._id_8F60[var_4] = undefined;
        }
    }
}

_id_286F( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !_func_0CE( var_0 ) || var_0.size == 0 )
        return;

    var_1 = common_scripts\utility::_id_9294( isdefined( var_1 ), var_1, 0 );
    var_1 = common_scripts\utility::_id_9294( var_1 > 0, var_1, 0 );

    if ( var_1 > 0 )
    {
        foreach ( var_3 in var_0 )
        {
            _id_286D( var_3 );
            wait(var_1);
        }
    }
    else
    {
        foreach ( var_3 in var_0 )
            _id_286D( var_3 );
    }
}

_id_40FC( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_40FB( var_0, var_1 );
    _id_286D( var_2 );
    return var_2;
}

_id_40FE( var_0, var_1, var_2 )
{
    var_3 = common_scripts\utility::_id_40FD( var_0, var_1 );
    _id_286F( var_3, var_2 );
    return var_3;
}

_id_3F83( var_0, var_1 )
{
    var_2 = _id_3F82( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = _func_0C3( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = _func_1EC( var_0, var_1 );

    return var_2;
}

_id_7F66( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_3 ) )
        self._id_3318 = var_3;
    else
        self._id_3318 = ( 0, 0, 0 );

    if ( isdefined( var_4 ) )
        self._id_3319 = var_4;

    self notify( "new_head_icon" );
    var_5 = _func_1A9();
    var_5.archived = 1;
    var_5.alpha = 0.8;
    var_5 _meth_80CE( var_0, var_1, var_2 );
    var_5 _meth_80DA( 0, 0, 0, 1 );
    self._id_3317 = var_5;
    _id_9B18();
    thread _id_9B17();
    thread _id_28EB();
}

_id_73A1()
{
    if ( !isdefined( self._id_3317 ) )
        return;

    self._id_3317 _meth_808A();
}

_id_9B17()
{
    self endon( "new_head_icon" );
    self endon( "death" );
    var_0 = self._id_02E2;

    for (;;)
    {
        if ( var_0 != self._id_02E2 )
        {
            _id_9B18();
            var_0 = self._id_02E2;
        }

        wait 0.05;
    }
}

_id_9B18()
{
    if ( isdefined( self._id_3319 ) )
    {
        var_0 = self [[ self._id_3319 ]]();

        if ( isdefined( var_0 ) )
        {
            self._id_3317._id_0530 = self._id_3318[0] + var_0[0];
            self._id_3317._id_0538 = self._id_3318[1] + var_0[1];
            self._id_3317._id_053B = self._id_3318[2] + var_0[2];
            return;
        }
    }

    self._id_3317._id_0530 = self._id_02E2[0] + self._id_3318[0];
    self._id_3317._id_0538 = self._id_02E2[1] + self._id_3318[1];
    self._id_3317._id_053B = self._id_02E2[2] + self._id_3318[2];
}

_id_28EB()
{
    self endon( "new_head_icon" );
    self waittill( "death" );

    if ( !isdefined( self._id_3317 ) )
        return;

    self._id_3317 _meth_808A();
}

_id_A351( var_0 )
{
    var_1 = var_0 - self._id_02E2;
    return ( _func_0F6( var_1, anglestoforward( self.angles ) ), -1.0 * _func_0F6( var_1, anglestoright( self.angles ) ), _func_0F6( var_1, anglestoup( self.angles ) ) );
}

_id_4F6B( var_0, var_1, var_2, var_3, var_4 )
{
    level._id_4F8C = spawnstruct();
    level._id_4F8C._id_20D2 = 3;
    level._id_4F8C._id_35E6 = 1.5;
    level._id_4F8C._id_35E1 = undefined;

    if ( isdefined( var_3 ) )
        level._id_4F8C._id_5774 = [ var_0, var_1, var_2, var_3 ];
    else
        level._id_4F8C._id_5774 = [ var_0, var_1, var_2 ];

    common_scripts\utility::_id_6166( level._id_4F8C._id_5774, ::precachestring );
}

_id_4F6C( var_0 )
{
    level._id_4F8C._id_255B = var_0;
}

_id_4F6D( var_0, var_1, var_2 )
{
    level._id_4F8C._id_20D2 = var_0;
    level._id_4F8C._id_35E6 = var_1;
    level._id_4F8C._id_35E1 = var_2;
}

_id_7E85( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) )
        self._id_76AF = var_1;

    if ( isdefined( var_2 ) )
        self._id_A108 = var_2;

    if ( isdefined( var_3 ) )
        self._id_8A2F = var_3;

    self._id_0C4D = var_0;
    var_10 = [];

    if ( isdefined( var_4 ) && isdefined( var_5 ) )
    {
        var_11 = [];

        foreach ( var_13 in var_6 )
            var_11[var_13] = var_4;

        var_10["cover_trans"] = var_11;
        var_15 = [];

        foreach ( var_13 in var_6 )
            var_15[var_13] = var_5;

        var_10["cover_exit"] = var_15;
    }
    else if ( isdefined( var_4 ) || isdefined( var_5 ) )
    {

    }

    if ( isdefined( var_7 ) )
    {
        if ( isdefined( var_8 ) )
        {

        }

        var_10["run_turn"] = var_7;
        var_10["walk_turn"] = var_8;
        self._id_623F = undefined;
    }
    else if ( isdefined( var_8 ) )
    {

    }
    else
        self._id_623F = 1;

    if ( isdefined( var_9 ) )
    {
        var_18 = [];
        var_19 = [ "6x8", "8x8", "10x8", "12x6", "12x8", "16x8" ];

        for ( var_20 = 0; var_20 < var_19.size; var_20++ )
        {
            var_18["stairs_up_" + var_19[var_20]] = var_9["stairs_up_" + var_19[var_20]];
            var_18["stairs_down_" + var_19[var_20]] = var_9["stairs_down_" + var_19[var_20]];
            var_18["stairs_up_in_" + var_19[var_20]] = var_9["stairs_up_in_" + var_19[var_20]];
            var_18["stairs_down_in_" + var_19[var_20]] = var_9["stairs_down_in_" + var_19[var_20]];
            var_18["stairs_up_out_" + var_19[var_20]] = var_9["stairs_up_out_" + var_19[var_20]];
            var_18["stairs_down_out_" + var_19[var_20]] = var_9["stairs_down_out_" + var_19[var_20]];
        }

        var_10["walk"] = var_18;
        var_10["run"] = var_18;
        self._id_76B0 = 1;
    }
    else
        self._id_76B0 = undefined;

    anim._id_0CCA[var_0] = var_10;
    animscripts\init_move_transitions::_id_4E2F( var_0 );
}

_id_1EC7( var_0 )
{
    self._id_0C4D = undefined;
    anim._id_0CCA[var_0] = undefined;
    self._id_76AF = undefined;
    self._id_76B0 = undefined;
    self._id_A108 = undefined;
    self._id_8A2F = undefined;
}

_id_72D6( var_0, var_1, var_2 )
{
    animscripts\animset::_id_72ED( var_0, var_1, var_2 );
}

_id_0CC7( var_0 )
{
    return animscripts\animset::_id_0CC9( var_0 );
}

_id_7DD8( var_0 )
{
    self._id_0C4D = var_0;
    self notify( "move_loop_restart" );

    if ( var_0 == "creepwalk" )
        self._id_03BF = 72;
}

_id_1E9B()
{
    if ( isdefined( self._id_0C4D ) && self._id_0C4D == "creepwalk" )
        self._id_03BF = 30;

    self._id_0C4D = undefined;
    self notify( "move_loop_restart" );
}

_id_843C( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
    {
        if ( var_3 _id_843D( var_0, var_1 ) )
            return 1;
    }

    return 0;
}

_id_843D( var_0, var_1 )
{
    var_2 = self _meth_821A( 0, 0, 0 );
    var_3 = var_2 - var_0;
    var_4 = _func_0F1( var_3 );
    var_5 = _func_0B9( _func_0E9( 60 / var_4, 0, 1 ) );

    if ( _func_0F6( _func_114( var_3 ), _func_114( var_1 - var_0 ) ) > _func_0B7( var_5 ) )
        return 1;

    return 0;
}

_id_96F7( var_0 )
{
    _func_21D( var_0 );

    while ( !_func_223( var_0 ) )
        wait 0.1;

    common_scripts\utility::_id_383F( var_0 + "_loaded" );
}

_id_9709( var_0 )
{
    _func_21E( var_0 );

    while ( _func_223( var_0 ) )
        wait 0.1;

    common_scripts\utility::_id_3831( var_0 + "_loaded" );
}

_id_96F4( var_0 )
{
    common_scripts\utility::_id_383D( var_0 + "_loaded" );
}

_id_9701( var_0, var_1 )
{
    if ( common_scripts\utility::_id_382E( var_0 + "_loaded" ) )
        _id_9709( var_0 );

    if ( !common_scripts\utility::_id_382E( var_1 + "_loaded" ) )
        _id_96F7( var_1 );
}

_id_970A( var_0 )
{
    _func_21F();
    _id_96F7( var_0 );
}

_id_2762( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
    {
        foreach ( var_4 in var_0 )
        {
            if ( isdefined( var_4 ) )
            {
                if ( _func_0CE( var_4 ) )
                {
                    _id_2762( var_4, var_1 );
                    continue;
                }

                var_4 call [[ var_1 ]]();
            }
        }
    }
    else
    {
        switch ( var_2.size )
        {
            case 0:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2762( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 call [[ var_1 ]]();
                    }
                }

                break;
            case 1:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2762( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 call [[ var_1 ]]( var_2[0] );
                    }
                }

                break;
            case 2:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2762( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 call [[ var_1 ]]( var_2[0], var_2[1] );
                    }
                }

                break;
            case 3:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2762( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 call [[ var_1 ]]( var_2[0], var_2[1], var_2[2] );
                    }
                }

                break;
            case 4:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2762( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 call [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3] );
                    }
                }

                break;
            case 5:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2762( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 call [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3], var_2[4] );
                    }
                }

                break;
        }
    }
}

_id_2763( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
    {
        foreach ( var_4 in var_0 )
        {
            if ( isdefined( var_4 ) )
            {
                if ( _func_0CE( var_4 ) )
                {
                    _id_2763( var_4, var_1, var_2 );
                    continue;
                }

                var_4 thread [[ var_1 ]]();
            }
        }
    }
    else
    {
        switch ( var_2.size )
        {
            case 0:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2763( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 thread [[ var_1 ]]();
                    }
                }

                break;
            case 1:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2763( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 thread [[ var_1 ]]( var_2[0] );
                    }
                }

                break;
            case 2:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2763( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 thread [[ var_1 ]]( var_2[0], var_2[1] );
                    }
                }

                break;
            case 3:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2763( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2] );
                    }
                }

                break;
            case 4:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2763( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3] );
                    }
                }

                break;
            case 5:
                foreach ( var_4 in var_0 )
                {
                    if ( isdefined( var_4 ) )
                    {
                        if ( _func_0CE( var_4 ) )
                        {
                            _id_2763( var_4, var_1, var_2 );
                            continue;
                        }

                        var_4 thread [[ var_1 ]]( var_2[0], var_2[1], var_2[2], var_2[3], var_2[4] );
                    }
                }

                break;
        }
    }
}

_id_7F5E( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_2153 ) )
        _id_7DF3();

    if ( _id_502F() )
        setdvar( var_0, var_2 );
    else
        setdvar( var_0, var_1 );
}

_id_8003( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_2153 ) )
        _id_7DF3();

    if ( _id_502F() )
        _func_0D6( var_0, var_2 );
    else
        _func_0D6( var_0, var_1 );
}

_id_396B( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_path" );
    self notify( "stop_going_to_node" );
    self notify( "follow_path" );
    self endon( "follow_path" );
    wait 0.1;
    var_2 = var_0;
    var_3 = undefined;
    var_4 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 300;

    self._id_24E6 = var_2;
    var_2 _id_0392();

    while ( isdefined( var_2 ) )
    {
        self._id_24E6 = var_2;

        if ( isdefined( var_2._id_0257 ) )
            break;

        if ( isdefined( level._id_8F64["targetname"][var_2._id_04A6] ) )
            var_4 = ::_id_396E;
        else if ( isdefined( var_2.classname ) )
            var_4 = ::_id_396C;
        else
            var_4 = ::_id_396D;

        if ( isdefined( var_2._id_0351 ) && var_2._id_0351 != 0 )
            self._id_01C4 = var_2._id_0351;

        if ( self._id_01C4 < 16 )
            self._id_01C4 = 16;

        if ( isdefined( var_2._id_01E8 ) && var_2._id_01E8 != 0 )
            self._id_01C2 = var_2._id_01E8;

        var_5 = self._id_01C4;
        self childthread [[ var_4 ]]( var_2 );

        if ( isdefined( var_2.animation ) )
            var_2 waittill( var_2.animation );
        else
        {
            for (;;)
            {
                self waittill( "goal" );

                if ( _func_0EE( var_2._id_02E2, self._id_02E2 ) < var_5 + 10 || self._id_04A7 != "allies" )
                    break;
            }
        }

        var_2 notify( "trigger", self );

        if ( isdefined( var_2._id_79D8 ) )
            common_scripts\utility::_id_383F( var_2._id_79D8 );

        if ( isdefined( var_2._id_7A99 ) )
        {
            var_6 = _func_124( var_2._id_7A99, " " );

            for ( var_7 = 0; var_7 < var_6.size; var_7++ )
            {
                if ( isdefined( level._id_2542 ) )
                    self [[ level._id_2542 ]]( var_6[var_7], var_2 );

                if ( self._id_04D9 == "dog" )
                    continue;

                switch ( var_6[var_7] )
                {
                    case "enable_cqb":
                        _id_30B0();
                        continue;
                    case "disable_cqb":
                        _id_2A8D();
                        continue;
                    case "deleteme":
                        self delete();
                        return;
                }
            }
        }

        if ( !isdefined( var_2._id_7AB7 ) && var_1 > 0 && self._id_04A7 == "allies" )
        {
            while ( _func_1A1( level._id_0318 ) )
            {
                if ( _id_396F( var_2, var_1 ) )
                    break;

                if ( isdefined( var_2.animation ) )
                {
                    self._id_01C4 = var_5;
                    self _meth_81AA( self._id_02E2 );
                }

                wait 0.05;
            }
        }

        if ( !isdefined( var_2._id_04A4 ) )
            break;

        if ( isdefined( var_2._id_79DA ) )
            common_scripts\utility::_id_384A( var_2._id_79DA );

        var_2 _id_0392();
        var_2 = var_2 common_scripts\utility::_id_3E89();
    }

    self notify( "path_end_reached" );
}

_id_396F( var_0, var_1 )
{
    if ( _func_0EE( level._id_0318._id_02E2, var_0._id_02E2 ) < _func_0EE( self._id_02E2, var_0._id_02E2 ) )
        return 1;

    var_2 = undefined;
    var_2 = anglestoforward( self.angles );
    var_3 = _func_114( level._id_0318._id_02E2 - self._id_02E2 );

    if ( isdefined( var_0._id_04A4 ) )
    {
        var_4 = common_scripts\utility::_id_3E89( var_0._id_04A4 );
        var_2 = _func_114( var_4._id_02E2 - var_0._id_02E2 );
    }
    else if ( isdefined( var_0.angles ) )
        var_2 = anglestoforward( var_0.angles );
    else
        var_2 = anglestoforward( self.angles );

    if ( _func_0F6( var_2, var_3 ) > 0 )
        return 1;

    if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) < var_1 )
        return 1;

    return 0;
}

_id_396D( var_0 )
{
    self notify( "follow_path_new_goal" );

    if ( isdefined( var_0.animation ) )
    {
        var_0 _id_A510::_id_0BD0( self, var_0.animation );
        self notify( "starting_anim", var_0.animation );

        if ( isdefined( var_0._id_7A99 ) && _func_120( var_0._id_7A99, "gravity" ) )
            var_0 _id_A510::_id_0BCD( self, var_0.animation );
        else
            var_0 _id_A510::_id_0BD2( self, var_0.animation );

        self _meth_81AA( self._id_02E2 );
    }
    else
        _id_7E4B( var_0 );
}

_id_396C( var_0 )
{
    self notify( "follow_path_new_goal" );

    if ( isdefined( var_0.animation ) )
    {
        var_0 _id_A510::_id_0BD0( self, var_0.animation );
        self notify( "starting_anim", var_0.animation );

        if ( isdefined( var_0._id_7A99 ) && _func_120( var_0._id_7A99, "gravity" ) )
            var_0 _id_A510::_id_0BCD( self, var_0.animation );
        else
            var_0 _id_A510::_id_0BD2( self, var_0.animation );

        self _meth_81AA( self._id_02E2 );
    }
    else
        _id_7E47( var_0 );
}

_id_396E( var_0 )
{
    self notify( "follow_path_new_goal" );

    if ( isdefined( var_0.animation ) )
    {
        var_0 _id_A510::_id_0BD0( self, var_0.animation );
        self notify( "starting_anim", var_0.animation );
        _id_2A9D();

        if ( isdefined( var_0._id_7A99 ) && _func_120( var_0._id_7A99, "gravity" ) )
            var_0 _id_A510::_id_0BCD( self, var_0.animation );
        else
            var_0 _id_A510::_id_0BD2( self, var_0.animation );

        _id_27EF( 0.05, ::_id_30BD );
        self _meth_81AA( self._id_02E2 );
    }
    else
        _id_7E4D( var_0._id_02E2 );
}

_id_6E7B( var_0 )
{
    if ( !isdefined( level._id_6E7A ) )
        level._id_6E7A = [];

    level._id_6E7A = common_scripts\utility::_id_0CDA( level._id_6E7A, var_0 );
}

_id_3BD2()
{
    if ( level._id_0532 )
        return 1;

    if ( level._id_0349 )
        return 1;

    return 0;
}

_id_56B1( var_0, var_1 )
{
    thread _id_56B2( var_0, var_1 );
}

_id_56B2( var_0, var_1 )
{
    self notify( "new_lerp_Fov_Saved" );
    self endon( "new_lerp_Fov_Saved" );
    self _meth_8032( var_0, var_1 );
    wait(var_1);
    _func_0D6( "cg_fov", var_0 );
}

_id_3F73( var_0, var_1 )
{
    var_2 = getdvar( var_0 );

    if ( var_2 != "" )
        return _func_0BD( var_2 );

    return var_1;
}

_id_3F74( var_0, var_1 )
{
    var_2 = getdvar( var_0 );

    if ( var_2 != "" )
        return _func_0BC( var_2 );

    return var_1;
}

_id_99F1( var_0 )
{
    var_1 = "ui_actionslot_" + var_0 + "_forceActive";
    setdvar( var_1, "on" );
}

_id_99F0( var_0 )
{
    var_1 = "ui_actionslot_" + var_0 + "_forceActive";
    setdvar( var_1, "turn_off" );
}

_id_99F2( var_0 )
{
    var_1 = "ui_actionslot_" + var_0 + "_forceActive";
    setdvar( var_1, "onetime" );
}

_id_4749( var_0, var_1 )
{
    var_2 = _func_18D( var_0 );

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        if ( _func_123( _func_1AF( var_0, var_3 ) ) == _func_123( var_1 ) )
            return 1;
    }

    return 0;
}

_id_8F79( var_0, var_1, var_2, var_3 )
{

}

_id_1C13( var_0 )
{

}

_id_30ED( var_0 )
{
    if ( !_id_76FF() )
        return;

    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
        return;

    if ( !level._id_02AF )
        return;

    if ( isdefined( var_0 ) && var_0 )
    {
        if ( !isdefined( self._id_0C4D ) || self._id_0C4D == "soldier" )
            self._id_0C4D = "s1_soldier";
    }
    else if ( !isdefined( self._id_0C4D ) || self._id_0C4D == "s1_soldier" )
        self._id_0C4D = "soldier";
}

_id_76FF()
{
    if ( level._id_02AF )
        return 1;

    return 0;
}

_id_08EB()
{
    if ( isdefined( self._id_79AD ) )
        return;

    if ( isdefined( self._id_05CF ) )
        _id_0933();

    self._id_05CF = [];
    self._id_0123 = _id_A5A5::_id_090F( self._id_0123, "disableplayeradsloscheck", 1 );
    self._id_01FB = _id_A5A5::_id_090F( self._id_01FB, "ignoreall", 1 );
    self._id_01FF = _id_A5A5::_id_090F( self._id_01FF, "ignoreme", 1 );
    self._id_01D1 = _id_A5A5::_id_090F( self._id_01D1, "grenadeawareness", 0 );
    self.badplaceawareness = _id_A5A5::_id_090F( self.badplaceawareness, "badplaceawareness", 0 );
    self._id_01FD = _id_A5A5::_id_090F( self._id_01FD, "ignoreexplosionevents", 1 );
    self._id_0200 = _id_A5A5::_id_090F( self._id_0200, "ignorerandombulletdamage", 1 );
    self._id_0201 = _id_A5A5::_id_090F( self._id_0201, "ignoresuppression", 1 );
    self._id_0130 = _id_A5A5::_id_090F( self._id_0130, "dontavoidplayer", 1 );
    self._id_02AD = _id_A5A5::_id_090F( self._id_02AD, "newEnemyReactionDistSq", 0 );
    self._id_2AF7 = _id_A5A5::_id_090F( self._id_2AF7, "disableBulletWhizbyReaction", 1 );
    self._id_2B12 = _id_A5A5::_id_090F( self._id_2B12, "disableFriendlyFireReaction", 1 );
    self._id_2D38 = _id_A5A5::_id_090F( self._id_2D38, "dontMelee", 1 );
    self._id_38A8 = _id_A5A5::_id_090F( self._id_38A8, "flashBangImmunity", 1 );
    self._id_0127 = _id_A5A5::_id_090F( self._id_0127, "doDangerReact", 0 );
    self._id_6097 = _id_A5A5::_id_090F( self._id_6097, "neverSprintForVariation", 1 );
    self.a._id_2B20 = _id_A5A5::_id_090F( self.a._id_2B20, "a.disablePain", 1 );
    self.allowpain = _id_A5A5::_id_090F( self.allowpain, "allowPain", 0 );
    self._id_017D = _id_A5A5::_id_090F( self._id_017D, "fixedNode", 1 );
    self._id_79E9 = _id_A5A5::_id_090F( self._id_79E9, "script_forcegoal", 1 );
    self._id_01C4 = _id_A5A5::_id_090F( self._id_01C4, "goalradius", 5 );
    _id_2A74();
}

_id_0933( var_0, var_1 )
{
    if ( isdefined( self._id_79AD ) )
        return;

    if ( isdefined( var_0 ) && var_0 )
    {
        if ( isdefined( self._id_05CF ) )
            self._id_05CF = undefined;
    }

    self._id_0123 = _id_A5A5::_id_090D( "disableplayeradsloscheck", 0 );
    self._id_01FB = _id_A5A5::_id_090D( "ignoreall", 0 );
    self._id_01FF = _id_A5A5::_id_090D( "ignoreme", 0 );
    self._id_01D1 = _id_A5A5::_id_090D( "grenadeawareness", 1 );
    self.badplaceawareness = _id_A5A5::_id_090D( "badplaceawareness", 1 );
    self._id_01FD = _id_A5A5::_id_090D( "ignoreexplosionevents", 0 );
    self._id_0200 = _id_A5A5::_id_090D( "ignorerandombulletdamage", 0 );
    self._id_0201 = _id_A5A5::_id_090D( "ignoresuppression", 0 );
    self._id_0130 = _id_A5A5::_id_090D( "dontavoidplayer", 0 );
    self._id_02AD = _id_A5A5::_id_090D( "newEnemyReactionDistSq", 262144 );
    self._id_2AF7 = _id_A5A5::_id_090D( "disableBulletWhizbyReaction", undefined );
    self._id_2B12 = _id_A5A5::_id_090D( "disableFriendlyFireReaction", undefined );
    self._id_2D38 = _id_A5A5::_id_090D( "dontMelee", undefined );
    self._id_38A8 = _id_A5A5::_id_090D( "flashBangImmunity", undefined );
    self._id_0127 = _id_A5A5::_id_090D( "doDangerReact", 1 );
    self._id_6097 = _id_A5A5::_id_090D( "neverSprintForVariation", undefined );
    self.a._id_2B20 = _id_A5A5::_id_090D( "a.disablePain", 0 );
    self.allowpain = _id_A5A5::_id_090D( "allowPain", 1 );
    self._id_017D = _id_A5A5::_id_090D( "fixedNode", 0 );
    self._id_79E9 = _id_A5A5::_id_090D( "script_forcegoal", 0 );
    self._id_01C4 = _id_A5A5::_id_090D( "goalradius", 100 );

    if ( !( isdefined( var_1 ) && var_1 ) )
        _id_309A();

    self._id_05CF = undefined;
}

_id_0DEB( var_0 )
{
    var_1 = level._id_0318 _meth_830E();
    var_2 = _func_2BC( var_1 );
    var_3 = var_2[0]["weapon"];
    var_4 = _id_0CFA( var_2, 0 );
    self _meth_801D( var_3, var_0, 1 );

    foreach ( var_6 in var_4 )
        self _meth_801D( var_6["attachment"], var_6["attachTag"] );

    self _meth_8500( var_1 );
}

_id_6C5F( var_0, var_1 )
{
    _id_0612( "altmelee", var_0, var_1, ::_id_054D, 0 );
}

_id_054D( var_0 )
{
    if ( var_0 )
        self _meth_84E9();
    else
        self _meth_84E8();
}

_id_6C65( var_0, var_1 )
{
    _id_0612( "weaponPickup", var_0, var_1, ::_id_054E, 0 );
}

_id_054E( var_0 )
{
    if ( var_0 )
        self _meth_82C8();
    else
        self _meth_82C7();
}

_id_0612( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( self._id_6C8A ) )
        self._id_6C8A = [];

    if ( !isdefined( self._id_6C8A[var_0] ) )
        self._id_6C8A[var_0] = [];

    if ( !isdefined( var_2 ) )
        var_2 = "default";

    if ( var_1 )
    {
        self._id_6C8A[var_0] = common_scripts\utility::_id_0CF6( self._id_6C8A[var_0], var_2 );

        if ( !self._id_6C8A[var_0].size )
        {
            if ( !isdefined( var_4 ) || var_4 )
                self call [[ var_3 ]]( 1 );
            else
                self [[ var_3 ]]( 1 );
        }
    }
    else
    {
        if ( !isdefined( common_scripts\utility::_id_0CE8( self._id_6C8A[var_0], var_2 ) ) )
            self._id_6C8A[var_0] = common_scripts\utility::_id_0CDA( self._id_6C8A[var_0], var_2 );

        if ( !isdefined( var_4 ) || var_4 )
            self call [[ var_3 ]]( 0 );
        else
            self [[ var_3 ]]( 0 );
    }
}

_id_6F31()
{
    if ( !_func_1A1( self ) )
        return;

    self._id_6F32 = 1;
    self _meth_84E5( "disable" );
    self _meth_81D7();
    self._id_01FF = 1;
    self._id_4BBB = 1;
}

_id_92D7()
{
    precacheshader( "loading_animation" );
    common_scripts\utility::_id_383D( "tff_sync_complete" );
    _id_A5A5::_id_0674();
}

_id_92D5( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    if ( _func_221() )
    {
        common_scripts\utility::_id_3831( "tff_sync_complete" );
        _func_220();

        while ( _func_221() )
            wait 0.05;

        common_scripts\utility::_id_383F( "tff_sync_complete" );
    }
}

_id_92D6( var_0, var_1 )
{
    _id_92D5( var_1 );
}

_id_5820()
{
    level._id_0318 endon( "death" );

    for (;;)
    {
        var_0 = _func_2C1();

        if ( var_0 != undefined )
        {
            var_1 = var_0[4];
            var_2 = gettime();
            _func_2DA( level._id_0318, var_1, var_2 );
        }

        wait 2;
    }
}

vector_multiply( var_0, var_1 )
{
    var_0 = ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
    return var_0;
}

is_h1_level()
{
    switch ( level._id_038E )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
        case "simplecredits":
            return 1;
    }

    return 0;
}

yaw_ent_by_linked( var_0 )
{
    self _meth_8563( 1 );

    for (;;)
    {
        self _meth_8425( ( 0, 360, 0 ), var_0 );
        wait(var_0);
    }
}

rotate_ent_with_ent( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    for (;;)
    {
        self.angles = var_0.angles;
        wait 0.05;
    }
}

enable_scuff_footsteps_sound( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    _func_0D6( "bg_allowScuffFootsteps", var_0 );
}

ai_team_run_twitch_think( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) && is_start_or_after_start( var_4 ) )
        return;

    if ( !isdefined( var_3 ) || !is_start_or_after_start( var_3 ) )
        common_scripts\utility::_id_384A( var_1 );

    animscripts\utility::set_team_run_twitch_animation( var_0, 1 );

    if ( isdefined( var_2 ) )
    {
        common_scripts\utility::_id_384A( var_2 );
        animscripts\utility::set_team_run_twitch_animation( var_0, 0 );
    }
}

get_anim_reach_unique_id()
{
    if ( isdefined( level.anim_reach_id ) )
        level.anim_reach_id++;
    else
        level.anim_reach_id = 0;

    return level.anim_reach_id;
}

keep_distance( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        var_4 = common_scripts\utility::_id_0CF6( var_0, var_3 );
        var_3 thread keep_distance_from_others( var_4, var_1 );
    }
}

stop_keep_distance( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( _func_1A1( var_2 ) )
            var_2 _id_32DE( "stop_keep_distance" );
    }
}

keep_distance_from_others( var_0, var_1 )
{
    self notify( "start_keep_distance" );
    self endon( "death" );
    self endon( "start_keep_distance" );

    if ( !_id_32DC( "stop_keep_distance" ) )
        _id_32DD( "stop_keep_distance" );

    if ( !isdefined( var_1 ) )
        var_2 = spawnstruct();
    else
        var_2 = var_1;

    if ( !isdefined( var_2._id_7131 ) )
        var_2._id_7131 = 100;

    if ( !isdefined( var_2.slow_rate ) )
        var_2.slow_rate = 0.8;

    if ( !isdefined( var_2.speed_min ) )
        var_2.speed_min = 0.5;

    if ( !isdefined( var_2.slow_duration ) )
        var_2.slow_duration = 1.0;

    if ( !isdefined( var_2.front_angle ) )
        var_2.front_angle = 60;

    self.old_distance_moverate = self._id_5F65;

    for (;;)
    {
        if ( _id_32D8( "stop_keep_distance" ) )
            break;

        var_3 = common_scripts\utility::_id_3F33( self._id_02E2, var_0, var_2._id_7131 );

        if ( isdefined( var_3 ) && common_scripts\utility::_id_A347( self._id_02E2, self.angles, var_3._id_02E2, _func_0B7( var_2.front_angle ) ) )
        {
            if ( self._id_5F65 > var_3._id_5F65 )
                self._id_5F65 = _func_0E9( var_3._id_5F65 * var_2.slow_rate, var_2.speed_min, var_3._id_5F65 );
            else
                self._id_5F65 = _func_0E9( self.old_distance_moverate * var_2.slow_rate, var_2.speed_min, self.old_distance_moverate );

            wait(var_2.slow_duration);
        }
        else
            self._id_5F65 = self.old_distance_moverate;

        wait 0.05;
    }

    self._id_5F65 = self.old_distance_moverate;
    self.old_distance_moverate = undefined;
    _id_32DA( "stop_keep_distance" );
}

rumble_sequence_play( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        common_scripts\utility::_id_27CD( var_0[var_2]._id_27C0, ::_meth_80AF, var_0[var_2]._id_7675 );

        if ( isdefined( var_1 ) && var_1 )
            common_scripts\utility::_id_6167( var_0[var_2]._id_27C0, ::iprintln, "" + var_0[var_2]._id_7675 + " with delay of " + var_0[var_2]._id_27C0 );
    }

    if ( isdefined( var_1 ) && var_1 )
    {
        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {

        }
    }
}

rumble_sequence_add_key( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3._id_27C0 = var_1;
    var_3._id_7675 = var_2;
    return common_scripts\utility::_id_0CDA( var_0, var_3 );
}

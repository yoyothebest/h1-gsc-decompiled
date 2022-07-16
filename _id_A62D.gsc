// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4D0D()
{
    if ( isdefined( level._id_57AA ) )
        return;

    level._id_57AA = 1;
    thread _id_4D0E();
}

_id_4D0E()
{
    waitframe;
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "gag_stage_littlebird_unload", "script_noteworthy" ), ::_id_8121 );
    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "gag_stage_littlebird_load", "script_noteworthy" ), ::_id_8120 );
}

_id_57B1()
{
    self endon( "death" );
    _id_A5A4::_id_32DD( "prep_unload" );
    _id_A5A4::_id_32E0( "prep_unload" );
    _id_A5AA::_id_992C();
    var_0 = _id_3DAF();
    var_0 _id_57B2( self );
    _id_A5A8::_id_9D17( var_0 );
}

_id_8AE9( var_0, var_1, var_2, var_3 )
{
    var_4 = "stage_littlebird_" + var_1;
    var_5 = [];
    var_5[0] = var_0;
    var_3 _id_A510::_id_0BD0( var_5[0], var_4, "tag_detach_" + var_1 );
    var_3 _id_A510::_id_0BC9( var_5[0], var_4, "tag_detach_" + var_1 );
    _id_A5A4::_id_32DE( "staged_guy_" + var_1 );
    var_0 _meth_81AA( common_scripts\utility::_id_2F69( var_0._id_02E2 ) );
    var_0._id_01C4 = 16;
    _id_A5A4::_id_32E0( "guy2_in_" + var_1 );
    thread _id_A5A9::_id_57BF( [ var_0 ], undefined, var_1 );
}

_id_8121()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        _id_57B2( var_0 );
    }
}

_id_8120()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 _meth_828C( 6 );
        var_0 _meth_828B( 4 );
        var_0 _meth_825A( self.angles[1] );
        var_0 _meth_827F( 20, 7, 7 );

        while ( _func_0EE( common_scripts\utility::_id_38C9( var_0._id_02E2 ), common_scripts\utility::_id_38C9( self._id_02E2 ) ) > 256 )
            wait 0.05;

        var_0 endon( "death" );
        var_0 thread _id_9CF6( 220, self );
        var_0 waittill( "near_goal" );
        var_0 _meth_827F( 20, 22, 7 );
        var_0 thread _id_9CF6( 16, self );
        var_0 waittill( "near_goal" );
        var_0 _id_A5AA::_id_A0B8();
        var_0 notify( "touch_down", self );
        var_0 _meth_827F( 20, 8, 7 );
    }
}

_id_57B2( var_0 )
{
    var_0 _meth_828C( 6 );
    var_0 _meth_828B( 4 );
    var_0 _meth_825A( self.angles[1] );
    var_0 _meth_827F( 20, 7, 7 );

    while ( _func_0EE( common_scripts\utility::_id_38C9( var_0._id_02E2 ), common_scripts\utility::_id_38C9( self._id_02E2 ) ) > 512 )
        wait 0.05;

    var_0 endon( "death" );
    var_1 = "landing" + _func_0B2( 99999 );
    badplace_cylinder( var_1, 30, self._id_02E2, 200, 300, "axis", "allies", "neutral", "team3" );
    var_0 thread _id_9CF6( 424, self );
    var_0 waittill( "near_goal" );
    badplace_delete( var_1 );
    badplace_cylinder( var_1, 30, self._id_02E2, 200, 300, "axis", "allies", "neutral", "team3" );
    var_0 notify( "groupedanimevent", "pre_unload" );
    var_0 thread _id_A5A9::_id_0C57( "pre_unload" );
    var_0 _meth_827F( 20, 22, 7 );
    var_0 notify( "nearing_landing" );

    if ( isdefined( var_0._id_2549 ) )
    {
        switch ( var_0._id_2549 )
        {
            case "hover_then_land":
                var_0 _meth_827F( 10, 22, 7 );
                var_0 thread _id_9CF6( 32, self, 64 );
                var_0 waittill( "near_goal" );
                var_0 notify( "hovering" );
                wait 1;
                break;
            default:
                break;
        }
    }

    var_0 thread _id_9CF6( 16, self );
    var_0 waittill( "near_goal" );
    badplace_delete( var_1 );
    _id_A5A4::_id_0392();
    var_0 _id_A5A8::_id_9D67();
    var_0 _id_A5AA::_id_A0B8();
    var_0 _meth_827F( 20, 8, 7 );
    wait 0.2;
    var_0 notify( "stable_for_unlink" );
    wait 0.2;

    if ( isdefined( self._id_79D8 ) )
        common_scripts\utility::_id_383F( self._id_79D8 );

    if ( isdefined( self._id_79DA ) )
        common_scripts\utility::_id_384A( self._id_79DA );

    var_0 notify( "littlebird_liftoff" );
}

_id_7EBF( var_0, var_1, var_2 )
{
    if ( !_id_A5A4::_id_32DC( "staged_guy_" + var_2 ) )
        _id_A5A4::_id_32DD( "staged_guy_" + var_2 );
    else
        _id_A5A4::_id_32DA( "staged_guy_" + var_2 );

    if ( !_id_A5A4::_id_32DC( "guy2_in_" + var_2 ) )
        _id_A5A4::_id_32DD( "guy2_in_" + var_2 );
    else
        _id_A5A4::_id_32DA( "guy2_in_" + var_2 );

    var_3 = _id_3E6E( var_0, var_2 );
    var_4 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );
    var_5 = spawn( "script_model", ( 0, 0, 0 ) );
    var_5 _meth_80B3( self._id_029C );

    if ( isdefined( self._id_60A8 ) )
        var_5._id_02E2 = self._id_02E2;
    else
        var_5._id_02E2 = common_scripts\utility::_id_2F69( var_4._id_02E2 ) + ( 0, 0, self._id_65A7 );

    var_5.angles = var_4.angles;
    var_5 _meth_8056();
    var_6 = undefined;
    var_7 = undefined;
    var_8 = undefined;

    foreach ( var_10 in var_3 )
    {
        var_11 = undefined;

        foreach ( var_13 in var_1 )
        {
            if ( isdefined( var_13._id_7ADC ) && var_13._id_7ADC == var_10._id_7ADC )
            {
                var_11 = var_13;
                break;
            }
        }

        if ( !isdefined( var_11 ) )
            var_11 = common_scripts\utility::_id_3F33( var_10._id_02E2, var_1 );

        var_11._id_7ADC = var_10._id_7ADC;

        if ( var_11._id_7ADC == 2 || var_11._id_7ADC == 5 )
        {
            var_6 = var_11;
            var_11 _id_A581::_id_4244( var_10 );
        }
        else if ( var_11._id_7ADC == 3 || var_11._id_7ADC == 6 )
            var_8 = var_11;
        else if ( var_11._id_7ADC == 4 || var_11._id_7ADC == 7 )
        {
            var_7 = var_11;
            var_11 _id_A581::_id_4244( var_10 );
        }

        var_1 = common_scripts\utility::_id_0CF6( var_1, var_11 );
    }

    thread _id_8AE9( var_8, var_2, var_7, var_5 );
    thread common_scripts\utility::_id_2825( var_5 );
}

_id_3E6E( var_0, var_1 )
{
    var_2 = _func_0C4( var_0._id_04A4, "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( var_5._id_0398 == "stage_" + var_1 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_3DAF()
{
    var_0 = self._id_251D;

    for (;;)
    {
        var_1 = _id_A5A4::_id_3F82( var_0._id_04A4, "targetname" );

        if ( isdefined( var_1._id_7B06 ) )
            return var_1;

        var_0 = var_1;
    }
}

_id_57D1( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;

    foreach ( var_6 in var_1 )
    {
        if ( var_6._id_7ADC == 2 || var_6._id_7ADC == 5 )
        {
            var_2 = var_6;
            continue;
        }

        if ( var_6._id_7ADC == 3 || var_6._id_7ADC == 6 )
        {
            var_4 = var_6;
            continue;
        }

        if ( var_6._id_7ADC == 4 || var_6._id_7ADC == 7 )
            var_3 = var_6;
    }

    _id_A5A4::_id_32E0( "staged_guy_" + var_0 );
    thread _id_A5A8::_id_9D06( var_2, undefined, var_0 );
    var_2 waittill( "boarding_vehicle" );
    thread _id_A5A8::_id_9D06( var_3, undefined, var_0 );
    var_3 waittill( "boarding_vehicle" );
    _id_A5A4::_id_32DE( "guy2_in_" + var_0 );
}

_id_9CF6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self notify( "newpath" );

    if ( !isdefined( var_0 ) )
        var_0 = 2;

    self _meth_8256( var_0 );
    self _meth_824F( 0, 0, 0 );
    self _meth_8259();
    self _meth_825A( common_scripts\utility::_id_38C8( var_1.angles )[1] );
    _id_A5AA::_id_0646( _id_A5A4::_id_4417( var_1._id_02E2 ) + ( 0, 0, var_2 ), 1 );
    self waittill( "goal" );
}

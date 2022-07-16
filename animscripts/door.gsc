// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2D62()
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_2B06 ) )
        return;

    for (;;)
    {
        var_0 = self _meth_81A4();

        if ( isdefined( var_0 ) )
            break;

        wait 0.2;
    }

    var_1 = var_0._id_04D9 == "Door Interior" || self _meth_81A5( var_0 );

    if ( var_1 )
        _id_2D5F( var_0 );
    else
        _id_2D63( var_0 );

    for (;;)
    {
        var_2 = self _meth_81A4();

        if ( !isdefined( var_2 ) || var_2 != var_0 )
            break;

        wait 0.2;
    }

    thread _id_2D62();
}

_id_91F0()
{
    self endon( "killanimscript" );
    self._id_91F1 = 1;
    wait 5;
    self._id_91F1 = undefined;
}
#using_animtree("generic_human");

_id_2C31( var_0 )
{
    thread _id_91F0();

    if ( self._id_01D6 == "flash_grenade" )
        self notify( "flashbang_thrown" );

    self _meth_8193( "face current" );
    var_0._id_60C9 = gettime() + 5000;
    self._id_5C7A = gettime() + 100000;
    self notify( "move_interrupt" );
    self._id_9AC9 = undefined;
    self _meth_8144( %combatrun, 0.2 );
    self.a._id_5F5B = "stop";
    self waittill( "done_grenade_throw" );
    self _meth_8193( "face default" );
    self._id_5C7A = gettime() + 5000;
    self._id_01D6 = self._id_63D1;
    self._id_63D1 = undefined;
    animscripts\run::_id_315D();
    thread animscripts\move::_id_66D9();
    thread animscripts\move::_id_7490( 1 );
}

_id_2D61( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;
    var_6 = 3;
    var_7 = undefined;
    var_7 = %cqb_stand_grenade_throw;
    var_8 = anglestoforward( var_0.angles );

    if ( var_0._id_04D9 == "Door Interior" && !self _meth_81A5( var_0 ) )
        var_8 = -1 * var_8;

    var_9 = ( var_0._id_02E2[0], var_0._id_02E2[1], var_0._id_02E2[2] + 64 );
    var_10 = var_9;

    if ( var_2 )
    {
        var_11 = anglestoright( var_0.angles );
        var_12 = var_0._id_02E2 - self._id_02E2;
        var_13 = _func_0F6( var_11, var_12 );

        if ( var_13 > 20 )
            var_13 = 20;
        else if ( var_13 < -20 )
            var_13 = -20;

        var_10 = var_9 + var_13 * var_11;
    }

    while ( var_6 > 0 )
    {
        if ( isdefined( self._id_01CA ) || !isdefined( self._id_0142 ) )
            return;

        if ( _id_64E5( var_0, var_8 ) )
            return;

        if ( !self _meth_81C3( self._id_0142, 0.2 ) && self.a._id_6E5A == "stand" && _id_2B7A( self._id_0142._id_02E2 - var_0._id_02E2, 360000, 16384 ) )
        {
            if ( isdefined( var_0._id_60C9 ) && var_0._id_60C9 > gettime() )
                return;

            if ( self _meth_81C1() )
                return;

            var_12 = var_0._id_02E2 - self._id_02E2;

            if ( _func_0F3( var_12 ) < var_3 )
                return;

            if ( _func_0F6( var_12, var_8 ) < 0 )
                return;

            self._id_63D1 = self._id_01D6;
            self._id_01D6 = var_1;
            animscripts\combat_utility::_id_7F15( self._id_0142 );

            if ( !var_5 )
            {
                var_14 = var_9 + var_8 * 100;

                if ( !animscripts\combat_utility::isgrenadepossafe( self._id_0142, var_14, 128 ) )
                    return;
            }

            var_5 = 1;

            if ( animscripts\combat_utility::_id_989F( self._id_0142, var_10, var_7, animscripts\combat_utility::_id_3FB1( var_7 ), 1, 0, 1 ) )
            {
                _id_2C31( var_0 );
                return;
            }
        }

        var_6--;
        wait(var_4);
        var_15 = self _meth_81A4();

        if ( !isdefined( var_15 ) || var_15 != var_0 )
            return;
    }
}

_id_4C46()
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_2B06 ) )
        return;

    self._id_5126 = 0;

    for (;;)
    {
        if ( self _meth_813D() && !self._id_012E )
            _id_2D60();
        else if ( !isdefined( self._id_5C7A ) || self._id_5C7A < gettime() )
        {
            self._id_5C7A = undefined;
            _id_2D64();
        }

        wait 0.2;
    }
}

_id_2D60()
{
    if ( !isdefined( self._id_6094 ) && !self._id_012E )
    {
        self._id_5126 = 1;

        if ( !isdefined( self._id_22E0 ) || !self._id_22E0 )
            _id_A5A4::_id_30B0( 1 );
    }
}

_id_2D64()
{
    if ( !isdefined( self._id_22DD ) )
    {
        self._id_5126 = 0;

        if ( isdefined( self._id_22E0 ) && self._id_22E0 )
            _id_A5A4::_id_2A8D();
    }
}

_id_2B7A( var_0, var_1, var_2 )
{
    return var_0[0] * var_0[0] + var_0[1] * var_0[1] < var_1 && var_0[2] * var_0[2] < var_2;
}

_id_64E5( var_0, var_1 )
{
    var_2 = var_0._id_02E2 - self._id_02E2;
    var_3 = var_0._id_02E2 - self._id_0142._id_02E2;
    return _func_0F6( var_2, var_1 ) * _func_0F6( var_3, var_1 ) > 0;
}

_id_2D5F( var_0 )
{
    for (;;)
    {
        if ( isdefined( self._id_2D66 ) && ( self._id_2D66 == 0 || self._id_2D66 < _func_0B3( 1 ) ) )
            break;

        if ( _id_2B7A( self._id_02E2 - var_0._id_02E2, 562500, 25600 ) )
        {
            _id_2D61( var_0, "fraggrenade", 0, 302500, 0.3 );
            var_0 = self _meth_81A4();

            if ( !isdefined( var_0 ) )
                return;

            break;
        }

        wait 0.1;
    }

    for (;;)
    {
        if ( _id_2B7A( self._id_02E2 - var_0._id_02E2, 36864, 6400 ) )
        {
            _id_2D60();
            self._id_5C7A = gettime() + 6000;

            if ( isdefined( self._id_2D65 ) && ( self._id_2D65 == 0 || self._id_2D65 < _func_0B3( 1 ) ) )
                return;

            _id_2D61( var_0, "flash_grenade", 1, 4096, 0.2 );
            return;
        }

        wait 0.1;
    }
}

_id_2D63( var_0 )
{
    for (;;)
    {
        if ( !self._id_5126 || _func_0F0( self._id_02E2, var_0._id_02E2 ) < 1024 )
            return;

        wait 0.1;
    }
}

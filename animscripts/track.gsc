// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

_id_9512()
{
    self endon( "killanimscript" );
    self endon( "stop tracking" );
    self endon( "melee" );
    _id_9502( %aim_2, %aim_4, %aim_6, %aim_8 );
}

_id_9502( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;
    var_6 = 0;
    var_7 = ( 0, 0, 0 );
    var_8 = 1;
    var_9 = 0;
    var_10 = 0;
    var_11 = 10;
    var_12 = ( 0, 0, 0 );
    var_13 = 0;
    var_14 = 0;
    var_15 = 0;
    var_16 = 0;
    var_17 = 0.1;
    var_18 = 0;

    if ( self._id_04D9 == "dog" )
    {
        var_19 = 0;
        self._id_83F6 = self._id_0142;
    }
    else
    {
        var_19 = 1;
        var_20 = 0;
        var_21 = 0;

        if ( isdefined( self._id_22A0 ) )
            var_20 = anim._id_22A1;

        var_22 = self._id_038E;

        if ( var_22 == "cover_multi" )
        {
            if ( self.cover._id_8D56 == "right" )
                var_22 = "cover_right";
            else if ( self.cover._id_8D56 == "left" )
                var_22 = "cover_left";
        }

        if ( ( var_22 == "cover_left" || var_22 == "cover_right" ) && isdefined( self.a._id_2227 ) && self.a._id_2227 == "lean" )
            var_21 = self._id_22BA.angles[1] - self.angles[1];

        var_12 = ( var_20, var_21, 0 );
    }

    for (;;)
    {
        _id_4C30();

        if ( self _meth_843E( "tag_flash" ) == -1 )
        {
            wait 0.05;
            continue;
        }

        var_23 = animscripts\shared::_id_40C8();
        var_24 = self._id_840F;

        if ( isdefined( self._id_83F6 ) )
        {
            if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
                var_24 = animscripts\combat_utility::_id_3DB2( self._id_83F6 );
            else
                var_24 = self._id_83F6 _meth_8099();
        }
        else if ( isdefined( var_24 ) && isdefined( self.forceaimtorwardsenemy ) && isdefined( self._id_0142 ) )
            var_24 = self._id_0142 _meth_8099();

        if ( !isdefined( var_24 ) && animscripts\utility::_id_848B() )
            var_24 = _id_9505( var_23 );

        var_25 = isdefined( self._id_64E7 ) || isdefined( self._id_6450 );
        var_26 = isdefined( var_24 );
        var_27 = ( 0, 0, 0 );

        if ( var_26 )
            var_27 = var_24;

        var_28 = 0;
        var_29 = isdefined( self._id_8E2A );

        if ( var_29 )
            var_28 = self._id_8E2A;

        var_7 = self _meth_81BF( var_23, var_27, var_26, var_12, var_28, var_29, var_25 );
        var_30 = var_7[0];
        var_31 = var_7[1];
        var_7 = undefined;
        var_32 = undefined;

        if ( self.a._id_6E5A == "prone" )
        {
            var_32 = self.proneaimlimits;
            var_30 = _func_0E9( var_30, var_32._id_0133, var_32._id_04E1 );
            var_31 = _func_0E9( var_31, var_32._id_024D, var_32._id_037C );
        }
        else
        {
            var_32 = spawnstruct();
            var_32._id_037C = self._id_037C;
            var_32._id_024D = self._id_024D;
            var_32._id_04E1 = self._id_04E1;
            var_32._id_0133 = self._id_0133;
        }

        if ( animscripts\utility::_id_51B0() )
        {
            var_33 = self.angles[2] * -1;
            var_34 = var_30 * _func_0B7( var_33 ) - var_31 * _func_0B6( var_33 );
            var_35 = var_30 * _func_0B6( var_33 ) + var_31 * _func_0B7( var_33 );
            var_30 = var_34;
            var_31 = var_35;
            var_30 = _func_0E9( var_30, var_32._id_0133, var_32._id_04E1 );
            var_31 = _func_0E9( var_31, var_32._id_024D, var_32._id_037C );
        }

        if ( var_10 > 0 )
        {
            var_10 -= 1;
            var_11 = _func_0E1( 10, var_11 - 5 );
        }
        else if ( self._id_0360 && self._id_0360 != var_9 )
        {
            var_10 = 2;
            var_11 = 30;
        }
        else
            var_11 = 10;

        var_36 = _func_0E8( var_11 );
        var_9 = self._id_0360;
        var_37 = self._id_02A2 != "stop" || !var_8;

        if ( var_37 )
        {
            var_38 = var_31 - var_5;

            if ( _func_0E8( var_38 ) > var_36 )
            {
                var_31 = var_5 + _func_0E9( var_38, -1 * var_11, var_11 );
                var_31 = _func_0E9( var_31, var_32._id_024D, var_32._id_037C );
            }

            var_39 = var_30 - var_6;

            if ( _func_0E8( var_39 ) > var_36 )
            {
                var_30 = var_6 + _func_0E9( var_39, -1 * var_11, var_11 );
                var_30 = _func_0E9( var_30, var_32._id_0133, var_32._id_04E1 );
            }
        }

        var_8 = 0;
        var_5 = var_31;
        var_6 = var_30;
        _id_9507( var_0, var_1, var_2, var_3, var_4, var_30, var_31, var_32 );
        wait 0.05;
    }
}

_id_9505( var_0 )
{
    var_1 = undefined;
    var_2 = anglestoforward( self.angles );

    if ( isdefined( self._id_22D8 ) )
    {
        if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
            var_1 = animscripts\combat_utility::_id_3DB2( self._id_22D8 );
        else
            var_1 = self._id_22D8 _meth_8099();

        if ( isdefined( self._id_22DC ) )
        {
            if ( _func_0F6( _func_114( var_1 - var_0 ), var_2 ) < 0.177 )
                var_1 = undefined;
        }
        else if ( _func_0F6( _func_114( var_1 - var_0 ), var_2 ) < 0.643 )
            var_1 = undefined;
    }

    if ( !isdefined( var_1 ) && isdefined( self._id_22D6 ) )
    {
        var_1 = self._id_22D6;

        if ( isdefined( self._id_22DB ) )
        {
            if ( _func_0F6( _func_114( var_1 - var_0 ), var_2 ) < 0.177 )
                var_1 = undefined;
        }
        else if ( _func_0F6( _func_114( var_1 - var_0 ), var_2 ) < 0.643 )
            var_1 = undefined;
    }

    return var_1;
}

_id_9503( var_0, var_1 )
{
    if ( animscripts\utility::_id_7262() )
    {
        var_2 = self._id_0142 _meth_8099() - self._id_0142._id_02E2;
        var_3 = self _meth_81C5( self._id_0142 ) + var_2;
        return _id_9506( var_3 - var_0, var_1 );
    }

    var_4 = 0;
    var_5 = 0;

    if ( isdefined( self._id_02BB ) && isdefined( anim._id_50E4[self._id_02BB._id_04D9] ) && _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) < 16 )
        var_5 = _func_0EB( self.angles[1] - self._id_02BB.angles[1] );
    else
    {
        var_6 = self _meth_8196();

        if ( isdefined( var_6 ) )
        {
            var_5 = _func_0EB( self.angles[1] - var_6[1] );
            var_4 = _func_0EB( 360 - var_6[0] );
        }
    }

    return ( var_4, var_5, 0 );
}

_id_9506( var_0, var_1 )
{
    var_2 = _func_115( var_0 );
    var_3 = 0;
    var_4 = 0;

    if ( self._id_03F1 == "up" )
    {
        if ( !isdefined( self._id_5A7A ) || isdefined( self._id_5A7A ) && !self._id_5A7A )
            var_3 = -40;
    }
    else if ( self._id_03F1 == "down" )
    {
        if ( !isdefined( self._id_5A7A ) || isdefined( self._id_5A7A ) && !self._id_5A7A )
        {
            var_3 = 40;
            var_4 = 12;
        }
    }

    var_5 = 360 - var_2[0];
    var_5 = _func_0EB( var_5 + var_1[0] + var_3 );

    if ( isdefined( self._id_8E2A ) )
        var_6 = self._id_8E2A - var_2[1];
    else
    {
        var_7 = _func_0EB( self._id_0116 - self.angles[1] ) * 0.5;
        var_6 = var_7 + self.angles[1] - var_2[1];
    }

    var_6 = _func_0EB( var_6 + var_1[1] + var_4 );
    return ( var_5, var_6, 0 );
}

_id_9504( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_64E7 ) || isdefined( self._id_6450 ) )
    {
        if ( var_1 > self._id_037C || var_1 < self._id_024D )
            var_1 = 0;

        if ( var_0 > self._id_04E1 || var_0 < self._id_0133 )
            var_0 = 0;
    }
    else if ( var_2 && ( _func_0BE( var_1 ) > anim._id_5A26 || _func_0BE( var_0 ) > anim._id_5A25 ) )
    {
        var_1 = 0;
        var_0 = 0;
    }
    else
    {
        if ( self._id_01DB )
            var_1 = _func_0E9( var_1, -10, 10 );
        else
            var_1 = _func_0E9( var_1, self._id_024D, self._id_037C );

        var_0 = _func_0E9( var_0, self._id_0133, self._id_04E1 );
    }

    return ( var_0, var_1, 0 );
}

_id_9507( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = 0;
    var_9 = 0;
    var_10 = 0;
    var_11 = 0;
    var_12 = 0;
    var_13 = 0.1;

    if ( isdefined( self._id_0974 ) )
        var_13 = self._id_0974;

    if ( var_6 > 0 )
    {
        var_11 = _func_0E9( var_6 / self.animaimlimit._id_037C * self.a._id_097E, 0, 1 );
        var_10 = 1;
    }
    else if ( var_6 < 0 )
    {
        var_9 = _func_0E9( var_6 / self.animaimlimit._id_024D * self.a._id_097E, 0, 1 );
        var_10 = 1;
    }

    if ( var_5 > 0 )
    {
        var_12 = var_5 / var_7._id_04E1 * self.a._id_097E;
        var_10 = 1;
    }
    else if ( var_5 < 0 )
    {
        var_8 = var_5 / var_7._id_0133 * self.a._id_097E;
        var_10 = 1;
    }

    self _meth_814E( var_0, var_8, var_13, 1, 1 );
    self _meth_814E( var_1, var_9, var_13, 1, 1 );
    self _meth_814E( var_2, var_11, var_13, 1, 1 );
    self _meth_814E( var_3, var_12, var_13, 1, 1 );

    if ( isdefined( var_4 ) )
        self _meth_814E( var_4, var_10, var_13, 1, 1 );
}

_id_7F21( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 <= 0 )
    {
        self.a._id_097E = var_0;
        self.a._id_0980 = var_0;
        self.a._id_097F = var_0;
        self.a._id_0982 = 0;
    }
    else
    {
        if ( !isdefined( self.a._id_097E ) )
            self.a._id_097E = 0;

        self.a._id_0980 = self.a._id_097E;
        self.a._id_097F = var_0;
        self.a._id_0982 = _func_0BC( var_1 * 20 );
    }

    self.a._id_0981 = 0;
}

_id_4C30()
{
    if ( self.a._id_0981 < self.a._id_0982 )
    {
        self.a._id_0981++;
        var_0 = 1.0 * self.a._id_0981 / self.a._id_0982;
        self.a._id_097E = self.a._id_0980 * ( 1 - var_0 ) + self.a._id_097F * var_0;
    }
}

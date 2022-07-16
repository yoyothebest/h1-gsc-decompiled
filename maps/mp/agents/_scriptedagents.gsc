// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_02DB( var_0, var_1 )
{
    if ( isdefined( self._id_6490 ) )
        self [[ self._id_6490 ]]( var_0, var_1 );
}

_id_02DA()
{
    self notify( "killanimscript" );
}

_id_6A2B( var_0, var_1, var_2, var_3 )
{
    _id_6A2A( var_0, 0, var_1, var_2, var_3 );
}

_id_6A2A( var_0, var_1, var_2, var_3, var_4 )
{
    self _meth_83D0( var_0, var_1 );

    if ( !isdefined( var_3 ) )
        var_3 = "end";

    _id_A100( var_2, var_3, var_0, var_1, var_4 );
}

_id_6A28( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self _meth_83D0( var_0, var_1, var_2 );

    if ( !isdefined( var_4 ) )
        var_4 = "end";

    _id_A100( var_3, var_4, var_0, var_1, var_5 );
}

_id_A100( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = gettime();
    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_7 = getanimlength( self _meth_83D1( var_2, var_3 ) );

    for (;;)
    {
        self waittill( var_0, var_8 );

        if ( isdefined( var_7 ) )
            var_6 = ( gettime() - var_5 ) * 0.001 / var_7;

        if ( !isdefined( var_7 ) || var_6 > 0 )
        {
            if ( var_8 == var_1 || var_8 == "end" || var_8 == "anim_will_finish" || var_8 == "finish" )
                break;
        }

        if ( isdefined( var_4 ) )
            [[ var_4 ]]( var_8, var_2, var_3, var_6 );
    }
}

_id_6A26( var_0, var_1 )
{
    _id_6A29( var_0, 0, var_1 );
}

_id_6A29( var_0, var_1, var_2 )
{
    self _meth_83D0( var_0, var_1 );
    wait(var_2);
}

_id_6A27( var_0, var_1, var_2, var_3 )
{
    self _meth_83D0( var_0, var_1, var_2 );
    wait(var_3);
}

_id_3EFD( var_0, var_1, var_2 )
{
    var_3 = _func_0F2( var_0 );
    var_4 = var_0[2];
    var_5 = _func_0F2( var_1 );
    var_6 = var_1[2];
    var_7 = 1;
    var_8 = 1;

    if ( isdefined( var_2 ) && var_2 )
    {
        var_9 = ( var_1[0], var_1[1], 0 );
        var_10 = _func_114( var_9 );

        if ( _func_0F6( var_10, var_0 ) < 0 )
            var_7 = 0;
        else if ( var_5 > 0 )
            var_7 = var_3 / var_5;
    }
    else if ( var_5 > 0 )
        var_7 = var_3 / var_5;

    if ( _func_0BE( var_6 ) > 0.001 && var_6 * var_4 >= 0 )
        var_8 = var_4 / var_6;

    var_11 = spawnstruct();
    var_11._id_A3B1 = var_7;
    var_11._id_053B = var_8;
    return var_11;
}

_id_3EF1( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 10;

    if ( var_0 < 0 )
        return _func_0BC( _func_0E3( ( 180 + var_0 - var_1 ) / 45 ) );
    else
        return _func_0BC( _func_0E2( ( 180 + var_0 + var_1 ) / 45 ) );
}

_id_2F8F( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 18;

    var_2 = var_0 + ( 0, 0, var_1 );
    var_3 = var_0 + ( 0, 0, var_1 * -1 );
    var_4 = self _meth_83E3( var_2, var_3, self._id_0351, self._id_01E8, 1 );

    if ( _func_0BE( var_4[2] - var_2[2] ) < 0.1 )
        return undefined;

    if ( _func_0BE( var_4[2] - var_3[2] ) < 0.1 )
        return undefined;

    return var_4;
}

_id_1AD2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 6;

    if ( !isdefined( var_3 ) )
        var_3 = self._id_0351;

    var_4 = ( 0, 0, 1 ) * var_2;
    var_5 = var_0 + var_4;
    var_6 = var_1 + var_4;
    return self _meth_83E4( var_5, var_6, var_3, self._id_01E8 - var_2, 1 );
}

_id_414C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 6;

    var_3 = ( 0, 0, 1 ) * var_2;
    var_4 = var_0 + var_3;
    var_5 = var_1 + var_3;
    return self _meth_83E3( var_4, var_5, self._id_0351 + 4, self._id_01E8 - var_2, 1 );
}

_id_40C0( var_0 )
{
    var_1 = _func_092( var_0 );
    var_2 = self _meth_81B4( var_1 );
    var_3 = _id_414C( self._id_02E2, var_2 );
    var_4 = _func_0EE( self._id_02E2, var_3 );
    var_5 = _func_0EE( self._id_02E2, var_2 );
    return _func_0BF( 1.0, var_4 / var_5 );
}

_id_77CA( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_40A3( var_0 );
    _id_77C9( var_0, var_4, var_1, var_2, var_3 );
}

_id_77C7( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_40A3( var_0 );
    _id_77C8( var_0, var_5, var_1, var_2, var_3, var_4 );
}

_id_77C8( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self _meth_83D0( var_0, var_1, var_2 );
    _id_77C9( var_0, var_1, var_3, var_4, var_5 );
}

_id_77C9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self _meth_83D1( var_0, var_1 );
    var_6 = _id_40C0( var_5 );
    self _meth_8393( var_6, 1.0 );
    _id_6A2A( var_0, var_1, var_2, var_3, var_4 );
    self _meth_8393( 1.0, 1.0 );
}

_id_40A3( var_0 )
{
    var_1 = self _meth_83D4( var_0 );
    return _func_0B2( var_1 );
}

_id_3EF2( var_0 )
{
    var_1 = _func_115( var_0 );
    var_2 = _func_0EB( var_1[1] - self.angles[1] );
    return _id_3EF1( var_2 );
}

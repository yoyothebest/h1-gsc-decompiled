// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6169( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_3AE4 ) )
        return;

    if ( !isdefined( level._id_3AE4[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        call [[ level._id_3AE4[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        call [[ level._id_3AE4[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        call [[ level._id_3AE4[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3, var_4 );
}

_id_7C73( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_3AE4[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        self call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    self call [[ level._id_3AE4[var_0] ]]( var_1, var_2, var_3, var_4 );
}

vectorscale( var_0, var_1 )
{
    var_0 = ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
    return var_0;
}

_id_712D( var_0 )
{
    return ( _func_0B3( var_0 ) - var_0 * 0.5, _func_0B3( var_0 ) - var_0 * 0.5, _func_0B3( var_0 ) - var_0 * 0.5 );
}

_id_712F( var_0, var_1 )
{
    var_2 = _func_0B5( var_0, var_1 );

    if ( _func_0B2( 2 ) == 0 )
        var_2 *= -1;

    var_3 = _func_0B5( var_0, var_1 );

    if ( _func_0B2( 2 ) == 0 )
        var_3 *= -1;

    var_4 = _func_0B5( var_0, var_1 );

    if ( _func_0B2( 2 ) == 0 )
        var_4 *= -1;

    return ( var_2, var_3, var_4 );
}

_id_712E( var_0, var_1 )
{
    var_2 = _func_0B3( var_1 );
    var_3 = _func_0B3( 360 );
    var_4 = _func_0B6( var_2 );
    var_5 = _func_0B7( var_2 );
    var_6 = _func_0B6( var_3 );
    var_7 = _func_0B7( var_3 );
    var_8 = ( var_5, var_7 * var_4, var_6 * var_4 );
    return _func_11E( var_8, _func_115( var_0 ) );
}

vectorisnormalized( var_0 )
{
    return _func_0BE( _func_0F3( var_0 ) - 1 ) < 0.002;
}

_id_856D( var_0 )
{
    if ( var_0 >= 0 )
        return 1;

    return -1;
}

_id_0287( var_0, var_1 )
{
    var_2 = _func_0BC( var_0 / var_1 );

    if ( var_0 * var_1 < 0 )
        var_2 -= 1;

    return var_0 - var_2 * var_1;
}

_id_93F2( var_0 )
{
    return "" + var_0;
}

_id_949E( var_0 )
{
    if ( isdefined( self._id_24FD ) )
    {
        if ( var_0 == self._id_24FD )
            return;
    }

    self._id_24FD = var_0;
}

_id_3D4F( var_0 )
{
    var_1 = [];
    var_1["axis"] = "allies";
    var_1["allies"] = "axis";
    return var_1[var_0];
}

_id_1EB7( var_0 )
{
    self._id_33E5[var_0] = anim._id_2796;
}

_id_7E1C( var_0, var_1 )
{
    self._id_33E5[var_0] = var_1;
}

_id_7DB7( var_0 )
{
    var_1 = _func_1D3( self._id_33E5 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        self._id_33E5[var_1[var_2]] = var_0;
}

_id_2006()
{
    return _func_0B2( 100 ) >= 50;
}

_id_1D3F( var_0, var_1 )
{
    var_2 = _func_0B2( var_1[var_1.size - 1] + 1 );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_2 <= var_1[var_3] )
            return var_0[var_3];
    }
}

_id_3D1E( var_0 )
{
    var_1 = [];
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_2 += var_0[var_3];
        var_1[var_3] = var_2;
    }

    return var_1;
}

waittillend( var_0 )
{
    self waittillmatch( var_0, "end" );
}

_id_A0B9( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_A0BB( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    var_12 = [];
    var_12[0] = var_0;

    if ( isdefined( var_2 ) )
        var_12[1] = var_2;

    if ( isdefined( var_3 ) )
        var_12[2] = var_3;

    if ( isdefined( var_4 ) )
        var_12[3] = var_4;

    if ( isdefined( var_5 ) )
        var_12[4] = var_5;

    if ( isdefined( var_6 ) )
        var_12[5] = var_6;

    if ( isdefined( var_7 ) )
        var_12[6] = var_7;

    if ( isdefined( var_8 ) )
        var_12[7] = var_8;

    if ( isdefined( var_9 ) )
        var_12[8] = var_9;

    if ( isdefined( var_10 ) )
        var_12[9] = var_10;

    if ( isdefined( var_11 ) )
        var_12[10] = var_11;

    var_1 notify( "returned", var_12 );
}

_id_A0BA( var_0, var_1 )
{
    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_A09A( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5 = spawnstruct();
    var_5._id_9316 = 0;

    if ( isdefined( var_0 ) )
    {
        childthread _id_A0B9( var_0, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_1 ) )
    {
        childthread _id_A0B9( var_1, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_2 ) )
    {
        childthread _id_A0B9( var_2, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_3 ) )
    {
        childthread _id_A0B9( var_3, var_5 );
        var_5._id_9316++;
    }

    if ( isdefined( var_4 ) )
    {
        childthread _id_A0B9( var_4, var_5 );
        var_5._id_9316++;
    }

    while ( var_5._id_9316 )
    {
        var_5 waittill( "returned" );
        var_5._id_9316--;
    }

    var_5 notify( "die" );
}

_id_A09B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    var_8 = spawnstruct();
    var_8._id_9316 = 0;

    if ( isdefined( var_0 ) )
    {
        var_0 childthread _id_A0B9( var_1, var_8 );
        var_8._id_9316++;
    }

    if ( isdefined( var_2 ) )
    {
        var_2 childthread _id_A0B9( var_3, var_8 );
        var_8._id_9316++;
    }

    if ( isdefined( var_4 ) )
    {
        var_4 childthread _id_A0B9( var_5, var_8 );
        var_8._id_9316++;
    }

    if ( isdefined( var_6 ) )
    {
        var_6 childthread _id_A0B9( var_7, var_8 );
        var_8._id_9316++;
    }

    while ( var_8._id_9316 )
    {
        var_8 waittill( "returned" );
        var_8._id_9316--;
    }

    var_8 notify( "die" );
}

_id_A070( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0B9( var_0, var_7 );

    if ( isdefined( var_1 ) )
        childthread _id_A0B9( var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B9( var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B9( var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B9( var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B9( var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_A0B9( var_6, var_7 );

    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_id_A072( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) && ( !isdefined( var_7 ) || var_7 != "death" ) )
        self endon( "death" );

    var_8 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0BB( var_0, var_8 );

    if ( isdefined( var_1 ) )
        childthread _id_A0BB( var_1, var_8 );

    if ( isdefined( var_2 ) )
        childthread _id_A0BB( var_2, var_8 );

    if ( isdefined( var_3 ) )
        childthread _id_A0BB( var_3, var_8 );

    if ( isdefined( var_4 ) )
        childthread _id_A0BB( var_4, var_8 );

    if ( isdefined( var_5 ) )
        childthread _id_A0BB( var_5, var_8 );

    if ( isdefined( var_6 ) )
        childthread _id_A0BB( var_6, var_8 );

    if ( isdefined( var_7 ) )
        childthread _id_A0BB( var_7, var_8 );

    var_8 waittill( "returned", var_9 );
    var_8 notify( "die" );
    return var_9;
}

_id_A071( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0BA( var_0, var_6 );

    if ( isdefined( var_1 ) )
        childthread _id_A0BA( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_A0BA( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_A0BA( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_A0BA( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_A0BA( var_5, var_6 );

    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_A06D( var_0 )
{
    var_1 = spawnstruct();
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        childthread _id_A0B9( var_4, var_1 );

        if ( var_4 == "death" )
            var_2 = 1;
    }

    if ( !var_2 )
        self endon( "death" );

    var_1 waittill( "returned", var_6 );
    var_1 notify( "die" );
    return var_6;
}

_id_A06E( var_0 )
{
    var_1 = spawnstruct();

    foreach ( var_3 in var_0 )
        childthread _id_A0BA( var_3, var_1 );

    var_1 waittill( "returned", var_5 );
    var_1 notify( "die" );
    return var_5;
}

_id_A06B( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        childthread _id_A0B9( var_5, var_2 );

        if ( var_5 == "death" )
            var_3 = 1;
    }

    if ( !var_3 )
        self endon( "death" );

    var_2 childthread _id_0676( var_1 );
    var_2 waittill( "returned", var_7 );
    var_2 notify( "die" );
    return var_7;
}

_id_A06C( var_0, var_1 )
{
    var_2 = spawnstruct();

    foreach ( var_4 in var_0 )
        childthread _id_A0BA( var_4, var_2 );

    var_2 thread _id_0676( var_1 );
    var_2 waittill( "returned", var_6 );
    var_2 notify( "die" );
    return var_6;
}

_id_A073( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_A0B9( var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B9( var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B9( var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B9( var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B9( var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_A0B9( var_6, var_7 );

    var_7 childthread _id_0676( var_0 );
    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_id_0676( var_0 )
{
    self endon( "die" );
    wait(var_0);
    self notify( "returned", "timeout" );
}

_id_A074( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_A0BA( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_A0BA( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_A0BA( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_A0BA( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_A0BA( var_5, var_6 );

    var_6 childthread _id_0676( var_0 );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_A069( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    if ( isdefined( var_4 ) )
        self endon( var_4 );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    if ( isdefined( var_6 ) )
        self endon( var_6 );

    if ( isdefined( var_7 ) )
        self endon( var_7 );

    self waittill( var_0 );
}

_id_A06A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_2 endon( var_3 );

    if ( isdefined( var_4 ) && isdefined( var_5 ) )
        var_4 endon( var_5 );

    if ( isdefined( var_6 ) && isdefined( var_7 ) )
        var_6 endon( var_7 );

    if ( isdefined( var_8 ) && isdefined( var_9 ) )
        var_8 endon( var_9 );

    if ( isdefined( var_10 ) && isdefined( var_11 ) )
        var_10 endon( var_11 );

    if ( isdefined( var_12 ) && isdefined( var_13 ) )
        var_12 endon( var_13 );

    var_0 waittill( var_1 );
}

_id_5108()
{
    var_0 = gettime();

    if ( isdefined( self._id_38B1 ) && var_0 < self._id_38B1 )
        return 1;

    if ( isdefined( self._id_20DF ) && var_0 < self._id_20DF )
        return 1;

    return 0;
}

_id_3839( var_0 )
{
    return isdefined( level._id_382E[var_0] );
}

_id_382E( var_0 )
{
    return level._id_382E[var_0];
}

_id_386B( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !_id_382E( var_2 ) )
            return 0;
    }

    return 1;
}

_id_4CF0()
{
    level._id_382E = [];
    level._id_386C = [];
    level._id_3C9D = 0;

    if ( !isdefined( level._id_88B2 ) )
        level._id_88B2 = ::_id_3093;

    level._id_3846 = spawnstruct();
    level._id_3846 _id_0D6F();
}

_id_383D( var_0 )
{
    if ( !isdefined( level._id_382E ) )
        _id_4CF0();

    level._id_382E[var_0] = 0;

    if ( !isdefined( level._id_9794 ) )
    {
        _id_4D6D();
        level._id_9794[var_0] = [];
    }
    else if ( !isdefined( level._id_9794[var_0] ) )
        level._id_9794[var_0] = [];

    if ( _id_51C1( var_0, "aa_" ) )
        thread [[ level._id_88B2 ]]( var_0 );
}

_id_3093( var_0 )
{

}

_id_51C1( var_0, var_1 )
{
    if ( var_1.size > var_0.size )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0[var_2] != var_1[var_2] )
            return 0;
    }

    return 1;
}

_id_383F( var_0, var_1 )
{
    level._id_382E[var_0] = 1;
    _id_7EDD( var_0 );

    if ( isdefined( var_1 ) )
        level notify( var_0, var_1 );
    else
        level notify( var_0 );
}

_id_0D6F()
{
    self._id_9A29 = "generic" + level._id_3C9D;
    level._id_3C9D++;
}

_id_384A( var_0 )
{
    var_1 = undefined;

    while ( !_id_382E( var_0 ) )
    {
        var_1 = undefined;
        level waittill( var_0, var_1 );
    }

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_3831( var_0 )
{
    if ( !_id_382E( var_0 ) )
        return;

    level._id_382E[var_0] = 0;
    _id_7EDD( var_0 );
    level notify( var_0 );
}

_id_3857( var_0 )
{
    while ( _id_382E( var_0 ) )
        level waittill( var_0 );
}

_id_A087( var_0, var_1 )
{
    self endon( var_0 );
    self waittill( var_1 );
}

_id_0D13( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_2 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]();
    }
    else
    {
        if ( !isdefined( var_3 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2 );

            return;
        }

        if ( !isdefined( var_4 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3 );

            return;
        }

        if ( !isdefined( var_5 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4 );

            return;
        }

        if ( !isdefined( var_6 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5 );

            return;
        }

        if ( !isdefined( var_7 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );

            return;
        }

        if ( !isdefined( var_8 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );

            return;
        }

        if ( !isdefined( var_9 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

            return;
        }

        if ( !isdefined( var_10 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

            return;
        }

        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    }
}

_id_0CDB( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        var_6 call [[ var_1 ]]();
}

_id_6166( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

_id_0D16( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_0D13( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_0D17( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    _id_0D13( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_97CE( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        _id_0D13( var_2, ::_id_97CF );
    }
    else
        _id_97CF();
}

_id_97CF()
{
    if ( isdefined( self._id_71E9 ) )
        self._id_02E2 = self._id_71E9;

    self._id_97CC = undefined;
}

_id_97CC( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        _id_0D13( var_2, ::_id_97CD );
    }
    else
        _id_97CD();
}

_id_97CD()
{
    if ( !isdefined( self._id_71E9 ) )
        self._id_71E9 = self._id_02E2;

    if ( self._id_02E2 == self._id_71E9 )
        self._id_02E2 += ( 0, 0, -10000 );

    self._id_97CC = 1;
}

_id_7EDD( var_0 )
{
    if ( !isdefined( level._id_9794 ) )
        return;

    level._id_9794[var_0] = _id_0D01( level._id_9794[var_0] );
    _id_0D13( level._id_9794[var_0], ::_id_9AE8 );
}

_id_9AE8()
{
    var_0 = 1;

    if ( isdefined( self._id_79D9 ) )
    {
        var_0 = 0;
        var_1 = _id_23B2( self._id_79D9 );

        foreach ( var_3 in var_1 )
        {
            if ( _id_382E( var_3 ) )
            {
                var_0 = 1;
                break;
            }
        }
    }

    var_5 = 1;

    if ( isdefined( self._id_79D6 ) )
    {
        var_1 = _id_23B2( self._id_79D6 );

        foreach ( var_3 in var_1 )
        {
            if ( _id_382E( var_3 ) )
            {
                var_5 = 0;
                break;
            }
        }
    }

    [[ level._id_979E[var_0 && var_5] ]]();
}

_id_23B2( var_0 )
{
    var_1 = _func_124( var_0, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( level._id_382E[var_1[var_2]] ) )
            _id_383D( var_1[var_2] );
    }

    return var_1;
}

_id_4D6D()
{
    level._id_9794 = [];
    level._id_979E[1] = ::_id_97CE;
    level._id_979E[0] = ::_id_97CC;
}

_id_40FB( var_0, var_1 )
{
    var_2 = level._id_8F64[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return undefined;

    if ( var_2.size > 1 )
        return undefined;

    return var_2[0];
}

_id_40FD( var_0, var_1 )
{
    var_2 = level._id_8F64[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return [];

    return var_2;
}

_id_8F63()
{
    level._id_8F64 = [];
    level._id_8F64["target"] = [];
    level._id_8F64["targetname"] = [];
    level._id_8F64["script_noteworthy"] = [];
    level._id_8F64["script_linkname"] = [];

    foreach ( var_1 in level._id_8F60 )
        _id_079F( var_1 );
}

_id_079F( var_0 )
{
    if ( isdefined( var_0._id_04A6 ) )
    {
        if ( !isdefined( level._id_8F64["targetname"][var_0._id_04A6] ) )
            level._id_8F64["targetname"][var_0._id_04A6] = [];

        var_1 = level._id_8F64["targetname"][var_0._id_04A6].size;
        level._id_8F64["targetname"][var_0._id_04A6][var_1] = var_0;
    }

    if ( isdefined( var_0._id_04A4 ) )
    {
        if ( !isdefined( level._id_8F64["target"][var_0._id_04A4] ) )
            level._id_8F64["target"][var_0._id_04A4] = [];

        var_1 = level._id_8F64["target"][var_0._id_04A4].size;
        level._id_8F64["target"][var_0._id_04A4][var_1] = var_0;
    }

    if ( isdefined( var_0._id_0398 ) )
    {
        if ( !isdefined( level._id_8F64["script_noteworthy"][var_0._id_0398] ) )
            level._id_8F64["script_noteworthy"][var_0._id_0398] = [];

        var_1 = level._id_8F64["script_noteworthy"][var_0._id_0398].size;
        level._id_8F64["script_noteworthy"][var_0._id_0398][var_1] = var_0;
    }

    if ( isdefined( var_0._id_0396 ) )
    {
        if ( !isdefined( level._id_8F64["script_linkname"][var_0._id_0396] ) )
            level._id_8F64["script_linkname"][var_0._id_0396] = [];

        var_1 = level._id_8F64["script_linkname"][var_0._id_0396].size;
        level._id_8F64["script_linkname"][var_0._id_0396][0] = var_0;
    }
}

_id_36BE()
{

}

_id_36BC( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;
}

_id_36BD( var_0, var_1 )
{

}

_id_36BB()
{

}

_id_36BA()
{

}

_id_36BF( var_0 )
{

}

_id_0CF6( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( var_4 != var_1 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_0CF7( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        var_0 = _id_0CF6( var_0, var_3 );

    return var_0;
}

_id_0D01( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_0CF9( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = 1;

        foreach ( var_6 in var_1 )
        {
            if ( var_3 == var_6 )
            {
                var_4 = 0;
                break;
            }
        }

        if ( var_4 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_0CF0( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        thread [[ var_1 ]]( var_6 );
}

_id_0CEF( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

_id_07A5( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( !isdefined( var_0 ) )
        var_0[0] = var_1;
    else
        var_0[var_0.size] = var_1;

    return var_0;
}

_id_382F( var_0 )
{

}

_id_3852( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_382E( var_0 ) )
            return;

        if ( _id_382E( var_1 ) )
            return;

        level _id_A087( var_0, var_1 );
    }
}

_id_3853( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_382E( var_0 ) )
            return var_0;

        if ( _id_382E( var_1 ) )
            return var_1;

        var_2 = level _id_A070( var_0, var_1 );
        return var_2;
    }
}

_id_3859( var_0, var_1 )
{
    for (;;)
    {
        if ( !_id_382E( var_0 ) )
            return var_0;

        if ( !_id_382E( var_1 ) )
            return var_1;

        level _id_A087( var_0, var_1 );
    }
}

_id_385A( var_0, var_1 )
{
    return _id_3859( var_0, var_1 );
}

_id_384C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];

    if ( isdefined( var_5 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
        var_6[var_6.size] = var_5;
    }
    else if ( isdefined( var_4 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        _id_3852( var_0, var_1 );
        return;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_6.size; var_7++ )
        {
            if ( _id_382E( var_6[var_7] ) )
                return;
        }

        level _id_A069( var_0, var_1, var_2, var_3, var_4, var_5 );
    }
}

_id_384E( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];

    if ( isdefined( var_4 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
        var_5[var_5.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        var_6 = _id_3853( var_0, var_1 );
        return var_6;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        {
            if ( _id_382E( var_5[var_7] ) )
                return var_5[var_7];
        }

        var_6 = level _id_A070( var_0, var_1, var_2, var_3, var_4 );
        return var_6;
    }
}

_id_384B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) )
        _id_384A( var_0 );

    if ( isdefined( var_1 ) )
        _id_384A( var_1 );

    if ( isdefined( var_2 ) )
        _id_384A( var_2 );

    if ( isdefined( var_3 ) )
        _id_384A( var_3 );
}

_id_3856( var_0, var_1 )
{
    var_2 = var_1 * 1000;
    var_3 = gettime();

    for (;;)
    {
        if ( _id_382E( var_0 ) )
            break;

        if ( gettime() >= var_3 + var_2 )
            break;

        var_4 = var_2 - ( gettime() - var_3 );
        var_5 = var_4 / 1000;
        _id_9FA0( var_0, var_5 );
    }
}

_id_385B( var_0, var_1 )
{
    var_2 = gettime();

    for (;;)
    {
        if ( !_id_382E( var_0 ) )
            break;

        if ( gettime() >= var_2 + var_1 * 1000 )
            break;

        _id_9FA0( var_0, var_1 );
    }
}

_id_9FA0( var_0, var_1 )
{
    level endon( var_0 );
    wait(var_1);
}

_id_27CD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    thread _id_27CE( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_27CE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( _id_51AE() )
    {
        self endon( "death" );
        self endon( "stop_delay_call" );
    }

    wait(var_1);

    if ( isdefined( var_10 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    else if ( isdefined( var_9 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_8 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_7 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        self call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self call [[ var_0 ]]( var_2 );
    else
        self call [[ var_0 ]]();
}

_id_27C8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    thread _id_27C9( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_27C9( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    wait(var_1);

    if ( isdefined( var_10 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    else if ( isdefined( var_9 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_8 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_7 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        self [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        self [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self [[ var_0 ]]( var_2 );
    else
        self [[ var_0 ]]();
}

_id_6167( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_6168( var_1, var_0, var_2, var_3, var_4, var_5 );
}

_id_6168( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    wait(var_1);

    if ( isdefined( var_5 ) )
        call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        call [[ var_0 ]]( var_2 );
    else
        call [[ var_0 ]]();
}

_id_51AE()
{
    if ( !isdefined( level._id_51AE ) )
        level._id_51AE = !_id_8F57( getdvar( "mapname" ), "mp_" );

    return level._id_51AE;
}

_id_51AF()
{
    if ( !isdefined( level._id_51AF ) )
        level._id_51AF = _id_8F57( getdvar( "mapname" ), "so_td_" );

    return level._id_51AF;
}

_id_8F57( var_0, var_1 )
{
    if ( var_0.size < var_1.size )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _func_123( var_0[var_2] ) != _func_123( var_1[var_2] ) )
            return 0;
    }

    return 1;
}

_id_8F55( var_0, var_1 )
{
    if ( var_0.size < var_1.size )
        return -1;

    if ( var_1.size == 0 )
        return 0;

    var_2 = 0;

    for ( var_3 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( _func_123( var_0[var_2] ) == _func_123( var_1[var_3] ) )
            var_3++;
        else
        {
            var_3 = 0;

            if ( _func_123( var_0[var_2] ) == _func_123( var_1[var_3] ) )
                var_3++;
            else if ( var_2 > var_0.size - var_1.size )
                return -1;
        }

        if ( var_3 >= var_1.size )
            return var_2 - var_3 + 1;
    }

    return -1;
}

_id_6DF1( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0[0];

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    for ( var_6 = 1; var_6 < var_0.size; var_6++ )
    {
        thread _id_2DB8( var_5, var_0[var_6], var_1, var_2, var_3, var_4 );
        var_5 = var_0[var_6];
    }
}

_id_2DB8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_5 = gettime() + var_5 * 1000;

    while ( gettime() < var_5 )
        wait 0.05;
}

_id_909B( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
        var_2[var_5] = var_4;

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4;

    return var_2;
}

_id_0CDD( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4 ) )
            var_2[var_2.size] = var_4;
    }

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4 ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

array_combine_reverse_keys( var_0, var_1 )
{
    if ( !var_0.size )
        return var_1;

    var_2 = [];
    var_3 = _func_1D3( var_0 );
    var_3 = _id_0D02( var_3 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];
        var_2[var_2.size] = var_0[var_5];
    }

    var_3 = _func_1D3( var_1 );
    var_3 = _id_0D02( var_3 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];
        var_2[var_2.size] = var_1[var_5];
    }

    return var_2;
}

_id_0CE1( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
        var_2[var_5] = var_4;

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4;

    return var_2;
}

_id_0CF5( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = _func_0B2( var_0.size );
        var_3 = var_0[var_1];
        var_0[var_1] = var_0[var_2];
        var_0[var_2] = var_3;
    }

    return var_0;
}

_id_0CDA( var_0, var_1 )
{
    var_0[var_0.size] = var_1;
    return var_0;
}

_id_0CE9( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        var_1 = var_3;
        break;
    }

    return var_1;
}

_id_0CED( var_0, var_1, var_2 )
{
    if ( var_2 == var_0.size )
    {
        var_3 = var_0;
        var_3[var_3.size] = var_1;
        return var_3;
    }

    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( var_5 == var_2 )
        {
            var_3[var_5] = var_1;
            var_4 = 1;
        }

        var_3[var_5 + var_4] = var_0[var_5];
    }

    return var_3;
}

_id_0CE4( var_0, var_1 )
{
    if ( var_0.size <= 0 )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_0CE8( var_0, var_1 )
{
    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return var_4;
    }

    return undefined;
}

_id_38C8( var_0 )
{
    var_1 = ( 0, var_0[1], 0 );
    return var_1;
}

_id_38C9( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    return var_1;
}

_id_2DA0( var_0, var_1, var_2, var_3 )
{
    level endon( "newpath" );
    var_4 = [];
    var_5 = _func_115( var_0 - var_1 );
    var_6 = anglestoright( var_5 );
    var_7 = anglestoforward( var_5 );
    var_8 = anglestoup( var_5 );
    var_9 = _func_0EE( var_0, var_1 );
    var_10 = [];
    var_11 = 0.1;
    var_10[0] = var_0;
    var_10[1] = var_0 + var_6 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[2] = var_1;
    var_10[3] = var_0 + var_6 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[4] = var_0;
    var_10[5] = var_0 + var_8 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[6] = var_1;
    var_10[7] = var_0 + var_8 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[8] = var_0;
    var_12 = var_2[0];
    var_13 = var_2[1];
    var_14 = var_2[2];
    _id_6DF1( var_10, var_12, var_13, var_14, var_3 );
}

_id_3DBD()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = _id_3DC3();

        foreach ( var_3 in var_1 )
        {
            var_4 = getentarray( var_3, "script_linkname" );

            if ( var_4.size > 0 )
                var_0 = _id_0CDD( var_0, var_4 );
        }
    }

    return var_0;
}

_id_3DC2()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = _id_3DC3();

        foreach ( var_3 in var_1 )
        {
            var_4 = _func_1ED( var_3, "script_linkname" );

            if ( var_4.size > 0 )
                var_0 = _id_0CDD( var_0, var_4 );
        }
    }

    return var_0;
}

_id_3DBC()
{
    var_0 = _id_3DBD();
    return var_0[0];
}

_id_3DC1()
{
    var_0 = _id_3DC2();
    return var_0[0];
}

_id_3DC3()
{
    return _func_124( self._id_7A26, " " );
}

_id_76BB( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = getentarray( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _id_40FD( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = call [[ level._id_4047 ]]( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _func_1ED( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
}

_id_76B9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = getentarray( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _id_40FD( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = call [[ level._id_4047 ]]( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _func_1ED( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
}

_id_2D9F( var_0, var_1, var_2 )
{
    level endon( "newpath" );
    var_3 = [];
    var_4 = _func_115( var_0 - var_1 );
    var_5 = anglestoright( var_4 );
    var_6 = anglestoforward( var_4 );
    var_7 = _func_0EE( var_0, var_1 );
    var_8 = [];
    var_9 = 0.05;
    var_8[0] = var_0;
    var_8[1] = var_0 + var_5 * ( var_7 * var_9 ) + var_6 * ( var_7 * -0.2 );
    var_8[2] = var_1;
    var_8[3] = var_0 + var_5 * ( var_7 * ( -1 * var_9 ) ) + var_6 * ( var_7 * -0.2 );

    for ( var_10 = 0; var_10 < 4; var_10++ )
    {
        var_11 = var_10 + 1;

        if ( var_11 >= 4 )
            var_11 = 0;
    }
}

_id_2DB4( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 1, 0 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    if ( var_3 )
        var_5 = _func_0BC( var_4 / 0.05 );
    else
        var_5 = _func_0BC( var_1 / 0.05 );

    var_6 = [];
    var_7 = [];
    var_8 = gettime();

    for ( var_9 = var_8 + var_1 * 1000; var_8 < var_9 && isdefined( var_0 ); var_8 = gettime() )
    {
        var_6[0] = var_0 _meth_821A( 1, 1, 1 );
        var_6[1] = var_0 _meth_821A( 1, 1, -1 );
        var_6[2] = var_0 _meth_821A( -1, 1, -1 );
        var_6[3] = var_0 _meth_821A( -1, 1, 1 );
        var_7[0] = var_0 _meth_821A( 1, -1, 1 );
        var_7[1] = var_0 _meth_821A( 1, -1, -1 );
        var_7[2] = var_0 _meth_821A( -1, -1, -1 );
        var_7[3] = var_0 _meth_821A( -1, -1, 1 );

        for ( var_10 = 0; var_10 < 4; var_10++ )
        {
            var_11 = var_10 + 1;

            if ( var_11 == 4 )
                var_11 = 0;
        }

        if ( !var_3 )
            return;

        wait(var_4);
    }
}

_id_2DCE( var_0, var_1, var_2, var_3, var_4 )
{
    _id_2DB4( var_0, var_1, var_2, var_3, var_4 );
}

_id_2DCC( var_0, var_1, var_2, var_3, var_4 )
{
    _id_2DB4( var_0, var_1, var_2, var_3, var_4 );
}

_id_3FA8( var_0 )
{
    return level._id_058F[var_0];
}

_id_3BA5( var_0 )
{
    return isdefined( level._id_058F[var_0] );
}

_id_6F94( var_0, var_1 )
{
    var_2 = var_1 + "," + var_0;

    if ( isdefined( level._id_24A7[var_2] ) )
        return;

    level._id_24A7[var_2] = 1;
}

_id_36B6( var_0 )
{

}

_id_3FFD()
{
    return self._id_7814;
}

_id_6D76()
{

}

_id_51E1()
{
    return !self._id_2B0A;
}

_id_0586()
{
    if ( !isdefined( self._id_2B0A ) )
        self._id_2B0A = 0;

    self._id_2B0A++;
    self _meth_8327();
}

_id_0594()
{
    if ( !isdefined( self._id_2B0A ) )
        self._id_2B0A = 0;
    else if ( self._id_2B0A > 0 )
    {
        self._id_2B0A--;

        if ( self._id_2B0A == 0 )
            self _meth_8328();
    }
}

_id_7466()
{
    self._id_2B0A = 0;
    self _meth_8328();
}

_id_0587()
{
    if ( !isdefined( self._id_2B0B ) )
        self._id_2B0B = 0;

    self._id_2B0B++;
    self _meth_831A();
}

_id_0595()
{
    if ( !isdefined( self._id_2B0B ) )
        self._id_2B0B = 0;

    self._id_2B0B--;

    if ( !self._id_2B0B )
        self _meth_831B();
}

_id_5207()
{
    return !self._id_2B0B;
}

_id_0588()
{
    if ( !isdefined( self._id_2B0C ) )
        self._id_2B0C = 0;

    self._id_2B0C++;
    self _meth_831E();
}

_id_0596()
{
    if ( !isdefined( self._id_2B0C ) )
        self._id_2B0C = 0;

    self._id_2B0C--;

    if ( !self._id_2B0C )
    {
        if ( isdefined( level._id_49E4 ) && level._id_49E4 == 1 )
            return;
        else
            self _meth_831F();
    }
}

_id_5209()
{
    return !self._id_2B0C;
}

_id_0585()
{
    if ( !isdefined( self._id_2B05 ) )
        self._id_2B05 = 0;

    self._id_2B05++;
    self _meth_831C();
}

_id_0593()
{
    if ( !isdefined( self._id_2B05 ) )
        self._id_2B05 = 0;

    self._id_2B05--;

    if ( !self._id_2B05 )
        self _meth_831D();
}

_id_5163()
{
    return !self._id_2B05;
}

_id_0591( var_0, var_1 )
{
    if ( !self _meth_8311( var_0 ) )
        return;

    if ( self _meth_84C0( var_0 ) == var_1 )
        return;

    self _meth_84BF( var_0, var_1 );

    if ( var_1 )
        self notify( "WeaponDetonateEnabled", var_0 );
    else
        self notify( "WeaponDetonateDisabled", var_0 );
}

_id_710E( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    return var_1[_func_0B2( var_1.size )];
}

_id_711C( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    var_5 = _func_0B2( var_1.size * var_1.size );
    return var_1[var_1.size - 1 - _func_0BC( _func_0E7( var_5 ) )];
}

_id_8959()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_80B3( "tag_origin" );
    var_0 _meth_8056();

    if ( isdefined( self._id_02E2 ) )
        var_0._id_02E2 = self._id_02E2;

    if ( isdefined( self.angles ) )
        var_0.angles = self.angles;

    return var_0;
}

_id_A0A0( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
}

_id_A0A2( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    return "timeout";
}

_id_36B9()
{
    level._id_36C1 = 0;
    level._id_36B7 = 1;
    _id_36B7( "GAMEPRINTSTARTFILE:" );
}

_id_36B7( var_0 )
{
    level._id_36C1++;

    if ( level._id_36C1 > 200 )
    {
        wait 0.05;
        level._id_36C1 = 0;
    }
}

_id_36B8( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
        _id_36B7( "GAMEPRINTENDFILE:GAMEPRINTP4ENABLED:" + var_0 );
    else
        _id_36B7( "GAMEPRINTENDFILE:" + var_0 );

    var_2 = gettime() + 4000;

    while ( getdvarint( "LAUNCHER_PRINT_SUCCESS" ) == 0 && getdvar( "LAUNCHER_PRINT_FAIL" ) == "0" && gettime() < var_2 )
        wait 0.05;

    if ( !( gettime() < var_2 ) )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( TIMEOUT ): launcherconflict? restart launcher and try again? " );
        level._id_36B7 = undefined;
        return 0;
    }

    var_3 = getdvar( "LAUNCHER_PRINT_FAIL" );

    if ( var_3 != "0" )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( " + var_3 + " ): launcherconflict? restart launcher and try again? " );
        level._id_36B7 = undefined;
        return 0;
    }

    level._id_36B7 = undefined;
    return 1;
}

_id_562B( var_0 )
{
    level._id_36C1 = 0;
    _id_36B7( "LAUNCHER_CLIP:" + var_0 );
}

_id_50F2()
{
    if ( !isdefined( self ) )
        return 0;

    return isdefined( self._id_0117 );
}

_id_671F()
{
    common_scripts\_createfx::_id_8E8E();
}

_id_06FD()
{
    common_scripts\_exploder::_id_06FE();
}

_id_3E89( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_04A4;

    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( _id_51AE() )
    {
        var_1 = call [[ level._id_404C ]]( var_0, "targetname" );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_1 = _id_40FB( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    var_1 = _func_1EC( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_3DF3( var_0 )
{
    var_1 = getent( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( _id_51AE() )
    {
        var_1 = call [[ level._id_404C ]]( var_0, "script_noteworthy" );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_1 = _id_40FB( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;

    var_1 = _func_1EC( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_2BBD( var_0, var_1 )
{
    var_2 = level._id_3010[var_0];
    _func_18C( var_2["magnitude"], var_2["duration"], var_1, var_2["radius"] );
}

_id_697A( var_0, var_1 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self._id_02E2;

    var_2._id_02E2 = var_1;
    var_2 _meth_8077( var_0 );
    return var_2;
}

play_loopsound_in_space_with_end( var_0, var_1, var_2 )
{
    var_3 = _id_697A( var_0, var_1 );

    if ( isdefined( var_2 ) )
        self waittill( var_2 );

    var_3 _meth_80AD( var_0 );
    var_3 delete();
}

_id_69C3( var_0, var_1, var_2, var_3 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_4 = spawn( "script_origin", ( 0, 0, 1 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self._id_02E2;

    var_4._id_02E2 = var_1;
    var_4.angles = var_2;

    if ( _id_51AE() )
    {
        if ( isdefined( var_3 ) && var_3 )
            var_4 _meth_8076( var_0, "sounddone" );
        else
            var_4 _meth_809C( var_0, "sounddone" );

        var_4 waittill( "sounddone" );
    }
    else if ( isdefined( var_3 ) && var_3 )
        var_4 _meth_8076( var_0 );
    else
        var_4 _meth_809C( var_0 );

    var_4 delete();
}

_id_69C2( var_0, var_1, var_2 )
{
    _id_69C3( var_0, var_1, ( 0, 0, 0 ), var_2 );
}

_id_5871( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    if ( isdefined( var_3 ) )
        var_2 = undefined;

    if ( isdefined( var_2 ) && var_2 && ( !isdefined( level._id_380E ) || level._id_380E == 1 ) )
        _func_06A( var_0, var_1, ( 0, 0, 0 ) );
    else
    {
        var_5 = spawn( "script_origin", ( 0, 0, 0 ) );

        if ( isdefined( var_3 ) )
        {
            thread _id_5877( var_3, var_5 );
            self endon( var_3 );
        }

        var_5._id_02E2 = var_1;
        var_5 _meth_8077( var_0 );
        var_5 _meth_80E3();
    }
}

_id_5874( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    if ( isdefined( var_3 ) && var_3 )
    {
        if ( !isdefined( level._id_380E ) || level._id_380E == 1 )
            _func_06A( var_0, var_1, var_2 );
    }
    else
    {
        if ( isdefined( level._id_2409 ) && level._id_2409 && isdefined( var_5._id_5891 ) )
            var_7 = var_5._id_5891;
        else
            var_7 = spawn( "script_origin", ( 0, 0, 0 ) );

        if ( isdefined( var_4 ) )
        {
            thread _id_5877( var_4, var_7 );
            self endon( var_4 );
        }

        var_7._id_02E2 = var_1;
        var_7.angles = var_2;
        var_7 _meth_8077( var_0 );

        if ( isdefined( level._id_2409 ) && level._id_2409 )
            var_5._id_5891 = var_7;
        else
            var_7 _meth_80E3();
    }
}

_id_5872( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_5873( var_0, var_1, ( 0, 0, 0 ), var_2, var_3, var_4, var_5 );
}

_id_5873( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( isdefined( var_3 ) )
    {
        thread _id_5877( var_3, var_7 );
        self endon( var_3 );
    }

    var_7._id_02E2 = var_1;
    var_7.angles = var_2;

    if ( var_5 >= var_6 )
    {
        for (;;)
            wait 0.05;
    }

    if ( !_func_1CA( var_0 ) )
    {
        for (;;)
            wait 0.05;
    }

    for (;;)
    {
        wait(_func_0B5( var_5, var_6 ));
        _id_57FE( "createfx_looper" );
        thread _id_69C3( var_0, var_7._id_02E2, var_7.angles, undefined );
        _id_9A45( "createfx_looper" );
    }
}

_id_5877( var_0, var_1 )
{
    var_1 endon( "death" );
    self waittill( var_0 );
    var_1 delete();
}

_id_2428( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "loopfx", var_0 );
    var_1._id_9C42["delay"] = common_scripts\_createfx::_id_400F();
    return var_1;
}

_id_242E( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "oneshotfx", var_0 );
    var_1._id_9C42["delay"] = common_scripts\_createfx::_id_4061();
    return var_1;
}

_id_23FE( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "exploder", var_0 );
    var_1._id_9C42["delay"] = common_scripts\_createfx::_id_3F8D();
    var_1._id_9C42["exploder_type"] = "normal";
    return var_1;
}

_id_0AF9( var_0 )
{
    if ( var_0.size <= 1 )
        return var_0;

    var_1 = 0;

    for ( var_2 = var_0.size - 1; var_2 >= 1; var_2-- )
    {
        var_3 = var_0[var_2];
        var_4 = var_2;

        for ( var_5 = 0; var_5 < var_2; var_5++ )
        {
            var_6 = var_0[var_5];

            if ( _func_125( var_6, var_3 ) > 0 )
            {
                var_3 = var_6;
                var_4 = var_5;
            }
        }

        if ( var_4 != var_2 )
        {
            var_0[var_4] = var_0[var_2];
            var_0[var_2] = var_3;
        }
    }

    return var_0;
}

_id_5047( var_0, var_1 )
{
    return _func_125( var_0, var_1 ) > 0;
}

_id_6975( var_0, var_1, var_2, var_3 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_4 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_4 endon( "death" );
    thread _id_2825( var_4 );

    if ( isdefined( var_1 ) )
    {
        var_4._id_02E2 = self._id_02E2 + var_1;
        var_4.angles = self.angles;
        var_4 _meth_8442( self );
    }
    else
    {
        var_4._id_02E2 = self._id_02E2;
        var_4.angles = self.angles;
        var_4 _meth_8442( self );
    }

    if ( isdefined( var_2 ) && var_2 > 0 )
        var_4 _meth_8070( 0 );

    var_4 _meth_8077( var_0 );

    if ( isdefined( var_2 ) && var_2 > 0 )
        var_4 _meth_8071( 1, var_2 );

    self waittill( "stop sound" + var_0 );

    if ( isdefined( var_3 ) && var_3 > 0 )
    {
        var_4 _meth_8071( 0, var_3 );
        wait(var_3 + 0.05);
    }

    var_4 _meth_80AD( var_0 );
    var_4 delete();
}

_id_8EA1( var_0 )
{
    self notify( "stop sound" + var_0 );
}

_id_2825( var_0 )
{
    var_0 endon( "death" );
    _id_A069( "death", "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_334F( var_0 )
{
    waittillframeend;
}

_id_23AE( var_0, var_1 )
{
    setdvarifuninitialized( var_0, var_1 );
}

_id_9F36( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{

}

_id_90C8( var_0, var_1 )
{
    var_2 = self _meth_8184( var_0 );
    var_3 = self _meth_8185( var_0 );
    var_4 = anglestoforward( var_3 );
    var_4 = _func_114( var_4 ) * var_1;
    return var_2 + var_4;
}

_id_9294( var_0, var_1, var_2 )
{
    if ( var_0 )
        return var_1;

    return var_2;
}

_id_23C8( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( level._id_57FE ) )
        level._id_57FE = [];

    var_2 = spawnstruct();
    var_2._id_59FB = var_1;
    var_2.count = 0;
    level._id_57FE[var_0] = var_2;
}

_id_57FF( var_0 )
{
    if ( !isdefined( level._id_57FE ) )
        return 0;

    return isdefined( level._id_57FE[var_0] );
}

_id_57FE( var_0 )
{
    var_1 = level._id_57FE[var_0];

    while ( var_1.count >= var_1._id_59FB )
        var_1 waittill( "unlocked" );

    var_1.count++;
}

_id_504D( var_0 )
{
    var_1 = level._id_57FE[var_0];
    return var_1.count > var_1._id_59FB;
}

_id_9A4A( var_0 )
{
    thread _id_9A48( var_0 );
    wait 0.05;
}

_id_9A45( var_0 )
{
    thread _id_9A48( var_0 );
}

_id_9A48( var_0 )
{
    wait 0.05;
    var_1 = level._id_57FE[var_0];
    var_1.count--;
    var_1 notify( "unlocked" );
}

_id_3E94()
{
    var_0 = level._id_038E;

    if ( isdefined( level._id_927C ) )
        var_0 = level._id_927C;

    return var_0;
}

_id_0D02( var_0 )
{
    var_1 = [];

    for ( var_2 = var_0.size - 1; var_2 >= 0; var_2-- )
        var_1[var_1.size] = var_0[var_2];

    return var_1;
}

_id_2B73( var_0, var_1 )
{
    return _func_0F4( var_0 - var_1 );
}

_id_3CCC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3CCB( var_0, var_1, var_2, var_3, var_4, var_5 );
    var_6 = _id_0D02( var_6 );
    return var_6;
}

_id_3CCB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = var_1.size;

    if ( !isdefined( var_2 ) )
        var_2 = [];

    var_6 = undefined;

    if ( isdefined( var_4 ) )
        var_6 = var_4 * var_4;

    var_7 = 0;

    if ( isdefined( var_5 ) )
        var_7 = var_5 * var_5;

    if ( var_2.size == 0 && var_3 >= var_1.size && var_7 == 0 && !isdefined( var_6 ) )
        return _func_1BA( var_1, var_0 );

    var_8 = [];

    foreach ( var_10 in var_1 )
    {
        var_11 = 0;

        foreach ( var_13 in var_2 )
        {
            if ( var_10 == var_13 )
            {
                var_11 = 1;
                break;
            }
        }

        if ( var_11 )
            continue;

        var_15 = _func_0F0( var_0, var_10._id_02E2 );

        if ( isdefined( var_6 ) && var_15 > var_6 )
            continue;

        if ( var_15 < var_7 )
            continue;

        var_8[var_8.size] = var_10;
    }

    var_8 = _func_1BA( var_8, var_0 );

    if ( var_3 >= var_8.size )
        return var_8;

    var_17 = [];

    for ( var_18 = 0; var_18 < var_3; var_18++ )
        var_17[var_18] = var_8[var_18];

    return var_17;
}

_id_5064()
{
    if ( !level._id_2153 )
    {
        var_0 = self _meth_834C();

        if ( isdefined( var_0 ) )
            return var_0;
        else
            return 0;
    }

    return 1;
}

_id_2F69( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1500;

    if ( !isdefined( var_2 ) )
        var_2 = -12000;

    return _func_08F( var_0 + ( 0, 0, var_1 ), var_0 + ( 0, 0, var_2 ) );
}

_id_0755( var_0, var_1 )
{
    if ( !isdefined( level._id_2911 ) )
        level._id_2911 = [];

    level._id_2911[var_0] = var_1;
}

_id_0756( var_0, var_1 )
{
    if ( !isdefined( level._id_2935 ) )
        level._id_2935 = [];

    level._id_2935[var_0] = var_1;
}

_id_A347( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_114( var_2 - var_0 );
    var_5 = anglestoforward( var_1 );
    var_6 = _func_0F6( var_5, var_4 );
    return var_6 >= var_3;
}

_id_3315( var_0 )
{
    self notify( "entity_path_disconnect_thread" );
    self endon( "entity_path_disconnect_thread" );
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = 0;
    self._id_39BB = 0;

    for (;;)
    {
        var_2 = self._id_02E2;
        var_3 = _id_A073( var_0, "path_disconnect" );
        var_4 = 0;
        var_5 = _func_0F0( self._id_02E2, var_2 ) > 0;

        if ( var_5 )
            var_4 = 1;

        if ( isdefined( var_3 ) && var_3 == "path_disconnect" )
            var_4 = 1;

        if ( gettime() < self._id_39BB )
            var_4 = 1;

        foreach ( var_7 in level._id_1C8E )
        {
            if ( _func_0CF( var_7 ) && _func_0F0( self._id_02E2, var_7._id_02E2 ) < 250000 )
            {
                var_4 = 1;
                self._id_39BB = _func_0E1( gettime() + 30000, self._id_39BB );
            }
        }

        if ( var_4 != var_1 || var_5 )
        {
            if ( var_4 )
                self _meth_8059();
            else
                self _meth_805A();

            var_1 = var_4;
        }
    }
}

_id_5923( var_0, var_1 )
{
    if ( level._id_01B3 == "aliens" && isdefined( level._id_09D9 ) )
        return self [[ level._id_09D9 ]]( var_0, var_1 );

    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bots_make_entity_sentient"] ) )
        return self [[ level._id_161B["bots_make_entity_sentient"] ]]( var_0, var_1 );
}

_id_08B5( var_0 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["ai_3d_sighting_model"] ) )
        return self [[ level._id_161B["ai_3d_sighting_model"] ]]( var_0 );
}

_id_7DDE( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_0BEC ) )
        level._id_0BEC = [];

    var_3 = _func_123( getdvar( "mapname" ) );
    var_4 = 1;

    if ( _id_8F57( var_3, "mp_" ) )
        var_4 = 0;

    if ( var_4 )
        level._id_0BEC[var_0]["basic"] = var_1;
    else
        level._id_0BEC[var_0]["basic"] = var_2;
}

_id_3F33( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        var_6 = _func_0EE( var_5._id_02E2, var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_3F91( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = 0;
    var_4 = undefined;

    foreach ( var_6 in var_1 )
    {
        var_7 = _func_0EE( var_6._id_02E2, var_0 );

        if ( var_7 <= var_3 || var_7 >= var_2 )
            continue;

        var_3 = var_7;
        var_4 = var_6;
    }

    return var_4;
}

_id_5CA4( var_0, var_1, var_2 )
{
    var_2 = _id_9294( isdefined( var_2 ), var_2, ( 0, 0, 0 ) );
    self _meth_81DC( var_0, var_2 );

    switch ( var_1 )
    {
        case "direct":
            self _meth_81DF();
            break;
        case "top":
            self _meth_81E0();
            break;
    }
}

_id_33E1( var_0 )
{
    return _func_0E6( var_0 + 6.1e-05 ) / _func_0E6( 2.0 ) + 2.84;
}

_id_576F( var_0 )
{
    if ( var_0 <= 0.0031308 )
        return var_0 * 12.92;
    else
        return _func_1F3( var_0, 0.416667 ) * 1.055 - 0.055;
}

_id_21A5( var_0 )
{
    if ( !isdefined( var_0._id_4774 ) )
    {
        if ( _func_23A() )
        {
            var_1 = _func_0E1( var_0._id_7299, _func_0E1( var_0._id_43D8, var_0._id_14C5 ) );
            var_2 = _id_33E1( var_1 * getradiometricunit() );

            if ( var_1 > 0 )
            {
                var_0._id_7299 /= var_1;
                var_0._id_43D8 /= var_1;
                var_0._id_14C5 /= var_1;
                var_0._id_7299 = _id_576F( var_0._id_7299 );
                var_0._id_43D8 = _id_576F( var_0._id_43D8 );
                var_0._id_14C5 = _id_576F( var_0._id_14C5 );
                var_0._id_4774 = var_2;
            }
            else
                var_0._id_4774 = 0.0;
        }
        else
            var_0._id_4774 = 1.0;
    }

    if ( isdefined( var_0._id_8FD1 ) && var_0._id_8FD1 )
    {
        if ( !isdefined( var_0._id_4776 ) )
        {
            if ( _func_23A() )
            {
                var_1 = _func_0E1( var_0._id_7299, var_0._id_43D8, var_0._id_14C5 );
                var_2 = _id_33E1( var_1 * getradiometricunit() );

                if ( var_1 > 0 )
                {
                    var_0._id_8FD9 /= var_1;
                    var_0._id_8FD2 /= var_1;
                    var_0._id_8FBF /= var_1;
                    var_0._id_8FD9 = _id_576F( var_0._id_7299 );
                    var_0._id_8FD2 = _id_576F( var_0._id_43D8 );
                    var_0._id_8FBF = _id_576F( var_0._id_14C5 );
                    var_0._id_4776 = var_2;
                    return;
                }

                var_0._id_4776 = 0.0;
                return;
            }
            else
                var_0._id_4776 = 1.0;
        }
    }
}

_id_21A4( var_0 )
{
    if ( isdefined( level._id_33E9 ) )
    {
        switch ( level._id_33E9 )
        {
            case "dfog":
                if ( level._id_33E9 == "dfog" && var_0._id_8FD1 == 0 )
                {
                    var_0._id_8FD1 = 1;
                    var_0._id_8FD9 = 0;
                    var_0._id_8FD2 = 0;
                    var_0._id_8FBF = 0;
                    var_0._id_4776 = 0;
                    var_0._id_8FC6 = ( 0, 0, 0 );
                    var_0._id_8FBD = 0;
                    var_0._id_8FCB = 0;
                    var_0._id_615E = 1;
                }

                break;
            case "normal_fog":
                if ( var_0._id_8FD1 == 1 )
                    var_0._id_8FD1 = 0;

                break;
            default:
        }
    }
}

_id_7E37( var_0, var_1 )
{
    if ( isdefined( var_0._id_8FD1 ) && var_0._id_8FD1 )
    {
        if ( !_func_1AD( self ) )
            _func_183( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0._id_14C5, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_8FD9, var_0._id_8FD2, var_0._id_8FBF, var_0._id_4776, var_0._id_8FC6, var_0._id_8FBD, var_0._id_8FC9, var_0._id_615E, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
        else
            self _meth_8222( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0._id_14C5, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_8FD9, var_0._id_8FD2, var_0._id_8FBF, var_0._id_4776, var_0._id_8FC6, var_0._id_8FBD, var_0._id_8FC9, var_0._id_615E, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
    }
    else if ( !_func_1AD( self ) )
        _func_183( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0._id_14C5, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
    else
        self _meth_8222( var_0._id_8D08, var_0._id_4500, var_0._id_7299, var_0._id_43D8, var_0._id_14C5, var_0._id_4774, var_0._id_5A47, var_1, var_0._id_85CD, var_0._id_85CF, var_0._id_85CE, var_0._id_479F, var_0._id_479E, var_0._id_47A0 );
}

_id_7E36( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_0._id_85CD ) )
    {
        var_0._id_85CD = 0;
        var_0._id_85CF = 0;
        var_0._id_85CE = 0;
    }

    if ( !isdefined( var_0._id_479F ) )
    {
        var_0._id_479F = 0;
        var_0._id_479E = 0;
        var_0._id_47A0 = 1000;
    }

    _id_21A5( var_0 );
    _id_21A4( var_0 );

    if ( isdefined( var_0._id_0DB4 ) )
    {
        if ( level._id_02AF && var_0._id_0DB4 )
        {
            if ( _func_1AD( self ) )
                self _meth_8224( var_1, var_0._id_0DC4, var_0._id_0DB7, var_0._id_0DB9, var_0._id_0DB8, var_0._id_0DB5, var_0._id_0DBD, var_0._id_0DB6, var_0._id_0DC2, var_0._id_0DB3, _func_0BC( var_0._id_0DBF ), var_0._id_0DBE, var_0._id_0DC1, var_0._id_0DC0, var_0._id_0DC3, var_0._id_0DBB, var_0._id_0DBA, var_0._id_0DBC );
            else
                _func_186( var_1, var_0._id_0DC4, var_0._id_0DB7, var_0._id_0DB9, var_0._id_0DB8, var_0._id_0DB5, var_0._id_0DBD, var_0._id_0DB6, var_0._id_0DC2, var_0._id_0DB3, _func_0BC( var_0._id_0DBF ), var_0._id_0DBE, var_0._id_0DC1, var_0._id_0DC0, var_0._id_0DC3, var_0._id_0DBB, var_0._id_0DBA, var_0._id_0DBC );
        }
        else
            _id_7E37( var_0, var_1 );
    }
    else
        _id_7E37( var_0, var_1 );
}

_id_0760( var_0, var_1 )
{
    if ( !isdefined( level._id_058F ) )
        level._id_058F = [];

    level._id_058F[var_0] = loadfx( var_1 );
}

_id_0D05( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size - 1; var_2++ )
    {
        for ( var_3 = var_2 + 1; var_3 < var_0.size; var_3++ )
        {
            if ( var_0[var_3] [[ var_1 ]]() < var_0[var_2] [[ var_1 ]]() )
            {
                var_4 = var_0[var_3];
                var_0[var_3] = var_0[var_2];
                var_0[var_2] = var_4;
            }
        }
    }

    return var_0;
}

_id_0D06( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = -1;

    for ( var_3 = 1; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];

        for ( var_5 = var_3 - 1; var_5 >= 0 && ![[ var_1 ]]( var_0[var_5], var_4 ); var_5-- )
            var_0[var_5 + 1] = var_0[var_5];

        var_0[var_5 + 1] = var_4;

        if ( var_2 > 0 && var_3 % var_2 == 0 )
            wait 0.05;
    }

    return var_0;
}

_id_485E()
{
    if ( !isdefined( self._id_63C7 ) )
        self._id_63C7 = self _meth_80C0( 0 );

    self _meth_8056();
}

_id_84EF()
{
    if ( !_func_0CF( self ) )
        self _meth_82BA();

    if ( isdefined( self._id_63C7 ) )
        self _meth_80C0( self._id_63C7 );

    self _meth_8055();
}

_id_7FA2( var_0 )
{
    var_1 = getentarray();
    setomnvar( "lighting_state", var_0 );

    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_572E ) && ( var_3.classname == "script_brushmodel" || var_3.classname == "script_model" ) )
            {
                if ( var_3._id_572E == 0 )
                    continue;

                if ( var_3._id_572E == var_0 )
                {
                    var_3 _id_84EF();
                    continue;
                }

                var_3 _id_485E();
            }
        }
    }
}

getstatsgroup_ranked()
{
    return "rankedMatchData";
}

getstatsgroup_private()
{
    return "privateMatchData";
}

getstatsgroup_coop()
{
    return "coopMatchData";
}

getstatsgroup_common()
{
    return "commonData";
}

getstatsgroup_horde()
{
    return "hordeMatchData";
}

getstatsgroup_sp()
{
    return "spData";
}

_id_4853( var_0 )
{
    thread hide_friendname_waittill_flag_or_notify( var_0 );
}

hide_friendname_waittill_flag_or_notify( var_0 )
{
    if ( !isdefined( self._id_02A7 ) )
        return;

    level._id_0318 endon( "death" );
    self endon( "death" );
    self._id_63B0 = self._id_02A7;
    self._id_02A7 = " ";
    level waittill( var_0 );
    self._id_02A7 = self._id_63B0;
}

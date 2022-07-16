// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_9C2C()
{
    return _func_1B2( self._id_0513 ) || _func_1B6( self._id_0513 ) > 0;
}

_id_9C38()
{
    return _func_1B3( self._id_0513 );
}

_id_116C()
{
    if ( _id_9C2C() )
        return 0.1 / _func_1B0( self._id_0513 );
    else
        return 0.5;
}

_id_1934()
{
    if ( _id_9C2C() )
        return 0.1 / _func_1B0( self._id_0513 );
    else
        return 0.2;
}

_id_A004()
{
    return 0.25;
}

_id_83E9( var_0 )
{
    if ( !_id_9C2C() || isdefined( var_0 ) && var_0 == 1 )
    {
        var_1 = 0.5 + _func_0B3( 1 );
        return _func_1B0( self._id_0513 ) * var_1;
    }
    else
        return _func_1B0( self._id_0513 );
}

_id_72B1()
{
    if ( self._id_0513 == "none" )
    {
        self._id_18B0 = 0;
        return 0;
    }

    if ( !isdefined( self._id_18B0 ) )
        self._id_18B0 = _func_1B1( self._id_0513 );
    else
        self._id_18B0 = _func_1B1( self._id_0513 );

    if ( self._id_18B0 <= 0 )
        return 0;
    else
        return 1;
}

_id_07C1( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 3.0;

    if ( !isdefined( var_3 ) )
        var_2 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = "rifle";

    var_0 = _func_123( var_0 );
    anim._id_09AC[var_0]["type"] = var_1;
    anim._id_09AC[var_0]["time"] = var_2;
    anim._id_09AC[var_0]["clipsize"] = var_3;
    anim._id_09AC[var_0]["anims"] = var_4;
}

_id_0857( var_0 )
{
    anim._id_09AC[_func_123( var_0 )]["type"] = "turret";
}

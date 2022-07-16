// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshader( "objpoint_default" );
    level._id_6315 = [];
    level._id_6316 = [];

    if ( level._id_8A7C )
        level._id_6318 = 15;
    else
        level._id_6318 = 8;

    level._id_6314 = 0.7;
    level._id_6317 = 1.0;
}

_id_2443( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_405E( var_0 );

    if ( isdefined( var_6 ) )
        _id_2859( var_6 );

    if ( !isdefined( var_3 ) )
        var_3 = "objpoint_default";

    if ( !isdefined( var_5 ) )
        var_5 = 1.0;

    if ( var_2 == "all" )
        var_6 = _func_1A9();
    else if ( var_2 == "mlg" )
        var_6 = _func_1AB( "spectator" );
    else
        var_6 = _func_1AB( var_2 );

    var_6._id_02A7 = var_0;
    var_6._id_0530 = var_1[0];
    var_6._id_0538 = var_1[1];
    var_6._id_053B = var_1[2];
    var_6._id_04A7 = var_2;
    var_6._id_5109 = 0;
    var_6._id_51A5 = 1;
    var_6 _meth_80CE( var_3, level._id_6318, level._id_6318 );
    var_6 _meth_80DA( 1, 0 );

    if ( isdefined( var_4 ) )
        var_6.alpha = var_4;
    else
        var_6.alpha = level._id_6314;

    var_6._id_1301 = var_6.alpha;
    var_6._id_0204 = level._id_6315.size;
    level._id_6316[var_0] = var_6;
    level._id_6315[level._id_6315.size] = var_0;
    return var_6;
}

_id_2859( var_0 )
{
    if ( level._id_6316.size == 1 )
    {
        level._id_6316 = [];
        level._id_6315 = [];
        var_0 _meth_808A();
        return;
    }

    var_1 = var_0._id_0204;
    var_2 = level._id_6315.size - 1;
    var_3 = _id_405D( var_2 );
    level._id_6315[var_1] = var_3._id_02A7;
    var_3._id_0204 = var_1;
    level._id_6315[var_2] = undefined;
    level._id_6316[var_0._id_02A7] = undefined;
    var_0 _meth_808A();
}

deleteallobjpoints()
{
    if ( isdefined( level._id_6316 ) && level._id_6316.size > 0 )
    {
        foreach ( var_1 in level._id_6316 )
        {
            if ( isdefined( var_1 ) )
                var_1 _meth_808A();
        }

        level._id_6316 = [];
        level._id_6315 = [];
    }
}

_id_9B44( var_0 )
{
    if ( self._id_0530 != var_0[0] )
        self._id_0530 = var_0[0];

    if ( self._id_0538 != var_0[1] )
        self._id_0538 = var_0[1];

    if ( self._id_053B != var_0[2] )
        self._id_053B = var_0[2];
}

_id_7FD4( var_0, var_1 )
{
    var_2 = _id_405E( var_0 );
    var_2 _id_9B44( var_1 );
}

_id_405E( var_0 )
{
    if ( isdefined( level._id_6316[var_0] ) )
        return level._id_6316[var_0];
    else
        return undefined;
}

_id_405D( var_0 )
{
    if ( isdefined( level._id_6315[var_0] ) )
        return level._id_6316[level._id_6315[var_0]];
    else
        return undefined;
}

_id_8D18()
{
    self endon( "stop_flashing_thread" );

    if ( self._id_5109 )
        return;

    self._id_5109 = 1;

    while ( self._id_5109 )
    {
        self _meth_8086( 0.75 );
        self.alpha = 0.35 * self._id_1301;
        wait 0.75;
        self _meth_8086( 0.75 );
        self.alpha = self._id_1301;
        wait 0.75;
    }

    self.alpha = self._id_1301;
}

_id_8EE6()
{
    if ( !self._id_5109 )
        return;

    self._id_5109 = 0;
}

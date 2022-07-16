// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8738( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = "oneshot";
    var_7 = undefined;
    var_8 = "3d";
    return _id_87AC( var_0, var_6, var_7, var_8, var_1, var_2, var_3, var_4, var_5 );
}

_id_872E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = "oneshot";
    var_7 = var_1;
    var_8 = "3d";
    return _id_87AC( var_0, var_6, var_7, var_8, var_2, var_3, var_4, var_5 );
}

_id_872B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "oneshot";
    var_6 = undefined;
    var_7 = "2d";
    return _id_87AC( var_0, var_5, var_6, var_7, var_1, var_2, var_3, var_4 );
}

_id_8742( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = "loop";
    var_7 = undefined;
    var_8 = "3d";
    return _id_87AC( var_0, var_6, var_7, var_8, var_1, var_2, var_3, var_4, var_5 );
}

_id_8740( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = "loop";
    var_7 = var_1;
    var_8 = "3d";
    return _id_87AC( var_0, var_6, var_7, var_8, var_2, var_3, var_4, var_5 );
}

_id_873F( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "loop";
    var_6 = undefined;
    var_7 = "2d";
    return _id_87AC( var_0, var_5, var_6, var_7, var_1, var_2, var_3, var_4 );
}

_id_8731( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = "oneshot";
    var_9 = undefined;
    var_10 = "3d";
    return _id_87AC( var_0, var_8, var_9, var_10, var_3, var_4, var_5, var_6, var_7, var_1, var_2 );
}

_id_8730( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = "oneshot";
    var_9 = var_1;
    var_10 = "3d";
    return _id_87AC( var_0, var_8, var_9, var_10, var_4, var_5, var_6, var_7, ( 0, 0, 0 ), var_2, var_3 );
}

_id_872F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = "oneshot";
    var_8 = undefined;
    var_9 = "2d";
    return _id_87AC( var_0, var_7, var_8, var_9, var_3, var_4, var_5, var_6, ( 0, 0, 0 ), var_1, var_2 );
}

_id_8735( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = "loop";
    var_9 = undefined;
    var_10 = "3d";
    return _id_87AC( var_0, var_8, var_9, var_10, var_3, var_4, var_5, var_6, var_7, var_1, var_2 );
}

_id_8734( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = "loop";
    var_9 = var_3;
    var_10 = "3d";
    return _id_87AC( var_0, var_8, var_9, var_10, var_4, var_5, var_6, var_7, ( 0, 0, 0 ), var_1, var_2 );
}

_id_8733( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = "loop";
    var_8 = undefined;
    var_9 = "2d";
    return _id_87AC( var_0, var_7, var_8, var_9, var_3, var_4, var_5, var_6, ( 0, 0, 0 ), var_1, var_2 );
}

_id_8745( var_0 )
{

}

_id_87AC( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_12 = var_3 == "3d" && !isdefined( var_2 );
    var_13 = self;

    if ( !var_12 )
        var_13 = level._id_0318;

    if ( !isdefined( var_13 ) )
        return;

    var_14 = var_13._id_02E2;

    if ( isdefined( var_2 ) )
        var_14 = var_2;

    var_15 = spawn( "script_origin", var_14 );
    var_13 thread _id_87B1( var_0, var_1, var_12, var_2, var_3, var_15, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    return var_15;
}

_id_87B1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    var_13 = self;
    var_14 = "sndx_play_alias_" + _id_A5E8::_id_8718();
    level endon( var_14 );
    var_5 endon( "death" );
    var_6 = _id_A5DC::_id_0F30( undefined, var_6 );
    var_7 = _id_A5DC::_id_0F30( 0.0, var_7 );
    var_8 = _id_A5DC::_id_0F30( 0.1, var_8 );
    var_9 = _id_A5DC::_id_0F30( 1.0, var_9 );
    var_10 = _id_A5DC::_id_0F30( ( 0, 0, 0 ), var_10 );
    var_11 = _id_A5DC::_id_0F30( 0, var_11 );
    var_12 = _id_A5DC::_id_0F30( 0, var_12 );

    if ( var_2 )
    {
        var_15 = "tag_origin";

        if ( isdefined( var_13._id_029C ) || var_13._id_029C != "" || var_13 _meth_843E( var_15 ) < 0 )
            var_15 = "";

        var_5 _meth_804F( var_13, var_15, var_10, ( 0, 0, 0 ) );
        var_5 thread _id_87AE( var_8, var_14, var_13 );
    }

    if ( var_11 > 0 )
    {
        if ( var_12 )
            _id_A5DC::_id_1094( var_11 );
        else
            wait(var_11);
    }

    if ( var_1 == "oneshot" )
    {
        var_16 = "sounddone";
        var_17 = var_7;
        var_5 _id_872A( var_0, var_16, var_17 );
        var_5 thread _id_87AF( 0.05, var_14, var_16 );
    }
    else
        var_5 _id_873E( var_0 );

    var_5 _meth_8071( 0, 0 );

    if ( isstring( var_6 ) )
        var_5 thread _id_87B0( var_8, var_14, var_6 );

    var_5 _meth_8071( var_9, var_7 );
}

_id_87AE( var_0, var_1, var_2 )
{
    level endon( var_1 );
    self endon( "death" );
    var_3 = self;
    var_2 waittill( "death" );
    var_3 thread _id_87AD( var_0, var_1 );
}

_id_87AF( var_0, var_1, var_2 )
{
    level endon( var_1 );
    self endon( "death" );
    var_3 = self;
    var_3 waittill( var_2 );
    var_3 thread _id_87AD( undefined, var_1 );
}

_id_87B0( var_0, var_1, var_2 )
{
    level endon( var_1 );
    self endon( "death" );
    var_3 = self;
    level waittill( var_2 );
    var_3 thread _id_87AD( var_0, var_1 );
}

_id_87AD( var_0, var_1 )
{
    level notify( var_1 );
    var_2 = self;

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_0 ) )
        {
            var_2 _meth_8071( 0, var_0 );
            wait(var_0);
            waitframe;
        }

        if ( isdefined( var_2 ) )
            var_2 delete();
    }
}

_id_872A( var_0, var_1, var_2 )
{
    if ( _func_1CA( var_0 ) )
    {
        self._id_4450 = _id_A5E8::_id_8718();
        self._id_8702 = 1;
        var_1 = _id_A5DC::_id_0F30( undefined, var_1 );
        var_2 = _id_A5DC::_id_0F30( 0, var_2 );
        self _meth_809C( var_0, var_1, 0, var_2 );
    }
    else
    {

    }
}

_id_873E( var_0 )
{
    if ( _func_1CA( var_0 ) )
    {
        if ( !isdefined( self._id_8701 ) )
        {
            self _meth_8077( var_0 );
            self._id_4450 = _id_A5E8::_id_8718();
            self._id_8701 = 1;
        }
        else
        {

        }
    }
    else
    {

    }
}

_id_8778()
{
    if ( isdefined( self._id_8702 ) )
    {
        self._id_8702 = undefined;
        self _meth_80AE();
    }
    else if ( isdefined( self._id_8701 ) )
    {
        self._id_8701 = undefined;
        self _meth_80AD();
        self notify( "sounddone" );
    }
}

_id_872D( var_0, var_1, var_2, var_3 )
{
    if ( _func_1CA( var_0 ) )
    {
        var_4 = 0.1;
        var_5 = spawn( "script_origin", var_1 );
        var_5 _meth_8077( var_0 );
        level waittill( var_2 );

        if ( isdefined( var_3 ) )
            var_4 = var_3;

        if ( isdefined( var_5 ) )
        {
            var_5 _meth_8071( 0, var_4 );
            wait 0.05;
            var_5 delete();
            return;
        }
    }
    else
    {

    }
}

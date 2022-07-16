// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level thread internalmain( var_0, var_1, var_2, var_3, var_4, var_5 );
}

internalmain( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 12;
    else if ( var_0 < 7 )
        var_0 = 7;

    if ( !isdefined( var_1 ) )
        var_1 = 150;

    if ( !isdefined( var_2 ) )
        var_2 = 100;

    if ( !isdefined( var_3 ) )
        var_3 = 100;

    if ( !isdefined( var_5 ) )
        var_6 = "default";
    else
        var_6 = var_5;

    var_7 = level._id_0318 _meth_8097() + ( 0, 8, 2 );
    var_8 = 320;
    var_9 = var_1 + _func_0B2( var_2 );
    var_10 = var_3;
    level._id_0318 _meth_809C( "weapons_rocket_explosion" );
    wait 0.25;
    _func_189( var_7, var_8, var_9, var_10 );
    _func_18C( 0.75, 2, var_7, 2250 );

    if ( _func_1A1( level._id_0318 ) )
    {
        level._id_0318 _meth_811A( 0 );
        level._id_0318 _meth_811B( 0 );
        level._id_0318 _meth_811C( 1 );
        wait 0.15;
        level._id_0318 _meth_81B3( 127, level._id_0318._id_02E2 );
        level._id_0318 _meth_8186( var_6, var_0 );

        if ( !isdefined( var_4 ) )
            level._id_0318 thread playerhitable( var_0 );

        wait 1.5;
        level._id_0318 _meth_811A( 1 );
        level._id_0318 _meth_811B( 1 );
    }
}

playerhitable( var_0 )
{
    self._id_83BD = 1;
    self._id_01FF = 1;
    self notify( "player is shell shocked" );
    self endon( "player is shell shocked" );
    wait(var_0 - 1);
    self._id_83BD = 0;
    self._id_01FF = 0;
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1 )
{
    thread _id_7EE9( self, var_0, var_1 );
}

_id_8ED0( var_0, var_1, var_2 )
{
    var_1 waittill( "death" );

    if ( !isdefined( var_0 ) )
        return;

    if ( _func_29C( var_0 ) )
        return;

    var_0 _meth_8067( "manual" );
    var_0 _meth_810A();
    var_0 _meth_80E5();
}

_id_52D8( var_0, var_1 )
{
    var_1 endon( "death" );

    for (;;)
    {
        var_2 = var_0 _meth_8185( "tag_aim_pivot" );
        var_1 _meth_8193( "face angle", var_2[1] );
        wait 0.05;
    }
}

_id_7EE9( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    var_0 endon( "death" );
    var_0 _meth_8067( "auto_nonai" );
    var_1 _meth_804F( var_0, var_2._id_85AE, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    thread _id_8ED0( var_0, var_1, var_2 );
    thread _id_52D8( var_0, var_1 );
    var_3 = var_0 _meth_8184( var_2._id_85AE );
    var_4 = var_0 _meth_8185( var_2._id_85AE );

    for (;;)
        var_0 _id_A5A9::_id_0C74( var_1, var_2._id_85AE, var_2._id_4B63 );
}

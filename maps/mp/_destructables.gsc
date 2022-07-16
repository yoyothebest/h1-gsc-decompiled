// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    var_0 = getentarray( "destructable", "targetname" );

    if ( getdvar( "scr_destructables" ) == "0" )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] delete();
    }
    else
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] thread _id_28F8();
    }
}

_id_28F8()
{
    var_0 = 40;
    var_1 = 0;

    if ( isdefined( self._id_792B ) )
        var_0 = self._id_792B;

    if ( isdefined( self._id_7AF4 ) )
        var_1 = self._id_7AF4;

    if ( isdefined( self._id_799B ) )
    {
        var_2 = _func_124( self._id_799B, " " );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            _id_14B1( var_2[var_3] );
    }

    if ( isdefined( self._id_79F1 ) )
        self._id_3B23 = loadfx( self._id_79F1 );

    var_4 = 0;
    self _meth_82BC( 1 );

    for (;;)
    {
        self waittill( "damage", var_5, var_6 );

        if ( var_5 >= var_1 )
        {
            var_4 += var_5;

            if ( var_4 >= var_0 )
            {
                thread _id_28F7();
                return;
            }
        }
    }
}

_id_28F7()
{
    var_0 = self;

    if ( isdefined( self._id_799B ) )
    {
        var_1 = _func_124( self._id_799B, " " );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            _id_99FC( var_1[var_2] );
    }

    if ( isdefined( var_0._id_3B23 ) )
        playfx( var_0._id_3B23, var_0._id_02E2 + ( 0, 0, 6 ) );

    var_0 delete();
}

_id_14B1( var_0 )
{

}

_id_14B2( var_0, var_1 )
{

}

_id_99FC( var_0 )
{

}

_id_99FD( var_0, var_1 )
{

}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self endon( "killanimscript" );
    var_0 = self _meth_81A1();
    self _meth_8193( "face angle", var_0.angles[1] );
    var_1 = var_0._id_972A - var_0._id_02E2[2];
    var_2 = var_1;
    var_3 = 6;
    var_4 = ( 0, 0, var_2 / var_3 );
    self _meth_8191( "noclip" );

    for ( var_5 = 0; var_5 < var_3; var_5++ )
    {
        self _meth_81C9( self._id_02E2 + var_4 );
        wait 0.05;
    }

    self _meth_8191( "gravity" );
}

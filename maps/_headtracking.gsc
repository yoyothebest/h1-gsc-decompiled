// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

player_head_tracking()
{
    self endon( "head_tracking_end" );
    self endon( "death" );
    self.player_head_tracking = 1;
    self.head_track_debug = self._id_02A7;

    for (;;)
    {
        wait 0.2;

        if ( _func_0EE( self._id_02E2, level._id_0318._id_02E2 ) <= 200 && _id_A5A4::_id_6B91( self._id_02E2 ) )
        {
            self _meth_81BA( 60, 60, _func_0B5( 0.5, 2.0 ) );
            self _meth_8202( level._id_0318, 1, _func_0B2( 5 ) == 0 );
            _id_A5A4::waitspread( 5, 7 );
            self _meth_8203( 1 );
            _id_A5A4::waitspread( 5, 7 );
        }
    }
}

head_tracking_end( var_0, var_1 )
{
    self notify( "head_tracking_end" );
    self.player_head_tracking = 0;
    var_2 = isdefined( var_1 ) && var_1;

    if ( isdefined( var_0 ) && var_0 )
        self _meth_8202();
    else
        self _meth_8203( 1, var_2 );
}

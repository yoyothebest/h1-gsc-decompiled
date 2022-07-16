// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6542()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( _func_1FF( self ) )
        return;

    var_0 = 0.65;
    self._id_6543 = 0;
    self._id_6578 = 0;
    self.has_opticsthermal = 0;

    for (;;)
    {
        var_1 = !self.has_opticsthermal;
        var_1 |= ( self.has_opticsthermal && self _meth_833D() < var_0 );
        var_1 |= self _meth_833F();
        var_1 |= self._id_6578;

        if ( var_1 )
            _id_6541( self );
        else
            _id_6540( self, 0.05 );

        wait 0.05;
    }
}

_id_6540( var_0, var_1 )
{
    if ( var_0._id_6543 )
        return;

    var_0 _meth_84A5( 3 );
    var_0 _meth_84A7( 70, 0, 40, 80 );
    var_0._id_6543 = 1;
}

_id_6541( var_0 )
{
    if ( !var_0._id_6543 )
        return;

    var_0 _meth_84A6();
    var_0._id_6543 = 0;
}

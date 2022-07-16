// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self endon( "death" );
    self endon( "stop_first_frame" );
    self notify( "killanimscript" );
    self._id_034C = 0;
    self _meth_8144( self._id_75DF, 0.3 );
    self _meth_8193( "face angle", self.angles[1] );
    self _meth_814D( level._id_78AC[self._id_0553][self._id_05AD], 1, 0, 0 );
    self._id_05AD = undefined;
    self waittill( "killanimscript" );
}

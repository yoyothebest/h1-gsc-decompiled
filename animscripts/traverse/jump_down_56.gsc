// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();
    self endon( "killanimscript" );
    self.a._id_5F5B = "walk";
    self.a.alertness = "alert";
    self _meth_8191( "nogravity" );
    var_0 = self _meth_81A1();
    self _meth_8193( "face angle", var_0.angles[1] );
    self _meth_8112( "stepanim", %jump_down_56, %body, 1, 0.1, 1 );
    self waittillmatch( "stepanim", "gravity on" );
    self _meth_8191( "gravity" );
    animscripts\shared::_id_2D06( "stepanim" );
    self _meth_814B( %crouch_fastwalk_f, %body, 1, 0.1, 1 );
}

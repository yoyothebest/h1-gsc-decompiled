// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();
    self endon( "killanimscript" );
    self.a._id_5F5B = "walk";
    self _meth_8191( "nogravity" );
    var_0 = self _meth_81A1();
    self _meth_8193( "face angle", var_0.angles[1] );
    self _meth_8112( "stepanim", %jump_across_72, %body, 1, 0.1, 1 );
    wait 0.15;
    self _meth_8191( "gravity" );
    animscripts\shared::_id_2D06( "stepanim" );
}

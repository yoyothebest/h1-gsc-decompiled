// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    var_0 = self _meth_81A1();
    self _meth_8193( "face angle", var_0.angles[1] );
    self _meth_8144( %stand_and_crouch, 0.1 );
    self _meth_8112( "diveanim", %jump_over_high_wall, %body, 1, 0.1, 1 );
    self _meth_809C( "dive_wall" );
    self waittillmatch( "diveanim", "gravity on" );
    self _meth_8191( "nogravity" );
    self waittillmatch( "diveanim", "noclip" );
    self _meth_8191( "noclip" );
    self waittillmatch( "diveanim", "gravity on" );
    self _meth_8191( "gravity" );
    animscripts\shared::_id_2D06( "diveanim" );
}

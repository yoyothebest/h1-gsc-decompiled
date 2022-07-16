// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self._id_04D9 == "human" )
        jump_down_human();
    else if ( self._id_04D9 == "dog" )
        animscripts\traverse\shared::_id_2CA8( 96, 7 );
}
#using_animtree("generic_human");

jump_down_human()
{
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();
    self endon( "killanimscript" );
    self.a._id_5F5B = "walk";
    self.a.alertness = "alert";
    self _meth_8191( "nogravity" );
    var_0 = self _meth_81A1();
    self _meth_8193( "face angle", var_0.angles[1] );
    self _meth_8112( "stepanim", %jump_down_96, %body, 1, 0.1, 1 );
    self waittillmatch( "stepanim", "gravity on" );
    self _meth_8191( "gravity" );
    animscripts\shared::_id_2D06( "stepanim" );
    self.a._id_6E5A = "crouch";
}

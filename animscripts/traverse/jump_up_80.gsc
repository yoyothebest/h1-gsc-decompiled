// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    var_0 = self _meth_81A1();
    self _meth_8193( "face angle", var_0.angles[1] );
    var_1 = var_0._id_972A - var_0._id_02E2[2];
    thread animscripts\traverse\shared::_id_925E( var_1 - 80 );
    self _meth_8144( %animscript_root, 0.2 );
    self _meth_8115( "jump_up_80", anim._id_2CE0["jump_up_80"], 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "jump_up_80" );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self._id_04D9 == "dog" )
        _id_861F();
    else
        _id_8620();
}
#using_animtree("generic_human");

_id_8620()
{
    var_0 = [];
    var_0["traverseAnim"] = %slide_across_car;
    var_0["traverseToCoverAnim"] = %slide_across_car_2_cover;
    var_0["coverType"] = "Cover Crouch";
    var_0["traverseHeight"] = 38.0;
    var_0["interruptDeathAnim"][0] = animscripts\utility::_id_0CD8( %slide_across_car_death );
    var_0["traverseSound"] = "npc_car_slide_hood";
    var_0["traverseToCoverSound"] = "npc_car_slide_cover";
    animscripts\traverse\shared::_id_2D86( var_0 );
}
#using_animtree("dog");

_id_861F()
{
    self endon( "killanimscript" );
    self _meth_8191( "noclip" );
    var_0 = self _meth_81A1();
    self _meth_8193( "face angle", var_0.angles[1] );
    self _meth_8144( %animscript_root, 0.1 );
    self _meth_8115( "traverse", anim._id_2CE0["jump_up_40"], 1, 0.1, 1 );
    animscripts\shared::_id_2D06( "traverse" );
    thread common_scripts\utility::_id_69C2( "anml_dog_bark", self _meth_8184( "tag_eye" ) );
    self _meth_8144( %animscript_root, 0 );
    self _meth_8115( "traverse", anim._id_2CE0["jump_down_40"], 1, 0, 1 );
    animscripts\shared::_id_2D06( "traverse" );
    self _meth_8191( "gravity" );
}

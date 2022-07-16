// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self._id_04D9 == "dog" )
        animscripts\traverse\shared::_id_2CBD( "window_40", 40 );
    else
        _id_52BE();
}
#using_animtree("generic_human");

_id_52BE()
{
    var_0 = [];
    var_0["traverseAnim"] = %traverse_window_m_2_run;
    var_0["traverseToCoverAnim"] = %traverse_window_m_2_stop;
    var_0["coverType"] = "Cover Crouch";
    var_0["traverseHeight"] = 36.0;
    var_0["interruptDeathAnim"][0] = animscripts\utility::_id_0CD8( %traverse_window_death_start );
    var_0["interruptDeathAnim"][1] = animscripts\utility::_id_0CD8( %traverse_window_death_end );
    var_0["traverseSound"] = "npc_wall_over_40";
    animscripts\traverse\shared::_id_2D86( var_0 );
}

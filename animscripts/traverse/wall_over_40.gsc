// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self._id_04D9 == "dog" )
        animscripts\traverse\shared::_id_2CBD( "window_40", 40 );
    else
        _id_589D();
}
#using_animtree("generic_human");

_id_589D()
{
    var_0 = [];
    var_0["traverseAnim"] = %traverse40;
    var_0["traverseToCoverAnim"] = %traverse40_2_cover;
    var_0["coverType"] = "Cover Crouch";
    var_0["traverseHeight"] = 40.0;
    var_0["interruptDeathAnim"][0] = animscripts\utility::_id_0CD8( %traverse40_death_start, %traverse40_death_start_2 );
    var_0["interruptDeathAnim"][1] = animscripts\utility::_id_0CD8( %traverse40_death_end, %traverse40_death_end_2 );
    var_0["traverseSound"] = "npc_wall_over_40";
    animscripts\traverse\shared::_id_2D86( var_0 );
}

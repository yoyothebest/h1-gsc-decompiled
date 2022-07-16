// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self._id_04D9 == "dog" )
        animscripts\traverse\shared::_id_2CA9( 38.0, 5 );
    else
        _id_589D();
}
#using_animtree("generic_human");

_id_589D()
{
    var_0 = [];
    var_0["traverseAnim"] = %h1_traverse_stepup_small;
    var_0["traverseHeight"] = 38.0;
    var_0["traverseSound"] = "npc_step_up_38";
    animscripts\traverse\shared::_id_2D86( var_0 );
}

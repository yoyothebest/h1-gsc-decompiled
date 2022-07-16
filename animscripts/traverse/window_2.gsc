// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    if ( self._id_04D9 == "dog" )
        animscripts\traverse\shared::_id_2CBD( "wallhop", 40 );
    else
        _id_0881( %windowclimb, 35 );
}

_id_0881( var_0, var_1 )
{
    var_2 = [];
    var_2["traverseAnim"] = var_0;
    var_2["traverseHeight"] = var_1;
    var_2["traverseSound"] = "npc_wall_over_40";
    animscripts\traverse\shared::_id_2D86( var_2 );
}

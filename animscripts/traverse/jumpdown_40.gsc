// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self._id_04D9 == "dog" )
        animscripts\traverse\shared::_id_2CA8( 3, 1.0 );
    else
        _id_589D();
}
#using_animtree("generic_human");

_id_589D()
{
    var_0 = [];
    var_0["traverseAnim"] = %traverse_jumpdown_40;
    var_0["traverseHeight"] = 0.0;
    animscripts\traverse\shared::_id_2D86( var_0 );
}

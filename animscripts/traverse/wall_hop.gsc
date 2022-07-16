// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( self._id_04D9 == "dog" )
        animscripts\traverse\shared::_id_2CBD( "wallhop", 40 );
    else
        _id_A148();
}
#using_animtree("generic_human");

_id_A148()
{
    var_0 = [];
    var_0["traverseAnim"] = %traverse_window_quick;
    var_0["traverseHeight"] = 40.0;
    var_1 = isdefined( level.disallowlegswingwallhop ) && level.disallowlegswingwallhop == 1;

    if ( var_1 || _func_0B2( 100 ) < 30 )
        var_0["traverseAnim"] = %traverse_wallhop_3;
    else
        var_0["traverseAnim"] = %traverse_wallhop;

    animscripts\traverse\shared::_id_2D86( var_0 );
}

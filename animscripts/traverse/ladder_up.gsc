// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    if ( isdefined( self._id_04D9 ) && self._id_04D9 == "dog" )
        return;

    animscripts\traverse\shared::_id_2D8D( undefined, %ladder_climbup, %ladder_climboff, "noclip", "crouch", "run" );
}

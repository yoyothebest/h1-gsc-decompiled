// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

cover()
{
    self endon( "killanimscript" );
    self _meth_8144( %animscript_root, 0.2 );
    animscripts\utility::_id_9B2B();

    if ( animscripts\utility::_id_5124() )
        var_0 = "idle_combat";
    else
        var_0 = "idle_noncombat";

    var_1 = undefined;

    if ( isdefined( self._id_0C72 ) && isdefined( level._id_78AC[self._id_0C72] ) )
        var_1 = level._id_78AC[self._id_0C72][var_0];

    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( level._id_78AC["default_civilian"] ) )
            return;

        var_1 = level._id_78AC["default_civilian"][var_0];
    }

    thread _id_5F05();

    for (;;)
    {
        self _meth_8111( "idle", common_scripts\utility::_id_710E( var_1 ), %animscript_root, 1, 0.2, 1 );
        self waittillmatch( "idle", "end" );
    }
}

_id_5F05()
{
    self endon( "killanimscript" );

    while ( !isdefined( self._id_1C65 ) )
        wait 1;
}

_id_040F()
{
    cover();
}

_id_3D70()
{
    return anim._id_1E0F[_func_0B2( anim._id_1E0F.size )];
}

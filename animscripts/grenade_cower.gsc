// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "grenadecower" );

    if ( isdefined( self._id_43FC ) )
    {
        self [[ self._id_43FC ]]();
        return;
    }

    if ( self.a._id_6E5A == "prone" )
    {
        animscripts\stop::main();
        return;
    }

    self _meth_8192( "zonly_physics" );
    self _meth_8193( "face angle", self.angles[1] );
    var_0 = 0;

    if ( isdefined( self._id_01CA ) )
        var_0 = _func_0EB( _func_115( self._id_01CA._id_02E2 - self._id_02E2 )[1] - self.angles[1] );
    else
        var_0 = self.angles[1];

    if ( self.a._id_6E5A == "stand" )
    {
        if ( isdefined( self._id_01CA ) && _id_9898( var_0 ) )
            return;

        self _meth_8112( "cowerstart", animscripts\utility::_id_5863( "grenade", "cower_squat" ), %body, 1, 0.2 );
        self._id_2564 = ::squatouttransition;
        animscripts\shared::_id_2D06( "cowerstart" );
    }

    self.a._id_6E5A = "crouch";
    self.a._id_5F5B = "stop";
    self _meth_8112( "cower", animscripts\utility::_id_5863( "grenade", "cower_squat_idle" ), %body, 1, 0.2 );
    animscripts\shared::_id_2D06( "cower" );
    self waittill( "never" );
}

squatouttransition()
{
    self _meth_8193( "face angle", self.angles[1] );
    self._id_02C1 = 1;
    self _meth_8112( "cowerend", animscripts\utility::_id_5863( "grenade", "cower_squat_up" ), %body, 1, 0.4 );
    animscripts\shared::_id_2D06( "cowerend" );
    self._id_2564 = undefined;
    self.a._id_5F5B = "stop";
    self._id_02C1 = 0;
    animscripts\exit_node::_id_8D2E();
}

_id_013F()
{
    self._id_0388 = 1;
}

_id_9898( var_0 )
{
    if ( _func_0B2( 2 ) == 0 )
        return 0;

    if ( self._id_03F1 != "none" )
        return 0;

    var_1 = undefined;

    if ( _func_0BE( var_0 ) > 90 )
        var_1 = animscripts\utility::_id_5863( "grenade", "cower_dive_back" );
    else
        var_1 = animscripts\utility::_id_5863( "grenade", "cower_dive_front" );

    var_2 = _func_092( var_1, 0, 0.5 );
    var_3 = self _meth_81B4( var_2 );

    if ( !self _meth_81C7( var_3 ) )
        return 0;

    self._id_0388 = 0;
    self _meth_8112( "cowerstart", var_1, %body, 1, 0.2 );
    animscripts\shared::_id_2D06( "cowerstart" );
    self._id_0388 = 1;
    return 1;
}

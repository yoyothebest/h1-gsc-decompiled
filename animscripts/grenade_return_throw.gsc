// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self _meth_8193( "face default" );
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "grenade_return_throw" );
    self _meth_8192( "zonly_physics" );
    var_0 = undefined;

    if ( level.h1_improved_grenade_returns )
        var_0 = getgrenadereturnanim_h1();
    else
        var_0 = getgrenadereturnanim();

    self _meth_8112( "throwanim", var_0, %body, 1, 0.3 );
    var_1 = animhasnotetrack( var_0, "grenade_left" ) || animhasnotetrack( var_0, "grenade_right" );

    if ( var_1 )
    {
        animscripts\shared::_id_6869( self._id_0513, "left" );
        thread _id_7068();
        thread _id_622C( "throwanim", "grenade_left" );
        thread _id_622C( "throwanim", "grenade_right" );
        self waittill( "grenade_pickup" );
        self _meth_818D();
        animscripts\battlechatter_ai::_id_33B1( "grenade" );
        self waittillmatch( "throwanim", "grenade_throw" );
    }
    else
    {
        self waittillmatch( "throwanim", "grenade_throw" );
        self _meth_818D();
        animscripts\battlechatter_ai::_id_33B1( "grenade" );
    }

    if ( isdefined( self._id_01CA ) )
        self _meth_81D6();

    self waittillmatch( "throwanim", "finish" );

    if ( var_1 )
    {
        self notify( "put_weapon_back_in_right_hand" );
        animscripts\shared::_id_6869( self._id_0513, "right" );
    }
}

getgrenadereturnanim()
{
    var_1 = 1000;

    if ( isdefined( self._id_0142 ) )
        var_1 = _func_0EE( self._id_02E2, self._id_0142._id_02E2 );

    var_2 = [];

    if ( var_1 < 600 && _id_514E() )
    {
        if ( var_1 < 300 )
        {
            if ( animscripts\utility::_id_9C3B() )
                var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_short_smg" );
            else
                var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_short" );
        }
        else if ( animscripts\utility::_id_9C3B() )
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_long_smg" );
        else
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_long" );
    }

    if ( var_2.size == 0 )
    {
        if ( animscripts\utility::_id_9C3B() )
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_default_smg" );
        else
            var_2 = animscripts\utility::_id_5863( "grenade", "return_throw_default" );
    }

    return var_2[_func_0B2( var_2.size )];
}

getgrenadereturnanim_h1()
{
    var_0 = [];
    var_1 = self._id_01D5;

    if ( self._id_01D4 )
        var_1 = self._id_01D3 - self._id_01CA._id_02E2;

    var_2 = _func_0F2( var_1 );

    if ( var_2 > 0 )
        var_1 = ( var_1[0] / var_2, var_1[1] / var_2, 0 );

    var_3 = _func_0F4( self._id_0500 );
    var_4 = anglestoforward( self.angles );

    if ( var_3 > 1 )
    {
        if ( var_2 < 300 && _id_514E() )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_running_throw_short" );

        if ( var_0.size == 0 )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_running_throw_long" );
    }

    if ( self.a._id_6E5A == "crouch" )
    {
        if ( self._id_0335 == "cover_left" )
        {
            if ( animscripts\corner::hasonekneeup() )
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrl_1knee_throw" );
            else
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrl_2knee_throw" );
        }
        else if ( self._id_0335 == "cover_right" )
        {
            if ( animscripts\corner::hasonekneeup() )
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrr_1knee_throw" );
            else
                var_0 = animscripts\utility::_id_5863( "grenade", "return_cornercrr_2knee_throw" );
        }
        else if ( self._id_0335 == "cover_crouch" )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_covercrouch_throw" );

        if ( var_0.size == 0 )
            var_0 = animscripts\utility::_id_5863( "grenade", "return_crouching_throw" );
    }

    if ( var_0.size == 0 )
        var_0 = animscripts\utility::_id_5863( "grenade", "return_standing_throw" );

    var_5 = _func_0F6( var_1, var_4 );
    var_6 = var_1[0] * var_4[1] - var_4[0] * var_1[1];
    var_7 = _func_1F4( var_6, var_5 );
    var_8 = _func_0BC( _func_0E4( ( var_7 + 180 ) / 90 ) );
    var_8 %= var_0.size;
    return var_0[var_8];
}

_id_514E()
{
    var_0 = ( self._id_02E2[0], self._id_02E2[1], self._id_02E2[2] + 20 );
    var_1 = var_0 + anglestoforward( self.angles ) * 50;
    return _func_08E( var_0, var_1, 0, undefined );
}

_id_7068()
{
    self endon( "death" );
    self endon( "put_weapon_back_in_right_hand" );
    self waittill( "killanimscript" );
    animscripts\shared::_id_6869( self._id_0513, "right" );
}

_id_622C( var_0, var_1 )
{
    self endon( "killanimscript" );
    self endon( "grenade_pickup" );
    self waittillmatch( var_0, var_1 );
    self notify( "grenade_pickup" );
}

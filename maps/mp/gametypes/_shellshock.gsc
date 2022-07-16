// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{

}

_id_83BE( var_0, var_1 )
{
    if ( maps\mp\_flashgrenades::_id_5107() )
        return;

    if ( maps\mp\_utility::_id_51E3() || maps\mp\_utility::_id_512B() )
        return;

    if ( var_0 == "MOD_EXPLOSIVE" || var_0 == "MOD_GRENADE" || var_0 == "MOD_GRENADE_SPLASH" || var_0 == "MOD_PROJECTILE" || var_0 == "MOD_PROJECTILE_SPLASH" )
    {
        if ( var_1 > 10 )
        {
            if ( !maps\mp\_utility::_id_05CB( "specialty_hard_shell" ) )
                self _meth_8186( "frag_grenade_mp", 0.5 );
        }
    }
}

_id_31B8()
{
    self waittill( "death" );
    waitframe;
    self notify( "end_explode" );
}

_id_43E9()
{
    thread _id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    _func_1C7( "grenade_rumble", var_0 );
    _func_18C( 0.5, 0.75, var_0, 800 );

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( _func_0F0( var_0, var_2._id_02E2 ) > 360000 )
            continue;

        if ( var_2 _meth_81DA( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 _meth_82F8( "ui_hud_shake", 1 );
    }
}

_id_2A70( var_0 )
{
    self notify( "dirtEffect" );
    self endon( "dirtEffect" );
    self endon( "disconnect" );

    if ( !maps\mp\_utility::_id_5189( self ) )
        return;

    var_1 = _func_114( anglestoforward( self.angles ) );
    var_2 = _func_114( anglestoright( self.angles ) );
    var_3 = _func_114( var_0 - self._id_02E2 );
    var_4 = _func_0F6( var_3, var_1 );
    var_5 = _func_0F6( var_3, var_2 );
    var_6 = [ "death", "damage" ];

    if ( var_4 > 0 && var_4 > 0.5 )
        common_scripts\utility::_id_A06B( var_6, 2.0 );
    else if ( _func_0BE( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            common_scripts\utility::_id_A06B( var_6, 2.0 );
        else
            common_scripts\utility::_id_A06B( var_6, 2.0 );
    }
}

_id_14B8( var_0 )
{
    self notify( "bloodEffect" );
    self endon( "bloodEffect" );
    self endon( "disconnect" );

    if ( !maps\mp\_utility::_id_5189( self ) )
        return;

    var_1 = _func_114( anglestoforward( self.angles ) );
    var_2 = _func_114( anglestoright( self.angles ) );
    var_3 = _func_114( var_0 - self._id_02E2 );
    var_4 = _func_0F6( var_3, var_1 );
    var_5 = _func_0F6( var_3, var_2 );
    var_6 = [ "death", "damage" ];

    if ( var_4 > 0 && var_4 > 0.5 )
        common_scripts\utility::_id_A06B( var_6, 7.0 );
    else if ( _func_0BE( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            common_scripts\utility::_id_A06B( var_6, 7.0 );
        else
            common_scripts\utility::_id_A06B( var_6, 7.0 );
    }
}

_id_14B9()
{
    self endon( "disconnect" );
    wait 0.5;

    if ( _func_1A1( self ) )
        common_scripts\utility::_id_A0A0( "death", 1.5 );
}

_id_196B()
{
    thread _id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    _func_1C7( "grenade_rumble", var_0 );
    _func_18C( 0.4, 0.75, var_0, 512 );

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( _func_0EE( var_0, var_2._id_02E2 ) > 512 )
            continue;

        if ( var_2 _meth_81DA( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 _meth_82F8( "ui_hud_shake", 1 );
    }
}

_id_12E5()
{
    var_0 = self._id_02E2;
    _func_1C7( "grenade_rumble", var_0 );
    _func_18C( 0.4, 0.5, var_0, 512 );

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( _func_0EE( var_0, var_2._id_02E2 ) > 512 )
            continue;

        if ( var_2 _meth_81DA( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 _meth_82F8( "ui_hud_shake", 1 );
    }
}

_id_0D32()
{
    var_0 = self._id_02E2;
    _func_1C7( "artillery_rumble", self._id_02E2 );
    _func_18C( 0.7, 0.5, self._id_02E2, 800 );

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( _func_0EE( var_0, var_2._id_02E2 ) > 600 )
            continue;

        if ( var_2 _meth_81DA( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 _meth_82F8( "ui_hud_shake", 1 );
    }
}

_id_8E17( var_0 )
{
    _func_1C7( "grenade_rumble", var_0 );
    _func_18C( 0.6, 0.6, var_0, 2000 );

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( _func_0EE( var_0, var_2._id_02E2 ) > 1000 )
            continue;

        if ( var_2 _meth_81DA( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 _meth_82F8( "ui_hud_shake", 1 );
    }
}

_id_0999( var_0 )
{
    _func_1C7( "artillery_rumble", var_0 );
    _func_18C( 0.7, 0.75, var_0, 1000 );

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 maps\mp\_utility::_id_51E3() || var_2 maps\mp\_utility::_id_512B() )
            continue;

        if ( _func_0EE( var_0, var_2._id_02E2 ) > 900 )
            continue;

        if ( var_2 _meth_81DA( var_0 ) )
            var_2 thread _id_2A70( var_0 );

        var_2 _meth_82F8( "ui_hud_shake", 1 );
    }
}

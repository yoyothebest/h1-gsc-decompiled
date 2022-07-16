// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = getentarray( "leaking", "targetname" );

    if ( !var_0.size )
        return;

    var_0 thread _id_6EDB();
    var_0 thread _id_5BBE();
    common_scripts\utility::_id_0D13( var_0, ::leak_setup );
}

leak_setup()
{
    switch ( self._id_0398 )
    {
        case "barrel_oil":
            leak_barrel_setup();
            break;
        case "barrel_acid":
            leak_barrel_setup();
            break;
        case "barrel_sludge":
            leak_barrel_setup();
            break;
        case "barrel_water":
            leak_barrel_setup();
            break;
    }

    thread leak_think();
}

leak_barrel_setup()
{
    self.a = self._id_02E2;
    self._id_04E0 = anglestoup( self.angles );
    var_0 = anglestoup( ( 0, 90, 0 ) );
    self._id_6581 = self.a + self._id_04E0 * 22;
    self.a += self._id_04E0 * 1.5;
    self.b = self.a + self._id_04E0 * 41.4;
    self._id_9F3C = 25861.7;
    self.curvol = self._id_9F3C;
    var_1 = _func_0F6( self._id_04E0, var_0 );
    var_2 = self.b;

    if ( var_1 < 0 )
        var_2 = self.a;

    var_1 = _func_0BE( 1 - _func_0BE( var_1 ) );
    self.lowz = _func_08F( self._id_6581, self._id_6581 + ( 0, 0, -80 ) )[2];
    self.highz = var_2[2] + var_1 * 14;
}

leak_think()
{
    self _meth_82BC( 1 );
    self.canspawnpool = isdefined( level._id_058F["leak_interactive_pool"] ) && isdefined( level._id_058F["leak_interactive_pool"][self._id_0398] );
    self endon( "drained" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        var_3 = self [[ level._leak_methods[var_4] ]]( var_3, var_4 );

        if ( !isdefined( var_3 ) )
            continue;

        thread leak_drain( var_3 );
    }
}

leak_drain( var_0 )
{
    var_1 = _func_0ED( self.a, self.b, var_0 );
    var_2 = undefined;

    if ( var_1 == self.a )
        var_2 = self._id_04E0 * -1;
    else if ( var_1 == self.b )
        var_2 = self._id_04E0;
    else
        var_2 = _func_0EC( self.a, self.b, var_0 );

    var_3 = var_0[2] - self.lowz;

    if ( var_3 < 0.02 )
        var_3 = 0;

    var_4 = var_3 / ( self.highz - self.lowz ) * self._id_9F3C;

    if ( self.curvol > var_4 )
    {
        if ( self.canspawnpool )
            thread leak_pool( var_0, var_2 );

        thread common_scripts\utility::_id_69C2( level._id_0662["leak_interactive_leak"][self._id_0398], var_0 );

        while ( self.curvol > var_4 )
        {
            playfx( level._id_058F["leak_interactive_leak"][self._id_0398], var_0, var_2 );
            self.curvol -= 100;
            wait 0.1;
        }

        playfx( level._id_058F["leak_interactive_drain"][self._id_0398], var_0, var_2 );
    }

    if ( self.curvol / self._id_9F3C <= 0.05 )
        self notify( "drained" );
}

leak_pool( var_0, var_1 )
{
    self.canspawnpool = 0;
    playfx( level._id_058F["leak_interactive_pool"][self._id_0398], var_0, var_1 );
    wait 0.5;
    self.canspawnpool = 1;
}

_id_5BBE()
{
    level._leak_methods = [];
    level._leak_methods["MOD_UNKNOWN"] = ::leak_calc_splash;
    level._leak_methods["MOD_PISTOL_BULLET"] = ::leak_calc_ballistic;
    level._leak_methods["MOD_RIFLE_BULLET"] = ::leak_calc_ballistic;
    level._leak_methods["MOD_GRENADE"] = ::leak_calc_splash;
    level._leak_methods["MOD_GRENADE_SPLASH"] = ::leak_calc_splash;
    level._leak_methods["MOD_PROJECTILE"] = ::leak_calc_splash;
    level._leak_methods["MOD_PROJECTILE_SPLASH"] = ::leak_calc_splash;
    level._leak_methods["MOD_MELEE"] = ::leak_calc_nofx;
    level._leak_methods["MOD_HEAD_SHOT"] = ::leak_calc_nofx;
    level._leak_methods["MOD_CRUSH"] = ::leak_calc_nofx;
    level._leak_methods["MOD_TELEFRAG"] = ::leak_calc_nofx;
    level._leak_methods["MOD_FALLING"] = ::leak_calc_nofx;
    level._leak_methods["MOD_SUICIDE"] = ::leak_calc_nofx;
    level._leak_methods["MOD_TRIGGER_HURT"] = ::leak_calc_splash;
    level._leak_methods["MOD_EXPLOSIVE"] = ::leak_calc_splash;
    level._leak_methods["MOD_IMPACT"] = ::leak_calc_nofx;
    level._leak_methods["MOD_EXPLOSIVE_BULLET"] = ::leak_calc_ballistic;
}

leak_calc_ballistic( var_0, var_1 )
{
    return var_0;
}

leak_calc_splash( var_0, var_1 )
{
    var_2 = _func_114( _func_0EC( self.a, self.b, var_0 ) );
    var_0 = _func_0ED( self.a, self.b, var_0 );
    return var_0 + var_2 * 4;
}

leak_calc_nofx( var_0, var_1 )
{
    return undefined;
}

leak_calc_assert( var_0, var_1 )
{

}

_id_6EDB()
{
    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "barrel_oil" )
            continue;

        level._id_058F["leak_interactive_leak"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_leak" );
        level._id_058F["leak_interactive_pool"][self[var_0]._id_0398] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._id_058F["leak_interactive_drain"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0]._id_0398] = "h1_oil_spill_start";
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "barrel_acid" )
            continue;

        level._id_058F["leak_interactive_leak"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_leak" );
        level._id_058F["leak_interactive_pool"][self[var_0]._id_0398] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._id_058F["leak_interactive_drain"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0]._id_0398] = "h1_oil_spill_start";
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "barrel_water" )
            continue;

        level._id_058F["leak_interactive_leak"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_leak" );
        level._id_058F["leak_interactive_pool"][self[var_0]._id_0398] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._id_058F["leak_interactive_drain"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0]._id_0398] = "h1_oil_spill_start";
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "barrel_sludge" )
            continue;

        level._id_058F["leak_interactive_leak"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_leak" );
        level._id_058F["leak_interactive_pool"][self[var_0]._id_0398] = loadfx( "fx/misc/oilsplash_decal_spawner" );
        level._id_058F["leak_interactive_drain"][self[var_0]._id_0398] = loadfx( "fx/impacts/barrel_drain" );
        level._id_0662["leak_interactive_leak"][self[var_0]._id_0398] = "h1_oil_spill_start";
        break;
    }
}

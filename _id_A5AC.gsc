// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "cobrapilot_surface_to_air_missiles_enabled" ) == "" )
        setdvar( "cobrapilot_surface_to_air_missiles_enabled", "1" );

    _id_98A3();
    thread _id_37E1();
    thread _id_9999();
    thread _id_297E();
}

_id_297E()
{
    self waittill( "death" );
    self _meth_802B();
}

_id_9999()
{
    self endon( "death" );

    if ( !isdefined( self._id_7AFF ) )
        return;

    if ( self._id_7AFF == 0 )
        return;

    self._id_0E48 = 30000;

    if ( isdefined( self._id_0351 ) )
        self._id_0E48 = self._id_0351;

    while ( !isdefined( level._id_1FFE ) )
        wait 0.05;

    var_0 = 1.0;

    if ( level._id_1FFE == "easy" )
        var_0 = 0.5;
    else if ( level._id_1FFE == "medium" )
        var_0 = 1.7;
    else if ( level._id_1FFE == "hard" )
        var_0 = 1.0;
    else if ( level._id_1FFE == "insane" )
        var_0 = 1.5;

    self._id_0E48 *= var_0;

    if ( getdvar( "cobrapilot_debug" ) == "1" )
        iprintln( "surface-to-air missile range difficultyScaler = " + var_0 );

    for (;;)
    {
        wait(2 + _func_0B3( 1 ));
        var_1 = undefined;
        var_1 = _id_A53F::_id_3F7F( self._id_0E48, undefined, 0, 1 );

        if ( !isdefined( var_1 ) )
            continue;

        var_2 = var_1._id_02E2;

        if ( isdefined( var_1._id_7AED ) )
            var_2 += ( 0, 0, var_1._id_7AED );

        self _meth_825D( var_2 );
        level thread _id_9984( self, 5.0 );
        self waittill( "turret_rotate_stopped" );
        self _meth_825F();

        if ( _func_0EE( self._id_02E2, var_1._id_02E2 ) > self._id_0E48 )
            continue;

        var_3 = 0;
        var_3 = _func_08E( self._id_02E2, var_1._id_02E2 + ( 0, 0, 150 ), 0, self );

        if ( !var_3 )
            continue;

        if ( getdvar( "cobrapilot_surface_to_air_missiles_enabled" ) == "1" )
        {
            self notify( "shoot_target", var_1 );
            self waittill( "missile_fired", var_4 );

            if ( isdefined( var_4 ) )
            {
                if ( level._id_1FFE == "hard" )
                {
                    wait(1 + _func_0B3( 2 ));
                    continue;
                }
                else if ( level._id_1FFE == "insane" )
                    continue;
                else
                    var_4 waittill( "death" );
            }

            continue;
        }
    }
}

_id_9984( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "turret_rotate_stopped" );
    wait(var_1);
    var_0 notify( "turret_rotate_stopped" );
}

_id_A346( var_0 )
{
    var_1 = _func_0EE( ( self._id_02E2[0], self._id_02E2[1], 0 ), ( var_0._id_02E2[0], var_0._id_02E2[1], 0 ) );
    var_2 = var_0._id_02E2[2] - self._id_02E2[2];

    if ( var_2 <= 750 )
        return 0;

    var_3 = var_2 * 2.5;

    if ( var_1 <= self._id_0E48 + var_3 )
        return 1;

    return 0;
}

_id_37E1()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "shoot_target", var_0 );
        var_1 = undefined;

        if ( !isdefined( var_0._id_7AED ) )
            var_0._id_7AED = 0;

        var_2 = ( 0, 0, var_0._id_7AED );
        var_1 = self _meth_8264( self._id_5CCA[self._id_5CBD], var_0, var_2 );
        var_1 thread _id_A5A4::_id_69C6( "weap_bm21_missile_projectile" );

        if ( getdvar( "cobrapilot_debug" ) == "1" )
            level thread _id_2DC0( var_1, var_0, var_2 );

        if ( !isdefined( var_0._id_4C2D ) )
            var_0._id_4C2D = [];

        var_0._id_4C2D = common_scripts\utility::_id_0CDA( var_0._id_4C2D, var_1 );
        thread _id_A53F::_id_5C8F( var_1, var_0 );

        if ( _id_A5A4::_id_4749( self._id_5CBF, self._id_5CCA[self._id_5CBD] ) )
            self _meth_802A( self._id_5CBF, self._id_5CCA[self._id_5CBD] );

        self._id_5CBD++;
        self._id_5CB3--;
        var_0 notify( "incomming_missile", var_1 );
        _id_98A3();
        wait 0.05;
        self notify( "missile_fired", var_1 );
    }
}

_id_2DC0( var_0, var_1, var_2 )
{
    var_0 endon( "death" );

    for (;;)
        wait 0.05;
}

_id_98A3()
{
    if ( !isdefined( self._id_5CB3 ) )
        self._id_5CB3 = 0;

    if ( !isdefined( self._id_5CBD ) )
        self._id_5CBD = 0;

    if ( self._id_5CB3 > 0 )
        return;

    for ( var_0 = 0; var_0 < self._id_5CCA.size; var_0++ )
    {
        if ( _id_A5A4::_id_4749( self._id_5CBF, self._id_5CCA[var_0] ) )
            self _meth_801D( self._id_5CBF, self._id_5CCA[var_0] );
    }

    self._id_5CB3 = self._id_5CCA.size;
    self._id_5CBD = 0;
}

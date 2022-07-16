// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

playerjavelinads()
{
    if ( self _meth_833D() < 1.0 )
        return 0;

    var_0 = self _meth_830E();

    if ( !_func_120( var_0, "javelin" ) )
        return 0;

    return 1;
}

insidejavelinreticlenolock( var_0 )
{
    return _func_0A1( var_0, self, 25, 60, 30 );
}

insidejavelinreticlelocked( var_0 )
{
    return _func_0A1( var_0, self, 25, 90, 45 );
}

clearclutarget()
{
    self notify( "javelin_clu_cleartarget" );
    self notify( "stop_lockon_sound" );
    level.javelinlockstarttime = 0;
    level.javelinlockstarted = 0;
    level.javelinlockfinalized = 0;
    level.javelintarget = undefined;
    self _meth_82E3();
    self _meth_82E4( 0 );
    self _meth_829F( 0 );
    setomnvar( "ui_javelin_lock_status", 0 );
}

getbestjavelintarget()
{
    var_0 = _func_0A5();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( insidejavelinreticlenolock( var_0[var_2] ) )
            var_1[var_1.size] = var_0[var_2];

        _func_0A0( var_0[var_2], "javelin_hud_target_offscreen" );
    }

    if ( var_1.size == 0 )
        return undefined;

    var_3 = var_1[0];

    if ( var_1.size > 1 )
    {

    }

    return var_3;
}

isstillvalidtarget( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !_func_0A6( var_0 ) )
        return 0;

    if ( !insidejavelinreticlelocked( var_0 ) )
        return 0;

    return 1;
}

settargettooclose( var_0 )
{
    var_1 = 1000;

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = _func_0EF( self._id_02E2, var_0._id_02E2 );

    if ( var_2 < var_1 )
        self _meth_82E4( 1 );
    else
        self _meth_82E4( 0 );
}

setnoclearance()
{
    var_0 = 60;
    var_1 = 10;
    var_2 = 400;
    var_3 = ( 0, 1, 0 );
    var_4 = ( 1, 0, 0 );
    var_5 = [];
    var_5[0] = ( 0, 0, 80 );
    var_5[1] = ( -40, 0, 120 );
    var_5[2] = ( 40, 0, 120 );
    var_5[3] = ( -40, 0, 40 );
    var_5[4] = ( 40, 0, 40 );

    if ( getdvar( "missileDebugDraw" ) == "1" )
        var_6 = 1;
    else
        var_6 = 0;

    var_7 = self _meth_8338();
    var_8 = anglestoforward( var_7 );
    var_9 = anglestoright( var_7 );
    var_10 = anglestoup( var_7 );
    var_11 = self._id_02E2 + ( 0, 0, var_0 ) + var_9 * var_1;
    var_12 = 0;

    for ( var_13 = 0; var_13 < var_5.size; var_13++ )
    {
        var_14 = var_11 + var_8 * var_2 + var_10 * var_5[var_13][2] + var_9 * var_5[var_13][0];
        var_15 = _func_06B( var_11, var_14, 0, undefined );

        if ( var_15["fraction"] < 1 )
        {
            var_12 = 1;

            if ( var_6 )
            {

            }
            else
                break;

            continue;
        }

        if ( var_6 )
        {

        }
    }

    self _meth_829F( var_12 );
}

javelincluloop()
{
    self endon( "death" );
    self endon( "javelin_clu_off" );

    for (;;)
    {
        wait 0.05;
        var_0 = self _meth_82ED();

        if ( !var_0 )
        {
            clearclutarget();
            continue;
        }

        if ( level.javelinlockfinalized )
        {
            if ( !isstillvalidtarget( level.javelintarget ) )
            {
                clearclutarget();
                continue;
            }

            settargettooclose( level.javelintarget );
            setnoclearance();
            continue;
        }

        if ( level.javelinlockstarted )
        {
            if ( !isstillvalidtarget( level.javelintarget ) )
            {
                clearclutarget();
                continue;
            }

            var_1 = gettime() - level.javelinlockstarttime;

            if ( var_1 < level.locklength )
                continue;

            self notify( "stop_lockon_sound" );
            level.javelinlockfinalized = 1;
            wait 0.2;
            self _meth_82E2( level.javelintarget );
            self _meth_82F1( "javelin_clu_lock" );
            settargettooclose( level.javelintarget );
            setnoclearance();
            setomnvar( "ui_javelin_lock_status", 2 );
            continue;
        }

        var_2 = getbestjavelintarget();

        if ( !isdefined( var_2 ) )
            continue;

        level.javelintarget = var_2;
        level.javelinlockstarttime = gettime();
        level.javelinlockstarted = 1;
        setomnvar( "ui_javelin_lock_status", 1 );
        self _meth_82E1( var_2 );
        thread looplocalseeksound( "javelin_clu_aquiring_lock", 0.6 );
    }
}

javelintoggleloop()
{
    self endon( "death" );

    for (;;)
    {
        while ( !playerjavelinads() )
            wait 0.05;

        thread javelincluloop();

        while ( playerjavelinads() )
            wait 0.05;

        self notify( "javelin_clu_off" );
        clearclutarget();
    }
}

traceconstanttest()
{
    for (;;)
    {
        wait 0.05;
        setnoclearance();
    }
}

init()
{
    level.locklength = 2000;
    setomnvar( "ui_javelin", 1 );
    precacheshader( "javelin_hud_target_offscreen" );
    common_scripts\utility::_id_0D13( level._id_0323, ::clearclutarget );
    _func_0D6( "vehHudTargetSize", 30 );
    _func_0D6( "vehHudTargetScreenEdgeClampBufferLeft", 95 );
    _func_0D6( "vehHudTargetScreenEdgeClampBufferRight", 95 );
    _func_0D6( "vehHudTargetScreenEdgeClampBufferTop", 139 );
    _func_0D6( "vehHudTargetScreenEdgeClampBufferBottom", 134 );
    _func_0D6( "vehHudTargetingCornerLockTime", level.locklength / 1000 );
    common_scripts\utility::_id_0D13( level._id_0323, ::javelintoggleloop );
}

looplocalseeksound( var_0, var_1 )
{
    self endon( "stop_lockon_sound" );

    for (;;)
    {
        self _meth_82F1( var_0 );
        wait(var_1);
    }
}

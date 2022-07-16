// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacherumble( "stinger_lock_rumble" );

    foreach ( var_1 in level._id_0323 )
        var_1 clearirtarget();

    foreach ( var_1 in level._id_0323 )
    {
        var_1 thread stingerfirednotify();
        var_1 thread stingertoggleloop();
    }
}

clearirtarget()
{
    if ( !isdefined( self.stinger ) )
        self.stinger = spawnstruct();

    self.stinger._id_8E48 = 0;
    self.stinger.stingerlockstarted = 0;
    self.stinger.stingerlockfinalized = 0;
    self.stinger._id_8E5A = undefined;
    self notify( "stinger_irt_cleartarget" );
    self notify( "stop_lockon_sound" );
    self notify( "stop_locked_sound" );
    self.stinger.stingerlocksound = undefined;
    self _meth_80B1( "stinger_lock_rumble" );
    self _meth_82E3();
    self _meth_82E4( 0 );
    self _meth_829F( 0 );
    self _meth_82F2( "stinger_clu_lock" );
    self _meth_82F2( "stinger_clu_aquiring_lock" );
}

stingerfirednotify()
{
    for (;;)
    {
        self waittill( "weapon_fired" );
        var_0 = self _meth_830E();

        if ( var_0 != "stinger" )
            continue;

        self notify( "stinger_fired" );
    }
}

stingertoggleloop()
{
    self endon( "death" );

    for (;;)
    {
        while ( !playerstingerads() )
            wait 0.05;

        thread stingerirtloop();

        while ( playerstingerads() )
            wait 0.05;

        self notify( "stinger_IRT_off" );
        clearirtarget();
    }
}

stingerirtloop()
{
    self endon( "death" );
    self endon( "stinger_IRT_off" );
    var_0 = 2000;

    for (;;)
    {
        wait 0.05;

        if ( self.stinger.stingerlockfinalized )
        {
            if ( !isstillvalidtarget( self.stinger._id_8E5A ) )
            {
                clearirtarget();
                continue;
            }

            thread looplocallocksound( "stinger_clu_lock", 0.75 );
            settargettooclose( self.stinger._id_8E5A );
            setnoclearance();
            continue;
        }

        if ( self.stinger.stingerlockstarted )
        {
            if ( !isstillvalidtarget( self.stinger._id_8E5A ) )
            {
                clearirtarget();
                continue;
            }

            var_1 = gettime() - self.stinger._id_8E48;

            if ( var_1 < var_0 )
                continue;

            self notify( "stop_lockon_sound" );
            self.stinger.stingerlockfinalized = 1;
            self _meth_82E2( self.stinger._id_8E5A );
            settargettooclose( self.stinger._id_8E5A );
            setnoclearance();
            continue;
        }

        var_2 = getbeststingertarget();

        if ( !isdefined( var_2 ) )
            continue;

        self.stinger._id_8E5A = var_2;
        self.stinger._id_8E48 = gettime();
        self.stinger.stingerlockstarted = 1;
        thread looplocalseeksound( "stinger_clu_aquiring_lock", 0.6 );
    }
}

getbeststingertarget()
{
    var_0 = _func_0A5();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( insidestingerreticlenolock( var_0[var_2] ) )
            var_1[var_1.size] = var_0[var_2];
    }

    if ( var_1.size == 0 )
        return undefined;

    var_3 = var_1[0];

    if ( var_1.size > 1 )
    {

    }

    return var_3;
}

insidestingerreticlenolock( var_0 )
{
    return _func_0A2( var_0, self, 65, 60 );
}

insidestingerreticlelocked( var_0 )
{
    return _func_0A2( var_0, self, 65, 75 );
}

isstillvalidtarget( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !_func_0A6( var_0 ) )
        return 0;

    if ( !insidestingerreticlelocked( var_0 ) )
        return 0;

    return 1;
}

playerstingerads()
{
    var_0 = self _meth_830E();

    if ( var_0 != "stinger" )
        return 0;

    if ( self _meth_833D() == 1.0 )
        return 1;

    return 0;
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

settargettooclose( var_0 )
{
    var_1 = 1000;

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = _func_0EF( self._id_02E2, var_0._id_02E2 );

    if ( var_2 < var_1 )
    {
        self.stinger.targettoclose = 1;
        self _meth_82E4( 1 );
    }
    else
    {
        self.stinger.targettoclose = 0;
        self _meth_82E4( 0 );
    }
}

looplocalseeksound( var_0, var_1 )
{
    self endon( "stop_lockon_sound" );
    self endon( "death" );

    for (;;)
    {
        self _meth_82F1( var_0 );
        self _meth_80AF( "stinger_lock_rumble" );
        wait(var_1);
    }
}

looplocallocksound( var_0, var_1 )
{
    self endon( "stop_locked_sound" );
    self endon( "death" );

    if ( isdefined( self.stinger.stingerlocksound ) )
        return;

    self.stinger.stingerlocksound = 1;

    for (;;)
    {
        self _meth_82F1( var_0 );
        self _meth_80AF( "stinger_lock_rumble" );
        wait(var_1 / 3);
        self _meth_80AF( "stinger_lock_rumble" );
        wait(var_1 / 3);
        self _meth_80AF( "stinger_lock_rumble" );
        wait(var_1 / 3);
        self _meth_80B1( "stinger_lock_rumble" );
    }

    self.stinger.stingerlocksound = undefined;
}

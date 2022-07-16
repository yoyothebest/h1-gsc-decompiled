// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4D17()
{
    level._id_5BD9["easy"]["convergenceTime"] = 2.5;
    level._id_5BD9["easy"]["suppressionTime"] = 3.0;
    level._id_5BD9["easy"]["accuracy"] = 0.38;
    level._id_5BD9["easy"]["aiSpread"] = 2;
    level._id_5BD9["easy"]["playerSpread"] = 0.5;
    level._id_5BD9["medium"]["convergenceTime"] = 1.5;
    level._id_5BD9["medium"]["suppressionTime"] = 3.0;
    level._id_5BD9["medium"]["accuracy"] = 0.38;
    level._id_5BD9["medium"]["aiSpread"] = 2;
    level._id_5BD9["medium"]["playerSpread"] = 0.5;
    level._id_5BD9["hard"]["convergenceTime"] = 0.8;
    level._id_5BD9["hard"]["suppressionTime"] = 3.0;
    level._id_5BD9["hard"]["accuracy"] = 0.38;
    level._id_5BD9["hard"]["aiSpread"] = 2;
    level._id_5BD9["hard"]["playerSpread"] = 0.5;
    level._id_5BD9["fu"]["convergenceTime"] = 0.4;
    level._id_5BD9["fu"]["suppressionTime"] = 3.0;
    level._id_5BD9["fu"]["accuracy"] = 0.38;
    level._id_5BD9["fu"]["aiSpread"] = 2;
    level._id_5BD9["fu"]["playerSpread"] = 0.5;
}

main()
{
    if ( getdvar( "mg42" ) == "" )
        setdvar( "mgTurret", "off" );

    level._id_58D9 = 24;
    var_0 = getentarray( "turretInfo", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] delete();
}

_id_6E4A()
{
    self _meth_802A( "weapon_mg42_carry", "tag_origin" );
    self endon( "death" );
    self._id_01C4 = level._id_2780;

    if ( isdefined( self._id_04A4 ) )
    {
        var_0 = _func_0C3( self._id_04A4, "targetname" );

        if ( isdefined( var_0 ) )
        {
            if ( isdefined( var_0._id_0351 ) )
                self._id_01C4 = var_0._id_0351;

            self _meth_81A9( var_0 );
        }
    }

    while ( !isdefined( self._id_02BB ) )
        wait 0.05;

    var_1 = undefined;

    if ( isdefined( self._id_04A4 ) )
    {
        var_0 = _func_0C3( self._id_04A4, "targetname" );
        var_1 = var_0;
    }

    if ( !isdefined( var_1 ) )
        var_1 = self._id_02BB;

    if ( !isdefined( var_1 ) )
        return;

    if ( var_1._id_04D9 != "Turret" )
        return;

    var_2 = _id_4104();
    var_2[self._id_02BB._id_02E2 + ""] = undefined;

    if ( isdefined( var_2[var_1._id_02E2 + ""] ) )
        return;

    var_3 = var_1._id_9940;

    if ( isdefined( var_3._id_0374 ) )
        return;

    _id_741E( var_3 );

    if ( var_3._id_519E )
        _id_5665( var_3 );
    else
        _id_76BE( var_3 );

    _id_A557::_id_4476( var_1._id_9940 );
}

_id_5BCC()
{
    self waittill( "trigger" );
    level notify( self._id_04A6 );
    level._id_5BCC[self._id_04A6] = 1;
    self delete();
}

_id_5BD6( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = _func_0D9( "bad_guys" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_7A35 ) && var_0._id_7A35 == var_1[var_2]._id_7A35 )
            var_1[var_2] notify( "auto_ai" );
    }

    var_3 = _func_0DB();

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
    {
        if ( isdefined( var_3[var_2]._id_7A35 ) && var_0._id_7A35 == var_3[var_2]._id_7A35 )
            var_3[var_2]._id_0905 = "auto_ai";
    }

    _id_A581::_id_533E( var_0 );
}

_id_5BC9( var_0 )
{
    self endon( "death" );
    self endon( "stop_suppressionFire" );

    if ( !isdefined( self._id_8FE3 ) )
        self._id_8FE3 = 1;

    for (;;)
    {
        while ( self._id_8FE3 )
        {
            self _meth_8108( var_0[_func_0B2( var_0.size )] );
            wait(2 + _func_0B3( 2 ));
        }

        self _meth_810A();

        while ( !self._id_8FE3 )
            wait 1;
    }
}

_id_5975( var_0 )
{
    var_1 = self._id_02E2;
    self waittill( "auto_ai" );
    var_0 notify( "stopfiring" );
    var_0 _meth_8067( "auto_ai" );
    var_0 _meth_8108( level._id_0318 );
}

_id_192C( var_0 )
{
    if ( var_0 == "delay" )
        return 0.2;
    else if ( var_0 == "delay_range" )
        return 0.5;
    else if ( var_0 == "burst" )
        return 0.5;
    else
        return 1.5;
}

_id_192D()
{
    self endon( "death" );
    self endon( "stop_burst_fire_unmanned" );

    if ( isdefined( self._id_798E ) )
        var_0 = self._id_798E;
    else
        var_0 = _id_192C( "delay" );

    if ( isdefined( self._id_798D ) )
        var_1 = self._id_798D - var_0;
    else
        var_1 = _id_192C( "delay_range" );

    if ( isdefined( self._id_7968 ) )
        var_2 = self._id_7968;
    else
        var_2 = _id_192C( "burst" );

    if ( isdefined( self._id_7967 ) )
        var_3 = self._id_7967 - var_2;
    else
        var_3 = _id_192C( "burst_range" );

    var_4 = gettime();
    var_5 = "start";

    if ( isdefined( self._id_83B8 ) )
        thread _id_998D();

    for (;;)
    {
        var_6 = ( var_4 - gettime() ) * 0.001;

        if ( self _meth_80E6() && var_6 <= 0 )
        {
            if ( var_5 != "fire" )
            {
                var_5 = "fire";
                thread _id_2D79();
            }

            var_6 = var_2 + _func_0B3( var_3 );
            thread _id_99C3( var_6 );
            self waittill( "turretstatechange" );
            var_6 = var_0 + _func_0B3( var_1 );
            var_4 = gettime() + _func_0BC( var_6 * 1000 );
            continue;
        }

        if ( var_5 != "aim" )
            var_5 = "aim";

        thread _id_99C3( var_6 );
        self waittill( "turretstatechange" );
    }
}

_id_2D79()
{
    self endon( "death" );
    self endon( "turretstatechange" );

    for (;;)
    {
        self _meth_80EC();
        self notify( "turret_fire" );
        wait 0.1;
    }
}

_id_998D()
{
    self endon( "death" );
    self endon( "stop_burst_fire_unmanned" );

    if ( isdefined( self._id_83B9 ) )
        self._id_83BA = 1;

    for (;;)
    {
        self waittill( "turret_fire" );
        playfxontag( self._id_83B8, self, "tag_origin" );

        if ( isdefined( self._id_83BA ) && self._id_83BA )
            thread _id_998E();
    }
}

_id_998E()
{
    self endon( "death" );
    self._id_83BA = 0;
    var_0 = self _meth_8184( "tag_origin" );
    var_1 = common_scripts\utility::_id_2F69( var_0, -30 );
    var_2 = var_0[2] - var_1[2];
    var_3 = var_2 / 300;
    wait(var_3);
    level thread common_scripts\utility::_id_69C2( self._id_83B9, var_1 );
    wait 1;
    self._id_83BA = 1;
}

_id_99C3( var_0 )
{
    if ( var_0 <= 0 )
        return;

    self endon( "turretstatechange" );
    wait(var_0);

    if ( isdefined( self ) )
        self notify( "turretstatechange" );
}

_id_7119( var_0 )
{
    self endon( "death" );
    self notify( "stop random_spread" );
    self endon( "stop random_spread" );
    self endon( "stopfiring" );
    self _meth_8108( var_0 );

    for (;;)
    {
        if ( _func_1AD( var_0 ) )
            var_0._id_02E2 = self._id_5974 _meth_8097();
        else
            var_0._id_02E2 = self._id_5974._id_02E2;

        var_0._id_02E2 += ( 20 - _func_0B3( 40 ), 20 - _func_0B3( 40 ), 20 - _func_0B3( 60 ) );
        wait 0.2;
    }
}

_id_5BC4( var_0 )
{
    self notify( "stop_using_built_in_burst_fire" );
    self endon( "stop_using_built_in_burst_fire" );
    var_0 _meth_80E5();

    for (;;)
    {
        var_0 waittill( "startfiring" );
        thread _id_192B( var_0 );
        var_0 _meth_80E4();
        var_0 waittill( "stopfiring" );
        var_0 _meth_80E5();
    }
}

_id_192B( var_0, var_1 )
{
    var_0 endon( "stopfiring" );
    self endon( "stop_using_built_in_burst_fire" );

    if ( isdefined( var_0._id_798E ) )
        var_2 = var_0._id_798E;
    else
        var_2 = _id_192C( "delay" );

    if ( isdefined( var_0._id_798D ) )
        var_3 = var_0._id_798D - var_2;
    else
        var_3 = _id_192C( "delay_range" );

    if ( isdefined( var_0._id_7968 ) )
        var_4 = var_0._id_7968;
    else
        var_4 = _id_192C( "burst" );

    if ( isdefined( var_0._id_7967 ) )
        var_5 = var_0._id_7967 - var_4;
    else
        var_5 = _id_192C( "burst_range" );

    for (;;)
    {
        var_0 _meth_80E4();

        if ( isdefined( var_1 ) )
            var_0 thread _id_7119( var_1 );

        wait(var_4 + _func_0B3( var_5 ));
        var_0 _meth_80E5();
        wait(var_2 + _func_0B3( var_3 ));
    }
}

_id_0663()
{
    if ( !isdefined( self._id_3864 ) )
        self._id_3864 = 0;

    if ( !isdefined( self._id_04A6 ) )
        return;

    var_0 = _func_0C3( self._id_04A6, "target" );

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_7A34 ) )
        return;

    if ( !isdefined( var_0._id_5BC3 ) )
        var_0._id_5BC3 = 1;

    self._id_7A34 = var_0._id_7A34;
    var_1 = 1;

    for (;;)
    {
        if ( var_1 )
        {
            var_1 = 0;

            if ( isdefined( var_0._id_04A6 ) || self._id_3864 )
                self waittill( "get new user" );
        }

        if ( !var_0._id_5BC3 )
        {
            var_0 waittill( "enable mg42" );
            var_0._id_5BC3 = 1;
        }

        var_2 = [];
        var_3 = _func_0D9();

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = 1;

            if ( isdefined( var_3[var_4]._id_7A34 ) && var_3[var_4]._id_7A34 == self._id_7A34 )
                var_5 = 0;

            if ( isdefined( var_3[var_4]._id_9BF5 ) )
                var_5 = 1;

            if ( var_5 )
                var_2[var_2.size] = var_3[var_4];
        }

        if ( var_2.size )
            var_3 = _id_A5A4::_id_3CEF( var_0._id_02E2, undefined, var_2 );
        else
            var_3 = _id_A5A4::_id_3CEE( var_0._id_02E2, undefined );

        var_2 = undefined;

        if ( isdefined( var_3 ) )
        {
            var_3 notify( "stop_going_to_node" );
            var_3 thread _id_A581::_id_4241( var_0 );
            var_3 waittill( "death" );
            continue;
        }

        self waittill( "get new user" );
    }
}

_id_5BCB()
{
    if ( !isdefined( self._id_0905 ) )
        self._id_0905 = "manual_ai";

    var_0 = _func_0C3( self._id_04A4, "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = getent( var_0._id_04A4, "targetname" );
    var_1._id_6581 = var_0._id_02E2;

    if ( isdefined( var_1._id_04A4 ) )
    {
        if ( !isdefined( level._id_5BCC ) || !isdefined( level._id_5BCC[var_1._id_04A4] ) )
        {
            level._id_5BCC[var_1._id_04A4] = 0;
            getent( var_1._id_04A4, "targetname" ) thread _id_5BCC();
        }

        var_2 = 1;
    }
    else
        var_2 = 0;

    for (;;)
    {
        if ( self.count == 0 )
            return;

        var_3 = undefined;

        while ( !isdefined( var_3 ) )
        {
            var_3 = self _meth_8095();
            wait 1;
        }

        var_3 thread _id_5BC6( var_1, var_2, self._id_0905 );
        var_3 thread _id_5BC4( var_1 );
        var_3 waittill( "death" );

        if ( isdefined( self._id_0392 ) )
        {
            wait(self._id_0392);
            continue;
        }

        if ( isdefined( self._id_798E ) && isdefined( self._id_798D ) )
        {
            wait(self._id_798E + _func_0B3( self._id_798D - self._id_798E ));
            continue;
        }

        wait 1;
    }
}

_id_532B( var_0, var_1, var_2, var_3 )
{
    var_0 waittill( var_1 );

    if ( isdefined( var_2 ) )
        var_2 delete();

    if ( isdefined( var_3 ) )
        var_3 delete();
}

_id_5BC6( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( var_2 == "manual_ai" )
    {
        for (;;)
        {
            thread _id_5BC5( var_0, var_1 );
            self waittill( "auto_ai" );
            _id_5F3E( var_0, "auto_ai" );
            self waittill( "manual_ai" );
        }
    }
    else
    {
        for (;;)
        {
            _id_5F3E( var_0, "auto_ai", level._id_0318 );
            self waittill( "manual_ai" );
            thread _id_5BC5( var_0, var_1 );
            self waittill( "auto_ai" );
        }
    }
}

_id_6BF2()
{
    if ( !isdefined( level._id_6ABD ) )
        return 0;

    if ( level._id_0318 _meth_8180() == "prone" )
        return 1;

    if ( level._id_6ABE == "cow" && level._id_0318 _meth_8180() == "crouch" )
        return 1;

    return 0;
}

_id_8AF9()
{
    if ( level._id_0318 _meth_8180() == "prone" )
        return ( 0, 0, 5 );
    else if ( level._id_0318 _meth_8180() == "crouch" )
        return ( 0, 0, 25 );

    return ( 0, 0, 50 );
}

_id_5BC5( var_0, var_1 )
{
    self endon( "death" );
    self endon( "auto_ai" );
    self._id_02E6 = 1;
    self _meth_81AA( var_0._id_6581 );
    self._id_01C4 = level._id_58D9;
    self waittill( "goal" );

    if ( var_1 )
    {
        if ( !level._id_5BCC[var_0._id_04A4] )
            level waittill( var_0._id_04A4 );
    }

    self._id_02E6 = 0;
    var_0 _meth_8067( "auto_ai" );
    var_0 _meth_810A();
    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3._id_782D = 3;

    if ( getdvar( "mg42" ) != "off" )
        var_3 _meth_80B3( "temp" );

    var_3 thread _id_9274( var_0, var_2 );
    level thread _id_532B( self, "death", var_2, var_3 );
    level thread _id_532B( self, "auto_ai", var_2, var_3 );
    var_0._id_6C2D = 0;
    var_4 = 0;
    var_5 = getentarray( "mg42_target", "targetname" );

    if ( var_5.size > 0 )
    {
        var_6 = 1;
        var_7 = var_5[_func_0B2( var_5.size )]._id_02E2;
        thread _id_83DD( var_5 );
        _id_5F3E( var_0 );
        self._id_91A2 = var_2;
        var_0 _meth_8067( "manual_ai" );
        var_0 _meth_8108( var_2 );
        var_0 notify( "startfiring" );
        var_8 = 15;
        var_9 = 0.08;
        var_10 = 0.05;
        var_2._id_02E2 = var_5[_func_0B2( var_5.size )]._id_02E2;
        var_11 = 0;

        while ( !isdefined( level._id_6ABD ) )
        {
            var_7 = var_2._id_02E2;

            if ( _func_0EE( var_7, var_5[self._id_4466]._id_02E2 ) > var_8 )
            {
                var_12 = _func_114( var_5[self._id_4466]._id_02E2 - var_7 );
                var_12 *= var_8;
                var_7 += var_12;
            }
            else
                self notify( "next_target" );

            var_2._id_02E2 = var_7;
            wait 0.1;
        }

        for (;;)
        {
            for ( var_13 = 0; var_13 < 1; var_13 += var_10 )
            {
                var_2._id_02E2 = var_7 * ( 1.0 - var_13 ) + ( level._id_0318 _meth_8097() + _id_8AF9() ) * var_13;

                if ( _id_6BF2() )
                    var_13 = 2;

                wait(var_9);
            }

            var_14 = level._id_0318 _meth_8097();

            while ( !_id_6BF2() )
            {
                var_2._id_02E2 = level._id_0318 _meth_8097();
                var_15 = var_2._id_02E2 - var_14;
                var_2._id_02E2 = var_2._id_02E2 + var_15 + _id_8AF9();
                var_14 = level._id_0318 _meth_8097();
                wait 0.1;
            }

            if ( _id_6BF2() )
            {
                var_11 = gettime() + 1500 + _func_0B3( 4000 );

                while ( _id_6BF2() && isdefined( level._id_6ABD._id_04A4 ) && gettime() < var_11 )
                {
                    var_16 = getentarray( level._id_6ABD._id_04A4, "targetname" );
                    var_16 = var_16[_func_0B2( var_16.size )];
                    var_2._id_02E2 = var_16._id_02E2 + ( _func_0B3( 30 ) - 15, _func_0B3( 30 ) - 15, _func_0B3( 40 ) - 60 );
                    wait 0.1;
                }
            }

            self notify( "next_target" );

            while ( _id_6BF2() )
            {
                var_7 = var_2._id_02E2;

                if ( _func_0EE( var_7, var_5[self._id_4466]._id_02E2 ) > var_8 )
                {
                    var_12 = _func_114( var_5[self._id_4466]._id_02E2 - var_7 );
                    var_12 *= var_8;
                    var_7 += var_12;
                }
                else
                    self notify( "next_target" );

                var_2._id_02E2 = var_7;
                wait 0.1;
            }
        }
    }
    else
    {
        for (;;)
        {
            _id_5F3E( var_0 );

            while ( !isdefined( level._id_6ABD ) )
            {
                if ( !var_0._id_6C2D )
                {
                    var_0 _meth_8108( level._id_0318 );
                    var_0._id_6C2D = 1;
                    var_3._id_9197 = level._id_0318;
                }

                wait 0.2;
            }

            var_0 _meth_8067( "manual_ai" );
            _id_5F3E( var_0 );
            var_0 notify( "startfiring" );
            var_11 = gettime() + 1500 + _func_0B3( 4000 );

            while ( var_11 > gettime() )
            {
                if ( isdefined( level._id_6ABD ) )
                {
                    var_16 = getentarray( level._id_6ABD._id_04A4, "targetname" );
                    var_16 = var_16[_func_0B2( var_16.size )];
                    var_2._id_02E2 = var_16._id_02E2 + ( _func_0B3( 30 ) - 15, _func_0B3( 30 ) - 15, _func_0B3( 40 ) - 60 );
                    var_0 _meth_8108( var_2 );
                    var_3._id_9197 = var_2;
                    wait(_func_0B3( 1 ));
                    continue;
                }

                break;
            }

            var_0 notify( "stopfiring" );
            _id_5F3E( var_0 );

            if ( var_0._id_6C2D )
            {
                var_0 _meth_8067( "auto_ai" );
                var_0 _meth_810A();
                var_0._id_6C2D = 0;
                var_3._id_9197 = var_3;
                var_3._id_02E2 = ( 0, 0, 0 );
            }

            while ( isdefined( level._id_6ABD ) )
                wait 0.2;

            wait(0.75 + _func_0B3( 0.2 ));
        }
    }
}

_id_83DD( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_1 = [];

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
            var_1[var_2] = 0;

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            self._id_4466 = _func_0B2( var_0.size );
            self waittill( "next_target" );

            while ( var_1[self._id_4466] )
            {
                self._id_4466++;

                if ( self._id_4466 >= var_0.size )
                    self._id_4466 = 0;
            }

            var_1[self._id_4466] = 1;
        }
    }
}

_id_5F3E( var_0, var_1, var_2 )
{
    self _meth_81AA( var_0._id_6581 );
    self._id_01C4 = level._id_58D9;
    self waittill( "goal" );

    if ( isdefined( var_1 ) && var_1 == "auto_ai" )
    {
        var_0 _meth_8067( "auto_ai" );

        if ( isdefined( var_2 ) )
            var_0 _meth_8108( var_2 );
        else
            var_0 _meth_810A();
    }

    self _meth_818E( var_0 );
}

_id_9274( var_0, var_1 )
{
    if ( getdvar( "mg42" ) == "off" )
        return;

    self._id_9197 = self;

    for (;;)
    {
        self._id_02E2 = var_1._id_02E2;
        wait 0.1;
    }
}

_id_9999( var_0 )
{
    var_1 = getent( var_0._id_1125, "targetname" );
    var_2 = 0.5;

    if ( isdefined( var_1._id_7B02 ) )
        var_2 = var_1._id_7B02;

    var_3 = 2;

    if ( isdefined( var_1._id_7B01 ) )
        var_2 = var_1._id_7B01;

    for (;;)
    {
        var_1 waittill( "turret_deactivate" );
        wait(var_2 + _func_0B3( var_3 - var_2 ));

        while ( !_func_099( var_1 ) )
        {
            _id_9958( var_0, var_1 );
            wait 1.0;
        }
    }
}

_id_9958( var_0, var_1 )
{
    var_2 = _func_0D9();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3] _meth_8161( var_0._id_02E2 ) && var_2[var_3] _meth_8190( var_1 ) )
        {
            var_4 = var_2[var_3]._id_0231;
            var_2[var_3]._id_0231 = 0;

            if ( !var_2[var_3] _meth_81F3( var_0 ) )
                var_2[var_3]._id_0231 = var_4;
        }
    }
}

_id_7F51()
{
    _id_4D17();
    var_0 = getentarray( "misc_turret", "code_classname" );
    var_1 = _id_A5A4::_id_3F58();

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_7AC5 ) )
        {
            switch ( var_0[var_2]._id_7AC5 )
            {
                case "easy":
                    var_1 = "easy";
                    break;
                case "medium":
                    var_1 = "medium";
                    break;
                case "hard":
                    var_1 = "hard";
                    break;
                case "fu":
                    var_1 = "fu";
                    break;
                default:
                    continue;
            }
        }

        _id_5BC8( var_0[var_2], var_1 );
    }
}

_id_5BC8( var_0, var_1 )
{
    var_0.convergencetime = level._id_5BD9[var_1]["convergenceTime"];
    var_0.suppressiontime = level._id_5BD9[var_1]["suppressionTime"];
    var_0.accuracy = level._id_5BD9[var_1]["accuracy"];
    var_0._id_09A2 = level._id_5BD9[var_1]["aiSpread"];
    var_0._id_6D5F = level._id_5BD9[var_1]["playerSpread"];
}

_id_5BCA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.88;

    self endon( "death" );
    self notify( "stop_mg42_target_drones" );
    self endon( "stop_mg42_target_drones" );
    self._id_2F08 = 0;

    if ( !isdefined( self._id_79D0 ) )
        self._id_79D0 = 0;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    self _meth_8067( "manual_ai" );
    var_3 = _id_A5A4::_id_3F58();

    if ( !isdefined( level._id_2F1A ) )
        var_4 = 1;
    else
        var_4 = 0;

    for (;;)
    {
        if ( var_4 )
        {
            if ( isdefined( self._id_2F24 ) )
                self _meth_8067( self._id_279B );
            else if ( var_0 )
                self _meth_8067( "auto_nonai" );
            else
                self _meth_8067( "auto_ai" );

            level waittill( "new_drone" );
        }

        if ( !isdefined( self._id_63C8 ) )
            self._id_63C8 = self.convergencetime;

        self.convergencetime = 2;

        if ( !var_0 )
        {
            var_5 = self _meth_80ED();

            if ( !_func_1A1( var_5 ) || _func_1AD( var_5 ) )
            {
                wait 0.05;
                continue;
            }
            else
                var_1 = var_5._id_04A7;
        }
        else
            var_5 = undefined;

        if ( var_1 == "allies" )
            var_6 = "axis";
        else
            var_6 = "allies";

        while ( level._id_2F1A[var_6]._id_55AE )
        {
            common_scripts\utility::_id_57FE( "mg42_drones" );

            if ( !level._id_2F1A[var_6]._id_55AE )
            {
                common_scripts\utility::_id_9A45( "mg42_drones" );
                break;
            }

            var_7 = _id_3CDB( var_6, var_2 );
            common_scripts\utility::_id_9A45( "mg42_drones" );

            if ( !isdefined( self._id_79D0 ) || !self._id_79D0 )
            {
                wait 0.05;
                break;
            }

            if ( !isdefined( var_7 ) )
            {
                wait 0.05;
                break;
            }

            if ( isdefined( self._id_0C47 ) )
                [[ self._id_0C47 ]]();

            if ( var_0 )
                self _meth_8067( "manual" );
            else
                self _meth_8067( "manual_ai" );

            self _meth_8108( var_7, ( 0, 0, 32 ) );
            _id_2ED7( var_7, 1, var_2 );
            self _meth_810A();
            self _meth_80E5();

            if ( !var_0 && !( isdefined( self _meth_80ED() ) && self _meth_80ED() == var_5 ) )
                break;
        }

        self.convergencetime = self._id_63C8;
        self._id_63C8 = undefined;
        self _meth_810A();
        self _meth_80E5();

        if ( level._id_2F1A[var_6]._id_55AE )
        {
            var_4 = 0;
            continue;
        }

        var_4 = 1;
    }
}

_id_2ED7( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_3 = gettime() + var_1 * 1000;
    var_4 = 0;

    while ( var_3 > gettime() || var_4 )
    {
        common_scripts\utility::_id_57FE( "mg42_drones_target_trace" );
        var_5 = self _meth_810B( 1 );

        if ( !_func_08D( self _meth_8184( "tag_flash" ), var_0._id_02E2 + ( 0, 0, 40 ), 0, var_0 ) )
        {
            common_scripts\utility::_id_9A45( "mg42_drones_target_trace" );
            break;
        }
        else if ( isdefined( var_5 ) && _func_0EE( var_5._id_02E2, self._id_02E2 ) < _func_0EE( self._id_02E2, var_0._id_02E2 ) )
        {
            common_scripts\utility::_id_9A45( "mg42_drones_target_trace" );
            break;
        }

        if ( !var_4 )
        {
            self _meth_80E4();
            var_4 = 1;
        }

        common_scripts\utility::_id_9A4A( "mg42_drones_target_trace" );
    }

    self _meth_80E5();
    _id_A5A4::_id_8F69( level._id_2F1A[var_0._id_04A7], 1 );
}

_id_3CDB( var_0, var_1 )
{
    if ( level._id_2F1A[var_0]._id_55AE < 1 )
        return;

    var_2 = undefined;
    var_3 = anglestoforward( self.angles );

    for ( var_4 = 0; var_4 < level._id_2F1A[var_0]._id_55AE; var_4++ )
    {
        if ( !isdefined( level._id_2F1A[var_0]._id_0CD8[var_4] ) )
            continue;

        var_5 = _func_115( level._id_2F1A[var_0]._id_0CD8[var_4]._id_02E2 - self._id_02E2 );
        var_6 = anglestoforward( var_5 );

        if ( _func_0F6( var_3, var_6 ) < var_1 )
            continue;

        var_2 = level._id_2F1A[var_0]._id_0CD8[var_4];

        if ( !_func_08D( self _meth_8184( "tag_flash" ), var_2 _meth_8098(), 0, var_2 ) )
        {
            var_2 = undefined;
            continue;
        }

        break;
    }

    var_7 = self _meth_810B( 1 );

    if ( !isdefined( self._id_6EF6 ) )
    {
        if ( isdefined( var_2 ) && isdefined( var_7 ) && _func_0F0( self._id_02E2, var_7._id_02E2 ) < _func_0F0( self._id_02E2, var_2._id_02E2 ) )
            var_2 = undefined;
    }

    return var_2;
}

_id_7820( var_0 )
{
    var_1 = getentarray( "misc_turret", "code_classname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( isdefined( var_1[var_3]._id_04A6 ) )
            continue;

        if ( isdefined( var_1[var_3]._id_51FF ) )
            continue;

        var_2[var_1[var_3]._id_02E2 + ""] = var_1[var_3];
    }

    if ( !var_2.size )
        return;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( var_5._id_04D9 == "Path" )
            continue;

        if ( var_5._id_04D9 == "Begin" )
            continue;

        if ( var_5._id_04D9 == "End" )
            continue;

        var_6 = anglestoforward( ( 0, var_5.angles[1], 0 ) );

        foreach ( var_11, var_8 in var_2 )
        {
            if ( _func_0EE( var_5._id_02E2, var_8._id_02E2 ) > 50 )
                continue;

            var_9 = anglestoforward( ( 0, var_8.angles[1], 0 ) );
            var_10 = _func_0F6( var_6, var_9 );

            if ( var_10 < 0.9 )
                continue;

            var_5._id_99B3 = spawn( "script_origin", var_8._id_02E2 );
            var_5._id_99B3.angles = var_8.angles;
            var_5._id_99B3._id_02BB = var_5;
            var_5._id_99B3._id_024E = 45;
            var_5._id_99B3._id_037D = 45;
            var_5._id_99B3._id_04BC = 15;
            var_5._id_99B3.bottomarc = 15;

            if ( isdefined( var_8._id_024E ) )
                var_5._id_99B3._id_024E = _func_0BF( var_8._id_024E, 45 );

            if ( isdefined( var_8._id_037D ) )
                var_5._id_99B3._id_037D = _func_0BF( var_8._id_037D, 45 );

            if ( isdefined( var_8._id_04BC ) )
                var_5._id_99B3._id_04BC = _func_0BF( var_8._id_04BC, 15 );

            if ( isdefined( var_8.bottomarc ) )
                var_5._id_99B3.bottomarc = _func_0BF( var_8.bottomarc, 15 );

            var_2[var_11] = undefined;
            var_8 delete();
        }
    }
}

_id_1126( var_0 )
{
    var_1 = getentarray( "misc_turret", "code_classname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( !isdefined( var_1[var_3]._id_04A6 ) || _func_123( var_1[var_3]._id_04A6 ) != "find_mgTurret" )
            continue;

        if ( !isdefined( var_1[var_3]._id_3584 ) )
            continue;

        if ( !isdefined( var_1[var_3]._id_79A8 ) )
            var_2[var_1[var_3]._id_02E2 + ""] = var_1[var_3];
    }

    if ( !var_2.size )
        return;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( var_5._id_04D9 == "Path" )
            continue;

        if ( var_5._id_04D9 == "Begin" )
            continue;

        if ( var_5._id_04D9 == "End" )
            continue;

        var_6 = anglestoforward( ( 0, var_5.angles[1], 0 ) );
        var_7 = _func_1D3( var_2 );

        for ( var_3 = 0; var_3 < var_7.size; var_3++ )
        {
            var_8 = var_2[var_7[var_3]];

            if ( _func_0EE( var_5._id_02E2, var_8._id_02E2 ) > 70 )
                continue;

            var_9 = anglestoforward( ( 0, var_8.angles[1], 0 ) );
            var_10 = _func_0F6( var_6, var_9 );

            if ( var_10 < 0.9 )
                continue;

            var_5._id_9940 = var_8;
            var_8._id_02BB = var_5;
            var_8._id_519E = 1;
            var_2[var_7[var_3]] = undefined;
        }
    }

    var_0 = undefined;
}

_id_780D()
{
    self._id_83B4 = [];
    self._id_83B4["connected"] = [];
    self._id_83B4["ambush"] = [];

    if ( !isdefined( self._id_3584 ) )
        return;

    level._id_83B3[self._id_3584] = self;

    if ( isdefined( self._id_7B03 ) )
    {
        var_0 = _func_124( self._id_7B03, " " );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            self._id_83B4["connected"][var_0[var_1]] = 1;
    }

    if ( isdefined( self._id_7B00 ) )
    {
        var_0 = _func_124( self._id_7B00, " " );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            self._id_83B4["ambush"][var_0[var_1]] = 1;
    }
}

_id_74A8()
{
    self notify( "gun_placed_again" );
    self endon( "gun_placed_again" );
    self waittill( "restore_default_drop_pitch" );
    wait 1;
    self _meth_815D();
}

_id_2F96()
{
    thread _id_2F97();
}

_id_2F97()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0._id_02E2 = self _meth_8184( level._id_6E4B );
    var_0.angles = self _meth_8185( level._id_6E4B );
    var_0 _meth_80B3( self._id_99B5 );
    var_1 = anglestoforward( self.angles );
    var_1 *= 100;
    var_0 _meth_82AE( var_1, 0.5 );
    self _meth_802A( self._id_99B5, level._id_6E4B );
    self._id_99B5 = undefined;
    wait 0.7;
    var_0 delete();
}

_id_99AB()
{
    self endon( "kill_turret_detach_thread" );
    self endon( "dropped_gun" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    _id_2F96();
}

_id_99AD()
{
    self endon( "death" );
    self endon( "kill_turret_detach_thread" );
    self waittill( "dropped_gun" );
    self _meth_802A( self._id_99B5, level._id_6E4B );
}

_id_74A9()
{
    self._id_76AF = undefined;
    common_scripts\utility::_id_7DB7( animscripts\init::_id_0138 );
}

_id_74AE()
{
    self waittill( "turret_deactivate" );
    self _meth_815D();
}

_id_9AB8( var_0 )
{
    self endon( "death" );
    self endon( "end_mg_behavior" );
    self endon( "stop_updating_enemy_target_pos" );

    for (;;)
    {
        self waittill( "saw_enemy" );
        var_0._id_02E2 = self._id_5524;
    }
}

_id_5F30( var_0, var_1 )
{
    self endon( "death" );
    self endon( "end_mg_behavior" );
    self endon( "stop_updating_enemy_target_pos" );
    var_2 = self._id_9940._id_02E2 + ( 0, 0, 16 );
    var_3 = var_1._id_02E2 + ( 0, 0, 16 );

    for (;;)
    {
        wait 0.05;

        if ( _func_08E( var_0._id_02E2, var_3, 0, undefined ) )
            continue;

        var_4 = _func_115( var_2 - var_0._id_02E2 );
        var_5 = anglestoforward( var_4 );
        var_5 *= 8;
        var_0._id_02E2 += var_5;
    }
}

_id_7281( var_0 )
{
    self endon( "death" );
    self endon( "end_mg_behavior" );
    self endon( "stop_updating_enemy_target_pos" );
    var_0._id_17C9 = [];

    for (;;)
    {
        var_0._id_17C9[var_0._id_17C9.size] = self._id_02E2 + ( 0, 0, 50 );
        wait 0.35;
    }
}

_id_0971( var_0, var_1 )
{
    if ( !_func_1A1( self._id_24DF ) && self _meth_81C2( self._id_24DF ) )
    {
        var_1._id_02E2 = self._id_5524;
        return;
    }

    var_2 = anglestoforward( var_0.angles );

    for ( var_3 = var_1._id_17C9.size - 3; var_3 >= 0; var_3-- )
    {
        var_4 = var_1._id_17C9[var_3];
        var_5 = _func_114( var_4 - var_0._id_02E2 );
        var_6 = _func_0F6( var_2, var_5 );

        if ( var_6 < 0.75 )
            continue;

        var_1._id_02E2 = var_4;

        if ( _func_08E( var_0._id_02E2, var_4, 0, undefined ) )
            continue;

        break;
    }
}

_id_3751( var_0 )
{
    var_1 = _id_3E36( var_0 );
    var_2 = var_1["spot"];
    var_3 = var_1["type"];

    if ( !isdefined( var_2 ) )
        return;

    _id_741E( var_2 );
    thread _id_9AB8( var_0 );
    thread _id_5F30( var_0, var_2 );

    if ( var_3 == "ambush" )
        thread _id_7281( var_0 );

    if ( var_2._id_519E )
        _id_5665( var_2 );
    else
    {
        _id_6810( var_2 );
        _id_76BE( var_2 );
    }

    self notify( "stop_updating_enemy_target_pos" );

    if ( var_3 == "ambush" )
        _id_0971( var_2, var_0 );

    var_2 _meth_8108( var_0 );
}

_id_86BC( var_0 )
{
    var_0 _meth_8067( "manual" );
    wait 0.5;
    var_0 _meth_8067( "manual_ai" );
}

_id_5665( var_0 )
{
    self _meth_818F();
    animscripts\shared::_id_6869( self._id_0340, "none" );
    var_1 = _id_3EA9( var_0 );
    var_2 = _func_06F( var_0._id_02E2, var_0.angles, var_1 );
    self _meth_8162( var_2 );
    self waittill( "runto_arrived" );
    _id_9BE8( var_0 );
}

_id_6810( var_0 )
{
    self _meth_818F();
    self._id_9940 _id_4866();
}

_id_3EA9( var_0 )
{
    var_1 = [];
    var_1["saw_bipod_stand"] = level._id_5BBF["bipod_stand_setup"];
    var_1["saw_bipod_crouch"] = level._id_5BBF["bipod_crouch_setup"];
    var_1["saw_bipod_prone"] = level._id_5BBF["bipod_prone_setup"];
    return var_1[var_0._id_051D];
}
#using_animtree("generic_human");

_id_76BE( var_0 )
{
    var_1 = self._id_01E6;
    var_0 endon( "turret_deactivate" );
    self._id_5BC2 = var_0;
    self endon( "death" );
    self endon( "dropped_gun" );
    var_2 = _id_3EA9( var_0 );
    self._id_99B5 = "weapon_mg42_carry";
    self notify( "kill_get_gun_back_on_killanimscript_thread" );
    animscripts\shared::_id_6869( self._id_0513, "none" );

    if ( self _meth_813F() )
        self._id_01E6 = 1;

    self._id_76AF = %saw_gunner_run_fast;
    self._id_2485 = %saw_gunner_run_fast;
    self _meth_801D( self._id_99B5, level._id_6E4B );
    thread _id_99AB();
    var_3 = _func_06F( var_0._id_02E2, var_0.angles, var_2 );
    self _meth_8162( var_3 );
    wait 0.05;
    common_scripts\utility::_id_7DB7( animscripts\combat::_id_33E6 );
    common_scripts\utility::_id_1EB7( "move" );
    common_scripts\utility::_id_7E1C( "cover_crouch", ::_id_493D );

    while ( _func_0EE( self._id_02E2, var_3 ) > 16 )
    {
        self _meth_8162( var_3 );
        wait 0.05;
    }

    self notify( "kill_turret_detach_thread" );

    if ( self _meth_813F() )
        self._id_01E6 = var_1;

    if ( _func_1CA( "weapon_setup" ) )
        thread common_scripts\utility::_id_69C2( "weapon_setup" );

    self _meth_8140( "setup_done", var_0._id_02E2, var_0.angles, var_2 );
    _id_74A9();
    self waittillmatch( "setup_done", "end" );
    var_0 notify( "restore_default_drop_pitch" );
    var_0 _id_84F4();
    animscripts\shared::_id_6869( self._id_0340, "right" );
    _id_9BE8( var_0 );
    self _meth_802A( self._id_99B5, level._id_6E4B );
    common_scripts\utility::_id_7DB7( animscripts\init::_id_0138 );
    self notify( "bcs_portable_turret_setup" );
}

_id_5F37()
{
    self _meth_8162( self._id_76E7 );
}

_id_493D()
{
    self endon( "killanimscript" );
    self waittill( "death" );
}

_id_9C1E()
{
    if ( !isdefined( self._id_9940 ) )
        return 0;

    return self._id_9940._id_02E5 == self;
}

_id_99A0()
{
    if ( !_id_9C1E() )
    {
        common_scripts\utility::_id_1EB7( "move" );
        return;
    }

    var_0 = _id_375C( "connected" );
    var_1 = var_0["spots"];

    if ( !var_1.size )
    {
        common_scripts\utility::_id_1EB7( "move" );
        return;
    }

    var_2 = self._id_02BB;

    if ( !isdefined( var_2 ) || !_id_A5A4::_id_503B( var_1, var_2 ) )
    {
        var_3 = _id_4104();

        for ( var_4 = 0; var_4 < var_1.size; var_4++ )
        {
            var_2 = common_scripts\utility::_id_710E( var_1 );

            if ( isdefined( var_3[var_2._id_02E2 + ""] ) )
                return;
        }
    }

    var_5 = var_2._id_9940;

    if ( isdefined( var_5._id_0374 ) )
        return;

    _id_741E( var_5 );

    if ( var_5._id_519E )
        _id_5665( var_5 );
    else
        _id_76BE( var_5 );

    _id_A557::_id_4476( var_2._id_9940 );
}

_id_9BE8( var_0 )
{
    var_1 = self _meth_818E( var_0 );

    if ( var_1 )
    {
        common_scripts\utility::_id_7E1C( "move", ::_id_99A0 );
        self._id_9940 = var_0;
        thread _id_5BC4( var_0 );
        var_0 _meth_8067( "manual_ai" );
        var_0 thread _id_74AE();
        self._id_9940 = var_0;
        var_0._id_02E5 = self;
        return 1;
    }
    else
    {
        var_0 _meth_815D();
        return 0;
    }
}

_id_3E36( var_0 )
{
    var_1 = [];
    var_1[var_1.size] = ::_id_3764;
    var_1[var_1.size] = ::_id_3766;
    var_1 = common_scripts\utility::_id_0CF5( var_1 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = [[ var_1[var_2] ]]( var_0 );

        if ( !isdefined( var_3["spots"] ) )
            continue;

        var_3["spot"] = common_scripts\utility::_id_710E( var_3["spots"] );
        return var_3;
    }
}

_id_4104()
{
    var_0 = [];
    var_1 = _func_0D9();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2]._id_02BB ) )
            continue;

        var_0[var_1[var_2]._id_02BB._id_02E2 + ""] = 1;
    }

    return var_0;
}

_id_375C( var_0 )
{
    var_1 = level._id_83B3;
    var_2 = [];
    var_3 = _func_1D3( var_1 );
    var_4 = _id_4104();
    var_4[self._id_02BB._id_02E2 + ""] = undefined;

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        var_6 = var_3[var_5];

        if ( var_1[var_6] == self._id_9940 )
            continue;

        var_7 = _func_1D3( self._id_9940._id_83B4[var_0] );

        for ( var_8 = 0; var_8 < var_7.size; var_8++ )
        {
            if ( var_1[var_6]._id_3584 + "" != var_7[var_8] )
                continue;

            if ( isdefined( var_1[var_6]._id_0374 ) )
                continue;

            if ( isdefined( var_4[var_1[var_6]._id_02BB._id_02E2 + ""] ) )
                continue;

            if ( _func_0EE( self._id_01C3, var_1[var_6]._id_02E2 ) > self._id_01C4 )
                continue;

            var_2[var_2.size] = var_1[var_6];
        }
    }

    var_9 = [];
    var_9["type"] = var_0;
    var_9["spots"] = var_2;
    return var_9;
}

_id_3766( var_0 )
{
    return _id_375C( "ambush" );
}

_id_3764( var_0 )
{
    var_1 = _id_375C( "connected" );
    var_2 = var_1["spots"];

    if ( !var_2.size )
        return;

    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( !common_scripts\utility::_id_A347( var_2[var_4]._id_02E2, var_2[var_4].angles, var_0._id_02E2, 0.75 ) )
            continue;

        if ( !_func_08E( var_0._id_02E2, var_2[var_4]._id_02E2 + ( 0, 0, 16 ), 0, undefined ) )
            continue;

        var_3[var_3.size] = var_2[var_4];
    }

    var_1["spots"] = var_3;
    return var_1;
}

_id_6E4C()
{
    _id_780D();
    var_0 = 1;
    self._id_519E = 1;
    self._id_0374 = undefined;

    if ( isdefined( self._id_51FF ) )
        return;

    if ( self._id_03DA & var_0 )
        return;

    _id_4866();
}

_id_4866()
{
    self notify( "stop_checking_for_flanking" );
    self._id_519E = 0;
    self _meth_8056();
    self._id_886E = 0;
    self _meth_80C2();
    self _meth_815C( 0 );
    thread _id_74A8();
}

_id_84F4()
{
    self _meth_8055();
    self._id_886E = 1;
    self _meth_80C1();
    self._id_519E = 1;
    thread _id_8EA5();
}

_id_8EA5()
{
    self endon( "stop_checking_for_flanking" );
    self waittill( "turret_deactivate" );

    if ( _func_1A1( self._id_02E5 ) )
        self._id_02E5 notify( "end_mg_behavior" );
}

_id_996E( var_0 )
{
    var_1 = var_0 _meth_80ED();

    if ( !isdefined( var_1 ) )
        return 0;

    return var_1 == self;
}

_id_3153( var_0 )
{
    _id_A0C5( var_0 );
    var_0._id_0374 = undefined;
}

_id_A0C5( var_0 )
{
    var_0 endon( "turret_deactivate" );
    self endon( "death" );
    self waittill( "end_mg_behavior" );
}

_id_741E( var_0 )
{
    var_0._id_0374 = self;
    thread _id_3153( var_0 );
}

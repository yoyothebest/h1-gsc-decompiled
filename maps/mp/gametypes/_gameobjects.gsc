// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0 )
{
    var_0[var_0.size] = "airdrop_pallet";

    if ( maps\mp\_utility::_id_50C4() )
        var_0[var_0.size] = "boost_add";
    else
        var_0[var_0.size] = "boost_remove";

    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_79F4 ) )
        {
            var_3 = 1;
            var_4 = _func_124( var_1[var_2]._id_79F4, " " );

            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                for ( var_6 = 0; var_6 < var_4.size; var_6++ )
                {
                    if ( var_4[var_6] == var_0[var_5] )
                    {
                        var_3 = 0;
                        break;
                    }
                }

                if ( !var_3 )
                    break;
            }

            if ( var_3 )
            {
                if ( isdefined( var_1[var_2]._id_79BF ) )
                    common_scripts\_createfx::_id_73B3( var_1[var_2] );

                var_1[var_2] delete();
            }
        }
    }

    var_7 = getentarray( "boost_jump_border", "targetname" );

    if ( isdefined( var_7 ) )
    {
        foreach ( var_9 in var_7 )
            var_9 delete();
    }
}

init()
{
    level._id_62A2 = 0;
    level._id_630D = 0;
    level thread _id_64C8();
}

_id_64C8()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
        var_0 thread _id_646D();
    }
}

_id_64D6()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isdefined( self._id_3BF9 ) )
        {
            self._id_3BF9 = undefined;
            continue;
        }

        _id_4D34();
    }
}

_id_4D34()
{
    thread _id_6467();
    self._id_940F = [];
    self._id_1BB6 = undefined;
    self._id_1E23 = undefined;
    self._id_1AD7 = 1;
    self._id_535F = undefined;
    self._id_4DDF = 1;
}

_id_6467()
{
    level endon( "game_ended" );
    self waittill( "death" );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F5D();
}

_id_646D()
{
    level endon( "game_ended" );
    self waittill( "disconnect" );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F5D();
}

_id_23E9( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_04D9 = "carryObject";
    var_4._id_24C8 = var_1._id_02E2;
    var_4._id_663A = var_0;
    var_4._id_331C = var_1 _meth_81B5();

    if ( _func_120( var_1.classname, "use" ) )
        var_4._id_981D = "use";
    else
        var_4._id_981D = "proximity";

    var_1._id_1315 = var_1._id_02E2;
    var_4._id_04C5 = var_1;
    var_4._id_9C1C = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_4._id_637F = var_3;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5]._id_1315 = var_2[var_5]._id_02E2;
        var_2[var_5]._id_1302 = var_2[var_5].angles;
    }

    var_4._id_9E9C = var_2;
    var_4._id_20D0 = [];
    var_4._id_6305 = _id_4041();
    var_4._id_6306 = _id_4041();
    var_4._id_6309 = _id_4041();
    var_4._id_630B = 0;
    var_4._id_630A = 0;
    var_4._id_6313 = 5.0;
    level._id_630D += 2;
    objective_add( var_4._id_6305, "invisible", var_4._id_24C8 );
    objective_add( var_4._id_6306, "invisible", var_4._id_24C8 );
    objective_add( var_4._id_6309, "invisible", var_4._id_24C8 );
    objective_team( var_4._id_6305, "allies" );
    objective_team( var_4._id_6306, "axis" );
    objective_mlgspectator( var_4._id_6309 );
    var_4._id_6316["allies"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_allies_" + var_4._id_331C, var_4._id_24C8 + var_3, "allies", undefined );
    var_4._id_6316["axis"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_axis_" + var_4._id_331C, var_4._id_24C8 + var_3, "axis", undefined );
    var_4._id_6316["mlg"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_mlg_" + var_4._id_331C, var_4._id_24C8 + var_3, "mlg", undefined );
    var_4._id_6316["mlg"].archived = 0;
    var_4._id_6316["allies"].alpha = 0;
    var_4._id_6316["axis"].alpha = 0;
    var_4._id_1BAF = undefined;
    var_4._id_518E = 0;
    var_4._id_4EA9 = "none";
    var_4._id_0AB5 = 0;
    var_4._id_A296 = 0;
    var_4._id_52E1 = 0;
    var_4.contesteduiprogress = 0;
    var_4._id_A350 = [];
    var_4._id_1BB1 = 0;
    var_4._id_9E5B = "none";
    var_4._id_1BB5 = undefined;
    var_4._id_646F = undefined;
    var_4._id_64C2 = undefined;
    var_4._id_64E0 = undefined;

    if ( var_4._id_981D == "use" )
        var_4 thread _id_1BBA();
    else
    {
        var_4._id_24C9 = 0;
        var_4._id_9C19 = 0;
        var_4._id_9C10 = 0;
        var_4._id_600A = 0;
        var_4._id_1AC3 = 0;
        var_4._id_9207 = [];
        var_4._id_9206 = [];
        var_4._id_62AF["neutral"] = 0;
        var_4._id_62AF["axis"] = 0;
        var_4._id_62AF["allies"] = 0;
        var_4._id_62AF["none"] = 0;
        var_4._id_940D["neutral"] = [];
        var_4._id_940D["axis"] = [];
        var_4._id_940D["allies"] = [];
        var_4._id_940D["none"] = [];
        var_4._id_1E22 = "none";
        var_4._id_1E21 = undefined;
        var_4._id_5587 = "none";
        var_4._id_5588 = 0;

        if ( level._id_5FEC )
        {
            foreach ( var_7 in level._id_91F7 )
            {
                var_4._id_62AF[var_7] = 0;
                var_4._id_940D[var_7] = [];
            }
        }

        var_4 thread _id_1BB8();
    }

    var_4 thread _id_9AFD();
    return var_4;
}

deletecarryobject()
{
    if ( self._id_04D9 != "carryObject" )
        return;

    var_0 = self;
    var_0._id_04D9 = undefined;
    var_0._id_24C8 = undefined;
    var_0._id_663A = undefined;
    var_0._id_331C = undefined;
    var_0._id_981D = undefined;
    var_0._id_04C5 _meth_8051();
    var_0._id_04C5 = undefined;
    var_0._id_9C1C = undefined;
    var_0._id_637F = undefined;

    foreach ( var_2 in var_0._id_9E9C )
        var_2 delete();

    var_0._id_9E9C = undefined;
    maps\mp\_utility::_id_0603( var_0._id_6305 );
    maps\mp\_utility::_id_0603( var_0._id_6306 );
    maps\mp\_utility::_id_0603( var_0._id_6309 );
    var_0._id_20D0 = undefined;
    var_0._id_6305 = undefined;
    var_0._id_6306 = undefined;
    var_0._id_6309 = undefined;
    var_0._id_630B = undefined;
    var_0._id_630A = undefined;
    var_0._id_6313 = undefined;
    maps\mp\gametypes\_objpoints::_id_2859( var_0._id_6316["allies"] );
    maps\mp\gametypes\_objpoints::_id_2859( var_0._id_6316["axis"] );
    maps\mp\gametypes\_objpoints::_id_2859( var_0._id_6316["mlg"] );
    var_0._id_6316 = undefined;
    var_0._id_1BAF = undefined;
    var_0._id_518E = undefined;
    var_0._id_4EA9 = undefined;
    var_0._id_0AB5 = undefined;
    var_0._id_A296 = undefined;
    var_0._id_52E1 = undefined;
    var_0._id_A350 = undefined;
    var_0._id_1BB1 = undefined;
    var_0._id_9E5B = undefined;
    var_0._id_1BB5 = undefined;
    var_0._id_646F = undefined;
    var_0._id_64C2 = undefined;
    var_0._id_64E0 = undefined;
    var_0._id_24C9 = undefined;
    var_0._id_9C19 = undefined;
    var_0._id_9C10 = undefined;
    var_0._id_600A = undefined;
    var_0._id_1AC3 = undefined;
    var_0._id_9207 = undefined;
    var_0._id_9206 = undefined;
    var_0._id_62AF = undefined;
    var_0._id_940D = undefined;
    var_0._id_1E22 = undefined;
    var_0._id_1E21 = undefined;
    var_0._id_5587 = undefined;
    var_0._id_5588 = undefined;
    var_0 notify( "death" );
    var_0 notify( "deleted" );
}

_id_1BBA()
{
    if ( isdefined( level._id_511D ) && level._id_511D )
        self endon( "death" );

    level endon( "game_ended" );

    for (;;)
    {
        self._id_04C5 waittill( "trigger", var_0 );

        if ( self._id_518E )
            continue;

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0._id_0308["team"] ) )
            continue;

        if ( !var_0._id_1AD7 )
            continue;

        if ( !isdefined( var_0._id_4DDF ) )
            continue;

        if ( isdefined( var_0._id_933E ) )
            continue;

        if ( isdefined( self._id_1BAF ) )
            continue;

        if ( var_0 maps\mp\_utility::_id_51E3() || var_0 maps\mp\_utility::_id_512B() )
            continue;

        _id_7FE2( var_0 );
    }
}

_id_1BB8()
{
    if ( isdefined( level._id_511D ) && level._id_511D )
        self endon( "death" );

    thread _id_1BB9();
}

_id_1BB9()
{
    if ( isdefined( level._id_511D ) && level._id_511D )
        self endon( "death" );

    level endon( "game_ended" );
    thread _id_7044();

    for (;;)
    {
        waitframe;

        if ( self._id_9C19 && self._id_24C9 >= self._id_9C19 )
        {
            self._id_24C9 = 0;
            var_0 = _id_3F79();

            if ( isdefined( self._id_648E ) )
                self [[ self._id_648E ]]( _id_3F30(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) )
                _id_7FE2( var_0 );

            _id_7F3A( "none" );
            self._id_1E21 = undefined;
        }

        if ( self._id_1E22 != "none" )
        {
            if ( self._id_9C19 )
            {
                if ( !self._id_62AF[self._id_1E22] )
                {
                    if ( isdefined( self._id_648E ) )
                        self [[ self._id_648E ]]( _id_3F30(), self._id_1E21, 0 );

                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
                else
                {
                    self._id_24C9 += 50 * self._id_9C10;

                    if ( isdefined( self._id_64FC ) )
                        self [[ self._id_64FC ]]( _id_3F30(), self._id_24C9 / self._id_9C19, 50 * self._id_9C10 / self._id_9C19 );
                }
            }
            else
            {
                if ( maps\mp\_utility::_id_5189( self._id_1E21 ) )
                    _id_7FE2( self._id_1E21 );

                _id_7F3A( "none" );
                self._id_1E21 = undefined;
            }
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_6815( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_1AD7 = 0;

    for (;;)
    {
        if ( _func_0F0( self._id_02E2, var_0 ) > 4096 )
            break;

        wait 0.2;
    }

    self._id_1AD7 = 1;
}

_id_7FE2( var_0 )
{
    if ( _func_0CF( var_0 ) && isdefined( var_0._id_02E5 ) )
        return;

    if ( isdefined( var_0._id_1BB6 ) )
    {
        if ( isdefined( self._id_64C3 ) )
            self [[ self._id_64C3 ]]( var_0 );

        return;
    }

    var_0 _id_41F4( self );
    _id_7F34( var_0 );

    for ( var_1 = 0; var_1 < self._id_9E9C.size; var_1++ )
        self._id_9E9C[var_1] _meth_8056();

    self._id_04C5._id_02E2 += ( 0, 0, 10000 );
    self notify( "pickup_object" );

    if ( isdefined( self._id_64C2 ) )
        self [[ self._id_64C2 ]]( var_0 );

    _id_9B09();
    _id_9BA9();
}

_id_9AFD()
{
    if ( isdefined( level._id_511D ) && level._id_511D )
        self endon( "death" );

    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( self._id_1BAF ) )
        {
            self._id_24C8 = self._id_1BAF._id_02E2 + ( 0, 0, 75 );
            self.curcarrierorigin = self._id_1BAF._id_02E2;
            self._id_6316["allies"] maps\mp\gametypes\_objpoints::_id_9B44( self._id_24C8 );
            self._id_6316["axis"] maps\mp\gametypes\_objpoints::_id_9B44( self._id_24C8 );

            if ( ( self._id_9E5B == "friendly" || self._id_9E5B == "any" ) && _id_510F( "allies" ) && self._id_630B )
            {
                if ( self._id_6316["allies"]._id_51A5 )
                {
                    self._id_6316["allies"].alpha = self._id_6316["allies"]._id_1301;
                    self._id_6316["allies"] _meth_8086( self._id_6313 + 1.0 );
                    self._id_6316["allies"].alpha = 0;
                }

                objective_position( self._id_6305, self._id_24C8 );
            }
            else if ( ( self._id_9E5B == "friendly" || self._id_9E5B == "any" ) && _id_510F( "axis" ) && self._id_630B )
            {
                if ( self._id_6316["axis"]._id_51A5 )
                {
                    self._id_6316["axis"].alpha = self._id_6316["axis"]._id_1301;
                    self._id_6316["axis"] _meth_8086( self._id_6313 + 1.0 );
                    self._id_6316["axis"].alpha = 0;
                }

                objective_position( self._id_6306, self._id_24C8 );
            }

            if ( ( self._id_9E5B == "enemy" || self._id_9E5B == "any" ) && !_id_510F( "allies" ) && self._id_630A )
            {
                if ( self._id_6316["allies"]._id_51A5 )
                {
                    self._id_6316["allies"].alpha = self._id_6316["allies"]._id_1301;
                    self._id_6316["allies"] _meth_8086( self._id_6313 + 1.0 );
                    self._id_6316["allies"].alpha = 0;
                }

                objective_position( self._id_6305, self._id_24C8 );
            }
            else if ( ( self._id_9E5B == "enemy" || self._id_9E5B == "any" ) && !_id_510F( "axis" ) && self._id_630A )
            {
                if ( self._id_6316["axis"]._id_51A5 )
                {
                    self._id_6316["axis"].alpha = self._id_6316["axis"]._id_1301;
                    self._id_6316["axis"] _meth_8086( self._id_6313 + 1.0 );
                    self._id_6316["axis"].alpha = 0;
                }

                objective_position( self._id_6306, self._id_24C8 );
            }

            maps\mp\_utility::_id_9F85( self._id_6313, "dropped", "reset" );
            continue;
        }

        self.curcarrierorigin = undefined;
        self._id_6316["allies"] maps\mp\gametypes\_objpoints::_id_9B44( self._id_24C8 + self._id_637F );
        self._id_6316["axis"] maps\mp\gametypes\_objpoints::_id_9B44( self._id_24C8 + self._id_637F );
        wait 0.05;
    }
}

_id_4870()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );
    level waittill( "game_ended" );

    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5.alpha = 0;
}

_id_41F4( var_0 )
{
    self._id_1BB6 = var_0;
    thread _id_94B8();

    if ( isdefined( var_0._id_1BBB ) )
    {
        var_0._id_1BB2 = self _meth_830F();
        var_0._id_1BB0 = self _meth_8311( var_0._id_1BBB );

        if ( isdefined( var_0._id_1BBC ) )
            self thread [[ var_0._id_1BBC ]]();

        self _meth_830B( var_0._id_1BBB );
        self _meth_8313( var_0._id_1BBB );
        self _meth_82C7();
        common_scripts\utility::_id_0588();
    }
    else if ( !var_0._id_0AB5 )
    {
        common_scripts\utility::_id_0587();

        if ( isdefined( var_0._id_5976 ) )
            self thread [[ var_0._id_5976 ]]();
        else
            thread _id_5976();
    }

    if ( isdefined( var_0._id_1BB5 ) && _func_1AD( self ) )
    {
        if ( level._id_8A7C )
        {
            self._id_1BB5 = maps\mp\gametypes\_hud_util::_id_2420( var_0._id_1BB5, 33, 33 );
            self._id_1BB5 maps\mp\gametypes\_hud_util::_id_7FEE( "BOTTOM RIGHT", "BOTTOM RIGHT", -50, -78 );
        }
        else
        {
            self._id_1BB5 = maps\mp\gametypes\_hud_util::_id_2420( var_0._id_1BB5, 50, 50 );
            self._id_1BB5 maps\mp\gametypes\_hud_util::_id_7FEE( "BOTTOM RIGHT", "BOTTOM RIGHT", -90, -110 );
        }

        self._id_1BB5._id_01ED = 1;
        thread _id_4870();
    }

    if ( isdefined( var_0._id_4273 ) )
        self thread [[ var_0._id_4273 ]]();
}

_id_74DF()
{
    self._id_518E = 1;
    self notify( "reset" );

    for ( var_0 = 0; var_0 < self._id_9E9C.size; var_0++ )
    {
        self._id_9E9C[var_0]._id_02E2 = self._id_9E9C[var_0]._id_1315;
        self._id_9E9C[var_0].angles = self._id_9E9C[var_0]._id_1302;
        self._id_9E9C[var_0] _meth_8055();
    }

    self._id_04C5._id_02E2 = self._id_04C5._id_1315;
    self._id_24C8 = self._id_04C5._id_02E2;

    if ( isdefined( self._id_64E0 ) )
        self [[ self._id_64E0 ]]();

    _id_1EE6();
    _id_9BA9();
    _id_9B09();
    self._id_518E = 0;
}

_id_511C()
{
    if ( isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_24C8 != self._id_04C5._id_1315 )
        return 0;

    return 1;
}

_id_7FF3( var_0, var_1 )
{
    self._id_518E = 1;

    for ( var_2 = 0; var_2 < self._id_9E9C.size; var_2++ )
    {
        self._id_9E9C[var_2]._id_02E2 = var_0;
        self._id_9E9C[var_2].angles = var_1;
        self._id_9E9C[var_2] _meth_8055();
    }

    self._id_04C5._id_02E2 = var_0;
    self._id_24C8 = self._id_04C5._id_02E2;
    _id_1EE6();
    _id_9BA9();
    _id_9B09();
    self._id_518E = 0;
}

_id_64D4()
{
    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F5D();
}

_id_1BB7( var_0 )
{
    for ( var_1 = 0; var_1 < var_0._id_1BB6._id_9E9C.size; var_1++ )
        var_0._id_1BB6._id_9E9C[var_1] _meth_8051();

    var_0._id_1BB6._id_04C5 _meth_8051();
    var_0._id_1BB6 notify( "stop_pickup_timeout" );
    var_0._id_1BB6 _id_74DF();
}

_id_7F5D()
{
    if ( isdefined( self._id_7F5D ) )
    {
        if ( [[ self._id_7F5D ]]() )
            return;
    }

    self._id_518E = 1;
    self notify( "dropped" );

    if ( isdefined( self._id_1BAF ) && self._id_1BAF._id_04A7 != "spectator" )
    {
        if ( isdefined( self._id_1BAF.body ) )
        {
            var_0 = _func_090( self._id_1BAF._id_02E2 + ( 0, 0, 20 ), self._id_1BAF._id_02E2 - ( 0, 0, 2000 ), self._id_1BAF.body );
            var_1 = _func_06B( self._id_1BAF._id_02E2 + ( 0, 0, 20 ), self._id_1BAF._id_02E2 - ( 0, 0, 2000 ), 0, self._id_1BAF.body );
        }
        else
        {
            var_0 = _func_090( self._id_1BAF._id_02E2 + ( 0, 0, 20 ), self._id_1BAF._id_02E2 - ( 0, 0, 2000 ) );
            var_1 = _func_06B( self._id_1BAF._id_02E2 + ( 0, 0, 20 ), self._id_1BAF._id_02E2 - ( 0, 0, 2000 ), 0 );
        }
    }
    else
    {
        var_0 = _func_090( self._id_77CC + ( 0, 0, 20 ), self._id_77CC - ( 0, 0, 20 ) );
        var_1 = _func_06B( self._id_77CC + ( 0, 0, 20 ), self._id_77CC - ( 0, 0, 20 ), 0, undefined );
    }

    var_2 = self._id_1BAF;

    if ( isdefined( var_0 ) )
    {
        var_3 = _func_0B3( 360 );
        var_4 = var_0;

        if ( isdefined( self._id_9E9B ) )
            var_4 += self._id_9E9B;

        if ( var_1["fraction"] < 1 && _func_0EE( var_1["position"], var_0 ) < 10.0 )
        {
            var_5 = ( _func_0B7( var_3 ), _func_0B6( var_3 ), 0 );
            var_5 = _func_114( var_5 - var_1["normal"] * _func_0F6( var_5, var_1["normal"] ) );
            var_6 = _func_115( var_5 );
        }
        else
            var_6 = ( 0, var_3, 0 );

        for ( var_7 = 0; var_7 < self._id_9E9C.size; var_7++ )
        {
            self._id_9E9C[var_7]._id_02E2 = var_4;
            self._id_9E9C[var_7].angles = var_6;
            self._id_9E9C[var_7] _meth_8055();
        }

        self._id_04C5._id_02E2 = var_4;
        self._id_24C8 = self._id_04C5._id_02E2;
        var_8 = spawnstruct();
        var_8._id_1BB6 = self;
        var_8._id_2663 = ::_id_1BB7;
        self._id_04C5 thread maps\mp\_movers::_id_45BF( var_8 );
        thread _id_6817();
    }

    if ( !isdefined( var_0 ) )
    {
        for ( var_7 = 0; var_7 < self._id_9E9C.size; var_7++ )
        {
            self._id_9E9C[var_7]._id_02E2 = self._id_9E9C[var_7]._id_1315;
            self._id_9E9C[var_7].angles = self._id_9E9C[var_7]._id_1302;
            self._id_9E9C[var_7] _meth_8055();
        }

        self._id_04C5._id_02E2 = self._id_04C5._id_1315;
        self._id_24C8 = self._id_04C5._id_1315;
    }

    if ( isdefined( self._id_646F ) )
        self [[ self._id_646F ]]( var_2 );

    _id_1EE6();
    _id_9B09();
    _id_9BA9();
    self._id_518E = 0;
}

_id_7F34( var_0 )
{
    self._id_1BAF = var_0;
    thread _id_9B9F();
}

_id_1EE6()
{
    if ( !isdefined( self._id_1BAF ) )
        return;

    self._id_1BAF _id_912E( self );
    self._id_1BAF = undefined;
    self.curcarrierorigin = undefined;
    self notify( "carrier_cleared" );
}

_id_6817()
{
    self endon( "pickup_object" );
    self endon( "stop_pickup_timeout" );
    wait 0.05;

    if ( _id_51D7() )
    {
        _id_74DF();
        return;
    }

    if ( isdefined( self._id_1142 ) )
    {
        wait(self._id_1142);

        if ( !isdefined( self._id_1BAF ) )
            _id_74DF();
    }
}

_id_51D7()
{
    var_0 = getentarray( "out_of_bounds", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !self._id_9E9C[0] _meth_80AB( var_0[var_1] ) )
            continue;

        return 1;
    }

    if ( !self._id_9E9C[0] _meth_851D() )
    {
        var_0 = getentarray( "out_of_bounds_at_rest", "targetname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( !self._id_9E9C[0] _meth_80AB( var_0[var_1] ) )
                continue;

            return 1;
        }
    }

    var_2 = getentarray( "trigger_hurt", "classname" );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
    {
        if ( !self._id_9E9C[0] _meth_80AB( var_2[var_1] ) )
            continue;

        return 1;
    }

    if ( self._id_A296 )
    {
        var_3 = getentarray( "trigger_underwater", "targetname" );

        for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        {
            if ( !self._id_9E9C[0] _meth_80AB( var_3[var_1] ) )
                continue;

            return 1;
        }
    }

    return 0;
}

_id_3F27( var_0 )
{
    if ( isdefined( var_0._id_1BB2 ) && self _meth_8311( var_0._id_1BB2 ) )
        return var_0._id_1BB2;

    var_1 = self _meth_8309();
    return var_1[0];
}

_id_912E( var_0 )
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( self ) )
        self._id_1BB6 = undefined;

    self notify( "drop_object" );

    if ( var_0._id_981D == "proximity" )
        thread _id_6815( var_0._id_04C5._id_02E2 );

    if ( maps\mp\_utility::_id_5189( self ) )
    {
        if ( isdefined( var_0._id_1BBB ) )
        {
            var_1 = isdefined( var_0._id_52DC ) && var_0._id_52DC;

            if ( !var_0._id_1BB0 && !var_1 )
                self _meth_830C( var_0._id_1BBB );

            var_2 = _id_3F27( var_0 );
            self _meth_8312( var_2 );
            self _meth_82C8();
            common_scripts\utility::_id_0596();
        }
        else if ( !var_0._id_0AB5 )
            common_scripts\utility::_id_0595();
    }
}

_id_94B8()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    while ( isdefined( self._id_1BB6 ) && maps\mp\_utility::_id_5189( self ) )
    {
        if ( self _meth_833E() )
        {
            var_0 = _func_06B( self._id_02E2 + ( 0, 0, 20 ), self._id_02E2 - ( 0, 0, 20 ), 0, undefined );

            if ( var_0["fraction"] < 1 )
                self._id_1BB6._id_77CC = var_0["position"];
        }

        wait 0.05;
    }
}

_id_5976()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    for (;;)
    {
        while ( self _meth_833A() || self _meth_82EB() || self _meth_82EC() || self _meth_833C() )
            wait 0.05;

        while ( !self _meth_833A() && !self _meth_82EB() && !self _meth_82EC() && !self _meth_833C() )
            wait 0.05;

        if ( isdefined( self._id_1BB6 ) && !self _meth_8339() )
            self._id_1BB6 thread _id_7F5D();
    }
}

_id_2874()
{
    if ( isdefined( self._id_6305 ) && isdefined( self._id_6306 ) )
    {
        maps\mp\_utility::_id_0603( self._id_6305 );
        maps\mp\_utility::_id_0603( self._id_6306 );
        maps\mp\_utility::_id_0603( self._id_6309 );
    }

    if ( isdefined( self._id_6316 ) )
    {
        maps\mp\gametypes\_objpoints::_id_2859( self._id_6316["allies"] );
        maps\mp\gametypes\_objpoints::_id_2859( self._id_6316["axis"] );
        maps\mp\gametypes\_objpoints::_id_2859( self._id_6316["mlg"] );
    }

    self._id_04C5 = undefined;
    self notify( "deleted" );
}

_id_244C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5._id_04D9 = "useObject";
    var_5._id_24C8 = var_1._id_02E2;
    var_5._id_663A = var_0;
    var_5._id_331C = var_1 _meth_81B5();
    var_5._id_52E7 = undefined;

    if ( _func_120( var_1.classname, "use" ) )
        var_5._id_981D = "use";
    else
        var_5._id_981D = "proximity";

    var_5._id_04C5 = var_1;

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_2[var_6]._id_1315 = var_2[var_6]._id_02E2;
        var_2[var_6]._id_1302 = var_2[var_6].angles;
    }

    var_5._id_9E9C = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_5._id_637F = var_3;

    if ( !isdefined( var_4 ) || !var_4 )
    {
        var_5._id_20D0 = [];
        var_5._id_6305 = _id_4041();
        var_5._id_6306 = _id_4041();
        var_5._id_6309 = _id_4041();
        objective_add( var_5._id_6305, "invisible", var_5._id_24C8 );
        objective_add( var_5._id_6306, "invisible", var_5._id_24C8 );
        objective_add( var_5._id_6309, "invisible", var_5._id_24C8 );
        objective_team( var_5._id_6305, "allies" );
        objective_team( var_5._id_6306, "axis" );
        objective_mlgspectator( var_5._id_6309 );
        var_5._id_6316["allies"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_allies_" + var_5._id_331C, var_5._id_24C8 + var_3, "allies", undefined );
        var_5._id_6316["axis"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_axis_" + var_5._id_331C, var_5._id_24C8 + var_3, "axis", undefined );
        var_5._id_6316["mlg"] = maps\mp\gametypes\_objpoints::_id_2443( "objpoint_mlg_" + var_5._id_331C, var_5._id_24C8 + var_3, "mlg", undefined );
        var_5._id_6316["mlg"].archived = 0;
        var_5._id_6316["allies"].alpha = 0;
        var_5._id_6316["axis"].alpha = 0;
        var_5._id_6316["mlg"].alpha = 0;
    }

    var_5._id_4EA9 = "none";
    var_5._id_52E1 = 0;
    var_5.contesteduiprogress = 0;
    var_5._id_A350 = [];
    var_5._id_9E5B = "none";
    var_5._id_64F8 = undefined;
    var_5._id_6459 = undefined;
    var_5._id_9C18 = "default";
    var_5._id_9C19 = 10000;
    var_5._id_24C9 = 0;

    if ( var_5._id_981D == "proximity" )
    {
        var_5._id_9207 = [];
        var_5._id_9206 = [];
        var_5._id_62AF["neutral"] = 0;
        var_5._id_62AF["axis"] = 0;
        var_5._id_62AF["allies"] = 0;
        var_5._id_62AF["none"] = 0;
        var_5._id_940D["neutral"] = [];
        var_5._id_940D["axis"] = [];
        var_5._id_940D["allies"] = [];
        var_5._id_940D["none"] = [];
        var_5._id_9C10 = 0;
        var_5._id_1E22 = "none";
        var_5._id_1E21 = undefined;
        var_5._id_5587 = "none";
        var_5._id_5588 = 0;
        var_5._id_600A = 0;
        var_5._id_1AC3 = 0;

        if ( level._id_5FEC )
        {
            foreach ( var_8 in level._id_91F7 )
            {
                var_5._id_62AF[var_8] = 0;
                var_5._id_940D[var_8] = [];
            }
        }

        var_5 thread _id_9C0B();
    }
    else
    {
        var_5._id_9C10 = 1;
        var_5 thread _id_9C0C();
    }

    return var_5;
}

_id_5F3D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    if ( isdefined( self._id_04C5 ) )
    {
        self._id_04C5 _meth_8094();
        self._id_04C5._id_02E2 = var_0;
    }

    if ( isdefined( self._id_04C5._id_1315 ) )
        self._id_04C5._id_1315 = var_0;

    if ( isdefined( self._id_56D9 ) )
    {
        self._id_56D9 _meth_8094();
        self._id_56D9._id_02E2 = var_0;
    }

    if ( isdefined( self._id_9E9C ) )
    {
        foreach ( var_3 in self._id_9E9C )
        {
            var_3 _meth_8094();
            var_3._id_02E2 = var_0;
            var_3._id_1315 = var_0;
        }
    }

    if ( isdefined( self._id_02E2 ) )
        self._id_02E2 = var_0;

    if ( isdefined( self._id_24C8 ) )
        self._id_24C8 = var_0;

    if ( isdefined( self._id_01BE ) )
    {
        if ( isdefined( self._id_01BE._id_788C ) )
        {
            foreach ( var_6 in self._id_01BE._id_788C )
                var_6._id_02E2 = var_0;
        }

        if ( isdefined( self._id_01BE._id_02E2 ) )
            self._id_01BE._id_02E2 = var_0;
    }

    if ( isdefined( self._id_6316 ) )
    {
        foreach ( var_9 in self._id_6316 )
            var_9 maps\mp\gametypes\_objpoints::_id_9B44( var_0 + var_1 );
    }

    if ( isdefined( self._id_6305 ) )
        objective_position( self._id_6305, var_0 );

    if ( isdefined( self._id_6306 ) )
        objective_position( self._id_6306, var_0 );

    if ( isdefined( self._id_6309 ) )
        objective_position( self._id_6309, var_0 );

    if ( isdefined( self._id_1305 ) )
    {
        self._id_1305 delete();
        var_11 = self._id_9E9C[0]._id_02E2 + ( 0, 0, 32 );
        var_12 = self._id_9E9C[0]._id_02E2 + ( 0, 0, -32 );
        var_13 = _func_06B( var_11, var_12, 0, undefined );
        var_14 = _func_115( var_13["normal"] );
        self._id_1306 = anglestoforward( var_14 );
        self._id_1308 = anglestoright( var_14 );
        self._id_1307 = var_13["position"];

        if ( level._id_01B3 == "dom" )
            maps\mp\gametypes\dom::_id_9BA1();
    }
}

_id_7F99( var_0 )
{
    self._id_52E7 = var_0;
}

_id_9C0C()
{
    level endon( "game_ended" );
    self endon( "deleted" );

    for (;;)
    {
        self._id_04C5 waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0._id_0308["team"] ) )
            continue;

        if ( !var_0 _meth_833E() )
            continue;

        if ( var_0 _meth_8514() )
            continue;

        var_1 = var_0 _meth_830F();

        if ( !var_0 maps\mp\_utility::_id_5131() && maps\mp\_utility::_id_513D( var_1 ) )
            continue;

        if ( isdefined( self.cantuseweapon ) && self.cantuseweapon == var_1 )
            continue;

        if ( !_id_1D11( var_0 ) )
        {
            if ( isdefined( self._id_6459 ) )
                self [[ self._id_6459 ]]( var_0 );

            continue;
        }

        if ( isdefined( var_0._id_A2F4 ) && var_0._id_A2F4 == "h1_claymore_mp" )
            continue;

        if ( !var_0 common_scripts\utility::_id_5207() )
            continue;

        var_2 = 1;

        if ( self._id_9C19 > 0 )
        {
            if ( isdefined( self._id_6454 ) )
                self [[ self._id_6454 ]]( var_0 );

            if ( !isdefined( self._id_52E7 ) )
                thread _id_1AF7();

            var_3 = var_0._id_0308["team"];
            var_2 = _id_9C02( var_0 );
            self notify( "finished_use" );

            if ( isdefined( self._id_648E ) )
                self [[ self._id_648E ]]( var_3, var_0, var_2 );
        }

        if ( !var_2 )
            continue;

        if ( isdefined( self._id_64F8 ) )
            self [[ self._id_64F8 ]]( var_0 );
    }
}

_id_1D11( var_0 )
{
    if ( !isdefined( self._id_52E7 ) )
        return 1;

    if ( !isdefined( var_0._id_1BB6 ) )
        return 0;

    var_1 = self._id_52E7;

    if ( !_func_0CE( var_1 ) )
        var_1 = [ var_1 ];

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0._id_1BB6 )
            return 1;
    }

    return 0;
}

_id_1AF7()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    self endon( "finished_use" );

    for (;;)
    {
        self._id_04C5 waittill( "trigger", var_0 );

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0._id_0308["team"] ) )
            continue;

        if ( isdefined( self._id_6459 ) )
            self [[ self._id_6459 ]]( var_0 );
    }
}

_id_3F79()
{
    var_0 = self._id_1E22;

    if ( maps\mp\_utility::_id_5189( self._id_1E21 ) )
        var_1 = self._id_1E21;
    else
        var_1 = undefined;

    if ( self._id_940D[var_0].size > 0 )
    {
        var_2 = undefined;
        var_3 = _func_1D3( self._id_940D[var_0] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = self._id_940D[var_0][var_3[var_4]];

            if ( maps\mp\_utility::_id_5189( var_5._id_0318 ) && ( !isdefined( var_2 ) || var_5._id_8D41 < var_2 ) )
            {
                var_1 = var_5._id_0318;
                var_2 = var_5._id_8D41;
            }
        }
    }

    return var_1;
}

_id_9C0B()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    thread _id_7044();

    for (;;)
    {
        waitframe;

        if ( self._id_9C19 && self._id_24C9 >= self._id_9C19 )
        {
            self._id_24C9 = 0;
            var_0 = _id_3F79();

            if ( isdefined( self._id_648E ) )
                self [[ self._id_648E ]]( _id_3F30(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) && isdefined( self._id_64F8 ) )
                self [[ self._id_64F8 ]]( var_0 );

            if ( !self._id_600A )
            {
                _id_7F3A( "none" );
                self._id_1E21 = undefined;
            }
        }

        if ( self._id_1E22 != "none" )
        {
            if ( self._id_9C19 && ( !self._id_600A || _id_4078() != _id_3F30() ) )
            {
                if ( !self._id_62AF[self._id_1E22] )
                {
                    if ( isdefined( self._id_648E ) )
                        self [[ self._id_648E ]]( _id_3F30(), self._id_1E21, 0 );

                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
                else
                {
                    self._id_24C9 += 50 * self._id_9C10;

                    if ( self._id_24C9 <= 0 )
                    {
                        self._id_24C9 *= -1;
                        self._id_5587 = self._id_1E22;
                        _id_9B97();
                    }

                    if ( isdefined( self._id_64FC ) )
                        self [[ self._id_64FC ]]( _id_3F30(), self._id_24C9 / self._id_9C19, 50 * self._id_9C10 / self._id_9C19 );
                }
            }
            else if ( !self._id_600A )
            {
                if ( isdefined( self._id_64F8 ) )
                    self [[ self._id_64F8 ]]( self._id_1E21 );

                if ( !self._id_600A )
                {
                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
            }
            else if ( !self._id_62AF[self._id_1E22] )
            {
                if ( isdefined( self._id_64F6 ) )
                    self [[ self._id_64F6 ]]();

                _id_7F3A( "none" );
                self._id_1E21 = undefined;
            }
            else if ( self._id_1AC3 )
            {
                var_1 = _id_4059( self._id_1E22 );

                if ( var_1 > 0 )
                {
                    if ( isdefined( self._id_6462 ) )
                        self [[ self._id_6462 ]]();

                    _id_7F3A( "none" );
                    self._id_1E21 = undefined;
                }
            }
        }
        else if ( self._id_600A && _id_4078() != "none" )
        {
            if ( !self._id_62AF[_id_4078()] )
            {
                if ( isdefined( self._id_64F6 ) )
                    self [[ self._id_64F6 ]]();
            }
            else if ( self._id_1AC3 && self._id_5587 != "none" && self._id_62AF[self._id_5587] )
            {
                var_1 = _id_4059( self._id_5587 );

                if ( var_1 == 0 )
                {
                    if ( isdefined( self._id_64F4 ) )
                        self [[ self._id_64F4 ]]( self._id_5587 );
                }
            }
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_1AC0( var_0 )
{
    if ( isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_1AC3 )
    {
        var_1 = _id_4059( var_0._id_0308["team"] );

        if ( var_1 != 0 )
            return 0;
    }

    if ( _id_1D11( var_0 ) )
        return 1;

    return 0;
}

_id_7044()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    var_0 = self._id_331C;

    for (;;)
    {
        self._id_04C5 waittill( "trigger", var_1 );

        if ( !maps\mp\_utility::_id_5189( var_1 ) )
            continue;

        if ( !maps\mp\_utility::_id_5112( var_1 ) )
            continue;

        if ( isdefined( self._id_1BAF ) )
            continue;

        if ( var_1 maps\mp\_utility::_id_51E3() || isdefined( var_1._id_89E5 ) || var_1 maps\mp\_utility::_id_512B() )
            continue;

        if ( isdefined( var_1.classname ) && var_1.classname == "script_vehicle" )
            continue;

        if ( !isdefined( var_1._id_4DDF ) )
            continue;

        if ( isdefined( self._id_60E0 ) && self._id_60E0 > gettime() )
            continue;

        if ( isdefined( self._id_1AFB ) && ![[ self._id_1AFB ]]( var_1 ) )
            continue;

        if ( _id_1ACA( var_1._id_0308["team"], var_1 ) && self._id_1E22 == "none" )
        {
            if ( _id_1AC0( var_1 ) )
            {
                if ( !_id_7043( var_1, self._id_9E9C ) )
                    continue;

                _id_7F3A( var_1._id_0308["team"] );
                self._id_1E21 = var_1;
                var_2 = _id_40B5( var_1._id_0308["team"] );

                if ( isdefined( self._id_9207[var_2] ) )
                    self._id_9C19 = self._id_9207[var_2];

                if ( self._id_9C19 && isdefined( self._id_6454 ) )
                    self [[ self._id_6454 ]]( self._id_1E21 );
            }
            else if ( isdefined( self._id_6459 ) )
                self [[ self._id_6459 ]]( var_1 );
        }

        if ( maps\mp\_utility::_id_5189( var_1 ) && !isdefined( var_1._id_940F[var_0] ) )
            var_1 thread _id_981C( self );
    }
}

_id_7043( var_0, var_1 )
{
    if ( !isdefined( self._id_740F ) || !self._id_740F )
        return 1;

    var_2 = [ 32, 16, 0 ];
    var_3 = undefined;

    if ( isdefined( var_1 ) && var_1.size )
    {
        if ( var_1.size > 1 )
        {

        }

        var_3 = var_1[0];
    }

    var_4 = var_0._id_02E2 - self._id_04C5._id_02E2;
    var_4 = ( var_4[0], var_4[1], 0 );
    var_4 = _func_114( var_4 );
    var_4 *= 5;

    foreach ( var_6 in var_2 )
    {
        var_7 = var_0 _meth_80AA();
        var_8 = self._id_04C5._id_02E2 + var_4 + ( 0, 0, var_6 );
        var_9 = _func_06B( var_7, var_8, 0, var_3, 0, 0, 0, 0, 1, 0, 0 );

        if ( var_9["fraction"] == 1 )
            return 1;
    }

    return 0;
}

_id_7F3A( var_0 )
{
    if ( self._id_52E1 )
    {
        if ( self._id_5587 == "none" )
            self._id_5587 = var_0;

        self._id_1E22 = var_0;
    }
    else
    {
        if ( self._id_1E22 == "none" && gettime() - self._id_5588 > 1000 )
            self._id_24C9 = 0;
        else if ( var_0 != "none" && var_0 != self._id_5587 )
            self._id_24C9 = 0;

        self._id_5587 = self._id_1E22;
    }

    self._id_5588 = gettime();
    self._id_1E22 = var_0;
    _id_9B97();
}

_id_3F30()
{
    return self._id_1E22;
}

_id_981C( var_0 )
{
    if ( isdefined( level._id_511D ) && level._id_511D )
    {
        level endon( "game_ended" );
        var_0 endon( "deleted" );
    }

    var_1 = self._id_0308["team"];
    var_0 _setnumtouching( var_1, var_0._id_62AF[var_1] + 1 );
    var_2 = self._id_4450;
    var_3 = spawnstruct();
    var_3._id_0318 = self;
    var_3._id_8D41 = gettime();
    var_0._id_940D[var_1][var_2] = var_3;

    if ( !isdefined( var_0._id_6242 ) )
        var_0._id_6242 = 0;

    self._id_940F[var_0._id_331C] = var_0._id_04C5;
    var_0 _id_9B97();

    while ( maps\mp\_utility::_id_5189( self ) && isdefined( var_0._id_04C5 ) && ( self _meth_80AB( var_0._id_04C5 ) || _id_50CA( var_0._id_04C5 ) ) && !level._id_3BDA )
    {
        if ( _func_1AD( self ) && var_0._id_9C19 )
        {
            _id_9B94( var_0, 1 );
            _id_9B51( var_0, 0 );
        }

        wait 0.05;
    }

    if ( isdefined( self ) && isdefined( self._id_940F ) )
    {
        if ( _func_1AD( self ) && var_0._id_9C19 )
        {
            _id_9B94( var_0, 0 );
            _id_9B51( var_0, 1 );
        }

        self._id_940F[var_0._id_331C] = undefined;
    }

    if ( level._id_3BDA )
        return;

    var_0._id_940D[var_1][var_2] = undefined;
    var_0 _setnumtouching( var_1, var_0._id_62AF[var_1] - 1 );
    var_0 _id_9B97();
}

_setnumtouching( var_0, var_1 )
{
    var_2 = self._id_62AF[var_0];
    self._id_62AF[var_0] = var_1;

    if ( isdefined( self.onnumtouchingchanged ) )
        [[ self.onnumtouchingchanged ]]( var_0, var_2, var_1 );
}

_id_50CA( var_0 )
{
    if ( !isdefined( level._id_0AA0 ) || !level._id_0AA0 )
        return 0;

    if ( !maps\mp\_utility::_id_50C4() )
        return 0;

    if ( !self _meth_83B2() )
        return 0;

    var_1 = _func_225( self._id_02E2, var_0._id_02E2 );

    if ( var_1 < var_0._id_0351 * var_0._id_0351 )
        return 1;

    return 0;
}

_id_9B51( var_0, var_1 )
{
    var_2 = self._id_0308["team"];

    if ( var_1 || !var_0 _id_1ACA( var_2 ) || var_2 != var_0._id_1E22 || var_0._id_6242 )
    {
        if ( isdefined( self._id_7041 ) )
            self._id_7041 maps\mp\gametypes\_hud_util::_id_4871();

        if ( isdefined( self._id_7042 ) )
            self._id_7042 maps\mp\gametypes\_hud_util::_id_4871();

        return;
    }

    if ( !isdefined( self._id_7041 ) )
    {
        self._id_7041 = maps\mp\gametypes\_hud_util::_id_2435();
        self._id_7041._id_560B = undefined;
        self._id_7041._id_55AC = 0;
    }

    if ( self._id_7041._id_483E )
    {
        self._id_7041 maps\mp\gametypes\_hud_util::_id_850A();
        self._id_7041._id_560B = undefined;
        self._id_7041._id_55AC = 0;
    }

    if ( !isdefined( self._id_7042 ) )
    {
        self._id_7042 = maps\mp\gametypes\_hud_util::_id_2436();
        var_3 = var_0 _id_40B5( var_2 );

        if ( isdefined( var_0._id_9206[var_3] ) )
            self._id_7042 _meth_80CC( var_0._id_9206[var_3] );
        else
            self._id_7042 _meth_80CC( var_0._id_9C18 );
    }

    if ( self._id_7042._id_483E )
    {
        self._id_7042 maps\mp\gametypes\_hud_util::_id_850A();
        var_3 = var_0 _id_40B5( var_2 );

        if ( isdefined( var_0._id_9206[var_3] ) )
            self._id_7042 _meth_80CC( var_0._id_9206[var_3] );
        else
            self._id_7042 _meth_80CC( var_0._id_9C18 );
    }

    if ( !isdefined( self._id_7041._id_560B ) || self._id_7041._id_560B != var_0._id_9C10 || self._id_7041._id_55AC != isdefined( level._id_4A39 ) )
    {
        if ( var_0._id_24C9 > var_0._id_9C19 )
            var_0._id_24C9 = var_0._id_9C19;

        var_4 = var_0._id_24C9 / var_0._id_9C19;
        var_5 = 1000 / var_0._id_9C19 * var_0._id_9C10;

        if ( isdefined( level._id_4A39 ) )
            var_5 = 0;

        if ( var_0._id_52E1 && !var_4 && var_5 < 0 )
            var_5 = 0;

        self._id_7041 maps\mp\gametypes\_hud_util::_id_9AF7( var_4, var_5 );
        self._id_7041._id_560B = var_0._id_9C10;
        self._id_7041._id_55AC = isdefined( level._id_4A39 );
    }
}

_id_4059( var_0 )
{
    return self._id_62AF[maps\mp\_utility::_id_4067( var_0 )];
}

_id_9B94( var_0, var_1 )
{
    var_2 = level._id_01B3;
    var_3 = var_0._id_4B53;
    var_4 = 0;

    if ( !isdefined( level._id_4A39 ) )
    {
        if ( var_0._id_24C9 > var_0._id_9C19 )
            var_0._id_24C9 = var_0._id_9C19;

        var_5 = var_0._id_24C9 / var_0._id_9C19;

        if ( var_0.contesteduiprogress )
        {
            if ( var_1 && isdefined( var_0._id_8AF1 ) && var_0._id_8AF1 )
            {
                var_6 = var_0 _id_3F79();
                var_4 = 1;

                if ( isdefined( var_6 ) && var_6._id_04A7 != self._id_04A7 )
                    var_5 = 0.01;
            }

            if ( !var_1 || var_0._id_1E22 != self._id_04A7 )
                var_5 = 0.01;

            if ( var_5 != 0 )
                self _meth_82F8( "ui_capture_progress", var_5 );
        }

        if ( ( var_2 == "sd" || var_2 == "sr" || var_2 == "sab" || var_2 == "dd" ) && isdefined( var_3 ) && ( var_3 == "bombZone" || var_3 == "defuseObject" ) )
        {
            if ( !var_1 )
                var_5 = 0;

            var_5 = _func_0E1( 0.01, var_5 );

            if ( var_5 != 0 )
                self _meth_82F8( "ui_capture_progress", var_5 );
        }
    }

    if ( var_0.contesteduiprogress )
    {
        if ( var_1 && var_0._id_663A == self._id_04A7 )
            var_1 = 0;

        if ( !var_1 )
            self _meth_82F8( "ui_capture_icon", 0 );
        else if ( !var_4 )
        {
            if ( var_2 == "dom" )
                self _meth_82F8( "ui_capture_icon", 1 );
            else if ( var_0._id_663A == "neutral" || maps\mp\_utility::_id_5092( level.captureinsteadofdestroy ) )
                self _meth_82F8( "ui_capture_icon", 2 );
            else
                self _meth_82F8( "ui_capture_icon", 3 );
        }
        else
            self _meth_82F8( "ui_capture_icon", 4 );
    }

    if ( ( var_2 == "sd" || var_2 == "sr" || var_2 == "sab" || var_2 == "dd" ) && isdefined( var_3 ) && ( var_3 == "bombZone" || var_3 == "defuseObject" ) )
    {
        if ( !var_1 )
            self _meth_82F8( "ui_capture_icon", 0 );
        else if ( var_0 _id_510F( self._id_0308["team"] ) )
            self _meth_82F8( "ui_capture_icon", 6 );
        else
            self _meth_82F8( "ui_capture_icon", 5 );
    }
}

_id_9B97()
{
    if ( isdefined( self._id_64F7 ) )
        self [[ self._id_64F7 ]]();
    else
        _id_9B98();
}

_id_9B98()
{
    var_0 = self._id_62AF[self._id_1E22];
    var_1 = 0;
    var_2 = 0;

    if ( level._id_5FEC )
    {
        foreach ( var_4 in level._id_91F7 )
        {
            if ( self._id_1E22 != var_4 )
                var_1 += self._id_62AF[var_4];
        }
    }
    else
    {
        if ( self._id_1E22 != "axis" )
            var_1 += self._id_62AF["axis"];

        if ( self._id_1E22 != "allies" )
            var_1 += self._id_62AF["allies"];
    }

    foreach ( var_7 in self._id_940D[self._id_1E22] )
    {
        if ( !isdefined( var_7._id_0318 ) )
            continue;

        if ( var_7._id_0318._id_0308["team"] != self._id_1E22 )
            continue;

        if ( var_7._id_0318._id_6303 == 1 )
            continue;

        var_0 *= var_7._id_0318._id_6303;
        var_2 = var_7._id_0318._id_6303;
    }

    self._id_9C10 = 0;
    self._id_8AF1 = var_0 && var_1;

    if ( var_0 && !var_1 )
        self._id_9C10 = _func_0BF( var_0, 4 );

    if ( isdefined( self._id_50BB ) && self._id_50BB && var_2 != 0 )
        self._id_9C10 = 1 * var_2;
    else if ( isdefined( self._id_50BB ) && self._id_50BB )
        self._id_9C10 = 1;

    if ( self._id_52E1 && self._id_5587 != self._id_1E22 )
        self._id_9C10 *= -1;
}

_id_0E0B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "done_using" );
    wait 0.7;
    self _meth_801D( "wpn_h1_briefcase_bomb_npc", "tag_inhand", 1 );
    self._id_0DF9 = "wpn_h1_briefcase_bomb_npc";
}

_id_9C02( var_0 )
{
    var_0 notify( "use_hold" );

    if ( _func_1AD( var_0 ) )
        var_0 _meth_807E( self._id_04C5 );
    else
        var_0 _meth_804F( self._id_04C5 );

    var_0 _meth_8083();
    var_0 _meth_8014( self._id_04C5 );
    var_0._id_1E23 = self._id_04C5;
    var_1 = self._id_9C1C;
    var_2 = var_0 _meth_830E();

    if ( isdefined( var_1 ) )
    {
        if ( var_2 == var_1 )
            var_2 = var_0._id_55C6;

        var_0._id_55C6 = var_2;
        var_0 maps\mp\_utility::_id_05C0( var_1 );
        var_0 _meth_82F4( var_1, 0 );
        var_0 _meth_82F3( var_1, 0 );
        var_0 _meth_8312( var_1 );

        if ( !isdefined( self.attachdefault3pmodel ) || self.attachdefault3pmodel == 1 )
            var_0 thread _id_0E0B();
    }
    else
        var_0 common_scripts\utility::_id_0587();

    self._id_24C9 = 0;
    self._id_020D = 1;
    self._id_9C10 = 0;

    if ( _func_1AD( var_0 ) )
        var_0 thread _id_67E5( self );

    var_3 = _id_9C04( var_0, var_2 );

    if ( isdefined( var_0 ) )
    {
        var_0 _id_2984();
        var_0 notify( "done_using" );
    }

    if ( isdefined( var_1 ) && isdefined( var_0 ) )
        var_0 thread _id_9131( var_1 );

    if ( isdefined( var_3 ) && var_3 )
        return 1;

    if ( isdefined( var_0 ) )
    {
        var_0._id_1E23 = undefined;

        if ( isdefined( var_1 ) )
        {
            if ( var_2 != "none" )
                var_0 maps\mp\_utility::_id_907A( var_2 );
            else
                var_0 _meth_830C( var_1 );
        }
        else
            var_0 common_scripts\utility::_id_0595();

        var_0 _meth_8051();

        if ( !maps\mp\_utility::_id_5189( var_0 ) )
            var_0._id_535F = 1;
    }

    self._id_020D = 0;
    self._id_04C5 _meth_8016();
    return 0;
}

_id_2984()
{
    if ( isdefined( self._id_0DF9 ) )
    {
        self _meth_802A( self._id_0DF9, "tag_inhand" );
        self._id_0DF9 = undefined;
    }
}

_id_9131( var_0 )
{
    self endon( "use_hold" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( self _meth_830E() == var_0 && !isdefined( self._id_933E ) )
        wait 0.05;

    self _meth_830C( var_0 );
}

_id_9C17( var_0, var_1, var_2, var_3 )
{
    if ( !maps\mp\_utility::_id_5189( var_0 ) )
        return 0;

    if ( !var_0 _meth_80AB( self._id_04C5 ) )
        return 0;

    if ( !var_0 _meth_8339() )
        return 0;

    if ( isdefined( var_0._id_933E ) )
        return 0;

    if ( var_0 _meth_833C() )
        return 0;

    if ( self._id_24C9 >= self._id_9C19 )
        return 0;

    if ( !self._id_9C10 && !var_1 )
        return 0;

    if ( var_1 && var_2 > var_3 )
        return 0;

    return 1;
}

_id_9C04( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disabled" );
    var_2 = self._id_9C1C;
    var_3 = 1;
    var_4 = 0;
    var_5 = 1.5;

    while ( _id_9C17( var_0, var_3, var_4, var_5 ) )
    {
        var_4 += 0.05;

        if ( !isdefined( var_2 ) || var_0 _meth_830E() == var_2 )
        {
            self._id_24C9 += 50 * self._id_9C10;
            self._id_9C10 = 1 * var_0._id_6303;
            var_3 = 0;
        }
        else
            self._id_9C10 = 0;

        if ( self._id_24C9 >= self._id_9C19 )
        {
            self._id_020D = 0;
            var_0 _meth_8015( self._id_04C5 );
            var_0._id_1E23 = undefined;

            if ( isdefined( var_2 ) )
            {
                var_0 _meth_82F4( var_2, 1 );
                var_0 _meth_82F3( var_2, 1 );

                if ( var_1 != "none" )
                    var_0 maps\mp\_utility::_id_907A( var_1 );
                else
                    var_0 _meth_830C( var_2 );
            }
            else
                var_0 common_scripts\utility::_id_0595();

            var_0 _meth_8051();
            return maps\mp\_utility::_id_5189( var_0 );
        }

        wait 0.05;
        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }

    return 0;
}

_id_67E5( var_0 )
{
    self endon( "disconnect" );
    var_1 = undefined;

    if ( !isdefined( var_0._id_6242 ) || !var_0._id_6242 )
        var_1 = maps\mp\gametypes\_hud_util::_id_2435();

    var_2 = undefined;

    if ( isdefined( var_1 ) && isdefined( var_0._id_9C18 ) )
    {
        var_2 = maps\mp\gametypes\_hud_util::_id_2436();
        var_2 _meth_80CC( var_0._id_9C18 );
    }

    var_3 = -1;
    var_4 = isdefined( level._id_4A39 );

    while ( maps\mp\_utility::_id_5189( self ) && var_0._id_020D && !level._id_3BDA )
    {
        if ( var_3 != var_0._id_9C10 || var_4 != isdefined( level._id_4A39 ) )
        {
            if ( var_0._id_24C9 > var_0._id_9C19 )
                var_0._id_24C9 = var_0._id_9C19;

            var_5 = var_0._id_24C9 / var_0._id_9C19;
            var_6 = 1000 / var_0._id_9C19 * var_0._id_9C10;

            if ( isdefined( level._id_4A39 ) )
                var_6 = 0;

            if ( isdefined( var_1 ) )
            {
                var_1 maps\mp\gametypes\_hud_util::_id_9AF7( var_5, var_6 );

                if ( !var_0._id_9C10 )
                {
                    var_1 maps\mp\gametypes\_hud_util::_id_4871();

                    if ( isdefined( var_2 ) )
                        var_2 maps\mp\gametypes\_hud_util::_id_4871();
                }
                else
                {
                    var_1 maps\mp\gametypes\_hud_util::_id_850A();

                    if ( isdefined( var_2 ) )
                        var_2 maps\mp\gametypes\_hud_util::_id_850A();
                }
            }
        }

        var_3 = var_0._id_9C10;
        var_4 = isdefined( level._id_4A39 );
        _id_9B94( var_0, 1 );
        wait 0.05;
    }

    _id_9B94( var_0, 0 );

    if ( isdefined( var_1 ) )
        var_1 maps\mp\gametypes\_hud_util::_id_28E9();

    if ( isdefined( var_2 ) )
        var_2 maps\mp\gametypes\_hud_util::_id_28E9();
}

_id_9B8F()
{
    if ( self._id_981D != "use" )
        return;

    if ( self._id_4EA9 == "none" )
        self._id_04C5._id_02E2 -= ( 0, 0, 50000 );
    else if ( self._id_4EA9 == "any" )
    {
        self._id_04C5._id_02E2 = self._id_24C8;
        self._id_04C5 _meth_8013( "none" );
    }
    else if ( self._id_4EA9 == "friendly" )
    {
        self._id_04C5._id_02E2 = self._id_24C8;

        if ( self._id_663A == "allies" )
            self._id_04C5 _meth_8013( "allies" );
        else if ( self._id_663A == "axis" )
            self._id_04C5 _meth_8013( "axis" );
        else
            self._id_04C5._id_02E2 -= ( 0, 0, 50000 );
    }
    else if ( self._id_4EA9 == "enemy" )
    {
        self._id_04C5._id_02E2 = self._id_24C8;

        if ( self._id_663A == "allies" )
            self._id_04C5 _meth_8013( "axis" );
        else if ( self._id_663A == "axis" )
            self._id_04C5 _meth_8013( "allies" );
        else
            self._id_04C5 _meth_8013( "none" );
    }
}

_id_9BA9()
{
    if ( self._id_9E5B == "any" )
    {
        _id_9BA8( "friendly", 1 );
        _id_9BA8( "enemy", 1 );
    }
    else if ( self._id_9E5B == "friendly" )
    {
        _id_9BA8( "friendly", 1 );
        _id_9BA8( "enemy", 0 );
    }
    else if ( self._id_9E5B == "enemy" )
    {
        _id_9BA8( "friendly", 0 );
        _id_9BA8( "enemy", 1 );
    }
    else
    {
        _id_9BA8( "friendly", 0 );
        _id_9BA8( "enemy", 0 );
    }

    _id_9BA8( "mlg", 1 );
}

_id_9BA8( var_0, var_1 )
{
    if ( !isdefined( self._id_A350[var_0] ) )
        var_1 = 0;

    var_2 = _id_4149( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = "objpoint_" + var_2[var_3] + "_" + self._id_331C;
        var_5 = maps\mp\gametypes\_objpoints::_id_405E( var_4 );

        if ( !isdefined( var_5 ) )
            continue;

        var_5 notify( "stop_flashing_thread" );
        var_5 thread maps\mp\gametypes\_objpoints::_id_8EE6();

        if ( var_1 )
        {
            var_5 _meth_80CE( self._id_A350[var_0], level._id_6318, level._id_6318 );
            var_5 _meth_8086( 0.05 );
            var_5.alpha = var_5._id_1301;
            var_5._id_51A5 = 1;

            if ( isdefined( self._id_20D0[var_0] ) )
                var_5 _meth_80DA( 1, 1 );
            else
                var_5 _meth_80DA( 1, 0 );

            if ( self._id_04D9 == "carryObject" )
            {
                if ( isdefined( self._id_1BAF ) && !_id_84A1( var_0 ) )
                    var_5 _meth_80CF( self._id_1BAF );
                else if ( !isdefined( self._id_1BAF ) && isdefined( self._id_6300 ) && self._id_6300 )
                    var_5 _meth_80CF( self._id_9E9C[0] );
                else
                    var_5 _meth_80D0();
            }
        }
        else
        {
            var_5 _meth_8086( 0.05 );
            var_5.alpha = 0;
            var_5._id_51A5 = 0;
            var_5 _meth_80D0();
        }

        var_5 thread _id_4883();
    }
}

_id_4883()
{
    self notify( "hideWorldIconOnGameEnd" );
    self endon( "hideWorldIconOnGameEnd" );
    self endon( "death" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
        self.alpha = 0;
}

_id_9B8A( var_0, var_1 )
{

}

_id_9B09()
{
    if ( self._id_9E5B == "any" )
    {
        _id_9B08( "friendly", 1 );
        _id_9B08( "enemy", 1 );
    }
    else if ( self._id_9E5B == "friendly" )
    {
        _id_9B08( "friendly", 1 );
        _id_9B08( "enemy", 0 );
    }
    else if ( self._id_9E5B == "enemy" )
    {
        _id_9B08( "friendly", 0 );
        _id_9B08( "enemy", 1 );
    }
    else
    {
        _id_9B08( "friendly", 0 );
        _id_9B08( "enemy", 0 );
    }

    _id_9B08( "mlg", 1 );
}

_id_9B08( var_0, var_1 )
{
    if ( !isdefined( self._id_20D0 ) )
        return;

    var_2 = _id_4149( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_1;

        if ( !var_4 && _id_84AA( var_2[var_3] ) )
            var_4 = 1;

        var_5 = self._id_6305;

        if ( var_2[var_3] == "axis" )
            var_5 = self._id_6306;

        if ( var_2[var_3] == "mlg" )
            var_5 = self._id_6309;

        if ( !isdefined( self._id_20D0[var_0] ) || !var_4 )
        {
            objective_state( var_5, "invisible" );
            continue;
        }

        objective_icon( var_5, self._id_20D0[var_0] );
        objective_state( var_5, "active" );

        if ( self._id_04D9 == "carryObject" )
        {
            if ( maps\mp\_utility::_id_5189( self._id_1BAF ) && !_id_84A1( var_0 ) )
            {
                objective_onentity( var_5, self._id_1BAF );
                continue;
            }

            if ( isdefined( self._id_6300 ) && self._id_6300 )
            {
                objective_onentity( var_5, self._id_9E9C[0] );
                continue;
            }

            objective_position( var_5, self._id_24C8 );
        }
    }
}

_id_84A1( var_0 )
{
    if ( var_0 == "friendly" && self._id_630B )
        return 1;
    else if ( var_0 == "enemy" && self._id_630A )
        return 1;

    return 0;
}

_id_4149( var_0 )
{
    var_1 = [];

    if ( var_0 == "friendly" )
    {
        if ( _id_510F( "allies" ) )
            var_1[var_1.size] = "allies";

        if ( _id_510F( "axis" ) )
            var_1[var_1.size] = "axis";
    }
    else if ( var_0 == "enemy" )
    {
        if ( !_id_510F( "allies" ) )
            var_1[var_1.size] = "allies";

        if ( !_id_510F( "axis" ) )
            var_1[var_1.size] = "axis";
    }
    else if ( var_0 == "mlg" )
        var_1[var_1.size] = "mlg";

    return var_1;
}

_id_84AA( var_0 )
{
    if ( var_0 == "mlg" )
        return 0;

    if ( !isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_1BAF maps\mp\_utility::_id_05CB( "specialty_radarimmune" ) )
        return 0;

    return _func_17A( var_0 );
}

_id_9B9F()
{
    self endon( "death" );
    self endon( "carrier_cleared" );

    for (;;)
    {
        level waittill( "radar_status_change" );
        _id_9B09();
    }
}

_id_7FDA( var_0 )
{
    self._id_663A = var_0;
    _id_9B8F();
    _id_9B09();
    _id_9BA9();
}

_id_4078()
{
    return self._id_663A;
}

_id_834C( var_0 )
{
    self._id_9C19 = _func_0BC( var_0 * 1000 );
}

_id_834B( var_0 )
{
    self._id_9C18 = var_0;
}

_id_802E( var_0, var_1 )
{
    self._id_9207[var_0] = _func_0BC( var_1 * 1000 );
}

_id_802D( var_0, var_1 )
{
    self._id_9206[var_0] = var_1;
}

_id_834A( var_0 )
{
    self._id_04C5 _meth_80DD( var_0 );
}

_id_0AA1( var_0 )
{
    self._id_4EA9 = var_0;
}

_id_0AB2( var_0 )
{
    self._id_4EA9 = var_0;
    _id_9B8F();
}

_id_8352( var_0 )
{
    self._id_9E5B = var_0;
    _id_9B09();
    _id_9BA9();
}

_id_7FB5( var_0 )
{
    if ( var_0 )
    {
        for ( var_1 = 0; var_1 < self._id_9E9C.size; var_1++ )
        {
            self._id_9E9C[var_1] _meth_8055();

            if ( self._id_9E9C[var_1].classname == "script_brushmodel" || self._id_9E9C[var_1].classname == "script_model" )
            {
                foreach ( var_3 in level._id_0323 )
                {
                    if ( var_3 _meth_80AB( self._id_9E9C[var_1] ) )
                        var_3 maps\mp\_utility::_id_066F();
                }

                self._id_9E9C[var_1] thread _id_5948();
            }
        }
    }
    else
    {
        for ( var_1 = 0; var_1 < self._id_9E9C.size; var_1++ )
        {
            self._id_9E9C[var_1] _meth_8056();

            if ( self._id_9E9C[var_1].classname == "script_brushmodel" || self._id_9E9C[var_1].classname == "script_model" )
            {
                self._id_9E9C[var_1] notify( "changing_solidness" );
                self._id_9E9C[var_1] _meth_82BB();
            }
        }
    }
}

_id_5948()
{
    self endon( "death" );
    self notify( "changing_solidness" );
    self endon( "changing_solidness" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
        {
            if ( level._id_0323[var_0] _meth_80AB( self ) )
                break;
        }

        if ( var_0 == level._id_0323.size )
        {
            self _meth_82BA();
            break;
        }

        wait 0.05;
    }
}

_id_7F35( var_0 )
{
    self._id_1BB1 = var_0;
}

_id_7F32( var_0 )
{
    self._id_9C16 = var_0;
}

_id_7F12( var_0, var_1 )
{
    self._id_20D0[var_0] = var_1;
    _id_9B09();
}

_id_7F13( var_0, var_1 )
{
    self._id_A350[var_0] = var_1;
    _id_9BA9();
}

_id_7F14( var_0, var_1 )
{
    self._id_A352[var_0] = var_1;
}

_id_7F36( var_0 )
{
    self._id_1BB5 = var_0;
}

_id_2B1E()
{
    self notify( "disabled" );

    if ( self._id_04D9 == "carryObject" )
    {
        if ( isdefined( self._id_1BAF ) )
            self._id_1BAF _id_912E( self );

        for ( var_0 = 0; var_0 < self._id_9E9C.size; var_0++ )
            self._id_9E9C[var_0] _meth_8056();
    }

    self._id_04C5 common_scripts\utility::_id_97CC();
    _id_8352( "none" );
}

_id_3114()
{
    if ( self._id_04D9 == "carryObject" )
    {
        for ( var_0 = 0; var_0 < self._id_9E9C.size; var_0++ )
            self._id_9E9C[var_0] _meth_8055();
    }

    self._id_04C5 common_scripts\utility::_id_97CE();
    _id_8352( "any" );
}

_id_40B5( var_0 )
{
    if ( var_0 == self._id_663A )
        return "friendly";
    else
        return "enemy";
}

_id_510F( var_0 )
{
    var_1 = _id_3F30();

    if ( isdefined( var_1 ) && self._id_663A == "neutral" && var_1 != "none" && var_1 != var_0 )
        return 1;

    if ( self._id_663A == "any" )
        return 1;

    if ( self._id_663A == var_0 )
        return 1;

    return 0;
}

_id_1ACA( var_0, var_1 )
{
    switch ( self._id_4EA9 )
    {
        case "none":
            return 0;
        case "any":
            return 1;
        case "friendly":
            if ( var_0 == self._id_663A )
                return 1;
            else
                return 0;
        case "enemy":
            if ( var_0 != self._id_663A )
                return 1;
            else
                return 0;
        default:
            return 0;
    }
}

_id_51CB( var_0 )
{
    if ( var_0 == "neutral" )
        return 1;

    if ( var_0 == "allies" )
        return 1;

    if ( var_0 == "axis" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    foreach ( var_2 in level._id_91F7 )
    {
        if ( var_0 == var_2 )
            return 1;
    }

    return 0;
}

_id_518B( var_0 )
{
    if ( var_0 == "friendly" )
        return 1;

    if ( var_0 == "enemy" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    return 0;
}

_id_3F81( var_0 )
{
    if ( level._id_5FEC )
    {

    }

    if ( var_0 == "neutral" )
        return "none";
    else if ( var_0 == "allies" )
        return "axis";
    else
        return "allies";
}

_id_4041()
{
    if ( !isdefined( level._id_7266 ) || level._id_7266.size < 1 )
    {
        var_0 = level._id_62A2;
        level._id_62A2++;
    }
    else
    {
        var_0 = level._id_7266[level._id_7266.size - 1];
        level._id_7266[level._id_7266.size - 1] = undefined;
    }

    if ( var_0 > 35 )
    {
        if ( isdefined( level._id_511D ) && level._id_511D )
        {

        }

        var_0 = 35;
    }

    return var_0;
}

_id_3FFA()
{
    var_0 = self._id_04C5._id_0394;

    if ( !isdefined( var_0 ) )
    {
        var_0 = "";
        return var_0;
    }

    if ( var_0[0] != "_" )
        return "_" + var_0;

    return var_0;
}

_id_4DE3()
{
    self._id_6071 = undefined;
    self._id_19DB = 0;
    self._id_6445 = undefined;
}

_id_600A( var_0 )
{
    self._id_600A = var_0;
}

_id_1AC3( var_0 )
{
    self._id_1AC3 = var_0;
}

_id_3645()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = 120;
    var_1 = _func_0B4( 30, 90 );
    var_0 += var_1;
    maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
    self waittill( "show_loot_notification" );
}

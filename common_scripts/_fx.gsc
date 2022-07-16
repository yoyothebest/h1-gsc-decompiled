// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4DBF()
{
    if ( !isdefined( level._id_3AE4 ) )
        level._id_3AE4 = [];

    if ( !isdefined( level._id_3AE4["create_triggerfx"] ) )
        level._id_3AE4["create_triggerfx"] = ::_id_23DD;

    if ( !isdefined( level._id_05B2 ) )
        level._id_05B2 = spawnstruct();

    common_scripts\utility::_id_23C8( "createfx_looper", 20 );
    level._id_3BA6 = 1;
    level._id_05B2._id_3539 = common_scripts\_exploder::_id_352A;
    waitframe;
    waitframe;
    level._id_05B2._id_3539 = common_scripts\_exploder::_id_3529;
    level._id_05B2._id_7D9E = 0;

    if ( getdvarint( "serverCulledSounds" ) == 1 )
        level._id_05B2._id_7D9E = 1;

    if ( level._id_2409 )
        level._id_05B2._id_7D9E = 0;

    if ( level._id_2409 )
        level waittill( "createfx_common_done" );

    for ( var_0 = 0; var_0 < level._id_2417.size; var_0++ )
    {
        var_1 = level._id_2417[var_0];
        var_1 common_scripts\_createfx::_id_7E40();

        switch ( var_1._id_9C42["type"] )
        {
            case "loopfx":
                var_1 thread _id_5883();
                break;
            case "oneshotfx":
                var_1 thread _id_64A0();
                break;
            case "soundfx":
                var_1 thread _id_23CA();
                break;
            case "soundfx_interval":
                var_1 thread _id_23C3();
                break;
            case "reactive_fx":
                var_1 _id_078A();
                break;
            case "soundfx_dynamic":
                var_1 thread _id_23AF();
                break;
        }

        if ( isdefined( var_1._id_9C42["stop_on_exploder"] ) )
            var_1 thread common_scripts\_createfx::stop_fx_looper_on_exploder();
    }

    _id_1CB4();
}

_id_7346()
{

}

_id_1CB4()
{

}

_id_1CD1( var_0, var_1 )
{

}

_id_6F99( var_0, var_1, var_2, var_3 )
{
    if ( getdvar( "debug" ) == "1" )
        return;
}

_id_688F()
{
    if ( isdefined( self._id_9C42["platform"] ) && isdefined( level._id_00E3 ) )
    {
        var_0 = self._id_9C42["platform"];

        if ( var_0 == "cg" && !level._id_00E3 || var_0 == "ng" && !level._id_02AF || var_0 == "xenon" && !level._id_0532 || var_0 == "ps3" && !level._id_0349 || var_0 == "pc" && !level._id_02FB || var_0 == "xb3" && !level._id_0531 || var_0 == "ps4" && !level._id_034A || var_0 == "pccg" && !level._id_02FC || var_0 == "!cg" && level._id_00E3 || var_0 == "!ng" && level._id_02AF || var_0 == "!xenon" && level._id_0532 || var_0 == "!ps3" && level._id_0349 || var_0 == "!pc" && level._id_02FB || var_0 == "!xb3" && level._id_0531 || var_0 == "!ps4" && level._id_034A || var_0 == "!pccg" && level._id_02FC )
            return 0;
    }

    return 1;
}

_id_649F( var_0, var_1, var_2, var_3 )
{

}

_id_353A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17 )
{
    if ( 1 )
    {
        var_18 = common_scripts\utility::_id_23FE( var_1 );
        var_18._id_9C42["origin"] = var_2;
        var_18._id_9C42["angles"] = ( 0, 0, 0 );

        if ( isdefined( var_4 ) )
            var_18._id_9C42["angles"] = _func_115( var_4 - var_2 );

        var_18._id_9C42["delay"] = var_3;
        var_18._id_9C42["exploder"] = var_0;

        if ( isdefined( level._id_241A ) )
        {
            var_19 = level._id_241A[var_18._id_9C42["exploder"]];

            if ( !isdefined( var_19 ) )
                var_19 = [];

            var_19[var_19.size] = var_18;
            level._id_241A[var_18._id_9C42["exploder"]] = var_19;
        }

        return;
    }

    var_20 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_20._id_02E2 = var_2;
    var_20.angles = _func_115( var_4 - var_2 );
    var_20._id_79BF = var_0;
    var_20._id_79F1 = var_1;
    var_20._id_0392 = var_3;
    var_20._id_79CB = var_5;
    var_20._id_79CC = var_6;
    var_20._id_79CD = var_7;
    var_20._id_7ACA = var_8;
    var_20._id_79B5 = var_9;
    var_20._id_7981 = var_10;
    var_20._id_7AB2 = var_15;
    var_20._id_7ACB = var_11;
    var_20._id_79CE = var_16;
    var_20._id_7AB6 = var_12;
    var_20._id_798E = var_13;
    var_20._id_798D = var_14;
    var_20._id_79C1 = var_17;
    var_21 = anglestoforward( var_20.angles );
    var_21 *= 150;
    var_20._id_91D8 = var_2 + var_21;

    if ( !isdefined( level._id_062E ) )
        level._id_062E = [];

    level._id_062E[level._id_062E.size] = var_20;
}

_id_587C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = common_scripts\utility::_id_2428( var_0 );
    var_7._id_9C42["origin"] = var_1;
    var_7._id_9C42["angles"] = ( 0, 0, 0 );

    if ( isdefined( var_3 ) )
        var_7._id_9C42["angles"] = _func_115( var_3 - var_1 );

    var_7._id_9C42["delay"] = var_2;
}

_id_23C9()
{
    self._id_587B = playloopedfx( level._id_058F[self._id_9C42["fxid"]], self._id_9C42["delay"], self._id_9C42["origin"], 0, self._id_9C42["forward"], self._id_9C42["up"] );
    _id_23CA();
}

_id_23CA()
{
    if ( !_id_688F() )
        return;

    self notify( "stop_loop" );

    if ( !isdefined( self._id_9C42["soundalias"] ) )
        return;

    if ( self._id_9C42["soundalias"] == "nil" )
        return;

    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self._id_9C42["stopable"] ) && self._id_9C42["stopable"] )
    {
        if ( isdefined( self._id_587B ) )
            var_1 = "death";
        else
            var_1 = "stop_loop";
    }
    else if ( level._id_05B2._id_7D9E && isdefined( self._id_9C42["server_culled"] ) )
        var_0 = self._id_9C42["server_culled"];

    var_2 = self;

    if ( isdefined( self._id_587B ) )
        var_2 = self._id_587B;

    var_3 = undefined;

    if ( level._id_2409 )
        var_3 = self;

    var_2 common_scripts\utility::_id_5874( self._id_9C42["soundalias"], self._id_9C42["origin"], self._id_9C42["angles"], var_0, var_1, var_3 );
}

_id_23C3()
{
    if ( !_id_688F() )
        return;

    self notify( "stop_loop" );

    if ( !isdefined( self._id_9C42["soundalias"] ) )
        return;

    if ( self._id_9C42["soundalias"] == "nil" )
        return;

    var_0 = undefined;
    var_1 = self;

    if ( isdefined( self._id_9C42["stopable"] ) && self._id_9C42["stopable"] || level._id_2409 )
    {
        if ( isdefined( self._id_587B ) )
        {
            var_1 = self._id_587B;
            var_0 = "death";
        }
        else
            var_0 = "stop_loop";
    }

    var_1 thread common_scripts\utility::_id_5873( self._id_9C42["soundalias"], self._id_9C42["origin"], self._id_9C42["angles"], var_0, undefined, self._id_9C42["delay_min"], self._id_9C42["delay_max"] );
}

_id_23AF()
{
    if ( !_id_688F() )
        return;

    if ( !isdefined( self._id_9C42["ambiencename"] ) )
        return;

    if ( self._id_9C42["ambiencename"] == "nil" )
        return;

    if ( common_scripts\utility::_id_51AE() )
        return;

    if ( getdvar( "createfx" ) == "on" )
        common_scripts\utility::_id_384A( "createfx_started" );

    if ( isdefined( self._id_25CC ) )
        level._id_0318 _meth_847A( self._id_25CC._id_9A29 );

    self._id_25CC = spawnstruct();
    self._id_25CC common_scripts\utility::_id_0D6F();
    level._id_0318 _meth_8479( self._id_9C42["ambiencename"], self._id_9C42["origin"], self._id_9C42["dynamic_distance"], self._id_25CC._id_9A29 );
    return;
}

_id_5883()
{
    waittillframeend;

    if ( isdefined( self._id_3BB9 ) )
        level waittill( "start fx" + self._id_3BB9 );

    for (;;)
    {
        _id_23C9();

        if ( isdefined( self._id_936B ) )
            thread _id_5882( self._id_936B );

        if ( isdefined( self._id_3BBA ) )
            level waittill( "stop fx" + self._id_3BBA );
        else
            return;

        if ( isdefined( self._id_587B ) )
            self._id_587B delete();

        if ( isdefined( self._id_3BB9 ) )
        {
            level waittill( "start fx" + self._id_3BB9 );
            continue;
        }

        return;
    }
}

_id_587F( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect id changed", var_1 );
}

_id_5880( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0 waittill( "effect org changed", var_1 );
        self._id_02E2 = var_1;
    }
}

_id_587E( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect delay changed", var_1 );
}

_id_5881( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect deleted" );
    self delete();
}

_id_5882( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self._id_587B delete();
}

_id_5890( var_0, var_1, var_2 )
{
    level thread _id_5892( var_0, var_1, var_2 );
}

_id_5892( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_1 );
    var_3._id_02E2 = var_1;
    var_3 _meth_8077( var_0 );
}

_id_446A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread _id_446B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_446B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level endon( "stop all gunfireloopfx" );
    waittillframeend;

    if ( var_7 < var_6 )
    {
        var_8 = var_7;
        var_7 = var_6;
        var_6 = var_8;
    }

    var_9 = var_6;
    var_10 = var_7 - var_6;

    if ( var_5 < var_4 )
    {
        var_8 = var_5;
        var_5 = var_4;
        var_4 = var_8;
    }

    var_11 = var_4;
    var_12 = var_5 - var_4;

    if ( var_3 < var_2 )
    {
        var_8 = var_3;
        var_3 = var_2;
        var_2 = var_8;
    }

    var_13 = var_2;
    var_14 = var_3 - var_2;
    var_15 = spawnfx( level._id_058F[var_0], var_1 );

    if ( !level._id_2409 )
        var_15 _meth_80E3();

    for (;;)
    {
        var_16 = var_13 + _func_0B2( var_14 );

        for ( var_17 = 0; var_17 < var_16; var_17++ )
        {
            triggerfx( var_15 );
            wait(var_11 + _func_0B3( var_12 ));
        }

        wait(var_9 + _func_0B3( var_10 ));
    }
}

_id_446C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    thread _id_446D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

_id_446D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    level endon( "stop all gunfireloopfx" );
    waittillframeend;

    if ( var_8 < var_7 )
    {
        var_9 = var_8;
        var_8 = var_7;
        var_7 = var_9;
    }

    var_10 = var_7;
    var_11 = var_8 - var_7;

    if ( var_6 < var_5 )
    {
        var_9 = var_6;
        var_6 = var_5;
        var_5 = var_9;
    }

    var_12 = var_5;
    var_13 = var_6 - var_5;

    if ( var_4 < var_3 )
    {
        var_9 = var_4;
        var_4 = var_3;
        var_3 = var_9;
    }

    var_14 = var_3;
    var_15 = var_4 - var_3;
    var_2 = _func_114( var_2 - var_1 );
    var_16 = spawnfx( level._id_058F[var_0], var_1, var_2 );

    if ( !level._id_2409 )
        var_16 _meth_80E3();

    for (;;)
    {
        var_17 = var_14 + _func_0B2( var_15 );

        for ( var_18 = 0; var_18 < _func_0BC( var_17 / level._id_3BA6 ); var_18++ )
        {
            triggerfx( var_16 );
            var_19 = ( var_12 + _func_0B3( var_13 ) ) * level._id_3BA6;

            if ( var_19 < 0.05 )
                var_19 = 0.05;

            wait(var_19);
        }

        wait(var_12 + _func_0B3( var_13 ));
        wait(var_10 + _func_0B3( var_11 ));
    }
}

_id_7F6E( var_0 )
{
    level._id_3BA6 = 1 / var_0;
}

_id_811E()
{
    if ( !isdefined( self._id_79F1 ) || !isdefined( self._id_79F0 ) || !isdefined( self._id_0392 ) )
        return;

    if ( isdefined( self._id_029C ) )
    {
        if ( self._id_029C == "toilet" )
        {
            thread _id_1929();
            return;
        }
    }

    var_0 = undefined;

    if ( isdefined( self._id_04A4 ) )
    {
        var_1 = getent( self._id_04A4, "targetname" );

        if ( isdefined( var_1 ) )
            var_0 = var_1._id_02E2;
    }

    var_2 = undefined;

    if ( isdefined( self._id_79F2 ) )
        var_2 = self._id_79F2;

    var_3 = undefined;

    if ( isdefined( self._id_79F3 ) )
        var_3 = self._id_79F3;

    if ( self._id_79F0 == "OneShotfx" )
        _id_649F( self._id_79F1, self._id_02E2, self._id_0392, var_0 );

    if ( self._id_79F0 == "loopfx" )
        _id_587C( self._id_79F1, self._id_02E2, self._id_0392, var_0, var_2, var_3 );

    if ( self._id_79F0 == "loopsound" )
        _id_5890( self._id_79F1, self._id_02E2, self._id_0392 );

    self delete();
}

_id_1929()
{
    var_0 = ( 0, 0, self.angles[1] );
    var_1 = level._id_058F[self._id_79F1];
    var_2 = self._id_02E2;
    wait 1;
    level thread _id_192A( var_0, var_2, var_1 );
    self delete();
}

_id_192A( var_0, var_1, var_2 )
{
    for (;;)
    {
        playfx( var_2, var_1 );
        wait(30 + _func_0B3( 40 ));
    }
}

_id_23DD()
{
    if ( !_id_9D87( self._id_9C42["fxid"] ) )
        return;

    if ( isdefined( self._id_9C42["tintcolor"] ) || isdefined( self._id_9C42["tintalpha"] ) || isdefined( self._id_9C42["fadein"] ) || isdefined( self._id_9C42["fadeout"] ) || isdefined( self._id_9C42["emissive"] ) || isdefined( self._id_9C42["sizescale"] ) )
    {
        var_0 = self._id_9C42["tintcolor"];

        if ( !isdefined( var_0 ) )
            var_0 = ( 1, 1, 1 );

        var_1 = self._id_9C42["tintalpha"];

        if ( !isdefined( var_1 ) )
            var_1 = 1;

        var_2 = self._id_9C42["fadein"];

        if ( !isdefined( var_2 ) )
            var_2 = ( 0, 0, 0 );

        var_3 = self._id_9C42["fadeout"];

        if ( !isdefined( var_3 ) )
            var_3 = ( 0, 0, 0 );

        var_4 = self._id_9C42["emissive"];

        if ( !isdefined( var_4 ) )
            var_4 = 1;

        var_5 = self._id_9C42["sizescale"];

        if ( !isdefined( var_5 ) )
            var_5 = 1;

        self._id_587B = spawnfx( level._id_058F[self._id_9C42["fxid"]], self._id_9C42["origin"], self._id_9C42["forward"], self._id_9C42["up"], var_0, var_1, var_2, var_3, var_4, var_5 );
    }
    else
        self._id_587B = spawnfx( level._id_058F[self._id_9C42["fxid"]], self._id_9C42["origin"], self._id_9C42["forward"], self._id_9C42["up"] );

    triggerfx( self._id_587B, self._id_9C42["delay"] );

    if ( !level._id_2409 )
        self._id_587B _meth_80E3();
    else
        setfxkillondelete( self._id_587B, 1 );

    _id_23CA();
}

_id_9D87( var_0 )
{
    if ( isdefined( level._id_058F[var_0] ) )
        return 1;

    if ( !isdefined( level._id_05F3 ) )
        level._id_05F3 = [];

    level._id_05F3[self._id_9C42["fxid"]] = var_0;
    _id_9D88( var_0 );
    return 0;
}

_id_9D88( var_0 )
{
    level notify( "verify_effects_assignment_print" );
    level endon( "verify_effects_assignment_print" );
    wait 0.05;
    var_1 = _func_1D3( level._id_05F3 );

    foreach ( var_3 in var_1 )
    {

    }
}

_id_64A0()
{
    wait 0.05;

    if ( !_id_688F() )
        return;

    if ( self._id_9C42["delay"] > 0 )
        wait(self._id_9C42["delay"]);

    [[ level._id_3AE4["create_triggerfx"] ]]();
}

_id_078A()
{
    if ( !_id_688F() )
        return;

    if ( !common_scripts\utility::_id_51AE() && getdvar( "createfx" ) == "" )
        return;

    if ( !isdefined( level._id_05B2._id_7190 ) )
    {
        level._id_05B2._id_7190 = 1;
        level thread _id_718E();
    }

    if ( !isdefined( level._id_05B2._id_718D ) )
        level._id_05B2._id_718D = [];

    level._id_05B2._id_718D[level._id_05B2._id_718D.size] = self;
    self._id_60C0 = 3000;
}

_id_718E()
{
    if ( !common_scripts\utility::_id_51AE() )
    {
        if ( getdvar( "createfx" ) == "on" )
            common_scripts\utility::_id_384A( "createfx_started" );
    }

    level._id_05B2._id_718F = [];
    var_0 = 256;

    for (;;)
    {
        level waittill( "code_damageradius", var_1, var_0, var_2, var_3 );
        var_4 = _id_8892( var_2, var_0 );

        foreach ( var_7, var_6 in var_4 )
            var_6 thread _id_6998( var_7 );
    }
}

_id_9C71( var_0 )
{
    return ( var_0[0], var_0[1], 0 );
}

_id_8892( var_0, var_1 )
{
    var_2 = [];
    var_3 = gettime();

    foreach ( var_5 in level._id_05B2._id_718D )
    {
        if ( var_5._id_60C0 > var_3 )
            continue;

        var_6 = var_5._id_9C42["reactive_radius"] + var_1;
        var_6 *= var_6;

        if ( _func_0F0( var_0, var_5._id_9C42["origin"] ) < var_6 )
            var_2[var_2.size] = var_5;
    }

    foreach ( var_5 in var_2 )
    {
        var_9 = _id_9C71( var_5._id_9C42["origin"] - level._id_0318._id_02E2 );
        var_10 = _id_9C71( var_0 - level._id_0318._id_02E2 );
        var_11 = _func_114( var_9 );
        var_12 = _func_114( var_10 );
        var_5._id_2D80 = _func_0F6( var_11, var_12 );
    }

    for ( var_14 = 0; var_14 < var_2.size - 1; var_14++ )
    {
        for ( var_15 = var_14 + 1; var_15 < var_2.size; var_15++ )
        {
            if ( var_2[var_14]._id_2D80 > var_2[var_15]._id_2D80 )
            {
                var_16 = var_2[var_14];
                var_2[var_14] = var_2[var_15];
                var_2[var_15] = var_16;
            }
        }
    }

    foreach ( var_5 in var_2 )
    {
        var_5._id_02E2 = undefined;
        var_5._id_2D80 = undefined;
    }

    for ( var_14 = 4; var_14 < var_2.size; var_14++ )
        var_2[var_14] = undefined;

    return var_2;
}

_id_6998( var_0 )
{
    var_1 = _id_3E4D();

    if ( !isdefined( var_1 ) )
        return;

    self._id_60C0 = gettime() + 3000;
    var_1._id_02E2 = self._id_9C42["origin"];
    var_1._id_506C = 1;
    wait(var_0 * _func_0B5( 0.05, 0.1 ));

    if ( common_scripts\utility::_id_51AE() )
    {
        var_1 _meth_809C( self._id_9C42["soundalias"], "sounddone" );
        var_1 waittill( "sounddone" );
    }
    else
    {
        var_1 _meth_809C( self._id_9C42["soundalias"] );
        wait 2;
    }

    wait 0.1;
    var_1._id_506C = 0;
}

_id_3E4D()
{
    foreach ( var_1 in level._id_05B2._id_718F )
    {
        if ( !var_1._id_506C )
            return var_1;
    }

    if ( level._id_05B2._id_718F.size < 4 )
    {
        var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_1._id_506C = 0;
        level._id_05B2._id_718F[level._id_05B2._id_718F.size] = var_1;
        return var_1;
    }

    return undefined;
}

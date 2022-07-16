// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_23D0( var_0, var_1 )
{
    var_2 = _func_1A9();
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2 _meth_80CE( var_0, 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2._id_03D4 = 1;
    var_2._id_01F3 = "fullscreen";
    var_2._id_0501 = "fullscreen";
    var_2.alpha = var_1;
    var_2._id_0198 = 1;
    return var_2;
}

_id_4855()
{
    self _meth_8056();
    self _meth_82BB();

    if ( self._id_03DA & 1 )
        self _meth_805A();
}

_id_486B( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = getentarray( "hide", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        switch ( var_2.classname )
        {
            case "script_vehicle":
                var_2 delete();
                continue;
            case "script_model":
                var_2 _meth_8056();
                continue;
            case "script_brushmodel":
                var_2 _meth_8056();
                var_2 _meth_82BB();

                if ( var_2._id_03DA & 1 )
                    var_2 _meth_805A();

                continue;
            case "trigger_multiple":
            case "trigger_radius":
            case "trigger_use":
            case "trigger_use_touch":
            case "trigger_multiple_flag_set":
            case "trigger_multiple_breachIcon":
            case "trigger_multiple_flag_lookat":
            case "trigger_multiple_flag_looking":
                var_2 common_scripts\utility::_id_97CC();
                continue;
        }
    }
}

_id_0907( var_0, var_1 )
{
    self endon( "death" );
    var_1 = _func_0BC( var_1 * 1000 );
    var_2 = gettime();
    var_3 = gettime();

    while ( var_3 < var_2 + var_1 )
    {
        wait 0.05;
        var_3 = gettime();
        self notify( var_0 );
    }

    self notify( "ai_notify_complete" );
}

_id_3CBD( var_0 )
{
    var_1 = [];
    var_2 = self;
    var_3 = 0;

    while ( isdefined( var_2._id_04A4 ) )
    {
        wait 0.05;

        if ( isdefined( var_2._id_04A4 ) )
        {
            switch ( var_0 )
            {
                case "vehiclenode":
                    var_2 = _func_1EC( var_2._id_04A4, "targetname" );
                    break;
                case "pathnode":
                    var_2 = _func_0C3( var_2._id_04A4, "targetname" );
                    break;
                case "ent":
                    var_2 = getent( var_2._id_04A4, "targetname" );
                    break;
                default:
            }

            var_1[var_1.size] = var_2;
            continue;
        }

        break;
    }

    if ( var_1.size > 0 )
        return var_1;
    else
        return undefined;
}

_id_9FA9( var_0, var_1 )
{
    level endon( var_0 );
    wait(var_1);
}

_id_3CB9( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = _func_0D9( var_2 );
    else
        var_3 = _func_0D9();

    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( _func_0EE( var_1, self._id_02E2 ) <= var_0 )
            common_scripts\utility::_id_0CDA( var_4, var_3[var_5] );
    }

    return var_4;
}

_id_0926( var_0 )
{
    self endon( "death" );

    if ( isdefined( self ) && _func_1A1( self ) && _id_A5A4::_id_38A9() )
        _id_A5A4::_id_38AB( var_0 );
}

_id_8CC0( var_0 )
{
    self _meth_81CA( var_0._id_02E2, var_0.angles );
    self _meth_81AA( self._id_02E2 );
    self _meth_81A9( var_0 );
}

_id_A0AB( var_0, var_1 )
{
    for (;;)
    {
        if ( _func_0EE( var_0, level._id_0318._id_02E2 ) <= var_1 )
            break;

        wait 0.5;
    }
}

_id_9CDA( var_0, var_1 )
{
    var_2 = _func_1EC( var_0, "targetname" );
    var_3 = "";

    switch ( var_1 )
    {
        case "truck":
            var_3 = "vehicle_pickup_4door";
            break;
        case "bmp":
            var_3 = "vehicle_bmp";
            break;
        default:
    }

    var_4 = _func_1F1( var_3, "plane", "truck", var_2._id_02E2, var_2.angles );

    if ( var_1 == "truck" )
        var_4 _id_9852();

    var_4 _meth_8279( var_2 );
    var_4 _meth_827B();
    var_4 _meth_827F( 23, 20 );
    var_4 waittill( "reached_end_node" );
    var_4 delete();
}

_id_9852()
{
    playfxontag( level._id_058F["headlight_truck"], self, "tag_headlight_left" );
    playfxontag( level._id_058F["headlight_truck"], self, "tag_headlight_right" );
}

_id_7E51( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        var_1 = getent( var_0, "targetname" );

    var_2 = _func_0C3( var_1._id_04A4, "targetname" );
    self._id_4254 = var_1;
    self _meth_81A9( var_2 );
    self._id_01C4 = 0;

    if ( isdefined( var_2._id_0351 ) )
        self._id_01C4 = var_2._id_0351;

    self _meth_81AA( var_1._id_02E2 );
    self _meth_81AC( var_1 );
}

_id_A0C0( var_0 )
{
    self endon( "death" );

    while ( !self _meth_80AB( var_0 ) )
        wait 0.05;
}

_id_742E()
{
    self endon( "death" );
    self _meth_81AA( self._id_02E2 );
    self._id_4254 = undefined;
}

_id_6FA6( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = 0.25;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_1 ) )
    {
        self notify( "stop_3dprint" );
        self endon( "stop_3dprint" );
        self endon( "death" );

        for (;;)
        {
            if ( isdefined( self ) )
            {

            }

            wait 0.05;
        }
    }
    else
    {
        for (;;)
            wait 0.05;
    }
}

_id_867F()
{
    self endon( "smoke_has_been_thrown" );
    self._id_8689 = 0;

    while ( self._id_8689 == 0 )
    {
        wait 0.05;
        var_0 = getentarray( "grenade", "classname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( var_0[var_1]._id_029C == "projectile_us_smoke_grenade" )
            {
                if ( var_0[var_1] _meth_80AB( self ) )
                {
                    self._id_8689 = 1;
                    self notify( "smoke_has_been_thrown" );
                }
            }
        }
    }
}

_id_2A05( var_0 )
{
    self endon( "death" );
    _id_A5A4::_id_2A32( var_0 );
}

_id_9755( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( var_1.size == 1 )
        _id_9823( var_0 );
    else
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            var_1[var_2] thread _id_9756( var_1 );

        var_1[0] waittill( "trigger" );
    }
}

_id_9756( var_0 )
{
    self waittill( "trigger" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] notify( "trigger" );
        var_0[var_1] common_scripts\utility::_id_97CC();
    }
}

_id_9823( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 waittill( "trigger" );
    var_1 common_scripts\utility::_id_97CC();
}

_id_981B( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );

    if ( var_2 == 1 )
        common_scripts\utility::_id_0D13( var_3, common_scripts\utility::_id_97CE );
    else
        common_scripts\utility::_id_0D13( var_3, common_scripts\utility::_id_97CC );
}

_id_9810( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 notify( "trigger", level._id_0318 );
    var_1 common_scripts\utility::_id_97CC();
}

_id_06A7()
{

}

_id_5852( var_0 )
{
    var_1 = _func_115( self._id_02E2 - var_0._id_02E2 );
    self _meth_816D( var_1[1] );
}

_id_7ED7( var_0 )
{
    if ( !isdefined( self._id_63B8 ) )
        self._id_63B8 = self._id_04B1;

    self._id_04B1 = var_0;
}

_id_7F05( var_0 )
{
    if ( !isdefined( self._id_63BF ) )
        self._id_63BF = self._id_050F;

    self._id_050F = var_0;
}

_id_7440()
{
    if ( isdefined( self._id_63BF ) )
        self._id_050F = self._id_63BF;

    self._id_63BF = undefined;
}

_id_7E56( var_0 )
{
    self._id_63A5 = self._id_01E6;
    self._id_01E6 = var_0;
}

_id_7430()
{
    if ( isdefined( self._id_63A5 ) )
        self._id_01E6 = self._id_63A5;
}

_id_7DD7( var_0 )
{
    if ( !isdefined( self._id_6395 ) )
        self._id_6395 = self._id_0C72;

    self._id_0C72 = var_0;
}

_id_7422()
{
    if ( isdefined( self._id_6395 ) )
        self._id_0C72 = self._id_6395;

    self._id_6395 = undefined;
}

_id_7E72( var_0 )
{
    if ( !isdefined( self._id_63AD ) )
        self._id_63AD = self._id_0273;

    self._id_0273 = var_0;
}

_id_7432()
{
    if ( isdefined( self._id_63AD ) )
        self._id_0273 = self._id_63AD;

    self._id_63AD = undefined;
}

_id_7ED8( var_0 )
{
    if ( !threatbiasgroupexists( var_0 ) )
    {

    }

    if ( !isdefined( self._id_63B9 ) )
        self._id_63B9 = self._id_9326;

    self._id_9326 = var_0;
    self _meth_817B( var_0 );
}

_id_7439()
{
    if ( isdefined( self._id_63B9 ) )
    {
        self._id_9326 = self._id_63B9;
        self _meth_817B( self._id_63B9 );

        if ( !threatbiasgroupexists( self._id_63B9 ) )
        {

        }
    }
    else
    {
        self._id_9326 = undefined;
        self _meth_817B();
    }

    self._id_63B9 = undefined;
}

_id_7F7F( var_0 )
{
    if ( !isdefined( self._id_63A3 ) )
        self._id_63A3 = self._id_01C4;

    self._id_01C4 = var_0;
}

_id_744C()
{
    if ( isdefined( self._id_63A3 ) )
        self._id_01C4 = self._id_63A3;

    self._id_63A3 = undefined;
}

_id_7F96( var_0 )
{
    if ( !isdefined( self._id_63A9 ) )
        self._id_63A9 = self._id_020C;

    self._id_020C = var_0;
}

_id_744D()
{
    if ( isdefined( self._id_63A9 ) )
        self._id_020C = self._id_63A9;

    self._id_63A9 = undefined;
}

_id_7DAE( var_0 )
{
    if ( !isdefined( self._id_6392 ) )
        self._id_6392 = self._id_1300;

    self._id_1300 = var_0;
}

_id_741F()
{
    if ( isdefined( self._id_6392 ) )
        self._id_1300 = self._id_6392;

    self._id_6392 = undefined;
}

_id_3CF2( var_0 )
{
    var_1 = undefined;

    if ( !isdefined( var_0 ) )
        var_2 = level._id_0318 _meth_8097();
    else
        var_2 = var_0 _meth_8097();

    if ( isdefined( level._id_33E7 ) )
        var_1 = _id_A5A4::_id_3CEF( var_2, "allies", level._id_33E7 );
    else
        var_1 = _id_A5A4::_id_3CEE( var_2, "allies" );

    return var_1;
}

_id_3CF3()
{
    var_0 = _id_A5A4::_id_3CEE( level._id_0318 _meth_8097(), "axis" );
    return var_0;
}

_id_443F( var_0, var_1 )
{
    var_2 = _func_0C4( var_1, "targetname" );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_2[var_3] ) )
            var_0[var_3] _meth_81C9( var_2[var_3]._id_02E2 );
    }
}

_id_3EDE( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = getent( var_1, "targetname" );

    if ( var_0 == "all" )
        var_3 = _func_0D9();
    else
        var_3 = _func_0D9( var_0 );

    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( var_3[var_5] _meth_80AB( var_2 ) )
            var_4[var_4.size] = var_3[var_5];
    }

    return var_4;
}

_id_6251( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
    {
        var_3 = [];
        var_3[0] = level._id_6F7C;
    }

    var_4 = getent( var_0, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_5 = undefined;

    if ( var_1 == "all" )
        var_5 = _func_0D9();
    else
        var_5 = _func_0D9( var_1 );

    if ( isdefined( var_3 ) )
    {
        for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        {
            if ( _id_A5A4::_id_503B( var_5, var_3[var_6] ) )
                var_5 = common_scripts\utility::_id_0CF6( var_5, var_3[var_6] );
        }
    }

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        if ( var_5[var_6] _meth_80AB( var_4 ) )
        {
            var_5[var_6] _id_4FA8( 0 );

            if ( var_2 == 1 )
            {
                var_5[var_6] _meth_8054( ( 0, 0, 0 ) );
                continue;
            }

            var_5[var_6] delete();
        }
    }
}

_id_3F71( var_0, var_1 )
{
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3]._id_0398 ) && var_0[var_3]._id_0398 == var_1 )
            var_2 = var_0[var_3];
    }

    return var_2;
}

_id_3F72( var_0, var_1 )
{
    var_2 = [];

    if ( isdefined( var_1 ) )
    {
        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            if ( isdefined( var_0[var_3]._id_0398 ) && var_0[var_3]._id_0398 == var_1 )
                var_2[var_2.size] = var_0[var_3];
        }
    }
    else
    {

    }

    if ( var_2.size > 0 )
        return var_2;
    else
        return undefined;
}

_id_4284( var_0 )
{
    self endon( "death" );
    var_1 = _func_0C3( var_0, "targetname" );
    _id_7F7F( var_1._id_0351 );
    self _meth_81A9( var_1 );
    self waittill( "goal" );
    _id_744C();
}

_id_4285( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    self endon( "death" );
    var_1 = _func_0C3( var_0, "targetname" );
    self _meth_81A9( var_1 );
    _id_7F7F( var_1._id_0351 );
    self waittill( "goal" );
    self delete();
}

_id_4286( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    self endon( "death" );
    var_1 = _func_0C3( var_0, "targetname" );
    self _meth_81A9( var_1 );
    _id_7F7F( var_1._id_0351 );
    self waittill( "goal" );
    _id_7DD7( "guy" );
    self waittill( "stop_waiting_at_node" );
    _id_744C();
}

_id_39CF( var_0 )
{
    self endon( "death" );
    var_1 = _func_0C3( var_0, "targetname" );
    self _meth_81A7( 1 );
    self _meth_81A9( var_1 );
    self waittill( "goal" );
    self _meth_81A7( 0 );
    _id_744C();
}

_id_7FF4( var_0 )
{
    if ( var_0 == "all" )
        self _meth_81CE( "stand", "crouch", "prone" );
    else
        self _meth_81CE( var_0 );
}

_id_4FA8( var_0 )
{
    if ( var_0 == 0 )
    {
        if ( isdefined( self._id_58D7 ) )
            _id_A5A4::_id_8EA4();
    }
    else if ( !isdefined( self._id_58D7 ) )
        thread _id_A5A4::_id_58D7();

    self.a._id_2B20 = var_0;
}

_id_5365()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    self.allowdeath = 1;
    _id_4FA8( 0 );
    self _meth_8054();
}

_id_428A( var_0 )
{
    self endon( "death" );
    var_1 = getent( var_0, "targetname" );
    var_2 = _func_0C3( var_1._id_04A4, "targetname" );
    self _meth_81A9( var_2 );
    self _meth_81AC( var_1 );
    self._id_01C4 = var_2._id_0351;
}

_id_06B0()
{

}

spawndude( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        var_2 = var_0 _meth_8096();
    else
        var_2 = var_0 _meth_8095();

    _id_A5A4::_id_88F1( var_2 );
    return var_2;
}

_id_06A8()
{

}

_id_2D4C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_1 == 1 )
        self _meth_809C( level._id_78BA["snd_wood_door_kick"] );

    if ( self.classname == "script_brushmodel" )
        var_3 = getent( self._id_04A4, "targetname" );
    else
    {
        var_4 = getent( self._id_04A4, "targetname" );
        var_3 = getent( var_4._id_7A26, "script_linkname" );
    }

    switch ( var_0 )
    {
        case "explosive":
            thread _id_2D45();
            _id_2D44( var_2 );
            self _meth_809C( level._id_78BA["snd_breach_wooden_door"] );
            _func_18C( 0.4, 1, self._id_02E2, 1000 );
            _func_189( self._id_02E2, 56, level._id_5A2E, level._id_5C43 );
            break;
        case "kicked":
            self _meth_82B3( -175, 0.5 );
            _id_2D44( var_2 );
            break;
        case "kicked_down":
            thread _id_2D45();
            _id_2D44( var_2 );
            break;
        default:
            self _meth_82B3( -175, 0.5 );
            _id_2D44();
            break;
    }

    var_5 = var_3._id_79BF;
    common_scripts\_exploder::_id_3528( var_5 );
}

_id_2D44( var_0 )
{
    if ( self.classname == "script_brushmodel" )
        self _meth_805A();
    else
    {
        var_1 = getent( self._id_04A4, "targetname" );
        var_1 _meth_8056();
        var_1 _meth_82BB();
        var_1 _meth_805A();
    }
}

_id_2D45()
{
    var_0 = anglestoforward( self.angles );
    var_1 = ( var_0[0] * 20, var_0[1] * 20, var_0[2] * 20 );
    self _meth_82AA( self._id_02E2 + var_1, 0.5, 0, 0.5 );
    self _meth_82B2( 90, 0.45, 0.4 );
    wait 0.449;
    self _meth_82B2( -4, 0.2, 0, 0.2 );
    wait 0.2;
    self _meth_82B2( 4, 0.15, 0.15 );
}

_id_2682( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 16;
    var_7 = 360 / var_6;
    var_8 = [];

    for ( var_9 = 0; var_9 < var_6; var_9++ )
    {
        var_10 = var_7 * var_9;
        var_11 = _func_0B7( var_10 ) * var_1;
        var_12 = _func_0B6( var_10 ) * var_1;
        var_13 = var_0[0] + var_11;
        var_14 = var_0[1] + var_12;
        var_15 = var_0[2];
        var_8[var_8.size] = ( var_13, var_14, var_15 );
    }

    if ( isdefined( var_4 ) )
        wait(var_4);

    thread _id_2683( var_8, var_2, var_3, var_5, var_0 );
}

_id_2683( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_3 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( var_5 + 1 >= var_0.size )
            var_7 = var_0[0];
        else
            var_7 = var_0[var_5 + 1];

        thread _id_26AB( var_6, var_7, var_1, var_2 );

        if ( var_3 )
            thread _id_26AB( var_4, var_6, var_1, var_2 );
    }
}

_id_26AB( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 1, 1, 1 );

    for ( var_4 = 0; var_4 < var_2 * 20; var_4++ )
        wait 0.05;
}

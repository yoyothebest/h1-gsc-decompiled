// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate_slow", "targetname" ), ::_id_366A, "veryslow" );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate", "targetname" ), ::_id_366A, "slow" );
    common_scripts\utility::_id_0D13( getentarray( "com_wall_fan_blade_rotate_fast", "targetname" ), ::_id_366A, "fast" );
    var_0 = [];
    var_0["trigger_multiple_dyn_metal_detector"] = ::_id_5BBA;
    var_0["trigger_multiple_dyn_creaky_board"] = ::_id_2395;
    var_0["trigger_multiple_dyn_photo_copier"] = ::_id_67EF;
    var_0["trigger_multiple_dyn_copier_no_light"] = ::_id_67F3;
    var_0["trigger_radius_motion_light"] = ::_id_5EF1;
    var_0["trigger_radius_dyn_motion_dlight"] = ::_id_65B7;
    var_0["trigger_multiple_dog_bark"] = ::_id_2C91;
    var_0["trigger_radius_bird_startle"] = ::_id_147F;
    var_0["trigger_multiple_dyn_motion_light"] = ::_id_5EF1;
    var_0["trigger_multiple_dyn_door"] = ::_id_976F;
    _id_6B59();

    foreach ( var_4, var_2 in var_0 )
    {
        var_3 = getentarray( var_4, "classname" );
        common_scripts\utility::_id_0D13( var_3, ::_id_981C );
        common_scripts\utility::_id_0D13( var_3, var_2 );
    }

    common_scripts\utility::_id_0D13( getentarray( "vending_machine", "targetname" ), ::_id_9D84 );
    common_scripts\utility::_id_0D13( getentarray( "toggle", "targetname" ), ::_id_9BEA );
    common_scripts\utility::_id_0D13( getentarray( "sliding_door", "targetname" ), ::_id_8628 );
    level thread _id_64C8();
    var_5 = getent( "civilian_jet_origin", "targetname" );

    if ( isdefined( var_5 ) )
        var_5 thread _id_1DD1();

    thread _id_4EA4();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connecting", var_0 );
        var_0 thread _id_5F5F();
    }
}

_id_6B59()
{
    if ( common_scripts\utility::_id_51AE() )
    {
        foreach ( var_1 in level._id_0323 )
        {
            var_1._id_940F = [];
            var_1 thread _id_5F5F();
        }
    }
}

_id_08ED()
{
    self._id_940F = [];
    thread _id_5F5F();
}

_id_1DD1()
{
    level endon( "game_ended" );
    _id_5237();
    level waittill( "prematch_over" );

    for (;;)
    {
        thread _id_5242();
        self waittill( "start_flyby" );
        thread _id_5235();
        self waittill( "flyby_done" );
        _id_523C();
    }
}

_id_5237()
{
    self._id_523A = getentarray( self._id_04A4, "targetname" );
    self._id_5236 = getent( "civilian_jet_flyto", "targetname" );
    self._id_32D2 = getentarray( "engine_fx", "targetname" );
    self._id_389F = getentarray( "flash_fx", "targetname" );
    self._id_522E = loadfx( "fx/fire/jet_afterburner" );
    self._id_5232 = loadfx( "vfx/lights/aircraft_light_wingtip_red" );
    self._id_5231 = loadfx( "vfx/lights/aircraft_light_wingtip_green" );
    self._id_5230 = loadfx( "vfx/lights/aircraft_light_red_blink" );
    level._id_1E10 = undefined;
    var_0 = _func_114( self._id_02E2 - self._id_5236._id_02E2 ) * 20000;
    self._id_5236._id_02E2 -= var_0;
    self._id_02E2 += var_0;

    foreach ( var_2 in self._id_523A )
    {
        var_2._id_02E2 += var_0;
        var_2._id_63B1 = var_2._id_02E2;
        var_2 _meth_8056();
    }

    foreach ( var_5 in self._id_32D2 )
        var_5._id_02E2 += var_0;

    foreach ( var_8 in self._id_389F )
        var_8._id_02E2 += var_0;

    var_10 = self._id_02E2;
    var_11 = self._id_5236._id_02E2;
    self._id_5234 = var_11 - var_10;
    var_12 = 2000;
    var_13 = _func_0BE( _func_0EE( var_10, var_11 ) );
    self._id_5233 = var_13 / var_12;
}

_id_523C()
{
    foreach ( var_1 in self._id_523A )
    {
        var_1._id_02E2 = var_1._id_63B1;
        var_1 _meth_8056();
    }
}

_id_5242()
{
    level endon( "game_ended" );
    var_0 = _id_412A();
    var_1 = _func_0E1( 10, var_0 );
    var_1 = _func_0BF( var_1, 100 );

    if ( getdvar( "jet_flyby_timer" ) != "" )
        level._id_1E11 = 5 + getdvarint( "jet_flyby_timer" );
    else
        level._id_1E11 = ( 0.25 + _func_0B5( 0.3, 0.7 ) ) * 60 * var_1;

    wait(level._id_1E11);

    while ( isdefined( level._id_099C ) || isdefined( level._id_06D1 ) || isdefined( level._id_1D48 ) || isdefined( level._id_7328 ) )
        wait 0.05;

    self notify( "start_flyby" );
    level._id_1E10 = 1;
    self waittill( "flyby_done" );
    level._id_1E10 = undefined;
}

_id_412A()
{
    if ( common_scripts\utility::_id_51AE() )
        return 10.0;

    if ( isdefined( game["status"] ) && game["status"] == "overtime" )
        return 1.0;
    else
        return _id_415E( "timelimit" );
}

_id_415E( var_0 )
{
    var_0 = "scr_" + level._id_01B3 + "_" + var_0;

    if ( isdefined( level._id_662C ) && isdefined( level._id_662C[var_0] ) )
        return level._id_662C[var_0];

    return level._id_A214[var_0]._id_9C53;
}

_id_5235()
{
    foreach ( var_1 in self._id_523A )
        var_1 _meth_8055();

    var_3 = [];
    var_4 = [];

    foreach ( var_6 in self._id_32D2 )
    {
        var_7 = spawn( "script_model", var_6._id_02E2 );
        var_7 _meth_80B3( "tag_origin" );
        var_7.angles = var_6.angles;
        var_3[var_3.size] = var_7;
    }

    foreach ( var_10 in self._id_389F )
    {
        var_11 = spawn( "script_model", var_10._id_02E2 );
        var_11 _meth_80B3( "tag_origin" );
        var_11.color = var_10._id_0398;
        var_11.angles = var_10.angles;
        var_4[var_4.size] = var_11;
    }

    thread _id_523B( self._id_523A[0], level._id_5986 );
    wait 0.05;

    foreach ( var_7 in var_3 )
        playfxontag( self._id_522E, var_7, "tag_origin" );

    foreach ( var_11 in var_4 )
    {
        if ( isdefined( var_11.color ) && var_11.color == "blink" )
        {
            playfxontag( self._id_5230, var_11, "tag_origin" );
            continue;
        }

        if ( isdefined( var_11.color ) && var_11.color == "red" )
        {
            playfxontag( self._id_5232, var_11, "tag_origin" );
            continue;
        }

        playfxontag( self._id_5231, var_11, "tag_origin" );
    }

    foreach ( var_1 in self._id_523A )
        var_1 _meth_82AA( var_1._id_02E2 + self._id_5234, self._id_5233 );

    foreach ( var_7 in var_3 )
        var_7 _meth_82AA( var_7._id_02E2 + self._id_5234, self._id_5233 );

    foreach ( var_11 in var_4 )
        var_11 _meth_82AA( var_11._id_02E2 + self._id_5234, self._id_5233 );

    wait(self._id_5233 + 1);

    foreach ( var_7 in var_3 )
        var_7 delete();

    foreach ( var_11 in var_4 )
        var_11 delete();

    self notify( "flyby_done" );
}

_id_523B( var_0, var_1 )
{
    var_0 thread _id_6DD9( "veh_mig29_dist_loop" );

    while ( !_id_91D1( var_0, var_1 ) )
        wait 0.05;

    var_0 thread _id_6DD9( "veh_mig29_close_loop" );

    while ( _id_91D2( var_0, var_1 ) )
        wait 0.05;

    wait 0.5;
    var_0 thread _id_6DD8( "veh_mig29_sonic_boom" );

    while ( _id_91D1( var_0, var_1 ) )
        wait 0.05;

    var_0 notify( "stop soundveh_mig29_close_loop" );
    self waittill( "flyby_done" );
    var_0 notify( "stop soundveh_mig29_dist_loop" );
}

_id_6DD8( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", ( 0, 0, 1 ) );
    var_3 _meth_8056();

    if ( !isdefined( var_1 ) )
        var_1 = self._id_02E2;

    var_3._id_02E2 = var_1;

    if ( isdefined( var_2 ) && var_2 )
        var_3 _meth_8076( var_0 );
    else
        var_3 _meth_809C( var_0 );

    wait 10.0;
    var_3 delete();
}

_id_6DD9( var_0, var_1 )
{
    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_2 _meth_8056();
    var_2 endon( "death" );
    thread common_scripts\utility::_id_2825( var_2 );

    if ( isdefined( var_1 ) )
    {
        var_2._id_02E2 = self._id_02E2 + var_1;
        var_2.angles = self.angles;
        var_2 _meth_804F( self );
    }
    else
    {
        var_2._id_02E2 = self._id_02E2;
        var_2.angles = self.angles;
        var_2 _meth_804F( self );
    }

    var_2 _meth_8077( var_0 );
    self waittill( "stop sound" + var_0 );
    var_2 _meth_80AD( var_0 );
    var_2 delete();
}

_id_91D2( var_0, var_1 )
{
    var_2 = anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) );
    var_3 = _func_114( common_scripts\utility::_id_38C9( var_1 ) - var_0._id_02E2 );
    var_4 = _func_0F6( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

_id_91D1( var_0, var_1 )
{
    var_2 = _id_91D2( var_0, var_1 );

    if ( var_2 )
        var_3 = 1;
    else
        var_3 = -1;

    var_4 = common_scripts\utility::_id_38C9( var_0._id_02E2 );
    var_5 = var_4 + anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) ) * ( var_3 * 100000 );
    var_6 = _func_0ED( var_4, var_5, var_1 );
    var_7 = _func_0EE( var_4, var_6 );

    if ( var_7 < 3000 )
        return 1;
    else
        return 0;
}

_id_9D84()
{
    level endon( "game_ended" );
    self endon( "death" );
    self _meth_80DC( "HINT_ACTIVATE" );
    self._id_9EC7 = getent( self._id_04A4, "targetname" );
    var_0 = getent( self._id_9EC7._id_04A4, "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_2 = getent( var_1._id_04A4, "targetname" );
    self._id_9EC4 = var_2._id_02E2;
    var_3 = getent( var_2._id_04A4, "targetname" );
    self._id_9EC5 = var_3._id_02E2;

    if ( isdefined( var_3._id_04A4 ) )
        self._id_9EBE = getent( var_3._id_04A4, "targetname" )._id_02E2;

    self._id_9EC7 _meth_82BC( 1 );
    self._id_9EC8 = self._id_9EC7._id_029C;
    self._id_9EBB = self._id_9EC7._id_0398;
    self._id_9ECE = var_0._id_029C;
    self._id_9ED0 = var_0._id_02E2;
    self._id_9ECF = var_0.angles;
    self._id_9ED2 = var_1._id_02E2;
    self._id_9ED1 = var_1.angles;
    precachemodel( self._id_9EBB );
    var_0 delete();
    var_1 delete();
    var_2 delete();
    var_3 delete();
    self._id_8859 = [];
    self._id_885C = 12;
    self._id_885D = undefined;
    self._id_4AA4 = 400;
    thread _id_9D85( self._id_9EC7 );
    self _meth_8077( "vending_machine_hum" );

    for (;;)
    {
        self waittill( "trigger", var_4 );
        self _meth_809C( "vending_machine_button_press" );

        if ( !self._id_885C )
            continue;

        if ( isdefined( self._id_885D ) )
            _id_885B();

        _id_885A( _id_8954() );
        wait 0.05;
    }
}

_id_9D85( var_0 )
{
    level endon( "game_ended" );
    var_1 = "mod_grenade mod_projectile mod_explosive mod_grenade_splash mod_projectile_splash splash";
    var_2 = loadfx( "fx/explosions/tv_explosion" );

    for (;;)
    {
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = undefined;
        var_0 waittill( "damage", var_3, var_4, var_5, var_6, var_7 );

        if ( isdefined( var_7 ) )
        {
            if ( _func_120( var_1, _func_123( var_7 ) ) )
                var_3 *= 3;

            self._id_4AA4 -= var_3;

            if ( self._id_4AA4 > 0 )
                continue;

            self notify( "death" );
            self._id_02E2 += ( 0, 0, 10000 );

            if ( !isdefined( self._id_9EBE ) )
                var_8 = self._id_9EC7._id_02E2 + ( 37, -31, 52 );
            else
                var_8 = self._id_9EBE;

            playfx( var_2, var_8 );
            self._id_9EC7 _meth_80B3( self._id_9EBB );

            while ( self._id_885C > 0 )
            {
                if ( isdefined( self._id_885D ) )
                    _id_885B();

                _id_885A( _id_8954() );
                wait 0.05;
            }

            self _meth_80AD( "vending_machine_hum" );
            return;
        }
    }
}

_id_8954()
{
    var_0 = spawn( "script_model", self._id_9ED0 );
    var_0 _meth_80B3( self._id_9ECE );
    var_0._id_02E2 = self._id_9ED0;
    var_0.angles = self._id_9ECF;
    return var_0;
}

_id_885A( var_0 )
{
    var_0 _meth_82AA( self._id_9ED2, 0.2 );
    var_0 _meth_809C( "vending_machine_soda_drop" );
    wait 0.2;
    self._id_885D = var_0;
    self._id_885C--;
}

_id_885B()
{
    self endon( "death" );

    if ( isdefined( self._id_885D._id_3022 ) && self._id_885D._id_3022 == 1 )
        return;

    var_0 = 1;
    var_1 = var_0 * -999;
    var_2 = _func_0BC( 40000 );
    var_3 = ( _func_0BC( var_2 / 2 ), _func_0BC( var_2 / 2 ), 0 ) - ( _func_0B2( var_2 ), _func_0B2( var_2 ), 0 );
    var_4 = _func_114( self._id_9EC5 - self._id_9EC4 + var_3 );
    var_5 = var_4 * _func_0B5( var_1, var_0 );
    self._id_885D _meth_82BE( self._id_9EC4, var_5 );
    self._id_885D._id_3022 = 1;
}

_id_3A27()
{
    level endon( "game_ended" );
    var_0 = "briefcase_bomb_mp";
    precacheitem( var_0 );

    for (;;)
    {
        self waittill( "trigger_enter", var_1 );

        if ( !var_1 _meth_8311( var_0 ) )
        {
            var_1 _meth_809C( "freefall_death" );
            var_1 _meth_830B( var_0 );
            var_1 _meth_82F4( var_0, 0 );
            var_1 _meth_82F3( var_0, 0 );
            var_1 _meth_8312( var_0 );
        }
    }
}

_id_5BBA()
{
    level endon( "game_ended" );
    var_0 = getent( self._id_04A4, "targetname" );
    var_0 _meth_81B7();
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_2 = getent( var_1._id_04A4, "targetname" );
    var_3 = getent( var_2._id_04A4, "targetname" );
    var_4 = getent( var_3._id_04A4, "targetname" );
    var_5 = [];
    var_6 = _func_0BF( var_1._id_02E2[0], var_2._id_02E2[0] );
    var_5[0] = var_6;
    var_7 = _func_0E1( var_1._id_02E2[0], var_2._id_02E2[0] );
    var_5[1] = var_7;
    var_8 = _func_0BF( var_1._id_02E2[1], var_2._id_02E2[1] );
    var_5[2] = var_8;
    var_9 = _func_0E1( var_1._id_02E2[1], var_2._id_02E2[1] );
    var_5[3] = var_9;
    var_10 = _func_0BF( var_1._id_02E2[2], var_2._id_02E2[2] );
    var_5[4] = var_10;
    var_11 = _func_0E1( var_1._id_02E2[2], var_2._id_02E2[2] );
    var_5[5] = var_11;
    var_1 delete();
    var_2 delete();

    if ( !common_scripts\utility::_id_51AE() )
        self._id_09B3 = 7;
    else
        self._id_09B3 = 2;

    self._id_09B7 = 0;
    self._id_09AF = 0;
    self._id_93E0 = 0;
    thread _id_5BBB( var_0 );
    thread _id_5BBC();
    thread _id_5BBD( var_5, "weapon_claymore", "weapon_c4" );
    var_12 = ( var_3._id_02E2[0], var_3._id_02E2[1], var_11 );
    var_13 = ( var_4._id_02E2[0], var_4._id_02E2[1], var_11 );
    var_14 = loadfx( "fx/props/metal_detector_light" );

    for (;;)
    {
        common_scripts\utility::_id_A069( "dmg_triggered", "touch_triggered", "weapon_triggered" );
        thread _id_6DD7( "alarm_metal_detector", var_14, var_12, var_13 );
    }
}

_id_6DD7( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );

    if ( !self._id_09B7 )
    {
        self._id_09B7 = 1;
        thread _id_0C92();

        if ( !self._id_09AF )
            self _meth_809C( var_0 );

        playfx( var_1, var_2 );
        playfx( var_1, var_3 );
        wait(self._id_09B3);
        self._id_09B7 = 0;
    }
}

_id_0C92()
{
    level endon( "game_ended" );

    if ( !self._id_93E0 )
        return;

    var_0 = self._id_09B3 + 0.15;

    if ( self._id_93E0 )
        self._id_93E0--;
    else
        self._id_09AF = 1;

    var_1 = gettime();
    var_2 = 7;

    if ( common_scripts\utility::_id_51AE() )
        var_2 = 2;

    _id_A06F( "dmg_triggered", "touch_triggered", "weapon_triggered", var_2 + 2 );
    var_3 = gettime() - var_1;

    if ( var_3 > var_2 * 1000 + 1150 )
    {
        self._id_09AF = 0;
        self._id_93E0 = 0;
    }
}

_id_A06F( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    self endon( var_0 );
    self endon( var_1 );
    self endon( var_2 );
    wait(var_3);
}

_id_5BBD( var_0, var_1, var_2 )
{
    level endon( "game_ended" );

    for (;;)
    {
        _id_A0CA();
        var_3 = getentarray( "grenade", "classname" );

        foreach ( var_5 in var_3 )
        {
            if ( isdefined( var_5._id_029C ) && ( var_5._id_029C == var_1 || var_5._id_029C == var_2 ) )
            {
                if ( _id_5121( var_5, var_0 ) )
                    thread _id_A2C8( var_5, var_0 );
            }
        }
    }
}

_id_A0CA()
{
    level endon( "game_ended" );
    self endon( "dmg_triggered" );
    self waittill( "touch_triggered" );
}

_id_A2C8( var_0, var_1 )
{
    var_0 endon( "death" );

    while ( _id_5121( var_0, var_1 ) )
    {
        self notify( "weapon_triggered" );
        wait(self._id_09B3);
    }
}

_id_5121( var_0, var_1 )
{
    var_2 = var_1[0];
    var_3 = var_1[1];
    var_4 = var_1[2];
    var_5 = var_1[3];
    var_6 = var_1[4];
    var_7 = var_1[5];
    var_8 = var_0._id_02E2[0];
    var_9 = var_0._id_02E2[1];
    var_10 = var_0._id_02E2[2];

    if ( _id_5122( var_8, var_2, var_3 ) )
    {
        if ( _id_5122( var_9, var_4, var_5 ) )
        {
            if ( _id_5122( var_10, var_6, var_7 ) )
                return 1;
        }
    }

    return 0;
}

_id_5122( var_0, var_1, var_2 )
{
    if ( var_0 > var_1 && var_0 < var_2 )
        return 1;

    return 0;
}

_id_5BBB( var_0 )
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( isdefined( var_5 ) && _id_09BD( var_5 ) )
            self notify( "dmg_triggered" );
    }
}

_id_5BBC()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger_enter" );

        while ( _id_0C9B( self ) )
        {
            self notify( "touch_triggered" );
            wait(self._id_09B3);
        }
    }
}

_id_09BD( var_0 )
{
    var_1 = "mod_melee melee mod_grenade mod_projectile mod_explosive mod_impact";
    var_2 = _func_124( var_1, " " );

    foreach ( var_4 in var_2 )
    {
        if ( _func_123( var_4 ) == _func_123( var_0 ) )
            return 1;
    }

    return 0;
}

_id_2395()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger_enter", var_0 );
        var_0 thread _id_2BBA( self );
    }
}

_id_2BBA( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self _meth_809C( "step_walk_plr_woodcreak_on" );

    for (;;)
    {
        self waittill( "trigger_leave", var_1 );

        if ( var_0 != var_1 )
            continue;

        self _meth_809C( "step_walk_plr_woodcreak_off" );
        return;
    }
}

_id_5EF1()
{
    level endon( "game_ended" );
    self._id_5F95 = 1;
    self._id_575E = 0;
    var_0 = getentarray( self._id_04A4, "targetname" );
    common_scripts\utility::_id_6166( [ "com_two_light_fixture_off", "com_two_light_fixture_on" ], ::precachemodel );

    foreach ( var_2 in var_0 )
    {
        var_2._id_5743 = [];
        var_3 = getent( var_2._id_04A4, "targetname" );

        if ( !isdefined( var_3._id_04A4 ) )
            continue;

        var_2._id_5743 = getentarray( var_3._id_04A4, "targetname" );
    }

    for (;;)
    {
        self waittill( "trigger_enter" );

        while ( _id_0C9B( self ) )
        {
            var_5 = 0;

            foreach ( var_7 in self._id_940D )
            {
                if ( isdefined( var_7._id_2B7F ) && var_7._id_2B7F > 5.0 )
                    var_5 = 1;
            }

            if ( var_5 )
            {
                if ( !self._id_575E )
                {
                    self._id_575E = 1;
                    var_0[0] _meth_809C( "switch_auto_lights_on" );

                    foreach ( var_2 in var_0 )
                    {
                        var_2 _meth_81E2( 1.0 );

                        if ( isdefined( var_2._id_5743 ) )
                        {
                            foreach ( var_11 in var_2._id_5743 )
                                var_11 _meth_80B3( "com_two_light_fixture_on" );
                        }
                    }
                }

                thread _id_5EF2( var_0, 10.0 );
            }

            wait 0.05;
        }
    }
}

_id_5EF2( var_0, var_1 )
{
    self notify( "motion_light_timeout" );
    self endon( "motion_light_timeout" );
    wait(var_1);

    foreach ( var_3 in var_0 )
    {
        var_3 _meth_81E2( 0 );

        if ( isdefined( var_3._id_5743 ) )
        {
            foreach ( var_5 in var_3._id_5743 )
                var_5 _meth_80B3( "com_two_light_fixture_off" );
        }
    }

    var_0[0] _meth_809C( "switch_auto_lights_off" );
    self._id_575E = 0;
}

_id_65B7()
{
    if ( !isdefined( level._id_65B9 ) )
        level._id_65B9 = loadfx( "vfx/lights/outdoor_motion_light" );

    level endon( "game_ended" );
    self._id_5F95 = 1;
    self._id_575E = 0;
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    common_scripts\utility::_id_6166( [ "com_two_light_fixture_off", "com_two_light_fixture_on" ], ::precachemodel );

    for (;;)
    {
        self waittill( "trigger_enter" );

        while ( _id_0C9B( self ) )
        {
            var_2 = 0;

            foreach ( var_4 in self._id_940D )
            {
                if ( isdefined( var_4._id_2B7F ) && var_4._id_2B7F > 5.0 )
                    var_2 = 1;
            }

            if ( var_2 )
            {
                if ( !self._id_575E )
                {
                    self._id_575E = 1;
                    var_0 _meth_809C( "switch_auto_lights_on" );
                    var_0 _meth_80B3( "com_two_light_fixture_on" );

                    foreach ( var_7 in var_1 )
                    {
                        var_7._id_5716 = spawn( "script_model", var_7._id_02E2 );
                        var_7._id_5716 _meth_80B3( "tag_origin" );
                        playfxontag( level._id_65B9, var_7._id_5716, "tag_origin" );
                    }
                }

                thread _id_65B8( var_0, var_1, 10.0 );
            }

            wait 0.05;
        }
    }
}

_id_65B8( var_0, var_1, var_2 )
{
    self notify( "motion_light_timeout" );
    self endon( "motion_light_timeout" );
    wait(var_2);

    foreach ( var_4 in var_1 )
        var_4._id_5716 delete();

    var_0 _meth_809C( "switch_auto_lights_off" );
    var_0 _meth_80B3( "com_two_light_fixture_off" );
    self._id_575E = 0;
}

_id_2C91()
{
    level endon( "game_ended" );
    self._id_5F95 = 1;
    var_0 = getent( self._id_04A4, "targetname" );

    for (;;)
    {
        self waittill( "trigger_enter", var_1 );

        while ( _id_0C9B( self ) )
        {
            var_2 = 0;

            foreach ( var_4 in self._id_940D )
            {
                if ( isdefined( var_4._id_2B7F ) && var_4._id_2B7F > var_2 )
                    var_2 = var_4._id_2B7F;
            }

            if ( var_2 > 6.0 )
            {
                var_0 _meth_809C( "dyn_anml_dog_bark" );
                wait(_func_0B5( 16 / var_2, 16 / var_2 + _func_0B3( 1.0 ) ));
                continue;
            }

            wait 0.05;
        }
    }
}

_id_976F()
{
    var_0 = getent( self._id_04A4, "targetname" );
    self._id_2D5E = var_0;
    self._id_2D5C = _id_4152( _func_114( self _meth_8097() - var_0 _meth_8097() ) );
    var_0._id_131A = var_0.angles[1];
    var_1 = 1.0;

    for (;;)
    {
        self waittill( "trigger_enter", var_2 );
        var_0 thread _id_2D68( var_1, _id_3F6C( var_2 ) );

        if ( _id_0C9B( self ) )
            self waittill( "trigger_empty" );

        wait 3.0;

        if ( _id_0C9B( self ) )
            self waittill( "trigger_empty" );

        var_0 thread _id_2D5D( var_1 );
    }
}

_id_2D68( var_0, var_1 )
{
    if ( var_1 )
        self _meth_82B1( ( 0, self._id_131A + 90, 1 ), var_0, 0.1, 0.75 );
    else
        self _meth_82B1( ( 0, self._id_131A - 90, 1 ), var_0, 0.1, 0.75 );

    self _meth_809C( "door_generic_house_open" );
    wait(var_0 + 0.05);
}

_id_2D5D( var_0 )
{
    self _meth_82B1( ( 0, self._id_131A, 1 ), var_0 );
    self _meth_809C( "door_generic_house_close" );
    wait(var_0 + 0.05);
}

_id_3F6C( var_0 )
{
    return _func_0F6( self._id_2D5C, _func_114( var_0._id_02E2 - self._id_2D5E _meth_8097() ) ) > 0;
}

_id_4152( var_0 )
{
    return ( var_0[1], 0 - var_0[0], var_0[2] );
}

_id_9BEA()
{
    if ( self.classname != "trigger_use_touch" )
        return;

    var_0 = getentarray( self._id_04A4, "targetname" );
    self._id_575E = 1;

    foreach ( var_2 in var_0 )
        var_2 _meth_81E2( 1.5 * self._id_575E );

    for (;;)
    {
        self waittill( "trigger" );
        self._id_575E = !self._id_575E;

        if ( self._id_575E )
        {
            foreach ( var_2 in var_0 )
                var_2 _meth_81E2( 1.5 );

            self _meth_809C( "switch_auto_lights_on" );
            continue;
        }

        foreach ( var_2 in var_0 )
            var_2 _meth_81E2( 0 );

        self _meth_809C( "switch_auto_lights_off" );
    }
}

_id_147F()
{

}

_id_67F1( var_0 )
{
    self._id_21CE = _id_3E1D( var_0 );

    if ( isdefined( self._id_21CE ) )
    {
        var_1 = getent( self._id_21CE._id_04A4, "targetname" );

        if ( isdefined( var_1 ) )
        {
            var_2 = getent( var_1._id_04A4, "targetname" );

            if ( isdefined( var_2 ) )
            {
                var_2._id_4E9E = var_2 _meth_81E1();
                var_2 _meth_81E2( 0 );
                var_0._id_21D4 = var_1;
                var_0._id_8C41 = var_1._id_02E2;
                var_0._id_0251 = var_2;
                var_3 = self._id_21CE.angles + ( 0, 90, 0 );
                var_4 = anglestoforward( var_3 );
                var_0._id_313E = var_0._id_8C41 + var_4 * 30;
            }
        }
    }
}

_id_3E1D( var_0 )
{
    if ( !isdefined( var_0._id_04A4 ) )
    {
        var_1 = getentarray( "destructible_toy", "targetname" );
        var_2 = var_1[0];

        foreach ( var_4 in var_1 )
        {
            if ( isdefined( var_4._id_0117 ) && var_4._id_0117 == "toy_copier" )
            {
                if ( _func_0EE( var_0._id_02E2, var_2._id_02E2 ) > _func_0EE( var_0._id_02E2, var_4._id_02E2 ) )
                    var_2 = var_4;
            }
        }
    }
    else
    {
        var_2 = getent( var_0._id_04A4, "targetname" );

        if ( isdefined( var_2 ) )
            var_2 _meth_82BC( 1 );
    }

    return var_2;
}

_id_A07A()
{
    if ( !isdefined( self._id_21CE ) )
        return;

    self._id_21CE endon( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    self waittill( "trigger_enter" );
}

_id_67EF()
{
    level endon( "game_ended" );
    _id_67F1( self );

    if ( !isdefined( self._id_21CE ) )
        return;

    self._id_21CE endon( "FX_State_Change0" );
    thread _id_67F4();

    for (;;)
    {
        _id_A07A();
        self _meth_809C( "mach_copier_run" );

        if ( isdefined( self._id_21D4 ) )
        {
            _id_7427( self );
            thread _id_67F0();
            thread _id_67F2();
        }

        wait 3;
    }
}

_id_67F3()
{
    level endon( "game_ended" );
    self endon( "death" );

    if ( common_scripts\utility::_id_3E94() == "hamburg" )
        return;

    self._id_21CE = _id_3E1D( self );

    if ( !isdefined( self._id_21CE ) )
        return;

    self._id_21CE endon( "FX_State_Change0" );

    for (;;)
    {
        _id_A07A();
        self _meth_809C( "mach_copier_run" );
        wait 3;
    }
}

_id_7427( var_0 )
{
    var_0._id_21D4 _meth_82AA( var_0._id_8C41, 0.2 );
    var_0._id_0251 _meth_81E2( 0 );
}

_id_67F0()
{
    self._id_21CE notify( "bar_goes" );
    self._id_21CE endon( "bar_goes" );
    self._id_21CE endon( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    var_0 = self._id_21D4;
    wait 2.0;
    var_0 _meth_82AA( self._id_313E, 1.6 );
    wait 1.8;
    var_0 _meth_82AA( self._id_8C41, 1.6 );
    wait 1.6;
    var_1 = self._id_0251;
    var_2 = 0.2;
    var_3 = var_2 / 0.05;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = var_4 * 0.05;
        var_5 /= var_2;
        var_5 = 1 - var_5 * var_1._id_4E9E;

        if ( var_5 > 0 )
            var_1 _meth_81E2( var_5 );

        wait 0.05;
    }
}

_id_67F2()
{
    self._id_21CE notify( "light_on" );
    self._id_21CE endon( "light_on" );
    self._id_21CE endon( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    var_0 = self._id_0251;
    var_1 = 0.2;
    var_2 = var_1 / 0.05;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_3 * 0.05;
        var_4 /= var_1;
        var_0 _meth_81E2( var_4 * var_0._id_4E9E );
        wait 0.05;
    }

    _id_67F5( var_0 );
}

_id_67F4()
{
    self._id_21CE waittill( "FX_State_Change0" );
    self._id_21CE endon( "death" );
    _id_7427( self );
}

_id_67F5( var_0 )
{
    var_0 _meth_81E2( 1 );
    wait 0.05;
    var_0 _meth_81E2( 0 );
    wait 0.1;
    var_0 _meth_81E2( 1 );
    wait 0.05;
    var_0 _meth_81E2( 0 );
    wait 0.1;
    var_0 _meth_81E2( 1 );
}

_id_366A( var_0 )
{
    var_1 = 0;
    var_2 = 20000;
    var_3 = 1.0;

    if ( isdefined( self._id_03E2 ) )
        var_3 = self._id_03E2;

    if ( var_0 == "slow" )
    {
        if ( isdefined( self._id_0398 ) && self._id_0398 == "lockedspeed" )
            var_1 = 180;
        else
            var_1 = _func_0B5( 100 * var_3, 360 * var_3 );
    }
    else if ( var_0 == "fast" )
        var_1 = _func_0B5( 720 * var_3, 1000 * var_3 );
    else if ( var_0 == "veryslow" )
        var_1 = _func_0B5( 1 * var_3, 2 * var_3 );
    else
    {

    }

    if ( isdefined( self._id_0398 ) && self._id_0398 == "lockedspeed" )
        wait 0;
    else
        wait(_func_0B5( 0, 1 ));

    if ( !isdefined( self ) )
        return;

    var_4 = self.angles;
    var_5 = anglestoright( self.angles ) * 100;
    var_5 = _func_114( var_5 );

    for (;;)
    {
        var_6 = _func_0BE( _func_0F6( var_5, ( 1, 0, 0 ) ) );
        var_7 = _func_0BE( _func_0F6( var_5, ( 0, 1, 0 ) ) );
        var_8 = _func_0BE( _func_0F6( var_5, ( 0, 0, 1 ) ) );

        if ( var_6 > 0.9 )
            self _meth_82B9( ( var_1, 0, 0 ), var_2 );
        else if ( var_7 > 0.9 )
            self _meth_82B9( ( var_1, 0, 0 ), var_2 );
        else if ( var_8 > 0.9 )
            self _meth_82B9( ( 0, var_1, 0 ), var_2 );
        else
            self _meth_82B9( ( 0, var_1, 0 ), var_2 );

        wait(var_2);
    }
}

_id_981C( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "deleted" );
    self._id_331C = self _meth_81B5();

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( !_func_1AD( var_2 ) && !isdefined( var_2._id_3797 ) )
            continue;

        if ( !_func_1A1( var_2 ) )
            continue;

        if ( !isdefined( var_2._id_940F[self._id_331C] ) )
            var_2 thread _id_6D71( self, var_0, var_1 );
    }
}

_id_6D71( var_0, var_1, var_2 )
{
    var_0 endon( "deleted" );

    if ( !_func_1AD( self ) )
        self endon( "death" );

    if ( !common_scripts\utility::_id_51AE() )
        var_3 = self._id_4450;
    else
        var_3 = "player" + gettime();

    var_0._id_940D[var_3] = self;

    if ( isdefined( var_0._id_5F95 ) )
        self._id_5F96++;

    var_0 notify( "trigger_enter", self );
    self notify( "trigger_enter", var_0 );

    if ( isdefined( var_1 ) )
        self thread [[ var_1 ]]( var_0 );

    self._id_940F[var_0._id_331C] = var_0;

    while ( _func_1A1( self ) && self _meth_80AB( var_0 ) && ( common_scripts\utility::_id_51AE() || !level._id_3BDA ) )
        wait 0.05;

    if ( isdefined( self ) )
    {
        self._id_940F[var_0._id_331C] = undefined;

        if ( isdefined( var_0._id_5F95 ) )
            self._id_5F96--;

        self notify( "trigger_leave", var_0 );

        if ( isdefined( var_2 ) )
            self thread [[ var_2 ]]( var_0 );
    }

    if ( !common_scripts\utility::_id_51AE() && level._id_3BDA )
        return;

    var_0._id_940D[var_3] = undefined;
    var_0 notify( "trigger_leave", self );

    if ( !_id_0C9B( var_0 ) )
        var_0 notify( "trigger_empty" );
}

_id_5F5F()
{
    if ( isdefined( level._id_2B1D ) )
        return;

    self endon( "disconnect" );

    if ( !_func_1AD( self ) )
        self endon( "death" );

    self._id_5F96 = 0;
    self._id_2B7F = 0;

    for (;;)
    {
        self waittill( "trigger_enter" );
        var_0 = self._id_02E2;

        while ( self._id_5F96 )
        {
            self._id_2B7F = _func_0EE( var_0, self._id_02E2 );
            var_0 = self._id_02E2;
            wait 0.05;
        }

        self._id_2B7F = 0;
    }
}

_id_0C9B( var_0 )
{
    return var_0._id_940D.size;
}

_id_6D70( var_0, var_1 )
{
    return isdefined( var_0._id_940F[var_1._id_331C] );
}

_id_4EA4()
{
    var_0 = getentarray( "interactive_tv", "targetname" );

    if ( var_0.size )
    {
        common_scripts\utility::_id_6166( [ "com_tv2_d", "com_tv1_d", "com_tv1", "com_tv2", "com_tv1_testpattern", "com_tv2_testpattern" ], ::precachemodel );
        level._id_17DD["tv_explode"] = loadfx( "fx/explosions/tv_explosion" );
    }

    level._id_99D2 = getentarray( "interactive_tv_light", "targetname" );
    common_scripts\utility::_id_0D13( getentarray( "interactive_tv", "targetname" ), ::_id_99D3 );
}

_id_99D3()
{
    self _meth_82BC( 1 );
    self._id_25A7 = undefined;
    self._id_6378 = undefined;

    if ( _func_120( self._id_029C, "cinematic" ) )
    {
        self._id_6378 = "com_tv1_cinematic";
        self._id_25A7 = "com_tv1_cinematic_d";
    }
    else if ( _func_120( self._id_029C, "1" ) )
    {
        self._id_6378 = "com_tv1";
        self._id_64BC = "com_tv1_testpattern";
        self._id_25A7 = "com_tv1_d";
    }
    else if ( _func_120( self._id_029C, "2" ) )
    {
        self._id_25A7 = "com_tv2_d";
        self._id_6378 = "com_tv2";
        self._id_64BC = "com_tv2_testpattern";
    }

    if ( isdefined( self._id_04A4 ) )
    {
        if ( isdefined( level._id_2AAF ) )
        {
            var_0 = getent( self._id_04A4, "targetname" );

            if ( isdefined( var_0 ) )
                var_0 delete();
        }
        else
        {
            self._id_9C1A = getent( self._id_04A4, "targetname" );
            self._id_9C1A _meth_817F();
            self._id_9C1A _meth_80DC( "HINT_NOICON" );
        }
    }

    var_1 = common_scripts\utility::_id_3CCB( self._id_02E2, level._id_99D2, undefined, undefined, 64 );

    if ( var_1.size )
    {
        self._id_57A7 = var_1[0];
        level._id_99D2 = common_scripts\utility::_id_0CF6( level._id_99D2, self._id_57A7 );
        self._id_57A9 = self._id_57A7 _meth_81E1();
    }

    thread _id_99CF();

    if ( isdefined( self._id_9C1A ) )
        thread _id_99D6();
}

_id_99D6()
{
    self._id_9C1A endon( "death" );

    for (;;)
    {
        wait 0.2;
        self._id_9C1A waittill( "trigger" );
        self notify( "off" );

        if ( self._id_029C == self._id_6378 )
        {
            self _meth_80B3( self._id_64BC );

            if ( isdefined( self._id_57A7 ) )
                self._id_57A7 _meth_81E2( self._id_57A9 );

            continue;
        }

        self _meth_80B3( self._id_6378 );

        if ( isdefined( self._id_57A7 ) )
            self._id_57A7 _meth_81E2( 0 );
    }
}

_id_99CF()
{
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    self notify( "off" );

    if ( isdefined( self._id_9C1A ) )
        self._id_9C1A notify( "death" );

    self _meth_80B3( self._id_25A7 );

    if ( isdefined( self._id_57A7 ) )
        self._id_57A7 _meth_81E2( 0 );

    playfxontag( level._id_17DD["tv_explode"], self, "tag_fx" );
    self _meth_809C( "tv_shot_burst" );

    if ( isdefined( self._id_9C1A ) )
        self._id_9C1A delete();
}

_id_8628()
{
    if ( !isdefined( self._id_651C ) )
        self._id_651C = 1;

    var_0 = getentarray( self._id_04A4, "script_linkname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3.classname == "script_origin" )
        {
            var_1[var_1.size] = var_3;
            continue;
        }

        var_3 _id_2D46( self._id_651C );
    }

    var_0 = common_scripts\utility::_id_0CF7( var_0, var_1 );

    for (;;)
    {
        if ( !isdefined( level._id_1C8E ) )
        {
            wait 1;
            continue;
        }

        var_5 = _func_1F2();
        var_6 = common_scripts\utility::_id_0CDD( level._id_1C8E, var_5 );
        var_7 = 0;

        foreach ( var_9 in var_6 )
        {
            if ( var_9 _meth_80AB( self ) )
            {
                var_7++;
                break;
            }
        }

        if ( var_7 > 0 )
            _id_6504( var_0 );
        else
        {
            var_11 = 1;
            thread _id_1FCD( var_0, var_11 );
        }

        wait 0.05;
    }
}

_id_2D46( var_0 )
{
    self._id_8C42 = self._id_02E2;
    self._id_8629 = "closed";
    var_1 = getent( self._id_04A4, "targetname" );
    self._id_6517 = var_1._id_02E2;
    self._id_651E = _func_0EE( self._id_6517, self._id_02E2 ) / var_0;
}

_id_6504( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( var_2._id_8629 == "open" || var_2._id_8629 == "opening" )
            continue;

        var_2 thread _id_6509();
    }
}

_id_6509()
{
    self._id_8629 = "opening";
    var_0 = _func_0EE( self._id_02E2, self._id_6517 ) / self._id_651E;

    if ( var_0 < 0.05 )
        var_0 = 0.05;

    self _meth_82AA( self._id_6517, var_0 );
    self _meth_809C( "glass_door_open" );
    wait(var_0);
    self._id_8629 = "open";
}

_id_1FCD( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_8629 == "closed" || var_3._id_8629 == "opening" )
            continue;

        var_3 _meth_82AA( var_3._id_8C42, var_1 );
        self _meth_809C( "glass_door_close" );
        var_3._id_8629 = "closed";
    }
}

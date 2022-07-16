// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0CD0( var_0, var_1 )
{
    return _func_120( var_0, "armed" ) || _func_120( var_1, "armed" );
}
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    if ( _id_0CD0( var_0, var_2 ) )
        _id_A609::_id_6EFB();

    if ( _func_120( var_2, "bench" ) )
    {
        precachemodel( "vehicle_sentinel_littlebird_benchleft" );
        precachemodel( "vehicle_sentinel_littlebird_benchright" );
    }

    _id_A5A8::_id_186C( "littlebird", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_little_bird_armed" );
    _id_A5A8::_id_1845( "vehicle_little_bird_bench" );

    if ( _func_120( var_2, "kva" ) || _func_120( var_2, "atlas" ) || _func_120( var_2, "sentinel" ) )
        _id_A5A8::_id_1849( %mil_helicopter_littlebird_ai_rotors, undefined, 0, 3.0 );
    else
        _id_A5A8::_id_1849( %mi28_rotors, undefined, 0, 3.0 );

    _id_A5A8::_id_1842( "fx/explosions/helicopter_explosion_secondary_small", "tag_engine", "littlebird_helicopter_secondary_exp", undefined, undefined, undefined, 0.0, 1 );
    _id_A5A8::_id_1842( "vfx/trail/trail_fire_smoke_l", "tag_engine", "littlebird_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1 );
    _id_A5A8::_id_1842( "fx/explosions/helicopter_explosion_secondary_small", "tag_engine", undefined, undefined, undefined, undefined, 2.5, 1 );
    _id_A5A8::_id_1842( "vfx/explosion/vehicle_littlebird_explosion_a", undefined, "littlebird_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    _id_A5A8::_id_1864( "vfx/explosion/vehicle_littlebird_explosion_a", "tag_deathfx", "littlebird_helicopter_crash", undefined, undefined, undefined, undefined, 1, undefined, 0 );
    _id_A5A8::_id_1846( 0.8, 1.6, 2048 );
    _id_A5A8::_id_186E( var_2, "default", "vfx/treadfx/heli_dust_default" );
    _id_A5A8::_id_1856( 799 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_185A();
    _id_A5A8::_id_1873( ::_id_9A3D );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    var_3 = _func_0B5( 0, 1 );
    _id_A5A8::_id_1857( var_2, "white_blink", "TAG_LIGHT_BELLY", "vfx/lights/aircraft_light_white_blink", "running", var_3 );
    _id_A5A8::_id_1857( var_2, "red_blink1", "TAG_LIGHT_TAIL1", "vfx/lights/aircraft_light_red_blink", "running", var_3 );
    _id_A5A8::_id_1857( var_2, "red_blink2", "TAG_LIGHT_TAIL2", "vfx/lights/aircraft_light_red_blink", "running", var_3 );
    _id_A5A8::_id_1857( var_2, "headlight_nose", "tag_light_nose", "vfx/lights/headlight_gaz", "headlights", 0.0 );
    var_4 = "littlebird_gunpod";
    _id_A5A8::_id_1872( var_4, "TAG_MINIGUN_ATTACH_LEFT", "vehicle_mil_helicopter_littlebird_gunpodleft" );
    _id_A5A8::_id_1872( var_4, "TAG_MINIGUN_ATTACH_RIGHT", "vehicle_mil_helicopter_littlebird_gunpodright" );
    _id_A5A8::_id_1855();
    _id_A62D::_id_4D0D();
}

_id_4D10()
{
    self endon( "death" );
    self._id_65A7 = _func_0EE( self _meth_8184( "tag_origin" ), self _meth_8184( "tag_ground" ) );
    self._id_7957 = 0;
    self._id_2D30 = 1;
    self._id_9D08 = 6;
    thread _id_A62D::_id_57B1();
    thread _id_0DE7();
    thread _id_A5A8::_id_9D02( "running" );

    if ( _func_120( self.classname, "sentinel" ) )
        self _meth_804A( "main_rotor_static_jnt" );

    waitframe;

    if ( !_id_0CD0( self._id_029C, self.classname ) )
    {
        _id_A5A8::_id_5BD2();

        foreach ( var_1 in self._id_5BD5 )
            var_1 _meth_8056();
    }

    thread _id_A62C::_id_45B5();
    self._id_3069 = ::_id_57AE;
    _id_A5A4::_id_0749( ::_id_57AD );
}

_id_84C2()
{
    if ( _func_120( self.classname, "sentinel" ) )
    {
        self _meth_804A( "main_rotor_static_jnt" );
        self _meth_804D( "main_rotor_jnt" );
    }
}

_id_84F0()
{
    if ( _func_120( self.classname, "sentinel" ) )
    {
        self _meth_804D( "main_rotor_static_jnt" );
        self _meth_804A( "main_rotor_jnt" );
    }
}

_id_0DE7()
{
    switch ( self.classname )
    {
        case "script_vehicle_littlebird_sentinel_bench":
        case "script_vehicle_littlebird_atlas_bench":
            self _meth_801D( "vehicle_sentinel_littlebird_benchleft", "TAG_BENCH_ATTACH_LEFT" );
            self _meth_801D( "vehicle_sentinel_littlebird_benchright", "TAG_BENCH_ATTACH_RIGHT" );
            break;
        default:
            break;
    }
}

_id_7EFA( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 8; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_pilot1";
    var_0[1]._id_85AE = "tag_pilot2";
    var_0[2]._id_85AE = "tag_detach_right";
    var_0[3]._id_85AE = "tag_detach_right";
    var_0[4]._id_85AE = "tag_detach_right";
    var_0[5]._id_85AE = "tag_detach_left";
    var_0[6]._id_85AE = "tag_detach_left";
    var_0[7]._id_85AE = "tag_detach_left";
    var_0[0]._id_4B63[0] = %helicopter_pilot1_idle;
    var_0[0]._id_4B63[1] = %helicopter_pilot1_twitch_clickpannel;
    var_0[0]._id_4B63[2] = %helicopter_pilot1_twitch_lookback;
    var_0[0]._id_4B63[3] = %helicopter_pilot1_twitch_lookoutside;
    var_0[0]._id_4B7E[0] = 500;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0]._id_4B7E[2] = 100;
    var_0[0]._id_4B7E[3] = 100;
    var_0[1]._id_4B63[0] = %helicopter_pilot2_idle;
    var_0[1]._id_4B63[1] = %helicopter_pilot2_twitch_clickpannel;
    var_0[1]._id_4B63[2] = %helicopter_pilot2_twitch_lookoutside;
    var_0[1]._id_4B63[3] = %helicopter_pilot2_twitch_radio;
    var_0[1]._id_4B7E[0] = 450;
    var_0[1]._id_4B7E[1] = 100;
    var_0[1]._id_4B7E[2] = 100;
    var_0[1]._id_4B7E[3] = 100;
    var_0[2]._id_4B63[0] = %little_bird_casual_idle_guy1;
    var_0[3]._id_4B63[0] = %little_bird_casual_idle_guy3;
    var_0[4]._id_4B63[0] = %little_bird_casual_idle_guy2;
    var_0[5]._id_4B63[0] = %little_bird_casual_idle_guy1;
    var_0[6]._id_4B63[0] = %little_bird_casual_idle_guy3;
    var_0[7]._id_4B63[0] = %little_bird_casual_idle_guy2;
    var_0[2]._id_4B7E[0] = 100;
    var_0[3]._id_4B7E[0] = 166;
    var_0[4]._id_4B7E[0] = 122;
    var_0[5]._id_4B7E[0] = 177;
    var_0[6]._id_4B7E[0] = 136;
    var_0[7]._id_4B7E[0] = 188;
    var_0[2]._id_4B63[1] = %little_bird_aim_idle_guy1;
    var_0[3]._id_4B63[1] = %little_bird_aim_idle_guy3;
    var_0[4]._id_4B63[1] = %little_bird_aim_idle_guy2;
    var_0[5]._id_4B63[1] = %little_bird_aim_idle_guy1;
    var_0[7]._id_4B63[1] = %little_bird_aim_idle_guy2;
    var_0[2]._id_4B7E[1] = 200;
    var_0[3]._id_4B7E[1] = 266;
    var_0[4]._id_4B7E[1] = 156;
    var_0[5]._id_4B7E[1] = 277;
    var_0[7]._id_4B7E[1] = 288;
    var_0[2]._id_4B64 = %little_bird_alert_idle_guy1;
    var_0[3]._id_4B64 = %little_bird_alert_idle_guy3;
    var_0[4]._id_4B64 = %little_bird_alert_idle_guy2;
    var_0[5]._id_4B64 = %little_bird_alert_idle_guy1;
    var_0[6]._id_4B64 = %little_bird_alert_idle_guy3;
    var_0[7]._id_4B64 = %little_bird_alert_idle_guy2;
    var_0[2]._id_4B65 = %little_bird_alert_2_aim_guy1;
    var_0[3]._id_4B65 = %little_bird_alert_2_aim_guy3;
    var_0[4]._id_4B65 = %little_bird_alert_2_aim_guy2;
    var_0[5]._id_4B65 = %little_bird_alert_2_aim_guy1;
    var_0[6]._id_4B65 = %little_bird_alert_2_aim_guy3;
    var_0[7]._id_4B65 = %little_bird_alert_2_aim_guy2;
    var_0[2]._id_4068 = %little_bird_dismount_guy1;
    var_0[3]._id_4068 = %little_bird_dismount_guy3;
    var_0[4]._id_4068 = %little_bird_dismount_guy2;
    var_0[5]._id_4068 = %little_bird_dismount_guy1;
    var_0[6]._id_4068 = %little_bird_dismount_guy3;
    var_0[7]._id_4068 = %little_bird_dismount_guy2;
    var_0[2]._id_57B7 = 1;
    var_0[3]._id_57B7 = 1;
    var_0[4]._id_57B7 = 1;
    var_0[5]._id_57B7 = 1;
    var_0[6]._id_57B7 = 1;
    var_0[7]._id_57B7 = 1;
    var_0[2]._id_3FD2 = %little_bird_mount_guy1;
    var_0[2]._id_3FD3 = "mount_finish";
    var_0[3]._id_3FD2 = %little_bird_mount_guy3;
    var_0[3]._id_3FD3 = "mount_finish";
    var_0[4]._id_3FD2 = %little_bird_mount_guy2;
    var_0[4]._id_3FD3 = "mount_finish";
    var_0[5]._id_3FD2 = %little_bird_mount_guy1;
    var_0[5]._id_3FD3 = "mount_finish";
    var_0[6]._id_3FD2 = %little_bird_mount_guy3;
    var_0[6]._id_3FD3 = "mount_finish";
    var_0[7]._id_3FD2 = %little_bird_mount_guy2;
    var_0[7]._id_3FD3 = "mount_finish";
    var_0[2]._id_3FD4 = _id_A5A9::_id_449C;
    var_0[3]._id_3FD4 = _id_A5A9::_id_449C;
    var_0[4]._id_3FD4 = _id_A5A9::_id_449C;
    var_0[5]._id_3FD4 = _id_A5A9::_id_449C;
    var_0[6]._id_3FD4 = _id_A5A9::_id_449C;
    var_0[7]._id_3FD4 = _id_A5A9::_id_449C;
    var_0[2]._id_6EAF = %little_bird_aim_2_prelanding_guy1;
    var_0[3]._id_6EAF = %little_bird_aim_2_prelanding_guy3;
    var_0[4]._id_6EAF = %little_bird_aim_2_prelanding_guy2;
    var_0[5]._id_6EAF = %little_bird_aim_2_prelanding_guy1;
    var_0[6]._id_6EAF = %little_bird_aim_2_prelanding_guy3;
    var_0[7]._id_6EAF = %little_bird_aim_2_prelanding_guy2;
    var_0[2]._id_6EB0 = %little_bird_prelanding_idle_guy1;
    var_0[3]._id_6EB0 = %little_bird_prelanding_idle_guy3;
    var_0[4]._id_6EB0 = %little_bird_prelanding_idle_guy2;
    var_0[5]._id_6EB0 = %little_bird_prelanding_idle_guy1;
    var_0[6]._id_6EB0 = %little_bird_prelanding_idle_guy3;
    var_0[7]._id_6EB0 = %little_bird_prelanding_idle_guy2;
    var_0[0]._id_1433 = 0;
    var_0[1]._id_1433 = 0;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["first_guy_left"] = [];
    var_0["first_guy_right"] = [];
    var_0["left"] = [];
    var_0["right"] = [];
    var_0["passengers"] = [];
    var_0["default"] = [];
    var_0["first_guy_left"][0] = 5;
    var_0["first_guy_right"][0] = 2;
    var_0["stage_guy_left"][0] = 7;
    var_0["stage_guy_right"][0] = 4;
    var_0["left"][var_0["left"].size] = 5;
    var_0["left"][var_0["left"].size] = 6;
    var_0["left"][var_0["left"].size] = 7;
    var_0["right"][var_0["right"].size] = 2;
    var_0["right"][var_0["right"].size] = 3;
    var_0["right"][var_0["right"].size] = 4;
    var_0["passengers"][var_0["passengers"].size] = 2;
    var_0["passengers"][var_0["passengers"].size] = 3;
    var_0["passengers"][var_0["passengers"].size] = 4;
    var_0["passengers"][var_0["passengers"].size] = 5;
    var_0["passengers"][var_0["passengers"].size] = 6;
    var_0["passengers"][var_0["passengers"].size] = 7;
    var_0["default"] = var_0["passengers"];
    return var_0;
}

_id_57AD( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_4 == "MOD_ENERGY" && isdefined( self._id_3069 ) )
        self thread [[ self._id_3069 ]]( var_1, var_4 );
}

_id_57AE( var_0, var_1 )
{
    self endon( "death" );
    self endon( "in_air_explosion" );
    self notify( "emp_death" );
    _id_A5A8::_id_9D01( "all" );
    self._id_9D4B = 1;
    var_2 = self _meth_8283();
    var_3 = 250;

    if ( isdefined( level._id_3DC4 ) )
        var_4 = [[ level._id_3DC4 ]]();
    else
    {
        var_5 = ( self._id_02E2[0] + var_2[0] * 5, self._id_02E2[1] + var_2[1] * 5, self._id_02E2[2] - 2000 );
        var_4 = _func_06B( self._id_02E2, var_5, 0, self )["position"];
    }

    self notify( "newpath" );
    self notify( "deathspin" );
    thread _id_57AB();
    var_6 = 1000;
    self _meth_827F( var_6, 40, 1000 );
    self _meth_8256( var_3 );
    self _meth_8257( var_4, 0 );
    thread _id_57AC( var_4, var_3, var_6 );
    common_scripts\utility::_id_A069( "goal", "near_goal" );
    self notify( "stop_crash_loop_sound" );
    self notify( "crash_done" );
    self._id_0B0C = 1;
    self._id_3118 = 1;
    _id_A5AA::_id_9CF0( var_0, var_1 );

    if ( getdvar( "mapname" ) == "lab" )
        _id_1CD0();

    self _meth_8054( self._id_02E2, var_0 );
}

_id_1CD0()
{
    if ( !isdefined( level._id_74B9 ) )
        level._id_74B9 = 0;

    level._id_74B9++;

    if ( level._id_74B9 >= 10 )
        _id_A5A4::_id_41DD( "LEVEL_10A" );
}

_id_57AB()
{
    self endon( "crash_done" );
    self _meth_8262();
    self _meth_828E( 400, 100, 100 );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_0 = _func_0B4( 90, 120 );
        self _meth_825A( self.angles[1] + var_0 );
        wait 0.5;
    }
}

_id_57AC( var_0, var_1, var_2 )
{
    self endon( "crash_done" );
    self _meth_8262();
    self _meth_828E( 400, 100, 100 );
    var_3 = 400;
    var_4 = 100;
    var_5 = undefined;
    var_6 = 90 * _func_0B4( -2, 3 );

    for (;;)
    {
        if ( self._id_02E2[2] < var_0[2] + var_1 )
            self notify( "near_goal" );

        wait 0.05;
    }
}

_id_4809()
{
    self endon( "crash_done" );
    self _meth_8262();
    self _meth_828E( 400, 100, 100 );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_0 = _func_0B4( 90, 120 );
        self _meth_825A( self.angles[1] + var_0 );
        wait 0.5;
    }
}

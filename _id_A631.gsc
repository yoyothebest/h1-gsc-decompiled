// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "mi17_noai", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_mi17_woodland" );
    _id_A5A8::_id_1845( "vehicle_mi17_woodland_fly" );
    _id_A5A8::_id_1845( "vehicle_mi17_woodland_fly_cheap" );
    var_3 = [];
    var_3["vehicle_mi17_woodland"] = "fx/explosions/helicopter_explosion_mi17_woodland";
    var_3["vehicle_mi17_woodland_fly"] = "fx/explosions/helicopter_explosion_mi17_woodland_low";
    var_3["vehicle_mi17_woodland_fly_cheap"] = "fx/explosions/helicopter_explosion_mi17_woodland_low";
    var_3["vehicle_mi-28_flying"] = "fx/explosions/helicopter_explosion_mi17_woodland_low";
    _id_A5A8::_id_1842( "vfx/fire/fire_helicopter_engine", "tag_engine_right", undefined, 1, undefined, undefined, 1.05, 1 );
    _id_A5A8::_id_1842( "vfx/fire/fire_helicopter_engine", "tag_engine_left", undefined, 1, 1.05, undefined, 1.05, 1 );
    _id_A5A8::_id_1842( "vfx/explosion/vehicle_mi17_flames_crashing_runner", "tag_deathfx", "mi17_helicopter_dying_loop", 1, 1.05, 1, 0.0, 1 );
    _id_A5A8::_id_1842( "vfx/explosion/vehicle_mi17_smoke_crashing_runner", "tag_deathfx", undefined, 1, 1.05, undefined, 3.5, 1 );
    _id_A5A8::_id_1842( "vfx/explosion/vehicle_mi17_aerial_explosion", "tag_deathfx", "mi17_helicopter_hit", undefined, undefined, undefined, 0.05, 1 );
    _id_A5A8::_id_1842( "vfx/explosion/vehicle_mi17_aerial_second_explosion", "tag_deathfx", "mi17_helicopter_secondary_exp", undefined, undefined, undefined, 3.5, 1 );
    _id_A5A8::_id_1842( var_3[var_0], undefined, "mi17_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    _id_A5A8::_id_1849( %mi17_heli_rotors, undefined, 0 );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_1865( "tank_rumble", 0.15, 4.5, 600, 1, 1 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cargo01", "tag_light_cargo01", "fx/misc/aircraft_light_cockpit_red", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cockpit01", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue", "interior", 0.1 );
    _id_A5A8::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_white_blink", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.3 );
    _id_A5A8::_id_1857( var_2, "wingtip_green", "tag_light_L_wing", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "wingtip_red", "tag_light_R_wing", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    _id_A5A8::_id_1855();
    set_deathanim_scene();
}

_id_4D10()
{
    self._id_65A7 = _func_0EE( self _meth_8184( "tag_origin" ), self _meth_8184( "tag_ground" ) );
    self._id_367F = 710;
    self._id_7957 = 0;
    _id_A5A8::_id_9D02( "running" );
    _id_A5A8::_id_9D02( "interior" );
}

set_deathanim_scene()
{
    var_0 = spawnstruct();
    var_0._id_0C7A = [];
    var_0._id_0C7A = common_scripts\utility::_id_0CDA( var_0._id_0C7A, %mi17_heli_hitreact_flyin_01 );
    var_0._id_0C7A = common_scripts\utility::_id_0CDA( var_0._id_0C7A, %mi17_heli_hitreact_flyin_02 );
    var_0.delay_crash = 1;
    _id_A5A8::_id_1841( var_0 );
    var_1 = spawnstruct();
    var_1._id_0C7A = [];
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_front );
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_rear );
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_left );
    var_1._id_0C7A = common_scripts\utility::_id_0CDA( var_1._id_0C7A, %mi17_heli_hitreact_right );
    var_1.alter_velocity = 1;
    var_1.delay_crash = 1;
    _id_A5A8::_id_1841( var_1, "unloading" );
    var_2 = spawnstruct();
    var_2._id_0C7A = [];
    var_2._id_0C7A = common_scripts\utility::_id_0CDA( var_2._id_0C7A, %mi17_heli_hitreact_left );
    var_2._id_0C7A = common_scripts\utility::_id_0CDA( var_2._id_0C7A, %mi17_heli_hitreact_right );
    var_2.alter_velocity = 1;
    var_2.delay_crash = 1;
    _id_A5A8::_id_1841( var_2, "unloaded" );
}

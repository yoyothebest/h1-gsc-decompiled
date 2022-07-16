// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "seaknight_airlift", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_ch46e" );
    _id_A5A8::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1849( %sniper_escape_ch46_rotors, undefined, 0 );
    _id_A5A8::_id_1857( var_2, "cockpit_red_cargo_1", "tag_fx_light_cargo02", "vfx/lights/airlift/seaknight_light_back_red", "back", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_L_godray1", "tag_fx_L_window_1", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_L_godray2", "tag_fx_L_window_2", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_L_godray3", "tag_fx_L_window_3", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_L_godray4", "tag_fx_L_window_4", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_L_godray5", "tag_fx_window_gun", "vfx/lights/airlift/seaknight_godray", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cockpit_1", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue_airlift", "interior", 0.1 );
    _id_A5A8::_id_1857( var_2, "cockpit_red_cargo_2", "tag_fx_light_cargo02", "vfx/lights/airlift/seaknight_light_back_red", "back2", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_R_godray1", "tag_fx_R_window_1", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_R_godray2", "tag_fx_R_window_2", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_R_godray3", "tag_fx_R_window_3", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_R_godray4", "tag_fx_R_window_4", "vfx/lights/airlift/seaknight_godray", "interior2", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cockpit_2", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue_airlift", "interior2", 0.1 );
    _id_A5A8::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_red_blink", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.3 );
    _id_A5A8::_id_1857( var_2, "wingtip_green1", "tag_light_L_wing1", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "wingtip_green2", "tag_light_L_wing2", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "wingtip_red1", "tag_light_R_wing1", "fx/misc/aircraft_light_wingtip_red", "running", 0.2 );
    _id_A5A8::_id_1857( var_2, "wingtip_red2", "tag_light_R_wing2", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_red_cargo_3", "tag_fx_light_cargo02", "vfx/lights/airlift/seaknight_light_back_red_rescue", "back3", 0.0 );
    _id_A5A8::_id_1855();
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    thread _id_7DDA();
}

_id_4D10()
{
    self._id_65A7 = _func_0EE( self _meth_8184( "tag_origin" ), self _meth_8184( "tag_ground" ) );
    self._id_367F = 652;
    self._id_7957 = 0;
}

_id_7EFA( var_0 )
{
    var_0[1]._id_9CD5 = %ch46_doors_open;
    var_0[1]._id_9CD6 = 0;
    var_0[1]._id_9CD0 = %ch46_doors_close;
    var_0[1]._id_9CD1 = 0;
    var_0[1]._id_9CD7 = "seaknight_door_open";
    var_0[1]._id_9CD2 = "seaknight_door_close";
    return var_0;
}

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 0; var_1++ )
        var_0[var_1] = spawnstruct();

    return var_0;
}

_id_9A3D()
{

}

_id_7DDA()
{
    while ( !isdefined( level.seaknight ) )
        wait 0.05;

    var_0 = spawn( "script_model", level.seaknight._id_02E2 );
    var_0 _meth_80B3( "vehicle_ch46e_opened_door_interior_b" );
    var_0._id_02E2 = level.seaknight _meth_8184( "body_animate_jnt" );
    var_0.angles = level.seaknight.angles;
    var_0 _meth_804F( level.seaknight, "body_animate_jnt" );
    var_0 = spawn( "script_model", level.seaknight._id_02E2 );
    var_0 _meth_80B3( "vehicle_ch46e_wires" );
    var_0._id_02E2 = level.seaknight _meth_8184( "body_animate_jnt" );
    var_0.angles = level.seaknight.angles;
    var_0 _meth_804F( level.seaknight, "body_animate_jnt" );
}

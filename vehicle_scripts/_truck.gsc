// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "truck", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_pickup_roobars", "vehicle_pickup_technical_destroyed" );
    _id_A5A8::_id_1845( "vehicle_pickup_4door", "vehicle_pickup_technical_destroyed" );
    _id_A5A8::_id_1845( "vehicle_opfor_truck", "vehicle_pickup_technical_destroyed" );
    _id_A5A8::_id_1845( "vehicle_pickup_technical", "vehicle_pickup_technical_destroyed" );
    _id_A5A8::_id_1842( "fx/explosions/small_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0 );
    _id_A5A8::_id_1842( "fx/fire/firelp_small_pm_a", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 0 );
    _id_A5A8::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_cab", "smallfire", undefined, undefined, 1, 0 );
    _id_A5A8::_id_1842( "fx/fire/firelp_small_pm_a", "tag_engine_left", "smallfire", undefined, undefined, 1, 0 );
    _id_A5A8::_id_1849( %technical_driving_idle_forward, %technical_driving_idle_backward, 10 );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_1873( ::_id_9A3D );
    _id_A5A8::_id_1857( var_2, "headlight_truck_left", "tag_headlight_left", "fx/misc/car_headlight_truck_L", "headlights" );
    _id_A5A8::_id_1857( var_2, "headlight_truck_right", "tag_headlight_right", "fx/misc/car_headlight_truck_R", "headlights" );
    _id_A5A8::_id_1857( var_2, "parkinglight_truck_left_f", "tag_parkinglight_left_f", "fx/misc/car_parkinglight_truck_LF", "headlights" );
    _id_A5A8::_id_1857( var_2, "parkinglight_truck_right_f", "tag_parkinglight_right_f", "fx/misc/car_parkinglight_truck_RF", "headlights" );
    _id_A5A8::_id_1857( var_2, "taillight_truck_right", "tag_taillight_right", "fx/misc/car_taillight_truck_R", "headlights" );
    _id_A5A8::_id_1857( var_2, "taillight_truck_left", "tag_taillight_left", "fx/misc/car_taillight_truck_L", "headlights" );
    _id_A5A8::_id_1857( var_2, "brakelight_truck_right", "tag_taillight_right", "fx/misc/car_brakelight_truck_R", "brakelights" );
    _id_A5A8::_id_1857( var_2, "brakelight_truck_left", "tag_taillight_left", "fx/misc/car_brakelight_truck_L", "brakelights" );
}

_id_4D10()
{

}

_id_7EFA( var_0 )
{
    var_0[0]._id_9CD5 = %door_pickup_driver_climb_out;
    var_0[1]._id_9CD5 = %door_pickup_passenger_climb_out;
    var_0[2]._id_9CD5 = %door_pickup_passenger_rr_climb_out;
    var_0[3]._id_9CD5 = %door_pickup_passenger_rl_climb_out;
    var_0[0]._id_9CD6 = 0;
    var_0[1]._id_9CD6 = 0;
    var_0[2]._id_9CD6 = 0;
    var_0[3]._id_9CD6 = 0;
    var_0[0]._id_9CD0 = %door_pickup_driver_climb_in;
    var_0[1]._id_9CD0 = %door_pickup_passenger_climb_in;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 4; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[2]._id_85AE = "tag_guy1";
    var_0[3]._id_85AE = "tag_guy0";
    var_0[0]._id_4B63 = %technical_driver_idle;
    var_0[1]._id_4B63 = %technical_passenger_idle;
    var_0[2]._id_4B63 = %pickup_passenger_rr_idle;
    var_0[3]._id_4B63 = %pickup_passenger_rl_idle;
    var_0[0]._id_4068 = %pickup_driver_climb_out;
    var_0[1]._id_4068 = %pickup_passenger_climb_out;
    var_0[2]._id_4068 = %pickup_passenger_rr_climb_out;
    var_0[3]._id_4068 = %pickup_passenger_rl_climb_out;
    var_0[0]._id_3FD2 = %pickup_driver_climb_in;
    var_0[1]._id_3FD2 = %pickup_passenger_climb_in;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["all"] = [];
    var_1 = "passengers";
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_0["default"] = var_0["all"];
    return var_0;
}

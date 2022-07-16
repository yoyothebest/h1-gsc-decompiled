// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "bm21_troops", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1848( "vehicle_bm21_mobile_bed_destructible", "vehicle_bm21_mobile_bed" );
    _id_A5A8::_id_1848( "vehicle_bm21_bed_under_destructible", "vehicle_bm21_bed_under" );
    _id_A5A8::_id_1848( "vehicle_bm21_cover_destructible", "vehicle_bm21_cover" );
    _id_A5A8::_id_1848( "vehicle_bm21_cover_under_destructible", "vehicle_bm21_cover_under" );
    _id_A5A8::_id_1845( "vehicle_bm21_mobile", "vehicle_bm21_mobile_dstry" );
    _id_A5A8::_id_1845( "vehicle_bm21_mobile_cover", "vehicle_bm21_mobile_cover_dstry" );
    _id_A5A8::_id_1845( "vehicle_bm21_mobile_bed", "vehicle_bm21_mobile_bed_dstry" );
    _id_A5A8::_id_1845( "vehicle_bm21_mobile_cover_no_bench", "vehicle_bm21_mobile_cover_dstry" );
    _id_A5A8::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "truck_explode", undefined, undefined, undefined, 0 );
    _id_A5A8::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_tire_right_r", undefined, undefined, undefined, 1, 0 );
    _id_A5A8::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_cab", "fire_metal_medium", undefined, undefined, 1, 0 );
    _id_A5A8::_id_1842( "fx/explosions/small_vehicle_explosion", "tag_fx_tank", "explo_metal_rand", undefined, undefined, undefined, 2 );
    _id_A5A8::_id_1865( "pickup_rumble", 0.01, 4.5, 900, 1, 1 );
    _id_A5A8::_id_1846( 1, 1.6, 500 );
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_183C( 1 );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_1873( ::_id_9A3D );
    _id_A5A8::_id_1857( var_2, "headlight_truck_left", "tag_headlight_left", "fx/misc/lighthaze", "headlights" );
    _id_A5A8::_id_1857( var_2, "headlight_truck_right", "tag_headlight_right", "fx/misc/lighthaze", "headlights" );
    _id_A5A8::_id_1857( var_2, "headlight_truck_left2", "tag_headlight_left", "fx/misc/car_headlight_bm21", "headlights" );
    _id_A5A8::_id_1857( var_2, "headlight_truck_right2", "tag_headlight_right", "fx/misc/car_headlight_bm21", "headlights" );
    _id_A5A8::_id_1857( var_2, "parkinglight_truck_left_f", "tag_parkinglight_left_f", "fx/misc/car_parkinglight_bm21", "headlights" );
    _id_A5A8::_id_1857( var_2, "parkinglight_truck_right_f", "tag_parkinglight_right_f", "fx/misc/car_parkinglight_bm21", "headlights" );
    _id_A5A8::_id_1857( var_2, "taillight_truck_right", "tag_taillight_right", "fx/misc/car_taillight_bm21", "headlights" );
    _id_A5A8::_id_1857( var_2, "taillight_truck_left", "tag_taillight_left", "fx/misc/car_taillight_bm21", "headlights" );
    _id_A5A8::_id_1857( var_2, "brakelight_troops_right", "tag_taillight_right", "fx/misc/car_taillight_bm21", "brakelights" );
    _id_A5A8::_id_1857( var_2, "brakelight_troops_left", "tag_taillight_left", "fx/misc/car_taillight_bm21", "brakelights" );
    _id_A5A8::_id_1849( %bm21_driving_idle_forward, %bm21_driving_idle_backward, 10 );
}

_id_4D10()
{

}

_id_7EFA( var_0 )
{
    var_0[0]._id_9CD5 = %bm21_driver_climbout_door;
    var_0[1]._id_9CD5 = %bm21_passenger_climbout_door;
    var_0[2]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[3]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[4]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[5]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[6]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[7]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[8]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[9]._id_9CD5 = %bm21_guy_climbout_truckdoor;
    var_0[0]._id_9CD8 = "left_door";
    var_0[1]._id_9CD8 = "right_door";
    var_0[2]._id_9CD8 = "back_board";
    var_0[3]._id_9CD8 = "back_board";
    var_0[4]._id_9CD8 = "back_board";
    var_0[5]._id_9CD8 = "back_board";
    var_0[6]._id_9CD8 = "back_board";
    var_0[7]._id_9CD8 = "back_board";
    var_0[8]._id_9CD8 = "back_board";
    var_0[9]._id_9CD8 = "back_board";
    var_0[0]._id_9CD7 = "scn_truck_door_open_01";
    var_0[1]._id_9CD7 = "scn_truck_door_open_02";
    var_0[0]._id_9CD6 = 1;
    var_0[1]._id_9CD6 = 1;
    var_0[2]._id_9CD6 = 0;
    var_0[3]._id_9CD6 = 0;
    var_0[4]._id_9CD6 = 0;
    var_0[5]._id_9CD6 = 0;
    var_0[6]._id_9CD6 = 0;
    var_0[7]._id_9CD6 = 0;
    var_0[8]._id_9CD6 = 0;
    var_0[9]._id_9CD6 = 0;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 10; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[2]._id_85AE = "tag_detach";
    var_0[3]._id_85AE = "tag_detach";
    var_0[4]._id_85AE = "tag_detach";
    var_0[5]._id_85AE = "tag_detach";
    var_0[6]._id_85AE = "tag_detach";
    var_0[7]._id_85AE = "tag_detach";
    var_0[8]._id_85AE = "tag_detach";
    var_0[9]._id_85AE = "tag_detach";
    var_0[0]._id_4B63 = %bm21_driver_idle;
    var_0[1]._id_4B63 = %bm21_passenger_idle;
    var_0[2]._id_4B63 = %bm21_guy1_idle;
    var_0[3]._id_4B63 = %bm21_guy2_idle;
    var_0[4]._id_4B63 = %bm21_guy3_idle;
    var_0[5]._id_4B63 = %bm21_guy4_idle;
    var_0[6]._id_4B63 = %bm21_guy5_idle;
    var_0[7]._id_4B63 = %bm21_guy6_idle;
    var_0[8]._id_4B63 = %bm21_guy7_idle;
    var_0[9]._id_4B63 = %bm21_guy8_idle;
    var_0[0]._id_4B66 = %bm21_driver_driving;
    var_0[0]._id_4B6A = %bm21_driver_idle;
    var_0[0]._id_4068 = %bm21_driver_climbout;
    var_0[1]._id_4068 = %bm21_passenger_climbout;
    var_0[2]._id_4068 = %bm21_guy1_climbout;
    var_0[3]._id_4068 = %bm21_guy2_climbout;
    var_0[4]._id_4068 = %bm21_guy3_climbout;
    var_0[5]._id_4068 = %bm21_guy4_climbout;
    var_0[6]._id_4068 = %bm21_guy5_climbout;
    var_0[7]._id_4068 = %bm21_guy6_climbout;
    var_0[8]._id_4068 = %bm21_guy7_climbout;
    var_0[9]._id_4068 = %bm21_guy8_climbout;
    var_0[2]._id_406C = %bm21_guy_climbout_landing;
    var_0[3]._id_406C = %bm21_guy_climbout_landing;
    var_0[4]._id_406C = %bm21_guy_climbout_landing;
    var_0[6]._id_406C = %bm21_guy_climbout_landing;
    var_0[7]._id_406C = %bm21_guy_climbout_landing;
    var_0[8]._id_406C = %bm21_guy_climbout_landing;
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
    var_0[var_1][var_0[var_1].size] = 4;
    var_0[var_1][var_0[var_1].size] = 5;
    var_0[var_1][var_0[var_1].size] = 6;
    var_0[var_1][var_0[var_1].size] = 7;
    var_0[var_1][var_0[var_1].size] = 8;
    var_0[var_1][var_0[var_1].size] = 9;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_0[var_1][var_0[var_1].size] = 4;
    var_0[var_1][var_0[var_1].size] = 5;
    var_0[var_1][var_0[var_1].size] = 6;
    var_0[var_1][var_0[var_1].size] = 7;
    var_0[var_1][var_0[var_1].size] = 8;
    var_0[var_1][var_0[var_1].size] = 9;
    var_0["default"] = var_0["all"];
    return var_0;
}

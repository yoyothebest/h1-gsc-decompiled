// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "humvee", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_humvee_camo" );
    _id_A5A8::_id_1845( "vehicle_humvee_camo_50cal_doors" );
    _id_A5A8::_id_1845( "vehicle_humvee_camo_50cal_nodoors" );
    _id_A5A8::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "car_explode" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
}

_id_4D10()
{

}
#using_animtree("vehicles");

_id_7EFA( var_0 )
{
    var_0[0]._id_9CD5 = %uaz_driver_exit_into_run_door;
    var_0[1]._id_9CD5 = %uaz_rear_driver_exit_into_run_door;
    var_0[2]._id_9CD5 = %uaz_passenger_exit_into_run_door;
    var_0[3]._id_9CD5 = %uaz_passenger2_exit_into_run_door;
    var_0[0]._id_9CD0 = %uaz_driver_enter_from_huntedrun_door;
    var_0[1]._id_9CD0 = %uaz_rear_driver_enter_from_huntedrun_door;
    var_0[2]._id_9CD0 = %uaz_passenger_enter_from_huntedrun_door;
    var_0[3]._id_9CD0 = %uaz_passenger2_enter_from_huntedrun_door;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 4; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "body_animate_jnt";
    var_0[1]._id_85AE = "body_animate_jnt";
    var_0[2]._id_85AE = "tag_passenger";
    var_0[3]._id_85AE = "body_animate_jnt";
    var_0[0]._id_4B63 = %humvee_driver_climb_idle;
    var_0[1]._id_4B63 = %humvee_passenger_idle_l;
    var_0[2]._id_4B63 = %humvee_passenger_idle_r;
    var_0[3]._id_4B63 = %humvee_passenger_idle_r;
    var_0[0]._id_4068 = %humvee_driver_climb_out;
    var_0[1]._id_4068 = %humvee_passenger_out_l;
    var_0[2]._id_4068 = %humvee_passenger_out_r;
    var_0[3]._id_4068 = %humvee_passenger_out_r;
    var_0[0]._id_3FD2 = %humvee_driver_climb_in;
    var_0[1]._id_3FD2 = %humvee_passenger_in_l;
    var_0[2]._id_3FD2 = %humvee_passenger_in_r;
    var_0[3]._id_3FD2 = %humvee_passenger_in_r;
    return var_0;
}

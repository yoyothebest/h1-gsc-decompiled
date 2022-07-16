// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "uaz", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1848( "vehicle_uaz_hardtop_destructible", "vehicle_uaz_hardtop" );
    _id_A5A8::_id_1848( "vehicle_uaz_light_destructible", "vehicle_uaz_light" );
    _id_A5A8::_id_1848( "vehicle_uaz_open_destructible", "vehicle_uaz_open" );
    _id_A5A8::_id_1848( "vehicle_uaz_open_for_ride", "vehicle_uaz_open" );
    _id_A5A8::_id_1848( "vehicle_uaz_fabric_destructible", "vehicle_uaz_fabric" );
    _id_A5A8::_id_183C( 1 );
    _id_A5A8::_id_1845( "vehicle_uaz_fabric", "vehicle_uaz_fabric_dsr" );
    _id_A5A8::_id_1845( "vehicle_uaz_hardtop", "vehicle_uaz_hardtop_dsr" );
    _id_A5A8::_id_1845( "vehicle_uaz_open", "vehicle_uaz_open_dsr" );
    _id_A5A8::_id_1845( "vehicle_uaz_hardtop_thermal", "vehicle_uaz_hardtop_thermal" );
    _id_A5A8::_id_1845( "vehicle_uaz_open_for_ride" );
    _id_A5A8::_id_1842( "fx/explosions/small_vehicle_explosion", undefined, "explo_metal_rand" );
    _id_A5A8::_id_1862( ( 0, 0, 32 ), 300, 200, 100, 0 );
    _id_A5A8::_id_1849( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    _id_A5A8::_id_1846( 1, 1.6, 500 );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
}

_id_4D10()
{
    self._id_1E9A = 1;
}

_id_7EFA( var_0 )
{
    if ( getdvarint( "use_old_uaz_anims" ) == 1 )
    {
        var_0[0]._id_9CD5 = %uaz_driver_exit_into_run_door;
        var_0[1]._id_9CD5 = %uaz_passenger_exit_into_run_door;
    }
    else
    {
        var_0[0]._id_9CD5 = %h1_uaz_driver_exit_into_idle_door;
        var_0[1]._id_9CD5 = %h1_uaz_passenger_exit_into_idle_door;
    }

    var_0[0]._id_9CD0 = %uaz_driver_enter_from_huntedrun_door;
    var_0[1]._id_9CD0 = %uaz_passenger_enter_from_huntedrun_door;
    var_0[0]._id_9CD8 = "front_door_left_jnt";
    var_0[1]._id_9CD8 = "front_door_right_jnt";
    var_0[2]._id_9CD8 = "rear_door_left_jnt";
    var_0[3]._id_9CD8 = "rear_door_right_jnt";
    var_0[0]._id_9CD2 = "truck_door_open";
    var_0[1]._id_9CD2 = "truck_door_open";
    var_0[2]._id_9CD2 = "truck_door_open";
    var_0[3]._id_9CD2 = "truck_door_open";
    var_0[0]._id_9CD3 = "front_door_left_jnt";
    var_0[1]._id_9CD3 = "front_door_right_jnt";
    var_0[2]._id_9CD3 = "rear_door_left_jnt";
    var_0[3]._id_9CD3 = "rear_door_right_jnt";
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 6; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[2]._id_85AE = "tag_guy0";
    var_0[3]._id_85AE = "tag_guy1";
    var_0[4]._id_85AE = "tag_guy2";
    var_0[5]._id_85AE = "tag_guy3";
    var_0[0]._id_4B63 = %uaz_driver_idle_drive;
    var_0[1]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[2]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[3]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[4]._id_4B63 = %uaz_passenger_idle_drive;
    var_0[5]._id_4B63 = %uaz_passenger_idle_drive;

    if ( getdvarint( "use_old_uaz_anims" ) == 1 )
    {
        var_0[0]._id_4068 = %uaz_driver_exit_into_run;
        var_0[1]._id_4068 = %uaz_passenger_exit_into_run;
        var_0[2]._id_4068 = %uaz_driver_exit_into_run;
        var_0[3]._id_4068 = %uaz_passenger_exit_into_run;
    }
    else
    {
        var_0[0]._id_4068 = %h1_uaz_driver_exit_into_idle;
        var_0[0].getout_ik = 1;
        var_0[1]._id_4068 = %h1_uaz_passenger_exit_into_idle;
        var_0[1].getout_ik = 1;
        var_0[2]._id_4068 = %h1_uaz_driver_exit_into_idle;
        var_0[2].getout_ik = 1;
        var_0[3]._id_4068 = %h1_uaz_passenger_exit_into_idle;
        var_0[3].getout_ik = 1;
    }

    var_0[0]._id_3FD2 = %uaz_driver_enter_from_huntedrun;
    var_0[1]._id_3FD2 = %uaz_passenger_enter_from_huntedrun;
    return var_0;
}

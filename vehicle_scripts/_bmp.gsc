// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "bmp", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_bmp", "vehicle_bmp_dsty" );
    _id_A5A8::_id_1845( "vehicle_bmp_woodland", "vehicle_bmp_woodland_dsty" );
    _id_A5A8::_id_1845( "vehicle_bmp_woodland_low", "vehicle_bmp_dsty_low" );
    _id_A5A8::_id_1845( "vehicle_bmp_woodland_jeepride", "vehicle_bmp_dsty" );
    _id_A5A8::_id_1845( "vehicle_bmp_desert", "vehicle_bmp_dsty" );
    _id_A5A8::_id_1845( "vehicle_bmp_thermal", "vehicle_bmp_thermal_dsty" );
    _id_A5A8::_id_1845( "vehicle_bmp_low", "vehicle_bmp_dsty_low" );
    var_3 = [];
    var_3["vehicle_bmp"] = "fx/explosions/vehicle_explosion_bmp";
    var_3["vehicle_bmp_woodland"] = "fx/explosions/vehicle_explosion_bmp";
    var_3["vehicle_bmp_woodland_jeepride"] = "fx/explosions/vehicle_explosion_bmp";
    var_3["vehicle_bmp_woodland_low"] = "fx/explosions/vehicle_explosion_bmp";
    var_3["vehicle_bmp_desert"] = "fx/explosions/vehicle_explosion_bmp";
    var_3["vehicle_bmp_thermal"] = "fx/explosions/large_vehicle_explosion_IR";
    var_3["vehicle_bmp_low"] = "fx/explosions/vehicle_explosion_bmp";
    _id_A5A8::_id_1842( "fx/explosions/vehicle_explosion_bmp_fire", "tag_deathfx", "fire_metal_large", undefined, undefined, 1, 0 );
    _id_A5A8::_id_1842( "fx/misc/empty", "tag_cargofire", undefined, undefined, undefined, 1, 0 );
    _id_A5A8::_id_1842( var_3[var_0], "tag_deathfx", "h1_exp_armor_vehicle", undefined, undefined, undefined, 0 );
    _id_A5A8::_id_1849( %bmp_movement, %bmp_movement_backwards, 10 );

    if ( _func_120( var_0, "_low" ) )
        _id_A5A8::_id_1872( "bmp_turret2", "tag_turret2", "vehicle_bmp_machine_gun_low" );
    else
        _id_A5A8::_id_1872( "bmp_turret2", "tag_turret2", "vehicle_bmp_machine_gun" );

    _id_A5A8::_id_1862( ( 0, 0, 53 ), 512, 300, 20, 0 );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_184C( 0.33 );
}

_id_4D10()
{

}

_id_7EFA( var_0 )
{
    var_0[0]._id_9CD5 = %bmp_doors_open;
    var_0[0]._id_9CD6 = 0;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 4; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_guy1";
    var_0[1]._id_85AE = "tag_guy2";
    var_0[2]._id_85AE = "tag_guy3";
    var_0[3]._id_85AE = "tag_guy4";
    var_0[0]._id_4B63 = %bmp_idle_1;
    var_0[1]._id_4B63 = %bmp_idle_2;
    var_0[2]._id_4B63 = %bmp_idle_3;
    var_0[3]._id_4B63 = %bmp_idle_4;
    var_0[0]._id_4068 = %bmp_exit_1;
    var_0[1]._id_4068 = %bmp_exit_2;
    var_0[2]._id_4068 = %bmp_exit_3;
    var_0[3]._id_4068 = %bmp_exit_4;
    var_0[0]._id_3FD2 = %humvee_driver_climb_in;
    var_0[1]._id_3FD2 = %humvee_passenger_in_l;
    var_0[2]._id_3FD2 = %humvee_passenger_in_r;
    var_0[3]._id_3FD2 = %humvee_passenger_in_r;
    return var_0;
}

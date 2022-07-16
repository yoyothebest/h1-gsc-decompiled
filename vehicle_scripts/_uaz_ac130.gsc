// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "uaz_ac130", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_uaz_hardtop_thermal", "vehicle_uaz_hardtop_thermal" );
    _id_A5A8::_id_1862( ( 0, 0, 32 ), 300, 200, 100, 0 );
    _id_A5A8::_id_1842( "fx/explosions/small_vehicle_explosion", undefined, "explo_metal_rand" );
    _id_A5A8::_id_1849( %uaz_driving_idle_forward, %uaz_driving_idle_backward, 10 );
    _id_A5A8::_id_1846( 1, 1.6, 500 );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
}

_id_4D10()
{
    vehicle_scripts\_uaz::_id_4D10();
}

_id_7EFA( var_0 )
{
    return vehicle_scripts\_uaz::_id_7EFA( var_0 );
}

_id_7F23()
{
    return vehicle_scripts\_uaz::_id_7F23();
}

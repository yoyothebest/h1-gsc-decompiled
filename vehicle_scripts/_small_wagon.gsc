// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "small_wagon", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_small_wagon_white", "vehicle_small_wagon_d_white" );
    _id_A5A8::_id_1845( "vehicle_small_wagon_turq", "vehicle_small_wagon_d_turq" );
    _id_A5A8::_id_1845( "vehicle_small_wagon_green", "vehicle_small_wagon_d_green" );
    _id_A5A8::_id_1845( "vehicle_small_wagon_blue", "vehicle_small_wagon_d_blue" );
    _id_A5A8::_id_1848( "vehicle_small_wagon_white_destructible", "vehicle_small_wagon_white" );
    _id_A5A8::_id_1848( "vehicle_small_wagon_blue_destructible", "vehicle_small_wagon_blue" );
    _id_A5A8::_id_1848( "vehicle_small_wagon_green_destructible", "vehicle_small_wagon_green" );
    _id_A5A8::_id_1848( "vehicle_small_wagon_turq_destructible", "vehicle_small_wagon_turq" );
    _id_A5A8::_id_1849( %technical_driving_idle_forward, %technical_driving_idle_backward, 10 );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
}

_id_4D10()
{

}

_id_7EFA( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 1; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[0]._id_4B63 = %luxurysedan_driver_idle;
    return var_0;
}

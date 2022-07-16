// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "van", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_uaz_van", "vehicle_uaz_van" );
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

}

_id_7EFA( var_0 )
{
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 2; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[0]._id_4B63 = %uaz_driver_idle_drive;
    var_0[1]._id_4B63 = %uaz_passenger_idle_drive;
    return var_0;
}

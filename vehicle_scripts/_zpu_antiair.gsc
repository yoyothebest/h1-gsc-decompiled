// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "zpu_antiair", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_zpu4", "vehicle_zpu4_burn" );
    _id_A5A8::_id_1845( "vehicle_zpu4_low", "vehicle_zpu4_burn" );
    _id_A5A8::_id_1845( "vehicle_zpu4_nowheels", "vehicle_zpu4_nowheels_burn" );
    var_3 = [];
    var_3["vehicle_zpu4"] = "fx/explosions/large_vehicle_explosion";
    var_3["vehicle_zpu4_low"] = "fx/explosions/large_vehicle_explosion";
    var_3["vehicle_zpu4_nowheels"] = "fx/explosions/large_vehicle_explosion";
    _id_A5A8::_id_1842( var_3[var_0], undefined, "exp_armor_vehicle", undefined, undefined, undefined, 0 );
    _id_A5A8::_id_185A( "tag_flash", "tag_flash2", "tag_flash1", "tag_flash3" );
    _id_A5A8::_id_1862( ( 0, 0, 53 ), 512, 300, 20, 0 );
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
}

_id_4D10()
{

}
#using_animtree("vehicles");

_id_7EFA( var_0 )
{
    var_0[0]._id_9D5F = %zpu_gun_fire_a;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 1; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[0]._id_4B63 = %zpu_gunner_fire_a;
    return var_0;
}

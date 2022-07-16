// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "small_hatchback", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_small_hatchback_blue", "vehicle_small_hatchback_d_blue" );
    _id_A5A8::_id_1845( "vehicle_small_hatchback_green", "vehicle_small_hatchback_d_green" );
    _id_A5A8::_id_1845( "vehicle_small_hatchback_turq", "vehicle_small_hatchback_d_turq" );
    _id_A5A8::_id_1845( "vehicle_small_hatchback_white", "vehicle_small_hatchback_d_white" );
    _id_A5A8::_id_1848( "vehicle_small_hatch_blue_destructible", "vehicle_small_hatch_blue" );
    _id_A5A8::_id_1848( "vehicle_small_hatch_green_destructible", "vehicle_small_hatch_green" );
    _id_A5A8::_id_1848( "vehicle_small_hatch_turq_destructible", "vehicle_small_hatch_turq" );
    _id_A5A8::_id_1848( "vehicle_small_hatch_white_destructible", "vehicle_small_hatch_white" );
    _id_A5A8::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
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

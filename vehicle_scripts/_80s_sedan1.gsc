// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "80s_sedan1", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_80s_sedan1_brn", "vehicle_80s_sedan1_brn_destroyed" );
    _id_A5A8::_id_1845( "vehicle_80s_sedan1_green", "vehicle_80s_sedan1_green_destroyed" );
    _id_A5A8::_id_1845( "vehicle_80s_sedan1_red", "vehicle_80s_sedan1_red_destroyed" );
    _id_A5A8::_id_1845( "vehicle_80s_sedan1_silv", "vehicle_80s_sedan1_silv_destroyed" );
    _id_A5A8::_id_1845( "vehicle_80s_sedan1_tan", "vehicle_80s_sedan1_tan_destroyed" );
    _id_A5A8::_id_1845( "vehicle_80s_sedan1_yel", "vehicle_80s_sedan1_yel_destroyed" );
    _id_A5A8::_id_1848( "vehicle_80s_sedan1_brn_destructible", "vehicle_80s_sedan1_brn" );
    _id_A5A8::_id_1848( "vehicle_80s_sedan1_green_destructible", "vehicle_80s_sedan1_green" );
    _id_A5A8::_id_1848( "vehicle_80s_sedan1_red_destructible", "vehicle_80s_sedan1_red" );
    _id_A5A8::_id_1848( "vehicle_80s_sedan1_silv_destructible", "vehicle_80s_sedan1_silv" );
    _id_A5A8::_id_1848( "vehicle_80s_sedan1_tan_destructible", "vehicle_80s_sedan1_tan" );
    _id_A5A8::_id_1848( "vehicle_80s_sedan1_yel_destructible", "vehicle_80s_sedan1_yel" );
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

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    thread _id_80C6();
    thread _id_7E68();
    level.cheat_highcontrast_override = "_night";
    _func_052( ( 10000, 10000, 10000 ), ( 0.001, 0.001, 0.001 ) );
    thread _id_8106();
    thread _id_A54E::_id_694A( "firelight_motion_dim_01", "firelight_dim_01" );
    thread _id_A54E::_id_694A( "firelight_motion_dim_02", "firelight_dim_02" );
    thread _id_A54E::_id_694A( "firelight_motion_medium_01", "firelight_medium_01" );
    thread _id_A54E::_id_694A( "firelight_motion_medium_02", "firelight_medium_02" );
    thread _id_A54E::_id_694A( "firelight_motion_bright_01", "firelight_bright_01" );
    thread _id_A54E::_id_694A( "firelight_motion_bright_02", "firelight_bright_02" );
    thread _id_A54E::_id_694A( "firelight_motion_verybright_01", "firelight_verybright_01" );
    thread _id_A54E::_id_694A( "firelight_motion_ridonculous_01", "firelight_ridonculous_01" );
    level.nightvisionlightset = "nightvision_bog_a";
    _func_144( "bog_a_nightvision" );
    _func_0D6( "sm_cacheSunShadowEnabled", 0 );
    _func_0D6( "r_useSunShadowPortals", 1 );
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    _func_0D6( "sm_minSpotLightScore", "0.0001" );
    _id_A5A4::_id_9E6E( "bog_a", 0 );
    level._id_0318 _id_A5A4::set_light_set_player( "bog_a" );
    level._id_0318 _meth_848C( "clut_bog_a", 0.0 );
}

_id_8106()
{
    _id_A54E::_id_23B3( "firelight_motion_dim_01", ( 0.86, 0.5, 0.15 ), 10, 12, 0.15, 0.75 );
    _id_A54E::_id_23B3( "firelight_motion_dim_02", ( 0.86, 0.5, 0.15 ), 13, 12, 0.15, 0.75 );
    _id_A54E::_id_23B3( "firelight_motion_medium_01", ( 0.86, 0.5, 0.15 ), 35, 12, 0.15, 0.75 );
    _id_A54E::_id_23B3( "firelight_motion_medium_02", ( 0.86, 0.5, 0.15 ), 35, 12, 0.15, 0.75 );
    _id_A54E::_id_23B3( "firelight_motion_bright_01", ( 0.86, 0.5, 0.15 ), 80, 20, 0.2, 1.0 );
    _id_A54E::_id_23B3( "firelight_motion_bright_02", ( 0.86, 0.5, 0.15 ), 80, 20, 0.2, 1.0 );
    _id_A54E::_id_23B3( "firelight_motion_verybright_01", ( 0.86, 0.5, 0.15 ), 200, 30, 0.6, 1.5 );
    _id_A54E::_id_23B3( "firelight_motion_ridonculous_01", ( 0.86, 0.5, 0.15 ), 4000, 40, 1, 2.5 );
}

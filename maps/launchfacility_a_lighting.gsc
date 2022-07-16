// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    thread _id_80C6();
    thread _id_7E68();
    thread handle_rappel_down_vent();
    level.nightvisionlightset = "launchfacility_a_nightvision";
    _func_144( "launchfacility_a_nightvision" );
}

_id_4D05()
{
    common_scripts\utility::_id_383D( "rappel_down_vent_started" );
}

_id_80C6()
{

}

_id_7E68()
{
    _id_A5A4::_id_9E6E( "launchfacility_a", 5 );
    level._id_0318 _id_A5A4::set_light_set_player( "launchfacility_a" );
    level._id_0318 _meth_848C( "clut_launchfacility_a", 0.0 );
    _func_0D6( "r_specularcolorscale", "1.2" );
}

handle_rappel_down_vent()
{
    common_scripts\utility::_id_384A( "rappel_down_vent_started" );
    _id_A5A4::_id_7F00( "launchfacility_a_rappel", 15 );
}

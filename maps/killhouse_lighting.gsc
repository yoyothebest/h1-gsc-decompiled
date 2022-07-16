// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    level.cheat_invert_override = "_bright";
    common_scripts\utility::_id_383D( "in_firerange_lighting_zone1" );
    common_scripts\utility::_id_383D( "in_firerange_lighting_zone2" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneTower" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneHangarFloor" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneShipTopDeck" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneShipInterior1" );
    common_scripts\utility::_id_383D( "in_hangar3_lighting_zoneShipInterior2" );
    level.cheat_highcontrast_override = "_night";
    thread _id_80C6();
    thread _id_7E68();
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    _id_A5A4::_id_7F00( "killhouse_interior", 0.0 );
    _id_A5A4::_id_9E6E( "killhouse_interior", 0 );
    level._id_0318 _id_A5A4::set_light_set_player( "killhouse_interior" );
    level._id_0318 _meth_848C( "clut_killhouse", 0.0 );
    _func_0D6( "fx_cast_shadow", 0 );
}

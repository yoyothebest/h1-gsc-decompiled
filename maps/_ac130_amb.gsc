// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_0B47["ac130"] = "ambient_ac130_int1";
    thread _id_A5A4::_id_7DB9( "ac130" );
    maps\_ambient::_id_0B4F( "ac130", 3.0, 6.0 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_rattles", 4.0 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_beeps", 0.3 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_hydraulics", 1.0 );
    maps\_ambient::_id_0B50( "ac130", "elm_ac130_metal_stress", 0.3 );
    maps\_ambient::_id_0B50( "ac130", "null", 1.0 );
    maps\_ambient::_id_0B51( "ac130" );
    level waittill( "action moment" );
    maps\_ambient::_id_0B51( "action ambient" );
}

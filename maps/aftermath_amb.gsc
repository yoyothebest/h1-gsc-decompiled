// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_0B47["exterior"] = "ambient_aftermath_ext0";
    thread _id_A5A4::_id_7DB9( "exterior" );
    maps\_ambient::_id_0B4F( "exterior", 8.0, 20.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_wind_leafy", 6.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_rubble", 6.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_industry", 6.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_stress", 6.0 );
    maps\_ambient::_id_0B50( "exterior", "elm_metal_stress", 6.0 );
    maps\_ambient::_id_0B50( "exterior", "null", 1.0 );
    maps\_ambient::_id_0B51( "interior_vehicle" );
    level waittill( "action moment" );
    maps\_ambient::_id_0B51( "action ambient" );
}

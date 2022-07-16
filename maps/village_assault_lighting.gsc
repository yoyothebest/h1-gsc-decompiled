// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    level.cheat_highcontrast_override = "_night";
    thread _id_80C6();
    thread _id_7E68();
    thread _id_8106();
    thread _id_A54E::_id_694A( "firelight_motion_06", "heli_fire_01" );
    thread _id_A54E::_id_694A( "firelight_motion_05", "gas_station_flicker_01" );
    level.default_clut = "clut_village_assault";
    level.default_lightset = "village_assault";
    level.default_visionset = "village_assault";
    level.nightvisionlightset = "village_assault_nightvision";
    _func_144( "village_assault_nightvision" );
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
    _func_0D6( "r_specularColorScale", "4.5" );
    _id_A5A4::_id_9E6E( "village_assault", 0 );
    level._id_0318 _id_A5A4::set_light_set_player( "village_assault" );
    level._id_0318 _meth_848C( "clut_village_assault", 0.0 );
}

_id_8106()
{
    _id_A54E::_id_23B3( "firelight_motion_05", ( 0.8, 0.6, 0.4 ), 1200, 20, 0.2, 0.8 );
    _id_A54E::_id_23B3( "firelight_motion_06", ( 0.9, 0.6, 0.3 ), 1200, 20, 0.1, 0.8 );
}

goblack( var_0, var_1, var_2 )
{
    var_3 = _func_1A9();
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3.alignx = "left";
    var_3.aligny = "top";
    var_3._id_01F3 = "fullscreen";
    var_3._id_0501 = "fullscreen";
    var_3 _meth_80CE( "black", 640, 480 );
    var_3._id_03D4 = 1;
    var_3.alpha = 0;

    if ( var_1 > 0 )
        var_3 _meth_8086( var_1 );

    var_3.alpha = 1.0;
    wait(var_1);

    if ( !isdefined( var_0 ) )
        return;

    wait(var_0);
    level notify( "fade_from_black" );
    wait 0.1;

    if ( var_2 > 0 )
        var_3 _meth_8086( var_2 );

    var_3.alpha = 0.0;
    wait(var_2);
    var_3 _meth_808A();
}

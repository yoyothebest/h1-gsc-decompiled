// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "seaknight", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_ch46e" );
    _id_A5A8::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_1849( %sniper_escape_ch46_rotors, undefined, 0 );
    _id_A5A8::_id_1873( ::_id_9A3D );
    _id_A5A8::_id_1857( var_2, "cockpit_red_cargo02", "tag_light_cargo02", "fx/misc/aircraft_light_cockpit_red", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cockpit01", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue", "interior", 0.1 );
    _id_A5A8::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_red_blink", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.3 );
    _id_A5A8::_id_1857( var_2, "wingtip_green1", "tag_light_L_wing1", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "wingtip_green2", "tag_light_L_wing2", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "wingtip_red1", "tag_light_R_wing1", "fx/misc/aircraft_light_wingtip_red", "running", 0.2 );
    _id_A5A8::_id_1857( var_2, "wingtip_red2", "tag_light_R_wing2", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    _id_A5A8::_id_1855();
}

_id_4D10()
{
    self._id_65A7 = _func_0EE( self _meth_8184( "tag_origin" ), self _meth_8184( "tag_ground" ) );
    self._id_367F = 652;
    self._id_7957 = 0;
}

_id_7EFA( var_0 )
{
    var_0[1]._id_9CD5 = %ch46_doors_open;
    var_0[1]._id_9CD6 = 0;
    var_0[1]._id_9CD0 = %ch46_doors_close;
    var_0[1]._id_9CD1 = 0;
    var_0[1]._id_9CD7 = "seaknight_door_open";
    var_0[1]._id_9CD2 = "seaknight_door_close";
    var_0[1]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    var_0[2]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    var_0[3]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    var_0[4]._id_27C0 = getanimlength( %ch46_doors_open ) - 1.7;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 6; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_4B63[0] = %seaknight_pilot_idle;
    var_0[0]._id_4B63[1] = %seaknight_pilot_switches;
    var_0[0]._id_4B63[2] = %seaknight_pilot_twitch;
    var_0[0]._id_4B7E[0] = 1000;
    var_0[0]._id_4B7E[1] = 400;
    var_0[0]._id_4B7E[2] = 200;
    var_0[0]._id_1433 = 0;
    var_0[5]._id_1433 = 0;
    var_0[1]._id_4B63 = %ch46_unload_1_idle;
    var_0[2]._id_4B63 = %ch46_unload_2_idle;
    var_0[3]._id_4B63 = %ch46_unload_3_idle;
    var_0[4]._id_4B63 = %ch46_unload_4_idle;
    var_0[5]._id_4B63[0] = %seaknight_copilot_idle;
    var_0[5]._id_4B63[1] = %seaknight_copilot_switches;
    var_0[5]._id_4B63[2] = %seaknight_copilot_twitch;
    var_0[5]._id_4B7E[0] = 1000;
    var_0[5]._id_4B7E[1] = 400;
    var_0[5]._id_4B7E[2] = 200;
    var_0[0]._id_85AE = "tag_detach";
    var_0[1]._id_85AE = "tag_detach";
    var_0[2]._id_85AE = "tag_detach";
    var_0[3]._id_85AE = "tag_detach";
    var_0[4]._id_85AE = "tag_detach";
    var_0[5]._id_85AE = "tag_detach";
    var_0[1]._id_4068 = %ch46_unload_1;
    var_0[2]._id_4068 = %ch46_unload_2;
    var_0[3]._id_4068 = %ch46_unload_3;
    var_0[4]._id_4068 = %ch46_unload_4;
    var_0[1]._id_3FD2 = %ch46_load_1;
    var_0[2]._id_3FD2 = %ch46_load_2;
    var_0[3]._id_3FD2 = %ch46_load_3;
    var_0[4]._id_3FD2 = %ch46_load_4;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["passengers"][var_0["passengers"].size] = 1;
    var_0["passengers"][var_0["passengers"].size] = 2;
    var_0["passengers"][var_0["passengers"].size] = 3;
    var_0["passengers"][var_0["passengers"].size] = 4;
    var_0["default"] = var_0["passengers"];
    return var_0;
}

_id_7DDA()
{

}

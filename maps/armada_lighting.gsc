// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread _id_80C6();
    thread tv_station_visionset();
    level.cheat_invert_override = "_bright";
    apply_lighting_pass_armada( "armada_ride", 0.0 );
    play_flickering_light();
    setup_lighting_triggers();
    thread play_flickering_light();
    var_0 = getent( "lightshadow", "targetname" );
    var_0 _meth_8494( "force_off" );
    var_0 office_light_force_on();
    _func_0D6( "fx_cast_shadow", 0 );
}

_id_4D05()
{

}

_id_80C6()
{

}

setup_lighting_triggers()
{
    var_0 = getentarray( "script_lightset_change", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::lighting_trigger_think );
}

lighting_trigger_think()
{
    if ( !isdefined( self._id_0398 ) )
        return;

    for (;;)
    {
        self waittill( "trigger" );

        if ( self._id_0398 != level.current_light_set )
            apply_lighting_pass_armada( self._id_0398 );
    }
}

apply_lighting_pass_armada( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "armada_exterior":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada", var_1 );
            _id_A5A4::_id_9E6E( "armada", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_ride":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_ride", var_1 );
            _id_A5A4::_id_9E6E( "armada_ride", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_ride" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_interior_HQ":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_hq", var_1 );
            _id_A5A4::_id_9E6E( "armada_hq", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_interior_HQ" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_interior_TVStation":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_tvs", var_1 );
            _id_A5A4::_id_9E6E( "armada_tvs", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_interior_TVStation" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_TVStation_Hall":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_tvs", var_1 );
            _id_A5A4::_id_9E6E( "armada_tvs", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_TVStation_Hall" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_TVStation_Kitchen":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_tvs", var_1 );
            _id_A5A4::_id_9E6E( "armada_tvs", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_TVStation_Kitchen" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_TVStation_Roof01":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_tvs", var_1 );
            _id_A5A4::_id_9E6E( "armada", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_TVStation_Roof01" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_TVStation_Stairwell":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_tvs", var_1 );
            _id_A5A4::_id_9E6E( "armada_tvs", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_TVStation_Stairwell" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_TVStation_Roof02":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada", var_1 );
            _id_A5A4::_id_9E6E( "armada", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_TVStation_Roof02" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        case "armada_TVStation_End":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada_tvs", var_1 );
            _id_A5A4::_id_9E6E( "armada_tvs", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada_TVStation_End" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
        default:
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "armada", var_1 );
            _id_A5A4::_id_9E6E( "armada", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "armada" );
            level._id_0318 _meth_848C( "clut_armada", var_1 );
            break;
    }

    level.current_light_set = var_0;
}

turn_off_primary_lights()
{
    wait 1;
    var_0 = getentarray( "tv_primary_light", "targetname" );
    var_1 = getentarray( "hq_primary_light", "targetname" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] _meth_81E2( 0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_81E2( 0 );
}

tv_station_visionset()
{
    common_scripts\utility::_id_384A( "tvstation_entered" );
    _id_A5A4::_id_7F00( "armada_tvs", 3 );
}

play_flickering_light()
{
    var_0 = 200;
    var_1 = 6000;
    var_2["on"] = "emt_light_flicker_on";
    var_2["off"] = "emt_light_flicker_off";
    var_2["loop"] = "emt_light_flicker_lp";
    var_2["vol_env"] = [ [ var_0, 0.2 ], [ var_1, 1.0 ] ];
    thread _id_A54E::_id_5D3A( "flicker_1", 0, var_0, var_1, undefined, undefined, 0.5, 1, 0.005, 0.05, undefined, var_2, 100 );
    thread _id_A54E::_id_5D3A( "flicker_2", 0, var_0, var_1, undefined, undefined, 0.01, 5, 0.005, 0.05, undefined, var_2, 100 );
}

office_light_force_on()
{
    var_0 = getentarray( "office_light_trigger_on", "targetname" );
    var_1 = getentarray( "office_light_trigger_off", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::office_light_trigger, self, "force_on" );
    common_scripts\utility::_id_0D13( var_1, ::office_light_trigger, self, "force_off" );
}

office_light_trigger( var_0, var_1 )
{
    for (;;)
    {
        self waittill( "trigger" );
        var_0 _meth_8494( var_1 );
    }
}

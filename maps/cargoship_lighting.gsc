// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precache_lighting_and_fx();
    _id_4D05();
    level.cheat_highcontrast_override = "_night";
    thread _id_80C6();
    thread _id_7E68();
    thread generic_lights_flickering();
    setup_lighting_triggers();
    setup_lights_triggers();
    thread init_emergency_lights();
    thread explosion_lerping();
}

precache_lighting_and_fx()
{
    precacheshader( "overlay_hunted_red" );
    precacheshader( "overlay_hunted_black" );
    precacheshader( "credits_iw_presents" );
    precacheshader( "credits_cod4" );
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

    if ( self._id_0398 == "special" )
    {
        thread special_lighting_trigger_think();
        return;
    }

    for (;;)
    {
        self waittill( "trigger" );

        if ( self._id_0398 != level.current_light_set )
            apply_lighting_pass_cargoship( self._id_0398 );
    }
}

_id_7E68()
{
    _func_0D6( "sm_sunSampleSizeNear", ".5" );
    _func_0D6( "r_specularColorScale", "3" );
    _func_0D6( "sm_cacheSpotShadowsEnabled", 0 );
    _func_0D6( "sm_cacheSunShadowEnabled", 0 );
    _func_0D6( "r_useSunShadowPortals", 1 );
    _func_0D6( "fx_cast_shadow", 0 );
    apply_lighting_pass_cargoship( "cargoship_intro", 0.0 );
}

apply_lighting_pass_cargoship( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "cargoship_intro":
            if ( !isdefined( var_1 ) )
                var_1 = 0.0;

            _id_A5A4::_id_7F00( "cargoship_intro", var_1 );
            _id_A5A4::_id_9E6E( "cargoship_intro", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_intro" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_exterior":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "cargoship_exterior", var_1 );
            _id_A5A4::_id_9E6E( "cargoship_exterior", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_exterior" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_exterior_helitrans_vision":
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_7F00( "cargoship_introtransit", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_exterior" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_interior":
            if ( !isdefined( var_1 ) )
                var_1 = 3.0;

            _id_A5A4::_id_7F00( "cargoship_interior_upperdeck", var_1 );
            _id_A5A4::_id_9E6E( "cargoship_interior_upperdeck", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_interior_upperdeck" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_interior_transition":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            _id_A5A4::_id_7F00( "cargoship_interior_transition", var_1 );
            _id_A5A4::_id_9E6E( "cargoship_interior_transition", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_interior_transition" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_explosion":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            _id_A5A4::_id_7F00( "cargoship_explosion", 0.2 );
            wait 0.3;
            _id_A5A4::_id_9E6E( "cargoship_interior_cargohold_alert", var_1 );
            _id_A5A4::_id_7F00( "cargoship_interior_cargohold_alert_igc", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_interior_cargohold_alert" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_escape":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            _id_A5A4::_id_7F00( "cargoship_interior_cargohold_alert", var_1 );
            _id_A5A4::_id_9E6E( "cargoship_interior_cargohold_alert", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_interior_cargohold_alert" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_exterior_outro":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            _id_A5A4::_id_7F00( "cargoship_exterior_outro", var_1 );
            _id_A5A4::_id_395E( "cargoship_exterior" );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_exterior_outro" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        case "cargoship_outro":
            if ( !isdefined( var_1 ) )
                var_1 = 2.0;

            _id_A5A4::_id_7F00( "cargoship_outro", var_1 );
            _id_A5A4::_id_9E6E( "cargoship_outro", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_outro" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
        default:
            if ( !isdefined( var_1 ) )
                var_1 = 1.0;

            _id_A5A4::_id_9E6E( "cargoship_exterior", var_1 );
            level._id_0318 _id_A5A4::set_light_set_player( "cargoship_exterior" );
            level._id_0318 _meth_848C( "clut_cargoship", var_1 );
            break;
    }

    level.current_light_set = var_0;
}

activate_outside_lights()
{
    level.current_lights = "outside";
    activate_lights( "lights_outside", 1 );
    activate_lights( "lights_inside", 0 );
    activate_lights( "lights_cabin_stern_side", 0 );
    activate_lights( "lights_cabin_stern_side2", 0 );
}

activate_lights( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    var_3 = getentarray( var_0, "targetname" );
    var_4 = common_scripts\utility::_id_40FD( var_0, "targetname" );

    foreach ( var_6 in var_3 )
        var_6 set_light_intensity( !var_1, var_2 );

    foreach ( var_6 in var_4 )
        var_6 set_light_intensity( !var_1, var_2 );
}

set_light_intensity( var_0, var_1 )
{
    var_2 = self;
    var_3 = getentarray( self._id_04A4, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_5._id_7A99 ) && var_5._id_7A99 == "light" )
        {
            var_2 = var_5;
            break;
        }
    }

    if ( isdefined( var_2 ) && ( !isdefined( var_2.tv ) || var_2.tv maps\_interactive_objects::is_tv_emitting_light() ) )
    {
        if ( !isdefined( var_2.old_light_intensity ) )
            var_2.old_light_intensity = var_2 _meth_81E1();

        var_2 _meth_81E2( common_scripts\utility::_id_9294( var_0, 0.0, var_2.old_light_intensity ) );

        if ( isdefined( var_1 ) )
            var_2 _meth_8494( var_1 );
    }
}

setup_lights_triggers()
{
    activate_outside_lights();
    var_0 = getentarray( "script_lights_change", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::lights_trigger_think );
}

lights_trigger_think()
{
    if ( !isdefined( self._id_0398 ) )
        return;

    for (;;)
    {
        self waittill( "trigger" );

        if ( self._id_0398 != level.current_lights )
            apply_lights_change( self._id_0398 );
    }
}

apply_lights_change( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = _func_124( self._id_7A99, ":; " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        var_4 = _func_123( var_3 );
        var_5 = var_4 == "on";
        var_6 = var_4 == "off";

        if ( var_5 || var_6 )
        {
            var_2++;
            var_7 = _func_124( var_1[var_2], ", " );

            for ( var_8 = 0; var_8 < var_7.size; var_8++ )
            {
                var_9 = var_7[var_8];
                activate_lights( var_9, var_5 );
            }
        }
    }

    level.current_lights = var_0;
}

generic_lights_flickering()
{
    thread _id_A54E::_id_5D3A( "flicker_1", 0, 200, 3000, undefined, undefined, 0.005, 0.5, 0.005, 0.05, undefined, undefined, 100 );
}

aftdeck_lights_flickering()
{
    thread _id_A54E::_id_5D3A( "flicker_3", 0, 150, 8000, undefined, undefined, 0.005, 0.5, 0.005, 0.05, undefined, undefined, 100 );
}

cargohold_lights_flickering()
{
    thread _id_A54E::_id_5D3A( "flicker_2", 0, 200, 8000, undefined, undefined, 0.005, 0.5, 0.005, 0.6, undefined, undefined, 100 );
}

sinking_ship_lights_flickering()
{
    thread _id_A54E::_id_5D3A( "flicker_4", 0, 2, 100, undefined, undefined, 0.005, 0.5, 0.005, 0.6, undefined, undefined, 100 );
}

init_emergency_lights()
{
    var_0 = getentarray( "emergency_light", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.code_classname == "light" )
            var_2 _meth_81E2( 0 );
    }
}

activate_emergency_lights()
{
    var_0 = getentarray( "emergency_light", "targetname" );
    var_1 = getentarray( "emergency_light_rotator", "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        var_4 = common_scripts\utility::_id_8959();
        var_4._id_02E2 = var_3._id_02E2;
        var_4.angles = var_3.angles;
        var_4 _meth_804F( var_3 );
        playfxontag( common_scripts\utility::_id_3FA8( "emergency_light" ), var_4, "tag_origin" );
    }

    foreach ( var_7 in var_0 )
    {
        if ( var_7.code_classname == "light" )
            var_7 _meth_81E2( var_7._id_7A18 );

        var_8 = undefined;

        if ( isdefined( var_7._id_7A26 ) )
            var_8 = getent( var_7._id_7A26, "script_linkname" );

        if ( !isdefined( var_8 ) )
            var_8 = var_7;

        var_7 thread emergency_light_rotation( anglestoup( var_8.angles ) );
    }
}

emergency_light_rotation( var_0 )
{
    var_1 = 18;

    for (;;)
    {
        var_2 = _func_24E( self.angles );
        var_2["forward"] = _func_11F( var_0, var_2["forward"], var_1 );
        var_2["right"] = _func_11F( var_0, var_2["right"], var_1 );
        var_2["up"] = _func_0F7( var_2["forward"], var_2["right"] );
        self.angles = _func_0F8( var_2["forward"], var_2["right"], var_2["up"] );
        wait 0.05;
    }
}

explosion_lerping()
{
    common_scripts\utility::_id_384A( "escape_explosion" );
    _id_A54E::_id_56A0( "fire", 0, 250000 );
    _id_A54E::_id_56A0( "fire_crate", 0, 250000 );
    _id_A54E::_id_56A0( "price_fall_fill", 0, 55000 );
    _id_A54E::_id_56A0( "gaz_fall_rim", 1, 20000 );
    wait 8;
    _id_A54E::_id_56A0( "gaz_fall_rim", 0, 0 );
    _id_A54E::_id_56A0( "gaz_rim", 0, 65000 );
    wait 5;
    _id_A54E::_id_56A0( "price_fill", 0, 65000 );
    _id_A54E::_id_56A0( "price_bounce", 0, 15000 );
    _id_A54E::_id_56A0( "price_fall_fill", 1, 0 );
    common_scripts\utility::_id_384A( "escape_get_to_catwalks" );
    _id_A54E::_id_56A0( "price_fill", 1, 0 );
    _id_A54E::_id_56A0( "gaz_rim", 1, 0 );
    _id_A54E::_id_56A0( "price_bounce", 1, 0 );
}

special_lighting_trigger_think()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( common_scripts\utility::_id_382E( "escape_exterior_visionset" ) )
            var_0 = "cargoship_exterior_outro";
        else
            var_0 = "cargoship_exterior";

        if ( var_0 != level.current_light_set )
            apply_lighting_pass_cargoship( var_0 );
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1 )
{
    if ( !isdefined( level._id_058F ) )
        level._id_058F = [];

    level._id_058F["flare_runner_intro"] = loadfx( "fx/misc/flare_start" );
    level._id_058F["flare_runner"] = loadfx( "fx/misc/flare" );
    level._id_058F["flare_runner_fizzout"] = loadfx( "fx/misc/flare_end" );
    _id_A5A8::_id_186C( "flare", var_0, var_1, "script_vehicle_flare" );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1856( 9999 );
}

_id_4D10()
{

}

merge_suncolor( var_0, var_1, var_2, var_3 )
{
    wait(var_0);
    var_1 *= 20;
    var_4 = [];

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        var_6 = var_5 / var_1;
        level.thedif = var_6;
        var_7 = [];

        for ( var_8 = 0; var_8 < 3; var_8++ )
            var_7[var_8] = var_3[var_8] * var_6 + var_2[var_8] * ( 1 - var_6 );

        level.sun_color = ( var_7[0], var_7[1], var_7[2] );
        wait 0.05;
    }
}

merge_sunsingledvar( var_0, var_1, var_2, var_3, var_4 )
{
    _func_0D6( var_0, var_3 );
    wait(var_1);
    var_2 *= 20;
    var_5 = [];

    for ( var_6 = 0; var_6 < var_2; var_6++ )
    {
        var_7 = var_6 / var_2;
        level.thedif = var_7;
        var_8 = var_4 * var_7 + var_3 * ( 1 - var_7 );
        _func_0D6( var_0, var_8 );
        wait 0.05;
    }

    _func_0D6( var_0, var_4 );
}

merge_sunbrightness( var_0, var_1, var_2, var_3 )
{
    wait(var_0);
    var_1 *= 20;
    var_4 = [];

    for ( var_5 = 0; var_5 < var_1; var_5++ )
    {
        var_6 = var_5 / var_1;
        level.thedif = var_6;
        var_7 = var_3 * var_6 + var_2 * ( 1 - var_6 );
        level.sun_brightness = var_7;
        wait 0.05;
    }

    level.sun_brightness = var_3;
}

normalized_color( var_0 )
{
    var_1 = 1.0;

    if ( var_0[0] > var_0[1] )
    {
        if ( var_0[0] > var_0[2] )
            var_1 = var_0[0];
        else
            var_1 = var_0[2];
    }
    else if ( var_0[1] > var_0[2] )
        var_1 = var_0[1];
    else
        var_1 = var_0[2];

    if ( var_1 < 0.01 )
        return var_0;

    var_0[0] /= var_1;
    var_0[1] /= var_1;
    var_0[2] /= var_1;
    return var_0;
}

combine_sunlight_and_brightness()
{
    level endon( "stop_combining_sunlight_and_brightness" );
    wait 0.05;

    for (;;)
    {
        var_0 = level.sun_brightness;

        if ( var_0 > 0.01 )
            var_0 *= ( 0.8 + _func_0B3( 0.4 ) );

        var_1 = level.sun_color * var_0;
        _func_047( var_1[0], var_1[1], var_1[2] );
        wait 0.05;
    }
}

flare_path()
{
    thread _id_A5A8::_id_427A( self );
    common_scripts\utility::_id_384A( "flare_stop_setting_sundir" );
    self delete();
}

flare_initial_fx()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_80B3( "tag_origin" );
    var_0 _meth_804F( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    playfxontag( level._id_058F["flare_runner_intro"], var_0, "tag_origin" );
    self waittillmatch( "noteworthy", "flare_intro_node" );
    var_0 delete();
}

flare_explodes()
{
    common_scripts\utility::_id_383F( "flare_start_setting_sundir" );
    level.red_suncolor = [];
    level.red_suncolor[0] = 1.0;
    level.red_suncolor[1] = 0.05;
    level.red_suncolor[2] = 0.05;
    level.red_suncolor = normalized_color( level.red_suncolor );
    level.red_suncolor = ( common_scripts\utility::_id_576F( level.red_suncolor[0] ), common_scripts\utility::_id_576F( level.red_suncolor[1] ), common_scripts\utility::_id_576F( level.red_suncolor[2] ) );
    level.red_sunbrightness = 0.015;
    level.original_suncolor = _func_046();
    level.original_brightness = 0.0;
    level.sun_color = normalized_color( level.original_suncolor );
    level.sun_brightness = level.original_brightness;
    thread merge_sunsingledvar( "sm_sunSampleSizeNear", 0, 1.0, 0.25, 1 );
    thread combine_sunlight_and_brightness();
    thread merge_suncolor( 0, 1.0, normalized_color( level.original_suncolor ), level.red_suncolor );
    thread merge_sunbrightness( 0, 1.0, level.original_brightness, level.red_sunbrightness );

    if ( isdefined( level.flare_fog ) )
        _id_A5A4::_id_9E6E( level.flare_fog, 1.0 );

    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_80B3( "tag_origin" );
    var_0 _meth_804F( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    playfxontag( level._id_058F["flare_runner"], var_0, "tag_origin" );
    self waittillmatch( "noteworthy", "flare_fade_node" );
    var_0 delete();
}

flare_burns_out()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_80B3( "tag_origin" );
    var_0 _meth_804F( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    playfxontag( level._id_058F["flare_runner_fizzout"], var_0, "tag_origin" );
    var_0 thread _id_A5A4::_id_69C6( "flare_runner_fizzout" );
    thread merge_sunsingledvar( "sm_sunSampleSizeNear", 0, 1, 1, 0.5 );
    thread merge_sunbrightness( 0, 1, level.red_sunbrightness, level.original_brightness );
    thread merge_suncolor( 0, 0.01, level.red_suncolor, normalized_color( level.original_suncolor ) );

    if ( isdefined( level.flare_fog_return ) )
        _id_A5A4::_id_9E6E( level.flare_fog_return, 1 );

    thread _id_A5A8::volume_down( 1 );
    wait 1.0;
    level notify( "stop_combining_sunlight_and_brightness" );
    wait 0.1;
    common_scripts\utility::_id_383F( "flare_stop_setting_sundir" );
    waitframe;
    var_0 delete();
    _func_04E();
    _func_048();
    common_scripts\utility::_id_383F( "flare_complete" );
}

_id_3891()
{
    flare_initial_fx();
    flare_explodes();
    flare_burns_out();
}

flag_flare( var_0 )
{
    if ( !isdefined( level._id_382E[var_0] ) )
    {
        common_scripts\utility::_id_383D( var_0 );
        return;
    }
}

flare_from_targetname( var_0 )
{
    var_1 = _id_A5A8::_id_8978( var_0 );
    flag_flare( "flare_in_use" );
    flag_flare( "flare_complete" );
    flag_flare( "flare_stop_setting_sundir" );
    flag_flare( "flare_start_setting_sundir" );
    common_scripts\utility::_id_3857( "flare_in_use" );
    common_scripts\utility::_id_383F( "flare_in_use" );
    _func_048();
    _func_04E();
    var_1 thread flare_path();
    var_1 thread _id_3891();
    var_2 = _func_049();
    var_3 = var_2;
    var_4 = var_3 * -100;
    common_scripts\utility::_id_384A( "flare_start_setting_sundir" );
    var_5 = getent( var_1._id_7A26, "script_linkname" )._id_02E2;
    var_3 = _func_115( var_1._id_02E2 - var_5 );
    var_6 = anglestoforward( var_3 );

    for (;;)
    {
        wait 0.05;

        if ( common_scripts\utility::_id_382E( "flare_stop_setting_sundir" ) )
            break;

        var_3 = _func_115( var_1._id_02E2 - var_5 );
        var_7 = anglestoforward( var_3 );
        _func_04C( var_6, var_7, 0.05 );
        var_6 = var_7;
    }

    common_scripts\utility::_id_384A( "flare_complete" );
    waitframe;
    common_scripts\utility::_id_3831( "flare_complete" );
    common_scripts\utility::_id_3831( "flare_stop_setting_sundir" );
    common_scripts\utility::_id_3831( "flare_start_setting_sundir" );
    _func_048();
    _func_04E();
    common_scripts\utility::_id_3831( "flare_in_use" );
}

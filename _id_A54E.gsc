// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5705()
{
    if ( !isdefined( level._id_05E0 ) )
    {
        level._id_05E0 = spawnstruct();
        _id_5710();
        _id_570D();
        _id_570E();
        _id_570F();
        _id_5711();
        _id_5707();
        thread _id_4D54();
    }

    thread setup_emissive_modifiers();
}

_id_4D54()
{
    level._id_7B2B = 0;
    level._id_78B8 = undefined;
    wait 0.05;
}

_id_33F3( var_0 )
{
    var_1 = level._id_78B7[var_0];
    var_1._id_8D56 = 0;
    var_1._id_96D5[0] = 0;
    thread _id_33F2( 0, var_1 );

    for ( var_4 = 1; var_4 < var_1._id_96D5.size; var_4++ )
        _id_A5A4::_id_27EF( var_1._id_04B7[var_4], ::_id_33F2, var_4, var_1 );
}

_id_7B33( var_0, var_1 )
{
    var_2 = getdvarint( "scr_prim_edit_lights" );
    var_3 = getdvarint( "scr_prim_light_state" );
    var_4 = getdvarint( "scr_prim_light_num" );
    var_5 = var_0._id_4E9E["curr"];

    while ( var_0.active )
    {
        var_6 = var_0._id_6E57["curr"];
        var_7 = var_0._id_2A68["curr"];
        var_8 = _func_114( anglestoforward( var_0._id_2A68["curr"] ) );
        var_9 = var_0._id_6E57["curr"];
        var_10 = var_0._id_4E9E["curr"];
        var_11 = var_0.color["curr"];
        var_12 = var_0._id_4E3E["curr"];
        var_13 = var_0._id_65BE["curr"];
        var_14 = var_0._id_0351["curr"];
        var_15 = var_0._id_5708;

        if ( isdefined( var_0._id_0DDE ) )
        {
            var_19 = var_0._id_0DF0._id_02E2;
            var_20 = _func_114( anglestoforward( var_0._id_0DF0.angles ) );
            var_21 = _func_114( anglestoup( var_0._id_0DF0.angles ) );
            var_22 = _func_114( anglestoright( var_0._id_0DF0.angles ) );
            var_23 = _func_114( var_20 * var_8[0] + var_21 * var_8[2] - var_22 * var_8[1] );
            var_24 = var_20 * var_6[0] + var_21 * var_6[2] - var_22 * var_6[1];
            var_0._id_6F80 _meth_8051();
            var_0._id_6F80.angles = _func_115( var_23 );
            var_0._id_6F80._id_02E2 = var_19 + var_24;

            if ( isdefined( var_0._id_2004 ) )
            {
                var_25 = var_0._id_2004 _meth_8184( var_0._id_2003 );
                var_0._id_6F80.angles = _func_115( _func_114( var_25 - var_0._id_6F80._id_02E2 ) );
            }

            if ( isdefined( var_0._id_2005 ) )
                var_0._id_6F80.angles = _func_115( _func_114( var_0._id_2005 - var_0._id_6F80._id_02E2 ) );

            var_0._id_6F80 _meth_804F( var_0._id_0DF0 );
        }
        else
        {
            var_0._id_6F80.angles = var_7;

            if ( isdefined( var_0._id_2004 ) )
            {
                var_25 = var_0._id_2004 _meth_8184( var_0._id_2003 );
                var_0._id_6F80.angles = _func_115( _func_114( var_25 - var_0._id_6F80._id_02E2 ) );
            }

            if ( isdefined( var_0._id_2005 ) )
                var_0._id_6F80.angles = _func_115( _func_114( var_0._id_2005 - var_0._id_6F80._id_02E2 ) );

            var_0._id_6F80._id_02E2 = var_6;
        }

        var_0._id_6F80 _meth_81E2( var_10 );
        var_0._id_6F80 _meth_8046( var_11 );
        var_0._id_6F80 _meth_8020( var_13, var_12 );
        var_0._id_6F80 _meth_8048( var_14 );
        wait 0.05;
    }
}

_id_33F2( var_0, var_1 )
{
    var_2 = var_1._id_96D5[var_0] * 20.0;
    var_3 = var_0 - 1;

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        var_5 = _func_0BD( var_4 ) / var_2;
        var_6 = 1.0 - var_5;
        var_1._id_6E57["curr"] = var_1._id_6E57[var_0] * var_5 + var_1._id_6E57[var_3] * var_6;
        var_1._id_2A68["curr"] = var_1._id_2A68[var_0] * var_5 + var_1._id_2A68[var_3] * var_6;
        var_1._id_4E9E["curr"] = var_1._id_4E9E[var_0] * var_5 + var_1._id_4E9E[var_3] * var_6;
        var_1.color["curr"] = var_1.color[var_0] * var_5 + var_1.color[var_3] * var_6;
        var_1._id_4E3E["curr"] = var_1._id_4E3E[var_0] * var_5 + var_1._id_4E3E[var_3] * var_6;
        var_1._id_65BE["curr"] = var_1._id_65BE[var_0] * var_5 + var_1._id_65BE[var_3] * var_6;
        var_1._id_0351["curr"] = var_1._id_0351[var_0] * var_5 + var_1._id_0351[var_3] * var_6;
        wait 0.05;
    }

    var_1._id_6E57["curr"] = var_1._id_6E57[var_0];
    var_1._id_2A68["curr"] = var_1._id_2A68[var_0];
    var_1._id_4E9E["curr"] = var_1._id_4E9E[var_0];
    var_1.color["curr"] = var_1.color[var_0];
    var_1._id_4E3E["curr"] = var_1._id_4E3E[var_0];
    var_1._id_65BE["curr"] = var_1._id_65BE[var_0];
    var_1._id_0351["curr"] = var_1._id_0351[var_0];
    var_1._id_8D56 = var_0;
}

_id_8EBE( var_0 )
{
    var_1 = level._id_78B7[var_0];
    var_1.active = 0;

    if ( isdefined( var_1._id_0DDE ) )
    {
        if ( isdefined( var_1._id_6F80 ) )
            var_1._id_6F80 _meth_8051();
    }
}

_id_828C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    if ( !isdefined( var_4 ) )
        var_4 = 5000;

    if ( !isdefined( var_5 ) )
        var_5 = ( 1, 1, 1 );

    if ( !isdefined( var_6 ) )
        var_6 = 60;

    if ( !isdefined( var_7 ) )
        var_7 = 120;

    if ( !isdefined( var_10 ) )
        var_10 = 50;

    var_11 = spawnstruct();
    var_11._id_5708 = var_1;
    var_11._id_04B7[0] = 0;
    var_11._id_2A68[0] = var_3;
    var_11._id_6E57[0] = var_2;
    var_11.active = 1;
    var_11.color[0] = var_5;
    var_11._id_4E3E[0] = var_6;
    var_11._id_65BE[0] = var_7;
    var_11._id_0351[0] = var_10;
    var_11._id_4E9E[0] = var_4;
    var_11._id_96D5[0] = 0;
    var_11._id_2A68["curr"] = var_3;
    var_11._id_6E57["curr"] = var_2;
    var_11.color["curr"] = var_5;
    var_11._id_4E3E["curr"] = var_6;
    var_11._id_65BE["curr"] = var_7;
    var_11._id_0351["curr"] = var_10;
    var_11._id_4E9E["curr"] = 0.1;
    var_11._id_8D56 = -1;
    var_11._id_6F80 = getent( var_0, "targetname" );
    var_11._id_0DDE = undefined;
    var_11._id_0DDA = undefined;
    var_12 = undefined;

    if ( isstring( var_8 ) )
    {
        if ( isstring( var_8 ) )
        {
            var_12 = getent( var_8, "targetname" );
            var_11._id_0DDE = var_12;
        }
    }
    else
        var_12 = var_8;

    if ( isdefined( var_12 ) )
    {
        var_11._id_0DDE = var_12;

        if ( !isdefined( var_11._id_0DDE ) )
            var_11._id_0DDE = undefined;

        if ( isdefined( var_9 ) && isdefined( var_11._id_0DDE ) )
            var_11._id_0DDA = var_9;
        else
            var_11._id_0DDA = undefined;

        var_11._id_0DF0 = common_scripts\utility::_id_8959();

        if ( isdefined( var_9 ) )
        {
            var_11._id_0DF0._id_02E2 = var_12 _meth_8184( var_9 );
            var_11._id_0DF0 _meth_804F( var_12, var_9, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        }
        else
        {
            var_11._id_0DF0._id_02E2 = var_12._id_02E2;
            var_11._id_0DF0 _meth_804F( var_12 );
        }

        var_13 = var_11._id_0DF0._id_02E2;
        var_14 = _func_114( anglestoforward( var_11._id_0DF0.angles ) );
        var_15 = _func_114( anglestoup( var_11._id_0DF0.angles ) );
        var_16 = _func_114( anglestoright( var_11._id_0DF0.angles ) );
        var_17 = _func_114( var_14 * var_3[0] + var_15 * var_3[2] - var_16 * var_3[1] );
        var_18 = var_14 * var_2[0] + var_15 * var_2[2] - var_16 * var_2[1];
        var_11._id_6F80.angles = _func_115( var_17 );
        var_11._id_6F80._id_02E2 = var_13 + var_18;

        if ( !isdefined( var_11._id_6F80._id_5792 ) )
        {
            var_11._id_6F80._id_5792 = 1;
            var_11._id_6F80 _meth_806B();
        }

        var_11._id_6F80 _meth_804F( var_11._id_0DF0 );
    }
    else
    {
        var_11._id_0DDE = undefined;
        var_11._id_0DDA = undefined;
    }

    var_19 = 0;

    if ( isdefined( level._id_78B7 ) )
        var_19 = level._id_78B7.size;

    var_11._id_4B53 = var_19;
    level._id_78B7[var_19] = var_11;
    thread _id_7B33( var_11, var_11._id_4B53 );
    return var_11._id_4B53;
}

_id_7B2A( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_78B7[var_0];

    if ( isdefined( var_2 ) )
    {
        var_1 = undefined;

        if ( !isdefined( var_3 ) )
            var_3 = "tag_origin";
    }
    else if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    level._id_78B7[var_0]._id_2003 = var_3;
    level._id_78B7[var_0]._id_2005 = var_1;
    level._id_78B7[var_0]._id_2004 = var_2;
}

_id_7B2D( var_0, var_1, var_2, var_3 )
{
    _id_7B2C( var_0, var_1, undefined, undefined, undefined, var_2, undefined, undefined, undefined, var_3 );
}

_id_7B31( var_0, var_1, var_2, var_3 )
{
    _id_7B2C( var_0, var_1, var_2, undefined, undefined, undefined, undefined, undefined, undefined, var_3 );
}

_id_7B2F( var_0, var_1, var_2, var_3 )
{
    _id_7B2C( var_0, var_1, undefined, var_2, undefined, undefined, undefined, undefined, undefined, var_3 );
}

_id_7B30( var_0, var_1, var_2, var_3 )
{
    _id_7B2C( var_0, var_1, undefined, var_2, undefined, undefined, undefined, undefined, undefined, var_3 );
}

_id_7B2E( var_0, var_1, var_2, var_3, var_4 )
{
    _id_7B2C( var_0, var_1, undefined, undefined, undefined, var_2, var_3, undefined, undefined, var_4 );
}

_id_7B32( var_0, var_1, var_2, var_3 )
{
    _id_7B2C( var_0, var_1, undefined, undefined, undefined, undefined, undefined, undefined, var_2, var_3 );
}

_id_7B2C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = level._id_78B7[var_0];
    var_11 = var_10._id_04B7.size;

    if ( !isdefined( var_3 ) )
        var_3 = var_10._id_2A68[var_11 - 1];

    if ( !isdefined( var_2 ) )
        var_2 = var_10._id_6E57[var_11 - 1];

    if ( !isdefined( var_4 ) )
        var_4 = var_10._id_4E9E[var_11 - 1];

    if ( !isdefined( var_5 ) )
        var_5 = var_10.color[var_11 - 1];

    if ( !isdefined( var_6 ) )
        var_6 = var_10._id_4E3E[var_11 - 1];

    if ( !isdefined( var_7 ) )
        var_7 = var_10._id_65BE[var_11 - 1];

    if ( !isdefined( var_8 ) )
        var_8 = var_10._id_0351[var_11 - 1];

    var_10._id_04B7[var_11] = var_1;
    var_10._id_6E57[var_11] = var_2;
    var_10._id_2A68[var_11] = var_3;
    var_10._id_4E9E[var_11] = var_4;
    var_10.color[var_11] = var_5;
    var_10._id_4E3E[var_11] = var_6;
    var_10._id_65BE[var_11] = var_7;
    var_10._id_0351[var_11] = var_8;
    var_10._id_96D5[var_11] = var_9;
}

model_animation_light( var_0 )
{
    var_1 = var_0["targetname"];
    var_2 = var_0["anim_tree_name"];
    var_3 = var_0["anim_name"];
    var_4 = var_0["anim_tag"];
    var_5 = var_0["link_tag"];
    var_6 = var_0["link_origin_offset"];
    var_7 = var_0["link_angles_offset"];
    var_8 = var_0["fxids"];
    var_9 = var_0["min_delay"];
    var_10 = var_0["max_delay"];
    var_11 = var_0["ender"];

    if ( !isdefined( var_9 ) )
        var_9 = 0.1;

    if ( !isdefined( var_10 ) )
        var_10 = 1.0;

    if ( !isdefined( var_6 ) )
        var_6 = ( 0, 0, 0 );

    if ( !isdefined( var_7 ) )
        var_7 = ( 0, 0, 0 );

    self endon( "death" );

    if ( isdefined( var_11 ) )
        level endon( var_11 );

    var_12 = getentarray( var_1, "targetname" );

    foreach ( var_14 in var_12 )
    {
        if ( !isdefined( var_14._id_04A4 ) )
            continue;

        var_14._id_0C72 = var_2;
        var_14 _id_A510::_id_7F29();
        var_14 thread _id_A510::_id_0BE1( var_14, var_3, var_4 );
        var_15 = getent( var_14._id_04A4, "targetname" );
        var_16 = common_scripts\utility::_id_8959();
        var_16 _meth_804F( var_14, var_5, var_6, var_7 );
        var_15 thread _id_A5A4::_id_5972( var_16 );

        if ( isdefined( var_8 ) )
        {
            foreach ( var_18 in var_8 )
                playfxontag( level._id_058F[var_18], var_14, var_5 );
        }

        wait(_func_0B5( var_9, var_10 ));
    }
}

_id_5710()
{
    if ( _func_23A() )
    {
        _func_0D6( "r_veil", 1 );
        _func_0D6( "r_veilStrength", 0.087 );
        _func_0D6( "r_tonemap", 2 );
        _func_0D6( "r_tonemapBlack", 0.0 );
        _func_0D6( "r_tonemapCrossover", 1.0 );
        _func_0D6( "r_tonemapHighlightRange", 16.0 );
        _func_0D6( "r_tonemapDarkEv", 2.84 );
        _func_0D6( "r_tonemapMidEv", 7.823 );
        _func_0D6( "r_tonemapLightEv", 12.81 );
        _func_0D6( "r_tonemapDarkExposureAdjust", -3.17 );
        _func_0D6( "r_tonemapMidExposureAdjust", -0.0651 );
        _func_0D6( "r_tonemapLightExposureAdjust", 1.47 );
        _func_0D6( "r_tonemapMinExposureAdjust", -3.17 );
        _func_0D6( "r_tonemapMaxExposureAdjust", 2.3 );

        if ( level._id_034A )
            _func_0D6( "r_tonemapShoulder", 0.4 );
        else
            _func_0D6( "r_tonemapShoulder", 0.94 );

        _func_0D6( "r_tonemapToe", 0.0 );
        _func_0D6( "r_tonemapWhite", 512 );
        _func_0D6( "r_tonemapAdaptSpeed", 0.02 );
        _func_0D6( "r_tonemapLockAutoExposureAdjust", 0 );
        _func_0D6( "r_tonemapAutoExposureAdjust", 0.0 );
        _func_0D6( "r_tonemapExposure", -10.0 );
        _func_0D6( "r_tonemapMaxExposure", -10.0 );
    }

    if ( _func_23B() )
    {
        _func_0D6( "r_ssaoPower", 12.0 );
        _func_0D6( "r_ssaoStrength", 0.45 );
        _func_0D6( "r_ssaominstrengthdepth", 25.0 );
        _func_0D6( "r_ssaomaxstrengthdepth", 40.0 );
    }

    set_r_hbaodvars();
}

_id_7919( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = _func_1AA( level._id_0318 );
    var_8._id_0530 = 0;
    var_8._id_0538 = 0;
    var_8._id_03E3 = 1;
    var_8.alignx = "left";
    var_8.aligny = "top";
    var_8._id_03D4 = 1;
    var_8._id_0198 = 0;
    var_8._id_01F3 = "fullscreen";
    var_8._id_0501 = "fullscreen";
    var_8.alpha = var_4;
    var_8 thread _id_1E7A();

    if ( isdefined( var_5 ) )
        var_8._id_0530 = var_5;

    if ( isdefined( var_6 ) )
        var_8._id_0538 = var_6;

    if ( isdefined( var_7 ) )
        var_8._id_03D4 = var_7;

    if ( _func_0CE( var_1 ) )
    {
        foreach ( var_10 in var_1 )
            var_8 _meth_80CE( var_10, 640, 480 );
    }
    else
        var_8 _meth_80CE( var_1, 640, 480 );

    if ( var_0 > 0 )
    {
        var_8.alpha = 0;
        var_12 = 1;

        if ( isdefined( var_2 ) )
            var_12 = var_2;

        var_13 = 1;

        if ( isdefined( var_3 ) )
            var_13 = var_3;

        var_14 = 1;

        if ( isdefined( var_4 ) )
            var_14 = _func_0E9( var_4, 0.0, 1.0 );

        var_15 = 0.05;

        if ( var_12 > 0 )
        {
            var_16 = 0;
            var_17 = var_14 / ( var_12 / var_15 );

            while ( var_16 < var_14 )
            {
                var_8.alpha = var_16;
                var_16 += var_17;
                wait(var_15);
            }
        }

        var_8.alpha = var_14;
        wait(var_0 - var_12 + var_13);

        if ( var_13 > 0 )
        {
            var_16 = var_14;
            var_18 = var_14 / ( var_13 / var_15 );

            while ( var_16 > 0 )
            {
                var_8.alpha = var_16;
                var_16 -= var_18;
                wait(var_15);
            }
        }

        var_8.alpha = 0;
        var_8 _meth_808A();
    }

    level._id_65F6 = var_8;
    return level._id_65F6;
}

_id_1E7A()
{
    level waittill( "end_screen_effect" );
    self _meth_808A();
}

_id_14B7()
{

}

_id_2A6F()
{
    var_0 = _func_1AA( level._id_0318 );
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "fullscreen_dirt_bottom", 640, 480 );
    var_0 _meth_80CE( "fullscreen_dirt_bottom_b", 640, 480 );
    var_0 _meth_80CE( "fullscreen_dirt_left", 640, 480 );
    var_0 _meth_80CE( "fullscreen_dirt_right", 640, 480 );
    var_0._id_03E3 = 1;
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_03D4 = 1;
    var_0._id_0198 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 1;
    var_0 _meth_8086( 3 );
    var_0.alpha = 0;
}

_id_1509( var_0 )
{
    self endon( "stop_mask_bob" );
    var_1 = 0;
    var_2 = level._id_0318 _meth_8338();
    var_3 = 0;
    var_4 = 0;
    var_5 = var_0._id_0538;
    var_6 = var_0._id_0530;
    var_7 = 0.05;

    for (;;)
    {
        if ( isdefined( var_0 ) )
        {
            var_8 = level._id_0318 _meth_8338();
            var_9 = level._id_0318 _meth_8336();
            var_10 = var_9[2];
            var_9 -= var_9 * ( 0, 0, 1 );
            var_11 = _func_0F1( var_9 );
            var_12 = level._id_0318 _meth_8180();
            var_13 = _func_0E9( var_11, 0, 280 ) / 280;
            var_14 = 0.1 + var_13 * 0.25;
            var_15 = 0.1 + var_13 * 0.25;
            var_16 = 1.0;

            if ( var_12 == "crouch" )
                var_16 = 0.75;

            if ( var_12 == "prone" )
                var_16 = 0.4;

            if ( var_12 == "stand" )
                var_16 = 1.0;

            var_17 = 5.0;
            var_18 = 0.9;
            var_19 = level._id_0318 _meth_833D();
            var_20 = var_17 * ( 1.0 - var_19 ) + var_18 * var_19;
            var_20 *= ( 1 + var_13 * 2 );
            var_21 = 5;
            var_22 = var_21 * var_14 * var_16;
            var_23 = var_21 * var_15 * var_16;
            var_1 += var_7 * 1000.0 * var_20;
            var_24 = 57.2958;
            var_25 = _func_0B6( var_1 * 0.001 * var_24 );
            var_26 = _func_0B6( var_1 * 0.0007 * var_24 );
            var_27 = _func_0EB( var_8[1] - var_2[1] );
            var_27 = _func_0E9( var_27, -10, 10 );
            var_28 = var_27 / 10 * var_21 * ( 1 - var_14 );
            var_29 = var_28 - var_4;
            var_4 += _func_0E9( var_29, -1.0, 1.0 );
            var_30 = _func_0E9( var_10, -200, 200 ) / 200 * var_21 * ( 1 - var_15 );
            var_31 = var_30 - var_3;
            var_3 += _func_0E9( var_31, -0.6, 0.6 );
            var_0 _meth_8088( 0.05 );
            var_0._id_0530 = var_6 + _func_0E9( var_25 * var_22 + var_4 - var_21, 0 - 2 * var_21, 0 );
            var_0._id_0538 = var_5 + _func_0E9( var_26 * var_23 + var_3 - var_21, 0 - 2 * var_21, 0 );
            var_2 = var_8;
        }

        wait(var_7);
    }
}

_id_3C29( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 0.25;

    if ( var_0 )
        _id_A546::_id_35E3( var_1 );

    self._id_3C24 = _func_1AA( self );
    self._id_3C24._id_0530 = 0;
    self._id_3C24._id_0538 = 0;
    self._id_3C24._id_01F3 = "fullscreen";
    self._id_3C24._id_0501 = "fullscreen";
    self._id_3C24._id_0198 = 0;
    self._id_3C24._id_03D4 = -1;
    self._id_3C24 _meth_80CE( "gasmask_overlay_delta2_top", 650, 138 );
    self._id_3C24.alpha = 1.0;
    self._id_3C25 = _func_1AA( self );
    self._id_3C25._id_0530 = 0;
    self._id_3C25._id_0538 = 352;
    self._id_3C25._id_01F3 = "fullscreen";
    self._id_3C25._id_0501 = "fullscreen";
    self._id_3C25._id_0198 = 0;
    self._id_3C25._id_03D4 = -1;
    self._id_3C25 _meth_80CE( "gasmask_overlay_delta2_bottom", 650, 138 );
    self._id_3C25.alpha = 1.0;
    level._id_0318 _id_A5A4::_id_27EF( 1.0, ::_id_3C23 );
    thread _id_1509( self._id_3C24 );
    thread _id_1509( self._id_3C25 );

    if ( var_0 )
    {
        wait(var_3);
        _id_A546::_id_35DC( var_2 );
    }
}

_id_3C27()
{
    _id_A546::_id_35E3( 0.25 );
    self notify( "stop_mask_bob" );

    if ( isdefined( self._id_3C24 ) )
    {
        self._id_3C24 _meth_808A();
        self._id_3C24 = undefined;
    }

    if ( isdefined( self._id_3C25 ) )
    {
        self._id_3C25 _meth_808A();
        self._id_3C25 = undefined;
    }

    level._id_0318 notify( "stop_breathing" );
    wait 0.25;
    _id_A546::_id_35DC( 1.5 );
}

_id_3C23()
{
    var_0 = 1.0;
    self endon( "stop_breathing" );

    for (;;)
    {
        _id_A5A4::_id_69C4( "breathing_gasmask" );
        wait(var_0);
    }
}

_id_3C28()
{
    self._id_3C22 = spawn( "script_model", ( 0, 0, 0 ) );
    self._id_3C22 _meth_80B3( "prop_sas_gasmask" );
    self._id_3C22 _meth_804F( self, "tag_eye", ( -4, 0, 2 ), ( 120, 0, 0 ) );
}

_id_3C26()
{
    if ( isdefined( self._id_3C22 ) )
        self._id_3C22 delete();
}

_id_570F()
{
    _id_23B4( "fire", ( 0.972549, 0.62451, 0.345098 ), ( 0.2, 0.146275, 0.0878432 ), 0.005, 0.2, 8 );
    _id_23B4( "blue_fire", ( 0.445098, 0.62451, 0.972549 ), ( 0.05, 0.150451, 0.307843 ), 0.005, 0.2, 8 );
    _id_23B4( "white_fire", ( 0.972549, 0.972549, 0.972549 ), ( 0.2, 0.2, 0.2 ), 0.005, 0.2, 8 );
    _id_23B4( "white_fire_dim", ( 0.972549, 0.972549, 0.972549 ), ( 0.2, 0.2, 0.2 ), 0.005, 0.2, 0.5 );
    _id_23B4( "street_light", ( 0.972549, 0.972549, 0.972549 ), ( 0.572549, 0.572549, 0.572549 ), 0.005, 0.2, 8 );
    _id_23B4( "pulse", ( 0, 0, 0 ), ( 255, 107, 107 ), 0.2, 1, 8 );
    _id_23B4( "lightbulb", ( 0.972549, 0.62451, 0.345098 ), ( 0.2, 0.146275, 0.0878432 ), 0.005, 0.2, 6 );
    _id_23B4( "fluorescent", ( 0.972549, 0.62451, 0.345098 ), ( 0.2, 0.146275, 0.0878432 ), 0.005, 0.2, 7 );
    _id_23B4( "static_screen", ( 0.63, 0.72, 0.92 ), ( 0.4, 0.43, 0.48 ), 0.005, 0.2, 7 );
    _id_23B4( "sfb_fire", ( 1, 0.65, 0.8 ), ( 0.4, 0.24, 0.3 ), 0.005, 0.2, 8 );
}

_id_23B3( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_05E0._id_38D3 ) )
        level._id_05E0._id_38D3 = [];

    var_6 = spawnstruct();
    var_6.color = var_1;
    var_6._id_4E9E = var_2;
    var_6._id_5A43 = var_3;
    var_6._id_5C42 = var_4;
    var_6._id_5A2C = var_5;
    level._id_05E0._id_38D3[var_0] = var_6;
}

_id_3D71( var_0 )
{
    if ( isdefined( level._id_05E0._id_38D3 ) && isdefined( level._id_05E0._id_38D3[var_0] ) )
        return level._id_05E0._id_38D3[var_0];

    return undefined;
}

_id_694A( var_0, var_1 )
{
    var_2 = getentarray( var_1, "targetname" );

    if ( !isdefined( var_2 ) || var_2.size <= 0 )
        return;

    var_3 = _id_3D71( var_0 );

    if ( !isdefined( var_3 ) )
        return;

    foreach ( var_5 in var_2 )
    {
        var_5 _meth_81E2( var_3._id_4E9E );
        var_5._id_5147 = 1;
        var_5._id_5148 = 0;
        var_5 thread _id_2FD8( var_3.color, var_3._id_4E9E, var_3._id_5A43, var_3._id_5C42, var_3._id_5A2C );
    }

    return var_2;
}

_id_23B4( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_05E0._id_38D4 ) )
        level._id_05E0._id_38D4 = [];

    var_6 = spawnstruct();
    var_6._id_2044 = var_1;
    var_6._id_2046 = var_2;
    var_6._id_5C42 = var_3;
    var_6._id_5A2C = var_4;
    var_6._id_4E9E = var_5;
    level._id_05E0._id_38D4[var_0] = var_6;
}

_id_3D72( var_0 )
{
    if ( isdefined( level._id_05E0._id_38D4 ) && isdefined( level._id_05E0._id_38D4[var_0] ) )
        return level._id_05E0._id_38D4[var_0];

    return undefined;
}

_id_694B( var_0, var_1, var_2 )
{
    var_3 = getent( var_1, "targetname" );

    if ( !isdefined( var_3 ) )
        return;

    var_4 = _id_3D72( var_0 );

    if ( !isdefined( var_4 ) )
        return;

    if ( isdefined( var_2 ) )
    {
        if ( var_2 < 0 )
            var_2 = 0;

        var_4._id_4E9E = var_2;
    }

    var_3 _meth_81E2( var_4._id_4E9E );
    var_3._id_5147 = 1;
    var_3._id_5148 = 0;
    var_3 thread _id_2FD7( var_4._id_2044, var_4._id_2046, var_4._id_5C42, var_4._id_5A2C );
    return var_3;
}

_id_8E8B( var_0, var_1, var_2 )
{
    var_3 = getent( var_1, "targetname" );

    if ( !isdefined( var_3 ) )
        return;

    if ( !isdefined( var_3._id_5147 ) )
        return;

    if ( isdefined( var_2 ) )
    {
        if ( var_2 < 0 )
            var_2 = 0;
    }

    var_3 _meth_81E2( var_2 );
    var_3 notify( "kill_flicker" );
    var_3._id_5147 = undefined;
}

_id_671C( var_0, var_1 )
{
    var_2 = getent( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        return;

    if ( !isdefined( var_2._id_5147 ) )
        return;

    var_2._id_5148 = 1;
}

_id_9A56( var_0, var_1 )
{
    var_2 = getent( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        return;

    if ( !isdefined( var_2._id_5147 ) )
        return;

    var_2._id_5148 = 0;
}

_id_2FD7( var_0, var_1, var_2, var_3 )
{
    self endon( "kill_flicker" );
    var_4 = var_0;
    var_5 = 0.0;

    for (;;)
    {
        if ( self._id_5148 )
        {
            wait 0.05;
            continue;
        }

        var_6 = var_4;
        var_4 = var_0 + ( var_1 - var_0 ) * _func_0B3( 1.0 );

        if ( var_2 != var_3 )
            var_5 += _func_0B5( var_2, var_3 );
        else
            var_5 += var_2;

        if ( var_5 == 0 )
            var_5 += 1e-07;

        for ( var_7 = ( var_6 - var_4 ) * 1 / var_5; var_5 > 0 && !self._id_5148; var_5 -= 0.05 )
        {
            self _meth_8046( var_4 + var_7 * var_5 );
            wait 0.05;
        }
    }
}

_id_2FD8( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "kill_flicker" );
    self _meth_8046( var_0 );
    self _meth_81E2( var_1 );
    thread _id_37B3();
    var_5 = self._id_02E2;
    var_6 = var_2;
    var_7 = var_2;
    var_8 = var_2;
    var_9 = var_3;
    var_10 = var_4;

    for (;;)
    {
        var_11 = _func_0B5( var_9, var_10 );
        var_12 = var_6 * _func_0B5( 0.1, 1 );
        var_13 = var_7 * _func_0B5( 0.1, 1 );
        var_14 = var_8 * _func_0B5( 0.1, 1 );
        var_15 = var_5 + ( var_12, var_13, var_14 );
        self _meth_82AA( var_15, var_11 );
        wait(var_11);

        while ( self._id_5148 )
            wait 0.05;
    }
}

_id_37B3()
{
    var_0 = self _meth_81E1();
    self endon( "kill_flicker" );
    var_1 = var_0;

    for (;;)
    {
        var_2 = _func_0B5( var_0 * 0.5, var_0 * 1.2 );
        var_3 = _func_0B5( 0.2, 1.0 );
        var_3 *= 0.75;

        while ( self._id_5148 )
            wait 0.05;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self _meth_81E2( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

_id_23C6( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_3 = getentarray( var_0, "script_noteworthy" );
    var_2._id_5717 = [];
    var_2._id_5D42 = [];

    foreach ( var_5 in var_3 )
    {
        if ( var_5.classname == "script_model" )
            var_2._id_5D42[var_2._id_5D42.size] = var_5;

        if ( var_5.classname == "light_spot" )
            var_2._id_5717[var_2._id_5717.size] = var_5;
    }

    var_2._id_3BA8 = var_1;
    return var_2;
}

_id_5709( var_0, var_1, var_2 )
{
    foreach ( var_4 in self._id_5717 )
    {
        var_4 _meth_81E2( var_0 );
        var_4 _meth_8046( var_1 );
    }

    if ( var_2 && !isdefined( self._id_A1BC ) )
    {
        common_scripts\_exploder::_id_3528( self._id_3BA8 );

        foreach ( var_7 in self._id_5D42 )
            var_7 _meth_8055();

        self._id_A1BC = 1;
    }
    else if ( isdefined( self._id_A1BC ) && !var_2 )
    {
        _id_A5A4::_id_8E7E( self._id_3BA8 );

        foreach ( var_7 in self._id_5D42 )
            var_7 _meth_8056();

        self._id_A1BC = undefined;
    }
}

_id_38D6( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_0 endon( "kill_flicker" );
    var_7 = 0;
    var_8 = 0.0;

    for (;;)
    {
        var_9 = var_7;
        var_7 = _func_0B3( 1.0 );

        if ( var_5 != var_6 )
            var_8 += _func_0B5( var_5, var_6 );
        else
            var_8 += var_6;

        if ( var_8 == 0 )
            var_8 += 1e-07;

        for ( var_10 = ( var_7 - var_9 ) / var_8; var_8 > 0; var_8 -= 0.05 )
        {
            var_11 = var_7 - var_8 * var_10;
            var_12 = _func_117( var_1, var_3, var_11 );
            var_13 = _id_A5A4::_id_576B( var_11, var_2, var_4 );
            var_14 = var_11 > 0.5;
            var_0 _id_5709( var_13, var_12, var_14 );
            wait 0.05;
        }
    }
}

_id_67D7( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 2;
    var_6 = 3;
    var_7 = 5;

    for (;;)
    {
        var_8 = _func_0E9( _func_102( gettime() * 0.001 * var_5, 0, var_6, 2, var_7 ), 0, 1 );
        var_9 = _func_117( var_1, var_3, var_8 );
        var_10 = _id_A5A4::_id_576B( var_8, var_2, var_4 );
        var_11 = var_8 > 0.5;
        var_0 _id_5709( var_10, var_9, var_11 );
        wait 0.05;
    }
}

_id_56A0( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );

    if ( level._id_00E3 && isdefined( var_3 ) == 0 )
        return;

    var_4 = var_3 _meth_81E1();
    var_3._id_31B2 = var_2;
    var_5 = 0;

    while ( var_5 < var_1 )
    {
        var_6 = var_4 + ( var_2 - var_4 ) * var_5 / var_1;
        var_5 += 0.05;
        var_3 _meth_81E2( var_6 );
        wait 0.05;
    }

    var_3 _meth_81E2( var_2 );
}

_id_56A1( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, "targetname" );

    foreach ( var_5 in var_3 )
    {
        var_6 = var_5 _meth_81E1();
        var_5._id_31B2 = var_2;
        var_7 = 0;

        while ( var_7 < var_1 )
        {
            var_8 = var_6 + ( var_2 - var_6 ) * var_7 / var_1;
            var_7 += 0.05;
            var_5 _meth_81E2( var_8 );
            wait 0.05;
        }

        var_5 _meth_81E2( var_2 );
    }
}

_id_56A2( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );

    if ( level._id_00E3 && isdefined( var_3 ) == 0 )
        return;

    var_4 = var_3 _meth_8047();
    var_3._id_31BE = var_2;
    var_5 = 0;

    while ( var_5 < var_1 )
    {
        var_6 = var_4 + ( var_2 - var_4 ) * var_5 / var_1;
        var_5 += 0.05;
        var_3 _meth_8048( var_6 );
        wait 0.05;
    }

    var_3 _meth_8048( var_2 );
}

_id_7EBE( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );

    if ( level._id_00E3 && isdefined( var_2 ) == 0 )
        return;

    var_2 _meth_81E2( var_1 );
}

_id_569F( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );

    if ( level._id_00E3 && isdefined( var_3 ) == 0 )
        return;

    var_4 = var_3 _meth_8045();
    var_3._id_3157 = var_2;
    var_5 = 0;

    while ( var_5 < var_1 )
    {
        var_6 = var_4 + ( var_2 - var_4 ) * var_5 / var_1;
        var_5 += 0.05;
        var_3 _meth_8046( var_6 );
        wait 0.05;
    }

    var_3 _meth_8046( var_2 );
}

_id_7EBD( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_2 _meth_8046( var_1 );
}

_id_5711()
{
    _id_23D3( "red", 0.1, 0.1, 10000, ( 1, 0.2, 0.2 ), 2 );
    _id_23D3( "red2", 0.1, 0.1, 68200000, ( 1, 0.2, 0.2 ), 2 );
    _id_23D3( "yellow", 0.1, 0.1, 68200000, ( 1, 0.7, 0.2 ), 2 );
    _id_23D3( "white", 0.1, 0.1, 68200000, ( 1, 1, 1 ), 2 );
    _id_23D3( "turbine_pulse", 0.1, 0.1, 10000, ( 0.9, 0.9, 1 ), 2 );
}

_id_23D3( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_05E0._id_7050 ) )
        level._id_05E0._id_7050 = [];

    var_6 = spawnstruct();
    var_6._id_970F = var_1;
    var_6._id_970E = var_2;
    var_6._id_4E9E = var_3;
    var_6._id_2045 = var_4;
    var_6._id_627D = var_5;
    level._id_05E0._id_7050[var_0] = var_6;
}

_id_3E3F( var_0 )
{
    if ( isdefined( level._id_05E0._id_7050 ) && isdefined( level._id_05E0._id_7050[var_0] ) )
        return level._id_05E0._id_7050[var_0];

    return undefined;
}

_id_6995( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0 + var_1 + "_pulse";
    level notify( var_4 );
    level endon( var_4 );
    var_5 = getent( var_1, "targetname" );

    if ( !isdefined( var_5 ) )
        return;

    var_6 = _id_3E3F( var_0 );

    if ( !isdefined( var_6 ) )
        return;

    if ( isdefined( var_2 ) )
    {
        if ( var_2 < 0 )
            var_2 = 0;

        var_6._id_4E9E = var_2;
    }

    var_5 _meth_81E2( var_6._id_4E9E );
    var_5 _meth_8046( var_6._id_2045 );
    var_7 = var_6._id_627D;
    var_8 = var_5 _meth_81E1();
    var_9 = 0.05;
    var_10 = var_8;
    var_11 = var_6._id_970F;
    var_12 = var_6._id_970E;
    var_13 = ( var_8 - var_9 ) / ( var_11 / 0.05 );
    var_14 = ( var_8 - var_9 ) / ( var_12 / 0.05 );
    var_15 = var_6._id_627D;

    for (;;)
    {
        var_16 = 1;
        var_17 = 0;

        while ( var_17 < var_12 )
        {
            var_10 -= var_14;
            var_10 = _func_0E9( var_10, 0, 1000000000 );
            var_5 _meth_81E2( var_10 );
            var_17 += 0.05;
            wait 0.05;
        }

        if ( isdefined( var_3 ) )
            _id_A5A4::_id_8E7E( var_3 );

        wait 0.8;
        var_17 = 0;

        while ( var_17 < var_11 )
        {
            var_10 += var_13;
            var_10 = _func_0E9( var_10, 0, 1000000000 );
            var_5 _meth_81E2( var_10 );
            var_17 += 0.05;
            wait 0.05;
        }

        if ( isdefined( var_3 ) )
            common_scripts\_exploder::_id_3528( var_3 );

        wait 0.1;

        while ( var_16 < var_15 )
        {
            var_17 = 0;

            while ( var_17 < var_12 )
            {
                var_10 -= var_14;
                var_10 = _func_0E9( var_10, 0, 300000 );
                var_5 _meth_81E2( var_10 );
                var_17 += 0.05;
                wait 0.05;
            }

            wait 0.1;
            var_17 = 0;

            while ( var_17 < var_11 )
            {
                var_10 += var_13;
                var_10 = _func_0E9( var_10, 0, 300000 );
                var_5 _meth_81E2( var_10 );
                var_17 += 0.05;
                wait 0.05;
            }

            wait 0.1;
            var_16 += 1;
        }
    }

    return var_5;
}

_id_5D3A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    self endon( "death" );

    if ( isdefined( var_10 ) )
        level endon( var_10 );

    var_13 = getentarray( var_0, "script_noteworthy" );

    if ( !isdefined( var_13 ) )
        return;

    var_14 = [];
    var_15 = [];

    foreach ( var_17 in var_13 )
    {
        if ( var_17.classname == "script_model" )
            var_15[var_15.size] = var_17;

        if ( var_17.classname == "light_spot" || var_17.classname == "light_omni" )
        {
            var_14[var_14.size] = var_17;
            var_18 = var_2;

            if ( var_3 > var_2 )
                var_18 = _func_0B5( var_2, var_3 );

            var_17 _meth_81E2( var_18 );
        }
    }

    var_20 = 0;
    var_21 = undefined;
    var_22 = undefined;
    var_23 = undefined;
    var_24 = undefined;
    var_25 = undefined;
    var_26 = 1;

    if ( _func_0CE( var_11 ) )
    {
        var_21 = var_11["on"];
        var_22 = var_11["off"];
        var_23 = var_11["loop"];
        var_25 = var_11["vol_env"];

        if ( isstring( var_23 ) )
            var_24 = "model_flicker_preset_" + _id_A5E8::_id_8718();
    }

    var_27 = 0;

    if ( isdefined( var_4 ) )
        common_scripts\_exploder::_id_3528( var_4 );

    while ( var_27 < var_1 || var_1 == 0 )
    {
        var_28 = undefined;

        if ( isdefined( var_12 ) )
            var_29 = var_12;
        else
            var_29 = 0.05;

        var_30 = 0.0;

        if ( isdefined( var_6 ) && isdefined( var_7 ) )
            var_31 = _func_0B5( var_6, var_7 );
        else
            var_31 = _func_0B5( 0.1, 0.8 );

        if ( isdefined( var_8 ) && isdefined( var_9 ) )
            var_32 = _func_0B5( var_8, var_9 );
        else
            var_32 = _func_0B5( 0.1, 0.8 );

        foreach ( var_34 in var_14 )
        {
            if ( var_20 )
            {
                if ( isstring( var_24 ) )
                    level notify( var_24 );

                if ( isdefined( var_22 ) )
                    var_34 _id_A5FB::_id_8738( var_22, undefined, undefined, undefined, var_26 );

                var_20 = 0;
            }
        }

        if ( isdefined( var_5 ) )
            _id_A5A4::_id_8E7E( var_5 );

        foreach ( var_37 in var_15 )
            var_37 _meth_8056();

        foreach ( var_40 in var_14 )
        {
            var_28 = var_40 _meth_81E1();
            var_40 _meth_81E2( var_29 );
        }

        wait(var_32);

        foreach ( var_34 in var_14 )
        {
            var_18 = var_2;

            if ( var_3 > var_2 )
                var_18 = _func_0B5( var_2, var_3 );

            var_34 _meth_81E2( var_18 );

            if ( isdefined( var_21 ) && !var_20 )
            {
                if ( _func_0CE( var_25 ) )
                    var_26 = _id_A5E8::_id_8708( var_18, var_25 );

                if ( isdefined( var_21 ) )
                    var_34 _id_A5FB::_id_8738( var_21, undefined, undefined, undefined, var_26 );

                if ( isdefined( var_23 ) )
                    var_34 _id_A5FB::_id_8742( var_23, var_24, 0.0, 0.1, var_26 );

                var_20 = 1;
            }
        }

        if ( isdefined( var_5 ) )
            common_scripts\_exploder::_id_3528( var_5 );

        foreach ( var_37 in var_15 )
            var_37 _meth_8055();

        foreach ( var_40 in var_14 )
            var_40 _meth_81E2( var_28 );

        wait(var_31);

        if ( var_1 != 0 )
            var_27++;
    }
}

_id_570D()
{
    _id_23AB( "default", 1, 1, 4.5, 500, 500, 0.05, 0.5 );
    _id_23AB( "viewmodel_blur", 1, 1, 4.5, 500, 500, 0.05, 0.5 );
    _id_23AB( "close_none_viewmodel_blur", 1, 50, 4, 1000, 7000, 0.05, 0.5 );
    _id_23AB( "river", 1, 104, 4.5, 500, 500, 1.8, 0.5 );
    _id_23AB( "medium_none_viewmodel_blur", 1, 500, 10, 1000, 7000, 0.05, 0.5 );
}

_id_23AB( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( level._id_05E0._id_2C66 ) )
        level._id_05E0._id_2C66 = [];

    var_8 = [];
    var_8["nearStart"] = var_1;
    var_8["nearEnd"] = var_2;
    var_8["nearBlur"] = var_3;
    var_8["farStart"] = var_4;
    var_8["farEnd"] = var_5;
    var_8["farBlur"] = var_6;
    var_8["bias"] = var_7;
    level._id_05E0._id_2C66[var_0] = var_8;
}

_id_5703( var_0 )
{
    if ( isdefined( level._id_05E0._id_2C66 ) && isdefined( level._id_05E0._id_2C66[var_0] ) )
        return level._id_05E0._id_2C66[var_0];
}

_id_1498( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_05E0._id_2C66 ) )
    {
        var_3 = _id_5703( var_0 );
        var_4 = _id_5703( var_1 );

        if ( isdefined( var_3 ) && isdefined( var_4 ) )
            _id_A513::_id_2C4B( var_4["nearStart"], var_4["nearEnd"], var_4["nearBlur"], var_4["farStart"], var_4["farEnd"], var_4["farBlur"], var_2, var_4["bias"] );
        else
        {

        }
    }
}

_id_570E()
{
    _id_23AC( "default", 2, 8 );
    _id_23AC( "viewmodel_blur", 10, 90 );
    _id_23AC( "max", 2, 128 );
}

_id_23AC( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_05E0._id_2C79 ) )
        level._id_05E0._id_2C79 = [];

    var_3["start"] = var_1;
    var_3["end"] = var_2;
    level._id_0318._id_9E1A = var_3["start"];
    level._id_0318._id_9E19 = var_3["end"];
    level._id_05E0._id_2C79[var_0] = var_3;
}

_id_5704( var_0 )
{
    if ( isdefined( level._id_05E0._id_2C79 ) && isdefined( level._id_05E0._id_2C79[var_0] ) )
        return level._id_05E0._id_2C79[var_0];
}

_id_1499( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_05E0._id_2C79 ) )
    {
        var_3 = _id_5704( var_0 );
        var_4 = _id_5704( var_1 );

        if ( isdefined( var_3 ) && isdefined( var_4 ) )
            _id_14A0( var_3, var_4, var_2 );
        else
        {

        }
    }
}

_id_14A0( var_0, var_1, var_2 )
{
    if ( var_2 > 0 )
    {
        var_3 = ( var_1["start"] - var_0["start"] ) * 0.05 / var_2;
        var_4 = ( var_1["end"] - var_0["end"] ) * 0.05 / var_2;
        thread _id_56AE( var_1, var_3, var_4 );
    }
    else
    {
        level._id_0318._id_9E1A = var_1["start"];
        level._id_0318._id_9E19 = var_1["end"];
    }
}

_id_56AE( var_0, var_1, var_2 )
{
    level notify( "lerp_viewmodel_dof" );
    level endon( "lerp_viewmodel_dof" );
    var_3 = 0;
    var_4 = 0;

    while ( !var_3 || !var_4 )
    {
        if ( !var_3 )
        {
            level._id_0318._id_9E1A += var_1;

            if ( var_1 > 0 && level._id_0318._id_9E1A > var_0["start"] || var_1 < 0 && level._id_0318._id_9E1A < var_0["start"] )
            {
                level._id_0318._id_9E1A = var_0["start"];
                var_3 = 1;
            }
        }

        if ( !var_4 )
        {
            level._id_0318._id_9E19 += var_2;

            if ( var_2 > 0 && level._id_0318._id_9E19 > var_0["end"] || var_2 < 0 && level._id_0318._id_9E19 < var_0["end"] )
            {
                level._id_0318._id_9E19 = var_0["end"];
                var_4 = 1;
            }
        }

        level._id_0318 _meth_818B( level._id_0318._id_9E1A, level._id_0318._id_9E19 );
        wait 0.05;
    }
}

_id_5707()
{
    level._id_05E0._id_5BB9 = [];
}

_id_56FF()
{

}

_id_570A( var_0, var_1 )
{
    level._id_05E0._id_5BB9[var_0] = var_1;
}

_id_5706( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_05E0._id_5BB9[var_0] ) )
    {
        if ( isdefined( var_3 ) )
            thread [[ level._id_05E0._id_5BB9[var_0] ]]( var_1, var_2, var_3 );
        else if ( isdefined( var_2 ) )
            thread [[ level._id_05E0._id_5BB9[var_0] ]]( var_1, var_2 );
        else if ( isdefined( var_1 ) )
            thread [[ level._id_05E0._id_5BB9[var_0] ]]( var_1 );
        else
            thread [[ level._id_05E0._id_5BB9[var_0] ]]();
    }
}

_id_568E( var_0, var_1, var_2, var_3, var_4 )
{
    for ( var_5 = 0; var_5 <= var_4; var_5 += 0.05 )
    {
        var_6 = var_5 / var_4;
        self _meth_8020( _id_A5A4::_id_576B( var_6, var_0, var_2 ), _id_A5A4::_id_576B( var_6, var_1, var_3 ) );
        waittillframeend;
    }
}

setup_emissive_modifiers()
{
    var_0 = getentarray( "emissive_intensity_0", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 _meth_83A5( 0.0, 0.0 );

    var_4 = getentarray( "emissive_intensity_25", "targetname" );

    foreach ( var_2 in var_4 )
        var_2 _meth_83A5( 0.25, 0.0 );

    var_7 = getentarray( "emissive_intensity_50", "targetname" );

    foreach ( var_2 in var_7 )
        var_2 _meth_83A5( 0.5, 0.0 );

    var_10 = getentarray( "emissive_intensity_75", "targetname" );

    foreach ( var_2 in var_10 )
        var_2 _meth_83A5( 0.75, 0.0 );

    var_13 = getentarray( "emissive_intensity_100", "targetname" );

    foreach ( var_2 in var_13 )
        var_2 _meth_83A5( 1.0, 0.0 );

    var_16 = getentarray( "emissive_intensity", "targetname" );

    foreach ( var_2 in var_16 )
    {
        var_18 = _func_0BD( var_2._id_0398 ) * 0.01;
        var_2 _meth_83A5( var_18, 0.0 );
    }
}

set_r_hbaodvars()
{
    if ( !level._id_02FB )
        return;

    switch ( level._id_038E )
    {
        case "armada":
        case "airlift":
        case "cargoship":
        case "coup":
        case "jeepride":
        case "killhouse":
            _func_0D6( "r_hbaoStrengthScale", 0.2 );
            break;
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "hunted":
        case "icbm":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            _func_0D6( "r_hbaoStrengthScale", 0.2 );
            break;
        default:
            break;
    }
}

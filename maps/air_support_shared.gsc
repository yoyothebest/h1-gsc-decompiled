// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

air_support_precache()
{
    precachemodel( "wpn_h1_airsupport_marker" );
    precachemodel( "wpn_h1_airsupport_marker_selected" );
    level._id_058F["airsupport_marker_vfx"] = loadfx( "vfx/props/air_support_marker_glow" );
    setdvar( "use_new_air_support", "true" );
}
#using_animtree("script_model");

air_support_create_arrow_ent()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_80B3( "wpn_h1_airsupport_marker" );
    var_0 _meth_8117( #animtree );
    var_0 _meth_814D( %h1_wpn_spl_airsupport_target_idle );
    var_0._id_6379 = 4;
    playfxontag( level._id_058F["airsupport_marker_vfx"], var_0, "tag_fx" );
    return var_0;
}

air_support_create_selection_ent( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2 _meth_80B3( "wpn_h1_airsupport_marker_selected" );
    var_2 _meth_8117( #animtree );
    var_2 _meth_814D( %h1_wpn_spl_airsupport_target_selected );
    var_2.angles = var_1;
    return var_2;
}

air_support_update_arrow_coords( var_0, var_1 )
{
    var_2 = 15000;
    var_3 = [];
    var_3[0] = spawnstruct();
    var_3[0].offsetup = 0;
    var_3[0].offsetright = 0;
    var_3[0]._id_0523 = 4;
    var_3[1] = spawnstruct();
    var_3[1].offsetup = 0;
    var_3[1].offsetright = 15;
    var_3[1]._id_0523 = 1;
    var_3[2] = spawnstruct();
    var_3[2].offsetup = 0;
    var_3[2].offsetright = -15;
    var_3[2]._id_0523 = 1;
    var_3[3] = spawnstruct();
    var_3[3].offsetup = 10;
    var_3[3].offsetright = 10;
    var_3[3]._id_0523 = 2;
    var_3[4] = spawnstruct();
    var_3[4].offsetup = -10;
    var_3[4].offsetright = 10;
    var_3[4]._id_0523 = 2;
    var_3[5] = spawnstruct();
    var_3[5].offsetup = -10;
    var_3[5].offsetright = -10;
    var_3[5]._id_0523 = 2;
    var_3[6] = spawnstruct();
    var_3[6].offsetup = 10;
    var_3[6].offsetright = -10;
    var_3[6]._id_0523 = 2;
    var_4 = 0;

    for (;;)
    {
        wait 0.05;
        var_5 = level._id_0318 _meth_8338();
        var_6 = anglestoforward( var_5 );
        var_7 = anglestoup( var_5 );
        var_8 = anglestoright( var_5 );
        var_9 = level._id_0318 _meth_80AA();
        var_10 = getdvar( var_1 ) == "1";
        var_11 = ( 0, 0, 0 );

        for ( var_12 = 0; var_12 < var_3.size; var_12++ )
        {
            var_13 = var_9 + var_7 * var_3[var_12].offsetup + var_8 * var_3[var_12].offsetright;

            if ( var_12 == 0 )
                var_11 = var_13;

            var_3[var_12]._id_948E = _func_06B( var_13, var_13 + var_6 * var_2, 0, var_0 );

            if ( var_10 )
                thread common_scripts\utility::_id_2DB8( var_13, var_3[var_12]._id_948E["position"], 1, 1, 1, 0.05 );
        }

        var_14 = [];
        var_15 = 0;

        for ( var_12 = 0; var_12 < var_3.size; var_12++ )
        {
            if ( var_3[var_12]._id_948E["fraction"] == 1 )
                continue;

            var_16 = var_14.size;
            var_14[var_16] = spawnstruct();
            var_14[var_16]._id_0329 = var_3[var_12]._id_948E["position"];
            var_14[var_16]._id_02C8 = var_3[var_12]._id_948E["normal"];
            var_14[var_16]._id_0523 = var_3[var_12]._id_0523;
            var_15 += var_14[var_16]._id_02C8[2];

            if ( var_10 )
                thread common_scripts\utility::_id_2DB8( var_9, var_14[var_16]._id_0329, 0, 1, 0, 0.05 );
        }

        if ( var_14.size == 0 )
        {
            var_14[0] = spawnstruct();
            var_14[0]._id_0329 = var_3[0]._id_948E["position"];
            var_14[0]._id_02C8 = var_3[0]._id_948E["normal"];
            var_14[0]._id_0523 = var_3[0]._id_0523;
            var_15 = var_14[0]._id_02C8[2];
        }

        var_15 /= var_14.size;
        var_17 = air_support_average_coords( var_14 );
        var_18 = 0.5;
        var_19 = 0;

        if ( var_15 > var_18 )
            var_20 = air_support_find_best_floor( var_14 );
        else if ( var_15 < 0.0 - var_18 )
            var_20 = air_support_find_best_ceiling( var_14 );
        else
        {
            var_19 = 1;
            var_20 = air_support_average_normals( var_14 );
        }

        var_21 = var_11 + var_6 * var_2;
        var_22 = _func_06B( var_11, var_21, 0, var_0 );

        for ( var_23 = _func_0EE( var_22["position"], var_17 * 1.5 ); var_23 > _func_0EE( var_22["position"], var_17 ); var_22 = _func_06B( var_24, var_21, 0, var_0 ) )
        {
            var_3[0]._id_948E = var_22;
            var_24 = var_22["position"] + var_6 * 10;
            var_23 = _func_0EE( var_22["position"], var_17 );
        }

        var_17 = var_3[0]._id_948E["position"];

        if ( var_10 )
            thread common_scripts\utility::_id_2DB8( var_9, var_17, 1, 0, 0, 0.05 );

        thread air_support_draw_arrow( var_0, var_17, var_20, var_8, var_4, var_19 );

        if ( var_10 )
            _id_A526::_id_2DD0( var_0._id_02E2, var_0.angles );

        var_4 = 0.2;
    }
}

air_support_average_coords( var_0 )
{
    var_1 = ( 0, 0, 0 );
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_1 += var_0[var_3]._id_0329 * var_0[var_3]._id_0523;
        var_2 += var_0[var_3]._id_0523;
    }

    if ( var_2 > 0 )
        var_1 /= var_2;

    return var_1;
}

air_support_average_normals( var_0 )
{
    var_1 = ( 0, 0, 0 );
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_1 += var_0[var_3]._id_02C8 * var_0[var_3]._id_0523;
        var_2 += var_0[var_3]._id_0523;
    }

    if ( var_2 > 0 )
        var_1 /= var_2;

    return var_1;
}

air_support_find_best_floor( var_0 )
{
    var_1 = var_0[0]._id_02C8;

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_02C8[2] > var_1[2] )
            var_1 = var_0[var_2]._id_02C8;
    }

    return var_1;
}

air_support_find_best_ceiling( var_0 )
{
    var_1 = var_0[0]._id_02C8;

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_02C8[2] < var_1[2] )
            var_1 = var_0[var_2]._id_02C8;
    }

    return var_1;
}

air_support_draw_arrow( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_1 += _id_A5A4::vector_multiply( var_2, var_0._id_6379 );
    var_0._id_02E2 = var_1;

    if ( var_5 )
    {
        var_6 = ( 0, 0, 1 );
        var_7 = _func_114( _func_0F7( var_2, var_6 ) );
        var_8 = _func_0F8( var_2, var_7, var_6 );
    }
    else
    {
        var_6 = common_scripts\utility::_id_9294( var_2[2] > 0, var_2, -1 * var_2 );
        var_7 = -1 * var_3;
        var_9 = _func_114( _func_0F7( var_6, var_7 ) );
        var_8 = _func_0F8( var_9, var_7, var_6 );
    }

    if ( !var_5 )
        var_8 -= ( 90, 0, 0 ) * common_scripts\utility::_id_856D( var_2[2] );

    if ( var_4 > 0 )
        var_0 _meth_82B1( var_8, var_4 );
    else
        var_0.angles = var_8;
}

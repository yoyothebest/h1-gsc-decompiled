// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    common_scripts\utility::_id_383D( "ca_blockout" );
    common_scripts\utility::_id_383F( "ca_blockout" );
    setdvar( "bcs_enable", 0 );
    delete_enemy();
    delete_multiple_trigger();
    delete_battlechatter_trigger();
    delete_flood_spawner_trigger();
    delete_camper_spawner_trigger();
    delete_truckjunk();
    delete_color_volumes();
}

delete_enemy()
{
    var_0 = _func_0DD( "axis" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_4 = _func_0D9( "axis" );

    foreach ( var_6 in var_4 )
        var_6 delete();
}

delete_multiple_trigger()
{
    var_0 = getentarray( "trigger_multiple", "code_classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].classname == "trigger_multiple_visionset" )
            continue;

        if ( isdefined( var_0[var_1]._id_04A6 ) && var_0[var_1]._id_04A6 == "trigger_fog" )
            continue;

        if ( isdefined( var_0[var_1]._id_0398 ) && var_0[var_1]._id_0398 == "skip_blockout_delete" )
            continue;

        var_0[var_1] delete();
    }
}

delete_battlechatter_trigger()
{
    var_0 = [];
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_radius", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_disk", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_multiple", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_lookat", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_once", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_use", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_damage", "code_classname" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_795D ) )
            var_0[var_1] delete();

        if ( isdefined( var_0[var_1]._id_7A0F ) )
            var_0[var_1] delete();
    }
}

delete_flood_spawner_trigger()
{
    var_0 = getentarray( "flood_spawner", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_camper_spawner_trigger()
{
    var_0 = getentarray( "camper_spawner", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_fog_trigger()
{
    var_0 = getentarray( "trigger_fog", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_script_vehicle()
{
    var_0 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_truckjunk()
{
    var_0 = getentarray( "truckjunk", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_animated_model()
{
    var_0 = getentarray( "animated_model", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_interactive_tv()
{
    var_0 = getentarray( "interactive_tv", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_explodable_barrel()
{
    var_0 = getentarray( "explodable_barrel", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

delete_color_volumes()
{
    var_0 = _func_0C5();
    var_1 = [];
    var_1 = common_scripts\utility::_id_0CDD( var_1, getentarray( "trigger_multiple", "classname" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, getentarray( "trigger_radius", "classname" ) );
    var_1 = common_scripts\utility::_id_0CDD( var_1, getentarray( "trigger_once", "classname" ) );
    var_2 = getentarray( "info_volume", "classname" );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3]._id_7975 ) || isdefined( var_0[var_3]._id_7976 ) )
            var_0[var_3] _meth_805B();
    }

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( isdefined( var_1[var_3]._id_7975 ) || isdefined( var_1[var_3]._id_7976 ) )
            var_1[var_3] delete();
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_2[var_3]._id_7975 ) || isdefined( var_2[var_3]._id_7976 ) )
            var_2[var_3] delete();
    }
}

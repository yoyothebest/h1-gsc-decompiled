// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_422D( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level.global_fx_override[var_0] ) )
    {
        var_5 = level.global_fx_override[var_0];
        var_0 = var_5["targetname"];
        var_1 = var_5["fxFile"];
        var_2 = var_5["delay"];
        var_3 = var_5["fxName"];
        var_4 = var_5["soundalias"];
    }

    if ( !isdefined( level._id_058F ) )
        level._id_058F = [];

    level._id_422D[var_0] = var_3;
    var_6 = _id_A5A4::_id_40FE( var_0, "targetname" );

    if ( !isdefined( var_6 ) )
        return;

    if ( !var_6.size )
        return;

    if ( !isdefined( var_3 ) )
        var_3 = var_1;

    if ( !isdefined( var_2 ) )
        var_2 = _func_0B5( -20, -15 );

    foreach ( var_8 in var_6 )
    {
        if ( !isdefined( level._id_058F[var_3] ) )
            level._id_058F[var_3] = loadfx( var_1 );

        if ( !isdefined( var_8.angles ) )
            var_8.angles = ( 0, 0, 0 );

        var_9 = common_scripts\utility::_id_242E( var_3 );
        var_9._id_9C42["origin"] = var_8._id_02E2;
        var_9._id_9C42["angles"] = var_8.angles;
        var_9._id_9C42["fxid"] = var_3;
        var_9._id_9C42["delay"] = var_2;

        if ( isdefined( var_4 ) )
            var_9._id_9C42["soundalias"] = var_4;

        if ( !isdefined( var_8._id_0398 ) )
            continue;

        var_10 = var_8._id_0398;

        if ( !isdefined( level._id_05C3[var_10] ) )
            level._id_05C3[var_10] = [];

        level._id_05C3[var_10][level._id_05C3[var_10].size] = var_9;
    }
}

init()
{
    if ( !isdefined( level._id_422D ) )
        level._id_422D = [];

    level._id_05C3 = [];

    if ( !isdefined( level.global_fx_override ) )
        level.global_fx_override = [];
}

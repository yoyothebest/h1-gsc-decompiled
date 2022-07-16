// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_422D( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = common_scripts\utility::_id_40FD( var_0, "targetname" );

    if ( var_5.size <= 0 )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = _func_0B5( -20, -15 );

    if ( !isdefined( var_3 ) )
        var_3 = var_1;

    foreach ( var_7 in var_5 )
    {
        if ( !isdefined( level._id_058F ) )
            level._id_058F = [];

        if ( !isdefined( level._id_058F[var_3] ) )
            level._id_058F[var_3] = loadfx( var_1 );

        if ( !isdefined( var_7.angles ) )
            var_7.angles = ( 0, 0, 0 );

        var_8 = common_scripts\utility::_id_242E( var_3 );
        var_8._id_9C42["origin"] = var_7._id_02E2;
        var_8._id_9C42["angles"] = var_7.angles;
        var_8._id_9C42["fxid"] = var_3;
        var_8._id_9C42["delay"] = var_2;

        if ( isdefined( var_4 ) )
            var_8._id_9C42["soundalias"] = var_4;
    }
}

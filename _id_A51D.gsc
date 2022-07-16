// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8324( var_0, var_1 )
{
    level._id_5C73 = var_0;

    if ( !isdefined( level._id_05E5 ) && !isdefined( var_1 ) )
    {

    }

    if ( !isdefined( var_1 ) )
        var_1 = "minimap_corner";

    var_2 = getdvarfloat( "scr_requiredMapAspectRatio", 1 );
    var_3 = getentarray( var_1, "targetname" );

    if ( var_3.size != 2 )
        return;

    var_4 = ( var_3[0]._id_02E2[0], var_3[0]._id_02E2[1], 0 );
    var_5 = ( var_3[1]._id_02E2[0], var_3[1]._id_02E2[1], 0 );
    var_6 = var_5 - var_4;
    var_7 = ( _func_0B7( _func_094() ), _func_0B6( _func_094() ), 0 );
    var_8 = ( 0 - var_7[1], var_7[0], 0 );

    if ( _func_0F6( var_6, var_8 ) > 0 )
    {
        if ( _func_0F6( var_6, var_7 ) > 0 )
        {
            var_9 = var_5;
            var_10 = var_4;
        }
        else
        {
            var_11 = _id_9C6E( var_7, _func_0F6( var_6, var_7 ) );
            var_9 = var_5 - var_11;
            var_10 = var_4 + var_11;
        }
    }
    else if ( _func_0F6( var_6, var_7 ) > 0 )
    {
        var_11 = _id_9C6E( var_7, _func_0F6( var_6, var_7 ) );
        var_9 = var_4 + var_11;
        var_10 = var_5 - var_11;
    }
    else
    {
        var_9 = var_4;
        var_10 = var_5;
    }

    if ( var_2 > 0 )
    {
        var_12 = _func_0F6( var_9 - var_10, var_7 );
        var_13 = _func_0F6( var_9 - var_10, var_8 );
        var_14 = var_13 / var_12;

        if ( var_14 < var_2 )
        {
            var_15 = var_2 / var_14;
            var_16 = _id_9C6E( var_8, var_13 * ( var_15 - 1 ) * 0.5 );
        }
        else
        {
            var_15 = var_14 / var_2;
            var_16 = _id_9C6E( var_7, var_12 * ( var_15 - 1 ) * 0.5 );
        }

        var_9 += var_16;
        var_10 -= var_16;
    }

    level._id_5980 = [];
    level._id_5980["top"] = var_9[1];
    level._id_5980["left"] = var_10[0];
    level._id_5980["bottom"] = var_10[1];
    level._id_5980["right"] = var_9[0];
    level._id_5984 = level._id_5980["right"] - level._id_5980["left"];
    level._id_5981 = level._id_5980["top"] - level._id_5980["bottom"];
    level._id_5990 = _func_0F6( var_9 - var_10, var_7 );
    _func_1D1( var_0, var_9[0], var_9[1], var_10[0], var_10[1] );
}

_id_9C6E( var_0, var_1 )
{
    return ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
}

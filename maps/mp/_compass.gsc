// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8324( var_0 )
{
    var_1 = level._id_740C;
    var_2 = getentarray( "minimap_corner", "targetname" );

    if ( var_2.size != 2 )
        return;

    var_3 = ( var_2[0]._id_02E2[0], var_2[0]._id_02E2[1], 0 );
    var_4 = ( var_2[1]._id_02E2[0], var_2[1]._id_02E2[1], 0 );
    var_5 = var_4 - var_3;
    var_6 = ( _func_0B7( _func_094() ), _func_0B6( _func_094() ), 0 );
    var_7 = ( 0 - var_6[1], var_6[0], 0 );

    if ( _func_0F6( var_5, var_7 ) > 0 )
    {
        if ( _func_0F6( var_5, var_6 ) > 0 )
        {
            var_8 = var_4;
            var_9 = var_3;
        }
        else
        {
            var_10 = _id_9C6E( var_6, _func_0F6( var_5, var_6 ) );
            var_8 = var_4 - var_10;
            var_9 = var_3 + var_10;
        }
    }
    else if ( _func_0F6( var_5, var_6 ) > 0 )
    {
        var_10 = _id_9C6E( var_6, _func_0F6( var_5, var_6 ) );
        var_8 = var_3 + var_10;
        var_9 = var_4 - var_10;
    }
    else
    {
        var_8 = var_3;
        var_9 = var_4;
    }

    if ( var_1 > 0 )
    {
        var_11 = _func_0F6( var_8 - var_9, var_6 );
        var_12 = _func_0F6( var_8 - var_9, var_7 );
        var_13 = var_12 / var_11;

        if ( var_13 < var_1 )
        {
            var_14 = var_1 / var_13;
            var_15 = _id_9C6E( var_7, var_12 * ( var_14 - 1 ) * 0.5 );
        }
        else
        {
            var_14 = var_13 / var_1;
            var_15 = _id_9C6E( var_6, var_11 * ( var_14 - 1 ) * 0.5 );
        }

        var_8 += var_15;
        var_9 -= var_15;
    }

    level._id_5990 = _func_0F6( var_8 - var_9, var_6 );
    _func_1D1( var_0, var_8[0], var_8[1], var_9[0], var_9[1] );
}

_id_9C6E( var_0, var_1 )
{
    return ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
}

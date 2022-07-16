// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_788B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = [[ var_1 ]]( var_2, var_3 );
    else
        var_4 = [[ var_1 ]]( var_2 );

    var_4 = _func_0E9( var_4, 0, 100 );
    var_4 *= var_0;
    var_2._id_2733[var_2._id_2733.size] = var_4;
    var_2._id_93FF += 100 * var_0;
    return var_4;
}

_id_2470( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = [[ var_0 ]]( var_1, var_2 );
    else
        var_3 = [[ var_0 ]]( var_1 );

    var_3 = _func_0E9( var_3, 0, 100 );
    var_1._id_2721[var_1._id_2721.size] = var_3;
    return var_3;
}

_id_11F5( var_0 )
{
    foreach ( var_2 in level._id_1B9C )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( _func_0F0( var_0._id_02E2, var_2._id_02E2 ) < 22500 )
            return 0;
    }

    return 100;
}

_id_11FB( var_0 )
{
    foreach ( var_2 in level._id_4407 )
    {
        if ( !isdefined( var_2 ) || !var_2 _id_5102( self ) )
            continue;

        if ( _func_0F0( var_0._id_02E2, var_2._id_02E2 ) < 122500 )
            return 0;
    }

    return 100;
}

_id_11FF( var_0 )
{
    var_1 = level._id_5C5D;

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) || !var_3 _id_5102( self ) )
            continue;

        if ( _func_0F0( var_0._id_02E2, var_3._id_02E2 ) < 122500 )
            return 0;
    }

    return 100;
}

_id_5102( var_0 )
{
    if ( !level._id_91EB || level._id_01A7 || !isdefined( var_0._id_04A7 ) )
        return 1;

    if ( !isdefined( self._id_02E5 ) || !isdefined( self._id_02E5._id_04A7 ) )
        return 1;

    if ( var_0 == self._id_02E5 )
        return 1;

    var_1 = self._id_02E5._id_04A7;
    return var_1 != var_0._id_04A7;
}

_id_11F4( var_0 )
{
    if ( !isdefined( level._id_0D33 ) )
        return 100;

    if ( !var_0._id_65D1 )
        return 100;

    var_1 = maps\mp\gametypes\_hardpoints::_id_3EE6( var_0._id_02E2 );

    if ( var_1 > 0 )
        return 0;

    return 100;
}

_id_11F6( var_0 )
{
    var_1 = "all";

    if ( level._id_91EB )
        var_1 = maps\mp\gametypes\_gameobjects::_id_3F81( self._id_04A7 );

    if ( var_0._id_222B[var_1] > 0 )
        return 0;

    return 100;
}

_id_11F9( var_0 )
{
    var_1 = "all";

    if ( level._id_91EB )
        var_1 = maps\mp\gametypes\_gameobjects::_id_3F81( self._id_04A7 );

    if ( var_0._id_3AE2[var_1] > 0 )
        return 0;

    return 100;
}

_id_1203( var_0 )
{
    if ( isdefined( self._id_0AB1 ) )
        return 100;

    if ( _func_167( var_0._id_02E2 ) )
    {
        foreach ( var_2 in var_0._id_0B03 )
        {
            if ( !_func_167( var_2 ) )
                break;
        }

        return 0;
    }

    return 100;
}

_id_1201( var_0 )
{
    if ( isdefined( self._id_55DD ) && self._id_55DD == var_0 )
        return 0;

    return 100;
}

_id_1200( var_0 )
{
    if ( isdefined( var_0._id_55DF ) )
    {
        var_1 = gettime() - var_0._id_55DF;

        if ( var_1 > 4000 )
            return 100;

        return var_1 / 4000 * 100;
    }

    return 100;
}

_id_11F8( var_0 )
{
    if ( isdefined( var_0._id_55DE ) && ( !level._id_91EB || var_0._id_55DE != self._id_04A7 ) )
    {
        var_1 = var_0._id_55DF + 500;

        if ( gettime() < var_1 )
            return 0;
    }

    return 100;
}

avoidspawninzone( var_0, var_1 )
{
    var_2 = _func_0F0( var_1._id_02E2, var_0._id_02E2 );

    if ( var_2 < 692224 )
        return 0;

    return 100;
}

_id_11FE( var_0 )
{
    if ( !isdefined( self._id_5593 ) )
        return 100;

    var_1 = _func_0F0( var_0._id_02E2, self._id_5593 );

    if ( var_1 > 4000000 )
        return 100;

    var_2 = var_1 / 4000000;
    return var_2 * 100;
}

_id_11FD( var_0 )
{
    if ( !isdefined( self._id_0246 ) || !isdefined( self._id_0246._id_02E2 ) )
        return 100;

    if ( !maps\mp\_utility::_id_5189( self._id_0246 ) )
        return 100;

    var_1 = _func_0F0( var_0._id_02E2, self._id_0246._id_02E2 );

    if ( var_1 > 4000000 )
        return 100;

    var_2 = var_1 / 4000000;
    return var_2 * 100;
}

_id_6EEC( var_0 )
{
    if ( var_0._id_93FE[self._id_04A7] == 0 )
        return 0;

    var_1 = var_0._id_2B83[self._id_04A7] / var_0._id_93FE[self._id_04A7];
    var_1 = _func_0BF( var_1, 3240000 );
    var_2 = 1 - var_1 / 3240000;
    return var_2 * 100;
}

_id_11F7( var_0 )
{
    var_1 = "all";

    if ( level._id_91EB )
        var_1 = maps\mp\gametypes\_gameobjects::_id_3F81( self._id_04A7 );

    if ( var_0._id_93FE[var_1] == 0 )
        return 100;

    var_2 = _func_0BF( var_0._id_5C45[var_1], 3240000 );
    var_3 = var_2 / 3240000;
    return var_3 * 100;
}

avoidflagbydistance( var_0 )
{
    if ( var_0.enemyflagdist > 0 )
        var_1 = var_0.friendlyflagdist / var_0.enemyflagdist / var_0.friendlyflag.highestspawndistratio * 1.33;
    else
        var_1 = 0;

    return var_1 * 100;
}

_id_6EEE( var_0, var_1 )
{
    if ( var_1[0] && var_0.preferreddompoint == 0 )
        return 100;

    if ( var_1[1] && var_0.preferreddompoint == 1 )
        return 100;

    if ( var_1[2] && var_0.preferreddompoint == 2 )
        return 100;

    return 0;
}

_id_6EED( var_0, var_1 )
{
    if ( isdefined( var_0._id_91EA ) && var_0._id_91EA == var_1 )
        return 100;

    return 0;
}

_id_712C( var_0 )
{
    return _func_0B4( 0, 99 );
}

avoidzone( var_0, var_1 )
{
    var_2 = _func_0F0( var_1._id_02E2, var_0._id_02E2 );
    var_3 = var_2 - 692224;
    var_4 = 6067776;
    var_5 = 1867776;

    if ( var_3 >= var_5 )
        return 100 * ( 1.0 - 0.25 * ( var_3 - var_5 ) / ( var_4 - var_5 ) );
    else if ( var_3 > 0 )
        return 100.0 * var_3 / var_5;
    else
        return 0;
}

_id_6EF0( var_0 )
{
    var_1 = self._id_04A7;
    var_2 = maps\mp\_utility::_id_4067( var_1 );

    if ( var_0._id_606E[var_1] == 0 )
        return 0;

    if ( var_0._id_606E[var_2] == 0 )
        return 100;

    var_3 = var_0._id_606E[var_1] - var_0._id_606E[var_2];

    if ( var_3 <= 0 )
        return 0;

    if ( var_3 == 1 )
        return 50.0;

    if ( var_3 >= 2 )
        return 75.0;

    return 0;
}

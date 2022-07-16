// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.uselegacyspawning = issupportedmap() && issupportedmode() && getdvarint( "legacySpawningEnabled", 0 );
}

issupportedmap()
{
    switch ( level._id_038E )
    {
        case "mp_bog_summer":
        case "mp_cargoship":
        case "mp_bog":
        case "mp_countdown":
            return 1;
        default:
            return 0;
    }
}

issupportedmode()
{
    switch ( level._id_01B3 )
    {
        case "war":
        case "conf":
        case "dom":
            return 1;
        default:
            return 0;
    }
}

uselegacyspawning()
{
    return level.uselegacyspawning;
}

getspawnpoint_final( var_0, var_1 )
{
    var_2 = undefined;

    if ( !isdefined( var_0 ) || var_0.size == 0 )
        return undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
        var_2 = getbestweightedspawnpoint( var_0 );
    else
    {
        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            if ( isdefined( self._id_55DD ) && self._id_55DD == var_0[var_3] )
                continue;

            if ( _func_167( var_0[var_3]._id_02E2 ) )
                continue;

            var_2 = var_0[var_3];
            break;
        }

        if ( !isdefined( var_2 ) )
        {
            if ( isdefined( self._id_55DD ) && !_func_167( self._id_55DD._id_02E2 ) )
            {
                for ( var_3 = 0; var_3 < var_0.size; var_3++ )
                {
                    if ( var_0[var_3] == self._id_55DD )
                    {
                        var_2 = var_0[var_3];
                        break;
                    }
                }
            }
        }
    }

    if ( !isdefined( var_2 ) )
    {
        if ( var_1 )
            var_2 = var_0[_func_0B2( var_0.size )];
        else
            var_2 = var_0[0];
    }

    return var_2;
}

getbestweightedspawnpoint( var_0 )
{
    var_1 = 3;

    for ( var_2 = 0; var_2 <= var_1; var_2++ )
    {
        var_3 = [];
        var_4 = undefined;
        var_5 = undefined;

        for ( var_6 = 0; var_6 < var_0.size; var_6++ )
        {
            if ( !isdefined( var_4 ) || var_0[var_6]._id_0523 > var_4 )
            {
                if ( _func_167( var_0[var_6]._id_02E2 ) )
                    continue;

                var_3 = [];
                var_3[0] = var_0[var_6];
                var_4 = var_0[var_6]._id_0523;
                continue;
            }

            if ( var_0[var_6]._id_0523 == var_4 )
            {
                if ( _func_167( var_0[var_6]._id_02E2 ) )
                    continue;

                var_3[var_3.size] = var_0[var_6];
            }
        }

        if ( var_3.size == 0 )
            return undefined;

        var_5 = var_3[_func_0B2( var_3.size )];

        if ( var_2 == var_1 )
            return var_5;

        if ( isdefined( var_5.lastsighttracetime ) && var_5.lastsighttracetime == gettime() )
            return var_5;

        if ( !lastminutesighttraces( var_5 ) )
            return var_5;

        var_7 = getlospenalty();
        var_5._id_0523 -= var_7;
        var_5.lastsighttracetime = gettime();
    }
}

_id_40D8( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = _func_0B2( var_0.size );
        var_3 = var_0[var_1];
        var_0[var_1] = var_0[var_2];
        var_0[var_2] = var_3;
    }

    return getspawnpoint_final( var_0, 0 );
}

getallotherplayers()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
    {
        if ( !isdefined( level._id_0323[var_1] ) )
            continue;

        var_2 = level._id_0323[var_1];

        if ( var_2._id_03BC != "playing" || var_2 == self )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

getallalliedandenemyplayers( var_0 )
{
    if ( level._id_91EB )
    {
        if ( self._id_0308["team"] == "allies" )
        {
            var_0.allies = level._id_09DE["allies"];
            var_0._id_31CA = level._id_09DE["axis"];
        }
        else
        {
            var_0.allies = level._id_09DE["axis"];
            var_0._id_31CA = level._id_09DE["allies"];
        }
    }
    else
    {
        var_0.allies = [];
        var_0._id_31CA = level._id_0722;
    }
}

initweights( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_0523 = 0;
}

_id_40D7( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    if ( getdvarint( "scr_spawnsimple" ) > 0 )
        return _id_40D8( var_0 );

    spawnlogic_begin();
    initweights( var_0 );
    var_2 = spawnstruct();
    getallalliedandenemyplayers( var_2 );
    var_3 = var_2.allies.size + var_2._id_31CA.size;
    var_4 = 2;
    var_5 = self._id_0308["team"];
    var_6 = maps\mp\_utility::_id_4067( var_5 );

    for ( var_7 = 0; var_7 < var_0.size; var_7++ )
    {
        var_8 = var_0[var_7];

        if ( var_8.numplayersatlastupdate > 0 )
        {
            var_9 = var_8.distsum[var_5];
            var_10 = var_8.distsum[var_6];
            var_8._id_0523 = ( var_10 - var_4 * var_9 ) / var_8.numplayersatlastupdate;
            continue;
        }

        var_8._id_0523 = 0;
    }

    if ( isdefined( var_1 ) )
    {
        for ( var_7 = 0; var_7 < var_1.size; var_7++ )
            var_1[var_7]._id_0523 += 25000;
    }

    _id_1201( var_0 );
    avoidspawnreuse( var_0, 1 );
    avoidweapondamage( var_0 );
    avoidvisibleenemies( var_0, 1 );
    var_11 = getspawnpoint_final( var_0 );
    return var_11;
}

getspawnpoint_dm( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    spawnlogic_begin();
    initweights( var_0 );
    var_1 = getallotherplayers();
    var_2 = 1600;
    var_3 = 1200;

    if ( var_1.size > 0 )
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            var_5 = 0;
            var_6 = 0;

            for ( var_7 = 0; var_7 < var_1.size; var_7++ )
            {
                var_8 = _func_0EE( var_0[var_4]._id_02E2, var_1[var_7]._id_02E2 );

                if ( var_8 < var_3 )
                    var_6 += ( var_3 - var_8 ) / var_3;

                var_9 = _func_0BE( var_8 - var_2 );
                var_5 += var_9;
            }

            var_10 = var_5 / var_1.size;
            var_11 = ( var_2 - var_10 ) / var_2;
            var_0[var_4]._id_0523 = var_11 - var_6 * 2 + _func_0B3( 0.2 );
        }
    }

    _id_1201( var_0 );
    avoidspawnreuse( var_0, 0 );
    avoidweapondamage( var_0 );
    avoidvisibleenemies( var_0, 0 );
    return getspawnpoint_final( var_0 );
}

spawnlogic_begin()
{

}

ispointvulnerable( var_0 )
{
    var_1 = self._id_02E2 + level.claymoremodelcenteroffset;
    var_2 = var_0 + ( 0, 0, 32 );
    var_3 = _func_0F0( var_1, var_2 );
    var_4 = anglestoforward( self.angles );

    if ( var_3 < level.claymoredetectionradius * level.claymoredetectionradius )
    {
        var_5 = _func_114( var_2 - var_1 );
        var_6 = _func_0BA( _func_0F6( var_5, var_4 ) );

        if ( var_6 < level.claymoredetectionconeangle )
            return 1;
    }

    return 0;
}

avoidweapondamage( var_0 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    var_1 = 100000;

    if ( getdvar( "scr_spawnpointweaponpenalty" ) != "" && getdvar( "scr_spawnpointweaponpenalty" ) != "0" )
        var_1 = getdvarfloat( "scr_spawnpointweaponpenalty" );

    var_2 = 62500;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        for ( var_4 = 0; var_4 < level._id_4407.size; var_4++ )
        {
            if ( !isdefined( level._id_4407[var_4] ) )
                continue;

            if ( _func_0F0( var_0[var_3]._id_02E2, level._id_4407[var_4]._id_02E2 ) < var_2 )
                var_0[var_3]._id_0523 -= var_1;
        }

        if ( !isdefined( level._id_0D33 ) )
            continue;

        var_5 = maps\mp\gametypes\_hardpoints::_id_3EE6( var_0[var_3]._id_02E2 );

        if ( var_5 > 0 )
        {
            var_6 = var_5 * var_1;
            var_0[var_3]._id_0523 -= var_6;
        }
    }
}

spawnperframeupdate()
{
    var_0 = 0;
    var_1 = undefined;
    var_2 = 0;
    var_3 = 0;
    var_4 = 1;

    for (;;)
    {
        if ( var_4 )
        {
            wait 0.05;
            var_2 = 0;
            var_3 = 0;
        }

        if ( !isdefined( level._id_8A01 ) )
            return;

        var_0 = ( var_0 + 1 ) % level._id_8A01.size;
        var_5 = level._id_8A01[var_0];

        if ( level._id_91EB )
        {
            var_5.sights["axis"] = 0;
            var_5.sights["allies"] = 0;
            var_5._id_606E["axis"] = [];
            var_5._id_606E["allies"] = [];
        }
        else
        {
            var_5.sights = 0;
            var_5._id_606E["all"] = [];
        }

        var_6 = var_5._id_0199;
        var_5.distsum["all"] = 0;
        var_5.distsum["allies"] = 0;
        var_5.distsum["axis"] = 0;
        var_5.numplayersatlastupdate = 0;
        var_7 = 0;

        for ( var_8 = 0; var_8 < level._id_0323.size; var_8++ )
        {
            var_9 = level._id_0323[var_8];

            if ( var_9._id_03BC != "playing" )
                continue;

            var_7++;
            var_10 = var_9._id_02E2 - var_5._id_02E2;
            var_11 = _func_0F1( var_10 );
            var_12 = "all";

            if ( level._id_91EB )
                var_12 = var_9._id_0308["team"];

            if ( var_11 < 1024 )
                var_5._id_606E[var_12][var_5._id_606E[var_12].size] = var_9;

            var_5.distsum[var_12] += var_11;
            var_5.numplayersatlastupdate++;
            var_13 = anglestoforward( var_9.angles );

            if ( _func_0F6( var_6, var_10 ) < 0 && _func_0F6( var_13, var_10 ) > 0 )
                continue;

            var_2++;
            var_14 = legacybullettracepassed( var_9._id_02E2 + ( 0, 0, 50 ), var_5._id_856B, var_5 );
            var_5.lastsighttracetime = gettime();

            if ( var_14 )
            {
                if ( level._id_91EB )
                {
                    var_5.sights[var_9._id_0308["team"]]++;
                    continue;
                }

                var_5.sights++;
            }
        }

        var_3++;
        var_15 = var_3 == level._id_8A01.size;
        var_16 = var_2 + var_7 > getdvarint( "legacySpawningMaxTraces", 18 );
        var_4 = var_15 || var_16;
    }
}

legacybullettracepassed( var_0, var_1, var_2 )
{
    var_3 = getdvarfloat( "legacySpawningSightFrac", 1.0 );

    if ( var_3 >= 1.0 )
        return _func_08D( var_0, var_1, 0, undefined );
    else
        return _func_0FE( var_2, var_0, var_1, var_2._id_0204 ) >= var_3;
}

getlospenalty()
{
    if ( getdvar( "scr_spawnpointlospenalty" ) != "" && getdvar( "scr_spawnpointlospenalty" ) != "0" )
        return getdvarfloat( "scr_spawnpointlospenalty" );

    return 100000;
}

lastminutesighttraces( var_0 )
{
    var_1 = "all";

    if ( level._id_91EB )
        var_1 = maps\mp\_utility::_id_4067( self._id_0308["team"] );

    if ( !isdefined( var_0._id_606E ) )
        return 0;

    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    for ( var_6 = 0; var_6 < var_0._id_606E[var_1].size; var_6++ )
    {
        var_7 = var_0._id_606E[var_1][var_6];

        if ( !isdefined( var_7 ) )
            continue;

        if ( var_7._id_03BC != "playing" )
            continue;

        if ( var_7 == self )
            continue;

        var_8 = _func_0F0( var_0._id_02E2, var_7._id_02E2 );

        if ( !isdefined( var_2 ) || var_8 < var_3 )
        {
            var_4 = var_2;
            var_5 = var_3;
            var_2 = var_7;
            var_3 = var_8;
            continue;
        }

        if ( !isdefined( var_4 ) || var_8 < var_5 )
        {
            var_4 = var_7;
            var_5 = var_8;
        }
    }

    if ( isdefined( var_2 ) )
    {
        if ( legacybullettracepassed( var_2._id_02E2 + ( 0, 0, 50 ), var_0._id_856B, var_0 ) )
            return 1;
    }

    if ( isdefined( var_4 ) )
    {
        if ( legacybullettracepassed( var_4._id_02E2 + ( 0, 0, 50 ), var_0._id_856B, var_0 ) )
            return 1;
    }

    return 0;
}

avoidvisibleenemies( var_0, var_1 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    var_2 = getlospenalty();
    var_3 = "axis";

    if ( self._id_0308["team"] == "axis" )
        var_3 = "allies";

    if ( var_1 || maps\mp\_utility::ishodgepodgemm() )
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            if ( !isdefined( var_0[var_4].sights ) )
                continue;

            var_5 = var_2 * var_0[var_4].sights[var_3];
            var_0[var_4]._id_0523 -= var_5;
        }
    }
    else
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            if ( !isdefined( var_0[var_4].sights ) )
                continue;

            var_5 = var_2 * var_0[var_4].sights;
            var_0[var_4]._id_0523 -= var_5;
        }
    }
}

avoidspawnreuse( var_0, var_1 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    var_2 = gettime();
    var_3 = 10000;
    var_4 = 640000;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( !isdefined( var_0[var_5].lastspawnedplayer ) || !isdefined( var_0[var_5]._id_55DF ) || !_func_1A1( var_0[var_5].lastspawnedplayer ) )
            continue;

        if ( var_0[var_5].lastspawnedplayer == self )
            continue;

        if ( var_1 && var_0[var_5].lastspawnedplayer._id_0308["team"] == self._id_0308["team"] )
            continue;

        var_6 = var_2 - var_0[var_5]._id_55DF;

        if ( var_6 < var_3 )
        {
            var_7 = _func_0F0( var_0[var_5].lastspawnedplayer._id_02E2, var_0[var_5]._id_02E2 );

            if ( var_7 < var_4 )
            {
                var_8 = 1000 * ( 1 - var_7 / var_4 ) * ( 1 - var_6 / var_3 );
                var_0[var_5]._id_0523 -= var_8;
            }
            else
                var_0[var_5].lastspawnedplayer = undefined;

            continue;
        }

        var_0[var_5].lastspawnedplayer = undefined;
    }
}

_id_1201( var_0 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    if ( !isdefined( self._id_55DD ) )
        return;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] == self._id_55DD )
        {
            var_0[var_1]._id_0523 -= 50000;
            break;
        }
    }
}

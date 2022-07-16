// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_53A8 = 0;
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    level._id_1F11 = undefined;
    level._id_2AF8 = 0;
    level._id_62AC = 0;
    level._id_62AB = 0;
    level.badspawncount["axis"] = 0;
    level.badspawncount["allies"] = 0;
    level._id_0323 = [];
    level._id_669D = [];
    level._id_1C8E = [];
    level._id_89FE = [];
    level._id_4407 = [];
    level._id_5CC2 = [];
    level._id_1B9C = [];
    level._id_99BB = [];
    level._id_78FE = [];
    level._id_99EF = [];
    level._id_94F1 = [];
    level.activeplayerlistupdatetime = -1;
    level.activeplayerlist = [];
    maps\mp\gametypes\_legacyspawnlogic::init();
    level thread _id_94C0();

    if ( !maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
    {
        level thread _id_64C8();
        level thread _id_8A03();
        level thread _id_9508();
        level thread _id_94B7();
        level thread _id_94C1();
    }

    for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
        level._id_9201[level._id_91F7[var_0]] = [];
}

_id_94C1()
{
    for (;;)
    {
        self waittill( "host_migration_end" );

        foreach ( var_1 in level._id_669D )
            var_1._id_1AD6 = _id_1AD6( var_1 );
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        level thread _id_8D01( var_0 );
        level thread updatespawnsightsforplayer( var_0 );
    }
}

_id_8D01( var_0 )
{
    var_0 endon( "disconnect" );
    var_0._id_1AD6 = _id_1AD6( var_0 );

    if ( !var_0._id_1AD6 )
        return;

    wait 0.05;
    var_0 _meth_82FB( level._id_1F11 );
}

updatespawnsightsforplayer( var_0 )
{
    while ( isdefined( var_0 ) )
    {
        var_1 = var_0 common_scripts\utility::_id_A071( "death", "disconnect", "joined_spectators", "joined_team" );
        removespawnsightsforplayer( var_0 );

        if ( var_1 == "disconnect" )
            break;
    }
}

calculatespawntospawnsights()
{
    var_0 = ( 0, 0, 64 );

    foreach ( var_2 in level._id_8A01 )
    {
        var_2.fullsightspawns = [];
        var_2.cornersightspawns = [];
        var_2.trackplayersights = 1;
    }

    foreach ( var_2 in level._id_8A01 )
    {
        if ( !maps\mp\_utility::_id_5092( var_2.trackplayersights ) )
            continue;

        var_5 = var_2._id_02E2 + var_0;

        foreach ( var_7 in level._id_8A01 )
        {
            var_8 = var_7._id_02E2 + var_0;
            var_9 = _func_0FE( var_2, var_5, var_8, var_2._id_0204 );

            if ( var_9 > 0.95 )
            {
                var_2.fullsightspawns[var_2.fullsightspawns.size] = var_7;
                continue;
            }

            if ( var_9 > 0.0 )
                var_2.cornersightspawns[var_2.cornersightspawns.size] = var_7;
        }
    }
}

_id_1AD6( var_0 )
{
    if ( level._id_2AF8 )
        return 0;

    if ( !isdefined( level._id_1F11 ) )
        return 0;

    if ( _func_0CF( var_0 ) )
        return 0;

    if ( var_0 _meth_8298() )
        return 0;

    return 1;
}

_id_0831( var_0, var_1 )
{
    var_2 = _id_40DD( var_0 );

    if ( !var_2.size )
    {
        if ( !maps\mp\_utility::_id_5092( var_1 ) )
        {

        }

        return;
    }

    if ( !isdefined( level._id_8D3D ) )
        level._id_8D3D = [];

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] _id_8A00();
        var_2[var_3]._id_7C63 = 0;
        level._id_8D3D[level._id_8D3D.size] = var_2[var_3];
    }

    foreach ( var_5 in var_2 )
    {
        var_5._id_4C68 = 1;
        var_6 = anglestoforward( var_5.angles );

        foreach ( var_8 in var_2 )
        {
            if ( var_5 == var_8 )
                continue;

            var_9 = _func_114( var_8._id_02E2 - var_5._id_02E2 );
            var_10 = _func_0F6( var_6, var_9 );

            if ( var_10 > 0.86 )
            {
                var_5._id_4C68 = 0;
                break;
            }
        }
    }

    if ( !maps\mp\_utility::_id_5092( var_1 ) )
    {
        var_13 = var_2.size;
        var_14 = level._id_8D3D.size;
        _id_0831( var_0 + "_overflow", 1 );
        var_15 = level._id_8D3D.size - var_14;
    }
}

_id_082F( var_0, var_1 )
{
    if ( !isdefined( level._id_8A01 ) )
        level._id_8A01 = [];

    if ( !isdefined( level._id_9201[var_0] ) )
        level._id_9201[var_0] = [];

    var_2 = [];
    var_2 = _id_40DD( var_1 );

    if ( !isdefined( level._id_1F11 ) )
        level._id_1F11 = var_1;

    if ( !var_2.size )
        return;

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_4._id_4DB5 ) )
        {
            var_4 _id_8A00();
            level._id_8A01[level._id_8A01.size] = var_4;
        }

        level._id_9201[var_0][level._id_9201[var_0].size] = var_4;
    }
}

_id_8A00()
{
    var_0 = self;
    level._id_89F6 = _id_3519( level._id_89F6, var_0._id_02E2 );
    level._id_89F3 = _id_3518( level._id_89F3, var_0._id_02E2 );
    var_0._id_0199 = anglestoforward( var_0.angles );
    var_0._id_856B = var_0._id_02E2 + ( 0, 0, 50 );
    var_0._id_55DF = gettime();
    var_0._id_65D1 = 1;
    var_0._id_4DB5 = 1;
    var_0._id_0B03 = [];
    var_1 = 1024;

    if ( !_func_08D( var_0._id_856B, var_0._id_856B + ( 0, 0, var_1 ), 0, undefined ) )
    {
        var_2 = var_0._id_856B + var_0._id_0199 * 100;

        if ( !_func_08D( var_2, var_2 + ( 0, 0, var_1 ), 0, undefined ) )
            var_0._id_65D1 = 0;
    }

    var_3 = anglestoright( var_0.angles );
    _id_07C9( var_0, var_0._id_02E2 + var_3 * 45 );
    _id_07C9( var_0, var_0._id_02E2 - var_3 * 45 );
    _id_4E25( var_0 );
}

_id_07C9( var_0, var_1 )
{
    var_2 = _func_090( var_0._id_02E2, var_0._id_02E2 + ( 0, 0, 18 ) );
    var_3 = var_2[2] - var_0._id_02E2[2];
    var_4 = ( var_1[0], var_1[1], var_1[2] + var_3 );
    var_5 = _func_090( var_2, var_4 );

    if ( var_5 != var_4 )
        return;

    var_6 = _func_256( var_4 );

    if ( _func_0BE( var_6[2] - var_1[2] ) > 128 )
        return;

    var_0._id_0B03[var_0._id_0B03.size] = var_6;
}

_id_40DD( var_0 )
{
    if ( !isdefined( level._id_89FE ) )
        level._id_89FE = [];

    if ( !isdefined( level._id_89FE[var_0] ) )
    {
        level._id_89FE[var_0] = [];
        level._id_89FE[var_0] = getspawnarray( var_0 );

        foreach ( var_2 in level._id_89FE[var_0] )
            var_2.classname = var_0;
    }

    return level._id_89FE[var_0];
}

cananyplayerseeffaspawnpoint( var_0 )
{
    var_1 = ( 0, 0, 64 );
    var_2 = var_0._id_02E2 + var_1;

    foreach ( var_4 in level._id_0323 )
    {
        if ( var_4._id_03BC != "playing" )
            continue;

        if ( !maps\mp\_utility::_id_5189( var_4 ) )
            continue;

        if ( var_4 == self )
            continue;

        var_5 = var_4._id_02E2 + var_1;

        if ( _func_08E( var_2, var_5, 0, var_4 ) )
            return 1;
    }

    return 0;
}

getstartspawnffa( var_0 )
{
    if ( !isdefined( level.ffastartspawnpoints ) )
        level.ffastartspawnpoints = [];

    if ( !isdefined( level.ffastartspawnpoints[var_0] ) )
    {
        var_1 = _id_411F( var_0 );
        level.ffastartspawnpoints[var_0] = [];

        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_0398 ) && var_3._id_0398 == "start_spawn" )
                level.ffastartspawnpoints[var_0][level.ffastartspawnpoints[var_0].size] = var_3;
        }
    }

    var_5 = undefined;

    if ( level.ffastartspawnpoints[var_0].size >= level._id_0323.size )
        var_5 = _id_40D8( level.ffastartspawnpoints[var_0], 1 );

    if ( !isdefined( var_5 ) )
    {
        var_6 = _id_411F( var_0 );
        var_6 = common_scripts\utility::_id_0CF5( var_6 );

        foreach ( var_8 in var_6 )
        {
            if ( !isdefined( var_8.ffastartspawnsighted ) )
                var_8.ffastartspawnsighted = 0;
            else if ( var_8.ffastartspawnsighted )
                continue;

            if ( cananyplayerseeffaspawnpoint( var_8 ) )
            {
                var_8.ffastartspawnsighted = 1;
                continue;
            }

            if ( _func_168( var_8._id_02E2 ) && !_func_167( var_8._id_02E2 ) )
            {
                var_5 = var_8;
                break;
            }
        }

        if ( !isdefined( var_5 ) )
            var_5 = _id_40D8( var_6 );
    }

    return var_5;
}

_id_40D8( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_0 = maps\mp\gametypes\_spawnscoring::_id_1CFA( var_0 );
    var_0 = common_scripts\utility::_id_0CF5( var_0 );

    foreach ( var_3 in var_0 )
    {
        if ( _func_168( var_3._id_02E2 ) && !_func_167( var_3._id_02E2 ) )
            return var_3;
    }

    if ( !maps\mp\_utility::_id_5092( var_1 ) && var_0.size > 0 )
        return var_0[var_0.size - 1];

    return undefined;
}

getbeststartspawn( var_0 )
{
    var_1 = _id_40DD( var_0 );
    var_2 = _id_40DB( var_1 );

    if ( !isdefined( var_2 ) )
    {
        var_3 = _id_40DD( var_0 + "_overflow" );
        var_2 = _id_40DB( var_3 );
    }

    if ( !isdefined( var_2 ) )
    {
        var_2 = _id_40D8( var_1 );
        var_2._id_7C63 = 1;
    }

    return var_2;
}

getrandomstartspawn( var_0 )
{
    var_1 = _id_40DD( var_0 );
    var_2 = _id_40D8( var_1, 1 );

    if ( !isdefined( var_2 ) )
    {
        var_3 = _id_40DD( var_0 + "_overflow" );
        var_2 = _id_40D8( var_3, 1 );
    }

    if ( !isdefined( var_2 ) )
        var_2 = _id_40D8( var_1 );

    return var_2;
}

_id_40DB( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = undefined;
    var_0 = maps\mp\gametypes\_spawnscoring::_id_1CFA( var_0 );

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_7C63 )
            continue;

        if ( var_3._id_4C68 )
        {
            var_1 = var_3;
            break;
        }

        var_1 = var_3;
    }

    if ( isdefined( var_1 ) )
        var_1._id_7C63 = 1;

    return var_1;
}

_id_40D7( var_0, var_1 )
{
    for (;;)
        wait 5;
}

_id_94C0()
{
    for (;;)
    {
        level._id_4407 = getentarray( "grenade", "classname" );
        wait 0.05;
    }
}

_id_9508()
{
    for (;;)
    {
        level._id_5CC2 = getentarray( "rocket", "classname" );
        wait 0.05;
    }
}

_id_94B7()
{
    for (;;)
    {
        level._id_1B9C = getentarray( "care_package", "targetname" );
        wait 0.05;
    }
}

_id_411F( var_0 )
{
    return level._id_9201[var_0];
}

_id_5170()
{
    if ( !isdefined( level._id_66DA ) )
    {
        var_0 = _func_0C5();
        level._id_66DA = isdefined( var_0 ) && var_0.size > 150;
    }

    return level._id_66DA;
}

_id_084E()
{
    if ( isdefined( level._id_511D ) && level._id_511D )
        level notify( "participant_added", self );

    level._id_669D[level._id_669D.size] = self;
}

_id_73AC()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_669D.size; var_1++ )
    {
        if ( level._id_669D[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_669D.size - 1; var_1++ )
                level._id_669D[var_1] = level._id_669D[var_1 + 1];

            level._id_669D[var_1] = undefined;
            break;
        }
    }
}

_id_0848()
{
    level._id_1C8E[level._id_1C8E.size] = self;
}

_id_73A7()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_1C8E.size; var_1++ )
    {
        if ( level._id_1C8E[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_1C8E.size - 1; var_1++ )
                level._id_1C8E[var_1] = level._id_1C8E[var_1 + 1];

            level._id_1C8E[var_1] = undefined;
            break;
        }
    }
}

_id_8A03()
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    while ( !isdefined( level._id_8A01 ) || level._id_8A01.size == 0 )
        wait 0.05;

    calculatespawntospawnsights();
    level thread _id_8A02();
    level thread spawnpointclientsightupdate();
    level thread _id_89FF();
}

updateactiveplayerlist()
{
    var_0 = gettime();

    if ( level.activeplayerlistupdatetime == var_0 )
        return;

    level.activeplayerlistupdatetime = var_0;
    level.activeplayerlist = [];
    level._id_0719 = 0;
    var_1 = level._id_01B3;
    var_2 = 0;

    if ( var_1 == "dm" || var_1 == "gun" )
        var_2 = 1;

    foreach ( var_4 in level._id_1C8E )
    {
        var_4.isactiveplayer = 0;

        if ( _func_1AD( var_4 ) && var_2 && ( var_4._id_03BC == "playing" || var_4._id_03BC == "dead" ) )
            level._id_0719++;

        if ( !maps\mp\_utility::_id_5189( var_4 ) )
            continue;

        if ( _func_1AD( var_4 ) && var_4._id_03BC != "playing" )
            continue;

        var_4._id_89ED = _id_40DE( var_4 );

        if ( var_4._id_89ED == "spectator" )
            continue;

        var_5 = _id_4091( var_4 );
        var_6 = var_4 _meth_80AA();
        var_6 = ( var_6[0], var_6[1], var_4._id_02E2[2] + var_5 );
        var_4._id_89EE = var_5;
        var_4._id_8A13 = var_6;
        var_4.isactiveplayer = 1;
        level.activeplayerlist[level.activeplayerlist.size] = var_4;
    }
}

spawnpointclientsightupdate()
{
    level.maxclientupdatesperframe = 200;
    var_0 = 0;
    var_1 = 0;
    updateactiveplayerlist();

    for (;;)
    {
        if ( var_1 )
        {
            wait 0.05;
            var_0 = 0;
            var_1 = 0;
            updateactiveplayerlist();
        }

        var_2 = level._id_8A01;
        var_2 = maps\mp\gametypes\_spawnscoring::_id_1CFA( var_2 );
        var_1 = 1;

        for ( var_3 = 0; var_3 < level._id_1C8E.size; var_3++ )
        {
            var_4 = level._id_1C8E[var_3];

            if ( !var_4._id_1AD6 )
                continue;

            if ( !var_4.isactiveplayer )
            {
                removespawnsightsforplayer( var_4 );
                continue;
            }

            for ( var_5 = 0; var_5 < level._id_8A01.size; var_5++ )
            {
                var_0++;
                var_6 = level._id_8A01[var_5];
                var_7 = var_4 _meth_857B( var_6.classname );
                var_8 = var_6.fullsightsplayers[var_4._id_4450];
                var_9 = isdefined( var_8 );
                var_10 = var_6.cornersightsplayers[var_4._id_4450];
                var_11 = isdefined( var_10 );
                var_12 = 0;

                if ( var_9 )
                    var_12 = var_8._id_04B7;
                else if ( var_11 )
                    var_12 = var_10._id_04B7;

                if ( var_7 <= var_12 )
                    continue;

                var_13 = var_4 _meth_82FC( var_6._id_0204, var_6.classname );

                if ( var_13 >= 1.0 )
                {
                    if ( var_9 )
                        var_8._id_04B7 = var_7;
                    else
                    {
                        if ( var_11 )
                            removecornersightsfromspawnforplayer( var_6, var_4 );

                        addfullsightspawnforplayer( var_6, var_4, var_7 );
                    }

                    continue;
                }

                if ( var_13 >= 0.5 && level._id_0719 <= 8 )
                {
                    if ( var_11 )
                        var_10._id_04B7 = var_7;
                    else
                    {
                        if ( var_9 )
                            removefullsightsfromspawnforplayer( var_6, var_4 );

                        addcornersightspawnforplayer( var_6, var_4, var_7 );
                    }

                    continue;
                }

                if ( var_11 )
                    removecornersightsfromspawnforplayer( var_6, var_4 );

                if ( var_9 )
                    removefullsightsfromspawnforplayer( var_6, var_4 );
            }

            if ( var_0 + level._id_8A01.size > level.maxclientupdatesperframe )
            {
                wait 0.05;
                var_0 = 0;
                var_1 = 0;
                updateactiveplayerlist();
            }
        }
    }
}

_id_8A02()
{
    if ( isdefined( level.skipspawnsighttraces ) && level.skipspawnsighttraces )
        return;

    level.maxtraceperframe = 36;
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        if ( var_1 )
        {
            wait 0.05;
            var_0 = 0;
            var_1 = 0;
            updateactiveplayerlist();
        }

        var_2 = level._id_8A01;
        var_2 = maps\mp\gametypes\_spawnscoring::_id_1CFA( var_2 );
        var_1 = 1;

        foreach ( var_4 in var_2 )
        {
            var_4._id_5609 = gettime();
            var_5 = 0;

            foreach ( var_7 in level.activeplayerlist )
            {
                var_8 = var_4._id_02E2 + ( 0, 0, var_7._id_89EE );
                var_9 = var_7._id_8A13;
                removespawnsightsfromspawnforplayer( var_4, var_7 );
                var_10 = _func_0FE( var_4, var_8, var_9, var_4._id_0204 );
                var_0++;
                var_5++;

                if ( !var_10 )
                    continue;

                if ( var_10 > 0.95 )
                {
                    addfullsightspawnforplayer( var_4, var_7, gettime() );
                    continue;
                }

                if ( level._id_0719 > 8 )
                    continue;

                addcornersightspawnforplayer( var_4, var_7, gettime() );
            }

            if ( var_0 + var_5 > level.maxtraceperframe )
            {
                wait 0.05;
                var_0 = 0;
                var_1 = 0;
                updateactiveplayerlist();
            }
        }
    }
}

_id_89FF()
{
    var_0 = gettime();
    var_1 = 4;
    var_2 = 0;
    updateactiveplayerlist();

    for (;;)
    {
        var_3 = level._id_8A01;
        var_3 = maps\mp\gametypes\_spawnscoring::_id_1CFA( var_3 );
        var_4 = 0;

        foreach ( var_6 in var_3 )
        {
            _id_1F02( var_6 );
            var_2++;

            foreach ( var_8 in level.activeplayerlist )
            {
                if ( var_8._id_89ED == "spectator" )
                    continue;

                if ( isdefined( level.spawndistanceteamskip ) && var_8._id_89ED == level.spawndistanceteamskip )
                    continue;

                var_9 = _func_0F0( var_8._id_02E2, var_6._id_02E2 );

                if ( var_9 < var_6._id_5C45[var_8._id_89ED] )
                    var_6._id_5C45[var_8._id_89ED] = var_9;

                var_6._id_2B83[var_8._id_89ED] += var_9;
                var_6._id_93FE[var_8._id_89ED]++;

                if ( var_9 < 1638400 )
                {
                    if ( maps\mp\_utility::_id_5189( var_8 ) )
                        var_6._id_606E[var_8._id_89ED]++;
                }
            }

            if ( var_2 == var_1 )
            {
                var_4 = 1;
                wait 0.05;
                updateactiveplayerlist();
                var_0 = gettime();
                var_2 = 0;
            }
        }

        if ( !var_4 )
        {
            wait 0.05;
            updateactiveplayerlist();
            var_0 = gettime();
            var_2 = 0;
        }
    }
}

_id_40DE( var_0 )
{
    var_1 = "all";

    if ( level._id_91EB )
        var_1 = var_0._id_04A7;

    return var_1;
}

_id_4E25( var_0 )
{
    _id_1F03( var_0 );
    _id_1F02( var_0 );
}

_id_1F03( var_0 )
{
    if ( level._id_91EB )
    {
        foreach ( var_2 in level._id_91F7 )
            _id_1F09( var_0, var_2 );
    }
    else
        _id_1F09( var_0, "all" );
}

_id_1F02( var_0 )
{
    if ( level._id_91EB )
    {
        foreach ( var_2 in level._id_91F7 )
            _id_1F08( var_0, var_2 );
    }
    else
        _id_1F08( var_0, "all" );
}

_id_1F09( var_0, var_1 )
{
    var_0._id_3AE2[var_1] = 0;
    var_0.fullsightsplayers = [];
    var_0._id_222B[var_1] = 0;
    var_0.cornersightsplayers = [];
}

_id_1F08( var_0, var_1 )
{
    var_0._id_2B83[var_1] = 0;
    var_0._id_5C45[var_1] = 9999999;
    var_0._id_93FE[var_1] = 0;
    var_0._id_606E[var_1] = 0;
}

removespawnsightsfromspawnforplayer( var_0, var_1 )
{
    removefullsightsfromspawnforplayer( var_0, var_1 );
    removecornersightsfromspawnforplayer( var_0, var_1 );
}

removefullsightsfromspawnforplayer( var_0, var_1 )
{
    var_2 = var_0.fullsightsplayers[var_1._id_4450];

    if ( isdefined( var_2 ) )
    {
        var_0._id_3AE2[var_2._id_04A7]--;
        var_0.fullsightsplayers[var_1._id_4450] = undefined;
    }
}

removecornersightsfromspawnforplayer( var_0, var_1 )
{
    var_2 = var_0.cornersightsplayers[var_1._id_4450];

    if ( isdefined( var_2 ) )
    {
        var_0._id_222B[var_2._id_04A7]--;
        var_0.cornersightsplayers[var_1._id_4450] = undefined;
    }
}

removespawnsightsforplayer( var_0 )
{
    if ( !isdefined( level._id_8A01 ) )
        return;

    foreach ( var_2 in level._id_8A01 )
    {
        if ( !maps\mp\_utility::_id_5092( var_2.trackplayersights ) )
            continue;

        removespawnsightsfromspawnforplayer( var_2, var_0 );
    }
}

addspawnsights( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_5092( var_0.trackplayersights ) )
        return;

    foreach ( var_3 in var_0.fullsightspawns )
        addfullsightspawnforplayer( var_3, var_1, gettime() );

    foreach ( var_6 in var_0.cornersightspawns )
        addcornersightspawnforplayer( var_6, var_1, gettime() );
}

addfullsightspawnforplayer( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_5092( var_0.trackplayersights ) )
        return;

    var_1._id_89ED = _id_40DE( var_1 );
    var_0._id_3AE2[var_1._id_89ED]++;
    var_3 = spawnstruct();
    var_3._id_0318 = var_1;
    var_3._id_04B7 = var_2;
    var_3._id_04A7 = var_1._id_89ED;
    var_0.fullsightsplayers[var_1._id_4450] = var_3;
}

addcornersightspawnforplayer( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_5092( var_0.trackplayersights ) )
        return;

    var_1._id_89ED = _id_40DE( var_1 );
    var_0._id_222B[var_1._id_89ED]++;
    var_3 = spawnstruct();
    var_3._id_0318 = var_1;
    var_3._id_04B7 = var_2;
    var_3._id_04A7 = var_1._id_89ED;
    var_0.cornersightsplayers[var_1._id_4450] = var_3;
}

_id_4091( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 )
        return 64.0;

    var_2 = var_0 _meth_8180();

    if ( var_2 == "stand" )
        return 64.0;

    if ( var_2 == "crouch" )
        return 44.0;

    return 32.0;
}

_id_07EE( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = _id_40DE( var_3 );

        if ( var_0._id_3AE2[var_4] )
            continue;

        var_5 = _func_0FE( var_0, var_0._id_856B, var_3._id_02E2 + ( 0, 0, 50 ), var_0._id_0204 );

        if ( !var_5 )
            continue;

        if ( var_5 > 0.95 )
        {
            var_0._id_3AE2[var_4]++;
            continue;
        }

        var_0._id_222B[var_4]++;
    }
}

_id_373D( var_0 )
{
    var_1 = gettime();
    self._id_55DD = var_0;
    self._id_55DF = var_1;
    var_0._id_55DF = var_1;
    var_0._id_55DE = self._id_04A7;

    if ( maps\mp\gametypes\_legacyspawnlogic::uselegacyspawning() )
        var_0.lastspawnedplayer = self;
    else
    {
        removespawnsightsforplayer( self );
        addspawnsights( var_0, self );
    }
}

_id_351A( var_0 )
{
    var_1 = _id_40DD( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        level._id_89F6 = _id_3519( level._id_89F6, var_1[var_2]._id_02E2 );
        level._id_89F3 = _id_3518( level._id_89F3, var_1[var_2]._id_02E2 );
    }
}

_id_3519( var_0, var_1 )
{
    if ( var_0[0] > var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] > var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] > var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

_id_3518( var_0, var_1 )
{
    if ( var_0[0] < var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] < var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] < var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

_id_3779( var_0, var_1 )
{
    var_2 = ( 0, 0, 0 );
    var_2 = var_1 - var_0;
    var_2 = ( var_2[0] / 2, var_2[1] / 2, var_2[2] / 2 ) + var_0;
    return var_2;
}

_id_7FA6()
{
    level._id_89F6 = ( 0, 0, 0 );
    level._id_89F3 = ( 0, 0, 0 );
    _id_351A( "mp_tdm_spawn_allies_start" );
    _id_351A( "mp_tdm_spawn_axis_start" );
    level._id_5986 = _id_3779( level._id_89F6, level._id_89F3 );
    _func_141( level._id_5986 );
}

_id_84BB()
{
    return level._id_4C6D && ( !isdefined( level._id_62A5 ) || level._id_62A5 == 0 );
}

_id_7273( var_0 )
{
    if ( !isdefined( self._id_89E4 ) )
        self._id_89E4 = spawnstruct();

    self._id_89E4._id_89FD = var_0;
}

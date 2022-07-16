// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3FC9()
{
    _id_9B49();

    if ( !level._id_6861["all"].size )
        return undefined;
    else
        return level._id_6861["all"][0];
}

_id_3FCA( var_0 )
{
    var_1 = [];

    if ( var_0 < 0 )
        return var_1;

    _id_9B49();

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( level._id_6861["all"].size == var_2 )
            break;

        var_1[var_2] = level._id_6861["all"][var_2];
    }

    return var_1;
}

_id_4010()
{
    _id_9B49();
    var_0 = level._id_6861["all"];
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == level._id_6861["all"][0] )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_9B65( var_0, var_1 )
{
    if ( level._id_91EB )
        return;

    var_0 maps\mp\gametypes\_persistence::_id_8D7A( "round", "score", var_0._id_0167 );
    var_0 maps\mp\gametypes\_persistence::_id_8D50( "score", var_1 );
}

displaypoints( var_0 )
{
    if ( !level._id_46CA )
    {
        var_1 = maps\mp\gametypes\_rank::_id_40C1( var_0 );
        thread maps\mp\gametypes\_rank::_id_A3A6( var_0, var_1 );
    }
}

_id_41FC( var_0, var_1, var_2 )
{
    if ( isdefined( var_1._id_02E5 ) )
        var_1 = var_1._id_02E5;

    if ( !_func_1AD( var_1 ) )
        return;

    var_1 displaypoints( var_0 );
    var_3 = var_1._id_0308["score"];
    _id_64D5( var_0, var_1, var_2 );
    var_4 = var_1._id_0308["score"] - var_3;

    if ( var_4 == 0 )
        return;

    if ( var_1._id_0308["score"] < 65535 )
        var_1._id_038D = var_1._id_0308["score"];

    if ( level._id_91EB )
    {
        var_1 maps\mp\gametypes\_persistence::_id_8D7A( "round", "score", var_1._id_038D );
        var_1 maps\mp\gametypes\_persistence::_id_8D50( "score", var_4 );
    }

    if ( !level._id_91EB )
    {
        level thread _id_7C87();
        var_1 maps\mp\gametypes\_gamelogic::_id_1D16();
    }

    var_1 maps\mp\gametypes\_gamelogic::_id_1D1A();
}

_id_64D5( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( level._id_64D5 ) )
        var_3 = [[ level._id_64D5 ]]( var_0, var_1, var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = maps\mp\gametypes\_rank::_id_40C1( var_0 );

    var_1._id_0308["score"] += var_3 * level._id_6301;
}

_id_063D( var_0, var_1 )
{
    if ( var_1 == var_0._id_0308["score"] )
        return;

    var_0._id_0308["score"] = var_1;
    var_0._id_038D = _func_0BC( _func_0BF( var_0._id_0308["score"], 65535 ) );
    var_0 thread maps\mp\gametypes\_gamelogic::_id_1D1A();
}

_id_05B8( var_0 )
{
    return var_0._id_0308["score"];
}

_id_420C( var_0, var_1 )
{
    var_1 *= level._id_6301;
    _id_0640( var_0, _id_05BD( var_0 ) + var_1 );
    level notify( "update_team_score", var_0, _id_05BD( var_0 ) );
    thread _id_420D();
}

_id_420D()
{
    level endon( "update_team_score" );
    level endon( "game_ended" );
    waitframe;
    var_0 = _id_416F();

    if ( !level._id_8A7C && var_0 != "none" && var_0 != level._id_A1D4 && gettime() - level._id_55FC > 5000 && maps\mp\_utility::_id_40C2() != 1 )
    {
        level._id_55FC = gettime();
        maps\mp\_utility::_id_564B( "lead_taken", var_0, "status" );

        if ( level._id_A1D4 != "none" )
            maps\mp\_utility::_id_564B( "lead_lost", level._id_A1D4, "status" );
    }

    if ( var_0 != "none" )
    {
        level._id_A1D4 = var_0;
        var_1 = _id_05BD( var_0 );
        var_2 = maps\mp\_utility::_id_415E( "scorelimit" );

        if ( var_1 == 0 || var_2 == 0 )
            return;

        var_3 = var_1 / var_2 * 100;

        if ( var_3 > level._id_78A2 )
            _func_267( 1 );
    }
}

_id_416F()
{
    var_0 = level._id_91F7;
    var_1 = var_0[0];
    var_2 = game["teamScores"][var_0[0]];
    var_3 = 1;

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        if ( game["teamScores"][var_0[var_4]] > var_2 )
        {
            var_1 = var_0[var_4];
            var_2 = game["teamScores"][var_0[var_4]];
            var_3 = 1;
            continue;
        }

        if ( game["teamScores"][var_0[var_4]] == var_2 )
        {
            var_3 += 1;
            var_1 = "none";
        }
    }

    return var_1;
}

_id_0640( var_0, var_1 )
{
    if ( var_1 == game["teamScores"][var_0] )
        return;

    game["teamScores"][var_0] = var_1;
    _id_9B84( var_0 );

    if ( maps\mp\_utility::_id_4E3F() && !isdefined( level._id_662E ) || isdefined( level._id_662E ) && !level._id_662E )
        thread maps\mp\gametypes\_gamelogic::_id_64E6();
    else
    {
        thread maps\mp\gametypes\_gamelogic::_id_1D1F( var_0 );
        thread maps\mp\gametypes\_gamelogic::_id_1D1A();
    }
}

_id_9B84( var_0 )
{
    var_1 = 0;

    if ( !maps\mp\_utility::_id_5194() || !maps\mp\_utility::_id_5160() )
        var_1 = _id_05BD( var_0 );
    else
        var_1 = game["roundsWon"][var_0];

    _func_160( var_0, var_1 );
}

_id_05BD( var_0 )
{
    return game["teamScores"][var_0];
}

_id_7C88()
{
    level notify( "updating_scores" );
    level endon( "updating_scores" );
    wait 0.05;
    maps\mp\_utility::_id_A0F4();

    foreach ( var_1 in level._id_0323 )
        var_1 _meth_829B();
}

_id_7C87()
{
    level notify( "updating_dm_scores" );
    level endon( "updating_dm_scores" );
    wait 0.05;
    maps\mp\_utility::_id_A0F4();

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        level._id_0323[var_0] _meth_829C();
        level._id_0323[var_0]._id_9B0F = 1;
    }
}

_id_739E()
{
    var_0 = 0;
    var_1 = level._id_6861["all"].size;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( level._id_6861["all"][var_3] == self )
            var_2 = 1;

        if ( var_2 )
            level._id_6861["all"][var_3] = level._id_6861["all"][var_3 + 1];
    }

    if ( !var_2 )
        return;

    level._id_6861["all"][var_1 - 1] = undefined;

    if ( level._id_5FEC )
        _id_5FDE();

    if ( level._id_91EB )
    {
        _id_9B82();
        return;
    }

    var_1 = level._id_6861["all"].size;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_4 = level._id_6861["all"][var_3];
        var_4 notify( "update_outcome" );
    }
}

_id_9B49()
{
    var_0 = [];

    foreach ( var_2 in level._id_0323 )
    {
        if ( isdefined( var_2._id_214A ) )
            continue;

        if ( var_2._id_0308["team"] == "spectator" || var_2._id_0308["team"] == "none" )
            continue;

        var_0[var_0.size] = var_2;
    }

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        var_2 = var_0[var_4];
        var_5 = var_2._id_038D;

        if ( !level._id_91EB )
            var_5 = var_2._id_0167;

        for ( var_6 = var_4 - 1; var_6 >= 0 && _id_3F19( var_2, var_0[var_6] ) == var_2; var_6-- )
            var_0[var_6 + 1] = var_0[var_6];

        var_0[var_6 + 1] = var_2;
    }

    level._id_6861["all"] = var_0;

    if ( level._id_5FEC )
        _id_5FDE();
    else if ( level._id_91EB )
        _id_9B82();
}

_id_3F19( var_0, var_1 )
{
    if ( var_0._id_038D > var_1._id_038D )
        return var_0;

    if ( var_1._id_038D > var_0._id_038D )
        return var_1;

    if ( var_0._id_010D < var_1._id_010D )
        return var_0;

    if ( var_1._id_010D < var_0._id_010D )
        return var_1;

    if ( common_scripts\utility::_id_2006() )
        return var_0;
    else
        return var_1;
}

_id_9B82()
{
    var_0["allies"] = [];
    var_0["axis"] = [];
    var_0["spectator"] = [];
    var_1 = level._id_6861["all"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_1[var_3];
        var_5 = var_4._id_0308["team"];
        var_0[var_5][var_0[var_5].size] = var_4;
    }

    level._id_6861["allies"] = var_0["allies"];
    level._id_6861["axis"] = var_0["axis"];
}

_id_5FDE()
{
    var_0["spectator"] = [];

    foreach ( var_2 in level._id_91F7 )
        var_0[var_2] = [];

    var_4 = level._id_6861["all"];
    var_5 = var_4.size;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_7 = var_4[var_6];
        var_8 = var_7._id_0308["team"];
        var_0[var_8][var_0[var_8].size] = var_7;
    }

    foreach ( var_2 in level._id_91F7 )
        level._id_6861[var_2] = var_0[var_2];
}

_id_4DD5()
{
    wait 0.2;
    var_0 = 0;

    for (;;)
    {
        var_1 = 0;
        var_2 = level._id_0323;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_4 = var_2[var_3];

            if ( !isdefined( var_4 ) )
                continue;

            if ( isdefined( var_4._id_9B0F ) )
                continue;

            var_4._id_9B0F = 1;
            var_4 _meth_829C();
            var_1 = 1;
            wait 0.5;
        }

        if ( !var_1 )
            wait 3;
    }
}

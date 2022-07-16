// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_70F9( var_0 )
{
    level notify( "rain_change", "hard", var_0 );
    level thread _id_70F8( 10, var_0 );
    wait(var_0 * 0.5);
    level._id_0B3A["rain"] = "";
    wait(var_0 * 0.5);
}

_id_70FF( var_0 )
{
    level notify( "rain_change", "hard", var_0 );
    level thread _id_70F8( 8, var_0 );
    wait(var_0 * 0.5);
    level._id_0B3A["rain"] = "";
    wait(var_0 * 0.5);
}

_id_70FE( var_0 )
{
    level notify( "rain_change", "light", var_0 );
    level thread _id_70F8( 5, var_0 );
    wait(var_0 * 0.5);
    level._id_0B3A["rain"] = "light";
    wait(var_0 * 0.5);
}

_id_7100( var_0 )
{
    level notify( "rain_change", "none", var_0 );
    level thread _id_70F8( 0, var_0 );
    wait(var_0 * 0.5);
    level._id_0B3A["rain"] = "norain";
    wait(var_0 * 0.5);
}

_id_70FA( var_0 )
{
    common_scripts\utility::_id_383D( "_weather_lightning_enabled" );
    common_scripts\utility::_id_383F( "_weather_lightning_enabled" );
    common_scripts\utility::_id_383D( "player_weather_enabled" );
    common_scripts\utility::_id_383F( "player_weather_enabled" );

    if ( var_0 == "none" )
    {
        level._id_70FB = 0;
        level._id_058F["rain_drops"] = level._id_058F["rain_" + level._id_70FB];
        _id_7100( 0.1 );
    }
    else if ( var_0 == "light" )
    {
        level._id_70FB = 5;
        level._id_058F["rain_drops"] = level._id_058F["rain_" + level._id_70FB];
        _id_70FE( 0.1 );
    }
    else
    {
        level._id_70FB = 10;
        level._id_058F["rain_drops"] = level._id_058F["rain_" + level._id_70FB];
        _id_70F9( 0.1 );
    }
}

_id_5734( var_0, var_1 )
{
    [[ var_0 ]]();
    waitframe;

    for (;;)
        _id_5742( var_0, var_1 );
}

_id_70F8( var_0, var_1 )
{
    level notify( "rain_level_change" );
    level endon( "rain_level_change" );

    if ( level._id_70FB > var_0 )
    {
        var_2 = level._id_70FB - var_0;
        var_1 /= var_2;

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            wait(var_1);
            level._id_70FB--;
            level._id_058F["rain_drops"] = level._id_058F["rain_" + level._id_70FB];
        }
    }

    if ( level._id_70FB < var_0 )
    {
        var_2 = var_0 - level._id_70FB;
        var_1 /= var_2;

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            wait(var_1);
            level._id_70FB++;
            level._id_058F["rain_drops"] = level._id_058F["rain_" + level._id_70FB];
        }
    }
}

_id_07FE( var_0 )
{
    if ( !isdefined( level._id_573F ) )
    {
        level._id_573F = [];
        level._id_5740 = 0;
    }

    level._id_573F[level._id_573F.size] = var_0;
}

_id_6D94()
{
    var_0 = getentarray( "player", "classname" )[0];
    var_1 = common_scripts\utility::_id_8959();

    for (;;)
    {
        while ( common_scripts\utility::_id_382E( "player_weather_enabled" ) )
        {
            var_2 = var_0.angles;
            var_1 _meth_82AA( var_0._id_02E2 + ( 0, 0, 650 ), 0.1 );
            var_1 _meth_82B1( ( -90, var_2[1], 180 ), 0.1 );
            playfxontag( level._id_058F["rain_drops"], var_1, "tag_origin" );
            wait 0.3;
        }

        common_scripts\utility::_id_384A( "player_weather_enabled" );
    }
}

_id_70FC()
{
    if ( level._id_70FB == 0 )
        return _func_0B3( 30 );
    else if ( level._id_70FB == 1 )
        return _func_0B3( 24 );
    else if ( level._id_70FB == 2 )
        return _func_0B3( 20 );
    else if ( level._id_70FB == 3 )
        return _func_0B3( 15 );
    else if ( level._id_70FB == 4 )
        return _func_0B3( 12 );
    else if ( level._id_70FB == 5 )
        return _func_0B3( 9 );
    else if ( level._id_70FB == 6 )
        return _func_0B3( 8 );
    else if ( level._id_70FB == 7 )
        return _func_0B3( 8 );
    else if ( level._id_70FB == 8 )
        return _func_0B3( 7 );
    else if ( level._id_70FB == 9 )
        return _func_0B3( 6 );
    else if ( level._id_70FB == 10 )
        return _func_0B3( 5 );
}

_id_70FD()
{
    if ( level._id_70FB == 0 )
        return 20;
    else if ( level._id_70FB == 1 )
        return 18;
    else if ( level._id_70FB == 2 )
        return 16;
    else if ( level._id_70FB == 3 )
        return 14;
    else if ( level._id_70FB == 4 )
        return 12;
    else if ( level._id_70FB == 5 )
        return 10;
    else if ( level._id_70FB == 6 )
        return 9;
    else if ( level._id_70FB == 7 )
        return 8;
    else if ( level._id_70FB == 8 )
        return 7;
    else if ( level._id_70FB == 9 )
        return 6;
    else if ( level._id_70FB == 10 )
        return 5;
}

_id_5742( var_0, var_1 )
{
    level endon( "rain_change" );
    var_2 = gettime() + ( _id_70FD() + _id_70FC() ) * 1000;

    if ( var_2 < level._id_60CD )
        level._id_60CD = var_2;

    for (;;)
    {
        common_scripts\utility::_id_384A( "_weather_lightning_enabled" );
        var_3 = ( level._id_60CD - gettime() ) * 0.001;

        if ( var_3 > 0 )
            wait(var_3);

        if ( !common_scripts\utility::_id_382E( "_weather_lightning_enabled" ) )
            continue;

        _id_5741( var_0, var_1 );
        level._id_60CD = gettime() + ( _id_70FD() + _id_70FC() ) * 1000;
    }
}

_id_3963( var_0 )
{
    if ( isdefined( level._id_5740 ) )
        common_scripts\_exploder::_id_3528( level._id_573F[level._id_5740] );

    [[ var_0 ]]();
}

_id_5741( var_0, var_1, var_2 )
{
    var_3[0] = "quick";
    var_3[1] = "double";
    var_3[2] = "triple";
    thread _id_9343();

    if ( !isdefined( var_2 ) )
        var_2 = _func_0B2( var_3.size );

    var_4 = 0;

    if ( isdefined( level._id_5740 ) )
    {
        while ( var_4 == level._id_5740 )
            var_4 = _func_0B2( level._id_573F.size );

        level._id_5740 = var_4;
    }

    switch ( var_3[var_2] )
    {
        case "quick":
            _id_3963( var_1 );
            break;
        case "double":
            _id_3963( var_1 );
            wait 0.05;
            _id_3963( var_1 );
            break;
        case "triple":
            _id_3963( var_1 );
            wait 0.05;
            _id_3963( var_1 );
            wait 0.5;
            _id_3963( var_1 );
            break;
    }
}

_id_9343()
{
    if ( level._id_70FB == 0 )
        wait(6 + _func_0B3( 2 ));
    else if ( level._id_70FB == 1 )
        wait(5 + _func_0B3( 1.8 ));
    else if ( level._id_70FB == 2 )
        wait(4.5 + _func_0B3( 1.6 ));
    else if ( level._id_70FB == 3 )
        wait(4 + _func_0B3( 1.6 ));
    else if ( level._id_70FB == 4 )
        wait(3.5 + _func_0B3( 1.5 ));
    else if ( level._id_70FB == 5 )
        wait(3 + _func_0B3( 1.5 ));
    else if ( level._id_70FB == 6 )
        wait(2.5 + _func_0B3( 1.2 ));
    else if ( level._id_70FB == 7 )
        wait(2 + _func_0B3( 1 ));
    else if ( level._id_70FB == 8 )
        wait(1.9 + _func_0B3( 0.5 ));
    else if ( level._id_70FB == 9 )
        wait 1.5;
    else if ( level._id_70FB == 10 )
        wait 1;

    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0._id_02E2 = level._id_0318._id_02E2 + ( 0, 0, 80 );
    var_0 _meth_804F( level._id_0318 );

    if ( level._id_70FB <= 8 )
        var_0 _meth_809C( "elm_thunder_distant", "sounddone" );
    else
    {
        var_0 _meth_809C( "elm_thunder_distant", "sounddone" );
        var_0 thread _id_A5A4::_id_69C4( "elm_thunder_strike" );
    }

    var_0 waittill( "sounddone" );
    var_0 delete();
}

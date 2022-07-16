// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_01A7["min_participation"] = -200;
    level._id_01A7["max_participation"] = 1000;
    level._id_01A7["enemy_kill_points"] = 250;
    level._id_01A7["friend_kill_points"] = -650;
    level._id_01A7["point_loss_interval"] = 1.25;
    level._id_0318._id_669E = 0;
    level._id_3AA7 = 0;
    level._id_3AA8 = 0;
    setdvarifuninitialized( "friendlyfire_dev_disabled", "0" );
    common_scripts\utility::_id_383D( "friendly_fire_warning" );
    thread _id_269E();
    thread _id_66A0();
}

_id_269E()
{

}

_id_0CA3( var_0 )
{
    level._id_3A9C = var_0;
}

_id_734D( var_0 )
{
    level._id_3A9C = undefined;
}

_id_3A59( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_04A7 ) )
        var_0._id_04A7 = "allies";

    if ( isdefined( level._id_60FA ) )
        return;

    level endon( "mission failed" );
    level thread _id_6228( var_0 );
    level thread _id_622A( var_0 );
    level thread _id_622B( var_0 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( var_0._id_01E6 <= 0 )
            return;

        var_1 = undefined;
        var_2 = undefined;
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = undefined;
        var_0 waittill( "friendlyfire_notify", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_0 ) )
            return;

        if ( !isdefined( var_2 ) )
            continue;

        if ( isdefined( level._id_3A9C ) )
        {
            var_1 *= level._id_3A9C;
            var_1 = _func_0BC( var_1 );
        }

        var_8 = 0;

        if ( !isdefined( var_6 ) )
            var_6 = var_0._id_0102;

        if ( isdefined( level._id_3A9D ) )
        {
            if ( isdefined( var_2._id_25A9 ) )
            {
                var_7 = 1;
                var_2 = var_2._id_25A9;
            }
        }

        if ( isdefined( level._id_3A9E ) )
        {
            if ( isdefined( var_2 ) && isdefined( var_2._id_02E5 ) && var_2._id_02E5 == level._id_0318 )
                var_8 = 1;
        }

        if ( _func_1AD( var_2 ) )
        {
            var_8 = 1;

            if ( isdefined( var_6 ) && var_6 == "none" )
                var_8 = 0;

            if ( var_2 _meth_833F() )
                var_8 = 1;

            if ( isdefined( var_7 ) )
                var_8 = 1;
        }
        else if ( isdefined( var_2.code_classname ) && var_2.code_classname == "script_vehicle" )
        {
            var_9 = var_2 _meth_8253();

            if ( isdefined( var_9 ) && _func_1AD( var_9 ) )
                var_8 = 1;
        }

        if ( !var_8 )
            continue;

        if ( !isdefined( var_0._id_04A7 ) )
            continue;

        var_10 = var_0._id_04A7 == level._id_0318._id_04A7;
        var_11 = undefined;

        if ( isdefined( var_0._id_04D9 ) && var_0._id_04D9 == "civilian" )
            var_11 = 1;
        else
            var_11 = _func_120( var_0.classname, "civilian" );

        var_12 = var_1 == -1;

        if ( !var_10 && !var_11 )
        {
            if ( var_12 )
            {
                level._id_0318._id_669E += level._id_01A7["enemy_kill_points"];
                _id_669F();
                return;
            }

            continue;
        }

        if ( isdefined( var_0._id_60FA ) )
            continue;

        if ( var_5 == "MOD_PROJECTILE_SPLASH" && isdefined( level._id_60FB ) )
            continue;

        if ( isdefined( var_6 ) && var_6 == "claymore" )
        {
            if ( isdefined( level.claymoreexplodethisframe_byplayer ) && level.claymoreexplodethisframe_byplayer )
            {

            }
            else
                continue;
        }

        if ( var_12 )
        {
            if ( isdefined( var_0._id_3A3A ) )
                level._id_0318._id_669E += var_0._id_3A3A;
            else
                level._id_0318._id_669E += level._id_01A7["friend_kill_points"];
        }
        else
            level._id_0318._id_669E -= var_1;

        _id_669F();

        if ( _id_1CC1( var_0, var_5 ) && _id_780F() )
        {
            if ( var_12 )
                return;
            else
                continue;
        }

        if ( isdefined( level._id_3A58 ) )
        {
            [[ level._id_3A58 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
            continue;
        }

        _id_3A57( var_11 );
    }
}

_id_3A57( var_0 )
{
    if ( isdefined( level._id_361A ) && level._id_361A )
    {
        level thread _id_5CDD( var_0 );
        return;
    }

    var_1 = level._id_3AA8;

    if ( isdefined( level._id_3A9D ) && var_0 )
        var_1 = 0;

    if ( var_1 )
        return;

    if ( level._id_3AA7 == 1 )
        return;

    if ( level._id_0318._id_669E <= level._id_01A7["min_participation"] )
        level thread _id_5CDD( var_0 );
}

_id_1CC1( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = 0;

    if ( isdefined( var_0._id_0102 ) && var_0._id_0102 == "none" )
        var_2 = 1;

    if ( isdefined( var_1 ) && var_1 == "MOD_GRENADE_SPLASH" )
        var_2 = 1;

    return var_2;
}

_id_780F()
{
    var_0 = gettime();

    if ( var_0 < 4500 )
        return 1;
    else if ( var_0 - level._id_5578 < 4500 )
        return 1;

    return 0;
}

_id_669F()
{
    if ( level._id_0318._id_669E > level._id_01A7["max_participation"] )
        level._id_0318._id_669E = level._id_01A7["max_participation"];

    if ( level._id_0318._id_669E < level._id_01A7["min_participation"] )
        level._id_0318._id_669E = level._id_01A7["min_participation"];
}

_id_66A0()
{
    level endon( "mission failed" );

    for (;;)
    {
        if ( level._id_0318._id_669E > 0 )
            level._id_0318._id_669E--;
        else if ( level._id_0318._id_669E < 0 )
            level._id_0318._id_669E++;

        wait(level._id_01A7["point_loss_interval"]);
    }
}

_id_992E()
{
    level._id_3AA7 = 0;
}

_id_9932()
{
    level._id_3AA7 = 1;
}

_id_5CDD( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( getdvar( "friendlyfire_dev_disabled" ) == "1" )
        return;

    level._id_0318 endon( "death" );

    if ( !_func_1A1( level._id_0318 ) )
        return;

    level endon( "mine death" );
    level notify( "mission failed" );
    level notify( "friendlyfire_mission_fail" );
    waitframe;
    _func_0D6( "hud_missionFailed", 1 );
    _func_0D6( "ammoCounterHide", 1 );
    _func_0D6( "hud_showstance", 0 );
    _func_0D6( "actionSlotsHide", 1 );

    if ( isdefined( level._id_0318._id_3615 ) )
        return;

    _id_A5E8::_id_870C( "friendly_fire_mission_failed" );

    if ( var_0 )
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_CIVILIAN_KILLED" );
    else if ( isdefined( level._id_2543 ) )
        _id_A56A::_id_7E03( level._id_2543 );
    else if ( level._id_1A3D == "british" )
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_KILLTEAM_BRITISH" );
    else if ( level._id_1A3D == "russian" )
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_KILLTEAM_RUSSIAN" );
    else
        _id_A56A::_id_7E03( &"SCRIPT_MISSIONFAIL_KILLTEAM_AMERICAN" );

    if ( isdefined( level._id_2544 ) )
        thread _id_A56A::_id_7E04( level._id_2544, 64, 64, 0 );

    _func_105( level._id_0318._id_02E2, "script_friendlyfire: civilian %d", var_0 );
    _id_A5A4::_id_5CDF();
}

_id_6228( var_0 )
{
    level endon( "mission failed" );
    var_0 endon( "death" );

    for (;;)
    {
        var_1 = undefined;
        var_2 = undefined;
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = undefined;
        var_8 = undefined;
        var_9 = undefined;
        var_10 = undefined;
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        var_0 notify( "friendlyfire_notify", var_1, var_2, var_3, var_4, var_5, var_10 );
    }
}

_id_622A( var_0 )
{
    level endon( "mission failed" );
    var_0 waittill( "damage_notdone", var_1, var_2, var_3, var_4, var_5 );
    var_0 notify( "friendlyfire_notify", -1, var_2, undefined, undefined, var_5 );
}

_id_622B( var_0 )
{
    level endon( "mission failed" );
    var_0 waittill( "death", var_1, var_2, var_3 );
    var_0 notify( "friendlyfire_notify", -1, var_1, undefined, undefined, var_2, var_3 );
}

_id_2993( var_0 )
{

}

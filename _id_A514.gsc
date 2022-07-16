// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_5578 = 0;
    level.lasttimeplayedregister = 0;
    common_scripts\utility::_id_383D( "game_saving" );
    common_scripts\utility::_id_383D( "being_spotted" );
    common_scripts\utility::_id_383D( "can_save" );
    common_scripts\utility::_id_383F( "can_save" );
    common_scripts\utility::_id_383D( "disable_autosaves" );

    if ( !isdefined( level._id_05A7 ) )
        level._id_05A7 = [];

    level._id_1152 = ::_id_1152;
}

_id_3F53()
{
    return &"AUTOSAVE_AUTOSAVE";
}

_id_4032( var_0 )
{
    if ( var_0 == 0 )
        var_1 = &"AUTOSAVE_GAME";
    else
        var_1 = &"AUTOSAVE_NOGAME";

    return var_1;
}

_id_139E()
{
    common_scripts\utility::_id_384A( "introscreen_complete" );

    if ( isdefined( level._id_4F8D ) )
        wait(level._id_4F8D);

    if ( level._id_5CDE )
        return;

    if ( maps\_arcademode::arcademode_complete() )
        return;

    if ( common_scripts\utility::_id_382E( "game_saving" ) )
        return;

    common_scripts\utility::_id_383F( "game_saving" );
    var_0 = "levelshots / autosave / autosave_" + level._id_038E + "start";
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", var_0, 1 );
    setdvar( "ui_grenade_death", "0" );
    common_scripts\utility::_id_3831( "game_saving" );
}

_id_975A( var_0 )
{
    var_0 waittill( "trigger" );
    _id_A5A4::_id_1154();
}

_id_975B( var_0 )
{
    var_0 waittill( "trigger" );
    _id_A5A4::_id_1158();
}

_id_9758( var_0 )
{
    if ( !isdefined( var_0._id_7951 ) )
        var_0._id_7951 = 0;

    _id_1169( var_0 );
}

_id_1169( var_0 )
{
    var_1 = _id_4032( var_0._id_7951 );

    if ( !isdefined( var_1 ) )
        return;

    var_0 waittill( "trigger" );
    var_2 = var_0._id_7951;
    var_3 = "levelshots / autosave / autosave_" + level._id_038E + var_2;
    _id_9896( var_2, var_1, var_3 );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_1166( var_0 )
{
    if ( _id_A5A4::_id_5056() )
        return;

    var_0 waittill( "trigger" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0._id_7952;
    var_0 delete();

    if ( isdefined( level._id_2553 ) )
    {
        if ( ![[ level._id_2553 ]]() )
            return;
    }

    _id_A5A4::_id_1143( var_1 );
}

_id_9759( var_0 )
{
    var_0 waittill( "trigger" );
}

_id_1168( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        return;

    return;
}

_id_115F( var_0 )
{
    level endon( "trying_new_autosave" );
    level endon( "autosave_complete" );
    wait(var_0);
    common_scripts\utility::_id_3831( "game_saving" );
    level notify( "autosave_timeout" );
}

_id_055D()
{
    var_0 = "levelshots / autosave / autosave_" + level._id_038E + "start";
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", var_0, 1 );
    _id_1153( 0 );
}

_id_055E()
{
    var_0 = "levelshots / autosave / autosave_" + level._id_038E + "start";

    if ( getdvarint( "g_reloading" ) == 0 )
    {
        _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", var_0, 1 );
        _id_1153( 0 );
    }
}

_id_055C( var_0 )
{
    if ( isdefined( level._id_5CDE ) && level._id_5CDE )
        return;

    if ( common_scripts\utility::_id_382E( "game_saving" ) )
        return 0;

    if ( maps\_arcademode::arcademode_complete() )
        return 0;

    for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
    {
        var_2 = level._id_0323[var_1];

        if ( !_func_1A1( var_2 ) )
            return 0;
    }

    var_3 = "save_now";
    var_4 = _id_3F53();

    if ( isdefined( var_0 ) )
        var_5 = _func_088( var_3, var_4, "$default", 1 );
    else
        var_5 = _func_088( var_3, var_4 );

    wait 0.05;

    if ( _func_087() )
    {
        level._id_5578 = gettime();
        level.lasttimeplayedregister = level._id_5578;
        return 0;
    }

    if ( var_5 < 0 )
        return 0;

    if ( !_id_988F() )
        return 0;

    common_scripts\utility::_id_383F( "game_saving" );
    wait 2;
    common_scripts\utility::_id_3831( "game_saving" );

    if ( !_func_08A( var_5 ) )
        return 0;

    if ( _id_988F() )
    {
        _id_1153( var_5 );

        if ( !isdefined( var_0 ) )
            thread maps\_arcademode::arcademode_checkpoint_print();

        _func_089( var_5 );
        level.timeplayeddelta = gettime();
        setdvar( "ui_grenade_death", "0" );
    }

    return 1;
}

_id_1150( var_0 )
{
    var_0 waittill( "trigger" );
    _id_A5A4::_id_114E();
}

_id_988F()
{
    if ( !_func_086() )
        return 0;

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        var_1 = level._id_0323[var_0];

        if ( !var_1 _id_1165() )
            return 0;
    }

    if ( !common_scripts\utility::_id_382E( "can_save" ) )
        return 0;

    return 1;
}

_id_9896( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( common_scripts\utility::_id_382E( "disable_autosaves" ) )
        return 0;

    level endon( "nextmission" );
    level._id_0318 endon( "death" );

    if ( _id_A5A4::_id_500C() )
        level._id_6C5B endon( "death" );

    level notify( "trying_new_autosave" );

    if ( common_scripts\utility::_id_382E( "game_saving" ) )
        return 0;

    if ( isdefined( level._id_60D6 ) )
        return 0;

    var_7 = 1.25;
    var_8 = 1.25;

    if ( isdefined( var_3 ) && var_3 < var_7 + var_8 )
    {

    }

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = "$default";

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    common_scripts\utility::_id_383F( "game_saving" );
    var_9 = _id_3F53();
    var_10 = gettime();

    for (;;)
    {
        if ( _id_1161( undefined, var_4 ) )
        {
            var_11 = _func_088( var_0, var_9, var_2, var_5 );

            if ( var_11 < 0 )
                break;

            wait 0.05;

            if ( _func_087() )
            {
                level._id_5578 = gettime();
                level.lasttimeplayedregister = level._id_5578;
                break;
            }

            wait(var_7);

            if ( !_id_1161( undefined, var_4 ) )
                continue;

            wait(var_8);

            if ( !_id_1162() )
                continue;

            if ( isdefined( var_3 ) )
            {
                if ( gettime() > var_10 + var_3 * 1000 )
                    break;
            }

            if ( !common_scripts\utility::_id_382E( "can_save" ) )
                break;

            if ( common_scripts\utility::_id_382E( "being_spotted" ) )
                break;

            if ( !_func_08A( var_11 ) )
            {
                common_scripts\utility::_id_3831( "game_saving" );
                return 0;
            }

            if ( level._id_038E == "scoutsniper" && isdefined( var_6 ) && var_6 == "cargo2" )
            {
                if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
                    continue;
            }

            _id_1153( var_11 );
            thread maps\_arcademode::arcademode_checkpoint_print();
            _func_089( var_11 );
            _id_A5A4::save_time_played();
            level._id_55D6 = gettime();
            level.lasttimeplayedregister = gettime();
            setdvar( "ui_grenade_death", "0" );
            break;
        }

        wait 0.25;
    }

    common_scripts\utility::_id_3831( "game_saving" );
    return 1;
}

_id_359B()
{
    foreach ( var_1 in level._id_05A7 )
    {
        if ( ![[ var_1["func"] ]]() )
        {
            _id_1168( "autosave failed: " + var_1["msg"] );
            return 1;
        }
    }

    return 0;
}

_id_1162()
{
    return _id_1161( 0, 0 );
}

_id_1161( var_0, var_1 )
{
    if ( isdefined( level._id_1146 ) )
        return [[ level._id_1146 ]]();

    if ( isdefined( level._id_8A1C ) && ![[ level._id_8A1C ]]() )
        return 0;

    if ( level._id_5CDE )
        return 0;

    if ( maps\_arcademode::arcademode_complete() )
        return 0;

    if ( !isdefined( var_0 ) )
        var_0 = level._id_2D70;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
    {
        if ( ![[ level._id_4224["_autosave_stealthcheck"] ]]() )
            return 0;
    }

    for ( var_2 = 0; var_2 < level._id_0323.size; var_2++ )
    {
        var_3 = level._id_0323[var_2];

        if ( !var_3 _id_1165() )
            return 0;

        if ( var_0 && !var_3 _id_1160() )
            return 0;
    }

    if ( level._id_115E )
    {
        if ( !_id_116B( var_0 ) )
            return 0;
    }

    for ( var_2 = 0; var_2 < level._id_0323.size; var_2++ )
    {
        var_3 = level._id_0323[var_2];

        if ( !var_3 _id_1167( var_0 ) )
            return 0;
    }

    if ( isdefined( level._id_1ADC ) && !level._id_1ADC )
        return 0;

    if ( _id_359B() )
        return 0;

    if ( !_func_086() )
    {
        _id_1168( "autosave failed: save call was unsuccessful" );
        return 0;
    }

    return 1;
}

_id_1167( var_0 )
{
    if ( level._id_038E == "ac130" )
        return 1;

    if ( isdefined( level._id_06D0 ) && level._id_06D0 == self )
        return 1;

    if ( self _meth_8130() && var_0 )
    {
        _id_1168( "autosave failed:player is meleeing" );
        return 0;
    }

    if ( self _meth_812E() && var_0 )
    {
        _id_1168( "autosave failed:player is throwing a grenade" );
        return 0;
    }

    if ( self _meth_812F() && var_0 )
    {
        _id_1168( "autosave failed:player is firing" );
        return 0;
    }

    if ( isdefined( self._id_83BD ) && self._id_83BD )
    {
        _id_1168( "autosave failed:player is in shellshock" );
        return 0;
    }

    if ( common_scripts\utility::_id_5108() )
    {
        _id_1168( "autosave failed:player is flashbanged" );
        return 0;
    }

    return 1;
}

_id_1160()
{
    if ( isdefined( level._id_611B ) && level._id_611B )
        return 1;

    if ( level._id_038E == "ac130" )
        return 1;

    if ( isdefined( level._id_06D0 ) && level._id_06D0 == self )
        return 1;

    var_0 = self _meth_8309();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = self _meth_8331( var_0[var_1] );

        if ( var_2 > 0.1 )
            return 1;
    }

    _id_1168( "autosave failed: ammo too low" );
    return 0;
}

_id_1165()
{
    if ( level._id_038E == "ac130" )
        return 1;

    if ( isdefined( level._id_06D0 ) && level._id_06D0 == self )
        return 1;

    if ( _id_A5A4::_id_32DC( "laststand_downed" ) && _id_A5A4::_id_32D8( "laststand_downed" ) )
        return 0;

    var_0 = self._id_01E6 / self._id_0271;

    if ( var_0 < 0.5 )
        return 0;

    if ( _id_A5A4::_id_32D8( "_radiation_poisoning" ) )
        return 0;

    if ( _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
        return 0;

    return 1;
}

_id_116B( var_0 )
{
    if ( level._id_038E == "ac130" )
        return 1;

    if ( isdefined( level._id_06D0 ) && level._id_06D0 == self )
        return 1;

    var_1 = _func_0DA( "bad_guys", "all" );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3._id_0142 ) )
            continue;

        if ( !_func_1AD( var_3._id_0142 ) )
            continue;

        if ( var_3._id_04D9 == "dog" )
        {
            foreach ( var_5 in level._id_0323 )
            {
                if ( _func_0EE( var_3._id_02E2, var_5._id_02E2 ) < 384 )
                    return 0;
            }

            continue;
        }

        if ( isdefined( var_3._id_5B36 ) && isdefined( var_3._id_5B36._id_04A4 ) && _func_1AD( var_3._id_5B36._id_04A4 ) )
            return 0;

        var_7 = [[ level._id_1152 ]]( var_3 );

        if ( var_7 == "return_even_if_low_accuracy" )
            return 0;

        if ( var_3._id_017A < 0.021 && var_3._id_017A > -1 )
            continue;

        if ( var_7 == "return" )
            return 0;

        if ( var_7 == "none" )
            continue;

        if ( var_3.a._id_55D7 > gettime() - 500 )
        {
            if ( var_0 || var_3 animscripts\utility::_id_1AE1( 0 ) && var_3 _meth_81C1( 0 ) )
                return 0;
        }

        if ( isdefined( var_3.a._id_0979 ) && var_3 animscripts\utility::_id_1AE1( 0 ) && var_3 _meth_81C1( 0 ) )
            return 0;
    }

    if ( _id_A5A4::_id_6B6F() )
        return 0;

    var_9 = getentarray( "destructible", "classname" );

    foreach ( var_11 in var_9 )
    {
        if ( !isdefined( var_11._id_4788 ) )
            continue;

        foreach ( var_5 in level._id_0323 )
        {
            if ( _func_0EE( var_11._id_02E2, var_5._id_02E2 ) < 400 )
                return 0;
        }
    }

    return 1;
}

_id_3251()
{
    if ( self._id_017A >= 0.021 )
        return 1;

    foreach ( var_1 in level._id_0323 )
    {
        if ( _func_0EE( self._id_02E2, var_1._id_02E2 ) < 500 )
            return 1;
    }

    return 0;
}

_id_1152( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        var_3 = _func_0EE( var_0._id_02E2, var_2._id_02E2 );

        if ( var_3 < 200 )
        {
            return "return_even_if_low_accuracy";
            continue;
        }

        if ( var_3 < 360 )
        {
            return "return";
            continue;
        }

        if ( var_3 < 1000 )
            return "threat_exists";
    }

    return "none";
}

_id_1153( var_0 )
{
    if ( !_id_A5A4::_id_5016() )
        return;

    var_1 = _id_A5A5::_id_3DB8();
    var_2 = var_1;

    if ( isdefined( level._id_726C ) )
        var_2 = var_1 - level._id_726C;

    level._id_726C = var_1;
    _func_104( "script_checkpoint: id %d, leveltime %d, deltatime %d", var_0, var_1, var_2 );
}

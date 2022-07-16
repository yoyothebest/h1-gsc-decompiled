// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_534B = maps\mp\gametypes\_tweakables::_id_4142( "game", "allowkillcam" );
}

_id_7F9B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    return 0;
}

_id_6EF9( var_0, var_1, var_2, var_3 )
{
    if ( _func_1AD( self ) && isdefined( var_1 ) && _func_1AD( var_1 ) )
    {
        var_4 = gettime();
        waitframe;

        if ( _func_1AD( self ) && isdefined( var_1 ) && _func_1AD( var_1 ) )
        {
            var_4 = ( gettime() - var_4 ) / 1000;
            var_5 = maps\mp\gametypes\_playerlogic::_id_3C60();
            var_6 = var_1 _meth_841F( var_2 + var_4, var_3, var_5 );
            var_7 = spawnstruct();
            var_7._id_04A7 = var_1._id_04A7;
            var_7._id_0513 = var_1._id_57DF;
            var_8 = spawnstruct();
            var_8.cust = var_7;
            var_8._id_A2E6 = var_6;
            self.killcamstream = var_8;
            self _meth_8420( var_7, var_6 );
            self _meth_852C( var_3 );
        }
    }
}

_id_5353( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( getdvar( "scr_killcam_time" ) == "" )
    {
        var_7 = maps\mp\_utility::_id_8F5C( var_1, "_lefthand" );

        if ( var_5 || var_1 == "artillery_mp" )
            var_8 = ( gettime() - var_0 ) / 1000 - var_2 - 0.1;
        else if ( var_6 )
            var_8 = 4.0;
        else if ( _func_120( var_1, "remotemissile_" ) )
            var_8 = 5;
        else if ( !var_3 )
            var_8 = 5.0;
        else if ( var_7 == "h1_fraggrenade_mp" || var_7 == "h1_fraggrenadeshort_mp" )
            var_8 = 4.25;
        else
            var_8 = 2.5;
    }
    else
        var_8 = getdvarfloat( "scr_killcam_time" );

    if ( var_5 && var_8 > 5 )
        var_8 = 5;

    if ( isdefined( var_4 ) )
    {
        if ( var_8 > var_4 )
            var_8 = var_4;

        if ( var_8 < 0.05 )
            var_8 = 0.05;
    }

    return var_8;
}

killcamadjustalivetime( var_0, var_1, var_2 )
{
    var_3 = 1000;

    if ( isdefined( var_1 ) && isdefined( var_2 ) && var_1 != var_2 )
        return var_3;

    return var_0;
}

killcamarchivetime( var_0, var_1, var_2, var_3 )
{
    if ( var_0 > var_1 )
        var_0 = var_1;

    var_4 = var_0 + var_2 + var_3;
    return var_4;
}

_id_5354( var_0, var_1 )
{
    return var_1 && level._id_534B && !( isdefined( var_0._id_1AB3 ) && var_0._id_1AB3 ) && game["state"] == "playing" && !var_0 maps\mp\_utility::_id_51E3() && !level._id_8516 && !_func_1FF( var_0 );
}

_id_534B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_18 )
{
    self endon( "disconnect" );
    self endon( "spawned" );
    level endon( "game_ended" );

    if ( var_1 < 0 || !isdefined( var_13 ) )
        return;

    level._id_62AB++;
    var_19 = level._id_62AB * 0.05;

    if ( level._id_62AB > 1 )
        wait(0.05 * ( level._id_62AB - 1 ));

    wait 0.05;
    level._id_62AB--;
    var_20 = _id_5353( var_3, var_4, var_8, var_11, var_12, var_18, level._id_8516 );

    if ( getdvar( "scr_killcam_posttime" ) == "" )
        var_21 = 2;
    else
    {
        var_21 = getdvarfloat( "scr_killcam_posttime" );

        if ( var_21 < 0.05 )
            var_21 = 0.05;
    }

    var_22 = var_20 + var_21;

    if ( isdefined( var_12 ) && var_22 > var_12 )
    {
        if ( var_12 < 2 )
            return;

        if ( var_12 - var_20 >= 1 )
            var_21 = var_12 - var_20;
        else
        {
            var_21 = 1;
            var_20 = var_12 - 1;
        }

        var_22 = var_20 + var_21;
    }

    self _meth_82F8( "ui_killcam_end_milliseconds", 0 );

    if ( _func_1FF( var_13 ) && !isdefined( var_13._id_50A6 ) )
        return;

    if ( _func_1AD( var_14 ) )
        self _meth_82F8( "ui_killcam_victim_id", var_14 _meth_81B5() );
    else
        self _meth_82F8( "ui_killcam_victim_id", -1 );

    if ( _func_1AD( var_13 ) )
        self _meth_82F8( "ui_killcam_killedby_id", var_13 _meth_81B5() );
    else if ( _func_1FF( var_13 ) )
        self _meth_82F8( "ui_killcam_killedby_id", -1 );

    if ( maps\mp\_utility::_id_513D( var_4 ) )
    {
        var_23 = maps\mp\_utility::_id_3FF5( level._id_53AF[var_4] );
        self _meth_82F8( "ui_killcam_killedby_killstreak", var_23 );
        self _meth_82F8( "ui_killcam_killedby_weapon", -1 );
        self _meth_82F8( "ui_killcam_killedby_weapon_custom", -1 );
        self _meth_82F8( "ui_killcam_killedby_weapon_alt", 0 );
        self _meth_82F8( "ui_killcam_copycat", 0 );
    }
    else
    {
        var_24 = [];
        var_25 = _func_060( var_4 );

        if ( isdefined( var_25 ) )
        {
            if ( maps\mp\_utility::_id_5150( var_15 ) && !maps\mp\gametypes\_weapons::_id_5192( var_4 ) )
                var_25 = "iw5_combatknife";
            else
            {
                var_25 = maps\mp\_utility::_id_8F5C( var_25, "_lefthand" );
                var_25 = maps\mp\_utility::_id_8F5C( var_25, "_mp" );
            }

            self _meth_82F8( "ui_killcam_killedby_weapon", var_5 );
            self _meth_82F8( "ui_killcam_killedby_weapon_custom", var_6 );
            self _meth_82F8( "ui_killcam_killedby_weapon_alt", var_7 );
            self _meth_82F8( "ui_killcam_killedby_killstreak", -1 );

            if ( var_25 != "iw5_combatknife" )
                var_24 = _func_061( var_4 );

            self _meth_82F8( "ui_killcam_copycat", 0 );
        }
        else
        {
            self _meth_82F8( "ui_killcam_killedby_weapon", -1 );
            self _meth_82F8( "ui_killcam_killedby_weapon_custom", -1 );
            self _meth_82F8( "ui_killcam_killedby_weapon_alt", 0 );
            self _meth_82F8( "ui_killcam_killedby_killstreak", -1 );
            self _meth_82F8( "ui_killcam_copycat", 0 );
        }
    }

    if ( _func_1AD( var_14 ) && var_14._id_0308["nemesis_guid"] == var_13._id_4450 && var_14._id_0308["nemesis_tracking"][var_13._id_4450] >= 2 )
        self _meth_82F8( "ui_killcam_killedby_nemesis", 1 );
    else
        self _meth_82F8( "ui_killcam_killedby_nemesis", 0 );

    if ( !var_11 && !level._id_3BDA )
        self _meth_82F8( "ui_killcam_text", "skip" );
    else if ( !level._id_3BDA )
        self _meth_82F8( "ui_killcam_text", "respawn" );
    else
        self _meth_82F8( "ui_killcam_text", "none" );

    switch ( var_16 )
    {
        case "score":
            self _meth_82F8( "ui_killcam_type", 1 );
            break;
        case "normal":
        default:
            self _meth_82F8( "ui_killcam_type", 0 );
            break;
    }

    var_26 = var_20 + var_8 + var_19;
    var_27 = gettime();
    self notify( "begin_killcam", var_27 );

    if ( !_func_1FF( var_13 ) && isdefined( var_13 ) && _func_1AD( var_14 ) )
        var_13 _meth_82A0( var_14 );

    maps\mp\_utility::_id_9B69( "spectator" );
    self._id_03DE = 1;

    if ( _func_1FF( var_13 ) )
        var_1 = var_14 _meth_81B5();

    self _meth_852B( 0 );
    self._id_0196 = var_1;
    self._id_0237 = -1;
    var_28 = _id_7F9B( var_0, var_1, var_2, var_4, var_14, var_20 );

    if ( !var_28 )
        thread _id_7F9A( var_2, var_26, var_3 );

    var_17 = killcamadjustalivetime( var_17, var_1, var_2 );

    if ( var_26 > var_17 )
        var_26 = var_17;

    self.archivetime = var_26;
    self._id_534F = var_22;
    self._id_034B = var_9;
    self _meth_826F( "allies", 1 );
    self _meth_826F( "axis", 1 );
    self _meth_826F( "freelook", 1 );
    self _meth_826F( "none", 1 );

    if ( level._id_5FEC )
    {
        foreach ( var_30 in level._id_91F7 )
            self _meth_826F( var_30, 1 );
    }

    foreach ( var_30 in level._id_91F7 )
        self _meth_826F( var_30, 1 );

    thread _id_315A();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    if ( self.archivetime < var_26 )
    {

    }

    var_20 = self.archivetime - 0.05 - var_8;
    var_22 = var_20 + var_21;
    self._id_534F = var_22;

    if ( var_20 <= 0 )
    {
        maps\mp\_utility::_id_9B69( "dead" );
        maps\mp\_utility::_id_1EF2();
        self notify( "killcam_ended" );
        return;
    }

    self _meth_82F8( "ui_killcam_end_milliseconds", _func_0BC( var_22 * 1000 ) + gettime() );

    if ( level._id_8516 )
        thread _id_2C7D( var_20, var_2 );

    self._id_534B = 1;
    thread _id_89A6();
    self._id_85BF = 0;
    self._id_5351 = maps\mp\_utility::_id_412E();

    if ( !level._id_8516 )
        thread _id_A05B( var_10 );
    else
        self notify( "showing_final_killcam" );

    thread _id_31B3();
    _id_A0DF();

    if ( level._id_8516 )
    {
        if ( self == var_13 )
            var_13 maps\mp\gametypes\_misions::_id_6FF6( "ch_moviestar" );

        thread maps\mp\gametypes\_playerlogic::_id_89B6();
        return;
    }

    thread _id_534C( 1 );
}

_id_2C7D( var_0, var_1 )
{
    if ( isdefined( level._id_2CE6 ) )
        return;

    level._id_2CE6 = 1;
    var_2 = var_0;

    if ( var_2 > 1.0 )
    {
        var_2 = 1.0;
        wait(var_0 - 1.0);
    }

    _func_0B1( 1.0, 0.25, var_2 );
    wait(var_2 + 0.5);
    _func_0B1( 0.25, 1, 1.0 );
    level._id_2CE6 = undefined;
}

_id_A0DF()
{
    self endon( "abort_killcam" );
    wait(self._id_534F - 0.05);
}

_id_7F9A( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    var_3 = gettime() - var_1 * 1000;

    if ( var_2 > var_3 )
    {
        wait 0.05;
        var_1 = self.archivetime;
        var_3 = gettime() - var_1 * 1000;

        if ( var_2 > var_3 )
            wait(( var_2 - var_3 ) / 1000);
    }

    self._id_0237 = var_0;
}

_id_A05B( var_0 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    while ( self _meth_8339() )
        wait 0.05;

    while ( !self _meth_8339() )
        wait 0.05;

    self._id_85BF = 1;

    if ( isdefined( self._id_0308["totalKillcamsSkipped"] ) )
        self._id_0308["totalKillcamsSkipped"]++;

    if ( var_0 <= 0 )
        maps\mp\_utility::_id_1EF5( "kc_info" );

    self notify( "abort_killcam" );
}

_id_31B3()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    for (;;)
    {
        if ( self.archivetime <= 0 )
            break;

        wait 0.05;
    }

    self notify( "abort_killcam" );
}

_id_89A6()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    self waittill( "spawned" );
    thread _id_534C( 0 );
}

_id_315A()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    level waittill( "game_ended" );
    thread _id_534C( 1 );
}

_id_534C( var_0 )
{
    self _meth_82F8( "ui_killcam_end_milliseconds", 0 );
    self._id_534B = undefined;

    if ( isdefined( self._id_5351 ) && _func_1AD( self ) && isdefined( self._id_56F7 ) && maps\mp\_matchdata::_id_1AD1( self._id_56F7 ) )
    {
        var_1 = maps\mp\_utility::_id_412E();
        _func_12F( "lives", self._id_56F7, "killcamWatchTimeDeciSeconds", maps\mp\_utility::_id_1E28( var_1 - self._id_5351 ) );
    }

    if ( !level._id_3BDA )
        maps\mp\_utility::_id_1EF5( "kc_info" );

    thread maps\mp\gametypes\_spectating::_id_8019();
    self notify( "killcam_ended" );

    if ( !var_0 )
        return;

    maps\mp\_utility::_id_9B69( "dead" );
    maps\mp\_utility::_id_1EF2();
}

_id_1AB5()
{
    self._id_1AB3 = 0;
    thread _id_1AB6( ::_id_1AB9, ::_id_1AB4 );
}

_id_1AB9()
{
    return self _meth_8339();
}

_id_1AB7()
{
    return self _meth_82EB();
}

_id_1AB4()
{
    self._id_1AB3 = 1;
}

_id_1AB8()
{
    self._id_1AB3 = 1;
    self._id_A152 = 1;
}

_id_1AB6( var_0, var_1 )
{
    self endon( "death_delay_finished" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !self [[ var_0 ]]() )
        {
            wait 0.05;
            continue;
        }

        var_2 = 0;

        while ( self [[ var_0 ]]() )
        {
            var_2 += 0.05;
            wait 0.05;
        }

        if ( var_2 >= 0.5 )
            continue;

        var_2 = 0;

        while ( !self [[ var_0 ]]() && var_2 < 0.5 )
        {
            var_2 += 0.05;
            wait 0.05;
        }

        if ( var_2 >= 0.5 )
            continue;

        self [[ var_1 ]]();
        return;
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_785B = 1;
    level._id_785C = 1;
    level._id_5A4A = _func_0E1( maps\mp\_utility::_id_3FDB( "scr_maxPerPlayerExplosives", 2 ), 1 );
    level._id_7557 = maps\mp\_utility::_id_3FDB( "scr_riotShieldXPBullets", 15 );
    createthreatbiasgroup( "DogsDontAttack" );
    createthreatbiasgroup( "Dogs" );
    setignoremegroup( "DogsDontAttack", "Dogs" );

    switch ( maps\mp\_utility::_id_3FDB( "perk_scavengerMode", 0 ) )
    {
        case 1:
            level._id_785B = 0;
            break;
        case 2:
            level._id_785C = 0;
            break;
        case 3:
            level._id_785B = 0;
            level._id_785C = 0;
            break;
    }

    var_0 = getdvar( "g_gametype" );
    var_1 = maps\mp\_utility::_id_3F09();
    var_1 = common_scripts\utility::_id_0AF9( var_1 );
    var_2 = _func_29D( "mp/statstable.csv" );
    var_3 = _func_29E( "mp/statstable.csv" );
    level._id_A2DD = [];
    level._id_A2D3 = [];

    for ( var_4 = 0; var_4 <= var_2; var_4++ )
    {
        if ( !_func_120( _func_1BC( "mp/statstable.csv", var_4, 2 ), "weapon_" ) )
            continue;

        if ( _func_1BC( "mp/statstable.csv", var_4, 51 ) != "" )
            continue;

        if ( _func_1BC( "mp/statstable.csv", var_4, var_3 - 1 ) == "Never" )
            continue;

        var_5 = _func_1BC( "mp/statstable.csv", var_4, 4 );

        if ( var_5 == "" || var_5 == "none" )
            continue;

        if ( _func_120( var_5, "iw5" ) || _func_120( var_5, "iw6" ) )
        {
            var_6 = maps\mp\_utility::_id_416C( var_5 );
            var_5 = var_6[0] + "_" + var_6[1] + "_mp";
            level._id_A2DD[level._id_A2DD.size] = var_5;
            continue;
        }
        else
            level._id_A2DD[level._id_A2DD.size] = var_5 + "_mp";

        var_7 = maps\mp\_utility::_id_4160( var_5 );
        var_8 = [];

        foreach ( var_10 in var_1 )
        {
            if ( !isdefined( var_7[var_10] ) )
                continue;

            level._id_A2DD[level._id_A2DD.size] = var_5 + "_" + var_10 + "_mp";
            var_8[var_8.size] = var_10;
        }

        var_12 = [];

        for ( var_13 = 0; var_13 < var_8.size - 1; var_13++ )
        {
            var_14 = _func_1BF( "mp/attachmentCombos.csv", 0, var_8[var_13] );

            for ( var_15 = var_13 + 1; var_15 < var_8.size; var_15++ )
            {
                if ( _func_1BB( "mp/attachmentCombos.csv", 0, var_8[var_15], var_14 ) == "no" )
                    continue;

                var_12[var_12.size] = var_8[var_13] + "_" + var_8[var_15];
            }
        }

        foreach ( var_17 in var_12 )
            level._id_A2DD[level._id_A2DD.size] = var_5 + "_" + var_17 + "_mp";
    }

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        foreach ( var_20 in level._id_A2DD )
            precacheitem( var_20 );
    }

    thread maps\mp\_flashgrenades::main();
    thread maps\mp\_entityheadicons::init();

    if ( !isdefined( level._id_A2D8 ) )
        level._id_A2D8 = ::_id_2F99;

    var_23 = 70;
    level._id_1E44 = _func_0B7( var_23 );
    level._id_1E46 = 20;
    level._id_1E45 = 0.75;
    level._id_1E47 = 192;

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        level._id_5C58 = 0.3;
        level._id_5C5A = 100;
        level._id_5C59 = 20;
        level._id_5C56 = 256;
        level._id_5C54 = 70;
        level._id_5C53 = 210;
        level._id_5C51 = 46;
        level._id_5C5F = 120;
    }

    level._id_27E9 = 3.0;
    level._id_8E46 = loadfx( "fx/explosions/aerial_explosion_large" );
    level.meleeweaponbloodflick = loadfx( "vfx/blood/blood_flick_melee_weapon" );
    level._id_6F81 = [];
    level._id_855B = [];
    level._id_43E1 = [];
    level._id_5C8C = [];
    level._id_4F99 = [];
    level._id_5C5D = [];
    level._id_9828 = [];
    precachemodel( "weapon_claymore_bombsquad_mw1" );
    precachemodel( "weapon_c4_bombsquad_mw1" );
    _func_258( "mp_attachment_lasersight" );
    _func_258( "mp_attachment_lasersight_short" );
    level.c4fxid = loadfx( "vfx/lights/light_c4_blink" );
    level.claymorefxid = loadfx( "vfx/props/claymore_laser" );
    level thread _id_64C8();
    level._id_1974 = 0;
    common_scripts\utility::_id_0D13( getentarray( "misc_turret", "classname" ), ::_id_9974 );
}

_id_1550()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = maps\mp\_utility::_id_8F5C( var_1, "_lefthand" );

        if ( var_2 == "h1_c4_mp" )
        {
            if ( !isdefined( level.bombsquadmodelc4 ) )
                level.bombsquadmodelc4 = "weapon_c4_bombsquad_mw1";

            var_0 thread _id_23E6( level.bombsquadmodelc4, "tag_origin", self );
            continue;
        }

        if ( var_2 == "h1_claymore_mp" )
        {
            if ( !isdefined( level.bombsquadmodelclaymore ) )
                level.bombsquadmodelclaymore = "weapon_claymore_bombsquad_mw1";

            var_0 thread _id_23E6( level.bombsquadmodelclaymore, "tag_origin", self );
        }
    }
}

_id_23E6( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 _meth_8056();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    var_3 thread _id_154F( var_2 );
    var_3 _meth_80B3( var_0 );
    var_3 _meth_804F( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 _meth_80C0( 0 );
    self waittill( "death" );

    if ( isdefined( self._id_04C5 ) )
        self._id_04C5 delete();

    var_3 delete();
}

_id_154F( var_0 )
{
    self endon( "death" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0._id_04A7;
    checkbombsquadvisibility( var_0, var_1 );

    for (;;)
    {
        level common_scripts\utility::_id_A069( "joined_team", "player_spawned", "changed_kit", "update_bombsquad" );
        self _meth_8056();
        checkbombsquadvisibility( var_0, var_1 );
    }
}

checkbombsquadvisibility( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
    {
        if ( level._id_91EB )
        {
            if ( !isdefined( var_3._id_04A7 ) || var_3._id_04A7 == "spectator" )
                continue;

            if ( var_3._id_04A7 != var_1 && var_3 maps\mp\_utility::_id_05CB( "specialty_detectexplosive" ) )
                self _meth_8007( var_3 );

            continue;
        }

        if ( isdefined( var_0 ) && var_3 == var_0 )
            continue;

        if ( !var_3 maps\mp\_utility::_id_05CB( "specialty_detectexplosive" ) )
            continue;

        self _meth_8007( var_3 );
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_4926 = 0;
        var_0._id_51A8 = 0;
        maps\mp\gametypes\_gamelogic::_id_7F85( var_0, 0 );
        var_0 thread _id_64D6();
        var_0 thread _id_1550();
        var_0 thread _id_A240();
        var_0 thread watchmeleeweapon();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        common_scripts\utility::_id_A069( "spawned_player", "faux_spawn" );
        self._id_252E = self _meth_830E();
        self._id_3082 = 0;
        self._id_20DF = 0;
        self._id_4926 = 0;
        self.meleeweaponbloodytime = undefined;
        maps\mp\gametypes\_gamelogic::_id_7F85( self, 0 );

        if ( !isdefined( self._id_94FB ) )
        {
            self._id_94FB = "";
            self._id_94FB = "none";
            self._id_94FC = 0;
            self._id_94FA = 0;
            self._id_94F9 = 0;
            self._id_94F7 = 0;
            self._id_94F8 = 0;
            self._id_94F6 = 0;
            self._id_94FD = 0;
        }

        thread _id_A25A();
        thread _id_A265();
        thread _id_A232();
        thread _id_A25D();
        thread _id_A264();
        thread _id_A23D();
        thread watchweaponinspection();

        if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
        {

        }

        thread _id_8AFC();
        thread maps\mp\_opticsthermal::_id_6542();
        thread maps\mp\_lasersight::_id_54FF();
        thread _id_A22E();

        if ( !maps\mp\_utility::_id_4FA6() )
            thread _id_A257();

        thread _id_A263();

        if ( isdefined( level.onplayerspawnedweaponsfunc ) )
            self thread [[ level.onplayerspawnedweaponsfunc ]]();

        self._id_55AB = [];
        self._id_2F74 = undefined;
        self._id_93E8 = [];
        self._id_680B = [];
        thread _id_9B5E();
        self._id_252E = undefined;
        self._id_9845 = undefined;
        thread _id_94A2();

        if ( !isdefined( self._id_89E4 ) )
            self._id_89E4 = spawnstruct();

        self._id_89E4._id_03DC = gettime();
        self._id_89E4._id_2596 = 0;
        self._id_89E4._id_25AC = 0;
        self._id_89E4._id_126D = 0;
        var_0 = self._id_89E4._id_03DC;

        if ( !isdefined( self._id_6282 ) )
            self._id_6282 = 0;

        self._id_6282++;

        if ( _func_1FF( self ) )
            return;

        var_1 = 0.1;
        var_2 = var_1;
        var_3 = "_matchdata.gsc";
        var_4 = -1;
        var_5 = -1;
        var_6 = -1;

        if ( isdefined( self._id_89E4 ) )
        {
            if ( isdefined( self._id_89E4._id_89FD ) )
            {
                if ( isdefined( self._id_89E4._id_89FD._id_5188 ) )
                    var_4 = self._id_89E4._id_89FD._id_5188;

                if ( isdefined( self._id_89E4._id_89FD._id_6293 ) )
                    var_5 = self._id_89E4._id_89FD._id_6293;

                if ( isdefined( self._id_89E4._id_89FD._id_5609 ) )
                    var_6 = self._id_89E4._id_89FD._id_5609;
            }
        }

        _func_105( self._id_03DB, "script_mp_playerspawn: player_name %s, life_id %d, life_index %d, was_tactical_insertion %b, team %s, gameTime %d, version %f, script_file %s, randomSpawn %b, number_of_choices %d, last_update_time %d", self._id_02A7, self._id_56F7, self._id_6282, self._id_A1D2, self._id_04A7, var_0, var_2, var_3, var_4, var_5, var_6 );
    }
}

_id_728B()
{
    self._id_0308["toggleScopeStates"] = [];
    var_0 = self _meth_8309();

    foreach ( var_2 in var_0 )
    {
        if ( var_2 == self._id_0340 || var_2 == self._id_03B3 )
        {
            var_3 = _func_061( var_2 );

            foreach ( var_5 in var_3 )
            {
                if ( var_5 == "variablereddot" )
                {
                    self._id_0308["toggleScopeStates"][var_2] = self _meth_8314( var_2 );
                    break;
                }
            }
        }
    }
}

_id_A25D()
{
    maps\mp\_stinger::_id_8E5B();
}

_id_A263()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    thread _id_A25C();
    self._id_5598 = self._id_252E;
    self._id_4929 = [];
    var_0 = self _meth_830E();

    if ( maps\mp\_utility::_id_50D1( var_0 ) && !isdefined( self._id_4929[var_0] ) )
        self._id_4929[var_0] = _func_1B1( var_0 );

    self._id_173A = undefined;

    if ( _func_120( var_0, "ranger" ) )
        thread _id_A24F( var_0 );

    var_1 = 1;

    for (;;)
    {
        if ( !var_1 )
            self waittill( "weapon_change" );

        var_1 = 0;
        var_0 = self _meth_830E();

        if ( var_0 == "none" )
            continue;

        var_2 = _func_061( var_0 );
        self.has_opticsthermal = 0;
        self.has_target_enhancer = 0;
        self.has_stock = 0;
        self.has_laser = 0;

        if ( isdefined( var_2 ) )
        {
            foreach ( var_4 in var_2 )
            {
                if ( var_4 == "opticstargetenhancer" )
                {
                    self.has_target_enhancer = 1;
                    continue;
                }

                if ( var_4 == "stock" )
                {
                    self.has_stock = 1;
                    continue;
                }

                if ( var_4 == "lasersight" )
                {
                    self.has_laser = 1;
                    continue;
                }

                if ( _func_120( var_4, "opticsthermal" ) )
                    self.has_opticsthermal = 1;
            }
        }

        if ( maps\mp\_utility::_id_50C9( var_0 ) )
            continue;

        var_6 = maps\mp\_utility::_id_416C( var_0 );
        self._id_173A = undefined;

        if ( _func_120( var_0, "ranger" ) )
            thread _id_A24F( var_0 );

        if ( var_6[0] == "alt" )
        {
            var_7 = _func_122( var_0, 4 );
            var_0 = var_7;
            var_6 = maps\mp\_utility::_id_416C( var_0 );
        }

        if ( var_0 != "none" && var_6[0] != "iw5" && var_6[0] != "iw6" && var_6[0] != "h1" )
        {
            if ( maps\mp\_utility::_id_50D1( var_0 ) && !isdefined( self._id_4929[var_0 + "_mp"] ) )
                self._id_4929[var_0 + "_mp"] = _func_1B1( var_0 + "_mp" );
        }
        else if ( var_0 != "none" && ( var_6[0] == "iw5" || var_6[0] == "iw6" || var_6[0] == "h1" ) )
        {
            if ( maps\mp\_utility::_id_50D1( var_0 ) && !isdefined( self._id_4929[var_0] ) )
                self._id_4929[var_0] = _func_1B1( var_0 );
        }

        if ( _id_5A5E( var_0 ) )
            self._id_5598 = var_0;

        self._id_1C87 = undefined;
    }
}

_id_A25C()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_1C87 = undefined;

    for (;;)
    {
        self waittill( "weapon_switch_started", var_0 );
        self._id_1C87 = var_0;

        if ( var_0 == "none" && isdefined( self._id_50D7 ) && self._id_50D7 )
        {
            while ( self._id_50D7 )
                wait 0.05;

            self._id_1C87 = undefined;
        }
    }
}

_id_A264()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self _meth_830E();
        self._id_173A = undefined;

        if ( !_func_120( var_0, "ranger" ) )
            continue;

        thread _id_A24F( var_0 );
    }
}

_id_A24F( var_0 )
{
    var_1 = self _meth_82F5( var_0, "right" );
    var_2 = self _meth_82F5( var_0, "left" );
    self endon( "reload" );
    self endon( "weapon_change" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "weapon_fired", var_3 );

        if ( var_3 != var_0 )
            continue;

        self._id_173A = undefined;

        if ( _func_120( var_0, "akimbo" ) )
        {
            var_4 = self _meth_82F5( var_0, "left" );
            var_5 = self _meth_82F5( var_0, "right" );

            if ( var_2 != var_4 && var_1 != var_5 )
                self._id_173A = 1;

            if ( !var_4 || !var_5 )
                return;

            var_2 = var_4;
            var_1 = var_5;
            continue;
        }

        if ( var_1 == 2 && !self _meth_82F5( var_0, "right" ) )
        {
            self._id_173A = 1;
            return;
        }
    }
}

_id_5A5E( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( _func_120( var_0, "uav" ) )
        return 0;

    if ( _func_120( var_0, "killstreak" ) )
        return 0;

    if ( maps\mp\_utility::_id_4167( var_0 ) == "weapon_projectile" )
        return 0;

    var_1 = _func_1E4( var_0 );

    if ( var_1 != "primary" )
        return 0;

    if ( _func_120( var_0, "combatknife" ) || _func_120( var_0, "underwater" ) )
        return 0;

    return 1;
}

_id_2F99( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_51E3() )
        waitframe;

    if ( isdefined( level._id_14B5 ) )
        return;

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_2F74 ) )
        return;

    if ( level._id_4C6D )
        return;

    var_2 = self._id_5598;

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2 == "none" )
        return;

    if ( !self _meth_8311( var_2 ) )
        return;

    if ( maps\mp\_utility::_id_5131() )
        return;

    if ( isdefined( level._id_3BF5 ) && !self [[ level._id_3BF5 ]]( var_2 ) )
        return;

    var_3 = maps\mp\_utility::_id_416C( var_2 );

    if ( var_3[0] == "alt" )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_4 > 0 && var_4 < 2 )
            {
                var_2 += var_3[var_4];
                continue;
            }

            if ( var_4 > 0 )
            {
                var_2 += ( "_" + var_3[var_4] );
                continue;
            }

            var_2 = "";
        }
    }

    if ( var_2 != "riotshield_mp" )
    {
        if ( !self _meth_82F7( var_2 ) )
            return;

        var_5 = self _meth_82F5( var_2, "right" );
        var_6 = self _meth_82F5( var_2, "left" );

        if ( !var_5 && !var_6 )
            return;

        var_7 = self _meth_82F6( var_2 );
        var_8 = _func_1E6( var_2 );

        if ( var_7 > var_8 )
            var_7 = var_8;

        var_9 = self _meth_824C( var_2 );

        if ( !isdefined( var_9 ) )
            return;

        if ( maps\mp\_utility::_id_5150( var_1 ) )
            var_9._id_02E2 = ( var_9._id_02E2[0], var_9._id_02E2[1], var_9._id_02E2[2] - 5 );

        var_9 _meth_8182( var_5, var_7, var_6 );
    }
    else
    {
        var_9 = self _meth_824C( var_2 );

        if ( !isdefined( var_9 ) )
            return;

        var_9 _meth_8182( 1, 1, 0 );
    }

    var_9 _meth_8182( 0, 0, 0, 1 );
    self._id_2F74 = 1;
    var_9._id_02E5 = self;
    var_9._id_6638 = var_0;
    var_9._id_04A6 = "dropped_weapon";
    var_9 thread _id_A249();
    var_9 thread _id_285D();
}

_id_2982( var_0, var_1 )
{
    var_2 = self _meth_802C();

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = self _meth_802D( var_3 );

        if ( var_4 != var_0 )
            continue;

        var_5 = self _meth_802E( var_3 );
        self _meth_802A( var_0, var_5 );

        if ( var_5 != var_1 )
        {
            var_2 = self _meth_802C();

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                var_5 = self _meth_802E( var_3 );

                if ( var_5 != var_1 )
                    continue;

                var_0 = self _meth_802D( var_3 );
                self _meth_802A( var_0, var_5 );
                break;
            }
        }

        return 1;
    }

    return 0;
}

_id_285D()
{
    self endon( "death" );
    wait 60;

    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_3FDC()
{
    var_0 = self.classname;
    var_1 = _func_122( var_0, 7 );
    return var_1;
}

_id_A249()
{
    self endon( "death" );
    var_0 = _id_3FDC();
    var_1 = self._id_02E5;

    for (;;)
    {
        self waittill( "trigger", var_2, var_3 );

        if ( isdefined( var_0 ) && var_0 == var_2._id_0340 )
            return;

        if ( isdefined( var_0 ) && var_0 == var_2._id_03B3 )
            return;

        var_2._id_680B[var_0] = undefined;
        var_2._id_93E8[var_0] = undefined;

        if ( isdefined( var_2._id_0308["weaponPickupsCount"] ) )
            var_2._id_0308["weaponPickupsCount"]++;

        if ( isdefined( var_1 ) && var_1 != var_2 )
        {
            var_2._id_680B[var_0] = var_1;

            if ( isdefined( self._id_6638 ) && self._id_6638 == var_2 )
                var_2._id_93E8[var_0] = var_1;
        }

        if ( isdefined( var_3 ) )
            break;
    }

    var_3._id_02E5 = var_2;
    var_3._id_04A6 = "dropped_weapon";
    var_4 = var_3 _id_3FDC();

    if ( isdefined( var_2._id_0340 ) && var_2._id_0340 == var_4 )
        var_2._id_0340 = var_0;

    if ( isdefined( var_2._id_03B3 ) && var_2._id_03B3 == var_4 )
        var_2._id_03B3 = var_0;

    if ( isdefined( var_2._id_680B[var_4] ) )
    {
        var_3._id_02E5 = var_2._id_680B[var_4];
        var_2._id_680B[var_4] = undefined;
    }

    if ( isdefined( var_2._id_93E8[var_4] ) )
    {
        var_3._id_6638 = var_2;
        var_2._id_93E8[var_4] = undefined;
    }

    var_3 thread _id_A249();
}

_id_520C()
{
    var_0 = _id_3FDC();
    var_1 = _func_1E7( var_0 );

    for ( var_2 = 1; var_1 != "none" && var_1 != var_0; var_2++ )
    {
        self _meth_8182( 0, 0, 0, var_2 );
        var_1 = _func_1E7( var_1 );
    }
}

_id_467D( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "scavenger", var_1 );
    var_1 notify( "scavenger_pickup" );
    var_2 = var_1 _meth_82CB();

    foreach ( var_4 in var_2 )
    {
        if ( maps\mp\gametypes\_class::_id_51F2( var_4 ) && var_1 maps\mp\_utility::_id_05CB( "specialty_tacticalresupply" ) )
        {
            var_1 _meth_84A0( var_4 );
            continue;
        }

        if ( maps\mp\gametypes\_class::_id_51EA( var_4 ) && var_1 maps\mp\_utility::_id_05CB( "specialty_lethalresupply" ) )
        {
            var_5 = var_1 _meth_82F5( var_4 );
            var_1 _meth_82F3( var_4, var_5 + 1 );
        }
    }

    if ( var_1 maps\mp\_utility::_id_05CB( "specialty_scavenger" ) )
    {
        var_7 = var_1 _meth_8309();

        foreach ( var_9 in var_7 )
        {
            if ( maps\mp\_utility::_id_50D1( var_9 ) || level._id_785C && maps\mp\_utility::_id_50D2( var_9 ) )
            {
                var_10 = var_1 _meth_82F6( var_9 );
                var_11 = 0;
                var_12 = maps\mp\_utility::_id_4167( var_9 );

                if ( isbeamweapon( var_9 ) || var_12 == "weapon_riot" || _func_120( var_9, "riotshield" ) )
                {

                }
                else if ( var_12 == "weapon_projectile" )
                {
                    if ( var_1 maps\mp\_utility::_id_05CB( "specialty_explosiveammoresupply" ) )
                        var_11 = _func_1B1( var_9 );
                }
                else if ( _func_120( var_9, "alt" ) && _func_120( var_9, "gl" ) )
                {
                    if ( var_1 maps\mp\_utility::_id_05CB( "specialty_explosiveammoresupply" ) )
                        var_11 = _func_1B1( var_9 );
                }
                else if ( _id_50CE( var_9 ) )
                {
                    if ( var_1 maps\mp\_utility::_id_05CB( "specialty_bulletresupply" ) )
                    {
                        var_13 = _func_1E6( var_9 );
                        var_11 = _func_0BC( var_13 * var_1._id_0B7B );
                    }
                }

                if ( var_11 > 0 )
                    var_1 _meth_82F4( var_9, var_10 + var_11 );
            }
        }
    }

    var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( "scavenger" );
}

_id_2F90( var_0 )
{
    waitframe;

    if ( level._id_4C6D )
        return;

    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == self )
        return;

    if ( level.iszombiegame )
        return;

    if ( !isdefined( self._id_08A2 ) )
        var_1 = self _meth_824D( "scavenger_bag_mp" );
    else
        var_1 = self._id_08A2 _meth_824D( "scavenger_bag_mp" );

    var_1 thread _id_467D( self );

    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bots_add_scavenger_bag"] ) )
        [[ level._id_161B["bots_add_scavenger_bag"] ]]( var_1 );
}

_id_4164( var_0 )
{
    return 2;
}

_id_4165( var_0 )
{
    return 1;
}

_id_3FA1()
{
    var_0 = "h1_fraggrenade_mp";
    var_1 = self _meth_8183( var_0 );
    return var_1;
}

_id_40CC()
{
    var_0 = "h1_smokegrenade_mp";
    var_1 = self _meth_8183( var_0 );
    return var_1;
}

_id_8356( var_0, var_1, var_2 )
{
    maps\mp\gametypes\_gamelogic::_id_8356( var_0, var_1, var_2 );
}

_id_A265( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );
        maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
        self._id_55D9 = gettime();

        if ( _func_0CF( self ) )
            continue;

        if ( !maps\mp\_utility::_id_50D1( var_1 ) && !maps\mp\_utility::_id_50D2( var_1 ) && !maps\mp\_utility::iscacmeleeweapon( var_1 ) )
            continue;

        if ( isdefined( self._id_4929[var_1] ) )
            thread _id_9B32( var_1 );

        var_2 = maps\mp\gametypes\_persistence::_id_8D69( "totalShots" ) + 1;
        var_3 = maps\mp\gametypes\_persistence::_id_8D69( "hits" );
        var_4 = _func_0E9( _func_0BD( var_3 ) / _func_0BD( var_2 ), 0.0, 1.0 ) * 10000.0;
        maps\mp\gametypes\_persistence::_id_8D79( "totalShots", var_2 );
        maps\mp\gametypes\_persistence::_id_8D79( "accuracy", _func_0BC( var_4 ) );
        maps\mp\gametypes\_persistence::_id_8D79( "misses", _func_0BC( var_2 - var_3 ) );

        if ( isdefined( self._id_55EC ) && self._id_55EC._id_55F1 == gettime() )
        {
            self._id_4926 = 0;
            return;
        }

        var_5 = 1;
        _id_8356( var_1, var_5, "shots" );
        _id_8356( var_1, self._id_4926, "hits" );
        self._id_4926 = 0;
    }
}

_id_9B32( var_0 )
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "updateMagShots_" + var_0 );
    self._id_4929[var_0]--;
    wait 0.05;
    self._id_4929[var_0] = _func_1B1( var_0 );
}

_id_1D0F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "updateMagShots_" + var_0 );
    waitframe;

    if ( isdefined( self._id_4929[var_0] ) && self._id_4929[var_0] == 0 )
    {
        var_1 = maps\mp\_utility::_id_4167( var_0 );
        maps\mp\gametypes\_misions::_id_3CAA( var_1 );
        self._id_4929[var_0] = _func_1B1( var_0 );
    }
}

_id_1D0E( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( maps\mp\_utility::_id_51BA( var_0, "alt_" ) )
    {
        var_2 = maps\mp\_utility::_id_416C( var_0 );

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == "shotgun" )
            {
                var_5 = _func_122( var_0, 0, 4 );

                if ( !_id_5185( var_5 ) && !_id_51A7( var_5 ) )
                    self._id_4926 = 1;

                continue;
            }

            if ( var_4 == "hybrid" )
            {
                var_6 = _func_122( var_0, 4 );
                var_0 = var_6;
            }
        }
    }

    var_8 = ismeleeinventoryweapon( var_0 );

    if ( !_id_5185( var_0 ) && !_id_51A7( var_0 ) && !var_8 )
        return;

    if ( self _meth_833C() && !var_8 )
        return;

    switch ( _func_1B8( var_0 ) )
    {
        case "rifle":
        case "smg":
        case "mg":
        case "pistol":
        case "sniper":
            self._id_4926++;
            break;
        case "spread":
            self._id_4926 = 1;
            break;
        default:
            break;
    }

    if ( _func_120( var_0, "riotshield" ) )
    {
        thread maps\mp\gametypes\_gamelogic::_id_9315( "riotshield", self._id_4926, "hits" );
        self._id_4926 = 0;
    }

    waitframe;

    if ( isdefined( self._id_4929[var_0] ) )
        thread _id_1D0F( var_0 );

    if ( !isdefined( self._id_55AB[var_0] ) )
        self._id_55AB[var_0] = 0;

    if ( self._id_55AB[var_0] == gettime() )
        return;

    self._id_55AB[var_0] = gettime();
    var_9 = maps\mp\gametypes\_persistence::_id_8D69( "totalShots" );
    var_10 = maps\mp\gametypes\_persistence::_id_8D69( "hits" ) + 1;

    if ( var_10 <= var_9 )
    {
        maps\mp\gametypes\_persistence::_id_8D79( "hits", var_10 );
        maps\mp\gametypes\_persistence::_id_8D79( "misses", _func_0BC( var_9 - var_10 ) );
        var_11 = _func_0E9( _func_0BD( var_10 ) / _func_0BD( var_9 ), 0.0, 1.0 ) * 10000.0;
        maps\mp\gametypes\_persistence::_id_8D79( "accuracy", _func_0BC( var_11 ) );
    }
}

_id_0E2B( var_0, var_1 )
{
    return _id_3AA6( var_1, var_0 );
}

_id_3AA6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return 1;

    if ( !level._id_91EB )
        return 1;

    var_3 = var_1._id_04A7;
    var_4 = level._id_01A7;

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( var_4 != 0 )
        return 1;

    if ( var_1 == var_0 )
        return 1;

    if ( !isdefined( var_3 ) )
        return 1;

    if ( var_3 != var_0._id_04A7 )
        return 1;

    return 0;
}

_id_A232()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_933E = undefined;
    self._id_428B = 0;

    if ( maps\mp\_utility::_id_3FDB( "scr_deleteexplosivesonspawn", 1 ) == 1 )
    {
        if ( isdefined( self._id_2D1E ) )
            self._id_2D1E = undefined;
        else
            _id_27F9();
    }
    else
    {
        if ( !isdefined( self._id_5979 ) )
            self._id_5979 = [];

        if ( !isdefined( self._id_1E43 ) )
            self._id_1E43 = [];

        if ( !isdefined( self._id_1756 ) )
            self._id_1756 = [];
    }

    thread _id_A23B();
    thread _id_A239();
    thread _id_A238();
    thread _id_A208();
    thread _id_A20A();
    thread _id_2847();
    thread _id_A22C();

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );
        _id_8356( var_0, 1, "shots" );
        maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
        thread _id_A242();

        if ( var_0 == "h1_claymore_mp" )
            continue;

        self._id_933E = var_0;
        self._id_428B = 1;

        if ( var_0 == "h1_c4_mp" )
            _id_1397();
        else
            _id_139C();

        self._id_933E = undefined;
    }
}

_id_139C()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "offhand_end" );
    self endon( "weapon_change" );
    var_0 = gettime();
    self waittill( "grenade_fire", var_1, var_2 );

    if ( isdefined( var_1 ) )
    {
        var_3 = maps\mp\_utility::_id_8F5C( var_2, "_lefthand" );

        if ( gettime() - var_0 > 1000 && var_3 == "h1_fraggrenade_mp" )
            var_1._id_50E8 = 1;

        self._id_1C87 = undefined;
        var_1._id_02E5 = self;
        var_1._id_A2DF = var_2;

        switch ( var_3 )
        {
            case "h1_fraggrenade_mp":
                var_1 thread maps\mp\gametypes\_shellshock::_id_43E9();
                var_1._id_65A3 = self;
                break;
        }
    }
}

_id_A242()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "grenade_fire" );
    self waittill( "offhand_end" );

    if ( isdefined( self._id_1C87 ) && self._id_1C87 != self _meth_830E() )
        self._id_1C87 = undefined;
}

_id_A25B()
{
    level endon( "smokeTimesUp" );
    var_0 = self._id_02E5;
    var_0 endon( "disconnect" );
    self waittill( "explode", var_1 );
    var_2 = 128;
    var_3 = 8;
    level thread _id_A05C( var_3, var_2, var_1 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        foreach ( var_5 in level._id_0323 )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( level._id_91EB && var_5._id_04A7 == var_0._id_04A7 )
                continue;

            if ( _func_0F0( var_5._id_02E2, var_1 ) < var_2 * var_2 )
            {
                var_5._id_4E42 = var_0;
                continue;
            }

            var_5._id_4E42 = undefined;
        }

        wait 0.05;
    }
}

_id_A05C( var_0, var_1, var_2 )
{
    maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
    level notify( "smokeTimesUp" );
    waitframe;

    foreach ( var_4 in level._id_0323 )
    {
        if ( isdefined( var_4 ) )
            var_4._id_4E42 = undefined;
    }
}

_id_A240()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );
        var_2 = [ var_0 ];

        if ( _func_120( var_1, "_gl" ) )
        {
            var_0._id_02E5 = self;
            var_0._id_0340 = self _meth_830F();
            var_0 thread maps\mp\gametypes\_shellshock::_id_43E9();
        }

        if ( isdefined( var_0 ) )
        {
            var_0._id_A2DF = var_1;

            if ( isprimaryorsecondaryprojectileweapon( var_1 ) )
                var_0.firedads = self _meth_833D();
        }

        switch ( var_1 )
        {
            case "stinger_mp":
            case "iw5_lsr_mp":
                var_0._id_580F = self._id_8E5A;
                level notify( "stinger_fired", self, var_2 );
                thread maps\mp\_utility::_id_7F1F( var_0, "tag_origin", 65 );
                break;
            default:
                break;
        }

        switch ( var_1 )
        {
            case "rpg_mp":
            case "ac130_105mm_mp":
            case "ac130_40mm_mp":
                var_0 thread maps\mp\gametypes\_shellshock::_id_43E9();
            default:
                continue;
        }
    }
}

_id_A234()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "hit_by_missile", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
            continue;

        if ( level._id_91EB && self._id_04A7 == var_0._id_04A7 )
        {
            self _meth_83F6( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        if ( var_2 != "rpg_mp" )
        {
            self _meth_83F6( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        if ( _func_0B4( 0, 100 ) < 99 )
        {
            self _meth_83F6( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        var_8 = getdvarfloat( "rocket_corpse_max_air_time", 0.5 );
        var_9 = getdvarfloat( "rocket_corpse_view_offset_up", 100 );
        var_10 = getdvarfloat( "rocket_corpse_view_offset_forward", 35 );
        self._id_5193 = 1;
        self _meth_80C0( 0 );
        var_11 = self _meth_83E0( 1 );
        var_12 = var_11 / 1000.0;
        self._id_534D = spawn( "script_model", var_1._id_02E2 );
        self._id_534D.angles = var_1.angles;
        self._id_534D _meth_804F( var_1 );
        self._id_534D _meth_834B( "rocket_corpse" );
        self._id_534D _meth_80C0( 0 );
        self _meth_8053( 1000, self._id_02E2, var_0, var_1 );
        self.body = self _meth_826D( var_11 );
        self.body._id_02E2 = var_1._id_02E2;
        self.body.angles = var_1.angles;
        self.body _meth_83E1( 0 );
        self.body _meth_806B();
        self.body _meth_804F( var_1 );
        self.body _meth_80C0( 0 );

        if ( !isdefined( self._id_907E ) )
            thread maps\mp\gametypes\_deathicons::_id_07DE( self.body, self, self._id_04A7, 5.0, 0 );

        self _meth_8005();
        var_13 = _func_114( anglestoup( var_1.angles ) );
        var_14 = _func_114( anglestoforward( var_1.angles ) );
        var_15 = var_14 * var_9 + var_13 * var_10;
        var_16 = var_1._id_02E2 + var_15;
        var_17 = spawn( "script_model", var_16 );
        var_17 _meth_80B3( "tag_origin" );
        var_17.angles = _func_115( var_1._id_02E2 - var_17._id_02E2 );
        var_17 _meth_804F( var_1 );
        var_17 _meth_80C0( 0 );
        self _meth_81E5( var_17, "tag_origin" );

        if ( var_8 > var_12 )
            var_8 = var_12;

        var_18 = var_1 common_scripts\utility::_id_A0A2( "death", var_8 );

        if ( isdefined( var_18 ) && var_18 == "timeout" && isdefined( var_1 ) )
            var_1 _meth_81D9();

        self notify( "final_rocket_corpse_death" );
        self.body _meth_8051();
        self.body _meth_83E1( 1 );
        self.body _meth_8023();
        var_17 _meth_804F( self.body );
        self._id_5193 = undefined;
        self waittill( "death_delay_finished" );
        self _meth_81E6();
        self._id_534D delete();
        var_17 delete();
    }
}

_id_A257()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "sentry_placement_finished", var_0 );
        thread maps\mp\_utility::_id_7F1F( var_0, "tag_flash", 65 );
    }
}

_id_3085()
{
    thread maps\mp\gametypes\_shellshock::_id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    var_1 = _id_3F7A( var_0, 512, 0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_02E5 ) && !_id_3AA6( self._id_02E5, var_3._id_02E5 ) )
            continue;

        var_3 notify( "emp_damage", self._id_02E5, 8.0 );
    }
}

_id_60EC()
{
    thread maps\mp\gametypes\_shellshock::_id_31B8();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    level thread _id_2D03( var_0, self._id_02E5 );
    var_1 = _id_3F7A( var_0, 512, 0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_02E5 ) && !_id_3AA6( self._id_02E5, var_3._id_02E5 ) )
            continue;

        var_3 notify( "emp_damage", self._id_02E5, 8.0 );
    }
}

_id_38AA( var_0, var_1, var_2 )
{
    var_3 = 640000;
    var_4 = 40000;
    var_5 = 60;
    var_6 = 40;
    var_7 = 11;

    if ( !maps\mp\_utility::_id_5189( var_0 ) || var_0._id_03BC != "playing" )
        return;

    var_8 = _func_0F0( var_1, var_0._id_02E2 );

    if ( var_8 > var_3 )
        return;

    if ( var_8 <= var_4 )
        var_9 = 1.0;
    else
        var_9 = 1.0 - ( var_8 - var_4 ) / ( var_3 - var_4 );

    var_10 = var_0 _meth_81DB( var_1 );

    if ( var_10 < 0.5 )
        return;

    var_11 = anglestoforward( var_0 _meth_8338() );
    var_12 = var_0._id_02E2;

    switch ( var_0 _meth_8180() )
    {
        case "stand":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_5 );
            break;
        case "crouch":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_6 );
            break;
        case "prone":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_7 );
            break;
    }

    var_13 = var_1 - var_12;
    var_13 = _func_114( var_13 );
    var_14 = 0.5 * ( 1.0 + _func_0F6( var_11, var_13 ) );
    var_0 notify( "flashbang", var_1, var_9, var_14, var_2 );
}

_id_2D03( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        if ( var_3 > 0 )
        {
            _func_1A8( var_0, "null" );

            foreach ( var_5 in level._id_0323 )
                _id_38AA( var_5, var_0, var_1 );
        }

        var_7 = _id_3F7A( var_0, 512, 0 );

        foreach ( var_9 in var_7 )
        {
            if ( isdefined( var_9._id_02E5 ) && !_id_3AA6( self._id_02E5, var_9._id_02E5 ) )
                continue;

            var_9 notify( "emp_damage", self._id_02E5, 8.0 );
        }

        wait(_func_0B5( 0.25, 0.5 ));
    }
}

_id_1397()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    common_scripts\utility::_id_A069( "grenade_fire", "weapon_change", "offhand_end" );
    self._id_1C87 = undefined;
}

_id_A22C()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( self._id_428B )
        {
            self._id_428B = 0;
            continue;
        }

        if ( !_func_120( var_1, "h1_frag" ) )
            continue;

        var_0._id_9337 = 1;
        var_0._id_65A3 = self;
        var_0 thread maps\mp\gametypes\_shellshock::_id_43E9();
    }
}

_id_5978( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3[0] ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_A23B()
{
    self endon( "spawned_player" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = _func_1EA( var_1 );
        var_3 = _func_2A1( var_1 );

        if ( var_2 || var_3 )
        {
            if ( !self._id_5979.size )
                thread _id_A23A();

            if ( self._id_5979.size )
            {
                self._id_5979 = _id_5978( self._id_5979 );

                if ( self._id_5979.size >= level._id_5A4A )
                    self._id_5979[0][0] _meth_81D9();
            }

            var_4 = self._id_5979.size;
            self._id_5979[var_4] = [];
            self._id_5979[var_4][0] = var_0;
            self._id_5979[var_4][1] = var_2;
            self._id_5979[var_4][2] = var_3;

            if ( isdefined( var_0 ) )
            {
                var_0._id_02E5 = self;
                var_0 _meth_8381( self );
                var_0._id_04A7 = self._id_04A7;
                var_0._id_A2DF = var_1;
                var_0._id_8F74 = 0;
            }
        }
    }
}

_id_A208()
{
    self endon( "faux_spawn" );
    self endon( "spawned_player" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "c4" || var_1 == "h1_c4_mp" )
        {
            level._id_5C5D[level._id_5C5D.size] = var_0;
            var_0 thread maps\mp\gametypes\_shellshock::_id_196B();
            var_0 thread _id_196E( var_1 );
            var_0 thread _id_1972();
            var_0 thread _id_1973();
            var_0 thread _id_A207();
        }
    }
}

_id_A207()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    self._id_04C5 = spawn( "script_origin", self._id_02E2 );
    self._id_04C5._id_02E5 = self;
    _id_5941();
    thread _id_6A35();
}

_id_6A35()
{
    var_0 = self _meth_8184( "tag_fx" );
    var_1 = self _meth_8185( "tag_fx" );
    var_2 = _func_2C9( level.c4fxid, self, "tag_fx" );
    triggerfx( var_2 );
    self waittill( "death" );
    var_2 delete();
}

_id_1972()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        playfxontag( common_scripts\utility::_id_3FA8( "sentry_explode_mp" ), self, "tag_origin" );
        self._id_2AFD = 1;
        self notify( "disabled" );
        wait(var_1);
        self._id_2AFD = undefined;
        self notify( "enabled" );
    }
}

_id_1973()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "emp_update" );
        self._id_2AFD = undefined;
        self notify( "enabled" );
    }
}

_id_7FAB( var_0 )
{
    if ( !maps\mp\_utility::_id_4FA6() )
    {
        self endon( "death" );
        wait 0.05;

        if ( level._id_91EB )
            maps\mp\_entityheadicons::_id_8028( var_0, ( 0, 0, 20 ) );
        else if ( isdefined( self._id_02E5 ) )
            maps\mp\_entityheadicons::_id_7FE5( self._id_02E5, ( 0, 0, 20 ) );
    }
}

_id_A20A()
{
    self endon( "faux_spawn" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self._id_1E43 = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "claymore" || var_1 == "h1_claymore_mp" )
        {
            if ( !_func_1A1( self ) )
            {
                var_0 delete();
                return;
            }

            self._id_1E43 = common_scripts\utility::_id_0D01( self._id_1E43 );

            if ( self._id_1E43.size >= level._id_5A4A )
            {
                if ( !maps\mp\_utility::_id_4FA6() )
                    _id_284F( self._id_1E43[0] );
                else
                    self._id_1E43[0] _meth_81D9();
            }

            self._id_1E43[self._id_1E43.size] = var_0;
            var_0._id_02E5 = self;
            var_0 _meth_8381( self );
            var_0._id_04A7 = self._id_04A7;
            var_0._id_A2DF = var_1;
            var_0._id_04C5 = spawn( "script_origin", var_0._id_02E2 );
            var_0._id_04C5._id_02E5 = var_0;
            var_0._id_8F74 = 0;
            var_0 _id_5941();
            level._id_5C5D[level._id_5C5D.size] = var_0;
            var_0 thread _id_196E( var_1 );
            var_0 thread handleclaymoreeffects();
            var_0 thread _id_1972();
            var_0 thread _id_1973();
            var_0 thread _id_1E48();
            var_0 thread _id_7FAB( self._id_0308["team"] );
            self._id_1C87 = undefined;
        }
    }
}

handleclaymoreeffects()
{
    self endon( "death" );
    wait 0.15;
    thread _id_6A36();
}

_id_6A36()
{
    var_0 = self _meth_8184( "tag_fx" );
    var_1 = self _meth_8185( "tag_fx" );
    var_2 = spawnfx( level.claymorefxid, var_0, anglestoforward( var_1 ), anglestoup( var_1 ) );
    triggerfx( var_2 );
    self waittill( "death" );
    var_2 delete();
}

_id_3349( var_0 )
{
    self notify( "equipmentWatchUse" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "equipmentWatchUse" );
    self endon( "change_owner" );
    self._id_04C5 _meth_80DC( "HINT_NOICON" );

    if ( self._id_A2DF == "h1_c4_mp" )
        self._id_04C5 _meth_80DD( &"MP_PICKUP_C4" );
    else if ( self._id_A2DF == "h1_claymore_mp" )
        self._id_04C5 _meth_80DD( &"MP_PICKUP_CLAYMORE" );
    else if ( self._id_A2DF == "bouncingbetty_mp" )
        self._id_04C5 _meth_80DD( &"MP_PICKUP_BOUNCING_BETTY" );

    self._id_04C5 maps\mp\_utility::_id_8005( var_0 );
}

_id_3347( var_0 )
{
    self._id_04C5 _meth_80DD( "" );
    self._id_04C5 maps\mp\_utility::_id_8004();
}

_id_334C( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    var_1 = 1;

    for (;;)
    {
        if ( var_0 _meth_82F6( self._id_A2DF ) < _func_1E6( self._id_A2DF ) )
        {
            if ( !var_1 )
            {
                _id_3349( var_0 );
                var_1 = 1;
            }
        }
        else if ( var_1 )
        {
            _id_3347( var_0 );
            var_1 = 0;
        }

        wait 0.05;
    }
}

_id_334D( var_0, var_1 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "change_owner" );
    self._id_04C5 _meth_80DC( "HINT_NOICON" );
    _id_3349( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        thread _id_9B90();

    for (;;)
    {
        thread _id_334C( var_0 );
        self._id_04C5 waittill( "trigger", var_0 );
        var_2 = var_0 _meth_82F6( self._id_A2DF );

        if ( var_2 < _func_1E6( self._id_A2DF ) )
        {
            var_0 _meth_82F1( "scavenger_pack_pickup" );
            var_0 _meth_82F4( self._id_A2DF, var_2 + 1 );
            self._id_04C5 delete();
            self delete();
            self notify( "death" );
        }
    }
}

_id_9B90()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self ) && isdefined( self._id_04C5 ) )
        {
            self._id_04C5._id_02E2 = self._id_02E2;

            if ( isdefined( self._id_154E ) )
                self._id_154E._id_02E2 = self._id_02E2;
        }
        else
            return;

        wait 0.05;
    }
}

_id_1E48()
{
    self endon( "death" );
    self endon( "change_owner" );
    var_0 = spawn( "trigger_radius", self._id_02E2 + ( 0, 0, 0 - level._id_1E47 ), 0, level._id_1E47, level._id_1E47 * 2 );
    thread _id_285A( var_0 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( self._id_8F74 )
        {
            wait 0.05;
            continue;
        }

        if ( getdvarint( "scr_claymoredebug" ) != 1 )
        {
            if ( isdefined( self._id_02E5 ) )
            {
                if ( var_1 == self._id_02E5 )
                    continue;

                if ( isdefined( var_1._id_02E5 ) && var_1._id_02E5 == self._id_02E5 )
                    continue;
            }

            if ( !_id_3AA6( self._id_02E5, var_1, 0 ) )
                continue;
        }

        if ( _func_0F3( var_1 _meth_81B6() ) < 10 )
            continue;

        var_2 = _func_0BE( var_1._id_02E2[2] - self._id_02E2[2] );

        if ( var_2 > 128 )
            continue;

        if ( !var_1 _id_8482( self ) )
            continue;

        if ( var_1 _meth_81DA( self._id_02E2, self ) > 0 )
            break;
    }

    self _meth_809C( "claymore_activated" );

    if ( _func_1AD( var_1 ) && var_1 maps\mp\_utility::_id_05CB( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_claymore" );
        wait(level._id_27E9);
    }
    else
        wait(level._id_1E45);

    if ( isdefined( self._id_04C5 ) )
        self._id_04C5 delete();

    if ( isdefined( self._id_02E5 ) && isdefined( level._id_5656 ) )
        self._id_02E5 thread [[ level._id_5656 ]]( "claymore_destroyed", undefined, undefined, self._id_02E2 );

    self _meth_81D9();
}

_id_8482( var_0 )
{
    if ( isdefined( var_0._id_2AFD ) )
        return 0;

    var_1 = self._id_02E2 + ( 0, 0, 32 );
    var_2 = var_1 - var_0._id_02E2;
    var_3 = anglestoforward( var_0.angles );
    var_4 = _func_0F6( var_2, var_3 );

    if ( var_4 < level._id_1E46 )
        return 0;

    var_2 = _func_114( var_2 );
    var_5 = _func_0F6( var_2, var_3 );
    return var_5 > level._id_1E44;
}

_id_285A( var_0 )
{
    self waittill( "death" );
    wait 0.05;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_04C5 ) )
            var_0._id_04C5 delete();

        var_0 delete();
    }
}

_id_284F( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_04C5 ) )
            var_0._id_04C5 delete();

        var_0 delete();
    }
}

_id_A23A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "all_detonated" );
    level endon( "game_ended" );
    self endon( "change_owner" );
    var_0 = 0;

    for (;;)
    {
        if ( self _meth_8339() )
        {
            var_0 = 0;

            while ( self _meth_8339() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self _meth_8339() && var_0 < 0.35 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.35 )
                continue;

            if ( !self._id_5979.size )
                return;

            self notify( "detonate_double_tap" );
        }

        wait 0.05;
    }
}

_id_A239()
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "detonate" );
        _id_5977( 1 );
    }
}

_id_A238()
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "detonate_double_tap" );
        var_0 = self _meth_830E();

        if ( !_func_2A1( var_0 ) )
            _id_5977( 2 );
    }
}

_id_5977( var_0 )
{
    var_1 = 0;
    var_2 = [];

    for ( var_3 = 0; var_3 < self._id_5979.size; var_3++ )
    {
        if ( !self._id_5979[var_3][var_0] )
        {
            var_1 = 1;
            continue;
        }

        var_4 = self._id_5979[var_3][0];

        if ( isdefined( var_4 ) )
        {
            if ( var_4._id_8F74 )
            {
                var_1 = 1;
                return;
            }

            if ( isdefined( var_4._id_A2DF ) && !self _meth_84C0( var_4._id_A2DF ) )
            {
                var_1 = 1;
                continue;
            }

            if ( isdefined( var_4._id_597A ) )
            {
                self thread [[ var_4._id_597A ]]( var_4 );
                continue;
            }

            var_4 thread _id_A006( 0, var_0 );
        }
    }

    if ( var_1 )
        self._id_5979 = _id_5978( self._id_5979 );
    else
    {
        self._id_5979 = var_2;
        self notify( "all_detonated" );
    }
}

_id_A006( var_0, var_1 )
{
    self endon( "death" );
    wait(var_0);
    _id_A0D8();

    if ( var_1 == 2 )
        self _meth_8519();
    else
        self _meth_81D9();

    level._id_5C5D = common_scripts\utility::_id_0D01( level._id_5C5D );
}

_id_2847()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self waittill( "disconnect" );
    var_0 = self._id_5979;
    var_1 = self._id_1E43;
    wait 0.05;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2][0] ) )
            var_0[var_2][0] delete();
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2] ) )
            var_1[var_2] delete();
    }
}

_id_196E( var_0 )
{
    self endon( "death" );
    self _meth_82BC( 1 );
    self._id_0271 = 100000;
    self._id_01E6 = self._id_0271;
    var_1 = undefined;

    for (;;)
    {
        self waittill( "damage", var_2, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !_func_1AD( var_1 ) && !_func_1FF( var_1 ) )
            continue;

        if ( !_id_3AA6( self._id_02E5, var_1 ) )
            continue;

        if ( isdefined( var_10 ) )
        {
            var_11 = maps\mp\_utility::_id_8F5C( var_10, "_lefthand" );

            switch ( var_11 )
            {
                case "h1_smokegrenade_mp":
                case "h1_concussiongrenade_mp":
                case "h1_flashgrenade_mp":
                    continue;
            }
        }

        break;
    }

    if ( level._id_1974 )
        wait(0.1 + _func_0B3( 0.4 ));
    else
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    level._id_1974 = 1;
    thread _id_7447();

    if ( isdefined( var_5 ) && ( _func_120( var_5, "MOD_GRENADE" ) || _func_120( var_5, "MOD_EXPLOSIVE" ) ) )
        self._id_A1C0 = 1;

    if ( isdefined( var_9 ) && var_9 & level._id_4B5C )
        self._id_A1C5 = 1;

    self._id_A1C3 = 1;

    if ( _func_1AD( var_1 ) )
        var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( "c4" );

    var_12 = 0;

    if ( level._id_91EB )
    {
        if ( isdefined( var_1 ) && isdefined( self._id_02E5 ) )
        {
            var_13 = var_1._id_0308["team"];
            var_14 = self._id_02E5._id_0308["team"];

            if ( isdefined( var_13 ) && isdefined( var_14 ) && var_13 != var_14 )
                var_12 = 1;
        }
    }
    else if ( isdefined( self._id_02E5 ) && isdefined( var_1 ) && var_1 != self._id_02E5 )
        var_12 = 1;

    if ( var_12 )
    {
        var_1 notify( "destroyed_explosive" );

        switch ( var_0 )
        {
            case "claymore":
            case "h1_claymore_mp":
                level thread maps\mp\gametypes\_rank::_id_1208( "destroyed_claymore", var_1, var_10, undefined, var_5 );
                break;
            case "c4":
            case "h1_c4_mp":
                level thread maps\mp\gametypes\_rank::_id_1208( "destroyed_c4", var_1, var_10, undefined, var_5 );
                break;
        }
    }

    if ( isdefined( self._id_04C5 ) )
        self._id_04C5 delete();

    self _meth_81D9( var_1 );
}

_id_7447()
{
    wait 0.05;
    level._id_1974 = 0;
}

_id_7823( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 60; var_2++ )
        wait 0.05;
}

_id_A0D8()
{
    if ( !isdefined( self._id_2AFD ) )
        return;

    self waittill( "enabled" );
}

_id_5941( var_0 )
{
    common_scripts\utility::_id_5923( self._id_02E5._id_04A7 );

    if ( !isdefined( var_0 ) || !var_0 )
        self _meth_8386();

    if ( _func_0D1( self ) )
        self _meth_817B( "DogsDontAttack" );
}

_id_82FF()
{
    self._id_154D = [];

    if ( self._id_2992 && !self._id_154C.size )
    {
        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            self._id_154C[var_0] = _func_1AA( self );
            self._id_154C[var_0]._id_0530 = 0;
            self._id_154C[var_0]._id_0538 = 0;
            self._id_154C[var_0]._id_053B = 0;
            self._id_154C[var_0].alpha = 0;
            self._id_154C[var_0].archived = 1;
            self._id_154C[var_0] _meth_80CE( "waypoint_bombsquad", 14, 14 );
            self._id_154C[var_0] _meth_80DA( 0, 0 );
            self._id_154C[var_0]._id_2994 = "";
        }
    }
    else if ( !self._id_2992 )
    {
        for ( var_0 = 0; var_0 < self._id_154C.size; var_0++ )
            self._id_154C[var_0] _meth_808A();

        self._id_154C = [];
    }
}

_id_8512( var_0 )
{
    var_1 = var_0._id_2994;
    var_2 = -1;

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_4 = self._id_154C[var_3]._id_2994;

        if ( var_4 == var_1 )
            return;

        if ( var_4 == "" )
            var_2 = var_3;
    }

    if ( var_2 < 0 )
        return;

    self._id_154D[var_1] = 1;
    self._id_154C[var_2]._id_0530 = var_0._id_02E2[0];
    self._id_154C[var_2]._id_0538 = var_0._id_02E2[1];
    self._id_154C[var_2]._id_053B = var_0._id_02E2[2] + 24 + 128;
    self._id_154C[var_2] _meth_8086( 0.25 );
    self._id_154C[var_2].alpha = 1;
    self._id_154C[var_2]._id_2994 = var_0._id_2994;

    while ( _func_1A1( self ) && isdefined( var_0 ) && self _meth_80AB( var_0 ) )
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    self._id_154C[var_2]._id_2994 = "";
    self._id_154C[var_2] _meth_8086( 0.25 );
    self._id_154C[var_2].alpha = 0;
    self._id_154D[var_1] = undefined;
}

_id_3F48( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = var_1 * var_1;
    var_6 = level._id_0323;

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( !_func_1A1( var_6[var_7] ) || var_6[var_7]._id_03BC != "playing" )
            continue;

        var_8 = maps\mp\_utility::_id_3D28( var_6[var_7] );
        var_9 = _func_0F0( var_0, var_8 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_8, var_3, var_6[var_7] ) ) )
            var_4[var_4.size] = maps\mp\_utility::_id_3D27( var_6[var_7], var_8 );
    }

    var_10 = getentarray( "grenade", "classname" );

    for ( var_7 = 0; var_7 < var_10.size; var_7++ )
    {
        var_11 = maps\mp\_utility::_id_3D25( var_10[var_7] );
        var_9 = _func_0F0( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_10[var_7] ) ) )
            var_4[var_4.size] = maps\mp\_utility::_id_3D24( var_10[var_7], var_11 );
    }

    var_12 = getentarray( "destructible", "targetname" );

    for ( var_7 = 0; var_7 < var_12.size; var_7++ )
    {
        var_11 = var_12[var_7]._id_02E2;
        var_9 = _func_0F0( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_12[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_5175 = 0;
            var_13._id_50A8 = 0;
            var_13._id_0151 = var_12[var_7];
            var_13._id_258F = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_14 = getentarray( "destructable", "targetname" );

    for ( var_7 = 0; var_7 < var_14.size; var_7++ )
    {
        var_11 = var_14[var_7]._id_02E2;
        var_9 = _func_0F0( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_14[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_5175 = 0;
            var_13._id_50A8 = 1;
            var_13._id_0151 = var_14[var_7];
            var_13._id_258F = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_15 = getentarray( "misc_turret", "classname" );

    foreach ( var_17 in var_15 )
    {
        var_11 = var_17._id_02E2 + ( 0, 0, 32 );
        var_9 = _func_0F0( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_17 ) ) )
        {
            switch ( var_17._id_029C )
            {
                case "mp_remote_turret":
                    var_4[var_4.size] = maps\mp\_utility::_id_3D29( var_17, var_11 );
                    continue;
            }
        }
    }

    var_19 = getentarray( "script_model", "classname" );

    foreach ( var_21 in var_19 )
    {
        if ( var_21._id_029C != "projectile_bouncing_betty_grenade" && var_21._id_029C != "ims_scorpion_body" )
            continue;

        var_11 = var_21._id_02E2 + ( 0, 0, 32 );
        var_9 = _func_0F0( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2D6( var_0, var_11, var_3, var_21 ) ) )
            var_4[var_4.size] = maps\mp\_utility::_id_3D26( var_21, var_11 );
    }

    return var_4;
}

_id_3F7A( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = getentarray( "grenade", "classname" );

    foreach ( var_7 in var_5 )
    {
        var_8 = var_7._id_02E2;
        var_9 = _func_0EE( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || _id_A2D6( var_0, var_8, var_3, var_7 ) ) )
            var_4[var_4.size] = var_7;
    }

    var_11 = getentarray( "misc_turret", "classname" );

    foreach ( var_13 in var_11 )
    {
        var_8 = var_13._id_02E2;
        var_9 = _func_0EE( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || _id_A2D6( var_0, var_8, var_3, var_13 ) ) )
            var_4[var_4.size] = var_13;
    }

    return var_4;
}

_id_A2D6( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = var_1 - var_0;

    if ( _func_0F3( var_5 ) < var_2 * var_2 )
        return 1;

    var_6 = _func_114( var_5 );
    var_4 = var_0 + ( var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2 );
    var_7 = _func_06B( var_4, var_1, 0, var_3 );

    if ( getdvarint( "scr_damage_debug" ) != 0 || getdvarint( "scr_debugMines" ) != 0 )
    {
        thread _id_2731( var_0, ".dmg" );

        if ( isdefined( var_3 ) )
            thread _id_2731( var_1, "." + var_3.classname );
        else
            thread _id_2731( var_1, ".undefined" );

        if ( var_7["fraction"] == 1 )
            thread _id_2729( var_4, var_1, ( 1, 1, 1 ) );
        else
        {
            thread _id_2729( var_4, var_7["position"], ( 1, 0.9, 0.8 ) );
            thread _id_2729( var_7["position"], var_1, ( 1, 0.4, 0.3 ) );
        }
    }

    return var_7["fraction"] == 1;
}

_id_259B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( self._id_5175 )
    {
        self._id_25A8 = var_5;
        self._id_0151 thread [[ level._id_19FE ]]( var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0 );
    }
    else
    {
        if ( self._id_50A8 && ( var_4 == "artillery_mp" || var_4 == "h1_claymore_mp" ) )
            return;

        self._id_0151 notify( "damage", var_2, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_EXPLOSIVE", "", "", "", undefined, var_4 );
    }
}

_id_2729( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < 600; var_3++ )
        wait 0.05;
}

_id_271F( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 16;

    var_4 = 360 / var_3;
    var_5 = [];

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        var_7 = var_4 * var_6;
        var_8 = _func_0B7( var_7 ) * var_1;
        var_9 = _func_0B6( var_7 ) * var_1;
        var_10 = var_0[0] + var_8;
        var_11 = var_0[1] + var_9;
        var_12 = var_0[2];
        var_5[var_5.size] = ( var_10, var_11, var_12 );
    }

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_13 = var_5[var_6];

        if ( var_6 + 1 >= var_5.size )
            var_14 = var_5[0];
        else
            var_14 = var_5[var_6 + 1];

        thread _id_2729( var_13, var_14, var_2 );
    }
}

_id_2731( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 600; var_2++ )
        wait 0.05;
}

_id_64FD( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_5 = 700;
    var_6 = 25;
    var_7 = var_5 * var_5;
    var_8 = var_6 * var_6;
    var_9 = 60;
    var_10 = 40;
    var_11 = 11;

    if ( _func_120( var_1, "_uts19_" ) )
        thread _id_9C40( var_0 );
    else
    {
        var_12 = maps\mp\_utility::_id_8F5C( var_1, "_lefthand" );

        switch ( var_12 )
        {
            case "h1_concussiongrenade_mp":
                if ( !isdefined( var_0 ) )
                    return;

                if ( maps\mp\_utility::_id_5092( self.concussionimmune ) )
                    return;

                var_13 = 1;

                if ( isdefined( var_0._id_02E5 ) && var_0._id_02E5 == var_4 )
                    var_13 = 0;

                var_14 = 512;
                var_15 = 1 - _func_0EE( self._id_02E2, var_0._id_02E2 ) / var_14;

                if ( var_15 < 0 )
                    var_15 = 0;

                var_16 = 2 + 4 * var_15;

                if ( isdefined( self._id_8F77 ) )
                    var_16 *= self._id_8F77;

                wait 0.05;
                self notify( "concussed", var_4 );
                self _meth_8186( "concussion_grenade_mp", var_16 );
                self._id_20DF = gettime() + var_16 * 1000;

                if ( isdefined( var_4 ) && var_4 != self )
                    self.concussionattacker = var_4;
                else
                    self.concussionattacker = undefined;

                if ( var_13 && var_4 != self )
                    var_4 thread maps\mp\gametypes\_damagefeedback::_id_9B0C( "stun" );

                break;
            case "weapon_cobra_mk19_mp":
                break;
            default:
                maps\mp\gametypes\_shellshock::_id_83BE( var_2, var_3 );
                break;
        }
    }
}

isconcussed()
{
    return isdefined( self._id_20DF ) && gettime() < self._id_20DF;
}

getlastconcussionattacker()
{
    return self.concussionattacker;
}

_id_9C40( var_0 )
{
    if ( getdvarint( "scr_game_uts19_shock", 0 ) == 0 )
        return;

    if ( !isdefined( var_0 ) )
        return;

    var_1 = 0.45;
    var_2 = 1.2;
    var_3 = 250;
    var_4 = 700;
    var_5 = ( _func_0EE( self._id_02E2, var_0._id_02E2 ) - var_3 ) / ( var_4 - var_3 );
    var_6 = 1 - var_5;
    var_6 = _func_0E9( var_6, 0, 1 );
    var_7 = var_1 + ( var_2 - var_1 ) * var_6;

    if ( isdefined( self._id_9C41 ) )
    {
        if ( self._id_9C41 >= var_7 )
            return;
    }

    self._id_9C41 = var_7;
    self _meth_8186( "uts19_mp", var_7 );
    waitframe;

    if ( isdefined( self ) )
        self._id_9C41 = undefined;
}

_id_5185( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( _func_1E4( var_0 ) != "primary" )
        return 0;

    switch ( _func_1B8( var_0 ) )
    {
        case "spread":
        case "rifle":
        case "smg":
        case "mg":
        case "pistol":
        case "rocketlauncher":
        case "sniper":
        case "beam":
            return 1;
        default:
            return 0;
    }
}

_id_50CE( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    switch ( maps\mp\_utility::_id_4167( var_0 ) )
    {
        case "weapon_smg":
        case "weapon_assault":
        case "weapon_sniper":
        case "weapon_lmg":
        case "weapon_shotgun":
        case "weapon_pistol":
        case "weapon_machine_pistol":
            return 1;
        case "weapon_heavy":
            return _func_120( var_0, "exoxmg" ) || _func_120( var_0, "lsat" ) || _func_120( var_0, "asaw" );
        default:
            return 0;
    }
}

isbeamweapon( var_0 )
{
    return _func_120( var_0, "em1" ) || _func_120( var_0, "epm3" );
}

_id_50B6( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1E4( var_0 ) == "altmode";
}

_id_5130( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1E4( var_0 ) == "item";
}

_id_5192( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1B7( var_0 ) == "riotshield";
}

_id_5162( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1E4( var_0 ) == "offhand";
}

_id_51A7( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( _func_1E4( var_0 ) != "primary" )
        return 0;

    return _func_1B8( var_0 ) == "pistol";
}

ismeleeinventoryweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1E4( var_0 ) == "melee";
}

_id_5114( var_0 )
{
    var_1 = _func_1B8( var_0 );
    var_2 = _func_1E4( var_0 );

    if ( var_1 != "grenade" )
        return 0;

    if ( var_2 != "offhand" )
        return 0;

    return 1;
}

_id_51EF( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    var_1 = _func_1E4( var_0 );
    return var_1 == "primary" || var_1 == "altmode";
}

_id_9B5E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = self._id_252E;
    self._id_7814 = var_0;
    _id_8357( var_0 );
    thread recordweaponusageondeathorgameend();

    for (;;)
    {
        self waittill( "weapon_change", var_1 );
        _id_9BA5( var_1 );

        if ( _id_51F0( var_1 ) )
            _id_9B3D();

        self._id_7814 = var_0;

        if ( _id_51EF( var_1 ) )
            var_0 = var_1;
    }
}

_id_9BA5( var_0 )
{
    var_1 = _func_0BC( ( gettime() - self._id_A2F5 ) / 1000 );
    thread _id_8356( self._id_A2F4, var_1, "timeInUse" );
    _id_8357( var_0 );
}

recordweaponusageondeathorgameend()
{
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    common_scripts\utility::_id_A06A( self, "death", level, "game_ended" );
    var_0 = _func_0BC( ( gettime() - self._id_A2F5 ) / 1000 );
    thread _id_8356( self._id_A2F4, var_0, "timeInUse" );
    _id_8357( self._id_A2F4 );
}

_id_8357( var_0 )
{
    self._id_A2F4 = var_0;
    self._id_A2F5 = gettime();
}

_id_308C( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    thread _id_1EEA();
}

_id_1EEA()
{
    self endon( "disconnect" );
    self waittill( "death" );
}

_id_416B()
{
    var_0 = 1000;
    self._id_A2DD = self _meth_8309();

    if ( self._id_A2DD.size )
    {
        foreach ( var_2 in self._id_A2DD )
        {
            var_3 = _id_416D( var_2 );

            if ( var_3 == 0 )
                continue;

            if ( var_3 < var_0 )
                var_0 = var_3;
        }

        if ( var_0 > 10 )
            var_0 = 10;
    }
    else
        var_0 = 8;

    var_0 = _id_1E2A( var_0 );
    return var_0;
}

_id_416D( var_0 )
{
    var_1 = undefined;
    var_2 = maps\mp\_utility::_id_3F11( var_0 );

    if ( isdefined( level.weaponweightfunc ) )
        return [[ level.weaponweightfunc ]]( var_2 );

    var_1 = _func_0BC( _func_1BB( "mp/statstable.csv", 4, var_2, 8 ) );
    return var_1;
}

_id_1E2A( var_0 )
{
    return _func_0E9( var_0, 0.0, 10.0 );
}

_id_51F0( var_0 )
{
    if ( _id_51EF( var_0 ) )
        return 1;

    var_1 = _func_1B8( var_0 );

    if ( var_1 == "ball" )
        return 1;

    return 0;
}

_id_9B3D()
{

}

_id_8AFC()
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self _meth_82DA( "adjustedStance", "+stance" );
    self _meth_82DA( "adjustedStance", "+goStand" );

    for (;;)
    {
        common_scripts\utility::_id_A069( "adjustedStance", "sprint_begin", "weapon_change" );
        wait 0.5;
        self._id_8AF2 = self _meth_8180();

        if ( self._id_8AF2 == "prone" )
        {
            var_0 = self _meth_830F();
            var_1 = maps\mp\_utility::_id_4167( var_0 );

            if ( var_1 == "weapon_lmg" )
                maps\mp\_utility::_id_7FFB( 0, 40 );
            else if ( var_1 == "weapon_sniper" )
                maps\mp\_utility::_id_7FFB( 0, 60 );
            else
                maps\mp\_utility::_id_7FFB();

            continue;
        }

        if ( self._id_8AF2 == "crouch" )
        {
            var_0 = self _meth_830F();
            var_1 = maps\mp\_utility::_id_4167( var_0 );

            if ( var_1 == "weapon_lmg" )
                maps\mp\_utility::_id_7FFB( 0, 10 );
            else if ( var_1 == "weapon_sniper" )
                maps\mp\_utility::_id_7FFB( 0, 30 );
            else
                maps\mp\_utility::_id_7FFB();

            continue;
        }

        maps\mp\_utility::_id_7FFB();
    }
}

_id_188B( var_0 )
{

}

_id_51BC( var_0 )
{
    return level._id_91EB && isdefined( var_0._id_04A7 ) && var_0._id_04A7 == self._id_04A7;
}

_id_9974()
{
    if ( getdvarint( "scr_game_deleteturrets", 0 ) || level._id_01B3 == "gun" || maps\mp\_utility::ishodgepodgeph() || maps\mp\_utility::ishodgepodgemm() )
    {
        self delete();
        return;
    }

    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread _id_9980( var_0 );
    }
}

_id_9980( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 notify( "weapon_change", "none" );
    self waittill( "turret_deactivate" );
    var_0 notify( "weapon_change", var_0 _meth_830E() );
}

_id_89F5( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, _func_0B3( 360 ), 0 );

    var_5 = "projectile_bouncing_betty_grenade";
    var_6 = spawn( "script_model", var_0 );
    var_6.angles = var_3;
    var_6 _meth_80B3( var_5 );
    var_6._id_02E5 = var_1;
    var_6._id_8F74 = 0;
    var_6 _meth_8381( var_1 );
    var_6._id_A2DF = "bouncingbetty_mp";
    level._id_5C5D[level._id_5C5D.size] = var_6;
    var_6._id_5350 = ( 0, 0, 4 );
    var_6._id_534D = spawn( "script_model", var_6._id_02E2 + var_6._id_5350 );
    var_6._id_534D _meth_834B( "explosive" );
    var_1._id_334B = common_scripts\utility::_id_0D01( var_1._id_334B );

    if ( var_1._id_334B.size >= level._id_5A4A )
        var_1._id_334B[0] delete();

    var_1._id_334B[var_1._id_334B.size] = var_6;
    var_6 thread _id_23E6( "projectile_bouncing_betty_grenade_bombsquad", "tag_origin", var_1 );
    var_6 thread _id_5C4B();
    var_6 thread _id_7FAB( var_1._id_0308["team"] );
    var_6 thread _id_5C55();
    var_6 thread _id_5C5C();
    var_7 = self _meth_83EA();

    if ( isdefined( var_7 ) )
        var_6 _meth_804F( var_7 );

    var_6 _id_5941( !var_4 );
    return var_6;
}

_id_5C55()
{
    self endon( "mine_triggered" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self _meth_82BC( 1 );
    self._id_0271 = 100000;
    self._id_01E6 = self._id_0271;
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !_func_1AD( var_0 ) && !_func_1FF( var_0 ) )
            continue;

        if ( isdefined( var_9 ) && var_9 == "bouncingbetty_mp" )
            continue;

        if ( !_id_3AA6( self._id_02E5, var_0 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            var_10 = maps\mp\_utility::_id_8F5C( var_9, "_lefthand" );

            switch ( var_10 )
            {
                case "h1_smokegrenade_mp":
                    continue;
            }
        }

        break;
    }

    self notify( "mine_destroyed" );

    if ( isdefined( var_4 ) && ( _func_120( var_4, "MOD_GRENADE" ) || _func_120( var_4, "MOD_EXPLOSIVE" ) ) )
        self._id_A1C0 = 1;

    if ( isdefined( var_8 ) && var_8 & level._id_4B5C )
        self._id_A1C5 = 1;

    self._id_A1C3 = 1;

    if ( _func_1AD( var_0 ) )
        var_0 maps\mp\gametypes\_damagefeedback::_id_9B0C( "bouncing_betty" );

    if ( level._id_91EB )
    {
        if ( isdefined( var_0 ) && isdefined( self._id_02E5 ) )
        {
            var_11 = var_0._id_0308["team"];
            var_12 = self._id_02E5._id_0308["team"];

            if ( isdefined( var_11 ) && isdefined( var_12 ) && var_11 != var_12 )
                var_0 notify( "destroyed_explosive" );
        }
    }
    else if ( isdefined( self._id_02E5 ) && isdefined( var_0 ) && var_0 != self._id_02E5 )
        var_0 notify( "destroyed_explosive" );

    thread _id_5C5B( var_0 );
}

_id_5C5C()
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    wait 2;
    var_0 = spawn( "trigger_radius", self._id_02E2, 0, level._id_5C5A, level._id_5C59 );
    var_0._id_02E5 = self;
    thread _id_5C57( var_0 );
    var_1 = undefined;

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( self._id_8F74 )
            continue;

        if ( getdvarint( "scr_minesKillOwner" ) != 1 )
        {
            if ( isdefined( self._id_02E5 ) )
            {
                if ( var_1 == self._id_02E5 )
                    continue;

                if ( isdefined( var_1._id_02E5 ) && var_1._id_02E5 == self._id_02E5 )
                    continue;
            }

            if ( !_id_3AA6( self._id_02E5, var_1, 0 ) )
                continue;
        }

        if ( _func_0F3( var_1 _meth_81B6() ) < 10 )
            continue;

        if ( var_1 _meth_81DA( self._id_02E2, self ) > 0 )
            break;
    }

    self notify( "mine_triggered" );
    self _meth_809C( "mine_betty_click" );

    if ( _func_1AD( var_1 ) && var_1 maps\mp\_utility::_id_05CB( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_mine" );
        wait(level._id_27E9);
    }
    else
        wait(level._id_5C58);

    thread _id_5C4D();
}

_id_5C57( var_0 )
{
    common_scripts\utility::_id_A069( "mine_triggered", "mine_destroyed", "mine_selfdestruct", "death" );
    var_0 delete();
}

_id_5C5E()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "death" );
    wait(level._id_5C5F);
    wait(_func_0B3( 0.4 ));
    self notify( "mine_selfdestruct" );
    thread _id_5C5B();
}

_id_5C4D()
{
    self _meth_809C( "mine_betty_spin" );
    playfx( level._id_5C49, self._id_02E2 );

    if ( isdefined( self._id_04C5 ) )
        self._id_04C5 delete();

    var_0 = self._id_02E2 + ( 0, 0, 64 );
    self _meth_82AA( var_0, 0.7, 0, 0.65 );
    self._id_534D _meth_82AA( var_0 + self._id_5350, 0.7, 0, 0.65 );
    self _meth_82B9( ( 0, 750, 32 ), 0.7, 0, 0.65 );
    thread _id_6DE1();
    wait 0.65;
    thread _id_5C5B();
}

_id_5C5B( var_0 )
{
    if ( !isdefined( self ) || !isdefined( self._id_02E5 ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_02E5;

    self _meth_809C( "null" );
    var_1 = self _meth_8184( "tag_fx" );
    playfx( level._id_5C48, var_1 );
    wait 0.05;

    if ( !isdefined( self ) || !isdefined( self._id_02E5 ) )
        return;

    self _meth_8056();
    self _meth_81D8( self._id_02E2, level._id_5C56, level._id_5C53, level._id_5C54, var_0, "MOD_EXPLOSIVE" );

    if ( isdefined( self._id_02E5 ) && isdefined( level._id_5656 ) )
        self._id_02E5 thread [[ level._id_5656 ]]( "mine_destroyed", undefined, undefined, self._id_02E2 );

    wait 0.2;

    if ( !isdefined( self ) || !isdefined( self._id_02E5 ) )
        return;

    if ( isdefined( self._id_04C5 ) )
        self._id_04C5 delete();

    self._id_534D delete();
    self delete();
}

_id_5C60()
{
    if ( self._id_8F74 )
        return;

    self._id_8F74 = 1;
    playfxontag( common_scripts\utility::_id_3FA8( "mine_stunned" ), self, "tag_origin" );
}

_id_5C61()
{
    self._id_8F74 = 0;
    stopfxontag( common_scripts\utility::_id_3FA8( "mine_stunned" ), self, "tag_origin" );
}

_id_5C4E( var_0 )
{
    if ( isdefined( self._id_A2DF ) )
    {
        if ( isdefined( self._id_3317 ) )
            self._id_3317 _meth_808A();

        if ( self._id_A2DF == "bouncingbetty_mp" )
        {
            if ( isdefined( self._id_04C5 ) )
                self._id_04C5 delete();

            if ( isdefined( self._id_3018["friendly"] ) )
                self._id_3018["friendly"] delete();

            if ( isdefined( self._id_3018["enemy"] ) )
                self._id_3018["enemy"] delete();

            for ( var_1 = 0; var_1 < self._id_02E5._id_334B.size; var_1++ )
            {
                if ( self._id_02E5._id_334B[var_1] == self )
                    self._id_02E5._id_334B[var_1] = undefined;
            }

            self._id_02E5._id_334B = common_scripts\utility::_id_0D01( self._id_02E5._id_334B );
            self notify( "change_owner" );
            self._id_02E5 = var_0;
            self._id_02E5._id_334B[self._id_02E5._id_334B.size] = self;
            self._id_04A7 = var_0._id_04A7;
            self _meth_8381( var_0 );
            self._id_04C5 = spawn( "script_origin", self._id_02E2 + ( 0, 0, 25 ) );
            self._id_04C5._id_02E5 = self;
            _id_3347( var_0 );
            thread _id_5C4B();
            thread _id_7FAB( var_0._id_04A7 );
            var_0 thread _id_5C64( self );
            var_0 thread _id_5C63( self );
        }
        else if ( self._id_A2DF == "h1_claymore_mp" )
        {
            if ( isdefined( self._id_04C5 ) )
                self._id_04C5 delete();

            for ( var_1 = 0; var_1 < self._id_02E5._id_1E43.size; var_1++ )
            {
                if ( self._id_02E5._id_1E43[var_1] == self )
                    self._id_02E5._id_1E43[var_1] = undefined;
            }

            self._id_02E5._id_1E43 = common_scripts\utility::_id_0D01( self._id_02E5._id_1E43 );
            self notify( "change_owner" );
            self._id_02E5 = var_0;
            self._id_02E5._id_1E43[self._id_02E5._id_1E43.size] = self;
            self._id_04A7 = var_0._id_04A7;
            self _meth_8381( var_0 );
            self._id_04C5 = spawn( "script_origin", self._id_02E2 );
            self._id_04C5._id_02E5 = self;
            _id_3347( var_0 );
            thread _id_7FAB( var_0._id_04A7 );
            var_0 thread _id_5C64( self );
            var_0 thread _id_5C63( self );
            thread _id_1E48();
        }
        else if ( self._id_A2DF == "h1_c4_mp" )
        {
            var_2 = 0;
            var_3 = 0;

            for ( var_1 = 0; var_1 < self._id_02E5._id_5979.size; var_1++ )
            {
                if ( self._id_02E5._id_5979[var_1][0] == self )
                {
                    self._id_02E5._id_5979[var_1][0] = undefined;
                    var_2 = self._id_02E5._id_5979[var_1][1];
                    var_3 = self._id_02E5._id_5979[var_1][2];
                }
            }

            self._id_02E5._id_5979 = _id_5978( self._id_02E5._id_5979 );
            self notify( "change_owner" );
            self._id_02E5 = var_0;
            var_4 = self._id_02E5._id_5979.size;
            self._id_02E5._id_5979[var_4] = [];
            self._id_02E5._id_5979[var_4][0] = self;
            self._id_02E5._id_5979[var_4][1] = var_2;
            self._id_02E5._id_5979[var_4][2] = var_3;
            self._id_04A7 = var_0._id_04A7;
            self _meth_8381( var_0 );
            _id_3347( var_0 );
            thread _id_7FAB( var_0._id_04A7 );
        }
    }
}

_id_6DE1()
{
    self endon( "death" );
    var_0 = gettime() + 1000;

    while ( gettime() < var_0 )
    {
        wait 0.05;
        playfxontag( level._id_5C4A, self, "tag_fx_spin1" );
        playfxontag( level._id_5C4A, self, "tag_fx_spin3" );
        wait 0.05;
        playfxontag( level._id_5C4A, self, "tag_fx_spin2" );
        playfxontag( level._id_5C4A, self, "tag_fx_spin4" );
    }
}

_id_5C50( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6[0] = ( 1, 0, 0 );
    var_6[1] = ( 0, 1, 0 );

    if ( var_1[2] < var_5 )
        var_7 = 0;
    else
        var_7 = 1;

    var_8 = ( var_0[0], var_0[1], var_5 );
    var_9 = ( var_1[0], var_1[1], var_5 );
    thread _id_271F( var_8, level._id_5C56, var_6[var_7], 32 );
    var_10 = _func_0F0( var_0, var_1 );

    if ( var_10 > var_2 )
        var_7 = 0;
    else
        var_7 = 1;

    thread _id_2729( var_8, var_9, var_6[var_7] );
}

_id_5C52( var_0, var_1 )
{
    if ( _func_1AD( var_1 ) && _func_1A1( var_1 ) && var_1._id_03BC == "playing" )
        var_2 = var_1 maps\mp\_utility::_id_40E7();
    else if ( var_1.classname == "misc_turret" )
        var_2 = var_1._id_02E2 + ( 0, 0, 32 );
    else
        var_2 = var_1._id_02E2;

    var_3 = 0;
    var_4 = var_0._id_02E2[2] + var_3 + level._id_5C51;
    var_5 = var_0._id_02E2[2] + var_3 - level._id_5C51;

    if ( var_2[2] > var_4 || var_2[2] < var_5 )
        return 0;

    return 1;
}

_id_A25A()
{
    self endon( "disconnect" );
    self endon( "spawned_player" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self._id_51A8 = 0;
        self waittill( "sprint_slide_begin" );
        self._id_51A8 = 1;
        self.lastslidetime = gettime();
        self waittill( "sprint_slide_end" );
    }
}

_id_A23D()
{
    self endon( "disconnect" );
    self endon( "spawned_player" );
    self endon( "faux_spawn" );

    if ( isdefined( self._id_334B ) )
    {
        if ( maps\mp\_utility::_id_3FDB( "scr_deleteexplosivesonspawn", 1 ) == 1 )
        {
            if ( isdefined( self._id_2D1F ) )
                self._id_2D1F = undefined;
            else
                _id_27FA();
        }
    }
    else
        self._id_334B = [];

    if ( !isdefined( self._id_539F ) )
        self._id_539F = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "bouncingbetty" || var_1 == "bouncingbetty_mp" )
        {
            if ( !_func_1A1( self ) )
            {
                var_0 delete();
                return;
            }

            maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
            var_0 thread _id_5C62( self, 1 );
        }
    }
}

_id_5C62( var_0, var_1 )
{
    self._id_02E5 = var_0;
    self waittill( "missile_stuck" );

    if ( !isdefined( var_0 ) )
        return;

    var_2 = _func_06B( self._id_02E2 + ( 0, 0, 4 ), self._id_02E2 - ( 0, 0, 4 ), 0, self );
    var_3 = var_2["position"];

    if ( var_2["fraction"] == 1 )
    {
        var_3 = _func_091( self._id_02E2, 12, 0, 32 );
        var_2["normal"] *= -1;
    }

    var_4 = _func_114( var_2["normal"] );
    var_5 = _func_115( var_4 );
    var_5 += ( 90, 0, 0 );
    var_6 = _id_89F5( var_3, var_0, undefined, var_5, var_1 );
    var_6._id_04C5 = spawn( "script_origin", var_6._id_02E2 + ( 0, 0, 25 ) );
    var_6._id_04C5._id_02E5 = var_6;
    var_6 thread _id_334D( var_0 );
    var_0 thread _id_5C64( var_6 );
    var_0 thread _id_5C63( var_6 );
    self delete();
}

_id_5C64( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "change_owner" );
    self waittill( "disconnect" );

    if ( isdefined( var_0._id_04C5 ) )
        var_0._id_04C5 delete();

    var_0 delete();
}

_id_5C63( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "change_owner" );
    common_scripts\utility::_id_A087( "joined_team", "joined_spectators" );

    if ( isdefined( var_0._id_04C5 ) )
        var_0._id_04C5 delete();

    var_0 delete();
}

_id_5C4B()
{
    self endon( "change_owner" );
    self._id_3018["friendly"] = spawnfx( level._id_5C47["friendly"], self _meth_8184( "tag_fx" ) );
    self._id_3018["enemy"] = spawnfx( level._id_5C47["enemy"], self _meth_8184( "tag_fx" ) );
    thread _id_5C4C();
    self waittill( "death" );
    self._id_3018["friendly"] delete();
    self._id_3018["enemy"] delete();
}

_id_5C4C()
{
    self endon( "death" );
    self endon( "change_owner" );
    var_0 = self._id_02E5._id_04A7;
    wait 0.05;
    triggerfx( self._id_3018["friendly"] );
    triggerfx( self._id_3018["enemy"] );

    for (;;)
    {
        self._id_3018["friendly"] _meth_8056();
        self._id_3018["enemy"] _meth_8056();

        foreach ( var_2 in level._id_0323 )
        {
            if ( level._id_91EB )
            {
                if ( var_2._id_04A7 == var_0 )
                    self._id_3018["friendly"] _meth_8007( var_2 );
                else
                    self._id_3018["enemy"] _meth_8007( var_2 );

                continue;
            }

            if ( var_2 == self._id_02E5 )
            {
                self._id_3018["friendly"] _meth_8007( var_2 );
                continue;
            }

            self._id_3018["enemy"] _meth_8007( var_2 );
        }

        level common_scripts\utility::_id_A087( "joined_team", "player_spawned" );
    }
}

_id_27F9()
{
    if ( isdefined( self._id_5979 ) )
    {
        for ( var_0 = 0; var_0 < self._id_5979.size; var_0++ )
        {
            if ( isdefined( self._id_5979[var_0][0] ) )
            {
                if ( isdefined( self._id_5979[var_0][0]._id_04C5 ) )
                    self._id_5979[var_0][0]._id_04C5 delete();

                self._id_5979[var_0][0] delete();
            }
        }
    }

    self._id_5979 = [];

    if ( isdefined( self._id_1E43 ) )
    {
        for ( var_0 = 0; var_0 < self._id_1E43.size; var_0++ )
        {
            if ( isdefined( self._id_1E43[var_0] ) )
            {
                if ( isdefined( self._id_1E43[var_0]._id_04C5 ) )
                    self._id_1E43[var_0]._id_04C5 delete();

                self._id_1E43[var_0] delete();
            }
        }
    }

    self._id_1E43 = [];

    if ( isdefined( self._id_1756 ) )
    {
        for ( var_0 = 0; var_0 < self._id_1756.size; var_0++ )
        {
            if ( isdefined( self._id_1756[var_0] ) )
            {
                if ( isdefined( self._id_1756[var_0]._id_04C5 ) )
                    self._id_1756[var_0]._id_04C5 delete();

                self._id_1756[var_0] delete();
            }
        }
    }

    self._id_1756 = [];
}

_id_27FA()
{
    if ( isdefined( self._id_334B ) )
    {
        self._id_334B = common_scripts\utility::_id_0D01( self._id_334B );

        foreach ( var_1 in self._id_334B )
        {
            if ( isdefined( var_1._id_04C5 ) )
                var_1._id_04C5 delete();

            var_1 delete();
        }
    }
}

_id_96ED( var_0 )
{
    var_0 _id_27F9();
    var_0 _id_27FA();

    if ( isdefined( self._id_5979 ) )
        var_0._id_5979 = _id_5978( self._id_5979 );
    else
        var_0._id_5979 = undefined;

    if ( isdefined( self._id_1E43 ) )
        var_0._id_1E43 = common_scripts\utility::_id_0D01( self._id_1E43 );
    else
        var_0._id_1E43 = undefined;

    if ( isdefined( self._id_1756 ) )
        var_0._id_1756 = common_scripts\utility::_id_0D01( self._id_1756 );
    else
        var_0._id_1756 = undefined;

    if ( isdefined( self._id_334B ) )
        var_0._id_334B = common_scripts\utility::_id_0D01( self._id_334B );
    else
        var_0._id_334B = undefined;

    if ( isdefined( self._id_539F ) )
        var_0._id_539F = common_scripts\utility::_id_0D01( self._id_539F );
    else
        var_0._id_539F = undefined;

    if ( isdefined( var_0._id_5979 ) )
    {
        foreach ( var_2 in var_0._id_5979 )
            var_2[0]._id_02E5 = var_0;
    }

    if ( isdefined( var_0._id_1E43 ) )
    {
        foreach ( var_5 in var_0._id_1E43 )
            var_5._id_02E5 = var_0;
    }

    if ( isdefined( var_0._id_1756 ) )
    {
        foreach ( var_8 in var_0._id_1756 )
        {
            var_8._id_02E5 = var_0;
            var_8 thread _id_334D( var_0 );
        }
    }

    if ( isdefined( var_0._id_334B ) )
    {
        foreach ( var_11 in var_0._id_334B )
        {
            var_11._id_02E5 = var_0;
            var_11 thread _id_334D( var_0 );
        }
    }

    if ( isdefined( var_0._id_539F ) )
    {
        foreach ( var_14 in var_0._id_539F )
        {
            var_14._id_02E5 = var_0;
            var_14 thread _id_334D( var_0 );
        }
    }

    self._id_5979 = [];
    self._id_1E43 = [];
    self._id_1756 = [];
    self._id_334B = [];
    self._id_539F = [];
    self._id_2D1E = 1;
    self._id_2D1F = 1;
}

_id_3345()
{
    playfx( common_scripts\utility::_id_3FA8( "equipment_sparks" ), self._id_02E2 );
    self _meth_809C( "sentry_explode" );
}

_id_3346()
{
    playfx( common_scripts\utility::_id_3FA8( "equipment_explode_big" ), self._id_02E2 );
    playfx( common_scripts\utility::_id_3FA8( "equipment_smoke" ), self._id_02E2 );
}

_id_3348()
{
    playfxontag( common_scripts\utility::_id_3FA8( "emp_stun" ), self, "tag_origin" );
}

_id_94A2()
{
    self._id_2583 = [];
    thread _id_7428();
}

_id_7428()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        if ( self._id_01E6 >= 100 && isdefined( self._id_2583 ) && self._id_2583.size > 0 )
            self._id_2583 = [];

        wait 0.05;
    }
}

_id_8E34( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( isdefined( var_0 ) )
        var_2._id_6237 = var_0;

    if ( isdefined( var_1 ) )
        var_2._id_31BB = var_1;

    var_2._id_2663 = ::_id_8E35;
    thread maps\mp\_movers::_id_45BF( var_2 );
}

_id_8E35( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    if ( isdefined( self ) )
    {
        if ( isdefined( var_0._id_6237 ) )
        {
            if ( var_0._id_6237 == "detonate" )
                self _meth_81D9();
            else
                self notify( var_0._id_6237 );
        }
        else
            self delete();
    }
}

_id_3FAE()
{
    var_0 = 0;

    if ( isdefined( level._id_4400 ) )
        var_0 = level._id_4400;

    var_1 = 0;

    if ( isdefined( level._id_6F07 ) )
        var_1 = ( gettime() - level._id_6F07 ) / 1000;

    return var_0 - var_1;
}

_id_4C6E()
{
    return _id_3FAE() > 0;
}

_id_5204( var_0 )
{
    if ( _func_120( var_0, "glmwr" ) )
        return 0;

    if ( _func_121( var_0, "_gl" ) )
        return 0;

    switch ( var_0 )
    {
        case "h1_fraggrenade_mp":
            return 0;
        default:
            break;
    }

    var_1 = _func_060( var_0 );

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "h1_rpg_mp":
                return 0;
            default:
                break;
        }
    }

    return 1;
}

_id_A22E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A072( "grenade_fire", "missile_fire" );
        var_1 = var_0[0];
        var_2 = var_0[1];
        var_3 = var_0[2];
        __asm_var_clear( 3 );

        if ( !isdefined( var_3 ) || var_3 == "" )
            continue;

        if ( _id_4C6E() )
        {
            if ( !_id_5204( var_3 ) )
            {
                var_4 = _func_0BC( _id_3FAE() + 0.5 );

                if ( !var_4 )
                    var_4 = 1;

                if ( _func_1AD( self ) )
                    self _meth_826A( &"MP_EXPLOSIVES_UNAVAILABLE_FOR_N", var_4 );
            }

            continue;
        }

        break;
    }
}

isprimaryorsecondaryprojectileweapon( var_0 )
{
    var_1 = maps\mp\_utility::_id_4167( var_0 );
    var_2 = maps\mp\_utility::_id_3F11( var_0 );

    if ( var_1 == "weapon_projectile" )
        return 1;

    return 0;
}

saveweapon( var_0, var_1, var_2 )
{
    var_3 = self.saveweapons.size;

    if ( var_3 == 0 )
        self.firstsaveweapon = var_1;

    self.saveweapons[var_3]["type"] = var_0;
    self.saveweapons[var_3]["use"] = var_2;
}

getsavedweapon( var_0 )
{
    var_1 = self.saveweapons.size;
    var_2 = -1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( self.saveweapons[var_3]["type"] == var_0 )
        {
            var_2 = var_3;
            break;
        }
    }

    if ( var_2 >= 0 )
        return self.saveweapons[var_2]["use"];
    else
        return "none";
}

_id_74B3( var_0 )
{
    var_1 = [];
    var_2 = self.saveweapons.size;
    var_3 = -1;
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        if ( var_3 < 0 && self.saveweapons[var_5]["type"] == var_0 )
        {
            var_3 = var_5;
            continue;
        }

        var_1[var_4] = self.saveweapons[var_5];
        var_4++;
    }

    if ( var_3 >= 0 )
    {
        var_6 = "none";

        if ( var_1.size == 0 )
        {
            var_6 = self.firstsaveweapon;
            self.saveweapons = var_1;
            self.firstsaveweapon = "none";
        }
        else
        {
            self.saveweapons = var_1;
            var_6 = getsavedweapon( "underwater" );

            if ( var_6 == "none" )
                var_6 = self.saveweapons[0]["use"];
        }

        var_7 = self _meth_830E();

        if ( var_7 != var_6 )
            self _meth_8313( var_6 );
    }
}

watchweaponinspection()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( _func_0CF( self ) || _func_1FE( self ) )
        return;

    self _meth_82DA( "weapon_inspection", "+actionslot 2" );

    for (;;)
    {
        self waittill( "weapon_inspection" );

        if ( maps\mp\_utility::_id_4FA6() && !maps\mp\_utility::_id_5092( level._id_4C03 ) )
            continue;

        var_0 = self _meth_830F();
        var_1 = maps\mp\_utility::_id_4167( var_0 );
        var_2 = var_1 == "weapon_pistol";
        var_3 = maps\mp\gametypes\_class::isperkequipment( var_0 );
        var_4 = _func_060( var_0 );

        if ( isdefined( var_4 ) )
            var_5 = var_4 == "h1_augsmg_mp";
        else
            var_5 = 0;

        if ( var_2 || var_3 || var_5 )
        {
            var_6 = self _meth_8183( var_0 );

            if ( var_6 == 0 )
                continue;
        }

        self _meth_855F();
        waittillframeend;

        while ( self _meth_8560() )
            waittillframeend;
    }
}

watchmeleeweapon()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "melee_fired", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( isdefined( self.meleeweaponbloodytime ) && maps\mp\_utility::ismeleeweapon( var_0 ) )
        {
            var_1 = gettime() - self.meleeweaponbloodytime <= 100;
            var_2 = gettime() - self.meleeweaponbloodytime > 4000;

            if ( !var_1 && !var_2 )
                thread playcleanmeleefx();
        }

        maps\mp\gametypes\_gamelogic::_id_7F85( self, 1 );
        self._id_55D9 = gettime();

        if ( _func_0CF( self ) )
            continue;

        if ( !maps\mp\_utility::iscacmeleeweapon( var_0 ) )
            continue;

        var_3 = maps\mp\gametypes\_persistence::_id_8D69( "totalShots" ) + 1;
        var_4 = maps\mp\gametypes\_persistence::_id_8D69( "hits" );
        var_5 = _func_0E9( _func_0BD( var_4 ) / _func_0BD( var_3 ), 0.0, 1.0 ) * 10000.0;
        maps\mp\gametypes\_persistence::_id_8D79( "totalShots", var_3 );
        maps\mp\gametypes\_persistence::_id_8D79( "accuracy", _func_0BC( var_5 ) );
        maps\mp\gametypes\_persistence::_id_8D79( "misses", _func_0BC( var_3 - var_4 ) );

        if ( isdefined( self._id_55EC ) && self._id_55EC._id_55F1 == gettime() )
        {
            self._id_4926 = 0;
            continue;
        }

        var_6 = 1;
        _id_8356( var_0, var_6, "shots" );
        _id_8356( var_0, self._id_4926, "hits" );
        self._id_4926 = 0;
    }
}

playcleanmeleefx()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.05;
    var_0 = self _meth_8458();
    var_1 = self _meth_8338();
    var_2 = anglestoforward( var_1 );
    var_3 = _func_06B( var_0, var_0 + var_2 * 200, 0 );

    if ( var_3["fraction"] < 1 )
        playfx( level.meleeweaponbloodflick, var_3["position"] - var_2 * 5, -1 * var_2 );
}

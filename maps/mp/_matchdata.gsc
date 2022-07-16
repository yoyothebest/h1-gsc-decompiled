// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( game["gamestarted"] ) )
    {
        _func_133( "mp/matchdata.ddl" );
        _func_12F( "map", level._id_038E );

        if ( level._id_46CA )
        {
            var_0 = level._id_01B3 + " hc";
            _func_12F( "gametype", var_0 );
        }
        else if ( level.oldschool )
        {
            var_0 = level._id_01B3 + " os";
            _func_12F( "gametype", var_0 );
        }
        else
            _func_12F( "gametype", level._id_01B3 );

        _func_12F( "buildVersion", _func_13A() );
        _func_12F( "buildNumber", _func_13B() );
        _func_135();
    }

    level._id_5A40 = 285;
    level._id_5A37 = 150;
    level._id_5A3C = 64;
    level._id_5A42 = 30;
    level._id_5A46 = 5;
    level._id_5A45 = 10;
    level._id_5A41 = 10;
    level thread _id_3BDB();

    if ( getdvar( "virtualLobbyActive" ) != "1" )
        level thread _id_727B();
}

_id_59EC()
{
    if ( getdvar( "virtualLobbyActive" ) == "1" )
        return;

    if ( getdvar( "mapname" ) == getdvar( "virtualLobbyMap" ) )
        return;

    _func_2BE( "MatchStarted: Completed" );
    var_0 = _func_2CB();
    _func_12F( "playlistName", var_0 );
    var_1 = _func_2CC();
    _func_12F( "localTimeStringAtMatchStart", var_1 );

    if ( _id_4018() == 0 )
        _func_12F( "startTimeUTC", _func_13C() );

    _func_12F( "iseSports", maps\mp\_utility::_id_5153() );

    if ( maps\mp\_utility::_id_6FD0() )
        _func_12F( "privateMatch", 1 );

    if ( maps\mp\_utility::isdivisionmode() )
        _func_12F( "divisionMode", 1 );

    thread _id_581F();
    thread _id_06D9();
}

_id_581F()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = maps\mp\_utility::getgametimepassedseconds();

        foreach ( var_2 in level._id_0323 )
        {
            if ( _func_1FE( var_2 ) || _func_28E( var_2 ) )
                continue;

            if ( maps\mp\_utility::_id_5189( var_2 ) && isdefined( var_2._id_56F7 ) && _id_1AD1( var_2._id_56F7 ) )
            {
                var_3 = 31;

                if ( isdefined( var_2._id_55D8 ) )
                    var_3 = var_2._id_55D8;

                _func_2BB( var_2, var_2._id_56F7, var_0, var_3 );
                var_2._id_55D8 = undefined;
            }
        }

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        {
            wait 5;
            continue;
        }

        wait 2;
    }
}

_id_06D9()
{
    level endon( "game_ended" );

    for (;;)
    {
        foreach ( var_1 in level._id_0323 )
        {
            if ( _func_1FE( var_1 ) || _func_28E( var_1 ) )
                continue;

            if ( !isdefined( var_1._id_0308["pingAccumulation"] ) || !isdefined( var_1._id_0308["minPing"] ) || !isdefined( var_1._id_0308["maxPing"] ) || !isdefined( var_1._id_0308["pingSampleCount"] ) )
                continue;

            var_2 = var_1 _meth_8517();
            var_1._id_0308["pingAccumulation"] += var_2;
            var_1._id_0308["pingSampleCount"]++;

            if ( var_1._id_0308["pingSampleCount"] > 5 && var_2 > 0 )
            {
                if ( var_2 > var_1._id_0308["maxPing"] )
                    var_1._id_0308["maxPing"] = var_2;

                if ( var_2 < var_1._id_0308["minPing"] )
                    var_1._id_0308["minPing"] = var_2;
            }
        }

        wait 2;
    }
}

_id_4018()
{
    return _func_130( "startTimeUTC" );
}

_id_583B( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || !_id_1AD0() )
        return;

    var_2 = _func_130( "killstreakCount" );
    _func_12F( "killstreakCount", var_2 + 1 );
    _func_12F( "killstreaks", var_2, "eventType", var_0 );
    _func_12F( "killstreaks", var_2, "player", self._id_1F0F );
    _func_12F( "killstreaks", var_2, "eventStartTimeDeciSecondsFromMatchStart", maps\mp\_utility::_id_412D() );
    _func_12F( "killstreaks", var_2, "eventPos", 0, _func_0BC( var_1[0] ) );
    _func_12F( "killstreaks", var_2, "eventPos", 1, _func_0BC( var_1[1] ) );
    _func_12F( "killstreaks", var_2, "eventPos", 2, _func_0BC( var_1[2] ) );
    _func_12F( "killstreaks", var_2, "index", var_2 );
    self._id_2517 = var_2;
    _func_105( var_1, "script_mp_killstreak: eventType %s, player_name %s, player %d, gameTime %d", var_0, self._id_02A7, self._id_1F0F, gettime() );
}

_id_5827( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || !_id_1ACF() )
        return;

    var_2 = _func_130( "eventCount" );
    _func_12F( "eventCount", var_2 + 1 );
    _func_12F( "events", var_2, "eventType", var_0 );
    _func_12F( "events", var_2, "player", self._id_1F0F );
    _func_12F( "events", var_2, "eventTimeDeciSecondsFromMatchStart", maps\mp\_utility::_id_412D() );
    _func_12F( "events", var_2, "eventPos", 0, _func_0BC( var_1[0] ) );
    _func_12F( "events", var_2, "eventPos", 1, _func_0BC( var_1[1] ) );
    _func_12F( "events", var_2, "eventPos", 2, _func_0BC( var_1[2] ) );
    _func_105( var_1, "script_mp_event: event_type %s, player_name %s, player %d, gameTime %d", var_0, self._id_02A7, self._id_1F0F, gettime() );
}

_id_5838( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    _func_12F( "lives", var_0, "modifiers", var_1, 1 );
}

_id_583D( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    _func_12F( "lives", var_0, "multikill", var_1 );
}

_id_5846( var_0 )
{
    if ( !_id_1ACE( self ) || !_id_1AD1( self._id_56F7 ) )
        return;

    var_1 = gettime() - self._id_03DC;
    self._id_93FB += var_1;
    var_2 = maps\mp\_utility::_id_21A6( var_1 );
    _func_12F( "lives", self._id_56F7, "player", self._id_1F0F );
    _func_12F( "lives", self._id_56F7, "spawnPos", 0, _func_0BC( self._id_03DB[0] ) );
    _func_12F( "lives", self._id_56F7, "spawnPos", 1, _func_0BC( self._id_03DB[1] ) );
    _func_12F( "lives", self._id_56F7, "spawnPos", 2, _func_0BC( self._id_03DB[2] ) );
    _func_12F( "lives", self._id_56F7, "team", self._id_04A7 );

    if ( isdefined( self._id_8A12 ) )
        _func_12F( "lives", self._id_56F7, "spawnTimeDeciSecondsFromMatchStart", self._id_8A12 );
    else
        _func_12F( "lives", self._id_56F7, "spawnTimeDeciSecondsFromMatchStart", -1 );

    _func_12F( "lives", self._id_56F7, "durationDeciSeconds", var_2 );
    var_3 = _id_583C();
    _func_12F( "lives", self._id_56F7, "loadoutIndex", var_3 );
    var_4 = maps\mp\_utility::_id_1E29( self._id_0308["score"] - self._id_7898 );
    _func_12F( "lives", self._id_56F7, "scoreEarnedDuringThisLife", var_4 );

    if ( isdefined( self._id_0308["summary"] ) && isdefined( self._id_0308["summary"]["xp"] ) )
    {
        if ( isdefined( self._id_A3A4 ) )
        {
            var_5 = maps\mp\_utility::_id_1E29( self._id_0308["summary"]["xp"] - self._id_A3A4 );
            _func_12F( "lives", self._id_56F7, "xpEarnedDuringThisLife", var_5 );
        }
    }
}

_id_5849( var_0, var_1 )
{
    if ( !_id_1ACE( self ) )
        return;

    _func_12F( "players", self._id_1F0F, var_1, var_0 );
}

_id_5822( var_0 )
{
    if ( !_func_1AD( self ) || !_id_1ACE( self ) || _func_1FE( self ) )
        return;

    var_1 = _func_130( "players", self._id_1F0F, "challengeCount" );

    if ( var_1 < level._id_5A46 )
    {
        _func_12F( "players", self._id_1F0F, "challenges", var_1, var_0 );
        _func_12F( "players", self._id_1F0F, "challengeCount", var_1 + 1 );
    }
}

_id_583C()
{
    var_0 = 255;

    if ( !_id_1ACE( self ) || !_id_1AD1( self._id_56F7 ) || self._id_24C3 == "gamemode" )
        return var_0;

    var_1 = self._id_24C3;
    var_2 = 0;

    for ( var_2 = 0; var_2 < level._id_5A41; var_2++ )
    {
        var_3 = _func_130( "players", self._id_1F0F, "loadouts", var_2, "slotUsed" );

        if ( !var_3 )
        {
            break;
            continue;
        }

        var_4 = _func_130( "players", self._id_1F0F, "loadouts", var_2, "className" );

        if ( var_1 == var_4 )
            return var_2;
    }

    if ( var_2 == level._id_5A41 )
        return var_0;

    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "slotUsed", 1 );
    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "className", var_1 );
    var_5 = [];
    var_6 = "";
    var_7 = "";

    if ( var_1 == "copycat" )
    {
        var_8 = self._id_0308["copyCatLoadout"];
        var_9 = var_8["loadoutPrimary"];
        var_10 = var_8["loadoutPrimaryAttachKit"];
        var_11 = var_8["loadoutPrimaryFurnitureKit"];
        var_12 = var_8["loadoutPrimaryCamo"];
        var_13 = var_8["loadoutPrimaryReticle"];
        var_14 = var_8["loadoutSecondary"];
        var_15 = var_8["loadoutSecondaryAttachKit"];
        var_16 = var_8["loadoutSecondaryFurnitureKit"];
        var_17 = var_8["loadoutSecondaryCamo"];
        var_18 = var_8["loadoutSecondaryReticle"];
        var_6 = var_8["loadoutEquipment"];
        var_7 = var_8["loadoutOffhand"];

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_5[var_19] = var_8["loadoutPerks"][var_19];

        var_20 = var_8["loadoutMelee"];
    }
    else if ( _func_120( var_1, "custom" ) )
    {
        var_21 = maps\mp\_utility::_id_3F32( var_1 );
        var_9 = maps\mp\gametypes\_class::_id_1985( var_21, 0 );
        var_10 = maps\mp\gametypes\_class::cac_getweaponattachkit( var_21, 0 );
        var_11 = maps\mp\gametypes\_class::cac_getweaponfurniturekit( var_21, 0 );
        var_12 = maps\mp\gametypes\_class::_id_1989( var_21, 0 );

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_5[var_19] = maps\mp\gametypes\_class::_id_1984( var_21, var_19 );

        var_14 = maps\mp\gametypes\_class::_id_1985( var_21, 1 );
        var_15 = maps\mp\gametypes\_class::cac_getweaponattachkit( var_21, 1 );
        var_16 = maps\mp\gametypes\_class::cac_getweaponfurniturekit( var_21, 1 );
        var_17 = maps\mp\gametypes\_class::_id_1989( var_21, 1 );
        var_6 = maps\mp\gametypes\_class::_id_197F( var_21, 0 );
        var_7 = maps\mp\gametypes\_class::_id_1983( var_21 );
        var_20 = maps\mp\gametypes\_class::cac_getmeleeweapon( var_21 );
    }
    else
    {
        var_21 = maps\mp\_utility::_id_3F32( var_1 );
        var_9 = maps\mp\gametypes\_class::_id_90A4( level._id_1E3D, var_21, 0 );
        var_10 = maps\mp\gametypes\_class::table_getweaponattachkit( level._id_1E3D, var_21, 0 );
        var_11 = maps\mp\gametypes\_class::table_getweaponfurniturekit( level._id_1E3D, var_21, 0 );
        var_12 = maps\mp\gametypes\_class::_id_90A7( level._id_1E3D, var_21, 0 );

        for ( var_19 = 0; var_19 < 3; var_19++ )
            var_5[var_19] = maps\mp\gametypes\_class::_id_90A2( level._id_1E3D, var_21, var_19 );

        var_14 = maps\mp\gametypes\_class::_id_90A4( level._id_1E3D, var_21, 1 );
        var_15 = maps\mp\gametypes\_class::table_getweaponattachkit( level._id_1E3D, var_21, 1 );
        var_16 = maps\mp\gametypes\_class::table_getweaponfurniturekit( level._id_1E3D, var_21, 1 );
        var_17 = maps\mp\gametypes\_class::_id_90A7( level._id_1E3D, var_21, 1 );
        var_6 = maps\mp\gametypes\_class::_id_909C( level._id_1E3D, var_21 );
        var_7 = maps\mp\gametypes\_class::_id_90A0( level._id_1E3D, var_21 );
        var_20 = "none";
    }

    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "primaryWeapon", var_9 );

    for ( var_19 = 0; var_19 < 3; var_19++ )
        _func_12F( "players", self._id_1F0F, "loadouts", var_2, "perkSlots", var_19, var_5[var_19] );

    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "secondaryWeapon", var_14 );
    var_22 = maps\mp\gametypes\_class::attachkitnametoid( var_10 );
    var_23 = maps\mp\gametypes\_class::attachkitnametoid( var_15 );
    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "primaryAttachKit", var_22 );
    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "secondaryAttachKit", var_23 );
    var_24 = maps\mp\gametypes\_class::furniturekitnametoid( var_11 );
    var_25 = maps\mp\gametypes\_class::furniturekitnametoid( var_16 );
    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "primaryFurnitureKit", var_24 );
    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "secondaryFurnitureKit", var_25 );
    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "offhandWeapon", var_7 );
    _func_12F( "players", self._id_1F0F, "loadouts", var_2, "equipment", var_6 );
    thread _id_726D( self, var_9, var_10, var_11, var_12, var_14, var_15, var_16, var_17, var_6, var_7, var_5[0], var_5[1], var_5[2] );
    return var_2;
}

_id_726D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    var_14 = _func_1FE( var_0 ) || _func_28E( var_0 );
    var_15 = "_matchdata.gsc";
    var_16 = var_0._id_03DC;
    var_17 = var_0._id_24C3;
    var_18 = var_0._id_02A7;
    _func_104( "script_mp_loadout_gear: script_file %s, gameTime %d, player_name %s, is_bot %b, class %s, primary_weapon %s, primary_attach_kit %s, primary_furniture_kit %s, primary_camo %s, secondary_weapon %s, secondary_attach_kit %s,  secondary_furniture_kit %s, secondary_camo %s, equipment %s, offhand %s", var_15, var_16, var_18, var_14, var_17, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    _func_104( "script_mp_loadout_perks: script_file %s, gameTime %d, player_name %s, perk_1 %s, perk_2 %s, perk_3 %s", var_15, var_16, var_18, var_11, var_12, var_13 );
}

_id_583E( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || _func_1AD( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level._id_5A40 )
        return;

    if ( _func_1AD( var_1 ) )
    {
        if ( var_1 _meth_833D() > 0.5 )
            _func_12F( "lives", var_0, "killerWasADS", 1 );

        var_2 = var_1 _meth_80AA();

        if ( common_scripts\utility::_id_A347( var_2, var_1.angles, self._id_02E2, _func_0B7( getdvarfloat( "cg_fov" ) ) ) )
            _func_12F( "lives", var_0, "victimWasInKillersFOV", 1 );

        var_3 = self _meth_80AA();

        if ( common_scripts\utility::_id_A347( var_3, self.angles, var_1._id_02E2, _func_0B7( getdvarfloat( "cg_fov" ) ) ) )
            _func_12F( "lives", var_0, "killerWasInVictimsFOV", 1 );
    }

    if ( self _meth_833D() > 0.5 )
        _func_12F( "lives", var_0, "victimWasADS", 1 );
}

_id_29AD( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    if ( var_0 == "none" )
    {
        var_2 = "none";
        var_3 = "none";
    }
    else
    {
        var_2 = _func_1E4( var_0 );
        var_3 = _func_1B8( var_0 );
    }

    if ( _func_120( var_0, "destructible" ) )
        var_0 = "destructible";

    var_4 = [];
    var_4[0] = "None";
    var_4[1] = "None";
    var_4[2] = "None";
    var_5 = "none";
    var_6 = "none";
    var_7 = "";

    if ( maps\mp\_utility::_id_513D( var_0 ) )
        var_7 = maps\mp\_utility::_id_8F5C( var_0, "_mp" );
    else if ( var_0 == "destructible" )
        var_7 = var_0;
    else if ( isdefined( var_2 ) && ( var_2 == "primary" || var_2 == "altmode" || var_2 == "melee" ) && ( var_3 == "pistol" || var_3 == "smg" || var_3 == "rifle" || var_3 == "spread" || var_3 == "mg" || var_3 == "grenade" || var_3 == "rocketlauncher" || var_3 == "sniper" || var_3 == "cone" || var_3 == "beam" || var_3 == "shield" ) )
    {
        if ( var_2 == "altmode" )
        {
            if ( isdefined( var_1 ) )
                var_0 = var_1;
        }

        var_8 = maps\mp\_utility::_id_416C( var_0 );
        var_7 = maps\mp\_utility::_id_3F11( var_0 );

        if ( var_8[0] == "iw5" || var_8[0] == "iw6" || var_8[0] == "h1" )
        {
            foreach ( var_10 in var_8 )
            {
                var_11 = _func_124( var_10, "#" );

                if ( var_11.size > 1 )
                {
                    if ( var_11[0] == "a" )
                    {
                        var_5 = var_11[1];
                        continue;
                    }

                    if ( var_11[0] == "f" )
                        var_6 = var_11[1];
                }
            }

            if ( var_5 == "none" && var_6 == "none" )
            {
                var_13 = _func_061( var_0 );
                var_14 = 0;

                foreach ( var_16 in var_13 )
                {
                    if ( !maps\mp\_utility::_id_50BD( var_16 ) )
                        continue;

                    var_17 = maps\mp\_utility::_id_0E02( var_16 );

                    if ( var_14 <= 2 )
                    {
                        var_4[var_14] = var_17;
                        var_14++;
                        continue;
                    }

                    break;
                }
            }
        }
        else if ( var_8[0] == "alt" )
        {
            var_19 = var_8[1] + "_" + var_8[2];
            var_7 = var_19;

            if ( isdefined( var_8[4] ) && maps\mp\_utility::_id_50BD( var_8[4] ) )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[4] );
                var_4[0] = var_17;
            }

            if ( isdefined( var_8[5] ) && maps\mp\_utility::_id_50BD( var_8[5] ) )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[5] );
                var_4[1] = var_17;
            }
        }
        else
        {
            var_8[var_8.size - 1] = undefined;

            if ( isdefined( var_8[1] ) && var_2 != "altmode" )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[1] );
                var_4[0] = var_17;
            }

            if ( isdefined( var_8[2] ) && var_2 != "altmode" )
            {
                var_17 = maps\mp\_utility::_id_0E02( var_8[2] );
                var_4[1] = var_17;
            }
        }
    }
    else if ( var_2 == "item" || var_2 == "offhand" )
    {
        var_7 = maps\mp\_utility::_id_8F5C( var_0, "_lefthand" );
        var_7 = maps\mp\_utility::_id_8F5C( var_7, "_mp" );
    }
    else
        var_7 = var_0;

    var_20 = spawnstruct();
    var_20._id_A2DF = var_7;
    var_20.attachments = var_4;
    var_20.attachkit = var_5;
    var_20.furniturekit = var_6;
    var_20._id_A2F3 = var_2;
    var_20._id_A2D5 = var_3;
    var_20._id_A2E0 = var_0;
    return var_20;
}

_id_5826( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || _func_1AD( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( !_func_1AD( var_1 ) )
        return;

    if ( var_0 >= level._id_5A40 )
        return;

    if ( self._id_2515 > 0 )
        _func_12F( "lives", var_0, "shots", maps\mp\_utility::_id_1E28( self._id_2515 ) );

    if ( isdefined( var_1._id_32AE ) && isdefined( var_1._id_32AE[self._id_4450] ) && var_1._id_32AE[self._id_4450] > 0 )
        _func_12F( "lives", var_0, "hits", maps\mp\_utility::_id_1E28( var_1._id_32AE[self._id_4450] ) );

    if ( var_1._id_2515 > 0 )
        _func_12F( "lives", var_0, "killerShots", maps\mp\_utility::_id_1E28( var_1._id_2515 ) );

    if ( isdefined( self._id_32AE ) && isdefined( self._id_32AE[var_1._id_4450] ) && self._id_32AE[var_1._id_4450] > 0 )
        _func_12F( "lives", var_0, "killerHits", maps\mp\_utility::_id_1E28( self._id_32AE[var_1._id_4450] ) );
}

_id_5841( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    if ( _func_1AD( self ) && _id_1ACE( self ) )
    {
        var_2 = _func_2C6( self );
        _func_12F( "lives", var_0, "victimStanceAndMotionState", var_2 );
    }

    if ( _func_1AD( var_1 ) && _id_1ACE( var_1 ) )
    {
        var_2 = _func_2C6( var_1 );
        _func_12F( "lives", var_0, "killerStanceAndMotionState", var_2 );
    }
}

_id_581E( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    if ( _func_1AD( self ) && _id_1ACE( self ) )
    {
        if ( isdefined( self._id_0E2C ) )
        {
            var_2 = 0;

            foreach ( var_4 in self._id_0E2C )
            {
                if ( _func_1AD( var_4._id_0E2D ) )
                {
                    if ( var_4._id_0E2D != var_1 )
                    {
                        _func_12F( "lives", var_0, "assists", var_2, "assistingPlayerIndex", var_4._id_0E2D._id_1F0F );
                        _func_12F( "lives", var_0, "assists", var_2, "damage", maps\mp\_utility::_id_1E28( var_4._id_00FA ) );
                        var_2++;

                        if ( var_2 == 5 )
                            break;
                    }
                }
            }

            if ( var_2 < 5 )
            {
                for ( var_6 = var_2; var_6 < 5; var_6++ )
                    _func_12F( "lives", var_0, "assists", var_6, "assistingPlayerIndex", 255 );
            }
        }
    }
}

_id_584B( var_0, var_1 )
{
    if ( !_func_1AD( self ) || !_id_1ACE( self ) )
        return;

    if ( !_func_1AD( var_0 ) || !_id_1ACE( var_0 ) )
        return;

    var_2 = self._id_56F7;

    if ( !_id_1AD1( var_2 ) )
        return;

    if ( var_1 == "assist_uav" || var_1 == "assist_concussion" || var_1 == "assist_flash" )
    {
        for ( var_3 = 0; var_3 < 5; var_3++ )
        {
            var_4 = _func_130( "lives", var_2, "assists", var_3, "assistingPlayerIndex" );

            if ( var_4 == var_0._id_1F0F || var_4 == 255 )
            {
                if ( var_4 == 255 )
                    _func_12F( "lives", var_2, "assists", var_3, "assistingPlayerIndex", var_0._id_1F0F );

                if ( var_1 == "assist_uav" )
                    _func_12F( "lives", var_2, "assists", var_3, "assistUAV", 1 );
                else if ( var_1 == "assist_concussion" )
                    _func_12F( "lives", var_2, "assists", var_3, "assistConcussion", 1 );
                else if ( var_1 == "assist_flash" )
                    _func_12F( "lives", var_2, "assists", var_3, "assistFlash", 1 );
                else
                {

                }

                break;
            }
        }
    }
}

_id_5845( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !_id_1ACE( self ) || _func_1AD( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level._id_5A40 )
        return;

    if ( level.iszombiegame )
        return;

    if ( isdefined( level._id_511D ) && level._id_511D )
        return;

    _id_583E( var_0, var_1 );
    _id_5826( var_0, var_1 );
    _id_5841( var_0, var_1 );
    _id_581E( var_0, var_1 );
    var_8 = _id_29AD( var_4, var_5 );
    var_9 = maps\mp\gametypes\_class::attachkitnametoid( var_8.attachkit );
    _func_12F( "lives", var_0, "killersWeaponAttachKit", var_9 );
    var_10 = maps\mp\gametypes\_class::furniturekitnametoid( var_8.furniturekit );
    _func_12F( "lives", var_0, "killersWeaponFurnitureKit", var_10 );

    if ( var_8._id_A2F3 != "exclusive" )
        _func_12F( "lives", var_0, "killersWeapon", var_8._id_A2DF );

    if ( var_8._id_A2E0 == "altmode" )
        _func_12F( "lives", var_0, "killersWeaponAltMode", 1 );

    if ( maps\mp\_utility::_id_513D( var_8._id_A2E0 ) )
    {
        _func_12F( "lives", var_0, "modifiers", "killstreak", 1 );

        if ( isdefined( var_1._id_2517 ) )
        {
            var_11 = _func_130( "killstreaks", var_1._id_2517, "killsTotal" );
            var_11++;
            _func_12F( "killstreaks", var_1._id_2517, "killsTotal", maps\mp\_utility::_id_1E29( var_11 ) );
            _func_12F( "lives", var_0, "killerKillstreakIndex", var_1._id_2517 );
        }
    }
    else
        _func_12F( "lives", var_0, "killerKillstreakIndex", 255 );

    var_12 = _id_29AD( var_7, undefined );
    var_9 = maps\mp\gametypes\_class::attachkitnametoid( var_12.attachkit );
    _func_12F( "lives", var_0, "victimCurrentWeaponAtDeathAttachKit", var_9 );
    var_10 = maps\mp\gametypes\_class::furniturekitnametoid( var_12.furniturekit );
    _func_12F( "lives", var_0, "victimCurrentWeaponAtDeathFurnitureKit", var_10 );

    if ( var_12._id_A2F3 != "exclusive" )
    {
        if ( maps\mp\_utility::_id_513D( var_12._id_A2DF ) )
        {
            if ( isdefined( self._id_0340 ) )
            {
                var_13 = maps\mp\_utility::_id_3F11( self._id_0340 );
                _func_12F( "lives", var_0, "victimCurrentWeaponAtDeath", var_13 );
            }
        }
        else
            _func_12F( "lives", var_0, "victimCurrentWeaponAtDeath", var_12._id_A2DF );
    }

    if ( isdefined( self._id_680B ) && isdefined( self._id_680B[var_12._id_A2E0] ) )
        _func_12F( "lives", var_0, "victimCurrentWeaponPickedUp", 1 );

    _func_12F( "lives", var_0, "meansOfDeath", var_3 );
    var_14 = 2;

    if ( _func_1AD( var_1 ) )
    {
        _func_12F( "lives", var_0, "killer", var_1._id_1F0F );
        _func_12F( "lives", var_0, "killerLifeIndex", var_1._id_56F7 );
        _func_12F( "lives", var_0, "killerPos", 0, _func_0BC( var_1._id_02E2[0] ) );
        _func_12F( "lives", var_0, "killerPos", 1, _func_0BC( var_1._id_02E2[1] ) );
        _func_12F( "lives", var_0, "killerPos", 2, _func_0BC( var_1._id_02E2[2] ) );
        _func_12F( "lives", var_0, "killerAngles", 0, _func_0BC( var_1.angles[0] ) );
        _func_12F( "lives", var_0, "killerAngles", 1, _func_0BC( var_1.angles[1] ) );
        _func_12F( "lives", var_0, "killerAngles", 2, _func_0BC( var_1.angles[2] ) );
        var_15 = anglestoforward( ( 0, self.angles[1], 0 ) );
        var_16 = self._id_02E2 - var_1._id_02E2;
        var_16 = _func_114( ( var_16[0], var_16[1], 0 ) );
        var_14 = _func_0F6( var_15, var_16 );
        _func_12F( "lives", var_0, "dotOfDeath", var_14 );

        if ( isdefined( var_1._id_680B ) && isdefined( var_1._id_680B[var_8._id_A2E0] ) )
            _func_12F( "lives", var_0, "killerCurrentWeaponPickedUp", 1 );
    }
    else
    {
        _func_12F( "lives", var_0, "killer", 255 );
        _func_12F( "lives", var_0, "killerLifeIndex", 65535 );
        _func_12F( "lives", var_0, "killerPos", 0, _func_0BC( self._id_02E2[0] ) );
        _func_12F( "lives", var_0, "killerPos", 1, _func_0BC( self._id_02E2[1] ) );
        _func_12F( "lives", var_0, "killerPos", 2, _func_0BC( self._id_02E2[2] ) );
        _func_12F( "lives", var_0, "killerAngles", 0, _func_0BC( self.angles[0] ) );
        _func_12F( "lives", var_0, "killerAngles", 1, _func_0BC( self.angles[1] ) );
        _func_12F( "lives", var_0, "killerAngles", 2, _func_0BC( self.angles[2] ) );
    }

    _func_12F( "lives", var_0, "kill_timestamp", _func_13C() );
    _func_12F( "lives", var_0, "player", self._id_1F0F );
    _func_12F( "lives", var_0, "victimPos", 0, _func_0BC( self._id_02E2[0] ) );
    _func_12F( "lives", var_0, "victimPos", 1, _func_0BC( self._id_02E2[1] ) );
    _func_12F( "lives", var_0, "victimPos", 2, _func_0BC( self._id_02E2[2] ) );
    _func_12F( "lives", var_0, "victimAngles", 0, _func_0BC( self.angles[0] ) );
    _func_12F( "lives", var_0, "victimAngles", 1, _func_0BC( self.angles[1] ) );
    _func_12F( "lives", var_0, "victimAngles", 2, _func_0BC( self.angles[2] ) );
    var_17 = "world";

    if ( _func_1AD( var_1 ) )
        var_17 = var_1._id_02A7;

    var_18 = 1;
    var_19 = 0;
    var_20 = maps\mp\_utility::_id_50B1( self );
    var_21 = 0;

    if ( _func_1AD( var_1 ) )
        var_21 = maps\mp\_utility::_id_50B1( var_1 );

    var_22 = _func_0F1( self._id_02E2 - var_1._id_02E2 );
    var_23 = 0;
    var_24 = 0.0;
    var_25 = -1;
    var_26 = -1;
    var_27 = gettime();

    if ( _func_1AD( var_1 ) )
        var_24 = var_1 _meth_833D();

    var_28 = var_1._id_1F0F;

    if ( !isdefined( var_28 ) )
        var_28 = -1;

    var_29 = var_1._id_56F7;

    if ( !isdefined( var_29 ) )
        var_29 = -1;

    var_30 = 0.1;

    if ( self._id_2583.size > 1 )
        var_18 = 0;

    if ( isdefined( self._id_2583[var_1 _meth_81B5()] ) )
        var_19 = self._id_2583[var_1 _meth_81B5()]._id_628B;

    var_31 = self._id_0308["primaryWeapon"] + "_mp";
    var_32 = _func_1B8( var_31 );

    if ( _func_120( var_8._id_A2DF, "loot" ) )
        var_23 = 1;

    if ( isdefined( self._id_89E4 ) && isdefined( self._id_89E4._id_03DC ) )
        var_25 = ( var_27 - self._id_89E4._id_03DC ) / 1000.0;

    if ( isdefined( var_1._id_89E4 ) && isdefined( var_1._id_89E4._id_03DC ) && _func_1AD( var_1 ) )
        var_26 = ( var_27 - var_1._id_89E4._id_03DC ) / 1000.0;

    _func_105( self._id_02E2, "script_mp_playerdeath: player_name %s, life_id %d, angles %v, death_dot %f, is_jugg %b, is_killstreak %b, mod %s, gameTime %d, spawnToDeathTime %f, attackerAliveTime %f, attacker_life_id %d", self._id_02A7, self._id_56F7, self.angles, var_14, var_1 maps\mp\_utility::_id_5131(), maps\mp\_utility::_id_513D( var_8._id_A2E0 ), var_3, var_27, var_25, var_26, var_29 );
    _func_105( self._id_02E2, "script_mp_weaponinfo: player_name %s, life_id %d, isbot %b, attacker_name %s, attacker %d, attacker_pos %v, distance %f, ads_fraction %f, is_jugg %b, is_killstreak %b, weapon_type %s, weapon_class %s, weapon_name %s, isLoot %b, attachKit %s, furnitureKit %s, numShots %d, soleAttacker %b, gameTime %d", self._id_02A7, self._id_56F7, var_20, var_17, var_28, var_1._id_02E2, var_22, var_24, var_1 maps\mp\_utility::_id_5131(), maps\mp\_utility::_id_513D( var_8._id_A2E0 ), var_8._id_A2F3, var_8._id_A2D5, var_8._id_A2DF, var_23, var_8.attachkit, var_8.furniturekit, var_19, var_18, var_27 );
    _func_105( self._id_02E2, "script_mp_weaponinfo_ext: player_name %s, life_id %d, gametime %d, version %f, victimWeapon %s, victimWeaponClass %s, killerIsBot %b", self._id_02A7, self._id_56F7, var_27, var_30, var_31, var_32, var_21 );

    if ( !isdefined( level._id_59E0 ) )
        level._id_59E0 = [];

    if ( !isdefined( level._id_59E0["deathCount"] ) )
        level._id_59E0["deathCount"] = 1;
    else
        level._id_59E0["deathCount"]++;

    if ( var_25 <= 3.0 )
    {
        if ( !isdefined( level._id_59E0["badSpawnDiedTooFastCount"] ) )
            level._id_59E0["badSpawnDiedTooFastCount"] = 1;
        else
            level._id_59E0["badSpawnDiedTooFastCount"]++;

        if ( self._id_89E4._id_126D == 0 )
        {
            if ( !isdefined( level._id_59E0["badSpawnByAnyMeansCount"] ) )
                level._id_59E0["badSpawnByAnyMeansCount"] = 1;
            else
                level._id_59E0["badSpawnByAnyMeansCount"]++;

            self._id_89E4._id_126D = 1;
        }
    }

    if ( _func_1AD( var_1 ) && var_26 <= 3.0 )
    {
        if ( !isdefined( level._id_59E0["badSpawnKilledTooFastCount"] ) )
            level._id_59E0["badSpawnKilledTooFastCount"] = 1;
        else
            level._id_59E0["badSpawnKilledTooFastCount"]++;

        if ( var_1._id_89E4._id_126D == 0 )
        {
            if ( !isdefined( level._id_59E0["badSpawnByAnyMeansCount"] ) )
                level._id_59E0["badSpawnByAnyMeansCount"] = 1;
            else
                level._id_59E0["badSpawnByAnyMeansCount"]++;

            var_1._id_89E4._id_126D = 1;
        }
    }
}

_id_5844()
{
    if ( !_id_1ACE( self ) )
        return;

    _func_12F( "players", self._id_1F0F, "score", maps\mp\_utility::_id_4081( "score" ) );

    if ( maps\mp\_utility::_id_4081( "assists" ) > 255 )
        _func_12F( "players", self._id_1F0F, "assists", 255 );
    else
        _func_12F( "players", self._id_1F0F, "assists", maps\mp\_utility::_id_4081( "assists" ) );

    if ( maps\mp\_utility::_id_4081( "longestStreak" ) > 255 )
        _func_12F( "players", self._id_1F0F, "longestStreak", 255 );
    else
        _func_12F( "players", self._id_1F0F, "longestStreak", maps\mp\_utility::_id_4081( "longestStreak" ) );

    if ( isdefined( self ) && isdefined( self._id_0308 ) && isdefined( self._id_0308["validationInfractions"] ) )
    {
        if ( maps\mp\_utility::_id_4081( "validationInfractions" ) > 255 )
            _func_12F( "players", self._id_1F0F, "validationInfractions", 255 );
        else
            _func_12F( "players", self._id_1F0F, "validationInfractions", maps\mp\_utility::_id_4081( "validationInfractions" ) );
    }
}

combinelbstat( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = var_1;

    var_4 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", var_3 );
    var_5 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_2, var_1 );
    var_0 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_2, var_1, var_5 + var_4 );
}

_id_31B7()
{
    foreach ( var_1 in level._id_0323 )
    {
        wait 0.05;

        if ( !isdefined( var_1 ) )
            continue;

        _id_5847( var_1 );

        if ( isdefined( var_1._id_2991 ) && var_1._id_2991 && var_1 maps\mp\_utility::_id_7139() )
            var_1 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "restXPGoal", var_1._id_2991 );

        var_2 = undefined;
        var_3 = 0;

        if ( isdefined( game["challengeStruct"] ) && isdefined( game["challengeStruct"]["challengesCompleted"] ) && isdefined( game["challengeStruct"]["challengesCompleted"][var_1._id_4450] ) )
            var_3 = 1;

        if ( var_3 )
        {
            var_2 = game["challengeStruct"]["challengesCompleted"][var_1._id_4450];

            if ( var_2.size > 0 )
            {
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "challengeNumCompleted", var_2.size );
                var_4 = maps\mp\_utility::_id_1E28( var_2.size );
                _func_12F( "players", var_1._id_1F0F, "challengesCompleted", var_4 );
            }
            else
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "challengeNumCompleted", 0 );
        }
        else
            var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "challengeNumCompleted", 0 );

        for ( var_5 = 0; var_5 < 20; var_5++ )
        {
            if ( isdefined( var_2 ) && isdefined( var_2[var_5] ) && var_2[var_5] != 8000 )
            {
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "challengesCompleted", var_5, var_2[var_5] );
                continue;
            }

            var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "challengesCompleted", var_5, 0 );
        }

        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "gameMode", level._id_01B3 );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "map", _func_123( getdvar( "mapname" ) ) );

        if ( maps\mp\_utility::_id_59E3() )
        {
            var_6 = level._id_01B3;

            if ( getdvarint( "g_hardcore" ) )
                var_6 = level._id_01B3 + "_HC";
            else if ( getdvarint( "g_oldschool" ) )
                var_6 = level._id_01B3 + "_OS";

            combinelbstat( var_1, "score", var_6 );
            combinelbstat( var_1, "timePlayed", var_6 );
            combinelbstat( var_1, "kills", var_6 );
            combinelbstat( var_1, "deaths", var_6 );
            var_7 = var_1 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_6, "gamesPlayed" );
            var_1 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "lbstats", var_6, "gamesPlayed", var_7 + 1 );

            if ( level._id_01B3 == "war" )
                combinelbstat( var_1, "assists", var_6 );
            else if ( level._id_01B3 == "dm" )
                combinelbstat( var_1, "headshots", var_6 );
            else if ( level._id_01B3 == "conf" )
            {
                combinelbstat( var_1, "confirms", var_6, "confirmed" );
                combinelbstat( var_1, "denies", var_6, "denied" );
            }
            else if ( level._id_01B3 == "sd" )
            {
                combinelbstat( var_1, "plants", var_6 );
                combinelbstat( var_1, "defuses", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level._id_01B3 == "dom" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level._id_01B3 == "koth" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "defends", var_6 );
                combinelbstat( var_1, "destructions", var_6 );
            }
            else if ( level._id_01B3 == "sab" )
            {
                combinelbstat( var_1, "plants", var_6 );
                combinelbstat( var_1, "defuses", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level._id_01B3 == "ctf" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "returns", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level._id_01B3 == "gun" )
            {
                combinelbstat( var_1, "humiliations", var_6 );
                combinelbstat( var_1, "setbacks", var_6 );
            }
            else if ( level._id_01B3 == "hp" )
            {
                combinelbstat( var_1, "captures", var_6 );
                combinelbstat( var_1, "defends", var_6 );
                combinelbstat( var_1, "captureTime", var_6 );
            }
            else if ( level._id_01B3 == "dd" )
            {
                combinelbstat( var_1, "plants", var_6 );
                combinelbstat( var_1, "defuses", var_6 );
                combinelbstat( var_1, "defends", var_6 );
            }
            else if ( level._id_01B3 == "mugger" )
            {
                combinelbstat( var_1, "muggings", var_6 );
                combinelbstat( var_1, "banked", var_6 );
            }
        }
    }
}

_id_5847( var_0 )
{
    if ( !isdefined( var_0._id_0308["maxPing"] ) || !isdefined( var_0._id_0308["minPing"] ) || !isdefined( var_0._id_0308["pingAccumulation"] ) || !isdefined( var_0._id_0308["pingSampleCount"] ) )
        return;

    if ( var_0._id_0308["pingSampleCount"] > 0 && var_0._id_0308["maxPing"] > 0 )
    {
        var_1 = maps\mp\_utility::_id_1E29( var_0._id_0308["pingAccumulation"] / var_0._id_0308["pingSampleCount"] );
        _func_12F( "players", var_0._id_1F0F, "averagePing", var_1 );
        _func_12F( "players", var_0._id_1F0F, "maxPing", maps\mp\_utility::_id_1E29( var_0._id_0308["maxPing"] ) );
        _func_12F( "players", var_0._id_1F0F, "minPing", maps\mp\_utility::_id_1E29( var_0._id_0308["minPing"] ) );
    }
}

_id_3BDB()
{
    level waittill( "game_ended" );

    foreach ( var_1 in level._id_0323 )
    {
        var_1 _id_5844();

        if ( !_func_1A1( var_1 ) )
            continue;

        var_1 _id_5846( 0 );
    }

    foreach ( var_1 in level._id_0323 )
    {
        if ( var_1._id_93FB > 0 )
        {
            var_4 = var_1 maps\mp\_utility::_id_4081( "score" ) / ( var_1._id_93FB / 60000 );
            _func_247( var_1._id_0537, var_4, var_1._id_04A7 );
        }

        var_1._id_93FB = 0;
    }
}

_id_1ACE( var_0 )
{
    if ( _func_1FF( var_0 ) )
        return 0;

    var_1 = var_0.code_classname;

    if ( !isdefined( var_1 ) )
        var_1 = "undefined";

    return var_0._id_1F0F < level._id_5A42;
}

_id_1ACF()
{
    return _func_130( "eventCount" ) < level._id_5A37;
}

_id_1AD0()
{
    return _func_130( "killstreakCount" ) < level._id_5A3C;
}

_id_1AD1( var_0 )
{
    return _func_130( "lifeCount" ) < level._id_5A40;
}

_id_584C( var_0, var_1, var_2 )
{
    if ( !_id_1ACE( self ) )
        return;

    if ( maps\mp\_utility::_id_513D( var_0 ) )
        return;

    if ( !isdefined( self._id_0308["mpWeaponStats"][var_0] ) )
        self._id_0308["mpWeaponStats"][var_0] = [];

    if ( !isdefined( self._id_0308["mpWeaponStats"][var_0][var_1] ) )
        self._id_0308["mpWeaponStats"][var_0][var_1] = 0;

    var_3 = self._id_0308["mpWeaponStats"][var_0][var_1];
    var_3 += var_2;
    self._id_0308["mpWeaponStats"][var_0][var_1] = var_3;
}

_id_1877()
{
    var_0 = [];
    var_1 = 149;

    for ( var_2 = 0; var_2 <= var_1; var_2++ )
    {
        var_3 = _func_1BB( "mp/statstable.csv", 0, var_2, 4 );

        if ( var_3 == "" )
            continue;

        if ( !_func_120( _func_1BB( "mp/statsTable.csv", 0, var_2, 2 ), "weapon_" ) )
            continue;

        if ( _func_1BB( "mp/statsTable.csv", 0, var_2, 2 ) == "weapon_other" )
            continue;

        if ( _func_1BB( "mp/statsTable.csv", 0, var_2, 51 ) != "" )
            continue;

        var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_5839()
{
    if ( !_id_1ACE( self ) )
        return;

    _func_12F( "players", self._id_1F0F, "killsConfirmed", self._id_0308["confirmed"] );
}

_id_583A()
{
    if ( !_id_1ACE( self ) )
        return;

    _func_12F( "players", self._id_1F0F, "killsDenied", self._id_0308["denied"] );
}

_id_5837()
{
    if ( getdvarint( "mdsd" ) > 0 )
    {
        var_0 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "experience" );
        _func_12F( "players", self._id_1F0F, "startXp", var_0 );
        _func_12F( "players", self._id_1F0F, "startKills", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "kills" ) );
        _func_12F( "players", self._id_1F0F, "startDeaths", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "deaths" ) );
        _func_12F( "players", self._id_1F0F, "startWins", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "wins" ) );
        _func_12F( "players", self._id_1F0F, "startLosses", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "losses" ) );
        _func_12F( "players", self._id_1F0F, "startHits", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "hits" ) );
        _func_12F( "players", self._id_1F0F, "startMisses", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "misses" ) );
        _func_12F( "players", self._id_1F0F, "startGamesPlayed", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "gamesPlayed" ) );
        _func_12F( "players", self._id_1F0F, "startScore", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "score" ) );
        _func_12F( "players", self._id_1F0F, "startPrestige", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "prestige" ) );
        _func_12F( "players", self._id_1F0F, "startDP", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "division" ) );
        var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "mmr" );
        _func_12F( "players", self._id_1F0F, "startMMR", var_1 );
    }
}

_id_5825()
{
    if ( getdvarint( "mdsd" ) > 0 )
    {
        var_0 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "experience" );
        _func_12F( "players", self._id_1F0F, "endXp", var_0 );
        _func_12F( "players", self._id_1F0F, "endKills", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "kills" ) );
        _func_12F( "players", self._id_1F0F, "endDeaths", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "deaths" ) );
        _func_12F( "players", self._id_1F0F, "endWins", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "wins" ) );
        _func_12F( "players", self._id_1F0F, "endLosses", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "losses" ) );
        _func_12F( "players", self._id_1F0F, "endHits", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "hits" ) );
        _func_12F( "players", self._id_1F0F, "endMisses", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "misses" ) );
        _func_12F( "players", self._id_1F0F, "endGamesPlayed", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "gamesPlayed" ) );
        _func_12F( "players", self._id_1F0F, "endScore", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "score" ) );
        _func_12F( "players", self._id_1F0F, "endPrestige", self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "prestige" ) );
        var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "mmr" );
        _func_12F( "players", self._id_1F0F, "endMMR", var_1 );

        if ( isdefined( self._id_0308["rank"] ) )
        {
            var_3 = maps\mp\_utility::_id_1E28( maps\mp\gametypes\_rank::_id_40A9() );
            _func_12F( "players", self._id_1F0F, "rankAtEnd", var_3 );
        }
    }
}

_id_727B()
{
    for (;;)
    {
        if ( getdvarint( "cl_freemove" ) == 0 )
        {
            foreach ( var_1 in level._id_0323 )
            {
                var_2 = 0;

                if ( maps\mp\_utility::_id_5189( var_1 ) )
                    var_2 = 1;

                if ( _func_28E( var_1 ) )
                    continue;

                if ( !isdefined( var_1._id_02E2 ) )
                    continue;

                var_3 = "disconnected?";

                if ( isdefined( var_1._id_02A7 ) )
                    var_3 = var_1._id_02A7;

                var_4 = -1;

                if ( isdefined( var_1._id_1F0F ) )
                    var_4 = var_1._id_1F0F;

                var_5 = ( -999, -999, -999 );

                if ( isdefined( var_1.angles ) )
                    var_5 = var_1.angles;

                var_6 = "undefined";

                if ( isdefined( var_1._id_04A7 ) )
                    var_6 = var_1._id_04A7;

                var_7 = gettime();
                _func_105( var_1._id_02E2, "script_mp_playerpos: player_name %s, angles %v, gameTime %d, playerTeam %s, is_alive %b", var_3, var_5, var_7, var_6, var_2 );
            }
        }

        wait 0.2;
    }
}

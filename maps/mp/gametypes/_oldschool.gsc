// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( maps\mp\_utility::_id_4FA6() )
    {
        level.oldschool = 0;
        return;
    }

    if ( !level.oldschool )
    {
        deletepickups();
        return;
    }

    if ( getdvar( "scr_os_pickupweaponrespawntime" ) == "" )
        setdvar( "scr_os_pickupweaponrespawntime", "15" );

    level.pickupweaponrespawntime = getdvarfloat( "scr_os_pickupweaponrespawntime" );

    if ( getdvar( "scr_os_pickupperkrespawntime" ) == "" )
        setdvar( "scr_os_pickupperkrespawntime", "25" );

    level.pickupperkrespawntime = getdvarfloat( "scr_os_pickupperkrespawntime" );
    oldschoolloadout();
    level._id_1969 = ::_id_1969;
    level.streamprimariesfunc = ::streamprimariesfunc;
    thread _id_4DFA();
    thread _id_64C8();
    level.oldschoolpickupsound = "oldschool_pickup";
    level.oldschoolrespawnsound = "oldschool_return";
    level.perkpickuphints = [];
    level.perkpickuphints["specialty_bulletdamage"] = &"PLATFORM_PICK_UP_STOPPING_POWER";
    level.perkpickuphints["specialty_armorvest"] = &"PLATFORM_PICK_UP_JUGGERNAUT";
    level.perkpickuphints["specialty_rof"] = &"PLATFORM_PICK_UP_DOUBLE_TAP";
    level.perkpickuphints["specialty_pistoldeath"] = &"PLATFORM_PICK_UP_LAST_STAND";
    level.perkpickuphints["specialty_grenadepulldeath"] = &"PLATFORM_PICK_UP_MARTYRDOM";
    level.perkpickuphints["specialty_fastreload"] = &"PLATFORM_PICK_UP_SLEIGHT_OF_HAND";
}

_id_1969()
{
    self._id_0308["class"] = "gamemode";
    self._id_0308["lastClass"] = "";
    self._id_0308["gamemodeLoadout"] = level.oldschool_loadout;
    self._id_1E2E = self._id_0308["class"];
    self._id_5589 = self._id_0308["lastClass"];
    self _meth_8508( level.oldschool_loadout["loadoutPrimary"] );
}

streamprimariesfunc()
{
    var_0 = [ "axis", "allies" ];
    var_1 = maps\mp\gametypes\_class::_id_188C( level.oldschool_loadout["loadoutPrimary"] );
    var_2 = maps\mp\gametypes\_class::_id_188C( level.oldschool_loadout["loadoutSecondary"] );
    var_3 = [];

    foreach ( var_5 in var_0 )
    {
        var_6 = spawnstruct();
        var_6._id_04A7 = var_5;
        var_6._id_0513 = var_1;
        var_3[var_3.size] = var_6;
    }

    self _meth_8420( var_3, var_1, var_2 );
}

oldschoolloadout()
{
    level.oldschool_loadout = maps\mp\gametypes\_class::_id_3F7B();
    level.oldschool_loadout["loadoutPrimary"] = "h1_skorpion";
    level.oldschool_loadout["loadoutSecondary"] = "h1_beretta";
    level.oldschool_loadout["loadoutEquipment"] = "h1_fraggrenade_mp";
    level.oldschool_loadout["loadoutOffhand"] = "h1_flashgrenade_mp";
}

deletepickups()
{
    var_0 = getentarray( "oldschool_pickup", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_04A4 ) )
            getent( var_0[var_1]._id_04A4, "targetname" ) delete();

        var_0[var_1] delete();
    }
}

converttoh1weaponclassname( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "weapon_frag_grenade_mp":
        case "weapon_h1_fraggrenade_mp":
            return "weapon_h1_fraggrenade_mp";
        case "weapon_smoke_grenade_mp":
        case "weapon_h1_smokegrenade_mp":
            return "weapon_h1_smokegrenade_mp";
        case "weapon_flash_grenade_mp":
        case "weapon_h1_flashgrenade_mp":
            return "weapon_h1_flashgrenade_mp";
        default:
            break;
    }

    var_2 = _func_124( var_0, "_" );
    var_3 = undefined;
    var_4 = "none";

    if ( var_2[1] == "h1" )
    {
        var_3 = var_2[2];

        if ( isdefined( var_1 ) )
            var_4 = var_1;
    }
    else
    {
        var_3 = var_2[1];

        if ( var_2.size == 4 )
        {
            var_5 = "h1_" + var_3 + "_mp";
            var_6 = _func_2F8( var_5 );
            var_7 = var_2[2] + "mwr";

            foreach ( var_9 in var_6 )
            {
                if ( var_9 == var_7 )
                {
                    var_4 = var_2[2];
                    break;
                }
            }

            if ( var_4 == "none" )
            {

            }
        }
    }

    var_3 = "h1_" + var_3 + "_mp";

    if ( _func_1E4( var_3 ) == "item" )
        return "weapon_" + var_3;
    else
        return "weapon_" + var_3 + "_a#" + var_4 + "_f#base";
}

converttoh1pickup( var_0 )
{
    var_1 = var_0._id_02E2;
    var_2 = var_0.angles;
    var_3 = 19;
    var_4 = var_0._id_04A6;
    var_5 = converttoh1weaponclassname( var_0.classname, var_0._id_0398 );
    var_6 = spawn( var_5, var_1, var_3 );
    var_6.angles = var_2;
    var_6._id_04A6 = var_4;
    var_6._id_7A99 = var_0._id_7A99;
    var_0 delete();
}

isweaponpickup( var_0 )
{
    var_1 = var_0.classname;
    return isdefined( var_1 ) && _func_120( var_1, "weapon_" );
}

usenormalfx()
{
    level.pickupavailableeffect = loadfx( "misc/ui_pickup_available" );
    level.pickupunavailableeffect = loadfx( "misc/ui_pickup_unavailable" );
}

usebrightfx()
{
    level.pickupavailableeffect = loadfx( "misc/ui_pickup_available_bright" );
    level.pickupunavailableeffect = loadfx( "misc/ui_pickup_unavailable_bright" );
}

useunlitfx()
{
    level.pickupavailableeffect = loadfx( "misc/ui_pickup_available_unlit" );
    level.pickupunavailableeffect = loadfx( "misc/ui_pickup_unavailable_unlit" );
}

_id_4DFA()
{
    if ( !isdefined( level.oldschoolfxtype ) )
        level.oldschoolfxtype = "normal";

    switch ( level.oldschoolfxtype )
    {
        case "unlit":
            useunlitfx();
            break;
        case "bright":
            usebrightfx();
            break;
        default:
            usenormalfx();
            break;
    }

    var_0 = getentarray( "oldschool_pickup", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isweaponpickup( var_0[var_1] ) )
            converttoh1pickup( var_0[var_1] );
    }

    wait 0.5;
    var_0 = getentarray( "oldschool_pickup", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread trackpickup( var_0[var_1], var_1 );

    level.allpickupstracked = 1;
}

spawnpickupfx( var_0, var_1 )
{
    var_2 = spawnfx( var_1, var_0, ( 0, 0, 1 ), ( 1, 0, 0 ) );
    triggerfx( var_2 );
    return var_2;
}

playeffectshortly( var_0 )
{
    self endon( "death" );
    wait 0.05;
    playfxontag( var_0, self, "tag_origin" );
}

getpickupgroundpoint( var_0 )
{
    var_1 = 44.0;
    var_2 = _func_06B( var_0._id_02E2, var_0._id_02E2 + ( 0, 0, -128 ), 0, var_0 );
    var_3 = var_2["position"];
    var_4 = var_3[2];

    for ( var_5 = 1; var_5 <= 3; var_5++ )
    {
        var_6 = var_5 / 3.0 * var_1;

        for ( var_7 = 0; var_7 < 10; var_7++ )
        {
            var_8 = var_7 / 10.0 * 360.0;
            var_9 = var_0._id_02E2 + ( _func_0B7( var_8 ), _func_0B6( var_8 ), 0 ) * var_6;
            var_2 = _func_06B( var_9, var_9 + ( 0, 0, -128 ), 0, var_0 );
            var_10 = var_2["position"];

            if ( var_10[2] > var_4 && var_10[2] < var_3[2] + 15 )
                var_4 = var_10[2];
        }
    }

    return ( var_3[0], var_3[1], var_4 );
}

trackpickup( var_0, var_1 )
{
    var_2 = getpickupgroundpoint( var_0 );
    var_0.groundpoint = var_2;
    var_3 = spawnpickupfx( var_2, level.pickupavailableeffect );
    var_4 = var_0.classname;
    var_5 = var_0._id_02E2;
    var_6 = var_0.angles;
    var_7 = var_0._id_03DA;
    var_8 = var_0._id_029C;
    var_9 = var_0._id_04A6;
    var_10 = var_0._id_0398;
    var_11 = 0;
    var_12 = 0;
    var_13 = undefined;
    var_14 = undefined;
    var_15 = undefined;
    var_16 = undefined;

    if ( _func_120( var_4, "weapon_" ) )
    {
        var_11 = 1;
        var_13 = var_0 maps\mp\gametypes\_weapons::_id_3FDC();
        var_16 = level.pickupweaponrespawntime;
    }
    else if ( var_4 == "script_model" )
    {
        var_12 = 1;
        var_14 = var_0._id_0398;

        if ( !isdefined( level.perkpickuphints[var_14] ) )
        {
            common_scripts\utility::_id_334F( "oldschool_pickup with classname script_model does not have script_noteworthy set to a valid perk" );
            return;
        }

        var_15 = getent( var_0._id_04A4, "targetname" );
        var_16 = level.pickupperkrespawntime;

        if ( !getdvarint( "scr_game_perks" ) )
        {
            var_0 delete();
            var_15 delete();
            var_3 delete();
            return;
        }

        if ( isdefined( level.perkpickuphints[var_14] ) )
            var_15 _meth_80DD( level.perkpickuphints[var_14] );
    }
    else
    {
        common_scripts\utility::_id_334F( "oldschool_pickup with classname " + var_4 + " is not supported (at location " + var_0._id_02E2 + ")" );
        return;
    }

    if ( isdefined( var_0._id_0392 ) )
        var_16 = var_0._id_0392;

    var_0.respawntime = var_16;

    for (;;)
    {
        var_17 = undefined;

        if ( var_11 )
        {
            var_0 thread changesecondarygrenadetype( var_13 );
            var_0 setpickupstartammo( var_13 );

            for (;;)
            {
                var_0 waittill( "trigger", var_17, var_18 );

                if ( !isdefined( var_0 ) )
                    break;
            }

            if ( isdefined( var_18 ) )
            {
                var_19 = 5;

                if ( var_19 > var_16 )
                    var_19 = var_16;

                var_18 thread delayeddeletion( var_19 );
            }
        }
        else
        {
            var_15 waittill( "trigger", var_17 );
            var_0 delete();
            var_15 common_scripts\utility::_id_97CC();
        }

        if ( var_11 )
        {
            if ( _func_1E4( var_13 ) == "item" && ( !isdefined( var_17.inventoryweapon ) || var_13 != var_17.inventoryweapon ) )
            {
                var_17 removeinventoryweapon();
                var_17.inventoryweapon = var_13;
                var_17 _meth_8305( 3, "weapon", var_13 );
            }
        }
        else if ( !var_17 maps\mp\_utility::_id_05CB( var_14 ) )
        {
            var_17 maps\mp\_utility::_id_41F8( var_14, 1, var_17.numperks );
            var_17.numperks++;
        }

        thread maps\mp\_utility::_id_6DDC( level.oldschoolpickupsound, var_5 );
        var_3 delete();
        var_3 = spawnpickupfx( var_2, level.pickupunavailableeffect );
        wait(var_16);
        var_0 = spawn( var_4, var_5, var_7 );
        var_0.angles = var_6;
        var_0._id_04A6 = var_9;
        var_0._id_0398 = var_10;
        var_0.groundpoint = var_2;
        var_0.respawntime = var_16;

        if ( var_12 )
        {
            var_0 _meth_80B3( var_8 );
            var_15 common_scripts\utility::_id_97CE();
        }

        var_0 _meth_809C( level.oldschoolrespawnsound );
        var_3 delete();
        var_3 = spawnpickupfx( var_2, level.pickupavailableeffect );
    }
}

setpickupstartammo( var_0 )
{
    var_1 = var_0;

    for ( var_2 = 0; var_2 == 0 || var_1 != var_0 && var_1 != "none"; var_2++ )
    {
        var_3 = _func_1E5( var_1 );
        var_4 = _func_1B1( var_1 );
        var_5 = 0;

        if ( var_4 >= var_3 )
            var_4 = var_3;
        else
            var_5 = var_3 - var_4;

        self _meth_8182( var_4, var_5, var_4, var_2 );
        var_1 = _func_1E7( var_1 );
    }
}

changesecondarygrenadetype( var_0 )
{
    self endon( "trigger" );
    var_1 = "h1_smokegrenade_mp";
    var_2 = "h1_flashgrenade_mp";
    var_3 = "h1_concussiongrenade_mp";

    if ( var_0 != var_1 && var_0 != var_2 && var_0 != var_3 )
        return;

    var_4 = spawn( "trigger_radius", self._id_02E2 - ( 0, 0, 20 ), 0, 128, 64 );
    thread deletetriggerwhenpickedup( var_4 );

    for (;;)
    {
        var_4 waittill( "trigger", var_5 );

        if ( var_5 getweaponammototal( var_1 ) == 0 && var_5 getweaponammototal( var_2 ) == 0 && var_5 getweaponammototal( var_3 ) == 0 )
            var_5 _meth_8316( var_0 );
    }
}

deletetriggerwhenpickedup( var_0 )
{
    self waittill( "trigger" );
    var_0 delete();
}

resetactionslottoaltmode( var_0 )
{
    self notify( "resetting_action_slot_to_alt_mode" );
    self endon( "resetting_action_slot_to_alt_mode" );

    for (;;)
    {
        if ( getweaponammototal( var_0 ) == 0 )
        {
            var_1 = self _meth_830E();

            if ( var_1 != var_0 && var_1 != "none" )
                break;
        }

        wait 0.2;
    }

    removeinventoryweapon();
    self _meth_8305( 3, "altmode" );
}

getweaponammototal( var_0 )
{
    return self _meth_82F5( var_0 ) + self _meth_82F6( var_0 );
}

removeinventoryweapon()
{
    if ( isdefined( self.inventoryweapon ) )
        self _meth_830C( self.inventoryweapon );

    self.inventoryweapon = undefined;
}

delayeddeletion( var_0 )
{
    thread delayeddeletiononswappedweapons( var_0 );
    wait(var_0);

    if ( isdefined( self ) )
    {
        self notify( "death" );
        self delete();
    }
}

delayeddeletiononswappedweapons( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1, var_2 );

        if ( isdefined( var_2 ) )
            break;
    }

    var_2 thread delayeddeletion( var_0 );
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connecting", var_0 );
        var_0 thread _id_64D6();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self.inventoryweapon = undefined;
        self _meth_82A4();
        self.numperks = 0;
        thread clearperksondeath();
        thread watchweaponslist();
    }
}

clearperksondeath()
{
    self endon( "disconnect" );
    self waittill( "death" );
    self _meth_82A4();
    self.numperks = 0;
}

watchweaponslist()
{
    self endon( "death" );
    waitframe;
    self._id_A2E6 = self _meth_8308();

    for (;;)
    {
        self waittill( "weapon_change", var_0 );
        thread updateweaponslist( 0.05 );
    }
}

updateweaponslist( var_0 )
{
    self endon( "death" );
    self notify( "updating_weapons_list" );
    self endon( "updating_weapons_list" );
    self._id_A2E6 = self _meth_8308();
}

hadweaponbeforepickingup( var_0 )
{
    for ( var_1 = 0; var_1 < self._id_A2E6.size; var_1++ )
    {
        if ( self._id_A2E6[var_1] == var_0 )
            return 1;
    }

    return 0;
}

givestartammooldschool( var_0 )
{
    self _meth_82F4( var_0, self _meth_82F6( var_0 ) + self _meth_82F5( var_0 ) );
}

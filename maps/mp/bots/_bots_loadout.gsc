// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    _id_4D68();
    _id_4CC5();
    init_bot_attachkittable();
    _id_4CC0();
    _id_4CBE();
    level._id_16A3 = [];
    level._id_1695 = 1;
}

_id_4CC5()
{
    var_0 = "mp/botClassTable.csv";
    level._id_1741 = [];
    var_1 = _id_168C();
    var_2 = 0;

    for (;;)
    {
        var_2++;
        var_3 = _func_1BB( var_0, 0, "botPersonalities", var_2 );
        var_4 = _func_1BB( var_0, 0, "botDifficulties", var_2 );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        if ( !isdefined( var_4 ) || var_4 == "" )
            break;

        var_5 = [];

        foreach ( var_7 in var_1 )
            var_5[var_7] = _func_1BB( var_0, 0, var_7, var_2 );

        var_9 = _func_124( var_3, "| " );
        var_10 = _func_124( var_4, "| " );

        foreach ( var_12 in var_9 )
        {
            foreach ( var_14 in var_10 )
            {
                var_15 = _id_1691( var_12, var_14, 1 );
                var_16 = spawnstruct();
                var_16._id_57E7 = var_5;
                var_15._id_0253[var_15._id_0253.size] = var_16;
            }
        }
    }
}

_id_4D68()
{
    var_0 = "mp/botTemplateTable.csv";
    level._id_1742 = [];
    var_1 = _id_168C();
    var_2 = 0;

    for (;;)
    {
        var_2++;
        var_3 = _func_1BB( var_0, 0, "template_", var_2 );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        var_4 = "template_" + var_3;
        level._id_1742[var_4] = [];

        foreach ( var_6 in var_1 )
        {
            var_7 = _func_1BB( var_0, 0, var_6, var_2 );

            if ( isdefined( var_7 ) && var_7 != "" )
                level._id_1742[var_4][var_6] = var_7;
        }
    }
}

_id_15E8()
{
    if ( _func_13E() )
    {
        if ( !_func_13D( "commonOption", "allowCustomClasses" ) )
            return 0;
    }

    return 1;
}

_id_168E( var_0, var_1, var_2 )
{
    if ( !_func_13E() )
        return 1;

    if ( !_id_15E8() )
        return 0;

    if ( var_1 == "specialty_null" )
        return 1;

    if ( var_1 == "none" )
        return 1;

    var_3 = var_0 + "Restricted";
    var_4 = var_0 + "ClassRestricted";
    var_5 = "";

    switch ( var_0 )
    {
        case "weapon":
            var_5 = maps\mp\_utility::_id_4167( var_1 );
            break;
        case "attachment":
            var_3 = "attachmentBaseRestricted";
            var_1 = maps\mp\_utility::getbasearrayforattachkit( var_1 );

            foreach ( var_7 in var_1 )
            {
                if ( var_5 == "" )
                    var_5 = maps\mp\_utility::getgroupforattachkitbase( var_7 );
            }

            break;
        case "perk":
            var_5 = var_2;
            break;
        default:
            return 0;
    }

    if ( _func_0CE( var_1 ) )
    {
        foreach ( var_7 in var_1 )
        {
            if ( _func_13D( "commonOption", var_3, var_7 ) )
                return 0;
        }
    }
    else if ( _func_13D( "commonOption", var_3, var_1 ) )
        return 0;

    if ( var_5 != "" && _func_13D( "commonOption", var_4, var_5 ) )
        return 0;

    return 1;
}

_id_1682( var_0 )
{
    var_1 = "none";
    var_2 = [ "veteran", "hardened", "regular", "recruit" ];
    var_2 = common_scripts\utility::_id_0CF5( var_2 );

    foreach ( var_4 in var_2 )
    {
        var_1 = _id_1689( "weap_statstable", var_0, "loadoutPrimary", self._id_67DF, var_4 );

        if ( var_1 != "none" )
            return var_1;
    }

    if ( isdefined( level._id_16B1 ) )
    {
        var_6 = common_scripts\utility::_id_0CF5( level._id_16B1 );

        foreach ( var_8 in var_6 )
        {
            foreach ( var_4 in var_2 )
            {
                var_1 = _id_1689( "weap_statstable", var_0, "loadoutPrimary", var_8, var_4 );

                if ( var_1 != "none" )
                {
                    self._id_1609 = var_8;
                    return var_1;
                }
            }
        }
    }

    if ( _func_13E() )
    {
        var_12 = 0.0;
        var_13 = 0;

        for ( var_14 = "none"; var_13 < 5; var_13++ )
        {
            if ( _func_13D( "defaultClasses", _id_1693(), "defaultClass", var_13, "class", "inUse" ) )
            {
                var_1 = _id_1685( var_13, "loadoutPrimary" );

                if ( var_1 != "none" )
                {
                    var_12 += 1.0;

                    if ( _func_0B3( 1.0 ) >= 1.0 / var_12 )
                        var_14 = var_1;
                }
            }
        }

        if ( var_14 != "none" )
        {
            self._id_1609 = "weapon";
            return var_14;
        }
    }

    self._id_1609 = "weapon";
    return level._id_160A;
}

_id_1693()
{
    if ( !isdefined( level._id_91EB ) || !level._id_91EB )
        return "allies";

    return maps\mp\bots\_bots::_id_163A();
}

_id_15EA()
{
    var_0 = [ "class1", "class2", "class3", "class4", "class5" ];

    if ( _func_13E() )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( _func_13D( "defaultClasses", _id_1693(), "defaultClass", var_1, "class", "inUse" ) )
                var_0[var_1] = var_1;
        }
    }

    var_2 = common_scripts\utility::_id_710E( var_0 );
    var_3 = [];

    foreach ( var_5 in level._id_168C )
    {
        if ( isstring( var_2 ) )
        {
            var_3[var_5] = _id_1686( var_2, var_5 );
            continue;
        }

        var_3[var_5] = _id_1685( var_2, var_5 );
    }

    return var_3;
}

_id_16B5( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_1 = level._id_1738[var_0];

        if ( isdefined( var_1 ) )
        {
            var_2 = _func_124( var_1, "| " );

            if ( var_2.size > 0 )
                maps\mp\bots\_bots_util::_id_16ED( common_scripts\utility::_id_710E( var_2 ) );
        }
    }
}

_id_168C()
{
    var_0 = "mp/botClassTable.csv";

    if ( !isdefined( level._id_168C ) )
    {
        level._id_168C = [];
        var_1 = 2;

        for (;;)
        {
            var_2 = _func_1BC( var_0, var_1, 0 );

            if ( var_2 == "" )
                break;

            level._id_168C[level._id_168C.size] = var_2;
            var_1++;
        }
    }

    return level._id_168C;
}

_id_1691( var_0, var_1, var_2 )
{
    var_3 = var_1 + "_" + var_0;

    if ( !isdefined( level._id_1741 ) )
        level._id_1741 = [];

    if ( !isdefined( level._id_1741[var_3] ) && var_2 )
    {
        level._id_1741[var_3] = spawnstruct();
        level._id_1741[var_3]._id_0253 = [];
    }

    if ( isdefined( level._id_1741[var_3] ) )
        return level._id_1741[var_3];
}

_id_1690( var_0, var_1 )
{
    var_2 = _id_1691( var_0, var_1, 0 );

    if ( isdefined( var_2 ) && isdefined( var_2._id_0253 ) && var_2._id_0253.size > 0 )
    {
        var_3 = _func_0B2( var_2._id_0253.size );
        return var_2._id_0253[var_3]._id_57E7;
    }
}

bot_validate_attachkit_for_weapon( var_0, var_1, var_2 )
{
    if ( var_1 == "none" )
        return 0;

    if ( var_0 == "none" )
        return 1;

    if ( !_id_168E( "attachment", var_0, undefined ) )
        return 0;

    if ( var_1 == "h1_mp44" || var_1 == "h1_deserteagle" || var_1 == "h1_deserteagle55" )
        return 0;

    var_3 = var_1 + "_mp";
    var_4 = _func_1B8( var_3 );

    if ( var_0 == "silencer" && var_2 == "recruit" )
    {
        if ( var_4 != "pistol" )
            return 0;
    }

    if ( var_0 == "acog" && var_4 == "sniper" )
    {
        if ( !self.bot_loadout_can_pick_acog_for_sniper )
            return 0;
    }

    if ( bot_attachkit_replaces_perk1( var_0 ) )
    {
        if ( isdefined( self.loadoutitemsalreadychosen ) && isdefined( self.loadoutitemsalreadychosen["loadoutPerk1"] ) )
        {
            if ( self.loadoutitemsalreadychosen["loadoutPerk1"] != "specialty_null" )
                return 0;
        }
    }

    if ( var_0 == "silencer" )
    {
        if ( !self.bot_loadout_can_pick_silencer )
            return 0;
    }

    var_5 = level.bot_attachkittable_reference[var_0]["validClasses"];
    var_6 = level.bot_attach_weaponclasstoattachtableclass[var_4];

    if ( !common_scripts\utility::_id_0CE4( var_5, var_6 ) )
        return 0;

    var_7 = _func_2F8( var_3 );

    if ( var_7.size == 0 )
        return 0;

    var_8 = level.bot_attachkittable_reference[var_0]["attachmentArray"];

    if ( var_8.size == 1 )
    {
        if ( !common_scripts\utility::_id_0CE4( var_7, var_8[0] ) )
            return 0;
    }
    else
    {
        var_9 = 0;

        for ( var_10 = 0; var_10 < var_8.size; var_10++ )
        {
            if ( common_scripts\utility::_id_0CE4( var_7, var_8[var_10] ) )
            {
                var_9 = 1;

                for ( var_11 = 0; var_11 < var_8.size; var_11++ )
                {
                    if ( var_11 != var_10 )
                    {

                    }
                }

                break;
            }
        }

        if ( !var_9 )
            return 0;
    }

    return 1;
}

_id_4CC0()
{
    var_0 = "mp/statstable.csv";
    var_1 = 4;
    var_2 = 57;
    var_3 = 58;
    level._id_1739 = [];
    level._id_1738 = [];
    var_4 = 1;

    for (;;)
    {
        var_5 = _func_1BC( var_0, var_4, 0 );

        if ( var_5 == "" )
            break;

        var_6 = _func_1BC( var_0, var_4, var_1 );
        var_7 = _func_1BC( var_0, var_4, var_3 );
        var_8 = _func_1BC( var_0, var_4, var_2 );

        if ( var_7 != "" && var_6 != "" && var_8 != "" )
        {
            var_9 = "loadoutPrimary";

            if ( maps\mp\gametypes\_class::_id_51F5( var_6 ) )
                var_9 = "loadoutSecondary";
            else if ( !maps\mp\gametypes\_class::_id_51F3( var_6 ) )
            {
                var_4++;
                continue;
            }

            if ( var_6 != "" && var_8 != "" )
                level._id_1738[var_6] = var_8;

            if ( !isdefined( level._id_1739[var_9] ) )
                level._id_1739[var_9] = [];

            var_10 = _func_124( var_8, "| " );
            var_11 = _func_124( var_7, "| " );

            foreach ( var_13 in var_10 )
            {
                if ( !isdefined( level._id_1739[var_9][var_13] ) )
                    level._id_1739[var_9][var_13] = [];

                foreach ( var_15 in var_11 )
                {
                    if ( !isdefined( level._id_1739[var_9][var_13][var_15] ) )
                        level._id_1739[var_9][var_13][var_15] = [];

                    var_16 = level._id_1739[var_9][var_13][var_15].size;
                    level._id_1739[var_9][var_13][var_15][var_16] = var_6;
                }
            }
        }

        var_4++;
    }
}

_id_1689( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "none";

    if ( var_3 == "default" )
        var_3 = "run_and_gun";

    var_6 = var_2;

    if ( var_6 == "loadoutSecondary" && var_1["loadoutPerk2"] == "specialty_twoprimaries" )
    {
        var_6 = "loadoutPrimary";

        if ( var_3 == "camper" || var_3 == "run_and_gun" )
            var_3 = "cqb";
        else if ( var_3 == "cqb" )
            var_3 = "run_and_gun";
    }

    if ( !isdefined( level._id_1739 ) )
        return var_5;

    if ( !isdefined( level._id_1739[var_6] ) )
        return var_5;

    if ( !isdefined( level._id_1739[var_6][var_3] ) )
        return var_5;

    if ( !isdefined( level._id_1739[var_6][var_3][var_4] ) )
        return var_5;

    var_5 = _id_1688( level._id_1739[var_6][var_3][var_4], var_0, var_1, var_2 );
    return var_5;
}

bot_validate_offhand( var_0, var_1, var_2 )
{
    if ( !_id_168E( "perk", var_0, "Tactical" ) )
        return 0;

    if ( !maps\mp\gametypes\_class::_id_51F2( var_0 ) )
        return 0;

    if ( var_0 == "h1_smokegrenade_mp" )
    {
        if ( isdefined( var_2["loadoutPerk1"] ) )
        {
            if ( var_2["loadoutPerk1"] == "specialty_specialgrenade" )
                return 0;
        }

        if ( isdefined( self.loadoutitemsalreadychosen ) && isdefined( self.loadoutitemsalreadychosen["loadoutPerk1"] ) )
        {
            if ( self.loadoutitemsalreadychosen["loadoutPerk1"] == "specialty_specialgrenade" )
                return 0;
        }
    }

    return 1;
}

_id_1726( var_0, var_1, var_2 )
{
    if ( var_0 == "specialty_null" )
        return 1;

    var_3 = "Perk_Slot1";

    if ( var_1 == "loadoutPerk2" )
        var_3 = "Perk_Slot2";
    else if ( var_1 == "loadoutPerk3" )
        var_3 = "Perk_Slot3";

    if ( !_id_168E( "perk", var_0, var_3 ) )
        return 0;

    if ( var_0 == "specialty_specialgrenade" )
    {
        if ( isdefined( var_2["loadoutOffhand"] ) )
        {
            if ( var_2["loadoutOffhand"] == "h1_smokegrenade_mp" )
                return 0;
        }

        if ( isdefined( self.loadoutitemsalreadychosen ) && isdefined( self.loadoutitemsalreadychosen["loadoutOffhand"] ) )
        {
            if ( self.loadoutitemsalreadychosen["loadoutOffhand"] == "h1_smokegrenade_mp" )
                return 0;
        }
    }

    var_4 = _func_0BC( _func_122( var_1, 11 ) );

    if ( var_4 == 1 )
    {
        if ( isdefined( self.loadoutitemsalreadychosen ) )
        {
            if ( isdefined( self.loadoutitemsalreadychosen["loadoutPrimaryAttachKit"] ) )
            {
                if ( bot_attachkit_replaces_perk1( self.loadoutitemsalreadychosen["loadoutPrimaryAttachKit"] ) )
                    return 0;
            }

            if ( isdefined( self.loadoutitemsalreadychosen["loadoutSecondaryAttachKit"] ) )
            {
                if ( bot_attachkit_replaces_perk1( self.loadoutitemsalreadychosen["loadoutSecondaryAttachKit"] ) )
                    return 0;
            }
        }
    }

    return 1;
}

_id_1686( var_0, var_1 )
{
    var_2 = _func_0BC( _func_122( var_0, 5, 6 ) ) - 1;

    switch ( var_1 )
    {
        case "loadoutPrimary":
            return maps\mp\gametypes\_class::_id_90A4( level._id_1E3D, var_2, 0 );
        case "loadoutPrimaryAttachKit":
            return maps\mp\gametypes\_class::table_getweaponattachkit( level._id_1E3D, var_2, 0 );
        case "loadoutPrimaryFurnitureKit":
            return maps\mp\gametypes\_class::table_getweaponfurniturekit( level._id_1E3D, var_2, 0 );
        case "loadoutPrimaryCamo":
            return maps\mp\gametypes\_class::_id_90A7( level._id_1E3D, var_2, 0 );
        case "loadoutPrimaryReticle":
            return maps\mp\gametypes\_class::_id_90A8( level._id_1E3D, var_2, 0 );
        case "loadoutSecondary":
            return maps\mp\gametypes\_class::_id_90A4( level._id_1E3D, var_2, 1 );
        case "loadoutSecondaryAttachKit":
            return maps\mp\gametypes\_class::table_getweaponattachkit( level._id_1E3D, var_2, 1 );
        case "loadoutSecondaryFurnitureKit":
            return maps\mp\gametypes\_class::table_getweaponfurniturekit( level._id_1E3D, var_2, 1 );
        case "loadoutSecondaryCamo":
            return maps\mp\gametypes\_class::_id_90A7( level._id_1E3D, var_2, 1 );
        case "loadoutSecondaryReticle":
            return maps\mp\gametypes\_class::_id_90A8( level._id_1E3D, var_2, 1 );
        case "loadoutEquipment":
            return maps\mp\gametypes\_class::_id_909C( level._id_1E3D, var_2 );
        case "loadoutOffhand":
            return maps\mp\gametypes\_class::_id_90A0( level._id_1E3D, var_2 );
        case "loadoutPerk1":
        case "loadoutPerk2":
        case "loadoutPerk3":
            var_3 = _func_0BC( _func_122( var_1, 11 ) ) - 1;
            var_4 = maps\mp\gametypes\_class::_id_90A2( level._id_1E3D, var_2, var_3 );

            if ( var_4 == "" )
                return "specialty_null";

            return var_4;
    }

    return var_0;
}

_id_1685( var_0, var_1 )
{
    var_2 = _id_1693();

    switch ( var_1 )
    {
        case "loadoutPrimary":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 0, "weapon" );
        case "loadoutPrimaryAttachKit":
            var_3 = _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 0, "kit", "attachKit" );
            var_4 = _func_1BB( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
            return var_4;
        case "loadoutPrimaryFurnitureKit":
            var_5 = _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 0, "kit", "furnitureKit" );
            var_6 = _func_1BB( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_5 ), 1 );
            return var_6;
        case "loadoutPrimaryCamo":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 0, "camo" );
        case "loadoutPrimaryReticle":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 0, "reticle" );
        case "loadoutSecondary":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 1, "weapon" );
        case "loadoutSecondaryAttachKit":
            var_3 = _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 1, "kit", "attachKit" );
            var_4 = _func_1BB( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
            return var_4;
        case "loadoutSecondaryFurnitureKit":
            var_5 = _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 1, "kit", "furnitureKit" );
            var_6 = _func_1BB( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_5 ), 1 );
            return var_6;
        case "loadoutSecondaryCamo":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 1, "camo" );
        case "loadoutSecondaryReticle":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "weaponSetups", 1, "reticle" );
        case "loadoutEquipment":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "equipment", 0 );
        case "loadoutOffhand":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "equipment", 1 );
        case "loadoutPerk1":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "perkSlots", 0 );
        case "loadoutPerk2":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "perkSlots", 1 );
        case "loadoutPerk3":
            return _func_13D( "defaultClasses", var_2, "defaultClass", var_0, "class", "perkSlots", 2 );
        default:
    }

    return "none";
}

init_bot_attachkittable()
{
    var_0 = "mp/attachkits.csv";
    var_1 = 1;
    var_2 = 2;
    var_3 = 5;
    var_4 = 6;
    var_5 = 12;
    var_6 = 13;
    level.bot_attachkittable = [];
    level.bot_attachkittable_reference = [];
    var_7 = 1;

    for (;;)
    {
        var_8 = _func_1BC( var_0, var_7, 0 );

        if ( var_8 == "" )
            break;

        var_9 = _func_1BC( var_0, var_7, var_1 );
        var_10 = _func_1BC( var_0, var_7, var_5 );
        var_11 = _func_1BC( var_0, var_7, var_6 );

        if ( var_9 != "" && var_10 != "" && var_11 != "" )
        {
            var_12 = _func_124( var_10, "| " );

            foreach ( var_14 in var_12 )
            {
                if ( !isdefined( level.bot_attachkittable[var_14] ) )
                    level.bot_attachkittable[var_14] = [];

                var_15 = _func_124( var_11, "| " );

                foreach ( var_17 in var_15 )
                {
                    if ( !isdefined( level.bot_attachkittable[var_14][var_17] ) )
                        level.bot_attachkittable[var_14][var_17] = [];

                    var_18 = level.bot_attachkittable[var_14][var_17].size;
                    level.bot_attachkittable[var_14][var_17][var_18] = var_9;
                }
            }

            var_21 = _func_1BC( var_0, var_7, var_4 );
            var_22 = _func_124( var_21, " " );
            level.bot_attachkittable_reference[var_9]["validClasses"] = var_22;
            var_23 = [];

            for ( var_24 = var_2; var_24 <= var_3; var_24++ )
            {
                var_25 = _func_1BC( var_0, var_7, var_24 );

                if ( var_25 != "" )
                    var_23[var_23.size] = var_25;
            }

            level.bot_attachkittable_reference[var_9]["attachmentArray"] = var_23;
            level.bot_attachkittable_reference[var_9]["replacesPerk1"] = var_9 == "gl" || var_9 == "grip";
        }

        var_7++;
    }

    level.bot_attach_weaponclasstoattachtableclass["rifle"] = "ast";
    level.bot_attach_weaponclasstoattachtableclass["smg"] = "smg";
    level.bot_attach_weaponclasstoattachtableclass["spread"] = "sht";
    level.bot_attach_weaponclasstoattachtableclass["pistol"] = "pst";
    level.bot_attach_weaponclasstoattachtableclass["mg"] = "lmg";
    level.bot_attach_weaponclasstoattachtableclass["sniper"] = "snp";
}

bot_pick_new_loadout_item( var_0, var_1, var_2, var_3 )
{
    self.loadoutitemsalreadychosen[var_3] = var_1[var_3];
    var_4 = _id_1688( [ var_0 ], var_0, var_1, var_2 );
    self.loadoutitemsalreadychosen[var_3] = undefined;
    return var_4;
}

bot_cross_validate_attachkit_and_perk( var_0, var_1 )
{
    var_2 = [ "attachKit", "perk" ];
    var_3 = undefined;

    if ( bot_attachkit_replaces_perk1( var_0["loadoutPrimaryAttachKit"] ) && var_0["loadoutPerk1"] != "specialty_null" )
    {
        var_3 = common_scripts\utility::_id_710E( var_2 );

        if ( var_3 == "attachKit" )
        {
            var_4 = "loadoutPrimaryAttachKit";
            var_5 = "loadoutPerk1";
        }
        else
        {
            var_4 = "loadoutPerk1";
            var_5 = "loadoutPrimaryAttachKit";
        }

        var_0[var_5] = bot_pick_new_loadout_item( var_1[var_5], var_0, var_5, var_4 );
    }

    if ( bot_attachkit_replaces_perk1( var_0["loadoutSecondaryAttachKit"] ) && var_0["loadoutPerk1"] != "specialty_null" )
    {
        var_4 = "loadoutPerk1";
        var_5 = "loadoutSecondaryAttachKit";
        var_0[var_5] = bot_pick_new_loadout_item( var_1[var_5], var_0, var_5, var_4 );
    }

    return var_0;
}

bot_attachkit_replaces_perk1( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( maps\mp\_utility::_id_5092( level.bot_attachkittable_reference[var_0]["replacesPerk1"] ) )
        return 1;

    return 0;
}

bot_perk_get_explosive_list()
{
    return [ "claymore_mp", "c4_mp", "specialty_fraggrenade", "rpg_mp" ];
}

bot_perk_is_explosive( var_0 )
{
    var_1 = bot_perk_get_explosive_list();

    if ( common_scripts\utility::_id_0CE4( var_1, var_0 ) )
        return 1;

    return 0;
}

bot_loadout_choose_from_attachkittable( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level.bot_attachkittable[var_3] ) || !isdefined( level.bot_attachkittable[var_3][var_4] ) )
        return "none";

    var_5 = _id_1688( level.bot_attachkittable[var_3][var_4], var_0, var_1, var_2 );
    return var_5;
}

_id_4CBE()
{
    var_0 = "mp/camotable.csv";
    var_1 = 1;
    var_2 = 8;
    var_3 = 9;
    level._id_15C2 = [];
    var_4 = 0;

    for (;;)
    {
        var_5 = _func_1BC( var_0, var_4, var_1 );

        if ( !isdefined( var_5 ) || var_5 == "" )
            break;

        var_6 = _func_1BC( var_0, var_4, var_2 );

        if ( isdefined( var_6 ) && var_6 != "" )
        {
            var_7 = _func_1BC( var_0, var_4, var_3 );

            if ( var_7 != "" )
            {
                var_8 = _func_124( var_7, "| " );

                foreach ( var_10 in var_8 )
                {
                    if ( !isdefined( level._id_15C2[var_10] ) )
                        level._id_15C2[var_10] = [];

                    var_11 = level._id_15C2[var_10].size;
                    level._id_15C2[var_10][var_11] = var_5;
                }
            }
        }

        var_4++;
    }
}

_id_1684( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "none";

    if ( !isdefined( level._id_15C2 ) )
        return var_5;

    if ( !isdefined( level._id_15C2[var_4] ) )
        return var_5;

    var_6 = _func_0B2( 100 ) > 50;

    if ( var_6 )
        var_5 = _id_1688( level._id_15C2[var_4], var_0, var_1, var_2 );

    return var_5;
}

_id_168F( var_0, var_1, var_2 )
{
    if ( _func_1FF( self ) )
        return 1;

    if ( !isdefined( level._id_16A3[var_1] ) )
    {
        var_3 = "mp/unlockTable.csv";
        var_4 = _func_1BF( var_3, 0, var_1 );
        level._id_16A3[var_1] = _func_0BC( _func_1BC( var_3, var_4, 2 ) );
    }

    if ( var_0 == "classtable_any" && var_2 == "recruit" )
        return 1;

    if ( !isdefined( self._id_7136 ) )
    {
        self._id_7136 = self._id_0308["rank"];

        if ( !isdefined( self._id_7136 ) )
            self._id_7136 = level._id_16D3[var_2][0];
    }

    if ( level._id_16A3[var_1] <= self._id_7136 )
        return 1;

    return 0;
}

_id_1694( var_0, var_1, var_2, var_3 )
{
    var_4 = 1;

    switch ( var_2 )
    {
        case "loadoutPrimary":
            var_4 = _id_168E( "weapon", var_3, undefined );
            var_4 = var_4 && maps\mp\gametypes\_class::_id_51F3( var_3 );
            var_4 = var_4 && _id_168F( var_0, var_3, self _meth_8369() );
            break;
        case "loadoutEquipment":
            var_4 = _id_168E( "perk", var_3, "Lethal" );
            var_4 = var_4 && maps\mp\gametypes\_class::_id_51EA( var_3 );
            var_4 = var_4 && _id_168F( var_0, var_3, self _meth_8369() );
            break;
        case "loadoutOffhand":
            var_4 = bot_validate_offhand( var_3, var_2, var_1 );
            var_4 = var_4 && _id_168F( var_0, var_3, self _meth_8369() );
            break;
        case "loadoutPrimaryAttachKit":
            var_4 = bot_validate_attachkit_for_weapon( var_3, var_1["loadoutPrimary"], self _meth_8369() );
            break;
        case "loadoutPrimaryFurnitureKit":
            var_4 = 1;
            break;
        case "loadoutPrimaryReticle":
            var_4 = 1;
            break;
        case "loadoutPrimaryCamo":
            var_4 = !isdefined( self._id_173F ) || var_3 == self._id_173F;
            var_4 = var_4 && maps\mp\gametypes\_class::_id_51E7( var_3 );
            break;
        case "loadoutSecondary":
            var_4 = var_3 != var_1["loadoutPrimary"];
            var_4 = var_4 && _id_168E( "weapon", var_3, undefined );
            var_4 = var_4 && maps\mp\gametypes\_class::_id_51F5( var_3, var_1["loadoutPerk2"] == "specialty_twoprimaries" );
            var_4 = var_4 && _id_168F( var_0, var_3, self _meth_8369() );
            break;
        case "loadoutSecondaryAttachKit":
            var_4 = bot_validate_attachkit_for_weapon( var_3, var_1["loadoutSecondary"], self _meth_8369() );
            break;
        case "loadoutSecondaryFurnitureKit":
            var_4 = 1;
            break;
        case "loadoutSecondaryReticle":
            var_4 = 1;
            break;
        case "loadoutSecondaryCamo":
            var_4 = !isdefined( self._id_1740 ) || var_3 == self._id_1740;
            var_4 = var_4 && maps\mp\gametypes\_class::_id_51E7( var_3 );
            break;
        case "loadoutPerk1":
        case "loadoutPerk2":
        case "loadoutPerk3":
            var_4 = _id_1726( var_3, var_2, var_1 );
            var_4 = var_4 && _id_168F( var_0, var_3, self _meth_8369() );
            break;
        default:
            break;
    }

    return var_4;
}

_id_1688( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "none";
    var_6 = undefined;
    var_7 = 0.0;

    if ( common_scripts\utility::_id_0CE4( var_0, "specialty_null" ) )
        var_5 = "specialty_null";
    else if ( var_3 == "loadoutEquipment" || var_3 == "loadoutOffhand" || _func_120( var_3, "Perk" ) )
        var_5 = "specialty_null";

    if ( var_1 == "classtable_any" )
    {
        if ( !isdefined( self._id_2779 ) )
            self._id_2779 = common_scripts\utility::_id_710E( [ "class1", "class2", "class3", "class4", "class5", "class6" ] );

        var_0 = [ self._id_2779 ];
    }

    foreach ( var_9 in var_0 )
    {
        var_10 = undefined;

        if ( _func_122( var_9, 0, 9 ) == "template_" )
        {
            var_10 = var_9;
            var_11 = level._id_1742[var_9][var_3];
            var_9 = _id_1688( _func_124( var_11, "| " ), var_1, var_2, var_3, 1 );

            if ( isdefined( var_10 ) && isdefined( self._id_1D63[var_10] ) )
                return var_9;
        }

        if ( var_9 == "attachkittable" )
            return bot_loadout_choose_from_attachkittable( var_1, var_2, var_3, self._id_67DF, self._id_2A5F );

        if ( var_9 == "weap_statstable" )
            return _id_1689( var_1, var_2, var_3, self._id_67DF, self._id_2A5F );

        if ( var_9 == "camotable" )
            return _id_1684( var_1, var_2, var_3, self._id_67DF, self._id_2A5F );

        if ( _func_122( var_9, 0, 5 ) == "class" && _func_0BC( _func_122( var_9, 5, 6 ) ) > 0 )
            var_9 = _id_1686( var_9, var_3 );

        if ( _id_1694( var_1, var_2, var_3, var_9 ) )
        {
            var_7 += 1.0;

            if ( _func_0B3( 1.0 ) <= 1.0 / var_7 )
            {
                var_5 = var_9;
                var_6 = var_10;
            }
        }
    }

    if ( isdefined( var_6 ) )
        self._id_1D63[var_6] = 1;

    return var_5;
}

_id_168A( var_0 )
{
    self._id_1D63 = [];

    foreach ( var_6, var_2 in var_0 )
    {
        var_3 = undefined;

        if ( !isdefined( var_3 ) )
        {
            var_5 = _func_124( var_2, "| " );
            var_3 = _id_1688( var_5, var_2, var_0, var_6 );
        }

        var_0[var_6] = var_3;
    }

    return var_0;
}

_id_168D()
{
    var_0 = self _meth_8369();

    if ( var_0 == "default" )
    {
        maps\mp\bots\_bots_util::_id_16EB( "default" );
        var_0 = self _meth_8369();
    }

    return var_0;
}

bot_get_stored_custom_classes()
{
    if ( isdefined( self._id_0308["botCustomClasses"] ) )
        return self._id_0308["botCustomClasses"];

    return [];
}

bot_get_stored_launcher_class()
{
    if ( bot_get_stored_custom_classes().size > 0 )
    {
        if ( isdefined( self._id_0308["botLauncherClassIndex"] ) )
        {
            var_0 = self._id_0308["botLauncherClassIndex"];
            return self._id_0308["botCustomClasses"][var_0];
        }
    }

    return undefined;
}

bot_allowed_to_try_last_loadout()
{
    if ( maps\mp\_utility::_id_5092( self._id_16B4 ) )
        return 0;
    else if ( !isdefined( self._id_0308["botLastLoadout"] ) )
        return 0;
    else if ( maps\mp\_utility::_id_5092( self._id_7477 ) )
        return 0;
    else if ( isdefined( self._id_4726 ) && !self._id_4726 )
        return 0;

    return 1;
}

_id_168B( var_0 )
{
    while ( !isdefined( level._id_1695 ) )
        wait 0.05;

    while ( !isdefined( self._id_67DF ) )
        wait 0.05;

    var_1 = [];
    var_2 = _id_168D();
    self._id_2A5F = var_2;
    var_3 = self _meth_8364();

    if ( !isdefined( self._id_1680 ) )
        self._id_15E7 = 0;

    self._id_1680 = self._id_15E7;

    if ( isdefined( self._id_0308["botLastLoadout"] ) && maps\mp\_utility::_id_5092( var_0 ) )
        return self._id_0308["botLastLoadout"];

    var_4 = !isdefined( self._id_0308["botLastLoadoutDifficulty"] ) || self._id_0308["botLastLoadoutDifficulty"] == var_2;
    var_5 = !isdefined( self._id_0308["botLastLoadoutPersonality"] ) || self._id_0308["botLastLoadoutPersonality"] == var_3;
    var_6 = 0;

    if ( !var_4 || !var_5 )
    {
        self._id_0308["botLastLoadout"] = undefined;
        self._id_0308["botCustomClasses"] = undefined;
        self._id_0308["botLauncherClassIndex"] = undefined;
        var_6 = 1;
    }

    var_7 = !var_6 && bot_allowed_to_try_last_loadout();

    if ( var_7 )
    {
        var_8 = _func_0B3( 1.0 ) > 0.1;

        if ( var_8 )
            return self._id_0308["botLastLoadout"];
    }

    self._id_16B4 = undefined;

    if ( !var_6 )
    {
        var_9 = bot_get_stored_launcher_class();
        var_10 = undefined;

        if ( isdefined( self._id_7477 ) && isdefined( var_9 ) )
        {
            self._id_7477 = undefined;
            self._id_16B4 = 1;
            var_10 = var_9;
        }

        if ( !isdefined( var_10 ) )
        {
            var_11 = bot_get_stored_custom_classes();
            var_12 = 0;

            if ( isdefined( var_9 ) )
            {
                if ( var_11.size < 5 )
                    var_12 = 1;
            }
            else if ( isdefined( self._id_7477 ) )
                var_12 = 1;
            else if ( var_11.size < 4 )
                var_12 = 1;

            if ( !var_12 )
                var_10 = common_scripts\utility::_id_710E( var_11 );
        }

        if ( isdefined( var_10 ) )
        {
            self._id_15E7++;
            self._id_0308["botLastLoadout"] = var_10;
            return var_10;
        }
    }

    self.bot_loadout_can_pick_acog_for_sniper = _func_0B3( 1.0 ) < 0.5;

    if ( var_3 == "cqb" )
        self.bot_loadout_can_pick_silencer = _func_0B3( 1.0 ) < 0.5;
    else
        self.bot_loadout_can_pick_silencer = _func_0B3( 1.0 ) < 0.25;

    var_13 = undefined;
    var_14 = _id_15E8();

    if ( var_14 )
    {
        var_13 = _id_1690( var_3, var_2 );
        var_1 = _id_168A( var_13 );

        if ( isdefined( level._id_161B["gametype_loadout_modify"] ) )
            var_1 = self [[ level._id_161B["gametype_loadout_modify"] ]]( var_1 );

        var_1 = bot_cross_validate_attachkit_and_perk( var_1, var_13 );

        if ( bot_match_rules_invalidate_loadout( var_1 ) )
            var_14 = 0;
    }

    if ( !var_14 )
    {
        var_1 = _id_15EA();
        _id_16B5( var_1["loadoutPrimary"] );
    }

    var_1["loadoutMelee"] = "none";

    if ( var_1["loadoutPrimary"] == "none" )
    {
        self._id_1609 = undefined;
        var_1["loadoutPrimary"] = _id_1682( var_1 );
        var_1["loadoutPrimaryCamo"] = "none";
        var_1["loadoutPrimaryAttachKit"] = "none";
        var_1["loadoutPrimaryFurnitureKit"] = "none";
        var_1["loadoutPrimaryReticle"] = "none";

        if ( isdefined( self._id_1609 ) )
        {
            if ( self._id_1609 == "weapon" )
                _id_16B5( var_1["loadoutPrimary"] );
            else
                maps\mp\bots\_bots_util::_id_16ED( self._id_1609 );

            var_3 = self._id_67DF;
            self._id_1609 = undefined;
        }
    }

    var_18 = isdefined( self._id_7477 );

    if ( var_14 && maps\mp\bots\_bots::_id_1667() )
    {
        if ( isdefined( var_1["loadoutPrimaryCamo"] ) && var_1["loadoutPrimaryCamo"] != "none" && !isdefined( self._id_173F ) )
            self._id_173F = var_1["loadoutPrimaryCamo"];

        if ( isdefined( var_1["loadoutSecondaryCamo"] ) && var_1["loadoutSecondaryCamo"] != "none" && !isdefined( self._id_1740 ) )
            self._id_1740 = var_1["loadoutSecondaryCamo"];

        if ( var_18 )
        {
            var_19 = level._id_16CF[self _meth_8369()];

            if ( _id_168E( "perk", var_19, "Perk_Slot1" ) )
            {
                var_1["loadoutPerk1"] = var_19;
                var_1["loadoutPrimaryAttachKit"] = "none";
                var_1["loadoutPrimaryAttachKit"] = bot_pick_new_loadout_item( var_13["loadoutPrimaryAttachKit"], var_1, "loadoutPrimaryAttachKit", "loadoutPerk1" );
                self._id_16B4 = 1;
            }

            self._id_7477 = undefined;
        }

        if ( var_1["loadoutPerk2"] == "specialty_explosivedamage" )
        {
            if ( _func_0B3( 1.0 ) < 0.5 )
            {
                var_20 = common_scripts\utility::_id_0CF5( [ "loadoutPrimaryAttachKit", "loadoutPerk1" ] );

                for ( var_21 = 0; var_21 < var_20.size; var_21++ )
                {
                    if ( bot_perk_is_explosive( var_1["loadoutPerk1"] ) )
                        continue;

                    if ( var_1["loadoutPrimaryAttachKit"] == "gl" )
                        continue;

                    if ( var_20[var_21] == "loadoutPrimaryAttachKit" )
                    {
                        var_1["loadoutPerk1"] = "specialty_null";
                        var_22 = _id_1688( [ "gl" ], "special_attachkit_choice", var_1, "loadoutPrimaryAttachKit" );

                        if ( var_22 != "none" )
                            var_1["loadoutPrimaryAttachKit"] = var_22;
                    }
                    else if ( var_20[var_21] == "loadoutPerk1" )
                    {
                        var_1["loadoutPrimaryAttachKit"] = "none";
                        var_23 = bot_perk_get_explosive_list();

                        if ( var_3 != "camper" )
                            var_23 = common_scripts\utility::_id_0CF6( var_23, "c4_mp" );

                        var_24 = _id_1688( var_23, "special_perk_choice", var_1, "loadoutPerk1" );

                        if ( var_24 != "specialty_null" )
                            var_1["loadoutPerk1"] = var_24;
                    }

                    var_25 = var_20[var_21];
                    var_26 = var_20[( var_21 + 1 ) % 2];
                    var_1[var_26] = bot_pick_new_loadout_item( var_13[var_26], var_1, var_26, var_25 );
                }
            }
        }
    }

    self._id_15E7++;
    self._id_0308["botLastLoadout"] = var_1;
    self._id_0308["botLastLoadoutDifficulty"] = var_2;
    self._id_0308["botLastLoadoutPersonality"] = var_3;

    if ( !isdefined( self._id_0308["botCustomClasses"] ) )
        self._id_0308["botCustomClasses"] = [];

    var_27 = self._id_0308["botCustomClasses"].size;
    self._id_0308["botCustomClasses"][var_27] = var_1;

    if ( var_18 )
        self._id_0308["botLauncherClassIndex"] = var_27;

    return var_1;
}

bot_match_rules_invalidate_loadout( var_0 )
{
    if ( _func_13E() )
    {
        if ( var_0["loadoutPrimary"] == "none" )
            return 1;

        if ( var_0["loadoutSecondary"] == "none" )
            return 1;

        if ( var_0["loadoutOffhand"] == "specialty_null" )
            return 1;

        if ( var_0["loadoutPerk1"] == "specialty_null" )
        {
            if ( !bot_attachkit_replaces_perk1( var_0["loadoutPrimaryAttachKit"] ) && !bot_attachkit_replaces_perk1( var_0["loadoutSecondaryAttachKit"] ) )
                return 1;
        }

        if ( var_0["loadoutPerk2"] == "specialty_null" || var_0["loadoutPerk3"] == "specialty_null" )
            return 1;
    }

    return 0;
}

_id_16F4()
{
    var_0 = self _meth_8364();
    var_1 = _id_168D();
    var_2 = _id_1691( var_0, var_1, 0 );

    if ( isdefined( var_2 ) && isdefined( var_2._id_0253 ) && var_2._id_0253.size > 0 )
    {
        self._id_1E33 = ::_id_168B;
        return 1;
    }

    var_3 = _func_122( self._id_02A7, 0, self._id_02A7.size - 10 );
    self._id_1E33 = undefined;
    return 0;
}

bot_modify_behavior_from_loadout()
{
    foreach ( var_2, var_1 in self._id_0306 )
    {
        if ( !var_1 )
            continue;

        if ( var_2 == "specialty_fraggrenade" || var_2 == "specialty_specialgrenade" )
            self _meth_834F( "encourage_grenade_use", 1 );

        if ( var_2 == "specialty_explosivedamage" )
        {
            self.encourage_explosive_use = 1;
            self _meth_834F( "encourage_explosive_use", 1 );
        }
    }
}

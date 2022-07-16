// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"MP_CHALLENGE_COMPLETED" );

    if ( !_id_5A60() )
        return;

    level._id_5CDC = [];
    _id_72F2( "playerKilled", ::_id_1C50 );
    _id_72F2( "playerKilled", ::_id_1C57 );
    _id_72F2( "playerHardpoint", ::_id_1C4F );
    _id_72F2( "playerAssist", ::_id_1C47 );
    _id_72F2( "roundEnd", ::_id_1C52 );
    _id_72F2( "roundEnd", ::_id_1C51 );
    _id_72F2( "vehicleKilled", ::_id_1C56 );
    level thread _id_64C8();
}

_id_5A60()
{
    return level._id_7137;
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( _func_1FE( var_0 ) )
            continue;

        if ( !isdefined( var_0._id_0308["postGameChallenges"] ) )
            var_0._id_0308["postGameChallenges"] = 0;

        var_0 thread _id_64D6();
        var_0 thread _id_4DF2();
        var_0 thread _id_5E32();
        var_0 thread _id_5E5B();
        var_0 thread _id_5E7C();
        var_0 thread _id_5ECD();
        var_0 thread _id_5EBB();
        var_0 thread _id_5EB4();
        var_0 thread _id_5E76();
        var_0 thread _id_5E24();
        var_0 thread _id_5EB5();
        var_0 thread _id_5EE1();
        var_0 thread _id_5E5F();
        var_0 thread _id_5E36();
        var_0 _meth_82DA( "hold_breath", "+breath_sprint" );
        var_0 _meth_82DA( "hold_breath", "+melee_breath" );
        var_0 _meth_82DA( "release_breath", "-breath_sprint" );
        var_0 _meth_82DA( "release_breath", "-melee_breath" );
        var_0 thread _id_5E70();
        var_0 _meth_82DA( "jumped", "+goStand" );
        var_0 thread _id_5E7F();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_64D2();
        thread _id_5EC9();
    }
}

_id_64D2()
{
    self endon( "disconnect" );
    self waittill( "death" );

    if ( isdefined( self._id_4743 ) )
        self._id_4743 = 0;
}

_id_5EBB()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "scavenger_pickup" );

        if ( self _meth_8225( "specialty_scavenger" ) && maps\mp\_utility::_id_05CB( "specialty_scavenger" ) && !maps\mp\_utility::_id_5131() )
            self._id_4743 = 1;

        wait 0.05;
    }
}

_id_4DF2()
{
    var_0 = _func_1D3( level._id_539B );

    foreach ( var_2 in var_0 )
        self._id_0308[var_2] = 0;

    self._id_0308["lastBulletKillTime"] = 0;
    self._id_0308["bulletStreak"] = 0;
    self._id_357E = [];
}

_id_72F2( var_0, var_1 )
{
    if ( !isdefined( level._id_5CDC[var_0] ) )
        level._id_5CDC[var_0] = [];

    level._id_5CDC[var_0][level._id_5CDC[var_0].size] = var_1;
}

_id_3F2C( var_0 )
{
    if ( isdefined( self._id_1C61[var_0] ) )
        return self._id_1C61[var_0];
    else
        return 0;
}

_id_1C47( var_0 )
{
    var_1 = var_0._id_0318;
    var_1 _id_6FF6( "ch_assists" );
}

_id_1C55( var_0 )
{

}

_id_1C4F( var_0 )
{
    if ( _func_1FE( var_0._id_0318 ) )
        return;

    var_1 = var_0._id_0318;
    var_1._id_0308[var_0._id_46CF]++;

    switch ( var_0._id_46CF )
    {
        case "radar_mp":
            var_1 _id_6FF6( "ch_uav" );
            var_1 _id_6FF6( "ch_exposed" );

            if ( var_1._id_0308[var_0._id_46CF] >= 3 )
                var_1 _id_6FF6( "ch_nosecrets" );

            if ( maps\mp\_utility::_id_4015() == "mp_farm_spring" )
                var_1 _id_6FF6( "ch_stpatty_uav" );

            if ( maps\mp\_utility::_id_4015() == "mp_bog_summer" )
                var_1 _id_6FF6( "ch_summer_uav" );

            break;
        case "airstrike_mp":
            var_1 _id_6FF6( "ch_airstrike" );

            if ( var_1._id_0308[var_0._id_46CF] >= 2 )
                var_1 _id_6FF6( "ch_afterburner" );

            break;
        case "helicopter_mp":
            var_1 _id_6FF6( "ch_chopper" );

            if ( var_1._id_0308[var_0._id_46CF] >= 2 )
            {
                var_1 _id_6FF6( "ch_airsuperiority" );

                if ( maps\mp\_utility::_id_4015() == "mp_bog_summer" )
                    var_1 _id_6FF6( "ch_summer_ranger" );
            }

            break;
    }
}

_id_1C57( var_0 )
{
    if ( !isdefined( var_0.attacker ) || !_func_1AD( var_0.attacker ) )
        return;

    if ( !maps\mp\_utility::_id_513D( var_0._id_9024 ) )
        return;

    var_1 = var_0.attacker;

    if ( isdefined( var_0._id_3020 ) && isdefined( level._id_1D48 ) && var_0._id_3020 == level._id_1D48 )
        var_1 _id_6FF6( "ch_choppervet" );

    if ( !isdefined( var_1._id_0308[var_0._id_9024 + "_streak"] ) || isdefined( var_1._id_0308[var_0._id_9024 + "_streakTime"] ) && gettime() - var_1._id_0308[var_0._id_9024 + "_streakTime"] > 7000 )
    {
        var_1._id_0308[var_0._id_9024 + "_streak"] = 0;
        var_1._id_0308[var_0._id_9024 + "_streakTime"] = gettime();
    }

    var_1._id_0308[var_0._id_9024 + "_streak"]++;

    switch ( var_0._id_9024 )
    {
        case "artillery_mp":
            var_1 _id_6FF6( "ch_airstrikevet" );

            if ( var_1._id_0308[var_0._id_9024 + "_streak"] == 5 )
                var_1 _id_6FF6( "ch_carpetbomb" );

            break;
        default:
            break;
    }
}

_id_1C56( var_0 )
{
    if ( !isdefined( var_0.attacker ) || !_func_1AD( var_0.attacker ) )
        return;

    var_1 = var_0.attacker;
    var_2 = maps\mp\_utility::_id_3F11( var_0._id_9024 );

    if ( maps\mp\_utility::_id_514D( var_2 ) )
        var_2 = maps\mp\gametypes\_class::_id_3F10( var_2 );

    var_3 = _id_3CE8( var_0._id_9024, var_2 );

    if ( var_3 == "weapon_launcher" )
        var_1 _id_6FF6( "ch_launcher_kill" );
}

_id_1EF0( var_0 )
{
    self endon( "disconnect" );
    self notify( "clearing_expID_" + var_0 );
    self endon( "clearing_expID_" + var_0 );
    wait 3.0;
    self._id_357F[var_0] = undefined;
}

_id_5BD1()
{
    var_0 = self;

    if ( !isdefined( var_0._id_0308["MGStreak"] ) )
    {
        var_0._id_0308["MGStreak"] = 0;
        var_0 thread _id_31B5();

        if ( !isdefined( var_0._id_0308["MGStreak"] ) )
            return;
    }

    var_0._id_0308["MGStreak"]++;

    if ( var_0._id_0308["MGStreak"] >= 5 )
        var_0 _id_6FF6( "ch_mgmaster" );
}

_id_31B5()
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( !_func_1A1( self ) || self _meth_8339() )
        {
            self._id_0308["MGStreak"] = undefined;
            break;
        }

        wait 0.05;
    }
}

_id_31B4()
{
    self._id_0308["MGStreak"] = undefined;
}

_id_535D( var_0 )
{
    if ( !isdefined( self._id_0308["countermvp_streak"] ) || !var_0 )
        self._id_0308["countermvp_streak"] = 0;

    self._id_0308["countermvp_streak"]++;

    if ( self._id_0308["countermvp_streak"] >= 10 )
    {
        self._id_0308["countermvp_streak"] = 0;
        _id_6FF6( "ch_countermvp" );
    }
}

_id_511A( var_0 )
{
    if ( !isdefined( var_0._id_038D ) || var_0._id_038D < 1 )
        return 0;

    var_1 = level._id_0323;

    if ( level._id_91EB )
        var_2 = var_0._id_0308["team"];
    else
        var_2 = "all";

    var_3 = var_0._id_038D;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( !isdefined( var_1[var_4]._id_038D ) )
            continue;

        if ( var_1[var_4]._id_038D < 1 )
            continue;

        if ( var_2 != "all" && var_1[var_4]._id_0308["team"] != var_2 )
            continue;

        if ( var_1[var_4]._id_038D > var_3 )
            return 0;
    }

    return 1;
}

_id_1C50( var_0 )
{
    var_0._id_9E07 _id_6C89();

    if ( !isdefined( var_0.attacker ) || !_func_1AD( var_0.attacker ) )
        return;
    else
        var_1 = var_0.attacker;

    if ( _func_1FE( var_1 ) )
        return;

    var_2 = 0;
    var_3 = 0;
    var_4 = 1;
    var_5[var_0._id_9E07._id_02A7] = var_0._id_9E07._id_02A7;
    var_6[var_0._id_9024] = var_0._id_9024;
    var_7 = 1;
    var_8 = [];
    var_9 = var_0._id_867C;
    var_10 = var_0._id_04B7;
    var_11 = 0;

    if ( isdefined( var_1._id_680B[var_0._id_9024] ) && !maps\mp\_utility::_id_5150( var_9 ) )
        var_11++;

    var_12 = maps\mp\_utility::_id_513D( var_0._id_9024 );
    var_13 = maps\mp\_utility::_id_50FE( var_0._id_9024 );
    var_14 = 0;

    if ( var_9 == "MOD_HEAD_SHOT" )
        var_14 = 1;

    var_15 = 0;
    var_16 = 0;

    if ( isdefined( var_0._id_029E["longshot"] ) )
    {
        var_15 = 1;
        var_16++;
    }

    var_17 = var_0.was_ads;
    var_18 = 0;

    if ( var_1._id_7260 == 2 )
        var_18 = 1;

    var_19 = 0;

    if ( var_1._id_7260 == 3 )
        var_19 = 1;

    var_20 = "";

    if ( isdefined( var_0._id_0E35 ) )
        var_20 = var_0._id_0E35;

    var_21 = 0;
    var_22 = 0;
    var_23 = 0;
    var_24 = 0;
    var_25 = 0;
    var_26 = 0;

    switch ( var_1._id_5380.size + 1 )
    {
        case 5:
            var_21 = 1;
            break;
        case 10:
            var_22 = 1;
            break;
        case 15:
            var_23 = 1;
            break;
        case 20:
            var_24 = 1;
            break;
        case 25:
            var_25 = 1;
            break;
        case 30:
            var_26 = 1;
            break;
        default:
            break;
    }

    foreach ( var_28 in var_1._id_5380 )
    {
        if ( maps\mp\_utility::_id_50D2( var_28._id_9024 ) && !maps\mp\_utility::_id_5150( var_28._id_867C ) )
            var_3++;

        if ( isdefined( var_28._id_029E["longshot"] ) )
            var_16++;

        if ( !isdefined( var_1.farsightchallengecounter ) )
            var_1.farsightchallengecounter = 0;

        if ( !isdefined( var_1.humiliationfinderscounter ) )
            var_1.humiliationfinderscounter = [];

        if ( var_16 == var_1.farsightchallengecounter * 3 + 3 && var_15 )
        {
            var_1.farsightchallengecounter++;
            var_1 _id_6FF6( "ch_precision_farsight" );

            if ( maps\mp\_utility::_id_4015() == "mp_bog_summer" )
                var_1 _id_6FF6( "ch_summer_precision_farsight" );
        }

        if ( var_10 - var_28._id_04B7 < 10000 )
            var_4++;

        if ( isdefined( var_1._id_680B[var_28._id_9024] ) && !maps\mp\_utility::_id_5150( var_28._id_867C ) )
        {
            if ( !isdefined( var_1.humiliationfinderscounter[var_28._id_9024] ) )
                var_1.humiliationfinderscounter[var_28._id_9024] = 0;

            var_11++;

            if ( var_11 == var_1.humiliationfinderscounter[var_28._id_9024] * 5 + 5 )
            {
                var_1.humiliationfinderscounter[var_28._id_9024]++;
                var_1 _id_6FF6( "ch_humiliation_finders" );
            }
        }

        if ( maps\mp\_utility::_id_513D( var_28._id_9024 ) )
        {
            if ( !isdefined( var_8[var_28._id_9024] ) )
                var_8[var_28._id_9024] = 0;

            var_8[var_28._id_9024]++;
            continue;
        }

        if ( isdefined( level._id_648B[var_1._id_04A7] ) && var_28._id_04B7 > level._id_648B[var_1._id_04A7] )
            var_2++;

        if ( isdefined( var_28._id_9E07 ) )
        {
            if ( !isdefined( var_5[var_28._id_9E07._id_02A7] ) && !isdefined( var_6[var_28._id_9024] ) && !maps\mp\_utility::_id_513D( var_28._id_9024 ) )
                var_7++;

            var_5[var_28._id_9E07._id_02A7] = var_28._id_9E07._id_02A7;
        }

        var_6[var_28._id_9024] = var_28._id_9024;
    }

    var_30 = maps\mp\_utility::_id_3F11( var_0._id_9024 );

    if ( maps\mp\_utility::_id_514D( var_30 ) )
        var_30 = maps\mp\gametypes\_class::_id_3F10( var_30 );

    var_31 = var_30;

    if ( common_scripts\utility::_id_8F57( var_30, "iw5_" ) )
        var_31 = _func_122( var_30, 4 );
    else if ( common_scripts\utility::_id_8F57( var_30, "h1_" ) )
        var_31 = _func_122( var_30, 3 );

    var_32 = _id_3CE8( var_0._id_9024, var_30 );

    if ( level._id_91EB )
    {
        if ( level._id_91ED[var_0._id_9E07._id_0308["team"]] > 3 && var_1._id_0308["killed_players"].size >= level._id_91ED[var_0._id_9E07._id_0308["team"]] && !maps\mp\_utility::_id_5092( var_1.tangodowncomplete ) )
        {
            var_1.tangodowncomplete = 1;
            var_1 _id_6FF6( "ch_tangodown" );
        }

        if ( level._id_91ED[var_0._id_9E07._id_0308["team"]] > 3 && var_1._id_5363.size >= level._id_91ED[var_0._id_9E07._id_0308["team"]] )
        {
            var_1._id_5363 = [];
            var_1 _id_6FF6( "ch_extremecruelty" );
        }
    }

    if ( isdefined( var_1._id_373E ) )
        var_1 _id_6FF6( "ch_theedge" );

    if ( var_1._id_0308["cur_kill_streak"] == 10 )
    {
        var_1 _id_6FF6( "ch_fearless" );

        if ( maps\mp\_utility::_id_4015() == "mp_bog_summer" )
            var_1 _id_6FF6( "ch_summer_fearless" );
    }

    if ( var_0._id_9E07._id_038D > 0 )
    {
        if ( level._id_91EB )
        {
            var_33 = var_0._id_9E07._id_0308["team"];

            if ( isdefined( var_33 ) && var_33 != var_1._id_0308["team"] )
            {
                if ( _id_511A( var_0._id_9E07 ) && level._id_0323.size >= 6 )
                    var_1 _id_535D( 1 );
                else
                    var_1 _id_535D( 0 );
            }
        }
        else if ( _id_511A( var_0._id_9E07 ) && level._id_0323.size >= 4 )
            var_1 _id_535D( 1 );
        else
            var_1 _id_535D( 0 );
    }

    var_34 = maps\mp\_utility::_id_4015();

    if ( var_34 == "mp_crash_snow" )
        var_1 _id_6FF6( "ch_wc_kills" );
    else if ( var_34 == "mp_farm_spring" )
        var_1 _id_6FF6( "ch_stpatty_kills" );
    else if ( var_34 == "mp_bog_summer" )
        var_1 _id_6FF6( "ch_summer_kills" );

    if ( isdefined( var_1._id_680B[var_0._id_9024] ) )
    {
        if ( !maps\mp\_utility::_id_5150( var_9 ) )
            var_1 _id_6FF6( "ch_kills_stolen" );
    }

    if ( var_20 == "crouch" )
        var_1 _id_6FF6( "ch_kills_crouch" );

    if ( var_20 == "prone" )
        var_1 _id_6FF6( "ch_kills_prone" );

    if ( ( var_9 == "MOD_PISTOL_BULLET" || var_9 == "MOD_RIFLE_BULLET" || var_9 == "MOD_HEAD_SHOT" ) && var_13 )
        var_1 _id_5BD1();

    if ( ( var_9 == "MOD_PISTOL_BULLET" || var_9 == "MOD_RIFLE_BULLET" || var_9 == "MOD_HEAD_SHOT" || var_30 == "iw5_m990" ) && !var_13 && !var_12 )
    {
        _id_1C48( var_0, var_1, var_10, var_32 );

        switch ( var_32 )
        {
            case "weapon_smg":
                if ( var_14 )
                    var_1 _id_6FF6( "ch_expert_smg" );

                break;
            case "weapon_assault":
                if ( var_14 )
                    var_1 _id_6FF6( "ch_expert_assault" );

                break;
            case "weapon_shotgun":
                break;
            case "weapon_sniper":
                break;
            case "weapon_pistol":
                if ( var_14 )
                    var_1 _id_6FF6( "ch_expert_pistol" );

                break;
            case "weapon_lmg":
            case "weapon_heavy":
                if ( var_14 )
                    var_1 _id_6FF6( "ch_expert_lmg" );

                break;
            default:
        }

        if ( var_9 == "MOD_HEAD_SHOT" )
        {
            if ( var_32 == "weapon_pistol" )
                var_1 notify( "increment_pistol_headshots" );
            else if ( var_32 == "weapon_assault" )
                var_1 notify( "increment_ar_headshots" );
        }

        if ( isdefined( level._id_1C62["ch_marksman_" + var_30] ) && var_1 _id_3F2C( "ch_marksman_" + var_30 ) > 0 )
            var_1 _id_6FF6( "ch_marksman_" + var_30 );

        if ( var_14 )
        {
            if ( isdefined( level._id_1C62["ch_expert_" + var_30] ) && var_1 _id_3F2C( "ch_expert_" + var_30 ) > 0 )
                var_1 _id_6FF6( "ch_expert_" + var_30 );
        }
    }

    if ( maps\mp\_utility::_id_5150( var_9 ) && !var_13 && !var_12 )
    {
        if ( !_func_120( var_30, "riotshield" ) )
        {
            var_1 _id_6FF6( "ch_knifevet" );
            var_1._id_0308["meleeKillStreak"]++;

            if ( var_34 == "mp_crash_snow" )
                var_1 _id_6FF6( "ch_wc_melee" );
            else if ( var_34 == "mp_farm_spring" )
                var_1 _id_6FF6( "ch_stpatty_melee" );
            else if ( var_34 == "mp_bog_summer" )
                var_1 _id_6FF6( "ch_summer_melee" );

            if ( var_1._id_0308["meleeKillStreak"] == 3 )
            {
                var_1 _id_6FF6( "ch_slasher" );

                if ( var_34 == "mp_bog_summer" )
                    var_1 _id_6FF6( "ch_summer_slasher" );
            }

            var_35 = var_0._id_9E07._id_0BA0[1];
            var_36 = var_1._id_0BA1[1];
            var_37 = _func_0EB( var_35 - var_36 );

            if ( _func_0BE( var_37 ) < 30 )
                var_1 _id_6FF6( "ch_backstabber" );

            if ( !var_0._id_0E32 )
                var_1 _id_6FF6( "ch_jump_slasher" );

            if ( var_0._id_0E35 == "prone" )
                var_1 _id_6FF6( "ch_pronemelee" );

            if ( !var_0._id_0E32 )
                var_1 _id_6FF6( "ch_jumpmelee" );
        }

        if ( _func_120( var_30, "combatknife" ) )
            var_1 notify( "increment_knife_kill" );
    }

    if ( _func_120( var_9, "MOD_IMPACT" ) && !var_13 && !var_12 )
    {
        if ( maps\mp\_utility::_id_51BA( var_0._id_9024, "h1_frag" ) )
            var_1 _id_6FF6( "ch_thinkfast" );
        else if ( maps\mp\_utility::_id_51BA( var_0._id_9024, "h1_concussion" ) )
            var_1 _id_6FF6( "ch_thinkfastconcussion" );
        else if ( maps\mp\_utility::_id_51BA( var_0._id_9024, "h1_flash" ) )
            var_1 _id_6FF6( "ch_thinkfastflash" );

        var_38 = _func_061( var_0._id_9024 );
        var_30 = maps\mp\_utility::_id_3F11( var_0._id_9024 );

        foreach ( var_40 in var_38 )
        {
            if ( maps\mp\_utility::_id_51BA( var_40, "glmwr" ) )
                var_1 _id_6FF6( "ch_ouch" );
        }
    }

    if ( _func_120( var_9, "MOD_GRENADE" ) || _func_120( var_9, "MOD_PROJECTILE" ) || _func_120( var_9, "MOD_EXPLOSIVE" ) && !var_13 && !var_12 )
    {
        if ( isdefined( var_0._id_9E07._id_357E["damageTime"] ) && var_0._id_9E07._id_357E["damageTime"] == var_10 )
        {
            if ( var_0._id_9024 == "none" )
                var_0._id_9024 = var_0._id_9E07._id_357E["weapon"];

            var_42 = var_10 + "_" + var_0._id_9E07._id_357E["damageId"];

            if ( !isdefined( var_1._id_357F[var_42] ) )
                var_1._id_357F[var_42] = 0;

            var_1 thread _id_1EF0( var_42 );
            var_1._id_357F[var_42]++;

            if ( var_31 == "fraggrenadeshort" )
            {
                if ( var_1._id_357F[var_42] == 3 )
                    var_1 _id_6FF6( "ch_martyrdom" );

                var_1 _id_6FF6( "ch_martyrdomvet" );
            }
            else if ( var_31 == "fraggrenade" )
            {
                if ( var_1._id_357F[var_42] == 2 )
                    var_1 _id_6FF6( "ch_multifrag" );

                var_1 _id_6FF6( "ch_grenadekill" );

                if ( var_34 == "mp_crash_snow" )
                    var_1 _id_6FF6( "ch_wc_grenade" );
                else if ( var_34 == "mp_farm_spring" )
                    var_1 _id_6FF6( "ch_stpatty_grenade" );
                else if ( var_34 == "mp_bog_summer" )
                    var_1 _id_6FF6( "ch_summer_grenade" );

                if ( var_0._id_9E07._id_357E["cookedKill"] )
                    var_1 _id_6FF6( "ch_masterchef" );

                if ( var_0._id_9E07._id_357E["suicideGrenadeKill"] )
                    var_1 _id_6FF6( "ch_miserylovescompany" );

                if ( var_0._id_9E07._id_357E["throwbackKill"] )
                    var_1 _id_6FF6( "ch_hotpotato" );
            }
            else if ( var_31 == "c4" )
            {
                if ( var_1._id_357F[var_42] == 2 )
                    var_1 _id_6FF6( "ch_multic4" );

                if ( var_0._id_9E07._id_357E["returnToSender"] )
                    var_1 _id_6FF6( "ch_returntosender" );

                if ( var_0._id_9E07._id_357E["counterKill"] )
                    var_1 _id_6FF6( "ch_counterc4" );

                if ( var_0._id_9E07._id_357E["bulletPenetrationKill"] )
                    var_1 _id_6FF6( "ch_howthe" );

                if ( var_0._id_9E07._id_357E["chainKill"] )
                    var_1 _id_6FF6( "ch_dominos" );
            }
            else if ( var_31 == "claymore" )
            {
                var_1 _id_6FF6( "ch_claymoreshot" );

                if ( var_1._id_357F[var_42] == 2 )
                    var_1 _id_6FF6( "ch_multiclaymore" );

                if ( var_0._id_9E07._id_357E["returnToSender"] )
                    var_1 _id_6FF6( "ch_returntosender" );

                if ( var_0._id_9E07._id_357E["counterKill"] )
                    var_1 _id_6FF6( "ch_counterclaymore" );

                if ( var_0._id_9E07._id_357E["bulletPenetrationKill"] )
                    var_1 _id_6FF6( "ch_howthe" );

                if ( var_0._id_9E07._id_357E["chainKill"] )
                    var_1 _id_6FF6( "ch_dominos" );
            }
            else if ( var_0._id_9024 == "destructible_car" )
                var_1 _id_6FF6( "ch_carbomb" );
            else if ( var_31 == "rpg" )
            {
                if ( var_1._id_357F[var_42] == 2 )
                    var_1 _id_6FF6( "ch_multirpg" );
            }
        }

        if ( isdefined( var_0._id_3020.classname ) && var_0._id_3020.classname == "scriptable" )
            var_1 _id_6FF6( "ch_kills_vandalism" );
    }

    var_43 = "";
    var_38 = _func_061( var_0._id_9024 );

    foreach ( var_40 in var_38 )
    {
        var_45 = _func_122( var_40, 0, 5 );

        switch ( var_45 )
        {
            case "glmwr":
                if ( var_9 == "MOD_GRENADE_SPLASH" || var_9 == "MOD_IMPACT" || var_9 == "MOD_GRENADE" )
                {
                    var_1 _id_6FF6( "ch_attach_glkills" );
                    continue;
                }
        }
    }

    var_38 = _func_061( var_0._id_9024 );

    if ( var_38.size == 0 )
    {
        if ( !_func_120( var_9, "MOD_MELEE" ) )
        {
            switch ( var_32 )
            {
                case "weapon_smg":
                case "weapon_assault":
                case "weapon_sniper":
                case "weapon_shotgun":
                case "weapon_heavy":
                case "weapon_pistol":
                    var_1 _id_6FF6( "ch_barebone_" + var_30 );
                    break;
            }
        }
    }
    else if ( var_38.size > 0 )
    {
        if ( !_func_120( var_9, "MOD_MELEE" ) )
        {
            foreach ( var_48 in var_38 )
            {
                if ( _func_120( var_48, "reflexmwr" ) )
                {
                    var_1 _id_6FF6( "ch_reddot_" + var_30 );
                    continue;
                }

                if ( _func_120( var_48, "silencermwr" ) )
                {
                    var_1 _id_6FF6( "ch_silencer_" + var_30 );
                    continue;
                }

                if ( _func_120( var_48, "acogmwr" ) )
                    var_1 _id_6FF6( "ch_acog_" + var_30 );
            }
        }
    }

    if ( level._id_01B3 == "gun" )
        var_1 _id_6FF6( "ch_ggkills" );

    if ( isdefined( var_0._id_9E07._id_5174 ) && var_0._id_9E07._id_5174 )
        var_1 _id_6FF6( "ch_bombplanter" );

    if ( isdefined( var_0._id_9E07._id_50EF ) && var_0._id_9E07._id_50EF )
        var_1 _id_6FF6( "ch_bombdefender" );

    if ( isdefined( var_0._id_9E07._id_50C8 ) && var_0._id_9E07._id_50C8 )
        var_1 _id_6FF6( "ch_bombdown" );

    if ( isdefined( var_1._id_4E3C ) && var_1._id_4E3C )
        var_1 _id_6FF6( "ch_laststandvet" );

    if ( isdefined( var_1._id_0308["killed_players"][var_0._id_9E07._id_4450] ) && var_1._id_0308["killed_players"][var_0._id_9E07._id_4450] == 5 )
        var_1 _id_6FF6( "ch_rival" );

    if ( isdefined( var_1._id_93E8[var_0._id_9024] ) )
    {
        if ( var_1._id_93E8[var_0._id_9024] == var_0._id_9E07 && !maps\mp\_utility::_id_5150( var_0._id_867C ) )
            var_1 _id_6FF6( "ch_cruelty" );
    }

    if ( var_1 _id_50BC() )
    {
        var_1._id_1818++;

        if ( var_1._id_1818 >= 3 )
            var_1 _id_6FF6( "ch_thebrink" );
    }

    if ( isdefined( var_1.patient_zero ) )
    {
        var_1.patient_zero++;

        if ( var_1.patient_zero == 3 )
            var_1 _id_6FF6( "ch_infect_patientzero" );
    }
}

_id_3CE8( var_0, var_1 )
{
    var_2 = maps\mp\_utility::_id_4167( var_0 );

    if ( !isdefined( var_1 ) )
    {
        var_1 = maps\mp\_utility::_id_3F11( var_0 );

        if ( maps\mp\_utility::_id_514D( var_1 ) )
            var_1 = maps\mp\gametypes\_class::_id_3F10( var_1 );
    }

    if ( var_1 == "h1_rpg" )
        return "weapon_launcher";

    return var_2;
}

_id_1C48( var_0, var_1, var_2, var_3 )
{
    if ( !maps\mp\_utility::_id_50FE( var_0._id_9024 ) )
        var_1 _id_31B4();

    if ( maps\mp\_utility::_id_513D( var_0._id_9024 ) )
        return;

    if ( _func_1FE( var_1 ) )
        return;

    if ( var_1._id_0308["lastBulletKillTime"] == var_2 )
        var_1._id_0308["bulletStreak"]++;
    else
        var_1._id_0308["bulletStreak"] = 1;

    var_1._id_0308["lastBulletKillTime"] = var_2;

    if ( !var_0._id_9E08 )
        var_1 _id_6FF6( "ch_hardlanding" );

    if ( !var_0._id_0E32 )
        var_1._id_0308["midairStreak"]++;

    if ( var_1._id_0308["midairStreak"] == 2 )
        var_1 _id_6FF6( "ch_airborne" );

    if ( var_2 < var_0._id_9E07._id_38B1 )
        var_1 _id_6FF6( "ch_flashbangvet" );

    if ( var_2 < var_1._id_38B1 )
        var_1 _id_6FF6( "ch_blindfire" );

    if ( var_2 < var_0._id_9E07._id_20DF )
        var_1 _id_6FF6( "ch_concussionvet" );

    if ( var_2 < var_1._id_20DF )
        var_1 _id_6FF6( "ch_slowbutsure" );

    if ( var_1._id_0308["bulletStreak"] == 2 )
    {
        if ( isdefined( var_0._id_029E["headshot"] ) )
        {
            foreach ( var_5 in var_1._id_5380 )
            {
                if ( var_5._id_04B7 != var_2 )
                    continue;

                if ( !isdefined( var_0._id_029E["headshot"] ) )
                    continue;

                var_1 _id_6FF6( "ch_allpro" );
            }
        }

        if ( var_3 == "weapon_sniper" )
        {
            var_1 _id_6FF6( "ch_collateraldamage" );

            if ( maps\mp\_utility::_id_4015() == "mp_bog_summer" )
                var_1 _id_6FF6( "ch_summer_collateraldamage" );
        }
    }

    if ( var_3 == "weapon_pistol" )
    {
        if ( isdefined( var_0._id_9E07._id_0E2C ) && isdefined( var_0._id_9E07._id_0E2C[var_1._id_4450] ) )
        {
            if ( isdefined( var_0._id_9E07._id_0E2C[var_1._id_4450]._id_5184 ) )
                var_1 _id_6FF6( "ch_fastswap" );
        }
    }

    if ( !isdefined( var_1._id_4C5A ) || !var_1._id_4C5A )
    {
        var_7 = maps\mp\_utility::_id_3F11( var_0._id_9024 );

        if ( var_0._id_0E35 == "crouch" )
        {
            var_1 _id_6FF6( "ch_crouchshot" );
            var_1 _id_6FF6( "ch_crouch_" + var_7 );
        }
        else if ( var_0._id_0E35 == "prone" )
        {
            var_1 _id_6FF6( "ch_proneshot" );
            var_1 _id_6FF6( "ch_prone_" + var_7 );

            if ( var_3 == "weapon_sniper" )
                var_1 _id_6FF6( "ch_invisible" );
        }
    }

    if ( _func_120( var_0._id_9024, "silencer" ) )
        var_1 _id_6FF6( "ch_stealth" );
}

_id_1C51( var_0 )
{
    var_1 = var_0._id_0318;

    if ( var_1._id_A1BE )
    {
        var_2 = var_1._id_0308["deaths"];
        var_3 = var_1._id_0308["kills"];
        var_4 = 1000000;

        if ( var_2 > 0 )
            var_4 = var_3 / var_2;

        if ( var_4 >= 5.0 && var_3 >= 5.0 )
            var_1 _id_6FF6( "ch_starplayer" );

        if ( var_2 == 0 && maps\mp\_utility::_id_412C() > 300000 )
            var_1 _id_6FF6( "ch_flawless" );

        if ( level._id_6861["all"].size < 3 )
            return;

        if ( var_1._id_038D > 0 )
        {
            switch ( level._id_01B3 )
            {
                case "dm":
                    if ( var_0._id_685B < 3 )
                    {
                        var_1 _id_6FF6( "ch_victor_dm" );
                        var_1 _id_6FF6( "ch_ffa_win" );
                    }

                    var_1 _id_6FF6( "ch_ffa_participate" );
                    break;
                default:
                    break;
            }
        }
    }
}

_id_1C52( var_0 )
{
    if ( !var_0._id_A342 )
        return;

    var_1 = var_0._id_0318;

    if ( var_1._id_A1BE )
    {
        switch ( level._id_01B3 )
        {
            case "war":
                if ( level._id_0323.size >= 6 && var_1._id_0239 > 0 )
                {
                    if ( level._id_46CA )
                    {
                        var_1 _id_6FF6( "ch_teamplayer_hc" );

                        if ( var_0._id_685B == 0 )
                            var_1 _id_6FF6( "ch_mvp_thc" );
                    }
                    else
                    {
                        var_1 _id_6FF6( "ch_teamplayer" );

                        if ( var_0._id_685B == 0 )
                            var_1 _id_6FF6( "ch_mvp_tdm" );
                    }
                }

                break;
            case "sab":
                var_1 _id_6FF6( "ch_victor_sab" );
                break;
            case "sd":
                var_1 _id_6FF6( "ch_victor_sd" );
                break;
            case "hp":
            case "dm":
            case "ctf":
            case "dom":
            case "koth":
            case "hc":
                break;
            default:
                break;
        }
    }
}

_id_6C82( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "disconnect" );

    if ( isdefined( var_1 ) )
        var_1 endon( "disconnect" );

    wait 0.05;
    maps\mp\_utility::_id_A0F4();
    var_6 = spawnstruct();
    var_6._id_9E07 = self;
    var_6._id_3020 = var_0;
    var_6.attacker = var_1;
    var_6._id_4B54 = var_2;
    var_6._id_867C = var_3;
    var_6._id_9024 = var_4;
    var_6._id_83CE = var_5;
    var_6._id_9E08 = var_6._id_9E07 _meth_833E();

    if ( _func_1AD( var_1 ) )
    {
        var_6._id_0E2E = isdefined( var_6.attacker._id_0249 );
        var_6._id_0E32 = var_6.attacker _meth_833E();
        var_6._id_0E35 = var_6.attacker _meth_8180();
    }
    else
    {
        var_6._id_0E2E = 0;
        var_6._id_0E32 = 0;
        var_6._id_0E35 = "stand";
    }

    _id_2CFB( "playerDamaged", var_6 );
}

_id_6CD7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self._id_0BA0 = self _meth_8338();

    if ( isdefined( var_1 ) )
        var_1._id_0BA1 = var_1 _meth_8338();

    self endon( "disconnect" );
    var_9 = spawnstruct();
    var_9._id_9E07 = self;
    var_9._id_3020 = var_0;
    var_9.attacker = var_1;
    var_9._id_4B54 = var_2;
    var_9._id_867C = var_3;
    var_9._id_9024 = var_4;
    var_9._id_8AA5 = var_5;
    var_9._id_83CE = var_6;
    var_9._id_04B7 = gettime();
    var_9._id_029E = var_7;
    var_9.duetodisconnect = var_8;
    var_9._id_9E08 = var_9._id_9E07 _meth_833E();

    if ( _func_1AD( var_1 ) )
    {
        var_9._id_0E2E = isdefined( var_9.attacker._id_0249 );
        var_9._id_0E32 = var_9.attacker _meth_833E();
        var_9._id_0E35 = var_9.attacker _meth_8180();
    }
    else
    {
        var_9._id_0E2E = 0;
        var_9._id_0E32 = 0;
        var_9._id_0E35 = "stand";
    }

    var_10 = 0;

    if ( isdefined( var_9._id_3020 ) && isdefined( var_9._id_3020.firedads ) )
        var_10 = var_9._id_3020.firedads;
    else if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
        var_10 = var_1 _meth_833D();

    var_9.was_ads = 0;

    if ( var_10 >= 0.2 )
        var_9.was_ads = 1;

    _id_A007( var_9 );

    if ( isdefined( var_1 ) && maps\mp\_utility::_id_5189( var_1 ) )
        var_1._id_5380[var_1._id_5380.size] = var_9;

    var_9.attacker notify( "playerKilledChallengesProcessed" );
}

_id_9D78( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawnstruct();
    var_7._id_9C7E = var_1;
    var_7._id_9E07 = var_0;
    var_7._id_3020 = var_2;
    var_7.attacker = var_3;
    var_7._id_4B54 = var_4;
    var_7._id_867C = var_5;
    var_7._id_9024 = var_6;
    var_7._id_04B7 = gettime();
    _id_2CFB( "vehicleKilled", var_7 );
}

_id_A007( var_0 )
{
    if ( isdefined( var_0.attacker ) )
        var_0.attacker endon( "disconnect" );

    self._id_6FFB = 1;

    if ( !isdefined( var_0.duetodisconnect ) || !var_0.duetodisconnect )
    {
        wait 0.05;
        maps\mp\_utility::_id_A0F4();
    }

    _id_2CFB( "playerKilled", var_0 );
    self._id_6FFB = undefined;
}

_id_6C67()
{
    var_0 = spawnstruct();
    var_0._id_0318 = self;
    _id_2CFB( "playerAssist", var_0 );
}

_id_9C01( var_0 )
{
    self endon( "disconnect" );
    wait 0.05;
    maps\mp\_utility::_id_A0F4();
    var_1 = spawnstruct();
    var_1._id_0318 = self;
    var_1._id_46CF = var_0;
    _id_2CFB( "playerHardpoint", var_1 );
}

_id_7650()
{
    _id_2CFB( "roundBegin" );
}

_id_7652( var_0 )
{
    var_1 = spawnstruct();

    if ( level._id_91EB )
    {
        var_2 = "allies";

        for ( var_3 = 0; var_3 < level._id_6861[var_2].size; var_3++ )
        {
            var_1._id_0318 = level._id_6861[var_2][var_3];
            var_1._id_A342 = var_2 == var_0;
            var_1._id_685B = var_3;
            _id_2CFB( "roundEnd", var_1 );
        }

        var_2 = "axis";

        for ( var_3 = 0; var_3 < level._id_6861[var_2].size; var_3++ )
        {
            var_1._id_0318 = level._id_6861[var_2][var_3];
            var_1._id_A342 = var_2 == var_0;
            var_1._id_685B = var_3;
            _id_2CFB( "roundEnd", var_1 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level._id_6861["all"].size; var_3++ )
        {
            var_1._id_0318 = level._id_6861["all"][var_3];
            var_1._id_A342 = isdefined( var_0 ) && _func_1AD( var_0 ) && var_1._id_0318 == var_0;
            var_1._id_685B = var_3;
            _id_2CFB( "roundEnd", var_1 );
        }
    }
}

_id_2CFB( var_0, var_1 )
{
    if ( !_id_5A60() )
        return;

    if ( getdvarint( "disable_challenges" ) > 0 )
        return;

    if ( !isdefined( level._id_5CDC[var_0] ) )
        return;

    if ( isdefined( var_1 ) )
    {
        for ( var_2 = 0; var_2 < level._id_5CDC[var_0].size; var_2++ )
            thread [[ level._id_5CDC[var_0][var_2] ]]( var_1 );
    }
    else
    {
        for ( var_2 = 0; var_2 < level._id_5CDC[var_0].size; var_2++ )
            thread [[ level._id_5CDC[var_0][var_2] ]]();
    }
}

_id_5EC9()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( !isdefined( self._id_0308["totalGameSprintDist"] ) )
        self._id_0308["totalGameSprintDist"] = 0;

    for (;;)
    {
        self waittill( "sprint_begin" );
        self._id_8AAB = 0;
        _id_5EC2();
        _id_6FF6( "ch_marathon", _func_0BC( self._id_8AAB ) );

        if ( maps\mp\_utility::_id_4015() == "mp_crash_snow" )
            _id_6FF6( "ch_wc_sprint", _func_0BC( self._id_8AAB ) );

        self._id_0308["totalGameSprintDist"] += self._id_8AAB;

        if ( maps\mp\_utility::_id_05CB( "specialty_longersprint" ) )
        {
            if ( _func_0BC( self._id_0308["totalGameSprintDist"] ) >= 15840 )
            {
                _id_6FF6( "ch_extremeconditioning" );
                self._id_0308["totalGameSprintDist"] = 0;
            }
        }
    }
}

_id_5EC2()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "sprint_end" );
    var_0 = self._id_02E2;

    for (;;)
    {
        wait 0.1;
        self._id_8AAB += _func_0EE( self._id_02E2, var_0 );
        var_0 = self._id_02E2;
    }
}

_id_5E5B()
{
    self endon( "disconnect" );
    self._id_0308["midairStreak"] = 0;

    for (;;)
    {
        if ( !_func_1A1( self ) )
        {
            self waittill( "spawned_player" );
            continue;
        }

        if ( !self _meth_833E() )
        {
            self._id_0308["midairStreak"] = 0;
            var_0 = self._id_02E2[2];

            while ( !self _meth_833E() )
            {
                if ( self._id_02E2[2] > var_0 )
                    var_0 = self._id_02E2[2];

                wait 0.05;
            }

            self._id_0308["midairStreak"] = 0;
            var_1 = var_0 - self._id_02E2[2];

            if ( var_1 < 0 )
                var_1 = 0;

            if ( var_1 / 12.0 > 15 && _func_1A1( self ) )
                _id_6FF6( "ch_basejump" );

            if ( var_1 / 12.0 > 30 && !_func_1A1( self ) )
                _id_6FF6( "ch_goodbye" );
        }

        wait 0.05;
    }
}

_id_7386( var_0 )
{
    level endon( "game_ended" );
    self waittill( "disconnect" );

    if ( isdefined( game[var_0][self._id_4450] ) )
        game[var_0][self._id_4450] = undefined;
}

_id_55BC()
{
    if ( !_id_5A60() )
        return;

    if ( !self._id_A1BE )
        return;

    if ( self._id_91F3 > 0 )
        return;

    _id_6FF6( "ch_lastmanstanding" );
}

_id_5E32()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A070( "bomb_planted", "bomb_defused" );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 == "bomb_defused" )
            _id_6FF6( "ch_hero" );
    }
}

_id_5E7C()
{
    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_8FF7();
    }
}

_id_8FF7()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 300;

    if ( isdefined( self ) )
        _id_6FF6( "ch_survivalist" );
}

_id_5ECD()
{
    self endon( "disconnect" );
    self._id_0308["airstrikeStreak"] = 0;
    self._id_0308["meleeKillStreak"] = 0;
    self._id_0308["shieldKillStreak"] = 0;
    thread _id_5E85();

    for (;;)
    {
        self waittill( "death" );
        self._id_0308["airstrikeStreak"] = 0;
        self._id_0308["meleeKillStreak"] = 0;
        self._id_0308["shieldKillStreak"] = 0;
    }
}

_id_5E85()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_A071( "destroyed_explosive", "begin_airstrike", "destroyed_helicopter", "destroyed_car", "crushed_enemy" );
        _id_5E86( var_0 );
    }
}

_id_5E86( var_0 )
{
    switch ( var_0 )
    {
        case "begin_airstrike":
            self._id_0308["airstrikeStreak"] = 0;
            break;
        case "destroyed_explosive":
            _id_6FF6( "ch_backdraft" );
            break;
        case "destroyed_helicopter":
            _id_6FF6( "ch_flyswatter" );
            break;
        case "destroyed_car":
            _id_6FF6( "ch_vandalism" );
            break;
        default:
            break;
    }
}

_id_478F()
{
    if ( !_func_1A1( self ) )
        return;

    if ( !_id_5A60() )
        return;

    if ( !maps\mp\_utility::_id_7139() )
        return;

    thread _id_7446();

    if ( isdefined( self._id_5591 ) && self._id_5591 )
    {
        self._id_4791++;

        if ( self._id_4791 >= 5 )
        {
            self._id_4791 = 0;
            _id_6FF6( "ch_invincible" );
        }
    }
}

_id_7446()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "damage" );
    wait 1;
    self._id_1818 = 0;
}

_id_6D5C()
{
    self._id_1818 = 0;
    self._id_4791 = 0;
}

_id_6C89()
{
    self._id_1818 = 0;
    self._id_4791 = 0;
}

_id_50BC()
{
    var_0 = self._id_01E6 / self._id_0271;
    return var_0 <= level._id_478D;
}

_id_6FF6( var_0, var_1, var_2 )
{
    if ( !_id_5A60() )
        return;

    if ( level._id_0323.size < 2 && !getdvarint( "force_ranking" ) )
    {
        var_3 = undefined;

        if ( isdefined( var_3 ) )
        {
            if ( var_3 == 0 )
                return;
        }
        else
            return;
    }

    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_4 = _id_3F2C( var_0 );

    if ( var_4 == 0 )
        return;

    if ( var_4 > level._id_1C62[var_0]["targetval"].size )
        return;

    var_5 = maps\mp\gametypes\_hud_util::_id_1C4C( var_0 );

    if ( isdefined( var_2 ) && var_2 )
        var_6 = var_1;
    else if ( maps\mp\gametypes\_hud_util::_id_5206( var_0 ) )
        var_6 = var_5;
    else
        var_6 = var_5 + var_1;

    var_7 = 0;

    for ( var_8 = level._id_1C62[var_0]["targetval"][var_4]; isdefined( var_8 ) && var_6 >= var_8; var_8 = level._id_1C62[var_0]["targetval"][var_4 + var_7] )
        var_7++;

    if ( var_5 < var_6 )
        maps\mp\gametypes\_hud_util::_id_1C53( var_0, var_6 );

    if ( var_7 > 0 )
    {
        var_9 = var_4;

        while ( var_7 )
        {
            thread _id_4200( var_0, var_4 );
            var_10 = _func_2CF( var_0, var_4 );
            self _meth_843F( var_10 );
            var_11 = common_scripts\utility::_id_93F2( var_10 );
            var_12 = _func_0BC( _func_122( var_11, 0, var_11.size - 2 ) );

            if ( !isdefined( game["challengeStruct"]["challengesCompleted"][self._id_4450] ) )
                game["challengeStruct"]["challengesCompleted"][self._id_4450] = [];

            var_13 = 0;

            foreach ( var_15 in game["challengeStruct"]["challengesCompleted"][self._id_4450] )
            {
                if ( var_15 == var_12 )
                    var_13 = 1;
            }

            if ( !var_13 )
                game["challengeStruct"]["challengesCompleted"][self._id_4450][game["challengeStruct"]["challengesCompleted"][self._id_4450].size] = var_12;

            if ( var_4 >= level._id_1C62[var_0]["targetval"].size && level._id_1C62[var_0]["parent_challenge"] != "" )
                _id_6FF6( level._id_1C62[var_0]["parent_challenge"] );

            var_4++;
            var_7--;
            maps\mp\_matchdata::_id_5822( var_10 );
        }

        if ( !_func_120( var_0, "ch_limited_bloodshed" ) )
            thread maps\mp\gametypes\_hud_message::_id_1C64( var_0, var_9, var_4 );

        maps\mp\gametypes\_hud_util::_id_1C54( var_0, var_4 );
        self._id_1C61[var_0] = var_4;
    }
}

_id_4200( var_0, var_1 )
{
    self endon( "disconnect" );
    wait 0.25;
    maps\mp\gametypes\_rank::_id_41FF( "challenge", level._id_1C62[var_0]["reward"][var_1], undefined, undefined, var_0 );
}

_id_4016( var_0, var_1 )
{
    return _func_1BB( "mp/unlockTable.csv", 0, var_0, 4 + var_1 );
}

getlastchallengetier( var_0 )
{
    var_1 = 0;

    if ( isdefined( level._id_1C62[var_0] ) && isdefined( level._id_1C62[var_0]["targetval"].size ) )
        var_1 = level._id_1C62[var_0]["targetval"].size;

    return var_1;
}

getchallengetiernumber( var_0 )
{
    var_1 = _func_122( var_0, var_0.size - 2, var_0.size );

    if ( _func_122( var_1, 0, 1 ) == "_" )
        var_2 = _func_0BC( _func_122( var_1, 1, 2 ) );
    else
        var_2 = 0;

    return var_2;
}

ischallengeresetafterprestige( var_0, var_1 )
{
    var_2 = _func_1BC( "mp/allChallengesTable.csv", var_0, 45 );

    if ( !isdefined( var_1 ) )
        var_1 = _func_1BC( "mp/allChallengesTable.csv", var_0, 6 );

    if ( var_2 != "" && _func_0BC( var_2 ) && _func_0BC( var_1 ) != 4 )
        return 1;

    return 0;
}

_id_50DD( var_0, var_1 )
{
    var_2 = _func_1BC( "mp/allChallengesTable.csv", var_1, 9 );

    if ( var_2 != "" )
    {
        var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "challengeState", var_2 );

        if ( var_3 > 1 )
            return 1;
    }

    var_4 = _func_1BC( "mp/allChallengesTable.csv", var_1, 6 );

    if ( var_4 != "" )
    {
        var_5 = maps\mp\gametypes\_rank::_id_40A9();
        var_6 = maps\mp\gametypes\_rank::_id_409B();

        if ( var_5 < _func_0BC( var_4 ) )
        {
            if ( var_6 < 1 )
                return 0;

            if ( _func_0BC( var_4 ) > 54 )
                return 0;

            if ( ischallengeresetafterprestige( var_1, var_4 ) )
                return 0;
        }
    }

    var_7 = _func_1BC( "mp/allChallengesTable.csv", var_1, 47 );

    if ( var_7 != "" )
    {
        var_6 = maps\mp\gametypes\_rank::_id_409B();

        if ( var_6 < _func_0BC( var_7 ) )
            return 0;
    }

    var_8 = _func_1BC( "mp/allChallengesTable.csv", var_1, 8 );

    if ( var_8 != "" )
    {
        var_9 = self _meth_8225( var_8 );

        if ( !var_9 )
            return 0;
    }

    var_10 = _func_1BC( "mp/allChallengesTable.csv", var_1, 7 );

    if ( var_10 != "" )
    {
        var_11 = getchallengetiernumber( var_10 );

        if ( var_11 == 0 )
            var_11 = getlastchallengetier( var_10 );

        if ( var_11 > 0 )
        {
            var_12 = _id_3F2C( var_10 );

            if ( var_12 <= var_11 )
                return 0;
        }
    }

    return 1;
}

_id_9AFE()
{
    self._id_1C61 = [];

    if ( !isdefined( self.ch_unique_earned_streaks ) )
        self.ch_unique_earned_streaks = [];

    if ( !isdefined( game["challengeStruct"] ) )
        game["challengeStruct"] = [];

    if ( !isdefined( game["challengeStruct"]["limitedChallengesReset"] ) )
        game["challengeStruct"]["limitedChallengesReset"] = [];

    if ( !isdefined( game["challengeStruct"]["challengesCompleted"] ) )
        game["challengeStruct"]["challengesCompleted"] = [];

    self endon( "disconnect" );

    if ( !_id_5A60() )
        return;

    if ( !self _meth_8225( "feature_challenges" ) )
        return;

    var_0 = 0;

    foreach ( var_5, var_2 in level._id_1C62 )
    {
        var_0++;

        if ( var_0 % 40 == 0 )
            wait 0.05;

        self._id_1C61[var_5] = 0;
        var_3 = var_2["index"];

        if ( !_id_50DD( var_5, var_3 ) )
            continue;

        var_4 = maps\mp\gametypes\_hud_util::_id_1C4D( var_5 );

        if ( maps\mp\gametypes\_hud_util::_id_51D6( var_5 ) && !isdefined( game["challengeStruct"]["limitedChallengesReset"][self._id_4450] ) )
        {
            maps\mp\gametypes\_hud_util::_id_1C53( var_5, 0 );
            var_4 = 0;
        }

        if ( var_4 == 0 )
        {
            maps\mp\gametypes\_hud_util::_id_1C54( var_5, 1 );
            var_4 = 1;
        }

        self._id_1C61[var_5] = var_4;
    }

    game["challengeStruct"]["limitedChallengesReset"][self._id_4450] = 1;
}

_id_512F( var_0 )
{
    return _func_1BB( "mp/unlockTable.csv", 0, var_0, 0 ) != "";
}

_id_3F2B( var_0 )
{
    return _func_1BB( "mp/allChallengesTable.csv", 0, var_0, 5 );
}

_id_3F2D( var_0 )
{
    return _func_1BB( "mp/challengeTable.csv", 8, var_0, 4 );
}

_id_4127( var_0, var_1 )
{
    return _func_1BB( var_0, 0, var_1, 1 );
}

_id_5205( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_3F2B( var_0 );

    if ( isdefined( var_1 ) && var_1 == "riotshield" )
        return 1;

    var_2 = maps\mp\_utility::_id_416C( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( var_4 == "iw5" || var_4 == "iw6" || var_4 == "h1" )
            var_4 = var_2[var_3] + "_" + var_2[var_3 + 1];

        if ( maps\mp\gametypes\_class::_id_51F3( var_4 ) || maps\mp\gametypes\_class::_id_51F5( var_4 ) )
            return 1;
    }

    return 0;
}

_id_4169( var_0 )
{
    var_1 = "ch_";

    if ( _func_120( var_0, "ch_marksman_" ) )
        var_1 = "ch_marksman_";
    else if ( _func_120( var_0, "ch_expert_" ) )
        var_1 = "ch_expert_";
    else if ( _func_120( var_0, "pr_marksman_" ) )
        var_1 = "pr_marksman_";
    else if ( _func_120( var_0, "pr_expert_" ) )
        var_1 = "pr_expert_";

    var_2 = _func_122( var_0, var_1.size, var_0.size );
    var_3 = maps\mp\_utility::_id_416C( var_2 );
    var_2 = undefined;

    if ( var_3[0] == "iw5" || var_3[0] == "iw6" || var_3[0] == "h1" )
        var_2 = var_3[0] + "_" + var_3[1];
    else
        var_2 = var_3[0];

    return var_2;
}

_id_4161( var_0 )
{
    var_1 = "ch_";

    if ( _func_120( var_0, "ch_marksman_" ) )
        var_1 = "ch_marksman_";
    else if ( _func_120( var_0, "ch_expert_" ) )
        var_1 = "ch_expert_";
    else if ( _func_120( var_0, "pr_marksman_" ) )
        var_1 = "pr_marksman_";
    else if ( _func_120( var_0, "pr_expert_" ) )
        var_1 = "pr_expert_";

    var_2 = _func_122( var_0, var_1.size, var_0.size );
    var_3 = maps\mp\_utility::_id_416C( var_2 );
    var_4 = undefined;

    if ( isdefined( var_3[2] ) && maps\mp\_utility::_id_50BD( var_3[2] ) )
        var_4 = var_3[2];

    return var_4;
}

_id_513A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_3F2B( var_0 );

    if ( isdefined( var_1 ) && ( var_1 == "killstreaks_assault" || var_1 == "killstreaks_support" ) )
        return 1;

    return 0;
}

_id_3FEB( var_0 )
{
    var_1 = "ch_";
    var_2 = _func_122( var_0, var_1.size, var_0.size );

    if ( var_2 == "assault_streaks" || var_2 == "support_streaks" )
        var_2 = undefined;

    return var_2;
}

_id_1C60( var_0, var_1, var_2 )
{
    var_3 = _func_1BB( var_0, 0, var_1, 10 + ( var_2 - 1 ) * 2 );
    return _func_0BC( var_3 );
}

_id_1C5F( var_0, var_1, var_2 )
{
    var_3 = _func_1BB( var_0, 0, var_1, 11 + ( var_2 - 1 ) * 2 );
    return _func_0BC( var_3 );
}

_id_1C5C( var_0, var_1 )
{
    var_2 = _func_1BB( var_0, 0, var_1, 43 );

    if ( !isdefined( var_2 ) )
        var_2 = "";

    return var_2;
}

_id_1879( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        var_3++;
        var_4 = _func_1BC( var_0, var_3, 0 );

        if ( var_4 == "" )
            break;

        var_5 = _func_1BC( var_0, var_3, 44 );

        if ( var_5 == "1" )
            continue;

        level._id_1C62[var_4] = [];
        level._id_1C62[var_4]["index"] = var_3;
        level._id_1C62[var_4]["type"] = var_1;
        level._id_1C62[var_4]["targetval"] = [];
        level._id_1C62[var_4]["reward"] = [];
        level._id_1C62[var_4]["parent_challenge"] = "";

        if ( _id_5205( var_4 ) )
        {
            var_6 = _id_4169( var_4 );
            var_7 = _id_4161( var_4 );

            if ( isdefined( var_6 ) )
                level._id_1C62[var_4]["weapon"] = var_6;

            if ( isdefined( var_7 ) )
                level._id_1C62[var_4]["attachment"] = var_7;
        }
        else if ( _id_513A( var_4 ) )
        {
            var_8 = _id_3FEB( var_4 );

            if ( isdefined( var_8 ) )
                level._id_1C62[var_4]["killstreak"] = var_8;
        }

        for ( var_9 = 1; var_9 < 11; var_9++ )
        {
            var_10 = _id_1C60( var_0, var_4, var_9 );
            var_11 = _id_1C5F( var_0, var_4, var_9 );

            if ( var_10 == 0 )
                break;

            level._id_1C62[var_4]["targetval"][var_9] = var_10;
            level._id_1C62[var_4]["reward"][var_9] = var_11;
            var_2 += var_11;
        }

        level._id_1C62[var_4]["parent_challenge"] = _id_1C5C( var_0, var_4 );
    }

    return _func_0BC( var_2 );
}

_id_1878()
{
    level._id_1C62 = [];

    if ( getdvar( "virtualLobbyActive" ) == "1" )
        return;

    var_0 = 0;
    var_0 += _id_1879( "mp/allChallengesTable.csv", 0 );
}

_id_5EB4()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        if ( !_id_5A60() )
            return;

        self waittill( "process", var_0 );
        _id_6FF6( var_0 );
    }
}

_id_5E76()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        self waittill( "got_killstreak", var_0 );

        if ( !isdefined( var_0 ) )
            continue;
    }
}

_id_3CAA( var_0, var_1 )
{
    switch ( var_0 )
    {
        default:
            break;
    }
}

_id_6CBE()
{
    var_0 = self _meth_8309();

    foreach ( var_2 in var_0 )
    {
        if ( self _meth_82F5( var_2 ) )
            return 1;

        var_3 = _func_1E7( var_2 );

        if ( !isdefined( var_3 ) || var_3 == "none" )
            continue;

        if ( self _meth_82F5( var_3 ) )
            return 1;
    }

    return 0;
}

_id_5E24()
{
    self endon( "disconnect" );
    self._id_087B = 0.0;

    for (;;)
    {
        if ( self _meth_833D() == 1 )
            self._id_087B += 0.05;
        else
            self._id_087B = 0.0;

        wait 0.05;
    }
}

_id_5EB5()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_702A = undefined;
    var_0 = 0;

    for (;;)
    {
        var_1 = self _meth_8180();

        if ( var_1 == "prone" && var_0 == 0 )
        {
            self._id_702A = gettime();
            var_0 = 1;
        }
        else if ( var_1 != "prone" )
        {
            self._id_702A = undefined;
            var_0 = 0;
        }

        wait 0.05;
    }
}

_id_5E70()
{
    self endon( "disconnect" );
    self._id_493E = 0;

    for (;;)
    {
        self waittill( "hold_breath" );
        self._id_493E = 1;
        self waittill( "release_breath" );
        self._id_493E = 0;
    }
}

_id_5E7F()
{
    self endon( "disconnect" );
    self._id_5970 = 0;

    for (;;)
    {
        self waittill( "jumped" );
        var_0 = self _meth_830E();
        common_scripts\utility::_id_A0A0( "weapon_change", 1 );
        var_1 = self _meth_830E();

        if ( var_1 == "none" )
            self._id_5970 = 1;
        else
            self._id_5970 = 0;

        if ( self._id_5970 )
        {
            common_scripts\utility::_id_A0A0( "weapon_change", 1 );
            var_1 = self _meth_830E();

            if ( var_1 == var_0 )
                self._id_5970 = 0;
        }
    }
}

_id_5EE1()
{
    self endon( "disconnect" );
    var_0 = self _meth_830E();

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( var_1 == "none" )
            continue;

        if ( var_1 == var_0 )
            continue;

        if ( maps\mp\_utility::_id_513D( var_1 ) )
            continue;

        if ( maps\mp\_utility::_id_50C9( var_1 ) )
            continue;

        var_2 = _func_1E4( var_1 );

        if ( var_2 != "primary" )
            continue;

        self._id_55CD = gettime();
    }
}

_id_5E5F()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "flashbang", var_0, var_1, var_2, var_3 );

        if ( isdefined( var_3 ) && self == var_3 )
            continue;

        self._id_55A1 = gettime();
    }
}

_id_5E36()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "concussed", var_0 );

        if ( self == var_0 )
            continue;

        self._id_558B = gettime();
    }
}

_id_5048( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "h1_fraggrenade_mp":
            return 1;
        default:
            return 0;
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    var_0 = getdvar( "g_gametype" );
    var_1 = 0;
    var_2 = [];
    var_2["dm"] = 4;
    var_2["war"] = 5;
    var_2["sd"] = 6;
    var_2["dom"] = 7;
    var_2["conf"] = 8;
    var_2["sr"] = 9;
    var_2["infect"] = 10;
    var_2["gun"] = 11;
    var_2["ctf"] = 12;
    var_2["horde"] = 13;
    var_2["twar"] = 14;
    var_2["hp"] = 15;
    var_2["ball"] = 16;
    var_2["dd"] = 17;
    var_2["koth"] = 18;
    var_2["sab"] = 19;
    var_2["mugger"] = 20;

    for (;;)
    {
        if ( !isdefined( var_2[var_0] ) )
            var_0 = "war";

        var_3 = _func_1BC( "mp/xp_event_table.csv", var_1, 0 );
        var_4 = _func_1BC( "mp/xp_event_table.csv", var_1, 1 );
        var_5 = _func_1BC( "mp/xp_event_table.csv", var_1, 2 );
        var_6 = _func_1BC( "mp/xp_event_table.csv", var_1, var_2[var_0] );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        if ( var_3 == "win" || var_3 == "loss" || var_3 == "tie" )
            var_6 = _func_0BD( var_6 );
        else
            var_6 = _func_0BC( var_6 );

        if ( var_6 != -1 )
        {
            var_5 = _func_0BC( var_5 );
            var_4 = _func_0BC( var_4 );
            maps\mp\gametypes\_rank::_id_72FF( var_3, var_6, var_5, var_4 );
        }

        var_1++;
    }

    level._id_62A5 = 0;
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_5363 = [];
        var_0._id_259A = [];
        var_0._id_55B1 = undefined;
        var_0._id_7260 = 0;
        var_0._id_55B6 = 0;
        var_0._id_18B1 = 0;
        var_0._id_558D = 0;
    }
}

addnemesisscoreforplayer( var_0, var_1 )
{
    if ( !isdefined( self._id_0308["nemesis_tracking"][var_0] ) )
        self._id_0308["nemesis_tracking"][var_0] = 0.0;

    self._id_0308["nemesis_tracking"][var_0] += var_1;

    if ( self._id_0308["nemesis_guid"] == "" || self._id_0308["nemesis_tracking"][var_0] > self._id_0308["nemesis_tracking"][self._id_0308["nemesis_guid"]] )
        self._id_0308["nemesis_guid"] = var_0;
}

_id_5360( var_0, var_1, var_2, var_3, var_4 )
{
    level._id_62A5++;
    var_5 = var_1._id_4450;
    var_6 = var_1._id_0308["cur_kill_streak"];
    var_7 = self._id_4450;
    var_8 = gettime();

    if ( maps\mp\_utility::_id_50CD( var_3 ) )
    {
        if ( self._id_55B6 == var_8 )
            self._id_18B1++;
        else
            self._id_18B1 = 1;
    }
    else
        self._id_18B1 = 0;

    self._id_55B6 = gettime();
    self._id_55B2 = var_1;
    self._id_029E = [];
    self._id_259A[var_5] = undefined;
    thread _id_9B55( var_0, var_2 );

    if ( !maps\mp\_utility::_id_513D( var_2 ) )
    {
        if ( var_2 == "none" )
            return 0;

        if ( isdefined( var_1._id_933E ) )
        {
            if ( var_1._id_933E == "h1_fraggrenade_mp" )
                self._id_029E["cooking"] = 1;
        }

        if ( _func_1E4( var_2 ) == "primary" )
        {
            self._id_7C58["killDistanceTotal"] += _func_0EF( self._id_02E2, var_1._id_02E2 );
            self._id_7C58["killDistanceCount"]++;
        }

        if ( var_3 == "MOD_HEAD_SHOT" )
            _id_477E( var_0, var_2, var_3 );

        if ( level._id_62A5 == 1 )
            _id_3816( var_0, var_2, var_3 );

        if ( level._id_91EB && var_8 - var_1._id_55B6 < 3000 && var_1._id_55B2 != self )
            _id_117C( var_0, var_2, var_3 );

        if ( !_func_1A1( self ) && self != var_1 && isdefined( self._id_2671 ) && self._id_2671 + 1200 < gettime() )
            _id_6E87( var_0 );

        if ( self._id_0308["cur_death_streak"] > 3 )
            _id_20B8( var_0, var_2, var_3 );

        if ( isdefined( self._id_0D77 ) && self._id_0D77 )
            _id_0D78( var_0, var_2, var_3 );

        if ( _id_514B( self, var_2, var_3, var_1 ) )
            _id_5850( var_0, var_2, var_3 );

        if ( _id_518F( var_1, var_8 ) )
            _id_27AA( var_0, var_2, var_3 );

        if ( var_6 > 0 && _id_50D0( var_1 ) )
            _id_1967( var_0, var_1, var_2, var_3 );

        if ( _id_5166( var_1, var_2, var_3 ) )
            _id_64A1( var_0, var_2, var_3 );

        if ( isdefined( self._id_55B1 ) && self._id_55B1 == var_1 )
            _id_74EA( var_0 );

        if ( var_1._id_4B56 & level._id_4B5C )
            _id_18AD( var_0, var_2 );

        if ( _id_5180( var_1, var_3 ) )
            _id_6E24( var_0, var_2, var_3 );

        if ( self._id_01E6 < 20 && self._id_01E6 > 0 )
            _id_606F( var_2, var_3 );

        if ( common_scripts\utility::_id_5108() )
            _id_38B0( var_2, var_3 );

        if ( _id_51D2( var_2, var_3 ) )
            _id_9310();

        if ( self._id_18B1 == 2 )
            _id_5FE6();

        if ( _id_50C5( var_1, var_2, var_3 ) )
            _id_125C();

        if ( _id_51D5( var_1, var_2, var_3 ) )
            _id_9339();

        if ( isdefined( self._id_680B[var_2] ) && self._id_680B[var_2] == var_1 && !maps\mp\_utility::_id_5150( var_3 ) )
            _id_911F();

        if ( maps\mp\_utility::_id_50CD( var_3 ) && !isdefined( self._id_0D77 ) )
        {
            if ( maps\mp\_utility::_id_05CB( "specialty_bulletdamage" ) )
                stoppingpowerevent();

            if ( maps\mp\_utility::_id_05CB( "specialty_fastreload" ) )
                sleightofhandevent( var_2 );

            if ( maps\mp\_utility::_id_05CB( "specialty_rof" ) && maps\mp\_utility::_id_5092( var_1._id_0249 ) )
                doubletapevent();

            if ( maps\mp\_utility::_id_05CB( "specialty_twoprimaries" ) && var_2 == self._id_03B3 )
                overkillevent();

            if ( maps\mp\_utility::_id_05CB( "specialty_bulletaccuracy" ) && self _meth_833D() < 0.5 )
                steadyaimevent();

            if ( maps\mp\_utility::_id_05CB( "specialty_pistoldeath" ) && maps\mp\_utility::_id_5092( self._id_0249 ) && maps\mp\_utility::_id_5092( var_1._id_0249 ) )
                laststandevent();

            if ( maps\mp\_utility::_id_05CB( "specialty_holdbreath" ) && _func_1B8( var_2 ) == "sniper" )
                ironlungsevent();

            if ( maps\mp\_utility::_id_05CB( "specialty_parabolic" ) )
                eavesdropevent();
        }

        if ( maps\mp\_utility::_id_05CB( "specialty_radarimmune" ) && var_1 maps\mp\gametypes\_hardpoints::playerhasuavactive() )
            uavjammerevent();

        if ( maps\mp\_utility::_id_05CB( "specialty_explosivedamage" ) && _func_188( var_3 ) )
            sonicboomevent();

        _id_1D0C( var_1 );
        _id_1D28( var_1, var_2, var_3 );
    }

    _id_1D1B( var_1 );

    if ( !isdefined( self._id_0308["killed_players"][var_5] ) )
        self._id_0308["killed_players"][var_5] = 0;

    if ( !isdefined( self._id_5363[var_5] ) )
        self._id_5363[var_5] = 0;

    if ( !isdefined( var_1._id_0308["killed_by"][var_7] ) )
        var_1._id_0308["killed_by"][var_7] = 0;

    self._id_0308["killed_players"][var_5]++;
    self._id_5363[var_5]++;
    addnemesisscoreforplayer( var_5, 1.0 );
    var_1._id_0308["killed_by"][var_7]++;
    var_1._id_55B1 = self;
    var_1 addnemesisscoreforplayer( var_7, 1.5 );

    if ( self._id_0308["prey_guid"] == "" || self._id_0308["killed_players"][var_5] > self._id_0308["killed_players"][self._id_0308["prey_guid"]] )
        self._id_0308["prey_guid"] = var_5;
}

_id_5180( var_0, var_1 )
{
    if ( maps\mp\_utility::_id_50CD( var_1 ) )
    {
        var_2 = self._id_02E2;
        var_3 = 9216;

        if ( isdefined( var_0._id_0E33 ) )
            var_2 = var_0._id_0E33;

        if ( _func_0F0( var_2, var_0._id_02E2 ) < var_3 )
            return 1;
    }

    return 0;
}

_id_6E24( var_0, var_1, var_2 )
{
    maps\mp\_utility::_id_4C2F( "pointblank", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "pointblank", self, var_1, undefined, var_2 );

    if ( maps\mp\_utility::_id_05CB( "specialty_quieter" ) )
        maps\mp\gametypes\_misions::_id_6FF6( "ch_deadsilence" );
}

_id_5361( var_0, var_1, var_2 )
{
    maps\mp\_utility::_id_4C2F( "kills", 1 );
    maps\mp\_utility::_id_4C2E( "kills", 1 );
    self._id_0239 = maps\mp\_utility::_id_4081( "kills" );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "kills", self._id_0239 );
    maps\mp\_utility::_id_9B47( "kdRatio", "kills", "deaths" );
    var_3 = "kill";

    switch ( var_1 )
    {
        case "artillery_mp":
            var_3 = "airstrike_mp_kill";
            break;
        case "cobra_ffar_mp":
        case "hind_ffar_mp":
        case "cobra_20mm_mp":
            var_3 = "helicopter_mp_kill";
            break;
    }

    if ( var_3 != "kill" )
    {
        maps\mp\_utility::_id_4C2F( var_3, 1 );
        maps\mp\gametypes\_misions::_id_1C55( var_3 );
    }

    level thread maps\mp\gametypes\_rank::_id_1208( var_3, self, var_1, var_0, var_2 );
}

_id_51D2( var_0, var_1 )
{
    if ( maps\mp\_utility::_id_5092( self._id_0D77 ) )
        return 0;

    if ( var_1 == "MOD_IMPACT" || var_1 == "MOD_HEAD_SHOT" )
    {
        if ( _id_51D3( var_0 ) )
            return 1;
    }

    return 0;
}

_id_51D3( var_0 )
{
    switch ( var_0 )
    {
        case "h1_fraggrenade_mp":
        case "h1_smokegrenade_mp":
        case "h1_concussiongrenade_mp":
        case "h1_flashgrenade_mp":
            return 1;
        default:
            return 0;
    }
}

_id_9310()
{
    maps\mp\_utility::_id_4C2F( "think_fast", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "think_fast", self );
}

_id_300B( var_0, var_1, var_2, var_3 )
{
    maps\mp\_utility::_id_4C2F( var_0 + "_earned", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( var_0 + "_earned", self );
    thread maps\mp\gametypes\_hud_message::_id_53A9( var_0, var_1, undefined, var_2, var_3 );
}

_id_18AD( var_0, var_1 )
{
    maps\mp\_utility::_id_4C2F( "bulletpenkills", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "bulletpen", self );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_xrayvision" );

    if ( maps\mp\_utility::_id_05CB( "specialty_bulletpenetration" ) )
        maps\mp\gametypes\_misions::_id_6FF6( "ch_deepimpact" );
}

_id_5FE6()
{
    maps\mp\_utility::_id_4C2F( "multiKillOneBullet", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "multiKillOneBullet", self );
}

_id_1D28( var_0, var_1, var_2 )
{

}

_id_606F( var_0, var_1 )
{
    maps\mp\_utility::_id_4C2F( "near_death_kill", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "near_death_kill", self, var_0, undefined, var_1 );

    if ( maps\mp\_utility::_id_05CB( "specialty_armorvest" ) )
        maps\mp\gametypes\_misions::_id_6FF6( "ch_juggernaut" );
}

_id_38B0( var_0, var_1 )
{
    maps\mp\_utility::_id_4C2F( "flash_kill", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "flash_kill", self, var_0, undefined, var_1 );
}

_id_5166( var_0, var_1, var_2 )
{
    if ( var_0._id_0E34.size != 1 )
        return 0;

    if ( !isdefined( var_0._id_0E34[self._id_4450] ) )
        return 0;

    if ( maps\mp\_utility::_id_5150( var_2 ) )
        return 0;

    if ( gettime() != var_0._id_0E2C[self._id_4450]._id_3822 )
        return 0;

    var_3 = maps\mp\_utility::_id_4167( var_1 );

    if ( var_3 == "weapon_sniper" || var_3 == "weapon_shotgun" )
        return 1;

    return 0;
}

_id_514B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3._id_08A2 ) )
        return 0;

    var_4 = self._id_02E2;

    if ( isdefined( var_3._id_0E33 ) )
        var_4 = var_3._id_0E33;

    if ( _func_1A1( var_0 ) && !var_0 maps\mp\_utility::_id_51E3() && ( var_2 == "MOD_RIFLE_BULLET" || var_2 == "MOD_PISTOL_BULLET" || var_2 == "MOD_HEAD_SHOT" || _func_120( var_1, "exocrossbow" ) || _func_120( var_1, "m990" ) ) && !maps\mp\_utility::_id_513D( var_1 ) && !isdefined( var_0._id_0D77 ) )
    {
        var_5 = maps\mp\_utility::_id_4167( var_1 );

        switch ( var_5 )
        {
            case "weapon_pistol":
                var_6 = 800;
                break;
            case "weapon_smg":
                var_6 = 1200;
                break;
            case "weapon_assault":
            case "weapon_heavy":
                var_6 = 1500;
                break;
            case "weapon_sniper":
                var_6 = 2000;
                break;
            case "weapon_shotgun":
                var_6 = 500;
                break;
            case "weapon_projectile":
            default:
                var_6 = 1536;
                break;
        }

        if ( _func_120( var_1, "exocrossbow" ) )
            var_6 = 1200;

        var_7 = var_6 * var_6;

        if ( _func_0F0( var_4, var_3._id_02E2 ) > var_7 )
            return 1;
    }

    return 0;
}

_id_518F( var_0, var_1 )
{
    if ( !level._id_91EB )
        return 0;

    foreach ( var_4, var_3 in var_0._id_259A )
    {
        if ( var_4 != self._id_4450 && var_1 - var_3 < 500 )
            return 1;
    }

    return 0;
}

_id_5850( var_0, var_1, var_2 )
{
    self._id_029E["longshot"] = 1;
    maps\mp\_utility::_id_4C2F( "longshots", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "longshot", self, var_1, undefined, var_2 );
    thread maps\mp\_matchdata::_id_5838( var_0, "longshot" );
}

_id_477E( var_0, var_1, var_2 )
{
    self._id_029E["headshot"] = 1;
    maps\mp\_utility::_id_4C2E( "headshots", 1 );
    maps\mp\_utility::_id_4C2F( "headshots", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "headshots", maps\mp\_utility::_id_1E29( self._id_0308["headshots"] ) );
    self._id_01E5 = maps\mp\_utility::_id_4081( "headshots" );
    level thread maps\mp\gametypes\_rank::_id_1208( "headshot", self, var_1, undefined, var_2 );
    thread maps\mp\_matchdata::_id_5838( var_0, "headshot" );

    if ( !isdefined( self.headhuntercounter ) )
        self.headhuntercounter = 1;

    if ( isdefined( self._id_01E5 ) && self._id_01E5 >= self.headhuntercounter * 10 )
    {
        maps\mp\gametypes\_misions::_id_6FF6( "ch_headhunter" );
        self.headhuntercounter++;
    }
}

_id_51D5( var_0, var_1, var_2 )
{
    if ( !_func_188( var_2 ) )
        return 0;

    if ( !_func_120( var_1, "h1_frag" ) )
        return 0;

    if ( isdefined( var_0 ) && isdefined( var_0._id_357E ) && isdefined( var_0._id_357E["throwbackKill"] ) && var_0._id_357E["throwbackKill"] )
        return 1;

    return 0;
}

_id_9339()
{
    maps\mp\_utility::_id_4C2F( "throwback_kill", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "throwback_kill", self );
}

_id_117C( var_0, var_1, var_2 )
{
    self._id_029E["avenger"] = 1;
    maps\mp\_utility::_id_4C2F( "avengekills", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "avenger", self, var_1, undefined, var_2 );
    thread maps\mp\_matchdata::_id_5838( var_0, "avenger" );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_avenger" );
}

_id_0D78( var_0, var_1, var_2 )
{
    self._id_029E["assistedsuicide"] = 1;
    maps\mp\_utility::_id_4C2F( "assistedsuicide", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "assistedsuicide", self, var_1, undefined, var_2 );
    thread maps\mp\_matchdata::_id_5838( var_0, "assistedsuicide" );
}

_id_27AA( var_0, var_1, var_2 )
{
    self._id_029E["defender"] = 1;
    maps\mp\_utility::_id_4C2F( "rescues", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "defender", self, var_1, undefined, var_2 );
    thread maps\mp\_matchdata::_id_5838( var_0, "defender" );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_savior" );
}

_id_27AE( var_0, var_1 )
{
    maps\mp\_utility::_id_4C2F( "defends", 1 );
    maps\mp\_utility::_id_4C2E( "defends", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "defends", self._id_0308["defends"] );
    level thread maps\mp\gametypes\_rank::_id_1208( "defend", self );
    var_0 thread maps\mp\_matchdata::_id_5838( var_1, "assaulting" );
}

_id_0D52( var_0, var_1 )
{
    maps\mp\_utility::_id_4C2F( "assault", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "assault", self );
    var_0 thread maps\mp\_matchdata::_id_5838( var_1, "defending" );
}

_id_6E87( var_0 )
{
    self._id_029E["posthumous"] = 1;
    maps\mp\_utility::_id_4C2F( "posthumous", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "posthumous", self );
    thread maps\mp\_matchdata::_id_5838( var_0, "posthumous" );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_afterlife" );
}

_id_50C5( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_5150( var_2 ) )
        return 0;

    if ( maps\mp\gametypes\_weapons::_id_5192( var_1 ) )
        return 0;

    var_3 = var_0 _meth_8338();
    var_4 = self _meth_8338();
    var_5 = _func_0EB( var_3[1] - var_4[1] );

    if ( _func_0BE( var_5 ) < 75 )
        return 1;

    return 0;
}

_id_125C( var_0 )
{
    maps\mp\_utility::_id_4C2F( "backstab", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "backstab", self );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_backstab" );
}

_id_74EA( var_0 )
{
    self._id_029E["revenge"] = 1;
    self._id_55B1 = undefined;
    maps\mp\_utility::_id_4C2F( "revengekills", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "revenge", self );
    thread maps\mp\_matchdata::_id_5838( var_0, "revenge" );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_revenge" );
}

_id_5FE5( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = maps\mp\gametypes\_misions::_id_3CE8( var_2 );
    var_5 = maps\mp\_utility::_id_3F11( var_2 );

    if ( maps\mp\_utility::_id_514D( var_5 ) )
        var_5 = maps\mp\gametypes\_class::_id_3F10( var_5 );

    var_6 = "";

    if ( common_scripts\utility::_id_8F57( var_5, "iw5_" ) )
        var_6 = _func_122( var_5, 4 );
    else if ( common_scripts\utility::_id_8F57( var_5, "h1_" ) )
        var_6 = _func_122( var_5, 3 );

    switch ( var_1 )
    {
        case 2:
            level thread maps\mp\gametypes\_rank::_id_1208( "doublekill", self );
            maps\mp\_utility::_id_4C2F( "doublekill", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_double" );
            break;
        case 3:
            level thread maps\mp\gametypes\_rank::_id_1208( "triplekill", self );
            level thread maps\mp\_utility::_id_91FA( "callout_3xkill", self );
            maps\mp\_utility::_id_4C2F( "triplekill", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_triple" );

            if ( maps\mp\gametypes\_misions::_id_50BC() )
                maps\mp\gametypes\_misions::_id_6FF6( "ch_triplehurt" );

            break;
        case 4:
            level thread maps\mp\gametypes\_rank::_id_1208( "fourkill", self );
            level thread maps\mp\_utility::_id_91FA( "callout_4xkill", self );
            maps\mp\_utility::_id_4C2F( "fourkill", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_quadra" );
            break;
        case 5:
            level thread maps\mp\gametypes\_rank::_id_1208( "fivekill", self );
            level thread maps\mp\_utility::_id_91FA( "callout_5xkill", self );
            maps\mp\_utility::_id_4C2F( "fivekill", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_penta" );
            break;
        case 6:
            level thread maps\mp\gametypes\_rank::_id_1208( "sixkill", self );
            level thread maps\mp\_utility::_id_91FA( "callout_6xkill", self );
            maps\mp\_utility::_id_4C2F( "sixkill", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_hexa" );
            break;
        case 7:
            level thread maps\mp\gametypes\_rank::_id_1208( "sevenkill", self );
            level thread maps\mp\_utility::_id_91FA( "callout_7xkill", self );
            maps\mp\_utility::_id_4C2F( "sevenkill", 1 );
            break;
        case 8:
            level thread maps\mp\gametypes\_rank::_id_1208( "eightkill", self );
            level thread maps\mp\_utility::_id_91FA( "callout_8xkill", self );
            maps\mp\_utility::_id_4C2F( "eightkill", 1 );
            break;
        default:
            level thread maps\mp\gametypes\_rank::_id_1208( "multikill", self );
            thread maps\mp\_utility::_id_91FA( "callout_9xpluskill", self );
            maps\mp\_utility::_id_4C2F( "multikill", 1 );
            break;
    }

    thread maps\mp\_matchdata::_id_583D( var_0, var_1 );
}

_id_911F()
{
    maps\mp\_utility::_id_4C2F( "take_and_kill", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "take_and_kill", self );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_backfire" );

    if ( maps\mp\_utility::_id_4015() == "mp_bog_summer" )
        maps\mp\gametypes\_misions::_id_6FF6( "ch_summer_backfire" );
}

setuplinkstats()
{
    var_0 = maps\mp\_utility::_id_408F( "fieldgoal" ) + maps\mp\_utility::_id_408F( "touchdown" ) * 2;
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "captures", var_0 );
    maps\mp\_utility::_id_7F6B( var_0 );
}

_id_3868()
{
    thread maps\mp\_utility::_id_91FA( "callout_flagpickup", self );
    maps\mp\_utility::_id_4C2F( "flagscarried", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "flag_pickup", self );
    thread maps\mp\_matchdata::_id_5827( "pickup", self._id_02E2 );
}

_id_385F()
{
    thread maps\mp\_utility::_id_91FA( "callout_flagcapture", self );
    maps\mp\_utility::_id_4C2F( "flagscaptured", 1 );
    maps\mp\_utility::_id_4C2E( "captures", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "captures", self._id_0308["captures"] );
    maps\mp\_utility::_id_7F6B( self._id_0308["captures"] );
    level thread maps\mp\gametypes\_rank::_id_1208( "flag_capture", self );
    thread maps\mp\_matchdata::_id_5827( "capture", self._id_02E2 );
}

_id_3869()
{
    thread maps\mp\_utility::_id_91FA( "callout_flagreturn", self );
    maps\mp\_utility::_id_4C2F( "flagsreturned", 1 );
    maps\mp\_utility::_id_4C2E( "returns", 1 );
    self.assists = self._id_0308["returns"];
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "returns", self._id_0308["returns"] );
    level thread maps\mp\gametypes\_rank::_id_1208( "flag_return", self );
    thread maps\mp\_matchdata::_id_5827( "return", self._id_02E2 );
}

_id_53B6()
{
    maps\mp\_utility::_id_4C2F( "killsasflagcarrier", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "kill_with_flag", self );
}

_id_5368( var_0 )
{
    thread maps\mp\_utility::_id_91FA( "callout_killflagcarrier", self );
    maps\mp\_utility::_id_4C2F( "flagcarrierkills", 1 );
    maps\mp\_utility::_id_4C2E( "defends", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "defends", self._id_0308["defends"] );
    level thread maps\mp\gametypes\_rank::_id_1208( "kill_flag_carrier", self );
    thread maps\mp\_matchdata::_id_5838( var_0, "carrying" );
}

_id_5359( var_0 )
{
    maps\mp\_utility::_id_4C2F( "killsdenied", 1 );
    maps\mp\_utility::_id_4C2E( "denied", 1 );
    maps\mp\_utility::_id_7F6C( self._id_0308["denied"] );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "denied", self._id_0308["denied"] );
    var_1 = "kill_denied";

    if ( var_0 )
    {
        var_1 = "kill_denied_retrieved";
        maps\mp\_utility::_id_4C2F( "kill_denied_retrieved", 1 );
        maps\mp\gametypes\_misions::_id_6FF6( "ch_save_yourself" );
    }

    level thread maps\mp\gametypes\_rank::_id_1208( var_1, self );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_denial" );
}

_id_5356()
{
    maps\mp\_utility::_id_4C2F( "killsconfirmed", 1 );
    maps\mp\_utility::_id_4C2E( "confirmed", 1 );
    maps\mp\_utility::_id_7F6B( self._id_0308["confirmed"] );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "confirmed", self._id_0308["confirmed"] );
    level thread maps\mp\gametypes\_rank::_id_1208( "kill_confirmed", self );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_collector" );
}

_id_90E0()
{
    maps\mp\_utility::_id_4C2F( "tag_collector", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "tag_collector", self );
}

_id_5ED2( var_0 )
{
    if ( !_func_1AD( var_0 ) )
        return;

    var_0 notify( "tagCollector" );
    var_0 endon( "tagCollector" );

    if ( !isdefined( var_0._id_90E1 ) )
        var_0._id_90E1 = 0;

    var_0._id_90E1++;

    if ( var_0._id_90E1 > 2 )
    {
        var_0 _id_90E0();
        var_0._id_90E1 = 0;
    }

    wait 2.5;

    if ( isdefined( var_0 ) )
        var_0._id_90E1 = 0;
}

_id_1548()
{
    maps\mp\_utility::_id_4C2F( "bombsplanted", 1 );
    maps\mp\_utility::_id_4C2E( "plants", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "plants", self._id_0308["plants"] );
    maps\mp\_utility::_id_7F6B( self._id_0308["plants"] );
    level thread maps\mp\_utility::_id_91FA( "callout_bombplanted", self );
    level thread maps\mp\gametypes\_rank::_id_1208( "plant", self );
    thread maps\mp\_matchdata::_id_5827( "plant", self._id_02E2 );
}

_id_1537( var_0 )
{
    maps\mp\_utility::_id_4C2F( "bombsdefused", 1 );
    maps\mp\_utility::_id_4C2E( "defuses", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "defuses", self._id_0308["defuses"] );
    maps\mp\_utility::_id_7F6C( self._id_0308["defuses"] );
    level thread maps\mp\_utility::_id_91FA( "callout_bombdefused", self );

    if ( var_0 == "ninja_defuse" || var_0 == "last_man_defuse" )
    {
        maps\mp\_utility::_id_4C2F( var_0, 1 );

        if ( var_0 == "ninja_defuse" && isdefined( level._id_1544 ) && level._id_1544._id_1547 + 6000 + level._id_27BF * 1000 > gettime() )
            maps\mp\gametypes\_misions::_id_6FF6( "ch_ninja" );
    }

    level thread maps\mp\gametypes\_rank::_id_1208( var_0, self );
    thread maps\mp\_matchdata::_id_5827( "defuse", self._id_02E2 );
}

_id_305C( var_0, var_1 )
{
    maps\mp\_utility::_id_4C2F( "elimination", 1 );
    level thread maps\mp\_utility::_id_91FA( "callout_eliminated", var_1 );

    if ( var_0 )
    {
        maps\mp\_utility::_id_4C2F( "last_man_standing", 1 );
        level thread maps\mp\gametypes\_rank::_id_1208( "last_man_standing", self );
    }
    else
        level thread maps\mp\gametypes\_rank::_id_1208( "elimination", self );
}

_id_1539()
{
    maps\mp\_utility::_id_4C2F( "targetsdestroyed", 1 );
    maps\mp\_utility::_id_4C2E( "destructions", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "destructions", self._id_0308["destructions"] );
    level thread maps\mp\_utility::_id_91FA( "callout_destroyed_objective", self );
    level thread maps\mp\gametypes\_rank::_id_1208( "destroy", self );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_sd_destroyer" );
}

_id_4C34()
{
    maps\mp\_utility::_id_4C2F( "levelup", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "gained_gun_score", self );
}

_id_2758()
{
    maps\mp\_utility::_id_4C2F( "dejavu", 1 );
    maps\mp\_utility::_id_4C2E( "setbacks", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "setbacks", self._id_0308["setbacks"] );
    level thread maps\mp\gametypes\_rank::_id_1208( "dropped_gun_score", self );
}

_id_7F2C()
{
    maps\mp\_utility::_id_4C2F( "humiliation", 1 );
    maps\mp\_utility::_id_4C2E( "humiliations", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "humiliations", self._id_0308["humiliations"] );
    level thread maps\mp\gametypes\_rank::_id_1208( "dropped_enemy_gun_rank", self );
}

_id_70A1()
{
    maps\mp\_utility::_id_4C2F( "gunslinger", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "quick_gun_rank", self );
}

_id_7F2D()
{
    maps\mp\_utility::_id_4C2F( "regicide", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "dropped_first_player_gun_rank", self );
}

_id_2CF0( var_0 )
{
    maps\mp\_utility::_id_4C2F( "pointscaptured", 1 );
    maps\mp\_utility::_id_4C2E( "captures", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "captures", self._id_0308["captures"] );
    maps\mp\_utility::_id_7F6B( self._id_0308["captures"] );
    var_1 = "capture";

    if ( var_0 )
    {
        var_1 = "opening_move";
        maps\mp\_utility::_id_4C2F( "opening_move", 1 );
    }

    level thread maps\mp\gametypes\_rank::_id_1208( var_1, self );
    thread maps\mp\_matchdata::_id_5827( "capture", self._id_02E2 );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_dom_aggression" );
}

_id_2CFC()
{
    level thread maps\mp\gametypes\_rank::_id_1208( "neutralize", self );
}

_id_53B4( var_0, var_1 )
{
    maps\mp\_utility::_id_4C2F( "assault", 1 );
    maps\mp\_utility::_id_4C2F( "kill_while_capture", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "kill_while_capture", self );
    var_0 thread maps\mp\_matchdata::_id_5838( var_1, "defending" );
}

_id_7C06()
{
    maps\mp\_utility::_id_4C2F( "hp_secure", 1 );
    maps\mp\_utility::_id_4C2E( "captures", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "captures", self._id_0308["captures"] );
    level thread maps\mp\_utility::_id_91FA( "callout_hp_captured_by", self );
    level thread maps\mp\gametypes\_rank::_id_1208( "hp_secure", self );
    thread maps\mp\_matchdata::_id_5827( "capture", self._id_02E2 );
}

holdhardpointevent()
{
    maps\mp\_utility::_id_4C2E( "captureTime", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "captureTime", self._id_0308["captureTime"] );
    maps\mp\_utility::_id_7F6B( self._id_0308["captureTime"] );
}

hqcaptureevent()
{
    maps\mp\_utility::_id_4C2F( "hqscaptured", 1 );
    maps\mp\_utility::_id_4C2E( "captures", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "captures", self._id_0308["captures"] );
    maps\mp\_utility::_id_7F6B( self._id_0308["captures"] );
    level thread maps\mp\_utility::_id_91FA( "callout_capturedhq", self );
    level thread maps\mp\gametypes\_rank::_id_1208( "hq_secure", self );
    thread maps\mp\_matchdata::_id_5827( "capture", self._id_02E2 );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_hq_aggression" );
}

hqdestroyevent()
{
    maps\mp\_utility::_id_4C2F( "hqsdestroyed", 1 );
    maps\mp\_utility::_id_4C2E( "destructions", 1 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "destructions", self._id_0308["destructions"] );
    maps\mp\_utility::_id_7F6C( self._id_0308["destructions"] );
    level thread maps\mp\_utility::_id_91FA( "callout_destroyedhq", self );
    level thread maps\mp\gametypes\_rank::_id_1208( "hq_destroy", self );
    thread maps\mp\_matchdata::_id_5827( "destroy", self._id_02E2 );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_hq_destroyer" );
}

_id_3816( var_0, var_1, var_2 )
{
    self._id_029E["firstblood"] = 1;
    maps\mp\_utility::_id_4C2F( "firstblood", 1 );
    thread maps\mp\_utility::_id_91FA( "callout_firstblood", self );
    level thread maps\mp\gametypes\_rank::_id_1208( "firstblood", self, var_1, undefined, var_2 );
    thread maps\mp\_matchdata::_id_5838( var_0, "firstblood" );
}

_id_50D0( var_0 )
{
    var_1 = var_0._id_0308["cur_kill_streak"];

    if ( var_1 == 2 || var_1 == 4 || var_1 == 6 )
        return 1;

    return 0;
}

_id_1967( var_0, var_1, var_2, var_3 )
{
    self._id_029E["buzzkill"] = var_1._id_0308["cur_kill_streak"];
    maps\mp\_utility::_id_4C2F( "buzzkill", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "buzzkill", self, var_2, undefined, var_3 );
}

_id_64A1( var_0, var_1, var_2 )
{
    self._id_029E["oneshotkill"] = 1;
    maps\mp\_utility::_id_4C2F( "oneshotkill", 1 );
    maps\mp\gametypes\_misions::_id_6FF6( "ch_deadeye" );
}

_id_20B8( var_0, var_1, var_2 )
{
    self._id_029E["comeback"] = 1;
    maps\mp\_utility::_id_4C2F( "comebacks", 1 );
    level thread maps\mp\gametypes\_rank::_id_1208( "comeback", self, var_1, undefined, var_2 );
    thread maps\mp\_matchdata::_id_5838( var_0, "comeback" );
}

choosenextbestnemesis()
{
    var_0 = self._id_0308["nemesis_tracking"];
    var_1 = _func_1D3( var_0 );
    var_2 = "";
    var_3 = 0;

    foreach ( var_5 in var_1 )
    {
        var_6 = self._id_0308["nemesis_tracking"][var_5];

        if ( var_6 > var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    self._id_0308["nemesis_guid"] = var_2;
}

choosenextbestprey()
{
    var_0 = self._id_0308["killed_players"];
    var_1 = _func_1D3( var_0 );
    var_2 = "";
    var_3 = 0;

    foreach ( var_5 in var_1 )
    {
        var_6 = self._id_0308["killed_players"][var_5];

        if ( var_6 > var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    self._id_0308["prey_guid"] = var_2;
}

_id_2B36()
{
    var_0 = self._id_4450;

    for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
    {
        if ( isdefined( level._id_0323[var_1]._id_0308["killed_players"][var_0] ) )
            level._id_0323[var_1]._id_0308["killed_players"][var_0] = undefined;

        if ( isdefined( level._id_0323[var_1]._id_5363[var_0] ) )
            level._id_0323[var_1]._id_5363[var_0] = undefined;

        if ( isdefined( level._id_0323[var_1]._id_0308["killed_by"][var_0] ) )
            level._id_0323[var_1]._id_0308["killed_by"][var_0] = undefined;

        if ( isdefined( level._id_0323[var_1]._id_0308["nemesis_tracking"][var_0] ) )
            level._id_0323[var_1]._id_0308["nemesis_tracking"][var_0] = undefined;

        if ( isdefined( level._id_0323[var_1]._id_0308["nemesis_guid"] ) && level._id_0323[var_1]._id_0308["nemesis_guid"] == var_0 )
            level._id_0323[var_1] choosenextbestnemesis();

        if ( isdefined( level._id_0323[var_1]._id_0308["prey_guid"] ) && level._id_0323[var_1]._id_0308["prey_guid"] == var_0 )
            level._id_0323[var_1] choosenextbestprey();

        if ( isdefined( level._id_0323[var_1]._id_0E34 ) && isdefined( level._id_0323[var_1]._id_0E34[var_0] ) )
            level._id_0323[var_1]._id_0E34[var_0] = undefined;

        if ( isdefined( level._id_0323[var_1]._id_0E2C ) && isdefined( level._id_0323[var_1]._id_0E2C[var_0] ) )
            level._id_0323[var_1]._id_0E2C[var_0] = undefined;

        if ( isdefined( level._id_0323[var_1]._id_32AE ) && isdefined( level._id_0323[var_1]._id_32AE[var_0] ) )
            level._id_0323[var_1]._id_32AE[var_0] = undefined;
    }
}

_id_9B55( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "";

    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "updateRecentKills" );
    self endon( "updateRecentKills" );
    self._id_7260++;
    var_2 = 0;

    if ( self _meth_833D() >= 0.2 )
        var_2 = 1;

    wait 2.0;

    if ( self._id_7260 > 1 )
        _id_5FE5( var_0, self._id_7260, var_1, var_2 );

    self._id_7260 = 0;
}

_id_1D24( var_0 )
{
    if ( isdefined( level._id_511D ) )
        return;

    if ( !isdefined( self._id_0E31 ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_1 = self._id_02E5;

    if ( !isdefined( var_1 ) )
        var_1 = self;

    foreach ( var_3 in self._id_0E31 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == var_1 )
            continue;

        if ( var_3 == var_0 )
            continue;

        if ( var_3._id_04A7 == self._id_04A7 )
            continue;

        var_3 maps\mp\_utility::_id_4C2F( "assist_killstreak_destroyed", 1 );
        level thread maps\mp\gametypes\_rank::_id_1208( "assist_killstreak_destroyed", var_3 );
    }
}

_id_1D1B( var_0 )
{
    var_1 = self._id_023B + 1;

    if ( var_1 % 5 && var_1 < 30 )
        return;

    switch ( var_1 )
    {
        case 5:
            level thread maps\mp\gametypes\_rank::_id_1208( "killstreak5", self );
            maps\mp\_utility::_id_4C2F( "killstreak5", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_bloodthirsty" );
            break;
        case 10:
            level thread maps\mp\gametypes\_rank::_id_1208( "killstreak10", self );
            maps\mp\_utility::_id_4C2F( "killstreak10", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_merciless" );
            break;
        case 15:
            level thread maps\mp\gametypes\_rank::_id_1208( "killstreak15", self );
            maps\mp\_utility::_id_4C2F( "killstreak15", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_ruthless" );
            break;
        case 20:
            level thread maps\mp\gametypes\_rank::_id_1208( "killstreak20", self );
            maps\mp\_utility::_id_4C2F( "killstreak20", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_relentless" );
            break;
        case 25:
            level thread maps\mp\gametypes\_rank::_id_1208( "killstreak25", self );
            maps\mp\_utility::_id_4C2F( "killstreak25", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_brutal" );
            break;
        case 30:
            level thread maps\mp\gametypes\_rank::_id_1208( "killstreak30", self );
            maps\mp\_utility::_id_4C2F( "killstreak30", 1 );
            maps\mp\gametypes\_misions::_id_6FF6( "ch_killer_vicious" );
            break;
        default:
            level thread maps\mp\gametypes\_rank::_id_1208( "killstreak30plus", self );
            maps\mp\_utility::_id_4C2F( "killstreak30plus", 1 );
            break;
    }

    thread maps\mp\_utility::_id_91FA( "callout_kill_streaking", self, undefined, var_1 );
}

_id_1D0C( var_0 )
{
    if ( maps\mp\_utility::_id_412C() < 90000.0 )
        return;

    var_1 = level._id_0323;

    if ( level._id_91EB )
        var_1 = level._id_91F5[maps\mp\_utility::_id_4067( self._id_04A7 )];

    if ( var_1.size < 3 )
        return;

    var_2 = common_scripts\utility::_id_0D06( var_1, ::_id_5079 );

    if ( isdefined( var_2[0] ) && var_0 == var_2[0] )
    {
        maps\mp\_utility::_id_4C2F( "firstplacekill", 1 );
        level thread maps\mp\gametypes\_rank::_id_1208( "firstplacekill", self );
        maps\mp\gametypes\_misions::_id_6FF6( "ch_kingslayer" );
    }
}

_id_5079( var_0, var_1 )
{
    return var_0._id_038D > var_1._id_038D;
}

_id_6FF4( var_0, var_1 )
{
    if ( isdefined( level._id_0D7B ) && level._id_0D7B )
        return;

    var_2 = "assist";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    self endon( "disconnect" );
    var_0 endon( "disconnect" );
    wait 0.05;

    if ( self._id_04A7 != "axis" && self._id_04A7 != "allies" )
        return;

    if ( level._id_91EB && self._id_04A7 == var_0._id_04A7 )
        return;

    level thread maps\mp\gametypes\_rank::_id_1208( var_2, self, undefined, var_0 );
    var_0 maps\mp\_matchdata::_id_584B( self, var_2 );

    if ( var_2 == "assist" )
    {
        maps\mp\_utility::_id_4C2F( "assists", 1 );
        maps\mp\_utility::_id_4C2E( "assists", 1 );

        if ( !maps\mp\_utility::_id_5092( level.assists_count_disabled ) )
            self.assists = maps\mp\_utility::_id_4081( "assists" );

        maps\mp\gametypes\_persistence::_id_8D7A( "round", "assists", self.assists );
        thread maps\mp\gametypes\_misions::_id_6C67();
    }
}

stoppingpowerevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_stoppingpower" );
}

sleightofhandeventwatcher()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "sleightOfHandEventEnd" );
    level endon( "game_ended" );
    var_0 = common_scripts\utility::_id_A070( "sleightOfHandEventEarned", "sleightOfHandEventFailed" );

    if ( var_0 == "sleightOfHandEventEarned" )
        maps\mp\gametypes\_misions::_id_6FF6( "ch_sleightofhand" );

    self.sleightofhandeventweap = undefined;
}

sleightofhandtimer()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "sleightOfHandEventEnd" );
    self endon( "sleightOfHandEventEarned" );
    level endon( "game_ended" );
    wait 3;

    if ( isdefined( self ) )
        self notify( "sleightOfHandEventFailed" );
}

sleightofhandreloadwatch( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "sleightOfHandEventEnd" );
    self endon( "sleightOfHandEventFailed" );
    level endon( "game_ended" );
    thread sleightofhandtimer();
    self waittill( "reload" );

    if ( isdefined( self ) )
        self.sleightofhandeventweap = var_0;
}

sleightofhandevent( var_0, var_1 )
{
    if ( !isdefined( self.sleightofhandeventweap ) )
    {
        self notify( "sleightOfHandEventEnd" );
        thread sleightofhandeventwatcher();
        thread sleightofhandreloadwatch( var_0 );
    }
    else if ( var_0 == self.sleightofhandeventweap )
        self notify( "sleightOfHandEventEarned" );
}

doubletapevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_doubletap" );
}

overkillevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_overkill" );
}

uavjammerevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_uavjammer" );
}

sonicboomevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_sonicboom" );
}

steadyaimevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_steadyaim" );
}

laststandevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_laststand" );
}

ironlungsevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_ironlungs" );
}

eavesdropevent()
{
    maps\mp\gametypes\_misions::_id_6FF6( "ch_eavesdrop" );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    _id_4D8B();
    level thread _id_64C8();
}

checkforlevelprogressionchallenges()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    var_0 = undefined;

    while ( !isdefined( var_0 ) )
    {
        if ( !isdefined( self ) )
            return;

        if ( maps\mp\_utility::_id_4FA6() )
            return;

        var_0 = self._id_0308["rank"];
        wait 0.2;
    }

    var_1 = _func_0BC( ( var_0 + 1 ) / 50 );

    if ( var_1 > 1 )
    {
        for ( var_2 = var_1; var_2 > 1; var_2-- )
        {
            var_3 = var_2 * 50;
            var_4 = "ch_" + var_3 + "_paragon";
            var_5 = self._id_1C61[var_4];

            if ( isdefined( var_5 ) && var_5 == 1 )
                maps\mp\gametypes\_misions::_id_6FF6( var_4 );
        }
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0._id_0308["stats"] ) )
            var_0._id_0308["stats"] = [];

        var_0._id_8D77 = var_0._id_0308["stats"];

        if ( !var_0._id_8D77.size )
        {
            foreach ( var_3, var_2 in level.awards )
                var_0 maps\mp\_utility::_id_4E00( var_3, level.awards[var_3]._id_27A1 );
        }

        var_0.recentawards[0] = "none";
        var_0.recentawards[1] = "none";
        var_0.recentawards[2] = "none";

        if ( !maps\mp\_utility::_id_4FA6() )
            var_0 thread checkforlevelprogressionchallenges();
    }
}

_id_4D8B()
{
    _id_4E28( "headshots", 0, ::_id_488E );
    _id_4E28( "multikill", 0, ::_id_488E );
    _id_4E28( "avengekills", 0, ::_id_488E );
    _id_4E28( "comebacks", 0, ::_id_488E );
    _id_4E28( "rescues", 0, ::_id_488E );
    _id_4E28( "longshots", 0, ::_id_488E );
    _id_4E28( "revengekills", 0, ::_id_488E );
    _id_4E28( "bulletpenkills", 0, ::_id_488E );
    _id_4E28( "throwback_kill", 0, ::_id_488E );
    _id_4E28( "firstblood", 0, ::_id_488E );
    _id_4E28( "posthumous", 0, ::_id_488E );
    _id_4E28( "assistedsuicide", 0, ::_id_488E );
    _id_4E28( "buzzkill", 0, ::_id_488E );
    _id_4E28( "oneshotkill", 0, ::_id_488E );
    _id_4E28( "doublekill", 0, ::_id_488E );
    _id_4E28( "triplekill", 0, ::_id_488E );
    _id_4E28( "fourkill", 0, ::_id_488E );
    _id_4E28( "fivekill", 0, ::_id_488E );
    _id_4E28( "sixkill", 0, ::_id_488E );
    _id_4E28( "sevenkill", 0, ::_id_488E );
    _id_4E28( "eightkill", 0, ::_id_488E );
    _id_4E28( "backstab", 0, ::_id_488E );
    _id_4E28( "killstreak5", 0, ::_id_488E );
    _id_4E28( "killstreak10", 0, ::_id_488E );
    _id_4E28( "killstreak15", 0, ::_id_488E );
    _id_4E28( "killstreak20", 0, ::_id_488E );
    _id_4E28( "killstreak25", 0, ::_id_488E );
    _id_4E28( "killstreak30", 0, ::_id_488E );
    _id_4E28( "killstreak30plus", 0, ::_id_488E );
    _id_4E28( "pointblank", 0, ::_id_488E );
    _id_4E28( "firstplacekill", 0, ::_id_488E );
    _id_4E28( "assault", 0, ::_id_488E );
    _id_4E28( "defends", 0, ::_id_488E );
    _id_4E28( "near_death_kill", 0, ::_id_488E );
    _id_4E28( "flash_kill", 0, ::_id_488E );
    _id_4E28( "multiKillOneBullet", 0, ::_id_488E );
    _id_4E28( "think_fast", 0, ::_id_488E );
    _id_4E28( "take_and_kill", 0, ::_id_488E );
    _id_4E28( "kills", 0, ::_id_488E );
    _id_4E28( "longestkillstreak", 0, ::_id_488E );
    _id_4E28( "knifekills", 0, ::_id_488E );
    _id_4E28( "kdratio", 0, ::_id_488E );
    _id_4E28( "deaths", 0, ::_id_58AD );
    _id_4E28( "assists", 0, ::_id_488E );
    _id_4E28( "totalGameScore", 0, ::_id_488E );
    _id_4E28( "scorePerMinute", 0, ::_id_488E );
    _id_4E28( "mostScorePerLife", 0, ::_id_488E );
    _id_4E28( "killStreaksUsed", 0, ::_id_488E );
    _id_4E28( "airstrike_mp_kill", 0, ::_id_488E );
    _id_4E28( "helicopter_mp_kill", 0, ::_id_488E );
    _id_4E28( "humiliation", 0, ::_id_488E );
    _id_4E28( "regicide", 0, ::_id_488E );
    _id_4E28( "gunslinger", 0, ::_id_488E );
    _id_4E28( "dejavu", 0, ::_id_488E );
    _id_4E28( "levelup", 0, ::_id_488E );
    _id_4E28( "flagscaptured", 0, ::_id_488E );
    _id_4E28( "flagsreturned", 0, ::_id_488E );
    _id_4E28( "flagcarrierkills", 0, ::_id_488E );
    _id_4E28( "flagscarried", 0, ::_id_488E );
    _id_4E28( "killsasflagcarrier", 0, ::_id_488E );
    _id_4E28( "pointscaptured", 0, ::_id_488E );
    _id_4E28( "kill_while_capture", 0, ::_id_488E );
    _id_4E28( "opening_move", 0, ::_id_488E );
    _id_4E28( "hp_secure", 0, ::_id_488E );
    _id_4E28( "targetsdestroyed", 0, ::_id_488E );
    _id_4E28( "bombsplanted", 0, ::_id_488E );
    _id_4E28( "bombsdefused", 0, ::_id_488E );
    _id_4E28( "ninja_defuse", 0, ::_id_488E );
    _id_4E28( "last_man_defuse", 0, ::_id_488E );
    _id_4E28( "elimination", 0, ::_id_488E );
    _id_4E28( "last_man_standing", 0, ::_id_488E );
    _id_4E28( "killsconfirmed", 0, ::_id_488E );
    _id_4E28( "killsdenied", 0, ::_id_488E );
    _id_4E28( "kill_denied_retrieved", 0, ::_id_488E );
    _id_4E28( "tag_collector", 0, ::_id_488E );
    _id_4E28( "hqsdestroyed", 0, ::_id_488E );
    _id_4E28( "hqscaptured", 0, ::_id_488E );
    _id_4E28( "banked", 0, ::_id_488E );
    _id_4E28( "muggings", 0, ::_id_488E );
    _id_4E28( "helicopter_destroyed", 0, ::_id_488E );
    _id_4E28( "assist_killstreak_destroyed", 0, ::_id_488E );
    _id_4E28( "radar_mp_earned", 0, ::_id_488E );
    _id_4E28( "airstrike_mp_earned", 0, ::_id_488E );
    _id_4E28( "helicopter_mp_earned", 0, ::_id_488E );
    _id_4E28( "numMatchesRecorded", 0, ::_id_488E );
}

_id_4E28( var_0, var_1, var_2, var_3, var_4 )
{
    level.awards[var_0] = spawnstruct();
    level.awards[var_0]._id_27A1 = var_1;

    if ( isdefined( var_2 ) )
        level.awards[var_0]._id_6FDD = var_2;

    if ( isdefined( var_3 ) )
        level.awards[var_0]._id_9C5D = var_3;

    if ( isdefined( var_4 ) )
        level.awards[var_0]._id_9C5E = var_4;
}

_id_7FDE( var_0 )
{
    var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "bests", var_0 );
    var_2 = maps\mp\_utility::_id_408F( var_0 );
    var_2 = _id_3FA0( var_0, var_2 );

    if ( var_1 == 0 || var_2 > var_1 )
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "bests", var_0, var_2 );
}

_id_7FDF( var_0 )
{
    var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "bests", var_0 );
    var_2 = maps\mp\_utility::_id_408F( var_0 );
    var_2 = _id_3FA0( var_0, var_2 );

    if ( var_1 == 0 || var_2 < var_1 )
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "bests", var_0, var_2 );
}

_id_19DF( var_0 )
{
    var_1 = var_0 maps\mp\_utility::_id_408F( "kills" );
    var_2 = var_0 maps\mp\_utility::_id_408F( "deaths" );

    if ( var_2 == 0 )
        var_2 = 1;

    var_0 maps\mp\_utility::_id_7FEA( "kdratio", var_1 / var_2 );
}

_id_4136( var_0 )
{
    var_1 = var_0._id_038D;

    if ( !level._id_91EB )
        var_1 = var_0._id_0167;

    return var_1;
}

_id_19E6( var_0 )
{
    if ( var_0._id_9372["total"] < 1 )
        return;

    var_1 = _id_4136( var_0 );
    var_2 = var_0._id_9372["total"];
    var_3 = var_1 / ( var_2 / 60 );
    var_0 maps\mp\_utility::_id_7FEA( "totalGameScore", var_1 );
    var_0 maps\mp\_utility::_id_7FEA( "scorePerMinute", var_3 );
}

_id_0D70()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( !var_1 maps\mp\_utility::_id_7139() )
            return;

        var_1 maps\mp\_utility::_id_4C2F( "numMatchesRecorded", 1 );
        _id_19DF( var_1 );
        _id_19E6( var_1 );
    }

    foreach ( var_8, var_4 in level.awards )
    {
        if ( !isdefined( level.awards[var_8]._id_6FDD ) )
            continue;

        var_5 = level.awards[var_8]._id_6FDD;
        var_6 = level.awards[var_8]._id_9C5D;
        var_7 = level.awards[var_8]._id_9C5E;

        if ( isdefined( var_6 ) && isdefined( var_7 ) )
        {
            [[ var_5 ]]( var_8, var_6, var_7 );
            continue;
        }

        if ( isdefined( var_6 ) )
        {
            [[ var_5 ]]( var_8, var_6 );
            continue;
        }

        [[ var_5 ]]( var_8 );
    }
}

_id_41E1( var_0 )
{
    var_1 = maps\mp\_utility::_id_408F( var_0 );
    var_1 = _id_3FA0( var_0, var_1 );
    self _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "awards", var_0, var_1 );

    if ( _id_8485( var_0 ) )
    {
        var_2 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "awards", "numMatchesRecorded" );
        var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "awards", var_0 );
        var_4 = var_3 * var_2;
        var_5 = _func_0BC( ( var_4 + var_1 ) / ( var_2 + 1 ) );
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "awards", var_0, var_5 );
    }
    else
    {
        var_6 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "awards", var_0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "awards", var_0, var_6 + var_1 );
    }

    var_7 = 0;

    for ( var_8 = 0; var_8 < 3; var_8++ )
    {
        if ( self.recentawards[var_8] == var_0 )
            var_7 = 1;
    }

    var_9 = _func_0BC( _func_1BB( "mp/awardTable.csv", 1, var_0, 0 ) );

    if ( var_7 == 0 && isdefined( var_9 ) && var_9 == 1 && var_1 != 0 )
    {
        self.recentawards[2] = self.recentawards[1];
        self.recentawards[1] = self.recentawards[0];
        self.recentawards[0] = var_0;
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "recentAwards", 0, self.recentawards[0] );
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "recentAwards", 1, self.recentawards[1] );
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "recentAwards", 2, self.recentawards[2] );
    }
}

_id_8485( var_0 )
{
    switch ( var_0 )
    {
        case "kdratio":
        case "scorePerMinute":
            return 1;
    }

    return 0;
}

_id_3FA0( var_0, var_1 )
{
    var_2 = _func_1BB( "mp/awardTable.csv", 1, var_0, 5 );

    switch ( var_2 )
    {
        case "float":
            var_1 = maps\mp\_utility::_id_5764( var_1, 2 );
            var_1 *= 100;
            break;
        case "none":
        case "distance":
        case "count":
        case "time":
        case "multi":
        case "ratio":
        default:
            break;
    }

    var_1 = _func_0BC( var_1 );
    return var_1;
}

_id_488E( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
    {
        if ( var_3 maps\mp\_utility::_id_7139() && var_3 _id_8D7E( var_0 ) && ( !isdefined( var_1 ) || var_3 maps\mp\_utility::_id_408F( var_0 ) >= var_1 ) )
        {
            var_3 _id_41E1( var_0 );
            var_3 _id_7FDE( var_0 );
        }
    }
}

_id_58AC( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
    {
        if ( var_3 maps\mp\_utility::_id_7139() && var_3 _id_8D7E( var_0 ) && ( !isdefined( var_1 ) || var_3 maps\mp\_utility::_id_408F( var_0 ) <= var_1 ) )
        {
            var_3 _id_41E1( var_0 );
            var_3 _id_7FDF( var_0 );
        }
    }
}

_id_58AD( var_0 )
{
    var_1 = maps\mp\_utility::_id_412C() / 1000;
    var_2 = var_1 * 0.5;

    foreach ( var_4 in level._id_0323 )
    {
        if ( var_4._id_4745 && var_4._id_9372["total"] >= var_2 )
        {
            var_4 _id_41E1( var_0 );
            var_4 _id_7FDF( var_0 );
        }
    }
}

_id_8D7E( var_0 )
{
    var_1 = maps\mp\_utility::_id_408F( var_0 );
    var_2 = level.awards[var_0]._id_27A1;

    if ( var_1 == var_2 )
        return 0;
    else
        return 1;
}

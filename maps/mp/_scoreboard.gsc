// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6FFD()
{
    foreach ( var_1 in level._id_6861["all"] )
        var_1 _id_7FE8();

    if ( level._id_5FEC )
    {
        _id_1886( "multiteam" );

        foreach ( var_1 in level._id_0323 )
            var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "scoreboardType", "multiteam" );

        _func_136( "alliesScore", -1 );
        _func_136( "axisScore", -1 );
        _func_136( "alliesFaction", "none" );
        _func_136( "axisFaction", "none" );
    }
    else if ( level._id_91EB )
    {
        var_5 = _func_15F( "allies" );
        var_6 = _func_15F( "axis" );

        if ( var_5 == var_6 )
            var_7 = "tied";
        else if ( var_5 > var_6 )
            var_7 = "allies";
        else
            var_7 = "axis";

        _func_136( "alliesScore", var_5 );
        _func_136( "axisScore", var_6 );
        _func_136( "alliesFaction", game["allies"] );
        _func_136( "axisFaction", game["axis"] );

        if ( var_7 == "tied" )
        {
            _id_1886( "allies" );
            _id_1886( "axis" );

            foreach ( var_1 in level._id_0323 )
            {
                var_9 = var_1._id_0308["team"];

                if ( !isdefined( var_9 ) )
                    continue;

                if ( var_9 == "spectator" )
                {
                    var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "scoreboardType", "allies" );
                    continue;
                }

                var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "scoreboardType", var_9 );
            }
        }
        else
        {
            _id_1886( var_7 );

            foreach ( var_1 in level._id_0323 )
                var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "scoreboardType", var_7 );
        }
    }
    else
    {
        _id_1886( "neutral" );

        foreach ( var_1 in level._id_0323 )
            var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "scoreboardType", "neutral" );

        _func_136( "alliesScore", -1 );
        _func_136( "axisScore", -1 );
        _func_136( "alliesFaction", "none" );
        _func_136( "axisFaction", "none" );
    }

    foreach ( var_1 in level._id_0323 )
    {
        var_16 = 0;

        if ( !var_1 maps\mp\_utility::_id_7139() )
            var_16 = var_1._id_0308["summary"]["xp"];
        else
            var_16 = var_1 _meth_84FE() - var_1._id_0308["summary"]["matchStartXp"];

        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "totalXp", var_16 );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "scoreXp", var_1._id_0308["summary"]["score"] );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "challengeXp", var_1._id_0308["summary"]["challenge"] );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "matchXp", var_1._id_0308["summary"]["match"] );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "miscXp", var_1._id_0308["summary"]["misc"] );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "entitlementXp", var_1._id_0308["summary"]["entitlementXP"] );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "clanWarsXp", var_1._id_0308["summary"]["clanWarsXP"] );
        var_17 = "";
        var_18 = 0;
        var_19 = 0;

        if ( var_1._id_0308["nemesis_guid"] != "" )
        {
            var_20 = var_1._id_0308["nemesis_guid"];
            var_17 = getplayerxuidfromguid( var_20 );

            if ( isdefined( var_1._id_0308["killed_players"][var_20] ) )
                var_18 = maps\mp\_utility::_id_1E29( var_1._id_0308["killed_players"][var_20] );

            if ( isdefined( var_1._id_0308["killed_by"][var_20] ) )
                var_19 = maps\mp\_utility::_id_1E29( var_1._id_0308["killed_by"][var_20] );
        }

        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "nemesisXuid", var_17 );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "nemesisKills", var_18 );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "nemesisKilledBy", var_19 );
        var_21 = "";
        var_22 = 0;

        if ( var_1._id_0308["prey_guid"] != "" )
        {
            var_23 = var_1._id_0308["prey_guid"];
            var_21 = getplayerxuidfromguid( var_23 );

            if ( isdefined( var_1._id_0308["killed_players"][var_23] ) )
                var_22 = maps\mp\_utility::_id_1E29( var_1._id_0308["killed_players"][var_23] );
        }

        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "preyXuid", var_21 );
        var_1 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "preyKills", var_22 );
    }
}

getplayerxuidfromguid( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2._id_4450 == var_0 )
            return var_2._id_0537;
    }

    return "";
}

_id_7FE8()
{
    var_0 = _func_137( "scoreboardPlayerCount" );

    if ( var_0 <= 24 )
    {
        _func_136( "players", self._id_1F10, "score", self._id_0308["score"] );
        var_1 = self._id_0308["kills"];
        _func_136( "players", self._id_1F10, "kills", var_1 );

        if ( level._id_01B3 == "ctf" || level._id_01B3 == "sr" || level._id_01B3 == "gun" )
            var_2 = self.assists;
        else
            var_2 = self._id_0308["assists"];

        _func_136( "players", self._id_1F10, "assists", var_2 );
        var_3 = self._id_0308["deaths"];
        _func_136( "players", self._id_1F10, "deaths", var_3 );
        var_4 = self._id_0308["headshots"];
        _func_136( "players", self._id_1F10, "headshots", var_4 );
        var_5 = self._id_0308["team"];
        _func_136( "players", self._id_1F10, "team", var_5 );
        var_6 = game[self._id_0308["team"]];
        _func_136( "players", self._id_1F10, "faction", var_6 );
        var_7 = self._id_0308["extrascore0"];
        _func_136( "players", self._id_1F10, "extrascore0", var_7 );
        var_8 = self._id_0308["extrascore1"];
        _func_136( "players", self._id_1F10, "extrascore1", var_8 );
        var_9 = 0;

        if ( isdefined( self._id_0308["division"] ) && isdefined( self._id_0308["division"]["index"] ) )
            var_9 = self._id_0308["division"]["index"];

        _func_136( "players", self._id_1F10, "division", var_9 );
        var_10 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "callingCardIndex" );
        _func_136( "players", self._id_1F10, "callingCardIndex", var_10 );
        var_11 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );
        _func_136( "players", self._id_1F10, "emblemPatchIndex", var_11 );
        var_0++;
        _func_136( "scoreboardPlayerCount", var_0 );
    }
    else
    {

    }
}

_id_1886( var_0 )
{
    if ( var_0 == "multiteam" )
    {
        var_1 = 0;

        foreach ( var_3 in level._id_91F7 )
        {
            foreach ( var_5 in level._id_6861[var_3] )
            {
                _func_136( "scoreboards", "multiteam", "scoreboard", var_1, var_5._id_1F10 );
                var_1++;
            }
        }
    }
    else if ( var_0 == "neutral" )
    {
        var_1 = 0;

        foreach ( var_5 in level._id_6861["all"] )
        {
            _func_136( "scoreboards", var_0, "scoreboard", var_1, var_5._id_1F10 );
            var_1++;
        }
    }
    else
    {
        var_10 = maps\mp\_utility::_id_4067( var_0 );
        var_1 = 0;

        foreach ( var_5 in level._id_6861[var_0] )
        {
            _func_136( "scoreboards", var_0, "scoreboard", var_1, var_5._id_1F10 );
            var_1++;
        }

        foreach ( var_5 in level._id_6861[var_10] )
        {
            _func_136( "scoreboards", var_0, "scoreboard", var_1, var_5._id_1F10 );
            var_1++;
        }
    }
}

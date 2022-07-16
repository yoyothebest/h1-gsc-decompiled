// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

checkforseason1start()
{
    if ( !isvalidplayer() )
        return;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( isdefined( level._id_511D ) && level._id_511D )
        return;

    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( isdefined( self._id_0308["division"] ) && isdefined( self._id_0308["division"]["seasonStart"] ) )
        return;

    var_0 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "currentSeason" );
    var_1 = getdvarint( "scr_game_season" );

    if ( var_1 > 0 && var_0 == 0 )
    {
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", 0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "mmr", -31768 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter", 0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengePlayed", 0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengeWon", 0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "matchPrediction", 0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "matchDp", 0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "currentSeason", var_1 );
        self._id_0308["division"]["seasonStart"] = 1;
    }
}

init()
{
    if ( maps\mp\_utility::_id_4FA6() )
        return;

    if ( getdvarint( "scr_game_division" ) == 1 )
    {
        level.teammmr["allies"] = 0;
        level.teammmr["axis"] = 0;
        thread onrankedmatchstart();
        thread onmatchend();
    }
    else
        thread onnonrankedmatchstart();
}

isvalidplayer()
{
    return !_func_1FE( self ) && !_func_1FF( self ) && !_func_28E( self );
}

onnonrankedmatchstart()
{
    level endon( "game_win" );
    level endon( "exitLevel_called" );

    foreach ( var_1 in level._id_0323 )
    {
        var_1 checkforseason1start();
        var_1 clearmatchprediction();
        var_1._id_0308["division"]["index"] = 0;
    }

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_1 checkforseason1start();
        var_1 clearmatchprediction();
        var_1._id_0308["division"]["index"] = 0;
    }
}

onrankedmatchstart()
{
    level endon( "game_win" );
    level endon( "exitLevel_called" );

    foreach ( var_1 in level._id_0323 )
        var_1 thread _id_64C8();

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_1 thread _id_64C8();
    }
}

_id_64C8()
{
    level endon( "game_win" );
    level endon( "exitLevel_called" );

    if ( isvalidplayer() )
    {
        checkforseason1start();
        initloss();
        self _meth_8542( self._id_0308["division"]["init"]["dp"] );
    }
}

onmatchend()
{
    level endon( "exitLevel_called" );

    for (;;)
    {
        level waittill( "game_win", var_0 );

        if ( !isdefined( var_0 ) || var_0 != "axis" && var_0 != "allies" && var_0 != "tie" )
            continue;

        calculateteammmrs();
        checkforfeit();

        foreach ( var_2 in level._id_0323 )
        {
            if ( !var_2 isvalidplayer() )
                continue;

            var_2 calculatematchprediction();
            var_3 = var_2._id_0308["division"]["init"]["dp"];

            if ( var_2._id_0308["division"]["wonByForfeit"] || var_2._id_04A7 == var_0 )
                var_2 ondivisionwin( var_3 );
            else if ( var_0 == "tie" )
                var_2 ondivisiontie( var_3 );
            else
                var_2 ondivisionloss( var_3 );

            var_4 = var_2 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "division" );
            var_2 _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "matchDp", var_4 - var_3 + 128 );
            var_2 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "rankedPlaylistLockTime", 0 );
        }

        break;
    }
}

ondivisionwin( var_0 )
{
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_0308["division"]["minDP"] ) )
        return;

    var_1 = getdivisionpointsdelta( self._id_0308["division"]["matchPrediction"], "win" );
    var_2 = self._id_0308["division"]["init"]["deltaDP"];
    setplayermmr( var_1 );
    savematchprediction( "win" );
    self._id_0308["division"]["dp"] = var_0;

    if ( self._id_0308["division"]["minDP"] == var_0 )
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter", self._id_0308["division"]["init"]["relegation"] );

    if ( isdefined( self._id_0308["division"]["maxDP"] ) )
    {
        if ( self._id_0308["division"]["maxDP"] == var_0 )
        {
            if ( self._id_0308["division"]["init"]["winBits"] > 0 )
            {
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", var_0 + 1 );
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter", 0 );
            }
            else
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", var_0 );

            updatedivisionchallengestatus( 1 );
        }
        else
            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", _func_0BC( _func_0BF( _func_0BD( self._id_0308["division"]["maxDP"] ), _func_0BD( var_0 + var_1 ) ) ) );
    }
    else
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", var_0 + var_1 );
}

ondivisionloss( var_0 )
{
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_0308["division"]["minDP"] ) )
        return;

    var_1 = getdivisionpointsdelta( self._id_0308["division"]["matchPrediction"], "loss" );
    var_2 = self._id_0308["division"]["init"]["deltaDP"];
    var_3 = var_1 - var_2;
    savematchprediction( "loss" );

    if ( var_3 == 0 )
        return;

    setplayermmr( var_1 );

    if ( isdefined( self._id_0308["division"]["maxDP"] ) && self._id_0308["division"]["maxDP"] == var_0 )
        return;
    else if ( self._id_0308["division"]["minDP"] == var_0 )
        return;
    else
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", _func_0BC( _func_0E1( _func_0BD( self._id_0308["division"]["minDP"] ), _func_0BD( var_0 + var_1 ) ) ) );
}

ondivisiontie( var_0 )
{
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_0308["division"]["minDP"] ) )
        return;

    var_1 = getdivisionpointsdelta( self._id_0308["division"]["matchPrediction"], "tie" );
    var_2 = self._id_0308["division"]["init"]["deltaDP"];
    var_3 = var_1 - var_2;
    savematchprediction( "tie" );

    if ( var_3 == 0 )
        return;

    setplayermmr( var_1 );

    if ( self._id_0308["division"]["minDP"] == var_0 )
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter", self._id_0308["division"]["init"]["relegation"] );

    if ( isdefined( self._id_0308["division"]["maxDP"] ) )
    {
        if ( self._id_0308["division"]["maxDP"] == var_0 )
        {
            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", var_0 );
            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengePlayed", self._id_0308["division"]["init"]["playBits"] );
            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengeWon", self._id_0308["division"]["init"]["winBits"] );
            return;
        }
        else if ( var_1 > 0 )
        {
            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", _func_0BC( _func_0BF( _func_0BD( self._id_0308["division"]["maxDP"] ), _func_0BD( var_0 + var_1 ) ) ) );
            return;
        }
    }

    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", _func_0BC( _func_0E1( _func_0BD( self._id_0308["division"]["minDP"] ), _func_0BD( var_0 + var_1 ) ) ) );
}

initloss()
{
    if ( isdefined( self._id_0308["division"] ) && isdefined( self._id_0308["division"]["init"] ) )
        return;

    clearmatchprediction();
    var_0 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "division" );
    var_1 = _func_0BC( _func_1BB( "mp/divisiontable.csv", 0, "forfeit", 1 ) );
    getdivisionchallengestatus();
    getmmr();

    if ( self._id_0308["division"]["wins"] >= 2 || self._id_0308["division"]["losses"] >= 2 )
        cleardivisionchallengestatus();

    if ( self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter" ) >= 3 )
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter", 0 );

    self._id_0308["division"]["init"]["dp"] = var_0;
    self._id_0308["division"]["init"]["deltaDP"] = var_1;
    self._id_0308["division"]["init"]["relegation"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter" );
    self._id_0308["division"]["init"]["playBits"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengePlayed" );
    self._id_0308["division"]["init"]["winBits"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengeWon" );
    self._id_0308["division"]["init"]["MMR"] = self._id_0308["division"]["MMR"];
    thread updatelockouttime();
    self._id_0308["division"]["dp"] = var_0;
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_0308["division"]["minDP"] ) )
        return;

    setplayermmr( var_1 );

    if ( isdefined( self._id_0308["division"]["maxDP"] ) && self._id_0308["division"]["maxDP"] == var_0 )
    {
        self._id_0308["division"]["losses"]++;

        if ( self._id_0308["division"]["losses"] >= 2 )
            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", self._id_0308["division"]["minDP"] + getdivisionresetoffset() );
        else
        {

        }

        updatedivisionchallengestatus( 0 );
    }
    else if ( self._id_0308["division"]["minDP"] == var_0 )
    {
        if ( self._id_0308["division"]["minDP"] > 0 )
        {
            var_2 = self._id_0308["division"]["init"]["relegation"] + 1;

            if ( var_2 >= 3 )
            {
                getdivisionpointrange( var_0 - 1 );
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", self._id_0308["division"]["minDP"] + getdivisionresetoffset() );
            }
            else
            {

            }

            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionRelegationCounter", var_2 );
        }
    }
    else
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "division", _func_0BC( _func_0E1( _func_0BD( self._id_0308["division"]["minDP"] ), _func_0BD( var_0 + var_1 ) ) ) );
}

updatelockouttime()
{
    level endon( "exitLevel_called" );
    level endon( "game_win" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( _func_29C( self ) )
            break;

        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "rankedPlaylistLockTime", gettimeutc() );
        wait 10;
    }
}

getdivisionpointrange( var_0 )
{
    var_1 = _func_29D( "mp/divisiontable.csv" );
    var_2 = _func_1BF( "mp/divisiontable.csv", 0, "bronze" );

    for ( var_3 = var_2; var_3 < var_1; var_3++ )
    {
        var_4 = _func_1BC( "mp/divisiontable.csv", var_3, 2 );

        if ( !isdefined( var_4 ) || var_4 == "" )
        {
            self._id_0308["division"]["minDP"] = _func_0BC( _func_1BC( "mp/divisiontable.csv", var_3, 1 ) );
            self._id_0308["division"]["maxDP"] = undefined;
            self._id_0308["division"]["index"] = var_3 - var_2;
            return;
        }

        var_5 = _func_0BC( var_4 );

        if ( var_0 <= var_5 )
        {
            self._id_0308["division"]["minDP"] = _func_0BC( _func_1BC( "mp/divisiontable.csv", var_3, 1 ) );
            self._id_0308["division"]["maxDP"] = var_5;
            self._id_0308["division"]["index"] = var_3 - var_2;
            return;
        }
    }

    self._id_0308["division"]["minDP"] = undefined;
    self._id_0308["division"]["maxDP"] = undefined;
}

getdivisionchallengestatus()
{
    var_0 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengePlayed" );
    var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengeWon" );
    var_2 = 0;
    var_3 = 0;

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        if ( var_0 >> var_4 & 1 )
        {
            if ( var_1 >> var_4 & 1 )
                var_2++;
            else
                var_3++;

            continue;
        }

        break;
    }

    self._id_0308["division"]["wins"] = var_2;
    self._id_0308["division"]["losses"] = var_3;
}

cleardivisionchallengestatus()
{
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengePlayed", 0 );
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengeWon", 0 );
    self._id_0308["division"]["wins"] = 0;
    self._id_0308["division"]["losses"] = 0;
}

updatedivisionchallengestatus( var_0 )
{
    var_1 = self._id_0308["division"]["init"]["playBits"];
    var_2 = self._id_0308["division"]["init"]["winBits"];
    var_1 = var_1 << 1 | 1;
    var_2 <<= 1;

    if ( var_0 )
        var_2 |= 1;

    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengePlayed", var_1 );
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "divisionChallengeWon", var_2 );
}

getmmr()
{
    var_0 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "mmr" );
    var_0 -= -32768;
    self._id_0308["division"]["MMR"] = var_0;
}

savemmr()
{
    var_0 = self._id_0308["division"]["MMR"] + -32768;
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "mmr", var_0 );
}

savematchprediction( var_0 )
{
    var_1 = 8;
    var_2 = self._id_0308["division"]["matchPrediction"];

    if ( var_2 == "win" )
        var_1 |= 1;
    else if ( var_2 == "loss" )
        var_1 |= 2;

    if ( var_0 == "win" )
        var_1 |= 16;
    else if ( var_0 == "loss" )
        var_1 |= 32;

    self _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "matchPrediction", var_1 );
}

clearmatchprediction()
{
    if ( !isvalidplayer() )
        return;

    self _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "matchPrediction", 0 );
}

calculateteammmrs()
{
    var_0["axis"] = 0;
    var_0["allies"] = 0;
    level.teammmr["axis"] = 0;
    level.teammmr["allies"] = 0;

    foreach ( var_2 in level._id_0323 )
    {
        if ( !var_2 isvalidplayer() )
            continue;

        if ( !isdefined( var_2._id_04A7 ) || var_2._id_04A7 != "allies" && var_2._id_04A7 != "axis" )
            continue;

        if ( !isdefined( var_2._id_0308["division"]["init"]["MMR"] ) )
            continue;

        var_0[var_2._id_04A7]++;
        level.teammmr[var_2._id_04A7] += var_2._id_0308["division"]["init"]["MMR"];
    }

    if ( var_0["axis"] > 0 )
        level.teammmr["axis"] /= var_0["axis"];

    if ( var_0["allies"] > 0 )
        level.teammmr["allies"] /= var_0["allies"];
}

calculatematchprediction()
{
    if ( !isdefined( self._id_0308["division"]["init"]["MMR"] ) )
        return;

    var_0 = self._id_0308["division"]["init"]["MMR"];
    var_1 = var_0;
    self._id_0308["division"]["matchPrediction"] = "tie";

    if ( !isdefined( self._id_04A7 ) )
        return;
    else if ( self._id_04A7 == "axis" )
        var_1 = level.teammmr["allies"];
    else if ( self._id_04A7 == "allies" )
        var_1 = level.teammmr["axis"];
    else
        return;

    if ( var_0 < var_1 - 25 )
        self._id_0308["division"]["matchPrediction"] = "loss";

    if ( var_0 > var_1 + 25 )
        self._id_0308["division"]["matchPrediction"] = "win";
}

getdivisionpointsdelta( var_0, var_1 )
{
    var_2 = _func_1BF( "mp/divisiontable.csv", 0, var_0 );

    if ( var_1 == "win" )
        return _func_0BC( _func_1BC( "mp/divisiontable.csv", var_2, 1 ) );

    if ( var_1 == "loss" )
        return _func_0BC( _func_1BC( "mp/divisiontable.csv", var_2, 3 ) );

    return _func_0BC( _func_1BC( "mp/divisiontable.csv", var_2, 2 ) );
}

getdivisionresetoffset()
{
    return _func_0BC( _func_1BB( "mp/divisiontable.csv", 0, "resetOffset", 1 ) );
}

setplayermmr( var_0 )
{
    if ( !isdefined( self._id_0308["division"]["init"]["MMR"] ) )
        return;

    var_1 = self._id_0308["division"]["init"]["MMR"];

    if ( var_0 < 0 && var_1 < 0 - var_0 )
        var_0 = 0 - var_1;

    if ( 65535 - var_1 < var_0 )
        var_0 = 65535 - var_1;

    var_1 += var_0;
    self._id_0308["division"]["MMR"] = var_1;
    savemmr();
}

checkforfeit()
{
    var_0["allies"] = 0;
    var_0["axis"] = 0;

    foreach ( var_2 in level._id_0323 )
    {
        if ( isdefined( var_2._id_04A7 ) && isdefined( var_0[var_2._id_04A7] ) )
            var_0[var_2._id_04A7]++;
    }

    foreach ( var_2 in level._id_0323 )
    {
        if ( isdefined( var_2._id_04A7 ) )
        {
            if ( var_2._id_04A7 == "allies" && var_0["axis"] == 0 )
            {
                var_2._id_0308["division"]["wonByForfeit"] = 1;
                continue;
            }

            if ( var_2._id_04A7 == "axis" && var_0["allies"] == 0 )
            {
                var_2._id_0308["division"]["wonByForfeit"] = 1;
                continue;
            }

            var_2._id_0308["division"]["wonByForfeit"] = 0;
        }
    }
}

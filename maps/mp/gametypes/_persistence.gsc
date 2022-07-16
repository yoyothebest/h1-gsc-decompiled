// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_67DA = [];
    maps\mp\gametypes\_class::init();
    maps\mp\gametypes\_misions::init();
    maps\mp\gametypes\_playercards::init();
    maps\mp\gametypes\_rank::init();

    if ( getdvarint( "virtualLobbyActive", 0 ) > 0 )
        return;

    level thread _id_9AFA();
    level thread _id_9BCA();
}

_id_4D95()
{
    self._id_1838 = [];

    if ( maps\mp\_utility::_id_7139() )
    {
        self._id_1838["totalShots"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "totalShots" );
        self._id_1838["accuracy"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "accuracy" );
        self._id_1838["misses"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "misses" );
        self._id_1838["hits"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "hits" );
        self._id_1838["timePlayedAllies"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "timePlayedAllies" );
        self._id_1838["timePlayedOpfor"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "timePlayedOpfor" );
        self._id_1838["timePlayedOther"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "timePlayedOther" );
        self._id_1838["timePlayedTotal"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "timePlayedTotal" );
    }

    self._id_1837 = [];
    self._id_1837["round"] = [];
    self._id_1837["round"]["timePlayed"] = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "round", "timePlayed" );
}

_id_8D68( var_0 )
{
    return self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), var_0 );
}

_id_8D78( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 );
}

_id_8D50( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    if ( isdefined( var_2 ) )
    {
        var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), var_0, var_2 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), var_0, var_2, var_1 + var_3 );
    }
    else
    {
        var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), var_0 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 + var_3 );
    }
}

_id_8D6A( var_0, var_1 )
{
    if ( var_0 == "round" )
        return self _meth_8226( common_scripts\utility::getstatsgroup_common(), var_0, var_1 );
    else
        return self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 );
}

_id_8D7A( var_0, var_1, var_2 )
{
    if ( _func_1FF( self ) )
        return;

    if ( maps\mp\_utility::_id_4FA6() )
        return;

    if ( var_0 == "round" )
        self _meth_8243( common_scripts\utility::getstatsgroup_common(), var_0, var_1, var_2 );
    else
    {
        if ( !maps\mp\_utility::_id_7139() )
            return;

        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1, var_2 );
    }
}

_id_8D53( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1 );
    self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), var_0, var_1, var_3 + var_2 );
}

_id_8D6B( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return 0;

    return self._id_1837[var_0][var_1];
}

_id_8D7B( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    self._id_1837[var_0][var_1] = var_2;
}

_id_8D54( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_3 = _id_8D6B( var_0, var_1 );
    _id_8D7B( var_0, var_1, var_3 + var_2 );
}

_id_8D52( var_0, var_1, var_2 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_3 = _id_8D69( var_0 ) + var_1;

    if ( var_3 > var_2 )
        var_3 = var_2;

    if ( var_3 < _id_8D69( var_0 ) )
        var_3 = var_2;

    _id_8D79( var_0, var_3 );
}

_id_8D55( var_0, var_1, var_2, var_3 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_4 = _id_8D6B( var_0, var_1 ) + var_2;

    if ( var_4 > var_3 )
        var_4 = var_3;

    if ( var_4 < _id_8D6B( var_0, var_1 ) )
        var_4 = var_3;

    _id_8D7B( var_0, var_1, var_4 );
}

_id_8D69( var_0 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return 0;

    return self._id_1838[var_0];
}

_id_8D79( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    self._id_1838[var_0] = var_1;
}

_id_8D51( var_0, var_1 )
{
    if ( !maps\mp\_utility::_id_7139() )
        return;

    var_2 = _id_8D69( var_0 );
    _id_8D79( var_0, var_2 + var_1 );
}

_id_9AFA()
{
    wait 0.15;
    var_0 = 0;

    while ( !level._id_3BDA )
    {
        maps\mp\gametypes\_hostmigration::_id_A0DD();
        var_0++;

        if ( var_0 >= level._id_0323.size )
            var_0 = 0;

        if ( isdefined( level._id_0323[var_0] ) )
        {
            level._id_0323[var_0] _id_A360();
            level._id_0323[var_0] _id_9BA4();
        }

        wait 2.0;
    }

    foreach ( var_2 in level._id_0323 )
    {
        var_2 _id_A360();
        var_2 _id_9BA4();
    }
}

_id_A360()
{
    var_0 = maps\mp\_utility::_id_7139();

    if ( var_0 )
    {
        foreach ( var_3, var_2 in self._id_1838 )
            self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), var_3, var_2 );
    }

    foreach ( var_3, var_2 in self._id_1837 )
    {
        foreach ( var_7, var_6 in var_2 )
        {
            if ( var_3 == "round" )
            {
                self _meth_8243( common_scripts\utility::getstatsgroup_common(), var_3, var_7, var_6 );
                continue;
            }

            if ( var_0 )
                self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), var_3, var_7, var_6 );
        }
    }
}

_id_4C40( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::_id_513D( var_0 ) )
        return;

    if ( isdefined( level._id_2B2E ) && level._id_2B2E )
        return;

    if ( maps\mp\_utility::_id_7139() )
    {
        var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "weaponStats", var_0, var_1 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "weaponStats", var_0, var_1, var_3 + var_2 );
    }
}

_id_4C3D( var_0, var_1, var_2 )
{
    if ( maps\mp\_utility::_id_7139() )
    {
        var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "attachmentsStats", var_0, var_1 );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "attachmentsStats", var_0, var_1, var_3 + var_2 );
    }
}

incrementmeleestat( var_0 )
{
    if ( maps\mp\_utility::_id_7139() )
    {
        if ( !isdefined( var_0 ) )
            var_0 = 1;

        var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "meleeKills" );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "meleeKills", var_1 + var_0 );
    }
}

incrementdestructiblestat( var_0 )
{
    if ( maps\mp\_utility::_id_7139() )
    {
        if ( !isdefined( var_0 ) )
            var_0 = 1;

        var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "destructibleKills" );
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "destructibleKills", var_1 + var_0 );
    }
}

doesattachkitincludebaseattachment( var_0, var_1 )
{
    var_2 = "mp/attachkits.csv";
    var_3 = 1;
    var_4 = 2;
    var_5 = 5;
    var_6 = _func_1BF( var_2, var_3, var_0 );

    if ( var_6 < 0 )
        return 0;

    for ( var_7 = var_4; var_7 <= var_5; var_7++ )
    {
        var_8 = _func_1BC( var_2, var_6, var_7 );

        if ( var_8 == var_1 )
            return 1;

        if ( var_8 == "" )
            return 0;
    }

    return 0;
}

_id_9BA4()
{
    if ( !isdefined( self._id_94FB ) )
        return;

    if ( self._id_94FB == "" || self._id_94FB == "none" )
        return;

    var_0 = self._id_94FB;

    if ( maps\mp\_utility::_id_513D( var_0 ) || maps\mp\_utility::_id_50FE( var_0 ) )
        return;

    var_1 = maps\mp\_utility::_id_416C( var_0 );

    if ( var_1[0] == "iw5" || var_1[0] == "h1" )
        var_1[0] = var_1[0] + "_" + var_1[1];

    if ( var_1[0] == "alt" )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 == "glmwr" )
            {
                var_1[0] = "glmwr";
                break;
                continue;
            }

            if ( var_3 == "masterkeymwr" )
            {
                var_1[0] = "masterkeymwr";
                break;
                continue;
            }

            if ( _func_122( var_3, 0, 2 ) == "a#" )
            {
                var_4 = _func_122( var_3, 2 );

                if ( doesattachkitincludebaseattachment( var_4, "glmwr" ) )
                {
                    var_1[0] = "glmwr";
                    break;
                }
                else if ( doesattachkitincludebaseattachment( var_4, "masterkeymwr" ) )
                {
                    var_1[0] = "masterkeymwr";
                    break;
                }
            }
        }

        if ( var_1[0] == "alt" )
            var_1[0] = var_1[1] + "_" + var_1[2];
    }

    if ( var_1[0] == "glmwr" || var_1[0] == "masterkeymwr" )
    {
        if ( self._id_94FC > 0 )
            _id_4C3D( var_1[0], "shots", self._id_94FC );

        if ( self._id_94FA > 0 )
            _id_4C3D( var_1[0], "kills", self._id_94FA );

        if ( self._id_94F9 > 0 )
            _id_4C3D( var_1[0], "hits", self._id_94F9 );

        if ( self._id_94F7 > 0 )
            _id_4C3D( var_1[0], "headShots", self._id_94F7 );

        if ( self._id_94F6 > 0 )
            _id_4C3D( var_1[0], "deaths", self._id_94F6 );

        if ( self._id_94F8 > 0 )
            _id_4C3D( var_1[0], "hipfirekills", self._id_94F8 );

        if ( self._id_94FD > 0 )
            _id_4C3D( var_1[0], "timeInUse", self._id_94FD );

        self._id_94FB = "none";
        self._id_94FC = 0;
        self._id_94FA = 0;
        self._id_94F9 = 0;
        self._id_94F7 = 0;
        self._id_94F6 = 0;
        self._id_94F8 = 0;
        self._id_94FD = 0;
        return;
    }

    if ( !maps\mp\_utility::_id_50D1( var_1[0] ) && !maps\mp\_utility::_id_50D2( var_1[0] ) && !maps\mp\_utility::iscacmeleeweapon( var_1[0] ) )
        return;

    if ( self._id_94FC > 0 )
    {
        _id_4C40( var_1[0], "shots", self._id_94FC );
        maps\mp\_matchdata::_id_584C( var_1[0], "shots", self._id_94FC );
    }

    if ( self._id_94FA > 0 )
    {
        _id_4C40( var_1[0], "kills", self._id_94FA );
        maps\mp\_matchdata::_id_584C( var_1[0], "kills", self._id_94FA );
    }

    if ( self._id_94F9 > 0 )
    {
        _id_4C40( var_1[0], "hits", self._id_94F9 );
        maps\mp\_matchdata::_id_584C( var_1[0], "hits", self._id_94F9 );
    }

    if ( self._id_94F7 > 0 )
    {
        _id_4C40( var_1[0], "headShots", self._id_94F7 );
        maps\mp\_matchdata::_id_584C( var_1[0], "headShots", self._id_94F7 );
    }

    if ( self._id_94F6 > 0 )
    {
        _id_4C40( var_1[0], "deaths", self._id_94F6 );
        maps\mp\_matchdata::_id_584C( var_1[0], "deaths", self._id_94F6 );
    }

    if ( self._id_94F8 > 0 )
    {
        _id_4C40( var_1[0], "hipfirekills", self._id_94F8 );
        maps\mp\_matchdata::_id_584C( var_1[0], "hipfirekills", self._id_94F8 );
    }

    if ( self._id_94FD > 0 )
    {
        _id_4C40( var_1[0], "timeInUse", self._id_94FD );
        maps\mp\_matchdata::_id_584C( var_1[0], "timeInUse", self._id_94FD );
    }

    var_6 = _func_061( var_0 );

    foreach ( var_8 in var_6 )
    {
        var_9 = maps\mp\_utility::_id_0E02( var_8 );

        if ( var_9 == "bloodmwr" )
            continue;

        if ( var_9 == "glmwr" || var_9 == "masterkeymwr" )
            continue;

        if ( var_9 == "glpremwr" || var_9 == "masterkeypremwr" )
            continue;

        if ( self._id_94FC > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "shots", self._id_94FC );
        }

        if ( self._id_94FA > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "kills", self._id_94FA );
        }

        if ( self._id_94F9 > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "hits", self._id_94F9 );
        }

        if ( self._id_94F7 > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "headShots", self._id_94F7 );
        }

        if ( self._id_94F8 > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "hipfirekills", self._id_94F8 );
        }

        if ( self._id_94FD > 0 )
        {
            if ( var_9 != "tacknifemwr" )
                _id_4C3D( var_9, "timeInUse", self._id_94FD );
        }

        if ( self._id_94F6 > 0 )
            _id_4C3D( var_9, "deaths", self._id_94F6 );
    }

    self._id_94FB = "none";
    self._id_94FC = 0;
    self._id_94FA = 0;
    self._id_94F9 = 0;
    self._id_94F7 = 0;
    self._id_94F6 = 0;
    self._id_94F8 = 0;
    self._id_94FD = 0;
}

_id_9BCA()
{
    level waittill( "game_ended" );

    if ( !maps\mp\_utility::_id_59E3() )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    foreach ( var_7 in level._id_0323 )
        var_5 += var_7._id_9372["total"];

    _func_0FF( "global_minutes", _func_0BC( var_5 / 60 ) );

    if ( !maps\mp\_utility::_id_A1CA() )
        return;

    wait 0.05;

    foreach ( var_7 in level._id_0323 )
    {
        var_0 += var_7._id_0239;
        var_1 += var_7._id_010D;
        var_2 += var_7.assists;
        var_3 += var_7._id_01E5;
        var_4 += var_7._id_8FAF;
    }

    _func_0FF( "global_kills", var_0 );
    _func_0FF( "global_deaths", var_1 );
    _func_0FF( "global_assists", var_2 );
    _func_0FF( "global_headshots", var_3 );
    _func_0FF( "global_suicides", var_4 );
    _func_0FF( "global_games", 1 );
}

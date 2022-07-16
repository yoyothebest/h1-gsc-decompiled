// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    _id_9BB8();

    if ( isdefined( level._id_0318 ) )
        _id_9BB7( level._id_0318 );
}

_id_9BB8()
{
    level._id_9BAF = [];
    level._id_9BAF["kills"] = "ch_kills";
    level._id_9BAF["headshots"] = "ch_headshots";
    level._id_9BAF["kills_grenades"] = "ch_frag_kills";
    level._id_9BAF["intel"] = "ch_intel";
    level._id_9BAD = [];
    level._id_9BAB = [];
    level._id_9BAE = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = _func_0BC( _func_1BC( "sp/upgrade_challenges.csv", var_0, 0 ) );
        var_2 = _func_1BC( "sp/upgrade_challenges.csv", var_0, 1 );

        if ( var_2 == "" )
            break;

        level._id_9BAD[var_2] = var_1;
        level._id_9BAC[var_1] = [];
        level._id_9BAB[var_1] = _func_1BC( "sp/upgrade_challenges.csv", var_0, 4 );
        level._id_9BAE[var_1] = 0;
        var_3 = 10;

        for (;;)
        {
            var_4 = _func_0BC( _func_1BC( "sp/upgrade_challenges.csv", var_0, var_3 ) );

            if ( var_4 <= 0 )
                break;

            level._id_9BAC[var_1][level._id_9BAC[var_1].size] = var_4;
            var_3++;
        }

        var_0++;
    }
}

_id_9BB7( var_0 )
{
    var_0 _id_A56F::_id_8D4D( ::_id_9BBA );

    if ( isdefined( level._id_9BAD ) && level._id_9BAD.size > 0 )
    {
        var_0._id_8D77["upgradeChallengeStage"] = [];
        var_0._id_8D77["upgradeChallengeProgress"] = [];

        if ( !isdefined( var_0._id_8D77["upgradePoints"] ) )
            var_0._id_8D77["upgradePoints"] = 0;

        foreach ( var_3, var_2 in level._id_9BAF )
            var_0 _id_9BBA( var_3, 0 );
    }
}

_id_41CF( var_0 )
{
    _id_9BBA( "kills", var_0 );
}

_id_41CE( var_0 )
{
    _id_9BBA( "headshots", var_0 );
    _id_41CF( var_0 );
}

_id_41CD( var_0 )
{
    _id_9BBA( "kills_grenades", var_0 );
    _id_41CF( var_0 );
}

_id_9BBA( var_0, var_1 )
{
    if ( isdefined( level._id_9BAF ) && isdefined( level._id_9BAF[var_0] ) )
    {
        if ( !isdefined( level._id_9BAD[level._id_9BAF[var_0]] ) )
            return;

        var_2 = level._id_9BAD[level._id_9BAF[var_0]];
        var_3 = getomnvar( "ui_pm_t_" + var_0 );
        setomnvar( "ui_pm_t_" + var_0, var_3 + var_1 );

        if ( var_0 == "intel" )
        {
            var_4 = _func_0BC( self _meth_8212( "sp_upgradeChallengeStage_" + var_2 ) );

            if ( !isdefined( self._id_8D77["upgradeChallengeStage"][var_0] ) )
            {
                self._id_8D77["intelUpgradePoints"] = 0;
                setomnvar( "ui_pm_g_start_intel", var_4 );
            }

            self._id_8D77["upgradeChallengeStage"][var_0] = var_4;
            var_5 = _func_0BC( self _meth_8212( "sp_upgradeChallengeProgress_" + var_2 ) );

            if ( !isdefined( self._id_8D77["upgradeChallengeProgress"][var_0] ) )
                setomnvar( "ui_pm_p_start_intel", var_5 );

            self._id_8D77["upgradeChallengeProgress"][var_0] = var_5;
        }
        else
        {
            var_4 = 0;

            if ( !isdefined( self._id_8D77["upgradeChallengeStage"][var_0] ) )
            {
                var_4 = _func_0BC( self _meth_8212( "sp_upgradeChallengeStage_" + var_2 ) );
                self._id_8D77["upgradeChallengeStage"][var_0] = var_4;
            }
            else
                var_4 = self._id_8D77["upgradeChallengeStage"][var_0];

            var_5 = 0;

            if ( !isdefined( self._id_8D77["upgradeChallengeProgress"][var_0] ) )
            {
                var_5 = _func_0BC( self _meth_8212( "sp_upgradeChallengeProgress_" + var_2 ) );
                self._id_8D77["upgradeChallengeProgress"][var_0] = var_5;
            }
            else
                var_5 = self._id_8D77["upgradeChallengeProgress"][var_0];
        }

        var_6 = level._id_9BAC[var_2].size - 1;
        var_7 = level._id_9BAC[var_2][var_6];

        if ( var_4 >= var_6 && var_5 >= var_7 )
        {
            setomnvar( "ui_pm_g_" + var_0, level._id_9BAC[var_2][var_6] );
            setomnvar( "ui_pm_p_" + var_0, var_7 );
            return;
        }

        var_8 = level._id_9BAC[var_2][var_4];
        var_9 = var_5;
        var_5 += var_1;
        var_10 = 0;

        while ( var_4 <= var_6 && var_5 >= var_8 && !var_10 )
        {
            _func_2B7( level._id_9BAB[var_2] );

            if ( var_0 == "intel" )
                _id_9BB1( var_2 );
            else
                _id_9BB0( var_2 );

            if ( var_4 >= var_6 && var_5 >= var_7 )
            {
                var_5 = var_7;
                var_10 = 1;
                continue;
            }

            var_5 -= var_8;
            var_4++;

            if ( var_4 <= var_6 )
                var_8 = level._id_9BAC[var_2][var_4];
        }

        self._id_8D77["upgradeChallengeStage"][var_0] = var_4;
        self._id_8D77["upgradeChallengeProgress"][var_0] = var_5;
        setomnvar( "ui_pm_g_" + var_0, level._id_9BAC[var_2][var_4] );
        setomnvar( "ui_pm_p_" + var_0, var_5 );

        if ( var_0 == "intel" )
            _id_20BE( var_0, 1 );
    }
}

_id_9BB1( var_0, var_1 )
{
    _id_20BF( 1 );
    self._id_8D77["intelUpgradePoints"]++;
    level._id_9BAE[var_0] = self._id_8D77["intelUpgradePoints"];
    var_2 = _func_1BC( "sp/upgrade_challenges.csv", var_0, 6 );
    setomnvar( var_2, level._id_9BAE[var_0] );
}

_id_9BB0( var_0 )
{
    if ( !isdefined( self._id_8D77["upgradePoints"] ) )
        self._id_8D77["upgradePoints"] = 0;

    self._id_8D77["upgradePoints"]++;
    level._id_9BAE[var_0] += 1;
    var_1 = _func_1BC( "sp/upgrade_challenges.csv", var_0, 6 );
    setomnvar( var_1, level._id_9BAE[var_0] );
}

_id_20BF( var_0 )
{
    if ( isdefined( level._id_0318 ) )
    {
        var_1 = level._id_0318;
        var_2 = _func_0BC( var_1 _meth_8212( "sp_upgradePoints" ) );
        var_3 = var_2 + var_0;

        if ( var_3 > var_2 )
            var_1 _meth_8213( "sp_upgradePoints", var_3 );
    }
}

_id_20BE( var_0, var_1 )
{
    if ( isdefined( level._id_0318 ) )
    {
        var_2 = level._id_0318;
        var_3 = level._id_9BAD[level._id_9BAF[var_0]];
        var_4 = 0;

        if ( isdefined( var_2._id_8D77["upgradeChallengeStage"][var_0] ) )
        {
            var_4 = var_2._id_8D77["upgradeChallengeStage"][var_0];
            var_5 = _func_0BC( var_2 _meth_8212( "sp_upgradeChallengeStage_" + var_3 ) );

            if ( var_4 > var_5 )
                var_2 _meth_8213( "sp_upgradeChallengeStage_" + var_3, var_4 );
        }

        var_6 = 0;

        if ( isdefined( var_2._id_8D77["upgradeChallengeProgress"][var_0] ) )
        {
            var_6 = var_2._id_8D77["upgradeChallengeProgress"][var_0];
            var_7 = _func_0BC( var_2 _meth_8212( "sp_upgradeChallengeProgress_" + var_3 ) );

            if ( var_6 != var_7 )
                var_2 _meth_8213( "sp_upgradeChallengeProgress_" + var_3, var_6 );
        }

        if ( var_1 )
            updategamerprofileall();
    }
}

_id_20C0()
{
    if ( isdefined( level._id_0318 ) )
    {
        var_0 = level._id_0318;
        _id_20BF( var_0._id_8D77["upgradePoints"] );

        if ( isdefined( level._id_9BAF ) )
        {
            foreach ( var_4, var_2 in level._id_9BAF )
            {
                if ( var_4 == "intel" )
                    continue;

                var_3 = var_4;

                if ( !isdefined( level._id_9BAD[level._id_9BAF[var_3]] ) )
                    continue;

                if ( !isdefined( level._id_9BAF[var_3] ) )
                    continue;

                _id_20BE( var_3, 0 );
            }
        }

        updategamerprofileall();
    }
}

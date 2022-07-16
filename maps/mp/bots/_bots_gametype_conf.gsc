// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    _id_805A();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::_id_15DE;
}

_id_805A()
{
    level._id_170A = 200;
    level._id_1709 = 38;

    if ( maps\mp\_utility::_id_50C4() )
        level._id_1709 += 170;
}

_id_15DE()
{
    self notify( "bot_conf_think" );
    self endon( "bot_conf_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_60C2 = gettime() + 500;
    self._id_9107 = [];
    childthread _id_1735();

    if ( self._id_67DF == "camper" )
    {
        self._id_20E7 = 0;

        if ( !isdefined( self._id_20E8 ) )
            self._id_20E8 = 0;
    }

    for (;;)
    {
        var_0 = isdefined( self._id_90BE );
        var_1 = 0;

        if ( var_0 && self _meth_8363() )
        {
            var_2 = self _meth_8358();

            if ( maps\mp\bots\_bots_util::_id_172A( self._id_90BE._id_4411, var_2 ) )
            {
                if ( self _meth_8373() )
                    var_1 = 1;
            }
            else if ( maps\mp\bots\_bots_strategy::_id_1649( "kill_tag" ) && self._id_90BE maps\mp\gametypes\_gameobjects::_id_1ACA( self._id_04A7 ) )
            {
                self._id_90BE = undefined;
                var_0 = 0;
            }
        }

        self _meth_834F( "force_sprint", var_1 );
        self._id_9107 = _id_16CE( self._id_9107 );
        var_3 = _id_1610( self._id_9107, 1 );
        var_4 = isdefined( var_3 );

        if ( var_0 && !var_4 || !var_0 && var_4 || var_0 && var_4 && self._id_90BE != var_3 )
        {
            self._id_90BE = var_3;
            self _meth_8354();
            self notify( "stop_camping_tag" );
            maps\mp\bots\_bots_personality::_id_1EA3();
            maps\mp\bots\_bots_strategy::_id_15A1( "kill_tag" );
        }

        if ( isdefined( self._id_90BE ) )
        {
            self._id_20E8 = 0;

            if ( self._id_67DF == "camper" && self._id_20E7 )
            {
                self._id_20E8 = 1;

                if ( maps\mp\bots\_bots_personality::_id_8476() )
                {
                    if ( maps\mp\bots\_bots_personality::_id_3753( self._id_90BE._id_4411, 1000 ) )
                        childthread _id_15C3( self._id_90BE, "camp" );
                    else
                        self._id_20E8 = 0;
                }
            }

            if ( !self._id_20E8 )
            {
                if ( !maps\mp\bots\_bots_strategy::_id_1649( "kill_tag" ) )
                {
                    var_5 = spawnstruct();
                    var_5._id_79FF = "objective";
                    var_5._id_62F3 = level._id_170A;
                    maps\mp\bots\_bots_strategy::_id_16A9( "kill_tag", self._id_90BE._id_4411, 25, var_5 );
                }
            }
        }

        var_6 = 0;

        if ( isdefined( self._id_07EB ) )
            var_6 = self [[ self._id_07EB ]]();

        if ( !isdefined( self._id_90BE ) )
        {
            if ( !var_6 )
                self [[ self._id_67E1 ]]();
        }

        if ( gettime() > self._id_60C2 )
        {
            self._id_60C2 = gettime() + 500;
            var_7 = _id_1617( 1 );
            self._id_9107 = _id_15DD( var_7, self._id_9107 );
        }

        wait 0.05;
    }
}

_id_15D4( var_0 )
{
    if ( isdefined( var_0._id_6445 ) && var_0._id_6445 )
    {
        var_1 = self._id_02E2 + ( 0, 0, 55 );

        if ( _func_225( var_0._id_24C8, var_1 ) < 144 )
        {
            var_2 = var_0._id_24C8[2] - var_1[2];

            if ( var_2 > 0 )
            {
                if ( var_2 < level._id_1709 )
                {
                    if ( !isdefined( self._id_5565 ) )
                        self._id_5565 = 0;

                    if ( gettime() - self._id_5565 > 3000 )
                    {
                        self._id_5565 = gettime();
                        thread _id_1668();
                    }
                }
                else
                {
                    var_0._id_6445 = 0;
                    return 1;
                }
            }
        }
    }

    return 0;
}

_id_1668()
{
    self endon( "death" );
    self endon( "disconnect" );
    self _meth_8350( "stand" );
    wait 1.0;
    self _meth_837C( "jump" );
    wait 0.5;

    if ( maps\mp\_utility::_id_50C4() )
        self _meth_837C( "jump" );

    wait 0.5;
    self _meth_8350( "none" );
}

_id_1735()
{
    for (;;)
    {
        level waittill( "new_tag_spawned", var_0 );
        self._id_60C2 = -1;

        if ( isdefined( var_0 ) )
        {
            if ( isdefined( var_0._id_9E07 ) && var_0._id_9E07 == self || isdefined( var_0.attacker ) && var_0.attacker == self )
            {
                if ( !isdefined( var_0._id_6445 ) && !isdefined( var_0._id_19E7 ) )
                {
                    thread _id_19D5( var_0 );
                    _id_A0BC( var_0 );

                    if ( var_0._id_6445 )
                    {
                        var_1 = spawnstruct();
                        var_1._id_02E2 = var_0._id_24C8;
                        var_1._id_0428 = var_0;
                        var_2[0] = var_1;
                        self._id_9107 = _id_15DD( var_2, self._id_9107 );
                    }
                }
            }
        }
    }
}

_id_15DD( var_0, var_1 )
{
    var_2 = var_1;

    foreach ( var_4 in var_0 )
    {
        var_5 = 0;

        foreach ( var_7 in var_1 )
        {
            if ( var_4._id_0428 == var_7._id_0428 && maps\mp\bots\_bots_util::_id_172A( var_4._id_02E2, var_7._id_02E2 ) )
            {
                var_5 = 1;
                break;
            }
        }

        if ( !var_5 )
            var_2 = common_scripts\utility::_id_0CDA( var_2, var_4 );
    }

    return var_2;
}

_id_1665( var_0, var_1, var_2 )
{
    if ( !var_0._id_19DB )
    {
        var_0._id_6071 = _func_0C8( var_0._id_24C8 );
        var_0._id_19DB = 1;
    }

    if ( isdefined( var_0._id_19E7 ) )
        return 0;

    var_3 = var_0._id_6071;
    var_4 = !isdefined( var_0._id_6445 );

    if ( isdefined( var_3 ) && ( var_4 || var_0._id_6445 ) )
    {
        var_5 = var_3 == var_1 || _func_204( var_3, var_1, 1 );

        if ( var_5 )
        {
            var_6 = common_scripts\utility::_id_A347( self._id_02E2, self _meth_8338(), var_0._id_24C8, var_2 );

            if ( var_6 )
            {
                if ( var_4 )
                {
                    thread _id_19D5( var_0 );
                    _id_A0BC( var_0 );

                    if ( !var_0._id_6445 )
                        return 0;
                }

                return 1;
            }
        }
    }

    return 0;
}

_id_1617( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( var_1 ) )
        var_3 = var_1;
    else
        var_3 = self _meth_8385();

    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_2;
    else
        var_4 = self _meth_8371();

    var_5 = [];

    if ( isdefined( var_3 ) )
    {
        foreach ( var_7 in level._id_2CDF )
        {
            if ( var_7 maps\mp\gametypes\_gameobjects::_id_1ACA( self._id_04A7 ) )
            {
                var_8 = 0;

                if ( !var_0 || var_7.attacker == self )
                {
                    if ( !isdefined( var_7._id_19E7 ) )
                    {
                        if ( !isdefined( var_7._id_6445 ) )
                        {
                            level thread _id_19D5( var_7 );
                            _id_A0BC( var_7 );
                        }

                        var_8 = _func_0F0( self._id_02E2, var_7._id_4411 ) < 1000000 && var_7._id_6445;
                    }
                }
                else if ( _id_1665( var_7, var_3, var_4 ) )
                    var_8 = 1;

                if ( var_8 )
                {
                    var_9 = spawnstruct();
                    var_9._id_02E2 = var_7._id_24C8;
                    var_9._id_0428 = var_7;
                    var_5 = common_scripts\utility::_id_0CDA( var_5, var_9 );
                }
            }
        }
    }

    return var_5;
}

_id_19D5( var_0 )
{
    var_0 endon( "reset" );
    var_0._id_19E7 = 1;
    var_0._id_6445 = maps\mp\bots\_bots_util::_id_16BB( var_0._id_24C8, undefined, level._id_1709 + 55 );

    if ( var_0._id_6445 )
    {
        var_0._id_4411 = _func_091( var_0._id_24C8, 32 );

        if ( !isdefined( var_0._id_4411 ) )
            var_0._id_6445 = 0;
    }

    var_0._id_19E7 = undefined;
}

_id_A0BC( var_0 )
{
    while ( !isdefined( var_0._id_6445 ) )
        wait 0.05;
}

_id_1610( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.size > 0 )
    {
        var_3 = 1409865409;

        foreach ( var_5 in var_0 )
        {
            var_6 = _id_3DF7( var_5._id_0428 );

            if ( !var_1 || var_6 < 2 )
            {
                var_7 = _func_0F0( var_5._id_0428._id_4411, self._id_02E2 );

                if ( var_7 < var_3 )
                {
                    var_2 = var_5._id_0428;
                    var_3 = var_7;
                }
            }
        }
    }

    return var_2;
}

_id_16CE( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_0428 maps\mp\gametypes\_gameobjects::_id_1ACA( self._id_04A7 ) && maps\mp\bots\_bots_util::_id_172A( var_3._id_0428._id_24C8, var_3._id_02E2 ) )
        {
            if ( !_id_15D4( var_3._id_0428 ) && var_3._id_0428._id_6445 )
                var_1 = common_scripts\utility::_id_0CDA( var_1, var_3 );
        }
    }

    return var_1;
}

_id_3DF7( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_669D )
    {
        if ( !isdefined( var_3._id_04A7 ) )
            continue;

        if ( var_3._id_04A7 == self._id_04A7 && var_3 != self )
        {
            if ( _func_0CF( var_3 ) )
            {
                if ( isdefined( var_3._id_90BE ) && var_3._id_90BE == var_0 )
                    var_1++;

                continue;
            }

            if ( _func_0F0( var_3._id_02E2, var_0._id_24C8 ) < 160000 )
                var_1++;
        }
    }

    return var_1;
}

_id_15C3( var_0, var_1, var_2 )
{
    self notify( "bot_camp_tag" );
    self endon( "bot_camp_tag" );
    self endon( "stop_camping_tag" );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    self _meth_8353( self._id_6121, var_1, self._id_0B68 );
    var_3 = maps\mp\bots\_bots_util::_id_172E();

    if ( var_3 == "goal" )
    {
        var_4 = var_0._id_6071;

        if ( isdefined( var_4 ) )
        {
            var_5 = _func_212( self._id_02E2 );
            var_5 = common_scripts\utility::_id_0CDA( var_5, var_4 );
            childthread maps\mp\bots\_bots_util::_id_1736( var_5 );
        }
    }
}

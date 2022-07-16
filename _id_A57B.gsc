// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5F21( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_8C36 + "_playerstart";

    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        _id_A5A4::_id_923E( var_1 );
}

_id_88FC( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_4 = getentarray( var_1, "script_noteworthy" );
    var_5 = [];
    var_6 = 0;
    var_7 = [];

    foreach ( var_9 in var_4 )
    {
        if ( _func_1A2( var_9 ) )
            var_5[var_5.size] = var_9;
    }

    var_11 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    var_12 = 0;

    foreach ( var_14 in var_5 )
    {
        var_15 = var_14 _id_A5A4::_id_88C3( 1 );

        if ( var_2 )
            var_15 thread _id_A5A4::_id_7402();

        var_15 _meth_81CA( var_11._id_02E2, var_11.angles );
        var_15 _meth_81AA( var_15._id_02E2 );
        var_7 = common_scripts\utility::_id_0CDA( var_7, var_15 );
        var_12++;

        if ( isdefined( var_3 ) && var_12 >= var_3 )
            return var_7;
    }

    return var_7;
}

_id_8264( var_0, var_1 )
{
    self _meth_8132( 0 );
    self _meth_831A();
    self _meth_831C();
    self _meth_811A( 1 );
    self _meth_811B( 0 );
    self _meth_811C( 0 );
    self _meth_8301( 0 );
    _func_0D6( "ammoCounterHide", 1 );

    if ( isdefined( var_0 ) && var_0 )
    {
        var_2 = 0;

        for ( var_3 = 0; self _meth_8180() != "stand"; var_3 += 0.05 )
        {
            self _meth_8181( "stand" );
            waittillframeend;
        }

        while ( self _meth_812E() || self _meth_8334() || self _meth_830E( 0 ) != "none" )
        {
            waittillframeend;
            var_3 += 0.05;
        }

        if ( isdefined( var_1 ) && var_1 > var_3 )
            wait(var_1 - var_3);
    }
}

_id_8263()
{
    _func_0D6( "ammoCounterHide", 0 );
    self _meth_8301( 1 );
    self _meth_811C( 1 );
    self _meth_811B( 1 );
    self _meth_811A( 1 );
    self _meth_831D();
    self _meth_831B();
    self _meth_8132( 1 );
}

_id_5EBC()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( !isdefined( var_1._id_87E2 ) )
        {
            var_1._id_87E2 = var_1 _id_A546::_id_23ED( "default", 1.75 );
            var_1._id_87E2._id_01F3 = "center";
            var_1._id_87E2._id_0501 = "top";
            var_1._id_87E2.alignx = "center";
            var_1._id_87E2.aligny = "top";
            var_1._id_87E2._id_0530 = 0;
            var_1._id_87E2._id_0538 = 20;
            var_1._id_87E2 _meth_80CC( &"VARIABLE_SCOPE_SNIPER_ZOOM" );
            var_1._id_87E2.alpha = 0;
            var_1._id_87E2._id_03D4 = 0.5;
            var_1._id_87E2._id_0198 = 1;
        }

        var_1._id_3A03 = 1;
    }

    var_3 = 0;
    level._id_0323[0]._id_87D2 = "cg_playerFovScale0";

    if ( level._id_0323.size == 2 )
        level._id_0323[1]._id_87D2 = "cg_playerFovScale1";

    foreach ( var_1 in level._id_0323 )
    {
        var_1 thread _id_5E7E();
        var_1 thread _id_2B2C();
    }

    if ( !isdefined( level._id_9C64 ) )
        level._id_9C64 = [];

    var_6 = undefined;
    var_7 = undefined;

    for (;;)
    {
        var_8 = 0;
        var_7 = var_6;
        var_6 = undefined;

        foreach ( var_10 in level._id_9C64 )
        {
            foreach ( var_1 in level._id_0323 )
            {
                if ( var_1 _meth_830E() == var_10 && _func_1A1( var_1 ) )
                {
                    var_8 = 1;
                    var_6 = var_1;
                    break;
                }
            }

            if ( var_8 )
                break;
        }

        if ( var_8 && !var_6 _meth_8333() && !var_6 _meth_8334() )
        {
            if ( var_6 _id_A5A4::_id_50A9() && var_6 _meth_833B() )
            {
                var_6 _id_9939( var_3 );
                var_3 = 1;

                if ( isdefined( level._id_9C63 ) )
                {
                    var_14 = undefined;
                    var_15 = undefined;
                    var_16 = anglestoforward( var_6 _meth_8338() );
                    var_17 = var_6._id_02E2;

                    foreach ( var_19 in level._id_9C63 )
                    {
                        var_20 = anglestoforward( _func_115( var_19 - var_17 ) );
                        var_21 = _func_0F6( var_16, var_20 );

                        if ( !isdefined( var_14 ) || var_21 > var_15 )
                        {
                            var_14 = var_19;
                            var_15 = var_21;
                        }
                    }

                    if ( isdefined( var_14 ) )
                        _func_0D6( "sm_sunShadowCenter", var_14 );
                }
            }
            else if ( var_3 )
            {
                var_3 = 0;

                if ( isdefined( var_6 ) )
                    var_6 _id_9933();

                _func_0D6( "sm_sunShadowCenter", "0 0 0" );
            }
        }
        else if ( var_3 )
        {
            var_3 = 0;

            if ( isdefined( var_7 ) )
                var_7 _id_9933();

            _func_0D6( "sm_sunShadowCenter", "0 0 0" );
        }

        wait 0.05;
    }
}

_id_9939( var_0 )
{
    self _meth_831C();
    _func_0D6( self._id_87D2, self._id_3A03 );
    self._id_87E2.alpha = 1;

    if ( !var_0 )
        level notify( "variable_sniper_hud_enter" );
}

_id_9933()
{
    level notify( "variable_sniper_hud_exit" );
    self _meth_831D();
    _func_0D6( self._id_87D2, 1 );
    self._id_87E2.alpha = 0;
}

_id_5E7E()
{
    notifyoncommand( "mag_cycle", "+melee_zoom" );
    notifyoncommand( "mag_cycle", "+sprint_zoom" );

    for (;;)
    {
        self waittill( "mag_cycle" );

        if ( self._id_87E2.alpha )
        {
            if ( self._id_3A03 == 0.5 )
            {
                self._id_3A03 = 1;
                continue;
            }

            self._id_3A03 = 0.5;
        }
    }
}

_id_2B2C()
{
    self waittill( "death" );
    _id_9933();
}

_id_2A38( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_reminders" );
    level endon( "missionfailed" );
    var_5 = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = 10;

    if ( !isdefined( var_4 ) )
        var_4 = 20;

    while ( !common_scripts\utility::_id_382E( var_1 ) )
    {
        var_6 = _func_0B5( var_3, var_4 );
        var_7 = common_scripts\utility::_id_710E( var_2 );

        if ( isdefined( var_5 ) && var_7 == var_5 )
        {
            continue;
            continue;
        }

        var_5 = var_7;
        wait(var_6);

        if ( !common_scripts\utility::_id_382E( var_1 ) )
        {
            if ( isstring( var_0 ) && var_0 == "radio" )
            {
                _id_219E();
                _id_A5A4::_id_70BD( var_7 );
                _id_219F();
                continue;
            }

            _id_219E();
            var_0 _id_A5A4::_id_2A32( var_7 );
            _id_219F();
        }
    }
}

_id_219E()
{
    if ( !common_scripts\utility::_id_3839( "flag_conversation_in_progress" ) )
        common_scripts\utility::_id_383D( "flag_conversation_in_progress" );

    common_scripts\utility::_id_3857( "flag_conversation_in_progress" );
    common_scripts\utility::_id_383F( "flag_conversation_in_progress" );
}

_id_219F()
{
    common_scripts\utility::_id_3831( "flag_conversation_in_progress" );
}

_id_0CE2( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( common_scripts\utility::_id_0CE8( var_2, var_4 ) ) )
            var_2[var_2.size] = var_4;
    }

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( common_scripts\utility::_id_0CE8( var_2, var_4 ) ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_54E2( var_0 )
{
    var_0 endon( "remove_laser_targeting_device" );
    var_0._id_560A = undefined;
    var_0._id_54F5 = 0;
    var_0 _meth_821F( "actionslot4", "dpad_laser_designator" );
    var_0 thread _id_1E8B();
    var_0 _meth_82DA( "use_laser", "+actionslot 4" );
    var_0 _meth_82DA( "fired_laser", "+attack" );
    var_0 _meth_82DA( "fired_laser", "+attack_akimbo_accessible" );
    var_0._id_54EE = 1;
    var_0._id_54EF = 20;
    var_0 childthread _id_5E78();

    for (;;)
    {
        var_0 waittill( "use_laser" );

        if ( var_0._id_54F5 || !var_0._id_54EE || var_0 _id_849A() )
        {
            var_0 notify( "cancel_laser" );
            var_0 _meth_80B5();
            var_0._id_54F5 = 0;
            var_0 _meth_82FD( 1 );
            wait 0.2;
            var_0 _meth_8133( 1 );
            continue;
        }

        var_0 _meth_80B4();
        var_0 _meth_8133( 0 );
        var_0._id_54F5 = 1;
        var_0 _meth_82FD( 0 );
        var_0 thread _id_54C7();
    }
}

_id_849A()
{
    var_0 = self _meth_830E();

    if ( var_0 == "rpg" )
        return 1;

    if ( common_scripts\utility::_id_8F57( var_0, "gl" ) )
        return 1;

    if ( isdefined( level._id_54C9 ) && _func_0CE( level._id_54C9 ) )
    {
        foreach ( var_2 in level._id_54C9 )
        {
            if ( var_0 == var_2 )
                return 1;
        }
    }

    if ( self _meth_8333() )
        return 1;

    if ( self _meth_812E() )
        return 1;

    return 0;
}

_id_1E8B()
{
    self waittill( "remove_laser_targeting_device" );
    self _meth_821F( "actionslot4", "none" );
    self notify( "cancel_laser" );
    self _meth_80B5();
    self._id_54F5 = undefined;
    self _meth_8133( 1 );
    self _meth_82FD( 1 );
}

_id_5E78()
{
    for (;;)
    {
        if ( _id_849A() && isdefined( self._id_54F5 ) && self._id_54F5 )
        {
            self notify( "use_laser" );
            wait 2.0;
        }

        wait 0.05;
    }
}

_id_54C7()
{
    self endon( "cancel_laser" );

    for (;;)
    {
        self waittill( "fired_laser" );
        var_0 = _id_3DB0();
        var_1 = var_0["position"];
        var_2 = var_0["entity"];
        level notify( "laser_coordinates_received" );
        var_3 = undefined;

        if ( isdefined( level._id_54E3 ) && isdefined( var_2 ) && common_scripts\utility::_id_0CE4( level._id_54E3, var_2 ) )
        {
            var_3 = var_2;
            level._id_54E3 = common_scripts\utility::_id_0CF6( level._id_54E3, var_2 );
        }
        else
            var_3 = _id_4109( var_1 );

        if ( isdefined( var_3 ) )
        {
            thread _id_54C3( var_3 );
            level notify( "laser_target_painted" );
            wait 0.5;
            self notify( "use_laser" );
        }
    }
}

_id_4109( var_0 )
{
    if ( !isdefined( level._id_54E4 ) || level._id_54E4.size == 0 )
        return undefined;

    foreach ( var_2 in level._id_54E4 )
    {
        var_3 = _func_0EF( var_0, var_2._id_02E2 );
        var_4 = var_0[2] - var_2._id_02E2[2];

        if ( !isdefined( var_2._id_0351 ) )
            continue;

        if ( !isdefined( var_2._id_01E8 ) )
            continue;

        if ( var_3 <= var_2._id_0351 && var_4 <= var_2._id_01E8 && var_4 >= 0 )
        {
            level._id_54E4 = common_scripts\utility::_id_0CF6( level._id_54E4, var_2 );
            return getent( var_2._id_04A4, "script_noteworthy" );
        }
    }

    return undefined;
}

_id_3DB0()
{
    var_0 = self _meth_80AA();
    var_1 = self _meth_8338();
    var_2 = anglestoforward( var_1 );
    var_3 = var_0 + var_2 * 7000;
    var_4 = _func_06B( var_0, var_3, 1, self );
    var_5 = var_4["entity"];

    if ( isdefined( var_5 ) )
        var_4["position"] = var_5._id_02E2;

    return var_4;
}

_id_54C3( var_0 )
{
    level._id_0318 endon( "remove_laser_targeting_device" );
    level._id_0318._id_54EE = 0;
    self _meth_821F( "actionslot4", "dpad_killstreak_hellfire_missile_inactive" );
    _id_A5A4::_id_38CC( "allies" );
    var_1 = level._id_0318;
    wait 2.5;

    if ( !isdefined( var_0._id_7A18 ) )
        var_0._id_7A18 = 99;

    wait 1;

    if ( isdefined( var_0._id_7A0A ) )
    {
        var_2 = _id_3D87( "geo_before", var_0._id_7A0A );

        if ( var_2.size > 0 )
            common_scripts\utility::_id_0CDB( var_2, ::_meth_8056 );

        var_3 = _id_3D87( "geo_after", var_0._id_7A0A );

        if ( var_3.size > 0 )
            common_scripts\utility::_id_0CDB( var_3, ::_meth_8055 );
    }

    wait(level._id_0318._id_54EF);
    level._id_0318._id_54EE = 1;
    self _meth_821F( "actionslot4", "dpad_laser_designator" );
}

_id_3D87( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5._id_7A0A ) && var_5._id_7A0A == var_1 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_576C( var_0, var_1, var_2, var_3, var_4 )
{
    return var_3 + ( var_0 - var_1 ) * ( var_4 - var_3 ) / ( var_2 - var_1 );
}

_id_576D( var_0, var_1, var_2, var_3, var_4 )
{
    return _func_0E9( _id_576C( var_0, var_1, var_2, var_3, var_4 ), _func_0BF( var_3, var_4 ), _func_0E1( var_3, var_4 ) );
}

_id_2A56()
{
    var_0 = gettime() * 0.001;

    if ( !isdefined( self._id_2A5B ) )
    {
        self._id_2A5B = var_0;
        self._id_2A5A = self._id_02E2;
        self._id_2A5C = ( 0, 0, 0 );
        self._id_2A59 = ( 0, 0, 0 );
        self._id_2A58 = ( 0, 0, 0 );
        self._id_2A57 = ( 0, 0, 0 );
        self._id_2A5E = ( 0, 0, 0 );
        self._id_2A5D = 0;
    }
    else if ( self._id_2A5B != var_0 )
    {
        var_1 = var_0 - self._id_2A5B;
        self._id_2A5B = var_0;
        self._id_2A58 = ( self._id_2A57 - self._id_2A59 ) / var_1;
        self._id_2A59 = self._id_2A57;
        self._id_2A57 = ( self._id_2A5E - self._id_2A5C ) / var_1;
        self._id_2A5C = self._id_2A5E;
        self._id_2A5E = ( self._id_02E2 - self._id_2A5A ) / var_1;
        self._id_2A5A = self._id_02E2;
        self._id_2A5D = _func_0F1( self._id_2A5E );
    }
}

_id_3D3D()
{
    _id_2A56();
    return self._id_2A5D;
}

_id_3D3E()
{
    _id_2A56();
    return self._id_2A5E;
}

_id_3D3B()
{
    _id_2A56();
    return self._id_2A57;
}

_id_3D3C()
{
    _id_2A56();
    return self._id_2A58;
}

_id_84E9( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) )
        _func_0D6( "g_friendlyNameDist", var_0 );
    else
        _func_0D6( "g_friendlyNameDist", 15000 );

    if ( isdefined( var_1 ) )
        _func_0D6( "compass", var_1 );
    else
        _func_0D6( "compass", "1" );

    if ( isdefined( var_2 ) )
        _func_0D6( "ammoCounterHide", var_2 );
    else
        _func_0D6( "ammoCounterHide", "0" );

    if ( isdefined( var_3 ) )
        _func_0D6( "actionSlotsHide", var_3 );
    else
        _func_0D6( "actionSlotsHide", "0" );

    if ( isdefined( var_4 ) )
        _func_0D6( "hud_showStance", var_4 );
    else
        _func_0D6( "hud_showStance", "1" );
}

_id_4863( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) )
        _func_0D6( "g_friendlyNameDist", var_0 );
    else
        _func_0D6( "g_friendlyNameDist", 0 );

    if ( isdefined( var_1 ) )
        _func_0D6( "compass", var_1 );
    else
        _func_0D6( "compass", "0" );

    if ( isdefined( var_2 ) )
        _func_0D6( "ammoCounterHide", var_2 );
    else
        _func_0D6( "ammoCounterHide", "1" );

    if ( isdefined( var_3 ) )
        _func_0D6( "actionSlotsHide", var_3 );
    else
        _func_0D6( "actionSlotsHide", "1" );

    if ( isdefined( var_4 ) )
        _func_0D6( "hud_showStance", var_4 );
    else
        _func_0D6( "hud_showStance", "0" );
}

_id_2AA3( var_0 )
{
    _id_4863();
}

_id_30C1( var_0 )
{
    _id_84E9();
}

_id_45FB( var_0, var_1, var_2 )
{
    level._id_0318 endon( "death" );
    level endon( "missionfailed" );

    if ( isdefined( var_2 ) && isstring( var_2 ) )
        level endon( var_2 );

    if ( !isdefined( var_0 ) || !isstring( var_0 ) )
        return;

    if ( !isdefined( var_1 ) || !isstring( var_1 ) || !common_scripts\utility::_id_3839( var_0 ) )
        return;

    var_3 = getent( var_1, "targetname" );

    if ( !isdefined( var_3 ) )
        var_3 = getent( var_1, "script_noteworthy" );

    if ( !isdefined( var_3 ) )
        return;

    var_3 _meth_8072( 0 );

    for (;;)
    {
        common_scripts\utility::_id_384A( var_0 );
        var_3 _meth_8072( 1 );
        common_scripts\utility::_id_3857( var_0 );
        var_3 _meth_8072( 0 );
        wait 0.05;
    }
}

_id_6E56( var_0, var_1 )
{
    level._id_0318 endon( "death" );
    level endon( "missionfailed" );

    if ( !isdefined( var_0 ) || !isstring( var_0 ) )
        return;

    if ( !isdefined( var_1 ) || !isstring( var_1 ) || !common_scripts\utility::_id_3839( var_0 ) )
        return;

    var_2 = getent( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = getent( var_1, "script_noteworthy" );

    if ( !isdefined( var_2 ) )
        return;

    var_2 _meth_8072( 0 );
    common_scripts\utility::_id_384A( var_0 );
    var_2 _meth_8072( 1 );
}

_id_6E55( var_0, var_1 )
{
    level._id_0318 endon( "death" );
    level endon( "missionfailed" );

    if ( !isdefined( var_0 ) || !isstring( var_0 ) )
        return;

    if ( !isdefined( var_1 ) || !isstring( var_1 ) || !common_scripts\utility::_id_3839( var_0 ) )
        return;

    var_2 = getent( var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        var_2 = getent( var_1, "script_noteworthy" );

    if ( !isdefined( var_2 ) )
        return;

    common_scripts\utility::_id_384A( var_0 );
    var_2 _meth_8072( 0 );
}

_id_591F()
{
    if ( !isdefined( level._id_3078 ) )
        level._id_3078 = [];

    level._id_3078 = common_scripts\utility::_id_0CDA( level._id_3078, self );
    self waittill( "death" );
    level._id_3078 = common_scripts\utility::_id_0CF6( level._id_3078, self );
}

_id_6955( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_3B58 = common_scripts\utility::_id_3FA8( var_0 );
    var_4._id_0151 = var_1;
    var_4._id_0428 = var_2;

    if ( isdefined( var_3 ) && var_3 )
    {
        var_4._id_0470 = common_scripts\utility::_id_8959();
        var_4._id_0470 _meth_804F( var_1, var_4._id_0428, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        playfxontag( var_4._id_3B58, var_4._id_0470, "tag_origin" );
        _id_5314( var_4 );
    }
    else
        playfxontag( var_4._id_3B58, var_4._id_0151, var_4._id_0428 );

    return var_4;
}

_id_5314( var_0 )
{
    thread _id_5315( var_0 );
}

_id_5315( var_0 )
{
    var_0._id_0151 waittill( "death" );
    _id_5313( var_0 );
}

_id_5313( var_0 )
{
    if ( isdefined( var_0._id_0470 ) )
    {
        killfxontag( var_0._id_3B58, var_0._id_0470, "tag_origin" );
        var_0._id_0470 common_scripts\utility::_id_27CD( 0.05, ::delete );
        var_0._id_0470 = undefined;
        var_0._id_0151 = undefined;
    }
    else if ( isdefined( var_0._id_0151 ) )
    {
        killfxontag( var_0._id_3B58, var_0._id_0151, var_0._id_0428 );
        var_0._id_0151 = undefined;
    }
}

_id_48C2( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 200;

    return _id_48BE( var_0, self._id_02E2, undefined, var_1, undefined, self );
}

_id_48C1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    return _id_48B8( var_0, var_1, var_2, var_3, 0, var_4, var_5 );
}

_id_48BE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = common_scripts\utility::_id_8959();

    if ( !isdefined( var_1 ) )
    {
        if ( isdefined( var_5 ) )
            var_1 = var_5._id_02E2;
        else
            var_1 = self._id_02E2;
    }

    var_6._id_02E2 = var_1;
    return var_6 _id_48B8( var_0, "tag_origin", var_2, var_3, 1, var_4, var_5 );
}

_id_48B8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _func_1AA( level._id_0318 );
    var_7.alignx = "center";
    var_7.aligny = "middle";
    var_7._id_0189 = 3;
    var_7._id_0188 = "buttonprompt";
    var_7._id_032A = 1;

    if ( isdefined( self ) )
    {
        if ( isdefined( var_1 ) )
            var_7 _meth_80CF( self, var_1 );
        else
            var_7 _meth_80CF( self );
    }

    var_8 = _id_48BF( var_0 );
    var_7 _meth_80CC( var_8 );
    var_7._id_01ED = 1;
    var_7._id_03D4 = -1;
    var_7.alpha = 1;

    if ( !isdefined( var_5 ) || !var_5 )
        var_7 thread _id_782E( self, var_1, level._id_0318, var_2, var_3, var_6 );

    var_7._id_62E1 = self;

    if ( isdefined( var_4 ) && var_4 )
        var_7._id_2858 = 1;

    return var_7;
}

_id_782E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );
    var_0 endon( "death" );

    if ( !isdefined( var_3 ) )
        var_3 = getdvarint( "player_useradius" );

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_6 = 0;
    self._id_0189 = 2;
    self._id_0188 = "buttonprompt";

    for (;;)
    {
        if ( isdefined( var_1 ) )
            var_6 = _func_0EE( var_0 _meth_8184( var_1 ), var_2 _meth_80AA() );
        else
            var_6 = _func_0EE( var_0, var_2 _meth_80AA() );

        if ( var_4 != 0 && var_6 > var_4 )
            self.alpha = 0;
        else if ( var_3 != 0 && var_6 > var_3 )
        {
            if ( var_4 - var_3 > 0 )
                self.alpha = ( 1 - ( var_6 - var_3 ) / ( var_4 - var_3 ) ) * 0.3;
            else
                self.alpha = 0.3;
        }
        else if ( isdefined( var_5 ) && isdefined( var_5.classname ) && _func_120( var_5.classname, "trigger" ) )
        {
            var_7 = var_2 _meth_8516();

            if ( isdefined( var_7 ) && var_7 == var_5 )
                self.alpha = 1;
            else
                self.alpha = 0.3;
        }
        else
            self.alpha = 1;

        waittillframeend;
    }
}

_id_48BF( var_0 )
{
    switch ( var_0 )
    {
        case "reload":
        case "x":
        case "use":
        case "usereload":
        case "activate":
            return "^3[{+activate}]^7";
        case "a":
        case "jump":
        case "gostand":
            return "^3[{+gostand}]^7";
        case "y":
        case "weapnext":
            return "^3[{weapnext}]^7";
        case "crouch":
        case "b":
        case "stance":
            return "^3[{+stance}]^7";
        case "melee":
        case "rs":
            return "^3[{+melee}]^7";
        case "sprint":
        case "ls":
        case "breath":
            return "^3[{+sprint}]^7";
        case "rt":
        case "r1":
        case "attack":
            return "^3[{+attack}]^7";
        case "grenade":
        case "rb":
        case "r2":
        case "frag":
            return "^3[{+frag}]^7";
        case "lt":
        case "l1":
        case "ads":
            if ( level._id_02FB )
                return "^3[{+ads}]^7";
            else if ( level._id_0318 _meth_834C() )
                return "^3[{+speed_throw}]^7";
            else
                return "^3[{+toggleads_throw}]^7";
        case "flashbang":
        case "lb":
        case "l2":
        case "smoke":
        case "flash":
            return "^3[{+smoke}]^7";
        case "start":
        case "pause":
            return "^3[{pause}]^7";
        case "up":
            return "^3[{+actionslot 1}]^7";
        case "down":
            return "^3[{+actionslot 2}]^7";
        case "left":
            return "^3[{+actionslot 3}]^7";
        case "right":
            return "^3[{+actionslot 4}]^7";
        default:
            break;
    }
}

_id_48B6()
{
    if ( isdefined( self._id_2858 ) && self._id_2858 )
        self._id_62E1 delete();

    if ( isdefined( self ) )
        self _meth_808A();
}

_id_48BA( var_0, var_1 )
{
    while ( isdefined( self ) )
    {
        var_2 = self.alpha;
        self _meth_8086( var_0 / 3 );
        self.alpha = var_1;
        wait(var_0);

        if ( !isdefined( self ) )
            return;

        self _meth_8086( var_0 / 3 );
        self.alpha = var_2;
        wait(var_0);
    }
}

_id_1950( var_0, var_1, var_2, var_3 )
{
    self endon( var_2 );
    level._id_0318 endon( var_2 );
    self endon( "death" );
    thread _id_A5A4::_id_48B0( var_0 );
    var_4 = var_1 + "_button_mash_dynamic_hint";
    thread _id_195E( var_2, var_4, var_1, var_3 );
    level._id_0318 _meth_82DA( var_4, var_1 );

    if ( isdefined( var_3 ) )
        level._id_0318 _meth_82DA( var_4, var_3 );

    for (;;)
    {
        self waittill( var_4 );
        level._id_4903.alpha = 0.2;
        level._id_4903 _meth_8086( 0.3 );
        level._id_4903.alpha = 1;
        waittillframeend;
    }
}

_id_195E( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    common_scripts\utility::_id_A06A( self, var_0, level._id_0318, var_0 );
    thread _id_A5A4::_id_48CB();
    level._id_0318 _meth_8498( var_1, var_2 );

    if ( isdefined( var_3 ) )
        level._id_0318 _meth_8498( var_1, var_3 );
}

_id_48B9( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    self endon( "death" );
    var_7 = common_scripts\utility::_id_8959();
    var_7._id_02E2 = self _meth_8184( var_0 );
    var_7._id_02E2 += var_3;
    var_7 _meth_804F( self, var_0 );
    var_1 = var_7 _id_48B8( var_1, "TAG_ORIGIN", var_4, var_5, 1, 1 );

    if ( isdefined( var_6 ) )
        var_1._id_0189 = var_6;

    var_1 thread _id_48BA( 0.15, 0.1 );
    common_scripts\utility::_id_A06A( self, var_2, level._id_0318, var_2 );
    var_1 _id_48B6();
}

_id_6A1C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_6 ) )
        var_6 = 1;

    var_8 = undefined;

    if ( isdefined( var_2 ) || isdefined( var_3 ) || isdefined( var_4 ) || isdefined( var_5 ) )
    {
        var_8 = [];
        var_8["top"] = var_2;
        var_8["left"] = var_3;
        var_8["bottom"] = var_4;
        var_8["right"] = var_5;
    }

    var_9 = [];
    var_9["add"] = 0;
    var_9["blend"] = 1;
    var_9["blend_add"] = 2;
    var_9["screen_add"] = 3;
    var_9["multiply"] = 4;
    var_9["replace"] = 5;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_10 = var_9[var_1];
    var_11 = getdvarint( "cg_cinematicfullscreen" );
    _func_0D6( "cg_cinematicfullscreen", 0 );
    var_12 = [];

    if ( isdefined( var_8 ) )
    {
        var_12["top"] = getomnvar( "ui_videolog_pos_top" );
        var_12["left"] = getomnvar( "ui_videolog_pos_left" );
        var_12["bottom"] = getomnvar( "ui_videolog_pos_bottom" );
        var_12["right"] = getomnvar( "ui_videolog_pos_right" );
        setomnvar( "ui_videolog_pos_top", var_8["top"] );
        setomnvar( "ui_videolog_pos_left", var_8["left"] );
        setomnvar( "ui_videolog_pos_bottom", var_8["bottom"] );
        setomnvar( "ui_videolog_pos_right", var_8["right"] );
    }

    setomnvar( "ui_videolog", 1 );
    var_13 = getomnvar( "ui_videolog_blendfunc" );
    setomnvar( "ui_videolog_blendfunc", var_10 );
    setomnvar( "ui_videolog_blur_bkgrnd", var_6 );

    if ( !isdefined( var_7 ) )
        var_7 = level._id_065D._id_2791;

    _func_059( var_0, 0, var_7, 1 );

    while ( !_func_05D() )
        waittillframeend;

    while ( _func_05D() )
        waittillframeend;

    setomnvar( "ui_videolog", 0 );
    setomnvar( "ui_videolog_blendfunc", var_13 );
    _func_0D6( "cg_cinematicfullscreen", var_11 );

    if ( isdefined( var_8 ) )
    {
        setomnvar( "ui_videolog_pos_top", var_12["top"] );
        setomnvar( "ui_videolog_pos_left", var_12["left"] );
        setomnvar( "ui_videolog_pos_bottom", var_12["bottom"] );
        setomnvar( "ui_videolog_pos_right", var_12["right"] );
    }
}

_id_8ED3()
{
    if ( _func_05D() )
        _func_05E();
}

_id_68AD( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_383D( "chyron_video_done" );
    var_3 = _func_1AA( level._id_0318 );
    var_3 _meth_80CE( "black", 1280, 720 );
    var_3._id_01F3 = "fullscreen";
    var_3._id_0501 = "fullscreen";
    var_3.alpha = 1;
    var_3._id_0198 = 0;
    _func_059( var_0 );
    var_4 = getdvarint( "cg_cinematicCanPause", 0 );
    _func_0D6( "cg_cinematicCanPause", 1 );

    while ( !_func_05D() )
        waittillframeend;

    while ( _func_05D() )
        waittillframeend;

    common_scripts\utility::_id_383F( "chyron_video_done" );

    if ( isdefined( var_1 ) )
        wait(var_1);

    if ( isdefined( var_2 ) )
    {
        var_3 _meth_8086( var_2 );
        var_3.alpha = 0;
        wait(var_2);
    }

    _func_0D6( "cg_cinematicCanPause", var_4 );
    var_3 _meth_808A();
}

_id_6E1A( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = level._id_0318;

    return _func_0F6( _func_114( var_0 - var_2 _meth_80AA() ), anglestoforward( var_2 _meth_8338() ) ) > _func_0B7( var_1 );
}

_id_3313( var_0, var_1, var_2, var_3 )
{
    return _id_6E1A( var_0._id_02E2, _func_0BB( _func_0B8( 0.5 * var_2 ) * var_3 / 320.0 ), var_1 );
}

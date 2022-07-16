// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8010( var_0 )
{
    if ( !isdefined( level._id_038E ) )
        level._id_038E = _func_123( getdvar( "mapname" ) );

    if ( !isdefined( var_0 ) || var_0 == 0 )
    {
        if ( isdefined( level._id_3BFE ) )
            return;

        if ( !isdefined( level._id_254D ) )
            level._id_254D = ::_id_74D1;

        level._id_4226 = ::_id_3094;
        level._id_4225 = ::_id_3094;
        level._id_422E = ::_id_3094;
        _id_A5A4::_id_7DF3();

        if ( getdvar( "arcademode" ) == "1" )
            thread maps\_arcademode::main();

        foreach ( var_2 in level._id_0323 )
        {
            var_2 _id_A5A4::_id_32DD( "player_has_red_flashing_overlay" );
            var_2 _id_A5A4::_id_32DD( "player_is_invulnerable" );
            var_2 _id_A5A4::_id_32DD( "player_zero_attacker_accuracy" );
            var_2 _id_A5A4::_id_32DD( "player_no_auto_blur" );
            var_2 _id_A5A4::_id_32DD( "near_death_vision_enabled" );
            var_2 _id_A5A4::_id_32DA( "near_death_vision_enabled" );
            var_2._id_4441 = spawnstruct();
            var_2.a = spawnstruct();
            var_2._id_257E = [];
            var_2 _id_A56F::_id_4D62();
            var_2 _id_A5A4::_id_32DD( "global_hint_in_use" );
            var_2._id_0308 = [];

            if ( !isdefined( var_2._id_130B ) )
                var_2._id_130B = 0;

            var_2._id_2B0B = 0;
            var_2._id_2B0C = 0;
            var_2._id_2B0A = 0;
        }

        level._id_2A63[0] = "easy";
        level._id_2A63[1] = "normal";
        level._id_2A63[2] = "hardened";
        level._id_2A63[3] = "veteran";
        level._id_2A62["easy"] = &"GAMESKILL_EASY";
        level._id_2A62["normal"] = &"GAMESKILL_NORMAL";
        level._id_2A62["hardened"] = &"GAMESKILL_HARDENED";
        level._id_2A62["veteran"] = &"GAMESKILL_VETERAN";
        thread _id_3C00();
    }

    setdvarifuninitialized( "autodifficulty_playerDeathTimer", 0 );
    anim._id_76A4 = 0.5;
    anim._id_A105 = 0.8;
    setdvar( "autodifficulty_frac", 0 );
    level._id_2A61 = [];

    foreach ( var_2 in level._id_0323 )
    {
        var_2 _id_4D65();
        var_2 thread _id_4C3B();
    }

    level._id_5BCE = 8;
    level._id_5BCD = 16;
    level._id_2A60["playerGrenadeBaseTime"]["easy"] = 40000;
    level._id_2A60["playerGrenadeBaseTime"]["normal"] = 25000;
    level._id_2A60["playerGrenadeBaseTime"]["hardened"] = 10000;
    level._id_2A60["playerGrenadeBaseTime"]["veteran"] = 0;
    level._id_2A60["playerGrenadeRangeTime"]["easy"] = 20000;
    level._id_2A60["playerGrenadeRangeTime"]["normal"] = 15000;
    level._id_2A60["playerGrenadeRangeTime"]["hardened"] = 5000;
    level._id_2A60["playerGrenadeRangeTime"]["veteran"] = 1;
    level._id_2A60["playerDoubleGrenadeTime"]["easy"] = 3600000;
    level._id_2A60["playerDoubleGrenadeTime"]["normal"] = 120000;
    level._id_2A60["playerDoubleGrenadeTime"]["hardened"] = 15000;
    level._id_2A60["playerDoubleGrenadeTime"]["veteran"] = 0;
    level._id_2A60["double_grenades_allowed"]["easy"] = 0;
    level._id_2A60["double_grenades_allowed"]["normal"] = 1;
    level._id_2A60["double_grenades_allowed"]["hardened"] = 1;
    level._id_2A60["double_grenades_allowed"]["veteran"] = 1;
    level._id_2A60["threatbias"]["easy"] = 100;
    level._id_2A60["threatbias"]["normal"] = 150;
    level._id_2A60["threatbias"]["hardened"] = 200;
    level._id_2A60["threatbias"]["veteran"] = 400;
    level._id_2A60["base_enemy_accuracy"]["easy"] = 1.0;
    level._id_2A60["base_enemy_accuracy"]["normal"] = 1.0;
    level._id_2A60["base_enemy_accuracy"]["hardened"] = 1.3;
    level._id_2A60["base_enemy_accuracy"]["veteran"] = 1.3;
    level._id_2A60["accuracyDistScale"]["easy"] = 1.0;
    level._id_2A60["accuracyDistScale"]["normal"] = 1.0;
    level._id_2A60["accuracyDistScale"]["hardened"] = 1.0;
    level._id_2A60["accuracyDistScale"]["veteran"] = 0.5;
    level._id_2A60["min_sniper_burst_delay_time"]["easy"] = 3.0;
    level._id_2A60["min_sniper_burst_delay_time"]["normal"] = 2.0;
    level._id_2A60["min_sniper_burst_delay_time"]["hardened"] = 1.5;
    level._id_2A60["min_sniper_burst_delay_time"]["veteran"] = 1.1;
    level._id_2A60["max_sniper_burst_delay_time"]["easy"] = 4.0;
    level._id_2A60["max_sniper_burst_delay_time"]["normal"] = 3.0;
    level._id_2A60["max_sniper_burst_delay_time"]["hardened"] = 2.0;
    level._id_2A60["max_sniper_burst_delay_time"]["veteran"] = 1.5;
    level._id_2A60["dog_health"]["easy"] = 0.25;
    level._id_2A60["dog_health"]["normal"] = 0.75;
    level._id_2A60["dog_health"]["hardened"] = 1.0;
    level._id_2A60["dog_health"]["veteran"] = 1.0;

    if ( getdvar( "old_dog_melee_combat" ) == "1" )
    {
        level._id_2A60["dog_presstime"]["easy"] = 415;
        level._id_2A60["dog_presstime"]["normal"] = 375;
        level._id_2A60["dog_presstime"]["hardened"] = 250;
        level._id_2A60["dog_presstime"]["veteran"] = 225;
    }
    else
    {
        level._id_2A60["dog_presstime"]["easy"] = 750;
        level._id_2A60["dog_presstime"]["normal"] = 550;
        level._id_2A60["dog_presstime"]["hardened"] = 350;
        level._id_2A60["dog_presstime"]["veteran"] = 250;
    }

    level._id_2A60["dog_hits_before_kill"]["easy"] = 2;
    level._id_2A60["dog_hits_before_kill"]["normal"] = 1;
    level._id_2A60["dog_hits_before_kill"]["hardened"] = 0;
    level._id_2A60["dog_hits_before_kill"]["veteran"] = 0;
    level._id_2A60["pain_test"]["easy"] = ::_id_0B07;
    level._id_2A60["pain_test"]["normal"] = ::_id_0B07;
    level._id_2A60["pain_test"]["hardened"] = ::_id_6649;
    level._id_2A60["pain_test"]["veteran"] = ::_id_6649;
    level._id_2A60["missTimeConstant"]["easy"] = 1.0;
    level._id_2A60["missTimeConstant"]["normal"] = 0.05;
    level._id_2A60["missTimeConstant"]["hardened"] = 0;
    level._id_2A60["missTimeConstant"]["veteran"] = 0;
    level._id_2A60["missTimeDistanceFactor"]["easy"] = 0.0008;
    level._id_2A60["missTimeDistanceFactor"]["normal"] = 0.0001;
    level._id_2A60["missTimeDistanceFactor"]["hardened"] = 5e-05;
    level._id_2A60["missTimeDistanceFactor"]["veteran"] = 0;
    level._id_2A60["flashbangedInvulFactor"]["easy"] = 0.25;
    level._id_2A60["flashbangedInvulFactor"]["normal"] = 0;
    level._id_2A60["flashbangedInvulFactor"]["hardened"] = 0;
    level._id_2A60["flashbangedInvulFactor"]["veteran"] = 0;
    level._id_2A60["player_criticalBulletDamageDist"]["easy"] = 0;
    level._id_2A60["player_criticalBulletDamageDist"]["normal"] = 0;
    level._id_2A60["player_criticalBulletDamageDist"]["hardened"] = 0;
    level._id_2A60["player_criticalBulletDamageDist"]["veteran"] = 0;
    level._id_2A60["player_deathInvulnerableTime"]["easy"] = 4000;
    level._id_2A60["player_deathInvulnerableTime"]["normal"] = 1700;
    level._id_2A60["player_deathInvulnerableTime"]["hardened"] = 600;
    level._id_2A60["player_deathInvulnerableTime"]["veteran"] = 100;
    level._id_2A60["invulTime_preShield"]["easy"] = 0.6;
    level._id_2A60["invulTime_preShield"]["normal"] = 0.35;
    level._id_2A60["invulTime_preShield"]["hardened"] = 0.1;
    level._id_2A60["invulTime_preShield"]["veteran"] = 0.0;
    level._id_2A60["invulTime_onShield"]["easy"] = 0.8;
    level._id_2A60["invulTime_onShield"]["normal"] = 0.5;
    level._id_2A60["invulTime_onShield"]["hardened"] = 0.1;
    level._id_2A60["invulTime_onShield"]["veteran"] = 0.05;
    level._id_2A60["invulTime_postShield"]["easy"] = 0.5;
    level._id_2A60["invulTime_postShield"]["normal"] = 0.3;
    level._id_2A60["invulTime_postShield"]["hardened"] = 0.1;
    level._id_2A60["invulTime_postShield"]["veteran"] = 0.0;
    level._id_2A60["playerHealth_RegularRegenDelay"]["easy"] = 3000;
    level._id_2A60["playerHealth_RegularRegenDelay"]["normal"] = 2000;
    level._id_2A60["playerHealth_RegularRegenDelay"]["hardened"] = 1200;
    level._id_2A60["playerHealth_RegularRegenDelay"]["veteran"] = 1200;
    level._id_2A60["worthyDamageRatio"]["easy"] = 0.0;
    level._id_2A60["worthyDamageRatio"]["normal"] = 0.1;
    level._id_2A60["worthyDamageRatio"]["hardened"] = 0.1;
    level._id_2A60["worthyDamageRatio"]["veteran"] = 0.1;
    level._id_2A60["playerDifficultyHealth"]["easy"] = 475;
    level._id_2A60["playerDifficultyHealth"]["normal"] = 275;
    level._id_2A60["playerDifficultyHealth"]["hardened"] = 165;
    level._id_2A60["playerDifficultyHealth"]["veteran"] = 115;
    level._id_2A60["longRegenTime"]["easy"] = 5000;
    level._id_2A60["longRegenTime"]["normal"] = 5000;
    level._id_2A60["longRegenTime"]["hardened"] = 5000;
    level._id_2A60["longRegenTime"]["veteran"] = 5000;
    level._id_2A60["healthOverlayCutoff"]["easy"] = 0.01;
    level._id_2A60["healthOverlayCutoff"]["normal"] = 0.2;
    level._id_2A60["healthOverlayCutoff"]["hardened"] = 0.3;
    level._id_2A60["healthOverlayCutoff"]["veteran"] = 0.5;
    level._id_2A60["health_regenRate"]["easy"] = 0.1;
    level._id_2A60["health_regenRate"]["normal"] = 0.1;
    level._id_2A60["health_regenRate"]["hardened"] = 0.1;
    level._id_2A60["health_regenRate"]["veteran"] = 0.1;
    level._id_2A60["explosivePlantTime"]["easy"] = 10;
    level._id_2A60["explosivePlantTime"]["normal"] = 10;
    level._id_2A60["explosivePlantTime"]["hardened"] = 5;
    level._id_2A60["explosivePlantTime"]["veteran"] = 5;
    level._id_2A60["player_downed_buffer_time"]["normal"] = 2;
    level._id_2A60["player_downed_buffer_time"]["hardened"] = 1.5;
    level._id_2A60["player_downed_buffer_time"]["veteran"] = 0;
    level._id_55CC = 0;
    _func_0D6( "player_meleeDamageMultiplier", 0.4 );

    if ( isdefined( level._id_2545 ) )
        [[ level._id_2545 ]]();

    _id_9B21();
    _id_9AF2();
    setdvar( "autodifficulty_original_setting", level._id_3BFE );
}

_id_9AF2()
{
    _id_7F7D();

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
        level._id_0323[var_0] _id_7F51();
}

_id_7F51()
{
    _id_7E12();
}

_id_7F7D()
{
    var_0 = ::_id_3DCF;
    var_1 = _id_3E63( level._id_3BFE );
    anim._id_2CA4 = [[ var_0 ]]( "dog_health", level._id_3BFE );
    anim._id_664F = level._id_2A60["pain_test"][var_1];
    level._id_3580 = level._id_2A60["explosivePlantTime"][var_1];
    anim._id_5C36 = [[ var_0 ]]( "min_sniper_burst_delay_time", level._id_3BFE );
    anim._id_5A17 = [[ var_0 ]]( "max_sniper_burst_delay_time", level._id_3BFE );
    _func_0D6( "ai_accuracyDistScale", [[ var_0 ]]( "accuracyDistScale", level._id_3BFE ) );

    if ( _id_A5A4::_id_55E1() )
        level._id_6AE0 = level._id_2A60["player_downed_buffer_time"][var_1];

    _id_A558::_id_7F51();
}

_id_9B21()
{
    foreach ( var_1 in level._id_0323 )
        var_1._id_3BFE = var_1 _id_A5A4::_id_3E26();

    level._id_3BFE = level._id_0318._id_3BFE;
    level._id_8A48 = level._id_0318._id_3BFE;

    if ( isdefined( level._id_39B9 ) )
        level._id_3BFE = level._id_39B9;

    return level._id_3BFE;
}

_id_3C00()
{
    var_0 = level._id_3BFE;
    var_1 = 0;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
        {
            wait 1;
            var_0 = level._id_3BFE;
            continue;
        }

        if ( !var_1 )
        {
            _id_9AF2();
            var_1 = 1;
        }

        if ( var_0 != _id_9B21() )
        {
            var_0 = level._id_3BFE;
            _id_9AF2();
        }

        wait 1;
    }
}

_id_3E63( var_0 )
{
    return level._id_2A63[var_0];
}

_id_0C9F( var_0, var_1 )
{
    self._id_4441._id_4FAC = [[ var_0 ]]( "invulTime_preShield", var_1 );
    self._id_4441._id_4FAA = [[ var_0 ]]( "invulTime_onShield", var_1 );
    self._id_4441._id_4FAB = [[ var_0 ]]( "invulTime_postShield", var_1 );
    self._id_4441._id_6CC3 = [[ var_0 ]]( "playerHealth_RegularRegenDelay", var_1 );
    self._id_4441._id_A353 = [[ var_0 ]]( "worthyDamageRatio", var_1 );
    self._id_04B1 = _func_0BC( [[ var_0 ]]( "threatbias", var_1 ) );
    self._id_4441._id_584F = [[ var_0 ]]( "longRegenTime", var_1 );
    self._id_4441._id_478D = [[ var_0 ]]( "healthOverlayCutoff", var_1 );
    self._id_4441._id_72D3 = [[ var_0 ]]( "health_regenRate", var_1 );
    self._id_4441._id_6A64 = [[ var_0 ]]( "base_enemy_accuracy", var_1 );
    self.attackeraccuracy = self._id_4441._id_6A64;
    _id_9AD3();
    self._id_4441._id_6CB3 = _func_0BC( [[ var_0 ]]( "playerGrenadeBaseTime", var_1 ) );
    self._id_4441._id_6CB4 = _func_0BC( [[ var_0 ]]( "playerGrenadeRangeTime", var_1 ) );
    self._id_4441._id_6C95 = _func_0BC( [[ var_0 ]]( "playerDoubleGrenadeTime", var_1 ) );
    self._id_4441._id_5C36 = [[ var_0 ]]( "min_sniper_burst_delay_time", var_1 );
    self._id_4441._id_5A17 = [[ var_0 ]]( "max_sniper_burst_delay_time", var_1 );
    self._id_4441._id_2CB6 = [[ var_0 ]]( "dog_presstime", var_1 );
    self._id_010A = _func_0BC( [[ var_0 ]]( "player_deathInvulnerableTime", var_1 ) );
    self._id_00DE = _func_0BC( [[ var_0 ]]( "player_criticalBulletDamageDist", var_1 ) );
    self._id_00FF = 100 / [[ var_0 ]]( "playerDifficultyHealth", var_1 );
}

_id_9AD3()
{
    if ( _id_A5A4::_id_32D8( "player_zero_attacker_accuracy" ) )
        return;

    self._id_0200 = self._id_130B;
    self.attackeraccuracy = self._id_4441._id_6A64;
}

_id_0CA0( var_0, var_1 )
{
    self._id_4441._id_5CE4 = [[ var_0 ]]( "missTimeConstant", var_1 );
    self._id_4441._id_5CE6 = [[ var_0 ]]( "missTimeDistanceFactor", var_1 );
    self._id_4441._id_2CA7 = [[ var_0 ]]( "dog_hits_before_kill", var_1 );
    self._id_4441._id_2D8C = [[ var_0 ]]( "double_grenades_allowed", var_1 );
}

_id_7E12()
{
    _id_0C9F( ::_id_3DD0, 1 );
    _id_0CA0( ::_id_3DCE, 1 );
}

_id_3DCE( var_0, var_1 )
{
    return level._id_2A60[var_0][_id_3E63( self._id_3BFE )];
}

_id_3F44( var_0 )
{
    return level._id_2A60[var_0][_id_3E63( self._id_3BFE )];
}

_id_3DD0( var_0, var_1 )
{
    return level._id_2A60[var_0][_id_3E63( self._id_3BFE )];
}

_id_3DCF( var_0, var_1 )
{
    return level._id_2A60[var_0][_id_3E63( level._id_3BFE )];
}

_id_0B07()
{
    return 0;
}

_id_6649()
{
    if ( !_id_664A() )
        return 0;

    return _func_0B2( 100 ) > 25;
}

_id_664A()
{
    if ( !_func_1A1( self._id_0142 ) )
        return 0;

    if ( !_func_1AD( self._id_0142 ) )
        return 0;

    if ( !_func_1A1( level._id_6650 ) || level._id_6650._id_038E != "pain" )
        level._id_6650 = self;

    if ( self == level._id_6650 )
        return 0;

    if ( self._id_0102 != "none" && _func_1B4( self._id_0102 ) )
        return 0;

    return 1;
}

_id_7DAF()
{
    if ( animscripts\combat_utility::_id_51AB() && _func_1A1( self._id_0142 ) )
    {
        _id_8011();
        return;
    }

    if ( _func_1AD( self._id_0142 ) )
    {
        _id_744F();

        if ( self.a._id_5CE3 > gettime() )
        {
            self.accuracy = 0;
            return;
        }

        if ( self._id_038E == "move" )
        {
            self.accuracy = anim._id_76A4 * self._id_1300;
            return;
        }
    }
    else if ( self._id_038E == "move" )
    {
        self.accuracy = anim._id_76A4 * self._id_1300;
        return;
    }

    self.accuracy = self._id_1300;
}

_id_8011()
{
    if ( !isdefined( self._id_8832 ) )
    {
        self._id_8832 = 0;
        self._id_8803 = 0;
    }

    self._id_8832++;

    if ( ( !isdefined( self._id_55BF ) || self._id_0142 != self._id_55BF ) && _func_0F0( self._id_02E2, self._id_0142._id_02E2 ) > 250000 )
    {
        self.accuracy = 0;

        if ( level._id_3BFE > 0 || self._id_8832 > 1 )
            self._id_55BF = self._id_0142;

        return;
    }

    self.accuracy = ( 1 + 1 * self._id_8803 ) * self._id_1300;
    self._id_8803++;

    if ( level._id_3BFE < 1 && self._id_8803 == 1 )
        self._id_55BF = undefined;
}

_id_2A4D()
{
    self.a._id_5CE5 = 0;
}

_id_7442()
{
    _id_7450();
}

_id_7450()
{
    if ( !self _meth_813F() )
        return;

    if ( self._id_0513 == "none" )
        return;

    if ( !animscripts\weaponlist::_id_9C2C() && !animscripts\weaponlist::_id_9C38() )
    {
        self._id_5CE3 = 0;
        return;
    }

    if ( !_func_1A1( self._id_0142 ) )
        return;

    if ( !_func_1AD( self._id_0142 ) )
    {
        self.accuracy = self._id_1300;
        return;
    }

    var_0 = _func_0EE( self._id_0142._id_02E2, self._id_02E2 );
    _id_7FAD( self._id_0142._id_4441._id_5CE4 + var_0 * self._id_0142._id_4441._id_5CE6 );
}

_id_744F()
{
    self.a._id_5CE5 = gettime() + 3000;
}

_id_7FAD( var_0 )
{
    if ( self.a._id_5CE5 > gettime() )
        return;

    if ( var_0 > 0 )
        self.accuracy = 0;

    var_0 *= 1000;
    self.a._id_5CE3 = gettime() + var_0;
    self.a._id_06DB = 1;
}

_id_6CC9()
{
    self._id_4B0B = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3 );
        self._id_4B0B = 1;
        self._id_25AA = var_3;
        self._id_258D = var_1;
    }
}

_id_6B4E()
{
    self._id_6B4E = 3;
}

_id_6CC4()
{
    thread healthoverlayalt();
    thread _id_4789();
    thread redhitflash();
    thread bloodsplatter();
    var_0 = 1;
    var_1 = 0;
    thread _id_6B4E();
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    var_6 = 0;
    var_7 = 1;
    thread _id_6CC9();
    self._id_1528 = 0;

    for (;;)
    {
        wait 0.05;
        waitframe;

        if ( self._id_01E6 == self._id_0271 )
        {
            thread _id_A5DC::_id_7498();

            if ( _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
                _id_A5A4::_id_32DA( "player_has_red_flashing_overlay" );

            var_7 = 1;
            var_3 = 0;
            var_2 = 0;
            continue;
        }

        if ( self._id_01E6 <= 0 )
            return;

        var_8 = 0;
        var_9 = var_2;
        var_10 = self._id_01E6 / self._id_0271;

        if ( var_10 <= self._id_4441._id_478D && self._id_6B4E > 1 )
        {
            var_2 = 1;

            if ( !var_9 )
            {
                var_5 = gettime();
                var_8 = 1;

                if ( getdvarint( "cg_altDamageMode" ) == 0 )
                {
                    if ( _func_23A() )
                        thread _id_14C8( 2, 2 );
                    else
                        thread _id_14C8( 3.6, 2 );
                }
                else if ( _func_23A() )
                    thread _id_14C8( 40, 0.25 );
                else
                    thread _id_14C8( 7.5, 0.67 );

                thread _id_A5DC::_id_7E07();

                if ( _id_A5A4::_id_32D8( "near_death_vision_enabled" ) )
                    self _meth_823B();

                _id_A5A4::_id_32DE( "player_has_red_flashing_overlay" );
                var_3 = 1;
            }
        }

        if ( self._id_4B0B )
        {
            var_5 = gettime();
            self._id_4B0B = 0;
        }

        if ( self._id_01E6 / self._id_0271 >= var_0 )
        {
            if ( gettime() - var_5 < self._id_4441._id_6CC3 )
                continue;

            if ( var_2 )
            {
                var_6 = var_10;

                if ( gettime() > var_5 + self._id_4441._id_584F )
                    var_6 += self._id_4441._id_72D3;

                if ( var_6 >= 1 )
                    _id_72A8();
            }
            else
                var_6 = 1;

            if ( var_6 > 1.0 )
                var_6 = 1.0;

            if ( var_6 <= 0 )
                return;

            self _meth_8052( var_6 );
            var_0 = self._id_01E6 / self._id_0271;
            continue;
        }

        var_0 = var_7;
        var_11 = var_0 - var_10 >= self._id_4441._id_A353;

        if ( self._id_01E6 <= 1 )
        {
            self _meth_8052( 2 / self._id_0271 );
            var_11 = 1;
        }

        var_0 = self._id_01E6 / self._id_0271;
        self notify( "hit_again" );
        var_1 = 0;
        var_5 = gettime();

        if ( var_8 == 0 )
        {
            if ( getdvarint( "cg_altDamageMode" ) == 0 )
            {
                if ( _func_23A() )
                    thread _id_14C8( 2, 2 );
                else
                    thread _id_14C8( 3.6, 2 );
            }
            else if ( _func_23A() )
                thread _id_14C8( 4, 0.67 );
            else
                thread _id_14C8( 7.5, 0.67 );
        }

        if ( !var_11 )
            continue;

        if ( _id_A5A4::_id_32D8( "player_is_invulnerable" ) )
            continue;

        _id_A5A4::_id_32DE( "player_is_invulnerable" );
        level notify( "player_becoming_invulnerable" );

        if ( var_3 )
        {
            var_4 = self._id_4441._id_4FAA;
            var_3 = 0;
        }
        else if ( var_2 )
            var_4 = self._id_4441._id_4FAB;
        else
            var_4 = self._id_4441._id_4FAC;

        var_7 = self._id_01E6 / self._id_0271;
        thread _id_6CD0( var_4 );
    }
}

_id_72A8()
{
    if ( !_id_9110() )
        return;

    if ( _func_1A1( self ) )
    {
        var_0 = self _meth_8212( "takeCoverWarnings" );

        if ( var_0 > 0 )
        {
            var_0--;
            self _meth_8213( "takeCoverWarnings", var_0 );
        }
    }
}

_id_6CD0( var_0 )
{
    if ( isdefined( self._id_38B1 ) && self._id_38B1 > gettime() )
        var_0 *= _id_3F44( "flashbangedInvulFactor" );

    if ( var_0 > 0 )
    {
        self.attackeraccuracy = 0;
        self._id_0200 = 1;
        wait(var_0);
    }

    _id_9AD3();
    _id_A5A4::_id_32DA( "player_is_invulnerable" );
}

_id_277A()
{
    if ( self._id_04A7 == "allies" )
        self._id_2D65 = 0.6;

    if ( self _meth_813F() )
    {
        if ( level._id_3BFE >= 2 )
            self._id_2D65 = 0.8;
        else
            self._id_2D65 = 0.6;
    }
}

_id_01D1()
{
    if ( self._id_04A7 == "allies" )
    {
        self._id_01D1 = 0.9;
        return;
    }

    if ( self _meth_813F() )
    {
        if ( level._id_3BFE >= 2 )
        {
            if ( _func_0B2( 100 ) < 33 )
                self._id_01D1 = 0.2;
            else
                self._id_01D1 = 0.5;
        }
        else if ( _func_0B2( 100 ) < 33 )
            self._id_01D1 = 0;
        else
            self._id_01D1 = 0.2;
    }
}

_id_14C8( var_0, var_1 )
{
    if ( _id_A5A4::_id_32D8( "player_no_auto_blur" ) )
        return;

    self notify( "blurview_stop" );
    self endon( "blurview_stop" );
    self _meth_82D6( var_0, 0 );
    wait 0.05;
    self _meth_82D6( 0, var_1 );
}

healthoverlayalt()
{
    self endon( "noHealthOverlay" );
    var_0 = _func_1AA( self );
    var_0.sourcewidth = 648;
    var_0.sourceheight = 486;
    var_0.scalewidth = 640;
    var_0.scaleheight = 480;

    switch ( level._id_038E )
    {
        case "airplane":
        case "blackout":
        case "cargoship":
        case "village_assault":
            _func_0D6( "cg_altDamageBrightness", 0.1 );
            _func_0D6( "cg_altDamageAlpha", ".65" );
            _func_0D6( "cg_altDamageFlashColor", ".2 0 0" );
            _func_0D6( "cg_bloodThickColor", "100 0 0 150" );
            var_1 = "overlay_low_health_alt";
            break;
        case "bog_a":
        case "launchfacility_b":
            _func_0D6( "cg_altDamageBrightness", 0.1 );
            _func_0D6( "cg_altDamageAlpha", ".7" );
            _func_0D6( "cg_altDamageFlashColor", ".2 0 0" );
            _func_0D6( "cg_bloodThickColor", "100 0 0 150" );
            var_1 = "overlay_low_health_alt";
            break;
        case "airlift":
            _func_0D6( "cg_altDamageDisableFilmTweak", 1 );
            _func_0D6( "cg_bloodThickColor", "100 0 0 150" );
            _func_0D6( "cg_altDamageBrightness", 0.1 );
            _func_0D6( "cg_altDamageAlpha", ".7" );
            _func_0D6( "cg_altDamageFlashColor", ".2 0 0" );
            var_1 = "overlay_low_health_alt";
            break;
        case "hunted":
            _func_0D6( "cg_altDamageBrightness", 0.1 );
            _func_0D6( "cg_altDamageAlpha", ".5" );
            _func_0D6( "cg_altDamageFlashColor", ".2 0 0" );
            _func_0D6( "cg_bloodThickColor", "100 0 0 150" );
            var_1 = "overlay_low_health_alt";
            break;
        default:
            _func_0D6( "cg_altDamageBrightness", 0 );
            _func_0D6( "cg_altDamageAlpha", "1" );
            _func_0D6( "cg_altDamageFlashColor", ".125 0 0" );
            _func_0D6( "cg_bloodThickColor", "100 0 0 100" );
            var_1 = "overlay_low_health";
            break;
    }

    var_0._id_0530 = 320;
    var_0._id_0538 = 240;
    var_0 _meth_80CE( var_1, var_0.scalewidth, var_0.scaleheight );
    var_0._id_03E3 = 1;
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0._id_03D4 = 1;
    var_0._id_0198 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 0;
    thread _id_478B( var_0 );

    for (;;)
    {
        var_0 _meth_8086( 0.5 );
        var_0.alpha = 0;

        if ( !_func_1A1( level._id_0318 ) )
            break;

        _id_A5A4::_id_32E0( "player_has_red_flashing_overlay" );

        if ( getdvarint( "cg_altDamageMode" ) == 1 )
        {
            redflashingoverlayalt( var_0 );
            continue;
        }

        wait 0.5;
    }
}

_id_4789()
{
    self endon( "noHealthOverlay" );
    var_0 = _func_1AA( self );
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "overlay_low_health", 640, 480 );
    var_0._id_03E3 = 1;
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_03D4 = 1;
    var_0._id_0198 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 0;
    thread _id_478B( var_0 );

    for (;;)
    {
        var_0 _meth_8086( 0.5 );
        var_0.alpha = 0;

        if ( !_func_1A1( level._id_0318 ) )
            break;

        _id_A5A4::_id_32E0( "player_has_red_flashing_overlay" );

        if ( getdvarint( "cg_altDamageMode" ) == 0 )
        {
            redflashingoverlay( var_0 );
            continue;
        }

        wait 0.5;
    }
}

bloodsplatter()
{
    self endon( "noHealthOverlay" );
    var_0 = _func_1AA( self );
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "h1_fullscreen_lit_bloodsplat_01", 640, 480 );
    var_0._id_03E3 = 1;
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_03D4 = 3;
    var_0._id_0198 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0._id_013B = 1;
    var_0.color = ( 0, 0, 0 );
    var_0.alpha = 0;
    thread _id_478B( var_0 );
    var_1 = 0;
    var_2 = 0.28;
    var_3 = 0.05;
    var_4 = 5;

    for (;;)
    {
        var_5 = _func_0E9( self._id_01E6 / self._id_0271, 0, 1 );
        var_6 = 1.0 - var_5;

        if ( var_1 > var_6 )
            var_1 -= var_2 * var_3;

        if ( var_1 < var_6 )
            var_1 = var_6;

        var_0.color = ( var_1, 0, 0 );

        if ( var_1 == 0 )
            var_0.alpha = 0;
        else
            var_0.alpha = 1;

        wait(var_3);
    }
}

redhitflash()
{
    self endon( "noHealthOverlay" );
    var_0 = _func_1AA( self );
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "h1_screen_blood", 640, 480 );
    var_0._id_03E3 = 1;
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_03D4 = 2;
    var_0._id_0198 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 0;
    thread _id_478B( var_0 );

    for (;;)
    {
        level._id_0318 _id_A0E5();

        if ( !_func_1A1( self ) )
            break;

        if ( getdvarint( "cg_altDamageMode" ) == 0 )
        {
            thread redhitflashoverlay( var_0 );
            continue;
        }

        wait 0.5;
    }

    var_0.alpha = 0;
}

redhitflashoverlay( var_0 )
{
    self endon( "hit_again" );
    var_0.alpha = 1;
    wait 0.17;
    var_0 _meth_8086( 0.25 );
    var_0.alpha = 0;
}

compasshealthoverlay()
{
    self endon( "noHealthOverlay" );
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 35;
    var_0 _meth_80CE( "overlay_low_health_compass", 336, 168 );
    var_0.alignx = "center";
    var_0.aligny = "bottom";
    var_0._id_03D4 = 1;
    var_0._id_0198 = 0;
    var_0._id_01F3 = "center";
    var_0._id_0501 = "bottom";
    var_0.alpha = 0;

    for (;;)
    {
        var_0 _meth_8086( 0.2 );
        var_0.alpha = 0;

        if ( !_func_1A1( self ) )
            break;

        self waittill( "activate_compass_red_overlay" );

        if ( !_id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
            continue;

        if ( getdvar( "compass" ) == "0" )
        {
            wait 0.5;
            continue;
        }

        compassflashingoverlay( var_0 );
    }
}

compassflashingoverlay( var_0 )
{
    self endon( "hit_again" );
    var_1 = gettime() + self._id_4441._id_584F;
    var_2 = var_1 + 500;
    var_3 = 0.2;
    var_4 = 0.2;

    while ( _func_1A1( self ) )
    {
        var_5 = 1;

        if ( gettime() > var_1 )
        {
            var_5 = 1 - ( gettime() - var_1 ) / ( var_2 - var_1 );

            if ( var_5 < 0 )
                var_5 = 0;
        }

        var_0 _meth_8086( var_3 );
        var_0.alpha = var_5;
        wait(var_3 + var_4);
        var_0 _meth_8086( var_3 );
        var_0.alpha = var_5 * 0.8;
        wait(var_3);

        if ( var_5 <= 0 )
            break;
    }
}

_id_0767( var_0 )
{
    if ( level._id_2153 )
        self._id_0189 = 2;
    else
        self._id_0189 = 1.6;

    self._id_0530 = 0;
    self._id_0538 = -36;
    self.alignx = "center";
    self.aligny = "bottom";
    self._id_01F3 = "center";
    self._id_0501 = "middle";

    if ( !isdefined( self.background ) )
        return;

    self.background._id_0530 = 0;
    self.background._id_0538 = -40;
    self.background.alignx = "center";
    self.background.aligny = "middle";
    self.background._id_01F3 = "center";
    self.background._id_0501 = "middle";

    if ( level._id_2153 )
        self.background _meth_80CE( "popmenu_bg", 650, 52 );
    else
        self.background _meth_80CE( "popmenu_bg", 650, 42 );

    self.background.alpha = 0.5;
}

_id_23E1()
{
    var_0 = _func_1AA( self );
    var_0 _id_0767();
    var_0 thread _id_28D4();
    var_0 thread _id_28D5();
    var_0 _meth_80CC( &"GAME_GET_TO_COVER" );
    var_0._id_0189 = 2;
    var_0.alpha = 1;
    var_0.color = ( 1, 0.9, 0.9 );
    var_0._id_03D4 = 1;
    var_0._id_0198 = 1;
    return var_0;
}

_id_A0E5()
{
    self endon( "hit_again" );
    self waittill( "damage" );
}

_id_28D4()
{
    self endon( "being_destroyed" );
    level._id_0318 _id_A0E5();
    var_0 = !_func_1A1( level._id_0318 );
    thread _id_28D3( var_0 );
}

_id_28D5()
{
    self endon( "being_destroyed" );
    common_scripts\utility::_id_384A( "missionfailed" );
    thread _id_28D3( 1 );
}

_id_28D3( var_0 )
{
    self notify( "being_destroyed" );
    self._id_13AA = 1;

    if ( var_0 )
    {
        self _meth_8086( 0.5 );
        self.alpha = 0;
        wait 0.5;
    }

    self notify( "death" );
    self _meth_808A();
}

_id_5A5A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( isdefined( var_0._id_13AA ) )
        return 0;

    return 1;
}

_id_3980( var_0, var_1 )
{
    self endon( "death" );
    var_0 *= 2;
    var_2 = var_0 - self._id_0189;
    self _meth_808D( var_1 );
    self._id_0189 += var_2;
}

pulseoverlay( var_0 )
{
    self endon( "hit_again" );
    self endon( "kill_pulse" );
    var_1 = 0.1;
    var_2 = 0.5;
    var_3 = 0.1;
    var_4 = 0.025;
    var_5 = 0.575;
    var_6 = 1;
    var_7 = 0.7;
    var_8 = 0.1;
    var_0.alpha = var_6;
    var_9 = _func_0E1( var_1, var_4 );
    var_9 += _func_0E1( var_3, var_8 );
    var_10 = _func_0E1( var_2, var_5 );
    var_10 += _func_0E1( var_3, var_8 );
    var_11 = "breathing_heartbeat";
    level._id_0318 _meth_809C( var_11 );

    for (;;)
    {
        var_0 _meth_8087( var_2, var_0.sourcewidth, var_0.sourceheight );
        var_0 _meth_8086( var_5 );
        var_0.alpha = var_7;
        wait(var_10);
        var_0 _meth_8087( var_1, var_0.scalewidth, var_0.scaleheight );
        var_0 _meth_8086( var_4 );
        var_0.alpha = var_6;
        wait(var_9);
        self _meth_82F1( var_11 );
    }
}

_id_35EE( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0.65;
    var_6 = 0.5;
    var_7 = var_5 * 0.2;
    var_8 = var_5 * ( 0.1 + var_2 * 0.1 );
    var_9 = var_5 * ( 0.05 + var_2 * 0.1 );
    var_10 = var_5 * 0.3;
    var_11 = var_5 - var_7 - var_8 - var_9 - var_10;

    if ( var_11 < 0 )
        var_11 = 0;

    var_12 = 0.5 + var_2 * 0.3;
    var_13 = 1 - ( 1 - var_12 ) / 2;
    var_0 _meth_8086( var_7 );
    var_0.alpha = var_3 * 1.0;

    if ( _id_5A5A( var_1 ) )
    {
        if ( !var_4 )
        {
            var_1 _meth_8086( var_7 );
            var_1.alpha = var_3 * 1.0;
        }
    }

    if ( isdefined( var_1 ) )
        var_1 thread _id_3980( 1.0, var_7 );

    wait(var_7 + var_8);
    var_0 _meth_8086( var_9 );
    var_0.alpha = var_3 * var_13;

    if ( _id_5A5A( var_1 ) )
    {
        if ( !var_4 )
        {
            var_1 _meth_8086( var_9 );
            var_1.alpha = var_3 * var_13;
        }
    }

    wait(var_9);
    var_0 _meth_8086( var_10 );
    var_0.alpha = var_3 * var_12;

    if ( _id_5A5A( var_1 ) )
    {
        if ( !var_4 )
        {
            var_1 _meth_8086( var_10 );
            var_1.alpha = var_3 * var_12;
        }
    }

    if ( isdefined( var_1 ) )
        var_1 thread _id_3980( 0.9, var_10 );

    wait(var_10);
    wait(var_11);
}

_id_9110()
{
    if ( isdefined( level._id_229B ) )
        return 0;

    if ( isdefined( self._id_9A04 ) && self._id_9A04 == 1 )
        return 0;

    if ( isdefined( self._id_9C7E ) )
        return 0;

    return 1;
}

_id_8477()
{
    if ( _id_A5A4::is_h1_level() )
        return 0;

    if ( !_func_1A1( self ) )
        return 0;

    if ( self _meth_806A() )
        return 0;

    if ( self._id_01FF )
        return 0;

    if ( !_id_9110() )
        return 0;

    if ( self._id_3BFE > 1 )
        return 0;

    if ( level._id_5CDE )
        return 0;

    if ( !_id_A550::_id_5982() )
        return 0;

    if ( getdvar( "limited_mode" ) == "1" )
        return 0;

    var_0 = self _meth_8212( "takeCoverWarnings" );

    if ( var_0 <= 3 )
        return 0;

    return 1;
}

redflashingoverlayalt( var_0 )
{
    self endon( "hit_again" );
    self notify( "activate_compass_red_overlay" );
    var_1 = undefined;

    if ( _id_8477() )
        var_1 = _id_23E1();

    var_2 = gettime() + self._id_4441._id_584F;
    thread pulseoverlay( var_0 );
    wait(self._id_4441._id_584F / 1000.0);

    if ( _id_5A5A( var_1 ) )
    {
        var_1 _meth_8086( 1.0 );
        var_1.alpha = 0;
    }

    self notify( "kill_pulse" );
    var_0 _meth_8086( 0.5 );
    var_0.alpha = 0;
    _id_A5A4::_id_32DA( "player_has_red_flashing_overlay" );

    if ( !isdefined( self._id_2A84 ) || !self._id_2A84 )
    {
        var_3 = "breathing_better";

        if ( _func_1CA( var_3 ) )
            self _meth_82F1( var_3 );
    }

    if ( _id_A5A4::_id_32D8( "near_death_vision_enabled" ) )
        self _meth_823C();
}

redflashingoverlay( var_0 )
{
    self endon( "hit_again" );
    self notify( "activate_compass_red_overlay" );
    var_1 = undefined;

    if ( _id_8477() )
        var_1 = _id_23E1();

    var_2 = gettime() + self._id_4441._id_584F;
    _id_35EE( var_0, var_1, 0.8, 0.7, 0 );
    level._id_0318 _meth_809C( "breathing_heartbeat" );

    while ( gettime() < var_2 && _func_1A1( self ) && _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
    {
        _id_35EE( var_0, var_1, 0.9, 1, 0 );
        var_3 = "breathing_heartbeat";

        if ( _func_1CA( var_3 ) )
            self _meth_82F1( var_3 );
    }

    if ( _id_5A5A( var_1 ) )
    {
        var_1 _meth_8086( 1.0 );
        var_1.alpha = 0;
    }

    _id_35EE( var_0, var_1, 0, 0.7, 1 );
    var_0 _meth_8086( 0.5 );
    var_0.alpha = 0;
    _id_A5A4::_id_32DA( "player_has_red_flashing_overlay" );

    if ( !isdefined( self._id_2A84 ) || !self._id_2A84 )
    {
        var_4 = "breathing_better";

        if ( _func_1CA( var_4 ) )
            self _meth_82F1( var_4 );
    }

    if ( _id_A5A4::_id_32D8( "near_death_vision_enabled" ) )
        self _meth_823C();
}

_id_478B( var_0 )
{
    self waittill( "noHealthOverlay" );
    var_0 _meth_808A();
}

_id_745C()
{
    waitframe;
    _id_8010( 1 );
}

_id_4D65()
{
    var_0 = level._id_038E == "cargoship" || level._id_038E == "coup";

    if ( self _meth_8212( "takeCoverWarnings" ) == -1 || var_0 )
        self _meth_8213( "takeCoverWarnings", 9 );
}

_id_4C3B()
{
    self notify( "new_cover_on_death_thread" );
    self endon( "new_cover_on_death_thread" );
    self waittill( "death" );

    if ( !_id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
        return;

    if ( !_id_9110() )
        return;

    if ( level._id_3BFE > 1 )
        return;

    var_0 = self _meth_8212( "takeCoverWarnings" );

    if ( var_0 < 10 )
        self _meth_8213( "takeCoverWarnings", var_0 + 1 );
}

_id_06AA()
{
    level._id_88B2 = ::_id_1121;
    setdvar( "aa_player_kills", "0" );
    setdvar( "aa_enemy_deaths", "0" );
    setdvar( "aa_enemy_damage_taken", "0" );
    setdvar( "aa_player_damage_taken", "0" );
    setdvar( "aa_player_damage_dealt", "0" );
    setdvar( "aa_ads_damage_dealt", "0" );
    setdvar( "aa_time_tracking", "0" );
    setdvar( "aa_deaths", "0" );
    setdvar( "player_cheated", 0 );
    level._id_1122 = [];
    thread _id_06B1();
    thread _id_06AD();
    thread _id_06AB();
    common_scripts\utility::_id_383F( "auto_adjust_initialized" );
    common_scripts\utility::_id_383D( "aa_main_" + level._id_038E );
    common_scripts\utility::_id_383F( "aa_main_" + level._id_038E );
}

_id_06B1()
{
    waitframe;

    for (;;)
        wait 0.2;
}

_id_06AB()
{
    level._id_0318 endon( "death" );
    level._id_6A4E = 0;

    for (;;)
    {
        if ( level._id_0318 _id_A5A4::_id_50A9() )
        {
            level._id_6A4E = gettime();

            while ( level._id_0318 _id_A5A4::_id_50A9() )
                wait 0.05;

            continue;
        }

        wait 0.05;
    }
}

_id_06AD()
{
    for (;;)
    {
        level._id_0318 waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
        _id_06A5( "aa_player_damage_taken", var_0 );

        if ( !_func_1A1( level._id_0318 ) )
        {
            _id_06A5( "aa_deaths", 1 );
            return;
        }
    }
}

_id_1121( var_0 )
{
    if ( !isdefined( level._id_1120 ) )
        level._id_1120 = [];

    common_scripts\utility::_id_384A( "auto_adjust_initialized" );
    level._id_1122[var_0] = [];
    level._id_1120[var_0] = 0;
    common_scripts\utility::_id_384A( var_0 );

    if ( getdvar( "aa_zone" + var_0 ) == "" )
    {
        setdvar( "aa_zone" + var_0, "on" );
        level._id_1120[var_0] = 1;
        _id_06B2();
        setdvar( "start_time" + var_0, getdvar( "aa_time_tracking" ) );
        setdvar( "starting_player_kills" + var_0, getdvar( "aa_player_kills" ) );
        setdvar( "starting_deaths" + var_0, getdvar( "aa_deaths" ) );
        setdvar( "starting_ads_damage_dealt" + var_0, getdvar( "aa_ads_damage_dealt" ) );
        setdvar( "starting_player_damage_dealt" + var_0, getdvar( "aa_player_damage_dealt" ) );
        setdvar( "starting_player_damage_taken" + var_0, getdvar( "aa_player_damage_taken" ) );
        setdvar( "starting_enemy_damage_taken" + var_0, getdvar( "aa_enemy_damage_taken" ) );
        setdvar( "starting_enemy_deaths" + var_0, getdvar( "aa_enemy_deaths" ) );
    }
    else if ( getdvar( "aa_zone" + var_0 ) == "done" )
        return;

    common_scripts\utility::_id_3857( var_0 );
    _id_1123( var_0 );
}

_id_1123( var_0 )
{
    setdvar( "aa_zone" + var_0, "done" );
    var_1 = getdvarfloat( "start_time" + var_0 );
    var_2 = getdvarint( "starting_player_kills" + var_0 );
    var_3 = getdvarint( "aa_enemy_deaths" + var_0 );
    var_4 = getdvarint( "aa_enemy_damage_taken" + var_0 );
    var_5 = getdvarint( "aa_player_damage_taken" + var_0 );
    var_6 = getdvarint( "aa_player_damage_dealt" + var_0 );
    var_7 = getdvarint( "aa_ads_damage_dealt" + var_0 );
    var_8 = getdvarint( "aa_deaths" + var_0 );
    level._id_1120[var_0] = 0;
    _id_06B2();
    var_9 = getdvarfloat( "aa_time_tracking" ) - var_1;
    var_10 = getdvarint( "aa_player_kills" ) - var_2;
    var_11 = getdvarint( "aa_enemy_deaths" ) - var_3;
    var_12 = 0;

    if ( var_11 > 0 )
    {
        var_12 = var_10 / var_11;
        var_12 *= 100;
        var_12 = _func_0BC( var_12 );
    }

    var_13 = getdvarint( "aa_enemy_damage_taken" ) - var_4;
    var_14 = getdvarint( "aa_player_damage_dealt" ) - var_6;
    var_15 = 0;
    var_16 = 0;

    if ( var_13 > 0 && var_9 > 0 )
    {
        var_15 = var_14 / var_13;
        var_15 *= 100;
        var_15 = _func_0BC( var_15 );
        var_16 = var_14 / var_9;
        var_16 *= 60;
        var_16 = _func_0BC( var_16 );
    }

    var_17 = getdvarint( "aa_ads_damage_dealt" ) - var_7;
    var_18 = 0;

    if ( var_14 > 0 )
    {
        var_18 = var_17 / var_14;
        var_18 *= 100;
        var_18 = _func_0BC( var_18 );
    }

    var_19 = getdvarint( "aa_player_damage_taken" ) - var_5;
    var_20 = 0;

    if ( var_9 > 0 )
        var_20 = var_19 / var_9;

    var_21 = var_20 * 60;
    var_21 = _func_0BC( var_21 );
    var_22 = getdvarint( "aa_deaths" ) - var_8;
    var_23 = [];
    var_23["player_damage_taken_per_minute"] = var_21;
    var_23["player_damage_dealt_per_minute"] = var_16;
    var_23["minutes"] = var_9 / 60;
    var_23["deaths"] = var_22;
    var_23["gameskill"] = level._id_3BFE;
    level._id_1122[var_0] = var_23;
    var_24 = "Completed AA sequence: ";
    var_24 += ( level._id_038E + "/" + var_0 );
    var_25 = _func_1D3( var_23 );

    for ( var_26 = 0; var_26 < var_25.size; var_26++ )
        var_24 = var_24 + ", " + var_25[var_26] + ": " + var_23[var_25[var_26]];

    logstring( var_24 );
}

_id_06AE( var_0, var_1 )
{
    logstring( var_0 + ": " + var_1[var_0] );
}

_id_06B2()
{

}

_id_06A5( var_0, var_1 )
{
    var_2 = getdvarint( var_0 );
    setdvar( var_0, var_2 + var_1 );
}

_id_06A6( var_0, var_1 )
{
    var_2 = getdvarfloat( var_0 );
    setdvar( var_0, var_2 + var_1 );
}

_id_74D1( var_0 )
{
    return 0;
}

_id_6A63( var_0 )
{
    if ( [[ level._id_254D ]]( var_0 ) )
        return 1;

    if ( _func_1AD( var_0 ) )
        return 1;

    if ( !isdefined( var_0._id_1B69 ) )
        return 0;

    return var_0 _id_6ACA();
}

_id_6ACA()
{
    return self._id_6AC2 * 1.75 > self._id_614F;
}

_id_3094( var_0, var_1, var_2 )
{

}

_id_111F( var_0, var_1, var_2, var_3 )
{
    _id_06A5( "aa_enemy_deaths", 1 );

    if ( !isdefined( var_1 ) )
        return;

    if ( !_id_6A63( var_1 ) )
        return;

    [[ level._id_422E ]]( var_2, self._id_00FD, var_3 );
    _id_06A5( "aa_player_kills", 1 );
}

_id_111E( var_0, var_1, var_2, var_3, var_4, var_5, var_0 )
{
    if ( !_func_1A1( self ) || self._id_0112 )
    {
        _id_111F( var_1, var_2, var_5, var_4 );
        return;
    }

    if ( !_id_6A63( var_2 ) )
        return;

    _id_06AC( var_1, var_5, var_4 );
}

_id_06AC( var_0, var_1, var_2 )
{
    _id_06A5( "aa_player_damage_dealt", var_0 );

    if ( !level._id_0318 _id_A5A4::_id_50A9() )
    {
        [[ level._id_4225 ]]( var_1, self._id_00FD, var_2 );
        return 0;
    }

    if ( !_id_1893( var_1 ) )
    {
        [[ level._id_4225 ]]( var_1, self._id_00FD, var_2 );
        return 0;
    }

    [[ level._id_4226 ]]( var_1, self._id_00FD, var_2 );
    _id_06A5( "aa_ads_damage_dealt", var_0 );
    return 1;
}

_id_1893( var_0 )
{
    if ( var_0 == "MOD_PISTOL_BULLET" )
        return 1;

    return var_0 == "MOD_RIFLE_BULLET";
}

_id_21C3()
{

}

_id_8874()
{

}

_id_8873()
{

}

_id_43E7( var_0 )
{

}

_id_14B6( var_0 )
{

}

_id_075E( var_0, var_1, var_2 )
{

}

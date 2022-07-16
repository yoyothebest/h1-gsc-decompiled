// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

_id_4C9E()
{
    var_0 = [];
    var_0["standard"] = %melee_1;
    var_0["standard_stand_to_melee"] = %stand_2_melee_1;
    var_0["standard_run_to_melee"] = %run_2_melee_charge;
    var_0["aivai_exposed_attackerwins_attack"] = %melee_f_awin_attack;
    var_0["aivai_exposed_attackerwins_defend"] = %melee_f_awin_defend;
    var_0["aivai_exposed_attackerwins_defend_survive"] = %melee_f_awin_defend_survive;
    var_0["aivai_exposed_defenderwins_attack"] = %melee_f_dwin_attack;
    var_0["aivai_exposed_defenderwins_defend"] = %melee_f_dwin_defend;
    var_0["aivai_wrestle_attackerwins_attack"] = %bog_melee_r_attack;
    var_0["aivai_wrestle_attackerwins_defend"] = %bog_melee_r_defend;
    var_0["aivai_wrestle_attackerwins_defend_survive"] = %bog_melee_r_backdeath2;
    var_0["aivai_behind_attackerwins_attack"] = %melee_sync_attack;
    var_0["aivai_behind_attackerwins_defend"] = %melee_sync_defend;
    var_0["aivai_exposed_defenderwins_attack_kick"] = %melee_f_dwin_attack_kick;
    var_0["aivai_exposed_defenderwins_defend_kick"] = %melee_f_dwin_defend_kick;
    var_0["aivai_exposed_defenderwins_attack_survive_kick"] = %melee_f_dwin_attack_survive_kick;
    var_0["aivai_coverleft_attackerwins_attack"] = %cornersdl_melee_wina_attacker;
    var_0["aivai_coverleft_attackerwins_defend"] = %cornersdl_melee_wina_defender;
    var_0["aivai_coverleft_attackerwins_defend_survive"] = %cornersdl_melee_wina_defender_survive;
    var_0["aivai_coverleft_defenderwins_attack"] = %cornersdl_melee_wind_attacker;
    var_0["aivai_coverleft_defenderwins_attack_survive"] = %cornersdl_melee_wind_attacker_survive;
    var_0["aivai_coverleft_defenderwins_defend"] = %cornersdl_melee_wind_defender;
    var_0["aivai_coverright_attackerwins_attack"] = %cornersdr_melee_wina_attacker;
    var_0["aivai_coverright_attackerwins_defend"] = %cornersdr_melee_wina_defender;
    var_0["aivai_coverright_defenderwins_attack"] = %cornersdr_melee_wind_attacker;
    var_0["aivai_coverright_defenderwins_defend"] = %cornersdr_melee_wind_defender;
    anim._id_0CCA["soldier"]["melee"] = var_0;
}

_id_5B61()
{
    precachemodel( "weapon_parabolic_knife" );
    level._id_058F["melee_knife_ai"] = loadfx( "vfx/weaponimpact/flesh_impact_knife" );
}

_id_5B78()
{
    if ( !isdefined( self._id_0669 ) )
        return 0;

    if ( isdefined( self._id_32D8 ) && isdefined( self._id_32D8["_stealth_enabled"] ) && self._id_32D8["_stealth_enabled"] )
    {
        if ( isdefined( self._id_32D8["_stealth_attack"] ) && !self._id_32D8["_stealth_attack"] )
            return 1;
    }

    return 0;
}

_id_5B7B()
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( isdefined( self._id_2D38 ) )
        return 0;

    if ( _id_5B78() )
        return 0;

    if ( !_id_5B38( self._id_0142 ) )
        return 0;

    _id_5B6B();

    if ( !_id_5B4A() )
    {
        _id_5B6A( self._id_0142 );
        return 0;
    }

    self _meth_819E( ::_id_5B63, ::_id_5B54 );
}

_id_5B6B()
{
    self._id_5B36._id_04A4 = self._id_0142;
    self._id_5B36._id_4DE7 = 0;
    self._id_5B36._id_4E43 = 0;
}

_id_5B4A()
{
    if ( !_id_5B62() )
        return 0;

    self._id_5B36._id_4DE7 = 1;

    if ( _id_5B3A() )
    {
        self._id_5B36._id_3AE4 = ::_id_5B45;
        return 1;
    }

    if ( _id_5B70() )
    {
        if ( isdefined( self._id_8A31 ) )
            self._id_5B36._id_3AE4 = self._id_8A31;
        else
            self._id_5B36._id_3AE4 = ::_id_5B73;

        return 1;
    }

    self._id_5B36._id_3AE4 = undefined;
    self._id_60D2 = gettime() + 150;
    self._id_60D1 = self._id_5B36._id_04A4;
    return 0;
}

_id_5B7E()
{
    var_0 = 1;
    var_1 = _func_0EF( self._id_5B36._id_8D38, self._id_5B36._id_04A4._id_02E2 );

    if ( var_1 < 32 )
    {
        var_2 = _func_114( ( self._id_5B36._id_8D38[0] - self._id_5B36._id_04A4._id_02E2[0], self._id_5B36._id_8D38[1] - self._id_5B36._id_04A4._id_02E2[1], 0 ) );
        self._id_5B36._id_8D38 += var_2 * ( 32 - var_1 );

        if ( _func_0EE( self._id_5B36._id_8D38, self._id_5B36._id_04A4._id_02E2 ) < 31.9 )
            return 0;

        var_0 = 0;
    }

    var_3 = self _meth_813E( self._id_5B36._id_8D38 );

    if ( !isdefined( var_3 ) )
        return 0;

    if ( _func_0BE( self._id_5B36._id_8D38[2] - var_3[2] ) > 51.2 )
        return 0;

    if ( _func_0BE( self._id_02E2[2] - var_3[2] ) > 51.2 )
        return 0;

    self._id_5B36._id_8D38 = var_3;

    if ( !self _meth_81C7( self._id_5B36._id_8D38, 1, var_0 ) )
        return 0;

    if ( isdefined( self._id_5B36._id_8D43 ) )
    {
        var_4 = self._id_5B36._id_8D38 - self._id_5B36._id_04A4._id_02E2;
        var_5 = anglestoforward( self._id_5B36._id_8D43 );
        var_6 = _func_0F6( var_5, var_4 );
        var_7 = self._id_5B36._id_8D38 - var_5 * var_6;
        var_8 = self._id_5B36._id_04A4._id_02E2 - var_7;
        var_9 = _func_0EF( self._id_5B36._id_04A4._id_02E2, var_7 );

        if ( var_9 < 32 )
            var_7 -= var_8 * ( 32 - var_9 ) / 32;
    }
    else
    {
        var_2 = _func_114( ( self._id_5B36._id_8D38[0] - self._id_5B36._id_04A4._id_02E2[0], self._id_5B36._id_8D38[1] - self._id_5B36._id_04A4._id_02E2[1], 0 ) );
        var_7 = self._id_5B36._id_04A4._id_02E2 + var_2 * 32;
    }

    if ( !self _meth_81C8( self._id_5B36._id_8D38, var_7, 1, 0 ) )
        return 0;

    if ( !self _meth_81C8( var_7, self._id_5B36._id_04A4._id_02E2, 1, 1 ) )
        return 0;

    return 1;
}

_id_5B62()
{
    if ( !isdefined( self._id_5B36._id_04A4 ) )
        return 0;

    var_0 = self._id_5B36._id_04A4;

    if ( isdefined( var_0._id_2D38 ) )
        return 0;

    var_1 = _func_0F0( self._id_02E2, var_0._id_02E2 );

    if ( isdefined( self._id_5B82 ) )
        var_2 = self._id_5B82;
    else if ( _func_1AD( var_0 ) )
        var_2 = 40000;
    else
        var_2 = 25600;

    if ( !self._id_5B36._id_4DE7 && var_1 > var_2 )
        return 0;

    if ( !_func_1A1( self ) )
        return 0;

    if ( isdefined( self.a._id_6143 ) && self.a._id_7B46 >= gettime() + 50 )
        return 0;

    if ( isdefined( self._id_60D2 ) && isdefined( self._id_60D1 ) && gettime() < self._id_60D2 && self._id_60D1 == var_0 )
        return 0;

    if ( isdefined( self.a._id_6451 ) || self.a._id_6E5A == "prone" )
        return 0;

    if ( animscripts\utility::_id_9C3A() )
        return 0;

    if ( isdefined( self._id_01CA ) && self._id_01AA == 1 )
        return 0;

    if ( !_func_1A1( var_0 ) )
        return 0;

    if ( isdefined( var_0._id_2D2B ) || isdefined( var_0._id_01FF ) && var_0._id_01FF )
        return 0;

    if ( !_func_0CF( var_0 ) && !_func_1AD( var_0 ) )
        return 0;

    if ( _func_0CF( var_0 ) )
    {
        if ( var_0 _meth_819F() )
            return 0;

        if ( var_0 _id_A5A4::_id_2CE7() || var_0._id_0112 )
            return 0;
    }

    if ( _func_1AD( var_0 ) )
        var_3 = var_0 _meth_8180();
    else
        var_3 = var_0.a._id_6E5A;

    if ( var_3 != "stand" && var_3 != "crouch" )
        return 0;

    if ( isdefined( self._id_58D7 ) && isdefined( var_0._id_58D7 ) )
        return 0;

    if ( isdefined( var_0._id_01CA ) )
        return 0;

    if ( self._id_5B36._id_4E43 )
        var_4 = 110;
    else
        var_4 = 60;

    var_5 = _func_0EB( self.angles[1] - animscripts\utility::_id_4171( var_0._id_02E2 ) );

    if ( _func_0BE( var_5 ) > var_4 )
        return 0;

    if ( var_1 <= 4096 )
        return 1;

    if ( self._id_5B36._id_4E43 )
        return 0;

    if ( isdefined( self._id_60D0 ) && isdefined( self._id_60CF ) && gettime() < self._id_60D0 && self._id_60CF == var_0 )
        return 0;

    return 1;
}

_id_5B77()
{
    self._id_5B36._id_6DB8 = 1;
    self.a._id_5F5B = "run";
}

_id_5B79()
{
    self _meth_8144( %body, 0.2 );
    self._id_5B36._id_6DB8 = undefined;
    self.a._id_5F5B = "stop";
    self _meth_8193( "face default" );
}

_id_5B63()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );

    for (;;)
    {
        var_0 = self._id_5B36._id_3AE4;
        [[ self._id_5B36._id_3AE4 ]]();

        if ( !isdefined( self._id_5B36._id_3AE4 ) || var_0 == self._id_5B36._id_3AE4 )
            break;
    }
}

_id_5B71( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    self._id_60D4 = gettime() + 2500;
    self._id_60D3 = var_0;
}

_id_5B6F()
{
    var_0 = _func_0F0( self._id_5B36._id_04A4._id_02E2, self._id_02E2 );

    if ( var_0 > 4096 && isdefined( self._id_60D4 ) && isdefined( self._id_60D3 ) && gettime() < self._id_60D4 && self._id_60D3 == self._id_5B36._id_04A4 )
        return 0;

    return 1;
}

_id_5B70()
{
    if ( isdefined( self._id_5B36._id_04A4._id_58D7 ) )
        return 0;

    if ( !_id_5B6F() )
        return 0;

    if ( isdefined( self._id_5B36._id_04A4._id_8A32 ) )
        return 0;

    return _id_5B76();
}

_id_5B75()
{
    if ( isdefined( self._id_5B82 ) )
        var_0 = self._id_5B82;
    else if ( _func_1AD( self._id_5B36._id_04A4 ) )
        var_0 = 40000;
    else
        var_0 = 25600;

    if ( _func_0F0( self._id_02E2, self._id_5B36._id_04A4._id_02E2 ) > var_0 )
        self._id_5B36._id_420F = gettime() + 3000;
    else
        self._id_5B36._id_420F = gettime() + 1000;
}

_id_5B73()
{
    self _meth_8192( "zonly_physics" );

    if ( isdefined( self._id_5B36._id_04A4 ) )
        _id_5B75();

    while ( isdefined( self._id_5B36._id_04A4 ) )
    {
        if ( !_id_5B72() )
        {
            self._id_60D0 = gettime() + 1500;
            self._id_60CF = self._id_5B36._id_04A4;
            break;
        }

        if ( !isdefined( self._id_5B36._id_04A4 ) )
            break;

        animscripts\battlechatter_ai::_id_33B4();
        self _meth_8193( "face point", self._id_5B36._id_04A4._id_02E2 );
        var_0 = animscripts\utility::_id_5863( "melee", "standard" );
        self _meth_8112( "meleeanim", var_0, %body, 1, 0.2, 1 );
        _id_5B68( var_0 );
        self._id_5B36._id_4E43 = 1;

        if ( !_id_5B74() )
        {
            _id_5B71( self._id_5B36._id_04A4 );
            break;
        }
    }

    self _meth_8192( "none" );
}

_id_5B74()
{
    for (;;)
    {
        self waittill( "meleeanim", var_0 );

        if ( var_0 == "end" )
            return 1;

        if ( var_0 == "stop" )
        {
            if ( !_id_5B4A() )
                return 0;

            if ( self._id_5B36._id_3AE4 != ::_id_5B73 )
                return 1;
        }

        if ( var_0 == "fire" )
        {
            if ( isdefined( self._id_5B36._id_04A4 ) )
            {
                var_1 = self._id_5B36._id_04A4._id_01E6;
                self _meth_81EC();

                if ( isdefined( self._id_5B36._id_04A4 ) && self._id_5B36._id_04A4._id_01E6 < var_1 )
                    _id_5B75();
            }
        }
    }
}

_id_5B76()
{
    if ( !isdefined( self._id_5B36._id_04A4 ) )
        return 0;

    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( !_id_5B62() )
        return 0;

    var_0 = _func_114( self._id_5B36._id_04A4._id_02E2 - self._id_02E2 );
    self._id_5B36._id_8D38 = self._id_5B36._id_04A4._id_02E2 - 40.0 * var_0;
    return _id_5B7E();
}

_id_5B72()
{
    if ( !_id_5B76() )
        return 0;

    var_0 = common_scripts\utility::_id_2B73( self._id_02E2, self._id_5B36._id_04A4._id_02E2 );

    if ( var_0 <= 4096 )
    {
        var_1 = animscripts\utility::_id_5863( "melee", "standard_stand_to_melee" );
        self _meth_8111( "readyanim", var_1, %body, 1, 0.3, 1 );
        _id_5B68( var_1 );
        animscripts\shared::_id_2D06( "readyanim" );
        return 1;
    }

    _id_5B67();
    var_2 = self._id_5B36._id_04A4._id_02E2;
    var_3 = 0.1;
    var_4 = animscripts\utility::_id_5863( "melee", "standard_run_to_melee" );
    var_5 = _func_0F1( _func_092( var_4, 0, 1 ) );
    var_6 = 32;
    var_7 = 48.0 + var_6 + var_5;
    var_8 = var_7 * var_7;
    var_9 = 64 + var_6;
    var_10 = var_9 * var_9;
    var_11 = getanimlength( var_4 ) * 1000;
    var_12 = var_11 - 100;
    var_13 = var_11 - 200;
    var_14 = 0;
    var_15 = undefined;
    var_16 = animscripts\utility::_id_5863( "run", "straight" );

    if ( _func_1AD( self._id_5B36._id_04A4 ) && self._id_5B36._id_04A4 == self._id_0142 )
        self _meth_8193( "face enemy" );
    else
        self _meth_8193( "face point", self._id_5B36._id_04A4._id_02E2 );

    self _meth_8111( "chargeanim", var_16, %body, 1, 0.2, 1 );
    _id_5B68( var_16 );
    var_17 = 0;

    for (;;)
    {
        var_18 = gettime();
        var_19 = isdefined( var_15 ) && var_15 <= var_8;

        if ( !var_17 )
        {
            if ( var_19 )
            {
                _id_5B77();
                self _meth_8112( "chargeanim", var_4, %body, 1, 0.1, 1 );
                _id_5B68( var_4 );
                var_14 = var_18;
                var_17 = 1;
            }
        }
        else
        {
            var_20 = var_0 <= var_8;

            if ( var_18 - var_14 >= var_12 || !var_19 && !var_20 )
            {
                _id_5B77();
                self _meth_8111( "chargeanim", var_16, %body, 1, 0.3, 1 );
                _id_5B68( var_16 );
                var_17 = 0;
            }
        }

        animscripts\notetracks::_id_2D0B( var_3, "chargeanim" );

        if ( !_id_5B76() )
        {
            _id_5B79();
            return 0;
        }

        var_0 = common_scripts\utility::_id_2B73( self._id_02E2, self._id_5B36._id_04A4._id_02E2 );
        var_21 = ( self._id_5B36._id_04A4._id_02E2 - var_2 ) * 1 / ( gettime() - var_18 );
        var_2 = self._id_5B36._id_04A4._id_02E2;
        var_22 = self._id_5B36._id_04A4._id_02E2 + var_21 * var_13;
        var_15 = common_scripts\utility::_id_2B73( self._id_02E2, var_22 );

        if ( var_17 && var_0 <= var_10 && ( gettime() - var_14 >= var_12 || !_func_1AD( self._id_5B36._id_04A4 ) ) )
            break;

        if ( !var_17 && gettime() >= self._id_5B36._id_420F )
        {
            _id_5B79();
            return 0;
        }
    }

    _id_5B79();
    return 1;
}

_id_5B67()
{
    if ( !isdefined( self.a._id_60CE ) )
        self.a._id_60CE = 0;

    if ( isdefined( self._id_0142 ) && _func_1AD( self._id_0142 ) || _func_0B2( 3 ) == 0 )
    {
        if ( gettime() > self.a._id_60CE )
        {
            animscripts\face::_id_7824( "meleecharge" );
            self.a._id_60CE = gettime() + 8000;
        }
    }
}

_id_5B3F( var_0 )
{
    var_1 = 90;

    if ( self._id_5B36._id_4E43 )
        var_1 += 50;

    if ( _func_0BE( var_0 ) < var_1 )
        return 0;

    var_2 = self._id_5B36._id_04A4;
    _id_5B4F();

    if ( self._id_5B36._id_A342 )
    {
        self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_exposed_attackerwins_attack" );
        var_2._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_exposed_attackerwins_defend" );
        var_2._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_exposed_attackerwins_defend_survive" );
    }
    else
    {
        self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_attack" );
        var_2._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_defend" );
    }

    return 1;
}

_id_5B40( var_0 )
{
    var_1 = 100;

    if ( self._id_5B36._id_4E43 )
        var_1 += 50;

    if ( _func_0BE( var_0 ) < var_1 )
        return 0;

    var_2 = self._id_5B36._id_04A4;

    if ( isdefined( var_2._id_58D7 ) )
        return 0;

    if ( isdefined( var_2._id_5B7F ) )
        return 0;

    self._id_5B36._id_A342 = 1;
    self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_wrestle_attackerwins_attack" );
    var_2._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_wrestle_attackerwins_defend" );
    var_2._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_wrestle_attackerwins_defend_survive" );
    return 1;
}

melee_aivsai_exposed_chooseanimationandposition_kick( var_0 )
{
    var_1 = 90;

    if ( self._id_5B36._id_4E43 )
        var_1 += 50;

    if ( _func_0BE( var_0 ) < var_1 )
        return 0;

    if ( isdefined( self._id_58D7 ) )
        return 0;

    var_2 = self._id_5B36._id_04A4;

    if ( isdefined( self._id_5B7F ) )
        return 0;

    self._id_5B36._id_A342 = 0;
    self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_attack_kick" );
    self._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_attack_survive_kick" );
    var_2._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_exposed_defenderwins_defend_kick" );
    return 1;
}

_id_5B3D( var_0 )
{
    if ( -90 > var_0 || var_0 > 0 )
        return 0;

    var_1 = self._id_5B36._id_04A4;

    if ( isdefined( var_1._id_58D7 ) )
        return 0;

    if ( isdefined( var_1._id_5B7F ) )
        return 0;

    self._id_5B36._id_A342 = 1;
    self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_behind_attackerwins_attack" );
    var_1._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_behind_attackerwins_defend" );
    return 1;
}

_id_5B3E()
{
    if ( isdefined( self._id_5B88 ) )
        var_0[0] = ::_id_5B3F;
    else if ( isdefined( self._id_5B89 ) )
        var_0[0] = ::_id_5B40;
    else
    {
        var_0[0] = ::_id_5B3F;
        var_0[1] = ::_id_5B40;
        var_0[2] = ::melee_aivsai_exposed_chooseanimationandposition_kick;
        var_0[3] = ::_id_5B3D;

        for ( var_1 = 2; var_1 > 0; var_1-- )
        {
            var_2 = _func_0B2( var_1 + 1 );
            var_3 = var_0[var_1];
            var_0[var_1] = var_0[var_2];
            var_0[var_2] = var_3;
        }
    }

    return var_0;
}

_id_5B3C()
{
    if ( isdefined( self.h1_melee_animations_enabled ) && !self.h1_melee_animations_enabled )
        return 0;

    var_0 = self._id_5B36._id_04A4;
    var_1 = _func_115( var_0._id_02E2 - self._id_02E2 );
    var_2 = _func_0EB( var_0.angles[1] - var_1[1] );
    var_3 = _id_5B3E();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( [[ var_3[var_4] ]]( var_2 ) )
        {
            self._id_5B36._id_8CFF = ( 0, var_1[1], 0 );
            self._id_5B36._id_8D38 = _func_06F( var_0._id_02E2, var_0.angles, self._id_5B36._id_0C72 );

            if ( _id_5B7E() )
                return 1;
        }
    }

    return 0;
}

_id_5B4F()
{
    var_0 = self._id_5B36._id_04A4;

    if ( isdefined( self._id_5B7F ) )
    {
        self._id_5B36._id_A342 = 1;
        return;
    }
    else if ( isdefined( var_0._id_5B7F ) )
    {
        self._id_5B36._id_A342 = 0;
        return;
    }

    if ( isdefined( self._id_58D7 ) )
        self._id_5B36._id_A342 = 1;
    else if ( isdefined( var_0._id_58D7 ) )
        self._id_5B36._id_A342 = 0;
    else
        self._id_5B36._id_A342 = common_scripts\utility::_id_2006();
}

_id_5B48()
{
    var_0 = self._id_5B36._id_04A4;
    _id_5B4F();
    var_1 = var_0._id_22BA._id_04D9;

    if ( var_1 == "Cover Multi" )
        var_1 = animscripts\utility::_id_3F3F( var_0._id_22BA );

    if ( var_1 == "Cover Left" )
    {
        if ( self._id_5B36._id_A342 )
        {
            self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverleft_attackerwins_attack" );
            var_0._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverleft_attackerwins_defend" );
            var_0._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_coverleft_attackerwins_defend_survive" );
        }
        else
        {
            self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverleft_defenderwins_attack" );
            self._id_5B36._id_8FFB = animscripts\utility::_id_5863( "melee", "aivai_coverleft_defenderwins_attack_survive" );
            var_0._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverleft_defenderwins_defend" );
        }
    }
    else if ( self._id_5B36._id_A342 )
    {
        self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverright_attackerwins_attack" );
        var_0._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverright_attackerwins_defend" );
    }
    else
    {
        self._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverright_defenderwins_attack" );
        var_0._id_5B36._id_0C72 = animscripts\utility::_id_5863( "melee", "aivai_coverright_defenderwins_defend" );
    }

    self._id_5B36._id_8D38 = _func_06F( var_0._id_22BA._id_02E2, var_0._id_22BA.angles, self._id_5B36._id_0C72 );
    self._id_5B36._id_8CFF = ( var_0._id_22BA.angles[0], _func_0EB( var_0._id_22BA.angles[1] + 180 ), var_0._id_22BA.angles[2] );
    var_0._id_5B36._id_35C0 = animscripts\utility::_id_404B( var_0._id_22BA );
    self._id_5B36._id_8D43 = var_0._id_22BA.angles;

    if ( !_id_5B7E() )
    {
        self._id_5B36._id_8D43 = undefined;
        return 0;
    }

    return 1;
}

_id_5B47()
{
    if ( isdefined( self.h1_melee_animations_enabled ) && !self.h1_melee_animations_enabled )
        return 0;

    var_0 = self._id_5B36._id_04A4._id_22BA;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( _func_0F0( var_0._id_02E2, self._id_5B36._id_04A4._id_02E2 ) > 16 && isdefined( self._id_5B36._id_04A4.a._id_22AB ) && ( self._id_5B36._id_04A4.a._id_22AB != "hide" && self._id_5B36._id_04A4.a._id_22AB != "lean" ) )
        return 0;

    var_1 = _func_115( self._id_02E2 - var_0._id_02E2 );
    var_2 = _func_0EB( var_0.angles[1] - var_1[1] );
    var_3 = var_0._id_04D9;

    if ( var_3 == "Cover Multi" )
        var_3 = animscripts\utility::_id_3F3F( var_0 );

    if ( var_3 == "Cover Left" )
    {
        if ( var_2 >= -50 && var_2 <= 0 )
            return 1;
    }
    else if ( var_3 == "Cover Right" )
    {
        if ( var_2 >= 0 && var_2 <= 50 )
            return 1;
    }

    return 0;
}

_id_5B3A()
{
    var_0 = self._id_5B36._id_04A4;

    if ( !_func_0CF( var_0 ) || var_0._id_04D9 != "human" )
        return 0;

    if ( self._id_03F1 != "none" || var_0._id_03F1 != "none" )
        return 0;

    if ( isdefined( self._id_5B7F ) && isdefined( var_0._id_5B7F ) )
        return 0;

    if ( isdefined( self._id_58D7 ) && isdefined( var_0._id_58D7 ) )
        return 0;

    if ( isdefined( self._id_5B7F ) && isdefined( var_0._id_58D7 ) || isdefined( var_0._id_5B7F ) && isdefined( self._id_58D7 ) )
        return 0;

    if ( isdefined( self._id_8A32 ) )
    {
        if ( ![[ self._id_8A32 ]]() )
            return 0;

        self._id_5B36._id_6EE9 = 1;
    }
    else if ( isdefined( var_0._id_8A32 ) )
        return 0;
    else if ( _id_5B47() && _id_5B48() )
        self._id_5B36._id_6EE9 = 1;
    else
    {
        if ( !_id_5B3C() )
            return 0;

        self._id_5B36._id_6EE9 = 0;
    }

    if ( !isdefined( var_0._id_5B36._id_35C0 ) )
        var_0._id_5B36._id_35C0 = var_0.angles[1];

    self._id_5B36._id_8D39 = self._id_5B36._id_8D38 - var_0._id_02E2;
    return 1;
}

_id_5B46( var_0 )
{
    self._id_5B36._id_9088 = var_0;
    var_0._id_5B36._id_9088 = undefined;
}

_id_5B49( var_0 )
{
    if ( !isdefined( var_0._id_5B36 ) )
        return;

    _id_5B67();

    if ( !_func_1A1( var_0 ) )
        return;

    self._id_0426 = var_0;
    var_0._id_0426 = self;
    self._id_5B36._id_5786 = 1;
    var_0._id_5B36._id_5786 = 1;
    self _meth_8050( var_0, "tag_sync", 1, 1 );
}

_id_5B45()
{
    if ( !_id_5B41() )
    {
        self._id_60D0 = gettime() + 1500;
        self._id_60CF = self._id_5B36._id_04A4;
        return;
    }

    var_0 = self._id_5B36._id_04A4;

    if ( !animhasnotetrack( self._id_5B36._id_0C72, "sync" ) )
        return;

    _id_5B46( var_0 );

    if ( self._id_5B36._id_A342 )
    {
        self._id_5B36._id_0108 = undefined;
        var_0._id_5B36._id_0108 = 1;
    }
    else
    {
        var_0._id_5B36._id_0108 = undefined;
        self._id_5B36._id_0108 = 1;
    }

    self._id_5B36._id_66A5 = var_0;
    var_0._id_5B36._id_66A5 = self;

    if ( animscripts\utility::_id_9C3A() )
    {
        _id_A5A4::_id_39D0( self._id_0340, "primary" );
        self._id_560F = self._id_0340;
    }

    if ( var_0 animscripts\utility::_id_9C3A() )
    {
        var_0 _id_A5A4::_id_39D0( var_0._id_0340, "primary" );
        var_0._id_560F = var_0._id_0340;
    }

    self._id_5B36._id_0513 = self._id_0513;
    self._id_5B36._id_A2E9 = animscripts\utility::_id_3F47();
    var_0._id_5B36._id_0513 = var_0._id_0513;
    var_0._id_5B36._id_A2E9 = var_0 animscripts\utility::_id_3F47();
    self._id_5B36._id_4E43 = 1;
    var_0 _meth_819E( ::_id_5B3B, ::_id_5B54 );
    var_0 thread _id_5B39( self );
    self._id_5B36._id_04A4 = undefined;
    _id_5B3B();
}

_id_5B39( var_0 )
{
    self endon( "end_melee" );
    self endon( "melee_aivsai_execute" );
    wait 0.1;

    if ( isdefined( var_0 ) )
        var_0 notify( "end_melee" );

    self notify( "end_melee" );
}

_id_5B44( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 <= gettime() )
        return 0;

    if ( !_id_5B62() )
        return 0;

    var_2 = self._id_5B36._id_04A4;
    var_3 = _func_0F0( var_2._id_02E2, var_0 );

    if ( self._id_5B36._id_6EE9 )
        var_4 = 256;
    else
        var_4 = 1296;

    if ( var_3 > var_4 )
        return 0;

    self._id_5B36._id_8D38 = var_2._id_02E2 + self._id_5B36._id_8D39;

    if ( !_id_5B7E() )
        return 0;

    return 1;
}

_id_5B43( var_0 )
{
    var_1 = _func_0F0( ( self._id_02E2[0], self._id_02E2[1], 0 ), ( self._id_5B36._id_8D38[0], self._id_5B36._id_8D38[1], 0 ) );

    if ( var_1 < 64 && _func_0BE( self._id_5B36._id_8D38[2] - self._id_02E2[2] ) < 64 )
        return 1;

    var_2 = _func_0F0( ( var_0[0], var_0[1], 0 ), ( self._id_5B36._id_8D38[0], self._id_5B36._id_8D38[1], 0 ) );
    var_3 = _func_0F0( ( self._id_02E2[0], self._id_02E2[1], 0 ), ( self._id_5B36._id_04A4._id_02E2[0], self._id_5B36._id_04A4._id_02E2[1], 0 ) );

    if ( var_2 > var_3 && _func_0BE( self._id_5B36._id_04A4._id_02E2[2] - self._id_02E2[2] ) < 64 )
        return 1;

    return 0;
}

_id_5B42( var_0 )
{
    _id_5B79();

    if ( self._id_5B36._id_6EE9 )
    {
        self _meth_81CA( self._id_5B36._id_8D38, self._id_5B36._id_8CFF );
        wait 0.05;
    }
    else
    {
        self _meth_8193( "face angle", self._id_5B36._id_8CFF[1] );
        wait 0.05;
    }

    return _id_5B44( var_0 );
}

_id_5B41()
{
    if ( !_id_5B62() )
        return 0;

    _id_5B77();
    self _meth_8144( %body, 0.2 );
    self _meth_8149( animscripts\run::_id_40BD(), %body, 1, 0.2 );
    self _meth_8192( "zonly_physics" );
    self._id_0230 = 1;
    var_0 = gettime() + 1500;
    var_1 = self._id_5B36._id_04A4._id_02E2;

    while ( _id_5B44( var_1, var_0 ) )
    {
        if ( _id_5B43( var_1 ) )
            return _id_5B42( var_1 );

        self _meth_8193( "face point", self._id_5B36._id_8D38 );
        wait 0.05;
    }

    _id_5B79();
    return 0;
}

_id_5B3B()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );
    self notify( "melee_aivsai_execute" );
    self _meth_8192( "zonly_physics" );
    self.a._id_8A1A = "none";
    self._id_8A2C = undefined;
    thread _id_5B52();
    thread _id_5B65();

    if ( isdefined( self._id_5B36._id_35C0 ) )
        self _meth_8193( "face angle", self._id_5B36._id_35C0 );
    else
        self _meth_8193( "face current" );

    self.a._id_6E5A = "stand";
    self _meth_8144( %body, 0.2 );

    if ( isdefined( self._id_5B36._id_0108 ) )
        _id_5B50();

    self _meth_8112( "meleeAnim", self._id_5B36._id_0C72, %body, 1, 0.2 );
    _id_5B68( self._id_5B36._id_0C72 );
    var_0 = animscripts\shared::_id_2D06( "meleeAnim", ::_id_5B5C );

    if ( var_0 == "melee_death" && ( isdefined( self._id_5B36._id_8FF9 ) || isdefined( self._id_58D7 ) && self._id_58D7 ) )
    {
        _id_5B53();
        self _meth_8112( "meleeAnim", self._id_5B36._id_8FFB, %body, 1, 0.2 );
        _id_5B68( self._id_5B36._id_8FFB );
        var_0 = animscripts\shared::_id_2D06( "meleeAnim", ::_id_5B5C );
    }

    if ( isdefined( self._id_5B36 ) && isdefined( self._id_5B36._id_0108 ) )
        self _meth_8054();

    self._id_0230 = 0;
}

_id_5B50()
{
    self._id_5B36._id_A1BF = self.allowpain;
    self._id_5B36._id_A1C9 = self._id_38A8;
    _id_A5A4::_id_2AC2();
    _id_A5A4::_id_7F71( 1 );
}

_id_5B64()
{
    return isdefined( self._id_5B36._id_0513 ) && self._id_5B36._id_0513 != "none" && self._id_0513 != self._id_5B36._id_0513;
}

_id_5B53()
{
    if ( self._id_0513 != "none" && self._id_560F != "none" )
        return;

    if ( !isdefined( self._id_5B36._id_0513 ) || self._id_5B36._id_0513 == "none" )
        return;

    _id_A5A4::_id_39D0( self._id_5B36._id_0513, self._id_5B36._id_A2E9 );

    if ( isdefined( self._id_5B36._id_2F75 ) )
    {
        self._id_5B36._id_2F75 delete();
        self._id_5B36._id_2F75 = undefined;
    }
}

_id_5B52()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );
    self waittill( "weapon_dropped", var_0 );

    if ( isdefined( var_0 ) )
        self._id_5B36._id_2F75 = var_0;
}

_id_5B66()
{
    if ( !isdefined( self._id_5B36._id_8FFB ) )
        return 0;

    if ( !isdefined( self._id_5B36._id_8FFA ) )
        return 0;

    return 1;
}

_id_5B65()
{
    self endon( "killanimscript" );
    self endon( "end_melee" );
    self waittill( "partner_end_melee" );

    if ( isdefined( self._id_5B36._id_0108 ) )
    {
        if ( isdefined( self._id_5B36._id_0C62 ) || isdefined( self._id_5B36._id_4EC1 ) )
            self _meth_8054();
        else
        {
            self._id_5B36._id_0108 = undefined;

            if ( _id_5B66() )
                self._id_5B36._id_8FF9 = 1;
            else
                self notify( "end_melee" );
        }
    }
    else if ( !isdefined( self._id_5B36._id_9A98 ) )
        self notify( "end_melee" );
}

_id_5B7C()
{
    if ( !isdefined( self._id_5B36._id_5786 ) )
        return;

    if ( isdefined( self._id_0426 ) )
        self._id_0426 _id_5B7D();

    _id_5B7D();
}

_id_5B7D()
{
    self _meth_8051();
    self._id_0426 = undefined;

    if ( !_func_1A1( self ) )
        return;

    self._id_5B36._id_5786 = undefined;
    self _meth_8192( "zonly_physics" );
    self _meth_8193( "face angle", self.angles[1] );
}

_id_5B5F()
{
    _id_5B7C();
    self._id_5B36._id_9A98 = 1;

    if ( isdefined( self._id_5B36._id_66A5 ) && isdefined( self._id_5B36._id_66A5._id_5B36 ) )
        self._id_5B36._id_66A5._id_5B36._id_9A98 = 1;
}

_id_5B5E()
{
    if ( animhasnotetrack( self._id_5B36._id_0C72, "melee_death" ) )
        return 0;

    return isdefined( self._id_5B36._id_0108 );
}

_id_5B5D( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
        self._id_5B36._id_4EC1 = 1;
    else
        self._id_5B36._id_0C62 = 1;
}

_id_5B5C( var_0 )
{
    if ( _func_120( var_0, "ps_" ) )
    {
        var_1 = _func_122( var_0, 3 );
        self _meth_809C( var_1 );
    }
    else if ( var_0 == "sync" )
    {
        if ( isdefined( self._id_5B36._id_9088 ) )
        {
            _id_5B49( self._id_5B36._id_9088 );
            self._id_5B36._id_9088 = undefined;
        }
    }
    else if ( var_0 == "unsync" )
    {
        _id_5B5F();

        if ( _id_5B5E() )
            _id_5B5D();
    }
    else if ( var_0 == "melee_interact" )
        self._id_5B36._id_8FFA = 1;
    else if ( var_0 == "melee_death" )
    {
        var_2 = isdefined( self._id_58D7 ) && self._id_58D7;

        if ( isdefined( self._id_5B36._id_8FF9 ) || var_2 )
        {
            if ( var_2 )
                self._id_5B36._id_0108 = undefined;

            return var_0;
        }

        _id_5B5D();

        if ( isdefined( self._id_5B36._id_0C62 ) )
        {
            return var_0;
            return;
        }
    }
    else if ( var_0 == "attach_knife" )
    {
        self _meth_801D( "weapon_parabolic_knife", "TAG_INHAND", 1 );
        self._id_5B36._id_4732 = 1;
    }
    else
    {
        if ( var_0 == "detach_knife" )
        {
            self _meth_802A( "weapon_parabolic_knife", "TAG_INHAND", 1 );
            self._id_5B36._id_4732 = undefined;
            return;
        }

        if ( var_0 == "stab" )
        {
            self _meth_809C( "melee_knife_hit_body" );

            if ( _id_A5A4::_id_4749( self._id_029C, "TAG_KNIFE_FX" ) )
                playfxontag( level._id_058F["melee_knife_ai"], self, "TAG_KNIFE_FX" );
            else
            {

            }

            if ( isdefined( self._id_5B36._id_66A5 ) && isdefined( self._id_5B36._id_66A5._id_5B36 ) )
                self._id_5B36._id_66A5 _id_5B5D( 1 );
        }
    }
}

_id_5B4E()
{
    self endon( "end_melee" );
    animscripts\shared::_id_2F6C();
    return 0;
}

_id_5B4D()
{
    self endon( "end_melee" );
    animscripts\notetracks::_id_2D14( "meleeAnim", 10.0 );
    animscripts\shared::_id_2F6C();
    self _meth_8023();
    return 1;
}

_id_5B55()
{
    if ( !_func_1A1( self ) && isdefined( self._id_5B36._id_0108 ) )
    {
        if ( isdefined( self._id_5B36._id_0C62 ) )
            self._id_2660 = ::_id_5B4D;
        else
            self._id_2660 = ::_id_5B4E;
    }
}

_id_5B56()
{
    if ( !_func_1A1( self ) )
        return;

    if ( isdefined( self._id_5B36._id_6DB8 ) )
        _id_5B79();

    var_0 = self _meth_813E();

    if ( isdefined( var_0 ) )
        self _meth_81CA( var_0, self.angles );
    else
    {

    }
}

_id_5B58()
{
    if ( isdefined( self._id_5B36._id_4732 ) )
        self _meth_802A( "weapon_parabolic_knife", "TAG_INHAND", 1 );

    if ( _func_1A1( self ) )
        _id_5B53();
}

_id_5B57()
{
    if ( isdefined( self._id_5B36._id_A1BF ) )
    {
        if ( self._id_5B36._id_A1BF )
            _id_A5A4::_id_30D9();
        else
            _id_A5A4::_id_2AC2();
    }

    if ( isdefined( self._id_5B36._id_A1C9 ) )
        _id_A5A4::_id_7F71( self._id_5B36._id_A1C9 );
}

_id_5B54()
{
    _id_5B7C();
    _id_5B55();
    _id_5B56();
    _id_5B58();
    _id_5B57();

    if ( isdefined( self._id_5B36._id_66A5 ) )
        self._id_5B36._id_66A5 notify( "partner_end_melee" );

    _id_5B6A( self._id_5B36._id_04A4 );
    _id_5B4B();
}

_id_5B38( var_0 )
{
    if ( isdefined( self._id_5B36 ) )
        return 0;

    if ( isdefined( var_0._id_5B36 ) )
        return 0;

    self._id_5B36 = spawnstruct();
    var_0._id_5B36 = spawnstruct();
    return 1;
}

_id_5B6A( var_0 )
{
    self._id_5B36 = undefined;

    if ( isdefined( var_0 ) )
        var_0._id_5B36 = undefined;
}

_id_5B68( var_0 )
{
    self._id_35C7 = animscripts\face::_id_6D9B( var_0, "pain", self._id_35C7 );
}

_id_5B4B()
{
    self._id_35C7 = undefined;
    self _meth_8144( %head, 0.2 );
}

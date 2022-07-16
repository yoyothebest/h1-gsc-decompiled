// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4105( var_0 )
{
    var_1 = self _meth_8099() + ( 0, 0, -3 );
    var_2 = ( var_1[0] - var_0[0], var_1[1] - var_0[1], var_1[2] - var_0[2] );
    var_2 = _func_114( var_2 );
    var_3 = var_2[2] * -1;
    return var_3;
}

_id_40CE()
{
    if ( _func_1AD( self._id_0142 ) )
        return _func_0B5( self._id_0142._id_4441._id_5C36, self._id_0142._id_4441._id_5A17 );
    else
        return _func_0B5( anim._id_5C36, anim._id_5A17 );
}

_id_40B6()
{
    var_0 = ( gettime() - self.a._id_55D7 ) / 1000;
    var_1 = _id_3F1E();

    if ( var_1 > var_0 )
        return var_1 - var_0;

    return 0;
}

_id_3F92()
{
    if ( !isdefined( self._id_3673 ) )
    {
        self._id_3673 = 1;
        self._id_3675 = 3;
    }

    var_0 = 0.2;
    var_1 = 0.45;

    if ( self._id_3673 % self._id_3675 == 0 )
    {
        if ( _func_0B2( 5 ) < 3 )
        {
            var_0 = 0.45;
            var_1 = 1.0;
        }

        self._id_3675 = _func_0B4( 2, 5 );
    }

    self._id_3673++;
    return _func_0B5( var_0, var_1 );
}

_id_3F1E()
{
    if ( animscripts\utility::_id_9C3A() )
        return _func_0B5( 0.15, 0.55 );
    else if ( animscripts\utility::_id_A2CF() )
        return _func_0B5( 1.0, 1.7 );
    else if ( _id_51AB() )
        return _id_40CE();
    else if ( self._id_3672 )
        return _id_3F92();
    else
        return _func_0B5( 0.4, 0.9 );
}

_id_1930()
{
    if ( self._id_18B0 )
    {
        if ( self._id_8415 == "full" && !self._id_3672 )
        {
            if ( self.a._id_55D7 == gettime() )
                wait 0.05;

            return;
        }

        var_0 = _id_40B6();

        if ( var_0 )
            wait(var_0);
    }
}

_id_1CAE()
{
    setdvarifuninitialized( "useCod3AmmoCheating", 1 );

    if ( getdvarint( "useCod3AmmoCheating", 1 ) == 1 )
        return cheatammoifnecessary_cod3();
    else
        return cheatammoifnecessary_h1();
}

cheatammoifnecessary_h1()
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( self._id_04A7 != "allies" )
    {
        if ( !_func_1AD( self._id_0142 ) )
            return 0;

        if ( self._id_0142 _id_A5A4::_id_32D8( "player_is_invulnerable" ) )
            return 0;
    }

    if ( animscripts\utility::_id_9C3A() || animscripts\utility::_id_9C36() )
        return 0;

    if ( gettime() - self._id_0B78 < self._id_0B77 )
        return 0;

    if ( !self _meth_81C2( self._id_0142 ) && _func_0F0( self._id_02E2, self._id_0142._id_02E2 ) > 65536 )
        return 0;

    self._id_18B0 = _func_0BC( _func_1B1( self._id_0513 ) / 2 );

    if ( self._id_18B0 > _func_1B1( self._id_0513 ) )
        self._id_18B0 = _func_1B1( self._id_0513 );

    self._id_0B78 = gettime();
    self notify( "cheated_reload_level_stats" );
    return 1;
}

cheatammoifnecessary_cod3()
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( self._id_04A7 != "allies" )
    {
        if ( !_func_1AD( self._id_0142 ) )
            return 0;

        if ( _func_1B1( self._id_0513 ) < 15 )
            return 0;

        if ( self._id_0142 _id_A5A4::_id_32D8( "player_is_invulnerable" ) )
            return 0;
    }

    if ( animscripts\utility::_id_9C3A() || animscripts\utility::_id_9C36() )
        return 0;

    if ( isdefined( self.nextcheattime ) && gettime() < self.nextcheattime )
        return 0;

    if ( !self _meth_81C2( self._id_0142 ) )
        return 0;

    if ( animscripts\utility::_id_50E9() )
        self._id_18B0 = _func_1B1( self._id_0513 );
    else
        self._id_18B0 = 10;

    if ( self._id_18B0 > _func_1B1( self._id_0513 ) )
        self._id_18B0 = _func_1B1( self._id_0513 );

    self.nextcheattime = gettime() + 4000;
    self notify( "cheated_reload_level_stats" );
    return 1;
}

_id_0975()
{
    for ( var_0 = _func_0BC( 60.0 ); var_0 > 0; var_0-- )
    {
        if ( isdefined( self._id_2D34 ) || isdefined( self._id_0142 ) && isdefined( self._id_0142._id_2D2B ) )
        {
            wait 0.05;
            continue;
        }

        return 0;
    }

    return 1;
}

_id_8417()
{
    self endon( "shoot_behavior_change" );
    self endon( "stopShooting" );

    if ( _id_514A() )
    {
        if ( isdefined( self._id_0142 ) && _func_0CF( self._id_0142 ) && _func_0F0( level._id_0318._id_02E2, self._id_0142._id_02E2 ) < 147456 )
            self._id_0142 animscripts\battlechatter_ai::_id_0840( "infantry", self, 1.0 );

        if ( animscripts\utility::_id_9C36() && _func_0D1( self._id_0142 ) )
            wait(_func_0B3( 2.0 ));
    }

    var_0 = 1;

    for (;;)
    {
        if ( !var_0 )
            _id_1930();

        var_0 = 0;

        if ( _id_0975() )
            break;

        if ( self._id_8415 == "full" )
        {
            if ( isdefined( self._id_5A7A ) && self._id_5A7A )
                _id_37EE( animscripts\utility::_id_0C4E( "fire" ), 0, 100 );
            else
                _id_37EE( animscripts\utility::_id_0C4E( "fire" ), 1, animscripts\shared::_id_2742() );
        }
        else if ( self._id_8415 == "burst" || self._id_8415 == "semi" )
        {
            var_1 = animscripts\shared::_id_2741();

            if ( var_1 == 1 )
                _id_37EE( animscripts\utility::_id_0C51( "single" ), 1, var_1 );
            else
                _id_37EE( animscripts\utility::_id_0C4E( self._id_8415 + var_1 ), 1, var_1 );
        }
        else if ( self._id_8415 == "single" )
            _id_37EE( animscripts\utility::_id_0C51( "single" ), 1, 1 );
        else
            self waittill( "hell freezes over" );

        if ( !self._id_18B0 )
            break;
    }
}

_id_4143()
{
    anim._id_0C6E++;
    return anim._id_0C6E;
}
#using_animtree("generic_human");

_id_82F8( var_0 )
{
    self _meth_814D( %exposed_aiming, 1, var_0 );
    self _meth_8146( animscripts\utility::_id_0C4E( "straight_level" ), 1, var_0 );
    self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_up" ), 1, var_0 );
    self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_down" ), 1, var_0 );
    self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_left" ), 1, var_0 );
    self _meth_8146( animscripts\utility::_id_0C4E( "add_aim_right" ), 1, var_0 );
    self._id_35C7 = animscripts\face::_id_6D9B( undefined, "aim", self._id_35C7 );
}

_id_8D17()
{
    if ( !isdefined( self.a._id_0979 ) )
    {
        var_0 = 0.2;

        if ( isdefined( self._id_097C ) )
            var_0 = self._id_097C;

        _id_82F8( var_0 );

        if ( self.doaimidlethread )
            thread _id_0979();

        thread animscripts\track::_id_9512();
    }
}

_id_315E()
{
    _id_3156();
    self _meth_8144( %add_fire, 0.1 );
    self notify( "stop tracking" );
}

_id_850C()
{
    if ( isdefined( self.a._id_0979 ) )
        self _meth_814D( %add_idle, 0, 0.2 );

    self _meth_814D( %add_fire, 1, 0.1 );
}

_id_4873()
{
    if ( isdefined( self.a._id_0979 ) )
        self _meth_814D( %add_idle, 1, 0.2 );

    self _meth_814D( %add_fire, 0, 0.1 );
}

_id_0979( var_0 )
{
    self endon( "killanimscript" );
    self endon( "end_aim_idle_thread" );

    if ( isdefined( self.a._id_0979 ) )
        return;

    self.a._id_0979 = 1;
    wait 0.1;
    self _meth_814E( %add_idle, 1, 0.2 );
    var_1 = %add_idle;
    var_2 = 0;

    for (;;)
    {
        var_3 = "idle" + var_2;

        if ( isdefined( self.a._id_565E ) )
            var_4 = animscripts\utility::_id_0C51( "lean_idle" );
        else if ( animscripts\utility::_id_0C4F( "exposed_idle" ) )
            var_4 = animscripts\utility::_id_0C51( "exposed_idle" );
        else
        {
            wait 0.5;
            __asm_jump( loc_711 );
        }

        if ( var_4 == var_1 )
            self _meth_8116( var_3, var_4, 1, 0.2 );
        else
            self _meth_8110( var_3, var_4, 1, 0.2 );

        var_1 = var_4;
        self waittillmatch( var_3, "end" );
        var_2++;
    }

    self _meth_8144( %add_idle, 0.1 );
}

_id_3156()
{
    self notify( "end_aim_idle_thread" );
    self.a._id_0979 = undefined;
    self _meth_8144( %add_idle, 0.1 );
}

shotgunfirerate_h1og()
{
    return _func_0B5( 1.0, 1.7 );
}

_id_8442()
{
    if ( animscripts\utility::_id_A2CF() )
        return 1.0;

    if ( animscripts\weaponlist::_id_9C2C() )
        return animscripts\weaponlist::_id_116C() * 0.7;

    return 0.4;
}

_id_37EE( var_0, var_1, var_2 )
{
    var_3 = "fireAnim_" + _id_4143();
    _id_A537::_id_7450();

    while ( !_id_0976() )
        wait 0.05;

    _id_850C();
    var_4 = 1.0;

    if ( isdefined( self._id_8414 ) )
        var_4 = self._id_8414;
    else if ( self._id_8415 == "full" )
        var_4 = animscripts\weaponlist::_id_116C();
    else if ( self._id_8415 == "burst" )
        var_4 = animscripts\weaponlist::_id_1934();
    else if ( animscripts\utility::_id_9C3A() )
        var_4 = 3.0;
    else if ( animscripts\utility::_id_9C39() )
        var_4 = shotgunfirerate_h1og();

    self _meth_810F( var_3, var_0, 1, 0.2, var_4 );
    self _meth_81ED();
    var_5 = _func_1B0( self._id_0513 );
    _id_37F0( var_3, var_0, var_1, var_2, var_5 );
    _id_4873();
}

_id_37EF()
{
    self endon( "killanimscript" );
    self endon( "fireAnimEnd" );
    self notify( "FireUntilOutOfAmmo_WaitTillEnded" );
    self endon( "FireUntilOutOfAmmo_WaitTillEnded" );
    var_0 = thisthread;

    for (;;)
    {
        waitframe;

        if ( !isdefined( var_0 ) )
        {
            self _meth_83D8();
            return;
        }

        wait 0.05;
    }
}

_id_37F0( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "enemy" );

    if ( _func_1AD( self._id_0142 ) && ( self._id_8415 == "full" || self._id_8415 == "semi" ) )
        level endon( "player_becoming_invulnerable" );

    if ( var_2 )
    {
        thread _id_622F( var_0, "fireAnimEnd" );
        self endon( "fireAnimEnd" );
    }

    if ( !isdefined( var_3 ) )
        var_3 = -1;

    var_5 = 0;
    var_6 = getanimlength( var_1 );
    var_7 = animhasnotetrack( var_1, "fire" );
    var_8 = _func_1B8( self._id_0513 ) == "rocketlauncher";
    thread _id_37EF();

    while ( var_5 < var_3 && var_3 > 0 )
    {
        var_9 = 0;

        if ( var_7 )
            self waittillmatch( var_0, "fire" );

        if ( !self._id_18B0 )
        {
            if ( !_id_1CAE() )
                break;
        }

        if ( !_id_0976() )
            break;

        _id_83EB();

        if ( _func_1AD( self._id_0142 ) && self._id_0142 _id_A5A4::_id_32D8( "player_is_invulnerable" ) )
        {
            if ( _func_0B2( 3 ) == 0 )
                self._id_18B0--;
        }
        else
            self._id_18B0--;

        if ( var_8 )
        {
            self.a._id_7594--;

            if ( _func_120( _func_123( self._id_0513 ), "rpg" ) || _func_120( _func_123( self._id_0513 ), "panzerfaust" ) )
            {
                self _meth_804A( "tag_rocket" );
                self.a._id_7597 = 0;
            }
        }

        var_5++;
        thread _id_8443( var_0 );

        if ( self._id_3672 && var_5 == var_3 )
            break;

        if ( !var_7 || var_3 == 1 && self._id_8415 == "single" )
        {
            self waittillmatch( var_0, "end" );
            var_9 = var_6;
        }

        if ( var_4 - var_9 > 0 )
            wait(var_4 - var_9);
    }

    self _meth_83D8();

    if ( var_2 )
        self notify( "fireAnimEnd" );
}

_id_0976()
{
    if ( !isdefined( self._id_840F ) )
        return 1;

    var_0 = self _meth_81BD();
    var_1 = animscripts\shared::_id_40C8();
    var_2 = _func_115( self._id_840F - var_1 );
    var_3 = anim._id_0985;

    if ( isdefined( self._id_0978 ) )
        var_3 = self._id_0978;

    var_4 = animscripts\utility::_id_06C4( var_0[1] - var_2[1] );

    if ( var_4 > var_3 )
    {
        if ( _func_0F0( self _meth_80AA(), self._id_840F ) > anim._id_0983 || var_4 > anim._id_0984 )
            return 0;
    }

    var_5 = anim._id_097B;

    if ( self.a._id_6E5A == "crouch" && _func_0F0( self _meth_80AA(), self._id_840F ) < anim.aimpitchdiffclosedistsq )
        var_5 = anim.aimpitchdiffclosetolerance;

    return animscripts\utility::_id_06C4( var_0[0] - var_2[0] ) <= var_5;
}

_id_622F( var_0, var_1 )
{
    self endon( "killanimscript" );
    self endon( var_1 );
    self waittillmatch( var_0, "end" );
    self notify( var_1 );
}

_id_51A9()
{
    if ( _func_1B6( self._id_0513 ) > 0 )
        return 0;
    else if ( _func_1B2( self._id_0513 ) )
        return 0;

    return 1;
}

_id_83EB()
{
    var_0 = _id_51A9();

    if ( isdefined( self._id_83F6 ) )
    {
        if ( isdefined( self._id_0142 ) && self._id_83F6 == self._id_0142 )
            animscripts\utility::_id_83F2( var_0 );
    }
    else
        self [[ anim._id_8413 ]]( self._id_840F, var_0 );
}

_id_275F()
{
    if ( self._id_18B0 )
        self._id_18B0--;
}

_id_8443( var_0 )
{
    if ( !animscripts\utility::_id_A2CF() )
        return;

    self endon( "killanimscript" );
    self notify( "shotgun_pump_sound_end" );
    self endon( "shotgun_pump_sound_end" );
    thread _id_8F03( 2.0 );
    self waittillmatch( var_0, "rechamber" );
    self _meth_809C( "ai_shotgun_pump" );
    self notify( "shotgun_pump_sound_end" );
}

_id_8F03( var_0 )
{
    self endon( "killanimscript" );
    self endon( "shotgun_pump_sound_end" );
    wait(var_0);
    self notify( "shotgun_pump_sound_end" );
}

_id_7263( var_0 )
{

}

_id_6089( var_0 )
{
    if ( self._id_0513 == "none" )
        return 0;

    if ( isdefined( self._id_615B ) )
    {
        if ( self._id_18B0 < _func_1B1( self._id_0513 ) * 0.5 )
            self._id_18B0 = _func_0BC( _func_1B1( self._id_0513 ) * 0.5 );

        if ( self._id_18B0 <= 0 )
            self._id_18B0 = 0;

        return 0;
    }

    if ( animscripts\stairs_utility::stairstransitionpendingsince( 100 ) )
        return 0;

    if ( self._id_18B0 <= _func_1B1( self._id_0513 ) * var_0 )
    {
        if ( var_0 == 0 )
        {
            if ( _id_1CAE() )
                return 0;
        }

        return 1;
    }

    return 0;
}

_id_7066()
{
    self endon( "weapon_switch_done" );
    self endon( "death" );
    self waittill( "killanimscript" );
    animscripts\shared::_id_6869( self._id_0340, "right" );
}

_id_0362( var_0, var_1 )
{
    self endon( "killanimscript" );

    if ( !_id_6089( var_0 ) )
        return 0;

    animscripts\battlechatter_ai::_id_33B6();
    animscripts\battlechatter::_id_6A2E();

    if ( isdefined( var_1 ) )
    {
        self _meth_8111( "reloadanim", var_1, %body, 1, 0.1, 1 );
        animscripts\shared::_id_2D06( "reloadanim" );
        animscripts\weaponlist::_id_72B1();
        self.a._id_6084 = 0;
    }
    else
    {
        if ( self.a._id_6E5A == "prone" )
        {
            self _meth_8111( "reloadanim", %prone_reload, %body, 1, 0.1, 1 );
            self _meth_81FE( %prone_legs_up, %prone_legs_down, 1, 0.1, 1 );
        }
        else
        {
            wait 2;
            return;
        }

        animscripts\shared::_id_2D06( "reloadanim" );
        animscripts\weaponlist::_id_72B1();
        self.a._id_6084 = 0;
    }

    return 1;
}

_id_07E3( var_0, var_1 )
{
    if ( !isdefined( anim._id_440A ) )
    {
        anim._id_440A = [];
        anim._id_440B = [];
    }

    var_2 = anim._id_440A.size;
    anim._id_440A[var_2] = var_0;
    anim._id_440B[var_2] = var_1;
}

_id_4DC3()
{
    _id_07E3( %exposed_grenadethrowb, ( 41.5391, 7.28883, 72.2128 ) );
    _id_07E3( %exposed_grenadethrowc, ( 34.8849, -4.77048, 74.0488 ) );
    _id_07E3( %corner_standl_grenade_a, ( 41.605, 6.80107, 81.4785 ) );
    _id_07E3( %corner_standl_grenade_b, ( 24.1585, -14.7221, 29.2992 ) );
    _id_07E3( %cornercrl_grenadea, ( 25.8988, -10.2811, 30.4813 ) );
    _id_07E3( %cornercrl_grenadeb, ( 24.688, 45.0702, 64.377 ) );
    _id_07E3( %corner_standr_grenade_a, ( 37.1254, -32.7053, 76.5745 ) );
    _id_07E3( %corner_standr_grenade_b, ( 19.356, 15.5341, 16.5036 ) );
    _id_07E3( %cornercrr_grenadea, ( 39.8857, 5.92472, 24.5878 ) );
    _id_07E3( %covercrouch_grenadea, ( -1.6363, -0.693674, 60.1009 ) );
    _id_07E3( %covercrouch_grenadeb, ( -1.6363, -0.693674, 60.1009 ) );
    _id_07E3( %coverstand_grenadea, ( 10.8573, 7.12614, 77.2356 ) );
    _id_07E3( %coverstand_grenadeb, ( 19.1804, 5.68214, 73.2278 ) );
    _id_07E3( %prone_grenade_a, ( 12.2859, -1.3019, 33.4307 ) );
    _id_07E3( %cqb_stand_grenade_throw, ( 35.7494, 26.6052, 37.7086 ) );
    _id_07E3( %s1_covercrouch_grenadea, ( -15.5413, -16.7719, 19.4304 ) );
    _id_07E3( %s1_coverstand_grenadea, ( 3.99694, -2.76588, 32.8777 ) );
    _id_07E3( %s1_coverstand_grenadeb, ( 5.51904, 2.92983, 32.8406 ) );
    _id_07E3( %s1_exposed_crouch_fast_grenade_1, ( 16.4611, -8.55309, 30.1018 ) );
    _id_07E3( %s1_exposed_crouch_fast_grenade_2, ( 30.5886, -7.6374, 47.3139 ) );
    _id_07E3( %s1_exposed_grenadethrowc, ( 13.433, -0.473915, 43.3545 ) );
    _id_07E3( %s1_exposed_grenadethrowb, ( -31.425, -7.62042, 42.4334 ) );
    _id_07E3( %s1_cornercrr_grenade_2, ( 37.4516, -2.01701, 22.6517 ) );
    _id_07E3( %s1_corner_standl_grenade_a, ( 41.605, 6.80107, 81.4785 ) );
    _id_07E3( %s1_cornercrr_grenadea, ( 39.8857, 5.92472, 24.5878 ) );
}

h1_grenade_attach_detach_listener( var_0 )
{
    if ( var_0 == "grenade_left" || var_0 == "grenade_right" )
    {
        self.h1_scripted_grenade = spawn( "script_model", self _meth_8184( "tag_inhand" ) );
        var_1 = animscripts\utility::_id_3FB0();
        self.h1_scripted_grenade _meth_80B3( var_1 );
        self.h1_scripted_grenade _meth_804F( self, "tag_inhand", ( 0, 0, 3 ), ( 0, 0, 0 ) );
    }
    else if ( var_0 == "grenade_throw" )
    {
        self.h1_scripted_grenade delete();
        self.h1_scripted_grenade = undefined;
        return "end";
    }
}

_id_3FB1( var_0 )
{
    var_1 = ( 0, 0, 64 );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_4, var_3 in anim._id_440A )
        {
            if ( var_0 == var_3 )
            {
                var_1 = anim._id_440B[var_4];
                break;
            }
        }
    }

    if ( var_1[2] == 64 )
    {
        if ( !isdefined( var_0 ) )
        {

        }
        else
        {

        }
    }

    return var_1;
}

_id_933C()
{
    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        if ( level._id_0323[var_0]._id_62A3 == 0 )
        {
            level._id_0323[var_0]._id_440D["fraggrenade"] = 0;
            level._id_0323[var_0]._id_440D["flash_grenade"] = 0;
        }
    }

    anim._id_933B = 1;
}

_id_7F15( var_0 )
{
    self._id_071F = spawnstruct();

    if ( _func_1AD( var_0 ) )
    {
        self._id_071F._id_517C = 1;
        self._id_071F._id_0318 = var_0;
        self._id_071F._id_9378 = self._id_01D6;
    }
    else
    {
        self._id_071F._id_517C = 0;
        self._id_071F._id_9378 = "AI_" + self._id_01D6;
    }
}

_id_9C32()
{
    return self._id_071F._id_517C;
}

_id_7F80( var_0, var_1 )
{
    if ( var_0._id_517C )
    {
        var_2 = var_0._id_0318;
        var_3 = var_2._id_440D[var_0._id_9378];
        var_2._id_440D[var_0._id_9378] = _func_0E1( var_1, var_3 );
    }
    else
    {
        var_3 = anim._id_440D[var_0._id_9378];
        anim._id_440D[var_0._id_9378] = _func_0E1( var_1, var_3 );
    }
}

_id_3F55()
{
    var_0 = undefined;

    if ( _id_9C32() )
    {
        var_1 = self._id_071F._id_0318;
        var_0 = gettime() + var_1._id_4441._id_6CB3 + _func_0B2( var_1._id_4441._id_6CB4 );
    }
    else
        var_0 = gettime() + 30000 + _func_0B2( 30000 );

    return var_0;
}

_id_3FB2( var_0 )
{
    if ( var_0._id_517C )
        return var_0._id_0318._id_440D[var_0._id_9378];
    else
        return anim._id_440D[var_0._id_9378];
}

_id_2151( var_0 )
{
    if ( !_func_1AD( var_0 ) && self _meth_813F() )
    {
        if ( gettime() < _id_3FB2( self._id_071F ) )
        {
            if ( level._id_0318._id_01FF )
                return var_0;

            var_1 = self _meth_817C();
            var_2 = level._id_0318 _meth_817C();

            if ( var_1 != "" && var_2 != "" && getthreatbias( var_2, var_1 ) < -10000 )
                return var_0;

            if ( self _meth_81C2( level._id_0318 ) || _func_0CF( var_0 ) && var_0 _meth_81C2( level._id_0318 ) )
            {
                if ( isdefined( self._id_22BA ) )
                {
                    var_3 = _func_115( level._id_0318._id_02E2 - self._id_02E2 );
                    var_4 = _func_0EB( self._id_22BA.angles[1] - var_3[1] );
                }
                else
                    var_4 = animscripts\utility::_id_4177( level._id_0318._id_02E2 );

                if ( _func_0BE( var_4 ) < 60 )
                {
                    var_0 = level._id_0318;
                    _id_7F15( var_0 );
                }
            }
        }
    }

    return var_0;
}

_id_5A63( var_0 )
{
    if ( _id_A5A4::_id_6ACB() )
        return 0;

    if ( !var_0._id_4441._id_2D8C )
        return 0;

    var_1 = gettime();

    if ( var_1 < var_0._id_440D["double_grenade"] )
        return 0;

    if ( var_1 > var_0._id_55A2 + 3000 )
        return 0;

    if ( var_1 < var_0._id_55A2 + 500 )
        return 0;

    return var_0._id_62A3 < 2;
}

_id_6036()
{
    return gettime() >= self.a._id_60CC;
}

_id_43FB( var_0 )
{
    if ( _id_A5A4::_id_6ACB() )
        return 0;

    if ( self._id_79EA == 1 )
        return 1;

    if ( !_id_6036() )
        return 0;

    if ( gettime() >= _id_3FB2( self._id_071F ) )
        return 1;

    if ( self._id_071F._id_517C && self._id_071F._id_9378 == "fraggrenade" )
        return _id_5A63( var_0 );

    return 0;
}

isgrenadepossafe( var_0, var_1 )
{
    if ( isdefined( anim._id_933B ) && _id_9C32() )
        return 1;

    var_2 = 200;

    if ( self._id_01D6 == "flash_grenade" )
        var_2 = 512;

    var_3 = var_2 * var_2;
    var_4 = undefined;
    var_5 = 100000000;
    var_6 = undefined;
    var_7 = 100000000;

    for ( var_8 = 0; var_8 < self._id_8AB0._id_5BA6.size; var_8++ )
    {
        if ( !_func_1A1( self._id_8AB0._id_5BA6[var_8] ) )
            continue;

        var_9 = _func_0F0( self._id_8AB0._id_5BA6[var_8]._id_02E2, var_1 );

        if ( var_9 > var_3 )
            continue;

        if ( var_9 < var_5 )
        {
            var_7 = var_5;
            var_6 = var_4;
            var_5 = var_9;
            var_4 = self._id_8AB0._id_5BA6[var_8];
            continue;
        }

        if ( var_9 < var_7 )
        {
            var_7 = var_9;
            var_6 = self._id_8AB0._id_5BA6[var_8];
        }
    }

    if ( isdefined( var_4 ) && _func_08E( var_4 _meth_80AA(), var_1, 0, undefined ) )
        return 0;

    if ( isdefined( var_6 ) && _func_08E( var_4 _meth_80AA(), var_1, 0, undefined ) )
        return 0;

    return 1;
}

_id_989E( var_0, var_1, var_2, var_3 )
{
    if ( !isgrenadepossafe( var_0, var_1 ) )
        return 0;
    else if ( _func_0F0( self._id_02E2, var_1 ) < 40000 )
        return 0;

    var_4 = _func_08F( var_1 + ( 0, 0, 1 ), var_1 + ( 0, 0, -500 ) );

    if ( var_4 == var_1 + ( 0, 0, -500 ) )
        return 0;

    var_4 += ( 0, 0, 0.1 );
    return _id_989F( var_0, var_4, var_2, var_3 );
}

_id_989D( var_0, var_1 )
{
    if ( self._id_0513 == "mg42" || self._id_01D0 <= 0 )
        return 0;

    _id_7F15( var_0 );
    var_0 = _id_2151( var_0 );

    if ( !_id_43FB( var_0 ) )
        return 0;

    var_2 = _id_3FB1( var_1 );

    if ( isdefined( self._id_0142 ) && var_0 == self._id_0142 )
    {
        if ( !_id_1D09() )
            return 0;

        if ( _func_1AD( self._id_0142 ) && _id_A5A4::_id_5062( self._id_0142 ) )
            return 0;

        if ( animscripts\utility::_id_1AE2() )
        {
            if ( !isgrenadepossafe( var_0, var_0._id_02E2 ) )
                return 0;

            return _id_989F( var_0, undefined, var_1, var_2 );
        }
        else if ( animscripts\utility::_id_1AF0() )
            return _id_989E( var_0, animscripts\utility::_id_3F7E(), var_1, var_2 );
        else
        {
            if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
                var_3 = self _meth_81C5( var_0 );
            else
                var_3 = var_0._id_02E2;

            if ( !isgrenadepossafe( var_0, var_3 ) )
                return 0;

            return _id_989F( var_0, undefined, var_1, var_2 );
        }

        return 0;
    }
    else
    {
        if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
            var_3 = self _meth_81C5( var_0 );
        else
            var_3 = var_0._id_02E2;

        return _id_989E( var_0, var_3, var_1, var_2 );
    }
}

_id_989F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( gettime() < 10000 && !isdefined( level._id_4BB4 ) )
        return 0;

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( isdefined( var_2 ) )
    {
        var_7 = var_2;
        var_8 = self.a._id_4471;
    }
    else
    {
        switch ( self.a._id_8A1A )
        {
            case "none":
            case "cover_crouch":
                if ( self.a._id_6E5A == "stand" )
                {
                    var_3 = ( 0, 0, 80 );
                    var_7 = %stand_grenade_throw;
                }
                else
                {
                    var_3 = ( 0, 0, 65 );
                    var_7 = %crouch_grenade_throw;
                }

                var_8 = "left";
                break;
            default:
                var_7 = undefined;
                var_8 = undefined;
                break;
        }
    }

    if ( !isdefined( var_7 ) )
        return 0;

    if ( isdefined( var_1 ) )
    {
        if ( !isdefined( var_4 ) )
            var_9 = self _meth_81A8( var_3, var_1, var_5, "min energy", "min time", "max time" );
        else
            var_9 = self _meth_81A8( var_3, var_1, var_5, "min time", "min energy" );
    }
    else if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_9 = self _meth_81A8( var_3, self _meth_81C5( var_0 ), var_5, "min energy", "min time", "max time" );
    else
    {
        var_10 = _func_0EE( var_0._id_02E2, self._id_02E2 );
        var_11 = self._id_7120;

        if ( var_10 < 800 )
        {
            if ( var_10 < 256 )
                var_11 = 0;
            else
                var_11 *= ( var_10 - 256 ) / 544;
        }

        if ( !isdefined( var_4 ) )
            var_9 = self _meth_81D3( var_3, var_11, "min energy", "min time", "max time" );
        else
            var_9 = self _meth_81D3( var_3, var_11, "min time", "min energy" );
    }

    self.a._id_60CC = gettime() + _func_0B4( 1000, 2000 );

    if ( isdefined( var_9 ) )
    {
        if ( !isdefined( self._id_63D2 ) )
            self._id_63D2 = self._id_01D1;

        self._id_01D1 = 0;
        var_12 = _id_3F55();
        _id_7F80( self._id_071F, _func_0BF( gettime() + 3000, var_12 ) );
        var_13 = 0;

        if ( _id_9C32() )
        {
            var_0._id_62A3++;
            thread _id_72A7( var_0 );

            if ( var_0._id_62A3 > 1 )
                var_13 = 1;

            if ( self._id_071F._id_9378 == "fraggrenade" )
            {
                if ( var_0._id_62A3 <= 1 )
                    var_0._id_55A2 = gettime();
            }
        }

        if ( isdefined( var_6 ) )
            thread _id_2CD7( var_7, var_9, var_12, var_13 );
        else
            _id_2CD7( var_7, var_9, var_12, var_13 );

        return 1;
    }
    else
    {

    }

    return 0;
}

_id_72A7( var_0 )
{
    self endon( "dont_reduce_giptp_on_killanimscript" );
    self waittill( "killanimscript" );
    var_0._id_62A3--;
}

_id_2CD7( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );

    if ( self._id_038E == "combat" || self._id_038E == "move" )
        self _meth_8193( "face direction", var_1 );

    animscripts\battlechatter_ai::_id_33B1( "grenade" );
    self notify( "stop_aiming_at_enemy" );
    self _meth_8112( "throwanim", var_0, %body, _id_367A(), 0.1, 1 );
    thread animscripts\notetracks::_id_2D07( "throwanim", "killanimscript" );
    var_4 = animscripts\utility::_id_3FB0();
    var_5 = "none";

    for (;;)
    {
        self waittill( "throwanim", var_6 );

        if ( var_6 == "grenade_left" || var_6 == "grenade_right" )
        {
            var_5 = _id_0DFB( var_4, "TAG_INHAND" );
            self._id_511B = 1;
        }

        if ( var_6 == "grenade_throw" || var_6 == "grenade throw" )
            break;

        if ( var_6 == "end" )
        {
            self._id_071F._id_0318._id_62A3--;
            self notify( "dont_reduce_giptp_on_killanimscript" );
            return 0;
        }
    }

    self notify( "dont_reduce_giptp_on_killanimscript" );

    if ( _id_9C32() )
        thread _id_A22F( self._id_071F._id_0318, var_2 );

    self _meth_81D6();

    if ( !_id_9C32() )
        _id_7F80( self._id_071F, var_2 );

    if ( var_3 )
    {
        var_13 = self._id_071F._id_0318;

        if ( var_13._id_62A3 > 1 || gettime() - var_13._id_55A4 < 2000 )
            var_13._id_440D["double_grenade"] = gettime() + _func_0BF( 5000, var_13._id_4441._id_6C95 );
    }

    self notify( "stop grenade check" );

    if ( var_5 != "none" )
        self _meth_802A( var_4, var_5 );
    else
    {

    }

    self._id_511B = undefined;
    self._id_01D1 = self._id_63D2;
    self._id_63D2 = undefined;
    self waittillmatch( "throwanim", "end" );
    self notify( "done_grenade_throw" );
    self notify( "weapon_switch_done" );
    self _meth_814D( %exposed_modern, 1, 0.2 );
    self _meth_814D( %exposed_aiming, 1 );
    self _meth_8144( var_0, 0.2 );
}

_id_A22F( var_0, var_1 )
{
    var_0 endon( "death" );
    _id_A230( var_1 );
    var_0._id_62A3--;
}

_id_A230( var_0 )
{
    var_1 = self._id_071F;
    var_2 = spawnstruct();
    var_2 thread _id_A231( 5 );
    var_2 endon( "watchGrenadeTowardsPlayerTimeout" );
    var_3 = self._id_01D6;
    var_4 = _id_3FAF();

    if ( !isdefined( var_4 ) )
        return;

    _id_7F80( var_1, _func_0BF( gettime() + 5000, var_0 ) );
    var_5 = 62500;
    var_6 = 160000;

    if ( var_3 == "flash_grenade" )
    {
        var_5 = 810000;
        var_6 = 1690000;
    }

    var_7 = level._id_0323;
    var_8 = var_4._id_02E2;

    for (;;)
    {
        wait 0.1;

        if ( !isdefined( var_4 ) )
            break;

        if ( _func_0F0( var_4._id_02E2, var_8 ) < 400 )
        {
            var_9 = [];

            for ( var_10 = 0; var_10 < var_7.size; var_10++ )
            {
                var_11 = var_7[var_10];
                var_12 = _func_0F0( var_4._id_02E2, var_11._id_02E2 );

                if ( var_12 < var_5 )
                {
                    var_11 _id_4402( var_1, var_0 );
                    continue;
                }

                if ( var_12 < var_6 )
                    var_9[var_9.size] = var_11;
            }

            var_7 = var_9;

            if ( var_7.size == 0 )
                break;
        }

        var_8 = var_4._id_02E2;
    }
}

_id_4402( var_0, var_1 )
{
    var_2 = self;
    anim._id_933B = undefined;

    if ( gettime() - var_2._id_55A4 < 3000 )
        var_2._id_440D["double_grenade"] = gettime() + var_2._id_4441._id_6C95;

    var_2._id_55A4 = gettime();
    var_3 = var_2._id_440D[var_0._id_9378];
    var_2._id_440D[var_0._id_9378] = _func_0E1( var_1, var_3 );
}

_id_3FAF()
{
    self endon( "killanimscript" );
    self waittill( "grenade_fire", var_0 );
    return var_0;
}

_id_A231( var_0 )
{
    wait(var_0);
    self notify( "watchGrenadeTowardsPlayerTimeout" );
}

_id_0DFB( var_0, var_1 )
{
    self _meth_801D( var_0, var_1 );
    thread _id_2981( var_0, var_1 );
    return var_1;
}

_id_2981( var_0, var_1 )
{
    self endon( "stop grenade check" );
    self waittill( "killanimscript" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_63D2 ) )
    {
        self._id_01D1 = self._id_63D2;
        self._id_63D2 = undefined;
    }

    self _meth_802A( var_0, var_1 );
}

_id_6384( var_0 )
{
    var_1 = anglestoforward( self.angles );
    var_2 = anglestoright( self.angles );
    var_3 = anglestoup( self.angles );
    var_1 *= var_0[0];
    var_2 *= var_0[1];
    var_3 *= var_0[2];
    return var_1 + var_2 + var_3;
}

_id_4403( var_0, var_1 )
{
    level notify( "armoffset" );
    level endon( "armoffset" );
    var_0 = self._id_02E2 + _id_6384( var_0 );

    for (;;)
        wait 0.05;
}

_id_3FAD()
{
    var_0 = _func_0B3( 360 );
    var_1 = _func_0B5( 30, 75 );
    var_2 = _func_0B6( var_1 );
    var_3 = _func_0B7( var_1 );
    var_4 = _func_0B7( var_0 ) * var_3;
    var_5 = _func_0B6( var_0 ) * var_3;
    var_6 = _func_0B5( 100, 200 );
    var_7 = ( var_4, var_5, var_2 ) * var_6;
    return var_7;
}

_id_2F6F()
{
    var_0 = self _meth_8184( "tag_inhand" );
    var_1 = _id_3FAD();
    self _meth_803A( var_0, var_1, 3 );
}

_id_585F()
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( self._id_017D || self._id_012E )
        return 0;

    var_0 = _id_3F15();

    if ( isdefined( var_0 ) )
        return _id_9BF3( var_0 );

    return 0;
}

_id_3F15()
{
    var_0 = self _meth_81F1();

    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = animscripts\utility::_id_3F2F();

    if ( isdefined( var_1 ) && var_0 == var_1 )
        return undefined;

    if ( isdefined( self._id_22BA ) && var_0 == self._id_22BA )
        return undefined;

    return var_0;
}

_id_9BF3( var_0 )
{
    var_1 = self._id_0231;
    var_2 = self._id_0230;
    self._id_0231 = 0;
    self._id_0230 = 0;

    if ( self _meth_81F3( var_0 ) )
        return 1;
    else
    {

    }

    self._id_0231 = var_1;
    self._id_0230 = var_2;
    return 0;
}

_id_849C()
{
    if ( level._id_0883[self._id_04A7] > 0 && level._id_0883[self._id_04A7] < level._id_0884 )
    {
        if ( gettime() - level._id_5574[self._id_04A7] > 4000 )
            return 0;

        var_0 = level._id_5571[self._id_04A7];

        if ( var_0 == self )
            return 0;

        var_1 = isdefined( var_0 ) && _func_0F0( self._id_02E2, var_0._id_02E2 ) < 65536;

        if ( ( var_1 || _func_0F0( self._id_02E2, level._id_5573[self._id_04A7] ) < 65536 ) && ( !isdefined( self._id_0142 ) || _func_0F0( self._id_0142._id_02E2, level._id_5572[self._id_04A7] ) < 262144 ) )
            return 1;
    }

    return 0;
}

_id_1CF0()
{
    if ( !isdefined( level._id_5574[self._id_04A7] ) )
        return 0;

    if ( _id_849C() )
        return 1;

    if ( gettime() - level._id_5574[self._id_04A7] < level._id_0885 )
        return 0;

    if ( !_func_0D1( self._id_0142 ) )
        return 0;

    if ( level._id_0883[self._id_04A7] )
        level._id_0883[self._id_04A7] = 0;

    var_0 = isdefined( self._id_087E ) && self._id_087E;

    if ( !var_0 && _func_0D8( self._id_04A7 ) < _func_0D8( self._id_0142._id_04A7 ) )
        return 0;

    return 1;
}

_id_98A4( var_0 )
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( self._id_017D )
        return 0;

    if ( self.combatmode == "ambush" || self.combatmode == "ambush_nodes_only" )
        return 0;

    if ( !self _meth_8161( self._id_0142._id_02E2 ) )
        return 0;

    if ( _id_514A() )
        return 0;

    if ( !_id_1CF0() )
        return 0;

    self _meth_81F6( var_0 );

    if ( self _meth_81F8() )
    {
        self._id_0231 = 0;
        self._id_0230 = 0;
        self.a._id_58DE = 1;

        if ( level._id_0883[self._id_04A7] == 0 )
        {
            level._id_5574[self._id_04A7] = gettime();
            level._id_5571[self._id_04A7] = self;
        }

        level._id_5573[self._id_04A7] = self._id_02E2;
        level._id_5572[self._id_04A7] = self._id_0142._id_02E2;
        level._id_0883[self._id_04A7]++;
        return 1;
    }

    return 0;
}

_id_27DE( var_0 )
{
    self endon( "death" );
    wait 0.5;
    var_1 = "" + anim._id_1267;
    badplace_cylinder( var_1, 5, var_0, 16, 64, self._id_04A7 );
    anim._id_126A[anim._id_126A.size] = var_1;

    if ( anim._id_126A.size >= 10 )
    {
        var_2 = [];

        for ( var_3 = 1; var_3 < anim._id_126A.size; var_3++ )
            var_2[var_2.size] = anim._id_126A[var_3];

        badplace_delete( anim._id_126A[0] );
        anim._id_126A = var_2;
    }

    anim._id_1267++;

    if ( anim._id_1267 > 10 )
        anim._id_1267 -= 20;
}

_id_9C56( var_0, var_1, var_2 )
{
    if ( var_0 > var_1 && var_0 < var_2 )
        return 1;

    return 0;
}

_id_3FBF()
{
    if ( !isdefined( self._id_840F ) )
        return 0;

    var_0 = self _meth_81BD()[1] - animscripts\utility::_id_4171( self._id_840F );
    var_0 = _func_0EB( var_0 );
    return var_0;
}

_id_3FBE()
{
    if ( !isdefined( self._id_840F ) )
        return 0;

    var_0 = self _meth_81BD()[0] - _func_115( self._id_840F - self _meth_81BC() )[0];
    var_0 = _func_0EB( var_0 );
    return var_0;
}

_id_4082()
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        var_0 = _id_3DB2( self._id_0142 );
    else
        var_0 = self._id_0142 _meth_8099();

    var_1 = var_0 - self _meth_8099();
    var_1 = _func_114( var_1 );
    var_2 = 360 - _func_115( var_1 )[0];
    return _func_0EB( var_2 );
}

_id_4085( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0 - self _meth_8099();
    var_1 = _func_114( var_1 );
    var_2 = 360 - _func_115( var_1 )[0];
    return _func_0EB( var_2 );
}

_id_4083( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return 0;

    if ( isdefined( self ) && animscripts\utility::_id_51B0() )
    {
        var_2 = anglestoforward( self.angles );
        var_3 = _func_11F( var_2, var_0 - self._id_02E2, self.angles[2] * -1 );
        var_0 = var_3 + self._id_02E2;
    }

    var_4 = var_0 - var_1;
    var_4 = _func_114( var_4 );
    var_5 = 360 - _func_115( var_4 )[0];
    return _func_0EB( var_5 );
}

_id_A250()
{
    self._id_518C = 0;
    self._id_55D4 = -1;

    for (;;)
    {
        self waittill( "reload_start" );
        self._id_518C = 1;
        self._id_55D4 = gettime();
        _id_A0EE();
        self._id_518C = 0;
    }
}

_id_A0EE()
{
    thread _id_9362( 4, "reloadtimeout" );
    self endon( "reloadtimeout" );
    self endon( "weapon_taken" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self _meth_830E();

        if ( var_0 == "none" )
            break;

        if ( self _meth_82ED() >= _func_1B1( var_0 ) )
            break;
    }

    self notify( "reloadtimeout" );
}

_id_9362( var_0, var_1 )
{
    self endon( var_1 );
    wait(var_0);
    self notify( var_1 );
}

_id_1D09()
{
    var_0 = self._id_0142._id_02E2 - self._id_02E2;
    var_1 = _func_0F3( ( var_0[0], var_0[1], 0 ) );

    if ( self._id_01D6 == "flash_grenade" )
        return var_1 < 589824;

    if ( isdefined( level.usinggrenadedistancechecks ) && level.usinggrenadedistancechecks )
        return var_1 >= 40000 && var_1 <= 1562500;
    else
        return 1;
}

_id_5E5E()
{
    self endon( "death" );

    if ( !isdefined( level._id_6098 ) )
        self endon( "stop_monitoring_flash" );

    for (;;)
    {
        var_0 = undefined;
        var_1 = undefined;
        var_2 = undefined;
        var_3 = undefined;
        var_4 = undefined;
        self waittill( "flashbang", var_1, var_0, var_2, var_3, var_4 );

        if ( isdefined( self._id_38A8 ) && self._id_38A8 )
            continue;

        if ( isdefined( self._id_7A16 ) && self._id_7A16 != 0 )
            continue;

        if ( isdefined( self._id_04A7 ) && isdefined( var_4 ) && self._id_04A7 == var_4 )
        {
            var_0 = 3 * ( var_0 - 0.75 );

            if ( var_0 < 0 )
                continue;

            if ( isdefined( self._id_91F1 ) )
                continue;
        }

        var_5 = 0.2;

        if ( var_0 > 1 - var_5 )
            var_0 = 1.0;
        else
            var_0 /= ( 1 - var_5 );

        var_6 = 4.5 * var_0;

        if ( var_6 < 0.25 )
            continue;

        self._id_38B6 = var_4;

        if ( isdefined( self.flashbangstopsscriptedanim ) && self.flashbangstopsscriptedanim )
            self _meth_8143();

        _id_A5A4::_id_38AB( var_6 );
        self notify( "doFlashBanged", var_1, var_3 );
    }
}

_id_51A4()
{
    return animscripts\utility::_id_51A3( self._id_0340 );
}

_id_51AB()
{
    return animscripts\utility::_id_51AC( self._id_0340 );
}

_id_514A()
{
    return _id_51AB() || animscripts\utility::_id_9C36();
}

_id_367A()
{
    return 1.5;
}

_id_711F()
{
    return _func_0B5( 1, 1.2 );
}

_id_40A4( var_0 )
{
    if ( var_0.size == 0 )
        return undefined;

    if ( var_0.size == 1 )
        return var_0[0];

    if ( isdefined( self.a._id_6F4D ) && _func_0B2( 100 ) > 20 )
    {
        foreach ( var_3, var_2 in var_0 )
        {
            if ( var_2 == self.a._id_6F4D )
            {
                if ( var_3 < var_0.size - 1 )
                    var_0[var_3] = var_0[var_0.size - 1];

                var_0[var_0.size - 1] = undefined;
                break;
            }
        }
    }

    return var_0[_func_0B2( var_0.size )];
}

_id_6BFF()
{
    var_0 = self _meth_80AA();

    foreach ( var_2 in level._id_0323 )
    {
        if ( !self _meth_81C2( var_2 ) )
            continue;

        var_3 = var_2 _meth_80AA();
        var_4 = _func_115( var_0 - var_3 );
        var_5 = anglestoforward( var_4 );
        var_6 = var_2 _meth_8338();
        var_7 = anglestoforward( var_6 );
        var_8 = _func_0F6( var_5, var_7 );

        if ( var_8 < 0.805 )
            continue;

        if ( common_scripts\utility::_id_2006() && var_8 >= 0.996 )
            continue;

        return 1;
    }

    return 0;
}

_id_3DB2( var_0 )
{
    var_1 = self _meth_81C5( var_0 );
    var_2 = var_0 _meth_8099() - var_0._id_02E2;
    return var_1 + var_2;
}

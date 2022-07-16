// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0 )
{
    self._id_223B = self._id_02E2;
    var_1 = gettime();
    var_2 = spawnstruct();
    var_2._id_60C4 = var_1 - 1;
    var_2._id_60C5 = var_1 - 1;
    _id_744E();
    _id_7458();
    self._id_7C54 = gettime();
    self.a._id_5599 = var_1;
    self.a._id_4B8C = 0;
    self.a._id_5F5B = "stop";
    self._id_5B84 = var_1 + 3000;
    thread _id_A25F();
    var_3 = gettime() > 2500;

    for (;;)
    {
        if ( isdefined( self.cover ) && isdefined( self.cover._id_3936 ) )
        {
            var_4 = gettime();
            thread _id_3168();
            [[ self.cover._id_3936 ]]();

            if ( gettime() == var_4 )
                self notify( "dont_end_idle" );
        }

        if ( animscripts\combat_utility::_id_849C() )
        {
            if ( animscripts\combat_utility::_id_98A4( 1 ) )
            {
                wait 0.05;
                continue;
            }
        }

        if ( isdefined( var_0._id_590A ) )
            _id_1A09( var_0._id_590A, "mainLoopStart" );

        if ( isdefined( var_0._id_5F93 ) )
        {
            if ( _id_1A09( var_0._id_5F93, "moveToNearByCover" ) )
                continue;
        }

        if ( animscripts\utility::_id_51B0() )
            self _meth_81CB( self._id_22BA._id_02E2 );
        else
            self _meth_81CB( self._id_22BA._id_02E2, _id_3F3E() );

        if ( !var_3 )
        {
            _id_4B63( var_0, 0.05 + _func_0B3( 1.5 ) );
            var_3 = 1;
            continue;
        }

        if ( _id_2D05( var_0 ) )
            continue;

        if ( isdefined( anim._id_933B ) && _func_1A1( level._id_0318 ) )
        {
            if ( _id_98A5( var_0, level._id_0318 ) )
                continue;
        }

        if ( _id_747F() )
            return;

        var_5 = 0;
        var_6 = 0;

        if ( _func_1A1( self._id_0142 ) )
        {
            var_5 = _id_50FD();
            var_6 = animscripts\utility::_id_1AF0();
        }

        if ( var_5 )
        {
            if ( self.a._id_3F1B < gettime() )
            {
                if ( animscripts\combat_utility::_id_585F() )
                    return;
            }

            _id_0E4D( var_0 );
            continue;
        }

        if ( isdefined( self._id_08A8 ) || _id_32B0() )
        {
            if ( _id_0882() )
                return;
        }

        if ( var_6 )
        {
            _id_0E4B( var_0, var_2 );
            continue;
        }

        if ( _id_0E46( var_0, var_2 ) )
            return;
    }
}
#using_animtree("generic_human");

_id_013F( var_0 )
{
    self._id_993E = undefined;
    self.a._id_6F4D = undefined;

    if ( isdefined( self._id_5B84 ) && self._id_5B84 <= gettime() )
    {
        self._id_5B83 = gettime() + 5000;
        self._id_5B84 = undefined;
    }

    self _meth_8144( %head, 0.2 );
    self._id_35C7 = undefined;
}

_id_3F3E()
{
    if ( self._id_0424 )
        return animscripts\swim::_id_404A( self._id_22BA );

    var_0 = ( self._id_22BA.angles[0], animscripts\utility::_id_404B( self._id_22BA ), self._id_22BA.angles[2] );
    return var_0;
}

_id_747F()
{
    if ( self _meth_8166() && self.a._id_7480 < gettime() )
    {
        if ( animscripts\combat_utility::_id_585F() )
            return 1;

        self.a._id_7480 = gettime() + 30000;
    }

    return 0;
}

_id_2D05( var_0 )
{
    if ( _id_8FE6( var_0 ) )
    {
        if ( _id_50FD() )
            _id_745B();

        self.a._id_5599 = gettime();
        return 1;
    }

    if ( _id_22BE( var_0, 0 ) )
        return 1;

    return 0;
}

_id_0E4D( var_0 )
{
    if ( _func_0F0( self._id_02E2, self._id_0142._id_02E2 ) > 562500 )
    {
        if ( _id_98A5( var_0, self._id_0142 ) )
            return;
    }

    if ( _id_5667( var_0, "normal" ) )
    {
        _id_745B();
        self.a._id_5599 = gettime();
    }
    else
        _id_4B63( var_0 );
}

_id_0E4B( var_0, var_1 )
{
    if ( self._id_012E )
    {
        if ( _id_5667( var_0, "ambush" ) )
            return;
    }
    else if ( self._id_0348 || gettime() >= var_1._id_60C5 )
    {
        var_2 = "suppress";

        if ( !self._id_0348 && gettime() - self._id_55FE > 5000 && _func_0B2( 3 ) < 2 )
            var_2 = "ambush";
        else if ( !animscripts\shoot_behavior::_id_84B6() )
            var_2 = "ambush";

        if ( _id_5667( var_0, var_2 ) )
        {
            var_1._id_60C5 = gettime() + _func_0B4( 3000, 20000 );

            if ( _id_50FD() )
                self.a._id_5599 = gettime();

            return;
        }
    }

    if ( _id_98A5( var_0, self._id_0142 ) )
        return;

    _id_4B63( var_0 );
}

_id_0E46( var_0, var_1 )
{
    if ( _id_22BE( var_0, 0.1 ) )
        return 0;

    if ( isdefined( self._id_0142 ) )
    {
        if ( _id_98A5( var_0, self._id_0142 ) )
            return 0;
    }

    if ( !self._id_012E && gettime() >= var_1._id_60C4 )
    {
        if ( _id_5860( var_0 ) )
        {
            var_1._id_60C4 = gettime() + _func_0B4( 4000, 15000 );
            return 0;
        }
    }

    if ( gettime() > self.a._id_3F1B )
    {
        if ( _id_1AF2() )
            return 1;
    }

    if ( self._id_012E || gettime() >= var_1._id_60C5 && isdefined( self._id_0142 ) )
    {
        if ( _id_5667( var_0, "ambush" ) )
        {
            if ( _id_50FD() )
                _id_745B();

            self.a._id_5599 = gettime();
            var_1._id_60C5 = gettime() + _func_0B4( 6000, 20000 );
            return 0;
        }
    }

    _id_4B63( var_0 );
    return 0;
}

_id_50FD()
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( _func_0F0( self._id_0142._id_02E2, self._id_223B ) < 256 )
        return 0;
    else
        return animscripts\utility::_id_1AE2();
}

_id_8FE6( var_0 )
{
    if ( !animscripts\utility::_id_51C3() )
        return 0;

    var_1 = gettime();
    var_2 = 1;

    while ( animscripts\utility::_id_51C3() )
    {
        var_2 = 0;
        self _meth_81CB( self._id_22BA._id_02E2 );
        var_3 = 1;

        if ( isdefined( self._id_3696 ) )
            var_3 = common_scripts\utility::_id_2006();

        if ( var_3 )
        {
            if ( _id_98A7( var_0 ) )
            {
                self notify( "killanimscript" );
                return 1;
            }
        }

        if ( self.a._id_0D83 && animscripts\utility::_id_1AE1() )
            return 0;

        var_4 = _id_50FD() || animscripts\utility::_id_1AF0();

        if ( var_4 && isdefined( anim._id_933B ) && _func_1A1( level._id_0318 ) )
        {
            if ( _id_98A5( var_0, level._id_0318 ) )
                continue;
        }

        if ( _id_22BE( var_0, 0 ) )
            continue;

        if ( self._id_04A7 != "allies" && gettime() >= var_1 )
        {
            if ( _id_14AB( var_0 ) )
            {
                var_1 = gettime();

                if ( !isdefined( self._id_3696 ) )
                    var_1 += _func_0B4( 3000, 12000 );

                continue;
            }
        }

        if ( var_4 && _id_98A5( var_0, self._id_0142 ) )
        {
            var_2 = 1;
            continue;
        }

        if ( _id_22BE( var_0, 0.1 ) )
            continue;

        _id_4B63( var_0 );
    }

    if ( !var_2 && _func_0B2( 2 ) == 0 )
        _id_585E( var_0 );

    return 1;
}

_id_4080( var_0 )
{
    var_1 = [];

    if ( var_0 == 1 )
        var_1[0] = 0;
    else if ( var_0 == 2 )
    {
        var_1[0] = _func_0B2( 2 );
        var_1[1] = 1 - var_1[0];
    }
    else
    {
        for ( var_2 = 0; var_2 < var_0; var_2++ )
            var_1[var_2] = var_2;

        for ( var_2 = 0; var_2 < var_0; var_2++ )
        {
            var_3 = var_2 + _func_0B2( var_0 - var_2 );
            var_4 = var_1[var_3];
            var_1[var_3] = var_1[var_2];
            var_1[var_2] = var_4;
        }
    }

    return var_1;
}

_id_1A09( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    thread _id_3168();
    var_5 = gettime();
    var_6 = undefined;

    if ( isdefined( var_4 ) )
        var_6 = [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        var_6 = [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        var_6 = [[ var_0 ]]( var_2 );
    else
        var_6 = [[ var_0 ]]();

    if ( !var_6 )
        self notify( "dont_end_idle" );
    else
    {

    }

    return var_6;
}

_id_A25F()
{
    self endon( "killanimscript" );
    self._id_55FE = gettime() - 100000;
    self._id_8FEB = self._id_55FE;

    for (;;)
    {
        self waittill( "suppression" );
        var_0 = gettime();

        if ( self._id_55FE < var_0 - 700 )
            self._id_8FEB = var_0;

        self._id_55FE = var_0;
    }
}

_id_22BE( var_0, var_1 )
{
    if ( self._id_18B0 > _func_1B1( self._id_0513 ) * var_1 )
        return 0;

    self._id_518C = 1;
    var_2 = _id_1A09( var_0._id_0362, "reload" );
    self._id_518C = 0;
    return var_2;
}

_id_5667( var_0, var_1 )
{
    thread animscripts\shoot_behavior::_id_2743( var_1 );

    if ( !self._id_017D && !self._id_012E )
        thread _id_17E1();

    var_2 = _id_1A09( var_0._id_5667, "leaveCoverAndShoot" );
    self notify( "stop_deciding_how_to_shoot" );
    return var_2;
}

_id_5860( var_0 )
{
    if ( self.a._id_0D83 && animscripts\utility::_id_1AE1() )
        return 0;

    if ( self.a._id_5599 + 6000 > gettime() )
        return _id_585E( var_0 );
    else
    {
        var_1 = _id_1A09( var_0._id_0256, "look", 2 + _func_0B3( 2 ) );

        if ( var_1 )
            return 1;

        return _id_1A09( var_0._id_367E, "fastlook" );
    }
}

_id_585E( var_0 )
{
    var_1 = _id_1A09( var_0._id_367E, "fastlook" );

    if ( var_1 )
        return 1;

    return _id_1A09( var_0._id_0256, "look", 0 );
}

_id_4B63( var_0, var_1 )
{
    self._id_38E0 = 0;

    if ( isdefined( var_0._id_38DF ) )
    {
        if ( !self.a._id_4B8C && gettime() - self._id_8FEB < 600 )
        {
            if ( _id_1A09( var_0._id_38DF, "flinch" ) )
                return 1;
        }
        else
            thread _id_38E1( var_0 );
    }

    if ( !self.a._id_4B8C )
    {
        thread _id_4B87( var_0._id_4B63 );
        self.a._id_4B8C = 1;
    }

    if ( isdefined( var_1 ) )
        _id_4B8A( var_1 );
    else
        _id_4B8B();

    if ( self._id_38E0 )
        self waittill( "flinch_done" );

    self notify( "stop_waiting_to_flinch" );
}

_id_4B8A( var_0 )
{
    self endon( "end_idle" );
    wait(var_0);
}

_id_4B8B()
{
    self endon( "end_idle" );
    wait(0.3 + _func_0B3( 0.1 ));
    self waittill( "do_slow_things" );
}

_id_4B87( var_0 )
{
    var_1 = gettime();
    self endon( "killanimscript" );
    self [[ var_0 ]]();
}

_id_38E1( var_0 )
{
    self endon( "killanimscript" );
    self endon( "stop_waiting_to_flinch" );
    var_1 = self._id_55FE;

    for (;;)
    {
        self waittill( "suppression" );
        var_2 = gettime();

        if ( var_1 < var_2 - 2000 )
            break;

        var_1 = var_2;
    }

    self._id_38E0 = 1;
    var_3 = _id_1A09( var_0._id_38DF, "flinch" );
    self._id_38E0 = 0;
    self notify( "flinch_done" );
}

_id_3168()
{
    self endon( "killanimscript" );
    self endon( "dont_end_idle" );
    waitframe;

    if ( !isdefined( self ) )
        return;

    self notify( "end_idle" );
    self.a._id_4B8C = 0;
}

_id_98A5( var_0, var_1 )
{
    var_2 = anglestoforward( self.angles );
    var_3 = _func_114( var_1._id_02E2 - self._id_02E2 );

    if ( _func_0F6( var_2, var_3 ) < 0 )
        return 0;

    if ( self._id_012E && !animscripts\utility::_id_7262() )
        return 0;

    if ( animscripts\utility::_id_516E() )
        return _id_1A09( var_0._id_4401, "grenadeHidden", var_1 );
    else
        return _id_1A09( var_0._id_01CA, "grenade", var_1 );
}

_id_14AB( var_0 )
{
    if ( !animscripts\utility::_id_1AAF() )
        return 0;

    return _id_1A09( var_0._id_14AB, "blindfire" );
}

_id_17E1()
{
    self endon( "killanimscript" );
    self endon( "stop_deciding_how_to_shoot" );

    for (;;)
    {
        if ( self._id_017D || self._id_012E )
            return;

        wait(0.5 + _func_0B3( 0.75 ));

        if ( !isdefined( self._id_0142 ) )
            continue;

        if ( _id_32B0() )
        {
            if ( _id_0882() )
                return;
        }

        if ( !animscripts\utility::_id_7262() && !animscripts\utility::_id_1AEF() )
        {
            if ( gettime() > self.a._id_3F1B )
            {
                if ( _id_1AF2() )
                    return;
            }
        }
    }
}

_id_32B0()
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( self._id_0142 common_scripts\utility::_id_5108() )
        return 1;

    if ( _func_1AD( self._id_0142 ) )
    {
        if ( isdefined( self._id_0142._id_01E6 ) && self._id_0142._id_01E6 < self._id_0142._id_0271 )
            return 1;
    }
    else if ( _func_0CF( self._id_0142 ) && self._id_0142 animscripts\utility::_id_51C3() )
        return 1;

    if ( isdefined( self._id_0142._id_518C ) && self._id_0142._id_518C )
        return 1;

    return 0;
}

_id_7458()
{
    self.a._id_7480 = 0;
}

_id_744E()
{
    var_0 = gettime();

    if ( isdefined( self._id_2A4C ) && var_0 > self.a._id_3F1B )
        self.a._id_3F1B = var_0 + _func_0B4( 2000, 5000 );
    else if ( isdefined( self._id_0142 ) )
    {
        var_1 = _func_0EF( self._id_02E2, self._id_0142._id_02E2 );

        if ( var_1 < self._id_014E )
        {
            self.a._id_3F1B = var_0 + _func_0B4( 5000, 10000 );
            return;
        }

        if ( var_1 > self._id_014C && var_1 < self._id_01C4 )
        {
            self.a._id_3F1B = var_0 + _func_0B4( 2000, 5000 );
            return;
        }

        self.a._id_3F1B = var_0 + _func_0B4( 10000, 15000 );
        return;
        return;
    }
    else
        self.a._id_3F1B = var_0 + _func_0B4( 5000, 15000 );
}

_id_745B()
{
    if ( isdefined( self._id_08A8 ) )
        self._id_7C54 = gettime() + _func_0B4( 500, 1000 );
    else
        self._id_7C54 = gettime() + _func_0B4( 3000, 5000 );
}

_id_1AF2()
{
    return _id_0882();
}

_id_0882()
{
    if ( self._id_017D || self._id_012E )
        return 0;

    if ( isdefined( self._id_08A8 ) && gettime() >= self._id_7C54 )
        return animscripts\combat_utility::_id_98A4( 0 );

    var_0 = 0;

    if ( !isdefined( self._id_0142 ) || !self._id_0142 common_scripts\utility::_id_5108() )
        var_0 = animscripts\combat_utility::_id_585F();

    if ( !var_0 && isdefined( self._id_0142 ) && !animscripts\utility::_id_1AE2() )
    {
        if ( gettime() >= self._id_7C54 )
            return animscripts\combat_utility::_id_98A4( 0 );
    }

    return var_0;
}

_id_98A7( var_0 )
{
    if ( isdefined( var_0._id_5F93 ) )
    {
        if ( _id_1A09( var_0._id_5F93, "moveToNearByCover" ) )
            return 1;
    }

    return animscripts\combat_utility::_id_585F();
}

copy_anim_array_to_a_array( var_0 )
{
    var_1 = animscripts\utility::_id_5864( var_0 );

    foreach ( var_4, var_3 in var_1 )
        self.a._id_0CD8[var_4] = var_3;
}

set_cqb_standing_turns()
{
    copy_anim_array_to_a_array( "cqb_stationary_turn" );
}

set_casual_standing_turns()
{
    copy_anim_array_to_a_array( "casual_stationary_turn" );
}

_id_7EC2()
{
    copy_anim_array_to_a_array( "exposed_turn" );
}

_id_7EC1()
{
    copy_anim_array_to_a_array( "coverstand_turn" );
}

_id_7DFB()
{
    copy_anim_array_to_a_array( "exposed_turn_crouch" );
}

_id_7ECD()
{
    self.a._id_0CD8["turn_left_45"] = animscripts\swim::_id_4100( "turn_left_45" );
    self.a._id_0CD8["turn_left_90"] = animscripts\swim::_id_4100( "turn_left_90" );
    self.a._id_0CD8["turn_left_135"] = animscripts\swim::_id_4100( "turn_left_135" );
    self.a._id_0CD8["turn_left_180"] = animscripts\swim::_id_4100( "turn_left_180" );
    self.a._id_0CD8["turn_right_45"] = animscripts\swim::_id_4100( "turn_right_45" );
    self.a._id_0CD8["turn_right_90"] = animscripts\swim::_id_4100( "turn_right_90" );
    self.a._id_0CD8["turn_right_135"] = animscripts\swim::_id_4100( "turn_right_135" );
    self.a._id_0CD8["turn_right_180"] = animscripts\swim::_id_4100( "turn_right_180" );
}

_id_993F( var_0 )
{
    if ( isdefined( self._id_02BB ) )
    {
        var_1 = self._id_02BB;
        var_2 = _func_0BE( _func_0EB( self.angles[1] - var_1.angles[1] + var_0 ) );

        if ( self.a._id_6E5A == "stand" && var_1 _meth_8035() != "stand" )
        {
            if ( var_2 > 45 && var_2 < 90 )
                self _meth_8193( "face angle", self.angles[1] );
            else
                self _meth_8193( "face current" );

            var_3 = 1.5;
            var_4 = %exposed_stand_2_crouch;

            if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
                var_4 = %s1_exposed_stand_2_crouch;

            var_5 = getnotetracktimes( var_4, "anim_pose = \"crouch\"" )[0];
            var_5 = _func_0BF( 1, var_5 * 1.1 );
            var_6 = var_5 * getanimlength( var_4 ) / var_3;
            self _meth_8112( "crouchanim", var_4, %body, 1, 0.2, var_3 );
            animscripts\notetracks::_id_2D0B( var_6, "crouchanim" );
            self _meth_8144( %body, 0.2 );
        }

        if ( animscripts\utility::_id_51B0() )
        {
            self notify( "force_space_rotation_update", 0, 0 );
            return;
        }
        else
            self _meth_8193( "face angle", self.angles[1] );

        var_7 = _func_0EB( self.angles[1] - var_1.angles[1] + var_0 );

        if ( _func_0BE( var_7 ) > 45 )
        {
            if ( self._id_0424 )
                _id_7ECD();
            else if ( self.a._id_6E5A == "stand" )
            {
                if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
                {
                    if ( isdefined( self._id_22CB ) )
                    {
                        if ( self._id_22CB == "stand" )
                            _id_7EC1();
                        else
                            _id_7EC2();
                    }
                    else
                        _id_7EC2();
                }
                else if ( isdefined( self._id_22E0 ) && self._id_22E0 )
                    set_cqb_standing_turns();
                else if ( animscripts\utility::is_in_casual_standing_stance() )
                    set_casual_standing_turns();
                else
                    _id_7EC2();
            }
            else
                _id_7DFB();

            self._id_993A = 45;
            self._id_993E = 1;
            animscripts\combat::_id_993D( var_7 );
            self._id_993E = undefined;
        }
    }
}

_id_5F93()
{
    if ( self _meth_813F() )
        return 0;

    if ( !isdefined( self._id_0142 ) )
        return 0;

    if ( isdefined( self._id_2A4C ) )
    {
        self._id_2A4C = undefined;
        return 0;
    }

    if ( !isdefined( self._id_02BB ) )
        return 0;

    if ( animscripts\utility::_id_515A( self._id_02BB ) )
        return 0;

    if ( _func_0B2( 3 ) == 0 )
        return 0;

    if ( self._id_017D || self._id_012E || self._id_0230 || self._id_0231 )
        return 0;

    if ( _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) > 256 )
        return 0;

    var_0 = self _meth_81EE();

    if ( isdefined( var_0 ) && var_0 != self._id_02BB && self _meth_81F3( var_0 ) )
    {
        self._id_8547 = 1;
        self._id_8549 = var_0;
        self._id_2A4C = 1;
        wait 0.5;
        return 1;
    }

    return 0;
}

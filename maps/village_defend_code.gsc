// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

minigun_player_anims()
{
    level.minigun_node = getent( "minigun_anim_node", "targetname" );
    _id_A510::_id_0BC7( self, "use" );

    for (;;)
    {
        self waittill( "turretownerchange" );
        minigun_player_use();
        self waittill( "turretownerchange" );
        minigun_player_drop();
    }
}

minigun_player_use()
{
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_811B( 1 );
    level._id_0318 _meth_811A( 0 );
    level._id_0318 _meth_831A();
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 12.0, 500, 1.0, 1.0 );
    level.eplayerview = _id_A5A4::_id_88D1( "minigun_player", level.minigun_node._id_02E2, level.minigun_node.angles );
    level.eplayerview _meth_8056();
    level.minigun_node _id_A510::_id_0BC7( level.eplayerview, "use_minigun" );
    level._id_0318 _meth_855E( level.eplayerview, "tag_player", 1, 0.7, 0, 0.4, 0, 0, 0, 0, 1 );
    level.minigun_previous_fov = _func_09A();
    level._id_0318 _meth_8032( 55, 0.5 );
    wait 0.3;
    level.eplayerview _meth_8055();
    _id_A510::_id_0BC7( self, "use" );
    thread _id_A510::_id_0C24( self, "use" );
    level.minigun_node _id_A510::_id_0C24( level.eplayerview, "use_minigun" );
    level.eplayerview _meth_8056();
    level._id_0318 _meth_8051();
    level.minigun_eye_height = level._id_0318 _meth_82EF();
    level._id_0318 _meth_84C7( 0 );
    self _meth_856C();
}

minigun_player_drop()
{
    var_0 = self _meth_8184( "tag_flash" );
    var_1 = self _meth_8185( "tag_flash" );
    var_2 = _func_24E( var_1 );
    var_3 = level._id_0318 _meth_80AA();
    var_4 = level._id_0318 _meth_82EF();
    var_5 = var_3 - var_0;
    var_6 = ( _func_0F6( var_5, var_2["forward"] ), _func_0F6( var_5, var_2["right"] ), _func_0F6( var_5, var_2["up"] ) );
    var_6 -= ( 0, 0, level.minigun_eye_height );
    level.eplayerview _meth_804F( self, "tag_flash", var_6, ( 0, 0, 0 ) );
    level._id_0318 _meth_8081( level.eplayerview, undefined );
    waittillframeend;
    self _meth_856D();
    self waittill( "turret_returned_to_default" );
    level._id_0318 _meth_84C8();
    _id_A510::_id_0BC7( self, "drop" );
    thread _id_A510::_id_0C24( self, "drop" );
    level.eplayerview _meth_8051();
    level._id_0318 _meth_831B();
    var_7 = level._id_0318 _meth_8338();
    var_8 = anglestoforward( var_7 );
    var_9 = level._id_0318._id_02E2 + ( 0, 0, 20 );
    var_9 -= var_8 * 20;
    var_10 = var_9 - ( 0, 0, 100 );
    var_11 = _func_090( var_9, var_10 );
    level.eplayerview _meth_82AA( var_11, 0.5, 0.2, 0.2 );
    level._id_0318 _meth_8032( level.minigun_previous_fov, 0.5 );
    level._id_0318 _meth_84A6();
    wait 0.5;
    level._id_0318 _meth_8051();
    level.eplayerview delete();
    level._id_0318 _meth_811C( 1 );
    level._id_0318 _meth_811B( 1 );
    level._id_0318 _meth_811A( 1 );
}

minigun_think()
{
    common_scripts\utility::_id_383D( "player_on_minigun" );
    self._id_0C72 = "minigun";
    _id_A5A4::_id_0D61();
    thread minigun_console_hint();
    thread minigun_player_anims();
    thread minigun_used();

    for (;;)
    {
        for (;;)
        {
            if ( isdefined( self _meth_80ED() ) )
                break;

            wait 0.05;
        }

        level thread overheat_enable();
        common_scripts\utility::_id_383F( "player_on_minigun" );

        for (;;)
        {
            if ( !isdefined( self _meth_80ED() ) )
                break;

            wait 0.05;
        }

        common_scripts\utility::_id_3831( "player_on_minigun" );
        level thread overheat_disable();
        self._id_767A _meth_80B1( "minigun_rumble" );
    }
}

minigun_const()
{
    level.turret_heat_status = 1;
    level.turret_heat_max = 114;
    level.turret_cooldownrate = 15;
    level.overheat_hud_height_max = 110;
    var_0 = getent( "minigun", "targetname" );
    var_0 _meth_8569( 150 );
    var_0 _meth_815C( 0 );
    var_0 _meth_856B( 1 );
}

minigun_rumble()
{
    var_0 = 0;
    var_1 = 750;
    var_2 = var_1 - var_0;
    self._id_767A = spawn( "script_origin", self._id_02E2 );

    for (;;)
    {
        wait 0.05;

        if ( self._id_5D5C <= 0 || !common_scripts\utility::_id_382E( "player_on_minigun" ) )
            continue;

        self._id_767A._id_02E2 = level._id_0318 _meth_80AA() + ( 0, 0, var_1 - var_2 * self._id_5D5C );
        self._id_767A _meth_80AF( "minigun_rumble" );
    }
}

minigun_console_hint()
{
    var_0 = getent( "minigun", "targetname" );

    while ( !common_scripts\utility::_id_382E( "minigun_lesson_learned" ) )
    {
        wait 0.05;
        var_1 = var_0 _meth_80ED();

        if ( isdefined( var_1 ) && level._id_0318 != var_1 || !isdefined( var_1 ) )
            continue;

        if ( isdefined( level.minigun_console_hint_displayed ) )
            continue;

        if ( level._id_0318 common_scripts\utility::_id_5064() )
            level._id_0318 thread _id_A5A4::_id_2B4A( "minigun_spin_left_trigger" );
        else
            level._id_0318 thread _id_A5A4::_id_2B4A( "minigun_spin_keyboard" );

        level.minigun_console_hint_displayed = 1;
    }
}

minigun_used()
{
    common_scripts\utility::_id_384A( "player_on_minigun" );

    if ( level._id_2153 )
        var_0 = 6;
    else
        var_0 = 10;

    var_1 = 4;
    var_2 = 7;
    var_3 = 0.02;
    var_4 = 0.02;
    var_5 = 0.35;
    var_6 = 0;
    var_7 = 1 / var_0 * 20;
    var_8 = 1 / var_1 * 20;
    level._id_020D = 0;
    var_9 = 0;
    self._id_5D5C = 0;
    var_10 = 0;
    var_11 = 1;
    var_12 = 0;
    var_13 = 0;
    var_14 = undefined;
    var_15 = 0;
    var_16 = 0;
    var_17 = undefined;
    var_18 = 0;
    level.frames = 0;
    level.normframes = 0;
    var_19 = 0;
    thread minigun_rumble();

    for (;;)
    {
        level.normframes++;

        if ( common_scripts\utility::_id_382E( "player_on_minigun" ) )
        {
            if ( !level._id_020D )
            {
                if ( level._id_0318 common_scripts\utility::_id_5064() )
                {
                    if ( level._id_0318 _meth_833B() )
                    {
                        level._id_020D = 1;
                        thread minigun_sound_spinup();
                    }
                }
                else if ( level._id_0318 _meth_833A() )
                {
                    level._id_020D = 1;
                    thread minigun_sound_spinup();
                }
            }
            else if ( level._id_0318 common_scripts\utility::_id_5064() )
            {
                if ( !level._id_0318 _meth_833B() )
                {
                    level._id_020D = 0;
                    thread minigun_sound_spindown();
                }
                else if ( !level._id_0318 _meth_833B() && level._id_0318 _meth_833A() && var_15 )
                {
                    level._id_020D = 0;
                    thread minigun_sound_spindown();
                }
            }
            else if ( !level._id_0318 _meth_833A() )
            {
                level._id_020D = 0;
                thread minigun_sound_spindown();
            }
            else if ( level._id_0318 _meth_833A() && var_15 )
            {
                level._id_020D = 0;
                thread minigun_sound_spindown();
            }

            if ( level._id_0318 common_scripts\utility::_id_5064() )
            {
                if ( level._id_0318 _meth_833B() )
                {
                    var_6 += 0.05;

                    if ( var_6 >= 2.75 )
                        common_scripts\utility::_id_383F( "minigun_lesson_learned" );
                }
                else
                    var_6 = 0;
            }

            if ( !var_13 )
            {
                if ( level._id_0318 _meth_833A() && !var_15 && var_12 )
                {
                    var_13 = 1;
                    var_17 = gettime();

                    if ( !level._id_0318 common_scripts\utility::_id_5064() )
                        common_scripts\utility::_id_383F( "minigun_lesson_learned" );
                }
                else if ( level._id_0318 _meth_833A() && var_15 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
            else
            {
                if ( !level._id_0318 _meth_833A() )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }

                if ( level._id_0318 _meth_833A() && !var_12 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
        }
        else
        {
            if ( var_13 || level._id_020D == 1 )
                thread minigun_sound_spindown();

            var_13 = 0;
            level._id_020D = 0;
        }

        if ( var_15 )
        {
            if ( !( var_10 >= var_11 ) )
            {
                var_15 = 0;
                var_17 = undefined;
                self _meth_817D();
            }
        }

        if ( level._id_020D )
        {
            var_9 += var_3;
            self._id_5D5C = var_9;
        }
        else
        {
            var_9 -= var_4;
            self._id_5D5C = var_9;
        }

        if ( var_9 > var_11 )
        {
            var_9 = var_11;
            self._id_5D5C = var_9;
        }

        if ( var_9 < 0 )
        {
            var_9 = 0;
            self._id_5D5C = var_9;
            self notify( "done" );
        }

        if ( var_9 == var_11 )
        {
            var_12 = 1;
            var_14 = gettime();
            self _meth_817D();
        }
        else
        {
            var_12 = 0;
            self _meth_815E();
        }

        if ( var_13 && !var_15 )
        {
            level.frames++;
            var_10 += var_7;
        }

        if ( gettime() > var_16 && !var_13 )
            var_10 -= var_8;

        if ( var_10 > var_11 )
            var_10 = var_11;

        if ( var_10 < 0 )
            var_10 = 0;

        level._id_4795 = var_10;
        level.turret_heat_status = _func_0BC( var_10 * 114 );

        if ( isdefined( level.overheat_status2 ) )
            thread overheat_hud_update();

        if ( var_10 >= var_11 && var_10 <= var_11 && ( var_18 < var_11 || var_18 > var_11 ) )
        {
            var_15 = 1;
            var_16 = gettime() + var_2 * 1000;
            var_19 = 0;
            thread overheat_overheated();
        }

        var_18 = var_10;

        if ( var_15 )
        {
            self _meth_815E();
            var_13 = 0;

            if ( gettime() > var_19 )
            {
                playfxontag( common_scripts\utility::_id_3FA8( "turret_overheat_smoke" ), self, "tag_flash" );
                var_19 = gettime() + var_5 * 1000;
            }
        }

        self _meth_814D( _id_A5A4::_id_3EF5( "spin" ), 1, 0.2, var_9 );
        wait 0.05;
    }
}

minigun_sound_spinup()
{
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self._id_5D5C < 0.25 )
    {
        self _meth_809C( "minigun_gatling_spinup1" );
        wait 0.6;
        self _meth_809C( "minigun_gatling_spinup2" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spinup3" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self._id_5D5C < 0.5 )
    {
        self _meth_809C( "minigun_gatling_spinup2" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spinup3" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self._id_5D5C < 0.75 )
    {
        self _meth_809C( "minigun_gatling_spinup3" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self._id_5D5C < 1 )
    {
        self _meth_809C( "minigun_gatling_spinup4" );
        wait 0.5;
    }

    thread minigun_sound_spinloop();
}

minigun_sound_spinloop()
{
    level notify( "stopMinigunSound" );
    level common_scripts\utility::play_loopsound_in_space_with_end( "minigun_gatling_spin", self._id_02E2, "stopMinigunSound" );
}

minigun_sound_spindown()
{
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self._id_5D5C > 0.75 )
    {
        self _meth_80AE();
        self _meth_809C( "minigun_gatling_spindown4" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spindown3" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spindown2" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self._id_5D5C > 0.5 )
    {
        self _meth_809C( "minigun_gatling_spindown3" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spindown2" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self._id_5D5C > 0.25 )
    {
        self _meth_809C( "minigun_gatling_spindown2" );
        wait 0.5;
        self _meth_809C( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else
    {
        self _meth_809C( "minigun_gatling_spindown1" );
        wait 0.65;
    }
}

overheat_enable()
{
    level thread overheat_hud();
    common_scripts\utility::_id_3831( "disable_overheat" );
}

overheat_disable()
{
    common_scripts\utility::_id_383F( "disable_overheat" );
    level._id_781D = undefined;
    waitframe;

    if ( isdefined( level.overheat_bg ) )
        level.overheat_bg _meth_808A();

    if ( isdefined( level.overheat_bg_distort ) )
        level.overheat_bg_distort _meth_808A();

    if ( isdefined( level.overheat_icon ) )
        level.overheat_icon _meth_808A();

    if ( isdefined( level.overheat_status ) )
        level.overheat_status _meth_808A();

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2 _meth_808A();

    if ( isdefined( level.overheat_flashing ) )
        level.overheat_flashing _meth_808A();
}

overheat_hud()
{
    level endon( "disable_overheat" );

    if ( !isdefined( level.overheat_bg ) )
    {
        level.overheat_bg = _func_1A9();
        level.overheat_bg.alignx = "right";
        level.overheat_bg.aligny = "bottom";
        level.overheat_bg._id_01F3 = "right";
        level.overheat_bg._id_0501 = "bottom";
        level.overheat_bg._id_0530 = -29;
        level.overheat_bg._id_0538 = -146;
        level.overheat_bg.alpha = 0.3;
        level.overheat_bg _meth_80CE( "h1_hud_temperature_border", 14, 114 );
        level.overheat_bg._id_03D4 = 5;
    }

    if ( !isdefined( level.overheat_bg_distort ) )
    {
        level.overheat_bg_distort = _func_1A9();
        level.overheat_bg_distort.alignx = "right";
        level.overheat_bg_distort.aligny = "bottom";
        level.overheat_bg_distort._id_01F3 = "right";
        level.overheat_bg_distort._id_0501 = "bottom";
        level.overheat_bg_distort._id_0530 = -29;
        level.overheat_bg_distort._id_0538 = -146;
        level.overheat_bg_distort.alpha = 0.9;
        level.overheat_bg_distort _meth_80CE( "h1_hud_temperature_blur", 14, 114 );
        level.overheat_bg_distort._id_03D4 = 4;
    }

    if ( !isdefined( level.overheat_icon ) )
    {
        level.overheat_icon = _func_1A9();
        level.overheat_icon.alignx = "right";
        level.overheat_icon.aligny = "bottom";
        level.overheat_icon._id_01F3 = "right";
        level.overheat_icon._id_0501 = "bottom";
        level.overheat_icon._id_0530 = -26;
        level.overheat_icon._id_0538 = -126;
        level.overheat_icon _meth_80CE( "h1_hud_temperature_icon", 28, 28 );
        level.overheat_icon._id_03D4 = 6;
    }

    var_0 = -31;
    var_1 = -149.5;

    if ( !isdefined( level.overheat_status ) )
    {
        level.overheat_status = _func_1A9();
        level.overheat_status.alignx = "right";
        level.overheat_status.aligny = "bottom";
        level.overheat_status._id_01F3 = "right";
        level.overheat_status._id_0501 = "bottom";
        level.overheat_status._id_0530 = var_0;
        level.overheat_status._id_0538 = var_1;
        level.overheat_status _meth_80CE( "white", 10, 0 );
        level.overheat_status.color = ( 1, 0.9, 0 );
        level.overheat_status.alpha = 0;
        level.overheat_status._id_03D4 = 1;
    }

    if ( !isdefined( level.overheat_status2 ) )
    {
        level.overheat_status2 = _func_1A9();
        level.overheat_status2.alignx = "right";
        level.overheat_status2.aligny = "bottom";
        level.overheat_status2._id_01F3 = "right";
        level.overheat_status2._id_0501 = "bottom";
        level.overheat_status2._id_0530 = var_0;
        level.overheat_status2._id_0538 = var_1;
        level.overheat_status2 _meth_80CE( "white", 10, 0 );
        level.overheat_status2.color = ( 1, 0.9, 0 );
        level.overheat_status2.alpha = 0;
        level.overheat_status2._id_03D4 = 2;
    }

    if ( !isdefined( level.overheat_flashing ) )
    {
        level.overheat_flashing = _func_1A9();
        level.overheat_flashing.alignx = "right";
        level.overheat_flashing.aligny = "bottom";
        level.overheat_flashing._id_01F3 = "right";
        level.overheat_flashing._id_0501 = "bottom";
        level.overheat_flashing._id_0530 = var_0;
        level.overheat_flashing._id_0538 = var_1;
        level.overheat_flashing _meth_80CE( "white", 10, level.overheat_hud_height_max );
        level.overheat_flashing.color = ( 0.8, 0.16, 0 );
        level.overheat_flashing.alpha = 0;
        level.overheat_flashing._id_03D4 = 3;
    }
}

overheat_overheated()
{
    level endon( "disable_overheat" );

    if ( !common_scripts\utility::_id_382E( "disable_overheat" ) )
    {
        level._id_781D = 0;
        level._id_0318 thread _id_A5A4::_id_69C4( "h1_wep_m134_overheat" );
        level.overheat_flashing.alpha = 1;
        level.overheat_status.alpha = 0;
        level.overheat_status2.alpha = 0;
        level notify( "stop_overheat_drain" );
        level.turret_heat_status = level.turret_heat_max;
        thread overheat_hud_update();

        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            level.overheat_flashing _meth_8086( 0.5 );
            level.overheat_flashing.alpha = 0.5;
            wait 0.5;
            level.overheat_flashing _meth_8086( 0.5 );
            level.overheat_flashing.alpha = 1.0;
        }

        level.overheat_flashing _meth_8086( 0.5 );
        level.overheat_flashing.alpha = 0.0;
        level.overheat_status.alpha = 1;
        wait 0.5;
        thread overheat_hud_drain();
        wait 2;
        level._id_781D = undefined;
    }
}

overheat_hud_update()
{
    level endon( "disable_overheat" );
    level notify( "stop_overheat_drain" );

    if ( level.turret_heat_status > 1 )
        level.overheat_status.alpha = 1;
    else
    {
        level.overheat_status.alpha = 0;
        level.overheat_status _meth_8086( 0.25 );
    }

    if ( isdefined( level.overheat_status2 ) && level.turret_heat_status > 1 )
    {
        var_0 = _func_0BC( level.turret_heat_status * level.overheat_hud_height_max / level.turret_heat_max );
        level.overheat_status2.alpha = 1;
        level.overheat_status2 _meth_80CE( "white", 10, _func_0BC( var_0 ) );
        level.overheat_status _meth_8087( 0.05, 10, _func_0BC( var_0 ) );
    }
    else
    {
        level.overheat_status2.alpha = 0;
        level.overheat_status2 _meth_8086( 0.25 );
    }

    overheat_setcolor( level.turret_heat_status );
    wait 0.05;

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2.alpha = 0;

    if ( isdefined( level.overheat_status ) && level.turret_heat_status < level.turret_heat_max )
        thread overheat_hud_drain();
}

overheat_setcolor( var_0, var_1 )
{
    level endon( "disable_overheat" );
    var_2 = [];
    var_2[0] = 1.0;
    var_2[1] = 0.9;
    var_2[2] = 0.0;
    var_3 = [];
    var_3[0] = 1.0;
    var_3[1] = 0.5;
    var_3[2] = 0.0;
    var_4 = [];
    var_4[0] = 0.9;
    var_4[1] = 0.16;
    var_4[2] = 0.0;
    var_5 = [];
    var_5[0] = var_2[0];
    var_5[1] = var_2[1];
    var_5[2] = var_2[2];
    var_6 = 0;
    var_7 = level.turret_heat_max / 2;
    var_8 = level.turret_heat_max;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = undefined;

    if ( var_0 > var_6 && var_0 <= var_7 )
    {
        var_9 = _func_0BC( var_0 * 100 / var_7 );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_3[var_12] - var_2[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_2[var_12] + var_11 * var_9;
        }
    }
    else if ( var_0 > var_7 && var_0 <= var_8 )
    {
        var_9 = _func_0BC( ( var_0 - var_7 ) * 100 / ( var_8 - var_7 ) );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_4[var_12] - var_3[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_3[var_12] + var_11 * var_9;
        }
    }

    if ( isdefined( var_1 ) )
        level.overheat_status _meth_8086( var_1 );

    if ( isdefined( level.overheat_status.color ) )
        level.overheat_status.color = ( var_5[0], var_5[1], var_5[2] );

    if ( isdefined( level.overheat_status2.color ) )
        level.overheat_status2.color = ( var_5[0], var_5[1], var_5[2] );
}

overheat_hud_drain()
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_0 = 1.0;

    for (;;)
    {
        if ( level.turret_heat_status > 1 )
            level.overheat_status.alpha = 1;

        var_1 = ( level.turret_heat_status - level.turret_cooldownrate ) * level.overheat_hud_height_max / level.turret_heat_max;
        thread overheat_status_rampdown( var_1, var_0 );

        if ( var_1 < 1 )
            var_1 = 1;

        overheat_setcolor( level.turret_heat_status, var_0 );
        wait(var_0);

        if ( isdefined( level.overheat_status ) && level.turret_heat_status <= 1 )
            level.overheat_status.alpha = 0;

        if ( isdefined( level.overheat_status2 ) && level.turret_heat_status <= 1 )
            level.overheat_status2.alpha = 0;
    }
}

overheat_status_rampdown( var_0, var_1 )
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_2 = 20 * var_1;
    var_3 = level.turret_heat_status - var_0;
    var_4 = var_3 / var_2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        level.turret_heat_status -= var_4;

        if ( level.turret_heat_status < 1 )
        {
            level.turret_heat_status = 1;
            return;
        }

        wait 0.05;
    }
}

seaknight()
{
    level.seaknight1 = _id_A5A8::_id_8979( "rescue_chopper" );
    level.seaknight1 _meth_80B3( "vehicle_ch46e_opened_door_interior_a" );
    var_0 = spawn( "script_model", level.seaknight1 _meth_8184( "body_animate_jnt" ) );
    var_0 _meth_80B3( "vehicle_ch46e_opened_door_interior_b" );
    var_0.angles = level.seaknight1.angles;
    var_0 _meth_804F( level.seaknight1, "body_animate_jnt" );
    var_1 = spawn( "script_model", level.seaknight1 _meth_8184( "body_animate_jnt" ) );
    var_1 _meth_80B3( "vehicle_ch46e_wires" );
    var_1.angles = level.seaknight1.angles;
    var_1 _meth_804F( level.seaknight1, "body_animate_jnt" );
    maps\_wibble::wibble_add_heli_to_track( level.seaknight1 );
    wait 0.05;
    var_2 = [];

    for ( var_3 = 0; var_3 < level.seaknight1._id_750A.size; var_3++ )
    {
        if ( level.seaknight1._id_750A[var_3].classname != "actor_ally_pilot_zach_woodland" )
            var_2[var_2.size] = level.seaknight1._id_750A[var_3];

        if ( level.seaknight1._id_750A[var_3].classname == "actor_ally_hero_mark_woodland" )
        {
            level.griggs = level.seaknight1._id_750A[var_3];
            level.griggs._id_0C72 = "griggs";
        }

        level.seaknight1._id_750A[var_3] common_scripts\utility::_id_4853( "seaknight_show_names" );
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] thread seaknightriders_standinplace();

    common_scripts\utility::_id_383F( "no_more_grenades" );
    var_4 = _func_0D9( "axis" );

    for ( var_3 = 0; var_3 < var_4.size; var_3++ )
        var_4[var_3]._id_01D0 = 0;

    common_scripts\utility::_id_384A( "open_bay_doors" );
    wait 11;
    var_5 = _func_1A5( level.seaknight1, 5000, 1500 );
    level.seaknight1._id_2D30 = 1;
    level.seaknight1 _meth_824F( 0, 0, 0 );
    level.seaknight1 _meth_814D( _id_A5A4::_id_3EF7( "ch46_doors_open" ), 1 );
    level.seaknight1 _meth_809C( "seaknight_door_open" );
    level._id_9C82["script_vehicle_ch46e"][1]._id_9CD5 = undefined;
    level._id_9C82["script_vehicle_ch46e"][2]._id_4068 = level._id_78AC["generic"]["ch46_unload_2"];
    level._id_9C82["script_vehicle_ch46e"][3]._id_4068 = level._id_78AC["generic"]["ch46_unload_3"];
    level.seaknight1 notify( "unload" );
    wait 0.5;
    level notify( "seaknight_show_names" );
    wait 4.0;
    level.playersafetyblocker delete();
    common_scripts\utility::_id_383F( "seaknight_can_be_boarded" );
    thread seaknight_griggs_speech();
    var_6 = 0;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_6++;
        var_2[var_3] thread vehicle_seaknight_idle_and_load_think( var_6 );
        var_2[var_3] thread seaknight_riders_erase();
    }

    thread seaknight_departure_sequence();
    common_scripts\utility::_id_384A( "player_made_it" );

    if ( _func_1A1( level._id_0318 ) )
    {
        level._id_0318 _meth_80F1();
        level._id_0318.attackeraccuracy = 0;
        _id_A5A4::enable_scuff_footsteps_sound( 0 );
    }

    createthreatbiasgroup( "sas_evac_guy" );
    wait 0.25;
    var_7 = getent( "redshirt1", "targetname" );
    var_7 thread seaknight_sas_load();
    level.sasseaknightboarded++;
    var_8 = getent( "redshirt2", "targetname" );
    var_8 thread seaknight_sas_load();
    level.sasseaknightboarded++;
    level.sasgunner thread seaknight_sas_load();
    level.sasseaknightboarded++;
    level._id_6F7C thread seaknight_sas_load();
    level.sasseaknightboarded++;

    while ( level.sasseaknightboarded > 0 )
        wait 0.1;

    common_scripts\utility::_id_383F( "all_real_friendlies_on_board" );
    common_scripts\utility::_id_383F( "seaknight_guards_boarding" );
    level._id_0318 _id_A5A4::_id_69C4( "scn_vd_seaknight_leaving" );
}

seaknight_departure_sequence()
{
    common_scripts\utility::_id_384A( "seaknight_guards_boarding" );
    wait 10;

    if ( !common_scripts\utility::_id_382E( "player_made_it" ) )
        wait 2;

    common_scripts\utility::_id_383F( "all_fake_friendlies_aboard" );

    if ( !common_scripts\utility::_id_382E( "player_made_it" ) )
        wait 5;

    if ( common_scripts\utility::_id_382E( "player_made_it" ) )
    {
        common_scripts\utility::_id_384A( "all_real_friendlies_on_board" );
        level._id_0318 _meth_809C( "villagedef_grg_wereallaboard" );
        wait 1;
    }
    else
    {
        common_scripts\utility::_id_383F( "seaknight_unboardable" );
        level.seaknight1 _meth_80C0( 0 );
    }

    common_scripts\utility::_id_383F( "outtahere" );
    wait 1.5;
    thread maps\village_defend::countdown_speech( "outtahere" );
}

seaknight_sas_load()
{
    self endon( "death" );
    _id_A5A4::_id_3100( "interval_trigger_seaknight" );
    self _meth_817B( "sas_evac_guy" );
    setignoremegroup( "axis", "sas_evac_guy" );
    self._id_01C4 = 60;
    self._id_2AF3 = 1;
    self._id_0201 = 1;
    self._id_01FB = 1;
    wait(_func_0B5( 1.5, 3.2 ));
    var_0 = _func_0C3( "seaknight_fakeramp_startpoint", "targetname" );
    self _meth_81A9( var_0 );
    self waittill( "goal" );
    self._id_02C1 = 1;

    if ( isdefined( var_0._id_0351 ) )
        self._id_01C4 = var_0._id_0351;

    var_1 = _func_0C3( "seaknight_fakeramp_end", "targetname" );
    self _meth_81A9( var_1 );
    self waittill( "goal" );
    level.sasseaknightboarded--;

    if ( isdefined( self._id_58D7 ) )
        _id_A5A4::_id_8EA4();

    self delete();
}

seaknight_griggs_speech()
{
    common_scripts\utility::_id_384A( "seaknight_can_be_boarded" );

    if ( !common_scripts\utility::_id_382E( "lz_reached" ) )
        common_scripts\utility::_id_384A( "lz_reached" );
    else
        wait 5.5;

    level.griggs _id_A510::_id_0C21( level.griggs, "needaride" );
    wait 0.45;
    level.griggs _id_A510::_id_0C21( level.griggs, "getonboard" );
    wait 2;
    level.griggs _id_A510::_id_0C21( level.griggs, "griggsletsgo" );
}

vehicle_seaknight_idle_and_load_think( var_0 )
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "seaknight_guards_boarding" );
    var_1 = "ch46_load_" + var_0;
    level.seaknight1 _id_A510::_id_0BC9( self, var_1, "tag_detach" );
    var_2 = getent( "seaknight_guards_loading_org_" + var_0, "targetname" );
    self _meth_81AA( var_2._id_02E2 );
    self._id_01C4 = 4;

    if ( !common_scripts\utility::_id_382E( "player_made_it" ) )
    {
        self waittill( "goal" );
        self _meth_804F( level.seaknight1, "tag_detach" );
    }

    common_scripts\utility::_id_384A( "player_made_it" );
    wait 1;

    if ( isdefined( self._id_58D7 ) )
        _id_A5A4::_id_8EA4();

    self delete();
}

seaknight_riders_erase()
{
    if ( isdefined( self._id_0C72 ) && self._id_0C72 == "griggs" )
        return;

    self endon( "death" );
    common_scripts\utility::_id_384A( "player_made_it" );
    wait 1;
    common_scripts\utility::_id_384A( "all_fake_friendlies_aboard" );

    if ( isdefined( self._id_58D7 ) )
        _id_A5A4::_id_8EA4();

    self delete();
}

_id_2856()
{
    self delete();
}

seaknightriders_standinplace()
{
    if ( !_func_0CF( self ) )
        return;

    self _meth_81CE( "crouch" );
    thread maps\village_defend::hero();
    self waittill( "jumpedout" );
    self _meth_81CE( "crouch" );
    waitframe;
    self _meth_81CE( "crouch" );
    self._id_01C4 = 4;
    self _meth_81A7( 1 );
    self._id_034C = 0;
    self _meth_81AA( self._id_02E2 );
    self._id_01D1 = 0;
    self._id_01D0 = 0;
    self._id_0201 = 1;
}

friendly_pushplayer( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = _func_0D9( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == "on" )
        {
            var_1[var_2] _meth_81A7( 1 );
            var_1[var_2]._id_0130 = 1;
            var_1[var_2]._id_034C = 0;
            continue;
        }

        var_1[var_2] _meth_81A7( 0 );
        var_1[var_2]._id_0130 = 0;
        var_1[var_2]._id_034C = 1;
    }
}

can_display_pvt_parity_name()
{
    var_0 = 400;

    if ( _func_0F0( level._id_0318._id_02E2, self._id_02E2 ) > var_0 * var_0 )
        return 0;

    var_1 = level._id_0318 _meth_80AA() + 2000 * anglestoforward( level._id_0318 _meth_8338() );
    var_2 = _func_06B( level._id_0318 _meth_80AA(), var_1, 0, level._id_0318 );

    if ( isdefined( var_2["surfacetype"] ) && _func_120( var_2["surfacetype"], "water" ) )
    {
        var_3 = var_2["position"] + 2 * _func_114( anglestoforward( level._id_0318 _meth_8338() ) );
        var_2 = _func_06B( var_3, var_1, 0, level._id_0318 );
    }

    return isdefined( var_2["entity"] ) && var_2["entity"] == self;
}

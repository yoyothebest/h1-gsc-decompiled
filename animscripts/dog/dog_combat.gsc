// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self endon( "killanimscript" );

    if ( !_func_1A1( self._id_0142 ) )
        _id_20AC();
    else
    {
        if ( _func_1AD( self._id_0142 ) )
        {
            _id_5B81();
            return;
        }

        _id_5B92();
    }
}

_id_5374()
{
    self endon( "pvd_melee_interrupted" );

    if ( !isdefined( self._id_5B8B._id_6C50 ) )
        return;

    var_0 = self._id_5B8B._id_6C50;

    if ( isdefined( var_0._id_6B7D ) )
        return;

    var_0._id_6B7D = 1;

    if ( _id_A5A4::_id_536C( self._id_5B8B ) )
    {
        _id_53C0( self._id_5B8B, self );
        return;
    }

    self._id_5B8B._id_8A2B = 1;
    self._id_5B8B _meth_82BC( 1 );
    playfxontag( level._id_058F["dog_bite_blood"], var_0, "tag_torso" );
    wait 1;

    if ( !isdefined( self ) || !isdefined( self._id_5B8B ) )
        return;

    var_1 = _id_503A();
    self._id_5B8B _meth_8134( 0 );

    if ( !_func_1A1( self._id_5B8B ) )
        return;

    self._id_5B8B _id_2CB5( self );
    self._id_5B8B _meth_8186( "default", 5 );
    waitframe;
    setdvar( "ui_deadquote", "" );
    thread _id_2C97( self._id_5B8B, var_1 );
}
#using_animtree("dog");

_id_53C0( var_0, var_1 )
{
    var_0._id_2C9D = 1;
    var_2 = _id_2CBB();
    self _meth_810F( "meleeanim", %german_shepherd_player_getoff, 1, 0.1, var_2 );
    var_0._id_6C50 notify( "pvd_melee_interrupted" );
    var_0._id_6C50 notify( "pvd_melee_done" );
    var_0._id_6C50 _id_6D7B( var_0 );

    if ( !_id_A5A4::_id_536C( var_0 ) )
        var_0 _id_2CB5( var_1 );
}

_id_2CB5( var_0 )
{
    if ( _id_A5A4::_id_55E1() )
        self _meth_80EE( 0 );

    self _meth_80F2();

    if ( _func_1A1( var_0 ) )
        self _meth_8054( self._id_02E2, var_0 );
    else
        self _meth_8054( self._id_02E2 );
}

_id_2C97( var_0, var_1 )
{
    if ( _id_A5A4::_id_5083() )
        return;

    wait 1.5;
    thread _id_2C9A( var_0 );
    var_2 = _func_1AA( var_0 );
    var_2._id_0530 = 0;
    var_2._id_0538 = 15;

    if ( var_1 )
        var_2 _meth_80CE( "hud_hyena_melee", 50, 50 );
    else
        var_2 _meth_80CE( "hud_dog_melee", 50, 50 );

    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2._id_01F3 = "center";
    var_2._id_0501 = "middle";
    var_2._id_0198 = 1;
    var_2.alpha = 0;
    var_2 _meth_8086( 1 );
    var_2.alpha = 1;
}

_id_2C9A( var_0 )
{
    var_1 = var_0 _id_A546::_id_23ED( "default", 1 );
    var_1.color = ( 1, 1, 1 );
    var_1 _meth_80CC( level._id_2C98 );
    var_1._id_0530 = 0;
    var_1._id_0538 = -30;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1._id_01F3 = "center";
    var_1._id_0501 = "middle";
    var_1._id_0198 = 1;
    var_1.alpha = 0;
    var_1 _meth_8086( 1 );
    var_1.alpha = 1;
}

_id_0E43()
{
    self _meth_8144( %root, 0.1 );
    var_0 = %german_shepherd_attack_player_miss_b;

    if ( isdefined( self._id_0142 ) )
    {
        var_1 = anglestoforward( ( 0, self._id_0116, 0 ) );
        var_2 = _func_114( self._id_0142._id_02E2 - self._id_02E2 );
        var_3 = self._id_0142._id_02E2 - self._id_02E2 + var_1 * 40;

        if ( _func_0F6( var_2, var_1 ) > 0.707 || _func_0F6( var_3, var_1 ) > 0 )
            thread animscripts\dog\dog_stop::_id_585C( "normal" );
        else
        {
            self._id_85C3 = 1;
            thread _id_0E44();

            if ( var_2[0] * var_1[1] - var_2[1] * var_1[0] > 0 )
                var_0 = %german_shepherd_attack_player_miss_turnr;
            else
                var_0 = %german_shepherd_attack_player_miss_turnl;
        }
    }

    self _meth_8115( "miss_anim", var_0, 1, 0, 1 );
    var_4 = getanimlength( var_0 );
    animscripts\notetracks::_id_2D0B( var_4 - 0.1, "miss_anim" );
    self notify( "stop tracking" );
}

_id_0E44()
{
    self endon( "killanimscript" );
    wait 0.6;
    self _meth_8193( "face enemy" );
}

_id_53C3( var_0 )
{
    var_0 endon( "death" );
    var_0 _meth_82FD( 0 );
    wait 0.75;
    var_0 _meth_82FD( 1 );
}

_id_2CD3()
{
    if ( isdefined( self._id_5B8B ) )
    {
        if ( isdefined( self._id_5B8B._id_9C29 ) && self._id_5B8B._id_9C29 )
            self._id_5B8B notify( "force_out_of_uav" );

        if ( self._id_5B8B _meth_806A() && common_scripts\utility::_id_3839( "price_picked_up" ) && !common_scripts\utility::_id_382E( "price_picked_up" ) )
            return undefined;

        if ( self._id_5B8B _meth_82DD() )
            return undefined;

        if ( self._id_5B8B._id_0249 && self._id_5B8B._id_01FF )
            return undefined;
    }

    if ( isdefined( self._id_0142 ) )
    {
        if ( _func_0EF( self._id_02E2, self._id_0142._id_02E2 ) < 32 )
            return self _meth_81EC();
    }

    return self _meth_81EC( anglestoforward( self.angles ) );
}

_id_4666( var_0 )
{
    switch ( var_0 )
    {
        case "dog_melee":
            var_1 = _id_2CD3();

            if ( isdefined( var_1 ) )
            {
                if ( _func_1AD( var_1 ) )
                {
                    if ( getdvarint( "survival_chaos" ) != 1 )
                    {
                        var_1 _meth_8186( "dog_bite", 1 );
                        thread _id_53C3( var_1 );
                    }
                }
            }
            else
            {
                _id_0E43();
                return 1;
            }

            break;
        case "stop_tracking":
            self _meth_8193( "face current" );
            break;
    }
}

_id_082A()
{
    var_0 = self._id_5B8B _meth_807D();

    if ( var_0 == 0 )
        return 0;

    if ( var_0 < 0.25 )
    {
        self._id_5B8B _meth_8052( var_0 + 0.25 );
        return 1;
    }

    return 0;
}

_id_73D7()
{
    var_0 = self._id_5B8B _meth_807D();

    if ( var_0 > 0.25 )
        self._id_5B8B _meth_8052( var_0 - 0.25 );
    else
        self._id_5B8B _meth_8052( 0.01 );
}

_id_4668( var_0 )
{
    switch ( var_0 )
    {
        case "dog_melee":
            var_1 = _id_082A();
            var_2 = _id_2CD3();

            if ( isdefined( var_2 ) && _func_1AD( var_2 ) && _func_1A1( self._id_5B8B ) )
            {
                if ( var_1 )
                    _id_73D7();

                self._id_85C3 = undefined;
                self._id_5B8B._id_6C50 = _id_6D82( self );

                if ( self._id_5B8B._id_6C50 _id_6D83( self ) )
                    self _meth_82BC( 0 );
            }
            else
            {
                if ( var_1 )
                    _id_73D7();

                _id_0E43();
                return 1;
            }

            break;
        case "dog_early":
            self notify( "dog_early_notetrack" );
            thread show_prepare_dog_hint_h1();
            thread destroy_dog_hint_on_dog_death_h1();
            var_3 = 0.45 + 0.8 * level._id_2CB0[level._id_2CAF];
            var_3 *= _id_2CBB();
            level._id_2CAF++;

            if ( level._id_2CAF >= level._id_2CB0.size )
            {
                level._id_2CAF = 0;
                level._id_2CB0 = common_scripts\utility::_id_0CF5( level._id_2CB0 );
            }

            self _meth_8114( "meleeanim", %german_shepherd_attack_player, 1, 0.2, var_3 );
            self _meth_8114( "meleeanim", %german_shepherd_attack_player_late, 1, 0.2, var_3 );
            self._id_5B8B._id_6C50 _id_6D7F( var_3 );
            break;
        case "dog_lunge":
            thread _id_7E7C();
            var_3 = _id_2CBB();
            self _meth_8113( "meleeanim", %german_shepherd_attack_player, 1, 0.2, var_3 );
            self._id_5B8B._id_6C50 _id_6D7E( var_3 );
            break;
        case "dogbite_damage":
            thread _id_5374();
            break;
        case "stop_tracking":
            self _meth_8193( "face current" );
            break;
    }
}

destroy_dog_hint_on_dog_death_h1()
{
    self waittill( "death" );
    destroy_dog_hint();
}

_id_4555( var_0 )
{
    switch ( var_0 )
    {
        case "dogbite_damage":
            thread _id_5374();
            break;
    }
}

_id_7E7C()
{
    wait 0.1;
    self.press_time = self._id_5B8B._id_4441._id_2CB6 / _id_2CBB();
    thread dog_hint_h1();
    self._id_5B37 = gettime();
}

_id_6C8F()
{
    self._id_5596 = 0;
    self._id_2CD5 = 0;
}

_id_5B81()
{
    thread _id_A5A4::_id_69C4( "anml_dog_attack_jump" );
    self._id_5B8B = self._id_0142;

    if ( !isdefined( self._id_5B8B._id_2CCF ) )
        self._id_5B8B _id_6C8F();

    var_0 = 30;
    var_1 = self._id_0278 + var_0;

    for (;;)
    {
        if ( !_func_1A1( self._id_0142 ) )
            break;

        if ( !_func_1AD( self._id_0142 ) )
            break;

        if ( _id_A5A4::_id_5062( self._id_0142 ) )
        {
            _id_20AC();
            continue;
        }

        if ( isdefined( self._id_5B8B._id_0426 ) && self._id_5B8B._id_0426 != self || isdefined( self._id_5B8B._id_6C50 ) && isdefined( self._id_5B8B._id_6C50._id_4E82 ) )
        {
            if ( _id_1CFC( var_1 ) )
                break;
            else
            {
                _id_20AC();
                continue;
            }
        }

        if ( _id_84BC() )
        {
            _id_20AC();
            continue;
        }

        self _meth_8193( "face enemy" );
        self _meth_8192( "zonly_physics" );
        self._id_0388 = 0;
        _id_6F19();
        self _meth_8144( %root, 0.1 );
        self _meth_81FF();
        self._id_5B8B _id_7FBD( 500 );

        if ( _id_2C92() )
        {
            self._id_5B8B._id_5596 = gettime();
            self._id_5B8B._id_2CD5++;
            self _meth_8115( "meleeanim", %german_shepherd_run_attack_b, 1, 0.2, 1 );
            animscripts\shared::_id_2D06( "meleeanim", ::_id_4666 );
        }
        else
        {
            thread _id_2CAE();
            self._id_5B8B._id_0E28 = 1;
            self._id_5B8B._id_0249 = 0;
            self._id_5B8B._id_06DD = undefined;
            thread _id_1ECC();
            self _meth_8115( "meleeanim", %german_shepherd_attack_player, 1, 0.2, 1 );
            self _meth_8115( "meleeanim", %german_shepherd_attack_player_late, 1, 0, 1 );
            self _meth_814E( %attack_player, 1, 0, 1 );
            self _meth_814E( %attack_player_late, 0.01, 0, 1 );
            animscripts\shared::_id_2D06( "meleeanim", ::_id_4668 );
            self notify( "dog_no_longer_melee_able" );
            self _meth_82BC( 1 );
            self _meth_8051();
        }

        self._id_0388 = 1;
        wait 0.05;

        if ( _id_1CFC( var_1 ) )
            break;
    }

    self._id_0388 = 1;
    self _meth_8192( "none" );
}

_id_1ECC()
{
    self waittill( "death" );
    self._id_5B8B._id_0E28 = undefined;
}

_id_2C92()
{
    if ( isdefined( self._id_5B8B._id_2CD9 ) )
        return 1;

    if ( getdvarint( "survival_chaos" ) == 1 )
        return 1;

    if ( _id_A5A4::_id_5062( self._id_5B8B ) )
        return 1;

    if ( isdefined( self._id_5B8B._id_8626 ) )
        return 1;

    if ( gettime() - self._id_5B8B._id_5596 > 8000 )
        self._id_5B8B._id_2CD5 = 0;

    return self._id_5B8B._id_2CD5 < self._id_5B8B._id_4441._id_2CA7 && self._id_5B8B._id_01E6 > 25;
}

_id_84BC()
{
    return isdefined( self._id_0142._id_2CC2 ) && gettime() < self._id_0142._id_2CC2;
}

_id_7FBD( var_0 )
{
    self._id_2CC2 = gettime() + var_0;
}

_id_5B92()
{
    if ( !_func_1A1( self._id_0142 ) )
        return;

    self._id_0142 notify( "dog_attacks_ai" );

    if ( isdefined( self._id_0142._id_0426 ) || _id_84BC() || !_func_0CF( self._id_0142 ) || isdefined( self._id_0142._id_51DA ) )
        _id_20AC();
    else
    {
        self._id_0142 _id_7FBD( 500 );
        self._id_0388 = 0;
        self _meth_8192( "zonly_physics" );
        self._id_034C = 0;
        self _meth_81FF();
        self._id_5B8C = !isdefined( self._id_0142._id_58D7 ) && ( isdefined( self._id_0142.a._id_2CE7 ) || isdefined( self._id_5B7F ) || _func_0B2( 100 ) > 50 );
        var_0 = [];
        var_1[0] = %root;
        var_1[1] = %german_shepherd_attack_ai_01_start_a;
        var_1[2] = %german_shepherd_attack_ai_02_idle_a;

        if ( self._id_5B8C )
        {
            var_1[3] = %german_shepherd_attack_ai_03_pushed_a;
            var_1[4] = %german_shepherd_attack_ai_04_middle_a;
            var_1[5] = %german_shepherd_attack_ai_05_kill_a;
            var_2 = 5;
        }
        else
        {
            var_1[3] = %german_shepherd_attack_ai_03_shot_a;
            var_2 = 3;
        }

        var_3 = _func_115( self._id_02E2 - self._id_0142._id_02E2 );
        var_3 = ( 0, var_3[1], 0 );
        self._id_65A6 = self._id_0142;
        self _meth_82BC( 0 );
        self _meth_8144( var_1[0], 0.1 );
        self _meth_8142( "meleeanim", self._id_0142._id_02E2, var_3, var_1[1] );
        animscripts\shared::_id_2D06( "meleeanim", ::_id_4680 );
        self _meth_82BC( 1 );
        self _meth_8192( "zonly_physics" );

        for ( var_4 = 1; var_4 < var_2; var_4++ )
        {
            self _meth_8144( var_1[var_4], 0 );

            if ( !_id_4E92() )
                break;

            if ( !self._id_5B8C && var_4 + 1 == var_2 )
                self._id_01E6 = 1;

            self _meth_8115( "meleeanim", var_1[var_4 + 1], 1, 0, 1 );
            animscripts\shared::_id_2D06( "meleeanim" );
        }

        self _meth_8051();

        if ( !self._id_5B8C )
        {
            self _meth_8054();
            return;
        }

        self._id_034C = 1;
        self._id_0388 = 1;
        self._id_38A8 = 0;
    }
}

_id_20AC()
{
    self _meth_8193( "face enemy" );
    self _meth_8144( %root, 0.1 );
    self _meth_8192( "zonly_physics" );
    var_0 = [];
    var_0[0] = %german_shepherd_attackidle_b;
    var_0[1] = %german_shepherd_attackidle_bark;
    var_0[2] = %german_shepherd_attackidle_growl;
    var_1 = common_scripts\utility::_id_710E( var_0 );
    thread _id_20AD();
    self _meth_8115( "combat_idle", var_1, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "combat_idle" );
    self notify( "combatIdleEnd" );
}

_id_20AD()
{
    self endon( "killanimscript" );
    self endon( "combatIdleEnd" );

    for (;;)
    {
        wait 0.1;
        var_0 = getentarray( "player", "classname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1];

            if ( !isdefined( var_2._id_0426 ) || var_2._id_0426 == self )
                continue;

            var_3 = var_2._id_02E2 - self._id_02E2;

            if ( var_3[2] * var_3[2] > 6400 )
                continue;

            var_3 = ( var_3[0], var_3[1], 0 );
            var_4 = _func_0F1( var_3 );

            if ( var_4 < 1 )
                var_3 = anglestoforward( self.angles );

            if ( var_4 < 30 )
            {
                var_3 *= 3 / var_4;
                self _meth_81CB( self._id_02E2 - var_3, ( 0, 30, 0 ) );
            }
        }
    }
}

_id_4E92()
{
    return isdefined( self._id_0142 ) && isdefined( self._id_0142._id_0426 ) && self._id_0142._id_0426 == self;
}

_id_4680( var_0 )
{
    if ( var_0 != "ai_attack_start" )
        return 0;

    if ( !isdefined( self._id_0142 ) )
        return 1;

    if ( self._id_0142 != self._id_65A6 )
        return 1;

    if ( isdefined( self._id_0142._id_0426 ) )
        return 1;

    self._id_38A8 = 1;
    self._id_0142._id_0426 = self;
    self._id_0142 _meth_819E( ::_id_5B97 );
}

_id_1CFC( var_0 )
{
    if ( !isdefined( self._id_0142 ) )
        return 0;

    var_1 = _func_0F0( self._id_02E2, self._id_0142._id_02E2 );
    return var_1 > var_0 * var_0;
}

_id_6F19()
{
    if ( _id_503A() )
    {
        level._id_2C98 = &"NEW_HYENA_DEATH_DO_NOTHING_ALT";
        level._id_8857 = "@NEW_HYENA_DEATH_DO_NOTHING_ALT";
    }
    else
    {
        level._id_2C98 = &"NEW_DOG_DEATH_DO_NOTHING_ALT";
        level._id_8857 = "@NEW_DOG_DEATH_DO_NOTHING_ALT";
    }

    level._id_2C99 = "nothing";
    var_0 = _func_0EE( self._id_02E2, self._id_0142._id_02E2 );

    if ( var_0 > self._id_0278 )
    {
        var_1 = self._id_0142._id_02E2 - self._id_02E2;
        var_2 = ( var_0 - self._id_0278 ) / var_0;
        var_1 = ( var_1[0] * var_2, var_1[1] * var_2, var_1[2] * var_2 );
        thread _id_0E4C( var_1 );
    }
}

_id_0E4C( var_0 )
{
    self endon( "death" );
    self endon( "killanimscript" );
    var_1 = 5;
    var_2 = ( var_0[0] / var_1, var_0[1] / var_1, var_0[2] / var_1 );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self _meth_81C9( self._id_02E2 + var_2 );
        wait 0.05;
    }
}

_id_6A62()
{
    return _func_1A1( self._id_5B8B ) && self._id_5B8B _meth_833C();
}

destroy_dog_hint()
{
    if ( !isdefined( self._id_5B8B._id_2CCE ) )
        return;

    self._id_5B8B._id_2CCE _id_A546::_id_28E9();

    if ( isdefined( self._id_5B8B.doghintbackerblur ) )
    {
        self._id_5B8B.doghintbackerblur _id_A546::_id_28E9();
        self._id_5B8B.doghintbackerbordertop _id_A546::_id_28E9();
        self._id_5B8B.doghintbackerborderbottom _id_A546::_id_28E9();
    }
    else
        self._id_5B8B.doghintstar _id_A546::_id_28E9();

    level notify( "clearing_dog_hint" );
}

show_prepare_dog_hint_h1()
{
    if ( isdefined( self._id_5B8B._id_2CCE ) )
        destroy_dog_hint();

    if ( level._id_0318 common_scripts\utility::_id_5064() )
    {
        var_0 = 1.5;

        if ( level._id_2153 )
        {
            var_1 = _func_0E0( "+melee" );

            if ( var_1["count"] == 0 )
                var_1 = _func_0E0( "+melee_breath" );

            if ( var_1["count"] == 0 )
                var_1 = _func_0E0( "+melee_zoom" );

            foreach ( var_4, var_3 in var_1 )
            {
                if ( var_4 == "count" )
                    continue;

                if ( var_3 == &"KEY_BUTTON_RSTICK" || var_3 == &"KEY_BUTTON_LSTICK" )
                {
                    var_0 = 1.15;
                    break;
                }
            }
        }

        self._id_5B8B._id_2CCE = self._id_5B8B _id_A546::_id_23ED( "timer", var_0 );
        self._id_5B8B._id_2CCE.color = ( 1, 1, 1 );
        self._id_5B8B._id_2CCE _meth_80CC( &"SCRIPT_PLATFORM_DOG_HINT" );
        self._id_5B8B._id_2CCE._id_0530 = 0;
        self._id_5B8B._id_2CCE._id_0538 = 20;
        self._id_5B8B._id_2CCE.alignx = "center";
        self._id_5B8B._id_2CCE.aligny = "middle";
        self._id_5B8B._id_2CCE._id_01F3 = "center";
        self._id_5B8B._id_2CCE._id_0501 = "middle";
        self._id_5B8B._id_2CCE._id_0198 = 1;
        self._id_5B8B._id_2CCE.alpha = 0.1;
        self._id_5B8B._id_2CCE._id_03D4 = -1;
        self._id_5B8B.doghintstar = _id_A546::_id_2420( "h1_dog_melee_prompt_star", 0, 0 );
        self._id_5B8B.doghintstar.color = ( 1, 1, 1 );
        self._id_5B8B.doghintstar._id_0530 = 0;
        self._id_5B8B.doghintstar._id_0538 = 20;
        self._id_5B8B.doghintstar.alignx = "center";
        self._id_5B8B.doghintstar.aligny = "middle";
        self._id_5B8B.doghintstar._id_01F3 = "center";
        self._id_5B8B.doghintstar._id_0501 = "middle";
        self._id_5B8B.doghintstar._id_0198 = 1;
        self._id_5B8B.doghintstar.alpha = 0;
        self._id_5B8B.doghintstar._id_03D4 = -2;
    }
    else
    {
        self._id_5B8B._id_2CCE = self._id_5B8B _id_A546::_id_23ED( "timer", 0.5 );
        self._id_5B8B._id_2CCE.color = ( 1, 1, 1 );
        self._id_5B8B._id_2CCE _meth_80CC( &"SCRIPT_PLATFORM_DOG_HINT_KEYBOARD" );
        self._id_5B8B._id_2CCE._id_0530 = 0;
        self._id_5B8B._id_2CCE._id_0538 = 20;
        self._id_5B8B._id_2CCE._id_0188 = "timer";
        self._id_5B8B._id_2CCE.alignx = "center";
        self._id_5B8B._id_2CCE.aligny = "middle";
        self._id_5B8B._id_2CCE._id_01F3 = "center";
        self._id_5B8B._id_2CCE._id_0501 = "middle";
        self._id_5B8B._id_2CCE._id_0198 = 1;
        self._id_5B8B._id_2CCE.alpha = 0.25;
        self._id_5B8B._id_2CCE._id_03D4 = -1;
        self._id_5B8B.doghintbackerblur = _id_A546::_id_2420( "h1_hud_tutorial_blur", 225, 20 );
        self._id_5B8B.doghintbackerbordertop = _id_A546::_id_2420( "h1_hud_tutorial_border", 225, 1 );
        self._id_5B8B.doghintbackerborderbottom = _id_A546::_id_2420( "h1_hud_tutorial_border", 225, 1 );
        self._id_5B8B.doghintbackerblur._id_0530 = 0;
        self._id_5B8B.doghintbackerblur._id_0538 = 20;
        self._id_5B8B.doghintbackerblur._id_03D4 = -3;
        self._id_5B8B.doghintbackerblur.alignx = "center";
        self._id_5B8B.doghintbackerblur.aligny = "middle";
        self._id_5B8B.doghintbackerblur._id_01F3 = "center";
        self._id_5B8B.doghintbackerblur._id_0501 = "middle";
        self._id_5B8B.doghintbackerblur._id_0198 = 1;
        self._id_5B8B.doghintbackerblur._id_01ED = 1;
        self._id_5B8B.doghintbackerblur.alpha = 0.225;
        self._id_5B8B.doghintbackerbordertop._id_0530 = 0;
        self._id_5B8B.doghintbackerbordertop._id_0538 = 10;
        self._id_5B8B.doghintbackerbordertop._id_03D4 = -2;
        self._id_5B8B.doghintbackerbordertop.alignx = "center";
        self._id_5B8B.doghintbackerbordertop.aligny = "middle";
        self._id_5B8B.doghintbackerbordertop._id_01F3 = "center";
        self._id_5B8B.doghintbackerbordertop._id_0501 = "middle";
        self._id_5B8B.doghintbackerbordertop._id_0198 = 1;
        self._id_5B8B.doghintbackerbordertop._id_01ED = 1;
        self._id_5B8B.doghintbackerbordertop.alpha = 0.0125;
        self._id_5B8B.doghintbackerborderbottom._id_0530 = 0;
        self._id_5B8B.doghintbackerborderbottom._id_0538 = 30;
        self._id_5B8B.doghintbackerborderbottom._id_03D4 = -2;
        self._id_5B8B.doghintbackerborderbottom.alignx = "center";
        self._id_5B8B.doghintbackerborderbottom.aligny = "middle";
        self._id_5B8B.doghintbackerborderbottom._id_01F3 = "center";
        self._id_5B8B.doghintbackerborderbottom._id_0501 = "middle";
        self._id_5B8B.doghintbackerborderbottom._id_0198 = 1;
        self._id_5B8B.doghintbackerborderbottom._id_01ED = 1;
        self._id_5B8B.doghintbackerborderbottom.alpha = 0.0125;
    }

    maps\_cheat::melonhead_remove_melon( 1, 1 );
}

dog_hint_h1()
{
    if ( !isdefined( self._id_5B8B._id_2CCE ) )
        return;

    level endon( "clearing_dog_hint" );
    thread dog_hint_succeed_effect();
    self._id_5B8B._id_2CCE.alpha = 1;
    var_0 = self.press_time / 1000;

    if ( isdefined( self._id_5B8B.doghintstar ) )
    {
        var_1 = self._id_5B8B.doghintstar;
        var_2 = 0.11;
        var_3 = 64;
        var_4 = 64;

        for ( var_0 -= 0.05; var_0 >= var_2; var_0 -= 0.05 )
        {
            var_1.alpha = 0.75;
            var_1 _meth_8087( var_2, var_3, var_4 );
            wait 0.05;
            var_0 -= 0.05;
            var_1 _meth_8086( var_2 * 0.5 );
            var_1.alpha = 0;
            wait(var_2);
            var_0 -= var_2;
            var_1 _meth_8087( 0.05, 0, 0 );
            wait 0.05;
        }
    }
    else
    {
        self._id_5B8B.doghintbackerborderbottom.alpha = 0.05;
        self._id_5B8B.doghintbackerbordertop.alpha = 0.05;
        self._id_5B8B.doghintbackerblur.alpha = 0.9;
        wait(var_0);
    }

    if ( !_id_A5A4::_id_32D8( "neck_snapped" ) )
        thread dog_hint_fail_effect();
}

dog_hint_succeed_effect()
{
    level endon( "clearing_dog_hint" );
    _id_A5A4::_id_32E0( "neck_snapped" );

    if ( !isdefined( self ) )
        return;

    destroy_dog_hint();
}

dog_hint_fail_effect()
{
    self endon( "neck_snapped" );
    level endon( "clearing_dog_hint" );

    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self._id_5B8B._id_2CCE ) )
        return;

    if ( isdefined( self._id_5B8B.doghintbackerblur ) )
    {
        var_0 = 1.0;
        self._id_5B8B._id_2CCE _meth_80CC( &"SCRIPT_PLATFORM_DOG_HINT_KEYBOARD_FAIL" );
        wait 0.05;
        self._id_5B8B._id_2CCE _meth_8086( var_0 );
        self._id_5B8B.doghintbackerblur _meth_8086( var_0 );
        self._id_5B8B.doghintbackerbordertop _meth_8086( var_0 );
        self._id_5B8B.doghintbackerborderbottom _meth_8086( var_0 );
        self._id_5B8B._id_2CCE.alpha = 0;
        self._id_5B8B.doghintbackerblur.alpha = 0;
        self._id_5B8B.doghintbackerbordertop.alpha = 0;
        self._id_5B8B.doghintbackerborderbottom.alpha = 0;
        wait(var_0);
        destroy_dog_hint();
    }
    else
    {
        self._id_5B8B.doghintstar.alpha = 0;
        wait 0.05;
        var_0 = 0.25;
        self._id_5B8B._id_2CCE _meth_8086( var_0 );
        self._id_5B8B._id_2CCE.alpha = 0;
        wait(var_0);
        destroy_dog_hint();
    }
}

_id_2C9C()
{
    wait 0.7;

    if ( isdefined( self ) )
        self _meth_8051();
}

_id_2C9B()
{
    self endon( "death" );
    wait 1.5;

    if ( isdefined( self ) )
        self _meth_82BC( 1 );
}

_id_2CAE()
{
    self endon( "killanimscript" );
    self endon( "dog_no_longer_melee_able" );

    if ( !_id_A5A4::_id_32DC( "neck_snapped" ) )
        _id_A5A4::_id_32DD( "neck_snapped" );

    var_0 = 0;
    self waittill( "dog_early_notetrack" );

    while ( _id_6A62() )
        wait 0.05;

    var_1 = 0;

    for (;;)
    {
        if ( !var_0 )
        {
            if ( _id_6A62() )
            {
                var_0 = 1;

                if ( isdefined( self._id_5B37 ) && _func_1A1( self._id_5B8B ) )
                {
                    if ( gettime() - self._id_5B37 <= self.press_time )
                    {
                        self._id_5B8B _id_7E7B( var_1 );
                        self._id_5B8B._id_6C50._id_607A = 1;
                        _id_A5A4::_id_32DE( "neck_snapped" );
                        self notify( "melee_stop" );
                        self _meth_810F( "dog_death_anim", %german_shepherd_player_neck_snap, 1, 0.2, 1 );
                        thread _id_2C9B();
                        self _meth_82BC( 0 );
                        _id_A5A4::_id_41DD( "DOWN_BOY_DOWN" );
                        self waittillmatch( "dog_death_anim", "dog_death" );
                        thread common_scripts\utility::_id_69C2( "dog_neckbreak", self _meth_80AA() );
                        self _meth_82BC( 1 );
                        self.a._id_612E = 1;
                        self._id_2CB2 = 1;
                        var_2 = self._id_5B8B._id_02E2 - self._id_02E2;
                        var_2 = ( var_2[0], var_2[1], 0 );
                        _id_A5A4::arcademode_kill( self._id_02E2, "melee", 50 );
                        thread _id_2C9C();
                        self _meth_8054( self _meth_80AA() - var_2, self._id_5B8B );
                        self notify( "killanimscript" );
                    }
                    else
                    {
                        self._id_5B8B _id_7E7B( var_1 );
                        self._id_5B8B._id_6C50 _id_6D7D();
                        self _meth_814E( %attack_player, 0.01, 0.2, 1 );
                        self _meth_814E( %attack_player_late, 1, 0.2, 1 );

                        if ( _id_503A() )
                        {
                            level._id_2C98 = &"NEW_HYENA_DEATH_TOO_LATE_ALT";
                            level._id_8857 = "@NEW_HYENA_DEATH_TOO_LATE_ALT";
                        }
                        else
                        {
                            level._id_2C98 = &"NEW_DOG_DEATH_TOO_LATE_ALT";
                            level._id_8857 = "@NEW_DOG_DEATH_TOO_LATE_ALT";
                        }

                        level._id_2C99 = "late";
                    }

                    return;
                }

                var_1 = 1;

                if ( self._id_5B8B _id_1A48() )
                {
                    if ( _id_503A() )
                    {
                        level._id_2C98 = &"NEW_HYENA_DEATH_TOO_SOON_ALT";
                        level._id_8857 = "@NEW_HYENA_DEATH_TOO_SOON_ALT";
                    }
                    else
                    {
                        level._id_2C98 = &"NEW_DOG_DEATH_TOO_SOON_ALT";
                        level._id_8857 = "@NEW_DOG_DEATH_TOO_SOON_ALT";
                    }

                    level._id_2C99 = "soon";
                    var_3 = _id_2CBB();
                    self _meth_810F( "meleeanim", %german_shepherd_player_neck_miss, 1, 0.2, var_3 );
                    self._id_5B8B._id_6C50 _id_6D80( var_3 );
                    return;
                }
            }
        }
        else if ( !_id_6A62() )
            var_0 = 0;

        wait 0.05;
    }
}

_id_1A48()
{
    if ( self._id_3BFE == 3 )
        return 1;

    if ( isdefined( self._id_2CD4 ) && self._id_2CD4 )
        return 1;

    return 0;
}

_id_7E7B( var_0 )
{
    if ( !var_0 )
        return;

    if ( level._id_3BFE > 1 && !isdefined( self._id_2CD4 ) )
        self._id_2CD4 = 1;
}
#using_animtree("generic_human");

_id_5B97()
{
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( "end_melee_struggle" );
    self endon( "end_melee_all" );

    if ( !isdefined( self._id_0426 ) )
        return;

    self _meth_8193( "face point", self._id_0426._id_02E2, 1 );
    self _meth_8192( "gravity" );
    self.a._id_6E5A = "stand";
    self.a._id_8A1A = "none";

    if ( animscripts\utility::_id_9C3A() )
        animscripts\shared::_id_6869( self._id_0340, "right" );

    var_0 = [];
    var_0[0] = %root;
    var_0[1] = %ai_attacked_german_shepherd_01_start_a;
    var_0[2] = %ai_attacked_german_shepherd_02_idle_a;

    if ( self._id_0426._id_5B8C )
    {
        var_0[3] = %ai_attacked_german_shepherd_03_push_a;
        var_0[4] = %ai_attacked_german_shepherd_04_middle_a;
        var_0[5] = %ai_attacked_german_shepherd_05_death_a;
        var_1 = 5;
    }
    else
    {
        var_0[3] = %ai_attacked_german_shepherd_03_shoot_a;
        var_1 = 3;
    }

    self._id_5B8F = 0;
    thread _id_5B9A();
    self _meth_8144( var_0[0], 0.1 );
    self _meth_8115( "aianim", var_0[1], 1, 0.1, 1 );
    wait 0.15;
    self._id_0426 _meth_804F( self, "tag_sync", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    self waittillmatch( "aianim", "end" );
    self._id_5B8F = 1;

    while ( self._id_5B8F < var_1 )
    {
        self _meth_8144( var_0[self._id_5B8F], 0 );
        self._id_5B8F++;

        if ( var_1 == 3 && self._id_5B8F == 3 )
            _id_7FBD( getanimlength( var_0[self._id_5B8F] ) * 1000 - 1000 );

        self _meth_8115( "aianim", var_0[self._id_5B8F], 1, 0, 1 );
        animscripts\shared::_id_2D06( "aianim" );

        if ( !isdefined( self._id_0426 ) || !_func_1A1( self._id_0426 ) )
        {
            if ( self._id_5B8F == 3 && var_1 == 5 )
            {
                var_0[4] = %ai_attacked_german_shepherd_04_getup_a;
                var_1 = 4;
            }
        }

        if ( self._id_5B8F == 5 )
        {
            if ( !isdefined( self._id_58D7 ) )
            {
                self.a._id_612E = 1;
                animscripts\shared::_id_2F6C();
                self _meth_8054();
            }
        }
    }

    _id_5B99();
}

_id_5B9A()
{
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( "end_melee_all" );
    var_0 = [];
    var_0[1] = %ai_attacked_german_shepherd_02_getup_a;
    var_0[2] = %ai_attacked_german_shepherd_02_getup_a;

    if ( self._id_0426._id_5B8C )
        var_0[4] = %ai_attacked_german_shepherd_04_getup_a;

    for (;;)
    {
        if ( !isdefined( self._id_0426 ) || !_func_1A1( self._id_0426 ) )
            break;

        wait 0.1;
    }

    if ( self._id_5B8F > 0 )
    {
        if ( !isdefined( var_0[self._id_5B8F] ) )
            return;

        self _meth_8144( %melee_dog, 0.1 );
        self _meth_8115( "getupanim", var_0[self._id_5B8F], 1, 0.1, 1 );
        animscripts\shared::_id_2D06( "getupanim" );
    }

    _id_5B99();
}

_id_5B99()
{
    self _meth_8193( "face default" );
    self._id_0426 = undefined;
    self._id_5B8F = undefined;
    self.allowpain = 1;
    _id_7FBD( 1000 );
    self notify( "end_melee_all" );
}
#using_animtree("player");

_id_6D82( var_0 )
{
    var_1 = spawn( "script_model", var_0._id_5B8B._id_02E2 );
    var_1.angles = var_0._id_5B8B.angles;
    var_1 _meth_80B3( level._id_6C51 );
    var_1 _meth_8117( #animtree );
    var_1 _meth_8056();
    var_1 _meth_855D();
    return var_1;
}

_id_466E( var_0 )
{
    switch ( var_0 )
    {
        case "allow_player_save":
            if ( isdefined( self._id_012C ) )
            {
                wait 1;
                self._id_012C _meth_82BC( 1 );
            }

            break;
        case "blood_pool":
            if ( !isdefined( self._id_012C._id_5B8B ) )
                break;

            if ( _id_A5A4::_id_536C( self._id_012C._id_5B8B ) )
                break;

            var_1 = self _meth_8184( "tag_torso" );
            var_2 = self _meth_8185( "tag_torso" );
            var_3 = anglestoforward( var_2 );
            var_4 = anglestoup( var_2 );
            var_5 = anglestoright( var_2 );
            var_1 = var_1 + var_3 * -8.5 + var_4 * 5 + var_5 * 0;
            playfx( level._id_058F["deathfx_bloodpool"], var_1, var_3, var_4 );
            break;
    }
}

_id_6D7C( var_0 )
{
    self endon( "pvd_melee_interrupted" );
    var_1 = var_0._id_5B8B;
    self._id_012C = var_0;
    thread _id_6D7A( var_1 );
    self _meth_8115( "viewanim", %player_view_dog_knockdown );
    self _meth_8115( "viewanim", %player_view_dog_knockdown_late );
    self _meth_814E( %knockdown, 1, 0, 1 );
    self _meth_814E( %knockdown_late, 0.01, 0, 1 );
    animscripts\shared::_id_2D06( "viewanim", ::_id_466E );
    self _meth_8094();
    self._id_012C = undefined;
    _id_6D7B( var_1 );
    self notify( "pvd_melee_done" );
}

_id_6D7A( var_0 )
{
    self endon( "pvd_melee_done" );
    self._id_012C common_scripts\utility::_id_A069( "death", "pain", "melee_stop" );

    if ( !isdefined( var_0._id_8A2B ) && _func_1A1( var_0 ) )
    {
        self notify( "pvd_melee_interrupted" );
        self._id_012C notify( "pvd_melee_interrupted" );
        _id_6D7B( var_0 );
    }
}

_id_6D83( var_0 )
{
    if ( isdefined( self._id_4E82 ) )
        return 0;

    var_1 = var_0._id_5B8B;

    if ( isdefined( var_1 ) && isdefined( var_1._id_686B ) )
        var_1 notify( "sentry_placement_canceled" );

    var_1 notify( "dog_attacks_player" );
    self._id_4E82 = 1;

    if ( _func_1A1( var_1 ) )
        var_1 _meth_80FC();

    var_1 _meth_8181( "stand" );
    var_1._id_0426 = var_0;
    var_1._id_6C50 _id_6D81( var_1 );
    var_2 = var_0._id_02E2 - var_1._id_02E2;
    self.angles = _func_115( var_2 );
    self.angles = ( 0, self.angles[1], 0 );
    self._id_8CFF = self.angles;
    var_3 = var_1._id_02E2;
    var_4 = var_1 _meth_813E( var_1._id_02E2 );

    if ( isdefined( var_4 ) )
        self._id_02E2 = var_4;
    else
        self._id_02E2 = var_1._id_02E2;

    thread _id_6D7C( var_0 );
    self _meth_8094();
    var_1 _meth_8081( self, "tag_player" );
    var_0 _meth_804F( self, "tag_sync", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_5 = self _meth_8185( "tag_sync" );
    var_0 _meth_8193( "face angle", var_5[1] );
    var_0 _meth_8193( "face default" );
    var_1 _meth_811A( 1 );
    var_1 _meth_811D( 0 );
    var_1 _meth_811B( 0 );
    var_1 _meth_811C( 0 );
    var_1 _meth_8326( 1 );
    var_1 _meth_82BC( 0 );
    return 1;
}

_id_7819( var_0 )
{
    wait 0.5;
    var_0 _meth_809C( "saved_from_dog" );
}

_id_6B2B()
{
    self endon( "death" );
    self _meth_847D();
    self _meth_831B();
}

_id_6D7B( var_0 )
{
    var_0 _meth_80FD();

    if ( _func_1A1( var_0 ) )
    {
        self _meth_8144( %player_view_dog_knockdown, 0.1 );

        if ( isdefined( self._id_607A ) )
            self _meth_8115( "viewanim", %player_view_dog_knockdown_neck_snap, 1, 0.2, 1 );
        else if ( isdefined( var_0._id_2C9D ) )
            self _meth_810F( "viewanim", %player_view_dog_knockdown_laststand, 1, 0.1, 1 );
        else
        {
            thread _id_7819( var_0 );
            self _meth_8115( "viewanim", %player_view_dog_knockdown_saved );
        }

        if ( !isdefined( var_0._id_2C9D ) )
        {
            var_0 _id_A5A4::_id_27EF( 2.5, ::_id_6B2B );
            animscripts\shared::_id_2D06( "viewanim" );
            var_0 notify( "player_saved_from_dog" );
        }
        else
        {
            animscripts\shared::_id_2D06( "viewanim" );
            var_0 notify( "deathshield", 1000000, self._id_012C );
            var_0 _meth_847D();
        }

        _id_6D84( var_0 );
    }
    else
        _func_0D6( "compass", 0 );

    var_0._id_0426 = undefined;
    var_0._id_2C9D = undefined;
    _id_74B0( var_0 );
}

_id_6D84( var_0 )
{
    var_0 _meth_8055();
    var_0 _meth_8051();
    var_0 _meth_8335( self._id_02E2 );
    var_0 _meth_8337( self._id_8CFF );
    var_0 _meth_82BC( 1 );
    var_1 = var_0._id_6C50;

    if ( isdefined( var_1 ) )
    {
        var_1 delete();
        var_0._id_6C50 = undefined;
    }
}

_id_74B0( var_0 )
{
    var_0 _meth_811D( 1 );
    var_0 _meth_811B( 1 );
    var_0 _meth_811C( 1 );
    var_0 _meth_8326( 0 );
    var_0._id_0E28 = undefined;
}

_id_6D81( var_0 )
{
    self _meth_8057( var_0 );
    var_0 _meth_847E();
    var_0 _meth_831A();
}

_id_6D7F( var_0 )
{
    self _meth_8114( "viewanim", %player_view_dog_knockdown, 1, 0.2, var_0 );
    self _meth_8114( "viewanim", %player_view_dog_knockdown_late, 1, 0.2, var_0 );
}

_id_6D7E( var_0 )
{
    self _meth_8114( "viewanim", %player_view_dog_knockdown, 1, 0.2, var_0 );
    self _meth_8114( "viewanim", %player_view_dog_knockdown_late, 1, 0.2, var_0 );
}

_id_6D80( var_0 )
{
    self _meth_810F( "viewanim", %player_view_dog_knockdown_neck_miss, 1, 0.2, var_0 );
}

_id_6D7D()
{
    self _meth_814E( %knockdown, 0.01, 0.2, 1 );
    self _meth_814E( %knockdown_late, 1, 0.2, 1 );
}

_id_2CBB()
{
    return 1;
}

_id_503A()
{
    if ( _func_120( self.classname, "hyena" ) )
        return 1;

    return 0;
}

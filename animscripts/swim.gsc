// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5F80()
{
    self endon( "movemode" );
    self _meth_8193( "face enemy or motion" );

    if ( animscripts\utility::_id_51B0() )
        self._id_04CB = 0.16;
    else
        self._id_04CB = 0.03;

    animscripts\utility::_id_9B2B();

    if ( animscripts\utility::_id_5124( 0 ) )
        _id_5F81();
    else
        _id_5F89();
}

_id_902F()
{
    self._id_9026 = spawnstruct();
    self._id_9026._id_20B4 = "nostate";
    self._id_9026._id_5F7E = "combat_stationary";
    self._id_9026._id_9513 = "track_none";
    self._id_9026._id_8D65 = [];
    self._id_9026._id_8D65["nostate"] = [ ::_id_9047, ::_id_9047 ];
    self._id_9026._id_8D65["noncombat"] = [ ::_id_5F8A, ::_id_5F8B ];
    self._id_9026._id_8D65["combat"] = [ ::_id_5F82, ::_id_5F83 ];
    self._id_9026._id_8D65["combat_stationary"] = [ ::_id_9047, ::_id_9047 ];
    self._id_9026._id_8D65["combat_forward"] = [ ::_id_5F84, ::_id_5F85 ];
    self._id_9026._id_8D65["combat_strafe"] = [ ::_id_5F87, ::_id_5F88 ];
    self._id_9026._id_8D65["track_none"] = [ ::_id_9047, ::_id_9047 ];
    self._id_9026._id_8D65["track_forward"] = [ ::_id_9068, ::_id_9069 ];
    self._id_9026._id_8D65["track_strafe"] = [ ::_id_906B, ::_id_906C ];
    self _meth_814E( _id_4100( "aim_stand_D" ) );
    self _meth_814E( _id_4100( "aim_stand_U" ) );
    self _meth_814E( _id_4100( "aim_stand_L" ) );
    self _meth_814E( _id_4100( "aim_stand_R" ) );
    self._id_2564 = ::_id_9045;
    self._id_67D8 = 1;
    self._id_66F5 = ::_id_9049;
    self._id_66F4 = 0.2;
}

_id_903B()
{
    self._id_9026 = undefined;

    if ( animscripts\utility::_id_51B0() )
        self._id_04CB = 0.16;
    else
        self._id_04CB = 0.3;
}

_id_9047()
{

}

_id_9046()
{
    _id_5F8D( "nostate" );
    _id_9034();

    if ( isdefined( self._id_6F7A ) )
    {
        self._id_04CB = self._id_6F7A;
        self._id_6F7A = undefined;
    }
}

_id_5F89()
{
    if ( self._id_9026._id_20B4 != "noncombat" )
        _id_5F8D( "noncombat" );

    var_0 = self._id_9026._id_5F1B;
    var_1 = 0.4;

    if ( animscripts\utility::_id_51B0() )
        var_1 = 0.2;

    self _meth_8154( "swimanim", var_0, 1, var_1, self._id_5F65 );
    _id_906D();
    animscripts\notetracks::_id_2D0B( 0.2, "swimanim" );
}

_id_5F81()
{
    if ( self._id_9026._id_20B4 != "combat" )
        _id_5F8D( "combat" );

    if ( isdefined( self._id_0142 ) )
    {
        animscripts\run::_id_800D( 1 );

        if ( !self._id_0175 )
        {
            _id_903A();
            return;
        }
        else
        {
            if ( self._id_9026._id_5F7E != "combat_forward" )
                _id_5F86( "combat_forward" );

            if ( isdefined( self._id_1341 ) && self._id_1341 && _func_0F3( self._id_0500 ) )
            {
                var_0 = _func_115( self._id_0500 );

                if ( _func_0BE( _func_0EB( var_0[1] - self.angles[1] ) ) > 35 )
                {
                    self._id_04CB = 0.18;

                    if ( animscripts\utility::_id_51B0() )
                        self._id_04CB = 0.2;
                }
                else
                {
                    if ( animscripts\utility::_id_51B0() )
                        self._id_04CB = 0.16;
                    else
                        self._id_04CB = 0.03;

                    self._id_1341 = undefined;
                }
            }
            else
                self._id_1341 = undefined;

            var_1 = _id_4100( "forward_aim" );
        }
    }
    else
    {
        if ( self._id_9026._id_5F7E != "combat_forward" )
            _id_5F86( "combat_forward" );

        animscripts\run::_id_800D( 0 );
        var_1 = _id_4100( "forward_aim" );
    }

    var_2 = 0.4;

    if ( animscripts\utility::_id_51B0() )
        var_2 = 0.2;

    _id_906D();
    self _meth_8154( "swimanim", var_1, 1, var_2, self._id_5F65 );
    animscripts\notetracks::_id_2D0B( 0.2, "swimanim" );
}

_id_5F8D( var_0 )
{
    if ( var_0 == self._id_9026._id_20B4 )
        return;

    [[ self._id_9026._id_8D65[self._id_9026._id_20B4][1] ]]();
    [[ self._id_9026._id_8D65[var_0][0] ]]();
    self._id_9026._id_20B4 = var_0;
}

_id_5F8A()
{
    if ( self._id_9026._id_9513 != "track_none" )
        _id_906A( "track_none" );

    _id_9060();
    thread _id_5F8C();
}

_id_5F8B()
{
    self notify( "end_MoveSwim_NonCombat_TwitchUpdate" );
}
#using_animtree("generic_human");

_id_5F82()
{
    self _meth_8145( %combatrun, 1.0, 0.5, self._id_5F65 );

    if ( self._id_9026._id_5F7E != "combat_forward" )
        _id_5F86( "combat_forward" );
}

_id_5F83()
{
    _id_5F86( "combat_stationary" );
}

_id_5F86( var_0 )
{
    if ( var_0 == self._id_9026._id_5F7E )
        return;

    [[ self._id_9026._id_8D65[self._id_9026._id_5F7E][1] ]]();
    [[ self._id_9026._id_8D65[var_0][0] ]]();
    self._id_9026._id_5F7E = var_0;
}

_id_5F84()
{
    if ( self._id_9026._id_9513 != "track_forward" )
        _id_906A( "track_forward" );

    _id_9060();
}

_id_5F85()
{

}

_id_5F87()
{
    self _meth_8146( _id_4100( "strafe_B" ), 1, 0.1, self._id_855F, 1 );
    self _meth_8146( _id_4100( "strafe_L" ), 1, 0.1, self._id_855F, 1 );
    self _meth_8146( _id_4100( "strafe_R" ), 1, 0.1, self._id_855F, 1 );

    if ( self._id_9026._id_9513 != "track_strafe" )
        _id_906A( "track_strafe" );

    _id_9034();

    if ( animscripts\utility::_id_51B0() )
        self._id_04CB = 0.25;
    else
    {
        self._id_04CB = 0.18;
        self._id_022D = 1;
    }
}

_id_5F88()
{
    self _meth_8144( %combatrun_forward, 0.2 );
    self _meth_8144( %combatrun_backward, 0.2 );
    self _meth_8144( %combatrun_left, 0.2 );
    self _meth_8144( %combatrun_right, 0.2 );

    if ( animscripts\utility::_id_51B0() )
        self._id_04CB = 0.16;
    else
    {
        self._id_04CB = 0.03;
        self._id_022D = 0;
    }

    self._id_1341 = 1;
}

_id_906A( var_0 )
{
    if ( self._id_9026._id_9513 == var_0 )
        return;

    [[ self._id_9026._id_8D65[self._id_9026._id_9513][1] ]]();
    [[ self._id_9026._id_8D65[var_0][0] ]]();
    self._id_9026._id_9513 = var_0;
}

_id_9068()
{
    self _meth_814E( _id_4100( "aim_move_D" ) );
    self _meth_814E( _id_4100( "aim_move_L" ) );
    self _meth_814E( _id_4100( "aim_move_R" ) );
    self _meth_814E( _id_4100( "aim_move_U" ) );
    thread _id_5F8E();
}

_id_9069()
{
    self _meth_8144( %aim_2, 0.2 );
    self _meth_8144( %aim_4, 0.2 );
    self _meth_8144( %aim_6, 0.2 );
    self _meth_8144( %aim_8, 0.2 );
}

_id_906B()
{

}

_id_906C()
{
    self _meth_8144( %w_aim_4, 0.2 );
    self _meth_8144( %w_aim_6, 0.2 );
    self _meth_8144( %w_aim_8, 0.2 );
    self _meth_8144( %w_aim_2, 0.2 );
}

_id_5F8E()
{
    self endon( "killanimscript" );
    self endon( "end_face_enemy_tracking" );

    if ( !isdefined( self._id_0972 ) )
    {
        self._id_0972 = 1;
        animscripts\combat::_id_7E08();

        if ( animscripts\utility::_id_51B0() )
        {
            self._id_037C = 90;
            self._id_024D = -90;
        }

        animscripts\track::_id_9502( %w_aim_2, %w_aim_4, %w_aim_6, %w_aim_8 );
    }
}

_id_4100( var_0, var_1 )
{
    var_2 = animscripts\utility::_id_5863( "swim", var_0 );

    if ( isdefined( var_1 ) )
        return var_2[var_1];
    else
        return var_2;
}

_id_5F8C()
{
    var_0 = _id_4100( "forward" );
    self._id_9026._id_5F1B = var_0;
}

_id_9065()
{
    if ( isdefined( self._id_2B0E ) )
        return 0;

    if ( !isdefined( self._id_02F8 ) )
        return 0;

    var_0 = self._id_0270;
    self._id_0270 = 128;

    if ( !self _meth_8195() )
    {
        self._id_0270 = var_0;
        return 0;
    }

    self._id_0270 = var_0;
    var_1 = 10000;

    if ( animscripts\utility::_id_51B0() )
        var_1 = 32400;

    if ( _func_0F0( self._id_02E2, self._id_02F8 ) < var_1 )
        return 0;

    if ( self.a._id_5F5B != "stop" )
        return 0;

    if ( _func_0F3( self._id_0333 ) > 1 )
    {
        var_2 = _func_115( self._id_0333 );

        if ( _func_0BE( _func_0EB( var_2[1] - self.angles[1] ) ) < 90 )
        {
            var_3 = _func_115( self._id_0258 );

            if ( _func_0BE( _func_0EB( var_3[1] - self.angles[1] ) ) < 90 )
                return 0;
        }
    }

    return 1;
}

_id_9045()
{
    self.a._id_6E5A = "stand";

    if ( !_id_9065() )
        return;

    var_0 = _id_9032();

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0._id_58C0;
    var_2 = var_0._id_58BE;
    var_3 = var_0._id_58BD;
    var_4 = _func_115( self._id_0258 );
    var_5 = var_4 - var_3;
    var_6 = anglestoforward( var_5 );
    var_7 = animscripts\exit_node::_id_3F8B();

    if ( animscripts\utility::_id_51B0() && isdefined( var_7 ) )
    {
        var_8 = _id_903F( var_7 );

        if ( var_8 != "exposed" )
        {
            var_9 = _id_404A( var_7 );
            var_6 = anglestoforward( var_9 );
        }
        else
            var_6 = anglestoforward( self.angles );
    }

    self _meth_8192( "nogravity", 0 );
    var_10 = _func_0B5( 0.9, 1.1 );
    var_11 = 0.3;
    self _meth_8193( "face angle 3d", self.angles );

    if ( isdefined( var_1 ) && !animscripts\utility::_id_51B0() )
    {
        self _meth_8112( "startturn", var_1, %body, 1, 0.3, var_10 * self._id_5F65 );
        animscripts\shared::_id_2D06( "startturn" );
        var_11 = 0.5;
    }
    else if ( isdefined( var_1 ) && animscripts\utility::_id_51B0() )
    {
        if ( isdefined( var_7 ) )
            self _meth_8193( "face direction", var_6 );

        self._id_6F7A = 0.16;
        self._id_04CB = 5.0;
        var_11 = 0.1;
        self _meth_8112( "startturn", var_1, %body, 1, var_11, var_10 * self._id_5F65 );
        animscripts\shared::_id_2D06( "startturn" );
        var_11 = 0.5;
        self._id_04CB = 0.16;
        self._id_6F7A = undefined;
        var_12 = _func_093( var_1 );
        var_7 = animscripts\exit_node::_id_3F8B();
        var_6 = anglestoforward( self.angles );

        if ( isdefined( var_7 ) )
        {
            var_8 = _id_903F( var_7 );

            if ( var_8 != "exposed" )
            {
                var_9 = _id_404A( var_7 );
                var_9 = ( var_9[0], var_9[1] - var_12, var_9[2] );
                var_6 = anglestoforward( var_9 );
            }
        }
    }

    var_13 = var_4 - self.angles;
    var_14 = getanimlength( var_2 );
    var_15 = 0.001 * _func_0BE( _func_0EB( var_13[1] - var_3[1] ) ) / var_14;
    var_16 = 0.001 * _func_0BE( _func_0EB( var_13[0] - var_3[0] ) ) / var_14;
    var_17 = _func_0E1( var_15, var_16 );

    if ( var_17 < 0.01 )
        var_17 = 0.01;

    if ( animscripts\utility::_id_51B0() )
    {
        var_11 = 0.05;
        self._id_04CB = 0.16;
        var_17 = 5.0;
    }

    self._id_6F7A = self._id_04CB;
    self._id_04CB = var_17;
    self _meth_8193( "face direction", var_6 );
    self _meth_8112( "startmove", var_2, %body, 1, var_11, var_10 * self._id_5F65 );
    animscripts\shared::_id_2D06( "startmove" );
    self._id_04CB = self._id_6F7A;
    self._id_6F7A = undefined;
    self _meth_8193( "face default" );
    self _meth_8192( "none", 0 );

    if ( animscripts\utility::_id_51B0() )
    {
        if ( animhasnotetrack( var_2, "finish" ) )
            animscripts\shared::_id_2D06( "startmove" );

        var_18 = 65536;
        var_19 = self._id_01C3;

        if ( isdefined( self._id_02BB ) )
            var_19 = self._id_02BB._id_02E2;

        if ( _func_225( self._id_02E2, var_19 ) > var_18 )
            self notify( "force_space_rotation_update", 0, 0, undefined, 1 );
    }

    if ( animscripts\utility::_id_51B0() )
        return 0.2;
    else
        return 0.4;
}

_id_9060()
{
    self _meth_814E( _id_4100( "turn_add_l" ) );
    self _meth_814E( _id_4100( "turn_add_r" ) );
    self _meth_814E( _id_4100( "turn_add_u" ) );
    self _meth_814E( _id_4100( "turn_add_d" ) );
    self._id_6F6B = 0;
    self._id_6F6A = 0;
}

_id_9034()
{
    self _meth_8144( %add_turn_l, 0.2 );
    self _meth_8144( %add_turn_r, 0.2 );
    self _meth_8144( %add_turn_u, 0.2 );
    self _meth_8144( %add_turn_d, 0.2 );
    self._id_6F6B = undefined;
    self._id_6F6A = undefined;
}

_id_9032()
{
    var_0 = animscripts\utility::_id_5124();
    var_1 = animscripts\exit_node::_id_3F8B();
    var_2 = self.angles;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    var_6 = _func_115( self._id_0258 );
    var_7 = animscripts\utility::_id_413B( var_1 );

    if ( animscripts\utility::_id_51B0() && var_7[2] )
    {
        if ( var_7[2] != 0 )
        {
            var_8 = anglestoforward( var_7 );
            var_9 = self._id_01C3;

            if ( isdefined( self._id_02BB ) )
                var_9 = self._id_02BB._id_02E2;

            var_10 = _func_11F( var_8, var_9 - self._id_02E2, var_7[2] * -1 );
            var_11 = var_10 + self._id_02E2;
            var_12 = var_11 - self._id_02E2;
            var_12 = _func_114( var_12 );
            var_6 = _func_115( var_12 );
            var_5 = 1;
        }
    }

    var_13 = undefined;
    var_14 = undefined;

    if ( isdefined( var_1 ) && isdefined( var_1._id_04D9 ) )
    {
        var_14 = _id_903F( var_1 );

        if ( var_14 != "exposed" )
        {
            var_13 = "exit_" + var_14;
            var_2 = var_1.angles;

            if ( animscripts\utility::_id_51B0() )
            {
                var_2 = animscripts\utility::_id_413B( var_1 );

                if ( var_5 == 1 )
                    var_2 = ( var_2[0], var_2[1], 0 );
            }
            else
                var_2 = var_1.angles;

            var_3 = 1;
        }
    }

    if ( !isdefined( var_13 ) )
    {
        if ( var_0 )
            var_13 = "idle_ready_to_forward";
        else
        {
            var_13 = "idle_to_forward";
            var_4 = 1;
            var_3 = 1;
        }
    }

    var_15 = _id_4100( var_13 );
    var_16 = _func_0EB( var_6[1] - var_2[1] );
    var_17 = _func_0EB( var_6[0] - var_2[0] );
    var_18 = undefined;

    if ( animscripts\utility::_id_51B0() )
        var_18 = 3;

    var_19 = _id_903D( var_16, var_18 );
    var_20 = _id_903D( var_17, var_18 );
    var_21 = var_14;

    if ( !isdefined( var_21 ) && isdefined( self._id_0334 ) && _func_225( self._id_0334._id_02E2, self._id_02E2 ) < 36 )
        var_21 = _id_903F( self._id_0334 );

    if ( var_19 == 4 && isdefined( var_21 ) )
    {
        var_22 = isdefined( var_14 );

        if ( var_21 == "cover_corner_l" && var_16 < -10 && ( !var_22 || isdefined( var_15[2] ) ) )
            var_19 = 2;
        else if ( var_21 == "cover_corner_r" && var_16 > 10 && ( !var_22 || isdefined( var_15[6] ) ) )
            var_19 = 6;
    }

    if ( !isdefined( var_15[var_19] ) )
    {
        var_13 = "idle_to_forward";
        var_15 = _id_4100( var_13 );
        var_4 = 1;
    }

    var_23 = spawnstruct();

    if ( var_4 )
    {
        var_24 = _id_4100( "idle_turn" );

        if ( !isdefined( var_24[var_19] ) )
        {
            var_25 = 0;

            for ( var_26 = 8; !isdefined( var_15[var_25] ) && var_25 < 8; var_25++ )
            {

            }

            while ( !isdefined( var_15[var_26] ) && var_26 > 0 )
                var_26--;

            if ( var_19 < var_25 )
                var_19 = var_25;
            else if ( var_19 > var_26 )
                var_19 = var_26;
        }

        var_23._id_58C0 = var_24[var_19];
        var_19 = 4;
    }

    if ( isdefined( var_15[var_19] ) && isdefined( var_15[var_19][var_20] ) )
    {
        var_23._id_58BE = var_15[var_19][var_20];

        if ( var_3 )
        {
            var_15 = _id_4100( var_13 + "_angleDelta" );
            var_23._id_58BD = var_15[var_19][var_20];
        }
        else
            var_23._id_58BD = ( 0, 0, 0 );

        return var_23;
    }

    var_23 = undefined;
    return undefined;
}

_id_9064()
{
    self endon( "killanimscript" );
    self endon( "swim_cancelapproach" );
    thread _id_904A();

    if ( isdefined( self._id_2AF3 ) && self._id_2AF3 )
        return;

    self._id_9026._id_0D26 = self._id_02F8;

    if ( isdefined( self _meth_81A1() ) )
        return;

    var_0 = animscripts\cover_arrival::_id_3F00();

    if ( isdefined( var_0 ) && _id_9043( var_0 ) )
        thread _id_902C();
    else
        thread _id_902D();
}

_id_904A()
{
    self endon( "killanimscript" );
    self endon( "swim_killrestartlistener" );
    self waittill( "path_set" );
    var_0 = isdefined( self._id_02F8 ) && isdefined( self._id_9026._id_0D26 ) && _func_0F0( self._id_02F8, self._id_9026._id_0D26 ) < 4;

    if ( var_0 )
    {
        thread _id_904A();
        return;
    }

    _id_9031();
    _id_9064();
}

_id_9031()
{
    self notify( "swim_cancelapproach" );
    self._id_0411 = 0;
}

_id_9070( var_0, var_1 )
{
    self endon( "swim_cancelwaitforapproachpos" );
    var_2 = ( var_1 + 60 ) * ( var_1 + 60 );
    var_3 = _func_0F0( var_0, self._id_02E2 );

    if ( var_3 <= var_2 )
        return;

    self._id_0411 = var_2;
    self waittill( "stop_soon" );
    self._id_0411 = 0;
}

_id_902D()
{
    self endon( "killanimscript" );
    self endon( "swim_cancelapproach" );
    self endon( "move_interrupt" );
    self endon( "swim_killrestartlistener" );

    if ( !isdefined( self._id_02F8 ) )
        return;

    var_0 = _id_9040( "arrival_exposed" );
    _id_9070( self._id_02F8, var_0 );
    _id_9039();
}

_id_902C()
{
    self endon( "killanimscript" );
    self endon( "swim_cancelapproach" );
    self endon( "swim_killrestartlistener" );
    var_0 = animscripts\cover_arrival::_id_3F00();
    self._id_0CBC = _id_903F( var_0 );
    self._id_0369 = 1;
    self waittill( "cover_approach", var_1 );
    var_0 = animscripts\cover_arrival::_id_3F00();
    var_2 = _id_903F( var_0 );

    if ( var_2 == "exposed" )
    {
        if ( isdefined( var_0 ) )
            var_3 = var_0._id_02E2;
        else
            var_3 = self._id_02F8;

        var_4 = var_3 - self._id_02E2;
        var_5 = _func_115( var_4 );
        var_6 = ( 0, var_5[1], 0 );
        var_7 = ( 0, var_5[1], 0 );
    }
    else
    {
        var_3 = var_0._id_02E2;
        var_6 = _id_404A( var_0 );

        if ( animscripts\utility::_id_51B0() )
            var_7 = animscripts\utility::_id_413B( var_0 );
        else
            var_7 = var_0.angles;
    }

    thread _id_9038( var_2, var_3, var_1, var_7, var_6 );
}

_id_9039()
{
    var_0 = animscripts\cover_arrival::_id_3F00();
    var_1 = self._id_02F8;
    var_2 = ( 0, self.angles[1], self.angles[2] );

    if ( isdefined( var_0 ) && var_0._id_04D9 != "Path" && var_0._id_04D9 != "Path 3D" )
        var_2 = _id_404A( var_0 );
    else if ( animscripts\cover_arrival::_id_35B8() )
        var_2 = _func_115( self._id_0142._id_02E2 - var_1 );

    var_3 = _func_114( var_1 - self._id_02E2 );

    if ( isdefined( var_0 ) && _id_9043( var_0 ) )
    {
        var_4 = _id_903F( var_0 );
        var_5 = _id_404A( var_0 );
        var_2 = var_0.angles;

        if ( animscripts\utility::_id_51B0() )
            var_2 = animscripts\utility::_id_413B( var_0 );

        thread _id_9038( var_4, var_0._id_02E2, var_3, var_2, var_5 );
        return;
    }

    thread _id_9038( "exposed", var_1, var_3, var_2, var_2 );
}

_id_9037( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( animscripts\utility::_id_51B0() )
    {
        var_6 = ( 0, 0, 0 );
        var_7 = ( 0, 0, 0 );
        var_8 = _func_11C( _func_253( var_4 ), var_5 );
        var_9 = _func_254( _func_114( self._id_02E2 - var_2 ), var_4 ) * -1.0;
        var_10 = _id_9036( var_0, var_1, var_6, var_9, var_7, var_8, 1, var_2, var_4 );

        if ( var_10 )
            var_0._id_58C2 = _func_11E( var_0._id_58C2, var_4 ) + var_2;

        return var_10;
    }
    else
        return _id_9036( var_0, var_1, var_2, var_3, var_4, var_5, 0 );
}

_id_9038( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "killanimscript" );
    self endon( "swim_cancelapproach" );
    self._id_0CBC = var_0;
    var_5 = spawnstruct();

    if ( !_id_9037( var_5, var_0, var_1, var_2, var_3, var_4 ) )
        return;

    var_6 = anglestoforward( self.angles );
    var_7 = var_5._id_58C2 - self._id_02E2;
    var_8 = _func_0F1( var_7 );
    var_7 /= var_8;

    if ( animscripts\utility::_id_51B0() )
    {
        var_9 = var_1 - var_5._id_58C2;
        var_10 = _func_0F1( var_9 );
        var_11 = _func_0F6( var_7, var_6 );

        if ( var_8 > var_10 * 0.4 && _func_0F6( var_7, var_6 ) < 0.5 )
        {
            self notify( "force_space_rotation_update", 0, 0 );
            return;
        }
    }
    else if ( var_8 < 100 && _func_0F6( var_7, var_6 ) < 0.5 )
        return;

    if ( var_8 > 4 )
    {
        if ( var_8 < 12 || self._id_017D || !isdefined( self._id_02BB ) || !animscripts\cover_arrival::_id_51D4() )
        {
            self._id_9026._id_0D26 = var_5._id_58C2;
            self _meth_8162( var_5._id_58C2 );

            if ( animscripts\utility::_id_51B0() )
            {
                var_12 = 16384;

                for (;;)
                {
                    if ( _func_0F0( self._id_02E2, var_5._id_58C2 ) < var_12 )
                    {
                        self._id_6F7A = self._id_04CB;
                        self._id_04CB = 0.1;
                        var_13 = _func_255( var_5._id_58BF, var_5._id_58BD, var_1, var_4 );
                        self notify( "force_space_rotation_update", 0, 0, var_13[1] );
                        break;
                    }

                    wait 0.1;
                }
            }

            self waittill( "runto_arrived" );
        }
    }

    self notify( "swim_killrestartlistener" );
    var_14 = _func_114( var_1 - self._id_02E2 );

    if ( !_id_9037( var_5, var_0, var_1, var_14, var_3, var_4 ) )
        return;

    self._id_9026._id_0D23 = var_5._id_58BE;

    if ( animscripts\utility::_id_51B0() )
        var_15 = self _meth_81E7( var_5._id_58C2, var_4[1] - var_5._id_58BD[1], var_4[0] - var_5._id_58BD[0], var_4, var_5._id_58BD );
    else
        self _meth_81E7( var_5._id_58C2, var_4[1] - var_5._id_58BD[1], var_4[0] - var_5._id_58BD[0] );
}

_id_9035()
{
    self endon( "killanimscript" );
    self endon( "abort_approach" );
    var_0 = "arrival_" + self._id_0CBC;
    var_1 = self._id_9026._id_0D23;

    if ( !self._id_017D )
        thread animscripts\cover_arrival::_id_06BE();

    var_2 = 0.4;

    if ( animscripts\utility::_id_51B0() )
    {
        var_2 = 0.2;
        thread _id_88B3();
    }

    self _meth_8144( %body, 0.2 );
    self _meth_8115( "coverArrival", var_1, 1, var_2, self._id_5F97 );
    animscripts\shared::_id_2D06( "coverArrival", ::_id_9042 );

    if ( !animhasnotetrack( var_1, "start_aim" ) )
        _id_9066();

    self.a._id_6E5A = "stand";
    self.a._id_5F5B = "stop";
    self.a._id_0D29 = self._id_0CBC;

    if ( animscripts\utility::_id_51B0() )
    {
        self._id_04CB = 0.16;
        self._id_6F7A = undefined;
    }

    self _meth_8144( %animscript_root, 0.3 );
    self._id_5575 = undefined;
    self._id_9026._id_0D23 = undefined;

    if ( animscripts\utility::_id_51B0() && self._id_0CBC == "exposed" )
        self notify( "force_space_rotation_update", 0, 0, undefined, 1 );
}

_id_88B3()
{
    self endon( "killanimscript" );
    self endon( "abort_approach" );
    wait 0.22;
    self._id_6F7A = 0.16;
    self._id_04CB = 5.0;
}

_id_903E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_4 )
    {
        var_5 = _func_255( var_2, var_3, var_0, var_1 );
        return var_5[0];
    }

    var_6 = var_1 - var_3;
    var_7 = anglestoforward( var_6 );
    var_8 = anglestoright( var_6 );
    var_9 = anglestoup( var_6 );
    var_10 = var_7 * var_2[0];
    var_11 = var_8 * var_2[1];
    var_12 = var_9 * var_2[2];
    return var_0 - var_10 + var_11 - var_12;
}

_id_9044( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_2 )
    {
        var_1 = _func_11E( var_1, var_4 ) + var_3;
        return self _meth_81C8( var_3, var_1, 0, 1 );
    }

    return self _meth_81C8( var_0, var_1, 0, 1 );
}

_id_9036( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( _func_0F3( var_3 ) < 0.003 )
        return 0;

    var_9 = _func_115( var_3 );

    if ( var_1 == "exposed" )
    {
        var_10 = 4;
        var_11 = 4;
    }
    else
    {
        var_12 = _func_0EB( var_4[1] - var_9[1] );
        var_10 = _id_903D( var_12 );
        var_11 = _id_903D( var_12, 25 );
    }

    var_13 = _func_0EB( var_4[0] - var_9[0] );
    var_14 = _id_903D( var_13 );
    var_15 = _id_903D( var_13, 25 );
    var_16 = "arrival_" + var_1;

    if ( var_1 == "exposed" && !animscripts\utility::_id_5124( 0 ) )
        var_16 += "_noncombat";

    var_17 = _id_4100( var_16 );

    if ( !isdefined( var_17[var_10] ) || !isdefined( var_17[var_10][var_14] ) )
        return 0;

    var_18 = ( var_10 != var_11 || var_14 != var_15 ) && isdefined( var_17[var_11] ) && isdefined( var_17[var_11][var_15] );
    var_19 = 0;
    var_20 = 0;
    var_21 = undefined;
    var_22 = var_17[var_10][var_14];

    if ( var_18 )
        var_21 = var_17[var_11][var_15];

    var_23 = var_16 + "_delta";
    var_17 = _id_4100( var_23 );
    var_24 = var_17[var_10][var_14];

    if ( var_18 )
        var_19 = var_17[var_11][var_15];

    var_25 = var_16 + "_angleDelta";
    var_17 = _id_4100( var_25 );
    var_26 = var_17[var_10][var_14];

    if ( var_18 )
        var_20 = var_17[var_11][var_15];

    var_27 = _id_903E( var_2, var_5, var_24, var_26, var_6 );

    if ( !_id_9044( var_2, var_27, var_6, var_7, var_8 ) && var_18 && !animscripts\utility::_id_51B0() )
    {
        var_22 = var_21;
        var_24 = var_19;
        var_26 = var_20;
        var_27 = _id_903E( var_2, var_5, var_24, var_26, var_6 );

        if ( !_id_9044( var_2, var_27, var_6, var_7, var_8 ) )
            return 0;
    }

    var_0._id_58BE = var_22;
    var_0._id_58BF = var_24;
    var_0._id_58BD = var_26;
    var_0._id_58C2 = var_27;
    return 1;
}

_id_903D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 10;

    if ( var_0 < 0 )
        return _func_0BC( _func_0E3( ( 180 + var_0 - var_1 ) / 45 ) );
    else
        return _func_0BC( _func_0E2( ( 180 + var_0 + var_1 ) / 45 ) );
}

_id_9040( var_0 )
{
    var_1 = anim._id_0CCA["soldier"]["swim"][var_0]["maxDelta"];

    if ( isdefined( self._id_0C4D ) && self._id_0C4D != "soldier" )
    {
        if ( isdefined( anim._id_0CCA[self._id_0C4D]["swim"] ) && isdefined( anim._id_0CCA[self._id_0C4D]["swim"][var_0] ) )
        {
            var_2 = anim._id_0CCA[self._id_0C4D]["swim"][var_0]["maxDelta"];

            if ( var_2 > var_1 )
                var_1 = var_2;
        }
    }

    return var_1;
}

_id_9066()
{
    animscripts\animset::_id_7DD2();
    animscripts\combat::_id_7DB6();
    self._id_6F67 = 0.0;
    animscripts\combat_utility::_id_82F8( 0 );
    thread animscripts\track::_id_9512();
}

_id_9042( var_0 )
{
    if ( var_0 != "start_aim" )
        return;

    _id_9066();
}

_id_903F( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "exposed";

    var_1 = var_0._id_04D9;

    if ( !isdefined( var_1 ) )
        return "exposed";

    switch ( var_1 )
    {
        case "Cover Right 3D":
            return "cover_corner_r";
        case "Cover Left 3D":
            return "cover_corner_l";
        case "Cover Up 3D":
            return "cover_u";
        case "Exposed 3D":
        case "Path 3D":
            return "exposed";
        default:
    }
}

_id_404A( var_0 )
{
    if ( getdvarint( "player_spaceEnabled" ) == 1 )
    {
        var_1 = animscripts\utility::_id_413B( var_0 );

        if ( animscripts\utility::_id_515B( var_0 ) )
        {
            var_2 = _id_4100( "arrival_cover_corner_l_angleDelta" );
            var_3 = var_2[4][4][1];
        }
        else if ( animscripts\utility::_id_515E( var_0 ) )
        {
            var_2 = _id_4100( "arrival_cover_corner_r_angleDelta" );
            var_3 = var_2[4][4][1];
        }
        else
            var_3 = 0;

        var_1 = _func_11C( var_1, ( 0, var_3, 0 ) );
        return var_1;
    }
    else
        var_1 = var_0.angles;

    var_4 = var_1[1];

    if ( animscripts\utility::_id_515B( var_0 ) )
    {
        var_2 = _id_4100( "arrival_cover_corner_l_angleDelta" );
        var_4 += var_2[4][4][1];
    }
    else if ( animscripts\utility::_id_515E( var_0 ) )
    {
        var_2 = _id_4100( "arrival_cover_corner_r_angleDelta" );
        var_4 += var_2[4][4][1];
    }

    var_1 = ( var_1[0], var_4, var_1[2] );
    return var_1;
}

_id_903A()
{
    if ( self._id_9026._id_5F7E != "combat_strafe" )
        _id_5F86( "combat_strafe" );

    var_0 = _id_4100( "forward_aim" );
    self _meth_8155( "swimanim", var_0, 1, 0.1, 1, 1 );
    thread _id_906F();
    animscripts\notetracks::_id_2D0B( 0.2, "swimanim" );
    self notify( "end_swim_updatestrafeanim" );
}

_id_906F()
{
    self endon( "killanimscript" );
    self endon( "move_interrupt" );
    self endon( "move_mode" );
    self endon( "move_loop_restart" );
    self endon( "end_swim_updatestrafeanim" );
    var_0 = 0;

    for (;;)
    {
        if ( self._id_0175 )
        {
            if ( !var_0 )
            {
                _id_9063( 1.0, 0.0, 0.0, 0.0 );
                _id_9062( 0, 0, 0, 0 );
            }
        }
        else
        {
            if ( self._id_0360 == 1 )
            {
                var_1 = [];
                var_1["front"] = 1;
                var_1["back"] = 0;
                var_1["left"] = 0;
                var_1["right"] = 0;
            }
            else
                var_1 = animscripts\utility::_id_7082( self _meth_8194() );

            if ( isdefined( self._id_9ACA ) )
            {
                var_1["back"] = 0.0;

                if ( var_1["front"] < 0.2 )
                    var_1["front"] = 0.2;
            }

            var_2 = _id_9063( var_1["front"], var_1["back"], var_1["left"], var_1["right"] );
            _id_9061( var_2 );
            _id_906E();
        }

        var_0 = self._id_0175;
        wait 0.05;
        waitframe;
    }
}

_id_9041()
{
    if ( animscripts\utility::_id_51B0() )
        return 0.5;
    else
        return 0.5;
}

_id_9063( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_9041();
    self _meth_814D( %combatrun_forward, var_0, var_4, 1, 1 );
    self _meth_814D( %combatrun_backward, var_1, var_4, 1, 1 );
    self _meth_814D( %combatrun_left, var_2, var_4, 1, 1 );
    self _meth_814D( %combatrun_right, var_3, var_4, 1, 1 );

    if ( var_0 > 0 )
        return "front";
    else if ( var_1 > 0 )
        return "back";
    else if ( var_2 > 0 )
        return "left";
    else if ( var_3 > 0 )
        return "right";
}

_id_9061( var_0 )
{
    switch ( var_0 )
    {
        case "front":
            self _meth_8146( _id_4100( "aim_move_U" ), 1, 0.1 );
            self _meth_8146( _id_4100( "aim_move_D" ), 1, 0.1 );
            self _meth_8146( _id_4100( "aim_move_L" ), 1, 0.1 );
            self _meth_8146( _id_4100( "aim_move_R" ), 1, 0.1 );
            break;
        case "back":
            self _meth_8146( _id_4100( "strafe_B_aim_U" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_B_aim_D" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_B_aim_L" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_B_aim_R" ), 1, 0.1 );
            break;
        case "left":
            self _meth_8146( _id_4100( "strafe_L_aim_U" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_L_aim_D" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_L_aim_L" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_L_aim_R" ), 1, 0.1 );
            break;
        case "right":
            self _meth_8146( _id_4100( "strafe_R_aim_U" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_R_aim_D" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_R_aim_L" ), 1, 0.1 );
            self _meth_8146( _id_4100( "strafe_R_aim_R" ), 1, 0.1 );
            break;
        default:
    }
}

_id_906E()
{
    var_0 = self.angles[1];
    var_1 = self.angles[0];
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    var_6 = 45;
    var_7 = 60;

    if ( isdefined( self._id_0142 ) )
    {
        var_8 = self._id_0142._id_02E2 - self._id_02E2;
        var_9 = _func_115( var_8 );
        var_10 = _func_0EB( var_9[1] - var_0 );
        var_11 = _func_0EB( var_9[0] - var_1 );

        if ( var_10 > 0 )
            var_4 = _func_0E9( 1 - ( var_6 - var_10 ) / var_6, 0, 1 );
        else
            var_5 = _func_0E9( 1 - ( var_6 + var_10 ) / var_6, 0, 1 );

        if ( var_11 > 0 )
            var_3 = _func_0E9( 1 - ( var_7 - var_11 ) / var_7, 0, 1 );
        else
            var_2 = _func_0E9( 1 - ( var_7 + var_11 ) / var_7, 0, 1 );
    }

    _id_9062( var_2, var_3, var_4, var_5 );
}

_id_9062( var_0, var_1, var_2, var_3 )
{
    self _meth_814D( %w_aim_4, var_2, 0.2, 1, 1 );
    self _meth_814D( %w_aim_6, var_3, 0.2, 1, 1 );
    self _meth_814D( %w_aim_8, var_0, 0.2, 1, 1 );
    self _meth_814D( %w_aim_2, var_1, 0.2, 1, 1 );
}

_id_9049( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;
    var_4 = _id_4100( "turn" );
    var_5 = _id_903D( var_0 );
    var_6 = _id_903D( var_1 );

    if ( isdefined( var_4[var_5] ) )
        var_2 = var_4[var_5][var_6];

    if ( var_5 == 4 )
    {
        if ( var_6 > 4 && isdefined( var_4[4][var_6 + 1] ) )
            var_2 = var_4[4][var_6 + 1];
        else if ( var_6 < 4 && var_6 > 0 && isdefined( var_4[4][var_6 - 1] ) )
            var_2 = var_4[4][var_6 - 1];
    }

    if ( !isdefined( var_2 ) )
        var_2 = var_4[var_5][4];

    if ( isdefined( var_2 ) )
    {
        if ( animscripts\move::_id_66D4( var_2 ) )
            return var_2;
    }

    return undefined;
}

_id_9033()
{
    _id_5F8D( "nostate" );
}

_id_906D()
{
    var_0 = _func_0E9( self._id_024A / 20.0, -1, 1 );

    if ( var_0 > 0 )
    {
        if ( self._id_6F6B <= 0 && var_0 < 0.075 )
            var_0 = 0;

        self _meth_814D( %add_turn_l, var_0, 0.2, 1, 1 );
        self _meth_814D( %add_turn_r, 0.0, 0.2, 1, 1 );
    }
    else
    {
        if ( self._id_6F6B >= 0 && var_0 > -0.075 )
            var_0 = 0;

        self _meth_814D( %add_turn_l, 0, 0.2, 1, 1 );
        self _meth_814D( %add_turn_r, 0 - var_0, 0.2, 1, 1 );
    }

    self._id_6F6B = var_0;
    var_0 = _func_0E9( self._id_0312 / 25.0, -1, 1 );

    if ( var_0 > 0 )
    {
        if ( self._id_6F6A <= 0 && var_0 < 0.075 )
            var_0 = 0;

        self _meth_814D( %add_turn_d, var_0, 0.2, 1, 1 );
        self _meth_814D( %add_turn_u, 0.0, 0.2, 1, 1 );
    }
    else
    {
        if ( self._id_6F6A >= 0 && var_0 > -0.075 )
            var_0 = 0;

        self _meth_814D( %add_turn_d, 0, 0.2, 1, 1 );
        self _meth_814D( %add_turn_u, 0 - var_0, 0.2, 1, 1 );
    }

    self._id_6F6A = var_0;
}

_id_9043( var_0 )
{
    switch ( var_0._id_04D9 )
    {
        case "Cover Up 3D":
        case "Cover Left 3D":
        case "Cover Right 3D":
        case "Exposed 3D":
            return 1;
    }

    return 0;
}

_id_88B4()
{
    return 0.16;
}

_id_88B5()
{
    return 0.1;
}

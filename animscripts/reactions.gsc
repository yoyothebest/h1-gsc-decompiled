// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "reactions" );
    _id_60AC();
}
#using_animtree("generic_human");

_id_4CA2()
{
    var_0 = [];
    var_0["cover_stand"] = [ %stand_cover_reaction_a, %stand_cover_reaction_b ];
    var_0["cover_crouch"] = [ %stand_cover_reaction_a, %stand_cover_reaction_b ];
    var_0["cover_left"] = [ %stand_cover_reaction_a, %stand_cover_reaction_b ];
    var_0["cover_right"] = [ %stand_cover_reaction_a, %stand_cover_reaction_b ];
    anim._id_0CCA["soldier"]["cover_reactions"] = var_0;
    var_0 = [];
    var_0[0] = %run_wizby_a;
    var_0[1] = %run_wizby_b;
    anim._id_0CCA["soldier"]["running_react_to_bullets"] = var_0;
    anim.longestrunwizby = 0;

    foreach ( var_2 in var_0 )
    {
        var_3 = _func_0F1( _func_092( var_2, 0, 1 ) );

        if ( var_3 > anim.longestrunwizby )
            anim.longestrunwizby = var_3;
    }

    anim._id_55D5 = 0;
}

_id_718A()
{
    thread _id_18B3();
}

_id_1AD9()
{
    return !isdefined( self._id_55D2 ) || gettime() - self._id_55D2 > 2000;
}

_id_18B4()
{
    var_0 = gettime();
    self endon( "killanimscript" );
    self._id_55D2 = gettime();
    self.a._id_5F5B = "stop";
    var_1 = isdefined( self._id_A316 ) && _func_0F0( self._id_02E2, self._id_A316._id_02E2 ) < 160000;
    self _meth_8192( "gravity" );
    self _meth_8193( "face current" );

    if ( isdefined( self.disable_crouch_whizby_react ) || var_1 || common_scripts\utility::_id_2006() )
    {
        self _meth_8144( %animscript_root, 0.1 );
        var_2 = [];

        if ( animscripts\utility::_id_9C3B() )
        {
            var_2[0] = %smg_exposed_idle_reacta;
            var_2[1] = %smg_exposed_idle_reactb;
            var_2[2] = %smg_exposed_idle_twitch;
            var_2[3] = %smg_exposed_idle_twitch_v4;
        }
        else
        {
            var_2[0] = %exposed_idle_reacta;
            var_2[1] = %exposed_idle_reactb;
            var_2[2] = %exposed_idle_twitch;
            var_2[3] = %exposed_idle_twitch_v4;
        }

        var_3 = var_2[_func_0B2( var_2.size )];

        if ( var_1 )
            var_4 = 1 + _func_0B3( 0.5 );
        else
            var_4 = 0.2 + _func_0B3( 0.5 );

        self _meth_810F( "reactanim", var_3, 1, 0.1, 1 );
        animscripts\notetracks::_id_2D0B( var_4, "reactanim" );
        self _meth_8144( %animscript_root, 0.1 );

        if ( !var_1 && self._id_03F1 == "none" && !isdefined( self._id_2A93 ) )
        {
            var_5 = 1 + _func_0B3( 0.2 );
            var_6 = animscripts\utility::_id_711E( %exposed_dive_grenade_b, %exposed_dive_grenade_f );
            self _meth_810F( "dive", var_6, 1, 0.1, var_5 );
            animscripts\shared::_id_2D06( "dive" );
        }
    }
    else
    {
        wait(_func_0B3( 0.2 ));
        var_5 = 1.2 + _func_0B3( 0.3 );

        if ( self.a._id_6E5A == "stand" )
        {
            self _meth_8144( %animscript_root, 0.1 );
            self _meth_810F( "crouch", %exposed_stand_2_crouch, 1, 0.1, var_5 );
            animscripts\shared::_id_2D06( "crouch" );
        }

        var_7 = anglestoforward( self.angles );

        if ( isdefined( self._id_A316 ) )
            var_8 = _func_114( self._id_A316._id_02E2 - self._id_02E2 );
        else
            var_8 = var_7;

        if ( _func_0F6( var_8, var_7 ) > 0 )
        {
            var_9 = animscripts\utility::_id_711E( %exposed_crouch_idle_twitch_v2, %exposed_crouch_idle_twitch_v3 );
            self _meth_8144( %animscript_root, 0.1 );
            self _meth_810F( "twitch", var_9, 1, 0.1, 1 );
            animscripts\shared::_id_2D06( "twitch" );
        }
        else
        {
            var_10 = animscripts\utility::_id_711E( %exposed_crouch_turn_180_left, %exposed_crouch_turn_180_right );
            self _meth_8144( %animscript_root, 0.1 );
            self _meth_810F( "turn", var_10, 1, 0.1, 1 );
            animscripts\shared::_id_2D06( "turn" );
        }
    }

    self _meth_8144( %animscript_root, 0.1 );
    self._id_A316 = undefined;
    self _meth_8192( "normal" );
    self _meth_8193( "face default" );
}

_id_18B3()
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_2AF7 ) )
        return;

    for (;;)
    {
        self waittill( "bulletwhizby", var_0 );

        if ( isdefined( self._id_2AF7 ) )
            return;

        if ( !isdefined( var_0._id_04A7 ) || self._id_04A7 == var_0._id_04A7 )
            continue;

        if ( isdefined( self._id_22BA ) || isdefined( self._id_0B6A ) )
            continue;

        if ( self.a._id_6E5A != "stand" )
            continue;

        if ( !_id_1AD9() )
            continue;

        self._id_A316 = var_0;
        self _meth_819E( ::_id_18B4 );
    }
}

_id_1EF4()
{
    self endon( "killanimscript" );
    wait 0.3;
    self _meth_8202();
}

_id_4039()
{
    var_0 = undefined;

    if ( self _meth_8165() )
    {
        var_1 = animscripts\utility::_id_5864( "cover_reactions" );

        if ( isdefined( var_1[self._id_0335] ) )
        {
            var_2 = anglestoforward( self._id_02BB.angles );
            var_3 = _func_114( self._id_0359 - self._id_02E2 );

            if ( _func_0F6( var_2, var_3 ) < -0.5 )
            {
                self _meth_8193( "face current" );
                var_4 = _func_0B2( var_1[self._id_0335].size );
                var_0 = var_1[self._id_0335][var_4];
            }
        }
    }

    if ( !isdefined( var_0 ) )
    {
        var_5 = [];

        if ( animscripts\utility::_id_9C3B() )
        {
            var_5[0] = %smg_exposed_backpedal;
            var_5[1] = %smg_exposed_idle_reactb;
        }
        else if ( isdefined( self._id_0C4D ) && self._id_0C4D == "s1_soldier" )
        {
            var_5[0] = %s1_exposed_backpedal;
            var_5[1] = %s1_exposed_idle_alert_v5;
        }
        else
        {
            var_5[0] = %exposed_backpedal;
            var_5[1] = %exposed_idle_reactb;
        }

        if ( isdefined( self._id_0142 ) && _func_0F0( self._id_0142._id_02E2, self._id_0359 ) < 65536 )
            self _meth_8193( "face enemy" );
        else
            self _meth_8193( "face point", self._id_0359 );

        if ( self.a._id_6E5A == "crouch" )
        {
            var_3 = _func_114( self._id_0359 - self._id_02E2 );
            var_6 = anglestoforward( self.angles );

            if ( _func_0F6( var_6, var_3 ) < -0.5 )
            {
                self _meth_8193( "face current" );
                var_5[0] = %crouch_cover_reaction_a;
                var_5[1] = %crouch_cover_reaction_b;
            }
        }

        var_0 = var_5[_func_0B2( var_5.size )];
    }

    return var_0;
}

_id_8E1A()
{
    self _meth_8144( %animscript_root, 0.2 );

    if ( _func_0B2( 4 ) < 3 )
    {
        self _meth_8193( "face enemy" );
        var_0 = %exposed_idle_reactb;

        if ( animscripts\utility::_id_9C3B() )
            var_0 = %smg_exposed_idle_reactb;

        self _meth_810F( "reactanim", var_0, 1, 0.2, 1 );
        var_1 = getanimlength( var_0 );
        animscripts\notetracks::_id_2D0B( var_1 * 0.8, "reactanim" );
        self _meth_8193( "face current" );
    }
    else
    {
        self _meth_8193( "face enemy" );
        var_2 = %exposed_backpedal;
        var_3 = %exposed_backpedal_v2;

        if ( animscripts\utility::_id_9C3B() )
        {
            var_2 = %smg_exposed_backpedal;
            var_3 = %smg_exposed_backpedal_v2;
        }

        self _meth_810F( "reactanim", var_2, 1, 0.2, 1 );
        var_1 = getanimlength( var_2 );
        animscripts\notetracks::_id_2D0B( var_1 * 0.8, "reactanim" );
        self _meth_8193( "face current" );
        self _meth_8144( %animscript_root, 0.2 );
        self _meth_810F( "reactanim", var_3, 1, 0.2, 1 );
        animscripts\shared::_id_2D06( "reactanim" );
    }
}

_id_60AB()
{
    self endon( "death" );
    self endon( "endNewEnemyReactionAnim" );
    self._id_55D2 = gettime();
    self.a._id_5F5B = "stop";
    self._id_6DB2 = 1;

    if ( isdefined( self._id_0669 ) && self.alertlevel != "combat" )
        _id_8E1A();
    else
    {
        var_0 = _id_4039();
        self _meth_8144( %animscript_root, 0.2 );
        self _meth_810F( "reactanim", var_0, 1, 0.2, 1 );
        animscripts\shared::_id_2D06( "reactanim" );
    }

    self notify( "newEnemyReactionDone" );
    self._id_6DB2 = undefined;
}

_id_60AC()
{
    self endon( "death" );

    if ( isdefined( self._id_2B24 ) )
        return;

    if ( !_id_1AD9() )
        return;

    if ( self.a._id_6E5A == "prone" || isdefined( self.a._id_6451 ) )
        return;

    self _meth_8192( "gravity" );

    if ( isdefined( self._id_0142 ) )
        _id_60AB();
}

_id_013F()
{
    if ( isdefined( self._id_6DB2 ) )
    {
        self notify( "newEnemyReactionDone" );
        self._id_6DB2 = undefined;
    }
}

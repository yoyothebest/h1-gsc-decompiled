// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );
    self _meth_8144( %root, 0.2 );
    self _meth_8144( %german_shepherd_run_stop, 0 );

    if ( !isdefined( self.traversecomplete ) && !isdefined( self._id_85C3 ) && self.a._id_5F5B == "run" && ( !isdefined( self._id_2B0E ) || self._id_2B0E == 0 ) )
        _id_8D2C();

    thread randomsoundduringrunloop();
    self.traversecomplete = undefined;
    self._id_85C3 = undefined;

    if ( self.a._id_5F5B == "run" )
    {
        var_0 = undefined;
        var_0 = getrunanimweights();
        self _meth_814F( %german_shepherd_run, var_0["center"], 0.2, 1 );
        self _meth_814F( %german_shepherd_run_lean_l, var_0["left"], 0.1, 1 );
        self _meth_814F( %german_shepherd_run_lean_r, var_0["right"], 0.1, 1 );
        self _meth_8154( "dog_run", %german_shepherd_run_knob, 1, 0.2, self._id_5F65 );
        animscripts\notetracks::_id_2D0B( 0.1, "dog_run" );
    }
    else
        self _meth_8115( "dog_walk", %german_shepherd_walk, 1, 0.2, self._id_5F65 );

    thread animscripts\dog\dog_stop::_id_585C( "normal" );

    for (;;)
    {
        moveloop();

        if ( self.a._id_5F5B == "run" )
        {
            if ( self._id_2AF3 == 0 )
                thread stopmove();

            common_scripts\utility::_id_A069( "run", "path_set" );
            self _meth_8144( %german_shepherd_run_stop, 0.1 );
        }
    }
}

moveloop()
{
    self endon( "killanimscript" );
    self endon( "stop_soon" );
    self._id_5F55 = undefined;

    for (;;)
    {
        if ( self._id_2AF3 )
            self._id_0411 = 0;
        else
            self._id_0411 = anim._id_2CDE;

        if ( isdefined( self._id_5F55 ) )
        {
            self [[ self._id_5F55 ]]();
            self._id_5F55 = undefined;
        }

        if ( isdefined( self._id_5F56 ) )
        {
            self [[ self._id_5F56 ]]();
            continue;
        }

        moveloopstep();
    }
}

moveloopstep()
{
    self endon( "move_loop_restart" );

    if ( self.a._id_5F5B == "run" )
    {
        var_0 = getrunanimweights();
        self _meth_8144( %german_shepherd_walk, 0.3 );
        self _meth_814D( %german_shepherd_run, var_0["center"], 0.2, 1 );
        self _meth_814D( %german_shepherd_run_lean_l, var_0["left"], 0.1, 1 );
        self _meth_814D( %german_shepherd_run_lean_r, var_0["right"], 0.1, 1 );
        self _meth_8154( "dog_run", %german_shepherd_run_knob, 1, 0.2, self._id_5F65 );
        animscripts\notetracks::_id_2D0B( 0.2, "dog_run" );
    }
    else
    {
        self _meth_8144( %german_shepherd_run_knob, 0.3 );
        self _meth_8113( "dog_walk", %german_shepherd_walk, 1, 0.2, self._id_5F65 );
        animscripts\notetracks::_id_2D0B( 0.2, "dog_walk" );
    }
}

pathchangecheck()
{
    self endon( "killanimscript" );
    self._id_4BB7 = undefined;

    for (;;)
    {
        self waittill( "path_changed", var_0, var_1 );

        if ( isdefined( self._id_4BB7 ) || isdefined( self._id_623F ) )
            continue;

        if ( self.a._id_5F5B != "run" )
            continue;

        var_2 = _func_0EB( self.angles[1] - _func_116( var_1 ) );
        var_3 = pathchange_getdogturnanim( var_2 );

        if ( isdefined( var_3 ) )
        {
            self._id_992D = var_3;
            self._id_993B = gettime();
            self._id_5F56 = ::pathchange_dodogturnanim;
            self notify( "move_loop_restart" );
        }
    }
}

pathchangecheck2()
{
    self endon( "killanimscript" );
    self._id_4BB7 = undefined;

    for (;;)
    {
        if ( self._id_0259 > 40 && !isdefined( self._id_5F56 ) && !isdefined( self._id_4BB7 ) && !isdefined( self._id_623F ) && self.a._id_5F5B == "run" )
        {
            var_0 = _func_116( self._id_0258 );
            var_1 = _func_0EB( self.angles[1] - var_0 );
            var_2 = pathchange_getdogturnanim( var_1 );

            if ( isdefined( var_2 ) )
            {
                self._id_992D = var_2;
                self._id_993B = gettime();
                self._id_5F56 = ::pathchange_dodogturnanim;
                self notify( "move_loop_restart" );
            }
        }

        wait 0.05;
    }
}

pathchange_getdogturnanim( var_0 )
{
    var_1 = undefined;

    if ( var_0 < -135 )
        var_1 = %german_shepherd_run_start_180_l;
    else if ( var_0 > 135 )
        var_1 = %german_shepherd_run_start_180_r;
    else if ( var_0 < -60 )
        var_1 = %german_shepherd_run_start_l;
    else if ( var_0 > 60 )
        var_1 = %german_shepherd_run_start_r;

    return var_1;
}

pathchange_dodogturnanim()
{
    self endon( "killanimscript" );
    self._id_5F56 = undefined;
    var_0 = self._id_992D;

    if ( gettime() > self._id_993B + 50 )
        return;

    self _meth_8192( "zonly_physics", 0 );
    self _meth_8144( %root, 0.2 );
    self._id_5F55 = ::pathchange_cleanupdogturnanim;
    self._id_4BB7 = 1;
    self _meth_8115( "turnAnim", var_0, 1, 0.2, self._id_5F65 );
    self _meth_8193( "face current" );
    var_1 = getanimlength( var_0 ) * self._id_5F65;
    animscripts\notetracks::_id_2D0B( var_1 * 0.2, "turnAnim" );
    self _meth_8193( "face motion" );
    self _meth_8192( "none", 0 );
    var_2 = self._id_04CB;
    self._id_04CB = 0.4;
    animscripts\notetracks::_id_2D0B( var_1 * 0.65, "turnAnim" );
    self._id_04CB = var_2;
    self._id_4BB7 = undefined;
}

pathchange_cleanupdogturnanim()
{
    self._id_4BB7 = undefined;
    self _meth_8193( "face default" );
    self _meth_8144( %root, 0.2 );
    self _meth_8192( "none", 0 );
}

startmovetracklookahead()
{
    self endon( "killanimscript" );

    for ( var_0 = 0; var_0 < 2; var_0++ )
    {
        var_1 = _func_115( self._id_0258 );
        self _meth_8193( "face angle", var_1 );
    }
}

playmovestartanim()
{
    self endon( "move_loop_restart" );

    if ( self._id_0259 == 0 )
        thread pathchangecheck2();
    else
    {
        var_0 = self._id_02E2;
        var_1 = anim._id_2CDC * 0.6;
        var_0 += self._id_0258 * var_1;
        var_2 = _func_0F0( self._id_02E2, self._id_02F8 ) < var_1 * var_1;
        var_3 = _func_115( self._id_0258 );

        if ( !var_2 && self _meth_81C7( var_0 ) )
        {
            var_4 = _func_0EB( var_3[1] - self.angles[1] );

            if ( var_4 >= 0 )
            {
                if ( var_4 < 45 )
                    var_5 = 8;
                else if ( var_4 < 135 )
                    var_5 = 6;
                else
                    var_5 = 3;
            }
            else if ( var_4 > -45 )
                var_5 = 8;
            else if ( var_4 > -135 )
                var_5 = 4;
            else
                var_5 = 1;

            self _meth_814F( anim.dogstartmoveanim[var_5], 1, 0.2, 1 );
            var_6 = self.angles[1] + anim.dogstartmoveangles[var_5];
            var_7 = _func_0EB( var_3[1] - var_6 );
            self _meth_8193( "face angle", self.angles[1] + var_7 );
            self _meth_8192( "zonly_physics", 0 );
            var_8 = getanimlength( anim.dogstartmoveanim[var_5] ) * self._id_5F65;
            animscripts\notetracks::_id_2D0B( var_8 * 0.6, "turnAnim" );
            self _meth_8193( "face motion" );
            self _meth_8192( "none", 0 );
            thread pathchangecheck2();
            animscripts\notetracks::_id_2D0B( var_8 * 0.25, "turnAnim" );
            return;
        }

        self _meth_8193( "face angle", var_3[1] );
        self _meth_8192( "none" );
        self._id_6F7A = self._id_04CB;
        self._id_04CB = 0.5;
        var_9 = _func_0EB( var_3[1] - self.angles[1] );

        if ( _func_0BE( var_9 ) > 20 )
        {
            if ( var_9 > 0 )
                var_10 = %german_shepherd_rotate_ccw;
            else
                var_10 = %german_shepherd_rotate_cw;

            self _meth_8115( "dog_turn", var_10, 1, 0.2, 1.0 );
            animscripts\shared::_id_2D06( "dog_turn" );
            self _meth_8144( %german_shepherd_rotate_cw, 0.2 );
            self _meth_8144( %german_shepherd_rotate_ccw, 0.2 );
        }

        thread pathchangecheck2();
        self._id_04CB = self._id_6F7A;
        self._id_6F7A = undefined;
        self _meth_8193( "face motion" );
    }
}

_id_8D2C()
{
    if ( isdefined( self._id_02F8 ) )
    {
        if ( isdefined( self._id_02F8 ) )
        {
            playmovestartanim();
            self _meth_8144( %root, 0.2 );
            return;
        }
    }

    self _meth_8193( "face default" );
    self _meth_810F( "dog_prerun", %german_shepherd_run_start, 1, 0.2, self._id_5F65 );
    animscripts\shared::_id_2D06( "dog_prerun" );
    self _meth_8192( "none", 0 );
    self _meth_8144( %root, 0.2 );
}

stopmove()
{
    self endon( "killanimscript" );
    self endon( "run" );
    self _meth_8144( %german_shepherd_run_knob, 0.1 );
    self _meth_8115( "stop_anim", %german_shepherd_run_stop, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "stop_anim" );
}

dogplaysoundandnotify( var_0, var_1 )
{
    _id_A5A4::_id_69C6( var_0, "tag_eye" );

    if ( _func_1A1( self ) )
        self notify( var_1 );
}

randomsoundduringrunloop()
{
    self endon( "killanimscript" );
    wait 0.2;

    for (;;)
    {
        var_0 = undefined;

        if ( isdefined( self._id_7A0B ) )
            var_0 = "anml_dog_growl";
        else if ( !isdefined( self._id_7A79 ) )
            var_0 = "anml_dog_bark";

        if ( !isdefined( var_0 ) )
            break;

        thread dogplaysoundandnotify( var_0, "randomRunSound" );
        self waittill( "randomRunSound" );
        wait(_func_0B5( 0.1, 0.3 ));
    }
}

getrunanimweights()
{
    var_0 = [];
    var_0["center"] = 0;
    var_0["left"] = 0;
    var_0["right"] = 0;

    if ( self._id_024A > 0 )
    {
        if ( self._id_024A < 0.95 )
            self._id_024A = 0.95;

        var_0["left"] = 0;
        var_0["right"] = ( 1 - self._id_024A ) * 20;

        if ( var_0["right"] > 1 )
            var_0["right"] = 1;
        else if ( var_0["right"] < 0 )
            var_0["right"] = 0;

        var_0["center"] = 1 - var_0["right"];
    }
    else if ( self._id_024A < 0 )
    {
        if ( self._id_024A > -0.95 )
            self._id_024A = -0.95;

        var_0["right"] = 0;
        var_0["left"] = ( 1 + self._id_024A ) * 20;

        if ( var_0["left"] > 1 )
            var_0["left"] = 1;

        if ( var_0["left"] < 0 )
            var_0["left"] = 0;

        var_0["center"] = 1 - var_0["left"];
    }
    else
    {
        var_0["left"] = 0;
        var_0["right"] = 0;
        var_0["center"] = 1;
    }

    return var_0;
}

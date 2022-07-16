// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

_id_4C7F()
{
    var_0 = [];
    var_0["straight_level"] = %prone_aim_5;
    var_0["legs_up"] = %prone_aim_feet_45up;
    var_0["legs_down"] = %prone_aim_feet_45down;
    var_0["fire"] = %prone_fire_1;
    var_0["semi2"] = %prone_fire_burst;
    var_0["semi3"] = %prone_fire_burst;
    var_0["semi4"] = %prone_fire_burst;
    var_0["semi5"] = %prone_fire_burst;
    var_0["single"] = [ %prone_fire_1 ];
    var_0["burst2"] = %prone_fire_burst;
    var_0["burst3"] = %prone_fire_burst;
    var_0["burst4"] = %prone_fire_burst;
    var_0["burst5"] = %prone_fire_burst;
    var_0["burst6"] = %prone_fire_burst;
    var_0["reload"] = %prone_reload;
    var_0["look"] = [ %prone_twitch_look, %prone_twitch_lookfast, %prone_twitch_lookup ];
    var_0["grenade_safe"] = [ %prone_grenade_a, %prone_grenade_a ];
    var_0["grenade_exposed"] = [ %prone_grenade_a, %prone_grenade_a ];
    var_0["exposed_idle"] = [ %prone_idle ];
    var_0["twitch"] = [ %prone_twitch_ammocheck, %prone_twitch_look, %prone_twitch_scan, %prone_twitch_lookfast, %prone_twitch_lookup ];
    var_0["hide_to_look"] = %coverstand_look_moveup;
    var_0["look_idle"] = %coverstand_look_idle;
    var_0["look_to_hide"] = %coverstand_look_movedown;
    var_0["look_to_hide_fast"] = %coverstand_look_movedown_fast;
    var_0["stand_2_prone"] = %stand_2_prone_nodelta;
    var_0["crouch_2_prone"] = %crouch_2_prone;
    var_0["prone_2_stand"] = %prone_2_stand_nodelta;
    var_0["prone_2_crouch"] = %prone_2_crouch;
    var_0["stand_2_prone_firing"] = %stand_2_prone_firing;
    var_0["crouch_2_prone_firing"] = %crouch_2_prone_firing;
    var_0["prone_2_stand_firing"] = %prone_2_stand_firing;
    var_0["prone_2_crouch_firing"] = %prone_2_crouch_firing;
    var_0["turn_left_45"] = %h1_prone_turn_l45;
    var_0["turn_left_90"] = %h1_prone_turn_l90;
    var_0["turn_left_180"] = %h1_prone_turn_180;
    var_0["turn_right_45"] = %h1_prone_turn_r45;
    var_0["turn_right_90"] = %h1_prone_turn_r90;
    var_0["turn_right_180"] = %h1_prone_turn_180;
    anim._id_0CCA["soldier"]["cover_prone"] = var_0;
}

setanimmodedelayed( var_0 )
{
    self endon( "killanimscript" );
    self endon( "killsetAnimModeDelayed" );
    wait(var_0);
    self _meth_8193( "face angle", self._id_22BA.angles[1] );
}

main()
{
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "cover_prone" );

    if ( _func_1B8( self._id_0513 ) == "rocketlauncher" )
    {
        animscripts\combat::main();
        return;
    }

    if ( isdefined( self.a._id_0D29 ) && self.a._id_0D29 == "prone_saw" )
        animscripts\cover_wall::_id_9C12( "saw_bipod_prone", "weapon_saw_MG_Setup", 0 );
    else if ( isdefined( self._id_02BB._id_9940 ) )
        animscripts\cover_wall::_id_9C15();

    if ( isdefined( self._id_0142 ) && _func_0F3( self._id_02E2 - self._id_0142._id_02E2 ) < _func_0E8( 512 ) )
    {
        thread animscripts\combat::main();
        return;
    }

    _id_80A3();
    self._id_993A = 50;
    self._id_22BA = self._id_02BB;
    self _meth_8193( "face angle", self.angles[1] );
    self.a._id_425B = 1;
    self _meth_81FD( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );

    if ( self.a._id_6E5A != "prone" )
    {
        self _meth_8193( "face angle", self._id_22BA.angles[1] );
        _id_701F( "prone" );
    }
    else
    {
        var_0 = 0;

        if ( self.a._id_5F5B != "stop" )
            var_0 = 0.15;

        animscripts\utility::_id_3308( var_0 );

        if ( var_0 != 0 )
        {
            var_1 = animscripts\utility::_id_06C4( self.angles[1] - self._id_22BA.angles[1] );
            var_2 = %h1_crawl_2_prone;
            var_3 = 0.4;

            if ( var_1 < -17.5 )
            {
                var_2 = %h1_crawl_2_prone_35r;
                var_3 = 0.25;
            }
            else if ( var_1 > 17.5 )
            {
                var_3 = 0.25;
                var_2 = %h1_crawl_2_prone_35l;
            }

            var_4 = getanimlength( var_2 );
            var_5 = var_4 * var_3;
            thread setanimmodedelayed( var_5 );
            self _meth_8115( "coverProneArrival", var_2, 1, 0.2, 1 );
            animscripts\shared::_id_2D06( "coverProneArrival" );
            self notify( "killsetAnimModeDelayed" );
            self.a._id_5F5B = "stop";
        }
    }

    thread animscripts\combat_utility::_id_0979();
    _id_8333( 0.2 );
    self _meth_814D( %prone_aim_5, 1, 0.1 );
    self _meth_8193( "face angle", self.angles[1] );
    self _meth_8192( "zonly_physics" );
    _id_7022();
    self notify( "stop_deciding_how_to_shoot" );
}

_id_013F()
{
    self.a._id_425B = undefined;
}

_id_4B87()
{
    self endon( "killanimscript" );
    self endon( "kill_idle_thread" );

    for (;;)
    {
        var_0 = animscripts\utility::_id_0C51( "prone_idle" );
        self _meth_8114( "idle", var_0 );
        self waittillmatch( "idle", "end" );
        self _meth_8144( var_0, 0.2 );
    }
}

_id_9B50( var_0 )
{
    self _meth_81FE( animscripts\utility::_id_5863( "cover_prone", "legs_up" ), animscripts\utility::_id_5863( "cover_prone", "legs_down" ), 1, var_0, 1 );
    self _meth_814D( %exposed_aiming, 1, 0.2 );
}

_id_2D88( var_0, var_1 )
{
    var_2 = isdefined( self._id_840F );
    var_3 = 1;
    var_4 = 0.2;
    var_5 = isdefined( self._id_0142 ) && !isdefined( self._id_993E ) && self _meth_81C3( self._id_0142, 2 ) && _func_0F0( self._id_0142._id_02E2, self._id_02E2 ) < 262144;

    if ( self.a._id_7B46 + 500 > gettime() )
    {
        var_4 = 0.25;

        if ( var_5 )
            thread animscripts\combat::_id_35BA();
    }
    else if ( var_5 )
    {
        var_6 = 1.0 - _func_0EE( self._id_0142._id_02E2, self._id_02E2 ) / 512;
        var_3 = 1 + var_6 * 1;

        if ( var_3 > 2 )
            var_4 = 0.05;
        else if ( var_3 > 1.3 )
            var_4 = 0.1;
        else
            var_4 = 0.15;
    }

    var_7 = 0;

    if ( var_1 > 157.5 )
        var_7 = 180;
    else if ( var_1 > 67.5 )
        var_7 = 90;
    else
        var_7 = 45;

    var_8 = "turn_" + var_0 + "_" + var_7;
    var_9 = animscripts\utility::_id_0C4E( var_8 );

    if ( isdefined( self._id_993E ) )
        self _meth_8192( "angle deltas", 0 );
    else if ( isdefined( self._id_02BB ) && isdefined( anim._id_50E3[self._id_02BB._id_04D9] ) && _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) < 256 )
        self _meth_8192( "angle deltas", 0 );
    else if ( animscripts\combat::_id_50B8( var_9 ) )
        animscripts\combat::_id_7444();
    else
        self _meth_8192( "angle deltas", 0 );

    self _meth_8149( %exposed_aiming, %body, 1, var_4 );
    self _meth_814E( %turn, 1, var_4 );

    if ( isdefined( self._id_4795 ) )
        var_3 = _func_0BF( 1.0, var_3 );

    self _meth_8110( "turn", var_9, 1, var_4, var_3 );
    self notify( "turning" );
    animscripts\combat::_id_2D89();
    self _meth_814E( %turn, 0, 0.2 );
    self _meth_8144( %turn, 0.2 );
    self _meth_8145( %exposed_aiming, 1, 0.2, 1 );

    if ( isdefined( self._id_9931 ) )
    {
        self._id_9931 = undefined;
        thread animscripts\combat::_id_35BA();
    }

    animscripts\combat::_id_7444( 0 );
    self notify( "done turning" );
}

_id_608A()
{
    if ( !isdefined( self.enableproneturn ) )
        return 0;

    var_0 = self._id_840F;

    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = self.angles[1] - _func_116( var_0 - self._id_02E2 );
    var_2 = _func_0F0( self._id_02E2, var_0 );

    if ( var_2 < 65536 )
    {
        var_3 = _func_0E7( var_2 );

        if ( var_3 > 3 )
            var_1 += _func_0B9( -3 / var_3 );
    }

    return animscripts\utility::_id_06C4( var_1 ) > self._id_993A;
}

_id_993D( var_0 )
{
    if ( var_0 < 0 - self._id_993A )
    {
        _id_2D88( "left", 0 - var_0 );
        _id_A537::_id_2A4D();
        return 1;
    }

    if ( var_0 > self._id_993A )
    {
        _id_2D88( "right", var_0 );
        _id_A537::_id_2A4D();
        return 1;
    }

    return 0;
}

coverproneneedtoturn()
{
    if ( _id_608A() )
    {
        var_0 = 0.25;

        if ( isdefined( self._id_83F6 ) && !_func_0D1( self._id_83F6 ) )
            var_0 = 1.5;

        var_1 = animscripts\shared::_id_4096( var_0 );

        if ( _id_993D( var_1 ) )
            return 1;
    }

    return 0;
}

_id_7022()
{
    self endon( "killanimscript" );
    thread animscripts\track::_id_9512();
    thread animscripts\shoot_behavior::_id_2743( "normal" );
    var_0 = gettime() > 2500;

    for (;;)
    {
        animscripts\utility::_id_9B2B();
        _id_9B50( 0.05 );

        if ( !var_0 )
        {
            wait(0.05 + _func_0B3( 1.5 ));
            var_0 = 1;
            continue;
        }

        if ( !isdefined( self._id_840F ) )
        {
            if ( coverproneneedtoturn() )
                continue;

            if ( _id_2152() )
                continue;

            wait 0.05;
            continue;
        }

        var_1 = _func_0F3( self._id_02E2 - self._id_840F );

        if ( self.a._id_6E5A != "crouch" && self _meth_81CF( "crouch" ) && var_1 < _func_0E8( 400 ) )
        {
            if ( var_1 < _func_0E8( 285 ) )
            {
                _id_701F( "crouch" );
                thread animscripts\combat::main();
                return;
            }
        }

        if ( coverproneneedtoturn() )
            continue;

        if ( _id_2152() )
            continue;

        if ( _id_7026( 0 ) )
            continue;

        if ( animscripts\combat_utility::_id_0976() )
        {
            animscripts\combat_utility::_id_8417();
            self _meth_8144( %add_fire, 0.2 );
            continue;
        }

        wait 0.05;
    }
}

_id_7026( var_0 )
{
    return animscripts\combat_utility::_id_0362( var_0, animscripts\utility::_id_0C4E( "reload" ) );
}

_id_80A3()
{
    self _meth_8177( self._id_02BB );
    self.a._id_0CD8 = animscripts\utility::_id_5864( "cover_prone" );
}

_id_98A5( var_0, var_1 )
{
    var_2 = undefined;

    if ( isdefined( var_1 ) && var_1 )
        var_2 = animscripts\utility::_id_0C51( "grenade_safe" );
    else
        var_2 = animscripts\utility::_id_0C51( "grenade_exposed" );

    self _meth_8192( "zonly_physics" );
    self._id_0231 = 1;
    var_3 = ( 32, 20, 64 );
    var_4 = animscripts\combat_utility::_id_989D( var_0, var_2 );
    self._id_0231 = 0;
    return var_4;
}

_id_2152()
{
    if ( isdefined( anim._id_933B ) && _func_1A1( level._id_0318 ) )
    {
        if ( _id_98A5( level._id_0318, 200 ) )
            return 1;
    }

    if ( isdefined( self._id_0142 ) )
        return _id_98A5( self._id_0142, 850 );

    return 0;
}

_id_8499()
{
    if ( !isdefined( self._id_0513 ) || !_func_1B2( self._id_0513 ) )
        return 0;

    if ( isdefined( self._id_02BB ) && _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) < 256 )
        return 0;

    if ( isdefined( self._id_0142 ) && self _meth_81C2( self._id_0142 ) && !isdefined( self._id_01CA ) && animscripts\shared::_id_3EE4() < 20 )
        return animscripts\move::_id_5A61();

    return 0;
}

_id_701F( var_0 )
{
    if ( var_0 == self.a._id_6E5A )
        return;

    self _meth_8144( %animscript_root, 0.3 );
    animscripts\combat_utility::_id_315E();

    if ( _id_8499() )
        var_1 = animscripts\utility::_id_0C4E( self.a._id_6E5A + "_2_" + var_0 + "_firing" );
    else
        var_1 = animscripts\utility::_id_0C4E( self.a._id_6E5A + "_2_" + var_0 );

    if ( var_0 == "prone" )
    {

    }

    self _meth_8112( "trans", var_1, %body, 1, 0.2, 1.0 );
    animscripts\shared::_id_2D06( "trans" );
    self _meth_814B( animscripts\utility::_id_0C4E( "straight_level" ), %body, 1, 0.25 );
    _id_8333( 0.25 );
}

_id_3799( var_0 )
{
    self endon( "killanimscript" );
    animscripts\shared::_id_2D06( var_0 );
}

_id_8333( var_0 )
{
    self _meth_8149( %prone_aim_5, %body, 1, var_0 );
    self _meth_814E( %prone_aim_2_add, 1, var_0 );
    self _meth_814E( %prone_aim_4_add, 1, var_0 );
    self _meth_814E( %prone_aim_6_add, 1, var_0 );
    self _meth_814E( %prone_aim_8_add, 1, var_0 );
}

_id_702B( var_0, var_1, var_2 )
{
    self _meth_8144( %animscript_root, 0.3 );
    var_3 = undefined;

    if ( _id_8499() )
    {
        if ( var_0 == "crouch" )
            var_3 = %prone_2_crouch_firing;
        else if ( var_0 == "stand" )
            var_3 = %prone_2_stand_firing;
    }
    else if ( var_0 == "crouch" )
        var_3 = %prone_2_crouch;
    else if ( var_0 == "stand" )
        var_3 = %prone_2_stand_nodelta;

    if ( isdefined( self._id_701C ) )
        var_3 = self._id_701C;

    if ( isdefined( self._id_701E ) )
        var_1 = self._id_701E;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    animscripts\utility::_id_344B( getanimlength( var_3 ) / 2 );
    self _meth_8112( "trans", var_3, %body, 1, 0.2, var_1 );
    animscripts\shared::_id_2D06( "trans" );

    if ( !isdefined( var_2 ) )
        var_2 = 0.1;

    self _meth_8144( var_3, var_2 );
}

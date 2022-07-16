// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init_hiding_door()
{
    common_scripts\utility::_id_76B9( "hiding_door_spawner", ::hiding_door_spawner );
}

hiding_door_spawner()
{
    var_0 = undefined;

    if ( isdefined( self._id_7A99 ) && common_scripts\utility::_id_3839( self._id_7A99 ) )
        var_0 = self._id_7A99;

    var_1 = undefined;

    if ( isdefined( self._id_7A99 ) && self._id_7A99 == "open_door_when_spawner_deleted" )
        var_1 = self._id_7A99;

    var_2 = getentarray( "hiding_door_guy_org", "targetname" );
    var_3 = common_scripts\utility::_id_3F33( self._id_02E2, var_2 );
    var_3._id_04A6 = undefined;
    var_4 = getentarray( var_3._id_04A4, "targetname" );
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( var_3._id_7A26 ) )
        var_7 = var_3 common_scripts\utility::_id_3DBC();

    if ( var_4.size == 1 )
        var_5 = var_4[0];
    else
    {
        foreach ( var_9 in var_4 )
        {
            if ( var_9.code_classname == "script_brushmodel" )
            {
                var_6 = var_9;
                continue;
            }

            if ( var_9.code_classname == "script_model" )
                var_5 = var_9;
        }
    }

    var_11 = getent( var_5._id_04A4, "targetname" );
    var_12 = undefined;

    if ( isdefined( var_11._id_04A4 ) )
        var_12 = getent( var_11._id_04A4, "targetname" );

    if ( isdefined( var_12 ) )
    {
        if ( isdefined( var_0 ) )
            var_12 thread toggle_pushplayerclip_with_flag( var_0 );

        var_3 thread hiding_door_guy_pushplayer( var_12 );

        if ( !isdefined( level._hiding_door_pushplayer_clips ) )
            level._hiding_door_pushplayer_clips = [];

        level._hiding_door_pushplayer_clips[level._hiding_door_pushplayer_clips.size] = var_12;
    }

    var_5 delete();
    var_13 = _id_A5A4::_id_88D1( "hiding_door" );
    var_3 thread _id_A510::_id_0BC7( var_13, "fire_3" );

    if ( isdefined( var_6 ) )
    {
        var_6 _meth_804F( var_13, "door_hinge_jnt" );
        var_13 _meth_8056();
    }

    if ( isdefined( var_11 ) )
    {
        var_11 _meth_804F( var_13, "door_hinge_jnt" );
        var_11 _meth_8059();
    }

    var_14 = undefined;

    if ( isdefined( self._id_04A4 ) )
    {
        var_14 = getent( self._id_04A4, "targetname" );

        if ( !_func_120( var_14.classname, "trigger" ) )
            var_14 = undefined;
    }

    if ( !isdefined( self._id_79DA ) && !isdefined( var_14 ) )
    {
        var_15 = 200;

        if ( isdefined( self._id_0351 ) )
            var_15 = self._id_0351;

        var_14 = spawn( "trigger_radius", var_3._id_02E2, 0, var_15, 48 );
    }

    if ( isdefined( var_7 ) )
        badplace_brush( var_7 _meth_81B5(), 0, var_7, "allies" );

    _id_A5A4::_id_0798( ::hiding_door_guy, var_3, var_14, var_13, var_11, var_7 );

    if ( isdefined( var_1 ) )
        thread hiding_door_spawner_cleanup( var_3, var_13, var_11, var_7 );
}

hiding_door_guy( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = hiding_door_starts_open( var_0 );
    self._id_0C72 = "hiding_door_guy";
    self endon( "death" );
    self endon( "damage" );
    self._id_01D0 = 2;
    _id_A5A4::_id_7E06( "death_2" );
    self.allowdeath = 1;
    self._id_01E6 = 50000;
    var_6 = [];
    var_6[var_6.size] = var_2;
    var_6[var_6.size] = self;
    thread hiding_door_guy_cleanup( var_0, self, var_2, var_3, var_4 );
    thread hiding_door_death( var_2, var_0, self, var_3, var_4 );

    if ( var_5 )
        var_0 thread _id_A510::_id_0BDD( var_6, "idle" );
    else
        var_0 thread _id_A510::_id_0BC5( var_6, "fire_3" );

    if ( isdefined( var_1 ) )
    {
        wait 0.05;
        var_1 waittill( "trigger" );
    }
    else
        common_scripts\utility::_id_384A( self._id_79DA );

    if ( var_5 )
    {
        var_0 notify( "stop_loop" );
        var_0 _id_A510::_id_0C18( var_6, "close" );
    }

    var_7 = 0;
    var_8 = 0;

    for (;;)
    {
        var_9 = level._id_0318;

        if ( isdefined( self._id_0142 ) )
            var_9 = self._id_0142;

        var_10 = hiding_door_get_enemy_direction( var_2.angles, self._id_02E2, var_9._id_02E2 );

        if ( player_entered_backdoor( var_10 ) )
        {
            if ( quit_door_behavior() )
                return;
        }

        if ( var_7 >= 2 )
        {
            if ( quit_door_behavior( 1 ) )
                return;
        }

        var_11 = undefined;

        if ( var_10 == "left" || var_10 == "front" )
            var_11 = "fire_3";
        else if ( var_10 == "right" )
        {
            var_11 = "fire_1";

            if ( common_scripts\utility::_id_2006() )
                var_11 = "fire_2";
        }
        else
        {
            var_0 _id_A510::_id_0C18( var_6, "open" );
            var_0 _id_A510::_id_0C18( var_6, "close" );
            var_7++;
            continue;
        }

        if ( hiding_door_guy_should_charge( var_10, var_9, var_8 ) )
        {
            var_11 = "jump";

            if ( common_scripts\utility::_id_2006() )
            {
                if ( self _meth_81C7( animscripts\utility::_id_3EFC( level._id_78AC[self._id_0C72]["kick"] ) ) )
                    var_11 = "kick";
            }

            thread hiding_door_death_door_connections( var_3, var_4 );
            var_0 notify( "push_player" );
            self notify( "charge" );
            self.allowdeath = 1;
            self._id_01E6 = 100;
            _id_A5A4::_id_1EAB();
            var_0 _id_A510::_id_0C18( var_6, var_11 );
            quit_door_behavior();
            return;
        }

        if ( hiding_door_guy_should_throw_grenade( var_10, var_8 ) )
        {
            self._id_01D0--;
            var_11 = "grenade";
        }

        var_7 = 0;
        var_8++;
        var_0 thread _id_A510::_id_0C18( var_6, var_11 );
        _id_A5A4::_id_27EF( 0.05, _id_A510::_id_0C15, var_6, var_11, 0.3 );
        var_0 waittill( var_11 );
        var_0 thread _id_A510::_id_0BC5( var_6, "open" );
        wait(_func_0B5( 0.2, 1.0 ));
        var_0 notify( "stop_loop" );
    }
}

quit_door_behavior( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( var_0 )
    {
        if ( !_func_08E( level._id_0318 _meth_80AA(), self _meth_80AA(), 0, self ) )
            return 0;
    }

    self._id_01E6 = 100;
    _id_A5A4::_id_1EAB();
    self._id_01C4 = 512;
    self _meth_81AA( self._id_02E2 );
    self notify( "quit_door_behavior" );
    self _meth_8143();
    self notify( "killanimscript" );
    return 1;
}

player_entered_backdoor( var_0 )
{
    if ( var_0 != "behind" )
        return 0;

    var_1 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

    if ( var_1 > 250 )
        return 0;

    if ( !_func_08E( level._id_0318 _meth_80AA(), self _meth_80AA(), 0, self ) )
        return 0;

    return 1;
}

hiding_door_guy_should_charge( var_0, var_1, var_2 )
{
    var_3 = 3;
    var_4 = 100;
    var_5 = 600;

    if ( var_2 < var_3 )
        return 0;

    if ( var_1 != level._id_0318 )
        return 0;

    if ( var_0 != "front" )
        return 0;

    var_6 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

    if ( var_6 < var_4 )
        return 0;

    if ( var_6 > var_5 )
        return 0;

    return common_scripts\utility::_id_2006();
}

hiding_door_guy_should_throw_grenade( var_0, var_1 )
{
    if ( var_1 < 1 )
        return 0;

    if ( var_0 == "behind" )
        return 0;

    if ( _func_0B2( 100 ) < 25 * self._id_01D0 )
        return 1;

    return 0;
}

hiding_door_get_enemy_direction( var_0, var_1, var_2 )
{
    var_3 = anglestoforward( var_0 );
    var_4 = _func_114( var_3 );
    var_5 = _func_115( var_4 );
    var_6 = _func_115( var_2 - var_1 );
    var_7 = var_5[1] - var_6[1];
    var_7 += 360;
    var_7 = _func_0BC( var_7 ) % 360;
    var_8 = undefined;

    if ( var_7 >= 90 && var_7 <= 270 )
        var_8 = "behind";
    else if ( var_7 >= 300 || var_7 <= 45 )
        var_8 = "front";
    else if ( var_7 < 90 )
        var_8 = "right";
    else if ( var_7 > 270 )
        var_8 = "left";

    return var_8;
}

hiding_door_spawner_cleanup( var_0, var_1, var_2, var_3 )
{
    self endon( "spawned" );
    self waittill( "death" );
    waittillframeend;
    var_0 notify( "stop_loop" );
    thread hiding_door_death_door_connections( var_2, var_3 );
    var_0 notify( "push_player" );

    if ( !isdefined( var_1.played_death_anim ) )
    {
        var_1.played_death_anim = 1;
        var_0 thread _id_A510::_id_0C24( var_1, "death_2" );
    }
}

hiding_door_guy_cleanup( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 endon( "charge" );
    var_1 common_scripts\utility::_id_A087( "death", "quit_door_behavior" );
    var_0 notify( "stop_loop" );
    thread hiding_door_death_door_connections( var_3, var_4 );
    var_0 notify( "push_player" );

    if ( !isdefined( var_2.played_death_anim ) )
    {
        var_2.played_death_anim = 1;
        var_0 thread _id_A510::_id_0C24( var_2, "death_2" );
    }
}

hiding_door_guy_pushplayer( var_0 )
{
    self waittill( "push_player" );
    var_0 _meth_82AA( self._id_02E2, 1.5 );
    wait 1.5;
    var_0 delete();
}

toggle_pushplayerclip_with_flag( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        common_scripts\utility::_id_384A( var_0 );
        self _meth_82BB();
        common_scripts\utility::_id_3857( var_0 );
        self _meth_82BA();
    }
}

hiding_door_guy_grenade_throw( var_0 )
{
    var_1 = var_0 _meth_8184( "J_Wrist_RI" );
    var_2 = _func_0EE( level._id_0318._id_02E2, var_0._id_02E2 ) * 2.0;

    if ( var_2 < 300 )
        var_2 = 300;

    if ( var_2 > 1000 )
        var_2 = 1000;

    var_3 = _func_114( level._id_0318._id_02E2 - var_0._id_02E2 );
    var_4 = var_3 * var_2;
    var_0 _meth_803A( var_1, var_4, _func_0B5( 3.0, 5.0 ) );
}

hiding_door_death( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 endon( "charge" );
    var_2 endon( "quit_door_behavior" );
    var_2 waittill( "damage", var_5, var_6 );

    if ( !_func_1A1( var_2 ) )
        return;

    thread hiding_door_death_door_connections( var_3, var_4 );
    var_1 notify( "push_player" );
    var_1 thread _id_A510::_id_0C24( var_2, "death_2" );

    if ( !isdefined( var_0.played_death_anim ) )
    {
        var_0.played_death_anim = 1;
        var_1 thread _id_A510::_id_0C24( var_0, "death_2" );
    }

    var_2 maps\_cheat::melonhead_remove_melon( 1, 1 );
    wait 0.5;

    if ( _func_1A1( var_2 ) )
    {
        if ( isdefined( var_6 ) )
            var_2 _meth_8054( ( 0, 0, 0 ), var_6 );
        else
            var_2 _meth_8054( ( 0, 0, 0 ) );
    }
}

hiding_door_death_door_connections( var_0, var_1 )
{
    wait 2;

    if ( isdefined( var_0 ) )
        var_0 _meth_8059();

    if ( isdefined( var_1 ) )
        badplace_delete( var_1 _meth_81B5() );
}

hiding_door_starts_open( var_0 )
{
    return isdefined( var_0._id_0398 ) && var_0._id_0398 == "starts_open";
}

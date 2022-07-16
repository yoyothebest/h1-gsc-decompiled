// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

orientmodehack_axis( var_0 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "death" );
    self endon( "unloading" );

    for (;;)
    {
        var_0 _meth_8193( "face angle", _func_115( level._id_0318._id_02E2 - var_0._id_02E2 )[1] );
        wait 0.05;
    }
}

player_fudge_move_rotate_to( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 _meth_8051();
    var_4 = _func_0EE( level._id_0318._id_02E2, var_0 );
    var_5 = var_4 / var_2;
    var_6 = var_5 * 0.05;
    var_7 = var_5 * 0.05;
    var_3 _meth_82AA( var_0, var_5, var_6, var_7 );
    var_3 _meth_82B1( var_1, var_5, var_6, var_7 );
    wait(var_5);
    level._id_0318 _meth_8051();
}

attacknow()
{
    self waittill( "trigger", var_0 );
    var_0.attacknow = 1;
    var_0 notify( "attacknow" );
}

player_link_update( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level.playerlinkinfluence;

    level._id_0318 _meth_807E( level.playerlinkmodel, "polySurface1", var_0 );
}

player_link_update_delta( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level.playerlinkinfluence;

    level._id_0318 _meth_807F( level.playerlinkmodel, "polySurface1", var_0 );
}

fake_position( var_0, var_1 )
{
    var_0 _meth_8056();

    if ( var_1 == 999 )
    {
        level._id_0318 _meth_8051();
        level.playerlinkmodel = var_0;
    }
    else
    {
        if ( var_1 == 888 )
        {
            self.rpgguyspot = var_0;
            return;
        }

        if ( var_1 == 336 )
        {
            var_0 _meth_82BC( 1 );
            var_0 _meth_8055();
            return;
        }

        if ( var_1 == 339 )
        {
            self _meth_8056();
            var_0 _meth_8055();
            return;
        }

        if ( var_1 == 237 )
            return put_stinger_guy_here( var_0 );

        if ( var_1 == 532 )
        {
            var_0 thread rpg_spot( self );
            return;
        }

        if ( var_1 == 533 )
        {
            var_0 _meth_8056();
            self.rpgguyspotsecondary = var_0;
            return;
        }

        var_2 = undefined;

        for ( var_3 = 0; var_3 < self._id_750A.size; var_3++ )
        {
            if ( self._id_750A[var_3]._id_9D1B == var_1 )
                var_2 = self._id_750A[var_3];
        }

        if ( !isdefined( var_2 ) )
            return;

        var_2 _meth_8051();
        var_4 = "polySurface1";
        var_2 _meth_804F( var_0, var_4, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        wait 1;

        if ( !_func_0CF( var_2 ) )
        {
            guy_force_remove_from_vehicle( self, var_2 );
            var_2 thread rider_droneai( var_0, var_4, self );
            return;
        }

        guy_force_remove_from_vehicle( self, var_2 );
        thread whackamole( var_2 );
    }
}

put_stinger_guy_here( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 0; var_2 < self._id_750A.size; var_2++ )
    {
        if ( _func_120( self._id_750A[var_2].classname, "stinger" ) )
        {
            var_1 = self._id_750A[var_2];
            break;
        }
    }

    if ( !isdefined( var_1 ) )
        return;

    waitframe;
    var_1 _meth_8051();
    var_1 _meth_804F( var_0, "polySurface1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

in_getweaponslist( var_0 )
{
    var_1 = level._id_0318 _meth_8308();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

rpg_spot( var_0 )
{
    self _meth_8056();
    level waittill( "newrpg" );
    var_1 = 0;
    var_2 = "rpg";
    var_3 = spawn( "weapon_" + var_2, self._id_02E2, 1 );
    var_3 _meth_8056();
    var_3.angles = self.angles;
    var_3 _meth_804F( self );
    var_0.jeepride_linked_weapon = var_3;
    wait 0.1;
    var_3 _meth_8055();
    thread lookattopickup( var_3 );
    var_0 thread registerdroppedweapon();

    while ( !in_getweaponslist( var_2 ) )
        wait 0.05;

    level._id_0318 _meth_832F( var_2 );
    common_scripts\utility::_id_383F( "rpg_taken" );
    var_4 = level._id_0318 _meth_82F6( "rpg" );

    if ( getdvar( "player_sustainAmmo" ) == "0" )
    {
        while ( level._id_0318 _meth_82F6( "rpg" ) == var_4 && var_4 )
            wait 0.05;
    }

    common_scripts\utility::_id_383F( "rpg_shot" );
    var_5 = 0;
}

lookattopickup( var_0 )
{
    while ( isdefined( var_0 ) )
        waittillframeend;

    level._id_0318 _meth_82C7();

    while ( isdefined( self ) )
    {
        if ( isdefined( level._id_0318 _meth_83FE( self._id_02E2, 65 ) ) )
            level._id_0318 _meth_82C8();
        else
            level._id_0318 _meth_82C7();

        waittillframeend;
    }

    level._id_0318 _meth_82C8();
}

registerdroppedweapon()
{
    self endon( "death" );

    for (;;)
    {
        level._id_0318 waittill( "pickup", var_0, var_1 );
        self.jeepride_linked_weapon = var_1;
    }
}

local_drone_animontag( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
        var_4 endon( "attacknow" );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = self _meth_8184( var_1 );
    var_6 = self _meth_8185( var_1 );
    var_7 = "animontag";
    var_0 _meth_8140( var_7, var_5, var_6, var_2 );

    if ( !var_3 )
        var_0 waittillmatch( var_7, "end" );
    else
        wait 0.05;

    var_0 notify( "droneanimfinished" );
}

rider_drone_toai( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_A5A4::_id_9007( var_0 );
    var_4 _meth_804F( var_1, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_1 thread local_drone_animontag( var_4, var_2, var_3 );
    var_4._id_28B4 = "crouch";
    var_4 _meth_81CE( "crouch" );
    var_4 thread animscripts\utility::_id_9AF5();
    var_4 _meth_81CE( "stand", "crouch" );
    thread whackamole( var_4 );
}
#using_animtree("generic_human");

rider_droneai( var_0, var_1, var_2 )
{
    if ( !( isdefined( self._id_0398 ) && self._id_0398 == "whackamole_guy" ) )
        return;

    self endon( "death" );
    var_3 = "coverstand";
    var_4 = [];
    var_5 = "coverstand";
    var_4[var_5] = [];
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch01;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch02;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch03;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch04;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle_twitch05;
    var_4[var_5][var_4[var_5].size] = %coverstand_look_quick;
    var_4[var_5][var_4[var_5].size] = %coverstand_look_quick;
    var_4[var_5][var_4[var_5].size] = %coverstand_look_quick;
    var_4[var_5][var_4[var_5].size] = %coverstand_hide_idle;
    var_5 = "crouch";
    var_4[var_5] = [];
    var_4[var_5][var_4[var_5].size] = %exposed_crouch_aim_5;
    var_4[var_5][var_4[var_5].size] = %exposed_crouch_reload;
    var_4[var_5][var_4[var_5].size] = %exposed_crouch_reload;
    var_6 = [];
    var_5 = "coverstand_up";
    var_6[var_5] = [];
    var_6[var_5][var_6[var_5].size] = %coverstand_hide_2_aim;
    var_5 = "crouch_up";
    var_6[var_5] = [];
    var_6[var_5][var_6[var_5].size] = %crouch2stand;
    var_7 = [];
    var_5 = "crouch_down";
    var_7[var_5] = [];
    var_7[var_5][var_7[var_5].size] = %stand2crouch_attack;
    var_5 = "crouch_down";
    var_7[var_5] = [];
    var_7[var_5][var_7[var_5].size] = %stand2crouch_attack;
    var_2 endon( "death" );
    var_2.attacknow = 0;
    var_8 = 0;

    while ( !var_2.attacknow )
    {
        var_9 = _func_1D3( var_4 );
        var_8 = _func_0B2( var_9.size );
        var_5 = var_9[var_8];
        var_8 = _func_0B2( var_4[var_5].size );
        var_0 local_drone_animontag( self, var_1, var_4[var_5][var_8], undefined, var_2 );
    }

    var_2 thread rider_drone_toai( self, var_0, var_1, var_4[var_5][var_8] );
}

apply_truckjunk_loc( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_0._id_9882[var_2];

        if ( isdefined( var_1[var_2]._id_7ADC ) )
            var_0 thread fake_position( var_3, var_1[var_2]._id_7ADC );

        if ( isdefined( var_1[var_2]._id_0398 ) && var_1[var_2]._id_0398 == "loosejunk" )
            var_3 thread loosejunk( var_0 );
    }
}

process_vehicles_spawned()
{
    for (;;)
    {
        self waittill( "spawned", var_0 );

        if ( var_0._id_04FF == "bmp" )
            continue;

        if ( var_0._id_7AEF == "allies" )
            var_0 thread riders_godon();

        var_0 thread tire_deflate();
        var_0 thread _id_A5A8::_id_4259();

        if ( isdefined( var_0._id_9882 ) )
            apply_truckjunk_loc( var_0, self._id_9882 );

        var_0 thread kill_stupid_vehicle_threads();
        var_0 thread freeonend();
        var_0 thread joltonend();
        var_0 thread maps\jeepride_aud::stop_unimportant_vehicle();

        if ( isdefined( level.playersride ) )
            var_0 thread maps\jeepride_aud::passby_sfx();

        var_0.customvehicletodummytransferfunc = ::jeepride_custom_vehicle_to_dummy;
    }
}

joltonend()
{
    self waittill( "reached_end_node" );
    self _meth_8250( self._id_02E2 + ( 32, 32, 64 ), 1.5 );
}

kill_stupid_vehicle_threads()
{
    waitframe;
    _id_A5AA::_id_9CEF();
    _id_A5A8::_id_9CF1();
    _id_A5AA::vehicle_kill_disconnect_paths_forever();
}

_id_6AC6()
{
    level._id_0318 waittill( "death" );
    common_scripts\utility::_id_0D13( _id_A5A8::get_script_vehicles(), ::deadplayer_stop );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_811C( 0 );
}

deadplayer_stop()
{
    if ( _id_A5A8::_id_5118() )
        return;

    self _meth_827F( 0, 25 );
}

spawners_setup()
{
    self waittill( "spawned", var_0 );
    waitframe;

    if ( !isdefined( var_0 ) )
        return;

    remember_weaponsondeath( var_0 );
    var_0 add_death_function( ::remember_weaponsondeath );

    if ( common_scripts\utility::_id_382E( "bridge_zakhaev_setup" ) )
    {
        var_0.a._id_2B18 = 1;
        var_0._id_0135 = 0;
    }

    if ( common_scripts\utility::_id_382E( "end_ride" ) )
        return;

    if ( isdefined( var_0.a._id_7594 ) && var_0.a._id_7594 && var_0._id_0513 == "stinger_speedy" )
        var_0 thread rocket_handle();

    var_0.a._id_2B18 = 1;
    var_0 endon( "death" );
    var_0._id_0135 = 0;
}

sethindtarget( var_0 )
{
    if ( isdefined( var_0 ) )
        self.hindenemy = var_0;
    else
        var_0 = self.hindenemy;

    var_1 = spawn( "script_origin", var_0 _meth_8184( "tag_light_belly" ) );
    var_1._id_02E2 = var_0 _meth_8184( "tag_light_belly" ) + ( 0, 0, -24 );
    var_1 _meth_804F( var_0 );
    var_1 thread attractorent_delete_on_vehicle_death( var_0 );
    self _meth_816C();
    self _meth_816B( var_1 );
    self._id_83F6 = var_1;
    self._id_840F = self._id_83F6 _meth_8099();
    self.attractorent = var_1;
    self._id_8415 = "single";
    self.hindenemy = var_0;
}

attractorent_delete_on_vehicle_death( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

_id_7DD2()
{
    self.a._id_0CD8 = [];
    self.a._id_0CD8["add_aim_up"] = %rpg_stand_aim_8;
    self.a._id_0CD8["add_aim_down"] = %rpg_stand_aim_2;
    self.a._id_0CD8["add_aim_left"] = %rpg_stand_aim_4;
    self.a._id_0CD8["add_aim_right"] = %rpg_stand_aim_6;
    self.a._id_0CD8["fire"] = %rpg_stand_fire;
    self.a._id_0CD8["straight_level"] = %rpg_stand_aim_5;
    self.a._id_0CD8["reload"] = animscripts\utility::_id_0CD8( %rpg_stand_reload );
    self.a._id_0CD8["reload_crouchhide"] = animscripts\utility::_id_0CD8();
    self.a._id_0CD8["exposed_idle"] = animscripts\utility::_id_0CD8( %rpg_stand_idle );
    self.a._id_0CD8["single"] = animscripts\utility::_id_0CD8( %exposed_shoot_semi1 );
    self.a._id_0CD8["crouch_2_stand"] = %exposed_crouch_2_stand;
    self.a._id_0CD8["crouch_2_prone"] = %crouch_2_prone;
    self.a._id_0CD8["stand_2_crouch"] = %exposed_stand_2_crouch;
    self.a._id_0CD8["stand_2_prone"] = %stand_2_prone;
    self.a._id_0CD8["prone_2_crouch"] = %prone_2_crouch;
    self.a._id_0CD8["prone_2_stand"] = %prone_2_stand;
    self.a._id_0CD8["turn_left_45"] = %exposed_tracking_turn45l;
    self.a._id_0CD8["turn_left_90"] = %exposed_tracking_turn90l;
    self.a._id_0CD8["turn_left_135"] = %exposed_tracking_turn135l;
    self.a._id_0CD8["turn_left_180"] = %exposed_tracking_turn180l;
    self.a._id_0CD8["turn_right_45"] = %exposed_tracking_turn45r;
    self.a._id_0CD8["turn_right_90"] = %exposed_tracking_turn90r;
    self.a._id_0CD8["turn_right_135"] = %exposed_tracking_turn135r;
    self.a._id_0CD8["turn_right_180"] = %exposed_tracking_turn180l;
    self.a._id_0CD8["add_turn_aim_up"] = %exposed_turn_aim_8;
    self.a._id_0CD8["add_turn_aim_down"] = %exposed_turn_aim_2;
    self.a._id_0CD8["add_turn_aim_left"] = %exposed_turn_aim_4;
    self.a._id_0CD8["add_turn_aim_right"] = %exposed_turn_aim_6;
    self._id_993A = 35;
    self._id_037C = 45;
    self._id_024D = -45;
    self._id_04E1 = 45;
    self._id_0133 = -45;
    self.turnleft180limit = -130;
    self.turnright180limit = 130;
    self.turnleft90limit = -70;
    self.turnright90limit = 70;
}

rpg_guy_animcustom_setup()
{
    _id_7DD2();
    self.a._id_5F5B = "stop";
    self._id_6F67 = 0.0;
    self _meth_8144( %root, 0.2 );
    self _meth_814D( animscripts\utility::_id_0C4E( "straight_level" ) );
    self _meth_814D( %add_idle );
    self _meth_8144( %aim_4, 0.2 );
    self _meth_8144( %aim_6, 0.2 );
    self _meth_8144( %aim_2, 0.2 );
    self _meth_8144( %aim_8, 0.2 );
    animscripts\combat_utility::_id_82F8( 0.2 );
    thread _id_4B87();
    self.a._id_5B90 = "aim";
    self.twitchallowed = 1;
}

_id_A258()
{
    self endon( "death" );
    self._id_83F7 = ( 0, 0, 0 );
    var_0 = undefined;
    var_1 = self._id_02E2;
    var_2 = 0.15;

    for (;;)
    {
        if ( isdefined( self._id_0142 ) && isdefined( var_0 ) && self._id_0142 == var_0 )
        {
            var_3 = self._id_0142._id_02E2;
            self._id_83F7 = _id_A5A4::vector_multiply( var_3 - var_1, 1 / var_2 );
            var_1 = var_3;
        }
        else
        {
            if ( isdefined( self._id_0142 ) )
                var_1 = self._id_0142._id_02E2;
            else
                var_1 = self._id_02E2;

            var_0 = self._id_0142;
            self._id_83F7 = ( 0, 0, 0 );
        }

        wait(var_2);
    }
}

_id_2743()
{
    self notify( "stop_deciding_how_to_shoot" );
    self endon( "stop_deciding_how_to_shoot" );
    self endon( "death" );
    self._id_840E = "normal";
    self._id_3672 = 0;
    self._id_84A7 = undefined;
    self._id_1C86 = 0;
    var_0 = self._id_83F6;
    var_1 = self._id_840F;
    var_2 = self._id_8415;
}

_id_4B87()
{
    self endon( "kill_local_animcustoms" );

    for (;;)
    {
        var_0 = animscripts\utility::_id_0C51( "exposed_idle" );
        self _meth_8114( "idle", var_0 );
        self waittillmatch( "idle", "end" );
        self _meth_8144( var_0, 0.2 );
    }
}

_id_9512()
{
    self endon( "killanimscript" );
    self endon( "death" );
    self endon( "kill_local_animcustoms" );
    animscripts\track::_id_9502( %aim_2, %aim_4, %aim_6, %aim_8 );
}

suppress_animscripts()
{
    self endon( "death" );

    for (;;)
    {
        self notify( "killanimscript" );
        waitframe;
        self notify( "killanimscript" );
        wait 0.05;
    }
}

rpg_guy_animcustom()
{
    self endon( "death" );
    self endon( "kill_local_animcustoms" );
    rpg_guy_animcustom_setup();
    animscripts\track::_id_7F21( 0 );
    thread _id_9512();
    thread _id_2743();
    thread _id_A258();
    self _meth_8192( "zonly_physics", 0 );
    self _meth_8193( "face angle", self.angles[1] );
    self.a._id_7B46 = gettime();
    self._id_2660 = undefined;
    _id_7DD2();
    self._id_83F6 = self._id_0142;
    self._id_840F = self._id_83F6._id_02E2;

    while ( animscripts\combat::_id_608A() )
    {
        var_0 = 0.25;

        if ( isdefined( self._id_0142 ) && !_func_0D1( self._id_0142 ) )
            var_0 = 1.5;

        var_1 = animscripts\shared::_id_4096( var_0 );

        if ( animscripts\combat::_id_993D( var_1 ) )
        {
            wait 0.05;
            continue;
        }

        wait 0.05;
    }

    if ( !has_hind_enemy() )
        return;

    self _meth_81EA();
    self._id_01FB = 1;
    self._id_83F6 = self._id_0142;
    self._id_840F = self._id_83F6._id_02E2;
    level thread vehicle_dropflare( self.hindenemy, self.attractorent );
    self _meth_8144( %add_fire, 0.2 );
    wait(_func_0B5( 5, 9 ));
    self._id_83F6 = undefined;
    self._id_840F = undefined;
}

has_hind_enemy()
{
    return isdefined( self.hindenemy );
}

orientmodehack_axis_2( var_0 )
{
    self notify( "orientmodehack_axis_2" );
    self endon( "orientmodehack_axis_2" );
    self endon( "death" );
    self endon( "unloading" );
    var_0 endon( "death" );

    for (;;)
    {
        self _meth_8193( "face angle", _func_115( var_0._id_02E2 - self._id_02E2 )[1] );
        wait 0.05;
    }
}

attractorent_link( var_0 )
{

}

rocket_handle()
{
    self endon( "death" );
    wait 1;

    if ( !isdefined( self._id_750E ) )
        return;

    var_0 = self._id_750E;
    self.rocketattachpos = self._id_9D1B;
    guy_force_remove_from_vehicle( var_0, self );
    self _meth_81CE( "crouch", "stand" );

    if ( !isdefined( var_0.rocketmen ) )
        var_0.rocketmen = [];

    var_0.rocketmen[var_0.rocketmen.size] = self;
    self._id_01FB = 1;
    self.a._id_7594 = 400;
    var_1 = self.a._id_7594;

    for (;;)
    {
        self._id_01FB = 1;

        while ( !isdefined( self.hindenemy ) )
            wait 0.05;

        self._id_01FB = 0;
        self _meth_819E( ::rpg_guy_animcustom );

        while ( isdefined( self._id_83F6 ) && isdefined( self.hindenemy ) )
            wait 0.05;

        wait 0.05;
        self notify( "kill_local_animcustoms" );

        if ( isdefined( self.hindenemy ) )
            sethindtarget();
    }
}

donothing()
{
    for (;;)
        wait 1;
}

magic_missileguy_magiccrouch()
{
    self endon( "death" );
    self _meth_8056();
    self._id_28B4 = "crouch";
    self _meth_81CE( "crouch" );
    thread animscripts\utility::_id_9AF5();
    wait 1.5;
    self _meth_8055();
    self._id_28B4 = "stand";
    self _meth_81CE( "stand" );
    thread animscripts\utility::_id_9AF5();
    wait 3;
    self notify( "missileready" );
}

magic_missileguy_spawner()
{
    var_0 = _func_1EC( self._id_04A4, "targetname" );
    var_0 waittill( "trigger", var_1 );

    if ( isdefined( var_1.magic_missile_guy ) )
        return;

    level._id_8A1C = ::save_fail_on_rpgguy;
    var_2 = var_1.rpgguyspot;
    self._id_02E2 = var_2._id_02E2;
    self.angles = _func_115( level._id_0318 _meth_80AA() - self._id_02E2 );
    var_3 = _id_A5A4::_id_2F29( self );
    var_4 = getentarray( "assist_brush", "targetname" )[0];
    var_4 _meth_82BB();
    var_4 _meth_8051();
    var_4 _meth_804F( var_3, "J_Head", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4 _meth_81B9();
    var_4 _meth_8056();
    var_5 = "polySurface1";
    var_3 _meth_804F( var_2, var_5, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_1.magic_missile_guy = var_3;
    var_6 = spawn( "script_model", level._id_0318 _meth_80AA() );
    var_6._id_02E2 = level._id_0318 _meth_80AA() + _id_A5A4::vector_multiply( anglestoforward( self.angles ), 64 );
    var_6 _meth_8056();
    var_6 _meth_80B3( "fx" );
    var_6 _meth_804F( level.playersride );
    player_link_update( 0.1 );
    var_3._id_0112 = 0;
    var_3 thread _id_A581::_id_08D3();
    var_3 _id_A524::_id_5E3F();
    var_3 thread magic_missileguy_takehits( var_1, var_6 );
    var_3 thread magic_missileguy_rpg( var_1, var_2, var_5, var_6 );
}

reset_autosave_condition()
{
    level._id_8A1C = undefined;
}

magic_missileguy_takehits( var_0, var_1 )
{
    self _meth_82BC( 1 );
    self._id_01E6 = 4000;
    var_0 endon( "death" );
    var_2 = 100;

    for (;;)
    {
        self waittill( "damage", var_3, var_4 );

        if ( _func_1AD( var_4 ) )
            break;

        self._id_01E6 = 4000;
    }

    player_link_update();
    level notify( "kill_confirm" );
    var_0.magic_missile_guy = undefined;
    self _meth_8054();

    if ( getdvar( "ragdoll_enable" ) != "0" )
        self _meth_8051();

    self _meth_8143();
    var_5 = %death_stand_dropinplace;
    self _meth_8140( "death_stand_dropinplac", self._id_02E2, self.angles, var_5 );
    thread ragdoll_or_death_duringanimation( var_5 );
}

ragdoll_or_death_duringanimation( var_0 )
{
    var_1 = 0.2;
    var_2 = getanimlength( var_0 );
    var_3 = gettime() + var_2 * 1000;
    wait(var_2 * 0.2);

    if ( getdvar( "ragdoll_enable" ) == "0" )
    {
        wait(var_2 * 0.8);
        self delete();
        return;
    }

    while ( !self _meth_81E3() && gettime() < var_3 )
    {
        self _meth_8023();
        wait 0.05;
    }

    if ( !self _meth_81E3() )
        self delete();

    wait 10;

    if ( isdefined( self ) )
        self delete();
}

dialog_rpg()
{
    var_0 = [];
    var_1 = [];
    var_1[var_1.size] = "jeepride_grg_hostilerpg";
    var_1[var_1.size] = "jeepride_grg_anotherrpg";
    var_1[var_1.size] = "jeepride_grg_takemout";
    var_0[var_0.size] = "jeepride_pri_fireontruck";
    var_0[var_0.size] = "jeepride_pri_openfire";
    var_0[var_0.size] = "jeepride_pri_shootthattruck";
    var_0 = common_scripts\utility::_id_0CF5( var_0 );
    var_0 = common_scripts\utility::_id_0CF5( var_0 );
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        level waittill( "rpg_truck" );
        level.griggs thread _id_A510::_id_0C21( level.griggs, var_1[var_3] );
        var_3++;

        if ( var_3 == var_1.size )
            var_3 = 0;

        level waittill( "rpg_truck" );
        level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, var_0[var_2] );
        var_2++;

        if ( var_2 == var_0.size )
            var_2 = 0;
    }
}

magic_missileguy_rpg( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    self endon( "death" );
    var_4 = %exposed_crouch_aim_5;
    var_5 = %crouch2stand;
    var_6 = %rpg_stand_aim_5;
    var_7 = %stand2crouch_attack;
    var_8 = 4000;
    var_9 = 2500;
    var_1 local_drone_animontag( self, var_2, var_4 );
    level notify( "rpg_truck" );
    var_1 local_drone_animontag( self, var_2, var_5 );

    for (;;)
    {
        var_10 = timer_set( var_8 );

        while ( !timer_past( var_10 ) )
            var_1 local_drone_animontag( self, var_2, var_6, 1 );

        thread fake_rpg_shot( var_3, var_0 );
        var_1 local_drone_animontag( self, var_2, var_7 );
        var_10 = timer_set( var_9 );

        while ( !timer_past( var_10 ) )
            var_1 local_drone_animontag( self, var_2, var_4 );

        level notify( "rpg_truck" );
        var_1 local_drone_animontag( self, var_2, var_5 );
    }
}

fake_rpg_shot( var_0, var_1 )
{
    var_2 = self _meth_8184( "tag_flash" );
    var_3 = self _meth_8185( "tag_flash" );
    var_4 = spawn( "script_model", var_2 );
    var_4.angles = var_3;
    var_4 _meth_80B3( "projectile_rpg7" );
    playfxontag( level._id_058F["rpg_flash"], var_4, "TAG_FX" );
    var_4 thread _id_A5A4::_id_69C6( "magic_missile_guy_fire" );
    var_5 = 2400;
    var_6 = _func_114( var_0._id_02E2 - var_2 );
    var_7 = var_2 + _id_A5A4::vector_multiply( var_6, 5000 );
    playfxontag( level._id_058F["rpg_trail"], var_4, "TAG_FX" );
    var_8 = var_2;
    var_4 _meth_82BB();
    var_4 thread movewithrate( var_7, var_3, var_5 );
    var_9 = 450;

    for (;;)
    {
        wait 0.05;
        var_10 = _func_06B( var_8, var_4._id_02E2, 0, var_1 );

        if ( var_4.movefinished )
        {
            var_4 delete();
            return;
        }

        if ( var_10["fraction"] != 1 && _func_0EE( var_2, var_4._id_02E2 ) > var_9 )
            break;

        var_8 = var_4._id_02E2;
    }

    var_4 thread common_scripts\utility::_id_69C2( "magic_missile_guy_rocket_exp", var_4._id_02E2 );
    playfx( level._id_058F["rpg_explode"], var_4._id_02E2 );
    _func_189( var_4._id_02E2, 400, 150, 26 );
    level._id_0318 _meth_80AF( "tank_rumble" );
    _func_18C( 0.8, 0.8, level._id_0318._id_02E2, 2000 );
    wait 0.01;
    var_4 delete();

    if ( !_func_1A1( level._id_0318 ) )
        setomnvar( "ui_go_black", 1.0 );
}

timer_set( var_0 )
{
    return gettime() + var_0;
}

timer_past( var_0 )
{
    if ( gettime() > var_0 )
        return 1;

    return 0;
}

physicslaunch_loc( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0.1;

    var_3 = self._id_02E2;
    wait(var_2);
    var_4 = _func_114( self._id_02E2 - var_3 );
    var_5 = anglestoup( self.angles );
    self _meth_8051();

    if ( !isdefined( self.physlaunched ) )
        self _meth_82BE( self._id_02E2 + _id_A5A4::vector_multiply( var_5, var_0 ), _id_A5A4::vector_multiply( var_4, var_1 ) );

    wait 10;
    self delete();
}

can_cannon()
{
    level.cannonpower = 100;
    precachemodel( "com_trashcan_metal" );

    for (;;)
    {
        if ( level._id_0318 _meth_8339() )
            fire_can();

        wait 0.05;
    }
}

fire_can()
{
    var_0 = spawn( "script_model", level._id_0318 _meth_80AA() );
    var_0 _meth_80B3( "com_trashcan_metal" );
    var_1 = _id_A5A4::vector_multiply( _func_114( anglestoforward( level._id_0318 _meth_8338() ) ), level.cannonpower );
    var_0 _meth_82BE( var_0._id_02E2 + ( 0, 0, 17 ), var_1 + ( 0, 0, 17 ) );
    wait 0.05;
}

no_godmoderiders()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        for ( var_1 = 0; var_1 < var_0._id_750A.size; var_1++ )
        {
            if ( _func_0D1( var_0._id_750A[var_1] ) && isdefined( var_0._id_750A[var_1]._id_58D7 ) )
                var_0._id_750A[var_1] thread _id_A5A4::_id_8EA4();
        }

        if ( isdefined( var_0.rocketmen ) )
        {
            for ( var_1 = 0; var_1 < var_0.rocketmen.size; var_1++ )
            {
                if ( _func_0D1( var_0.rocketmen[var_1] ) && isdefined( var_0.rocketmen[var_1]._id_58D7 ) )
                {
                    var_0.rocketmen[var_1] thread _id_A5A4::_id_8EA4();
                    var_0.rocketmen[var_1] delete();
                }
            }
        }
    }
}

all_allies_targetme()
{
    self waittill( "trigger", var_0 );

    if ( !isdefined( var_0.flaretargetents ) )
        var_0.flaretargetents = [];

    var_1 = _func_0D9( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2].classname != "actor_ally_sas_woodland_stinger" )
            continue;

        var_1[var_2] thread sethindtarget( var_0 );
    }

    var_0 endon( "death" );
}

vehicle_dropflare( var_0, var_1 )
{
    if ( common_scripts\utility::_id_382E( "bx_stop_flares" ) )
        return;

    wait(_func_0B5( 0, 0.5 ));

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( var_1 ) )
            var_1 delete();

        return;
    }

    level thread jeepride_flares_fire_burst( var_0, 8, 6, 5.0 );
    var_0 thread vehicle_drop_single_flare( var_1 );
}

vehicle_drop_single_flare( var_0 )
{
    var_0 endon( "death" );
    var_0 _meth_8051();
    var_1 = _id_A53F::_id_3898( self );
    var_0 _meth_82AE( var_1, 8 );
    wait 12;
    var_0 delete();
}

hind_lock_on_player_on()
{
    level.lock_on_player = 1;
    level endon( "lock_on_player_off" );
    level.lock_on_player_ent._id_7AC2 = 1;

    for (;;)
    {
        while ( level.lock_on_player_ent._id_7942 == "missile" )
            wait 0.05;

        wait 2;
        level.lock_on_player_ent._id_7AC2 = 1;
        level.lock_on_player_ent._id_7942 = "missile";
    }
}

hind_lock_on_player_off()
{
    level notify( "lock_on_player_off" );
    level.lock_on_player = 0;
}

stinger_me( var_0 )
{
    level endon( "clear_all_vehicles_but_heros" );
    self waittill( "trigger", var_1 );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    player_link_update( 0.1 );

    if ( var_0 )
        wait 3;

    if ( var_0 )
        wait 8;

    if ( var_0 )
        thread hind_lock_on_player_on();

    common_scripts\utility::_id_384A( "rpg_taken" );
    common_scripts\utility::_id_384A( "rpg_shot" );

    if ( var_0 )
        hind_lock_on_player_off();

    player_link_update();

    if ( !isdefined( var_1 ) )
        return;

    var_1 endon( "death" );
    level thread jeepride_flares_fire_burst( var_1, 8, 6, 5.0 );
}

jeepride_flares_fire_burst( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        playfx( level._id_3891[var_0._id_04FF], var_0 _meth_8184( "tag_light_belly" ) );
        wait 0.05;
    }
}

do_or_die()
{
    self waittill( "trigger" );

    if ( !level.lock_on_player )
        return;

    wait 0.45;
    playfx( level._id_058F["rpg_explode"], level._id_0318._id_02E2 );
    level._id_6D79 thread common_scripts\utility::_id_69C2( "explo_metal_rand", level._id_0318 _meth_80AA(), 1 );
    level._id_0318 _meth_8134( 0 );
    _func_189( level._id_0318._id_02E2, 8, level._id_0318._id_01E6 + 5, level._id_0318._id_01E6 + 5 );
    level._id_0318 _meth_8134( 1 );
}

loosejunk( var_0 )
{
    self._id_01E6 = 700;
    self _meth_82BC( 1 );
    var_0 endon( "junk_throw" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4 );

        if ( !_func_1AD( var_2 ) && self._id_01E6 > 100 )
            continue;

        self _meth_8051();
        var_5 = anglestoforward( var_0.angles );
        var_6 = _id_A5A4::vector_multiply( _func_114( var_4 - self._id_02E2 ), _func_0B3( 2 ) );
        self._id_02E2 += _id_A5A4::vector_multiply( var_5, 32 );
        var_7 = _id_A5A4::vector_multiply( var_5, 18000 );
        self.physlaunched = 1;
        self _meth_82BE( self._id_02E2 + var_6, _id_A5A4::vector_multiply( var_3, 10 ) + ( 0, 0, 20 ) + var_7 );

        if ( self._id_029C == "me_corrugated_metal2x4" )
            thread _id_A5A4::_id_69C4( "scn_bmp21_metalplates" );

        return;
    }
}

junk_throw()
{
    if ( !isdefined( self._id_9882 ) )
        return;

    if ( self == level.playersride )
        return;

    if ( isdefined( self.junkthrown ) )
        return;

    self.junkthrown = 1;
    self notify( "junk_throw" );

    for ( var_0 = 0; var_0 < self._id_9882.size; var_0++ )
    {
        if ( isdefined( self._id_9882[var_0]._id_7ADC ) || self._id_9882[var_0]._id_029C == "axis" )
            continue;

        var_1 = 17;
        var_2 = 80000;
        var_3 = _func_0B3( 0.7 );

        if ( self._id_9882[var_0]._id_029C == "com_barrel_blue" || self._id_9882[var_0]._id_029C == "com_barrel_black" || self._id_9882[var_0]._id_029C == "com_plasticcase_beige_big" )
        {
            var_2 = 660000;
            var_1 = 23;
            var_3 = _func_0B3( 1 );
        }
        else if ( self._id_9882[var_0]._id_029C == "me_corrugated_metal2x4" )
        {
            var_2 = 1000;
            var_1 = 0;
        }

        self._id_9882[var_0] _id_A5A4::_id_27EF( var_3, ::physicslaunch_loc, var_1, var_2 );
    }
}

riders_godon()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < self._id_750A.size; var_1++ )
    {
        if ( _func_0D1( self._id_750A[var_1] ) )
        {
            var_0 = 1;

            if ( !isdefined( self._id_750A[var_1]._id_58D7 ) && !self._id_750A[var_1] ishero() )
                self._id_750A[var_1] thread _id_A5A4::_id_58D7();
        }
    }

    if ( !var_0 )
        return;

    wait 0.2;
    self notify( "no_free_on_end" );
}

monitorvehiclecounts()
{
    for (;;)
    {
        if ( _id_A5A8::get_script_vehicles().size > 60 )
            vehicle_dump();

        wait 0.05;
    }
}

vehicle_dump()
{

}

destructible_assistance()
{
    self waittill( "trigger", var_0 );
    var_0 _id_A5A8::_id_4258();
    var_0 notify( "stop_friendlyfire_shield" );
    var_0._id_01E6 = 1;

    if ( var_0 common_scripts\utility::_id_50F2() )
        var_0 notify( "damage", 5000, level._id_0318, ( 1, 1, 1 ), var_0._id_02E2, "mod_explosive", var_0._id_029C, undefined );
    else
        var_0 notify( "death" );
}

killthrow()
{
    wait(_func_0B3( 0.5 ));

    if ( !_func_0CF( self ) )
    {
        thread ragdollragdollragdollragdollragdollragdoll();
        return;
    }

    if ( isdefined( self._id_58D7 ) && self._id_58D7 )
        return;

    if ( isdefined( self._id_9D1B ) )
    {
        if ( self._id_9D1B == 0 || self._id_9D1B == 1 )
        {
            self delete();
            return;
        }
    }

    self _meth_8054();
    wait 10;

    if ( isdefined( self ) )
        self delete();
}

heli_focusonplayer()
{
    self waittill( "trigger", var_0 );
    var_0 _meth_8261( level.playersride );
    var_0 _meth_825E( level.playersride );
}

heli_mg_burst( var_0 )
{
    var_1 = _func_0B4( 25, 45 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        self _meth_8263( "hind_turret" );
        self _meth_8264( "tag_flash" );
        wait 0.05;

        if ( var_0._id_7942 != "mg_burst" || playerinhelitargetsights_orrandom( var_0 ) )
            break;
    }

    wait(_func_0B5( 0.5, 1 ));
}

playerinhelitargetsights_orrandom( var_0 )
{
    var_1 = _func_0EE( var_0._id_02E2, level._id_0318._id_02E2 ) < 32;

    if ( !var_1 && _func_0B2( 25 ) > 18 )
        var_1 = 1;

    if ( var_1 )
        var_0._id_7942 = "missile";

    return var_1;
}

shoot_the_vehicles()
{
    var_0 = gettime() + 10000;
    var_1 = getentarray( "destroy_at_end", "script_noteworthy" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3].code_classname == "script_vehicle" )
            var_2[var_2.size] = var_1[var_3];
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        shootspotoncewithmissile( var_2[var_3]._id_02E2 + ( 0, 0, 34 ) );
}

shootnearest_non_hero_friend()
{
    var_0 = _func_0D9( "allies" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_58D7 ) || !var_0[var_2]._id_58D7 )
            var_1[var_1.size] = var_0[var_2];
    }

    if ( !var_1.size )
        return;

    var_3 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_1 );
    shootspotoncewithmissile( var_3 _meth_8184( "J_Head" ) );
}

shootspotoncewithmissile( var_0 )
{
    var_1 = spawn( "script_model", var_0 );
    badplace_cylinder( "missilespot", 2, var_0, 200, 300, "allies", "axis" );
    var_1.oldmissiletype = 0;
    var_1._id_7942 = "missile";
    var_1._id_7AC2 = 1;
    thread shootenemytarget( var_1 );
    var_1 waittill( "shot_at" );
    var_1 delete();
}

shootenemytarget( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self endon( "death" );
    self endon( "mg_off" );
    var_0 endon( "death" );
    self endon( "gunner_new_target" );
    self _meth_825E( var_0 );
    wait(var_1);
    var_2 = "mg";
    var_3 = var_0;
    var_4 = 0;

    while ( self._id_01E6 > 0 )
    {
        if ( level.lock_on_player )
        {
            self _meth_825E( var_0 );
            var_0 = level.lock_on_player_ent;
        }
        else if ( isdefined( var_0.offshoot_ent ) )
        {
            var_0 = var_0.offshoot_ent;
            var_4 = 1;
        }
        else
            var_0 = var_3;

        if ( isdefined( var_0._id_7942 ) )
            var_2 = var_0._id_7942;

        if ( var_2 == "none" )
        {
            wait 0.05;
            continue;
        }

        if ( var_2 == "mg" )
        {
            self _meth_8263( "hind_turret" );
            self _meth_8264( "tag_flash" );
            wait 0.05;
            continue;
        }

        if ( var_2 == "mg_burst" )
        {
            heli_mg_burst( var_0 );
            continue;
        }

        if ( var_2 == "missile" || var_2 == "missile_old" || var_2 == "missile_bridgebuster" )
        {
            var_5 = "hind_ffar_jeepride";

            if ( var_2 == "missile_bridgebuster" )
                var_5 = "crash_missile_jeepride";

            if ( var_2 == "missile_old" )
                var_0.oldmissiletype = 1;

            self _meth_8263( var_5 );
            var_6 = 6;

            if ( isdefined( var_0._id_7AC2 ) )
                var_6 = var_0._id_7AC2;

            _id_37BA( var_5, var_6, var_0, 0.2 );
            var_0 notify( "shot_at" );
            var_0._id_7942 = "mg";

            if ( var_2 == "missile_bridgebuster" )
                var_0._id_7942 = "none";

            if ( var_4 )
            {
                var_0 = var_3;
                var_4 = 0;
            }

            continue;
        }
    }
}

missile_offshoot()
{
    var_0 = common_scripts\utility::_id_40FB( self._id_04A4, "targetname" );
    self._id_7942 = "missile";
    var_0.offshoot_ent = self;
    self.oldmissiletype = 0;
    self._id_7AC2 = 1;
    self _meth_8056();
}

sound_emitter()
{
    var_0 = common_scripts\utility::_id_3DC3();
    var_1 = undefined;
    var_2 = self._id_0398;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_1 = _func_1EC( var_0[var_3], "script_linkname" );

        if ( !isdefined( var_1 ) )
            continue;

        var_1 thread sound_emitter_single( var_2 );
    }

    self delete();
}

sound_emitter_single( var_0 )
{
    self waittill( "trigger", var_1 );

    if ( var_0 == "truck_horn" && var_1 != level.playersride )
        return;

    var_1 thread _id_A5A4::_id_69C4( var_0 );
}

ambient_setter()
{
    var_0 = _func_1EC( self._id_04A4, "targetname" );
    self _meth_8056();
    var_1 = self.ambient;
    var_0 waittill( "trigger" );
    var_2 = var_1;

    if ( var_2 == "interior" )
        _id_A5A4::_id_7F00( "jeepride_tunnel", 2 );

    if ( var_2 == "exterior" )
        _id_A5A4::_id_7F00( "jeepride", 2 );
}

whackamole_unload( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    self waittill( "unloading" );
    var_0._id_28B4 = undefined;
    var_0 _meth_81CE( "crouch", "stand", "prone" );
    var_0._id_01FB = 0;
    wait 1;
    var_0 _meth_8051();
}

whackamole( var_0 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    self endon( "unloading" );
    var_0 endon( "death" );

    if ( !isdefined( self.whackamolecount ) )
        self.whackamolecount = 0;

    if ( !isdefined( self.whackamoleguys ) )
        self.whackamoleguys = [];

    var_0.whackamole_on = 0;

    if ( !_func_0CF( var_0 ) )
        return;

    thread whackamole_death( var_0 );
    thread whackamole_unload( var_0 );

    if ( var_0._id_04A7 == "allies" )
    {
        var_0._id_28B4 = "crouch";
        var_0 _meth_81CE( "crouch" );
        var_0 thread animscripts\utility::_id_9AF5();
        return;
    }

    var_0.forceaimtorwardsenemy = 1;
    thread orientmodehack_axis( var_0 );
    whackamole_off( var_0 );

    for (;;)
    {
        while ( self.whackamolecount > 2 )
            wait 0.05;

        whackamole_on( var_0 );
        wait(_func_0B5( 3, 7 ));
        whackamole_off( var_0 );
        wait(_func_0B5( 3, 5 ));
    }
}

whackamole_on( var_0 )
{
    var_0.whackamole_on = 1;
    var_0._id_28B4 = "stand";
    var_0 _meth_81CE( "stand" );
    var_0._id_01FB = 0;
    var_0 thread animscripts\utility::_id_9AF5();
    self.whackamolecount++;
}

whackamole_off( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0.whackamole_on = 0;
    var_0._id_28B4 = "crouch";
    var_0._id_01FB = 1;
    var_0 _meth_81CE( "crouch" );
    var_0 thread animscripts\utility::_id_9AF5();
    var_0._id_18B0 = 0;
    self.whackamolecount--;
}

whackamole_death( var_0 )
{
    if ( var_0._id_04A7 == "allies" )
        return;

    self.whackamoleguys[self.whackamoleguys.size] = var_0;
    self endon( "death" );
    var_0 waittill( "death" );
    thread whackamole_dialog();
    self.whackamoleguys = common_scripts\utility::_id_0CF6( self.whackamoleguys, var_0 );
    self.whackamolecount--;

    if ( !isdefined( var_0 ) )
        return;

    var_0 waittillmatch( "deathanim", "start_ragdoll" );

    if ( getdvar( "ragdoll_enable" ) != "0" )
        thread dropspeedbump( var_0._id_02E2, self );
    else
        var_0 delete();
}

whackamole_dialog()
{
    if ( !isdefined( level.whackamole_lastspeak ) )
        level.whackamole_lastspeak = gettime() + 3005;

    if ( gettime() < level.whackamole_lastspeak + 10000 )
        return;

    level.whackamole_lastspeak = gettime();
}

dialog_killconfirm()
{
    var_0 = [];
    var_0[var_0.size] = "jeepride_grg_killfirm";
    var_0[var_0.size] = "jeepride_grg_niceshootin";
    var_0[var_0.size] = "jeepride_grg_success";
    var_0[var_0.size] = "jeepride_grg_thatsahit";
    var_0[var_0.size] = "jeepride_grg_devastation";

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        level waittill( "kill_confirm" );
        level.griggs _id_A510::_id_0C21( level.griggs, var_0[var_1] );
    }
}

ghetto_tag()
{
    if ( !isdefined( level.ghettotag ) )
        level.ghettotag = [];

    var_0 = getent( self._id_04A4, "targetname" );

    if ( !isdefined( level.ghettotag[var_0._id_029C] ) )
        level.ghettotag[var_0._id_029C] = [];

    level.ghettotag[var_0._id_029C][level.ghettotag[var_0._id_029C].size] = _id_A5AA::_id_418A( var_0 );
}

trigger_sparks_on()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread maps\jeepride_fx::apply_ghettotag();
    }
}

trigger_sparks_off()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread maps\jeepride_fx::remove_ghettotag();
    }
}

attack_dummy_path()
{
    var_0 = setup_throwchain_dummy_path( self );
    var_1 = 0;

    if ( isdefined( self._id_0392 ) )
        var_1 = self._id_0392;

    var_2 = getent( self._id_7A26, "script_linkname" );
    var_2 waittill( "trigger", var_3 );
    var_4 = spawn( "script_model", var_0[0]._id_02E2 );
    var_4 _meth_80B3( "fx" );

    if ( getdvar( "jeepride_showhelitargets" ) == "off" )
        var_4 _meth_8056();

    var_4 _meth_82BB();
    var_4.oldmissiletype = 0;
    var_3 endon( "gunner_new_target" );
    var_3 endon( "death" );
    var_3 _meth_8262();
    var_3 _meth_8261( var_4 );
    var_3 thread shootenemytarget( var_4, var_1 );
    ghetto_animate_through_chain( var_0, var_4, 500, 1 );
    var_3 _meth_8262();
    var_4 delete();
}

guardrail_think()
{
    self _meth_82BC( 1 );
    self waittill( "damage", var_0, var_1, var_2 );
    self _meth_82BE( self._id_02E2, 0, 0, 0 );
}

rpgers_to_dummy( var_0 )
{
    if ( !isdefined( self.rocketmen ) )
        return;

    for ( var_1 = 0; var_1 < self.rocketmen.size; var_1++ )
    {
        var_2 = _id_A5A9::_id_0BE9( self, self.rocketmen[var_1].rocketattachpos );
        self.rocketmen[var_1] _meth_804F( self._id_9882[0], "polySurface1", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }
}

ai_rpg_tunnel_stop()
{
    self waittill( "trigger" );
    level endon( "bridge_zakhaev_setup" );
    var_0 = _func_0D9( "allies", "neutral" );

    while ( level._id_0318 _meth_80AB( self ) )
    {
        foreach ( var_2 in var_0 )
        {
            if ( isdefined( var_2.hindenemy ) )
                var_2.hindenemy = undefined;
        }

        wait 0.5;
    }
}

falling_bridge_price()
{
    var_0 = level._id_6F7C;
    var_0 _meth_856F( 0 );
    wait 15;
    var_0 _meth_856E();
}

fliptruck_ghettoanimate()
{
    var_0 = setup_throwchain( self );
    var_1 = _func_1EC( self._id_7A26, "script_linkname" );
    var_2 = _func_1EC( var_1._id_04A6, "target" );
    var_2 waittill( "trigger", var_3 );
    var_4 = gettime();
    var_5 = var_3._id_02E2;
    var_1 waittill( "trigger", var_3 );
    var_6 = ( gettime() - var_4 ) / 1000;
    var_7 = _func_0EE( var_5, var_3._id_02E2 );
    var_8 = var_7 / var_6;
    var_9 = var_3 _id_A5A8::_id_9D58();

    if ( var_3 == level.playersride )
    {
        level._id_0318 _meth_8051();
        level._id_0318 _meth_807F( level.playerlinkmodel, "polySurface1", level.playerlinkinfluence );
    }

    if ( isdefined( level.fxplay_model ) )
        var_3 thread junk_throw();

    var_9 _meth_82BB();
    var_3 _id_A5AA::vehicle_dummy_add_collison();
    var_3 _meth_8451();

    if ( animated_crash( var_9, var_8, var_3 ) )
        return;

    vehicle_killthrow_all_guys( var_3 );
    waitframe;
    var_3 ghetto_animate_through_chain( var_0, var_9, var_8 );
    var_9 maps\jeepride_fx::remove_ghettotag();
}

jeepride_custom_vehicle_to_dummy( var_0, var_1 )
{
    var_0._id_02E5 = self;
    rpgers_to_dummy( var_0 );
    self notify( "kill_treads_forever" );
    maps\jeepride_fx::transfer_ghettotag_to( var_0, undefined, var_1 );

    if ( self._id_04FF == "bm21_troops" )
    {
        self notify( "stop_tire_deflate" );
        var_0 thread kill_all_guys_on_animend();
    }
}

vehicle_killthrow_all_guys( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._id_750A ) )
        common_scripts\utility::_id_0D13( var_0._id_750A, ::killthrow );

    if ( isdefined( var_0.whackamoleguys ) )
        common_scripts\utility::_id_0D13( var_0.whackamoleguys, ::killthrow );

    if ( isdefined( var_0.magic_missile_guy ) )
        var_0.magic_missile_guy thread killthrow();
}

kill_all_guys_on_animend()
{
    if ( !isdefined( self._id_02E5 ) )
        return;

    self._id_02E5 endon( "death" );
    self endon( "death" );
    self endon( "notetrack_killed_all_guys" );
    self waittillmatch( "single anim", "end" );
    vehicle_killthrow_all_guys( self._id_02E5 );
}

anim_throw_junk_and_kill_all_guys( var_0 )
{
    if ( !isdefined( var_0._id_02E5 ) )
        return;

    var_0._id_02E5 thread junk_throw();
    var_0 notify( "notetrack_killed_all_guys" );
    vehicle_killthrow_all_guys( var_0._id_02E5 );
}

anim_spark_on( var_0 )
{
    var_0 thread maps\jeepride_fx::apply_ghettotag();
}

anim_spark_off( var_0 )
{
    var_0 thread maps\jeepride_fx::remove_ghettotag();
}

show_ghetto_tags()
{
    for ( var_0 = 0; var_0 < self.ghettotags.size; var_0++ )
        self.ghettotags[var_0] _meth_8055();
}

animated_crash( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_7A99 ) || !isdefined( level.jeepride_crash_anim ) || !isdefined( level.jeepride_crash_anim[self._id_7A99] ) )
        return 0;

    var_3 = undefined;
    var_4 = isdefined( var_2.ghettotags ) && var_2.ghettotags.size > 0;

    if ( isdefined( level.jeepride_crash_model[self._id_7A99] ) )
    {
        var_5 = var_0.angles;
        var_6 = var_0._id_02E2;
        var_7 = var_0._id_029C;
        var_0 _meth_8056();
        var_8 = var_0;
        var_0 = spawn( "script_model", var_6 );
        var_0.angles = var_5;
        var_0 _meth_80B3( level.jeepride_crash_model[self._id_7A99] );
        var_3 = spawn( "script_model", var_0._id_02E2 );
        var_3 _meth_80B3( "tag_origin" );
        var_3.angles = var_0 _meth_8185( "body_animate_jnt" );
        var_3._id_02E2 = var_0 _meth_8184( "body_animate_jnt" );
        var_3 _meth_8094();
        var_3 _meth_82BB();
        var_3 _meth_804F( var_0, "body_animate_jnt", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        var_0 _meth_8117( level.jeepride_crash_animtree[self._id_7A99] );
        var_8 thread maps\jeepride_fx::transfer_ghettotag_to( var_3, var_7, "tag_origin" );
    }

    var_2 _id_A5A8::_id_5F23( var_0 );
    var_2._id_750A = undefined;
    var_2 _meth_8056();
    var_0 movewithrate( self._id_02E2, self.angles, var_1 );
    var_9 = "crashanim";
    var_0 thread animated_crashtracks( var_9 );
    var_0 _meth_8140( var_9, self._id_02E2, self.angles, level.jeepride_crash_anim[self._id_7A99] );
    var_0 waittillmatch( var_9, "end" );
    var_2 delete();
    var_10 = common_scripts\utility::_id_9294( isdefined( var_3 ), var_3, var_0 );
    var_10 maps\jeepride_fx::remove_ghettotag();
    return 1;
}

animated_crashtracks( var_0 )
{
    var_1 = [];
    var_1["slide"] = ::crashtrack_note_slide;
    var_1["breakwall"] = ::crashtrack_note_breakwall;
    var_1["splash"] = ::crashtrack_note_splash;

    for (;;)
    {
        self waittill( var_0, var_2 );

        if ( isdefined( var_1[var_2] ) )
            [[ var_1[var_2] ]]();

        if ( var_2 == "end" )
            break;
    }
}

crashtrack_note_slide()
{
    self _meth_809C( "vehicle_skid_long" );
}

crashtrack_note_breakwall()
{

}

crashtrack_note_splash()
{

}

_id_37BA( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "gunner_new_target" );

    if ( level.lock_on_player )
        var_2 = level.lock_on_player_ent;

    var_2 endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( self._id_04FF == "hind" )
    {
        var_4[0] = "tag_missile_left";
        var_4[1] = "tag_missile_right";
    }
    else
    {
        var_4[0] = "tag_store_L_2_a";
        var_4[1] = "tag_store_R_2_a";
        var_4[2] = "tag_store_L_2_b";
        var_4[3] = "tag_store_R_2_b";
        var_4[4] = "tag_store_L_2_c";
        var_4[5] = "tag_store_R_2_c";
        var_4[6] = "tag_store_L_2_d";
        var_4[7] = "tag_store_R_2_d";
    }

    var_5 = _func_1B0( var_0 );
    self _meth_8263( var_0 );
    var_6 = -1;
    var_7 = var_2;

    for ( var_8 = 0; var_8 < var_1; var_8++ )
    {
        if ( level.lock_on_player )
            var_2 = level.lock_on_player_ent;
        else
            var_2 = var_7;

        var_6++;

        if ( var_6 >= var_4.size )
            var_6 = 0;

        var_9 = self _meth_8264( var_4[var_6] );

        if ( !isdefined( var_9 ) )
            continue;

        if ( var_0 == "crash_missile_jeepride" )
        {
            level notify( "missile_tracker", var_9 );
            var_9 thread maps\jeepride::blown_bridge( var_2 );
            thread _id_A5A4::_id_69C5( "scn_bridge_weap_hind_rocket_fire", var_4[var_6] );
        }

        if ( isdefined( var_2._id_04FF ) && var_2._id_04FF == "hind" )
            var_9 _meth_81DC( var_2, ( 0, 0, -56 ) );
        else if ( var_2.oldmissiletype )
            var_9 _meth_81DC( var_2, ( 80, 20, -200 ) );
        else
            var_9 _meth_81DC( var_2 );

        if ( var_8 < var_1 - 1 )
            wait(var_5);

        if ( isdefined( var_3 ) )
            wait(var_3);
    }
}

script_playerlink_org()
{
    if ( isdefined( level._id_0318.script_linker_model ) )
        return level._id_0318.script_linker_model;

    level._id_0318.script_linker_model = spawn( "script_model", level._id_0318._id_02E2 );
    level._id_0318.script_linker_model _meth_80B3( "axis" );
    return level._id_0318.script_linker_model;
}

view_turn( var_0, var_1 )
{
    var_1 = 1;
    var_2 = script_playerlink_org();
    var_2.angles = level._id_0318 _meth_8338();
    var_3 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_3._id_02E2 = level._id_0318 _meth_80AA();
    var_3.angles = level._id_0318 _meth_8338();
    level._id_0318 _meth_8081( var_2, "polySurface1" );
    var_4 = _func_115( _func_114( var_0 - var_3._id_02E2 ) );
    var_5 = 0.5;
    var_2 _meth_82B1( var_4, var_5, 0.2, 0.2 );
}

delaythread_loc( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 *= 1000;

    if ( level.startdelay != 0 && level.startdelay > var_0 )
        return;

    while ( gettime() + level.startdelay < var_0 )
        wait 0.05;

    if ( isdefined( var_5 ) )
        thread [[ var_1 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        thread [[ var_1 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        thread [[ var_1 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        thread [[ var_1 ]]( var_2 );
    else
        thread [[ var_1 ]]();
}

twobuttonspressed( var_0, var_1 )
{
    return level._id_0318 _meth_8248( var_0 ) && level._id_0318 _meth_8248( var_1 );
}

jeepride_start_dumphandle()
{
    var_0 = "h";
    var_1 = "CTRL";

    for (;;)
    {
        while ( !twobuttonspressed( var_0, var_1 ) )
            wait 0.05;

        while ( !jeepride_start_dump() )
            wait 0.05;

        while ( twobuttonspressed( var_0, var_1 ) )
            wait 0.05;
    }
}

get_vehicles_with_spawners()
{
    var_0 = _id_A5A8::get_script_vehicles();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_9A29 ) && isdefined( var_0[var_2]._id_251D ) )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

jeepride_start_dump( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "wip";

    var_1 = [];
    iprintlnbold( "start: " + var_0 + " dumped!" );
    return 1;
}

origintostring( var_0 )
{
    var_1 = "" + var_0[0] + " " + var_0[1] + " " + var_0[2] + "";
    return var_1;
}

sync_vehicle()
{
    var_0 = level.vehicle_spawners[self._id_9A29];
    var_1 = self;
    var_2 = _func_1EC( self._id_04A4, "targetname" );
    var_3 = _id_A5A8::_id_9D41( var_0 );
    var_3 notify( "newpath" );
    var_3._id_02E2 = self._id_02E2 + ( 0, 0, 555 );
    var_3.angles = self.angles;
    var_3 _meth_8279( var_1 );
    var_3 _meth_827B();

    if ( isdefined( var_1._id_79FD ) )
        var_3 maps\jeepride_fx::apply_ghettotag();

    if ( isdefined( var_1._id_0392 ) )
        level.startdelay = var_1._id_0392;

    var_4 = _func_1EC( var_2._id_0398, "targetname" );
    var_3 _meth_827C( var_2, var_4 );
    var_3._id_0DF6 = var_4;
    var_3 thread _id_A5A8::_id_9D17();
}

hillbump()
{
    self waittill( "trigger", var_0 );
    var_0 notify( "newjolt" );
    var_0 endon( "newjolt" );
    var_0 endon( "death" );

    if ( common_scripts\utility::_id_382E( "slam_zoom_done" ) )
    {
        level.playersride _meth_80AF( "tank_rumble" );
        thread common_scripts\utility::_id_69C2( "jeepride_grassride_thud", level._id_0318._id_02E2, 1 );
    }

    for ( var_1 = 0; var_1 < 6; var_1++ )
    {
        if ( !common_scripts\utility::_id_382E( "slam_zoom_done" ) )
        {
            wait(0.2 + _func_0B3( 0.2 ));
            continue;
        }

        var_0 _meth_8250( var_0._id_02E2 + ( 23, 33, 64 ), 0.6 );

        if ( var_0 == level.playersride )
            _func_18C( 0.15, 1, level._id_0318._id_02E2, 1000 );

        wait(0.2 + _func_0B3( 0.2 ));
        thread common_scripts\utility::_id_69C2( "jeepride_grassride_through", level._id_0318._id_02E2, 1 );
    }
}

bridge_uaz_crash()
{
    var_0 = _func_1EC( "bridge_uaz_crash", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_1 _meth_8250( var_1._id_02E2 + _id_A5A4::vector_multiply( anglestoforward( var_1.angles ), 48 ), 16 );
    thread common_scripts\utility::_id_69C2( "jeepride_sideswipe", var_1._id_02E2, 1 );
    _func_18C( 0.35, 0.3, var_1._id_02E2, 2500 );
    exploder_loc( "14004" );
}

sideswipe()
{
    self waittill( "trigger", var_0 );
    var_0 notify( "newjolt" );
    level.playersride notify( "newjolt" );
    var_0 endon( "newjolt" );
    level.playersride endon( "newjolt" );
    var_0 _meth_8250( level.playersride._id_02E2 + ( 0, 0, 64 ), 16 );
    level.playersride _meth_8250( var_0._id_02E2 + ( 0, 0, 64 ), 16 );
    var_1 = _func_0EE( var_0._id_02E2, level.playersride._id_02E2 );
    var_2 = _id_A5A4::vector_multiply( _func_114( var_0._id_02E2 - level.playersride._id_02E2 ), var_1 / 2 ) + level.playersride._id_02E2 + ( 0, 0, 48 );
    level.playersride _id_A5A4::_id_69C4( "jeepride_sideswipe" );
    _func_18C( 0.45, 1, level._id_0318._id_02E2, 1000 );
    level._id_0318 _meth_80AF( "tank_rumble" );
}

jolter()
{
    self waittill( "trigger", var_0 );
    var_0 _meth_8250( self._id_02E2 + ( 32, 32, 64 ), 3.5 );
}

_id_2856()
{
    self delete();
}

speedbumps_setup()
{
    level.speedbumpcurrent = 0;
    level.speedbumps = getentarray( "speedbump", "targetname" );
}

dropspeedbump( var_0, var_1 )
{
    if ( common_scripts\utility::_id_382E( "end_ride" ) )
        return;

    level.speedbumpcurrent++;

    if ( level.speedbumpcurrent >= level.speedbumps.size )
        level.speedbumpcurrent = 0;

    var_2 = _func_06B( var_0 + ( 0, 0, -32 ), var_0 + ( 0, 0, -100000 ), 0, var_1 )["position"];
    wait 0.5;
    level.speedbumps[level.speedbumpcurrent]._id_02E2 = var_2 + ( 0, 0, 4 );
}

ragdollragdollragdollragdollragdollragdoll()
{
    if ( getdvar( "ragdoll_enable" ) == "0" )
    {
        self delete();
        return;
    }

    self endon( "death" );
    var_0 = gettime() + 10000;

    while ( isdefined( self ) && gettime() < var_0 )
    {
        wait 0.05;
        self _meth_8023();
    }

    if ( isdefined( self ) )
        self delete();
}

fx_wait_set( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _fx_wait_set( var_0, var_1, var_2, var_3 );
    _fx_wait_set( var_4, var_5, var_6, var_7 );
}

_fx_wait_set( var_0, var_1, var_2, var_3 )
{
    var_4 = "polySurface1";

    if ( var_0 < level.startdelay )
        return;

    while ( gettime() + level.startdelay < var_0 )
        wait 0.05;

    setfxplayer();
    level.fxplay_model._id_02E2 = var_1;
    level.fxplay_model.angles = var_2;
    playfxontag( level._id_058F[var_3], level.fxplay_model, var_4 );
}

createfxplayers( var_0 )
{
    level.fxplay_model_array = [];
    level.fxplay_index = 0;
    level.fxplay_indexmax = var_0;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = spawn( "script_model", ( 0, 0, 0 ) );
        var_2 _meth_80B3( "axis" );
        var_2 _meth_8056();
        level.fxplay_model_array[var_1] = var_2;
    }

    return setfxplayer();
}

setfxplayer()
{
    level.fxplay_model = level.fxplay_model_array[level.fxplay_index];
    level.fxplay_index++;

    if ( level.fxplay_index >= level.fxplay_indexmax )
        level.fxplay_index = 0;
}

exploder_hack()
{
    if ( !isdefined( self._id_04A4 ) )
        return;

    var_0 = self._id_79BF;
    var_1 = undefined;
    var_2 = getentarray( self._id_04A4, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3].classname == "trigger_damage" )
            var_1 = var_2[var_3];

        break;
    }

    if ( !isdefined( var_1 ) )
        return;

    var_1 thread exploder_damager_trigger_by_hind();
    var_1 waittill( "trigger" );
    exploder_loc( var_0 );
}

exploder_damager_trigger_by_hind()
{
    self endon( "trigger" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( isdefined( var_1._id_04FF ) && var_1._id_04FF == "hind" )
            self notify( "trigger" );
    }
}

exploder_loc( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 )
        level.exploder_fast[var_0] = 1;

    level notify( "exploded_" + var_0 );
    common_scripts\_exploder::_id_3528( var_0 );
}

exploder_animate()
{
    if ( !isdefined( self._id_04A4 ) )
        return;

    var_0 = self._id_79BF;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_7AA6;

    exploder_linktargets();
    var_1 = common_scripts\utility::_id_40FB( self._id_04A4, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    self._id_04A4 = undefined;
    var_2 = setup_throwchain( var_1 );
    level waittill( "exploded_" + var_0 );
    var_3 = spawn( "script_model", var_1._id_02E2 );
    var_3.angles = var_1.angles;
    self _meth_804F( var_3 );
    exploder_showlinks();

    if ( isdefined( self.is_end_tanker ) )
        thread exploder_tankersparker_links();

    var_4 = 0;

    if ( isdefined( level.exploder_fast[var_0] ) && level.exploder_fast[var_0] )
        var_4 = 1;

    if ( isdefined( self._id_0398 ) && self._id_0398 == "movekiller" )
        thread enable_move_killer();

    ghetto_animate_through_chain( var_2, var_3, undefined, undefined, var_4 );
    disable_move_killer();
}

exploder_tankersparker_links()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self.linkedtargets.size; var_1++ )
    {
        if ( self.linkedtargets[var_1]._id_029C == "axis" )
            var_0[var_0.size] = self.linkedtargets[var_1];
    }

    var_2 = self._id_02E2;
    wait 9;
    var_3 = 7;

    for ( var_4 = 0; var_2 != self._id_02E2; var_0 = common_scripts\utility::_id_0CF5( var_0 ) )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = self._id_02E2;
            playfxontag( level._id_058F["tanker_sparker"], var_0[var_1], "polySurface1" );
            var_4++;

            if ( var_4 == var_3 )
            {
                var_4 = 0;
                wait 0.05;

                if ( var_2 != self._id_02E2 )
                    break;
            }
        }
    }
}

disable_move_killer()
{
    self notify( "stop_move_killer" );
}

enable_move_killer()
{
    self endon( "stop_move_killer" );

    for (;;)
    {
        if ( level._id_0318 _meth_80AB( self ) )
        {
            level._id_0318 _meth_8134( 0 );
            _func_189( level._id_0318._id_02E2, 8, level._id_0318._id_01E6 + 5, level._id_0318._id_01E6 + 5 );
            level._id_0318 _meth_8134( 1 );
        }

        wait 0.05;
    }
}

exploder_showlinks()
{
    if ( !self.linkedtargets.size )
        return;

    for ( var_0 = 0; var_0 < self.linkedtargets.size; var_0++ )
    {
        if ( isdefined( self.linkedtargets[var_0]._id_0398 ) && self.linkedtargets[var_0]._id_0398 == "tanker_sparkers" )
        {
            self.is_end_tanker = 1;
            continue;
        }
        else if ( self.linkedtargets[var_0]._id_029C == "axis" )
            continue;

        if ( self._id_029C == "axis" )
            continue;

        self.linkedtargets[var_0] _meth_8055();
    }
}

exploder_linktargets()
{
    var_0 = getentarray( self._id_04A4, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].classname != "script_model" )
            continue;

        var_0[var_1] _meth_804F( self );
        var_0[var_1] _meth_8056();
    }

    self.linkedtargets = var_0;
}

smokey_transition( var_0, var_1, var_2 )
{
    var_3 = 100;
    var_4 = 2;
    var_5 = 1;
    var_6 = ( var_4 - 1 ) / 2 * var_3 * -1;

    for ( var_7 = 0; var_7 < var_4; var_7++ )
    {
        for ( var_8 = 0; var_8 < var_4; var_8++ )
        {
            var_9 = var_6 + var_7 * var_3;
            var_10 = var_6 + var_8 * var_3;
            thread smoke_transition_elem( var_9, var_10, var_0, var_1, var_2, 1, var_5 );
            var_5++;
        }
    }

    var_3 = 90;
    var_4 = 3;
    var_6 = ( var_4 - 1 ) / 2 * var_3 * -1;

    for ( var_7 = 0; var_7 < var_4; var_7++ )
    {
        for ( var_8 = 0; var_8 < var_4; var_8++ )
        {
            var_9 = var_6 + var_7 * var_3;
            var_10 = var_6 + var_8 * var_3;
            thread smoke_transition_elem( var_9, var_10, var_0, var_1, var_2, _func_0B5( 0.1, 0.8 ), var_5 );
            var_5++;
        }
    }
}

smoke_transition_elem( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _func_1A9();
    var_7._id_03D4 = var_6;
    var_7._id_0530 = var_0;
    var_7._id_0538 = var_1;
    var_8 = 1;
    var_9 = 1;

    if ( var_7._id_0530 > 0 )
        var_8 = -1;

    if ( var_7._id_0538 > 0 )
        var_9 = -1;

    var_10 = _func_0B4( 200, 1200 ) * var_8;
    var_11 = _func_0B2( 200, 1200 ) * var_9;
    var_12 = _func_0B5( 2, 4 );
    var_13 = _func_0B4( 400, 1000 );
    var_7 _meth_80CE( "jeepride_smoke_transition_overlay", var_13, var_13 );
    var_7.alignx = "center";
    var_7.aligny = "middle";
    var_7._id_01F3 = "center";
    var_7._id_0501 = "middle";
    var_7.alpha = 0;
    var_7._id_0198 = 1;
    var_7 _meth_8088( var_2 + var_3 + var_4 );
    var_7._id_0530 += var_10;
    var_7._id_0538 += var_11;
    var_14 = _func_0B5( 4, 6 );
    var_13 = _func_0BC( var_13 * var_14 );

    if ( var_13 > 1000 )
        var_13 = 1000;

    var_7 _meth_8087( var_2 + var_3 + var_4, var_13, var_13 );
    var_7 _meth_8086( var_2 );
    var_7.alpha = var_5;
    wait(var_2 + var_4);
    var_7 _meth_8086( var_3 );
    var_7.alpha = 0;
    wait(var_3);
    var_7 _meth_808A();
}

setup_throwchain_dummy_path( var_0 )
{
    var_1 = 0;
    var_2 = [];
    var_3 = [];

    while ( isdefined( var_0 ) )
    {
        var_3[var_1] = var_0;
        var_2[var_1] = var_0;
        var_1++;

        if ( isdefined( var_0._id_04A4 ) )
        {
            var_0 = common_scripts\utility::_id_40FD( var_0._id_04A4, "targetname" )[0];
            continue;
        }

        break;
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] setup_throwchain_dummy_path_clearjunkvars();

    return var_2;
}

setup_throwchain_dummy_path_clearjunkvars()
{
    self.angles = undefined;
    self._id_029C = undefined;
}

setup_throwchain( var_0 )
{
    var_1 = 0;
    var_2 = [];
    var_3 = [];

    while ( isdefined( var_0 ) )
    {
        if ( !isdefined( var_0.angles ) )
            var_0.angles = ( 0, 0, 0 );

        var_3[var_1] = var_0;
        var_2[var_1] = var_0;
        var_1++;

        if ( isdefined( var_0._id_04A4 ) )
        {
            var_0 = common_scripts\utility::_id_40FD( var_0._id_04A4, "targetname" )[0];
            continue;
        }

        break;
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] setup_throwchain_clearjunkvars();

    return var_2;
}

setup_throwchain_clearjunkvars()
{
    self._id_029C = undefined;
}

ghetto_animate_through_chain( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_1 endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = 500;

    var_5 = 0;

    if ( var_4 )
        var_3 = 1;

    var_1.linkedobject = self;

    for ( var_6 = 0; var_6 < var_0.size - 1; var_6++ )
    {
        var_7 = 0;
        var_8 = 0;
        var_9 = var_0[var_6];
        var_10 = var_0[var_6 + 1];
        var_11 = 0;

        if ( isdefined( var_9._id_03E2 ) )
            var_2 = var_9._id_03E2;

        var_12 = var_2;

        if ( isdefined( var_9._id_7942 ) )
            var_1._id_7942 = var_9._id_7942;
        else
            var_1._id_7942 = undefined;

        if ( isdefined( var_9.offshoot_ent ) )
            var_1.offshoot_ent = var_9.offshoot_ent;

        if ( isdefined( var_9._id_7AC2 ) )
            var_1._id_7AC2 = var_9._id_7AC2;

        if ( isdefined( var_9._id_79BF ) )
            thread exploder_loc( var_9._id_79BF );
        else if ( isdefined( var_9._id_7AA6 ) )
            thread exploder_loc( var_9._id_7AA6 );

        if ( isdefined( var_9._id_7A99 ) && var_9._id_7A99 == "badplace" )
        {
            if ( !isdefined( var_9._id_0351 ) )
                var_9._id_0351 = 600;

            badplace_cylinder( "dummypath_badplace", 1, var_9._id_02E2, var_9._id_0351, 512, "allies", "axis" );
        }

        if ( isdefined( var_9._id_79DA ) )
            common_scripts\utility::_id_384A( var_9._id_79DA );

        if ( !var_3 )
        {
            if ( isdefined( var_9._id_0392 ) )
                wait(var_9._id_0392);
        }

        if ( isdefined( var_9._id_7ACA ) )
        {
            if ( isdefined( var_9._id_7A99 ) && var_9._id_7A99 == "in_space" )
                var_1 thread common_scripts\utility::_id_69C2( var_9._id_7ACA, var_9._id_02E2 );
            else
                var_1 thread _id_A5A4::_id_69C4( var_9._id_7ACA );
        }

        if ( isdefined( var_9._id_0398 ) )
        {
            if ( var_9._id_0398 == "gravity" )
                var_5 = 1;
        }

        if ( var_1._id_029C == "vehicle_uaz_open_for_ride" && var_6 == 0 )
            var_1 thread ride_smoker();

        if ( isdefined( var_9._id_792A ) )
            var_7 = var_9._id_792A;

        if ( isdefined( var_9._id_798C ) )
            var_8 = var_9._id_798C;

        var_13 = ( 0, 0, 0 );

        if ( isdefined( var_10.angles ) )
            var_13 = var_10.angles;

        if ( var_4 )
        {
            var_1._id_02E2 = var_10._id_02E2;
            var_1.angles = var_13;
        }
        else
            var_1 movewithrate( var_10._id_02E2, var_13, var_2, var_12, var_5, var_7, var_8 );

        if ( isdefined( var_10._id_79A0 ) )
            _id_79A0( var_10._id_79A0 );

        if ( isdefined( var_10._id_0398 ) )
        {
            level notify( var_10._id_0398 );

            if ( var_10._id_0398 == "delete" )
            {
                self delete();
                return;
            }
        }

        if ( isdefined( var_10._id_79D8 ) )
            common_scripts\utility::_id_383F( var_10._id_79D8 );
    }
}

_id_79A0( var_0 )
{
    if ( self.classname == "script_model" )
        return;

    if ( var_0 )
    {
        self _meth_805A();
        self _meth_8059();
    }
    else
        self _meth_805A();
}

bridge_bumper()
{
    var_0 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_0 _meth_804F( level._id_0318 );

    for (;;)
    {
        level waittill( "bridge_bump" );
        var_0 _meth_80AF( "jeepride_bridgesink" );
        _func_18C( 0.25, 1, level._id_0318._id_02E2, 1000 );
    }
}

_notsolid()
{
    if ( isdefined( self ) )
        self _meth_82BB();
}

movewithrate( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self notify( "newmove" );
    self endon( "newmove" );

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = var_2;

    self.movefinished = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 200;

    var_7 = _func_0EE( self._id_02E2, var_0 );
    var_8 = var_7 / var_2;
    var_9 = _func_114( var_0 - self._id_02E2 );
    var_10 = 0;
    var_11 = 0;

    if ( var_5 > 0 )
        var_10 = var_8 * var_5;

    if ( var_6 > 0 )
        var_11 = var_8 * var_6;

    if ( var_4 )
    {
        self _meth_82AE( self._id_0500, var_8 );
        self _meth_82B1( var_1, var_8, var_10, var_11 );

        if ( isdefined( self.linkedobject.linkedtargets ) )
            common_scripts\utility::_id_0D13( self.linkedobject.linkedtargets, ::_notsolid );

        while ( self._id_02E2[2] > var_0[2] + 512 )
            wait 0.05;

        for (;;)
        {
            var_12 = self._id_02E2;
            wait 0.05;
            var_13 = _func_06B( var_12, self._id_02E2, 0, self.linkedobject );

            if ( isdefined( var_13["entity"] ) )
                continue;

            if ( var_13["fraction"] != 1 )
                break;
        }

        if ( isdefined( self.linkedobject.linkedtargets ) )
        {
            foreach ( var_15 in self.linkedobject.linkedtargets )
            {
                if ( isdefined( var_15 ) )
                    var_15 _id_2856();
            }
        }

        self _meth_82AA( self._id_02E2 + ( 0, 0, 24 ), 0.5, 0, 0 );
        self _meth_82B1( var_1, 0.5, 0, 0 );
    }
    else
    {
        self _meth_82AA( var_0, var_8, var_10, var_11 );
        self _meth_82B1( var_1, var_8, var_10, var_11 );
        wait(var_8);
    }

    if ( !isdefined( self ) )
        return;

    self._id_0500 = _id_A5A4::vector_multiply( var_9, var_7 / var_8 );
    self.movefinished = 1;
}

clear_all_vehicles_but_heros_and_hind()
{
    level notify( "clear_all_vehicles_but_heros" );
    var_0 = _id_A5A8::get_script_vehicles();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_04FF == "hind" )
        {
            self notify( "gunner_new_target" );
            continue;
        }

        var_3 = var_0[var_2]._id_750A;
        var_1 = [];

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_3[var_4] ishero() )
            {
                var_1[var_1.size] = var_3[var_4];
                continue;
            }

            if ( isdefined( var_3[var_4]._id_58D7 ) && var_3[var_4]._id_58D7 )
                var_3[var_4] _id_A5A4::_id_8EA4();

            var_3[var_4] delete();
        }

        for ( var_4 = 0; var_4 < var_1.size; var_4++ )
            guy_force_remove_from_vehicle( var_0[var_2], var_1[var_4] );

        var_0[var_2] vehicle_clear_truckjunk();
        var_0[var_2] delete();
    }
}

vehicle_clear_truckjunk()
{
    var_0 = self._id_9882;

    if ( isdefined( self.jeepride_linked_weapon ) )
        self.jeepride_linked_weapon delete();

    if ( !isdefined( var_0 ) )
        return;

    common_scripts\utility::_id_0D13( self._id_9882, ::_id_2856 );
}

guy_force_remove_from_vehicle( var_0, var_1, var_2 )
{
    var_0 notify( "forcedremoval" );
    var_0._id_750A = common_scripts\utility::_id_0CF6( var_0._id_750A, var_1 );
    var_0._id_9BFD[var_1._id_9D1B] = 0;
    var_1 notify( "jumpedout" );
    var_1 notify( "newanim" );

    if ( _func_0CF( var_1 ) )
        var_1 _meth_81CE( "stand", "crouch", "prone" );

    var_1._id_750E = undefined;
    var_1._id_2E18 = undefined;
    var_1._id_9D1B = undefined;
}

startgen()
{
    self waittill( "trigger" );

    while ( !jeepride_start_dump( self._id_7A99 ) )
        wait 0.05;
}

clearenemy_loc()
{
    self _meth_816A();
}

tire_deflate()
{
    if ( self._id_04FF != "bm21_troops" )
        return;

    if ( common_scripts\utility::_id_382E( "end_ride" ) )
        return;

    level endon( "end_ride" );
    level.tiredefeffectcount = 0;
    self endon( "death" );
    self endon( "stop_tire_deflate" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_6 ) || !isdefined( var_5 ) )
            return;

        if ( _func_1AD( var_1 ) && _func_120( var_6, "_wheel" ) )
            thread tire_deflater( var_2, var_3, var_6 );
    }
}

tire_deflater( var_0, var_1, var_2 )
{
    if ( level.tiredefeffectcount > 1 )
        return;

    level.tiredefeffectcount++;
    self endon( "stop_tire_deflate" );
    var_3 = spawn( "script_model", var_1 );
    var_3 _meth_80B3( "axis" );
    var_3 _meth_8056();
    var_3 _meth_809C( "mtl_steam_pipe_hit" );
    thread tire_deflater_interuptable( var_3 );
    var_3 _meth_804F( self, var_2, ( 32, 0, 0 ), ( 0, 0, 0 ) );
    self _meth_8250( self._id_02E2 + ( 23, 33, 64 ), 1 );
    playfxontag( level._id_058F["tire_deflate"], var_3, "polySurface1" );
    wait 3;
    level.tiredefeffectcount--;
    var_3 delete();
}

tire_deflater_interuptable( var_0 )
{
    var_0 endon( "death" );
    self waittill( "stop_tire_deflate" );
    var_0 delete();
}

nodisconnectpaths()
{
    self waittill( "trigger", var_0 );
    var_0._id_2D30 = 1;
}

vehicle_mgmanage()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    self endon( "stop_thinking" );
    self endon( "bridge_zakhaev_setup" );
    var_0 = self._id_5BD5[0];

    for (;;)
    {
        var_1 = _func_0D9( "axis" );

        if ( mg_check_for_friends( var_0, var_1 ) )
            _id_A5A8::_id_5BD2();
        else
            _id_A5A8::_id_5BD3();

        wait 0.05;
    }
}

mg_check_for_friends( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( common_scripts\utility::_id_A347( var_0 _meth_8184( "tag_flash" ), var_0 _meth_8185( "tag_flash" ), var_1[var_2] _meth_80AA(), _func_0B7( 10 ) ) )
            return 1;
    }

    return 0;
}

vehicle_turret_think()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    self endon( "stop_thinking" );
    self endon( "bridge_zakhaev_setup" );
    self.turretfiring = 0;
    var_0 = undefined;
    var_1 = [];
    var_1[0] = level._id_6F7C;
    var_1[1] = level.griggs;
    var_1[2] = level._id_3C61;
    var_2 = undefined;
    self _meth_825E( level._id_0318 );
    thread vehicle_mgmanage();

    for (;;)
    {
        wait 0.05;
        var_0 = level._id_0318;

        if ( isdefined( var_0 ) && _func_1AD( var_0 ) )
        {
            var_3 = 0;
            var_3 = _func_08E( self _meth_8184( "tag_flash" ), level._id_0318 _meth_80AA(), 1, self );

            if ( !var_3 )
                var_0 = vehicle_get_target( var_1 );
        }

        if ( _func_1A1( var_0 ) )
        {
            var_4 = var_0._id_02E2 + ( 0, 0, 32 );
            self _meth_825D( bulletspread( self _meth_8184( "tag_flash" ), var_4, 2.0 ) );

            if ( getdvar( "debug_bmp" ) == "1" )
                thread _id_A5A4::_id_2DBF( self._id_02E2 + ( 0, 0, 32 ), var_4, 1, 0, 0, self, "stop_drawing_line" );

            var_5 = _func_0B5( 2, 3 );
            common_scripts\utility::_id_A0A0( "turret_rotate_stopped", var_5 );

            if ( _func_1A1( var_0 ) )
            {
                if ( _func_0F0( var_0._id_02E2, self._id_02E2 ) <= level.bmpmgrangesquared )
                {
                    wait 0.5;

                    if ( !self.turretfiring )
                        thread vehicle_fire_main_cannon();
                }
                else if ( !self.turretfiring )
                    thread vehicle_fire_main_cannon();
            }
            else
                var_0 = vehicle_get_target( var_1 );
        }
    }
}

vehicle_fire_main_cannon( var_0 )
{
    self endon( "death" );
    self endon( "c4_detonation" );
    var_1 = _func_1B0( "bmp_turret" );

    if ( !isdefined( var_0 ) )
        var_0 = _func_0B4( 3, 8 );

    self.turretfiring = 1;
    var_2 = 0;

    while ( var_2 < var_0 )
    {
        var_2++;
        wait(var_1);
        self _meth_8264();
    }

    self.turretfiring = 0;
}

vehicle_get_target( var_0 )
{
    var_1 = _id_A53F::_id_3F7F( level.bmpcannonrange, level._id_2235["180"], 1, 1, 0, 0, var_0 );
    return var_1;
}

vehicle_badplacer()
{
    var_0 = _func_1EC( self._id_04A4, "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_2 = 500;

    if ( isdefined( self._id_0351 ) )
        var_2 = self._id_0351;

    var_3 = 3;

    if ( isdefined( self._id_7A8E ) )
        var_3 = self._id_7A8E;

    badplace_cylinder( "badplacer_" + var_0._id_04A6, var_3, self._id_02E2, var_2, 300, "allies", "axis" );
}

path_array_setup_loc( var_0 )
{
    var_1 = _id_A5AA::_id_3D7E;
    var_2 = 0;
    var_3 = [];

    while ( isdefined( var_0 ) )
    {
        var_3[var_2] = var_0;
        var_2++;

        if ( isdefined( var_0._id_04A4 ) )
        {
            var_0 = [[ var_1 ]]( var_0._id_04A4 );
            continue;
        }

        break;
    }

    return var_3;
}

stop_looping_deathfx()
{
    _id_A5AA::_id_2662() delete();
}

guy_hidetoback_check( var_0, var_1 )
{
    return isdefined( _id_A5A9::_id_0BE9( self, var_1 ).hidetoback );
}

guy_hidetoback_startingback( var_0, var_1 )
{
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hidetoback );
    thread guy_back_attack( var_0, var_1 );
}

guy_back_attack( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );

    for (;;)
        _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.back_attack );
}

guy_backtohide_check( var_0, var_1 )
{
    return isdefined( _id_A5A9::_id_0BE9( self, var_1 ).backtohide );
}

guy_hide_starting_back( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );
    _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.backtohide );
    thread guy_hide_attack_back( var_0, var_1 );
}

guy_hide_startingleft( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );

    if ( !isdefined( var_2.backtohide ) )
        return _id_A5A9::_id_449B( var_0, var_1 );

    _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.backtohide );
    thread guy_hide_attack_left( var_0, var_1 );
}

guy_backtohide( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );
    _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.backtohide );
    thread _id_A5A9::_id_449B( var_0, var_1 );
}

guy_react( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );
    _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.react );
    thread _id_A5A9::_id_449B( var_0, var_1 );
}

guy_react_check( var_0, var_1 )
{
    return isdefined( _id_A5A9::_id_0BE9( self, var_1 ).react );
}

guy_hide_attack_back_check( var_0, var_1 )
{
    return isdefined( _id_A5A9::_id_0BE9( self, var_1 ).hide_attack_back );
}

guy_hide_attack_back( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2.hide_attack_back_occurrence ) )
        {
            var_3 = _id_A5A9::_id_712A( var_0, var_2.hide_attack_back_occurrence );
            _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_back[var_3] );
            continue;
        }

        _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_back );
    }
}

guy_hide_attack_forward_check( var_0, var_1 )
{
    return isdefined( _id_A5A9::_id_0BE9( self, var_1 ).hide_attack_forward );
}

guy_hide_attack_forward( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );

    for (;;)
        _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_forward );
}

guy_hide_attack_left_check( var_0, var_1 )
{
    return isdefined( _id_A5A9::_id_0BE9( self, var_1 ).hide_attack_left );
}

guy_hide_attack_left( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2.hide_attack_left_occurrence ) )
        {
            var_3 = _id_A5A9::_id_712A( var_0, var_2.hide_attack_left_occurrence );
            _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_left[var_3] );
            continue;
        }

        _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_left );
    }
}

guy_hide_attack_left_standing( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = _id_A5A9::_id_0BE9( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2.hide_attack_left_standing_occurrence ) )
        {
            var_3 = _id_A5A9::_id_712A( var_0, var_2.hide_attack_left_standing_occurrence );
            _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_left_standing[var_3] );
            continue;
        }

        _id_A5A9::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_left_standing );
    }
}

remember_weaponsondeath( var_0 )
{
    if ( !isdefined( self._id_0513 ) )
        return;

    var_1 = [];
    var_1[0] = "weapon_" + self._id_0513;
    var_1[1] = "weapon_" + self._id_0340;
    var_1[2] = "weapon_" + self._id_03B3;
    level.potentialweaponitems = _id_A5A4::_id_0CF2( level.potentialweaponitems, var_1 );
}

remove_all_weapons()
{
    level.potentialweaponitems = common_scripts\utility::_id_0CDA( level.potentialweaponitems, "weapon_fraggrenade" );
    level.potentialweaponitems = common_scripts\utility::_id_0CDA( level.potentialweaponitems, "weapon_brick_bomb" );
    level.potentialweaponitems = common_scripts\utility::_id_0CDA( level.potentialweaponitems, "weapon_claymore" );
    level.potentialweaponitems = common_scripts\utility::_id_0CDA( level.potentialweaponitems, "weapon_flash_grenade" );
    level.potentialweaponitems = common_scripts\utility::_id_0CDA( level.potentialweaponitems, "weapon_smoke_grenade_american" );
    var_0 = undefined;

    for ( var_1 = 0; var_1 < level.potentialweaponitems.size; var_1++ )
    {
        var_0 = getentarray( level.potentialweaponitems[var_1], "classname" );

        if ( !var_0.size )
            continue;

        common_scripts\utility::_id_0CF0( var_0, _id_A5A4::_id_284E );
    }
}

add_death_function( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4["func"] = var_0;
    var_4["params"] = 0;

    if ( isdefined( var_1 ) )
    {
        var_4["param1"] = var_1;
        var_4["params"]++;
    }

    if ( isdefined( var_2 ) )
    {
        var_4["param2"] = var_2;
        var_4["params"]++;
    }

    if ( isdefined( var_3 ) )
    {
        var_4["param3"] = var_3;
        var_4["params"]++;
    }

    self._id_265F[self._id_265F.size] = var_4;
}
#using_animtree("vehicles");

freeonend()
{
    if ( common_scripts\utility::_id_382E( "end_ride" ) )
        return;

    self endon( "end_ride" );
    self endon( "no_free_on_end" );
    self waittill( "reached_end_node" );
    self _meth_8251();
    self _meth_8144( %root, 0.5 );

    if ( isdefined( self._id_5D41 ) && self._id_5D41 )
        self _meth_8056();
}

hidemeuntilflag()
{
    self waittill( "trigger", var_0 );

    for ( var_1 = 0; var_1 < var_0._id_750A.size; var_1++ )
        var_0._id_750A[var_1] _meth_8056();

    var_0 _meth_8056();
    common_scripts\utility::_id_384A( self._id_79DA );
    var_0 _meth_8055();

    for ( var_1 = 0; var_1 < var_0._id_750A.size; var_1++ )
        var_0._id_750A[var_1] _meth_8055();
}

ishero()
{
    if ( !isdefined( self._id_0398 ) )
        return 0;

    return self._id_0398 == "price" || self._id_0398 == "griggs" || self._id_0398 == "gaz" || self._id_0398 == "medic";
}

crazy_bmp()
{
    self waittill( "trigger", var_0 );

    if ( common_scripts\utility::_id_382E( "bridge_zakhaev_setup" ) )
        return;

    level.crazy_bmp = var_0;
    var_0 thread vehicle_turret_think();
}

clouds_off()
{
    self waittill( "trigger" );
    common_scripts\utility::_id_0D13( _id_A5A4::_id_3FA9( "cloud_bank_far" ), common_scripts\utility::_id_671F );
}

clouds_on()
{
    self waittill( "trigger" );
    common_scripts\utility::_id_0D13( _id_A5A4::_id_3FA9( "cloud_bank_far" ), _id_A5A4::_id_748D );
}

shot_in_the_head_point_blank( var_0, var_1, var_2 )
{
    var_3 = var_0 _meth_8184( "j_head" );
    var_4 = var_0 _meth_8185( "j_head" );
    var_3 += var_1;
    var_4 += var_2;

    if ( getdvarint( "cg_blood" ) != 0 )
        playfx( level._id_058F["bloodsplash"], var_3, anglestoforward( var_4 ) );

    var_0 blead();
}

blead_on_death( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 45;

    self waittill( "death" );
    blead( var_0 );
}

blead( var_0 )
{
    if ( getdvarint( "cg_blood" ) == 0 )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 45;

    var_1 = _id_A5A4::_id_4417( self _meth_8184( "J_Head" ) );
    var_1 += _id_A5A4::vector_multiply( _func_114( common_scripts\utility::_id_38C9( level._id_0318._id_02E2 ) - common_scripts\utility::_id_38C9( var_1 ) ), var_0 );
    wait 0.5;
    playfx( level._id_058F["bloodpool"], var_1 + ( 15, 35, 0 ), ( 0, 0, 1 ) );
}

shot_in_the_head( var_0 )
{
    if ( getdvarint( "cg_blood" ) == 0 )
        return;

    var_1 = common_scripts\utility::_id_8959();
    var_1 _meth_804F( var_0, "tag_eye", ( 0, 0, 0 ), ( 15, 180, 0 ) );
    playfxontag( level._id_058F["griggs_brains"], var_1, "tag_origin" );
}

save_fail_on_rpgguy()
{
    return 0;
}

alltheweapons()
{
    var_0 = [];
    var_0[var_0.size] = "weapon_ak47";
    var_0[var_0.size] = "weapon_ak74u";
    var_0[var_0.size] = "weapon_g36c";
    var_0[var_0.size] = "weapon_m16_basic";
    var_0[var_0.size] = "weapon_m16_grenadier";
    var_0[var_0.size] = "weapon_m4_grunt";
    var_0[var_0.size] = "weapon_m4_silencer_acog";
    var_0[var_0.size] = "weapon_m4_grenadier";
    var_0[var_0.size] = "weapon_g3";
    var_0[var_0.size] = "weapon_m4m203_silencer";
    var_0[var_0.size] = "weapon_m4m203_silencer_reflex";
    var_0[var_0.size] = "weapon_m4_silencer";
    var_0[var_0.size] = "weapon_ak47_grenadier";
    var_0[var_0.size] = "weapon_saw";
    var_0[var_0.size] = "weapon_rpd";
    var_0[var_0.size] = "weapon_at4";
    var_0[var_0.size] = "weapon_stinger";
    var_0[var_0.size] = "weapon_winchester1200";
    var_0[var_0.size] = "weapon_rpg";
    var_0[var_0.size] = "weapon_mp5";
    var_0[var_0.size] = "weapon_p90";
    var_0[var_0.size] = "weapon_beretta";
    var_0[var_0.size] = "weapon_dragunov";
    var_0[var_0.size] = "weapon_m14_scoped";
    var_0[var_0.size] = "weapon_m40a3";
    var_0[var_0.size] = "weapon_remington700";
    var_0[var_0.size] = "weapon_usp";
    var_0[var_0.size] = "weapon_uzi";
    var_0[var_0.size] = "weapon_uzi_sd";
    var_0[var_0.size] = "weapon_skorpion";
    var_0[var_0.size] = "weapon_m60e4";
    var_0[var_0.size] = "weapon_c4";
    var_0[var_0.size] = "weapon_claymore";
    var_0[var_0.size] = "weapon_mp5_silencer";
    var_0[var_0.size] = "weapon_p90_silencer";
    var_0[var_0.size] = "weapon_colt45";
    var_0[var_0.size] = "weapon_deserteagle";
    var_0[var_0.size] = "weapon_m1014";
    var_0[var_0.size] = "weapon_javelin";
    var_0[var_0.size] = "weapon_barrett";
    return var_0;
}

exploder_phys()
{
    if ( self.classname != "script_model" )
        return;

    if ( !_func_120( self._id_029C, "com_debris" ) )
        return;

    level waittill( "exploded_" + self._id_79BF );
    wait 0.1;
    self _meth_82BE( self._id_02E2, ( 0, 0, 1 ) );
}

layer_of_death_ai_mode( var_0, var_1 )
{
    self._id_1300 = var_0;

    if ( var_1 )
        self._id_0179 = level._id_0318;
    else
        self._id_0179 = undefined;
}

layer_of_death_getlayer( var_0 )
{
    var_1 = [];
    var_1[0] = [];
    var_1[1] = [];
    var_1[2] = [];
    var_1[3] = [];

    switch ( level._id_3BFE )
    {
        case 0:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1;
            var_1[1]["threatbias"] = 150;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.2;
            var_1[2]["threatbias"] = 150;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
        case 1:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1.1;
            var_1[1]["threatbias"] = 165;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.7;
            var_1[2]["threatbias"] = 200;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
            break;
        case 2:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1.3;
            var_1[1]["threatbias"] = 175;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.7;
            var_1[2]["threatbias"] = 200;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
            break;
        case 3:
            var_1[0]["baseaccuracy"] = 1;
            var_1[0]["threatbias"] = 150;
            var_1[0]["playerisfavoriteenemy"] = 0;
            var_1[1]["baseaccuracy"] = 1.3;
            var_1[1]["threatbias"] = 175;
            var_1[1]["playerisfavoriteenemy"] = 0;
            var_1[2]["baseaccuracy"] = 1.7;
            var_1[2]["threatbias"] = 200;
            var_1[2]["playerisfavoriteenemy"] = 0;
            var_1[3]["baseaccuracy"] = 2;
            var_1[3]["threatbias"] = 250;
            var_1[3]["playerisfavoriteenemy"] = 0;
            var_1[4]["baseaccuracy"] = 3;
            var_1[4]["threatbias"] = 400;
            var_1[4]["playerisfavoriteenemy"] = 1;
            break;
        default:
    }

    return var_1[var_0];
}

layer_of_death( var_0 )
{
    level endon( "murdering_player" );

    for (;;)
    {
        self waittill( "trigger" );
        set_layer_of_death( var_0 );
    }
}

layer_of_death_timed_kill( var_0 )
{
    level endon( "layer_of_death" );
    wait(var_0);
    player_kill();
}

set_layer_of_death( var_0 )
{
    if ( level.ai_in_boundry )
        return;

    level.last_layer_of_death = var_0;
    var_1 = layer_of_death_getlayer( var_0 );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::layer_of_death_ai_mode, var_1["baseaccuracy"], var_1["playerisfavoriteenemy"] );
    level._id_0318._id_04B1 = var_1["threatbias"];
    level notify( "layer_of_death" );

    if ( var_0 == 4 )
        thread layer_of_death_timed_kill( 4 );

    level waittill( "layer_of_death" );
}

encroacher()
{
    var_0 = 10;
    var_1 = [];
    var_1[0] = "bridge_encroach_03";
    var_1[1] = "bridge_encroach_02";
    var_1[2] = "bridge_encroach_01";
    level endon( "bridge_zakhaev_setup" );
    level endon( "murdering_player" );

    switch ( level._id_3BFE )
    {
        case 0:
            var_0 = 25;
            break;
        case 1:
            var_0 = 17;
            break;
        case 2:
            var_0 = 12;
            break;
        case 3:
            var_0 = 8;
            break;
    }

    var_0 = 20;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        _id_A5A4::_id_070A( var_1[var_2] );
        wait(var_0);
    }
}

unload_single_guy()
{
    var_0 = undefined;

    for ( var_1 = 0; var_1 < self._id_750A.size; var_1++ )
    {
        if ( !isdefined( self._id_750A[var_1]._id_70DB ) )
        {
            var_0 = self._id_750A[var_1];
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        return;

    self._id_443C = var_0._id_9D1B;
    thread _id_A5A8::_id_9C7F( "unload" );
    return var_0;
}

unloadmanager()
{
    level.drone_unloader++;
    self waittill( "trigger", var_0 );
    var_0._id_2D3D = 1;
    level.vehicles_with_drones[level.vehicles_with_drones.size] = var_0;
}

bridge_vehiclde_drone_unloader()
{
    level endon( "bridge_zakhaev_setup" );
    var_0 = 0;
    var_1 = 12;

    switch ( level._id_3BFE )
    {
        case 0:
            var_1 = 10;
            break;
        case 1:
            var_1 = 11;
            break;
        case 2:
            var_1 = 12;
            break;
        case 3:
            var_1 = 13;
            break;
    }

    for (;;)
    {
        while ( !level.vehicles_with_drones.size )
            wait 0.05;

        if ( _func_0D9( "axis" ).size + count_unload_que() < var_1 && level.vehicles_with_drones.size )
            level.vehicles_with_drones[var_0] unload_single_guy();

        if ( !level.vehicles_with_drones[var_0]._id_750A.size )
        {
            level.vehicles_with_drones = common_scripts\utility::_id_0CF6( level.vehicles_with_drones, level.vehicles_with_drones[var_0] );
            level.drone_unloader--;
        }

        wait 0.1;
        var_0++;

        if ( var_0 >= level.vehicles_with_drones.size )
            var_0 = 0;

        if ( level.drone_unloader == 0 )
            break;
    }

    common_scripts\utility::_id_383F( "no_more_drone_unloaders" );
}

count_unload_que()
{
    var_0 = 0;
    var_1 = _id_A5A8::get_script_vehicles();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0 += var_1[var_2]._id_9A44.size;

    return var_0;
}

kill_unload_que()
{
    common_scripts\utility::_id_0D13( _id_A5A8::get_script_vehicles(), ::vehicle_enemies_with_drones_delete_on_unload );
    common_scripts\utility::_id_0D13( level.vehicles_with_drones, ::kill_unload_que_single_vehicle );
}

vehicle_enemies_with_drones_delete_on_unload()
{
    if ( self._id_7AEF == "allies" )
        return;

    for ( var_0 = 0; var_0 < self._id_750A.size; var_0++ )
        self._id_750A[var_0]._id_2E3F = 1;
}

kill_unload_que_single_vehicle()
{
    common_scripts\utility::_id_0CF0( self._id_750A, _id_A5A4::_id_284E );
}

bridge_defence_bounds()
{
    level endon( "bridge_zakhaev_setup" );
    var_0 = getent( "defence_bounds", "targetname" );
    var_1 = 0;

    switch ( level._id_3BFE )
    {
        case 0:
            var_1 = 32;
            break;
        case 1:
            var_1 = 24;
            break;
        case 2:
            var_1 = 12;
            break;
        case 3:
            var_1 = 7;
            break;
    }

    var_2 = gettime() + var_1 * 1000;

    for (;;)
    {
        var_0 waittill( "trigger", var_3 );
        var_2 = gettime() + var_1 * 1000;

        while ( _func_1A1( var_3 ) && gettime() < var_2 )
            wait 0.05;

        if ( !_func_1A1( var_3 ) )
            continue;

        var_4 = 1;
        set_layer_of_death( 4 );
        level.ai_in_boundry = 1;

        while ( var_4 )
        {
            var_5 = _func_0D9( "axis" );
            var_4 = 0;

            for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            {
                if ( var_5[var_6] _meth_80AB( var_0 ) )
                {
                    var_4 = 1;
                    break;
                }
            }

            wait 0.05;
        }

        level.ai_in_boundry = 0;
        set_layer_of_death( level.last_layer_of_death );
    }
}

heros_shields_off()
{
    common_scripts\utility::_id_0D13( _id_A5A4::_id_3D94(), _id_A5A4::_id_8EA4 );
}

heros_shields_on()
{
    common_scripts\utility::_id_0D13( _id_A5A4::_id_3D94(), _id_A5A4::_id_58D7 );
}

hind_bombplayer()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "stop_killing_theplayer" );
    wait 2;

    for (;;)
    {
        var_1 = _func_0B2( 4 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            var_3 = nearby_destry_at_end_vehicle();
            var_4 = 200;
            var_5 = 300;

            if ( level._id_0318._id_01E6 != level._id_0318._id_0271 )
            {
                var_4 = 400;
                var_5 = 600;
            }

            var_6 = undefined;

            if ( level._id_0318._id_01E6 == level._id_0318._id_0271 )
                var_6 = nearby_non_hero();

            if ( isdefined( var_3 ) )
                var_7 = var_3._id_02E2 + ( 0, 0, 16 );
            else if ( isdefined( var_6 ) )
                var_7 = var_6[var_2]._id_02E2;
            else
                var_7 = random_outer_box( level._id_0318._id_02E2, var_4, var_5 );

            if ( player_in_blastradius() )
                var_7 = level._id_0318 _meth_80AA();

            var_0 shootspotoncewithmissile( var_7 );
        }

        wait(_func_0B5( 0.5, 1 ));
    }
}

player_in_blastradius()
{
    if ( _func_0EE( ( -36286.3, -17573.5, 0 ), common_scripts\utility::_id_38C9( level._id_0318._id_02E2 ) ) < 962.438 )
        return 1;

    return 0;
}

random_outer_box( var_0, var_1, var_2 )
{
    var_3 = _func_0B2( 50 ) > 25;
    var_4 = _func_0B2( 50 ) > 25;

    if ( !var_3 )
        var_3 = -1;

    if ( !var_4 )
        var_4 = -1;

    var_5 = _func_0B5( var_1, var_2 ) * var_3;
    var_5 += var_0[0];
    var_6 = _func_0B5( var_1, var_2 ) * var_4;
    var_6 += var_0[1];
    var_7 = var_0[2];
    return ( var_5, var_6, var_7 );
}

nearby_destry_at_end_vehicle()
{
    var_0 = undefined;

    if ( level._id_0318._id_01E6 != level._id_0318._id_0271 )
        return var_0;

    var_1 = gettime() + 10000;
    var_2 = getentarray( "destroy_at_end", "script_noteworthy" );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_2[var_4].code_classname == "script_vehicle" && _func_1A1( var_2[var_4] ) )
            var_3[var_3.size] = var_2[var_4];
    }

    if ( !var_3.size )
        return var_0;

    var_0 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_3, 500 );
    return var_0;
}

nearby_non_hero()
{

}

drag_shots()
{
    level endon( "stop_drag_shots" );
    var_0 = 4;
    var_1 = 0.4;
    var_2 = getent( self._id_04A4, "targetname" );
    var_3 = self._id_02E2;
    var_4 = var_2._id_02E2;

    for (;;)
    {
        var_0 = _func_0B4( 3, 6 );
        var_1 = 0.4;

        for ( var_5 = 0; var_5 < var_0; var_5++ )
        {
            var_6 = bulletspread( var_3, var_4, 5 );
            var_7 = _func_06B( var_3, var_6, 1, undefined );

            if ( isdefined( var_7["entity"] ) && ( _func_0CF( var_7["entity"] ) || var_7["entity"].classname == "script_model" ) )
            {
                wait 0.05;
                continue;
            }

            var_6 = var_7["position"];
            bullettracer( var_3, var_6, 0 );
            var_8 = var_6 - _id_A5A4::vector_multiply( _func_114( var_6 - var_3 ), 5 );
            _func_1C2( "ak47", var_3, var_3 + ( 0, 0, 66 ) );
            var_9 = ak_fx_lookup( var_7["surfacetype"] );
            playfx( var_9, var_6, var_7["normal"] );
            wait 0.1;
        }

        wait(var_1);
    }
}

ak_fx_lookup( var_0 )
{
    var_1 = level._ak_impacts[var_0];

    if ( !isdefined( var_1 ) )
        var_1 = level._ak_impacts["concrete"];

    return var_1;
}

honker_initiate()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0.honker_thinking ) )
            continue;

        var_0 thread honker_think();
    }
}

honker_think()
{
    self.honker_thinking = 1;
    self endon( "death" );

    if ( !playervehicle_infront_of_honkingvehicle_vehicle( level.playersride, self ) )
        return;

    while ( playervehicle_infront_of_honkingvehicle_vehicle( level.playersride, self ) )
        wait 0.05;

    thread common_scripts\utility::_id_2DA0( self._id_02E2, level.playersride._id_02E2, ( 1, 0, 0 ), 6 );
}

playervehicle_infront_of_honkingvehicle_vehicle( var_0, var_1 )
{
    var_2 = anglestoforward( common_scripts\utility::_id_38C8( var_1.angles ) );
    var_3 = _func_114( common_scripts\utility::_id_38C9( var_0._id_02E2 ) - common_scripts\utility::_id_38C9( var_1._id_02E2 ) );
    var_4 = _func_0F6( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

ride_smoker()
{

}

player_kill()
{
    level._id_0318 _meth_8134( 0 );
    level._id_0318 _meth_80F2();
    level._id_0318 _meth_8054();
    level._id_0318 _meth_8134( 1 );
}

_id_17F9()
{
    self waittill( "trigger" );
    var_0 = 1.0;
    setomnvar( "ui_go_black", var_0 );
    wait(var_0);
    player_kill();
}

player_fudge_rotateto( var_0, var_1 )
{
    var_2 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_2._id_02E2 = level._id_0318 _meth_80AA();
    var_2.angles = level._id_0318 _meth_8338();

    if ( !isdefined( var_1 ) )
        var_1 = 0.5;

    var_2 _meth_82B1( var_0, var_1, 0.2, 0.2 );
    var_3 = _func_0BC( var_1 / 0.05 );

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        level._id_0318 _meth_8337( var_2.angles );
        wait 0.05;
    }
}

exp_fade_overlay( var_0, var_1 )
{
    var_2 = 4;
    var_3 = 90 / var_2;
    var_4 = 0;
    var_5 = var_1 / var_2;
    var_6 = self.alpha;
    var_7 = var_6 - var_0;

    for ( var_8 = 0; var_8 < var_2; var_8++ )
    {
        var_4 += var_3;
        self _meth_8086( var_5 );

        if ( var_0 > var_6 )
        {
            var_9 = 1 - _func_0B7( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }
        else
        {
            var_9 = _func_0B6( var_4 );
            self.alpha = var_6 - var_7 * var_9;
        }

        wait(var_5);
    }

    self.alpha = var_0;
}

_id_23D0( var_0, var_1 )
{
    var_2 = _func_1A9();
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2 _meth_80CE( var_0, 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2._id_01F3 = "fullscreen";
    var_2._id_0501 = "fullscreen";
    var_2._id_0198 = 1;
    var_2.alpha = var_1;

    if ( !isdefined( level.overlays ) )
        level.overlays = [];

    level.overlays[level.overlays.size] = var_2;
    return var_2;
}

rescue_scene_patrol_01()
{
    wait 2;
    var_0 = _func_0D9( "allies" );
    var_1 = [];

    if ( isdefined( level.medic ) )
        var_1[var_1.size] = level.medic;

    if ( isdefined( level.ru1 ) )
        var_1[var_1.size] = level.ru1;

    if ( isdefined( level.ru2 ) )
        var_1[var_1.size] = level.ru2;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2].rescue_patroler ) && var_0[var_2].rescue_patroler == self._id_04A6 )
            var_1[var_1.size] = var_0[var_2];
    }

    var_3 = common_scripts\utility::_id_3CCB( self._id_02E2, var_0, var_1, 1 )[0];
    var_3.rescue_patroler = self._id_04A6;

    if ( isdefined( var_3._id_750E ) )
    {
        var_3 waittill( "jumpedout" );
        wait 0.05;
    }

    var_3 _meth_81CA( self._id_02E2, ( 0, 0, 0 ) );

    if ( isdefined( self._id_04A4 ) )
        var_3 thread _id_A55F::_id_66FC( self._id_04A4 );
}

flag_sound( var_0 )
{
    if ( common_scripts\utility::_id_382E( "flag_sound" + var_0 ) )
        return;

    common_scripts\utility::_id_383F( "flag_sound" + var_0 );
    _id_A5A4::_id_69C4( var_0 );
    common_scripts\utility::_id_3831( "flag_sound" + var_0 );
}

fake_water_tread()
{
    var_0 = _id_A5A8::get_script_vehicles();
    var_1 = undefined;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_04FF == "hind" )
            var_1 = var_0[var_2];
    }

    if ( !isdefined( var_1 ) )
        return;

    level endon( "end_fake_water_tread" );

    for (;;)
    {
        var_3 = ( var_1._id_02E2[0], var_1._id_02E2[1], 375 );
        playfx( level._id_0685[var_1.classname]["water"], var_3 );
        wait 0.1;
    }
}

stop_fake_water_tread()
{
    level notify( "end_fake_water_tread" );
}

crashed_vehicles_setup()
{
    var_0 = getentarray( "crash_trigger", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = getentarray( var_2._id_0398, "script_noteworthy" );
        var_3 = common_scripts\utility::_id_0CF7( var_3, var_0 );
        common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, ::delete_crashed_vehicle, var_2 );
    }
}

delete_crashed_vehicle( var_0 )
{
    var_0 waittill( "trigger" );
    _id_A5A8::_id_4258();
    self notify( "stop_friendlyfire_shield" );
    self._id_01E6 = 1;

    if ( common_scripts\utility::_id_50F2() )
        self notify( "damage", 5000, level._id_0318, ( 1, 1, 1 ), self._id_02E2, "mod_explosive", self._id_029C, undefined );
    else
        self notify( "death" );
}

mountain_bridge()
{
    self _meth_8055();
}

bridge_linkto( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
        var_4 _meth_804F( self, var_1 );
}

stumble( var_0, var_1, var_2, var_3 )
{
    level endon( "stop_stumble" );
    var_0 = _id_085A( var_0 );
    level._id_4413 _meth_82B1( var_0, var_1, var_1 / 4 * 3, var_1 / 4 );
    level._id_4413 waittill( "rotatedone" );
    var_4 = ( _func_0B3( 4 ) - 4, _func_0B3( 5 ), 0 );
    var_4 = _id_085A( var_4 );
    level._id_4413 _meth_82B1( var_4, var_2, 0, var_2 / 2 );
    level._id_4413 waittill( "rotatedone" );

    if ( !isdefined( var_3 ) )
        level notify( "recovered" );
}

limp()
{
    level endon( "stop_limp" );
    level._id_4413 = spawn( "script_model", ( 0, 0, 0 ) );
    level._id_0318 _meth_8093( level._id_4413 );
    var_0 = 0;
    var_1 = 0;

    for (;;)
    {
        var_2 = level._id_0318 _meth_8336();
        var_3 = _func_0BE( var_2[0] ) + _func_0BE( var_2[1] );

        if ( var_3 < 10 )
        {
            wait 0.05;
            continue;
        }

        var_4 = var_3 / level._id_6C19;
        var_5 = _func_0B5( 3, 5 );

        if ( _func_0B2( 100 ) < 20 )
            var_5 *= 3;

        var_6 = _func_0B5( 3, 7 );
        var_7 = _func_0B5( -8, -2 );
        var_8 = ( var_5, var_7, var_6 );
        var_8 = _id_A5A4::vector_multiply( var_8, var_4 );
        var_9 = _func_0B5( 0.35, 0.45 );
        var_10 = _func_0B5( 0.65, 0.8 );
        var_0++;

        if ( var_4 > 1.3 )
            var_0++;

        thread stumble( var_8, var_9, var_10 );
        level waittill( "recovered" );
    }
}

_id_085A( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[2];
    var_3 = anglestoright( level._id_0318.angles );
    var_4 = anglestoforward( level._id_0318.angles );
    var_5 = ( var_3[0], 0, var_3[1] * -1 );
    var_6 = ( var_4[0], 0, var_4[1] * -1 );
    var_7 = _id_A5A4::vector_multiply( var_5, var_1 );
    var_7 += _id_A5A4::vector_multiply( var_6, var_2 );
    return var_7 + ( 0, var_0[1], 0 );
}

helicopter_hide_crash_seq()
{
    var_0 = getent( "heli_destroy", "targetname" );
    var_0 _meth_8056();
}

helicopter_show_crash_seq()
{
    var_0 = getent( "heli_destroy", "targetname" );
    var_0._id_0C72 = "vehicles";
    var_0 _id_A510::_id_7F29();
    wait 0.35;
    var_0 _meth_8055();
    var_0 thread _id_A510::_id_0C24( var_0, "heli_crash" );
    playfxontag( level._id_058F["fire_trail_l_jeepride_rotor_tail"], var_0, "tag_fx_tail" );
    playfxontag( level._id_058F["fire_trail_l_jeepride"], var_0, "tag_fx_cabin" );
    playfxontag( level._id_058F["helicopter_rotor_damaged_fire_jeepride"], var_0, "tag_fx_cabin" );
    playfxontag( level._id_058F["mi24p_cockpite_fire_chd"], var_0, "tag_fx_cockpit" );
}

set_final_visionset()
{
    _id_A5A4::_id_9E6C( "jeepride_end_3", 2 );
    level._id_0318 _id_A5A4::set_light_set_player( "jeepride_end_3" );
}

set_final_visionset_griggsdeath()
{
    wait 2.1;
    level._id_0318 _id_A5A4::set_light_set_player( "jeepride_end_2" );
}

set_final_visionset_zakaev()
{
    _id_A5A4::_id_9E6C( "jeepride_end_2", 54 );
    level._id_0318 _id_A5A4::set_light_set_player( "jeepride_end_2" );
}

set_final_visionset_rescue()
{
    _id_A5A4::_id_9E6C( "jeepride_end_2", 2 );
    wait 28;
    level._id_0318 _id_A5A4::set_light_set_player( "jeepride_end_3" );
}

bloodtrail_spawn()
{
    wait 7;
    var_0 = getent( "bloodspawn", "targetname" );
    var_0 _meth_8055();
}

bloodtrail_hide()
{
    var_0 = getent( "bloodspawn", "targetname" );
    var_0 _meth_8056();
}

spawn_griggs_pistol()
{
    self.scriptedweapon = "wpn_h1_pst_m1911_vm";
    self.scriptedweaponmodel = spawn( "script_model", ( 0, 0, 2 ) );
    self.scriptedweaponmodel _meth_80B3( "wpn_h1_pst_m1911_vm" );
    self.scriptedweaponmodel._id_0C72 = "pistol_griggs";
    self.scriptedweaponmodel _id_A5A4::_id_0D61();
    var_0 = getent( "player_drag_node", "targetname" );
    var_0 thread _id_A510::_id_0C24( self.scriptedweaponmodel, "drag_pistol" );
}

light_sequence_00()
{
    var_0 = getent( "light_2_sequence_00", "targetname" );
    var_1 = getent( "light_3_sequence_00", "targetname" );
    var_2 = getent( "light_4_sequence_00", "targetname" );
    var_0 _meth_81E2( 1 );
    var_2 _meth_81E2( 200000 );
    wait 1;
    var_1 _meth_81E2( 1000000 );
}

disable_light_finalseq()
{
    var_0 = getent( "light_2_sequence_00", "targetname" );
    var_1 = getent( "light_3_sequence_00", "targetname" );
    var_2 = getent( "light_4_sequence_00", "targetname" );
    var_3 = getent( "light_1_sequence_01", "targetname" );
    var_4 = getent( "light_1_sequence_02", "targetname" );
    var_0 _meth_81E2( 1 );
    var_1 _meth_81E2( 1 );
    var_2 _meth_81E2( 1 );
    var_3 _meth_81E2( 1 );
    var_4 _meth_81E2( 1 );
}

light_sequence_01()
{
    var_0 = getent( "light_1_sequence_01", "targetname" );
    var_0 _meth_81E2( 100000 );
}

light_sequence_02()
{
    var_0 = getent( "light_1_sequence_01", "targetname" );
    var_0 _meth_81E2( 1 );
    var_1 = getent( "light_1_sequence_02", "targetname" );
    var_1 _meth_81E2( 4000 );
}

player_speedscaling_bridge_seq()
{
    _func_0D6( "cl_NoWeaponBobAmplitudeVertical", 2.0 );
    _func_0D6( "cl_NoWeaponBobAmplitudeHorizontal", 2.0 );
    level._id_6C19 = 200;
    level._id_0318 _meth_81E4( 0.3 );
    wait 7;
    level._id_0318 _meth_81E4( 0.5 );
    wait 2;
    level._id_0318 _meth_81E4( 0.6 );
    wait 2;
    level._id_0318 _meth_81E4( 0.7 );
    wait 1;
    level._id_0318 _meth_81E4( 0.8 );
    wait 1;
    level._id_0318 _meth_81E4( 1 );
    _func_0D6( "cl_NoWeaponBobAmplitudeVertical", 0 );
    _func_0D6( "cl_NoWeaponBobAmplitudeHorizontal", 0 );
}

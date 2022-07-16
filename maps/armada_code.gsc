// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

near_tv()
{
    level endon( "tvstation_entered" );

    for (;;)
    {
        self waittill( "trigger" );
        common_scripts\utility::_id_383F( "near_tv" );

        while ( level._id_0318 _meth_80AB( self ) )
            wait 1;

        _func_05E();
        level notify( "away_from_tv" );
        common_scripts\utility::_id_3831( "near_tv" );
    }
}

movies_on_tvs()
{
    level endon( "stop_asad_recording" );
    wait 2;
    _func_0D6( "cg_cinematicFullScreen", "0" );

    for (;;)
    {
        common_scripts\utility::_id_384C( "tvstation_entered", "near_tv" );
        start_movie_loop();
    }
}

start_movie_loop()
{
    level endon( "away_from_tv" );
    level endon( "stop_asad_recording" );

    for (;;)
    {
        _func_05C( "asad_speech_180" );
        wait 5;

        while ( _func_05D() )
            wait 1;
    }
}

flashbang_hint()
{
    var_0 = getent( "flashbang_hint", "targetname" );
    var_0 waittill( "trigger" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "throwflash" );
    wait 2;

    if ( !common_scripts\utility::_id_382E( "player_has_flashed" ) )
        thread maps\armada::keyhint( &"ARMADA_HINT_FLASH", "flash", "+smoke", 10 );

    var_1 = getentarray( "hq_breachers", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _func_1A1( var_1[var_2] ) )
            var_1[var_2] _meth_8053( var_1[var_2]._id_01E6 + 100, var_1[var_2]._id_02E2 );
    }
}

flag_on_flash()
{
    notifyoncommand( "player_flash", "-smoke" );
    level._id_0318 waittill( "player_flash" );
    common_scripts\utility::_id_383F( "player_has_flashed" );
}

quiet_circling_helicopters()
{
    var_0 = get_vehiclearray( "circling_heli", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_8287();
}

add_damage_recorder()
{
    self.player_damage_done = 0;
    self.non_player_damage_done = 0;
}

_id_6ACA()
{
    return self.player_damage_done * 1.75 > self.non_player_damage_done;
}

init_pickup_technical()
{
    var_0 = _id_A5AA::_id_05BE();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.classname ) )
        {
            if ( var_2.classname == "script_vehicle_pickup_technical" )
                var_2 thread pickup_technical_think();
        }
    }
}

init_pickup_technical_badplace()
{
    var_0 = _id_A5AA::_id_05BE();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.classname ) )
        {
            if ( var_2.classname == "script_vehicle_pickup_technical" )
                var_2._id_2554 = ::pickup_technical_custombadplace;
        }
    }
}

pickup_technical_custombadplace()
{
    var_0 = 300;
    self endon( "kill_badplace_forever" );

    if ( !self _meth_822B() )
        self endon( "death" );

    self endon( "delete" );
    var_1 = getent( "PickupTechnicalBadBlaceVolume", "targetname" );
    var_2 = isdefined( level._id_9CE0[self._id_029C] ) && level._id_9CE0[self._id_029C];
    var_3 = 0.1;
    var_4 = 17;
    var_5 = 17;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_6 = self _meth_8282();

        if ( var_6 <= 0 )
        {
            wait(var_3);
            continue;
        }

        if ( var_6 < 5 )
            var_7 = 200;
        else if ( var_6 > 5 && var_6 < 8 )
            var_7 = 350;
        else
            var_7 = 500;

        if ( isdefined( self._id_1268 ) )
            var_7 *= self._id_1268;

        if ( var_2 )
            var_8 = anglestoforward( self _meth_8185( "tag_turret" ) );
        else
            var_8 = anglestoforward( self.angles );

        var_1._id_02E2 = self._id_02E2;
        var_1.angles = ( 0.0, self.angles[1], 0.0 );
        badplace_arc( self._id_9A29 + "arc", var_3, self._id_02E2, var_7 * 1.9, var_0, var_8, var_4, var_5, "axis", "team3", "allies" );
        badplace_brush( self._id_9A29 + "bru", var_3, var_1, "axis", "allies" );
        wait(var_3 + 0.05);
    }
}

pickup_arcade_setup()
{
    add_damage_recorder();
    pickup_check_damage();

    if ( _id_6ACA() )
        thread maps\_arcademode::arcademode_add_points( self._id_02E2, 1, "explosive", 200 );
}

pickup_check_damage()
{
    self endon( "pickup_death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( var_1 == level._id_0318 )
        {
            self.player_damage_done += var_0;
            continue;
        }

        if ( var_1 != self && isdefined( var_1._id_04A7 ) && var_1._id_04A7 != "axis" )
            self.non_player_damage_done += var_0;
    }
}

pickup_check_death()
{
    while ( isdefined( self._id_029C ) && self._id_029C != "vehicle_pickup_technical_destroyed" )
        waittillframeend;

    self notify( "pickup_death" );
}

pickup_technical_think()
{
    self waittill( "spawned", var_0 );
    var_0._id_0DF4[0].a._id_2B20 = 1;
    var_0._id_0DF4[0]._id_2AF7 = 1;

    if ( _id_A5A4::_id_0CC3() )
        var_0 thread pickup_arcade_setup();

    var_0.tail_gate = spawn( "script_model", var_0 _meth_8184( "tag_rear_tailgate" ) );
    var_0.tail_gate _meth_80B3( "vehicle_pickup_rear_tailgate" );
    var_0.tail_gate _meth_804F( var_0, "tag_rear_tailgate", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0.tailgate_clip = getent( "tailgate_clip", "targetname" );
    var_0.tailgate_clip._id_02E2 = var_0 _meth_8184( "tag_rear_tailgate" ) + ( 0, 0, 12 );
    var_0.tailgate_clip.angles = var_0 _meth_8185( "tag_rear_tailgate" );
    var_0.tailgate_clip _meth_804F( var_0, "tag_rear_tailgate" );
    var_0 thread vehicle_tail_gate_remove();
    var_1 = spawn( "script_model", var_0._id_5BD5[0] _meth_8184( "tag_flash" ) );
    var_1 _meth_804F( var_0._id_5BD5[0], "tag_flash", ( -25, 0, 0 ), ( 0, 0, 0 ) );
    var_0.col_clip = getent( "col_clip_pickup", "targetname" );
    var_0.col_clip._id_02E2 = var_0._id_5BD5[0]._id_02E2 + ( 0, 0, -12 );
    var_0.col_clip.angles = var_0._id_5BD5[0] _meth_8185( "tag_flash" );
    var_0.col_clip _meth_804F( var_0._id_5BD5[0], "tag_flash" );
    var_0 thread vehicle_gun_clip_remove();
    var_0 thread pickup_check_death();

    for (;;)
    {
        var_2 = level._id_0318 _meth_80AB( var_1 );
        var_3 = isdefined( var_0._id_029C ) && var_0._id_029C == "vehicle_pickup_technical_destroyed";
        var_4 = var_2 || var_3 || var_0._id_0DF4[0]._id_01E6 <= 0;

        if ( var_4 )
        {
            if ( var_2 )
                level._id_0318 _meth_8054();

            var_1 delete();
            break;
        }

        wait 0.5;
    }
}

init_heli_turrets()
{
    level.heli_turrets = [];
    _id_A5A8::waittill_vehiclespawn_noteworthy( "circling_heli" );
    wait 0.1;
    var_0 = get_vehiclearray( "circling_heli", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::setup_circling_heli_turret );
}

circling_helis_fire()
{
    while ( level.heli_turrets.size == 0 )
        wait 1;

    common_scripts\utility::_id_0D13( level.heli_turrets, ::circling_heli_minigun_firethread );
    common_scripts\utility::_id_0D13( level.heli_turrets, ::heli_minigun_targetthread, 10 );
}

intro_helis_fire()
{
    common_scripts\utility::_id_0D13( level.heli_turrets, ::intro_heli_minigun_firethread );
    common_scripts\utility::_id_0D13( level.heli_turrets, ::heli_minigun_targetthread, 2 );
    common_scripts\utility::_id_384A( "kill_rpgs" );
    level notify( "helis_stop_firing" );
}

setup_circling_heli_turret()
{
    var_0 = "tag_gun_l";
    var_1 = spawnturret( "misc_turret", self _meth_8184( var_0 ), "heli_minigun_noai" );
    var_1 _meth_80B3( "weapon_saw_MG_setup" );
    var_1 _meth_804F( self, var_0, ( 0, 0, -24 ), ( 0, 90, 0 ) );
    var_1 _meth_813A();
    var_1 _meth_8067( "manual" );
    var_1 _meth_8137( "allies" );
    var_1 _meth_8135( 0, "yaw" );
    var_1 _meth_8135( 0, "pitch" );
    level.heli_turrets[level.heli_turrets.size] = var_1;
}

intro_heli_minigun_firethread()
{
    level endon( "helis_stop_firing" );
    level.miniguns_firing = 1;

    for (;;)
    {
        if ( level.miniguns_firing )
        {
            var_0 = _func_0B4( 3, 7 );

            for ( var_1 = 0; var_1 < var_0; var_1++ )
            {
                self _meth_80EC();
                wait 0.1;
            }
        }

        wait(_func_0B5( 0.5, 2 ));
    }
}

circling_heli_minigun_firethread()
{
    level endon( "helis_stop_firing" );
    level.miniguns_firing = 1;

    for (;;)
    {
        if ( level.miniguns_firing )
        {
            var_0 = _func_0B4( 3, 7 );

            for ( var_1 = 0; var_1 < var_0; var_1++ )
            {
                self _meth_80EC();
                wait 0.1;
            }
        }

        if ( _func_0B2( 3 ) == 0 )
            wait(_func_0B4( 5, 8 ));

        wait(_func_0B5( 0.5, 2 ));
    }
}

heli_minigun_targetthread( var_0 )
{
    level endon( "helis_stop_firing" );
    var_1 = getent( "minigun_target", "targetname" );
    self _meth_8108( var_1 );

    for (;;)
    {
        var_2 = _func_0D9( "axis" );
        var_2 = remove_technical_enemies_from_array( var_2 );

        if ( var_2.size > 0 )
        {
            level.miniguns_firing = 1;
            var_1 = var_2[_func_0B2( var_2.size )];
            self _meth_8108( var_1 );
        }
        else
            level.miniguns_firing = 0;

        wait(var_0);
    }
}

remove_technical_enemies_from_array( var_0 )
{
    var_1 = [];
    var_2 = 5500;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3]._id_0398 ) )
        {
            if ( var_0[var_3]._id_0398 == "technical_enemies" )
                continue;
        }

        if ( _func_0F0( var_0[var_3]._id_02E2, self._id_02E2 ) > var_2 * var_2 )
            continue;

        var_1[var_1.size] = var_0[var_3];
    }

    return var_1;
}

draw_target()
{
    for (;;)
    {
        _id_A526::_id_2DD0( self._id_02E2, self.angles );
        wait 0.05;
    }
}

get_vehiclearray( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( !_func_1A2( var_2[var_4] ) )
        {
            if ( var_2[var_4].code_classname == "script_vehicle" )
                var_3[var_3.size] = var_2[var_4];
        }
    }

    return var_3;
}

vehicle_gun_clip_remove()
{
    self waittill( "pickup_death" );
    self.col_clip delete();
}

vehicle_tail_gate_remove()
{
    self waittill( "pickup_death" );
    self.tailgate_clip delete();
    self.tail_gate delete();
}

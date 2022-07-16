// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

bog_backhalf_shell()
{

}

force_spawn()
{
    self _meth_8096();
}

bog_backhalf_init()
{
    level.tankexplosion_fx = loadfx( "fx/explosions/javelin_explosion" );
    level.abrams = getent( "abrams", "targetname" );
    level.abrams._id_4257 = 1;
    level.abrams.forwardent = spawn( "script_origin", level.abrams _meth_8184( "tag_flash" ) );
    level.abrams.forwardent _meth_804F( level.abrams );
    var_0 = getent( "abrams_top_clip", "targetname" );
    var_0 _meth_804F( level.abrams, "tag_turret", ( -30, 0, 10 ), var_0.angles - level.abrams _meth_8185( "tag_turret" ) + ( 0, 7, 0 ) );
    level.zpu = getent( "zpu", "targetname" );
    level.tankdefenderpop = 0;
    level.tankatkdead = 0;
    level.totalcount = 0;
    level.tankdefensefailsafetime = 900;
    level.encroacherinit = 3;
    level.encroacherdiv = 3;
    level.zpublastradius = 384;
    level.playeristargeted = 0;
    common_scripts\utility::_id_383D( "tankoverrun" );
    common_scripts\utility::_id_383D( "zpu_speech_started" );
    common_scripts\utility::_id_383D( "zpu_orders_given" );
    common_scripts\utility::_id_383D( "zpus_destroyed" );
    common_scripts\utility::_id_383D( "activate_final_bldg" );
    common_scripts\utility::_id_383D( "lower_health_of_tank_defense_stragglers" );
    common_scripts\utility::_id_383D( "beacon_orders" );
    common_scripts\utility::_id_383D( "beacon_planted" );
    common_scripts\utility::_id_383D( "final_bldg_fired_upon" );
    common_scripts\utility::_id_383D( "pilot_final_dialogue" );
    common_scripts\utility::_id_383D( "cobra_success" );
    common_scripts\utility::_id_383D( "reached_ending_area" );
    common_scripts\utility::_id_383D( "ending_final_positions" );
    common_scripts\utility::_id_383D( "clipped_off_dest" );
    level.c4_sound_override = 1;
    level.tankencroachsteps = 3;
    level.tankencroachinitradius = 1600;
    level.tankencroachrate = 0.8;
    level.tankencroachpausetime = 7;
    level.defensesuccessratio = 0.87;
    level._id_135E = getent( "beacon", "targetname" );
    level._id_135E._id_02E2 += ( 0, 0, 2.85 );
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "final_bldg_fired_upon", _id_A581::_id_533A, 1008 );
    common_scripts\utility::_id_0D13( getentarray( "tank_defender", "script_noteworthy" ), _id_A5A4::_id_0798, ::tank_defender_spawn_setup );
    common_scripts\utility::_id_0D13( getentarray( "tank_defender", "script_noteworthy" ), _id_A5A4::_id_0798, _id_A5A4::_id_7402 );
    common_scripts\utility::_id_0D13( getentarray( "tank_attack_enemy", "script_noteworthy" ), _id_A5A4::_id_0798, ::enemy_infantry_spawn_setup );
    common_scripts\utility::_id_0D13( getentarray( "tank_attack_enemy", "script_noteworthy" ), _id_A5A4::_id_0798, ::tank_attack_death_tally );
}

start_bog_backhalf()
{
    common_scripts\utility::_id_383F( "tank_defense_activate" );
    thread _id_6302();
    thread bog_a_backhalf_autosaves();
    level.abrams thread tank_setup();
    level.abrams thread tank_turret_slewing();
    thread temp_friendly_boost();
    thread tank_defense_flares();
    thread tank_defender_deathmonitor();
    thread tank_defense_enforcement();
    thread tank_defense_victory_check();
    thread tank_defense_killspawner_check();
    thread zpu_battle_init();
    thread zpu_c4();
    thread zpu_dialogue();
    thread cobra_bldg_activate();
    thread cobra_bldg_mg();
    thread cobra_sequence();
    thread _id_29F3();
    var_0 = getent( "badplace_fires", "targetname" );
    badplace_cylinder( "hill_fires", -1, var_0._id_02E2, var_0._id_0351, var_0._id_01E8, "allies" );
}

start_zpu()
{
    _id_A5E8::_id_870C( "start_zpu_checkpoint" );
    common_scripts\utility::_id_383F( "zpu_orders_given" );
    var_0 = getent( "zpu_player_org", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    thread _id_6302();
    thread bog_a_backhalf_autosaves();
    level.abrams thread tank_setup();
    thread temp_friendly_boost();
    thread zpu_battle_init();
    thread zpu_c4();
    thread zpu_dialogue();
    thread cobra_bldg_activate();
    thread cobra_bldg_mg();
    thread cobra_sequence();
    thread _id_29F3();
    wait 0.1;
    _id_A5A4::_id_0709( "zpu_trigger" );
}

start_cobras()
{
    _id_A5E8::_id_870C( "start_cobra_checkpoint" );
    common_scripts\utility::_id_383F( "tank_defense_completed" );
    common_scripts\utility::_id_383F( "final_bldg_activate" );
    common_scripts\utility::_id_383F( "zpu_orders_given" );
    common_scripts\utility::_id_383F( "zpus_destroyed" );
    thread cobra_bldg_activate();
    thread cobra_bldg_mg();
    thread start_cobras_pos();
    thread _id_6302();
    thread bog_a_backhalf_autosaves();
    level.abrams thread tank_setup();
    thread temp_friendly_boost();
    thread cobra_sequence();
    thread _id_29F3();
    wait 5;
    level.zpu delete();
}

start_cobras_pos()
{
    var_0 = getent( "start_cobras_player", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    var_1 = getent( "start_cobras_price", "targetname" );
    level._id_6F7C = getent( "price", "targetname" );
    level._id_6F7C _meth_81C9( var_1._id_02E2 );
}

start_end()
{
    _id_A5E8::_id_870C( "start_end_checkpoint" );
    level._id_0318 _meth_8337( ( 0, 80, 0 ) );
    level._id_0318 _meth_8335( ( 4968, 1528, -12320 ) );
    var_0 = _func_0D9();
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_7E5E, 1 );
    level.abrams thread tank_setup();
    var_1 = getentarray( "tank_defender", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_7C71 );
    wait 0.05;
    level notify( "begin_sunrise_after_tank_defend", 1 );
    abrams_gets_drawing();
    level._id_6F7C = getent( "price", "targetname" );
    var_2 = getent( "price_spawner", "targetname" );
    level._id_6F7C _meth_81C9( var_2._id_02E2 );
    var_3 = getent( "mark_spawner", "targetname" ) _meth_8096();
    level.mark = var_3;
    _id_A5A4::_id_88F1( var_3 );
    _id_A5A4::_id_88F1( level._id_6F7C );
    level._id_6F7C _id_A5A4::_id_5926();
    var_3 _id_A5A4::_id_5926();
    var_4 = _func_0D9( "allies" );
    var_4 = _id_A5A4::_id_735E( var_4 );
    _id_A5A4::_id_0CE5( var_4 );
    var_5 = getentarray( "main_friendly_unit", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_5, ::force_spawn );
    waitframe;
    thread ending_sequence();
    wait 0.05;
    level._id_0318 _meth_8337( ( 0, 80, 0 ) );
    level._id_0318 _meth_8335( ( 4777, 1491, 20 ) );
}

temp_friendly_boost()
{
    var_0 = _func_0D9( "allies" );
    var_0 = _id_A5A4::_id_735E( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_2._id_0201 = 1;
        var_2._id_01E6 = 1000;
    }
}

tank_defense_flares()
{
    level endon( "tank_defense_completed" );
    level waittill( "detpack_rush_flare" );
    wait 10;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 12;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 14;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 8;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 18;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 20;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 7;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 14;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 8;
    maps\_flare::flare_from_targetname( "flare2" );
    wait 18;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 20;
    maps\_flare::flare_from_targetname( "flare1" );
    wait 7;
    maps\_flare::flare_from_targetname( "flare2" );
}

tank_defender_spawn_setup()
{
    level.tankdefenderpop++;
    self._id_0201 = 1;
    self._id_01E6 = 1000;
    thread tank_defender_deathnotify();
}

tank_defender_deathnotify()
{
    self waittill( "death" );
    level.tankdefenderpop--;
}

tank_defender_deathmonitor()
{
    var_0 = getent( "tank_battle_spawner", "targetname" );
    var_0 waittill( "trigger" );
    wait 10;
    level notify( "detpack_rush_flare" );
    _id_A5A4::_id_70C4( "movingindetpacks" );
}

tank_defense_victory_check()
{
    var_0 = [];
    var_1 = [];
    var_1 = _func_0DD( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3._id_0398 ) )
            continue;

        if ( var_3._id_0398 == "tank_attack_enemy" )
            var_0[var_0.size] = var_3;
    }

    var_4 = 0;
    var_5 = 0;

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        if ( !isdefined( var_0[var_6].count ) )
            var_7 = 1;
        else
            var_7 = var_0[var_6].count;

        level.totalcount += var_7;
    }

    while ( !common_scripts\utility::_id_382E( "tank_defense_completed" ) )
    {
        var_8 = level.tankatkdead / level.totalcount;

        if ( var_8 >= level.defensesuccessratio )
        {
            common_scripts\utility::_id_383F( "tank_defense_completed" );
            thread tank_defense_stragglers();
            break;
        }

        var_5 = 0;
        wait 2;
    }
}

tank_defense_killspawner_check()
{
    var_0 = [];
    var_1 = getentarray( "tank_attack_killspawner", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] thread tank_defense_killspawner_monitor();
}

tank_defense_killspawner_monitor()
{
    level endon( "tank_defense_completed" );
    var_0 = [];
    var_1 = 0;
    var_2 = _func_0DD( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3]._id_7A1D ) )
            continue;

        if ( var_2[var_3]._id_7A1D == self._id_7A1D )
            var_0[var_0.size] = var_2[var_3];
    }

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !isdefined( var_0[var_3].count ) )
            var_4 = 1;
        else
            var_4 = var_0[var_3].count;

        var_1 += var_4;
    }

    self waittill( "trigger" );
    level.totalcount -= var_1;

    if ( level.totalcount <= 0 )
        level.totalcount = 1;
}

bog_a_backhalf_autosaves()
{
    common_scripts\utility::_id_384A( "tank_defense_completed" );
    _id_A5A4::_id_1143( "tank_defense_finished" );

    if ( !common_scripts\utility::_id_382E( "zpus_destroyed" ) )
    {
        var_0 = getent( "zpuMidSaveTrig", "targetname" );
        var_0 waittill( "trigger" );
        _id_A5A4::_id_1143( "zpu_midpoint_approach" );
        var_1 = getent( "zpu_autosave", "targetname" );
        var_1 waittill( "trigger" );
        _id_A5A4::_id_1143( "zpu_dont_blow_yourself_up" );
    }

    common_scripts\utility::_id_384A( "zpus_destroyed" );
    _id_A5A4::_id_1143( "airstrike_begin" );
}

tank_defense_stragglers()
{
    var_0 = getentarray( "tank_attack_killspawner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0706 );
    common_scripts\utility::_id_383F( "lower_health_of_tank_defense_stragglers" );
}

tank_attack_death_tally()
{
    self waittill( "death" );
    level.tankatkdead++;
}

enemy_infantry_spawn_setup()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    thread enemy_infantry_tank_encroach();
    common_scripts\utility::_id_384A( "lower_health_of_tank_defense_stragglers" );
    self._id_01E6 = 5;
}

enemy_infantry_tank_encroach()
{
    self endon( "death" );
    level endon( "tank_defense_completed" );
    level endon( "suicide_bomber_reached_tank" );
    enemy_tank_encroach_mvmt();
    var_0 = level.encroacherinit % level.encroacherdiv;
    level.encroacherinit++;

    if ( !var_0 )
    {
        self._id_01C4 = 64;
        self._id_02F6 = 512;
        self._id_02F7 = 512;
        self waittill( "goal" );

        if ( !common_scripts\utility::_id_382E( "tank_defense_completed" ) )
        {
            thread tank_destruction();
            waitframe;
            level notify( "suicide_bomber_reached_tank" );
        }
        else
        {
            self._id_01C4 = 1000;
            self _meth_81AB( level._id_0318 );
        }
    }
}

enemy_tank_encroach_mvmt()
{
    self endon( "death" );
    var_0 = _func_0C3( "tank_suicide_bomb_dest", "targetname" );
    self _meth_81A9( var_0 );
    self._id_01C4 = level.tankencroachinitradius;
    self._id_02F6 = 96;
    self._id_02F7 = 512;

    for ( var_1 = 0; var_1 < level.tankencroachsteps; var_1++ )
    {
        wait(level.tankencroachpausetime);
        self._id_01C4 *= level.tankencroachrate;
    }
}

_id_6302()
{
    objective_add( 1, "active", &"BOG_A_SECURE_THE_M1A1_ABRAMS", ( 4800, 1488, 32 ) );
    objective_add( 5, "active", &"BOG_A_INTERCEPT_THE_ENEMY_BEFORE", ( 4800, 1488, 32 ) );
    _func_1E1( 5, 1 );
    objective_current( 5 );
    common_scripts\utility::_id_384A( "tank_defense_completed" );
    common_scripts\utility::_id_3831( "aa_bog" );
    common_scripts\utility::_id_384A( "zpu_orders_given" );
    common_scripts\utility::_id_383D( "aa_zpu" );
    common_scripts\utility::_id_383F( "aa_zpu" );
    objective_state( 5, "done" );
    _id_A5A4::arcademode_checkpoint( 4.5, "d" );
    objective_add( 6, "active", &"BOG_A_DESTROY_THE_ZPU_ANTI", level.zpu._id_02E2 );
    _func_1E1( 6, 1 );
    objective_current( 6 );
    common_scripts\utility::_id_384A( "zpus_destroyed" );
    common_scripts\utility::_id_3831( "aa_zpu" );
    objective_state( 6, "done" );
    var_0 = getent( "southern_area_objective", "targetname" );
    objective_add( 7, "active", &"BOG_A_SECURE_THE_SOUTHERN_SECTOR", var_0._id_02E2 );
    _func_1E1( 7, 1 );
    objective_current( 7 );
    common_scripts\utility::_id_384A( "beacon_orders" );
    objective_add( 7, "active", &"BOG_A_PLANT_THE_IR_BEACON_TO", level._id_135E._id_02E2 );
    _func_1E1( 7, 1 );
    var_1 = spawnfx( common_scripts\utility::_id_3FA8( "beacon_glow" ), level._id_135E._id_02E2 );
    triggerfx( var_1 );
    objective_current( 7 );
    _id_A5A4::arcademode_checkpoint( 1.5, "e" );
    common_scripts\utility::_id_384A( "beacon_planted" );
    var_1 delete();
    _id_A5A4::arcademode_checkpoint( 3, "f" );
    objective_delete( 7 );
    objective_add( 7, "active", &"BOG_A_WAIT_FOR_AIR_SUPPORT" );
    _func_1E1( 7, 1 );
    objective_current( 7 );
    common_scripts\utility::_id_384A( "cobra_success" );
    objective_state( 7, "done" );
    objective_state( 1, "done" );
    var_2 = ( 5099.6, 1602.45, -6.36579 );
    objective_add( 9, "active", &"BOG_A_REGROUP_WITH_THE_SQUAD", var_2 );
    objective_current( 9 );
    common_scripts\utility::_id_384A( "reached_ending_area" );
    objective_state( 9, "done" );
}

cobra_bldg_activate()
{
    common_scripts\utility::_id_384A( "activate_final_bldg" );
    var_0 = getentarray( "trigger_multiple", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_0396 ) && _func_120( var_2._id_0396, "post_zpu_final_bldg_spawn" ) )
            var_2 notify( "trigger" );
    }
}

cobra_bldg_mg()
{
    common_scripts\utility::_id_384A( "activate_final_bldg" );
    var_0 = getentarray( "backhalf_manual_mg", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::backhalf_mg_setmode, "manual" );
    common_scripts\utility::_id_0D13( var_0, ::cobra_bldg_mg_targeting );
    common_scripts\utility::_id_0D13( var_0, ::cobra_bldg_mg_cleanup );
}

cobra_bldg_mg_targeting()
{
    level endon( "final_bldg_fired_upon" );
    var_0 = getentarray( self._id_04A4, "targetname" );
    thread backhalf_manual_mg_fire();
    var_1 = 0;

    for (;;)
    {
        var_2 = common_scripts\utility::_id_710E( var_0 );
        wait(_func_0B5( 1, 2 ));

        if ( var_1 > 6 && !common_scripts\utility::_id_382E( "beacon_planted" ) && !level.playeristargeted )
        {
            level.playeristargeted = 1;
            self _meth_8108( level._id_0318 );
            var_1 = 0;
        }
        else
            self _meth_8108( var_2 );

        wait(_func_0B5( 1, 5 ));
        level.playeristargeted = 0;
        var_1++;
    }
}

backhalf_mg_setmode( var_0 )
{
    self _meth_8067( var_0 );
}

backhalf_manual_mg_fire()
{
    self endon( "stop_firing" );
    self.turret_fires = 1;

    for (;;)
    {
        var_0 = _func_0B5( 0.2, 0.7 ) * 20;

        if ( self.turret_fires )
        {
            for ( var_1 = 0; var_1 < var_0; var_1++ )
            {
                self _meth_80EC();
                wait 0.05;
            }
        }

        wait(_func_0B3( 0.5 ));
    }
}

cobra_bldg_mg_cleanup()
{
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "final_bldg_fired_upon", _id_A5A4::_id_7C82, "stop_firing" );
    common_scripts\utility::_id_384A( "final_bldg_fired_upon" );
    self delete();
}

cobra_sequence()
{
    common_scripts\utility::_id_384A( "zpus_destroyed" );
    _id_A5E8::_id_870C( "start_cobra_arrival_scripted_sfx" );
    wait 6;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "plantbeacon" );
    thread cobra_sequence_reminder();
    common_scripts\utility::_id_383F( "beacon_orders" );
    var_0 = spawn( "script_model", level._id_135E._id_02E2 + ( 0, 0, -3 ) );
    var_0 _meth_80B3( "com_night_beacon_obj" );
    common_scripts\utility::_id_383F( "beacon_ready_to_use" );
    var_1 = getent( "beaconTrig", "targetname" );
    var_1 _meth_80DD( &"SCRIPT_PLATFORM_HINT_PLANTBEACON" );
    var_1 waittill( "trigger" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_bog_a_beacon_plant" );
    var_1 delete();
    var_0 _meth_80B3( "com_night_beacon" );
    common_scripts\utility::_id_383F( "beacon_planted" );
    _id_A5E8::_id_870C( "start_cobra_support_mix" );
    var_2 = _id_A5A8::_id_8978( "cobra1" );
    var_3 = _id_A5A8::_id_8978( "cobra2" );
    var_2 thread _id_A5A8::_id_5BD3();
    var_3 thread _id_A5A8::_id_5BD3();
    var_2 thread cobra_flightplan();
    var_3 thread cobra_flightplan( 1 );
    _func_076( 1.9 );
    wait 2;
    _id_A5A4::_id_6008( "bog_a_victory" );
    wait 1;
    _id_A5A4::_id_70C4( "cominhot" );
    wait 2;
    _id_A5A4::_id_70C4( "standby" );
}

cobra_sequence_reminder()
{
    level endon( "beacon_planted" );
    var_0 = 0;

    for (;;)
    {
        wait 40;

        if ( var_0 == 0 )
            _id_A5A4::_id_70C4( "buttonedup" );
        else if ( var_0 == 1 )
            _id_A5A4::_id_70C4( "whereistheairsupport" );
        else if ( var_0 == 2 )
            _id_A5A4::_id_70C4( "canttakebuilding" );
        else if ( var_0 == 3 )
            _id_A5A4::_id_70C4( "rippingusapart" );
        else if ( var_0 == 4 )
        {
            _id_A5A4::_id_70C4( "plantbeacon" );
            var_0 = 0;
        }

        var_0++;
    }
}

cobra_flightplan( var_0 )
{
    var_1 = 50;
    var_2 = 25;
    self _meth_827F( var_1, 50 );
    self _meth_828E( 45, var_2 );
    self _meth_8290( 25, 50 );
    self _meth_824F( 128 );
    var_3 = undefined;

    if ( isdefined( self._id_04A4 ) )
        var_3 = getent( self._id_04A4, "targetname" );
    else
    {

    }

    var_4 = [];

    while ( isdefined( var_3 ) )
    {
        var_4[var_4.size] = var_3;

        if ( isdefined( var_3._id_04A4 ) )
        {
            var_3 = getent( var_3._id_04A4, "targetname" );
            continue;
        }

        break;
    }

    self _meth_80B0( "heli_loop" );
    var_5 = 0;
    var_6 = "alpha";
    var_7 = 256;
    var_8 = 20;
    var_9 = 20;

    for ( var_10 = 0; var_10 < var_4.size; var_10++ )
    {
        var_11 = 0;
        var_12 = var_4[var_10];

        if ( isdefined( var_12._id_0351 ) )
            var_7 = var_12._id_0351;

        self _meth_8256( var_7 );

        if ( isdefined( var_12._id_79BA ) )
            var_11 = var_12._id_79BA;

        if ( isdefined( var_12._id_7943 ) )
            var_6 = var_12._id_7943;

        if ( isdefined( var_12._id_79B9 ) )
            thread cobra_fire( var_11, var_6 );

        if ( isdefined( var_12._id_7930 ) )
            var_1 = var_12._id_7930;

        if ( isdefined( var_12._id_7929 ) )
            var_8 = var_12._id_7929;

        if ( isdefined( var_12._id_798B ) )
            self _meth_827F( var_1, var_8, var_12._id_798B );
        else
            self _meth_827F( var_1, var_8 );

        if ( isdefined( var_12._id_7B27 ) )
            self _meth_828E( var_12._id_7B27, var_2 );

        if ( isdefined( var_12._id_79EC ) )
            self _meth_825A( var_12.angles[1] );

        if ( isdefined( var_12._id_7973 ) )
            self _meth_825B();

        var_13 = 0;

        if ( isdefined( var_4[var_10]._id_7AE5 ) )
            var_13 = var_4[var_10]._id_7AE5;

        maps\bog_a_aud::handle_cobra_waypoint_audio( var_12 );
        self _meth_8257( var_4[var_10]._id_02E2, var_13 );
        self waittill( "near_goal" );

        if ( var_13 )
        {
            if ( isdefined( var_0 ) && var_0 )
            {
                thread cobra_fire( 0, "alpha" );
                thread cobra_fire( 2, "gamma" );
                thread cobra_fire( 4, "delta" );
                thread cobra_fire( 7.5, "zeta" );
            }

            level common_scripts\utility::_id_384A( "cobra_missiles_done" );
            thread _id_A5A8::_id_5BD2();
            wait 3.75;
            level common_scripts\utility::_id_383F( "pilot_final_dialogue" );
            wait 7.35;

            if ( isdefined( var_0 ) && var_0 )
                wait 1.25;
        }
    }

    self._id_799F = 1;
    self _meth_80B1( "heli_loop" );
}

cobra_fire( var_0, var_1 )
{
    wait(var_0);

    switch ( var_1 )
    {
        case "alpha":
            common_scripts\_exploder::_id_3528( 500 );
            var_2 = getent( "ffar_1001", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 1, var_2 );
            thread cobra_missile_fired_earthquake();
            thread cobra_building_damage_fx( 1001 );
            var_3 = getentarray( "finalBldgKillSpawn", "targetname" );

            for ( var_4 = 0; var_4 < var_3.size; var_4++ )
            {
                var_5 = var_3[var_4];
                var_5 notify( "trigger" );
            }

            var_6 = [];
            var_6 = getentarray( "finalBldgGuys", "script_noteworthy" );

            for ( var_4 = 0; var_4 < var_6.size / 2; var_4++ )
            {
                var_7 = var_6[var_4];
                var_7 _meth_8054();
            }

            wait 0.5;
            common_scripts\utility::_id_383F( "final_bldg_fired_upon" );
            var_2 = getent( "ffar_1002", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1002 );
            var_2 = getent( "ffar_1003", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1003 );

            if ( !common_scripts\utility::_id_382E( "clipped_off_dest" ) )
                common_scripts\utility::_id_383F( "clipped_off_dest" );

            break;
        case "gamma":
            var_2 = getent( "ffar_1008", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1008 );
            break;
        case "delta":
            var_2 = getent( "ffar_1000", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1000 );
            wait 2;
            var_2 = getent( "ffar_1004", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 1, var_2 );
            thread cobra_missile_fired_earthquake();
            thread cobra_building_damage_fx( 1004 );
            wait 2;
            var_2 = getent( "ffar_1005", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 1, var_2 );
            thread cobra_missile_fired_earthquake();
            thread cobra_building_damage_fx( 1005 );
            break;
        case "zeta":
            var_2 = getent( "ffar_1007", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1007 );
            wait 3;
            var_2 = getent( "ffar_1006", "targetname" );
            _id_A53F::_id_37BA( "ffar_bog_a_lite", 2, var_2 );
            thread cobra_missile_fired_earthquake( 1 );
            thread cobra_building_damage_fx( 1006 );
            level common_scripts\utility::_id_383F( "cobra_missiles_done" );
            break;
    }
}

cobra_building_damage_fx( var_0 )
{
    wait 0.2;
    common_scripts\_exploder::_id_3528( var_0 );
}

cobra_missile_fired_earthquake( var_0 )
{
    _func_18C( 0.3, 1.0, self._id_02E2, 4000 );

    if ( isdefined( var_0 ) && var_0 == 1 )
        level._id_0318 _meth_80AF( "generic_attack_heavy_500" );
    else
        level._id_0318 _meth_80AF( "generic_attack_medium_500" );
}

tank_defense_enforcement()
{
    var_0 = getent( "tank_defense_warning", "targetname" );
    var_1 = getent( "tank_defense_failed", "targetname" );
    var_0 thread tank_defense_warning();
    var_1 thread tank_defense_failure();
}

tank_defense_warning()
{
    level endon( "zpu_speech_started" );
    level endon( "tank_was_overrun" );
    level endon( "tank_defense_completed" );
    var_0 = 0;
    var_1 = 0;

    while ( !common_scripts\utility::_id_382E( "zpu_speech_started" ) )
    {
        self waittill( "trigger" );

        switch ( var_0 )
        {
            case 0:
                _id_A5A4::_id_70C4( "dangeroverrun" );
                break;
            case 1:
                _id_A5A4::_id_70C4( "jacksonawol" );
                break;
            case 2:
                _id_A5A4::_id_70C4( "fallbacktank" );
                break;
        }

        wait 20;
        var_0++;

        if ( var_0 > 2 )
        {
            var_0 = 0;
            var_1++;
        }

        if ( var_1 == 2 )
            thread tank_destruction();
    }
}

tank_defense_failure()
{
    level endon( "zpu_speech_started" );
    level endon( "tank_defense_completed" );
    self waittill( "trigger" );
    thread tank_destruction();
}

tank_setup()
{
    var_0 = _func_1EC( self._id_04A4, "targetname" );
    self _meth_8279( var_0 );
    self _meth_827B();
}

tank_turret_slewing()
{
    level endon( "abrams_stop_slewing_turret" );
    self endon( "death" );
    var_0 = [];
    var_0 = getentarray( "abrams_targetref", "targetname" );
    var_1 = _func_0B2( var_0.size );
    var_2 = var_1 + 1;
    var_3 = 0;

    for (;;)
    {
        if ( var_1 == var_2 )
        {
            wait 1;
            var_1 = _func_0B2( var_0.size );
            continue;
        }
        else
        {
            self _meth_825E( var_0[var_1] );
            self waittill( "turret_on_target" );
            wait(_func_0B5( 1, 2 ));
            var_3++;

            if ( var_3 == 2 )
            {
                wait(_func_0B5( 3, 5 ));
                var_3 = 0;
            }
        }

        var_2 = var_1;
        var_1 = _func_0B2( var_0.size );
    }
}

tank_destruction()
{
    level endon( "tank_defense_completed" );
    level notify( "tank_was_overrun" );
    thread tank_missionfailure();
    common_scripts\utility::_id_69C2( "generic_meleecharge_arab_6", level.abrams._id_02E2 );
    level._id_0318 _meth_809C( "explo_mine" );
    playfx( level.tankexplosion_fx, level.abrams._id_02E2 );
    _func_18C( 0.5, 2, level._id_0318._id_02E2, 1250 );
    _func_189( level.abrams._id_02E2, 512, 100500, 100500 );
}

tank_missionfailure()
{
    _id_A5E8::_id_870C( "start_tank_mission_failure" );
    wait 2.25;
    setdvar( "ui_deadquote", &"BOG_A_THE_TANK_WAS_OVERRUN" );
    _id_A5A4::_id_5CDF();
}

zpu_battle_init()
{
    common_scripts\utility::_id_384A( "zpu_orders_given" );
    common_scripts\utility::_id_383F( "zpu_battle_started" );
    thread zpu_battle_friendly_advance();
    var_0 = _func_0C3( "zpu_badplace", "targetname" );
    badplace_cylinder( "zpuNoAllies", -1, var_0._id_02E2, var_0._id_0351, var_0._id_01E8, "allies" );
    var_1 = getent( "zpu_battle_seed", "targetname" );
    wait 2;
    var_1 notify( "trigger" );
}

zpu_battle_friendly_advance()
{
    var_0 = getentarray( "zpu_friendly_advance_trigger", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread zpu_battle_trigger_control();
}

zpu_battle_trigger_control()
{
    self endon( "deleted" );
    self waittill( "trigger" );
    var_0 = [];
    var_1 = undefined;

    if ( isdefined( self._id_04A4 ) )
        var_1 = getent( self._id_04A4, "targetname" );

    while ( isdefined( var_1 ) )
    {
        var_0[var_0.size] = var_1;

        if ( isdefined( var_1._id_04A4 ) )
        {
            var_1 = getent( var_1._id_04A4, "targetname" );
            continue;
        }

        break;
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 notify( "deleted" );
        var_3 delete();
    }
}

zpu_c4()
{
    var_0 = getent( "zpu", "targetname" );
    var_0 maps\_c4::c4_location( "tag_c4", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0 waittill( "c4_detonation" );
    var_0 notify( "death" );
    playfx( level.tankexplosion_fx, var_0._id_02E2 );
    thread common_scripts\utility::_id_69C2( "bog_aagun_explode", var_0._id_02E2 );
    var_0 _meth_80B3( "vehicle_zpu4_burn" );
    _func_189( var_0._id_02E2 + ( 0, 0, 96 ), level.zpublastradius, 1000, 50 );
    _id_A5A4::arcademode_kill( var_0._id_02E2, "explosive", 2000 );
    common_scripts\utility::_id_383F( "zpus_destroyed" );
    abrams_gets_drawing();
}

zpu_dialogue()
{
    var_0 = getent( "plantc4_dialogue", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "activate_final_bldg" );
    var_1 = _func_0C3( "zpuTalkingFriendly", "targetname" );
    var_2 = _func_0D9( "allies" );
    var_2 = _id_A5A4::_id_735E( var_2 );
    var_3 = common_scripts\utility::_id_3F33( var_1._id_02E2, var_2 );
    var_3 thread _id_A5A4::_id_58D7();
    var_3._id_0C72 = "marine";
    var_3 thread _id_A510::_id_0C21( var_3, "plantc4" );
    level waittill( "c4_in_place" );
    thread zpu_interface();
    _id_A5A4::_id_1143( "zpu_c4_planted" );
    var_3 _id_A510::_id_0C21( var_3, "goodjob" );
    var_4 = getent( "zpu", "targetname" );
    var_5 = _func_0F1( level._id_0318._id_02E2 - var_4._id_02E2 );

    while ( var_5 <= level.zpublastradius * 1.05 )
    {
        var_5 = _func_0F1( level._id_0318._id_02E2 - var_4._id_02E2 );
        wait 0.05;
    }

    if ( !common_scripts\utility::_id_382E( "zpus_destroyed" ) )
        var_3 _id_A510::_id_0C21( var_3, "jacksondoit" );

    var_3 _id_A5A4::_id_8EA4();
}

dont_show_c4_hint()
{
    if ( common_scripts\utility::_id_382E( "zpus_destroyed" ) )
        return 0;

    var_0 = self _meth_830E();
    return var_0 == "c4";
}

zpu_interface()
{
    level endon( "zpus_destroyed" );
    wait 2;
    level._id_0318 thread _id_A5A4::_id_2B4A( "c4_use" );
}

_id_29F3()
{
    if ( !common_scripts\utility::_id_382E( "tank_defense_completed" ) )
    {
        thread dialogue_south_tank_attack();
        var_0 = getent( "backhalf_dialogue", "targetname" );
        var_0 waittill( "trigger" );
        _id_A5A4::_id_70C4( "alphasixstatus" );
        _id_A5A4::_id_1333( "allies" );
        _id_A5A4::_id_1333( "axis" );
        _id_A5A4::_id_70C4( "stillsurrounded" );
        _id_A5A4::_id_70C4( "maingunsoffline" );
    }

    common_scripts\utility::_id_384A( "tank_defense_completed" );

    if ( !common_scripts\utility::_id_382E( "zpus_destroyed" ) )
    {
        thread zpu_player_followers();
        _id_A5A4::_id_70C4( "morewest" );
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "twocharliebravosix" );
        common_scripts\utility::_id_383F( "zpu_speech_started" );
        _id_A5A4::_id_70C4( "negativebravo" );
        common_scripts\utility::_id_383F( "zpu_orders_given" );

        if ( !common_scripts\utility::_id_382E( "zpus_destroyed" ) )
            level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "jacksonfindzpu" );

        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "securewest" );
        wait 2;
        level._id_78BA["price"]["letsmoveout"] = "bog_a_pri_letsmoveout";
    }

    common_scripts\utility::_id_384A( "pilot_final_dialogue" );
    _id_A5E8::_id_870C( "set_bog_ambience_to_bog_end_ext0" );
    var_1 = _func_0D9( "axis" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_2A51 );
    var_2 = _func_0DD( "axis" );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_7C71 );
    _id_A5A4::_id_70C4( "seeanyoneleft" );
    wait 0.5;
    _id_A5A4::_id_70C4( "negative" );
    wait 0.3;
    _id_A5A4::_id_70C4( "alltargetsdestroyed" );
    level notify( "begin_sunrise_after_tank_defend", 90 );
    wait 3;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "lzissecure" );
    wait 0.15;
    common_scripts\utility::_id_383F( "cobra_success" );
    _id_A5E8::_id_870C( "stop_cobra_support_mix" );
    thread ending_sequence();
    level notify( "abrams_stop_slewing_turret" );
    thread abrams_turn_straight();
    _id_A5A4::_id_70C4( "goodworkout" );
    level.mark._id_0C72 = "left_guy";
    level.mark _id_A510::_id_0C21( level.mark, "regroupattank" );
}

abrams_gets_drawing()
{
    level.abrams _meth_80B3( _id_A5A4::_id_4026( "tank_draw" ) );
    level._id_9F56 = _id_A5A4::_id_4026( "tank_draw" );
    level.abrams _id_A5A8::_id_184B( "fx/distortion/abrams_exhaust" );
    level.abrams _id_A5A8::_id_1847( "fx/dust/abrams_deck_dust" );
}

abrams_turn_straight()
{
    level.abrams _meth_825E( level.abrams.forwardent );
}

zpu_player_followers()
{
    thread _id_A5A4::_id_7016( "c", "p" );
    thread _id_A5A4::_id_7016( "c", "p" );
}

ending_sequence()
{
    level._id_6F7C _id_A5A4::_id_5926();
    var_0 = _func_0D9( "allies" );
    var_0 = _id_A5A4::_id_735E( var_0 );
    level._id_6F7C._id_0C72 = "price";
    var_0[0]._id_0C72 = "right_guy";
    level.mark._id_0C72 = "left_guy";
    var_1 = [];

    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
        var_1[var_1.size] = var_0[var_2];

    thread schoolcircle( "schoolcircle", var_1 );
    var_3 = [];
    var_3[var_3.size] = level._id_6F7C;
    var_3[var_3.size] = var_0[0];
    var_3[var_3.size] = level.mark;
    var_4 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_4._id_02E2 = level.abrams._id_02E2;
    var_4.angles = level.abrams.angles;
    var_4 _id_A510::_id_0C42( var_3, "tank_talk" );
    var_4 _id_A510::_id_0BF6( var_3, "tank_talk", "tank_talk_idle", "stop_loop" );

    if ( getdvarint( "use_old_tank_dialogue" ) == 1 )
        var_5 = 220;
    else
        var_5 = 300;

    while ( _func_0EE( level._id_0318._id_02E2, var_4._id_02E2 ) > var_5 )
        wait 0.05;

    common_scripts\utility::_id_383F( "reached_ending_area" );
    _id_A5E8::_id_870C( "start_ending_area_mix" );
    var_4 notify( "stop_loop" );
    level._id_6F7C thread new_goal_at_scene_end();

    if ( getdvarint( "use_old_tank_dialogue" ) == 1 )
    {
        var_4 thread _id_A510::_id_0C18( var_3, "tank_talk" );
        wait 14.95;
    }
    else
    {
        var_6 = getanimlength( level._id_78AC[var_3[0]._id_0C72]["tank_talk"] );
        var_4 thread _id_A510::_id_0C18( var_3, "tank_talk" );
        wait(var_6 - 1);
    }

    _id_A5E8::_id_870C( "start_end_black_screen_mix" );
    _id_A5A4::_id_60D6();
}

new_goal_at_scene_end()
{
    common_scripts\utility::waittillend( "single anim" );
    self _meth_81AA( self._id_02E2 );
    self._id_01C4 = 0;
    self._id_050F = 15010;
}

dialogue_south_tank_attack()
{
    var_0 = undefined;
    var_1 = getentarray( "flood_spawner", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2]._id_0398 ) )
            continue;

        if ( var_1[var_2]._id_0398 == "south_tank_attack_wave" )
        {
            var_0 = var_1[var_2];
            break;
        }
    }

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    wait 4;
    _id_A5A4::_id_70C4( "contactseast" );
}

heroshield()
{
    var_0 = getentarray( "hero", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::hero );
}

hero()
{
    thread _id_A5A4::_id_58D7();
    self._id_0200 = 1;
}

schoolcircle( var_0, var_1 )
{
    var_2 = _func_0C4( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_1[var_3] thread schoolcircle_nav( var_2, var_3 );
}

schoolcircle_nav( var_0, var_1 )
{
    self endon( "death" );
    wait 2.5;
    self _meth_81A9( var_0[var_1] );
    self._id_01C4 = 32;
    self._id_0130 = 1;
    self _meth_81CE( "stand" );

    if ( !isdefined( var_0[var_1]._id_0398 ) )
        return;

    if ( var_0[var_1]._id_0398 == "kneel" )
        thread schoolcircle_crouch( self );
}

schoolcircle_crouch( var_0 )
{
    var_0 waittill( "goal" );
    var_0 _meth_81CE( "crouch" );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    common_scripts\utility::_id_383D( "aa_flight" );
    common_scripts\utility::_id_383D( "blackhawk_hit" );
    common_scripts\utility::_id_383D( "aa_crash" );
    common_scripts\utility::_id_383D( "wakeup_done" );
    common_scripts\utility::_id_383D( "aa_farm" );
    maps\createart\hunted_art::main();
    maps\hunted_fx::main();
    maps\hunted_precache::main();
    _id_A550::main();
    maps\hunted_anim::main();
    level thread maps\hunted_amb::main();
    maps\hunted_lighting::main();
    maps\hunted_windmill::main();
}

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    _id_A5A4::_id_079C( "crash", ::_id_8B7C, &"STARTS_CRASH" );
    _id_A5A4::_id_079C( "path", ::start_dirt_path, &"STARTS_PATH" );
    _id_A5A4::_id_079C( "barn", ::start_barn, &"STARTS_BARN" );
    _id_A5A4::_id_079C( "field", ::start_field, &"STARTS_FIELD2" );
    _id_A5A4::_id_079C( "basement", ::start_basement, &"STARTS_BASEMENT" );
    _id_A5A4::_id_079C( "dogs", ::start_farm, &"STARTS_DOGS" );
    _id_A5A4::_id_079C( "farm", ::start_farm, &"STARTS_FARM" );
    _id_A5A4::_id_079C( "creek", ::start_creek, &"STARTS_CREEK" );
    _id_A5A4::_id_079C( "greenhouse", ::start_greenhouse, &"STARTS_GREENHOUSE" );
    _id_A5A4::_id_079C( "ac130", ::start_ac130, &"STARTS_AC130" );
    precachemodel( "com_flashlight_on" );
    precachemodel( "h1_prop_dogtag" );
    precachemodel( "vehicle_blackhawk_hero_interior" );
    character\character_sp_pilot_zack_woodland::_id_032C();
    precacheitem( "hunted_crash_missile_hunted" );
    precacherumble( "tank_rumble" );
    precacherumble( "generic_attack_medium_500" );
    precacherumble( "generic_attack_heavy_500" );
    precacherumble( "generic_attack_heavy_750" );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "dogs" );
    createthreatbiasgroup( "oblivious" );
    createthreatbiasgroup( "heli_guy" );
    setup_flags();
    _id_A5A4::_id_278B( ::start_default );
    maps\hunted_precache::main();
    _id_A5A8::build_aianims_with_classname( "script_vehicle_blackhawk_hero", ::blackhawk_overrides, vehicle_scripts\_blackhawk::_id_7EFA );
    _id_A550::_id_7E9E( "viewhands_player_sas_woodland" );
    animscripts\dog\dog_init::_id_4DAB();
    _func_0D6( "r_reactiveMotionWindAmplitudeScale", 3 );
    _func_0D6( "r_reactiveMotionWindStrength", 1 );
    _func_0D6( "r_reactiveMotionWindFrequencyScale", 3 );
    _func_0D6( "r_reactiveMotionWindAreaScale", 33.3 );
    _func_0D6( "r_reactiveMotionHelicopterRadius", 800 );
    _func_0D6( "r_reactiveMotionHelicopterStrength", 8 );
    _func_0D6( "r_lodFOVScaleOverride", 1 );
    _func_0D6( "r_lodFOVScaleOverrideAmount", 0.85 );
    _func_0D6( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    _func_0D6( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    _func_0D6( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    _func_0D6( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak74u_clip";
    level.weaponclipmodels[1] = "weapon_g36_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_ak47_clip";
    level.weaponclipmodels[4] = "weapon_mp5_clip";
    level.weaponclipmodels[5] = "weapon_g3_clip";
    maps\createart\hunted_art::main();
    maps\hunted_fx::main();
    _id_A550::main();
    _id_A52C::init();
    maps\_stinger::init();
    maps\hunted_anim::main();
    maps\hunted_lighting::main();
    maps\hunted_aud::main();
    maps\hunted_windmill::main();
    level._id_0318 _meth_817B( "player" );
    setignoremegroup( "allies", "oblivious" );
    setignoremegroup( "axis", "oblivious" );
    setignoremegroup( "player", "oblivious" );
    setignoremegroup( "oblivious", "allies" );
    setignoremegroup( "oblivious", "axis" );
    setignoremegroup( "oblivious", "oblivious" );
    setignoremegroup( "heli_guy", "allies" );
    setthreatbias( "player", "heli_guy", 1000000 );
    level.ai_friendlyfireblockduration = getdvarfloat( "ai_friendlyFireBlockDuration" );
    level thread maps\hunted_amb::main();
    _id_A51D::_id_8324( "compass_map_hunted" );
    setup_setgoalvolume_trigger();
    setup_enemies();
    maps\hunted_lighting::setup_visionset_trigger();
    setup_heli_guy();
    setup_spot_target();
    setup_helicopter_delete_node();
    setup_tmp_detour_node();
    setup_gas_station();
    setup_basement_door();
    var_0 = getent( "farmer_front_door", "targetname" );
    var_0 thread front_door_linked_ent();
    level._id_0318 thread grenade_notifies();
    level thread dynamic_dog_threat();
    level.cos90 = _func_0B7( 90 );
    common_scripts\utility::_id_0D13( getentarray( "noprone", "targetname" ), ::noprone );
    level.animated_door_clip_brushes = [];
    common_scripts\utility::_id_0D13( getentarray( "doorpart", "targetname" ), ::doorpart );
    thread _id_A5A4::ai_team_run_twitch_think( "allies", "aa_crash", undefined, "crash", undefined );
    _id_A5A4::_id_1332( "allies" );
    _id_A5A4::_id_1332( "axis" );
    common_scripts\utility::_id_76BB( "dead_body", ::spawn_dead_body );
    thread hunted_wibble_think();
}

player_sprint_check()
{
    level endon( "player_interruption" );

    if ( !isdefined( level._id_0318._id_5F7A ) )
        level._id_0318._id_5F7A = 1;

    var_0 = level._id_0318._id_02E2;
    var_1 = 0;

    for (;;)
    {
        wait 0.1;
        var_2 = level._id_0318._id_02E2;
        var_3 = _func_0BC( 25 * level._id_0318._id_5F7A );

        if ( _func_0BC( _func_0EF( var_0, var_2 ) ) > var_3 )
            var_1++;
        else
            var_1 = 0;

        if ( var_1 > 5 )
            common_scripts\utility::_id_383F( "player_sprint" );
        else
            common_scripts\utility::_id_3831( "player_sprint" );

        var_0 = var_2;
    }
}

setup_flags()
{
    common_scripts\utility::_id_383D( "aa_flight" );
    common_scripts\utility::_id_383D( "aa_crash" );
    common_scripts\utility::_id_383D( "aa_dirt_path" );
    common_scripts\utility::_id_383D( "aa_barn" );
    common_scripts\utility::_id_383D( "aa_field" );
    common_scripts\utility::_id_383D( "aa_basement" );
    common_scripts\utility::_id_383D( "aa_farm" );
    common_scripts\utility::_id_383D( "aa_creek" );
    common_scripts\utility::_id_383D( "aa_second_field" );
    common_scripts\utility::_id_383D( "aa_greenhouse" );
    common_scripts\utility::_id_383D( "aa_stinger" );
    common_scripts\utility::_id_383D( "aa_ac130" );
    common_scripts\utility::_id_383D( "player_sprint" );
    common_scripts\utility::_id_383D( "flight_missile_warning" );
    common_scripts\utility::_id_383D( "blackhawk_hit" );
    common_scripts\utility::_id_383D( "blackhawk_down" );
    common_scripts\utility::_id_383D( "price_help" );
    common_scripts\utility::_id_383D( "wakeup_start" );
    common_scripts\utility::_id_383D( "wakeup_done" );
    common_scripts\utility::_id_383D( "wounded_check" );
    common_scripts\utility::_id_383D( "wounded_check_done" );
    common_scripts\utility::_id_383D( "crash_dialogue_done" );
    _id_A5A4::_id_3847( "path_trigger", getent( "path_trigger", "targetname" ) );
    _id_A5A4::_id_3847( "truck_alert", getent( "truck_alert", "targetname" ) );
    common_scripts\utility::_id_383D( "mark_at_goal" );
    common_scripts\utility::_id_383D( "trucks_warning" );
    common_scripts\utility::_id_383D( "tunnel_rush" );
    common_scripts\utility::_id_383D( "spawn_tunnel_helicopter" );
    common_scripts\utility::_id_383D( "helicopter_fly_over" );
    common_scripts\utility::_id_383D( "price_in_tunnel" );
    common_scripts\utility::_id_383D( "mark_in_tunnel" );
    common_scripts\utility::_id_383D( "barn_truck_arrived" );
    _id_A5A4::_id_3847( "barn_moveup", getent( "tunnel_trigger", "script_noteworthy" ) );
    common_scripts\utility::_id_383D( "barn_interrogation_start" );
    common_scripts\utility::_id_383D( "barn_rear_open" );
    common_scripts\utility::_id_383D( "barn_front_open" );
    common_scripts\utility::_id_383D( "interrogation_done" );
    common_scripts\utility::_id_383D( "start_scene" );
    common_scripts\utility::_id_383D( "save_farmer" );
    common_scripts\utility::_id_383D( "farmer_gone" );
    common_scripts\utility::_id_383D( "field_open" );
    _id_A5A4::_id_3847( "field_cross", getent( "field_cross", "targetname" ) );
    _id_A5A4::_id_3847( "field_cover", getent( "field_cover", "targetname" ) );
    common_scripts\utility::_id_383D( "field_spoted" );
    common_scripts\utility::_id_383D( "field_moveon" );
    common_scripts\utility::_id_383D( "field_truck" );
    common_scripts\utility::_id_383D( "field_defend" );
    _id_A5A4::_id_3847( "field_basement", getent( "field_basement", "targetname" ) );
    common_scripts\utility::_id_383D( "field_open_basement" );
    common_scripts\utility::_id_383D( "hit_the_deck_music" );
    common_scripts\utility::_id_383D( "basement_door_open" );
    common_scripts\utility::_id_383D( "heli_field_stragler_attack" );
    common_scripts\utility::_id_383D( "basement_open" );
    _id_A5A4::_id_3847( "basement_enter", getent( "basement_enter", "targetname" ) );
    _id_A5A4::_id_3847( "basement_light_1", getent( "basement_light_1", "targetname" ) );
    _id_A5A4::_id_3847( "basement_light_2", getent( "basement_light_2", "targetname" ) );
    _id_A5A4::_id_3847( "basement_light_3", getent( "basement_light_3", "targetname" ) );
    _id_A5A4::_id_3847( "basement_light_4", getent( "basement_light_4", "targetname" ) );
    _id_A5A4::_id_3847( "basement_light_5", getent( "basement_light_5", "targetname" ) );
    _id_A5A4::_id_3847( "basement_light_6", getent( "basement_light_6", "targetname" ) );
    _id_A5A4::_id_3847( "trim_field", getent( "trim_field", "targetname" ) );
    _id_A5A4::_id_3847( "basement_heli_takeoff", getent( "basement_heli_takeoff", "targetname" ) );
    _id_A5A4::_id_3847( "basement_flash", getent( "basement_flash", "targetname" ) );
    common_scripts\utility::_id_383D( "squad_in_basement" );
    common_scripts\utility::_id_383D( "basement_secure" );
    _id_A5A4::_id_3847( "farm_start", getent( "farm_start", "targetname" ) );
    _id_A5A4::_id_3847( "farm_alert", getent( "farm_alert", "targetname" ) );
    _id_A5A4::_id_3847( "farm_enemies_timer", getent( "farm_enemies_timer", "targetname" ) );
    common_scripts\utility::_id_383D( "farm_clear" );
    _id_A5A4::_id_3847( "creek_helicopter", getent( "creek_helicopter", "targetname" ) );
    _id_A5A4::_id_3847( "creek_start", getent( "creek_start", "targetname" ) );
    _id_A5A4::_id_3847( "creek_bridge", getent( "creek_bridge", "targetname" ) );
    common_scripts\utility::_id_383D( "creek_gate_open" );
    common_scripts\utility::_id_383D( "creek_truck_on_bridge" );
    _id_A5A4::_id_3847( "road_start", getent( "road_start", "targetname" ) );
    common_scripts\utility::_id_383D( "road_open_field" );
    _id_A5A4::_id_3847( "roadblock", getent( "roadblock", "targetname" ) );
    common_scripts\utility::_id_383D( "roadblock_start" );
    common_scripts\utility::_id_383D( "roadblock_done" );
    _id_A5A4::_id_3847( "road_field_search", getent( "road_field_search", "targetname" ) );
    common_scripts\utility::_id_383D( "road_field_end" );
    _id_A5A4::_id_3847( "road_field_cleanup", getent( "road_field_cleanup", "targetname" ) );
    common_scripts\utility::_id_383D( "road_field_clear_helicopter" );
    common_scripts\utility::_id_383D( "road_field_clear" );
    common_scripts\utility::_id_383D( "road_helicopter_cleared" );
    _id_A5A4::_id_3847( "greenhouse_area", getent( "greenhouse_area", "targetname" ) );
    common_scripts\utility::_id_383D( "helicopter_down" );
    _id_A5A4::_id_3847( "greenhouse_rear_exit", getent( "greenhouse_rear_exit", "targetname" ), 1 );
    common_scripts\utility::_id_383D( "greenhouse_done" );
    _id_A5A4::_id_3847( "greenhouse_heli_light_off", getent( "greenhouse_heli_light_off", "targetname" ), 1 );
    _id_A5A4::_id_3847( "gasstation_start", getent( "gasstation_start", "targetname" ) );
    _id_A5A4::_id_3847( "ac130_inplace", getent( "ac130_inplace", "targetname" ) );
    common_scripts\utility::_id_383D( "ac130_barrage" );
    common_scripts\utility::_id_383D( "go_dazed" );
    common_scripts\utility::_id_383D( "ac130_barrage_over" );
    _id_A5A4::_id_3847( "ac130_defend_gasstation", getent( "ac130_gasstation_defend", "targetname" ) );
    _id_A5A4::_id_3847( "mission_end_trigger", getent( "mission_end_trigger", "targetname" ) );
    common_scripts\utility::_id_383D( "helicopter_unloading" );
    common_scripts\utility::_id_383D( "player_interruption" );
}

objective_lz()
{
    var_0 = common_scripts\utility::_id_40FB( "bridge_origin", "targetname" );
    objective_add( 1, "active", &"HUNTED_OBJ_EXTRACTION_POINT", var_0._id_02E2 );
    objective_current( 1 );
}

objective_stinger()
{
    if ( !common_scripts\utility::_id_382E( "helicopter_down" ) )
    {
        var_0 = getent( "stinger_objective", "targetname" );
        objective_add( 2, "active", &"HUNTED_OBJ_DESTROY_HELICOPTER", var_0._id_02E2 );
        _func_1E1( 2, 1 );
        objective_current( 2 );
        common_scripts\utility::_id_384A( "helicopter_down" );
        wait 1;
        objective_state( 2, "done" );
    }
    else
    {
        objective_add( 2, "done", &"HUNTED_OBJ_DESTROY_HELICOPTER" );
        _func_1E1( 2, 1 );
    }

    objective_add( 3, "active", &"HUNTED_OBJ_FOLLOW_PRICE", level._id_6F7C._id_02E2 );
    _func_1E1( 3, 1 );
    objective_current( 3 );
    level thread my_objective_onentity( 3, level._id_6F7C );
    common_scripts\utility::_id_384A( "ac130_barrage_over" );
    level notify( "release_objective" );
    objective_state( 3, "done" );
    objective_current( 1 );
}

my_objective_onentity( var_0, var_1 )
{
    level endon( "release_objective" );
    objective_onentity( var_0, var_1 );

    for (;;)
        wait 0.05;
}

area_flight_init()
{
    thread hud_hide( 1 );
    common_scripts\utility::_id_383F( "aa_flight" );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_80F1();
    var_0 = getent( "crash_mask", "targetname" );
    var_0._id_02E2 += ( -3000, 64, -436 );
    level._id_0318 _meth_831A();
    level thread fligth_missile();
    flight_helicopter();
    level._id_0318 _meth_80F2();
    common_scripts\utility::_id_3831( "aa_flight" );
    thread area_crash_init();
}

flight_dialogue( var_0 )
{
    var_0 waittillmatch( "animontagdone", "dialog" );
    var_0 _meth_809C( "hunted_pri_whatthebloody" );
    common_scripts\utility::_id_383F( "flight_missile_warning" );
    var_0 waittillmatch( "animontagdone", "dialog" );
    var_0 _meth_809C( "hunted_pri_incomingmissile" );
    _id_A5A4::_id_69C5( "hunted_hp1_missileinbound", "tag_driver" );
    common_scripts\utility::_id_384A( "blackhawk_hit" );
    wait 1;
    _id_A5A4::_id_69C5( "hunted_hp1_maydaymayday", "tag_driver" );
}

bnb()
{
    wait 0.7;
    _id_A5A4::_id_69C5( "hunted_bnb_missilelock", "tag_driver" );
    _id_A5A4::_id_69C5( "hunted_bnb_warning", "tag_driver" );
    common_scripts\utility::_id_384A( "blackhawk_hit" );
    wait 5;
    _id_A5A4::_id_69C5( "hunted_bnb_altitude", "tag_driver" );
}

fligth_missile()
{
    var_0 = common_scripts\utility::_id_40FB( "missile_point", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_2 = getent( "missile_source", "targetname" );
    var_2 _meth_8056();
    var_2 _meth_8263( "hunted_crash_missile_hunted" );
    var_2 _meth_825E( var_1 );
    wait 1.5;
    var_3 = getent( "dummy_target", "targetname" );
    level.blackhawk_down_missile = var_2 _meth_8264( "tag_gun_r", var_3, ( 0, 0, 0 ) );
    level notify( "missile_fired" );

    while ( _func_0EF( level.blackhawk_down_missile._id_02E2, var_3._id_02E2 ) > 350 && isdefined( level.blackhawk_down_missile ) )
        wait 0.05;

    var_2 delete();
    level.blackhawk_down_missile _meth_81DC( var_1, ( 80, 20, -200 ) );
    wait 2;
    level.blackhawk_down_missile _meth_809C( "blackhawk_down_missile_inbound" );
    var_4 = _func_0F0( level.blackhawk_down_missile._id_02E2, var_1._id_02E2 );
    wait 0.05;

    while ( _func_0F0( level.blackhawk_down_missile._id_02E2, var_1._id_02E2 ) < var_4 )
    {
        var_4 = _func_0F0( level.blackhawk_down_missile._id_02E2, var_1._id_02E2 );
        wait 0.1;
    }

    _id_A5E8::_id_870C( "aud_heli_slomo" );
    var_5 = level.blackhawk_down_missile._id_02E2;
    level.blackhawk_down_missile delete();
    playfx( level._id_058F["missile_explosion"], var_5 );
    level thread common_scripts\utility::_id_69C2( "blackhawk_down_missile_impact", var_5 );
    common_scripts\utility::_id_383F( "blackhawk_hit" );
}

kill_missile( var_0 )
{
    var_0 delete();
}

flight_crash()
{
    wait 6;
    thread bnb();
    self _meth_809C( "alarm_missile_incoming" );
    common_scripts\utility::_id_384A( "blackhawk_hit" );
    thread flight_crash_rotate();
    var_0 = common_scripts\utility::_id_40FB( "crash_location", "targetname" );
    thread heli_path_speed( var_0 );
    self _meth_809C( "h1_blackhawk_down_msl_swt" );
    self _meth_809C( "h1_blackhawk_down_trbn_frnt" );
    self _meth_809C( "blackhawk_helicopter_hit" );
    wait 0.5;
    self _meth_809C( "blackhawk_helicopter_dying_loop" );
    wait 8.5;
    self _meth_809C( "h1_blackhawk_down_crash" );
    _id_A5E8::_id_870C( "aud_heli_crash_fade_out" );
    self notify( "stop_rotate" );
    wait 7;
    common_scripts\utility::_id_383F( "blackhawk_down" );
    self delete();
}

flight_crash_rotate()
{
    self _meth_8292( 1 );
    self _meth_828E( 1200, 100 );
    self endon( "stop_rotate" );

    for (;;)
    {
        if ( getdvarint( "use_original_crash_view" ) == 1 )
        {
            _func_18C( 0.4, 0.35, self._id_02E2, 256 );
            level._id_0318 _meth_80AF( "tank_rumble" );
        }

        self _meth_825A( self.angles[1] - 170 );
        wait 0.1;
    }
}

flight_helicopter()
{
    var_0 = _id_A5A8::_id_8979( "crash_blackhawk" );
    var_1 = spawn( "script_model", var_0 _meth_8184( "body_animate_jnt" ) );
    var_1 _meth_80B3( "vehicle_blackhawk_hero_interior" );
    var_1.angles = var_0.angles;
    var_1 _meth_804F( var_0, "body_animate_jnt" );
    var_1._id_0C72 = "blackhawk";
    var_1 _id_A510::_id_7F29();
    var_1 thread _id_A510::_id_0BE1( var_1, "interiorwires" );
    var_0 _meth_8292( 0.2 );
    var_0 thread flight_crash();
    var_0 _id_A5A8::_id_4259();
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_0._id_750A.size; var_3++ )
    {
        if ( _func_120( var_0._id_750A[var_3].classname, "vip" ) )
        {
            var_0._id_750A[var_3].has_ir = undefined;
            continue;
        }

        if ( !_func_120( var_0._id_750A[var_3].classname, "price" ) )
        {
            var_0._id_750A[var_3]._id_02A7 = "Gaz";
            continue;
        }

        var_2 = var_0._id_750A[var_3];
    }

    var_0 thread flight_dialogue( var_2 );
    var_0 thread flight_helicopter_dlight();

    if ( getdvarint( "use_original_crash_view" ) == 1 )
    {
        var_0._id_90BD = var_0 fake_tag( "tag_origin", ( -10, 32, -132 ), ( 0, 140, 0 ) );
        level._id_0318 _meth_807F( var_0._id_90BD, "tag_origin", 0.5, 80, 80, 30, 20 );
        level._id_0318 _meth_8337( ( 0, 35, 0 ) );
        _id_A5A4::enable_scuff_footsteps_sound( 0 );
        common_scripts\utility::_id_384A( "blackhawk_down" );
        level._id_0318 _meth_8051();
        _id_A5A4::enable_scuff_footsteps_sound( 1 );
    }
    else
    {
        var_4 = _id_A5A4::_id_88D1( "player_flight_helicopter" );
        var_4 _meth_804F( var_0, "tag_detach" );
        var_0 thread _id_A510::_id_0C24( var_4, "flight_crash_player", "tag_detach", var_0 );
        level._id_0318 _meth_807F( var_4, "tag_player", 0.75, 42, 60, 15, 20, 0 );
        thread h1_flightcrash_viewclamp_seq();
        _id_A5A4::enable_scuff_footsteps_sound( 0 );
        common_scripts\utility::_id_384A( "blackhawk_down" );
        var_4 delete();
        _id_A5A4::enable_scuff_footsteps_sound( 1 );
    }

    var_1 delete();
}

h1_flightcrash_viewclamp_seq()
{
    wait 6.0;
    level._id_0318 _meth_80A4( 1.5, 0, 0, 35, 45, 15, 15 );
    common_scripts\utility::_id_384A( "blackhawk_hit" );
    wait 0.5;
    level._id_0318 _meth_80A4( 1.0, 0, 0, 10, 65, 10, 10 );
}

flight_helicopter_dlight()
{
    self.dlight_ent1 = fake_tag( "tag_light_cargo01", ( 10, -25, -60 ), ( 0, 0, 0 ) );
    playfxontag( level._id_058F["heli_dlight_blue"], self.dlight_ent1, "tag_origin" );
    common_scripts\utility::_id_384A( "flight_missile_warning" );
    self.dlight_ent3 = fake_tag( "tag_light_cargo01", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    playfxontag( level._id_058F["heli_dlight_red"], self.dlight_ent3, "tag_origin" );
}

fake_tag( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", self._id_02E2 );
    var_3 _meth_80B3( "tag_origin" );
    var_3 _meth_8056();
    var_3 _meth_804F( self, var_0, var_1, var_2 );
    thread fake_tag_destroy( var_3 );
    return var_3;
}

tmp_point()
{
    var_0 = spawn( "script_model", self._id_02E2 );
    var_0 _meth_80B3( "fx" );
    var_0 _meth_804F( self );
    wait 2;
    var_0 delete();
}

fake_tag_destroy( var_0 )
{
    self waittill( "death" );
    var_0 delete();
}
#using_animtree("generic_human");

blackhawk_overrides()
{
    var_0 = vehicle_scripts\_blackhawk::_id_7F23();
    var_0[2]._id_4B63 = %bh_1_idle;
    var_0[3]._id_4B63 = %hunted_bh2_crash;
    var_0[4]._id_4B63 = %bh_4_idle;
    var_0[5]._id_4B63 = %bh_5_idle;
    var_0[6]._id_4B63 = %hunted_bh8_crash;
    var_0[7]._id_4B63 = %hunted_bh6_crash;
    return var_0;
}

area_crash_init()
{
    _id_A5E8::_id_870C( "aud_set_exterior_level_2" );
    common_scripts\utility::_id_383F( "aa_crash" );
    setup_friendlies();
    common_scripts\utility::_id_0D13( level._id_8AB0, ::set_fixednode, 0 );
    level thread crash_player();
    level._id_6F7C thread crash_price();
    level.steve thread crash_steve();
    level thread crash_wounded_dialogue();
    level thread _id_5FFB();

    if ( !getdvarint( "use_old_opening" ) == 1 )
        level.mark thread crash_mark();

    common_scripts\utility::_id_383F( "price_help" );
    _id_A5E8::_id_870C( "aud_heli_crash_fade_in" );
    common_scripts\utility::_id_384A( "wakeup_done" );
    hud_hide( 0 );
    common_scripts\utility::_id_384A( "wounded_check_done" );
    common_scripts\utility::_id_3831( "aa_crash" );
    level thread area_dirt_path_init();
}

crash_wounded_dialogue()
{
    common_scripts\utility::_id_384A( "wakeup_done" );

    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        wait 1;
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "casualtyreport" );
        level.mark _id_A510::_id_0C21( level.mark, "bothpilotsdead" );
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "bugger" );
        wait 3;
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "extractionpoint" );
    }
    else
    {
        level._id_6F7C waittillmatch( "single anim", "dialog" );
        wait 1.2;
        level.mark thread _id_A510::_id_0C21( level.mark, "bothpilotsdead" );
        level._id_6F7C waittillmatch( "single anim", "dialog" );
        level._id_6F7C waittillmatch( "single anim", "dialog" );
    }

    common_scripts\utility::_id_384A( "path_trigger" );
    _id_A5A4::_id_70BD( "hunted_price_ac130_inbound" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "hunted_pri_copy" );
    level.mark _id_A510::_id_0C21( level.mark, "hunted_uk2_ac130" );
    common_scripts\utility::_id_383F( "crash_dialogue_done" );
}

crash_price()
{
    var_0 = getent( "start_animent", "targetname" );
    common_scripts\utility::_id_384A( "price_help" );
    self notify( "stop_going_to_node" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        wait 7.5;

    thread fuel_explosion();
    var_0 _id_A510::_id_0BFF( self, "hunted_opening_price" );
    common_scripts\utility::_id_383F( "wakeup_start" );
    var_0 _id_A510::_id_0C24( self, "hunted_opening_price" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        _id_A5A4::_id_7E38( "c" );
}

fuel_explosion()
{
    self waittillmatch( "single anim", "fuel_ignition" );
    maps\hunted_fx::fuel_explosion();
}

crash_steve()
{
    _id_A5A4::_id_7EAB( "path_slow" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        var_0 = getent( "wounded_animent", "targetname" );
    else
        var_0 = getent( "start_animent", "targetname" );

    var_1 = crash_setup_wounded( var_0 );
    common_scripts\utility::_id_384A( "wounded_check" );

    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        wait 15.5;
        level notify( "mark_anim_reach_start" );
        self notify( "stop_going_to_node" );
        var_0 _id_A510::_id_0BFF( self, "hunted_dying" );
    }
    else
    {
        common_scripts\utility::_id_384A( "wakeup_start" );
        var_0 _id_A510::_id_0C24( level.steve, "hunted_opening_nikolai" );
        wait 7;
    }

    var_2 = spawn( "script_model", var_1._id_02E2 );
    var_2 _meth_80B3( "h1_prop_dogtag" );
    var_2 _id_A5A4::_id_0D61( "dogtags" );
    var_3[0] = level.steve;
    var_3[1] = var_1;
    var_3[2] = var_2;
    var_0 _id_A510::_id_0C18( var_3, "hunted_dying" );
    common_scripts\utility::_id_383F( "wounded_check_done" );
    var_0 thread _id_A510::_id_0BE1( var_1, "hunted_dying_endidle", undefined, "stop_idle" );
    common_scripts\utility::_id_384A( "tunnel_rush" );
    var_1 delete();
}

crash_mark()
{
    var_0 = getent( "start_animent", "targetname" );
    level waittill( "mark_anim_reach_start" );
    self notify( "stop_going_to_node" );
    var_0 _id_A510::_id_0BFF( self, "mark_hunted_dying" );
    var_0 _id_A510::_id_0C24( self, "mark_hunted_dying" );
}

crash_setup_wounded( var_0 )
{
    var_1 = getent( "dead_guy_spawner", "targetname" );
    var_2 = _id_A5A4::_id_2F29( var_1 );
    var_2._id_0C72 = "dead_guy";
    var_0 _id_A510::_id_0BC7( var_2, "hunted_dying" );

    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        var_3 = getent( "crash_gun_new", "targetname" );
        var_3 delete();
    }
    else
    {
        var_2 _id_A5A4::_id_4462();
        var_3 = getent( "crash_gun_old", "targetname" );
        var_3 delete();
    }

    return var_2;
}

crash_player()
{
    if ( getdvarint( "use_old_opening" ) == 1 )
    {
        level thread crash_wakeup_preh1();
        level._id_0318 _meth_811B( 1 );
        level._id_0318 _meth_811C( 1 );
    }
    else
        level thread _id_2358();

    level._id_0318 set_playerspeed( 130 );
    common_scripts\utility::_id_383F( "wounded_check" );
    level._id_6F7C common_scripts\utility::_id_4853( "wakeup_done" );
    common_scripts\utility::_id_384A( "wakeup_done" );
    level._id_0318 _meth_831B();
    _func_0D6( "r_mbEnable", 0 );
}

_id_2358()
{
    level._id_0318 _meth_8326( 1 );
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_811B( 0 );
    var_0 = getent( "start_animent", "targetname" );
    _func_0D6( "r_mbEnable", 2 );
    var_1 = _id_A5A4::_id_88D1( "opening_player_model" );
    var_1._id_02E2 = var_0._id_02E2;
    var_1.angles = var_0.angles;
    level._id_0318 _meth_807F( var_1, "tag_player", 1, 0, 0, 0, 0, 0 );
    var_0 thread _id_A510::_id_0BC7( var_1, "opening_player" );
    level thread crash_player_sound();
    common_scripts\utility::_id_384A( "wakeup_start" );

    if ( getdvarint( "use_old_opening" ) == 1 )
        var_0 _id_A510::_id_0C24( var_1, "opening_player" );
    else
    {
        var_0 thread _id_A510::_id_0C24( level.steve, "hunted_opening_nikolai" );
        var_0 _id_A510::_id_0C24( var_1, "opening_player" );
    }

    var_1 delete();
    level._id_0318 _meth_8326( 0 );
    level._id_0318 _meth_811C( 1 );
    level._id_0318 _meth_811B( 1 );
    common_scripts\utility::_id_383F( "wakeup_done" );
}
#using_animtree("player");

crash_wakeup_preh1()
{
    var_0 = getent( "start_animent", "targetname" );
    var_1 = _func_06F( var_0._id_02E2, var_0.angles, %hunted_opening_player );
    var_2 = _func_070( var_0._id_02E2, var_0.angles, %hunted_opening_player );
    var_3 = _id_6D82( var_1, var_2 );
    level._id_0318 _meth_8335( var_1 );
    level._id_0318 _meth_8337( var_2 );
    level._id_0318 _meth_8081( var_3, "tag_player" );
    var_3 _meth_8115( "viewanim", %hunted_opening_player_idle );
    level thread crash_player_sound();
    common_scripts\utility::_id_384A( "wakeup_start" );
    var_3 _meth_8144( %hunted_opening_player_idle, 0 );
    var_3 _meth_8115( "viewanim", %hunted_opening_player );
    var_3 animscripts\shared::_id_2D06( "viewanim" );
    var_3 _meth_8144( %hunted_opening_player, 0 );
    level._id_0318 _meth_8051();
    var_3 delete();
    common_scripts\utility::_id_383F( "wakeup_done" );
}

_id_6D82( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 _meth_80B3( "worldbody_h1_sas_woodland" );
    var_2 _meth_8117( #animtree );
    var_2 _meth_8056();
    return var_2;
}

crash_player_sound()
{
    wait 3.5;
    level._id_0318 _id_A5A4::_id_69C4( "breathing_better" );
}

area_dirt_path_init()
{
    _id_A5A4::_id_1143( "dirt_path" );

    if ( !common_scripts\utility::_id_382E( "path_trigger" ) )
        _id_A5A4::_id_070A( "dirt_path_color_init" );

    common_scripts\utility::_id_383F( "aa_dirt_path" );
    level thread objective_lz();
    level thread dirt_path_truck();
    level thread dirt_path_barn_truck();
    level thread dirt_path_helicopter();
    level thread dirt_path_allies();
    level thread dirt_path_player_speed();
    level thread dirt_path_player();
    level thread player_interruption();
    thread door_anim_first_frame_solo();
    common_scripts\utility::_id_384A( "price_in_tunnel" );
    common_scripts\utility::_id_384A( "mark_in_tunnel" );
    common_scripts\utility::_id_384A( "barn_moveup" );
    common_scripts\utility::_id_3831( "aa_dirt_path" );
    level thread area_barn_init();
}

dirt_path_allies()
{
    level._id_6F7C thread dirt_path_price();
    level.steve thread dirt_path_steve();
    level.charlie thread dirt_path_charlie();
    level.mark thread dirt_path_mark();
}

dirt_path_player()
{
    common_scripts\utility::_id_384A( "tunnel_rush" );
    wait 1;
    level._id_0318 set_playerspeed( 190, 2 );
}

dirt_path_price_dialogue()
{
    common_scripts\utility::_id_384A( "crash_dialogue_done" );
    wait 2;

    if ( !common_scripts\utility::_id_382E( "truck_alert" ) )
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "lowprofile" );
}

dirt_path_price()
{
    thread dirt_path_price_dialogue();
    self notify( "stop_going_to_node" );
    _id_A5A4::_id_7E38( "c" );
    common_scripts\utility::_id_384A( "truck_alert" );
    var_0 = getent( "truck_warning_animent", "targetname" );
    var_0 _id_A510::_id_0BFF( self, "hunted_wave_chat" );
    common_scripts\utility::_id_383F( "trucks_warning" );
    var_0 _id_A510::_id_0C24( self, "hunted_wave_chat" );
    thread _id_A510::_id_0C21( self, "hunted_wave_chat_snd" );
    self._id_2AF3 = 0;
    var_0 = getent( "tunnel_animent", "targetname" );
    var_0 _id_A510::_id_0BFF( self, "hunted_tunnel_guy2_runin" );
    var_0 _id_A510::_id_0C24( self, "hunted_tunnel_guy2_runin" );
    var_0 thread _id_A510::_id_0BE1( self, "hunted_tunnel_guy2_idle", undefined, "price_stop_idle" );
    wait 3;
    common_scripts\utility::_id_384A( "helicopter_fly_over" );
    common_scripts\utility::_id_383F( "price_in_tunnel" );
    getent( "tunnel_trigger", "script_noteworthy" ) thread trigger_timeout( 8 );
    common_scripts\utility::_id_3852( "barn_moveup", "player_interruption" );
    common_scripts\utility::_id_383F( "barn_moveup" );
    var_0 notify( "price_stop_idle" );

    if ( common_scripts\utility::_id_382E( "player_interruption" ) )
        var_0 _id_A510::_id_0C24( self, "hunted_tunnel_guy2_runout_interrupt" );
    else
        var_0 _id_A510::_id_0C24( self, "hunted_tunnel_guy2_runout" );
}

dirt_path_charlie()
{
    var_0 = getent( "truck_warning_animent", "targetname" );
    var_0 _id_A510::_id_0BF7( self, "hunted_wave_chat", "hunted_spotter_idle", "charlie_stop_idle" );
    common_scripts\utility::_id_384A( "trucks_warning" );
    level thread _id_A5A4::_id_3840( "tunnel_rush", 3 );
    var_0 notify( "charlie_stop_idle" );
    thread _id_A510::_id_0C21( self, "hunted_wave_chat_snd" );
    var_0 _id_A510::_id_0C24( self, "hunted_wave_chat" );
    var_1 = _func_0C3( "charlie_tunnel", "targetname" );
    self _meth_81A9( var_1 );
    self._id_01C4 = 0;
    self waittill( "goal" );
    _id_A5A4::_id_1ED1();
}

dirt_path_mark()
{
    self notify( "stop_going_to_node" );
    _id_A5A4::_id_7E38( "g" );
    common_scripts\utility::_id_384A( "tunnel_rush" );
    self _meth_81A7( 1 );
    var_0 = getent( "tunnel_animent", "targetname" );
    var_0 _id_A510::_id_0BFF( self, "hunted_tunnel_guy1_runin" );
    var_0 _id_A510::_id_0C24( self, "hunted_tunnel_guy1_runin" );

    if ( !common_scripts\utility::_id_382E( "helicopter_fly_over" ) )
    {
        var_0 thread _id_A510::_id_0BE1( self, "hunted_tunnel_guy1_idle", undefined, "mark_stop_idle" );
        common_scripts\utility::_id_384A( "helicopter_fly_over" );
        var_0 notify( "mark_stop_idle" );
        var_0 _id_A510::_id_0C24( self, "hunted_tunnel_guy1_lookup" );
    }

    var_0 thread _id_A510::_id_0BE1( self, "hunted_tunnel_guy1_idle", undefined, "mark_stop_idle" );
    common_scripts\utility::_id_383F( "mark_in_tunnel" );
    common_scripts\utility::_id_384A( "barn_moveup" );
    wait 2;
    var_0 notify( "mark_stop_idle" );
    var_0 _id_A510::_id_0C24( self, "hunted_tunnel_guy1_runout" );
    self _meth_81A7( 0 );
}

dirt_path_mark_path_end()
{
    self endon( "stop_path" );
    self waittill( "path_end_reached" );
    common_scripts\utility::_id_383F( "mark_at_goal" );
}

dirt_path_steve()
{
    self notify( "stop_going_to_node" );
    _id_A5A4::_id_7E38( "g" );
    _id_A5A4::_id_1ED1();
    common_scripts\utility::_id_384A( "trucks_warning" );
    self._id_2AF3 = 0;
    var_0 = _func_0C3( "steve_tunnel", "targetname" );
    self _meth_81A9( var_0 );
    self._id_01C4 = 0;
    self _meth_81A7( 0 );
}

dirt_path_helicopter()
{
    common_scripts\utility::_id_384A( "spawn_tunnel_helicopter" );
    var_0 = _id_A5A8::_id_8978( "tunnel_heli" );
    var_0 _meth_824F( 128, 10, 3 );
    var_0 thread heli_path_speed();
    var_0 common_scripts\utility::_id_A087( "near_goal", "goal" );
    wait 0.05;
    var_1 = level.move_time;
    var_2 = common_scripts\utility::_id_40FB( "fly_over_point", "script_noteworthy" );
    var_3 = _func_0EE( var_0._id_02E2, var_2._id_02E2 );
    var_4 = var_3 / var_1 / 17.6;
    var_0 _meth_827F( var_4, var_4 );
    var_0 helicopter_searchlight_on();
    var_2 waittill( "trigger" );
    common_scripts\utility::_id_383F( "helicopter_fly_over" );
    var_0 thread dirt_path_helicopter_react();
    var_5 = getent( "heli_away", "targetname" );
    var_5 waittill( "trigger" );
    var_0 notify( "heli_away" );
}

dirt_path_helicopter_react()
{
    level endon( "barn_rear_open" );
    thread impact_trigger_attach();
    common_scripts\utility::_id_A087( "impact", "heli_away" );
    var_0 = common_scripts\utility::_id_40FB( "heli_away_path", "targetname" );
    thread heli_path_speed( var_0 );
    self notify( "spot_target_path" );
    helicopter_setturrettargetent( self.spotlight_default_target );
}

impact_trigger_attach()
{
    var_0 = getent( "heli_damage_trigger", "targetname" );

    if ( isdefined( var_0._id_020D ) )
        var_0 _meth_8051();
    else
        var_0 _meth_806B();

    var_0._id_020D = 1;
    var_0 _meth_804F( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0 thread notify_impact( self );
}

notify_impact( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "damage" );
        var_0 notify( "impact" );
    }
}

dirt_path_player_speed()
{
    var_0 = getent( "calc_speed_trigger", "script_noteworthy" );
    var_1 = getent( "helicopter_trigger", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_2 = gettime();
    var_1 waittill( "trigger" );
    var_3 = gettime();
    var_4 = ( var_3 - var_2 ) / 1000;

    if ( var_4 > 0.75 )
        var_4 = 0.75;

    var_4 = 1 + var_4 * 4;
    level.move_time = var_4;
    common_scripts\utility::_id_384A( "tunnel_rush" );
    common_scripts\utility::_id_383F( "spawn_tunnel_helicopter" );
}

dirt_path_truck()
{
    common_scripts\utility::_id_384A( "trucks_warning" );
    var_0 = _id_A5A8::_id_8978( "path_truck" );
    thread _id_A5A8::_id_427A( var_0 );
    var_0 turn_headlights_on();
    var_0 _id_A5A8::_id_4259();
}

player_interruption()
{
    common_scripts\utility::_id_384A( "tunnel_rush" );
    wait 3;
    level thread set_flag_on_player_action( "player_interruption", 0, 1, 1 );
}

dirt_path_barn_truck()
{
    common_scripts\utility::_id_384A( "trucks_warning" );
    wait 2;
    var_0 = _id_A5A8::_id_8978( "barn_truck" );
    var_0 _id_A5A8::_id_4259();
    wait 0.1;
    var_1 = var_0._id_750A;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] thread _id_A5A4::_id_58D7();
        var_1[var_2] _meth_817B( "oblivious" );
    }

    thread _id_A5A8::_id_427A( var_0 );
    var_0 turn_headlights_on( 1 );
    var_0 thread barn_truck_add_dynamic_light();
    var_0 thread barn_russian_joke( var_1 );
    var_0 waittill( "reached_end_node" );
    var_0 thread h1_first_frame_anim_guys_on_unload();
    wait 1;
    common_scripts\utility::_id_383F( "barn_truck_arrived" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_8EA4 );
    var_0 _meth_805A();

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
    {
        _id_A5A4::_id_070A( "barn_truck_color_init" );
        common_scripts\utility::_id_384C( "interrogation_done", "player_interruption" );
    }

    var_0 dirt_path_disable_truck();

    if ( isdefined( level.barn_truck_dummy ) )
        level.barn_truck_dummy _meth_814D( level.bm21_custom["explosion"] );
}

get_interrogation_badguys()
{
    var_0 = _func_0D9( "axis" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( isdefined( var_0[var_4]._id_0398 ) && var_0[var_4]._id_0398 == "leader" )
            var_1 = var_0[var_4];

        if ( isdefined( var_0[var_4]._id_0398 ) && var_0[var_4]._id_0398 == "thug" )
            var_2 = var_0[var_4];

        if ( isdefined( var_0[var_4]._id_0398 ) && var_0[var_4]._id_0398 == "thug2" )
            var_3 = var_0[var_4];
    }

    var_1._id_0C72 = "leader";
    var_2._id_0C72 = "thug";
    var_3._id_0C72 = "thug2";
    var_5 = [];
    var_5[0] = var_1;
    var_5[1] = var_2;
    var_5[2] = var_3;
    return var_5;
}

h1_first_frame_anim_guys_on_unload()
{
    _id_A5A4::_id_32E0( "unloaded" );

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
    {
        var_0 = get_interrogation_badguys();
        var_1 = getent( "barnfarm_animent", "targetname" );
        var_1 _id_A510::_id_0BC5( var_0, "hunted_farmsequence" );
        level endon( "interrogation_done" );
        common_scripts\utility::_id_384A( "player_interruption" );

        foreach ( var_3 in var_0 )
            var_3 notify( "stop_first_frame" );
    }
}

barn_russian_joke( var_0 )
{
    var_0[0] endon( "death" );
    var_0[1] endon( "death" );
    level endon( "player_interruption" );
    common_scripts\utility::_id_384A( "barn_truck_arrived" );
    _id_A510::_id_0BC9( var_0[0], "hunted_ru1_isadump" );
    thread _id_A510::_id_0BC9( var_0[0], "laugh1" );
    _id_A510::_id_0BC9( var_0[1], "laugh2" );
}

dirt_path_disable_truck()
{
    self endon( "death" );
    wait 2;
    _id_A5AA::_id_5746( "headlights" );
    self _meth_8287();
    _id_A5A8::_id_4258();
    self._id_7965 = 0;
    wait 0.5;
    level.barn_truck_dummy = _id_A5A8::_id_9D58();

    for (;;)
    {
        playfx( level._id_058F["truck_smoke"], self _meth_8184( "tag_engine_left" ) );
        wait 0.5;
    }
}

barn_truck_add_dynamic_light()
{
    var_0 = getent( "tunnel_trigger", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_1 = getent( "tunnel_animent", "targetname" );
    var_2 = _func_0F0( level._id_0318._id_02E2, var_1._id_02E2 );
    var_3 = 1;
    var_4 = 0;

    for (;;)
    {
        if ( level._id_0318 _meth_80AB( var_0 ) )
        {
            var_3 = 1;
            waittillframeend;
            continue;
        }

        if ( var_3 )
        {
            var_4 = _func_0F0( level._id_0318._id_02E2, var_1._id_02E2 );
            var_3 = 0;
        }

        if ( var_4 > var_2 )
        {
            break;
            continue;
        }

        waittillframeend;
    }

    var_0 common_scripts\utility::_id_97CC();

    if ( common_scripts\utility::_id_382E( "interrogation_done" ) || common_scripts\utility::_id_382E( "player_interruption" ) )
        return;

    _id_A5A8::_id_1857( self.classname, "headlight_truck_left3", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight_spotlight_alone", "headlights" );
    _id_A5A8::_id_1857( self.classname, "headlight_truck_right3", "tag_headlight_right", "vfx/lights/hunted/hunted_headlight_spotlight_alone", "headlights" );
    turn_headlights_on( 1 );
}

area_barn_init()
{
    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
    {
        _id_A5A4::_id_1143( "barn" );
        level thread set_flag_on_player_action( "player_interruption", 1, 1, 1 );
        level thread glass_shatter_wait();
    }

    common_scripts\utility::_id_383F( "aa_barn" );
    level thread barn_early_interruption();
    level thread barn_interrogation_wait();
    level._id_6F7C thread barn_price_moveup();
    level.mark thread barn_mark_moveup();
    level.steve _id_A5A4::_id_7E38( "r" );
    level.charlie _id_A5A4::_id_7E38( "r" );
    common_scripts\utility::_id_384A( "barn_front_open" );
    _id_A5A4::_id_A066( "barn_enemies" );
    level.mark _id_A5A4::_id_2A74();
    level._id_6F7C _id_A5A4::_id_2A74();
    level.steve _id_A5A4::_id_2A74();
    level.charlie _id_A5A4::_id_2A74();
    level._id_6F7C set_goalnode( _func_0C3( "price_barn_exterior", "targetname" ) );
    level.mark set_goalnode( _func_0C3( "mark_barn_exterior2", "targetname" ) );
    level.steve set_goalnode( _func_0C3( "steve_barn_exterior", "targetname" ) );
    level.charlie set_goalnode( _func_0C3( "charlie_barn_exterior", "targetname" ) );
    level.mark waittill( "goal" );
    common_scripts\utility::_id_3831( "aa_barn" );
    level thread area_field_init();
}

glass_shatter_wait()
{
    level endon( "kill_action_flag" );
    level endon( "player_interruption" );
    level waittill( "glass_shatter" );
    common_scripts\utility::_id_383F( "player_interruption" );
}

barn_interrogation_wait()
{
    level endon( "player_interruption" );
    common_scripts\utility::_id_384A( "barn_interrogation_start" );
    level notify( "stop_barn_early_interruption" );
    level thread barn_interrogation();
}

barn_interrogation()
{
    var_0 = getent( "barnfarm_animent", "targetname" );
    var_1 = _id_7B3C( "farmer", "targetname", 1 );
    var_1._id_01E6 = 1000000;
    var_1.a._id_2B20 = 1;
    var_1 _id_A5A4::_id_7DDF( 0 );
    var_1 _id_A5A4::_id_7F71( 1 );
    var_1._id_01D1 = 0;
    var_1._id_0C72 = "farmer";
    var_1 _id_A5A4::_id_7EAB( "walk" );
    var_1 _meth_817B( "oblivious" );
    var_1._id_02A7 = "";
    level.farmer = var_1;
    var_1 _id_A5A4::_id_4462();
    var_2 = get_interrogation_badguys();
    var_3 = var_2[0];
    var_2 = common_scripts\utility::_id_0CDA( var_2, var_1 );
    _func_0D6( "ai_friendlyFireBlockDuration", 0 );
    level thread barn_interrogation_interruption( var_3 );
    common_scripts\utility::_id_0D13( var_2, ::barn_abort_actors );
    _id_A5A4::_id_1143( "interrogation" );
    var_3 thread farmer_death_fx( var_1 );
    var_1 thread barn_farmer( var_0 );
    barn_interrogation_anim( var_0, var_2, var_1 );
    _id_A5A4::_id_070A( "barn_ambush_color_init" );
    setthreatbiasgroup_on_array( "axis", _id_A5A4::_id_3CB4( "barn_enemies" ) );

    if ( _func_1A1( var_1 ) && common_scripts\utility::_id_382E( "player_interruption" ) )
    {
        var_1 _meth_8143();
        var_1 _meth_80AE();
        var_1 barn_interrogation_farmer_anim_reaction();

        if ( _func_1A1( var_1 ) )
        {
            var_1 set_goalnode( _func_0C3( "hide", "targetname" ) );
            var_1 thread _id_2827();
        }
    }

    if ( _func_1A1( var_3 ) && !common_scripts\utility::_id_382E( "player_interruption" ) )
        var_3 _meth_817B( "axis" );

    var_3 common_scripts\utility::_id_A0A0( "damage", 1.5 );
    common_scripts\utility::_id_383F( "player_interruption" );
    wait 1;
    common_scripts\utility::_id_383F( "interrogation_done" );
    _func_0D6( "ai_friendlyFireBlockDuration", level.ai_friendlyfireblockduration );
}

barn_interrogation_farmer_anim_reaction()
{
    if ( getdvarint( "use_old_interrogation" ) )
        return;

    self endon( "death" );
    var_0 = _func_092( level._id_78AC["farmer"]["farmer_surprised"], 0, 1 );
    var_1 = self _meth_81B4( var_0 );
    var_2 = undefined;
    var_3 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_2 = self _meth_83E3( self._id_02E2 + ( 0, 0, 10 ), self._id_02E2 - ( 0, 0, 10 ), 0, 0, 1, 1, 0, 1, 2 );
        var_3 = self _meth_83E3( var_1 + ( 0, 0, 10 ), var_1 - ( 0, 0, 10 ), 0, 0, 1, 1, 0, 1, 2 );
    }

    if ( !isdefined( var_2 ) || !isdefined( var_3 ) || var_2["fraction"] == 1 && var_3["fraction"] == 1 )
    {
        var_4 = common_scripts\utility::_id_8959();
        var_4 _id_A510::_id_0C24( self, "farmer_surprised" );
    }

    _id_A5A4::_id_7EAB( "runaway" );
}

farmer_death_fx( var_0 )
{
    if ( getdvarint( "use_old_noblood" ) == 1 )
        return;

    level endon( "player_interruption" );
    self waittillmatch( "single anim", "fire" );
    var_1 = var_0 _meth_8184( "tag_eye" );
    var_2 = var_0 _meth_8185( "tag_eye" );
    var_2 = _func_253( var_2 );
    var_3 = anglestoforward( var_2 );
    var_1 += var_3 * 9;
    var_1 -= ( -5, 0, 0 );
    playfx( level._id_058F["head_fatal"], var_1, anglestoforward( var_2 ), anglestoup( var_2 ) );
}

barn_price_dialogue()
{
    level endon( "player_interruption" );

    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        wait 13;
        common_scripts\utility::_id_383F( "save_farmer" );
        wait 2;
        level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "killoldman" );
    }
    else
    {
        wait 16.15;
        common_scripts\utility::_id_383F( "save_farmer" );
        wait 2;
        level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "killoldman" );
    }
}

barn_interrogation_interruption( var_0 )
{
    level endon( "interrogation_done" );
    level endon( "kill_action_flag" );
    common_scripts\utility::_id_384A( "player_interruption" );
    level notify( "interrogation_interrupted" );

    if ( !_func_1A1( var_0 ) )
        return;

    var_1 = var_0 animscripts\utility::_id_409A();

    if ( var_1 != var_0._id_0513 )
    {
        var_0 animscripts\shared::_id_6869( var_0._id_0513, "none" );
        var_0._id_0513 = var_1;
        var_0._id_18B0 = _func_1B1( var_0._id_0513 );
    }

    var_0 animscripts\shared::_id_6869( var_0._id_0513, "right" );
}

front_door_linked_ent()
{
    var_0 = getentarray( "doorknob", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 _meth_804F( self );
}

barn_interrogation_anim( var_0, var_1, var_2 )
{
    level endon( "interrogation_interrupted" );
    var_3 = getent( "farmer_front_door", "targetname" );
    var_3 thread barn_interrogation_anim_door();
    var_0 _id_A510::_id_0BFF( var_2, "hunted_farmsequence" );
    common_scripts\utility::_id_383F( "start_scene" );
    level._id_6F7C thread barn_price_dialogue();
    var_0 thread _id_A510::_id_0C18( var_1, "hunted_farmsequence" );
    var_1[0] waittillmatch( "single anim", "fire" );
    var_2.deadfarmer = 1;
    level notify( "kill_farmer_thread" );
    thread common_scripts\utility::_id_69C2( "hunted_famer_shot", var_1[0]._id_02E2 );
}

barn_interrogation_anim_door()
{
    if ( getdvarint( "use_old_interrogation" ) )
        self _meth_82B3( 95, 0.7, 0.5, 0.2 );
    else
    {
        common_scripts\utility::_id_384A( "start_scene" );
        wait 0.25;
        self _meth_82B3( 95, 1.5, 0.7, 0.5 );
    }

    self _meth_805A();
}

barn_abort_actors()
{
    level endon( "interrogation_done" );
    self.flashbangstopsscriptedanim = 1;
    var_0 = wait_for_player_interruption_or_damage();

    if ( isdefined( self ) && !isdefined( self.deadfarmer ) && level.farmer != self )
    {
        self _meth_8143();
        self notify( "single anim", "end" );
        self _meth_80AE();
    }

    if ( isdefined( var_0 ) && var_0 > self._id_01E6 )
    {
        self.allowdeath = 1;
        self _meth_8054();
    }
}

wait_for_player_interruption_or_damage()
{
    level endon( "player_interruption" );
    self waittill( "damage", var_0 );
    return var_0;
}

barn_farmer( var_0 )
{
    level endon( "interrupt_farmer" );
    self endon( "death" );
    thread barn_farmer_interrupt();
    _id_A5A4::_id_7E60( 1 );
    self waittillmatch( "single anim", "end" );
    var_0 thread _id_A510::_id_0BE1( self, "farmer_deathpose" );
    self.a._id_612E = 1;
    self.allowdeath = 1;
    wait 0.1;
    _id_A5A4::_id_2A51();
}

barn_farmer_interrupt()
{
    level endon( "kill_farmer_thread" );
    common_scripts\utility::_id_384A( "player_interruption" );
    level notify( "interrupt_farmer" );
}

barn_early_interruption()
{
    level endon( "stop_barn_early_interruption" );
    common_scripts\utility::_id_384A( "player_interruption" );
    setthreatbiasgroup_on_array( "axis", _id_A5A4::_id_3CB4( "barn_enemies" ) );
    level._id_6F7C notify( "end_wait" );

    if ( common_scripts\utility::_id_382E( "barn_interrogation_start" ) )
        return;

    wait 0.5;
    common_scripts\utility::_id_0D13( level._id_8AB0, _id_A5A4::_id_7E38, "y" );
    _id_A5A4::_id_070A( "barn_early_interruption" );

    while ( _id_A5A4::_id_3CB5( "barn_enemies" ) > 2 )
        wait 0.05;

    level.mark _id_A5A4::_id_2A74();
    level._id_6F7C _id_A5A4::_id_2A74();
    level.steve _id_A5A4::_id_7E38( "r" );
    level.charlie _id_A5A4::_id_7E38( "r" );

    if ( !common_scripts\utility::_id_382E( "barn_interrogation_start" ) )
        level._id_6F7C thread barn_early_interruption_price();
}

barn_early_interruption_price()
{
    barn_price_move_to_door();
    barn_price_open_door();
    price_enter_barn();
}

barn_price_moveup()
{
    barn_price_move_to_door();

    if ( common_scripts\utility::_id_382E( "player_interruption" ) )
        return;

    barn_price_wait_at_door();
    _id_A5A4::_id_7E60( 1 );
    var_0 = getent( "barn_rear_trigger", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_384A( "barn_truck_arrived" );

    if ( common_scripts\utility::_id_382E( "player_interruption" ) )
        return;

    common_scripts\utility::_id_383F( "barn_interrogation_start" );
    barn_price_open_door();
    price_enter_barn();
}

price_enter_barn()
{
    _id_A5A4::_id_30B0();
    make_ai_move();
    set_goalnode( _func_0C3( "price_barn_interior", "targetname" ) );
    self waittill( "goal" );
    make_ai_normal();
    _id_A5A4::_id_2A8D();
}

barn_price_move_to_door()
{
    var_0 = _func_0C3( "price_barn_rear", "targetname" );
    self _meth_81A7( 1 );
    var_0 _id_A510::_id_0BF4( self, "hunted_open_barndoor_stop" );
    self _meth_81A7( 0 );
}

barn_price_wait_at_door()
{
    var_0 = _func_0C3( "price_barn_rear", "targetname" );
    var_0 _id_A510::_id_0C24( self, "hunted_open_barndoor_stop" );
    thread barn_price_wait_at_door_idle();
}

barn_price_wait_at_door_idle()
{
    var_0 = _func_0C3( "price_barn_rear", "targetname" );
    var_0 thread _id_A510::_id_0BE1( self, "hunted_open_barndoor_idle", undefined, "stop_idle" );
    self waittill( "end_wait" );
    var_0 notify( "stop_idle" );
}

barn_price_open_door()
{
    self notify( "end_wait" );
    var_0 = _func_0C3( "price_barn_rear", "targetname" );

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
        var_1 = "hunted_open_barndoor";
    else
        var_1 = "hunted_open_barndoor_nodialogue";

    var_2 = getanimlength( level._id_78AC["price"][var_1] );
    var_0 thread _id_A510::_id_0C24( self, var_1 );
    var_3 = getent( "barn_rear_door", "targetname" );

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        var_3 _id_A5A4::_id_4B09( "door_wood_slow_creaky_open" );
    else
    {
        var_3 thread h1_play_door_sound( 0, "door_wood_slow_creaky_open" );
        var_0 thread _id_A510::_id_0C24( var_3, "open" );
        wait(var_2 - 0.5);
        var_3 h1_connectanimateddoorpaths();
    }

    common_scripts\utility::_id_383F( "barn_rear_open" );
    level thread barn_close_rear_door( var_3, var_3._id_6394 );
}

h1_play_door_sound( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    if ( isdefined( var_1 ) )
        self _meth_809C( var_1 );
    else
        self _meth_809C( "door_wood_slow_open" );
}

barn_close_rear_door( var_0, var_1 )
{
    common_scripts\utility::_id_384A( "field_cross" );
    var_0 _meth_82B1( var_1, 1 );
}

barn_mark_moveup()
{
    var_0 = _func_0C3( "mark_barn_rear", "targetname" );
    level.mark set_goalnode( var_0 );
    common_scripts\utility::_id_384A( "barn_rear_open" );
    var_0 = _func_0C3( "mark_barn_interior", "targetname" );
    set_goalnode( var_0 );

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
        common_scripts\utility::_id_384A( "interrogation_done" );

    level.mark barn_front_door();
    level.mark set_goalnode( _func_0C3( "mark_barn_exterior", "targetname" ) );
    common_scripts\utility::_id_383F( "barn_front_open" );
    level._id_6F7C _id_A5A4::_id_7E60( 0 );
}

barn_front_door()
{
    make_ai_move();
    _id_A5A4::_id_30B0();
    var_0 = getentarray( "barn_main_door", "targetname" );
    var_1 = getentarray( "barn_main_door_model", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            if ( var_1[var_2]._id_0398 == var_0[var_3]._id_0398 )
                var_1[var_2] _meth_804F( var_0[var_3] );
        }
    }

    var_4 = getent( "front_door_animent", "targetname" );
    var_4 _id_A510::_id_0BFF( self, "door_kick_in" );
    var_4 thread _id_A510::_id_0C24( self, "door_kick_in" );
    self waittillmatch( "single anim", "kick" );
    var_0[0] _meth_809C( "door_wood_double_kick" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_0[var_2] _meth_805A();

        if ( var_0[var_2]._id_0398 == "right" )
        {
            var_0[var_2] _meth_82B1( var_0[var_2].angles + ( 0, -160, 0 ), 0.6, 0, 0.1 );
            continue;
        }

        var_0[var_2] _meth_82B1( var_0[var_2].angles + ( 0, 175, 0 ), 0.75, 0, 0.1 );
    }

    make_ai_normal();
    _id_A5A4::_id_2A8D();
}

area_field_init()
{
    _id_A5A4::_id_1143( "field" );
    _id_A5A4::arcademode_checkpoint( 6, 1 );
    common_scripts\utility::_id_383F( "aa_field" );
    _id_A5E8::_id_870C( "aud_set_exterior_level_1" );
    var_0 = level._id_9C82["script_vehicle_bm21_mobile_cover"][0]._id_9CD6;
    var_1 = level._id_9C82["script_vehicle_bm21_mobile_cover"][1]._id_9CD6;
    level._id_9C82["script_vehicle_bm21_mobile_cover"][0]._id_9CD6 = 0;
    level._id_9C82["script_vehicle_bm21_mobile_cover"][1]._id_9CD6 = 0;
    wait 2;
    level thread field_dialgue();
    thread field_open();
    level thread set_playerspeed( 150, 3 );
    level.field_fence_origin = getent( "field_clip", "targetname" )._id_02E2;
    var_2 = common_scripts\utility::_id_0D05( level._id_8AB0, ::field_sort_squad );
    level.field_fence_origin = undefined;

    for ( var_3 = 0; var_3 < level._id_8AB0.size; var_3++ )
        var_2[var_3] thread field_allies( var_3 * 0.75 );

    level thread field_helicopter();
    level thread field_truck();
    level thread field_basement();
    common_scripts\utility::_id_384A( "field_moveon" );
    _id_A5A4::_id_070A( "field_defend_color_init" );
    level thread set_playerspeed( 190, 3 );
    common_scripts\utility::_id_3856( "field_basement", 7 );
    _id_A5A4::_id_1143( "field_basement" );
    common_scripts\utility::_id_384A( "basement_open" );
    level._id_9C82["script_vehicle_bm21_mobile_cover"][0]._id_9CD6 = var_0;
    level._id_9C82["script_vehicle_bm21_mobile_cover"][1]._id_9CD6 = var_1;
    common_scripts\utility::_id_3831( "aa_field" );
    level thread area_basement_init();
}

field_sort_squad()
{
    return _func_0F0( self._id_02E2, level.field_fence_origin );
}

field_dialgue()
{
    level.mark thread _id_A510::_id_0C21( level.mark, "areaclear" );
    level._id_6F7C _id_A5A4::_id_27EF( 1, _id_A5A4::_id_2A32, "keepmoving" );
    var_0 = common_scripts\utility::_id_40FB( "field_go_prone", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "hit_the_deck_music" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "hitdeck" );
    level._id_6F7C thread field_stay_down();
    common_scripts\utility::_id_3856( "field_spoted", 23 );
    common_scripts\utility::_id_383F( "field_moveon" );
    var_1 = _func_0D9( "allies" );

    if ( !common_scripts\utility::_id_382E( "field_spoted" ) )
    {
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "helismoving" );
        common_scripts\utility::_id_384A( "field_truck" );
        level.mark _id_A510::_id_0C21( level.mark, "contact6oclock" );
        wait 2;
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "returnfire2" );
    }
    else
    {
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "ontous" );
        common_scripts\utility::_id_384A( "field_defend" );
        wait 4.5;
        level.mark _id_A510::_id_0C21( level.mark, "contact6oclock" );
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "returnfire2" );
    }

    foreach ( var_3 in var_1 )
        var_3._id_01FB = 0;

    level notify( "kill_action_flag" );
    common_scripts\utility::_id_384A( "field_open_basement" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "basementdooropen2" );
    level.mark _id_A510::_id_0C21( level.mark, "imonit" );
    common_scripts\utility::_id_384A( "basement_open" );

    foreach ( var_6 in level._id_8AB0 )
    {
        if ( isdefined( var_6 ) )
            var_6._id_2AF7 = 1;
    }

    level.mark _id_A510::_id_0C21( level.mark, "doorsopen" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "getinhouse" );

    if ( !common_scripts\utility::_id_382E( "squad_in_basement" ) )
        level thread field_basement_nag();
}

field_stay_down()
{
    level endon( "field_spoted" );
    wait 2;
    level thread set_flag_on_player_action( "field_spoted", 1, 1, 0 );
    wait 3;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "staydown" );
}

field_basement_nag()
{
    for (;;)
    {
        wait 6;

        if ( common_scripts\utility::_id_382E( "squad_in_basement" ) )
            return;

        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "whatwaitingfor" );
        wait 4;

        if ( common_scripts\utility::_id_382E( "squad_in_basement" ) )
            return;

        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "getinbasement" );
        wait 6;

        if ( common_scripts\utility::_id_382E( "squad_in_basement" ) )
            return;

        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "getinhouse" );
        wait 4;
    }
}

field_open()
{
    common_scripts\utility::_id_383F( "field_open" );
    wait 3.5;
    var_0 = getent( "field_clip", "targetname" );
    var_0 delete();
}

field_allies( var_0 )
{
    var_1 = self._id_0C72;
    common_scripts\utility::_id_384A( "field_open" );
    wait(_func_0B5( 0.5, 1 ) + var_0);
    var_2 = _func_0C3( var_1 + "_field_path", "targetname" );
    set_goalnode( var_2 );
    common_scripts\utility::_id_384A( "field_cross" );
    wait(_func_0B3( 0.25 ));
    thread follow_path_hunted( var_2 );
    common_scripts\utility::_id_384A( "field_cover" );
    self notify( "stop_path" );
    wait(_func_0B3( 0.25 ));
    var_3 = self._id_5F65;
    self._id_5F65 = 1.15;
    var_2 = _func_0C3( var_1 + "_field_cover", "targetname" );
    field_prone_goal( var_2 );
    var_4 = get_prone_ent( var_2 );
    var_4 _id_A510::_id_0BFF( self, "hunted_dive_2_pronehide" );
    var_4 _id_A510::_id_0C24( self, "hunted_dive_2_pronehide" );
    var_4 thread _id_A510::_id_0BE1( self, "hunted_pronehide_idle", undefined, "stop_all_idle" );
    _id_A5A4::_id_7E38( "r" );
    common_scripts\utility::_id_384A( "field_moveon" );
    self._id_01FB = 1;
    self._id_5F65 = var_3;
    self._id_2AF3 = 0;
    var_4 notify( "stop_all_idle" );
    waitframe;
    var_4 _id_A510::_id_0C24( self, "hunted_pronehide_2_stand" );
}

get_prone_ent( var_0 )
{
    var_1 = getentarray( "prone_ent", "targetname" );
    var_2 = _func_114( var_0._id_02E2 - self._id_02E2 );
    var_3 = _func_115( var_2 )[1];
    var_1 = common_scripts\utility::_id_3CCB( self._id_02E2, var_1 );

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = var_1[var_4]._id_02E2 - self._id_02E2;
        var_6 = _func_115( var_5 )[1];
        var_7 = _func_0BE( var_3 - var_6 );

        if ( var_7 < 22.5 && !isdefined( var_1[var_4]._id_020D ) )
        {
            var_1[var_4]._id_020D = 1;
            return var_1[var_4];
        }
    }

    return var_0;
}

field_prone_goal( var_0 )
{
    set_goalnode( var_0 );
    self endon( "goal" );
    var_1 = common_scripts\utility::_id_40FB( "field_go_prone", "script_noteworthy" );
    var_1 waittill( "trigger" );
}

field_helicopter()
{
    common_scripts\utility::_id_384A( "field_cover" );
    _id_A5E8::_id_870C( "aud_heli_field_pass" );
    var_0 = _id_A5A8::_id_8978( "field_heli" );
    var_0 _meth_824F( 128, 10, 3 );
    var_0 _id_A5A8::show_rigs( 4 );
    var_0 _id_A5A8::show_rigs( 5 );
    level.helicopter = var_0;
    level.helicopter _id_A5A8::_id_4259();
    wait 0.1;
    common_scripts\utility::_id_0D13( var_0._id_750A, ::field_axis );
    var_0 thread heli_path_speed();
    var_0 helicopter_searchlight_on();
    var_0 thread field_helicopter_spot();
    common_scripts\utility::_id_3852( "field_spoted", "field_truck" );
    var_1 = common_scripts\utility::_id_40FB( "field_unload_node", "targetname" );
    var_0 thread heli_path_speed( var_1 );
    var_0 waittill( "unloading" );
    common_scripts\utility::_id_383F( "field_defend" );
}

field_helicopter_spot()
{
    level endon( "field_spoted" );

    for (;;)
    {
        wait 0.1;

        if ( _func_0EF( level._id_0318._id_02E2, self._id_0124._id_02E2 ) > 400 )
            continue;

        if ( level._id_0318 _meth_8180() != "prone" )
            break;
    }

    common_scripts\utility::_id_383F( "field_spoted" );
}

helicopter_setturrettargetent( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self.spotlight_default_target;

    self._id_2500 = var_0;
    self _meth_825E( var_0 );
}

helicopter_getturrettargetent()
{
    return self._id_2500;
}

setup_spot_target()
{
    var_0 = common_scripts\utility::_id_40FD( "spot_target", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::spot_target_node );
}

spot_target_node()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = common_scripts\utility::_id_3DC3();
        var_2 = getent( var_1[0], "script_linkname" );
        var_0 thread spot_target_path( var_2 );
    }
}

spot_target_path( var_0 )
{
    var_1 = 350;
    self notify( "spot_target_path" );
    self endon( "spot_target_path" );

    if ( !isdefined( self.spot_target_ent ) )
        self.spot_target_ent = spawn( "script_model", self.spotlight_default_target._id_02E2 );

    var_2 = self.spot_target_ent;
    helicopter_setturrettargetent( var_2 );
    self.spot_target_ent _meth_82AA( var_0._id_02E2, 0.5 );
    self.spot_target_ent waittill( "movedone" );
    var_3 = var_2._id_02E2;

    for (;;)
    {
        if ( isdefined( var_0._id_03E2 ) )
            var_1 = var_0._id_03E2;

        var_4 = _func_0EE( var_0._id_02E2, var_3 ) / var_1 + 0.1;

        if ( isdefined( var_0._id_0351 ) )
            var_2.spot_radius = var_0._id_0351;
        else
            var_2.spot_radius = undefined;

        var_2 _meth_82AA( var_0._id_02E2, var_4 );
        var_2 waittill( "movedone" );
        var_0 _id_A5A4::_id_0392();

        if ( isdefined( var_0._id_79DA ) )
            common_scripts\utility::_id_384A( var_0._id_79DA );

        if ( !isdefined( var_0._id_04A4 ) )
            break;

        var_3 = var_0._id_02E2;
        var_0 = getent( var_0._id_04A4, "targetname" );
    }

    helicopter_setturrettargetent( self.spotlight_default_target );
    self.spot_target_ent delete();
}

spot_target_path_end()
{
    self notify( "spot_target_path" );
    self endon( "spot_target_path" );

    while ( isdefined( self.spot_target_ent ) && _func_0EF( self.spot_target_ent._id_02E2, self.spotlight_default_target._id_02E2 ) > 100 )
    {
        self.spot_target_ent _meth_82AA( self.spotlight_default_target._id_02E2, 1 );
        self.spot_target_ent waittill( "movedone" );
    }

    helicopter_setturrettargetent( self.spotlight_default_target );

    if ( isdefined( self.spot_target_ent ) )
        self.spot_target_ent delete();
}

setup_tmp_detour_node()
{
    var_0 = common_scripts\utility::_id_40FD( "tmp_detour_node", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::tmp_detour_node );
}

tmp_detour_node()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = common_scripts\utility::_id_40FB( "tmp_detour_node2", "script_noteworthy" );
        var_0 thread heli_path_speed( var_1 );
    }
}

setup_helicopter_delete_node()
{
    var_0 = common_scripts\utility::_id_40FD( "delete_helicopter", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::helicopter_delete_node );
}

helicopter_delete_node()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 delete();
    }
}

field_flyby_speed()
{
    var_0 = level._id_0318._id_02E2;
    wait 2;
    var_1 = level._id_0318._id_02E2;
    var_2 = _func_0EE( var_0, var_1 );

    if ( var_2 < 250 )
        var_3 = 9;
    else
        var_3 = 7;

    var_2 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );
    var_4 = var_2 / var_3 / 17.6;
    var_5 = var_4 / 2;

    if ( var_5 < 30 )
        var_5 = 30;

    self _meth_827F( var_4, var_5 );
}

field_truck()
{
    common_scripts\utility::_id_384A( "field_moveon" );

    if ( common_scripts\utility::_id_382E( "field_spoted" ) )
        wait 3;

    _id_A5E8::_id_870C( "aud_barnyard_sequence" );
    var_0 = _id_A5A8::_id_8978( "field_truck" );
    thread _id_A5A8::_id_427A( var_0 );
    wait 0.1;
    common_scripts\utility::_id_0D13( var_0._id_750A, ::field_axis );
    var_0 turn_headlights_on( 0 );
    var_0 waittill( "unloading" );
    var_1 = _id_A5A4::_id_3CEE( var_0._id_02E2, "axis" );
    _id_A510::_id_0BC9( var_1, "bythehouse" );
    common_scripts\utility::_id_383F( "field_truck" );
}

field_axis()
{
    if ( !_func_0D1( self ) )
        return;

    self endon( "death" );
    self _meth_817B( "oblivious" );
    self waittill( "jumpedout" );
    self _meth_817B( "axis" );
    _id_A5A4::_id_1333( "allies" );
    _id_A5A4::_id_1333( "axis" );
    self waittill( "goal" );
    common_scripts\utility::_id_384A( "field_basement" );
    wait(_func_0B5( 4, 9 ) * 3);
    var_0 = _func_0C3( "field_attack_node", "targetname" );
    set_goalnode( var_0 );
    var_1 = getent( "basement_building", "targetname" );
    var_2 = getent( "field_basement", "targetname" );
    var_3 = getent( "stair_volume", "targetname" );
    common_scripts\utility::_id_384A( "basement_door_open" );

    while ( level._id_0318 _meth_80AB( var_1 ) || level._id_0318 _meth_80AB( var_2 ) || level._id_0318 _meth_80AB( var_3 ) )
        wait 0.5;

    self _meth_81AB( level._id_0318 );
    self._id_01E6 *= 2;
    self._id_1300 = 2;
    common_scripts\utility::_id_384A( "basement_door_open" );
    self _meth_816A();
    self._id_1300 = 1;
    self _meth_81A9( var_0 );
}

field_basement()
{
    if ( !common_scripts\utility::_id_382E( "field_spoted" ) )
    {
        common_scripts\utility::_id_384A( "field_defend" );
        wait 8;
    }
    else
    {
        common_scripts\utility::_id_384A( "field_truck" );
        wait 4;
    }

    common_scripts\utility::_id_383F( "field_open_basement" );
    wait 2;
    level.mark make_ai_move();
    _func_0D6( "ai_friendlyFireBlockDuration", 0 );
    var_0 = getentarray( "basement_animent", "targetname" )[0];
    var_0 _id_A510::anim_reach_and_arrive_facing_anim_solo( level.mark, "hunted_open_basement_door_kick", "exposed", 0.6 );
    var_0 thread _id_A510::_id_0C24( level.mark, "hunted_open_basement_door_kick" );
    getent( "basement_player_block", "targetname" ) _meth_82BB();
    common_scripts\utility::_id_383F( "basement_door_open" );
    level.mark make_ai_normal();
    level.mark _id_A5A4::_id_309A();
}

setup_basement_door()
{
    getent( "field_basement_door_open_clip", "targetname" ) _meth_82BB();
    var_0 = getent( "basement_door", "targetname" );
    var_0 thread field_basement_door();
    level thread door_pusher();
    var_0 = getent( "basement_inner_door", "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_0.handle = getent( "basement_door_handle", "targetname" );
    var_0.handle _meth_804F( var_0 );
    var_0._id_02E2 = var_1._id_02E2;
}

door_pusher()
{
    var_0 = getent( "door_pusher", "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_2 = getent( "basement_door_volume", "targetname" );
    var_0 _meth_82BB();
    common_scripts\utility::_id_384A( "basement_door_open" );
    wait 8.2;

    if ( !level._id_0318 _meth_80AB( var_2 ) )
        return;

    var_0 _meth_82BA();
    var_0 _meth_82AA( var_1._id_02E2, 1 );
    wait 2;
    var_0 delete();
}
#using_animtree("door");

field_basement_door()
{
    var_0 = getent( "basement_animent", "targetname" );
    var_1 = _func_06F( var_0._id_02E2, var_0.angles, %hunted_open_basement_door_kick_door );
    var_2 = _func_070( var_0._id_02E2, var_0.angles, %hunted_open_basement_door_kick_door );
    self.angles = var_2;
    self._id_02E2 = var_1;
    self _meth_8117( #animtree );
    self._id_0C72 = "door";
    level._id_78AC["door"]["door_kick_door"] = %hunted_open_basement_door_kick_door;
    var_0 _id_A510::_id_0BC7( self, "door_kick_door" );
    common_scripts\utility::_id_384A( "basement_door_open" );
    thread field_basement_door_sound();
    self _meth_8113( "door_anim", %hunted_open_basement_door_kick_door );
    var_3 = getanimlength( %hunted_open_basement_door_kick_door );
    wait(var_3 - 1);
    var_4 = getent( self._id_04A4, "targetname" );
    var_4 _meth_805A();
    var_4 delete();
    common_scripts\utility::_id_383F( "basement_open" );
    var_5 = getent( "basement_door_volume", "targetname" );

    while ( level._id_0318 _meth_80AB( var_5 ) )
        wait 0.1;

    getent( "field_basement_door_open_clip", "targetname" ) _meth_82BA();
}

field_basement_door_sound()
{
    level.mark waittillmatch( "single anim", "kick" );
    self _meth_809C( "scn_hunted_cellar_door_open" );
}

area_basement_init()
{
    common_scripts\utility::_id_383F( "aa_basement" );
    level._id_6F7C thread basement_price();
    level thread basement_allies();
    level thread basement_helicopter();
    level thread basement_trim_field();
    level thread basement_flash();
    common_scripts\utility::_id_384A( "basement_secure" );
    _id_A5A4::_id_1143( "basement" );
    _id_A5A4::_id_1332( "allies" );
    common_scripts\utility::_id_384A( "farm_start" );
    common_scripts\utility::_id_3831( "aa_basement" );
    level thread area_farm_init();
}

basement_allies()
{
    var_0 = getent( "basement_building", "targetname" );
    var_1 = getent( "stair_volume", "targetname" );
    common_scripts\utility::_id_0D13( level._id_8AB0, ::make_ai_move );
    common_scripts\utility::_id_0D13( level._id_8AB0, ::set_grenadeawareness, 0 );
    _id_A5A4::_id_070A( "basement_color_init" );
    var_2 = common_scripts\utility::_id_0CF6( level._id_8AB0, level._id_6F7C );
    var_2 = common_scripts\utility::_id_0CDA( var_2, level._id_0318 );
    var_3 = 0;
    var_4 = 0;

    while ( !var_4 )
    {
        var_3++;

        if ( var_3 > 240.0 && !level._id_0318 _meth_80AB( var_0 ) && !level._id_0318 _meth_80AB( var_1 ) )
            level._id_0318 magic_kill();

        var_4 = 1;

        for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        {
            if ( !var_2[var_5] _meth_80AB( var_0 ) )
                var_4 = 0;
        }

        wait 0.05;
    }

    if ( common_scripts\utility::_id_382E( "heli_field_stragler_attack" ) )
    {
        var_6 = common_scripts\utility::_id_40FB( "heli_basement_restart_path", "targetname" );
        level.helicopter thread deactivate_heli_guy();
        level.helicopter thread heli_path_speed( var_6 );
    }

    common_scripts\utility::_id_383F( "squad_in_basement" );
    common_scripts\utility::_id_384A( "basement_secure" );
    common_scripts\utility::_id_0D13( level._id_8AB0, ::make_ai_normal );
    common_scripts\utility::_id_0D13( level._id_8AB0, ::set_grenadeawareness );
    common_scripts\utility::_id_0D13( level._id_8AB0, ::make_walk );
    common_scripts\utility::_id_384A( "farm_start" );
    level notify( "stop_walk" );
}

basement_price()
{
    _id_A5A4::_id_2A74();
    var_0 = self._id_01D1;
    self._id_01D1 = 0;
    set_goalnode( _func_0C3( "basement_enter_price", "targetname" ) );
    common_scripts\utility::_id_384A( "squad_in_basement" );

    foreach ( var_2 in level._id_8AB0 )
    {
        if ( isdefined( var_2 ) )
            var_2._id_2AF7 = 0;
    }

    var_4 = getent( "basement_player_block", "targetname" );
    var_4 _meth_82BA();
    var_5 = getentarray( "basement_animent", "targetname" )[0];
    var_5 _id_A510::_id_0BFF( self, "hunted_basement_door_block" );
    var_5 thread _id_A510::_id_0C24( self, "hunted_basement_door_block" );
    var_6 = getent( "basement_inner_door", "targetname" );
    thread basement_door_sound( var_6 );
    wait 1;
    var_6 _meth_82BB();
    var_6 _meth_82B3( -180, 1.5, 0.25, 0 );
    var_6 waittill( "rotatedone" );
    var_6 _meth_82BA();
    var_6 _meth_8059();
    wait 0.5;
    var_6.handle _meth_8051();
    var_6.handle _meth_82B2( 130, 0.35 );
    _id_A5A4::_id_7E38( "y" );
    common_scripts\utility::_id_383F( "basement_secure" );
    var_4 delete();
    wait 1;
    thread _id_A510::_id_0C21( self, "takepoint" );
    self._id_01D1 = var_0;
    common_scripts\utility::_id_384A( "farm_start" );
}

basement_door_sound( var_0 )
{
    self waittillmatch( "single anim", "scn_hunted_metal_door_closed" );
    var_0 _meth_809C( "scn_hunted_metal_door_closed" );
}

basement_helicopter()
{
    var_0 = level.helicopter;
    common_scripts\utility::_id_384A( "basement_door_open" );
    var_1 = common_scripts\utility::_id_40FB( "heli_basement_path", "targetname" );
    var_0 thread heli_path_speed( var_1 );
    var_0 deactivate_heli_guy();
}

basement_trim_field()
{
    common_scripts\utility::_id_384A( "trim_field" );
    var_0 = _func_0D9( "axis" );
    var_0 = _id_A5A4::_id_0CE7( var_0, _id_A5A4::_id_3CB4( "basement_field_guy" ) );

    if ( var_0.size < 4 )
        _id_A5A4::_id_070A( "field_clear_killspawner" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] delete();

    while ( !common_scripts\utility::_id_382E( "basement_flash" ) && _id_A5A4::_id_3CB5( "basement_field_guy" ) > 3 )
        wait 0.05;

    var_0 = _id_A5A4::_id_3CB4( "basement_field_guy" );
    var_2 = _func_0C3( "field_retreat_node", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::set_goalnode, var_2 );
    common_scripts\utility::_id_0D13( var_0, ::_id_2827 );
}

basement_flash()
{
    common_scripts\utility::_id_384A( "basement_flash" );
    scripted_array_spawn( "basement_flash_guy", "targetname", 1 );
    wait 2;
    var_0 = _func_0D9( "axis" );
    common_scripts\utility::_id_0D13( var_0, ::flash_immunity, 2 );

    if ( isdefined( var_0[0] ) )
    {
        var_1 = var_0[0];
        var_2 = var_1._id_01D6;
        var_1._id_01D6 = "flash_grenade";
        var_1._id_01D0++;
        var_3 = getent( "enemy_flash_bang", "targetname" );
        var_4 = getent( var_3._id_04A4, "targetname" );
        var_1 _meth_8039( var_3._id_02E2, var_4._id_02E2, 1 );
        var_1._id_01D6 = var_2;
    }

    level.mark thread _id_A510::_id_0C21( level.mark, "warn_flashbang" );

    while ( !common_scripts\utility::_id_382E( "farm_start" ) && _id_A5A4::_id_3CB5( "basement_flash_guy" ) )
        wait 0.05;

    common_scripts\utility::_id_383F( "farm_start" );
    var_0 = _id_A5A4::_id_3CB4( "basement_flash_guy" );

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
        var_0[var_5] _meth_81AB( level._id_0318 );
}

area_farm_init()
{
    common_scripts\utility::_id_383F( "aa_farm" );
    _id_A5A4::arcademode_checkpoint( 6, 2 );
    _func_0D6( "ai_friendlyFireBlockDuration", level.ai_friendlyfireblockduration );
    common_scripts\utility::_id_0D13( getentarray( "farm_dog", "script_noteworthy" ), _id_A5A4::_id_0798, ::farm_dog_spawn_function );
    common_scripts\utility::_id_0D13( getentarray( "farm_forerunners", "script_noteworthy" ), _id_A5A4::_id_0798, ::farm_forerunners );
    common_scripts\utility::_id_0D13( getentarray( "farm_defenders", "script_noteworthy" ), _id_A5A4::_id_0798, ::farm_defenders );
    level thread farm_enemies_timer();
    level thread farm_dialogue();
    level thread farm_push();
    level._id_0318._id_5A38 = 3;
    level._id_6F7C _id_A5A4::_id_7E38( "y" );
    level.mark _id_A5A4::_id_7E38( "y" );
    level.steve _id_A5A4::_id_7E38( "r" );
    level.charlie _id_A5A4::_id_7E38( "r" );
    level._id_6F7C._id_020C = 120;
    level.mark._id_020C = 120;
    level.steve._id_020C = 120;
    level.charlie._id_020C = 120;
    wait 1;
    _id_A5A4::_id_070A( "farm_color_init" );
    common_scripts\utility::_id_384A( "farm_alert" );
    _id_A5A4::_id_1333( "allies" );
    _id_A5A4::_id_1333( "axis" );
    _id_A5A4::_id_1143( "dogs" );
    var_0 = getent( "cistern_color_trigger", "script_noteworthy" );

    if ( isdefined( var_0 ) )
        var_0 common_scripts\utility::_id_97CC();

    _id_A5A4::_id_070A( "farm_advance_color_init" );
    level thread farm_clear_enemies();
    _id_A5A4::_id_A066( "farm_forerunners" );
    _id_A5A4::_id_A066( "farm_defenders" );
    common_scripts\utility::_id_383F( "farm_clear" );
    var_1 = getentarray( "farm_color_trigger", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_1, common_scripts\utility::_id_97CC );
    _id_A5A4::_id_070A( "farm_cleared_color_init" );
    common_scripts\utility::_id_3831( "aa_farm" );
    level thread area_creek_init();
}

farm_push()
{
    level endon( "farm_clear" );
    var_0 = 100;

    while ( var_0 > 4 )
    {
        var_0 = _id_A5A4::_id_3CB5( "farm_forerunners" );
        var_0 += _id_A5A4::_id_3CB5( "farm_defenders" );
        wait 1;
    }

    _id_A5A4::_id_070A( "farm_push_color_init" );
}

dynamic_dog_threat()
{
    for (;;)
    {
        setthreatbias( "dogs", "allies", -4000 );
        level._id_0318 waittill( "dog_attacks_player" );
        setthreatbias( "dogs", "allies", 0 );
        level._id_0318 waittill( "player_saved_from_dog" );
    }
}

farm_enemies_timer()
{
    var_0 = getent( "farm_enemies", "script_noteworthy" );
    var_0 endon( "trgger" );
    common_scripts\utility::_id_384A( "farm_enemies_timer" );
    wait(_func_0B5( 13, 17 ));
    _id_A5A4::_id_0709( "farm_enemies" );
    _id_A5A4::_id_0709( "farm_enemy_dogs" );
}

farm_dialogue()
{
    var_0 = getent( "quiet_dialogue", "targetname" );
    var_0 waittill( "trigger" );
    level.charlie _id_A510::_id_0C21( level.charlie, "tooquiet" );
    level.mark _id_A510::_id_0C21( level.mark, "regrouping" );
    wait 2;
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "staysharp" );
    _id_A5A4::_id_1143( "farm" );
}

farm_forerunners()
{
    self endon( "death" );

    if ( _func_0B2( 100 ) > 60 )
        self._id_01D6 = "flash_grenade";

    while ( 3 < _id_A5A4::_id_3CB5( "farm_forerunners" ) )
        wait 0.1;

    _id_7E51( "farm_volume" );
    common_scripts\utility::_id_383F( "farm_alert" );
}

farm_defenders()
{
    self endon( "death" );

    if ( _func_0B2( 100 ) > 60 )
        self._id_01D6 = "flash_grenade";

    while ( 4 < _id_A5A4::_id_3CB5( "farm_defenders" ) )
        wait 0.1;

    _id_7E51( "farm_volume" );
}

farm_dog_spawn_function()
{
    self endon( "death" );

    if ( !isdefined( level.farm_dogs ) )
    {
        level.farm_dogs = [];
        level thread farm_dogs_delete();
    }

    level.farm_dogs[level.farm_dogs.size] = self;

    if ( level.farm_dogs.size == 3 )
        level notify( "dogs_loaded" );

    if ( isdefined( self._id_04A4 ) )
        self waittill( "goal" );

    self _meth_81AB( level._id_0318 );
    self._id_01C4 = 300;
}

farm_dogs_delete()
{
    level waittill( "dogs_loaded" );
    level.farm_dogs = common_scripts\utility::_id_0CF5( level.farm_dogs );

    switch ( level._id_3BFE )
    {
        case 0:
            var_0 = 2;
            break;
        case 1:
            var_0 = 2;
            break;
        default:
            var_0 = 3;
            break;
    }

    for ( var_1 = 0; var_1 < level.farm_dogs.size; var_1++ )
    {
        if ( var_1 < var_0 )
            continue;

        level.farm_dogs[var_1] delete();
    }
}

farm_clear_enemies()
{
    var_0 = getent( "farm_clear_enemies", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = _id_A5A4::_id_3CB4( "farm_forerunners" );
    var_2 = _id_A5A4::_id_3CB4( "farm_defenders" );
    var_3 = common_scripts\utility::_id_0CDD( var_1, var_2 );
    var_4 = getent( "farm_volume", "targetname" );

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( var_3[var_5] _meth_80AB( var_4 ) )
            continue;

        var_3[var_5] _meth_81AB( level._id_0318 );
        var_3[var_5]._id_01C4 = 450;
    }
}

area_creek_init()
{
    _id_A5A4::_id_1143( "creek" );
    common_scripts\utility::_id_383F( "aa_creek" );
    _id_A5A4::arcademode_checkpoint( 5, 3 );
    var_0 = getent( "creek_gate", "targetname" );
    var_1 = getent( "gate_model", "targetname" );
    var_2 = getent( "creek_gate_animent", "targetname" );
    var_0._id_6394 = var_0.angles;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
        var_1 _meth_804F( var_0 );
    else
    {
        var_0 _meth_804F( var_1, "door_open_jnt" );
        var_1 _id_A5A4::_id_0D61( "creekgate" );
        var_2 _id_A510::_id_0BC7( var_1, "open" );
    }

    _id_A5A4::_id_1332( "allies" );
    _id_A5A4::_id_1332( "axis" );
    common_scripts\utility::_id_3831( "player_interruption" );
    var_3 = getentarray( "creek_bridge_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, ::creek_bridge_guy );
    common_scripts\utility::_id_0D13( _func_0C4( "patroll_animation", "script_noteworthy" ), ::creek_guard_node );
    common_scripts\utility::_id_384A( "creek_helicopter" );
    level thread set_playerspeed( 130, 6 );
    level._id_0318 thread player_sprint_check();
    level thread creek_axis_dialogue();
    level thread creek_dialogue();
    level thread creek_truck();
    level thread creek_helicopter();
    level thread creek_gate();
    level thread creek_cqb_setup();
    common_scripts\utility::_id_384A( "creek_truck_on_bridge" );
    level thread set_flag_on_player_action( "player_interruption", 1, 1, 0 );
    common_scripts\utility::_id_3852( "road_start", "player_interruption" );
    common_scripts\utility::_id_3831( "aa_creek" );
    level thread area_road_init();
}

creek_gate()
{
    wait 6;
    var_0 = getent( "creek_gate", "targetname" );
    var_1 = getent( "gate_model", "targetname" );
    var_2 = getent( "creek_gate_animent", "targetname" );
    level._id_6F7C _id_A5A4::_id_2A74();
    _id_A5A4::_id_070A( "creek_gate_color_init" );
    level._id_6F7C._id_03A8 = var_2;
    level._id_6F7C._id_03A8._id_04D9 = "Cover Right";
    var_2 _id_A510::_id_0BF5( level._id_6F7C, "hunted_open_creek_gate" );
    level._id_6F7C._id_03A8 = undefined;

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        var_2 thread _id_A510::_id_0C24( level._id_6F7C, "hunted_open_creek_gate" );
        level._id_6F7C _id_A5A4::_id_30B0();
        common_scripts\utility::_id_383F( "creek_gate_open" );
        var_0 _id_A5A4::_id_4B09( "door_gate_chainlink_slow_open" );
        level._id_6F7C _id_A5A4::_id_7E38( "y" );
        level._id_6F7C waittill( "done_setting_new_color" );
        _id_A5A4::_id_070A( "creek_color_init" );
    }
    else
    {
        var_0 thread h1_play_door_sound( 0, "door_gate_chainlink_slow_open" );
        wait 0.25;
        var_2 thread _id_A510::_id_0C24( level._id_6F7C, "hunted_open_creek_gate" );
        level._id_6F7C _id_A5A4::_id_30B0();
        common_scripts\utility::_id_383F( "creek_gate_open" );
        level._id_6F7C _id_A5A4::_id_7E38( "y" );
        _id_A5A4::_id_070A( "creek_color_init" );
        var_2 _id_A510::_id_0C24( var_1, "open" );
        var_0 _meth_805A();
    }

    common_scripts\utility::_id_384A( "creek_bridge" );
    var_1 _meth_82B1( var_0._id_6394, 0.1 );
    var_1 waittill( "rotatedone" );
}

h1_connectanimateddoorpaths()
{
    foreach ( var_1 in level.animated_door_clip_brushes )
    {
        if ( var_1["door"] == self )
            var_1["clip"] _meth_805A();
    }
}

creek_dialogue()
{
    wait 6;
    level.mark _id_A510::_id_0C21( level.mark, "helicoptersback" );
    wait 3;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "keepitthatway" );
    common_scripts\utility::_id_384A( "creek_gate_open" );
    wait 0.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "presson" );
    level endon( "player_interruption" );
    var_0 = common_scripts\utility::_id_40FB( "creek_heli_warning", "script_noteworthy" );
    var_0 waittill( "trigger" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "sentriesatbridge" );
}

creek_truck()
{
    common_scripts\utility::_id_384A( "creek_start" );
    var_0 = _id_A5A8::_id_8978( "creek_truck" );
    thread _id_A5A8::_id_427A( var_0 );
    var_0 turn_headlights_on( 0 );
    var_0 _id_A5A8::_id_4259();
    var_0 waittill( "unloading" );
    common_scripts\utility::_id_383F( "creek_truck_on_bridge" );
}

creek_helicopter()
{
    wait 3;
    var_0 = _id_A5A8::_id_8978( "creek_heli" );
    var_0 _meth_824F( 128, 35, 25 );
    wait 0.1;

    for ( var_1 = 0; var_1 < var_0._id_750A.size; var_1++ )
        var_0._id_750A[var_1] _meth_817B( "oblivious" );

    level.helicopter = var_0;
    level.helicopter _id_A5A8::_id_4259();
    var_0 thread heli_path_speed();
    var_0 helicopter_searchlight_on();
    common_scripts\utility::_id_384A( "creek_bridge" );
    var_2 = common_scripts\utility::_id_40FB( "creek_flyover_struct", "targetname" );
    var_0 thread heli_path_speed( var_2 );
}

creek_bridge_guy()
{
    self endon( "death" );
    self notify( "stop_going_to_node" );
    self _meth_817B( "oblivious" );
    thread _id_A5A4::_id_58D7();
    self._id_0C72 = "axis";
    self._id_2AF3 = 1;
    _id_A5A4::_id_7EAB( "patrolwalk_" + ( _func_0B2( 5 ) + 1 ) );
    self._id_0B0D = 1;
    self waittill( "jumpedout" );
    var_0 = _func_0C3( self._id_04A4, "targetname" );
    thread follow_path_hunted( var_0, 1 );
    wait 2;
    attach_flashlight( 1 );
    thread road_axis_interrupt();
    wait 5;
    _id_A5A4::_id_8EA4();
    level endon( "player_interruption" );
    common_scripts\utility::_id_384A( "road_field_end" );
    wait(_func_0B5( 5, 10 ));
    self notify( "stop_interrupt" );
    var_1 = _func_0C3( "road_delete_node", "targetname" );
    set_goalnode( var_1 );
    thread _id_2827();
}

creek_axis_dialogue()
{
    level endon( "road_field_clear" );
    common_scripts\utility::_id_384A( "player_interruption" );
    var_0 = _id_A5A4::_id_3CEE( level._id_0318._id_02E2, "axis" );

    if ( !common_scripts\utility::_id_382E( "road_field_search" ) )
    {
        _id_A510::_id_0BC9( var_0, "hunted_ru2_bythecreek" );
        wait(_func_0B3( 3 ) + 2);
    }

    var_0 = _id_A5A4::_id_3CEE( level._id_0318._id_02E2, "axis" );
    _id_A510::_id_0BC9( var_0, "hunted_ru1_inthefield" );
    wait(_func_0B3( 3 ) + 2);
    var_0 = _id_A5A4::_id_3CEE( level._id_0318._id_02E2, "axis" );
    _id_A510::_id_0BC9( var_0, "hunted_ru4_outonfield" );
}

creek_guard_node()
{
    level endon( "player_interruption" );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread interrupt_guard_node( var_0 );
        _id_A510::_id_0C24( var_0, self._id_793C );
        self notify( "guard_anim_done" );
    }
}

interrupt_guard_node( var_0 )
{
    var_0 endon( "death" );
    self endon( "guard_anim_done" );
    level waittill( "player_interruption" );
    var_0 _meth_8143();
    var_0 notify( "single anim", "end" );
}

creek_cqb_setup()
{
    common_scripts\utility::_id_0D13( getentarray( "creek_cqb_start", "targetname" ), ::creek_cqb_start );
    common_scripts\utility::_id_0D13( getentarray( "creek_cqb_end", "targetname" ), ::creek_cqb_start );
}

creek_cqb_start()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread _id_A5A4::_id_4BAC( 1 );
        var_0 _id_A5A4::_id_30B0();
    }
}

creek_cqb_end()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 thread _id_A5A4::_id_4BAC( 1 );
        var_0 _id_A5A4::_id_2A8D();
    }
}

area_road_init()
{
    common_scripts\utility::_id_383F( "aa_second_field" );
    level thread road_allies();
    level thread road_axis();
    level thread road_helicopter();
    level thread road_reset_speed();
    level thread road_field_cleanup();
    level thread road_field_clear();

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
    {
        _id_A5A4::_id_1143( "road" );
        level thread road_field();
        level thread road_roadblock();
    }
    else
    {
        _id_A5A4::_id_1333( "allies" );
        _id_A5A4::_id_1333( "axis" );
        common_scripts\utility::_id_384A( "road_start" );
        common_scripts\utility::_id_383F( "road_open_field" );
    }

    common_scripts\utility::_id_384A( "greenhouse_area" );

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
        common_scripts\utility::_id_383F( "player_interruption" );

    common_scripts\utility::_id_384A( "road_field_clear" );
    common_scripts\utility::_id_3831( "aa_second_field" );
    level thread area_greenhouse_init();
}

road_field_clear()
{
    while ( _id_A5A4::_id_3CB5( "road_group" ) > 3 )
        wait 0.1;

    common_scripts\utility::_id_383F( "road_field_clear_helicopter" );
    wait 0.5;
    _id_A5A4::_id_A066( "road_group" );
    common_scripts\utility::_id_383F( "road_field_clear" );
}

road_field_cleanup()
{
    common_scripts\utility::_id_384A( "road_field_cleanup" );
    var_0 = _func_0C3( "road_field_cleanup_node", "targetname" );
    var_1 = _id_A5A4::_id_3CB4( "road_group" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_2A74 );
    common_scripts\utility::_id_0D13( var_1, ::set_goalnode, var_0 );
    common_scripts\utility::_id_0D13( var_1, ::_id_2827 );
    common_scripts\utility::_id_383F( "road_field_clear_helicopter" );
    wait 0.5;
    common_scripts\utility::_id_383F( "road_field_clear" );
}

road_reset_speed()
{
    common_scripts\utility::_id_384A( "player_interruption" );
    level thread set_playerspeed( 190, 6 );
}

road_helicopter()
{
    level thread road_helicopter_clear();
    common_scripts\utility::_id_384A( "player_interruption" );
    wait 2;
    level.helicopter notify( "stop_path" );
    setthreatbias( "player", "heli_guy", 10000 );
    setthreatbias( "heli_guy", "player", 20000 );

    if ( level._id_3BFE > 1 && !common_scripts\utility::_id_382E( "road_field_clear_helicopter" ) )
    {
        level.heli_guy_accuracy = 2;
        level.heli_guy_health_multiplier = 1;
        level.heli_guy_respawn_delay = 10;
        level.helicopter thread activate_heli_guy();
    }
    else
    {
        level.heli_guy_accuracy = 2;
        level.heli_guy_health_multiplier = 0.8;
        level.heli_guy_respawn_delay = 10;
    }

    level.helicopter heli_path_speed( common_scripts\utility::_id_40FB( "road_heli_start", "targetname" ) );

    if ( !common_scripts\utility::_id_382E( "road_field_clear_helicopter" ) )
    {
        level.helicopter thread helicopter_attack( 15, "attack_helicopter" );
        wait 4;
    }

    if ( level._id_3BFE < 2 && !common_scripts\utility::_id_382E( "road_field_clear_helicopter" ) )
        level.helicopter thread activate_heli_guy();

    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "watchhelicopter" );
}

road_helicopter_clear()
{
    common_scripts\utility::_id_384A( "road_field_clear_helicopter" );
    level.helicopter stop_helicopter_attack();
    level.helicopter deactivate_heli_guy();
    level.helicopter spot_target_path_end();
    level.helicopter thread heli_path_speed( common_scripts\utility::_id_40FB( "greenhouse_startpath", "targetname" ) );
    common_scripts\utility::_id_383F( "road_helicopter_cleared" );
}

road_field()
{
    common_scripts\utility::_id_3856( "player_interruption", 8 );
    common_scripts\utility::_id_383F( "road_open_field" );
}

road_allies()
{
    level endon( "road_field_cleanup" );
    common_scripts\utility::_id_384A( "road_open_field" );

    for ( var_0 = 0; var_0 < level._id_8AB0.size; var_0++ )
        level._id_8AB0[var_0] _meth_81A7( 1 );

    road_bridge_wait();
    common_scripts\utility::_id_383F( "roadblock" );
    wait 2;

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
    {
        level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "staylow" );
        level thread road_allies_exposed();
    }
    else
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "moveit" );

    _id_A5A4::_id_070A( "road_color_stage_1" );
    wait 1;
    level._id_6F7C waittill( "goal" );
    wait 6;
    _id_A5A4::_id_070A( "road_color_stage_2" );
    wait 1;
    level._id_6F7C waittill( "goal" );
    wait 6;
    _id_A5A4::_id_070A( "road_color_stage_3" );
    wait 1;
    level.steve waittill( "goal" );
    common_scripts\utility::_id_384A( "road_field_search" );
    wait 4;
    _id_A5A4::_id_070A( "road_color_stage_4" );
    wait 1;
    level._id_6F7C waittill( "goal" );
    wait 2;
    _id_A5A4::_id_070A( "road_color_stage_5" );
    common_scripts\utility::_id_383F( "road_field_end" );
    level._id_6F7C waittill( "goal" );
    common_scripts\utility::_id_384A( "player_interruption" );

    while ( _id_A5A4::_id_3CB5( "road_group" ) > 4 )
        wait 0.05;

    _id_A5A4::_id_070A( "road_color_stage_6" );

    for ( var_0 = 0; var_0 < level._id_8AB0.size; var_0++ )
        level._id_8AB0[var_0] _meth_81A7( 0 );
}

road_allies_exposed()
{
    common_scripts\utility::_id_384A( "player_interruption" );
    _id_A5A4::_id_1333( "axis" );
    wait 2;
    level.mark _id_A510::_id_0C21( level.mark, "hunted_uk2_werecompromised" );

    if ( !common_scripts\utility::_id_382E( "road_field_end" ) )
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "endoffield" );

    _id_A5A4::_id_1333( "allies" );
}

road_bridge_wait()
{
    level endon( "player_interruption" );
    level endon( "roadblock" );

    if ( common_scripts\utility::_id_382E( "player_interruption" ) )
        return;

    var_0 = getent( "bridge_volume", "targetname" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "outofspotlight" );
    wait 2;
}

road_axis()
{
    common_scripts\utility::_id_384A( "roadblock" );

    if ( !common_scripts\utility::_id_382E( "player_interruption" ) )
    {
        common_scripts\utility::_id_0D13( getentarray( "road_idle_guy", "targetname" ), _id_A5A4::_id_0798, ::road_idle_guy );
        common_scripts\utility::_id_0D13( getentarray( "road_guy", "targetname" ), _id_A5A4::_id_0798, ::road_guy );
        var_0 = scripted_array_spawn( "road_idle_guy", "targetname", 1 );
        var_0 = scripted_array_spawn( "road_guy", "targetname", 1 );
    }
    else
    {
        common_scripts\utility::_id_0D13( getentarray( "road_idle_guy", "targetname" ), _id_A5A4::_id_0798, ::road_guy_attack );
        common_scripts\utility::_id_0D13( getentarray( "road_guy", "targetname" ), _id_A5A4::_id_0798, ::road_guy_attack );
        var_0 = scripted_array_spawn( "road_guy", "targetname", 1 );
        wait 10;
        var_0 = scripted_array_spawn( "road_idle_guy", "targetname", 1 );
    }
}

road_guy_attack()
{
    self notify( "stop_going_to_node" );
    _id_A5A4::_id_7E38( "p" );
}

road_guy()
{
    self endon( "death" );
    level endon( "player_interruption" );
    self _meth_817B( "oblivious" );
    self._id_2AF3 = 1;
    self._id_0B0D = 1;
    self._id_0C72 = "axis";
    _id_A5A4::_id_7EAB( "patrolwalk_" + ( _func_0B2( 5 ) + 1 ) );
    attach_flashlight( 1 );
    thread road_axis_interrupt();
    self notify( "stop_going_to_node" );
    var_0 = _func_0C3( self._id_04A4, "targetname" );
    thread follow_path_hunted( var_0, 1 );
    self waittill( "path_end_reached" );
    common_scripts\utility::_id_383F( "player_interruption" );
}

road_idle_guy()
{
    self endon( "death" );
    level endon( "player_interruption" );
    self _meth_817B( "oblivious" );
    self._id_2AF3 = 1;
    self._id_0C72 = "axis";
    _id_A5A4::_id_7EAB( "patrolwalk_nolight" );
    thread road_axis_interrupt();
    self._id_0B0D = 1;
    common_scripts\utility::_id_384A( "road_field_search" );
    wait(_func_0B3( 20 ));
    self notify( "stop_interrupt" );
    var_0 = _func_0C3( "road_field_cleanup_node", "targetname" );
    set_goalnode( var_0 );
    thread _id_2827();
}

road_roadblock()
{
    level endon( "player_interruption" );
    common_scripts\utility::_id_384A( "roadblock" );
    var_0 = scripted_array_spawn( "roadblock_guy", "script_noteworthy", 1 );
    level thread road_roadblock_anim( var_0 );
    var_1 = _func_1EC( "roadblock_start", "script_noteworthy" );
    var_2 = _func_1EC( "roadblock_stop", "script_noteworthy" );
    var_3 = _id_A5A8::_id_8978( "road_pickup" );
    thread _id_A5A8::_id_427A( var_3 );
    var_1 waittill( "trigger" );
    common_scripts\utility::_id_383F( "roadblock_start" );
    var_2 waittill( "trigger" );
    var_3 _meth_827F( 0, 15 );
    common_scripts\utility::_id_384A( "roadblock_done" );
    var_3 _meth_828D( 35 );
}

road_roadblock_anim( var_0 )
{
    level endon( "player_interruption" );
    var_1 = _func_0C4( "roadblock_path", "targetname" );
    var_0[0] thread road_roadblock_guy( "guard1", var_1[1] );
    var_0[1] thread road_roadblock_guy( "guard2", var_1[0] );
    var_2 = getent( "roadblock_animent", "targetname" );
    level thread road_roadblock_interrupt( var_0, var_2 );
    var_2 _id_A510::_id_0BF2( var_0, "roadblock_sequence" );

    if ( !common_scripts\utility::_id_382E( "roadblock_start" ) && !common_scripts\utility::_id_382E( "player_interruption" ) )
        var_2 _id_A510::_id_0BDD( var_0, "roadblock_startidle", "stop_idle" );

    common_scripts\utility::_id_384A( "roadblock_start" );
    var_2 notify( "stop_idle" );
    var_2 _id_A510::_id_0C18( var_0, "roadblock_sequence" );
    common_scripts\utility::_id_383F( "roadblock_done" );
}

road_roadblock_interrupt( var_0, var_1 )
{
    common_scripts\utility::_id_384A( "player_interruption" );
    var_1 notify( "stop_idle" );

    if ( !common_scripts\utility::_id_382E( "roadblock_start" ) )
        return;

    var_0[0] _meth_8143();
    var_0[0] notify( "single anim", "end" );
    var_0[1] _meth_8143();
    var_0[1] notify( "single anim", "end" );
    common_scripts\utility::_id_383F( "roadblock_done" );
}

road_roadblock_guy( var_0, var_1 )
{
    self endon( "death" );
    level endon( "player_interruption" );
    self._id_0C72 = var_0;
    self._id_2AF3 = 1;
    _id_A5A4::_id_7EAB( "patrolwalk" );
    self _meth_817B( "oblivious" );
    attach_flashlight( 1 );
    thread road_axis_interrupt();
    common_scripts\utility::_id_384A( "roadblock_done" );
    self._id_2AF3 = 1;
    self._id_0C72 = "axis";
    thread follow_path_hunted( var_1, 1 );
}

road_axis_interrupt()
{
    self endon( "death" );
    self endon( "stop_interrupt" );
    thread road_axis_proximity();
    common_scripts\utility::_id_384A( "player_interruption" );

    if ( !self._id_8A97 )
        wait(_func_0B3( 2 ) + 0.5);

    self notify( "stop_path" );
    flashlight_light( 0 );
    self._id_2AF3 = 0;
    _id_A5A4::_id_1ED1();
    self._id_0B0D = undefined;
    self _meth_817B( "axis" );
    _id_A5A4::_id_7E38( "p" );
    detach_flashlight();
}

road_axis_proximity()
{
    level endon( "player_interruption" );
    self endon( "death" );
    self._id_8A97 = 0;
    wait(_func_0B3( 1 ));

    for (;;)
    {
        var_0 = _func_0B7( 65 );
        wait 0.25;
        var_1 = _func_0EF( level._id_0318._id_02E2, self._id_02E2 );

        if ( var_1 > 1000 )
            continue;

        if ( var_1 < 400 && level._id_0318 _meth_8180() != "prone" )
            var_0 = _func_0B7( 120 );

        if ( var_1 < 900 && common_scripts\utility::_id_382E( "player_sprint" ) )
        {
            self._id_8A97 = 1;
            common_scripts\utility::_id_383F( "player_interruption" );
        }

        if ( !common_scripts\utility::_id_A347( self._id_02E2, self.angles, level._id_0318._id_02E2, var_0 ) )
            continue;

        var_2 = var_1 / 1000;

        if ( var_2 > level._id_0318 scripted_sightconetrace( self _meth_80AA(), self ) )
            continue;

        self._id_8A97 = 1;
        common_scripts\utility::_id_383F( "player_interruption" );
    }
}

area_greenhouse_init()
{
    common_scripts\utility::_id_383F( "aa_greenhouse" );
    _id_A5A4::arcademode_checkpoint( 6, 4 );
    var_0 = getent( "big_barn_door", "targetname" );
    var_1 = getent( "big_barn_animent", "targetname" );

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        var_2 = getent( "big_barn_door_model", "targetname" );
        var_2 _meth_804F( var_0 );
    }
    else
    {
        var_0 _id_A5A4::_id_0D61( "barndoor_02" );
        var_1 _id_A510::_id_0BC7( var_0, "open" );
    }

    for ( var_3 = 0; var_3 < level._id_8AB0.size; var_3++ )
        level._id_8AB0[var_3] _meth_81A7( 0 );

    common_scripts\utility::_id_384A( "road_helicopter_cleared" );
    level.helicopter thread helicopter_attack( 8, "greenhouse_attack_helicopter" );
    _id_A5A4::_id_070A( "greenhouse_color_init" );
    level thread greenhouse_heli_light_off();
    level thread greenhouse_stinger();
    level thread greenhouse_fake_target();
    level thread greenhouse_barn_door();
    level thread infinite_stinger_h1();
    common_scripts\utility::_id_384A( "road_field_cleanup" );
    var_4 = _func_041();
    var_5 = _func_042();

    if ( var_4 / var_5 > 2 )
    {
        if ( getdvarfloat( "r_lodScaleRigid" ) < 1.2 )
            _func_0D6( "r_lodScaleRigid", "1.2" );
    }

    _id_A5A4::_id_1143( "greenhouse" );
    common_scripts\utility::_id_384A( "greenhouse_done" );
    common_scripts\utility::_id_3831( "aa_greenhouse" );
    level thread area_ac130_init();
}

greenhouse_heli_light_off()
{
    common_scripts\utility::_id_384A( "greenhouse_heli_light_off" );
    helicopter_searchlight_off();
}

infinite_stinger()
{
    var_0 = getent( "infinite_stinger", "targetname" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_8056();

    var_0 _meth_8056();
    var_2 = 0;

    for (;;)
    {
        var_3 = var_0._id_02E2 + ( 0, 0, 5 );
        var_4 = spawn( "weapon_stinger", var_3 );
        var_4.angles = var_0.angles;
        wait 1;
        var_4._id_02E2 = var_0._id_02E2 + ( 0, 0, -2 );
        var_4 waittill( "trigger", var_5, var_6 );

        if ( isdefined( var_6 ) )
        {
            var_6._id_02E2 = var_1[var_2]._id_02E2;
            var_6.angles = var_1[var_2].angles;
            var_2++;

            if ( var_2 > var_1.size )
                var_2 = 0;
        }

        level._id_0318 waittill( "stinger_fired" );
    }
}

infinite_stinger_h1()
{
    var_0 = getent( "infinite_stinger", "targetname" );
    var_1 = [];
    var_2 = [];
    var_3 = var_0._id_02E2;
    var_4 = var_0.angles;
    var_5 = getentarray( var_0._id_04A4, "targetname" );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_1[var_1.size] = var_5[var_6]._id_02E2;
        var_2[var_2.size] = var_5[var_6].angles;
        var_5[var_6] delete();
    }

    var_0 delete();
    var_6 = 0;

    for (;;)
    {
        var_7 = var_3 + ( 0, 0, 5 );
        var_8 = spawn( "weapon_stinger", var_7 );
        var_8.angles = var_4;
        wait 1;
        var_8._id_02E2 = var_3 + ( 0, 0, -2 );
        var_8 waittill( "trigger", var_9, var_10 );

        if ( isdefined( var_10 ) )
        {
            var_10._id_02E2 = var_1[var_6];
            var_10.angles = var_2[var_6];
            var_6++;

            if ( var_6 > var_1.size )
                var_6 = 0;
        }

        level._id_0318 waittill( "stinger_fired" );
    }
}

greenhouse_stinger()
{
    while ( _id_A5A4::_id_3CB5( "greenhouse_group" ) > 10 )
    {
        wait 0.05;

        if ( !isdefined( level.helicopter ) )
        {
            common_scripts\utility::_id_383F( "helicopter_down" );
            common_scripts\utility::_id_3831( "aa_stinger" );
            level thread objective_stinger();
            return;
        }
    }

    _id_A5A4::_id_1143( "greenhouse" );
    common_scripts\utility::_id_383F( "aa_stinger" );
    _id_A5A4::_id_1332( "axis" );
    _id_A5A4::_id_1332( "allies" );

    if ( level._id_3BFE > 1 )
    {
        level.heli_guy_accuracy = 4;
        level.heli_guy_health_multiplier = 1;
        level.heli_guy_respawn_delay = 10;
    }
    else
    {
        level.heli_guy_accuracy = 1.5;
        level.heli_guy_health_multiplier = 0.8;
        level.heli_guy_respawn_delay = 15;
    }

    level.helicopter thread activate_heli_guy();
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "anotherpass" );
    _id_A5A4::_id_A066( "greenhouse_group" );
    _id_A5A4::_id_070A( "stinger_color_init" );

    if ( !isdefined( level.helicopter ) || !_func_1A1( level.helicopter ) || isdefined( level.helicopter._id_235D ) && level.helicopter._id_235D )
    {
        common_scripts\utility::_id_383F( "helicopter_down" );
        common_scripts\utility::_id_3831( "aa_stinger" );
        level thread objective_stinger();
        return;
    }

    level.helicopter stop_helicopter_attack();
    wait 1;

    if ( level._id_3BFE > 1 )
    {
        level.heli_guy_accuracy = 8;
        level.heli_guy_health_multiplier = 2;
        level.heli_guy_respawn_delay = 6;
    }
    else
    {
        level.heli_guy_accuracy = 4;
        level.heli_guy_health_multiplier = 2;
        level.heli_guy_respawn_delay = 6;
    }

    if ( _func_1A1( level.helicopter.heli_guy ) )
        level.helicopter.heli_guy._id_1300 = level.heli_guy_accuracy;

    level.helicopter thread heli_path_speed( common_scripts\utility::_id_40FB( "stinger_path", "targetname" ) );
    level.mark waittill( "goal" );
    _id_A5A4::_id_1143( "stinger" );
    _id_A5A4::arcademode_checkpoint( 3, 5 );
    level.mark _id_A510::_id_0C21( level.mark, "missilesinbarn" );

    if ( !_func_1A1( level.helicopter ) || isdefined( level.helicopter._id_235D ) && level.helicopter._id_235D )
    {
        common_scripts\utility::_id_383F( "helicopter_down" );
        common_scripts\utility::_id_3831( "aa_stinger" );
        level thread objective_stinger();
        return;
    }

    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "takeoutchopper" );
    _id_A5A4::_id_27EF( 3, _id_A5A4::_id_070A, "heli_fight_color_init" );
    level thread objective_stinger();
    level.helicopter waittill( "death" );
    level.helicopter deactivate_heli_guy();
    helicopter_searchlight_off();
    wait 1;
    level.mark _id_A510::_id_0C21( level.mark, "niceshooting" );
    wait 5;
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "everyoneonme" );
    common_scripts\utility::_id_3831( "aa_stinger" );
    common_scripts\utility::_id_383F( "helicopter_down" );
}

greenhouse_fake_target()
{
    level.helicopter endon( "death" );
    var_0 = spawn( "script_model", level.helicopter._id_02E2 );
    var_0 _meth_804F( level.helicopter, "tag_origin", ( 0, 0, -80 ), ( 0, 0, 0 ) );
    _func_09D( var_0, ( 0, 0, -80 ) );
    _func_0A8( var_0, 1 );
    level._id_0318 waittill( "stinger_fired" );

    if ( _func_1A1( level.heli_guy ) )
        level.heli_guy _meth_817B( "oblivious" );

    greenhouse_helicopter_reaction_wait( 2 );
    level.helicopter thread evasion_path( "evasion_pattern" );
    wait 0.5;
    level thread hunted_flares_fire_burst( level.helicopter, 8, 6, 5.0 );
    wait 0.5;
    thread stinger_nag();
    var_0 _meth_8051();
    var_1 = get_vehicle_velocity( level.helicopter, ( 0, 0, 10 ) );
    var_0 _meth_82AE( var_1, 8 );
    var_0 thread ent_delete();
    _func_09D( level.helicopter, ( 0, 0, -80 ) );
    _func_0A8( level.helicopter, 1 );

    if ( _func_1A1( level.heli_guy ) )
        level.heli_guy _meth_817B( "heli_guy" );

    level._id_0318 waittill( "stinger_fired" );
    level.helicopter _id_A5A8::_id_4258();

    if ( _func_1A1( level.heli_guy ) )
        level.heli_guy _meth_817B( "oblivious" );

    greenhouse_helicopter_reaction_wait( 3 );
    level.helicopter thread evasion_path( "evasion_pattern" );
    hunted_flares_fire_burst( level.helicopter, 8, 1, 5.0 );
}

get_vehicle_velocity( var_0, var_1 )
{
    var_2 = var_0._id_02E2 + var_1;
    wait 0.05;
    var_3 = var_0._id_02E2 - var_2;
    return _id_A5A4::vector_multiply( var_3, 20 );
}

ent_delete()
{
    wait 3;
    self delete();
}

stinger_nag()
{
    level.helicopter endon( "death" );
    level._id_0318 endon( "stinger_fired" );
    wait 0.5;
    level.mark thread _id_A510::_id_0C21( level.mark, "hunted_uk2_poppingflares" );
    wait 2;
    level.mark thread _id_A510::_id_0C21( level.mark, "hunted_uk2_fireagain" );
}

greenhouse_helicopter_reaction_wait( var_0 )
{
    var_1 = 1100;
    var_2 = _func_0EE( level._id_0318._id_02E2, level.helicopter._id_02E2 );
    var_3 = var_2 / var_1 - var_0;

    if ( var_3 > 0 )
        wait(var_3);
}

hunted_flares_fire_burst( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        playfx( level._id_3891[var_0._id_04FF], var_0 _meth_8184( "tag_light_belly" ) );

        if ( var_0 == level._id_6D79 )
        {
            level._id_8D77["flares_used"]++;
            level._id_0318 _meth_82F1( "weap_flares_fire" );
        }

        wait 0.25;
    }
}

evasion_path( var_0 )
{
    self endon( "death" );

    if ( isdefined( self._id_251D._id_04A4 ) )
        var_1 = common_scripts\utility::_id_40FB( self._id_251D._id_04A4, "targetname" );
    else
        var_1 = self._id_251D;

    var_2 = make_evasion_path( var_0 );
    heli_path_speed( var_2 );

    if ( isdefined( var_1 ) )
        heli_path_speed( var_1 );
}

make_evasion_path( var_0 )
{
    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    var_2 = spawnstruct();
    var_3 = var_1._id_02E2;
    var_4 = var_2;
    var_5 = undefined;

    if ( !isdefined( level.evasion_index ) )
        level.evasion_index = 0;

    for (;;)
    {
        var_1 = common_scripts\utility::_id_40FB( var_1._id_04A4, "targetname" );
        var_2._id_02E2 = self _meth_81B4( var_1._id_02E2 - var_3 );

        if ( isdefined( var_1.angles ) )
            var_2.angles = self.angles + var_1.angles;

        if ( isdefined( var_5 ) )
            var_2._id_04A6 = var_5;

        var_5 = "evasion_" + level.evasion_index;

        if ( isdefined( var_1._id_04A4 ) )
        {
            var_2._id_04A4 = var_5;
            var_2 add_struct_to_level_array();
        }
        else
        {
            var_2 add_struct_to_level_array();
            break;
        }

        var_2 = spawnstruct();
        level.evasion_index++;
    }

    return var_4;
}

add_struct_to_level_array()
{
    level._id_8F60[level._id_8F60.size] = self;

    if ( isdefined( self._id_04A6 ) )
        add_struct( self._id_04A6, "targetname" );

    if ( isdefined( self._id_04A4 ) )
        add_struct( self._id_04A4, "target" );

    if ( isdefined( self._id_0398 ) )
        add_struct( self._id_0398, "script_noteworthy" );
}

add_struct( var_0, var_1 )
{
    if ( !isdefined( level._id_8F64[var_1][var_0] ) )
        level._id_8F64[var_1][var_0] = [];

    var_2 = level._id_8F64[var_1][var_0].size;
    level._id_8F64[var_1][var_0][var_2] = self;
}

greenhouse_barn_door()
{
    common_scripts\utility::_id_384A( "helicopter_down" );
    _id_A5A4::_id_070A( "greenhouse_exit_stuckup_color_init" );
    common_scripts\utility::_id_384A( "greenhouse_rear_exit" );
    var_0 = _func_0D9( "allies" );
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 != level._id_6F7C && var_3 != level.mark )
        {
            var_3 _id_A5A4::_id_2A74();

            if ( var_3 != level.steve )
                var_1 = var_3;
        }
    }

    var_5 = getent( "big_barn_door", "targetname" );
    var_6 = getent( "big_barn_animent", "targetname" );
    level._id_6F7C _id_A5A4::_id_2A74();
    var_6 _id_A510::_id_0BFF( level._id_6F7C, "hunted_open_big_barn_gate" );

    if ( getdvarint( "use_old_door_openings" ) == 1 )
    {
        var_6 _id_A510::_id_0C24( level._id_6F7C, "hunted_open_big_barn_gate_stop" );
        var_6 thread _id_A510::_id_0C24( level._id_6F7C, "hunted_open_big_barn_gate" );
        var_5 _id_A5A4::_id_4B09( "door_metal_slow_open" );
    }
    else
    {
        var_5 thread h1_play_door_sound( 0, "door_metal_slow_open" );
        wait 0.25;
        var_6 thread _id_A510::_id_0C24( level._id_6F7C, "hunted_open_big_barn_gate" );
        var_6 _id_A510::_id_0C24( var_5, "open" );
        var_5 h1_connectanimateddoorpaths();
    }

    _id_A5A4::_id_070A( "barn_exit_y_color_init" );
    level._id_6F7C _id_A5A4::_id_7E38( "o" );
    level._id_6F7C _id_A5A4::_id_30B0();
    wait 0.5;
    _id_A5A4::_id_070A( "barn_exit_r_color_init" );
    var_7 = _func_0F0( var_5._id_02E2, var_1._id_02E2 );
    var_8 = _func_0F0( var_5._id_02E2, level.steve._id_02E2 );

    if ( var_7 < var_8 )
    {
        var_1 _id_A5A4::_id_309A();
        wait 0.9;
        level.steve _id_A5A4::_id_309A();
    }
    else
    {
        level.steve _id_A5A4::_id_309A();
        wait 0.9;
        var_1 _id_A5A4::_id_309A();
    }

    level._id_6F7C common_scripts\utility::_id_A0A0( "goal", 3 );
    level._id_6F7C _id_A5A4::_id_2A8D();
    common_scripts\utility::_id_383F( "greenhouse_done" );
}

ac130_rumble()
{
    common_scripts\utility::_id_384A( "ac130_barrage" );
    var_0 = [];
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 1, "generic_attack_heavy_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 2, "generic_attack_medium_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 2.55, "generic_attack_medium_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 3.05, "generic_attack_heavy_750" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 6.5, "generic_attack_heavy_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 7.0, "generic_attack_heavy_750" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 10.05, "generic_attack_heavy_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 12.0, "generic_attack_medium_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 12.8, "generic_attack_heavy_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 15.05, "generic_attack_heavy_500" );
    level._id_0318 thread _id_A5A4::rumble_sequence_play( var_0 );
}

area_ac130_init()
{
    _id_A5A4::_id_1143( "ac130" );
    _id_A5A4::arcademode_checkpoint( 3, 6 );
    common_scripts\utility::_id_383F( "aa_ac130" );
    level thread set_playerspeed( 130, 5 );
    level thread ac130_allies();
    level thread ac130_devastation();
    level thread ac130_gas_station();
    level thread ac130_enemy_vehicles();
    level thread ac130_rumble();
    common_scripts\utility::_id_384A( "go_dazed" );
    level thread set_playerspeed( 190, 4 );
    common_scripts\utility::_id_3856( "mission_end_trigger", 30 );
    common_scripts\utility::_id_3831( "aa_ac130" );
    _id_A5A4::_id_60D6();
}

ac130_dazed_guy()
{
    self endon( "death" );
    self _meth_817B( "oblivious" );
    self._id_0C72 = "axis";
    _id_A5A4::_id_7EAB( "patrolwalk_nolight" );
    self._id_0B0D = 1;
    thread ac130_defend_gasstation();
    common_scripts\utility::_id_384A( "ac130_barrage" );
    _id_A5A4::_id_1ED1();
    self._id_0B0D = undefined;

    if ( isdefined( self._id_0398 ) && self._id_0398 == "runners" )
    {
        if ( self._id_3584 == 210 )
        {
            _id_A5A4::_id_7EAB( "dazed_0" );
            self._id_0B0D = 1;
        }

        common_scripts\utility::_id_384A( "ac130_barrage_over" );
        self waittill( "damage" );
        self _meth_817B( "axis" );

        if ( self._id_3584 == 210 )
        {
            _id_A5A4::_id_1ED1();
            self._id_0B0D = undefined;
        }
    }
    else
    {
        self._id_85BA = 1;
        thread throw_on_death( ( 6432, 11312, 200 ), "MOD_EXPLOSIVE" );
        common_scripts\utility::_id_384A( "go_dazed" );
        self _meth_817B( "oblivious" );
        var_0 = common_scripts\utility::_id_0287( self._id_3584, 5 );
        _id_A5A4::_id_7EAB( "dazed_" + var_0 );
        self._id_0B0D = 1;
        wait 7;
        _id_A5A4::_id_08EB();
        self._id_01E6 = 1;
        self._id_85BA = undefined;
        thread track_player_proximity();
        common_scripts\utility::_id_A087( "damage", "proximity" );
        self._id_0B0D = undefined;
        wait 1;
        self _meth_817B( "axis" );
    }
}

track_player_proximity()
{
    self endon( "death" );
    wait(_func_0B3( 0.5 ));

    while ( _func_0EF( level._id_0318._id_02E2, self._id_02E2 ) > 350 )
        wait 0.25;

    self notify( "proximity" );
}

throw_on_death( var_0, var_1 )
{
    self waittill( "death", var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    if ( !isdefined( self ) || !isdefined( var_3 ) || var_3 != var_1 )
        return;

    var_9 = self._id_02E2;
    var_10 = _func_114( var_9 - var_0 );
    self _meth_8023();
    wait 0.1;
    _func_17E( var_9 + _id_A5A4::vector_multiply( var_10, -50 ), 100, 90, 4 );
}

ac130_allies()
{
    setignoremegroup( "axis", "allies" );
    common_scripts\utility::_id_3852( "ac130_defend_gasstation", "ac130_barrage" );
    wait 3;
    setthreatbias( "axis", "allies", 0 );
}

ac130_defend_gasstation()
{
    self endon( "death" );
    level endon( "ac130_barrage" );
    common_scripts\utility::_id_384A( "ac130_defend_gasstation" );
    _id_A5A4::_id_1ED1();
    self _meth_817B( "axis" );
    level thread ac130_kill_player();
}

ac130_kill_player()
{
    for (;;)
    {
        if ( !common_scripts\utility::_id_382E( "ac130_barrage" ) )
        {
            if ( _func_0EF( ( 6264, 12264, 232 ), level._id_0318._id_02E2 ) < 1200 )
                break;
        }
        else if ( !common_scripts\utility::_id_382E( "go_dazed" ) )
        {
            if ( _func_0EF( ( 5928, 12952, 200 ), level._id_0318._id_02E2 ) < 1600 )
                break;
        }

        wait 0.05;
    }

    level._id_0318 _meth_8134( 0 );
    var_0 = getdvarfloat( "player_damagemultiplier" );
    var_1 = 25 / var_0;

    for (;;)
    {
        level._id_0318 _meth_8053( var_1, ( 6896, 12118, 328 ) );
        wait 0.05;
    }
}

ac130_devastation()
{
    common_scripts\utility::_id_383F( "gasstation_start" );
    _id_A5A4::_id_70BD( "requestfire" );
    common_scripts\utility::_id_384A( "ac130_inplace" );
    _id_A5E8::_id_870C( "aud_ac130_sequence" );
    _id_A5A4::_id_70BD( "usesomehelp" );
    level thread set_flag_on_player_action( "ac130_defend_gasstation", 1, 1, 0 );

    if ( getdvarint( "use_old_price_talk_control" ) == 1 )
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "100metres" );
    else
    {
        if ( _func_0EE( level._id_6F7C._id_02E2, level._id_6F7C._id_01C3 ) > level._id_6F7C._id_01C4 )
        {
            level._id_6F7C _meth_81A7( 1 );
            level._id_6F7C waittill( "goal" );
            level._id_6F7C _meth_81A7( 0 );
        }

        var_0 = spawn( "script_origin", ( 7395, 10012, 211 ) );
        var_0.angles = ( 0, 180, 0 );
        var_0 _id_A510::_id_0BB5( level._id_6F7C, "zonly_physics", "talk_to_control" );
    }

    _id_A5A4::_id_70BD( "comindown" );
    wait 0.5;
    common_scripts\utility::_id_383F( "ac130_barrage" );
    level notify( "kill_action_flag" );
    wait 1;
    _id_A5A4::_id_070A( "cover_color_init" );
    wait 4;
    level.mark._id_0B0D = 1;
    level.steve._id_0B0D = 1;
    level.charlie._id_0B0D = 1;
    level.mark._id_2AF3 = 1;
    level.steve._id_2AF3 = 1;
    level.charlie._id_2AF3 = 1;
    level.mark _id_A5A4::_id_7EAB( "path_slow" );
    level.steve _id_A5A4::_id_7EAB( "path_slow" );
    level.charlie _id_A5A4::_id_7EAB( "path_slow" );
    _id_A5A4::_id_070A( "celebrate_color_init" );
    level.mark thread anim_on_goal( "hunted_celebrate", 2.5 );
    level.steve thread anim_on_goal( "hunted_celebrate", 0 );
    level.charlie thread anim_on_goal( "hunted_celebrate", 1 );
    wait 2;
    _id_A5A4::_id_070A( "dazed_color_init" );
    common_scripts\utility::_id_383F( "go_dazed" );
    wait 10;
    _id_A5A4::_id_70BD( "getmovin" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "comeonletsgo" );
    level thread set_playerspeed( 190, 3 );
    level.mark._id_0B0D = undefined;
    level.steve._id_0B0D = undefined;
    level.charlie._id_0B0D = undefined;
    level.mark _id_A5A4::_id_1ED1();
    level.steve _id_A5A4::_id_1ED1();
    level.charlie _id_A5A4::_id_1ED1();
    _id_A5A4::_id_070A( "mission_end_color_init" );
    common_scripts\utility::_id_383F( "ac130_barrage_over" );
}

anim_on_goal( var_0, var_1 )
{
    wait 0.5;
    self waittill( "goal" );
    wait(var_1);
    thread _id_A510::_id_0C21( self, var_0 );
}

ac130_enemy_vehicles()
{
    var_0 = getentarray( "dazed_guy", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::ac130_dazed_guy );
    _id_A5A4::_id_070A( "gas_station_color_init" );
    common_scripts\utility::_id_384A( "gasstation_start" );
    var_1 = _id_A5A8::_id_897D( "gasstation_truck" );
    gassstation_truck_add_dynamic_light( var_1 );
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3]._id_029C == "vehicle_t72_tank" )
            var_2 = var_1[var_3];
    }

    common_scripts\utility::_id_384A( "ac130_defend_gasstation" );

    if ( common_scripts\utility::_id_382E( "ac130_barrage" ) )
        return;

    _id_A5A4::_id_1333( "axis" );
    _id_A5A4::_id_1333( "allies" );
    _id_A5A4::_id_070A( "gas_station_defend_color_init" );
    var_2 _id_A5A8::_id_5BD3();
    var_2 _meth_825E( level._id_0318 );
}

ac130_vehicle_die()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "ac130_barrage" );

    switch ( self._id_0398 )
    {
        case "1":
            wait 1;
            break;
        case "2":
            wait 2.5;
            break;
        case "3":
            wait 9;
            break;
        default:
    }

    self notify( "death" );
}

gassstation_truck_add_dynamic_light( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_7B0D ) && var_2._id_7B0D == "headlights" )
        {
            if ( var_2.classname == "script_vehicle_pickup_4door" )
                _id_A5A8::_id_1857( var_2.classname, "headlight_truck_dynamic", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight_omni_offset", "headlights" );
            else if ( var_2.classname == "script_vehicle_bm21_mobile_cover" )
            {
                if ( var_2._id_0398 == "3" )
                    _id_A5A8::_id_1857( var_2.classname, "headlight_truck_dynamic", "tag_headlight_left", "vfx/lights/hunted/hunted_headlight_spotlight_offset", "headlights" );

                var_2._id_5A3F = 1;
            }

            var_2 turn_headlights_on( 1 );
        }
    }
}

ac130_gas_station()
{
    common_scripts\utility::_id_384A( "ac130_barrage" );
    var_0 = getentarray( "gas_station", "targetname" );
    var_1 = getentarray( "gas_station_d", "targetname" );
    common_scripts\_exploder::_id_3528( 66 );
    wait 1.0;
    common_scripts\utility::_id_0D13( var_0, ::hide_ent );
    common_scripts\utility::_id_0D13( var_1, ::swap_ent, ( 7680, 0, 0 ) );
}

hide_ent( var_0 )
{
    if ( isdefined( self._id_0392 ) && !isdefined( var_0 ) )
        wait(self._id_0392 + 0.1);

    self _meth_8056();
}

swap_ent( var_0 )
{
    if ( isdefined( self._id_0392 ) )
        wait(self._id_0392);

    self._id_02E2 += var_0;
    wait 0.1;
    self _meth_8055();
}

setup_gas_station()
{
    var_0 = getentarray( "gas_station_d", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::hide_ent, 1 );
}

setup_friendlies()
{
    level._id_8AB0 = [];
    level._id_6F7C = _id_7B3C( "price", "script_noteworthy", 1 );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C._id_02A7 = "Captain Price";
    level._id_6F7C thread squad_init();
    level.mark = _id_7B3C( "mark", "script_noteworthy", 1 );
    level.mark._id_0C72 = "mark";
    level.mark._id_02A7 = "Gaz";
    level.mark thread squad_init();
    level.steve = _id_7B3C( "steve", "script_noteworthy", 1 );
    level.steve._id_0C72 = "steve";
    level.steve._id_02A7 = "Nikolai";
    level.steve thread squad_init();
    level.steve.has_ir = undefined;
    level.charlie = _id_7B3C( "charlie", "script_noteworthy", 1 );
    level.charlie._id_0C72 = "charlie";
    level.charlie thread squad_init();
}

squad_init()
{
    thread _id_A5A4::_id_58D7();
    level._id_8AB0[level._id_8AB0.size] = self;
    self waittill( "death" );
    level._id_8AB0 = common_scripts\utility::_id_0CF6( level._id_8AB0, self );
}

setup_enemies()
{
    var_0 = _func_0DD( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1].classname == "actor_enemy_dog" )
        {
            var_0[var_1] _id_A5A4::_id_0798( ::dog_settings );
            continue;
        }

        var_0[var_1] _id_A5A4::_id_0798( ::axis_settings );
    }
}

axis_settings()
{
    self _meth_8170( 300, 200 );
    self _meth_8171( 512, 720 );
}

dog_settings()
{
    self _meth_817B( "dogs" );
    self._id_132D = 0;
}

start_default()
{
    area_flight_init();
}

start_flight_cleanup()
{
    var_0 = getent( "crash_mask", "targetname" );
    var_0 delete();
    var_1 = getent( "missile_source", "targetname" );
    var_1 delete();
}

_id_8B7C()
{
    _id_A5E8::_id_870C( "aud_start_crash_checkpoint" );
    start_flight_cleanup();
    thread hud_hide( 1 );
    level._id_0318 _meth_831A();
    area_crash_init();
}

start_dirt_path()
{
    _id_A5E8::_id_870C( "aud_start_path_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "path" );
    start_flight_cleanup();
    level._id_0318 set_playerspeed( 130 );
    area_dirt_path_init();
}

start_barn()
{
    _id_A5E8::_id_870C( "aud_start_barn_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "barn" );
    thread door_anim_first_frame_solo();
    start_flight_cleanup();
    level thread set_flag_on_player_action( "player_interruption", 1, 1, 1 );
    level thread objective_lz();
    common_scripts\utility::_id_383F( "trucks_warning" );
    level thread dirt_path_barn_truck();
    getent( "calc_speed_trigger", "script_noteworthy" ) delete();
    common_scripts\utility::_id_384A( "barn_moveup" );
    area_barn_init();
}

start_field()
{
    _id_A5E8::_id_870C( "aud_start_field_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "field" );
    start_flight_cleanup();
    level thread objective_lz();
    area_field_init();
}

start_basement()
{
    _id_A5E8::_id_870C( "aud_start_basement_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "basement" );
    start_flight_cleanup();
    level thread objective_lz();

    for ( var_0 = 0; var_0 < level._id_8AB0.size; var_0++ )
        level._id_8AB0[var_0] _id_A5A4::_id_7E38( "r" );

    common_scripts\utility::_id_383F( "basement_enter" );
    common_scripts\utility::_id_383F( "basement_door_open" );
    common_scripts\utility::_id_383F( "squad_in_basement" );
    var_1 = _id_A5A8::_id_8978( "field_heli" );
    level.helicopter = var_1;
    level.helicopter _id_A5A8::_id_4259();
    var_1 helicopter_searchlight_on();
    area_basement_init();
}

start_farm()
{
    _id_A5E8::_id_870C( "aud_start_farm_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "farm" );
    start_flight_cleanup();
    level thread objective_lz();
    area_farm_init();
}

start_creek()
{
    _id_A5E8::_id_870C( "aud_start_creek_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "creek" );
    start_flight_cleanup();
    level._id_6F7C _id_A5A4::_id_7E38( "y" );
    level.mark _id_A5A4::_id_7E38( "y" );
    level.steve _id_A5A4::_id_7E38( "r" );
    level.charlie _id_A5A4::_id_7E38( "r" );
    var_0 = getentarray( "farm_color_trigger", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, common_scripts\utility::_id_97CC );
    _id_A5A4::_id_070A( "farm_cleared_color_init" );
    common_scripts\utility::_id_383F( "farm_clear" );
    common_scripts\utility::_id_383F( "creek_helicopter" );
    level thread objective_lz();
    area_creek_init();
}

start_greenhouse()
{
    _id_A5E8::_id_870C( "aud_start_greenhouse_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "greenhouse" );
    start_flight_cleanup();
    level._id_6F7C _id_A5A4::_id_7E38( "y" );
    level.mark _id_A5A4::_id_7E38( "y" );
    level.steve _id_A5A4::_id_7E38( "r" );
    level.charlie _id_A5A4::_id_7E38( "r" );
    level._id_6F7C _id_A5A4::_id_30B0();
    level.mark _id_A5A4::_id_30B0();
    level.steve _id_A5A4::_id_30B0();
    level.charlie _id_A5A4::_id_30B0();
    common_scripts\utility::_id_383F( "player_interruption" );
    thread start_greenhouse_helicopter();
    common_scripts\utility::_id_383F( "road_helicopter_cleared" );
    level thread objective_lz();
    wait 1;
    area_greenhouse_init();
}

start_greenhouse_helicopter()
{
    var_0 = _id_A5A8::_id_8978( "creek_heli" );
    var_0 _meth_824F( 128, 35, 25 );
    wait 0.1;

    for ( var_1 = 0; var_1 < var_0._id_750A.size; var_1++ )
        var_0._id_750A[var_1] _meth_817B( "oblivious" );

    var_0 helicopter_searchlight_on();
    level.helicopter = var_0;
    level.helicopter _id_A5A8::_id_4259();
    setthreatbias( "player", "heli_guy", 10000 );
    setthreatbias( "heli_guy", "player", 20000 );
    level.heli_guy_accuracy = 1;
    level.heli_guy_health_multiplier = 2;
    level.heli_guy_respawn_delay = 20;
    level.helicopter heli_path_speed( common_scripts\utility::_id_40FB( "greenhouse_startpath", "targetname" ) );
}

start_ac130()
{
    _id_A5E8::_id_870C( "aud_start_ac130_checkpoint" );
    setup_friendlies();
    start_teleport_squad( "ac130" );
    start_flight_cleanup();
    level._id_6F7C _id_A5A4::_id_7E38( "o" );
    level.mark _id_A5A4::_id_7E38( "y" );
    level.steve _id_A5A4::_id_7E38( "r" );
    level.charlie _id_A5A4::_id_7E38( "r" );
    level thread objective_lz();
    _id_A5A4::_id_070A( "barn_exit_y_color_init" );
    _id_A5A4::_id_070A( "barn_exit_r_color_init" );
    area_ac130_init();
}

start_teleport_squad( var_0 )
{
    var_1 = _func_0C3( "startnodeplayer_" + var_0, "targetname" );
    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( var_1.angles );

    for ( var_2 = 0; var_2 < level._id_8AB0.size; var_2++ )
    {
        level._id_8AB0[var_2] notify( "stop_going_to_node" );
        var_3 = "startnode" + level._id_8AB0[var_2]._id_0C72 + "_" + var_0;
        var_1 = _func_0C3( var_3, "targetname" );
        level._id_8AB0[var_2] _id_8CC0( var_1 );
    }
}

_id_8CC0( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    self _meth_81C9( var_0._id_02E2, var_0.angles );
    self _meth_81AA( self._id_02E2 );
    self._id_01C4 = 0;

    if ( isdefined( var_0._id_0351 ) )
        self._id_01C4 = var_0._id_0351;

    self _meth_81A9( var_0 );
}

scripted_sightconetrace( var_0, var_1 )
{
    var_2 = level._id_0318 _meth_80AA();
    var_3[0] = var_2 + ( 14, 14, 0 );
    var_3[2] = var_2 + ( -14, 14, -10 );
    var_3[1] = var_2 + ( -14, -14, -20 );
    var_3[3] = var_2 + ( 14, -14, -30 );
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( _func_08D( var_0, var_3[var_5], 0, var_1 ) )
            var_4 += 0.25;
    }

    return var_4;
}

attach_flashlight( var_0 )
{
    self _meth_801D( "com_flashlight_on", "tag_inhand", 1 );
    self._id_475E = 1;
    flashlight_light( var_0 );
    thread detach_flashlight_on_death();
}

detach_flashlight_on_death()
{
    self waittill( "death" );

    if ( isdefined( self ) )
        detach_flashlight();
}

detach_flashlight()
{
    if ( !isdefined( self._id_475E ) )
        return;

    self _meth_802A( "com_flashlight_on", "tag_inhand" );
    flashlight_light( 0 );
    self._id_475E = undefined;
}

flashlight_light( var_0 )
{
    var_1 = "tag_light";

    if ( var_0 )
    {
        var_2 = spawn( "script_model", ( 0, 0, 0 ) );
        var_2 _meth_80B3( "tag_origin" );
        var_2 _meth_8056();
        var_2 _meth_804F( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        thread flashlight_light_death( var_2 );
        playfxontag( level._id_058F["flashlight"], var_2, "tag_origin" );
    }
    else if ( isdefined( self._id_475E ) )
        self notify( "flashlight_off" );
}

flashlight_light_death( var_0 )
{
    common_scripts\utility::_id_A087( "death", "flashlight_off" );
    var_0 delete();
    self._id_475E = undefined;
}

hud_hide( var_0 )
{
    wait 1;

    if ( var_0 )
    {
        _func_0D6( "compass", "0" );
        _func_0D6( "ammoCounterHide", "1" );
        _func_0D6( "hud_showstance", "0" );
        level.nocompass = 1;
    }
    else
    {
        _func_0D6( "compass", "1" );
        _func_0D6( "ammoCounterHide", "0" );
        _func_0D6( "hud_showstance", "1" );
        level.nocompass = undefined;
    }
}

grenade_notifies()
{
    for (;;)
    {
        level._id_0318 waittill( "grenade_fire", var_0, var_1 );
        var_0 thread notify_on_detonation( var_1 );
    }
}

notify_on_detonation( var_0 )
{
    while ( isdefined( self ) )
        wait 0.1;

    level._id_0318 notify( var_0 );
}

set_flag_on_player_action( var_0, var_1, var_2, var_3 )
{
    level notify( "kill_action_flag" );
    level endon( "kill_action_flag" );
    level endon( var_0 );

    if ( common_scripts\utility::_id_382E( var_0 ) )
        return;

    for (;;)
    {
        var_4 = level._id_0318 common_scripts\utility::_id_A070( "weapon_fired", "fraggrenade", "flash_grenade", "h1_cheatlemonade" );

        if ( !isdefined( var_4 ) )
            break;

        if ( var_4 == "weapon_fired" )
            break;

        if ( var_4 == "fraggrenade" && isdefined( var_2 ) )
            break;

        if ( var_4 == "flash_grenade" && isdefined( var_1 ) )
            break;

        if ( var_4 == "h1_cheatlemonade" && isdefined( var_2 ) )
            break;
    }

    if ( var_3 )
        waittillframeend;

    common_scripts\utility::_id_383F( var_0 );
}

set_fixednode( var_0 )
{
    self._id_017D = var_0;
}

make_walk()
{
    var_0 = self._id_050F;
    self._id_050F = 1000;
    level waittill( "stop_walk" );
    self._id_050F = var_0;
}

flash_immunity( var_0 )
{
    self endon( "death" );
    _id_A5A4::_id_7F71( 1 );
    wait(var_0);
    _id_A5A4::_id_7F71( 0 );
}

make_ai_move()
{
    self _meth_81A7( 1 );
    _id_A5A4::_id_7E60( 1 );
    self.a._id_2B20 = 1;
    self _meth_817B( "oblivious" );
}

make_ai_normal()
{
    self _meth_81A7( 0 );
    _id_A5A4::_id_7E60( 0 );
    self.a._id_2B20 = 0;
    self _meth_817B( "allies" );
}

_id_2827()
{
    self endon( "death" );
    self waittill( "goal" );

    while ( self _meth_81C2( level._id_0318 ) )
        wait 1;

    if ( isdefined( self ) && isdefined( level.farmer ) && self == level.farmer && common_scripts\utility::_id_382E( "save_farmer" ) )
        _id_A5A4::_id_41DD( "MAN_OF_THE_PEOPLE" );

    self delete();
}

magic_kill()
{
    if ( common_scripts\utility::_id_382E( "heli_field_stragler_attack" ) )
        return;

    common_scripts\utility::_id_383F( "heli_field_stragler_attack" );
    var_0 = common_scripts\utility::_id_40FB( "heli_stragler_attack_path", "targetname" );
    level.helicopter thread heli_path_speed( var_0 );
    level.heli_guy_accuracy = 2;
    level.heli_guy_health_multiplier = 2;
    level.heli_guy_respawn_delay = 5;
    level.helicopter thread activate_heli_guy();
}

setthreatbiasgroup_on_array( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_1 = _id_A5A4::_id_0CE7( var_1, var_2 );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_1[var_3] _meth_817B( var_0 );
}

setup_heli_guy()
{
    var_0 = getent( "heli_guy", "targetname" );
    var_0 _id_A5A4::_id_0798( ::heli_guy );
    var_1 = common_scripts\utility::_id_40FD( "activate_heli_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_1, ::activate_heli_guy_trigger );
    var_2 = common_scripts\utility::_id_40FD( "deactivate_heli_guy", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_2, ::deactivate_heli_guy_trigger );
}

activate_heli_guy_trigger()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 activate_heli_guy();
    }
}

activate_heli_guy()
{
    self endon( "death" );
    self endon( "deactivate_heli_guy" );

    if ( !isdefined( level.heli_guy_respawn_delay ) )
        level.heli_guy_respawn_delay = 6;

    for (;;)
    {
        var_0 = _id_7B3C( "heli_guy", "targetname" );
        var_0 waittill( "death" );
        wait(_func_0B3( 3 ) + level.heli_guy_respawn_delay);
    }
}

deactivate_heli_guy_trigger()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 deactivate_heli_guy();
    }
}

deactivate_heli_guy()
{
    self notify( "deactivate_heli_guy" );
    helicopter_close_door();
    wait 1;

    if ( _func_1A1( self.heli_guy ) )
        self.heli_guy delete();

    self.heli_guy = undefined;
}
#using_animtree("generic_human");

heli_guy()
{
    if ( !isdefined( level.helicopter ) )
        return;

    if ( !isdefined( level.heli_guy_accuracy ) )
        level.heli_guy_accuracy = 1;

    if ( !isdefined( level.heli_guy_health_multiplier ) )
        level.heli_guy_health_multiplier = 1.5;

    self.a._id_2B18 = 1;
    self.ignoreweaponintracksuitmode = 1;
    self _meth_804F( level.helicopter, "tag_origin", ( 120, 30, -140 ), ( 0, 90, 0 ) );
    self _meth_81CE( "crouch" );
    self._id_01E6 = _func_0BC( self._id_01E6 * level.heli_guy_health_multiplier );
    self._id_1300 = level.heli_guy_accuracy;
    self _meth_817B( "heli_guy" );
    level.helicopter notify( "dont_clear_anim" );
    level.helicopter helicopter_open_door();
    level.helicopter.heli_guy = self;
    level.helicopter notify( "heli_guy_spawned" );
    death_monitor();

    if ( isdefined( self ) )
    {
        if ( getdvarint( "ragdoll_enable" ) )
        {
            self.a._id_612E = 1;
            var_0 = spawn( "script_origin", self._id_02E2 );
            var_0.angles = level.helicopter.angles + ( 0, 90, 0 );
            level._id_78AC["generic"]["heli_fall"] = %helicopter_death_fall;
            thread common_scripts\utility::_id_69C2( "generic_death_falling", level.helicopter._id_02E2 );
            var_0 _id_A510::_id_0BC9( self, "heli_fall" );
            var_0 delete();

            if ( _func_1A1( self ) )
                _id_A5A4::_id_2A51();
        }
        else
        {
            _id_A5A4::_id_2A51();
            thread common_scripts\utility::_id_69C2( "generic_death_falling", level.helicopter._id_02E2 );
            self waittillmatch( "deathanim", "end" );
            self delete();
        }
    }

    if ( isdefined( level.helicopter ) )
        level.helicopter.heli_guy_died = 1;
}

death_monitor()
{
    var_0 = 1000000;
    self._id_01E6 += var_0;
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( self._id_01E6 < var_0 )
            break;
    }
}

delete_dude()
{
    wait 10;
    self delete();
}
#using_animtree("vehicles");

helicopter_open_door()
{
    wait 0.5;
    self _meth_8117( #animtree );
    self _meth_814D( %mi17_heli_idle, 1, 1 );
}

helicopter_close_door()
{
    if ( isdefined( self ) )
        self _meth_8144( %mi17_heli_idle, 1 );
}

expand_goalradius_ongoal()
{
    self endon( "death" );
    self waittill( "goal" );
    self._id_01C4 = 1000;
}

setthreatbiasgroup_on_notify( var_0, var_1 )
{
    self endon( "death" );
    self waittill( var_0 );
    self _meth_817B( var_1 );
}

set_goalnode( var_0 )
{
    self _meth_81A9( var_0 );

    if ( isdefined( var_0._id_0351 ) )
        self._id_01C4 = var_0._id_0351;
}

_id_7E51( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1._id_04A4 ) )
    {
        var_2 = _func_0C3( var_1._id_04A4, "targetname" );
        set_goalnode( var_2 );
    }

    self _meth_81AC( var_1 );
}

trigger_timeout( var_0 )
{
    self endon( "trigger" );
    wait(var_0);
    self notify( "trigger" );
}

setup_setgoalvolume_trigger()
{
    common_scripts\utility::_id_0D13( getentarray( "setgoalvolume", "targetname" ), ::setgoalvolume_trigger );
}

setgoalvolume_trigger()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = _func_0C3( var_0._id_04A4, "targetname" );
    self waittill( "trigger" );
    var_2 = _func_0D9( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] set_goalnode( var_1 );
        var_2[var_3] _meth_81AC( var_0 );
    }
}

helicopter_attack( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_helicopter_attack" );
    var_2 = setup_helicopter_attack_points( var_1 );
    var_3 = 10000;
    self _meth_824F( 200, 30, 30 );

    if ( !isdefined( self.look_at_ent ) )
        self.look_at_ent = spawn( "script_model", ( 0, 0, 0 ) );

    var_4 = anglestoforward( self.angles );
    self.look_at_ent._id_02E2 = self._id_02E2 + _id_A5A4::vector_multiply( var_4, 3000 );
    var_5 = undefined;

    for (;;)
    {
        wait 0.05;

        if ( isdefined( self.heli_guy_died ) )
        {
            var_3 += 8;
            self.heli_guy_died = undefined;
        }
        else if ( _func_0EF( self._id_02E2, level._id_0318._id_02E2 ) < 900 )
            var_3 += 0.2;
        else if ( _func_1A1( self.heli_guy ) && !_func_08E( self.heli_guy _meth_80AA(), level._id_0318 _meth_80AA(), 0, self.heli_guy ) )
            var_3 += 0.2;
        else
            var_3 += 0.05;

        if ( var_3 < var_0 && !isdefined( var_2.new_selection ) )
            continue;

        if ( isdefined( var_2.new_selection ) )
            thread spot_target_path_end();

        var_5 = helicopter_attack_pick_points( var_2, var_5 );
        var_2.new_selection = undefined;
        var_4 = anglestoforward( var_5.angles );
        var_6 = var_5._id_02E2 + _id_A5A4::vector_multiply( var_4, 3000 );
        var_7 = _func_0EF( var_5._id_02E2, self._id_02E2 ) / 350;
        self.look_at_ent _meth_82AA( var_6, var_7, var_7 / 2, var_7 / 2 );
        self _meth_8261( self.look_at_ent );
        heli_path_speed( var_5 );
        self _meth_8262();
        var_3 = 0;
        self.heli_guy_died = undefined;
    }
}

stop_helicopter_attack()
{
    self _meth_8262();
    self notify( "stop_helicopter_attack" );
}

helicopter_attack_pick_points( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_0CF5( var_0.attack_points );

    if ( isdefined( var_1 ) )
        var_2 = common_scripts\utility::_id_0CF6( var_2, var_1 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( _func_0EF( var_2[var_3]._id_02E2, level._id_0318._id_02E2 ) < 900 )
            continue;

        if ( _func_08E( var_2[var_3]._id_02E2, level._id_0318 _meth_80AA(), 0, undefined ) )
            return var_2[var_3];
    }

    return var_2[0];
}

setup_helicopter_attack_points( var_0 )
{
    var_1 = spawnstruct();
    var_2 = getentarray( var_0, "targetname" );
    common_scripts\utility::_id_0D13( var_2, ::helicopter_attack_points, var_1 );
    var_1 waittill( "new_trigger" );
    return var_1;
}

helicopter_attack_points( var_0 )
{
    self endon( "stop_helicopter_attack" );

    for (;;)
    {
        self waittill( "trigger" );

        if ( isdefined( var_0.current_trigger ) && level._id_0318 _meth_80AB( var_0.current_trigger ) )
            continue;

        var_0 notify( "new_trigger" );
        var_0.current_trigger = self;
        var_0.new_selection = 1;
        var_0.attack_points = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );
        var_0 waittill( "new_trigger" );
    }
}

follow_path_hunted( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stop_path" );
    self.path_halt = 0;

    for ( var_2 = var_0; isdefined( var_2 ); var_2 = var_2[_func_0B2( var_2.size )] )
    {
        if ( var_2._id_0351 != 0 )
            self._id_01C4 = var_2._id_0351;

        if ( isdefined( var_2._id_01E8 ) && var_2._id_01E8 != 0 )
            self._id_01C2 = var_2._id_01E8;

        self _meth_81A9( var_2 );

        if ( isdefined( var_1 ) && !var_1 )
            self._id_2AF3 = 1;
        else if ( var_2 node_have_delay() )
            self._id_2AF3 = 0;
        else
            disablearrivals_delayed();

        self waittill( "goal" );
        var_2 notify( "trigger", self );

        if ( !isdefined( var_2._id_04A4 ) )
            break;

        var_2 _id_A5A4::_id_0392();

        if ( isdefined( var_2._id_79DA ) )
            common_scripts\utility::_id_384A( var_2._id_79DA );

        if ( self.path_halt )
            self waittill( "path_resume" );

        var_2 = _func_0C4( var_2._id_04A4, "targetname" );
    }

    self notify( "path_end_reached" );
    self.path_halt = undefined;
}

node_have_delay()
{
    if ( !isdefined( self._id_04A4 ) )
        return 1;

    if ( isdefined( self._id_0398 ) && self._id_0398 == "spot_target" )
    {
        var_0 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );

        if ( !isdefined( var_0 ) )
            return 1;
    }

    if ( isdefined( self._id_0392 ) && self._id_0392 > 0 )
        return 1;

    if ( isdefined( self._id_798D ) && self._id_798D > 0 )
        return 1;

    if ( isdefined( self._id_79DA ) && !common_scripts\utility::_id_382E( self._id_79DA ) )
        return 1;

    return 0;
}

disablearrivals_delayed()
{
    self endon( "death" );
    self endon( "stop_path" );
    self endon( "goal" );
    wait 0.5;
    self._id_2AF3 = 1;
}

_id_7B3C( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_4 = var_3 _meth_8096();
    else
        var_4 = var_3 _meth_8095();

    _id_A5A4::_id_88F1( var_4 );
    return var_4;
}

scripted_array_spawn( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_4[var_5] = _id_7B3C( var_0, var_1, var_2, var_3[var_5] );

    return var_4;
}

waittill_vehicle_group_spawn( var_0 )
{
    level waittill( "vehiclegroup spawned" + var_0, var_1 );
    return var_1;
}

spawn_ent_on_tag( var_0 )
{
    var_1 = spawn( "script_model", self _meth_8184( var_0 ) );
    var_1.angles = self.angles;
    var_1 _meth_80B3( "tag_origin" );
    var_1 _meth_804F( self, var_0 );
    return var_1;
}

heli_path_speed( var_0 )
{
    if ( isdefined( var_0 ) && isdefined( var_0._id_03E2 ) )
    {
        var_1 = 25;
        var_2 = undefined;

        if ( isdefined( var_0._id_798B ) )
            var_2 = var_0._id_798B;

        var_3 = var_0._id_03E2;

        if ( isdefined( var_0._id_7929 ) )
            var_1 = var_0._id_7929;
        else
        {
            var_4 = var_3 / 4;

            if ( var_1 > var_4 )
                var_1 = var_4;
        }

        if ( isdefined( var_2 ) )
            self _meth_827F( var_3, var_1, var_2 );
        else
            self _meth_827F( var_3, var_1 );
    }

    _id_A5A8::_id_9D17( var_0 );
}

helicopter_searchlight_on()
{
    while ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) > 7000 )
        wait 0.2;

    helicopter_searchlight_off();
    self _meth_808E();
    spawn_searchlight_target();
    helicopter_setturrettargetent( self.spotlight_default_target );
    self._id_0124 = spawn( "script_model", self _meth_8184( "tag_barrel" ) );
    self._id_0124 _meth_80B3( "tag_origin" );
    thread helicopter_searchlight_effect();
    level._id_3B34 = spawn( "script_model", self _meth_8184( "tag_barrel" ) );
    level._id_3B34 _meth_80B3( "tag_origin" );
    level._id_3B34 _meth_804F( self, "tag_barrel", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    wait 0.5;

    if ( isdefined( level._id_3B34 ) )
        playfxontag( level._id_058F["spotlight"], level._id_3B34, "tag_origin" );
}

turn_headlights_on( var_0 )
{
    if ( isdefined( var_0 ) && var_0 == 1 )
        helicopter_searchlight_off();

    _id_A5A4::_id_27EF( 0.5, _id_A5A8::_id_9D02, "headlights" );
}

helicopter_searchlight_off()
{
    if ( isdefined( level._id_3B34 ) )
    {
        stopfxontag( level._id_058F["spotlight"], level._id_3B34, "tag_origin" );
        level._id_3B34 delete();
    }
}

helicopter_searchlight_effect()
{
    self endon( "death" );
    self._id_0124.spot_radius = 256;
    thread spotlight_interruption();
    var_0 = 0;

    for (;;)
    {
        var_1 = helicopter_getturrettargetent();

        if ( isdefined( var_1.spot_radius ) )
            self._id_0124.spot_radius = var_1.spot_radius;
        else
            self._id_0124.spot_radius = 256;

        var_2 = anglestoforward( self _meth_8185( "tag_barrel" ) );
        var_3 = self _meth_8184( "tag_barrel" );
        var_4 = self _meth_8184( "tag_barrel" ) + _id_A5A4::vector_multiply( var_2, 3000 );
        var_5 = _func_06B( var_3, var_4, 0, self );
        var_6 = var_5["position"];
        var_6 += _id_A5A4::vector_multiply( var_2, -96 );
        self._id_0124 _meth_82AA( var_6, 0.5 );
        wait 0.5;
    }
}

spotlight_interruption()
{
    self endon( "death" );
    level endon( "player_interruption" );

    while ( _func_0EE( level._id_0318._id_02E2, self._id_0124._id_02E2 ) > self._id_0124.spot_radius )
        wait 0.25;

    common_scripts\utility::_id_383F( "player_interruption" );
}

spawn_searchlight_target()
{
    var_0 = self _meth_8184( "tag_ground" );
    var_1 = spawn( "script_origin", var_0 );
    var_1 _meth_804F( self, "tag_ground", ( 320, 0, -256 ), ( 0, 0, 0 ) );
    self.spotlight_default_target = var_1;
    thread searchlight_target_death();
}

searchlight_target_death()
{
    var_0 = self.spotlight_default_target;
    self waittill( "death" );
    var_0 delete();
}

noprone()
{
    for (;;)
    {
        self waittill( "trigger" );
        level._id_0318 _meth_811C( 0 );

        while ( level._id_0318 _meth_80AB( self ) )
            wait 0.05;

        level._id_0318 _meth_811C( 1 );
    }
}

doorpart()
{
    var_0 = getent( self._id_04A4, "targetname" );
    self _meth_804F( var_0, "door_open_jnt" );

    if ( self.classname == "script_brushmodel" )
    {
        level.animated_door_clip_brushes[level.animated_door_clip_brushes.size] = [];
        level.animated_door_clip_brushes[level.animated_door_clip_brushes.size - 1]["clip"] = self;
        level.animated_door_clip_brushes[level.animated_door_clip_brushes.size - 1]["door"] = var_0;
    }
}

set_grenadeawareness( var_0 )
{
    if ( !isdefined( self.old_grenadeawareness ) )
        self.old_grenadeawareness = self._id_01D1;

    if ( isdefined( var_0 ) )
        self._id_01D1 = var_0;

    if ( isdefined( var_0 ) )
        self._id_01D1 = self.old_grenadeawareness;
}

set_playerspeed( var_0, var_1 )
{
    var_2 = 190;

    if ( !isdefined( level._id_0318._id_5F7A ) )
        level._id_0318._id_5F7A = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_3 = _func_0BE( _func_0BC( var_1 * 4 ) );
    var_4 = var_0 / var_2;
    var_5 = level._id_0318._id_5F7A - var_4;

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        level._id_0318._id_5F7A -= var_5 / var_3;
        level._id_0318 _meth_81E4( level._id_0318._id_5F7A );
        wait 0.5;
    }

    level._id_0318._id_5F7A = var_4;
    level._id_0318 _meth_81E4( level._id_0318._id_5F7A );
}

spawn_dead_body()
{
    if ( !isdefined( level.dead_body_count ) )
        level.dead_body_count = 0;

    var_0 = undefined;

    if ( isdefined( self._id_7A18 ) )
        var_0 = self._id_7A18;
    else
    {
        level.dead_body_count++;

        if ( level.dead_body_count > 3 )
            level.dead_body_count = 1;

        var_0 = level.dead_body_count;
    }

    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1._id_02E2 = self._id_02E2;
    var_1.angles = self.angles;
    var_1._id_0C72 = "dead_guy";
    var_1 _id_A5A4::_id_0D61();
    var_1 _meth_855D();
    var_1 character\character_sp_pilot_zack_woodland::main();

    if ( !isdefined( self._id_7AF8 ) )
    {
        var_2 = _func_06B( var_1._id_02E2 + ( 0, 0, 5 ), var_1._id_02E2 + ( 0, 0, -64 ), 0, undefined );
        var_1._id_02E2 = var_2["position"];
    }

    var_1 _meth_8113( "flag", var_1 _id_A5A4::_id_3EF5( self._id_0398 ), 1, 0, 1 );
    var_1 waittillmatch( "flag", "end" );

    if ( !isdefined( self._id_7ADA ) )
        var_1 _meth_8023();

    common_scripts\utility::_id_384A( "tunnel_rush" );
    var_1 delete();
}

_id_5FFB()
{
    _id_A5A4::_id_6008( "hunted_crash_recovery_music" );
    common_scripts\utility::_id_384A( "trucks_warning" );
    _func_076( 5 );
    common_scripts\utility::_id_384A( "hit_the_deck_music" );
    wait 2;
    _id_A5A4::_id_6008( "hunted_spotlight_music" );
}

hunted_wibble_think()
{
    maps\_wibble::set_cloth_wibble( 0.0 );
    common_scripts\utility::_id_384A( "aa_flight" );
    maps\_wibble::set_cloth_wibble( 0.5 );
    common_scripts\utility::_id_384A( "blackhawk_down" );
    maps\_wibble::set_cloth_wibble( 0.0 );
}

door_anim_first_frame_solo()
{
    var_0 = getent( "barn_rear_door", "targetname" );
    var_0._id_6394 = var_0.angles;

    if ( getdvarint( "use_old_door_openings" ) != 1 )
    {
        var_1 = _func_0C3( "price_barn_rear", "targetname" );
        var_0 _id_A5A4::_id_0D61( "barndoor_01" );
        var_1 _id_A510::_id_0BC7( var_0, "open" );
    }
}

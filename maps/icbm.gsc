// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    level.playerisinside = 0;
    var_0 = getentarray( "flag_set", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2._id_79D3 == "player_is_inside" )
            var_2._id_0398 = "skip_blockout_delete";
    }

    var_4 = getent( "sunrise2", "targetname" );
    var_5 = getent( "sunrise3", "targetname" );
    var_6 = getent( "sunrise4", "targetname" );
    var_4._id_0398 = "skip_blockout_delete";
    var_5._id_0398 = "skip_blockout_delete";
    var_6._id_0398 = "skip_blockout_delete";
    common_scripts\_ca_blockout::init();
    maps\icbm_precache::main();
    maps\icbm_fx::main();
    maps\createfx\icbm_audio::main();
    maps\createart\icbm_art::main();
    _id_A550::main();
    maps\icbm_anim::anim_main();
    level thread maps\icbm_amb::main();
    maps\icbm_lighting::main();
    level thread maps\icbm_lighting::beautiful_corner_lighting();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    _func_0D6( "sm_sunShadowScale", "0.5" );
    level.friendlies = [];
    level.tango_down_dialog = 0;
    _id_A5A4::_id_278B( ::landed_start );
    _id_A5A4::_id_079C( "landed", ::landed_start, &"STARTS_LANDED" );
    _id_A5A4::_id_079C( "basement", ::basement_start, &"STARTS_BASEMENT" );
    _id_A5A4::_id_079C( "house2", ::house2_start, &"STARTS_HOUSE2" );
    _id_A5A4::_id_079C( "rescued", ::rescued_start, &"STARTS_RESCUED" );
    _id_A5A4::_id_079C( "tower", ::tower_start, &"STARTS_TOWER" );
    _id_A5A4::_id_079C( "fense", ::fense_start, &"STARTS_FENSE" );
    _id_A5A4::_id_079C( "base", ::base_start, &"STARTS_BASE" );
    _id_A5A4::_id_079C( "base2", ::base2_start, &"STARTS_BASE2" );
    _id_A5A4::_id_079C( "launch", ::launch_start, &"STARTS_LAUNCH" );
    precachemodel( "wpn_h1_melee_combat_knife_vm" );
    precacheitem( "m4m203_silencer_reflex" );
    precacheitem( "m4m203_silencer" );
    precacheitem( "usp_silencer" );
    precachemodel( "com_powerline_tower_destroyed" );
    precachemodel( "com_flashlight_on" );
    precachemodel( "weapon_parabolic_knife" );
    precachemodel( "com_spray_can01" );
    precachemodel( "prop_flex_cuff" );
    precachemodel( "prop_flex_cuff_obj" );
    precachemodel( "com_folding_chair" );
    precachemodel( "weapon_c4" );
    precachemodel( "weapon_c4_obj" );
    precachestring( &"ICBM_GRIGGSUSETRIGGER" );
    precachestring( &"ICBM_LOCATE_SSGTGRIGGS" );
    precachestring( &"ICBM_DESTROY_THE_POWER_TRANSMISSION" );
    precachestring( &"ICBM_REGROUP_WITH_SECOND_SQUAD" );
    precachestring( &"ICBM_PLANT_C4_ON_TOWER_LEGS" );
    precachestring( &"ICBM_GET_TO_A_SAFE_DISTANCE" );
    precachestring( &"ICBM_MISSIONFAIL_ICBM_CHOPPERS_SHOT" );
    _id_A5A4::_id_0764( "one_more_c4", &"ICBM_ONE_MORE_C4", undefined );
    _func_0D6( "r_reactiveMotionWindAmplitudeScale", 3 );
    _func_0D6( "r_reactiveMotionWindStrength", 1 );
    _func_0D6( "r_reactiveMotionWindFrequencyScale", 3 );
    _func_0D6( "r_reactiveMotionWindAreaScale", 33.3 );
    _func_0D6( "r_reactiveMotionHelicopterRadius", 1000 );
    _func_0D6( "r_reactiveMotionHelicopterStrength", 5 );
    _func_0D6( "r_lodFOVScaleOverride", 1 );
    _func_0D6( "r_lodFOVScaleOverrideAmount", 0.85 );
    _func_0D6( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    _func_0D6( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    _func_0D6( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    _func_0D6( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacherumble( "generic_ambient_loop" );
    precacherumble( "generic_quake_loop" );
    precacherumble( "generic_attack_heavy_2000" );
    precacherumble( "generic_attack_heavy_1000" );
    precacherumble( "generic_attack_medium_500" );
    precacherumble( "generic_attack_medium_1000" );
    maps\icbm_precache::main();
    _id_A5A8::build_aianims_with_classname( "script_vehicle_uaz_hardtop_destructible", maps\icbm_anim::uaz_overrides, maps\icbm_anim::uaz_vehicle_overrides );
    setup_bm21_deathanim();
    maps\icbm_fx::main();
    maps\createfx\icbm_audio::main();
    _id_A550::_id_7E9E( "viewhands_player_sas_woodland" );
    animscripts\dog\dog_init::_id_4DAB();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_ak74u_clip";
    level.weaponclipmodels[2] = "weapon_saw_clip";
    level.weaponclipmodels[3] = "weapon_m16_clip";
    level.weaponclipmodels[4] = "weapon_mp5_clip";
    level.weaponclipmodels[5] = "weapon_m14_clip";
    level.weaponclipmodels[6] = "weapon_g36_clip";
    level.towerblastradius = 384;
    level._id_2235 = [];
    level._id_2235["180"] = _func_0B7( 180 );
    level.minbmpexplosiondmg = 50;
    level.maxbmpexplosiondmg = 100;
    level.bmpcannonrange = 2048;
    level.bmpmgrange = 850;
    level.bmpmgrangesquared = level.bmpmgrange * level.bmpmgrange;
    level.playervehicledamagerange = 256;
    level.playervehicledamagerangesquared = level.playervehicledamagerange * level.playervehicledamagerange;
    level.playerisinside = 0;
    maps\createart\icbm_art::main();
    thread common_scripts\_pipes::main();
    _id_A550::main();
    _id_A55E::main();
    maps\icbm_anim::anim_main();
    maps\icbm_lighting::main();
    maps\icbm_aud::main();
    maps\_breach_explosive_left::main();
    _id_A516::main();
    maps\_c4::main();
    level._id_277F = 512;
    maps\_stealth_logic::stealth_init();
    maps\_stealth_behavior::main();
    var_0 = 1024;
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["alert"] = var_0;
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["hidden"] = var_0;
    _func_0D6( "ai_eventDistDeath", level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["hidden"] );
    level thread maps\icbm_amb::main();
    _id_A51D::_id_8324( "compass_map_icbm" );
    createthreatbiasgroup( "dogs" );
    createthreatbiasgroup( "icbm_friendlies" );
    level._id_0318 thread maps\_stealth_logic::stealth_ai();
    setignoremegroup( "icbm_friendlies", "dogs" );
    setignoremegroup( "dogs", "icbm_friendlies" );
    common_scripts\utility::_id_383D( "first_obj" );
    common_scripts\utility::_id_383D( "price_ready" );
    common_scripts\utility::_id_383D( "intro_dialog_done" );
    common_scripts\utility::_id_383D( "regroup01_done" );
    common_scripts\utility::_id_383D( "landed" );
    common_scripts\utility::_id_383D( "truck_spotted" );
    common_scripts\utility::_id_383D( "add_driveway" );
    common_scripts\utility::_id_383D( "driveway_done" );
    common_scripts\utility::_id_383D( "bldg1_grigs_todo" );
    common_scripts\utility::_id_383D( "sound alarm" );
    common_scripts\utility::_id_383D( "truck arived" );
    common_scripts\utility::_id_383D( "contacts_in_the_woods" );
    common_scripts\utility::_id_383D( "enter_basement" );
    common_scripts\utility::_id_383D( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383D( "price_house2_door_anim_complete" );
    common_scripts\utility::_id_383D( "knife_sequence_starting" );
    common_scripts\utility::_id_383D( "knife_sequence_done" );
    common_scripts\utility::_id_383D( "beehive1_active" );
    common_scripts\utility::_id_383D( "house1_cleared" );
    common_scripts\utility::_id_383D( "clear_bldg1_done" );
    common_scripts\utility::_id_383D( "beehive2_active" );
    common_scripts\utility::_id_383D( "outside_cleared" );
    common_scripts\utility::_id_383D( "start_interogation" );
    common_scripts\utility::_id_383D( "breach_ready_flag" );
    common_scripts\utility::_id_383D( "breach_started" );
    common_scripts\utility::_id_383D( "griggs_is_good" );
    common_scripts\utility::_id_383D( "grigs_todo" );
    common_scripts\utility::_id_383D( "attack_house2" );
    common_scripts\utility::_id_383D( "grigs_guys_dead" );
    common_scripts\utility::_id_383D( "breach_house02_done" );
    common_scripts\utility::_id_383D( "ready_for_breach" );
    common_scripts\utility::_id_383D( "courtyard_badguy01_dead" );
    common_scripts\utility::_id_383D( "hq_entered" );
    common_scripts\utility::_id_383D( "price_ready_for_griggs_rescue" );
    common_scripts\utility::_id_383D( "griggs_loose" );
    common_scripts\utility::_id_383D( "house02_clear" );
    common_scripts\utility::_id_383D( "chopper_gone" );
    common_scripts\utility::_id_383D( "lights_on" );
    common_scripts\utility::_id_383D( "lights_off" );
    common_scripts\utility::_id_383D( "c4_planted" );
    common_scripts\utility::_id_383D( "tower_destroyed" );
    common_scripts\utility::_id_383D( "tower_blown" );
    common_scripts\utility::_id_383D( "cut_fence1" );
    common_scripts\utility::_id_383D( "cut_fence2" );
    common_scripts\utility::_id_383D( "area1_started" );
    common_scripts\utility::_id_383D( "area2_started" );
    common_scripts\utility::_id_383D( "unblock_path" );
    common_scripts\utility::_id_383D( "add_kill_bmp" );
    common_scripts\utility::_id_383D( "flankers2_dead" );
    common_scripts\utility::_id_383D( "bmp_fire" );
    common_scripts\utility::_id_383D( "bmp_dead" );
    common_scripts\utility::_id_383D( "in_last_bldg" );
    common_scripts\utility::_id_383D( "kill_area01_spawners" );
    common_scripts\utility::_id_383D( "kill_area02_spawners" );
    common_scripts\utility::_id_383D( "spawn_second_sqaud" );
    common_scripts\utility::_id_383D( "fire_missile" );
    common_scripts\utility::_id_383D( "launch_01" );
    common_scripts\utility::_id_383D( "launch_02" );
    common_scripts\utility::_id_383D( "start_launch_scene" );
    common_scripts\utility::_id_383D( "lift_off_scene_done" );
    common_scripts\utility::_id_383D( "meetup_todo" );
    common_scripts\utility::_id_383D( "level_done" );
    common_scripts\utility::_id_383D( "move_to_house02_breach" );
    common_scripts\utility::_id_383D( "music_endon_start_rescue" );
    common_scripts\utility::_id_383D( "music_endon_tower_approach" );
    common_scripts\utility::_id_383D( "music_endon_tower_collapse" );
    common_scripts\utility::_id_383D( "music_endon_oldbase_entered" );
    common_scripts\utility::_id_383D( "gm5_reached_end_anim" );
    common_scripts\utility::_id_383D( "price_reached_end_anim" );
    common_scripts\utility::_id_383D( "second_fight_started" );
    common_scripts\utility::_id_383D( "third_fight_started" );
    common_scripts\utility::_id_383D( "dialog_holdfire_done" );
    common_scripts\utility::_id_383D( "objective_regroup_complete" );
    common_scripts\utility::_id_383D( "soap_take_look" );
    common_scripts\utility::_id_383D( "run_to_gate" );
    common_scripts\utility::_id_383D( "aa_base_fight" );
    common_scripts\utility::_id_383D( "get_yer_ass" );
    var_1 = getentarray( "price", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\_stealth_logic::_id_3A66 );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\icbm_code::price_think );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_2 = getentarray( "mark", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, maps\icbm_code::griggs_think );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_3 = getentarray( "gaz", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, maps\_stealth_logic::_id_3A66 );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, maps\icbm_code::gaz_think );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_4 = getentarray( "friendly", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, maps\_stealth_logic::_id_3A66 );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, maps\icbm_code::friendly_think );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_5 = getentarray( "respawned_friendly", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_0798, maps\_stealth_logic::_id_3A66 );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_0798, maps\icbm_code::respawned_friendly_think );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_0798, maps\icbm_code::set_threatbias_group, "icbm_friendlies" );
    var_6 = getentarray( "truck_guys", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_6, _id_A5A4::_id_0798, maps\icbm_code::truck_guys_think );
    level notify( "setup_initial_level_lighting" );
    level thread _id_6302();
    level thread maps\icbm_code::missile_launch01();
    level thread maps\icbm_code::missile_launch02();
    level thread maps\icbm_code::tower_collapse();
    var_7 = getentarray( "patroller", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\icbm_code::attach_flashlight, 1, 1 );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\icbm_code::detach_flashlight_onspotted );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\icbm_code::ignoreme_till_close );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\icbm_dialog::dialog_contacts_in_the_woods );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\icbm_dialog::dialog_tango_down );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, maps\icbm_code::woods_patroller_think );
    var_8 = getentarray( "stealth_idles", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_0798, maps\_stealth_logic::stealth_ai );
    common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_0798, maps\icbm_code::idle_anim_think );
    common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_0798, maps\icbm_code::ignoreme_till_stealth_broken );
    var_9 = getentarray( "second_squad_talker", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_9, _id_A5A4::_id_0798, maps\icbm_code::second_squad_talker_think );
    var_10 = getentarray( "base_fight_dogs", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_10, _id_A5A4::_id_0798, maps\icbm_code::set_threatbias_group, "dogs" );
    var_11 = getentarray( "no_sight_brush", "targetname" );
    common_scripts\utility::_id_0D13( var_11, maps\icbm_code::clip_nosight_logic );
    var_12 = getentarray( "first_fight_guys", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_12, _id_A5A4::_id_0798, ::first_fight_counter );
    var_13 = getentarray( "third_fight_counter", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_13, _id_A5A4::_id_0798, ::third_fight_counter );
    maps\icbm_code::remove_vehicle_delete_trigger( "delete_choppers1" );
    maps\icbm_code::remove_vehicle_delete_trigger( "delete_choppers2" );
    maps\icbm_code::remove_vehicle_delete_trigger( "delete_choppers3" );
    var_14 = getentarray( "sound_fade_then_delete", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_14, maps\icbm_code::sound_fade_then_delete );
    thread _id_A5A4::ai_team_run_twitch_think( "allies", "intro_dialog_done", undefined, "landed", undefined );
    wait 0.05;
    var_15 = [];
    var_15["prone"] = 512;
    var_15["crouch"] = 600;
    var_15["stand"] = 1024;
    var_16 = [];
    var_16["prone"] = 512;
    var_16["crouch"] = 900;
    var_16["stand"] = 1500;
    thread maps\_stealth_logic::_id_8DB9( var_15, var_16, undefined );
}
#using_animtree("vehicles");

setup_bm21_deathanim()
{
    var_0 = level._id_9F56;
    var_1 = level._id_9F7B;
    var_2 = level._id_9F54;
    level._id_9F56 = "vehicle_bm21_mobile_cover_no_bench";
    level._id_9F7B = "bm21_troops";
    level._id_9F54 = "script_vehicle_bm21_mobile_cover_no_bench";
    _id_A5A8::_id_1845( "vehicle_bm21_mobile_cover_no_bench", "vehicle_bm21_mobile_bed_dstry" );
    var_3 = spawnstruct();
    var_3._id_0C7A = [];
    var_3._id_0C7A[var_3._id_0C7A.size] = %vehicle_80s_sedan1_destroy;
    var_3.delay_crash = 1;
    var_3.need_dummy = 1;
    _id_A5A8::_id_1841( var_3 );
    level._id_9F56 = var_0;
    level._id_9F7B = var_1;
    level._id_9F54 = var_2;
}

_id_6302()
{
    common_scripts\utility::_id_384A( "first_obj" );
    var_0 = getent( "obj_grigsby", "targetname" );
    objective_add( 2, "active", &"ICBM_LOCATE_SSGTGRIGGS", var_0._id_02E2 );
    objective_current( 2 );
    var_1 = getent( "house01_basement_door_model", "targetname" );
    objective_position( 2, var_1._id_02E2 + ( 50, 33, 0 ) );
    common_scripts\utility::_id_384A( "price_basement_door_anim_complete" );
    objective_position( 2, ( 0, 0, 0 ) );
    common_scripts\utility::_id_384A( "soap_take_look" );
    var_2 = getent( "house02_front_door", "targetname" );
    objective_position( 2, var_2._id_02E2 + ( 64, 51, 0 ) );
    common_scripts\utility::_id_384A( "price_house2_door_anim_complete" );
    objective_position( 2, var_0._id_02E2 );
    common_scripts\utility::_id_384A( "griggs_loose" );
    objective_state( 2, "done" );
    common_scripts\utility::_id_384A( "griggs_is_good" );
    var_0 = getent( "obj_tower", "targetname" );
    objective_add( 3, "active", &"ICBM_DESTROY_THE_POWER_TRANSMISSION", var_0._id_02E2 );
    objective_current( 3 );
    common_scripts\utility::_id_384A( "tower_destroyed" );
    objective_state( 3, "done" );
    common_scripts\utility::_id_384A( "tower_blown" );
    var_0 = getent( "second_squad", "targetname" );
    objective_add( 4, "active", &"ICBM_REGROUP_WITH_SECOND_SQUAD", var_0._id_02E2 );
    objective_current( 4 );
    common_scripts\utility::_id_384A( "objective_regroup_complete" );
    objective_state( 4, "done" );
}

landed_start()
{
    _id_A5E8::_id_870C( "start_landed_checkpoint" );
    var_0 = getentarray( "chute_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    var_1 = getent( "landed_start", "targetname" );
    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( var_1.angles );
    common_scripts\utility::_id_383F( "landed" );
    wait 0.5;
    landed_to_basement_handler();
}

landed_to_basement_handler()
{
    level.truckguys = [];
    var_0 = getent( "truck_spawn", "targetname" );
    _id_A5A4::_id_070A( "start_colors" );
    _id_A5A4::_id_2AE8( "start_colors" );

    if ( 0 )
        thread maps\icbm_code::min_spec_kill_fx();
    else
        level thread maps\icbm_fx::playereffect();

    _id_A5A4::_id_1332( "allies" );
    var_0 thread maps\icbm_code::truck_setup();
    var_0 thread maps\icbm_dialog::dialog_enemy_vehicle();
    thread maps\icbm_code::make_friendies_cqb();
    thread maps\icbm_code::make_friendies_deadly();
    thread maps\icbm_code::make_friendies_ignored();
    thread maps\icbm_code::disable_ignoreme_on_stealth_spotted();
    common_scripts\utility::_id_0D13( level.friendlies, maps\icbm_code::friendlies_stop_on_truck_spotted );
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "_stealth_spotted", maps\icbm_code::stop_make_friendies_ignored );

    if ( getdvarint( "use_old_intro" ) == 1 )
        maps\icbm_dialog::dialog_intro();
    else
        maps\icbm_dialog::dialog_intro_h1();

    common_scripts\utility::_id_383F( "first_obj" );
    _id_A5A4::_id_1143( "moveout02" );

    if ( !common_scripts\utility::_id_382E( "truckguys dead" ) && !common_scripts\utility::_id_382E( "spawned_woods_patrol" ) )
        _id_A5A4::_id_070A( "friendlies_moves_up_the_hill" );

    common_scripts\utility::_id_384A( "truckguys dead" );
    maps\icbm_dialog::dialog_ambush_finished();
    thread maps\icbm_code::friendlies_start_paths();
    common_scripts\utility::_id_384A( "spawned_woods_patrol" );
    common_scripts\utility::_id_0D13( level.friendlies, maps\icbm_code::friendlies_stop_paths_to_fight );
    common_scripts\utility::_id_384A( "patrollers_dead" );
    maps\icbm_code::disable_friendly_deadlyness();
    wait 4;
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "allclear" );
    common_scripts\utility::_id_384A( "close_to_basement" );
    thread maps\icbm_dialog::dialog_check_houses();
    thread basement_to_house1_handler();
}

basement_start()
{
    _id_A5E8::_id_870C( "start_basement_checkpoint" );
    var_0 = getentarray( "basement_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    var_1 = getent( "basement_start", "targetname" );
    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( var_1.angles );
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "landed" );
    _id_A5A4::_id_070A( "basement_door_nodes" );
    thread maps\icbm_lighting::skip_to_sunrise2();
    wait 1;
    basement_to_house1_handler();
}

basement_to_house1_handler()
{
    _id_A5A4::_id_1332( "allies" );
    thread maps\icbm_code::beehive_wait();
    var_0 = _func_0C3( "price_basement_stack", "script_noteworthy" );
    var_1 = getent( "house01_basement_door", "targetname" );
    var_2 = getent( "house01_basement_door_model", "targetname" );
    var_2 _meth_804F( var_1 );
    maps\icbm_code::make_friendies_pushplayer( 1 );
    thread maps\icbm_code::price_gets_ready_to_open_door( var_0 );
    _id_A5E8::_id_870C( "first_house_mix" );
    common_scripts\utility::_id_384A( "open_basement" );

    while ( _func_0EE( level._id_3C61._id_02E2, level._id_6F7C._id_02E2 ) > 500 )
        wait 1;

    maps\icbm_code::price_opens_door( var_0, var_1, "price_basement_door_anim_complete" );
    level._id_6F7C _id_A5A4::_id_309A();
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["alert"] = 256;
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["hidden"] = 256;
    _func_0D6( "ai_eventDistDeath", level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["hidden"] );
    maps\icbm_code::make_friendies_pushplayer( 0 );
    maps\icbm_code::make_friendies_cqb();
    _id_A5A4::_id_070A( "price_basement_node" );
    common_scripts\utility::_id_384A( "price_basement_door_anim_complete" );
    _id_A5A4::_id_27EF( 1, _id_A5A4::_id_070A, "move_buddies_into_basement" );
    var_3 = getent( "spawn_house1_upstairs_guys", "targetname" );
    _id_A5A4::_id_070A( "spawn_house1_upstairs_guys" );
    var_3 common_scripts\utility::_id_97CC();
    thread maps\icbm_code::knife_kill_setup();
    common_scripts\utility::_id_384A( "knife_sequence_done" );
    _id_A5A4::_id_070A( "post_knife_kill_nodes" );
    thread maps\icbm_dialog::dialog_post_knife_kill();
    thread friendlies_help_upstairs();
}

friendlies_help_upstairs()
{
    common_scripts\utility::_id_3852( "_stealth_spotted", "house1_upstairs_dead" );
    wait 4;
    _id_A5A4::_id_070A( "friendlies_help_upstairs" );

    if ( common_scripts\utility::_id_382E( "beehive1_active" ) )
    {
        common_scripts\utility::_id_384A( "beehive1_dead" );
        wait 1;
    }

    _id_A5A4::_id_070A( "gaz_check_rooms" );
    wait 1;
    common_scripts\utility::_id_383F( "house1_cleared" );
    thread house1_to_house2_handler();
}

house1_to_house2_handler()
{
    _id_A5A4::_id_980D( "gaz_checks_upstairs", "targetname" );
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "griggsnothere" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "regroupdownstairs" );
    var_0 = 1024;
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["alert"] = var_0;
    level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["hidden"] = var_0;
    _func_0D6( "ai_eventDistDeath", level._id_0669._id_5836.ai_event["ai_eventDistDeath"]["hidden"] );
    _id_A5A4::_id_070A( "house01_clear_regroup" );
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "copythat" );
    var_1 = _func_0C3( "price_open_door01_node", "script_noteworthy" );
    thread maps\icbm_code::price_gets_ready_to_open_door( var_1 );
    _id_A5A4::_id_980D( "price_open_door01_trigger", "targetname" );
    _id_A5A4::_id_1143( "leaving_house1" );
    thread maps\icbm_code::make_friendies_ignored();
    thread maps\icbm_code::disable_ignoreme_on_stealth_spotted();
    var_2 = getentarray( "outside_spawners", "targetname" );
    thread maps\icbm_code::friendlies_fighting_nodes();
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_88C3 );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "keepquiet" );
    var_3 = getent( "house01_front_door", "targetname" );
    var_4 = getent( "house01_front_door_model", "targetname" );
    var_4 _meth_804F( var_3 );
    maps\icbm_code::price_opens_door( var_1, var_3 );
    common_scripts\utility::_id_383F( "soap_take_look" );
    level._id_6F7C _id_A5A4::_id_309A();
    _id_A5A4::_id_070A( "price_front_door_node" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "takealook" );
    thread maps\icbm_code::beehive2_wait();
    common_scripts\utility::_id_384A( "outside_dead" );

    if ( common_scripts\utility::_id_382E( "beehive2_active" ) )
    {
        common_scripts\utility::_id_384A( "beehive2_dead" );
        wait 2;
    }

    common_scripts\utility::_id_383F( "outside_cleared" );
    thread house2_to_griggs_handler();
}

house2_start()
{
    _id_A5E8::_id_870C( "start_house2_checkpoint" );
    var_0 = getentarray( "house2_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    var_1 = getent( "house2_start", "targetname" );
    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( var_1.angles );
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383F( "soap_take_look" );
    common_scripts\utility::_id_383F( "landed" );
    common_scripts\utility::_id_383F( "house1_cleared" );
    common_scripts\utility::_id_383F( "outside_cleared" );
    thread maps\icbm_lighting::skip_to_sunrise2();
    wait 1;
    house2_to_griggs_handler();
}

house2_to_griggs_handler()
{
    _id_A5A4::_id_070A( "house2_door_nodes" );
    var_0 = _func_0C3( "price_open_door02_node", "script_noteworthy" );
    var_1 = getent( "house02_front_door", "targetname" );
    var_2 = getent( "house02_front_door_model", "targetname" );
    var_2 _meth_804F( var_1 );
    thread maps\icbm_code::price_gets_ready_to_open_door( var_0 );
    wait 3;
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "sunsup" );
    _id_A5A4::_id_980D( "price_open_house2_trigger", "targetname" ) maps\icbm_code::price_opens_door( var_0, var_1, "price_house2_door_anim_complete" );
    level._id_6F7C _id_A5A4::_id_309A();
    _id_A5A4::_id_070A( "house2_inside_nodes" );
    thread _id_A5A4::_id_2BC3( _id_A5A4::_id_980E, "gaz_h2_floor_clear", maps\icbm_dialog::dialog_proceed_upstairs );
    thread maps\icbm_code::start_interogation();
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "player_shooting_interogators", common_scripts\utility::_id_383F, "get_yer_ass" );
    var_3 = getentarray( "captured_griggs", "targetname" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, maps\icbm_code::captured_griggs_think );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_88C3 );
    thread rescue_breach_setup();
    thread rescue_sequence();
    thread griggs_to_flyover_handler();
}

rescue_breach_setup()
{
    var_0 = getent( "trigger_volume_room01", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    var_1 = getent( "start_breach", "targetname" );
    var_1 waittill( "trigger" );
    var_1 common_scripts\utility::_id_97CC();
    var_2 = getent( "doorknob4", "targetname" );
    var_3 = getent( var_2._id_04A4, "targetname" );
    var_2 _meth_804F( var_3 );
    var_4 = getent( "door_safehouse_livingroom_model", "targetname" );
    var_4 _meth_804F( var_3 );
    var_5 = getent( "volume_room01", "targetname" );
    var_6 = [];
    var_6 = common_scripts\utility::_id_07A5( var_6, level._id_6F7C );
    var_6 = common_scripts\utility::_id_07A5( var_6, level._id_3C61 );
    var_7 = "explosive_breach_left";
    var_5 thread _id_A516::_id_17AD( var_6, var_7 );
    var_5 waittill( "ready_to_breach" );
    maps\icbm_dialog::dialog_rescue_breach();
    common_scripts\utility::_id_384A( "get_yer_ass" );
    var_0 common_scripts\utility::_id_97CE();
    var_5 waittill( "detpack_detonated" );
    common_scripts\utility::_id_383F( "breach_started" );
    level.griggs thread fail_on_damage();
    level._id_3C61 _id_A5A4::_id_309A();
    level._id_6F7C _id_A5A4::_id_309A();
    _id_A5A4::_id_070A( "post_breach_nodes" );
    level._id_0318 _meth_809C( "icbm_pri_gogogo" );
}

fail_on_damage()
{
    level endon( "griggs_loose" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( _func_1AD( var_1 ) )
            _id_A536::_id_5CDD();
    }
}

rescue_sequence()
{
    common_scripts\utility::_id_384A( "breach_started" );
    common_scripts\utility::_id_384A( "interogators_dead" );
    _id_A5A4::_id_1143( "house02_clear" );
    thread maps\icbm_code::disable_friendly_deadlyness();
    thread maps\icbm_dialog::dialog_rescue();

    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
        _id_A5A4::_id_980D( "player_is_behind_griggs", "targetname" );
    else
        level._id_0318 thread disable_weapon_when_near_griggs();

    var_0 = getent( "grigs_use_trigger", "targetname" );
    var_0 thread player_cut_grigs_loose();
    common_scripts\utility::_id_384A( "griggs_loose" );
    common_scripts\utility::_id_384A( "griggs_is_good" );
    maps\icbm_code::all_friendlies_turn_blue();
    _id_A51C::assign_nodes_intelligently_for_team( "allies", 1 );
    _id_A5A4::_id_070A( "griggs_loose_nodes" );
    wait 0.5;
    level.griggs._id_020C = 100;
    level.griggs _id_A5A4::_id_2A8D();
}

disable_weapon_when_near_griggs()
{
    var_0 = 0;

    while ( !common_scripts\utility::_id_382E( "griggs_loose" ) )
    {
        if ( !var_0 && _func_0F0( level._id_0318._id_02E2, level.griggs._id_02E2 ) < 15000 )
        {
            level._id_0318 _meth_831A();
            var_0 = 1;
        }
        else if ( var_0 && _func_0F0( level._id_0318._id_02E2, level.griggs._id_02E2 ) > 15000 )
        {
            level._id_0318 _meth_831B();
            var_0 = 0;
        }

        waittillframeend;
    }

    level._id_0318 _meth_831B();
}

allow_free_griggs_when_looking_in_position()
{
    var_0 = _func_0B7( 30 );

    for (;;)
    {
        waittillframeend;
        var_1 = common_scripts\utility::_id_A347( level._id_0318 _meth_80AA(), level._id_0318 _meth_8338(), level.griggs._id_02E2, var_0 );

        if ( ( var_1 || level._id_0318 _meth_812D( level.griggs ) ) && level._id_0318 _meth_80AB( self ) && !level._id_0318 _meth_8462() )
        {
            self _meth_80DD( &"ICBM_GRIGGSUSETRIGGER" );

            if ( level._id_0318 _meth_8339() )
            {
                self notify( "griggs_trigger_used" );
                break;
            }

            continue;
        }

        self _meth_80DD( " " );
    }
}

player_cut_grigs_loose()
{
    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
    {
        self _meth_817F();
        self _meth_80DD( &"ICBM_GRIGGSUSETRIGGER" );
        self waittill( "trigger" );
    }
    else
    {
        common_scripts\utility::_id_384A( "price_ready_for_griggs_rescue" );
        thread allow_free_griggs_when_looking_in_position();
        self waittill( "griggs_trigger_used" );
    }

    common_scripts\utility::_id_97CC();

    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
    {
        common_scripts\utility::_id_383F( "griggs_loose" );
        level.griggs_node thread _id_A510::_id_0C24( level.griggs, "grigsby_rescue" );
    }
    else
    {
        thread h1_cutgriggsloose_dof();
        level._id_0318 _meth_811D( 0 );
        level._id_0318 _meth_811B( 0 );
        level._id_0318 _meth_811C( 0 );
        level.player_rescue_model = _id_A5A4::_id_88D1( "player_rescue_griggs_model" );
        level.player_rescue_model._id_02E2 = level.griggs_node._id_02E2;
        level.player_rescue_model.angles = level.griggs_node.angles;
        level.player_rescue_model _meth_8056();
        var_0 = spawn( "script_model", level.player_rescue_model _meth_8184( "tag_weapon" ) );
        var_0 _meth_80B3( "wpn_h1_melee_combat_knife_vm" );
        var_0.angles = level.player_rescue_model _meth_8185( "tag_weapon" );
        var_0 _meth_804F( level.player_rescue_model, "tag_weapon" );
        level.griggs_node _id_A510::_id_0BC7( level.player_rescue_model, "grigsby_rescue_player" );
        level.player_rescue_model _id_A5A4::_id_5696( "tag_player", 0.5, 1, 0, 0, 0, 0 );
        level._id_0318 _meth_807F( level.player_rescue_model, "tag_player", 1, 0, 0, 0, 0, 1 );
        level.player_rescue_model _meth_8055();
        level.griggs_node thread _id_A510::_id_0C24( level.player_rescue_model, "grigsby_rescue_player" );
        level.griggs_node notify( "stop_idle" );
        level.griggs_node thread _id_A510::_id_0C24( level.griggs, "grigsby_rescue" );
        level.griggs_node notify( "stop_price_idle" );
        level.griggs_node thread _id_A510::_id_0C24( level._id_6F7C, "grigsby_rescue_price" );
        level.player_rescue_model waittillmatch( "single anim", "end" );
        var_0 delete();
        level.player_rescue_model delete();
        level._id_0318 _meth_811D( 1 );
        level._id_0318 _meth_811B( 1 );
        level._id_0318 _meth_811C( 1 );
        common_scripts\utility::_id_383F( "griggs_loose" );
    }

    level.griggs waittillmatch( "single anim", "end" );
    waitframe;
    level.griggs _meth_8143();
    level.griggs _id_A5A4::_id_38AC();
    common_scripts\utility::_id_383F( "griggs_is_good" );
}

h1_cutgriggsloose_dof()
{
    level._id_0318 _meth_84A7( 16, 28, 9.0, 9.0 );
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 4.4, 15, 1.0, 1.0 );
    wait 1.35;
    level._id_0318 _meth_84A7( 4.4, 14, 3.0, 3.0 );
    wait 0.5;
    level._id_0318 _meth_84A7( 3.4, 28, 2.0, 2.0 );
    wait 1.0;
    level._id_0318 _meth_84A7( 16, 200, 2.0, 2.0 );
    wait 1.35;
    level._id_0318 _meth_84A6();
}

rescued_start()
{
    _id_A5E8::_id_870C( "start_rescued_checkpoint" );
    var_0 = getentarray( "rescue_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    var_1 = getent( "rescue_start", "targetname" );
    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( var_1.angles );
    thread maps\icbm_lighting::skip_to_sunrise2();
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383F( "soap_take_look" );
    common_scripts\utility::_id_383F( "price_house2_door_anim_complete" );
    common_scripts\utility::_id_383F( "griggs_loose" );
    common_scripts\utility::_id_383F( "griggs_is_good" );
    common_scripts\utility::_id_383F( "landed" );
    common_scripts\utility::_id_383F( "house1_cleared" );
    common_scripts\utility::_id_383F( "outside_cleared" );
    common_scripts\utility::_id_383F( "headed_for_tower" );
    wait 1;
    _id_A5A4::_id_070A( "friendlies_at_tower" );
    thread griggs_to_flyover_handler();
}

griggs_to_flyover_handler()
{
    common_scripts\utility::_id_384A( "headed_for_tower" );
    maps\icbm_lighting::set_global_sunrise2();
    thread maps\icbm_dialog::dialog_blow_up_tower();
    common_scripts\utility::_id_384A( "player_in_chopper_area" );
    common_scripts\_exploder::_id_3528( 8 );
    var_0 = getentarray( "mi_17_01", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\icbm_code::chopper_fail_mission );
    _id_A5A4::_id_070A( "choppers" );
    _id_A5E8::_id_870C( "start_tower_first_choppers_fly_by" );
    _id_A5A4::_id_1143( "chopper_flyover" );
    thread maps\icbm_code::first_chopper_fly_over();
    common_scripts\utility::_id_384A( "chopper_gone" );
    thread flyover_to_tower_handler();
}

tower_start()
{
    _id_A5E8::_id_870C( "start_tower_checkpoint" );
    var_0 = getent( "tower_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "tower_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    thread maps\icbm_lighting::skip_to_sunrise2();
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "house1_cleared" );
    common_scripts\utility::_id_383F( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383F( "soap_take_look" );
    common_scripts\utility::_id_383F( "price_house2_door_anim_complete" );
    common_scripts\utility::_id_383F( "griggs_loose" );
    common_scripts\utility::_id_383F( "griggs_is_good" );
    wait 1;
    _id_A5A4::_id_070A( "friendlies_at_tower" );
    thread flyover_to_tower_handler();
}

dialog_plant_at_tower()
{
    wait 5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "Charlie_status" );
    wait 0.2;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "killthepower" );

    if ( !common_scripts\utility::_id_382E( "c4_planted" ) )
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "jackgriggsplant" );
}

flyover_to_tower_handler()
{
    var_0 = getent( "tower_c4", "targetname" );
    var_1 = getent( "tower_c4_2", "targetname" );
    var_2 = getent( "tower", "targetname" );
    var_2.multiple_c4 = 1;
    var_3 = var_2 maps\_c4::c4_location( "tag_origin", ( -185.75, -178, 57.87 ), ( 288, 270, 0 ) );
    var_4 = var_2 maps\_c4::c4_location( "tag_origin", ( 184.3, -178.1, 57.9 ), ( 288, 270, 0 ) );
    _func_110( 3, &"ICBM_PLANT_C4_ON_TOWER_LEGS", 2 );
    objective_position( 3, var_0._id_02E2 );
    _func_112( 3, 1, var_1._id_02E2 );
    level thread maps\icbm_code::base_lights();
    level thread maps\icbm_code::base_fx_on();
    thread dialog_plant_at_tower();
    level waittill( "c4_in_place", var_5 );
    var_6 = 0;

    if ( var_4 == var_5 )
    {
        _func_112( 3, 0, ( 0, 0, 0 ) );
        var_6 = 1;
    }
    else
        _func_112( 3, 1, ( 0, 0, 0 ) );

    _func_110( 3, &"ICBM_PLANT_C4_ON_TOWER_LEGS", 1 );
    thread second_c4_plant_check();
    level waittill( "c4_in_place", var_5 );
    common_scripts\utility::_id_383F( "c4_planted" );
    var_7 = getent( "obj_get_clear", "targetname" );
    _func_112( 3, var_6, var_7._id_02E2 );
    _func_110( 3, &"ICBM_GET_TO_A_SAFE_DISTANCE" );
    level thread c4_set();
    var_2 waittill( "c4_detonation" );
    common_scripts\utility::_id_383F( "music_endon_tower_collapse" );
    common_scripts\utility::_id_383F( "tower_destroyed" );
    var_2 _meth_809C( "scn_icbm_tower_crash" );
    wait 2;
    common_scripts\utility::_id_383F( "lights_off" );
    common_scripts\utility::_id_3831( "lights_on" );
}

second_c4_plant_check()
{
    var_0 = 1;
    var_1 = 0;

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "c4_planted" ) )
            break;

        var_2 = level._id_0318 _meth_830F() != "c4";

        if ( var_0 != var_2 )
        {
            var_0 = var_2;
            level._id_0318 _meth_8133( var_0 );
        }

        if ( level._id_0318 _meth_833A() && !var_0 && gettime() > var_1 )
        {
            thread _id_A5A4::_id_48B0( &"ICBM_ONE_MORE_C4", 3 );
            var_1 = gettime() + 4000;
        }

        wait 0.05;
    }

    thread _id_A5A4::_id_48CB();
    level._id_0318 _meth_8133( 1 );
}

c4_set()
{
    _id_A5A4::_id_070A( "c4_planted" );
    level.griggs _id_A510::_id_0C21( level.griggs, "chargesset" );
    thread maps\icbm_dialog::dialog_jackson_do_it();
    common_scripts\utility::_id_384A( "tower_destroyed" );
    thread maps\icbm_code::tower_earthquakes();
    thread maps\icbm_code::tower_rumble();
    common_scripts\_exploder::_id_3528( 6 );
    wait 5;
    _id_A5A4::_id_070A( "move_to_watch" );
    wait 6;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "charlie_towersdown" );
    thread play_power_alarm();
    wait 0.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "breachingperimeter" );
    wait 0.5;
    level.griggs _id_A510::_id_0C21( level.griggs, "backuppower" );
    wait 0.4;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "standby" );
    wait 1;
    level.griggs _id_A510::_id_0C21( level.griggs, "fiveseconds" );
    wait 0.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "rallypoint" );
    _id_A5A4::_id_070A( "move_to_fence01" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "onourway" );
    common_scripts\utility::_id_383F( "tower_blown" );
    _id_A5A4::_id_1143( "tower_destroyed" );
    thread fense_to_base_handler();
    wait 0.5;
    common_scripts\utility::_id_383F( "lights_on" );
    common_scripts\utility::_id_3831( "lights_off" );
}

play_power_alarm()
{
    var_0 = getentarray( "emt_alarm_power_on", "targetname" );
    common_scripts\utility::_id_384A( "lights_on" );

    foreach ( var_2 in var_0 )
        var_2 thread common_scripts\utility::_id_697A( "h1_emt_alarm_power_on", var_2._id_02E2 );
}

fense_start()
{
    _id_A5E8::_id_870C( "start_fense_checkpoint" );
    var_0 = getent( "fense_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "fense_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    thread maps\icbm_lighting::skip_to_sunrise2();
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "house1_cleared" );
    common_scripts\utility::_id_383F( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383F( "soap_take_look" );
    common_scripts\utility::_id_383F( "price_house2_door_anim_complete" );
    common_scripts\utility::_id_383F( "griggs_loose" );
    common_scripts\utility::_id_383F( "griggs_is_good" );
    wait 1;
    _id_A5A4::_id_070A( "move_to_fence01" );
    thread fense_to_base_handler();
}

fense_to_base_heli_exploder()
{
    var_0 = getent( "move_to_oldbase01", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\_exploder::_id_3528( 7 );
}

fense_to_base_handler()
{
    thread maps\icbm_dialog::dialog_enemy_helicopters();
    thread fense_to_base_heli_exploder();
    thread time_to_split_up();
    var_0 = getent( "fence_cut", "targetname" );
    var_0 _id_A5A4::_id_0D61( "fence" );
    thread maps\icbm_dialog::dialog_get_fence_open();
    level.fence_cut_node = _func_0C3( "fence_cut_node", "targetname" );
    var_1 = [];
    var_1[var_1.size] = level.griggs;
    var_1[var_1.size] = level._id_3C61;
    thread griggs_reach_fence_spot_and_idle();
    thread gaz_reach_fence_spot_and_idle();
    level.griggs_at_fence = 0;
    level.gaz_at_fence = 0;

    while ( !level.griggs_at_fence || !level.gaz_at_fence )
        wait 0.05;

    level.fence_cut_node thread _id_A510::_id_0C24( var_0, "model_cut" );
    level.griggs _id_A5A4::_id_309A();
    level._id_3C61 _id_A5A4::_id_309A();
    level.fence_cut_node _id_A510::_id_0C18( var_1, "icbm_fence_cutting_guys" );
    var_2 = getent( "fence01_clip", "targetname" );
    var_2 _meth_805A();
    var_2 delete();
    var_3 = getent( "fence01_weap_clip", "targetname" );
    var_3 delete();
    common_scripts\utility::_id_383F( "cut_fence1" );
    _id_A5A4::_id_070A( "fence01_moveout" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "move" );
    thread base_handler();
}

griggs_reach_fence_spot_and_idle()
{
    level.fence_cut_node _id_A510::anim_reach_and_arrive_facing_anim_solo( level.griggs, "icbm_fence_cutting_guys" );
    level.griggs _id_A5A4::_id_7E4D( level.griggs._id_02E2 );
    level.griggs_at_fence = 1;
    var_0 = spawn( "script_origin", level.griggs._id_02E2 );
    var_0.angles = level.griggs.angles;
    var_0 _id_A510::_id_0BCE( level.griggs, "fence_stand_idle" );
}

gaz_reach_fence_spot_and_idle()
{
    level.fence_cut_node _id_A510::anim_reach_and_arrive_facing_anim_solo( level._id_3C61, "icbm_fence_cutting_guys" );
    level.gaz_at_fence = 1;
    level._id_3C61 _id_A5A4::_id_7E4D( level._id_3C61._id_02E2 );
    var_0 = spawn( "script_origin", level._id_3C61._id_02E2 );
    var_0.angles = level._id_3C61.angles;
    var_0 _id_A510::_id_0BCE( level._id_3C61, "fence_stand_idle" );
}

time_to_split_up()
{
    _id_A5A4::_id_980D( "time_to_split_up", "targetname" );
    level._id_6F7C _id_A5A4::_id_7E38( "p" );
    level.griggs _id_A5A4::_id_7E38( "p" );
    common_scripts\utility::_id_383F( "music_endon_oldbase_entered" );
    _func_076( 10 );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "scoutthrough" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "alternateroute" );
}

base_start()
{
    _id_A5E8::_id_870C( "start_base_checkpoint" );
    thread maps\icbm_lighting::skip_to_sunrise3();
    var_0 = getent( "base_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "base_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383F( "soap_take_look" );
    common_scripts\utility::_id_383F( "price_house2_door_anim_complete" );
    common_scripts\utility::_id_383F( "griggs_loose" );
    common_scripts\utility::_id_383F( "griggs_is_good" );
    common_scripts\utility::_id_383F( "tower_blown" );
    thread base_handler();
}

base2_start()
{
    _id_A5E8::_id_870C( "start_base2_checkpoint" );
    thread maps\icbm_lighting::skip_to_sunrise3();
    var_0 = getent( "base2_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "base2_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383F( "soap_take_look" );
    common_scripts\utility::_id_383F( "price_house2_door_anim_complete" );
    common_scripts\utility::_id_383F( "griggs_loose" );
    common_scripts\utility::_id_383F( "griggs_is_good" );
    common_scripts\utility::_id_383F( "tower_blown" );
    thread base_handler();
    wait 0.1;
    _id_A5A4::_id_070A( "fence02_moveout" );
}

base_handler()
{
    _id_A5A4::_id_1333( "allies" );
    _id_A5A4::_id_1333( "axis" );
    level.first_fight_counter = 0;
    level.third_fight_counter = 0;
    common_scripts\utility::_id_383F( "aa_base_fight" );
    _id_A5A4::_id_980D( "fence02_moveout", "targetname" );
    thread maps\icbm_dialog::dialog_rpgs_on_rooftops();
    thread maps\icbm_dialog::dialog_rpgs_on_rooftops2();
    thread maps\icbm_dialog::dialog_choppers_dropping();
    thread maps\icbm_dialog::dialog_first_fight_clear_and_move();
    thread maps\icbm_dialog::dialog_second_fight_clear_and_move();
    thread trucks_incoming();
    _id_A5E8::_id_870C( "start_base_choppers_heli_drop" );
    _id_A5A4::_id_980D( "fastrope_spawn2", "targetname" );
    common_scripts\utility::_id_383F( "second_fight_started" );
    _id_A5A4::_id_980D( "second_fight_friendly_nodes", "targetname" );
    common_scripts\utility::_id_383F( "third_fight_started" );
    common_scripts\utility::_id_384A( "price_and_griggs_return" );
    var_0 = getent( "price_returns", "targetname" );
    level._id_6F7C _meth_81C9( var_0._id_02E2, var_0.angles );
    var_1 = getent( "griggs_returns", "targetname" );
    level.griggs _meth_81C9( var_1._id_02E2, var_1.angles );
    level._id_6F7C _id_A5A4::_id_7E38( "b" );
    level.griggs _id_A5A4::_id_7E38( "b" );
    thread base_to_second_squad_handler();
}

first_fight_counter()
{
    self waittill( "death" );
    level.first_fight_counter++;

    if ( level.first_fight_counter == 6 )
    {
        var_0 = getent( "roortop_guys_spawner", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::_id_97CC();
    }

    if ( level.first_fight_counter == 10 )
    {
        var_0 = getent( "fastrope_spawn", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::_id_97CC();
    }

    if ( level.first_fight_counter == 15 )
    {
        var_0 = getent( "first_first_end_spawner", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::_id_97CC();
    }
}

third_fight_counter()
{
    self waittill( "death" );
    level.third_fight_counter++;

    if ( level.third_fight_counter == 10 )
    {
        var_0 = getent( "dog_spawner", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::_id_97CC();
    }

    if ( level.third_fight_counter == 12 )
    {
        var_0 = getent( "second_fight_end_group", "targetname" );
        var_0 notify( "trigger" );
        var_0 common_scripts\utility::_id_97CC();
    }
}

trucks_incoming()
{
    _id_A5A4::_id_980D( "incoming_oldbase", "targetname" );
    _id_A5E8::_id_870C( "aud_start_bm21_scripted_sfx" );
    _id_A5A4::_id_1143( "trucks_incoming" );
    level._id_0318 _meth_809C( "icbm_gm5_3trucks" );
}

base_to_second_squad_handler()
{
    common_scripts\utility::_id_384A( "play_leaving_base" );
    _id_A5A4::_id_1332( "allies" );
    common_scripts\utility::_id_3831( "aa_base_fight" );
    _id_A5A4::_id_1143( "leave_base" );
    maps\icbm_code::make_friendies_not_cqb();
    var_0 = getent( "emt_alarm_missile_launch", "targetname" );
    var_0 thread common_scripts\utility::_id_69C2( "emt_alarm_missile_launch", var_0._id_02E2 );
    common_scripts\utility::_id_384A( "on_road" );
    maps\icbm_code::_id_5308();
    thread meet_second_squad_handler();
}

launch_start()
{
    _id_A5E8::_id_870C( "start_launch_checkpoint" );
    thread maps\icbm_lighting::skip_to_sunrise3();
    var_0 = getent( "launch_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "launch_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_383F( "first_obj" );
    common_scripts\utility::_id_383F( "price_basement_door_anim_complete" );
    common_scripts\utility::_id_383F( "soap_take_look" );
    common_scripts\utility::_id_383F( "price_house2_door_anim_complete" );
    common_scripts\utility::_id_383F( "griggs_loose" );
    common_scripts\utility::_id_383F( "griggs_is_good" );
    common_scripts\utility::_id_383F( "tower_blown" );
    common_scripts\utility::_id_383F( "lift_off" );
    wait 1;
    thread meet_second_squad_handler();
}

meet_second_squad_handler()
{
    var_0 = _func_0C3( "end_scene_node", "targetname" );
    _id_A5A4::_id_070A( "base_clear_moveout" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 thread maps\icbm_code::anim_reach_and_approach_solo_set_flag( level._id_6F7C, "icbm_end_price", "price_reached_end_anim" );
    else
    {
        var_0 thread maps\icbm_code::anim_reach_solo_set_flag( level._id_6F7C, "icbm_end_price_idle", "price_reached_end_anim" );
        thread final_anim_price_idle( var_0 );
    }

    level thread missile_launch();
    level._id_250D["allies"]["r"] = undefined;
    var_1 = getentarray( "second_squad_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, _id_A5A4::_id_58D7 );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    _id_A5A4::_id_980D( "buddies_at_launch", "targetname" );
    common_scripts\utility::_id_384A( "lift_off" );
    _func_076( 0.5 );
    thread dialog_treeline_hold_fire();
    wait 1;
    _id_A5A4::_id_6008( "icbm_launch_music" );
    _id_A5A4::_id_070A( "second_squad_trigger" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 thread maps\icbm_code::anim_reach_and_approach_solo_set_flag( level.gm5, "icbm_end_sniper", "gm5_reached_end_anim" );
    else
        var_0 thread maps\icbm_code::anim_reach_solo_set_flag( level.gm5, "icbm_end_sniper", "gm5_reached_end_anim" );

    common_scripts\utility::_id_384A( "dialog_holdfire_done" );
    common_scripts\utility::_id_384A( "gm5_reached_end_anim" );
    common_scripts\utility::_id_384A( "price_reached_end_anim" );
    thread final_anim_then_run_off( var_0 );
    common_scripts\utility::_id_383F( "start_launch_scene" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        level.gm5 _id_A510::_id_0C21( level.gm5, "goodtosee" );

    level._id_6F7C _id_A5A4::_id_309A();
    level.gm5 _id_A5A4::_id_309A();
    _id_A5A4::_id_070A( "turn_us_around" );
}

final_anim_then_run_off( var_0 )
{
    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 thread _id_A510::_id_0BB5( level.gm5, "gravity", "icbm_end_sniper" );
    else
    {
        wait 0.8;
        var_0 thread _id_A510::_id_0C24( level.gm5, "icbm_end_sniper" );
    }

    if ( getdvarint( "use_old_endrun" ) != 1 )
        var_0 notify( "stop_price_idle" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        var_0 _id_A510::_id_0BB5( level._id_6F7C, "gravity", "icbm_end_price" );
    else
        var_0 _id_A510::_id_0C24( level._id_6F7C, "icbm_end_price" );

    _id_A5A4::_id_070A( "run_to_gate_uk" );
    _id_A5A4::_id_070A( "run_to_gate_us" );
    common_scripts\utility::_id_383F( "run_to_gate" );
}

final_anim_price_idle( var_0 )
{
    common_scripts\utility::_id_384A( "price_reached_end_anim" );

    if ( !common_scripts\utility::_id_382E( "gm5_reached_end_anim" ) )
        var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "icbm_end_price_idle", undefined, "stop_price_idle" );
}

dialog_treeline_hold_fire()
{
    level.gm5 _id_A510::_id_0C21( level.gm5, "treeline" );
    wait 1;
    common_scripts\utility::_id_383F( "objective_regroup_complete" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "americanteams" );
    common_scripts\utility::_id_383F( "dialog_holdfire_done" );
}

missile_sounds()
{
    level._id_0318 _meth_809C( "scn_icbm_missile_launch" );
    wait 4;
    var_0 = getent( "icbm_missile02", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "scn_icbm_missile1_loop" );
    wait 10;
    var_1 = getent( "icbm_missile01", "targetname" );
    var_1 thread common_scripts\utility::_id_6975( "scn_icbm_missile2_loop" );
}

missile_rumble()
{
    var_0 = [];
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 3.5, "generic_attack_heavy_2000" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 12.2, "generic_attack_heavy_2000" );
    level._id_0318 thread _id_A5A4::rumble_sequence_play( var_0, 0 );
    wait 2.1;
    level._id_0318 _meth_80B0( "generic_ambient_loop" );
    wait 15.7;
    level._id_0318 _meth_80B1( "generic_ambient_loop" );
}

missile_launch()
{
    common_scripts\utility::_id_384A( "start_launch_scene" );
    _id_A5E8::_id_870C( "start_missile_launch_mix" );
    thread missile_sounds();
    thread missile_rumble();
    wait 2;
    common_scripts\utility::_id_383F( "launch_02" );
    thread maps\icbm_lighting::launchvision();
    wait 4;
    level.griggs _id_A510::_id_0C21( level.griggs, "problemhere" );
    common_scripts\utility::_id_383F( "launch_01" );

    if ( getdvarint( "use_old_endrun" ) == 1 )
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "onemissile" );
    else
    {
        level._id_6F7C waittillmatch( "single anim", "dialog" );
        wait 3;
    }

    wait 1;
    level.griggs _id_A510::_id_0C21( level.griggs, "anotherone" );
    wait 1;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "twomissiles" );
    wait 0.5;
    level thread run_to_gate();
    level._id_6F7C._id_2B10 = 1;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "gettingabortcodes" );
    level._id_6F7C._id_2B10 = 0;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "rogerthat" );
}

run_to_gate()
{
    wait 3;
    wait 4;
    common_scripts\utility::_id_383F( "lift_off_scene_done" );
    wait 5;
    level.griggs _id_A510::_id_0C21( level.griggs, "itsonnow" );
    wait 1;
    common_scripts\utility::_id_383F( "level_done" );
    wait 1;
    wait 0.5;
    _id_A552::_id_781E( "icbm" );
    _id_A5A4::_id_60D6();
}

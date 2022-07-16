// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\killhouse_precache::main();
    maps\killhouse_fx::main();
    _id_A550::main();
    maps\killhouse_anim::anim_main();
    level thread maps\killhouse_amb::main();
    maps\createart\killhouse_art::main();
    maps\killhouse_lighting::main();
    player_start();
}

player_start()
{
    var_0 = getent( "inside_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    _id_A632::setmig29fxoverride( "contrail", "fx/smoke/jet_contrail_fng" );
    _id_A632::setmig29fxoverride( "contrail_02", "fx/smoke/jet_contrail_fng" );
    level.short_training = 1;
    level.hip_fire_required = 0;
    level.firing_range_door_open = 0;
    level.targets_hit = 0;
    _id_A5A4::_id_7DF3();

    if ( level.short_training )
        _id_A5A4::_id_278B( ::inside_start );
    else
        _id_A5A4::_id_278B( ::look_training );

    _id_A5A4::_id_079C( "inside", ::inside_start, &"STARTS_INSIDE" );
    _id_A5A4::_id_079C( "shoot", ::rifle_start, &"STARTS_SHOOT" );
    _id_A5A4::_id_079C( "timed", ::rifle_timed_start, &"STARTS_TIMED" );
    _id_A5A4::_id_079C( "sidearm", ::sidearm_start, &"STARTS_SIDEARM" );
    _id_A5A4::_id_079C( "frag", ::frag_start, &"STARTS_FRAG" );
    _id_A5A4::_id_079C( "launcher", ::launcher_start, &"STARTS_LAUNCHER" );
    _id_A5A4::_id_079C( "explosives", ::explosives_start, &"STARTS_C4" );
    _id_A5A4::_id_079C( "course", ::obstacle_start, &"STARTS_OBSTACLE" );
    _id_A5A4::_id_079C( "ship", ::reveal_start, &"STARTS_SHIP" );
    _id_A5A4::_id_079C( "mp5", ::cargoship_start, &"STARTS_MP5" );
    _id_A5A4::_id_079C( "debrief", ::debrief_start, &"STARTS_DEBRIEF" );
    precacheshader( "objective" );
    precacheshader( "hud_icon_c4" );
    precacheshader( "hud_dpad" );
    precacheshader( "hud_arrow_right" );
    precacheshader( "hud_arrow_down" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    precacheshader( "popmenu_bg" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_hud_fng_results_blur" );
    precacheshader( "h1_hud_fng_results_border" );
    precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_PAUSED" );
    precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_PAUSED" );
    precachestring( &"KILLHOUSE_HINT_OBJECTIVE_MARKER" );
    precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_PAUSED" );
    precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_SCORES" );
    precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_SCORES_PS3" );
    precachestring( &"KILLHOUSE_HINT_OBJECTIVE_MARKER" );
    precachestring( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER" );
    precachestring( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER2" );
    precachestring( &"KILLHOUSE_HINT_ATTACK_PC" );
    precachestring( &"KILLHOUSE_HINT_ATTACK" );
    precachestring( &"KILLHOUSE_HINT_HIP_ATTACK_PC" );
    precachestring( &"KILLHOUSE_HINT_HIP_ATTACK" );
    precachestring( &"KILLHOUSE_HINT_ADS_360" );
    precachestring( &"KILLHOUSE_HINT_ADS" );
    precachestring( &"KILLHOUSE_HINT_ADS_TOGGLE" );
    precachestring( &"KILLHOUSE_HINT_ADS_THROW_360" );
    precachestring( &"KILLHOUSE_HINT_ADS_THROW" );
    precachestring( &"KILLHOUSE_HINT_ADS_TOGGLE_THROW" );
    precachestring( &"KILLHOUSE_HINT_STOP_ADS" );
    precachestring( &"KILLHOUSE_HINT_STOP_ADS_TOGGLE" );
    precachestring( &"KILLHOUSE_HINT_STOP_ADS_THROW" );
    precachestring( &"KILLHOUSE_HINT_STOP_ADS_TOGGLE_THROW" );
    precachestring( &"KILLHOUSE_HINT_BREATH_MELEE" );
    precachestring( &"KILLHOUSE_HINT_BREATH_SPRINT" );
    precachestring( &"KILLHOUSE_HINT_BREATH_BINOCULARS" );
    precachestring( &"KILLHOUSE_HINT_MELEE_BREATH" );
    precachestring( &"KILLHOUSE_HINT_MELEE" );
    precachestring( &"KILLHOUSE_HINT_MELEE_BREATH_CLICK" );
    precachestring( &"KILLHOUSE_HINT_MELEE_CLICK" );
    precachestring( &"KILLHOUSE_HINT_PRONE" );
    precachestring( &"KILLHOUSE_HINT_PRONE_HOLD" );
    precachestring( &"KILLHOUSE_HINT_PRONE_TOGGLE" );
    precachestring( &"KILLHOUSE_HINT_PRONE_STANCE" );
    precachestring( &"KILLHOUSE_HINT_PRONE_DOUBLE" );
    precachestring( &"KILLHOUSE_HINT_CROUCH_STANCE" );
    precachestring( &"KILLHOUSE_HINT_CROUCH" );

    if ( !level._id_2153 )
    {
        precachestring( &"PLATFORM_HINT_HOLD_CROUCH" );
        precachestring( &"PLATFORM_HINT_CROUCH_TOGGLE_PC" );
    }

    precachestring( &"KILLHOUSE_HINT_CROUCH_TOGGLE" );
    precachestring( &"KILLHOUSE_HINT_STAND" );
    precachestring( &"KILLHOUSE_HINT_STAND_STANCE" );
    precachestring( &"KILLHOUSE_HINT_JUMP_STAND" );
    precachestring( &"KILLHOUSE_HINT_JUMP" );
    precachestring( &"KILLHOUSE_HINT_SPRINT_PC" );
    precachestring( &"KILLHOUSE_HINT_SPRINT" );
    precachestring( &"KILLHOUSE_HINT_SPRINT_BREATH_PC" );
    precachestring( &"KILLHOUSE_HINT_SPRINT_BREATH" );
    precachestring( &"KILLHOUSE_HINT_HOLDING_SPRINT" );
    precachestring( &"KILLHOUSE_HINT_HOLDING_SPRINT_BREATH" );
    precachestring( &"KILLHOUSE_HINT_RELOAD_USE" );
    precachestring( &"KILLHOUSE_HINT_RELOAD" );
    precachestring( &"KILLHOUSE_HINT_MANTLE" );
    precachestring( &"KILLHOUSE_HINT_ADS_SWITCH" );
    precachestring( &"KILLHOUSE_HINT_ADS_SWITCH_SHOULDER" );
    precachestring( &"KILLHOUSE_HINT_ADS_SWITCH_THROW" );
    precachestring( &"KILLHOUSE_HINT_ADS_SWITCH_THROW_SHOULDER" );
    precachestring( &"KILLHOUSE_HINT_SIDEARM_SWAP" );
    precachestring( &"KILLHOUSE_HINT_PRIMARY_SWAP" );
    precachestring( &"KILLHOUSE_HINT_SIDEARM" );
    precachestring( &"KILLHOUSE_HINT_SIDEARM_RELOAD" );
    precachestring( &"KILLHOUSE_HINT_SIDEARM_RELOAD_USE" );
    precachestring( &"KILLHOUSE_HINT_LADDER" );
    precachestring( &"KILLHOUSE_HINT_FRAG" );
    precachestring( &"KILLHOUSE_HINT_SWAP" );
    precachestring( &"KILLHOUSE_HINT_SWAP_RELOAD" );
    precachestring( &"KILLHOUSE_HINT_FIREMODE" );
    precachestring( &"KILLHOUSE_HINT_LAUNCHER_ATTACK" );
    precachestring( &"KILLHOUSE_HINT_LAUNCHER_ATTACK_PC" );
    precachestring( &"KILLHOUSE_HINT_EXPLOSIVES" );
    precachestring( &"KILLHOUSE_HINT_EXPLOSIVES_RELOAD" );
    precachestring( &"KILLHOUSE_HINT_EXPLOSIVES_PLANT" );
    precachestring( &"KILLHOUSE_HINT_EXPLOSIVES_PLANT_RELOAD" );
    precachestring( &"KILLHOUSE_MARINE3_USE_SIDEARM" );
    precachestring( &"KILLHOUSE_C4_PICKUP" );
    precachestring( &"KILLHOUSE_HINT_C4_ICON" );
    precachestring( &"KILLHOUSE_HINT_EQUIP_C4" );
    precachestring( &"KILLHOUSE_HINT_THROW_C4" );
    precachestring( &"KILLHOUSE_HINT_THROW_C4_TOGGLE" );
    precachestring( &"KILLHOUSE_HINT_THROW_C4_SPEED" );
    precachestring( &"KILLHOUSE_HINT_APPROACH_MELEE" );
    precachestring( &"KILLHOUSE_HINT_APPROACH_C4_THROW" );
    precachestring( &"KILLHOUSE_HINT_HUD_CHANGES" );
    precachestring( &"KILLHOUSE_DETONATE_C4" );
    precachestring( &"KILLHOUSE_HINT_CROSSHAIR_CHANGES" );
    precachestring( &"KILLHOUSE_HINT_ADS_ACCURACY" );
    precachestring( &"KILLHOUSE_USE_ROPE" );
    precachestring( &"KILLHOUSE_SHIP_TOO_SLOW" );
    precachestring( &"KILLHOUSE_YOUR_TIME" );
    precachestring( &"KILLHOUSE_YOUR_FINAL_TIME" );
    precachestring( &"KILLHOUSE_IW_BEST_TIME" );
    precachestring( &"KILLHOUSE_YOUR_DECK_TIME" );
    precachestring( &"KILLHOUSE_IW_DECK_TIME" );
    precachestring( &"KILLHOUSE_SHIP_OUT_OF_FLASH" );
    precachestring( &"KILLHOUSE_SHIP_JUMPED_TOO_EARLY" );
    precachestring( &"KILLHOUSE_SHIP_MUST_CLEAR_DECK_MOCK_UP" );
    precachestring( &"KILLHOUSE_HIT_FRIENDLY" );
    precachestring( &"KILLHOUSE_HINT_FLASH" );
    precachestring( &"KILLHOUSE_ACCURACY_BONUS" );
    precachestring( &"KILLHOUSE_SHIP_LABEL" );
    precachestring( &"KILLHOUSE_DECK_LABEL" );
    precachestring( &"KILLHOUSE_ACCURACY_BONUS_ZERO" );
    precachestring( &"KILLHOUSE_C4_OBJECTIVE" );
    precachestring( &"KILLHOUSE_HINT_GRENADE_TOO_LOW" );
    precachestring( &"KILLHOUSE_HINT_GL_TOO_LOW" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU1" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU2" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU1B" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU2B" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_YES" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_NO" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU1_ALL" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU2_ALL" );
    precachestring( &"KILLHOUSE_LOOK_UP" );
    precachestring( &"KILLHOUSE_LOOK_DOWN" );
    precachestring( &"KILLHOUSE_HINT_LAUNCHER_ICON" );
    precachestring( &"KILLHOUSE_FIRED_NEAR_FRIENDLY" );
    precachestring( &"KILLHOUSE_USE_YOUR_OBJECTIVE_INDICATOR" );
    precachestring( &"KILLHOUSE_PICK_UP_A_RIFLE_FROM" );
    precachestring( &"KILLHOUSE_GET_A_PISTOL_FROM_THE" );
    precachestring( &"KILLHOUSE_MELEE_THE_WATERMELON" );
    precachestring( &"KILLHOUSE_GO_OUTSIDE_AND_REPORT" );
    precachestring( &"KILLHOUSE_PICK_UP_THE_RIFLE_WITH" );
    precachestring( &"KILLHOUSE_PICK_UP_THE_C4_EXPLOSIVE" );
    precachestring( &"KILLHOUSE_RUN_THE_OBSTACLE_COURSE" );
    precachestring( &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE" );
    precachestring( &"KILLHOUSE_CLIMB_THE_LADDER" );
    precachestring( &"KILLHOUSE_DEBRIEF_WITH_CPT_PRICE" );
    precachestring( &"KILLHOUSE_ENTER_STATION_NUMBER" );
    precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE" );
    precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE1" );
    precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_AS" );
    precachestring( &"KILLHOUSE_EQUIP_THE_MP5_AND_PICK" );
    precachestring( &"KILLHOUSE_CLEAR_THE_CARGOSHIP_BRIDGE" );
    precachestring( &"KILLHOUSE_SWITCH_TO_YOUR_RIFLE" );
    precachestring( &"KILLHOUSE_PICK_UP_THE_FRAG_GRENADES" );
    precachestring( &"KILLHOUSE_ENTER_THE_SAFETY_PIT" );
    precachestring( &"KILLHOUSE_THROW_A_GRENADE_INTO" );
    precachestring( &"KILLHOUSE_RETURN_TO_THE_SAFETY" );
    precachestring( &"KILLHOUSE_FIRE_AT_THE_WALL_WITH" );
    precachestring( &"KILLHOUSE_PLANT_THE_C4_EXPLOSIVE" );
    precachestring( &"KILLHOUSE_FIRE_YOUR_GRENADE_LAUNCHER" );
    precachestring( &"KILLHOUSE_CLIMB_THE_LADDER1" );
    precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_THROUGH" );
    precachestring( &"KILLHOUSE_LINE_UP_AND_RUN_TO_THE_END" );
    precachestring( &"KILLHOUSE_SLIDE_DOWN_THE_ROPE" );
    precachestring( &"KILLHOUSE_COMPLETE_THE_DECK_MOCKUP" );
    precachestring( &"KILLHOUSE_RECOMMENDED_LABEL" );
    precachestring( &"KILLHOUSE_RECOMMENDED_LABEL2" );
    precachestring( &"KILLHOUSE_RECOMMENDED_EASY" );
    precachestring( &"KILLHOUSE_RECOMMENDED_NORMAL" );
    precachestring( &"KILLHOUSE_RECOMMENDED_HARD" );
    precachestring( &"KILLHOUSE_RECOMMENDED_VETERAN" );
    precachestring( &"KILLHOUSE_DEMOLITIONS_TRAINING" );
    precachestring( &"KILLHOUSE_EQUIP_C4" );
    precachestring( &"KILLHOUSE_FOLLOW_SGTNEWCASTLE" );
    precachestring( &"KILLHOUSE_THROW_C4_ON_CAR" );
    precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE" );
    precachestring( &"KILLHOUSE_SAFE_DISTANCE" );
    maps\killhouse_precache::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_mp5_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_saw_clip";
    maps\killhouse_fx::main();
    _id_A550::main();
    maps\killhouse_anim::anim_main();
    level thread maps\killhouse_amb::main();
    maps\killhouse_lighting::main();
    maps\killhouse_aud::main();
    _id_A51D::_id_8324( "compass_map_killhouse" );
    maps\_c4::main();
    maps\createart\killhouse_art::main();
    _id_A52C::init();
    _id_A5A4::_id_1332( "allies" );
    _id_A5A4::_id_1332( "axis" );
    level.curobjective = 1;
    level._id_6302 = [];
    level.currentkeyhintactionname = "";
    maps\killhouse_code::registeractions();
    common_scripts\utility::_id_383D( "in_pit_with_frags" );
    common_scripts\utility::_id_383D( "ADS_targets_shot" );
    common_scripts\utility::_id_383D( "hip_targets_shot" );
    common_scripts\utility::_id_383D( "crosshair_dialog" );
    common_scripts\utility::_id_383D( "ADS_shoot_dialog" );
    common_scripts\utility::_id_383D( "melee_run_dialog" );
    common_scripts\utility::_id_383D( "melee_complete" );
    common_scripts\utility::_id_383D( "picked_up_launcher_dialog" );
    common_scripts\utility::_id_383D( "plant_c4_dialog" );
    common_scripts\utility::_id_383D( "c4_equiped" );
    common_scripts\utility::_id_383D( "c4_thrown" );
    common_scripts\utility::_id_383D( "C4_planted" );
    common_scripts\utility::_id_383D( "car_destroyed" );
    common_scripts\utility::_id_383D( "reveal_dialog_starting" );
    common_scripts\utility::_id_383D( "reveal_dialog_done" );
    common_scripts\utility::_id_383D( "price_reveal_done" );
    common_scripts\utility::_id_383D( "reveal_done" );
    common_scripts\utility::_id_383D( "player_sprinted" );
    common_scripts\utility::_id_383D( "fragTraining_end" );
    common_scripts\utility::_id_383D( "got_flashes" );
    common_scripts\utility::_id_383D( "got_frags" );
    common_scripts\utility::_id_383D( "sprinted" );
    common_scripts\utility::_id_383D( "finish" );
    common_scripts\utility::_id_383D( "activate_rope" );
    common_scripts\utility::_id_383D( "aa_look_training" );
    common_scripts\utility::_id_383D( "aa_obj_training" );
    common_scripts\utility::_id_383D( "aa_rifle_training" );
    common_scripts\utility::_id_383D( "aa_timed_shooting_training" );
    common_scripts\utility::_id_383D( "aa_sidearm_melee" );
    common_scripts\utility::_id_383D( "aa_frag" );
    common_scripts\utility::_id_383D( "aa_launcher" );
    common_scripts\utility::_id_383D( "aa_c4" );
    common_scripts\utility::_id_383D( "aa_obstacle" );
    common_scripts\utility::_id_383D( "aa_cargoship" );
    common_scripts\utility::_id_383D( "gaz_in_idle_position" );
    common_scripts\utility::_id_383D( "player_has_look_problem" );
    common_scripts\utility::_id_383D( "start_timer" );
    common_scripts\utility::_id_383D( "gaz_intro_done" );
    common_scripts\utility::_id_383D( "rifle_picked_up" );
    common_scripts\utility::_id_383D( "waiting_for_rappel_runners" );
    common_scripts\utility::_id_383D( "people_crawling" );
    common_scripts\utility::_id_383D( "in_obstacle_area" );
    common_scripts\utility::_id_383D( "in_lastTraining_area_A" );
    common_scripts\utility::_id_383D( "in_lastTraining_area_B" );
    common_scripts\utility::_id_383D( "open_firerange_door" );
    common_scripts\utility::_id_383D( "in_firerange_boot1" );
    common_scripts\utility::_id_383D( "cargoshipTrainingOn" );
    common_scripts\utility::_id_383D( "in_quit_cargoship_tutorial" );
    common_scripts\utility::_id_383D( "in_NoReminder_Compass" );
    common_scripts\utility::_id_383D( "infront_of_vehicle" );
    common_scripts\utility::_id_383D( "lootz_intro_start" );
    common_scripts\utility::_id_383D( "inventoryNewPos" );
    common_scripts\utility::_id_383D( "grenadeAmmoFlag" );
    common_scripts\utility::_id_383D( "in_safety_pit" );
    common_scripts\utility::_id_383D( "approching_grenade_area" );
    common_scripts\utility::_id_383D( "approching_hangar2" );
    common_scripts\utility::_id_383D( "cargoshipTutoDone" );
    precachestring( &"KILLHOUSE_OBJ_GET_RIFLE_AMMO" );
    precachestring( &"KILLHOUSE_OBJ_ENTER_STALL" );
    precachestring( &"KILLHOUSE_HINT_SIDEARM" );
    precachestring( &"KILLHOUSE_HINT_OBJECTIVE_MARKER" );
    precachestring( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER" );
    precachestring( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER2" );
    precachestring( &"KILLHOUSE_HINT_LADDER" );
    precachestring( &"KILLHOUSE_HINT_HOLDING_SPRINT" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU1_ALL" );
    precachestring( &"KILLHOUSE_AXIS_OPTION_MENU2_ALL" );
    precachestring( &"MENU_TYPE_INVERT_AXIS" );
    precachestring( &"MENU_TYPE_INVERT_AXIS_CONFIRM" );
    precachestring( &"difficulty_selection_menu_fng" );
    _id_A5A4::_id_032C( "electronics_pda" );
    _id_A5A4::_id_032C( "open_book_static" );
    _id_A5A4::_id_032C( "com_clipboard_mocap" );
    _id_A5A4::_id_032C( "characters_accessories_pencil" );
    _id_A5A4::_id_032C( "h1_mwr_com_office_chair_black" );
    _id_A5A4::_id_032C( "body_sp_sas_woodland_golden@sitting" );
    common_scripts\utility::_id_383D( "spawn_sidearms" );
    common_scripts\utility::_id_383D( "spawn_frags" );
    common_scripts\utility::_id_383D( "spawn_launcher" );
    var_0 = getentarray( "pickup_flash", "targetname" );
    var_1 = getentarray( "frag_ammoitem", "targetname" );
    var_2 = getentarray( "launcher_ammoitem", "targetname" );

    foreach ( var_4 in var_0 )
        var_4 thread maps\killhouse_code::ammorespawnthink( undefined, "flash_grenade", "got_flashes" );

    var_6 = getentarray( "pickup_mp5", "targetname" );

    foreach ( var_8 in var_6 )
        var_8 thread maps\killhouse_code::ammorespawnthink( undefined, "mp5" );

    var_6 = getentarray( "pickup_rifle", "targetname" );

    foreach ( var_8 in var_6 )
        var_8 thread maps\killhouse_code::ammorespawnthink( undefined, "g36c" );

    var_6 = getentarray( "pickup_pistol", "targetname" );

    foreach ( var_8 in var_6 )
        var_8 thread maps\killhouse_code::ammorespawnthink( undefined, "usp" );

    common_scripts\utility::_id_0D13( getentarray( "pickup_sidearm", "targetname" ), maps\killhouse_code::ammorespawnthink, "spawn_sidearms", "usp" );
    common_scripts\utility::_id_0D13( var_1, maps\killhouse_code::ammorespawnthink, "spawn_frags", "fraggrenade", "got_frags" );
    common_scripts\utility::_id_0D13( var_2, maps\killhouse_code::ammorespawnthink, "spawn_launcher", "alt_m16_grenadier" );
    level.gunprimary = "g36c";
    level.gunprimaryclipammo = 30;
    level.gunsidearm = "usp";
    maps\killhouse_code::silently_lowerplywoodwalls();
    level.plywoodextensioncoll = getentarray( "PlywoodExtensionColl", "targetname" );

    foreach ( var_15 in level.plywoodextensioncoll )
        var_15 _meth_82BB();

    level.bodysense_coll = getent( "rifle_range_bodySense_coll", "targetname" );
    level.bodysense_coll _meth_82BB();
    level._id_01A7["min_participation"] = -1;
    thread maps\killhouse_code::training_targetdummies( "rifle" );
    thread maps\killhouse_code::melon_think();
    thread maps\killhouse_code::turn_off_frag_lights();
    thread maps\killhouse_code::waters_think();
    thread maps\killhouse_code::mac_think();
    thread maps\killhouse_code::newcastle_think();
    thread maps\killhouse_code::price_think();
    thread music_control();
    thread maps\killhouse_aud::aud_jet_passby();
    thread maps\killhouse_aud::aud_hangar_amb_ext();
    var_17 = getent( "destructible", "targetname" );
    var_17 thread _id_A5A4::_id_2BC3( _id_A5A4::_id_A099, "destroyed", common_scripts\utility::_id_383F, "car_destroyed" );
    var_17 _id_A5A4::_id_290B();
    var_18 = getent( "c4_pickup", "targetname" );
    var_18 common_scripts\utility::_id_97CC();
    var_19 = getentarray( var_18._id_04A4, "targetname" );

    for ( var_20 = 0; var_20 < var_19.size; var_20++ )
        var_19[var_20] _meth_8056();

    common_scripts\utility::_id_383D( "start_deck" );
    thread maps\killhouse_code::deck_training();
    thread maps\killhouse_code::ambient_trucks();
    var_21 = _id_A5A8::_id_23DE( 8 );

    foreach ( var_23 in var_21 )
        var_23 _id_A5A8::_id_9D02( "running" );

    common_scripts\utility::_id_0D13( getentarray( "level_scripted_unloadnode", "script_noteworthy" ), maps\killhouse_code::level_scripted_unloadnode );
    thread maps\killhouse_code::setup_player_action_notifies();
    var_25 = getentarray( "launcher_aim_assist", "script_noteworthy" );

    for ( var_20 = 0; var_20 < var_25.size; var_20++ )
    {
        var_25[var_20] _meth_8056();
        var_25[var_20] _meth_82BB();
    }

    thread maps\killhouse_code::new_look_training_setup();
    var_26 = _func_0DA( "allies", "all" );
    common_scripts\utility::_id_0D13( var_26, _id_A5A4::_id_58D7 );
    common_scripts\utility::_id_0D13( var_26, maps\killhouse_code::fail_on_damage );
    thread maps\killhouse_code::glowing_rope();
    thread maps\killhouse_code::chair_guy_setup();
    thread maps\killhouse_code::firearmdepot_guy_think();
    thread maps\killhouse_code::inventory_guy_setup();
    thread clear_hints_on_mission_fail();
    thread fng_shadowlightbyzone();
    shootingrange_1stlanelightoff();
    shadowoverride_firing_range_door_close();
    thread rappel_heli_loop_system();
    common_scripts\utility::_id_383D( "gateOpen" );
    setup_ai_aim_targets();
    ai_spectator_setup();
    level.ai_in_training_left = getent( "ai_training", "targetname" );

    if ( isdefined( level.ai_in_training_left ) )
        level.ai_in_training_left thread ai_rifle_training_loop( level.aim_targets_left );

    level.ai_in_training_right = getent( "ai_training_right", "targetname" );

    if ( isdefined( level.ai_in_training_right ) )
        level.ai_in_training_right thread ai_rifle_training_loop( level.aim_targets_right );

    level.gaz_talk_anim_chance = 0;
    level._id_4C12 = [];
    level._id_071A = [];
    _func_0D6( "dynEnt_playerWakeUpRadius", 1000 );
    _func_0D6( "cl_NoWeaponBobAmplitudeVertical", 1.0 );
    _func_0D6( "cl_NoWeaponBobAmplitudeHorizontal", 1.0 );
    maps\killhouse_code::melontargetdummies();
    precachemodel( "head_sp_sas_woodland_colon" );
    precachemodel( "head_sp_sas_woodland_golden" );
    precachemodel( "head_sas_ct_assault_charles" );
    precachemodel( "head_sas_ct_assault_mitchel" );
    precachemodel( "head_sas_ct_assault_william" );
    precachemodel( "head_sas_ct_assault_charles_nomask" );
}

gazintrolightstaging()
{
    var_0 = getent( "Intro_StagingGaz_01", "targetname" );
    var_1 = getent( "Intro_StagingGaz_02", "targetname" );
    var_0 _meth_81E2( 9 );
    var_1 _meth_81E2( 30 );
    common_scripts\utility::_id_384A( "rifle_picked_up" );
    common_scripts\utility::_id_384A( "gaz_intro_done" );
    wait 5;
    var_0 _meth_81E2( 0 );
    var_1 _meth_81E2( 0 );
}

levelstart_lighteffects()
{
    var_0 = "killhouse_interior_range";
    var_1 = "killhouse_interior_range";
    var_2 = "killhouse_interior";
    var_3 = "clut_killhouse";
    _id_A5A4::_id_7F00( var_0 );
    _id_A5A4::_id_395E( var_1 );
    level._id_0318 _id_A5A4::set_light_set_player( var_2 );
    level._id_0318 _meth_848C( var_3, 1 );
}

shootingrange_vo_togetback()
{
    var_0 = 3;

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "spawn_sidearms" ) )
            return;

        if ( !common_scripts\utility::_id_382E( "in_firerange_boot1" ) && level.waters_speaking != 1 )
        {
            var_1 = [];
            var_1[0] = "gotostation1";
            var_1[1] = "heygo";
            var_1[2] = "getback";
            var_2 = var_1[_func_0B2( var_1.size )];
            level.waters_speaking = 1;
            level.waters maps\killhouse_code::execdialog( var_2 );
            level.waters_speaking = 0;
            wait(var_0);
            var_0 += 2;
        }

        wait 1;
    }
}

shootingrange_1stlanelightoff()
{
    var_0 = getentarray( "Light_Activation_01", "targetname" );
    var_1 = getentarray( "Light_Activation_02", "targetname" );
    var_2 = getentarray( "Light_Activation_03", "targetname" );
    var_3 = getentarray( "Light_Activation_04", "targetname" );

    foreach ( var_5 in var_0 )
        var_5 _meth_81E2( 0 );

    foreach ( var_5 in var_1 )
        var_5 _meth_81E2( 0 );

    foreach ( var_5 in var_2 )
        var_5 _meth_81E2( 0 );

    foreach ( var_5 in var_3 )
        var_5 _meth_81E2( 0 );
}

shootingrange_1stlanelighton()
{
    var_0 = getentarray( "Light_Activation_01", "targetname" );
    var_1 = getentarray( "Light_Activation_02", "targetname" );
    var_2 = getentarray( "Light_Activation_03", "targetname" );
    var_3 = getentarray( "Light_Activation_04", "targetname" );

    foreach ( var_5 in var_0 )
    {
        if ( isdefined( var_5._id_0398 ) )
        {
            if ( var_5._id_0398 == "Small_Target_Up" )
            {
                var_5 _meth_81E2( 100 );
                var_5 thread _id_A5A4::_id_69C4( "scn_spotlight_open" );
                continue;
            }

            if ( var_5._id_0398 == "Small_Target_Down" )
            {
                var_5 _meth_81E2( 100 );
                continue;
            }

            if ( var_5._id_0398 == "Plank_Spot" )
            {
                var_5 _meth_81E2( 100 );
                continue;
            }

            if ( var_5._id_0398 == "Roof_Spot" )
            {
                var_5 _meth_81E2( 150 );
                continue;
            }

            if ( var_5._id_0398 == "Floor_Spot" )
            {
                var_5 _meth_81E2( 500 );
                continue;
            }

            if ( var_5._id_0398 == "Wall_Spot" )
                var_5 _meth_81E2( 100 );
        }
    }

    wait 0.5;

    foreach ( var_5 in var_1 )
    {
        if ( isdefined( var_5._id_0398 ) )
        {
            if ( var_5._id_0398 == "Target_Dummy_01" )
            {
                var_5 _meth_81E2( 100 );
                var_5 thread _id_A5A4::_id_69C4( "scn_spotlight_open" );
                continue;
            }

            if ( var_5._id_0398 == "Roof_Spot" )
            {
                var_5 _meth_81E2( 125 );
                continue;
            }

            if ( var_5._id_0398 == "Floor_Spot" )
            {
                var_5 _meth_81E2( 250 );
                continue;
            }

            if ( var_5._id_0398 == "Wall_Spot" )
                var_5 _meth_81E2( 50 );
        }
    }

    wait 0.5;

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5._id_0398 ) )
        {
            if ( var_5._id_0398 == "Target_Dummy_02" )
            {
                var_5 _meth_81E2( 70 );
                var_5 thread _id_A5A4::_id_69C4( "scn_spotlight_open" );
                continue;
            }

            if ( var_5._id_0398 == "Roof_Spot" )
            {
                var_5 _meth_81E2( 100 );
                continue;
            }

            if ( var_5._id_0398 == "Floor_Spot" )
            {
                var_5 _meth_81E2( 125 );
                continue;
            }

            if ( var_5._id_0398 == "Wall_Spot" )
                var_5 _meth_81E2( 25 );
        }
    }

    wait 0.5;

    foreach ( var_5 in var_3 )
    {
        if ( isdefined( var_5._id_0398 ) )
        {
            if ( var_5._id_0398 == "Target_Dummy_03" )
            {
                var_5 _meth_81E2( 35 );
                var_5 thread _id_A5A4::_id_69C4( "scn_spotlight_open" );
                continue;
            }

            if ( var_5._id_0398 == "Floor_Spot" )
            {
                var_5 _meth_81E2( 65 );
                continue;
            }

            if ( var_5._id_0398 == "Wall_Spot" )
            {
                var_5 _meth_81E2( 12.5 );
                continue;
            }

            if ( var_5._id_0398 == "Lane_Number" )
                var_5 _meth_81E2( 10 );
        }
    }
}

fng_shadowlightbyzone()
{
    var_0 = getent( "Light_Window_Shop", "targetname" );
    var_1 = getent( "Light_1st_Lane", "targetname" );
    var_2 = getent( "Light_Last_LanesA", "targetname" );
    var_3 = getent( "Light_Last_LanesB", "targetname" );
    var_4 = getent( "HangarLight_01", "targetname" );
    var_5 = getent( "HangarLight_02", "targetname" );
    var_6 = getent( "HangarLight_03", "targetname" );
    var_7 = getent( "HangarLight_04", "targetname" );
    var_8 = getent( "HangarLight_05", "targetname" );
    var_9 = getent( "ShipDeckLight_01", "targetname" );
    var_10 = getent( "ShipDeckLight_02", "targetname" );
    var_11 = getent( "ShipDeckLight_03", "targetname" );
    var_12 = getent( "ShipDeckLight_04", "targetname" );

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "in_firerange_lighting_zone1" ) )
        {
            var_0 _meth_8494( "force_on" );
            var_1 _meth_8494( "force_on" );
            var_2 _meth_8494( "force_off" );
            var_3 _meth_8494( "force_off" );

            while ( common_scripts\utility::_id_382E( "in_firerange_lighting_zone1" ) )
                wait 0.5;
        }
        else if ( common_scripts\utility::_id_382E( "in_firerange_lighting_zone2" ) )
        {
            var_0 _meth_8494( "force_on" );
            var_1 _meth_8494( "force_on" );
            var_2 _meth_8494( "normal" );
            var_3 _meth_8494( "normal" );

            while ( common_scripts\utility::_id_382E( "in_firerange_lighting_zone2" ) )
                wait 0.5;
        }
        else if ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneTower" ) )
        {
            var_4 _meth_8494( "force_on" );
            var_5 _meth_8494( "force_on" );
            var_6 _meth_8494( "normal" );
            var_7 _meth_8494( "force_on" );
            var_8 _meth_8494( "force_on" );
            var_9 _meth_8494( "force_off" );
            var_10 _meth_8494( "force_off" );
            var_11 _meth_8494( "force_off" );
            var_12 _meth_8494( "force_off" );

            while ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneTower" ) )
                wait 0.5;
        }
        else if ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneHangarFloor" ) )
        {
            var_4 _meth_8494( "normal" );
            var_5 _meth_8494( "force_on" );
            var_6 _meth_8494( "force_on" );
            var_7 _meth_8494( "force_off" );
            var_8 _meth_8494( "force_off" );
            var_9 _meth_8494( "force_off" );
            var_10 _meth_8494( "force_off" );
            var_11 _meth_8494( "normal" );
            var_12 _meth_8494( "normal" );

            while ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneHangarFloor" ) )
                wait 0.1;
        }
        else if ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipTopDeck" ) )
        {
            var_4 _meth_8494( "force_off" );
            var_5 _meth_8494( "normal" );
            var_6 _meth_8494( "normal" );
            var_7 _meth_8494( "force_on" );
            var_8 _meth_8494( "force_on" );
            var_9 _meth_8494( "normal" );
            var_10 _meth_8494( "force_off" );
            var_11 _meth_8494( "force_off" );
            var_12 _meth_8494( "force_off" );

            while ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipTopDeck" ) )
                wait 0.5;
        }
        else if ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipInterior1" ) )
        {
            var_4 _meth_8494( "force_off" );
            var_5 _meth_8494( "force_off" );
            var_6 _meth_8494( "force_off" );
            var_7 _meth_8494( "force_off" );
            var_8 _meth_8494( "force_off" );
            var_9 _meth_8494( "force_on" );
            var_10 _meth_8494( "force_on" );
            var_11 _meth_8494( "force_on" );
            var_12 _meth_8494( "normal" );

            while ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipInterior1" ) )
                wait 0.5;
        }
        else if ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipInterior2" ) )
        {
            var_4 _meth_8494( "normal" );
            var_5 _meth_8494( "normal" );
            var_6 _meth_8494( "force_on" );
            var_7 _meth_8494( "force_off" );
            var_8 _meth_8494( "force_off" );
            var_9 _meth_8494( "normal" );
            var_10 _meth_8494( "normal" );
            var_11 _meth_8494( "force_on" );
            var_12 _meth_8494( "force_on" );

            while ( common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipInterior2" ) )
                wait 0.5;
        }
        else
        {
            var_0 _meth_8494( "normal" );
            var_1 _meth_8494( "normal" );
            var_2 _meth_8494( "normal" );
            var_3 _meth_8494( "normal" );
            var_4 _meth_8494( "normal" );
            var_5 _meth_8494( "normal" );
            var_6 _meth_8494( "normal" );
            var_7 _meth_8494( "normal" );
            var_8 _meth_8494( "normal" );
            var_9 _meth_8494( "normal" );
            var_10 _meth_8494( "normal" );
            var_11 _meth_8494( "normal" );
            var_12 _meth_8494( "normal" );

            while ( !common_scripts\utility::_id_382E( "in_firerange_lighting_zone1" ) && !common_scripts\utility::_id_382E( "in_firerange_lighting_zone2" ) && !common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneTower" ) && !common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneHangarFloor" ) && !common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipTopDeck" ) && !common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipInterior1" ) && !common_scripts\utility::_id_382E( "in_hangar3_lighting_zoneShipInterior2" ) )
                wait 0.5;
        }

        wait 0.1;
    }
}

anim_chance_debug()
{
    for (;;)
    {
        iprintlnbold( common_scripts\utility::_id_93F2( level.gaz_talk_anim_chance ) );
        wait 0.05;
    }
}

clear_hints_on_mission_fail()
{
    level waittill( "mission failed" );
    maps\killhouse_code::_id_1EBE();
}

humvee_walkers()
{
    var_0 = getent( "sas2", "script_noteworthy" );
    var_1 = getent( "sas1", "script_noteworthy" );
    var_0._id_5F65 = 1.1;
    var_1._id_5F65 = 1.1;
    var_0 _id_A5A4::_id_7E45( "fast_walk" );
    var_1 _id_A5A4::_id_7E45( "fast_walk" );
    var_2 = _func_0C3( "node_guard_2", "targetname" );
    var_3 = _func_0C3( "node_guard_1", "targetname" );
    var_0._id_2AF3 = 1;
    var_0._id_2B0E = 1;
    var_1._id_2AF3 = 1;
    var_1._id_2B0E = 1;
    var_4 = getent( "humvee_walkers_trigger", "targetname" );
    var_4 waittill( "trigger" );
    var_0 _meth_81A9( var_2 );
    wait 0.35;
    var_1 _meth_81A9( var_3 );
    var_0 _id_A5A4::_id_7E4E( 5 );
    var_1 _id_A5A4::_id_7E4E( 5 );
    var_0 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "goal" );
    var_1 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "goal" );
    var_0 thread humvee_walker_think();
    var_1 thread humvee_walker_think();
    _id_A5A4::_id_2BDC();
    level notify( "walkers_done" );
    var_0._id_5F65 = 1;
    var_1._id_5F65 = 1;
}

humvee_walker_think()
{
    var_0 = getent( "walker_inside_trigger", "targetname" );

    for (;;)
    {
        wait 0.1;

        if ( self _meth_80AB( var_0 ) )
        {
            self notify( "goal" );
            return;
        }
    }
}

look_training()
{
    _id_A5E8::_id_870C( "start_look_training_checkpoint" );
    common_scripts\utility::_id_383F( "aa_look_training" );
    thread maps\killhouse_code::killhouse_hint( &"KILLHOUSE_LOOK_UP", 9999 );

    for (;;)
    {
        var_0 = level._id_0318 _meth_8338();

        if ( var_0[0] < -40 )
            break;

        wait 0.1;
    }

    maps\killhouse_code::_id_1EBE();
    wait 0.5;
    thread maps\killhouse_code::killhouse_hint( &"KILLHOUSE_LOOK_DOWN", 9999 );

    for (;;)
    {
        var_0 = level._id_0318 _meth_8338();

        if ( var_0[0] > 0 )
            break;

        wait 0.1;
    }

    maps\killhouse_code::_id_1EBE();
    setdvar( "ui_start_inverted", 0 );

    if ( level._id_2153 )
    {
        if ( isdefined( getdvar( "input_invertPitch" ) ) && getdvar( "input_invertPitch" ) == "1" )
            setdvar( "ui_start_inverted", 1 );
    }
    else if ( isdefined( getdvar( "ui_mousepitch" ) ) && getdvar( "ui_mousepitch" ) == "1" )
        setdvar( "ui_start_inverted", 1 );

    wait 0.1;
    level._id_0318 _meth_84ED( &"MENU_TYPE_INVERT_AXIS" );
    level._id_0318 _meth_8326( 1 );
    _func_074( 2, 0.1 );
    level._id_0318 waittill( "menuresponse", var_1, var_2 );
    _func_074( 0, 0.2 );
    level._id_0318 _meth_8326( 0 );

    if ( var_2 == "try_invert" )
    {
        thread maps\killhouse_code::killhouse_hint( &"KILLHOUSE_LOOK_UP", 9999 );

        for (;;)
        {
            var_0 = level._id_0318 _meth_8338();

            if ( var_0[0] < -40 )
                break;

            wait 0.1;
        }

        maps\killhouse_code::_id_1EBE();
        wait 0.5;
        thread maps\killhouse_code::killhouse_hint( &"KILLHOUSE_LOOK_DOWN", 9999 );

        for (;;)
        {
            var_0 = level._id_0318 _meth_8338();

            if ( var_0[0] > 0 )
                break;

            wait 0.1;
        }

        maps\killhouse_code::_id_1EBE();
        level._id_0318 _meth_84ED( &"MENU_TYPE_INVERT_AXIS_CONFIRM" );
        level._id_0318 _meth_8326( 1 );
        _func_074( 2, 0.1 );
        level._id_0318 waittill( "menuresponse", var_1, var_2 );
        _func_074( 0, 0.2 );
        level._id_0318 _meth_8326( 0 );
    }

    common_scripts\utility::_id_3831( "aa_look_training" );
    thread navigationtraining();
}

rappel_heli_loop_system()
{
    thread heli_runner_despawn_system();
    var_0 = getent( "rappel_heli_start_trigger", "targetname" );
    var_0 waittill( "trigger" );

    for (;;)
    {
        var_1 = _id_A5A8::_id_8979( "rappel_heli_spawner_a" );
        var_1 _id_A5A8::_id_9D02( "running" );
        wait 1;
        common_scripts\utility::_id_383F( "waiting_for_rappel_runners" );
        var_1 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "reached_dynamic_path_end" );
        _id_A5A4::_id_2BDC();
        wait(_func_0B5( 10.0, 20.0 ));
    }
}

heli_runner_despawn_system()
{
    wait 5;
    var_0 = getent( "runners_start_trigger", "targetname" );
    var_1 = [];

    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::_id_3831( "waiting_for_rappel_runners" );
        var_1 = getentarray( "heli_runner", "script_noteworthy" );

        foreach ( var_3 in var_1 )
        {
            if ( _func_1A1( var_3 ) )
                var_3 thread heli_runner_think();
        }
    }
}

heli_runner_think()
{
    var_0 = getent( "runner_despawner", "targetname" );

    for (;;)
    {
        wait 2;

        if ( self _meth_80AB( var_0 ) )
        {
            self delete();
            return;
        }
    }
}

navigationtraining()
{
    common_scripts\utility::_id_383F( "aa_obj_training" );
    level notify( "navigationTraining_start" );
    level.waters thread maps\killhouse_code::execdialog( "illletyouin" );
    maps\killhouse_code::registerobjective( "obj_enter_range", &"KILLHOUSE_USE_YOUR_OBJECTIVE_INDICATOR", getent( "rifle_range_obj", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_enter_range", "current" );
    wait 3;
    thread maps\killhouse_code::objective_hints( "at_rifle_range" );
    common_scripts\utility::_id_384A( "at_rifle_range" );
    thread open_firing_range_door();
    thread door_to_rifle_handler();
    common_scripts\utility::_id_384A( "inside_firing_range" );
    maps\killhouse_code::setobjectivestate( "obj_enter_range", "done" );
}

inside_start()
{
    _id_A5E8::_id_870C( "start_inside_checkpoint" );
    var_0 = getent( "inside_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    levelstart_lighteffects();
    thread gazintrolightstaging();
    wait 2.5;
    thread _id_A54B::_id_4F92( "white", 0.1, 1.5 );
    common_scripts\utility::_id_383F( "inside_firing_range" );
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    thread door_to_rifle_handler();
}

door_to_rifle_handler()
{
    var_0 = _func_0C3( "gaz_intro", "targetname" );
    var_0 thread _id_A510::_id_0BC7( level.waters, "intro" );
    common_scripts\utility::_id_384A( "introscreen_complete" );
    var_0 thread gaz_intro();
    level notify( "navigationTraining_end" );
    maps\killhouse_code::_id_1EBE();
    wait 0.5;
    common_scripts\utility::_id_3831( "aa_obj_training" );
    thread rifletraining();
}

gaz_intro()
{
    _id_A510::_id_0C24( level.waters, "intro" );
    level.waters _meth_8202( level._id_0318, 1 );
    common_scripts\utility::_id_383F( "gaz_intro_done" );
    thread _id_A510::_id_0BE1( level.waters, "intro_idle", undefined, "end_idle" );
}

rifle_start()
{
    _id_A5E8::_id_870C( "start_rifle_start_checkpoint" );
    var_0 = getent( "shooting_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    common_scripts\utility::_id_383F( "inside_firing_range" );
    levelstart_lighteffects();
    thread rifletraining();
}

rifletraining()
{
    common_scripts\utility::_id_383F( "aa_rifle_training" );
    level notify( "rifleTraining_start" );
    _id_A5A4::_id_3847( "player_at_rifle_stall", getent( "rifleTraining_stall", "targetname" ), 1 );
    common_scripts\utility::_id_384A( "inside_firing_range" );
    thread maps\killhouse_code::delay_objective_after_intro();
    thread maps\killhouse_code::move_gaz_once_player_past();

    while ( !level._id_0318 _meth_82F6( level.gunprimary ) )
        wait 0.05;

    common_scripts\utility::_id_383F( "rifle_picked_up" );
    common_scripts\utility::_id_384A( "gaz_intro_done" );
    level.waters _meth_8202();
    close_firing_range_door();
    _id_A5A4::_id_1143( "rifle_training" );
    maps\killhouse_code::setobjectivestate( "obj_rifle", "current" );
    maps\killhouse_code::setobjectivestring( "obj_rifle", &"KILLHOUSE_ENTER_STATION_NUMBER" );
    maps\killhouse_code::setobjectivelocation( "obj_rifle", getent( "obj_rifle_stall", "targetname" ) );
    thread maps\killhouse_code::gaz_animation( "killhouse_gaz_idleA", 1.5 );
    level.waters maps\killhouse_code::execdialog( "youknowdrill" );

    while ( !common_scripts\utility::_id_382E( "player_at_rifle_stall" ) )
        wait 0.05;

    if ( level.short_training )
    {
        level.waters maps\killhouse_code::execdialog( "lovely" );
        thread rifle_hip_shooting();
    }
    else
        thread shoot_ads_handler();

    maps\killhouse_code::setobjectivestate( "obj_rifle", "done" );
    shootingrange_1stlanelighton();
    thread shootingrange_vo_togetback();
}

gaz_maybe_play_talk_anim()
{
    if ( level.gaz_talk_anim_chance > _func_0B2( 100 ) )
    {
        thread maps\killhouse_code::gaz_animation( "killhouse_gaz_talk" );
        level.gaz_talk_anim_chance = 0;
    }
    else
        level.gaz_talk_anim_chance += 25;
}

player_look_problem_checker( var_0 )
{
    self endon( "damage" );
    var_1 = level._id_0318 _meth_8338()[0];
    var_2 = 0;
    var_3 = 9;
    var_4 = -1 * var_3;
    var_5 = level._id_0318 _meth_80AA();
    var_6 = anglestoup( level._id_0318 _meth_8338() );
    var_7 = var_0._id_02E2 - var_5;
    var_8 = _func_0F6( var_7, var_6 );
    var_9 = var_8 > 0;

    while ( var_9 && var_2 > var_4 || !var_9 && var_2 < var_3 )
    {
        var_10 = level._id_0318 _meth_8338()[0];
        var_2 = var_10 - var_1;

        if ( var_9 && var_2 > var_3 || !var_9 && var_2 < var_4 )
        {
            common_scripts\utility::_id_383F( "player_has_look_problem" );
            break;
        }

        wait 0.05;
    }
}

new_look_training_handler()
{
    var_0 = getent( "aim_down_target", "targetname" );
    var_1 = getent( "aim_up_target", "targetname" );
    var_2 = getent( "aim_down_target_bullseye", "targetname" );
    var_3 = getent( "aim_up_target_bullseye", "targetname" );

    if ( !level._id_0318 _id_A5A4::_id_50A9() )
    {
        if ( level._id_0532 )
            thread maps\killhouse_code::keyhint( "ads_360" );
        else
            thread maps\killhouse_code::keyhint( "ads" );

        thread maps\killhouse_code::gaz_animation( "killhouse_gaz_idleA" );
        thread maps\killhouse_code::gaz_animation( "killhouse_gaz_point_front" );
        level.waters maps\killhouse_code::execdialog( "rifledownrange" );
    }

    while ( !level._id_0318 _id_A5A4::_id_50A9() )
        wait 0.05;

    if ( level._id_0532 )
        thread maps\killhouse_code::keyhint( "attack" );
    else
        thread maps\killhouse_code::keyhint( "pc_attack" );

    level.waters thread maps\killhouse_code::execdialog( "shooteachtarget" );
    var_0 thread player_look_problem_checker( var_2 );
    var_0 maps\killhouse_code::new_look_wait_for_target( 90, -90 );
    var_1 thread player_look_problem_checker( var_3 );
    var_1 maps\killhouse_code::new_look_wait_for_target( 90, -90 );

    if ( common_scripts\utility::_id_382E( "player_has_look_problem" ) )
    {
        wait 0.1;
        level._id_0318 _meth_84ED( &"MENU_TYPE_INVERT_AXIS" );
        level._id_0318 _meth_8326( 1 );
        _func_074( 2, 0.1 );
        level._id_0318 waittill( "menuresponse", var_4, var_5 );
        _func_074( 0, 0.2 );
        level._id_0318 _meth_8326( 0 );

        if ( var_5 == "try_invert" )
        {
            level.waters thread maps\killhouse_code::execdialog( "onemoretime" );
            var_1 maps\killhouse_code::new_look_wait_for_target( 90, -90 );
            var_0 maps\killhouse_code::new_look_wait_for_target( 90, -90 );
            level._id_0318 _meth_84ED( &"MENU_TYPE_INVERT_AXIS_CONFIRM" );
            level._id_0318 _meth_8326( 1 );
            _func_074( 2, 0.1 );
            level._id_0318 waittill( "menuresponse", var_4, var_5 );
            _func_074( 0, 0.2 );
            level._id_0318 _meth_8326( 0 );
        }
    }

    maps\killhouse_code::setobjectivestate( "obj_rifle", "done" );
    thread rifle_penetration_shooting();
}

shoot_ads_handler()
{
    thread maps\killhouse_code::ads_shoot_dialog();
    wait 0.1;
    maps\killhouse_code::raisetargetdummies( "rifle", undefined, undefined );
    maps\killhouse_code::setobjectivestate( "obj_rifle", "current" );
    thread maps\killhouse_code::setobjectivestring( "obj_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE" );
    thread maps\killhouse_code::flag_when_lowered( "ADS_targets_shot" );
    common_scripts\utility::_id_384A( "ADS_targets_shot" );
    common_scripts\utility::_id_384A( "ADS_shoot_dialog" );
    maps\killhouse_code::setobjectivestate( "obj_rifle", "done" );
    thread rifle_hip_shooting();
}

rifle_hip_shooting()
{
    wait 0.5;
    thread maps\killhouse_code::killhouse_hint( &"KILLHOUSE_HINT_ADS_ACCURACY", 10 );
    level.waters maps\killhouse_code::execdialog( "firingfromhip" );
    gaz_maybe_play_talk_anim();
    maps\killhouse_code::setobjectivestate_nomessage( "obj_rifle", "current" );
    maps\killhouse_code::setobjectivestring( "obj_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE1" );
    wait 1;
    var_0 = 1;

    if ( level._id_0318 _id_A5A4::_id_50A9() )
        thread maps\killhouse_code::keyhint( "stop_ads", undefined, var_0 );

    while ( level._id_0318 _id_A5A4::_id_50A9() )
        wait 0.05;

    level.waters _meth_8202( level._id_0318, 1 );
    level.hip_fire_required = 1;
    maps\killhouse_code::raisetargetdummies( "rifle", undefined, undefined );
    thread maps\killhouse_code::flag_when_lowered( "hip_targets_shot" );

    if ( level._id_0532 )
        maps\killhouse_code::keyhint( "hip_attack" );
    else
        maps\killhouse_code::keyhint( "pc_hip_attack" );

    while ( level.targets_hit == 0 )
        wait 0.1;

    var_0 = 1;
    thread maps\killhouse_code::killhouse_hint( &"KILLHOUSE_HINT_CROSSHAIR_CHANGES", 6, var_0 );
    common_scripts\utility::_id_384A( "hip_targets_shot" );
    level.hip_fire_required = 0;
    maps\killhouse_code::setobjectivestate( "obj_rifle", "current" );
    maps\killhouse_code::setobjectivestring( "obj_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE" );
    thread new_look_training_handler();
}

crosshair_dialog()
{
    wait 1;
    level.waters maps\killhouse_code::execdialog( "changessize" );
    level.waters maps\killhouse_code::execdialog( "stupidtest" );
    wait 1;
    common_scripts\utility::_id_383F( "crosshair_dialog" );
}

rifle_penetration_shooting()
{
    wait 0.5;
    level.waters maps\killhouse_code::execdialog( "blocktargets" );
    gaz_maybe_play_talk_anim();
    maps\killhouse_code::raiseplywoodwalls();

    foreach ( var_1 in level.plywoodextensioncoll )
        var_1 _meth_82BA();

    wait 1;
    level.waters thread maps\killhouse_code::execdialog( "bulletspenetrate" );
    level.waters thread maps\killhouse_code::gaz_animation( "killhouse_gaz_explain" );
    wait 1;
    level.targets_hit = 0;
    wait 0.5;
    level.waters maps\killhouse_code::execdialog( "shoottargets" );
    gaz_maybe_play_talk_anim();
    wait 0.5;
    maps\killhouse_code::raisetargetdummies_noassist( "rifle", undefined, undefined );
    maps\killhouse_code::setobjectivestate_nomessage( "obj_rifle", "current" );
    maps\killhouse_code::setobjectivestring( "obj_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_THROUGH" );
    wait 0.2;
    var_3 = maps\killhouse_code::gettargetdummies( "rifle" );
    var_4 = var_3.size;

    while ( level.targets_hit < var_4 - 1 )
        wait 0.1;

    wait 0.5;
    level.waters maps\killhouse_code::execdialog( "good" );
    maps\killhouse_code::setobjectivestate( "obj_rifle", "done" );
    maps\killhouse_code::lowerplywoodwalls();

    foreach ( var_1 in level.plywoodextensioncoll )
        var_1 _meth_82BB();

    maps\killhouse_code::lowertargetdummies( "rifle", undefined, undefined );
    common_scripts\utility::_id_383F( "inventoryNewPos" );
    wait 1.5;
    common_scripts\utility::_id_3831( "aa_rifle_training" );
    thread rifle_timed_shooting();
}

rifle_timed_start()
{
    _id_A5E8::_id_870C( "start_rifle_timed_start_checkpoint" );
    var_0 = getent( "shooting_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_8312( "g36c" );
    levelstart_lighteffects();
    thread rifle_timed_shooting();
}

rifle_timed_shooting()
{
    common_scripts\utility::_id_383F( "aa_timed_shooting_training" );
    level.waters maps\killhouse_code::execdialog( "targetspop" );
    gaz_maybe_play_talk_anim();
    level.waters maps\killhouse_code::execdialog( "hitall" );
    maps\killhouse_code::registerobjective( "obj_timed_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_AS", getent( "obj_rifle_stall", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_timed_rifle", "current" );

    if ( maps\killhouse_code::auto_aim() )
    {
        if ( level._id_0532 )
            var_0 = maps\killhouse_code::getactionbind( "ads_switch" );
        else
            var_0 = maps\killhouse_code::getactionbind( "ads_switch_shoulder" );

        var_1 = 1;
        thread maps\killhouse_code::killhouse_hint( var_0._id_48B0, 6, var_1 );
        level.waters maps\killhouse_code::execdialog( "snaponto" );
    }

    if ( level._id_0318 _meth_82F5( level.gunprimary ) < level.gunprimaryclipammo )
    {
        maps\killhouse_code::keyhint( "reload" );
        wait 2.0;
    }

    var_2 = [];
    var_2[0] = "stilltooslow";
    var_2[1] = "again";
    var_2[2] = "again2";
    var_2[3] = "walkinpark";
    var_3 = 0;

    for (;;)
    {
        maps\killhouse_code::lowertargetdummies( "rifle" );

        if ( maps\killhouse_code::auto_aim() && var_3 != 0 )
        {
            if ( level._id_0532 )
                var_0 = maps\killhouse_code::getactionbind( "ads_switch" );
            else
                var_0 = maps\killhouse_code::getactionbind( "ads_switch_shoulder" );

            var_1 = 1;
            thread maps\killhouse_code::killhouse_hint( var_0._id_48B0, 10, var_1 );
            wait 4;
        }

        level.num_hit = 0;
        thread timedtargets();
        wait 10;
        level notify( "times_up" );

        if ( level.num_hit > 6 )
            break;

        wait 1;
        var_3++;
        maps\killhouse_code::lowertargetdummies( "rifle" );

        if ( var_3 == 1 )
            level.waters maps\killhouse_code::execdialog( "tryagain" );
        else
            level.waters maps\killhouse_code::execdialog( var_2[_func_0B2( var_2.size )] );

        gaz_maybe_play_talk_anim();
        wait 2;

        if ( level._id_0318 _meth_82F5( level.gunprimary ) < level.gunprimaryclipammo )
        {
            thread maps\killhouse_code::keyhint( "reload" );

            while ( level._id_0318 _meth_82F5( level.gunprimary ) < level.gunprimaryclipammo )
                wait 0.1;

            maps\killhouse_code::_id_1EBE();
            wait 1;
        }
    }

    common_scripts\utility::_id_383F( "spawn_sidearms" );
    level notify( "show_melon" );
    level.bodysense_coll _meth_82BA();
    wait 1;
    maps\killhouse_code::setobjectivestate( "obj_timed_rifle", "done" );
    level.waters maps\killhouse_code::execdialog( "propergood" );
    level.waters thread maps\killhouse_code::gaz_animation( "killhouse_gaz_nod" );
    level notify( "rifleTraining_end" );
    wait 0.5;
    common_scripts\utility::_id_3831( "aa_timed_shooting_training" );
    thread sidearm_training();
}

timedtargets()
{
    level endon( "times_up" );
    var_0 = getentarray( "rifle_target_dummy", "script_noteworthy" );
    var_1 = -1;

    for (;;)
    {
        for (;;)
        {
            var_2 = _func_0B2( var_0.size );

            if ( var_2 != var_1 )
                break;
        }

        var_1 = var_2;
        var_0[var_2] thread maps\killhouse_code::movetargetdummy( "raise" );
        var_0[var_2] waittill( "hit" );
        level.num_hit++;
        wait 0.1;
    }
}

sidearm_start()
{
    _id_A5E8::_id_870C( "start_sidearm_start_checkpoint" );
    _id_A5A4::_id_27EF( 0.1, maps\killhouse_code::move_gaz_fake );
    var_0 = getent( "shooting_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_8312( "g36c" );
    levelstart_lighteffects();
    wait 0.5;
    level notify( "show_melon" );
    thread sidearm_training();
}

sidearm_training()
{
    common_scripts\utility::_id_383F( "aa_sidearm_melee" );
    level notify( "sideArmTraining_begin" );
    _id_A5A4::_id_1143( "sidearm_training" );
    common_scripts\utility::_id_383F( "spawn_sidearms" );
    thread maps\killhouse_code::gaz_animation( "killhouse_gaz_point_side" );
    level.waters maps\killhouse_code::execdialog( "getasidearm" );
    maps\killhouse_code::registerobjective( "obj_sidearm", &"KILLHOUSE_GET_A_PISTOL_FROM_THE", getent( "obj_rifle_ammo", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_sidearm", "current" );

    while ( !level._id_0318 _meth_8311( "usp" ) )
        wait 0.05;

    maps\killhouse_code::setobjectivestring( "obj_sidearm", &"KILLHOUSE_SWITCH_TO_YOUR_RIFLE" );
    maps\killhouse_code::setobjectivestate( "obj_sidearm", "current" );
    level.waters maps\killhouse_code::execdialog( "switchtorifle" );
    gaz_maybe_play_talk_anim();

    if ( level._id_0318 _meth_830E() != level.gunprimary )
        thread maps\killhouse_code::keyhint( "primary" );

    while ( level._id_0318 _meth_830E() != level.gunprimary )
        wait 0.05;

    maps\killhouse_code::_id_1EBE();
    level.waters maps\killhouse_code::execdialog( "pulloutsidearm" );

    if ( level._id_0318 _meth_830E() != level.gunsidearm )
        thread maps\killhouse_code::keyhint( "sidearm" );

    while ( level._id_0318 _meth_830E() != level.gunsidearm )
        wait 0.05;

    maps\killhouse_code::_id_1EBE();
    gaz_maybe_play_talk_anim();
    level.waters maps\killhouse_code::execdialog( "switchingfaster" );
    gaz_maybe_play_talk_anim();
    maps\killhouse_code::setobjectivestate( "obj_sidearm", "done" );
    common_scripts\utility::_id_383F( "sidearm_complete" );
    level notify( "sideArmTraining_end" );
    wait 0.5;
    thread melee_training();
}

melee_training()
{
    level notify( "melee_training" );
    maps\killhouse_code::registerobjective( "obj_melee", &"KILLHOUSE_MELEE_THE_WATERMELON", getent( "scr_watermelon", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_melee", "current" );

    if ( !common_scripts\utility::_id_382E( "melee_complete" ) )
        thread maps\killhouse_code::generic_compass_hint_reminder( "melee_complete", 12 );

    if ( !common_scripts\utility::_id_382E( "melee_complete" ) )
    {
        thread maps\killhouse_code::gaz_animation( "killhouse_gaz_lookdown", 0, "killhouse_gaz_lookdown_idle", 1 );
        var_0 = 0;
    }
    else
        var_0 = 1;

    if ( !common_scripts\utility::_id_382E( "near_melee" ) && !common_scripts\utility::_id_382E( "melee_complete" ) )
    {
        thread maps\killhouse_code::killhouse_hint( &"KILLHOUSE_HINT_APPROACH_MELEE", 9999 );
        level.waters thread maps\killhouse_code::execdialog( "comethisway" );
    }

    thread melee_run_dialog();

    if ( !common_scripts\utility::_id_382E( "melee_complete" ) )
        common_scripts\utility::_id_384A( "near_melee" );

    while ( !common_scripts\utility::_id_382E( "melee_complete" ) )
        maps\killhouse_code::keyhint( "melee" );

    common_scripts\utility::_id_384A( "melee_complete" );
    maps\killhouse_code::_id_1EBE();
    thread beforeopenning_firing_range_door();
    common_scripts\utility::_id_384A( "melee_run_dialog" );

    if ( var_0 )
        thread maps\killhouse_code::gaz_animation( "killhouse_gaz_talk_side_alt", 0, "killhouse_gaz_idleC", 1 );
    else
        thread maps\killhouse_code::gaz_animation( "killhouse_gaz_talk_side", 0, "killhouse_gaz_idleC", 1 );

    wait 0.5;
    common_scripts\utility::_id_383F( "spawn_frags" );
    level.waters maps\killhouse_code::execdialog( "fruitkilling" );
    maps\killhouse_code::setobjectivestate( "obj_melee", "done" );
    level notify( "meleeTraining_end" );
    common_scripts\utility::_id_3831( "aa_sidearm_melee" );
    _id_A5A4::_id_1143( "melee_complete" );

    if ( level.short_training )
    {
        level.waters maps\killhouse_code::execdialog( "wantstosee" );
        thread report_to_price();
        wait 1;
        level.waters _meth_8202( level._id_0318, 1 );
        thread frag_training();
        thread obstacle_training();
        var_1 = getentarray( "m203_ammo_obj", "script_noteworthy" );

        foreach ( var_3 in var_1 )
            var_3 _meth_8056();

        maps\killhouse_code::registerobjective( "obj_demolitions", &"KILLHOUSE_DEMOLITIONS_TRAINING", getent( "obj_frag_ammo", "targetname" ) );
        maps\killhouse_code::setobjectivestate( "obj_demolitions", "active" );
        level thread optional_training_objective_manager( "in_explosives_area", "obj_demolitions_subobj", getent( "obj_frag_ammo", "targetname" ), &"KILLHOUSE_PICK_UP_THE_FRAG_GRENADES" );
        maps\killhouse_code::setassubobjective( "obj_demolitions_subobj", 2 );
        maps\killhouse_code::registerobjective( "obj_obstacle", &"KILLHOUSE_RUN_THE_OBSTACLE_COURSE", getent( "obstacleTraining_objective", "targetname" ) );
        maps\killhouse_code::setobjectivestate( "obj_obstacle", "active" );
    }
    else
    {
        level.waters maps\killhouse_code::execdialog( "allgoodhere" );
        thread frag_training();
    }
}

infrontofvehiclescheckplayerdist()
{
    var_0 = 62500;
    self.playerinfront = 0;

    for (;;)
    {
        var_1 = anglestoforward( self.angles );
        var_2 = self._id_02E2 + var_1 * 250;

        if ( _func_225( var_2, level._id_0318._id_02E2 ) < var_0 )
        {
            common_scripts\utility::_id_383F( "infront_of_vehicle" );
            self.playerinfront = 1;
        }
        else if ( self.playerinfront )
        {
            common_scripts\utility::_id_3831( "infront_of_vehicle" );
            self.playerinfront = 0;
        }

        wait 0.5;
    }
}

infrontofvehiclescheck()
{
    level.vehicletocheckarray = [];
    level.vehicletocheckarray[level.vehicletocheckarray.size] = _id_A5A8::get_vehicle_from_targetname( "bm21_loop_01" );
    level.vehicletocheckarray[level.vehicletocheckarray.size] = _id_A5A8::get_vehicle_from_targetname( "jeep_loop_02" );
    level.vehicletocheckarray[level.vehicletocheckarray.size] = _id_A5A8::get_vehicle_from_targetname( "bm21_loop_02" );
    level.vehicletocheckarray[level.vehicletocheckarray.size] = _id_A5A8::get_vehicle_from_targetname( "jeep_loop_01" );

    foreach ( var_1 in level.vehicletocheckarray )
    {
        var_1 _id_A5A8::_id_9D01();
        var_1 maps\killhouse_aud::aud_bm21_tire_sounds();
    }

    common_scripts\utility::_id_0D13( level.vehicletocheckarray, ::infrontofvehiclescheckplayerdist );

    for (;;)
    {
        common_scripts\utility::_id_384A( "infront_of_vehicle" );

        foreach ( var_1 in level.vehicletocheckarray )
        {
            var_1 _meth_827F( 0, 20, 20 );
            var_1 thread maps\killhouse_aud::aud_vehicle_driveby_manager();
        }

        common_scripts\utility::_id_3857( "infront_of_vehicle" );

        foreach ( var_1 in level.vehicletocheckarray )
        {
            var_1 _id_A5A4::_id_9D1F();
            var_1 thread maps\killhouse_aud::aud_vehicle_driveby_reset();
        }
    }
}

whileplayerinfrontofvehicles( var_0 )
{
    wait 1;

    while ( common_scripts\utility::_id_382E( "infront_of_vehicle" ) )
    {
        var_0 _id_A5A8::_id_9D02();
        wait(_func_0B5( 0.4, 0.6 ));
        var_0 _id_A5A8::_id_9D01();
        wait(_func_0B5( 0.25, 5 ));
        var_0 _id_A5A8::_id_9D02();
        wait(_func_0B5( 0.4, 0.6 ));
        var_0 _id_A5A8::_id_9D01();
        wait(_func_0B5( 2, 3 ));
    }
}

waittodeletegaz()
{
    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "in_NoReminder_Compass" ) )
        {
            level.waters _id_A5A4::_id_8EA4();
            level.waters delete();
            break;
        }

        wait 1;
    }
}

spawnwhendooropen()
{
    thread waittodeletegaz();
    level notify( "DespawnGuysHangar1" );
    var_0 = getent( "inventory_guy", "targetname" );
    var_1 = getent( "firearmDepotGuy", "targetname" );
    var_0 _id_A5A4::_id_8EA4();
    var_1 _id_A5A4::_id_8EA4();
    var_0 delete();
    var_1 delete();
    thread outside_blur();
    common_scripts\utility::_id_0D13( getentarray( "ai_ambient", "script_noteworthy" ), _id_A5A4::_id_0798, ::ai_ambient_noprop_think );
    _id_A5A4::_id_0D0C( "patrol1", ::ai_patrol_think, 0, 1 );
    _id_A5A4::_id_0D0C( "jog1", ::ai_patrol_think, 1, 0 );
    get_joggers_start_pos();
    thread maps\killhouse_aud::aud_disable_bm21_idle();
    level.patroldudes = [];
    var_2 = getentarray( "friendlies_ambient", "targetname" );
    var_2 = common_scripts\utility::_id_0CDD( var_2, getentarray( "friendlies_ambient_drill", "targetname" ) );
    var_2 = common_scripts\utility::_id_0CDD( var_2, getentarray( "friendlies_ambient_guard", "targetname" ) );
    var_3 = getent( "ExplosiveTutoChecker", "targetname" );
    _id_A5A4::_id_2F29( var_3, 1 );

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5._id_79AD ) )
        {
            _id_A5A4::_id_2F29( var_5, 1 );
            continue;
        }

        var_5 _id_A5A4::_id_88C3( 1 );
    }

    thread joggers_formation();
    var_7 = _id_A5A8::_id_23DE( 36 );
    var_8 = _id_A5A8::_id_23DE( 33 );
    common_scripts\utility::_id_0D13( var_7, ::monitor_vehicle_damage );
    common_scripts\utility::_id_0D13( var_8, ::monitor_vehicle_damage );
    thread infrontofvehiclescheck();
    thread traffic();
    var_9 = _id_A5A8::get_vehicle_from_targetname( "IntroSeaknight" );
    var_9 _id_A5A8::_id_9D02( "running" );
    var_10 = _id_A5A8::get_vehicle_from_targetname( "abrams" );
    var_9.yawspeed = 100;
    var_9.yawaccel = 100;
    var_9 _meth_8290( 50, 10 );
    var_9 _meth_824F( 50, 10, 8 );
    var_10._id_768D = 500;
    var_10._id_7679 = 2.5;
    var_11 = getent( "tankShadowOrigin", "targetname" );
    var_10 _meth_8477( var_11._id_02E2 );
    wait 60;
    var_9 delete();
}

check_if_weapon_allowed()
{
    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "in_explosives_area" ) || common_scripts\utility::_id_382E( "in_obstacle_area" ) || common_scripts\utility::_id_382E( "in_lastTraining_area_A" ) || common_scripts\utility::_id_382E( "in_lastTraining_area_B" ) )
        {
            if ( common_scripts\utility::_id_382E( "in_lastTraining_area_A" ) || common_scripts\utility::_id_382E( "in_lastTraining_area_B" ) )
            {
                level._id_0318 _meth_82F3( "c4", 0 );
                level._id_0318 _meth_82F3( "fraggrenade", 0 );
            }

            level._id_0318 _meth_831B();

            while ( common_scripts\utility::_id_382E( "in_explosives_area" ) || common_scripts\utility::_id_382E( "in_obstacle_area" ) || common_scripts\utility::_id_382E( "in_lastTraining_area_A" ) || common_scripts\utility::_id_382E( "in_lastTraining_area_B" ) )
                wait 1;

            wait 0.1;

            if ( !common_scripts\utility::_id_382E( "in_explosives_area" ) && !common_scripts\utility::_id_382E( "in_obstacle_area" ) && !common_scripts\utility::_id_382E( "in_lastTraining_area_A" ) && !common_scripts\utility::_id_382E( "in_lastTraining_area_B" ) )
                level._id_0318 _meth_831A();
        }

        wait 1;
    }
}

dooropening_lighteffects()
{
    var_0 = getent( "OutTrigger_shootingRange_VisionSet", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    wait 2;
    var_1 = 1;
    var_2 = "killhouse_blind";
    var_3 = "killhouse";
    var_4 = "killhouse_blind";
    var_5 = "clut_killhouse";
    _id_A5A4::_id_7F00( var_2, var_1 );
    _id_A5A4::_id_395E( var_3, var_1 );
    level._id_0318 _id_A5A4::set_light_set_player( var_4 );
    level._id_0318 _meth_848C( var_5, var_1 );
    wait(var_1);
    var_1 = 3;
    var_2 = "killhouse";
    var_3 = "killhouse";
    var_4 = "killhouse";
    var_5 = "clut_killhouse";
    _id_A5A4::_id_7F00( var_2, var_1 );
    _id_A5A4::_id_395E( var_3, var_1 );
    level._id_0318 _id_A5A4::set_light_set_player( var_4 );
    level._id_0318 _meth_848C( var_5, var_1 );
    wait(var_1);
    var_0 common_scripts\utility::_id_97CE();
}

bodysense_shootingrangedooropening()
{
    var_0 = _func_0C3( "doorBodySensePos", "targetname" );
    level.playerview = _id_A5A4::_id_88D1( "view_body_door" );
    level.playerview _meth_8056();
    var_0 _id_A510::_id_0BC7( level.playerview, "player_opendoor" );
    level.playerview _id_A5A4::_id_5696( "tag_player", 1, 1, 0, 0, 0, 0 );
    level._id_0318 _meth_807F( level.playerview, "tag_player", 1, 0, 0, 0, 0 );
    level.bodysense_coll _meth_82BB();
    var_1 = getent( "rifle_range_blockSun_coll", "targetname" );
    var_1 _meth_82BB();
    level.playerview _meth_8055();
    var_0 _id_A510::_id_0C24( level.playerview, "player_opendoor" );
    level._id_0318 _meth_8051();
    level.playerview delete();
    level._id_0318 _meth_81E4( 1.0 );
    level._id_0318 _meth_811D( 1 );
    shadowoverride_firing_range_door_open();
    _id_A5A4::_id_27EF( 0.5, maps\killhouse_code::objective_hints, "reveal_dialog_starting" );
}

beforeopenning_firing_range_door()
{
    if ( level.firing_range_door_open )
        return;

    var_0 = getent( "rifle_range_door", "targetname" );
    var_1 = getent( "rifle_range_door_coll", "targetname" );
    var_1 _meth_804F( var_0 );
    var_1 _meth_805A();
    var_2 = getent( "rifle_range_doorGlass", "targetname" );
    var_2 _meth_804F( var_0 );
    var_0 _meth_809C( "h1_metal_door_open" );
    var_0 _meth_82B1( var_0.angles + ( 0, 18, 0 ), 1, 0.5, 0 );
    common_scripts\_exploder::_id_3528( 101 );
    wait 1;
    thread open_firing_range_door();
}

open_firing_range_door()
{
    if ( level.firing_range_door_open )
        return;

    var_0 = getent( "rifle_range_door", "targetname" );
    var_1 = getent( "open_firerange_door", "targetname" );
    common_scripts\utility::_id_384A( "open_firerange_door" );
    level._id_0318 _meth_81E4( 0 );
    level._id_0318 _meth_811D( 0 );
    wait 0.25;

    for (;;)
    {
        if ( !level._id_0318 _meth_8462() )
        {
            var_2 = _func_091( level._id_0318._id_02E2, 2 );

            if ( _func_0F0( var_2, level._id_0318._id_02E2 ) < 4 )
                break;
        }

        waittillframeend;
    }

    var_0 _meth_809C( "scn_killhouse_door_open" );
    thread bodysense_shootingrangedooropening();
    thread dooropening_lighteffects();
    wait 0.1;
    level._id_0318 _meth_831A();
    thread check_if_weapon_allowed();
    wait 1.4;
    thread _id_A5DE::_id_5CF2( "door_opening" );
    _id_A5A4::_id_27EF( 4, _id_A5DE::_id_5CF6, "door_opening" );
    var_0 _meth_82B1( var_0.angles + ( 0, 130, 0 ), 1, 0.5, 0 );
    level.firing_range_door_open = 1;
    thread spawnwhendooropen();
    _id_A5A4::_id_27EF( 0.5, maps\killhouse_aud::aud_activate_hangar_transition_zone );
    level notify( "out_of_firing_range" );
}

shadowoverride_firing_range_door_close()
{
    var_0 = getent( "rifle_range_door", "targetname" );
    var_1 = getent( "rifle_range_doorframe", "targetname" );
    var_2 = getent( "rifleRangeDoor_ShadowOrigin3", "targetname" );
    var_0 _meth_8477( var_2._id_02E2 );
    var_1 _meth_8477( var_2._id_02E2 );
}

shadowoverride_firing_range_door_open()
{
    var_0 = getent( "rifle_range_door", "targetname" );
    var_1 = getent( "rifle_range_doorframe", "targetname" );
    var_0 _meth_8477( var_0._id_02E2 );
    var_1 _meth_8477( var_1._id_02E2 );
}

close_firing_range_door()
{
    if ( !level.firing_range_door_open )
        return;

    var_0 = getent( "rifle_range_door", "targetname" );
    var_0 _meth_809C( "scn_killhouse_door_close" );
    var_0 _meth_82B1( var_0.angles + ( 0, -88, 0 ), 1, 0.5, 0 );
    level.firing_range_door_open = 0;
    var_1 = getent( "rifle_range_door_coll", "targetname" );
    var_1 _meth_804F( var_0 );
    var_1 _meth_805A();
}

melee_run_dialog()
{
    if ( !common_scripts\utility::_id_382E( "melee_complete" ) )
        level.waters maps\killhouse_code::execdialog( "evenfaster" );

    if ( !common_scripts\utility::_id_382E( "melee_complete" ) )
    {
        thread maps\_cheat::slowmomodesuspend();
        level.waters maps\killhouse_code::execdialog( "knifewatermelon" );
    }

    common_scripts\utility::_id_383F( "melee_run_dialog" );
}

frag_start()
{
    _id_A5E8::_id_870C( "start_frag_start_checkpoint" );
    maps\killhouse_code::registerobjective( "obj_price", &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE", getent( "obj_price", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
    var_0 = getent( "frag_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "usp" );
    level._id_0318 _meth_8312( "g36c" );
    common_scripts\utility::_id_383F( "spawn_frags" );
    thread frag_training();
}

explosive_flag_think()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_0.init_angles = var_0.angles;
    self _meth_804F( var_0 );
    self waittill( "flip_to_red" );
    var_0 _meth_82B1( var_0.init_angles + ( 0, 0, 180 ), 0.25, 0, 0 );
    wait 0.25;
    self _meth_809C( "killhouse_target_up_metal" );

    for (;;)
    {
        var_1 waittill( "trigger" );

        if ( !common_scripts\utility::_id_382E( "in_safety_pit" ) )
            continue;

        var_0 _meth_82B1( var_0.init_angles + ( 0, 0, -1 ), 0.25, 0, 0 );
        wait 0.25;
        self _meth_809C( "killhouse_target_up_metal" );
        break;
    }
}

explosive_flags_setup()
{
    level.explosive_flags = [];
    var_0 = 2;
    var_1 = 7;
    level.explosive_flags = getentarray( "explosive_flag", "targetname" );

    foreach ( var_3 in level.explosive_flags )
        var_3 thread explosive_flag_think();
}

optional_training_objective_manager( var_0, var_1, var_2, var_3 )
{
    maps\killhouse_code::registerobjective( var_1, var_3, var_2 );
    maps\killhouse_code::setobjectivestate( var_1, "active" );

    while ( level._id_6302[var_1]._id_8D56 != "done" )
    {
        if ( common_scripts\utility::_id_382E( var_0 ) && level._id_6302[var_1]._id_8D56 != "current" )
        {
            maps\killhouse_code::setobjectivestate_nomessage( "obj_price", "active" );
            maps\killhouse_code::_id_1EBE();
            maps\killhouse_code::setobjectivestate( var_1, "current" );

            if ( common_scripts\utility::_id_382E( "in_explosives_area" ) )
            {
                if ( level.currentkeyhintactionname == "plant_explosives" )
                    thread maps\killhouse_code::keyhint( level.currentkeyhintactionname, 9999, 1 );
                else if ( level.currentkeyhintactionname != "" )
                    thread maps\killhouse_code::keyhint( level.currentkeyhintactionname );
            }
        }
        else if ( !common_scripts\utility::_id_382E( var_0 ) && level._id_6302[var_1]._id_8D56 == "current" )
        {
            maps\killhouse_code::setobjectivestate_nomessage( var_1, "active" );
            maps\killhouse_code::_id_1EBE();
            maps\killhouse_code::setobjectivestate( "obj_price", "current" );
        }

        wait 1;
    }

    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
}

frag_training()
{
    common_scripts\utility::_id_384A( "approching_grenade_area" );
    level.newcastle thread maps\killhouse_code::walk_to( _func_0C3( "watch_table_node", "script_noteworthy" ) );
    common_scripts\utility::_id_384A( "in_explosives_area" );
    explosive_flags_setup();
    common_scripts\utility::_id_383F( "aa_frag" );
    level notify( "fragTraining_begin" );

    if ( !common_scripts\utility::_id_382E( "cargoshipTutoDone" ) )
        _id_A5A4::_id_1143( "frag_training" );

    common_scripts\utility::_id_383F( "start_frag_training" );
    common_scripts\utility::_id_384A( "near_grenade_area" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions", getent( "obj_frag_ammo", "targetname" ) );
    level.newcastle maps\killhouse_code::nwc_talk_animation( "timeforfun" );

    if ( !level._id_0318 _meth_82F6( "fraggrenade" ) && !maps\killhouse_code::in_pit() && common_scripts\utility::_id_382E( "in_explosives_area" ) )
        level.newcastle maps\killhouse_code::nwc_talk_animation( "pickupfrag" );

    while ( level._id_0318 _meth_82F6( "fraggrenade" ) < 3 )
        wait 0.05;

    common_scripts\utility::_id_383F( "got_frags" );
    getent( "grenade_too_low", "targetname" ) thread maps\killhouse_code::frag_too_low_hint();
    thread maps\killhouse_code::frag_trigger_think( "frag_target_1", getent( "grenade_damage_trigger1", "targetname" ) );
    thread maps\killhouse_code::frag_trigger_think( "frag_target_2", getent( "grenade_damage_trigger2", "targetname" ) );
    thread maps\killhouse_code::frag_trigger_think( "frag_target_3", getent( "grenade_damage_trigger3", "targetname" ) );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", getent( "safety_pit", "targetname" ) );
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_ENTER_THE_SAFETY_PIT" );
    thread maps\killhouse_code::dialog_nag_till_in_pit();
    getent( "safety_pit", "targetname" ) waittill( "trigger" );
    common_scripts\utility::_id_383F( "in_pit_with_frags" );
    var_0 = _func_0C3( "watch_pit_node", "script_noteworthy" );
    level.newcastle thread maps\killhouse_code::nwc_talk_animation( "throwgrenade" );
    thread maps\killhouse_code::keyhint( "frag" );
    level.currentkeyhintactionname = "frag";

    foreach ( var_2 in level.explosive_flags )
    {
        if ( var_2._id_0398 == "frag" )
            var_2 notify( "flip_to_red" );
    }

    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_THROW_A_GRENADE_INTO" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", getent( "safety_pit", "targetname" ) );
    wait 0.1;
    var_4 = 0;

    for ( var_5 = 1; var_5 < 4; var_5++ )
    {
        if ( common_scripts\utility::_id_382E( "frag_target_" + var_5 ) )
            continue;

        var_4++;
    }

    while ( var_4 )
    {
        if ( !common_scripts\utility::_id_382E( "in_safety_pit" ) )
        {
            common_scripts\utility::_id_3831( "in_pit_with_frags" );
            waittillframeend;
            continue;
        }

        common_scripts\utility::_id_383F( "in_pit_with_frags" );
        var_6 = 0;
        var_7 = "";

        if ( !common_scripts\utility::_id_382E( "frag_target_1" ) )
        {
            var_6++;
            var_7 = "firstwindow";
        }

        if ( !common_scripts\utility::_id_382E( "frag_target_2" ) )
        {
            var_6++;

            if ( var_7 == "" )
                var_7 = "secondwindow";
        }

        if ( !common_scripts\utility::_id_382E( "frag_target_3" ) )
        {
            var_6++;

            if ( var_7 == "" )
                var_7 = "dumpster";
        }

        if ( !var_6 )
            break;

        if ( var_6 != var_4 )
        {

        }
        else
        {

        }

        var_4 = var_6;
        wait 0.05;
    }

    wait 1.0;
    common_scripts\utility::_id_383F( "fragTraining_end" );
    level.currentkeyhintactionname = "";
    thread launchertraining();
    common_scripts\utility::_id_3831( "aa_frag" );
    maps\killhouse_code::_id_1EBE();
}

launcher_trigger_think( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_383D( var_0 );
    var_1.aim_assist = getent( var_1._id_0398, "targetname" );
    var_1._id_0251 = getent( var_1._id_04A4, "targetname" );
    var_1.aim_assist _meth_81B9();

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    for (;;)
    {
        var_1 waittill( "trigger" );

        if ( !common_scripts\utility::_id_382E( "in_safety_pit" ) )
            continue;

        common_scripts\utility::_id_383F( var_0 );
        level._id_0318 _meth_809C( "killhouse_buzzer" );
        var_1.aim_assist _meth_81D7();
        return var_1;
    }
}

gl_too_low_hint()
{
    level endon( "launcherTraining_end" );

    for (;;)
    {
        self waittill( "trigger" );
        maps\killhouse_code::_id_1EBE();
        level.currentkeyhintactionname = "";
        maps\killhouse_code::killhouse_hint( &"KILLHOUSE_HINT_GL_TOO_LOW", 6 );
    }
}

launcher_start()
{
    _id_A5E8::_id_870C( "start_launcher_start_checkpoint" );
    maps\killhouse_code::registerobjective( "obj_price", &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE", getent( "obj_price", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
    var_0 = getent( "frag_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "usp" );
    level._id_0318 _meth_8312( "g36c" );
    explosive_flags_setup();
    common_scripts\utility::_id_383F( "spawn_frags" );
    wait 0.1;
    thread launchertraining();
    thread launcherammocheck();
}

launcherammocheck()
{
    var_0 = 1;
    var_1 = getentarray( "m203_ammo", "script_noteworthy" );
    var_2 = getentarray( "m203_ammo_obj", "script_noteworthy" );

    foreach ( var_4 in var_2 )
        var_4 _meth_8055();

    for (;;)
    {
        var_6 = level._id_0318 _meth_82F6( "alt_m16_grenadier" ) + level._id_0318 _meth_82F5( "alt_m16_grenadier" );
        var_7 = 4 - var_6;

        if ( level._id_0318 _meth_8311( "m16_grenadier" ) && var_7 > 0 && common_scripts\utility::_id_382E( "grenadeAmmoFlag" ) )
        {
            if ( var_0 )
            {
                for ( var_8 = 0; var_8 < var_7; var_8++ )
                    var_1[var_8] delete();

                foreach ( var_4 in var_2 )
                    var_4 _meth_8056();

                var_0 = 0;
            }

            level._id_0318 _meth_832F( "alt_m16_grenadier" );
            level._id_0318 thread _id_A5A4::_id_69C4( "wpn_ammo_pickup_plr" );
            wait 1.75;
        }

        wait 0.25;
    }
}

launchertraining()
{
    common_scripts\utility::_id_383F( "aa_launcher" );
    level notify( "launcherTraining_begin" );

    if ( !common_scripts\utility::_id_382E( "cargoshipTutoDone" ) )
        _id_A5A4::_id_1143( "launcher_training" );

    common_scripts\utility::_id_383F( "spawn_launcher" );

    if ( !level._id_0318 _meth_8311( "m16_grenadier" ) )
        level.newcastle maps\killhouse_code::nwc_talk_animation( "pickuplauncher" );

    _id_A5A4::_id_3847( "launcher_wall_target", getent( "launcher_wall_trigger", "script_noteworthy" ) );
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_PICK_UP_THE_RIFLE_WITH" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", getent( "obj_frag_ammo", "targetname" ) );

    while ( !level._id_0318 _meth_8311( "m16_grenadier" ) )
        wait 0.05;

    level._id_0318 _meth_832F( "alt_m16_grenadier" );
    refreshhudammocounter();
    thread launcherammocheck();
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_RETURN_TO_THE_SAFETY" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", getent( "safety_pit", "targetname" ) );

    if ( !level._id_0318 _meth_80AB( getent( "safety_pit", "targetname" ) ) )
        level.newcastle maps\killhouse_code::nwc_talk_animation( "nowbacktopit" );

    getent( "safety_pit", "targetname" ) waittill( "trigger" );

    if ( !( level._id_0318 _meth_830E() == "alt_m16_grenadier" ) )
    {
        level.newcastle maps\killhouse_code::nwc_talk_animation( "equiplauncher" );
        thread maps\killhouse_code::keyhint( "firemode" );
        refreshhudammocounter();
        level.currentkeyhintactionname = "firemode";
    }

    while ( !( level._id_0318 _meth_830E() == "alt_m16_grenadier" ) || !common_scripts\utility::_id_382E( "in_explosives_area" ) )
        wait 1.0;

    maps\killhouse_code::_id_1EBE();
    level.currentkeyhintactionname = "";
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_FIRE_AT_THE_WALL_WITH" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", getent( "safety_pit", "targetname" ) );
    wait 0.1;
    level.newcastle maps\killhouse_code::nwc_talk_animation( "firewall1" );

    if ( level._id_0532 )
    {
        thread maps\killhouse_code::keyhint( "attack_launcher" );
        level.currentkeyhintactionname = "attack_launcher";
    }
    else
    {
        thread maps\killhouse_code::keyhint( "pc_attack_launcher" );
        level.currentkeyhintactionname = "pc_attack_launcher";
    }

    while ( !common_scripts\utility::_id_382E( "launcher_wall_target" ) )
        wait 1;

    maps\killhouse_code::_id_1EBE();
    level.currentkeyhintactionname = "";
    wait 0.1;
    level.newcastle maps\killhouse_code::nwc_talk_animation( "didntexplode" );
    level.newcastle maps\killhouse_code::nwc_talk_animation( "safearming" );
    level.newcastle thread maps\killhouse_code::nwc_talk_animation( "56and7" );

    foreach ( var_1 in level.explosive_flags )
    {
        if ( var_1._id_0398 == "launcher" )
            var_1 notify( "flip_to_red" );
    }

    common_scripts\utility::_id_0D13( getentarray( "gl_too_low", "targetname" ), ::gl_too_low_hint );
    var_3 = getent( "launcher_damage_trigger1", "targetname" );
    var_4 = getent( "launcher_damage_trigger2", "targetname" );
    var_5 = getent( "launcher_damage_trigger3", "targetname" );
    thread launcher_trigger_think( "launcher_target_1", var_3, 0 );
    thread launcher_trigger_think( "launcher_target_2", var_4, 0 );
    thread launcher_trigger_think( "launcher_target_3", var_5, 0 );
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_FIRE_YOUR_GRENADE_LAUNCHER" );
    var_6 = 0;

    for ( var_7 = 1; var_7 < 4; var_7++ )
    {
        if ( common_scripts\utility::_id_382E( "launcher_target_" + var_7 ) )
            continue;

        var_6++;
    }

    while ( var_6 )
    {
        if ( !common_scripts\utility::_id_382E( "in_safety_pit" ) )
        {
            common_scripts\utility::_id_3831( "in_pit_with_frags" );
            waittillframeend;
            continue;
        }

        common_scripts\utility::_id_383F( "in_pit_with_frags" );
        var_8 = 0;
        var_9 = "";

        if ( !common_scripts\utility::_id_382E( "launcher_target_1" ) )
        {
            var_8++;
            var_9 = "hittwo";
        }

        if ( !common_scripts\utility::_id_382E( "launcher_target_2" ) )
        {
            var_8++;

            if ( var_9 == "" )
                var_9 = "hitthree";
        }

        if ( !common_scripts\utility::_id_382E( "launcher_target_3" ) )
        {
            var_8++;

            if ( var_9 == "" )
                var_9 = "hitfour";
        }

        if ( !var_8 )
            break;

        if ( var_8 != var_6 )
        {

        }
        else
        {

        }

        var_6 = var_8;
        wait 0.05;
    }

    level.currentkeyhintactionname = "";
    wait 1.0;
    wait 1.0;
    var_10 = getentarray( "m203_ammo_obj", "script_noteworthy" );

    foreach ( var_12 in var_10 )
        var_12 _meth_8056();

    common_scripts\utility::_id_3831( "aa_launcher" );
    thread c4_training();
}

explosives_start()
{
    _id_A5E8::_id_870C( "start_explosives_start_checkpoint" );
    maps\killhouse_code::registerobjective( "obj_price", &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE", getent( "obj_price", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
    var_0 = getent( "c4_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "m16_grenadier" );
    level._id_0318 _meth_8312( "m16_grenadier" );
    common_scripts\utility::_id_383F( "spawn_frags" );
    wait 0.1;
    thread c4_training();
}

c4_training()
{
    common_scripts\utility::_id_383F( "aa_c4" );
    level notify( "explosivesTraining_begin" );

    if ( !common_scripts\utility::_id_382E( "cargoshipTutoDone" ) )
        _id_A5A4::_id_1143( "c4_training" );

    var_0 = _id_A5A4::_id_3847( "explosives_pickup", getent( "c4_pickup", "targetname" ) );
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    var_0 _meth_80DD( &"KILLHOUSE_C4_PICKUP" );
    var_0 common_scripts\utility::_id_97CE();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_8055();

    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_PICK_UP_THE_C4_EXPLOSIVE" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", var_0 );
    level.newcastle thread maps\killhouse_code::nwc_talk_animation( "c4offtable" );
    level.newcastle thread maps\killhouse_code::jog_to( _func_0C3( "c4_give_node", "script_noteworthy" ) );

    while ( !common_scripts\utility::_id_382E( "explosives_pickup" ) )
        wait 0.05;

    level._id_0318 _meth_809C( "detpack_pickup" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_8056();

    var_0 common_scripts\utility::_id_97CC();
    var_3 = level._id_0318 _meth_830E();
    level._id_0318 _meth_830B( "c4" );
    level._id_0318 _meth_82F3( "c4", 1 );
    level._id_0318 _meth_8305( 2, "weapon", "c4" );
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_EQUIP_C4" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", level.newcastle );
    refreshhudammocounter();
    thread flag_when_c4_thrown();
    wait 0.5;

    if ( !( level._id_0318 _meth_830E() == "c4" ) )
    {
        level.newcastle maps\killhouse_code::nwc_talk_animation( "equipc4" );
        thread maps\killhouse_code::keyhint( "equip_C4" );
        level notify( "c4_equiped" );
        refreshhudammocounter();
    }

    while ( !( level._id_0318 _meth_830E() == "c4" ) || !common_scripts\utility::_id_382E( "in_explosives_area" ) )
        wait 1.0;

    maps\killhouse_code::_id_1EBE();
    level.newcastle waittill( "goal" );
    wait 0.5;
    level.newcastle thread maps\killhouse_code::jog_to( _func_0C3( "c4_carshow_node", "script_noteworthy" ) );
    wait 0.5;
    level.newcastle thread maps\killhouse_code::nwc_talk_animation( "followme2" );
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_FOLLOW_SGTNEWCASTLE" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", _func_0C3( "c4_carshow_node", "script_noteworthy" ) );
    common_scripts\utility::_id_383F( "c4_equiped" );
    level.currentkeyhintactionname = "";
    var_4 = 1;
    refreshhudammocounter();
    var_5 = getent( "wife_dialog_trigger", "targetname" );
    var_5 waittill( "trigger" );
    level.newcastle maps\killhouse_code::nwc_talk_animation( "exwifecar" );
    level.newcastle waittill( "goal" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", getent( "c4_target", "targetname" ) );
    level.newcastle thread maps\killhouse_code::nwc_talk_animation( "placec4" );
    var_6 = getent( "c4_target", "targetname" );
    var_6 maps\_c4::c4_location( undefined, undefined, undefined, var_6._id_02E2 );
    level thread _id_A5A4::_id_2BC3( _id_A5A4::_id_A099, "c4_in_place", common_scripts\utility::_id_383F, "C4_planted" );
    wait 1.0;
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_PLANT_THE_C4_EXPLOSIVE" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", var_6 );
    thread maps\killhouse_code::keyhint( "plant_explosives", 9999, 1 );
    level.currentkeyhintactionname = "plant_explosives";
    common_scripts\utility::_id_384A( "C4_planted" );
    level.currentkeyhintactionname = "";
    level._id_0318 _meth_82F3( "c4", 0 );
    var_6 thread force_detonation();
    maps\killhouse_code::setobjectivestring( "obj_demolitions_subobj", &"KILLHOUSE_SAFE_DISTANCE" );
    maps\killhouse_code::setobjectivelocation( "obj_demolitions_subobj", var_6 );
    maps\killhouse_code::_id_1EBE();

    if ( !common_scripts\utility::_id_382E( "car_destroyed" ) )
        level.newcastle maps\killhouse_code::nwc_talk_animation( "safedistance" );

    while ( _func_0EE( var_6._id_02E2, level._id_0318._id_02E2 ) <= 256 && !common_scripts\utility::_id_382E( "car_destroyed" ) )
        wait 0.05;

    if ( !common_scripts\utility::_id_382E( "car_destroyed" ) )
    {
        level.newcastle maps\killhouse_code::nwc_talk_animation( "fireinhole" );
        thread maps\killhouse_code::keyhint( "detonate_C4", 9999 );
        level.currentkeyhintactionname = "detonate_C4";
    }

    common_scripts\utility::_id_384A( "car_destroyed" );
    level.currentkeyhintactionname = "";
    thread switch_in_two( var_3 );
    maps\killhouse_code::_id_1EBE();
    maps\killhouse_code::setobjectivestate( "obj_demolitions_subobj", "done" );
    objective_delete( level._id_6302["obj_demolitions_subobj"]._id_4B53 );
    maps\killhouse_code::setobjectivestate( "obj_demolitions", "done" );
    thread c4_complete_dialog();
    level notify( "explosivesTraining_end" );
    common_scripts\utility::_id_3831( "aa_c4" );
}

switch_in_two( var_0 )
{
    wait 2;
    level._id_0318 _meth_8312( var_0 );
}

force_detonation()
{
    self waittill( "c4_detonation" );
    wait 0.05;
    var_0 = getent( "destructible", "targetname" );
    var_0 _id_A5A4::_id_290F();
    common_scripts\_exploder::_id_3528( 396 );
}

flag_when_c4_thrown()
{
    for (;;)
    {
        level._id_0318 waittill( "grenade_fire", var_0 );

        if ( level._id_0318 _meth_830E() == "c4" )
        {
            common_scripts\utility::_id_383F( "c4_thrown" );
            return;
        }
    }
}

c4_complete_dialog()
{
    level.newcastle maps\killhouse_code::execdialog( "chuckle" );
    level.newcastle maps\killhouse_code::nwc_talk_animation( "muchimproved" );

    if ( !common_scripts\utility::_id_382E( "start_obstacle" ) )
        level.newcastle maps\killhouse_code::nwc_talk_animation( "passedeval" );
}

obstacle_start()
{
    _id_A5E8::_id_870C( "start_course_start_checkpoint" );
    maps\killhouse_code::registerobjective( "obj_price", &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE", getent( "obj_price", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
    var_0 = getent( "start_obstacle_course", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "m16_grenadier" );
    level._id_0318 _meth_8312( "m16_grenadier" );
    common_scripts\utility::_id_383F( "spawn_frags" );
    thread obstacle_training();
}

obstacle_training()
{
    var_0 = getent( "obstacle_course_prepare", "targetname" );
    var_1 = getent( "buddy1", "targetname" );
    var_1 _meth_81A7( 1 );
    var_1 _id_A5A4::_id_2A8D();
    var_1._id_2AF3 = 1;
    var_1._id_2B0E = 1;
    var_2 = _func_0C3( "obstacle_lane_node1", "targetname" );
    var_3 = getent( "buddy2", "targetname" );
    var_3 _meth_81A7( 1 );
    var_3 _id_A5A4::_id_2A8D();
    var_3._id_2AF3 = 1;
    var_3._id_2B0E = 1;
    var_4 = _func_0C3( "obstacle_lane_node2", "targetname" );
    var_5 = getent( "buddy3", "targetname" );
    var_5 _meth_81A7( 1 );
    var_5 _id_A5A4::_id_2A8D();
    var_5._id_2AF3 = 1;
    var_5._id_2B0E = 1;
    var_6 = _func_0C3( "obstacle_lane_node3", "targetname" );
    var_1._id_2AF3 = 1;
    var_1.exitconditioncheckfunc = maps\killhouse_code::killhouse_guy_exitconditionoverride;
    var_3._id_2AF3 = 1;
    var_3.exitconditioncheckfunc = maps\killhouse_code::killhouse_guy_exitconditionoverride;
    var_5._id_2AF3 = 1;
    var_5.exitconditioncheckfunc = maps\killhouse_code::killhouse_guy_exitconditionoverride;
    var_0 waittill( "trigger" );
    var_1 _meth_81A9( var_2 );
    wait 0.1;
    var_3 _meth_81A9( var_4 );
    wait 0.1;
    var_5 _meth_81A9( var_6 );
    getent( "obstacle_course_start", "targetname" ) waittill( "trigger" );
    var_7 = getent( "ai_obstacle_shooter", "targetname" );
    common_scripts\utility::_id_383F( "aa_obstacle" );
    level notify( "obstacleTraining_start" );
    level thread optional_training_objective_manager( "in_obstacle_area", "obj_obstacle_subobj", getent( "obstacleTraining_objective", "targetname" ), &"KILLHOUSE_LINE_UP_AND_RUN_TO_THE_END" );
    maps\killhouse_code::setassubobjective( "obj_obstacle_subobj", 2 );
    common_scripts\utility::_id_383F( "start_obstacle" );
    _id_A5A4::_id_3847( "prone_entered", getent( "obstacleTraining_prone", "targetname" ) );
    thread maps\killhouse_code::obstacletraining_buddies();
    thread obstacletraining_dialog();
    common_scripts\utility::_id_384A( "start_course" );
    var_7 thread ai_obstacle_course_shooter();
    maps\killhouse_code::setobjectivelocation( "obj_obstacle", getent( "obj_course_end", "targetname" ) );
    var_8 = getentarray( "move_mac", "targetname" );
    common_scripts\utility::_id_0D13( var_8, maps\killhouse_code::move_mac );
    getent( "obstacleTraining_mantle", "targetname" ) waittill( "trigger" );
    thread maps\killhouse_code::keyhintmantle( 5.0 );
    common_scripts\utility::_id_384A( "obstacleTraining_crouch" );
    thread maps\killhouse_code::keyhint( "crouch", 10.0 );
    common_scripts\utility::_id_384A( "obstacleTraining_mantle2" );
    thread maps\killhouse_code::keyhintmantle( 5.0 );
    common_scripts\utility::_id_384A( "prone_entered" );
    thread maps\killhouse_code::keyhintprone( 10.0 );
    getent( "obstacleTraining_Standup", "targetname" ) waittill( "trigger" );
    thread maps\killhouse_code::keyhint( "stand", 5.0 );
    maps\killhouse_code::clear_hints_on_stand();
    wait 0.1;

    if ( level._id_0532 )
        maps\killhouse_code::keyhint( "sprint", 5.0 );
    else
        maps\killhouse_code::keyhint( "sprint_pc", 5.0 );

    common_scripts\utility::_id_383F( "player_sprinted" );

    if ( !common_scripts\utility::_id_382E( "obstacle_course_end" ) )
        thread maps\killhouse_code::second_sprint_hint();

    common_scripts\utility::_id_384A( "obstacle_course_end" );
    level notify( "kill_sprint_hint" );
    maps\killhouse_code::_id_1EBE();
    maps\killhouse_code::setobjectivestate( "obj_obstacle_subobj", "done" );
    objective_delete( level._id_6302["obj_obstacle_subobj"]._id_4B53 );
    maps\killhouse_code::setobjectivestate( "obj_obstacle", "done" );
    common_scripts\utility::_id_3831( "aa_obstacle" );
}

ai_obstacle_course_shooter()
{
    var_0 = self _meth_8096();
    var_0 _meth_81A9( _func_0C3( self._id_04A4, "targetname" ) );
    var_0 waittill( "goal" );
    var_0 _id_A5A4::_id_30B0();
    var_0.target_dummy = getent( "obstacle_shoot_target", "targetname" );
    thread ai_obstacle_course_target_think();

    for (;;)
    {
        while ( common_scripts\utility::_id_382E( "people_crawling" ) )
        {
            var_1 = _func_0B4( 10, 15 );

            for ( var_2 = 0; var_2 < var_1; var_2++ )
            {
                var_0._id_840F = var_0.target_dummy._id_02E2;
                var_0 _meth_81EA( 0.9, var_0.target_dummy._id_02E2 );
                wait 0.1;
            }

            wait(_func_0B5( 0.5, 1 ));
        }

        wait 0.1;
    }
}

ai_obstacle_course_target_think()
{
    var_0 = getent( "obstacle_shoot_target", "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_0.init_pos = var_0._id_02E2;

    while ( common_scripts\utility::_id_382E( "start_obstacle" ) )
    {
        while ( common_scripts\utility::_id_382E( "people_crawling" ) )
        {
            if ( _func_0EE( var_0._id_02E2, var_1._id_02E2 ) <= 0.1 )
                var_0 _meth_82AA( var_0.init_pos, _func_0B5( 1, 2 ) );
            else if ( _func_0EE( var_0._id_02E2, var_0.init_pos ) <= 0.1 )
                var_0 _meth_82AA( var_1._id_02E2, _func_0B5( 1, 2 ) );

            wait 0.5;
        }

        wait 0.5;
    }
}

obstacletraining_dialog()
{
    level endon( "obstacleTraining_end" );
    level.mac maps\killhouse_code::execdialog( "misssoap" );

    if ( !common_scripts\utility::_id_382E( "start_course" ) )
    {
        level.mac maps\killhouse_code::execdialog( "lineup" );
        wait 2;
        common_scripts\utility::_id_383F( "start_course" );
    }

    level.mac _meth_809C( "killhouse_mcm_go" );
    common_scripts\utility::_id_383F( "start_course" );
    wait 2;
    level.mac maps\killhouse_code::execdialog( "isntcharitywalk" );
    common_scripts\utility::_id_384A( "obstacleTraining_mantle2" );
    level.mac maps\killhouse_code::execdialog( "jumpobstacles" );
    common_scripts\utility::_id_384A( "crawl_dialog" );
    level.mac maps\killhouse_code::execdialog( "youcrawllike" );

    if ( !common_scripts\utility::_id_382E( "obstacle_course_end" ) )
        level.mac maps\killhouse_code::execdialog( "commandos" );

    if ( !common_scripts\utility::_id_382E( "obstacle_course_end" ) )
        level.mac maps\killhouse_code::execdialog( "bertud" );

    common_scripts\utility::_id_384A( "player_sprinted" );
    common_scripts\utility::_id_384A( "obstacle_course_end" );
    level.mac maps\killhouse_code::execdialog( "passedtest" );
    level.mac maps\killhouse_code::execdialog( "runitagain" );
    thread maps\killhouse_code::loop_obstacle();
}

reveal_start()
{
    _id_A5E8::_id_870C( "start_reveal_start_checkpoint" );
    var_0 = getent( "start_reveal", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "m16_grenadier" );
    level._id_0318 _meth_8312( "m16_grenadier" );
    thread report_to_price();
}

report_to_price()
{
    common_scripts\utility::_id_383F( "aa_cargoship" );
    wait 0.1;
    maps\killhouse_code::registerobjective( "obj_price", &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE", getent( "obj_price", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
    var_0 = getentarray( "ship_hanger_door", "targetname" );
    level._id_6F7C _id_A5A4::_id_4462();
    var_1 = getent( "sas1", "script_noteworthy" );
    var_2 = getent( "sas2", "script_noteworthy" );
    var_3 = getent( "sas3", "script_noteworthy" );
    var_1._id_0C72 = "sas1";
    var_2._id_0C72 = "sas2";
    var_3._id_0C72 = "sas3";
    var_1 maps\killhouse_code::specify_head_model( "head_sas_ct_assault_mitchel" );
    level.mocaporiginhangar3 = getent( "mocapRevealPos", "targetname" );
    level.mocaporiginhangar3 thread _id_A510::_id_0BE1( level._id_6F7C, "h1_price_before_reveal_idle", undefined, "stop_before_reveal" );
    level.mocaporiginhangar3 thread _id_A510::_id_0BE1( var_1, "h1_sas1_before_reveal_idle", undefined, "stop_before_reveal" );
    level.mocaporiginhangar3 thread _id_A510::_id_0BE1( var_2, "h1_sas2_before_reveal_idle", undefined, "stop_before_reveal" );
    level.mocaporiginhangar3 thread _id_A510::_id_0BE1( var_3, "h1_sas3_before_reveal_idle", undefined, "stop_before_reveal" );
    var_4 = getent( "lovejoy", "targetname" );
    var_4 _meth_81A7( 1 );
    level.sas_blackkits = [];
    level.sas_blackkits[level.sas_blackkits.size] = var_1;
    level.sas_blackkits[level.sas_blackkits.size] = var_2;
    level.sas_blackkits[level.sas_blackkits.size] = var_3;
    var_5 = getent( "reveal_node", "targetname" );
    common_scripts\utility::_id_383F( "obstacle_complete" );
    common_scripts\utility::_id_384A( "open_ship_hanger" );
    level.mocaporiginhangar3 notify( "stop_before_reveal" );
    var_5 thread reveal_anims( level.sas_blackkits, var_2 );
    common_scripts\utility::_id_384A( "open_ship_hanger" );
    var_0[0] _meth_809C( "door_hanger_metal_open" );
    maps\killhouse_code::cqb_timer_setup();
    thread _id_A5A4::_id_2BC3( common_scripts\utility::_id_384A, "at_ladder", maps\killhouse_code::killhouse_hint, &"KILLHOUSE_HINT_LADDER" );

    foreach ( var_7 in var_0 )
        var_7 _meth_82AB( 137.5, 10, 0.3, 0 );

    thread cargoship_training();
}

reveal_anims( var_0, var_1 )
{
    var_2 = getent( "looking_at_price", "targetname" );
    level.mocaporiginhangar3 _id_A5A4::_id_07BE( _id_A510::_id_0C18, var_0, "reveal" );
    level _id_A5A4::_id_075F( common_scripts\utility::_id_383F, "reveal_done" );
    thread _id_A5A4::_id_2BDC();
    level.mocaporiginhangar3 _id_A5A4::_id_07BE( _id_A510::_id_0C24, level._id_6F7C, "reveal" );
    level _id_A5A4::_id_075F( common_scripts\utility::_id_383F, "price_reveal_done" );
    thread _id_A5A4::_id_2BDC();
    wait 2;
    wait 3;
    maps\killhouse_code::setobjectivestate( "obj_price", "done" );
    maps\killhouse_code::_id_1EBE();
    common_scripts\utility::_id_383F( "reveal_dialog_starting" );
    var_3 = getent( "ship_hanger_clip", "targetname" );
    var_3 delete();
    common_scripts\utility::_id_384A( "reveal_done" );

    foreach ( var_5 in var_0 )
        level.mocaporiginhangar3 thread _id_A510::_id_0BE1( var_5, "reveal_idle", undefined, "end_idle" );

    common_scripts\utility::_id_384A( "price_reveal_done" );
    level.mocaporiginhangar3 thread _id_A510::_id_0BE1( level._id_6F7C, "reveal_idle", undefined, "end_idle" );
}

reveal_dialog_ladder( var_0 )
{
    if ( !common_scripts\utility::_id_382E( "at_ladder" ) )
        level._id_6F7C _meth_809C( "killhouse_pri_ladderthere" );

    maps\killhouse_code::setobjectivestring( "obj_price", &"KILLHOUSE_CLIMB_THE_LADDER1" );
    maps\killhouse_code::setobjectivelocation( "obj_price", getent( "top_of_ladder_trigger", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
    common_scripts\utility::_id_383F( "reveal_dialog_done" );
}

reveal_dialog( var_0 )
{
    wait 1;
}

cargoship_start()
{
    _id_A5E8::_id_870C( "start_cargoship_start_checkpoint" );
    var_0 = getent( "start_pre_rope", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "m16_grenadier" );
    level._id_0318 _meth_8312( "m16_grenadier" );
    maps\killhouse_code::registerobjective( "obj_price", &"KILLHOUSE_CLIMB_THE_LADDER", getent( "top_of_rope_trigger", "targetname" ) );
    maps\killhouse_code::setobjectivestate( "obj_price", "current" );
    common_scripts\utility::_id_383F( "reveal_dialog_done" );
    maps\killhouse_code::cqb_timer_setup();
    thread cargoship_training();
}

cargoship_training()
{
    level endon( "clear_course" );
    level endon( "mission failed" );
    var_0 = getentarray( "cargoship_target", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, maps\killhouse_code::cargoship_targets );
    thread maps\killhouse_code::_id_75E0();
    thread maps\killhouse_code::timer_think();
    var_1 = getent( "top_of_rope_trigger", "targetname" );
    var_2 = getent( "near_rope", "targetname" );
    var_3 = getent( "top_of_rope", "targetname" );
    var_4 = getent( "top_of_ladder_trigger", "targetname" );
    var_5 = getent( "position_one", "targetname" );
    var_6 = getent( "position_two", "targetname" );
    var_7 = getent( "position_three", "targetname" );
    var_8 = getent( "position_four", "targetname" );
    var_9 = getent( "position_five", "targetname" );
    var_10 = getent( "position_six", "targetname" );
    var_11 = getent( "sprint", "targetname" );
    var_12 = getent( "final_obj", "targetname" );
    setdvar( "killhouse_too_slow", "0" );
    thread maps\killhouse_aud::aud_fail_mix();
    var_13 = getent( var_7._id_0398, "targetname" );
    var_14 = getent( var_10._id_0398, "targetname" );
    var_15 = 1;
    var_16 = 0;
    var_17 = "none";
    var_18 = getentarray( "flash_volume", "script_noteworthy" );
    var_19 = getent( "jump_off_trigger", "targetname" );
    common_scripts\utility::_id_384A( "at_top_of_ladder" );
    maps\killhouse_code::_id_1EBE();
    common_scripts\utility::_id_384A( "reveal_dialog_done" );
    wait 0.5;
    thread _id_A5A4::_id_1143( "ladder_top" );
    var_19 thread maps\killhouse_code::jumpoff_monitor();

    for (;;)
    {
        if ( var_15 )
        {
            if ( !( level._id_0318 _meth_830E() == "mp5" ) || level._id_0318 _meth_82F6( "flash_grenade" ) < 4 )
            {
                level._id_6F7C thread maps\killhouse_code::execdialog( "pickupmp5" );
                maps\killhouse_code::setobjectivestring( "obj_price", &"KILLHOUSE_EQUIP_THE_MP5_AND_PICK" );
                maps\killhouse_code::setobjectivelocation( "obj_price", getent( "obj_flashes", "targetname" ) );
            }
        }
        else
        {
            var_19 thread maps\killhouse_code::jumpoff_monitor();
            level._id_6F7C maps\killhouse_code::execdialog( "replaceflash" );

            if ( !( level._id_0318 _meth_830E() == "mp5" ) )
                level._id_6F7C maps\killhouse_code::execdialog( "equipmp5" );
        }

        for ( var_20 = 0; !( level._id_0318 _meth_830E() == "mp5" ); var_20++ )
        {
            if ( level._id_0318 _meth_80AB( var_2 ) && var_20 > 8 )
            {
                level._id_6F7C thread maps\killhouse_code::execdialog( "soapequipmp5" );
                var_20 = 0;
            }

            wait 1.0;
        }

        for ( var_20 = 0; level._id_0318 _meth_82F6( "flash_grenade" ) < 4; var_20++ )
        {
            if ( level._id_0318 _meth_80AB( var_2 ) && var_20 > 8 )
            {
                level._id_6F7C thread maps\killhouse_code::execdialog( "soap4flash" );
                var_20 = 0;
            }

            wait 1.0;
        }

        maps\killhouse_code::setobjectivestate( "obj_price", "done" );

        if ( var_15 )
            common_scripts\utility::_id_383F( "got_flashes" );

        thread maps\killhouse_code::flashbang_ammo_monitor( var_18 );

        if ( var_15 )
        {
            level._id_6F7C maps\killhouse_code::execdialog( "ropedeck" );
            level._id_6F7C maps\killhouse_code::execdialog( "stormstairs" );
            level._id_6F7C maps\killhouse_code::execdialog( "hit3and4" );
            level._id_6F7C maps\killhouse_code::execdialog( "grabrope" );
        }

        _id_A5A4::_id_27EF( 1.5, maps\killhouse_code::rope_obj, var_15 );
        common_scripts\utility::_id_383F( "activate_rope" );
        level notify( "show_glowing_rope" );
        thread _id_A5A4::_id_1143( "starting_bridge_attack" );
        level waittill( "starting_rope" );
        level notify( "hide_glowing_rope" );
        common_scripts\utility::_id_3831( "activate_rope" );
        level notify( "okay_if_friendlies_in_line_of_fire" );
        level notify( "starting_cargoship_obj" );

        if ( var_15 )
        {
            thread movies_on_tvs();
            maps\killhouse_code::setobjectivestring( "obj_price", &"KILLHOUSE_CLEAR_THE_CARGOSHIP_BRIDGE" );
            maps\killhouse_code::setobjectivelocation( "obj_price", var_5 );
            common_scripts\utility::_id_383F( "cargoshipTutoDone" );
        }

        level._id_6F7C thread maps\killhouse_code::execdialog( "gogogo" );
        common_scripts\utility::_id_3831( "at_finish" );
        common_scripts\utility::_id_383F( "cargoshipTrainingOn" );
        thread maps\killhouse_code::mission_failed_quit_training();
        thread maps\killhouse_code::accuracy_bonus();

        if ( isdefined( level.iw_deck ) )
            level.iw_deck _meth_808A();

        var_5 maps\killhouse_code::wait_till_pos_cleared();
        maps\killhouse_code::setobjectivelocation( "obj_price", var_6 );
        level._id_6F7C thread maps\killhouse_code::execdialog( "position2" );
        var_6 maps\killhouse_code::wait_till_pos_cleared();
        maps\killhouse_code::setobjectivelocation( "obj_price", var_7 );
        var_7 thread maps\killhouse_code::flash_dialog_three( var_13 );
        var_7 maps\killhouse_code::wait_till_flashed( var_13 );
        maps\killhouse_code::_id_1EBE();

        if ( var_15 )
        {
            var_21 = _func_0C3( "SAS_blackkit_node_debrief", "targetname" );
            thread maps\killhouse_code::walk_to_debrief( var_21 );
        }

        level._id_6F7C thread maps\killhouse_code::execdialog( "position4" );
        maps\killhouse_code::setobjectivelocation( "obj_price", var_8 );
        var_8 maps\killhouse_code::wait_till_pos_cleared();
        maps\killhouse_code::setobjectivelocation( "obj_price", var_9 );
        level._id_6F7C thread maps\killhouse_code::execdialog( "5go" );
        var_9 maps\killhouse_code::wait_till_pos_cleared();
        maps\killhouse_code::setobjectivelocation( "obj_price", var_10 );
        level._id_6F7C thread maps\killhouse_code::execdialog( "6go" );
        var_10 thread maps\killhouse_code::flash_dialog_six( var_14 );
        var_10 maps\killhouse_code::wait_till_flashed( var_14 );
        maps\killhouse_code::_id_1EBE();
        var_10 maps\killhouse_code::wait_till_pos_cleared( "skip_trigger" );
        maps\killhouse_code::setobjectivelocation( "obj_price", var_12 );
        level._id_6F7C thread maps\killhouse_code::execdialog( "finalgo" );
        notify_on_sprint();
        thread flag_on_notify( "sprinted" );
        common_scripts\utility::_id_384A( "sprint" );
        common_scripts\utility::_id_383F( "ready_to_finish" );
        level._id_6F7C thread maps\killhouse_code::execdialog( "sprint" );
        thread maps\killhouse_code::dialog_sprint_reminders();

        if ( level._id_0532 )
            thread maps\killhouse_code::keyhint( "sprint" );
        else
            thread maps\killhouse_code::keyhint( "sprint_pc" );

        common_scripts\utility::_id_384A( "sprinted" );

        if ( !common_scripts\utility::_id_382E( "at_finish" ) )
            thread maps\killhouse_code::second_sprint_hint();

        common_scripts\utility::_id_384A( "at_finish" );
        level notify( "kill_sprint_hint" );
        maps\killhouse_code::_id_1EBE();
        common_scripts\utility::_id_3831( "cargoshipTrainingOn" );
        common_scripts\utility::_id_3831( "ready_to_finish" );
        common_scripts\utility::_id_3831( "at_finish" );
        common_scripts\utility::_id_3831( "at_top_of_ladder" );
        common_scripts\utility::_id_3831( "sprinted" );
        common_scripts\utility::_id_3831( "sprint" );
        level notify( "test_cleared" );
        var_22 = maps\killhouse_code::_id_53B1( 15.1, 0 );

        if ( !common_scripts\utility::_id_382E( "has_cheated" ) && !maps\_cheat::is_cheating() )
        {
            level._id_0318 _meth_80F9( "LB_TIMETRIAL_FNG", var_22 );
            var_23 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "timeTrialTime", "fng" );

            if ( var_23 <= 0 || _func_0BC( var_22 * 100 ) < var_23 )
                level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "timeTrialTime", "fng", _func_0BC( var_22 * 100 ) );
        }

        var_24 = dialog_end_of_course( var_15, var_22, var_16, var_17 );
        level._id_6F7C maps\killhouse_code::execdialog( var_24 );
        var_17 = var_24;
        var_16 = var_22;
        level._id_6F7C maps\killhouse_code::execdialog( "anothergo" );
        level._id_6F7C maps\killhouse_code::execdialog( "debrief" );
        maps\killhouse_code::_id_1EBE();

        if ( var_15 )
        {
            maps\killhouse_code::setobjectivestate( "obj_price", "done" );
            wait 1;
            thread debrief();
        }

        var_15 = 0;
        var_25 = getentarray( "cargoship_target", "script_noteworthy" );

        foreach ( var_27 in var_25 )
            var_27 notify( "want_newMelon" );

        common_scripts\utility::_id_384A( "at_top_of_ladder" );
    }
}

dialog_end_of_course( var_0, var_1, var_2, var_3 )
{
    if ( !var_0 )
    {
        if ( var_2 + 2 < var_1 )
        {
            if ( _func_0B2( 2 ) > 0 )
            {
                var_4 = "lesstime";
                return var_4;
            }
            else
            {
                var_4 = "letyouskip";
                return var_4;
            }
        }

        if ( var_1 < 19 && var_1 < var_2 )
        {
            var_4 = "newrecord";
            return var_4;
        }

        if ( var_2 > var_1 + 3 )
        {
            if ( _func_0B2( 2 ) > 0 )
            {
                var_4 = "tryitagain";
                return var_4;
            }
            else
            {
                var_4 = "notgreat";
                return var_4;
            }
        }

        if ( level.bonus_time < 1.8 && var_3 != "sloppy" )
        {
            var_4 = "sloppy";
            return var_4;
        }
    }

    var_5 = _func_0B2( 2 );

    if ( var_1 < 19 && var_0 == 1 )
    {
        var_4 = "newrecord";
        return var_4;
    }
    else if ( var_5 == 0 )
    {
        var_4 = "youlldo";
        return var_4;
    }
    else
    {
        var_4 = "seenbetter";
        return var_4;
    }
}

flag_on_notify( var_0 )
{
    level._id_0318 waittill( var_0 );
    common_scripts\utility::_id_383F( var_0 );
}

notify_on_sprint()
{
    notifyoncommand( "sprinted", "+breath_sprint" );
    notifyoncommand( "sprinted", "+sprint" );
    notifyoncommand( "sprinted", "+sprint_zoom" );
}

movies_on_tvs()
{
    wait 2;
    _func_0D6( "cg_cinematicFullScreen", "0" );
    _func_05C( "Killhouse_monitor1", 1, 1 );
}

debrief_start()
{
    _id_A5E8::_id_870C( "start_debrief_start_checkpoint" );
    var_0 = getent( "start_pre_rope", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "m16_grenadier" );
    level._id_0318 _meth_8312( "m16_grenadier" );
    common_scripts\utility::_id_383F( "reveal_dialog_done" );
    thread debrief();
}

debrief()
{
    var_0 = getent( "debrief_trigger", "targetname" );
    maps\killhouse_code::registerobjective( "obj_debrief", &"KILLHOUSE_DEBRIEF_WITH_CPT_PRICE", var_0 );
    maps\killhouse_code::setobjectivestate( "obj_debrief", "current" );
    var_0 waittill( "trigger" );
    thread maps\killhouse_code::fail_if_friendlies_in_line_of_fire();
    maps\killhouse_code::clear_timer_elems();
    maps\killhouse_code::_id_1EBE();
    level notify( "kill_timer" );
    level notify( "clear_course" );
    common_scripts\utility::_id_3831( "aa_cargoship" );
    maps\killhouse_code::setobjectivestate( "obj_debrief", "done" );
    thread debrief_anims();
    thread h1_fadetoblackdifficultyselect( 2.5 );
    wait 12.5;
    level._id_0318 _meth_84ED( &"difficulty_selection_menu_fng" );
    level._id_0318 _meth_8326( 1 );
    _func_074( 2, 0.1 );
    level._id_0318 waittill( "menuresponse", var_1, var_2 );
    _func_074( 0, 0.2 );
    level._id_0318 _meth_8326( 0 );
    level notify( "okay_if_friendlies_in_line_of_fire" );

    if ( var_2 == "try_again" )
    {
        setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_TRY_AGAIN" );
        _id_A5A4::_id_5CDF();
    }

    wait 1;
    _id_A5A4::_id_60D6();
}

h1_fadetoblackdifficultyselect( var_0 )
{
    wait 13.5;
    _id_A5E8::_id_870C( "start_fade_to_black_end" );
    var_1 = _func_1A9();
    var_1._id_0530 = 0;
    var_1._id_0538 = 0;
    var_1 _meth_80CE( "black", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1._id_01F3 = "fullscreen";
    var_1._id_0501 = "fullscreen";
    var_1.alpha = 0;
    var_1 _meth_8086( var_0 );
    var_1.alpha = 1;
}

debrief_anims()
{
    var_0 = _func_0C3( "SAS_blackkit_node_debrief", "targetname" );

    for ( var_1 = 0; var_1 < level.sas_blackkits.size; var_1++ )
    {
        var_0 thread _id_A510::_id_0C24( level.sas_blackkits[var_1], "debrief_S" + ( var_1 + 1 ) );
        level.sas_blackkits[var_1] _id_A5A4::_id_1EB8();
        level.sas_blackkits[var_1]._id_250C = undefined;
        level.sas_blackkits[var_1].colororderednodeassign = undefined;
        level.sas_blackkits[var_1] _id_A5A4::_id_7E50( 500 );
    }

    level._id_6F7C _id_A5A4::_id_1EB8();
    level._id_6F7C._id_250C = undefined;
    level._id_6F7C.colororderednodeassign = undefined;
    level._id_6F7C _id_A5A4::_id_7E50( 500 );
    var_0 _id_A510::_id_0C24( level._id_6F7C, "debrief_p" );
}

music_control()
{
    common_scripts\utility::_id_384A( "open_ship_hanger" );
    thread music_killhouse_price();
    common_scripts\utility::_id_384A( "activate_rope" );
    _func_076( 3 );
}

music_killhouse_price()
{
    _id_A5A4::_id_6008( "killhouse_price" );
}

traffic()
{
    var_0 = gate_setup( "gate", "gate_mover_01", "gate_mover_destination_01" );
    var_1 = gate_setup( "gate_04", "gate_mover_04", "gate_mover_destination_04" );
    var_2 = [];
    var_2[0] = "humvee_1";
    var_2[1] = "bm21_1";
    thread checkgate_needopenorclose( var_0 );
    thread checkgate_needopenorclose( var_1 );
    thread convoy_gate_pass( var_2, var_0, "trafficTrigger", "gate_open_node", "gate_close_node", "gate_wait_node" );
    var_3 = [];
    var_3[0] = "humvee_obstacle_01";
    var_3[1] = "bm21_obstacle_01";
    var_3[2] = "humvee_obstacle_02";
    thread convoy_gate_pass( var_3, var_0, "obstacle_vehicle_pass_trigger", "gate_open_node_obstacle", "gate_close_node", "gate_wait_node_obstacle" );
}

monitor_vehicle_damage()
{
    level endon( "mission failed" );
    self waittill( "death", var_0, var_1, var_2 );

    if ( _func_1AD( var_0 ) )
        thread _id_A536::_id_5CDD();
}

convoy_gate_pass( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_A5A4::_id_980E( var_2 );
    var_6 = [];

    foreach ( var_8 in var_0 )
        var_6[var_6.size] = _id_A5A8::_id_8979( var_8 );

    common_scripts\utility::_id_0D13( var_6, ::monitor_vehicle_damage );
    var_10 = _func_1EC( var_3, "targetname" );
    var_11 = _func_1EC( var_4, "targetname" );
    var_12 = _func_1EC( var_5, "targetname" );

    while ( var_6[0] _meth_84B7() != var_10 )
        wait 0.2;

    thread open_gate( var_1 );
    level.convoyatgate = 1;

    while ( var_6[0] _meth_84B7() != var_12 )
        wait 0.1;

    if ( !var_1.is_open )
    {
        foreach ( var_14 in var_6 )
        {
            var_14 _id_A5A8::_id_9D4C( "gate_stop", 5, 5 );
            wait(_func_0B5( 0.2, 0.4 ));
        }

        while ( !var_1.is_open )
            wait 0.5;

        foreach ( var_14 in var_6 )
        {
            var_14 _id_A5A8::_id_9D1E( "gate_stop" );
            wait(_func_0B5( 0.3, 0.6 ));
        }
    }

    while ( var_6[var_6.size - 1] _meth_84B7() != var_11 )
        wait 0.2;

    while ( level.loopingtrucksatgate )
        wait 0.25;

    thread close_gate( var_1 );
    level.convoyatgate = 0;
}

gate_setup( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.gate_parts = getentarray( var_0, "targetname" );
    var_3._id_5F68 = getent( var_1, "targetname" );
    var_3._id_5F68.destination = getent( var_2, "targetname" )._id_02E2;

    foreach ( var_5 in var_3.gate_parts )
        var_5 _meth_804F( var_3._id_5F68 );

    var_3._id_5F68._id_65A4 = var_3._id_5F68._id_02E2;
    var_3.is_open = 0;
    return var_3;
}

open_gate( var_0 )
{
    var_1 = 6;
    var_0._id_5F68 _meth_82AA( var_0._id_5F68.destination, var_1 );
    wait(var_1);
    var_0.is_open = 1;
}

close_gate( var_0 )
{
    var_1 = 6;
    var_0._id_5F68 _meth_82AA( var_0._id_5F68._id_65A4, var_1 );
    wait(var_1);
    var_0.is_open = 0;
}

checkgate_needopenorclose( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    level.convoyatgate = 0;
    level.loopingtrucksatgate = 0;

    for (;;)
    {
        foreach ( var_4 in level.vehicletocheckarray )
        {
            if ( var_4.classname == "script_vehicle_corpse" )
                continue;

            var_5 = var_4 _meth_84B7();

            if ( isdefined( var_5 ) && isdefined( var_5._id_0398 ) )
            {
                if ( var_0._id_5F68._id_04A6 == "gate_mover_01" )
                {
                    switch ( var_5._id_0398 )
                    {
                        case "gate1_open_node":
                            if ( !var_1 )
                            {
                                var_0._id_5F68 _meth_82AA( var_0._id_5F68.destination, 5 );
                                var_1 = 1;
                                var_0._id_5F68 thread _id_A5A4::_id_69C4( "scn_metal_fence_open" );
                                level.loopingtrucksatgate = 1;
                            }

                            break;
                        case "gate1_close_node":
                            if ( var_1 )
                            {
                                level.loopingtrucksatgate = 0;

                                if ( level.convoyatgate )
                                    break;

                                var_0._id_5F68 _meth_82AA( var_0._id_5F68._id_65A4, 5 );
                                var_1 = 0;
                                var_0._id_5F68 thread _id_A5A4::_id_69C4( "scn_metal_fence_close" );
                            }

                            break;
                    }

                    continue;
                }

                if ( var_0._id_5F68._id_04A6 == "gate_mover_04" )
                {
                    switch ( var_5._id_0398 )
                    {
                        case "gate4_open_node":
                            if ( !var_2 )
                            {
                                var_0._id_5F68 _meth_82AA( var_0._id_5F68.destination, 5 );
                                var_2 = 1;
                                var_0._id_5F68 thread _id_A5A4::_id_69C4( "scn_metal_fence_open" );
                            }

                            continue;
                        case "gate4_close_node":
                            if ( var_2 )
                            {
                                var_0._id_5F68 _meth_82AA( var_0._id_5F68._id_65A4, 5 );
                                var_2 = 0;
                                var_0._id_5F68 thread _id_A5A4::_id_69C4( "scn_metal_fence_close" );
                            }

                            continue;
                    }
                }
            }
        }

        wait 1;
    }
}

setup_ai_aim_targets()
{
    level.aim_targets_left = [];
    level.aim_targets_left = getentarray( "aim_target", "targetname" );
    setup_targets_rotate( level.aim_targets_left );
    level.aim_targets_right = [];
    level.aim_targets_right = getentarray( "aim_target_right", "targetname" );
    setup_targets_rotate( level.aim_targets_right );
}

setup_targets_rotate( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_3 = getent( var_2._id_04A4, "targetname" );

        if ( isdefined( var_3 ) )
        {
            var_2.linked_ent = var_3;
            var_2.init_angles = var_3.angles;
            var_2 _meth_804F( var_3 );
            var_2 _meth_82BC( 1 );
            var_2.raised = 1;
            var_4 = getent( var_2.linked_ent._id_04A4, "targetname" );

            if ( isdefined( var_4 ) )
                var_2.aimed_pos_ent = var_4;

            var_2 thread ai_rifle_training_aim_target_think();
        }
    }
}

print_target()
{
    for (;;)
    {
        wait 0.05;

        if ( isdefined( self.target_dummy ) )
        {

        }
    }
}

ai_spectator_setup()
{
    var_0 = getent( "spectator_node", "targetname" );
    var_1 = getent( "spectatorSpawner", "targetname" );
    var_2 = var_1 _meth_8096();
    var_2 _id_A5A4::_id_4462();
    var_2._id_0C72 = "spectator";
    var_2._id_0398 = "spectator";
    var_0 thread _id_A510::_id_0BE1( var_2, "spectator_idle", undefined, "end_idle" );
}

ai_rifle_training_loop( var_0 )
{
    var_1 = self _meth_8096();
    var_1 _meth_81A7( 1 );
    var_1 _meth_81CE( "stand" );
    var_1 _meth_81A9( _func_0C3( self._id_04A4, "targetname" ) );
    var_1 waittill( "goal" );
    var_1 _id_A5A4::_id_30B0();
    var_1.target_dummy = undefined;
    thread ai_rifle_training_targetpop_think( var_0 );

    for (;;)
    {
        wait 0.05;

        if ( !isdefined( var_1 ) )
            return;

        var_1._id_615B = common_scripts\utility::_id_9294( var_1._id_18B0 < 15, undefined, 1 );

        if ( isdefined( var_1.a._id_3593 ) && var_1.a._id_3593 )
        {
            wait 0.3;
            continue;
        }

        if ( isdefined( var_1.target_dummy ) && var_1.target_dummy.raised )
        {
            var_2 = 1;

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                if ( var_1._id_18B0 == 0 || isdefined( var_1.a._id_3593 ) && var_1.a._id_3593 )
                    break;

                var_4 = var_1.target_dummy.aimed_pos_ent._id_02E2;
                var_1._id_840F = var_4;
                var_1 _meth_81EA( 0.9, var_4 );
                var_1._id_18B0--;
                wait 0.1;
            }

            continue;
        }

        var_5 = _func_0B5( 0.25, 0.5 );
        var_1.target_dummy = undefined;

        if ( var_0.size > 0 )
        {
            while ( !isdefined( var_1.target_dummy ) )
            {
                wait 0.05;
                var_6 = _func_0B4( 0, var_0.size );

                if ( var_0[var_6].raised )
                {
                    var_1.target_dummy = var_0[var_6];
                    var_1 _id_A5A4::_id_22CF( var_1.target_dummy.aimed_pos_ent );
                    break;
                }
            }

            wait(var_5);
        }
    }
}

ai_rifle_training_aim_target_think()
{
    for (;;)
    {
        self waittill( "damage" );
        self _meth_809C( "killhouse_target_up_quiet" );
        self.linked_ent _meth_82B1( self.init_angles + ( 0, 0, -90 ), 0.25, 0, 0 );
        self _meth_82BC( 0 );
        self.raised = 0;
        self waittill( "raise" );
        wait 2.0;
        self notify( "want_newMelon" );
        self.linked_ent _meth_82B1( self.init_angles, 0.25, 0, 0 );
        thread _id_A5A4::_id_69C4( "killhouse_target_up_wood_npc" );
        self _meth_82BC( 1 );
        self.raised = 1;
    }
}

ai_rifle_training_targetpop_think( var_0 )
{
    var_1 = 1;

    for (;;)
    {
        wait 0.05;

        if ( isdefined( var_0 ) && var_0.size > 0 )
        {
            for ( var_2 = 0; var_2 < var_0.size; var_2++ )
            {
                if ( var_0[var_2].raised )
                {
                    var_1 = 0;
                    break;
                }

                if ( var_2 == var_0.size - 1 )
                    var_1 = 1;
            }

            if ( var_1 )
            {
                for ( var_3 = 0; var_3 < var_0.size; var_3++ )
                {
                    if ( _func_0B2( 2 ) == 1 )
                    {
                        var_0[var_3] notify( "raise" );
                        var_1 = 0;
                    }
                }

                wait 3.0;
            }
        }
    }
}

move_tower_guards()
{
    var_0 = getent( "tower_guard_a", "targetname" );
    var_1 = getent( "tower_guard_b", "targetname" );
    var_0 thread tower_guard_think();
    var_1 thread tower_guard_think();
}

tower_guard_think()
{
    _id_A5A4::_id_7E45( "walk" );
    _id_A5A4::_id_7E4E( 5 );
    _id_A5A4::_id_A10B();
    var_0 = _func_0C4( "tower_node_r_" + self._id_0398, "targetname" );
    var_1 = _func_0C4( "tower_node_l_" + self._id_0398, "targetname" );
    var_2 = 1;

    for (;;)
    {
        if ( var_2 )
            self _meth_81A9( var_1[_func_0B4( 0, var_1.size )] );
        else
            self _meth_81A9( var_0[_func_0B4( 0, var_0.size )] );

        var_2 = !var_2;
        self waittill( "goal" );
        wait(_func_0B4( 5, 15 ));
    }
}

ai_ambient_think( var_0, var_1 )
{
    self endon( "death" );
    ai_ambient_ignored();
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 0;

    if ( isdefined( self._id_04A4 ) )
        var_2 = _func_0C3( self._id_04A4, "targetname" );

    thread ai_ambient_cleanup();

    if ( _func_0CE( level._id_78AC["generic"][var_0] ) )
    {
        var_4 = 1;

        if ( var_0 == "training_basketball_guy2" )
        {
            var_5 = getent( "basketball", "targetname" );
            var_5._id_0C72 = "basketball";
            var_5 _id_A5A4::_id_0D61();
            self._id_3002 thread _id_A510::_id_0BE1( var_5, "training_basketball_loop", "stop_idle" );
        }

        self._id_3002 thread _id_A510::_id_0BCE( self, var_0, "stop_idle" );
        var_3 = var_0 + "_go";

        if ( _id_0BC1( var_3 ) )
            var_0 = var_3;
        else
            var_3 = undefined;
    }
    else
        self._id_3002 _id_A510::_id_0BCC( self, var_0 );

    if ( isdefined( self._id_79D3 ) )
    {
        if ( isdefined( var_1 ) )
            common_scripts\utility::_id_3852( self._id_79D3, var_1 );
        else
            common_scripts\utility::_id_384A( self._id_79D3 );
    }

    if ( isdefined( var_2 ) )
    {
        self._id_2AF3 = 1;
        self._id_2B0E = 1;
    }

    if ( !var_4 )
        self._id_3002 _id_A510::_id_0BC9( self, var_0 );

    if ( isdefined( var_3 ) )
    {
        self._id_3002 notify( "stop_idle" );
        self._id_3002 _id_A510::_id_0BC9( self, var_3 );
    }

    switch ( var_0 )
    {
        case "civilian_run_2_crawldeath":
            self _meth_8054();
            break;
    }

    if ( isdefined( var_2 ) )
    {
        self _meth_81A9( var_2 );
        wait 1;
        self._id_2AF3 = 0;
        self._id_2B0E = 0;
        self waittill( "goal" );

        if ( isdefined( self._id_22E0 ) && self._id_22E0 )
            _id_A5A4::_id_22DA( "off" );
    }
    else if ( isdefined( level._id_78AC["generic"][var_0 + "_idle"] ) )
        self._id_3002 thread _id_A510::_id_0BCE( self, var_0 + "_idle", "stop_idle" );

    if ( _id_0BC1( var_0 + "_react" ) )
    {
        if ( !var_4 )
            var_0 += "_idle";

        var_6 = var_0 + "_react";

        if ( _id_0BC1( var_0 + "_react2" ) )
            var_7 = var_0 + "_react2";
        else
            var_7 = var_6;

        while ( isdefined( self ) )
        {
            level waittill( "mortar_hit" );
            self._id_3002 notify( "stop_idle" );
            self notify( "stop_idle" );
            waitframe;

            if ( _func_0B2( 100 ) > 50 )
                _id_A510::_id_0BC9( self, var_6 );
            else
                _id_A510::_id_0BC9( self, var_7 );

            thread _id_A510::_id_0BCE( self, var_0, "stop_idle" );
        }
    }
}

ai_ambient_cleanup()
{
    self waittill( "death" );

    if ( isdefined( self._id_3002 ) && !_func_1A2( self._id_3002 ) )
        self._id_3002 delete();
}

ai_ambient_noprop_think()
{
    self endon( "death" );
    var_0 = self.animation;
    var_1 = 0;

    if ( !isdefined( self._id_3002 ) )
        self._id_3002 = self._id_03D9;

    var_2 = 0;
    var_3 = undefined;

    switch ( var_0 )
    {
        case "training_humvee_repair":
            thread mechanic_sound_loop();
            _id_A5A4::_id_4462();
            break;
        case "roadkill_humvee_map_sequence_quiet_idle":
            self _meth_801D( "characters_accessories_pencil", "TAG_INHAND", 1 );
            _id_A5A4::_id_4462();
            break;
        case "training_locals_kneel":
            _id_A5A4::_id_4462();
            self.m4 = spawn( "script_model", ( 0, 0, 0 ) );
            self.m4 _meth_80B3( "weapon_m4" );
            self.m4 _meth_804A( "TAG_THERMAL_SCOPE" );
            self.m4 _meth_804A( "TAG_FOREGRIP" );
            self.m4 _meth_804A( "TAG_ACOG_2" );
            self.m4 _meth_804A( "TAG_HEARTBEAT" );
            self.m4 _meth_804A( "TAG_RED_DOT" );
            self.m4 _meth_804A( "TAG_SHOTGUN" );
            self.m4 _meth_804A( "TAG_SILENCER" );
            self.m4._id_02E2 = self _meth_8184( "tag_inhand" );
            self.m4.angles = self _meth_8185( "tag_inhand" );
            self.m4 _meth_804F( self, "tag_inhand" );
            thread common_scripts\utility::_id_2825( self.m4 );
            break;
        case "training_locals_groupA_guy1":
        case "training_locals_groupA_guy2":
        case "training_locals_groupB_guy1":
        case "training_locals_groupB_guy2":
        case "training_locals_sit":
            break;
        case "parabolic_leaning_guy_idle_training":
        case "parabolic_leaning_guy_idle":
        case "little_bird_casual_idle_guy1":
        case "killhouse_sas_2_idle":
            break;
        case "training_sleeping_in_chair":
            _id_A5A4::_id_4462();
            self._id_3002 = getent( self._id_04A4, "targetname" );
            break;
        case "civilian_run_2_crawldeath":
        case "death_explosion_run_F_v1":
            _id_A5A4::_id_4462();
            self._id_85BA = 1;
            self._id_6159 = 1;
            break;
        case "afgan_caves_sleeping_guard_idle":
            _id_A5A4::_id_4462();
            self._id_3002._id_02E2 += ( 0, 0, 26 );
            break;
        case "bunker_toss_idle_guy1":
        case "DC_Burning_artillery_reaction_v1_idle":
        case "DC_Burning_artillery_reaction_v2_idle":
        case "DC_Burning_bunker_stumble":
            _id_A5A4::_id_4462();
            break;
        case "unarmed_panickedrun_loop_V2":
            _id_A5A4::_id_7E45( "unarmed_panickedrun_loop_V2" );
            _id_A5A4::_id_4462();
            self._id_2AF3 = 1;
            self._id_2B0E = 1;
            self._id_01C4 = 16;
            self waittill( "goal" );
            _id_A5A4::_id_1ED1();
            wait 1;
            _id_A5A4::_id_4461();
            var_1 = 1;
            return;
        case "wounded_carry_fastwalk_carrier":
            var_4 = getent( self._id_04A4, "targetname" );
            var_5 = var_4 _id_A5A4::_id_88C3();
            self._id_3002 _id_A510::_id_0BCC( self, var_0 );
            self._id_3002 _id_A510::_id_0BCC( var_5, "wounded_carry_fastwalk_wounded" );
            _id_A5A4::_id_4462();
            var_5 _id_A5A4::_id_4462();
            var_1 = 1;
            var_6 = getent( self._id_7A26, "script_linkname" );

            if ( isdefined( self._id_79D3 ) )
                common_scripts\utility::_id_384A( self._id_79D3 );

            while ( _func_0EE( var_6._id_02E2, self._id_02E2 ) > 128 )
            {
                thread _id_A510::_id_0BC9( self, var_0 );
                _id_A510::_id_0BC9( var_5, "wounded_carry_fastwalk_wounded" );
            }

            thread _id_A510::_id_0BC9( self, "wounded_carry_putdown_closet_carrier" );
            _id_A510::_id_0BC9( var_5, "wounded_carry_putdown_closet_wounded" );
            thread _id_A510::_id_0BCE( var_5, "wounded_carry_closet_idle_wounded" );
            thread _id_A510::_id_0BCE( self, "wounded_carry_closet_idle_carrier" );
            return;
        case "sitting_guard_loadAK_idle":
            _id_A5A4::_id_4462();
            self _meth_801D( "weapon_m4_clip", "tag_inhand" );
            break;
        case "civilian_texting_standing":
        case "civilian_texting_sitting":
            _id_A5A4::_id_4462();
            self _meth_80B3( "body_sp_sas_woodland_golden@sitting" );
            self _meth_801D( "electronics_pda", "tag_inhand" );
            break;
        case "civilian_sitting_talking_A_2_Idle":
            var_7 = self;
            thread sittingtalkingguy_think( var_7 );
            return;
        case "civilian_reader_2":
            var_2 = 1;
        case "civilian_reader_1":
            _id_A5A4::_id_4462();
            self _meth_801D( "open_book_static", "tag_inhand" );
            break;
        case "civilian_smoking_A":
        case "oilrig_balcony_smoke_idle":
        case "parabolic_leaning_guy_smoking_idle":
            thread _id_A573::_id_0DDC();
            break;
        case "roadkill_cover_radio_soldier2":
            break;
        case "roadkill_cover_spotter_idle":
            self _meth_801D( "weapon_binocular", "TAG_INHAND", 1 );
            break;
        case "roadkill_cover_radio_soldier3":
            self _meth_801D( "mil_mre_chocolate01", "TAG_INHAND", 1 );
            break;
        case "training_basketball_rest":
            _id_A5A4::_id_4462();
            self _meth_801D( "com_bottle2", "TAG_INHAND", 1 );
            break;
        case "favela_run_and_wave":
            break;
        default:
            _id_A5A4::_id_4462();
            break;
    }

    if ( !var_2 )
        thread ai_ambient_facial();
    else
        thread ai_specific_facial_anim( "generic", var_0 + "_facial" );

    thread ai_ambient_think( var_0, var_3 );
}

ai_ambient_facial()
{
    self endon( "death" );
    waittillframeend;

    for (;;)
        maps\killhouse_anim::play_idle_facial_anim( 0 );
}

ai_ambient_ignored()
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self.code_classname ) && self.code_classname == "script_model" )
        return;

    _id_A5A4::_id_7F71( 1 );
    self._id_01FF = 1;
    self._id_01FB = 1;
    self._id_01D1 = 0;
}

_id_0BC1( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( isdefined( level._id_78AC[var_1][var_0] ) )
        return 1;
    else
        return 0;
}

mechanic_sound_loop()
{
    self endon( "death" );

    for (;;)
        self waittillmatch( "looping anim", "end" );
}

pushup_guy_sound_loop( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittillmatch( "looping anim", "end" );
        thread common_scripts\utility::_id_69C2( var_0 );
    }
}

_id_38B4()
{
    self endon( "death" );
    thread _id_8ECA();

    for (;;)
    {
        self waittillmatch( "looping anim", "spark on" );
        thread start_sparks();
    }
}

start_sparks()
{
    self endon( "death" );
    self notify( "starting sparks" );
    self endon( "starting sparks" );
    self endon( "spark off" );

    for (;;)
    {
        playfxontag( level._id_058F["welding_runner"], self, "tag_tip_fx" );
        self _meth_809C( "elec_spark_welding_bursts" );
        wait(_func_0B5( 0.25, 0.5 ));
    }
}

_id_8ECA()
{
    self endon( "death" );

    for (;;)
    {
        self waittillmatch( "looping anim", "spark off" );
        self notify( "spark off" );
    }
}

_id_38B5( var_0 )
{
    var_0 waittill( "death" );
}

patrol_simple( var_0, var_1 )
{
    self endon( "end_patrol" );
    self._id_01C4 = 32;
    self _meth_81CE( "stand" );
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self.allowdeath = 1;
    self._id_7A9C = 1;

    if ( var_1 )
    {
        self.canpatrolturn = 1;
        _id_A5A4::_id_3102();
        self._id_66F4 = 0.3;
    }

    var_2 = "patrol_walk";

    if ( isdefined( self._id_6718 ) )
        var_2 = self._id_6718;

    _id_A5A4::_id_7E45( var_2, 1, !var_1 );
    thread _id_A55F::patrol_walk_twitch_loop();

    if ( isdefined( var_0 ) )
        self._id_04A4 = var_0;

    var_3 = _func_0C3( self._id_04A4, "targetname" );
    var_4 = var_3;

    for (;;)
    {
        if ( isdefined( var_3._id_0351 ) && var_3._id_0351 > 0 )
            self._id_01C4 = var_3._id_0351;
        else
            self._id_01C4 = 32;

        self waittill( "goal" );
        var_3 notify( "trigger", self );

        if ( isdefined( var_3._id_793C ) )
        {
            var_5 = "patrol_stop";
            _id_A510::_id_0BCA( self, "gravity", var_5 );

            switch ( var_3._id_793C )
            {
                case "pause":
                    var_6 = "patrol_idle_" + _func_0B4( 1, 6 );
                    _id_A510::_id_0BC9( self, var_6 );
                    var_7 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_7 );
                    break;
                case "turn180":
                    var_8 = "patrol_turn180";
                    _id_A510::_id_0BCA( self, "gravity", var_8 );
                    break;
                case "smoke":
                    var_9 = "patrol_idle_smoke";
                    _id_A510::_id_0BC9( self, var_9 );
                    var_7 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_7 );
                    break;
                case "stretch":
                    var_9 = "patrol_idle_stretch";
                    _id_A510::_id_0BC9( self, var_9 );
                    var_7 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_7 );
                    break;
                case "checkphone":
                    var_9 = "patrol_idle_checkphone";
                    _id_A510::_id_0BC9( self, var_9 );
                    var_7 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_7 );
                    break;
                case "phone":
                    var_9 = "patrol_idle_phone";
                    _id_A510::_id_0BC9( self, var_9 );
                    var_7 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_7 );
                    break;
            }
        }

        var_3 = var_4;
        var_4 = _func_0C3( var_3._id_04A4, "targetname" );
    }
}

get_joggers_start_pos()
{
    var_0 = getentarray( "jog1", "script_noteworthy" );
    level.joggers_start_pos = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = spawnstruct();
        var_3._id_8C20 = var_2._id_02E2;
        var_3._id_8B32 = var_2.angles;
        level.joggers_start_pos[level.joggers_start_pos.size] = var_3;
    }
}

teleport_joggers()
{
    var_0 = getentarray( "jog1", "script_noteworthy" );
    var_1 = 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_03D9 ) )
        {
            var_0[var_2] _meth_81CA( level.joggers_start_pos[var_1]._id_8C20, level.joggers_start_pos[var_1]._id_8B32 );
            var_1++;
        }
    }
}

joggers_formation()
{
    level endon( "mission failed" );
    var_0 = getentarray( "jog1", "script_noteworthy" );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    foreach ( var_7 in var_0 )
    {
        switch ( var_7._id_7A99 )
        {
            case "leader":
                var_1 = var_7;
                var_1._id_5F65 = 1;
                continue;
            case "follow_leader_left":
                var_2 = var_7;
                var_2._id_5F65 = 1;
                continue;
            case "follow_leader_right":
                var_3 = var_7;
                var_3._id_5F65 = 1;
                continue;
            case "follow_line1_left":
                var_4 = var_7;
                var_4._id_5F65 = 1;
                continue;
            case "follow_line1_right":
                var_5 = var_7;
                var_5._id_5F65 = 1;
                continue;
        }
    }

    var_9 = _func_0F0( var_1._id_02E2, var_2._id_02E2 );
    var_10 = _func_0F0( var_1._id_02E2, var_3._id_02E2 );
    var_11 = _func_0F0( var_4._id_02E2, var_2._id_02E2 );
    var_12 = _func_0F0( var_5._id_02E2, var_3._id_02E2 );

    for (;;)
    {
        var_13 = _func_0F0( var_1._id_02E2, var_2._id_02E2 );
        var_14 = _func_0F0( var_1._id_02E2, var_3._id_02E2 );
        var_15 = _func_0F0( var_4._id_02E2, var_2._id_02E2 );
        var_16 = _func_0F0( var_5._id_02E2, var_3._id_02E2 );

        foreach ( var_7 in var_0 )
        {
            switch ( var_7._id_7A99 )
            {
                case "follow_leader_left":
                    var_18 = var_13 / var_9;

                    if ( var_18 <= 0.98 )
                        var_7._id_5F65 = 0.85;
                    else if ( var_18 >= 1.02 )
                        var_7._id_5F65 = 1.15;
                    else
                        var_7._id_5F65 = 1;

                    continue;
                case "follow_leader_right":
                    var_18 = var_14 / var_10;

                    if ( var_18 <= 0.98 )
                        var_7._id_5F65 = 0.85;
                    else if ( var_18 >= 1.02 )
                        var_7._id_5F65 = 1.15;
                    else
                        var_7._id_5F65 = 1;

                    continue;
                case "follow_line1_left":
                    var_18 = var_15 / var_11;

                    if ( var_18 <= 0.99 )
                        var_7._id_5F65 = 0.85;
                    else if ( var_18 >= 1.01 )
                        var_7._id_5F65 = 1.18;

                    continue;
                case "follow_line1_right":
                    var_18 = var_16 / var_12;

                    if ( var_18 <= 0.98 )
                        var_7._id_5F65 = 0.85;
                    else if ( var_18 >= 1.02 )
                        var_7._id_5F65 = 1.15;
                    else
                        var_7._id_5F65 = 1;

                    continue;
            }
        }

        wait 1;
    }
}

outside_blur()
{
    common_scripts\_exploder::_id_3528( 100 );
    wait 0.2;
    _func_074( 2.0, 0.3 );
    wait 0.5;
    _func_074( 0.0, 1.8 );
}
#using_animtree("generic_human");

ai_patrol_think( var_0, var_1 )
{
    self endon( "death" );
    self _meth_81A7( 1 );
    self._id_050F = 1000;
    self._id_2AF3 = 1;

    if ( var_0 )
    {
        var_2 = _func_0B4( 1, 5 );
        var_3 = "RunNoGun_" + var_2;
        self._id_6718 = var_3;
        self._id_6719 = var_3;
        var_4 = level._id_78AC["generic"]["runner_facial_" + var_2];
        self _meth_814B( var_4, %head, 1 );
        self _meth_814E( %head, 1 );
        _id_A5A4::_id_4462();
        self._id_017D = 0;
        self._id_0201 = 1;
        self.allowpain = 0;
        self._id_01D1 = 0;
    }

    wait 0.1;
    thread patrol_simple( undefined, var_1 );
    level.patroldudes[level.patroldudes.size] = self;
}

ai_specific_facial_anim( var_0, var_1 )
{
    self endon( "death" );
    var_2 = level._id_78AC[var_0][var_1];

    if ( !isdefined( var_2 ) )
        return;

    waittillframeend;

    for (;;)
    {
        self _meth_814B( var_2, %head, 1 );
        self _meth_814E( %head, 1 );
        wait(getanimlength( var_2 ));
    }
}

sittingtalkingguy_think( var_0 )
{
    var_1 = getent( "Hangar2Listen", "targetname" );
    var_2 = var_1 _id_A5A4::_id_88C3();
    var_2._id_2AF3 = 1;
    var_2._id_2B0E = 1;
    var_2 _id_A5A4::_id_4462();
    var_2._id_01D1 = 0;
    var_2._id_0C72 = "generic";
    var_2 _id_A5A4::_id_7E45( "patrol_walk_unarmed" );
    var_2 _id_A5A4::_id_7E44( "patrol_unarmed_idle" );
    var_2 thread ai_ambient_facial();
    var_3 = _func_0C3( "hangar2_ListenGuyStartNode", "targetname" );
    var_4 = _func_0C3( "hangar2_ListenGuyEndNode", "targetname" );
    var_2 _meth_81A9( var_3 );
    var_5 = getent( "SittingGuyPos", "targetname" );
    var_6 = var_0;
    var_6 maps\killhouse_code::specify_head_model( "head_sas_ct_assault_charles_nomask" );
    var_6 _id_A5A4::_id_4462();
    var_6._id_01D1 = 0;
    var_6._id_0C72 = "generic";
    var_5 thread _id_A510::_id_0BE1( var_6, "civilian_sitting_talking_A_2_Idle", undefined, "end_idle" );
    var_6 thread ai_ambient_facial();
    common_scripts\utility::_id_384A( "approching_hangar2" );
    wait 1.5;
    var_5 notify( "end_idle" );
    var_6 thread ai_specific_facial_anim( "generic", "civilian_sitting_talking_A_2_facial" );
    var_6 _id_A5A4::_id_69C4( "killhouse_nwc_thrilledtosee" );
    var_2 _meth_81A9( var_4 );
    wait 1;
    var_6 _id_A5A4::_id_69C4( "killhouse_nwc_goodluck" );
    var_6 thread ai_ambient_facial();
}

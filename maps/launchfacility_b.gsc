// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    thread maps\createart\launchfacility_b_art::main();
    thread maps\launchfacility_b_fx::main();
    maps\launchfacility_b_precache::main();
    _id_A550::main();
    thread maps\launchfacility_b_amb::main();
    maps\launchfacility_b_anim::main();
    maps\launchfacility_b_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    _func_0D6( "compassmaxrange", 1200 );
    precachemodel( "com_computer_keyboard_obj" );
    precachemodel( "com_computer_keyboard" );
    precachemodel( "weapon_c4_obj" );
    precachemodel( "weapon_c4" );
    precacheshader( "white" );
    precacheshader( "black" );
    precacheshader( "h1_hud_upload_codes_blur" );
    precacheshader( "h1_hud_upload_codes_border" );
    precachestring( &"LAUNCHFACILITY_B_PLANT_THE_C4" );
    precachestring( &"LAUNCHFACILITY_B_GET_TO_THE_TELEMETRY" );
    precachestring( &"LAUNCHFACILITY_B_CLEAR_ROOM" );
    precachestring( &"LAUNCHFACILITY_B_UPLOAD_THE_ABORT_CODES" );
    precachestring( &"LAUNCHFACILITY_B_BOMBS_GO_BOOM" );
    precachestring( &"LAUNCHFACILITY_B_TIME_TILL_ICBM_IMPACT" );
    precachestring( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );
    precachestring( &"LAUNCHFACILITY_B_FOLLOW_PRICE" );
    precachestring( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    _id_A5A4::_id_079C( "warehouse", ::start_warehouse, &"STARTS_WAREHOUSE" );
    _id_A5A4::_id_079C( "launchtubes", ::start_launchtubes, &"STARTS_LAUNCHTUBES" );
    _id_A5A4::_id_079C( "vaultdoors", ::start_vaultdoors, &"STARTS_VAULTDOORS" );
    _id_A5A4::_id_079C( "controlroom", ::start_controlroom, &"STARTS_CONTROLROOM" );
    _id_A5A4::_id_079C( "escape", ::_id_8B9A, &"STARTS_ESCAPE1" );
    _id_A5A4::_id_079C( "elevator", ::start_elevator, &"STARTS_ELEVATOR" );
    _id_A5A4::_id_278B( ::start_default );
    level thread maps\createart\launchfacility_b_art::main();
    level thread maps\launchfacility_b_fx::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_m16_clip";
    level.weaponclipmodels[1] = "weapon_saw_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    level.weaponclipmodels[3] = "weapon_mp5_clip";
    level.weaponclipmodels[4] = "weapon_g36_clip";
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    maps\launchfacility_b_precache::main();
    _id_A550::main();
    _id_A55E::main();
    level thread maps\launchfacility_b_amb::main();
    maps\_c4::main();
    maps\launchfacility_b_anim::main();
    maps\launchfacility_b_lighting::main();
    maps\launchfacility_b_aud::main();
    maps\_deadbody::main();
    _id_A51D::_id_8324( "compass_map_launchfacility_b" );
    createthreatbiasgroup( "player" );
    precachemodel( "com_computer_keyboard_obj" );
    precachemodel( "com_computer_keyboard" );
    precachemodel( "body_russian_loyalist_a_dead" );
    precachemodel( "head_russian_loyalist_a_dead" );
    precachemodel( "body_russian_loyalist_b_dead" );
    precachemodel( "body_russian_loyalist_c_dead" );
    precachemodel( "weapon_c4_obj" );
    precachemodel( "weapon_c4" );
    precacheshader( "white" );
    precacheshader( "black" );
    precachestring( &"LAUNCHFACILITY_B_PLANT_THE_C4" );
    precachestring( &"LAUNCHFACILITY_B_GET_TO_THE_TELEMETRY" );
    precachestring( &"LAUNCHFACILITY_B_UPLOAD_THE_ABORT_CODES" );
    precachestring( &"LAUNCHFACILITY_B_BOMBS_GO_BOOM" );
    precachestring( &"LAUNCHFACILITY_B_TIME_TILL_ICBM_IMPACT" );
    precachestring( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );
    precachestring( &"LAUNCHFACILITY_B_FOLLOW_PRICE" );
    precachestring( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
    _id_A5A4::_id_1332( "allies" );
    level.secondaryprogressbary = 75;
    level.secondaryprogressbarx = 0;
    level.secondaryprogressbarheight = 14;
    level.secondaryprogressbarwidth = 152;
    level.secondaryprogressbartexty = 55;
    level.secondaryprogressbarfontsize = 1;
    level.usetimer = 1;
    level.missionfailedquote = &"LAUNCHFACILITY_B_BOMBS_GO_BOOM";
    level.c4 = getent( "c4", "targetname" );
    level.keyboard = getent( "keyboard", "targetname" );
    level.elevator_upper = getent( "elevator_upper", "targetname" );
    level.wallexplosionsmall_fx = loadfx( "fx/explosions/wall_explosion_small" );
    var_0 = getent( "price", "script_noteworthy" );
    var_0 _id_A5A4::_id_0798( ::price_think );
    var_1 = getent( "grigsby", "script_noteworthy" );
    var_1 _id_A5A4::_id_0798( ::grigsby_think );
    var_2 = getent( "team1", "script_noteworthy" );
    var_2 _id_A5A4::_id_0798( ::team1_think );
    var_3 = getentarray( "vent_friendlies_group1", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, ::vent_friendlies_group1_spawner_think );
    var_4 = getentarray( "vent_enemies_group1", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, ::vent_enemies_group1_spawner_think );
    var_5 = getentarray( "vent_friendlies_group2", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_0798, ::vent_friendlies_group2_spawner_think );
    var_6 = getentarray( "vent_enemies_group2", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_6, _id_A5A4::_id_0798, ::vent_enemies_group2_spawner_think );
    var_7 = getentarray( "gassed_runners", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, ::warehouse_retreating_enemies_think );
    common_scripts\utility::_id_383D( "aa_countdown_started" );
    common_scripts\utility::_id_383D( "aa_first_floor" );
    common_scripts\utility::_id_383D( "aa_warehouse" );
    common_scripts\utility::_id_383D( "aa_launchtubes" );
    common_scripts\utility::_id_383D( "aa_blow_the_wall" );
    common_scripts\utility::_id_383D( "aa_upload_them_codes" );
    common_scripts\utility::_id_383D( "aa_follow_price_end_level" );
    common_scripts\utility::_id_383D( "speakers_active" );
    common_scripts\utility::_id_383D( "control_room" );
    common_scripts\utility::_id_383D( "location_change_stairs" );
    common_scripts\utility::_id_383D( "10min_left" );
    common_scripts\utility::_id_383D( "8min_left" );
    common_scripts\utility::_id_383D( "6min_left" );
    common_scripts\utility::_id_383D( "5min_left" );
    common_scripts\utility::_id_383D( "4min_left" );
    common_scripts\utility::_id_383D( "3min_left" );
    common_scripts\utility::_id_383D( "2min_left" );
    common_scripts\utility::_id_383D( "1min_left" );
    common_scripts\utility::_id_383D( "timer_expired" );
    common_scripts\utility::_id_383D( "countdown_started" );
    common_scripts\utility::_id_383D( "walk" );
    common_scripts\utility::_id_383D( "begin_countdown" );
    common_scripts\utility::_id_383D( "grisby_jump" );
    common_scripts\utility::_id_383D( "move_faster" );
    common_scripts\utility::_id_383D( "start_missile_alarm" );
    common_scripts\utility::_id_383D( "10sec_till_blastoff" );
    common_scripts\utility::_id_383D( "price_close_door" );
    common_scripts\utility::_id_383D( "blast_door_player_clip_on" );
    common_scripts\utility::_id_383D( "blast_door_player_clip_off" );
    common_scripts\utility::_id_383D( "open_vault_doors" );
    common_scripts\utility::_id_383D( "vault_doors_unlocked" );
    common_scripts\utility::_id_383D( "vault_door_opened" );
    common_scripts\utility::_id_383D( "update_objectives" );
    common_scripts\utility::_id_383D( "wall_destroyed" );
    common_scripts\utility::_id_383D( "change_films" );
    common_scripts\utility::_id_383D( "zakhaev_leaving" );
    common_scripts\utility::_id_383D( "codes_uploaded" );
    common_scripts\utility::_id_383D( "delete_team2" );
    common_scripts\utility::_id_383D( "elevator_player_clip_on" );
    common_scripts\utility::_id_383D( "elevator_dialogue" );
    common_scripts\utility::_id_383D( "at_the_jeep" );
    common_scripts\utility::_id_383D( "level_end" );
    common_scripts\utility::_id_383D( "music_start_countdown" );
    common_scripts\utility::_id_383D( "successful_confirmation" );
    common_scripts\utility::_id_383D( "player_in_elevator" );
    common_scripts\utility::_id_383D( "all_in_elevator" );
    common_scripts\utility::_id_383D( "player_out_of_vents" );
    level thread airduct_fan_large();
    level thread airduct_fan_medium();
    level thread airduct_fan_small();
    level thread redlights();
    level thread redlight_spinner();
    level thread wall_lights();
    level thread wall_light_spinner();
    level thread compass_maps();
    level thread obj_control_room();
    level thread obj_which_way_to_control_room();
    level thread obj_upload_the_abort_codes();
    level thread obj_plant_the_c4();
    level thread countdown_begins();
    level thread grigsby_countdown_spam();
    level thread vent_trigger_move_out();
    level thread vent_trigger_air_raid_siren();
    level thread vent_dialogue1();
    level thread vent_dialogue2();
    level thread vent_trigger_friendlies_vent_jump();
    level thread vent_trigger_team1_vent_jump();
    level thread barracks_dialogue();
    level thread team1_walk_trigger();
    level thread team1_run_trigger();
    level thread hide_triggers_1st_floor();
    level thread warehouse_trigger_kill_allied_teammate();
    level thread warehouse_trigger_kill_enemies();
    level thread launchtubes_missile_alarm();
    level thread launchtubes_effects();
    level thread launch_tube_dialogue();
    level thread launchtubes_teleport_friendlies();
    level thread rocket_powering_up();
    level thread keep_price_griggs_distance_hallway_after_staircase();
    level thread run_to_the_door();
    level thread in_volume();
    level thread blast_door_clip();
    level thread vault_doors_dialogue();
    level thread vault_doors_open();
    level thread spawn_utility_enemies();
    level thread preparing_to_breach();

    if ( getdvarint( "use_old_control_room_screen" ) == 1 )
    {
        level thread control_room_noradscreen();
        level thread control_room_bigscreen();
    }
    else
        level thread control_room_screen_h1();

    level thread update_keyboard_monitor_screen( "monitor_8", "all_in_elevator" );
    level thread update_keyboard_monitor_screen( "monitor_9", "all_in_elevator" );
    level thread spawn_telemetry_enemies();
    level thread spawn_telemetry_friendlies();

    if ( getdvarint( "use_old_keyboard_typing" ) == 1 )
        level thread upload_codes();
    else
        level thread upload_codes_h1();

    level thread control_room_dialogue();
    level thread _id_3029();
    level thread elevator_player_clip();
    level thread elevator_dialogue();
    level thread _id_5FFB();
    level thread hide_triggers( "escape" );
    level thread vehical_depot();
    level thread end_of_level();
    var_8 = getentarray( "autosave", "targetname" );

    for ( var_9 = 0; var_9 < var_8.size; var_9++ )
        var_8[var_9] thread my_autosave();
}

h1_typing_dof_start()
{
    level._id_0318 _meth_84A7( 16.0, 150, 9.0, 9.0 );
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 2.5, 25, 4.0, 4.0 );
}

h1_typing_dof_stop()
{
    level._id_0318 _meth_84A7( 16.0, 150, 4.0, 4.0 );
    wait 0.5;
    level._id_0318 _meth_84A6();
}

start_default()
{
    _id_A5E8::_id_870C( "start_default_checkpoint" );
}

start_warehouse()
{
    _id_A5E8::_id_870C( "start_warehouse_checkpoint" );
    common_scripts\utility::_id_383F( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "warehouse_price", "targetname" );
    level._id_6F7C _meth_81C9( var_0._id_02E2, var_0.angles );
    var_1 = getent( "warehouse_grigsby", "targetname" );
    level.grigsby _meth_81C9( var_1._id_02E2, var_1.angles );
    var_2 = getent( "warehouse_player", "targetname" );
    level._id_0318 _meth_8335( var_2._id_02E2 );
    level._id_0318 _meth_8337( var_2.angles );
    common_scripts\utility::_id_383F( "walk" );
    common_scripts\utility::_id_383F( "move_faster" );
    _id_A5A4::_id_070A( "warehouse_color_init" );
    wait 1;
    level._id_91E7[0] delete();
}

start_launchtubes()
{
    _id_A5E8::_id_870C( "start_launchtubes_checkpoint" );
    common_scripts\utility::_id_383F( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "launchtubes_price", "targetname" );
    level._id_6F7C _meth_81C9( var_0._id_02E2, var_0.angles );
    var_1 = getent( "launchtubes_grigsby", "targetname" );
    level.grigsby _meth_81C9( var_1._id_02E2, var_1.angles );
    var_2 = getent( "launchtubes_player", "targetname" );
    level._id_0318 _meth_8335( var_2._id_02E2 );
    level._id_0318 _meth_8337( var_2.angles );
    common_scripts\utility::_id_383F( "walk" );
    common_scripts\utility::_id_383F( "move_faster" );
    wait 1;
    level._id_91E7[0] delete();
}

start_vaultdoors()
{
    _id_A5E8::_id_870C( "start_vaultdoors_checkpoint" );
    common_scripts\utility::_id_383F( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "vaultdoors_price", "targetname" );
    level._id_6F7C _meth_81C9( var_0._id_02E2, var_0.angles );
    var_1 = getent( "vaultdoors_grigsby", "targetname" );
    level.grigsby _meth_81C9( var_1._id_02E2, var_1.angles );
    var_2 = getent( "vaultdoors_player", "targetname" );
    level._id_0318 _meth_8335( var_2._id_02E2 );
    level._id_0318 _meth_8337( var_2.angles );
    common_scripts\utility::_id_383F( "walk" );
    common_scripts\utility::_id_383F( "move_faster" );
    common_scripts\utility::_id_383F( "open_vault_doors" );
    level._id_6F7C _id_A5A4::_id_7E38( "r" );
    _id_A5A4::_id_070A( "setup_for_vault_doors" );
    wait 1;
    level._id_91E7[0] delete();
}

start_controlroom()
{
    _id_A5E8::_id_870C( "start_controlroom_checkpoint" );
    common_scripts\utility::_id_383F( "begin_countdown" );
    level notify( "use_start" );
    var_0 = getent( "controlroom_price", "targetname" );
    level._id_6F7C _meth_81C9( var_0._id_02E2, var_0.angles );
    var_1 = getent( "controlroom_grigsby", "targetname" );
    level.grigsby _meth_81C9( var_1._id_02E2, var_1.angles );
    var_2 = getent( "controlroom_player", "targetname" );
    level._id_0318 _meth_8335( var_2._id_02E2 );
    level._id_0318 _meth_8337( var_2.angles );
    common_scripts\utility::_id_383F( "walk" );
    common_scripts\utility::_id_383F( "move_faster" );
    level thread hide_triggers( "attacking" );
    _id_A5A4::_id_070A( "protect_the_c4" );
    common_scripts\utility::_id_383F( "update_objectives" );
    thread plant_the_c4();
    var_3 = getentarray( "team2", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_88C3 );
    _id_A5A4::_id_070A( "control_room_friendlies_attack" );
    wait 1;
    level._id_91E7[0] delete();
    var_4 = getent( "vault_door_left", "targetname" );
    var_5 = getent( var_4._id_04A4, "targetname" );
    var_5 _meth_804F( var_4 );
    var_6 = getent( "vault_door_right", "targetname" );
    var_7 = getent( var_6._id_04A4, "targetname" );
    var_7 _meth_804F( var_6 );
    var_4 _meth_82B3( -103, 1, 0, 1 );
    var_6 _meth_82B3( 103, 1, 0, 1 );
    var_5 _meth_805A();
    var_7 _meth_805A();
}

_id_8B9A()
{
    _id_A5E8::_id_870C( "start_escape_checkpoint" );
    level notify( "use_start" );
    level thread hide_triggers( "attacking" );
    var_0 = getent( "vault_door_left", "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_1 _meth_804F( var_0 );
    var_2 = getent( "vault_door_right", "targetname" );
    var_3 = getent( var_2._id_04A4, "targetname" );
    var_3 _meth_804F( var_2 );
    var_0 _meth_82B3( -103, 1, 0, 1 );
    var_2 _meth_82B3( 103, 1, 0, 1 );
    var_1 _meth_805A();
    var_3 _meth_805A();
    var_4 = getent( "blasted_wall", "targetname" );
    var_4 _meth_805A();
    common_scripts\_exploder::_id_3528( 100 );
    var_5 = getent( "escape_price", "targetname" );
    level._id_6F7C _meth_81C9( var_5._id_02E2, var_5.angles );
    var_6 = getent( "escape_grigsby", "targetname" );
    level.grigsby _meth_81C9( var_6._id_02E2, var_6.angles );
    var_7 = getent( "escape_player", "targetname" );
    level._id_0318 _meth_8335( var_7._id_02E2 );
    level._id_0318 _meth_8337( var_7.angles );
    common_scripts\utility::_id_383F( "walk" );
    common_scripts\utility::_id_383F( "move_faster" );
    var_8 = getentarray( "team2", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_88C3 );
    _id_A5A4::_id_070A( "control_room_friendlies_attack" );
    level thread show_triggers( "escape" );
    thread telemetry_doors_open();
    thread escape_doors_open();
    thread grigsby_warning();
    thread delete_controlroom_friendlies();
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "vehicledepot" );
    thread follow_price();
    wait 1;
    level._id_91E7[0] delete();
}

start_elevator()
{
    _id_A5E8::_id_870C( "start_elevator_checkpoint" );
    level notify( "use_start" );
    var_0 = getent( "elevator_player", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getent( "elevator_grigsby", "targetname" );
    level._id_6F7C _meth_81CA( var_1._id_02E2, var_1.angles );
    var_2 = getent( "elevator_price", "targetname" );
    level.grigsby _meth_81CA( var_2._id_02E2, var_2.angles );
    common_scripts\utility::_id_383F( "walk" );
    common_scripts\utility::_id_383F( "move_faster" );
    level thread show_triggers( "escape" );
    _id_A5A4::_id_1143( "start_elevator" );
    wait 1;
    level._id_91E7[0] delete();
}

my_autosave()
{
    self waittill( "trigger" );
    autosave_by_name_wraper( "save", self._id_7ABD );
}

get_remaining_seconds()
{
    var_0 = gettime();
    var_1 = ( var_0 - level.timer_start_time ) / 1000 / 60;
    return ( level._id_8F0D - var_1 ) * 60;
}

autosave_by_name_wraper( var_0, var_1 )
{
    if ( isdefined( level.timer_start_time ) )
    {
        var_2 = gettime();
        var_3 = ( var_2 - level.timer_start_time ) / 1000 / 60;
        var_4 = level._id_8F0D - var_3;
        var_1 *= level.requried_time_scale;

        if ( var_4 < var_1 )
            return;
    }

    _id_A5A4::_id_1151( var_0, 12 );
}

price_think()
{
    level._id_6F7C = self;
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread _id_A5A4::_id_58D7();
    level._id_6F7C._id_2AF7 = 1;
    thread ai_duct();
}

grigsby_think()
{
    level.grigsby = self;
    level.grigsby._id_0C72 = "grigsby";
    level.grigsby thread _id_A5A4::_id_58D7();
    level.grigsby._id_2AF7 = 1;
    thread ai_duct();
}

team1_think()
{
    if ( !isdefined( level._id_91E7 ) )
        level._id_91E7 = [];

    self._id_0C72 = "steve";
    level._id_91E7[level._id_91E7.size] = self;
    self._id_2AF7 = 1;
    thread ai_duct();
}

vent_trigger_move_out()
{
    wait 3;
    _id_A5A4::_id_070A( "move_out" );
    common_scripts\utility::_id_383F( "aa_first_floor" );
    wait 1;
    _id_A5A4::_id_070A( "h1_move_out" );
}

vent_trigger_air_raid_siren()
{
    var_0 = getent( "trigger_air_raid", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "air_raid", "targetname" );
    var_1 _meth_8077( "emt_alarm_missile_siren" );
}

vent_dialogue1()
{
    level endon( "use_start" );
    wait 3;
    _id_A5A4::_id_70BD( "letsmove" );
    wait 3;
    _id_A5A4::_id_70BD( "basesecurity" );
    wait 1;
    _id_A5A4::_id_70BD( "invents" );
    _id_A5A4::_id_70BD( "gm1_copythat" );
    wait 1;
    play_sound_on_speaker( "launchfacility_b_rul_alert" );
}

vent_dialogue2()
{
    var_0 = getent( "yankee_six_regroup", "script_noteworthy" );
    var_0 thread vent_dialogue2_01();
}

vent_dialogue2_01()
{
    self waittill( "trigger" );
    _id_A5A4::_id_70BD( "heavyresistance" );
    _id_A5A4::_id_70BD( "gaincontrol" );
    _id_A5A4::_id_70BD( "regroup" );
    common_scripts\utility::_id_383F( "begin_countdown" );
}

barracks_dialogue()
{
    var_0 = getent( "barracks_warning", "targetname" );
    var_0 waittill( "trigger" );
    play_sound_on_speaker( "launchfacility_b_rul_barracks" );
}

team1_walk_trigger()
{
    var_0 = getent( "team1_walk", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "walk" );
}

team1_run_trigger()
{
    var_0 = getent( "team1_run", "script_noteworthy" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "move_faster" );
}

obj_control_room()
{
    level endon( "use_start" );
    var_0 = 0;
    var_1 = getent( "origin_obj_stairs", "targetname" );
    wait 6;
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_GET_TO_THE_TELEMETRY", var_1._id_02E2 );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "location_change_stairs" );
    var_1 = getent( "origin_obj_breach_telemetry_room", "targetname" );
    objective_position( var_0, var_1._id_02E2 );
    common_scripts\utility::_id_384A( "control_room" );
    wait 1;
    objective_state( var_0, "done" );
}

obj_which_way_to_control_room()
{
    var_0 = getent( "pointing_to_control_room", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "location_change_stairs" );
    thread obj_player_reached_control_room();
}

obj_player_reached_control_room()
{
    var_0 = getent( "control_room", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "control_room" );
}

obj_plant_the_c4()
{
    common_scripts\utility::_id_384A( "update_objectives" );
    var_0 = 1;
    var_1 = getent( "wall_explosives", "targetname" );
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_PLANT_THE_C4", var_1._id_02E2 );
    _func_1E1( var_0, 1 );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "wall_destroyed" );
    wait 1;
    objective_state( var_0, "done" );
    var_0 = 2;
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_CLEAR_ROOM", var_1._id_02E2 );
    _func_1E1( var_0, 1 );
    objective_current( var_0 );
    _id_A5A4::_id_A066( "control_room" );
    objective_state( var_0, "done" );
}

obj_upload_the_abort_codes()
{
    _id_A5A4::_id_A066( "control_room" );
    _id_A5E8::_id_870C( "start_code_input_mix" );
    var_0 = getent( "control_room_friendlies_group", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 _id_A5A4::_id_0706();

    hide_triggers( "control_room_friendlies_group" );
    _id_A5A4::_id_70BD( "grg_clearR" );
    _id_A5A4::_id_70BD( "entercodes" );
    var_1 = 3;
    wait 0.5;
    var_2 = ( 0, 0, 0 );

    if ( !common_scripts\utility::_id_382E( "codes_uploaded" ) )
    {
        var_3 = getent( "keyboard_use_trigger", "targetname" );
        var_2 = var_3._id_02E2;
    }

    objective_add( var_1, "active", &"LAUNCHFACILITY_B_UPLOAD_THE_ABORT_CODES", var_2 );
    objective_current( var_1 );
    common_scripts\utility::_id_384A( "codes_uploaded" );
    var_4 = "Codes uploaded with " + get_remaining_seconds() + " seconds remaining on gameskill " + level._id_3BFE;
    logstring( var_4 );
    objective_state( var_1, "done" );

    if ( level.usetimer )
        level thread _id_53B1();

    wait 1;
}

obj_follow_price()
{
    var_0 = 4;
    var_1 = level._id_6F7C._id_02E2;
    objective_add( var_0, "active", &"LAUNCHFACILITY_B_FOLLOW_PRICE", var_1 );
    objective_current( var_0 );
    level._id_6F7C thread lock_obj_location( var_0 );
    common_scripts\utility::_id_384A( "at_the_jeep" );
    objective_state( var_0, "done" );
    level notify( "unlock_obj" );
    wait 1;
}

lock_obj_location( var_0 )
{
    level endon( "unlock_obj" );

    for (;;)
    {
        objective_position( var_0, self._id_02E2 + ( 0, 0, 48 ) );
        wait 0.5;
    }
}

countdown_begins()
{
    if ( _id_A5A4::_id_5016() )
        _id_A5A4::_id_9FC0( "countdown_start" );

    var_0 = undefined;

    switch ( level._id_3BFE )
    {
        case 1:
            level._id_8F0D = 11;
            level.requried_time_scale = 1.25;
            var_0 = "11mins";
            break;
        case 2:
            level._id_8F0D = 11;
            level.requried_time_scale = 1;
            var_0 = "11mins";
            break;
        case 3:
            level._id_8F0D = 9;
            level.requried_time_scale = 1;
            var_0 = "9mins";
            break;
        default:
            level._id_8F0D = 15;
            level.requried_time_scale = 1.36;
            var_0 = "15mins";
            break;
    }

    common_scripts\utility::_id_384A( "begin_countdown" );

    if ( _id_A5A4::_id_5016() )
        _id_A5A4::_id_70BD( var_0 );

    common_scripts\utility::_id_383F( "countdown_started" );
    common_scripts\utility::_id_383F( "aa_countdown_started" );
    _id_A5A4::arcademode_checkpoint( 2, "a" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "pri_copythat" );
    level thread starttimer();
    common_scripts\utility::_id_383F( "music_start_countdown" );
    level.timer_start_time = gettime();
    _id_A5E8::_id_870C( "start_hallway_combat_mix" );
}

grigsby_countdown_spam()
{
    common_scripts\utility::_id_384A( "countdown_started" );

    if ( level._id_8F0D > 10 )
        thread _id_A5A4::_id_3840( "10min_left", level._id_8F0D * 60 - 602 );

    thread _id_A5A4::_id_3840( "8min_left", level._id_8F0D * 60 - 482 );
    thread _id_A5A4::_id_3840( "6min_left", level._id_8F0D * 60 - 362 );
    thread _id_A5A4::_id_3840( "5min_left", level._id_8F0D * 60 - 302 );
    thread _id_A5A4::_id_3840( "4min_left", level._id_8F0D * 60 - 242 );
    thread _id_A5A4::_id_3840( "3min_left", level._id_8F0D * 60 - 182 );
    thread _id_A5A4::_id_3840( "2min_left", level._id_8F0D * 60 - 122 );
    thread _id_A5A4::_id_3840( "1min_left", level._id_8F0D * 60 - 62 );
    level thread grigsby_countdown_dialogue();
}

grigsby_countdown_dialogue()
{
    level endon( "codes_uploaded" );
    common_scripts\utility::_id_384A( "10min_left" );
    _id_A5A4::_id_70BD( "grg_10" );
    common_scripts\utility::_id_384A( "8min_left" );
    _id_A5A4::_id_70BD( "grg_8" );
    common_scripts\utility::_id_384A( "6min_left" );
    _id_A5A4::_id_70BD( "grg_6" );
    common_scripts\utility::_id_384A( "5min_left" );
    _id_A5A4::_id_70BD( "grg_5" );
    common_scripts\utility::_id_384A( "4min_left" );
    _id_A5A4::_id_70BD( "grg_4" );
    common_scripts\utility::_id_384A( "3min_left" );
    _id_A5A4::_id_70BD( "grg_3" );
}

starttimer()
{
    _id_53B1();
    level endon( "kill_timer" );
    level._id_4AFE = 20;
    level._id_9373 = _id_A546::_id_3D17( undefined, undefined, undefined, undefined, level._id_8F0D * 60 );
    level._id_9373 _meth_808B( 30, 900000, 700 );
    level._id_9373._id_92B2._id_0241 = &"LAUNCHFACILITY_B_TIME_TILL_ICBM_IMPACT";
    level._id_9373 _meth_80D4( level._id_8F0D * 60 );
    wait(level._id_8F0D * 60);
    common_scripts\utility::_id_383F( "timer_expired" );
    _id_A546::destroy_countdown_hud( level._id_9373 );
    _id_A5E8::_id_870C( "mission_failed" );
    level thread mission_failed_out_of_time();
}

mission_failed_out_of_time()
{
    level._id_0318 endon( "death" );
    level endon( "kill_timer" );
    level notify( "mission failed" );
    setdvar( "ui_deadquote", level.missionfailedquote );
    _id_A5A4::_id_5CDF();
}

_id_53B1()
{
    level notify( "kill_timer" );

    if ( isdefined( level._id_9373 ) )
        _id_A546::destroy_countdown_hud( level._id_9373 );
}

ai_duct()
{
    self._id_38A8 = 1;
    self._id_020C = 24;
    self _meth_81CE( "crouch" );
    self._id_0CB7 = ::air_duct_check_cover_transition;
    self._id_0CBD = ::air_duct_get_transition_type;
    self.exitconditioncheckfunc = ::air_duct_check_cover_transition;
    self.exittypefunc = ::air_duct_get_transition_type;
    common_scripts\utility::_id_384A( "walk" );
    _id_A5A4::_id_22DA( "on" );
    self _meth_81CE( "stand", "crouch", "prone" );
    self._id_0CB7 = undefined;
    self._id_0CBD = undefined;
    self.exitconditioncheckfunc = undefined;
    self.exittypefunc = undefined;
    common_scripts\utility::_id_384A( "move_faster" );
    _id_A5A4::_id_22DA( "off" );
    self._id_020C = 60;
}

air_duct_check_cover_transition( var_0 )
{
    return 1;
}

air_duct_get_transition_type( var_0 )
{
    return "exposed_crouch_crouchwalk";
}

vent_friendlies_group1_spawner_think()
{
    thread _id_A5A4::_id_58D7();
    self._id_01D0 = 0;
    _id_A5A4::_id_22DA( "on" );
    self _meth_81CE( "stand", "crouch", "prone" );
    _id_A5A4::_id_A066( "vent_enemies_group1" );
    _id_A5A4::_id_070A( "vent_friendlies_group1_move" );
    _id_A5A4::_id_22DA( "off" );
    wait 1;
    common_scripts\utility::_id_A06A( self, "goal", level, "player_out_of_vents" );
    _id_A5A4::_id_8EA4();
    self delete();
}

vent_enemies_group1_spawner_think()
{
    self endon( "death" );
    self._id_01D0 = 0;
    thread delete_on_damage();
    wait 10;
    self delete();
}

delete_on_damage()
{
    self endon( "death" );
    self waittill( "damage" );
    self delete();
}

vent_friendlies_group2_spawner_think()
{
    thread _id_A5A4::_id_58D7();
    _id_A5A4::_id_A066( "vent_enemies_group2" );
    _id_A5A4::_id_070A( "vent_friendlies_group2_move" );
    wait 1;
    common_scripts\utility::_id_A06A( self, "goal", level, "player_out_of_vents" );
    _id_A5A4::_id_8EA4();
    self delete();
}

vent_enemies_group2_spawner_think()
{
    self._id_01E6 = 2;
    wait 10;

    if ( _func_1A1( self ) )
        self _meth_8054();
}

vent_trigger_friendlies_vent_jump()
{
    var_0 = getent( "price_grigsby_jump", "targetname" );
    var_0 waittill( "trigger" );
    thread vent_friendlies_vent_jump();
    thread vent_grisby_vent_jump();
}

vent_trigger_team1_vent_jump()
{
    var_0 = getent( "team1_jump", "targetname" );
    var_0 waittill( "trigger" );
    wait 1;
    thread vent_team1_vent_jump();
}

vent_friendlies_vent_jump()
{
    common_scripts\utility::_id_383F( "grisby_jump" );
    var_0 = getent( "vent_jump_animent", "targetname" );
    var_0 _id_A510::_id_0BFF( level._id_6F7C, "vent_drop_l" );
    var_0 _id_A510::_id_0C24( level._id_6F7C, "vent_drop_l" );
    level._id_6F7C _id_A5A4::_id_7E38( "r" );
    wait 0.5;
    _id_A5A4::_id_070A( "grigsby_price_setup_shower" );
}

vent_grisby_vent_jump()
{
    common_scripts\utility::_id_384A( "grisby_jump" );
    var_0 = getent( "vent_jump_animent", "targetname" );
    var_0 _id_A510::_id_0BFF( level.grigsby, "vent_drop_r" );
    var_0 _id_A510::_id_0C24( level.grigsby, "vent_drop_r" );
    level.grigsby _id_A5A4::_id_7E38( "o" );
}

vent_team1_vent_jump()
{
    var_0 = getent( "vent_jump_animent", "targetname" );
    var_0 _id_A510::_id_0C24( level._id_91E7[0], "vent_drop_team1" );
    level._id_91E7[0] _id_A5A4::_id_7E38( "y" );
    _id_A5A4::_id_070A( "team1_setup_shower" );
}

hide_triggers_1st_floor()
{
    var_0 = getent( "attacking_1st_floor", "targetname" );
    var_0 waittill( "trigger" );
    level thread hide_triggers( "attacking_1st_floor" );
    common_scripts\utility::_id_3831( "aa_first_floor" );
    common_scripts\utility::_id_383F( "aa_warehouse" );
    _id_A5A4::arcademode_checkpoint( 3, "b" );
}

warehouse_retreating_enemies_think()
{
    self endon( "death" );
    self waittill( "goal" );
    self delete();
}

warehouse_trigger_kill_allied_teammate()
{
    var_0 = getent( "kill_yellow_allied", "targetname" );
    var_0 waittill( "trigger" );

    if ( _func_1A1( level._id_91E7[0] ) )
        level._id_91E7[0] _meth_8054();
}

warehouse_trigger_kill_enemies()
{
    var_0 = getent( "warehouse_killer", "targetname" );
    var_0 waittill( "trigger" );
    thread warehouse_kill_all_enemy();
    common_scripts\utility::_id_3831( "aa_warehouse" );
    common_scripts\utility::_id_383F( "aa_launchtubes" );
    _id_A5A4::arcademode_checkpoint( 3, "c" );
}

warehouse_kill_all_enemy()
{
    var_0 = getent( "killer_warehouse", "targetname" );
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _meth_80AB( var_0 ) )
            var_1[var_2] _meth_8053( var_1[var_2]._id_01E6 + 1000, var_1[var_2]._id_02E2 );
    }
}

play_sound_on_speaker( var_0, var_1 )
{
    var_2 = getentarray( "speaker", "targetname" );

    if ( isdefined( var_1 ) )
    {
        level notify( "speaker_interrupt" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[var_3] _meth_80AE();

        wait 0.5;
    }
    else if ( common_scripts\utility::_id_382E( "speakers_active" ) )
        return;

    level endon( "speaker_interrupt" );
    common_scripts\utility::_id_383F( "speakers_active" );
    var_2 = common_scripts\utility::_id_3CCB( level._id_0318._id_02E2, var_2, undefined, 2 );
    var_2[0] _meth_809C( var_0, "sounddone", 1 );
    var_2[1] _meth_809C( var_0 );
    var_2[0] waittill( "sounddone" );
    common_scripts\utility::_id_3831( "speakers_active" );
}

launch_tube_dialogue()
{
    var_0 = getent( "times_running_out", "targetname" );
    var_0 waittill( "trigger" );
    _id_A5A4::_id_70BD( "grg_gottamove" );
    level endon( "speaker_interrupt" );
    wait 2;
    play_sound_on_speaker( "launchfacility_b_rul_storagearea" );
    play_sound_on_speaker( "launchfacility_b_rul_primaryinititated" );
    play_sound_on_speaker( "launchfacility_b_rul_securemissilebay" );
    _id_A5A4::_id_70BD( "grg_goinon" );
    _id_A5A4::_id_70BD( "startedcountdown" );
}

rocket_powering_up()
{
    var_0 = getent( "rocket_power_up", "targetname" );
    var_0 waittill( "trigger" );
    play_sound_on_speaker( "launchfacility_b_rul_30secs" );
    _id_A5E8::_id_870C( "start_missile_silo_mix" );
    wait(_func_0B5( 0.2, 1.2 ));

    while ( !common_scripts\utility::_id_382E( "blast_door_player_clip_off" ) )
    {
        _func_18C( 0.05, 1, level._id_0318._id_02E2, 1024 );
        wait 0.2;
    }
}

launchtubes_teleport_friendlies()
{
    var_0 = getent( "teleport_the_team", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "10sec_till_blastoff" );
    level._id_0318 _meth_817B( "player" );
    setignoremegroup( "allies", "axis" );
    setignoremegroup( "axis", "allies" );
    thread launchtubes_clear();
    hide_triggers( "countdown_remove" );
    var_1 = getent( "launchtubes_teleport_price", "targetname" );
    level._id_6F7C.a._id_2B20 = 1;
    level._id_6F7C _meth_81CA( var_1._id_02E2, var_1.angles );
    level._id_6F7C._id_01D1 = 0;
    var_2 = getent( "launchtubes_teleport_grigsby", "targetname" );
    level.grigsby.a._id_2B20 = 1;
    level.grigsby _meth_81CA( var_2._id_02E2, var_2.angles );
    level.grigsby _meth_81A7( 1 );
    level.grigsby._id_01D1 = 0;
    _func_0D6( "ai_friendlyFireBlockDuration", 0 );
    common_scripts\utility::_id_383F( "price_close_door" );
    level.grigsby thread guard_the_vaultdoors_grigsby();
    common_scripts\utility::_id_383F( "start_missile_alarm" );
    thread rocket_powering_up_dialogue();
    _id_A5A4::_id_70BD( "pri_gogogo1" );
}

launchtubes_effects()
{
    common_scripts\utility::_id_384A( "10sec_till_blastoff" );
    common_scripts\_exploder::_id_3528( 1 );
}

launchtubes_clear()
{
    var_0 = getent( "kill_hallway_enemies", "targetname" );
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _meth_80AB( var_0 ) )
            var_1[var_2] _meth_8053( var_1[var_2]._id_01E6 + 1000, var_1[var_2]._id_02E2 );
    }
}

rocket_powering_up_dialogue()
{
    wait 1;
    play_sound_on_speaker( "launchfacility_b_rul_ten", 1 );
    play_sound_on_speaker( "launchfacility_b_rul_nine" );
    play_sound_on_speaker( "launchfacility_b_rul_eight" );
    play_sound_on_speaker( "launchfacility_b_rul_seven" );
    play_sound_on_speaker( "launchfacility_b_rul_six" );
    play_sound_on_speaker( "launchfacility_b_rul_five" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_four" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_three" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_two" );
    wait 0.3;
    play_sound_on_speaker( "launchfacility_b_rul_one" );
    play_sound_on_speaker( "launchfacility_b_rul_launchcomplete" );
    wait 1;
    thread kill_player_in_tubes();
}

launchtubes_missile_alarm()
{
    common_scripts\utility::_id_384A( "start_missile_alarm" );
    var_0 = getent( "alarm_missile_warning", "targetname" );
    var_0 _meth_809C( "emt_alarm_missile_warning" );
}

in_volume()
{
    var_0 = getent( "shut_blast_door", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        var_1 = _func_0D9( "allies" );
        var_2 = 0;

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( var_1[var_3] _meth_80AB( var_0 ) )
                var_2++;
        }

        if ( var_2 == var_1.size )
            return;
    }
}

run_to_the_door()
{
    level thread guard_the_vaultdoors();
    var_0 = getent( "close_blastdoor_animent", "targetname" );
    var_1 = getent( "blast_door_slam", "targetname" );
    var_2 = getent( "blast_door_col", "targetname" );
    var_2 _meth_804F( var_1, "hinge_jnt", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 = getent( "shut_blast_door", "targetname" );
    wait 2;
    var_1._id_0C72 = "door";
    var_1 _id_A510::_id_7F29();
    var_0 _id_A510::_id_0BC6( var_1, "blast_door_close", var_0._id_02E2, var_0.angles );
    wait 2;
    common_scripts\utility::_id_384A( "price_close_door" );
    var_0 _id_A510::_id_0BFF( level._id_6F7C, "blast_door_runto" );
    var_0 _id_A510::_id_0C24( level._id_6F7C, "blast_door_runto" );
    var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "blast_door_wave", undefined, "stop_idle" );
    thread price_warning();
    level._id_0318 in_volume();
    var_0 notify( "stop_idle" );
    common_scripts\utility::_id_383F( "blast_door_player_clip_on" );
    common_scripts\utility::_id_383F( "walk" );
    var_4 = [];
    var_4[0] = var_1;
    var_4[1] = level._id_6F7C;
    level thread launchtubes_hatch_close_sound();
    var_0 _id_A510::_id_0C18( var_4, "blast_door_close" );
    common_scripts\utility::_id_383F( "blast_door_player_clip_off" );
    common_scripts\utility::_id_383F( "open_vault_doors" );
    _id_A5E8::_id_870C( "start_vault_doors_mix" );

    switch ( level._id_3BFE )
    {
        case 1:
            autosave_by_name_wraper( "escaped_the_silos", 3.25 );
            break;
        case 2:
            autosave_by_name_wraper( "escaped_the_silos", 3.5 );
            break;
        case 3:
            autosave_by_name_wraper( "escaped_the_silos", 3 );
            break;
        default:
            autosave_by_name_wraper( "escaped_the_silos", 3.75 );
            break;
    }

    level thread hide_triggers( "kill_tube_volume" );
    level thread kill_enemy_in_tubes();
    var_2 _meth_8059();
}

price_warning()
{
    _id_A5A4::_id_70BD( "pri_movemove" );
}

launchtubes_hatch_close_sound()
{
    wait 0.5;
    level._id_6F7C _meth_809C( "scn_door_launchb_hatch_close" );
    level._id_0318 _meth_809C( "scn_launchb_missile_launch" );
    common_scripts\_exploder::_id_3528( 2 );
    _id_A5A4::_id_8E7E( 1 );
    var_0 = getent( "inc_fireball_sfx", "targetname" );
    var_0 _meth_809C( "h1_launchtube_fireball" );
    level thread fireballdlight();
    level thread kill_launchtube_steam_fx();
    thread rockets_launch();
}

rockets_launch()
{
    for ( var_0 = 0.15; var_0 > 0; var_0 -= 0.001 )
    {
        _func_18C( var_0, 0.1, level._id_0318._id_02E2, 256 );
        wait 0.1;
    }
}

fireballdlight()
{
    var_0 = 2;
    var_1 = spawn( "script_model", ( 395.177, 2955.42, -300.614 ) );
    var_1 _meth_80B3( "tag_origin" );
    playfxontag( level._id_058F["launchtube_fire_light"], var_1, "tag_origin" );
    var_1 _meth_82AA( ( -524, 3898, -292 ), var_0, 0, 1 );
    wait(var_0);
    var_1 delete();
}

kill_player_in_tubes()
{
    var_0 = getent( "kill_player_tubes", "targetname" );

    if ( level._id_0318 _meth_80AB( var_0 ) )
    {
        level._id_0318 _meth_809C( "scn_launchb_missile_launch" );
        level._id_0318 _meth_8134( 0 );
        level._id_0318 thread player_death_effect();
        wait 1;
        level._id_0318 _meth_8053( level._id_0318._id_01E6 + 1000, level._id_0318._id_02E2 );
    }
}

player_death_effect()
{
    var_0 = getent( "player", "classname" );
    playfx( level._id_058F["player_death_explosion"], var_0._id_02E2 );
    _func_18C( 1, 1, level._id_0318._id_02E2, 100 );
}

kill_launchtube_steam_fx()
{
    var_0 = _id_A5A4::_id_3FA9( "steam_jet_med_loop" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "hallway_steam_loop" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3FA9( "steam_jet_med_loop_rand" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] common_scripts\utility::_id_671F();
}

blast_door_clip()
{
    var_0 = getent( "blast_player_clip", "targetname" );
    var_0 _meth_82BB();
    common_scripts\utility::_id_384A( "blast_door_player_clip_on" );
    var_0 _meth_82BA();
    common_scripts\utility::_id_384A( "blast_door_player_clip_off" );
    var_0 _meth_82BB();
}

kill_enemy_in_tubes()
{
    var_0 = getent( "killer_tubes", "targetname" );
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _meth_80AB( var_0 ) )
            var_1[var_2] _meth_8053( var_1[var_2]._id_01E6 + 1000, var_1[var_2]._id_02E2 );
    }
}

guard_the_vaultdoors()
{
    var_0 = getent( "guard_vaultdoors", "targetname" );
    common_scripts\utility::_id_384A( "open_vault_doors" );
    var_1[0] = level._id_6F7C;
    var_1[1] = level.grigsby;
    level.grigsby _meth_8168( 0 );
    var_0 _id_A510::_id_0BF2( var_1, "guard_vaultdoors" );
    var_0 _id_A510::_id_0C18( var_1, "guard_vaultdoors" );
}

returnexposedcrouch()
{
    return "exposed_crouch";
}

guard_the_vaultdoors_grigsby_wait_for_approach( var_0 )
{
    self endon( "killanimscript" );
    self endon( "abort_approach" );
    animscripts\shared::_id_2D06( "coverArrival" );
    self _meth_8168( 1 );
    common_scripts\utility::_id_383F( "vaultdoors_grigs_approach_done" );
}

guard_the_vaultdoors_grigsby()
{
    level endon( "open_vault_doors" );
    var_0 = getent( "guard_vaultdoors", "targetname" );
    level.grigsby._id_0CBD = ::returnexposedcrouch;
    level.grigsby.a.dontstartaim = 1;
    var_0 _id_A510::_id_0BF5( level.grigsby, "guard_vaultdoors" );
    common_scripts\utility::_id_383D( "vaultdoors_grigs_approach_done" );
    level.grigsby thread guard_the_vaultdoors_grigsby_wait_for_approach( var_0 );

    while ( level.grigsby._id_038E == "cover_arrival" )
        wait 0.05;

    level.grigsby.a.dontstartaim = undefined;
    level.grigsby._id_0CBD = undefined;

    if ( !common_scripts\utility::_id_382E( "vaultdoors_grigs_approach_done" ) )
        self _meth_8168( 1 );
}

vault_doors_dialogue()
{
    common_scripts\utility::_id_384A( "open_vault_doors" );

    if ( getdvarint( "use_old_vaultdoors" ) != 1 )
        wait 3;

    _id_A5A4::_id_70BD( "controlbasesec" );

    if ( getdvarint( "use_old_vaultdoors" ) != 1 )
        return;

    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "pri_atdoor" );
    _id_A5A4::_id_70BD( "workinonit" );
    wait 2;
    _id_A5A4::_id_70BD( "almostthere" );
    wait 2;
    _id_A5A4::_id_70BD( "gotit" );
    thread vault_doors_team_ready();
    wait 0.5;
    common_scripts\utility::_id_383F( "vault_doors_unlocked" );
    wait 8;
    level.grigsby _id_A510::_id_0C21( level.grigsby, "grg_shittinme" );
    _id_A5A4::_id_70BD( "pri_faster" );
    _id_A5A4::_id_70BD( "gm1_trypulling" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "pri_cheeky" );
    vault_door_scene_completed();
}

vault_door_scene_completed()
{
    switch ( level._id_3BFE )
    {
        case 1:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.4 );
            break;
        case 2:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.75 );
            break;
        case 3:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.1 );
            break;
        default:
            autosave_by_name_wraper( "vault_doors_are_opening", 2.4 );
            break;
    }

    _func_0D6( "ai_friendlyFireBlockDuration", 2000 );
    level._id_6F7C.a._id_2B20 = 0;
    level._id_6F7C._id_01D1 = 0.9;
    level.grigsby.a._id_2B20 = 0;
    level.grigsby._id_01D1 = 0.9;
    setthreatbias( "allies", "axis", 0 );
    setthreatbias( "axis", "allies", 0 );
}

vault_doors_open()
{
    common_scripts\utility::_id_384A( "vault_doors_unlocked" );
    var_0 = getent( "vault_door_left", "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_1 _meth_804F( var_0 );
    var_2 = getent( "vault_door_sfx", "targetname" );
    var_2 _meth_809C( "scn_vault_door_open" );
    var_3 = getent( "vault_door_right", "targetname" );
    var_4 = getent( var_3._id_04A4, "targetname" );
    var_4 _meth_804F( var_3 );
    wait 1;
    var_0 _meth_82B3( -0.3, 0.05 );
    var_3 _meth_82B3( 0.3, 0.05 );
    var_0 _meth_809C( "mtl_steam_pipe_burst" );
    var_3 _meth_809C( "expl_steam_pipe_body" );
    wait 1;
    var_0 _meth_809C( "expl_steam_pipe_body" );
    wait 2;
    var_3 _meth_809C( "expl_steam_pipe_body" );
    var_0 _meth_809C( "gate_open" );
    var_0 _meth_82B3( -50, 40, 0, 40 );
    var_3 _meth_82B3( 50, 40, 0, 40 );
    wait 20;
    var_0 _meth_82B3( -50, 30, 0, 30 );
    var_3 _meth_82B3( 50, 30, 0, 30 );
    common_scripts\utility::_id_3831( "aa_launchtubes" );
    _id_A5A4::arcademode_checkpoint( 5, "d" );
    common_scripts\utility::_id_383F( "vault_door_opened" );
    common_scripts\utility::_id_383F( "move_faster" );
    common_scripts\utility::_id_383F( "aa_blow_the_wall" );
    var_1 _meth_805A();
    var_4 _meth_805A();
}

vault_doors_team_ready()
{
    level._id_6F7C _id_A5A4::_id_7E38( "r" );
    level.grigsby _id_A5A4::_id_7E38( "o" );
    _id_A5A4::_id_070A( "setup_for_vault_doors_opening" );
}

spawn_utility_enemies()
{
    common_scripts\utility::_id_384A( "vault_door_opened" );
    var_0 = getentarray( "utility_enemies", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    thread blow_the_wall_dialogue();
}

preparing_to_breach()
{
    level._id_0318 endon( "death" );
    _id_A5A4::_id_A066( "utility_badies" );
    level thread hide_triggers( "attacking" );
    _id_A5A4::_id_070A( "protect_the_c4" );
}

blow_the_wall_dialogue()
{
    var_0 = getent( "plant_explosives_dialogue", "targetname" );
    var_0 waittill( "trigger" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "status" );
    _id_A5A4::_id_70BD( "gm2_inposition" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "pri_plantexplos" );
    common_scripts\utility::_id_383F( "update_objectives" );
    thread plant_the_c4();

    switch ( level._id_3BFE )
    {
        case 1:
            autosave_by_name_wraper( "time_to_breach_war_room", 1 );
            break;
        case 2:
            autosave_by_name_wraper( "time_to_breach_war_room", 1.15 );
            break;
        case 3:
            autosave_by_name_wraper( "time_to_breach_war_room", 0.75 );
            break;
        default:
            autosave_by_name_wraper( "time_to_breach_war_room", 1.3 );
            break;
    }
}

plant_the_c4()
{
    level._id_0318 endon( "death" );
    var_0 = getent( "wall_explosives", "targetname" );
    var_0 maps\_c4::c4_location( undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), var_0._id_02E2 );
    var_0 waittill( "c4_planted" );
    level notify( "wall_c4_planted" );
    thread griggs_c4_take_cover_path();
    _id_A5A4::_id_070A( "take_cover" );
    var_0 waittill( "c4_detonation" );
    thread blow_the_wall();
}

griggs_c4_take_cover_path()
{
    level.grigsby endon( "death" );
    level.grigsby _id_A5A4::_id_2A74();
    var_0 = _func_0C3( "griggs_c4_take_cover_start", "targetname" );
    level.grigsby thread _id_A5A4::_id_396A( var_0 );
    level.grigsby waittill( "reached_path_end" );
    level.grigsby _id_A5A4::_id_309A();
    level.grigsby.disable_tight_turn = 1;
    var_1 = _func_0C3( var_0._id_04A4, "targetname" );

    for (;;)
    {
        if ( _func_0F0( level.grigsby._id_02E2, var_1._id_02E2 ) > 90000 )
            break;

        wait 0.05;
    }

    level.grigsby.disable_tight_turn = undefined;
}

blow_the_wall()
{
    var_0 = getent( "blasted_wall", "targetname" );
    var_0 _meth_805A();
    common_scripts\_exploder::_id_3528( 100 );
    var_1 = getent( "wall_explosives", "targetname" );
    playfx( level.wallexplosionsmall_fx, var_1._id_02E2 );
    thread common_scripts\utility::_id_69C2( "h1_c4_explosion_main", var_1._id_02E2 );
    _func_189( var_1._id_02E2, 256, 200, 50 );
    _func_18C( 0.4, 1, var_1._id_02E2, 1000 );
    common_scripts\utility::_id_383F( "wall_destroyed" );
    common_scripts\utility::_id_3831( "aa_blow_the_wall" );
    common_scripts\utility::_id_383F( "aa_upload_them_codes" );
    wait 1;
    _id_A5A4::_id_070A( "breaching_control_room" );
    _id_A5A4::_id_70BD( "pri_gogogo2" );
    _id_A5A4::_id_70BD( "movingin" );
    _id_A5E8::_id_870C( "start_control_room_mix" );
}

spawn_telemetry_enemies()
{
    common_scripts\utility::_id_384A( "wall_destroyed" );
    var_0 = getentarray( "telemetry_enemies", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
}

spawn_telemetry_friendlies()
{
    var_0 = getentarray( "team2", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::telemetry_friendlies_think );
    common_scripts\utility::_id_384A( "wall_destroyed" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
    _id_A5A4::_id_070A( "control_room_friendlies_attack" );
}

telemetry_friendlies_think()
{
    self endon( "death" );
    thread _id_A5A4::_id_58D7();
    common_scripts\utility::_id_384A( "delete_team2" );
    _id_A5A4::_id_8EA4();
    self delete();
}

upload_codes_h1()
{
    var_0 = getent( "keyboard_use_trigger", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    var_1 = getent( "keyboard_use_trigger_h1", "targetname" );
    var_2 = spawn( "script_model", level.keyboard._id_02E2 );
    var_2.angles = ( 0, 315, 0 );
    var_2 _meth_80B3( "com_computer_keyboard" );
    _id_A5A4::_id_A066( "control_room" );
    var_3 = 0.05;
    var_4 = 0;
    var_5 = 3;
    var_6 = spawn( "script_model", level.keyboard._id_02E2 );
    var_6.angles = ( 0, 315, 0 );
    var_6 _meth_80B3( "com_computer_keyboard_obj" );
    var_7 = spawn( "script_origin", ( -2662, 4452, -387 ) );
    var_7.angles = ( 0, 138, 0 );
    var_8 = ( -2647, 4430, -391 );
    var_9 = ( 0, 138, 0 );
    var_10 = _func_0B7( 30 );

    for (;;)
    {
        var_11 = level._id_0318 _meth_8458();
        var_12 = level._id_0318 _meth_8338();

        if ( level._id_0318 _meth_8462() || !level._id_0318 _meth_80AB( var_1 ) || !common_scripts\utility::_id_A347( var_11, var_12, var_0._id_71E9, var_10 ) )
        {
            var_1 _meth_80DD( " " );
            waittillframeend;
            continue;
        }

        var_1 _meth_80DD( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );

        if ( !level._id_0318 _meth_8339() )
        {
            waittillframeend;
            continue;
        }

        var_1 _meth_80DD( " " );
        level._id_0318 _meth_811B( 0 );
        level._id_0318 _meth_811C( 0 );
        level._id_0318 _meth_831A();
        level._id_0318 _meth_8326( 1 );
        level._id_0318 _meth_811D( 0 );
        var_13 = _id_A5A4::_id_88D1( "player" );
        var_13 _meth_8056();
        var_7 _id_A510::_id_0BC7( var_13, "typing_abort_codes" );
        var_13 _id_A5A4::lerp_player_view_to_tag_smoothly( "tag_player", 0.5, 1, 0, 0, 0, 0 );
        var_13 _meth_8055();
        level._id_0318 _meth_809C( "scn_enter_code_typing" );
        var_7 thread _id_A510::_id_0C24( var_13, "typing_abort_codes" );
        level._id_0318 startprogressbar( var_5 );
        level._id_0318.progresstext _meth_80CC( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
        var_14 = 0;
        level thread h1_typing_dof_start();

        for (;;)
        {
            if ( !level._id_0318 _meth_8339() )
                break;

            var_4 += var_3;
            level._id_0318 setprogressbarprogress( var_4 / var_5 );

            if ( var_4 >= var_5 )
            {
                var_14 = 1;
                break;
            }

            wait(var_3);
        }

        level thread h1_typing_dof_stop();
        level._id_0318 endprogressbar();
        level._id_0318 _meth_80AE( "scn_enter_code_typing" );
        level._id_0318 _meth_8326( 0 );
        level._id_0318 _meth_831B();
        var_13 _meth_8056();
        _id_A5A4::_id_5695( var_8, var_9, 0.5, 1, 0, 0, 0, 0 );
        var_13 delete();
        level._id_0318 _meth_811B( 1 );
        level._id_0318 _meth_811C( 1 );
        level._id_0318 _meth_811D( 1 );

        if ( var_14 )
            break;

        waittillframeend;
    }

    level._id_0318 _meth_809C( "h1_scn_enter_press" );
    _id_A5E8::_id_870C( "start_missile_stopped_mix" );
    var_0 delete();
    var_6 delete();
    common_scripts\utility::_id_383F( "codes_uploaded" );
    common_scripts\utility::_id_3831( "aa_countdown_started" );
    common_scripts\utility::_id_3831( "aa_upload_them_codes" );
    _id_A5A4::_id_1143( "Codes have been uploaded" );
    _id_A5A4::arcademode_checkpoint( 4, "e" );
}

upload_codes()
{
    var_0 = getent( "keyboard_use_trigger", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    _id_A5A4::_id_A066( "control_room" );
    var_1 = 0.05;
    var_2 = 0;
    var_3 = 3;
    var_0 common_scripts\utility::_id_97CE();
    var_0 _meth_80DD( &"LAUNCHFACILITY_B_HINT_UPLOAD_CODES" );
    var_0 _meth_817F();
    var_4 = spawn( "script_model", level.keyboard._id_02E2 );
    var_4.angles = ( 0, 315, 0 );
    var_4 _meth_80B3( "com_computer_keyboard_obj" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level._id_0318 _meth_831A();
        level._id_0318 _meth_8326( 1 );
        level._id_0318 _meth_809C( "scn_enter_code_typing" );
        var_0 common_scripts\utility::_id_97CC();
        level._id_0318 startprogressbar( var_3 );
        level._id_0318.progresstext _meth_80CC( &"LAUNCHFACILITY_B_UPLOADING_CODES" );
        var_5 = 0;

        for (;;)
        {
            if ( !level._id_0318 _meth_8339() )
                break;

            var_2 += var_1;
            level._id_0318 setprogressbarprogress( var_2 / var_3 );

            if ( var_2 >= var_3 )
            {
                var_5 = 1;
                break;
            }

            wait(var_1);
        }

        level._id_0318 endprogressbar();

        if ( var_5 )
            break;

        level._id_0318 _meth_80AE( "scn_enter_code_typing" );
        var_0 common_scripts\utility::_id_97CE();
        level._id_0318 _meth_8326( 0 );
        level._id_0318 _meth_831B();
    }

    level._id_0318 _meth_831B();
    level._id_0318 _meth_8326( 0 );
    level._id_0318 _meth_80AE( "scn_enter_code_typing" );
    level._id_0318 _meth_809C( "h1_scn_enter_press" );
    _id_A5E8::_id_870C( "start_missile_stopped_mix" );
    var_0 delete();
    var_4 delete();
    var_6 = spawn( "script_model", level.keyboard._id_02E2 );
    var_6.angles = ( 0, 315, 0 );
    var_6 _meth_80B3( "com_computer_keyboard" );
    common_scripts\utility::_id_383F( "codes_uploaded" );
    common_scripts\utility::_id_3831( "aa_countdown_started" );
    common_scripts\utility::_id_3831( "aa_upload_them_codes" );
    _id_A5A4::_id_1143( "Codes have been uploaded" );
    _id_A5A4::arcademode_checkpoint( 4, "e" );
}

startprogressbar( var_0 )
{
    self.progresstext = createsecondaryprogressbartext();
    self.progressbar = createsecondaryprogressbar();
}

setprogressbarprogress( var_0 )
{
    if ( var_0 > 1 )
        var_0 = 1;

    self.progressbar _id_A546::_id_9AF7( var_0 );
}

endprogressbar()
{
    self notify( "progress_bar_ended" );
    self.progresstext _id_A546::_id_28E9();
    self.progressbar _id_A546::_id_28E9();
}

createsecondaryprogressbar()
{
    var_0 = _id_A546::h1_createbar( level.secondaryprogressbarx, level.secondaryprogressbary, 114, 14, "h1_hud_upload_codes_border", "h1_hud_upload_codes_blur", "white" );
    var_0 _id_A546::_id_7FEE( "CENTER", undefined, 0, level.secondaryprogressbary );
    return var_0;
}

createsecondaryprogressbartext()
{
    var_0 = _id_A546::_id_2401( "objective", level.secondaryprogressbarfontsize );
    var_0 _id_A546::_id_7FEE( "CENTER", undefined, 0, level.secondaryprogressbartexty );
    return var_0;
}

control_room_dialogue()
{
    common_scripts\utility::_id_384A( "codes_uploaded" );
    level thread show_triggers( "escape" );
    thread telemetry_doors_open();
    thread escape_doors_open();
    thread grigsby_warning();
    thread delete_controlroom_friendlies();
    _id_A5A4::_id_70BD( "hqr_confirm" );
    wait 2;
    _id_A5A4::_id_70BD( "hqr_standby" );
    wait 1;
    common_scripts\utility::_id_383F( "successful_confirmation" );
    _id_A5A4::_id_70BD( "hqr_confdest" );
    common_scripts\utility::_id_383F( "zakhaev_leaving" );
    _id_A5A4::_id_70BD( "checkfeed2" );
    _id_A5A4::_id_70BD( "sendcoordinates" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "vehicledepot" );
    thread follow_price();
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "pri_outtahere" );
    common_scripts\utility::_id_383F( "aa_follow_price_end_level" );
    _id_A5A4::_id_70BD( "exfilfromarea" );
}

control_room_noradscreen()
{
    common_scripts\utility::_id_384A( "change_films" );
    var_0 = getent( "noradscreen", "targetname" );
    var_0 delete();
}

control_room_bigscreen()
{
    common_scripts\utility::_id_384A( "zakhaev_leaving" );
    common_scripts\utility::_id_383F( "change_films" );
    _func_0D6( "cg_cinematicFullScreen", "0" );
    _func_059( "zakhaev_escape" );
}

control_room_screen_h1()
{
    var_0 = getent( "display_name_sfx", "targetname" );
    var_1 = getent( "noradscreen", "targetname" );
    var_1 delete();
    level waittill( "wall_c4_planted" );
    _func_0D6( "cg_cinematicFullScreen", "0" );
    _func_05B( "h1_icbm_norad_screen" );
    common_scripts\utility::_id_384A( "codes_uploaded" );
    _func_05B( "h1_icbm_norad_screen_abort" );
    common_scripts\utility::_id_384A( "zakhaev_leaving" );
    common_scripts\utility::_id_383F( "change_films" );
    _func_059( "zakhaev_escape" );
    var_0 _id_A5A4::_id_69C4( "h1_Inchb_display_on" );
    _id_A5A4::_id_27EF( 8.5, ::play_display_change_sfx );
    _id_A5A4::_id_27EF( 13.75, ::play_display_change_sfx );
    _id_A5A4::_id_27EF( 24.25, ::play_display_change_sfx );
    _id_A5A4::_id_27EF( 28.25, ::play_display_change_sfx );

    while ( _func_05D() )
        wait 0.05;

    _func_05B( "h1_icbm_norad_screen_abort" );
    var_0 _id_A5A4::_id_69C4( "h1_Inchb_display_off" );
}

play_display_change_sfx()
{
    var_0 = getent( "display_name_sfx", "targetname" );
    var_0 _id_A5A4::_id_69C4( "h1_Inchb_display_on" );
}

update_keyboard_monitor_screen( var_0, var_1 )
{
    level endon( "stop_update_monitor_material" );

    if ( isdefined( var_1 ) )
        level endon( var_1 );

    level waittill( "wall_c4_planted" );
    var_2 = getent( var_0, "targetname" );
    var_3 = 0;
    var_4 = [];

    switch ( var_0 )
    {
        case "monitor_8":
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_1";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_2";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_3";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor8_4";
            break;
        case "monitor_9":
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_1";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_2";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_3";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_4";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_5";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_6";
            var_4[var_4.size] = "mtl_h1_mwr_ch_icbm_consolemonitor9_7";
            break;
    }

    for (;;)
    {
        var_2 _meth_8468( "mtl_h1_mwr_ch_icbm_consolemonitor5", var_4[var_3] );
        var_3++;

        if ( var_3 == var_4.size )
            var_3 = 0;

        waittillframeend;
    }
}

telemetry_doors_open()
{
    var_0 = getent( "open_telemetry_door", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "telemetry_room_door", "targetname" );
    var_1 _meth_82B3( -70, 1, 1, 0 );
    var_1 _meth_809C( "gate_open" );
    var_1 _meth_805A();
}

escape_doors_open()
{
    var_0 = getent( "open_escape_door", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getent( "escape_door_right", "targetname" );
    var_2 = getent( var_1._id_04A4, "targetname" );
    var_1 _meth_82AA( var_2._id_02E2, 3, 1, 2 );
    var_1 _meth_805A();
}

follow_price()
{
    _id_A5E8::_id_870C( "start_escape_facility_mix" );
    _id_A5A4::_id_070A( "escape" );
    level thread obj_follow_price();
    _id_A5A4::_id_1143( "let's get out of here" );
    _id_A5A4::_id_A066( "hallway_escape" );
    _id_A5A4::_id_070A( "escape_hallway" );
}

grigsby_warning()
{
    var_0 = getent( "incoming_enemy", "script_noteworthy" );
    var_0 waittill( "spawned" );
    wait 1;
    level.grigsby _id_A510::_id_0C21( level.grigsby, "grg_company" );
}

delete_controlroom_friendlies()
{
    var_0 = getent( "delete_team2", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "delete_team2" );
}

_id_3029()
{
    if ( level._id_8C36 != "elevator" )
        _id_A5A4::_id_A066( "elevator" );
    else
        wait 1;

    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "pri_movemove" );
    level.anim_ent = getent( "tunnel_animent", "targetname" );

    if ( getdvarint( "use_old_elevator" ) == 1 )
    {
        level._id_6F7C thread ai_to_elevator( "r" );
        level.grigsby thread ai_to_elevator( "o" );
        level._id_0318 in_the_elevator();
    }
    else
    {
        level.anim_ent = common_scripts\utility::_id_8959();
        level.anim_ent._id_02E2 = ( -1145, 5781, -390 );
        level._id_6F7C thread price_to_elevator( "r" );
        level.grigsby thread griggs_to_elevator( "o" );
        level._id_0318 check_elevator();
    }

    level thread _id_3055();
    var_0 = getent( "elevator", "targetname" );
    level.anim_ent _meth_804F( var_0 );
}

elevator_player_clip()
{
    var_0 = getent( "elevator_player_clip", "targetname" );
    var_0 _meth_82BB();
    common_scripts\utility::_id_384A( "elevator_player_clip_on" );
    var_0 _meth_82BA();
}

price_to_elevator( var_0 )
{
    wait 2;
    level.anim_ent _id_A510::_id_0BFF( self, "h1_elevator_run_to_idle1" );
    level.anim_ent _id_A510::_id_0C24( self, "h1_elevator_run_to_idle1" );

    if ( !common_scripts\utility::_id_382E( "player_in_elevator" ) )
        level.anim_ent thread _id_A510::_id_0BE1( self, "h1_elevator_idle1", undefined, "stop_price_idle1" );

    common_scripts\utility::_id_384A( "player_in_elevator" );
    level.anim_ent notify( "stop_price_idle1" );
    level.anim_ent _id_A510::_id_0C24( self, "h1_elevator_runin" );
    level.anim_ent _id_A510::_id_0C24( self, "h1_elevator_entering" );
    level.anim_ent thread _id_A510::_id_0BE1( self, "h1_elevator_idle2", undefined, "stop_price_idle2" );
    common_scripts\utility::_id_384A( "all_in_elevator" );
    self _meth_804F( level.anim_ent );
    common_scripts\utility::_id_384A( "elevator_dialogue" );
    level.anim_ent notify( "stop_price_idle2" );
    level.anim_ent thread _id_A510::_id_0C24( self, "h1_elevator_elevator" );
    var_1 = getent( "elevator_top", "targetname" );
    var_1 waittill( "trigger" );
    wait 2;
    self _meth_8051( level.anim_ent );
    level.anim_ent _id_A510::_id_0C24( self, "h1_elevator_runout" );
    _id_A5A4::_id_7E38( var_0 );
}

griggs_to_elevator( var_0 )
{
    level.anim_ent _id_A510::_id_0BFF( self, "h1_elevator_runin" );
    level.anim_ent _id_A510::_id_0C24( self, "h1_elevator_runin" );
    level.anim_ent thread _id_A510::_id_0BE1( self, "h1_elevator_idle1", undefined, "stop_griggs_idle1" );
    common_scripts\utility::_id_384A( "all_in_elevator" );
    level.anim_ent notify( "stop_griggs_idle1" );
    level.anim_ent thread _id_A510::_id_0BE1( self, "h1_elevator_idle2", undefined, "stop_griggs_idle2" );
    self _meth_804F( level.anim_ent );
    common_scripts\utility::_id_384A( "elevator_dialogue" );
    level.anim_ent notify( "stop_griggs_idle2" );
    level.anim_ent thread _id_A510::_id_0C24( self, "h1_elevator_elevator" );
    var_1 = getent( "elevator_top", "targetname" );
    var_1 waittill( "trigger" );
    wait 2.5;
    self _meth_8051( level.anim_ent );
    level.anim_ent _id_A510::_id_0C24( self, "h1_elevator_runout" );
    _id_A5A4::_id_7E38( var_0 );
}

check_elevator()
{
    var_0 = getent( "standing_in_elevator", "targetname" );

    for (;;)
    {
        wait 0.05;

        if ( level._id_0318 _meth_80AB( var_0 ) )
        {
            if ( !common_scripts\utility::_id_382E( "player_in_elevator" ) )
                common_scripts\utility::_id_383F( "player_in_elevator" );
        }
        else if ( common_scripts\utility::_id_382E( "player_in_elevator" ) )
            common_scripts\utility::_id_3831( "player_in_elevator" );

        if ( level._id_0318 _meth_80AB( var_0 ) && level._id_6F7C _meth_80AB( var_0 ) && level.grigsby _meth_80AB( var_0 ) )
        {
            common_scripts\utility::_id_383F( "all_in_elevator" );
            return;
        }
    }
}

ai_to_elevator( var_0 )
{
    level.anim_ent _id_A510::_id_0BFF( self, "elevator_runin" );
    level.anim_ent _id_A510::_id_0C24( self, "elevator_runin" );
    level.anim_ent thread _id_A510::_id_0BE1( self, "elevator_idle", undefined, "stop_idle" );
    self _meth_804F( level.anim_ent );
    var_1 = getent( "elevator_top", "targetname" );
    var_1 waittill( "trigger" );
    wait 2;
    self _meth_8051( level.anim_ent );
    level.anim_ent notify( "stop_idle" );
    level.anim_ent _id_A510::_id_0C24( self, "elevator_runout" );
    _id_A5A4::_id_7E38( var_0 );
}

in_the_elevator()
{
    var_0 = getent( "standing_in_elevator", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( level._id_6F7C _meth_80AB( var_0 ) && level.grigsby _meth_80AB( var_0 ) )
            return;
    }
}

linkto_elevator( var_0 )
{
    self _meth_804F( var_0 );
}

_id_3055()
{
    common_scripts\utility::_id_383F( "elevator_player_clip_on" );
    var_0 = getent( "elevator", "targetname" );
    var_1 = getentarray( "elevator_lights", "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::linkto_elevator, var_0 );
    var_2 = getentarray( "elevator_detail", "targetname" );
    common_scripts\utility::_id_0D13( var_2, ::linkto_elevator, var_0 );
    level.elevator_door_inner_top = getent( "elevator_door_inner_top", "targetname" );
    level.elevator_door_inner_top _meth_804F( var_0 );
    level.elevator_door_inner_bottom = getent( "elevator_door_inner_bottom", "targetname" );
    var_3 = getent( "elevator_door_inner_bottom", "targetname" );
    var_3 _meth_82AD( -102, 2, 1, 1 );
    var_3 _meth_809C( "scn_elevator_door_close" );
    var_3 _id_A5A4::_id_69C4( "scn_launchb_elevator_sequence" );
    var_3 waittill( "movedone" );
    level.elevator_door_inner_bottom _meth_804F( var_0 );
    var_4 = getent( "elevator_door_outside1_bottom", "targetname" );
    var_5 = getent( var_4._id_04A4, "targetname" );
    var_4 _meth_82AA( var_5._id_02E2, 2, 1, 1 );
    var_6 = getent( "elevator_door_outside2_bottom", "targetname" );
    var_5 = getent( var_6._id_04A4, "targetname" );
    var_6 _meth_82AA( var_5._id_02E2, 2, 1, 1 );
    var_4 waittill( "movedone" );
    var_0 _meth_82AA( level.elevator_upper._id_02E2, 15, 0.5, 0.1 );
    var_0 _meth_809C( "scn_elevator_move" );
    common_scripts\utility::_id_383F( "elevator_dialogue" );
    var_0 waittill( "movedone" );
    _id_A5A4::_id_1143( "On our way" );
    _id_A5A4::arcademode_checkpoint( 3, "f" );
    level.elevator_door_inner_top = getent( "elevator_door_inner_top", "targetname" );
    level.elevator_door_inner_top _meth_8051( var_0 );
    level.elevator_door_inner_top = getent( "elevator_door_inner_top", "targetname" );
    var_7 = getent( "elevator_door_inner_top", "targetname" );
    var_7 _meth_82AD( 102, 2, 1, 1 );
    var_7 _meth_805A();
    var_7 _meth_809C( "scn_elevator_door_open" );
    var_7 waittill( "movedone" );
    var_8 = getent( "elevator_door_outside1_top", "targetname" );
    var_5 = getent( var_8._id_04A4, "targetname" );
    var_8 _meth_82AA( var_5._id_02E2, 2, 1, 1 );
    var_8 _meth_805A();
    var_9 = getent( "elevator_door_outside2_top", "targetname" );
    var_5 = getent( var_9._id_04A4, "targetname" );
    var_9 _meth_82AA( var_5._id_02E2, 2, 1, 1 );
    var_9 _meth_805A();
}

elevator_dialogue()
{
    common_scripts\utility::_id_384A( "elevator_dialogue" );
    var_0 = getent( "the_gaz_man", "script_noteworthy" );
    var_0 _id_A5A4::_id_0798( ::protect_gaz );

    if ( getdvarint( "use_old_elevator" ) == 1 )
    {
        wait 1.5;
        _id_A5A4::_id_70BD( "takinfire" );
        _id_A5A4::_id_70BD( "upthelift" );
        wait 1;
        level.grigsby _id_A510::_id_0C21( level.grigsby, "grg_ashot" );
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "pri_getinline" );
    }
}

protect_gaz()
{
    thread _id_A5A4::_id_58D7();
}

vehical_depot()
{
    _id_A5A4::_id_A066( "garage" );
    common_scripts\utility::_id_383F( "at_the_jeep" );
    wait 1.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "letsgo" );
    level.grigsby _id_A510::_id_0C21( level.grigsby, "grg_move" );
    common_scripts\utility::_id_383F( "level_end" );
    common_scripts\utility::_id_3831( "aa_follow_price_end_level" );
    _id_A5A4::arcademode_checkpoint( 2, "g" );
}

end_of_level()
{
    common_scripts\utility::_id_384A( "level_end" );
    _id_A5A4::_id_60D6();
}

compass_maps()
{
    var_0 = getent( "compass_map_upper", "targetname" );
    var_1 = getent( "compass_map_lower", "targetname" );
    var_0 thread map_change( "compass_map_launchfacility_b" );
    var_1 thread map_change( "compass_map_launchfacility_b_2" );
}

map_change( var_0 )
{
    for (;;)
    {
        self waittill( "trigger" );
        _id_A51D::_id_8324( var_0 );
    }
}
#using_animtree("animated_props");

airduct_fan_large()
{
    var_0 = getent( "airduct_fan_large", "targetname" );
    var_0 _meth_8117( #animtree );
    var_0 _meth_814D( %icbm_turbofan176_spin, 1, 0.1, 1 );
}

airduct_fan_medium()
{
    var_0 = getentarray( "airduct_fan_medium", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::medium_fans_think );
}

medium_fans_think()
{
    self _meth_8117( #animtree );
    self _meth_814D( %icbm_turbofan64_spin, 1, 0.1, 1.5 );
}

airduct_fan_small()
{
    var_0 = getentarray( "airduct_fan_small", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::small_fans_think );
}

small_fans_think()
{
    self _meth_8117( #animtree );
    self _meth_814D( %icbm_turbofan50_spin, 1, 0.1, 1 );
}

redlights()
{
    var_0 = getentarray( "redlight", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::redlights_think );
}

redlights_think()
{
    var_0 = 5000;

    for (;;)
    {
        self _meth_82B9( ( 0, 360, 0 ), var_0 );
        wait(var_0);
    }
}

redlight_spinner()
{
    var_0 = getentarray( "horizonal_spinner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::horizonal_spinners_think );
}

horizonal_spinners_think()
{
    self _meth_8117( #animtree );
    self _meth_814D( %launchfacility_b_emergencylight, 1, 0.1, 1.0 );
}

wall_lights()
{
    var_0 = getentarray( "wall_light", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::wall_lights_think );
}

wall_lights_think()
{
    var_0 = 5000;

    for (;;)
    {
        self _meth_82B9( ( 360, 0, 0 ), var_0 );
        wait(var_0);
    }
}

wall_light_spinner()
{
    var_0 = getentarray( "vertical_spinner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::vertical_spinners_think );
}

vertical_spinners_think()
{
    self _meth_8117( #animtree );
    self _meth_814D( %launchfacility_b_emergencylight, 1, 0.1, 1.0 );
}

_id_5FFB()
{
    wait 0.1;
    thread music_vents();
    common_scripts\utility::_id_384A( "music_start_countdown" );
    _func_076( 5 );
    wait 5.15;
    thread music_countdown( level._id_3BFE );
    common_scripts\utility::_id_384A( "codes_uploaded" );
    _func_076( 8 );
    wait 8.1;
    common_scripts\utility::_id_384A( "successful_confirmation" );
    _id_A5A4::_id_6008( "launch_b_victory_music" );
    wait 19;
    _func_076( 1 );
    wait 1.1;

    for (;;)
    {
        _id_A5A4::_id_6008( "tension_maintheme_groove" );
        wait 46;
        _func_076( 1 );
        wait 1.1;
    }
}

music_vents()
{
    level endon( "music_start_countdown" );

    for (;;)
    {
        _id_A5A4::_id_6008( "tension_maintheme_groove" );
        wait 46;
        _func_076( 1 );
        wait 1.1;
    }
}

music_countdown( var_0 )
{
    level endon( "codes_uploaded" );

    if ( var_0 == 0 )
    {
        for ( var_1 = 0; var_1 < 2; var_1++ )
        {
            _id_A5A4::_id_6008( "launch_b_count_01" );
            wait 36;
            _func_076( 1 );
            wait 1.1;
            _id_A5A4::_id_6008( "launch_b_count_02" );
            wait 94;
            _func_076( 1 );
            wait 1.1;
            _id_A5A4::_id_6008( "launch_b_count_03" );
            wait 140;
            _func_076( 3 );
            wait 3.1;
            _id_A5A4::_id_6008( "launch_b_count_04" );
            wait 54;
            _func_076( 0.1 );
            wait 0.15;
        }

        _id_A5A4::_id_6008( "launch_b_count_01" );
        wait 36;
        _func_076( 1 );
        wait 1.1;
        _id_A5A4::_id_6008( "launch_b_count_05" );
        wait 192;
        _func_076( 4 );
        wait 4.1;
    }
    else if ( var_0 == 1 || var_0 == 2 )
    {
        _id_A5A4::_id_6008( "launch_b_count_01" );
        wait 36;
        _func_076( 1 );
        wait 1.1;
        _id_A5A4::_id_6008( "launch_b_count_02" );
        wait 92;
        _func_076( 2 );
        wait 2.1;
        _id_A5A4::_id_6008( "launch_b_count_03" );
        wait 138;
        _func_076( 3 );
        wait 3.1;
        _id_A5A4::_id_6008( "launch_b_count_04" );
        wait 54;
        _func_076( 0.1 );
        wait 0.15;
        _id_A5A4::_id_6008( "launch_b_count_01" );
        wait 36;
        _func_076( 1 );
        wait 1.1;
        _id_A5A4::_id_6008( "launch_b_count_02" );
        wait 92;
        _func_076( 2 );
        wait 2.1;
        _id_A5A4::_id_6008( "launch_b_count_05" );
        wait 192;
        _func_076( 4 );
        wait 4.1;
    }
    else if ( var_0 == 3 )
    {
        wait 13;
        _id_A5A4::_id_6008( "launch_b_count_01" );
        wait 36;
        _func_076( 1 );
        wait 1.1;
        _id_A5A4::_id_6008( "launch_b_count_02" );
        wait 94;
        _func_076( 2 );
        wait 2.1;
        _id_A5A4::_id_6008( "launch_b_count_03" );
        wait 140;
        _func_076( 3 );
        wait 3.1;
        _id_A5A4::_id_6008( "launch_b_count_04" );
        wait 54;
        _func_076( 0.1 );
        wait 0.15;
        _id_A5A4::_id_6008( "launch_b_count_05" );
        wait 194;
        _func_076( 2 );
        wait 2.1;
    }
}

hide_triggers( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] common_scripts\utility::_id_97CC();
}

show_triggers( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] common_scripts\utility::_id_97CE();
}

keep_price_griggs_distance_hallway_after_staircase()
{
    getent( "kill_yellow_allied", "targetname" ) waittill( "trigger" );
    var_0 = [ level._id_6F7C, level.grigsby ];
    level thread _id_A5A4::keep_distance( var_0 );
    getent( "trigger_big_blast_door", "targetname" ) waittill( "trigger" );
    level thread _id_A5A4::stop_keep_distance( var_0 );
}

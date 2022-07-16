// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\armada_precache::main();
    maps\armada_fx::main();
    _id_A550::main();
    maps\createfx\armada_audio::main();
    maps\armada_anim::anim_main();
    thread maps\armada_amb::main();
    maps\createart\armada_art::main();
    maps\armada_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    _id_A632::setmig29fxoverride( "contrail", "fx/smoke/jet_contrail_airlift" );
    _id_A632::setmig29fxoverride( "contrail_02", "fx/smoke/jet_contrail_airlift" );

    if ( getdvar( "min_spec_ai" ) == "1" )
    {
        var_0 = getentarray( "drone_delete_on_unload", "script_noteworthy" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] delete();
    }

    _id_A5A4::_id_278B( ::ride_start );
    _id_A5A4::_id_079C( "ride", ::ride_start, &"STARTS_RIDE" );
    _id_A5A4::_id_079C( "landed", ::landed_start, &"STARTS_LANDED" );
    _id_A5A4::_id_079C( "hq2tv", ::hq2tv_start, &"STARTS_HQ2TV" );
    _id_A5A4::_id_079C( "intel", ::_id_4E9A, &"STARTS_INTEL" );
    _id_A5A4::_id_079C( "tv", ::tv_start, &"STARTS_TV" );
    _id_A5A4::_id_079C( "tank", ::tank_start, &"STARTS_TANK" );
    _id_A5A4::_id_079C( "end", ::end_start, &"STARTS_END" );
    precachemodel( "vb_generic_s1" );
    precachemodel( "vehicle_blackhawk_hero_sas_night_interior" );
    precachemodel( "h1_mwr_com_widescreen_monitor_des" );
    precachemodel( "h1_mwr_com_widescreen_monitor_2_des" );
    precachemodel( "h1_mwr_com_widescreen_monitor_3_des" );
    precachemodel( "com_widescreen_monitor_on_1_des" );
    precachemodel( "com_widescreen_monitor_on_2_des" );
    precachemodel( "com_widescreen_monitor_on_3_des" );
    precachemodel( "com_computer_monitor_d" );
    precachemodel( "me_news_ticker_video_screen" );
    precachemodel( "me_news_ticker_video_screen_des" );
    precachemodel( "me_news_ticker_video_screen_des2" );
    precachemodel( "com_widescreen_monitor_on_1_des_scaled" );
    precachemodel( "com_widescreen_monitor_on_2_des_scaled" );
    precachemodel( "btr_tv_smart_wall_02_sml_des01" );
    precachemodel( "btr_tv_smart_wall_02_sml_des02" );
    precacheturret( "heli_minigun_noai" );
    precachemodel( "weapon_saw_MG_setup" );
    precachemodel( "weapon_winchest1200" );
    precachemodel( "vehicle_pickup_rear_tailgate" );
    precachestring( &"ARMADA_INTRO" );
    precachestring( &"ARMADA_DATE" );
    precachestring( &"ARMADA_PLACE" );
    precachestring( &"ARMADA_INFO" );
    precachestring( &"ARMADA_HINT_FLASH" );
    precachestring( &"ARMADA_GET_INTO_POSITION_TO" );
    precachestring( &"ARMADA_SEARCH_THE_HQ_BUILDING" );
    precachestring( &"ARMADA_REGROUP_WITH_FIRST_SQUAD" );
    precachestring( &"ARMADA_MAKE_YOUR_WAY_TO_THE" );
    precachestring( &"ARMADA_MAKE_YOUR_WAY_TO_THE1" );
    precachestring( &"ARMADA_SEARCH_THE_TV_STATION" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachemodel( "body_usmc_desert_assault_zack" );
    _id_A52C::init();
    level.override_breach_explosive_left_audio = 1;
    level.breach_play_door_animation = 1;
    maps\_breach_hinges_left_armada::main();
    maps\_breach_explosive_left::main();
    _id_A516::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_ak74u_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_dragunov_clip";
    level.weaponclipmodels[4] = "weapon_saw_clip";
    level.override_blackhawk_unload_audio = 1;
    level.mig29_near_distance_override = 11880;
    maps\armada_precache::main();
    maps\armada_fx::main();
    thread common_scripts\_pipes::main();
    _id_A550::main();
    maps\createfx\armada_audio::main();
    maps\armada_anim::anim_main();
    maps\createart\armada_art::main();
    maps\armada_lighting::main();
    maps\armada_aud::main();
    _id_A51D::_id_8324( "compass_map_armada" );
    thread maps\armada_amb::main();
    level.mortar_min_dist = 500;
    level thread maps\_mortar::bog_style_mortar();
    level.nomaxmortardist = 1;
    level._id_78BA["mortar"]["incomming"] = "mortar_incoming";
    level._id_78BA["mortar"]["dirt"] = "mortar_explosion_dirt";
    level._id_78BA["mortar"]["mud"] = "mortar_explosion_water";
    level._id_058F["mortar"]["dirt"] = loadfx( "fx/explosions/grenadeExp_dirt" );
    level.heli_delay = [ 1.2, 0.6, 2, 0, 5, 3.5, 1.8, 2.5, 0.7, 0.5, 1.5, 0, 2.8 ];
    maps\createart\armada_art::main();

    if ( getdvar( "tv_helper" ) == "" )
        setdvar( "tv_helper", "off" );

    common_scripts\utility::_id_383D( "player_has_flashed" );
    common_scripts\utility::_id_383D( "return_fire" );
    common_scripts\utility::_id_383D( "kill_rpgs" );
    common_scripts\utility::_id_383D( "start_first_obj" );
    common_scripts\utility::_id_383D( "slam_zoom_done" );
    common_scripts\utility::_id_383D( "hq_entered" );
    common_scripts\utility::_id_383D( "end_water" );
    common_scripts\utility::_id_383D( "snipefromheli" );
    common_scripts\utility::_id_383D( "entered_atrium" );
    common_scripts\utility::_id_383D( "breach_ready_flag" );
    common_scripts\utility::_id_383D( "in_tv_station_lighting_zone_1" );
    common_scripts\utility::_id_383D( "in_tv_station_lighting_zone_2" );
    common_scripts\utility::_id_383D( "aa_hq_fight" );
    common_scripts\utility::_id_383D( "aa_street_fight" );
    common_scripts\utility::_id_383D( "aa_tv_fight" );
    common_scripts\utility::_id_383D( "end_grg_ready" );
    common_scripts\utility::_id_383D( "end_vaz_ready" );
    common_scripts\utility::_id_0D13( _func_1ED( "plane_sound", "script_noteworthy" ), _id_A632::_id_6877 );
    thread maps\armada_code::init_heli_turrets();
    thread razor_wire_setup();
    thread razor_wire_collision();
    thread hq_breach();
    thread tv_breach();
    thread _id_6302();
    thread hq_entered_wait();
    thread hq_finished();
    thread on_ground();
    thread barbed_wire_dialog();
    thread on_me_to_building();
    thread kill_rooftop_ignore_groups();
    thread achieve_tvs();
    thread armada_shadowlightbyzone();
    thread tv_station_reset_friendlyfire();
    createthreatbiasgroup( "left_rooftop_enemies" );
    createthreatbiasgroup( "right_rooftop_enemies" );
    createthreatbiasgroup( "players_group" );
    level._id_0318 _meth_817B( "players_group" );
    _id_A5A4::_id_4BB3( "left_rooftop_enemies", "players_group" );
    _id_A5A4::_id_4BB3( "right_rooftop_enemies", "players_group" );
    var_2 = getentarray( "final_breach_right", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, ::final_breacher_right_think );
    var_3 = getentarray( "final_breach_shotgun", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_0798, ::final_breacher_shotgun_think );
    var_4 = getentarray( "price", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, ::price_think );
    common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_0798, ::set_threatbias_group, "players_group" );
    var_5 = getentarray( "breacher", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_0798, ::_id_17BA );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_0798, ::set_threatbias_group, "players_group" );
    var_6 = getentarray( "hq_breachers", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_6, _id_A5A4::_id_0798, ::hq_breachers_think );
    var_7 = getentarray( "ride_in_sniper", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, ::hq_breachers_think );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, ::ride_in_sniper_think );
    common_scripts\utility::_id_0D13( var_7, _id_A5A4::_id_0798, ::immortal_rope_guy );
    var_8 = getentarray( "left_rooftop_enemies", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_8, _id_A5A4::_id_0798, ::set_threatbias_group, "left_rooftop_enemies" );
    var_9 = getentarray( "right_rooftop_enemies", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_9, _id_A5A4::_id_0798, ::set_threatbias_group, "right_rooftop_enemies" );
    var_10 = getent( "right_rooftop_enemies_d_trigger", "targetname" );
    var_10 thread player_breaks_ignore( "right_rooftop_enemies" );
    var_11 = getent( "left_rooftop_enemies_d_trigger", "targetname" );
    var_11 thread player_breaks_ignore( "left_rooftop_enemies" );
    thread maps\_wibble::setup_wibble_triggers( 1, "on_ground", "exterior", 1, 0 );
    var_12 = getent( "audio_set_ambiance_3", "targetname" );
    var_12 thread set_ambiance_level_03();
    var_13 = getent( "start_phone_ring", "targetname" );
    var_13 thread start_phone_call();
    var_14 = getentarray( "magic_grenade_trigger", "targetname" );
    common_scripts\utility::_id_0D13( var_14, ::magic_grenade_trigger_think );
    var_15 = getentarray( "purple_2_red", "targetname" );
    common_scripts\utility::_id_0D13( var_15, ::purple_2_red );
    var_16 = getentarray( "reinforcements_trigger", "targetname" );
    common_scripts\utility::_id_0D13( var_16, ::reinforcements_think );
    thread one_red_to_orange();
    var_17 = getentarray( "kill_enemies", "targetname" );
    common_scripts\utility::_id_0D13( var_17, ::_id_5308 );
    var_18 = getentarray( "turret_target", "targetname" );
    common_scripts\utility::_id_0D13( var_18, ::tank_turret_target_think );
    var_19 = getentarray( "fallingpainting", "targetname" );
    common_scripts\utility::_id_0D13( var_19, ::damage_on );
    var_20 = getentarray( "streets_start_spawners", "targetname" );

    foreach ( var_22 in var_20 )
        var_22 _id_A5A4::_id_0798( ::set_model_function, "body_usmc_desert_assault_zack" );

    thread get_tv_breacher();
    thread friendlies_coming_out();
    thread final_breach();
    var_24 = getentarray( "second_wave_counters", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_24, _id_A5A4::_id_0798, ::second_wave_counters );
    level.second_wave_count = 0;
    level.hint_text_size = 1.6;
    thread maps\armada_code::flag_on_flash();

    if ( !_id_A5A4::_id_0CC3() )
        thread maps\armada_code::flashbang_hint();

    var_25 = getentarray( "flickering_lights", "targetname" );

    for ( var_1 = 0; var_1 < var_25.size; var_1++ )
        var_25[var_1] thread _id_A54F::_id_38D9( 0.2, 0.6 );

    var_26 = getentarray( "griggs", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_26, _id_A5A4::_id_0798, ::griggs_think );
    common_scripts\utility::_id_0D13( getentarray( "monitor_destruct1", "targetname" ), ::monitor_destruct );
    common_scripts\utility::_id_0D13( getentarray( "monitor_destruct2", "targetname" ), ::monitor_destruct2 );
    common_scripts\utility::_id_0D13( getentarray( "monitor_destruct3", "targetname" ), ::monitor_destruct3 );
    common_scripts\utility::_id_0D13( getentarray( "monitor_on_destruct", "targetname" ), ::monitor_destruct_on );
    common_scripts\utility::_id_0D13( getentarray( "monitor_on_destruct2", "targetname" ), ::monitor_destruct_on_2 );
    common_scripts\utility::_id_0D13( getentarray( "monitor_on_destruct3", "targetname" ), ::monitor_destruct_on_3 );
    common_scripts\utility::_id_0D13( getentarray( "computer_des", "targetname" ), ::computer_destruct );
    common_scripts\utility::_id_0D13( getentarray( "news_des", "targetname" ), ::tv_news_destruct );
    common_scripts\utility::_id_0D13( getentarray( "monitor_destruct_scaled", "targetname" ), ::monitor_destruct_scaled );
    common_scripts\utility::_id_0D13( getentarray( "monitor_on_destruct_scaled", "targetname" ), ::monitor_destruct_scaled );
    common_scripts\utility::_id_0D13( getentarray( "monitor_on_destruct_scaled2", "targetname" ), ::monitor_destruct_on_scaled2 );
    common_scripts\utility::_id_0D13( getentarray( "tv_wall", "targetname" ), ::tv_wall );
    common_scripts\utility::_id_383D( "near_tv" );
    common_scripts\utility::_id_0D13( getentarray( "near_tv", "targetname" ), maps\armada_code::near_tv );
    thread maps\armada_code::movies_on_tvs();
    level.recordings = getentarray( "asad_sound", "script_noteworthy" );
    common_scripts\utility::_id_0D13( level.recordings, ::ambient_asad_recordings );
    var_27 = getent( "al_assad_recording", "targetname" );
    var_27 thread ambient_asad_recordings( 1 );
    thread master_recording();

    if ( level._id_3BFE == 0 )
        thread remove_flash_bang_enemies();

    common_scripts\utility::_id_0D13( common_scripts\utility::_id_40FD( "armada_tirefire_fx", "targetname" ), ::tirefire_fx );
    thread override_lighting_lobby();
    maps\armada_code::init_pickup_technical_badplace();
    level.office_tvs = getentarray( "isdestroyed", "script_noteworthy" );
    common_scripts\utility::_id_0D13( level.office_tvs, ::officelight_intensity );
}

remove_flash_bang_enemies()
{
    var_0 = _func_0DD( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_79DE ) )
            var_0[var_1]._id_79DE = 0;
    }
}

starting_debug()
{
    _id_A5A4::_id_48B0( "starting" );
    _id_A5A4::_id_48CB( 0.5 );
}

_id_1EBE()
{
    _id_A5A4::_id_48CB( 0 );
    level notify( "clearing_hints" );
    level notify( "clearing_hints" );
}

keyhint( var_0, var_1, var_2, var_3 )
{
    _id_1EBE();
    _id_A5A4::_id_48B0( var_0 );
    var_4 = "did_action_" + var_1;
    notifyoncommand( var_4, var_2 );

    if ( isdefined( var_3 ) )
        thread notifyontimeout( var_4, var_3 );

    level._id_0318 waittill( var_4 );
    _id_A5A4::_id_48CB( 0.5 );
}

notifyontimeout( var_0, var_1 )
{
    level._id_0318 endon( var_0 );
    wait(var_1);
    level._id_0318 notify( var_0 );
}

second_wave_counters()
{
    self waittill( "death" );
    level.second_wave_count++;

    if ( level.second_wave_count > 3 )
    {
        wait 9;
        var_0 = getent( "second_wave", "script_noteworthy" );
        var_0 notify( "trigger" );
    }

    if ( level.second_wave_count > 6 )
    {
        wait 9;
        var_0 = getent( "third_wave", "script_noteworthy" );
        var_0 notify( "trigger" );
    }
}

friendlies_coming_out()
{
    var_0 = getent( "friendlies_coming_out", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "griggs_squad", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, _id_A5A4::_id_30B0 );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    waitframe;
    level.griggs _id_A510::_id_0C21( level.griggs, "hold_fire" );
    var_2 = getent( "griggs_door", "targetname" );
    var_3 = getentarray( var_2._id_04A4, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] _meth_804F( var_2 );

    var_2 thread _id_A5A4::_id_69C4( "scn_friendlies_door_open" );
    var_2 _meth_82B1( var_2.angles + ( 0, -130, 0 ), 0.6, 0, 0 );
    var_2 _meth_805A();
    var_2 waittill( "rotatedone" );
    var_5 = getent( "griggs_come_out", "targetname" );
    var_5 notify( "trigger" );
    wait 2;
    level.griggs _id_A510::_id_0C21( level.griggs, "no_sign" );
    thread fall_in_dialog();
    wait 2;
    var_6 = getent( "fall_in", "targetname" );
    var_6 notify( "trigger" );
    wait 3;
    var_7 = _id_A5A4::_id_3D7A( "allies", "c" );

    for ( var_4 = 0; var_4 < var_7.size; var_4++ )
        var_7[var_4] _id_A5A4::_id_7E38( "o" );

    thread dialog_devil_dog();
}

dialog_devil_dog()
{
    _id_A5A4::_id_980D( "dialog_devil_dog", "targetname" );
    level.griggs _id_A510::_id_0C21( level.griggs, "watchsix" );
}

fall_in_dialog()
{
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "fall_in" );
}

exit_news_room_door()
{
    common_scripts\utility::_id_384A( "news_room_clear" );
    common_scripts\utility::_id_3831( "aa_tv_fight" );
    var_0 = _func_0C3( "opener_stack_node", "script_noteworthy" );
    var_0 _id_A510::_id_0BFF( level._id_6F7C, "hunted_open_barndoor" );
    var_0 _id_A510::_id_0C24( level._id_6F7C, "hunted_open_barndoor_stop" );
    var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "hunted_open_barndoor_idle", undefined, "stop_idle" );
    var_1 = getent( "open_door", "targetname" );
    var_1 waittill( "trigger" );
    var_0 notify( "stop_idle" );
    var_0 thread _id_A510::_id_0C24( level._id_6F7C, "hunted_open_barndoor" );
    _id_A5A4::_id_1332( "allies" );
    var_2 = getent( "news_room_exit_door", "targetname" );
    var_3 = getentarray( var_2._id_04A4, "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] _meth_804F( var_2 );

    var_2 _id_A5A4::_id_4B09();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( var_3[var_4].classname == "script_brushmodel" )
            var_3[var_4] _meth_805A();
    }

    level._id_6F7C _id_A5A4::_id_309A();
    thread atrium_path_start();
    common_scripts\utility::_id_383F( "entered_atrium" );
}

atrium_path_start()
{
    var_0 = getentarray( "script_vehicle_m1a1_abrams", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_799F = 1;

    var_2 = _func_1EC( "auto2950", "targetname" );
    var_3 = _func_1EC( "auto2960", "targetname" );
    var_4 = _func_1EC( "auto2969", "targetname" );
    var_2 thread play_scripted_tank_sfx( 1 );
    var_3 thread play_scripted_tank_sfx( 4.5 );
    var_4 thread play_scripted_tank_sfx( 10.5 );
    var_5 = getent( "enter_atrium_trigger", "targetname" );
    var_5 notify( "trigger" );
    var_6 = getent( "tank_trigger", "targetname" );
    var_6 notify( "trigger" );
    var_7 = getent( "last_mig29_trigger", "targetname" );
    var_7 thread start_last_mig29_sequence();
    wait 2;
    thread dialog_goes_our_boys();
    wait 1;
    common_scripts\utility::_id_384A( "player_in_atrium" );
    var_8 = _func_0C4( "atrium_nodes", "targetname" );
    var_9 = _id_A5A4::_id_3D7A( "allies", "o" );

    for ( var_1 = 0; var_1 < var_9.size; var_1++ )
    {
        var_10 = common_scripts\utility::_id_3F33( var_9[var_1]._id_02E2, var_8 );
        var_11 = _func_0C3( var_10._id_0398, "targetname" );
        var_9[var_1] thread _id_A581::_id_4241( var_11 );
    }
}

play_scripted_tank_sfx( var_0 )
{
    self waittill( "trigger", var_1 );
    var_1 endon( "death" );

    if ( isdefined( var_0 ) )
        wait(var_0);

    var_1 thread _id_A5A4::_id_69C4( "scn_armada_scripted_tanks" );
}

start_last_mig29_sequence()
{
    self waittill( "trigger", var_0 );
    _id_A5E8::_id_870C( "start_last_mig29_mix" );
}

dialog_goes_our_boys()
{
    var_0 = [];
    var_0[0] = level._id_6F7C;
    var_1 = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_0 );
    var_1._id_0C72 = "generic";
    var_1 _id_A510::_id_0C21( var_1, "goesourboys" );
    var_0[var_0.size] = var_1;
    var_2 = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_0 );

    if ( _func_1A1( var_2 ) )
    {
        var_2._id_0C72 = "generic";
        var_2 _id_A510::_id_0C21( var_2, "oorah1" );
    }

    if ( _func_1A1( var_1 ) )
        var_1 thread _id_A510::_id_0C21( var_1, "oorah2" );
}

news_room_clear()
{
    common_scripts\utility::_id_384A( "news_room_clear" );
    _id_A581::_id_533A( 3 );
    _id_A581::_id_533A( 4 );
    _id_A581::_id_533A( 8 );
    _id_A581::_id_533A( 9 );
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_8053( var_0[var_1]._id_01E6 + 100, var_0[var_1]._id_02E2 );

    wait 2.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "room_clear" );
    wait 0.5;
    var_2 = getent( "move_up_trigger", "targetname" );
    var_2 notify( "trigger" );
}
#using_animtree("generic_human");

ride_in_sniper_think()
{
    wait 0.1;
    self._id_3E09 = %armada_blackhawk_sniper_drop;
    self._id_9CE5 = %armada_blackhawk_sniper_idle_loop;
}

immortal_rope_guy()
{
    thread _id_A5A4::_id_58D7();
    common_scripts\utility::_id_384A( "on_ground" );
    thread _id_A5A4::_id_8EA4();
}

linked_deaths( var_0 )
{
    self waittill( "death" );
    var_0 = getentarray( "hq_breach_enemies", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( _func_1A1( var_0[var_1] ) )
        {
            var_2 = var_0[var_1];
            wait 0.3;
            var_3 = _func_0D9( "allies" );
            var_4 = common_scripts\utility::_id_3F33( var_2._id_02E2, var_3 );
            var_5 = var_2 _meth_80AA();

            for ( var_1 = 0; var_1 < 3; var_1++ )
            {
                _func_1C2( level._id_6F7C._id_0513, var_4 _meth_8184( "tag_flash" ), var_5 );
                wait 0.05;
            }
        }
    }
}

tank_turret_target_think()
{
    var_0 = _id_A5A8::waittill_vehiclespawn( self._id_04A4 );
    self _meth_804F( var_0 );
    var_0 _meth_825E( self );
}

subtitle_test()
{
    wait 3;
    level._id_0318 _meth_809C( "armada_reinforcements1" );
    iprintlnbold( "subtitle should play" );
}

_id_5308()
{
    self waittill( "trigger" );
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_8053( var_0[var_1]._id_01E6 + 100, var_0[var_1]._id_02E2 );
}

reinforcements_think()
{
    self waittill( "trigger" );
    var_0 = _id_A5A4::_id_3D7A( "allies", "r" );
    var_1 = 5 - var_0.size;

    if ( var_1 < 2 )
    {
        var_2 = _id_A5A4::_id_3CEE( level._id_0318 _meth_8097(), "allies" );
        var_2 _id_A5A4::_id_2534( "move_generic" );
        return;
    }

    var_3 = [];
    var_3[0] = "armada_gm1_reinforcements";
    var_3[1] = "armada_gm2_friendliesmovinup";
    var_3[2] = "armada_gm3_checkfire";
    var_3[3] = "armada_gm4_headsup";
    var_3[4] = "armada_gm5_watchyourfire";
    var_4 = var_3[_func_0B2( var_3.size )];
    var_2 = _id_A5A4::_id_3CEE( level._id_0318 _meth_8097(), "allies" );
    var_2 _meth_809C( var_4 );
    var_5 = getentarray( self._id_04A4, "targetname" );

    for ( var_6 = 0; var_6 < var_1; var_6++ )
        var_7 = var_5[var_6] _id_A5A4::_id_88C3();
}

purple_2_red()
{
    self waittill( "trigger" );
    var_0 = _id_A5A4::_id_3D7A( "allies", "p" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_7E38, "r" );
}

one_red_to_orange()
{
    var_0 = getent( "one_red_to_orange", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = _id_A5A4::_id_3D7A( "allies", "r" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _func_1A1( var_1[var_2] ) )
        {
            var_3 = var_1[var_2];
            var_3 _id_A5A4::_id_7E38( "o" );
            var_3 thread _id_A5A4::_id_7402();
            break;
        }
    }
}

kill_rooftop_ignore_groups()
{
    common_scripts\utility::_id_384A( "regrouped" );
    setthreatbias( "players_group", "left_rooftop_enemies", 0 );
    setthreatbias( "players_group", "right_rooftop_enemies", 0 );
    var_0 = getentarray( "road_friendly", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] delete();
}

enemy_mass()
{
    var_0 = getent( "enemy_mass_trigger", "targetname" );
    var_0 waittill( "trigger" );
}

magic_grenade_trigger_think()
{
    self waittill( "trigger" );
    var_0 = getentarray( self._id_04A4, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        level._id_6F7C _meth_8039( var_0[var_1]._id_02E2 + ( 0, 0, 50 ), var_0[var_1]._id_02E2, _func_0B5( 1, 2 ) );
}

player_breaks_ignore( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( var_1 == level._id_0318 )
        {
            setthreatbias( "players_group", var_0, 0 );
            break;
        }
    }
}

armada_shadowlightbyzone()
{
    var_0 = getent( "tv_station_light_2", "targetname" );

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "in_tv_station_lighting_zone_1" ) )
        {
            var_0 _meth_8494( "force_fully_on" );

            while ( common_scripts\utility::_id_382E( "in_tv_station_lighting_zone_1" ) )
                wait 0.5;
        }
        else if ( common_scripts\utility::_id_382E( "in_tv_station_lighting_zone_2" ) )
            var_0 _meth_8494( "normal" );

        wait 0.5;
    }
}

set_ambiance_level_03()
{
    self waittill( "trigger", var_0 );
    _id_A5E8::_id_870C( "set_ambiance_level_03" );
}

start_phone_call()
{
    self waittill( "trigger", var_0 );
    wait(1.0 + _func_0B3( 3.0 ));
    thread common_scripts\utility::_id_69C2( "armada_phonering", ( 4031, 22596, 0 ) );
}

sit_rep_dialog()
{
    common_scripts\utility::_id_384A( "hq_cleared" );
    var_0 = getent( "hq_cleared_move_up", "targetname" );
    var_0 notify( "trigger" );
    wait 2;
    level._id_6F7C _id_A5A4::_id_69C4( "armada_vsq_allcallsigns" );
    level._id_0318 _id_A5A4::_id_69C4( "armada_gm1_negid" );
    level._id_0318 _id_A5A4::_id_69C4( "armada_gm2_nosign" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "stand_down" );
    wait 2;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "roger_hq" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "heads_up" );
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "move_out" );
}

tank_start()
{
    _id_A5E8::_id_870C( "start_tank_checkpoint" );
    var_0 = getent( "tank_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "tank_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, _id_A5A4::_id_30B0 );
    waitframe;
    common_scripts\utility::_id_383F( "start_first_obj" );
    common_scripts\utility::_id_383F( "hq_entered" );
    common_scripts\utility::_id_383F( "hq_cleared" );
    common_scripts\utility::_id_383F( "on_ground" );
    common_scripts\utility::_id_383F( "regrouped" );
    common_scripts\utility::_id_383F( "tvstation_entered" );
    common_scripts\utility::_id_383F( "news_room_clear" );
    thread exit_news_room_door();
    thread _id_A5A8::_id_23DE( 9 );
}

_id_4E9A()
{
    _id_A5E8::_id_870C( "start_intel_checkpoint" );
    level._id_0318 _meth_8335( ( 3622, 29958, -168 ) );
}

tv_start()
{
    _id_A5E8::_id_870C( "start_tv_checkpoint" );
    var_0 = getent( "tv_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "tv_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_383F( "start_first_obj" );
    common_scripts\utility::_id_383F( "hq_entered" );
    common_scripts\utility::_id_383F( "hq_cleared" );
    common_scripts\utility::_id_383F( "on_ground" );
    common_scripts\utility::_id_383F( "regrouped" );
    thread _id_A5A8::_id_23DE( 9 );
}

hq2tv_start()
{
    _id_A5E8::_id_870C( "start_hq2tv_checkpoint" );
    var_0 = getent( "hq2tv_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "hq2tv_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_383F( "start_first_obj" );
    common_scripts\utility::_id_383F( "hq_entered" );
    common_scripts\utility::_id_383F( "hq_cleared" );
    common_scripts\utility::_id_383F( "on_ground" );
    thread _id_A5A8::_id_23DE( 9 );
}

end_of_script()
{
    var_0 = getent( "end_of_scripting", "targetname" );
    var_0 waittill( "trigger" );
    iprintlnbold( &"SCRIPT_DEBUG_LEVEL_END" );
}

_id_6302()
{
    common_scripts\utility::_id_384A( "start_first_obj" );
    var_0 = getent( "outside_hq_obj", "targetname" );
    objective_add( 1, "active", &"ARMADA_GET_INTO_POSITION_TO", var_0._id_02E2 );
    objective_current( 1 );
    common_scripts\utility::_id_384A( "hq_entered" );
    var_1 = getent( "inside_hq_obj", "targetname" );
    objective_state( 1, "done" );
    objective_add( 2, "active", &"ARMADA_SEARCH_THE_HQ_BUILDING", var_1._id_02E2 );
    objective_current( 2 );
    common_scripts\utility::_id_384A( "hq_cleared" );
    wait 2;
    var_2 = getent( "regroup_obj", "targetname" );
    objective_state( 2, "done" );
    objective_add( 3, "active", &"ARMADA_REGROUP_WITH_FIRST_SQUAD", var_2._id_02E2 );
    objective_current( 3 );
    common_scripts\utility::_id_384A( "regrouped" );
    common_scripts\utility::_id_383F( "aa_street_fight" );
    objective_state( 3, "done" );
    objective_add( 4, "active", &"ARMADA_MAKE_YOUR_WAY_TO_THE", ( 2808, 23672, -24 ) );
    objective_current( 4 );
    common_scripts\utility::_id_384A( "tvstation_entered" );
    var_3 = getent( "second_floor_obj", "targetname" );
    objective_state( 4, "done" );
    objective_add( 5, "active", &"ARMADA_MAKE_YOUR_WAY_TO_THE1", var_3._id_02E2 );
    objective_current( 5 );
    common_scripts\utility::_id_384A( "entered_atrium" );
    thread objective_on_friendly( 5, level._id_6F7C, "end_obj5" );
    var_3 waittill( "trigger" );
    thread _id_A5A4::_id_1143( "second_floor" );
    objective_state( 5, "done" );
    var_4 = getent( "final_room_obj", "targetname" );
    objective_add( 6, "active", &"ARMADA_SEARCH_THE_TV_STATION", level._id_6F7C._id_02E2 );
    objective_current( 6 );
    thread objective_on_friendly( 6, level._id_6F7C, "end_obj6" );
    var_5 = getent( "end_positions", "targetname" );
    var_5 waittill( "trigger" );
    level notify( "end_obj6" );
    objective_position( 6, var_4._id_02E2 );
    var_4 waittill( "trigger" );
    objective_state( 6, "done" );
}

objective_on_friendly( var_0, var_1, var_2 )
{
    level endon( var_2 );
    objective_onentity( var_0, var_1 );

    for (;;)
        wait 0.1;
}

hq_entered_wait()
{
    var_0 = getent( "trigger_volume_room01", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "hq_entered" );
    var_1 = getentarray( "barbed_wire_guys", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

hq_finished()
{
    common_scripts\utility::_id_384A( "hq_cleared" );
    common_scripts\utility::_id_3831( "aa_hq_fight" );

    if ( isdefined( level._id_0318._id_669E ) )
        level._id_0318._id_669E = 0;

    _id_A5E8::_id_870C( "set_ambiance_level_01" );
    thread maps\armada_code::circling_helis_fire();
    _id_A5A4::_id_1333( "allies" );
    var_0 = getent( "hq_building_exit_door", "targetname" );
    var_0 delete();
    var_1 = getent( "hq_building_exit_door_col", "targetname" );
    var_1 _meth_805A();
    var_1 delete();
    var_2 = getentarray( "hq_breachers", "script_noteworthy" );
    var_3 = getentarray( "ride_in_sniper", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( _func_1A1( var_3[var_4] ) )
            var_3[var_4] _meth_8053( var_3[var_4]._id_01E6 + 100, var_3[var_4]._id_02E2 );
    }

    var_5 = getent( "small_gate1", "targetname" );
    var_5 _meth_82B3( -90, 0.1 );
    var_6 = getent( "small_gate2", "targetname" );
    var_6 _meth_82B3( 90, 0.1 );
    var_7 = getent( "return_path_clip", "targetname" );
    var_7 delete();
    var_8 = getent( "return_path_clip1", "targetname" );
    var_8 delete();
    maps\armada_aud::play_technical_scripted_sfx_sequence();
}

get_abarbed_wire_ai()
{
    var_0 = getentarray( "barbed_wire_guys", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( _func_0CF( var_0[var_1] ) )
            return var_0[var_1];
    }
}

razor_wire_setup()
{
    var_0 = getent( "barbed_wire_trigger", "targetname" );
    var_1 = _func_0C3( "barbed_wire_node", "targetname" );
    var_2 = getent( "barbed_wire_long", "targetname" );
    var_2._id_0C72 = "barbed_wire_long";
    var_2 _id_A510::_id_7F29();
    var_1 thread _id_A510::_id_0C24( var_2, "razor_idle", undefined, var_1 );
    common_scripts\utility::_id_384A( "on_ground" );

    if ( common_scripts\utility::_id_382E( "hq_cleared" ) )
        return;

    level.barbedwireguy = get_abarbed_wire_ai();
    level.barbedwireguy._id_0C72 = "razorwire_guy";
    var_3 = [];
    var_3[0] = level.barbedwireguy;
    var_3[1] = var_2;
    var_1 thread _id_A510::_id_0C18( var_3, "razor_idle", undefined, undefined );
    var_0 waittill( "trigger" );
    level.barbedwireguy _id_A5A4::_id_7F71( 1 );
    var_1 _id_A510::_id_0C18( var_3, "razor_setup", undefined, undefined );
    level.barbedwireguy _meth_81A7( 1 );
    level.barbedwireguy _id_A5A4::_id_7F71( 0 );
    var_4 = _func_0C3( "cover_razor", "script_noteworthy" );
    level.barbedwireguy _id_A5A4::_id_7E4D( var_4._id_02E2 );
}

razor_wire_collision()
{
    var_0 = getent( "barbed_wire_scrunched", "targetname" );
    var_0 _meth_8056();
    var_1 = getent( "razorwire_scrunched_clip", "targetname" );
    var_1 _meth_82BB();
    var_1 _meth_805A();
    common_scripts\utility::_id_384A( "hq_cleared" );
    var_0 _meth_8055();
    var_1 _meth_82BA();
    var_1 _meth_8059();
    var_2 = getent( "barbed_wire_long", "targetname" );
    var_2 delete();
    var_3 = getent( "barbed_wire_clip", "targetname" );
    var_3 _meth_805A();
    var_3 delete();
}

draw_hud_on_death()
{
    level endon( "stop_draw_hud_on_death" );
    level waittill( "missionfailed" );
    _func_0D6( "hud_drawhud", "1" );
}
#using_animtree("player");

loadplayer( var_0, var_1 )
{
    thread draw_hud_on_death();

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = undefined;

    for ( var_3 = 0; var_3 < self._id_750A.size; var_3++ )
    {
        if ( self._id_750A[var_3]._id_7ADC == var_0 )
        {
            var_2 = self._id_750A[var_3];
            var_2._id_2E3F = 1;
            var_2._id_6D23 = 1;
            var_2._id_7AE0 = 1;
            break;
        }
    }

    var_4 = _id_A5A9::_id_0BE9( self, var_0 );
    var_2 notify( "newanim" );
    var_2 _meth_802B();
    var_2 _meth_80B3( "worldbody_h1_usmc_desert" );
    var_2 _meth_8117( #animtree );
    var_2._id_3E09 = %h1_armada_blackhawk_player_drop;
    var_2._id_9CE5 = %h1_armada_blackhawk_player_idle_loop;
    thread _id_A5A9::_id_449B( var_2, var_0 );
    level._id_0318 _meth_807F( var_2, "tag_player_rope", 1.0, 90, 30, 40, 40, 1 );
    level._id_0318 _meth_8326( 0 );
    var_5 = getanimlength( var_4._id_4068 );
    var_5 -= var_1;
    self waittill( "unloading" );
    thread rope_view_angles();
    level._id_0318 _meth_831A();
    var_2 _meth_82BB();
    wait(var_5);
    var_2 _meth_8056();
    level._id_0318 _meth_8051();
    level._id_0318 _meth_831B();
    level._id_0318 _meth_811A( 1 );
    _func_0D6( "hud_drawhud", "1" );
    level notify( "stop_draw_hud_on_death" );
    common_scripts\utility::_id_383F( "start_first_obj" );
}

rope_view_angles()
{
    level._id_0318 _meth_80A4( 0.5, 0.1, 0.1, 30, 10, 10, 20 );
    wait 5;
    level._id_0318 _meth_80A4( 0.5, 0.1, 0.1, 70, 60, 30, 20 );
}

heli_ride_player_quake()
{
    self endon( "death" );
    self endon( "stop_quake" );

    for (;;)
    {
        wait 0.1;
        _func_18C( 0.05, 0.1, self._id_02E2, 256 );
    }
}

ride_start()
{
    _id_A5E8::_id_870C( "start_ride_checkpoint" );
    thread start_helicopters();
    _func_0D6( "r_lodFOVFixedScale", "1.5" );
    level.player_heli = _id_A5A8::waittill_vehiclespawn_noteworthy( "players_helicopter" );
    level.player_heli._id_799F = 1;
    level.player_heli thread _id_A5A4::_id_69C4( "scn_armanda_intro" );
    level._id_0318 _meth_831C( 1 );
    level._id_0318 _meth_84BB( 1 );
    level.player_heli thread maps\armada_anim::player_heli_ropeanimoverride();
    level.player_heli thread loadplayer( 3, 1.0 );
    level.player_heli thread helicopter_residual_dust();
    thread player_control_during_ride();
    _id_A5A4::_id_6008( "music_armada_ride" );
    level._id_0318 _meth_831E();
    _func_0D6( "sm_sunSampleSizeNear", 2 );
    thread technical_setup();
    thread end_water_visionset();
    _id_A5A4::_id_1332( "allies" );
    thread return_fire_flag();
    thread feet_dry();
    thread taking_fire();
    thread was_close();
    thread target_in_view();
    thread five_seconds();
    thread down_ropes();
    thread turn_off_cull();
    thread _id_A5A4::_id_3840( "kill_rpgs", 40 );
    thread heli_ride_h1_dof();
    waitframe;
    common_scripts\utility::_id_383F( "snipefromheli" );
    wait 6;
    level._id_0318 _meth_809C( "armada_hp1_shorelineinview" );
    wait 2;
    level._id_0318 _meth_809C( "armada_fhp_copystrikersixfour" );
}

heli_ride_h1_dof()
{
    level._id_0318 _meth_80A4( 0, 0, 0, 85, 12, 30, 40 );
    wait 17.0;
    wait 6.0;
    wait 17.0;
    wait 8.0;
    wait 5.0;
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 6.4, 1500, 0.5, 0.5 );
    wait 0.3;
    _func_0D6( "r_mbEnable", 2 );
    wait 1.05;
    _func_0D6( "r_mbEnable", 0 );
    wait 4.15;
    level._id_0318 _meth_84A6();
}

return_fire_flag()
{
    wait 17;
    thread maps\armada_code::intro_helis_fire();
}

turn_off_cull()
{
    wait 42;
    var_0 = 2;
    var_1 = 2;
    var_2 = 0.25;
    var_3 = 2;
    var_4 = ( var_1 - var_2 ) / var_0 * 20;

    while ( var_3 > var_2 )
    {
        var_3 -= var_4;
        _func_0D6( "sm_sunSampleSizeNear", var_3 );
        wait 0.05;
    }
}

feet_dry()
{
    wait 10;
    level._id_0318 _meth_809C( "armada_hp1_feetdrytenseconds" );
    wait 1.5;
    level._id_0318 _meth_809C( "armada_fhp_copy" );
}

taking_fire()
{
    wait 17;
    level._id_0318 _meth_809C( "armada_hp1_takingfirehere" );
    wait 1.5;
    level._id_0318 _meth_809C( "armada_fhp_rogerthat" );
}

was_close()
{
    wait 31;
    level._id_0318 _meth_809C( "armada_hp1_thatwasclose" );
}

target_in_view()
{
    wait 35;
    level._id_0318 _meth_809C( "armada_fhp_gotvisual" );
}

five_seconds()
{
    wait 43;
    level._id_0318 _meth_809C( "armada_hp1_fiveseconds" );
    wait 5;
    level._id_0318 _meth_809C( "armada_hp1_standbygreenlight" );
}

down_ropes()
{
    common_scripts\utility::_id_384A( "end_water" );
    level.player_heli waittill( "unloading" );
    level._id_6F7C _meth_809C( "armada_vsq_downtheropes" );
    wait 5;
    level.breacher _meth_809C( "armada_gm1_gogogo" );
}

on_ground()
{
    common_scripts\utility::_id_384A( "on_ground" );
    var_0 = getentarray( "interactive_tv", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::bright_tv );
    _func_0D6( "r_lodFOVFixedScale", "1" );
    level._id_0318 _meth_830B( "claymore" );
    _func_0D6( "sm_sunSampleSizeNear", 0.25 );
    level._id_0318 _meth_831D( 1 );
    level._id_0318 _meth_84BC( 1 );
    level._id_0318 _meth_831F();
}

barbed_wire_dialog()
{
    var_0 = getent( "barbed_wire_dialog", "targetname" );
    var_0 waittill( "trigger" );
    level.barbedwireguy _meth_809C( "armada_gm2_moveitmoveit" );
    wait 2;
    level.barbedwireguy _meth_809C( "armada_gm3_blockingpositions" );
}

on_me_to_building()
{
    var_0 = getent( "on_me_to_building", "targetname" );
    var_0 waittill( "trigger" );
    level._id_6F7C _meth_809C( "armada_vsq_secondsquadonme" );
}

end_water_visionset()
{
    var_0 = getent( "end_water_visionset", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "end_water" );
    _id_A5A4::_id_7F00( "armada", 3 );
}

start_helicopters()
{
    waitframe;
    thread _id_A5A8::_id_23DE( 0 );
    thread _id_A5A8::_id_23DE( 2 );
    thread _id_A5A8::_id_23DE( 3 );
    thread _id_A5A8::_id_23DE( 4 );
    wait 0.25;
    level.helis_spawners = getentarray( "heli", "targetname" );
    level._id_4816 = [];

    for ( var_0 = 0; var_0 < level.helis_spawners.size; var_0++ )
    {
        if ( isdefined( level.helis_spawners[var_0]._id_555C ) )
            level._id_4816[level._id_4816.size] = level.helis_spawners[var_0]._id_555C;
    }

    var_1 = getent( "first_fly_away_trigger", "targetname" );
    var_2 = getent( "fly_away_trigger", "targetname" );
    thread _id_7665();

    for ( var_0 = 0; var_0 < level._id_4816.size; var_0++ )
    {
        level._id_4816[var_0].repulser = _func_1A5( level._id_4816[var_0], 5000, 100 );
        level._id_4816[var_0].exitpoint = level._id_4816[var_0]._id_02E2;
        level._id_4816[var_0] thread _id_A5A8::_id_4259();

        if ( isdefined( level._id_4816[var_0]._id_0398 ) )
        {
            if ( level._id_4816[var_0]._id_0398 == "ai_dropper" || level._id_4816[var_0]._id_0398 == "players_helicopter" )
                level._id_4816[var_0] thread helicopters_fly_away( var_2 );

            if ( level._id_4816[var_0]._id_0398 == "first_fly_away" )
                level._id_4816[var_0] thread helicopters_fly_away( var_1 );

            if ( level._id_4816[var_0]._id_0398 == "players_helicopter" )
            {
                var_3 = spawn( "script_model", level._id_4816[var_0] _meth_8184( "body_animate_jnt" ) );
                var_3 _meth_80B3( "vehicle_blackhawk_hero_sas_night_interior" );
                var_3.angles = level._id_4816[var_0].angles;
                var_3 _meth_804F( level._id_4816[var_0], "body_animate_jnt" );
                var_3._id_0C72 = "blackhawk";
                var_3 _id_A510::_id_7F29();
                var_3 thread _id_A510::_id_0BE1( var_3, "interiorwires" );
            }
        }
    }

    var_4 = getentarray( "delete_heli", "script_noteworthy" );
}

unload_late( var_0 )
{
    common_scripts\utility::_id_384A( "on_ground" );
    _id_A5A4::_id_9CB3();
    _id_A5A4::_id_9CBF( var_0, 0 );
}

helicopters_fly_away( var_0 )
{
    var_1 = level.heli_delay[_func_0BC( self._id_7A99 )];
    thread wait_for_unload();
    common_scripts\utility::_id_384A( "on_ground" );
    var_0 _id_A5A4::_id_9FC8( 12 );

    if ( !isdefined( self.armada_unloaded ) )
        self waittill( "unloaded" );

    wait(var_1);
    _id_A5A4::_id_9CB3();
    _func_1A7( self.repulser );
    self _meth_8259();
    self _meth_8262();
    self _meth_825B();
    self _meth_8257( self.exitpoint, 1 );
    self waittill( "goal" );
    level._id_4816 = common_scripts\utility::_id_0CF6( level._id_4816, self );
    self delete();
}

wait_for_unload()
{
    if ( _id_A5A9::_id_750C( "both" ) )
        self waittill( "unloaded" );

    self.armada_unloaded = 1;
}

delete_heli_think()
{
    self waittill( "trigger", var_0 );
    var_0 delete();
}

player_control_during_ride()
{
    _func_0D6( "g_friendlyNameDist", 0 );
    _func_0D6( "g_friendlyfireDist", 0 );
    level._id_0318 _meth_8301( 0 );
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_80F1();
    level._id_0318._id_01FF = 1;
    wait 0.05;
    level._id_0318 _meth_8337( ( 0, 35, 0 ) );
    level.player_heli waittill( "unloading" );
    level._id_0318 notify( "stop_quake" );
    wait 4;
    level.player_heli._id_799F = 0;
    _id_A5E8::_id_870C( "stop_inside_blackhawk_mix" );
    wait 3;
    _id_A5E8::_id_870C( "stop_intro_mix" );
    _id_A5A4::_id_1143( "on_the_ground" );
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_811A( 1 );
    level._id_0318 _meth_811B( 0 );
    wait 0.05;
    level._id_0318 _meth_811C( 1 );
    level._id_0318 _meth_811B( 1 );
    level._id_0318 _meth_80F2();
    level._id_0318._id_01FF = 0;
    level._id_0318 _meth_8301( 1 );
    wait 4;
    _func_0D6( "g_friendlyNameDist", 15000 );
    _func_0D6( "g_friendlyfireDist", 128 );
}

landed_start()
{
    _id_A5E8::_id_870C( "start_landed_checkpoint" );
    var_0 = getent( "street_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "streets_start_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_383F( "return_fire" );
    common_scripts\utility::_id_383F( "start_first_obj" );
    common_scripts\utility::_id_383F( "on_ground" );
    _id_A5A4::_id_1332( "allies" );
    thread _id_A5A8::_id_23DE( 9 );
}

ambient_asad_recordings( var_0 )
{
    if ( self._id_029C != "com_tv1" && !isdefined( var_0 ) )
        return;

    var_1 = "";

    if ( isdefined( var_0 ) && var_0 )
        var_1 = "_studio";

    var_2 = [];
    var_2[var_2.size] = "armada_kaa_onenation_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_newera_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_selfinterest_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_notenslaved_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_donotfear_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_freefromyoke_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_armiesstrong_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_greatnation_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_laywaste_TV" + var_1;
    var_2[var_2.size] = "armada_kaa_willperish_TV" + var_1;
    var_3 = 0;
    var_4 = spawn( "script_origin", self._id_02E2 );
    var_4 endon( "death" );
    thread ambient_asad_handler( var_4 );

    for (;;)
    {
        var_5 = level common_scripts\utility::_id_A070( "stop_asad_recording", "next_asad_sound" );

        switch ( var_5 )
        {
            case "stop_asad_recording":
                var_4 _meth_80AE();
                wait 0.5;
                var_4 delete();
                return;
            case "next_asad_sound":
                var_4 _meth_809C( var_2[var_3], "done" );
                var_3 = ( var_3 + 1 ) % var_2.size;
                continue;
        }
    }
}

master_recording()
{
    common_scripts\utility::_id_384A( "hq_entered" );
    wait 2;
    var_0 = getent( "master_asad_sound", "script_noteworthy" );
    var_1 = [];
    var_1[0] = spawnstruct();
    var_1[1] = spawnstruct();
    var_1[2] = spawnstruct();
    var_1[3] = spawnstruct();
    var_1[4] = spawnstruct();
    var_1[5] = spawnstruct();
    var_1[6] = spawnstruct();
    var_1[7] = spawnstruct();
    var_1[8] = spawnstruct();
    var_1[9] = spawnstruct();
    var_1[0]._id_8899 = "armada_kaa_onenation_TV";
    var_1[1]._id_8899 = "armada_kaa_newera_TV";
    var_1[2]._id_8899 = "armada_kaa_selfinterest_TV";
    var_1[3]._id_8899 = "armada_kaa_notenslaved_TV";
    var_1[4]._id_8899 = "armada_kaa_donotfear_TV";
    var_1[5]._id_8899 = "armada_kaa_freefromyoke_TV";
    var_1[6]._id_8899 = "armada_kaa_armiesstrong_TV";
    var_1[7]._id_8899 = "armada_kaa_greatnation_TV";
    var_1[8]._id_8899 = "armada_kaa_laywaste_TV";
    var_1[9]._id_8899 = "armada_kaa_willperish_TV";
    var_1[0].sound_length = 9;
    var_1[1].sound_length = 11;
    var_1[2].sound_length = 14;
    var_1[3].sound_length = 6;
    var_1[4].sound_length = 13;
    var_1[5].sound_length = 8;
    var_1[6].sound_length = 5;
    var_1[7].sound_length = 13;
    var_1[8].sound_length = 5;
    var_1[9].sound_length = 8;
    var_2 = 0;

    for (;;)
    {
        level notify( "next_asad_sound" );
        var_0 _meth_809C( var_1[var_2]._id_8899 );
        wait(var_1[var_2].sound_length);
        var_2++;

        if ( var_2 == var_1.size )
            var_2 = 0;
    }
}

ambient_asad_handler( var_0 )
{
    level endon( "stop_asad_recording" );

    for (;;)
    {
        var_1 = common_scripts\utility::_id_A070( "off", "death" );

        switch ( var_1 )
        {
            case "off":
                if ( self._id_029C != self._id_6378 )
                    var_0 _meth_8071( 0, 0.1 );
                else
                    var_0 _meth_8071( 1, 0.1 );

                continue;
            case "death":
                var_0 _meth_80AE();
                wait 0.5;
                var_0 delete();
                return;
        }
    }
}

stop_all_asad_vo_on_tv()
{
    foreach ( var_1 in level.recordings )
        var_1 notify( "off" );
}

turn_off_videos()
{
    var_0 = getentarray( "interactive_tv", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( _func_120( var_0[var_1]._id_029C, "tv1_cinematic" ) )
            var_0[var_1] _meth_80B3( "com_tv1_testpattern" );
    }

    _func_05E();
}

flag_on_notify( var_0, var_1 )
{
    self waittill( var_1 );
    common_scripts\utility::_id_383F( var_0 );
}

setasdestructible( var_0, var_1, var_2, var_3 )
{
    self _meth_82BC( 1 );

    for (;;)
    {
        self waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( var_4 <= 0 )
            continue;

        if ( isdefined( var_3 ) && var_3 )
            self _meth_82BE( self._id_02E2, var_6 * var_4 );

        self _meth_80B3( var_0 );
        var_11 = self _meth_8097();
        var_12 = var_11 + var_2;
        playfx( level._id_058F[var_1], var_12 );
        break;
    }
}

monitor_destruct()
{
    setasdestructible( "h1_mwr_com_widescreen_monitor_des", "tv_explosion", ( 0, 0, 25 ), 1 );
}

monitor_destruct2()
{
    setasdestructible( "h1_mwr_com_widescreen_monitor_2_des", "tv_explosion", ( 0, 0, 30 ), 1 );
}

monitor_destruct3()
{
    setasdestructible( "h1_mwr_com_widescreen_monitor_3_des", "tv_explosion", ( 0, 0, 28 ), 1 );
}

monitor_destruct_on()
{
    setasdestructible( "com_widescreen_monitor_on_1_des", "tv_explosion", ( 0, 0, 25 ), 1 );
}

monitor_destruct_on_2()
{
    setasdestructible( "com_widescreen_monitor_on_2_des", "tv_explosion", ( 0, 0, 30 ), 1 );
}

monitor_destruct_on_3()
{
    setasdestructible( "com_widescreen_monitor_on_3_des", "tv_explosion", ( 0, 0, 28 ), 1 );
}

computer_destruct()
{
    setasdestructible( "com_computer_monitor_d", "tv_explosion", ( 0, 0, 10 ) );
}

tv_news_destruct()
{
    setasdestructible( "me_news_ticker_video_screen_des", "tv_explosion", ( 0, 0, 25 ) );
    wait 2.0;
    setasdestructible( "me_news_ticker_video_screen_des2", "tv_explosion", ( 0, 0, 25 ) );
}

monitor_destruct_scaled()
{
    setasdestructible( "com_widescreen_monitor_on_1_des_scaled", "tv_explosion", ( 0, 0, 40 ) );
}

monitor_destruct_on_scaled2()
{
    setasdestructible( "com_widescreen_monitor_on_2_des_scaled", "tv_explosion", ( 0, 0, 50 ) );
}

tv_wall()
{
    setasdestructible( "btr_tv_smart_wall_02_sml_des01", "tv_explosion", ( 0, 0, 25 ) );
    wait 2.0;
    setasdestructible( "btr_tv_smart_wall_02_sml_des02", "tv_explosion", ( 0, 0, 25 ) );
}

final_breach()
{
    var_0 = getent( "end_positions", "targetname" );
    var_1 = getent( "trigger_start_final_breach", "targetname" );
    var_2 = getent( "final_volume", "targetname" );
    var_3 = getent( "final_breach_anim_ent", "targetname" );
    var_4 = getent( "enter_final_room", "targetname" );
    var_0 waittill( "trigger" );
    thread maps\armada_code::quiet_circling_helicopters();
    stop_all_asad_vo_on_tv();
    var_2 thread flag_on_notify( "breach_ready_flag", "ready_to_breach" );
    var_5 = [];
    level.final_breacher_shotgun._id_3817 = 1;
    var_5 = common_scripts\utility::_id_07A5( var_5, level.final_breacher_shotgun );
    var_5 = common_scripts\utility::_id_07A5( var_5, level.final_breacher_right );
    var_6 = "shotgunhinges_breach_left";
    level._id_78BA["breach_wood_door_kick"] = "scn_doorbreach_metal_door_kick";
    var_2 thread _id_A516::_id_17AD( var_5, var_6 );
    var_2.edoorpivot _meth_82AD( -2, 0.1 );
    level.griggs _id_A5A4::_id_7E38( "p" );
    level._id_6F7C _id_A5A4::_id_7E38( "g" );
    var_7 = [];
    var_7[var_7.size] = level._id_6F7C;
    var_7[var_7.size] = level.griggs;
    var_7[var_7.size] = level.final_breacher_shotgun;
    var_7[var_7.size] = level.final_breacher_right;
    var_8 = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_7 );
    var_7[var_7.size] = var_8;
    var_9 = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_7 );

    if ( _func_1A1( var_9 ) )
        var_9 _id_A5A4::_id_7E38( "b" );

    var_1 waittill( "trigger" );
    level notify( "helis_stop_firing" );
    common_scripts\utility::_id_384A( "breach_ready_flag" );
    level.griggs _id_A510::_id_0C21( level.griggs, "I_hear_him" );
    wait 0.5;
    common_scripts\utility::_id_383F( "i_hear_him" );
    thread ending_asad_usbkey_think();
    var_2 waittill( "execute_the_breach" );
    teleport_on_distance( level._id_6F7C, "vasquezteleport" );
    teleport_on_distance( level.griggs, "griggsteleport" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "do_it" );
    wait 7;
    var_10 = getent( "col_finalebreach", "targetname" );
    var_10 delete();

    if ( _func_1A1( var_9 ) )
        var_9 thread room_clear( _func_0C3( "room_clear2_node", "script_noteworthy" ), "armada_gm3_roomclear" );

    wait 2;

    if ( _func_1A1( var_8 ) )
        var_8 thread room_clear( _func_0C3( "room_clear4_node", "script_noteworthy" ), "armada_gm2_nothere" );

    thread dialog_on_a_loop();
    wait 8;
    trigger_price_n_griggs( var_3, var_2 );
}

dialog_on_a_loop()
{
    wait 9.5;
    var_0 = level.final_breacher_shotgun;
    var_0._id_0C72 = "generic";
    var_0 _id_A510::_id_0C21( var_0, "armada_gm1_onaloop" );
}

room_clear( var_0, var_1 )
{
    self _meth_81A9( var_0 );
    self waittill( "goal" );
    self._id_0130 = 1;
    self _meth_81A7( 1 );

    if ( isdefined( var_1 ) )
    {
        self._id_0C72 = "generic";
        _id_A510::_id_0C21( self, var_1 );
    }

    wait 2;
    var_2 = _func_0C3( var_0._id_04A4, "targetname" );
    self _meth_81A9( var_2 );
    self waittill( "goal" );
    level waittill( "rally_up" );
    wait(_func_0B5( 0.2, 1.5 ));
    self waittill( "goal" );
}

final_breacher_right_think()
{
    level.final_breacher_right = self;
    thread _id_A5A4::_id_58D7();
    self waittill( "breach_complete" );
    room_clear( _func_0C3( "room_clear1_node", "script_noteworthy" ), "armada_gm1_clear" );
}

final_breacher_shotgun_think()
{
    level.final_breacher_shotgun = self;
    thread _id_A5A4::_id_58D7();
    self waittill( "breach_complete" );
    room_clear( _func_0C3( "room_clear3_node", "script_noteworthy" ), "armada_gm2_clear" );
}

walk_to( var_0 )
{
    _id_A5A4::_id_2A8D();
    _id_A5A4::_id_7E45( "walk", 1 );
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self._id_01C4 = 32;
    self _meth_81A9( var_0 );
    self waittill( "goal" );
    _id_A510::_id_0BC9( self, "patrol_stop" );
    self _meth_81AA( self._id_02E2 );
}

trigger_price_n_griggs( var_0, var_1 )
{
    thread final_griggs( var_0, var_1 );
    wait 0.25;
    thread final_price( var_0, var_1 );
}

final_price( var_0, var_1 )
{
    level._id_6F7C._id_0130 = 1;
    level._id_6F7C _meth_81A7( 1 );
    var_0 _id_A510::_id_0BFF( level._id_6F7C, "enter" );
    level._id_6F7C _meth_81A7( 1 );
    common_scripts\utility::_id_383F( "end_vaz_ready" );
    thread _id_A5A4::_id_1332();
    var_0 _id_A510::_id_0C24( level._id_6F7C, "enter" );
    level._id_6F7C _meth_81A7( 1 );
    level._id_6F7C _meth_81AA( level._id_6F7C._id_02E2 );
}

final_griggs( var_0, var_1 )
{
    level.griggs._id_0130 = 1;
    level.griggs _meth_81A7( 1 );
    var_0 _id_A510::_id_0BFF( level.griggs, "enter" );
    level.griggs _meth_81CA( var_0._id_02E2, var_0.angles );
    level.griggs _meth_81A7( 1 );
    common_scripts\utility::_id_383F( "end_grg_ready" );
    thread end_dialog_sequence();
    var_0 _id_A510::_id_0C24( level.griggs, "enter" );
    level.griggs _meth_81A7( 1 );
}

end_dialog_sequence()
{
    wait 13.25;
    thread griggs_plays_music();
    wait 15;
    level notify( "rally_up" );
    wait 6.5;
    _id_A5A4::_id_60D6();
}

griggs_plays_music()
{
    wait 0.5;
    level.griggs thread _id_A5A4::_id_69C4( "scn_armada_griggs_music" );
    wait 5;
    var_0 = getent( "al_assad_recording", "targetname" );
    var_0._id_040F = 1;
    var_0 _meth_80AE();
    level notify( "stop_asad_recording" );
    turn_off_videos();
    thread common_scripts\utility::_id_69C2( "armada_end_song", var_0._id_02E2 );
    wait 2;
}

end_start()
{
    _id_A5E8::_id_870C( "start_end_checkpoint" );
    var_0 = getent( "end_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    var_1 = getentarray( "end_spawners", "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, _id_A5A4::_id_30B0 );
    waitframe;
    common_scripts\utility::_id_383F( "start_first_obj" );
    common_scripts\utility::_id_383F( "hq_entered" );
    common_scripts\utility::_id_383F( "hq_cleared" );
    common_scripts\utility::_id_383F( "on_ground" );
    common_scripts\utility::_id_383F( "regrouped" );
    common_scripts\utility::_id_383F( "tvstation_entered" );
    common_scripts\utility::_id_383F( "news_room_clear" );
    common_scripts\utility::_id_383F( "entered_atrium" );
    wait 0.2;
    var_2 = getent( "end_positions", "targetname" );
    var_2 notify( "trigger" );
}

tv_breach_dialog( var_0 )
{
    var_0 waittill( "detpack_about_to_blow" );
    wait 1;
    level._id_6F7C _meth_809C( "armada_vsq_doit" );
    wait 2;
    level.tv_breacher _meth_809C( "armada_gm1_breachingbreaching" );
    wait 1;
    level._id_6F7C _meth_809C( "armada_vsq_gogogo2" );
}

get_tv_breacher()
{
    common_scripts\utility::_id_384A( "tv_station_locked_down" );
    common_scripts\utility::_id_3831( "aa_street_fight" );
    level._id_6F7C thread _id_A510::_id_0C21( level._id_6F7C, "targetbuilding" );
    var_0 = _id_A5A4::_id_3D7A( "allies", "g" );

    if ( var_0.size > 0 )
    {
        var_1 = _id_A5A4::_id_3D7A( "allies", "r" );
        var_2 = 5 - var_1.size;

        for ( var_3 = 0; var_3 < var_2; var_3++ )
        {
            if ( _func_1A1( var_0[var_3] ) )
                var_0[var_3] _id_A5A4::_id_7E38( "r" );
        }
    }

    var_4 = _id_A5A4::_id_3D7A( "allies", "g" );
    var_4[var_4.size] = level._id_6F7C;
    level.tv_breacher = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_4 );
    level.tv_breacher thread _id_A5A4::_id_58D7();
}
#using_animtree("generic_human");

tv_breach()
{
    var_0 = getent( "trigger_tv_breach", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = getentarray( "server_blink", "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::server_blinking_lights );
    var_2 = getent( "trigger_after_tv_breach_volume", "targetname" );
    var_2 common_scripts\utility::_id_97CC();
    thread news_room_clear();
    thread exit_news_room_door();
    dialog_tv_station_locked_down( var_0 );
    var_3 = getent( "breach_positions", "targetname" );
    var_3 notify( "trigger" );
    var_4 = getent( "tv_volume", "targetname" );
    level.tv_breacher thread _id_A5A4::_id_7402();

    if ( _func_0F0( level.tv_breacher._id_02E2, level._id_0318._id_02E2 ) > 1690000 )
        level.tv_breacher _meth_81CA( ( 2294.8, 25157, -26.4 ), ( 0, 0, 0 ) );

    if ( _func_0F0( level._id_6F7C._id_02E2, level._id_0318._id_02E2 ) > 1690000 )
        level._id_6F7C _meth_81CA( ( 2184.1, 25231.2, -47.9 ), ( 0, 0, 0 ) );

    thread tv_breach_dialog( var_4 );
    var_5 = [];
    var_5 = common_scripts\utility::_id_07A5( var_5, level._id_6F7C );
    var_5 = common_scripts\utility::_id_07A5( var_5, level.tv_breacher );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        var_5[var_6]._id_9BF0 = 0;

    var_7 = _func_0D9( "allies" );

    foreach ( var_9 in var_7 )
    {
        if ( isdefined( var_9 ) )
            var_9 _meth_8168( 1 );
    }

    level._id_78AC["generic"]["detcord_stack_left_start_01"] = %h1_breach_explosive_stackl_tv_approach;
    level._id_78AC["generic"]["detcord_stack_left_start_02"] = %h1_breach_explosive_tv_approach;
    level._id_78AC["generic"]["detcord_stack_left_start_no_approach_01"] = %h1_breach_explosive_stackl_tv_idle;
    level._id_78AC["generic"]["detcord_stack_left_start_no_approach_02"] = %h1_breach_explosive_tv_idle;
    level._id_78AC["generic"]["detcord_stack_leftidle_01"][0] = %h1_breach_explosive_stackl_tv_idle;
    level._id_78AC["generic"]["detcord_stack_leftidle_02"][0] = %h1_breach_explosive_tv_idle;
    level._id_78AC["generic"]["detcord_stack_leftbreach_01"] = %h1_breach_explosive_stackl_tv;
    level._id_78AC["generic"]["detcord_stack_leftbreach_02"] = %h1_breach_explosive_tv;
    var_11 = "explosive_breach_left";
    var_12 = undefined;
    var_13 = 0;
    var_14 = 0;
    var_15 = 0;
    level._id_78BA["breach_wood_door_kick"] = "";

    if ( isdefined( level._id_6F7C._id_609C ) )
        level._id_6F7C waittill( "done_setting_new_color" );

    if ( isdefined( level.tv_breacher._id_609C ) )
        level.tv_breacher waittill( "done_setting_new_color" );

    var_4 thread _id_A516::_id_17AD( var_5, var_11, var_12, var_13, var_14, var_15 );

    while ( !var_4._id_17B6 )
        wait 0.05;

    level._id_6F7C _id_A5A4::_id_7E38( "o" );
    level.tv_breacher _id_A5A4::_id_7E38( "o" );
    var_2 common_scripts\utility::_id_97CE();
    var_2 notify( "trigger" );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        var_5[var_6]._id_9BF0 = 1;

    level._id_6F7C _id_A5A4::_id_309A();
    level.tv_breacher _id_A5A4::_id_309A();
    level.tv_breacher _id_A5A4::_id_8EA4();
    common_scripts\utility::_id_383F( "aa_tv_fight" );
    common_scripts\utility::_id_384A( "aa_tv_fight" );

    foreach ( var_9 in var_7 )
    {
        if ( isdefined( var_9 ) )
            var_9 _meth_8168( 0 );
    }
}

dialog_tv_station_locked_down( var_0 )
{
    var_1 = [];
    var_1[0] = level._id_6F7C;
    var_2 = level.tv_breacher;
    var_2._id_0C72 = "generic";

    while ( _func_0EE( var_0._id_02E2, level._id_6F7C._id_02E2 ) > 1000 )
        wait 0.5;

    var_2 _id_A510::_id_0C21( var_2, "tvstation" );
    wait 0.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "get_into_pos" );
}

hq_breach()
{
    var_0 = getent( "start_breach", "targetname" );
    var_0 waittill( "trigger" );
    level.breacher._id_A154 = 1;
    var_1 = getent( "trigger_after_hq_breach_volume", "targetname" );
    var_1 common_scripts\utility::_id_97CC();
    thread sit_rep_dialog();
    level._id_78AC["generic"]["detcord_stack_left_start_01"] = %h1_breach_explosive_stackl_hq_approach;
    level._id_78AC["generic"]["detcord_stack_left_start_02"] = %h1_breach_explosive_hq_approach;
    level._id_78AC["generic"]["detcord_stack_left_start_no_approach_01"] = %h1_breach_explosive_stackl_hq_idle;
    level._id_78AC["generic"]["detcord_stack_left_start_no_approach_02"] = %h1_breach_explosive_hq_idle;
    level._id_78AC["generic"]["detcord_stack_leftidle_01"][0] = %h1_breach_explosive_stackl_hq_idle;
    level._id_78AC["generic"]["detcord_stack_leftidle_02"][0] = %h1_breach_explosive_hq_idle;
    level._id_78AC["generic"]["detcord_stack_leftbreach_01"] = %h1_breach_explosive_stackl_hq;
    level._id_78AC["generic"]["detcord_stack_leftbreach_02"] = %h1_breach_explosive_hq;
    var_2 = getent( "volume_room01", "targetname" );
    thread breach_dialog( var_2 );
    var_3 = [];
    var_3 = common_scripts\utility::_id_07A5( var_3, level._id_6F7C );
    var_3 = common_scripts\utility::_id_07A5( var_3, level.breacher );
    var_4 = "explosive_breach_left";
    var_5 = undefined;
    var_6 = 0;
    var_7 = 0;
    var_2 thread _id_A516::_id_17AD( var_3, var_4, var_5, var_6, var_7 );
    var_8 = getent( "breach_enemy_trigger", "script_noteworthy" );
    var_8 notify( "trigger" );
    var_2 waittill( "detpack_detonated" );
    var_1 common_scripts\utility::_id_97CE();
    var_1 notify( "trigger" );
    level._id_6F7C _id_A5A4::_id_309A();
    level.breacher _id_A5A4::_id_309A();
    thread dialog_clear_on_hq_breach();
    level endon( "on_stairs" );
    var_9 = getent( "vasquez_in_pos", "targetname" );
    var_9 waittill( "trigger" );
    wait 2;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "jacksonpoint" );
    common_scripts\utility::_id_383F( "aa_hq_fight" );
}

dialog_clear_on_hq_breach()
{
    common_scripts\utility::_id_384A( "hq_breach_enemies_dead" );
    level.breacher _meth_809C( "armada_gm1_clear" );
}

breach_dialog( var_0 )
{
    level._id_6F7C _meth_809C( "armada_vsq_sidedoorbreach" );
    var_0 waittill( "detpack_about_to_blow" );
    wait 1;
    level._id_6F7C _meth_809C( "armada_vsq_blowcharge" );
    wait 2;
    level.breacher _meth_809C( "armada_gm1_breaching" );
    wait 1;
    level._id_6F7C _meth_809C( "armada_vsq_gogogo" );
}

price_think()
{
    level._id_6F7C = self;
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread _id_A5A4::_id_58D7();
    level._id_6F7C._id_020C = 50;
}

griggs_think()
{
    level.griggs = self;
    level.griggs._id_0C72 = "griggs";
    level.griggs thread _id_A5A4::_id_58D7();
}

_id_17BA()
{
    level.breacher = self;
    level.breacher thread _id_A5A4::_id_58D7();
    level.breacher._id_020C = 50;
    common_scripts\utility::_id_384A( "hq_cleared" );
    wait 0.1;
    level.breacher thread _id_A5A4::_id_8EA4();
}

hq_breachers_think()
{
    self._id_020C = 50;
}

technical_setup()
{
    var_0 = getent( "technical_setup", "targetname" );
    var_0 waittill( "trigger" );
    wait 1;
    var_1 = getent( "canal_technical", "targetname" );
    var_2 = var_1._id_555C;

    if ( !isdefined( var_2 ) )
    {

    }

    var_2._id_5BD5[0] _meth_8067( "manual_ai" );
    var_2._id_5BD5[0] _meth_8108( level.player_heli );
    var_2 waittill( "start_vehiclepath" );
    var_2._id_5BD5[0] _meth_80E4();
    wait 8;
    var_2 delete();
    maps\armada_code::init_pickup_technical();
}

_id_7665()
{
    var_0 = getentarray( "rpg_guy", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_02E6 = 1;

    for (;;)
    {
        var_0 = getentarray( "rpg_guy", "script_noteworthy" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( !_func_1A1( var_0[var_1] ) )
                continue;

            var_2 = common_scripts\utility::_id_3F33( var_0[var_1]._id_02E2, level._id_4816 );
            var_3 = _func_0EE( var_2._id_02E2, var_0[var_1]._id_02E2 );

            if ( var_3 < 2500 && var_0[var_1]._id_02E6 )
            {
                var_0[var_1] _meth_816B( var_2 );
                var_0[var_1]._id_02E6 = 0;
                var_0[var_1] thread kill_in_ten();
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

kill_in_ten()
{
    common_scripts\utility::_id_3856( "kill_rpgs", 10 );

    if ( _func_1A1( self ) )
        self _meth_8053( self._id_01E6 + 100, self._id_02E2 );
}

helis_move()
{
    thread _id_A5A8::_id_427A( self );
}

helis_move2()
{
    var_0 = undefined;

    if ( isdefined( self._id_04A4 ) )
        var_0 = getent( self._id_04A4, "targetname" );
    else
    {

    }

    var_1 = 0;
    var_2 = [];

    while ( isdefined( var_0 ) )
    {
        var_2[var_1] = var_0;
        var_1++;

        if ( isdefined( var_0._id_04A4 ) )
        {
            var_0 = getent( var_0._id_04A4, "targetname" );
            continue;
        }

        break;
    }

    var_3 = 512;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( isdefined( var_2[var_4]._id_0351 ) )
            var_3 = var_2[var_4]._id_0351;

        self _meth_8256( 400 );
        var_5 = 0;

        if ( isdefined( var_2[var_4]._id_7AE5 ) )
            var_5 = var_2[var_4]._id_7AE5;

        self _meth_8257( var_2[var_4]._id_02E2, var_5 );
        self waittill( "near_goal" );
    }
}

_id_2674( var_0 )
{
    while ( isdefined( self._id_7A99 ) )
        wait 0.05;
}

set_threatbias_group( var_0 )
{
    self _meth_817B( var_0 );
}

get_living( var_0 )
{
    var_1 = 0;
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( _func_1A1( var_0[var_3] ) )
        {
            var_2[var_1] = var_0[var_3];
            var_1++;
        }
    }

    return var_2;
}

circling_helis_rpg_guy_think()
{
    while ( _func_1A1( self ) )
    {
        var_0 = common_scripts\utility::_id_3F33( self._id_02E2, level.circling_helis );
        self _meth_816B( var_0 );
        wait 1;
    }
}

helicopter_residual_dust()
{
    self waittill( "unloading" );
    common_scripts\_exploder::_id_3528( "heli_residual_rooftop" );
    wait 20;
    _id_A5A4::_id_8E7E( "heli_residual_rooftop" );
}

kill_during_breach( var_0, var_1 )
{
    var_2 = getentarray( "hq_breach_enemies", "script_noteworthy" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !_func_0CF( var_2[var_3] ) )
            continue;

        var_2[var_3] _meth_8053( var_2[var_3]._id_01E6 + 100, var_2[var_3]._id_02E2 );
        var_2[var_3] animscripts\face::_id_7824( "death" );
        wait 0.3;
    }
}

achieve_tvs()
{
    level.tv_count = 0;
    var_0 = getentarray( "interactive_tv", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2._id_029C == "com_tv1" )
        {
            level.tv_count++;
            var_2.isachievementtv = 1;
        }
    }

    if ( getdvar( "tv_helper" ) != "off" )
        common_scripts\utility::_id_0D13( var_0, ::tv_helper );

    level.tvhook = ::achieve_tvs_hook;
}

tv_helper()
{
    if ( self._id_029C == "com_tv1" )
        _id_A5A4::_id_2DBB( level._id_0318, self, 1, 1, 0, self, "tv_done" );
}

achieve_tvs_hook()
{
    if ( !isdefined( self.isachievementtv ) )
        return;

    level.tv_count--;
    self notify( "tv_done" );

    if ( !level.tv_count )
        _id_A5A4::_id_41DD( "YOUR_SHOW_SUCKS" );
}

remove_non_cinematic_tvs_from_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_029C != "com_tv1_cinematic" )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

tirefire_fx()
{
    var_0 = common_scripts\utility::_id_8959();
    var_0._id_02E2 = self._id_02E2;
    var_0.angles = self.angles;
    playfxontag( common_scripts\utility::_id_3FA8( "tire_fire" ), var_0, "tag_origin" );
    var_0 _id_A5A4::_id_6976( "armada_tire_fire", "tag_origin", 1, 1 );
}

damage_on()
{
    self _meth_82BC( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" )
            self _meth_82BE( self._id_02E2, ( 0, 0, 0 ) );

        wait 0.01;
    }
}

teleport_on_distance( var_0, var_1 )
{
    var_2 = _func_0F0( level._id_0318._id_02E2, var_0._id_02E2 );

    if ( var_2 > 640000 )
    {
        var_3 = _func_0C3( var_1, "targetname" );
        var_0 _meth_81CA( var_3._id_02E2, var_3.angles );
    }
}

override_lighting_lobby()
{
    var_0 = getent( "news_room_exit_door", "targetname" );
    var_1 = _func_0C3( "door_shadow_pos", "targetname" );
    var_2 = _func_0C3( "door_shadow_pos2", "targetname" );
    var_3 = getent( "trigger_inside_lobby", "targetname" );
    var_0 _meth_8477( var_1._id_02E2 );
    var_3 waittill( "trigger" );
    var_0 _meth_8477( var_2._id_02E2 );
}

tv_station_reset_friendlyfire()
{
    common_scripts\utility::_id_384A( "in_tv_station_lighting_zone_1" );

    if ( isdefined( level._id_0318._id_669E ) )
        level._id_0318._id_669E = 0;
}

server_blinking_lights()
{
    for (;;)
    {
        if ( _func_0F0( self._id_02E2, level._id_0318._id_02E2 ) < 1000000 )
        {
            var_0 = _func_0B5( 0.07, 0.15 );
            self _meth_8468( "mtl_lab_server_rack_modular", "mtl_lab_server_rack_modular_off" );
            wait(var_0);
            self _meth_8469();
            wait(var_0);
        }

        wait 0.1;
    }
}

set_model_function( var_0 )
{
    self _meth_80B3( var_0 );
}

bright_tv()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = self;

    if ( isdefined( var_2._id_7A99 ) )
    {
        if ( var_2._id_7A99 == "brighter_tv" )
            var_1 = "bright";
        else if ( var_2._id_7A99 == "darker_tv" )
            var_1 = "darker";
    }

    if ( isdefined( var_1 ) )
    {
        var_3 = 1000000;

        for (;;)
        {
            var_0 = _func_0F0( var_2._id_02E2, level._id_0318._id_02E2 );

            if ( var_0 < var_3 )
            {
                var_2 _meth_8468( "cinematic_3d", "cinematic_3d_" + var_1 + "_armada" );
                break;
            }

            wait 0.5;
        }
    }
}

ending_asad_usbkey_think()
{
    var_0 = getent( "final_breach_anim_ent", "targetname" );
    var_1 = _id_A5A4::_id_88D1( "asad_usbkey" );
    var_0 _id_A510::_id_0BC7( var_1, "enter" );
    level waittill( "trash_asad_usb" );
    var_0 thread _id_A510::_id_0C24( var_1, "enter" );
    level waittill( "grounded_asad_usb" );
    wait 0.35;
    var_1 delete();
}

ending_griggs_usbkey_think( var_0 )
{
    var_1 = spawn( "script_model", var_0 _meth_8184( "tag_weapon_chest" ) );
    var_1.angles = var_0 _meth_8185( "tag_weapon_chest" );
    var_1 _meth_80B3( "h1_me_armada_usb_device" );
}

officelight_intensity()
{
    self _meth_82BC( 1 );
    self waittill( "damage" );
    var_0 = getentarray( "officelight", "targetname" );
    var_1 = undefined;

    if ( level.office_tvs.size == 5 )
        var_1 = 1000;
    else if ( level.office_tvs.size <= 3 )
        var_1 = 300;

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_1 ) )
            var_3 _meth_81E2( var_1 );
    }

    level.office_tvs = common_scripts\utility::_id_0CF6( level.office_tvs, self );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\coup_fx::main();
    maps\createart\coup_art::main();
    maps\coup_precache::main();
    _id_A550::main();
    maps\createfx\coup_audio::main();
    maps\coup_anim::main();
    thread maps\coup_amb::main();
    maps\coup_lighting::main();
    player_start();
}

player_start()
{
    level._id_0318 _meth_8335( ( 48, -618, 0 ) );
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    precachemodel( "fx" );
    precachemodel( "viewhands_player_usmc" );
    precachemodel( "weapon_desert_eagle_silver_HR_promo" );
    precachemodel( "com_door_01_handleright" );
    precachemodel( "chicken" );
    precachemodel( "com_cellphone_on" );
    precachemodel( "com_trashcan_metal" );
    precachemodel( "com_spray_can01" );
    precachemodel( "helmet_sp_arab_regular_suren" );
    precachemodel( "prop_price_cigar" );
    precacheshellshock( "coup_blackout1" );
    precacheshellshock( "coup_blackout2" );
    precacheshellshock( "coup_blackout3" );
    precacheshellshock( "coup_death" );
    initsubtitles();
    level.debug_turnanims = 0;
    level.debug_passengeranims = 0;
    level.debug_slowmo = 0;
    level.debug_speech = 0;
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_ak74u_clip";
    level.mig29_near_distance_override = 11880;
    _id_A5A4::_id_278B( ::startintro );
    _id_A5A4::_id_079C( "drive", ::startdrive, &"STARTS_DRIVE" );
    _id_A5A4::_id_079C( "doorkick", ::startdoorkick, &"STARTS_DOORKICK" );
    _id_A5A4::_id_079C( "trashstumble", ::starttrashstumble, &"STARTS_TRASHSTUMBLE" );
    _id_A5A4::_id_079C( "runners2", ::startrunners2, &"STARTS_RUNNERS2" );
    _id_A5A4::_id_079C( "alley", ::startalley, &"STARTS_ALLEY2" );
    _id_A5A4::_id_079C( "shore", ::startshore, &"STARTS_SHORE" );
    _id_A5A4::_id_079C( "carexit", ::startcarexit, &"STARTS_CAREXIT" );
    _id_A5A4::_id_079C( "ending", ::startending, &"STARTS_END" );
    maps\coup_precache::main();
    animscripts\dog\dog_init::_id_4DAB();
    maps\coup_fx::main();
    maps\createart\coup_art::main();
    _id_A550::main();
    maps\createfx\coup_audio::main();
    maps\coup_anim::main();
    thread maps\coup_amb::main();
    maps\coup_lighting::main();
    maps\coup_aud::main();
    _id_A52E::init();
    _id_A52C::init();
    maps\coup_code::deletecharactertriggers();
    common_scripts\utility::_id_0D13( _func_1ED( "plane_sound", "script_noteworthy" ), _id_A632::_id_6877 );
    common_scripts\utility::_id_0D13( getentarray( "civilian", "script_noteworthy" ), _id_A5A4::_id_0798, ::removeweapon );
    common_scripts\utility::_id_0D13( getentarray( "civilian_redshirt", "script_noteworthy" ), _id_A5A4::_id_0798, ::setsightdist, 0 );
    common_scripts\utility::_id_0D13( getentarray( "civilian_redshirt", "script_noteworthy" ), _id_A5A4::_id_0798, ::_id_8027, "allies" );
    common_scripts\utility::_id_0D13( getentarray( "civilian_redshirt", "script_noteworthy" ), _id_A5A4::_id_0798, ::removeweapon );
    common_scripts\utility::_id_0D13( getentarray( "civilian_attacker", "script_noteworthy" ), _id_A5A4::_id_0798, ::_id_8027, "allies" );
    common_scripts\utility::_id_0D13( getentarray( "civilian_firingsquad", "script_noteworthy" ), _id_A5A4::_id_0798, ::_id_8027, "allies" );
    common_scripts\utility::_id_0D13( getentarray( "loudspeaker_event", "targetname" ), ::loudspeaker_event );
    common_scripts\utility::_id_0D13( getentarray( "delete_on_goal", "script_noteworthy" ), _id_A5A4::_id_0798, maps\coup_code::deleteongoal );
    common_scripts\utility::_id_0D13( getentarray( "intro_crowdmember", "targetname" ), ::blah );
    common_scripts\utility::_id_0D13( getentarray( "endcrowd_crowdmember", "targetname" ), ::blah );
    common_scripts\utility::_id_0D13( getentarray( "endcrowd_crowdwitness_gunup", "targetname" ), ::blah );
    common_scripts\utility::_id_383D( "drive" );
    common_scripts\utility::_id_383D( "doors_open" );
    common_scripts\utility::_id_383D( "ending" );
    common_scripts\utility::_id_383D( "firingsquad_atnodes" );
    common_scripts\utility::_id_383D( "firingsquad_aiming" );
    common_scripts\utility::_id_383D( "start_dragged_aftercarexit" );
    common_scripts\utility::_id_383D( "stop_car_ride" );
    _id_A5A4::_id_1332( "allies" );
    _id_A5A4::_id_1332( "axis" );
    _id_A5A4::_id_1332( "neutral" );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_830D();
    level._id_0318._id_01FF = 1;
    level._id_0318 _meth_80F1();
    level._id_0318 _meth_811D( 0 );
    level.playerview = _id_A5A4::_id_88D1( "playerview" );
    level.handsrope = _id_A5A4::_id_88D1( "rope_hands" );
    level.handsrope _meth_8056();
    level.car = _id_A5A4::_id_88D1( "car" );
    level.car._id_0C78 = 1;
    _id_A5E8::_id_870C( "aud_car_sound_node_spawner" );
    level.car_idle_engine_sound_node _meth_8077( "scn_coup_car_idle_engine" );
    level.car_idle_engine_sound_node _meth_8071( 0.71, 0 );
    level.car_idle_engine_sound_node _meth_806F( 0.85, 0 );
    var_0 = common_scripts\utility::_id_8959();
    var_0 _meth_804F( level.car, "body_animate_jnt", ( 0, 0, 43.2 ), ( 125, 0, 90 ) );
    playfxontag( level._id_058F["car_interior"], var_0, "tag_origin" );
    var_0 thread _id_A526::_id_2DE8( "tag_origin", ( 0, 1, 0 ) );
    playfxontag( level._id_058F["steam_coffee_slow_coup"], level.car, "body_animate_jnt" );
    wait 0.05;
    _func_0D6( "g_friendlyfiredist", 0 );
    _func_0D6( "g_friendlynamedist", 0 );
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", 1 );
    _func_0D6( "hud_showStance", 0 );
    level.cinematicvar = getdvar( "cg_cinematicFullScreen" );
    _id_A5A4::enable_scuff_footsteps_sound( 0 );
}

startintro()
{
    _id_A5E8::_id_870C( "start_intro_checkpoint" );
    thread _id_4DA6();
    thread intro_doors();
    thread execintro();
}

startdrive()
{
    _id_A5E8::_id_870C( "start_drive_checkpoint" );
    thread execdrive( 0 );
    common_scripts\utility::_id_383F( "drive" );
}

startdoorkick()
{
    _id_A5E8::_id_870C( "start_doorkick_checkpoint" );
    thread execdrive( 0.15 );
    common_scripts\utility::_id_383F( "drive" );
}

starttrashstumble()
{
    _id_A5E8::_id_870C( "start_trashstumble_checkpoint" );
    var_0 = getent( "start_trashstumble", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    thread execdrive( 0.32 );
    common_scripts\utility::_id_383F( "drive" );
}

startrunners2()
{
    _id_A5E8::_id_870C( "start_runners2_checkpoint" );
    thread execdrive( 0.45 );
    common_scripts\utility::_id_383F( "drive" );
}

startalley()
{
    _id_A5E8::_id_870C( "start_alley_checkpoint" );
    var_0 = getent( "start_alley", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    thread execdrive( 0.55 );
    common_scripts\utility::_id_383F( "drive" );
}

startshore()
{
    _id_A5E8::_id_870C( "start_shore_checkpoint" );
    var_0 = getent( "start_shore", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    thread execdrive( 0.8 );
    common_scripts\utility::_id_383F( "drive" );
}

startcarexit()
{
    _id_A5E8::_id_870C( "start_carexit_checkpoint" );
    var_0 = getent( "start_carexit", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    thread execdrive( 0.88 );
    common_scripts\utility::_id_383F( "drive" );
}

startending()
{
    _id_A5E8::_id_870C( "start_ending_checkpoint" );
    var_0 = getent( "start_ending", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    thread execending();
}

blah()
{
    self waittill( "drone_spawned", var_0 );
    var_0 thread crowdmember_setuptriggers();
    var_0 _meth_80C0( 0 );
}

execintro()
{
    level.coup_kaa_onenation_timing = 4;
    level.coup_kaa_newera_timing = 35;
    level.coup_kaa_selfinterest_timing = 66;
    level.coup_kaa_notenslaved_timing = 99;
    level.coup_kaa_donotfear_timing = 140;
    level.coup_kaa_freefromyoke_timing = 154;
    level.coup_kaa_armiesstrong_timing = 176;
    level.coup_kaa_greatnation_timing = 182;
    level.coup_kaa_begun_timing = 204.5;
    thread execdrive();
    thread intro_speech();
    thread _id_6A3A();
    thread subtitlesequence();
    thread coupintro_depthoffield();
    thread h1_drive_shakesandrumblescarride();
    _id_A5A4::_id_27EF( 0.5, maps\coup_aud::aud_music_handler );
    _id_A5A4::_id_27EF( 0.5, ::openintrodoors );
    _id_A5A4::_id_27EF( 5, ::_id_4EED );
    _id_A5A4::_id_27EF( 1, ::ziptie, "ziptie1a", undefined, 45 );
    _id_A5A4::_id_27EF( 1, _id_A5A8::_id_8979, "intro_heli" );
    thread playmirrorvideo();
    level.oldnearclip = getdvar( "r_znear" );
    _func_0D6( "r_znear", 2.0 );
    var_0 = getent( "car_events_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "intro_leftguard", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "intro_rightguard", "targetname", 1 );
    var_3 = maps\coup_code::scripted_spawn2( "intro_carguard", "targetname", 1 );
    var_4 = maps\coup_code::scripted_spawn2( "intro_radioguard", "targetname", 1 );
    var_5 = maps\coup_code::scripted_spawn2( "intro_smokingguard", "targetname", 1 );
    var_6 = maps\coup_code::scripted_spawn2( "intro_dog", "targetname", 1 );
    var_7 = maps\coup_code::scripted_spawn2( "intro_idleguards_left", "targetname", 1 );
    var_8 = maps\coup_code::scripted_spawn2( "intro_idleguards_right", "targetname", 1 );
    level.leftguard = var_1;
    var_7 thread maps\coup_code::opfor_swaphead_for_facialanim();
    var_8 thread maps\coup_code::opfor_swaphead_for_facialanim();
    var_4 thread maps\coup_code::opfor_swaphead_for_facialanim();
    _id_A5A4::_id_27EF( 50, maps\coup_code::deleteentity, var_6 );
    var_9 = maps\coup_code::scripted_array_spawn( "intro_crowdmember", "targetname", 1 );

    for ( var_10 = 0; var_10 < var_9.size; var_10++ )
    {
        var_9[var_10]._id_0C72 = "human";
        var_9[var_10].a = spawnstruct();
        var_9[var_10].a._id_A2E2["right"] = "defined";
        var_9[var_10] thread celebrate();
    }

    var_11 = maps\coup_code::scripted_array_spawn( "intro_tiedcivilian", "targetname", 1 );

    for ( var_10 = 0; var_10 < var_11.size; var_10++ )
        thread ziptied( var_11[var_10], 45 );

    var_12 = maps\coup_code::scripted_array_spawn( "intro_eatingdogs", "targetname", 1 );

    for ( var_10 = 0; var_10 < var_12.size; var_10++ )
    {
        var_13 = var_12[var_10];
        var_13._id_0C72 = "dog";
        var_13 thread _id_A510::_id_0BE1( var_13, "eating" );
        _id_A5A4::_id_27EF( 50, maps\coup_code::deleteentity, var_13 );
    }

    var_2._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_4._id_0C72 = "human";
    var_5._id_0C72 = "human";
    var_6._id_0C72 = "dog";
    var_7._id_0C72 = "human";
    var_8._id_0C72 = "human";
    var_5 thread _id_A573::_id_0DDC();
    var_5 thread _id_A510::_id_0BE1( var_5, "leaning_smoking_idle" );
    var_6 thread start_dog();
    var_0 _id_A510::_id_0BC7( level.playerview, "intro" );
    var_0 thread _id_A510::_id_0BC7( level.car, "intro" );
    level._id_0318 _meth_807F( level.playerview, "tag_player", 1 );
    thread h1_couplerpviewangles( "intro" );
    var_0 thread _id_A510::_id_0C24( var_2, "intro_rightguard" );
    var_0 thread _id_A510::_id_0C24( var_1, "intro_leftguard" );
    var_0 thread _id_A510::_id_0C24( level.car, "intro" );
    var_0 thread _id_A510::_id_0C24( var_7, "intro_idle_soldier_left" );
    var_0 thread _id_A510::_id_0C24( var_8, "intro_idle_soldier_right" );
    var_0 thread _id_A510::_id_0C24( var_4, "intro_spittingguard" );
    var_0 thread _id_A510::_id_0C24( level.car.passenger, "intro_carpassenger" );
    var_0 thread _id_A510::_id_0C24( level.car._id_2E04, "intro_cardriver" );
    var_0 thread _id_A510::_id_0C24( level.playerview, "intro" );
    var_0 thread maps\coup_code::play_anim_on_ropehands( "intro", 0 );
    wait 32.9;
    var_2 thread _id_A5A4::_id_69C4( "coup_ab1_move_generic_custom" );
    common_scripts\utility::_id_383F( "drive" );
}

h1_couplerpviewangles( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    switch ( var_0 )
    {
        case "intro":
            var_1 = 1;
            var_2 = 45;
            var_3 = 45;
            var_4 = 30;
            var_5 = 30;
            break;
        case "pushed_inside":
            var_1 = 2;
            var_2 = 0;
            var_3 = 0;
            var_4 = 0;
            var_5 = 0;
            break;
        case "viktor_stare":
            var_1 = 1;
            var_2 = 35;
            var_3 = 35;
            var_4 = 5;
            var_5 = 5;
            break;
        case "pre_car_ride":
            var_1 = 2;
            var_2 = 85;
            var_3 = 85;
            var_4 = 5;
            var_5 = 5;
            break;
        case "car_ride":
            thread h1_couplerpviewangles_carridelogic();
            break;
        case "car_stops":
            var_1 = 2.0;
            var_2 = 150;
            var_3 = 150;
            var_4 = 15;
            var_5 = -10;
            break;
        case "pulled":
            var_1 = 3.75;
            var_2 = 0;
            var_3 = 0;
            var_4 = 0;
            var_5 = 0;
            break;
        case "corridors1":
            var_1 = 0;
            var_2 = 45;
            var_3 = 45;
            var_4 = 30;
            var_5 = 30;
            break;
        case "corridors_zak":
            var_1 = 4;
            var_2 = 0;
            var_3 = 0;
            var_4 = 5;
            var_5 = -5;
            break;
        case "meet_zak":
            var_1 = 0;
            var_2 = 0;
            var_3 = 0;
            var_4 = 0;
            var_5 = 0;
            break;
        case "dragged_post":
            var_1 = 2;
            var_2 = 30;
            var_3 = 30;
            var_4 = 20;
            var_5 = 20;
            break;
        case "turned_post":
            var_1 = 2;
            var_2 = 0;
            var_3 = 0;
            var_4 = 0;
            var_5 = 0;
            break;
        case "gun_exchange":
            var_1 = 2;
            var_2 = 18;
            var_3 = 18;
            var_4 = 15;
            var_5 = 15;
            break;
        case "alasad_shoot":
            var_1 = 3.5;
            var_2 = 0;
            var_3 = 0;
            var_4 = 0;
            var_5 = 0;
            break;
    }

    if ( var_0 != "car_ride" )
    {
        level._id_0318 _meth_80A4( var_1, 0, 0, var_3, var_2, var_4, var_5 );
        wait(var_1);
    }
}

h1_couplerpviewangles_carridelogic()
{
    var_0 = 0.0;
    var_1 = 0.05;
    var_2 = ( 0, 0, 0 );
    var_3 = ( 0, 0, 0 );
    var_4 = 0;
    var_5 = 150;
    var_6 = 150;
    var_7 = 30;
    var_8 = -13;
    var_9 = 42;
    var_10 = ( var_5 + var_6 ) / 2;

    for ( var_11 = var_9 - var_8; var_0 >= 0; var_0 += var_1 )
    {
        if ( common_scripts\utility::_id_382E( "stop_car_ride" ) )
            break;

        var_12 = level.car _meth_8184( "tag_wheel_front_left" );
        var_13 = level.car _meth_8184( "tag_wheel_back_left" );
        var_2 = var_12 - var_13;
        var_2 = _func_114( var_2 );
        var_3 = level._id_0318 _meth_8338();
        var_3 = anglestoforward( var_3 );
        var_3 = _func_114( var_3 );
        var_14 = _func_1F4( var_3[1], var_3[0] ) - _func_1F4( var_2[1], var_2[0] );
        var_14 = _func_0EB( var_14 );
        var_14 = _func_0BE( var_14 );
        var_15 = _func_0B7( var_14 / var_10 * 180 );
        var_16 = ( var_15 / 2 + 0.5 ) * var_11 + var_8;
        level._id_0318 _meth_80A4( var_4, 0, 0, var_5, var_6, var_7, var_16 );
        wait(var_1);
    }
}

coupintro_depthoffield()
{
    level._id_0318 _meth_84A7( 6.0, 110, 9.0, 9.0 );
    level._id_0318 _meth_84A5();
    _func_0D6( "r_mbenable", 2 );
    wait 15.5;
    thread h1_couplerpviewangles( "pushed_inside" );
    level._id_0318 _meth_84A7( 6.0, 110, 1.0, 1.0 );
    wait 4.0;
    wait 0.65;
    level._id_0318 _meth_84A7( 3.0, 4, 2.0, 2.0 );
    wait 0.85;
    level._id_0318 _meth_84A7( 6.0, 110, 3.0, 3.0 );
    wait 1.35;
    level._id_0318 _meth_84A7( 4.0, 70, 1.0, 1.0 );
    wait 1.0;
    level._id_0318 _meth_84A7( 1.0, 110, 8.0, 8.0 );
    wait 1.65;
    level._id_0318 _meth_84A7( 5.0, 80, 1.5, 1.5 );
    h1_couplerpviewangles( "viktor_stare" );
    wait 2.0;
    _func_0D6( "r_mbenable", 0 );
    level._id_0318 _meth_84A7( 5.2, 40, 1.0, 1.0 );
    wait 3.35;
    level._id_0318 _meth_84A7( 5.5, 110, 1.0, 1.0 );
    h1_couplerpviewangles( "pre_car_ride" );
    wait 2.0;
    h1_drive_depthoffieldforcestart();
}

h1_drive_shakesandrumblescarride()
{
    wait 0.45;
    _id_A5A4::_id_27EF( 1.65, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 2.05, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 2.35, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 2.55, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 8.55, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 8.85, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 9.15, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 9.35, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 14.55, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 14.95, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 17.55, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 18.35, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 19.75, ::h1_drive_shakesandrumbleslogic, "push" );
    _id_A5A4::_id_27EF( 25.1, ::h1_drive_shakesandrumbleslogic, "door" );
    _id_A5A4::_id_27EF( 26.0, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 26.35, ::h1_drive_shakesandrumbleslogic, "tap" );
    common_scripts\utility::_id_384A( "drive" );
    _id_A5A4::_id_27EF( 0.05, ::h1_drive_shakesandrumbleslogic, "car_rumble_start" );
    _id_A5A4::_id_27EF( 0.5, ::h1_drive_roadrumble, "normal", 17.15 );
    _id_A5A4::_id_27EF( 17.65, ::h1_drive_roadrumble, "normal_turn", 14.5 );
    _id_A5A4::_id_27EF( 22.15, ::h1_drive_roadrumble, "noisy", 8.65 );
    _id_A5A4::_id_27EF( 30.85, ::h1_drive_roadrumble, "normal", 20.0 );
    _id_A5A4::_id_27EF( 50.85, ::h1_drive_roadrumble, "normal_turn", 3.5 );
    _id_A5A4::_id_27EF( 54.35, ::h1_drive_roadrumble, "normal", 1.65 );
    _id_A5A4::_id_27EF( 58.5, ::h1_drive_roadrumble, "normal", 6.0 );
    _id_A5A4::_id_27EF( 64.5, ::h1_drive_roadrumble, "normal_turn", 3.65 );
    _id_A5A4::_id_27EF( 68.15, ::h1_drive_roadrumble, "noisy", 25.65 );
    _id_A5A4::_id_27EF( 93.85, ::h1_drive_roadrumble, "noisy_turn", 4.5 );
    _id_A5A4::_id_27EF( 98.35, ::h1_drive_roadrumble, "garbage", 34.65 );
    _id_A5A4::_id_27EF( 133.0, ::h1_drive_roadrumble, "normal", 29.15 );
    _id_A5A4::_id_27EF( 4.7, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 6.6, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 11.35, ::h1_drive_shakesandrumbleslogic, "slope_in" );
    _id_A5A4::_id_27EF( 12.75, ::h1_drive_shakesandrumbleslogic, "slope_out" );
    _id_A5A4::_id_27EF( 19.0, ::h1_drive_shakesandrumbleslogic, "wheelturn" );
    _id_A5A4::_id_27EF( 20.85, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 30.85, ::h1_drive_shakesandrumbleslogic, "slope_out" );
    _id_A5A4::_id_27EF( 40.15, ::h1_drive_shakesandrumbleslogic, "slope_out" );
    _id_A5A4::_id_27EF( 51.15, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 55.7, ::h1_drive_shakesandrumbleslogic, "braking" );
    _id_A5A4::_id_27EF( 57.0, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 57.15, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 57.6, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 57.9, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 61.35, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 62.0, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 98.35, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 95.7, ::h1_drive_shakesandrumbleslogic, "wheelturn" );
    _id_A5A4::_id_27EF( 97.6, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 99.0, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 113.0, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 118.05, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 134.0, ::h1_drive_shakesandrumbleslogic, "wheelturn" );
    _id_A5A4::_id_27EF( 135.5, ::h1_drive_shakesandrumbleslogic, "wheelturn" );
    _id_A5A4::_id_27EF( 137.9, ::h1_drive_shakesandrumbleslogic, "wheelturn" );
    _id_A5A4::_id_27EF( 145.0, ::h1_drive_shakesandrumbleslogic, "wheelturn" );
    _id_A5A4::_id_27EF( 148.85, ::h1_drive_shakesandrumbleslogic, "smallturn" );
    _id_A5A4::_id_27EF( 161.85, ::h1_drive_shakesandrumbleslogic, "braking" );
    _id_A5A4::_id_27EF( 162.5, ::h1_drive_shakesandrumbleslogic, "smallturn" );
}

h1_dragout_shakesandrumble()
{
    _id_A5A4::_id_27EF( 1.85, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 5.1, ::h1_drive_shakesandrumbleslogic, "door" );
    _id_A5A4::_id_27EF( 5.1, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 6.65, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 7.0, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 7.5, ::h1_drive_shakesandrumbleslogic, "push" );
    _id_A5A4::_id_27EF( 8.15, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 8.55, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 9.2, ::h1_drive_shakesandrumbleslogic, "push" );
    _id_A5A4::_id_27EF( 9.6, ::h1_drive_shakesandrumbleslogic, "tap" );
    _id_A5A4::_id_27EF( 13.3, ::h1_drive_shakesandrumbleslogic, "struggle" );
}

h1_corridors_shakesandrumble()
{
    _id_A5A4::_id_27EF( 2.25, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 2.55, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 2.85, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 9.1, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 9.45, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 9.75, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 10.0, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 15.25, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 15.55, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 15.85, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 16.05, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 22.1, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 22.4, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 22.7, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 22.95, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
}

h1_meetzak_shakesandrumble()
{
    _id_A5A4::_id_27EF( 1.85, ::h1_drive_shakesandrumbleslogic, "touch" );
    _id_A5A4::_id_27EF( 2.45, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 8.75, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 9.5, ::h1_drive_shakesandrumbleslogic, "push" );
    _id_A5A4::_id_27EF( 15.5, ::h1_drive_shakesandrumbleslogic, "door" );
    _id_A5A4::_id_27EF( 15.85, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
    _id_A5A4::_id_27EF( 18.0, ::h1_drive_shakesandrumbleslogic, "door" );
    _id_A5A4::_id_27EF( 18.15, ::h1_drive_shakesandrumbleslogic, "struggle" );
    _id_A5A4::_id_27EF( 18.3, ::h1_drive_shakesandrumbleslogic, "struggle_low" );
}

h1_drive_roadrumble( var_0, var_1 )
{
    var_2 = 0;
    var_3 = "";

    switch ( var_0 )
    {
        case "normal":
            var_2 = 10;
            var_3 = "road_normal";
            break;
        case "normal_turn":
            var_2 = 13;
            var_3 = "road_normal";
            break;
        case "noisy":
            var_2 = 15;
            var_3 = "road_noisy";
            break;
        case "noisy_turn":
            var_2 = 18;
            var_3 = "road_noisy";
            break;
        case "garbage":
            var_2 = 22;
            var_3 = "road_garbage";
            break;
        case "garbage_turn":
            var_2 = 25;
            var_3 = "road_garbage";
            break;
    }

    var_4 = 0.0;
    var_5 = 0.1;
    var_6 = 0.0;
    var_7 = 0.5;

    for ( var_8 = 0; var_4 <= var_1; var_4 += var_5 )
    {
        var_9 = _func_0B4( 0, 100 );

        if ( var_9 < var_2 )
            var_8 = 1;
        else
            var_6 += var_5;

        if ( var_8 == 1 )
        {
            thread h1_drive_shakesandrumbleslogic( var_3 );

            if ( _func_0B4( 0, 2 ) == 1 && var_3 != "road_normal" )
            {
                _id_A5A4::_id_27EF( 0.15, ::h1_drive_shakesandrumbleslogic, "road_normal" );

                if ( _func_0B4( 0, 2 ) == 1 && var_3 != "road_noisy" )
                    _id_A5A4::_id_27EF( 0.35, ::h1_drive_shakesandrumbleslogic, "road_normal" );
            }

            var_8 = 0;
            var_6 = 0.0;
        }

        wait(var_5);
    }
}

h1_drive_shakesandrumbleslogic( var_0 )
{
    var_1 = "";
    var_2 = 0.0;
    var_3 = 0.0;
    var_4 = 0.0;
    var_5 = "";
    var_6 = 0.07;
    var_7 = 0.12;
    var_8 = 0.17;
    var_9 = level._id_0318 _meth_8097();

    switch ( var_0 )
    {
        case "struggle":
            var_1 = "normal";
            var_2 = var_7;
            var_3 = 0.5;
            var_5 = "damage_light";
            break;
        case "struggle_low":
            var_1 = "normal";
            var_2 = var_6;
            var_3 = 0.4;
            var_5 = "damage_light";
            break;
        case "push":
            var_1 = "fade";
            var_2 = var_7;
            var_3 = 0.8;
            var_5 = "damage_light";
            break;
        case "door":
            var_1 = "normal";
            var_2 = var_7;
            var_3 = 0.4;
            var_5 = "damage_light";
            break;
        case "tap":
            var_1 = "normal";
            var_2 = var_7;
            var_3 = 0.2;
            var_5 = "damage_light";
            break;
        case "car_rumble_start":
            var_1 = "fade";
            var_2 = var_8;
            var_3 = 2.0;
            var_5 = "tank_rumble";
            break;
        case "braking":
            var_1 = "normal";
            var_2 = var_8;
            var_3 = 1.0;
            var_5 = "damage_light";
            break;
        case "smallturn":
            var_1 = "fade";
            var_2 = var_7;
            var_3 = 0.4;
            var_4 = 1.2;
            var_5 = "tank_rumble";
            break;
        case "wheelturn":
            var_1 = "fade";
            var_2 = var_7;
            var_3 = 0.8;
            var_4 = 1.6;
            var_5 = "tank_rumble";
            break;
        case "slope_in":
            var_1 = "normal";
            var_2 = var_7;
            var_3 = 0.8;
            var_4 = 1.5;
            var_5 = "tank_rumble";
            break;
        case "slope_out":
            var_1 = "normal";
            var_2 = var_7;
            var_3 = 0.8;
            var_4 = 2.0;
            var_5 = "damage_light";
            break;
        case "default":
            iprintlnbold( "unrecognized shake" );
            break;
        case "road_normal":
            var_1 = "normal";
            var_2 = 0.1;
            var_3 = 0.05;
            var_4 = 0.4;
            var_5 = "tank_rumble";
            break;
        case "road_noisy":
            var_1 = "normal";
            var_2 = 0.12;
            var_3 = 0.05;
            var_4 = 0.5;
            var_5 = "tank_rumble";
            break;
        case "road_garbage":
            var_1 = "normal";
            var_2 = 0.14;
            var_3 = 0.05;
            var_4 = 0.9;
            var_5 = "tank_rumble";
            break;
    }

    if ( var_4 == 0.0 )
        var_4 = var_3;

    if ( var_1 == "normal" )
    {
        if ( var_5 != "" )
            level._id_0318 _meth_80AF( var_5 );

        _func_18C( var_2, var_4, var_9, 100 );
        wait(var_3);

        if ( var_5 == "tank_rumble" )
            level._id_0318 _meth_80B1( "tank_rumble" );
    }
    else if ( var_1 == "fade" )
    {
        if ( var_5 != "" )
            level._id_0318 _meth_80AF( var_5 );

        _func_18C( var_2 * 0.6, var_4 / 4.0, var_9, 10000 );
        wait(var_3 / 4.0);
        _func_18C( var_2 * 1.0, var_4 / 4.0, var_9, 10000 );
        wait(var_3 / 4.0);

        if ( var_5 == "tank_rumble" )
            level._id_0318 _meth_80B1( "tank_rumble" );

        _func_18C( var_2 * 0.5, var_4 / 4.0, var_9, 10000 );
        wait(var_3 / 4.0);
        _func_18C( var_2 * 0.2, var_4 / 4.0, var_9, 10000 );
        wait(var_3 / 4.0);
    }
}

start_dog()
{
    thread _id_A510::_id_0C24( self, "idle" );
    wait 10;
    thread _id_A510::_id_0BE1( self, "attackidle_growl", undefined, "stop_growl" );
    wait 3.5;
    self notify( "stop_growl" );
    thread _id_A510::_id_0BE1( self, "attackidle_bark", undefined, "stop_bark" );
    wait 0.5;
    self notify( "stop_bark" );
    thread _id_A510::_id_0C24( self, "idle" );
}

execdrive( var_0 )
{
    thread drive_talkingguards1();
    thread drive_casualguards1();
    thread drive_eatingdog1();
    thread drive_doorkick1();
    thread drive_ziptie1();
    thread drive_ziptie2();
    thread drive_ziptie3();
    thread drive_doorkick2();
    thread drive_runners1();
    thread drive_windowshout1();
    thread drive_gunpoint1();
    thread drive_interrogation1();
    thread drive_trashstumble();
    thread drive_casualguards2();
    thread drive_spraypaint1();
    thread drive_sneakattack();
    thread drive_ziptie4();
    thread drive_runners2();
    thread drive_garage2();
    thread drive_basehelicopters();
    thread drive_celebrators2();
    thread drive_casualguards3();
    thread drive_endcrowd();
    thread drive_fastrope1();
    thread drive_firingsquad();
    thread drive_ziptie5();
    thread drive_dogchase1();
    thread drive_carjack1();
    thread drive_dumpsterhide1();
    thread drive_phonering();
    thread drive_carsounds();
    thread drive_arrivewalla();
    thread animvarietyforshorerunners();
    thread animvarietyforalleyrunners();
    var_1 = maps\coup_code::scripted_spawn2( "car_driver", "targetname", 1 );
    var_1._id_0C72 = "human";
    var_1 _meth_804F( level.car, "tag_driver" );
    var_1 thread _id_A5A4::_id_58D7( 1 );
    var_1 removedroneweapon();
    var_2 = maps\coup_code::scripted_spawn2( "car_passenger", "targetname", 1 );
    var_2._id_0C72 = "human";
    var_2 _meth_804F( level.car, "tag_passenger" );
    var_2 thread _id_A5A4::_id_58D7( 1 );
    var_2.tracksuit_ignore = 1;
    level.car._id_2E04 = var_1;
    level.car.passenger = var_2;
    level.car._id_2E04._id_0C78 = 1;
    level.car.passenger._id_0C78 = 1;
    level.car.passenger._id_01E2 = spawn( "script_origin", level.car.passenger._id_02E2 + ( 20, 5, 50 ) );
    level.car.passenger.body = spawn( "script_origin", level.car.passenger._id_02E2 + ( 25, 12, 25 ) );
    level.car.passenger._id_67ED = spawn( "script_origin", level.car.passenger._id_02E2 + ( 22, 15, 35 ) );
    level.car.passenger._id_01E2 _meth_804F( level.car.passenger );
    level.car.passenger.body _meth_804F( level.car.passenger );
    level.car.passenger._id_67ED _meth_804F( level.car.passenger );
    level.car.playerview = level.playerview;
    common_scripts\utility::_id_384A( "drive" );
    level.handsrope thread maps\coup_code::update_handsrope_lighting_origin();
    thread h1_drive_depthoffieldforcestart();
    level.playerview _meth_804F( level.car, "tag_guy1" );
    level.car thread _id_A510::_id_0C24( level.playerview, "car_idle_fullbody" );
    level.car thread maps\coup_code::play_anim_on_ropehands( "car_idle_fullbody", 1 );
    var_3 = getent( "car_events_node", "targetname" );
    var_3 thread _id_A510::_id_0C24( level.car, "coup_car_driving" );

    if ( isdefined( var_0 ) )
    {
        var_4 = level.car _id_A5A4::_id_3EF5( "coup_car_driving" );
        level.car _meth_8119( var_4, var_0 );
    }

    if ( isdefined( var_0 ) )
        wait 0.1;

    level.car thread _id_A510::_id_0C24( level.car._id_2E04, "cardriver_fulldrive" );
    level.car thread _id_A510::_id_0C24( level.car.passenger, "carpassenger_fulldrive" );
    level._id_0318 _meth_807F( level.playerview, "tag_player", 1, 85, 85, 5, 5, 1 );
    thread h1_couplerpviewangles( "car_ride" );

    if ( isdefined( var_0 ) )
    {
        level.car thread _id_A510::_id_0C24( level.playerview, "car_idle_fullbody" );
        var_5 = [];
        var_5[0] = level.car._id_2E04;
        var_6 = [];
        var_6[0] = level.car.passenger;
        var_7 = [];
        var_7[0] = level.car.playerview;
        var_8 = [];
        var_8[0] = level.handsrope;
        _id_A5A4::_id_27EF( 0.05, _id_A510::_id_0C15, var_5, "cardriver_fulldrive", var_0 );
        _id_A5A4::_id_27EF( 0.05, _id_A510::_id_0C15, var_6, "carpassenger_fulldrive", var_0 );
        _id_A5A4::_id_27EF( 0.05, _id_A510::_id_0C15, var_7, "car_idle_fullbody", var_0 );
        _id_A5A4::_id_27EF( 0.05, _id_A510::_id_0C15, var_8, "car_idle_fullbody_ropehands", var_0 );
    }

    thread execcarexit();
}

h1_drive_depthoffieldforcestart()
{
    level._id_0318 _meth_84A7( 14.0, 50, 1.0, 1.0 );
    level._id_0318 _meth_84A5();
}

execcarexit()
{
    common_scripts\utility::_id_384A( "drive_carexit" );
    var_0 = getent( "carexit_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "carexit_leftguard", "targetname", 1 );
    var_1._id_0C72 = "human";
    var_0 _id_A510::_id_0BC7( var_1, "carexit_leftguard" );
    var_1 thread _id_A510::_id_0BE1( var_1, "stand_idle" );
    var_2 = maps\coup_code::scripted_spawn2( "carexit_rightguard", "targetname", 1 );
    var_2._id_0C72 = "human";
    var_0 _id_A510::_id_0BC7( var_2, "carexit_rightguard" );
    var_2 thread _id_A510::_id_0BE1( var_2, "stand_idle" );
    level.car waittillmatch( "single anim", "end" );
    var_0 thread _id_A510::_id_0C24( level.car._id_2E04, "carexit_driver" );
    var_0 thread _id_A510::_id_0C24( level.car.passenger, "carexit_passenger" );
    var_3 = _id_A5A4::_id_88D1( "playerview" );
    var_3 _meth_8056();
    var_0 _id_A510::_id_0BC7( var_3, "carexit" );
    thread h1_grabbedfromcar_depthoffield();
    thread h1_dragout_shakesandrumble();
    common_scripts\utility::_id_383F( "stop_car_ride" );
    thread h1_couplerpviewangles( "car_stops" );
    var_0 thread _id_A510::_id_0C24( var_1, "carexit_leftguard" );
    var_0 thread _id_A510::_id_0C24( var_2, "carexit_rightguard" );
    var_0 thread _id_A510::_id_0C24( level.car, "carexit" );
    var_4 = 2.2;
    _id_A5E8::_id_870C( "aud_shutoff_engine" );
    level.car thread _id_A510::_id_0C24( level.playerview, "carexit" );
    level.car thread maps\coup_code::play_anim_on_ropehands( "carexit", 0 );
    _id_A5A4::_id_27EF( 2, ::h1_couplerpviewangles, "pulled" );
    wait 4;
    common_scripts\utility::_id_383F( "music_part4" );
    wait(var_4);
    wait 6.8;
    level.car._id_2E04 _id_A5A4::_id_0C3D();
    level.car.passenger _id_A5A4::_id_0C3D();
    var_5 = _func_1A9();
    var_5._id_0530 = 0;
    var_5._id_0538 = 0;
    var_5 _meth_80CE( "black", 640, 480 );
    var_5.alignx = "left";
    var_5.aligny = "top";
    var_5._id_01F3 = "fullscreen";
    var_5._id_0501 = "fullscreen";
    var_5.alpha = 0;
    var_5._id_03D4 = 1;
    _func_05E();
    _func_0D6( "cg_cinematicFullScreen", level.cinematicvar );
    thread maps\coup_code::pulsefadevision( 26.95, 0 );
    _id_A5E8::_id_870C( "aud_exterior_to_bunker" );
    _id_A5A4::_id_27EF( 28.5, _id_A5E8::_id_870C, "aud_bunker_to_exterior" );
    level._id_0318 _meth_8186( "coup_blackout1", 8 );
    thread music_end();
    var_5 maps\coup_code::_id_148C( 1, 6 );
    var_6 = getent( "deleteai_special", "script_noteworthy" );
    var_6._id_02E2 = level._id_0318._id_02E2;
    wait 2;
    level notify( "handsrope_deleted" );
    level.handsrope delete();
    common_scripts\utility::_id_383F( "start_dragged_aftercarexit" );
    thread h1_draggingcorridors_depthoffield();
    thread h1_corridors_shakesandrumble();
    var_0 = getent( "enddrag1_node_h1", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "enddrag_leftguard", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "enddrag_rightguard", "targetname", 1 );
    var_2._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_0 _id_A510::_id_0BC7( level.playerview, "intro" );
    var_7 = level.playerview _meth_8185( "tag_player" );
    level._id_0318 _meth_8337( var_7 );
    level._id_0318 _meth_807F( level.playerview, "tag_player", 1 );
    thread h1_couplerpviewangles( "corridors1" );
    var_0 thread _id_A510::_id_0C24( var_2, "intro_rightguard" );
    var_0 thread _id_A510::_id_0C24( var_1, "intro_leftguard" );
    var_0 thread _id_A510::_id_0C24( level.playerview, "intro" );
    level.dragsound = level._id_0318 thread maps\coup_code::playlinkedsound( "scn_coup_drag_to_post" );
    level notify( "continue_credits" );
    var_5 maps\coup_code::_id_74B2( 5, 2.5 );
    wait 5;
    level._id_0318 _meth_8186( "coup_blackout2", 8 );
    var_5 maps\coup_code::_id_148C( 1, 6 );
    wait 2;
    var_8 = maps\coup_code::scripted_array_spawn( "ending_idleguards", "targetname", 1 );

    for ( var_9 = 0; var_9 < var_8.size; var_9++ )
        var_8[var_9]._id_0C72 = "human";

    var_10 = maps\coup_code::scripted_array_spawn( "ending_smokingguards", "targetname", 1 );

    for ( var_9 = 0; var_9 < var_10.size; var_9++ )
    {
        var_10[var_9]._id_0C72 = "human";
        var_10[var_9] thread _id_A573::_id_0DDC();
        var_10[var_9] thread _id_A510::_id_0BE1( var_10[var_9], "leaning_smoking_idle" );
    }

    var_11 = maps\coup_code::scripted_array_spawn( "ending_celebratingguards", "targetname", 1 );

    for ( var_9 = 0; var_9 < var_11.size; var_9++ )
    {
        var_11[var_9]._id_0C72 = "human";
        var_11[var_9].a = spawnstruct();
        var_11[var_9].a._id_A2E2["right"] = "defined";
        var_11[var_9] thread celebrate();
    }

    anim_variety_for_ending_crowd();
    level.zakhaev = maps\coup_code::scripted_spawn2( "ending_zakhaev", "targetname", 1 );
    level.zakhaev._id_0C72 = "human";
    level.zakhaev _id_A5A4::_id_4462();
    level.zakhaev _meth_801D( "weapon_desert_eagle_silver_HR_promo", "tag_inhand" );
    level.zakhaev.tracksuit_ignore = 1;
    var_12 = getent( "tunnel_node", "targetname" );
    var_12 thread first_frame_delay_anim( level.zakhaev, "ending_zakhaev", 6 );
    var_0 = getent( "enddrag4_node_h1", "targetname" );
    var_0 _id_A510::_id_0BC7( level.playerview, "intro" );
    var_0 thread _id_A510::_id_0C24( var_2, "intro_rightguard" );
    var_0 thread _id_A510::_id_0C24( var_1, "intro_leftguard" );
    var_0 thread _id_A510::_id_0C24( level.playerview, "intro" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_walla_stadium" );
    var_5 maps\coup_code::_id_74B2( 5, 2.5 );
    wait 5;
    level._id_0318 _meth_8186( "coup_blackout3", 8 );
    var_5 maps\coup_code::_id_148C( 1, 6 );
    wait 2;
    thread execending();
    var_1 delete();
    var_2 delete();
    var_3 delete();
    var_5 maps\coup_code::_id_74B2( 4, 0 );
    var_5 _meth_808A();
}

h1_grabbedfromcar_depthoffield()
{
    level._id_0318 _meth_84A7( 10.0, 110, 9.0, 9.0 );
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 10.0, 110, 0.5, 0.5 );
    wait 3.15;
    level._id_0318 _meth_84A7( 2.5, 250, 2.0, 2.0 );
    wait 1.0;
    level._id_0318 _meth_84A7( 2.5, 70, 1.0, 1.0 );
    wait 1.5;
    level._id_0318 _meth_84A7( 3.5, 15, 0.8, 0.8 );
    wait 1.3;
    level._id_0318 _meth_84A7( 3.0, 70, 1.5, 1.5 );
    wait 1.35;
    level._id_0318 _meth_84A7( 3.2, 50, 1.5, 1.5 );
    wait 0.85;
    level._id_0318 _meth_84A7( 1.0, 3000, 3.0, 3.0 );
    wait 0.6;
    level._id_0318 _meth_84A7( 2.5, 120, 1.5, 1.5 );
    wait 1.5;
    level._id_0318 _meth_84A7( 3.0, 60, 1.5, 1.5 );
    common_scripts\_exploder::_id_3528( "0221" );
    wait 0.65;
    level._id_0318 _meth_84A7( 3.2, 50, 1.5, 1.5 );
    wait 0.85;
    level._id_0318 _meth_84A7( 4.0, 28, 4.0, 4.0 );
    thread h1_kickinface_fadeout();
    wait 0.35;
    level.oldnearclip2 = getdvar( "r_znear" );
    _func_0D6( "r_znear", 0.01 );
    level._id_0318 _meth_84A7( 4.5, 10, 4.0, 4.0 );
    wait 0.35;
    wait 2.0;
    level._id_0318 _meth_84A6();

    if ( isdefined( level.oldnearclip2 ) )
    {
        _func_0D6( "r_znear", level.oldnearclip2 );
        level.oldnearclip2 = undefined;
    }
}

h1_kickinface_fadeout()
{
    wait 0.3;
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 0;
    var_0._id_03D4 = 1;
    var_0._id_0198 = 1;
    var_0 _meth_8086( 0.2 );
    var_0.alpha = 1;
    wait 2.0;
    var_0 _meth_808A();
}

h1_draggingcorridors_depthoffield()
{
    _func_0D6( "r_mbenable", 2 );
    setomnvar( "ui_consciousness_init", 1 );
    level._id_0318 _meth_84A7( 10.0, 110, 9.0, 9.0 );
    level._id_0318 _meth_84A5();
    wait 19.0;
    thread h1_couplerpviewangles( "corridors_zak" );
    wait 5.0;
    level._id_0318 _meth_84A6();
}

first_frame_delay_anim( var_0, var_1, var_2 )
{
    _id_A510::_id_0BC7( var_0, var_1 );
    wait(var_2);
    _id_A510::_id_0C24( var_0, var_1 );
}

execending()
{
    thread h1_ending_dof();
    thread h1_meetzak_shakesandrumble();
    thread ending_shadowchange();
    thread ending_speech();
    thread ending_slowmo();
    _func_0D6( "cg_fov", 50 );
    var_0 = getent( "ending_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "ending_alasad", "targetname", 1 );
    var_1 _meth_8056();
    var_1._id_0C72 = "human";
    var_1 removedroneweapon();
    level.alasad = var_1;
    level.alasad.tracksuit_ignore = 1;
    var_2 = level.zakhaev;
    var_3 = var_2._id_02E2 + ( 0, 0, 50 );
    var_2 _meth_8477( var_3 );
    var_4 = maps\coup_code::scripted_spawn2( "ending_leftguard", "targetname", 1 );
    var_4._id_0C72 = "human";
    var_5 = maps\coup_code::scripted_spawn2( "ending_rightguard", "targetname", 1 );
    var_5._id_0C72 = "human";
    var_0 _id_A510::_id_0BC7( level.playerview, "ending" );
    level._id_0318 _meth_8051();
    var_6 = level.playerview _meth_8184( "tag_player" );
    level._id_0318 _meth_8335( var_6 );
    level._id_0318 _meth_807F( level.playerview, "tag_player", 1 );
    thread h1_couplerpviewangles( "meet_zak" );
    level.dragsound delete();
    var_2 _meth_802A( "weapon_desert_eagle_silver_HR_promo", "tag_inhand" );
    var_0 thread _id_A510::_id_0C24( var_2, "endtaunt" );
    var_0 _id_A510::_id_0C24( level.playerview, "endtaunt" );
    level._id_0318 _meth_8051();
    level._id_0318 _meth_807F( level.playerview, "tag_player", 1, 0, 0, 0, 0 );
    thread h1_couplerpviewangles( "dragged_post" );
    _func_0D6( "sm_sunSampleSizeNear", "0.25" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_drag_to_post_part2" );
    var_0 thread _id_A510::_id_0C24( level.playerview, "ending" );
    var_0 thread _id_A510::_id_0C24( var_4, "ending_leftguard" );
    var_0 thread _id_A510::_id_0C24( var_5, "ending_rightguard" );
    var_1 _meth_8055();
    var_0 thread _id_A510::_id_0C24( var_1, "ending_alasad" );
    level.playerview waittillmatch( "single anim", "anim_start" );
    var_2 _meth_801D( "weapon_desert_eagle_silver_HR_promo", "tag_inhand" );
    var_0 thread _id_A510::_id_0C24( var_2, "ending_zakhaev" );
    var_0 thread _id_A510::_id_0C24( var_1, "ending_alasad" );

    if ( isdefined( level.oldnearclip ) )
    {
        wait 2;
        _func_0D6( "r_znear", level.oldnearclip );
        level.oldnearclip = undefined;
    }
}

h1_ending_dof()
{
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 4.0, 50, 9.0, 9.0 );
    wait 2.1666;
    level._id_0318 _meth_84A7( 12, 14, 9.0, 9.0 );
    wait 0.6666;
    wait 2.5;
    level._id_0318 _meth_84A7( 8.0, 50, 4.0, 4.0 );
    wait 0.8334;
    wait 1.8334;
    level._id_0318 _meth_84A7( 1.4, 600, 2.0, 2.0 );
    wait 1.6666;
    wait 2.0;
    level._id_0318 _meth_84A7( 1.4, 180, 2.0, 2.0 );
    wait 1.0;
    level._id_0318 _meth_84A7( 1.4, 76, 0.8, 0.8 );
    thread h1_couplerpviewangles( "turned_post" );
    wait 1.6666;
    wait 1.0;
    level._id_0318 _meth_84A7( 5.0, 30, 2.0, 2.0 );
    wait 2.3334;
    wait 1.0;
    level._id_0318 _meth_84A7( 0.7, 200, 3.0, 1.0 );
    thread h1_couplerpviewangles( "gun_exchange" );
    wait 1.5;
    wait 0.8334;
    level._id_0318 _meth_84A7( 0.55, 256, 2.0, 2.0 );
    wait 1.8334;
    wait 3.0;
    level._id_0318 _meth_84A7( 0.7, 200, 3.0, 3.0 );
    wait 1.5;
    wait 3.3334;
    level._id_0318 _meth_84A7( 5.0, 136, 1.0, 1.0 );
    thread h1_couplerpviewangles( "alasad_shoot" );
    wait 1.0;
    level._id_0318 _meth_84A7( 4.5, 69, 1.0, 1.0 );
    wait 1.5;
    level._id_0318 _meth_84A7( 4.0, 52, 6.0, 6.0 );
    wait 0.65;
    level._id_0318 _meth_84A7( 5.0, 8.1, 3.5, 3.5 );
    wait 0.85;
    level._id_0318 _meth_84A7( 5.2, 12, 5.0, 5.0 );
    wait 0.35;
    level._id_0318 _meth_84A7( 5.5, 10, 3.0, 3.0 );
    wait 0.85;
    wait 1.0;
    level._id_0318 _meth_84A6();
    _func_0D6( "r_mbenable", 0 );
}

intro_scuffle()
{

}

intro_doors()
{
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_intro_door" );
    var_0 = getent( "intro_leftdoor", "targetname" );
    var_0._id_02E2 = ( -15, -510, 70 );
    var_0.angles += ( 0, 180, 0 );
    var_1 = getent( "intro_rightdoor", "targetname" );
    var_1._id_02E2 = ( 143, -510, 70 );
    var_1.angles += ( 0, 180, 0 );
    _func_0D6( "r_glow_allowed_script_forced", 1 );
    var_2 = _func_1A9();
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2 _meth_80CE( "black", 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2._id_01F3 = "fullscreen";
    var_2._id_0501 = "fullscreen";
    var_2.alpha = 1;
    var_2._id_03D4 = 1;
    var_2._id_0198 = 1;
    level._id_0318 _meth_8326( 1 );
    common_scripts\utility::_id_384A( "doors_open" );
    level._id_0318 _meth_8326( 0 );
    level._id_0318 _meth_80AF( "grenade_rumble" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_drag_to_car" );
    _id_A5A4::_id_7F00( "coup_sunblind", 0.2 );
    var_2 _meth_8086( 0.5 );
    var_2.alpha = 0;
    wait 0.5;
    var_2 _meth_808A();
    wait 0.5;
    _id_A5A4::_id_7F00( "coup", 8 );
}

intro_speech()
{
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_onenation_timing, maps\coup_code::playspeech, "coup_kaa_onenation", "Today, we rise again as one nation, in the face of betrayal and corruption!!!" );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_newera_timing, maps\coup_code::playspeech, "coup_kaa_newera", "We all trusted this man to deliver our great nation into a new era of prosperity..." );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_selfinterest_timing, maps\coup_code::playspeech, "coup_kaa_selfinterest", "...But like our monarchy before the Revolution, he has been colluding with the West with only self interest at heart!" );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_notenslaved_timing, maps\coup_code::playspeech, "coup_kaa_notenslaved", "Collusion breeds slavery!! And we shall not be enslaved!!!" );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_donotfear_timing, maps\coup_code::playspeech, "coup_kaa_donotfear", "The time has come to show our true strength. They underestimate our resolve. Let us show that we do not fear them." );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_freefromyoke_timing, maps\coup_code::playspeech, "coup_kaa_freefromyoke", "As one people, we shall free our brethren from the yoke of foreign oppression!" );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_armiesstrong_timing, maps\coup_code::playspeech, "coup_kaa_armiesstrong", "Our armies are strong, and our cause is just." );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_greatnation_timing, maps\coup_code::playspeech, "coup_kaa_greatnation", "As I speak, our armies are nearing their objectives, by which we will restore the independence of a once great nation." );
    level._id_0318 _id_A5A4::_id_27EF( level.coup_kaa_begun_timing, maps\coup_code::playspeech, "coup_kaa_begun", "Our noble crusade has begun." );
    level._id_0318 _id_A5A4::_id_27EF( 154, ::setmusic_p3_flag );
}

setmusic_p3_flag()
{
    common_scripts\utility::_id_383F( "music_part3" );
}

_id_4EED()
{
    common_scripts\_exploder::_id_3528( 1 );
    wait 5.5;
    common_scripts\_exploder::_id_3528( 2 );
}

drive_talkingguards1()
{
    common_scripts\utility::_id_384A( "drive_talkingguards1" );
    var_0 = getent( "talkingguards1_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "talkingguards1_leftguard", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "talkingguards1_rightguard", "targetname", 1 );
    var_1._id_0C72 = "human";
    var_2._id_0C72 = "human";
    var_0 thread _id_A510::_id_0C24( var_1, "talkingguards_leftguard" );
    var_0 thread _id_A510::_id_0C24( var_2, "talkingguards_rightguard" );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_1 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_2 );
}

drive_casualguards1()
{
    common_scripts\utility::_id_384A( "drive_casualguards1" );
    thread common_scripts\utility::_id_69C2( "scn_coup_walla_soldiers_cheer", ( 4494.5, 340.5, 65.4 ) );
    var_0 = maps\coup_code::scripted_spawn2( "casualguards1_smokingguard", "targetname", 1 );
    var_1 = maps\coup_code::scripted_spawn2( "casualguards1_idleguard1", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "casualguards1_idleguard2", "targetname", 1 );
    var_3 = maps\coup_code::scripted_spawn2( "casualguards1_dog", "targetname", 1 );
    var_0._id_0C72 = "human";
    var_3._id_0C72 = "dog";
    var_0 thread _id_A573::_id_0DDC();
    var_0 thread _id_A510::_id_0BE1( var_0, "leaning_smoking_idle" );
    var_3 thread _id_A510::_id_0BE1( var_3, "sleeping" );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_1 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_2 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_3 );
}

drive_eatingdog1()
{
    common_scripts\utility::_id_384A( "drive_eatingdog1" );
    var_0 = maps\coup_code::scripted_array_spawn( "eatingdog1_dogs", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_2._id_0C72 = "dog";
        var_2 thread _id_A510::_id_0BE1( var_2, "eating" );
        _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_2 );
    }
}

drive_doorkick1()
{
    common_scripts\utility::_id_384A( "drive_doorkick1" );
    var_0 = getent( "doorkick1_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "doorkick1_leftguard", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "doorkick1_rightguard", "targetname", 1 );
    var_0 doorkick( var_1, var_2, 7, 10 );
}

drive_ziptie1()
{
    common_scripts\utility::_id_384A( "drive_ziptie1" );
    ziptie( "ziptie1", undefined, 20 );
}

drive_ziptie2()
{
    common_scripts\utility::_id_384A( "drive_ziptie2" );
    ziptie( "ziptie2", undefined, 20 );
}

drive_doorkick2()
{
    common_scripts\utility::_id_384A( "drive_doorkick2" );
    var_0 = getent( "doorkick2_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "doorkick2_leftguard", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "doorkick2_rightguard", "targetname", 1 );
    var_0 doorkick( var_1, var_2, undefined, 10, 1 );
}

drive_runners1()
{
    common_scripts\utility::_id_384A( "drive_runtogarage" );
    var_0 = maps\coup_code::scripted_spawn2( "runners1_civilian1", "targetname", 1 );
    var_1 = maps\coup_code::scripted_spawn2( "runners1_civilian2", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "runners1_civilian3", "targetname", 1 );
    var_2 thread maps\coup_code::dropdead();
    var_1 _id_A5A4::_id_7E43( "death_runners1" );
    var_0._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_2._id_0C72 = "human";
    var_0._id_2B0E = 1;
    var_1._id_2B0E = 1;
    var_2._id_2B0E = 1;
    var_3[0] = "run_panicked1";
    var_3[1] = "run_panicked2";
    var_0 setrandomrun( var_3 );
    var_1 setrandomrun( var_3 );
    var_2 setrandomrun( var_3 );
    var_4 = getent( "intro_node", "targetname" );
    var_4 thread _id_A510::_id_0C24( var_0, "civilians_running_02" );
    var_4 thread _id_A510::_id_0C24( var_1, "civilians_running_03" );
    var_4 thread _id_A510::_id_0C24( var_2, "civilians_running_04" );
    var_0 thread ignore( 11 );
    var_1 thread ignore( 7.5 );
    var_2 thread ignore( 4 );
    wait 1.75;
    var_5 = maps\coup_code::scripted_spawn2( "runners1_guard1", "targetname", 1 );
    var_6 = maps\coup_code::scripted_spawn2( "runners1_guard2", "targetname", 1 );
    wait 5.25;
    var_5._id_1300 = 1000;
    var_6._id_1300 = 1000;
}

ignore( var_0 )
{
    self._id_01FF = 1;
    self.a._id_2B20 = 1;
    self.allowpain = 0;
    thread _id_A5A4::_id_58D7();
    wait(var_0);
    self._id_01FF = 0;
    self.a._id_2B20 = 0;
    self.allowpain = 1;
    _id_A5A4::_id_8EA4();
}

drive_windowshout1()
{
    common_scripts\utility::_id_384A( "drive_windowshout1" );
    var_0 = maps\coup_code::scripted_spawn2( "windowshout1_civilian", "targetname", 1 );
    thread windowshout( var_0 );
}

drive_gunpoint1()
{
    common_scripts\utility::_id_384A( "drive_gunpoint1" );
    var_0 = maps\coup_code::scripted_spawn2( "gunpoint1_standguard", "targetname", 1 );
    var_1 = maps\coup_code::scripted_spawn2( "gunpoint1_standcivilian", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "gunpoint1_crouchguard", "targetname", 1 );
    var_3 = maps\coup_code::scripted_spawn2( "gunpoint1_crouchcivilian", "targetname", 1 );
    var_4 = maps\coup_code::scripted_array_spawn( "gunpoint1_tiedcivilian", "targetname", 1 );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        thread ziptied( var_4[var_5], 20 );

    thread gunpoint_stand( var_0, var_1, 20 );
    thread gunpoint_crouch( var_2, var_3, 20 );
}

drive_interrogation1()
{
    common_scripts\utility::_id_384A( "drive_interrogation1" );
    var_0 = maps\coup_code::scripted_spawn2( "interrogation1_guard_a", "targetname", 1 );
    var_0._id_0C72 = "human";
    var_1 = maps\coup_code::scripted_spawn2( "interrogation1_suspect_a", "targetname", 1 );
    var_1._id_0C72 = "human";
    var_2 = maps\coup_code::scripted_spawn2( "interrogation1_guard_b", "targetname", 1 );
    var_2._id_0C72 = "human";
    var_3 = maps\coup_code::scripted_spawn2( "interrogation1_suspect_b", "targetname", 1 );
    var_3._id_0C72 = "human";
    var_4 = maps\coup_code::scripted_spawn2( "interrogation1_guard_b2", "targetname", 1 );
    var_4._id_0C72 = "human";
    var_5 = maps\coup_code::scripted_spawn2( "interrogation1_suspect_b2", "targetname", 1 );
    var_5._id_0C72 = "human";
    var_6 = maps\coup_code::scripted_spawn2( "interrogation1_suspect_c", "targetname", 1 );
    var_6._id_0C72 = "human";
    var_7 = maps\coup_code::scripted_spawn2( "interrogation1_suspect_c2", "targetname", 1 );
    var_7._id_0C72 = "human";
    var_8 = maps\coup_code::scripted_spawn2( "interrogation1_suspect_d", "targetname", 1 );
    var_8._id_0C72 = "human";
    var_9 = maps\coup_code::scripted_spawn2( "interrogation1_suspect_d2", "targetname", 1 );
    var_9._id_0C72 = "human";
    var_10 = getent( "tag_interrogation_5", "targetname" );
    var_11 = maps\coup_code::scripted_spawn2( "ziptie5_civilian", "targetname", 1 );
    var_11._id_0C72 = "human";
    var_12 = maps\coup_code::scripted_spawn2( "ziptie5_guard", "targetname", 1 );
    var_12._id_0C72 = "human";
    var_13 = getent( "tag_interrogation_5b", "targetname" );
    level.suspect_5b = maps\coup_code::scripted_spawn2( "ziptie5b_civilian", "targetname", 1 );
    level.suspect_5b._id_0C72 = "human";
    var_14 = maps\coup_code::scripted_spawn2( "ziptie5b_guard", "targetname", 1 );
    var_14._id_0C72 = "human";
    var_1 thread _id_A510::_id_0C24( var_1, "interrogation_suspect_a" );
    var_1 thread _id_A510::_id_0C24( var_0, "interrogation_guard_a" );
    var_3 _id_A5A4::_id_27EF( 1.4, _id_A510::_id_0C24, var_3, "interrogation_suspect_b" );
    var_3 _id_A5A4::_id_27EF( 1.4, _id_A510::_id_0C24, var_2, "interrogation_guard_b" );
    var_5 thread _id_A510::_id_0C24( var_5, "interrogation_suspect_b" );
    var_5 thread _id_A510::_id_0C24( var_4, "interrogation_guard_b" );
    var_6 thread _id_A510::_id_0C24( var_6, "interrogation_suspect_c" );
    var_7 thread _id_A510::_id_0C24( var_7, "interrogation_suspect_c" );
    var_8 thread _id_A510::_id_0C24( var_8, "interrogation_suspect_d" );
    var_9 thread _id_A510::_id_0C24( var_9, "interrogation_suspect_d" );
    var_10 _id_A5A4::_id_27EF( 0.5, _id_A510::_id_0C24, var_11, "interrogation_civilian_5" );
    var_10 _id_A5A4::_id_27EF( 0.5, _id_A510::_id_0C24, var_12, "interrogation_guard_5" );
    var_13 _id_A5A4::_id_27EF( 1.5, _id_A510::_id_0C24, level.suspect_5b, "interrogation_civilian_5b" );
    var_13 _id_A5A4::_id_27EF( 1.5, _id_A510::_id_0C24, var_14, "interrogation_guard_5b" );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_2 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_4 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_12 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_14 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_1 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_3 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_5 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_6 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_7 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_8 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_9 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_11 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, level.suspect_5b );
}

drive_ziptie3()
{
    common_scripts\utility::_id_384A( "drive_ziptie3" );
    ziptie( "ziptie3", undefined, 20 );
}

drive_trashstumble()
{
    var_0 = getent( "intro_node", "targetname" );
    common_scripts\utility::_id_384A( "drive_trashstumble" );
    thread trashstumble_guards();
    level.runner = maps\coup_code::scripted_spawn2( "trashstumble_runner", "targetname", 1 );
    level.runner._id_0C72 = "human";
    var_0 thread _id_A510::_id_0C24( level.runner, "civiliankilled_tumblesoncar" );
    wait 4;
    level.runner thread _id_A5A4::_id_69C4( "scn_coup_civilian_tumblesoncar" );
    wait 2;
    level.runner thread _id_A5A4::_id_69C4( "coup_death_male" );
    wait 4;
    level.runner delete();
}

trashstumble_guards()
{
    var_0 = maps\coup_code::scripted_spawn2( "trashstumble_guard1", "targetname", 1 );
    var_1 = maps\coup_code::scripted_spawn2( "trashstumble_guard2", "targetname", 1 );
    var_2 = getent( "intro_node", "targetname" );
    var_0._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_2 thread _id_A510::_id_0C24( var_0, "civiliankilled_guard_a" );
    var_2 thread _id_A510::_id_0C24( var_1, "civiliankilled_guard_b" );
}

drive_casualguards2()
{
    common_scripts\utility::_id_384A( "drive_casualguards2" );
    var_0 = maps\coup_code::scripted_spawn2( "casualguards2_smokingguard", "targetname", 1 );
    var_1 = maps\coup_code::scripted_spawn2( "casualguards2_idleguard", "targetname", 1 );
    var_0 thread _id_A573::_id_0DDC();
    var_0._id_0C72 = "human";
    var_0 thread _id_A510::_id_0BE1( var_0, "leaning_smoking_idle" );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_1 );
    wait 2.7;
    thread common_scripts\utility::_id_69C2( "scn_coup_walla_soldiers_cheer", ( 4608, 10824.5, 380.5 ) );
}

drive_spraypaint1()
{
    common_scripts\utility::_id_384A( "drive_spraypaint1" );
    var_0 = getent( "spraypaint1_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "spraypaint1_civilian", "targetname", 1 );
    var_1._id_0C72 = "human";
    var_1._id_2B0E = 1;
    var_1._id_01FF = 1;
    var_1 _meth_801D( "com_spray_can01", "tag_inhand" );
    var_2[0] = "run_panicked1";
    var_2[1] = "run_panicked2";
    var_1 _id_A5A4::_id_7EAB( var_2[_func_0B2( 1 )], 1 );
    var_0 _id_A510::_id_0C24( var_1, "spraypainting" );
    var_1 thread maps\coup_code::deleteongoal();
}

drive_sneakattack()
{
    common_scripts\utility::_id_384A( "drive_sneakattack" );
    thread common_scripts\utility::_id_69C2( "coup_civilians_panic", ( 4176, 11140, 368 ) );
    thread common_scripts\utility::_id_69C2( "scn_coup_walla_soldiers_cheer_02", ( 4176, 11140, 368 ) );
    var_0 = maps\coup_code::scripted_spawn2( "sneakattack_cower1", "targetname", 1 );
    var_0._id_0C72 = "human";
    var_0 thread _id_A510::_id_0BE1( var_0, "cowerstand_pointidle" );
    var_1 = maps\coup_code::scripted_spawn2( "sneakattack_cower2", "targetname", 1 );
    var_1._id_0C72 = "human";
    var_1 thread _id_A510::_id_0BE1( var_1, "cowerstand_pointidle" );
    var_2 = maps\coup_code::scripted_spawn2( "sneakattack_attacker1", "targetname", 1 );
    var_3 = maps\coup_code::scripted_spawn2( "sneakattack_victim1", "targetname", 1 );
    var_4 = maps\coup_code::scripted_spawn2( "sneakattack_attacker2", "targetname", 1 );
    var_5 = maps\coup_code::scripted_spawn2( "sneakattack_victim2", "targetname", 1 );
    wait 5.0;
    var_3 thread attackbehind( var_2, 20 );
    var_5 thread attackside( var_4, 20 );
    thread common_scripts\utility::_id_69C2( "coup_civilians_panic", ( 3729.1, 12331.3, 368 ) );
    thread common_scripts\utility::_id_69C2( "scn_coup_walla_soldiers_cheer_02", ( 3729.1, 12331.3, 368 ) );
    wait 1;
    var_1 thread _id_A510::_id_0C24( var_1, "cowerstand_react" );
    wait 1;
    var_0 thread _id_A510::_id_0C24( var_0, "cowerstand_react_to_crouch" );
    thread common_scripts\utility::_id_69C2( "coup_civilians_panic", ( 3582.1, 13134.3, 385.3 ) );
    thread common_scripts\utility::_id_69C2( "scn_coup_walla_soldiers_cheer_02", ( 3582.1, 13134.3, 385.3 ) );
}

drive_ziptie4()
{
    common_scripts\utility::_id_384A( "drive_ziptie4" );
    var_0 = maps\coup_code::scripted_array_spawn( "ziptie4_tiedcivilian", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread ziptied( var_0[var_1], 20 );

    var_2 = getent( "tag_ziptie4_replacing_generic", "targetname" );
    var_3 = maps\coup_code::scripted_spawn2( "ziptie4_civilian", "targetname", 1 );
    var_3._id_0C72 = "human";
    var_4 = maps\coup_code::scripted_spawn2( "ziptie4_guard", "targetname", 1 );
    var_4._id_0C72 = "human";
    var_2 _id_A5A4::_id_27EF( 0.5, _id_A510::_id_0C24, var_3, "interrogation_civilian_4" );
    var_2 _id_A5A4::_id_27EF( 0.5, _id_A510::_id_0C24, var_4, "interrogation_guard_4" );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_4 );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_3 );
    wait 2;
    thread ziptie( "ziptie4b", undefined, 20 );
}

drive_runners2()
{
    common_scripts\utility::_id_384A( "drive_runners2" );
    var_0 = maps\coup_code::scripted_spawn2( "runners2_civilian1", "targetname", 1 );
    var_1 = maps\coup_code::scripted_spawn2( "runners2_civilian2", "targetname", 1 );
    var_2 = maps\coup_code::scripted_spawn2( "runners2_civilian3", "targetname", 1 );
    var_3 = maps\coup_code::scripted_spawn2( "runners2_civilian4", "targetname", 1 );
    wait 1;
    var_4 = maps\coup_code::scripted_spawn2( "runners2_guard1", "targetname", 1 );
    var_5 = maps\coup_code::scripted_spawn2( "runners2_guard2", "targetname", 1 );
    var_6 = maps\coup_code::scripted_spawn2( "runners2_guard3", "targetname", 1 );
    var_4.ignoreweaponintracksuitmode = 1;
    var_5.ignoreweaponintracksuitmode = 1;
    var_6.ignoreweaponintracksuitmode = 1;
    var_4 thread _id_A5A4::_id_58D7();
    var_5 thread _id_A5A4::_id_58D7();
    var_6 thread _id_A5A4::_id_58D7();
    wait 1.5;
    thread runners2deathsounds( var_0, var_1, var_2, var_3 );
    var_4._id_1300 = 1000;
    var_5._id_1300 = 1000;
    var_6._id_1300 = 1000;
    common_scripts\utility::_id_384A( "runners2_dead" );
    var_4 _id_A5A4::_id_8EA4();
    var_5 _id_A5A4::_id_8EA4();
    var_6 _id_A5A4::_id_8EA4();
    var_7 = getent( "runners2_guardsgoal", "targetname" );
    var_4 thread _id_A581::_id_4248( var_7 );
    var_5 thread _id_A581::_id_4248( var_7 );
    var_6 thread _id_A581::_id_4248( var_7 );
    var_4 thread maps\coup_code::deleteongoal();
    var_5 thread maps\coup_code::deleteongoal();
    var_6 thread maps\coup_code::deleteongoal();
}

runners2deathsounds( var_0, var_1, var_2, var_3 )
{
    wait 0.2;
    thread common_scripts\utility::_id_69C2( "coup_death_male", var_0._id_02E2 );
    wait 1.0;
    thread common_scripts\utility::_id_69C2( "coup_death_male", var_1._id_02E2 );
    wait 0.8;
    thread common_scripts\utility::_id_69C2( "coup_death_male", var_2._id_02E2 );
    wait 1.2;
    thread common_scripts\utility::_id_69C2( "coup_death_male", var_3._id_02E2 );
}

drive_garage2()
{
    common_scripts\utility::_id_384A( "drive_runtogarage" );
    var_0 = getent( "garage2_node", "targetname" );
    var_1 = maps\coup_code::scripted_spawn2( "garage2_civilian", "targetname", 1 );
    var_1 removedroneweapon();
    var_2 = maps\coup_code::scripted_spawn2( "garage2_runner", "targetname", 1 );
    var_3 = getent( "garage2_door", "targetname" );
    var_0 garage( var_1, var_2, var_3, 4 );
}

drive_basehelicopters()
{
    common_scripts\utility::_id_384A( "drive_basehelicopters" );
    var_0 = _id_A5A8::_id_8979( "base_helicopter1" );
    var_0 _meth_824F( 0, 1, 0.5 );
    wait 1;
    var_1 = _id_A5A8::_id_8979( "base_helicopter2" );
    var_1 _meth_824F( 0, 1, 0.5 );
    wait 1;
    var_2 = _id_A5A8::_id_8979( "base_helicopter3" );
    var_2 _meth_824F( 0, 1, 0.5 );
    var_0 maps\coup_aud::play_helicopter_scripted_sfx( "scn_base_helicopter_01" );
    var_1 maps\coup_aud::play_helicopter_scripted_sfx( "scn_base_helicopter_02" );
    var_2 maps\coup_aud::play_helicopter_scripted_sfx( "scn_base_helicopter_03" );
    common_scripts\utility::_id_384A( "basehelicopters_flyaway" );
    var_0 _meth_827F( 60, 15 );
    var_1 _meth_827F( 60, 15 );
    var_2 _meth_827F( 60, 15 );
}

drive_celebrators2()
{
    common_scripts\utility::_id_384A( "drive_celebrators2" );
    var_0 = maps\coup_code::scripted_array_spawn( "celebrators2", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1]._id_0C72 = "human";
        var_0[var_1] thread celebrate();
    }
}

drive_casualguards3()
{
    common_scripts\utility::_id_384A( "drive_casualguards3" );
    var_0 = maps\coup_code::scripted_array_spawn( "casualguards3_smokingguards", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1]._id_0C72 = "human";
        var_0[var_1] thread _id_A573::_id_0DDC();
        var_0[var_1] thread _id_A510::_id_0BE1( var_0[var_1], "leaning_smoking_idle" );
    }

    var_2 = maps\coup_code::scripted_array_spawn( "casualguards3_idleguards", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
        var_2[var_1]._id_0C72 = "human";
}

drive_endcrowd()
{
    common_scripts\utility::_id_384A( "drive_endcrowd" );
    thread drive_welcoming_guards();
    var_0 = maps\coup_code::scripted_array_spawn( "endcrowd_smokingguards", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1]._id_0C72 = "human";
        var_0[var_1] thread _id_A573::_id_0DDC();
        var_0[var_1] thread _id_A510::_id_0BE1( var_0[var_1], "leaning_smoking_idle" );
    }

    var_2 = maps\coup_code::scripted_array_spawn( "endcrowd_idleguards", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
        var_2[var_1]._id_0C72 = "human";

    var_3 = maps\coup_code::scripted_array_spawn( "endcrowd_crowdmember", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
    {
        var_3[var_1]._id_0C72 = "human";
        var_3[var_1].a = spawnstruct();
        var_3[var_1].a._id_A2E2["right"] = "defined";
        var_3[var_1] thread celebrate();
    }

    var_4 = maps\coup_code::scripted_array_spawn( "endcrowd_crowdwitness_gunup", "targetname", 1 );
    var_5 = [];
    var_5[0] = "crowdmember_witnessing_arrival_gunup";
    var_5[1] = "crowdmember_soldier_welcome_1";
    var_5[2] = "crowdmember_soldier_welcome_2";

    foreach ( var_7 in var_4 )
    {
        var_7._id_0C72 = "human";
        var_1 = _func_0B2( 3 );
        var_8 = _func_0B3( 3 );
        var_7 _id_A5A4::_id_27EF( var_8, _id_A510::_id_0BE1, var_7, var_5[var_1] );
    }

    var_10 = maps\coup_code::scripted_spawn2( "endcrowd_crowdwitness_taunt", "targetname", 1 );
    var_10._id_0C72 = "human";
    var_11 = maps\coup_code::scripted_spawn2( "endcrowd_crowdwitness_cuthroat_1", "targetname", 1 );
    var_11._id_0C72 = "human";
    var_12 = maps\coup_code::scripted_spawn2( "endcrowd_crowdwitness_cuthroat_2", "targetname", 1 );
    var_12._id_0C72 = "human";
    var_13 = maps\coup_code::scripted_spawn2( "endcrowd_idledog", "targetname", 1 );
    var_13._id_0C72 = "dog";
    var_13 thread last_dog();
    common_scripts\utility::_id_384A( "drive_carstopping" );
    var_10 thread _id_A510::_id_0BE1( var_10, "crowdmember_witnessing_arrival_taunt" );
    var_11 thread _id_A510::_id_0BE1( var_11, "crowdmember_witnessing_arrival_cutroat_1" );
    wait 0.8;
    var_12 thread _id_A510::_id_0BE1( var_12, "crowdmember_witnessing_arrival_cutroat_2" );
    common_scripts\utility::_id_384A( "start_dragged_aftercarexit" );
    common_scripts\utility::_id_0D13( var_0, maps\coup_code::deleteentity );
    common_scripts\utility::_id_0D13( var_2, maps\coup_code::deleteentity );
    common_scripts\utility::_id_0D13( var_3, maps\coup_code::deleteentity );
    common_scripts\utility::_id_0D13( var_4, maps\coup_code::deleteentity );
    var_10 _meth_8143();
    var_11 _meth_8143();
    var_12 _meth_8143();
    var_13 _meth_8143();
    var_10 delete();
    var_11 delete();
    var_12 delete();
    var_13 delete();
}

last_dog()
{
    thread _id_A510::_id_0C24( self, "idle" );
    wait 25;
    thread _id_A510::_id_0BE1( self, "attackidle_bark", undefined, "stop_bark" );
    wait 8;
    self notify( "stop_bark" );
}

drive_welcoming_guards()
{
    var_0 = maps\coup_code::scripted_spawn2( "endcrowd_soldier_welcome4", "targetname", 1 );
    var_0._id_0C72 = "human";
    common_scripts\utility::_id_384A( "welcoming_soldier" );
    var_0 thread _id_A510::_id_0BE1( var_0, "crowdmember_soldier_welcome_4", undefined, "stop_loop" );

    while ( _func_225( var_0._id_02E2, level._id_0318._id_02E2 ) > 19600 )
        wait 0.1;

    wait 0.2;
    var_0 notify( "stop_loop" );
    var_0 thread _id_A510::_id_0BE1( var_0, "stand_idle", undefined, "stop_loop" );
}

drive_fastrope1()
{
    common_scripts\utility::_id_384A( "drive_fastrope1" );
    _id_A5A8::_id_8979( "fastrope1_heli" );
}

drive_firingsquad()
{
    common_scripts\utility::_id_384A( "drive_firingsquad" );
    var_0 = maps\coup_code::scripted_spawn2( "firingsquad_captain", "targetname", 1 );
    var_1 = maps\coup_code::scripted_array_spawn( "guard_firingsquad", "script_noteworthy", 1 );
    var_2 = maps\coup_code::scripted_array_spawn( "civilian_firingsquad", "script_noteworthy", 1 );
    var_3 = maps\coup_code::scripted_array_spawn( "civilian_firingsquad_female", "script_noteworthy", 1 );

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_1[var_4] _id_A5A4::_id_08EB();
        var_1[var_4]._id_0C72 = "human";
        var_5 = _func_0C3( var_1[var_4]._id_04A4, "targetname" );
        var_1[var_4] _meth_81A9( var_5 );
        var_1[var_4].ignoreweaponintracksuitmode = 1;
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_2[var_4] _id_A5A4::_id_08EB();
        var_2[var_4]._id_0C72 = "human";
        var_2[var_4] _id_A5A4::_id_4462();
    }

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_3[var_4] _id_A5A4::_id_08EB();
        var_3[var_4]._id_0C72 = "human";
        var_3[var_4] _id_A5A4::_id_4462();
    }

    common_scripts\utility::_id_384A( "start_execution_anims" );

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_1[var_4] thread _id_A510::_id_0C24( var_1[var_4], "execution_soldier_0" + ( var_4 + 1 ) );
        var_1[var_4] thread _id_A510::_id_0BB5( var_1[var_4], "gravity", "execution_soldier_0" + ( var_4 + 1 ) );
    }

    var_2[0] thread _id_A510::_id_0C24( var_2[0], "execution_victim_male_01_L" );
    var_2[1] thread _id_A510::_id_0C24( var_2[1], "execution_victim_male_01_R" );
    var_2[2] thread _id_A510::_id_0C24( var_2[2], "execution_victim_male_02_L" );
    var_2[3] thread _id_A510::_id_0C24( var_2[3], "execution_victim_male_03_L" );
    var_2[0] thread _id_A510::_id_0BB5( var_2[0], "gravity", "execution_victim_male_01_L" );
    var_2[1] thread _id_A510::_id_0BB5( var_2[1], "gravity", "execution_victim_male_01_R" );
    var_2[2] thread _id_A510::_id_0BB5( var_2[2], "gravity", "execution_victim_male_02_L" );
    var_2[3] thread _id_A510::_id_0BB5( var_2[3], "gravity", "execution_victim_male_03_L" );
    var_2[0] thread _id_A5A4::_id_58D7();
    var_2[1] thread _id_A5A4::_id_58D7();
    var_2[2] thread _id_A5A4::_id_58D7();
    var_2[3] thread _id_A5A4::_id_58D7();
    var_0._id_0C72 = "human";
    var_0 thread _id_A510::_id_0C24( var_0, "execution_victim_captain" );
    var_0 thread _id_A510::_id_0BB5( var_0, "gravity", "execution_victim_captain" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_3[var_4] thread _id_A510::_id_0C24( var_3[var_4], "execution_victim_female_0" + ( var_4 + 1 ) );
        var_3[var_4] thread _id_A510::_id_0BB5( var_3[var_4], "gravity", "execution_victim_female_0" + ( var_4 + 1 ) );
        var_3[var_4] thread _id_A5A4::_id_58D7();
    }

    wait 7;
    firing_squad_civilian_death_sounds( var_2, var_3 );
    wait 3;
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_8EA4 );
    common_scripts\utility::_id_0D13( var_3, _id_A5A4::_id_8EA4 );
}

firing_squad_civilian_death_sounds( var_0, var_1 )
{
    var_0[0] thread _id_A5A4::_id_69C4( "coup_death_male" );
    wait 0.2;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] thread _id_A5A4::_id_69C4( "coup_death_female" );
        wait 0.2;
    }

    var_0[1] thread _id_A5A4::_id_69C4( "coup_death_male" );
    wait 0.2;
    var_0[2] thread _id_A5A4::_id_69C4( "coup_death_male" );
    wait 0.2;
    var_0[3] thread _id_A5A4::_id_69C4( "coup_death_male" );
}

drive_ziptie5()
{
    common_scripts\utility::_id_384A( "drive_ziptie5" );
    var_0 = maps\coup_code::scripted_array_spawn( "ziptie5_tiedcivilian", "targetname", 1 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread ziptied( var_0[var_1], 20 );
}

drive_dogchase1()
{
    common_scripts\utility::_id_384A( "drive_dogchase1" );
    thread fenceclimb( "dogchase1", undefined, 12 );
    wait 3.5;
    thread fencedog( "dogchase1", undefined, 12 );
}

drive_carjack1()
{
    common_scripts\utility::_id_384A( "drive_carjack1" );
    thread carjack( "carjack1", 5, undefined );
}

drive_dumpsterhide1()
{
    common_scripts\utility::_id_384A( "drive_dumpsterhide1" );
    thread dumpsterhide( "dumpsterhide1", undefined, 10 );
}

drive_phonering()
{
    common_scripts\utility::_id_384A( "drive_phonering" );
}

dumpsterhide( var_0, var_1, var_2 )
{
    var_3 = getent( var_0 + "_dumpster", "targetname" );
    var_3._id_0C72 = "dumpster";
    var_3 _id_A5A4::_id_0D61();
    var_4 = maps\coup_code::scripted_spawn2( var_0 + "_civilian", "targetname", 1 );
    var_4._id_0C72 = "human";
    var_4._id_02E2 = var_3._id_02E2;
    var_4.angles = var_3.angles;
    var_4 removedroneweapon();

    if ( isdefined( var_1 ) )
        wait(var_1);

    var_4 thread _id_A510::_id_0C24( var_4, "dumpster_open" );
    var_3 _id_A510::_id_0C24( var_3, "dumpster_open" );
    var_4 delete();
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_3 );
}

drive_arrivewalla()
{
    common_scripts\utility::_id_384A( "drive_arrivewalla" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_walla_arrive" );
}

carjack( var_0, var_1, var_2 )
{
    var_3 = _id_A5A8::_id_8978( var_0 + "_car" );
    var_3._id_0C72 = "uaz";
    var_4 = maps\coup_code::scripted_spawn2( var_0 + "_victim", "targetname", 1 );
    var_4._id_0C72 = "human";
    var_5 = maps\coup_code::scripted_spawn2( var_0 + "_driver", "targetname", 1 );
    var_5._id_0C72 = "human";
    var_5.cartag = "tag_driver";
    var_6 = maps\coup_code::scripted_spawn2( var_0 + "_frontright", "targetname", 1 );
    var_6._id_0C72 = "human";
    var_6.cartag = "tag_passenger";
    var_7 = maps\coup_code::scripted_spawn2( var_0 + "_backleft", "targetname", 1 );
    var_7._id_0C72 = "human";
    var_7.cartag = "tag_guy1";
    var_8 = maps\coup_code::scripted_spawn2( var_0 + "_backright", "targetname", 1 );
    var_8._id_0C72 = "human";
    var_8.cartag = "tag_guy0";
    var_3 _id_A510::_id_0BC7( var_5, "carjack_driver", "tag_detach" );
    var_3 _id_A510::_id_0BC7( var_6, "carjack_frontright", "tag_detach" );
    var_3 _id_A510::_id_0BC7( var_8, "carjack_backright", "tag_detach" );
    var_3 _id_A510::_id_0BFF( var_7, "carjack_backleft", "tag_detach" );

    if ( isdefined( var_1 ) )
        wait(var_1);

    var_5 thread carjacker( var_3, "carjack_driver", "cardriver_idle" );
    var_6 thread carjacker( var_3, "carjack_frontright", "carpassenger_idle" );
    var_8 thread carjacker( var_3, "carjack_backright", "carpassenger_idle" );
    var_3 thread _id_A510::_id_0C24( var_4, "carjack_victim", "tag_detach" );
    var_3 thread _id_A510::_id_0C24( var_3, "carjack_driver_door" );
    var_5 waittillmatch( "single anim", "start_others" );
    var_7 thread carjacker( var_3, "carjack_backleft", "carpassenger_idle" );
    var_3 thread _id_A510::_id_0C24( var_3, "carjack_others_door" );
}

carjacker( var_0, var_1, var_2 )
{
    var_0 _id_A510::_id_0C24( self, var_1, "tag_detach" );
}

fenceclimb( var_0, var_1, var_2 )
{
    var_3 = getent( var_0 + "_fenceclimb_node", "targetname" );
    var_4 = maps\coup_code::scripted_spawn2( var_0 + "_fenceclimb_civilian", "targetname", 1 );
    var_4._id_0C72 = "human";
    var_4._id_2B0E = 1;
    var_4 _id_A5A4::_id_7EAB( "run_panicked2", 1 );

    if ( isdefined( var_1 ) )
        wait(var_1);

    var_3 _id_A510::_id_0BFF( var_4, "wall_climb" );
    var_3 thread _id_A510::_id_0C24( var_4, "wall_climb" );
    var_5 = getent( var_4._id_04A4, "targetname" );
    var_4 thread _id_A581::_id_4248( var_5 );
    maps\coup_code::deleteentity( var_3 );
    var_4 thread maps\coup_code::deleteongoal();
}

fencedog( var_0, var_1, var_2 )
{
    var_3 = getent( var_0 + "_fencedog_node", "targetname" );
    var_4 = maps\coup_code::scripted_spawn2( var_0 + "_fencedog_dog", "targetname", 1 );
    var_4._id_0C72 = "dog";

    if ( isdefined( var_1 ) )
        wait(var_1);

    var_3 _id_A510::_id_0BFF( var_4, "fence_attack" );
    var_3 thread _id_A510::_id_0C24( var_4, "fence_attack" );
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_3 );
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_4 );
}

passenger_event()
{
    self waittill( "trigger" );

    if ( isdefined( self._id_0398 ) && isdefined( level.passenger_events[self._id_0398] ) )
    {
        if ( isdefined( level.passenger_events[self._id_0398].animation ) )
        {
            var_0 = level.passenger_events[self._id_0398].animation._id_0C6C;
            var_1 = level.passenger_events[self._id_0398].animation._id_27C0;

            if ( isdefined( var_1 ) )
                level _id_A5A4::_id_27EF( var_1, ::animthread, var_0 );
            else
                thread animthread( var_0 );
        }

        if ( isdefined( level.passenger_events[self._id_0398]._id_29E7 ) )
        {
            var_2 = level.passenger_events[self._id_0398]._id_29E7.soundalias;
            var_3 = level.passenger_events[self._id_0398]._id_29E7._id_27C0;

            if ( isdefined( var_3 ) )
                level _id_A5A4::_id_27EF( var_3, ::dialogthread, var_2 );
            else
                thread dialogthread( var_2 );
        }
    }
}

animthread( var_0 )
{
    level.car.passenger _meth_8143();
    level.car maps\coup_anim::playpassengeranim( var_0 );
    level.car maps\coup_anim::looppassengeranim( "carpassenger_idle" );
}

dialogthread( var_0 )
{
    level.car.passenger _meth_809C( var_0 );
}

loudspeaker_event()
{
    self waittill( "trigger" );

    if ( !isdefined( self._id_04A4 ) )
        return;

    var_0 = getent( self._id_04A4, "targetname" );

    if ( isdefined( var_0._id_0398 ) )
        var_0 _meth_809C( var_0._id_0398 );
}

crowdmember_setuptriggers()
{
    var_0 = common_scripts\utility::_id_3DBD();
    common_scripts\utility::_id_0CF0( var_0, ::crowdmember_triggerevent );

    if ( !isdefined( self._id_04A4 ) )
        return;

    var_1 = self._id_79B4;

    if ( !isdefined( var_1 ) )
        var_1 = 10;

    var_2 = self._id_0398;

    if ( !isdefined( var_2 ) )
        var_2 = "jeer";

    var_3 = getentarray( self._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_3, ::crowdmember_status, var_2, var_1 );
}

crowdmember_triggerevent( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = var_0._id_79B4;

    if ( !isdefined( var_1 ) )
        var_1 = 3;

    var_2 = var_0._id_0398;

    if ( !isdefined( var_2 ) )
        var_2 = "idle";

    var_3 = self.crowdstatus;
    self.crowdstatus = var_2;
    wait(var_1);
    self.crowdstatus = var_3;
}

crowdmember_status( var_0, var_1 )
{
    var_2 = self.crowdstatus;
    self.crowdstatus = var_0;
    wait(var_1);
    self.crowdstatus = var_2;
}

ending_shadowchange()
{
    _func_0D6( "sm_sunSampleSizeNear", "0.0625" );
    wait 8;
    thread maps\coup_code::lerpshadowdetail( 0.25, 1 );
}

ending_speech()
{
    var_0 = 13.25;
    var_1 = 27.6;
    level._id_0318 _id_A5A4::_id_27EF( var_0, maps\coup_code::playalasadspeech, "coup_kaa_laywaste", "Just as they lay waste to our country, we shall lay waste to theirs." );
    level._id_0318 _id_A5A4::_id_27EF( var_1, maps\coup_code::playalasadspeech, "coup_kaa_beginsa", "This is how it begins." );
    _id_A5A4::_id_27EF( var_0, ::subtitle, &"COUP_SUBTITLE_10", undefined, 3.8 );
    _id_A5A4::_id_27EF( var_1, ::subtitle, &"COUP_SUBTITLE_11", undefined, 1.6 );
}

ending_slowmo()
{
    wait 29.0;
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_assassination_slomo_ant" );
    wait 1.25;
    thread ending_heartbeat();
    _id_A5E8::_id_870C( "start_slowmo_mix" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_assassination_slomo_in" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_plr_vip_breathing_fear" );
    _id_A5A4::_id_8648();
    var_0 = 3.5;
    var_1 = 1;
    var_2 = 0.45;
    var_3 = 0.5;
    maps\coup_code::printslowmo( "lerping to walk speed" );
    _id_A5A4::_id_8646( var_2 );
    _id_A5A4::_id_8643( var_1 );
    _id_A5A4::_id_8640();
    wait(var_0);
    maps\coup_code::printslowmo( "walk time finished" );
    _id_A5A4::_id_8644( var_3 );
    _id_A5A4::_id_8645( 1 );
    _id_A5A4::_id_8641();
    maps\coup_code::printslowmo( "resuming normal speed" );
    _id_A5E8::_id_870C( "stop_slowmo_mix" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_assassination_slomo_out" );
    _id_A5A4::_id_863E();
}

ending_heartbeat()
{
    level endon( "player_death" );
    wait 1.3;
    level._id_0318 thread _id_A5A4::_id_69C4( "coup_breathing_heartbeat" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_coup_assassination_tension_rise" );
    wait 0.05;
    level._id_0318 _meth_80AF( "damage_light" );
    wait 0.95;
    level._id_0318 thread _id_A5A4::_id_69C4( "coup_breathing_heartbeat" );
    wait 0.05;
    level._id_0318 _meth_80AF( "damage_light" );
    wait 1.1;
    level._id_0318 thread _id_A5A4::_id_69C4( "coup_breathing_heartbeat" );
    wait 0.05;
    level._id_0318 _meth_80AF( "damage_light" );
}

_id_4DA6()
{
    level.namelist = [];
    addname( &"CREDIT_ROGER_ABRAHAMSSON_CAPS" );
    addname( &"CREDIT_MOHAMMAD_ALAVI_CAPS" );
    addname( &"CREDIT_TODD_ALDERMAN_CAPS" );
    addname( &"CREDIT_BRAD_ALLEN_CAPS" );
    addname( &"CREDIT_CHRISSY_ARYA_CAPS" );
    addname( &"CREDIT_RICHARD_BAKER_CAPS" );
    addname( &"CREDIT_CHAD_BARB_CAPS" );
    addname( &"CREDIT_ALESSANDRO_BARTOLUCCI_CAPS" );
    addname( &"CREDIT_KEITH_BELL_CAPS" );
    addname( &"CREDIT_PETE_BLUMEL_CAPS" );
    addname( &"CREDIT_MICHAEL_BOON_CAPS" );
    addname( &"CREDIT_ROBERT_BOWLING_CAPS" );
    addname( &"CREDIT_PETER_CHEN_CAPS" );
    addname( &"CREDIT_CHRIS_CHERUBINI_CAPS" );
    addname( &"CREDIT_GRANT_COLLIER_CAPS" );
    addname( &"CREDIT_KRISTIN_COTTERELL_CAPS" );
    addname( &"CREDIT_JON_DAVIS_CAPS" );
    addname( &"CREDIT_DERRIC_EADY_CAPS" );
    addname( &"CREDIT_JOEL_EMSLIE_CAPS" );
    addname( &"CREDIT_ROBERT_FIELD_CAPS" );
    addname( &"CREDIT_STEVE_FUKUDA_CAPS" );
    addname( &"CREDIT_ROBERT_GAINES_CAPS" );
    addname( &"CREDIT_MARK_GANUS_CAPS" );
    addname( &"CREDIT_FRANCESCO_GIGLIOTTI_CAPS" );
    addname( &"CREDIT_CHANCE_GLASCO_CAPS" );
    addname( &"CREDIT_PRESTON_GLENN_CAPS" );
    addname( &"CREDIT_JOEL_GOMPERT_CAPS" );
    addname( &"CREDIT_CHAD_GRENIER_CAPS" );
    addname( &"CREDIT_MARK_GRIGSBY_CAPS" );
    addname( &"CREDIT_JOHN_HAGGERTY_CAPS" );
    addname( &"CREDIT_EARL_HAMMON_JR_CAPS" );
    addname( &"CREDIT_JEFF_HEATH_CAPS" );
    addname( &"CREDIT_NEEL_KAR_CAPS" );
    addname( &"CREDIT_JAKE_KEATING_CAPS" );
    addname( &"CREDIT_RICHARD_KRIEGLER_CAPS" );
    addname( &"CREDIT_BRYAN_KUHN_CAPS" );
    addname( &"CREDIT_RYAN_LASTIMOSA_CAPS" );
    addname( &"CREDIT_OSCAR_LOPEZ_CAPS" );
    addname( &"CREDIT_CHENG_LOR_CAPS" );
    addname( &"CREDIT_HERBERT_LOWIS_CAPS" );
    addname( &"CREDIT_JULIAN_LUO_CAPS" );
    addname( &"CREDIT_STEVE_MASSEY_CAPS" );
    addname( &"CREDIT_MACKEY_MCCANDLISH_CAPS" );
    addname( &"CREDIT_DREW_MCCOY_CAPS" );
    addname( &"CREDIT_BRENT_MCLEOD_CAPS" );
    addname( &"CREDIT_PAUL_MESSERLY_CAPS" );
    addname( &"CREDIT_STEPHEN_MILLER_CAPS" );
    addname( &"CREDIT_TAEHOON_OH_CAPS" );
    addname( &"CREDIT_SAMI_ONUR_CAPS" );
    addname( &"CREDIT_VELINDA_PELAYO_CAPS" );
    addname( &"CREDIT_ERIC_PIERCE_CAPS" );
    addname( &"CREDIT_JON_PORTER_CAPS" );
    addname( &"CREDIT_ZIED_RIEKE_CAPS" );
    addname( &"CREDIT_LINDA_ROSEMEIER_CAPS" );
    addname( &"CREDIT_ALEXANDER_ROYCEWICZ_CAPS" );
    addname( &"CREDIT_MARK_RUBIN_CAPS" );
    addname( &"CREDIT_EMILY_RULE_CAPS" );
    addname( &"CREDIT_NICOLE_SCATES_CAPS" );
    addname( &"CREDIT_ALEXANDER_SHARRIGAN_CAPS" );
    addname( &"CREDIT_JON_SHIRING_CAPS" );
    addname( &"CREDIT_NATHAN_SILVERS_CAPS" );
    addname( &"CREDIT_GEOFFREY_SMITH_CAPS" );
    addname( &"CREDIT_RICHARD_SMITH_CAPS" );
    addname( &"CREDIT_JIESANG_SONG_CAPS" );
    addname( &"CREDIT_THEERAPOL_SRISUPHAN_CAPS" );
    addname( &"CREDIT_TODD_SUE_CAPS" );
    addname( &"CREDIT_SOMPOOM_TANGCHUPONG_CAPS" );
    addname( &"CREDIT_JANICE_TURNER_CAPS" );
    addname( &"CREDIT_RAYME_VINSON_CAPS" );
    addname( &"CREDIT_ZACH_VOLKER_CAPS" );
    addname( &"CREDIT_ANDREW_WANG_CAPS" );
    addname( &"CREDIT_JASON_WEST_CAPS" );
    addname( &"CREDIT_LEI_YANG_CAPS" );
    addname( &"CREDIT_VINCE_ZAMPELLA_CAPS" );
    level.namesize = 1.2;
    level.credits = spawnstruct();
    var_0 = 0;
    var_1[0] = "left";
    var_1[1] = "right";
    var_2[0] = 64;
    var_2[1] = -64;
    var_3 = 0;
    var_4[0] = "left";
    var_4[1] = "right";
    var_5 = 0;
    var_6 = undefined;

    for ( var_7 = 0; var_7 < level.namelist.size; var_7++ )
    {
        if ( var_5 == 0 )
            var_6 = createpage( var_1[var_0], var_2[var_0], 340 );

        var_6 addcredit( level.namelist[var_7], var_4[var_3] );

        if ( var_3 )
            var_3 = 0;
        else
            var_3 = 1;

        if ( var_5 >= 2 )
        {
            level.credits addpage( var_6 );
            var_5 = 0;

            if ( var_0 )
                var_0 = 0;
            else
                var_0 = 1;

            continue;
        }

        var_5++;
    }

    if ( var_5 )
        level.credits addpage( var_6 );
}

addname( var_0 )
{
    precachestring( var_0 );
    level.namelist[level.namelist.size] = var_0;
}

createpage( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.alignment = var_0;
    var_3._id_0530 = var_1;
    var_3._id_0538 = var_2;
    return var_3;
}

addpage( var_0 )
{
    if ( !isdefined( self.pages ) )
    {
        self.pages = [];
        self.pages[0] = var_0;
    }
    else
        self.pages[self.pages.size] = var_0;
}

addcredit( var_0, var_1 )
{
    if ( !isdefined( self._id_6048 ) )
        self._id_6048 = [];

    var_2 = spawnstruct();
    var_2._id_02A7 = var_0;
    var_2._id_2A6D = var_1;
    self._id_6048[self._id_6048.size] = var_2;
}

_id_6A3A()
{
    level waittill( "continue_credits" );
    wait 1;
    thread displaypage( level.credits.pages[0] );
    wait 5.25;
    thread displaypage( level.credits.pages[1] );
    wait 5.25;
    thread displaypage( level.credits.pages[2] );
    wait 5.25;
    thread displaypage( level.credits.pages[3] );
    level waittill( "continue_credits" );
    wait 1;
    thread displaypage( level.credits.pages[4] );
    wait 5.25;
    thread displaypage( level.credits.pages[5] );
    wait 5.25;
    thread displaypage( level.credits.pages[6] );
    wait 5.25;
    thread displaypage( level.credits.pages[7] );
    level waittill( "continue_credits" );
    wait 1;
    thread displaypage( level.credits.pages[8] );
    wait 5.25;
    thread displaypage( level.credits.pages[9] );
    wait 5.25;
    thread displaypage( level.credits.pages[10] );
    wait 5.25;
    thread displaypage( level.credits.pages[11] );
    wait 5.25;
    thread displaypage( level.credits.pages[12] );
    wait 5.25;
    thread displaypage( level.credits.pages[13] );
    wait 5.25;
    level waittill( "continue_credits" );
    wait 1;
    thread displaypage( level.credits.pages[14] );
    wait 5.25;
    thread displaypage( level.credits.pages[15] );
    level waittill( "continue_credits" );
    wait 1;
    thread displaypage( level.credits.pages[16] );
    wait 5.25;
    thread displaypage( level.credits.pages[17] );
    level waittill( "continue_credits" );
    wait 1;
    thread displaypage( level.credits.pages[18] );
    wait 5.25;
    thread displaypage( level.credits.pages[19] );
    wait 5.25;
    thread displaypage( level.credits.pages[20] );
    wait 5.25;
    thread displaypage( level.credits.pages[21] );
    wait 5.25;
    thread displaypage( level.credits.pages[22] );
    wait 5.25;
    thread displaypage( level.credits.pages[23] );
    wait 5.25;
    thread displaypage( level.credits.pages[24] );
}

displaypage( var_0 )
{
    var_1 = undefined;

    if ( isdefined( var_0._id_6048 ) )
    {
        for ( var_2 = 0; var_2 < var_0._id_6048.size; var_2++ )
        {
            var_1[var_2] = _func_1A9();
            var_1[var_2].alignx = var_0.alignment;
            var_1[var_2]._id_01F3 = var_0.alignment;

            if ( var_0.alignment == "left" )
                var_1[var_2]._id_0530 = var_0._id_0530 + var_2 * 46;
            else if ( var_0.alignment == "right" )
                var_1[var_2]._id_0530 = var_0._id_0530 + var_2 * 46 - 138;

            var_1[var_2]._id_0538 = var_0._id_0538 + var_2 * 16;
            var_1[var_2] _meth_80CC( var_0._id_6048[var_2]._id_02A7 );
            var_1[var_2]._id_0188 = "objective";
            var_1[var_2]._id_0189 = level.namesize;
            var_1[var_2]._id_03D4 = 2;
            var_1[var_2].color = ( 0.99, 0.97, 0.85 );
            var_1[var_2]._id_01BD = ( 0.96, 0.81, 0 );
            var_1[var_2]._id_01BC = 0.2;
            var_1[var_2] _meth_808B( 40, 4500, 600 );

            if ( var_0._id_6048[var_2]._id_2A6D == "left" )
            {
                var_1[var_2] _meth_8088( 5 );
                var_1[var_2]._id_0530 -= 12;
            }
            else if ( var_0._id_6048[var_2]._id_2A6D == "right" )
            {
                var_1[var_2] _meth_8088( 5 );
                var_1[var_2]._id_0530 += 12;
            }

            wait 0.6;
        }
    }

    wait 4.5;

    if ( isdefined( var_1 ) )
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            var_1[var_2] _meth_808A();
    }
}

openintrodoors()
{
    common_scripts\utility::_id_383F( "doors_open" );
    thread openintroleftdoor();
    thread openintrorightdoor();
}

openintroleftdoor()
{
    var_0 = getent( "intro_leftdoor", "targetname" );
    var_1 = 1;
    var_0 _meth_82B3( 180, var_1, var_1 * 0.5, var_1 * 0 );
    var_0 waittill( "rotatedone" );
    var_1 = 1;
    var_0 _meth_82B3( -60, var_1, var_1 * 0, var_1 * 1 );
}

openintrorightdoor()
{
    var_0 = getent( "intro_rightdoor", "targetname" );
    var_1 = 1;
    var_0 _meth_82B3( -180, var_1, var_1 * 0.5, var_1 * 0 );
    var_0 waittill( "rotatedone" );
    var_1 = 1;
    var_0 _meth_82B3( 60, var_1, var_1 * 0, var_1 * 1 );
}

removedroneweapon()
{
    var_0 = self _meth_802C();

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = self _meth_802E( var_1 );

        if ( var_2 == "tag_weapon_right" )
        {
            var_3 = self _meth_802D( var_1 );
            self _meth_802A( var_3, var_2 );
        }
    }
}

setweapon( var_0 )
{
    animscripts\shared::_id_6869( self._id_0513, var_0 );
}

_id_8027( var_0 )
{
    self._id_04A7 = var_0;
}

setsightdist( var_0 )
{
    self.maxsightdstsqrd = var_0;
}

setrandomrun( var_0 )
{
    _id_A5A4::_id_7EAB( var_0[_func_0B2( var_0.size )], 1 );
}

kickdoor( var_0, var_1 )
{
    self waittillmatch( "single anim", "kick" );
    var_0 thread _id_A510::_id_0C24( var_1, "doorkick" );
    var_1 _meth_809C( "wood_door_kick" );
}

doorkick( var_0, var_1, var_2, var_3, var_4 )
{
    var_0._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_5 = 0;
    var_6 = 0;
    var_7 = _func_0B7( self.angles[1] );
    var_8 = _func_0B6( self.angles[1] );
    var_9 = var_7 * var_5 - var_8 * var_6;
    var_10 = var_8 * var_5 + var_7 * var_6;
    var_11 = ( var_9, var_10, 0 );
    var_12 = ( 0, -90, 0 );
    var_13 = spawn( "script_origin", self._id_02E2 + var_11 );
    var_13.angles = self.angles + var_12;
    var_14 = _id_A5A4::_id_88D1( "door" );
    var_14._id_02E2 = var_13._id_02E2;
    var_14.angles = var_13.angles;
    var_13 thread _id_A510::_id_0BC7( var_14, "doorkick" );

    if ( isdefined( var_4 ) )
    {
        thread _id_A510::_id_0BFF( var_0, "doorkick_left_idle" );
        _id_A510::_id_0BFF( var_1, "doorkick_right_idle" );
    }

    thread _id_A510::_id_0BC7( var_0, "doorkick_left_idle" );
    thread _id_A510::_id_0BC7( var_1, "doorkick_right_idle" );

    if ( isdefined( var_2 ) )
        wait(var_2);

    var_0 thread kickdoor( var_13, var_14 );
    thread _id_A510::_id_0C24( var_1, "doorkick_right_stepout_runin" );
    _id_A510::_id_0C24( var_0, "doorkick_left_stepout" );
    _id_A510::_id_0C24( var_0, "doorkick_left_runin" );
    _id_A5A4::_id_27EF( var_3, maps\coup_code::deleteentity, var_13 );
    _id_A5A4::_id_27EF( var_3, maps\coup_code::deleteentity, var_14 );
    _id_A5A4::_id_27EF( var_3, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( var_3, maps\coup_code::deleteentity, var_1 );
}

ziptie( var_0, var_1, var_2 )
{
    switch ( var_0 )
    {
        case "ziptie1a":
            var_3 = "intro_soldierholdcivilian";
            var_4 = "intro_civilianliesdown";
            var_5 = getent( "car_events_node", "targetname" );
            var_6 = 0;
            var_7 = 0;
            var_8 = 1;
            break;
        default:
            var_3 = "ziptie_guard";
            var_4 = "ziptie_civilian";
            var_5 = getent( var_0 + "_node", "targetname" );
            var_6 = 1;
            var_7 = 1;
            var_8 = 0;
            break;
    }

    var_9 = maps\coup_code::scripted_spawn2( var_0 + "_guard", "targetname", 1 );
    var_9._id_0C72 = "human";
    var_9.ignoreweaponintracksuitmode = 1;

    if ( var_8 )
        var_9 maps\coup_code::opfor_swaphead_for_facialanim();

    var_10 = maps\coup_code::scripted_spawn2( var_0 + "_civilian", "targetname", 1 );
    var_10._id_0C72 = "human";
    var_5 thread _id_A510::_id_0BC7( var_9, var_3 );
    var_5 thread _id_A510::_id_0BC7( var_10, var_4 );

    if ( isdefined( var_1 ) )
        wait(var_1);

    if ( var_6 == 1 )
        _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_5 );

    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_9 );
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_10 );
    var_5 thread _id_A510::_id_0C24( var_9, var_3 );
    var_5 _id_A510::_id_0C24( var_10, var_4 );

    if ( var_7 == 1 )
        var_5 _id_A510::_id_0BE1( var_10, "ziptie_civilian_idle" );
}

ziptied( var_0, var_1 )
{
    var_0._id_0C72 = "human";
    var_0 removedroneweapon();
    var_2 = getent( var_0._id_04A4, "targetname" );
    var_2 thread _id_A510::_id_0BE1( var_0, "ziptie_civilian_idle" );
    _id_A5A4::_id_27EF( var_1, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( var_1, maps\coup_code::deleteentity, var_2 );
}

gunpoint_stand( var_0, var_1, var_2 )
{
    var_0._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_0 thread _id_A510::_id_0BE1( var_0, "aim_straight" );
    var_1 thread _id_A510::_id_0BE1( var_1, "cowerstand_pointidle" );
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_1 );
}

gunpoint_crouch( var_0, var_1, var_2 )
{
    var_0._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_0 thread _id_A510::_id_0BE1( var_0, "aim_straight" );
    var_1 thread _id_A510::_id_0BE1( var_1, "cowercrouch_idle" );
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_0 );
    _id_A5A4::_id_27EF( var_2, maps\coup_code::deleteentity, var_1 );
}

garage( var_0, var_1, var_2, var_3 )
{
    var_0._id_0C72 = "human";
    var_1._id_0C72 = "human";
    var_1._id_2B0E = 1;
    var_4[0] = "run_panicked1";
    var_4[1] = "run_panicked2";
    var_1 setrandomrun( var_4 );
    var_5 = anglestoforward( self.angles ) * -22;
    self._id_02E2 += var_5;
    var_2._id_02E2 += ( 0, 0, 51.013 );
    var_6 = getent( "intro_node", "targetname" );
    var_6 thread _id_A510::_id_0C24( var_1, "civilians_running_garage" );
    common_scripts\utility::_id_384A( "spawn_garage_operator" );
    _id_A510::_id_0BC7( var_0, "close_garage_a" );
    common_scripts\utility::_id_384A( "animate_garage_operator" );
    thread _id_A510::_id_0C24( var_0, "close_garage_a" );
    wait 1;
    var_2 _meth_804F( var_0, "TAG_WEAPON_CHEST" );
    var_0 waittillmatch( "single anim", "end" );
    var_2 _meth_8051();
    var_0 delete();
    var_1 _meth_8143();
    var_1 delete();
}

windowshout( var_0 )
{
    var_0._id_0C72 = "human";
    var_0 removedroneweapon();
    var_0 thread _id_A510::_id_0C24( var_0, "window_shout_a" );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_0 );
}

leaningguard( var_0 )
{
    var_0._id_0C72 = "leaning_guard";
    var_0 thread _id_A573::_id_0DDC();
    var_0 thread _id_A510::_id_0BE1( var_0, "leaning_smoking_idle" );
    _id_A5A4::_id_27EF( 20, maps\coup_code::deleteentity, var_0 );
}

attackside( var_0, var_1 )
{
    var_2 = spawn( "script_origin", self._id_02E2 );
    var_2.angles = self.angles;
    var_0._id_0C72 = "human";
    self._id_0C72 = "human";
    var_0._id_0179 = self;
    var_2 thread _id_A510::_id_0C24( var_0, "sneakattack_attack_side" );
    var_2 thread _id_A510::_id_0C24( self, "sneakattack_defend_side" );
    _id_A5A4::_id_27EF( var_1, maps\coup_code::deleteentity, var_0 );
}

attackbehind( var_0, var_1 )
{
    var_2 = spawn( "script_origin", self._id_02E2 );
    var_2.angles = self.angles;
    var_0._id_0C72 = "human";
    self._id_0C72 = "human";
    var_0._id_0179 = self;
    var_2 _id_A510::_id_0BFF( var_0, "sneakattack_attack_behind" );
    var_2 thread _id_A510::_id_0C24( var_0, "sneakattack_attack_behind" );
    var_2 thread _id_A510::_id_0C24( self, "sneakattack_defend_behind" );
    _id_A5A4::_id_27EF( var_1, maps\coup_code::deleteentity, var_0 );
}

celebrate()
{
    self endon( "death" );
    var_0["up"]["idle"] = "crowdmember_gunup_idle";
    var_0["up"]["jeer"] = "crowdmember_gunup_idle";
    var_0["up"]["fire"][0] = "crowdmember_gunup_fire";
    var_0["up"]["fire"][1] = "crowdmember_soldier_welcome_3";
    var_0["down"]["idle"] = "crowdmember_gundown_idle";
    var_0["down"]["jeer"] = "crowdmember_gundown_jeer";
    var_0["down"]["fire"][0] = "crowdmember_gundown_fire_a";
    var_0["down"]["fire"][1] = "crowdmember_gundown_fire_b";
    var_1[0] = "up";
    var_1[1] = "down";
    var_2 = var_1[_func_0B2( var_1.size )];
    self.crowdanims_starting = 1;
    self.crowdstatus = "idle";
    var_3 = undefined;

    for (;;)
    {
        if ( self.crowdstatus == "fire" )
            var_3 = var_0[var_2]["fire"][_func_0B2( var_0[var_2]["fire"].size )];
        else
            var_3 = var_0[var_2][self.crowdstatus];

        if ( isdefined( self.crowdanims_starting ) )
        {
            var_4 = _id_A5A4::_id_3EF5( var_3 );
            var_5 = _func_0B5( 0, 1.0 );
            thread delaysetanimtime( var_4, var_5, 0.05 );
            self.crowdanims_starting = undefined;
        }

        _id_A510::_id_0C24( self, var_3 );
        _id_A510::_id_0C24( self, var_0[var_2]["idle"] );
    }
}

delaysetanimtime( var_0, var_1, var_2 )
{
    wait(var_2);
    self _meth_8119( var_0, var_1 );
}

music_start()
{
    _id_A5A4::_id_6008( "music_coup_intro" );
}

music_end()
{
    _func_076( 1.0 );
    _id_A5A4::_id_6008( "coup_b_section_music" );
}

drive_carsounds()
{

}

playcarsound( var_0 )
{
    thread _id_A5A4::_id_69C4( var_0 );
}

addpassengerevent( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level.passenger_events ) )
        level.passenger_events = [];

    if ( !isdefined( level.passenger_events[var_0] ) )
        level.passenger_events[var_0] = spawnstruct();

    if ( var_1 == "animation" )
    {
        var_4 = spawnstruct();
        var_4._id_0C6C = var_2;
        var_4._id_27C0 = var_3;
        level.passenger_events[var_0].animation = var_4;
    }
    else if ( var_1 == "dialog" )
    {
        var_5 = spawnstruct();
        var_5.soundalias = var_2;
        var_5._id_27C0 = var_3;
        level.passenger_events[var_0]._id_29E7 = var_5;
    }
}

removeweapon()
{
    if ( _func_0CF( self ) )
        _id_A5A4::_id_4462();
    else
    {
        var_0 = self _meth_802C();

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            var_2 = self _meth_802D( var_1 );

            if ( var_2 == self._id_0513 )
                self _meth_802A( var_2 );
        }
    }
}

initsubtitles()
{
    precachestring( &"COUP_SUBTITLE_01A" );
    _func_259( "COUP_SUBTITLE_01A", "fonts/default.otf", 19, 1 );
    precachestring( &"COUP_SUBTITLE_01B" );
    _func_259( "COUP_SUBTITLE_01B", "fonts/default.otf", 19, 1 );
    precachestring( &"COUP_SUBTITLE_02A" );
    precachestring( &"COUP_SUBTITLE_02B" );
    precachestring( &"COUP_SUBTITLE_03A" );
    precachestring( &"COUP_SUBTITLE_03B" );
    precachestring( &"COUP_SUBTITLE_04" );
    precachestring( &"COUP_SUBTITLE_05A" );
    precachestring( &"COUP_SUBTITLE_05B" );
    precachestring( &"COUP_SUBTITLE_06A" );
    precachestring( &"COUP_SUBTITLE_06B" );
    precachestring( &"COUP_SUBTITLE_07" );
    precachestring( &"COUP_SUBTITLE_08A" );
    precachestring( &"COUP_SUBTITLE_08B" );
    precachestring( &"COUP_SUBTITLE_09" );
    precachestring( &"COUP_SUBTITLE_10" );
    precachestring( &"COUP_SUBTITLE_11" );
}

subtitlesequence()
{
    _id_A5A4::_id_27EF( level.coup_kaa_onenation_timing, ::subtitle, &"COUP_SUBTITLE_01A", &"COUP_SUBTITLE_01B", 8.5 );
    _id_A5A4::_id_27EF( level.coup_kaa_newera_timing, ::subtitle, &"COUP_SUBTITLE_02A", &"COUP_SUBTITLE_02B", 8.8, 1 );
    _id_A5A4::_id_27EF( level.coup_kaa_selfinterest_timing, ::subtitle, &"COUP_SUBTITLE_03A", &"COUP_SUBTITLE_03B", 13, 1 );
    _id_A5A4::_id_27EF( level.coup_kaa_notenslaved_timing, ::subtitle, &"COUP_SUBTITLE_04", undefined, 5, 1 );
    _id_A5A4::_id_27EF( level.coup_kaa_donotfear_timing, ::subtitle, &"COUP_SUBTITLE_05A", &"COUP_SUBTITLE_05B", 9.8 );
    _id_A5A4::_id_27EF( level.coup_kaa_freefromyoke_timing, ::subtitle, &"COUP_SUBTITLE_06A", &"COUP_SUBTITLE_06B", 6.5, 1 );
    _id_A5A4::_id_27EF( level.coup_kaa_armiesstrong_timing, ::subtitle, &"COUP_SUBTITLE_07", undefined, 3.5 );
    _id_A5A4::_id_27EF( level.coup_kaa_greatnation_timing, ::subtitle, &"COUP_SUBTITLE_08A", &"COUP_SUBTITLE_08B", 12.2, 1 );
    _id_A5A4::_id_27EF( level.coup_kaa_begun_timing, ::subtitle, &"COUP_SUBTITLE_09", undefined, 3.2 );
}

subtitle( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_1A9();
    var_4._id_0530 = 0;
    var_4._id_0538 = -64;
    var_4 _meth_80CC( var_0 );
    var_4._id_0188 = "subtitle";
    var_4._id_0189 = 1.0;
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4._id_01F3 = "center";
    var_4._id_0501 = "bottom";
    var_4._id_03D4 = 1;
    var_5 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_5 = _func_1A9();
        var_5._id_0530 = 0;
        var_5._id_0538 = -50;
        var_5 _meth_80CC( var_1 );
        var_5._id_0188 = "subtitle";
        var_5._id_0189 = 1.0;
        var_5.alignx = "center";
        var_5.aligny = "middle";
        var_5._id_01F3 = "center";
        var_5._id_0501 = "bottom";
        var_5._id_03D4 = 1;
    }

    wait(var_2);
    var_4 _meth_808A();

    if ( isdefined( var_5 ) )
        var_5 _meth_808A();

    if ( isdefined( var_3 ) )
        level notify( "continue_credits" );
}

playmirrorvideo()
{
    common_scripts\utility::_id_384A( "start_car_rearview_mirror_video" );
    _func_0D6( "cg_cinematicFullScreen", "0" );
    wait 4.5;
    _func_05A( "coup_car_rearviewmirror", 0 );
}

animvarietyforshorerunners()
{
    common_scripts\utility::_id_384A( "drive_shorerunners" );
    var_0 = [];
    var_0[0] = maps\coup_code::scripted_spawn2( "first_runner", "targetname", 1 );
    var_0[0] _id_A5A4::_id_7E45( "npcline_run_generic", 1 );
    wait 0.1;
    var_0[1] = maps\coup_code::scripted_spawn2( "second_runner", "targetname", 1 );
    var_0[1] _id_A5A4::_id_7E45( "npcline_run_generic", 1 );
    wait 0.25;
    var_0[2] = maps\coup_code::scripted_spawn2( "third_runner", "targetname", 1 );
    var_0[2] _id_A5A4::_id_7E45( "npcline_run_generic", 1 );
    var_0[0] _id_A5A4::_id_27EF( 9, _id_A5A4::_id_7E45, "npcline_run_wavearm", 1 );
    var_0[0] _id_A5A4::_id_27EF( 11.25, _id_A5A4::_id_7E45, "npcline_run_generic", 1 );
    var_0[1] _id_A5A4::_id_27EF( 1.5, _id_A5A4::_id_7E45, "npcline_run_headdown", 1 );
    var_0[1] _id_A5A4::_id_27EF( 11, _id_A5A4::_id_7E45, "npcline_run_generic", 1 );
    var_0[2] _id_A5A4::_id_27EF( 8, _id_A5A4::_id_7E45, "npcline_run_lookback", 1 );
    var_0[2] _id_A5A4::_id_27EF( 9.75, _id_A5A4::_id_7E45, "npcline_run_generic", 1 );
    var_0[0] _id_A5A4::_id_27EF( 9, _id_A5A4::_id_69C4, "coup_shorerunner_wavearm" );
    var_0[2] _id_A5A4::_id_27EF( 9.75, _id_A5A4::_id_69C4, "coup_shorerunner_lookback" );
}

anim_variety_for_ending_crowd()
{
    var_0 = maps\coup_code::scripted_array_spawn( "ending_celebratingguards_h1_variedanim_1stfloor", "targetname", 1 );
    var_1 = maps\coup_code::scripted_array_spawn( "ending_celebratingguards_h1_variedanim_balcony", "targetname", 1 );
    var_2["1stfloor"][0] = "crowdmember_witnessing_arrival_taunt";
    var_2["1stfloor"][1] = "crowdmember_witnessing_arrival_cutroat_1";
    var_2["1stfloor"][2] = "crowdmember_witnessing_arrival_cutroat_2";
    var_2["1stfloor"][3] = "crowdmember_witnessing_arrival_spitting";
    var_2["1stfloor"][4] = "crowdmember_witnessing_arrival_gunup";
    var_2["1stfloor"][5] = "crowdmember_witnessing_arrival_crossedarms";
    var_2["balcony"][0] = "crowdmember_witnessing_arrival_gunup";
    var_2["balcony"][1] = "crowdmember_witnessing_arrival_crossedarms";

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_2["1stfloor"][_func_0B2( var_2["1stfloor"].size )];
        var_0[var_3]._id_0C72 = "human";
        var_5 = _func_0B3( 3 );
        var_0[var_3] _id_A5A4::_id_27EF( var_5, _id_A510::_id_0BE1, var_0[var_3], var_4 );
    }

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_2["balcony"][_func_0B2( var_2["balcony"].size )];
        var_1[var_3]._id_0C72 = "human";
        var_5 = _func_0B3( 3 );
        var_1[var_3] _id_A5A4::_id_27EF( var_5, _id_A510::_id_0BE1, var_1[var_3], var_4 );
    }
}

animvarietyforalleyrunners()
{
    common_scripts\utility::_id_384A( "drive_alleyrunners" );
    var_0 = [];
    var_0[0] = maps\coup_code::scripted_spawn2( "first_soldier", "targetname", 1 );
    var_0[0] _id_A5A4::_id_7E45( "npcline_run_generic", 1 );
    wait 0.3;
    var_0[1] = maps\coup_code::scripted_spawn2( "second_soldier", "targetname", 1 );
    var_0[1] _id_A5A4::_id_7E45( "npcline_run_generic", 1 );
    wait 0.3;
    var_0[2] = maps\coup_code::scripted_spawn2( "third_soldier", "targetname", 1 );
    var_0[2] _id_A5A4::_id_7E45( "npcline_run_generic", 1 );
    wait 0.3;
    var_0[3] = maps\coup_code::scripted_spawn2( "fourth_soldier", "targetname", 1 );
    var_0[3] _id_A5A4::_id_7E45( "npcline_run_generic", 1 );
    var_0[0] _id_A5A4::_id_27EF( 2.5, _id_A5A4::_id_7E45, "npcline_run_lookback", 1 );
    var_0[0] _id_A5A4::_id_27EF( 5, _id_A5A4::_id_7E45, "npcline_run_generic", 1 );
    var_0[1] _id_A5A4::_id_27EF( 3.5, _id_A5A4::_id_7E45, "npcline_run_headdown", 1 );
    var_0[1] _id_A5A4::_id_27EF( 4.5, _id_A5A4::_id_7E45, "npcline_run_generic", 1 );
    var_0[2] _id_A5A4::_id_27EF( 3.5, _id_A5A4::_id_7E45, "npcline_run_wavearm", 1 );
    var_0[2] _id_A5A4::_id_27EF( 6, _id_A5A4::_id_7E45, "npcline_run_generic", 1 );
    var_0[3] _id_A5A4::_id_27EF( 4.5, _id_A5A4::_id_7E45, "npcline_run_lookback", 1 );
    var_0[3] _id_A5A4::_id_27EF( 6, _id_A5A4::_id_7E45, "npcline_run_generic", 1 );
    var_0[0] _id_A5A4::_id_27EF( 2.5, _id_A5A4::_id_69C4, "coup_runner_move" );
    var_0[2] _id_A5A4::_id_27EF( 3.5, _id_A5A4::_id_69C4, "coup_runner_follow" );
    wait 20;

    foreach ( var_2 in var_0 )
        var_2 _id_A5A4::_id_27EF( _func_0B3( 0.5 ), _id_A5A4::_id_1EBB );
}

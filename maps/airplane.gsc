// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\airplane_fx::main();
    maps\airplane_anim::main();
    maps\airplane_precache::main();
    maps\createart\airplane_art::main();
    _id_A550::main();
    level thread maps\airplane_amb::main();
    maps\airplane_lighting::main();
    player_start();
}

player_start()
{
    var_0 = getent( "player_intro_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
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

    _func_0D6( "r_specularcolorscale", "1.2" );
    initprecache();

    if ( getdvar( "alt_music" ) == "" )
        setdvar( "alt_music", "0" );

    if ( getdvar( "airmasks" ) == "" )
        setdvar( "airmasks", "1" );

    if ( getdvar( "notimer" ) == "" )
        setdvar( "notimer", "0" );

    if ( getdvar( "airplane_debug" ) == "" )
        setdvar( "airplane_debug", "0" );

    _func_0D6( "g_friendlyNameDist", 0 );

    if ( getdvar( "humanshield_magicbullet_shots" ) == "" )
        setdvar( "humanshield_magicbullet_shots", 4 );

    level.peoplespeaking = 0;
    level.firstaxiskilled = 0;
    level.timebetweenhostiledown = 5;
    level.hostiledownbeingspoken = 0;
    level.playergotheadshot = 0;
    level.sightdetectdistance = 512;
    level.alertdistance = 128;
    level._id_89CB = ::ai_think;
    level._id_2EFA = ::ai_drone_think;
    level.acolornodetriggers = [];
    var_0 = getentarray( "trigger_multiple", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_0398 ) && _func_122( var_0[var_1]._id_0398, 0, 10 ) == "colornodes" )
            level.acolornodetriggers = common_scripts\utility::_id_0CDA( level.acolornodetriggers, var_0[var_1] );
    }

    _id_A5A4::_id_079C( "breach", ::start_breach, &"STARTS_BREACH" );
    _id_A5A4::_id_079C( "vip", ::start_vip, &"STARTS_VIP" );
    _id_A5A4::_id_079C( "freefall", ::start_freefall, &"STARTS_FREEFALL" );
    _id_A5A4::_id_079C( "demo", ::start_demo, &"STARTS_DEMO" );
    _id_A5A4::_id_278B( ::start_default );
    thread no_grenade_death_hack();
    thread breach_compartment_setup();
    maps\createart\airplane_art::main();
    level thread maps\airplane_fx::main();
    maps\airplane_anim::main();
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_m16_clip";
    level.weaponclipmodels[1] = "weapon_mp5_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    maps\airplane_precache::main();
    _id_A550::main();
    level thread maps\airplane_amb::main();
    maps\airplane_lighting::main();
    maps\airplane_aud::main();

    if ( getdvar( "use_old_intro_fade_in" ) == "1" )
        thread intro_fade_in();
    else
        thread intro_fade_in_h1();

    _id_A5A4::_id_1332( "allies" );
    thread player_breach_jump();
    common_scripts\utility::_id_383D( "obj_rescue_vip_given" );
    common_scripts\utility::_id_383D( "obj_rescue_vip_complete" );
    common_scripts\utility::_id_383D( "obj_freefall_given" );
    common_scripts\utility::_id_383D( "obj_freefall_complete" );
    common_scripts\utility::_id_383D( "aa_first_floor_section" );
    common_scripts\utility::_id_383D( "aa_second_floor_section" );
    common_scripts\utility::_id_383D( "aa_humanshield_section" );
    common_scripts\utility::_id_383D( "timer_expired" );
    common_scripts\utility::_id_383D( "destabilize_level_2" );
    common_scripts\utility::_id_383D( "enemies_alerted" );
    common_scripts\utility::_id_383D( "intro_fade_in_complete" );
    common_scripts\utility::_id_383D( "bathroom_guy_dead" );
    common_scripts\utility::_id_383D( "bathroom_dude_clear" );
    common_scripts\utility::_id_383D( "fuselage_about_to_blow" );
    common_scripts\utility::_id_383D( "fuselage_breached" );
    common_scripts\utility::_id_383D( "human_shield_starting" );
    common_scripts\utility::_id_383D( "player_looking_at_human_shield" );
    common_scripts\utility::_id_383D( "hostage_timer_expired" );
    common_scripts\utility::_id_383D( "human_shield_actors_spawned" );
    common_scripts\utility::_id_383D( "terrorist_killed" );
    common_scripts\utility::_id_383D( "terrorist_wounded" );
    common_scripts\utility::_id_383D( "human_shield_over" );
    common_scripts\utility::_id_383D( "friendlies_killed_human_shield" );
    common_scripts\utility::_id_383D( "restore_timescale" );
    common_scripts\utility::_id_383D( "hostage_idling_for_freefall" );
    common_scripts\utility::_id_383D( "exit_door_about_to_blow" );
    common_scripts\utility::_id_383D( "exit_door_blown" );
    common_scripts\utility::_id_383D( "freefallers_jumping" );
    common_scripts\utility::_id_383D( "friendlies_jumped" );
    common_scripts\utility::_id_383D( "hostage_jumped_out" );
    common_scripts\utility::_id_383D( "player_jumped_out" );
    common_scripts\utility::_id_383D( "white_done" );
    common_scripts\utility::_id_383D( "plane_explodes" );
    common_scripts\utility::_id_383D( "cut_to_black" );
    setomnvar( "ui_airplane_init", 1 );
    thread dialogue_move();
    thread dialogue_clear();
    level._id_6D5E = 0.85;
    level._id_0318 _meth_81E4( level._id_6D5E );
    common_scripts\utility::_id_0D13( getentarray( "civilian", "script_noteworthy" ), ::ai_civilian_think );
    level.org_view_roll = getent( "org_view_roll", "targetname" );
    level.arollers = [];
    level.arollers = common_scripts\utility::_id_0CDA( level.arollers, level.org_view_roll );
    thread airmasks();
    thread plane_tilt();
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "ignored" );
    createthreatbiasgroup( "oblivious" );
    level._id_0318 _meth_817B( "player" );
    setignoremegroup( "allies", "oblivious" );
    setignoremegroup( "axis", "oblivious" );
    setignoremegroup( "player", "oblivious" );
    setignoremegroup( "oblivious", "allies" );
    setignoremegroup( "oblivious", "axis" );
    setignoremegroup( "oblivious", "oblivious" );
    common_scripts\utility::_id_0D13( getentarray( "human_shield", "targetname" ), _id_A5A4::_id_0798, ::ai_human_shield_think );
    common_scripts\utility::_id_0D13( getentarray( "patroller", "script_noteworthy" ), _id_A5A4::_id_0798, ::ai_patroller );
    common_scripts\utility::_id_0D13( getentarray( "scripted_node_dummies", "targetname" ), maps\jake_tools::_id_4855 );
    thread airplane_destabilize();
    thread fx_management();
    thread maps\jake_tools::_id_486B();
    thread airplane_wibble_setup();
    thread conference_shotgun_guy();
}

start_default()
{
    aa_intro_init();
    var_0 = getent( "plane_shell", "targetname" );
    var_0 _meth_8056();
}

start_breach()
{
    initfriendlies( "breach" );
    aa_breach_init();
}

start_vip()
{
    initfriendlies( "vip" );
    aa_vip_init();
}

start_freefall()
{
    initfriendlies( "freefall" );
    thread door_open_double( getentarray( "door_bar", "targetname" ) );
    common_scripts\utility::_id_383F( "human_shield_over" );
    aa_freefall_init();
}

start_demo()
{
    thread demo_setup();
    demo_walkthrough();
}

aa_intro_init()
{
    initfriendlies( "intro" );
    thread _id_5FFB();
    thread intro_setup();
    thread stealth_intro();
    thread airplane_timer();
    thread obj_rescue_vip();
    thread flashbang_detect();
    thread weapon_detect();
    level thread aa_breach_init();
    level thread aa_vip_init();
    _id_A5E8::_id_870C( "aud_start_intro_checkpoint" );
    common_scripts\utility::_id_383F( "aa_first_floor_section" );
}

intro_fade_in()
{
    var_0 = maps\jake_tools::_id_23D0( "black", 1 );
    var_1 = getent( "cutaway_geo_floor", "targetname" );
    var_1 _meth_8056();
    var_2 = maps\jake_tools::_id_23D0( "airplane_hole_overlay", 1 );
    level._id_0318 _meth_831A();
    var_3 = getent( "cutaway_geo", "targetname" );
    var_4 = getent( "org_intro_playerview", "targetname" );
    level._id_0318._id_02E2 = var_4._id_02E2;
    level._id_0318 _meth_807E( var_4, undefined, 0, 0, 0, 0 );
    var_4._id_02E2 += ( 0, 20, -52 );
    level._id_0318 _meth_8326( 1 );
    var_5 = spawn( "script_origin", var_4._id_02E2 );
    var_5.angles = var_4.angles;
    level._id_0318 _meth_8093( var_5 );
    var_5 _meth_82B2( 65, 0.05 );
    var_4 _meth_82B4( -10, 0.05 );
    var_3._id_02E2 += ( 15, 20, -10 );
    wait 0.2;
    level._id_6F7C _meth_8056();
    var_0.alpha = 0;
    thread cutaway_geo( var_3 );
    wait 0.3;
    var_0 = maps\jake_tools::_id_23D0( "black", 0 );
    var_0 _meth_8086( 1 );
    var_0.alpha = 1;
    wait 1;
    var_2 _meth_808A();
    setomnvar( "ui_gasmask", 1 );
    level._id_0318 _meth_8093( level.org_view_roll );
    level._id_6F7C _meth_8055();
    level._id_0318 _meth_8051();
    var_6 = getent( "player_intro_start", "targetname" );
    thread common_scripts\utility::_id_69C2( "gear_rattle_plr_run", level._id_0318._id_02E2 );
    level._id_0318 _meth_8335( var_6._id_02E2 );
    level._id_0318 _meth_8337( var_6.angles );
    level._id_0318.angles = var_6.angles;
    common_scripts\utility::_id_383F( "intro_fade_in_complete" );
    var_1 _meth_8055();
    var_0 _meth_8086( 2 );
    var_0.alpha = 0;
    var_3 _meth_8056();
    var_3 _meth_82BB();
    level._id_0318 _meth_831B();
    level._id_0318 _meth_8326( 0 );
    _id_A5A4::_id_114F();
    wait 2;
    var_0 _meth_808A();
}

intro_fade_in_h1()
{
    var_0 = maps\jake_tools::_id_23D0( "black", 1 );
    var_1 = getent( "player_intro_start", "targetname" );
    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( var_1.angles );
    level._id_0318.angles = var_1.angles;
    level._id_0318 _meth_831A();
    level._id_0318 _meth_8326( 1 );
    var_2 = getent( "cutaway_geo", "targetname" );
    var_2 _meth_8056();
    var_2 _meth_82BB();
    wait 0.1;
    thread _id_A5A4::_id_114F();
    common_scripts\utility::_id_383F( "intro_fade_in_complete" );
    setomnvar( "ui_gasmask", 1 );
    var_0 _meth_8086( 1 );
    var_0.alpha = 0;
    level._id_0318 _meth_831B();
    wait 1.0;
    level._id_0318 _meth_8326( 0 );
    wait 1.0;
    var_0 _meth_808A();
}

cutaway_geo( var_0 )
{
    level._id_0318 thread _id_A5A4::_id_69C4( "airplane_panel_drop" );
    var_0 _meth_82B4( -10, 0.3, 0.1, 0.1 );
    var_0 _meth_82AD( -110, 0.7, 0.2 );
    wait 0.3;
    wait 0.2;
    var_0 _meth_82B4( 10, 0.15, 0.05, 0.05 );
    wait 0.15;
    wait 0.15;
    _func_18C( 0.1, 0.5, level._id_0318._id_02E2, 500 );
    level._id_0318 _meth_80AF( "generic_attack_light_500" );
}

intro_fade_in2()
{
    var_0 = getent( "cutaway_geo", "targetname" );
    var_0 _meth_8056();
    var_0 _meth_82BB();
    level._id_0318 _meth_831A();
    level._id_0318 _meth_8326( 1 );
    var_1 = maps\jake_tools::_id_23D0( "black", 1 );
    wait 2;
    setomnvar( "ui_gasmask", 1 );
    var_1 _meth_8086( 2 );
    var_1.alpha = 0;
    level._id_0318 _meth_831B();
    level._id_0318 _meth_8326( 0 );
    _id_A5A4::_id_114F();
    wait 2;
    var_1 _meth_808A();
    common_scripts\utility::_id_383F( "intro_fade_in_complete" );
    level._id_0318 _meth_8093( level.org_view_roll );
}

airplane_timer()
{
    common_scripts\utility::_id_384A( "intro_fade_in_complete" );
    level thread timer_start();
    common_scripts\utility::_id_383F( "obj_rescue_vip_given" );
}

_id_5FFB()
{
    common_scripts\utility::_id_3852( "bathroom_guy_dead", "enemies_alerted" );
    _id_A5A4::_id_6008( "airplane_alt_music" );
    common_scripts\utility::_id_384A( "human_shield_starting" );
    _func_076( 2 );
}

stealth_intro()
{
    _id_A5A4::_id_1332( "axis" );
    level._id_0318._id_01FF = 1;

    for ( var_0 = 0; var_0 < level._id_8AB0.size; var_0++ )
    {
        level._id_8AB0[var_0]._id_01FF = 1;
        level._id_8AB0[var_0] _meth_817B( "oblivious" );
    }

    common_scripts\utility::_id_3856( "enemies_alerted", 10 );

    if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
        common_scripts\utility::_id_383F( "enemies_alerted" );

    level thread _id_A5A4::_id_70C4( "airplane_first_hostile_killed_2" );
    _id_A5A4::_id_1333( "axis" );
    var_1 = getent( "colornodes_intro", "script_noteworthy" );
    var_1 notify( "trigger", level._id_0318 );
    level._id_0318._id_01FF = 0;

    for ( var_0 = 0; var_0 < level._id_8AB0.size; var_0++ )
    {
        level._id_8AB0[var_0]._id_01FF = 0;
        level._id_8AB0[var_0] _meth_817B( "allies" );
    }

    wait 1;
}

intro_setup()
{
    common_scripts\utility::_id_384A( "intro_fade_in_complete" );
    maps\jake_tools::_id_9810( "trig_spawn_patrollers" );
    level._id_6F7C thread _id_A510::_id_0BC9( level._id_6F7C, "enemy_cornerR" );
    var_0 = getent( "hostile_bathroom", "targetname" );
    var_0._id_79EB = 1;
    level.hostile_bathroom = var_0 _id_A5A4::_id_88C3();
    level.hostile_bathroom thread hostile_bathroom_think();
    var_1 = getent( "bathroom_flush", "targetname" );
    thread common_scripts\utility::_id_69C2( "airplane_toiletflush", var_1._id_02E2 );
    wait 1;
    thread bathroom_door_open( "bathroomdoor_01", "bathroomdoor_02" );
}

hostile_bathroom_think()
{
    self waittill( "damage" );
    common_scripts\utility::_id_383F( "bathroom_guy_dead" );
}

conference_shotgun_guy()
{
    var_0 = getentarray( "auto18", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.classname == "actor_enemy_merc_SHTGN_m1014" )
        {
            var_2 waittill( "spawned", var_3 );
            var_4 = var_3._id_020C;
            var_3._id_020C = 10;
            wait 5;
            var_3._id_020C = var_4;
        }
    }
}

aa_breach_init()
{
    level thread dialogue_breach();
    level thread fuselage_breached();
    level thread breach_kill_ai();
}

dialogue_breach()
{
    common_scripts\utility::_id_384A( "player_approaching_breach" );
    level.peoplespeaking = 1;
    level _id_A5A4::_id_70BD( "airplane_gaz_hullbreach" );
    common_scripts\utility::_id_384A( "fuselage_breached" );
    wait 1;
    level.peoplespeaking = 0;
    common_scripts\utility::_id_384A( "player_up_breach_stairs" );
    level.peoplespeaking = 1;
    level _id_A5A4::_id_70BD( "airplane_gaz_stairwayclear" );
    level _id_A5A4::_id_70BD( "airplane_sas4_multiplecont" );
    level.peoplespeaking = 0;
    common_scripts\utility::_id_384A( "player_approach_bar" );
    level.peoplespeaking = 1;
    level _id_A5A4::_id_70BD( "airplane_gaz_watchyourfire" );
    level.peoplespeaking = 0;
}

hull_breach_rumble( var_0, var_1 )
{
    level._id_0318 _meth_80AF( "generic_attack_heavy_1500" );
    var_0 _meth_80B0( "breach_loop" );

    if ( !var_1 )
    {
        common_scripts\utility::_id_384A( "player_up_breach_stairs" );
        var_0 _meth_80B1( "breach_loop" );
    }
    else
    {
        common_scripts\utility::_id_384A( "player_jumped_out" );
        var_0 _meth_80B1( "breach_loop" );
        level._id_0318 _meth_80B0( "generic_quake_loop" );
        common_scripts\utility::_id_384A( "plane_explodes" );
        level._id_0318 _meth_80B1( "generic_quake_loop" );
        level._id_0318 _meth_80AF( "generic_attack_heavy_1500" );
        level._id_0318 _meth_80B0( "generic_quake_loop" );
        common_scripts\utility::_id_384A( "cut_to_black" );
        level._id_0318 _meth_80B1( "generic_quake_loop" );
    }
}

fuselage_breached()
{
    common_scripts\utility::_id_0D13( getentarray( "animated_air_masks_breach", "targetname" ), ::animated_breach_entity, "air_mask", "air_masks_breach_fall", "air_masks_breach_loop", 1, 0, 0.9 );
    common_scripts\utility::_id_0D13( getentarray( "animated_air_masks", "targetname" ), ::animated_breach_entity, "air_mask", "air_masks_fall", "air_masks_loop", 1, 0, 0.9 );
    var_0 = getent( "breach_org1", "targetname" );
    var_1 = getent( "breach_org2", "targetname" );
    common_scripts\utility::_id_384A( "player_approaching_breach" );

    if ( isdefined( level.macey._id_58D7 ) )
        level.macey _id_A5A4::_id_8EA4();

    common_scripts\utility::_id_0D13( getentarray( "breach_seats", "targetname" ), ::breach_seat, "fuselage_breached" );
    level._id_0318 thread _id_A5A4::_id_69C4( "fuselage_stress" );
    level._id_0318 _meth_80B0( "generic_ambient_loop" );
    wait 0.5;
    common_scripts\_exploder::_id_3528( 7 );
    wait 1.5;
    level._id_0318 thread _id_A5A4::_id_69C4( "fuselage_stress" );
    common_scripts\utility::_id_383F( "fuselage_about_to_blow" );
    wait 0.5;
    level._id_0318 _meth_82F1( "airplane_seatbelt", "airplane_seatbelt_done" );
    common_scripts\utility::_id_0D13( getentarray( "animated_center_console", "targetname" ), ::animated_breach_entity, "center_console", "center_console_open", "center_console_shake", 0, 1 );
    level._id_0318 waittill( "airplane_seatbelt_done" );
    wait 0.5;
    level._id_0318 _meth_80B1( "generic_ambient_loop" );
    common_scripts\_exploder::_id_3528( 666 );
    _func_18C( 0.5, 3, level._id_0318._id_02E2, 8000 );
    _id_A5DE::_id_5CF6( "first_floor_mix" );
    level._id_0318 thread _id_A5A4::_id_69C4( "fuselage_breach_explosion_in" );
    level._id_0318 thread _id_A5A4::_id_69C4( "fuselage_breach_explosion" );
    thread maps\airplane_aud::aud_explosion_event();
    common_scripts\utility::_id_383F( "wind_zone_active" );
    common_scripts\utility::_id_383F( "fuselage_breached" );

    if ( getdvar( "goggle_crack_during_breach" ) == "1" )
        thread addgasmaskcracks();

    thread hull_breach_rumble( var_0, 0 );
    var_2 = getentarray( "animated_compartment", "targetname" );
    common_scripts\utility::_id_0D13( var_2, ::animated_breach_entity, "bin", "bin_open", "bin_shake", 0, 0 );
    common_scripts\utility::_id_0D13( var_2, maps\airplane_aud::aud_animated_luggage );
    common_scripts\utility::_id_0D13( getentarray( "animated_bathroom_door", "targetname" ), ::animated_bathroom_door );
    thread breach_gravity_shift();
    thread airplane_tirescheat();
    var_0 _meth_8077( "airplane_wind_loop" );
    thread _id_A5A4::_id_7DB9( "amb_int_airplane_intensity5" );
    wait 1.5;
    common_scripts\utility::_id_384A( "player_jumped_out" );
    var_0 _meth_80AD( "airplane_wind_loop" );
    wait 0.5;
}

animated_breach_entity( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( var_3 )
    {
        self _meth_8056();
        common_scripts\utility::_id_384A( "fuselage_about_to_blow" );
    }

    if ( isdefined( var_5 ) )
        wait(var_5);

    self._id_0C72 = var_0;
    _id_A5A4::_id_0D61();

    if ( isdefined( self._id_0398 ) )
        common_scripts\utility::_id_384A( self._id_0398 );

    if ( isdefined( self._id_04A4 ) )
    {
        var_6 = getent( self._id_04A4, "targetname" );

        if ( isdefined( var_6 ) && _func_120( var_6.classname, "trigger_multiple" ) )
            var_6 waittill( "trigger" );
    }

    if ( var_4 )
    {
        _id_A5A4::_id_0392();
        self _meth_8055();
        thread _id_A5A4::_id_69C4( "scn_cargoship_mask_down" );
        _id_A510::_id_0C24( self, var_1 );
        common_scripts\utility::_id_384A( "fuselage_breached" );
        _id_A5A4::_id_0392();
        _id_A510::_id_0BE1( self, var_2 );
    }
    else
    {
        _id_A5A4::_id_0392();
        self _meth_8055();
        _id_A510::_id_0C24( self, var_1 );
        _id_A510::_id_0BE1( self, var_2 );
    }
}

animated_bathroom_door()
{
    self._id_0C72 = "bathroom_door";
    _id_A5A4::_id_0D61();
    _id_A510::_id_0BE1( self, "bathroom_door_shake" );
}

breach_kill_ai()
{
    common_scripts\utility::_id_384A( "fuselage_breached" );
    var_0 = maps\jake_tools::_id_3EDE( "axis", "badplace_breach" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread breach_kill_ai_logic();
}

breach_kill_ai_logic()
{
    self._id_01FF = 1;
    self._id_85BA = 1;
    self _meth_8054();
    var_0 = self._id_02E2;
}

breach_compartment_setup()
{
    var_0 = getentarray( "compartment", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_82AD( 24, 0.1 );
}

breach_compartment_open( var_0, var_1 )
{
    var_2 = getent( self._id_04A4, "targetname" );

    if ( isdefined( var_0 ) )
        common_scripts\utility::_id_384A( var_0 );

    thread common_scripts\utility::_id_69C2( "airplane_overhead_compartment_open", var_2._id_02E2 );
    self _meth_82B4( var_1, 0.4, 0.1, 0.1 );
    wait 0.4;
    _func_17E( var_2._id_02E2, 60, 30, 0.2 );
}

breach_seat( var_0 )
{
    var_1 = getent( self._id_04A4, "targetname" );
    var_2 = getent( var_1._id_04A4, "targetname" );
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( var_0 ) )
        common_scripts\utility::_id_384A( var_0 );

    switch ( self._id_0398 )
    {
        case "seat_1":
            var_4 = 75;
            var_5 = 1.2;
            var_6 = 0.65;
            var_7 = 0.25;
            var_3 = 0.5;
            break;
        case "seat_2":
            var_4 = -75;
            var_5 = 1.2;
            var_6 = 0.65;
            var_7 = 0.25;
            var_3 = 0.75;
            break;
        default:
            break;
    }

    wait(var_3);
    self _meth_82B3( var_4, var_5, var_5 / 3 );
    wait(var_5);
    self _meth_82AA( var_1._id_02E2, var_6 );
    self _meth_82B1( var_1.angles, var_6 );
    wait(var_6);
    self _meth_82AA( var_2._id_02E2, var_7 );
    self _meth_82B1( var_2.angles, var_7 );
    wait(var_7);
    self delete();
}

breach_gravity_shift()
{
    var_0 = getent( "org_breach_push", "targetname" );
    wait 1;
    thread gravity_shift( 25 );
    var_1 = getent( "breach_physics", "targetname" );
    var_2 = getent( "breach_org1", "targetname" );
    var_1 thread _id_A5A4::_id_6802( 5000, 2500, ( 0, 0, 0.25 ) );
    common_scripts\utility::_id_384A( "player_up_breach_stairs" );
    common_scripts\utility::_id_3831( "aa_first_floor_section" );
    common_scripts\utility::_id_383F( "aa_second_floor_section" );
    var_1 notify( "stop_physicsjolt" );
    common_scripts\utility::_id_384A( "exit_door_blown" );
    thread final_roll();
    var_3 = getent( "shake_org", "targetname" );
    var_3 thread _id_A5A4::_id_6802( 5000, 2500, ( 0, 0, 0.25 ) );
    common_scripts\utility::_id_384A( "player_jumped_out" );
    var_3 notify( "stop_physicsjolt" );
}

airplane_tirescheat()
{
    var_0 = common_scripts\utility::_id_40FB( "airplane_tires_destination", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    for (;;)
    {
        if ( isdefined( level.cheattires ) && !common_scripts\utility::_id_382E( "aa_second_floor_section" ) )
        {
            foreach ( var_2 in level.cheattires )
            {
                if ( _func_0F0( var_0._id_02E2, var_2._id_02E2 ) < 320 )
                    continue;

                var_3 = var_0._id_02E2 - var_2._id_02E2;
                var_3 = _func_114( var_3 );
                var_3 += ( 0, 0, 1 );
                var_3 = _id_A5A4::vector_multiply( var_3, _func_0B4( 1600, 3200 ) );
                _func_2E6( var_2, ( 0, 0, 0 ), var_3 );
            }
        }

        wait 0.05;
    }
}

final_roll()
{
    thread gravity_shift( -25 );
    common_scripts\utility::_id_0D13( level.arollers, ::rotate_rollers, -13 );
    wait 6;
    common_scripts\utility::_id_0D13( level.arollers, ::rotate_rollers, 13 );
}

physicsshake()
{
    level endon( "stop_physics_shake" );

    for (;;)
    {
        wait 0.1;
        _func_181( level._id_0318._id_02E2, 5000, 2500, 0.45, 0.9 );
    }
}

plane_tilt()
{
    common_scripts\utility::_id_384A( "fuselage_breached" );
    common_scripts\utility::_id_0D13( level.arollers, ::rotate_rollers, 15 );
    wait 6;
    common_scripts\utility::_id_0D13( level.arollers, ::rotate_rollers, -13 );
    wait 5;
    common_scripts\utility::_id_0D13( level.arollers, ::rotate_rollers, 10 );
    wait 5;
    common_scripts\utility::_id_0D13( level.arollers, ::rotate_rollers, -12 );
    wait 5;
    common_scripts\utility::_id_384A( "player_up_breach_stairs" );
}

rotate_rollers( var_0 )
{
    self _meth_82B4( var_0, 5, 2, 2 );
}

aa_vip_init()
{
    thread friendly_human_shield_setup();
    thread restore_timescale();
    thread dialogue_humanshield();
    thread humanshield();
    thread blood_pool();
    thread humanshield_timer_kill();
    aa_freefall_init();
}

restore_timescale()
{
    common_scripts\utility::_id_3852( "terrorist_killed", "terrorist_wounded" );
    wait 1.3;
    common_scripts\utility::_id_383F( "restore_timescale" );
}

dialogue_humanshield()
{
    common_scripts\utility::_id_384A( "human_shield_actors_spawned" );
    level.terrorist thread maps\jake_tools::_id_2A05( "airplane_ter_illkillhim" );
    wait 1;
    level thread _id_A5A4::_id_70BD( "airplane_gaz_downonfloor" );
}

blood_pool()
{
    var_0 = getent( "blood_pool", "targetname" );
    common_scripts\utility::_id_384A( "human_shield_over" );

    if ( level.playergotheadshot )
        playfx( common_scripts\utility::_id_3FA8( "blood_pool" ), var_0._id_02E2 + ( 5, 15, 0 ), ( 0, 0, 1 ) );
}

humanshield_timer_kill()
{
    common_scripts\utility::_id_3852( "terrorist_killed", "terrorist_wounded" );
    _id_53B1();
}

friendly_human_shield_setup()
{
    var_0 = _func_0C4( "nodeStart_vip", "targetname" );
    var_1 = undefined;
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( isdefined( var_0[var_3]._id_0398 ) )
        {
            if ( var_0[var_3]._id_0398 == "nodePrice" )
                var_1 = var_0[var_3];

            if ( var_0[var_3]._id_0398 == "nodeGrigsby" )
                var_2 = var_0[var_3];
        }
    }

    common_scripts\utility::_id_384A( "player_looking_at_human_shield" );
    level._id_6F7C thread teleport_human_shield( var_1 );
    level.grigsby thread teleport_human_shield( var_2 );
}

teleport_human_shield( var_0 )
{
    _id_A5A4::_id_2A74();
    self _meth_81CA( var_0._id_02E2, var_0.angles );
    self _meth_81AA( self._id_02E2 );
    maps\jake_tools::_id_7F7F( var_0._id_0351 );
    self _meth_81A9( var_0 );
}

humanshield()
{
    common_scripts\utility::_id_384A( "player_approach_human_shield" );
    thread kill_ai();
    common_scripts\utility::_id_3831( "aa_second_floor_section" );
    common_scripts\utility::_id_383F( "aa_humanshield_section" );
    level.nodeshield = _func_0C3( "node_freefall", "targetname" );
    level.hostage = _id_A5A4::_id_894B( "hostage" );
    level.terrorist = _id_A5A4::_id_894B( "terrorist" );
    common_scripts\utility::_id_383F( "human_shield_actors_spawned" );
    common_scripts\utility::_id_383F( "human_shield_starting" );
    level notify( "stop_airplane_destabilize" );
    thread hostage_timer( 5 );
    thread door_open_double( getentarray( "door_bar", "targetname" ) );
    _id_A5A4::_id_27EF( 1, ::player_hearbeat );
    thread humanshield_player_weapon();
    var_0 = getent( "org_humanshield_playerview", "targetname" );
    var_0._id_02E2 = level._id_0318._id_02E2;
    create_playerview( var_0 );
    var_1 = 0.5;
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_slomo_in_front" );
    _id_A5A4::_id_7F00( "airplane_slomo", 2 );
    level._id_0318 _meth_848C( "clut_airplane_slomo", 2.0 );
    level._id_0318 _meth_83BE( "airplane_slomo" );
    level.eplayerview _id_A5A4::_id_5696( "tag_player", var_1, 1, 35, 35, 45, 45 );
    wait(var_1);
    common_scripts\utility::_id_383F( "player_looking_at_human_shield" );
    _id_A5E8::_id_870C( "aud_start_vip_checkpoint" );
    level.slowmooverlay = spawnfx( level._id_058F["slow_mo_overlay"], level._id_0318._id_02E2 );
    triggerfx( level.slowmooverlay );
    setomnvar( "ui_airplane_slowmo_overlay", 1 );

    if ( getdvar( "chaplincheat" ) == "1" )
    {
        level._id_0318 _meth_81E4( 0.2 );
        level.eplayerview delete();
        common_scripts\utility::_id_384A( "restore_timescale" );
        common_scripts\utility::_id_383F( "obj_rescue_vip_complete" );
        common_scripts\utility::_id_3831( "aa_humanshield_section" );
    }
    else
    {
        var_2 = gettimescale() < level._id_8637._id_8A53;
        _id_A5A4::_id_8648();
        _func_291( "slomo" );
        _id_A5E8::_id_870C( "aud_add_slowmo_mix" );
        _id_A5A4::_id_8646( 0.3 );
        _id_A5A4::_id_8643( 0.05 );
        _id_A5A4::_id_8640();
        level._id_0318 _meth_81E4( 0.2 );
        level.eplayerview delete();
        common_scripts\utility::_id_384A( "restore_timescale" );
        common_scripts\utility::_id_383F( "obj_rescue_vip_complete" );
        common_scripts\utility::_id_3831( "aa_humanshield_section" );
        var_3 = 0.05;
        _id_A5A4::_id_8644( var_3 );
        _id_A5A4::_id_8641();
        _func_292( "slomo" );
        _id_A5E8::_id_870C( "aud_remove_slowmo_mix" );
        wait(var_3);
        _id_A5A4::_id_863E();

        if ( var_2 )
            level._id_0318 notify( "_cheat_player_press_slowmo" );
    }

    level.slowmooverlay delete();
    setomnvar( "ui_airplane_slowmo_overlay", 0 );
    thread airplane_destabilize();
    level._id_0318 _meth_81E4( level._id_6D5E );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_slomo_out_front" );
    _id_A5A4::_id_7F00( "airplane", 2 );
    level._id_0318 _meth_848C( "clut_airplane_top", 2.0 );
    level._id_0318 _meth_83BE( "airplane" );
    level notify( "stop_player_heartbeat" );
}

kill_ai()
{
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_8054();
}

kill_all_ai()
{
    var_0 = _func_0D9( "axis", "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_58D7 ) )
            var_2 _id_A5A4::_id_8EA4();

        var_2 _meth_8054();
    }
}

player_hearbeat()
{
    level endon( "stop_player_heartbeat" );

    for (;;)
    {
        level._id_0318 thread _id_A5A4::_id_69C4( "breathing_heartbeat" );
        wait 0.5;
    }
}

humanshield_player_weapon()
{
    var_0 = level._id_0318 _meth_830E();
    level._id_0318 _meth_830C( var_0 );
    wait 1;
    level._id_0318 _meth_830B( "usp_silencer" );
    level._id_0318 _meth_832F( "usp_silencer" );
    level._id_0318 _meth_8312( "usp_silencer" );
}

ai_human_shield_think()
{
    common_scripts\utility::_id_384A( "human_shield_actors_spawned" );
    self endon( "death" );
    self._id_01FF = 1;
    _id_A5A4::_id_7F71( 1 );
    self _meth_817B( "oblivious" );
    self _meth_81AA( self._id_02E2 );
    _id_A5A4::_id_7F71( 1 );
    thread human_shield_death_monitor();
    thread human_shield_pain_monitor();
    var_0 = undefined;

    switch ( self._id_0398 )
    {
        case "terrorist":
            self.allowdeath = 0;
            self._id_0C72 = "terrorist";
            var_0 = level.hostage;
            break;
        case "hostage":
            self.allowdeath = 1;
            self._id_2AF3 = 1;
            self._id_2B0E = 1;
            self._id_04A7 = "neutral";
            self._id_0C72 = "hostage";
            _id_A5A4::_id_7EAB( "unarmed_run2" );
            self._id_2652 = level._id_78AC["hostage"]["human_shield_death"];
            var_0 = level.terrorist;
            _id_A5A4::_id_4462();
            break;
    }

    self _meth_81AA( self._id_02E2 );
    level.nodeshield thread _id_A510::_id_0BE1( self, "human_shield_idle", undefined, "stop_idle" );
    common_scripts\utility::_id_384A( "human_shield_over" );

    if ( isdefined( self ) )
        self._id_2652 = undefined;
}

human_shield_ter_wounded_failsafe()
{
    self endon( "death" );
    var_0 = getentarray( "org_humanshield_magicbullet", "targetname" );
    var_1 = undefined;
    wait 1.5;
    var_2 = [];
    var_3[0] = level._id_6F7C _meth_8184( "TAG_FLASH" );
    var_3[1] = level.grigsby _meth_8184( "TAG_FLASH" );

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = _func_08D( var_2[0]._id_02E2, self _meth_8184( "TAG_EYE" ), 1, self );

        if ( var_5 == 1 )
        {
            var_1 = var_2[0];
            break;
        }
    }

    if ( !isdefined( var_1 ) )
        var_1 = common_scripts\utility::_id_3F91( level._id_0318._id_02E2, var_0 );

    var_6 = self _meth_8184( "TAG_EYE" );
    thread humanshield_magicbullet_h1( var_1 );
    wait 0.1;
    common_scripts\utility::_id_383F( "friendlies_killed_human_shield" );
    self _meth_8054( var_6 );
}

humanshield_magicbullet_h1( var_0 )
{
    var_1 = 1;

    if ( getdvar( "humanshield_magicbullet_shots" ) != "" && getdvarint( "humanshield_magicbullet_shots" ) > 0 )
        var_1 = getdvarint( "humanshield_magicbullet_shots" );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = self _meth_8184( "TAG_EYE" );
        bullettracer( var_0._id_02E2, var_3, 1 );
        thread common_scripts\utility::_id_69C2( "weap_usp45sd_fire_plr", level._id_0318._id_02E2 );
        wait 0.05;
    }
}

headshot_fx()
{
    var_0 = level._id_0318.angles;
    var_1 = anglestoforward( var_0 );
    var_2 = _id_A5A4::vector_multiply( var_1, 5000 );
    var_3 = level._id_0318 _meth_80AA();
    var_4 = var_3 + var_2;
    var_5 = _func_06B( var_3, var_4, 0, undefined );
    playfx( common_scripts\utility::_id_3FA8( "flesh_hit" ), var_5["position"], ( 0, 0, 1 ) );
    playfx( common_scripts\utility::_id_3FA8( "headshot1" ), var_5["position"], ( 0, 0, 1 ) );
    playfx( common_scripts\utility::_id_3FA8( "headshot1" ), var_5["position"], ( -25, 10, -10 ) );
    playfx( common_scripts\utility::_id_3FA8( "headshot2" ), var_5["position"], ( 0, 0, 1 ) );
    playfx( common_scripts\utility::_id_3FA8( "headshot3" ), var_5["position"], ( 0, 0, 1 ) );
    thread common_scripts\utility::_id_69C2( "bullet_large_flesh", level._id_0318._id_02E2 );
    thread suitcase_splatter();
}

suitcase_splatter()
{
    var_0 = getent( "splatter", "targetname" );
    var_1 = getent( "bomb_flash", "targetname" );
    var_2 = var_0.angles;
    var_3 = anglestoforward( var_2 );
    var_4 = _id_A5A4::vector_multiply( var_3, 10000 );
    var_5 = var_0._id_02E2;
    var_6 = var_1._id_02E2;
    var_7 = _func_06B( var_5, var_6, 0, undefined );
    playfx( common_scripts\utility::_id_3FA8( "headshot1" ), var_6 + ( 100, -10, 10 ), var_4, ( 0, 10, 1 ) );
}

human_shield_death_monitor()
{
    level endon( "hostage_jumped_out" );
    self waittill( "death" );
    var_0 = self._id_02E2;

    if ( self == level.hostage )
        thread _id_A536::_id_5CDD();
}

human_shield_pain_monitor()
{
    level.hostage endon( "death" );

    while ( isdefined( self ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( isdefined( var_4 ) && var_4 == "MOD_IMPACT" )
            continue;

        if ( self == level.hostage )
        {
            if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
            {
                self _meth_8054();
                break;
            }

            continue;
        }

        if ( isdefined( var_7 ) && var_7 == "j_head" )
        {
            common_scripts\utility::_id_383F( "terrorist_killed" );
            level.playergotheadshot = 1;

            if ( level.tire_explosion )
            {
                self.allowdeath = 1;
                level.nodeshield notify( "stop_idle" );
                thread headshot_fx();
                self _meth_8054();
            }
            else
            {
                var_9 = _id_A5A9::_id_21A2( self );
                var_9._id_0C72 = "terrorist";
                level.nodeshield notify( "stop_idle" );
                var_9 thread headshot_fx();
                level.nodeshield thread _id_A510::_id_0C24( var_9, "human_shield_death" );
                var_9._id_0C72 = "terrorist";
                var_9 _meth_80C0( 0 );
            }

            level.nodeshield _id_A510::_id_0C24( level.hostage, "human_shield_breakfree_partner_dead" );
            break;
            continue;
        }

        if ( !common_scripts\utility::_id_382E( "terrorist_wounded" ) )
        {
            common_scripts\utility::_id_383F( "terrorist_wounded" );

            if ( level._id_3BFE == 3 )
                thread mission_failed_veteran_no_headshot();

            self.allowdeath = 1;
            thread human_shield_ter_wounded_failsafe();
            level.nodeshield notify( "stop_idle" );
            level.nodeshield thread _id_A510::_id_0C24( self, "human_shield_pain" );
            level.nodeshield _id_A510::_id_0C24( level.hostage, "human_shield_breakfree_partner_wounded" );
            break;
        }
    }

    common_scripts\utility::_id_383F( "human_shield_over" );
}

mission_failed_veteran_no_headshot()
{
    level notify( "mission failed" );
    thread _id_53B1();
    level notify( "kill_timer" );
    setdvar( "ui_deadquote", &"AIRPLANE_HOSTAGE_NO_HEADSHOT" );
    _id_A5A4::_id_5CDF();
}

dummy_kill()
{
    self waittillmatch( "single anim", "end" );
    self _meth_8054();
}

aa_freefall_init()
{
    thread dialogue_freefall();
    thread dialogue_jumped_out();
    thread _id_3A27();
    thread freefall_ai_setup();
    thread obj_freefall();
}

dialogue_freefall()
{
    common_scripts\utility::_id_384A( "human_shield_over" );

    if ( isdefined( level.hostage ) )
        level.hostage thread maps\jake_tools::_id_2A05( "airplane_ru4_donthurtme" );

    wait 1;
    _id_A5E8::_id_870C( "aud_add_armed_bomb_vo_mix" );
    level _id_A5A4::_id_70BD( "airplane_sas4_armedbomb" );
    level _id_A5A4::_id_70BD( "airplane_gaz_preptobreach" );
    common_scripts\utility::_id_384A( "freefallers_jumping" );

    if ( !common_scripts\utility::_id_382E( "player_jumped_out" ) )
        level thread _id_A5A4::_id_70BD( "airplane_gaz_onyourfeet" );

    if ( !common_scripts\utility::_id_382E( "player_jumped_out" ) )
        level.hostage maps\jake_tools::_id_2A05( "airplane_ru4_noparachute" );

    wait 3;

    if ( !common_scripts\utility::_id_382E( "player_jumped_out" ) )
        level thread _id_A5A4::_id_70BD( "airplane_sas1_letsgo" );
}

dialogue_jumped_out()
{
    common_scripts\utility::_id_384A( "player_jumped_out" );
    level _id_A5A4::_id_70BD( "airplane_gaz_seeya" );
}

bomb_think()
{
    var_0 = getent( "bomb_flash", "targetname" );
    level waittill( "timer_tick" );
    playfx( common_scripts\utility::_id_3FA8( "c4_light_blink" ), var_0._id_02E2 + ( 0, 0, 0 ) );
}

freefall_ai_setup()
{
    common_scripts\utility::_id_384A( "human_shield_over" );

    if ( !isdefined( level.hostage ) )
    {
        level.hostage = _id_A5A4::_id_894B( "hostage2" );
        level.hostage._id_0C72 = "hostage";
        level.hostage _id_A5A4::_id_4462();
    }

    level.nodefreefall = _func_0C3( "node_freefall", "targetname" );
    level.freefallersready = 0;
    level.hostage thread ai_freefall_think();
    wait 1.5;
    level._id_6F7C thread ai_freefall_think();
}

ai_freefall_think( var_0 )
{
    self endon( "death" );
    self _meth_81A7( 1 );
    self _meth_817B( "oblivious" );

    if ( self == level.hostage )
        self._id_2AF3 = 1;
    else
    {
        _id_A5A4::_id_2A74();
        self._id_2AF3 = 1;
    }

    self _meth_81AA( self._id_02E2 );

    if ( self == level.hostage )
    {
        level.nodefreefall thread _id_A510::_id_0BE1( self, "airplane_end_VIP_idle", undefined, "stop_idle" );
        common_scripts\utility::_id_383F( "hostage_idling_for_freefall" );
    }
    else
    {
        level.nodefreefall _id_A510::_id_0BFF( self, "airplane_end_VIP_start" );
        self _meth_8168( 1 );
        self _meth_81CE( "crouch" );
    }

    level.freefallersready++;
    common_scripts\utility::_id_384A( "hostage_idling_for_freefall" );
    common_scripts\utility::_id_384A( "exit_door_blown" );

    if ( self != level.hostage )
        self _meth_81CE( "crouch", "stand", "prone" );

    while ( level.freefallersready < 2 )
        wait 0.05;

    common_scripts\utility::_id_3856( "player_near_freefall", 3 );
    common_scripts\utility::_id_383F( "freefallers_jumping" );

    if ( self == level.hostage )
        level.nodefreefall notify( "stop_idle" );

    level.nodefreefall _id_A510::_id_0C24( self, "airplane_end_VIP" );
    common_scripts\utility::_id_383F( "hostage_jumped_out" );

    if ( isdefined( self._id_58D7 ) )
        _id_A5A4::_id_8EA4();

    self delete();
}

_id_3A27()
{
    common_scripts\utility::_id_384A( "human_shield_over" );
    thread friendly_blows_door();
    wait 1;
    _id_A5A4::_id_6008( "airplane_freefall_prep_music" );
    level thread timer_logic( 30, &"AIRPLANE_TIME_TILL_EXPLOSION", 1 );
    thread bomb_think();
    common_scripts\utility::_id_384A( "exit_door_blown" );
    common_scripts\utility::_id_383F( "obj_freefall_given" );
    thread exit_door_fx();
    var_0 = getent( "trig_exit_door", "targetname" );
    var_0 waittill( "trigger" );

    if ( getdvarint( "use_old_airplane_jump" ) != 1 )
    {
        level._id_0318 _meth_811D( 0 );

        while ( level._id_0318 _meth_8462() )
            waittillframeend;
    }

    var_1 = undefined;

    if ( getdvarint( "use_old_airplane_jump" ) == 1 )
    {
        thread white_flash();
        level._id_0318 _meth_831A();
        _func_0D6( "compass", 0 );
    }
    else
    {
        level._id_0318 _meth_831A();
        level._id_0318 _meth_8181( "stand" );
        _func_0D6( "compass", 0 );
        var_1 = _id_A5A4::_id_88D1( "worldbody" );
        var_1 _meth_8056();
        thread maps\airplane_aud::aud_final_jump_mix_and_sounds();
        level.nodefreefall _id_A510::_id_0BC7( var_1, "airplane_end_player" );
        var_1 _id_A5A4::lerp_player_view_to_tag_smoothly( "tag_player", 0.5, 1, 0, 0, 0, 0 );
        var_1 _meth_8055();
        level.nodefreefall thread _id_A510::_id_0C24( var_1, "airplane_end_player" );
        wait 0.45;
        level._id_0318 _meth_80AF( "generic_attack_heavy_1500" );
    }

    thread freefall_camerashake();
    common_scripts\utility::_id_383F( "player_jumped_out" );
    thread _id_53B1();
    thread savetime();
    _func_146( 1 );
    level._id_0318 thread _id_A5A4::_id_69C4( "airplane_jump_whoosh" );

    if ( getdvarint( "use_old_airplane_jump" ) != 1 )
        var_1 waittillmatch( "single anim", "switchplane" );
    else
        wait 0.5;

    var_2 = getent( "plane_shell", "targetname" );
    var_2 _meth_8055();
    var_3 = getent( "plane_wings", "targetname" );
    var_3 _meth_8056();
    level.player_sound_org = spawn( "script_origin", level._id_0318._id_02E2 + ( 0, 0, 32 ) );
    level.player_sound_org _meth_804F( level._id_0318 );
    level.player_sound_org _meth_8077( "airplane_wind_loop" );
    var_4 = 1;
    var_5 = 1;
    var_6 = 1;
    var_7 = 1;
    var_8 = 1;
    var_9 = getent( "org_player_freefall", "targetname" );
    var_10 = 0.2;

    if ( getdvarint( "use_old_airplane_jump" ) == 1 )
    {
        common_scripts\utility::_id_384A( "white_done" );
        level._id_0318 _meth_8337( var_9.angles );
        level._id_0318 _meth_8335( var_9._id_02E2 );
        level._id_0318 _meth_807E( var_9 );
        var_11 = getent( var_9._id_04A4, "targetname" );
        var_10 = 4;
        thread plane_explodes();
        level._id_0318 _meth_8051();
        _id_A5A4::_id_5693( var_11._id_02E2, var_11.angles, var_10, var_4, var_5, var_6, var_7, var_8 );
        level._id_0318 _meth_807E( var_11 );
    }
    else
    {
        wait 0.3;
        thread plane_explodes();
    }
}

savetime()
{
    if ( isdefined( level.timetovipmessage ) )
        logstring( level.timetovipmessage );
}

white_flash( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.5;

    var_1 = maps\jake_tools::_id_23D0( "white", 0 );
    var_1 _meth_8086( var_0 );
    var_1.alpha = 1;
    wait 1;
    common_scripts\utility::_id_383F( "white_done" );
    var_1 _meth_8086( 1 );
    var_1.alpha = 0;
}

exit_door_fx()
{
    common_scripts\utility::_id_0D13( level.fxexitdoor, _id_A5A4::_id_748D );
    var_0 = getent( "exit_org1", "targetname" );
    var_1 = getent( "exit_org2", "targetname" );
    var_0 _meth_8077( "airplane_wind_loop" );
    wait 1;
    var_1 _meth_8077( "airplane_wind_loop" );
    common_scripts\utility::_id_384A( "plane_explodes" );
    var_0 _meth_80AD( "airplane_wind_loop" );
    var_1 _meth_80AD( "airplane_wind_loop" );
    level.player_sound_org _meth_80AD( "airplane_wind_loop" );
}

end_music()
{
    _func_076( 1 );
    wait 1.5;
    _id_A5A4::_id_6008( "airplane_end_music" );
}

plane_explodes()
{
    wait 0.8;
    common_scripts\utility::_id_383F( "plane_explodes" );
    common_scripts\_exploder::_id_3528( 1 );
    thread end_sound_start();
    _func_076( 1 );
    wait 2.25;
    common_scripts\utility::_id_383F( "cut_to_black" );
    var_0 = maps\jake_tools::_id_23D0( "black", 0 );
    var_0 _meth_8086( 1 );
    var_0.alpha = 1;
    thread _id_A5DE::_id_5CF2( "end_mix" );
    level.player_sound_org _meth_80AE();
    wait 0.1;
    level.player_sound_org delete();
    wait 2.5;
    level._id_0318 _meth_8326( 1 );
    level._id_0318 _meth_8186( "nosound", 60, 0 );

    if ( !_id_A5A4::_id_0CC3() )
    {
        wait 4.0;
        level._id_0318 _meth_84ED( &"AIRPLANE_CAMPAIGN_COMPLETED" );
        level._id_0318 waittill( "menuresponse" );
    }

    _id_A5A4::_id_60D6();
}

end_sound_start()
{
    thread end_sound_stop();
    level._id_0318 _meth_82F1( "scn_final_explosion_front" );
}

end_sound_stop()
{
    common_scripts\utility::_id_384A( "cut_to_black" );
    _func_146();

    if ( getdvar( "arcademode" ) != "1" )
        level._id_0318 _meth_8186( "nosound", 60, 0 );
}

friendly_blows_door()
{
    var_0 = getent( "org_exit_door", "targetname" );
    var_1 = _func_0C3( "node_door", "targetname" );
    var_2 = spawn( "script_origin", var_1._id_02E2 );
    var_2._id_02E2 += ( 0, -50, 0 );
    var_2.angles += ( 0, 90, 0 );
    var_3 = getent( "c4_door", "targetname" );
    level.grigsby _id_A5A4::_id_2A74();
    level.grigsby._id_01FF = 1;
    level.grigsby._id_01C4 = 32;
    level.grigsby _meth_81A7( 1 );
    var_2 _id_A510::_id_0BFF( level.grigsby, "C4_plant_start" );
    common_scripts\utility::_id_383F( "exit_door_about_to_blow" );
    level.grigsby _meth_81CE( "crouch" );
    var_3 common_scripts\utility::_id_27CD( 1.8, ::_meth_8055 );
    var_3 thread _id_A5A4::_id_69C4( "scn_bomb_plant" );
    var_2 thread _id_A510::_id_0C24( level.grigsby, "C4_plant" );
    wait 3.5;
    level.grigsby _meth_81CE( "crouch", "stand", "prone" );
    level.grigsby._id_01C4 = 32;
    var_1 = _func_0C3( "node_door_cover", "targetname" );
    level.grigsby _meth_81A9( var_1 );
    level.grigsby common_scripts\utility::_id_A0A0( "goal", 3 );
    wait 1;
    common_scripts\_exploder::_id_3528( 100 );
    _func_18C( 0.5, 3, var_0._id_02E2, 3000 );
    var_3 delete();
    var_0 thread maps\airplane_aud::aud_end_breach_sounds();
    level._id_0318 thread common_scripts\utility::_id_6975( "end_wind_loop" );
    thread hull_breach_rumble( var_0, 1 );
    _id_A5E8::_id_870C( "aud_add_wind_door_mix" );
    common_scripts\utility::_id_383F( "exit_door_blown" );
}

freefall_camerashake()
{
    level notify( "stop_airplane_destabilize" );

    while ( !common_scripts\utility::_id_382E( "plane_explodes" ) )
    {
        _func_18C( 0.2, 0.05, level._id_0318._id_02E2, 80000 );
        wait 0.05;
    }

    for (;;)
    {
        _func_18C( 0.35, 0.05, level._id_0318._id_02E2, 80000 );
        wait 0.05;
    }
}

aa_utility()
{

}

dialogue_move()
{
    common_scripts\utility::_id_384A( "bathroom_guy_dead" );
    wait 10;

    while ( !common_scripts\utility::_id_382E( "player_approach_human_shield" ) )
    {
        sas_dialogue_random( "keepmoving" );
        wait(_func_0B4( 10, 20 ));
    }
}

dialogue_clear()
{

}

sas_dialogue_random( var_0 )
{
    if ( level.peoplespeaking == 1 )
        return;

    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 1;

    switch ( var_0 )
    {
        case "keepmoving":
            var_2 = "airplane_gaz_keepmoving_";
            var_3 = _func_0B4( 1, level.dialoguemovelines + 1 );
            break;
        case "hostiledown":
            var_2 = "airplane_killfirm_";
            var_3 = _func_0B4( 1, level.dialoguehostiledown + 1 );
            var_4 = can_say_hostiledown();
            break;
        case "areaclear":
            var_2 = "airplane_areaclear_";
            var_3 = _func_0B4( 1, level.dialogueareaclear + 1 );
            break;
        default:
    }

    var_1 = var_2 + var_3;

    if ( var_4 == 1 )
        level thread _id_A5A4::_id_70C4( var_1 );
}

can_say_hostiledown()
{
    if ( level.hostiledownbeingspoken == 1 )
        return 0;
    else
    {
        thread hostile_down_timer();
        return 1;
    }
}

hostile_down_timer()
{
    if ( level.hostiledownbeingspoken == 1 )
        return;

    level.hostiledownbeingspoken = 1;
    wait(level.timebetweenhostiledown);
    level.hostiledownbeingspoken = 0;
}

airmasks()
{
    var_0 = getentarray( "airmask", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::airmask_think );
    var_1 = getentarray( "airmask_breach", "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::airmask_breach_think );
}

airmask_think()
{
    self.dummy = spawn( "script_origin", self._id_02E2 + ( 0, 0, 30 ) );
    self.dummy.angles = level.org_view_roll.angles;
    level.arollers = common_scripts\utility::_id_0CDA( level.arollers, self.dummy );
    self _meth_804F( self.dummy );
    self.dummy _meth_82AD( 45, 0.1 );
    self _meth_8056();
    common_scripts\utility::_id_384A( "fuselage_breached" );

    if ( getdvar( "airmasks" ) == "0" )
        return;

    self _meth_8055();
    var_0 = _func_0B5( 0.75, 1.2 );
    self.dummy _meth_82AD( -55, var_0, var_0 / 3, var_0 / 3 );
    wait(var_0);
    self.dummy _meth_82AD( 10, var_0 / 2 );
    wait(var_0 / 2);
    wait(_func_0B5( 0.3, 0.9 ));
    var_1 = -0.5;

    for (;;)
    {
        wait 0.05;
        self.dummy _meth_82AD( var_1, 0.05 );

        if ( var_1 == -0.5 )
        {
            var_1 = 0.5;
            continue;
        }

        var_1 = -0.5;
    }
}

airmask_breach_think()
{
    self.dummy = spawn( "script_origin", self._id_02E2 );
    self.dummy.angles = level.org_view_roll.angles;
    self _meth_804F( self.dummy );
    self.dummy _meth_82AD( 45, 0.1 );
    self _meth_8056();
    common_scripts\utility::_id_384A( "fuselage_breached" );

    if ( getdvar( "airmasks" ) == "0" )
        return;

    self _meth_8055();
    var_0 = _func_0B5( 0.75, 1.2 );
    self.dummy _meth_82AD( -45, var_0, var_0 / 3, var_0 / 3 );
    wait(_func_0B5( 0.3, 0.9 ));
    var_1 = -5;

    for (;;)
    {
        wait 0.05;
        self.dummy _meth_82B4( var_1, 0.05 );

        if ( var_1 == -5 )
        {
            var_1 = 5;
            continue;
        }

        var_1 = -5;
    }
}

obj_rescue_vip()
{
    common_scripts\utility::_id_384A( "obj_rescue_vip_given" );
    var_0 = 1;
    var_1 = getent( "obj_rescue_vip1", "targetname" );
    objective_add( var_0, "active", &"AIRPLANE_OBJ_RESCUE_VIP", var_1._id_02E2 );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "player_up_breach_stairs" );
    var_2 = getent( "obj_rescue_vip2", "targetname" );
    objective_position( var_0, var_2._id_02E2 );
    common_scripts\utility::_id_384A( "obj_rescue_vip_complete" );
    objective_state( var_0, "done" );
}

obj_freefall()
{
    common_scripts\utility::_id_384A( "obj_freefall_given" );
    var_0 = 2;
    var_1 = getent( "obj_freefall", "targetname" );
    objective_add( var_0, "active", &"AIRPLANE_OBJ_FREEFALL", var_1._id_02E2 );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_freefall_complete" );
    objective_state( var_0, "done" );
}

weapon_detect()
{
    level endon( "enemies_alerted" );
    var_0 = getent( "intro_damage", "targetname" );
    var_0 waittill( "trigger" );

    if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
        common_scripts\utility::_id_383F( "enemies_alerted" );
}

flashbang_detect()
{
    level endon( "enemies_alerted" );

    for (;;)
    {
        wait 0.05;
        var_0 = getentarray( "grenade", "classname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( var_0[var_1]._id_029C == "projectile_us_smoke_grenade" || var_0[var_1]._id_029C == "projectile_m84_flashbang_grenade" )
            {
                wait 2;

                if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
                    common_scripts\utility::_id_383F( "enemies_alerted" );
            }
        }
    }
}

player_breach_jump()
{
    level._id_0318 endon( "death" );
    common_scripts\utility::_id_384A( "player_breach_jump" );
    level notify( "mission failed" );
    thread white_flash( 0.35 );
    var_0 = getent( "plane_shell", "targetname" );
    var_0 _meth_8055();
    var_1 = getent( "plane_wings", "targetname" );
    var_1 _meth_8056();
    thread _id_53B1();
    level notify( "kill_timer" );
    setdvar( "ui_deadquote", &"AIRPLANE_FAILED_JUMPED_OUT" );
    _id_A5A4::_id_5CDF();
    level._id_0318 _meth_8054();
}

no_grenade_death_hack()
{
    for (;;)
    {
        anim._id_60C6 = gettime() + 300000;
        wait 60;
    }
}

gravity_shift( var_0 )
{
    level endon( "stop_gravity_shift" );
    _func_0D6( "phys_gravityChangeWakeupRadius", 1600 );

    if ( isdefined( var_0 ) )
    {
        var_1 = ( 0, 0, var_0 );
        var_2 = _id_A5A4::vector_multiply( anglestoup( var_1 ), -1 );
        var_3 = _id_A5A4::vector_multiply( anglestoright( var_1 ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }
}

gravity_shift2( var_0 )
{
    level endon( "stop_gravity_shift" );
    _func_0D6( "phys_gravityChangeWakeupRadius", 1600 );

    if ( isdefined( var_0 ) )
    {
        var_1 = ( 0, 0, var_0 );
        var_2 = _id_A5A4::vector_multiply( anglestoup( var_1 ), -1 );
        var_3 = _id_A5A4::vector_multiply( anglestoright( var_1 ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }

    for (;;)
    {
        wait 0.05;
        var_2 = _id_A5A4::vector_multiply( anglestoup( level.org_view_roll.angles ), -1 );
        var_3 = _id_A5A4::vector_multiply( anglestoright( level.org_view_roll.angles ), 0.25 );
        var_4 = var_2 + var_3;
        setphysicsgravitydir( var_4 );
    }
}

create_playerview( var_0 )
{
    if ( isdefined( level.eplayerview ) )
        level.eplayerview delete();

    level.eplayerview = _id_A5A4::_id_88D1( "player_view" );
    level.eplayerview _meth_8056();
    level.eplayerview._id_02E2 = var_0._id_02E2;
    level.eplayerview.angles = var_0.angles;
    level.eplayerview _meth_804F( var_0 );
}

door_open_double( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        var_7 = var_0[var_6];

        switch ( var_7._id_0398 )
        {
            case "left":
                var_1 = var_7;
                continue;
            case "right":
                var_2 = var_7;
                continue;
            case "left_door_model":
                var_3 = var_7;
                continue;
            case "right_door_model":
                var_4 = var_7;
                continue;
            case "door_fx":
                var_5 = var_7;
                continue;
        }
    }

    var_3 _meth_804F( var_1 );
    var_4 _meth_804F( var_2 );
    thread common_scripts\utility::_id_69C2( "wood_door_kick", var_5._id_02E2 );
    playfx( common_scripts\utility::_id_3FA8( "door_kick_dust" ), var_5._id_02E2 );
    var_8 = 0.6;
    var_1 _meth_82B3( -165, var_8, 0, var_8 / 2 );
    var_2 _meth_82B3( 175, var_8, 0, var_8 / 2 );
    var_1 _meth_805A();
    var_2 _meth_805A();
    var_1 _meth_82AB( 2, var_8 );
    var_2 _meth_82AB( 2, var_8 );
}

bathroom_door_open( var_0, var_1 )
{
    thread bathroom_dude_clear();
    var_2 = getent( "blocker_bathroom_door", "targetname" );
    var_2 _meth_8056();
    var_2 _meth_82BB();
    var_2 _meth_805A();
    var_3 = getent( var_0, "targetname" );
    var_4 = getent( var_1, "targetname" );
    var_5 = getent( var_0 + "_model", "targetname" );
    var_6 = getent( var_1 + "_model", "targetname" );
    var_5 _meth_804F( var_3 );
    var_6 _meth_804F( var_4 );
    thread common_scripts\utility::_id_69C2( "airplane_bathroom_door_open", var_3._id_02E2 );
    var_7 = 1;
    var_3 _meth_82B3( 90, var_7, var_7 / 2, var_7 / 2 );
    var_3 _meth_82AC( 1, var_7 );
    var_3 _meth_805A();
    var_4 _meth_82B3( -90, var_7, var_7 / 2, var_7 / 2 );
    var_4 _meth_805A();
    var_4 _meth_82AB( 25, var_7 );
    wait 2;
    common_scripts\utility::_id_384A( "bathroom_dude_clear" );
    var_8 = getent( "bathroom_volume", "targetname" );
    badplace_brush( "badplace_bathroom", 0, var_8, "allies", "axis" );

    for (;;)
    {
        wait 0.05;

        if ( !level._id_0318 _meth_80AB( var_8 ) )
            break;
    }

    thread common_scripts\utility::_id_69C2( "airplane_bathroom_door_close", var_3._id_02E2 );
    var_2 _meth_8055();
    var_2 _meth_82BA();
    var_2 _meth_8059();
    var_3 _meth_82B3( -90, var_7, var_7 / 2, var_7 / 2 );
    var_3 _meth_8059();
    var_4 _meth_82B3( 90, var_7, var_7 / 2, var_7 / 2 );
    var_4 _meth_8059();
    var_4 _meth_82AB( -25, var_7 );
    badplace_delete( "badplace_bathroom" );
}

bathroom_dude_clear()
{
    var_0 = getent( "bathroom_dude_clear", "targetname" );

    while ( !common_scripts\utility::_id_382E( "bathroom_dude_clear" ) )
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) && var_1 == level.hostile_bathroom )
            common_scripts\utility::_id_383F( "bathroom_dude_clear" );
    }
}

airplane_destabilize()
{
    level endon( "stop_airplane_destabilize" );
    common_scripts\utility::_id_384A( "fuselage_breached" );

    for (;;)
    {
        _func_18C( 0.15, 0.05, level._id_0318._id_02E2, 80000 );
        wait 0.05;
    }
}

fx_management()
{
    level.fxexitdoor = _id_A5A4::_id_3FA9( "exit_door_dust" );
    level.fxexitdoor = common_scripts\utility::_id_0CDD( level.fxexitdoor, _id_A5A4::_id_3FA9( "exit_door_wind_suck" ) );
    wait 0.5;
    common_scripts\utility::_id_0D13( level.fxexitdoor, common_scripts\utility::_id_671F );
}

timer_start()
{
    _id_A537::_id_9B21();

    if ( getdvar( "notimer" ) == "1" )
        return;

    var_0 = undefined;
    var_1 = undefined;

    switch ( level._id_3BFE )
    {
        case 0:
            var_1 = 180;
            break;
        case 1:
            var_1 = 150;
            break;
        case 2:
            var_1 = 105;
            break;
        case 3:
            var_1 = 60;
            break;
    }

    level thread timer_logic( var_1, &"AIRPLANE_TIME_TO_LOCATE_VIP" );
    level.timer_start_time = gettime();
}

timer_logic( var_0, var_1, var_2 )
{
    if ( getdvar( "notimer" ) == "1" )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    _id_53B1();
    level endon( "kill_timer" );
    level._id_4AFE = 20;
    level._id_9373 = _id_A546::_id_3D17( undefined, undefined, undefined, undefined, var_0 );
    level._id_9373 _meth_808B( 30, 900000, 700 );
    level._id_9373._id_92B2._id_0241 = var_1;
    level._id_9373 _meth_80D4( var_0 );
    level._id_8CC5 = gettime();

    if ( var_2 == 1 )
        thread timer_tick();

    wait(var_0);
    common_scripts\utility::_id_383F( "timer_expired" );
    thread kill_all_ai();
    _id_A546::destroy_countdown_hud( level._id_9373 );
    level thread mission_failed_out_of_time( &"AIRPLANE_TIMER_EXPIRED" );
}

hostage_timer_cleanup()
{
    common_scripts\utility::_id_3852( "terrorist_killed", "terrorist_wounded" );
    _id_53B1();
}

hostage_timer( var_0 )
{
    if ( getdvar( "notimer" ) == "1" )
        return;

    if ( isdefined( level._id_8CC5 ) )
    {
        level.timetoreachvip = ( gettime() - level._id_8CC5 ) / 1000;
        level.timetovipmessage = "Airplane - difficulty " + level._id_3BFE + ": Time to hostage sequence: ( " + level.timetoreachvip + " seconds )";

        if ( getdvar( "airplane_debug" ) == "1" )
        {

        }
    }

    if ( level._id_3BFE != 3 )
        thread _id_A5A4::_id_114E( 1 );

    level endon( "human_shield_over" );
    _id_53B1();
    level endon( "kill_timer" );
    level._id_4AFE = 20;
    level._id_9373 = _id_A546::_id_3D17( undefined, undefined, undefined, undefined, var_0 );
    level._id_9373 _meth_808B( 30, 900000, 700 );
    level._id_9373._id_92B2._id_0241 = &"AIRPLANE_TIME_TILL_HOSTAGE_KILL";
    level._id_9373 _meth_80D4( var_0 );
    level._id_8CC5 = gettime();
    thread hostage_timer_cleanup();
    thread timer_tick();
    wait(var_0 + 0.15);
    common_scripts\utility::_id_383F( "hostage_timer_expired" );
    _id_A546::destroy_countdown_hud( level._id_9373 );
    level thread mission_failed_out_of_time( &"AIRPLANE_HOSTAGE_TIMER_EXPIRED" );
}

timer_tick()
{
    level endon( "stop_timer_tick" );
    level endon( "kill_timer" );

    for (;;)
    {
        wait 1;
        level._id_0318 thread _id_A5A4::_id_69C4( "countdown_beep" );
        level notify( "timer_tick" );
    }
}

mission_failed_out_of_time( var_0 )
{
    level._id_0318 endon( "death" );
    level endon( "kill_timer" );
    level notify( "mission failed" );
    level._id_0318 _meth_8326( 1 );
    level._id_0318 thread player_death_effect();
    level._id_0318 thread _id_A5A4::_id_69C4( "airplane_final_explosion" );
    _func_076( 1 );
    setdvar( "ui_deadquote", var_0 );
    thread timer_death_hud();
    _id_A5A4::_id_5CDF();
    level notify( "kill_timer" );
}

timer_death_hud()
{
    _id_A5E8::_id_870C( "mission_failed_fade_out" );
    var_0 = _func_1AA( level._id_0318 );
    var_0._id_0530 = 0;
    var_0._id_0538 = 15;
    var_0 _meth_80CE( "hud_death_timeout", 50, 50 );
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0._id_01F3 = "center";
    var_0._id_0501 = "middle";
    var_0._id_0198 = 1;
    var_0.alpha = 0;
    wait 0.65;
    var_0 _meth_8086( 1 );
    var_0.alpha = 1;
}

player_death_effect()
{
    var_0 = level._id_0318;
    playfx( level._id_058F["player_death_explosion"], var_0._id_02E2 );
    _func_18C( 1, 1, level._id_0318._id_02E2, 100 );
}

_id_53B1()
{
    level notify( "kill_timer" );

    if ( isdefined( level._id_9373 ) )
        _id_A546::destroy_countdown_hud( level._id_9373 );
}

ai_think( var_0 )
{
    if ( isdefined( var_0._id_7A99 ) && var_0._id_7A99 == "scripted" )
        return;

    if ( var_0._id_04A7 == "axis" )
        var_0 thread ai_axis_think();

    if ( var_0._id_04A7 == "allies" )
        var_0 thread ai_allies_think();
}

ai_allies_think()
{
    self._id_0C72 = "frnd";
    _id_A5A4::_id_7F71( 1 );
    _id_A5A4::_id_30B0();
    _id_A5A4::_id_2A85();
    self._id_2B12 = 1;

    if ( !isdefined( self._id_58D7 ) )
        thread _id_A5A4::_id_58D7();

    self.a._id_2B20 = 1;

    switch ( level._id_3BFE )
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
    }
}

ai_civilian_think()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = var_0._id_0398;
    var_2 = _id_A5A9::_id_21A2( self );
    var_2.allowdeath = 0;
    var_2.nofriendlyfire = 1;
    _id_A5A9::_id_297A( var_2, "weapon_" );
    var_2._id_01FF = 1;

    if ( !isdefined( var_2._id_58D7 ) )
        var_2 thread _id_A5A4::_id_58D7();

    var_0 thread _id_A510::_id_0BCE( var_2, var_1, undefined, "stop_idle" );
}

ai_patroller()
{
    self endon( "death" );
    thread ai_patroller_damage();
    thread ai_patroller_death();
    level endon( "enemies_alerted" );

    while ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
    {
        wait 0.05;

        if ( common_scripts\utility::_id_382E( "enemies_alerted" ) )
            break;

        maps\jake_tools::_id_A0AB( self._id_02E2, level.sightdetectdistance );

        if ( common_scripts\utility::_id_382E( "enemies_alerted" ) )
            break;

        if ( self _meth_81C2( level._id_0318 ) )
        {
            if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
                common_scripts\utility::_id_383F( "enemies_alerted" );
        }

        if ( _func_0EE( self._id_02E2, level._id_0318._id_02E2 ) <= level.alertdistance )
        {
            if ( _func_08D( level._id_0318 _meth_80AA(), self._id_02E2 + ( 0, 0, 48 ), 0, undefined ) )
            {
                if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
                    common_scripts\utility::_id_383F( "enemies_alerted" );
            }
        }
    }
}

ai_patroller_damage()
{
    level endon( "enemies_alerted" );
    self endon( "death" );
    self waittill( "damage" );

    if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
        common_scripts\utility::_id_383F( "enemies_alerted" );
}

ai_patroller_death()
{
    level endon( "enemies_alerted" );
    self waittill( "death" );

    if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
        common_scripts\utility::_id_383F( "enemies_alerted" );
}

ai_axis_think()
{
    self._id_0C72 = "hostile";
    thread ai_flashbang_detect();

    if ( !common_scripts\utility::_id_382E( "player_approach_human_shield" ) )
        thread ai_axis_death_think();
}

ai_axis_death_think()
{
    if ( isdefined( level.hostile_bathroom ) && self == level.hostile_bathroom )
        return;

    self waittill( "death" );
    wait 1;

    if ( level.firstaxiskilled == 0 )
    {
        level.firstaxiskilled = 1;
        level thread _id_A5A4::_id_70C4( "airplane_first_hostile_killed_1" );
    }
    else
        level thread sas_dialogue_random( "hostiledown" );
}

ai_flashbang_detect()
{
    self endon( "death" );

    if ( common_scripts\utility::_id_382E( "enemies_alerted" ) )
        return;

    self waittill( "flashbang" );

    if ( !common_scripts\utility::_id_382E( "enemies_alerted" ) )
        common_scripts\utility::_id_383F( "enemies_alerted" );
}

ai_drone_think()
{

}

initprecache()
{
    precacheshellshock( "nosound" );
    precachestring( &"AIRPLANE_TIME_TILL_EXPLOSION" );
    precachestring( &"AIRPLANE_TIME_TO_LOCATE_VIP" );
    precachestring( &"AIRPLANE_TIMER_EXPIRED" );
    precachestring( &"AIRPLANE_FAILED_JUMPED_OUT" );
    precachestring( &"AIRPLANE_OBJ_RESCUE_VIP" );
    precachestring( &"AIRPLANE_OBJ_FREEFALL" );
    precachestring( &"AIRPLANE_TIME_TILL_HOSTAGE_KILL" );
    precachestring( &"AIRPLANE_HOSTAGE_NO_HEADSHOT" );
    precachestring( &"AIRPLANE_CAMPAIGN_COMPLETED" );
    precachemodel( "viewhands_player_usmc" );
    precachemodel( "worldbody_h1_sas_ct" );
    precacheitem( "facemask" );
    precacheshader( "black" );
    precacheshader( "white" );
    precacheshader( "h1_hud_timer_blur" );
    precacheshader( "h1_hud_timer_border" );
    precacheshader( "h1_timer_on_flare" );
    precacheshader( "h1_timer_warning_flare" );
    precacheshader( "hud_death_timeout" );
    precacherumble( "generic_attack_heavy_1500" );
    precacherumble( "breach_loop" );
    precacherumble( "generic_quake_loop" );
    precacherumble( "generic_ambient_loop" );
    precacherumble( "generic_attack_light_500" );
}

disable_color_trigs()
{
    common_scripts\utility::_id_0D13( level.acolornodetriggers, common_scripts\utility::_id_97CC );
}

initfriendlies( var_0 )
{
    waitframe;
    level._id_8AB0 = [];
    level._id_6F7C = _id_A5A4::_id_894B( "price" );
    level.grigsby = _id_A5A4::_id_894B( "grigsby" );
    level.macey = _id_A5A4::_id_894B( "macey" );
    level._id_8AB0[0] = level._id_6F7C;
    level._id_8AB0[1] = level.grigsby;
    level._id_8AB0[2] = level.macey;

    for ( var_1 = 0; var_1 < level._id_8AB0.size; var_1++ )
    {
        level._id_8AB0[var_1].a._id_135B = 1;
        level._id_8AB0[var_1]._id_9C07 = 1;
    }

    var_2 = level._id_8AB0;
    var_3 = _func_0C4( "nodeStart_" + var_0, "targetname" );
    var_4 = 0;
    var_5 = undefined;

    while ( var_4 < 4 )
    {
        wait 0.05;

        for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        {
            if ( isdefined( var_3[var_1]._id_0398 ) )
            {
                switch ( var_3[var_1]._id_0398 )
                {
                    case "nodePrice":
                        level._id_6F7C maps\jake_tools::_id_8CC0( var_3[var_1] );
                        var_2 = common_scripts\utility::_id_0CF6( var_2, level._id_6F7C );
                        var_3 = common_scripts\utility::_id_0CF6( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    case "nodeGrigsby":
                        level.grigsby maps\jake_tools::_id_8CC0( var_3[var_1] );
                        var_2 = common_scripts\utility::_id_0CF6( var_2, level.grigsby );
                        var_3 = common_scripts\utility::_id_0CF6( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    case "nodeMacey":
                        level.macey maps\jake_tools::_id_8CC0( var_3[var_1] );
                        var_2 = common_scripts\utility::_id_0CF6( var_2, level.macey );
                        var_3 = common_scripts\utility::_id_0CF6( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    case "nodePlayer":
                        var_5 = var_3[var_1];
                        var_3 = common_scripts\utility::_id_0CF6( var_3, var_3[var_1] );
                        var_4++;
                        continue;
                    default:
                        continue;
                }
            }
        }
    }

    common_scripts\utility::_id_384A( "intro_fade_in_complete" );
    level._id_0318 _meth_8335( var_5._id_02E2 );
    level._id_0318 _meth_8337( var_5.angles );
}

demo_setup()
{
    common_scripts\utility::_id_383D( "heroes_ready" );
    common_scripts\utility::_id_383D( "part1" );
    common_scripts\utility::_id_383D( "part2" );
    common_scripts\utility::_id_383D( "part3" );
    common_scripts\utility::_id_383D( "part4" );
    common_scripts\utility::_id_383D( "part5" );
    common_scripts\utility::_id_383F( "part1" );
    common_scripts\utility::_id_383F( "part2" );
    common_scripts\utility::_id_383F( "part3" );
    common_scripts\utility::_id_383F( "part4" );
    common_scripts\utility::_id_383F( "part5" );
    var_0 = getent( "demo_spawners", "target" );
    var_0 notify( "trigger" );
    wait 0.1;
    var_1 = _func_0D9( "allies" );
    level._id_483C = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        switch ( var_1[var_2]._id_0398 )
        {
            case "demo_alavi":
                level._id_483C["alavi"] = var_1[var_2];
                continue;
            case "demo_price":
                level._id_483C["price"] = var_1[var_2];
                continue;
            case "demo_grigsby":
                level._id_483C["grigsby"] = var_1[var_2];
                continue;
        }
    }

    _id_A5A4::_id_1332();
    common_scripts\utility::_id_383F( "heroes_ready" );
}

demo_walkthrough()
{
    common_scripts\utility::_id_384A( "heroes_ready" );
    var_0 = _func_1D3( level._id_483C );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        level._id_483C[var_2] _id_A5A4::_id_30B0();
        level._id_483C[var_2]._id_020C = 60;
        level._id_483C[var_2]._id_2B0E = 1;
    }

    var_3 = [];
    var_3["alavi"] = 0.85;
    var_3["grigsby"] = 0;
    var_3["price"] = 0.5;
    thread hallways_heroes( "part1", "nothing", undefined, var_3 );
    wait 4.25;
    level._id_483C["price"] _id_A5A4::_id_4697( "onme" );
}

hallways_heroes( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
    {
        var_2 = [];
        var_2["alavi"] = undefined;
        var_2["grigsby"] = undefined;
        var_2["price"] = undefined;
    }

    if ( !isdefined( var_4 ) )
    {
        var_4 = [];
        var_4["alavi"] = undefined;
        var_4["grigsby"] = undefined;
        var_4["price"] = undefined;
    }

    if ( !isdefined( var_3 ) )
    {
        var_3 = [];
        var_3["alavi"] = 0;
        var_3["grigsby"] = 1;
        var_3["price"] = 2;
    }

    var_5 = _func_1D3( level._id_483C );

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6];
        level._id_483C[var_7] _id_A5A4::_id_27EF( var_3[var_7], ::hallways_heroes_solo, var_0, var_1, var_2[var_7], var_4[var_7] );
    }

    level endon( var_1 );
    _id_A5A4::_id_0D18( level._id_483C, "hallways_heroes_ready" );
    common_scripts\utility::_id_384A( var_0 );
}

hallways_heroes_solo( var_0, var_1, var_2, var_3 )
{
    self _meth_81A7( 1 );
    level endon( var_1 );
    var_4 = _func_0C4( var_0, "targetname" );
    var_5 = undefined;

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        if ( var_4[var_6]._id_0398 == self._id_0398 )
        {
            var_5 = var_4[var_6];
            break;
        }
    }

    while ( isdefined( var_5 ) )
    {
        self _meth_81A9( var_5 );

        if ( var_5._id_0351 )
            self._id_01C4 = var_5._id_0351;
        else
            self._id_01C4 = 80;

        if ( isdefined( var_3 ) )
        {
            var_7 = 1;

            if ( isdefined( self._id_2B0E ) && self._id_2B0E == 1 )
                var_7 = 0;

            self._id_2B0E = 1;
            var_8 = undefined;

            if ( var_3 == "stand2run180" )
                var_8 = self;
            else if ( isdefined( self._id_02BB ) && _func_0EE( self._id_02BB._id_02E2, self._id_02E2 ) < 4 )
                var_8 = self._id_02BB;
            else if ( isdefined( self.goodnode ) && _func_0EE( self.goodnode._id_02E2, self._id_02E2 ) < 4 )
                var_8 = self.goodnode;
            else
                var_8 = self;

            var_9 = spawn( "script_origin", var_8._id_02E2 );
            var_9.angles = var_8.angles;
            self.hackexit = var_9;

            if ( var_3 == "stand2run180" )
                var_9.angles += ( 0, 32, 0 );

            if ( var_8 != self )
            {
                if ( _func_120( var_3, "cornerleft" ) )
                    var_9.angles += ( 0, 90, 0 );
                else if ( _func_120( var_3, "cornerright" ) )
                    var_9.angles -= ( 0, 90, 0 );
            }

            self._id_0C72 = "guy";
            var_10 = getanimlength( level._id_78AC[self._id_0C72][var_3] );
            var_9 thread _id_A510::_id_0C24( self, var_3 );
            wait(var_10 - 0.2);
            self _meth_8143();
            var_9 delete();
            var_3 = undefined;

            if ( var_7 )
                self._id_2B0E = 0;
        }

        self waittill( "goal" );

        if ( isdefined( var_5._id_7A99 ) )
        {
            var_11 = _func_124( var_5._id_7A99, ":;, " );

            for ( var_12 = 0; var_12 < var_11.size; var_12++ )
            {
                switch ( var_11[var_12] )
                {
                    case "disable_cqb":
                        if ( isdefined( var_5._id_04A4 ) )
                            disable_cqbwalk_ign_demo_wrapper();
                        else
                            _id_A5A4::_id_27EF( 1.5, ::disable_cqbwalk_ign_demo_wrapper );

                        continue;
                    case "enable_cqb":
                        if ( isdefined( var_5._id_04A4 ) )
                            enable_cqbwalk_ign_demo_wrapper();
                        else
                            _id_A5A4::_id_27EF( 1.5, ::enable_cqbwalk_ign_demo_wrapper );

                        continue;
                }
            }
        }

        if ( isdefined( var_5._id_04A4 ) )
        {
            var_5 = _func_0C3( var_5._id_04A4, "targetname" );
            continue;
        }

        var_5 = undefined;
    }

    self notify( "hallways_heroes_ready" );
}

decanim( var_0 )
{
    while ( self._id_0C78 != var_0 )
    {
        self._id_0C78 -= 0.05;
        wait 0.1;
    }
}

disable_cqbwalk_ign_demo_wrapper()
{
    _id_A5A4::_id_2A8D();
    self._id_020C = 96;
}

enable_cqbwalk_ign_demo_wrapper()
{
    _id_A5A4::_id_30B0();
    self._id_020C = 50;
}

addgasmaskcracks()
{
    var_0 = 250;
    var_1 = getent( "breach_physics", "targetname" );

    if ( _func_0F0( level._id_0318._id_02E2, var_1._id_02E2 ) < var_0 * var_0 )
    {
        level.maskcracksfx = spawnfx( level._id_058F["goggles_cracks"], level._id_0318._id_02E2 );
        triggerfx( level.maskcracksfx );
        level._id_0318 thread _id_A5A4::_id_69C4( "scn_airplane_explosion_mask_crack" );
    }
}

airplane_wibble_setup()
{
    level endon( "game_ended" );
    maps\_wibble::set_cloth_wibble( 0.0 );

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "fuselage_breached" ) )
            maps\_wibble::set_cloth_wibble( 0.5 );
        else
            maps\_wibble::set_cloth_wibble( 0.0 );

        wait 0.1;
    }
}

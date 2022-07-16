// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\createart\launchfacility_a_art::main();
    level thread maps\launchfacility_a_fx::main();
    maps\launchfacility_a_precache::main();
    _id_A550::main();
    maps\launchfacility_a_anim::main();
    level thread maps\launchfacility_a_amb::main();
    maps\launchfacility_a_lighting::main();
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

    if ( getdvar( "debug_bmp" ) == "" )
        setdvar( "debug_bmp", "0" );

    if ( getdvar( "debug_launch" ) == "" )
        setdvar( "debug_launch", "0" );

    initprecache();
    createthreatbiasgroup( "player" );
    level.team01 = [];
    level.team02 = [];
    level.team03 = [];
    level._id_2235["45"] = _func_0B7( 45 );
    level.balconyflag = getent( "balcony_flag", "script_noteworthy" );
    level.bmpexcluders = [];
    level.hindattacker = undefined;
    level.peoplespeaking = 0;
    level.team01breacher = undefined;
    level.team02breacher = undefined;
    level.team03breacher = undefined;
    level.sniperkills = 0;
    level.sniperconfirmdialogue = 1;
    level.snipertarget = undefined;
    level.sniperinterval = 5;
    level.snipersactive = 0;
    level.playermaxdistancetobmpc4 = 256;
    level.playermaxdistancetobmpc4squared = level.playermaxdistancetobmpc4 * level.playermaxdistancetobmpc4;
    level.playermaxdistancefrombmp = 1024;
    level.playermaxdistancefrombmpsquared = level.playermaxdistancefrombmp * level.playermaxdistancefrombmp;
    level.playerdistancetoai = 256;
    level.playerdistancetoaisquared = level.playerdistancetoai * level.playerdistancetoai;
    level.axiskilledbyplayer = 0;
    level.playerparticipationcontainer = 10;
    level.playerparticipationgate = 15;
    level.minbmpexplosiondmg = 50;
    level.maxbmpexplosiondmg = 100;
    level.bmpcannonrange = 2048;
    level.bmpmgrange = 850;
    level.bmpmgrangesquared = level.bmpmgrange * level.bmpmgrange;
    level.playervehicledamagerange = 256;
    level.playervehicledamagerangesquared = level.playervehicledamagerange * level.playervehicledamagerange;
    level._id_32D5 = undefined;
    level.aideletedistance = 512;
    level.enemyarmor = [];
    level.enemyarmorindex = 0;
    level.maxfriendlieskilled = 2;
    level._id_2235 = [];
    level._id_2235["35"] = _func_0B7( 35 );
    level._id_2235["45"] = _func_0B7( 45 );
    level._id_2235["180"] = _func_0B7( 180 );
    level.color["white"] = ( 1, 1, 1 );
    level.color["red"] = ( 1, 0, 0 );
    level.color["blue"] = ( 0.1, 0.3, 1 );
    level.c4_callback_thread = ::c4_callback_thread_launchfacility;
    level._id_89CB = ::ai_think;
    level._id_33E7 = [];
    level.acolornodetriggers = [];
    level.mig29_near_distance_override = 11880;
    var_0 = getentarray( "trigger_multiple", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_0398 ) && _func_122( var_0[var_1]._id_0398, 0, 10 ) == "colornodes" )
            level.acolornodetriggers = common_scripts\utility::_id_0CDA( level.acolornodetriggers, var_0[var_1] );
    }

    _id_A5A4::_id_079C( "container", ::start_container, &"STARTS_CONTAINER" );
    _id_A5A4::_id_079C( "tarmac", ::start_tarmac, &"STARTS_TARMAC" );
    _id_A5A4::_id_079C( "gate", ::start_gate, &"STARTS_GATE" );
    _id_A5A4::_id_079C( "vents", ::start_vents, &"STARTS_VENTS" );
    _id_A5A4::_id_278B( ::start_default );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_m16_clip";
    level.weaponclipmodels[1] = "weapon_saw_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    level.weaponclipmodels[3] = "weapon_dragunov_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    level.weaponclipmodels[5] = "weapon_g36_clip";
    maps\createart\launchfacility_a_art::main();
    maps\launchfacility_a_precache::main();
    level thread maps\launchfacility_a_fx::main();
    maps\_c4::main();
    thread maps\_leak::main();
    thread common_scripts\_pipes::main();
    _id_A550::main();
    maps\launchfacility_a_anim::main();
    maps\launchfacility_a_lighting::main();
    maps\launchfacility_a_aud::main();
    _id_A55E::main();
    maps\_javelin::init();
    _id_A51D::_id_8324( "compass_map_launchfacility_a" );
    level thread maps\launchfacility_a_amb::main();
    common_scripts\utility::_id_383D( "aa_first_bmp_section" );
    common_scripts\utility::_id_383D( "aa_container_to_gate_section" );
    common_scripts\utility::_id_383D( "aa_tarmac_bmp01_section" );
    common_scripts\utility::_id_383D( "aa_tarmac_bmp02_section" );
    common_scripts\utility::_id_383D( "bmp_02_spawned" );
    common_scripts\utility::_id_383D( "bmp_03_spawned" );
    common_scripts\utility::_id_383D( "bmp_04_spawned" );
    common_scripts\utility::_id_383D( "obj_gain_access_given" );
    common_scripts\utility::_id_383D( "obj_gain_access_complete" );
    common_scripts\utility::_id_383D( "obj_enemy_armor_given" );
    common_scripts\utility::_id_383D( "obj_enemy_armor_complete" );
    common_scripts\utility::_id_383D( "obj_north_tarmac_given" );
    common_scripts\utility::_id_383D( "obj_north_tarmac_complete" );
    common_scripts\utility::_id_383D( "obj_rappel_given" );
    common_scripts\utility::_id_383D( "obj_rappel_complete" );
    common_scripts\utility::_id_383D( "container_loudspeaker" );
    common_scripts\utility::_id_383D( "friendly_shoots_down_heli" );
    common_scripts\utility::_id_383D( "friendly_shoots_down_heli_new" );
    common_scripts\utility::_id_383D( "enemy_can_blow_up_truck" );
    common_scripts\utility::_id_383D( "hind_intro_dialogue" );
    common_scripts\utility::_id_383D( "friendlies_past_killzone" );
    common_scripts\utility::_id_383D( "inside_perimeter" );
    common_scripts\utility::_id_383D( "stop_alarm" );
    common_scripts\utility::_id_383D( "hind_crash" );
    common_scripts\utility::_id_383D( "heli_attractor_deleted" );
    common_scripts\utility::_id_383D( "flanking_wall_breached" );
    common_scripts\utility::_id_383D( "blow_the_gate" );
    common_scripts\utility::_id_383D( "bmp_02_destroyed" );
    common_scripts\utility::_id_383D( "gate_sequence_starting" );
    common_scripts\utility::_id_383D( "migs_flyby1" );
    common_scripts\utility::_id_383D( "migs_flyby2" );
    common_scripts\utility::_id_383D( "music_gimme_sitrep" );
    common_scripts\utility::_id_383D( "bmp_03_destroyed" );
    common_scripts\utility::_id_383D( "bmp_04_destroyed" );
    common_scripts\utility::_id_383D( "one_bmp_left" );
    common_scripts\utility::_id_383D( "blackhawk_dudes_unloaded" );
    common_scripts\utility::_id_383D( "hinds_appear" );
    common_scripts\utility::_id_383D( "hind_rocket_sequence" );
    common_scripts\utility::_id_383D( "hind_missiles_fired" );
    common_scripts\utility::_id_383D( "vent01_open" );
    common_scripts\utility::_id_383D( "vent02_open" );
    common_scripts\utility::_id_383D( "vent03_open" );
    common_scripts\utility::_id_383D( "rappel_started" );
    common_scripts\utility::_id_383D( "team01_hooked_up" );
    common_scripts\utility::_id_383D( "team02_hooked_up" );
    common_scripts\utility::_id_383D( "team03_hooked_up" );
    common_scripts\utility::_id_383D( "player_reached_kill_max" );
    common_scripts\utility::_id_383D( "level_fade_out" );
    precachemodel( "projectile_stinger_missile" );
    initdifficulty();
    _id_4DFB();
    vehicle_patrol_init();
    disable_color_trigs();
    maps\jake_tools::_id_486B();
    launch_lid_setup();
    thread migs_flyby1();
    thread migs_flyby2();
    thread sniper_activity();
    thread vent_flashlights();
    common_scripts\utility::_id_0D13( _func_1ED( "plane_sound", "script_noteworthy" ), _id_A632::_id_6877 );
    common_scripts\utility::_id_0D13( getentarray( "hostiles_container_runners", "script_noteworthy" ), _id_A5A4::_id_0798, ::ai_chain_and_seek );
    common_scripts\utility::_id_0D13( getentarray( "hostiles_player_seek", "script_noteworthy" ), _id_A5A4::_id_0798, ::ai_player_seek );
    common_scripts\utility::_id_0D13( getentarray( "hostiles_vehicle_support", "script_noteworthy" ), _id_A5A4::_id_0798, ::ai_vehicle_support );
    common_scripts\utility::_id_0D13( getentarray( "enemy_rpd", "script_noteworthy" ), _id_A5A4::_id_0798, ::ai_enemy_rpd );
    var_2 = [];
    var_2[0] = "bmp_02";
    var_2[1] = "bmp_03";
    var_2[2] = "bmp_04";
    thread vehicle_bmp_setup( var_2 );
    thread vehicle_truck_setup();
    var_3 = getentarray( "c4_plant", "targetname" );

    if ( var_3.size > 0 )
        common_scripts\utility::_id_0D13( var_3, ::c4_plant_think );
}

_id_2674()
{
    thread maps\jake_tools::_id_6FA6( "X", ( -6271, -16779, -964 ), 10 );
}

start_default()
{
    aa_approach_init();
    _id_A5E8::_id_870C( "start_default_checkpoint" );
}

start_container()
{
    initfriendlies( "container" );
    _id_A5E8::_id_870C( "start_container_checkpoint" );
}

start_gate()
{
    initfriendlies( "gate" );
    aa_gate_init();
    _id_A5E8::_id_870C( "start_gate_checkpoint" );
    wait 0.5;
    common_scripts\utility::_id_383F( "bmp_02_destroyed" );
}

start_tarmac()
{
    initfriendlies( "tarmac" );
    _id_A5E8::_id_870C( "start_tarmac_checkpoint" );
}

start_vents()
{
    initfriendlies( "vents" );
    aa_vents_init();
    _id_A5E8::_id_870C( "start_vents_checkpoint" );
}

aa_approach_init()
{
    common_scripts\utility::_id_383F( "aa_first_bmp_section" );
    thread loudspeaker();
    thread music_intro();
    thread launchfacility_a_intro_dvars();
    thread aa_gate_init();
    initfriendlies( "default" );
    thread _id_2A1A();
    thread dialogue_c4_hints();
    _id_A5A4::_id_1332( "allies" );
    maps\jake_tools::_id_981B( "colornodes_approach", "script_noteworthy", 1 );
    maps\jake_tools::_id_981B( "colornodes_container", "script_noteworthy", 1 );
    thread alarm_sound_thread();
    thread obj_gain_access();
    thread reach_container_area();
    thread container_rpg_moment();
    thread exit_container_area();
    thread hind_intro_think();
    thread heli_guy_death();
    thread container_heli_sequence();
    thread flanking_wall_breached();
}

music_intro()
{
    common_scripts\utility::_id_384A( "music_gimme_sitrep" );
    wait 2;
    _id_A5E8::_id_870C( "start_gimme_sitrep_music_mix" );

    for (;;)
    {
        _id_A5A4::_id_6008( "launch_a_action_music" );
        wait 115;
        _func_076( 1 );
        wait 1.2;
    }
}

launchfacility_a_intro_dvars()
{
    common_scripts\utility::_id_384A( "introscreen_complete" );
    _func_0D6( "compass", 1 );
    _func_0D6( "ammoCounterHide", "0" );
}

container_rpg_moment()
{
    level endon( "exit_container_area" );
    common_scripts\utility::_id_384A( "reach_container_area" );
    common_scripts\utility::_id_384A( "heli_attractor_deleted" );
    var_0 = getent( "volume_containers", "targetname" );
    var_1 = getentarray( "rpg_source", "targetname" );
    var_2 = getentarray( "rpg_target", "targetname" );
    wait 2;
    thread rpg_ambient( var_1, var_2, 2 );
    wait(_func_0B5( 10, 20 ));

    for (;;)
    {
        wait 0.5;

        while ( !level._id_0318 _meth_80AB( var_0 ) )
        {
            var_3 = _func_0B4( 1, 3 );
            thread rpg_ambient( var_1, var_2, var_3 );
            wait(_func_0B5( 10, 20 ));
        }
    }
}

loudspeaker()
{
    common_scripts\utility::_id_384A( "container_loudspeaker" );
    dialogue_loudspeaker( "launchfacility_a_rul_highalert" );
    common_scripts\utility::_id_384A( "inside_perimeter" );
    wait 1;
    level thread dialogue_loudspeaker( "launchfacility_a_rul_underattack" );
    common_scripts\utility::_id_384A( "migs_flyby1" );
    wait 7.5;
    dialogue_loudspeaker( "launchfacility_a_rul_redspentznaz" );

    while ( !common_scripts\utility::_id_382E( "obj_enemy_armor_complete" ) )
    {
        dialogue_loudspeaker( "launchfacility_a_rul_motherland" );

        if ( common_scripts\utility::_id_382E( "obj_enemy_armor_complete" ) )
            break;

        wait 3;

        if ( common_scripts\utility::_id_382E( "obj_enemy_armor_complete" ) )
            break;

        dialogue_loudspeaker( "launchfacility_a_rul_avengefallen" );

        if ( common_scripts\utility::_id_382E( "obj_enemy_armor_complete" ) )
            break;

        wait 3;

        if ( common_scripts\utility::_id_382E( "obj_enemy_armor_complete" ) )
            break;

        dialogue_loudspeaker( "launchfacility_a_rul_restorehonor" );
    }

    dialogue_loudspeaker( "launchfacility_a_rul_preptubes" );

    for (;;)
    {
        dialogue_loudspeaker( "launchfacility_a_rul_motherland" );
        wait 2;
        dialogue_loudspeaker( "launchfacility_a_rul_avengefallen" );
        wait 3;
        dialogue_loudspeaker( "launchfacility_a_rul_restorehonor" );
    }
}

_id_2A1A()
{
    waitframe;
    level.grigsby _id_A5A4::_id_27EF( 1.5, _id_A510::_id_0C24, level.grigsby, "spin" );
    level.peoplespeaking = 1;
    level _id_A5A4::_id_70C4( "launchfacility_a_hqr_stillworking" );
    common_scripts\utility::_id_383F( "obj_gain_access_given" );
    level.peoplespeaking = 0;
    common_scripts\utility::_id_384A( "hind_intro_dialogue" );
    var_0 = maps\jake_tools::_id_3CF2();
    level.peoplespeaking = 1;
    _id_A5A4::_id_1333( "allies" );
    wait 3;
    level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_price_gogogo1" );
    level _id_A5A4::_id_70C4( "launchfacility_a_recon_sniperteamtwo" );
    level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_price_keepposted" );
    common_scripts\utility::_id_383F( "container_loudspeaker" );
    level.peoplespeaking = 0;
    wait 5;
    thread dialogue_smoke_hints();
}

dialogue_smoke_hints()
{
    common_scripts\utility::_id_384A( "bmp_02_spawned" );
    level endon( "bmp_02_destroyed" );
    level endon( "bmp_bypassed" );
    level endon( "player_reached_kill_max" );

    if ( common_scripts\utility::_id_382E( "bmp_02_destroyed" ) )
        return;

    common_scripts\utility::_id_3852( "reach_container_halfwaypoint", "enter_container_area" );
    var_0 = 0;
    var_1 = getent( "volume_smoke", "targetname" );
    var_1._id_8689 = 0;
    var_1 thread maps\jake_tools::_id_867F();
    thread dialogue_smoke_hints_cleanup( var_1 );

    while ( var_1._id_8689 == 0 )
    {
        var_0++;

        if ( var_0 == 1 )
            level _id_A5A4::_id_70C4( "launchfacility_a_recon_enemiestonorth" );
        else if ( var_0 == 2 )
            level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_price_smoke_nag_01" );
        else if ( var_0 == 3 )
            level.grigsby maps\jake_tools::_id_2A05( "launchfacility_a_grigsby_smoke_nag_01" );
        else
            break;

        while ( isdefined( level._id_24EC ) )
            wait 0.05;

        thread _id_A5A4::_id_48B0( &"SCRIPT_PLATFORM_LAUNCHFACILITY_A_HINT_SMOKE", 5 );
        wait(_func_0B5( 6, 11 ));
    }

    if ( var_1._id_8689 == 0 )
    {
        var_2 = [];
        var_2[0] = level._id_6F7C;
        var_2[1] = level.grigsby;
        var_3 = common_scripts\utility::_id_3CCB( level._id_0318._id_02E2, level._id_8AB0, var_2 );
        var_4 = var_3[var_3.size - 1];

        if ( isdefined( var_4 ) && _func_1A1( var_4 ) )
        {
            var_4 thread maps\jake_tools::_id_2A05( "launchfacility_a_marine_01_throwing_smoke" );
            var_5 = _id_A5A8::get_vehicle_from_targetname( "bmp_02" );
            var_6 = var_4._id_01D6;
            var_4._id_01D6 = "smoke_grenade_american";
            var_4._id_01D0++;
            var_4 _meth_803A( var_5._id_02E2, ( 0, 0, 0 ), 0 );
            var_1 notify( "smoke_has_been_thrown" );
            var_4._id_01D6 = var_6;
        }
    }
}

dialogue_c4_hints()
{
    common_scripts\utility::_id_384A( "bmp_02_spawned" );
    level endon( "bmp_02_destroyed" );
    level endon( "bmp_bypassed" );
    level endon( "player_reached_kill_max" );

    if ( common_scripts\utility::_id_382E( "bmp_02_destroyed" ) )
        return;

    if ( common_scripts\utility::_id_382E( "bmp_bypassed" ) )
        return;

    if ( common_scripts\utility::_id_382E( "player_reached_kill_max" ) )
        return;

    var_0 = getent( "volume_smoke", "targetname" );
    var_0 waittill( "smoke_has_been_thrown" );
    wait 2;
    thread bmp_nags( "bmp_02_destroyed", 1 );
}

dialogue_smoke_hints_cleanup( var_0 )
{
    var_0 waittill( "smoke_has_been_thrown" );
    thread _id_A5A4::_id_48CB();
}

flanking_wall_breached()
{
    common_scripts\utility::_id_384A( "flanking_wall_breached" );

    if ( common_scripts\utility::_id_382E( "exit_container_area" ) )
        return;

    common_scripts\utility::_id_383F( "exit_container_area" );
    var_0 = getent( "killspawner_exit_container", "targetname" );
    var_0 notify( "trigger", level._id_0318 );
}

alarm_sound_thread()
{
    var_0 = getent( "origin_sound_alarm", "targetname" );
    var_0 _meth_8077( "emt_alarm_base_alert" );
    common_scripts\utility::_id_384A( "stop_alarm" );
    var_0 _meth_80AD( "emt_alarm_base_alert" );
}

friendlies_blow_bmp02()
{
    level endon( "bmp_02_destroyed" );
    common_scripts\utility::_id_384A( "bmp_bypassed" );
    thread squad_bmp_destroy( "bmp_02" );
}

firemg( var_0, var_1, var_2 )
{
    self endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = level._id_0318;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self _meth_825E( var_2, ( 0, 0, var_1 ) );
    var_3 = 0.1;

    if ( !isdefined( var_0 ) )
        var_0 = _func_0B4( 8, 20 );

    self.turretfiring = 1;
    var_4 = 0;

    while ( var_4 < var_0 )
    {
        var_4++;
        wait(var_3);
        self _meth_8264();
    }

    self.turretfiring = 0;
}

reach_container_area()
{
    common_scripts\utility::_id_384A( "reach_container_area" );
    thread _id_A5A4::_id_1143( "container" );
    wait 2;
}

container_heli_sequence()
{
    while ( !isdefined( level.friendly_at4 ) )
        wait 0.05;

    var_0 = _func_0C3( "node_at4_guy", "targetname" );
    createthreatbiasgroup( "ignored" );
    level.friendly_at4 maps\jake_tools::_id_7ED8( "ignored" );
    setignoremegroup( "ignored", "axis" );
    setignoremegroup( "axis", "ignored" );
    level.friendly_at4 maps\jake_tools::_id_7DD7( "frnd" );
    level.friendly_at4._id_01FF = 1;
    var_0 _id_A510::_id_0BFF( level.friendly_at4, "AT4_fire_start" );
    level.friendly_at4 _meth_81CE( "crouch" );
    common_scripts\utility::_id_384A( "friendly_shoots_down_heli_new" );
    level.friendly_at4 _meth_81CE( "crouch", "stand", "prone" );
    level.friendly_at4 _meth_801D( "weapon_stinger", "TAG_INHAND" );
    var_0 thread _id_A510::_id_0C24( level.friendly_at4, "AT4_fire" );
    level.friendly_at4 waittillmatch( "single anim", "fire" );
    var_1 = level.friendly_at4 _meth_8184( "TAG_INHAND" );
    var_2 = _func_1C2( "rpg_player", var_1, level.ehindintro._id_02E2 );
    var_2 _meth_80B3( "projectile_stinger_missile" );
    level.friendly_at4 waittillmatch( "single anim", "end" );
    var_3 = level.friendly_at4 _meth_8184( "TAG_INHAND" );
    var_4 = level.friendly_at4 _meth_8185( "TAG_INHAND" );
    level.friendly_at4 _meth_802A( "weapon_stinger", "TAG_INHAND" );
    var_5 = spawn( "script_model", var_3 );
    var_5 _meth_80B3( "weapon_stinger" );
    var_5.angles = var_4;
    var_0 thread _id_A510::_id_0BE1( level.friendly_at4, "AT4_idle", undefined, "stop_idle" );
    common_scripts\utility::_id_384A( "migs_flyby1" );

    if ( isdefined( level.friendly_at4 ) )
    {
        var_0 notify( "stop_idle" );

        if ( isdefined( level.friendly_at4._id_58D7 ) )
            level.friendly_at4 _id_A5A4::_id_8EA4();

        level.friendly_at4 delete();
        var_5 delete();
    }
}

container_heli_sequence2()
{
    while ( !isdefined( level.friendly_at4 ) )
        wait 0.05;

    var_0 = _func_0C3( "node_at4_guy", "targetname" );
    createthreatbiasgroup( "ignored" );
    level.friendly_at4 maps\jake_tools::_id_7ED8( "ignored" );
    setignoremegroup( "ignored", "axis" );
    setignoremegroup( "axis", "ignored" );
    level.friendly_at4 maps\jake_tools::_id_7DD7( "frnd" );
    level.friendly_at4._id_01FF = 1;
    var_0 _id_A510::_id_0BFF( level.friendly_at4, "RPG_conceal_idle_start" );
    var_0 thread _id_A510::_id_0BE1( level.friendly_at4, "RPG_conceal_idle", undefined, "stop_idle" );
    common_scripts\utility::_id_384A( "friendly_shoots_down_heli" );
    var_0 notify( "stop_idle" );
    var_0 _id_A510::_id_0C24( level.friendly_at4, "RPG_conceal_2_standR" );
    var_1 = level.friendly_at4 _meth_8184( "TAG_WEAPON_RIGHT" );
    _func_1C2( "rpg_player", var_1, level.ehindintro._id_02E2 );
    level.friendly_at4 _id_A510::_id_0C24( level.friendly_at4, "RPG_standR_2_conceal" );
    var_0 thread _id_A510::_id_0BE1( level.friendly_at4, "RPG_conceal_idle", undefined, "stop_idle" );
    common_scripts\utility::_id_384A( "exit_container_area" );

    if ( isdefined( level.friendly_at4 ) )
    {
        if ( isdefined( level.friendly_at4._id_58D7 ) )
            level.friendly_at4 _id_A5A4::_id_8EA4();

        level.friendly_at4 delete();
    }
}

hind_crash_failsafe()
{
    level.ehindintro endon( "death" );
    wait 4.75;
    level.ehindintro notify( "death" );
}

hind_intro_think()
{
    level.ehindintro = _id_A5A8::_id_8978( "hind_intro_flyby_01" );
    level thread _id_A5A8::_id_427A( level.ehindintro );
    var_0 = "tag_origin";
    var_1 = spawn( "script_origin", level.ehindintro _meth_8184( var_0 ) );
    var_1 _meth_804F( level.ehindintro, var_0 );

    if ( getdvar( "debug_launch" ) == "1" )
        var_1 thread maps\jake_tools::_id_6FA6( "TARGET" );

    wait 3.5;
    level.ehindintro thread firemg( _func_0B4( 14, 17 ), 80 );
    wait 2;
    level._id_0318 _meth_809C( "h1r_hind_pass_by" );
    wait 2;
    var_2 = getent( "hind_intro_target2", "targetname" );
    level.ehindintro thread firemg( _func_0B4( 20, 24 ), 80, var_2 );
    wait 1;
    common_scripts\utility::_id_383F( "hind_intro_dialogue" );
    wait 2;
    common_scripts\utility::_id_383F( "friendly_shoots_down_heli_new" );
    wait 3;
    common_scripts\utility::_id_383F( "friendly_shoots_down_heli" );
    level.ehindintro thread hind_crash_failsafe();
    level.ehindintro thread hind_earthquake();
    wait 1;
    var_3 = _func_1A3( var_1, 100000, 60000 );
    wait 1;
    level.ehindintro thread firemg( 15, 80 );
    level.ehindintro waittill( "death" );
    _func_1A7( var_3 );
    common_scripts\utility::_id_383F( "heli_attractor_deleted" );
    level.ehindintro waittill( "crash_done" );
    common_scripts\utility::_id_383F( "hind_crash" );
    common_scripts\utility::_id_383F( "stop_alarm" );
    wait 0.5;
    var_4 = getent( "hind_crash", "targetname" );
}

hind_earthquake()
{
    self waittill( "death" );
    _func_18C( 0.4, 2, self._id_02E2, 4000 );
}

hind_intro_think2()
{
    var_0 = getent( "hind_crash", "script_noteworthy" );
    level.ehindintro = _id_A5A8::waittill_vehiclespawn( "hind_intro" );
    level.ehindintro _meth_8290( 50, 30 );
    level.ehindintro _meth_827F( 120, 15, 15 );
    wait 1;
    common_scripts\utility::_id_383F( "hind_intro_dialogue" );
    wait 0.5;
    level.ehindintro thread firemg( 15, 80 );
    common_scripts\utility::_id_383F( "friendly_shoots_down_heli" );
    var_1 = _func_1A3( level.ehindintro, 10000, 6000 );
    level.ehindintro thread hind_crash_failsafe();
    wait 2.5;
    _func_1A7( var_1 );
    common_scripts\utility::_id_383F( "heli_attractor_deleted" );
    level.ehindintro waittill( "crash_done" );
    common_scripts\utility::_id_383F( "hind_crash" );
    common_scripts\utility::_id_383F( "stop_alarm" );
}

heli_guy_death()
{
    common_scripts\utility::_id_384A( "friendly_shoots_down_heli" );
    wait 19;
    var_0 = getent( "heli_dude", "targetname" );
    var_1 = var_0 _meth_8096();
    _id_A5A4::_id_88F1( var_1 );
    var_2 = var_1._id_02E2 + ( 100, -50, -100 );
    var_1._id_85BA = 1;
    var_1 _meth_8054();
    wait 0.1;
    _func_17E( var_2, 356, 128, 10 );
}

hind_crash_fx()
{
    self endon( "death" );
    wait 1.2;
    playfxontag( level._id_058F["heli_aerial_explosion"], self, "tag_body" );
    thread common_scripts\utility::_id_69C2( "explo_metal_rand", self._id_02E2 );

    for (;;)
    {
        playfxontag( level._id_058F["smoke_trail_heli"], self, "tag_engine_right" );
        wait 0.01;
    }
}

exit_container_area()
{
    common_scripts\utility::_id_384A( "exit_container_area" );
    thread ignore_friendlies_till_past_killzone();
    var_0 = getent( "volume_containers", "targetname" );
    var_0 thread ai_in_volume_chase_player();
    thread truck_blows_up();
    thread left_gate_nag();
}

left_gate_nag()
{
    level endon( "obj_gain_access_complete" );
    common_scripts\utility::_id_384A( "bmp_02_destroyed" );
    var_0 = getent( "volume_leftgate", "script_noteworthy" );

    for (;;)
    {
        wait(_func_0B5( 15, 30 ));

        if ( level._id_0318 _meth_80AB( var_0 ) )
        {
            level.dialoguegatehint_number++;

            if ( level.dialoguegatehint_number > level.dialoguegatehint_max )
                level.dialoguegatehint_number = 1;

            var_1 = "launchfacility_a_gate_hint_0" + level.dialoguegatehint_number;
            level _id_A5A4::_id_70C4( var_1 );
        }
    }
}

truck_blows_up()
{
    level endon( "right_gate_approach" );
    common_scripts\utility::_id_384A( "bmp_02_destroyed" );
    common_scripts\utility::_id_384A( "truck_approach" );
    common_scripts\utility::_id_383F( "enemy_can_blow_up_truck" );
    var_0 = level._id_0318 _meth_80AA();
    var_1 = getent( "truck_troops_perimeter", "script_noteworthy" );

    while ( common_scripts\utility::_id_382E( "enemy_can_blow_up_truck" ) )
    {
        if ( !isdefined( var_1 ) )
            return;

        var_2 = common_scripts\utility::_id_A347( var_0, level._id_0318 _meth_8338(), var_1._id_02E2, level._id_2235["45"] );

        if ( var_2 )
            break;

        wait 0.05;
    }

    if ( !isdefined( var_1 ) )
        return;

    var_3 = maps\jake_tools::_id_3CF2();

    if ( isdefined( var_3 ) )
        var_3 thread _id_A5A4::_id_69C4( "US_grg_threat_rpg" );

    var_4 = getent( "rpg_source_right_1", "script_noteworthy" );
    var_5 = getent( "truck_rpg_target", "targetname" );
    var_6 = _func_1A3( var_5, 10000, 6000 );
    _func_1C2( "rpg", var_4._id_02E2, var_5._id_02E2 );
    wait 3;
    _func_1A7( var_6 );
}

ignore_friendlies_till_past_killzone()
{
    var_0 = getent( "trig_ignoreme", "targetname" );

    for ( var_1 = 0; var_1 < level._id_8AB0.size; var_1++ )
        level._id_8AB0[var_1] thread ignoreme_when_in_trigger( var_0 );
}

ignoreme_when_in_trigger( var_0 )
{
    level endon( "friendlies_past_killzone" );

    for (;;)
    {
        wait 0.05;
        var_0 waittill( "trigger", var_1 );

        if ( var_1 != self )
            continue;

        self._id_01FF = 1;
        self.a._id_2B20 = 1;
        maps\jake_tools::_id_7E72( 128 );

        while ( self _meth_80AB( var_0 ) )
            wait 0.05;

        self._id_01FF = 0;
        self.a._id_2B20 = 0;
        maps\jake_tools::_id_7432();
    }
}

aa_gate_init()
{
    thread balcony_think();
    thread gate_squad_advance_no_bmp();
    thread gate_left_approach();
    thread gate_right_approach();
    thread gate_right_reach();
    thread gate_player_participation();
    thread gate_sequence();
    var_0 = getent( "missile_model03", "targetname" );
    var_1 = getent( "missile_03_shadow_origin", "targetname" );
    var_0 _meth_8477( var_1._id_02E2 );
    var_2 = getent( "missile_model04", "targetname" );
    var_3 = getent( "missile_04_shadow_origin", "targetname" );
    var_2 _meth_8477( var_3._id_02E2 );
    var_4 = getent( "missile_model05", "targetname" );
    var_5 = getent( "missile_05_shadow_origin", "targetname" );
    var_4 _meth_8477( var_5._id_02E2 );
    var_6 = getent( "missile_model06", "targetname" );
    var_7 = getent( "missile_06_shadow_origin", "targetname" );
    var_6 _meth_8477( var_7._id_02E2 );
}

balcony_think()
{
    level endon( "gate_sequence_starting" );
    common_scripts\utility::_id_384A( "reached_balcony" );
    level thread gate_blowup();
    var_0 = getent( "obj_gain_access", "targetname" );
    var_1 = maps\jake_tools::_id_3CF2( var_0 );
    var_1 maps\jake_tools::_id_2A05( "launchfacility_a_marine1_gate_blow" );
    wait 1;
    common_scripts\utility::_id_383F( "blow_the_gate" );
}

gate_squad_advance_no_bmp()
{
    common_scripts\utility::_id_384A( "bmp_02_destroyed" );
    common_scripts\utility::_id_3831( "aa_first_bmp_section" );
    common_scripts\utility::_id_383F( "aa_container_to_gate_section" );
    disable_color_trigs();
    maps\jake_tools::_id_981B( "colornodes_gate_no_bmp", "script_noteworthy", 1 );
    var_0 = getent( "killspawner_exit_container", "targetname" );
    var_0 notify( "trigger", level._id_0318 );
    var_1 = getent( "volume_containers", "targetname" );
    var_2 = maps\jake_tools::_id_3EDE( "axis", undefined, var_1 );

    if ( var_2.size > 0 )
    {
        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[var_3]._id_01E6 = 1;

        thread _id_A5A4::_id_08D6( var_2, level.aideletedistance );
    }

    wait 2;

    while ( level.peoplespeaking )
        wait 0.5;

    level.peoplespeaking = 1;
    level _id_A5A4::_id_70C4( "launchfacility_a_cmd_sitrep" );
    common_scripts\utility::_id_383F( "music_gimme_sitrep" );
    level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_price_were_inside" );
    level.peoplespeaking = 0;
    common_scripts\utility::_id_383F( "inside_perimeter" );
    wait 1.5;
}

gate_left_approach()
{
    common_scripts\utility::_id_384A( "reached_left_gate" );

    if ( getdvar( "debug_bmp" ) == "1" )
        return;
}

gate_right_approach()
{
    common_scripts\utility::_id_384A( "right_gate_approach" );
    level.peoplespeaking = 1;
    level.grigsby maps\jake_tools::_id_2A05( "launchfacility_a_griggs_moreground" );
    level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_price_alreadygot" );
    level.peoplespeaking = 0;
    common_scripts\utility::_id_383F( "migs_flyby1" );
}

gate_right_push_forward()
{
    level endon( "blow_the_gate" );
    common_scripts\utility::_id_384A( "migs_flyby1" );
    wait 8;
    var_0 = getent( "retreat_gate", "targetname" );

    while ( !level._id_0318 _meth_80AB( var_0 ) )
        wait 3;

    level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_pri_breachgate" );
}

gate_player_participation()
{
    level endon( "reached_balcony" );
    level endon( "gate_sequence_starting" );
    common_scripts\utility::_id_384A( "bmp_02_destroyed" );
    level thread player_kill_counter( level.playerparticipationgate );
    common_scripts\utility::_id_3831( "player_reached_kill_max" );
    wait 0.5;
    common_scripts\utility::_id_384A( "player_reached_kill_max" );

    if ( getdvar( "debug_bmp" ) == "1" )
    {

    }

    var_0 = getentarray( "reached_right_gate_additional", "targetname" );
    var_1 = getentarray( "reached_right_gate", "targetname" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] common_scripts\utility::_id_97CE();

    common_scripts\utility::_id_0D13( var_0, ::gate_right_reach_trig_wait );
    level waittill( "level_ent_updated" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] notify( "cancel" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] notify( "cancel" );

    common_scripts\utility::_id_383F( "gate_sequence_starting" );
}

gate_right_reach()
{
    level endon( "reached_balcony" );
    var_0 = getentarray( "reached_right_gate", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::gate_right_reach_trig_wait );
    level waittill( "level_ent_updated" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] notify( "cancel" );

    common_scripts\utility::_id_383F( "gate_sequence_starting" );
}

gate_sequence()
{
    common_scripts\utility::_id_384A( "gate_sequence_starting" );
    thread _id_A5A4::_id_1143( "right_gate" );
    var_0 = level._id_32D5 _meth_8096();
    _id_A5A4::_id_88F1( var_0 );
    var_0 thread friendly_blows_gate();
    level thread gate_blowup();
}

c4_detonation_beep()
{
    var_0 = getent( "gate_explosives", "targetname" );
    thread common_scripts\utility::_id_69C2( "h1_launch_a_c4_plant", var_0._id_02E2 );
    wait 1;

    while ( !common_scripts\utility::_id_382E( "blow_the_gate" ) )
    {
        thread common_scripts\utility::_id_69C2( "h1_launch_a_c4_plant_beep", var_0._id_02E2 );
        wait 1;
    }
}

gate_blowup()
{
    thread _id_A5A4::_id_1143( "gate_being_blown" );
    var_0 = getentarray( "killspawners_gate", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] notify( "trigger", level._id_0318 );

    common_scripts\utility::_id_384A( "blow_the_gate" );
    common_scripts\utility::_id_3831( "aa_container_to_gate_section" );
    common_scripts\utility::_id_383F( "aa_tarmac_bmp01_section" );
    common_scripts\_exploder::_id_3528( 500 );
    var_2 = getent( "gate_explosives", "targetname" );
    thread common_scripts\utility::_id_69C2( "h1_launch_a_c4_gate", var_2._id_02E2 );
    _func_189( var_2._id_02E2, 256, 200, 50 );
    _func_18C( 0.6, 1, var_2._id_02E2, 2000 );
    disable_color_trigs();
    maps\jake_tools::_id_981B( "colornodes_tarmac_front", "script_noteworthy", 1 );
    maps\jake_tools::_id_981B( "colornodes_tarmac_rear", "script_noteworthy", 1 );
    maps\jake_tools::_id_981B( "colornodes_tarmac_always_on", "script_noteworthy", 1 );
    var_3 = getent( "colornodes_tarmac_front_start", "targetname" );
    var_3 notify( "trigger", level._id_0318 );
    var_4 = getentarray( "triggers_bmp_tarmac", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_4.size; var_1++ )
        var_4[var_1] notify( "trigger", level._id_0318 );

    common_scripts\utility::_id_383F( "obj_gain_access_complete" );
    thread _id_A5A4::_id_1143( "gate_blown" );
    thread aa_tarmac_init();
    var_5 = getentarray( "volumes_perimeter", "script_noteworthy" );
    var_6 = [];
    var_7 = undefined;

    for ( var_1 = 0; var_1 < var_5.size; var_1++ )
    {
        var_7 = undefined;
        var_7 = maps\jake_tools::_id_3EDE( "axis", undefined, var_5[var_1] );

        if ( var_7.size > 0 )
            var_6 = _id_A5A4::_id_0CF2( var_6, var_7 );
    }

    if ( var_6.size > 0 )
    {
        for ( var_1 = 0; var_1 < var_6.size; var_1++ )
            var_6[var_1]._id_01E6 = 1;

        thread _id_A5A4::_id_08D6( var_6, level.aideletedistance );
    }
}

friendly_blows_gate()
{
    self endon( "death" );
    _id_A5A4::_id_2A74();
    self._id_0C72 = "frnd";
    maps\jake_tools::_id_4FA8( 1 );
    self._id_01FF = 1;
    _id_A5A4::_id_7F71( 1 );
    level.peoplespeaking = 1;
    thread maps\jake_tools::_id_2A05( "launchfacility_a_marine1_gate_blow" );
    _id_A5E8::_id_870C( "start_blow_the_gate_mix" );
    var_0 = getent( "node_gate_destroy", "targetname" );
    var_1 = _func_0C3( var_0._id_04A4, "targetname" );
    var_0 _id_A510::_id_0BFF( self, "C4_gate_plant_start" );
    var_2 = getent( "gate_explosives", "targetname" );
    var_0 thread _id_A510::_id_0C24( self, "C4_gate_plant" );
    self waittillmatch( "single anim", "c4plant" );
    self _meth_801D( "weapon_c4", "TAG_INHAND" );
    self waittillmatch( "single anim", "c4swap" );
    self _meth_802A( "weapon_c4", "TAG_INHAND" );
    var_3 = self _meth_8184( "TAG_INHAND" );
    var_4 = self _meth_8185( "TAG_INHAND" );
    var_5 = spawn( "script_model", var_3 );
    var_5 _meth_80B3( "weapon_c4" );
    var_5.angles = var_4;
    thread maps\jake_tools::_id_2A05( "launchfacility_a_marine2_gate_getback" );
    thread c4_detonation_beep();
    maps\jake_tools::_id_7F7F( var_1._id_0351 );
    self _meth_81A9( var_1 );
    self waittill( "goal" );
    wait 0.5;
    maps\jake_tools::_id_744C();
    maps\jake_tools::_id_2A05( "launchfacility_a_marine2_fireinhole" );
    level.peoplespeaking = 0;
    common_scripts\utility::_id_383F( "blow_the_gate" );
    var_5 delete();
    wait 1;
    _id_A5A4::_id_309A();
    wait 6;
    maps\jake_tools::_id_4FA8( 0 );
    self._id_01FF = 0;
}

gate_right_reach_trig_wait()
{
    self endon( "cancel" );
    level endon( "player_in_balcony" );
    var_0 = getent( self._id_7A26, "script_linkname" );
    self waittill( "trigger" );
    level._id_32D5 = var_0;
    level notify( "level_ent_updated" );
}

aa_tarmac_init()
{
    common_scripts\utility::_id_383F( "friendlies_past_killzone" );
    _id_A5E8::_id_870C( "start_tarmac_mix" );
    thread tarmac_colornodes_think();
    common_scripts\utility::_id_0D13( level._id_8AB0, ::tarmac_friendly_engagement_think );
    thread reach_tarmac_halfwaypoint();
    thread tarmac_objectives();
    thread obj_enemy_armor();
    thread dialogue_tarmac_hints();
    thread proceed_to_vents();
}

tarmac_objectives()
{
    _id_A5A8::waittill_vehiclespawn( "bmp_04" );
    level.peoplespeaking = 1;
    level._id_6F7C thread maps\jake_tools::_id_2A05( "launchfacility_a_price_tothetarmac" );
    level.peoplespeaking = 0;
    wait 5;
    level.peoplespeaking = 1;
    level.grigsby maps\jake_tools::_id_2A05( "launchfacility_a_griggs_morebmps" );
    level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_price_knockemout" );
    level.peoplespeaking = 0;
    common_scripts\utility::_id_383F( "obj_enemy_armor_given" );
    common_scripts\utility::_id_3852( "bmp_03_destroyed", "bmp_04_destroyed" );
    common_scripts\utility::_id_383F( "one_bmp_left" );
    common_scripts\utility::_id_3831( "aa_tarmac_bmp01_section" );
    common_scripts\utility::_id_383F( "aa_tarmac_bmp02_section" );
    wait 4;
    common_scripts\utility::_id_383F( "migs_flyby2" );
}

dialogue_tarmac_hints()
{
    common_scripts\utility::_id_384A( "obj_enemy_armor_given" );
    wait 10;

    if ( common_scripts\utility::_id_382E( "one_bmp_left" ) )
        return;

    level.peoplespeaking = 1;
    level.grigsby maps\jake_tools::_id_2A05( "launchfacility_a_griggs_userpghint" );
    level.peoplespeaking = 0;
    wait 10;

    if ( common_scripts\utility::_id_382E( "one_bmp_left" ) )
        return;

    level.peoplespeaking = 1;
    level.grigsby maps\jake_tools::_id_2A05( "launchfacility_a_griggs_vehicles_hint_01" );
    level.peoplespeaking = 0;
    wait 13;
    thread bmp_nags( "obj_enemy_armor_complete", 0, 1 );
}

tarmac_friendly_engagement_think()
{
    self endon( "death" );
}

reach_tarmac_halfwaypoint()
{
    common_scripts\utility::_id_384A( "reach_tarmac_halfwaypoint" );
    common_scripts\utility::_id_383F( "player_near_launchtube_03" );
    wait 2;
    common_scripts\utility::_id_383F( "player_near_launchtube_04" );
    wait 1;
}

ignoreme_thread( var_0 )
{
    self endon( "death" );

    if ( !_func_1A1( self ) )
        return;

    if ( !isdefined( self ) )
        return;

    self._id_01FF = var_0;
}

tarmac_colornodes_think()
{
    thread bmp_03_colornodes();
    thread bmp_04_colornodes();
}

bmp_03_colornodes()
{
    level endon( "obj_enemy_armor_complete" );
    common_scripts\utility::_id_384A( "bmp_03_destroyed" );
    maps\jake_tools::_id_981B( "colornodes_tarmac_front", "script_noteworthy", 0 );
    maps\jake_tools::_id_981B( "colornodes_tarmac_bmp_04_dead", "script_noteworthy", 0 );
    maps\jake_tools::_id_981B( "colornodes_tarmac_bmp_03_dead", "script_noteworthy", 1 );
    var_0 = getentarray( "colornodes_tarmac_bmp_03_dead", "script_noteworthy" );
    var_1 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_0 );
    var_1 notify( "trigger", level._id_0318 );
}

bmp_04_colornodes()
{
    level endon( "obj_enemy_armor_complete" );
    common_scripts\utility::_id_384A( "bmp_04_destroyed" );
    maps\jake_tools::_id_981B( "colornodes_tarmac_rear", "script_noteworthy", 0 );
    maps\jake_tools::_id_981B( "colornodes_tarmac_bmp_03_dead", "script_noteworthy", 0 );
    maps\jake_tools::_id_981B( "colornodes_tarmac_bmp_04_dead", "script_noteworthy", 1 );
    var_0 = getentarray( "colornodes_tarmac_bmp_04_dead", "script_noteworthy" );
    var_1 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_0 );
    var_1 notify( "trigger", level._id_0318 );
}

proceed_to_vents()
{
    common_scripts\utility::_id_384A( "obj_enemy_armor_complete" );
    level._id_6F7C._id_0201 = 1;
    level.grigsby._id_0201 = 1;
    thread aa_vents_init();
    var_0 = _func_0D9( "axis" );
    thread _id_A5A4::_id_08D6( var_0, level.aideletedistance );
    common_scripts\utility::_id_383F( "player_near_launchtube_06" );
    wait 2;
    common_scripts\utility::_id_383F( "player_near_launchtube_05" );
}

aa_vents_init()
{
    _id_A5E8::_id_870C( "start_vents_mix" );
    thread blackhawk_arrive();
    thread vents_objectives();
    thread vents_friendly_movement();
    thread hind_rocket_sequence();
    thread obj_north_tarmac();
    thread obj_rappel();
    thread _id_6BD0();
    thread vent_sequence();
    thread hind_attack();
    thread level_end();
}

vents_objectives()
{
    wait 1;
    common_scripts\utility::_id_383F( "obj_north_tarmac_given" );
    common_scripts\utility::_id_384A( "obj_rappel_given" );
    common_scripts\utility::_id_383F( "obj_north_tarmac_complete" );
}

blackhawk_arrive()
{
    thread blackhawk_think();
    wait 1;
    var_0 = getent( "trigger_blackhawk", "script_noteworthy" );
    var_0 notify( "trigger", level._id_0318 );
    wait 7;
    level.peoplespeaking = 1;
    level _id_A5A4::_id_70BD( "launchfacility_a_friendlies_east" );
    level._id_6F7C maps\jake_tools::_id_2A05( "launchfacility_a_price_copyteamthree" );
    level.peoplespeaking = 0;
    thread vent_dialogue();
}

vent_dialogue()
{
    level waittill( "cutting_vents" );
    level thread _id_A5A4::_id_70C4( "launchfacility_a_gm3_cutvents" );
    level thread _id_A5A4::_id_70C4( "launchfacility_a_gm1_cutting" );
}

blackhawk_think()
{
    var_0 = _id_A5A8::waittill_vehiclespawn( "blackhawk" );
    var_1 = var_0._id_750A;
    common_scripts\utility::_id_0D13( var_1, ::ai_friendly_reinforcements_think, var_0 );
    common_scripts\utility::_id_0D13( var_1, ::attach_saw, "chopperTeam" );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_7E60, 1 );
    var_0 waittill( "unloading" );
    common_scripts\utility::_id_383F( "blackhawk_dudes_unloaded" );
    wait 11;
    var_2 = common_scripts\utility::_id_40FB( "blackhawk_depart_path", "script_noteworthy" );
    var_0 _id_A5A4::_id_9CB3();
    var_0 thread _id_A5A4::_id_9CBF( var_2, 0 );
}

ai_friendly_reinforcements_think( var_0 )
{
    self endon( "death" );
    self._id_01FF = 1;
    wait 0.5;

    if ( isdefined( self._id_0398 ) && self._id_0398 == "pilot" )
    {
        if ( isdefined( self._id_58D7 ) )
            _id_A5A4::_id_8EA4();
    }

    var_0 waittill( "unloading" );
}

vents_friendly_movement()
{
    disable_color_trigs();
    maps\jake_tools::_id_981B( "colornodes_vents", "script_noteworthy", 1 );
    var_0 = getent( "colornodes_vents", "script_noteworthy" );
    var_0 notify( "trigger", level._id_0318 );
    thread team02_rappel();
    thread team03_rappel();
    common_scripts\utility::_id_384A( "team01_hooked_up" );
    level._id_6F7C thread maps\jake_tools::_id_2A05( "launchfacility_a_price_ropesout_01" );
    common_scripts\utility::_id_383F( "obj_rappel_given" );
    thread vent_nag();
    wait 2;
    common_scripts\utility::_id_383F( "hinds_appear" );
}

vent_explode( var_0 )
{
    var_1 = getent( "exploder_sound_" + var_0, "targetname" );
    thread common_scripts\utility::_id_69C2( "detpack_explo_metal", var_1._id_02E2 );
    common_scripts\_exploder::_id_3528( var_0 );
}

vent_sequence()
{
    if ( getdvarint( "use_old_ventsequence" ) == 1 )
    {
        vent_sequence_preh1();
        return;
    }

    level.team01_sawguysfinished = 0;
    level.team01_sawguysinposition = 0;
    level.team01_ventopen = 0;
    var_0 = getent( "vent_team_01", "targetname" );
    var_1 = getentarray( "node_rappel_team_1", "targetname" );
    var_2 = getentarray( "node_saw_team_1", "targetname" );
    level.team01 = [];
    level.team01[0] = level._id_6F7C;
    level.team01[1] = level.grigsby;
    var_3 = _func_0D9( "allies" );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( _id_A5A4::_id_503B( level.team01, var_3[var_5] ) )
            continue;

        if ( _id_A5A4::_id_503B( level.team02, var_3[var_5] ) )
            continue;

        if ( _id_A5A4::_id_503B( level.team03, var_3[var_5] ) )
            continue;

        var_4[var_4.size] = var_3[var_5];
    }

    level.team01[2] = common_scripts\utility::_id_3F33( var_0._id_02E2, var_4 );
    level.team01[0].rappelnode = var_2[0];
    level.team01[1].rappelnode = var_2[1];
    level.team01[2].rappelnode = var_1[0];
    var_6 = getent( "vent_02", "targetname" );
    var_6 thread vent_drop();
    common_scripts\utility::_id_0D13( level.team01, ::friendly_vent_think, level.team01, "01", var_6, "01" );
    level.team02_sawguysfinished = 0;
    level.team02_sawguysinposition = 0;
    level.team02_ventopen = 0;
    var_7 = getent( "vent_team_02", "targetname" );
    var_8 = getentarray( "node_rappel_team_2", "targetname" );
    var_9 = getentarray( "node_saw_team_2", "targetname" );
    level.team03_sawguysfinished = 0;
    level.team03_sawguysinposition = 0;
    level.team03_ventopen = 0;
    var_10 = getent( "vent_team_03", "targetname" );
    var_11 = getentarray( "node_rappel_team_3", "targetname" );
    var_12 = getentarray( "node_saw_team_3", "targetname" );
    level.team02 = _id_A5A4::_id_0CFD( level.team02 );
    level.team02 = common_scripts\utility::_id_3CCB( var_7._id_02E2, level.team02, undefined, level.team02.size );
    common_scripts\utility::_id_384A( "blackhawk_dudes_unloaded" );
    level.team03 = _id_A5A4::_id_0CFD( level.team03 );
    level.team03 = common_scripts\utility::_id_3CCB( var_10._id_02E2, level.team03, undefined, level.team03.size );
    level.team03[2].rappelnode = var_9[0];
    level.team03[3].rappelnode = var_9[1];
    level.team02[2].rappelnode = var_8[0];
    var_13 = getent( "vent_03", "targetname" );
    var_13 thread vent_drop();
    level.team03[0].rappelnode = var_12[0];
    level.team03[1].rappelnode = var_12[1];
    level.team02[0].rappelnode = var_11[0];
    level.team02[1].rappelnode = var_11[1];
    var_14 = getent( "vent_01", "targetname" );
    var_14 thread vent_drop();
    level.team03[0] thread friendly_vent_think( level.team03, "03", var_14, "03" );
    level.team03[1] thread friendly_vent_think( level.team03, "03", var_14, "03" );
    level.team02[0] thread friendly_vent_think( level.team02, "02", var_14, "03" );
    level.team02[1] thread friendly_vent_think( level.team02, "02", var_14, "03" );
    level.team03[2] thread friendly_vent_think( level.team03, "03", var_13, "02" );
    level.team03[3] thread friendly_vent_think( level.team03, "03", var_13, "02" );
    level.team02[2] thread friendly_vent_think( level.team02, "02", var_13, "02" );
}

vent_sequence_preh1()
{
    level.team01_sawguysfinished = 0;
    level.team01_sawguysinposition = 0;
    level.team01_ventopen = 0;
    var_0 = getent( "vent_team_01", "targetname" );
    var_1 = getentarray( "node_rappel_team_1", "targetname" );
    var_2 = getentarray( "node_saw_team_1", "targetname" );
    level.team01 = [];
    level.team01[0] = level._id_6F7C;
    level.team01[1] = level.grigsby;
    var_3 = _func_0D9( "allies" );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( _id_A5A4::_id_503B( level.team01, var_3[var_5] ) )
            continue;

        if ( _id_A5A4::_id_503B( level.team02, var_3[var_5] ) )
            continue;

        if ( _id_A5A4::_id_503B( level.team03, var_3[var_5] ) )
            continue;

        var_4[var_4.size] = var_3[var_5];
    }

    level.team01[2] = common_scripts\utility::_id_3F33( var_0._id_02E2, var_4 );
    level.team01 = common_scripts\utility::_id_3CCB( var_0._id_02E2, level.team01, undefined, level.team01.size );
    level.team01[0].rappelnode = var_2[0];
    level.team01[1].rappelnode = var_2[1];
    level.team01[2].rappelnode = var_1[0];
    var_6 = getent( "vent_02", "targetname" );
    var_6 thread vent_drop();
    common_scripts\utility::_id_0D13( level.team01, ::friendly_vent_think_preh1, level.team01, "01", var_6 );
    level.team02_sawguysfinished = 0;
    level.team02_sawguysinposition = 0;
    level.team02_ventopen = 0;
    var_0 = getent( "vent_team_02", "targetname" );
    var_7 = getentarray( "node_rappel_team_2", "targetname" );
    var_8 = getentarray( "node_saw_team_2", "targetname" );
    level.team02 = _id_A5A4::_id_0CFD( level.team02 );
    level.team02 = common_scripts\utility::_id_3CCB( var_0._id_02E2, level.team02, undefined, level.team02.size );
    level.team02[0].rappelnode = var_8[0];
    level.team02[1].rappelnode = var_8[1];
    level.team02[2].rappelnode = var_7[0];
    var_6 = getent( "vent_03", "targetname" );
    var_6 thread vent_drop();
    common_scripts\utility::_id_0D13( level.team02, ::friendly_vent_think_preh1, level.team02, "02", var_6 );
    level.team03_sawguysfinished = 0;
    level.team03_sawguysinposition = 0;
    level.team03_ventopen = 0;
    var_0 = getent( "vent_team_03", "targetname" );
    var_9 = getentarray( "node_rappel_team_3", "targetname" );
    var_10 = getentarray( "node_saw_team_3", "targetname" );
    common_scripts\utility::_id_384A( "blackhawk_dudes_unloaded" );
    level.team03 = _id_A5A4::_id_0CFD( level.team03 );
    level.team03 = common_scripts\utility::_id_3CCB( var_0._id_02E2, level.team03, undefined, level.team03.size );
    level.team03[0].rappelnode = var_10[0];
    level.team03[1].rappelnode = var_10[1];
    level.team03[2].rappelnode = var_9[0];
    level.team03[3].rappelnode = var_9[1];
    var_6 = getent( "vent_01", "targetname" );
    var_6 thread vent_drop();
    common_scripts\utility::_id_0D13( level.team03, ::friendly_vent_think_preh1, level.team03, "03", var_6 );
}

saw_notify_start( var_0 )
{
    var_0 notify( "start_sparks" );
}

saw_notify_stop( var_0 )
{
    var_0 notify( "stop" );
}

saw_notify_switch( var_0 )
{
    var_0 notify( "switch" );
}

saw_notify_pickup( var_0 )
{
    var_0 notify( "saw_pickup" );
}

saw_sound_and_fx( var_0, var_1, var_2 )
{
    self waittill( "saw_pickup" );
    self notify( "delete_saw" );
    self _meth_801D( "weapon_saw_rescue", "TAG_INHAND" );
    var_3 = self.rappelnode._id_7A99;
    var_4 = "saw_" + var_3 + "_object";
    self _meth_814E( _id_A5A4::_id_3EF6( var_4, "frnd" ), 1 );

    if ( var_0 == "1" )
        thread _id_A5A4::_id_69C4( level._id_78BA["launch_chopsaw1"] );
    else
        thread _id_A5A4::_id_69C4( level._id_78BA["launch_chopsaw2"] );

    self waittill( "start_sparks" );
    thread saw_sparks();
    self waittill( "stop" );
    self notify( "stop_sparks" );
    var_1 notify( "rapeller_ready" );
    self waittill( "start_sparks" );
    thread saw_sparks();
    self waittill( "stop" );
    self notify( "stop_sparks" );

    if ( isdefined( var_2 ) && var_2 == 1 )
        var_1 notify( "vent_drop" );

    self waittill( "switch" );
    var_5 = self _meth_8184( "TAG_INHAND" );
    var_6 = self _meth_8185( "TAG_INHAND" );
    self _meth_802A( "weapon_saw_rescue", "TAG_INHAND" );
    var_7 = spawn( "script_model", var_5 );
    var_7 _meth_80B3( "weapon_saw_rescue" );
    var_7.angles = var_6;
}

vent_drop()
{
    var_0 = spawn( "script_origin", self._id_02E2 + ( 0, 0, -350 ) );
    self waittill( "vent_drop" );
    _id_A5A4::_id_32DE( "vent_dropping" );
    thread common_scripts\utility::_id_69C2( "launch_grate_falling", var_0._id_02E2 );
    var_1 = 2.5;
    var_2 = self.angles + ( 0, 0, 25 );
    self _meth_82AD( -1000, var_1, var_1 / 3 );
    self _meth_82B1( var_2, 1, 0.2 );
    wait(var_1);
    self _meth_8056();
}

saw_sparks()
{
    self endon( "stop_sparks" );

    for (;;)
    {
        playfxontag( common_scripts\utility::_id_3FA8( "saw_sparks" ), self, "TAG_SPARKS" );
        wait 0.1;
    }
}

friendly_vent_think( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    if ( !isdefined( self.rappelnode ) )
        return;

    self.issawdude = 0;
    var_4 = undefined;
    self _meth_81A7( 1 );
    self.hookedup = 0;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = _id_A5A4::_id_88D1( "rope" );
    self.rappelnode thread _id_A510::_id_0BC7( var_7, "rappel_setup_start" );
    var_7 _meth_8056();

    switch ( var_3 )
    {
        case "01":
            if ( self != level._id_6F7C && self != level.grigsby )
                level.othersquadfriendly = self;

            var_5 = "team01_hooked_up";
            var_6 = "vent02_open";

            if ( !var_2 _id_A5A4::_id_32DC( "vent_dropping" ) )
                var_2 _id_A5A4::_id_32DD( "vent_dropping" );

            break;
        case "02":
            var_5 = "team02_hooked_up";
            var_6 = "vent03_open";

            if ( !var_2 _id_A5A4::_id_32DC( "vent_dropping" ) )
                var_2 _id_A5A4::_id_32DD( "vent_dropping" );

            break;
        case "03":
            var_5 = "team03_hooked_up";
            var_6 = "vent01_open";

            if ( !var_2 _id_A5A4::_id_32DC( "vent_dropping" ) )
                var_2 _id_A5A4::_id_32DD( "vent_dropping" );

            break;
    }

    if ( _func_120( self.rappelnode._id_04A6, "node_saw_team" ) )
    {
        self.issawdude = 1;
        var_8 = self.rappelnode._id_7A99;
        _id_A5A4::_id_2A74();
        var_9 = _func_0C3( "team_" + var_1 + "_saw_start_node_" + var_8, "targetname" );

        if ( var_1 == "01" )
        {
            get_to_node_no_matter_what( var_9, 30 );
            wait 2;
        }
        else
        {
            self _meth_81A9( var_9 );
            self waittill( "goal" );
        }

        switch ( var_1 )
        {
            case "01":
                if ( level.team01_sawguysinposition == 0 )
                    var_4 = 0;
                else
                    var_4 = 1;

                level.team01_sawguysinposition++;

                while ( level.team01_sawguysinposition != 2 )
                    wait 0.05;

                break;
            case "02":
                if ( level.team02_sawguysinposition == 0 )
                    var_4 = 0;
                else
                    var_4 = 1;

                level.team02_sawguysinposition++;

                while ( level.team02_sawguysinposition != 2 )
                    wait 0.05;

                break;
            case "03":
                if ( level.team03_sawguysinposition == 0 )
                    var_4 = 0;
                else
                    var_4 = 1;

                level.team03_sawguysinposition++;

                while ( level.team03_sawguysinposition != 4 )
                    wait 0.05;

                break;
        }

        wait(_func_0B5( 0.5, 0.75 ));
        self._id_2AF3 = 1;
        self.rappelnode _id_A510::_id_0BFF( self, "saw_" + var_8 + "_start" );
        level notify( "cutting_vents" );
        thread saw_sound_and_fx( var_8, var_2, var_4 );
        self.rappelnode _id_A510::_id_0C24( self, "saw_" + var_8 );

        if ( self.issawdude == 1 )
            self _meth_81AA( self._id_02E2 );

        thread vent_flag( var_3, var_6 );
    }

    if ( self.issawdude == 0 )
        var_2 waittill( "rapeller_ready" );

    var_10 = undefined;
    var_11 = undefined;

    if ( isdefined( self.rappelnode ) && isdefined( self.rappelnode._id_0398 ) && self.rappelnode._id_0398 == "rappel_variation_1" )
    {
        var_10 = "rappel_setup_to_stand_1";
        var_11 = "rappel_stand_idle_1";
    }
    else if ( isdefined( self.rappelnode ) && isdefined( self.rappelnode._id_0398 ) && self.rappelnode._id_0398 == "rappel_variation_2" )
    {
        var_10 = "rappel_setup_to_stand_2";
        var_11 = "rappel_stand_idle_2";
    }
    else
    {
        var_10 = "rappel_setup_to_stand_2";
        var_11 = "rappel_stand_idle_3";
    }

    _id_A5A4::_id_2A74();

    if ( self.issawdude == 0 )
        self.rappelnode _id_A510::_id_0BFF( self, var_10 );

    if ( self.issawdude == 0 && !var_2 _id_A5A4::_id_32D8( "vent_dropping" ) )
    {
        thread _id_A510::orient_to_entity_until_flags( var_2, _id_A5A4::_id_590F( var_6 ) );
        var_2 _id_A5A4::_id_32E0( "vent_dropping" );
        wait 0.5;
    }

    var_7 _meth_8055();
    self.rappelnode thread _id_A510::_id_0C24( var_7, var_10 );
    self.rappelnode _id_A510::_id_0C24( self, var_10 );
    self.rappelnode thread _id_A510::_id_0BE1( self, var_11, undefined, "stop_idle" );
    self.rappelnode thread _id_A510::_id_0BE1( var_7, var_11, undefined, "stop_idle" );
    self.hookedup = 1;
    var_12 = 1;

    for ( var_13 = 0; var_13 < var_0.size; var_13++ )
    {
        if ( !isdefined( var_0[var_13].hookedup ) )
            continue;

        if ( var_0[var_13].hookedup == 0 )
            var_12 = 0;
    }

    if ( var_12 )
        common_scripts\utility::_id_383F( var_5 );

    if ( self == level._id_6F7C || self == level.grigsby )
        self waittill( "rappel_down_vent" );
    else
        wait(_func_0B5( 1, 3 ));

    self.rappelnode notify( "stop_idle" );
    self.rappelnode thread _id_A510::_id_0C24( var_7, "rappel_drop" );
    self.rappelnode _id_A510::_id_0C24( self, "rappel_drop" );

    if ( isdefined( self._id_58D7 ) )
        _id_A5A4::_id_8EA4();

    self delete();
}

friendly_vent_think_preh1( var_0, var_1, var_2 )
{
    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    if ( !isdefined( self.rappelnode ) )
        return;

    self.issawdude = 0;
    var_3 = undefined;
    self _meth_81A7( 1 );
    self.hookedup = 0;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = _id_A5A4::_id_88D1( "rope" );
    self.rappelnode thread _id_A510::_id_0BC7( var_6, "rappel_setup_start" );
    var_6 _meth_8056();

    switch ( var_1 )
    {
        case "01":
            if ( self != level._id_6F7C && self != level.grigsby )
                level.othersquadfriendly = self;

            var_4 = "team01_hooked_up";
            var_5 = "vent02_open";
            break;
        case "02":
            var_4 = "team02_hooked_up";
            var_5 = "vent03_open";
            break;
        case "03":
            var_4 = "team03_hooked_up";
            var_5 = "vent01_open";
            break;
    }

    if ( _func_120( self.rappelnode._id_04A6, "node_saw_team" ) )
    {
        self.issawdude = 1;
        var_7 = self.rappelnode._id_7A99;
        _id_A5A4::_id_2A74();
        var_8 = _func_0C3( "team_" + var_1 + "_saw_start_node_" + var_7, "targetname" );

        if ( var_1 == "01" )
            get_to_node_no_matter_what( var_8, 30 );
        else
        {
            self _meth_81A9( var_8 );
            self waittill( "goal" );
        }

        switch ( var_1 )
        {
            case "01":
                if ( level.team01_sawguysinposition == 0 )
                    var_3 = 0;
                else
                    var_3 = 1;

                level.team01_sawguysinposition++;

                while ( level.team01_sawguysinposition != 2 )
                    wait 0.05;

                break;
            case "02":
                if ( level.team02_sawguysinposition == 0 )
                    var_3 = 0;
                else
                    var_3 = 1;

                level.team02_sawguysinposition++;

                while ( level.team02_sawguysinposition != 2 )
                    wait 0.05;

                break;
            case "03":
                if ( level.team03_sawguysinposition == 0 )
                    var_3 = 0;
                else
                    var_3 = 1;

                level.team03_sawguysinposition++;

                while ( level.team03_sawguysinposition != 2 )
                    wait 0.05;

                break;
        }

        wait(_func_0B5( 0.5, 0.75 ));
        self._id_2AF3 = 1;
        self.rappelnode _id_A510::_id_0BFF( self, "saw_" + var_7 + "_start" );
        level notify( "cutting_vents" );
        thread saw_sound_and_fx( var_7, var_2, var_3 );
        self.rappelnode _id_A510::_id_0C24( self, "saw_" + var_7 );

        if ( self.issawdude == 1 )
            self _meth_81AA( self._id_02E2 );

        thread vent_flag( var_1, var_5 );
    }

    if ( self.issawdude == 0 )
        common_scripts\utility::_id_384A( var_5 );

    var_9 = undefined;
    var_10 = undefined;

    if ( isdefined( self.rappelnode ) && isdefined( self.rappelnode._id_0398 ) && self.rappelnode._id_0398 == "rappel_variation_1" )
    {
        var_9 = "rappel_setup_to_stand_1";
        var_10 = "rappel_stand_idle_1";
    }
    else if ( isdefined( self.rappelnode ) && isdefined( self.rappelnode._id_0398 ) && self.rappelnode._id_0398 == "rappel_variation_2" )
    {
        var_9 = "rappel_setup_to_stand_2";
        var_10 = "rappel_stand_idle_2";
    }
    else
    {
        var_9 = "rappel_setup_to_stand_2";
        var_10 = "rappel_stand_idle_3";
    }

    _id_A5A4::_id_2A74();

    if ( self.issawdude == 0 )
        self.rappelnode _id_A510::_id_0BFF( self, var_9 );

    var_6 _meth_8055();
    self.rappelnode thread _id_A510::_id_0C24( var_6, var_9 );
    self.rappelnode _id_A510::_id_0C24( self, var_9 );
    self.rappelnode thread _id_A510::_id_0BE1( self, var_10, undefined, "stop_idle" );
    self.rappelnode thread _id_A510::_id_0BE1( var_6, var_10, undefined, "stop_idle" );
    self.hookedup = 1;
    var_11 = 1;

    for ( var_12 = 0; var_12 < var_0.size; var_12++ )
    {
        if ( !isdefined( var_0[var_12].hookedup ) )
            continue;

        if ( var_0[var_12].hookedup == 0 )
            var_11 = 0;
    }

    if ( var_11 )
        common_scripts\utility::_id_383F( var_4 );

    if ( self == level._id_6F7C || self == level.grigsby )
        self waittill( "rappel_down_vent" );
    else
        wait(_func_0B5( 1, 3 ));

    self.rappelnode notify( "stop_idle" );
    self.rappelnode thread _id_A510::_id_0C24( var_6, "rappel_drop" );
    self.rappelnode _id_A510::_id_0C24( self, "rappel_drop" );

    if ( isdefined( self._id_58D7 ) )
        _id_A5A4::_id_8EA4();

    self delete();
}

get_to_node_no_matter_what( var_0, var_1 )
{
    thread teleport_or_timeout( var_0, var_1 );
    self _meth_81A9( var_0 );
    self waittill( "goal" );
    self.madeittogoal = 1;
}

teleport_or_timeout( var_0, var_1 )
{
    wait 5;
    self endon( "goal" );
    common_scripts\utility::_id_A0A0( "bad_path", var_1 );
    thread teleport_behind_player_back( var_0 );
}

teleport_behind_player_back( var_0 )
{
    while ( !isdefined( self.madeittogoal ) )
    {
        wait 0.05;
        var_1 = level._id_0318 _meth_80AA();
        var_2 = common_scripts\utility::_id_A347( var_1, level._id_0318 _meth_8338(), var_0._id_02E2, level._id_2235["45"] );

        if ( !var_2 && !isdefined( self.madeittogoal ) )
        {
            self _meth_81CA( var_0._id_02E2, var_0.angles );
            break;
        }
    }
}

rope_anim( var_0, var_1, var_2, var_3 )
{
    var_0 _id_A510::_id_0C24( var_1, var_2 );
    var_0 thread _id_A510::_id_0BE1( var_1, var_3, undefined, "stop_idle" );
}

vent_flag( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "01":
            level.team01_sawguysfinished++;

            while ( level.team01_sawguysfinished != 2 )
                wait 0.05;

            break;
        case "02":
            level.team02_sawguysfinished++;

            while ( level.team02_sawguysfinished != 2 )
                wait 0.05;

            break;
        case "03":
            level.team03_sawguysfinished++;

            while ( level.team03_sawguysfinished != 2 )
                wait 0.05;

            break;
    }

    if ( !common_scripts\utility::_id_382E( var_1 ) )
        common_scripts\utility::_id_383F( var_1 );
}

team03_rappel()
{
    common_scripts\utility::_id_384A( "team03_hooked_up" );
    level thread _id_A5A4::_id_70C4( "launchfacility_a_gm3_rapellingnow" );
    wait 3;
    level thread _id_A5A4::_id_70C4( "launchfacility_a_marine3_teamin" );
}

team02_rappel()
{
    common_scripts\utility::_id_384A( "team02_hooked_up" );
    level thread _id_A5A4::_id_70C4( "launchfacility_a_marine2_rappelling" );
}

trigger_monitor_player_lean()
{
    self endon( "stop_monitor_lean" );

    for (;;)
    {
        if ( level._id_0318 _meth_8462() )
            common_scripts\utility::_id_97CC();
        else
            common_scripts\utility::_id_97CE();

        waittillframeend;
    }
}

_id_6BD0()
{
    var_0 = _func_0C3( "player_rappel_node", "targetname" );
    var_1 = _id_A5A4::_id_88D1( "player_rope" );
    var_1 _meth_8056();
    common_scripts\utility::_id_384A( "obj_rappel_given" );
    var_2 = getent( "obj_rappel", "targetname" );
    var_3 = spawn( "script_model", var_2._id_02E2 );
    var_3 _meth_80B3( "rope_coil" );
    var_3.angles = var_2.angles;
    var_4 = spawn( "script_model", var_2._id_02E2 );
    var_4 _meth_80B3( "rope_coil_obj" );
    var_4.angles = var_2.angles;
    var_5 = getent( "trig_rappel", "targetname" );
    var_5 _meth_80DD( &"SCRIPT_PLATFORM_HINTSTR_RAPPEL" );
    var_5 thread trigger_monitor_player_lean();

    for (;;)
    {
        var_5 waittill( "trigger" );
        waittillframeend;

        if ( !level._id_0318 _meth_8462() )
        {
            var_5 notify( "stop_monitor_lean" );
            break;
        }
    }

    level._id_0318 _meth_809C( "rappel_clipout_plr" );
    thread rappel_rumble();
    _id_A5E8::_id_870C( "start_rappel_mix" );
    var_5 common_scripts\utility::_id_97CC();
    var_4 delete();
    common_scripts\utility::_id_383F( "obj_rappel_complete" );
    level._id_0318 _meth_80F1();
    level._id_0318 _meth_831A();
    _id_A5A4::enable_scuff_footsteps_sound( 0 );
    level._id_0318 _meth_811D( 0 );
    thread player_squad_rappel();
    var_6 = _id_A5A4::_id_88D1( "player_rappel" );
    var_6 _meth_8056();
    var_0 _id_A510::_id_0BC7( var_6, "rappel" );
    var_6 _id_A5A4::_id_5696( "tag_player", 0.5, 0.9, 35, 35, 45, 0 );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_807F( var_6, "tag_player", 0.9, 5, 5, 45, 0 );
    level._id_0318 common_scripts\utility::_id_27CD( 3.25, ::_meth_80A4, 0.25, 0, 0, 5, 5, 45, 35 );
    var_6 _meth_8055();
    var_1 _meth_8055();
    var_0 thread _id_A510::_id_0C24( var_6, "rappel" );
    var_0 notify( "stop_idle" );
    var_0 thread _id_A510::_id_0C24( var_1, "rappel_for_player" );
}

rappel_rumble()
{
    var_0 = [];
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 0.23, "generic_attack_light_500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 1.05, "generic_attack_light_2000" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 2.37, "generic_attack_light_1500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 3.46, "generic_attack_light_1500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 4.48, "generic_attack_light_1500" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 5.54, "generic_attack_light_2000" );
    var_0 = _id_A5A4::rumble_sequence_add_key( var_0, 7.28, "generic_attack_light_1000" );
    level._id_0318 thread _id_A5A4::rumble_sequence_play( var_0 );
}

player_squad_rappel()
{
    wait 1.2;
    level._id_6F7C notify( "rappel_down_vent" );
    wait 1;
    level.grigsby notify( "rappel_down_vent" );
    common_scripts\utility::_id_383F( "rappel_down_vent_started" );
    wait 2;
    level thread _id_A5A4::_id_70BD( "launchfacility_a_price_inside_facility" );
    wait 0.75;
    wait 0.25;
    common_scripts\utility::_id_383F( "level_fade_out" );
}

hind_attack()
{
    common_scripts\utility::_id_384A( "hinds_appear" );
    var_0 = getentarray( "hind_attack_point_higher", "script_noteworthy" );
    var_1 = getentarray( "hind_attack_point_lower", "script_noteworthy" );
    wait 1.5;
    thread hind_attack_think( var_0, "hind_end_higher" );
    thread hind_attack_think( var_1, "hind_end_lower" );
    thread hind_sequence();
}

hind_sequence()
{
    thread _id_A5A4::_id_1143( "hinds_closing" );

    if ( !common_scripts\utility::_id_382E( "obj_rappel_complete" ) )
    {
        level.peoplespeaking = 1;
        level _id_A5A4::_id_70C4( "launchfacility_a_recon_two_helis" );
        level.peoplespeaking = 0;
        wait 4.6;
        common_scripts\utility::_id_383F( "hind_rocket_sequence" );
    }
}

hind_rocket_sequence()
{
    level endon( "obj_rappel_complete" );
    common_scripts\utility::_id_384A( "hind_rocket_sequence" );
    var_0 = getent( "rocket_target", "targetname" );
    var_1 = getent( "rocket_damage", "targetname" );
    var_1 thread hind_tree_explosion();
    var_1 thread hind_tree_fx( var_0 );
    level.hindattacker _meth_8261( var_0 );
    var_2 = maps\jake_tools::_id_3CF2();

    if ( isdefined( var_2 ) )
        var_2 maps\jake_tools::_id_2A05( "launchfacility_a_gm1_incoming" );

    wait 0.5;
    level.hindattacker _id_A53F::_id_37BA( "ffar_hind_nodamage", 2, var_0, 0.75 );
    wait 0.5;
    level.hindattacker _meth_8262();
    wait 3;
    common_scripts\utility::_id_383F( "hind_missiles_fired" );
}

hind_tree_explosion()
{
    level endon( "hind_missiles_fired" );
    var_0 = getent( "rocket_target", "targetname" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( _func_1AD( var_2 ) )
            continue;

        var_3 = _func_0B4( 1, 4 );
        thread common_scripts\utility::_id_69C2( "launch_rocket_hit_treeline", var_0._id_02E2 );
        _func_18C( 0.8, 2, var_0._id_02E2, 2000 );
        var_4 = _func_0B5( 0, 150 );
        playfx( common_scripts\utility::_id_3FA8( "hind_explosion" ), var_0._id_02E2 + ( var_4, 0, 0 ) );
    }
}

hind_tree_fx( var_0 )
{
    self waittill( "damage", var_1, var_2 );

    if ( _func_1AD( var_2 ) )
        return;

    thread hind_trees_fall();
    var_3 = getentarray( "tree_fire", "targetname" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        playfx( level._id_058F["tree_fire_fx"][var_4], var_3[var_4]._id_02E2 );

    var_0 thread common_scripts\utility::_id_697A( "medfire" );
}

hind_trees_fall()
{
    var_0 = getentarray( "trees_end", "script_noteworthy" );
    var_1 = 18;
    var_2 = 35;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = _func_0B5( 0.5, 1.5 );
        var_5 = var_0[var_3].angles;
        var_5 += ( _func_0B5( var_1, var_2 ), _func_0B5( var_1, var_2 ), _func_0B5( var_1, var_2 ) );
        var_0[var_3] thread hind_tree_rotate( var_5, var_4 );
    }
}

hind_tree_rotate( var_0, var_1 )
{
    self _meth_82B1( var_0, var_1, var_1 / 2, var_1 / 2 );
}

hind_go_to_vent()
{
    if ( !isdefined( self ) )
        return;

    common_scripts\utility::_id_384A( "obj_rappel_complete" );
    var_0 = getent( "hind_above_vent", "targetname" );
    self _meth_8262();
    self _meth_827F( 200, 15, 15 );
    self _meth_8257( var_0._id_02E2, 1 );
}

hind_attack_think( var_0, var_1 )
{
    level endon( "obj_rappel_complete" );
    var_2 = _id_A5A8::_id_8978( var_1 );
    var_2 _meth_8287();
    var_3 = spawn( "script_origin", var_2._id_02E2 );
    var_3 _meth_804F( var_2 );
    var_3 _meth_8077( "launch_a_vent_hind_low_engine" );

    if ( isdefined( var_2._id_0398 ) && var_2._id_0398 == "hind_rocket_attacker" )
        level.hindattacker = var_2;

    var_2 endon( "death" );

    if ( var_1 == "hind_end_lower" )
        var_2 thread hind_go_to_vent();

    var_4 = getent( var_2._id_04A4, "targetname" );
    var_2 _meth_827F( 120, 15, 15 );
    var_2 _meth_8256( 500 );
    var_5 = getent( var_4._id_04A4, "targetname" );
    var_2 _meth_8257( var_5._id_02E2, 0 );
    var_2 waittill( "near_goal" );
    var_2 _id_A5A4::_id_9CB3();
    var_2 thread hind_guns_think();
    var_6 = getent( var_5._id_7A26, "script_linkname" );
    var_2 _meth_8257( var_6._id_02E2, 1 );
    var_2 waittill( "near_goal" );
    var_3 _meth_80AD( "launch_a_vent_hind_low_engine" );
    var_2 _meth_8261( level._id_0318 );
    var_2 _meth_827F( 30, 15, 15 );
    var_5 = var_6;
    var_7 = 0;

    for (;;)
    {
        var_7 = 0;

        if ( isdefined( var_5._id_7A26 ) )
        {
            var_8 = _func_122( var_5._id_04A6, 7 );
            var_9 = getent( "strafe_volume_" + var_8, "targetname" );

            if ( level._id_0318 _meth_80AB( var_9 ) )
            {
                var_5 = getent( var_5._id_7A26, "script_linkname" );
                var_2 _meth_8262();
                var_2 _meth_827F( 200, 15, 15 );
                var_7 = 1;
            }
        }

        if ( var_7 == 0 )
        {
            var_5 = getent( var_5._id_04A4, "targetname" );
            var_2 _meth_8261( level._id_0318 );
            var_2 _meth_827F( 30, 15, 15 );
        }

        var_2 _meth_8257( var_5._id_02E2, 0 );
        var_2 waittill( "near_goal" );
    }
}

hind_guns_think()
{
    level endon( "obj_rappel_complete" );
    self endon( "death" );
    common_scripts\utility::_id_384A( "hind_missiles_fired" );

    for (;;)
    {
        wait(_func_0B5( 2, 5 ));
        thread firemg( _func_0B4( 8, 17 ) );
        wait(_func_0B5( 2, 5 ));
    }
}

level_end()
{
    common_scripts\utility::_id_384A( "level_fade_out" );
    _id_A552::_id_781E( "launchfacility_a" );
    _id_A5A4::_id_60D6();
}

vent_nag()
{
    level endon( "obj_rappel_complete" );
    wait 6.5;
    thread vent_nag_cleanup();

    if ( !common_scripts\utility::_id_382E( "obj_rappel_complete" ) )
        thread _id_A5A4::_id_48B0( &"LAUNCHFACILITY_A_HINTSTR_RAPPEL_DOWN_SHAFT", 9999 );

    while ( !common_scripts\utility::_id_382E( "obj_rappel_complete" ) )
    {
        wait(_func_0B5( 6, 10 ));
        level.launchfacility_a_price_ropenag_number++;

        if ( level.launchfacility_a_price_ropenag_number > level.launchfacility_a_price_ropenag_max )
            level.launchfacility_a_price_ropenag_number = 1;

        var_0 = "launchfacility_a_price_ropenag_0" + level.launchfacility_a_price_ropenag_number;
        level._id_6F7C maps\jake_tools::_id_2A05( var_0 );
    }
}

vent_nag_cleanup()
{
    common_scripts\utility::_id_384A( "obj_rappel_complete" );
    thread _id_A5A4::_id_48CB();
}

friendly_breach_vent( var_0, var_1 )
{
    self endon( "death" );
    _id_A5A4::_id_2A74();
    var_2 = getent( "node_scripted_vent_" + var_0, "script_noteworthy" );
    var_2 _id_A510::_id_0BFF( self, "C4_plant_start" );
    var_2 _id_A510::_id_0C24( self, "C4_plant" );
    _id_A5A4::_id_309A();
    wait 3;

    switch ( var_0 )
    {
        case "01":
            thread vent_explode( 600 );
            break;
        case "02":
            thread vent_explode( 700 );
            break;
        case "03":
            thread vent_explode( 800 );
            break;
    }

    common_scripts\utility::_id_383F( var_1 );
}

aa_utility()
{

}

initdifficulty()
{
    var_0 = _id_A5A4::_id_3F58();
    level.skill = undefined;

    switch ( var_0 )
    {
        case "gimp":
        case "easy":
            level.skill = "easy";
            break;
        case "medium":
            level.skill = "medium";
            break;
        case "hard":
        case "difficult":
            level.skill = "hard";
            break;
        case "fu":
            level.skill = "veteran";
            break;
    }

    var_1 = getentarray( "gameskill_easy", "script_noteworthy" );
    var_2 = getentarray( "gameskill_medium", "script_noteworthy" );

    switch ( level.skill )
    {
        case "medium":
            common_scripts\utility::_id_0D13( var_1, ::deleteweapons );
            break;
        case "hard":
        case "veteran":
            common_scripts\utility::_id_0D13( var_1, ::deleteweapons );
            common_scripts\utility::_id_0D13( var_2, ::deleteweapons );
            break;
    }
}

bmp_nags( var_0, var_1, var_2 )
{
    level endon( var_0 );

    while ( !common_scripts\utility::_id_382E( var_0 ) )
    {
        level.launchfacility_a_price_bmp_nag_number++;

        if ( level.launchfacility_a_price_bmp_nag_number > level.launchfacility_a_price_bmp_nag_max )
            level.launchfacility_a_price_bmp_nag_number = 1;

        var_3 = "launchfacility_a_price_bmp_nag_0" + level.launchfacility_a_price_bmp_nag_number;

        if ( level.launchfacility_a_price_bmp_nag_number == 7 || level.launchfacility_a_price_bmp_nag_number == 8 )
            level.grigsby maps\jake_tools::_id_2A05( var_3 );
        else
            level._id_6F7C maps\jake_tools::_id_2A05( var_3 );

        if ( isdefined( var_1 ) && var_1 == 1 )
        {
            while ( isdefined( level._id_24EC ) )
                wait 0.05;

            thread _id_A5A4::_id_48B0( &"SCRIPT_PLATFORM_LAUNCHFACILITY_A_HINT_PLANT_C4_GLOW", 7 );
        }

        if ( isdefined( var_2 ) && var_2 == 1 )
        {
            wait(_func_0B5( 20, 30 ));
            continue;
        }

        wait(_func_0B5( 10, 15 ));
    }
}

deleteweapons()
{
    if ( isdefined( self ) )
        self delete();
}

migs_flyby1()
{
    common_scripts\utility::_id_384A( "migs_flyby1" );
    var_0 = getent( "trigger_migs_intro", "script_noteworthy" );
    var_0 notify( "trigger", level._id_0318 );
}

migs_flyby2()
{
    common_scripts\utility::_id_384A( "migs_flyby2" );
    var_0 = getent( "trigger_migs_end", "script_noteworthy" );
    var_0 notify( "trigger", level._id_0318 );
}

sniper_activity()
{
    level.asniper_orgs = getentarray( "sniper_position_container", "targetname" );
    common_scripts\utility::_id_384A( "obj_gain_access_complete" );
    level.asniper_orgs = getentarray( "sniper_position_tarmac", "targetname" );
}

rpg_ambient( var_0, var_1, var_2 )
{
    var_3 = 0;

    while ( var_3 < var_2 )
    {
        var_3++;
        var_4 = common_scripts\utility::_id_3F91( level._id_0318._id_02E2, var_0 );
        var_0 = common_scripts\utility::_id_0CF6( var_0, var_4 );
        var_5 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_1 );
        var_1 = common_scripts\utility::_id_0CF6( var_1, var_5 );
        _func_1C2( "rpg", var_4._id_02E2, var_5._id_02E2 );
        wait(_func_0B5( 1.5, 2.5 ));
    }
}

c4_plant_think()
{
    var_0 = self._id_0398;
    var_1 = getent( self._id_04A4, "targetname" );
    var_1 waittill( "trigger" );
    maps\_c4::c4_location( undefined, ( 0, 0, 0 ), ( 0, 0, 0 ), self._id_02E2 );
    self waittill( "c4_detonation" );
    common_scripts\_exploder::_id_3528( var_0 );
    thread common_scripts\utility::_id_69C2( "detpack_explo_concrete" );

    if ( isdefined( level.c4_callback_thread ) )
        self thread [[ level.c4_callback_thread ]]();
}

launch_lid_setup()
{
    thread launch_lid_think( "03" );
    thread launch_lid_think( "04" );
    thread launch_lid_think( "05" );
    thread launch_lid_think( "06" );
}

launch_flag_management( var_0 )
{
    var_1 = "player_near_launchtube_" + var_0;
    common_scripts\utility::_id_384A( var_1 );
    var_2 = undefined;
    wait 2;

    if ( var_0 == "03" )
        var_2 = "player_near_launchtube_04";

    if ( var_0 == "04" )
        var_2 = "player_near_launchtube_03";

    if ( var_0 == "05" )
        var_2 = "player_near_launchtube_06";

    if ( var_0 == "06" )
        var_2 = "player_near_launchtube_05";

    if ( !common_scripts\utility::_id_382E( var_2 ) )
        common_scripts\utility::_id_383F( var_2 );
}

launch_lid_think( var_0 )
{
    thread launch_flag_management( var_0 );
    var_1 = "player_near_launchtube_" + var_0;
    var_2 = getent( "lid_arm_" + var_0, "targetname" );
    var_3 = getent( "lid_" + var_0, "targetname" );
    var_4 = getent( "lid_model_" + var_0, "targetname" );
    var_4 _meth_804F( var_3 );
    var_5 = getent( "lid_arm_model_" + var_0, "targetname" );
    var_5 _meth_804F( var_2 );
    var_3._id_04C5 = getent( "trigger_hurt_player_lid_" + var_0, "targetname" );
    var_3._id_04C5 _meth_806B();
    var_6 = getent( "lid_fx_" + var_0, "targetname" );
    var_6.opening = 0;
    var_7 = getent( "lid_origin_" + var_0, "targetname" );
    var_3.rotationdummy = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3.rotationdummy.angles = var_7.angles;
    var_3.rotationdummy._id_02E2 = var_7._id_02E2;
    var_2.rotationdummy = spawn( "script_origin", ( 0, 0, 0 ) );
    var_2.rotationdummy.angles = var_7.angles;
    var_2.rotationdummy._id_02E2 = var_7._id_02E2;
    var_3 _meth_804F( var_3.rotationdummy );
    var_2 _meth_804F( var_2.rotationdummy );
    var_3._id_04C5 _meth_804F( var_3.rotationdummy );
    var_8 = getent( "missile" + var_0, "targetname" );
    var_9 = getent( "missile_model" + var_0, "targetname" );
    var_9 _meth_804F( var_8 );
    var_10 = getent( var_8._id_04A4, "targetname" );
    var_2.rotationdummy _meth_82B2( 125, 0.5 );
    var_2.rotationdummy _meth_82AA( var_2.rotationdummy._id_02E2 + ( 0, 0, -50 ), 0.5 );
    common_scripts\utility::_id_384A( var_1 );
    var_6 thread launch_lid_alarm();
    var_6 _meth_809C( level._id_78BA["launch_tube_prepare"], "sounddone" );
    playfx( level._id_058F["launchtube_steam"], var_6._id_02E2 );
    var_6 waittill( "sounddone" );
    var_11 = getent( "badplace_lid_" + var_0, "targetname" );
    badplace_brush( "badplace_lid_volume" + var_0, 0, var_11, "allies", "axis" );
    var_12 = 20;
    var_6.opening = 1;
    var_3 thread lid_kill( var_0, var_6 );
    var_6 thread launch_lid_sound();
    var_8 thread missile_move();
    var_3.rotationdummy _meth_82B2( -125, var_12, 2, 2 );
    var_2.rotationdummy _meth_82B2( -125, var_12 / 1.5, 1, 1 );
    var_2.rotationdummy _meth_82AA( var_2.rotationdummy._id_02E2 + ( 0, 0, 50 ), var_12 / 2.5, 0, 2 );
    wait(var_12 - 1);
    var_6.opening = 0;
    var_6 notify( "stopped_opening" );
    wait 2;
    var_3.rotationdummy delete();
    var_2.rotationdummy delete();
    var_7 delete();
}

lid_kill( var_0, var_1 )
{
    while ( var_1.opening == 1 )
    {
        wait 0.05;

        if ( level._id_0318 _meth_80AB( self._id_04C5 ) )
        {
            level notify( "new_quote_string" );
            setdvar( "ui_deadquote", &"LAUNCHFACILITY_A_DEADQUOTE_KILLED_BY_LID" );
            level._id_0318 _meth_8054();
        }
    }
}

missile_move()
{
    self _meth_82AA( self._id_02E2 + ( 0, 0, 175 ), 18, 4, 4 );
}

launch_lid_sound()
{
    self _meth_809C( level._id_78BA["launch_tube_open_start"] );
    wait 1;
    thread common_scripts\utility::_id_6975( level._id_78BA["launch_tube_open_loop"] );
    self waittill( "stopped_opening" );
    self notify( "stop sound" + level._id_78BA["launch_tube_open_loop"] );
    self _meth_809C( level._id_78BA["launch_tube_open_end"] );
}

launch_lid_alarm()
{
    if ( isdefined( level.lidloopplaying ) && level.lidloopplaying == 1 )
        return;

    level.lidloopplaying = 1;
    _id_A5A4::_id_69C4( "emt_alarm_launch_doors" );
    level.lidloopplaying = 0;
}

disable_color_trigs()
{
    common_scripts\utility::_id_0D13( level.acolornodetriggers, common_scripts\utility::_id_97CC );
}

dialogue_loudspeaker( var_0 )
{
    level._id_0318 _id_A5A4::_id_69C4( level._id_78BA[var_0] );
}

squad_bmp_destroy( var_0 )
{
    var_1 = var_0 + "_destroyed";
    level endon( var_1 );
    var_2 = "player_near_" + var_0;

    while ( common_scripts\utility::_id_382E( var_2 ) )
        wait 0.5;

    self notify( "clear_c4" );
    _id_A5A4::_id_70BD( "launchfacility_a_marine_01_blowing_bmp" );

    if ( isdefined( self ) )
    {
        if ( !common_scripts\utility::_id_382E( var_1 ) )
        {
            self endon( "death" );
            var_3 = self _meth_81B5();
            thread _id_9CA1( var_3 );
        }
    }
}

player_kill_counter( var_0 )
{
    level notify( "reset_kill_counter" );
    level endon( "reset_kill_counter" );
    common_scripts\utility::_id_3831( "player_reached_kill_max" );
    level.axiskilledbyplayer = 0;

    while ( level.axiskilledbyplayer < var_0 )
        wait 2;

    common_scripts\utility::_id_383F( "player_reached_kill_max" );
}

c4_callback_thread_launchfacility()
{
    switch ( self._id_0398 )
    {
        case "100":
            common_scripts\utility::_id_383F( "flanking_wall_breached" );
            break;
    }
}

obj_gain_access()
{
    common_scripts\utility::_id_384A( "obj_gain_access_given" );
    var_0 = 1;
    var_1 = getent( "obj_gain_access", "targetname" );
    objective_add( var_0, "active", &"LAUNCHFACILITY_A_OBJ_GAIN_ACCESS", var_1._id_02E2 );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_gain_access_complete" );
    objective_state( var_0, "done" );
}

obj_enemy_armor()
{
    common_scripts\utility::_id_384A( "obj_enemy_armor_given" );
    objective_add( 10, "invisible", &"LAUNCHFACILITY_A_OBJ_ENEMY_ARMOR" );
    objective_state( 10, "active" );
    _func_110( 10, &"LAUNCHFACILITY_A_OBJ_ENEMY_ARMOR", level.enemyarmor.size );
    objective_current( 10 );
    common_scripts\utility::_id_384A( "obj_enemy_armor_complete" );
    objective_state( 10, "done" );
}

obj_enemy_armor_vehicle_think()
{
    level.enemyarmorindex++;
    var_0 = level.enemyarmorindex;
    level.enemyarmor = common_scripts\utility::_id_0CDA( level.enemyarmor, self );
    _func_110( 10, &"LAUNCHFACILITY_A_OBJ_ENEMY_ARMOR", level.enemyarmor.size );
    _func_112( 10, var_0, self._id_02E2 );

    if ( level.enemyarmorindex == 2 )
    {
        wait 1;
        _func_110( 10, &"LAUNCHFACILITY_A_OBJ_ENEMY_ARMOR", level.enemyarmor.size );
    }

    thread obj_enemy_armor_vehicle_death( var_0 );
    thread obj_enemy_armor_vehicle_position( var_0 );
}

obj_enemy_armor_vehicle_death( var_0 )
{
    self waittill( "death" );
    level.enemyarmor = common_scripts\utility::_id_0CF6( level.enemyarmor, self );
    waitframe;
    _func_112( 10, var_0, ( 0, 0, 0 ) );

    if ( level.enemyarmor.size == 0 )
    {
        common_scripts\utility::_id_383F( "obj_enemy_armor_complete" );
        objective_state( 10, "invisible" );
        common_scripts\utility::_id_3831( "aa_tarmac_bmp02_section" );
    }

    _func_110( 10, &"LAUNCHFACILITY_A_OBJ_ENEMY_ARMOR", level.enemyarmor.size );
}

obj_enemy_armor_vehicle_position( var_0 )
{
    _func_10E( 10, var_0, self );
}

obj_north_tarmac()
{
    common_scripts\utility::_id_384A( "obj_north_tarmac_given" );
    var_0 = 11;
    var_1 = getent( "obj_north_tarmac", "targetname" );
    objective_add( var_0, "active", &"LAUNCHFACILITY_A_OBJ_NORTH_TARMAC", var_1._id_02E2 );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_north_tarmac_complete" );
    objective_state( var_0, "done" );
}

obj_rappel()
{
    common_scripts\utility::_id_384A( "obj_rappel_given" );
    var_0 = 12;
    var_1 = getent( "obj_rappel", "targetname" );
    objective_add( var_0, "active", &"LAUNCHFACILITY_A_OBJ_RAPPEL", var_1._id_02E2 );
    objective_current( var_0 );
    common_scripts\utility::_id_384A( "obj_rappel_complete" );
    objective_state( var_0, "done" );
}

vehicle_bmp_setup( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread vehicle_bmp_think( var_0[var_1] );
}

vehicle_truck_setup()
{
    var_0 = getentarray( "truck_troops", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread vehicle_truck_think();
}

vehicle_truck_think()
{
    self endon( "death" );
    truck_death_think();
}

truck_death_think()
{
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( isdefined( var_2 ) && !_func_1AD( var_2 ) )
        {
            if ( !common_scripts\utility::_id_382E( "enemy_can_blow_up_truck" ) )
                continue;
        }

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 <= 0 )
            continue;

        var_5 = _id_3F4C( var_5 );

        if ( var_5 == "rocket" )
        {
            if ( var_1 >= 300 )
                break;

            continue;
        }

        if ( var_5 == "c4" )
        {
            if ( var_1 >= 250 )
                break;

            continue;
        }

        continue;
    }

    thread common_scripts\utility::_id_69C2( "exp_armor_vehicle", self._id_02E2 );
    _func_18C( 0.6, 2, self._id_02E2, 2000 );
    self notify( "death" );
}

vehicle_bmp_death_wait()
{
    self waittill( "death" );
    _func_09E( self );
}

vehicle_bmp_think( var_0 )
{
    _id_A5A4::_id_0764( "armor_damage", &"SCRIPT_ARMOR_DAMAGE", undefined, 1 );
    var_1 = _id_A5A8::waittill_vehiclespawn( var_0 );
    _func_09D( var_1, ( 0, 0, 0 ) );
    _func_0A8( var_1, 1 );
    var_1 thread vehicle_bmp_death_wait();
    common_scripts\utility::_id_383F( var_0 + "_spawned" );

    if ( isdefined( var_1._id_0398 ) && var_1._id_0398 == "objective_tarmac_armor" )
        var_1 thread obj_enemy_armor_vehicle_think();

    var_1 thread vehicle_turret_think();
    var_1 thread vehicle_death_think();
    var_1 thread _id_A5AA::_id_2581();
    var_1 thread vehicle_patrol_think();
    var_1 thread vehicle_c4_think();
    var_1 thread vehicle_enemies_setup();

    if ( var_0 == "bmp_02" )
        var_1 thread friendlies_blow_bmp02();

    var_2 = getent( "badplace_" + var_0, "targetname" );

    if ( isdefined( var_2 ) )
        badplace_brush( var_0, 0, var_2, "allies" );

    var_1 waittill( "death" );
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3.angles = var_1.angles;
    var_3._id_02E2 = var_1._id_02E2;
    var_4 = var_0 + "_destroyed";
    common_scripts\utility::_id_383F( var_4 );

    if ( isdefined( var_2 ) )
        badplace_delete( var_0 );
}

vehicle_damage_hints()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !_func_1AD( var_1 ) )
            continue;

        switch ( _func_123( var_4 ) )
        {
            case "mod_grenade":
            case "mod_grenade_splash":
                thread _id_A5A4::_id_48CB();
                thread _id_A5A4::_id_48B0( &"SCRIPT_ARMOR_DAMAGE", 5, undefined, 1 );
                wait 10;
                continue;
        }
    }
}

vehicle_death_think()
{
    self endon( "death" );
    var_0 = self _meth_81B5();
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        self waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !_func_1AD( var_5 ) )
            continue;

        if ( !isdefined( var_4 ) )
            continue;

        if ( var_4 <= 0 )
            continue;

        var_8 = _id_3F4C( var_8 );

        if ( var_8 == "rocket" )
        {
            if ( var_4 >= 900 )
            {
                var_3 = 1;
                break;
            }

            if ( var_4 >= 300 )
            {
                var_1++;

                if ( var_1 == 1 )
                    thread vehicle_smoke();

                if ( var_1 == 2 )
                {
                    var_2 = 1;
                    break;
                }
            }
        }

        if ( var_8 == "c4" )
        {
            if ( var_4 >= 250 )
                break;
        }
    }

    if ( var_2 || var_3 )
        thread bmp_death_dialogue();

    thread _id_9CA1( var_0 );
}

bmp_death_dialogue()
{
    wait 1;
    level.dialoguerpggoodshot_number++;

    if ( level.dialoguerpggoodshot_number > level.dialoguerpggoodshot_max )
        level.dialoguerpggoodshot_number = 1;

    var_0 = "launchfacility_a_rpg_kill_0" + level.dialoguerpggoodshot_number;

    if ( !level.peoplespeaking )
    {
        level.peoplespeaking = 1;
        level _id_A5A4::_id_70BD( var_0 );
        level.peoplespeaking = 0;
    }
}

vehicle_smoke()
{
    wait 1;
    level.dialoguerpghit_number++;

    if ( level.dialoguerpghit_number > level.dialoguerpghit_max )
        level.dialoguerpghit_number = 1;

    var_0 = "launchfacility_a_rpg_hit_0" + level.dialoguerpghit_number;

    if ( !level.peoplespeaking )
    {
        level.peoplespeaking = 1;
        level _id_A5A4::_id_70BD( var_0 );
        level.peoplespeaking = 0;
    }

    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1._id_02E2 = self _meth_8184( "tag_origin" );
    var_1 _meth_804F( self );

    while ( _func_1A1( self ) )
    {
        playfx( common_scripts\utility::_id_3FA8( "smoke_trail_bmp" ), var_1._id_02E2 );
        playfx( common_scripts\utility::_id_3FA8( "smoke_trail_bmp" ), var_1._id_02E2 + ( 50, 50, -50 ) );
        wait 0.1;
    }

    self waittill( "death" );
    var_1 delete();
}

_id_3F4C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    var_0 = _func_123( var_0 );

    switch ( var_0 )
    {
        case "mod_explosive":
        case "mod_explosive_splash":
            return "c4";
        case "mod_projectile":
        case "mod_projectile_splash":
            return "rocket";
        case "mod_grenade":
        case "mod_grenade_splash":
            return "grenade";
        case "unknown":
            return "unknown";
        default:
            return "unknown";
    }
}

vehicle_get_target( var_0 )
{
    var_1 = _id_A53F::_id_3F7F( level.bmpcannonrange, level._id_2235["180"], 1, 1, 0, 1, var_0 );
    return var_1;
}

vehicle_get_target_player_only()
{
    var_0 = level._id_8AB0;
    var_1 = _id_A53F::_id_3F7F( level.bmpcannonrange, level._id_2235["180"], 0, 1, 0, 0, var_0 );
    return var_1;
}

vehicle_debug()
{
    self endon( "death" );

    for (;;)
    {
        wait 0.5;
        thread maps\jake_tools::_id_2682( self._id_02E2, level.bmpmgrange, 0.5, level.color["red"], undefined, 1 );
        thread maps\jake_tools::_id_2682( self._id_02E2, level.bmpcannonrange, 0.5, level.color["blue"], undefined, 1 );
    }
}

vehicle_turret_think()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    thread _id_A5A8::_id_5BD2();
    self.turretfiring = 0;
    var_0 = undefined;
    var_1 = undefined;

    if ( getdvar( "debug_bmp" ) == "1" )
        thread vehicle_debug();

    for (;;)
    {
        wait 0.05;

        if ( !isdefined( var_0 ) )
            var_0 = vehicle_get_target_player_only();
        else if ( isdefined( var_0 ) && !_func_1AD( var_0 ) )
            var_0 = vehicle_get_target_player_only();

        if ( isdefined( var_0 ) && _func_1AD( var_0 ) )
        {
            var_2 = 0;
            var_2 = _func_08E( self._id_02E2, level._id_0318._id_02E2 + ( 0, 0, 150 ), 0, self );

            if ( !var_2 )
                var_0 = vehicle_get_target( level.bmpexcluders );
        }
        else
            var_0 = vehicle_get_target( level.bmpexcluders );

        if ( isdefined( var_0 ) && _func_1A1( var_0 ) )
        {
            var_3 = var_0._id_02E2 + ( 0, 0, 32 );
            self _meth_825D( var_3 );

            if ( getdvar( "debug_bmp" ) == "1" )
                thread _id_A5A4::_id_2DBF( self._id_02E2 + ( 0, 0, 32 ), var_3, 1, 0, 0, self, "stop_drawing_line" );

            var_4 = _func_0B5( 2, 3 );
            common_scripts\utility::_id_A0A0( "turret_rotate_stopped", var_4 );

            if ( isdefined( var_0 ) && _func_1A1( var_0 ) )
            {
                if ( _func_0F0( var_0._id_02E2, self._id_02E2 ) <= level.bmpmgrangesquared )
                {
                    if ( !self._id_5BD5[0] _meth_80E6() )
                        thread _id_A5A8::_id_5BD3();

                    wait 0.5;

                    if ( !self._id_5BD5[0] _meth_80E6() )
                    {
                        thread _id_A5A8::_id_5BD2();

                        if ( !self.turretfiring )
                            thread vehicle_fire_main_cannon();
                    }
                }
                else
                {
                    thread _id_A5A8::_id_5BD2();

                    if ( !self.turretfiring )
                        thread vehicle_fire_main_cannon();
                }
            }
        }

        if ( getdvar( "debug_bmp" ) == "1" )
            self notify( "stop_drawing_line" );
    }
}

vehicle_fire_main_cannon()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    var_0 = _func_1B0( "bmp_turret" );
    var_1 = _func_0B4( 3, 8 );
    self.turretfiring = 1;
    var_2 = 0;

    while ( var_2 < var_1 )
    {
        var_2++;
        wait(var_0);
        self _meth_8264();
    }

    self.turretfiring = 0;
}

vehicle_c4_think()
{
    var_0 = self _meth_81B5();
    var_1 = ( 0, -33, 10 );
    var_2 = ( 0, 90, -90 );
    var_3 = ( 129, 0, 35 );
    var_4 = ( 0, 90, 144 );
    maps\_c4::c4_location( "rear_hatch_open_jnt_left", var_1, var_2 );
    maps\_c4::c4_location( "tag_origin", var_3, var_4 );
    self.rearc4location = spawn( "script_origin", self._id_02E2 );
    self.frontc4location = spawn( "script_origin", self._id_02E2 );
    self.rearc4location _meth_804F( self, "rear_hatch_open_jnt_left", var_1, var_2 );
    self.frontc4location _meth_804F( self, "tag_origin", var_3, var_4 );

    if ( getdvar( "debug_launch" ) == "1" )
    {
        self.frontc4location thread maps\jake_tools::_id_6FA6( "Front" );
        self.rearc4location thread maps\jake_tools::_id_6FA6( "Back" );
    }

    self waittill( "c4_detonation" );
    self.frontc4location delete();
    self.rearc4location delete();
    var_5 = maps\jake_tools::_id_3CB9( 512, self._id_02E2, "axis" );

    if ( isdefined( var_5 ) && var_5.size > 0 )
        common_scripts\utility::_id_0D13( var_5, maps\jake_tools::_id_0926, 0.75 );

    thread _id_9CA1( var_0 );
}

_id_9CA1( var_0 )
{
    self notify( "clear_c4" );
    _id_A5A4::arcademode_kill( self._id_02E2, "explosive", 150 );
    _func_18A( 1 );

    if ( _func_0F0( self._id_02E2, level._id_0318._id_02E2 ) <= level.bmpmgrangesquared )
        level._id_0318 _meth_80AF( "generic_attack_heavy_750" );

    _func_18C( 0.6, 2, self._id_02E2, 2000 );
    self notify( "death" );
    thread common_scripts\utility::_id_69C2( "h1_exp_armor_vehicle", self _meth_8184( "tag_turret" ) );
    var_1 = maps\jake_tools::_id_3CB9( 1024, self._id_02E2, "axis" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        common_scripts\utility::_id_0D13( var_1, maps\jake_tools::_id_0926, 0.85 );

    _func_189( self._id_02E2, 256, level.maxbmpexplosiondmg, level.minbmpexplosiondmg );
    thread player_token_vehicle_damage( self._id_02E2 );
    thread _id_A5A4::_id_1143( "bmp_" + var_0 + "_destroyed" );
    wait 2;
    _func_18A( 0 );
}

player_token_vehicle_damage( var_0 )
{
    if ( _func_0F0( var_0, level._id_0318._id_02E2 ) <= level.playervehicledamagerangesquared )
        level._id_0318 _meth_8053( level._id_0318._id_01E6 / 3, ( 0, 0, 0 ) );
}

vehicle_enemies_setup()
{
    if ( !isdefined( self._id_7A26 ) )
        return;

    var_0 = getent( self._id_7A26, "script_linkname" );
    var_0 notify( "trigger", level._id_0318 );
    var_1 = getentarray( var_0._id_7A26, "script_linkname" );
    common_scripts\utility::_id_0D13( var_1, ::vehicle_ai_killspawner_triggers_think, self );
    var_2 = getentarray( "triggers_" + self._id_9D45._id_04A6, "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_2, ::vehicle_ai_movement_triggers_think, self );
}

vehicle_ai_killspawner_triggers_think( var_0 )
{
    var_0 waittill( "death" );
    self notify( "trigger", level._id_0318 );
}

vehicle_ai_movement_triggers_think( var_0 )
{
    var_0 endon( "death" );
    var_1 = getent( self._id_04A4, "targetname" );

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( var_2 != var_0 )
            continue;

        var_0 notify( "changing_volume", var_1 );
        var_0.enemyvolume = var_1;
        var_0 waittill( "changing_volume" );
        wait 5;
    }
}

ai_vehicle_support()
{
    self endon( "death" );
    var_0 = getent( self._id_7A26, "script_linkname" );
    var_1 = _func_122( var_0._id_0398, 7 );
    var_2 = _id_A5A8::get_vehicle_from_targetname( var_1 );
    thread ai_vehicle_support_vehicle_dead( var_2 );
    wait 0.05;

    if ( isdefined( var_2.enemyvolume ) )
        maps\jake_tools::_id_7E51( undefined, var_2.enemyvolume );

    for (;;)
    {
        var_2 waittill( "changing_volume", var_3 );
        maps\jake_tools::_id_7E51( undefined, var_3 );
        wait 0.05;
    }
}

ai_vehicle_support_vehicle_dead( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self._id_01E6 = 1;
    thread ai_player_seek();
}

ai_enemy_rpd()
{
    self endon( "death" );
}

vehicle_patrol_init()
{
    level.avehiclenodes = [];
    var_0 = _func_1ED( "go_right", "script_noteworthy" );
    var_1 = _func_1ED( "go_left", "script_noteworthy" );
    level.avehiclenodes = _id_A5A4::_id_0CF2( var_0, var_1 );
}

vehicle_patrol_think()
{
    self endon( "death" );
    var_0 = self._id_0DF6;
    self waittill( "reached_end_node" );

    switch ( self._id_9D45._id_04A6 )
    {
        case "bmp_02":
            self.balconypositionorg = getent( "bmp_02_balcony_org", "targetname" );
            break;
        case "bmp_03":
            self.balconypositionorg = getent( "bmp_03_balcony_org", "targetname" );
            break;
        case "bmp_04":
            self.balconypositionorg = getent( "bmp_04_balcony_org", "targetname" );
            break;
        default:
    }

    self _meth_8287();
    var_1 = 0;

    for (;;)
    {
        wait 0.05;
        var_2 = [];
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = [];
        var_8 = undefined;
        var_3 = var_0 _id_A5A4::_id_3DB1( "vehiclenode" );
        var_2 = level.avehiclenodes;
        var_2 = common_scripts\utility::_id_0CF6( var_2, var_3 );
        var_9 = level.avehiclenodes;
        var_10 = var_3._id_7B18;

        for ( var_11 = 0; var_11 < var_9.size; var_11++ )
        {
            if ( var_9[var_11]._id_7B18 != var_10 )
                var_2 = common_scripts\utility::_id_0CF6( var_2, var_9[var_11] );
        }

        for ( var_11 = 0; var_11 < var_2.size; var_11++ )
        {
            if ( isdefined( var_2[var_11]._id_0398 ) && var_2[var_11]._id_0398 == "go_left" )
            {
                var_4 = var_2[var_11];
                var_4._id_311C = undefined;
                continue;
            }

            if ( isdefined( var_2[var_11]._id_0398 ) && var_2[var_11]._id_0398 == "go_right" )
            {
                var_5 = var_2[var_11];
                var_5._id_311C = undefined;
            }
        }

        var_7[0] = var_3;

        if ( isdefined( var_4 ) )
        {
            var_4._id_311C = var_4 _id_A5A4::_id_3DB1( "vehiclenode" );
            var_7 = common_scripts\utility::_id_0CDA( var_7, var_4._id_311C );
        }

        if ( isdefined( var_5 ) )
        {
            var_5._id_311C = var_5 _id_A5A4::_id_3DB1( "vehiclenode" );
            var_7 = common_scripts\utility::_id_0CDA( var_7, var_5._id_311C );
        }

        var_12 = undefined;

        if ( level._id_0318 _meth_80AB( level.balconyflag ) )
            var_12 = self.balconypositionorg._id_02E2;
        else
            var_12 = level._id_0318._id_02E2;

        var_8 = common_scripts\utility::_id_3F33( var_12, var_7 );

        if ( var_8 == var_3 )
            var_6 = undefined;
        else if ( isdefined( var_4 ) && var_8 == var_4._id_311C )
            var_6 = var_4;
        else if ( isdefined( var_5 ) && var_8 == var_5._id_311C )
            var_6 = var_5;

        if ( !isdefined( var_6 ) )
        {
            if ( _func_0F0( self.rearc4location._id_02E2, level._id_0318._id_02E2 ) <= level.playermaxdistancetobmpc4squared )
            {
                var_13 = _func_08D( level._id_0318._id_02E2, self _meth_8184( "tag_turret" ), 0, self );

                if ( var_13 )
                {
                    if ( isdefined( var_4 ) )
                        var_6 = var_4;
                }
            }
            else if ( _func_0F0( self.frontc4location._id_02E2, level._id_0318._id_02E2 ) <= level.playermaxdistancetobmpc4squared )
            {
                var_13 = _func_08D( level._id_0318._id_02E2, self _meth_8184( "tag_turret" ), 0, self );

                if ( var_13 )
                {
                    if ( isdefined( var_5 ) )
                        var_6 = var_5;
                }
            }
        }

        if ( isdefined( var_6 ) )
        {
            self _meth_8279( var_6 );

            if ( isdefined( var_6._id_7B24 ) )
                _id_A5AA::_id_A2FF( var_6._id_7B24 );

            var_0 = var_6;

            if ( !var_1 )
            {
                thread maps\launchfacility_a_aud::bmp_start_moving();
                var_1 = 1;
            }

            self _meth_827F( 5, 2, 2 );
            self waittill( "reached_end_node" );
            continue;
        }

        if ( var_1 )
        {
            thread maps\launchfacility_a_aud::bmp_stop_moving();
            var_1 = 0;
        }

        wait 3;
    }
}

ai_think( var_0 )
{
    if ( var_0._id_04A7 == "axis" )
        var_0 thread ai_axis_think();

    if ( var_0._id_04A7 == "allies" )
        var_0 thread ai_allies_think();
}

ai_allies_think()
{
    self endon( "death" );
    self._id_0C72 = "frnd";
    thread ai_friendly_waittill_death();

    if ( !isdefined( self._id_58D7 ) )
        thread _id_A5A4::_id_58D7();

    _id_A5A4::_id_7F71( 1 );

    if ( isdefined( self._id_79E6 ) )
    {
        switch ( self._id_79E6 )
        {
            case "r":
                level.team01 = common_scripts\utility::_id_0CDA( level.team01, self );

                if ( getdvar( "debug_launch" ) == "1" )
                    thread maps\jake_tools::_id_6FA6( "Team 01" );

                break;
            case "o":
                level.team01 = common_scripts\utility::_id_0CDA( level.team01, self );

                if ( getdvar( "debug_launch" ) == "1" )
                    thread maps\jake_tools::_id_6FA6( "Wingman" );

                break;
            case "y":
                level.team02 = common_scripts\utility::_id_0CDA( level.team02, self );

                if ( getdvar( "debug_launch" ) == "1" )
                    thread maps\jake_tools::_id_6FA6( "Team 02" );

                break;
            case "g":
                level.team03 = common_scripts\utility::_id_0CDA( level.team03, self );

                if ( getdvar( "debug_launch" ) == "1" )
                    thread maps\jake_tools::_id_6FA6( "Team 03" );

                break;
        }
    }

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );
        level.bmpexcluders = common_scripts\utility::_id_0CDA( level.bmpexcluders, self );
        self._id_01FF = 1;
        wait 1;
        self.a._id_2B20 = 1;
        wait(_func_0B5( 3, 5 ));
        self._id_01FF = 0;
        level.bmpexcluders = common_scripts\utility::_id_0CF6( level.bmpexcluders, self );
        self.a._id_2B20 = 0;
    }
}

ai_friendly_waittill_death()
{
    self waittill( "death" );

    if ( _id_A5A4::_id_503B( level.bmpexcluders, self ) )
        common_scripts\utility::_id_0CF6( level.bmpexcluders, self );
}

ai_axis_think()
{
    self endon( "death" );
    self._id_0C72 = "hostile";
    thread ai_axis_death();
    thread ai_axis_player_distance();
    thread ai_axis_sniper_fodder();
}

ai_axis_player_distance()
{
    self endon( "death" );

    for (;;)
    {
        wait 0.25;

        if ( level.snipersactive )
            continue;

        if ( _func_0F0( self._id_02E2, level._id_0318._id_02E2 ) <= level.playerdistancetoaisquared )
            self notify( "close_to_player" );
    }
}

ai_axis_sniper_fodder()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "close_to_player" );

        if ( level.peoplespeaking )
            continue;

        if ( level.snipersactive )
            continue;

        var_0 = level._id_0318 _meth_80AA();
        var_1 = self _meth_8184( "TAG_EYE" );
        var_2 = common_scripts\utility::_id_A347( var_0, level._id_0318 _meth_8338(), var_1, level._id_2235["35"] );

        if ( !var_2 )
            continue;

        var_3 = _func_08E( var_0, var_1, 0, undefined );

        if ( !var_3 )
            continue;

        var_1 = self _meth_8184( "TAG_EYE" );

        if ( getdvar( "debug_launch" ) == "1" )
            thread maps\jake_tools::_id_6FA6( "target" );

        for ( var_4 = 0; var_4 < level.asniper_orgs.size; var_4++ )
        {
            var_5 = _func_08E( level.asniper_orgs[var_4]._id_02E2, var_1, 1, self );

            if ( var_5 )
            {
                thread sniper_execute( var_1, level.asniper_orgs[var_4] );
                break;
            }
        }
    }
}

sniper_execute( var_0, var_1 )
{
    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    if ( level.snipersactive )
        return;

    level.snipersactive = 1;
    level.snipertarget = self;
    level notify( "sniper_target_updated" );
    level.sniperkills++;

    if ( getdvar( "debug_launch" ) == "1" )
    {
        level notify( "stop_drawing_line" );
        thread _id_A5A4::_id_2DBF( var_1._id_02E2, var_0, 1, 0, 0, level, "stop_drawing_line" );
    }

    var_2 = _func_0B4( 1, 3 );
    var_3 = 0;

    while ( var_3 < var_2 )
    {
        var_3++;

        if ( var_3 == 1 )
            playfxontag( common_scripts\utility::_id_3FA8( "headshot" ), self, "tag_eye" );

        _func_1C2( "m14_scoped", var_1._id_02E2, var_0 );
        bullettracer( var_1._id_02E2, var_0, 1 );
        thread common_scripts\utility::_id_69C2( "weap_m82sniper_fire_launcha", level._id_0318._id_02E2 );

        if ( var_3 != var_2 )
            wait(_func_0B5( 0.25, 0.75 ));
    }

    wait(_func_0B5( 0.75, 1.5 ));

    if ( level.sniperconfirmdialogue )
    {
        level.dialoguesniperconfirm_number++;

        if ( level.dialoguesniperconfirm_number > level.dialoguesniperconfirm_max )
            level.dialoguesniperconfirm_number = 1;

        var_4 = "launchfacility_a_sniper_confirm_0" + level.dialoguesniperconfirm_number;

        if ( !level.peoplespeaking )
            level _id_A5A4::_id_70C4( var_4 );
    }

    wait(level.sniperinterval);
    level.snipersactive = 0;
}

ai_axis_death()
{
    self waittill( "death", var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( _func_1AD( var_0 ) )
    {
        level.axiskilledbyplayer++;

        if ( getdvar( "debug_launch" ) == "1" )
            return;
    }
}

ai_in_volume_chase_player()
{
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] _meth_80AB( self ) )
        {
            var_0[var_1]._id_01C4 = 600;
            var_0[var_1] _meth_81AB( level._id_0318 );
        }
    }
}

ai_chain_and_seek()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    thread ai_player_seek();
}

ai_player_seek()
{
    self endon( "death" );
    var_0 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

    for (;;)
    {
        wait 2;
        self._id_01C4 = var_0;
        self _meth_81AB( level._id_0318 );
        var_0 -= 175;

        if ( var_0 < 512 )
        {
            var_0 = 512;
            return;
        }
    }
}

_id_4DFB()
{
    level._id_0318 maps\jake_tools::_id_7ED8( "player" );
    var_0 = getentarray( "trigger_player_location", "targetname" );
}

initfriendlies( var_0 )
{
    waitframe;
    level._id_8AB0 = [];
    level._id_6F7C = _id_A5A4::_id_894B( "price" );
    level.grigsby = _id_A5A4::_id_894B( "grigsby" );
    level._id_8AB0[0] = level._id_6F7C;
    level._id_8AB0[1] = level.grigsby;
    level.othersquadfriendly = undefined;
    level._id_33E7 = [];
    level._id_33E7[0] = level._id_6F7C;
    level._id_33E7[1] = level.grigsby;

    switch ( var_0 )
    {
        case "default":
            level.friendly_at4 = _id_A5A4::_id_894B( "friendly_at4" );
            var_1 = _id_A5A4::_id_0D08( getentarray( "friendly_support", "script_noteworthy" ) );
            level._id_8AB0 = _id_A5A4::_id_0CF2( level._id_8AB0, var_1 );
            break;
        case "container":
            level.friendly_at4 = _id_A5A4::_id_894B( "friendly_at4" );
            var_1 = _id_A5A4::_id_0D08( getentarray( "friendly_support", "script_noteworthy" ) );
            level._id_8AB0 = _id_A5A4::_id_0CF2( level._id_8AB0, var_1 );
            break;
        case "gate":
            var_1 = _id_A5A4::_id_0D08( getentarray( "friendly_support", "script_noteworthy" ) );
            level._id_8AB0 = _id_A5A4::_id_0CF2( level._id_8AB0, var_1 );
            break;
        case "tarmac":
            break;
        case "vents":
            var_1 = _id_A5A4::_id_0D08( getentarray( "friendly_support", "script_noteworthy" ) );
            level._id_8AB0 = _id_A5A4::_id_0CF2( level._id_8AB0, var_1 );
            break;
        default:
    }

    common_scripts\utility::_id_0D13( level.team01, ::attach_saw, "startTeam" );
    var_2 = level._id_8AB0;
    var_3 = _func_0C4( "nodeStart_" + var_0, "targetname" );
    var_4 = 0;
    var_5 = undefined;

    while ( var_4 < 3 )
    {
        wait 0.05;

        for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        {
            if ( isdefined( var_3[var_6]._id_0398 ) )
            {
                switch ( var_3[var_6]._id_0398 )
                {
                    case "nodePrice":
                        level._id_6F7C maps\jake_tools::_id_8CC0( var_3[var_6] );
                        var_2 = common_scripts\utility::_id_0CF6( var_2, level._id_6F7C );
                        var_3 = common_scripts\utility::_id_0CF6( var_3, var_3[var_6] );
                        var_4++;
                        continue;
                    case "nodeGrigsby":
                        level.grigsby maps\jake_tools::_id_8CC0( var_3[var_6] );
                        var_2 = common_scripts\utility::_id_0CF6( var_2, level.grigsby );
                        var_3 = common_scripts\utility::_id_0CF6( var_3, var_3[var_6] );
                        var_4++;
                        continue;
                    case "nodePlayer":
                        var_5 = var_3[var_6];
                        var_3 = common_scripts\utility::_id_0CF6( var_3, var_3[var_6] );
                        var_4++;
                        continue;
                }
            }
        }
    }

    if ( var_2.size > 0 )
    {
        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
            var_2[var_6] maps\jake_tools::_id_8CC0( var_3[var_6] );
    }

    level._id_0318 _meth_8335( var_5._id_02E2 );
    level._id_0318 _meth_8337( var_5.angles );
    level._id_33E7[0] = level._id_6F7C;
    level._id_33E7[1] = level.grigsby;
}

attach_saw( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    if ( self == level._id_6F7C || self == level.grigsby || var_0 == "chopperTeam" )
    {
        if ( self _meth_843E( "TAG_STOWED_BACK" ) >= 0 )
        {
            var_1 = spawn( "script_model", self._id_02E2 );
            var_1 _meth_80B3( "weapon_saw_rescue" );
            var_1 _meth_804F( self, "TAG_STOWED_BACK", ( 0, 3, 0 ), ( 180, 191, 0 ) );
            self waittill( "delete_saw" );
            var_1 _meth_8051();
            var_1 delete();
        }
    }
}

initprecache()
{
    precachestring( &"LAUNCHFACILITY_A_OBJ_GAIN_ACCESS" );
    precachestring( &"LAUNCHFACILITY_A_OBJ_RIGHT_GATE" );
    precachestring( &"LAUNCHFACILITY_A_OBJ_ENEMY_ARMOR" );
    precachestring( &"LAUNCHFACILITY_A_OBJ_NORTH_TARMAC" );
    precachestring( &"LAUNCHFACILITY_A_OBJ_RAPPEL" );
    precacheitem( "m14_scoped" );
    precacheitem( "rpg_player" );
    precacheitem( "hind_turret" );
    precacheitem( "hind_FFAR" );
    precacheitem( "hind_FFAR_nodamage" );
    precachemodel( "weapon_c4" );
    precachemodel( "weapon_c4_obj" );
    precachemodel( "rope_coil_obj" );
    precachemodel( "rope_coil" );
    precachemodel( "worldbody_h1_sas_woodland" );
    precachemodel( "weapon_rpd_MG_Setup" );
    precachemodel( "weapon_stinger" );
    precachemodel( "weapon_saw_rescue" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachestring( &"SCRIPT_ARMOR_DAMAGE" );
    precachestring( &"LAUNCHFACILITY_A_DEBUG_LEVEL_END" );
    precachestring( &"SCRIPT_PLATFORM_LAUNCHFACILITY_A_HINT_SMOKE" );
    precachestring( &"SCRIPT_PLATFORM_LAUNCHFACILITY_A_HINT_PLANT_C4_GLOW" );
    precachestring( &"LAUNCHFACILITY_A_HINTSTR_C4_PLANT" );
    precachestring( &"LAUNCHFACILITY_A_HINTSTR_C4_DETONATE" );
    precachestring( &"SCRIPT_PLATFORM_HINTSTR_RAPPEL" );
    precachestring( &"LAUNCHFACILITY_A_HINTSTR_RAPPEL_DOWN_SHAFT" );
    precachestring( &"LAUNCHFACILITY_A_HINTSTR_EXPLOSIVES_PLANTED" );
    precacherumble( "generic_attack_light_500" );
    precacherumble( "generic_attack_light_1000" );
    precacherumble( "generic_attack_light_1500" );
    precacherumble( "generic_attack_light_2000" );
    precacherumble( "generic_attack_heavy_750" );
}

vehicle_path_disconnector()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_0 _meth_82BB();
    var_0._id_02E2 -= ( 0, 0, 1024 );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isdefined( var_0.pathsdisconnected ) )
        {
            var_0 _meth_82BA();
            var_0 _meth_8059();
            var_0 _meth_82BB();
            var_0.pathsdisconnected = 1;
        }

        thread vehicle_reconnects_paths( var_0 );
    }
}

vehicle_reconnects_paths( var_0 )
{
    var_0 notify( "waiting_for_path_reconnection" );
    var_0 endon( "waiting_for_path_reconnection" );
    wait 0.5;
    var_0 _meth_82BA();
    var_0 _meth_805A();
    var_0 _meth_82BB();
    var_0.pathsdisconnected = undefined;
}

vent_flashlights()
{
    var_0 = getentarray( "vent_flashlight_FX_origin", "targetname" );

    if ( !_id_A5A4::is_start_or_after_start( "vents" ) )
        common_scripts\utility::_id_384A( "obj_enemy_armor_complete" );

    foreach ( var_2 in var_0 )
        playfx( level._id_058F["vent_flashlight"], var_2._id_02E2 );
}

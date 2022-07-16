// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( maps\bog_b_beautiful_corner::beautiful_corner() )
        return;

    if ( getdvar( "bog_camerashake" ) == "" )
        setdvar( "bog_camerashake", "1" );

    if ( getdvar( "bog_disableenemies" ) == "" )
        setdvar( "bog_disableenemies", "0" );

    if ( getdvar( "bog_debug_tank" ) == "" )
        setdvar( "bog_debug_tank", "0" );

    if ( getdvar( "bog_debug_flyby" ) == "" )
        setdvar( "bog_debug_flyby", "0" );

    if ( getdvar( "bog_b_min_spec" ) == "1" )
        makeminspec();

    _id_A5A4::_id_079C( "arch", ::start_arch );
    _id_A5A4::_id_079C( "alley", ::start_alley );
    _id_A5A4::_id_079C( "ch46", ::start_ch46 );
    _id_A5A4::_id_278B( ::start_bog );
    level.disallowlegswingwallhop = 1;
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_saw_clip";
    level.weaponclipmodels[3] = "weapon_ak74u_clip";
    level.weaponclipmodels[4] = "weapon_g3_clip";
    level.weaponclipmodels[5] = "weapon_dragunov_clip";
    common_scripts\utility::_id_383D( "tank_clear_to_shoot" );
    common_scripts\utility::_id_383D( "door_idle_guy_idling" );
    common_scripts\utility::_id_383D( "price_at_spotter" );
    common_scripts\utility::_id_383D( "ok_to_do_spotting" );
    common_scripts\utility::_id_383D( "arrived_at_spotting" );
    common_scripts\utility::_id_383D( "tank_in_final_position" );
    common_scripts\utility::_id_383D( "tank_turret_aimed_at_t72" );
    common_scripts\utility::_id_383D( "friendly_reactions_over" );
    common_scripts\utility::_id_383D( "t72_in_final_position" );
    common_scripts\utility::_id_383D( "t72_exploded" );
    common_scripts\utility::_id_383D( "abrams_move_shoot_t72" );
    common_scripts\utility::_id_383D( "abrams_advance_to_end_level" );
    common_scripts\utility::_id_383D( "allowTankFire" );
    common_scripts\utility::_id_383D( "aa_bog_b_zone_bog" );
    common_scripts\utility::_id_383D( "aa_bog_b_zone_streets" );
    common_scripts\utility::_id_383D( "aa_bog_b_zone_alley" );
    common_scripts\utility::_id_383D( "dumpster_pushed" );
    common_scripts\utility::_id_383D( "seaknight_dialog_done" );
    common_scripts\utility::_id_383D( "alley_cleared" );
    common_scripts\utility::_id_383D( "start_dumpster_push" );
    common_scripts\utility::_id_383D( "player_passed_dumpster" );
    common_scripts\utility::_id_383D( "at_alley_breach_price" );
    common_scripts\utility::_id_383D( "at_alley_breach_alley_breach_buddy" );
    common_scripts\utility::_id_383D( "doorblocker_reach_door" );
    common_scripts\utility::_id_383D( "seaknight_start" );
    thread maps\_wibble::setup_wibble_triggers( 1, "seaknight_start", "interior", 0, 0 );
    level.radioforcedtransmissionqueue = [];
    precachemodel( "com_computer_monitor_d" );
    precachemodel( "vehicle_av8b_harrier_jet" );
    precachemodel( "vehicle_ch46e_opened_door_interior_b" );
    precachemodel( "vehicle_ch46e_wires" );
    precachemodel( "vehicle_ch46e_opened_door_interior_a" );
    precachemodel( "vehicle_t72_tank_d_animated_sequence" );
    precacheitem( "m1a1_turret_blank" );
    precacheitem( "remote_missile_detonator" );
    precacheitem( "remote_missile" );
    precachestring( &"BOG_B_OBJ_ESCORT_TANK" );
    precachestring( &"BOG_B_OBJ_SEAKNIGHT" );
    precachestring( &"BOG_B_T72_MG_DEATH" );
    precacherumble( "tank_fire" );
    precacherumble( "tank_impact" );
    precachemodel( "h1_bog_b_patch_concrete_slab" );
    maps\bog_b_precache::main();
    _id_A5A8::_id_186C( "bog_mortar", "vehicle_m1a1_abrams", undefined, "script_vehicle" );
    _id_A5A8::_id_1856( 999, 500, 1500 );
    maps\createart\bog_b_art::main();
    maps\bog_b_fx::main();
    maps\_hiding_door_anims::main();
    _id_A550::main();
    maps\_hiding_door::init_hiding_door();
    maps\_remotemissile::init();
    maps\bog_b_anim::main();
    maps\bog_b_lighting::main();
    maps\bog_b_aud::main();
    _id_A51D::_id_8324( "compass_map_bog_b" );
    thread maps\bog_b_amb::main();
    thread maps\_mortar::bog_style_mortar();
    thread teamssplitup();
    thread lastsequence();
    thread alley_dumpster_sequence();
    thread alley_cleared();
    thread player_passed_dumpster();
    thread rotate_fans();
    thread common_scripts\_pipes::main();
    level._id_2235 = [];
    level._id_2235["35"] = _func_0B7( 35 );
    level._id_2235["65"] = _func_0B7( 65 );
    level._id_2235["80"] = _func_0B7( 80 );
    level._id_2553 = ::savegame_redundancy_check;
    level.minimumtimebetweenautosaves = 15;
    level.exploderarray = [];
    level.exploderarray[0][0] = setupexploder( 105 );
    level.exploderarray[0][1] = setupexploder( 104 );
    level.exploderarray[0][2] = setupexploder( 102 );
    level.exploderarray[0][3] = setupexploder( 103 );
    level.exploderarray[1][0] = setupexploder( 100, ::_id_537D, 7 );
    level.exploderarray[1][1] = setupexploder( 101 );
    level.exploderarray[2][0] = setupexploder( 200 );
    level.exploderarray[2][1] = setupexploder( 201 );
    common_scripts\utility::_id_383F( "respawn_friendlies" );
    _id_A5A4::_id_7EA2( "r", "y" );
    _id_A5A4::_id_7E19( "y" );
    _id_A5A4::_id_7E19( "g" );
    thread archway_color_trigger();
    common_scripts\utility::_id_0D13( getentarray( "stragglers_chase", "targetname" ), ::stragglers_chase );
    common_scripts\utility::_id_0D13( getentarray( "flyby", "targetname" ), ::_id_391D );
    common_scripts\utility::_id_0D13( getentarray( "chain_and_home", "script_noteworthy" ), _id_A5A4::_id_0798, ::chain_and_home );
    common_scripts\utility::_id_0D13( getentarray( "archway_bog_reinforcer", "targetname" ), _id_A5A4::_id_0798, ::ignored_by_tank_cannon );
    common_scripts\utility::_id_0D13( getentarray( "rpg_tank_shooter", "script_noteworthy" ), _id_A5A4::_id_0798, ::rpg_tank_shooter );
    common_scripts\utility::_id_0D13( getentarray( "rpg_tank_shooter_fall", "script_noteworthy" ), _id_A5A4::_id_0798, ::rpg_tank_shooter );
    common_scripts\utility::_id_0D13( getentarray( "rpg_tank_shooter_noignore", "script_noteworthy" ), _id_A5A4::_id_0798, ::rpg_tank_shooter );
    common_scripts\utility::_id_0D13( getentarray( "vehicle_path_disconnector", "targetname" ), ::vehicle_path_disconnector );
    common_scripts\utility::_id_0D13( getentarray( "delete_ai", "targetname" ), ::delete_ai_in_zone );
    common_scripts\utility::_id_0D13( getentarray( "autosave_when_trigger_cleared", "targetname" ), ::autosave_when_trigger_cleared );
    common_scripts\utility::_id_0D13( getentarray( "delete_all_axis", "script_noteworthy" ), ::delete_all_axis );
    common_scripts\utility::_id_0D13( getentarray( "computer_des", "targetname" ), ::computer_destruct );
    thread _id_A5A4::ai_team_run_twitch_think( "allies", "alley_cleared", undefined, "ch46", undefined );
    level.abrams = _id_A5A8::waittill_vehiclespawn( "abrams" );
    var_0 = getent( "abrams_top_clip", "targetname" );
    var_0 _meth_804F( level.abrams, "tag_turret", ( -10, 0, 10 ), ( 0, -90, 0 ) );
    thread seaknight_player_door_clip();
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
    level.abrams.vehicle_treadfx_min_speed = 5;
    wait 0.05;
    var_1 = getent( "alley_volume", "targetname" );
    var_2 = getentarray( "destructible", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3] _meth_80AB( var_1 ) )
            var_2[var_3]._id_2AF5 = 1;
    }

    var_4 = getent( "dumpster", "targetname" );
    var_5 = getent( "dumpster_clip", "targetname" );
    var_5._id_02E2 = var_4._id_02E2;
    var_5.angles = ( 0, var_4.angles[1], 0 );
    var_0 = getent( "truck_clip_before", "targetname" );
    var_0 _meth_82BB();
    var_0 delete();
    var_6 = spawn( "script_model", ( 3900, -1500, 100 ) );
    var_6 _meth_80B3( "h1_bog_b_patch_concrete_slab" );
    level.abrams._id_51B6 = 1;
    level.abrams.forwardent = spawn( "script_origin", level.abrams _meth_8184( "tag_flash" ) );
    level.abrams.forwardent _meth_804F( level.abrams );
    level.tire_fire = getent( "tire_fire", "targetname" );
    playfxontag( level._id_058F["fire_wreckage_ground"], level.tire_fire, "tag_origin" );
    common_scripts\utility::_id_383F( "aa_bog_b_zone_bog" );
    wait 6.5;
    getent( "player_spawn_safety_brush", "targetname" ) delete();
    wait 3.0;
    objective_add( 1, "current", &"BOG_B_OBJ_ESCORT_TANK", ( 4347, -4683, 130 ) );
}

makeminspec()
{
    var_0 = _func_0DB();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isdefined( var_0[var_1]._id_7A39 ) )
        {
            if ( isdefined( var_0[var_1]._id_1300 ) )
                var_0[var_1]._id_1300 *= 1.3;
            else
                var_0[var_1]._id_1300 = 1.2;

            continue;
        }

        switch ( var_0[var_1]._id_7A39 )
        {
            case 0:
                var_0[var_1] delete();
                continue;
        }
    }
}

bog_dialog()
{
    wait 4;
    _id_A5A4::_id_1332( "allies" );
    var_0 = [];
    var_0[0] = level._id_6F7C;
    var_1 = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_0 );
    var_0[1] = var_1;
    var_2 = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_0 );

    if ( !var_2 ishero() )
        var_2 thread _id_A5A4::_id_58D7( undefined, undefined, 5.0 );

    var_1._id_0C72 = "marine1";
    var_2._id_0C72 = "marine2";
    var_1 _id_A510::_id_0C24( var_1, "getyourass" );
    wait 1;
    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["wereclear"] );
    common_scripts\utility::_id_384A( "evemy_helicopter_reinforcement_spawned" );
    wait 8;
    var_2 _id_A510::_id_0C24( var_2, "enemyair" );
    wait 0.05;
    level._id_6F7C _id_A510::_id_0C24( level._id_6F7C, "grabrpg" );
    wait 10;

    if ( isdefined( level.alleyfriends ) )
    {
        foreach ( var_4 in level.alleyfriends )
            common_scripts\utility::_id_0CDA( var_0, var_4 );
    }

    var_6 = _id_A5A4::_id_3CEF( level._id_0318._id_02E2, "allies", var_0 );
    var_6._id_0C72 = "marine1";
    var_6 _id_A510::_id_0C24( var_6, "rightflank" );

    if ( !var_2 ishero() )
        var_2 _id_A5A4::_id_8EA4();

    _id_A5A4::_id_1333( "allies" );
}

ishero()
{
    if ( !isdefined( self ) )
        return 0;

    if ( !isdefined( self._id_0398 ) )
        return 0;

    if ( self._id_0398 == "hero" )
        return 1;

    return 0;
}

fog_adjust()
{
    var_0 = getent( "fog_in", "targetname" );
    var_1 = getent( "fog_out", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        _func_182( 0, 2842, 0.642709, 0.626383, 0.5, 1, 3.0, 0.642709, 0.626383, 0.3, ( 0, 1, 0.4 ), 0.0, 180.0, 2.0 );
        var_1 waittill( "trigger" );
        _func_182( 0, 3842, 0.642709, 0.626383, 0.5, 1, 3.0, 0.642709, 0.626383, 0.3, ( 0, 1, 0.4 ), 0.0, 180.0, 2.0 );
    }
}

start_bog()
{
    _id_A5E8::_id_870C( "start_default_checkpoint" );
    spawn_starting_friendlies( "friendly_starting_spawner" );
    thread ignored_till_fastrope( "introchopper1" );
    thread ignored_till_fastrope( "introchopper2" );
    thread bog_enemies_retreat();

    while ( !isdefined( level.abrams ) )
        wait 0.05;

    thread tank_advancement_bog();
    thread first_friendly_advancement_trigger();
    thread bog_dialog();
    level._id_0318._id_01FF = 1;
    wait 6;
    level._id_0318._id_01FF = 0;
}

first_friendly_advancement_trigger()
{
    var_0 = getent( "first_friendly_advancement_trigger", "script_noteworthy" );
    var_0 endon( "trigger" );
    wait 3;

    if ( !isdefined( var_0 ) )
        return;

    var_0 notify( "trigger" );
}

start_arch()
{
    _id_A5E8::_id_870C( "aud_start_arch_checkpoint" );
    spawn_starting_friendlies( "friendly_starting_spawner_arch" );
    var_0 = getent( "playerstart_arch", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( ( 0, var_0.angles[1], 0 ) );
    wait 0.05;
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_58D7 ) && var_1[var_2]._id_58D7 )
            var_1[var_2] _id_A5A4::_id_8EA4();

        var_1[var_2] delete();
    }

    while ( !isdefined( level.abrams ) )
        wait 0.05;

    var_3 = _func_1EC( "tank_path_2", "targetname" );
    level.abrams _meth_8279( var_3 );
    thread tank_advancement_arch();
}

start_alley()
{
    _id_A5E8::_id_870C( "aud_start_alley_checkpoint" );
    spawn_starting_friendlies( "friendly_starting_spawner_alley" );
    var_0 = getent( "playerstart_alley", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( ( 0, var_0.angles[1], 0 ) );
    waitframe;
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_58D7 ) && var_1[var_2]._id_58D7 )
        {
            var_1[var_2] _id_A5A4::_id_8EA4();
            var_1[var_2] delete();
        }
    }

    thread friendlies_become_invulnerable();

    while ( !isdefined( level.abrams ) )
        wait 0.05;

    var_3 = _func_1EC( "tank_path_2", "targetname" );
    level.abrams _meth_8279( var_3 );
    wait 0.05;
    var_4 = _func_1EC( "stop_for_city_fight3", "script_noteworthy" );
    level.abrams _meth_80C7( var_4 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams _meth_827F( 0, 10 );
    thread tank_advancement_alley();
}

friendlies_become_invulnerable()
{
    thread friendly_reinforcements_magic_bullet();
    var_0 = _func_0D9( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_58D7 ) && var_0[var_1]._id_58D7 )
            continue;

        var_0[var_1] thread _id_A5A4::_id_58D7( undefined, undefined, 5.0 );
    }
}

start_ch46()
{
    _id_A5E8::_id_870C( "aud_start_ch46_checkpoint" );
    var_0 = getent( "seaknight_land_location", "script_noteworthy" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( ( 0, var_0.angles[1], 0 ) );
    waitframe;
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_58D7 ) && var_1[var_2]._id_58D7 )
            var_1[var_2] _id_A5A4::_id_8EA4();

        var_1[var_2] delete();
    }

    thread seaknight();
}

spawn_starting_friendlies( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2] _meth_8096();

        if ( _id_A5A4::_id_88F1( var_3 ) )
        {

        }

        var_3._id_01C4 = 32;

        if ( _func_120( var_3.classname, "vasquez" ) )
            level._id_6F7C = var_3;

        if ( _func_120( var_3.classname, "mark" ) )
            level.grigsby = var_3;

        if ( var_3 ishero() )
            var_3 thread _id_A5A4::_id_58D7( undefined, undefined, 5.0 );
    }

    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C _id_A5A4::_id_5926();
    level.grigsby._id_0C72 = "grigsby";
    level.grigsby _id_A5A4::_id_5926();
    level.grigsby._id_8FEC = 1.0;
    common_scripts\utility::_id_0D13( _func_0D9( "allies" ), _id_A5A4::_id_7402 );
}

ignored_till_fastrope( var_0 )
{
    var_1 = undefined;
    var_1 = getent( var_0, "targetname" );

    if ( _func_1A2( var_1 ) )
        var_1 = _id_A5A8::waittill_vehiclespawn( var_0 );

    _id_A5E8::_id_870C( "start_mi17_sequence" );

    for ( var_2 = 0; var_2 < var_1._id_750A.size; var_2++ )
    {
        var_1._id_750A[var_2]._id_01FF = 1;
        var_1._id_750A[var_2] thread ignored_by_tank_cannon();
    }

    var_1 waittill( "unloading" );
    wait 5;

    if ( !isdefined( var_1 ) )
        return;

    for ( var_2 = 0; var_2 < var_1._id_750A.size; var_2++ )
    {
        if ( !isdefined( var_1._id_750A[var_2] ) )
            continue;

        if ( !_func_1A1( var_1._id_750A[var_2] ) )
            continue;

        var_1._id_750A[var_2]._id_01FF = 0;
        var_1._id_750A[var_2] thread ignored_by_tank_cannon( 0 );
    }
}

stragglers_chase()
{
    var_0 = getent( self._id_04A4, "targetname" );
    self waittill( "trigger" );
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !var_1[var_2] _meth_80AB( var_0 ) )
            continue;

        var_1[var_2]._id_01C4 = 600;
        var_1[var_2] _meth_81AB( level._id_0318 );
    }
}

truck_crush_tank_in_position()
{
    var_0 = _func_1EC( "truck_crush_node", "script_noteworthy" );
    var_0 waittill( "trigger" );
    level.abrams _meth_827F( 0, 999999999, 999999999 );
    common_scripts\utility::_id_383F( "truck_crush_tank_in_position" );
}

truck_tank_collide_think( var_0, var_1, var_2 )
{
    var_3 = _func_1EC( var_1, "script_noteworthy" );
    var_3 waittill( "trigger" );

    if ( isdefined( var_2 ) )
        wait(var_2);

    level endon( var_0 + "_stop_collide_think" );
    var_4 = getent( var_0 + "_tank_collide_trigger", "targetname" );

    for (;;)
    {
        var_4 waittill( "trigger", var_5 );

        if ( var_5 == level._id_0318 )
        {
            level._id_0318 _meth_8054();
            break;
        }
    }
}

chain_and_home()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    var_0 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

    if ( var_0 > 1024 )
        var_0 = 1024;

    for (;;)
    {
        wait 5;
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

rpg_tank_shooter()
{
    self endon( "death" );

    if ( isdefined( self._id_0398 ) && self._id_0398 != "rpg_tank_shooter_noignore" )
        self._id_01FF = 1;

    self waittill( "goal" );

    if ( isdefined( self._id_0398 ) && self._id_0398 == "rpg_tank_shooter_fall" )
    {
        if ( getdvar( "ragdoll_enable" ) == "1" )
            thread roof_guy_fall_on_death();
    }

    self _meth_816B( level.abrams );
    wait 10;

    if ( isdefined( self ) )
        self _meth_816A();
}
#using_animtree("generic_human");

roof_guy_fall_on_death()
{
    self endon( "death" );
    self._id_01E6 = 10;

    for (;;)
    {
        self._id_2652 = %bog_b_rpg_fall_death;
        wait 0.05;
    }
}

attack_troops()
{
    self notify( "stop_attacking_troops" );
    self endon( "stop_attacking_troops" );
    self endon( "death" );
    wait 1;

    for (;;)
    {
        wait(_func_0B5( 2, 5 ));
        var_0 = _id_A53F::_id_3F7F( 10000, level._id_2235["80"], 1, 0, 0, 1 );

        if ( !isdefined( var_0 ) )
            continue;

        var_1 = _func_0BE( var_0._id_02E2[2] - self._id_02E2[2] );
        var_2 = _func_0EE( var_0._id_02E2, self._id_02E2 );
        var_3 = _func_0B9( var_1 / var_2 );

        if ( var_3 > 15 )
            continue;

        var_4 = var_0._id_02E2 + ( 0, 0, 32 );
        self _meth_825D( var_4 );

        if ( getdvar( "bog_debug_tank" ) == "1" )
            thread _id_A5A4::_id_2DBF( level.abrams._id_02E2 + ( 0, 0, 32 ), var_4, 1, 0, 0, self, "stop_drawing_line" );

        common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 3.0 );
        self _meth_825F();

        if ( getdvar( "bog_debug_tank" ) == "1" )
        {
            self notify( "stop_drawing_line" );
            thread _id_A5A4::_id_2DBF( level.abrams._id_02E2 + ( 0, 0, 32 ), var_4, 0, 1, 0, self, "stop_drawing_line" );
        }

        if ( getdvar( "bog_debug_tank" ) == "1" )
            self notify( "stop_drawing_line" );
    }
}

tank_turret_forward()
{
    getent( "tank_turret_forward", "targetname" ) waittill( "trigger" );
    self notify( "stop_attacking_troops" );
    self _meth_825E( self.forwardent );
    common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 4.0 );
    self _meth_825F();
}

ambush_ahead_dialog()
{
    _id_A5A4::_id_1332( "allies" );
    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["possibleambush"] );
    wait 1;
    level._id_6F7C _id_A510::_id_0C24( level._id_6F7C, "watchrooftops" );
    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["standclear"] );
    _id_A5A4::_id_1333( "allies" );
    common_scripts\utility::_id_383F( "tank_clear_to_shoot" );
}

playradiosound( var_0 )
{
    if ( !isdefined( level.radio_in_use ) )
        level.radio_in_use = 0;

    var_1 = 0;
    var_1 = playaliasoverradio( var_0 );

    if ( var_1 )
        return;

    level.radioforcedtransmissionqueue[level.radioforcedtransmissionqueue.size] = var_0;

    while ( !var_1 )
    {
        if ( level.radio_in_use )
            level waittill( "radio_not_in_use" );

        var_1 = playaliasoverradio( level.radioforcedtransmissionqueue[0] );

        if ( !level.radio_in_use && !var_1 )
        {

        }
    }

    level.radioforcedtransmissionqueue = _id_A5A4::_id_0CFA( level.radioforcedtransmissionqueue, 0 );
}

playaliasoverradio( var_0 )
{
    if ( level.radio_in_use )
        return 0;

    level.radio_in_use = 1;
    level._id_0318 _meth_82F1( var_0, "playSoundOverRadio_done" );
    level._id_0318 waittill( "playSoundOverRadio_done" );
    level.radio_in_use = 0;
    level.lastradiotransmission = gettime();
    level notify( "radio_not_in_use" );
    return 1;
}

shoot_buildings( var_0 )
{
    self notify( "stop_attacking_troops" );
    common_scripts\utility::_id_384A( "tank_clear_to_shoot" );

    for (;;)
    {
        if ( level.exploderarray[var_0].size <= 0 )
            break;

        var_1 = undefined;
        var_1 = getnextexploder( var_0 );

        if ( !isdefined( var_1 ) )
        {
            wait(_func_0B3( 2 ));
            continue;
        }

        shoot_exploder( level.exploderarray[var_0][var_1] );
        level.exploderarray[var_0] = _id_A5A4::_id_0CFA( level.exploderarray[var_0], var_1 );
        wait(_func_0B3( 6 ));
    }

    self notify( "abrams_shot_explodergroup" );
}

setupexploder( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.inumber = _func_0BC( var_0 );
    var_3.snumber = _id_A5A4::_id_8F53( var_0 );
    var_4 = getentarray( "exploder_tank_target", "targetname" );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( var_4[var_5]._id_0398 == var_3.snumber )
            var_3._id_02E2 = var_4[var_5]._id_02E2;
    }

    var_6 = getentarray( "exploder_area", "targetname" );

    for ( var_5 = 0; var_5 < var_6.size; var_5++ )
    {
        if ( var_6[var_5]._id_0398 == var_3.snumber )
            var_3.areatrig = var_6[var_5];
    }

    var_3.impact_detector = getent( "exploder_detectimpact_" + var_3.snumber, "targetname" );

    if ( isdefined( var_3.impact_detector ) )
        var_3.impact_detector _meth_82BB();

    var_3.explodedfunction = var_1;
    var_3._id_6691 = var_2;
    return var_3;
}

getnextexploder( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level.exploderarray[var_0].size; var_2++ )
    {
        if ( isdefined( level.exploderarray[var_0][var_2].areatrig ) && level._id_0318 _meth_80AB( level.exploderarray[var_0][var_2].areatrig ) )
            continue;

        var_1[var_1.size] = var_2;
    }

    if ( var_1.size == 0 )
        return undefined;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = common_scripts\utility::_id_A347( level._id_0318 _meth_80AA(), level._id_0318 _meth_8338(), level.exploderarray[var_0][var_1[var_2]]._id_02E2, level._id_2235["35"] );

        if ( var_3 )
            return var_1[var_2];
    }

    return var_1[0];
}

shoot_exploder( var_0 )
{
    level.abrams thread tank_shooting_exploder_dialog( var_0.inumber );
    level.abrams waittill( "target_aquired" );
    level.abrams _meth_825D( var_0._id_02E2 );
    level.abrams common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 3.0 );
    level.abrams _meth_825F();
    level.abrams.readytofire = 1;
    common_scripts\utility::_id_384A( "allowTankFire" );
    level.abrams.readytofire = undefined;
    level.abrams _meth_8264();
    level.abrams maps\bog_b_anim::shoot_m1a1_anim();
    _func_1C7( "tank_fire", level.abrams._id_02E2 );
    common_scripts\utility::_id_3831( "allowTankFire" );

    if ( getdvarint( "use_old_exploderdelay" ) )
        wait 0.2;
    else
        shoot_exploder_wait( var_0 );

    common_scripts\_exploder::_id_3528( var_0.inumber );
    _func_1C7( "tank_impact", var_0._id_02E2 );

    if ( isdefined( var_0.explodedfunction ) )
    {
        if ( isdefined( var_0._id_6691 ) )
            level thread [[ var_0.explodedfunction ]]( var_0._id_6691 );
        else
            level thread [[ var_0.explodedfunction ]]();
    }

    wait 0.05;
    _func_18A( 1 );
    _func_189( var_0._id_02E2, 300, 5000, 1000 );
    wait 0.2;
    _func_18A( 0 );
}

shoot_exploder_wait( var_0 )
{
    var_1 = _func_0EE( var_0._id_02E2, level.abrams._id_02E2 );
    var_2 = var_1 / 10000.0;
    var_2 += 0.05;
    thread shoot_exploder_detect_impact( var_0 );
    level common_scripts\utility::_id_A073( var_2, "shoot_exploder_detected_impact" );
    level notify( "shoot_exploder_wait_complete" );
}

shoot_exploder_detect_impact( var_0 )
{
    level endon( "shoot_exploder_wait_complete" );

    if ( !isdefined( var_0.impact_detector ) )
        return;

    shoot_exploder_detect_damage( var_0.impact_detector, "script_vehicle_m1a1_abrams" );
    var_0.impact_detector delete();
    level notify( "shoot_exploder_detected_impact" );
}

shoot_exploder_detect_damage( var_0, var_1 )
{
    for (;;)
    {
        var_0 _meth_82BA();
        var_0 _meth_82BC( 1 );
        var_0 waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3.classname != var_1 )
            continue;

        if ( var_6 != "MOD_PROJECTILE" )
            continue;

        if ( var_2 < 1000 )
            continue;

        break;
    }
}

tank_shooting_exploder_dialog( var_0 )
{
    if ( var_0 == 105 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up1"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["2story1_ground"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired1"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else if ( var_0 == 104 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up2"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["2story1_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired2"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else if ( var_0 == 102 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up3"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["3story11_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired3"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else if ( var_0 == 103 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up4"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["3story1130_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired1"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else if ( var_0 == 100 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up1"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["3story11_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired2"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else if ( var_0 == 101 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up1"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["3story1230_2ndfloor"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired2"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else if ( var_0 == 200 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up1"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired2"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else if ( var_0 == 201 )
    {
        self.haltfire = 1;
        level._id_0318 playradiosound( level._id_78BA["tank_loader"]["up3"] );
        self notify( "target_aquired" );

        while ( !isdefined( self.readytofire ) )
            wait 0.05;

        level._id_0318 playradiosound( level._id_78BA["tank_gunner"]["targetacquired1"] );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["fire"] );
    }
    else
    {
        wait 0.05;
        self notify( "target_aquired" );
        wait 0.05;
    }

    self.readytofire = 1;
    common_scripts\utility::_id_383F( "allowTankFire" );
}

_id_537D( var_0 )
{
    thread _id_A581::_id_533A( var_0 );
}

alley_dumpster_sequence()
{
    var_0 = getent( "start_dumpster_sequence", "script_noteworthy" );
    var_0 waittill( "trigger" );
    var_1 = getent( "post_archway_color_trigger", "targetname" );
    var_1 common_scripts\utility::_id_97CC();
    wait 0.05;
    var_2 = _func_0C3( "vasquez_dumpster_node", "targetname" );
    level._id_6F7C _meth_81A9( var_2 );
    level._id_6F7C.force_crouch = 1;
    wait 0.05;
    level._id_6F7C thread wait_to_reach_dumpster_node();
    level._id_6F7C _id_A5A4::_id_2A74();
    _id_A5A4::arcademode_checkpoint( 2.0, "alley" );
    thread friendlies_become_invulnerable();
    wait 0.05;
    level.alleyfriends = _id_A5A4::_id_3D7A( "allies", "r" );

    foreach ( var_4 in level.alleyfriends )
    {
        var_4._id_01D1 = 0;
        var_4._id_0200 = 1;
        var_4._id_2AF7 = 1;
        var_4._id_01FD = 1;
        var_4._id_2D38 = 1;
        var_4.a._id_2B20 = 1;
        var_4.allowpain = 0;
        var_4._id_38A8 = 1;
        var_4 _meth_81A7( 1 );
    }

    var_6 = undefined;

    for ( var_7 = 0; var_7 < level.alleyfriends.size; var_7++ )
    {
        if ( level.alleyfriends[var_7] == level._id_6F7C )
            continue;

        var_6 = level.alleyfriends[var_7];
        break;
    }

    var_6._id_0C72 = "dumpsterGuy";
    var_6 _id_A5A4::_id_2A74();
    var_6 _id_A5A4::_id_5926();

    if ( !isdefined( var_6._id_58D7 ) )
        var_6 thread _id_A5A4::_id_58D7();

    var_8 = getent( "dumpster", "targetname" );
    var_8._id_0C72 = "dumpster";
    var_8 _meth_8117( level._id_78B1["dumpster"] );
    var_9 = getent( "dumpster_clip", "targetname" );
    var_2 = spawn( "script_origin", var_8._id_02E2 );
    var_2.angles = var_8.angles;
    var_8 thread updateclippos( var_9 );
    var_10 = getent( "dumpster_new_model", "targetname" );

    if ( isdefined( var_10 ) )
    {
        var_8 _meth_8056();
        var_10 _meth_804F( var_8 );
    }

    var_6 thread _id_A5A4::_id_7E60( 1 );
    level._id_6F7C thread _id_A5A4::_id_7E60( 1 );
    var_6 _meth_81CE( "crouch" );
    var_2 _id_A510::_id_0BFF( var_6, "dumpster_peek" );
    var_11 = [];
    var_11[var_11.size] = var_6;
    var_11[var_11.size] = var_8;
    var_8 thread _id_A5A4::_id_69C4( "scn_bog_dumpster_peek" );
    var_2 _id_A510::_id_0C18( var_11, "dumpster_peek" );
    var_2 thread _id_A510::_id_0BE1( var_6, "dumpster_idle2", undefined, "stop_idle" );
    level thread dumpsterguy_push_condition1( var_6 );
    level thread dumpsterguy_push_condition2( var_6 );
    level thread dumpsterguy_push_condition3( var_6 );
    common_scripts\utility::_id_384A( "start_dumpster_push" );
    common_scripts\utility::_id_384A( "vasquez_in_position" );
    level._id_6F7C.overridemovemode = "run";
    var_8 _id_A510::_id_0BFF( level._id_6F7C, "dumpster_push" );
    var_11[var_11.size] = level._id_6F7C;
    var_8 thread _id_A5A4::_id_69C4( "scn_bog_dumpster_push" );
    var_8 thread _id_A510::_id_0C24( level._id_6F7C, "dumpster_push" );
    var_12 = 0.35;
    wait(var_12);
    var_6 notify( "stop_idle" );
    var_2 notify( "stop_idle" );
    var_8 thread _id_A510::_id_0C24( var_8, "dumpster_push" );
    var_8 _id_A510::_id_0C24( var_6, "dumpster_push" );
    level._id_6F7C.overridemovemode = undefined;
    level._id_6F7C.force_crouch = undefined;
    var_8 notify( "stop_updating_clip" );
    var_9 _meth_8059();
    var_6 _meth_81CE( "crouch", "stand", "prone" );
    level._id_6F7C _meth_81A9( _func_0C3( "dumpster_push_afternode_dumpsterguy", "targetname" ) );
    var_6 _meth_81A9( _func_0C3( "dumpster_push_afternode_vasquez", "targetname" ) );
    level._id_6F7C _id_A5A4::_id_309A();
    var_6 _id_A5A4::_id_309A();
    remove_alley_seperation_clip();
    common_scripts\utility::_id_383F( "dumpster_pushed" );
}

remove_alley_seperation_clip()
{
    var_0 = getent( "alley_seperation_clip", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 _meth_805A();
    var_0 delete();
}

dumpsterguy_push_condition1( var_0 )
{
    var_0 endon( "start_dumpster_push" );
    var_0 _id_A5A4::_id_A0AC( level._id_2235["65"] );
    common_scripts\utility::_id_383F( "start_dumpster_push" );
    var_0 notify( "start_dumpster_push" );
}

dumpsterguy_push_condition2( var_0 )
{
    var_0 endon( "start_dumpster_push" );
    common_scripts\utility::_id_384A( "alley_cleared" );
    common_scripts\utility::_id_383F( "start_dumpster_push" );
    var_0 notify( "start_dumpster_push" );
}

dumpsterguy_push_condition3( var_0 )
{
    var_0 endon( "start_dumpster_push" );
    common_scripts\utility::_id_384A( "player_passed_dumpster" );
    common_scripts\utility::_id_383F( "start_dumpster_push" );
    var_0 notify( "start_dumpster_push" );
}

updateclippos( var_0 )
{
    self endon( "stop_updating_clip" );
    var_0._id_02E2 = self._id_02E2;
    var_0.angles = self.angles;

    for (;;)
    {
        var_0 _meth_82AA( self._id_02E2, 0.1 );
        var_0 _meth_82B1( ( 0, self.angles[1], 0 ), 0.1 );
        wait 0.1;
    }
}

wait_to_reach_dumpster_node()
{
    common_scripts\utility::_id_383D( "vasquez_in_position" );
    var_0 = _func_0C3( "vasquez_dumpster_node", "targetname" );

    while ( _func_0F0( self._id_02E2, var_0._id_02E2 ) > 250000 )
        wait 0.05;

    self.pushplayer = 1;
    self._id_01FB = 1;

    while ( _func_0F0( self._id_02E2, var_0._id_02E2 ) > 100 )
        wait 0.05;

    self.pushplayer = undefined;
    self._id_01FB = 0;
    wait 1.5;
    common_scripts\utility::_id_383F( "vasquez_in_position" );
}

alley_cleared()
{
    _id_A5A4::_id_A066( "0" );
    common_scripts\utility::_id_383F( "alley_cleared" );
    _id_A5E8::_id_870C( "start_decrease_ambiance" );
    common_scripts\utility::_id_384A( "dumpster_pushed" );
    getent( "alley_protect_door_breech_color_trigger", "targetname" ) notify( "trigger" );
    var_0 = level.alleyfriends[0];

    if ( var_0 == level._id_6F7C )
        var_0 = level.alleyfriends[1];

    alley_door_kick( var_0 );
    thread advancealleyfriendliestoend( level.alleyfriends[0], level.alleyfriends[1], level.alleyfriends[2] );
    common_scripts\utility::_id_3831( "aa_bog_b_zone_alley" );
    _id_A5E8::_id_870C( "lastSequence_submix" );
}

alley_door_kick( var_0 )
{
    var_1[0] = var_0;
    var_1[1] = level._id_6F7C;
    var_1[0]._id_0C72 = "alley_door_kicker_left";
    var_1[1]._id_0C72 = "alley_door_kicker_right";
    var_2 = getent( "alley_door_scripted_node", "targetname" );

    if ( getdvarint( "use_old_door_breach" ) == 1 )
    {
        thread alley_door_guy1_idle( var_2, var_1[0] );
        alley_door_vasquez_wait_on_other( var_1[0], var_2._id_02E2 );
        var_1[1]._id_0C72 = "alley_door_kicker_right";
        var_2 _id_A510::_id_0BFF( var_1[1], "enter" );
        common_scripts\utility::_id_384A( "door_idle_guy_idling" );
        var_1[0] notify( "stop_door_idle" );
        var_1[0]._id_0C72 = "alley_door_kicker_left";
        var_1[1]._id_0C72 = "alley_door_kicker_right";
        var_2 _id_A510::_id_0C18( var_1, "enter" );
    }
    else
    {
        level._id_6F7C._id_0C72 = "price";
        var_0._id_0C72 = "alley_breach_buddy";
        var_3 = spawn( "script_origin", ( 3966, -4898, -111.97 ) );
        var_4 = [];
        var_4[0] = "at_alley_breach_price";
        var_4[1] = "at_alley_breach_alley_breach_buddy";
        var_3 thread anim_reach_orient_and_play( level._id_6F7C, "alley_breach", var_4, "exposed" );
        var_3 anim_reach_orient_and_play( var_0, "alley_breach", var_4, "right" );
    }

    getent( "last_color_order_trigger", "targetname" ) notify( "trigger" );
    thread alley_door_remove_player_clip();
}

anim_reach_orient_and_play( var_0, var_1, var_2, var_3 )
{
    var_0 _id_A5A4::_id_2A74();
    var_0 thread breach_cqb_wait();
    _id_A510::anim_reach_and_arrive_facing_anim_solo( var_0, var_1, var_3, 0.3 );
    common_scripts\utility::_id_383F( "at_" + var_1 + "_" + var_0._id_0C72 );

    while ( !common_scripts\utility::_id_386B( var_2 ) )
        waittillframeend;

    _id_A510::_id_0C24( var_0, var_1 );
    var_0 _id_A5A4::_id_2A8D();
}

breach_cqb_wait()
{
    var_0 = 122500;

    for ( var_1 = _func_0F0( self._id_02E2, ( 3966, -4898, -111.97 ) ); var_1 > var_0; var_1 = _func_0F0( self._id_02E2, ( 3966, -4898, -111.97 ) ) )
        wait 0.2;

    _id_A5A4::_id_30B0();
}

alley_door_vasquez_wait_on_other( var_0, var_1 )
{
    level._id_6F7C waittill( "goal" );
    var_2 = 400;
    var_3 = _func_0F0( var_0._id_02E2, var_1 );

    while ( var_3 > var_2 * var_2 )
    {
        var_3 = _func_0F0( var_0._id_02E2, var_1 );
        wait 0.2;
    }
}

alley_door_remove_player_clip( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    getent( "alley_door_player_clip", "targetname" ) delete();
}

alley_door_guy1_idle( var_0, var_1 )
{
    var_0 _id_A510::_id_0BF7( var_1, "idle_reach", "idle", "stop_door_idle" );
    common_scripts\utility::_id_383F( "door_idle_guy_idling" );
}

alley_dooropen( var_0 )
{
    var_1 = getent( "alley_door", "targetname" );
    var_1 _meth_805A();
    var_1 thread common_scripts\utility::_id_69C2( "metal_door_kick" );
    var_1 _meth_82B3( -140, 0.5, 0, 0 );
    wait 0.5;
    var_1 _meth_8059();
}

_id_391D()
{
    if ( getdvar( "bog_b_min_spec" ) == "1" )
        return;

    var_0 = getentarray( self._id_04A4, "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        thread flyby_go( var_0[var_1] );
}

flyby_go( var_0 )
{
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_2 = ( ( var_0._id_02E2[0] + var_1._id_02E2[0] ) / 2, ( var_0._id_02E2[1] + var_1._id_02E2[1] ) / 2, 0 );
    var_3 = _func_115( var_1._id_02E2 - var_0._id_02E2 );
    var_4 = ( 0, var_3[1], 0 );
    var_5 = -20000;
    var_6 = 20000;
    var_7 = 4000;
    var_8 = var_2 + anglestoforward( var_4 ) * var_5;
    var_8 += ( 0, 0, var_0._id_02E2[2] );
    var_9 = var_2 + anglestoforward( var_4 ) * var_6;
    var_9 += ( 0, 0, var_1._id_02E2[2] );
    self waittill( "trigger" );
    var_10 = spawn( "script_model", var_8 );
    var_10 _meth_80B3( "vehicle_av8b_harrier_jet" );
    var_10.angles = var_4;
    var_11 = _func_0BE( var_5 - var_6 );
    var_12 = var_11 / var_7;
    var_10 _meth_82AA( var_9, var_12, 0, 0 );
    playfxontag( level._id_058F["contrail"], var_10, "tag_right_wingtip" );
    playfxontag( level._id_058F["contrail_02"], var_10, "tag_left_wingtip" );
    thread flyby_planesound( var_10 );
    wait(var_12);
    var_10 notify( "delete" );
    var_10 delete();
}

flyby_afterburner( var_0 )
{
    var_0 endon( "delete" );
    wait(_func_0B5( 0.5, 2.5 ));
    playfxontag( level._id_058F["afterburner"], var_0, "tag_engine_right" );
    playfxontag( level._id_058F["afterburner"], var_0, "tag_engine_left" );
}

flyby_planesound( var_0 )
{
    var_0 thread common_scripts\utility::_id_6975( "veh_mig29_dist_loop" );

    while ( !_id_A632::_id_6CD2( var_0 ) )
        wait 0.05;

    var_0 notify( "stop soundveh_mig29_dist_loop" );
    var_0 thread common_scripts\utility::_id_6975( "veh_mig29_close_loop" );
    var_0 thread _id_A5A4::_id_69C4( "veh_mig29_passby" );

    while ( _id_A632::_id_6CD3( var_0 ) )
        wait 0.05;

    wait 0.5;
    var_0 thread common_scripts\utility::_id_69C2( "veh_mig29_sonic_boom" );
    thread flyby_afterburner( var_0 );

    while ( _id_A632::_id_6CD2( var_0 ) )
        wait 0.05;

    var_0 notify( "stop soundveh_mig29_close_loop" );
    var_0 thread common_scripts\utility::_id_6975( "veh_mig29_dist_loop" );
    var_0 waittill( "delete" );
    var_0 notify( "stop soundveh_mig29_dist_loop" );
}

teamssplitup()
{
    getent( "teams_split_up", "script_noteworthy" ) waittill( "trigger" );
    var_0 = getent( "price_inside_split_up_house", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 == level._id_6F7C )
            break;
    }

    level._id_6F7C._id_0C72 = "price";
    _id_A510::_id_0C24( level._id_6F7C, "keeppinned" );

    if ( isdefined( level.grigsby ) )
    {
        level.grigsby._id_0C72 = "grigsby";
        thread _id_A510::_id_0C24( level.grigsby, "staysharp" );
    }

    thread friendly_reinforcements_magic_bullet();
    var_2 = _func_0D9( "allies" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] _id_A5A4::_id_7E60( 1 );

        if ( isdefined( var_2[var_3]._id_58D7 ) && var_2[var_3]._id_58D7 )
            continue;

        var_2[var_3] thread _id_A5A4::_id_58D7( undefined, undefined, 5.0 );
    }

    common_scripts\utility::_id_3831( "aa_bog_b_zone_streets" );
    common_scripts\utility::_id_383F( "aa_bog_b_zone_alley" );
}

lastsequence()
{
    thread t72_kill_player_trigger();

    if ( getdvarint( "use_old_t72battle" ) )
        thread t72_in_final_position_preh1();
    else
        thread t72_in_final_position();

    common_scripts\utility::_id_384A( "price_at_spotter" );
    level._id_6F7C._id_615B = 1;
    common_scripts\utility::_id_384A( "ok_to_do_spotting" );
    _id_A5A4::arcademode_checkpoint( 3.0, "t72" );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C _id_A510::_id_0C24( level._id_6F7C, "casual_2_spot" );
    level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "spot", undefined, "stop_idle" );
    level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "t72behind" );
    wait 3;
    common_scripts\utility::_id_383F( "abrams_move_shoot_t72" );

    if ( getdvarint( "use_old_t72battle" ) )
    {
        wait 3.0;
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["switchmanual"] );
    }
    else
    {
        wait 4.0;
        level._id_0318 thread playradiosound( level._id_78BA["tank_commander"]["switchmanual"] );
        wait 2.5;
        level.abrams _meth_825E( level.t72, ( 0, 0, 50 ) );
    }

    if ( getdvarint( "use_old_celebration" ) == 1 )
        thread finalgenericdialog();
    else
        thread finalgenericdialog_h1();

    common_scripts\utility::_id_384A( "tank_in_final_position" );
    common_scripts\utility::_id_384A( "tank_turret_aimed_at_t72" );
    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["takeshot"] );
    level.abrams _meth_825F();
    level.abrams _meth_8263( "m1a1_turret_blank" );
    wait 0.05;
    level.t72 notify( "exploding" );
    level.t72 _id_A5A8::_id_5BD2();
    level.abrams _meth_8264();
    level.abrams maps\bog_b_anim::shoot_m1a1_anim();
    level notify( "t72_exploded" );
    common_scripts\_exploder::_id_3528( 400 );
    _id_A5E8::_id_870C( "start_t72_wall_explode_mix" );
    level._id_0318._id_01FF = 0;

    for ( var_0 = 0; var_0 < level.alleyfriends.size; var_0++ )
        level.alleyfriends[var_0]._id_01FF = 0;

    var_1 = getentarray( "end_sequence_physics_explosion", "targetname" );

    for ( var_0 = 0; var_0 < var_1.size; var_0++ )
        _func_17E( var_1[var_0]._id_02E2, 550, 100, 1.2 );

    wait 0.2;
    level thread t72_explosion_explode();
    level thread enemies_fall_back();
    common_scripts\utility::_id_384A( "friendly_reactions_over" );
    level._id_6F7C._id_0C72 = "price";

    if ( getdvarint( "use_old_celebration" ) == 1 )
    {
        _id_A510::_id_0C24( level._id_6F7C, "niceshootingpig" );
        level._id_0318 playradiosound( level._id_78BA["tank_commander"]["comingthrough"] );
        common_scripts\utility::_id_383F( "abrams_advance_to_end_level" );
        wait 2;
    }
    else
    {
        level._id_6F7C waittillmatch( "single anim", "end" );
        common_scripts\utility::_id_383F( "abrams_advance_to_end_level" );
    }

    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["wethereyet"] );
    level._id_0318 playradiosound( level._id_78BA["hq_radio"]["statusover"] );
    level._id_6F7C._id_0C72 = "price";
    _id_A510::_id_0C24( level._id_6F7C, "cargo" );
    level._id_6F7C notify( "stop_idle" );
    level._id_6F7C._id_615B = undefined;
    thread seaknight();
}

t72_kill_player_trigger()
{
    level endon( "t72_exploded" );
    var_0 = getent( "t72_kill_player_trigger", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !_func_1AD( var_1 ) )
            continue;

        var_2 = level._id_0318._id_01E6 / 3;

        while ( _func_1A1( level._id_0318 ) )
        {
            wait 0.1;

            if ( isdefined( level.t72 ) )
            {
                level.t72 thread _id_A5A4::_id_69C4( "t72_fire" );
                level._id_0318 _meth_8053( var_2, level.t72._id_02E2 );
                continue;
            }

            thread common_scripts\utility::_id_69C2( "t72_fire", ( 6105, -3475, -60 ) );
            level._id_0318 _meth_8053( var_2, level._id_0318._id_02E2 );
        }

        level notify( "new_quote_string" );
        setdvar( "ui_deadquote", "@BOG_B_T72_MG_DEATH" );
    }
}

t72_explosion_explode()
{
    level.t72 _meth_8056();
    var_0 = level.t72._id_5BD5;
    var_1 = spawn( "script_model", level.t72._id_02E2 );
    var_1.angles = level.t72.angles;
    var_1 _meth_80B3( level.t72._id_029C );
    level.t72 = var_1;
    var_1 = undefined;
    _id_A5E8::_id_870C( "start_t72_hit_mix" );
    level.t72 _meth_8468( "mtl_h1_t72_tread", "mtl_h1_t72_tread_static" );
    level.t72 thread common_scripts\utility::_id_69C2( "bog_scn_tankturret_brew" );
    level.t72 thread t72_explosionfx();
    level.t72 _meth_8117( level._id_78B1["tank_explosion"] );
    level.t72 _meth_8113( "tank_explosion_anim1", level._id_78AC["tank"]["explosion1"], 1, 0.1, 1 );
    level.t72 waittillmatch( "tank_explosion_anim1", "end" );
    level.t72 _meth_80B3( "vehicle_t72_tank_d_animated_sequence" );
    _func_18C( 0.6, 1.0, level.t72._id_02E2, 8000 );
    common_scripts\utility::_id_0D13( var_0, ::_id_9955 );
    level.t72 _meth_810F( "tank_explosion_anim2", level._id_78AC["tank"]["explosion2"], 1, 0.1, 1 );
    level.t72 waittillmatch( "tank_explosion_anim2", "turret_explosion" );
    _id_A5E8::_id_870C( "start_t72_explode_mix" );
}

t72_explosionfx()
{
    _func_17E( level.t72._id_02E2, 1000, 20, 2 );
    playfxontag( level._id_058F["t72_ammo_breach"], level.t72, "tag_deathfx" );
    _func_189( level.t72._id_02E2, 550, 30, 10 );
    wait 3.5;
    thread friendlyreactionanims();
    common_scripts\utility::_id_383F( "t72_exploded" );
    playfxontag( level._id_058F["t72_ammo_explosion"], level.t72, "tag_deathfx" );
    wait 0.15;
    _func_17E( level.t72._id_02E2, 1000, 100, 2 );
    _func_189( level.t72._id_02E2, 750, 100, 20 );
    wait 1.4;
    playfxontag( level._id_058F["firelp_large_pm"], level.t72, "tag_deathfx" );
    level.t72 thread common_scripts\utility::_id_6975( "fire_metal_large" );
}

_id_9955()
{
    self delete();
}

abrams_setup_t72()
{
    thread abrams_moveto_t72();
    thread abrams_aimat_t72();
}

abrams_moveto_t72()
{
    common_scripts\utility::_id_383F( "abrams_start_moving_after_city_fight" );
    thread abrams_moveto_t72_clearturret();
    level.abrams._id_A2FE = 1;
    level.abrams _meth_828D( 3 );
    level.abrams _meth_80C7( _func_1EC( "tank_shoots_t72_node", "script_noteworthy" ) );
    level.abrams waittill( "reached_wait_node" );
    level.abrams _meth_827F( 0, 1000, 1000 );
    common_scripts\utility::_id_383F( "tank_in_final_position" );
}

abrams_moveto_t72_clearturret()
{
    level.abrams notify( "stop_attacking_troops" );
    wait 0.05;
    level.abrams _meth_825E( level.abrams.forwardent );
    level.abrams common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 4.0 );
    level.abrams _meth_825F();
}

abrams_aimat_t72()
{
    common_scripts\utility::_id_384A( "t72_in_final_position" );
    common_scripts\utility::_id_384A( "tank_in_final_position" );
    level.abrams notify( "stop_attacking_troops" );
    level.abrams _meth_825D( level.t72._id_02E2 + ( 0, 0, 50 ) );

    if ( getdvarint( "use_old_t72battle" ) )
        level.abrams common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 3.0 );
    else
        wait 0.25;

    common_scripts\utility::_id_383F( "tank_turret_aimed_at_t72" );
}

enemies_fall_back()
{
    thread _id_537D( 8 );
    var_0 = _func_0C3( "enemy_fallback_node", "targetname" );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::enemies_fall_back_thread, var_0 );
    common_scripts\utility::_id_0D13( _func_0D9( "allies" ), ::friendlies_become_awesome );
}

enemies_fall_back_thread( var_0 )
{
    self._id_01C4 = var_0._id_0351;
    self._id_01E6 = 1;
    self _meth_81A9( var_0 );
}

friendlies_become_awesome()
{
    self._id_1300 = 5000;
    self._id_01D0 = 0;
}

friendly_reinforcements_magic_bullet()
{
    level notify( "friendly_reinforcements_magic_bullet" );
    level endon( "friendly_reinforcements_magic_bullet" );

    for (;;)
    {
        level waittill( "reinforcement_spawned", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( !_func_1A1( var_0 ) )
            continue;

        var_0 thread _id_A5A4::_id_58D7( undefined, undefined, 5.0 );
    }
}

getfivefriendliestimeout( var_0 )
{
    level endon( "got 5 friendlies" );
    wait(var_0);
}

finalgenericdialog()
{
    var_0 = _func_0D9( "allies" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == level._id_6F7C )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    level thread getfivefriendliestimeout( 8.0 );

    for (;;)
    {
        if ( var_1.size >= 5 )
            break;

        level waittill( "reinforcement_spawned", var_3 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( !_func_1A1( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    level notify( "got 5 friendlies" );
    var_1[0]._id_0C72 = "gm1";
    var_1[1]._id_0C72 = "gm2";
    var_1[2]._id_0C72 = "gm3";
    var_1[3]._id_0C72 = "gm4";
    var_1[4]._id_0C72 = "gm5";
    common_scripts\utility::_id_384A( "t72_exploded" );
    _id_A5E8::_id_870C( "lastSequence_celebration_submix" );
    wait 2;
    var_1[0]._id_0C72 = "gm1";
    var_1[1]._id_0C72 = "gm2";
    var_1[2]._id_0C72 = "gm3";
    var_1[3]._id_0C72 = "gm4";
    var_1[4]._id_0C72 = "gm5";
    thread _id_A510::_id_0C24( var_1[0], "wooyeah" );
    wait 1.5;
    thread _id_A510::_id_0C24( var_1[1], "holyshit" );
    wait 1.75;
    thread _id_A510::_id_0C24( var_1[3], "yeahwoo" );
    wait 1.5;
    thread _id_A510::_id_0C24( var_1[4], "talkinabout" );
    wait 2.3;
    common_scripts\utility::_id_383F( "friendly_reactions_over" );
}

finalgenericdialog_h1()
{
    var_0 = _func_0D9( "allies" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == level._id_6F7C )
            continue;

        if ( isdefined( var_0[var_2]._id_0398 ) && var_0[var_2]._id_0398 == "doorblocker" )
            continue;

        if ( isdefined( var_0[var_2]._id_0398 ) && var_0[var_2]._id_0398 == "third_soldier" )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    for (;;)
    {
        if ( var_1.size >= 2 )
            break;

        level waittill( "reinforcement_spawned", var_3 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( !_func_1A1( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    var_1[0]._id_0C72 = "gm2";
    var_1[1]._id_0C72 = "gm4";
    common_scripts\utility::_id_384A( "t72_exploded" );
    _id_A5E8::_id_870C( "lastSequence_celebration_submix" );
    wait 2;
    var_1[0]._id_0C72 = "gm2";
    var_1[1]._id_0C72 = "gm4";
    wait 1.5;
    thread _id_A510::_id_0C24( var_1[0], "holyshit" );
    wait 1.75;
    thread _id_A510::_id_0C24( var_1[1], "yeahwoo" );
    wait 3.8;
    common_scripts\utility::_id_383F( "friendly_reactions_over" );
}

friendlyreactionanims()
{
    var_0 = _func_0D9( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !_func_1A1( var_0[var_1] ) )
            continue;

        if ( var_0[var_1] == level._id_6F7C )
        {
            var_0[var_1] thread price_react_and_loop();
            continue;
        }

        if ( isdefined( var_0[var_1]._id_0398 ) && var_0[var_1]._id_0398 == "doorblocker" )
        {
            var_0[var_1] thread guard_react_and_celebrate();
            continue;
        }

        var_0[var_1]._id_0C72 = "casualcrouch";

        if ( getdvarint( "use_old_celebration" ) == 1 )
        {
            var_0[var_1] thread _id_A510::_id_0C24( var_0[var_1], "react" );
            continue;
        }

        if ( isdefined( var_0[var_1]._id_0398 ) && var_0[var_1]._id_0398 == "third_soldier" )
        {
            var_0[var_1] thread _id_A510::_id_0C24( var_0[var_1], "new_react" );
            continue;
        }

        var_0[var_1] thread _id_A510::_id_0C24( var_0[var_1], "react" );
    }
}

guard_react_and_celebrate()
{
    self._id_0C72 = "guard";

    if ( getdvarint( "use_old_celebration" ) == 1 )
    {
        _id_A510::_id_0C24( self, "react" );
        wait 1.0;
        thread _id_A510::_id_0C24( self, "celebrate" );
    }
    else
        _id_A510::_id_0C24( self, "new_react" );
}

price_react_and_loop()
{
    self notify( "stop_idle" );

    if ( getdvarint( "use_old_celebration" ) == 1 )
        _id_A510::_id_0C24( self, "react" );
    else
        _id_A510::_id_0C24( self, "new_react" );

    thread _id_A510::_id_0BE1( self, "spot", undefined, "stop_idle" );
}

advancealleyfriendliestoend( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_0 != level._id_6F7C )
        var_3 = var_0;
    else if ( var_1 != level._id_6F7C )
        var_3 = var_1;

    var_4 = undefined;

    if ( var_0 != level._id_6F7C && var_0 != var_3 )
        var_4 = var_0;
    else if ( var_1 != level._id_6F7C && var_1 != var_3 )
        var_4 = var_1;
    else if ( isdefined( var_2 ) && var_2 != level._id_6F7C && var_2 != var_3 )
        var_4 = var_2;

    if ( isdefined( var_4 ) )
        var_4._id_0398 = "third_soldier";

    level._id_0318._id_01FF = 1;

    for ( var_5 = 0; var_5 < level.alleyfriends.size; var_5++ )
        level.alleyfriends[var_5]._id_01FF = 1;

    remove_alley_seperation_clip();
    var_3 _id_A5A4::_id_7E38( "b" );
    var_3._id_01C4 = 16;
    var_6 = _func_0C3( "door_blocker_node", "targetname" );
    var_3 _meth_81A9( var_6 );
    var_3 thread doorblocker_anim_on_trigger( var_6 );
    var_3 thread doorblocker_reach_door();
    var_3._id_0398 = "doorblocker";
    var_7 = getent( "doorblocker_clip", "targetname" );
    var_7._id_02E2 = var_3 _meth_8184( "tag_origin" );
    var_7.angles = var_3 _meth_8185( "tag_origin" );
    var_7 _meth_804F( var_3, "tag_origin" );
    var_3._id_6AB4 = var_7;
    thread doorblocker_slow_trigger();
    level._id_6F7C _id_A5A4::_id_7E38( "o" );
    level._id_6F7C._id_01C4 = 16;
    level._id_6F7C _meth_81A9( _func_0C3( "price_last_node1", "targetname" ) );
    level._id_6F7C waittill( "goal" );

    if ( isdefined( var_4 ) )
        vasquez_wait_on_other_marine( var_4 );
    else
        wait 4.0;

    level._id_6F7C _meth_81A9( _func_0C3( "price_last_node2", "targetname" ) );
    level._id_6F7C waittill( "goal" );
    common_scripts\utility::_id_383F( "price_at_spotter" );
}

vasquez_wait_on_other_marine( var_0 )
{
    wait 2.0;
    var_1 = 22500;
    var_2 = _func_0F0( level._id_6F7C._id_02E2, var_0._id_02E2 );
    var_3 = var_2;
    var_4 = gettime();

    while ( var_2 <= var_3 && var_2 < var_1 )
    {
        wait 0.2;

        if ( !isdefined( var_0 ) )
            break;

        var_3 = var_2;
        var_2 = _func_0F0( level._id_6F7C._id_02E2, var_0._id_02E2 );

        if ( gettime() - var_4 > 6000 )
            break;
    }
}

doorblocker_anim_on_trigger( var_0 )
{
    var_1 = getent( "door_block_trigger", "targetname" );
    var_1 waittill( "trigger" );
    self._id_0C72 = "guard";
    var_0 _id_A510::_id_0BFF( self, "stop" );
    common_scripts\utility::_id_383F( "arrived_at_spotting" );
    thread disable_door_block_clip( getanimlength( level._id_78AC["guard"]["stop"] ) );
    _id_A5A4::_id_27EF( 0.8, _id_A510::_id_0C21, self, "stop_snd" );
    var_0 _id_A510::_id_0C24( self, "stop" );
    getent( "last_color_order_trigger2", "targetname" ) notify( "trigger" );
    common_scripts\utility::_id_383F( "ok_to_do_spotting" );
}

doorblocker_reach_door()
{
    self endon( "death" );
    self waittill( "goal" );
    common_scripts\utility::_id_383F( "doorblocker_reach_door" );

    if ( isdefined( self._id_6AB4 ) )
        self._id_6AB4 delete();
}

disable_door_block_clip( var_0 )
{
    wait(var_0 - 2.0);
    var_1 = getent( "door_block_clip", "targetname" );
    var_1 delete();
}

doorblocker_slow_trigger()
{
    var_0 = getent( "doorblocker_slow_trig", "targetname" );

    while ( !common_scripts\utility::_id_382E( "doorblocker_reach_door" ) )
    {
        if ( level._id_0318 _meth_80AB( var_0 ) )
        {
            if ( !isdefined( level._id_0318._id_3BC4 ) )
                thread _id_A5A4::_id_6C22( 124, 1 );
        }
        else if ( isdefined( level._id_0318._id_3BC4 ) )
        {
            _id_A5A4::_id_6C22( level._id_0318._id_3BC4, 0.5 );
            level._id_0318._id_3BC4 = undefined;
        }

        waittillframeend;
    }

    if ( isdefined( level._id_0318._id_3BC4 ) )
    {
        _id_A5A4::_id_6C22( level._id_0318._id_3BC4, 0.5 );
        level._id_0318._id_3BC4 = undefined;
    }
}

t72_in_final_position_preh1()
{
    level.t72 = _id_A5A8::waittill_vehiclespawn( "t72" );
    level.t72 waittill( "reached_end_node" );
    var_0 = getent( "exploder_300_target", "targetname" );
    level.t72 _meth_825E( var_0 );
    level.t72 common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 4.0 );
    level.t72 _meth_825F();
    level.t72 _meth_8264();
    level.t72 maps\bog_b_anim::shoot_t72_anim();
    common_scripts\_exploder::_id_3528( 300 );
    wait 2.0;
    var_1 = getent( "t72_aim_at_final_building_location", "targetname" );
    level.t72 _meth_825E( var_1 );
    level.t72 common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 4.0 );
    level.t72 _meth_825F();

    if ( getdvar( "bog_debug_tank" ) == "1" )
    {
        var_2 = level.t72 _meth_8184( "tag_flash" );
        var_3 = level.t72 _meth_8184( "tag_turret" );
        var_1 = getent( "t72_aim_at_final_building_location", "targetname" );
        var_4 = _func_0BE( var_2[2] - var_3[2] );
        var_5 = _func_0EE( var_2, var_3 );
        var_6 = _func_0B9( var_4 / var_5 );
        iprintlnbold( "UP: " + var_6 );
        var_7 = anglestoforward( level.t72.angles );
        var_8 = _func_114( var_1._id_02E2 - level.t72._id_02E2 );
        var_9 = _func_0BA( _func_0F6( var_7, var_8 ) );
        iprintlnbold( "LEFT: " + var_9 );
    }

    common_scripts\utility::_id_383F( "t72_in_final_position" );
}

t72_in_final_position()
{
    thread t72_exploder_detect_impact_init();
    level.t72 = _id_A5A8::waittill_vehiclespawn( "t72" );
    wait 8;
    var_0 = getent( "t72_entry_target", "targetname" );
    level.t72 _meth_825E( var_0 );
    level.t72 waittill( "reached_end_node" );

    if ( !common_scripts\utility::_id_382E( "arrived_at_spotting" ) )
    {
        common_scripts\utility::_id_384A( "arrived_at_spotting" );
        wait 1.5;
    }

    var_1 = getent( "exploder_300_target", "targetname" );
    level.t72 _meth_825E( var_1 );
    level.t72 common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 4.0 );
    level.t72 _meth_825F();
    wait 1;
    level.t72 _meth_8264();
    level.t72 maps\bog_b_anim::shoot_t72_anim();
    t72_exploder_detect_impact_delay();
    common_scripts\_exploder::_id_3528( 300 );
    thread sustain_fire();
    common_scripts\utility::_id_384A( "tank_in_final_position" );
    wait 0.8;
    var_2 = getent( "t72_aim_at_final_building_location", "targetname" );
    level.t72 _meth_825E( var_2 );
    common_scripts\utility::_id_383F( "t72_in_final_position" );
}

t72_exploder_detect_impact_init()
{
    if ( getdvarint( "use_old_exploderdelay" ) )
        return;

    level.t72_impact_detector = getent( "exploder_detectimpact_300", "targetname" );

    if ( !isdefined( level.t72_impact_detector ) )
        return;

    level.t72_impact_detector _meth_82BB();
}

t72_exploder_detect_impact_delay()
{
    if ( getdvarint( "use_old_exploderdelay" ) )
        return;

    if ( !isdefined( level.t72_impact_detector ) )
        return;

    shoot_exploder_detect_damage( level.t72_impact_detector, "script_vehicle_t72_tank" );
    level.t72_impact_detector delete();
}

sustain_fire()
{
    while ( !common_scripts\utility::_id_382E( "tank_in_final_position" ) )
    {
        wait(_func_0B4( 7, 10 ));

        if ( !common_scripts\utility::_id_382E( "tank_in_final_position" ) )
        {
            level.t72 _meth_8264();
            common_scripts\_exploder::_id_3528( 300 );
        }
    }
}

vehicle_path_disconnector()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_0 _meth_82BB();
    var_0._id_02E2 -= ( 0, 0, 1024 );
    var_1 = "tank_bad_place_brush_" + var_0 _meth_81B5();

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( var_2 _meth_8282() == 0 )
            continue;

        if ( !isdefined( var_0.pathsdisconnected ) )
        {
            var_0 _meth_82BA();
            badplace_brush( var_1, 0, var_0, "allies", "axis" );
            var_0 _meth_82BB();
            var_0.pathsdisconnected = 1;
        }

        thread vehicle_reconnects_paths( var_0, var_1 );
    }
}

vehicle_reconnects_paths( var_0, var_1 )
{
    var_0 notify( "waiting_for_path_reconnection" );
    var_0 endon( "waiting_for_path_reconnection" );
    wait 0.25;
    var_0 _meth_82BA();
    badplace_delete( var_1 );
    var_0 _meth_82BB();
    var_0.pathsdisconnected = undefined;
}

delete_ai_in_zone()
{
    var_0 = getent( self._id_04A4, "targetname" );
    self waittill( "trigger" );
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _meth_80AB( var_0 ) )
            var_1[var_2] delete();
    }
}

delete_all_axis()
{
    self waittill( "trigger" );
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_58D7 ) && var_0[var_1]._id_58D7 )
            var_0[var_1] _id_A5A4::_id_8EA4();

        var_0[var_1] delete();
    }
}

autosave_when_trigger_cleared()
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( !ai_touching_area( self ) )
            break;

        wait 3;
    }

    if ( !common_scripts\utility::_id_382E( "reached_alley_autosave" ) )
        thread dosavegame( self._id_0398 );
}

dosavegame( var_0 )
{
    if ( !savegame_redundancy_check() )
        return;

    _id_A5A4::_id_1143( var_0 );
}

savegame_redundancy_check()
{
    if ( !isdefined( level._id_55D6 ) )
        return 1;

    if ( level._id_55D6 + level.minimumtimebetweenautosaves * 1000 > gettime() )
        return 0;

    return 1;
}

waittill_zone_clear( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    while ( ai_touching_area( var_1 ) )
        wait 2;
}

ai_touching_area( var_0 )
{
    var_1 = _func_0D9( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _meth_80AB( var_0 ) )
            return 1;
    }

    return 0;
}

tank_advancement_bog()
{
    common_scripts\utility::_id_383D( "truck_crush_tank_in_position" );
    thread truck_crush_tank_in_position();
    thread truck_tank_collide_think( "truck1", "truck_tank_collide_node", 0.7 );
    level.abrams thread tank_turret_forward();
    level.abrams thread attack_troops();
    common_scripts\utility::_id_384A( "truck_crush_tank_in_position" );
    common_scripts\utility::_id_384A( "truck_crush_player_in_position" );
    thread dosavegame( "tank_crush" );
    var_0 = getent( "crunch_truck_1", "targetname" );
    var_1 = 10;

    for ( var_2 = 0; var_2 < var_1 * 20; var_2++ )
    {
        if ( common_scripts\utility::_id_A347( level._id_0318 _meth_80AA(), level._id_0318 _meth_8338(), var_0._id_02E2, level._id_2235["65"] ) )
            break;

        wait 0.05;
    }

    var_3 = _func_1EC( "tank_path_2", "targetname" );
    level.abrams _meth_828D( 5 );
    level.abrams notify( "newpath" );
    level thread _id_A5A4::_id_61FD( "truck1_stop_collide_think", 2.5 );
    var_0 thread swap_crush_material( level._id_78AC["truck"]["tank_crush"] );
    level.abrams _id_A5A8::tank_crush( var_0, var_3, level._id_78AC["tank"]["tank_crush"], level._id_78AC["truck"]["tank_crush"], level._id_78B1["tank_crush"], level._id_78BA["tank_crush"], 1, ::rotate_crushed_truck_clip );
    common_scripts\utility::_id_3831( "aa_bog_b_zone_bog" );
    common_scripts\utility::_id_383F( "aa_bog_b_zone_streets" );
    _id_A5A4::arcademode_checkpoint( 7.0, "streets" );
    thread tank_advancement_arch();
}

archway_color_trigger()
{
    var_0 = getent( "pre_archway_color_trigger", "targetname" );
    var_1 = getent( "post_archway_color_trigger", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    var_1 common_scripts\utility::_id_97CC();
    var_2 = _func_1EC( "truck_approach_crush_node", "script_noteworthy" );
    var_2 waittill( "trigger" );
    var_3 = getentarray( "pre_arch_friendly_advancement_trigger", "targetname" );
    common_scripts\utility::_id_0D13( var_3, common_scripts\utility::_id_97CC );
    var_0 common_scripts\utility::_id_97CE();
    var_0 _id_A5A4::_id_0706();
    var_2 = _func_1EC( "stop_for_city_fight1", "script_noteworthy" );
    var_2 waittill( "trigger" );
    var_0 common_scripts\utility::_id_97CC();
    var_1 common_scripts\utility::_id_97CE();
}

tank_advancement_arch()
{
    level.abrams thread ambush_ahead_dialog();
    var_0 = _func_1EC( "stop_for_city_fight1", "script_noteworthy" );
    level.abrams _meth_80C7( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams _meth_827F( 0, 10 );
    level.abrams thread shoot_buildings( 0 );
    level.abrams waittill( "abrams_shot_explodergroup" );
    _id_A5E8::_id_870C( "start_increase_ambiance" );
    level.abrams thread attack_troops();
    waittill_zone_clear( "tank_zone_1" );
    _id_A5A4::_id_1332( "allies" );
    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["movingup"] );
    wait 0.1;
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "roger" );
    _id_A5A4::_id_1333( "allies" );
    level.abrams _meth_828D( 3 );
    common_scripts\utility::_id_383F( "abrams_start_moving_after_city_fight" );
    var_0 = _func_1EC( "stop_for_city_fight2", "script_noteworthy" );
    level.abrams _meth_80C7( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams _meth_827F( 0, 10 );
    level.abrams thread shoot_buildings( 1 );
    level.abrams waittill( "abrams_shot_explodergroup" );
    level.abrams thread attack_troops();
    waittill_zone_clear( "tank_zone_2" );
    thread dosavegame( "tank_progress_corner" );
    _id_A5A4::_id_1332( "allies" );
    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["cleartoadvance"] );
    wait 0.1;
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C _id_A510::_id_0C24( level._id_6F7C, "rogermoveup" );
    wait 0.1;
    level._id_0318 thread playradiosound( level._id_78BA["tank_commander"]["rogermoving"] );
    _id_A5A4::_id_1333( "allies" );
    common_scripts\utility::_id_383F( "abrams_start_moving_after_city_fight" );
    level.abrams _meth_828D( 3 );
    var_0 = _func_1EC( "stop_for_city_fight3", "script_noteworthy" );
    level.abrams _meth_80C7( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level.abrams _meth_827F( 0, 10 );
    level.abrams thread shoot_buildings( 2 );
    level.abrams waittill( "abrams_shot_explodergroup" );
    level.abrams thread attack_troops();
    thread tank_advancement_alley();
}

tank_advancement_alley()
{
    common_scripts\utility::_id_384A( "abrams_move_shoot_t72" );
    thread abrams_setup_t72();
    common_scripts\utility::_id_384A( "abrams_advance_to_end_level" );
    var_0 = _func_1EC( "tank_crush_truck2", "script_noteworthy" );
    var_1 = getent( "crunch_truck_2", "targetname" );
    var_2 = _func_1EC( "tank_path_4", "targetname" );
    level.abrams notify( "stop_attacking_troops" );
    wait 0.05;
    level.abrams _meth_825E( level.abrams.forwardent );
    level.abrams common_scripts\utility::_id_A0A0( "turret_rotate_stopped", 4.0 );
    level.abrams _meth_825F();
    common_scripts\utility::_id_383F( "abrams_start_moving_after_city_fight" );
    thread truck_tank_collide_think( "truck2", "tank_crush_truck2" );
    level.abrams _meth_828D( 3 );
    level.abrams _meth_80C7( var_0 );
    level.abrams waittill( "reached_wait_node" );
    level thread _id_A5A4::_id_61FD( "truck2_stop_collide_think", 2.5 );
    var_1 thread swap_crush_material( level._id_78AC["truck"]["tank_crush"] );
    level.abrams _id_A5A8::tank_crush( var_1, var_2, level._id_78AC["tank"]["tank_crush2"], level._id_78AC["truck"]["tank_crush2"], level._id_78B1["tank_crush2"], level._id_78BA["tank_crush2"], 1, ::rotate_crushed_truck_clip );
    level.abrams._id_A2FE = 1;
    level.abrams _meth_825E( getent( "final_abrams_aim_spot", "targetname" ) );
    level.abrams _meth_827F( 0, 10, 10 );
}

seaknight()
{
    _id_A5E8::_id_870C( "seaknight_rescue_submix" );
    var_0 = getent( "seaknight_path", "targetname" );
    var_1 = getent( "seaknight_land_location", "script_noteworthy" );
    objective_state( 1, "done" );
    wait 1.0;
    var_2 = getent( "seaknight_wait_location", "script_noteworthy" );
    objective_add( 2, "current", &"BOG_B_OBJ_SEAKNIGHT", var_2._id_02E2 );
    thread dosavegame( "seaknight" );
    common_scripts\utility::_id_383F( "seaknight_start" );
    thread disperse_allies_unevenly_to_seaknight();
    getent( "seaknight_friendly_trigger", "targetname" ) notify( "trigger" );
    level.seaknight = _id_A5A8::_id_8979( "seaknight" );
    level.seaknight _meth_80B3( "vehicle_ch46e_opened_door_interior_a" );
    var_3 = spawn( "script_model", level.seaknight _meth_8184( "body_animate_jnt" ) );
    var_3 _meth_80B3( "vehicle_ch46e_opened_door_interior_b" );
    var_3.angles = level.seaknight.angles;
    var_3 _meth_804F( level.seaknight, "body_animate_jnt" );
    var_4 = spawn( "script_model", level.seaknight _meth_8184( "body_animate_jnt" ) );
    var_4 _meth_80B3( "vehicle_ch46e_wires" );
    var_4.angles = level.seaknight.angles;
    var_4 _meth_804F( level.seaknight, "body_animate_jnt" );
    maps\_wibble::wibble_add_heli_to_track( level.seaknight );
    _id_A5A4::playerwatch_register_crusher( level.seaknight );
    wait 0.05;
    var_5 = level.seaknight._id_750A;
    thread seaknight_dialog();
    var_1 waittill( "trigger", var_6 );
    objective_position( 2, var_1._id_02E2 );
    var_6._id_2D30 = 1;
    var_6 _id_A5A4::_id_9CB3();
    var_6 _id_A5A4::_id_9CF5();
    var_6 _meth_824F( 0, 0, 0 );
    var_6 thread seaknight_doors_open();
    getent( "player_in_seaknight", "targetname" ) waittill( "trigger" );
    wait 5.0;
    common_scripts\utility::_id_384A( "seaknight_dialog_done" );
    _id_A5A4::_id_60D6();
}

disperse_allies_unevenly_to_seaknight()
{
    var_0 = _func_0D9( "allies" );

    if ( var_0.size > 0 )
    {
        for ( var_1 = 1; var_1 <= 3; var_1++ )
        {
            var_2 = _func_0C4( "overlook_jumpdown_" + var_1, "script_noteworthy" );
            var_3 = get_traverse_node_start( var_2 );
            var_3 _meth_805B();
        }

        wait 0.05;

        for ( var_1 = 0; var_1 < level.alleyfriends.size; var_1++ )
        {
            if ( isdefined( level.alleyfriends[var_1] ) && _func_1A1( level.alleyfriends[var_1] ) )
            {
                level.alleyfriends[var_1]._id_01FB = 1;
                var_2 = _func_0C4( "overlook_jumpdown_" + ( var_1 + 1 ), "script_noteworthy" );
                var_3 = get_traverse_node_start( var_2 );
                var_3 _meth_805C();
                wait 0.05;
                level.alleyfriends[var_1] _id_A5A4::_id_7E38( "c" );
                level.alleyfriends[var_1] waittill( "traverse_started" );
                wait 1;
                wait(_func_0B5( 0.05, 0.15 ));
                var_3 _meth_805B();
            }
        }

        for ( var_1 = 1; var_1 <= 3; var_1++ )
        {
            var_2 = _func_0C4( "overlook_jumpdown_" + var_1, "script_noteworthy" );
            var_3 = get_traverse_node_start( var_2 );
            var_3 _meth_805C();
        }

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( !common_scripts\utility::_id_0CE4( level.alleyfriends, var_0[var_1] ) )
                var_0[var_1] thread _id_A5A4::_id_7E38( "c" );
        }

        common_scripts\utility::_id_0D13( var_0, ::look_at_player );
    }
}

look_at_player()
{
    self waittill( "goal" );
    thread maps\_headtracking::player_head_tracking();
}

get_traverse_node_start( var_0 )
{
    var_1 = undefined;

    if ( var_0[0]._id_04D9 == "Begin" )
        var_1 = var_0[0];
    else
        var_1 = var_0[1];

    return var_1;
}

seaknight_doors_open()
{
    var_0 = _id_A5A9::_id_0BE9( self, 1 );
    thread _id_A5A9::_id_7F22( var_0._id_9CD5, var_0._id_9CD6 );
    thread common_scripts\utility::_id_69C2( var_0._id_9CD7, self._id_02E2 );
}

seaknight_player_door_clip()
{
    var_0 = getent( "seaknight_player_door_clip", "targetname" );
    var_0 _meth_82BB();
    var_1 = getent( "seaknight_almost_land_location", "script_noteworthy" );
    var_1 waittill( "trigger", var_2 );
    wait 12;
    var_0 _meth_82BA();
    var_3 = getent( "seaknight_land_location", "script_noteworthy" );
    var_3 waittill( "trigger", var_2 );
    wait 4;
    var_0 _meth_82BB();
}

seaknight_dialog()
{
    var_0 = getent( "seaknight_almost_land_location", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    wait 5.0;
    level._id_0318 playradiosound( level._id_78BA["saknight"]["getonboard"] );
    level._id_6F7C._id_0C72 = "price";
    _id_A510::_id_0C24( level._id_6F7C, "fixonposition" );
    common_scripts\utility::_id_383F( "seaknight_dialog_done" );
}

bog_enemies_retreat()
{
    getent( "bog_enemies_retreat", "targetname" ) waittill( "trigger" );
    thread _id_537D( 9 );
    var_0 = _func_0D9( "axis" );
    var_1 = _func_0C4( "bog_enemies_retreat_node", "targetname" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2] ) )
            continue;

        if ( !_func_1A1( var_0[var_2] ) )
            continue;

        var_3 = var_1[_func_0B2( var_1.size )];
        var_0[var_2] thread enemy_retreat_think( var_3 );
    }

    var_4 = getent( "chopper_guy_pre_crush_trig", "targetname" );
    var_4 _id_A5A4::_id_0706();
}

enemy_retreat_think( var_0 )
{
    self endon( "death" );

    if ( isdefined( self._id_0398 ) && _func_120( self._id_0398, "introchopper" ) )
    {
        if ( _func_120( self._id_0398, "introchopper1" ) )
            _id_A5A4::_id_7E38( "p" );
        else
            _id_A5A4::_id_7E38( "c" );

        common_scripts\utility::_id_384A( "aa_bog_b_zone_streets" );
        _id_A5A4::_id_1EB8();
    }

    thread go_to_node_delayed( var_0, var_0._id_0351, _func_0B3( 5.0 ) );
    thread ignored_by_tank_cannon();
}

go_to_node_delayed( var_0, var_1, var_2 )
{
    wait(var_2);

    if ( !isdefined( self ) )
        return;

    if ( !_func_1A1( self ) )
        return;

    self._id_01C4 = var_1;
    _id_A5A4::_id_7E4B( var_0 );
}

ignored_by_tank_cannon( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( var_0 )
        self.ignored_by_tank_cannon = 1;
    else
        self.ignored_by_tank_cannon = undefined;
}

player_passed_dumpster()
{
    getent( "player_passed_dumpster", "targetname" ) waittill( "trigger" );
    common_scripts\utility::_id_383F( "player_passed_dumpster" );
}

rotate_fans()
{
    var_0 = getentarray( "rotate", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread rotate_fan();
}

rotate_fan()
{
    var_0 = 360;

    if ( isdefined( self.turn_time ) )
    {
        if ( _func_0B3( 1.0 ) > 0.5 )
            var_0 *= -1;
    }
    else
    {
        var_1 = _func_0BE( ( self._id_02E2[0] + self._id_02E2[1] ) * 0.1 );
        var_1 -= _func_0E2( var_1 );

        if ( var_1 > 0.5 )
            var_0 *= -1;

        var_2 = 0.5;
        var_3 = 23.0;
        self.turn_time = var_2 + var_1 * var_3;
    }

    if ( !isdefined( self._id_0398 ) )
        self._id_0398 = "z";

    switch ( self._id_0398 )
    {
        case "x":
            thread rotate_fan_loop( ( 0, 0, var_0 ), self.turn_time );
            break;
        case "y":
            thread rotate_fan_loop( ( var_0, 0, 0 ), self.turn_time );
            break;
        case "z":
            thread rotate_fan_loop( ( 0, var_0, 0 ), self.turn_time );
            break;
    }
}

rotate_fan_loop( var_0, var_1 )
{
    for (;;)
    {
        self _meth_82B9( var_0, var_1 );
        wait(var_1 - 0.05);
    }
}

swap_crush_material( var_0 )
{
    var_1 = getanimlength( var_0 );
    var_2 = getnotetracktimes( var_0, "crush_material" );
    var_1 *= var_2[0];
    wait(var_1);
    self _meth_8468( "mtl_h1_pickup_ext_a", "mtl_h1_pickup_ext_a_crushed" );
    self _meth_8468( "mtl_h1_pickup_ext_b", "mtl_h1_pickup_ext_b_crushed" );
    self _meth_8468( "mtl_h1_pickup_int_elements", "mtl_h1_pickup_int_elements_crushed" );
}

rotate_crushed_truck_clip( var_0 )
{
    var_1 = getent( var_0._id_04A6 + "_precrushed_clip", "targetname" );
    var_1 _meth_82B3( -15, 1.5 );
}

docomingthroughaudio( var_0 )
{
    level._id_0318 playradiosound( level._id_78BA["tank_commander"]["comingthrough"] );
}

setasdestructible( var_0, var_1, var_2 )
{
    self _meth_82BC( 1 );
    self waittill( "damage", var_3, var_4 );
    self _meth_80B3( var_0 );
    var_5 = self _meth_8097();
    var_6 = var_5 + var_2;
    playfx( level._id_058F[var_1], var_6 );
}

computer_destruct()
{
    setasdestructible( "com_computer_monitor_d", "tv_explosion", ( 0, 0, 10 ) );
}

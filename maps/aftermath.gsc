// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\aftermath_fx::main();
    maps\createart\aftermath_art::main();
    maps\aftermath_precache::main();
    _id_A550::main();
    thread maps\aftermath_amb::main();
    maps\aftermath_lighting::main();
    thread maps\aftermath_anim::main();
    maps\aftermath_wobblers::main();
    level thread _id_70BB();
    setup_dead_bodies();
    common_scripts\utility::_id_383D( "fall" );
    common_scripts\utility::_id_383D( "collapse" );
    common_scripts\utility::_id_383D( "collapse_done" );
    level._id_4413 = spawn( "script_model", ( 0, 0, 0 ) );
    level._id_0318 _meth_8093( level._id_4413 );
    building_collapse_h1();
    player_start();
}

player_start()
{
    var_0 = ( -989, 8433, 666 );
    var_1 = ( -18, 25, 0 );
    level._id_0318 _meth_8181( "prone" );
    level._id_0318 _meth_8335( var_0 );
    level._id_0318 _meth_8337( var_1 );
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\aftermath_fx::main();
    maps\createart\aftermath_art::main();
    level._id_8C36 = "default";
    level.weaponclipmodels = [];
    level.playerbreathalias = "h1_plr_breath_injured_low";
    thread hud_hide();
    maps\aftermath_precache::main();
    _id_A550::main();
    thread maps\aftermath_amb::main();
    maps\aftermath_lighting::main();
    maps\aftermath_aud::main();
    thread maps\aftermath_wobblers::main();
    thread maps\aftermath_anim::main();
    setup_dead_bodies();
    precacheshellshock( "slowview" );
    precacheshellshock( "aftermath" );
    precacheshellshock( "aftermath_fall" );
    precacheshader( "overlay_hunted_black" );
    precacheshader( "overlay_hunted_white" );
    precachemodel( "com_airduct_square" );
    common_scripts\utility::_id_383D( "awake" );
    common_scripts\utility::_id_383D( "fall" );
    common_scripts\utility::_id_383D( "fall_complete" );
    common_scripts\utility::_id_383D( "collapse" );
    common_scripts\utility::_id_383D( "collapse_done" );
    _id_A5A4::_id_3847( "radiation_death", getent( "death_point", "targetname" ) );
    common_scripts\utility::_id_383D( "helicopterfall_bodysense" );
    level.allow_fall = 1;

    if ( getdvarint( "aftermath_body_sense", 1 ) != 1 )
        setup_force_fall();

    level._id_6C19 = 50;
    level._id_4413 = spawn( "script_model", ( 0, 0, 0 ) );
    level._id_0318 _meth_8093( level._id_4413 );
    level._id_0318 thread player_speed_over_time();
    level._id_0318 thread _id_6B4F();
    level thread countdown_to_death();
    level._id_0318 thread radiation_death();
    level thread _id_70BB();
    level._id_0318 _meth_8301( 0 );
    level thread slowview();
    thread building_collapse_h1();

    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        body_sense_init();

    player_wakeup();
    level common_scripts\utility::_id_384A( "awake" );

    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        setup_force_fall();

    level._id_0318 _meth_82FE( 0 );
    level._id_0318 thread limp();
    level thread playground();
    maps\_wibble::setup_wibble_triggers( 0, "awake", "interior", 0, 1 );
    maps\_wibble::set_cloth_wibble( 0.0 );
}

setup_dead_bodies()
{
    level.dead_bodies_ignore_ragdoll_settings = 1;
    level.scr_deadbody[1] = _id_A4D7::main;
    level.scr_deadbody[2] = _id_A4D8::main;
    level.scr_deadbody[3] = _id_A4DB::main;
    level.scr_deadbody[4] = character\character_sp_pilot_velinda_desert::main;
    maps\_deadbody::main();
}

playground()
{
    var_0 = getent( "playground", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_69C2( "playground_memory", var_0._id_02E2 );
}

slowview()
{
    for (;;)
    {
        level waittill( "slowview", var_0 );

        if ( isdefined( var_0 ) )
            wait(var_0);

        thread restart_slowview();
        level._id_0318 _meth_8186( "slowview", 15 );
    }
}

restart_slowview()
{
    level endon( "slowview" );
    wait 10;
    level notify( "slowview" );
}

_id_70BB()
{
    thread common_scripts\utility::_id_69C2( "snc_intro_stinger", ( 0, 0, 0 ) );
    var_0 = ( -1144, 8506, 660.3 );
    wait 4;
    _id_A5DE::_id_5CF6( "mix_intro_stinger" );
    thread maps\aftermath_aud::aud_player_dying_slowly();
    thread common_scripts\utility::_id_69C2( "aftermath_mmr_romeo_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_mmr_romeo", var_0 );
    wait 3;
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_epicenter_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_epicenter", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_evacuation_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_evacuation", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_contcenters_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_contcenters", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_dosimeter_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_dosimeter", var_0 );
    thread common_scripts\utility::_id_69C2( "aftermath_fmr_elevatedlevels_ext", var_0 );
    common_scripts\utility::_id_69C2( "aftermath_fmr_elevatedlevels", var_0 );
}

countdown_to_death()
{
    level endon( "dying" );
    var_0 = getent( "outside", "targetname" );
    var_0 _id_A5A4::_id_9FC8( 50 );
    wait 30;

    if ( !common_scripts\utility::_id_382E( "collapse_done" ) )
    {
        var_1 = getent( "raze", "targetname" );
        var_1 notify( "trigger" );
        common_scripts\utility::_id_3856( "collapse_done", 10 );
    }

    wait 15;
    common_scripts\utility::_id_383F( "radiation_death" );
}

_id_02D2()
{
    common_scripts\utility::_id_384A( "awake" );
    wait 4;
    var_0 = getent( "radiac_equipment", "targetname" );
    objective_add( 1, "active", &"AFTERMATH_OBJ_OFFICER", var_0._id_02E2 );
    objective_current( 1 );
    var_1 = getent( "officer", "targetname" );
    var_1 waittill( "trigger" );
    objective_state( 1, "done" );
    level._id_0318 thread player_jump_punishment();
    wait 3;
    var_0 = getent( "overhead_cover", "targetname" );
    objective_add( 2, "active", &"AFTERMATH_OBJ_SECURE_COVER", var_0._id_02E2 );
    objective_current( 2 );
    var_1 = getent( "death_point", "targetname" );
    var_1 waittill( "trigger" );
    var_2 = _func_0B7( 30 );

    while ( !common_scripts\utility::_id_A347( level._id_0318._id_02E2, level._id_0318 _meth_8338(), var_0._id_02E2, var_2 ) )
        wait 0.05;

    level._id_0318 radiation_death();
}

radiation_death()
{
    common_scripts\utility::_id_384A( "radiation_death" );
    _id_A5E8::_id_870C( "aud_start_mix_player_dying" );
    level notify( "dying" );
    thread hud_hide();
    level._id_0318 _meth_8181( "prone" );
    _func_074( 0, 0.5 );
    level._id_0318 _meth_8326( 1 );
    level._id_0318 thread _id_A5A4::_id_69C4( "h1_plr_fall_near_death_sfx" );
    level._id_4413 thread stumble( ( 20, 10, 30 ), 0.2, 1.5, 1 );
    wait 0.2;
    level waittill( "recovered" );
    level._id_0318 _meth_80AF( "grenade_rumble" );
    level._id_0318 _meth_811A( 0 );
    level._id_0318 _meth_811B( 0 );
    var_0 = level._id_0318 _meth_8338();
    var_1 = _id_085A( ( 0, 90 - var_0[1], -25 - var_0[0] ) );
    level._id_4413 _meth_82B1( var_1, 6, 3, 1 );
    wait 4.5;
    var_2 = getent( "collapse_extra", "targetname" );
    var_2 notify( "trigger", 1 );
    level notify( "aftermath_lighting_glow", 6 );
    wait 3;
    level notify( "stop_heart" );
    var_3 = _id_23D0( "overlay_hunted_white", 0 );
    var_3 _meth_8086( 5 );
    var_3.alpha = 1;
    wait 5;
    _func_0D6( "hud_showStance", 0 );
    _id_A5A4::_id_60D6();
}

building_collapse_h1()
{
    level.collapse_delay_min = 2;
    level.collapse_delay_mid = 4;
    level.collapse_delay_max = 8;
    thread building_collapse_back();
    thread building_collapse_side();
    thread building_collapse_extra();
}

building_collapse_back()
{
    common_scripts\utility::_id_383D( "building_collapse_back" );
    level endon( "building_collapse_side" );
    var_0 = getent( "collapse_back", "targetname" );
    var_0 waittill( "trigger" );
    building_collapse_wait_for_ready( "collapse_center_2" );
    building_collapse_active( "building_collapse_back" );
    building_collapse_explode( 2 );
    wait(_func_0B4( level.collapse_delay_min, level.collapse_delay_mid ));
    building_collapse_explode( 5 );
    wait(_func_0B4( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 4 );
    building_collapse_complete( "building_collapse_back" );
}

building_collapse_explode( var_0 )
{
    common_scripts\_exploder::_id_3528( var_0 );
    level notify( "building_collapse", var_0 );
}

building_collapse_side()
{
    common_scripts\utility::_id_383D( "building_collapse_side" );
    level endon( "building_collapse_back" );
    var_0 = getent( "collapse_side", "targetname" );
    var_0 waittill( "trigger" );
    building_collapse_wait_for_ready( "collapse_center_4" );
    building_collapse_active( "building_collapse_side" );
    building_collapse_explode( 4 );
    wait(_func_0B4( level.collapse_delay_min, level.collapse_delay_mid ));
    building_collapse_explode( 5 );
    wait(_func_0B4( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 2 );
    building_collapse_complete( "building_collapse_side" );
}

building_collapse_extra()
{
    common_scripts\utility::_id_383D( "building_collapse_extra" );
    var_0 = getent( "collapse_extra", "targetname" );
    var_0 waittill( "trigger", var_1 );

    while ( common_scripts\utility::_id_382E( "building_collapse_side" ) || common_scripts\utility::_id_382E( "building_collapse_back" ) )
        wait 0.05;

    if ( !isdefined( var_1 ) && !var_1 )
        building_collapse_wait_for_ready( "collapse_center_1" );

    building_collapse_active( "building_collapse_extra" );
    building_collapse_explode( 1 );
    wait(_func_0B4( level.collapse_delay_mid, level.collapse_delay_max ));
    building_collapse_explode( 3 );
    building_collapse_complete( "building_collapse_extra" );
}

building_collapse_active( var_0 )
{
    common_scripts\utility::_id_383F( var_0 );
    common_scripts\utility::_id_383F( "collapse" );

    if ( var_0 != "building_collapse_extra" )
        level notify( "stop_stumble" );

    thread _id_A5DE::_id_5CF2( "mix_building_collapse" );
    thread common_scripts\utility::_id_69C2( "exp_building_collapse_dist", level._id_0318._id_02E2 );
}

building_collapse_complete( var_0 )
{
    level notify( "building_collapse_final_wait", level.collapse_delay_min );
    wait(level.collapse_delay_min);
    common_scripts\utility::_id_3831( var_0 );
    common_scripts\utility::_id_3831( "collapse" );
    common_scripts\utility::_id_383F( "collapse_done" );
    level notify( "recovered" );
    _id_A5A4::_id_27EF( _func_0E1( 0, 5 - level.collapse_delay_min ), _id_A5DE::_id_5CF6, "mix_building_collapse" );
}

building_collapse_wait_for_ready( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = _func_0B7( 45 );

    for (;;)
    {
        while ( !common_scripts\utility::_id_A347( level._id_0318._id_02E2, level._id_0318 _meth_8338(), var_1._id_02E2, var_2 ) )
            wait 0.05;

        if ( common_scripts\utility::_id_382E( "fall" ) )
        {
            wait 0.05;
            continue;
        }

        break;
    }
}

building_collapse_pull_view( var_0, var_1 )
{
    self endon( "helicopterfall_bodysense" );
    var_2 = getent( "collapse_center_" + var_0, "targetname" );
    var_3 = level._id_0318 _meth_8338();
    var_4 = _func_115( var_2._id_02E2 - level._id_0318._id_02E2 );
    var_5 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_5.angles = var_4;
    var_6 = 1.75;
    level._id_0318 _meth_8082( var_5, undefined, var_6, var_6 * 0.333, var_6 * 0.333, 1 );
    level._id_4413 _meth_82B1( ( 0, 0, 0 ), var_6, var_6 * 0.333, var_6 * 0.333 );
    wait(var_6);
    wait 1.0;
    level._id_0318 _meth_8337( var_4 );
    level._id_0318 _meth_8051();
}

building_collapse_recenter_view( var_0 )
{
    level._id_4413 _meth_82B1( ( 0, var_0, 0 ), 4, 2, 2 );
    level waittill( "building_collapse_final_wait", var_1 );
    var_2 = var_1 * 0.5;
    var_3 = var_1 * 0.25;
    wait(var_2);
    level._id_4413 _meth_82B1( ( 0, 0, 0 ), var_2, var_3, var_3 );
}

building_collapse()
{
    getent( "raze", "targetname" ) waittill( "trigger" );
    var_0 = getent( "building_collapse", "targetname" );
    var_1 = _func_0B7( 45 );

    while ( !common_scripts\utility::_id_A347( level._id_0318._id_02E2, level._id_0318 _meth_8338(), var_0._id_02E2 + ( 0, 0, -1000 ), var_1 ) )
        wait 0.05;

    common_scripts\utility::_id_3857( "fall" );
    common_scripts\utility::_id_383F( "collapse" );
    level notify( "stop_stumble" );
    thread common_scripts\utility::_id_69C2( "exp_building_collapse_dist", level._id_0318._id_02E2 );
    var_2 = getentarray( var_0._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_2, ::collapse, var_0 );
    var_0 _meth_82AA( var_0._id_02E2 + ( 0, 0, -3000 ), 7, 4, 0 );
    wait 0.5;
    common_scripts\_exploder::_id_3528( 1 );
    var_3 = _id_085A( ( 0, 0, -20 ) );
    level._id_4413 _meth_82B1( var_3, 2, 1, 1 );
    level._id_4413 waittill( "rotatedone" );
    wait 1;
    level._id_4413 _meth_82B1( ( 0, 0, 0 ), 3, 1.5, 1.5 );
    wait 2;
    common_scripts\utility::_id_3831( "collapse" );
    common_scripts\utility::_id_383F( "collapse_done" );
    level notify( "recovered" );
}

collapse( var_0 )
{
    var_1 = _func_0EE( var_0._id_02E2, self._id_02E2 );

    while ( _func_0EE( var_0._id_02E2, self._id_02E2 ) <= var_1 )
    {
        var_1 = _func_0EE( var_0._id_02E2, self._id_02E2 );
        wait 0.05;
    }

    if ( !isdefined( self._id_0392 ) )
        self._id_0392 = 0;

    wait(_func_0B3( 0.1 ) + self._id_0392);
    var_2 = _func_114( common_scripts\utility::_id_38C9( var_0._id_02E2 ) - common_scripts\utility::_id_38C9( self._id_02E2 ) );
    var_3 = _id_A5A4::vector_multiply( vector_switch( _func_114( var_2 ) ), _func_0B4( 80, 100 ) );
    var_2 = _id_711A( ( 1, 1, 0.1 ) );
    var_2 = _id_A5A4::vector_multiply( var_2, _func_0B4( 100, 150 ) );
    self _meth_82B9( var_3, 2, 0.2, 0 );
    self _meth_82AE( var_2, 2 );
    wait 2;
    self delete();
}

vector_switch( var_0 )
{
    return ( var_0[0], var_0[2], var_0[1] * -1 );
}

_id_711A( var_0 )
{
    return ( ( _func_0B3( 2 ) - 1 ) * var_0[0], ( _func_0B3( 2 ) - 1 ) * var_0[1], ( _func_0B3( 2 ) - 1 ) * var_0[2] );
}

player_speed_over_time()
{
    for (;;)
    {
        level._id_0318 _meth_81E4( level._id_6C19 / 190 );
        wait 10;
        level._id_6C19--;

        if ( level._id_6C19 < 30 )
            return;
    }
}

_id_6B4F()
{
    level endon( "stop_heart" );
    wait 3;

    if ( !isdefined( level.heartbeat_ent ) )
    {
        level.heartbeat_ent = spawn( "script_origin", level._id_0318._id_02E2 );
        level.heartbeat_ent _meth_804F( level._id_0318 );
    }

    level.heartbeat_ent _meth_8077( "aftermath_heartbeat" );

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "helicopterfall_bodysense" ) )
        {
            level._id_0318 thread common_scripts\utility::_id_8EA1( level.playerbreathalias );
            level.heartbeat_ent _meth_80AD();
            level._id_0318 _meth_809C( "h1_heartbeat_fall" );
            wait 3.5;
            level.heartbeat_ent _meth_8077( "aftermath_heartbeat" );

            if ( level.playerbreathalias == "h1_plr_breath_injured_low" )
                level.playerbreathalias = "h1_plr_breath_injured_heavy";

            level._id_0318 thread common_scripts\utility::_id_6975( level.playerbreathalias );
            var_0 = 1.0;

            while ( var_0 >= 0.95 )
            {
                level.heartbeat_ent _meth_806F( var_0, 0.5 );
                var_0 -= 0.05;
                wait 2;
            }

            return;
        }

        wait 0.05;
    }
}

player_wakeup()
{
    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
    {
        thread player_wakeup_body_sense();
        return;
    }

    level notify( "aftermath_lighting_glow", 0 );
    level._id_0318 _meth_8181( "prone" );
    level._id_0318 _meth_8186( "aftermath", 18 );
    level notify( "slowview" );
    level._id_0318 _meth_831A();
    level._id_0318 _meth_8326( 1 );
    level._id_0318 _meth_811A( 0 );
    level._id_0318 _meth_811B( 0 );
    var_0 = ( -989, 8433, 666 );
    var_1 = ( -18, 25, 0 );
    level._id_0318 _meth_8335( var_0 );
    level._id_0318 _meth_8337( var_1 );
    var_2 = _id_23D0( "overlay_hunted_black", 1 );
    wait 5;
    wait 0.5;
    var_2 _meth_8086( 12 );
    var_2.alpha = 0;
    wait 1;
    level._id_0318 _meth_8326( 0 );
    wait 7;
    wait 0.5;
    thread _id_728D();
    _func_0D6( "cg_footsteps", 0 );
    level._id_0318 _meth_8181( "prone" );
    wait 2;
    level._id_0318 _meth_811B( 1 );
    common_scripts\utility::_id_383F( "awake" );
    level notify( "aftermath_lighting_default", 10 );
    wait 10;
    level._id_0318 _meth_811A( 1 );
    var_2 _meth_808A();
}

player_wakeup_body_sense()
{
    level notify( "aftermath_lighting_glow", 0 );
    level._id_0318 _meth_8186( "aftermath", 18 );
    level notify( "slowview" );
    level._id_0318 _meth_831A();
    level._id_0318 _meth_8326( 1 );
    body_sense_wakeup_setup();
    var_0 = _id_23D0( "overlay_hunted_black", 1 );
    wait 5;
    thread body_sense_wakeup_start();
    wait 0.5;
    var_0 _meth_8086( 12 );
    var_0.alpha = 0;
    wait 1;
    wait 7;
    wait 0.5;
    _func_0D6( "cg_footsteps", 0 );
    wait 2;
    common_scripts\utility::_id_383F( "awake" );
    level notify( "aftermath_lighting_default", 10 );
    wait 10;
    var_0 _meth_808A();
}

body_sense_init()
{
    level.player_body_node = spawn( "script_origin", ( -702.964, 8432.29, 635.475 ) );
    level.player_body = _id_A5A4::_id_88D1( "player_body", level._id_0318._id_02E2, level._id_0318 _meth_8338() );
    level.player_body _meth_8056();
}

body_sense_wakeup_setup()
{
    level._id_0318 _meth_811C( 1 );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_811A( 0 );
    level._id_0318 _meth_8181( "prone" );
    level.player_body_node _id_A510::_id_0BC7( level.player_body, "jackson_wakeup" );
    var_0 = level.player_body _meth_8184( "tag_camera" );
    var_0 -= ( 0, 0, 11 );
    level._id_0318 _meth_8335( var_0 );
    var_1 = level.player_body _meth_8185( "tag_camera" );
    var_1 = ( 0, var_1[1], 0 );
    level._id_0318 _meth_8337( var_1 );
}

body_sense_wakeup_start()
{
    _func_0D6( "bg_allowProneWhileLinked", 1 );
    level._id_4413.angles += ( 0, 0, -5.27285 );
    level.player_body _meth_8055();
    level._id_0318 _meth_807F( level.player_body, "tag_player", 1, 0, 0, 0, 0, 1 );
    level.player_body_node thread _id_A510::_id_0C24( level.player_body, "jackson_wakeup" );
    thread h1_aftermathwakeupseq_dof();
    var_0 = 0.333;
    wait(getanimlength( level._id_78AC["player_body"]["jackson_wakeup"] ) - var_0);
    level._id_4413 _meth_82B1( ( 0, 0, 0 ), var_0, var_0 * 0.333, var_0 * 0.333 );
    level._id_4413 waittill( "rotatedone" );
    level._id_0318 _meth_8051();
    level.player_body _meth_8056();
    wait 2;
    _func_0D6( "bg_allowProneWhileLinked", 0 );
    level._id_0318 thread common_scripts\utility::_id_6975( level.playerbreathalias );
    level._id_0318 _meth_811B( 1 );
    wait 10;
    level._id_0318 _meth_811A( 1 );
}

h1_aftermathwakeupseq_dof()
{
    wait 1.35;
    level._id_0318 _meth_84A7( 2.4, 140, 9.0, 9.0 );
    _func_0D6( "r_mbEnable", 2 );
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 2.4, 21, 1.0, 1.0 );
    wait 8.5;
    level._id_0318 _meth_84A7( 3.4, 14, 2.0, 2.0 );
    wait 2.3;
    level._id_0318 _meth_84A7( 4.4, 11.5, 3.0, 3.0 );
    wait 1.5;
    wait 1.5;
    _func_0D6( "r_mbEnable", 0 );
}

_id_085A( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[2];
    var_3 = anglestoright( level._id_0318.angles );
    var_4 = anglestoforward( level._id_0318.angles );
    var_5 = ( var_3[0], 0, var_3[1] * -1 );
    var_6 = ( var_4[0], 0, var_4[1] * -1 );
    var_7 = _id_A5A4::vector_multiply( var_5, var_1 );
    var_7 += _id_A5A4::vector_multiply( var_6, var_2 );
    return var_7 + ( 0, var_0[1], 0 );
}

limp()
{
    if ( getdvarint( "no_cinematic_fx" ) != 1 )
        level._id_0318 thread maps\aftermath_lighting::player_random_blur();

    var_0 = 0;
    var_1 = 0;
    var_2 = 1.0;

    for (;;)
    {
        var_3 = level._id_0318 _meth_8336();
        var_4 = _func_0BE( var_3[0] ) + _func_0BE( var_3[1] );

        if ( var_4 < 4 )
        {
            wait 0.05;
            continue;
        }

        var_5 = level._id_0318 _meth_8180();

        if ( var_5 == "crouch" )
            var_2 = 0.1;
        else if ( var_5 == "prone" )
            var_2 = 0.6;
        else
            var_2 = 1.0;

        var_6 = var_4 / level._id_6C19;
        var_7 = _func_0B5( 3, 5 );

        if ( _func_0B2( 100 ) < 20 )
            var_7 *= 3;

        var_8 = _func_0B5( 3, 7 );
        var_9 = _func_0B5( -8, -2 );
        var_10 = ( var_7, var_9, var_8 );
        var_10 *= var_2;
        var_10 = _id_A5A4::vector_multiply( var_10, var_6 );
        var_11 = _func_0B5( 0.35, 0.45 );
        var_12 = _func_0B5( 0.65, 0.8 );
        var_0++;

        if ( var_6 > 1.3 )
            var_0++;

        thread stumble( var_10, var_11, var_12, var_2 );
        thread maps\aftermath_aud::aud_player_walking_foley( var_5 );
        level waittill( "recovered" );
    }
}

player_jump_punishment()
{
    wait 1;

    for (;;)
    {
        wait 0.05;

        if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        {
            if ( !level._id_0318 _meth_83B1() )
                continue;
        }
        else
        {
            if ( level._id_0318 _meth_833E() )
                continue;

            wait 0.2;

            if ( level._id_0318 _meth_833E() )
                continue;
        }

        level notify( "stop_stumble" );
        wait 0.2;
        level._id_0318 fall();
    }
}

setup_force_fall()
{
    if ( getdvarint( "aftermath_body_sense", 1 ) == 1 )
        var_0 = getentarray( "force_fall_body_sense", "targetname" );
    else
        var_0 = getentarray( "force_fall", "targetname" );

    common_scripts\utility::_id_0D13( var_0, ::force_fall );
}

force_fall()
{
    self waittill( "trigger" );

    if ( self._id_0398 == "lower_fall" )
    {
        level.lower_fall_used = 1;
        return;
    }

    if ( self._id_0398 == "upper_fall" )
    {
        if ( isdefined( level.lower_fall_used ) && level.lower_fall_used == 1 )
            return;
    }

    level._id_0318 fall();
}

fall()
{
    level endon( "stop_stumble" );

    if ( !level.allow_fall )
        return;

    common_scripts\utility::_id_383F( "fall" );
    level._id_0318 _meth_8181( "prone" );
    thread maps\aftermath_aud::aud_player_falls();
    level._id_4413 thread stumble( ( 20, 10, 30 ), 0.2, 1.5, 1, 1 );
    wait 0.2;
    level notify( "aftermath_lighting_pain", 0 );
    level._id_0318 _meth_80AF( "grenade_rumble" );
    level._id_0318 _meth_811A( 0 );
    level._id_0318 _meth_811B( 0 );

    if ( !common_scripts\utility::_id_382E( "collapse" ) )
        level._id_0318 _meth_81B3( 127, level._id_0318._id_02E2 );

    level notify( "slowview", 3.5 );
    wait 1.5;
    common_scripts\utility::_id_383F( "fall" );
    thread _id_728D();
    thread maps\aftermath_aud::aud_player_recover();
    level notify( "aftermath_lighting_default", 5 );
    common_scripts\utility::_id_3831( "fall" );
    common_scripts\utility::_id_383F( "fall_complete" );
    level._id_0318 _meth_811A( 1 );
    level._id_0318 _meth_811B( 1 );
    level notify( "recovered" );
}

stumble( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "stop_stumble" );
    var_0 = _id_085A( var_0 );
    level._id_4413 _meth_82B1( var_0, var_1, var_1 / 4 * 3, var_1 / 4 );
    level._id_4413 waittill( "rotatedone" );
    var_5 = ( _func_0B3( 4 ) - 4, _func_0B3( 5 ), 0 );
    var_5 *= var_3;
    var_5 = _id_085A( var_5 );
    level._id_4413 _meth_82B1( var_5, var_2, 0, var_2 / 2 );
    level._id_4413 waittill( "rotatedone" );

    if ( !isdefined( var_4 ) )
        level notify( "recovered" );
}

_id_728D()
{
    level endon( "collapse" );

    if ( common_scripts\utility::_id_382E( "collapse" ) )
        return;

    var_0 = _id_085A( ( -5, -5, 0 ) );
    level._id_4413 _meth_82B1( var_0, 0.6, 0.6, 0 );
    level._id_4413 waittill( "rotatedone" );
    var_0 = _id_085A( ( -15, -20, 0 ) );
    level._id_4413 _meth_82B1( var_0, 2.5, 0, 2.5 );
    level._id_4413 waittill( "rotatedone" );
    var_0 = _id_085A( ( 5, 5, 0 ) );
    level._id_4413 _meth_82B1( var_0, 2.5, 2, 0.5 );
    level._id_4413 waittill( "rotatedone" );
    level._id_4413 _meth_82B1( ( 0, 0, 0 ), 1, 0.2, 0.8 );
}

_id_23D0( var_0, var_1 )
{
    var_2 = _func_1A9();
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2 _meth_80CE( var_0, 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2._id_01F3 = "fullscreen";
    var_2._id_0501 = "fullscreen";
    var_2.alpha = var_1;
    var_2._id_0198 = 1;
    return var_2;
}

hud_hide( var_0 )
{
    wait 0.1;
    _func_0D6( "hud_showStance", 0 );
    _func_0D6( "compass", "0" );
    _func_0D6( "ammoCounterHide", "1" );
}

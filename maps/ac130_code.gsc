// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

precachelevelstuff()
{
    precachestring( &"AC130_HINT_CYCLE_WEAPONS" );
    precachestring( &"AC130_DO_NOT_ENGAGE" );
    precachestring( &"AC130_CHURCH_DAMAGED" );
    precachestring( &"AC130_ESCAPEVEHICLE_DESTROYED" );
    precachestring( &"AC130_HUD_TOP_BAR" );
    precachestring( &"AC130_HUD_LEFT_BLOCK" );
    precachestring( &"AC130_HUD_RIGHT_BLOCK" );
    precachestring( &"AC130_HUD_BOTTOM_BLOCK" );
    precachestring( &"AC130_HUD_THERMAL_WHOT" );
    precachestring( &"AC130_HUD_THERMAL_BHOT" );
    precachestring( &"AC130_HUD_WEAPON_105MM" );
    precachestring( &"AC130_HUD_WEAPON_40MM" );
    precachestring( &"AC130_HUD_WEAPON_25MM" );
    precachestring( &"AC130_HUD_AGL" );
    precachestring( &"AC130_DEBUG_FRIENDLY_COUNT" );
    precachestring( &"AC130_FRIENDLIES_DEAD" );
    precachestring( &"AC130_FRIENDLY_FIRE" );
    precachestring( &"AC130_FRIENDLY_FIRE_HELICOPTER" );
    precachestring( &"AC130_CIVILIAN_FIRE" );
    precachestring( &"AC130_CIVILIAN_FIRE_VEHICLE" );
    precachestring( &"AC130_OBJECTIVE_SUPPORT_FRIENDLIES" );
    precachestring( &"SCRIPT_PLATFORM_AC130_HINT_ZOOM_AND_FIRE" );
    precachestring( &"SCRIPT_PLATFORM_AC130_HINT_TOGGLE_THERMAL" );
    precacheshader( "popmenu_bg" );
    precacheshader( "ac130_overlay_25mm_txt" );
    precacheshader( "ac130_overlay_40mm_txt" );
    precacheshader( "ac130_overlay_105mm_txt" );
    precacheshader( "ac130_overlay_whot_txt" );
    precacheshader( "ac130_overlay_whot_txt_frn" );
    precacheshader( "ac130_overlay_whot_txt_krn" );
    precacheshader( "ac130_overlay_bhot_txt_frn" );
    precacheshader( "ac130_overlay_bhot_txt_krn" );
    precacheshader( "ac130_overlay_top_left_txt" );
    precacheshader( "ac130_overlay_left_side_txt" );
    precacheshader( "ac130_overlay_right_side_txt" );
    precacheshader( "ac130_overlay_bottom_center_txt" );
    precacheshader( "ac130_overlay_bottom_center_txt_krn" );
    precacheshader( "ac130_overlay_agl_txt" );
    precacheshader( "ac130_overlay_agl_txt_krn" );
    precacheshader( "ac130_overlay_0_number" );
    precacheshader( "ac130_overlay_1_number" );
    precacheshader( "ac130_overlay_2_number" );
    precacheshader( "ac130_overlay_3_number" );
    precacheshader( "ac130_overlay_4_number" );
    precacheshader( "ac130_overlay_5_number" );
    precacheshader( "ac130_overlay_6_number" );
    precacheshader( "ac130_overlay_7_number" );
    precacheshader( "ac130_overlay_8_number" );
    precacheshader( "ac130_overlay_9_number" );
    precacheshader( "ac130_overlay_timer_txt" );
    precacheshader( "ac130_overlay_bhot_txt" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "h1_ac130_blur_40mm" );
    precacheshader( "h1_ac130_blur_25mm" );
    precacheshader( "h1_ac130_blur_105mm" );
    level.nocompass = 1;
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_saw_clip";
    level.weaponclipmodels[1] = "weapon_m16_clip";
    level.weaponclipmodels[2] = "weapon_ak47_clip";
    level.weaponclipmodels[3] = "weapon_g3_clip";
}

scriptcalls()
{
    _id_A5A8::_id_1844( "script_vehicle_luxurysedan", "luxurysedan", "vehicle_luxurysedan", "fx/explosions/large_vehicle_explosion_IR", "tag_deathfx", "explo_metal_rand" );
    _id_A5A8::_id_1844( "script_vehicle_truck", "truck", "vehicle_pickup_4door", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    _id_A5A8::_id_1844( "script_vehicle_truck", "pickup", "vehicle_pickup_4door", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    _id_A5A8::_id_1844( "script_vehicle_uaz_ac130", "uaz_ac130", "vehicle_uaz_fabric", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    _id_A5A8::_id_1844( "script_vehicle_bmp", "bmp", "vehicle_bmp", "fx/explosions/large_vehicle_explosion_IR", "tag_origin", "explo_metal_rand" );
    maps\ac130_precache::main();
    vehicle_scripts\_camera::main( "vehicle_camera", undefined, "script_vehicle_camera" );
    maps\createart\ac130_art::main();
    maps\ac130_fx::main();
    _id_A550::main();
    maps\ac130_snd::main();
    maps\ac130_anim::main();
    maps\ac130_lighting::main();
    maps\ac130_aud::main();
    maps\_ac130::init();
    maps\ac130_trees::main();
    thread exploderanimhide_setup();
    common_scripts\utility::_id_0D13( getentarray( "destructible_building", "targetname" ), ::destructible_building );
    common_scripts\utility::_id_0D13( getentarray( "sim_destruction", "targetname" ), ::sim_destruction );
    common_scripts\utility::_id_0D13( getentarray( "invulnerable", "script_noteworthy" ), _id_A5A4::_id_0798, _id_A5A4::_id_58D7 );
    common_scripts\utility::_id_0D13( getentarray( "damage_church", "targetname" ), ::damage_church );
    common_scripts\utility::_id_0D13( getentarray( "level_scripted_unloadnode", "script_noteworthy" ), ::level_scripted_unloadnode );
    thread helictoper_friendly_fire( "blackhawk1" );
    thread helictoper_friendly_fire( "blackhawk2" );
    thread helicopter_driver_beacons( "blackhawk1" );
    thread helicopter_driver_beacons( "blackhawk2" );
}

missionend( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
    {
        wait 6;
        _id_A5A4::_id_60D6();
    }
}

spawn_enemies( var_0 )
{
    if ( getdvar( "ac130_gameplay_enabled" ) == "0" )
        return;

    var_1 = getent( var_0, "script_noteworthy" );
    var_1 notify( "trigger" );
}

stop_enemies( var_0 )
{
    if ( getdvar( "ac130_gameplay_enabled" ) == "0" )
        return;

    var_1 = getent( var_0, "script_noteworthy" );
    thread _id_A581::_id_533A( var_1._id_7A1E );
}

_id_88FC( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );
    level.friendlies = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2] _meth_8096();

        if ( !_id_A5A4::_id_88F1( var_3 ) )
            level.friendlies[level.friendlies.size] = var_3;
    }

    common_scripts\utility::_id_0D13( level.friendlies, maps\ac130::friendly_health_init );
    common_scripts\utility::_id_0D13( level.friendlies, maps\_ac130::mission_fail_casualties );
    common_scripts\utility::_id_0D13( level.friendlies, maps\_ac130::debug_friendly_count );
    common_scripts\utility::_id_0D13( level.friendlies, maps\_ac130::add_beacon_effect );
}

spawn_ac130_vehicle( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_1 notify( "trigger" );
}

move_friendlies( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( common_scripts\utility::_id_382E( "ignore_friendly_move_commands" ) )
        return;

    var_1 notify( "trigger" );
}

damage_church()
{
    if ( getdvar( "ac130_gameplay_enabled" ) == "0" )
        return;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !_func_1AD( var_1 ) )
            continue;

        if ( _func_120( _func_123( var_4 ), "splash" ) )
            continue;

        if ( !common_scripts\utility::_id_382E( "mission_failed" ) )
            break;
    }

    thread missionfail_church();
}

autosavefriendlycountcheck( var_0 )
{
    if ( level.friendlycount >= level.minimumautosavefriendlycount )
        thread _id_A5A4::_id_1143( var_0 );
}

missionfail_church()
{
    if ( common_scripts\utility::_id_382E( "mission_failed" ) )
        return;

    common_scripts\utility::_id_383F( "mission_failed" );
    setdvar( "ui_deadquote", "@AC130_CHURCH_DAMAGED" );
    _id_A5A4::_id_5CDF();
}

mission_fail_vehicle_death()
{
    level endon( "getaway_vehicles_unloaded" );
    self waittill( "death", var_0 );

    if ( common_scripts\utility::_id_382E( "mission_failed" ) )
        return;

    if ( isdefined( var_0 ) && _func_1AD( var_0 ) )
    {
        common_scripts\utility::_id_383F( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_FRIENDLY_FIRE" );
        _id_A5A4::_id_5CDF();
    }
    else
    {
        common_scripts\utility::_id_383F( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_FRIENDLIES_DEAD" );
        _id_A5A4::_id_5CDF();
    }
}

_id_490D( var_0, var_1 )
{
    thread _id_A5A4::_id_48B0( var_0, undefined, undefined, var_1 );
    wait(level.hintprintduration);
    _id_A5A4::_id_48CB( 0.5 );
}

getenemiesinzone( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = _func_0D9( "axis" );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( !var_2[var_4] _meth_80AB( var_1 ) )
            continue;

        var_3[var_3.size] = var_2[var_4];
    }

    return var_3;
}

level_scripted_unloadnode()
{
    self waittill( "trigger", var_0 );
    var_0 _meth_80C0( 0 );
    var_0._id_2D30 = 1;
    var_0 _id_A5A4::_id_9CB3();
    var_0 _meth_827F( 20, 20 );
    var_0 _id_A5A4::_id_9CF5();

    if ( !isdefined( level.friendlies_told_to_load_choppers ) )
    {
        level.friendlies_told_to_load_choppers = 1;
        thread friendlies_into_choppers();
    }

    var_1 = [];

    for ( var_2 = 0; var_2 < var_0._id_750A.size; var_2++ )
    {
        if ( !isdefined( var_0._id_750A[var_2] ) )
            continue;

        if ( !isdefined( var_0._id_750A[var_2]._id_9D1B ) )
            continue;

        if ( var_0._id_750A[var_2]._id_9D1B >= 1 && var_0._id_750A[var_2]._id_9D1B <= 4 )
            var_1[var_1.size] = var_0._id_750A[var_2];
    }

    var_0 notify( "unload" );
    var_0 _id_A5A4::_id_32E0( "unloaded" );
    common_scripts\utility::_id_0D13( var_1, maps\_ac130::add_beacon_effect, "friendlies_in_choppers" );
    common_scripts\utility::_id_384A( "friendlies_in_choppers" );
    wait(_func_0B5( 1.0, 5.0 ));
    var_0 thread seaknight_doors();
    var_0 thread _id_A5A8::_id_9D05( _id_A5A4::_id_0CFD( var_1 ) );
    thread missionendfailsafe();
    var_0 _id_A5A4::_id_32E0( "loaded" );
    wait 1.5;
    var_0 _id_A5A4::_id_9D1F();
    var_3 = _func_0D9( "axis" );
    common_scripts\utility::_id_0D13( var_3, ::attack_fleeing_helicopter, var_0 );
    wait 5;
    common_scripts\utility::_id_383F( "choppers_flew_away" );
}

attack_fleeing_helicopter( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        wait(_func_0B5( 0.5, 2.5 ));
        animscripts\shoot_behavior::_id_800A( "burst", 0 );
        self _meth_81EA( _func_0B5( 0.2, 1.0 ), var_0._id_02E2 );
    }
}

seaknight_doors()
{
    if ( !isdefined( level.seaknight_doors_close_anim ) )
        level.seaknight_doors_close_anim = level._id_9C82["script_vehicle_ch46e_opened_door"][1]._id_9CD0;

    level._id_9C82["script_vehicle_ch46e_opened_door"][1]._id_9CD0 = undefined;
    _id_A5A4::_id_32E0( "loaded" );
    self _meth_8147( level.seaknight_doors_close_anim, 1, 0, 1 );
}

missionendfailsafe()
{
    wait 120;
    common_scripts\utility::_id_383F( "choppers_flew_away" );
}

friendlies_into_choppers()
{
    common_scripts\utility::_id_383F( "ignore_friendly_move_commands" );
    level notify( "stop_casualty_tracking" );
    var_0[0] = _func_0C3( "chopper_ai_node1", "targetname" );
    var_0[1] = _func_0C3( "chopper_ai_node2", "targetname" );
    var_1 = 1;
    level.friendlies_not_in_chopper = 0;

    for ( var_2 = 0; var_2 < level.friendlies.size; var_2++ )
    {
        if ( !isdefined( level.friendlies[var_2] ) )
            continue;

        if ( !_func_1A1( level.friendlies[var_2] ) )
            continue;

        if ( var_1 == 0 )
            var_1 = 1;
        else if ( var_1 == 1 )
            var_1 = 0;

        level.friendlies[var_2] thread friendly_run_into_chopper( var_0[var_1] );
    }

    common_scripts\utility::_id_383F( "friendlies_moving_to_choppers" );

    while ( level.friendlies_not_in_chopper > 0 )
        wait 0.05;

    common_scripts\utility::_id_383F( "friendlies_in_choppers" );
}

friendly_run_into_chopper( var_0 )
{
    self endon( "death" );
    level.friendlies_not_in_chopper++;
    self._id_017D = 0;
    self.a._id_2B20 = 1;
    self._id_01FF = 1;
    self._id_01FB = 1;
    self._id_0273 = 0;
    self._id_0201 = 1;
    thread _id_A5A4::_id_4BB0( 1 );
    self _meth_82BC( 0 );
    self._id_01C4 = 32;
    self _meth_81A9( var_0 );
    self waittill( "goal" );

    if ( isdefined( self._id_58D7 ) )
        _id_A5A4::_id_8EA4();

    self notify( "boarded_chopper" );
    level.friendlies_not_in_chopper--;
    waitframe;
    self delete();
}

friendly_run_into_chopper_death_handler()
{
    self endon( "boarded_chopper" );
    self waittill( "death" );
    level.friendlies_not_in_chopper--;
}

friendly_fire_vehicle_thread()
{
    level endon( "getaway_vehicles_unloaded" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !_func_1AD( var_1 ) )
            continue;

        if ( common_scripts\utility::_id_382E( "mission_failed" ) )
            return;

        common_scripts\utility::_id_383F( "mission_failed" );

        if ( common_scripts\utility::_id_382E( "friendlies_loading_vehicles" ) )
            setdvar( "ui_deadquote", "@AC130_FRIENDLY_FIRE" );
        else
            setdvar( "ui_deadquote", "@AC130_CIVILIAN_FIRE_VEHICLE" );

        _id_A5A4::_id_5CDF();
    }
}

helicopter_driver_beacons( var_0 )
{
    var_1 = _id_A5A8::waittill_vehiclespawn( var_0 );

    for ( var_2 = 0; var_2 < var_1._id_750A.size; var_2++ )
    {
        if ( var_1._id_750A[var_2]._id_9D1B == 0 || var_1._id_750A[var_2]._id_9D1B == 5 )
            var_1._id_750A[var_2] thread maps\_ac130::add_beacon_effect( undefined, 1 );
    }
}

helictoper_friendly_fire( var_0 )
{
    var_1 = _id_A5A8::waittill_vehiclespawn( var_0 );

    for (;;)
    {
        var_1 waittill( "damage", var_2, var_3 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( !_func_1AD( var_3 ) )
            continue;

        if ( common_scripts\utility::_id_382E( "mission_failed" ) )
            return;

        common_scripts\utility::_id_383F( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_FRIENDLY_FIRE_HELICOPTER" );
        _id_A5A4::_id_5CDF();
    }
}

resetplayerkillcount()
{
    level.enemieskilledbyplayer = 0;
}

waitforplayerkillcount( var_0 )
{
    while ( level.enemieskilledbyplayer < var_0 )
        wait 1;
}

civilian_car_riders_spawn_and_idle()
{
    var_0 = getentarray( "civilian_car_rider", "targetname" );
    thread civilian_car_riders_spawn_and_idle_start( level.getaway_vehicle_1, var_0[0], "civiliandriver_car1" );
    thread civilian_car_riders_spawn_and_idle_start( level.getaway_vehicle_2, var_0[1], "civiliandriver_car2" );
}

civilian_car_riders_spawn_and_idle_start( var_0, var_1, var_2 )
{
    var_0.edriver = var_1 _meth_8096();
    _id_A5A4::_id_88F1( var_0.edriver );
    var_0.edriver _id_A5A4::_id_4462();
    var_0.edriver._id_01FF = 1;
    var_0.edriver._id_01FB = 1;
    var_0.edriver._id_0273 = 0;
    var_0.edriver._id_0201 = 1;
    var_0.edriver thread _id_A5A4::_id_4BB0( 1 );
    var_0.edriver.civilian = 1;
    var_0.edriver.melonhead_ignore = 1;
    var_0.edriver.tracksuit_ignore = 1;
    var_0.edriver._id_0C72 = var_2;
    var_0.edriver _id_A5A4::_id_7EAB( "runaway", 1, 1 );
    var_0.edriver _meth_804F( var_0 );
    var_0.edriver._id_0C72 = var_2;
    var_0.edriver thread _id_A510::_id_0BE1( var_0.edriver, "idle", "tag_driver", "stop_idle", var_0 );
    var_0.edriver thread civilian_car_riders_mission_fail();
    var_0.edriver endon( "death" );
    var_0.edriver waittill( "goal" );
    var_0.edriver delete();
}

civilian_car_riders_mission_fail()
{
    self endon( "goal" );

    while ( isdefined( self ) && _func_1A1( self ) )
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !_func_1AD( var_1 ) )
            continue;

        if ( common_scripts\utility::_id_382E( "mission_failed" ) )
            return;

        common_scripts\utility::_id_383F( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_CIVILIAN_FIRE" );
        _id_A5A4::_id_5CDF();
    }
}

hijack_friendlies_force_position()
{
    self endon( "hijack_friendlies_in_position" );
    wait 15;
    self _meth_81CA( self._id_01C3 );
}

do_hijack( var_0, var_1, var_2, var_3 )
{
    common_scripts\utility::_id_0D13( var_1, maps\ac130::_id_2D39, 1 );
    var_0 _meth_8059();
    common_scripts\utility::_id_0D13( var_1, ::hijack_friendlies_force_position );
    var_0 _id_A510::_id_0BF2( var_1, "hijack", "tag_detach", undefined, var_0 );
    _id_A5A4::_id_0CF4( var_1, "hijack_friendlies_in_position" );
    common_scripts\utility::_id_0D13( var_1, ::do_car_idle_after_hijack, var_0 );
    var_0.edriver notify( "stop_idle" );
    var_0.edriver _meth_8051();
    var_4 = [];
    var_5 = [];

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        if ( var_6 == 0 )
        {
            var_4[var_4.size] = var_1[var_6];
            continue;
        }

        var_5[var_5.size] = var_1[var_6];
    }

    var_4[var_4.size] = var_0.edriver;
    var_0 thread _id_A510::_id_0C18( var_4, "hijack", "tag_detach", undefined, var_0 );
    var_0 thread hijack_driver_flee();
    var_0 thread do_hijack_vehicle_anim( var_2 );
    var_4[0] waittill( "others_hijack_start" );
    var_0 thread do_hijack_vehicle_anim( var_3 );
    var_0 _id_A510::_id_0C18( var_5, "hijack", "tag_detach", undefined, var_0 );
    var_0 notify( "hijack_done" );
    common_scripts\utility::_id_0D13( var_1, maps\ac130::_id_2D39, 0 );
}

hijack_driver_flee()
{
    if ( self.edriver._id_0C72 == "civiliandriver_car2" )
        return;

    self.edriver waittillmatch( "single anim", "end" );
    self.edriver _id_A510::_id_0C21( self.edriver, "runaway" );
    var_0 = _func_0C3( self.edriver._id_04A4, "targetname" );
    self.edriver _meth_8143();
    self.edriver _meth_81A9( var_0 );
}

do_hijack_others( var_0 )
{
    var_0 notify( "others_hijack_start" );
}
#using_animtree("vehicles");

do_hijack_vehicle_anim( var_0 )
{
    self _meth_8117( #animtree );
    self _meth_814D( var_0 );
}

do_car_idle_after_hijack( var_0 )
{
    self waittillmatch( "single anim", "end" );
    self _meth_804F( var_0 );
    var_0 thread _id_A510::_id_0BE1( self, "idle", self._id_85AE, "stop_idle", var_0 );
    var_0 waittill( "getout" );
    _id_A5A4::_id_7E38( "r" );
    var_0 _id_A510::_id_0C24( self, "getout", self._id_85AE, undefined, var_0 );
    self _meth_8051();
}

sim_destruction()
{
    if ( !isdefined( self._id_0398 ) )
        return;

    thread trigger_40mm_hit_timeframe();

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !isdefined( level._id_244D ) )
        {
            if ( !_func_1AD( var_1 ) )
                continue;
        }

        if ( var_0 >= 999 )
            common_scripts\_exploder::_id_3528( self._id_0398 );

        if ( var_0 == 990 )
        {
            self notify( "40mm_damage" );
            continue;
        }

        if ( var_0 < 990 )
            continue;

        break;
    }

    self delete();
}

destructible_building()
{
    var_0 = getentarray( self._id_04A4, "targetname" );
    var_1 = [];
    var_2 = [];
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( var_0[var_4].classname == "script_origin" )
        {
            var_3 = var_0[var_4];
            continue;
        }

        var_5 = getentarray( var_0[var_4]._id_04A4, "targetname" );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_5[var_6]._id_0398 ) && var_5[var_6]._id_0398 == "exploderchunk" )
            {
                var_2[var_2.size] = var_5[var_6];
                continue;
            }

            var_1[var_1.size] = var_5[var_6];
        }
    }

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        var_0[var_4] _meth_8056();

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4] _meth_8056();

    thread trigger_40mm_hit_timeframe();

    for (;;)
    {
        self waittill( "damage", var_7, var_8, var_9, var_10, var_11 );

        if ( !isdefined( level._id_244D ) )
        {
            if ( !_func_1AD( var_8 ) )
                continue;
        }

        if ( _func_120( _func_123( var_11 ), "splash" ) )
            continue;

        if ( var_7 == 990 )
        {
            self notify( "40mm_damage" );
            continue;
        }

        if ( var_7 < 990 )
            continue;

        break;
    }

    thread _id_A5A4::arcademode_kill( self._id_02E2, "explosive", 1000 );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        var_0[var_4] _meth_8055();

    if ( var_7 == 1000 )
    {
        for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        {
            var_2[var_4] _meth_8055();
            var_12 = var_2[var_4]._id_02E2;
            var_13 = var_2[var_4].angles;
            var_14 = getent( var_2[var_4]._id_04A4, "targetname" );
            var_15 = var_14._id_02E2 - var_12;
            var_16 = var_15[0];
            var_17 = var_15[1];
            var_18 = var_15[2];
            var_2[var_4] _meth_82B9( ( var_16, var_17, var_18 ), 12 );
            var_2[var_4] _meth_82AE( ( var_16, var_17, var_18 ), 12 );
            thread _id_A5A4::_id_27EF( 12, _id_A5A4::_id_7C71 );
        }
    }

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_19 = -20 + _func_0B3( 40 );
        var_20 = -5 + _func_0B3( 10 );
        var_21 = -20 + _func_0B3( 40 );
        var_22 = 5.0;
        var_23 = 2.0;
        var_24 = 2.0;
        var_1[var_4] _meth_82AA( var_1[var_4]._id_02E2 - ( 0, 0, 512 ), var_22, var_23, var_24 );
        var_1[var_4] _meth_82B1( var_1[var_4].angles + ( var_19, var_20, var_21 ), var_22 / 2, var_23 / 2, var_24 / 2 );
        var_1[var_4] thread _id_A5A4::_id_27EF( 5.0, _id_A5A4::_id_7C71 );
    }

    self delete();
}

trigger_40mm_hit_timeframe()
{
    self endon( "deleting" );
    var_0 = 4.0;
    var_1 = 2;

    for (;;)
    {
        self waittill( "40mm_damage" );
        thread trigger_40mm_hit_timeframe_wait( var_0, var_1 );
    }
}

trigger_40mm_hit_timeframe_wait( var_0, var_1 )
{
    self endon( "deleting" );
    var_2 = gettime();
    var_1--;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        self waittill( "40mm_damage" );

    var_4 = gettime();
    var_5 = var_4 - var_2;

    if ( var_5 <= var_0 * 1000 )
    {
        self notify( "damage", 999, level._id_0318, undefined, undefined, "MOD_PROJECTILE" );
        self notify( "deleting" );
    }
}

get_exploder_anim_name()
{
    var_0 = undefined;
    var_1 = _func_124( self._id_04A6, ":;, " );

    if ( var_1.size > 1 && isdefined( var_1[1] ) )
        var_0 = var_1[1];
    else
        var_0 = self._id_029C + "_anim";

    return var_0;
}

get_exploderanimhides_in_array( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_353C[var_0] )
    {
        if ( isdefined( var_3._id_04A6 ) && _func_120( var_3._id_04A6, "exploderanimhide" ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

exploderanimhide_setup()
{
    level.ac130_exploder_finalstates = [ "h1_ac130_1story_final", "h1_ac130_1story_house_d_final", "h1_ac130_2story_house_d_final", "h1_ac130_2story_d_final", "h1_ac130_barn_sm_final", "h1_ac130_crane_final", "h1_ac130_l2story_final", "h1_ac130_shed_sm_final", "h1_ac130_watertower_final" ];

    foreach ( var_1 in level.ac130_exploder_finalstates )
        precachemodel( var_1 );

    foreach ( var_4 in _func_1D3( level._id_353C ) )
    {
        var_5 = get_exploderanimhides_in_array( var_4 );

        if ( isdefined( var_5 ) && var_5.size > 0 )
            thread exploderanimhide_think( var_5 );
    }
}

exploderanimhide_think( var_0 )
{
    var_1 = var_0[0];
    var_1 waittill( "play_exploder_anim" );
    wait 0.1;
    var_2 = var_1 get_exploder_anim_name();

    if ( isdefined( var_2 ) && common_scripts\utility::_id_0CE4( _func_1D3( level._id_78AC["exploder_script_model"] ), var_2 ) )
    {
        var_3 = level._id_78AC["exploder_script_model"][var_2];
        var_4 = getanimlength( var_3 );
        wait(var_4);
        var_5 = _func_122( var_1._id_029C, 0, var_1._id_029C.size - 1 ) + "_final";

        if ( common_scripts\utility::_id_0CE4( level.ac130_exploder_finalstates, var_5 ) )
        {
            var_6 = spawn( "script_model", var_1._id_02E2 );
            var_6 _meth_8056();
            var_6 _meth_80B3( var_5 );
            var_6.angles = var_1.angles;
            var_6 _meth_8055();

            foreach ( var_8 in var_0 )
                var_8 delete();
        }
        else
        {

        }
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_86C4()
{
    _id_72DB();
    _id_23A6();
    _id_72E6();
    apply_common_globalmix();
    level._id_6015 = 0;
    level._id_0318.radiation_state = "radiation_none";
    level._id_065D._id_2162 = [ [ "mute", 0 ], [ "slomo", 0 ], [ "deathsdoor", 0 ], [ "underwater", 0 ], [ "diveboat", 0 ], [ "wpn_int_med", 0 ], [ "bullet_metal_vehicle", 0 ], [ "bullet_whizby_glass", 0 ], [ "finale_handgun", 0 ] ];
    _func_07E( "interface", 0 );
    _func_07E( "notimescale", 0 );

    if ( common_scripts\utility::_id_51AE() )
        thread snd_ads_mix();
}

_id_72E6()
{
    level._id_78B9["squelches"]["plt"]["on"] = "squelch_on_plt";
    level._id_78B9["squelches"]["plt"]["off"] = "squelch_off_plt";
    level._id_78B9["squelches"]["hqr"]["on"] = "squelch_on_hqr";
    level._id_78B9["squelches"]["hqr"]["off"] = "squelch_off_hqr";
    level._id_78B9["squelches"]["prophet"]["on"] = "squelch_on_prophet";
    level._id_78B9["squelches"]["prophet"]["off"] = "squelch_off_hqr";
    level._id_78B9["squelches"]["battle_commander"]["on"] = "squelch_on_plt";
    level._id_78B9["squelches"]["battle_commander"]["off"] = "squelch_off_hqr";
    level._id_78B9["squelches"]["cormack_sfa"]["on"] = "squelch_on_plt";
    level._id_78B9["squelches"]["cormack_sfa"]["off"] = "squelch_off_hqr";
}

_id_23A6()
{
    level._id_065D._id_3337["explo_shake_over_distance"] = [ [ 0.0, 1.0 ], [ 0.25, 0.65 ], [ 0.35, 0.5 ], [ 0.75, 0.2 ], [ 1.0, 0.1 ] ];
    level._id_065D._id_3337["veh_crash_intensity_to_pitch"] = [ [ 0.0, 0.7 ], [ 0.1, 0.7 ], [ 0.5, 0.8 ], [ 0.9, 1.0 ], [ 1.0, 1.1 ] ];
    level._id_065D._id_3337["veh_crash_vel_to_lfe_vol"] = [ [ 0.0, 0.0 ], [ 200, 0.05 ], [ 500, 0.25 ], [ 850, 0.35 ], [ 1000, 0.6 ] ];
    level._id_065D._id_3337["aud_mute_device_falloff"] = [ [ 0.0, 1.0 ], [ 0.1, 0.9 ], [ 0.2, 0.88 ], [ 0.3, 0.85 ], [ 0.4, 0.82 ], [ 0.5, 0.8 ], [ 0.6, 0.65 ], [ 0.7, 0.5 ], [ 0.8, 0.35 ], [ 0.9, 0.15 ], [ 1.0, 0.0 ] ];
}

apply_common_globalmix()
{
    if ( common_scripts\utility::_id_51AE() )
        _id_A5DE::_id_5CF2( "sp_common_global_mix" );
}

_id_4C73()
{
    if ( level._id_00E3 )
        level._id_065D._id_0B52["exp_generic_explo_shot"] = [ [ "exp_generic_explo_shot_04", 0.17 ], [ "exp_generic_explo_shot_07", 0.11 ], [ "exp_generic_explo_shot_10", 0.22 ], [ "exp_generic_explo_shot_12", 0.15 ], [ "exp_generic_explo_shot_13", 0.08 ], [ "exp_generic_explo_shot_20", 0.15 ], [ "exp_generic_explo_shot_22", 0.25 ] ];
    else
        level._id_065D._id_0B52["exp_generic_explo_shot"] = [ [ "exp_generic_explo_shot_01", 0.13 ], [ "exp_generic_explo_shot_02", 0.25 ], [ "exp_generic_explo_shot_03", 0.12 ], [ "exp_generic_explo_shot_04", 0.17 ], [ "exp_generic_explo_shot_05", 0.16 ], [ "exp_generic_explo_shot_06", 0.14 ], [ "exp_generic_explo_shot_07", 0.11 ], [ "exp_generic_explo_shot_08", 0.21 ], [ "exp_generic_explo_shot_09", 0.16 ], [ "exp_generic_explo_shot_10", 0.22 ], [ "exp_generic_explo_shot_11", 0.13 ], [ "exp_generic_explo_shot_12", 0.15 ], [ "exp_generic_explo_shot_13", 0.08 ], [ "exp_generic_explo_shot_14", 0.16 ], [ "exp_generic_explo_shot_16", 0.2 ], [ "exp_generic_explo_shot_17", 0.1 ], [ "exp_generic_explo_shot_18", 0.08 ], [ "exp_generic_explo_shot_19", 0.12 ], [ "exp_generic_explo_shot_20", 0.15 ], [ "exp_generic_explo_shot_21", 0.15 ], [ "exp_generic_explo_shot_22", 0.25 ] ];
}

_id_4CFF()
{
    level._id_065D._id_04F0._id_8FF2 = [ "vehicle", "wood", "metal" ];
}

_id_4CBC()
{
    level._id_065D._id_1572._id_8FF2 = [ "ice", "asphalt", "concrete", "metal", "metal_solid" ];
}

_id_72DB()
{
    _id_A5E8::_id_874D( "player_death", ::_id_6AC6 );
    _id_A5E8::_id_874D( "friendly_fire_mission_failed", ::friendly_fire_mission_failed );
    _id_A5E8::_id_874D( "end_mission_fade_to_black", ::end_mission_fade_to_black );
    _id_A5E8::_id_874D( "wpn_deam160_init", ::_id_A359 );
    _id_A5E8::_id_874D( "wpn_deam160_charge", ::_id_A356 );
    _id_A5E8::_id_874D( "wpn_deam160_charge_dots_increase", ::_id_A357 );
    _id_A5E8::_id_874D( "wpn_deam160_full_charge", ::_id_A358 );
    _id_A5E8::_id_874D( "wpn_deam160_shot", ::_id_A35C );
    _id_A5E8::_id_874D( "variable_grenade_type_switch", ::_id_9C60 );
    _id_A5E8::_id_874D( "paint_grenade_detonate", ::_id_665C );
    _id_A5E8::_id_874D( "emp_grenade_detonate", ::_id_306C );
    _id_A5E8::_id_874D( "smart_grenade_detonate", ::_id_8660 );
    _id_A5E8::_id_874D( "foam_grenade", ::_id_393A );
    _id_A5E8::_id_874D( "aud_sonar_vision_on", ::_id_1097 );
    _id_A5E8::_id_874D( "aud_sonar_vision_off", ::_id_1096 );
    _id_A5E8::_id_874D( "explo_ambientExp_dirt", ::_id_351D );
    _id_A5E8::_id_874D( "explo_ambientExp_fireball", ::_id_351E );
    _id_A5E8::_id_874D( "play_vehicle_collision", ::_id_8747 );
    _id_A5E8::_id_874D( "start_vehicle_shell_shock", ::start_vehicle_shell_shock );
    _id_A5E8::_id_874D( "aud_radiation_shellshock", ::aud_radiation_shellshock );
    _id_A5E8::_id_874D( "boost_jump_enable", ::_id_1575 );
    _id_A5E8::_id_874D( "boost_jump_disable", ::_id_1573 );
    _id_A5E8::_id_874D( "boost_jump_disable_npc", ::_id_1574 );
    _id_A5E8::_id_874D( "boost_jump_player", ::_id_1579 );
    _id_A5E8::_id_874D( "boost_land_player", ::_id_1589 );
    _id_A5E8::_id_874D( "boost_jump_npc", ::_id_1578 );
    _id_A5E8::_id_874D( "boost_land_npc", ::_id_1585 );
    _id_A5E8::_id_874D( "pdrone_death_explode", ::_id_6776 );
    _id_A5E8::_id_874D( "pdrone_emp_death", ::_id_677A );
    _id_A5E8::_id_874D( "pdrone_crash_land", ::_id_6772 );
    _id_A5E8::_id_874D( "doorshield_ripoff", ::_id_2D6B );
    _id_A5E8::_id_874D( "doorshield_throw", ::_id_2D6C );
    _id_A5E8::_id_874D( "exo_raise_shield", ::_id_34D4 );
    _id_A5E8::_id_874D( "exo_lower_shield", ::_id_34A7 );
    _id_A5E8::_id_874D( "snd_cloak_init", ::_id_86C3 );
    _id_A5E8::_id_874D( "exo_cloak_button_press", ::_id_3472 );
    _id_A5E8::_id_874D( "exo_cloak_enable", ::_id_3474 );
    _id_A5E8::_id_874D( "exo_cloak_disable", ::_id_3473 );
    _id_A5E8::_id_874D( "exo_cloak_battery_low", ::_id_3470 );
    _id_A5E8::_id_874D( "exo_cloak_battery_dead", ::_id_346F );
    _id_A5E8::_id_874D( "exo_cloak_battery_recharge", ::_id_3471 );
    _id_A5E8::_id_874D( "npc_cloak_buttons", ::_id_6246 );
    _id_A5E8::_id_874D( "npc_cloak_enable", ::_id_6247 );
    _id_A5E8::_id_874D( "npc_cloak_disable", ::_id_6247 );
    _id_A5E8::_id_874D( "overdrive_on", ::_id_65E9 );
    _id_A5E8::_id_874D( "overdrive_off", ::_id_65E8 );
    _id_A5E8::_id_874D( "sonic_blast", ::_id_8881 );
    _id_A5E8::_id_874D( "sonic_blast_aftershock", ::_id_8882 );
    _id_A5E8::_id_874D( "sonic_blast_done", ::_id_8883 );
    _id_A5E8::_id_874D( "exo_stim_on", ::_id_34EF );
    _id_A5E8::_id_874D( "boost_dodge_activate_plr", ::_id_156E );
    _id_A5E8::_id_874D( "boost_land_hud_enable", ::_id_1582 );
    _id_A5E8::_id_874D( "boost_land_hud_disable", ::_id_1581 );
    _id_A5E8::_id_874D( "boost_land_out_of_fuel", ::_id_1587 );
    _id_A5E8::_id_874D( "boost_land_use_fuel", ::_id_158D );
    _id_A5E8::_id_874D( "boost_land_assist_npc", ::_id_157E );
    _id_A5E8::_id_874D( "boost_land_assist_npc_ground", ::_id_157F );
    _id_A5E8::_id_874D( "tracking_grenade_hover", ::_id_94CB );
    _id_A5E8::_id_874D( "tracking_grenade_jump", ::_id_94CC );
    _id_A5E8::_id_874D( "tracking_grenade_strike", ::_id_94CF );
    _id_A5E8::_id_874D( "tracking_grenade_dud", ::_id_94C7 );
    _id_A5E8::_id_874D( "tracking_grenade_beep", ::_id_94C5 );
    _id_A5E8::_id_874D( "anml_doberman", ::_id_0C90 );
    _id_A5E8::_id_874D( "finish_mission_fade", ::_id_3792 );
    _id_A5E8::_id_874D( "aud_start_ragtime_warfare", ::aud_start_ragtime_warfare );
    _id_A5E8::_id_874D( "aud_stop_ragtime_warfare", ::aud_stop_ragtime_warfare );
}

_id_6AC6()
{
    level notify( "kill_deaths_door_audio" );
    _id_A5DE::_id_5CF6( "deaths_door" );
    _id_A5DE::_id_5CF2( "player_dead" );
    _id_A5FB::_id_872B( "bullet_large_fatal" );
}

friendly_fire_mission_failed()
{
    if ( !isdefined( level.ff_mission_failed_already_playing ) && common_scripts\utility::_id_51AE() )
    {
        _id_A5DE::_id_5CF2( "friendly_fire_failed_mix" );
        _id_A5FB::_id_872B( "friendly_fire_mission_failed" );
        level.ff_mission_failed_already_playing = 1;
    }
}

end_mission_fade_to_black()
{
    if ( common_scripts\utility::_id_51AE() )
        _id_A5DE::_id_5CF2( "fade_to_black_end_mix" );
}

_id_A359()
{
    level._id_A355 = 0;
}

_id_A35C( var_0 )
{
    var_1 = var_0;
    level._id_A355 = 0;

    switch ( var_1 )
    {
        case "large":
            _id_A5DC::_id_289C( "wpn_deam160_shot_max" );
            level notify( "aud_deam160_charge_break" );
            break;
        case "medium":
            _id_A5DC::_id_289C( "wpn_deam160_shot_med" );
            level notify( "aud_deam160_charge_break" );
            break;
        case "small":
            _id_A5DC::_id_289C( "wpn_deam160_shot_sml" );
            level notify( "aud_deam160_charge_break" );
            break;
    }
}

_id_A356( var_0 )
{
    var_1 = _id_A5DC::_id_289E( "wpn_deam160_charge_hi", level._id_0318, "oneshot" );
    thread _id_A35B();
    level._id_0318 thread _id_A35D();
    level._id_0318 thread _id_A35A();
    level waittill( "aud_deam160_charge_break" );

    if ( isdefined( var_1 ) )
        var_1 _meth_8071( 0, 0.05 );
}

_id_A35D()
{
    level endon( "aud_deam160_charge_break" );

    for (;;)
    {
        if ( self _meth_812E() || self _meth_8333() || self _meth_8130() || self _meth_82DD() )
        {
            level notify( "aud_deam160_charge_break" );
            break;
        }

        wait 0.05;
    }
}

_id_A35A()
{
    level endon( "aud_deam160_charge_break" );

    for (;;)
    {
        var_0 = _func_242( self _meth_830E() );

        if ( !var_0 )
        {
            level notify( "aud_deam160_charge_break" );
            break;
        }

        wait 0.05;
    }
}

_id_A35B()
{
    level endon( "aud_deam160_charge_break" );
    var_0 = _id_A5DC::_id_289E( "wpn_deam160_charge_hi_lp", level._id_0318, "loop", "aud_deam160_charge_break" );
    var_0 _meth_8071( 0, 0.05 );
    wait 2;

    if ( isdefined( var_0 ) )
        var_0 _meth_8071( 1, 0.4 );
}

_id_A357( var_0 )
{
    level._id_A355++;
}

_id_A358()
{
    var_0 = _id_A5DC::_id_289E( "wpn_deam160_full_charge_beep_lp", level._id_0318, "loop", "aud_deam160_charge_break" );
    level waittill( "aud_deam160_charge_break" );
}

_id_9C60( var_0 )
{
    level._id_10D3 = var_0;
    _id_A5FB::_id_872B( "var_grenade_change_type" );
}

_id_665C()
{
    var_0 = self;
    _id_A5FB::_id_872E( "wpn_paint_grenade_exp", var_0._id_02E2 );
}

_id_306C()
{
    var_0 = self;
    _id_A5FB::_id_872E( "wpn_emp_grenade_exp", var_0._id_02E2 );
}

_id_8660()
{
    level notify( "kill_tracking_loop" );
    var_0 = self;
    _id_A5FB::_id_872E( "wpn_smart_grenade_exp", var_0._id_02E2 );
}

_id_393A( var_0 )
{
    _id_A5DE::_id_5CF2( "foam_grenade_mix", 0.5 );
    var_1 = self._id_02E2;
    wait 2.1;
    _id_A5DC::_id_289E( "foam_bomb_equip", var_0 );
    wait 1.1;
    _id_A5DC::_id_289E( "foam_bomb_pin_pull", var_0 );
    wait 1.3;
    _id_A5DC::_id_289F( "foam_bomb_wall_stick", var_1 );
    level waittill( "vfx_foam_corridor_explode_start" );
    _id_A5DC::_id_289F( "foam_bomb_corridor_exp", var_1 );
    wait 2.0;
    _id_A5DE::_id_5CF6( "foam_grenade_mix", 0.5 );
}

_id_0FD1()
{
    var_0 = self._id_02E2;
    thread _id_A5FB::_id_872E( "wpn_mw_grenade_exp", var_0 );
    var_1 = thread _id_A5FB::_id_8740( "wpn_mw_grenade_pulse_sweeps_lp", var_0, "mw_nade_death", 0.2, 0.45 );
    var_2 = thread _id_A5FB::_id_8740( "wpn_mw_grenade_pulse_big_lp", var_0, "mw_nade_death", 0.2, 0.45 );
    self waittill( "death" );
    thread _id_A5FB::_id_872E( "wpn_mw_grenade_die", var_0 );

    if ( isdefined( var_2 ) )
        var_2 _meth_8071( 0, 0.3 );

    if ( isdefined( var_1 ) )
        var_1 _meth_8071( 0, 0.3 );

    wait 0.3;

    if ( isdefined( var_2 ) )
        var_2 _meth_80AE();

    if ( isdefined( var_1 ) )
        var_1 _meth_80AE();
}

_id_0FD3( var_0 )
{
    if ( isdefined( var_0 ) )
        thread _id_A5FB::_id_872E( "wpn_mw_grenade_elect", var_0 );
}

_id_0FD2( var_0 )
{
    if ( isdefined( var_0 ) )
        var_0 thread _id_A5FB::_id_8738( "wpn_mw_grenade_elect" );
}

snd_ads_mix()
{
    level._id_0318 endon( "death" );

    for (;;)
    {
        while ( !level._id_0318 _id_A5A4::_id_50A9() )
            wait 0.05;

        if ( _func_1B8( level._id_0318 _meth_830E() ) == "sniper" )
            _id_A5DE::_id_5CF2( "sniper_ads_mix" );
        else
            _id_A5DE::_id_5CF2( "ads_mix" );

        while ( level._id_0318 _id_A5A4::_id_50A9() )
            wait 0.05;

        _id_A5DE::_id_5CF6( "ads_mix" );
        _id_A5DE::_id_5CF6( "sniper_ads_mix" );
    }
}

_id_8717( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );
    thread _id_879C();
    thread _id_879D();

    if ( !isdefined( self._id_0E57 ) )
        self._id_0E57 = spawnstruct();

    self._id_0E57._id_601A = 1;
    self._id_0E57._id_6019 = 1;

    if ( isdefined( var_2 ) )
        var_6 = var_2;
    else
        var_6 = var_1 + 250;

    level._id_6015 = 1;

    if ( isdefined( var_4 ) )
    {
        self._id_0E57._id_6018 = 1;
        thread _id_A5F7::_id_86DB( var_4, 0.5 );
    }

    var_7 = 0;
    thread _id_87A2( var_0, var_3, var_7 );

    while ( isdefined( self._id_0E57._id_601A ) )
    {
        var_8 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

        if ( var_8 < var_1 )
        {
            if ( !isdefined( self._id_0E57._id_601C ) )
            {
                self notify( "mute_device_bubble_enter" );
                _id_A5DE::_id_5CF2( var_0, 0.05 );
                self._id_0E57._id_586C = _id_A5FB::_id_873F( "mute_device_active_lp", "stop_mute_device_lp", 5, 3, 1 );
                self._id_0E57._id_601C = 1;
            }

            _id_A5DE::_id_5CF3( var_0, 1 );

            if ( !isdefined( self._id_0E57._id_6018 ) && isdefined( var_4 ) )
            {
                self._id_0E57._id_6018 = 1;
                thread _id_A5F7::_id_86DB( var_4, 0.5 );

                if ( !isdefined( self._id_0E57._id_6016 ) )
                {
                    self notify( "mute_device_bubble_enter" );
                    _id_A5FB::_id_872F( "mute_device_active_enter", 0.05 );
                    self._id_0E57._id_6019 = 1;
                    thread _id_87A3( self._id_0E57._id_6016 );
                    self._id_0E57._id_586C _meth_8071( 1.0, 2 );
                }
            }
        }
        else if ( var_8 < var_6 && self._id_0E57._id_601C == 1 )
        {
            var_9 = ( var_8 - var_1 ) / ( var_6 - var_1 );
            _func_0E9( var_9, 0, 1 );
            var_10 = _id_A5E8::_id_8708( var_9, level._id_065D._id_3337["aud_mute_device_falloff"] );
            _id_A5DE::_id_5CF3( var_0, var_10 );

            if ( isdefined( self._id_0E57._id_6018 ) )
            {
                self._id_0E57._id_6018 = undefined;
                thread _id_A5F7::_id_86DC( 1 );

                if ( !isdefined( self._id_0E57._id_6017 ) )
                {
                    thread _id_879F( "mute_device_bubble_exit", 0.5 );
                    _id_A5FB::_id_872F( "mute_device_active_exit", 0.05 );
                    self._id_0E57._id_6019 = 0;
                    thread _id_87A3( self._id_0E57._id_6017 );
                    self._id_0E57._id_586C _meth_8071( 0.0, 2 );
                }
            }
        }
        else if ( self._id_0E57._id_601C == 1 )
        {
            _id_A5DE::_id_5CF3( var_0, 0 );

            if ( isdefined( self._id_0E57._id_6018 ) )
            {
                wait 0.05;
                self._id_0E57._id_6018 = undefined;
                thread _id_A5F7::_id_86DC( 1 );
                self._id_0E57._id_586C _meth_8071( 0.0, 2 );
            }
        }

        wait 0.05;
    }

    level._id_6015 = 0;
}

_id_879F( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    wait(var_2);
    self notify( var_0 );
}

_id_87A2( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "turn_off" );
    thread _id_87A0( var_0, "death" );
    thread _id_87A0( var_0, "turn_off" );
    var_3 = 30;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    wait(var_3);
    self notify( "complete" );
    thread _id_87A1( var_0 );
}

_id_87A1( var_0 )
{
    if ( isdefined( self._id_0E57._id_586C ) )
        level notify( "stop_mute_device_lp" );

    if ( self._id_0E57._id_6019 )
    {
        thread _id_879F( "mute_device_bubble_exit", 0.5 );
        thread _id_879F( "mute_device_bubble_off", 1 );

        if ( !isdefined( self._id_0E57._id_6017 ) )
            _id_A5FB::_id_872F( "mute_device_active_exit", 0.05 );
    }

    self._id_0E57._id_601A = undefined;
    _id_A5DE::_id_5CF6( var_0, 3 );
    self._id_0E57._id_6018 = undefined;
    _id_A5F7::_id_86DC( 3 );
}

_id_87A0( var_0, var_1 )
{
    self endon( "complete" );
    var_2 = "death";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    self waittill( var_2 );
    thread _id_87A1( var_0 );
    self notify( "complete" );
}

_id_87A3( var_0 )
{
    var_0 = 1;
    wait 2;
    var_0 = undefined;
}

_id_879E( var_0 )
{
    self endon( "death" );
    var_1 = var_0;
}

_id_879C()
{
    self endon( "mute_device_bubble_off" );

    while ( isdefined( self ) )
    {
        self waittill( "mute_device_bubble_enter" );
        _id_6DA6( "mute_breach_distort_vm_enter" );
        self waittill( "mute_device_bubble_exit" );
        _id_536A( "mute_breach_distort_vm_enter" );
        _id_6DA6( "mute_breach_distort_vm_exit" );
        wait 0.05;
    }
}

_id_879D()
{
    while ( isdefined( self ) )
    {
        self waittill( "mute_device_bubble_off" );
        wait 0.05;
    }
}

_id_6DA6( var_0 )
{
    if ( isdefined( self ) && isdefined( level._id_058F[var_0] ) )
        playfxontag( common_scripts\utility::_id_3FA8( var_0 ), self, "tag_origin" );
    else
    {

    }
}

_id_536A( var_0 )
{
    if ( isdefined( self ) && isdefined( level._id_058F[var_0] ) )
        killfxontag( common_scripts\utility::_id_3FA8( var_0 ), self, "tag_origin" );
    else
    {

    }
}

_id_1097()
{
    _id_A5DE::_id_5CF2( "sonar_vision", 0.05 );
    _id_A5DC::_id_289C( "sonar_vision_on" );
}

_id_1096()
{
    _id_A5DC::_id_289C( "sonar_vision_off" );
    _id_A5DE::_id_5CF6( "sonar_vision", 1.0 );
}

_id_6776()
{
    var_0 = self;
    var_1 = var_0._id_02E2;

    while ( isdefined( var_0 ) )
    {
        var_1 = var_0._id_02E2;
        wait 0.05;
    }

    _id_A5FB::_id_872E( "pdrone_exp", var_1 );
}

_id_677A( var_0 )
{
    var_0 _id_A5FB::_id_8738( "pdrone_emp_death" );
    var_0 _id_A5FB::_id_8738( "pdrone_deathspin", "kill_drone_deathspin" );
}

_id_6772( var_0 )
{
    _id_A5FB::_id_872E( "pdrone_exp", var_0 );
    level notify( "kill_drone_deathspin" );
}

_id_2D6B()
{
    _id_86D3( "bullet_metal_vehicle" );
    _id_A5DE::_id_5CF2( "doorshield_rip_player" );
    _id_A5FB::_id_872F( "doorshield_foley_plr", 0.15 );
    _id_A5FB::_id_872F( "doorshield_grabs_plr", 0.2 );
    _id_A5FB::_id_872F( "doorshield_tension_plr", 0.85 );
    _id_A5FB::_id_872F( "doorshield_rip_plr", 1.1 );
    _id_A5FB::_id_872F( "doorshield_debris_plr", 1.15 );
    wait 3;
    _id_A5DE::_id_5CF6( "doorshield_rip_player" );
}

_id_2D6C()
{
    _id_A5FB::_id_872B( "exo_throw_start" );
    _id_86CD( "bullet_metal_vehicle" );
}

_id_34D4()
{
    _id_A5FB::_id_872F( "exo_shield_open", 0.5 );
    _id_86D3( "bullet_metal_vehicle" );
}

_id_34A7()
{
    _id_A5FB::_id_872F( "exo_shield_close", 0.05 );
    _id_86CD( "bullet_metal_vehicle" );
}

_id_1575()
{

}

_id_1573()
{

}

_id_1574( var_0 )
{
    var_1 = var_0;
    _id_A5DC::_id_289E( "tac_npc_boost_power_dwn", var_1 );
}

_id_1579()
{
    if ( !isdefined( level._id_065D._id_1572 ) )
    {
        level._id_065D._id_1572 = spawnstruct();
        level._id_065D._id_1572._id_5044 = 0;
        thread _id_4CBC();
    }

    var_0 = self;

    if ( var_0 == level._id_0318 )
        level._id_065D._id_1572._id_5044 = 1;
}

_id_1589( var_0 )
{
    var_1 = 40;
    var_2 = 10;

    if ( !isdefined( level._id_065D._id_1572 ) )
    {
        level._id_065D._id_1572 = spawnstruct();
        level._id_065D._id_1572._id_5044 = 0;
        thread _id_4CBC();
    }

    var_3 = self;

    if ( var_3 == level._id_0318 )
    {
        if ( level._id_065D._id_1572._id_5044 == 1 )
        {
            var_4 = _id_8793( var_0, var_1, var_2 );
            var_5 = _id_8792( var_0, var_1, var_2 );
            var_6 = "pc_boost_land_" + var_5;
            level._id_065D._id_1572._id_5044 = 0;

            if ( isdefined( level._id_065D._id_1572._id_52BB ) )
                _id_A5DC::_id_0F1C( level._id_065D._id_1572._id_52BB, 0.5 );

            if ( var_0 < var_2 )
                return;

            var_7 = _func_23D( var_3._id_02E2 + ( 0, 0, 16 ), var_3._id_02E2 + ( 0, 0, -16 ), var_3 )["surfacetype"];
            var_8 = _id_8703( var_7, level._id_065D._id_1572._id_8FF2 );

            if ( var_8 )
                var_9 = "boost_land_surface_" + var_5 + "_" + var_7;
        }
    }
}

_id_8793( var_0, var_1, var_2 )
{
    var_0 = _func_0E9( var_0, var_2, var_1 );
    var_3 = var_0 / var_1;
    return var_3;
}

_id_8792( var_0, var_1, var_2 )
{
    if ( var_0 <= var_2 )
        var_3 = "lt";
    else if ( var_0 <= var_1 )
        var_3 = "med";
    else
        var_3 = "hvy";

    return var_3;
}

_id_1578()
{
    var_0 = self;

    if ( level._id_038E == "recovery" )
        _id_A5DC::_id_289E( "npc_boost_jump_rec", var_0 );
    else
        _id_A5DC::_id_289E( "npc_boost_jump", var_0 );
}

_id_1585()
{
    var_0 = self;

    if ( level._id_038E == "recovery" )
        _id_A5DC::_id_289E( "npc_boost_land_med_rec", var_0 );
    else
        _id_A5DC::_id_289E( "npc_boost_land_med", var_0 );
}

_id_156E()
{
    level._id_065D._id_1572._id_5044 = 0;

    if ( isdefined( level._id_065D._id_1572._id_52BB ) )
        _id_A5DC::_id_0F1C( level._id_065D._id_1572._id_52BB, 0.5 );
}

_id_1582()
{
    _id_A5FB::_id_872B( "tac_pc_boost_land_assist_pwrup" );
}

_id_1581()
{
    _id_A5FB::_id_872B( "tac_pc_boost_land_assist_pwrdown" );
}

_id_158D( var_0 )
{
    var_1 = 0.5;

    if ( !isdefined( level._id_0E57._id_1586 ) )
    {
        level._id_0E57._id_1586 = 1;
        thread _id_1588();
        level._id_0318 _id_A5FB::_id_8742( "tac_pc_boost_land_assist_jet_lp", var_0, 0.1, 0.2 );
        level waittill( var_0 );
        var_2 = _func_101();

        if ( !isdefined( level._id_0E57._id_158C ) )
        {
            level._id_0E57._id_158C = var_2;
            _id_A5FB::_id_872B( "tac_pc_boost_land_assist_release" );
        }
        else if ( var_2 - level._id_0E57._id_158C >= var_1 / 0.05 )
        {
            level._id_0E57._id_158C = var_2;
            _id_A5FB::_id_872B( "tac_pc_boost_land_assist_release" );
        }

        level._id_0E57._id_1586 = undefined;
    }
}

_id_158E()
{
    for (;;)
    {
        var_0 = _func_0F1( level._id_0318 _meth_8336() );
        iprintlnbold( var_0 );
        wait 0.05;
    }
}

_id_1588()
{
    var_0 = 1000;
    var_1 = 7500;
    var_2 = 500;

    if ( !isdefined( level._id_0E57._id_1580 ) )
        level._id_0E57._id_1580 = 1;

    if ( !isdefined( level._id_0E57._id_1583 ) )
        level._id_0E57._id_1583 = 0;

    var_3 = _func_0F1( level._id_0318 _meth_8336() );

    if ( var_3 >= var_0 || level._id_0E57._id_1580 == 1 )
    {
        if ( level._id_0E57._id_1583 == 0 )
        {
            thread _id_1584();
            _id_A5FB::_id_872B( "tac_pc_boost_land_assist_shot_max" );
            level._id_0E57._id_1580 = 0;
        }
        else if ( level._id_0E57._id_1583 == 1 )
            _id_A5FB::_id_872B( "tac_pc_boost_land_assist_shot_sml" );
    }
    else if ( var_3 < var_0 && var_3 >= var_2 )
        _id_A5FB::_id_872B( "tac_pc_boost_land_assist_shot_med" );
    else if ( var_3 < var_1 )
        _id_A5FB::_id_872B( "tac_pc_boost_land_assist_shot_sml" );
}

_id_1584()
{
    var_0 = 4.0;

    if ( !isdefined( level._id_0E57._id_1584 ) )
        level._id_0E57._id_1584 = 0;

    for (;;)
    {
        level._id_0E57._id_1584 += 0.1;
        level._id_0E57._id_1583 = 1;
        wait 0.1;

        if ( level._id_0E57._id_1584 > var_0 )
        {
            level._id_0E57._id_1584 = 0;
            level._id_0E57._id_1583 = 0;
            break;
        }
    }
}

_id_158B()
{
    var_0 = 0.1;

    if ( !isdefined( level._id_0E57._id_158B ) )
        level._id_0E57._id_158B = 0;

    for (;;)
    {
        level._id_0E57._id_158B += 0.1;
        level._id_0E57._id_158A = 1;
        wait 0.1;

        if ( level._id_0E57._id_158B > var_0 )
        {
            level._id_0E57._id_158B = 0;
            level._id_0E57._id_158A = 0;
            break;
        }
    }
}

_id_157E()
{
    _id_A5FB::_id_8738( "boost_land_assist_npc" );
}

_id_157F()
{
    _id_A5FB::_id_8738( "boost_land_assist_npc_ground" );
}

_id_1587()
{

}

_id_94CB( var_0 )
{
    var_0 _id_A5FB::_id_8738( "track_grenade_hover", "kill_tracking_loop" );
    var_0 _id_A5FB::_id_8742( "track_grenade_loop", "kill_tracking_loop", undefined, 1.2 );
    var_0 waittill( "death" );
    level notify( "kill_tracking_loop" );
}

_id_94CC( var_0 )
{
    var_0 _id_A5FB::_id_8738( "track_grenade_jump" );
}

_id_94CF( var_0 )
{
    var_0 _id_A5FB::_id_8738( "track_grenade_strike" );
    var_0 notify( "kill_tracking_loop" );
}

_id_94C7( var_0 )
{
    var_0 _id_A5FB::_id_8738( "track_grenade_dud" );
    level notify( "kill_tracking_loop" );
}

_id_94C5( var_0 )
{
    var_0 _id_A5FB::_id_8738( "track_grenade_beep" );
}

_id_0C90( var_0 )
{
    var_1 = "anml_doberman_" + var_0;

    if ( isdefined( self._id_86F1 ) )
        level notify( self._id_86F1 );

    self._id_86F1 = "anml_doberman_" + _id_A5E8::_id_8718();

    if ( var_0 == "death" )
        _id_A5FB::_id_872E( var_1, self._id_02E2, self._id_86F1, 0, 0.1 );
    else
        _id_A5FB::_id_8738( var_1, self._id_86F1, 0, 0.15 );
}

_id_3792( var_0 )
{
    _id_A5DE::_id_5CF2( "mute_all", var_0 );
}

_id_86C3()
{
    common_scripts\utility::_id_383D( "snd_cloak_is_enabled" );
}

_id_3472()
{
    _id_A5DC::_id_289C( "exo_cloak_buttons" );
}

_id_3474()
{
    if ( !common_scripts\utility::_id_382E( "snd_cloak_is_enabled" ) )
    {
        common_scripts\utility::_id_383F( "snd_cloak_is_enabled" );
        _id_A5DC::_id_289E( "exo_cloak_enable_click", level._id_0318 );
        _id_A5DC::_id_289E( "exo_cloak_enable", level._id_0318 );
        _id_A5DC::_id_2892( "exo_cloak_enable_wide", 0.4 );
    }

    thread _id_3470();
}

_id_3473()
{
    common_scripts\utility::_id_3831( "snd_cloak_is_enabled" );
    _id_A5DC::_id_289E( "exo_cloak_enable_click", level._id_0318 );
    _id_A5DC::_id_289E( "exo_cloak_disable", level._id_0318 );
    _id_A5DC::_id_2892( "exo_cloak_disable_wide", 0.2 );
    wait 1;
    thread _id_3471();
}

_id_3470()
{
    level notify( "kill_exo_cloak_battery_low" );
    level endon( "kill_exo_cloak_battery_low" );
    var_0 = level._id_0571._id_1F9D;
    var_1 = undefined;

    while ( common_scripts\utility::_id_382E( "snd_cloak_is_enabled" ) )
    {
        var_2 = level._id_0571._id_1F9D;

        if ( var_2 <= 0.26 && var_0 > 0.26 )
            var_1 = _id_A5DC::_id_289E( "exo_cloak_battery_low", level._id_0318, "loop", "notify_stop_exo_cloak_battery_low" );
        else if ( var_2 >= 0.26 && var_0 < 0.26 )
            level notify( "notify_stop_exo_cloak_battery_low" );

        var_0 = var_2;
        wait 0.05;
    }

    if ( isdefined( var_1 ) )
    {
        var_1 _meth_8071( 0, 0.25 );
        wait 0.25;
        level notify( "notify_stop_exo_cloak_battery_low" );
    }
}

_id_346F()
{
    common_scripts\utility::_id_3831( "snd_cloak_is_enabled" );
    _id_A5DC::_id_289E( "exo_cloak_disable", level._id_0318 );
    _id_A5DC::_id_2892( "exo_cloak_battery_dead", 0.25 );
    wait 3;
    thread _id_3471();
}

_id_3471()
{
    var_0 = _id_A5DC::_id_289C( "exo_cloak_battery_recharge" );

    while ( level._id_0571._id_1F9D < 1.0 && !common_scripts\utility::_id_382E( "snd_cloak_is_enabled" ) )
        wait 0.1;

    if ( isdefined( var_0 ) )
        var_0 _meth_8071( 0, 0.25 );
}

_id_6246( var_0 )
{
    var_1 = self;

    if ( var_0 == "cornercrouch_right_cloak_toggle" )
    {
        _id_A5DC::_id_2894( "exo_cloak_npc_buttons", var_1, 1 );
        _id_A5DC::_id_2894( "exo_cloak_npc_buttons", var_1, 6.5 );
    }
    else if ( var_0 == "cornercrouch_left_cloak_toggle" )
    {
        _id_A5DC::_id_2894( "exo_cloak_npc_buttons", var_1, 1 );
        _id_A5DC::_id_2894( "exo_cloak_npc_buttons", var_1, 6.75 );
    }
    else
    {
        _id_A5DC::_id_2894( "exo_cloak_npc_buttons", var_1, 1.2 );
        _id_A5DC::_id_2894( "exo_cloak_npc_buttons", var_1, 6.4 );
    }
}

_id_6247()
{
    var_0 = self;
    var_1 = gettime();

    if ( var_1 > 1000 )
        return;
}

_id_65E9()
{
    level._id_0318 _meth_850D();
    _id_86D3( "slomo" );
    _id_A5E7::_id_1233( 1 );
    level._id_0318 _meth_832B( "snd_enveffectsprio_level", "sewer", 1, 0.7, 1 );
    _id_A5E7::_id_122C( 1 );
    _id_A5F7::_id_86DB( "overdrive", 1 );
    _id_A5DE::_id_5CF2( "overdrive", 1 );
    _id_A5FC::_id_875A( "overdrive_timescale" );
    _id_A5FB::_id_872B( "overdrive_start", undefined, undefined, 0.25 );
    _id_A5FB::_id_873F( "overdrive_loop", "kill_overdrive_loop", 1, 2 );
    level._id_0318 waittill( "death" );
    _id_A5DE::_id_5CF6( "overdrive", 2.5 );
    level notify( "kill_overdrive_loop" );
}

_id_65E8()
{
    _id_A5FB::_id_872B( "overdrive_stop" );
    level notify( "kill_overdrive_loop" );
    _id_A5DE::_id_5CF6( "overdrive", 2 );
    _id_A5FC::_id_875A( "default" );
    level._id_0318 _meth_832C( "snd_enveffectsprio_level", 1 );
    _id_A5E7::_id_1233( 0 );
    _id_A5F7::_id_86DC( 2 );
    _id_A5E7::_id_122C( 0 );
    _id_86CD( "slomo" );
    level._id_0318 _meth_850E();
}

_id_8881()
{
    level._id_0E57._id_8884 = 1;
    _id_A5DE::_id_5CF2( "sonic_attack" );
    _id_A5FB::_id_872B( "sonic_attack_shoot" );
    _id_A5F7::_id_86DB( "sonic_attack", 0.25 );
    wait 1.5;
    _id_A5F7::_id_86DC( 3.0 );
}

_id_8882()
{
    if ( isdefined( level._id_0E57._id_8884 ) && level._id_0E57._id_8884 == 1 )
        level._id_0E57._id_8884 = 0;
    else
        _id_A5FB::_id_872B( "sonic_attack_aftershock" );
}

_id_8883()
{
    _id_A5DE::_id_5CF6( "sonic_attack" );
}

_id_34EF()
{
    _id_A5FB::_id_872B( "stim_activate" );
}

aud_start_ragtime_warfare()
{
    _id_A5DE::_id_5CF2( "ragtime_warfare_cheat_mix" );
    _func_07E( "music", 0 );
    level._id_0318 thread common_scripts\utility::_id_6975( "cheat_chaplin_music", undefined, undefined, 2 );
    level._id_0318 thread common_scripts\utility::_id_6975( "cheat_chaplin_projector_loop", undefined, undefined, 2 );
}

aud_stop_ragtime_warfare()
{
    _id_A5DE::_id_5CF6( "ragtime_warfare_cheat_mix" );
    level._id_0318 common_scripts\utility::_id_8EA1( "cheat_chaplin_music" );
    level._id_0318 common_scripts\utility::_id_8EA1( "cheat_chaplin_projector_loop" );
}

aud_radiation_shellshock( var_0, var_1 )
{
    level._id_0318 endon( "death" );
    _id_A5E7::_id_122C( 1 );

    if ( level._id_0318.radiation_state != var_0 )
    {
        level._id_0318.radiation_state = var_0;

        switch ( level._id_0318.radiation_state )
        {
            case "radiation_high":
                start_next_radiation_level( "rad_shellshock_high", "item_geigercounter_high", "breathing_hurt" );
                break;
            case "radiation_med":
                start_next_radiation_level( "rad_shellshock_med", "item_geigercounter_med", "breathing_hurt" );
                break;
            case "radiation_low":
                start_next_radiation_level( "rad_shellshock_low", "item_geigercounter_med", "breathing_hurt" );
                break;
            case "radiation_none":
                stop_radiation_level( 4.0, "breathing_better" );
                break;
        }
    }
}

start_next_radiation_level( var_0, var_1, var_2 )
{
    var_3 = 0.5;
    _id_A5F7::_id_86DC( var_3 );
    _id_A5F7::_id_86DB( var_0, var_3 );
    stop_shellshock_loop();
    level._id_0318 thread common_scripts\utility::_id_6975( var_1 );
    level._id_0318 _meth_809C( var_2 );
}

stop_radiation_level( var_0, var_1 )
{
    var_2 = 0.5;
    wait(var_0);
    _id_A5F7::_id_86DC( var_2 );
    wait 1.0;
    _id_A5E7::_id_122C( 0 );
    stop_shellshock_loop();
    level._id_0318 _meth_809C( var_1 );
}

stop_shellshock_loop()
{
    level._id_0318 common_scripts\utility::_id_8EA1( "item_geigercounter_high" );
    level._id_0318 common_scripts\utility::_id_8EA1( "item_geigercounter_med" );
}

_id_351D( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_6E57 = var_0;
    var_2._id_3533 = var_1;
    var_2._id_4C2A = "exp_generic_incoming";
    var_2._id_8A54 = 1;
    var_2._id_2FB1 = "exp_generic_explo_sub_kick";
    var_2._id_2FB3 = 1000;
    var_2._id_3520 = 60;
    var_2._id_83AD = 2000;
    var_2._id_351F = "exp_debris_dirt_chunks";
    var_2._id_4415 = "exp_grnd_zero_stone";
    var_2._id_4416 = 500;
    _id_86C1( var_2 );
}

_id_351E( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_6E57 = var_0;
    var_1._id_8A54 = 1;
    var_1._id_2FB1 = "exp_generic_explo_sub_kick";
    var_1._id_2FB3 = 1000;
    var_1._id_3520 = 60;
    var_1._id_83AD = 2000;
    var_1._id_351F = "exp_debris_dirt_chunks";
    var_1._id_4415 = "exp_grnd_zero_stone";
    var_1._id_4416 = 500;
    _id_86C1( var_1 );
}

_id_86C0( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;

    if ( isdefined( var_2 ) )
        var_5 = var_2;

    var_6 = 0;

    if ( isdefined( var_3 ) )
        var_6 = var_3;

    while ( isdefined( self ) )
    {
        if ( var_6 )
            var_7 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );
        else
            var_7 = _func_0EF( self._id_02E2, level._id_0318._id_02E2 );

        if ( var_7 < var_1 )
        {
            var_8 = spawn( "script_origin", self._id_02E2 );
            var_8 _meth_804F( self );
            var_8 _meth_809C( var_0, "sounddone" );
            var_8 thread _id_878E( self, var_4 );
            var_8 thread _id_878F();
            var_8 waittill( "flyby_ent", var_9 );

            if ( var_9 == "deathspin" )
            {
                var_8 _meth_8071( 0.0, 0.3 );
                wait 0.4;
                var_8 _meth_80AE();
                var_8 delete();
                return;
            }
            else if ( var_9 == "sounddone" )
            {
                wait 0.1;
                var_8 delete();
                return;
            }

            continue;
        }

        wait 0.05;
    }
}

_id_878E( var_0, var_1 )
{
    self endon( "flyby_ent" );
    var_0 waittill( "deathspin" );
    self notify( "flyby_ent", "deathspin" );

    if ( isdefined( var_1 ) )
    {
        var_2 = spawn( "script_origin", self._id_02E2 );
        var_2 _meth_804F( self );
        var_2 _meth_809C( var_1, "sounddone" );
        var_2 waittill( "sounddone" );
        var_2 delete();
    }
}

_id_878F()
{
    self endon( "flyby_ent" );
    self waittill( "sounddone" );
    self notify( "flyby_ent", "sounddone" );
}

_id_86BF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    self endon( "death" );
    self endon( "deathspin" );
    self _meth_8287();

    if ( !isdefined( self._id_10F0 ) )
        self._id_10F0 = spawnstruct();

    self._id_10F0._id_6F39 = _id_878A( var_4 );
    self._id_10F0._id_392F = 0;
    self._id_10F0._id_392E = 0;
    self._id_10F0._id_264B = 0;
    self._id_10F0._id_0CB8 = 1;
    self._id_10F0._id_26A9 = var_10;

    if ( isdefined( var_5 ) )
        thread _id_8788( var_5, var_10 );

    if ( isdefined( var_6 ) )
    {
        var_12 = spawn( "script_origin", self._id_02E2 );
        var_12 _meth_804F( self );
        thread _id_8789( var_12, var_6, var_10 );
    }

    self._id_10F0._id_5C2A = 5;

    if ( isdefined( var_7 ) )
        self._id_10F0._id_5C2A = var_7;

    self._id_10F0._id_5C29 = 3;

    if ( isdefined( var_8 ) )
        self._id_10F0._id_5C29 = var_8;

    var_13 = 0.05;

    if ( isdefined( var_9 ) )
        var_13 = var_9;

    if ( _func_0CE( var_1 ) )
    {
        foreach ( var_16, var_15 in var_1 )
            thread _id_878D( var_16, var_15, var_10 );
    }

    if ( _func_0CE( var_2 ) )
    {
        while ( isdefined( self ) )
        {
            var_17 = _id_878A( var_4 );

            for ( var_18 = 0; var_18 < var_2.size; var_18++ )
            {
                if ( var_17 < var_2[var_18] )
                {
                    if ( var_18 == 0 )
                    {
                        if ( self._id_10F0._id_0CB8 && self._id_10F0._id_392F == 0 && self._id_10F0._id_264B == 0 )
                        {
                            var_19 = _id_8787( var_0, var_18, var_3, var_10 );

                            if ( isdefined( var_19 ) )
                                thread _id_878B( var_19, var_18 );
                        }
                        else if ( var_17 < self._id_10F0._id_6F39 )
                            self._id_10F0._id_0CB8 = 1;
                        else
                            self._id_10F0._id_0CB8 = 0;
                    }
                    else if ( var_17 > self._id_10F0._id_6F39 )
                    {
                        if ( self._id_10F0._id_0CB8 && self._id_10F0._id_392F == 0 && self._id_10F0._id_392E == 0 && self._id_10F0._id_264B == 0 )
                        {
                            self._id_10F0._id_0CB8 = 0;
                            var_19 = _id_8787( var_0, var_18, var_3, var_10 );

                            if ( isdefined( var_19 ) )
                                thread _id_878B( var_19, var_18 );
                        }
                    }
                    else
                        self._id_10F0._id_0CB8 = 1;

                    break;
                }
            }

            self._id_10F0._id_6F39 = var_17;
            wait(var_13);
        }
    }
}

_id_878D( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "deathspin" );
    wait(var_1);
    thread _id_878B( var_0 );
}

_id_878A( var_0 )
{
    var_1 = 0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    if ( var_1 )
        var_2 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );
    else
        var_2 = _func_0EF( self._id_02E2, level._id_0318._id_02E2 );

    return var_2;
}

_id_8787( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;
    var_5 = self _meth_8283();
    var_6 = _func_0F1( var_5 ) * 0.0568182;

    if ( var_6 > 5 )
    {
        if ( _func_0CE( var_2 ) )
        {
            var_7 = level._id_0318 _meth_8336();
            var_8 = var_5 - var_7;
            var_9 = _func_0F1( var_8 ) * 0.0568182;

            for ( var_10 = 0; var_10 < var_2.size; var_10++ )
            {
                var_4 = var_10 + 1;

                if ( var_9 > var_2[var_10] )
                {
                    var_4 = var_10;
                    break;
                }
            }
        }

        if ( var_4 == 0 )
            var_11 = "fast";
        else if ( var_4 == 1 )
            var_11 = "med";
        else
            var_11 = "slow";

        if ( var_1 == 0 )
            var_12 = "close";
        else if ( var_1 == 1 )
            var_12 = "mid";
        else if ( var_1 == 2 )
            var_12 = "far";
        else
            return undefined;

        var_13 = var_0 + "_" + var_11 + "_" + var_12;

        if ( var_1 == 0 )
            self._id_10F0._id_392F = 1;
        else
            self._id_10F0._id_392E = 1;

        return var_13;
    }
    else
        return undefined;
}

_id_878B( var_0, var_1 )
{
    thread _id_878C( var_1 );
    var_2 = _id_A5DC::_id_289E( var_0, self );
    thread _id_8786( var_2, "deathspin" );
}

_id_8788( var_0, var_1 )
{
    self endon( "crash_done" );
    self waittill( "deathspin" );
    var_2 = _id_A5DC::_id_289E( var_0, self );
    thread _id_8786( var_2, "crash_done" );
}

_id_8789( var_0, var_1, var_2 )
{
    self waittill( "crash_done" );
    var_3 = spawn( "script_origin", var_0._id_02E2 );
    var_3 _id_A5FB::_id_872A( var_1, "sounddone" );
    var_3 waittill( "sounddone" );
    var_3 delete();
}

_id_878C( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( var_0 == 0 )
        {
            wait(self._id_10F0._id_5C2A);

            if ( isdefined( self ) )
                self._id_10F0._id_392F = 0;
        }
        else
        {
            wait(self._id_10F0._id_5C29);

            if ( isdefined( self ) )
                self._id_10F0._id_392E = 0;
        }
    }
}

_id_8786( var_0, var_1, var_2 )
{
    self waittill( var_1 );

    if ( isdefined( var_0 ) )
    {
        var_3 = 0.3;

        if ( isdefined( var_2 ) )
            var_3 = var_2;

        var_0 _meth_8071( 0.0, var_3 );
        wait(var_3);

        if ( isdefined( var_0 ) )
        {
            var_0 _meth_80AE();
            wait 0.1;

            if ( isdefined( var_0 ) )
                var_0 delete();
        }
    }
}

_id_86C1( var_0 )
{
    var_1 = _id_8790( var_0 );
    thread _id_8791( var_1 );
}

_id_8790( var_0 )
{
    if ( !isdefined( level._id_065D._id_0B52 ) )
        _id_4C73();

    if ( !isdefined( var_0._id_3521 ) )
    {
        var_0._id_3521 = level._id_065D._id_0B52["exp_generic_explo_shot"];

        if ( !isdefined( var_0._id_3522 ) )
            var_0._id_3522 = "exp_generic_explo_tail";
    }

    if ( isdefined( var_0._id_2FB1 ) )
    {
        if ( isdefined( var_0._id_2FB3 ) )
            var_0._id_2FB3 = _func_0E1( var_0._id_2FB3, 0 );
        else
            var_0._id_2FB3 = 1000;
    }

    if ( isdefined( var_0._id_3520 ) )
        var_0._id_3520 = _func_0E1( var_0._id_3520, 0 );
    else
        var_0._id_3520 = 50;

    if ( isdefined( var_0._id_83AD ) )
        var_0._id_83AD = _func_0E1( var_0._id_83AD, 0 );

    if ( !isdefined( var_0._id_83B0 ) )
        var_0._id_83B0 = level._id_065D._id_3337["explo_shake_over_distance"];

    if ( isdefined( var_0._id_83AF ) )
        var_0._id_83AF = _func_0E1( var_0._id_83AF, 0 );
    else
        var_0._id_83AF = 0.5;

    if ( isdefined( var_0._id_4415 ) )
    {
        if ( isdefined( var_0._id_4416 ) )
            var_0._id_4416 = _func_0E1( var_0._id_4416, 0 );
        else
            var_0._id_4416 = 500;
    }

    return var_0;
}

_id_8791( var_0 )
{
    var_1 = var_0._id_6E57;
    var_2 = var_0._id_3533;
    var_3 = var_0._id_4C2A;
    var_4 = var_0._id_8A54;
    var_5 = var_0._id_3521;
    var_6 = var_0._id_2FB1;
    var_7 = var_0._id_2FB3;
    var_8 = var_0._id_3520;
    var_9 = var_0._id_3522;
    var_10 = var_0._id_83AD;
    var_11 = var_0._id_83B0;
    var_12 = var_0._id_83AF;
    var_13 = var_0._id_351F;
    var_14 = var_0._id_4415;
    var_15 = var_0._id_4416;
    var_16 = _func_0EE( level._id_0318._id_02E2, var_1 );

    if ( isdefined( var_4 ) && var_4 == 1 )
    {
        var_17 = var_16 * 8.33333e-05;
        wait(var_17);
    }

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
            common_scripts\utility::_id_69C2( var_3, var_1 );

        common_scripts\_exploder::_id_3528( var_2 );
    }

    var_18 = _func_0B2( var_5.size );
    var_19 = var_5[var_18];
    var_20 = var_19[0];
    thread common_scripts\utility::_id_69C2( var_20, var_1 );

    if ( isdefined( var_6 ) )
    {
        if ( var_16 < var_7 )
            thread common_scripts\utility::_id_69C2( var_6, var_1 );
    }

    var_21 = var_19[1];

    if ( isdefined( var_21 ) )
    {
        if ( _id_A5DC::_id_0FE9( var_8 ) )
            wait(var_21);
    }

    if ( isdefined( var_9 ) )
        thread common_scripts\utility::_id_69C2( var_9, var_1 );

    if ( isdefined( var_10 ) )
    {
        if ( var_16 < var_10 )
        {
            var_22 = var_16 / var_10;
            var_23 = _id_A5DC::_id_289B( var_22, var_11 );
            _func_18C( var_23, var_12, level._id_0318._id_02E2, var_10 );
        }
    }

    if ( isdefined( var_13 ) )
        thread common_scripts\utility::_id_69C2( var_13, var_1 );

    if ( isdefined( var_14 ) && var_16 < var_15 )
        thread common_scripts\utility::_id_69C2( var_14, var_1 );
}

_id_86F3( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0 + "_" + var_1 + "_" + var_2;

    if ( isdefined( var_4 ) )
        var_6 = _id_A5DC::_id_289E( var_5, var_4, undefined, undefined, undefined, undefined, var_3 );
    else
        var_6 = _id_A5DC::_id_289F( var_5, var_3 );

    return var_6;
}

_id_8747( var_0, var_1, var_2 )
{
    var_3 = var_0["vehicle"];
    var_4 = var_3 _id_87B9( var_0, var_1, var_2 );
    var_3 thread _id_87B8( var_4 );
}

start_vehicle_shell_shock( var_0 )
{
    level._id_0318 endon( "death" );
    var_1 = 1.0;
    _id_A5E7::_id_122C( 1 );
    _id_A5F7::_id_86DB( "vehicle_shellshock", 0.5 );
    var_2 = _func_0BF( 0, var_0 - var_1 );
    wait(var_2);
    _id_A5F7::_id_86DC( var_1 );
    _id_A5E7::_id_122C( 0 );
}

_id_87B9( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_10F0 ) )
        self._id_10F0 = spawnstruct();

    if ( !_func_0CE( var_1 ) )
        var_1 = [];

    self._id_10F0._id_2674 = _id_A5DC::_id_0F30( 0, var_1["Debug"] );
    self._id_10F0._id_9D74 = _id_A5DC::_id_0F30( "veh_impact", var_1["VehicleID"] );
    self._id_10F0._id_706D = _id_A5DC::_id_0F30( 25, var_1["PV_MinVelocityThreshold"] );
    self._id_10F0._id_706C = _id_A5DC::_id_0F30( 1000, var_1["PV_MaxVelocity"] );
    self._id_10F0._id_706E = _id_A5DC::_id_0F30( 3, var_1["PV_NumVelocityRanges"] );
    self._id_10F0._id_706B = _id_A5DC::_id_0F30( 100, var_1["PV_MaxSmlVelocity"] );
    self._id_10F0._id_706A = _id_A5DC::_id_0F30( 600, var_1["PV_MaxMedVelocity"] );
    self._id_10F0._id_7069 = _id_A5DC::_id_0F30( 1000, var_1["PV_MaxLrgVelocity"] );
    self._id_10F0._id_624D = _id_A5DC::_id_0F30( 25, var_1["NPC_MinVelocityThreshold"] );
    self._id_10F0._id_624C = _id_A5DC::_id_0F30( 800, var_1["NPC_MaxVelocity"] );
    self._id_10F0._id_624E = _id_A5DC::_id_0F30( 3, var_1["NPC_NumVelocityRanges"] );
    self._id_10F0._id_624B = _id_A5DC::_id_0F30( 100, var_1["NPC_MaxSmlVelocity"] );
    self._id_10F0._id_624A = _id_A5DC::_id_0F30( 400, var_1["NPC_MaxMedVelocity"] );
    self._id_10F0._id_6249 = _id_A5DC::_id_0F30( 800, var_1["NPC_MaxLrgVelocity"] );
    self._id_10F0._id_5C81 = _id_A5DC::_id_0F30( 0.0, var_1["MinLFEVolumeThreshold"] );
    self._id_10F0._id_3669 = _id_A5DC::_id_0F30( 2, var_1["FallVelMultiplier"] );
    self._id_10F0._id_5C89 = _id_A5DC::_id_0F30( 250, var_1["MinTimeThreshold"] );
    self._id_10F0._id_9385 = _id_A5DC::_id_0F30( 35, var_1["TireSkidProbability"] );
    self._id_10F0._id_5A32 = _id_A5DC::_id_0F30( 6000, var_1["MaxDistanceThreshold"] );
    self._id_10F0._id_5B2E = _id_A5DC::_id_0F30( 0.1, var_1["MedVolMin"] );
    self._id_10F0._id_58AF = _id_A5DC::_id_0F30( 0.3, var_1["LrgVolMin"] );
    self._id_10F0._id_6154 = _id_A5DC::_id_0F30( 0.0, var_1["NonPlayerImpVolReduction"] );

    if ( !isdefined( self._id_10F0._id_6F40 ) )
        self._id_10F0._id_6F40 = 0;

    if ( !isdefined( level._id_065D._id_04F0 ) )
    {
        level._id_065D._id_04F0 = spawnstruct();
        _id_4CFF();
        level._id_065D._id_04F0._id_507A = 0;
        level._id_065D._id_04F0._id_7913 = _id_A5DC::_id_0F30( 1, var_1["ScrapeEnabled"] );
        level._id_065D._id_04F0._id_7915 = _id_A5DC::_id_0F30( 0.5, var_1["ScrapeSeperationTime"] );
        level._id_065D._id_04F0._id_7914 = _id_A5DC::_id_0F30( 0.5, var_1["ScrapeFadeOutTime"] );
        level._id_065D._id_04F0._id_7916 = _id_A5DC::_id_0F30( 0.05, var_1["ScrapeUpdateRate"] );
    }

    if ( var_0["surface"] == "none" )
        var_0["surface"] = "vehicle";

    var_3 = level._id_065D._id_04F0._id_8FF2;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    if ( !_id_8703( var_0["surface"], var_3 ) )
        var_0["surface"] = "default";

    return var_0;
}

_id_87B8( var_0 )
{
    var_1 = self;
    var_2 = var_0["hit_entity"];
    var_3 = var_0["pos"];
    var_4 = var_0["impulse"];
    var_5 = var_0["relativeVel"];
    var_6 = var_0["surface"];
    var_7 = ( var_5[0], var_5[1], 0 );
    var_8 = _func_0F1( var_7 );
    var_9 = _func_0BE( var_5[2] ) * self._id_10F0._id_3669;
    var_10 = _func_0EE( var_3, level._id_0318._id_02E2 );
    var_11 = gettime();
    var_12 = var_11 - self._id_10F0._id_6F40;
    var_13 = undefined;
    var_14 = undefined;
    var_15 = 0;

    if ( isdefined( level._id_0318._id_2E18 ) )
    {
        var_13 = level._id_0318._id_2E18;

        if ( isdefined( var_2 ) && var_2 == var_13 || var_1 == var_13 )
        {
            var_14 = var_13;
            var_15 = 1;

            if ( level._id_065D._id_04F0._id_507A )
                thread _id_87C3();
        }
    }

    if ( var_10 < self._id_10F0._id_5A32 && var_8 > self._id_10F0._id_706D )
    {
        var_8 = _func_0E9( var_8, 0, self._id_10F0._id_706C );
        var_9 = _func_0E9( var_9, 0, self._id_10F0._id_706C );
        var_16 = var_8;

        if ( var_9 > var_8 )
            var_16 = var_9;

        if ( var_15 )
        {
            var_17 = _id_87BE( var_16, self._id_10F0._id_706B, self._id_10F0._id_706A );
            var_18 = _id_87BF( var_16, self._id_10F0._id_706B, self._id_10F0._id_706A, self._id_10F0._id_7069 );
            var_19 = "PV-IMPACT";
        }
        else
        {
            var_17 = _id_87BE( var_16, self._id_10F0._id_624B, self._id_10F0._id_624A );
            var_18 = _id_87BF( var_16, self._id_10F0._id_624B, self._id_10F0._id_624A, self._id_10F0._id_6249 );
            var_19 = "NPC-IMPACT";

            if ( var_17 == "sml" )
                return;

            _func_0E9( var_18, self._id_10F0._id_6154, 1.0 );
            var_18 -= self._id_10F0._id_6154;
        }

        if ( var_12 < self._id_10F0._id_5C89 )
        {
            if ( var_17 == "sml" )
                return;

            if ( !var_15 )
                return;
        }

        self._id_10F0._id_6F40 = var_11;

        if ( var_15 )
        {
            if ( level._id_065D._id_04F0._id_7913 )
            {
                if ( var_12 <= self._id_10F0._id_5C89 )
                {
                    level._id_065D._id_04F0._id_7911 = var_3;

                    if ( !level._id_065D._id_04F0._id_507A )
                        thread _id_87C2( var_13 );
                    else
                        return;
                }
                else if ( level._id_065D._id_04F0._id_507A )
                    _id_87C4();
            }
        }

        if ( isdefined( var_13 ) && var_1 != var_13 )
        {
            if ( _func_0B2( 100 ) < self._id_10F0._id_9385 )
                _id_A5DC::_id_289F( "vehicle_tire_skid", var_3 );
        }

        var_20 = _id_A5DC::_id_289B( var_18, level._id_065D._id_3337["veh_crash_intensity_to_pitch"] );
        var_21 = _id_86F3( self._id_10F0._id_9D74, var_6, var_17, var_3, var_14 );
        var_21 _meth_8071( var_18, 0.1 );
        var_21 _meth_806F( var_20, 0.1 );

        if ( var_15 && var_17 != "sml" )
        {
            var_22 = _id_A5DC::_id_289B( var_16, level._id_065D._id_3337["veh_crash_vel_to_lfe_vol"] );

            if ( var_22 > self._id_10F0._id_5C81 )
            {
                var_23 = _id_86F3( self._id_10F0._id_9D74, var_6, "lfe", var_3 );
                var_23 _meth_8071( var_22, 0.1 );
            }
        }
    }
}

_id_87BE( var_0, var_1, var_2 )
{
    if ( var_0 <= var_1 )
        var_3 = "sml";
    else if ( var_0 <= var_2 )
        var_3 = "med";
    else
        var_3 = "lrg";

    return var_3;
}

_id_87BF( var_0, var_1, var_2, var_3 )
{
    if ( var_0 <= var_1 )
        var_4 = var_0 / var_1;
    else if ( var_0 <= self._id_10F0._id_706A )
    {
        var_4 = var_0 / var_2;

        if ( var_4 < self._id_10F0._id_5B2E )
            var_4 = self._id_10F0._id_5B2E;
    }
    else
    {
        var_4 = var_0 / var_3;

        if ( var_4 < self._id_10F0._id_58AF )
            var_4 = self._id_10F0._id_58AF;
    }

    return var_4;
}

_id_87C2( var_0 )
{
    level._id_065D._id_04F0._id_507A = 1;
    level endon( "aud_stop_vehicle_scraping" );

    while ( level._id_065D._id_04F0._id_507A )
    {
        if ( isdefined( var_0 ) )
        {
            var_1 = var_0._id_02E2;

            if ( isdefined( level._id_065D._id_04F0._id_7911 ) )
                var_1 = level._id_065D._id_04F0._id_7911;

            var_2 = var_0._id_10F0._id_9D74 + "_scrape";
            var_3 = _id_A5DC::_id_289E( var_2, var_0, undefined, undefined, undefined, undefined, var_1 );

            if ( !isdefined( level._id_065D._id_04F0._id_7912 ) )
                level._id_065D._id_04F0._id_7912 = [];

            level._id_065D._id_04F0._id_7912[level._id_065D._id_04F0._id_7912.size] = var_3;
        }

        wait 0.05;
        wait(level._id_065D._id_04F0._id_7915);
    }
}

_id_87C3()
{
    level notify( "aud_vehicle_collision_scrape_timer_reset" );
    level endon( "aud_vehicle_collision_scrape_timer_reset" );
    wait(level._id_065D._id_04F0._id_7916);
    waitframe;
    _id_87C4();
}

_id_87C4( var_0 )
{
    var_1 = level._id_065D._id_04F0._id_7914;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    level notify( "aud_stop_vehicle_scraping" );
    level._id_065D._id_04F0._id_507A = 0;

    if ( isdefined( level._id_065D._id_04F0._id_7912 ) )
    {
        for ( var_2 = 0; var_2 < level._id_065D._id_04F0._id_7912.size; var_2++ )
        {
            if ( isdefined( level._id_065D._id_04F0._id_7912[var_2] ) )
            {
                var_3 = level._id_065D._id_04F0._id_7912[var_2];
                thread _id_A5DC::_id_0F1C( var_3, var_1 );
            }
        }

        level._id_065D._id_04F0._id_7912 = undefined;
    }
}

_id_87C1( var_0, var_1, var_2, var_3 )
{
    if ( self._id_10F0._id_2674 )
    {
        if ( !isdefined( var_1 ) )
            var_1 = "-";

        if ( !isdefined( var_2 ) )
            var_2 = "-";

        if ( !isdefined( var_3 ) )
            var_3 = "-";

        if ( self._id_10F0._id_65C9 )
        {
            if ( isdefined( var_0 ) )
                return;
        }
        else
        {

        }
    }
}

_id_87C0( var_0, var_1, var_2, var_3 )
{
    if ( self._id_10F0._id_2674 )
    {
        if ( !isdefined( var_0 ) )
            var_0 = "-";

        if ( !isdefined( var_1 ) )
            var_1 = "-";

        if ( !isdefined( var_2 ) )
            var_2 = "-";

        if ( !isdefined( var_3 ) )
            var_3 = "-";
    }
}

_id_87BD()
{
    _id_A5DE::_id_5CF2( "impact_system_solo" );
}

_id_87BA()
{
    _id_A5DE::_id_5CF6( "impact_system_solo" );
}

_id_87BB()
{
    if ( isdefined( self._id_10F0._id_4E81 ) )
        self._id_10F0._id_65C9 = 1;
}

_id_87BC()
{
    if ( isdefined( self._id_10F0._id_4E81 ) )
        self._id_10F0._id_65C9 = 0;
}

_id_8703( var_0, var_1 )
{
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_0 == var_1[var_3] )
        {
            var_2 = 1;
            break;
        }
    }

    return var_2;
}

_id_86D1( var_0, var_1, var_2, var_3 )
{
    level._id_0318 _meth_82DA( "dpad_action_01", "+actionslot 1" );
    level._id_0318 _meth_82DA( "dpad_action_02", "+actionslot 2" );
    level._id_0318 _meth_82DA( "dpad_action_03", "+actionslot 3" );
    level._id_0318 _meth_82DA( "dpad_action_04", "+actionslot 4" );
    thread _id_8797( "dpad_action_01", var_0 );
    thread _id_8797( "dpad_action_02", var_1 );
    thread _id_8797( "dpad_action_03", var_2 );
    thread _id_8797( "dpad_action_04", var_3 );
}

_id_8797( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        for (;;)
        {
            level._id_0318 waittill( var_0 );

            if ( isdefined( var_1 ) )
                thread [[ var_1 ]]();

            wait 0.05;
        }
    }
}

_id_8782( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_1 = _id_A5DC::_id_0F30( 1, var_1 );
    var_2 = _id_A5DC::_id_0F30( 0.1, var_2 );

    while ( isdefined( self ) && !var_3 )
    {
        if ( var_1 )
        {
            if ( _func_0EE( self._id_02E2, level._id_0318._id_02E2 ) < var_0 )
                var_3 = 1;
        }
        else if ( _func_0EF( self._id_02E2, level._id_0318._id_02E2 ) < var_0 )
            var_3 = 1;

        wait(var_2);
    }

    return var_3;
}

_id_8719( var_0, var_1, var_2, var_3 )
{
    thread _id_87A4( var_0, var_1, var_2 );
}

_id_87A4( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_8782( var_1, var_2, var_3 );
    level notify( var_0, var_4 );
}

_id_86C8( var_0, var_1, var_2 )
{

}

_id_86CA( var_0, var_1 )
{

}

_id_86C9( var_0 )
{

}

_id_8794( var_0, var_1, var_2, var_3 )
{

}

_id_8796( var_0, var_1 )
{

}

_id_8795( var_0 )
{

}

_id_86C7( var_0, var_1 )
{

}

_id_8780( var_0 )
{
    for (;;)
    {
        var_1 = _func_0D9( "axis" );

        foreach ( var_3 in var_1 )
        {
            if ( var_3 _meth_840B() )
            {
                if ( isstring( var_0 ) )
                    level notify( var_0 );

                return;
            }
        }

        wait 0.2;
    }
}

_id_8781( var_0 )
{
    for (;;)
    {
        var_1 = _func_0D9( "axis" );

        foreach ( var_3 in var_1 )
        {
            if ( var_3 _meth_81C2( level._id_0318 ) )
            {
                if ( isstring( var_0 ) )
                    level notify( var_0 );

                return;
            }
        }

        wait 0.2;
    }
}

_id_86D7()
{
    var_0 = 0;
    var_1 = _func_0D9( "axis" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 _meth_81C2( level._id_0318 ) )
        {
            var_0 = 1;
            break;
        }
    }

    return var_0;
}

_id_86E9()
{
    var_0 = 0;
    var_1 = _func_0D9( "axis" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 _meth_840B() )
            var_0 += 1;
    }

    return var_0;
}

_id_065E()
{
    foreach ( var_1 in level._id_065D._id_2162 )
    {
        if ( var_1[1] )
        {
            _func_291( var_1[0] );
            return;
        }
    }

    _func_292();
}

_id_86D3( var_0 )
{
    foreach ( var_3, var_2 in level._id_065D._id_2162 )
    {
        if ( var_2[0] == var_0 )
        {
            level._id_065D._id_2162[var_3][1] = 1;
            _id_065E();
            return;
        }
    }

    _id_A5DC::_id_102B( "Trying to enable override sound context that was not configured: " + var_0 );
}

_id_86CD( var_0 )
{
    foreach ( var_3, var_2 in level._id_065D._id_2162 )
    {
        if ( var_2[0] == var_0 )
        {
            level._id_065D._id_2162[var_3][1] = 0;
            _id_065E();
            return;
        }
    }

    _id_A5DC::_id_102B( "Trying to disable override sound context that was not configured: " + var_0 );
}

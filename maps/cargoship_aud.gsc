// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_2110();
    _id_4D5B();
    _id_4CF4();
    _id_5625();
    _id_5618();
    thread _id_5617();
    _id_23C4();
    _id_6ECB();
    _id_72E8();
    thread _id_4F77();
}

_id_2110()
{
    _id_A5DC::_id_7EC8( "shg" );
    _id_A5F7::_id_8757( "med_occlusion" );
    _id_A5DE::_id_5CF2( "mix_cargoship_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "aud_mix_deck_window" );
    common_scripts\utility::_id_383D( "aud_package_door_creaks" );
    _func_2D4( "vehicles", "solid", "glass" );
    _func_2D4( "battlechatter", "solid", "glass" );
    _func_2D4( "voices", "solid", "glass" );
    _func_2D4( "emitters", "solid", "glass" );
}

_id_4CF4()
{

}

_id_5625()
{
    thread aud_start_mix_deck_windows();
    thread aud_start_mix_end();
}

_id_5618()
{

}

_id_5617()
{
    wait 0.1;
    thread _id_A5DC::_id_0FF4( "ocean_emitter_left", "emt_waves_crashing_far", ( 3649.9, -899.7, -13 ), ( -3582, -899.7, -13 ), 0.5 );
    thread _id_A5DC::_id_0FF4( "ocean_emitter_right", "emt_waves_crashing_far", ( 3710.4, 893.8, -13 ), ( -3586.4, 896.9, -13 ), 0.5 );
    thread _id_A5DC::_id_0FF4( "hangar_emitter_center01 ", "emt_water_drop_metal", ( -1894.71, -27.25, -407.875 ), ( -1142.67, -20.391, -407.875 ), 0.5 );
    thread _id_A5DC::_id_0FF4( "hangar_emitter_center02 ", "emt_water_drop_metal", ( -963.804, -5.706, -407.875 ), ( -830.211, 2.213, -407.875 ), 0.5 );
    thread _id_A5DC::_id_0FF4( "hangar_emitter_center03 ", "emt_water_drop_metal", ( -548.97, 8.78, -407.875 ), ( 131.804, 11.023, -407.875 ), 0.5 );
    thread _id_A5DC::_id_0FF4( "hangar_emitter_center04 ", "emt_water_drop_metal", ( 549.98, 14.846, -407.875 ), ( 995.199, 22.681, -407.875 ), 0.5 );
    thread _id_A5DC::_id_0FF4( "hangar_emitter_center05 ", "emt_water_drop_metal", ( 1255.19, 11.04, -407.875 ), ( 2497.56, 2.806, -407.875 ), 0.5 );
}

_id_23C4()
{

}

_id_6ECB()
{

}

_id_72E8()
{
    _id_A5E8::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    _id_A5E8::_id_874D( "snd_music_handler", ::_id_5FFD );
    _id_A5E8::_id_874D( "aud_start_checkpoint", ::aud_start_checkpoint );
    _id_A5E8::_id_874D( "aud_bridge_checkpoint", ::aud_bridge_checkpoint );
    _id_A5E8::_id_874D( "aud_deck_checkpoint", ::aud_deck_checkpoint );
    _id_A5E8::_id_874D( "aud_hallways_checkpoint", ::aud_hallways_checkpoint );
    _id_A5E8::_id_874D( "aud_cargohold_checkpoint", ::aud_cargohold_checkpoint );
    _id_A5E8::_id_874D( "aud_cargohold2_checkpoint", ::aud_cargohold2_checkpoint );
    _id_A5E8::_id_874D( "aud_laststand_checkpoint", ::aud_laststand_checkpoint );
    _id_A5E8::_id_874D( "aud_package_checkpoint", ::aud_package_checkpoint );
    _id_A5E8::_id_874D( "aud_escape_checkpoint", ::aud_escape_checkpoint );
    _id_A5E8::_id_874D( "aud_end_checkpoint", ::aud_end_checkpoint );
    _id_A5E8::_id_874D( "aud_get_out_blackhawk", ::aud_get_out_blackhawk );
    _id_A5E8::_id_874D( "aud_stop_intro_mix", ::aud_stop_intro_mix );
    _id_A5E8::_id_874D( "aud_get_in_seaknight", ::aud_get_in_seaknight );
    _id_A5E8::_id_874D( "aud_start_mix_heli_shoot_window", ::aud_start_mix_heli_shoot_window );
    _id_A5E8::_id_874D( "aud_stop_mix_heli_shoot_window", ::aud_stop_mix_heli_shoot_window );
    _id_A5E8::_id_874D( "aud_stop_mix_moving_to_hallway", ::aud_stop_mix_moving_to_hallway );
    _id_A5E8::_id_874D( "aud_start_mix_npc_pre_explosion", ::aud_start_mix_npc_pre_explosion );
    _id_A5E8::_id_874D( "aud_start_mix_scn_explosion", ::aud_start_mix_scn_explosion );
    _id_A5E8::_id_874D( "aud_start_mix_escape", ::aud_start_mix_escape );
    _id_A5E8::_id_874D( "start_mix_final_jump", ::start_mix_final_jump );
    _id_A5E8::_id_874D( "start_mix_finale_music", ::start_mix_finale_music );
    _id_A5E8::_id_874D( "start_title_logo_mix", ::start_title_logo_mix );
    _id_A5E8::_id_874D( "aud_start_sway1", ::aud_start_sway1 );
    _id_A5E8::_id_874D( "aud_start_sway2", ::aud_start_sway2 );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_checkpoint()
{
    _id_A5DE::_id_5CF2( "intro_mix" );
    _id_A5E7::_id_123A( "cargoship_inside_blackhawk" );
}

aud_bridge_checkpoint()
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_deck_checkpoint()
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_hallways_checkpoint()
{
    _id_A5DE::_id_5CF2( "mix_moving_to_hallway" );
    _id_A5E7::_id_123A( "exterior" );
}

aud_cargohold_checkpoint()
{
    _id_A5E7::_id_123A( "interior_metal" );
}

aud_cargohold2_checkpoint()
{
    _id_A5E7::_id_123A( "hangar" );
}

aud_laststand_checkpoint()
{
    _id_A5E7::_id_123A( "hangar" );
}

aud_package_checkpoint()
{
    _id_A5E7::_id_123A( "hangar" );
}

aud_escape_checkpoint()
{
    _id_A5E7::_id_123A( "hangar" );
}

aud_end_checkpoint()
{
    _id_A5DE::_id_5CF2( "mix_escape" );
    _id_A5E7::_id_123A( "interior_metal" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "cargoship_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "cargoship_intro_mute", 1.75 );
}

aud_get_out_blackhawk()
{
    _id_A5E7::_id_123A( "exterior", 0.3 );
}

aud_stop_intro_mix()
{
    _id_A5DE::_id_5CF6( "intro_mix" );
}

aud_get_in_seaknight()
{
    _id_A5DE::_id_5CF6( "mix_final_jump" );
    _id_A5E7::_id_123A( "cargoship_inside_seaknight", 0.3 );
}

aud_start_mix_deck_windows()
{
    common_scripts\utility::_id_384A( "aud_mix_deck_window" );
    _id_A5DE::_id_5CF2( "mix_deck_windows" );
}

aud_start_mix_heli_shoot_window()
{
    _id_A5DE::_id_5CF6( "mix_deck_windows" );
    _id_A5DE::_id_5CF2( "mix_heli_shoot_window" );
}

aud_stop_mix_heli_shoot_window()
{
    _id_A5DE::_id_5CF6( "mix_heli_shoot_window" );
    _id_A5DE::_id_5CF2( "mix_moving_to_hallway" );
}

aud_stop_mix_moving_to_hallway()
{
    _id_A5DE::_id_5CF6( "mix_moving_to_hallway" );
}

aud_start_mix_npc_pre_explosion()
{
    _id_A5DE::_id_5CF2( "mix_npc_pre_explosion" );
}

aud_start_mix_scn_explosion()
{
    _id_A5DE::_id_5CF2( "mix_scn_explosion" );
    _id_A5DE::_id_5CF6( "mix_npc_pre_explosion" );
    _id_A5E7::_id_122C( 1 );
    _id_A5E7::_id_1233( 1 );
    level._id_0318 _meth_832B( "snd_enveffectsprio_level", "scn_cargo_explosion", 1, 0.7, 0.5 );
    _id_A5F7::_id_86DB( "scn_explosion_filter", 0.5 );
}

aud_start_mix_escape()
{
    _id_A5DE::_id_5CF6( "mix_scn_explosion" );
    _id_A5DE::_id_5CF2( "mix_escape" );
    _id_A5F7::_id_86DC( 0.5 );
    _id_A5E7::_id_122C( 0 );
    level._id_0318 _meth_832C( "snd_enveffectsprio_level", 1 );
    level._id_0318 _meth_832B( "snd_enveffectsprio_level", "hall_metal", 1, 0.4, 0.5 );
    thread common_scripts\utility::_id_697A( "ambient_cargo_escape_rumble", ( 333.375, -0.75, -99.156 ) );
    thread common_scripts\utility::_id_697A( "ambient_cargo_escape_rumble_02", ( -1762, 103, -123 ) );
    thread aud_alarm_sound();
}

aud_start_mix_end()
{
    common_scripts\utility::_id_384A( "aud_mix_end" );
    _id_A5DE::_id_5CF6( "mix_escape" );
    _id_A5DE::_id_5CF2( "mix_end" );
    level._id_0318 _meth_832C( "snd_enveffectsprio_level", 1 );
    _id_A5E7::_id_1233( 0 );
}

start_mix_final_jump()
{
    _id_A5DE::_id_5CF2( "mix_final_jump" );
}

start_mix_finale_music()
{
    _id_A5DE::_id_5CF6( "mix_end" );
    _id_A5DE::_id_5CF2( "mix_finale_music" );
}

start_title_logo_mix()
{
    wait 6;
    _id_A5DE::_id_5CF2( "start_title_logo_mix" );
}

aud_start_sway1()
{
    level._id_0318 thread _id_A5A4::_id_69C4( "elm_cargo_metal_stress_l" );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 894.75, -254.68, 427.8 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 839.41, 199.43, 465.56 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.85, -175.85, 444.47 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.07, 177.02, 442.77 ) );
    aud_container_doors_creak();
}

aud_start_sway2()
{
    level._id_0318 thread _id_A5A4::_id_69C4( "elm_cargo_metal_stress_r" );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 894.75, -254.68, 427.8 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( 839.41, 199.43, 465.56 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.85, -175.85, 444.47 ) );
    thread common_scripts\utility::_id_69C2( "elm_metal_crane_creak", ( -736.07, 177.02, 442.77 ) );
    aud_container_doors_creak();
}

aud_container_doors_creak()
{
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1380.5, 181, 25 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1630.5, 181, 24.5 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1636.5, 89, 25 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1387, 192.5, 25.5 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1630, 285, 25.5 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1637, 194, 27 ) );
    thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( -1274.5, 256.5, -350 ) );

    if ( common_scripts\utility::_id_382E( "aud_package_door_creaks" ) )
    {
        thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( 2349.5, 254, -306 ) );
        thread common_scripts\utility::_id_69C2( "cgo_container_door_creaks", ( 2349.5, 154, -306 ) );
    }
}

start_blackhawk_move( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    _id_A5DE::_id_5CF2( "mix_heli_above_deck" );
    var_0 thread _id_A5A4::_id_69C4( var_1 );
}

stop_blackhawk_move()
{
    _id_A5DE::_id_5CF6( "mix_heli_above_deck" );
}

aud_alarm_sound()
{
    for (;;)
    {
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2332.8, -96.3121, -84.7888 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -3082.43, -216.679, 17.2978 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2513.76, -36.1929, 159.563 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2471.24, -226.825, 180.314 ) );
        thread common_scripts\utility::_id_69C2( "alarm_buzzer_control_room_3", ( -2570.56, -492.694, 169.511 ) );
        wait 2;
    }
}

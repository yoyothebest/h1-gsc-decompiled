// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_7E68();
    _id_4D05();
    level.cheat_highcontrast_override = "_night";
    thread setup_fade_angle_lights();
    thread _id_80C6();
    thread _id_7E68();
    thread blackout_vision_adjustment();
    thread handle_blackout_spotlights_off();
    thread handle_blackout_upstairs_spotlight();
    thread handle_start_swamp_fog();
    thread handle_exfil_heli_cinematic();
    thread _id_8106();
    thread _id_A54E::_id_694A( "firelight_motion_dim", "firelight_dim" );
    thread _id_A54E::_id_694A( "firelight_motion_medium", "firelight_medium" );
    thread _id_A54E::_id_694A( "firelight_motion_bright", "firelight_bright" );
    thread _id_A54E::_id_694A( "firelight_motion_verybright", "firelight_verybright" );
    thread _id_A54E::_id_694A( "firelight_motion_ridonculous", "firelight_ridonculous" );
    level.nightvisionlightset = "nightvision_blackout";
    _func_144( "blackout_nightvision" );
}

_id_4D05()
{
    common_scripts\utility::_id_383D( "turn_off_blackout_spotlights" );
    common_scripts\utility::_id_383D( "blackout_upstairs_spotlight_turn_on" );
    common_scripts\utility::_id_383D( "start_swamp_fog" );
}

_id_80C6()
{

}

_id_7E68()
{
    _func_0D6( "sm_minSpotLightScore", "0.0001" );
    _id_A5A4::_id_9E6E( "blackout_swamp_1", 0 );
    level._id_0318 _id_A5A4::set_light_set_player( "blackout_swamp_1" );
    level._id_0318 _meth_848C( "clut_blackout", 0.0 );
    _func_052( ( 10000, 10000, 10000 ), ( 0.00158008, 0.00158008, 0.00158008 ) );
}

setup_fade_angle_lights()
{
    var_0 = getentarray( "fade_angle_light", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 thread update_fade_angle_lights();
}

update_fade_angle_lights()
{
    var_0 = 45.0;
    var_1 = 135.0;
    var_2 = 10000.0;

    if ( isdefined( self._id_0398 ) )
    {
        var_3 = _func_124( self._id_0398, " " );

        if ( isdefined( var_3[0] ) )
            var_0 = _func_0BD( var_3[0] );

        if ( isdefined( var_3[1] ) )
            var_1 = _func_0BD( var_3[1] );

        if ( isdefined( var_3[2] ) )
            var_2 = _func_0BD( var_3[2] );
    }

    var_4 = var_0 / 180.0;
    var_5 = var_1 / 180.0;
    var_6 = ( var_1 - var_0 ) / 180.0;
    var_7 = anglestoforward( self.angles );
    var_8 = _func_114( ( var_7[0], var_7[1], 0.0 ) );

    for (;;)
    {
        var_9 = level._id_0318._id_02E2 - self._id_02E2 + var_7 * self._id_0351 * 0.75;
        var_9 = _func_114( ( var_9[0], var_9[1], 0.0 ) );
        var_10 = _func_0F6( var_8, var_9 );
        var_11 = ( _func_0E9( ( var_10 + 1.0 ) * 0.5, var_4, var_5 ) - var_4 ) / var_6;
        self _meth_81E2( var_2 * var_11 );
        wait 0.05;
    }
}

handle_start_swamp_fog()
{
    common_scripts\utility::_id_384A( "start_swamp_fog" );
}

handle_overlook_attack_cinematics()
{
    wait 0.05;
    common_scripts\utility::_id_384A( "ready_to_commence_attack" );
    var_0 = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_0.pitch_scale = 1.5;
    var_0.roll_scale = 1.3;
    var_0._id_0136 = 1;
    var_0.duration_fade_up = 0;
    var_0.duration_fade_down = 0.3;
    var_0.frequency_pitch = 13;
    var_0.frequency_roll = 13;
    var_1 = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_1.pitch_scale = 1.6;
    var_1.roll_scale = 1.5;
    var_1._id_0136 = 0.9;
    var_1.duration_fade_up = 0;
    var_1.duration_fade_down = 0.2;
    var_1.frequency_pitch = 12;
    var_1.frequency_roll = 14;
    var_2 = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_2.pitch_scale = 0.4;
    var_2.roll_scale = 0.6;
    var_2._id_0136 = 0.5;
    var_2.duration_fade_up = 0;
    var_2.duration_fade_down = 0.3;
    var_2.frequency_pitch = 7;
    var_2.frequency_roll = 6;
    wait 2.5;
    var_3 = maps\_cinematography::cinematic_sequence( "mortars" );
    var_3 maps\_cinematography::cinseq_key( "initial_explosion" ) maps\_cinematography::cinseq_key_time( 6.8 ) maps\_cinematography::cinseq_key_screen_shake( var_2 );
    var_3 maps\_cinematography::cinseq_key( "major_explosion" ) maps\_cinematography::cinseq_key_time( 7.8 ) maps\_cinematography::cinseq_key_screen_shake( var_1 );
    var_3 maps\_cinematography::cinseq_key( "cliff_rocket" ) maps\_cinematography::cinseq_key_time( 12.8 ) maps\_cinematography::cinseq_key_screen_shake( var_0 );
    var_3 maps\_cinematography::cinseq_start_sequence();
    common_scripts\utility::_id_384A( "first_bmp_destroyed" );
    var_4 = maps\_cinematography::cinematic_sequence( "bmp_destroyed" );
    var_4 maps\_cinematography::cinseq_key( "MLRS_destruction_1" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_screen_shake( var_1 );
    var_4 maps\_cinematography::cinseq_key( "MLRS_destruction_2" ) maps\_cinematography::cinseq_key_time( 1.5 ) maps\_cinematography::cinseq_key_screen_shake( var_1 );
    var_4 maps\_cinematography::cinseq_start_sequence();
}

blackout_vision_adjustment()
{
    wait 0.05;

    for (;;)
    {
        common_scripts\utility::_id_384A( "player_in_house" );
        thread _id_A5A4::_id_7F00( "blackout_darkness", 0.5 );
        level._id_0318 _id_A5A4::set_light_set_player( "safehouse_interior" );
        common_scripts\utility::_id_3857( "player_in_house" );
        thread _id_A5A4::_id_7F00( "blackout_village", 0.5 );
        level._id_0318 _id_A5A4::set_light_set_player( "blackout" );
    }
}

handle_exfil_heli_cinematic()
{
    wait 0.05;
    common_scripts\utility::_id_384A( "player_gets_on_heli" );
    maps\_cinematography::dyndof( "price" ) maps\_cinematography::dyndof_values( 4.8, 40, 5, 1 ) maps\_cinematography::dyndof_angles( -35, 35 ) maps\_cinematography::dyndof_reference_entity( level._id_6F7C ) maps\_cinematography::dyndof_tag_name( "tag_eye" );
    maps\_cinematography::dyndof( "nikolai" ) maps\_cinematography::dyndof_values( 3.2, 90, 5, 1 ) maps\_cinematography::dyndof_angles( -25, 25 ) maps\_cinematography::dyndof_reference_entity( level.vip ) maps\_cinematography::dyndof_tag_name( "tag_eye" );
    maps\_cinematography::dyndof( "main" ) maps\_cinematography::dyndof_values( 2.4, 800, 5, 1 ) maps\_cinematography::dyndof_autofocus( 1 );
    thread maps\_cinematography::dyndof_system_start( 1 );
    var_0 = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_0.pitch_scale = 0.63;
    var_0._id_A3B7 = 0.375;
    var_0.roll_scale = 0.35;
    var_0._id_0136 = 7;
    var_0.duration_fade_up = 2;
    var_0.duration_fade_down = 4;
    var_0.frequency_pitch = 12;
    var_0.frequency_roll = 5;
    var_0.frequency_yaw = 8.5;
    var_1 = maps\_cinematography::cinematic_sequence( "exfil" );
    var_1 maps\_cinematography::cinseq_key( "takeoff_shake" ) maps\_cinematography::cinseq_key_time( 8.5 ) maps\_cinematography::cinseq_key_screen_shake( var_0 );
    var_1 maps\_cinematography::cinseq_key( "begin_looping_shake" ) maps\_cinematography::cinseq_key_time( 15 ) maps\_cinematography::cinseq_key_add_custom_func( "looping_shake", ::loop_camera_shake, level );
    var_1 maps\_cinematography::cinseq_key( "blur_out" ) maps\_cinematography::cinseq_key_time( 19.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 0.6, 20, 2, 1 ) maps\_cinematography::cinseq_key_remove_dyndof( "price" ) maps\_cinematography::cinseq_key_remove_dyndof( "nikolai" );
    var_1 maps\_cinematography::cinseq_start_sequence();
}

loop_camera_shake()
{
    level endon( "end_looping_heli_cam_shake" );
    var_0 = [];
    var_0[0] = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_0[0].pitch_scale = 0.4;
    var_0[0]._id_A3B7 = 0.2;
    var_0[0].roll_scale = 0;
    var_0[0]._id_0136 = 3;
    var_0[0].duration_fade_up = 0;
    var_0[0].duration_fade_down = 0;
    var_0[0].frequency_pitch = 3;
    var_0[0].frequency_roll = 2;
    var_0[0].frequency_yaw = 0;
    var_0[1] = maps\_cinematography::cinseq_create_screen_shake_struct();
    var_0[1].pitch_scale = 0.5;
    var_0[1]._id_A3B7 = 0.2;
    var_0[1].roll_scale = 0;
    var_0[1]._id_0136 = 2;
    var_0[1].duration_fade_up = 0.5;
    var_0[1].duration_fade_down = 0;
    var_0[1].frequency_pitch = 3.5;
    var_0[1].frequency_roll = 2;
    var_0[1].frequency_yaw = 0;

    for (;;)
    {
        var_1 = _func_0B4( 0, var_0.size );
        var_2 = var_0[var_1];
        level._id_0318 _meth_83FC( var_2.pitch_scale, var_2._id_A3B7, var_2.roll_scale, var_2._id_0136, var_2.duration_fade_up, var_2.duration_fade_down, var_2._id_0351, var_2.frequency_pitch, var_2.frequency_roll, var_2.frequency_yaw, var_2._id_3583 );
        wait(var_0[var_1]._id_0136 - 0.5);
    }
}

handle_blackout_spotlights_off()
{
    common_scripts\utility::_id_384A( "turn_off_blackout_spotlights" );
    var_0 = getentarray( "blackout_spotlight", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\blackout_code::record_old_intensity );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0639, 0 );
    _id_A5A4::_id_2AC0( "blackout_light_org" );
}

handle_blackout_upstairs_spotlight()
{
    common_scripts\utility::_id_384A( "blackout_upstairs_spotlight_turn_on" );
    var_0 = getent( "blackout_upstairs_spotlight", "script_noteworthy" );
    var_0 _meth_81E2( var_0.old_intensity );
}

_id_8106()
{
    _id_A54E::_id_23B3( "firelight_motion_dim", ( 0.86, 0.5, 0.15 ), 10, 12, 0.15, 0.75 );
    _id_A54E::_id_23B3( "firelight_motion_medium", ( 1, 0.75, 0.35 ), 35, 12, 0.15, 0.75 );
    _id_A54E::_id_23B3( "firelight_motion_bright", ( 0.86, 0.5, 0.15 ), 80, 20, 0.2, 1.0 );
    _id_A54E::_id_23B3( "firelight_motion_verybright", ( 0.86, 0.5, 0.15 ), 200, 30, 0.6, 1.5 );
    _id_A54E::_id_23B3( "firelight_motion_ridonculous", ( 0.86, 0.5, 0.15 ), 4000, 40, 1, 2.5 );
}

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
}

_id_2110()
{
    _id_A5DC::_id_7EC8( "shg" );
    _id_A5F7::_id_8757( "med_occlusion" );
    _id_A5DE::_id_5CF2( "mix_blackout_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "enemy_heli_departs" );
}

_id_4CF4()
{

}

_id_5625()
{

}

_id_5618()
{

}

_id_5617()
{
    wait 0.1;
}

_id_23C4()
{

}

_id_6ECB()
{

}

_id_72E8()
{
    _id_A5E8::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    _id_A5E8::_id_874D( "start_chess_checkpoint", ::start_chess_checkpoint );
    _id_A5E8::_id_874D( "start_field_checkpoint", ::start_field_checkpoint );
    _id_A5E8::_id_874D( "start_overlook_checkpoint", ::start_overlook_checkpoint );
    _id_A5E8::_id_874D( "start_cliff_checkpoint", ::start_cliff_checkpoint );
    _id_A5E8::_id_874D( "start_rappel_checkpoint", ::start_rappel_checkpoint );
    _id_A5E8::_id_874D( "start_farmhouse_checkpoint", ::start_farmhouse_checkpoint );
    _id_A5E8::_id_874D( "start_blackout_checkpoint", ::start_blackout_checkpoint );
    _id_A5E8::_id_874D( "start_rescue_checkpoint", ::start_rescue_checkpoint );
    _id_A5E8::_id_874D( "aud_open_door_meeting", ::aud_open_door_meeting );
    _id_A5E8::_id_874D( "aud_start_meeting", ::aud_start_meeting );
    _id_A5E8::_id_874D( "aud_stop_meeting", ::aud_stop_meeting );
    _id_A5E8::_id_874D( "aud_start_enemy_heli_mix", ::aud_start_enemy_heli_mix );
    _id_A5E8::_id_874D( "aud_start_sniping_mix", ::aud_start_sniping_mix );
    _id_A5E8::_id_874D( "aud_stop_sniping_mix", ::aud_stop_sniping_mix );
    _id_A5E8::_id_874D( "start_gaz_kam_fight_mix", ::start_gaz_kam_fight_mix );
    _id_A5E8::_id_874D( "stop_gaz_kam_fight_mix", ::stop_gaz_kam_fight_mix );
    _id_A5E8::_id_874D( "aud_start_post_rappel_mix", ::aud_start_post_rappel_mix );
    _id_A5E8::_id_874D( "aud_stop_post_rappel_mix", ::aud_stop_post_rappel_mix );
    _id_A5E8::_id_874D( "aud_start_power_off_sfx", ::aud_start_power_off_sfx );
    _id_A5E8::_id_874D( "aud_gaz_open_door_rescue", ::aud_gaz_open_door_rescue );
    _id_A5E8::_id_874D( "start_player_gets_on_heli_mix", ::start_player_gets_on_heli_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    set_all_audio_zone_streamed_ambiance( "ambient_blackout_ext0" );
    disable_azm_trigger_before_meeting_door_open();
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5E7::_id_123A( "exterior" );
}

start_chess_checkpoint( var_0 )
{
    set_all_audio_zone_streamed_ambiance( "ambient_blackout_ext0" );
    disable_azm_trigger_before_meeting_door_open();
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5E7::_id_123A( "exterior" );
}

start_field_checkpoint( var_0 )
{
    aud_open_door_meeting();
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5E7::_id_123A( "exterior" );
}

start_overlook_checkpoint( var_0 )
{
    aud_open_door_meeting();
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5DE::_id_5CF2( "sniping_mix" );
    _id_A5E7::_id_123A( "exterior" );
}

start_cliff_checkpoint( var_0 )
{
    aud_open_door_meeting();
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5DE::_id_5CF2( "sniping_mix" );
    _id_A5E7::_id_123A( "exterior" );
}

start_rappel_checkpoint( var_0 )
{
    aud_open_door_meeting();
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5E7::_id_123A( "exterior" );
}

start_farmhouse_checkpoint( var_0 )
{
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5E7::_id_123A( "exterior" );
}

start_blackout_checkpoint( var_0 )
{
    disable_azm_trigger_before_gaz_open_door_for_rescue();
    _id_A5E7::_id_123A( "exterior" );
}

start_rescue_checkpoint( var_0 )
{
    aud_gaz_open_door_rescue();
    _id_A5E7::_id_123A( "interior_wood" );
}

aud_open_door_meeting()
{
    if ( isdefined( level._id_0E57.first_door_open_trigger ) )
    {
        wait 1.5;
        common_scripts\utility::_id_0D13( level._id_0E57.first_door_open_trigger, common_scripts\utility::_id_97CE );
    }

    var_0 = getent( "ambient_emitter_01", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "emt_blackout_ambient_transition" );
}

aud_start_meeting()
{
    _id_A5DE::_id_5CF2( "meeting_mix" );
    common_scripts\utility::_id_384A( "go_up_hill" );
    _id_A5DE::_id_5CF2( "allies_climbing_up_the_hill_mix" );
}

aud_stop_meeting()
{
    _id_A5DE::_id_5CF6( "meeting_mix" );
}

aud_start_enemy_heli_mix()
{
    wait 15.0;
    _id_A5DE::_id_5CF2( "enemy_heli_mix" );
    aud_stop_enemy_heli_mix();
}

aud_stop_enemy_heli_mix()
{
    common_scripts\utility::_id_384A( "enemy_heli_unloaded" );
    wait 8.0;
    _id_A5DE::_id_5CF6( "enemy_heli_mix" );
}

aud_start_sniping_mix()
{
    _id_A5DE::_id_5CF6( "allies_climbing_up_the_hill_mix" );
    _id_A5DE::_id_5CF2( "sniping_mix" );
}

aud_stop_sniping_mix()
{
    _id_A5DE::_id_5CF6( "sniping_mix" );
}

start_gaz_kam_fight_mix()
{
    _id_A5DE::_id_5CF2( "gaz_kam_fight_mix" );
}

stop_gaz_kam_fight_mix()
{
    _id_A5DE::_id_5CF6( "gaz_kam_fight_mix" );
}

aud_start_post_rappel_mix()
{
    _id_A5DE::_id_5CF2( "post_rappel_mix" );
}

aud_stop_post_rappel_mix()
{
    _id_A5DE::_id_5CF6( "post_rappel_mix" );
}

aud_gaz_open_door_rescue()
{
    if ( isdefined( level._id_0E57.gaz_door_open_trigger ) )
    {
        wait 1.5;
        level._id_0E57.gaz_door_open_trigger common_scripts\utility::_id_97CE();
    }

    var_0 = getent( "ambient_emitter_02", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "emt_blackout_ambient_transition" );
}

start_player_gets_on_heli_mix()
{
    wait 0.8;
    _id_A5E7::_id_123A( "inside_blackhawk" );
    wait 18.5;
    _id_A5DE::_id_5CF2( "end_black_screen_mix" );
}

aud_start_power_off_sfx()
{
    var_0 = getent( "exterior_light_turn_power_off_sfx", "targetname" );

    if ( isdefined( var_0 ) )
    {
        var_0 thread _id_A5A4::_id_69C4( "scn_blackout_power_down" );
        var_0 _id_A5A4::_id_69C4( "scn_light_power_off" );
    }
}

start_scripted_uaz_audio()
{
    var_0 = _func_1EC( "auto2259", "targetname" );
    var_0 thread play_uaz_scripted_sfx();
    var_1 = _func_1EC( "auto2246", "targetname" );
    var_1 thread play_uaz_rock_falling_sfx();
}

play_uaz_scripted_sfx()
{
    for ( var_0 = 1; var_0 <= 2; var_0++ )
    {
        self waittill( "trigger", var_1 );
        var_1 _meth_8287();
        var_1._id_799F = 1;
        var_1 _meth_809C( "scn_blackout_uaz_" + var_0 + "_scripted_track" );
    }
}

play_uaz_rock_falling_sfx()
{
    for ( var_0 = 1; var_0 <= 2; var_0++ )
    {
        self waittill( "trigger", var_1 );
        wait 2;
        var_1 thread common_scripts\utility::_id_69C2( "emt_truck_rock_rubble", var_1._id_02E2 + ( 0, 0, -100 ) );
        wait 1;
        var_1 thread common_scripts\utility::_id_69C2( "emt_truck_rock_rubble", var_1._id_02E2 + ( 0, 0, -100 ) );
    }
}

set_all_audio_zone_streamed_ambiance( var_0 )
{
    _id_A5E7::_id_1239( "exterior", var_0, 0.8 );
    _id_A5E7::_id_1239( "under_stone_bridge", var_0, 0.8 );
    _id_A5E7::_id_1239( "interior_wood_open", var_0, 0.8 );
    _id_A5E7::_id_1239( "interior_stone_open", var_0, 0.8 );
    _id_A5E7::_id_1239( "interior_burning_house", var_0, 0.8 );
    _id_A5E7::_id_1239( "interior_small_destructed_shack", var_0, 0.8 );
}

disable_azm_trigger_before_meeting_door_open()
{
    level._id_0E57.first_door_open_trigger = getentarray( "flag_before_first_door_open", "script_noteworthy" );
    common_scripts\utility::_id_0D13( level._id_0E57.first_door_open_trigger, common_scripts\utility::_id_97CC );
}

disable_azm_trigger_before_gaz_open_door_for_rescue()
{
    level._id_0E57.gaz_door_open_trigger = getent( "flag_before_gaz_open_door_for_rescue", "script_noteworthy" );
    level._id_0E57.gaz_door_open_trigger common_scripts\utility::_id_97CC();
}

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
    common_scripts\utility::_id_76BB( "trigger_bird_flyaway01", ::bird_flyaway_sound01 );
    common_scripts\utility::_id_76BB( "trigger_bird_flyaway02", ::bird_flyaway_sound02 );
    common_scripts\utility::_id_76BB( "trigger_bird_flyaway03", ::bird_flyaway_sound03 );
}

_id_2110()
{
    _id_A5DC::_id_7EC8( "shg" );
    _id_A5F7::_id_8757( "med_occlusion" );
    _id_A5DE::_id_5CF2( "mix_scoutsniper_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "musicSubmixDelay" );
}

_id_4CF4()
{
    level._interior_vo_zone = getentarray( "interior_vo_zone", "targetname" );
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
    _id_A5E8::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    _id_A5E8::_id_874D( "snd_music_handler", ::_id_5FFD );
    _id_A5E8::_id_874D( "aud_start_intro_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_church_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_graveyard_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_pond_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_cargo_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_dash_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_town_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_dogs_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_center_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_end_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "start_field_mix", ::start_field_mix );
    _id_A5E8::_id_874D( "start_pond_mix", ::start_pond_mix );
    _id_A5E8::_id_874D( "start_cargo_mix", ::start_cargo_mix );
    _id_A5E8::_id_874D( "start_taking_guard_mix", ::start_taking_guard_mix );
    _id_A5E8::_id_874D( "stop_taking_guard_mix", ::stop_taking_guard_mix );
    _id_A5E8::_id_874D( "start_dash_mix", ::start_dash_mix );
    _id_A5E8::_id_874D( "aud_start_dash_heli_flyby_sequence", ::aud_start_dash_heli_flyby_sequence );
    _id_A5E8::_id_874D( "aud_start_dash_convoy_sequence", ::aud_start_dash_convoy_sequence );
    _id_A5E8::_id_874D( "start_mix_moving_to_town", ::start_mix_moving_to_town );
    _id_A5E8::_id_874D( "start_town_mix", ::start_town_mix );
    _id_A5E8::_id_874D( "start_dogs_mix", ::start_dogs_mix );
    _id_A5E8::_id_874D( "start_school_heli_mix", ::start_school_heli_mix );
    _id_A5E8::_id_874D( "start_center_mix", ::start_center_mix );
    _id_A5E8::_id_874D( "start_end_mix", ::start_end_mix );
    _id_A5E8::_id_874D( "play_additionnal_fs_sfx", ::play_additionnal_fs_sfx );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_intro_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_church_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_graveyard_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "church" );
}

aud_start_field_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_pond_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_cargo_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_dash_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "containor" );
}

aud_start_town_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_dogs_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_center_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_end_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "hall" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "scoutsniper_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "scoutsniper_intro_mute" );
    _id_A5E7::_id_123A( "exterior" );
}

start_field_mix()
{
    _id_A5DE::_id_5CF6( "graveyard_hind_mix" );
    _id_A5DE::_id_5CF2( "field_mix" );
}

start_pond_mix()
{
    _id_A5DE::_id_5CF6( "field_mix" );
    _id_A5DE::_id_5CF2( "pond_mix" );
}

start_cargo_mix()
{
    _id_A5DE::_id_5CF6( "pond_mix" );
    _id_A5DE::_id_5CF2( "cargo_mix" );
}

start_taking_guard_mix()
{
    _id_A5DE::_id_5CF2( "taking_guard_mix" );
}

stop_taking_guard_mix()
{
    wait 1;
    _id_A5DE::_id_5CF6( "taking_guard_mix" );
}

start_dash_mix()
{
    _id_A5DE::_id_5CF6( "cargo_mix" );
    _id_A5DE::_id_5CF2( "dash_mix" );
}

start_mix_moving_to_town()
{
    self waittill( "trigger", var_0 );

    if ( !common_scripts\utility::_id_382E( "musicSubmixDelay" ) )
    {
        _id_A5DE::_id_5CF2( "moving_to_town" );
        level.movingtotownsubmix = 1;
    }

    level common_scripts\utility::_id_384A( "musicSubmixDelay" );

    if ( isdefined( level.movingtotownsubmix ) && level.movingtotownsubmix )
        _id_A5DE::_id_5CF6( "moving_to_town" );
}

moving_to_town_submix_handler()
{
    level _id_A5A4::_id_27EF( 24, common_scripts\utility::_id_383F, "musicSubmixDelay" );
    common_scripts\utility::_id_76BB( "dash_safezone_trigger", ::start_mix_moving_to_town );
}

start_town_mix()
{
    _id_A5DE::_id_5CF6( "dash_mix" );
    _id_A5DE::_id_5CF2( "town_mix" );
}

start_dogs_mix()
{
    _id_A5DE::_id_5CF6( "town_mix" );
}

start_center_mix()
{
    _id_A5DE::_id_5CF6( "dogs_mix" );
    _id_A5DE::_id_5CF2( "center_mix" );
}

start_school_heli_mix()
{
    _id_A5DE::_id_5CF2( "school_heli_mix" );
}

start_end_mix()
{
    _id_A5DE::_id_5CF6( "center_mix" );
    _id_A5DE::_id_5CF2( "end_mix" );
}

bird_flywaway( var_0, var_1 )
{
    self waittill( "trigger", var_2 );
    var_3 = spawn( "script_origin", var_0 );
    var_4 = spawn( "script_origin", var_1 );
    var_3 thread _id_A5A4::_id_69C4( "anml_bird_startle_flyaway" );
    var_3 _meth_82AA( var_4._id_02E2, 2, 0.5 );
    wait 2;
    var_3 delete();
    var_4 delete();
}

bird_flyaway_sound01()
{
    thread bird_flywaway( ( -8751.3, -11507.7, -160.006 ), ( -10563.6, -11225.8, 416.322 ) );
    thread bird_flywaway( ( -9133.09, -10977.3, -33.0787 ), ( -10541.5, -10762.5, 384.938 ) );
}

bird_flyaway_sound02()
{
    bird_flywaway( ( -9819, -7393.55, -58.442 ), ( -11173.2, -7153.06, 352.737 ) );
}

bird_flyaway_sound03()
{
    bird_flywaway( ( -187.072, 690.678, -111.24 ), ( -422.097, 1246.75, 314.014 ) );
}

aud_start_graveyard_heli_scripted_sequence( var_0 )
{
    _id_A5DE::_id_5CF2( "graveyard_hind_mix" );
    var_1 = spawn( "script_origin", self._id_02E2 );
    var_1 _meth_804F( self );
    var_1 _meth_809C( "scn_scoutsniper_graveyard_hind_passby" );
    var_2 = spawn( "script_origin", self._id_02E2 );
    var_3 = ( 0, 0, -400 );
    var_2 _meth_804F( self, "tag_origin", var_3, ( 0, 0, 0 ) );
    var_2 _meth_80B0( "heli_loop" );
    var_0 thread monitor_end_node_reached();
    common_scripts\utility::_id_A069( "end_node_reached", "enemy", "restart_avm" );
    _id_A5DE::_id_5CF6( "graveyard_hind_mix" );
    var_1 _meth_8071( 0, 2 );
    wait 2;
    var_1 _meth_854D( "scn_scoutsniper_graveyard_hind_passby" );
    var_2 _meth_80B1( "heli_loop" );
}

aud_start_school_heli_scripted_sequence( var_0 )
{
    _id_A5A4::_id_69C4( "scn_scoutsniper_school_int_heli_flyby" );
    var_0 thread monitor_end_node_reached();
    common_scripts\utility::_id_A069( "end_node_reached" );
    wait 2;
    _id_A5DE::_id_5CF6( "school_heli_mix" );
    wait 2;
    self _meth_854D( "scn_scoutsniper_school_int_heli_flyby" );
}

monitor_end_node_reached()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "death" );
    var_0 notify( "end_node_reached" );
}

aud_start_dash_heli_flyby_sequence()
{
    var_0 = getent( "start_heli", "script_noteworthy" );
    var_0 waittill( "trigger" );
    wait 0.1;
    _id_A5DE::_id_5CF2( "dash_heli_flyby_mix" );
    var_1 = _id_A5A4::_id_3EB2( "dash_hind", "targetname" );
    var_1 _meth_809C( "scn_scoutsniper_dash_heli_flyby" );
    thread aud_start_dash_heli_idle( var_1 );
    common_scripts\utility::_id_384A( "_stealth_spotted" );

    if ( isdefined( level.dash_section ) && level.dash_section )
    {
        _id_A5DE::_id_5CF6( "dash_heli_flyby_mix" );
        var_1 _meth_8071( 0, 1 );
        wait 1;
        var_1 _meth_80AE();
    }
}

aud_start_dash_heli_idle( var_0 )
{
    var_1 = getent( "land_heli_start_node", "script_noteworthy" );
    var_1 waittill( "trigger" );
    _id_A5DE::_id_5CF6( "dash_heli_flyby_mix" );
    var_0 _meth_8071( 0.5, 0.5 );
    wait 0.5;
    var_0 _meth_8077( "scn_scoutsniper_dash_heli_idle" );
    var_0 _meth_8071( 1, 1.5 );
    common_scripts\utility::_id_384A( "_stealth_spotted" );

    if ( isdefined( level.dash_section ) && level.dash_section )
    {
        var_0 _meth_8071( 0, 1 );
        wait 1;
        var_0 _meth_80AD( "scn_scoutsniper_dash_heli_idle" );
    }
}

aud_field_handle_bmps_engine()
{
    var_0 = _func_1EC( "first_bmp_end", "script_noteworthy" );
    var_1 = _func_1EC( "second_bmp_end", "script_noteworthy" );
    var_2 = _func_1EC( "third_bmp_end", "script_noteworthy" );
    var_3 = _func_1EC( "fourth_bmp_end", "script_noteworthy" );
    var_0 thread aud_field_bmp_end_node_reached();
    var_1 thread aud_field_bmp_end_node_reached();
    var_2 thread aud_field_bmp_end_node_reached();
    var_3 thread aud_field_bmp_end_node_reached();
}

aud_field_bmp_end_node_reached()
{
    self waittill( "trigger", var_0 );
    var_0 aud_field_bmp_to_idle();
}

aud_field_bmp_engine_handle()
{
    waitframe;
    self._id_799F = 1;
    self _meth_8287();
    thread _id_A5A4::_id_6976( "bmp_engine_front", "tag_flash" );
    thread _id_A5A4::_id_6976( "bmp_engine_rear", "tag_c4" );
    thread _id_A5A4::_id_6976( "bmp_thread_loop_side", "tag_wheel_middle_left" );
    thread _id_A5A4::_id_6976( "bmp_thread_loop_side", "tag_wheel_middle_right" );
}

aud_field_bmp_to_idle()
{
    self _meth_8071( 0, 1 );
    wait 1.2;
    common_scripts\utility::_id_8EA1( "bmp_engine_front" );
    common_scripts\utility::_id_8EA1( "bmp_engine_rear" );
    common_scripts\utility::_id_8EA1( "bmp_thread_loop_side" );
    self _meth_8071( 1, 1 );
    thread _id_A5A4::_id_6976( "bmp_engine_idle", "tag_flash" );
}

aud_start_dash_convoy_sequence()
{
    var_0 = _func_1EC( "firsttruck", "script_noteworthy" );
    var_1 = _func_1EC( "secondtruck", "script_noteworthy" );
    var_2 = _func_1EC( "jeep", "script_noteworthy" );
    var_0 thread convoy_node_reached();
    var_1 thread convoy_node_reached();
    var_2 thread convoy_node_reached();
}

convoy_node_reached()
{
    self waittill( "trigger", var_0 );
    var_1 = "scn_scoutsniper_dash_" + self._id_0398;
    var_0 thread _id_A5A4::_id_69C4( var_1 );
    var_2 = _func_1EC( self._id_0398 + "_close", "script_noteworthy" );
    var_2 waittill( "trigger", var_0 );
    var_1 = "scn_scoutsniper_dash_" + self._id_0398 + "_close";
    var_0 thread _id_A5A4::_id_69C4( var_1 );
}

play_additionnal_fs_sfx()
{
    if ( self != level._id_6F7C )
        thread _id_A5A4::_id_69C4( "scn_scout_convoy_npc_step" );
}

aud_school_heli_rumble()
{
    thread common_scripts\utility::_id_69C2( "emt_helicopter_ground_rumble", ( 11330.9, 6009.59, 150.375 ) );
    thread common_scripts\utility::_id_69C2( "scn_scoutsniper_school_int_debris_1", ( 11366, 5986.93, 191.435 ) );
    thread common_scripts\utility::_id_69C2( "scn_scoutsniper_school_int_debris_2", ( 11346.6, 5770.42, 190.031 ) );
}

cargo_guard_getting_hit( var_0 )
{
    var_0 thread _id_A5A4::_id_69C4( "scn_scoutsniper_taking_guard" );
}

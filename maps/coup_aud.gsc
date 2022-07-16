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
    _id_A5DE::_id_5CF2( "mix_coup_global" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "music_part2" );
    common_scripts\utility::_id_383D( "music_part3" );
    common_scripts\utility::_id_383D( "music_part4" );
}

_id_4CF4()
{

}

_id_5625()
{
    thread handle_heli_scripted_sfx();
    thread aud_first_bmp();
    thread aud_jeep_event();
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
    _id_A5E8::_id_874D( "start_intro_checkpoint", ::start_intro_checkpoint );
    _id_A5E8::_id_874D( "start_drive_checkpoint", ::start_drive_checkpoint );
    _id_A5E8::_id_874D( "start_doorkick_checkpoint", ::start_doorkick_checkpoint );
    _id_A5E8::_id_874D( "start_trashstumble_checkpoint", ::start_trashstumble_checkpoint );
    _id_A5E8::_id_874D( "start_runners2_checkpoint", ::start_runners2_checkpoint );
    _id_A5E8::_id_874D( "start_alley_checkpoint", ::start_alley_checkpoint );
    _id_A5E8::_id_874D( "start_shore_checkpoint", ::start_shore_checkpoint );
    _id_A5E8::_id_874D( "start_carexit_checkpoint", ::start_carexit_checkpoint );
    _id_A5E8::_id_874D( "start_ending_checkpoint", ::start_ending_checkpoint );
    _id_A5E8::_id_874D( "aud_coup_car_open", ::aud_coup_car_open );
    _id_A5E8::_id_874D( "aud_coup_enter_car", ::aud_coup_enter_car );
    _id_A5E8::_id_874D( "aud_coup_exit_car", ::aud_coup_exit_car );
    _id_A5E8::_id_874D( "aud_coup_car_thrown_out", ::aud_coup_car_thrown_out );
    _id_A5E8::_id_874D( "aud_exterior_to_bunker", ::aud_exterior_to_bunker );
    _id_A5E8::_id_874D( "aud_bunker_to_exterior", ::aud_bunker_to_exterior );
    _id_A5E8::_id_874D( "start_slowmo_mix", ::start_slowmo_mix );
    _id_A5E8::_id_874D( "stop_slowmo_mix", ::stop_slowmo_mix );
    _id_A5E8::_id_874D( "start_coup_player_death_mix", ::start_coup_player_death_mix );
    _id_A5E8::_id_874D( "aud_add_stunned_car_event", ::aud_add_stunned_car_event );
    _id_A5E8::_id_874D( "aud_stop_stunned_car_event", ::aud_stop_stunned_car_event );
    _id_A5E8::_id_874D( "aud_car_sound_node_spawner", ::aud_car_sound_node_spawner );
    _id_A5E8::_id_874D( "aud_shutoff_engine", ::aud_shutoff_engine );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_intro_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_drive_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_vehicle" );
}

start_doorkick_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_vehicle" );
}

start_trashstumble_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_vehicle" );
}

start_runners2_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_vehicle" );
}

start_alley_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_vehicle" );
}

start_shore_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_vehicle" );
}

start_carexit_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_vehicle" );
}

start_ending_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "coup_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "coup_intro_mute", 1 );
}

aud_coup_enter_car()
{
    _id_A5E7::_id_123B( "exterior", 0.3 );
    _id_A5E7::_id_123A( "interior_vehicle", 0.3 );
}

aud_coup_exit_car()
{
    _id_A5E7::_id_123B( "interior_vehicle", 0.3 );
    _id_A5E7::_id_123A( "interior_vehicle_open", 0.3 );
}

aud_coup_car_open()
{
    _id_A5E7::_id_123B( "exterior", 0.3 );
    _id_A5E7::_id_123B( "interior_vehicle", 0.3 );
    _id_A5E7::_id_123A( "interior_vehicle_open", 0.3 );
}

aud_coup_car_thrown_out()
{
    _id_A5E7::_id_123B( "interior_vehicle_open", 0.3 );
    _id_A5E7::_id_123A( "exterior", 0.3 );
}

aud_exterior_to_bunker()
{
    _id_A5E7::_id_123B( "exterior", 0.3 );
    _id_A5E7::_id_123A( "bunker", 0.3 );
}

aud_bunker_to_exterior()
{
    _id_A5E7::_id_123B( "bunker", 5.5 );
    _id_A5E7::_id_123A( "exterior", 5.5 );
}

start_slowmo_mix()
{
    _id_A5DE::_id_5CF6( "dead_man_mix" );
    _id_A5DE::_id_5CF2( "slowmo_mix" );
}

stop_slowmo_mix()
{
    _id_A5DE::_id_5CF6( "slowmo_mix" );
    _id_A5DE::_id_5CF2( "getting_shot_mix" );
}

start_coup_player_death_mix()
{
    _id_A5DE::_id_5CF6( "getting_shot_mix" );
    _id_A5DE::_id_5CF2( "coup_player_death_mix" );
}

aud_add_stunned_car_event()
{
    _id_A5DE::_id_5CF2( "stunned_car_mix" );
}

aud_stop_stunned_car_event()
{
    _id_A5DE::_id_5CF6( "stunned_car_mix" );
}

aud_curb_stomp_event()
{
    wait 0.7;
    _id_A5DE::_id_5CF6( "engine_shutoff_mix" );
    _id_A5DE::_id_5CF2( "curb_stomp_mix" );
    wait 2.5;
    _id_A5DE::_id_5CF6( "curb_stomp_mix" );
    _id_A5DE::_id_5CF2( "dead_man_mix" );
}

handle_heli_scripted_sfx()
{
    var_0 = common_scripts\utility::_id_40FB( "auto2187", "targetname" );
    var_1 = common_scripts\utility::_id_40FB( "auto2712", "targetname" );
    var_2 = common_scripts\utility::_id_40FB( "auto2718", "targetname" );
    var_3 = common_scripts\utility::_id_40FB( "auto2601", "targetname" );
    var_0 thread heli_scripted_sfx( "scn_hind_passby_01", "unloaded" );
    var_1 thread heli_scripted_sfx( "scn_hind_passby_02" );
    var_2 thread heli_scripted_sfx( "scn_hind_passby_03" );
    var_3 thread heli_scripted_sfx( "scn_hind_passby_04", "unloaded" );
    var_4 = getent( "alleyway_hind1_trigger", "targetname" );
    var_4 thread three_heli_passby_trig( "scn_alleyway_hind1_0" );
    var_5 = getent( "alleyway_hind2_trigger", "targetname" );
    var_5 thread three_heli_passby_trig( "scn_alleyway_hind2_0" );
}

heli_scripted_sfx( var_0, var_1 )
{
    self waittill( "trigger", var_2 );

    if ( isdefined( var_1 ) )
        var_2 waittill( var_1 );

    var_2 play_helicopter_scripted_sfx( var_0 );
}

three_heli_passby_trig( var_0 )
{
    var_1 = self._id_7B1A;
    self waittill( "trigger", var_2 );
    wait 0.1;
    var_3 = _id_A5A4::_id_4153();
    var_4 = 1;

    foreach ( var_6 in var_3 )
    {
        if ( var_6.classname == "script_vehicle_mi24p_hind_desert" && isdefined( var_6._id_7B1A ) && var_6._id_7B1A == var_1 )
        {
            var_6 play_helicopter_scripted_sfx( var_0 + var_4 );
            var_4++;
        }
    }
}

aud_jeep_event()
{
    var_0 = _func_1EC( "auto2734", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread _id_A5A4::_id_69C4( "scn_coup_jeep_hard_turn" );
}

play_helicopter_scripted_sfx( var_0 )
{
    self._id_799F = 1;
    self _meth_8287();
    thread _id_A5A4::_id_69C4( var_0 );
}

aud_car_sound_node_spawner()
{
    level.car_move_engine_sound_node = spawn( "script_origin", level.car._id_02E2 );
    level.car_idle_engine_sound_node = spawn( "script_origin", level.car._id_02E2 );
    level.car_move_engine_sound_node _meth_804F( level.car );
    level.car_idle_engine_sound_node _meth_804F( level.car );
}

aud_car_event_handler( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_5 ) )
        _id_A5DE::_id_5CF2( var_5 );

    thread aud_car_engine_idle_handler( var_0, var_1, var_2, var_3, var_4 );
    self _meth_806F( var_0, var_1 );
    wait(var_2 + var_1);
    self _meth_806F( var_3, var_4 );
    wait(var_4);

    if ( isdefined( var_5 ) )
        _id_A5DE::_id_5CF6( var_5 );
}

aud_car_engine_idle_handler( var_0, var_1, var_2, var_3, var_4 )
{
    level.car_idle_engine_sound_node _meth_8071( 0, 0 );
    waittillframeend;
    level.car_idle_engine_sound_node _meth_8077( "scn_coup_car_idle_engine" );
    level.car_idle_engine_sound_node _meth_8071( 0.71, var_1 );
    level.car_idle_engine_sound_node _meth_806F( var_0, var_1 );
    wait(var_2 + var_1);
    level.car_idle_engine_sound_node _meth_8071( 0, var_4 );
    level.car_idle_engine_sound_node _meth_806F( var_3, var_4 );
    wait(var_4);
    level.car_idle_engine_sound_node _meth_80AD( "scn_coup_car_idle_engine" );
}

aud_play_engine( var_0, var_1 )
{
    self _meth_809C( "scn_coup_car_move_engine_" + var_1 );
}

aud_stop_engine( var_0, var_1 )
{
    self _meth_8071( 0, var_1 );
    wait(var_1);
    self _meth_854D( "scn_coup_car_move_engine_" + var_0 );
    self _meth_8071( 1, 1 );
}

aud_shutoff_engine()
{
    wait 1.0;
    _id_A5DE::_id_5CF2( "engine_shutoff_mix" );
    level.car_move_engine_sound_node _meth_809C( "scn_coup_engine_shutoff" );
    level.car_move_engine_sound_node thread aud_stop_engine( "02", 1 );
}

aud_music_handler()
{
    _id_A5A4::_id_6008( "music_coup_intro_01" );
    common_scripts\utility::_id_384A( "music_part2" );
    wait 1.5;
    _id_A5A4::_id_6005( 1.0 );
    _id_A5A4::_id_6008( "music_coup_intro_02" );
    common_scripts\utility::_id_384A( "music_part3" );
    wait 8.0;
    _id_A5A4::_id_5FFC( "music_coup_intro_03", 1.0 );
    common_scripts\utility::_id_384A( "music_part4" );
    wait 1.5;
    _id_A5A4::_id_6005( 1.0 );
    _id_A5A4::_id_6008( "music_coup_intro_04" );
}

aud_first_bmp()
{
    var_0 = _func_1EC( "auto707", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread _id_A5A4::_id_69C4( "scn_coup_first_bmp" );
}

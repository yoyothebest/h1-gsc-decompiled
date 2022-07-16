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
    _id_A5DE::_id_5CF2( "mix_airlift_global" );
}

_id_4D5B()
{
    _func_2D4( "vehicles", "solid", "glass" );
    _func_2D4( "battlechatter", "solid", "glass" );
    _func_2D4( "voices", "solid", "glass" );
    _func_2D4( "emitters", "solid", "glass" );
    _func_2D4( "weapons", "solid", "glass" );
    _func_2D4( "explosions", "solid", "glass" );
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
    _id_A5E8::_id_874D( "start_smoketown_checkpoint", ::start_smoketown_checkpoint );
    _id_A5E8::_id_874D( "start_cobraflight_checkpoint", ::start_cobraflight_checkpoint );
    _id_A5E8::_id_874D( "start_cobrastreets_checkpoint", ::start_cobrastreets_checkpoint );
    _id_A5E8::_id_874D( "start_nuke_checkpoint", ::start_nuke_checkpoint );
    _id_A5E8::_id_874D( "aud_add_gun_overheat_mix", ::aud_add_gun_overheat_mix );
    _id_A5E8::_id_874D( "aud_remove_gun_overheat_mix", ::aud_remove_gun_overheat_mix );
    _id_A5E8::_id_874D( "aud_seaknight_sound_node_spawner", ::aud_seaknight_sound_node_spawner );
    _id_A5E8::_id_874D( "aud_seaknight_leaves_smoketown", ::aud_seaknight_leaves_smoketown );
    _id_A5E8::_id_874D( "aud_add_smoketown_operation_mix", ::aud_add_smoketown_operation_mix );
    _id_A5E8::_id_874D( "aud_add_leave_smoketown_mix", ::aud_add_leave_smoketown_mix );
    _id_A5E8::_id_874D( "aud_add_drag_pilot_mix", ::aud_add_drag_pilot_mix );
    _id_A5E8::_id_874D( "aud_add_escape_crash_mix", ::aud_add_escape_crash_mix );
    _id_A5E8::_id_874D( "aud_add_failure_mix", ::aud_add_failure_mix );
    _id_A5E8::_id_874D( "aud_add_nuke_heli_spin_mix", ::aud_add_nuke_heli_spin_mix );
    _id_A5E8::_id_874D( "aud_add_nuke_blackscreen_mix", ::aud_add_nuke_blackscreen_mix );
    _id_A5E8::_id_874D( "player_outside_seaknight", ::player_outside_seaknight );
    _id_A5E8::_id_874D( "set_ambient_helicopter", ::set_ambient_helicopter );
    _id_A5E8::_id_874D( "start_cobra_crash_mix", ::start_cobra_crash_mix );
    _id_A5E8::_id_874D( "start_pilot_rescue_mix", ::start_pilot_rescue_mix );
    _id_A5E8::_id_874D( "start_nuke_mix", ::start_nuke_mix );
    _id_A5E8::_id_874D( "set_context_int_for_seaknight", ::set_context_int_for_seaknight );
    _id_A5E8::_id_874D( "set_context_ext_for_seaknight", ::set_context_ext_for_seaknight );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "inside_seaknight_ext" );
    _id_A5DE::_id_5CF2( "intro_chopper_mix" );
}

start_smoketown_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "inside_seaknight_ext" );
    _id_A5DE::_id_5CF2( "heli_landing_field_mix" );
}

start_cobraflight_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
    _id_A5DE::_id_5CF2( "smoketown_operation_mix" );
}

start_cobrastreets_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "inside_seaknight_ext" );
    _id_A5DE::_id_5CF2( "pilot_rescue_mix" );
}

start_nuke_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
    _id_A5DE::_id_5CF2( "escape_crash_mix" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "airlift_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "airlift_intro_mute" );
    _id_A5DE::_id_5CF2( "intro_chopper_mix" );
    _id_A5E7::_id_123A( "inside_seaknight_ext" );
}

set_ambient_helicopter()
{
    _id_A5E7::_id_123A( "inside_seaknight_int" );
}

player_outside_seaknight()
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_add_smoketown_operation_mix()
{
    _id_A5DE::_id_5CF6( "seaknight_taking_off_mix" );
    _id_A5DE::_id_5CF2( "smoketown_operation_mix" );
}

aud_add_leave_smoketown_mix()
{
    _id_A5DE::_id_5CF6( "smoketown_operation_mix", 0.5 );
    _id_A5DE::_id_5CF2( "leaving_smoketown_mix" );
}

start_cobra_crash_mix()
{
    _id_A5DE::_id_5CF6( "leaving_smoketown_mix" );
    _id_A5DE::_id_5CF2( "cobra_crash_mix" );
}

start_pilot_rescue_mix()
{
    _id_A5DE::_id_5CF6( "landing_crash_mix" );
    _id_A5DE::_id_5CF2( "pilot_rescue_mix" );
}

aud_add_drag_pilot_mix()
{
    _id_A5DE::_id_5CF6( "pilot_rescue_mix" );
    _id_A5DE::_id_5CF2( "drag_pilot_mix" );
}

aud_add_escape_crash_mix()
{
    _id_A5DE::_id_5CF6( "drag_pilot_mix" );
    _id_A5DE::_id_5CF2( "escape_crash_mix" );
}

start_nuke_mix()
{
    _id_A5DE::_id_5CF6( "escape_crash_mix" );
    _id_A5DE::_id_5CF2( "nuke_mix" );
}

aud_add_nuke_heli_spin_mix()
{
    _id_A5DE::_id_5CF6( "nuke_mix" );
    _id_A5DE::_id_5CF2( "nuke_heli_spin_mix" );
}

aud_add_nuke_blackscreen_mix()
{
    _id_A5DE::_id_5CF6( "nuke_heli_spin_mix" );
    _id_A5DE::_id_5CF2( "nuke_blackscreen_mix" );
}

aud_add_gun_overheat_mix()
{
    _id_A5DE::_id_5CF2( "gun_overheat_mix" );
}

aud_remove_gun_overheat_mix()
{
    _id_A5DE::_id_5CF6( "gun_overheat_mix" );
}

aud_add_failure_mix()
{
    _id_A5DE::_id_5CF2( "failure_mix" );
}

set_context_int_for_seaknight()
{
    _id_A5E7::_id_123A( "inside_seaknight_int", 0.5 );
}

set_context_ext_for_seaknight()
{
    _id_A5E7::_id_123A( "inside_seaknight_ext", 0.5 );
}

aud_seaknight_sound_node_spawner()
{
    level.seaknight_engine_sound_node = spawn( "script_origin", level.seaknight._id_02E2 );
    level.seaknight_engine_sound_node _meth_804F( level.seaknight );
}

aud_seaknight_event_handler( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_3 ) && isdefined( var_4 ) )
    {
        _id_A5DE::_id_5CF6( var_3, 0.5 );
        _id_A5DE::_id_5CF2( var_4, 0.5 );
    }

    self _meth_806F( var_0, var_2 );
    self _meth_8071( var_1, var_2 );
}

aud_seaknight_audio_event( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_A5A4::_id_69C4( var_0 );
    self _meth_806F( var_1, var_2 );
    wait(var_3 + var_2);
    self _meth_806F( var_4, var_5 );
}

aud_seaknight_leaves_smoketown()
{
    _id_A5DE::_id_5CF6( "heli_landing_field_mix", 0.5 );
    _id_A5DE::_id_5CF2( "seaknight_taking_off_mix", 0.5 );
    level.seaknight_engine_sound_node thread _id_A5A4::_id_69C4( "scn_airlift_seaknight_liftoff_smoketown" );
}

aud_convoy_passby_manager( var_0, var_1, var_2, var_3 )
{
    wait(var_3);
    var_4 = getentarray( var_0, var_1 );

    foreach ( var_6 in var_4 )
        var_6 _meth_809C( var_2 );
}

aud_cobra_passby_manager( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );
    var_3 waittill( "trigger", var_4 );
    wait(var_2);
    var_4 thread _id_A5A4::_id_69C4( var_1 );
}

aud_abrams_passby_manager( var_0 )
{
    var_1 = 0;

    for (;;)
    {
        self waittill( "trigger", var_2 );
        wait 0.1;
        var_1 += 1;

        switch ( var_0 )
        {
            case "lead":
                var_2 thread _id_A5A4::_id_69C4( "scn_airlift_abrams_lead" );
                break;
            case "follow":
                var_3 = "scn_airlift_abrams_follow_0" + var_1;
                var_2 thread _id_A5A4::_id_69C4( var_3 );
                break;
        }

        wait 0.05;
    }
}

play_player_heli_land_sfx( var_0, var_1 )
{
    var_0 waittill( "trigger", var_2 );
    thread _id_A5A4::_id_69C4( var_1 );
}

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
    _id_A5DE::_id_5CF2( "mix_airplane_global" );
    _id_A5DE::_id_5CF2( "first_floor_mix" );
}

_id_4D5B()
{
    common_scripts\utility::_id_383D( "wind_zone_active" );
}

_id_4CF4()
{

}

_id_5625()
{
    thread aud_wind_door_mix_manager();
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
    _id_A5E8::_id_874D( "aud_start_breach_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_vip_checkpoint", ::aud_start_vip_checkpoint );
    _id_A5E8::_id_874D( "aud_start_freefall_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_demo_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_start_no_game_checkpoint", ::aud_start_intro_checkpoint );
    _id_A5E8::_id_874D( "aud_add_wind_door_mix", ::aud_add_wind_door_mix );
    _id_A5E8::_id_874D( "aud_remove_wind_door_mix", ::aud_remove_wind_door_mix );
    _id_A5E8::_id_874D( "aud_add_armed_bomb_vo_mix", ::aud_add_armed_bomb_vo_mix );
    _id_A5E8::_id_874D( "aud_remove_armed_bomb_vo_mix", ::aud_remove_armed_bomb_vo_mix );
    _id_A5E8::_id_874D( "aud_add_slowmo_mix", ::aud_add_slowmo_mix );
    _id_A5E8::_id_874D( "aud_remove_slowmo_mix", ::aud_remove_slowmo_mix );
    _id_A5E8::_id_874D( "mission_failed_fade_out", ::mission_failed_fade_out );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_intro_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_small" );
}

aud_start_breach_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_large" );
}

aud_start_vip_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "second_floor_corridor" );
}

aud_start_freefall_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "second_floor_large" );
}

aud_start_demo_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_large" );
}

aud_wind_door_mix_manager()
{
    common_scripts\utility::_id_384A( "wind_zone_active" );
    var_0 = getent( "zone_wind", "targetname" );
    var_0 thread update_wind_mix();
}

update_wind_mix()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0 != level._id_0318 )
            continue;

        aud_add_wind_door_mix();

        while ( self _meth_80AB( level._id_0318 ) )
            wait 0.05;

        aud_remove_wind_door_mix();
    }
}

aud_add_wind_door_mix()
{
    _id_A5DE::_id_5CF2( "wind_door_mix" );
}

aud_remove_wind_door_mix()
{
    _id_A5DE::_id_5CF6( "wind_door_mix" );
}

aud_add_armed_bomb_vo_mix()
{
    _id_A5DE::_id_5CF2( "armed_bomb_vo_mix" );
}

aud_remove_armed_bomb_vo_mix()
{
    _id_A5DE::_id_5CF6( "armed_bomb_vo_mix" );
}

aud_add_slowmo_mix()
{
    _id_A5DE::_id_5CF2( "slowmo_mix" );
}

aud_remove_slowmo_mix()
{
    _id_A5DE::_id_5CF6( "slowmo_mix" );
}

aud_explosion_event()
{
    thread common_scripts\utility::_id_69C2( "emt_engine_rev_left", ( -213.481, 1664.53, 57.2619 ) );
    thread common_scripts\utility::_id_69C2( "emt_engine_rev_right", ( -293.822, -439.819, 35.6474 ) );
    thread common_scripts\utility::_id_697A( "emt_engine_left_lp", ( -213.481, 1664.53, 57.2619 ) );
    thread common_scripts\utility::_id_697A( "emt_engine_right_lp", ( -293.822, -439.819, 35.6474 ) );
    thread common_scripts\utility::_id_697A( "fuselage_breach_wind", ( 1120.67, 713.839, 177.178 ) );
}

aud_animated_luggage()
{
    thread common_scripts\utility::_id_6975( "emt_luggage_rattler_lp" );
}

aud_end_breach_sounds()
{
    thread _id_A5A4::_id_69C4( "end_breach_explosion" );
    thread _id_A5A4::_id_69C4( "end_breach_explosion_in" );
    thread common_scripts\utility::_id_6975( "end_breach_hole_wind_lp" );
    _id_A5A4::_id_27EF( 1.4, common_scripts\utility::_id_69C2, "scn_container_impact", ( -1042.49, 510.675, 289.612 ) );
    _id_A5A4::_id_27EF( 2.5, common_scripts\utility::_id_69C2, "scn_container_impact", ( -1115.57, 395.735, 299.337 ) );
}

aud_final_jump_mix_and_sounds()
{
    thread _id_A5DE::_id_5CF9( "second_floor_mix" );
    thread _id_A5DE::_id_5CF6( "armed_bomb_vo_mix" );
    thread _id_A5DE::_id_5CF2( "final_jump_mix" );
    level._id_0318 thread _id_A5A4::_id_69C4( "end_jump_plane" );
    level._id_0318 thread common_scripts\utility::_id_6975( "ext_wind_lp_front" );
}

mission_failed_fade_out()
{
    _id_A5DE::_id_5CF2( "fade_to_black_end_mix" );
}

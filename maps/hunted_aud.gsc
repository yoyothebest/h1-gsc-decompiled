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
    _id_A5DE::_id_5CF2( "mix_hunted_global" );
}

_id_4D5B()
{

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
    _id_A5E8::_id_874D( "snd_zone_handler", ::_id_A3E6 );
    _id_A5E8::_id_874D( "snd_music_handler", ::_id_5FFD );
    _id_A5E8::_id_874D( "aud_start_default_checkpoint", ::aud_start_default_checkpoint );
    _id_A5E8::_id_874D( "aud_start_crash_checkpoint", ::aud_start_crash_checkpoint );
    _id_A5E8::_id_874D( "aud_start_path_checkpoint", ::aud_start_path_checkpoint );
    _id_A5E8::_id_874D( "aud_start_barn_checkpoint", ::aud_start_barn_checkpoint );
    _id_A5E8::_id_874D( "aud_start_field_checkpoint", ::aud_start_field_checkpoint );
    _id_A5E8::_id_874D( "aud_start_basement_checkpoint", ::aud_start_basement_checkpoint );
    _id_A5E8::_id_874D( "aud_start_farm_checkpoint", ::aud_start_farm_checkpoint );
    _id_A5E8::_id_874D( "aud_start_creek_checkpoint", ::aud_start_creek_checkpoint );
    _id_A5E8::_id_874D( "aud_start_greenhouse_checkpoint", ::aud_start_greenhouse_checkpoint );
    _id_A5E8::_id_874D( "aud_start_ac130_checkpoint", ::aud_start_ac130_checkpoint );
    _id_A5E8::_id_874D( "aud_set_exterior_level_1", ::aud_set_exterior_level_1 );
    _id_A5E8::_id_874D( "aud_set_exterior_level_2", ::aud_set_exterior_level_2 );
    _id_A5E8::_id_874D( "aud_heli_crashing", ::aud_heli_crashing );
    _id_A5E8::_id_874D( "aud_heli_crash_fade_out", ::aud_heli_crash_fade_out );
    _id_A5E8::_id_874D( "aud_heli_crash_fade_in", ::aud_heli_crash_fade_in );
    _id_A5E8::_id_874D( "aud_heli_slomo", ::aud_heli_slomo );
    _id_A5E8::_id_874D( "aud_heli_field_pass", ::aud_heli_field_pass );
    _id_A5E8::_id_874D( "aud_barnyard_sequence", ::aud_barnyard_sequence );
    _id_A5E8::_id_874D( "aud_ac130_sequence", ::aud_ac130_sequence );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_default_checkpoint( var_0 )
{
    aud_set_exterior_level_0();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_crash_checkpoint( var_0 )
{
    aud_set_exterior_level_0();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_path_checkpoint( var_0 )
{
    aud_set_exterior_level_0();
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_barn_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_field_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_basement_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_farm_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_creek_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_greenhouse_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_start_ac130_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "hunted_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "hunted_intro_mute", 2 );
    _id_A5DE::_id_5CF2( "helicopter_ride_mix" );
}

aud_heli_slomo()
{
    wait 0.4;
    _id_A5DE::_id_5CF6( "helicopter_ride_mix" );
    _id_A5DE::_id_5CF2( "helicopter_slowmo_mix" );
    _id_A5F7::_id_86DB( "scn_explosion_filter", 0.5 );
}

aud_heli_crashing()
{
    _id_A5F7::_id_86DC( 0.1 );
    _id_A5DE::_id_5CF6( "helicopter_slowmo_mix" );
    _id_A5DE::_id_5CF2( "helicopter_crashing_mix" );
}

aud_heli_crash_fade_out()
{
    _id_A5DE::_id_5CF6( "helicopter_crashing_mix" );
    _id_A5DE::_id_5CF2( "heli_crash_fade_out" );
}

aud_heli_crash_fade_in()
{
    _id_A5DE::_id_5CF6( "heli_crash_fade_out" );
}

aud_heli_field_pass()
{
    _id_A5DE::_id_5CF2( "heli_field_pass_mix" );
}

aud_barnyard_sequence()
{
    _id_A5DE::_id_5CF6( "heli_field_pass_mix" );
    _id_A5DE::_id_5CF2( "barnyard_seq_mix" );
}

aud_ac130_sequence()
{
    _id_A5DE::_id_5CF6( "barnyard_seq_mix" );
    _id_A5DE::_id_5CF2( "ac130_destruction_mix" );
}

aud_set_exterior_level_0()
{
    _id_A5E7::_id_1239( "exterior", "ambient_hunted_ext0", 0.8 );
    _id_A5E7::_id_1239( "tunnel", "ambient_hunted_ext0", 0.8 );
    _id_A5E7::_id_1239( "interior_wood_open", "ambient_hunted_ext0", 0.8 );
}

aud_set_exterior_level_1()
{
    _id_A5E7::_id_1239( "exterior", "ambient_hunted_ext1", 0.8 );
    _id_A5E7::_id_1239( "tunnel", "ambient_hunted_ext1", 0.8 );
    _id_A5E7::_id_1239( "interior_wood_open", "ambient_hunted_ext1", 0.8 );
}

aud_set_exterior_level_2()
{
    _id_A5E7::_id_1239( "exterior", "ambient_hunted_ext2", 0.8 );
    _id_A5E7::_id_1239( "tunnel", "ambient_hunted_ext2", 0.8 );
    _id_A5E7::_id_1239( "interior_wood_open", "ambient_hunted_ext2", 0.8 );
}

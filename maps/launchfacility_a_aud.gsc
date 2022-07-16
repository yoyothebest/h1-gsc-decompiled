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
    thread flying_intro_start();
}

_id_2110()
{
    _id_A5DC::_id_7EC8( "shg" );
    _id_A5F7::_id_8757( "med_occlusion" );
    _id_A5DE::_id_5CF2( "mix_launchfacility_a_global" );
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
    _id_A5E8::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    _id_A5E8::_id_874D( "start_container_checkpoint", ::start_container_checkpoint );
    _id_A5E8::_id_874D( "start_tarmac_checkpoint", ::start_tarmac_checkpoint );
    _id_A5E8::_id_874D( "start_gate_checkpoint", ::start_gate_checkpoint );
    _id_A5E8::_id_874D( "start_vents_checkpoint", ::start_vents_checkpoint );
    _id_A5E8::_id_874D( "start_gimme_sitrep_music_mix", ::start_gimme_sitrep_music_mix );
    _id_A5E8::_id_874D( "start_blow_the_gate_mix", ::start_blow_the_gate_mix );
    _id_A5E8::_id_874D( "start_tarmac_mix", ::start_tarmac_mix );
    _id_A5E8::_id_874D( "start_vents_mix", ::start_vents_mix );
    _id_A5E8::_id_874D( "start_rappel_mix", ::start_rappel_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_container_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_tarmac_checkpoint( var_0 )
{
    _id_A5DE::_id_5CF2( "tarmac_mix" );
    _id_A5E7::_id_123A( "exterior" );
}

start_gate_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_vents_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

flying_intro_start()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "flying_intro_mute" );
    flying_intro_check_end();
}

flying_intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "flying_intro_mute", 1 );
    _id_A5E7::_id_123A( "exterior" );
}

start_gimme_sitrep_music_mix()
{
    _id_A5DE::_id_5CF2( "gimme_sitrep_music_mix" );
}

start_blow_the_gate_mix()
{
    _id_A5DE::_id_5CF6( "gimme_sitrep_music_mix" );
    _id_A5DE::_id_5CF2( "blow_the_gate_mix" );
}

start_tarmac_mix()
{
    _id_A5DE::_id_5CF6( "blow_the_gate_mix" );
    _id_A5DE::_id_5CF2( "tarmac_mix" );
}

start_vents_mix()
{
    _id_A5DE::_id_5CF6( "tarmac_mix" );
    _id_A5DE::_id_5CF2( "vents_mix" );
}

start_rappel_mix()
{
    _id_A5DE::_id_5CF6( "vents_mix" );
    _id_A5DE::_id_5CF2( "rappel_mix" );
}

bmp_start_moving()
{
    thread common_scripts\utility::_id_8EA1( "bmp_idle_low" );
    thread common_scripts\utility::_id_6975( "bmp_engine_low", undefined, 0, 0.7 );
}

bmp_stop_moving()
{
    thread common_scripts\utility::_id_8EA1( "bmp_engine_low" );
    thread common_scripts\utility::_id_6975( "bmp_idle_low", undefined, 0.3, 0.7 );
}

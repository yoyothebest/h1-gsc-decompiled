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
    _id_A5DE::_id_5CF2( "mix_village_assault_global" );
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
    _id_A5E8::_id_874D( "start_town_checkpoint", ::start_town_checkpoint );
    _id_A5E8::_id_874D( "start_alasad_barn_checkpoint", ::start_alasad_barn_checkpoint );
    _id_A5E8::_id_874D( "start_alasad_house_checkpoint", ::start_alasad_house_checkpoint );
    _id_A5E8::_id_874D( "increase_ambient", ::increase_ambient );
    _id_A5E8::_id_874D( "settle_ambient", ::settle_ambient );
    _id_A5E8::_id_874D( "start_air_support_mix", ::start_air_support_mix );
    _id_A5E8::_id_874D( "stop_air_support_mix", ::stop_air_support_mix );
    _id_A5E8::_id_874D( "start_interrogationA_black_screen_mix", ::start_interrogationa_black_screen_mix );
    _id_A5E8::_id_874D( "start_interrogation_mix", ::start_interrogation_mix );
    _id_A5E8::_id_874D( "start_interrogationA_mix", ::start_interrogationa_mix );
    _id_A5E8::_id_874D( "start_interrogationB_black_screen_mix", ::start_interrogationb_black_screen_mix );
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

start_town_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_alasad_barn_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_alasad_house_checkpoint( var_0 )
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
    _id_A5E7::_id_1239( "exterior", "ambient_village_assault_ext2", 0.8 );
    _id_A5E7::_id_1239( "trainstation_attic", "ambient_village_assault_ext2", 0.8 );
    _id_A5E7::_id_123A( "exterior" );
}

increase_ambient()
{
    _id_A5E7::_id_1239( "exterior", "ambient_village_assault_ext3", 0.8 );
    _id_A5E7::_id_1235( "exterior", "exterior3", 0.8 );
    _id_A5E7::_id_1239( "trainstation_attic", "ambient_village_assault_ext3", 0.8 );
    _id_A5E7::_id_1235( "trainstation_attic", "exterior3", 0.8 );
}

settle_ambient()
{
    _id_A5E7::_id_1239( "exterior", "ambient_village_assault_ext1", 0.8 );
    _id_A5E7::_id_1235( "exterior", "exterior1", 0.8 );
    _id_A5E7::_id_1239( "trainstation_attic", "ambient_village_assault_ext1", 0.8 );
    _id_A5E7::_id_1235( "trainstation_attic", "exterior1", 0.8 );
}

start_air_support_mix()
{
    _id_A5DE::_id_5CF2( "air_support_mix" );
}

stop_air_support_mix()
{
    _id_A5DE::_id_5CF6( "air_support_mix" );
}

start_interrogation_mix()
{
    _id_A5DE::_id_5CF2( "interrogation_mix" );
}

start_interrogationa_black_screen_mix()
{
    _id_A5DE::_id_5CF2( "interrogationA_black_screen_mix" );
}

start_interrogationa_mix()
{
    _id_A5DE::_id_5CF6( "interrogationA_black_screen_mix" );
    _id_A5DE::_id_5CF2( "interrogationA_mix" );
}

start_interrogationb_black_screen_mix()
{
    _id_A5DE::_id_5CF6( "interrogationA_mix" );
    _id_A5DE::_id_5CF2( "interrogationB_black_screen_mix" );
}

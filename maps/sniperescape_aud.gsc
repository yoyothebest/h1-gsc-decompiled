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
    _id_A5DE::_id_5CF2( "mix_sniperescape_global" );
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
    _id_A5E8::_id_874D( "start_rappel_checkpoint", ::start_rappel_checkpoint );
    _id_A5E8::_id_874D( "start_run_checkpoint", ::start_run_checkpoint );
    _id_A5E8::_id_874D( "start_apart_checkpoint", ::start_apart_checkpoint );
    _id_A5E8::_id_874D( "start_wounding_checkpoint", ::start_wounding_checkpoint );
    _id_A5E8::_id_874D( "start_crash_checkpoint", ::start_crash_checkpoint );
    _id_A5E8::_id_874D( "start_wounded_checkpoint", ::start_wounded_checkpoint );
    _id_A5E8::_id_874D( "start_burnt_checkpoint", ::start_burnt_checkpoint );
    _id_A5E8::_id_874D( "start_pool_checkpoint", ::start_pool_checkpoint );
    _id_A5E8::_id_874D( "start_fair_checkpoint", ::start_fair_checkpoint );
    _id_A5E8::_id_874D( "start_fair_battle_checkpoint", ::start_fair_battle_checkpoint );
    _id_A5E8::_id_874D( "start_seaknight_checkpoint", ::start_seaknight_checkpoint );
    _id_A5E8::_id_874D( "start_heli_block_sequence", ::start_heli_block_sequence );
    _id_A5E8::_id_874D( "start_heli_block_moves", ::start_heli_block_moves );
    _id_A5E8::_id_874D( "start_snipe_scoped_in_mix", ::start_snipe_scoped_in_mix );
    _id_A5E8::_id_874D( "escape_hotel_mix", ::escape_hotel_mix );
    _id_A5E8::_id_874D( "rappel_foley_mix", ::rappel_foley_mix );
    _id_A5E8::_id_874D( "havoc_appear_mix", ::havoc_appear_mix );
    _id_A5E8::_id_874D( "havoc_explode_mix", ::havoc_explode_mix );
    _id_A5E8::_id_874D( "havoc_crashed_mix", ::havoc_crashed_mix );
    _id_A5E8::_id_874D( "carrying_macmillan_mix", ::carrying_macmillan_mix );
    _id_A5E8::_id_874D( "clear_carrying_mix", ::clear_carrying_mix );
    _id_A5E8::_id_874D( "seaknight_rescue_submix", ::seaknight_rescue_submix );
    _id_A5E8::_id_874D( "seaknight_rescue_submix_fade_out", ::seaknight_rescue_submix_fade_out );
    _id_A5E8::_id_874D( "seaknight_rescue_submix_arrival", ::seaknight_rescue_submix_arrival );
    _id_A5E8::_id_874D( "seaknight_rescue_submix_waiting", ::seaknight_rescue_submix_waiting );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    _id_A5DE::_id_5CF2( "snipe_before_heli_mix" );
    _id_A5E7::_id_123A( "interior_snipe_building" );
}

start_rappel_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_run_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_apart_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_wounding_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
}

start_crash_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_wounded_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_burnt_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_pool_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "shower_room" );
}

start_fair_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_fair_battle_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_seaknight_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_snipe_scoped_in_mix()
{
    _id_A5DE::_id_5CF6( "snipe_before_heli_mix" );
    _id_A5DE::_id_5CF2( "snipe_scoped_in_mix" );
}

start_heli_block_sequence()
{
    _id_A5DE::_id_5CF6( "snipe_scoped_in_mix" );
    _id_A5DE::_id_5CF2( "heli_block_mix" );
}

start_heli_block_moves()
{
    _id_A5DE::_id_5CF6( "heli_block_mix" );
}

escape_hotel_mix()
{
    _id_A5DE::_id_5CF6( "heli_block_mix" );
    _id_A5DE::_id_5CF2( "mix_hotel_escape" );
}

rappel_foley_mix()
{
    _id_A5DE::_id_5CF6( "mix_hotel_escape" );
    _id_A5DE::_id_5CF2( "mix_rappel_foley" );
    common_scripts\utility::_id_384A( "aa_heat" );
    _id_A5DE::_id_5CF6( "mix_rappel_foley" );
}

havoc_appear_mix()
{
    _id_A5DE::_id_5CF2( "mix_havoc_appear" );
}

havoc_explode_mix()
{
    _id_A5DE::_id_5CF6( "mix_havoc_appear" );
    _id_A5DE::_id_5CF2( "mix_havoc_explode" );
}

havoc_crashed_mix()
{
    _id_A5DE::_id_5CF6( "mix_havoc_explode" );
    _id_A5DE::_id_5CF2( "mix_havoc_crashed" );
}

carrying_macmillan_mix()
{
    _id_A5DE::_id_5CF6( "mix_havoc_crashed" );
    _id_A5DE::_id_5CF2( "mix_carrying_macmillan" );
}

clear_carrying_mix()
{
    _id_A5DE::_id_5CF6( "mix_carrying_macmillan" );
}

seaknight_rescue_submix_arrival()
{
    _id_A5DE::_id_5CF2( "mix_seaknight_arrive" );
}

seaknight_rescue_submix()
{
    _id_A5DE::_id_5CF6( "mix_seaknight_arrive" );
    _id_A5DE::_id_5CF2( "mix_seaknight_rescue" );
}

seaknight_rescue_submix_waiting()
{
    _id_A5DE::_id_5CF6( "mix_seaknight_rescue" );
    _id_A5DE::_id_5CF2( "mix_seaknight_rescue_waiting" );
}

seaknight_rescue_submix_fade_out()
{
    _id_A5DE::_id_5CF6( "mix_seaknight_rescue_waiting" );
    _id_A5DE::_id_5CF2( "mix_seaknight_rescue_fade" );
}

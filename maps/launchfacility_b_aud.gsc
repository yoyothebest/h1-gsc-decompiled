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
    _id_A5DE::_id_5CF2( "mix_launchfacility_b_global" );
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
    _id_A5E8::_id_874D( "start_warehouse_checkpoint", ::start_warehouse_checkpoint );
    _id_A5E8::_id_874D( "start_launchtubes_checkpoint", ::start_launchtubes_checkpoint );
    _id_A5E8::_id_874D( "start_vaultdoors_checkpoint", ::start_vaultdoors_checkpoint );
    _id_A5E8::_id_874D( "start_controlroom_checkpoint", ::start_controlroom_checkpoint );
    _id_A5E8::_id_874D( "start_escape_checkpoint", ::start_escape_checkpoint );
    _id_A5E8::_id_874D( "start_elevator_checkpoint", ::start_elevator_checkpoint );
    _id_A5E8::_id_874D( "start_hallway_combat_mix", ::hallway_fighting_mix );
    _id_A5E8::_id_874D( "start_missile_silo_mix", ::missile_silo_mix );
    _id_A5E8::_id_874D( "start_vault_doors_mix", ::vault_doors_mix );
    _id_A5E8::_id_874D( "start_control_room_mix", ::control_room_mix );
    _id_A5E8::_id_874D( "start_code_input_mix", ::code_input_mix );
    _id_A5E8::_id_874D( "start_escape_facility_mix", ::escape_facility_mix );
    _id_A5E8::_id_874D( "start_missile_stopped_mix", ::missile_stopped_mix );
    _id_A5E8::_id_874D( "mission_failed", ::mission_failed );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "silo" );
}

start_warehouse_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
}

start_launchtubes_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
}

start_vaultdoors_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
}

start_controlroom_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
}

start_escape_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "computer_room" );
}

start_elevator_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "medium_room" );
}

hallway_fighting_mix()
{
    _id_A5DE::_id_5CF2( "hallway_fighting_mix" );
}

missile_silo_mix()
{
    _id_A5DE::_id_5CF6( "hallway_fighting_mix" );
    _id_A5DE::_id_5CF2( "missile_silo_mix" );
}

vault_doors_mix()
{
    _id_A5DE::_id_5CF6( "missile_silo_mix" );
    _id_A5DE::_id_5CF2( "vault_doors_mix" );
}

control_room_mix()
{
    _id_A5DE::_id_5CF6( "vault_doors_mix" );
    _id_A5DE::_id_5CF2( "control_room_mix" );
}

code_input_mix()
{
    _id_A5DE::_id_5CF6( "control_room_mix" );
    _id_A5DE::_id_5CF2( "code_input_mix" );
}

missile_stopped_mix()
{
    _id_A5DE::_id_5CF6( "code_input_mix" );
    _id_A5DE::_id_5CF2( "missile_stopped_mix" );
}

escape_facility_mix()
{
    _id_A5DE::_id_5CF6( "missile_stopped_mix" );
    _id_A5DE::_id_5CF2( "escape_facility_mix" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "launch_fb_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    _id_A5DE::_id_5CF6( "launch_fb_intro_mute" );
}

mission_failed()
{
    _id_A5DE::_id_5CF2( "failure_mix" );
}

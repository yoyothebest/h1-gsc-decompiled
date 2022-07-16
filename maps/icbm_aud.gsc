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
    _id_A5DE::_id_5CF2( "mix_icbm_global" );
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
    _id_A5E8::_id_874D( "start_landed_checkpoint", ::start_landed_checkpoint );
    _id_A5E8::_id_874D( "start_basement_checkpoint", ::start_basement_checkpoint );
    _id_A5E8::_id_874D( "start_house2_checkpoint", ::start_house2_checkpoint );
    _id_A5E8::_id_874D( "start_rescued_checkpoint", ::start_rescued_checkpoint );
    _id_A5E8::_id_874D( "start_tower_checkpoint", ::start_tower_checkpoint );
    _id_A5E8::_id_874D( "start_fense_checkpoint", ::start_fense_checkpoint );
    _id_A5E8::_id_874D( "start_base_checkpoint", ::start_base_checkpoint );
    _id_A5E8::_id_874D( "start_base2_checkpoint", ::start_base2_checkpoint );
    _id_A5E8::_id_874D( "start_launch_checkpoint", ::start_launch_checkpoint );
    _id_A5E8::_id_874D( "aud_open_fisrt_door", ::aud_open_fisrt_door );
    _id_A5E8::_id_874D( "first_house_mix", ::first_house_mix );
    _id_A5E8::_id_874D( "start_tower_first_choppers_fly_by", ::start_tower_first_choppers_fly_by );
    _id_A5E8::_id_874D( "start_missile_launch_mix", ::start_missile_launch_mix );
    _id_A5E8::_id_874D( "aud_start_bm21_scripted_sfx", ::aud_start_bm21_scripted_sfx );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    disable_azm_trigger_open_door_first_house();
    _id_A5E7::_id_123A( "exterior_wood" );
}

start_landed_checkpoint( var_0 )
{
    disable_azm_trigger_open_door_first_house();
    _id_A5E7::_id_123A( "exterior_wood" );
}

start_basement_checkpoint( var_0 )
{
    disable_azm_trigger_open_door_first_house();
    _id_A5E7::_id_123A( "exterior_wood" );
}

start_house2_checkpoint( var_0 )
{
    aud_open_fisrt_door();
    _id_A5E7::_id_123A( "exterior_wood" );
}

start_rescued_checkpoint( var_0 )
{
    aud_open_fisrt_door();
    _id_A5E7::_id_123A( "exterior_wood" );
}

start_tower_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "field" );
}

start_fense_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "field" );
}

start_base_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior_wood" );
}

start_base2_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "warehouse" );
}

start_launch_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior_wood_end" );
}

aud_open_fisrt_door()
{
    if ( isdefined( level._id_0E57.door_first_house_trigger ) )
    {
        wait 1.5;
        level._id_0E57.door_first_house_trigger common_scripts\utility::_id_97CE();
    }

    var_0 = getent( "first_door_ambient_emitter_01", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "emt_icbm_ambient_door_transition" );
    var_1 = getent( "footstep_amb_emitter_02", "targetname" );
    var_1 thread common_scripts\utility::_id_6975( "emt_overhead_footsteps" );
    _id_A5DE::_id_5CF6( "mix_first_house_search" );
    _id_A5DE::_id_5CF2( "mix_rescue_griggs" );
    common_scripts\utility::_id_3852( "breach_started", "player_shooting_interogators" );
    var_1 thread common_scripts\utility::_id_8EA1( "emt_overhead_footsteps" );
}

first_house_mix()
{
    var_0 = getent( "footstep_amb_emitter_01", "targetname" );
    var_0 thread common_scripts\utility::_id_6975( "emt_overhead_footsteps" );
    _id_A5DE::_id_5CF2( "mix_first_house_search" );
    common_scripts\utility::_id_3852( "house1_cleared", "_stealth_spotted" );
    var_0 thread common_scripts\utility::_id_8EA1( "emt_overhead_footsteps" );
}

start_missile_launch_mix()
{
    _id_A5DE::_id_5CF6( "mix_tower_destruction" );
    _id_A5DE::_id_5CF2( "missile_launch_mix" );
    common_scripts\utility::_id_384A( "launch_01" );
    _id_A5DE::_id_5CF6( "missile_launch_mix" );
}

start_tower_first_choppers_fly_by()
{
    _id_A5DE::_id_5CF6( "mix_rescue_griggs" );
    _id_A5DE::_id_5CF2( "mix_tower_destruction" );
}

start_first_truck_audio()
{
    self _meth_8287();
    self _meth_809C( "scn_icbm_first_jeep_scripted_sequence" );
    uaz_monitor_death();
}

handle_first_truck_stop()
{
    thread common_scripts\utility::_id_6975( "veh_uaz_idle_low", undefined, 0.5, 0.2 );
}

uaz_monitor_death()
{
    self waittill( "death" );
    self _meth_80AD( "veh_uaz_idle_low" );
    self _meth_80AE();
}

aud_start_bm21_scripted_sfx()
{
    var_0 = _func_1EC( "auto2648", "targetname" );
    var_1 = _func_1EC( "auto2649", "targetname" );
    var_0 thread handle_start_vehicle( "h1_scn_icbm_bm21_01_arrival", 7.1 );
    var_1 thread handle_start_vehicle( "h1_scn_icbm_bm21_02_arrival", 11.7 );
}

handle_start_vehicle( var_0, var_1 )
{
    self waittill( "trigger", var_2 );
    var_2 endon( "death" );
    var_2 _meth_8287();
    var_2 thread _id_A5A4::_id_69C6( var_0 );
    wait(var_1);
    var_2 _meth_8288();
}

disable_azm_trigger_open_door_first_house()
{
    level._id_0E57.door_first_house_trigger = getent( "flag_before_open_door_first_house", "script_noteworthy" );
    level._id_0E57.door_first_house_trigger common_scripts\utility::_id_97CC();
}

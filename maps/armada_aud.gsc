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
    _id_A5DE::_id_5CF2( "mix_armada_global" );
    _func_2D4( "vehicles", "solid", "glass" );
    _func_2D4( "battlechatter", "solid", "glass" );
    _func_2D4( "voices", "solid", "glass" );
    _func_2D4( "emitters", "solid", "glass" );
    _func_2D4( "weapons", "solid", "glass" );
    _func_2D4( "explosions", "solid", "glass" );
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
    _id_A5E8::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    _id_A5E8::_id_874D( "start_ride_checkpoint", ::start_ride_checkpoint );
    _id_A5E8::_id_874D( "start_landed_checkpoint", ::start_landed_checkpoint );
    _id_A5E8::_id_874D( "start_hq2tv_checkpoint", ::start_hq2tv_checkpoint );
    _id_A5E8::_id_874D( "start_intel_checkpoint", ::start_intel_checkpoint );
    _id_A5E8::_id_874D( "start_tv_checkpoint", ::start_tv_checkpoint );
    _id_A5E8::_id_874D( "start_tank_checkpoint", ::start_tank_checkpoint );
    _id_A5E8::_id_874D( "start_end_checkpoint", ::start_end_checkpoint );
    _id_A5E8::_id_874D( "stop_inside_blackhawk_mix", ::stop_inside_blackhawk_mix );
    _id_A5E8::_id_874D( "stop_intro_mix", ::stop_intro_mix );
    _id_A5E8::_id_874D( "set_ambiance_level_01", ::set_ambiance_level_01 );
    _id_A5E8::_id_874D( "set_ambiance_level_03", ::set_ambiance_level_03 );
    _id_A5E8::_id_874D( "start_last_mig29_mix", ::start_last_mig29_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{
    set_ambiance_level_00();
    _id_A5E7::_id_123A( "inside_blackhawk" );
    _id_A5DE::_id_5CF2( "Intro_mix" );
}

start_ride_checkpoint( var_0 )
{
    set_ambiance_level_00();
    _id_A5E7::_id_123A( "inside_blackhawk" );
    _id_A5DE::_id_5CF2( "Intro_mix" );
}

start_landed_checkpoint( var_0 )
{
    set_ambiance_level_00();
    _id_A5E7::_id_123A( "exterior" );
}

start_hq2tv_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "bunker" );
}

start_intel_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "bunker" );
}

start_tv_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

start_tank_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
}

start_end_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_before_studio" );
}

stop_intro_mix()
{
    wait 1.0;
    _id_A5DE::_id_5CF6( "Intro_mix" );
}

stop_inside_blackhawk_mix()
{
    _id_A5E7::_id_123A( "exterior" );
}

set_ambiance_level_00()
{
    _id_A5E7::_id_1239( "exterior", "ambient_armada_ext0", 0.05 );
    _id_A5E7::_id_1239( "inside_blackhawk", "ambient_armada_ext0", 0.05 );
    _id_A5E7::_id_1235( "exterior", "exterior", 0.05 );
    _id_A5E7::_id_1235( "inside_blackhawk", "exterior", 0.05 );
}

set_ambiance_level_01()
{
    _id_A5E7::_id_1239( "exterior", "ambient_armada_ext1", 0.8 );
    _id_A5E7::_id_1239( "inside_blackhawk", "ambient_armada_ext1", 0.8 );
    _id_A5E7::_id_1235( "exterior", "exterior1", 0.05 );
    _id_A5E7::_id_1235( "inside_blackhawk", "exterior1", 0.05 );
}

set_ambiance_level_03()
{
    _id_A5E7::_id_1239( "exterior", "ambient_armada_ext3", 0.8 );
    _id_A5E7::_id_1239( "inside_blackhawk", "ambient_armada_ext3", 0.8 );
    _id_A5E7::_id_1235( "exterior", "exterior3", 0.05 );
    _id_A5E7::_id_1235( "inside_blackhawk", "exterior3", 0.05 );
    _id_A5E7::_id_1236( "exterior", "exterior_parking", 1.2 );
}

start_last_mig29_mix()
{
    _id_A5DE::_id_5CF2( "last_mig29_mix" );
    wait 5.0;
    _id_A5DE::_id_5CF6( "last_mig29_mix" );
}

play_technical_scripted_sfx_sequence()
{
    var_0 = getentarray( "script_vehicle_pickup_technical", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2._id_7B1A == 5 )
            var_2._id_799F = 1;
    }

    var_4 = _func_1EC( "auto2665", "targetname" );
    var_4 thread play_scripted_technical_sfx( "scn_armada_jeep_scripted_track" );
    var_5 = _func_1EC( "auto2711", "targetname" );
    var_5 thread play_scripted_technical_sfx( "scn_armada_jeep_scripted_track_02" );
    var_5 = _func_1EC( "auto2713", "targetname" );
    var_5 thread play_scripted_technical_sfx( "scn_armada_jeep_scripted_track_03" );
}

play_scripted_technical_sfx( var_0 )
{
    self waittill( "trigger", var_1 );
    var_1 _meth_809C( var_0 );
    var_1 common_scripts\utility::_id_A087( "driver dead", "death" );
    var_1 _meth_80AE();
}

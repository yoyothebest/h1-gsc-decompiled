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
    _id_A5DE::_id_5CF2( "mix_ambush_global" );
}

_id_4D5B()
{
    _func_2D4( "emitters", "solid", "glass" );
    _func_2D4( "vehicles", "solid", "glass" );
    _func_2D4( "battlechatter", "solid", "glass" );
    _func_2D4( "voices", "solid", "glass" );
    _func_2D4( "weapons", "solid", "glass" );
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
    _id_A5E8::_id_874D( "start_default_checkpoint", ::start_default_checkpoint );
    _id_A5E8::_id_874D( "start_ambush_checkpoint", ::start_ambush_checkpoint );
    _id_A5E8::_id_874D( "start_village_checkpoint", ::start_village_checkpoint );
    _id_A5E8::_id_874D( "start_morpheus_checkpoint", ::start_morpheus_checkpoint );
    _id_A5E8::_id_874D( "start_apartment_checkpoint", ::start_apartment_checkpoint );
    _id_A5E8::_id_874D( "aud_stop_mix_stealth_ambush", ::aud_stop_mix_stealth_ambush );
    _id_A5E8::_id_874D( "aud_start_mix_fade_to_black", ::aud_start_mix_fade_to_black );
    _id_A5E8::_id_874D( "aud_stop_mix_fade_to_black", ::aud_stop_mix_fade_to_black );
    _id_A5E8::_id_874D( "aud_start_mix_ambush", ::aud_start_mix_ambush );
    _id_A5E8::_id_874D( "aud_start_mix_tower_crash", ::aud_start_mix_tower_crash );
    _id_A5E8::_id_874D( "aud_start_mix_tower_crash_stunned", ::aud_start_mix_tower_crash_stunned );
    _id_A5E8::_id_874D( "aud_start_mix_zak_son_escape", ::aud_start_mix_zak_son_escape );
    _id_A5E8::_id_874D( "aud_start_mix_mission_failed", ::aud_start_mix_mission_failed );
    _id_A5E8::_id_874D( "aud_start_mix_heli_1st_turret", ::aud_start_mix_heli_1st_turret );
    _id_A5E8::_id_874D( "aud_stop_mix_heli_1st_turret", ::aud_stop_mix_heli_1st_turret );
    _id_A5E8::_id_874D( "aud_start_mix_heli_2nd_turret", ::aud_start_mix_heli_2nd_turret );
    _id_A5E8::_id_874D( "aud_stop_mix_heli_2nd_turret", ::aud_stop_mix_heli_2nd_turret );
    _id_A5E8::_id_874D( "aud_start_mix_drop_bloody_gun", ::aud_start_mix_drop_bloody_gun );
    _id_A5E8::_id_874D( "aud_start_mix_suicide_slowmo", ::aud_start_mix_suicide_slowmo );
    _id_A5E8::_id_874D( "aud_start_mix_ending", ::aud_start_mix_ending );
    _id_A5E8::_id_874D( "aud_start_ambience_morning", ::aud_start_ambience_morning );
    _id_A5E8::_id_874D( "aud_start_ambience_war", ::aud_start_ambience_war );
    _id_A5E8::_id_874D( "aud_russian_battle_chatter", ::aud_russian_battle_chatter );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_default_checkpoint( var_0 )
{

}

start_ambush_checkpoint( var_0 )
{
    aud_start_ambience_morning();
}

start_village_checkpoint( var_0 )
{
    aud_start_ambience_morning();
    _id_A5DE::_id_5CF2( "mix_zak_son_escape" );
}

start_morpheus_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
    aud_start_ambience_war();
    _id_A5DE::_id_5CF2( "mix_zak_son_escape" );
}

start_apartment_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
    aud_start_ambience_war();
    _id_A5DE::_id_5CF2( "mix_zak_son_escape" );
}

_id_4F77()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "ambush_intro_mute" );
    intro_check_end();
}

intro_check_end()
{
    common_scripts\utility::_id_384A( "introscreen_remove_submix" );
    _id_A5DE::_id_5CF6( "ambush_intro_mute" );
    _id_A5DE::_id_5CF2( "mix_stealth" );
    _id_A5E7::_id_123A( "junkyard" );
}

aud_stop_mix_stealth_ambush()
{
    _id_A5DE::_id_5CF6( "mix_stealth" );
    _id_A5DE::_id_5CF2( "mix_takeover" );
}

aud_start_mix_fade_to_black()
{
    _id_A5DE::_id_5CF6( "mix_takeover" );
    _id_A5DE::_id_5CF2( "mix_fade_to_black" );
}

aud_stop_mix_fade_to_black()
{
    _id_A5DE::_id_5CF6( "mix_fade_to_black" );
}

aud_start_mix_ambush()
{
    _id_A5DE::_id_5CF2( "mix_ambush" );
}

aud_start_mix_tower_crash()
{
    _id_A5DE::_id_5CF6( "mix_ambush" );
    _id_A5DE::_id_5CF2( "mix_tower_crash" );
}

aud_start_mix_tower_crash_stunned()
{
    _id_A5DE::_id_5CF6( "mix_tower_crash" );
    _id_A5DE::_id_5CF2( "mix_tower_crash_stunned" );
    _id_A5F7::_id_86DB( "tower_crashed_stunned_filter", 0.5 );
}

aud_start_mix_zak_son_escape()
{
    _id_A5F7::_id_86DC( 0.5 );
    _id_A5DE::_id_5CF6( "mix_tower_crash_stunned" );
    _id_A5DE::_id_5CF2( "mix_zak_son_escape" );
}

aud_start_mix_mission_failed()
{
    _id_A5DE::_id_5CF2( "mix_mission_failed" );
}

aud_start_mix_heli_1st_turret()
{
    _id_A5DE::_id_5CF2( "mix_heli_1st_turret" );
}

aud_stop_mix_heli_1st_turret()
{
    _id_A5DE::_id_5CF6( "mix_heli_1st_turret" );
}

aud_start_mix_heli_2nd_turret()
{
    _id_A5DE::_id_5CF2( "mix_heli_2nd_turret" );
}

aud_stop_mix_heli_2nd_turret()
{
    _id_A5DE::_id_5CF6( "mix_heli_2nd_turret" );
}

aud_start_mix_drop_bloody_gun()
{
    _id_A5DE::_id_5CF6( "mix_zak_son_escape" );
    _id_A5DE::_id_5CF2( "mix_drop_bloody_gun" );
}

aud_start_mix_suicide_slowmo()
{
    _id_A5DE::_id_5CF6( "mix_drop_bloody_gun" );
    _id_A5DE::_id_5CF2( "mix_suicide_slowmo" );
    _id_A5E7::_id_1233( 1 );
    level._id_0318 _meth_832B( "snd_enveffectsprio_level", "underwater", 1, 0.7, 0.5 );
}

aud_start_mix_ending()
{
    _id_A5DE::_id_5CF6( "mix_suicide_slowmo" );
    _id_A5DE::_id_5CF2( "mix_ending" );
    level._id_0318 _meth_832C( "snd_enveffectsprio_level", 1 );
    _id_A5E7::_id_1233( 0 );
}

aud_start_ambience_morning()
{
    _id_A5E7::_id_123C( 0.5 );
    wait 0.5;
    _id_A5E7::_id_1235( "gas_station", "exterior_morning", 0.5 );
    _id_A5E7::_id_1239( "gas_station", "ambient_ambush_morning_ext", 0.5 );
    _id_A5E7::_id_123A( "gas_station" );
    _id_A5E7::_id_1235( "junkyard", "exterior_morning", 0.05 );
    _id_A5E7::_id_1239( "junkyard", "ambient_ambush_morning_ext", 0.05 );
    _id_A5E7::_id_1235( "interior_vehicle", "exterior_morning", 0.05 );
    _id_A5E7::_id_1239( "interior_vehicle", "ambient_ambush_morning_ext", 0.05 );
    _id_A5E7::_id_1235( "interior_stone_open", "exterior_morning", 0.05 );
    _id_A5E7::_id_1239( "interior_stone_open", "ambient_ambush_int", 0.05 );
}

aud_start_ambience_war()
{
    _id_A5E7::_id_123C();
    _id_A5E7::_id_1235( "interior_stone_open", "exterior_war", 0.05 );
    _id_A5E7::_id_1239( "interior_stone_open", "ambient_ambush_int", 0.05 );
}

aud_russian_battle_chatter()
{
    var_0 = getent( "battlechatter_node", "targetname" );
    wait 0.5;
    thread common_scripts\utility::_id_69C2( "ambush_ru_bchatter_threat", var_0._id_02E2 );
    var_1 = _func_0B5( 0.5, 1.5 );
    wait(var_1);
    thread common_scripts\utility::_id_69C2( "ambush_ru_bchatter_move", var_0._id_02E2 );
    var_1 = _func_0B5( 0.5, 1.5 );
    wait(var_1);
    thread common_scripts\utility::_id_69C2( "ambush_ru_bchatter_attack", var_0._id_02E2 );
}

aud_start_ambush_heli_scripted_sequence( var_0 )
{
    _id_A5DE::_id_5CF2( "mix_ambush_heli" );
    _id_A5A4::_id_69C4( "scn_ambush_convoy_heli_reveal" );
    var_0 thread monitor_end_node_reached();
    common_scripts\utility::_id_A069( "end_node_reached" );
    wait 2;
    _id_A5DE::_id_5CF6( "mix_ambush_heli" );
    wait 2;
    self _meth_854D( "scn_ambush_convoy_heli_reveal" );
}

aud_vehicle_engine_linear( var_0, var_1, var_2 )
{
    var_3 = _id_A5A4::_id_3F83( var_1, "script_noteworthy" );
    thread _id_A5A4::_id_69C4( var_0 );
    var_3 waittill( "trigger", var_4 );
    var_4 endon( "death" );
    var_4 _id_A5A4::_id_69C4( var_2 );
}

monitor_end_node_reached()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "death" );
    var_0 notify( "end_node_reached" );
}

snd_heli_missile_shoot( var_0, var_1 )
{
    var_0 thread _id_A5A4::_id_69C4( "scn_ambush_heli_missile_shoot" );
    var_1 thread common_scripts\utility::_id_6975( "scn_ambush_heli_missile_lp" );
}

aud_dog_sequence()
{
    self waittill( "trigger", var_0 );
    var_0 _meth_809C( "scn_ambush_junkyard_dog_atk" );
    var_0 waittill( "death" );
    var_0 _meth_854D( "scn_ambush_junkyard_dog_atk" );
}

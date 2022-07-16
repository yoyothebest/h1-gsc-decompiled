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
    _id_A5DE::_id_5CF2( "mix_bog_a_global" );
}

_id_4D5B()
{

}

_id_4CF4()
{
    level._id_0E57.bog_faked_ambience_ent = getent( "amb_damb_bog_01", "targetname" );
}

_id_5625()
{
    common_scripts\utility::_id_0D13( getentarray( "trigger_sound_emitter", "script_noteworthy" ), ::trigger_sound_emitter );
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
    _id_A5E8::_id_874D( "start_ambush_checkpoint", ::start_ambush_checkpoint );
    _id_A5E8::_id_874D( "start_melee_checkpoint", ::start_melee_checkpoint );
    _id_A5E8::_id_874D( "start_breach_checkpoint", ::start_breach_checkpoint );
    _id_A5E8::_id_874D( "start_alley_checkpoint", ::start_alley_checkpoint );
    _id_A5E8::_id_874D( "start_shanty_checkpoint", ::start_shanty_checkpoint );
    _id_A5E8::_id_874D( "start_bog_checkpoint", ::start_bog_checkpoint );
    _id_A5E8::_id_874D( "start_zpu_checkpoint", ::start_zpu_checkpoint );
    _id_A5E8::_id_874D( "start_cobra_checkpoint", ::start_cobra_checkpoint );
    _id_A5E8::_id_874D( "start_end_checkpoint", ::start_end_checkpoint );
    _id_A5E8::_id_874D( "play_intro_scripted_cobra_pass_by", ::play_intro_scripted_cobra_pass_by );
    _id_A5E8::_id_874D( "start_cobra_crash_sequence", ::start_cobra_crash_sequence );
    _id_A5E8::_id_874D( "stop_cobra_crash_sequence", ::stop_cobra_crash_sequence );
    _id_A5E8::_id_874D( "start_shanty_open_audio", ::start_shanty_open_audio );
    _id_A5E8::_id_874D( "start_cobra_support_mix", ::start_cobra_support_mix );
    _id_A5E8::_id_874D( "set_bog_ambience_to_bog_end_ext0", ::set_bog_ambience_to_bog_end_ext0 );
    _id_A5E8::_id_874D( "stop_cobra_support_mix", ::stop_cobra_support_mix );
    _id_A5E8::_id_874D( "start_ending_area_mix", ::start_ending_area_mix );
    _id_A5E8::_id_874D( "start_tank_mission_failure", ::start_tank_mission_failure );
    _id_A5E8::_id_874D( "start_end_black_screen_mix", ::start_end_black_screen_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

start_ambush_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
    start_gunfire_damb_first_war_zone();
    start_gunfire_damb_bog();
    start_distant_alarm_sfx();
}

start_melee_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
    start_gunfire_damb_first_war_zone();
    start_gunfire_damb_bog();
}

start_breach_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone_open" );
    start_gunfire_damb_first_war_zone();
    start_gunfire_damb_bog();
}

start_alley_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
    start_gunfire_damb_first_war_zone();
    start_gunfire_damb_bog();
}

start_shanty_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "interior_stone" );
    start_gunfire_damb_first_war_zone();
    start_gunfire_damb_bog();
}

start_bog_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "underpass" );
    start_bog_combat_emitter();
    start_gunfire_damb_bog();
}

start_zpu_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior_bog" );
    start_gunfire_damb_bog();
}

start_cobra_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior_bog" );
    start_gunfire_damb_bog();
}

start_end_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior_bog" );
}

play_intro_scripted_cobra_pass_by()
{
    var_0 = common_scripts\utility::_id_40FB( "auto9", "targetname" );
    var_1 = common_scripts\utility::_id_40FB( "auto3112", "targetname" );
    var_0 thread play_scripted_pass_by_sfx( "scn_intro_cobra_passby_01" );
    var_1 thread play_scripted_pass_by_sfx( "scn_intro_cobra_passby_02" );
}

start_cobra_crash_sequence()
{
    _id_A5DE::_id_5CF2( "cobra_crash_sequence" );
    level.alarm_ent common_scripts\utility::_id_8EA1( "emt_air_raid_alarm" );
}

stop_cobra_crash_sequence()
{
    _id_A5DE::_id_5CF6( "cobra_crash_sequence" );
}

start_cobra_support_mix()
{
    _id_A5DE::_id_5CF2( "cobra_support_mix" );
}

stop_cobra_support_mix()
{
    _id_A5DE::_id_5CF6( "cobra_support_mix" );
}

set_bog_ambience_to_bog_end_ext0()
{
    _id_A5E7::_id_1239( "exterior_bog", "ambient_bog_end_ext0", 4 );
}

start_shanty_open_audio()
{
    _id_A5DD::_id_25C4( "bog_gun_fire", "first_war_zone_gunfire", 0.8 );
    _id_A5E7::_id_1239( "exterior_javelin_square", "ambient_bog_ext0", 1.0 );
    start_bog_combat_emitter();
    thread play_chain_link_fence_sfx();
}

play_chain_link_fence_sfx()
{
    var_0 = getent( "trig_metal_fence_sfx", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        thread common_scripts\utility::_id_69C2( "scn_chainlink_fence_rattle", var_1._id_02E2 );

        while ( var_1 _meth_80AB( var_0 ) )
            wait 0.05;
    }
}

play_melee_custom_pistol_fire_sfx( var_0 )
{
    var_0 thread _id_A5A4::_id_69C5( "scn_melee_custom_pistol_fire", "tag_flash" );
}

play_scripted_pass_by_sfx( var_0 )
{
    self waittill( "trigger", var_1 );
    var_1 _meth_8287();
    var_1._id_799F = 1;
    var_1 _id_A5A4::_id_69C4( var_0 );
}

trigger_sound_emitter()
{
    if ( isdefined( self._id_7A99 ) && isdefined( self._id_04A4 ) )
    {
        self waittill( "trigger", var_0 );
        var_1 = getent( self._id_04A4, "targetname" );
        var_1 _id_A5A4::_id_69C4( self._id_7A99 );
    }
}

start_gunfire_damb_bog()
{
    _id_A5DD::_id_25C0( "bog_gun_fire", level._id_0E57.bog_faked_ambience_ent._id_02E2 );
}

start_gunfire_damb_first_war_zone()
{
    var_0 = getent( "amb_damb_first_warzone_01", "targetname" );
    _id_A5DD::_id_25C0( "bog_gun_fire", var_0._id_02E2, "first_war_zone_gunfire" );
}

start_bog_combat_emitter()
{
    level._id_0E57.bog_faked_ambience_ent thread common_scripts\utility::_id_6975( "emt_bog_a_bog_combat", undefined, 1.0, 5.0 );
    thread monitor_stop_bog_combat_emitter();
}

monitor_stop_bog_combat_emitter()
{
    var_0 = getent( "stop_combat_emitter_sfx", "targetname" );
    var_0 waittill( "trigger" );
    level._id_0E57.bog_faked_ambience_ent common_scripts\utility::_id_8EA1( "emt_bog_a_bog_combat" );
}

handle_cobra_waypoint_audio( var_0 )
{
    if ( isdefined( var_0._id_04A6 ) )
    {
        switch ( var_0._id_04A6 )
        {
            case "maverick_waypoint1":
                thread _id_A5A4::_id_69C4( "scn_cobra_support_arrival_01" );
                thread _id_A5A4::_id_6976( "h1r_bog_a_cobra_helicopter_wind", undefined, 1, 1 );
                break;
            case "cobra2_arrival_scripted_sfx":
                thread _id_A5A4::_id_69C4( "scn_cobra_support_arrival_02" );
                thread _id_A5A4::_id_6976( "h1r_bog_a_cobra_helicopter_wind", undefined, 1, 1 );
                break;
            case "cobra1_start_leaving_sfx":
                thread _id_A5A4::_id_69C4( "scn_cobra_support_leaving_01" );
                break;
            case "cobra2_start_leaving_sfx":
                thread _id_A5A4::_id_69C4( "scn_cobra_support_leaving_02" );
                break;
        }
    }
}

start_distant_alarm_sfx()
{
    level.alarm_ent = getent( "distant_alarm_sfx", "targetname" );
    level.alarm_ent thread common_scripts\utility::_id_6975( "emt_air_raid_alarm", undefined, 0, 20 );
}

start_ending_area_mix()
{
    _id_A5DE::_id_5CF2( "ending_area_mix" );
}

start_tank_mission_failure()
{
    _id_A5DE::_id_5CF2( "tank_mission_failure_mix" );
}

start_end_black_screen_mix()
{
    _id_A5DE::_id_5CF2( "end_black_screen_mix" );
}

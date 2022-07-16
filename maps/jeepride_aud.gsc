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
    _id_A5DE::_id_5CF2( "mix_jeepride_global" );
    level._id_0318 _meth_8344( 0 );
    _func_07E( "music", 0 );
    _func_07E( "foley", 0.2 );
}

_id_4D5B()
{

}

_id_4CF4()
{

}

_id_5625()
{
    thread jeepride_intro_start();
    thread start_scripted_sfx_node();
    thread monitor_end_chase_music();
    thread play_hind_first_arrival();
    thread play_hind_post_tanker_explosion();
    thread play_hind_open_tunnel_arrival();
    thread play_hind_last_tunnel_scripted_sfx();
    common_scripts\utility::_id_0D13( _func_1ED( "presideswipe", "script_noteworthy" ), ::presideswipe );
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
    _id_A5E8::_id_874D( "aud_start_checkpoint", ::aud_start_checkpoint );
    _id_A5E8::_id_874D( "aud_first_hind_checkpoint", ::aud_first_hind_checkpoint );
    _id_A5E8::_id_874D( "aud_against_traffic_checkpoint", ::aud_against_traffic_checkpoint );
    _id_A5E8::_id_874D( "aud_final_stretch_checkpoint", ::aud_final_stretch_checkpoint );
    _id_A5E8::_id_874D( "aud_bridge_explode_checkpoint", ::aud_bridge_explode_checkpoint );
    _id_A5E8::_id_874D( "aud_bridge_combat_checkpoint", ::aud_bridge_combat_checkpoint );
    _id_A5E8::_id_874D( "aud_bridge_zak_checkpoint", ::aud_bridge_zak_checkpoint );
    _id_A5E8::_id_874D( "aud_bridge_rescue_checkpoint", ::aud_bridge_rescue_checkpoint );
    _id_A5E8::_id_874D( "aud_nowhere_checkpoint", ::aud_nowhere_checkpoint );
    _id_A5E8::_id_874D( "remove_intro_mute", ::remove_intro_mute );
    _id_A5E8::_id_874D( "clear_whitescreen_mix", ::clear_whitescreen_mix );
    _id_A5E8::_id_874D( "start_bridge_collapse_mix", ::start_bridge_collapse_mix );
    _id_A5E8::_id_874D( "start_post_bridge_explosion", ::start_post_bridge_explosion );
    _id_A5E8::_id_874D( "stop_post_bridge_explosion", ::stop_post_bridge_explosion );
    _id_A5E8::_id_874D( "aud_start_slowmo_mix", ::aud_start_slowmo_mix );
    _id_A5E8::_id_874D( "start_hind_shoots_the_tanker_mix", ::start_hind_shoots_the_tanker_mix );
    _id_A5E8::_id_874D( "start_rescue_mix", ::start_rescue_mix );
    _id_A5E8::_id_874D( "start_last_whitescreen_mix", ::start_last_whitescreen_mix );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_start_checkpoint( var_0 )
{
    _id_A5DE::_id_5CF2( "jeep_ride_mix" );
    _id_A5E7::_id_1239( "exterior", undefined );
    _id_A5E7::_id_123A( "exterior" );
}

aud_first_hind_checkpoint( var_0 )
{
    _id_A5DE::_id_5CF2( "jeep_ride_mix" );
    _id_A5E7::_id_1239( "exterior", undefined );
    _id_A5E7::_id_123A( "exterior" );
}

aud_against_traffic_checkpoint( var_0 )
{
    _id_A5DE::_id_5CF2( "jeep_ride_mix" );
    _id_A5E7::_id_1239( "exterior", undefined );
    _id_A5E7::_id_123A( "exterior" );
}

aud_final_stretch_checkpoint( var_0 )
{
    _id_A5DE::_id_5CF2( "jeep_ride_mix" );
    _id_A5E7::_id_1239( "exterior", undefined );
    _id_A5E7::_id_123A( "exterior" );
}

aud_bridge_explode_checkpoint( var_0 )
{
    _id_A5E7::_id_1239( "exterior", undefined );
    _id_A5E7::_id_123A( "exterior" );
}

aud_bridge_combat_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_bridge_zak_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_bridge_rescue_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

aud_nowhere_checkpoint( var_0 )
{
    _id_A5E7::_id_123A( "exterior" );
}

remove_intro_mute()
{
    _id_A5DE::_id_5CF6( "jeepride_intro_mute" );
}

clear_whitescreen_mix()
{
    _id_A5DE::_id_5CF6( "whitescreen_mix" );
}

start_hind_shoots_the_tanker_mix()
{
    level._id_0318 _meth_809C( "scn_last_hind_flyby_boom" );
    _id_A5DE::_id_5CF2( "hind_shoots_the_tanker_mix" );
}

aud_start_slowmo_mix()
{
    _id_A5DE::_id_5CF6( "hind_shoots_the_tanker_mix" );
    _id_A5DE::_id_5CF2( "slow_motion_mix" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_player_tanker_explo_wake_up" );
}

start_rescue_mix()
{
    wait 0.5;
    _id_A5DE::_id_5CF6( "slow_motion_mix" );
    _id_A5DE::_id_5CF2( "rescue_mix" );
}

start_bridge_collapse_mix()
{
    _id_A5E7::_id_1239( "exterior", "ambient_jeepride_ext1", 0.1 );
    _id_A5DE::_id_5CF6( "bridge_uaz_crash_mix" );
    _id_A5DE::_id_5CF2( "bridge_collapsing_mix" );
    thread handle_bridge_collapse_mix();
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_bridge_collapse" );
}

handle_bridge_collapse_mix()
{
    var_0 = getent( "remove_bridge_collapse_mix", "targetname" );
    var_0 waittill( "trigger", var_1 );
    _id_A5DE::_id_5CF6( "bridge_collapsing_mix" );
}

start_post_bridge_explosion()
{
    _id_A5E7::_id_122C( 1 );
    _id_A5F7::_id_86DB( "post_bridge_exp_filter", 0.5 );
    level._id_0318 thread common_scripts\utility::_id_6975( "flashbang_tinnitus_loop", undefined, 0.5, 2 );
}

stop_post_bridge_explosion()
{
    _id_A5F7::_id_86DC( 4 );
    level._id_0318 common_scripts\utility::_id_8EA1( "flashbang_tinnitus_loop" );
    wait 4;
    _id_A5E7::_id_122C( 0 );
}

start_last_whitescreen_mix()
{
    wait 0.3;
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_last_whitescreen_stinger" );
    _id_A5DE::_id_5CF6( "rescue_mix" );
    _id_A5DE::_id_5CF2( "last_whitescreen_mix" );
}

jeepride_intro_start()
{
    common_scripts\utility::_id_384A( "introscreen_activate" );
    _id_A5DE::_id_5CF2( "jeepride_intro_mute" );
    _id_A5DE::_id_5CF2( "whitescreen_mix" );
}

start_scripted_sfx_node()
{
    var_0 = [ [ "auto1593", "scn_start_jeep_honk_crash", undefined, undefined, undefined ], [ "auto1585", "scn_start_car_honk_crash", undefined, undefined, undefined ], [ "sideswipe_bmp_accelerate_01", "scn_sideswipe_bmp_accelerate_01", undefined, "bmp_accelerate_mix", undefined ], [ "auto1721", "scn_bmp_accelerate_01", undefined, "bmp_accelerate_mix", undefined ], [ "auto1746", "scn_bmp_accelerate_02", undefined, undefined, "bmp_accelerate_mix" ], [ "auto63", undefined, undefined, "first_hind_mix", undefined ], [ "auto3651", undefined, undefined, "tanker_explode_mix", undefined ], [ "auto3740", undefined, undefined, undefined, "tanker_explode_mix" ], [ "auto72", undefined, undefined, "car_passby_mix", undefined ], [ "auto2379", undefined, undefined, undefined, "car_passby_mix" ], [ "auto2637", undefined, undefined, undefined, "first_hind_mix" ], [ "auto4115", "scn_uaz_convoy_arrival_01", undefined, undefined, undefined ], [ "auto4059", "scn_uaz_convoy_arrival_02", undefined, undefined, undefined ], [ "auto4088", "scn_uaz_convoy_arrival_03", undefined, undefined, undefined ] ];

    foreach ( var_2 in var_0 )
        thread handle_scripted_sfx_node( var_2 );
}

handle_scripted_sfx_node( var_0 )
{
    var_1 = _func_1EC( var_0[0], "targetname" );
    var_1 waittill( "trigger", var_2 );

    if ( isdefined( var_0[1] ) )
        var_2 _meth_809C( var_0[1] );

    if ( isdefined( var_0[2] ) )
        var_2 _meth_854D( var_0[2] );

    if ( isdefined( var_0[3] ) )
        _id_A5DE::_id_5CF2( var_0[3] );

    if ( isdefined( var_0[4] ) )
        _id_A5DE::_id_5CF6( var_0[4] );
}

presideswipe()
{
    self waittill( "trigger", var_0 );
    var_0 thread _id_A5A4::_id_69C4( "scn_jeepride_presideswipe" );
}

start_player_jeep_sfx()
{
    self _meth_8287();
    thread _id_A5A4::_id_6976( "scn_jeep_player_front", "tag_hood", 1, 1 );
    thread _id_A5A4::_id_6976( "scn_jeep_player_back", "tag_bumper_back", 1, 1 );
    thread _id_A5A4::_id_6976( "scn_jeep_player_center", "tag_body", 1, 1 );
}

stop_unimportant_vehicle()
{
    switch ( self.classname )
    {
        case "script_vehicle_luxurysedan":
        case "script_vehicle_tanker_truck_civ":
        case "script_vehicle_bus":
        case "vehicle_80s_hatch1_silv_destructible":
        case "script_vehicle_80s_wagon1_green_destructible":
        case "script_vehicle_80s_wagon1_tan_destructible":
        case "script_vehicle_pickup_4door":
        case "script_vehicle_pickup_roobars":
        case "script_vehicle_small_hatchback_turq":
        case "script_vehicle_small_wagon_white":
        case "script_vehicle_bm21_cover_destructible":
        case "script_vehicle_bm21_mobile_bed_destructible":
            self._id_799F = 1;
            self _meth_8287();
            break;
    }
}

passby_sfx()
{
    self endon( "death" );

    switch ( self._id_04FF )
    {
        case "hind":
        case "mi28":
        case "mi17":
        case "uaz":
            return;
    }

    while ( !vehicleisclose( self, level.playersride ) )
        wait 0.05;

    if ( _id_91D2( level.playersride, self ) )
        thread _id_A5A4::_id_69C4( passby_get_aliases() );
}

_id_91D2( var_0, var_1 )
{
    var_2 = anglestoforward( var_0.angles );
    var_3 = var_1._id_02E2 - var_0._id_02E2;
    var_4 = _func_0F6( var_2, var_3 );
    return var_4 > 0;
}

vehicleisclose( var_0, var_1 )
{
    if ( !_id_91D2( var_0, var_1 ) )
        return 0;

    var_2 = _func_0EE( var_0._id_02E2, var_1._id_02E2 );
    var_3 = 4800;

    if ( isdefined( var_0._id_04F9 ) && var_0._id_04F9 > 0 )
    {
        var_4 = var_0._id_04F9 * 63360 / 60 / 60;
        var_5 = level.playersride._id_04F9 * 63360 / 60 / 60;
        var_3 = var_4 * 2.3 + var_5 * 2.3;
    }

    return var_2 < var_3;
}

passby_get_aliases()
{
    switch ( self._id_04FF )
    {
        case "bmp":
        case "bm21_troops":
        case "van":
        case "tanker":
        case "bus":
            return "veh_van_passby";
        case "truck":
        case "80s_wagon1":
        case "small_wagon":
            return "veh_truck_passby";
        default:
            return "veh_car_passby";
    }
}

start_bridge_uaz_crash()
{
    _id_A5DE::_id_5CF6( "jeep_ride_mix" );
    _id_A5DE::_id_5CF2( "bridge_uaz_crash_mix" );
}

monitor_end_chase_music()
{
    var_0 = _func_1EC( "auto231", "targetname" );
    var_0 waittill( "trigger", var_1 );
    wait 2;
    common_scripts\utility::_id_383F( "music_chase_end" );
}

play_hind_first_arrival()
{
    var_0 = getent( "auto2140", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread _id_A5A4::_id_69C4( "scn_hind_first_appear" );
}

play_hind_post_tanker_explosion()
{
    var_0 = getent( "auto2498", "targetname" );
    var_0 waittill( "trigger", var_1 );
    var_1 thread _id_A5A4::_id_69C4( "scn_hind_post_tanker_explosion" );
}

play_hind_open_tunnel_arrival()
{
    var_0 = _func_1EC( "auto135", "targetname" );
    var_1 = var_0._id_7B1A;
    var_0 waittill( "trigger", var_2 );
    wait 0.1;
    var_2 play_scripted_sfx_on_vehicle_spawn( "scn_hind_open_tunnel_appear", "script_vehicle_mi24p_hind_woodland", var_1, 0.8 );
}

play_hind_last_tunnel_scripted_sfx()
{
    var_0 = _func_1EC( "auto174", "targetname" );
    var_1 = var_0._id_7B1A;
    var_0 waittill( "trigger", var_2 );
    wait 0.1;
    var_2 play_scripted_sfx_on_vehicle_spawn( "scn_hind_last_tunnel_appear", "script_vehicle_mi24p_hind_woodland", var_1 );
}

play_mi17_scripted_sequence()
{
    thread play_mi17_unload_ennemies( "auto4413", "auto4416", 1 );
    thread play_mi17_unload_ennemies( "auto5018", "auto5020", 2 );
}

play_bm21_unload_troops_sequence()
{
    var_0 = _func_1EC( "auto4032", "targetname" );
    var_1 = _func_1EC( "auto4038", "targetname" );
    var_0 waittill( "trigger", var_2 );
    var_2 _meth_8287();
    var_2._id_799F = 1;
    var_2 thread _id_A5A4::_id_69C6( "scn_bm21_unload_arrival_01" );
    var_1 waittill( "trigger", var_2 );
    var_2 thread common_scripts\utility::_id_6975( "bm21_idle_low", undefined, 0.5, 0.5 );
    var_2 waittill( "unloaded" );
    var_2 thread common_scripts\utility::_id_8EA1( "bm21_idle_low" );
    var_2 thread _id_A5A4::_id_69C6( "scn_bm21_unload_leaving_01" );
}

play_mi17_unload_ennemies( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );
    var_4 = getent( var_1, "targetname" );
    var_3 waittill( "trigger", var_5 );
    var_5 _meth_8287();
    var_5._id_799F = 1;
    var_5 thread _id_A5A4::_id_69C6( "scn_mi17_unload_arrival_0" + var_2 );
    var_4 waittill( "trigger", var_5 );
    var_5 thread common_scripts\utility::_id_6975( "mi17_close_towards_lp", undefined, 0.5, 0.5 );
    var_5 waittill( "unloaded" );
    var_5 thread common_scripts\utility::_id_8EA1( "mi17_close_towards_lp" );
    var_5 thread _id_A5A4::_id_69C6( "scn_mi17_unload_leaving_0" + var_2 );
}

play_last_hind_flyby()
{
    wait 0.1;
    play_scripted_sfx_on_vehicle_spawn( "scn_last_hind_flyby", "script_vehicle_mi24p_hind_woodland", 72 );
}

play_scripted_sfx_on_vehicle_spawn( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_A5A4::_id_4153();

    foreach ( var_6 in var_4 )
    {
        if ( var_6.classname == var_1 && isdefined( var_6._id_7B1A ) && var_6._id_7B1A == var_2 )
        {
            if ( isdefined( var_3 ) )
                wait(var_3);

            var_6 thread _id_A5A4::_id_69C6( var_0 );
            return;
        }
    }
}

play_zak_enemy_heli_sfx()
{
    wait 0.1;
    self._id_799F = 1;
    self _meth_8287();
    thread _id_A5A4::_id_69C6( "scn_zak_enemy_hind_arrival" );
}

play_zak_ally_heli_sfx()
{
    wait 0.1;
    thread _id_A5A4::_id_69C6( "scn_zak_ally_hind_arrival" );
}

crossroad_crash( var_0 )
{
    var_0 thread _id_A5A4::_id_69C5( "scn_bmp_ravine_flipcontact", "body_animate_jnt" );
}

truck_tanker_crash( var_0 )
{
    var_0 thread _id_A5A4::_id_69C5( "scn_tanker_truck_crash", "body_animate_jnt" );
}

tanker_tanker_crash( var_0 )
{
    var_0 thread _id_A5A4::_id_69C5( "scn_tanker_tanker_crash", "body_animate_jnt" );
}

tunnel_crash_truck01( var_0 )
{
    var_0 thread _id_A5A4::_id_69C5( "scn_bmp_front_tunnel_crash", "body_animate_jnt" );
}

tunnel_crash_truck02( var_0 )
{
    _id_A5DE::_id_5CF6( "bmp_accelerate_mix" );
    var_0 thread _id_A5A4::_id_69C5( "scn_bmp_first_tunnel_crash_01", "body_animate_jnt" );
    var_0 _meth_854D( "scn_sideswipe_bmp_accelerate_01" );
}

play_bridge_collapse_sfx( var_0, var_1 )
{
    var_0 thread _id_A5A4::_id_69C5( "scn_bridge_collapse_" + var_1, "j_chunk_" + var_1 );
}

play_anim_vehicle_explosion_sfx( var_0, var_1 )
{
    var_0 thread _id_A5A4::_id_69C5( var_1, "body_animate_jnt" );
}

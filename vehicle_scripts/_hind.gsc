// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2, var_3 )
{
    _id_A5A8::_id_186C( "hind", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_mi24p_hind_desert" );
    _id_A5A8::_id_1845( "vehicle_mi24p_hind_woodland" );
    _id_A5A8::_id_1845( "vehicle_mi24p_hind_woodland_opened_door" );
    var_4 = [];
    var_4["vehicle_mi24p_hind_desert"] = "fx/explosions/helicopter_explosion_hind_desert";
    var_4["vehicle_mi24p_hind_woodland"] = "fx/explosions/helicopter_explosion_hind_woodland";
    var_4["vehicle_mi24p_hind_woodland_opened_door"] = "fx/explosions/helicopter_explosion_hind_woodland";
    var_4["vehicle_mi24p_hind_chernobyl"] = "fx/explosions/helicopter_explosion_hind_woodland";
    _id_A5A8::_id_1849( %bh_rotors, undefined, 0 );
    _id_A5A8::_id_1842( "fx/explosions/grenadeexp_default", "tag_engine_left", "hind_helicopter_hit", undefined, undefined, undefined, 0.2, 1, undefined );
    _id_A5A8::_id_1842( "fx/explosions/grenadeexp_default", "tail_rotor_jnt", "hind_helicopter_secondary_exp", undefined, undefined, undefined, 0.5, 1, undefined );
    _id_A5A8::_id_1842( "fx/fire/fire_smoke_trail_L", "tail_rotor_jnt", "hind_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1, undefined );
    _id_A5A8::_id_1842( "fx/explosions/aerial_explosion", "tag_engine_right", "hind_helicopter_secondary_exp", undefined, undefined, undefined, 2.5, 1, undefined );
    _id_A5A8::_id_1842( "fx/explosions/aerial_explosion", "tag_deathfx", "hind_helicopter_secondary_exp", undefined, undefined, undefined, 4.0, undefined, undefined );
    _id_A5A8::_id_1842( var_4[var_0], undefined, "hind_helicopter_crash", undefined, undefined, undefined, -1, undefined, "stop_crash_loop_sound" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "axis" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_183B( ::_id_7DDA );
    _id_A5A8::_id_1873( ::_id_9A3D );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cargo01", "tag_light_cargo01", "fx/misc/aircraft_light_cockpit_red", "interior", 0.0 );
    _id_A5A8::_id_1857( var_2, "cockpit_blue_cockpit01", "tag_light_cockpit01", "fx/misc/aircraft_light_cockpit_blue", "interior", 0.1 );
    _id_A5A8::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_white_blink", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.3 );
    _id_A5A8::_id_1857( var_2, "wingtip_green", "tag_light_L_wing", "fx/misc/aircraft_light_wingtip_green", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "wingtip_red", "tag_light_R_wing", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    _id_A5A8::_id_1855();
}

_id_4D10()
{
    self._id_65A7 = 144;
    self._id_367F = 792;
    self._id_7957 = 0;
    _id_A5A8::_id_9D02( "running" );
    _id_4521();
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 144000000;
    vehicle_scripts\_hind_aud::snd_init_hind();
    thread _id_5D80();

    for (;;)
    {
        if ( !isdefined( self._id_799F ) || !self._id_799F )
        {
            var_2 = _func_0F0( self._id_02E2, level._id_0318._id_02E2 );

            if ( var_0 && var_2 > var_1 )
            {
                vehicle_scripts\_hind_aud::snd_stop_hind( 1.0 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_2 <= var_1 )
            {
                vehicle_scripts\_hind_aud::snd_start_hind();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_hind_aud::snd_stop_hind( 1.0 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    vehicle_scripts\_hind_aud::snd_stop_hind( 1.0 );
}

_id_7EFA( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_9CD5 = %bh_idle;

    return var_0;
}
#using_animtree("fastrope");

_id_7FE3( var_0 )
{
    var_0[3]._id_6B52 = %bh_player_idle;
    var_0[3]._id_6B28 = "fastrope_start_plr";
    var_0[3]._id_6B2A = "fastrope_loop_plr";
    var_0[3]._id_6B29 = "fastrope_end_plr";
    var_0[3]._id_6B27 = %bh_player_drop;
    var_0[3].player_animtree = #animtree;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 9; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_4B63[0] = %helicopter_pilot1_idle;
    var_0[0]._id_4B63[1] = %helicopter_pilot1_twitch_clickpannel;
    var_0[0]._id_4B63[2] = %helicopter_pilot1_twitch_lookback;
    var_0[0]._id_4B63[3] = %helicopter_pilot1_twitch_lookoutside;
    var_0[0]._id_4B7E[0] = 500;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0]._id_4B7E[2] = 100;
    var_0[0]._id_4B7E[3] = 100;
    var_0[1]._id_4B63[0] = %helicopter_pilot2_idle;
    var_0[1]._id_4B63[1] = %helicopter_pilot2_twitch_clickpannel;
    var_0[1]._id_4B63[2] = %helicopter_pilot2_twitch_lookoutside;
    var_0[1]._id_4B63[3] = %helicopter_pilot2_twitch_radio;
    var_0[1]._id_4B7E[0] = 450;
    var_0[1]._id_4B7E[1] = 100;
    var_0[1]._id_4B7E[2] = 100;
    var_0[1]._id_4B7E[3] = 100;
    var_0[0]._id_1433 = 0;
    var_0[1]._id_1433 = 0;
    var_0[2]._id_4B63 = %bh_1_idle;
    var_0[3]._id_4B63 = %bh_2_idle;
    var_0[4]._id_4B63 = %bh_4_idle;
    var_0[5]._id_4B63 = %bh_5_idle;
    var_0[6]._id_4B63 = %bh_8_idle;
    var_0[7]._id_4B63 = %bh_6_idle;
    var_0[8]._id_4B63 = %bh_7_idle;
    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[2]._id_85AE = "tag_detach";
    var_0[3]._id_85AE = "tag_detach";
    var_0[4]._id_85AE = "tag_detach";
    var_0[5]._id_85AE = "tag_detach";
    var_0[6]._id_85AE = "tag_detach";
    var_0[7]._id_85AE = "tag_detach";
    var_0[8]._id_85AE = "tag_detach";
    var_0[2]._id_4068 = %bh_1_drop;
    var_0[3]._id_4068 = %bh_2_drop;
    var_0[4]._id_4068 = %bh_4_drop;
    var_0[5]._id_4068 = %bh_5_drop;
    var_0[6]._id_4068 = %bh_8_drop;
    var_0[7]._id_4068 = %bh_6_drop;
    var_0[8]._id_4068 = %bh_7_drop;
    var_0[2]._id_4076 = "crouch";
    var_0[3]._id_4076 = "crouch";
    var_0[4]._id_4076 = "crouch";
    var_0[5]._id_4076 = "crouch";
    var_0[6]._id_4076 = "crouch";
    var_0[7]._id_4076 = "crouch";
    var_0[8]._id_4076 = "crouch";
    var_0[2]._id_70DB = 1;
    var_0[3]._id_70DB = 1;
    var_0[4]._id_70DB = 1;
    var_0[5]._id_70DB = 1;
    var_0[6]._id_70DB = 1;
    var_0[7]._id_70DB = 1;
    var_0[8]._id_70DB = 1;
    var_0[2]._id_70DA = %fastrope_fall;
    var_0[3]._id_70DA = %fastrope_fall;
    var_0[4]._id_70DA = %fastrope_fall;
    var_0[5]._id_70DA = %fastrope_fall;
    var_0[6]._id_70DA = %fastrope_fall;
    var_0[7]._id_70DA = %fastrope_fall;
    var_0[8]._id_70DA = %fastrope_fall;
    var_0[1]._id_713F = 1;
    var_0[2]._id_713F = 1;
    var_0[3]._id_713F = 1;
    var_0[4]._id_713F = 1;
    var_0[5]._id_713F = 1;
    var_0[6]._id_713F = 1;
    var_0[7]._id_713F = 1;
    var_0[8]._id_713F = 1;
    var_0[2]._id_406F = "fastrope_loop_npc";
    var_0[3]._id_406F = "fastrope_loop_npc";
    var_0[4]._id_406F = "fastrope_loop_npc";
    var_0[5]._id_406F = "fastrope_loop_npc";
    var_0[6]._id_406F = "fastrope_loop_npc";
    var_0[7]._id_406F = "fastrope_loop_npc";
    var_0[8]._id_406F = "fastrope_loop_npc";
    var_0[2]._id_3680 = "TAG_FastRope_RI";
    var_0[3]._id_3680 = "TAG_FastRope_RI";
    var_0[4]._id_3680 = "TAG_FastRope_LE";
    var_0[5]._id_3680 = "TAG_FastRope_LE";
    var_0[6]._id_3680 = "TAG_FastRope_RI";
    var_0[7]._id_3680 = "TAG_FastRope_LE";
    var_0[8]._id_3680 = "TAG_FastRope_RI";
    return _id_7FE3( var_0 );
}

_id_9A3D()
{
    var_0 = [];
    var_0["left"] = [];
    var_0["right"] = [];
    var_0["both"] = [];
    var_0["left"][var_0["left"].size] = 4;
    var_0["left"][var_0["left"].size] = 5;
    var_0["left"][var_0["left"].size] = 7;
    var_0["right"][var_0["right"].size] = 2;
    var_0["right"][var_0["right"].size] = 3;
    var_0["right"][var_0["right"].size] = 6;
    var_0["right"][var_0["right"].size] = 8;
    var_0["both"][var_0["both"].size] = 2;
    var_0["both"][var_0["both"].size] = 3;
    var_0["both"][var_0["both"].size] = 4;
    var_0["both"][var_0["both"].size] = 5;
    var_0["both"][var_0["both"].size] = 6;
    var_0["both"][var_0["both"].size] = 7;
    var_0["both"][var_0["both"].size] = 8;
    var_0["default"] = var_0["both"];
    return var_0;
}

_id_7DDA()
{
    var_0 = [];
    var_0["TAG_FastRope_LE"] = spawnstruct();
    var_0["TAG_FastRope_LE"]._id_029C = "rope_test";
    var_0["TAG_FastRope_LE"]._id_0428 = "TAG_FastRope_LE";
    var_0["TAG_FastRope_LE"]._id_4B79 = %bh_rope_idle_le;
    var_0["TAG_FastRope_LE"]._id_2F6D = %bh_rope_drop_le;
    var_0["TAG_FastRope_RI"] = spawnstruct();
    var_0["TAG_FastRope_RI"]._id_029C = "rope_test_ri";
    var_0["TAG_FastRope_RI"]._id_0428 = "TAG_FastRope_RI";
    var_0["TAG_FastRope_RI"]._id_4B79 = %bh_rope_idle_ri;
    var_0["TAG_FastRope_RI"]._id_2F6D = %bh_rope_drop_ri;
    var_1 = _func_1D3( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        precachemodel( var_0[var_1[var_2]]._id_029C );

    return var_0;
}

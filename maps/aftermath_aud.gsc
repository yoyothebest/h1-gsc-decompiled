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
    _id_A5DE::_id_5CF2( "mix_aftermath_global" );
    _id_A5DE::_id_5CF2( "mix_intro_stinger" );
    _id_A5DE::_id_5CF2( "mix_intro_radio_vo" );
    _id_A5E7::_id_123A( "interior_vehicle" );
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
    _id_A5E8::_id_874D( "aud_start_mix_player_dying", ::aud_start_mix_player_dying );
}

_id_A3E6( var_0, var_1 )
{

}

_id_5FFD( var_0, var_1 )
{

}

aud_player_falls()
{
    _id_A5E7::_id_122C( 1 );
    _id_A5F7::_id_86DB( "blur_event_filter", 0.5 );

    if ( !isdefined( level.heartbeat_ent ) )
    {
        level.heartbeat_ent = spawn( "script_origin", level._id_0318._id_02E2 );
        level.heartbeat_ent _meth_804F( level._id_0318 );
    }

    level.heartbeat_ent _meth_80AD();
    level._id_0318 _meth_809C( "h1_heartbeat_fall" );
    level._id_0318 thread _id_A5A4::_id_69C4( "scn_player_fall_impact" );
}

aud_player_recover()
{
    _id_A5F7::_id_86DC( 2 );
    _id_A5E7::_id_122C( 0 );
    level._id_0318 thread _id_A5A4::_id_69C4( "breathing_better" );
}

aud_player_dying_slowly()
{
    level waittill( "helicopterfall_bodysense" );
    _id_A5DE::_id_5CF6( "mix_intro_radio_vo" );
    _id_A5DE::_id_5CF2( "mix_player_dying_slowly" );
}

aud_start_mix_player_dying()
{
    _id_A5DE::_id_5CF6( "mix_player_dying_slowly" );
    _id_A5DE::_id_5CF2( "mix_player_dying" );
    level.heartbeat_ent _meth_80AD();
    level._id_0318 thread _id_A5A4::_id_69C4( "h1_aftermath_final_stinger_front" );
    level._id_0318 thread _id_A5A4::_id_69C4( "heartbeat_death" );
    level._id_0318 thread common_scripts\utility::_id_8EA1( level.playerbreathalias );
    wait 0.1;
    level.heartbeat_ent delete();
}

aud_player_walking_foley( var_0 )
{
    if ( var_0 == "crouch" )
        level._id_0318 _id_A5A4::_id_27EF( 0.4, _id_A5A4::_id_69C4, "step_prone_gravel_aftermath" );
    else if ( var_0 == "prone" )
        level._id_0318 _id_A5A4::_id_27EF( 0.4, _id_A5A4::_id_69C4, "step_prone_plr_gravel_aftermath" );
    else
        level._id_0318 _id_A5A4::_id_27EF( 0.4, _id_A5A4::_id_69C4, "step_crchwalk_plr_gravel_aftermath" );
}

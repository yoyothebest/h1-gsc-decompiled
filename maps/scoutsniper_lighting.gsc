// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    thread _id_80C6();
    thread _id_7E68();
    thread handle_church_explosion();
    level.default_clut = "clut_scoutsniper";
    level.default_lightset = "scoutsniper";
    level.default_visionset = "scoutsniper";
    thread handle_intro_cinematics();
    thread handle_ghillie_wibble();
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    _id_A5A4::_id_9E6E( "scoutsniper", 0 );
    level._id_0318 _id_A5A4::set_light_set_player( "scoutsniper" );
    level._id_0318 _meth_848C( "clut_scoutsniper", 0.0 );
    _func_0D6( "sm_sunShadowScale", "0.7" );
}

handle_ghillie_wibble()
{
    var_0 = 0.5;
    var_1 = 1;
    _func_2E8( 0, "x", var_0 );
    _func_2E8( 0, "y", var_1 );
}

handle_intro_cinematics()
{
    common_scripts\utility::_id_384A( "intro" );

    if ( getdvarint( "scoutsniper_use_pre_h1_intro" ) == 1 )
    {
        intro_blur_pre_h1();
        return;
    }

    wait 1;
    var_0 = maps\_cinematography::cinematic_sequence( "intro" );
    var_0 maps\_cinematography::cinseq_key( "init" ) maps\_cinematography::cinseq_key_time( 0 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 0.2, 10, 1, 0.2 ) maps\_cinematography::cinseq_key_lerp_fov( 63, 0 ) maps\_cinematography::cinseq_key_start_dynamic_dof( 1 );
    var_0 maps\_cinematography::cinseq_key( "resolve_in" ) maps\_cinematography::cinseq_key_time( 3.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 1.2, 50, 2, 0.1 ) maps\_cinematography::cinseq_key_lerp_fov( 63.5, 2 );
    var_0 maps\_cinematography::cinseq_key( "fast_lerp" ) maps\_cinematography::cinseq_key_time( 5.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 3.2, 100, 0.6, 0.5 ) maps\_cinematography::cinseq_key_lerp_fov( 64.5, 3 );
    var_0 maps\_cinematography::cinseq_key( "focus_out_to_scene" ) maps\_cinematography::cinseq_key_time( 7.5 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 5, 300, 2, 1 ) maps\_cinematography::cinseq_key_lerp_fov_default( 4 );
    var_0 maps\_cinematography::cinseq_key( "remove_dof" ) maps\_cinematography::cinseq_key_time( 10 ) maps\_cinematography::cinseq_key_dyndof_values( "main", 32, 600, 1, 2 );
    var_0 maps\_cinematography::cinseq_key( "end" ) maps\_cinematography::cinseq_key_time( 13 ) maps\_cinematography::cinseq_key_remove_dyndof( "main" ) maps\_cinematography::cinseq_key_end_dynamic_dof();
    var_0 maps\_cinematography::cinseq_start_sequence();
}

intro_blur_pre_h1()
{
    _id_A5A4::_id_27EF( 1, _id_A5A4::_id_7DE2, 4.8, 0.25 );
    _id_A5A4::_id_27EF( 4, _id_A5A4::_id_7DE2, 0, 3 );
}

handle_church_explosion()
{
    for (;;)
    {
        level waittill( "church_explosion_player_screen_fx" );
        level._id_0318 _meth_8186( "scoutsniper_church_explo", 3 );
    }
}

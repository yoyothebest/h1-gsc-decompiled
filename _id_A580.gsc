// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{

}

_id_4C38( var_0, var_1 )
{
    var_0 = _func_060( var_0 );
    var_2 = self;
    var_3 = _func_0BC( _func_2AC( "career", "kills_total" ) ) + 1;
    _func_2AB( "career", "kills_total", var_3 );
    _id_7F06( var_0, "kills_total" );
    var_4 = _func_2AC( "checkpoints", "kills_total" ) + 1;
    _func_2AB( "checkpoints", "kills_total", var_4 );

    if ( var_1 )
    {
        var_5 = _func_2AC( "checkpoints", "headshots_total" ) + 1;
        _func_2AB( "checkpoints", "headshots_total", var_5 );
        _id_7F06( var_0, "headshots_total" );
    }
}

_id_8446( var_0 )
{
    _id_7F06( _func_060( var_0 ), "shots_total" );
    var_1 = _func_2AC( "checkpoints", "shots_total" ) + 1;
    _func_2AB( "checkpoints", "shots_total", var_1 );
}

_id_4C37( var_0 )
{
    _id_7F06( _func_060( var_0 ), "shots_hit" );
    var_1 = _func_2AC( "checkpoints", "hits_total" ) + 1;
    _func_2AB( "checkpoints", "hits_total", var_1 );
}

_id_72DC( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_0 = _func_060( var_0 );

        if ( !_id_1BD6( var_1 ) )
            _id_7F06( var_0, "deaths_total" );
    }

    var_2 = _func_2AC( "checkpoints", "deaths_total" ) + 1;
    _func_2AB( "checkpoints", "deaths_total", var_2 );
    _id_A5A4::save_time_played();
    var_3 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "career", "deaths_total" );

    if ( isdefined( var_3 ) )
        level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "career", "deaths_total", var_3 + 1 );
}

_id_72D8()
{
    var_0 = _func_2AC( "checkpoints", "boosted_total" ) + 1;
    _func_2AB( "checkpoints", "boosted_total", var_0 );
}

_id_72D9()
{
    var_0 = _func_2AC( "checkpoints", "boosted_total" ) + 1;
    _func_2AB( "checkpoints", "boosted_total", var_0 );
}

_id_72D7()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "exo_dodge" );
        var_0 = _func_2AC( "checkpoints", "dodges_total" ) + 1;
        _func_2AB( "checkpoints", "boosted_total", var_0 );
    }
}

_id_72E9()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "give_perk", var_0 );
        _func_2AB( "perks", var_0, 1 );
    }
}

_id_56BD( var_0 )
{
    var_1 = level._id_0318 _meth_84FB();
    _func_2AB( "timestamp_end", var_1 );
    _func_2AB( "career", "level_completion_timestamp", var_0, var_1 );
    _func_2AB( "career", "levels_completed", var_0, 1 );
    var_2 = level._id_0318 _meth_8211( "gameskill" );
    var_3 = level._id_2A63[_func_0BC( var_2 )];
    _func_2AB( "final_difficulty", var_3 );
    _id_A5A4::save_time_played();
}

_id_2C3A( var_0 )
{
    var_1 = [ "ammo", "iw5_bal27_sp", "iw5_ak12_sp", "iw5_hbra3_sp", "iw5_himar_sp", "iw5_arx160_sp", "iw5_m182spr_sp", "iw5_sn6_sp", "iw5_hmr9_sp", "iw5_mp11_sp", "iw5_sac3_sp", "iw5_asm1_sp", "iw5_kf5_sp", "iw5_mors_sp", "iw5_gm6_sp", "iw5_thor_sp", "iw5_uts19_sp", "iw5_maul_sp", "iw5_rhino_sp", "iw5_lsat_sp", "iw5_asaw_sp", "iw5_em1_sp", "iw5_epm3_sp", "iw5_titan45_sp", "iw5_pbw_sp", "iw5_vbr_sp", "iw5_rw1_sp", "iw5_microdronelauncher_sp", "iw5_stingerm7_sp", "iw5_mahem_sp", "iw5_maaws_sp", "unknown", "" ];
    return common_scripts\utility::_id_0CE4( var_1, var_0 );
}

_id_7F06( var_0, var_1 )
{
    if ( isdefined( var_0 ) && _id_2C3A( var_0 ) )
    {
        var_2 = _func_0BC( _func_2AC( "weapon_stats", var_0, var_1 ) ) + 1;
        _func_2AB( "weapon_stats", var_0, var_1, var_2 );
    }
    else
    {
        var_2 = _func_0BC( _func_2AC( "weapon_stats", "unknown", var_1 ) ) + 1;
        _func_2AB( "weapon_stats", "unknown", var_1, var_2 );
    }
}

_id_1BD6( var_0 )
{
    var_0 = _func_123( var_0 );

    switch ( var_0 )
    {
        case "mod_grenade":
        case "mod_grenade_splash":
        case "mod_projectile":
        case "mod_projectile_splash":
        case "mod_explosive":
        case "splash":
            return 1;
        default:
            return 0;
    }

    return 0;
}

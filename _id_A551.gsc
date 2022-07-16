// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4D0F()
{
    _id_41CA();
    _id_A552::_id_57D8();
}

_id_41CA()
{
    if ( isdefined( level._id_2C2C ) )
        return;

    if ( !isdefined( level._id_1A3D ) )
        level._id_1A3D = "american";

    var_0 = _id_A552::_id_3DCC();
    level._id_0318 _id_A552::_id_7F46();
    level._id_46F3 = 0;
    _id_A552::_id_67D9( "sniperescape", "scoutsniper" );
    _id_A552::_id_67D9( "launchfacility_a", "icbm" );
    _id_A552::_id_67D9( "launchfacility_b", "launchfacility_a" );
    _id_A552::_id_57D6( "killhouse", undefined, undefined, "fraggrenade", "flash_grenade", "viewhands_black_kit", "british" );
    _id_A552::_id_57D6( "cargoship", "mp5_silencer", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_black_kit", "british" );
    _id_A552::_id_57D6( "coup", undefined, undefined, undefined, undefined, undefined, "american" );
    _id_A552::_id_57D6( "blackout", "m4m203_silencer_reflex", "m14_scoped_silencer_woodland", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "american" );
    _id_A552::_id_57D6( "armada", "m4_grunt", "beretta", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "bog_a", "m4_grenadier", "beretta", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "hunted", undefined, "colt45", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "ac130", undefined, undefined, undefined, undefined, "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "bog_b", "m4_grenadier", "beretta", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "airlift", "m4_grenadier", "colt45", "fraggrenade", "flash_grenade", "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "aftermath", undefined, undefined, undefined, undefined, "viewmodel_base_viewhands", "american" );
    _id_A552::_id_57D6( "village_assault", "m4m203_silencer_reflex", "m1014", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "scoutsniper", "m14_scoped_silencer", "usp_silencer", "fraggrenade", undefined, "viewhands_marine_sniper", "british" );
    _id_A552::_id_57D6( "sniperescape", "m14_scoped_woodland", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_marine_sniper", "british" );
    _id_A552::_id_57D6( "village_defend", "saw", "m14_scoped_woodland", "fraggrenade", "smoke_grenade_american", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "ambush", "remington700", "colt45", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "icbm", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "launchfacility_a", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "smoke_grenade_american", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "launchfacility_b", "m4m203_silencer_reflex", "usp_silencer", "fraggrenade", "flash_grenade", "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "jeepride", "m4_grunt", "colt45", "fraggrenade", undefined, "viewhands_sas_woodland", "british" );
    _id_A552::_id_57D6( "airplane", "mp5_silencer", "usp_silencer", undefined, "flash_grenade", "viewhands_black_kit", "british" );
    _id_A552::_id_57D6( "simplecredits", undefined, undefined, undefined, undefined, undefined, undefined );
    _id_A552::_id_57DB( "blackout", "c4", "claymore" );
    _id_A552::_id_57DB( "armada", undefined, "claymore" );
    _id_A552::_id_57DB( "village_assault", "c4", "cobra_air_support" );
    _id_A552::_id_57DB( "sniperescape", "c4", "claymore" );
    _id_A552::_id_57DB( "village_defend", undefined, "claymore" );
    _id_A552::_id_57DB( "icbm", "c4", "claymore" );
    _id_A552::_id_57DB( "launchfacility_a", "c4", "claymore" );
    _id_A552::_id_57DB( "launchfacility_b", "c4", "claymore" );
    _id_A552::loadoutcustomization();
    _id_A552::_id_2783();
}

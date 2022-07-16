// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    level._id_058F["animated_rat_death"] = loadfx( "vfx/blood/dlc_blood_splash_sm" );
    var_0 = getentarray( "animated_rat", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::init_rats );
}

init_rats()
{
    if ( !isdefined( self._id_0398 ) )
        return;

    switch ( self._id_0398 )
    {
        case "frantic":
            thread run_rat( "h1_mp_rat_frantic_idle", [ "h1_mp_rat_death_01", "h1_mp_rat_death_01" ] );
            break;
        case "run":
            thread run_rat( "h1_mp_rat_run_01", [ "h1_mp_rat_death_03" ] );
            break;
        default:
    }
}

run_rat( var_0, var_1 )
{
    _func_16C( var_0 );

    foreach ( var_3 in var_1 )
        _func_16C( var_3 );

    self _meth_82BC( 1 );
    self._id_01E6 = 1;
    self _meth_8277( var_0 );
    self _meth_8077( "rat_squeak_lp" );
    self waittill( "damage", var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    self _meth_80AD( "rat_squeak_lp" );
    playfx( common_scripts\utility::_id_3FA8( "animated_rat_death" ), self._id_02E2, ( 0, 0, 1 ) );
    var_12 = self._id_02E2;
    _func_1A8( var_12, "rat_squish" );
    self _meth_8277( common_scripts\utility::_id_710E( var_1 ) );
}

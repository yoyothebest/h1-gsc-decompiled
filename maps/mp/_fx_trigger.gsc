// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.fx_trigger_info = [];
    var_0 = getentarray( "fx_trigger", "targetname" );
    var_1 = getentarray( "fx_trigger_reverse", "targetname" );
    var_2 = common_scripts\utility::_id_0CDD( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        var_5 = var_4._id_0398;

        if ( !isdefined( var_5 ) )
            continue;

        if ( !isdefined( level._id_058F[var_5] ) )
            continue;

        var_6 = var_4._id_04A6 == "fx_trigger_reverse";

        if ( !isdefined( level.fx_trigger_info[var_5] ) )
        {
            var_7 = spawnstruct();
            var_7._id_0323 = [];
            var_7._id_0379 = var_6;
            var_7.fxent = spawnfx( level._id_058F[var_5], ( 0, 0, 0 ) );
            var_7.fxent _meth_8056();
            triggerfx( var_7.fxent, 1 );
            level.fx_trigger_info[var_5] = var_7;
            var_7.fxent thread fx_trigger_fx_ent_think( var_5 );
        }
        else if ( level.fx_trigger_info[var_5]._id_0379 != var_6 )
            continue;

        var_4 thread fx_trigger_think( var_5 );
    }
}

fx_trigger_fx_ent_think( var_0 )
{
    for (;;)
    {
        level.fx_trigger_info[var_0]._id_0323 = [];
        waittillframeend;
        waitframe;
        self _meth_8056();

        if ( level.fx_trigger_info[var_0]._id_0379 )
        {
            foreach ( var_2 in level._id_0323 )
            {
                if ( !isdefined( common_scripts\utility::_id_0CE8( level.fx_trigger_info[var_0]._id_0323, var_2 ) ) )
                    self _meth_8007( var_2 );
            }

            continue;
        }

        foreach ( var_2 in level.fx_trigger_info[var_0]._id_0323 )
            self _meth_8007( var_2 );
    }
}

fx_trigger_think( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_2 = level.fx_trigger_info[var_0]._id_0323.size;
        level.fx_trigger_info[var_0]._id_0323[var_2] = var_1;
    }
}

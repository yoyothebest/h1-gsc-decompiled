// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_8860 = getentarray( "trigger_multiple_softlanding", "classname" );
    var_0 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_2 in level._id_8860 )
    {
        if ( var_2._id_7B05 != "car" )
            continue;

        foreach ( var_4 in var_0 )
        {
            if ( _func_0EE( var_2._id_02E2, var_4._id_02E2 ) > 64.0 )
                continue;

            var_2._id_28F9 = var_4;
        }
    }

    thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_885F = undefined;
        var_0 thread _id_8861();
    }
}

_id_6C9D( var_0 )
{
    self._id_885F = var_0;
}

_id_6CDF( var_0 )
{
    self._id_885F = undefined;
}

_id_8861()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "soft_landing", var_0, var_1 );

        if ( !isdefined( var_0._id_28F9 ) )
            continue;
    }
}

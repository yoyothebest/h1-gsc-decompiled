// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    thread _id_80C6();
    thread _id_7E68();
    thread setup_spinning_ents();
    thread setup_emissive_pulsing();
    level.default_clut = "clut_launchfacility_b";
    level.default_lightset = "launchfacility_b";
    level.default_visionset = "launchfacility_b";
    level.nightvisionlightset = "launchfacility_b_nightvision";
    _func_144( "launchfacility_b_nightvision" );
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    _id_A5A4::_id_9E6E( "launchfacility_b", 0 );
    level._id_0318 _id_A5A4::set_light_set_player( "launchfacility_b" );
    level._id_0318 _meth_848C( "clut_launchfacility_b", 0.0 );
}

setup_spinning_ents()
{
    var_0 = common_scripts\utility::_id_8959();
    var_1 = getentarray( "spinning", "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = getent( var_3._id_7A26, "script_linkname" );
        wait 1.0;

        if ( isdefined( var_4 ) )
        {
            var_3 _meth_804F( var_0 );
            var_3 thread _id_A5A4::yaw_ent_by_linked( 1.0 );
            var_4 thread _id_A5A4::rotate_ent_with_ent( var_3 );
        }
    }
}

setup_emissive_pulsing()
{
    var_0 = getentarray( "emissive_pulsing", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::emissive_pulsing );
}

emissive_pulsing()
{
    var_0 = 0.5;
    var_1 = 0.2;
    var_2 = 0.5;
    var_3 = 1.0;

    if ( isdefined( self._id_0398 ) )
    {
        var_4 = _func_124( self._id_0398, " " );

        if ( isdefined( var_4[0] ) )
            var_2 = _func_0BD( var_4[0] );

        if ( isdefined( var_4[1] ) )
            var_3 = _func_0BD( var_4[1] );
    }

    var_5 = 0.05;
    var_6 = var_3;
    var_7 = 0.0 - ( var_3 - var_2 ) / ( var_0 / var_5 );
    var_8 = ( var_3 - var_2 ) / ( var_1 / var_5 );

    for (;;)
    {
        var_6 = emissive_ramp( var_0, var_6, var_7, var_2, var_3 );
        wait 1;
        var_6 = emissive_ramp( var_1, var_6, var_8, var_2, var_3 );
        wait 0.5;
    }
}

emissive_ramp( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 0;
    var_6 = 0.05;

    while ( var_5 < var_0 )
    {
        var_1 += var_2;
        var_1 = _func_0E9( var_1, var_3, var_4 );
        self _meth_83A5( var_1, 0.0 );
        var_5 += var_6;
        wait(var_6);
    }

    return var_1;
}

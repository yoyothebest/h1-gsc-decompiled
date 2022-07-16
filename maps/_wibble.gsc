// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

set_cloth_wibble( var_0 )
{
    _func_2E8( 0, "x", 1.0 );
    _func_2E8( 0, "y", var_0 );
}

setup_wibble_triggers( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_3 )
        set_cloth_wibble( 1.0 );

    level.current_wibble_location = var_2;

    if ( var_4 && var_2 == "exterior" && !var_3 )
        set_cloth_wibble( 0.5 );

    var_5 = getentarray( "trigger_wibble", "targetname" );
    common_scripts\utility::_id_0D13( var_5, ::wibble_trigger_think, var_0, var_1, var_4 );
    thread setup_wibble_helis( var_0, var_1 );
}

setup_wibble_helis( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        common_scripts\utility::_id_384A( var_1 );

    if ( var_0 )
    {
        wait 2;
        level endon( "wibble_heli_check_stop" );
        var_2 = 1690000;

        for (;;)
        {
            var_3 = 0;

            if ( isdefined( level._id_4816 ) )
            {
                level._id_4816 = common_scripts\utility::_id_0D01( level._id_4816 );

                foreach ( var_5 in level._id_4816 )
                {
                    var_6 = _func_0F0( level._id_0318._id_02E2, var_5._id_02E2 );

                    if ( var_6 <= var_2 )
                    {
                        var_3 = 0.5;
                        break;
                    }
                }
            }

            set_cloth_wibble( var_3 );
            wait 0.5;
        }
    }
    else
        set_cloth_wibble( 0.5 );
}

wibble_trigger_think( var_0, var_1, var_2 )
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( self._id_0398 != level.current_wibble_location )
        {
            switch ( self._id_0398 )
            {
                case "exterior":
                    if ( var_2 )
                    {
                        set_cloth_wibble( 0.5 );
                        break;
                    }
                    else
                    {
                        thread setup_wibble_helis( var_0, var_1 );
                        break;
                    }
                case "interior":
                    level notify( "wibble_heli_check_stop" );
                    set_cloth_wibble( 0.0 );
                    break;
            }

            level.current_wibble_location = self._id_0398;
        }
    }
}

wibble_add_heli_to_track( var_0 )
{
    if ( !isdefined( level._id_4816 ) )
        level._id_4816 = [];

    level._id_4816 = common_scripts\utility::_id_0CDA( level._id_4816, var_0 );
}

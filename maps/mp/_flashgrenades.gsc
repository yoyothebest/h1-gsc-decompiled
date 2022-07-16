// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precacheshellshock( "flashbang_mp" );
}

_id_8D2B()
{
    thread _id_5E5E();
}

_id_8EFA( var_0 )
{
    self notify( "stop_monitoring_flash" );
}

_id_38C5( var_0 )
{
    self endon( "stop_monitoring_flash" );
    self endon( "flash_rumble_loop" );
    self notify( "flash_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self _meth_80AF( "damage_heavy" );
        wait 0.05;
    }
}

_id_5E5E()
{
    self endon( "disconnect" );
    self notify( "monitorFlash" );
    self endon( "monitorFlash" );
    self._id_38B1 = 0;
    var_0 = 6;

    for (;;)
    {
        self waittill( "flashbang", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !_func_1A1( self ) )
            continue;

        if ( isdefined( self._id_9C34 ) )
            continue;

        if ( !isdefined( var_6 ) )
            var_6 = 0;

        var_7 = 0;
        var_8 = 1;

        if ( var_3 < 0.5 )
            var_3 = 0.5;
        else if ( var_3 > 0.8 )
            var_3 = 1;

        var_9 = var_2 * var_3 * var_0;
        var_9 += var_6;

        if ( isdefined( self._id_8F77 ) )
            var_9 *= self._id_8F77;

        if ( var_9 < 0.25 )
            continue;

        var_10 = undefined;

        if ( var_9 > 2 )
            var_10 = 0.75;
        else
            var_10 = 0.25;

        if ( level._id_91EB && isdefined( var_4 ) && isdefined( var_4._id_04A7 ) && var_4._id_04A7 == self._id_04A7 && var_4 != self )
        {
            if ( level._id_01A7 == 0 )
                continue;
            else if ( level._id_01A7 == 1 )
            {

            }
            else if ( level._id_01A7 == 2 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_8 = 0;
                var_7 = 1;
            }
            else if ( level._id_01A7 == 3 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_7 = 1;
            }
        }
        else if ( isdefined( var_4 ) )
        {
            if ( var_4 != self )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_flash" );

            var_11 = maps\mp\_utility::_id_4015();

            if ( var_11 == "mp_crash_snow" )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_wc_tactical" );
            else if ( var_11 == "mp_farm_spring" )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_stpatty_tactical" );
            else if ( var_11 == "mp_bog_summer" )
                var_4 maps\mp\gametypes\_misions::_id_6FF6( "ch_summer_tactical" );
        }

        if ( var_8 && isdefined( self ) )
        {
            thread _id_0CAD( var_9, var_10 );

            if ( isdefined( var_4 ) && var_4 != self )
            {
                var_4 thread maps\mp\gametypes\_damagefeedback::_id_9B0C( "flash" );
                self.flashattacker = var_4;
                var_12 = self;

                if ( _func_1AD( var_4 ) && var_4 _meth_8225( "specialty_paint" ) && var_4 maps\mp\_utility::_id_05CB( "specialty_paint" ) )
                    var_12 thread maps\mp\perks\_perkfunctions::_id_7FDB( var_4 );
            }
            else
                self.flashattacker = undefined;
        }

        if ( var_7 && isdefined( var_4 ) )
            var_4 thread _id_0CAD( var_9, var_10 );
    }
}

_id_0CAD( var_0, var_1 )
{
    if ( !isdefined( self._id_38AE ) || var_0 > self._id_38AE )
        self._id_38AE = var_0;

    if ( !isdefined( self._id_38C4 ) || var_1 > self._id_38C4 )
        self._id_38C4 = var_1;

    wait 0.05;

    if ( isdefined( self._id_38AE ) )
    {
        self _meth_8186( "flashbang_mp", self._id_38AE );
        self._id_38B1 = gettime() + self._id_38AE * 1000;
    }

    if ( isdefined( self._id_38C4 ) )
        thread _id_38C5( self._id_38C4 );

    self._id_38AE = undefined;
    self._id_38C4 = undefined;
}

_id_5107()
{
    return isdefined( self._id_38B1 ) && gettime() < self._id_38B1;
}

getlastflashbangattacker()
{
    return self.flashattacker;
}

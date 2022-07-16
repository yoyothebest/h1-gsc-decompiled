// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4D62()
{
    self._id_8D77["kills"] = 0;
    self._id_8D77["kills_melee"] = 0;
    self._id_8D77["kills_explosives"] = 0;
    self._id_8D77["kills_grenades"] = 0;
    self._id_8D77["kills_juggernaut"] = 0;
    self._id_8D77["kills_vehicle"] = 0;
    self._id_8D77["kills_sentry"] = 0;
    self._id_8D77["headshots"] = 0;
    self._id_8D77["shots_fired"] = 0;
    self._id_8D77["shots_hit"] = 0;
    self._id_8D77["weapon"] = [];
    self._id_8D77["current_checkpoint"] = 0;
    self._id_8D77["checkpoint_start"] = 0;
    self._id_8D77["final_difficulty"] = "";
    self._id_8D77["level_name"] = "";
    self._id_8D77["start_difficulty"] = "";
    self._id_8D77["career_kills_total"] = 0;
    self._id_8D77["career_deaths_total"] = 0;
    self._id_8D77["career_levels_completed"] = [];
    self._id_8D77["career_level_completed_timestamps"] = [];
    self._id_8D77["register_kills_for_vehicle_occupants"] = 1;
    thread _id_8447();
}

_id_A1BA()
{
    if ( isdefined( self._id_2A54 ) && self._id_2A54 )
        return 1;

    if ( !isdefined( self._id_00FD ) )
        return 0;

    return self._id_00FD == "helmet" || self._id_00FD == "head" || self._id_00FD == "neck";
}

_id_72DD( var_0, var_1 )
{
    var_2 = self;

    if ( isdefined( self._id_02E5 ) )
        var_2 = self._id_02E5;

    if ( !_func_1AD( var_2 ) )
        return;

    if ( var_1 )
    {
        var_2._id_8D77["start_difficulty"] = var_0;
        _func_2AB( "start_difficulty", var_0 );
    }
    else
    {
        var_2._id_8D77["final_difficulty"] = var_0;
        _func_2AB( "final_difficulty", var_0 );
    }
}

_id_72E0( var_0 )
{
    var_1 = self;

    if ( isdefined( self._id_02E5 ) )
        var_1 = self._id_02E5;

    if ( !_func_1AD( var_1 ) )
        return;

    var_1._id_8D77["level_name"] = var_0;
    _func_2AB( "level_name", var_0 );
}

_id_93D9( var_0 )
{
    var_1 = self;

    if ( isdefined( self._id_02E5 ) )
        var_1 = self._id_02E5;

    if ( !_func_1AD( var_1 ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    var_1._id_8D77["register_kills_for_vehicle_occupants"] = var_0;
}

_id_8474()
{
    var_0 = self;

    if ( isdefined( self._id_02E5 ) )
        var_0 = self._id_02E5;

    if ( !_func_1AD( var_0 ) )
        return 1;

    if ( isdefined( var_0._id_8D77["register_kills_for_vehicle_occupants"] ) && var_0._id_8D77["register_kills_for_vehicle_occupants"] )
        return 1;

    return 0;
}

_id_72DF( var_0, var_1, var_2, var_3 )
{
    var_4 = self;
    var_5 = 0;

    if ( isdefined( self._id_02E5 ) )
        var_4 = self._id_02E5;

    if ( !_func_1AD( var_4 ) )
    {
        if ( isdefined( level._id_6E02 ) && level._id_6E02 )
            var_4 = level._id_0323[_func_0B2( level._id_0323.size )];
    }

    if ( !_func_1AD( var_4 ) )
        return;

    if ( isdefined( level._id_85B6 ) && isdefined( var_0._id_2E18 ) && var_0._id_2E18 )
        return;

    var_4._id_8D77["kills"]++;
    var_4 _id_1B89( "kills", 1 );
    var_6 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "career", "kills_total" );

    if ( isdefined( var_6 ) )
        level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "career", "kills_total", var_6 + 1 );

    if ( _id_A5A4::_id_5083() )
        level notify( "specops_player_kill", var_4, var_0, var_2, var_3 );

    if ( isdefined( var_0 ) )
    {
        if ( var_0 _id_A1BA() && var_1 != "MOD_MELEE" && var_1 != "MOD_MELEE_ALT" )
        {
            var_4._id_8D77["headshots"]++;
            var_4 _id_1B89( "headshots", 1 );
            var_5 = 1;
        }

        if ( isdefined( var_0._id_529C ) )
        {
            var_4._id_8D77["kills_juggernaut"]++;
            var_4 _id_1B89( "kills_juggernaut", 1 );
        }

        if ( isdefined( var_0._id_519D ) )
            var_4._id_8D77["kills_sentry"]++;

        if ( var_0.code_classname == "script_vehicle" )
        {
            var_4._id_8D77["kills_vehicle"]++;

            if ( var_4 _id_8474() )
            {
                if ( isdefined( var_0._id_750A ) )
                {
                    foreach ( var_8 in var_0._id_750A )
                    {
                        if ( isdefined( var_8 ) )
                            var_4 _id_72DF( var_8, var_1, var_2, var_3 );
                    }
                }
            }
        }
    }

    var_10 = 0;

    if ( _id_1BD6( var_1 ) )
    {
        var_4._id_8D77["kills_explosives"]++;
        var_10 = 1;
    }

    if ( _id_1BD7( var_1, var_2 ) && ( !isdefined( var_4._id_5B1D ) || !isdefined( var_4._id_5B1D.active ) || !var_4._id_5B1D.active ) )
    {
        var_4._id_8D77["kills_grenades"]++;
        var_4 _id_8D4B( "kills_grenades", 1 );
        var_10 = 1;
    }

    if ( !isdefined( var_2 ) )
        var_2 = var_4 _meth_830E();

    if ( _func_120( _func_123( var_1 ), "melee" ) )
    {
        var_4._id_8D77["kills_melee"]++;

        if ( _func_1E4( var_2 ) == "primary" )
            return;
    }

    if ( var_4 _id_5055( var_2 ) )
        var_4 _id_72E2( var_2 );

    var_4._id_8D77["weapon"][var_2]._id_0239++;
    var_4._id_8D77["career_kills_total"]++;

    if ( !var_10 )
        _id_A580::_id_4C38( var_2, var_5 );
}

_id_8D4D( var_0 )
{
    if ( !isdefined( self._id_8D4C ) )
        self._id_8D4C = [];

    self._id_8D4C[self._id_8D4C.size] = var_0;
}

_id_8D4B( var_0, var_1 )
{
    if ( isdefined( self._id_8D4C ) )
    {
        foreach ( var_3 in self._id_8D4C )
            self [[ var_3 ]]( var_0, var_1 );
    }
}

_id_1B89( var_0, var_1 )
{
    _id_8D4B( var_0, var_1 );

    if ( !_id_A5A4::_id_5083() )
        return;
}

_id_72E7()
{
    if ( !_func_1AD( self ) )
        return;

    if ( isdefined( self._id_72F0 ) )
        return;

    self._id_72F0 = 1;
    self._id_8D77["shots_hit"]++;
    _id_1B89( "bullets_hit", 1 );
    var_0 = self _meth_830E();

    if ( _id_5055( var_0 ) )
        _id_72E2( var_0 );

    self._id_8D77["weapon"][var_0]._id_8448++;
    thread _id_A580::_id_4C37( var_0 );
    waitframe;
    self._id_72F0 = undefined;
}

_id_8447()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "weapon_fired" );
        var_0 = self _meth_830E();

        if ( !isdefined( var_0 ) || !_id_A5A4::_id_5185( var_0 ) )
            continue;

        self._id_8D77["shots_fired"]++;
        _id_1B89( "bullets_fired", 1 );

        if ( _id_5055( var_0 ) )
            _id_72E2( var_0 );

        self._id_8D77["weapon"][var_0]._id_8446++;
        thread _id_A580::_id_8446( var_0 );
    }
}

_id_5055( var_0 )
{
    if ( isdefined( self._id_8D77["weapon"][var_0] ) )
        return 0;

    return 1;
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

_id_1BD7( var_0, var_1 )
{
    var_0 = _func_123( var_0 );

    switch ( var_0 )
    {
        case "emp_grenade":
            if ( isdefined( var_1 ) && var_1 == "emp_grenade_var" )
                return 1;

            break;
        case "mod_projectile_splash":
            if ( isdefined( var_1 ) && var_1 == "iw5_microdronelauncher_sp" )
                return 1;

            break;
        case "mod_grenade":
        case "mod_grenade_splash":
            return 1;
        default:
            return 0;
    }

    return 0;
}

_id_72E2( var_0 )
{
    self._id_8D77["weapon"][var_0] = spawnstruct();
    self._id_8D77["weapon"][var_0]._id_02A7 = var_0;
    self._id_8D77["weapon"][var_0]._id_8446 = 0;
    self._id_8D77["weapon"][var_0]._id_8448 = 0;
    self._id_8D77["weapon"][var_0]._id_0239 = 0;
    self._id_8D77["weapon"][var_0]._id_010D = 0;
}

_id_7EC5()
{
    var_0 = 1;

    foreach ( var_2 in level._id_0323 )
    {
        setdvar( "stats_" + var_0 + "_kills_melee", var_2._id_8D77["kills_melee"] );
        setdvar( "stats_" + var_0 + "_kills_juggernaut", var_2._id_8D77["kills_juggernaut"] );
        setdvar( "stats_" + var_0 + "_kills_explosives", var_2._id_8D77["kills_explosives"] );
        setdvar( "stats_" + var_0 + "_kills_vehicle", var_2._id_8D77["kills_vehicle"] );
        setdvar( "stats_" + var_0 + "_kills_sentry", var_2._id_8D77["kills_sentry"] );
        var_3 = var_2 _id_3CDA( 5 );

        foreach ( var_5 in var_3 )
        {
            var_5.accuracy = 0;

            if ( var_5._id_8446 > 0 )
                var_5.accuracy = _func_0BC( var_5._id_8448 / var_5._id_8446 * 100 );
        }

        for ( var_7 = 1; var_7 < 6; var_7++ )
        {
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_name", " " );
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_kills", " " );
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_shots", " " );
            setdvar( "stats_" + var_0 + "_weapon" + var_7 + "_accuracy", " " );
        }

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
        {
            if ( !isdefined( var_3[var_7] ) )
                break;

            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_name", var_3[var_7]._id_02A7 );
            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_kills", var_3[var_7]._id_0239 );
            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_shots", var_3[var_7]._id_8446 );
            setdvar( "stats_" + var_0 + "_weapon" + ( var_7 + 1 ) + "_accuracy", var_3[var_7].accuracy + "%" );
        }

        var_0++;
    }
}

_id_3CDA( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0; var_2++ )
        var_1[var_2] = _id_3EC8( var_1 );

    return var_1;
}

_id_3EC8( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = [];

    var_1 = undefined;

    foreach ( var_3 in self._id_8D77["weapon"] )
    {
        var_4 = 0;

        foreach ( var_6 in var_0 )
        {
            if ( var_3._id_02A7 == var_6._id_02A7 )
            {
                var_4 = 1;
                break;
            }
        }

        if ( var_4 )
            continue;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_3;
            continue;
        }

        if ( var_3._id_0239 > var_1._id_0239 )
            var_1 = var_3;
    }

    return var_1;
}

_id_599F()
{

}

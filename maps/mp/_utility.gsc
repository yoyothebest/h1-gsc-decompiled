// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3537()
{
    if ( isdefined( self._id_0392 ) )
        wait(self._id_0392);

    self _meth_809C( level._id_78BA[self._id_7ACA] );
}

_id_0560( var_0, var_1, var_2, var_3 )
{
    self _meth_8318( var_1, var_2, var_3 );
    self _meth_82F8( "ui_map_location_selector", 1 );
    self._id_7C6F = 1;
    self _meth_82D6( 10.3, 0.3 );
    thread _id_31C4( "cancel_location" );
    thread _id_31C4( "death" );
    thread _id_31C4( "disconnect" );
    thread _id_31C4( "used" );
    thread _id_31C4( "weapon_change" );
    self endon( "stop_location_selection" );
    thread _id_31C6();
    thread _id_31C5();
    thread _id_31C3();
}

_id_8EF6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( !var_0 )
    {
        self _meth_82F8( "ui_map_location_selector", 0 );
        self _meth_82D6( 0, 0.3 );
        self _meth_8319();
        self._id_7C6F = undefined;
    }

    self notify( "stop_location_selection", var_1 );
}

_id_31C5()
{
    self endon( "stop_location_selection" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( !_id_50F9() )
            continue;

        thread _id_8EF6( 0, "emp" );
        return;
    }
}

_id_31C4( var_0, var_1 )
{
    self endon( "stop_location_selection" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    while ( var_1 > 0 )
    {
        self waittill( var_0 );
        var_1--;
    }

    thread _id_8EF6( var_0 == "disconnect", var_0 );
}

_id_31C6()
{
    self endon( "stop_location_selection" );
    level waittill( "game_ended" );
    thread _id_8EF6( 0, "end_game" );
}

_id_31C3()
{
    self endon( "stop_location_selection" );
    level waittill( "host_migration_begin" );
    thread _id_8EF6( 0, "hostmigrate" );
}

_id_50BD( var_0 )
{
    var_1 = _func_1BB( "mp/attachmentTable.csv", 3, var_0, 0 );

    if ( isdefined( var_1 ) && var_1 != "" )
        return 1;
    else
        return 0;
}

_id_3F0B( var_0 )
{
    var_1 = _func_1BB( "mp/attachmentTable.csv", 3, var_0, 1 );
    return var_1;
}

_id_27EF( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    thread _id_27F1( var_1, var_0, var_2, var_3, var_4, var_5, var_6 );
}

_id_27F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    wait(var_1);

    if ( !isdefined( var_2 ) )
        thread [[ var_0 ]]();
    else if ( !isdefined( var_3 ) )
        thread [[ var_0 ]]( var_2 );
    else if ( !isdefined( var_4 ) )
        thread [[ var_0 ]]( var_2, var_3 );
    else if ( !isdefined( var_5 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( !isdefined( var_6 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
}

_id_4087()
{
    var_0 = self._id_02E2 + ( 0, 0, 10 );
    var_1 = 11;
    var_2 = anglestoforward( self.angles );
    var_2 *= var_1;
    var_3[0] = var_0 + var_2;
    var_3[1] = var_0;
    var_4 = _func_06B( var_3[0], var_3[0] + ( 0, 0, -18 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5._id_02E2 = var_4["position"];
        var_5.angles = _id_658A( var_4["normal"] );
        return var_5;
    }

    var_4 = _func_06B( var_3[1], var_3[1] + ( 0, 0, -18 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5._id_02E2 = var_4["position"];
        var_5.angles = _id_658A( var_4["normal"] );
        return var_5;
    }

    var_3[2] = var_0 + ( 16, 16, 0 );
    var_3[3] = var_0 + ( 16, -16, 0 );
    var_3[4] = var_0 + ( -16, -16, 0 );
    var_3[5] = var_0 + ( -16, 16, 0 );
    var_6 = undefined;
    var_7 = undefined;

    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
    {
        var_4 = _func_06B( var_3[var_8], var_3[var_8] + ( 0, 0, -1000 ), 0, undefined );

        if ( !isdefined( var_6 ) || var_4["fraction"] < var_6 )
        {
            var_6 = var_4["fraction"];
            var_7 = var_4["position"];
        }
    }

    if ( var_6 == 1 )
        var_7 = self._id_02E2;

    var_5 = spawnstruct();
    var_5._id_02E2 = var_7;
    var_5.angles = _id_658A( var_4["normal"] );
    return var_5;
}

_id_658A( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    var_2 = _func_0F1( var_1 );

    if ( !var_2 )
        return ( 0, 0, 0 );

    var_3 = _func_114( var_1 );
    var_4 = var_0[2] * -1;
    var_5 = ( var_3[0] * var_4, var_3[1] * var_4, var_2 );
    var_6 = _func_115( var_5 );
    return var_6;
}

_id_285E( var_0 )
{
    var_1 = getentarray( var_0, "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

issecondarysplitscreenplayer()
{
    if ( self _meth_82CA() && !self _meth_82E5() )
        return 1;

    return 0;
}

_id_6DDD( var_0, var_1, var_2 )
{
    if ( level._id_8A7C )
    {
        if ( isdefined( level._id_0323[0] ) )
            level._id_0323[0] _meth_82F1( var_0 );
    }
    else if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_2 ) )
        {
            for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
            {
                var_4 = level._id_0323[var_3];

                if ( var_4 issecondarysplitscreenplayer() )
                    continue;

                if ( isdefined( var_4._id_0308["team"] ) && var_4._id_0308["team"] == var_1 && !_id_5100( var_4, var_2 ) )
                    var_4 _meth_82F1( var_0 );
            }
        }
        else
        {
            for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
            {
                var_4 = level._id_0323[var_3];

                if ( var_4 issecondarysplitscreenplayer() )
                    continue;

                if ( isdefined( var_4._id_0308["team"] ) && var_4._id_0308["team"] == var_1 )
                    var_4 _meth_82F1( var_0 );
            }
        }
    }
    else if ( isdefined( var_2 ) )
    {
        for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
        {
            var_4 = level._id_0323[var_3];

            if ( var_4 issecondarysplitscreenplayer() )
                continue;

            if ( !_id_5100( var_4, var_2 ) )
                var_4 _meth_82F1( var_0 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
        {
            var_4 = level._id_0323[var_3];

            if ( var_4 issecondarysplitscreenplayer() )
                continue;

            var_4 _meth_82F1( var_0 );
        }
    }
}

_id_6DC5( var_0, var_1, var_2 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3 endon( "death" );
    thread common_scripts\utility::_id_2825( var_3 );

    if ( isdefined( var_2 ) )
    {
        var_3 _meth_8056();

        foreach ( var_5 in var_2 )
            var_3 _meth_8007( var_5 );
    }

    if ( isdefined( var_1 ) )
    {
        var_3._id_02E2 = self._id_02E2 + var_1;
        var_3.angles = self.angles;
        var_3 _meth_8442( self );
    }
    else
    {
        var_3._id_02E2 = self._id_02E2;
        var_3.angles = self.angles;
        var_3 _meth_8442( self );
    }

    var_3 _meth_8077( var_0 );
    self waittill( "stop sound" + var_0 );
    var_3 _meth_80AD( var_0 );
    var_3 delete();
}

_id_8896()
{
    for ( var_0 = 1; var_0 < self._id_58A6.size; var_0++ )
    {
        var_1 = self._id_58A6[var_0];
        var_2 = var_1._id_6FBE;

        for ( var_3 = var_0 - 1; var_3 >= 0 && var_2 > self._id_58A6[var_3]._id_6FBE; var_3-- )
            self._id_58A6[var_3 + 1] = self._id_58A6[var_3];

        self._id_58A6[var_3 + 1] = var_1;
    }
}

_id_07FF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = undefined;

    foreach ( var_11 in self._id_58A6 )
    {
        if ( var_11._id_02A7 == var_0 )
        {
            if ( var_11._id_92B2 == var_1 && var_11._id_6FBE == var_3 )
                return;

            var_9 = var_11;
            break;
        }
    }

    if ( !isdefined( var_9 ) )
    {
        var_9 = spawnstruct();
        self._id_58A6[self._id_58A6.size] = var_9;
    }

    var_9._id_02A7 = var_0;
    var_9._id_92B2 = var_1;
    var_9._id_04B7 = var_2;
    var_9._id_0843 = gettime();
    var_9._id_6FBE = var_3;
    var_9._id_8534 = var_4;
    var_9._id_8497 = var_5;
    var_9._id_35F9 = var_6;
    var_9._id_35FA = var_7;
    var_9._id_01EC = var_8;
    _id_8896();
}

_id_73BB( var_0 )
{
    if ( isdefined( self._id_58A6 ) )
    {
        for ( var_1 = self._id_58A6.size; var_1 > 0; var_1-- )
        {
            if ( self._id_58A6[var_1 - 1]._id_02A7 != var_0 )
                continue;

            var_2 = self._id_58A6[var_1 - 1];

            for ( var_3 = var_1; var_3 < self._id_58A6.size; var_3++ )
            {
                if ( isdefined( self._id_58A6[var_3] ) )
                    self._id_58A6[var_3 - 1] = self._id_58A6[var_3];
            }

            self._id_58A6[self._id_58A6.size - 1] = undefined;
        }

        _id_8896();
    }
}

_id_4011()
{
    return self._id_58A6[0];
}

_id_7FA5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0.85;

    if ( !isdefined( var_7 ) )
        var_7 = 3.0;

    if ( !isdefined( var_8 ) )
        var_8 = 0;

    _id_07FF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    _id_9B31();
}

_id_9B31()
{
    if ( !isdefined( self._id_58A4 ) )
        return;

    var_0 = _id_4011();

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_58A4 ) && isdefined( self._id_58AB ) )
        {
            self._id_58A4.alpha = 0;
            self._id_58AB.alpha = 0;
        }
    }
    else
    {
        self._id_58A4 _meth_80CC( var_0._id_92B2 );
        self._id_58A4.alpha = 0.85;
        self._id_58AB.alpha = 1;
        self._id_58A4._id_01EC = var_0._id_01EC;

        if ( var_0._id_8497 )
        {
            self._id_58A4 _meth_8086( _func_0BF( var_0._id_35FA, 60 ) );
            self._id_58A4.alpha = var_0._id_35F9;
        }

        if ( var_0._id_04B7 > 0 && var_0._id_8534 )
            self._id_58AB _meth_80D1( _func_0E1( var_0._id_04B7 - ( gettime() - var_0._id_0843 ) / 1000, 0.1 ) );
        else
        {
            if ( var_0._id_04B7 > 0 && !var_0._id_8534 )
            {
                self._id_58AB _meth_80CC( "" );
                self._id_58A4 _meth_8086( _func_0BF( var_0._id_04B7, 60 ) );
                self._id_58A4.alpha = 0;
                thread _id_1EF8( var_0 );
                thread _id_1EDF( var_0 );
                return;
            }

            self._id_58AB _meth_80CC( "" );
        }
    }
}

_id_1EF8( var_0 )
{
    self notify( "message_cleared" );
    self endon( "message_cleared" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_1EF5( var_0._id_02A7 );
}

_id_1EDF( var_0 )
{
    wait(var_0._id_04B7);
    _id_1EF5( var_0._id_02A7 );
    self notify( "message_cleared" );
}

_id_1EF5( var_0 )
{
    _id_73BB( var_0 );
    _id_9B31();
}

_id_1EF6()
{
    for ( var_0 = 0; var_0 < self._id_58A6.size; var_0++ )
        self._id_58A6[var_0] = undefined;

    if ( !isdefined( self._id_58A4 ) )
        return;

    _id_9B31();
}

_id_6FB5( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
    {
        if ( var_3._id_04A7 != var_1 )
            continue;

        var_3 _meth_8269( var_0 );
    }
}

_id_6FAD( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_0323.size; var_2++ )
    {
        var_3 = level._id_0323[var_2];

        if ( isdefined( var_3._id_0308["team"] ) && var_3._id_0308["team"] == var_1 )
            var_3 _meth_826A( var_0 );
    }
}

_id_6FAE( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
    {
        var_4 = level._id_0323[var_3];

        if ( isdefined( var_4._id_0308["team"] ) && var_4._id_0308["team"] == var_1 )
            var_4 _meth_826A( var_0, var_2 );
    }
}

_id_6FB6( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level._id_0323.size; var_3++ )
    {
        var_4 = level._id_0323[var_3];

        if ( isdefined( var_4._id_0308["team"] ) && var_4._id_0308["team"] == var_1 )
            var_4 _meth_8269( var_0, var_2 );
    }
}

_id_6FB4( var_0, var_1 )
{
    var_2 = level._id_0323;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_2[var_3]._id_0308["team"] ) && var_2[var_3]._id_0308["team"] == var_1 )
                var_2[var_3] _meth_8269( var_0 );

            continue;
        }

        var_2[var_3] _meth_8269( var_0 );
    }
}

_id_6FAA( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = isdefined( var_4 );
    var_8 = 0;

    if ( isdefined( var_5 ) )
        var_8 = 1;

    if ( !var_7 )
    {
        for ( var_9 = 0; var_9 < level._id_0323.size; var_9++ )
        {
            var_10 = level._id_0323[var_9];
            var_11 = var_10._id_04A7;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 && isdefined( var_2 ) )
                {
                    var_10 _meth_8269( var_2, var_6 );
                    continue;
                }

                if ( var_11 == var_1 && isdefined( var_3 ) )
                    var_10 _meth_8269( var_3, var_6 );
            }
        }
    }
    else if ( var_8 )
    {
        for ( var_9 = 0; var_9 < level._id_0323.size; var_9++ )
        {
            var_10 = level._id_0323[var_9];

            if ( var_10 issecondarysplitscreenplayer() )
                continue;

            var_11 = var_10._id_04A7;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 _meth_8269( var_2, var_6 );

                    var_10 _meth_82F1( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 _meth_8269( var_3, var_6 );

                    var_10 _meth_82F1( var_5 );
                }
            }
        }
    }
    else
    {
        for ( var_9 = 0; var_9 < level._id_0323.size; var_9++ )
        {
            var_10 = level._id_0323[var_9];

            if ( var_10 issecondarysplitscreenplayer() )
                continue;

            var_11 = var_10._id_04A7;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 _meth_8269( var_2, var_6 );

                    var_10 _meth_82F1( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 _meth_8269( var_3, var_6 );
                }
            }
        }
    }
}

_id_6FAC( var_0, var_1, var_2 )
{
    foreach ( var_4 in level._id_0323 )
    {
        if ( var_4._id_04A7 != var_0 )
            continue;

        var_4 _id_6FAB( var_1, var_2 );
    }
}

_id_6FAB( var_0, var_1 )
{
    self _meth_8269( var_0 );
    self _meth_82F1( var_1 );
}

_id_0618( var_0 )
{
    if ( level._id_8A7C && self _meth_81B5() != 0 )
        return;

    self _meth_82F1( var_0 );
}

_id_2FD0( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level._id_01B3 + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarint( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_2FCF( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level._id_01B3 + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarfloat( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_69C5( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        _func_1A8( self _meth_8184( var_1 ), var_0 );
    else
        _func_1A8( self._id_02E2, var_0 );
}

_id_4067( var_0 )
{
    if ( level._id_5FEC )
    {

    }

    if ( var_0 == "allies" )
        return "axis";
    else if ( var_0 == "axis" )
        return "allies";
    else
        return "none";
}

_id_9F85( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    wait(var_0);
}

_id_4DF9( var_0 )
{
    if ( !isdefined( self._id_0308[var_0] ) )
        self._id_0308[var_0] = 0;
}

_id_4081( var_0 )
{
    return self._id_0308[var_0];
}

_id_4C2E( var_0, var_1 )
{
    if ( isdefined( self ) && isdefined( self._id_0308 ) && isdefined( self._id_0308[var_0] ) )
    {
        self._id_0308[var_0] += var_1;
        maps\mp\gametypes\_persistence::_id_8D50( var_0, var_1 );
    }
}

_id_7FE1( var_0, var_1 )
{
    self._id_0308[var_0] = var_1;
}

_id_4E00( var_0, var_1 )
{
    if ( !isdefined( self._id_8D77["stats_" + var_0] ) )
    {
        if ( !isdefined( var_1 ) )
            var_1 = 0;

        self._id_8D77["stats_" + var_0] = spawnstruct();
        self._id_8D77["stats_" + var_0]._id_9C53 = var_1;

        if ( _id_7139() )
            self _meth_8243( common_scripts\utility::getstatsgroup_common(), "round", "awards", var_0, 0 );
    }
}

_id_4C2F( var_0, var_1 )
{
    if ( _func_1FF( self ) )
        return;

    var_2 = self._id_8D77["stats_" + var_0];
    var_2._id_9C53 += var_1;
}

_id_7FEA( var_0, var_1 )
{
    var_2 = self._id_8D77["stats_" + var_0];
    var_2._id_9C53 = var_1;
    var_2._id_04B7 = gettime();
}

_id_408F( var_0 )
{
    return self._id_8D77["stats_" + var_0]._id_9C53;
}

_id_4090( var_0 )
{
    return self._id_8D77["stats_" + var_0]._id_04B7;
}

_id_7FEB( var_0, var_1 )
{
    var_2 = _id_408F( var_0 );

    if ( var_1 > var_2 )
        _id_7FEA( var_0, var_1 );
}

_id_7FEC( var_0, var_1 )
{
    var_2 = _id_408F( var_0 );

    if ( var_1 < var_2 )
        _id_7FEA( var_0, var_1 );
}

_id_9B47( var_0, var_1, var_2 )
{
    if ( !_id_7139() )
        return;

    var_3 = maps\mp\gametypes\_persistence::_id_8D68( var_1 );
    var_4 = maps\mp\gametypes\_persistence::_id_8D68( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    maps\mp\gametypes\_persistence::_id_8D78( var_0, _func_0BC( var_3 * 1000 / var_4 ) );
}

_id_9B48( var_0, var_1, var_2 )
{
    if ( !_id_7139() )
        return;

    var_3 = maps\mp\gametypes\_persistence::_id_8D69( var_1 );
    var_4 = maps\mp\gametypes\_persistence::_id_8D69( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    maps\mp\gametypes\_persistence::_id_8D79( var_0, _func_0BC( var_3 * 1000 / var_4 ) );
}

_id_A0F4( var_0 )
{
    if ( level._id_55DC == gettime() )
    {
        if ( isdefined( var_0 ) && var_0 )
        {
            while ( level._id_55DC == gettime() )
                wait 0.05;
        }
        else
        {
            wait 0.05;

            if ( level._id_55DC == gettime() )
            {
                wait 0.05;

                if ( level._id_55DC == gettime() )
                {
                    wait 0.05;

                    if ( level._id_55DC == gettime() )
                        wait 0.05;
                }
            }
        }
    }

    level._id_55DC = gettime();
}

_id_A03E( var_0, var_1 )
{
    self endon( var_1 );
    wait(var_0);
}

_id_A03D( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
            self endon( var_3 );
    }

    if ( isdefined( var_0 ) && var_0 > 0 )
        wait(var_0);
}

_id_5100( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

_id_564B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( var_0 == "null" )
        return;

    if ( !isdefined( var_1 ) )
        _id_5650( var_0, "allies", var_0, "axis", var_2, var_3, var_4 );
    else
    {
        if ( isdefined( var_3 ) )
        {
            for ( var_5 = 0; var_5 < level._id_0323.size; var_5++ )
            {
                var_6 = level._id_0323[var_5];

                if ( isdefined( var_6._id_0308["team"] ) && var_6._id_0308["team"] == var_1 && !_id_5100( var_6, var_3 ) )
                {
                    if ( var_6 issecondarysplitscreenplayer() )
                        continue;

                    var_6 _id_5655( var_0, var_2, undefined, var_4 );
                }
            }

            return;
        }

        for ( var_5 = 0; var_5 < level._id_0323.size; var_5++ )
        {
            var_6 = level._id_0323[var_5];

            if ( isdefined( var_6._id_0308["team"] ) && var_6._id_0308["team"] == var_1 )
            {
                if ( var_6 issecondarysplitscreenplayer() )
                    continue;

                var_6 _id_5655( var_0, var_2, undefined, var_4 );
            }
        }
    }
}

_id_5650( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( level._id_8A7C )
        return;

    if ( isdefined( var_5 ) )
    {
        for ( var_7 = 0; var_7 < level._id_0323.size; var_7++ )
        {
            var_8 = level._id_0323[var_7];
            var_9 = var_8._id_0308["team"];

            if ( !isdefined( var_9 ) )
                continue;

            if ( _id_5100( var_8, var_5 ) )
                continue;

            if ( var_8 issecondarysplitscreenplayer() )
                continue;

            if ( var_9 == var_1 )
            {
                var_8 _id_5655( var_0, var_4, undefined, var_6 );
                continue;
            }

            if ( var_9 == var_3 )
                var_8 _id_5655( var_2, var_4, undefined, var_6 );
        }
    }
    else
    {
        for ( var_7 = 0; var_7 < level._id_0323.size; var_7++ )
        {
            var_8 = level._id_0323[var_7];
            var_9 = var_8._id_0308["team"];

            if ( !isdefined( var_9 ) )
                continue;

            if ( var_8 issecondarysplitscreenplayer() )
                continue;

            if ( var_9 == var_1 )
            {
                var_8 _id_5655( var_0, var_4, undefined, var_6 );
                continue;
            }

            if ( var_9 == var_3 )
                var_8 _id_5655( var_2, var_4, undefined, var_6 );
        }
    }
}

_id_5658( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    foreach ( var_5 in var_1 )
        var_5 _id_5655( var_0, var_2, undefined, var_3 );
}

_id_5655( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_4 = self._id_0308["team"];

    if ( isdefined( level._id_511D ) && issecondarysplitscreenplayer() )
        return;

    if ( isdefined( level._id_0C91 ) && level._id_0C91 )
        return;

    if ( !isdefined( var_4 ) )
        return;

    if ( var_4 != "allies" && var_4 != "axis" )
        return;

    if ( issecondarysplitscreenplayer() )
        return;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    if ( isdefined( var_1 ) )
    {
        if ( self._id_5651 == var_1 )
        {
            if ( var_2 )
            {
                if ( self._id_564F != "" )
                    self _meth_82F2( self._id_564F );

                thread _id_5657( var_0, var_4, var_3 );
            }

            return;
        }

        var_5 = isdefined( self._id_5652[var_1] );
        self._id_5652[var_1] = var_0;
        var_0 = var_1;

        if ( var_5 )
            return;
    }

    if ( self._id_564F == "" )
        thread _id_5657( var_0, var_4, var_3 );
    else
    {
        self._id_5659[self._id_5659.size] = var_0;
        self._id_5654[self._id_5654.size] = var_3;
    }
}

_id_564E( var_0, var_1 )
{
    var_2 = 2;

    if ( isdefined( game["dialog"]["lockouts"][var_0] ) )
    {
        var_2 = game["dialog"]["lockouts"][var_0];

        if ( var_2 == 0 )
            return;
    }

    if ( !isdefined( var_1._id_071B ) )
        var_1._id_071B = [];

    var_1._id_071B[var_0] = 1;
    thread _id_564D( var_0, var_1, var_2 );
}

_id_564D( var_0, var_1, var_2 )
{
    var_1 endon( "disconnect" );
    wait(var_2);
    var_1._id_071B[var_0] = undefined;
}

_id_564C( var_0, var_1 )
{
    if ( isdefined( var_1._id_071B ) )
    {
        if ( isdefined( var_1._id_071B[var_0] ) )
        {
            if ( isdefined( var_1._id_071B[var_0] == 1 ) )
                return 1;
        }
    }

    return 0;
}

_id_5657( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self notify( "playLeaderDialogOnPlayer" );
    self endon( "playLeaderDialogOnPlayer" );

    if ( isdefined( self._id_5652[var_0] ) )
    {
        var_3 = var_0;
        var_0 = self._id_5652[var_3];
        self._id_5652[var_3] = undefined;
        self._id_5651 = var_3;
    }

    if ( !isdefined( game["dialog"][var_0] ) )
        return;

    if ( _func_0CF( self ) && isdefined( level._id_161B ) && isdefined( level._id_161B["leader_dialog"] ) )
        self [[ level._id_161B["leader_dialog"] ]]( var_0, var_2 );

    if ( _func_120( game["dialog"][var_0], "null" ) )
        return;

    if ( isdefined( level._id_511D ) && level._id_511D )
    {
        if ( _func_120( var_0, "coop_gdn" ) )
            var_4 = var_0;
        else
            var_4 = "AT_anr0_" + game["dialog"][var_0];
    }
    else
        var_4 = game["voice"][var_1] + game["dialog"][var_0];

    var_5 = var_4;

    if ( level.classicgamemode )
        var_4 += "_cl";

    if ( _func_1CA( var_4 ) )
    {
        if ( _id_564C( game["dialog"][var_0], self ) )
            return;

        self._id_564F = var_4;
        self _meth_8510( var_4 );
        _id_564E( game["dialog"][var_0], self );
    }
    else if ( level.classicgamemode )
    {
        if ( _func_1CA( var_5 ) )
        {

        }
        else
        {

        }
    }
    else
    {

    }

    wait 2.0;
    self._id_5653 = "";
    self._id_564F = "";
    self._id_5651 = "";

    if ( self._id_5659.size > 0 )
    {
        var_6 = self._id_5659[0];
        var_7 = self._id_5654[0];

        for ( var_8 = 1; var_8 < self._id_5659.size; var_8++ )
            self._id_5659[var_8 - 1] = self._id_5659[var_8];

        for ( var_8 = 1; var_8 < self._id_5654.size; var_8++ )
            self._id_5654[var_8 - 1] = self._id_5654[var_8];

        self._id_5659[var_8 - 1] = undefined;
        self._id_5654[var_8 - 1] = undefined;
        thread _id_5657( var_6, var_1, var_7 );
    }
}

_id_4043()
{
    for ( var_0 = 0; var_0 < self._id_5659.size; var_0++ )
    {
        if ( _func_120( self._id_5659[var_0], "losing" ) )
        {
            if ( self._id_04A7 == "allies" )
            {
                if ( _func_120( level._id_1216, self._id_5659[var_0] ) )
                    return self._id_5659[var_0];
                else
                    common_scripts\utility::_id_0CF6( self._id_5659, self._id_5659[var_0] );
            }
            else if ( _func_120( level._id_0A7D, self._id_5659[var_0] ) )
                return self._id_5659[var_0];
            else
                common_scripts\utility::_id_0CF6( self._id_5659, self._id_5659[var_0] );

            continue;
        }

        return level._id_0A7D[self._id_5659];
    }
}

_id_657F()
{
    self endon( "disconnect" );
    var_0 = [];
    var_0 = self._id_5659;

    for ( var_1 = 0; var_1 < self._id_5659.size; var_1++ )
    {
        if ( _func_120( self._id_5659[var_1], "losing" ) )
        {
            for ( var_2 = var_1; var_2 >= 0; var_2-- )
            {
                if ( !_func_120( self._id_5659[var_2], "losing" ) && var_2 != 0 )
                    continue;

                if ( var_2 != var_1 )
                {
                    _id_0D1D( var_0, self._id_5659[var_1], var_2 );
                    common_scripts\utility::_id_0CF6( var_0, self._id_5659[var_1] );
                    break;
                }
            }
        }
    }

    self._id_5659 = var_0;
}

_id_38F6()
{
    self._id_5652 = [];
    self._id_5659 = [];
    self._id_564F = "";
    self._id_2519 = "";
    self notify( "flush_dialog" );
}

_id_38F7( var_0 )
{
    foreach ( var_2 in level._id_0323 )
        var_2 _id_38F8( var_0 );
}

_id_0D1E( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;

    while ( var_2 < var_0.size )
    {
        if ( var_0[var_2] == var_1 )
        {
            var_2++;
            continue;
        }

        if ( var_2 != var_3 )
            var_0[var_3] = var_0[var_2];

        var_2++;
        var_3++;
    }

    while ( var_3 < var_0.size )
    {
        var_0[var_3] = undefined;
        var_3++;
    }
}

_id_38F8( var_0 )
{
    self._id_5652[var_0] = undefined;
    _id_0D1E( self._id_5659, var_0 );

    if ( self._id_5659.size == 0 )
        _id_38F6();
}

_id_9B33()
{
    if ( self._id_0308["team"] == "spectator" )
        self _meth_82F9( "g_scriptMainMenu", game["menu_team"] );
    else
        self _meth_82F9( "g_scriptMainMenu", game["menu_class_" + self._id_0308["team"]] );
}

_id_9B42()
{
    if ( self._id_0308["team"] == "spectator" )
        self _meth_82F9( "cg_objectiveText", "" );
    else
    {
        if ( _id_415E( "scorelimit" ) > 0 && !_id_5160() )
        {
            if ( level._id_8A7C )
            {
                self _meth_82F9( "cg_objectiveText", _id_405B( self._id_0308["team"] ) );
                return;
            }

            self _meth_82F9( "cg_objectiveText", _id_405B( self._id_0308["team"] ), _id_415E( "scorelimit" ) );
            return;
            return;
        }

        self _meth_82F9( "cg_objectiveText", _id_405C( self._id_0308["team"] ) );
    }
}

_id_7FC5( var_0, var_1 )
{
    game["strings"]["objective_" + var_0] = var_1;
}

_id_7FC4( var_0, var_1 )
{
    game["strings"]["objective_score_" + var_0] = var_1;
}

_id_7FC3( var_0, var_1 )
{
    game["strings"]["objective_hint_" + var_0] = var_1;
}

_id_405C( var_0 )
{
    return game["strings"]["objective_" + var_0];
}

_id_405B( var_0 )
{
    return game["strings"]["objective_score_" + var_0];
}

_id_405A( var_0 )
{
    return game["strings"]["objective_hint_" + var_0];
}

_id_412C()
{
    if ( !isdefined( level._id_8D41 ) || !isdefined( level._id_2B30 ) )
        return 0;

    if ( level._id_937B )
        return level._id_937A - level._id_8D41 - level._id_2B30;
    else
        return gettime() - level._id_8D41 - level._id_2B30;
}

getunpausedtimepassedraw()
{
    if ( !isdefined( level.matchdurationstarttime ) )
        return 0;

    return gettime() - level.matchdurationstarttime;
}

getgametimepassedms()
{
    var_0 = _func_130( "gameLengthSeconds" ) * 1000;
    var_0 += getunpausedtimepassedraw();
    return var_0;
}

getgametimepassedseconds()
{
    var_0 = getgametimepassedms();
    var_1 = _func_0BC( var_0 / 1000 );
    return var_1;
}

_id_4130()
{
    return _id_412C() / _id_412B() * 60 * 1000 * 100;
}

_id_40C7()
{
    return _id_412C() / 1000;
}

_id_4024()
{
    return _id_40C7() / 60;
}

_id_4129()
{
    return _id_21A6( gettime() );
}

_id_412D()
{
    return _id_21A6( _id_412C() );
}

_id_412E()
{
    var_0 = getgametimepassedms();
    return _id_21A6( var_0 );
}

_id_21A6( var_0 )
{
    return _id_1E29( var_0 / 100 );
}

_id_1E29( var_0 )
{
    var_0 = _func_0BC( var_0 );

    if ( var_0 > 32767 )
        var_0 = 32767;

    if ( var_0 < -32768 )
        var_0 = -32768;

    return var_0;
}

_id_1E28( var_0 )
{
    var_0 = _func_0BC( var_0 );

    if ( var_0 > 255 )
        var_0 = 255;

    if ( var_0 < 0 )
        var_0 = 0;

    return var_0;
}

_id_1EF2()
{
    self._id_0196 = -1;
    self._id_0237 = -1;
    self.archivetime = 0;
    self._id_034B = 0;
    self._id_03DE = 0;
}

_id_5129()
{
    return self._id_03DE;
}

_id_51E8( var_0 )
{
    return isdefined( var_0 ) && var_0 != "";
}

_id_4150( var_0, var_1, var_2 )
{
    if ( var_0 > var_2 )
        return var_2;
    else if ( var_0 < var_1 )
        return var_1;
    else
        return var_0;
}

_id_584D()
{
    if ( !isdefined( self._id_0308["summary"] ) )
        return;

    if ( _func_0CF( self ) )
        return;

    var_0 = 0;

    if ( isdefined( self._id_9372["total"] ) )
        var_0 = self._id_9372["total"];

    _func_104( "script_EarnedXP: totalXP %d, timeplayed %d, score %d, challenge %d, match %d, misc %d, gamemode %s", self._id_0308["summary"]["xp"], var_0, self._id_0308["summary"]["score"], self._id_0308["summary"]["challenge"], self._id_0308["summary"]["match"], self._id_0308["summary"]["misc"], level._id_01B3 );
}

_id_72F7( var_0, var_1, var_2, var_3 )
{
    _id_72FD( "roundswitch", var_1 );
    var_0 = "scr_" + var_0 + "_roundswitch";
    level._id_765B = var_0;
    level._id_765D = var_2;
    level._id_765C = var_3;
    level._id_765A = getdvarint( var_0, var_1 );

    if ( level._id_765A < var_2 )
        level._id_765A = var_2;
    else if ( level._id_765A > var_3 )
        level._id_765A = var_3;
}

_id_72F6( var_0, var_1 )
{
    _id_72FD( "roundlimit", var_1 );
}

_id_72F5( var_0, var_1 )
{
    _id_72FD( "numTeams", var_1 );
}

_id_72FE( var_0, var_1 )
{
    _id_72FD( "winlimit", var_1 );
}

_id_72F8( var_0, var_1 )
{
    _id_72FD( "scorelimit", var_1 );
}

_id_72F9( var_0, var_1 )
{
    _id_72FC( "timelimit", var_1 );
    setdvar( "ui_timelimit", _id_412B() );
}

_id_72EF( var_0, var_1 )
{
    _id_72FD( "halftime", var_1 );
    setdvar( "ui_halftime", _id_3FC0() );
}

_id_72F4( var_0, var_1 )
{
    _id_72FD( "numlives", var_1 );
}

_id_7FD9( var_0 )
{
    setdvar( "overtimeTimeLimit", var_0 );
}

_id_3D27( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 1;
    var_2._id_50A8 = 0;
    var_2._id_0151 = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D29( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 0;
    var_2._id_50A8 = 0;
    var_2._id_519C = 1;
    var_2._id_0151 = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D24( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 0;
    var_2._id_50A8 = 0;
    var_2._id_0151 = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D26( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5175 = 0;
    var_2._id_50A8 = 0;
    var_2._id_0151 = var_0;
    var_2._id_258F = var_1;
    return var_2;
}

_id_3D28( var_0 )
{
    return var_0._id_02E2 + ( 0, 0, 32 );
}

_id_40E7()
{
    if ( self _meth_8180() == "crouch" )
        var_0 = self._id_02E2 + ( 0, 0, 24 );
    else if ( self _meth_8180() == "prone" )
        var_0 = self._id_02E2 + ( 0, 0, 10 );
    else
        var_0 = self._id_02E2 + ( 0, 0, 32 );

    return var_0;
}

_id_3D25( var_0 )
{
    return var_0._id_02E2;
}

_id_3F75( var_0 )
{
    var_1 = getdvar( var_0 );

    if ( var_1 == "" )
        return ( 0, 0, 0 );

    var_2 = _func_124( var_1, " " );

    if ( var_2.size < 3 )
        return ( 0, 0, 0 );

    setdvar( "tempR", var_2[0] );
    setdvar( "tempG", var_2[1] );
    setdvar( "tempB", var_2[2] );
    return ( getdvarfloat( "tempR" ), getdvarfloat( "tempG" ), getdvarfloat( "tempB" ) );
}

_id_8F5C( var_0, var_1 )
{
    if ( var_0.size <= var_1.size )
        return var_0;

    if ( _func_122( var_0, var_0.size - var_1.size, var_0.size ) == var_1 )
        return _func_122( var_0, 0, var_0.size - var_1.size );

    return var_0;
}

_id_0671( var_0 )
{
    var_1 = self _meth_8308();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
        {
            continue;
            continue;
        }

        self _meth_830C( var_3 );
    }
}

_id_7816()
{
    var_0 = spawnstruct();
    var_0._id_6343 = self _meth_8317();
    var_0._id_06F3 = self._id_7811;
    var_0._id_252D = self _meth_830E();
    var_1 = self _meth_8308();
    var_0._id_A2E6 = [];

    foreach ( var_3 in var_1 )
    {
        if ( _func_1E4( var_3 ) == "exclusive" )
            continue;

        if ( _func_1E4( var_3 ) == "altmode" )
            continue;

        var_4 = spawnstruct();
        var_4._id_02A7 = var_3;
        var_4._id_1F99 = self _meth_82F5( var_3, "right" );
        var_4._id_1F98 = self _meth_82F5( var_3, "left" );
        var_4._id_8E5E = self _meth_82F6( var_3 );

        if ( isdefined( self._id_933E ) && self._id_933E == var_3 )
            var_4._id_8E5E--;

        var_0._id_A2E6[var_0._id_A2E6.size] = var_4;
    }

    self._id_7ABC = var_0;
}

_id_74A7()
{
    var_0 = self._id_7ABC;
    self _meth_8316( var_0._id_6343 );

    foreach ( var_2 in var_0._id_A2E6 )
    {
        _id_05C0( var_2._id_02A7, _func_0BC( _func_1BB( "mp/camoTable.csv", 1, self._id_57E0, 0 ) ) );
        self _meth_82F3( var_2._id_02A7, var_2._id_1F99, "right" );

        if ( _func_120( var_2._id_02A7, "akimbo" ) )
            self _meth_82F3( var_2._id_02A7, var_2._id_1F98, "left" );

        self _meth_82F4( var_2._id_02A7, var_2._id_8E5E );
    }

    foreach ( var_6, var_5 in var_0._id_06F3 )
        _id_0634( var_6, var_5._id_04D9, var_5._id_0211 );

    if ( self _meth_830E() == "none" )
    {
        var_2 = var_0._id_252D;

        if ( var_2 == "none" )
            var_2 = common_scripts\utility::_id_3FFD();

        self _meth_824B( var_2 );
        self _meth_8312( var_2 );
    }
}

_id_7F6B( var_0 )
{
    self._id_0167 = var_0;
    _id_7FE1( "extrascore0", var_0 );
}

_id_7F6C( var_0 )
{
    self._id_0168 = var_0;
    _id_7FE1( "extrascore1", var_0 );
}

_id_0634( var_0, var_1, var_2 )
{
    self._id_7811[var_0]._id_04D9 = var_1;
    self._id_7811[var_0]._id_0211 = var_2;
    self _meth_8305( var_0, var_1, var_2 );
}

_id_510A( var_0 )
{
    if ( _func_0BC( var_0 ) != var_0 )
        return 1;

    return 0;
}

_id_72FD( var_0, var_1 )
{
    var_2 = "scr_" + level._id_01B3 + "_" + var_0;
    level._id_A214[var_2] = spawnstruct();
    level._id_A214[var_2]._id_9C53 = getdvarint( var_2, var_1 );
    level._id_A214[var_2]._id_04D9 = "int";
    level._id_A214[var_2]._id_6237 = "update_" + var_0;
}

_id_72FC( var_0, var_1 )
{
    var_2 = "scr_" + level._id_01B3 + "_" + var_0;
    level._id_A214[var_2] = spawnstruct();
    level._id_A214[var_2]._id_9C53 = getdvarfloat( var_2, var_1 );
    level._id_A214[var_2]._id_04D9 = "float";
    level._id_A214[var_2]._id_6237 = "update_" + var_0;
}

_id_72FB( var_0, var_1 )
{
    var_2 = "scr_" + level._id_01B3 + "_" + var_0;
    level._id_A214[var_2] = spawnstruct();
    level._id_A214[var_2]._id_9C53 = getdvar( var_2, var_1 );
    level._id_A214[var_2]._id_04D9 = "string";
    level._id_A214[var_2]._id_6237 = "update_" + var_0;
}

_id_7FD8( var_0, var_1 )
{
    var_0 = "scr_" + level._id_01B3 + "_" + var_0;
    level._id_662C[var_0] = var_1;
}

_id_415E( var_0 )
{
    var_0 = "scr_" + level._id_01B3 + "_" + var_0;

    if ( isdefined( level._id_662C ) && isdefined( level._id_662C[var_0] ) )
        return level._id_662C[var_0];

    return level._id_A214[var_0]._id_9C53;
}

_id_9BA3()
{
    while ( game["state"] == "playing" )
    {
        var_0 = _func_1D3( level._id_A214 );

        foreach ( var_2 in var_0 )
        {
            if ( level._id_A214[var_2]._id_04D9 == "string" )
                var_3 = _id_409E( var_2, level._id_A214[var_2]._id_9C53 );
            else if ( level._id_A214[var_2]._id_04D9 == "float" )
                var_3 = _id_3F9D( var_2, level._id_A214[var_2]._id_9C53 );
            else
                var_3 = _id_3FDB( var_2, level._id_A214[var_2]._id_9C53 );

            if ( var_3 != level._id_A214[var_2]._id_9C53 )
            {
                level._id_A214[var_2]._id_9C53 = var_3;
                level notify( level._id_A214[var_2]._id_6237, var_3 );
            }
        }

        wait 1.0;
    }
}

_id_5194()
{
    if ( !level._id_91EB )
        return 0;

    if ( _id_415E( "winlimit" ) != 1 && _id_415E( "roundlimit" ) != 1 )
        return 1;

    return 0;
}

_id_5106()
{
    if ( !level._id_91EB )
        return 1;

    if ( _id_415E( "roundlimit" ) > 1 && game["roundsPlayed"] == 0 )
        return 1;

    if ( _id_415E( "winlimit" ) > 1 && game["roundsWon"]["allies"] == 0 && game["roundsWon"]["axis"] == 0 )
        return 1;

    return 0;
}

_id_5141()
{
    if ( !level._id_91EB )
        return 1;

    if ( _id_415E( "roundlimit" ) > 1 && game["roundsPlayed"] >= _id_415E( "roundlimit" ) - 1 )
        return 1;

    if ( _id_415E( "winlimit" ) > 1 && game["roundsWon"]["allies"] >= _id_415E( "winlimit" ) - 1 && game["roundsWon"]["axis"] >= _id_415E( "winlimit" ) - 1 )
        return 1;

    return 0;
}

_id_A1CC()
{
    if ( !level._id_91EB )
        return 1;

    if ( isdefined( level._id_64BB ) )
        return 0;

    if ( _id_415E( "winlimit" ) == 1 && _id_492B() )
        return 1;

    if ( _id_415E( "roundlimit" ) == 1 )
        return 1;

    if ( isdefined( level.overridewasonlyround ) )
    {
        if ( [[ level.overridewasonlyround ]]() )
            return 1;
    }

    return 0;
}

_id_A1CA()
{
    if ( level._id_39B8 )
        return 1;

    if ( !level._id_91EB )
        return 1;

    if ( _id_4925() || _id_492B() )
        return 1;

    return 0;
}

_id_4925()
{
    if ( _id_415E( "roundlimit" ) <= 0 )
        return 0;

    return game["roundsPlayed"] >= _id_415E( "roundlimit" );
}

_id_4928()
{
    if ( _id_5160() )
        return 0;

    if ( _id_415E( "scorelimit" ) <= 0 )
        return 0;

    if ( level._id_91EB )
    {
        if ( game["teamScores"]["allies"] >= _id_415E( "scorelimit" ) || game["teamScores"]["axis"] >= _id_415E( "scorelimit" ) )
            return 1;
    }
    else
    {
        for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
        {
            var_1 = level._id_0323[var_0];

            if ( isdefined( var_1._id_038D ) && var_1._id_038D >= _id_415E( "scorelimit" ) )
                return 1;
        }
    }

    return 0;
}

_id_492B()
{
    if ( _id_415E( "winlimit" ) <= 0 )
        return 0;

    if ( !level._id_91EB )
        return 1;

    if ( _id_40BB( "allies" ) >= _id_415E( "winlimit" ) || _id_40BB( "axis" ) >= _id_415E( "winlimit" ) )
        return 1;

    return 0;
}

_id_40C2()
{
    if ( _id_5194() )
    {
        if ( _id_415E( "roundlimit" ) )
            return _id_415E( "roundlimit" );
        else
            return _id_415E( "winlimit" );
    }
    else
        return _id_415E( "scorelimit" );
}

_id_40BB( var_0 )
{
    return game["roundsWon"][var_0];
}

_id_5160()
{
    return level._id_62F8;
}

_id_412B()
{
    if ( _id_4E3F() )
    {
        var_0 = _func_0BD( getdvar( "overtimeTimeLimit" ) );

        if ( !isdefined( var_0 ) )
            var_0 = 1;

        return var_0;
    }

    return _id_415E( "timelimit" );
}

_id_3FC0()
{
    if ( _id_4E3F() )
        return 0;

    return _id_415E( "halftime" );
}

_id_4E3F()
{
    return isdefined( game["status"] ) && _id_516C( game["status"] );
}

_id_516C( var_0 )
{
    return var_0 == "overtime" || var_0 == "overtime_halftime";
}

_id_3BE2()
{
    if ( isdefined( level._id_3BE2 ) )
        return level._id_3BE2;

    if ( level._id_91EB )
        return level._id_4745["axis"] && level._id_4745["allies"];

    return level._id_5A4D > 1;
}

_id_3F0D( var_0 )
{
    var_1 = ( 0, 0, 0 );

    if ( !var_0.size )
        return undefined;

    foreach ( var_3 in var_0 )
        var_1 += var_3._id_02E2;

    var_5 = _func_0BC( var_1[0] / var_0.size );
    var_6 = _func_0BC( var_1[1] / var_0.size );
    var_7 = _func_0BC( var_1[2] / var_0.size );
    var_1 = ( var_5, var_6, var_7 );
    return var_1;
}

_id_4008( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_0323 )
    {
        if ( !_func_1A1( var_3 ) )
            continue;

        if ( level._id_91EB && isdefined( var_0 ) )
        {
            if ( var_0 == var_3._id_0308["team"] )
                var_1[var_1.size] = var_3;

            continue;
        }

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_834D( var_0 )
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5.alpha = 0;

    self._id_9C34 = var_0;
    common_scripts\utility::_id_0585();
    self notify( "using_remote" );
}

_id_40B7()
{
    return self._id_9C34;
}

_id_3A32( var_0 )
{
    if ( isdefined( level._id_4A39 ) || _id_5092( self.phfrozen ) )
    {
        self _meth_8326( 1 );
        return;
    }

    self _meth_8326( var_0 );
    self._id_219B = var_0;
}

_id_3A33( var_0, var_1 )
{
    wait(var_1);

    if ( isdefined( self ) )
        _id_3A32( var_0 );
}

_id_1F0D()
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5.alpha = 1;

    self._id_9C34 = undefined;
    common_scripts\utility::_id_0593();
    var_0 = self _meth_830E();

    if ( var_0 == "none" || _id_513D( var_0 ) )
        self _meth_8312( common_scripts\utility::_id_3FFD() );

    _id_3A32( 0 );
    _id_6D2F();
    self notify( "stopped_using_remote" );
}

_id_6D2E()
{
    self _meth_82F8( "ui_killstreak_remote", 1 );
}

_id_6D2F()
{
    self _meth_82F8( "ui_killstreak_remote", 0 );
}

_id_3EC4()
{
    if ( isdefined( self._id_9A21 ) )
    {
        if ( self._id_9A21 == "shallow" && isdefined( level._id_83B2 ) )
            return level._id_83B2;

        if ( self._id_9A21 == "deep" && isdefined( level._id_2764 ) )
            return level._id_2764;

        if ( self._id_9A21 != "none" && isdefined( level._id_83B2 ) )
            return level._id_83B2;
    }

    return "none";
}

_id_51E3()
{
    return isdefined( self._id_9C34 );
}

_id_512B()
{
    return isdefined( self._id_7329 );
}

_id_5193()
{
    return isdefined( self._id_5193 ) && self._id_5193;
}

_id_7098( var_0 )
{
    if ( !isdefined( level._id_709B ) )
        level._id_709B = [];

    level._id_709B[var_0] = [];
}

_id_7096( var_0, var_1 )
{
    level._id_709B[var_0][level._id_709B[var_0].size] = var_1;
}

_id_709A( var_0 )
{
    var_1 = undefined;
    var_2 = [];

    foreach ( var_4 in level._id_709B[var_0] )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_4;
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    level._id_709B[var_0] = var_2;
    return var_1;
}

_id_05C0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = -1;

    var_3 = 0;

    if ( isdefined( self._id_0308["toggleScopeStates"] ) && isdefined( self._id_0308["toggleScopeStates"][var_0] ) )
        var_3 = self._id_0308["toggleScopeStates"][var_0];

    if ( _func_120( var_0, "akimbo" ) || isdefined( var_2 ) && var_2 == 1 )
    {
        if ( _func_1FF( self ) )
            self _meth_830B( var_0, var_1, 1, -1, 0 );
        else
            self _meth_830B( var_0, var_1, 1, -1, 0, self, var_3 );
    }
    else if ( _func_1FF( self ) )
        self _meth_830B( var_0, var_1, 0, -1, 0 );
    else
        self _meth_830B( var_0, var_1, 0, -1, 0, self, var_3 );
}

_id_05CB( var_0 )
{
    if ( isdefined( self._id_0306 ) && isdefined( self._id_0306[var_0] ) )
        return 1;

    return 0;
}

_id_41F8( var_0, var_1, var_2 )
{
    _id_063C( var_0, var_1, var_2 );
}

_id_063C( var_0, var_1, var_2 )
{
    self._id_0306[var_0] = 1;
    self._id_67D2[var_0] = var_0;
    self._id_67D4[var_0] = var_1;

    if ( isdefined( level._id_67D1[var_0] ) )
        self thread [[ level._id_67D1[var_0] ]]();

    var_3 = _id_8F5C( var_0, "_lefthand" );

    if ( isdefined( var_2 ) )
        self _meth_82A2( var_0, !isdefined( level._id_7B45[var_3] ), var_1, var_2 );
    else
        self _meth_82A2( var_0, !isdefined( level._id_7B45[var_3] ), var_1 );
}

_id_067B( var_0 )
{
    self._id_0306[var_0] = undefined;
    self._id_67D2[var_0] = undefined;
    self._id_67D4[var_0] = undefined;
    self._id_67D3[var_0] = undefined;

    if ( isdefined( level._id_67D5[var_0] ) )
        self thread [[ level._id_67D5[var_0] ]]();

    var_1 = _id_8F5C( var_0, "_lefthand" );
    self _meth_82A5( var_0, !isdefined( level._id_7B45[var_1] ) );
}

_id_056B()
{
    foreach ( var_2, var_1 in self._id_0306 )
    {
        if ( isdefined( level._id_67D5[var_2] ) )
            self [[ level._id_67D5[var_2] ]]();
    }

    self._id_0306 = [];
    self._id_67D2 = [];
    self._id_67D4 = [];
    self._id_67D3 = [];
    self.perkscustom = [];
    self _meth_82A4();
}

_id_1AC8( var_0 )
{
    return _id_0562( var_0 );
}

_id_0562( var_0 )
{
    if ( !isdefined( level._id_06B6 ) || !isdefined( level._id_06B6[var_0] ) )
        return 1;

    return self [[ level._id_06B6[var_0] ]]();
}

_id_41DC( var_0, var_1 )
{
    _id_0633( var_0, var_1 );
}

_id_0633( var_0, var_1 )
{
    self._id_06B5[var_0] = 1;

    if ( _func_1AD( self ) )
    {
        if ( isdefined( level._id_06B8[var_0] ) )
            self thread [[ level._id_06B8[var_0] ]]();
    }

    self _meth_82A2( var_0, !isdefined( level._id_7B28[var_0] ), var_1 );
}

_id_067A( var_0 )
{
    self._id_06B5[var_0] = undefined;

    if ( _func_1AD( self ) )
    {
        if ( isdefined( level._id_06B9[var_0] ) )
            self thread [[ level._id_06B9[var_0] ]]();
    }

    self _meth_82A5( var_0, !isdefined( level._id_7B28[var_0] ) );
}

_id_0566()
{
    if ( _func_1AD( self ) )
    {
        if ( isdefined( level._id_06B9[self._id_0308["ability"]] ) )
            self [[ level._id_06B9[self._id_0308["ability"]] ]]();
    }

    self._id_06B5 = [];
    self _meth_82A4();
}

_id_05CA( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
    {
        if ( isdefined( self._id_06B5[var_0] ) && self._id_06B5[var_0] )
            return 1;
    }
    else if ( isdefined( self._id_0308["ability"] ) && self._id_0308["ability"] == var_0 && isdefined( self._id_0308["abilityOn"] ) && self._id_0308["abilityOn"] )
        return 1;

    return 0;
}

_id_70A4( var_0, var_1 )
{
    return _id_70A7( var_0, 0, var_0.size - 1, var_1 );
}

_id_70A7( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1;
    var_5 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ::_id_70A5;

    if ( var_2 - var_1 >= 1 )
    {
        var_6 = var_0[var_1];

        while ( var_5 > var_4 )
        {
            while ( [[ var_3 ]]( var_0[var_4], var_6 ) && var_4 <= var_2 && var_5 > var_4 )
                var_4++;

            while ( ![[ var_3 ]]( var_0[var_5], var_6 ) && var_5 >= var_1 && var_5 >= var_4 )
                var_5--;

            if ( var_5 > var_4 )
                var_0 = _id_9001( var_0, var_4, var_5 );
        }

        var_0 = _id_9001( var_0, var_1, var_5 );
        var_0 = _id_70A7( var_0, var_1, var_5 - 1, var_3 );
        var_0 = _id_70A7( var_0, var_5 + 1, var_2, var_3 );
    }
    else
        return var_0;

    return var_0;
}

_id_70A5( var_0, var_1 )
{
    return var_0 <= var_1;
}

_id_9001( var_0, var_1, var_2 )
{
    var_3 = var_0[var_1];
    var_0[var_1] = var_0[var_2];
    var_0[var_2] = var_3;
    return var_0;
}

_id_066F()
{
    if ( _id_51E3() && !isdefined( self._id_3693 ) )
        thread maps\mp\gametypes\_damage::_id_6CD8( self, self, self, 10000, "MOD_SUICIDE", "h1_fraggrenade_mp", ( 0, 0, 0 ), "none", 0, 1116, 1, 0 );
    else if ( !_id_51E3() && !isdefined( self._id_3693 ) )
        self _meth_8267();
}

_id_5189( var_0 )
{
    if ( _func_1A1( var_0 ) && !isdefined( var_0._id_3693 ) )
        return 1;

    return 0;
}

_id_A075( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        thread common_scripts\utility::_id_A0BA( var_1, var_6 );

    if ( isdefined( var_2 ) )
        thread common_scripts\utility::_id_A0BA( var_2, var_6 );

    if ( isdefined( var_3 ) )
        thread common_scripts\utility::_id_A0BA( var_3, var_6 );

    if ( isdefined( var_4 ) )
        thread common_scripts\utility::_id_A0BA( var_4, var_6 );

    if ( isdefined( var_5 ) )
        thread common_scripts\utility::_id_A0BA( var_5, var_6 );

    var_6 thread _id_0677( var_0, self );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_0677( var_0, var_1 )
{
    self endon( "die" );

    for ( var_2 = 0.05; var_0 > 0; var_0 -= var_2 )
    {
        if ( _func_1AD( var_1 ) && !_id_5189( var_1 ) )
            var_1 waittill( "spawned_player" );

        if ( getdvarint( "ui_inprematch" ) )
            level waittill( "prematch_over" );

        wait(var_2);
    }

    self notify( "returned", "timeout" );
}

_id_6A3F()
{
    if ( isdefined( level.customplaydeathsound ) )
        self thread [[ level.customplaydeathsound ]]();
    else
    {
        var_0 = _func_0B4( 1, 8 );

        if ( self._id_04A7 == "axis" )
        {
            if ( self _meth_8435() )
                self _meth_809C( "generic_death_enemy_fm_" + var_0 );
            else
                self _meth_809C( "generic_death_enemy_" + var_0 );
        }
        else
        {
            if ( self _meth_8435() )
            {
                self _meth_809C( "generic_death_friendly_fm_" + var_0 );
                return;
            }

            self _meth_809C( "generic_death_friendly_" + var_0 );
        }
    }
}

_id_7139()
{
    if ( !_func_1AD( self ) )
        return 0;

    return level._id_7137 && !self._id_9C30;
}

_id_6FD0()
{
    return !level._id_64B8 || getdvarint( "xblive_privatematch" );
}

_id_59E3()
{
    return level._id_64B8 && !getdvarint( "xblive_privatematch" );
}

_id_7F1F( var_0, var_1, var_2, var_3 )
{

}

_id_31C2( var_0 )
{
    self endon( "altscene" );
    var_0 waittill( "death" );
    self notify( "end_altScene" );
}

_id_4015()
{
    return getdvar( "mapname" );
}

_id_3FAA()
{
    return _id_415E( "numlives" );
}

_id_0D1D( var_0, var_1, var_2 )
{
    if ( var_0.size != 0 )
    {
        for ( var_3 = var_0.size; var_3 >= var_2; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];
    }

    var_0[var_2] = var_1;
}

_id_409E( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvar( var_0, var_1 );
    return var_2;
}

_id_3FDB( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarint( var_0, var_1 );
    return var_2;
}

_id_3F9D( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarfloat( var_0, var_1 );
    return var_2;
}

_id_50DE()
{
    return isdefined( self._id_1C87 );
}

_id_537A( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_0.requireddeathcount ) && isdefined( self._id_010D ) && self._id_010D != var_0.requireddeathcount )
        return 0;

    return 1;
}

_id_5131()
{
    if ( isdefined( self._id_5131 ) && self._id_5131 == 1 )
        return 1;

    if ( isdefined( self._id_5132 ) && self._id_5132 == 1 )
        return 1;

    if ( isdefined( self._id_5133 ) && self._id_5133 == 1 )
        return 1;

    if ( isdefined( self._id_5135 ) && self._id_5135 == 1 )
        return 1;

    if ( isdefined( self._id_5134 ) && self._id_5134 == 1 )
        return 1;

    return 0;
}

_id_513D( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    switch ( var_0 )
    {
        case "artillery_mp":
        case "cobra_ffar_mp":
        case "hind_ffar_mp":
        case "cobra_20mm_mp":
        case "radar_mp":
        case "airstrike_mp":
        case "helicopter_mp":
            return 1;
        default:
            break;
    }

    return 0;
}

_id_50F3( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "destructible":
        case "destructible_toy":
        case "destructible_car":
        case "barrel_mp":
            return 1;
    }

    return 0;
}

_id_50C4()
{
    return getdvarint( "scr_game_high_jump", 0 );
}

isdivisionmode()
{
    return getdvarint( "scr_game_division", 0 );
}

_id_50C9( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "briefcase_bomb_mp":
        case "briefcase_bomb_mp_defuse_mp":
        case "bomb_site_mp":
            return 1;
    }

    return 0;
}

_id_50FE( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "turret_minigun_mp" )
        return 1;

    if ( _func_120( var_0, "_bipod_" ) )
        return 1;

    return 0;
}

_id_514D( var_0 )
{
    return 0;
}

ismeleeweapon( var_0 )
{
    switch ( var_0 )
    {
        case "h1_meleebayonet_mp":
        case "h1_meleeblade_mp":
        case "h1_meleebottle_mp":
        case "h1_meleeicepick_mp":
        case "h1_meleepaddle_mp":
        case "h1_meleeshovel_mp":
            return 1;
        default:
            return 0;
    }
}

_id_416C( var_0 )
{
    return _func_124( var_0, "_" );
}

_id_4167( var_0 )
{
    var_1 = _id_3F11( var_0 );
    var_2 = _func_1BB( "mp/statstable.csv", 4, var_1, 2 );

    if ( var_2 == "" )
    {
        var_3 = _id_8F5C( var_0, "_lefthand" );
        var_3 = _id_8F5C( var_3, "_mp" );
        var_2 = _func_1BB( "mp/statstable.csv", 4, var_3, 2 );
    }

    if ( _id_50FE( var_0 ) )
        var_2 = "weapon_mg";
    else if ( _id_513D( var_0 ) )
        var_2 = "killstreak";
    else if ( var_0 == "none" )
        var_2 = "other";
    else if ( var_2 == "" )
        var_2 = "other";

    return var_2;
}

_id_4160( var_0 )
{
    var_0 = _id_3F11( var_0 );

    if ( !isdefined( level._id_A2D3[var_0] ) )
    {
        var_1 = [];

        for ( var_2 = 0; var_2 <= 29; var_2++ )
        {
            var_3 = _func_1BB( "mp/statsTable.csv", 4, var_0, 11 + var_2 );

            if ( var_3 == "" )
                break;

            var_1[var_1.size] = var_3;
        }

        level._id_A2D3[var_0] = var_1;
    }

    return level._id_A2D3[var_0];
}

_id_4162( var_0, var_1 )
{
    var_0 = _id_3F11( var_0 );
    return _func_1BB( "mp/statsTable.csv", 4, var_0, 11 + var_1 );
}

getbasearrayforattachkit( var_0 )
{
    if ( !isdefined( level.baseattachkits ) )
        level.baseattachkits = [];

    if ( !isdefined( level.baseattachkits[var_0] ) )
    {
        var_1 = 2;
        var_2 = 5;
        var_3 = _func_1BF( "mp/attachkits.csv", 1, var_0 );
        var_4 = [];

        for ( var_5 = var_1; var_5 <= var_2; var_5++ )
        {
            var_6 = _func_1BC( "mp/attachkits.csv", var_3, var_5 );

            if ( var_6 != "" )
                var_4[var_4.size] = var_6;
        }

        level.baseattachkits[var_0] = var_4;
    }

    return level.baseattachkits[var_0];
}

getgroupforattachkitbase( var_0 )
{
    if ( !isdefined( level.attachkitgroup ) )
        level.attachkitgroup = [];

    if ( !isdefined( level.attachkitgroup[var_0] ) )
    {
        var_1 = 2;
        var_2 = _func_1BF( "mp/attachmentbase.csv", 1, var_0 );
        level.attachkitgroup[var_0] = _func_1BC( "mp/attachmentbase.csv", var_2, var_1 );
    }

    return level.attachkitgroup[var_0];
}

_id_3F11( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 == "none" || var_0 == "" )
        return var_0;

    var_1 = _id_416C( var_0 );
    var_2 = "";

    if ( var_1[0] == "iw5" || var_1[0] == "iw6" || var_1[0] == "s1" || var_1[0] == "h1" )
        var_2 = var_1[0] + "_" + var_1[1];
    else if ( var_1[0] == "alt" )
        var_2 = var_1[1] + "_" + var_1[2];
    else if ( var_1.size > 1 && ( var_1[1] == "grenade" || var_1[1] == "marker" ) )
        var_2 = var_1[0] + "_" + var_1[1];
    else
        var_2 = var_1[0];

    return var_2;
}

_id_6DDC( var_0, var_1 )
{
    _func_1A8( var_1, var_0 );
}

_id_5764( var_0, var_1 )
{
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        var_2 *= 10;

    var_4 = var_0 * var_2;
    var_4 = _func_0BC( var_4 );
    var_4 /= var_2;
    return var_4;
}

_id_7651( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "nearest";

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_3 *= 10;

    var_5 = var_0 * var_3;

    if ( var_2 == "up" )
        var_6 = _func_0E3( var_5 );
    else if ( var_2 == "down" )
        var_6 = _func_0E2( var_5 );
    else
        var_6 = var_5 + 0.5;

    var_5 = _func_0BC( var_6 );
    var_5 /= var_3;
    return var_5;
}

_id_6CA5( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2._id_1F0F == var_0 )
            return var_2;
    }

    return undefined;
}

_id_8F5A( var_0 )
{
    var_1 = _func_124( var_0, "." );
    var_2 = _func_0BC( var_1[0] );

    if ( isdefined( var_1[1] ) )
    {
        var_3 = 1;

        for ( var_4 = 0; var_4 < var_1[1].size; var_4++ )
            var_3 *= 0.1;

        var_2 += _func_0BC( var_1[1] ) * var_3;
    }

    return var_2;
}

_id_8005( var_0 )
{
    self _meth_80C1();

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2 != var_0 )
        {
            self _meth_800B( var_2 );
            continue;
        }

        self _meth_800A( var_2 );
    }
}

_id_8004()
{
    self _meth_80C2();

    foreach ( var_1 in level._id_0323 )
        self _meth_800B( var_1 );
}

_id_594B( var_0 )
{
    self _meth_80C1();
    thread _id_0681( var_0 );
}

_id_0681( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        foreach ( var_2 in level._id_0323 )
        {
            if ( var_2._id_04A7 == var_0 )
            {
                self _meth_800A( var_2 );
                continue;
            }

            self _meth_800B( var_2 );
        }

        level waittill( "joined_team" );
    }
}

_id_593F( var_0 )
{
    self _meth_80C1();
    thread _id_067E( var_0 );
}

_id_067E( var_0 )
{
    self endon( "death" );
    var_1 = var_0._id_04A7;

    for (;;)
    {
        if ( level._id_91EB )
        {
            foreach ( var_3 in level._id_0323 )
            {
                if ( var_3._id_04A7 != var_1 )
                {
                    self _meth_800A( var_3 );
                    continue;
                }

                self _meth_800B( var_3 );
            }
        }
        else
        {
            foreach ( var_3 in level._id_0323 )
            {
                if ( var_3 != var_0 )
                {
                    self _meth_800A( var_3 );
                    continue;
                }

                self _meth_800B( var_3 );
            }
        }

        level waittill( "joined_team" );
    }
}

_id_403F()
{
    var_0 = _func_130( "lifeCount" );

    if ( var_0 < level._id_5A40 )
    {
        _func_12F( "lifeCount", var_0 + 1 );
        return var_0;
    }
    else
        return level._id_5A40 - 1;
}

_id_4DC0()
{
    if ( !isdefined( game["flags"] ) )
        game["flags"] = [];
}

_id_3BDF( var_0, var_1 )
{
    game["flags"][var_0] = var_1;
}

_id_3BDD( var_0 )
{
    return game["flags"][var_0];
}

gameflagexists( var_0 )
{
    return isdefined( game["flags"][var_0] );
}

_id_3BE0( var_0 )
{
    game["flags"][var_0] = 1;
    level notify( var_0 );
}

_id_3BDE( var_0 )
{
    game["flags"][var_0] = 0;
}

_id_3BE1( var_0 )
{
    while ( !_id_3BDD( var_0 ) )
        level waittill( var_0 );
}

_id_50CD( var_0 )
{
    var_1 = "MOD_RIFLE_BULLET MOD_PISTOL_BULLET MOD_HEAD_SHOT";

    if ( _func_120( var_1, var_0 ) )
        return 1;

    return 0;
}

_id_510C( var_0, var_1, var_2 )
{
    return isdefined( var_2 ) && _func_1AD( var_2 ) && var_2 _id_05CB( "specialty_bulletpenetration" ) && isdefined( var_1 ) && _id_50CD( var_1 );
}

_id_4DF0()
{
    if ( !isdefined( level._id_56DC ) )
        level._id_56DC = [];
}

_id_56DB( var_0, var_1 )
{
    level._id_56DC[var_0] = var_1;
}

_id_56D9( var_0 )
{
    return level._id_56DC[var_0];
}

_id_56DD( var_0 )
{
    level._id_56DC[var_0] = 1;
    level notify( var_0 );
}

_id_56DA( var_0 )
{
    level._id_56DC[var_0] = 0;
    level notify( var_0 );
}

_id_56DE( var_0 )
{
    while ( !_id_56D9( var_0 ) )
        level waittill( var_0 );
}

_id_56DF( var_0 )
{
    while ( _id_56D9( var_0 ) )
        level waittill( var_0 );
}

_id_4FA6()
{
    if ( !isdefined( level._id_9E56 ) || level._id_9E56 == 0 )
        return 0;

    return 1;
}

_id_4DC1()
{
    if ( !isdefined( level._id_4231 ) )
    {
        level._id_4231["killstreakTable"] = spawnstruct();
        level._id_4231["killstreakTable"]._id_66BD = "mp/killstreakTable.csv";
        level._id_4231["killstreakTable"]._id_4C41 = 0;
        level._id_4231["killstreakTable"]._id_72AB = 1;
        level._id_4231["killstreakTable"]._id_603D = 2;
        level._id_4231["killstreakTable"]._id_28AF = 3;
        level._id_4231["killstreakTable"]._id_0866 = 4;
        level._id_4231["killstreakTable"]._id_300A = 5;
        level._id_4231["killstreakTable"]._id_889A = 6;
        level._id_4231["killstreakTable"]._id_3009 = 7;
        level._id_4231["killstreakTable"]._id_0A6A = 8;
        level._id_4231["killstreakTable"]._id_6535 = 9;
        level._id_4231["killstreakTable"]._id_3293 = 10;
        level._id_4231["killstreakTable"]._id_A2BD = 11;
        level._id_4231["killstreakTable"]._id_788A = 12;
        level._id_4231["killstreakTable"]._id_4B2A = 13;
        level._id_4231["killstreakTable"]._id_65F0 = 14;
        level._id_4231["killstreakTable"]._id_65F1 = 15;
        level._id_4231["killstreakTable"]._id_65F2 = 16;
        level._id_4231["killstreakTable"]._id_65F3 = 17;
        level._id_4231["killstreakTable"]._id_2D94 = 18;
        level._id_4231["killstreakTable"]._id_9A24 = 19;
    }
}

_id_513B()
{
    if ( _id_4FA6() )
        return 0;

    return _id_50F9() || _id_50AE();
}

_id_50F9()
{
    if ( self._id_04A7 == "spectator" )
        return 0;

    if ( _id_4FA6() )
        return 0;

    return 0;
}

_id_50FA()
{
    if ( self._id_04A7 == "spectator" )
        return 0;

    if ( _id_4FA6() )
        return 0;

    return 0;
}

_id_50AE()
{
    return 0;
}

_id_515F()
{
    if ( self._id_04A7 == "spectator" )
        return 0;

    return isdefined( self._id_626B );
}

_id_408B( var_0 )
{
    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2._id_4450 == var_0 )
            return var_2;
    }

    return undefined;
}

_id_91FA( var_0, var_1, var_2, var_3 )
{
    if ( level._id_46CA )
        return;

    foreach ( var_5 in level._id_0323 )
    {
        if ( isdefined( var_2 ) && var_5._id_04A7 != var_2 )
            continue;

        if ( !_func_1AD( var_5 ) )
            continue;

        var_5 thread maps\mp\gametypes\_hud_message::_id_6C6F( var_0, var_1, var_3 );
    }
}

_id_50D1( var_0 )
{
    switch ( _id_4167( var_0 ) )
    {
        case "weapon_smg":
        case "weapon_assault":
        case "weapon_riot":
        case "weapon_sniper":
        case "weapon_lmg":
        case "weapon_shotgun":
        case "weapon_heavy":
        case "weapon_special":
            return 1;
        default:
            return 0;
    }
}

_id_50D2( var_0 )
{
    switch ( _id_4167( var_0 ) )
    {
        case "weapon_projectile":
        case "weapon_pistol":
        case "weapon_machine_pistol":
        case "weapon_sec_special":
            return 1;
        default:
            return 0;
    }
}

iscacmeleeweapon( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    switch ( _id_4167( var_0 ) )
    {
        case "weapon_melee":
            return 1;
        default:
            return 0;
    }
}

_id_3FFC( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level._id_0323 )
    {
        if ( isdefined( var_0 ) && var_3._id_04A7 != var_0 )
            continue;

        if ( !_id_5189( var_3 ) && !var_3 maps\mp\gametypes\_playerlogic::_id_5A62() )
            continue;

        var_1 = var_3;
    }

    return var_1;
}

_id_4093()
{
    var_0 = [];

    foreach ( var_2 in level._id_0323 )
    {
        if ( !_id_5189( var_2 ) && !var_2 maps\mp\gametypes\_playerlogic::_id_5A62() )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_A0ED( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_2 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    for (;;)
    {
        if ( self._id_01E6 != self._id_0271 )
            var_2 = 0;
        else
            var_2 += var_1;

        wait(var_1);

        if ( self._id_01E6 == self._id_0271 && var_2 >= var_0 )
            break;
    }

    return;
}

_id_50BE( var_0, var_1 )
{
    var_2 = _func_124( var_0, "_" );
    return _id_50BF( var_2, var_1 );
}

_id_50BF( var_0, var_1 )
{
    var_2 = 0;

    if ( var_0.size && isdefined( var_1 ) )
    {
        var_3 = 0;

        if ( var_0[0] == "alt" )
            var_3 = 1;

        if ( var_0.size >= 3 + var_3 && ( var_0[var_3] == "iw5" || var_0[var_3] == "iw6" || var_0[var_3] == "h1" ) )
        {
            if ( _func_1B8( var_0[var_3] + "_" + var_0[var_3 + 1] + "_" + var_0[var_3 + 2] ) == "sniper" )
                var_2 = var_0[var_3 + 1] + "scope" == var_1;
        }
    }

    return var_2;
}

_id_4163( var_0 )
{
    var_1 = _func_061( var_0 );

    foreach ( var_4, var_3 in var_1 )
        var_1[var_4] = _id_0E02( var_3 );

    return var_1;
}

_id_3F09()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = _func_1BB( "mp/attachmentTable.csv", 0, var_1, 4 ); var_2 != ""; var_2 = _func_1BB( "mp/attachmentTable.csv", 0, var_1, 4 ) )
    {
        if ( !common_scripts\utility::_id_0CE4( var_0, var_2 ) )
            var_0[var_0.size] = var_2;

        var_1++;
    }

    return var_0;
}

_id_3F0A()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = _func_1BC( "mp/attachoverrides.csv", var_1, 2 ); var_2 != ""; var_2 = _func_1BC( "mp/attachoverrides.csv", var_1, 2 ) )
    {
        var_0[var_0.size] = var_2;
        var_1++;
    }

    return var_0;
}

_id_1876()
{
    var_0 = _id_3F0A();
    level._id_0E04 = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = _func_1BB( "mp/attachoverrides.csv", 2, var_2, 1 );

        if ( var_2 == var_3 )
            continue;

        level._id_0E04[var_2] = var_3;
    }
}

_id_0E02( var_0 )
{
    if ( isdefined( level._id_0E04[var_0] ) )
        var_0 = level._id_0E04[var_0];

    return var_0;
}

_id_0603( var_0 )
{
    objective_delete( var_0 );

    if ( !isdefined( level._id_7266 ) )
    {
        level._id_7266 = [];
        level._id_7266[0] = var_0;
    }
    else
        level._id_7266[level._id_7266.size] = var_0;
}

_id_9409()
{
    var_0 = getentarray( "trigger_hurt", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( self _meth_80AB( var_2 ) )
            return 1;
    }

    var_4 = getentarray( "radiation", "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( self _meth_80AB( var_2 ) )
            return 1;
    }

    if ( isdefined( level._id_511D ) && level._id_511D )
    {
        if ( _id_4015() == "mp_torqued" )
        {
            if ( isdefined( level.hordeavalanche ) && level.hordeavalanche && isdefined( level.dyneventavalanche._id_8D7C ) && level.dyneventavalanche._id_8D7C != "post_avalanche" )
            {
                var_7 = getentarray( "quake_kill_volume01", "targetname" );

                foreach ( var_9 in var_7 )
                {
                    if ( self _meth_80AB( var_9 ) )
                        return 1;
                }
            }
        }
        else if ( _id_4015() == "mp_lost" )
        {
            foreach ( var_12 in level.hordekilltriggers )
            {
                if ( self _meth_80AB( var_12 ) )
                    return 1;
            }
        }
    }

    if ( getdvar( "g_gametype" ) == "hp" && isdefined( level._id_A3DD ) && isdefined( level._id_A3DD._id_9754 ) && self _meth_80AB( level._id_A3DD._id_9754 ) )
        return 1;

    return 0;
}

_id_8031( var_0 )
{
    if ( var_0 )
        self _meth_818A( 0, 110, 512, 4096, 6, 1.8 );
    else
        self _meth_818A( 0, 0, 512, 512, 4, 0 );
}

_id_53B2( var_0, var_1, var_2 )
{
    var_3 = spawn( "trigger_radius", var_0, 0, var_1, var_2 );

    for (;;)
    {
        var_3 waittill( "trigger", var_4 );

        if ( !_func_1AD( var_4 ) )
            continue;

        var_4 _meth_8267();
    }
}

_id_3782( var_0, var_1, var_2 )
{
    var_3 = _func_0B7( var_2 );
    var_4 = anglestoforward( var_0.angles );
    var_5 = var_1._id_02E2 - var_0._id_02E2;
    var_4 *= ( 1, 1, 0 );
    var_5 *= ( 1, 1, 0 );
    var_5 = _func_114( var_5 );
    var_4 = _func_114( var_4 );
    var_6 = _func_0F6( var_5, var_4 );

    if ( var_6 >= var_3 )
        return 1;
    else
        return 0;
}

_id_2DD9( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_0BC( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_2DE3( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_0BC( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_7FFB( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( self._id_7268 ) )
        self._id_7268 = var_0;
    else
        self._id_7268 += var_0;

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( self._id_7268 ) && var_1 < self._id_7268 )
            var_1 = self._id_7268;

        var_2 = 100 - var_1;
    }
    else
        var_2 = 100 - self._id_7268;

    if ( var_2 < 0 )
        var_2 = 0;

    if ( var_2 > 100 )
        var_2 = 100;

    if ( var_2 == 100 )
    {
        self _meth_82E0();
        return;
    }

    self _meth_82DF( var_2 );
}

_id_1E5D( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_0[var_4];
    }

    return var_1;
}

_id_6240( var_0 )
{
    self notify( "notusablejoiningplayers" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self endon( "notusablejoiningplayers" );

    for (;;)
    {
        level waittill( "player_spawned", var_1 );

        if ( isdefined( var_1 ) && var_1 != var_0 )
            self _meth_800B( var_1 );
    }
}

_id_51BA( var_0, var_1 )
{
    return _func_122( var_0, 0, var_1.size ) == var_1;
}

_id_2AF1()
{
    level._id_53A6 = 1;
}

_id_3107()
{
    level._id_53A6 = undefined;
}

_id_9C4F( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        var_2 = var_0;
    else
    {
        var_3 = self._id_0308["killstreaks"];
        var_2 = var_3[self._id_539D]._id_8F26;
    }

    if ( isdefined( level._id_53A6 ) && level._id_53A6 )
        return 0;

    if ( !self _meth_833E() && _id_5191( var_2 ) )
        return 0;

    if ( _id_51E3() || _id_512B() )
        return 0;

    if ( isdefined( self._id_7C6F ) )
        return 0;

    if ( _id_84A5( var_2 ) && level._id_53A2 )
    {
        var_4 = 0;

        if ( isdefined( level._id_6F07 ) )
            var_4 = ( gettime() - level._id_6F07 ) / 1000;

        if ( var_4 < level._id_53A2 )
        {
            var_5 = _func_0BC( level._id_53A2 - var_4 + 0.5 );

            if ( !var_5 )
                var_5 = 1;

            if ( !( isdefined( var_1 ) && var_1 ) )
                self _meth_826A( &"MP_UNAVAILABLE_FOR_N", var_5 );

            return 0;
        }
    }

    if ( _id_50F9() && ( !isdefined( level.iszombiegame ) || !level.iszombiegame ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
        {
            if ( isdefined( level._id_3091 ) && level._id_3091 > 0 )
                self _meth_826A( &"MP_UNAVAILABLE_FOR_N_WHEN_EMP", level._id_3091 );
            else if ( isdefined( self._id_3082 ) && _func_0BC( ( self._id_3082 - gettime() ) / 1000 ) > 0 )
                self _meth_826A( &"MP_UNAVAILABLE_FOR_N", _func_0BC( ( self._id_3082 - gettime() ) / 1000 ) );
        }

        return 0;
    }

    if ( self _meth_833F() && ( _id_5191( var_2 ) || _id_50DC( var_2 ) ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            self _meth_826A( &"MP_UNAVAILABLE_USING_TURRET" );

        return 0;
    }

    if ( isdefined( self._id_0249 ) && !_id_05CB( "specialty_finalstand" ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            self _meth_826A( &"MP_UNAVILABLE_IN_LASTSTAND" );

        return 0;
    }

    if ( !common_scripts\utility::_id_5207() )
        return 0;

    return 1;
}

_id_5191( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 0;
    }
}

_id_50DC( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 0;
    }
}

_id_84A5( var_0 )
{
    return 0;
}

_id_5138( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 1;
    }
}

_id_5139( var_0 )
{
    return _id_5138( var_0 ) && !_id_510B( var_0 );
}

_id_510B( var_0 )
{
    switch ( var_0 )
    {
        default:
            return 1;
    }
}

_id_50B5( var_0 )
{
    var_1 = _id_3FE1( var_0 );

    if ( !isdefined( var_1 ) )
        return 0;

    if ( _func_0BC( var_1 ) == 1 )
        return 1;

    return 0;
}

_id_3FF5( var_0 )
{
    return _func_1BF( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0 );
}

_id_3FEE( var_0 )
{
    var_1 = "mp/killstreakTable.csv";
    var_2 = 0;
    var_3 = 1;
    var_4 = _func_1BB( var_1, var_3, var_0, var_2 );

    if ( var_4 == "" )
        var_5 = -1;
    else
        var_5 = _func_0BC( var_4 );

    return var_5;
}

_id_3FF4( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_72AB );
}

_id_3FF2( var_0 )
{
    return _func_1BD( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_603D );
}

_id_3FE4( var_0 )
{
    return _func_1BD( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_28AF );
}

_id_3FF0( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_0866 );
}

_id_3FE8( var_0 )
{
    return _func_1BD( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_300A );
}

_id_3FF7( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_889A );
}

_id_3FE7( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_3009 );
}

_id_3FE0( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_0A6A );
}

_id_3FE9( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_3222 );
}

_id_3FEA( var_0 )
{
    return _func_0BC( _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_3293 ) );
}

_id_3FF9( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1.size > 0 )
    {
        var_2 = _id_05B6( var_0, var_1 );

        if ( isdefined( var_2 ) )
            return var_2;
    }

    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_A2BD );
}

_id_05B6( var_0, var_1 )
{

}

_id_3FF6( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_788A );
}

_id_3FED( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_4B2A );
}

_id_3FF3( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_65F0 );
}

_id_3FE6( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_2D94 );
}

_id_3FF8( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_9A24 );
}

_id_3FE1( var_0 )
{
    return _func_1BB( level._id_4231["killstreakTable"]._id_66BD, level._id_4231["killstreakTable"]._id_72AB, var_0, level._id_4231["killstreakTable"]._id_09E4 );
}

_id_2508( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = var_0;

    if ( isdefined( level._id_4816 ) )
        var_1 += level._id_4816.size;

    if ( isdefined( level._id_57B8 ) )
        var_1 += level._id_57B8.size;

    if ( isdefined( level._id_99EF ) )
        var_1 += level._id_99EF.size;

    if ( isdefined( level._id_511D ) && level._id_511D )
    {
        if ( isdefined( level._id_392D ) )
            var_1 += level._id_392D.size;

        if ( isdefined( level._id_94F1 ) )
            var_1 += level._id_94F1.size;
    }

    return var_1;
}

_id_5A59()
{
    return 8;
}

_id_4C3F()
{
    level._id_3694++;
}

_id_2761()
{
    level._id_3694--;

    if ( level._id_3694 < 0 )
        level._id_3694 = 0;
}

_id_5761( var_0 )
{
    return 1.07;
}

_id_0AB0()
{
    if ( !_func_2DF() && getdvarint( "scr_skipclasschoice", 0 ) > 0 )
        return 0;

    if ( ishodgepodgemm() )
        return 0;

    var_0 = _func_0BC( _func_1BB( "mp/gametypesTable.csv", 0, level._id_01B3, 4 ) );
    return var_0;
}

_id_0AA2()
{
    if ( !_func_2DF() && getdvarint( "scr_skipclasschoice", 0 ) > 0 )
        return 0;

    if ( level.oldschool )
        return 0;

    if ( ishodgepodgemm() || ishodgepodgerpgonly() )
        return 0;

    if ( ishodgepodgeph() && ( !level.madpropsmode || isdefined( self._id_04A7 ) && level.madpropsmode && self._id_04A7 == game["defenders"] ) )
        return 0;

    var_0 = _func_0BC( _func_1BB( "mp/gametypesTable.csv", 0, level._id_01B3, 5 ) );
    return var_0;
}

_id_8510()
{
    if ( _id_0AA2() )
        return 0;

    if ( ishodgepodgeph() )
        return 1;

    if ( _id_59E3() && self._id_03BD != "none" )
        var_0 = 0;
    else if ( !_id_59E3() && !forceautoassign() && _id_0AB0() )
        var_0 = 1;
    else
        var_0 = 0;

    if ( var_0 )
        return 0;

    if ( level.oldschool )
        return 1;

    if ( ishodgepodgemm() )
        return 1;

    var_1 = _func_0BC( _func_1BB( "mp/gametypesTable.csv", 0, level._id_01B3, 8 ) );
    return var_1;
}

forceautoassign()
{
    if ( ishodgepodgemm() )
        return 1;

    var_0 = _func_0BC( _func_1BB( "mp/gametypesTable.csv", 0, level._id_01B3, 10 ) );
    return var_0;
}

_id_50CC( var_0, var_1 )
{
    return 0;
}

_id_7F3F( var_0 )
{
    var_1 = _func_13D( "commonOption", "timeLimit" );
    setdynamicdvar( "scr_" + level._id_01B3 + "_timeLimit", var_1 );
    _id_72F9( level._id_01B3, var_1 );
    var_2 = _func_13D( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_" + level._id_01B3 + "_scoreLimit", var_2 );
    _id_72F8( level._id_01B3, var_2 );
    setdynamicdvar( "scr_game_matchstarttime", _func_13D( "commonOption", "preMatchTimer" ) );
    setdynamicdvar( "scr_game_roundstarttime", _func_13D( "commonOption", "preRoundTimer" ) );
    setdynamicdvar( "scr_game_suicidespawndelay", _func_13D( "commonOption", "suicidePenalty" ) );
    setdynamicdvar( "scr_team_teamkillspawndelay", _func_13D( "commonOption", "teamKillPenalty" ) );
    setdynamicdvar( "scr_team_teamkillkicklimit", _func_13D( "commonOption", "teamKillKickLimit" ) );
    var_3 = _func_13D( "commonOption", "numLives" );
    setdynamicdvar( "scr_" + level._id_01B3 + "_numLives", var_3 );
    _id_72F4( level._id_01B3, var_3 );
    setdynamicdvar( "scr_player_maxhealth", _func_13D( "commonOption", "maxHealth" ) );
    setdynamicdvar( "scr_player_healthregentime", _func_13D( "commonOption", "healthRegen" ) );
    level._id_59E6 = 0;
    level._id_59EB = 0;
    setdynamicdvar( "scr_game_spectatetype", _func_13D( "commonOption", "spectateModeAllowed" ) );
    setdynamicdvar( "scr_game_lockspectatorpov", _func_13D( "commonOption", "spectateModePOV" ) );
    setdynamicdvar( "scr_game_allowkillcam", _func_13D( "commonOption", "showKillcam" ) );
    setdynamicdvar( "scr_game_forceuav", _func_13D( "commonOption", "radarAlwaysOn" ) );
    setdynamicdvar( "scr_" + level._id_01B3 + "_playerrespawndelay", _func_13D( "commonOption", "respawnDelay" ) );
    setdynamicdvar( "scr_" + level._id_01B3 + "_waverespawndelay", _func_13D( "commonOption", "waveRespawnDelay" ) );
    setdynamicdvar( "scr_player_forcerespawn", _func_13D( "commonOption", "forceRespawn" ) );
    level._id_59E5 = _func_13D( "commonOption", "allowCustomClasses" );
    level._id_2559 = _func_13D( "commonOption", "classPickCount" );
    setdynamicdvar( "scr_game_disablesprint", _func_13D( "commonOption", "disableSprint" ) );
    setdynamicdvar( "scr_game_deleteturrets", _func_13D( "commonOption", "deleteTurrets" ) );
    setdynamicdvar( "scr_game_hardpoints", 1 );
    setdynamicdvar( "scr_game_perks", 1 );
    setdynamicdvar( "g_hardcore", _func_13D( "commonOption", "hardcoreModeOn" ) );
    setdynamicdvar( "scr_thirdPerson", _func_13D( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "camera_thirdPerson", _func_13D( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "scr_game_onlyheadshots", _func_13D( "commonOption", "headshotsOnly" ) );

    if ( !isdefined( var_0 ) )
        setdynamicdvar( "scr_team_fftype", _func_13D( "commonOption", "ffType" ) );

    setdynamicdvar( "scr_game_killstreakdelay", _func_13D( "commonOption", "streakGracePeriod" ) );
    setdynamicdvar( "scr_game_chatterDisabled", _func_13D( "commonOption", "chatterDisabled" ) );
    level._id_1CA7 = _id_3FDB( "scr_game_chatterDisabled", 0 );
    level._id_0C91 = _func_13D( "commonOption", "announcerDisabled" );
    level._id_59EA = _func_13D( "commonOption", "switchTeamDisabled" );
    level._id_4400 = _func_13D( "commonOption", "grenadeGracePeriod" );
    setdvar( "bg_compassShowEnemies", getdvar( "scr_game_forceuav" ) );
    setdynamicdvar( "g_oldschool", _func_13D( "commonOption", "oldSchoolModeOn" ) );
    setdynamicdvar( "scr_killstreak_kills_uav", _func_13D( "commonOption", "killstreakUAVKills" ) );
    setdynamicdvar( "scr_killstreak_kills_airstrike", _func_13D( "commonOption", "killstreakAirStrikeKills" ) );
    setdynamicdvar( "scr_killstreak_kills_heli", _func_13D( "commonOption", "killstreakHeliKills" ) );
    setdynamicdvar( "scr_killcount_persists", _func_13D( "commonOption", "killCountPersists" ) );
}

_id_7307()
{
    for (;;)
    {
        level waittill( "host_migration_begin" );
        [[ level._id_4DE0 ]]();
    }
}

_id_7309( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_begin" );

        if ( isdefined( self._id_560D ) )
            self _meth_82D4( self._id_560D, 0 );
    }
}

_id_4017( var_0, var_1 )
{
    var_2 = [];
    var_2["loadoutPrimary"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "weapon" );
    var_3 = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "kit", "attachKit" );
    var_4 = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "kit", "furnitureKit" );
    var_2["loadoutPrimaryAttachKit"] = _func_1BB( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
    var_2["loadoutPrimaryFurnitureKit"] = _func_1BB( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_4 ), 1 );
    var_2["loadoutPrimaryCamo"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "camo" );
    var_2["loadoutPrimaryReticle"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 0, "reticle" );
    var_2["loadoutSecondary"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "weapon" );
    var_3 = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "kit", "attachKit" );
    var_4 = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "kit", "furnitureKit" );
    var_2["loadoutSecondaryAttachKit"] = _func_1BB( "mp/attachkits.csv", 0, common_scripts\utility::_id_93F2( var_3 ), 1 );
    var_2["loadoutSecondaryFurnitureKit"] = _func_1BB( "mp/furniturekits.csv", 0, common_scripts\utility::_id_93F2( var_4 ), 1 );
    var_2["loadoutSecondaryCamo"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "camo" );
    var_2["loadoutSecondaryReticle"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "weaponSetups", 1, "reticle" );
    var_2["loadoutEquipment"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "equipment", 0 );
    var_2["loadoutOffhand"] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "equipment", 1 );

    for ( var_5 = 0; var_5 < 3; var_5++ )
        var_2["loadoutPerks"][var_5] = _func_13D( "defaultClasses", var_0, "defaultClass", var_1, "class", "perkSlots", var_5 );

    var_2["loadoutMelee"] = "none";
    return var_2;
}

_id_7265( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( !isdefined( level._id_511D ) )
    {
        if ( level._id_4C6D && !self._id_4729 )
            self waittill( "applyLoadout" );
        else
            self waittill( "spawned_player" );
    }
    else
        self waittill( "applyLoadout" );

    if ( var_0 )
    {
        self notify( "lost_juggernaut" );
        wait 0.5;
    }

    if ( !isdefined( self._id_5137 ) )
    {
        self._id_5F7B = 0.7;
        maps\mp\gametypes\_weapons::_id_9B3D();
    }

    self._id_52AA = 0.7;
    self _meth_82C7();

    if ( !getdvarint( "camera_thirdPerson" ) && !isdefined( level._id_511D ) )
    {
        self._id_52A6 = _func_1AA( self );
        self._id_52A6._id_0530 = 0;
        self._id_52A6._id_0538 = 0;
        self._id_52A6.alignx = "left";
        self._id_52A6.aligny = "top";
        self._id_52A6._id_01F3 = "fullscreen";
        self._id_52A6._id_0501 = "fullscreen";
        self._id_52A6 _meth_80CE( level._id_52AD["juggernaut"]._id_65F6, 640, 480 );
        self._id_52A6._id_03D4 = -10;
        self._id_52A6.archived = 1;
        self._id_52A6._id_01EA = 1;
    }

    if ( level._id_01B3 != "jugg" || isdefined( level._id_59E9 ) && level._id_59E9 )
        self _meth_82A2( "specialty_radarjuggernaut", 1, 0 );

    if ( isdefined( self._id_5136 ) && self._id_5136 )
    {
        var_1 = spawn( "script_model", self._id_02E2 );
        var_1._id_04A7 = self._id_04A7;
        var_1 _meth_800F( self );
        self._id_67E3 = var_1;
    }

    level notify( "juggernaut_equipped", self );
}

_id_9B69( var_0 )
{
    var_1 = self._id_03BC;
    self._id_03BC = var_0;
    self _meth_82F8( "ui_session_state", var_0 );

    if ( var_1 != var_0 )
        level notify( "playerSessionStateChanged", self );
}

_id_197E()
{
    if ( isdefined( level._id_39B1 ) )
        return level._id_39B1;

    if ( getdvarint( "xblive_privatematch" ) || _func_2C4() )
        return "privateMatchCustomClasses";
    else
        return "customClasses";
}

_id_3F32( var_0 )
{
    return level._id_1E36[var_0];
}

_id_51CC()
{
    var_0 = _id_4008( self._id_04A7 );

    foreach ( var_2 in var_0 )
    {
        if ( var_2 != self && ( !isdefined( var_2._id_0249 ) || !var_2._id_0249 ) )
            return 0;
    }

    return 1;
}

_id_53B0( var_0 )
{
    var_1 = _id_4008( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_0249 ) && var_3._id_0249 )
            var_3 thread maps\mp\gametypes\_damage::_id_2A52( _func_0B4( 1, 3 ) );
    }
}

_id_907A( var_0 )
{
    if ( !_func_0CF( self ) )
        self _meth_8312( var_0 );
    else
        self _meth_8312( "none" );
}

_id_50B1( var_0 )
{
    if ( _func_1FF( var_0 ) && var_0._id_089F == 1 )
        return 1;

    if ( _func_1FE( var_0 ) )
        return 1;

    return 0;
}

_id_51CE( var_0 )
{
    if ( _id_50B1( var_0 ) )
        return 1;

    if ( _func_1AD( var_0 ) )
        return 1;

    return 0;
}

_id_50AD( var_0 )
{
    if ( _func_1FF( var_0 ) && var_0._id_0898 == 1 )
        return 1;

    if ( _func_1FE( var_0 ) )
        return 1;

    return 0;
}

_id_5112( var_0 )
{
    if ( _id_50AD( var_0 ) )
        return 1;

    if ( _func_1AD( var_0 ) )
        return 1;

    return 0;
}

_id_4119( var_0 )
{
    var_1 = 0;

    if ( level._id_91EB )
    {
        switch ( var_0 )
        {
            case "axis":
                var_1 = 1;
                break;
            case "allies":
                var_1 = 2;
                break;
        }
    }

    return var_1;
}

_id_5150( var_0 )
{
    return var_0 == "MOD_MELEE" || var_0 == "MOD_MELEE_ALT";
}

_id_5117( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_3._id_02E5 ) )
        {
            if ( var_3.code_classname == "script_vehicle" )
                return 0;

            if ( var_3.code_classname == "misc_turret" )
                return 0;

            if ( var_3.code_classname == "script_model" )
                return 0;
        }

        if ( isdefined( var_3._id_08A0 ) )
        {
            if ( var_3._id_08A0 == "dog" || var_3._id_08A0 == "alien" )
                return 0;
        }
    }

    return ( var_1 == "head" || var_1 == "helmet" ) && !_id_5150( var_2 ) && var_2 != "MOD_IMPACT" && !_id_50FE( var_0 );
}

_id_0E30( var_0, var_1 )
{
    if ( !level._id_91EB )
        return 0;
    else if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
        return 0;
    else if ( !isdefined( var_0._id_04A7 ) || !isdefined( var_1._id_04A7 ) )
        return 0;
    else if ( var_0 == var_1 )
        return 0;
    else if ( var_0._id_0308["team"] == var_1._id_04A7 && isdefined( var_1._id_91EC ) )
        return 0;
    else if ( isdefined( var_1._id_78CD ) && var_1._id_78CD )
        return 0;
    else if ( var_0._id_04A7 == var_1._id_04A7 )
        return 1;
    else
        return 0;
}

_id_7E5A( var_0 )
{
    if ( !( isdefined( self._id_488B ) && common_scripts\utility::_id_0CE4( self._id_488B, var_0 ) ) )
    {
        self._id_488B = common_scripts\utility::_id_0CDA( self._id_488B, var_0 );
        var_0 notify( "calculate_new_level_targets" );
    }
}

_id_07A7( var_0, var_1 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bots_add_to_level_targets"] ) )
    {
        var_0._id_9BE9 = var_1;
        var_0._id_1657 = "use";
        [[ level._id_161B["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_7352( var_0 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bots_remove_from_level_targets"] ) )
        [[ level._id_161B["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_07A6( var_0 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bots_add_to_level_targets"] ) )
    {
        var_0._id_1657 = "damage";
        [[ level._id_161B["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_7351( var_0 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bots_remove_from_level_targets"] ) )
        [[ level._id_161B["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_6205( var_0 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["notify_enemy_bots_bomb_used"] ) )
        self [[ level._id_161B["notify_enemy_bots_bomb_used"] ]]( var_0 );
}

_id_3E4C()
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bot_get_rank_xp_and_prestige"] ) )
        return self [[ level._id_161B["bot_get_rank_xp_and_prestige"] ]]();
}

_id_7EA5()
{
    var_0 = _id_3E4C();

    if ( isdefined( var_0 ) )
    {
        self._id_0308["rankxp"] = var_0._id_713C;
        self._id_0308["prestige"] = var_0._id_032E;
        self._id_0308["prestige_fake"] = var_0._id_032E;
    }
}

set_rank_options_for_bot()
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bot_set_rank_options"] ) )
        self [[ level._id_161B["bot_set_rank_options"] ]]();
}

_id_7DF3()
{
    if ( !isdefined( level._id_2153 ) )
        level._id_2153 = getdvar( "consoleGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0532 ) )
        level._id_0532 = getdvar( "xenonGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0349 ) )
        level._id_0349 = getdvar( "ps3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0531 ) )
        level._id_0531 = getdvar( "xb3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_034A ) )
        level._id_034A = getdvar( "ps4Game" ) == "true";
    else
    {

    }
}

_id_502F()
{
    if ( level._id_0531 || level._id_034A || !level._id_2153 )
        return 1;
    else
        return 0;
}

_id_7F5E( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_2153 ) || !isdefined( level._id_0531 ) || !isdefined( level._id_034A ) )
        _id_7DF3();

    if ( _id_502F() )
        setdvar( var_0, var_2 );
    else
        setdvar( var_0, var_1 );
}

_id_51F9( var_0, var_1 )
{
    return isdefined( var_1._id_04A7 ) && var_1._id_04A7 != var_0._id_04A7;
}

_id_51EC( var_0, var_1 )
{
    return isdefined( var_1._id_02E5 ) && var_1._id_02E5 != var_0;
}

_id_3FC4()
{
    return ( 0, 0, 5000 );
}

_id_3FC5()
{
    return ( 0, 0, 2500 );
}

_id_74FA( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( isdefined( level._id_626D ) && isdefined( level._id_627B ) )
    {
        self _meth_8476( level._id_627B, var_0 );
        self _meth_82D1( level._id_627B, var_0 );
        _id_7F02( level._id_627B, var_0 );
    }
    else if ( isdefined( self._id_9C34 ) && isdefined( self._id_750D ) )
    {
        self _meth_8476( self._id_750D, var_0 );
        self _meth_82D1( self._id_750D, var_0 );
        _id_7F02( self._id_750D, var_0 );
    }
    else
    {
        self _meth_8476( "", var_0 );
        self _meth_82D1( "", var_0 );
        _id_7F02( "", var_0 );
    }
}

_id_7E6B( var_0 )
{
    if ( !_func_1AD( self ) )
        return;

    if ( isdefined( level._id_575A ) )
        level._id_575B = level._id_575A;

    level._id_575A = var_0;
    self _meth_83BE( var_0 );
}

_id_1EC2()
{
    if ( !_func_1AD( self ) )
        return;

    var_0 = _func_0FD( "map" );

    if ( isdefined( level._id_575B ) )
    {
        var_0 = level._id_575B;
        level._id_575B = undefined;
    }

    level._id_575A = var_0;
    self _meth_83BE( var_0 );
}

_id_570C( var_0, var_1, var_2, var_3 )
{
    if ( !_func_1AD( self ) )
        return;

    self _meth_83BF( var_0, var_1 );
    _id_A03D( var_2, [ "death", "disconnect" ] );

    if ( isdefined( self ) )
        self _meth_83C0( var_3 );
}

_id_4144()
{
    if ( isdefined( self._id_0308["guid"] ) )
        return self._id_0308["guid"];

    var_0 = self _meth_8271();

    if ( var_0 == "0000000000000000" )
    {
        if ( isdefined( level._id_4453 ) )
            level._id_4453++;
        else
            level._id_4453 = 1;

        var_0 = "script" + level._id_4453;
    }

    self._id_0308["guid"] = var_0;
    return self._id_0308["guid"];
}

_id_3E34( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = self _meth_81B5();
    var_3 = [];

    foreach ( var_5 in level._id_0323 )
    {
        if ( !isdefined( var_5 ) || var_5 == self )
            continue;

        var_6 = 0;

        if ( !var_1 )
        {
            if ( isdefined( var_5._id_04A7 ) && var_5._id_04A7 == "spectator" || var_5._id_03BC == "spectator" )
            {
                var_7 = var_5 _meth_8299();

                if ( isdefined( var_7 ) && var_7 == self )
                    var_6 = 1;
            }

            if ( var_5._id_0196 == var_2 )
                var_6 = 1;
        }

        if ( !var_0 )
        {
            if ( var_5._id_0237 == var_2 )
                var_6 = 1;
        }

        if ( var_6 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_7F02( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _id_3E34( var_4, var_5 );

    foreach ( var_9 in var_7 )
    {
        var_9 notify( "changing_watching_visionset" );

        if ( isdefined( var_3 ) && var_3 )
            var_9 _meth_82D3( var_0, var_1 );
        else if ( isdefined( var_6 ) && var_6 )
            var_9 _meth_8465( var_0, var_1 );
        else
            var_9 _meth_82D1( var_0, var_1 );

        if ( var_0 != "" && isdefined( var_2 ) )
        {
            var_9 thread _id_743F( self, var_1 + var_2, var_6 );
            var_9 thread _id_743D( self, var_6 );

            if ( var_9 _id_5129() )
                var_9 thread _id_743E();
        }
    }
}

_id_743E()
{
    self endon( "disconnect" );
    self waittill( "spawned" );
    self _meth_82D1( "", 0.0 );
    self _meth_8465( "", 0.0 );
}

_id_743F( var_0, var_1, var_2 )
{
    self endon( "changing_watching_visionset" );
    var_0 endon( "disconnect" );
    var_3 = gettime();
    var_4 = self._id_04A7;

    while ( gettime() - var_3 < var_1 * 1000 )
    {
        if ( self._id_04A7 != var_4 || !common_scripts\utility::_id_0CE4( var_0 _id_3E34(), self ) )
        {
            if ( isdefined( var_2 ) && var_2 )
                self _meth_8465( "", 0.0 );
            else
                self _meth_82D1( "", 0.0 );

            self notify( "changing_visionset" );
            break;
        }

        wait 0.05;
    }
}

_id_743D( var_0, var_1 )
{
    self endon( "changing_watching_visionset" );
    var_0 waittill( "disconnect" );

    if ( isdefined( var_1 ) && var_1 )
        self _meth_8465( "", 0.0 );
    else
        self _meth_82D1( "", 0.0 );
}

_id_0683( var_0 )
{
    if ( _func_1FF( var_0 ) && ( !isdefined( var_0._id_50A6 ) || !var_0._id_50A6 ) )
        return undefined;

    return var_0;
}

_id_063B( var_0, var_1 )
{
    if ( !isdefined( self._id_6047 ) )
    {
        self._id_6047 = [];
        self._id_6F71 = [];
    }
    else
    {
        self._id_6F71[0] = self._id_6047[0];
        self._id_6F71[1] = self._id_6047[1];
    }

    self._id_6047[0] = var_0;
    self._id_6047[1] = var_1;
    self _meth_83EC( var_0, var_1 );
}

_id_0628()
{
    if ( isdefined( self._id_6F71 ) )
        self _meth_83EC( self._id_6F71[0], self._id_6F71[1] );
    else
        self _meth_83EC( "", "" );

    self._id_6047 = undefined;
    self._id_6F71 = undefined;
}

_id_3774( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    if ( var_2.size > 0 )
    {
        foreach ( var_4 in var_2 )
        {
            var_5 = 0;

            if ( isdefined( var_4._id_793C ) )
            {
                if ( isdefined( var_4._id_7A99 ) && var_4._id_7A99 == "delta_anim" )
                    var_5 = 1;

                var_4 thread _id_6A25( var_1, var_5 );
            }
        }
    }
}

_id_6A25( var_0, var_1 )
{
    if ( var_0 == 1 )
        wait(_func_0B5( 0.0, 1 ));

    if ( var_1 == 0 )
        self _meth_8275( self._id_793C );
    else
        self _meth_8277( self._id_793C );
}

_id_6C62( var_0, var_1 )
{
    _id_0612( "highjump", var_0, var_1, ::_meth_83B0 );
}

_id_6C63( var_0, var_1 )
{
    _id_0612( "highjumpdrop", var_0, var_1, ::_meth_8482 );
}

_id_6C60( var_0, var_1 )
{
    _id_0612( "boostjump", var_0, var_1, ::_meth_849A );
}

_id_6C64( var_0, var_1 )
{
    _id_0612( "powerslide", var_0, var_1, ::_meth_8481 );
}

_id_6C61( var_0, var_1 )
{
    _id_0612( "dodge", var_0, var_1, ::_meth_8489 );
}

_id_0612( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( self._id_6C8A ) )
        self._id_6C8A = [];

    if ( !isdefined( self._id_6C8A[var_0] ) )
        self._id_6C8A[var_0] = [];

    if ( !isdefined( var_2 ) )
        var_2 = "default";

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( var_1 )
    {
        self._id_6C8A[var_0] = common_scripts\utility::_id_0CF6( self._id_6C8A[var_0], var_2 );

        if ( !self._id_6C8A[var_0].size )
        {
            if ( var_4 )
                self call [[ var_3 ]]( 1 );
            else
                self [[ var_3 ]]( 1 );
        }
    }
    else
    {
        if ( !isdefined( common_scripts\utility::_id_0CE8( self._id_6C8A[var_0], var_2 ) ) )
            self._id_6C8A[var_0] = common_scripts\utility::_id_0CDA( self._id_6C8A[var_0], var_2 );

        if ( var_4 )
            self call [[ var_3 ]]( 0 );
        else
            self [[ var_3 ]]( 0 );
    }
}

_id_5943( var_0, var_1, var_2, var_3 )
{
    var_4 = 500;

    switch ( var_0 )
    {
        case "killstreakRemote":
            var_4 = 300;
            break;
        case "coopStreakPrompt":
            var_4 = 301;
            break;
        default:
            break;
    }

    _id_05D2( var_4, var_0, var_2, var_3 );
    self _meth_80C3( var_4, var_2, var_3 );
    self _meth_80DD( var_1 );
    self _meth_80DC( "HINT_NOICON" );
}

_id_05D2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_4234 ) )
        level._id_4234 = [];

    var_4 = -1;

    for ( var_5 = 0; var_5 < level._id_4234.size; var_5++ )
    {
        var_6 = level._id_4234[var_5];

        if ( var_6._id_6FBE > var_0 )
        {
            if ( var_4 == -1 )
                var_4 = var_5;

            break;
        }

        if ( var_6._id_6FBE == var_0 )
        {
            var_6._id_6FBE += 0.01;

            if ( var_6._id_310D )
                var_6._id_32D5 _meth_80C3( var_6._id_6FBE, var_6._id_0318, var_6._id_04A7 );

            if ( var_4 == -1 )
                var_4 = var_5;
        }
    }

    if ( var_4 == -1 )
        var_4 = 0;

    var_7 = spawnstruct();
    var_7._id_32D5 = self;
    var_7._id_6FBE = var_0;
    var_7._id_04D9 = var_1;
    var_7._id_0318 = var_2;
    var_7._id_04A7 = var_3;
    var_7._id_310D = 1;
    level._id_4234 = common_scripts\utility::_id_0CED( level._id_4234, var_7, var_4 );
}

_id_5942()
{
    var_0 = undefined;

    foreach ( var_2 in level._id_4234 )
    {
        if ( var_2._id_32D5 == self )
        {
            var_0 = var_2;
            break;
        }
    }

    if ( isdefined( var_0 ) )
    {
        var_4 = var_0._id_6FBE;
        level._id_4234 = common_scripts\utility::_id_0CF6( level._id_4234, var_0 );
        self _meth_80C4();

        foreach ( var_2 in level._id_4234 )
        {
            if ( var_4 > var_2._id_6FBE && _func_0BC( var_4 ) == _func_0BC( var_2._id_6FBE ) )
            {
                var_2._id_6FBE -= 0.01;

                if ( var_2._id_310D )
                    var_2._id_32D5 _meth_80C3( var_2._id_6FBE, var_2._id_0318, var_2._id_04A7 );
            }
        }
    }
}

_id_2B14()
{
    foreach ( var_1 in level._id_4234 )
    {
        if ( var_1._id_32D5 == self )
        {
            if ( var_1._id_310D )
            {
                var_1._id_32D5 _meth_80C4();
                var_1._id_310D = 0;
            }

            break;
        }
    }
}

_id_3110()
{
    foreach ( var_1 in level._id_4234 )
    {
        if ( var_1._id_32D5 == self )
        {
            if ( !var_1._id_310D )
            {
                var_1._id_32D5 _meth_80C3( var_1._id_6FBE, var_1._id_0318, var_1._id_04A7 );
                var_1._id_310D = 1;
            }

            break;
        }
    }
}

_id_7F54( var_0 )
{
    self _meth_818A( var_0["nearStart"], var_0["nearEnd"], var_0["farStart"], var_0["farEnd"], var_0["nearBlur"], var_0["farBlur"] );
}

_id_50FC( var_0 )
{
    if ( level._id_91EB )
        return _id_517A( var_0 );
    else
        return _id_5176( var_0 );
}

_id_517A( var_0 )
{
    return var_0._id_04A7 != self._id_04A7;
}

_id_5176( var_0 )
{
    if ( isdefined( var_0._id_02E5 ) )
        return var_0._id_02E5 != self;
    else
        return var_0 != self;
}

_id_5156()
{
    if ( _func_2C4() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5155()
{
    if ( _func_140() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5154()
{
    if ( _id_6FD0() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5153()
{
    if ( _id_5156() || _id_5155() || _id_5154() )
        return 1;

    return 0;
}

_id_89DD( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnfx( var_0, var_2, var_3 );
    var_4 _id_3BB8( var_1 );
    return var_4;
}

_id_3BB8( var_0 )
{
    thread _id_850E( var_0 );
    setfxkillondelete( self, 1 );
    triggerfx( self );
}

_id_850E( var_0 )
{
    self endon( "death" );
    self endon( "stopShowFXToTeam" );
    level endon( "game_ended" );

    for (;;)
    {
        self _meth_8056();

        foreach ( var_2 in level._id_0323 )
        {
            var_3 = var_2._id_04A7;

            if ( var_3 != "axis" || var_2 _meth_842D() )
                var_3 = "allies";

            if ( var_0 == var_3 || var_0 == "neutral" )
                self _meth_8007( var_2 );
        }

        level waittill( "joined_team" );
    }
}

_id_3E67( var_0 )
{
    var_1 = "h1_ak47_mp";

    if ( isdefined( var_0._id_6F84 ) && var_0._id_6F84 != "none" )
        var_1 = var_0._id_6F84;
    else if ( isdefined( var_0._id_7BFA ) && var_0._id_7BFA != "none" )
        var_1 = var_0._id_7BFA;

    return var_1;
}

_id_6D3F()
{
    self._id_74A6 = self _meth_8338();
}

_id_6D38()
{
    if ( isdefined( self._id_74A6 ) )
    {
        if ( self._id_04A7 != "spectator" )
            self _meth_8337( self._id_74A6 );

        self._id_74A6 = undefined;
    }
}

_id_7FAE( var_0, var_1 )
{
    var_0 maps\mp\gametypes\_gameobjects::_id_7F12( "mlg", var_1 );
    var_0 maps\mp\gametypes\_gameobjects::_id_7F13( "mlg", var_1 );
}

spawnpatchclip( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );

    if ( !isdefined( var_3 ) )
        return undefined;

    var_4 = spawn( "script_model", var_1 );
    var_4 _meth_8274( var_3 );
    var_4.angles = var_2;
    return var_4;
}

hardpointvisualsswap( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_5 = var_1 + "_" + var_4._id_0398;
        var_6 = getent( var_5, "targetname" );

        if ( !isdefined( var_6 ) )
            continue;

        var_6._id_0398 = var_4._id_0398;
        var_6._id_79F4 = "hp";
        var_6._id_04A6 = var_4._id_04A6;
        var_4 delete();
    }
}

hardpointtriggerswap( var_0, var_1 )
{
    var_2 = getent( var_1, "targetname" );
    var_3 = getentarray( "hp_zone_trigger", "targetname" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        var_7 = _func_0F0( var_6._id_02E2, var_0 );

        if ( var_7 < 1 )
        {
            var_4 = var_6;
            break;
        }
    }

    var_9 = getentarray( "hp_zone_center", "targetname" );
    var_10 = undefined;

    foreach ( var_12 in var_9 )
    {
        if ( var_12 _meth_80AB( var_4 ) )
        {
            var_10 = var_12;
            break;
        }
    }

    if ( !var_10 _meth_80AB( var_2 ) )
        var_10._id_02E2 = var_2._id_02E2;

    var_2._id_04A6 = "hp_zone_trigger";
    var_4 delete();
}

headquarterstriggerswap( var_0, var_1 )
{
    var_2 = getent( var_1, "targetname" );
    var_3 = getentarray( "radiotrigger", "targetname" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        var_7 = _func_0F0( var_6._id_02E2, var_0 );

        if ( var_7 < 1 )
        {
            var_4 = var_6;
            break;
        }
    }

    var_9 = getentarray( "hq_hardpoint", "targetname" );
    var_10 = undefined;

    foreach ( var_12 in var_9 )
    {
        if ( var_12 _meth_80AB( var_4 ) )
        {
            var_10 = var_12;
            break;
        }
    }

    if ( !var_10 _meth_80AB( var_2 ) )
        var_10._id_02E2 = var_2._id_02E2;

    var_2._id_04A6 = "radiotrigger";
    var_4 delete();
}

headquartersradiomove( var_0, var_1, var_2 )
{
    var_3 = getentarray( "hq_hardpoint", "targetname" );
    var_4 = undefined;
    var_5 = isdefined( var_1 );
    var_6 = isdefined( var_2 );
    var_7 = ( 0, 0, 0 );
    var_8 = ( 0, 0, 0 );

    foreach ( var_10 in var_3 )
    {
        var_11 = _func_0F0( var_10._id_02E2, var_0 );

        if ( var_11 < 1 )
        {
            var_4 = var_10;

            if ( var_5 )
                var_7 = var_1 - var_10._id_02E2;

            if ( var_6 )
                var_8 = var_2 - var_10.angles;

            break;
        }
    }

    if ( var_5 )
        var_4._id_02E2 = var_1;

    if ( var_6 )
        var_4.angles = var_2;

    var_13 = getentarray( var_4._id_04A4, "targetname" );

    foreach ( var_15 in var_13 )
    {
        if ( var_5 )
            var_15._id_02E2 += var_7;

        if ( var_6 )
            var_15.angles += var_8;
    }
}

demolitiontriggermove( var_0, var_1, var_2 )
{
    var_3 = getentarray( "dd_bombzone", "targetname" );

    foreach ( var_5 in var_3 )
    {
        var_6 = _func_0F0( var_5._id_02E2, var_0 );

        if ( var_6 < 1 )
        {
            if ( isdefined( var_1 ) )
                var_5._id_02E2 = var_1;

            if ( isdefined( var_2 ) )
                var_5.angles = var_2;

            return;
        }
    }
}

demolitionsitemove( var_0, var_1, var_2 )
{
    var_3 = getentarray( "dd_bombzone", "targetname" );
    var_4 = isdefined( var_1 );
    var_5 = isdefined( var_2 );
    var_6 = ( 0, 0, 0 );
    var_7 = ( 0, 0, 0 );
    var_8 = undefined;

    foreach ( var_10 in var_3 )
    {
        if ( isdefined( var_10._id_0394 ) && var_10._id_0394 == var_0 )
        {
            var_8 = var_10;

            if ( var_4 )
                var_6 = var_1 - var_8._id_02E2;

            if ( var_5 )
                var_7 = var_2 - var_8.angles;

            break;
        }
    }

    if ( !isdefined( var_8 ) )
        return;

    var_12 = getentarray( var_8._id_04A4, "targetname" );
    var_13 = getent( var_12[0]._id_04A4, "targetname" );
    var_14 = getent( "dd_bombzone_clip" + var_0, "targetname" );
    var_15 = undefined;
    var_16 = undefined;

    for ( var_17 = 0; var_17 < var_12.size; var_17++ )
    {
        if ( isdefined( var_12[var_17]._id_79BF ) )
        {
            var_16 = var_12[var_17]._id_79BF;
            break;
        }
    }

    if ( !isdefined( var_16 ) )
        return;

    var_18 = getentarray( "exploder", "targetname" );

    foreach ( var_20 in var_18 )
    {
        if ( var_20._id_79BF == var_16 )
        {
            var_15 = var_20;
            break;
        }
    }

    if ( !isdefined( var_15 ) )
        return;

    if ( var_4 )
    {
        var_8._id_02E2 = var_1;

        foreach ( var_23 in var_12 )
            var_23._id_02E2 += var_6;

        var_13._id_02E2 += var_6;
        var_14._id_02E2 += var_6;
        var_15._id_02E2 += var_6;
    }

    if ( var_5 )
    {
        var_8.angles = var_2;

        foreach ( var_23 in var_12 )
            var_23.angles += var_7;

        var_13.angles += var_7;
        var_14.angles += var_7;
        var_15.angles += var_7;
    }
}

iscoop()
{
    if ( isdefined( level._id_511D ) && level._id_511D )
        return 1;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return 1;

    return 0;
}

setlightingstate_patched( var_0 )
{
    var_1 = getentarray();
    setomnvar( "lighting_state", var_0 );

    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_572E ) && ( var_3.classname == "script_brushmodel" || var_3.classname == "script_model" ) )
            {
                if ( var_3._id_572E == 0 )
                    continue;

                if ( var_3._id_572E == var_0 )
                {
                    var_3 common_scripts\utility::_id_84EF();
                    var_3 _meth_8550();
                    continue;
                }

                var_3 notify( "hidingLightingState" );
                var_3 common_scripts\utility::_id_485E();
            }
        }
    }
}

gettimeutc_for_stat_recording()
{
    return gettimeutc();
}

_id_5092( var_0 )
{
    return isdefined( var_0 ) && var_0;
}

waittillplayersnextsnapshot( var_0 )
{
    var_0 endon( "disconnect" );
    var_1 = var_0 _meth_8556();

    if ( !isdefined( var_1 ) )
        return;

    for (;;)
    {
        waittillframeend;
        var_2 = var_0 _meth_8557();

        if ( !isdefined( var_2 ) )
            return;

        if ( var_2 > var_1 )
            break;
    }
}

setgameplayactive( var_0 )
{
    setdvar( "bg_mpGameplayActive", var_0 );
}

gameplayactivewatch()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = 0;

        if ( isdefined( level._id_0323 ) )
        {
            foreach ( var_2 in level._id_0323 )
            {
                var_3 = isdefined( var_2._id_03BC ) && ( var_2._id_03BC == "playing" || var_2._id_03BC == "dead" );

                if ( var_3 && !_func_0CF( var_2 ) && !_func_28E( var_2 ) )
                    var_0++;
            }
        }

        var_5 = var_0 >= 2;
        setgameplayactive( var_5 );
        level common_scripts\utility::_id_A069( "playerCountChanged", "playerSessionStateChanged" );
    }
}

setcarrierloadouts()
{
    if ( _func_13E() && _func_13D( "defaultClasses", "axis", "defaultClass", 5, "class", "inUse" ) )
        level.carrierloadouts["axis"] = _id_4017( "axis", 5 );

    if ( _func_13E() && _func_13D( "defaultClasses", "allies", "defaultClass", 5, "class", "inUse" ) )
        level.carrierloadouts["allies"] = _id_4017( "allies", 5 );
}

applycarrierclass()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50DA ) && self._id_50DA == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self _meth_82DD() || !self _meth_833E() )
        wait 0.05;

    if ( _id_5131() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self._id_0308["gamemodeLoadout"] = level.carrierloadouts[self._id_04A7];
    self._id_3BF3 = self._id_1E2E;
    self.gamemode_carrierclass = 1;
    self._id_0308["class"] = "gamemode";
    self._id_0308["lastClass"] = "gamemode";
    self._id_1E2E = "gamemode";
    self._id_5589 = "gamemode";
    self notify( "faux_spawn" );
    maps\mp\gametypes\_class::_id_41E0( self._id_04A7, "gamemode" );
}

removecarrierclass()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50DA ) && self._id_50DA == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self _meth_82DD() || !self _meth_833E() )
        wait 0.05;

    while ( _id_50C9( self _meth_830E() ) )
        wait 0.05;

    if ( _id_5131() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self._id_0308["gamemodeLoadout"] = undefined;
    self notify( "faux_spawn" );
    maps\mp\gametypes\_class::_id_41E0( self._id_04A7, self._id_1E2E );
}

streamcarrierweaponstoplayers( var_0, var_1, var_2 )
{
    level endon( "game_ended" );

    if ( !isdefined( level.carrierloadouts ) )
    {
        wait 1.0;

        if ( !isdefined( level.carrierloadouts ) )
            return;
    }

    var_3 = [];
    var_4 = [];
    var_5 = [];

    foreach ( var_18, var_7 in level.carrierloadouts )
    {
        if ( !common_scripts\utility::_id_0CE4( var_1, var_18 ) )
            continue;

        var_5[var_5.size] = var_18;
        var_8 = var_7["loadoutPrimary"];
        var_9 = var_7["loadoutPrimaryAttachKit"];
        var_10 = var_7["loadoutPrimaryFurnitureKit"];
        var_11 = var_7["loadoutPrimaryCamo"];
        var_12 = var_7["loadoutPrimaryReticle"];
        var_13 = _func_0BC( _func_1BB( "mp/camoTable.csv", 1, var_11, 0 ) );
        var_14 = _func_0BC( _func_1BB( "mp/reticleTable.csv", 1, var_12, 0 ) );
        var_15 = maps\mp\gametypes\_class::_id_188C( var_8, var_9, var_10, var_13, var_14, 0 );
        var_4[var_18] = [ var_15 ];
        var_16 = _func_1B8( var_15 );
        var_17 = spawnstruct();
        var_17._id_04A7 = var_18;
        var_17._id_0513 = var_15;
        var_3[var_18][var_16] = var_17;
    }

    if ( var_5.size == 0 )
        return;

    for (;;)
    {
        foreach ( var_20 in level._id_0323 )
        {
            if ( !_func_1A1( var_20 ) || !isdefined( var_20._id_04A7 ) )
                continue;

            if ( !common_scripts\utility::_id_0CE4( var_5, var_20._id_04A7 ) )
                continue;

            if ( ![[ var_2 ]]( var_0, var_20 ) )
                continue;

            var_21 = var_0._id_24C8;

            if ( isdefined( var_0._id_1BAF ) )
                var_21 = var_0._id_1BAF._id_02E2;

            if ( _func_0F0( var_20._id_02E2, var_21 ) > 90000 )
                continue;

            var_20 _meth_8420( var_3[var_20._id_04A7], var_4[var_20._id_04A7] );
        }

        wait 0.5;
    }
}

_id_0CFA( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size - 1; var_2++ )
    {
        if ( var_2 == var_1 )
        {
            var_0[var_2] = var_0[var_2 + 1];
            var_1++;
        }
    }

    var_0[var_0.size - 1] = undefined;
    return var_0;
}

streamnextspectatorweaponsifnecessary( var_0 )
{
    if ( _func_0CF( self ) )
        return;

    var_1 = undefined;

    if ( canspectatesometeam() && !( self _meth_857D( "freelook" ) && var_0 ) )
        var_1 = getnextspectateclient();

    if ( isdefined( var_1 ) )
        streamspectatorweaponsforclient( var_1 );
}

canspectatesometeam()
{
    if ( level._id_91EB )
    {
        if ( self _meth_857D( "allies" ) || self _meth_857D( "axis" ) )
            return 1;
    }
    else if ( self _meth_857D( "allies" ) || self _meth_857D( "axis" ) || self _meth_857D( "none" ) )
        return 1;

    return 0;
}

getnextspectateclient()
{
    var_0 = _func_302();
    var_1 = self _meth_81B5();

    for ( var_2 = common_scripts\utility::_id_0287( var_1 + 1, var_0 ); var_2 != var_1; var_2 = common_scripts\utility::_id_0287( var_2 + 1, var_0 ) )
    {
        if ( self _meth_857E( var_2 ) )
            break;
    }

    if ( var_2 != var_1 )
    {
        foreach ( var_4 in level._id_0323 )
        {
            if ( var_4 _meth_81B5() == var_2 )
                return var_4;
        }
    }

    return undefined;
}

streamspectatorweaponsforclient( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_04A7 = var_0._id_04A7;
    var_1._id_0513 = var_0._id_0340;
    var_2 = var_0 _meth_857F();
    return self _meth_8420( var_1, var_2 );
}

ishodgepodgemm()
{
    return isdefined( level.hodgepodgemode ) && level.hodgepodgemode == 2;
}

ishodgepodgerpgonly()
{
    return isdefined( level.hodgepodgemode ) && ( level.hodgepodgemode == 6 || level.hodgepodgemode == 7 );
}

ishodgepodgeph()
{
    return isdefined( level.hodgepodgemode ) && level.hodgepodgemode == 9;
}

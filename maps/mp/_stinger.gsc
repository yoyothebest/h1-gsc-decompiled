// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4E2A()
{
    self._id_8E59 = undefined;
    self._id_8E5A = undefined;
    self._id_8E48 = undefined;
    self._id_8E49 = undefined;
    thread _id_7460();
}

_id_745F()
{
    if ( !isdefined( self._id_8E5C ) )
        return;

    self._id_8E5C = undefined;
    self notify( "stop_javelin_locking_feedback" );
    self notify( "stop_javelin_locked_feedback" );
    self _meth_82E3();
    _id_4E2A();
}

_id_7460()
{
    self endon( "disconnect" );
    self notify( "ResetStingerLockingOnDeath" );
    self endon( "ResetStingerLockingOnDeath" );

    for (;;)
    {
        self waittill( "death" );
        _id_745F();
    }
}

_id_8E38( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !self _meth_8218( var_0._id_02E2, 65, 85 ) )
        return 0;

    if ( isdefined( level._id_06CE ) && self._id_8E5A == level._id_06CE._id_687C && !isdefined( level._id_06D1 ) )
        return 0;

    return 1;
}

_id_5894()
{
    self endon( "faux_spawn" );
    self endon( "stop_javelin_locking_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_1D48 ) && isdefined( level._id_1D48._id_4473 ) && isdefined( self._id_8E5A ) && self._id_8E5A == level._id_1D48._id_4473 )
            level._id_1D48._id_4473 _meth_82F1( "missile_locking" );

        if ( isdefined( level._id_06D1 ) && isdefined( self._id_8E5A ) && self._id_8E5A == level._id_06CE._id_687C )
            level._id_06D1 _meth_82F1( "missile_locking" );

        self _meth_82F1( "stinger_locking" );
        self _meth_80AF( "ac130_25mm_fire" );
        wait 0.6;
    }
}

_id_5893()
{
    self endon( "faux_spawn" );
    self endon( "stop_javelin_locked_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_1D48 ) && isdefined( level._id_1D48._id_4473 ) && isdefined( self._id_8E5A ) && self._id_8E5A == level._id_1D48._id_4473 )
            level._id_1D48._id_4473 _meth_82F1( "missile_locking" );

        if ( isdefined( level._id_06D1 ) && isdefined( self._id_8E5A ) && self._id_8E5A == level._id_06CE._id_687C )
            level._id_06D1 _meth_82F1( "missile_locking" );

        self _meth_82F1( "stinger_locked" );
        self _meth_80AF( "ac130_25mm_fire" );
        wait 0.25;
    }
}

_id_5818( var_0 )
{
    var_1 = self _meth_80AA();

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = _func_08E( var_1, var_0._id_02E2, 0, var_0 );

    if ( var_2 )
        return 1;

    var_3 = var_0 _meth_821A( 1, 0, 0 );
    var_2 = _func_08E( var_1, var_3, 0, var_0 );

    if ( var_2 )
        return 1;

    var_4 = var_0 _meth_821A( -1, 0, 0 );
    var_2 = _func_08E( var_1, var_4, 0, var_0 );

    if ( var_2 )
        return 1;

    return 0;
}

_id_8E45( var_0 )
{

}

_id_8862()
{
    var_0 = 500;

    if ( _id_5818( self._id_8E5A ) )
    {
        self._id_8E49 = 0;
        return 1;
    }

    if ( self._id_8E49 == 0 )
        self._id_8E49 = gettime();

    var_1 = gettime() - self._id_8E49;

    if ( var_1 >= var_0 )
    {
        _id_745F();
        return 0;
    }

    return 1;
}

_id_4107()
{
    var_0 = [];

    if ( maps\mp\_utility::_id_4FA6() )
        return var_0;

    if ( level._id_91EB )
    {
        if ( isdefined( level._id_1D48 ) && ( level._id_1D48._id_04A7 != self._id_04A7 || isdefined( level._id_1D48._id_02E5 ) && level._id_1D48._id_02E5 == self ) )
            var_0[var_0.size] = level._id_1D48;

        if ( isdefined( level._id_06D1 ) && level._id_06D1._id_04A7 != self._id_04A7 )
            var_0[var_0.size] = level._id_06CE._id_687C;

        if ( isdefined( level._id_46DF ) )
        {
            foreach ( var_2 in level._id_46DF )
            {
                if ( isdefined( var_2 ) && ( var_2._id_04A7 != self._id_04A7 || isdefined( var_2._id_02E5 ) && var_2._id_02E5 == self ) )
                    var_0[var_0.size] = var_2;
            }
        }

        if ( level._id_5FEC )
        {
            for ( var_4 = 0; var_4 < level._id_91F7.size; var_4++ )
            {
                if ( self._id_04A7 != level._id_91F7[var_4] )
                {
                    if ( level._id_99E9[level._id_91F7[var_4]].size )
                    {
                        foreach ( var_6 in level._id_99E9[level._id_91F7[var_4]] )
                            var_0[var_0.size] = var_6;
                    }
                }
            }
        }
        else if ( level._id_99E9[level._id_65B3[self._id_04A7]].size )
        {
            foreach ( var_6 in level._id_99E9[level._id_65B3[self._id_04A7]] )
                var_0[var_0.size] = var_6;
        }

        if ( isdefined( level._id_57B8 ) )
        {
            foreach ( var_11 in level._id_57B8 )
            {
                if ( isdefined( var_11 ) && ( var_11._id_04A7 != self._id_04A7 || isdefined( var_11._id_02E5 ) && var_11._id_02E5 == self ) )
                    var_0[var_0.size] = var_11;
            }
        }

        if ( isdefined( level._id_99EF ) )
        {
            foreach ( var_14 in level._id_99EF )
            {
                if ( isdefined( var_14 ) && ( var_14._id_04A7 != self._id_04A7 || isdefined( var_14._id_02E5 ) && var_14._id_02E5 == self ) )
                    var_0[var_0.size] = var_14;
            }
        }
    }
    else
    {
        if ( isdefined( level._id_1D48 ) )
            var_0[var_0.size] = level._id_1D48;

        if ( isdefined( level._id_06D1 ) )
            var_0[var_0.size] = level._id_06CE._id_687C;

        if ( isdefined( level._id_46DF ) )
        {
            foreach ( var_2 in level._id_46DF )
            {
                if ( isdefined( var_2 ) )
                    var_0[var_0.size] = var_2;
            }
        }

        if ( level._id_99E9.size )
        {
            foreach ( var_19, var_6 in level._id_99E9 )
            {
                if ( isdefined( var_6._id_02E5 ) && var_6._id_02E5 == self )
                    continue;

                var_0[var_0.size] = var_6;
            }
        }

        if ( isdefined( level._id_57B8 ) )
        {
            foreach ( var_11 in level._id_57B8 )
            {
                if ( !isdefined( var_11 ) )
                    continue;

                var_0[var_0.size] = var_11;
            }
        }

        if ( isdefined( level._id_99EF ) )
        {
            foreach ( var_14 in level._id_99EF )
            {
                if ( !isdefined( var_14 ) )
                    continue;

                var_0[var_0.size] = var_14;
            }
        }
    }

    return var_0;
}

_id_8E5B()
{
    if ( !_func_1AD( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = 1000;
    _id_4E2A();

    for (;;)
    {
        wait 0.05;

        if ( self _meth_833D() < 0.95 )
        {
            _id_745F();
            continue;
        }

        var_1 = self _meth_830E();

        if ( _func_120( var_1, "stingerm7" ) )
            continue;

        if ( var_1 != "stinger_mp" )
        {
            _id_745F();
            continue;
        }

        self._id_8E5C = 1;

        if ( !isdefined( self._id_8E59 ) )
            self._id_8E59 = 0;

        _id_8E45( self._id_8E5A );

        if ( self._id_8E59 == 0 )
        {
            var_2 = _id_4107();

            if ( var_2.size == 0 )
                continue;

            var_3 = [];

            foreach ( var_5 in var_2 )
            {
                if ( !isdefined( var_5 ) )
                    continue;

                var_6 = self _meth_8218( var_5._id_02E2, 65, 75 );

                if ( var_6 )
                    var_3[var_3.size] = var_5;
            }

            if ( var_3.size == 0 )
                continue;

            var_8 = _func_1BA( var_3, self._id_02E2 );

            if ( !_id_5818( var_8[0] ) )
                continue;

            thread _id_5894();
            self._id_8E5A = var_8[0];
            self._id_8E48 = gettime();
            self._id_8E59 = 1;
            self._id_8E49 = 0;
        }

        if ( self._id_8E59 == 1 )
        {
            if ( !_id_8E38( self._id_8E5A ) )
            {
                _id_745F();
                continue;
            }

            var_9 = _id_8862();

            if ( !var_9 )
                continue;

            var_10 = gettime() - self._id_8E48;

            if ( maps\mp\_utility::_id_05CB( "specialty_fasterlockon" ) )
            {
                if ( var_10 < var_0 * 0.5 )
                    continue;
            }
            else if ( var_10 < var_0 )
                continue;

            self notify( "stop_javelin_locking_feedback" );
            thread _id_5893();
            self _meth_82E2( self._id_8E5A );
            self._id_8E59 = 2;
        }

        if ( self._id_8E59 == 2 )
        {
            var_9 = _id_8862();

            if ( !var_9 )
                continue;

            if ( !_id_8E38( self._id_8E5A ) )
            {
                _id_745F();
                continue;
            }
        }
    }
}

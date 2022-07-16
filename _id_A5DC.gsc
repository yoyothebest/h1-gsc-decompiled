// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0F91( var_0 )
{
    if ( isdefined( var_0 ) )
        _id_108A( var_0 );

    _id_A5E8::_id_86F4();

    if ( !isdefined( level._id_0E57 ) )
        level._id_0E57 = spawnstruct();

    if ( !isdefined( level._id_038E ) )
        level._id_038E = _func_123( getdvar( "mapname" ) );

    if ( !isdefined( level._id_055B ) )
        level._id_055B = spawnstruct();

    level._id_055B._id_9C28 = 0;
    level._id_055B._id_8F59 = [];
    level._id_055B._id_5BB8 = [];
    level._id_055B._id_7008 = [];
    level._id_055B._id_7003 = [];
    level._id_055B._id_9F0D = 0;
    level._id_055B._id_8E32 = undefined;
    level._id_055B._id_6C27 = spawnstruct();
    level._id_055B._id_6C27._id_57F1 = "idle";
    level._id_055B._id_6C27._id_57F2 = "idle";
    level._id_0B3D = [];
    level._id_0B47 = [];
    level._id_3BA6 = 1;
    level._id_74F2 = "";
    level._id_3339 = 0;
    level._id_333A = 1;
    level._id_333D[level._id_3339] = "";
    level._id_333D[level._id_333A] = "";
    _id_A5E3::_id_8653();
    _id_A5DD::_id_25B6();
    _id_A5E7::_id_1226();
    thread _id_A5DE::_id_5CFA();
    _id_A5E2::_id_76F0();
    _id_A5E6::_id_A30E();
    _id_A5E4::_id_11A2();
    _id_A5DF::_id_5FF4();
    thread _id_0FB9();
    init_deathsdoor();
    _id_28A1( ::_id_2891 );
}

_id_108A( var_0 )
{
    if ( !isdefined( level._id_055B ) )
        level._id_055B = spawnstruct();

    level._id_055B._id_56C1 = var_0;
}

_id_0FB9()
{
    if ( !isdefined( level._id_055B._id_56C1 ) )
        level._id_055B._id_56C1 = 1.0;

    wait 0.05;

    if ( common_scripts\utility::_id_3839( "chyron_video_done" ) )
        common_scripts\utility::_id_384A( "chyron_video_done" );

    _func_080( 1, level._id_055B._id_56C1 );
}

_id_0FAA()
{
    return isdefined( level._id_055B._id_8A46 );
}

_id_1118()
{
    if ( !isdefined( level._id_055B ) )
        level._id_055B = spawnstruct();

    level._id_055B._id_8A46 = 1;
}

_id_108E()
{
    thread _id_1118();
}

_id_10A9( var_0 )
{
    level notify( var_0 + "_line_emitter_stop" );
}

_id_0FF4( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 0.1;
    var_7 = 0.1;

    if ( isdefined( var_4 ) )
    {
        var_6 = _func_0E1( var_4, 0 );
        var_7 = _func_0E1( var_4, 0 );
    }

    if ( isdefined( var_5 ) )
        var_7 = _func_0E1( var_5, 0 );

    var_8 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_8._id_09D6 = var_1;
    var_8._id_506C = 0;
    var_8._id_6E22 = var_2;
    var_8._id_6E23 = var_3;
    var_8._id_35DC = var_6;
    var_8._id_0241 = var_0;
    var_8 thread _id_1116();
    level waittill( var_0 + "_line_emitter_stop" );
    var_8 _meth_8071( 0, var_7 );
    wait(var_7);
    var_8 _id_A5FB::_id_8778();
    wait 0.05;
    var_8 delete();
}

_id_1116()
{
    level endon( self._id_0241 + "_line_emitter_stop" );
    var_0 = self._id_6E23 - self._id_6E22;
    var_1 = _func_114( var_0 );
    var_2 = _func_0EE( self._id_6E22, self._id_6E23 );
    var_3 = 0.1;

    for (;;)
    {
        var_4 = level._id_0318._id_02E2 - self._id_6E22;
        var_5 = _func_0F6( var_4, var_1 );
        var_5 = _func_0E9( var_5, 0, var_2 );
        var_6 = self._id_6E22 + var_1 * var_5;

        if ( !self._id_506C )
        {
            self._id_02E2 = var_6;
            _id_A5FB::_id_873E( self._id_09D6 );
            self _meth_8071( 0 );
            wait 0.05;
            self _meth_8071( 1.0, self._id_35DC );
            self._id_506C = 1;
        }
        else
            self _meth_82AA( var_6, var_3 );

        wait(var_3);
    }
}

_id_0FF7( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_0F30( 1.0, var_2 );
    var_5 = _id_0F30( 1.0, var_3 );
    var_6 = spawn( "script_origin", var_1 );
    _id_2897( var_6, var_0, var_4, var_5, 1 );
    return var_6;
}

_id_10AC( var_0, var_1 )
{
    var_2 = _id_0F30( 1.0, var_1 );
    _id_0F1C( var_0, var_2 );
}

_id_108D( var_0, var_1, var_2 )
{
    var_1 = _func_0E9( var_1, 0, 1.0 );
    var_3 = _id_0F30( 1.0, var_2 );
    var_0 _meth_8071( var_1, var_3 );
}

_id_108C( var_0, var_1 )
{
    if ( var_0 == 1.0 )
    {
        _id_A5DE::_id_5CFC( "music" );
        _id_A5DE::_id_5CF6( "music", var_1 );
    }
    else
    {
        _id_A5DE::_id_5CFE( "music", var_0, var_1 );
        _id_A5DE::_id_5CFB( "music" );
    }

    level._id_055B._id_24D0 = var_0;
}

_id_1089( var_0, var_1 )
{
    if ( var_0 == 1.0 )
    {
        _id_A5DE::_id_5CFC( "ambi" );
        _id_A5DE::_id_5CF6( "ambi", var_1 );
    }
    else
    {
        _id_A5DE::_id_5CFE( "ambi", var_0, var_1 );
        _id_A5DE::_id_5CFB( "ambi" );
    }

    level._id_055B._id_24CB = var_0;
}

_id_0F2F()
{
    var_0 = 1.0;

    if ( isdefined( level._id_055B._id_24D0 ) )
        var_0 = level._id_055B._id_24D0;

    return var_0;
}

_id_0F2D()
{
    var_0 = 1.0;

    if ( isdefined( level._id_055B._id_24CB ) )
        var_0 = level._id_055B._id_24CB;

    return var_0;
}

_id_97BD( var_0 )
{
    if ( !isdefined( level._id_055B ) )
        level._id_055B = spawnstruct();

    if ( !isdefined( level._id_055B._id_97A0 ) )
        level._id_055B._id_97A0 = [];

    var_1 = undefined;

    if ( isdefined( var_0 ) && var_0 )
    {
        if ( isdefined( self.ambient ) )
            var_1 = _func_124( self.ambient, " " );
    }
    else if ( isdefined( self._id_7950 ) )
        var_1 = _func_124( self._id_7950, " " );
    else if ( isdefined( self._id_110E ) )
        var_1 = _func_124( self._id_110E, " " );

    if ( isdefined( var_1 ) && var_1.size == 2 )
    {

    }
    else if ( isdefined( var_1 ) && var_1.size == 1 )
    {
        for (;;)
        {
            self waittill( "trigger", var_2 );
            _id_A5E7::_id_123A( var_1[0], self._id_79B4 );
        }
    }

    if ( isdefined( self._id_794C ) )
    {
        if ( !isdefined( level._id_055B._id_7003[self._id_794C] ) )
        {
            _id_102B( "Trying to set a progress_map_function without defining the envelope in the level.aud.envs array." );
            self._id_794C = undefined;
        }
    }

    if ( !isdefined( level._id_055B._id_979F ) )
        level._id_055B._id_979F = [];

    if ( isdefined( self._id_7946 ) )
        level._id_055B._id_979F[level._id_055B._id_979F.size] = self._id_7946;

    if ( isdefined( self._id_7948 ) )
        level._id_055B._id_979F[level._id_055B._id_979F.size] = self._id_7948;

    if ( isdefined( self._id_794B ) )
        level._id_055B._id_979F[level._id_055B._id_979F.size] = self._id_794B;

    if ( isdefined( self._id_794A ) )
        level._id_055B._id_979F[level._id_055B._id_979F.size] = self._id_794A;

    if ( !isdefined( self._id_7945 ) )
        self._id_7945 = "blend";

    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    if ( isdefined( self._id_04A4 ) )
    {
        if ( !isdefined( common_scripts\utility::_id_3E89() ) )
        {
            _id_102B( "Audo Zone Trigger at " + self._id_02E2 + " has defined a target, " + self._id_04A4 + ", but that target doesn't exist." );
            return;
        }

        if ( isdefined( _id_97B5() ) )
        {
            var_3 = _id_97B4();

            if ( !isdefined( _id_97B6() ) )
            {
                _id_102B( "Audo Zone Trigger at " + self._id_02E2 + " has defined a target, " + _id_97B5() + ", but that target doesn't exist." );
                return;
            }

            var_4 = _id_97B7();
        }
        else
        {
            var_6 = common_scripts\utility::_id_3E89();
            var_7 = 2 * ( self._id_02E2 - var_6._id_02E2 );
            var_8 = _func_115( var_7 );
            var_3 = _id_97B4();
            var_4 = var_3 + var_7;

            if ( _func_0EB( var_8[0] ) < 45 )
            {
                var_3 = ( var_3[0], var_3[1], 0 );
                var_4 = ( var_4[0], var_4[1], 0 );
            }
        }

        var_5 = _func_0EE( var_3, var_4 );
    }

    var_9 = 0;

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( _id_0FAA() && var_2 != level._id_0318 )
            continue;

        if ( isdefined( var_3 ) && isdefined( var_4 ) )
        {
            if ( isdefined( var_1 ) && isdefined( var_1[0] ) && isdefined( var_1[1] ) )
            {
                var_10 = _id_A5E7::_id_121B();

                if ( var_10 == var_1[0] )
                    var_9 = 0;
                else if ( var_10 == var_1[1] )
                    var_9 = 1;
                else if ( var_10 != "" )
                {
                    var_11 = _id_97BA( var_3, var_4, var_5, var_2._id_02E2 );

                    if ( var_11 < 0.5 )
                    {
                        _id_A5E7::_id_123A( var_1[0] );
                        var_9 = 0;
                    }
                    else
                    {
                        _id_A5E7::_id_123A( var_1[1] );
                        var_9 = 1;
                    }
                }
                else
                {

                }
            }
            else
            {
                var_11 = _id_97BA( var_3, var_4, var_5, var_2._id_02E2 );

                if ( var_11 < 0.5 )
                    var_9 = 0;
                else
                    var_9 = 1;
            }

            if ( !var_9 )
            {
                if ( isdefined( var_1 ) && isdefined( var_1[0] ) )
                {
                    if ( isdefined( level._id_065D ) && isdefined( var_1[1] ) )
                    {
                        var_12 = "enter_" + var_1[1];
                        _id_A5E8::_id_870C( "snd_zone_handler", var_12, var_1[0] );
                    }
                    else if ( isdefined( self._id_7947 ) )
                        _id_28A2( self._id_7947, var_1[0] );
                }
                else if ( isdefined( self._id_7947 ) )
                    _id_28A2( self._id_7947, "front" );

                if ( isdefined( self._id_7946 ) )
                {
                    if ( isdefined( var_1 ) && isdefined( var_1[0] ) )
                    {
                        if ( isdefined( level._id_055B._id_97A0[self._id_7946] ) )
                            [[ level._id_055B._id_97A0[self._id_7946] ]]( var_1[0] );
                    }
                    else if ( isdefined( level._id_055B._id_97A0[self._id_7946] ) )
                        [[ level._id_055B._id_97A0[self._id_7946] ]]( "front" );
                }
            }
            else
            {
                if ( isdefined( var_1 ) && isdefined( var_1[1] ) )
                {
                    if ( isdefined( level._id_065D ) )
                    {
                        var_12 = "enter_" + var_1[1];
                        _id_A5E8::_id_870C( "snd_zone_handler", var_12, var_1[1] );
                    }
                    else if ( isdefined( self._id_7947 ) )
                        _id_28A2( self._id_7947, var_1[1] );
                }
                else if ( isdefined( self._id_7947 ) )
                    _id_28A2( self._id_7947, "back" );

                if ( isdefined( self._id_7946 ) )
                {
                    if ( isdefined( var_1 ) && isdefined( var_1[1] ) )
                    {
                        if ( isdefined( level._id_055B._id_97A0[self._id_7946] ) )
                            [[ level._id_055B._id_97A0[self._id_7946] ]]( var_1[1] );
                    }
                    else if ( isdefined( level._id_055B._id_97A0[self._id_7946] ) )
                        [[ level._id_055B._id_97A0[self._id_7946] ]]( "back" );
                }
            }
        }
        else
        {
            if ( isdefined( self._id_7947 ) )
                _id_28A2( self._id_7947 );

            if ( isdefined( self._id_7946 ) )
            {
                if ( isdefined( level._id_055B._id_97A0[self._id_7946] ) )
                    [[ level._id_055B._id_97A0[self._id_7946] ]]();
            }
        }

        var_13 = undefined;

        if ( isdefined( _id_97B8( var_1, var_9 ) ) && isdefined( _id_97B9( var_1, var_9 ) ) )
        {
            var_13 = _id_A5E7::_id_123F( _id_97B8( var_1, var_9 ), _id_97B9( var_1, var_9 ) );

            if ( isdefined( var_13 ) )
                var_13._id_5D35 = self._id_7945;
        }

        if ( isdefined( var_13 ) )
        {
            if ( isdefined( var_13._id_36CA ) || isdefined( var_13._id_36CB ) )
            {
                if ( !level._id_055B._id_A3E9._id_662B._id_36C5 )
                {
                    _id_A5F7::_id_86C2( 0 );
                    _id_A5F7::_id_86C2( 1 );
                }
            }
        }

        var_14 = -1;
        var_11 = -1;

        while ( var_2 _meth_80AB( self ) )
        {
            if ( isdefined( self._id_794A ) )
            {
                var_15 = _id_97BB( var_3, var_4, var_2._id_02E2 );

                if ( isdefined( level._id_055B._id_97A0[self._id_794A] ) )
                    [[ level._id_055B._id_97A0[self._id_794A] ]]( var_15 );
            }

            if ( isdefined( var_3 ) && isdefined( var_4 ) )
            {
                var_11 = _id_97BA( var_3, var_4, var_5, var_2._id_02E2 );

                if ( isdefined( self._id_794C ) )
                    var_11 = _id_2899( var_11, level._id_055B._id_7003[self._id_794C] );

                if ( var_11 != var_14 )
                {
                    if ( isdefined( _id_97B8( var_1, var_9 ) ) && isdefined( _id_97B9( var_1, var_9 ) ) )
                        _id_A5E7::_id_1227( _id_97B8( var_1, var_9 ), _id_97B9( var_1, var_9 ), var_11 );

                    if ( isdefined( self._id_794D ) )
                        _id_28A2( self._id_794D, var_11 );

                    if ( isdefined( self._id_794B ) )
                    {
                        if ( isdefined( level._id_055B._id_97A0[self._id_794B] ) )
                            [[ level._id_055B._id_97A0[self._id_794B] ]]( var_11 );
                    }

                    if ( isdefined( var_13 ) )
                        _id_97B3( var_11, var_13, var_9 );

                    var_14 = var_11;
                    _id_A5E7::_id_1229( var_11 );
                }
            }

            if ( isdefined( self._id_794E ) )
            {
                wait(self._id_794E);
                continue;
            }

            wait 0.1;
        }

        if ( isdefined( var_3 ) && isdefined( var_4 ) )
        {
            if ( var_11 > 0.5 )
            {
                if ( isdefined( var_1 ) && isdefined( var_1[1] ) )
                    _id_A5E7::_id_122A( var_1[1] );

                if ( isdefined( var_1 ) && isdefined( var_1[1] ) )
                {
                    if ( isdefined( level._id_065D ) )
                    {
                        var_16 = "exit_" + var_1[1];
                        _id_A5E8::_id_870C( "snd_zone_handler", var_16, var_1[1] );
                    }
                    else if ( isdefined( self._id_7949 ) )
                        _id_28A2( self._id_7949, var_1[1] );
                }
                else if ( isdefined( self._id_7949 ) )
                    _id_28A2( self._id_7949, "back" );

                if ( isdefined( self._id_7948 ) )
                {
                    if ( isdefined( var_1 ) && isdefined( var_1[1] ) )
                    {
                        if ( isdefined( level._id_055B._id_97A0[self._id_7948] ) )
                            [[ level._id_055B._id_97A0[self._id_7948] ]]( var_1[1] );
                    }
                    else if ( isdefined( level._id_055B._id_97A0[self._id_7948] ) )
                        [[ level._id_055B._id_97A0[self._id_7948] ]]( "back" );
                }

                var_11 = 1;
            }
            else
            {
                if ( isdefined( var_1 ) && isdefined( var_1[0] ) )
                    _id_A5E7::_id_122A( var_1[0] );

                if ( isdefined( var_1 ) && isdefined( var_1[0] ) )
                {
                    if ( isdefined( level._id_065D ) )
                    {
                        var_16 = "exit_" + var_1[1];
                        _id_A5E8::_id_870C( "snd_zone_handler", var_16, var_1[0] );
                    }
                    else if ( isdefined( self._id_7949 ) )
                        _id_28A2( self._id_7949, var_1[0] );
                }
                else if ( isdefined( self._id_7949 ) )
                    _id_28A2( self._id_7949, "front" );

                if ( isdefined( self._id_7948 ) )
                {
                    if ( isdefined( var_1 ) && isdefined( var_1[0] ) )
                    {
                        if ( isdefined( level._id_055B._id_97A0[self._id_7948] ) )
                            [[ level._id_055B._id_97A0[self._id_7948] ]]( var_1[0] );
                    }
                    else if ( isdefined( level._id_055B._id_97A0[self._id_7948] ) )
                        [[ level._id_055B._id_97A0[self._id_7948] ]]( "front" );
                }

                var_11 = 0;
            }

            if ( isdefined( var_13 ) )
                _id_97B3( var_11, var_13, var_9 );

            continue;
        }

        if ( isdefined( self._id_7949 ) )
            _id_28A2( self._id_7949 );

        if ( isdefined( self._id_7948 ) )
        {
            if ( isdefined( level._id_055B._id_97A0[self._id_7948] ) )
                [[ level._id_055B._id_97A0[self._id_7948] ]]();
        }
    }
}

_id_97BA( var_0, var_1, var_2, var_3 )
{
    if ( var_2 == 0 )
        return 0;

    if ( !isdefined( self._id_794F ) )
    {
        var_4 = _func_114( var_1 - var_0 );
        var_5 = var_3 - var_0;
        var_6 = _func_0F6( var_5, var_4 );
        var_6 /= var_2;
    }
    else
    {
        var_7 = _func_0EE( var_3, var_0 );
        var_6 = var_7 / var_2;
    }

    return _func_0E9( var_6, 0, 1.0 );
}

_id_97BB( var_0, var_1, var_2 )
{
    var_3 = _func_114( var_1 - var_0 );
    var_4 = var_2 - var_0;
    var_5 = _func_0F6( var_4, var_3 );
    return var_3 * var_5 + var_0;
}

_id_97B3( var_0, var_1, var_2 )
{
    var_0 = _func_0E9( var_0, 0, 1.0 );

    if ( var_2 )
        var_0 = 1.0 - var_0;

    var_3 = var_1._id_5D35;

    if ( var_3 == "blend" )
    {
        var_4 = 1.0 - var_0;
        var_5 = var_0;
        _id_A5E7::_id_123E( var_4, var_5, var_1 );
    }
    else if ( var_0 < 0.33 )
        _id_A5E7::_id_123A( var_1._id_A3E4 );
    else if ( var_0 > 0.66 )
        _id_A5E7::_id_123A( var_1._id_A3EE );
}

_id_97BC( var_0 )
{
    if ( !isdefined( level._id_055B._id_97A0 ) )
        level._id_055B._id_97A0 = [];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_3 = var_2[0];
        var_4 = var_2[1];
        level._id_055B._id_97A0[var_3] = var_4;
    }

    if ( isdefined( level._id_055B._id_979F ) )
    {
        foreach ( var_3 in level._id_055B._id_979F )
        {

        }

        level._id_055B._id_979F = undefined;
    }
}

_id_97B5()
{
    var_0 = common_scripts\utility::_id_3E89();
    return var_0._id_04A4;
}

_id_97B4()
{
    var_0 = common_scripts\utility::_id_3E89();
    return var_0._id_02E2;
}

_id_97B6()
{
    var_0 = common_scripts\utility::_id_3E89();
    return var_0 common_scripts\utility::_id_3E89();
}

_id_97B7()
{
    var_0 = _id_97B6();
    return var_0._id_02E2;
}

_id_97B8( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return undefined;

    if ( var_1 )
        return var_0[1];
    else
        return var_0[0];
}

_id_97B9( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return undefined;

    if ( var_1 )
        return var_0[0];
    else
        return var_0[1];
}

_id_0FF0( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_7 = spawn( "script_origin", var_0 );

    if ( !isdefined( var_3 ) )
        var_3 = _func_0EE( var_7._id_02E2, var_6._id_02E2 );

    if ( !isdefined( var_4 ) )
    {
        var_8 = 30;
        var_4 = 36 * var_8;
    }

    var_9 = _id_1111( var_7._id_02E2, var_6._id_02E2, var_3, var_4 );
    var_9[0] = ( var_9[0][0], var_9[0][1], var_6._id_02E2[2] );
    var_9[1] = ( var_9[1][0], var_9[1][1], var_6._id_02E2[2] );
    var_10 = _func_0EE( var_7._id_02E2, var_9[0] );

    if ( !isdefined( var_5 ) )
        var_5 = 1800;

    var_11 = var_10 / var_5;

    if ( isdefined( var_9 ) && var_9.size == 2 )
    {
        var_12 = spawn( "script_origin", var_7._id_02E2 );
        var_13 = spawn( "script_origin", var_7._id_02E2 );
        var_12 _id_A5FB::_id_872A( var_1 );
        var_13 _id_A5FB::_id_872A( var_2 );
        var_12 _meth_82AA( var_9[0], var_11, 0, 0 );
        var_13 _meth_82AA( var_9[1], var_11, 0, 0 );
    }
}

_id_1111( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1 - var_0;
    var_5 = _id_0EC2( var_4 );
    var_6 = _id_0EC2( var_4 );
    var_7 = _id_10D4( var_5 );
    var_8 = 0.5 * var_2 / var_7;
    var_5 = _id_1073( var_5, var_8 );
    var_6 = _id_1073( var_6, var_8 );
    var_5 = _id_1046( var_5, 90 );
    var_6 = _id_1046( var_6, -90 );
    var_9 = _id_10D4( var_4 );
    var_10 = var_3 / var_9;
    var_11 = _id_1073( var_4, var_10 );
    var_11 += var_4;
    var_11 += var_4;
    var_5 += var_11;
    var_6 += var_11;
    var_12 = [];
    var_12[0] = var_5;
    var_12[1] = var_6;
    return var_12;
}

_id_0F30( var_0, var_1 )
{
    var_2 = var_0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    return var_2;
}

_id_1073( var_0, var_1 )
{
    return ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] );
}

_id_1072( var_0, var_1 )
{
    return ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
}

_id_1046( var_0, var_1 )
{
    var_2 = var_0[0] * _func_0B7( var_1 ) - var_0[1] * _func_0B6( var_1 );
    var_3 = var_0[0] * _func_0B6( var_1 ) + var_0[1] * _func_0B7( var_1 );
    return ( var_2, var_3, var_0[2] );
}

_id_0EC2( var_0 )
{
    var_1 = ( 0, 0, 0 );
    var_1 += var_0;
    return var_1;
}

_id_10D4( var_0 )
{
    return _func_0E7( var_0[0] * var_0[0] + var_0[1] * var_0[1] );
}

_id_102C( var_0 )
{
    _id_1028( var_0, "synch_frame" );
}

_id_1028( var_0, var_1 )
{

}

_id_102D( var_0 )
{
    _id_1028( var_0, "warning" );
}

_id_102B( var_0 )
{
    _id_1028( var_0, "error" );
}

_id_102A( var_0 )
{
    _id_1028( var_0 );
}

_id_102E( var_0 )
{
    _id_1028( var_0, "zone" );
}

_id_102F( var_0 )
{
    _id_1028( var_0, "zone_small" );
}

_id_333F( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
        return var_0 == var_1;
    else
        return !isdefined( var_0 ) && !isdefined( var_1 );
}

_id_51DD( var_0 )
{
    return !isdefined( var_0 );
}

_id_0F1C( var_0, var_1 )
{
    var_0 _meth_8071( 0.0, var_1 );
    var_0 common_scripts\utility::_id_27CD( var_1 + 0.05, ::_meth_80AE );
    var_0 common_scripts\utility::_id_27CD( var_1 + 0.1, ::delete );
}

_id_0F19( var_0, var_1 )
{
    var_0 _meth_8071( 0.0, var_1 );
    wait(var_1 + 0.05);
    var_0 _meth_80AD();
    wait 0.05;
    var_0 delete();
}

_id_0FD4( var_0, var_1 )
{
    if ( var_0 <= var_1 )
        return var_0;
    else
        return var_1;
}

_id_0FC1( var_0, var_1 )
{
    if ( var_0 >= var_1 )
        return var_0;
    else
        return var_1;
}

_id_0EB9( var_0, var_1, var_2 )
{
    if ( var_0 < var_1 )
        var_0 = var_1;
    else if ( var_0 > var_2 )
        var_0 = var_2;

    return var_0;
}

_id_0F2E( var_0 )
{
    if ( _func_0CE( var_0 ) )
        return [ var_0[0][0], var_0[var_0.size - 1][0] ];
    else
        return [ var_0._id_3332[0][0], var_0._id_3332[var_0._id_3332.size - 1][0] ];
}

_id_1071( var_0, var_1, var_2 )
{
    var_1 = _id_0F30( 1, var_1 );
    var_2 = _id_0F30( 1, var_2 );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_0[var_3][0] *= var_1;
        var_0[var_3][1] *= var_2;
    }

    return var_0;
}

_id_1095( var_0, var_1, var_2 )
{
    return var_0 + var_2 * ( var_1 - var_0 );
}

_id_0FA9( var_0 )
{
    return var_0 == _func_0BC( var_0 / 2 ) * 2;
}

_id_0F18( var_0 )
{
    var_1 = 10.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _id_A5DE::_id_5CF2( "mute_music", 0.1 );
    wait 0.05;
    _id_A5DE::_id_5CF6( "mute_music", var_1 );
}

_id_0EB6()
{
    self endon( "cleanup" );

    if ( !isdefined( self._id_88AA ) )
        self._id_88AA = 0;

    self waittill( "sounddone" );

    if ( isdefined( self ) )
    {
        self._id_88AA = 1;
        self notify( "cleanup" );
    }
}

_id_0F7D( var_0 )
{
    return _id_333F( _id_A5E7::_id_121B(), var_0 );
}

_id_0F21( var_0 )
{
    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A["" + var_0];

        if ( isdefined( var_1 ) )
            return var_1[0];
    }
    else
    {
        for ( var_2 = 0; var_2 < level._id_2417.size; var_2++ )
        {
            var_3 = level._id_2417[var_2];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C42["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C42["exploder"] ) )
                continue;

            if ( _func_0BC( var_3._id_9C42["exploder"] ) != var_0 )
                continue;

            return var_3;
        }
    }

    return undefined;
}

_id_0EED( var_0, var_1, var_2, var_3 )
{
    thread _id_1112( var_0, var_1, var_2, var_3 );
}

_id_1112( var_0, var_1, var_2, var_3 )
{
    var_1 = _func_0E9( var_1, 0, 10 );
    var_4 = 1.0;

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    var_5 = var_4;

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    _id_A5DE::_id_5CF2( var_0, var_4 );
    wait(var_1);
    _id_A5DE::_id_5CF6( var_0, var_5 );
}

_id_0FE9( var_0 )
{
    return _func_0B4( 1, 100 ) <= var_0;
}

_id_10A2( var_0, var_1 )
{
    level endon( "aud_stop_slow_mo_gunshot" );
    var_2 = _func_0D9( "axis" );

    foreach ( var_4 in var_2 )
        var_4 thread _id_0F79( var_1 );

    var_6 = 0;
    var_7 = level._id_0318 _meth_830E();

    for (;;)
    {
        if ( level._id_0318 _meth_833A() )
        {
            if ( !var_6 )
            {
                var_6 = 1;
                [[ var_0 ]]( var_7 );
            }
        }
        else
            var_6 = 0;

        wait 0.05;
    }
}

_id_0F79( var_0 )
{
    level endon( "aud_stop_slow_mo_gunshot" );
    var_1 = level._id_0318 _meth_830E();

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_5 ) )
            [[ var_0 ]]( var_1, var_2, var_3, var_5, var_6 );
    }
}

_id_10AD()
{
    level notify( "aud_stop_slow_mo_gunshot" );
}

_id_10DC( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_2 ) )
    {
        var_4 = 60;

        if ( isdefined( var_3 ) )
            var_4 = var_3;

        var_5 = _func_0E2( var_0 );
        var_6 = ( var_0 - var_5 ) * 100;
        var_0 = var_5 + var_6 * 1 / var_4;
    }

    var_7 = var_0;

    if ( isdefined( var_1 ) && var_1 )
        _id_1094( var_7 );
    else
        wait(var_7);
}

_id_1094( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 thread _id_1119( var_0 );
    var_1 waittill( "slo_mo_wait_done" );
    var_1 delete();
}

_id_1119( var_0 )
{
    var_1 = 0;

    while ( var_1 < var_0 )
    {
        var_2 = getdvarfloat( "com_timescale" );
        var_1 += 0.05 / var_2;
        wait 0.05;
    }

    self notify( "slo_mo_wait_done" );
}

_id_1029( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self ) )
    {
        var_5 = ( 1, 1, 1 );
        var_6 = ( 1, 0, 0 );
        var_7 = ( 0, 1, 0 );
        var_8 = ( 0, 1, 1 );
        var_9 = 5;
        var_10 = var_5;

        if ( isdefined( var_1 ) )
            var_9 = var_1;

        if ( isdefined( var_2 ) )
        {
            var_10 = var_2;

            switch ( var_10 )
            {
                case "red":
                    var_10 = var_6;
                    break;
                case "white":
                    var_10 = var_5;
                    break;
                case "blue":
                    var_10 = var_8;
                    break;
                case "green":
                    var_10 = var_7;
                    break;
                default:
                    var_10 = var_5;
            }
        }

        if ( isdefined( var_4 ) )
            thread _id_1117( var_4 );

        self endon( "death" );
        self endon( "aud_stop_3D_print" );

        while ( isdefined( self ) )
        {
            var_11 = var_0;

            if ( isdefined( var_3 ) )
                var_11 += self [[ var_3 ]]();

            wait 0.05;
        }
    }
}

_id_1117( var_0 )
{
    self endon( "death" );
    wait(var_0);

    if ( isdefined( self ) )
        self notify( "aud_stop_3D_print" );
}

_id_0E5D( var_0, var_1 )
{
    level._id_055B._id_7003[var_0] = var_1;
}

_id_0F32( var_0 )
{
    if ( isdefined( level._id_055B._id_7003[var_0] ) )
        return level._id_055B._id_7003[var_0];
}

_id_5015()
{
    if ( !isdefined( level._id_055B._id_2669 ) )
        return 1;
    else
        return level._id_055B._id_2669;
}

_id_0EF0()
{
    level._id_0318._id_2A84 = 0;
    level._id_055B._id_2669 = 1;
}

_id_0EDE()
{
    level._id_0318._id_2A84 = 1;
    level._id_055B._id_2669 = 0;
}

_id_7498()
{
    if ( _id_5015() && isdefined( level._id_055B._id_4C02 ) )
    {
        level._id_055B._id_4C02 = undefined;
        _id_A5DE::_id_5CF6( "deaths_door", 2 );
        _id_A5E9::_id_86CD( "deathsdoor" );
        level notify( "kill_deaths_door_audio" );
        level._id_0318 _meth_848F( 0 );
        _id_A5E7::_id_122C( 0 );
        thread _id_A5E2::_id_76F3( level._id_055B._id_2668._id_74EC );
        _id_A5FB::_id_872B( "deaths_door_exit" );
    }
}

init_deathsdoor()
{
    level._id_055B._id_2668 = spawnstruct();
    level._id_055B._id_2668._id_74EC = undefined;
}

_id_7E07()
{
    level._id_055B._id_4C02 = 1;

    if ( !isdefined( level._id_055B._id_2668 ) )
        level._id_055B._id_2668 = spawnstruct();

    level._id_055B._id_2668._id_74EC = undefined;
    level._id_055B._id_2668._id_74EC = level._id_055B._id_24F8;

    if ( _id_5015() )
    {
        _id_A5E7::_id_122C( 1 );
        thread _id_A5E2::_id_76F3( "deathsdoor" );
        _id_A5DE::_id_5CF2( "deaths_door" );
        _id_A5E9::_id_86D3( "deathsdoor" );
        _id_A5FB::_id_872B( "deaths_door_intro" );
        _id_A5FB::_id_872B( "deaths_door_breaths", "kill_deaths_door_audio", 0, 0.5 );
        _id_A5FB::_id_873F( "deaths_door_loop", "kill_deaths_door_audio", 0, 0.5 );
        level._id_0318 _meth_848F( 1 );
    }
}

aud_restore_after_flashbang()
{
    _id_A5F7::_id_86DC( 2 );
    _id_A5E7::_id_122C( 0 );
}

aud_set_flashbang()
{
    _id_A5E7::_id_122C( 1 );
    _id_A5F7::_id_86DB( "flashbang", 0.5 );
}

_id_108B( var_0 )
{
    level._id_055B._id_360E = var_0;
}

_id_10DD()
{
    wait 0.05;

    while ( !common_scripts\utility::_id_3839( "missionfailed" ) )
        wait 0.05;

    var_0 = "shg_mission_failed_stinger";
    common_scripts\utility::_id_384A( "missionfailed" );

    if ( isdefined( level._id_055B._id_360E ) )
        var_0 = level._id_055B._id_360E;

    if ( _func_1CA( var_0 ) )
        _id_A5DF::_id_5FF7( var_0, 2, 4 );
}

_id_10D2()
{
    level._id_055B._id_9C28 = 1;
    _id_A5E7::_id_123D();
    _id_A5E2::_id_76F4();
    _id_A5DD::_id_25C7();
    _id_A5E6::_id_A314();
    _id_A5E6::_id_A310( "default" );
}

_id_7EC8( var_0 )
{
    _id_A5E8::_id_8759( var_0 );
    _id_10D2();
    level._id_055B._id_8F59["map"] = var_0;
}

_id_3E7B()
{
    return _id_A5E8::_id_86EC();
}

_id_7E02( var_0 )
{
    level._id_055B._id_8F59["damb"] = var_0;
}

_id_3D2C()
{
    if ( !isdefined( level._id_055B._id_8F59["damb"] ) )
        return "soundtables/" + level._id_038E + ".csv";
    else
        return "soundtables/" + level._id_055B._id_8F59["damb"];
}

_id_7E00( var_0 )
{
    level._id_055B._id_8F59["damb_comp"] = var_0;
}

_id_3D2A( var_0 )
{
    if ( !isdefined( level._id_055B._id_8F59["damb_comp"] ) )
        return "soundtables/" + level._id_038E + ".csv";
    else
        return "soundtables/" + level._id_055B._id_8F59["damb_comp"];
}

_id_7E01( var_0 )
{
    level._id_055B._id_8F59["damb_loops"] = var_0;
}

_id_3D2B( var_0 )
{
    if ( !isdefined( level._id_055B._id_8F59["damb_loops"] ) )
        return "soundtables/" + level._id_038E + ".csv";
    else
        return "soundtables/" + level._id_055B._id_8F59["damb_loops"];
}

_id_7EA8( var_0 )
{
    level._id_055B._id_8F59["reverb"] = var_0;
}

_id_3E53()
{
    if ( !isdefined( level._id_055B._id_8F59["reverb"] ) )
        return "soundtables/" + level._id_038E + ".csv";
    else
        return "soundtables/" + level._id_055B._id_8F59["reverb"];
}

_id_7F11( var_0 )
{
    level._id_055B._id_8F59["zone"] = var_0;
}

_id_3ED7()
{
    if ( !isdefined( level._id_055B._id_8F59["zone"] ) )
        return "soundtables/" + level._id_038E + ".csv";
    else
        return "soundtables/" + level._id_055B._id_8F59["zone"];
}

_id_0F31()
{
    return level._id_055B._id_6C27._id_57F1;
}

_id_0F34( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = _id_0F33();

    if ( isdefined( var_4 ) )
        var_3 = var_4;
    else
    {
        var_5 = 3;
        var_6 = 10;
        var_7 = 100;

        if ( isdefined( var_0 ) )
            var_5 = var_0;

        if ( isdefined( var_2 ) )
            var_7 = var_2;

        if ( isdefined( var_2 ) )
            var_6 = var_1;

        var_8 = 36 * var_7;
        var_9 = 36 * var_6;
        var_10 = _func_0D9( "bad_guys" );
        var_11 = 0;
        var_12 = 0;

        foreach ( var_14 in var_10 )
        {
            if ( isdefined( var_14.alertlevelint ) && var_14.alertlevelint >= var_5 )
            {
                var_15 = _func_0EE( level._id_0318._id_02E2, var_14._id_02E2 );

                if ( var_15 < var_8 )
                {
                    var_11++;

                    if ( var_15 < var_9 )
                        var_16 = 1.0;
                    else
                        var_16 = 1.0 - ( var_15 - var_9 ) / ( var_8 - var_9 );

                    var_12 += var_16;
                }
            }
        }

        if ( var_11 > 0 )
            var_3 = var_12 / var_11;
        else
            var_3 = 0;
    }

    return var_3;
}

_id_0F33()
{
    return level._id_055B._id_8E32;
}

_id_108F( var_0 )
{
    level._id_055B._id_8E32 = var_0;
}

_id_0EBA()
{
    level._id_055B._id_8E32 = undefined;
}

_id_0FDB( var_0 )
{
    var_1 = 0;
    var_2 = 3600;

    if ( isdefined( var_0 ) )
        var_2 = 36 * var_0;

    var_3 = _func_0D9( "bad_guys" );

    foreach ( var_5 in var_3 )
    {
        if ( _func_1A1( var_5 ) )
        {
            var_6 = _func_0EE( level._id_0318._id_02E2, var_5._id_02E2 );

            if ( var_6 < var_2 )
                var_1++;
        }
    }

    return var_1;
}

_id_2897( var_0, var_1, var_2, var_3, var_4 )
{
    var_2 = _id_0EB9( var_2, 0.0, 1.0 );
    var_3 = _id_0FC1( 0.05, var_3 );
    var_5 = 0;

    if ( isdefined( var_4 ) )
        var_5 = var_4;

    if ( var_5 )
        var_0 _id_A5FB::_id_873E( var_1 );
    else
        var_0 _id_A5FB::_id_872A( var_1 );

    var_0 _meth_8071( 0.0 );
    var_0 common_scripts\utility::_id_27CD( 0.05, ::_meth_8071, var_2, var_3 );
}

_id_289B( var_0, var_1 )
{
    return _func_24D( var_0, var_1 );
}

_id_2899( var_0, var_1 )
{
    return _func_24D( var_0, var_1 );
}

_id_289A( var_0, var_1, var_2, var_3 )
{
    var_4 = ( var_0 - var_1 ) / ( var_2 - var_1 );
    var_4 = _func_0E9( var_4, 0.0, 1.0 );
    return _func_24D( var_4, var_3 );
}

_id_28A1( var_0 )
{
    level._id_055B._id_5BB8[level._id_055B._id_5BB8.size] = var_0;
}

_id_28A5( var_0, var_1, var_2 )
{
    thread _id_28A6( var_0, var_1, var_2 );
}

_id_28A2( var_0, var_1, var_2 )
{
    _id_28A5( var_0, var_1, var_2 );
}

_id_28A6( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = 0;

    foreach ( var_6 in level._id_055B._id_5BB8 )
    {
        var_4 = self [[ var_6 ]]( var_0, var_1 );

        if ( !var_3 && isdefined( var_4 ) && var_4 == 1 )
        {
            var_3 = var_4;
            continue;
        }

        if ( !var_3 && !isdefined( var_4 ) )
            var_3 = 1;
    }

    if ( isdefined( var_2 ) )
        self notify( var_2 );

    if ( !var_3 )
        _id_102D( "\\tAUDIO MESSAGE NOT HANDLED: " + var_0 );
}

_id_0FF5( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = 1;
    var_5 = self;

    if ( isdefined( var_2 ) )
        _id_2892( var_0, var_1, var_3, var_4 );
    else
        _id_2894( var_0, var_5, var_1, var_3, var_4 );
}

_id_28AA( var_0 )
{
    _id_A5FB::_id_872A( var_0, "sounddone" );
    self waittill( "sounddone" );
    wait 0.05;
    self delete();
}

_id_2893( var_0, var_1, var_2, var_3 )
{
    _id_10DC( var_1, var_2, var_3 );
    var_4 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_4 thread _id_28AA( var_0 );
    return var_4;
}

_id_289C( var_0 )
{
    var_1 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_1 thread _id_28AA( var_0 );
    return var_1;
}

_id_2892( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = thread _id_2893( var_0, var_1, var_2, var_3 );
    return var_5;
}

_id_2894( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    thread _id_2895( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

_id_2895( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    _id_10DC( var_2, var_3, var_4, var_5 );
    thread _id_289E( var_0, var_1, var_6, var_7, var_8, var_9 );
}

_id_28A8( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_0 == "loop" )
    {
        level endon( var_2 + "internal" );
        _id_A5FB::_id_873E( var_1 );
        level waittill( var_2 );

        if ( isdefined( self ) )
        {
            if ( isdefined( var_4 ) )
            {
                self _meth_8071( 0, var_4 );
                wait(var_4);
            }

            _id_A5FB::_id_8778();
            wait 0.05;
            self delete();
        }
    }
    else if ( var_0 == "oneshot" )
    {
        _id_A5FB::_id_872A( var_1, "sounddone" );

        if ( isdefined( var_3 ) )
            self _meth_8071( var_3, 0 );

        self waittill( "sounddone" );

        if ( isdefined( self ) )
            self delete();
    }
}

_id_28A7( var_0, var_1, var_2 )
{
    level endon( var_1 );

    while ( isdefined( self ) )
        wait 0.1;

    level notify( var_1 + "internal" );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_2 ) )
        {
            var_0 _meth_8071( 0, var_2 );
            wait(var_2);
        }

        var_0 _id_A5FB::_id_8778();
        wait 0.05;
        var_0 delete();
    }
}

_id_289E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = "oneshot";

    if ( isdefined( var_2 ) )
        var_8 = var_2;

    var_9 = var_1._id_02E2;

    if ( isdefined( var_6 ) )
        var_9 = var_6;

    var_10 = spawn( "script_origin", var_9 );

    if ( isdefined( var_4 ) )
        var_10 _meth_804F( var_1, "tag_origin", var_4, ( 0, 0, 0 ) );
    else
        var_10 _meth_804F( var_1 );

    if ( var_8 == "loop" )
        var_1 thread _id_28A7( var_10, var_3, var_7 );

    var_10 thread _id_28A8( var_8, var_0, var_3, var_5, var_7 );
    return var_10;
}

_id_28A0( var_0, var_1, var_2 )
{
    _id_A5FB::_id_872A( var_0, "sounddone" );

    if ( isdefined( var_2 ) )
    {
        wait(var_2);
        self _meth_80AE();
    }
    else
        self waittill( "sounddone" );

    wait 0.05;
    self delete();
}

_id_289F( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_1 );
    var_3 thread _id_28A0( var_0, var_1, var_2 );
    return var_3;
}

_id_28A4( var_0 )
{
    _id_A5F7::_id_8757( var_0 );
}

_id_28A3( var_0, var_1, var_2, var_3 )
{
    _id_A5F7::_id_8754( var_0, var_1, var_3 );
}

_id_2896()
{
    self waittill( "sounddone" );
    _id_28A9();
}

_id_28A9()
{
    common_scripts\utility::_id_27CD( 0.05, ::delete );
}

_id_2891( var_0, var_1 )
{
    var_2 = 1;

    switch ( var_0 )
    {
        case "level_fade_to_black":
            var_3 = var_1[0];
            var_4 = var_1[1];
            wait(var_3);
            _id_A5DE::_id_5D00( "mute_all", var_4 );
            break;
        case "generic_building_bomb_shake":
            level._id_0318 _id_A5FB::_id_872A( "sewer_bombs" );
            break;
        case "start_player_slide_trigger":
            break;
        case "end_player_slide_trigger":
            break;
        case "missile_fired":
            break;
        case "msg_audio_fx_ambientExp":
            break;
        case "DEPRECATED_aud_play_sound_at":
            _id_289F( var_1._id_09D6, var_1._id_6E57 );
            break;
        case "aud_play_dynamic_explosion":
            if ( isdefined( var_1._id_8AA4 ) )
                var_5 = var_1._id_8AA4;
            else
                var_5 = undefined;

            if ( isdefined( var_1._id_71EB ) )
                var_6 = var_1._id_71EB;
            else
                var_6 = undefined;

            if ( isdefined( var_1._id_0500 ) )
                var_7 = var_1._id_0500;
            else
                var_7 = undefined;

            _id_0FF0( var_1._id_3544, var_1._id_566E, var_1._id_7517, var_5, var_6, var_7 );
            break;
        case "DEPRECATED_aud_play_conversation":
            _id_289D( var_0, var_1 );
            break;
        case "xm25_contact_explode":
            if ( _func_1CA( "xm25_proj_explo" ) )
            {
                var_8 = var_1;
                thread common_scripts\utility::_id_69C2( "xm25_proj_explo", var_8 );
            }

            break;
        case "light_flicker_on":
            var_9 = var_1;
            _id_2898( var_9 );
            break;
        default:
            var_2 = 0;
    }

    return var_2;
}

_id_2898( var_0 )
{
    var_1 = 0;

    switch ( var_0._id_029C )
    {
        case "furniture_lamp_floor1_off":
        case "com_cafe_light_part1_off":
        case "furniture_lamp_table1":
            var_1 = 1;

            if ( _func_1CA( "paris_lamplight_flicker" ) )
                thread common_scripts\utility::_id_69C2( "paris_lamplight_flicker", var_0._id_02E2 );

            break;
        default:
            var_1 = 0;
    }

    return var_1;
}

_id_289D( var_0, var_1 )
{
    var_2 = var_1;
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_3[var_4] = var_2[var_4]._id_32D5._id_132D;
        var_2[var_4]._id_32D5._id_132D = 0;
    }

    foreach ( var_6 in var_2 )
    {
        if ( isdefined( var_6._id_27C0 ) )
            wait(var_6._id_27C0);

        var_7 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_7 _meth_804F( var_6._id_32D5, "", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        var_7 _id_A5FB::_id_872A( var_6._id_8899, "sounddone" );
        var_7 waittill( "sounddone" );
        wait 0.05;
        var_7 delete();
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_2[var_4]._id_32D5._id_132D = var_3[var_4];
}

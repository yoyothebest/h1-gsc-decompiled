// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_828B( var_0 )
{
    var_1 = [];

    if ( isdefined( var_0._id_79FC ) )
        return level._id_9CC8[var_0._id_79FC];

    return var_1;
}

_id_82E3()
{
    var_0 = _id_05BE();

    foreach ( var_2 in var_0 )
        var_2 thread _id_9D43();
}

_id_9D43()
{
    self endon( "entitydeleted" );

    if ( isdefined( self._id_7A1C ) )
    {
        var_0 = self._id_7A1C;

        if ( !isdefined( level._id_9CF4[var_0] ) )
            level._id_9CF4[var_0] = [];

        level._id_9CF4[var_0][level._id_9CF4[var_0].size] = self;
    }

    if ( isdefined( self._id_7987 ) )
        thread _id_A581::_id_9D46();

    thread _id_9D04();
    self.count = 1;
    self._id_8900 = [];

    for (;;)
    {
        var_1 = undefined;
        self waittill( "spawned", var_1 );
        self.count--;

        if ( !isdefined( var_1 ) )
            continue;

        var_1._id_88FE = self._id_8900;
        var_1._id_03D9 = self;
        var_1 thread _id_A581::_id_76B6();
    }
}

_id_9D04()
{
    if ( !isdefined( self._id_7B12 ) )
        return;

    if ( !isdefined( self._id_7A26 ) )
        return;

    var_0 = getentarray( self._id_7A26, "script_linkname" );

    if ( var_0.size == 0 )
        return;

    var_1 = var_0[0]._id_04A6;
    var_0 = getentarray( var_1, "targetname" );
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        if ( var_4.classname == "script_origin" )
            var_2 = var_4;

        var_4 _meth_8056();
    }

    foreach ( var_4 in var_0 )
    {
        if ( var_4 != var_2 )
            var_4 _meth_804F( var_2 );
    }

    self waittill( "spawned", var_8 );

    foreach ( var_4 in var_0 )
    {
        var_4 _meth_8055();

        if ( var_4 != var_2 )
            var_4 _meth_804F( var_8 );
    }

    var_8 waittill( "death" );
    common_scripts\utility::_id_0CDB( var_0, ::delete );
}

_id_5091()
{
    if ( !isdefined( self.classname ) )
        return 0;

    if ( self.classname == "trigger_multiple" )
        return 1;

    if ( self.classname == "trigger_radius" )
        return 1;

    if ( self.classname == "trigger_lookat" )
        return 1;

    return self.classname == "trigger_disk";
}

_id_97D5( var_0 )
{
    var_1 = var_0 _id_5091();
    var_0._id_6FF9 = undefined;

    if ( isdefined( var_0._id_0398 ) && var_0._id_0398 == "trigger_multiple" )
        var_1 = 0;

    var_2 = _id_828B( var_0 );
    var_3 = isdefined( var_0._id_7B1A );
    var_4 = isdefined( var_0._id_7B13 ) && ( _id_5057( var_0 ) || _id_5058( var_0 ) );
    var_5 = isdefined( var_0._id_29B6 ) && !( _id_5057( var_0 ) || _id_5058( var_0 ) );
    var_6 = 1;

    while ( var_6 )
    {
        var_0 waittill( "trigger", var_7 );

        if ( isdefined( var_0._id_7B1C ) )
        {
            if ( !isdefined( var_7._id_7B1C ) )
                continue;

            if ( var_7._id_7B1C != var_0._id_7B1C )
                continue;
        }

        if ( isdefined( var_0._id_310D ) && !var_0._id_310D )
            var_0 waittill( "enable" );

        if ( isdefined( var_0._id_79D8 ) )
            common_scripts\utility::_id_383F( var_0._id_79D8 );

        if ( isdefined( var_0._id_79D4 ) )
            common_scripts\utility::_id_3831( var_0._id_79D4 );

        if ( var_4 )
            var_7 thread _id_66C3( var_0 );
        else if ( var_5 && isdefined( var_7 ) )
            var_7 thread _id_66C1( var_0 );

        var_0 _id_A5A4::_id_0392();

        if ( var_1 )
            var_6 = 0;

        if ( isdefined( var_0._id_7B17 ) )
        {
            if ( !isdefined( level._id_9CB2[var_0._id_7B17] ) )
                level._id_9CB2[var_0._id_7B17] = [];

            common_scripts\utility::_id_0CF0( level._id_9CB2[var_0._id_7B17], _id_A5A4::_id_284E );
        }

        if ( var_3 )
            _id_062F( var_0._id_7B1A );

        if ( var_2.size > 0 && var_1 )
            common_scripts\utility::_id_0CF0( var_2, ::_id_66C4 );

        if ( isdefined( var_0._id_7B1B ) )
        {
            if ( !isdefined( level._id_9D49[var_0._id_7B1B] ) )
                return;

            common_scripts\utility::_id_0CF0( level._id_9D49[var_0._id_7B1B], ::_id_05C6 );
        }
    }
}

_id_97D6( var_0, var_1 )
{
    var_2 = var_0 _id_5091();
    var_0._id_6FF9 = undefined;

    if ( isdefined( var_0._id_0398 ) && var_0._id_0398 == "trigger_multiple" )
        var_2 = 0;

    var_3 = _id_828B( var_0 );
    var_4 = isdefined( var_0._id_7B1A );
    var_5 = isdefined( var_0._id_7B13 ) && ( _id_5057( var_0 ) || _id_5058( var_0 ) );
    var_6 = isdefined( var_0._id_29B6 ) && !( _id_5057( var_0 ) || _id_5058( var_0 ) );
    var_7 = 1;

    if ( isdefined( var_0._id_7B1C ) )
    {
        if ( !isdefined( var_1._id_7B1C ) )
            return;

        if ( var_1._id_7B1C != var_0._id_7B1C )
            return;
    }

    if ( isdefined( var_0._id_310D ) && !var_0._id_310D )
        var_0 waittill( "enable" );

    if ( isdefined( var_0._id_79D8 ) )
        common_scripts\utility::_id_383F( var_0._id_79D8 );

    if ( isdefined( var_0._id_79D4 ) )
        common_scripts\utility::_id_3831( var_0._id_79D4 );

    if ( var_5 )
        var_1 thread _id_66C3( var_0 );
    else if ( var_6 && isdefined( var_1 ) )
        var_1 thread _id_66C1( var_0 );

    var_0 _id_A5A4::_id_0392();

    if ( var_2 )
        var_7 = 0;

    if ( isdefined( var_0._id_7B17 ) )
    {
        if ( !isdefined( level._id_9CB2[var_0._id_7B17] ) )
            level._id_9CB2[var_0._id_7B17] = [];

        common_scripts\utility::_id_0CF0( level._id_9CB2[var_0._id_7B17], _id_A5A4::_id_284E );
    }

    if ( var_4 )
        _id_062F( var_0._id_7B1A );

    if ( var_3.size > 0 && var_2 )
        common_scripts\utility::_id_0CF0( var_3, ::_id_66C4 );

    if ( isdefined( var_0._id_7B1B ) )
    {
        if ( !isdefined( level._id_9D49[var_0._id_7B1B] ) )
            return;

        common_scripts\utility::_id_0CF0( level._id_9D49[var_0._id_7B1B], ::_id_05C6 );
    }
}

_id_66C2( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level._id_9CB5[var_0._id_7B13] )
    {
        if ( var_3 != var_0 )
        {
            if ( !_id_513F( var_3 ) )
                var_1 = var_3;
        }
    }

    return var_1;
}

_id_66C3( var_0 )
{
    var_1 = _id_66C2( var_0 );

    if ( isdefined( var_1 ) )
        thread _id_0689( var_1 );
}

_id_22FE( var_0 )
{
    return ( isdefined( self._id_2639 ) || self._id_01E6 < self._id_4786 || var_0._id_797F == "forced" ) && ( !isdefined( var_0._id_28AE ) || var_0._id_797F == "plane" );
}

_id_22FD( var_0 )
{
    return isdefined( var_0._id_28AE ) && var_0._id_28AE;
}

_id_66C1( var_0 )
{
    var_1 = _func_1EC( var_0._id_04A4, "targetname" );
    var_2 = _id_66C2( var_1 );

    if ( !isdefined( var_2 ) )
        return;

    if ( var_0._id_29B6 && !isdefined( var_2._id_7B14 ) )
        return;

    if ( isdefined( var_2._id_797F ) )
    {
        if ( !_id_22FE( var_2 ) )
            return;

        self notify( "crashpath", var_2 );
        var_2._id_28AE = 1;
        self notify( "newpath" );
        _id_063F( var_0, var_2 );
        return;
    }
    else
    {
        if ( _id_22FD( var_2 ) )
            return;

        if ( isdefined( var_2._id_7B14 ) )
        {
            if ( !isdefined( self._id_7B14 ) )
                return;

            if ( var_2._id_7B14 != self._id_7B14 )
                return;
        }

        self notify( "newpath" );
        _id_063F( var_1, var_2 );
        thread _id_29B5( var_2 );

        if ( !_id_513F( var_1 ) && !( isdefined( var_0._id_7B34 ) && var_0._id_7B34 ) )
            var_0._id_29B6 = 1;

        self._id_0DF6 = var_2;
        thread _id_0689();

        if ( self _meth_822B() && isdefined( var_1._id_7AFA ) )
            thread _id_74F7( var_1 );

        return;
    }
}

_id_74F7( var_0 )
{
    self endon( "death" );
    var_0 waittillmatch( "trigger", self );
    self._id_04FC = var_0._id_7AFA;

    if ( self._id_04FC == "forward" )
        _id_A2FF( 1 );
    else
        _id_A2FF( 0 );
}

_id_063F( var_0, var_1 )
{
    self _meth_827C( var_0, var_1 );
}

_id_29B5( var_0 )
{
    self endon( "death" );
    self._id_29B7 = var_0;
    var_0 waittillmatch( "trigger", self );
    self._id_29B7 = undefined;
}

_id_9CF8( var_0, var_1 )
{
    if ( isdefined( var_0._id_0396 ) )
        level._id_9D03 = _id_0CD9( level._id_9D03, var_0._id_0396, var_0 );

    if ( isdefined( var_0._id_7B1B ) )
        level._id_9D49 = _id_0CD9( level._id_9D49, var_0._id_7B1B, var_0 );

    if ( isdefined( var_0._id_7B17 ) )
        level._id_9CB2 = _id_0CD9( level._id_9CB2, var_0._id_7B17, var_0 );
}

_id_88D2( var_0 )
{
    var_1 = [];
    var_2 = _id_A5A4::_id_32DC( "no_riders_until_unload" );

    foreach ( var_4 in var_0 )
    {
        var_4.count = 1;
        var_5 = 0;

        if ( isdefined( var_4._id_79AD ) )
        {
            var_5 = 1;
            var_6 = _id_A5A4::_id_2F2A( var_4 );
        }
        else
        {
            var_7 = isdefined( var_4._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );
            var_8 = var_4;

            if ( isdefined( var_4._id_7ACE ) )
                var_8 = _id_A581::_id_3E68( var_4, 1 );

            if ( isdefined( var_4._id_79EB ) || var_2 )
                var_6 = var_8 _meth_8096( var_7 );
            else
                var_6 = var_8 _meth_8095( var_7 );

            if ( isdefined( var_4._id_7ACE ) )
            {
                if ( isdefined( var_4._id_7ADC ) )
                    var_6._id_7ADC = var_4._id_7ADC;
            }
        }

        if ( !var_5 && !_func_1A1( var_6 ) )
            continue;

        var_1[var_1.size] = var_6;
    }

    var_1 = _id_7371( var_1 );
    return var_1;
}

_id_7371( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !_id_0916( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_0916( var_0 )
{
    if ( _func_1A1( var_0 ) )
        return 1;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_0.classname ) )
        return 0;

    return var_0.classname == "script_model";
}

_id_8906()
{
    if ( _id_A5A4::_id_32DC( "no_riders_until_unload" ) && !_id_A5A4::_id_32D8( "no_riders_until_unload" ) )
        return [];

    var_0 = _id_3EB4();

    if ( !var_0.size )
        return [];

    var_1 = [];
    var_2 = _id_88D2( var_0 );
    var_2 = common_scripts\utility::_id_0CDD( var_2, _id_3EB3() );
    var_2 = _id_888E( var_2 );

    foreach ( var_4 in var_2 )
        thread _id_A5A9::_id_4492( var_4 );

    return var_2;
}

_id_8973( var_0 )
{
    if ( !isdefined( var_0 ) )
        return _id_8906();

    var_1 = _id_3EB4();

    if ( !var_1.size )
        return [];

    var_2 = [];
    var_3 = self.classname;

    if ( isdefined( level._id_9D69[var_3] ) && isdefined( level._id_9D69[var_3][var_0] ) )
    {
        var_4 = level._id_9D69[var_3][var_0];

        foreach ( var_6 in var_4 )
            var_2[var_2.size] = var_1[var_6];

        var_8 = _id_88D2( var_2 );

        for ( var_9 = 0; var_9 < var_4.size; var_9++ )
            var_8[var_9]._id_7ADC = var_4[var_9];

        var_8 = common_scripts\utility::_id_0CDD( var_8, _id_3EB3() );
        var_8 = _id_888E( var_8 );

        foreach ( var_11 in var_8 )
            thread _id_A5A9::_id_4492( var_11 );

        return var_8;
    }
    else
        return _id_8906();
}

_id_888E( var_0 )
{
    var_1 = [];
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4._id_7ADC ) )
        {
            var_1[var_1.size] = var_4;
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    if ( getdvarint( "enableMW1GetArrayKeysAndForEach" ) != 0 )
        return common_scripts\utility::_id_0CDD( var_1, var_2 );

    return common_scripts\utility::array_combine_reverse_keys( var_1, var_2 );
}

_id_8132( var_0 )
{
    var_1 = _func_1EC( var_0._id_04A6, "target" );

    if ( !isdefined( var_1 ) )
        return;

    var_1._id_29B6 = 0;

    if ( common_scripts\utility::_id_3839( "ca_blockout" ) && !common_scripts\utility::_id_382E( "ca_blockout" ) )
    {

    }

    _id_0788( var_1 );
}

_id_992C()
{
    var_0 = _id_A5A9::_id_3EAE();

    foreach ( var_3, var_2 in self._id_750A )
    {
        if ( !_func_1A1( var_2 ) )
            continue;

        if ( isdefined( var_0[var_2._id_9D1B] ) )
            self._id_750A[var_3] = _id_A5A9::_id_4482( var_2, var_2._id_9D1B );
    }
}

_id_0788( var_0 )
{
    if ( isdefined( var_0._id_6FF9 ) )
        return;

    level._id_9D1C[level._id_9D1C.size] = var_0;
    var_0._id_6FF9 = 1;
}

_id_513F( var_0 )
{
    if ( !isdefined( var_0._id_04A4 ) )
        return 1;

    if ( !isdefined( _func_1EC( var_0._id_04A4, "targetname" ) ) && !isdefined( _id_3EBA( var_0._id_04A4 ) ) )
        return 1;

    return 0;
}

_id_3E19( var_0 )
{
    var_1 = ::_id_3D82;

    if ( _id_05D8() && isdefined( var_0._id_04A4 ) )
    {
        if ( isdefined( _id_3D7E( var_0._id_04A4 ) ) )
            var_1 = ::_id_3D7E;

        if ( isdefined( _id_3D80( var_0._id_04A4 ) ) )
            var_1 = ::_id_3D80;
    }

    return var_1;
}

_id_612A( var_0, var_1, var_2 )
{
    if ( self._id_0DF6 == var_0 )
    {
        waitframe;
        return;
    }

    self _meth_80C7( var_0 );
    self waittill( "reached_wait_node" );
}

_id_9FE4( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;

    for ( var_5 = var_2; isdefined( var_2 ) && var_4 < 3; var_2 = [[ var_3 ]]( var_2._id_04A4 ) )
    {
        var_4++;
        thread _id_612B( var_0, var_1, var_2 );

        if ( !isdefined( var_2._id_04A4 ) )
            return;
    }
}

_id_612B( var_0, var_1, var_2 )
{
    self endon( "newpath" );
    self endon( "death" );
    var_0 endon( var_1 );
    var_2 waittill( "trigger" );
    var_2._id_9811 = gettime();
    waitframe;
    var_0 notify( var_1 );
}

_id_9D19( var_0 )
{
    self notify( "newpath" );

    if ( isdefined( var_0 ) )
        self._id_0DF6 = var_0;

    var_1 = self._id_0DF6;
    self._id_251D = self._id_0DF6;

    if ( !isdefined( var_1 ) )
        return;

    self endon( "newpath" );
    self endon( "death" );
    var_2 = var_1;
    var_3 = undefined;
    var_4 = var_1;
    var_5 = _id_3E19( var_1 );

    while ( isdefined( var_4 ) )
    {
        if ( isdefined( var_4._id_9D7B ) )
            prepare_vehicle_play_anim_from_node();

        _id_612A( var_4, var_3, var_5 );

        if ( !isdefined( self ) )
            return;

        if ( isdefined( var_4._id_6544 ) )
            level thread _id_97D6( var_4, self );

        self._id_251D = var_4;

        if ( isdefined( var_4._id_9D7B ) )
        {
            vehicle_play_anim_from_node( var_4 );
            break;
        }

        if ( isdefined( var_4._id_3C5B ) && !var_4._id_3C5B )
            thread _id_66C5( var_4 );

        if ( isdefined( var_4.script_volumedown ) )
            thread _id_A5A8::volume_down( var_4.script_volumedown );

        if ( isdefined( var_4.script_volumeup ) )
            thread _id_A5A8::volume_up( var_4.script_volumeup );

        if ( isdefined( var_4._id_0398 ) )
        {
            self notify( var_4._id_0398 );
            self notify( "noteworthy", var_4._id_0398 );
        }

        waitframe;

        if ( !isdefined( self ) )
            return;

        if ( isdefined( var_4._id_7AA6 ) )
        {
            var_4._id_79BF = var_4._id_7AA6;
            var_4._id_7AA6 = undefined;
        }

        if ( isdefined( var_4._id_79BF ) )
        {
            var_6 = var_4._id_79C0;

            if ( isdefined( var_6 ) )
                level _id_A5A4::_id_27EF( var_6, common_scripts\_exploder::_id_3528, var_4._id_79BF );
            else
                level common_scripts\_exploder::_id_3528( var_4._id_79BF );
        }

        if ( isdefined( var_4._id_79D8 ) )
        {
            if ( isdefined( self.vehicle_flags ) )
                self.vehicle_flags[var_4._id_79D8] = 1;

            self notify( "vehicle_flag_arrived", var_4._id_79D8 );
            common_scripts\utility::_id_383F( var_4._id_79D8 );
        }

        if ( isdefined( var_4._id_79BC ) )
            _id_A5A4::_id_32DE( var_4._id_79BC );

        if ( isdefined( var_4._id_79BB ) )
            _id_A5A4::_id_32DA( var_4._id_79BB );

        if ( isdefined( var_4._id_79D4 ) )
            common_scripts\utility::_id_3831( var_4._id_79D4 );

        if ( isdefined( var_4._id_0398 ) )
        {
            if ( var_4._id_0398 == "kill" || var_4._id_0398 == "forcekill" )
                _id_05AF();

            if ( var_4._id_0398 == "godon" )
                self._id_4257 = 1;

            if ( var_4._id_0398 == "godoff" )
                self._id_4257 = 0;

            if ( var_4._id_0398 == "deleteme" )
            {
                level thread _id_A5A4::_id_284E( self );
                return;
            }

            if ( var_4._id_0398 == "engineoff" )
                self _meth_8287();
        }

        if ( isdefined( var_4._id_7980 ) )
            self._id_7980 = var_4._id_7980;

        if ( isdefined( var_4._id_7957 ) )
            self._id_7957 = var_4._id_7957;

        if ( isdefined( var_4._id_7B04 ) )
        {
            if ( var_4._id_7B04 )
                _id_05F0();
            else
                _id_05EF();
        }

        if ( isdefined( var_4._id_7AEF ) )
            self._id_7AEF = var_4._id_7AEF;

        if ( isdefined( var_4._id_7AFE ) )
            self notify( "turning", var_4._id_7AFE );

        if ( isdefined( var_4._id_7989 ) )
        {
            if ( var_4._id_7989 == 0 )
                thread _id_2665();
            else
                thread _id_2666();
        }

        if ( isdefined( var_4._id_7B11 ) )
        {
            if ( isdefined( var_4._id_7A99 ) && var_4._id_7A99 == "queue" )
                self._id_7097 = 1;

            if ( isdefined( var_4._id_7ADC ) )
                self._id_443C = var_4._id_7ADC;

            thread _id_A5A8::_id_9C7F( var_4._id_7B11 );
        }

        if ( isdefined( var_4._id_7B24 ) )
            _id_A2FF( var_4._id_7B24 );

        if ( _id_9D3C( ::_id_612A, var_4 ) )
            thread _id_9A42( var_4 );

        if ( isdefined( var_4._id_7AFA ) )
        {
            self._id_04FC = var_4._id_7AFA;

            if ( self._id_04FC == "forward" )
                _id_A2FF( 1 );
            else
                _id_A2FF( 0 );
        }

        if ( isdefined( var_4._id_7962 ) )
            self._id_04EF = var_4._id_7962;

        if ( isdefined( var_4._id_7A9B ) )
            self._id_04F7 = var_4._id_7A9B;

        if ( isdefined( var_4._id_79BD ) )
        {
            var_7 = 35;

            if ( isdefined( var_4._id_798B ) )
                var_7 = var_4._id_798B;

            self _meth_827F( 0, var_7 );
            _id_A5A4::_id_32E0( var_4._id_79BD );

            if ( !isdefined( self ) )
                return;

            var_8 = 60;

            if ( isdefined( var_4._id_7929 ) )
                var_8 = var_4._id_7929;

            self _meth_828D( var_8 );
        }

        if ( isdefined( var_4._id_0392 ) )
        {
            var_7 = 35;

            if ( isdefined( var_4._id_798B ) )
                var_7 = var_4._id_798B;

            self _meth_827F( 0, var_7 );

            if ( isdefined( var_4._id_04A4 ) )
                thread _id_662D( [[ var_5 ]]( var_4._id_04A4 ) );

            var_4 _id_A5A4::_id_0392();
            self notify( "delay_passed" );
            var_8 = 60;

            if ( isdefined( var_4._id_7929 ) )
                var_8 = var_4._id_7929;

            self _meth_828D( var_8 );
        }

        if ( isdefined( var_4._id_79DA ) )
        {
            if ( !isdefined( self.vehicle_flags ) )
                self.vehicle_flags = [];

            self.vehicle_flags[var_4._id_79DA] = 1;
            self notify( "vehicle_flag_arrived", var_4._id_79DA );

            if ( !common_scripts\utility::_id_382E( var_4._id_79DA ) )
                self _meth_827F( 0, 35 );

            common_scripts\utility::_id_384A( var_4._id_79DA );
            self _meth_828D( 10 );
        }

        if ( isdefined( self._id_7E6E ) )
        {
            self._id_7E6E = undefined;
            self _meth_8262();
        }

        if ( isdefined( var_4._id_7B0C ) )
            thread _id_5746( var_4._id_7B0C );

        if ( isdefined( var_4._id_7B0D ) )
            thread _id_5748( var_4._id_7B0D );

        if ( isdefined( var_4._id_79E6 ) )
            thread _id_9D2F( var_4._id_79E6 );

        var_3 = var_4;

        if ( !isdefined( var_4._id_04A4 ) )
            break;

        var_4 = [[ var_5 ]]( var_4._id_04A4 );

        if ( !isdefined( var_4 ) )
        {
            var_4 = var_3;
            break;
            continue;
        }

        if ( _id_513F( var_4 ) || isdefined( var_4._id_7B06 ) )
        {
            var_9 = _func_0E1( 0.01, _func_0F1( self _meth_8283() ) );
            var_10 = _func_0EE( self._id_02E2, var_4._id_02E2 );
            var_11 = _func_0E1( 0.01, var_10 / var_9 );
            self notify( "about_to_stop", var_11 );
        }
    }

    if ( isdefined( var_4._id_7A1F ) )
        thread _id_0688();

    self notify( "reached_dynamic_path_end" );

    if ( isdefined( self._id_7B10 ) )
    {
        self notify( "delete" );
        self delete();
    }
}

_id_9D18( var_0, var_1, var_2 )
{
    self notify( "newpath" );
    self endon( "newpath" );
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( isdefined( var_0 ) )
        self._id_0DF6 = var_0;

    var_3 = self._id_0DF6;
    self._id_251D = self._id_0DF6;

    if ( !isdefined( var_3 ) )
        return;

    var_4 = var_3;

    if ( var_1 )
        self waittill( "start_dynamicpath" );

    if ( isdefined( var_2 ) )
    {
        var_5 = spawnstruct();
        var_5._id_02E2 = _id_A5A4::_id_07C2( self._id_02E2, var_2 );
        _id_4801( var_5, undefined );
    }

    var_6 = undefined;
    var_7 = var_3;
    var_8 = _id_3E19( var_3 );

    while ( isdefined( var_7 ) )
    {
        if ( isdefined( var_7._id_7A26 ) )
            _id_7E6D( var_7 );

        _id_4801( var_7, var_6 );

        if ( !isdefined( self ) )
            return;

        self._id_251D = var_7;

        if ( isdefined( var_7._id_3C5B ) && !var_7._id_3C5B )
            thread _id_66C5( var_7 );

        var_7 notify( "trigger", self );

        if ( isdefined( var_7.script_volumedown ) )
            thread _id_A5A8::volume_down( var_7.script_volumedown );

        if ( isdefined( var_7.script_volumeup ) )
            thread _id_A5A8::volume_up( var_7.script_volumeup );

        if ( isdefined( var_7._id_7A0D ) )
        {
            self _meth_828F( var_7._id_7A0D );

            if ( var_7._id_7A0D == "faster" )
                self _meth_8290( 25, 50 );
        }

        if ( isdefined( var_7._id_0398 ) )
        {
            self notify( var_7._id_0398 );
            self notify( "noteworthy", var_7._id_0398 );
        }

        waitframe;

        if ( !isdefined( self ) )
            return;

        if ( isdefined( var_7._id_7AA6 ) )
        {
            var_7._id_79BF = var_7._id_7AA6;
            var_7._id_7AA6 = undefined;
        }

        if ( isdefined( var_7._id_79BF ) )
        {
            var_9 = var_7._id_79C0;

            if ( isdefined( var_9 ) )
                level _id_A5A4::_id_27EF( var_9, common_scripts\_exploder::_id_3528, var_7._id_79BF );
            else
                level common_scripts\_exploder::_id_3528( var_7._id_79BF );
        }

        if ( isdefined( var_7._id_79D8 ) )
        {
            if ( isdefined( self.vehicle_flags ) )
                self.vehicle_flags[var_7._id_79D8] = 1;

            self notify( "vehicle_flag_arrived", var_7._id_79D8 );
            common_scripts\utility::_id_383F( var_7._id_79D8 );
        }

        if ( isdefined( var_7._id_79BC ) )
            _id_A5A4::_id_32DE( var_7._id_79BC );

        if ( isdefined( var_7._id_79BB ) )
            _id_A5A4::_id_32DA( var_7._id_79BB );

        if ( isdefined( var_7._id_79D4 ) )
            common_scripts\utility::_id_3831( var_7._id_79D4 );

        if ( isdefined( var_7._id_0398 ) )
        {
            if ( var_7._id_0398 == "kill" || var_7._id_0398 == "forcekill" )
                _id_05AF();

            if ( var_7._id_0398 == "godon" )
                self._id_4257 = 1;

            if ( var_7._id_0398 == "godoff" )
                self._id_4257 = 0;

            if ( var_7._id_0398 == "deleteme" )
            {
                level thread _id_A5A4::_id_284E( self );
                return;
            }

            if ( var_7._id_0398 == "engineoff" )
                self _meth_8287();
        }

        if ( isdefined( var_7._id_7980 ) )
            self._id_7980 = var_7._id_7980;

        if ( isdefined( var_7._id_7957 ) )
            self._id_7957 = var_7._id_7957;

        if ( isdefined( var_7._id_7B04 ) )
        {
            if ( var_7._id_7B04 )
                _id_05F0();
            else
                _id_05EF();
        }

        if ( isdefined( var_7._id_7AEF ) )
            self._id_7AEF = var_7._id_7AEF;

        if ( isdefined( var_7._id_7AFE ) )
            self notify( "turning", var_7._id_7AFE );

        if ( isdefined( var_7._id_7989 ) )
        {
            if ( var_7._id_7989 == 0 )
                thread _id_2665();
            else
                thread _id_2666();
        }

        if ( isdefined( var_7._id_7B11 ) )
        {
            if ( isdefined( var_7._id_7A99 ) && var_7._id_7A99 == "queue" )
                self._id_7097 = 1;

            if ( isdefined( var_7._id_7ADC ) )
                self._id_443C = var_7._id_7ADC;

            thread _id_A5A8::_id_9C7F( var_7._id_7B11 );
        }

        if ( isdefined( var_7._id_7B24 ) )
            _id_A2FF( var_7._id_7B24 );

        if ( _id_9D3C( ::_id_4801, var_7 ) )
            thread _id_9A42( var_7 );

        if ( self _meth_822B() )
        {
            if ( isdefined( var_7._id_7AFA ) )
            {
                self._id_04FC = var_7._id_7AFA;

                if ( self._id_04FC == "forward" )
                    _id_A2FF( 1 );
                else
                    _id_A2FF( 0 );
            }

            if ( isdefined( var_7._id_7A9B ) )
                self._id_04F7 = var_7._id_7A9B;
        }

        if ( isdefined( var_7._id_79DA ) )
        {
            if ( !isdefined( self.vehicle_flags ) )
                self.vehicle_flags = [];

            self.vehicle_flags[var_7._id_79DA] = 1;
            self notify( "vehicle_flag_arrived", var_7._id_79DA );
            common_scripts\utility::_id_384A( var_7._id_79DA );

            if ( isdefined( var_7._id_798F ) )
                wait(var_7._id_798F);

            self notify( "delay_passed" );
        }

        if ( isdefined( self._id_7E6E ) )
        {
            self._id_7E6E = undefined;
            self _meth_8262();
        }

        if ( isdefined( var_7._id_7B0C ) )
            thread _id_5746( var_7._id_7B0C );

        if ( isdefined( var_7._id_7B0D ) )
            thread _id_5748( var_7._id_7B0D );

        if ( isdefined( var_7._id_79E6 ) )
            thread _id_9D2F( var_7._id_79E6 );

        var_6 = var_7;

        if ( !isdefined( var_7._id_04A4 ) )
            break;

        var_7 = [[ var_8 ]]( var_7._id_04A4 );

        if ( !isdefined( var_7 ) )
        {
            var_7 = var_6;
            break;
        }
    }

    if ( isdefined( var_7._id_7A1F ) )
        thread _id_0688();

    self notify( "reached_dynamic_path_end" );

    if ( isdefined( self._id_7B10 ) )
        self delete();
}

_id_9D3C( var_0, var_1 )
{
    if ( isdefined( var_1._id_7B06 ) )
        return 1;

    if ( var_0 != ::_id_612A )
        return 0;

    if ( !_id_513F( var_1 ) )
        return 0;

    if ( isdefined( self._id_2D3D ) )
        return 0;

    if ( self._id_04FF == "empty" )
        return 0;

    return !_id_507B();
}

_id_662D( var_0 )
{

}

_id_507B()
{
    if ( !isdefined( self._id_7B10 ) )
        return 0;

    return self._id_7B10;
}

must_stop_at_next_point( var_0 )
{
    if ( isdefined( var_0._id_7B06 ) )
        return 1;

    return isdefined( var_0._id_79DA ) && !common_scripts\utility::_id_382E( var_0._id_79DA );
}

_id_4801( var_0, var_1 )
{
    self endon( "newpath" );

    if ( isdefined( var_0._id_7B06 ) && isdefined( self._id_367F ) )
    {
        var_0._id_0351 = 2;
        var_2 = _id_A5A4::_id_4417( var_0._id_02E2 ) + ( 0, 0, self._id_367F );

        if ( var_2[2] > var_0._id_02E2[2] - 2000 )
            var_0._id_02E2 = _id_A5A4::_id_4417( var_0._id_02E2 ) + ( 0, 0, self._id_367F );

        self _meth_824F( 0, 0, 0 );
    }

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1._id_03E2 ) )
        {
            var_3 = var_1._id_03E2;
            var_4 = 25;
            var_5 = undefined;

            if ( isdefined( var_1._id_798B ) )
                var_5 = var_1._id_798B;
            else if ( must_stop_at_next_point( var_0 ) )
            {

            }

            if ( isdefined( var_1._id_7929 ) )
                var_4 = var_1._id_7929;
            else
            {
                var_6 = var_3 / 4;

                if ( var_4 > var_6 )
                    var_4 = var_6;
            }

            if ( isdefined( var_5 ) )
                self _meth_827F( var_3, var_4, var_5 );
            else
                self _meth_827F( var_3, var_4 );
        }
        else if ( must_stop_at_next_point( var_0 ) )
        {

        }
    }

    setvehgoalnode( var_0 );

    if ( isdefined( var_0._id_0351 ) )
    {
        self _meth_8256( var_0._id_0351 );
        common_scripts\utility::_id_A069( "near_goal", "goal" );
    }
    else
        self waittill( "goal" );

    if ( isdefined( var_0._id_7AE5 ) )
    {
        if ( var_0._id_7AE5 )
            self notify( "reached_stop_node" );

        if ( isdefined( var_0._id_0392 ) )
            wait(var_0._id_0392);
    }
}

helipath( var_0, var_1, var_2 )
{
    self _meth_8291( 30 );
    self _meth_827F( var_1, var_2, 10 );
    _id_A5A8::_id_9D17( common_scripts\utility::_id_40FB( var_0, "targetname" ) );
}

setvehgoalnode( var_0 )
{
    self endon( "death" );
    var_1 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( isdefined( var_0._id_7AE5 ) )
        var_1 = var_0._id_7AE5;

    if ( isdefined( var_0._id_7B06 ) )
        var_1 = 1;

    var_2 = isdefined( var_0._id_793B ) && var_0._id_793B;
    var_3 = isdefined( var_0._id_7A04 ) && var_0._id_7A04;

    if ( isdefined( var_0._id_793B ) || isdefined( var_0._id_7A04 ) )
        _id_39CE( var_0, var_3, var_2 );
    else
        unforcetarget();

    if ( isdefined( var_0._id_79DA ) )
    {
        if ( !common_scripts\utility::_id_382E( var_0._id_79DA ) )
            var_1 = 1;
    }

    if ( !isdefined( var_0._id_04A4 ) )
        var_1 = 1;

    _id_834E( var_0._id_02E2, var_1 );
}

_id_39CE( var_0, var_1, var_2 )
{
    if ( var_1 )
    {
        self _meth_825B();
        self _meth_8258( var_0.angles[1] );
    }
    else
    {
        self _meth_8259();
        self _meth_825A( var_0.angles[1] );
    }
}

unforcetarget()
{
    self _meth_8259();
    self _meth_825B();
}

_id_66C4( var_0 )
{
    var_0._id_3C5B = 1;
    var_0 notify( "gate opened" );
}

_id_66C5( var_0 )
{
    self endon( "death" );
    self._id_A047 = 1;
    _id_068C( "path_gate_wait_till_open", 15, 15 );
    var_0 waittill( "gate opened" );
    self._id_A047 = 0;

    if ( self._id_01E6 > 0 )
    {
        self endon( "death" );

        if ( isdefined( self._id_A047 ) && self._id_A047 )
            return;

        _id_068A( "path_gate_wait_till_open" );
    }
}

_id_738C()
{
    wait 0.05;
    self._id_9D44 = undefined;
}

_id_9CEA( var_0 )
{
    var_1 = var_0.classname;

    if ( isdefined( level._id_9CE3[var_1] ) )
    {
        foreach ( var_3 in level._id_9CE3[var_1] )
            var_0 _meth_804A( var_3 );
    }

    if ( var_0._id_04FF == "empty" )
    {
        var_0 thread _id_4062();
        return;
    }

    var_0 _id_A5A4::_id_7DB5();

    if ( !isdefined( var_0._id_5D41 ) )
        var_0._id_5D41 = 0;

    var_5 = var_0._id_04FF;
    var_0 _id_9CF9();
    var_0 _id_9D37();

    if ( !isdefined( level._id_9D76[var_0._id_04FF][var_0.classname] ) )
        return;

    var_0 thread [[ level._id_9D76[var_0._id_04FF][var_0.classname] ]]();
    var_0 thread _id_5908();
    var_0 thread _id_6DE2();

    if ( !isdefined( var_0._id_7954 ) )
        var_0._id_7954 = 0;

    if ( isdefined( level._id_9CB7 ) )
    {
        if ( level._id_9CB7 )
            var_0 _meth_8029();
    }

    var_0 _id_A5A4::_id_32DD( "unloaded" );
    var_0 _id_A5A4::_id_32DD( "loaded" );
    var_0._id_750A = [];
    var_0._id_9A44 = [];
    var_0._id_9A3C = "default";
    var_0._id_3680 = [];

    if ( isdefined( level._id_9C8D ) && isdefined( level._id_9C8D[var_1] ) )
    {
        var_6 = level._id_9C8D[var_1];
        var_7 = _func_1D3( var_6 );

        foreach ( var_9 in var_7 )
        {
            var_0._id_3680[var_9] = undefined;
            var_0._id_3681[var_9] = 0;
        }
    }

    var_0 thread _id_9C8F();

    if ( isdefined( var_0._id_7B0D ) )
        var_0 thread _id_5748( var_0._id_7B0D );

    if ( isdefined( var_0._id_7A06 ) )
        var_0._id_4257 = 1;

    var_0._id_257E = [];

    if ( !var_0 _id_50DF() || var_0 _id_50E0() )
        var_0 thread _id_3A9F();

    var_0 thread _id_A5A9::_id_451F();

    if ( isdefined( var_0._id_79EE ) )
        var_0 _meth_8254( var_0._id_79EE, &"" );

    if ( !var_0 _id_50DF() )
        var_0 thread _id_9CDD();

    if ( isdefined( var_0._id_79AB ) )
        var_0._id_2D3D = 1;

    if ( !var_0 _id_50DF() )
        var_0 thread _id_9D39();

    var_0 thread _id_9D2C();

    if ( isdefined( var_0._id_7AA1 ) && var_0._id_7AA1 )
        var_0 thread _id_A5A4::_id_6802();

    var_0 thread _id_9D5A();
    var_0 thread _id_4B69();
    var_0 thread _id_0C55();

    if ( isdefined( var_0._id_7987 ) )
        var_0 thread _id_A581::_id_9CAD();

    if ( !var_0 _id_50DF() )
        var_0 thread _id_5BD0();

    if ( isdefined( level._id_9D7D ) )
        level thread [[ level._id_9D7D ]]( var_0 );

    _id_9CF8( var_0 );

    if ( isdefined( var_0._id_7AEF ) )
        var_0 _meth_8255( var_0._id_7AEF );

    if ( !var_0 _id_50DF() )
        var_0 thread _id_2B35();

    var_0 thread _id_4062();

    if ( isdefined( level._id_4BBC ) )
        var_11 = level._id_4BBC;
    else
        var_11 = 0;

    if ( var_0 _id_472F() && !var_11 )
        var_0 thread _id_0995();

    if ( var_0 _meth_822B() )
    {
        if ( isdefined( var_0._id_7A9B ) )
            var_0._id_04F7 = var_0._id_7A9B;
    }

    var_0 _id_8906();
    var_0 thread _id_9CEE();
    var_0 _id_0CA8();
}

_id_50E0()
{
    return isdefined( level._id_1CAC ) && level._id_1CAC;
}

_id_5303( var_0 )
{
    if ( !isdefined( level._id_9CAA ) || !isdefined( level._id_9CAA[var_0] ) )
        return;

    if ( isdefined( self._id_2658 ) )
        var_1 = self._id_2658;
    else
        var_1 = level._id_9CAA[var_0]._id_5A2A;

    if ( isdefined( self._id_2659 ) )
        var_2 = self._id_2659;
    else
        var_2 = level._id_9CAA[var_0]._id_5C40;

    if ( isdefined( level._id_9CAA[var_0]._id_27C0 ) )
        wait(level._id_9CAA[var_0]._id_27C0);

    if ( !isdefined( self ) )
        return;

    if ( level._id_9CAA[var_0]._id_1488 )
        level._id_0318 _meth_8134( 0 );

    self _meth_81D8( self._id_02E2 + level._id_9CAA[var_0]._id_6379, level._id_9CAA[var_0]._id_7131, var_1, var_2, self );

    if ( level._id_9CAA[var_0]._id_1488 )
        level._id_0318 _meth_8134( 1 );
}

_id_9CF0( var_0, var_1 )
{
    var_2 = self._id_04FF;
    var_3 = self.classname;
    var_4 = self._id_029C;
    var_5 = self._id_04A6;
    thread _id_5303( var_3 );
    thread _id_52FB( var_3 );
    thread _id_531F( var_3 );
    _id_A5A9::_id_2807();
    var_6 = get_deathanim_info( var_3 );

    if ( isdefined( var_6 ) && isdefined( var_6.need_dummy ) && var_6.need_dummy )
    {
        var_7 = "body_animate_jnt";
        _id_A5A8::_id_9D58( var_7, 0 );
    }

    if ( isdefined( level._id_9CAE[var_3] ) )
        thread _id_7E05( level._id_9CAE[var_3], level._id_9CAF[var_3] );
    else if ( isdefined( level._id_9CAE[var_4] ) )
        thread _id_7E05( level._id_9CAE[var_4], level._id_9CAF[var_4] );

    var_8 = _id_9D3A( var_4, var_0, var_1 );
    thread kill_deathanim_thread( var_3, var_0 );
    thread _id_05DA( var_4, var_8 );

    if ( self.code_classname == "script_vehicle" )
        thread _id_531B( var_3 );

    return var_8;
}

_id_9CEE()
{
    self endon( "nodeath_thread" );
    var_0 = self._id_04FF;
    var_1 = self.classname;
    var_2 = self._id_029C;
    var_3 = self._id_04A6;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = 0;

    for (;;)
    {
        if ( isdefined( self ) )
            self waittill( "death", var_4, var_5, var_6 );

        if ( isdefined( self._id_253C ) )
            self thread [[ self._id_253C ]]();

        if ( !var_7 )
        {
            var_7 = 1;

            if ( isdefined( var_4 ) && isdefined( var_5 ) )
            {
                var_4 _id_A56F::_id_72DF( self, var_5, var_6 );

                if ( isdefined( self._id_258C ) )
                    self._id_258C = undefined;
            }

            if ( _id_A5A4::_id_5083() && !_id_A5A4::_id_5087() && isdefined( var_4 ) && _func_1AD( var_4 ) )
            {
                if ( var_4._id_04A7 != self._id_7AEF )
                    var_4 thread _id_A5A4::_id_4210( "kill", 500 );

                if ( isdefined( self._id_750A ) )
                {
                    foreach ( var_9 in self._id_750A )
                    {
                        if ( _func_1A1( var_9 ) && _func_0CF( var_9 ) )
                            var_4 thread _id_A5A4::_id_4210( "kill" );
                    }
                }
            }
        }

        self notify( "clear_c4" );

        if ( isdefined( self._id_76A2 ) )
            self._id_76A2 delete();

        if ( isdefined( self._id_5BD5 ) )
        {
            common_scripts\utility::_id_0CF0( self._id_5BD5, ::_id_9955 );
            self._id_5BD5 = undefined;
        }

        if ( isdefined( self._id_7AEF ) )
            level._id_9D7A[self._id_7AEF] = common_scripts\utility::_id_0CF6( level._id_9D7A[self._id_7AEF], self );

        if ( isdefined( self._id_0396 ) )
            level._id_9D03[self._id_0396] = common_scripts\utility::_id_0CF6( level._id_9D03[self._id_0396], self );

        if ( isdefined( self._id_7B1B ) )
            level._id_9D49[self._id_7B1B] = common_scripts\utility::_id_0CF6( level._id_9D49[self._id_7B1B], self );

        if ( isdefined( self._id_7B17 ) )
            level._id_9CB2[self._id_7B17] = common_scripts\utility::_id_0CF6( level._id_9CB2[self._id_7B17], self );

        if ( isdefined( self._id_5D40 ) )
            self._id_5D40 thread _id_5746( "all", var_1 );

        if ( !isdefined( self ) || _id_500E() )
        {
            if ( isdefined( self._id_750A ) )
            {
                foreach ( var_9 in self._id_750A )
                {
                    if ( isdefined( var_9 ) )
                        var_9 delete();
                }
            }

            if ( _id_500E() )
            {
                self._id_750A = [];
                continue;
            }

            self notify( "delete_destructible" );
            return;
        }

        var_13 = undefined;

        if ( isdefined( self._id_9D2E ) )
            var_13 = self._id_9D2E;
        else if ( isdefined( level._id_9D2D ) && isdefined( level._id_9D2D[var_1] ) )
            var_13 = level._id_9D2D;
        else if ( isdefined( level._id_9D2C[var_1] ) )
            var_13 = level._id_9D2C[var_1];

        if ( isdefined( var_13 ) )
            self _meth_80B1( var_13._id_7675 );

        if ( isdefined( level._id_9CAB ) && isdefined( var_0 ) && isdefined( level._id_9CAB[var_0] ) )
            thread [[ level._id_9CAB[var_0] ]]();

        if ( isdefined( var_0 ) && isdefined( _id_A5A9::_id_44C4 ) && isdefined( self._id_750A ) )
            common_scripts\utility::_id_0CF0( self._id_750A, _id_A5A9::_id_44C4, var_4, var_0 );

        var_14 = _id_9CF0( var_4, var_5 );

        if ( isdefined( self._id_2825 ) )
        {
            wait 0.05;

            if ( !isdefined( self._id_2D30 ) && !self _meth_822B() )
                self _meth_8059();

            _id_05B0();
            wait 0.05;
            _id_9CC3( var_2 );
            self delete();
            continue;
        }

        if ( isdefined( self._id_3A15 ) )
        {
            self notify( "newpath" );

            if ( !isdefined( self._id_2D30 ) )
                self _meth_8059();

            _id_9CEF();
            _id_05B0();
            return;
        }

        _id_9CB6( var_2, var_4, var_5, var_14 );

        if ( !isdefined( self ) )
            return;

        if ( isdefined( level._id_9CA6[var_1] ) )
            _func_18C( level._id_9CA6[var_1]._id_782D, level._id_9CA6[var_1]._id_0136, self._id_02E2, level._id_9CA6[var_1]._id_0351 );

        wait 0.5;

        if ( _id_500E() )
            continue;

        if ( isdefined( self ) )
        {
            while ( isdefined( self._id_2D35 ) && isdefined( self ) )
                wait 0.05;

            if ( !isdefined( self ) )
                continue;

            if ( self _meth_822B() )
            {
                while ( isdefined( self ) && self._id_04F9 != 0 )
                    wait 1;

                if ( !isdefined( self ) )
                    return;

                self _meth_8059();
                self notify( "kill_badplace_forever" );
                self _meth_8054();
                self notify( "newpath" );
                self _meth_8287();
                return;
            }
            else
                _id_05B0();

            if ( self._id_5D41 )
                self _meth_8056();
        }

        if ( _id_0687() )
        {
            self delete();
            continue;
        }
    }
}

_id_05B0()
{
    self notify( "newpath" );
    self _meth_8251();
    _id_A5A4::_id_27EF( 0.05, ::_id_35A2 );
}

_id_35A2()
{
    self.accuracy = undefined;
    self._id_0DF4 = undefined;
    self._id_0E27 = undefined;
    self._id_126B = undefined;
    self._id_126C = undefined;
    self._id_2516 = undefined;
    self._id_251D = undefined;
    self._id_257E = undefined;
    self._id_27E6 = undefined;
    self._id_3680 = undefined;
    self._id_3FD7 = undefined;
    self._id_4746 = undefined;
    self._id_4786 = undefined;
    self._id_6382 = undefined;
    self._id_6383 = undefined;
    self._id_756E = undefined;
    self._id_7677 = undefined;
    self._id_7679 = undefined;
    self._id_768D = undefined;
    self._id_7940 = undefined;
    self._id_7954 = undefined;
    self._id_7940 = undefined;
    self._id_7954 = undefined;
    self._id_7965 = undefined;
    self._id_79A0 = undefined;
    self._id_0396 = undefined;
    self._id_7A76 = undefined;
    self._id_7AEF = undefined;
    self._id_7AFF = undefined;
    self._id_7B04 = undefined;
    self._id_7B19 = undefined;
    self._id_7B1A = undefined;
    self._id_7B1B = undefined;
    self._id_843E = undefined;
    self._id_844A = undefined;
    self._id_88FE = undefined;
    self._id_8900 = undefined;
    self._id_916F = undefined;
    self._id_04A4 = undefined;
    self._id_91AF = undefined;
    self._id_9826 = undefined;
    self._id_9826 = undefined;
    self._id_9827 = undefined;
    self._id_994F = undefined;
    self._id_9950 = undefined;
    self._id_9951 = undefined;
    self._id_1268 = undefined;
    self._id_0DF6 = undefined;
    self._id_1268 = undefined;
    self._id_7691 = undefined;
    self._id_7694 = undefined;
    self._id_769B = undefined;
    self._id_76A2 = undefined;
    self._id_76E4 = undefined;
    self._id_7A81 = undefined;
    self._id_7ADB = undefined;
    self._id_925B = undefined;
    self._id_9951 = undefined;
    self._id_99A7 = undefined;
    self._id_99A8 = undefined;
    self._id_99B1 = undefined;
    self._id_99B6 = undefined;
    self._id_99B7 = undefined;
    self._id_9A29 = undefined;
    self._id_9A3C = undefined;
    self._id_9A44 = undefined;
    self._id_9BFD = undefined;
    self._id_9D45 = undefined;
    self._id_A047 = undefined;
    self._id_A286 = undefined;
    self._id_A288 = undefined;
    self._id_6385 = undefined;
    self._id_792C = undefined;
    self._id_A288 = undefined;
    self._id_A2FE = undefined;
    self._id_2D3D = undefined;
    self._id_2D30 = undefined;
    self._id_7A06 = undefined;
    self._id_32D8 = undefined;
    self._id_3584 = undefined;
    self._id_4257 = undefined;
    self._id_04FF = undefined;
    self._id_9D4C = undefined;
    self._id_30EC = undefined;
    self._id_9408 = undefined;
    self._id_278F = undefined;
    self._id_7957 = undefined;
    self._id_A287 = undefined;
    self.treadsoundfxisalreadyplaying = undefined;
    self.oldtreadsoundfx = undefined;
}

_id_0687()
{
    return isdefined( self._id_235D ) && self._id_235D == 1;
}
#using_animtree("vehicles");

_id_9CC3( var_0 )
{
    if ( isdefined( self._id_2D20 ) && self._id_2D20 )
        return;

    self notify( "death_finished" );

    if ( !isdefined( self ) )
        return;

    self _meth_8117( #animtree );

    if ( isdefined( level._id_9CB8[var_0] ) )
        self _meth_8144( level._id_9CB8[var_0], 0 );

    if ( isdefined( level._id_9CBB[var_0] ) )
        self _meth_8144( level._id_9CBB[var_0], 0 );
}

_id_9D3A( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_0B0C ) || self._id_0B0C == 0 )
    {
        if ( isdefined( self._id_3118 ) && self._id_3118 == 0 )
            return 0;

        if ( !isdefined( var_2 ) )
            return 0;

        if ( !( var_2 == "MOD_PROJECTILE" || var_2 == "MOD_PROJECTILE_SPLASH" ) )
            return 0;
    }

    if ( isdefined( self._id_5000 ) && self._id_5000 )
        return 1;

    return _id_9CDE( var_0 );
}

_id_9CDE( var_0 )
{
    return isdefined( level._id_9CA7["rocket_death" + self.classname] ) && isdefined( self._id_3118 ) && self._id_3118 == 1;
}

_id_9CB6( var_0, var_1, var_2, var_3 )
{
    var_4 = "tank";

    if ( isdefined( self._id_7980 ) )
        var_4 = self._id_7980;
    else if ( self _meth_822B() )
        var_4 = "physics";
    else if ( _id_05D8() )
        var_4 = "helicopter";
    else if ( isdefined( self._id_251D ) && _id_2325( self._id_251D ) )
        var_4 = "none";

    switch ( var_4 )
    {
        case "helicopter":
            vehicle_do_crash_helicopter( var_1, var_2, var_3 );
            break;
        case "tank":
            vehicle_do_crash_tank();
            break;
        case "diveboat":
            vehicle_do_crash_diveboat();
            break;
        case "physics":
            vehicle_do_crash_physics();
            break;
    }

    if ( isdefined( level._id_9CE0[var_0] ) && level._id_9CE0[var_0] )
        self _meth_825F();

    if ( _id_05D8() )
    {
        if ( isdefined( self._id_235D ) && self._id_235D == 1 )
            self waittill( "crash_done" );
    }
    else
    {
        while ( !_id_500E() && isdefined( self ) && self _meth_8282() > 0 )
            wait 0.1;
    }

    self notify( "stop_looping_death_fx" );
    _id_9CC3( var_0 );
}

vehicle_do_crash_hold_and_check_should_end()
{
    if ( _id_A5A4::_id_32DC( "kill_deathanim_active" ) )
        _id_A5A4::_id_32E4( "kill_deathanim_active" );

    if ( _id_A5A4::_id_32DC( "kill_deathanim_force_crash_end" ) )
        return _id_A5A4::_id_32D8( "kill_deathanim_force_crash_end" );

    return 0;
}

vehicle_do_crash_helicopter( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) && _func_1AD( var_0 ) )
    {
        self._id_06E0 = var_0;
        thread _id_A5A4::arcademode_kill( self._id_02E2, "explosive", 1000 );
    }

    self._id_235D = 1;

    if ( !isdefined( self ) )
        return;

    _id_2977();

    if ( isdefined( var_0 ) && var_0 == level._id_0318 && isdefined( self._id_756E ) && level._id_0318 _hasweapon( "rpg" ) )
        _id_A5A4::_id_41DD( "BIRD_ON_THE_GROUND" );

    if ( vehicle_do_crash_hold_and_check_should_end() )
    {
        self._id_235D = 0;
        self notify( "crash_done" );
        return;
    }

    if ( var_2 )
        return;

    thread _id_4807( var_0, var_1 );
}

vehicle_do_crash_tank()
{
    if ( vehicle_do_crash_hold_and_check_should_end() )
        return;

    if ( !isdefined( self._id_759E ) )
        self _meth_827F( 0, 25 );
    else
    {
        self _meth_827F( 8, 25 );
        self waittill( "deathrolloff" );
        self _meth_827F( 0, 25 );
    }

    self notify( "deadstop" );

    if ( !isdefined( self._id_2D30 ) )
        self _meth_8059();

    if ( isdefined( self._id_9190 ) && self._id_9190 > 0 )
        self waittill( "animsdone" );
}

vehicle_do_crash_diveboat()
{
    if ( vehicle_do_crash_hold_and_check_should_end() )
        return;

    if ( !isdefined( self._id_2D30 ) )
        self _meth_8059();
}

vehicle_do_crash_physics()
{
    if ( vehicle_do_crash_hold_and_check_should_end() )
        return;

    self _meth_822C();
    self notify( "deadstop" );

    if ( !isdefined( self._id_2D30 ) )
        self _meth_8059();

    if ( isdefined( self._id_9190 ) && self._id_9190 > 0 )
        self waittill( "animsdone" );
}

_id_500E()
{
    var_0 = 0;

    if ( isdefined( self ) && self.classname == "script_vehicle_corpse" )
        var_0 = 1;

    return var_0;
}

_id_7E05( var_0, var_1 )
{
    if ( isdefined( self._id_85BD ) && self._id_85BD )
        return;

    if ( isdefined( var_1 ) && var_1 > 0 )
        wait(var_1);

    if ( !isdefined( self ) )
        return;

    var_2 = _id_05B3();

    if ( isdefined( self._id_1E9A ) )
        var_2 _meth_8144( %root, 0 );

    if ( isdefined( self ) )
        var_2 _meth_80B3( var_0 );
}

_hasweapon( var_0 )
{
    var_1 = self _meth_8308();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _func_120( var_1[var_2], var_0 ) )
            return 1;
    }

    return 0;
}

_id_5336( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !_func_1A1( var_2 ) )
            continue;

        if ( !isdefined( var_2._id_750E ) && !isdefined( var_2._id_2E18 ) )
            continue;

        if ( isdefined( var_2._id_58D7 ) )
            var_2 _id_A5A4::_id_8EA4();

        var_2 _meth_8054();
    }
}

_id_9D23( var_0, var_1 )
{
    if ( isdefined( self._id_9D1B ) && self._id_9D1B != 0 )
        return;

    self._id_01E6 = 1;
    var_0 endon( "death" );
    self._id_1300 = 0.15;
    self waittill( "death" );
    var_0 notify( "driver_died" );
    _id_5336( var_1 );
}

_id_9C90()
{
    self endon( "death" );
    self endon( "enable_spline_path" );
    self endon( "enable_free_path" );
    waitframe;
    self._id_750A = _id_A5A4::_id_733F( self._id_750A );

    if ( self._id_46FB && self._id_750A.size )
    {
        common_scripts\utility::_id_0D13( self._id_750A, ::_id_9D23, self, self._id_750A );
        common_scripts\utility::_id_A087( "veh_collision", "driver_died" );
        _id_5336( self._id_750A );
        wait 0.25;
    }
    else
    {
        self waittill( "veh_collision" );
        wait 0.25;
    }

    self notify( "script_crash_vehicle" );
    self _meth_822C();
}

_id_0688( var_0, var_1 )
{
    self notify( "newpath" );

    if ( !isdefined( var_0 ) )
        var_0 = 2;

    self _meth_8256( var_0 );
    self _meth_824F( 0, 0, 0 );
    self _meth_8259();
    self _meth_825A( common_scripts\utility::_id_38C8( self.angles )[1] );
    _id_0646( _id_A5A4::_id_4417( self._id_02E2 ), 1 );
    self waittill( "goal" );
}

_id_5748( var_0, var_1 )
{
    var_2 = _func_124( var_0, " " );
    common_scripts\utility::_id_0CF0( var_2, ::_id_574B, var_1 );
}

_id_442A( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_9CFF ) )
        level._id_9CFF = [];

    if ( !isdefined( level._id_9CFF[var_0] ) )
        level._id_9CFF[var_0] = [];

    if ( !isdefined( level._id_9CFF[var_0][var_2] ) )
        level._id_9CFF[var_0][var_2] = [];

    foreach ( var_4 in level._id_9CFF[var_0][var_2] )
    {
        if ( var_1 == var_4 )
            return;
    }

    level._id_9CFF[var_0][var_2][level._id_9CFF[var_0][var_2].size] = var_1;
}

_id_5745()
{
    level notify( "new_lights_delayfxforframe" );
    level endon( "new_lights_delayfxforframe" );

    if ( !isdefined( level._id_3BA3 ) )
        level._id_3BA3 = 0;

    level._id_3BA3 += _func_0B5( 0.2, 0.4 );

    if ( level._id_3BA3 > 2 )
        level._id_3BA3 = 0;

    wait 0.05;
    level._id_3BA3 = undefined;
}

_id_531F( var_0 )
{
    _id_5747( "all", var_0 );
}

_id_9C84( var_0 )
{
    self endon( "death" );
    var_1 = anglestoforward( self.angles + ( 0, var_0, 0 ) );
    var_1 *= 10000;
    var_1 += ( 0, 0, 70 );
    self _meth_825D( var_1 );
}

_id_9CF7( var_0, var_1 )
{
    return _id_0688( var_0, var_1 );
}

_id_05FC( var_0, var_1 )
{
    self endon( "death" );
    self endon( "long_death" );

    if ( _id_A5A4::_id_2CE7() )
        return;

    var_2 = [];
    var_2[0] = "snowmobile_driver";
    var_2[1] = "snowmobile_passenger";
    var_3 = [];
    var_3["snowmobile_driver"] = "tag_driver";
    var_3["snowmobile_passenger"] = "tag_passenger";
    var_4 = var_2[var_1];
    var_5 = var_3[var_4];
    var_6 = var_0 _meth_8184( var_5 );
    var_7 = var_0 _meth_8185( var_5 );
    var_8 = undefined;
    var_9 = undefined;
    var_10 = 9999999;

    foreach ( var_16, var_12 in level._id_8846[var_4] )
    {
        var_13 = _id_A5A4::_id_3EF7( var_16 );
        var_14 = _func_06F( var_6, var_7, var_13 );
        var_15 = _func_0EE( self._id_02E2, var_14 );

        if ( var_15 < var_10 )
        {
            var_10 = var_15;
            var_9 = var_14;
            var_8 = var_16;
        }
    }

    var_9 = common_scripts\utility::_id_2F69( var_9 );
    self._id_01C4 = 8;
    self._id_2AF3 = 1;
    self _meth_81AA( var_9 );
    self waittill( "goal" );
    var_0 _id_A510::_id_0BC9( self, var_8, var_5 );
    var_0 thread _id_A5A9::_id_4492( self );
    self._id_2AF3 = 0;
}

_id_A0B8( var_0 )
{
    var_1 = 12;
    var_2 = 400;
    var_3 = gettime() + var_2;

    if ( isdefined( self._id_2F72 ) )
    {
        var_4 = _id_A5A4::_id_4417( var_0._id_02E2 ) + ( 0, 0, self._id_2F72 );
        self _meth_825A( var_0.angles[1] );
        self _meth_8257( var_4, 1 );
        self waittill( "goal" );
    }

    while ( isdefined( self ) )
    {
        if ( _func_0BE( self.angles[0] ) > var_1 || _func_0BE( self.angles[2] ) > var_1 )
            var_3 = gettime() + var_2;

        if ( gettime() > var_3 )
            break;

        wait 0.05;
    }
}

_id_0684()
{
    if ( !isdefined( self._id_7957 ) )
        return;

    self endon( "kill_badplace_forever" );

    if ( !self _meth_822B() )
        self endon( "death" );

    self endon( "delete" );

    if ( isdefined( level._id_2554 ) )
    {
        self thread [[ level._id_2554 ]]();
        return;
    }

    if ( isdefined( self._id_2554 ) )
    {
        self thread [[ self._id_2554 ]]();
        return;
    }

    var_0 = isdefined( level._id_9CE0[self._id_029C] ) && level._id_9CE0[self._id_029C];
    var_1 = 0.5;
    var_2 = 17;
    var_3 = 17;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        if ( !isdefined( self._id_7957 ) || !self._id_7957 )
        {
            while ( isdefined( self ) && ( !isdefined( self._id_7957 ) || !self._id_7957 ) )
                wait 0.5;

            if ( !isdefined( self ) )
                return;
        }

        var_4 = self _meth_8282();

        if ( var_4 <= 0 )
        {
            wait(var_1);
            continue;
        }

        if ( var_4 < 5 )
            var_5 = 200;
        else if ( var_4 > 5 && var_4 < 8 )
            var_5 = 350;
        else
            var_5 = 500;

        if ( isdefined( self._id_1268 ) )
            var_5 *= self._id_1268;

        if ( var_0 )
            var_6 = anglestoforward( self _meth_8185( "tag_turret" ) );
        else
            var_6 = anglestoforward( self.angles );

        badplace_arc( self._id_9A29 + "arc", var_1, self._id_02E2, var_5 * 1.9, 300, var_6, var_2, var_3, "axis", "team3", "allies" );
        badplace_cylinder( self._id_9A29 + "cyl", var_1, self._id_02E2, 200, 300, "axis", "team3", "allies" );
        wait(var_1 + 0.05);
    }
}

_id_068D( var_0 )
{
    self notify( "unloading" );
    var_1 = [];

    if ( _id_A5A4::_id_32DC( "no_riders_until_unload" ) )
    {
        _id_A5A4::_id_32DE( "no_riders_until_unload" );
        var_1 = _id_8973( var_0 );

        foreach ( var_3 in var_1 )
            _id_A5A4::_id_88F1( var_3 );
    }

    if ( isdefined( var_0 ) )
        self._id_9A3C = var_0;

    foreach ( var_6 in self._id_750A )
    {
        if ( _func_1A1( var_6 ) )
            var_6 notify( "unload" );
    }

    var_1 = _id_A5A9::_id_0C57( "unload" );
    var_8 = level._id_9D69[self.classname];

    if ( isdefined( var_8 ) )
    {
        var_1 = [];
        var_9 = _id_A5A9::_id_3EAE();

        foreach ( var_12, var_11 in self._id_750A )
        {
            if ( isdefined( var_11 ) && isdefined( var_11._id_9D1B ) && isdefined( var_9[var_11._id_9D1B] ) )
                var_1[var_1.size] = var_11;
        }
    }

    return var_1;
}

_id_5747( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_1 = var_2;
    else if ( !isdefined( var_1 ) )
        var_1 = self.classname;

    if ( !isdefined( var_0 ) )
        var_0 = "all";

    if ( !isdefined( self._id_5744 ) )
        return;

    if ( !isdefined( level._id_9CFF[var_1][var_0] ) )
        return;

    var_3 = level._id_9CFF[var_1][var_0];
    var_4 = 0;
    var_5 = 2;

    if ( isdefined( self._id_5A3F ) )
        var_5 = self._id_5A3F;

    foreach ( var_7 in var_3 )
    {
        var_8 = level._id_9CFE[var_1][var_7];

        if ( _id_A5A4::_id_4749( self._id_029C, var_8._id_0428 ) )
            stopfxontag( var_8._id_3018, self, var_8._id_0428 );

        var_4++;

        if ( var_4 >= var_5 )
        {
            var_4 = 0;
            wait 0.05;
        }

        if ( !isdefined( self ) )
            return;

        self._id_5744[var_7] = undefined;
    }
}

_id_574B( var_0, var_1 )
{
    level._id_55BB = gettime();

    if ( !isdefined( var_0 ) )
        var_0 = "all";

    if ( !isdefined( var_1 ) )
        var_1 = self.classname;

    if ( !isdefined( level._id_9CFF ) )
        return;

    if ( !isdefined( level._id_9CFF[var_1] ) || !isdefined( level._id_9CFF[var_1][var_0] ) )
        return;

    thread _id_5745();

    if ( !isdefined( self._id_5744 ) )
        self._id_5744 = [];

    var_2 = level._id_9CFF[var_1][var_0];
    var_3 = 0;
    var_4 = [];

    foreach ( var_6 in var_2 )
    {
        if ( isdefined( self._id_5744[var_6] ) )
            continue;

        var_7 = level._id_9CFE[var_1][var_6];

        if ( isdefined( var_7._id_27C0 ) )
            var_8 = var_7._id_27C0;
        else
            var_8 = 0;

        for ( var_8 += level._id_3BA3; isdefined( var_4["" + var_8] ); var_8 += 0.05 )
        {

        }

        var_4["" + var_8] = 1;
        self endon( "death" );
        childthread common_scripts\utility::_id_6168( ::playfxontag, var_8, var_7._id_3018, self, var_7._id_0428 );
        self._id_5744[var_6] = 1;

        if ( !isdefined( self ) )
            break;
    }

    level._id_3BA3 = 0;
}

_id_0646( var_0, var_1 )
{
    if ( self._id_01E6 <= 0 )
        return;

    if ( isdefined( self._id_65A7 ) )
        var_0 += ( 0, 0, self._id_65A7 );

    self _meth_8257( var_0, var_1 );
}

_id_4807( var_0, var_1 )
{
    self endon( "in_air_explosion" );

    if ( isdefined( self._id_67CA ) )
        var_2 = self._id_67CA;
    else
    {
        var_3 = _id_3EAF();
        var_2 = common_scripts\utility::_id_3F33( self._id_02E2, var_3 );
    }

    var_2._id_1E1D = 1;
    self notify( "newpath" );
    self notify( "deathspin" );
    var_4 = 0;
    var_5 = 0;

    if ( isdefined( var_2._id_7A99 ) && var_2._id_7A99 == "direct" )
        var_5 = 1;

    if ( isdefined( self._id_47AC ) )
    {
        var_5 = 0;
        var_4 = self._id_47AC;
    }

    if ( var_5 )
    {
        var_6 = 60;
        self _meth_827F( var_6, 15, 10 );
        self _meth_8256( var_2._id_0351 );
        self _meth_8257( var_2._id_02E2, 0 );
        thread _id_4805( var_2._id_02E2, var_6 );
        common_scripts\utility::_id_A069( "goal", "near_goal" );
        _id_4808( var_2 );
    }
    else
    {
        var_7 = ( var_2._id_02E2[0], var_2._id_02E2[1], self._id_02E2[2] + var_4 );

        if ( isdefined( self._id_47AD ) )
        {
            var_7 = self._id_02E2 + self._id_47AD * self _meth_8283();
            var_7 = ( var_7[0], var_7[1], var_7[2] + var_4 );
        }

        self _meth_827F( 40, 10, 10 );
        self _meth_8256( 300 );
        self _meth_8257( var_7, 1 );
        thread _id_4805( var_7, 40 );
        var_8 = "blank";

        while ( var_8 != "death" )
        {
            var_8 = common_scripts\utility::_id_A069( "goal", "near_goal", "death" );

            if ( !isdefined( var_8 ) && !isdefined( self ) )
            {
                var_2._id_1E1D = undefined;
                self notify( "crash_done" );
                return;
                continue;
            }

            var_8 = "death";
        }

        self _meth_8257( var_2._id_02E2, 0 );
        self waittill( "goal" );
        _id_4808( var_2 );
    }

    var_2._id_1E1D = undefined;
    self notify( "stop_crash_loop_sound" );
    self notify( "crash_done" );
}

_id_4808( var_0 )
{
    self endon( "death" );

    while ( isdefined( var_0._id_04A4 ) )
    {
        var_0 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );
        var_1 = 56;

        if ( isdefined( var_0._id_0351 ) )
            var_1 = var_0._id_0351;

        self _meth_8256( var_1 );
        self _meth_8257( var_0._id_02E2, 0 );
        common_scripts\utility::_id_A069( "goal", "near_goal" );
    }
}

_id_4805( var_0, var_1 )
{
    self endon( "crash_done" );
    self _meth_8262();
    var_2 = 0;

    if ( isdefined( self._id_6EF2 ) )
    {
        var_2 = self._id_6EF2;

        if ( self._id_6EF2 < 0 )
        {
            var_3 = [ 1, 2, 2 ];
            var_4 = 5;
            var_5 = _func_0B2( var_4 );
            var_6 = 0;

            foreach ( var_9, var_8 in var_3 )
            {
                var_6 += var_8;

                if ( var_5 < var_6 )
                {
                    var_2 = var_9;
                    break;
                }
            }
        }
    }

    switch ( var_2 )
    {
        case 1:
            thread _id_480A();
            break;
        case 2:
            thread _id_4804( var_0, var_1 );
            break;
        case 3:
            thread _id_480E();
            break;
        case 0:
        default:
            thread _id_4809();
            break;
    }
}

_id_480E()
{
    self notify( "in_air_explosion" );
    wait 0.05;
    self notify( "crash_done" );
}

_id_4804( var_0, var_1 )
{
    self endon( "crash_done" );
    self _meth_8262();
    self _meth_8290( _func_0B4( 20, 90 ), _func_0B4( 5, 90 ) );
    self _meth_828E( 400, 100, 100 );
    var_2 = 90 * _func_0B4( -2, 3 );

    for (;;)
    {
        var_3 = var_0 - self._id_02E2;
        var_4 = _func_116( var_3 );
        var_4 += var_2;
        self _meth_825A( var_4 );
        wait 0.1;
    }
}

_id_480A()
{
    self endon( "crash_done" );
    self _meth_8262();
    self _meth_828E( 400, 100, 100 );
    var_0 = _func_0B2( 2 );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_1 = _func_0B4( 20, 120 );

        if ( var_0 )
            self _meth_825A( self.angles[1] + var_1 );
        else
            self _meth_825A( self.angles[1] - var_1 );

        var_0 = 1 - var_0;
        var_2 = _func_0B5( 0.5, 1.0 );
        wait(var_2);
    }
}

_id_4809()
{
    self endon( "crash_done" );
    self _meth_8262();
    self _meth_828E( 400, 100, 100 );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_0 = _func_0B4( 90, 120 );
        self _meth_825A( self.angles[1] + var_0 );
        wait 0.5;
    }
}

_id_3EAF()
{
    var_0 = [];
    level._id_4806 = common_scripts\utility::_id_0D01( level._id_4806 );

    foreach ( var_2 in level._id_4806 )
    {
        if ( isdefined( var_2._id_1E1D ) )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_2977()
{
    if ( !isdefined( self._id_3680 ) )
        return;

    if ( !self._id_3680.size )
        return;

    var_0 = _func_1D3( self._id_3680 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        self._id_3680[var_0[var_1]] _meth_8051();
}

_id_05B3()
{
    if ( isdefined( self._id_5D41 ) && self._id_5D41 )
        var_0 = self._id_5D40;
    else
        var_0 = self;

    return var_0;
}

_id_2325( var_0 )
{
    var_1 = var_0;
    var_2 = [];

    while ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1._id_29B6 ) && var_1._id_29B6 == 0 )
        {
            var_3 = _id_66C2( _func_1EC( var_1._id_04A4, "targetname" ) );

            if ( isdefined( var_3 ) && isdefined( var_3._id_797F ) )
                return 1;
        }

        var_2[var_2.size] = var_1;

        if ( isdefined( var_1._id_04A4 ) )
            var_1 = _func_1EC( var_1._id_04A4, "targetname" );
        else
            var_1 = undefined;

        if ( isdefined( var_1 ) && common_scripts\utility::_id_0CE4( var_2, var_1 ) )
            break;
    }

    return 0;
}

_id_9CEF()
{
    self notify( "kill_badplace_forever" );
}

_id_531B( var_0 )
{
    if ( isdefined( level._id_9CA9[var_0] ) )
    {
        self._id_2D35 = 1;
        wait(level._id_9CA9[var_0]._id_27C0);
    }

    if ( !isdefined( self ) )
        return;

    self _meth_8250( self._id_02E2 + ( 23, 33, 64 ), 3 );
    wait 2;

    if ( !isdefined( self ) )
        return;

    self._id_2D35 = undefined;
}

_id_05DA( var_0, var_1 )
{
    if ( common_scripts\utility::_id_50F2() || isdefined( self._id_5000 ) && self._id_5000 )
        return;

    level notify( "vehicle_explosion", self._id_02E2 );
    self notify( "explode", self._id_02E2 );

    if ( isdefined( self._id_4BA1 ) && self._id_4BA1 )
        return;

    var_2 = self._id_04FF;
    var_3 = self.classname;

    if ( var_1 )
        var_3 = "rocket_death" + var_3;

    var_4 = 0;

    foreach ( var_6 in level._id_9CA7[var_3] )
    {
        if ( ( !isdefined( var_6._id_A00D ) || var_6._id_A00D == 0 ) && var_0 == "vehicle_bm21_mobile_cover" && level._id_038E == "hunted" )
            var_6._id_A00D = _func_0BC( var_4 / 2 ) * 0.05 + 0.05;

        thread _id_5312( var_0, var_6, var_2 );
        var_4++;
    }
}

_id_5312( var_0, var_1, var_2 )
{
    if ( isdefined( var_1._id_A00D ) )
    {
        if ( var_1._id_A00D >= 0 )
            wait(var_1._id_A00D);
        else
            self waittill( "death_finished" );
    }

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_1._id_6237 ) )
        self notify( var_1._id_6237 );

    var_3 = _id_05B3();

    if ( isdefined( var_1._id_7C77 ) )
        common_scripts\utility::_id_27CD( var_1._id_7C77, ::delete );

    if ( isdefined( var_1._id_3018 ) )
    {
        if ( var_1._id_136B && !isdefined( self._id_2825 ) )
        {
            if ( isdefined( var_1._id_0428 ) )
            {
                if ( isdefined( var_1._id_8D81 ) && var_1._id_8D81 == 1 )
                    thread _id_5870( var_1._id_3018, var_1._id_27C0, var_1._id_0428 );
                else
                    thread _id_6DC2( var_1._id_3018, var_1._id_27C0, var_1._id_0428 );
            }
            else
            {
                var_4 = var_3._id_02E2 + ( 0, 0, 100 ) - var_3._id_02E2;
                playfx( var_1._id_3018, var_3._id_02E2, var_4 );
            }
        }
        else if ( isdefined( var_1._id_0428 ) )
        {
            playfxontag( var_1._id_3018, _id_2662(), var_1._id_0428 );

            if ( isdefined( var_1._id_7340 ) )
                _id_2662() common_scripts\utility::_id_27CD( var_1._id_7340, ::delete );
        }
        else
        {
            var_4 = var_3._id_02E2 + ( 0, 0, 100 ) - var_3._id_02E2;
            playfx( var_1._id_3018, var_3._id_02E2, var_4 );
        }
    }

    if ( isdefined( var_1._id_8899 ) && !isdefined( self._id_2825 ) )
    {
        if ( var_1._id_182E )
            thread _id_2641( var_1._id_8899 );
        else
            common_scripts\utility::_id_69C2( var_1._id_8899 );
    }
}

_id_5870( var_0, var_1, var_2 )
{
    self endon( "stop_looping_death_fx" );

    while ( isdefined( self ) )
    {
        playfxontag( var_0, _id_2662(), var_2 );
        wait(var_1);
    }
}

_id_2641( var_0 )
{
    thread _id_A5A4::_id_6976( var_0, undefined, 0, 1 );
    common_scripts\utility::_id_A069( "fire_extinguish", "stop_crash_loop_sound" );

    if ( !isdefined( self ) )
    {
        iprintln( "^1DEBUG: Infinite looping sound for a vehicle could be happening right now..." );
        return;
    }

    self notify( "stop sound" + var_0 );
}

_id_2662()
{
    if ( isdefined( self._id_2643 ) && self._id_2643 )
        return self;

    if ( !isdefined( self._id_2662 ) )
    {
        var_0 = spawn( "script_model", ( 0, 0, 0 ) );
        var_1 = _id_05B3();
        var_0 _meth_80B3( self._id_029C );
        var_0._id_02E2 = var_1._id_02E2;
        var_0.angles = var_1.angles;
        var_0 _meth_82BB();
        var_0 _meth_8056();
        var_0 _meth_804F( var_1 );
        self._id_2662 = var_0;
    }
    else
        self._id_2662 _meth_80B3( self._id_029C );

    return self._id_2662;
}

_id_6DC2( var_0, var_1, var_2 )
{
    var_3 = _id_05B3();
    var_4 = spawn( "script_origin", var_3._id_02E2 );
    self endon( "fire_extinguish" );
    thread _id_6DC3( var_2, var_4 );

    for (;;)
    {
        playfx( var_0, var_4._id_02E2, var_4._id_9BCD );
        wait(var_1);
    }
}

_id_6DC3( var_0, var_1 )
{
    var_1.angles = self _meth_8185( var_0 );
    var_1._id_02E2 = self _meth_8184( var_0 );
    var_1._id_39F0 = anglestoforward( var_1.angles );
    var_1._id_9BCD = anglestoup( var_1.angles );

    while ( isdefined( self ) && self.code_classname == "script_vehicle" && self _meth_8282() > 0 )
    {
        var_2 = _id_05B3();
        var_1.angles = var_2 _meth_8185( var_0 );
        var_1._id_02E2 = var_2 _meth_8184( var_0 );
        var_1._id_39F0 = anglestoforward( var_1.angles );
        var_1._id_9BCD = anglestoup( var_1.angles );
        wait 0.05;
    }
}

_id_52FB( var_0 )
{
    if ( !isdefined( level._id_9CA5[var_0] ) )
        return;

    var_1 = level._id_9CA5[var_0];

    if ( isdefined( var_1._id_27C0 ) )
        wait(var_1._id_27C0);

    if ( !isdefined( self ) )
        return;

    badplace_cylinder( "vehicle_kill_badplace", var_1._id_0136, self._id_02E2, var_1._id_0351, var_1._id_01E8, var_1._id_91E7, var_1._id_91E8 );
}

_id_9955( var_0 )
{
    if ( isdefined( self ) )
    {
        if ( isdefined( var_0._id_284B ) )
            wait(var_0._id_284B);
    }

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_0CA8()
{
    if ( !isdefined( self._id_9882 ) )
        return;

    var_0 = self._id_9882;
    self._id_9882 = [];

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_03D9 ) )
        {
            var_3 = common_scripts\utility::_id_8959();
            var_3._id_03D9 = var_2._id_03D9;
        }
        else
        {
            var_3 = spawn( "script_model", self._id_02E2 );
            var_3 _meth_80B3( var_2._id_029C );
        }

        var_4 = "tag_body";

        if ( isdefined( var_2._id_79FD ) )
        {
            var_3._id_79FD = var_2._id_79FD;
            var_3._id_12FD = var_2._id_02E2;
            var_3._id_12F2 = var_2.angles;
            var_4 = var_2._id_79FD;
        }

        if ( isdefined( var_2._id_28E8 ) )
            var_2 thread _id_9883( var_3 );

        if ( isdefined( var_2._id_0398 ) )
            var_3._id_0398 = var_2._id_0398;

        if ( isdefined( var_2._id_7A99 ) )
            var_3._id_7A99 = var_2._id_7A99;

        var_3 _meth_804F( self, var_4, var_2._id_02E2, var_2.angles );

        if ( isdefined( var_2._id_0117 ) )
        {
            var_3._id_0117 = var_2._id_0117;
            var_3 common_scripts\_destructible::_id_80B1( 1 );
        }

        self._id_9882[self._id_9882.size] = var_3;
    }
}

_id_9883( var_0 )
{
    var_0 endon( "death" );
    var_0 _meth_82BC( 1 );
    var_0._id_01E6 = 8000;
    var_0 waittill( "damage" );
    var_0 _meth_8056();
    var_1 = common_scripts\utility::_id_8959();
    var_1._id_02E2 = var_0._id_02E2;
    var_1.angles = var_0.angles;
    var_1 _meth_804F( var_0 );
    playfxontag( self._id_28E8, var_1, "tag_origin" );
}

_id_9882()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = _id_418A( var_0 );

    if ( _func_1A2( self ) )
        var_1._id_03D9 = self;

    if ( isdefined( self._id_04A6 ) )
    {
        var_2 = getent( self._id_04A6, "target" );

        if ( _func_1A2( var_2 ) )
            var_1._id_03D9 = var_2;
    }

    if ( isdefined( self._id_0398 ) )
        var_1._id_0398 = self._id_0398;

    if ( isdefined( self._id_7A99 ) )
        var_1._id_7A99 = self._id_7A99;

    if ( isdefined( self._id_79F1 ) )
        var_1._id_28E8 = common_scripts\utility::_id_3FA8( self._id_79F1 );

    if ( !isdefined( var_0._id_9882 ) )
        var_0._id_9882 = [];

    if ( isdefined( self._id_7ADC ) )
        var_1._id_7ADC = self._id_7ADC;

    if ( isdefined( self._id_0117 ) )
    {
        _id_A5A4::_id_6EBA( self._id_0117 );
        var_1._id_0117 = self._id_0117;
    }

    var_0._id_9882[var_0._id_9882.size] = var_1;

    if ( !isdefined( self.classname ) )
        return;

    if ( _func_1A2( self ) )
        return;

    self delete();
}

_id_418A( var_0 )
{
    var_1 = spawnstruct();
    var_2 = "tag_body";

    if ( isdefined( self._id_79FD ) )
    {
        var_2 = self._id_79FD;
        var_1._id_79FD = self._id_79FD;
    }

    var_1._id_02E2 = self._id_02E2 - var_0 _meth_8184( var_2 );

    if ( !isdefined( self.angles ) )
        var_3 = ( 0, 0, 0 );
    else
        var_3 = self.angles;

    var_1.angles = var_3 - var_0 _meth_8185( var_2 );
    var_1._id_029C = self._id_029C;

    if ( isdefined( self._id_7A3C ) )
    {
        precachemodel( self._id_7A3C );
        var_1._id_029C = self._id_7A3C;
    }

    if ( isdefined( var_1._id_04A6 ) )
        level._id_8F64["targetname"][var_1._id_04A6] = undefined;

    if ( isdefined( var_1._id_04A4 ) )
        level._id_8F64["target"][var_1._id_04A4] = undefined;

    return var_1;
}

_id_05BE( var_0 )
{
    var_1 = getentarray( "script_vehicle", "code_classname" );

    if ( isdefined( var_0 ) )
    {
        var_2 = [];

        foreach ( var_4 in var_1 )
        {
            if ( !isdefined( var_4._id_04A6 ) )
                continue;

            if ( var_4._id_04A6 == var_0 )
                var_2 = common_scripts\utility::_id_0CDA( var_2, var_4 );
        }

        var_1 = var_2;
    }

    var_6 = [];

    foreach ( var_4 in var_1 )
    {
        if ( _func_1A2( var_4 ) )
            var_6[var_6.size] = var_4;
    }

    return var_6;
}

_id_05BF( var_0 )
{
    var_1 = _id_05BE();
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4._id_7B1A ) && var_4._id_7B1A == var_0 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_5973( var_0, var_1 )
{
    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        if ( !isdefined( var_0 ) )
            break;

        var_2 = var_0 _meth_8184( var_1 );
        var_3 = var_0 _meth_8185( var_1 );
        self._id_02E2 = var_2;
        self.angles = var_3;
        wait 0.05;
    }
}

_id_4B04( var_0 )
{
    self _meth_8117( #animtree );
    _id_4B05( var_0 );

    if ( !isdefined( self ) )
        return;

    self _meth_8144( var_0["idle"], 0 );
    self _meth_8144( var_0["rot_l"], 0 );
    self _meth_8144( var_0["rot_r"], 0 );
}

_id_4B05( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_1 = self._id_04F9 / 18;

        if ( var_1 <= 0.0001 )
            var_1 = 0.0001;

        var_2 = _func_0B5( 0.3, 0.7 );
        self _meth_814D( var_0["idle"], var_1, 0, var_2 );
        var_2 = _func_0B5( 0.1, 0.8 );
        self _meth_814D( var_0["rot_l"], 1, 0, var_2 );
        var_2 = _func_0B5( 0.1, 0.8 );
        self _meth_814D( var_0["rot_r"], 1, 0, var_2 );
        wait 0.5;
    }
}

_id_9D2F( var_0 )
{
    foreach ( var_2 in self._id_750A )
    {
        if ( _func_0CF( var_2 ) )
        {
            var_2 _id_A5A4::_id_7E38( var_0 );
            continue;
        }

        if ( isdefined( var_2._id_03D9 ) )
        {
            var_2._id_03D9._id_79E6 = var_0;
            continue;
        }
    }
}

_id_9ADF( var_0 )
{
    if ( var_0._id_9AE7 == gettime() )
        return var_0._id_8E21;

    var_0._id_9AE7 = gettime();

    if ( var_0._id_8E22 )
    {
        var_1 = _func_0E9( 0 - var_0.angles[2], 0 - var_0._id_8E25, var_0._id_8E25 ) / var_0._id_8E25;

        if ( isdefined( var_0._id_565F ) && var_0._id_565F )
        {
            var_2 = var_0 _meth_8285();
            var_2 *= -1.0;
            var_1 += var_2;

            if ( var_1 != 0 )
            {
                var_3 = 1.0 / _func_0BE( var_1 );

                if ( var_3 < 1 )
                    var_1 *= var_3;
            }
        }

        var_4 = var_1 - var_0._id_8E21;

        if ( var_4 != 0 )
        {
            var_5 = var_0._id_8E24 / _func_0BE( var_4 );

            if ( var_5 < 1 )
                var_4 *= var_5;

            var_0._id_8E21 += var_4;
        }
    }
    else
        var_0._id_8E21 = 0;

    return var_0._id_8E21;
}

_id_3D80( var_0 )
{
    return common_scripts\utility::_id_40FB( var_0, "targetname" );
}

_id_3D7E( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        return var_1[_func_0B2( var_1.size )];

    return undefined;
}

_id_3D81( var_0 )
{
    return common_scripts\utility::_id_40FB( var_0, "target" );
}

_id_3D7F( var_0 )
{
    return getent( var_0, "target" );
}

_id_3D82( var_0 )
{
    return _func_1EC( var_0, "targetname" );
}

_id_7E6D( var_0 )
{
    var_1 = getent( var_0._id_7A26, "script_linkname" );

    if ( !isdefined( var_1 ) )
        return;

    self _meth_8261( var_1 );
    self._id_7E6E = 1;
}

_id_2580()
{
    level._id_0CD1 = 0;
    self._id_2B63 = 0;
    thread _id_2582();

    while ( isdefined( self ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !_func_1AD( var_1 ) )
            continue;

        if ( isdefined( self._id_46FD ) )
            continue;

        var_4 = _func_123( var_4 );

        switch ( var_4 )
        {
            case "mod_pistol_bullet":
            case "mod_rifle_bullet":
            case "bullet":
                if ( !level._id_0CD1 )
                {
                    if ( isdefined( level._id_933F ) && level._id_933F > 0 )
                        continue;

                    level._id_0CD1 = 1;
                    self._id_2B63 = 1;
                    var_1 _id_A5A4::_id_2B4A( "invulerable_bullets" );
                    wait 4;
                    level._id_0CD1 = 0;

                    if ( isdefined( self ) )
                        self._id_2B63 = 0;

                    continue;
                }
        }
    }
}

_id_2581()
{
    level._id_0CD1 = 0;
    self._id_2B63 = 0;
    thread _id_2582();

    while ( isdefined( self ) )
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !_func_1AD( var_1 ) )
            continue;

        if ( isdefined( self._id_46FD ) )
            continue;

        var_4 = _func_123( var_4 );

        switch ( var_4 )
        {
            case "mod_grenade":
            case "mod_grenade_splash":
            case "mod_pistol_bullet":
            case "mod_rifle_bullet":
            case "bullet":
                if ( !level._id_0CD1 )
                {
                    if ( isdefined( level._id_4903 ) )
                        continue;

                    if ( isdefined( level._id_933F ) && level._id_933F > 0 )
                        continue;

                    level._id_0CD1 = 1;
                    self._id_2B63 = 1;
                    _id_A5A4::_id_2B4A( "armor_damage" );
                    wait 8;
                    level._id_0CD1 = 0;

                    if ( isdefined( self ) )
                        self._id_2B63 = 0;

                    continue;
                }
        }
    }
}

_id_2582()
{
    self waittill( "death" );

    if ( self._id_2B63 )
        level._id_0CD1 = 0;
}

_id_21D3( var_0 )
{
    var_1 = self _meth_802C();
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        var_2[var_3] = _func_123( self _meth_802D( var_3 ) );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_0 _meth_801D( var_2[var_3], _func_123( self _meth_802E( var_3 ) ) );
}

_id_5746( var_0, var_1, var_2 )
{
    var_3 = _func_124( var_0, " ", var_1 );
    common_scripts\utility::_id_0CF0( var_3, ::_id_5747, var_1, var_2 );
}

_id_0995( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
    {
        self notify( "stop_kicking_up_dust" );

        if ( isdefined( level._id_0686 ) && isdefined( level._id_0686[self.classname] ) && isdefined( level._id_0686[self.classname]._id_9106 ) )
        {
            foreach ( var_3 in level._id_0686[self.classname]._id_9106 )
                thread _id_0995( var_0, var_3 );

            return;
        }
    }
    else
    {
        self notify( "stop_kicking_up_dust" + var_1 );
        self endon( "stop_kicking_up_dust" + var_1 );
    }

    self endon( "death" );
    self endon( "death_finished" );
    self endon( "stop_kicking_up_dust" );
    var_5 = 350;
    var_6 = 1200;

    if ( isdefined( level._id_974A ) )
        var_6 = level._id_974A;

    var_7 = 100 / var_6;
    var_8 = 0.15;
    var_9 = 0.05;
    var_10 = 4500;

    if ( isdefined( level.treadsfx_max_distance ) )
        var_10 = level.treadsfx_max_distance;

    var_11 = 1.0;
    var_12 = var_11;
    var_13 = 3;
    var_14 = var_13;
    var_15 = _id_05D7();

    if ( var_15 )
        var_12 = 0.15;

    var_16 = undefined;
    var_17 = undefined;
    var_18 = self;

    if ( isdefined( var_0 ) )
        var_18 = var_0;

    var_19 = 30;
    self.soundisalreadyplaying = 0;
    self.oldtreadsoundfx = undefined;

    for (;;)
    {
        wait(var_12);

        if ( isdefined( var_1 ) )
        {
            var_20 = var_18 _meth_8184( var_1 );
            var_21 = var_18 _meth_8185( var_1 );
            var_21 = _func_11C( var_21, ( -90, 0, 0 ) );
        }
        else
        {
            var_20 = var_18._id_02E2;
            var_21 = var_18.angles;
        }

        var_22 = anglestoup( var_21 ) * -1;
        var_14++;

        if ( var_14 > var_13 )
        {
            var_14 = var_13;
            var_16 = _func_06B( var_20, var_20 + var_22 * var_6, 0, var_18, 0, 0, 0, 0, 0, 1, 0, 1 );
        }

        var_23 = _func_0EE( var_20, level._id_0318._id_02E2 );

        if ( var_23 > var_10 )
            stop_tread_audio_loop();

        if ( !isdefined( var_16 ) )
        {
            stop_tread_audio_loop();
            continue;
        }

        if ( var_16["fraction"] == 1 )
            continue;

        var_24 = _func_0EE( var_20, var_16["position"] );
        var_25 = get_wash_info( self, var_16, var_22, var_1 );
        var_26 = _id_3EC3( var_25, var_1 );

        if ( !isdefined( var_26 ) )
        {
            stop_tread_audio_loop();
            continue;
        }

        var_27 = get_wash_soundfx( var_25, var_1 );

        if ( tread_audio_should_stop_loop( var_27, self.oldtreadsoundfx ) )
            stop_tread_audio_loop();

        if ( var_16["fraction"] < var_7 )
        {
            if ( isdefined( level._heli_landed_fx ) && isdefined( level._heli_landed_fx[var_26] ) )
                var_26 = level._heli_landed_fx[var_26];
        }

        if ( var_24 > var_6 )
        {
            var_12 = var_11;
            continue;
        }

        if ( isdefined( var_16["entity"] ) )
        {
            var_12 = var_11;
            continue;
        }

        if ( !isdefined( var_16["position"] ) )
        {
            var_12 = var_11;
            continue;
        }

        var_12 = ( var_24 - var_5 ) / ( var_6 - var_5 ) * ( var_8 - var_9 ) + var_9;
        var_12 = _func_0E1( var_12, var_9 );
        var_28 = var_16["position"];
        var_29 = var_16["normal"];
        var_24 = _func_0F6( var_28 - var_20, var_29 );
        var_30 = var_20 + ( 0, 0, var_24 );
        var_31 = var_28 - var_30;

        if ( var_29[2] < -0.99 )
            continue;

        var_32 = _func_115( var_29 );

        if ( _func_0EB( var_32[0] ) > -90 + var_19 )
            var_29 = anglestoforward( ( -90 + var_19, var_32[1], 0 ) );

        if ( _func_0F1( var_31 ) < 1 )
            var_31 = anglestoforward( var_21 + ( 0, 180, 0 ) );

        if ( _func_0BE( _func_0F6( _func_114( var_31 ), var_29 ) ) > 0.999 )
            continue;

        playfx( var_26, var_28, var_29, var_31 );

        if ( isdefined( var_27 ) && !self.soundisalreadyplaying && var_23 < var_10 )
        {
            thread _id_A5A4::_id_6976( var_27, var_1, 1, 1 );
            self.soundisalreadyplaying = 1;
            self.oldtreadsoundfx = var_27;
        }
    }
}

_id_268E( var_0, var_1, var_2 )
{

}

get_wash_info( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_8FF0 = var_1["surfacetype"];
    var_4.bank = undefined;
    var_5 = _func_0F6( ( 0, 0, -1 ), var_2 );

    if ( var_5 >= 0.97 )
        var_4.bank = undefined;
    else if ( var_5 >= 0.92 )
        var_4.bank = "_bank";
    else
        var_4.bank = "_bank_lg";

    var_4.vehicleclass = var_0.classname;

    if ( !_func_120( var_0.classname, "vehicle" ) && isdefined( var_0._id_04FF ) )
        var_4.vehicleclass = "script_vehicle_" + var_0._id_04FF;

    if ( isdefined( level._id_0686 ) && isdefined( level._id_0686[var_4.vehicleclass] ) && isdefined( level._id_0686[var_4.vehicleclass]._id_3E81 ) )
        var_4._id_8FF0 = var_0 [[ level._id_0686[var_4.vehicleclass]._id_3E81 ]]( var_4._id_8FF0, var_3 );

    return var_4;
}

_id_3EC3( var_0, var_1 )
{
    return _id_3EC2( var_0.vehicleclass, var_0._id_8FF0, var_0.bank );
}

get_wash_soundfx( var_0, var_1 )
{
    return get_wash_sound_effect( var_0.vehicleclass, var_0._id_8FF0, var_0.bank );
}

_id_3EC2( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
    {
        var_3 = var_1 + var_2;

        if ( isdefined( level._id_0685[var_0][var_3] ) )
            return level._id_0685[var_0][var_3];
    }

    return _id_3EB7( var_0, var_1 );
}

get_wash_sound_effect( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
    {
        var_3 = var_1 + var_2;

        if ( isdefined( level._vehicle_sound_effect[var_0][var_3] ) )
            return level._vehicle_sound_effect[var_0][var_3];
    }

    return get_vehicle_sound_effect( var_0, var_1 );
}

_id_3EB7( var_0, var_1 )
{
    if ( !isdefined( level._id_0685[var_0] ) )
        return undefined;

    if ( !isdefined( level._id_0685[var_0][var_1] ) && var_1 != "default" && var_1 != "default_script_model" )
        return _id_3EB7( var_0, "default" );

    return level._id_0685[var_0][var_1];
}

get_vehicle_sound_effect( var_0, var_1 )
{
    if ( !isdefined( level._vehicle_sound_effect[var_0] ) )
        return undefined;

    if ( !isdefined( level._vehicle_sound_effect[var_0][var_1] ) && var_1 != "default" && var_1 != "default_script_model" )
        return get_vehicle_sound_effect( var_0, "default" );

    return level._vehicle_sound_effect[var_0][var_1];
}

_id_6113()
{
    return _id_05D8() || _id_05D7();
}

_id_9D5A()
{
    var_0 = self.classname;

    if ( !isdefined( level._id_0685[var_0] ) )
        return;

    if ( _id_6113() )
        return;

    if ( isdefined( level._id_9743 ) )
        self thread [[ level._id_9743 ]]( "tag_origin", "back_left", ( 160, 0, 0 ) );
    else
    {
        if ( isdefined( level._id_9D40 ) && isdefined( level._id_9D40[self._id_04FF] ) )
        {
            thread _id_2BD9();
            return;
        }

        thread _id_2BC6();
    }
}

_id_2BC6()
{
    self endon( "death" );
    self endon( "kill_treads_forever" );

    for (;;)
    {
        var_0 = _id_9744();

        if ( var_0 == -1 )
        {
            wait 0.1;
            continue;
        }

        _id_9742( _id_05B3(), var_0, "tag_wheel_back_left", "back_left", 0 );
        wait 0.05;
        _id_9742( _id_05B3(), var_0, "tag_wheel_back_right", "back_right", 0 );
        wait 0.05;
    }
}

_id_9744()
{
    var_0 = self _meth_8282();

    if ( !var_0 )
        return -1;

    if ( isdefined( self.vehicle_treadfx_min_speed ) && var_0 < self.vehicle_treadfx_min_speed )
        return -1;

    var_0 *= 17.6;
    var_1 = 1 / var_0;
    var_1 = _func_0E9( var_1 * 35, 0.1, 0.3 );

    if ( isdefined( self._id_9749 ) )
        var_1 *= self._id_9749;

    wait(var_1);
    return var_1;
}

_id_9742( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3EA2( self, var_3 );

    if ( !isdefined( var_6 ) )
        return;

    var_7 = var_0 _meth_8185( var_2 );
    var_8 = anglestoforward( var_7 );
    var_9 = self _meth_8184( var_2 );

    if ( var_4 )
    {
        var_10 = self _meth_8184( var_5 );
        var_9 = ( var_9 + var_10 ) / 2;
    }

    playfx( var_6, var_9, anglestoup( var_7 ), var_8 * var_1 );
}

_id_3EA2( var_0, var_1 )
{
    var_2 = self _meth_8252( var_1 );

    if ( !isdefined( var_0._id_04FF ) )
    {
        var_3 = -1;
        return var_3;
    }

    var_4 = var_0.classname;
    return _id_3EB7( var_4, var_2 );
}

get_treadsfx( var_0, var_1 )
{
    var_2 = self _meth_8252( var_1 );

    if ( !isdefined( var_0._id_04FF ) )
    {
        var_3 = -1;
        return var_3;
    }

    var_4 = var_0.classname;
    return get_vehicle_sound_effect( var_4, var_2 );
}

_id_2BD9()
{
    self endon( "death" );
    self endon( "kill_treads_forever" );

    for (;;)
    {
        var_0 = _id_9744();

        if ( var_0 == -1 )
        {
            wait 0.1;
            continue;
        }

        var_1 = _id_05B3();
        var_1 _id_9742( var_1, var_0, "tag_wheel_back_left", "back_left", 1, "tag_wheel_back_right" );
    }
}

_id_05D8()
{
    return isdefined( level._id_4810[self._id_04FF] );
}

_id_05D7()
{
    return isdefined( level._id_0997[self._id_04FF] );
}

_id_50DF()
{
    if ( !isdefined( self._id_7972 ) )
        return 0;

    if ( !self._id_7972 )
        return 0;

    return 1;
}

_id_472F()
{
    if ( !_id_05D8() && !_id_05D7() )
        return 0;

    if ( _id_50DF() )
        return 0;

    return 1;
}

_id_4730()
{
    if ( !isdefined( self._id_04FF ) )
        return 0;

    if ( _id_50DF() )
        return 0;

    if ( self._id_04FF == "cobra" )
        return 1;

    if ( self._id_04FF == "cobra_player" )
        return 1;

    if ( self._id_04FF == "viper" )
        return 1;

    return 0;
}

vehicle_kill_disconnect_paths_forever()
{
    self notify( "kill_disconnect_paths_forever" );
}

_id_2B35()
{
    self endon( "death" );
    self endon( "kill_disconnect_paths_forever" );
    var_0 = 0;

    if ( isdefined( self._id_79A0 ) && !self._id_79A0 )
        var_0 = 1;

    if ( var_0 )
    {
        self._id_2D30 = 1;
        return;
    }

    wait(_func_0B3( 1 ));

    while ( isdefined( self ) )
    {
        if ( self _meth_8282() < 1 )
        {
            if ( !isdefined( self._id_2D30 ) )
                self _meth_8059();
            else
            {

            }

            self notify( "speed_zero_path_disconnect" );

            while ( self _meth_8282() < 1 )
                wait 0.05;
        }

        self _meth_805A();
        wait 1;
    }
}

_id_5BD0()
{
    var_0 = self.classname;

    if ( isdefined( self._id_7A81 ) && self._id_7A81 > 0 )
        return;

    if ( !isdefined( level._id_9D0C[var_0] ) )
        return;

    var_1 = 0;

    if ( isdefined( self._id_7A33 ) )
        var_1 = self._id_7A33;

    var_2 = level._id_9D0C[var_0];

    if ( !isdefined( var_2 ) )
        return;

    var_3 = isdefined( self._id_0398 ) && self._id_0398 == "onemg";

    foreach ( var_7, var_5 in var_2 )
    {
        var_6 = spawnturret( "misc_turret", ( 0, 0, 0 ), var_5._id_4C5C );

        if ( isdefined( var_5._id_637D ) )
            var_6 _meth_804F( self, var_5._id_0428, var_5._id_637D, ( 0, -1 * var_1, 0 ) );
        else
            var_6 _meth_804F( self, var_5._id_0428, ( 0, 0, 0 ), ( 0, -1 * var_1, 0 ) );

        var_6 _meth_80B3( var_5._id_029C );
        var_6.angles = self.angles;
        var_6._id_51FF = 1;
        var_6._id_663C = self;
        var_6._id_7AEF = self._id_7AEF;
        var_6 thread _id_A558::_id_192D();
        var_6 _meth_80C2();
        _id_7EE3( var_6 );
        level thread _id_A558::_id_5BC8( var_6, _id_A5A4::_id_3F58() );

        if ( isdefined( self._id_79D0 ) )
            var_6._id_79D0 = self._id_79D0;

        if ( isdefined( var_5._id_284B ) )
            var_6._id_284B = var_5._id_284B;

        if ( isdefined( var_5._id_0272 ) )
            var_6._id_0272 = var_5._id_0272;

        if ( isdefined( var_5._id_2794 ) )
            var_6 _meth_815C( var_5._id_2794 );

        self._id_5BD5[var_7] = var_6;

        if ( var_3 )
            break;
    }

    foreach ( var_10, var_6 in self._id_5BD5 )
    {
        var_9 = level._id_9D0C[var_0][var_10]._id_279B;

        if ( isdefined( var_9 ) )
            var_6 _id_9985( var_9 );
    }

    if ( !isdefined( self._id_7B04 ) )
        self._id_7B04 = 1;

    if ( self._id_7B04 == 0 )
        thread _id_05EF();
    else
    {
        self._id_7B04 = 1;
        thread _id_05F0();
    }
}

_id_9985( var_0 )
{
    self._id_279B = var_0;
}

_id_7EE3( var_0 )
{
    switch ( self._id_7AEF )
    {
        case "friendly":
        case "allies":
            var_0 _meth_8137( "allies" );
            break;
        case "enemy":
        case "axis":
            var_0 _meth_8137( "axis" );
            break;
        case "team3":
            var_0 _meth_8137( "team3" );
            break;
        default:
            break;
    }
}

_id_0C55()
{
    self endon( "suspend_drive_anims" );

    if ( !isdefined( self._id_A2FE ) )
        self._id_A2FE = 1;

    var_0 = self._id_029C;
    var_1 = -1;
    var_2 = undefined;
    self _meth_8117( #animtree );

    if ( !isdefined( level._id_9CB8[var_0] ) )
        return;

    if ( !isdefined( level._id_9CBB[var_0] ) )
        level._id_9CBB[var_0] = level._id_9CB8[var_0];

    self endon( "death" );
    var_3 = level._id_9CBA[var_0];
    var_4 = 1.0;

    if ( isdefined( level._id_9CB9 ) && isdefined( level._id_9CB9[var_0] ) )
        var_4 = level._id_9CB9[var_0];

    var_5 = self._id_A2FE;
    var_6 = self;
    var_7 = level._id_9CB8[var_0];

    for (;;)
    {
        if ( isdefined( level._id_0C56 ) )
            var_6 = _id_05B3();

        if ( !var_3 )
        {
            if ( isdefined( self._id_8FFE ) )
            {
                wait 0.05;
                continue;
            }

            var_6 _meth_814D( level._id_9CB8[var_0], 1, 0.2, var_4 );
            return;
        }

        var_8 = self _meth_8282();

        if ( self._id_5D41 && isdefined( self._id_2FC4 ) )
            var_8 = self._id_2FC4;

        if ( var_5 != self._id_A2FE )
        {
            var_9 = 0;

            if ( self._id_A2FE )
            {
                var_7 = level._id_9CB8[var_0];
                var_9 = 1 - var_6 _id_4052( level._id_9CBB[var_0] );
                var_6 _meth_8144( level._id_9CBB[var_0], 0 );
            }
            else
            {
                var_7 = level._id_9CBB[var_0];
                var_9 = 1 - var_6 _id_4052( level._id_9CB8[var_0] );
                var_6 _meth_8144( level._id_9CB8[var_0], 0 );
            }

            var_2 = 0.01;

            if ( var_2 >= 1 || var_2 == 0 )
                var_2 = 0.01;

            var_5 = self._id_A2FE;
        }

        var_10 = var_8 / var_3;

        if ( var_10 != var_1 )
        {
            var_6 _meth_814D( var_7, 1, 0.05, var_10 );
            var_1 = var_10;
        }

        if ( isdefined( var_2 ) )
        {
            var_6 _meth_8119( var_7, var_2 );
            var_2 = undefined;
        }

        wait 0.05;
    }
}

_id_80E0( var_0, var_1 )
{
    var_2 = [[ var_1 ]]( var_0._id_04A6 );
    var_2._id_29B6 = 0;
}

_id_8042()
{
    foreach ( var_1 in _func_0D9() )
    {
        if ( isdefined( var_1._id_7B19 ) )
            level._id_9D22 = _id_0CD9( level._id_9D22, var_1._id_7B19, var_1 );
    }

    foreach ( var_1 in _func_0DB() )
    {
        if ( isdefined( var_1._id_7B19 ) )
            level._id_9D25 = _id_0CD9( level._id_9D25, var_1._id_7B19, var_1 );
    }

    if ( isdefined( level._id_893E ) )
    {
        foreach ( var_6 in level._id_8F60 )
        {
            if ( isdefined( var_6._id_7B19 ) && isdefined( var_6._id_7ACE ) )
                level._id_9D25 = _id_0CD9( level._id_9D25, var_6._id_7B19, var_6 );
        }
    }
}

_id_0CD9( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0[var_1] ) )
        var_0[var_1] = [];

    var_0[var_1][var_0[var_1].size] = var_2;
    return var_0;
}

_id_5057( var_0 )
{
    return isdefined( var_0.classname ) && var_0.classname == "script_origin";
}

_id_6129()
{
    var_0 = 0;

    if ( isdefined( self._id_03DA ) && self._id_03DA & 1 )
    {
        if ( isdefined( self._id_797F ) )
            level._id_9C9C[level._id_9C9C.size] = self;

        level._id_9D4A[level._id_9D4A.size] = self;
    }

    if ( isdefined( self._id_7B13 ) && isdefined( self._id_04A6 ) )
    {
        var_1 = undefined;

        if ( isdefined( _id_3D7E( self._id_04A6 ) ) )
            var_1 = ::_id_3D7F;

        if ( isdefined( _id_3D80( self._id_04A6 ) ) )
            var_1 = ::_id_3D81;

        if ( isdefined( var_1 ) )
        {
            _id_80E0( self, var_1 );
            var_0 = 1;
        }
        else
            _id_8132( self );

        level._id_9CB5 = _id_0CD9( level._id_9CB5, self._id_7B13, self );

        if ( level._id_9CB5[self._id_7B13].size > 2 )
        {

        }
    }

    if ( isdefined( self._id_79FC ) )
    {
        level._id_9CC8 = _id_0CD9( level._id_9CC8, self._id_79FC, self );
        self._id_3C5B = 0;
    }

    if ( isdefined( self._id_79D8 ) )
    {
        if ( !isdefined( level._id_382E[self._id_79D8] ) )
            common_scripts\utility::_id_383D( self._id_79D8 );
    }

    if ( isdefined( self._id_79D4 ) )
    {
        if ( !isdefined( level._id_382E[self._id_79D4] ) )
            common_scripts\utility::_id_383D( self._id_79D4 );
    }

    if ( isdefined( self._id_79DA ) )
    {
        if ( !isdefined( level._id_382E[self._id_79DA] ) )
            common_scripts\utility::_id_383D( self._id_79DA );
    }

    if ( isdefined( self._id_7B1A ) || isdefined( self._id_7B1B ) || isdefined( self._id_79FC ) || isdefined( self._id_7B17 ) )
        var_0 = 1;

    if ( var_0 )
        _id_0788( self );
}

_id_82DC()
{
    level._id_9D1C = [];
    var_0 = [];
    var_0 = common_scripts\utility::_id_0CDD( _func_1EE(), getentarray( "script_origin", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, level._id_8F60 );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_radius", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_disk", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_multiple", "code_classname" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "trigger_lookat", "code_classname" ) );
    common_scripts\utility::_id_0D13( var_0, ::_id_6129 );
}

_id_5058( var_0 )
{
    if ( !isdefined( var_0._id_04A6 ) )
        return 0;

    return isdefined( common_scripts\utility::_id_40FB( var_0._id_04A6, "targetname" ) );
}

_id_82E4( var_0 )
{
    var_1 = [];
    level._id_360F = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3 _id_1CE8() )
        {
            continue;
            continue;
        }

        var_1[var_1.size] = var_3;
    }

    _id_1CBA();

    foreach ( var_6 in var_1 )
        thread _id_9CEA( var_6 );
}

_id_1CBA()
{
    if ( !level._id_360F.size )
    {
        level._id_360F = undefined;
        return;
    }

    foreach ( var_1 in level._id_360F )
    {

    }
}

_id_1CE8()
{
    if ( isdefined( self._id_7B1A ) && !_func_1A2( self ) )
    {
        level._id_360F[level._id_360F.size] = self;
        return 1;
    }

    return _func_1A2( self );
}

_id_9CF9()
{
    var_0 = self.classname;

    if ( !isdefined( level._id_9CF9 ) || !isdefined( level._id_9CF9[var_0] ) )
        wait 2;

    if ( isdefined( self._id_7ADB ) )
        self._id_01E6 = self._id_7ADB;
    else if ( level._id_9CF9[var_0] == -1 )
        return;
    else if ( isdefined( level._id_9CFB[var_0] ) && isdefined( level._id_9CFA[var_0] ) )
        self._id_01E6 = _func_0B2( level._id_9CFA[var_0] - level._id_9CFB[var_0] ) + level._id_9CFB[var_0];
    else
        self._id_01E6 = level._id_9CF9[var_0];

    if ( isdefined( level._id_2922[self._id_029C] ) )
    {
        self._id_01E6 = 2000;
        self._id_0117 = level._id_2922[self._id_029C];
        common_scripts\_destructible::_id_80B1( 1 );
    }
}

_id_8037( var_0 )
{
    if ( isdefined( self._id_5BD5 ) && self._id_5BD5.size )
    {
        foreach ( var_2 in self._id_5BD5 )
            var_2._id_79D0 = var_0;
    }
}

_id_4052( var_0 )
{
    var_1 = self _meth_8151( var_0 );
    var_2 = getanimlength( var_0 );

    if ( var_1 == 0 )
        return 0;

    return self _meth_8151( var_0 ) / getanimlength( var_0 );
}

_id_7611()
{
    var_0 = getanimlength( _id_A5A4::_id_3EF5( "rotors" ) );

    for (;;)
    {
        self _meth_814D( _id_A5A4::_id_3EF5( "rotors" ), 1, 0, 1 );
        wait(var_0);
    }
}

_id_8FFD()
{
    self notify( "suspend_drive_anims" );
    var_0 = self._id_029C;
    self _meth_8144( level._id_9CB8[var_0], 0 );
    self _meth_8144( level._id_9CBB[var_0], 0 );
}

_id_4B69()
{
    self _meth_8117( #animtree );

    if ( !isdefined( level._id_9CE6[self._id_029C] ) )
        return;

    foreach ( var_1 in level._id_9CE6[self._id_029C] )
        self _meth_814D( var_1 );
}

_id_9D2C()
{
    self endon( "kill_rumble_forever" );
    var_0 = self.classname;
    var_1 = undefined;

    if ( isdefined( self._id_9D2E ) )
        var_1 = self._id_9D2E;
    else if ( isdefined( level._id_9D2D ) && isdefined( level._id_9D2D[var_0] ) )
        var_1 = level._id_9D2D;
    else if ( isdefined( level._id_9D2C[var_0] ) )
        var_1 = level._id_9D2C[var_0];

    if ( !isdefined( var_1 ) )
        return;

    var_2 = var_1._id_0351 * 2;
    var_3 = -1 * var_1._id_0351;
    var_4 = spawn( "trigger_radius", self._id_02E2 + ( 0, 0, var_3 ), 0, var_1._id_0351, var_2 );
    var_4 _meth_806B();
    var_4 _meth_804F( self );
    self._id_76A2 = var_4;
    self endon( "death" );

    if ( !isdefined( self._id_769B ) )
        self._id_769B = 1;

    if ( isdefined( var_1._id_782D ) )
        self._id_7694 = var_1._id_782D;
    else
        self._id_7694 = 0.15;

    if ( isdefined( var_1._id_0136 ) )
        self._id_7679 = var_1._id_0136;
    else
        self._id_7679 = 4.5;

    if ( isdefined( var_1._id_0351 ) )
        self._id_768D = var_1._id_0351;
    else
        self._id_768D = 600;

    if ( isdefined( var_1._id_1318 ) )
        self._id_7677 = var_1._id_1318;
    else
        self._id_7677 = 1;

    if ( isdefined( var_1._id_711D ) )
        self._id_7691 = var_1._id_711D;
    else
        self._id_7691 = 1;

    var_4._id_0351 = self._id_768D;

    for (;;)
    {
        var_4 waittill( "trigger" );

        if ( self _meth_8282() == 0 || !self._id_769B )
        {
            wait 0.1;
            continue;
        }

        self _meth_80B0( var_1._id_7675 );

        while ( level._id_0318 _meth_80AB( var_4 ) && self._id_769B && self _meth_8282() > 0 )
        {
            _func_18C( self._id_7694, self._id_7679, self._id_02E2, self._id_768D );
            wait(self._id_7677 + _func_0B3( self._id_7691 ));
        }

        self _meth_80B1( var_1._id_7675 );
    }
}

_id_9CF2()
{
    self notify( "kill_treads_forever" );
}

_id_51B9()
{
    var_0 = self._id_04FF;

    if ( isdefined( level._id_9CEC[var_0] ) && level._id_9CEC[var_0] )
        return 1;
    else
        return 0;
}

_id_9D39()
{
    if ( !isdefined( level._id_9D39[self.classname] ) )
        return;

    if ( getdvar( "disable_tank_shock_minspec" ) == "1" )
        return;

    self endon( "death" );
    self endon( "stop_vehicle_shoot_shock" );

    for (;;)
    {
        self waittill( "weapon_fired" );

        if ( isdefined( self._id_83CF ) )
            var_0 = self._id_83CF;
        else
            var_0 = 400;

        var_1 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

        if ( var_1 > var_0 )
            continue;

        if ( isdefined( level._id_0318._id_38B1 ) && level._id_0318._id_38B1 - gettime() > 200 )
            continue;

        if ( isdefined( self._id_83BB ) && self._id_83BB )
            continue;

        if ( isdefined( self._id_83BC ) )
            var_2 = self._id_83BC;
        else
        {
            var_3 = var_1 / var_0;
            var_2 = 4 - 3 * var_3;
        }

        level._id_0318 _meth_8186( level._id_9D39[self.classname], var_2 );
        _id_A5E8::_id_870C( "start_vehicle_shell_shock", var_2 );
    }
}

_id_9D37()
{
    var_0 = self.classname;

    if ( !isdefined( self._id_7AEF ) && isdefined( level._id_9D55[var_0] ) )
        self._id_7AEF = level._id_9D55[var_0];

    level._id_9D7A[self._id_7AEF] = common_scripts\utility::_id_0CDA( level._id_9D7A[self._id_7AEF], self );
}

_id_9CDD()
{
    self endon( "death" );
    var_0 = self._id_04FF;

    if ( !_id_A5A4::_id_32DC( "unloaded" ) )
        _id_A5A4::_id_32DD( "unloaded" );

    for (;;)
    {
        self waittill( "unload", var_1 );

        if ( isdefined( var_1 ) )
            self._id_9A3C = var_1;

        _id_A5A8::_id_9D67( var_1 );
    }
}

_id_3EBA( var_0 )
{
    var_1 = _func_1EC( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        var_1 = getent( var_0, "targetname" );
    else if ( _id_05D8() )
    {

    }

    if ( !isdefined( var_1 ) )
    {
        var_2 = common_scripts\utility::_id_40FD( var_0, "targetname" );
        var_3 = [];

        if ( isdefined( var_2 ) )
        {
            foreach ( var_5 in var_2 )
            {
                if ( isdefined( var_5._id_7B09 ) )
                    continue;

                var_3[var_3.size] = var_5;
            }
        }

        if ( var_3.size == 1 )
            var_1 = var_3[0];
        else
            var_1 = undefined;
    }

    return var_1;
}

_id_9D20()
{
    if ( !_id_05D8() )
    {
        self _meth_828D( 35 );
        return;
    }

    var_0 = undefined;

    if ( isdefined( self._id_251D._id_04A4 ) )
        var_0 = _id_3EBA( self._id_251D._id_04A4 );

    if ( !isdefined( var_0 ) )
        return;

    _id_0689( var_0 );
}

_id_46EF()
{
    return isdefined( level._id_9CC7[self.classname] );
}

_id_4408( var_0 )
{
    if ( !isdefined( self._id_7A08 ) )
        return 0;

    var_0 = _func_123( var_0 );

    if ( !isdefined( var_0 ) || !_func_120( var_0, "grenade" ) )
        return 0;

    if ( self._id_7A08 )
        return 1;
    else
        return 0;
}

_id_18AF( var_0 )
{
    if ( !isdefined( self._id_7965 ) )
        return 0;

    var_0 = _func_123( var_0 );

    if ( !isdefined( var_0 ) || !_func_120( var_0, "bullet" ) || _func_120( var_0, "explosive" ) )
        return 0;

    if ( self._id_7965 )
        return 1;
    else
        return 0;
}

_id_354E( var_0 )
{
    if ( !isdefined( self._id_79C2 ) )
        return 0;

    var_0 = _func_123( var_0 );

    if ( !isdefined( var_0 ) || !_func_120( var_0, "explosive" ) )
        return 0;

    if ( self._id_79C2 )
        return 1;
    else
        return 0;
}

_id_9D3B( var_0, var_1 )
{
    return !isdefined( var_0 ) && self._id_7AEF != "neutral" || _id_0E29( var_0 ) || _id_0E2A( var_0 ) || common_scripts\utility::_id_50F2() || _id_5043( var_0 ) || _id_18AF( var_1 ) || _id_354E( var_1 ) || _id_4408( var_1 ) || var_1 == "MOD_MELEE" || var_1 == "MOD_MELEE_ALT";
}

_id_3A9F()
{
    self endon( "death" );

    if ( !isdefined( level._id_9A96 ) )
        self endon( "stop_friendlyfire_shield" );

    var_0 = self.classname;

    if ( isdefined( level._id_9C92[var_0] ) && !isdefined( self._id_7965 ) )
        self._id_7965 = level._id_9C92[var_0];

    if ( isdefined( level._id_9CDB[var_0] ) && !isdefined( self._id_7A08 ) )
        self._id_7A08 = level._id_9CDB[var_0];

    if ( isdefined( self._id_7A76 ) )
    {
        self._id_7A76 = 1;
        self._id_1892 = 5000;
        self._id_01E6 = 350;
    }
    else
        self._id_7A76 = 0;

    self._id_4786 = 20000;
    self._id_01E6 += self._id_4786;
    self._id_2516 = self._id_01E6;
    var_1 = undefined;
    var_2 = undefined;

    for ( var_3 = undefined; self._id_01E6 > 0; var_3 = undefined )
    {
        self waittill( "damage", var_4, var_1, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3 );

        foreach ( var_12 in self._id_257E )
            thread [[ var_12 ]]( var_4, var_1, var_5, var_6, var_2, var_7, var_8 );

        if ( isdefined( var_1 ) )
            var_1 _id_A56F::_id_72E7();

        if ( _id_9D3B( var_1, var_2 ) || _id_05D6() )
            self._id_01E6 = self._id_2516;
        else if ( _id_46EF() )
        {
            _id_72D1( var_1, var_4 );
            self._id_2516 = self._id_01E6;
        }
        else if ( _id_491A( var_2 ) )
        {
            self._id_01E6 = self._id_2516;
            self._id_1892 -= var_4;
        }
        else
            self._id_2516 = self._id_01E6;

        if ( common_scripts\_destructible::_id_3F4C( var_2 ) == "splash" )
            self._id_756E = 1;
        else
            self._id_756E = undefined;

        if ( self._id_01E6 < self._id_4786 && !isdefined( self._id_9D4B ) )
            break;

        var_4 = undefined;
        var_1 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_2 = undefined;
        var_7 = undefined;
        var_8 = undefined;
        var_9 = undefined;
        var_10 = undefined;
    }

    self notify( "death", var_1, var_2, var_3 );
}

_id_491A( var_0 )
{
    if ( !self._id_7A76 )
        return 0;

    if ( self._id_1892 <= 0 )
        return 0;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( !_func_120( var_0, "BULLET" ) )
        return 0;
    else
        return 1;
}

_id_72D1( var_0, var_1 )
{
    var_2 = anglestoforward( self.angles );
    var_3 = _func_114( var_0._id_02E2 - self._id_02E2 );

    if ( _func_0F6( var_2, var_3 ) > 0.86 )
        self._id_01E6 += _func_0BC( var_1 * level._id_9CC7[self.classname] );
}

_id_05D6()
{
    if ( isdefined( self._id_4257 ) && self._id_4257 )
        return 1;
    else
        return 0;
}

_id_5043( var_0 )
{
    if ( !isdefined( self._id_792D ) )
        return 0;

    if ( isdefined( var_0 ) && _func_0CF( var_0 ) && self._id_792D == 1 )
        return 1;
    else
        return 0;
}

_id_0E2A( var_0 )
{
    if ( isdefined( self._id_7AEF ) && self._id_7AEF == "allies" && isdefined( var_0 ) && _func_1AD( var_0 ) )
        return 1;
    else if ( _func_0CF( var_0 ) && var_0._id_04A7 == self._id_7AEF )
        return 1;
    else
        return 0;
}

_id_0E29( var_0 )
{
    if ( isdefined( var_0 ) && isdefined( var_0._id_7AEF ) && isdefined( self._id_7AEF ) && var_0._id_7AEF == self._id_7AEF )
        return 1;

    return 0;
}

_id_9C8F()
{
    return _id_0684();
}

_id_A2FF( var_0 )
{
    self._id_A2FE = common_scripts\utility::_id_9294( var_0 <= 0, 0, 1 );
}

_id_5908()
{
    if ( isdefined( level._id_5909 ) )
    {
        thread [[ level._id_5909 ]]();
        return;
    }

    var_0 = self._id_029C;

    if ( !isdefined( level._id_9CB1[var_0] ) )
        return;

    self endon( "death" );

    for (;;)
    {
        self waittill( "weapon_fired" );
        playfxontag( level._id_9CB1[var_0], self, "tag_engine_exhaust" );
        var_1 = self _meth_8184( "tag_flash" );
        var_2 = _func_08F( var_1, var_1 + ( 0, 0, -128 ) );
        _func_17E( var_2, 192, 100, 1 );
    }
}

_id_6DE2()
{
    self endon( "death" );
    var_0 = self._id_029C;

    if ( !isdefined( level._id_9CC1[var_0] ) )
        return;

    var_1 = 0.1;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        if ( !_func_1A1( self ) )
            return;

        playfxontag( level._id_9CC1[var_0], _id_05B3(), "tag_engine_exhaust" );
        wait(var_1);
    }
}

_id_4062( var_0 )
{
    var_1 = undefined;
    var_2 = self._id_04FF;

    if ( isdefined( self._id_9D45 ) )
    {
        if ( isdefined( self._id_9D45._id_2D36 ) && self._id_2D36 )
            return;
    }

    if ( isdefined( self._id_04A4 ) )
    {
        var_1 = _func_1EC( self._id_04A4, "targetname" );

        if ( !isdefined( var_1 ) )
        {
            var_3 = getentarray( self._id_04A4, "targetname" );

            foreach ( var_5 in var_3 )
            {
                if ( var_5.code_classname == "script_origin" )
                {
                    var_1 = var_5;
                    break;
                }
            }
        }

        if ( !isdefined( var_1 ) )
            var_1 = common_scripts\utility::_id_40FB( self._id_04A4, "targetname" );
    }

    if ( !isdefined( var_1 ) )
    {
        if ( _id_05D8() )
        {
            if ( isdefined( self._id_9CE2 ) )
                self [[ self._id_9CE2 ]]();
            else
                self _meth_827F( 60, 20, 10 );
        }

        return;
    }

    self._id_0DF6 = var_1;

    if ( !_id_05D8() )
    {
        self._id_02E2 = var_1._id_02E2;

        if ( !isdefined( var_0 ) )
            self _meth_8279( var_1 );
    }
    else if ( isdefined( self._id_03E2 ) )
        self _meth_8280( self._id_03E2, 20 );
    else if ( isdefined( var_1._id_03E2 ) )
    {
        if ( isdefined( self._id_9CE2 ) )
            self [[ self._id_9CE2 ]]( var_1._id_03E2, var_1._id_7929, var_1._id_798B );
        else
            self _meth_827F( var_1._id_03E2, 20, 10 );
    }
    else if ( isdefined( self._id_9CE2 ) )
        self [[ self._id_9CE2 ]]();
    else
        self _meth_827F( 60, 20, 10 );

    thread _id_0689( undefined, _id_05D8() );
}

_id_068A( var_0 )
{
    var_1 = self._id_9D4C[var_0];
    self._id_9D4C[var_0] = undefined;

    if ( self._id_9D4C.size )
        return;

    self _meth_828D( var_1 );
}

_id_068C( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_9D4C ) )
        self._id_9D4C = [];

    self _meth_827F( 0, var_1, var_2 );
    self._id_9D4C[var_0] = var_1;
}

_id_9A42( var_0 )
{
    self endon( "death" );

    if ( isdefined( self._id_32D8["prep_unload"] ) && _id_A5A4::_id_32D8( "prep_unload" ) )
        return;

    if ( _func_120( self.classname, "snowmobile" ) )
    {
        while ( self._id_04F9 > 15 )
            wait 0.05;
    }

    if ( !isdefined( var_0._id_79DA ) && !isdefined( var_0._id_0392 ) )
        self notify( "newpath" );

    var_1 = _func_0C3( var_0._id_04A6, "target" );

    if ( isdefined( var_1 ) && self._id_750A.size )
    {
        foreach ( var_3 in self._id_750A )
        {
            if ( _func_0CF( var_3 ) )
                var_3 thread _id_A581::_id_4241( var_1 );
        }
    }

    if ( _id_05D8() )
    {
        if ( isdefined( self._id_667F ) )
        {
            self _meth_8290( 0, 0 );
            _id_A086();
            common_scripts\utility::_id_27CD( 5, ::_meth_8290, 15, 15 );
        }
        else
        {
            self _meth_824F( 0 );
            _id_A0B8( var_0 );
        }
    }
    else if ( !isdefined( self._id_5FA4 ) || !self._id_5FA4 )
        self _meth_827F( 0, 35 );

    if ( isdefined( var_0._id_0398 ) )
    {
        if ( var_0._id_0398 == "wait_for_flag" )
            common_scripts\utility::_id_384A( var_0._id_79D3 );
    }

    kill_deathanim_set_state( "unloading" );
    _id_068D( var_0._id_7B06 );

    if ( _id_A5A9::_id_750C( var_0._id_7B06 ) )
    {
        if ( isdefined( self._id_667F ) )
        {
            if ( isdefined( var_0._id_0398 ) )
            {
                if ( var_0._id_0398 == "para_unload_stop" )
                    self waittill( "unloaded" );
            }
        }
        else
            self waittill( "unloaded" );
    }

    if ( isdefined( var_0._id_79DA ) || isdefined( var_0._id_0392 ) )
        return;

    if ( isdefined( self ) )
        thread _id_9D20();

    kill_deathanim_set_state( "unloaded" );
}

_id_5F3B( var_0 )
{
    var_1 = self.classname;

    if ( !isdefined( self._id_5BD5 ) )
        return;

    if ( self._id_5BD5.size == 0 )
        return;

    foreach ( var_4, var_3 in self._id_5BD5 )
    {
        var_3 _meth_8051();
        var_3 _meth_804F( var_0, level._id_9D0C[var_1][var_4]._id_0428, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }
}

_id_9D16()
{
    self._id_0DF6 = undefined;
    self notify( "newpath" );
    self _meth_8258( common_scripts\utility::_id_38C8( self.angles )[1] );
    self _meth_8257( self._id_02E2 + ( 0, 0, 4 ), 1 );
}

_id_A086()
{
    var_0 = 4;
    var_1 = 400;
    var_2 = gettime() + var_1;

    while ( isdefined( self ) )
    {
        var_3 = self._id_02E2[2] - self._id_251D._id_02E2[2];

        if ( _func_0BE( var_3 ) <= var_0 )
            return;
        else
            var_2 = gettime() + var_1;

        if ( gettime() > var_2 )
        {
            iprintln( "Chopper parachute unload: waittill_dropoff_height timed out!" );
            break;
        }

        wait 0.05;
    }
}

_id_2666()
{
    if ( self._id_01E6 > 0 )
        self._id_759E = 1;
}

_id_2665()
{
    self._id_759E = undefined;
    self notify( "deathrolloff" );
}

_id_05EF()
{
    self._id_7B04 = 0;

    if ( _id_05D8() && _id_4730() )
    {
        if ( isdefined( level._id_1D5F ) )
        {
            self thread [[ level._id_1D60 ]]();
            return;
        }
    }

    if ( !isdefined( self._id_5BD5 ) )
        return;

    foreach ( var_2, var_1 in self._id_5BD5 )
    {
        if ( isdefined( var_1._id_79D0 ) )
            var_1._id_79D0 = 0;

        var_1 _meth_8067( "manual" );
    }
}

_id_05F0()
{
    self._id_7B04 = 1;

    if ( _id_05D8() && _id_4730() )
    {
        self thread [[ level._id_1D61 ]]();
        return;
    }

    if ( !isdefined( self._id_5BD5 ) )
        return;

    foreach ( var_1 in self._id_5BD5 )
    {
        var_1 _meth_8055();

        if ( isdefined( var_1._id_79D0 ) )
            var_1._id_79D0 = 1;

        if ( isdefined( var_1._id_279B ) )
        {
            if ( var_1._id_279B != "sentry" )
                var_1 _meth_8067( var_1._id_279B );
        }
        else
            var_1 _meth_8067( "auto_nonai" );

        _id_7EE3( var_1 );
    }
}

_id_05AF()
{
    if ( common_scripts\utility::_id_50F2() )
        common_scripts\_destructible::_id_3995();
    else
    {
        self _meth_8054();
        self _meth_82BC( 0 );
    }
}

_id_3EB3()
{
    if ( !isdefined( self._id_7B19 ) )
        return [];

    if ( !isdefined( level._id_9D22[self._id_7B19] ) )
        return [];

    return level._id_9D22[self._id_7B19];
}

_id_3EB4()
{
    var_0 = [];

    if ( isdefined( self._id_04A4 ) )
    {
        var_1 = getentarray( self._id_04A4, "targetname" );

        foreach ( var_3 in var_1 )
        {
            if ( !_func_120( var_3.code_classname, "actor" ) )
                continue;

            if ( !( var_3._id_03DA & 1 ) )
                continue;

            if ( isdefined( var_3._id_2D1B ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        if ( isdefined( level._id_893E ) )
        {
            var_1 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );

            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_7ACE ) )
                    var_0[var_0.size] = var_3;
            }
        }
    }

    if ( !isdefined( self._id_7B19 ) )
        return var_0;

    if ( isdefined( level._id_9D25[self._id_7B19] ) )
        var_0 = common_scripts\utility::_id_0CDD( var_0, level._id_9D25[self._id_7B19] );

    return var_0;
}

_id_0689( var_0, var_1, var_2 )
{
    if ( _id_05D8() )
        _id_9D18( var_0, var_1, var_2 );
    else
        _id_9D19( var_0 );
}

_id_05C6( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    if ( isdefined( var_0._id_7B1B ) )
        level._id_9D49[var_0._id_7B1B] = common_scripts\utility::_id_0CF6( level._id_9D49[var_0._id_7B1B], var_0 );

    var_0 endon( "death" );

    if ( isdefined( var_0._id_4746 ) )
        return;
    else
        var_0._id_4746 = 1;

    var_0 _id_A5A4::_id_0392();
    var_0 notify( "start_vehiclepath" );

    if ( var_0 _id_05D8() )
        var_0 notify( "start_dynamicpath" );
    else
    {
        var_1 = _func_1EC( var_0._id_04A4, "targetname" );

        if ( isdefined( var_1 ) )
            var_0 thread _id_0689( var_1 );

        var_0 _meth_827B();
    }
}

_id_062F( var_0 )
{
    var_1 = _id_05BF( var_0 );
    var_2 = [];

    foreach ( var_4 in var_1 )
        var_2[var_2.size] = _id_068B( var_4 );

    level notify( "vehiclegroup spawned" + var_0, var_2 );
    return var_2;
}

_id_068B( var_0 )
{
    if ( !_func_1A2( var_0 ) )
        return;

    var_1 = var_0 _meth_822A();

    if ( !isdefined( var_0._id_89A2 ) )
        var_0._id_89A2 = 0;

    var_0._id_89A2++;
    var_0._id_9D44 = var_1;
    var_0._id_555C = var_1;
    var_0 thread _id_738C();
    var_1._id_9D45 = var_0;

    if ( isdefined( var_0._id_9882 ) )
        var_1._id_9882 = var_0._id_9882;

    thread _id_9CEA( var_1 );
    var_0 notify( "spawned", var_1 );

    if ( isdefined( var_1._id_0398 ) )
        level notify( "new_vehicle_spawned" + var_1._id_0398, var_1 );

    return var_1;
}

_id_5340( var_0 )
{
    var_0 waittill( "trigger" );
    _id_A5A4::_id_0CE5( level._id_9CF4[var_0._id_7A1C] );
    level._id_9CF4[var_0._id_7A1C] = [];
}

_id_6ECF()
{
    var_0 = [];
    var_1 = getentarray( "script_vehicle", "code_classname" );
    level._id_6082 = [];
    var_2 = [];
    var_0 = [];

    if ( !isdefined( level._id_9D76 ) )
        level._id_9D76 = [];

    foreach ( var_4 in var_1 )
    {
        var_4._id_04FF = _func_123( var_4._id_04FF );

        if ( var_4._id_04FF == "empty" )
            continue;

        if ( isdefined( var_4._id_03DA ) && var_4._id_03DA & 1 )
            var_2[var_2.size] = var_4;

        var_0[var_0.size] = var_4;

        if ( !isdefined( level._id_9D76[var_4._id_04FF] ) )
            level._id_9D76[var_4._id_04FF] = [];

        var_5 = "classname: " + var_4.classname;
        _id_6EE7( var_5, var_4 );
    }

    if ( level._id_6082.size > 0 )
    {
        foreach ( var_8 in level._id_6082 )
        {

        }

        level waittill( "never" );
    }

    return var_0;
}

_id_6EE7( var_0, var_1 )
{
    if ( isdefined( level._id_9D76[var_1._id_04FF][var_1.classname] ) )
        return;

    if ( var_1.classname == "script_vehicle" )
        return;

    var_2 = 0;

    foreach ( var_4 in level._id_6082 )
    {
        if ( var_4 == var_0 )
            var_2 = 1;
    }

    if ( !var_2 )
        level._id_6082[level._id_6082.size] = var_0;
}

_id_816E()
{
    if ( isdefined( level._id_9D38 ) )
        return;

    level._id_9D38 = 1;
    level._id_9CB2 = [];
    level._id_9D49 = [];
    level._id_9D22 = [];
    level._id_9CB0 = [];
    level._id_9D25 = [];
    level._id_9CC8 = [];
    level._id_9C9C = [];
    level._id_9D03 = [];
    level._id_9CB5 = [];
    level._id_9D4A = [];
    level._id_9CF4 = [];
    level._id_4806 = getentarray( "helicopter_crash_location", "targetname" );
    level._id_4806 = common_scripts\utility::_id_0CDD( level._id_4806, _id_A5A4::_id_40FE( "helicopter_crash_location", "targetname" ) );
    level._id_6D79 = spawn( "script_origin", ( 0, 0, 0 ) );
    level.playervehiclenone = level._id_6D79;
    level._id_9D7A = [];
    level._id_9D7A["allies"] = [];
    level._id_9D7A["axis"] = [];
    level._id_9D7A["neutral"] = [];
    level._id_9D7A["team3"] = [];

    if ( !isdefined( level._id_9D55 ) )
        level._id_9D55 = [];

    if ( !isdefined( level._id_9CAE ) )
        level._id_9CAE = [];

    if ( !isdefined( level._id_9CAB ) )
        level._id_9CAB = [];

    if ( !isdefined( level._id_9CB8 ) )
        level._id_9CB8 = [];

    if ( !isdefined( level._id_9CBB ) )
        level._id_9CBB = [];

    if ( !isdefined( level._id_0E24 ) )
        level._id_0E24 = [];

    if ( !isdefined( level._id_9D72 ) )
        level._id_9D72 = [];

    if ( !isdefined( level._id_9D73 ) )
        level._id_9D73 = [];

    if ( !isdefined( level._id_9CE1 ) )
        level._id_9CE1 = [];

    if ( !isdefined( level._id_9D60 ) )
        level._id_9D60 = [];

    if ( !isdefined( level._id_9D2C ) )
        level._id_9D2C = [];

    if ( !isdefined( level._id_9D2D ) )
        level._id_9D2D = [];

    if ( !isdefined( level._id_9D0C ) )
        level._id_9D0C = [];

    if ( !isdefined( level._id_9CEC ) )
        level._id_9CEC = [];

    if ( !isdefined( level._id_9CA6 ) )
        level._id_9CA6 = [];

    if ( !isdefined( level._id_0685 ) )
        level._id_0685 = [];

    if ( !isdefined( level._id_9D69 ) )
        level._id_9D69 = [];

    if ( !isdefined( level._id_9C82 ) )
        level._id_9C82 = [];

    if ( !isdefined( level._id_9D6A ) )
        level._id_9D6A = [];

    if ( !isdefined( level._id_9CC1 ) )
        level._id_9CC1 = [];

    if ( !isdefined( level._id_9CB1 ) )
        level._id_9CB1 = [];

    if ( !isdefined( level._id_9D39 ) )
        level._id_9D39 = [];

    if ( !isdefined( level._id_9CE3 ) )
        level._id_9CE3 = [];

    if ( !isdefined( level._id_9CC7 ) )
        level._id_9CC7 = [];

    if ( !isdefined( level._id_2922 ) )
        level._id_2922 = [];

    if ( !isdefined( level._id_9D65 ) )
        level._id_9D65 = [];

    if ( !isdefined( level._id_9CDB ) )
        level._id_9CDB = [];

    if ( !isdefined( level._id_9C92 ) )
        level._id_9C92 = [];

    if ( !isdefined( level._id_9CA9 ) )
        level._id_9CA9 = [];

    if ( !isdefined( level._id_9CA5 ) )
        level._id_9CA5 = [];

    if ( !isdefined( level._id_9CE6 ) )
        level._id_9CE6 = [];

    if ( !isdefined( level._id_4810 ) )
        level._id_4810 = [];

    if ( !isdefined( level._id_0997 ) )
        level._id_0997 = [];

    if ( !isdefined( level._id_9D40 ) )
        level._id_9D40 = [];

    if ( !isdefined( level.vehicle_deathanim ) )
        level.vehicle_deathanim = [];

    _id_A5A9::_id_8045();
}

_id_834E( var_0, var_1 )
{
    return _id_0646( var_0, var_1 );
}

_id_9CFD( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 512;

    var_1 = self._id_02E2 + ( 0, 0, var_0 );
    self _meth_8256( 10 );
    _id_834E( var_1, 1 );
    self waittill( "goal" );
}

_id_5F0C( var_0, var_1 )
{
    var_2 = _id_2662();
    var_2 _meth_8051();

    if ( isdefined( var_1 ) )
        var_2 _meth_804F( var_0, var_1 );
    else
        var_2 _meth_804F( var_0 );
}

_id_5D38()
{
    var_0 = self._id_5D40;
    var_0 endon( "death" );
    var_0 endon( "stop_model_dummy_death" );

    while ( isdefined( self ) )
    {
        self waittill( "death" );
        waitframe;
    }

    var_0 delete();
}

_id_5F18( var_0, var_1 )
{
    if ( !isdefined( self._id_5744 ) )
        return;

    if ( self._id_5744.size == 0 )
        return;

    var_2 = get_light_on_groups();

    if ( !isdefined( var_2 ) )
        return;

    foreach ( var_4 in var_2 )
    {
        var_0 _id_574B( var_4, self.classname );
        thread _id_5746( var_4, self.classname );
    }
}

get_light_on_groups()
{
    if ( !isdefined( level._id_9CFF[self.classname] ) )
        return;

    if ( !isdefined( self._id_5744 ) )
        return;

    var_0 = [];
    var_1 = _func_1D3( self._id_5744 );
    var_2 = _func_1D3( level._id_9CFF[self.classname] );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 == "all" )
            continue;

        foreach ( var_6 in var_1 )
        {
            if ( common_scripts\utility::_id_0CE4( level._id_9CFF[self.classname][var_4], var_6 ) )
            {
                var_0[var_0.size] = var_4;
                break;
            }
        }
    }

    return var_0;
}

_id_897E( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( !isdefined( var_5.code_classname ) || var_5.code_classname != "script_vehicle" )
            continue;

        if ( _func_1A2( var_5 ) )
            var_1[var_1.size] = _id_068B( var_5 );
    }

    return var_1;
}

kill_deathanim_thread( var_0, var_1 )
{
    if ( isdefined( self._id_85B8 ) && self._id_85B8 )
        return;

    var_2 = get_deathanim_info( var_0 );

    if ( !isdefined( var_2 ) )
        return;

    var_3 = get_deathanim( var_2, var_1 );
    kill_deathanim_play( var_3, var_2 );
}

get_deathanim_info( var_0 )
{
    if ( isdefined( self.vehicle_deathanim ) )
        return self.vehicle_deathanim;

    if ( isdefined( self.vehicle_deathanim_state ) )
    {
        var_1 = var_0 + "_" + self.vehicle_deathanim_state;

        if ( isdefined( level.vehicle_deathanim[var_1] ) )
            return level.vehicle_deathanim[var_1];
    }

    if ( isdefined( level.vehicle_deathanim[var_0] ) )
        return level.vehicle_deathanim[var_0];

    return undefined;
}

get_deathanim( var_0, var_1 )
{
    if ( isdefined( self.preferred_deathanim ) )
        return self.preferred_deathanim;

    if ( var_0.is_directional )
        return get_directional_deathanim( var_0, var_1 );

    return common_scripts\utility::_id_710E( var_0._id_0C7A );
}

get_directional_deathanim( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return common_scripts\utility::_id_710E( var_0._id_0C7A );

    var_2 = get_attacker_direction( var_1 );

    if ( !_func_0CE( var_0._id_0C7A[var_2] ) )
        return var_0._id_0C7A[var_2];

    return common_scripts\utility::_id_710E( var_0._id_0C7A[var_2] );
}

get_attacker_direction( var_0 )
{
    var_1 = _func_114( anglestoforward( self.angles ) );
    var_2 = _func_115( var_1 );
    var_3 = _func_115( var_0._id_02E2 - self._id_02E2 );
    var_4 = var_2[1] - var_3[1];
    var_4 += 360;
    var_4 = _func_0BC( var_4 ) % 360;

    if ( var_4 > 315 || var_4 < 45 )
        return "front";
    else if ( var_4 < 135 )
        return "right";
    else if ( var_4 < 225 )
        return "rear";

    return "left";
}

kill_deathanim_play( var_0, var_1 )
{
    self endon( "death" );
    _id_A5A4::_id_32DD( "kill_deathanim_active" );
    _id_A5A4::_id_32DE( "kill_deathanim_active" );
    self notify( "kill_deathanim", var_0 );

    if ( isdefined( var_1._id_2643 ) && var_1._id_2643 )
        self._id_2643 = 1;

    _id_A5A4::_id_32DD( "kill_deathanim_force_crash_end" );

    if ( isdefined( var_1.delay_crash_force_end ) && var_1.delay_crash_force_end )
        _id_A5A4::_id_32DE( "kill_deathanim_force_crash_end" );

    self _meth_82BC( var_1.can_damage );
    thread kill_deathanim_delete( var_1.delete_time, var_0 );

    if ( isdefined( var_1.notetrack_notifies ) )
    {
        foreach ( var_3 in var_1.notetrack_notifies )
            kill_deathanim_notify( var_0, var_3 );
    }

    if ( var_1.turn_off_engine )
        self _meth_8287();

    if ( var_1.alter_velocity )
        self _meth_827F( var_1.alter_velocity_speed, var_1.alter_velocity_accel, var_1.alter_velocity_decel );

    self _meth_8117( #animtree );

    if ( var_1._id_1E99 )
        self _meth_8144( %root, var_1.clear_anims_time );

    var_5 = _id_05B3();
    var_5 _meth_814D( var_0, 1, 0, 1 );
    kill_deathanim_crash_delay( var_0, var_1 );
    _id_A5A4::_id_32DA( "kill_deathanim_active" );
}

kill_deathanim_crash_delay( var_0, var_1 )
{
    self endon( "death" );

    if ( !var_1.delay_crash )
        return;

    var_2 = 0;

    if ( animhasnotetrack( var_0, "stop_deathanim_crash_delay" ) )
    {
        var_3 = getanimlength( var_0 );
        var_4 = getnotetracktimes( var_0, "stop_deathanim_crash_delay" );
        var_2 = var_3 * var_4[0];
    }
    else if ( var_1.delay_crash_time > 0 )
        var_2 = var_1.delay_crash_time;
    else
        var_2 = getanimlength( var_0 );

    wait(var_2);
}

kill_deathanim_delete( var_0, var_1 )
{
    if ( _id_A5A4::_id_32D8( "kill_deathanim_force_crash_end" ) )
        self waittill( "death_finished" );
    else
    {
        if ( var_0 < 0 )
            return;

        if ( var_0 == 0 )
            var_0 = getanimlength( var_1 );

        wait(var_0);
    }

    if ( isdefined( self ) && !_func_29C( self ) )
        self delete();
}

kill_deathanim_notify( var_0, var_1 )
{
    self endon( "death" );

    if ( !animhasnotetrack( var_0, var_1 ) )
        return;

    var_2 = getanimlength( var_0 );
    var_3 = getnotetracktimes( var_0, var_1 );
    var_4 = 0;

    foreach ( var_6 in var_3 )
    {
        var_7 = var_2 * var_6;
        wait(var_7 - var_4);
        level notify( var_1, self );
        var_4 += var_7;
    }
}

kill_deathanim_set_state( var_0 )
{
    self.vehicle_deathanim_state = var_0;
}

_id_9A54()
{
    if ( !isdefined( self._id_4706 ) )
        return;

    while ( isdefined( self._id_5744 ) && self._id_5744.size )
        wait 0.05;
}

tread_audio_should_stop_loop( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        if ( var_1 != var_0 )
            return 1;
    }
    else if ( !isdefined( var_0 ) )
        return 1;

    return 0;
}

stop_tread_audio_loop()
{
    if ( isdefined( self.oldtreadsoundfx ) && isdefined( self.soundisalreadyplaying ) && self.soundisalreadyplaying == 1 )
    {
        self notify( "stop sound" + self.oldtreadsoundfx );
        self.soundisalreadyplaying = 0;
        self.oldtreadsoundfx = undefined;
    }
}

prepare_vehicle_play_anim_from_node()
{
    self._id_5D40 = spawn( "script_model", self._id_02E2 );
    self._id_5D40 _meth_80B3( self._id_029C );
    self._id_5D40._id_02E2 = self._id_02E2;
    self._id_5D40.angles = self.angles;
    self._id_5D40 _meth_8117( #animtree );
    self._id_5D40 _meth_8056();
    self._id_5D40 _meth_804F( self );
}

vehicle_play_anim_from_node( var_0 )
{
    var_1 = "vehicles";

    if ( isdefined( self._id_0C72 ) )
        var_1 = var_1;

    var_2 = _func_124( var_0._id_9D7B, ":;, " );
    var_3 = var_2[0];

    if ( !isdefined( level._id_78AC[var_1][var_3] ) )
        return;

    var_4 = "body_animate_jnt";
    _id_A5A8::_id_9D58( var_4, 1 );
    vehicle_dummy_add_collison( var_4 );
    self _meth_8451();
    self _meth_83F1( 1 );
    self _meth_80C0( 0 );
    var_5 = self _meth_8283();
    self _meth_8280( 0, 3000, 3000 );
    self._id_5D40 _id_A5A4::_id_0D61( var_1 );
    var_6 = self._id_5D40;

    if ( var_2.size > 1 )
    {
        var_7 = common_scripts\utility::_id_3E89( var_2[1] );

        if ( isdefined( var_7 ) )
            var_6 = var_7;
    }

    if ( var_6 != self._id_5D40 )
    {
        var_8 = _func_0F1( var_5 );
        var_9 = _func_0EE( self._id_02E2, var_6._id_02E2 );
        var_10 = var_9 / var_8;
        self._id_5D40 _meth_82AA( var_6._id_02E2, var_10 );
        self._id_5D40 _meth_82B1( var_6.angles, var_10 );
        var_11 = _func_0BC( var_10 / 0.05 ) * 0.05;

        if ( var_11 >= 0.05 )
            wait(var_11);
    }

    var_6 _id_A510::_id_0C24( self._id_5D40, var_3 );
}

vehicle_dummy_add_collison( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self.modeldummycoll = spawn( "script_model", self._id_02E2 );
        self.modeldummycoll _meth_80B3( self._id_029C );
        thread model_dummycoll_death();
        var_1 = self._id_5D40._id_02E2 - self._id_5D40 _meth_8184( var_0 );
        var_2 = self._id_5D40.angles - self._id_5D40 _meth_8185( var_0 );
        self.modeldummycoll _meth_804F( self._id_5D40, var_0, var_1, var_2 );
        self.modeldummycoll _meth_8450();
        self.modeldummycoll _meth_8056();
        self.modeldummycoll _meth_8094();
        self._id_5D40 _meth_82BB();
    }
    else
        self._id_5D40 _meth_8450();
}

model_dummycoll_death()
{
    var_0 = self.modeldummycoll;
    var_0 endon( "death" );
    var_0 endon( "stop_model_dummy_death" );

    while ( isdefined( self ) )
    {
        self waittill( "death" );
        waitframe;
    }

    var_0 delete();
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precachemodel( "grenade_bag" );
    createthreatbiasgroup( "allies" );
    createthreatbiasgroup( "axis" );
    createthreatbiasgroup( "team3" );
    createthreatbiasgroup( "civilian" );
    _id_A510::_id_0807( "generic", "rappel_pushoff_initial_npc", _id_A5A4::_id_3098 );
    _id_A510::_id_0807( "generic", "ps_rappel_pushoff_initial_npc", _id_A5A4::_id_3098 );
    _id_A510::_id_0807( "generic", "feet_on_ground", _id_A5A4::_id_2A73 );
    _id_A510::_id_0807( "generic", "ps_rappel_clipout_npc", _id_A5A4::_id_2A73 );

    foreach ( var_1 in level._id_0323 )
        var_1 _meth_817B( "allies" );

    level._id_05FE = 0;
    level._id_054A = [];
    level._id_535B = 0;
    level._id_36A2 = 0;
    level._id_5CDE = 0;
    level._id_3C5D = [];
    level._id_8683 = [];

    if ( !isdefined( level._id_265B ) )
        level._id_265B = [];

    level._id_89C6 = 0;
    level._id_4242 = [];

    if ( !isdefined( level._id_8F83 ) )
        level._id_8F83 = [];

    level._id_8F83["regular"] = ::_id_8F81;
    level._id_8F83["elite"] = ::_id_8F7E;
    level._id_91E6 = [];
    level._id_91E6["axis"] = ::_id_8960;
    level._id_91E6["allies"] = ::_id_895F;
    level._id_91E6["team3"] = ::_id_8962;
    level._id_91E6["neutral"] = ::_id_8961;
    level._id_60BC = 0;
    level._id_44D0 = _func_0B4( 1, 4 );

    if ( !isdefined( level._id_2780 ) )
        level._id_2780 = 2048;

    if ( !isdefined( level._id_277F ) )
        level._id_277F = 80;

    level._id_6E4B = "J_Shoulder_RI";
    level._id_5BC7 = 1024;

    if ( !isdefined( level._id_5A3A ) )
        level._id_5A3A = 11;

    level._id_05E9 = 0;
    var_3 = _func_0DA();
    common_scripts\utility::_id_0D13( var_3, ::_id_57BA );
    level._id_08C4 = [];
    level._id_2E9E = [];
    var_4 = _func_0DB();

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        var_4[var_5] thread _id_8942();

    level._id_2E9E = undefined;
    thread _id_6FE9();
    common_scripts\utility::_id_0D13( var_3, ::_id_8965 );
    level._id_08C5 = _func_1D3( level._id_08C4 );

    for ( var_5 = 0; var_5 < level._id_08C5.size; var_5++ )
    {
        if ( !_func_120( _func_123( level._id_08C5[var_5] ), "rpg" ) )
            continue;

        precacheitem( "rpg_player" );
        break;
    }

    level._id_08C5 = undefined;
}

_id_09A8()
{

}

_id_1CE4( var_0 )
{
    if ( var_0.size <= 16 )
        return;

    var_1 = 0;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !var_0[var_3]._id_04A7 != "axis" )
            continue;

        var_1++;

        if ( !var_0[var_3] _id_46E5() )
            continue;

        var_2++;
    }
}

_id_46E5()
{
    if ( isdefined( self._id_796F ) )
        return 1;

    return isdefined( self._id_7970 );
}

_id_6FE9()
{
    foreach ( var_2, var_1 in level._id_265B )
    {
        level._id_265B[var_2] = [];
        level._id_265B[var_2]["spawners"] = [];
        level._id_265B[var_2]["ai"] = [];

        if ( !isdefined( level._id_382E[var_2] ) )
            common_scripts\utility::_id_383D( var_2 );
    }
}

_id_890A()
{
    self endon( "death" );

    for (;;)
    {
        if ( self.count > 0 )
            self waittill( "spawned" );

        waitframe;

        if ( !self.count )
            return;
    }
}

_id_08D4()
{
    level._id_265B[self._id_7987]["ai"][self._id_9A29] = self;
    var_0 = self._id_9A29;
    var_1 = self._id_7987;

    if ( isdefined( self._id_7988 ) )
        _id_A0D6();
    else
        self waittill( "death" );

    level._id_265B[var_1]["ai"][var_0] = undefined;
    _id_9AAD( var_1 );
}

_id_9CAD()
{
    var_0 = self._id_9A29;
    var_1 = self._id_7987;

    if ( !isdefined( level._id_265B ) || !isdefined( level._id_265B[self._id_7987] ) )
    {
        waitframe;

        if ( !isdefined( self ) )
            return;
    }

    level._id_265B[var_1]["vehicles"][var_0] = self;
    self waittill( "death" );
    level._id_265B[var_1]["vehicles"][var_0] = undefined;
    _id_9AAD( var_1 );
}

_id_89C0()
{
    level._id_265B[self._id_7987] = [];
    waitframe;

    if ( !isdefined( self ) || self.count == 0 )
        return;

    self._id_89C6 = level._id_89C6;
    level._id_89C6++;
    level._id_265B[self._id_7987]["spawners"][self._id_89C6] = self;
    var_0 = self._id_7987;
    var_1 = self._id_89C6;
    _id_890A();
    level._id_265B[var_0]["spawners"][var_1] = undefined;
    _id_9AAD( var_0 );
}

_id_9D46()
{
    level._id_265B[self._id_7987] = [];
    waitframe;

    if ( !isdefined( self ) )
        return;

    self._id_89C6 = level._id_89C6;
    level._id_89C6++;
    level._id_265B[self._id_7987]["vehicle_spawners"][self._id_89C6] = self;
    var_0 = self._id_7987;
    var_1 = self._id_89C6;
    _id_890A();
    level._id_265B[var_0]["vehicle_spawners"][var_1] = undefined;
    _id_9AAD( var_0 );
}

_id_9AAD( var_0 )
{
    level notify( "updating_deathflag_" + var_0 );
    level endon( "updating_deathflag_" + var_0 );
    waitframe;

    foreach ( var_3, var_2 in level._id_265B[var_0] )
    {
        if ( _func_1D3( var_2 ).size > 0 )
            return;
    }

    common_scripts\utility::_id_383F( var_0 );
}

_id_65BC( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !_func_0CF( var_1 ) )
            continue;

        var_1 thread _id_A5A4::_id_4BAC( 0.15 );
        var_1 _id_A5A4::_id_2A8D();
        var_1._id_A154 = 0;
    }
}

_id_4C45( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !_func_0CF( var_1 ) )
            continue;

        var_1 thread _id_A5A4::_id_4BAC( 0.15 );
        var_1 _id_A5A4::_id_30B0();
        var_1._id_A154 = 1;
    }
}

_id_2BE4( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger" );

        if ( !var_0.count )
            return;

        if ( self._id_04A4 != var_0._id_04A6 )
            return;

        if ( isdefined( var_0._id_981E ) )
            return;

        var_1 = var_0 _id_A5A4::_id_88C3();

        if ( _id_A5A4::_id_88F1( var_1 ) )
            var_0 notify( "spawn_failed" );

        if ( isdefined( self._id_050D ) && self._id_050D > 0 )
            wait(self._id_050D);
    }
}

_id_97F9( var_0 )
{
    var_1 = var_0._id_7116;
    var_2 = var_0._id_04A4;
    var_0 waittill( "trigger" );
    var_0 _id_A5A4::_id_0392();

    if ( isdefined( var_1 ) )
        waitframe;

    var_3 = getentarray( var_2, "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( var_5.code_classname == "script_vehicle" )
        {
            if ( isdefined( var_5._id_7A40 ) && var_5._id_7A40 == 1 || !isdefined( var_5._id_04A4 ) )
                thread _id_A5A8::_id_9D41( var_5 );
            else
                var_5 thread _id_A5A8::_id_8977();

            continue;
        }

        var_5 thread _id_97FB();

        if ( level._id_00E3 )
            wait 0.1;
    }

    if ( isdefined( level._id_893E ) )
        _id_97D4( var_2 );
}

_id_97D4( var_0 )
{
    var_1 = common_scripts\utility::_id_40FD( var_0, "targetname" );

    if ( getentarray( var_0, "target" ).size <= 1 )
        _id_A5A4::_id_286F( var_1 );

    var_2 = _id_3E35( var_1 );
    common_scripts\utility::_id_0D13( var_2, ::_id_97FB );
}

_id_3E35( var_0 )
{
    var_1 = [];
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4._id_7ACE ) )
            continue;

        if ( !isdefined( var_2[var_4._id_7ACE] ) )
            var_2[var_4._id_7ACE] = [];

        var_2[var_4._id_7ACE][var_2[var_4._id_7ACE].size] = var_4;
    }

    foreach ( var_7 in var_2 )
    {
        foreach ( var_4 in var_7 )
        {
            var_9 = _id_3E68( var_4, var_7.size );
            var_1[var_1.size] = var_9;
        }
    }

    return var_1;
}

_id_3E68( var_0, var_1 )
{
    if ( !isdefined( level._id_89C7 ) )
        level._id_89C7 = [];

    if ( !isdefined( level._id_89C7[var_0._id_7ACE] ) )
        level._id_89C7[var_0._id_7ACE] = _id_23CE( var_0._id_7ACE );

    var_2 = level._id_89C7[var_0._id_7ACE];
    var_3 = var_2._id_6E2F[var_2._id_6E3D];
    var_2._id_6E3D++;
    var_2._id_6E3D %= var_2._id_6E2F.size;
    var_3._id_02E2 = var_0._id_02E2;

    if ( isdefined( var_0.angles ) )
        var_3.angles = var_0.angles;
    else if ( isdefined( var_0._id_04A4 ) )
    {
        var_4 = _func_0C3( var_0._id_04A4, "targetname" );

        if ( isdefined( var_4 ) )
            var_3.angles = _func_115( var_4._id_02E2 - var_3._id_02E2 );
    }

    if ( isdefined( level._id_893D ) )
        var_3 [[ level._id_893D ]]( var_0 );

    if ( isdefined( var_0._id_04A4 ) )
        var_3._id_04A4 = var_0._id_04A4;

    var_3.count = 1;
    return var_3;
}

_id_23CE( var_0 )
{
    var_1 = _func_0DB();
    var_2 = spawnstruct();
    var_3 = [];

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5._id_7ACE ) )
            continue;

        if ( var_5._id_7ACE != var_0 )
            continue;

        var_3[var_3.size] = var_5;
    }

    var_2._id_6E3D = 0;
    var_2._id_6E2F = var_3;
    return var_2;
}

_id_97FB()
{
    self endon( "death" );
    _id_A5A4::_id_0392();

    if ( !isdefined( self ) )
        return undefined;

    if ( isdefined( self._id_79AD ) )
    {
        var_0 = _id_A5A4::_id_2F29( self, 1 );
        return undefined;
    }
    else if ( !_func_120( self.classname, "actor" ) )
        return undefined;

    var_1 = isdefined( self._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );

    if ( isdefined( self._id_79EB ) )
        var_0 = self _meth_8096( var_1 );
    else
        var_0 = self _meth_8095( var_1 );

    if ( !_id_A5A4::_id_88F1( var_0 ) )
    {
        if ( isdefined( self._id_797A ) )
        {
            if ( self._id_797A == "heat" )
                var_0 _id_A5A4::_id_30C9();

            if ( self._id_797A == "cqb" )
                var_0 _id_A5A4::_id_30B0();
        }

        var_0 _id_A51C::setup_nodes_intelligently_from_team();
    }

    return var_0;
}

_id_97FA( var_0 )
{
    var_1 = var_0._id_04A4;
    var_2 = 0;
    var_3 = getentarray( var_1, "targetname" );

    foreach ( var_5 in var_3 )
    {
        if ( !isdefined( var_5._id_04A4 ) )
            continue;

        var_6 = getent( var_5._id_04A4, "targetname" );

        if ( !isdefined( var_6 ) )
        {
            if ( !isdefined( var_5._id_7A26 ) )
                continue;

            var_6 = var_5 common_scripts\utility::_id_3DBC();

            if ( !isdefined( var_6 ) )
                continue;

            if ( !_func_1A2( var_6 ) )
                continue;
        }

        var_2 = 1;
        break;
    }

    var_0 waittill( "trigger" );
    var_0 _id_A5A4::_id_0392();
    var_3 = getentarray( var_1, "targetname" );

    foreach ( var_5 in var_3 )
        var_5 thread _id_97DA();
}

_id_97DA()
{
    var_0 = _id_97D9();
    var_1 = _id_97FB();

    if ( !isdefined( var_1 ) )
    {
        self delete();

        if ( isdefined( var_0 ) )
        {
            var_1 = var_0 _id_97FB();
            var_0 delete();

            if ( !isdefined( var_1 ) )
                return;
        }
        else
            return;
    }

    if ( !isdefined( var_0 ) )
        return;

    var_1 waittill( "death" );

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.count ) )
        var_0.count = 1;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        var_2 = var_0 thread _id_97FB();

        if ( !isdefined( var_2 ) )
        {
            var_0 delete();
            break;
        }

        var_2 thread _id_7302( var_0 );
        var_2 waittill( "death", var_3 );

        if ( !_id_6BF3( var_2, var_3 ) )
        {
            if ( !isdefined( var_0 ) )
                break;

            var_0.count++;
        }

        if ( !isdefined( var_2 ) )
            continue;

        if ( !isdefined( var_0 ) )
            break;

        if ( !isdefined( var_0.count ) )
            break;

        if ( var_0.count <= 0 )
            break;

        if ( !_id_A5A4::_id_7B20() )
            wait(_func_0B5( 1, 3 ));
    }

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_97D9()
{
    if ( isdefined( self._id_04A4 ) )
    {
        var_0 = getent( self._id_04A4, "targetname" );

        if ( isdefined( var_0 ) && _func_1A2( var_0 ) )
            return var_0;
    }

    if ( isdefined( self._id_7A26 ) )
    {
        var_0 = common_scripts\utility::_id_3DBC();

        if ( isdefined( var_0 ) && _func_1A2( var_0 ) )
            return var_0;
    }

    return undefined;
}

_id_38F1( var_0 )
{
    common_scripts\utility::_id_0D13( var_0, ::_id_38F0 );
    common_scripts\utility::_id_0D13( var_0, ::_id_38F3 );
}

_id_7302( var_0 )
{
    var_0 endon( "death" );

    if ( isdefined( self._id_79E5 ) )
    {
        if ( self._id_79E5 )
            return;
    }

    self waittill( "death" );

    if ( !isdefined( self ) )
        var_0.count++;
}

_id_2837( var_0 )
{
    for ( var_1 = 0; var_1 < 2; var_1++ )
    {
        switch ( var_1 )
        {
            case 0:
                var_2 = "axis";
                break;
            default:
                var_2 = "allies";
                break;
        }

        var_3 = getentarray( var_2, "team" );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( isdefined( var_3[var_4]._id_7ADA ) )
            {
                if ( var_3[var_4]._id_7ADA == var_0 )
                    var_3[var_4] thread _id_2819();
            }
        }
    }
}

_id_533E( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._id_04A6 ) && var_0._id_04A6 != "flood_spawner" )
        return;

    var_0 delete();
}

_id_7116( var_0 )
{
    var_0 endon( "death" );
    var_1 = var_0._id_7AB3;
    waitframe;

    if ( !isdefined( level._id_537C[var_1] ) )
        return;

    var_0 waittill( "trigger" );
    _id_24B6( var_1 );
}

_id_24B6( var_0 )
{
    if ( !isdefined( level._id_537C[var_0] ) )
        return;

    var_1 = level._id_537C[var_0];
    var_2 = _func_1D3( var_1 );

    if ( var_2.size <= 1 )
        return;

    var_3 = common_scripts\utility::_id_710E( var_2 );
    var_1[var_3] = undefined;

    foreach ( var_9, var_5 in var_1 )
    {
        foreach ( var_8, var_7 in var_5 )
        {
            if ( isdefined( var_7 ) )
                var_7 delete();
        }

        level._id_537C[var_0][var_9] = undefined;
    }
}

_id_537D( var_0 )
{
    var_1 = _func_0DB();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_7A1D ) && var_0 == var_1[var_2]._id_7A1D )
            var_1[var_2] delete();
    }
}

_id_5339( var_0 )
{
    var_1 = var_0._id_7A1D;
    var_0 waittill( "trigger" );
    waitframe;
    waitframe;
    _id_537D( var_1 );
    _id_533E( var_0 );
}

_id_3095( var_0 )
{
    var_1 = var_0._id_79B6;
    var_0 waittill( "trigger" );
    var_2 = _func_0DB();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3]._id_79B6 ) )
            continue;

        if ( var_1 != var_2[var_3]._id_79B6 )
            continue;

        if ( isdefined( var_2[var_3]._id_79DD ) )
            level notify( "stop_flanker_behavior" + var_2[var_3]._id_79DD );

        var_2[var_3] _id_A5A4::_id_7DF8( 0 );
        var_2[var_3] notify( "emptied spawner" );
    }

    var_0 notify( "deleted spawners" );
}

_id_533A( var_0 )
{
    var_1 = _func_0DB();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2]._id_7A1D ) )
            continue;

        if ( var_0 != var_1[var_2]._id_7A1D )
            continue;

        var_1[var_2] delete();
    }
}

_id_97F7( var_0 )
{

}

_id_8904( var_0, var_1 )
{
    if ( !isdefined( level._id_43E2 ) || !isdefined( level._id_43E2[var_1] ) )
    {
        level._id_43E3[var_1] = 0;
        level._id_43E2[var_1] = [];
    }

    var_2 = level._id_43E3[var_1];
    var_3 = level._id_43E2[var_1][var_2];

    if ( isdefined( var_3 ) )
        var_3 delete();

    var_4 = "weapon_fraggrenade";

    if ( isdefined( level._id_0318 ) && isdefined( level._id_0318._id_9C5F ) )
    {
        if ( common_scripts\utility::_id_2006() )
            var_4 = "weapon_frag_grenade_var";
        else
            var_4 = "weapon_flash_grenade_var";
    }

    var_3 = spawn( var_4, var_0 );
    level._id_43E2[var_1][var_2] = var_3;
    level._id_43E3[var_1] = ( var_2 + 1 ) % 16;
    return var_3;
}

_id_A0D6()
{
    self endon( "death" );
    self waittill( "pain_death" );
}

_id_2F42()
{
    var_0 = self._id_04A7;
    _id_A0D6();

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_613F ) )
        return;

    if ( level.tire_explosion )
    {
        var_1 = self._id_02E2;
        var_2 = self _meth_80AA();
        waitframe;

        for ( var_3 = 0; var_3 < 15; var_3++ )
            thread random_tire( var_1, var_2 );

        if ( isdefined( self ) )
        {
            animscripts\shared::_id_2F6C();
            wait 0.1;

            if ( isdefined( self ) && !_func_29C( self ) )
                self delete();
        }

        return;
    }

    self._id_01FE = 1;

    if ( self._id_01D0 <= 0 )
        return;

    level._id_60CB--;

    if ( level._id_60CB > 0 )
        return;

    level._id_60CB = 3 + _func_0B2( 2 );
    var_4 = 25;
    var_5 = 12;
    var_1 = self._id_02E2 + ( _func_0B2( var_4 ) - var_5, _func_0B2( var_4 ) - var_5, 2 ) + ( 0, 0, 42 );
    var_6 = ( 0, _func_0B2( 360 ), 90 );
    thread _id_8905( var_1, var_6, self._id_04A7 );
}

random_tire( var_0, var_1 )
{
    if ( level.cheattires.size == level.cheattires_max )
    {
        level.cheattires[0] delete();
        level.cheattires = _id_A5A4::_id_0CFA( level.cheattires, 0 );
    }

    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2.angles = ( 0, _func_0B2( 360 ), 0 );
    var_3 = _func_0B3( 1 );
    var_2._id_02E2 = var_0 * var_3 + var_1 * ( 1 - var_3 );
    var_2 _meth_80B3( level.random_tire_model );
    var_4 = common_scripts\utility::_id_712D( 15000 );
    var_4 = ( var_4[0], var_4[1], _func_0BE( var_4[2] ) );
    var_2 _meth_82BE( var_2._id_02E2, var_4 );
    level.cheattires[level.cheattires.size] = var_2;
    var_2 endon( "death" );
    wait(_func_0B5( 5.0, 10.0 ));

    if ( isdefined( var_2 ) )
    {
        level.cheattires = common_scripts\utility::_id_0CF6( level.cheattires, var_2 );
        var_2 delete();
    }
}

override_random_tire( var_0 )
{
    precachemodel( var_0 );
    level.random_tire_model = var_0;
}

_id_8905( var_0, var_1, var_2 )
{
    var_3 = _id_8904( var_0, var_2 );
    var_3 _meth_80B3( "grenade_bag" );
    var_3.angles = var_1;
    var_3 _meth_8056();
    wait 0.7;

    if ( !isdefined( var_3 ) )
        return;

    var_3 _meth_8055();
}

_id_2F2B()
{
    _id_A52D::_id_2E62();
}

_id_0138()
{

}

_id_8942()
{
    level._id_08C4[self.classname] = 1;

    if ( isdefined( self._id_799E ) )
    {
        switch ( self._id_799E )
        {
            case "easy":
                if ( level._id_3BFE > 1 )
                    _id_A5A4::_id_7DF8( 0 );

                break;
            case "hard":
                if ( level._id_3BFE < 2 )
                    _id_A5A4::_id_7DF8( 0 );

                break;
        }
    }

    if ( isdefined( self._id_79AD ) )
        thread _id_2F2B();

    if ( isdefined( self._id_792E ) )
    {
        var_0 = self._id_792E;

        if ( !isdefined( level._id_054A[var_0] ) )
            _id_0956( var_0 );

        thread _id_095A( level._id_054A[var_0] );
    }

    if ( isdefined( self._id_7992 ) )
    {
        var_1 = 0;

        if ( isdefined( level._id_0549 ) )
        {
            if ( isdefined( level._id_0549[self._id_7992] ) )
                var_1 = level._id_0549[self._id_7992].size;
        }

        level._id_0549[self._id_7992][var_1] = self;
    }

    if ( isdefined( self._id_7A0C ) )
    {
        if ( self._id_7A0C > level._id_05E9 )
            level._id_05E9 = self._id_7A0C;

        var_1 = 0;

        if ( isdefined( level._id_054B ) )
        {
            if ( isdefined( level._id_054B[self._id_7A0C] ) )
                var_1 = level._id_054B[self._id_7A0C].size;
        }

        level._id_054B[self._id_7A0C][var_1] = self;
    }

    if ( isdefined( self._id_7987 ) )
        thread _id_89C0();

    if ( isdefined( self._id_04A4 ) )
        _id_238C();

    if ( isdefined( self._id_7ACF ) )
        _id_07B0();

    if ( isdefined( self._id_7AB3 ) )
        _id_0789();

    if ( !isdefined( self._id_8900 ) )
        self._id_8900 = [];

    for (;;)
    {
        var_2 = undefined;
        self waittill( "spawned", var_2 );

        if ( !_func_1A1( var_2 ) )
            continue;

        if ( isdefined( level._id_89CB ) )
            self thread [[ level._id_89CB ]]( var_2 );

        if ( isdefined( self._id_7992 ) )
        {
            for ( var_3 = 0; var_3 < level._id_0549[self._id_7992].size; var_3++ )
            {
                if ( level._id_0549[self._id_7992][var_3] != self )
                    level._id_0549[self._id_7992][var_3] delete();
            }
        }

        var_2._id_88FE = self._id_8900;
        var_2._id_03D9 = self;

        if ( isdefined( self._id_04A6 ) )
        {
            var_2 thread _id_8965( self._id_04A6 );
            continue;
        }

        var_2 thread _id_8965();
    }
}

_id_8965( var_0 )
{
    level._id_08C4[self.classname] = 1;
    _id_8966( var_0 );
    self endon( "death" );

    if ( _id_84A0() )
        self delete();

    thread _id_76B6();
    self._id_3797 = 1;
    self notify( "finished spawning" );

    if ( self._id_04A7 == "allies" && !isdefined( self._id_7A7F ) )
        thread _id_3A98();
}

_id_84A0()
{
    if ( !isdefined( self._id_799E ) )
        return 0;

    var_0 = 0;

    switch ( self._id_799E )
    {
        case "easy":
            if ( level._id_3BFE > 1 )
                var_0 = 1;

            break;
        case "hard":
            if ( level._id_3BFE < 2 )
                var_0 = 1;

            break;
    }

    return var_0;
}

_id_76B6()
{
    self endon( "death" );

    if ( !isdefined( self._id_88FE ) )
    {
        self._id_03D9 = undefined;
        return;
    }

    for ( var_0 = 0; var_0 < self._id_88FE.size; var_0++ )
    {
        var_1 = self._id_88FE[var_0];

        if ( isdefined( var_1["param5"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"], var_1["param5"] );
            continue;
        }

        if ( isdefined( var_1["param4"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"] );
            continue;
        }

        if ( isdefined( var_1["param3"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"] );
            continue;
        }

        if ( isdefined( var_1["param2"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"] );
            continue;
        }

        if ( isdefined( var_1["param1"] ) )
        {
            thread [[ var_1["function"] ]]( var_1["param1"] );
            continue;
        }

        thread [[ var_1["function"] ]]();
    }

    var_2 = common_scripts\utility::_id_9294( isdefined( level._id_9D42 ) && level._id_9D42 && self.code_classname == "script_vehicle", self._id_7AEF, self._id_04A7 );

    if ( isdefined( var_2 ) )
    {
        for ( var_0 = 0; var_0 < level._id_88FE[var_2].size; var_0++ )
        {
            var_1 = level._id_88FE[var_2][var_0];

            if ( isdefined( var_1["param5"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"], var_1["param5"] );
                continue;
            }

            if ( isdefined( var_1["param4"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"], var_1["param4"] );
                continue;
            }

            if ( isdefined( var_1["param3"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"], var_1["param3"] );
                continue;
            }

            if ( isdefined( var_1["param2"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"], var_1["param2"] );
                continue;
            }

            if ( isdefined( var_1["param1"] ) )
            {
                thread [[ var_1["function"] ]]( var_1["param1"] );
                continue;
            }

            thread [[ var_1["function"] ]]();
        }
    }

    self._id_88FE = undefined;
    self._id_03D9 = undefined;
}

_id_8A49()
{
    if ( !_id_A5A4::_id_5083() )
        return;

    _id_A5A4::_id_0749( ::_id_8A47 );
    thread _id_5FE4();
}

_id_5FE4()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( !isdefined( self ) )
        return;

    if ( !self _meth_813F() )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( !_func_1AD( var_0 ) )
        return;

    if ( !isdefined( var_2 ) )
    {
        var_0._id_5FE3 = undefined;
        return;
    }

    if ( !isdefined( var_0._id_5FE3 ) )
        var_0._id_5FE3 = 1;
    else
        var_0._id_5FE3++;

    if ( _id_A5A4::_id_5087() && var_0._id_5FE3 >= 4 )
        var_0 notify( "sur_ch_quadkill" );

    waitframe;
    var_0._id_5FE3 = undefined;
}

_id_8A47( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
    {
        self._id_551A = var_1;
        self._id_551B = var_4;
    }
}

check_explosion_man_achievement( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( !_func_1AD( var_0 ) && ( !isdefined( var_1 ) || var_1 != "seaknight_mark19" ) )
        return;

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "fraggrenade":
            case "claymore":
            case "rpg":
            case "javelin":
            case "seaknight_mark19":
            case "c4":
                var_3 = 1;
        }
    }

    if ( isdefined( var_2 ) && ( var_2 == "MOD_EXPLOSIVE" || var_2 == "MOD_GRENADE_SPLASH" ) )
        var_3 = 1;

    if ( var_3 )
    {
        if ( !isdefined( level.h1_achievement_explosionman ) )
            level.h1_achievement_explosionman = 1;
        else
        {
            level.h1_achievement_explosionman++;

            if ( level.h1_achievement_explosionman == 20 )
                _id_A5A4::_id_41DD( "EXPLOSION_MAN" );
        }
    }
}

_id_2661()
{
    self waittill( "death", var_0, var_1, var_2 );
    level notify( "ai_killed", self );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_0 ) )
    {
        if ( self._id_04A7 == "axis" || self._id_04A7 == "team3" )
        {
            var_3 = undefined;

            if ( isdefined( var_0.attacker ) )
            {
                if ( isdefined( var_0._id_519D ) && var_0._id_519D )
                    var_3 = "sentry";

                if ( isdefined( var_0._id_0117 ) )
                    var_3 = "destructible";

                var_0 = var_0.attacker;
            }
            else if ( isdefined( var_0._id_02E5 ) )
            {
                if ( _func_0CF( var_0 ) && _func_1AD( var_0._id_02E5 ) )
                    var_3 = "friendly";

                var_0 = var_0._id_02E5;
            }
            else if ( isdefined( var_0._id_25A9 ) )
            {
                if ( isdefined( var_0._id_0117 ) )
                    var_3 = "destructible";

                var_0 = var_0._id_25A9;
            }

            check_explosion_man_achievement( var_0, var_2, var_1 );
            var_4 = 0;

            if ( _func_1AD( var_0 ) )
                var_4 = 1;

            if ( isdefined( level._id_6E02 ) && level._id_6E02 )
                var_4 = 1;

            if ( isdefined( var_1 ) && var_1 == "MOD_CRUSH" )
            {
                if ( isdefined( level._id_4A91 ) || isdefined( level._id_0318._id_2E19 ) )
                    level._id_0318 _id_A5A0::_id_41CF( 1 );
            }

            if ( var_4 )
                var_0 _id_A56F::_id_72DF( self, var_1, var_2, var_3 );
        }
    }

    for ( var_5 = 0; var_5 < self._id_265F.size; var_5++ )
    {
        var_6 = self._id_265F[var_5];

        switch ( var_6["params"] )
        {
            case 0:
                [[ var_6["func"] ]]( var_0 );
                continue;
            case 1:
                [[ var_6["func"] ]]( var_0, var_6["param1"] );
                continue;
            case 2:
                [[ var_6["func"] ]]( var_0, var_6["param1"], var_6["param2"] );
                continue;
            case 3:
                [[ var_6["func"] ]]( var_0, var_6["param1"], var_6["param2"], var_6["param3"] );
                continue;
        }
    }
}

_id_08D3()
{
    self._id_257E = [];

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
        {
            var_7 = var_1 _meth_830E();

            if ( isdefined( var_7 ) && _id_A5A4::_id_5185( var_7 ) && isdefined( var_4 ) && ( var_4 == "MOD_PISTOL_BULLET" || var_4 == "MOD_RIFLE_BULLET" ) )
                var_1 thread _id_A56F::_id_72E7();
        }

        foreach ( var_9 in self._id_257E )
            thread [[ var_9 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !_func_1A1( self ) || self._id_0112 )
            break;
    }
}

_id_57BA()
{
    if ( isdefined( self._id_7987 ) )
        level._id_265B[self._id_7987] = 1;

    if ( isdefined( self._id_04A4 ) )
        _id_238C();
}

_id_238C()
{
    var_0 = _id_3DEF();

    if ( isdefined( var_0 ) )
    {
        var_1 = var_0["destination"];
        var_2 = var_0["get_target_func"];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
            _id_238B( var_1[var_3], var_2 );
    }
}

_id_895F()
{
    self._id_04E7 = 0;
}

_id_8960()
{
    if ( isdefined( level._id_A3A1 ) && level._id_A3A1 && isdefined( level._id_A3A0 ) )
        self thread [[ level._id_A3A0 ]]();

    if ( self._id_04D9 == "human" && !isdefined( level._id_2B13 ) )
        thread _id_2F42();

    _id_A5A4::_id_0749( _id_A537::_id_111E );

    if ( isdefined( self._id_797B ) )
        self.combatmode = self._id_797B;
}

_id_8962()
{
    _id_8960();
}

_id_8961()
{

}

_id_8F7E()
{
    self endon( "death" );
    self._id_305E = 1;
    self._id_2D65 = 0.5;

    if ( !isdefined( self._id_792C ) )
        self._id_1300 = 2;

    self._id_08A8 = 1;
    self._id_0281 = 100;
    _id_A5A4::_id_0749( animscripts\pain::_id_07F0 );
    _id_A5A4::_id_0749( ::_id_664B );
    self._id_254A = ::_id_89C3;

    if ( isdefined( self._id_0513 ) && _func_1B8( self._id_0513 ) != "rocketlauncher" )
        self _meth_80B4();
}

_id_89C3()
{
    var_0 = undefined;

    if ( isdefined( self._id_0513 ) )
        var_0 = self._id_0513;
    else
        return;

    if ( isdefined( var_0 ) && _func_1B8( var_0 ) != "rocketlauncher" )
        self _meth_80B4();
}

_id_8F81()
{
    if ( !isdefined( self._id_792C ) )
        self._id_1300 = 1.05;
}

_id_664B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );

    if ( self._id_01E6 <= 0 )
        return;

    if ( var_0 >= self._id_0281 )
    {
        var_7 = self._id_0281;
        self._id_0281 = var_7 * 3;
        wait 5;
        self._id_0281 = var_7;
    }
}

_id_18A8( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) || self._id_01E6 <= 0 )
        return;

    if ( isdefined( self._id_58D7 ) && self._id_58D7 )
        return;

    if ( !_func_120( var_4, "BULLET" ) )
        return;

    var_7 = self._id_18A8;

    if ( var_0 < self._id_18A8 )
        var_7 = var_0;

    self._id_01E6 += var_7;
}

_id_8967()
{
    _id_A537::_id_01D1();
}

_id_08F2()
{
    if ( !_func_1A1( self ) )
        return;

    if ( self._id_01E6 <= 1 )
        return;

    self _meth_80B4();
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self _meth_80B5();
}

_id_8968()
{
    if ( isdefined( self._id_79AA ) )
        self._id_2D3B = 1;

    if ( isdefined( self._id_7987 ) )
        thread _id_08D4();

    if ( isdefined( self._id_7941 ) )
        self.attackeraccuracy = self._id_7941;

    if ( isdefined( self._id_7ADE ) )
        thread _id_8C18();

    if ( isdefined( self._id_798A ) )
        thread _id_2671();

    if ( isdefined( self._id_7A83 ) )
        _id_A5A4::_id_2ADA();

    if ( isdefined( self._id_7A7A ) )
        self._id_85B9 = 1;

    if ( isdefined( self._id_7A21 ) )
        thread _id_08F2();

    if ( isdefined( self._id_7982 ) )
    {
        var_0 = self._id_7982;

        if ( var_0 == 1 )
            var_0 = 8;

        _id_A5A4::_id_30B4( var_0 );
    }

    if ( isdefined( self._id_79C4 ) )
        self._id_0270 = self._id_79C4;
    else
        self._id_0270 = _func_2E5();

    if ( isdefined( self._id_79E6 ) )
        _id_A5A4::_id_7E38( self._id_79E6 );

    if ( isdefined( self._id_2D33 ) )
        self._id_0135 = 0;

    if ( isdefined( self._id_79D1 ) )
        self._id_017D = self._id_79D1 == 1;
    else
        self._id_017D = self._id_04A7 == "allies";

    self._id_0348 = self._id_04A7 == "allies" && self._id_017D;

    if ( isdefined( self._id_0398 ) && self._id_0398 == "mgpair" )
        thread _id_A557::_id_23CC();

    if ( isdefined( self._id_7A03 ) && !( isdefined( self._id_7A40 ) && self._id_7A40 == 1 || isdefined( self._id_7AE1 ) ) )
        thread _id_7E4F();

    if ( isdefined( self._id_7AF3 ) )
        self _meth_817B( self._id_7AF3 );
    else if ( self._id_04A7 == "neutral" )
        self _meth_817B( "civilian" );
    else
        self _meth_817B( self._id_04A7 );

    if ( isdefined( self._id_795C ) )
        _id_A5A4::_id_7DDF( self._id_795C );

    if ( isdefined( self._id_792C ) )
        self._id_1300 = self._id_792C;

    if ( isdefined( self._id_7A15 ) )
        self._id_01FF = 1;

    if ( isdefined( self._id_7A13 ) )
        self._id_0201 = 1;

    if ( isdefined( self._id_7A14 ) )
    {
        self._id_01FB = 1;
        self _meth_816A();
    }

    if ( isdefined( self._id_7AC4 ) )
        self._id_0273 = self._id_7AC4;

    if ( isdefined( self._id_79C9 ) )
    {
        if ( self._id_79C9 == "player" )
        {
            self._id_0179 = level._id_0318;
            level._id_0318._id_04A6 = "player";
        }
    }

    if ( isdefined( self._id_79CA ) )
        self._id_02F6 = self._id_79CA;

    if ( isdefined( self._id_7A31 ) )
        self._id_02F7 = self._id_7A31;

    if ( isdefined( self._id_7A28 ) )
        self.a._id_2B18 = 1;

    if ( isdefined( self._id_799D ) )
        self._id_011F = 1;

    if ( isdefined( self._id_79DE ) )
    {
        self._id_01D6 = "flash_grenade";
        self._id_01D0 = self._id_79DE;
    }

    if ( isdefined( self._id_7A95 ) )
        self._id_02E6 = 1;

    if ( isdefined( self._id_7ADB ) )
        self._id_01E6 = self._id_7ADB;

    if ( isdefined( self._id_7A7D ) )
        self._id_613F = self._id_7A7D;
}

_id_8966( var_0 )
{
    thread _id_08D3();
    thread _id_9193();
    thread _id_263B();
    thread _id_8A49();

    if ( !isdefined( level._id_08DD ) )
        self _meth_8029();

    self._id_89C6 = undefined;

    if ( !isdefined( self._id_9A29 ) )
        _id_A5A4::_id_7DB5();

    if ( !isdefined( self._id_265F ) )
        self._id_265F = [];

    thread _id_2661();
    level thread _id_A536::_id_3A59( self );
    self._id_050F = 16;
    _id_4D37();
    _id_8967();
    _id_8968();
    [[ level._id_91E6[self._id_04A7] ]]();
    thread [[ level._id_8F83[self._id_8F7D] ]]();
    thread _id_A524::_id_5E3F();
    _id_7E4A();

    if ( isdefined( self._id_7AA5 ) )
    {
        self _meth_81AB( level._id_0318 );
        return;
    }

    if ( isdefined( self._id_7AE1 ) )
    {
        if ( isdefined( self._id_7AE3 ) )
        {
            var_1 = level._id_8DB6[self._id_7AE3];
            self thread [[ var_1 ]]();
        }
        else
            self thread [[ level._id_4224["_spawner_stealth_default"] ]]();
    }

    if ( isdefined( self._id_7A11 ) )
    {
        self thread [[ level._id_4224["_idle_call_idle_func"] ]]();
        return;
    }

    if ( isdefined( self._id_7A12 ) && !isdefined( self._id_7A40 ) )
        self thread [[ level._id_4224["_idle_call_idle_func"] ]]();

    if ( isdefined( self._id_7A9C ) && !isdefined( self._id_7A40 ) )
    {
        thread _id_A55F::_id_66FC();
        return;
    }

    if ( isdefined( self._id_7AB5 ) && self._id_7AB5 == 1 )
        _id_A5A4::_id_30EB();

    if ( isdefined( self._id_7991 ) )
    {
        if ( !isdefined( self._id_7AB2 ) )
            self._id_01C4 = 800;

        self _meth_81AB( level._id_0318 );
        level thread _id_27DC( self );
        return;
    }

    if ( isdefined( self._id_9BF5 ) )
        return;

    if ( isdefined( self._id_7A40 ) && self._id_7A40 == 1 )
    {
        _id_7E49();
        self _meth_81AA( self._id_02E2 );
        return;
    }

    if ( !isdefined( self._id_7AE1 ) )
    {

    }

    _id_7E49();

    if ( isdefined( self._id_04A4 ) )
        thread _id_4241();
}

_id_4D37()
{
    _id_A5A4::_id_7E0B();

    if ( isdefined( self._id_7A07 ) )
        self._id_01D0 = self._id_7A07;
    else
        self._id_01D0 = 3;

    if ( isdefined( self._id_0340 ) )
        self._id_02B9 = animscripts\combat_utility::_id_51AB();

    if ( !_id_A5A4::_id_5083() )
        self._id_6097 = 1;
}

_id_7B48()
{
    if ( self._id_04A7 == "neutral" )
        self _meth_817B( "civilian" );
    else
        self _meth_817B( self._id_04A7 );

    _id_4D37();
    self._id_1300 = 1;
    _id_A537::_id_01D1();
    _id_A5A4::_id_1EB8();
    self._id_020C = 96;
    self._id_2AF3 = undefined;
    self._id_01FF = 0;
    self._id_04B1 = 0;
    self._id_02E6 = 0;
    self._id_02E7 = 20;
    self._id_0200 = 0;
    self._id_034C = 1;
    self._id_039C = 1;
    self.allowdeath = 0;
    self.anglelerprate = 540;
    self.badplaceawareness = 0.75;
    self._id_0130 = 0;
    self._id_0134 = 1;
    self._id_0135 = 1;
    self._id_01C4 = level._id_2780;
    self._id_01C2 = level._id_277F;
    self._id_0201 = 0;
    self _meth_81A7( 0 );

    if ( isdefined( self._id_58D7 ) && self._id_58D7 )
        _id_A5A4::_id_8EA4();

    _id_A5A4::_id_2ACC();
    self._id_0273 = 67108864;
    self._id_79EA = 0;
    self._id_050F = 16;
    _id_A5A4::_id_9A4B();
    self._id_034C = 1;
    self._id_039C = 1;
    animscripts\init::_id_7DBE();
    self._id_017D = self._id_04A7 == "allies";
}

_id_27DC( var_0 )
{
    var_0 endon( "death" );

    while ( _func_1A1( var_0 ) )
    {
        if ( var_0._id_01C4 > 200 )
            var_0._id_01C4 -= 200;

        wait 6;
    }
}

_id_3849( var_0 )
{
    self endon( "death" );

    if ( !self._id_3864 )
    {
        var_0._id_9BF5 = 1;
        self._id_3864 = 1;
        var_0 waittill( "death" );
        self._id_3864 = 0;
        self notify( "get new user" );
    }
}

_id_7E4F()
{
    self endon( "death" );
    waitframe;

    if ( isdefined( self._id_04A7 ) && self._id_04A7 == "allies" )
        self._id_017D = 0;

    var_0 = level._id_4255[self._id_7A03];

    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_0._id_04A4 ) )
    {
        var_1 = _func_0C3( var_0._id_04A4, "targetname" );
        var_2 = getent( var_0._id_04A4, "targetname" );
        var_3 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );
        var_4 = undefined;

        if ( isdefined( var_1 ) )
        {
            var_4 = var_1;
            self _meth_81A9( var_4 );
        }
        else if ( isdefined( var_2 ) )
        {
            var_4 = var_2;
            self _meth_81AA( var_4._id_02E2 );
        }
        else if ( isdefined( var_3 ) )
        {
            var_4 = var_3;
            self _meth_81AA( var_4._id_02E2 );
        }

        if ( isdefined( var_4._id_0351 ) && var_4._id_0351 != 0 )
            self._id_01C4 = var_4._id_0351;

        if ( isdefined( var_4._id_01C2 ) && var_4._id_01C2 != 0 )
            self._id_01C2 = var_4._id_01C2;
    }

    if ( isdefined( self._id_04A4 ) )
        self _meth_81AC( var_0 );
    else
        self _meth_81AD( var_0 );
}

_id_3E8A( var_0 )
{
    return getentarray( var_0, "targetname" );
}

_id_3E8C( var_0 )
{
    return _func_0C4( var_0, "targetname" );
}

get_target_vehicle_nodes( var_0 )
{
    return _func_1ED( var_0, "targetname" );
}

_id_3E8E( var_0 )
{
    return common_scripts\utility::_id_40FD( var_0, "targetname" );
}

_id_6123( var_0 )
{
    return isdefined( var_0._id_0351 ) && var_0._id_0351 != 0;
}

_id_4248( var_0, var_1 )
{
    _id_4241( var_0, "origin", var_1 );
}

_id_4249( var_0, var_1 )
{
    _id_4241( var_0, "struct", var_1 );
}

_id_4241( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self._id_9BF5 ) )
        return;

    var_5 = _id_3DEF( var_0, var_1 );

    if ( !isdefined( var_5 ) )
    {
        self notify( "reached_path_end" );
        return;
    }

    _id_4246( var_5["destination"], var_5["get_target_func"], var_5["set_goal_func_quits"], var_2, var_3, var_4 );
}

_id_3DB5( var_0 )
{
    if ( var_0.size == 1 )
        return var_0[0];

    var_1 = var_0[0]._id_04A6;

    if ( !isdefined( level._id_4242[var_1] ) )
        level._id_4242[var_1] = var_0;

    var_0 = level._id_4242[var_1];
    var_2 = var_0[0];
    var_3 = [];

    for ( var_4 = 0; var_4 < var_0.size - 1; var_4++ )
        var_3[var_4] = var_0[var_4 + 1];

    var_3[var_0.size - 1] = var_0[0];
    level._id_4242[var_1] = var_3;
    return var_2;
}

_id_4246( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "stop_going_to_node" );
    self endon( "stop_going_to_node" );
    self endon( "death" );

    for (;;)
    {
        var_0 = _id_3DB5( var_0 );
        var_6 = var_4;

        if ( isdefined( var_0._id_7AB7 ) )
        {
            if ( var_0._id_7AB7 > 1 )
                var_6 = var_0._id_7AB7;

            var_0._id_7AB7 = 0;
        }

        if ( _id_6123( var_0 ) )
            self._id_01C4 = var_0._id_0351;
        else
            self._id_01C4 = level._id_2780;

        if ( isdefined( var_0._id_01E8 ) )
            self._id_01C2 = var_0._id_01E8;
        else
            self._id_01C2 = level._id_277F;

        [[ var_2 ]]( var_0 );

        if ( _id_A5A4::_id_32DC( "_stealth_override_goalpos" ) )
        {
            for (;;)
            {
                self waittill( "goal" );

                if ( !_id_A5A4::_id_32D8( "_stealth_override_goalpos" ) )
                    break;

                _id_A5A4::_id_32E4( "_stealth_override_goalpos" );
            }
        }
        else
            self waittill( "goal" );

        var_0 notify( "trigger", self );

        if ( isdefined( var_3 ) )
            [[ var_3 ]]( var_0 );

        if ( isdefined( var_0._id_79D8 ) )
            common_scripts\utility::_id_383F( var_0._id_79D8 );

        if ( isdefined( var_0._id_79BC ) )
            _id_A5A4::_id_32DE( var_0._id_79BC );

        if ( isdefined( var_0._id_79D4 ) )
            common_scripts\utility::_id_3831( var_0._id_79D4 );

        if ( isdefined( var_0._id_0398 ) )
            self notify( var_0._id_0398 );

        if ( _id_91DA( var_0 ) )
            return 1;

        var_0 _id_A5A4::_id_0392();

        if ( isdefined( var_0._id_79DA ) )
            common_scripts\utility::_id_384A( var_0._id_79DA );

        var_0 _id_A5A4::_id_7B20();

        if ( isdefined( var_0._id_798F ) )
            wait(var_0._id_798F);

        while ( isdefined( var_0._id_7AB7 ) )
        {
            var_0._id_7AB7 = 0;

            if ( _id_4247( var_0, var_1, var_6 ) )
            {
                var_0._id_7AB7 = 1;
                var_0 notify( "script_requires_player" );
                break;
            }

            wait 0.1;
        }

        if ( isdefined( var_5 ) )
            [[ var_5 ]]( var_0 );

        if ( !isdefined( var_0._id_04A4 ) )
            break;

        var_7 = [[ var_1 ]]( var_0._id_04A4 );

        if ( !var_7.size )
            break;

        var_0 = var_7;
    }

    self notify( "reached_path_end" );

    if ( isdefined( self._id_79E9 ) )
        return;

    self._id_01C4 = level._id_2780;
}

_id_4247( var_0, var_1, var_2 )
{
    foreach ( var_4 in level._id_0323 )
    {
        if ( _func_0F0( var_4._id_02E2, var_0._id_02E2 ) < _func_0F0( self._id_02E2, var_0._id_02E2 ) )
            return 1;
    }

    var_6 = anglestoforward( self.angles );

    if ( isdefined( var_0._id_04A4 ) )
    {
        var_7 = [[ var_1 ]]( var_0._id_04A4 );

        if ( var_7.size == 1 )
            var_6 = _func_114( var_7[0]._id_02E2 - var_0._id_02E2 );
        else if ( isdefined( var_0.angles ) )
            var_6 = anglestoforward( var_0.angles );
    }
    else if ( isdefined( var_0.angles ) )
        var_6 = anglestoforward( var_0.angles );

    var_8 = [];

    foreach ( var_4 in level._id_0323 )
        var_8[var_8.size] = _func_114( var_4._id_02E2 - self._id_02E2 );

    foreach ( var_12 in var_8 )
    {
        if ( _func_0F6( var_6, var_12 ) > 0 )
            return 1;
    }

    var_14 = var_2 * var_2;

    foreach ( var_4 in level._id_0323 )
    {
        if ( _func_0F0( var_4._id_02E2, self._id_02E2 ) < var_14 )
            return 1;
    }

    return 0;
}

_id_4243( var_0 )
{
    if ( var_0.classname == "info_volume" )
    {
        self _meth_81AD( var_0 );
        self notify( "go_to_node_new_goal" );
        return;
    }

    _id_4245( var_0 );
}

_id_4245( var_0 )
{
    _id_A5A4::_id_7E47( var_0 );
    self notify( "go_to_node_new_goal" );
}

_id_4244( var_0 )
{
    _id_A5A4::_id_7E4B( var_0 );
    self notify( "go_to_node_new_goal" );
}

_id_91DA( var_0 )
{
    if ( !isdefined( var_0._id_04A4 ) )
        return 0;

    var_1 = getentarray( var_0._id_04A4, "targetname" );

    if ( !var_1.size )
        return 0;

    var_2 = var_1[0];

    if ( var_2.classname != "misc_turret" )
        return 0;

    thread _id_9BD0( var_2 );
    return 1;
}

_id_733B( var_0 )
{
    waitframe;

    if ( isdefined( var_0 ) )
        var_0._id_238D = undefined;
}

_id_238B( var_0, var_1 )
{
    var_2 = 0;
    var_3 = [];
    var_4 = 0;

    for (;;)
    {
        if ( !isdefined( var_0._id_238D ) )
        {
            var_0._id_238D = 1;
            level thread _id_733B( var_0 );

            if ( isdefined( var_0._id_79D8 ) )
            {
                if ( !isdefined( level._id_382E[var_0._id_79D8] ) )
                    common_scripts\utility::_id_383D( var_0._id_79D8 );
            }

            if ( isdefined( var_0._id_79DA ) )
            {
                if ( !isdefined( level._id_382E[var_0._id_79DA] ) )
                    common_scripts\utility::_id_383D( var_0._id_79DA );
            }

            if ( isdefined( var_0._id_79D4 ) )
            {
                if ( !isdefined( level._id_382E[var_0._id_79D4] ) )
                    common_scripts\utility::_id_383D( var_0._id_79D4 );
            }

            if ( isdefined( var_0._id_04A4 ) )
            {
                var_5 = [[ var_1 ]]( var_0._id_04A4 );
                var_3 = common_scripts\utility::_id_07A5( var_3, var_5 );
            }
        }

        var_4++;

        if ( var_4 >= var_3.size )
            break;

        var_0 = var_3[var_4];
    }
}

_id_3DEF( var_0, var_1 )
{
    var_2["entity"] = ::_id_3E8A;
    var_2["origin"] = ::_id_3E8A;
    var_2["node"] = ::_id_3E8C;
    var_2["struct"] = ::_id_3E8E;
    var_3["entity"] = ::_id_4243;
    var_3["origin"] = ::_id_4243;
    var_3["struct"] = ::_id_4245;
    var_3["node"] = ::_id_4244;

    if ( !isdefined( var_1 ) )
        var_1 = "node";

    var_4 = [];

    if ( isdefined( var_0 ) )
        var_4["destination"][0] = var_0;
    else
    {
        var_0 = getentarray( self._id_04A4, "targetname" );

        if ( var_0.size > 0 )
            var_1 = "entity";

        if ( var_1 == "node" )
        {
            var_0 = _func_0C4( self._id_04A4, "targetname" );

            if ( !var_0.size )
            {
                var_0 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );

                if ( !var_0.size )
                    return;

                var_1 = "struct";
            }
        }

        var_4["destination"] = var_0;
    }

    var_4["get_target_func"] = var_2[var_1];
    var_4["set_goal_func_quits"] = var_3[var_1];
    return var_4;
}

_id_7E4A()
{
    if ( isdefined( self._id_7A01 ) )
        self._id_01C2 = self._id_7A01;
    else
        self._id_01C2 = level._id_277F;
}

_id_7E49( var_0 )
{
    if ( isdefined( self._id_7AB2 ) )
    {
        self._id_01C4 = self._id_7AB2;
        return;
    }

    if ( isdefined( self._id_79E9 ) )
    {
        if ( isdefined( var_0 ) && isdefined( var_0._id_0351 ) )
        {
            self._id_01C4 = var_0._id_0351;
            return;
        }
    }

    if ( !isdefined( self _meth_81AE() ) )
    {
        if ( self._id_04D9 == "civilian" )
            self._id_01C4 = 128;
        else
            self._id_01C4 = level._id_2780;
    }
}

_id_1170( var_0 )
{
    for (;;)
    {
        var_1 = self _meth_80ED();

        if ( !_func_1A1( var_1 ) )
        {
            wait 1.5;
            continue;
        }

        if ( !isdefined( var_1._id_0142 ) )
        {
            self _meth_8108( common_scripts\utility::_id_710E( var_0 ) );
            self notify( "startfiring" );
            self _meth_80E4();
        }

        wait(2 + _func_0B3( 1 ));
    }
}

_id_597D( var_0 )
{
    for (;;)
    {
        self _meth_8108( common_scripts\utility::_id_710E( var_0 ) );
        self notify( "startfiring" );
        self _meth_80E4();
        wait(2 + _func_0B3( 1 ));
    }
}

_id_9BD0( var_0 )
{
    if ( self _meth_813F() && self._id_01E6 == 150 )
    {
        self._id_01E6 = 100;
        self.a._id_2B18 = 1;
    }

    self _meth_818E( var_0 );

    if ( isdefined( var_0._id_04A4 ) && var_0._id_04A4 != var_0._id_04A6 )
    {
        var_1 = getentarray( var_0._id_04A4, "targetname" );
        var_2 = [];

        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( var_1[var_3].classname == "script_origin" )
                var_2[var_2.size] = var_1[var_3];
        }

        if ( isdefined( var_0._id_7953 ) )
            var_0 thread _id_1170( var_2 );
        else if ( isdefined( var_0._id_7A2A ) )
        {
            var_0 _meth_8067( "manual_ai" );
            var_0 thread _id_597D( var_2 );
        }
        else if ( var_2.size > 0 )
        {
            if ( var_2.size == 1 )
            {
                var_0._id_5974 = var_2[0];
                var_0 _meth_8108( var_2[0] );
                thread _id_A558::_id_5975( var_0 );
            }
            else
                var_0 thread _id_A558::_id_5BC9( var_2 );
        }
    }

    thread _id_A558::_id_5BC4( var_0 );
    var_0 notify( "startfiring" );
}

_id_3661( var_0, var_1 )
{
    self endon( "death" );
    level._id_24E3[var_0] += self.count;
    var_2 = 1;

    while ( self.count > 0 )
    {
        self waittill( "spawned", var_3 );

        if ( var_2 )
        {
            if ( getdvar( "fallback", "0" ) == "1" )
            {

            }

            level notify( "fallback_firstspawn" + var_0 );
            var_2 = 0;
        }

        wait 0.05;

        if ( _id_A5A4::_id_88F1( var_3 ) )
        {
            level notify( "fallbacker_died" + var_0 );
            level._id_24E3[var_0]--;
            continue;
        }

        var_3 thread _id_365A( var_0, var_1, "is spawner" );
    }
}

_id_365B( var_0, var_1 )
{
    var_0 waittill( "death" );
    level._id_24E3[var_1]--;
    level notify( "fallbacker_died" + var_1 );
}

_id_365A( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_3658 ) || !isdefined( self._id_3658[var_0] ) )
        self._id_3658[var_0] = 1;
    else
        return;

    self._id_79C6 = var_0;

    if ( !isdefined( var_2 ) )
        level._id_24E3[var_0]++;

    if ( isdefined( var_1 ) && level._id_365F[var_0] )
        thread _id_3659( var_0, var_1 );

    level thread _id_365B( self, var_0 );
}

_id_365D( var_0, var_1 )
{
    var_0 waittill( "death" );
    level notify( "fallback_reached_goal" + var_1 );
}

_id_365E()
{
    self waittill( "goal" );
    self._id_0201 = 0;
    self notify( "fallback_notify" );
    self notify( "stop_coverprint" );
}

_id_3659( var_0, var_1 )
{
    self notify( "stop_going_to_node" );
    self _meth_818F();
    self._id_0201 = 1;
    self _meth_81A9( var_1 );

    if ( _id_6123( var_1 ) )
        self._id_01C4 = var_1._id_0351;

    self endon( "death" );
    level thread _id_365D( self, var_0 );
    thread _id_365E();

    if ( getdvar( "fallback", "0" ) == "1" )
        thread _id_22BD( var_1._id_02E2 );

    self waittill( "fallback_notify" );
    level notify( "fallback_reached_goal" + var_0 );
}

_id_22BD( var_0 )
{
    self endon( "fallback_notify" );
    self endon( "stop_coverprint" );

    for (;;)
        wait 0.05;
}

_id_60AD( var_0, var_1 )
{
    var_2 = undefined;

    foreach ( var_4 in _func_0C5() )
    {
        if ( isdefined( var_4._id_79C6 ) && var_4._id_79C6 == var_0 )
            var_2 = common_scripts\utility::_id_07A5( var_2, var_4 );
    }

    if ( !isdefined( var_2 ) )
        return;

    level._id_24E3[var_0] = 0;
    level._id_89C2[var_0] = 0;
    level._id_365F[var_0] = 0;
    var_6 = _func_0DB();

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( isdefined( var_6[var_7]._id_79C6 ) && var_6[var_7]._id_79C6 == var_0 )
        {
            if ( var_6[var_7].count > 0 )
            {
                var_6[var_7] thread _id_3661( var_0, var_2[_func_0B2( var_2.size )] );
                level._id_89C2[var_0]++;
            }
        }
    }

    var_8 = _func_0D9();

    for ( var_7 = 0; var_7 < var_8.size; var_7++ )
    {
        if ( isdefined( var_8[var_7]._id_79C6 ) && var_8[var_7]._id_79C6 == var_0 )
            var_8[var_7] thread _id_365A( var_0 );
    }

    if ( !level._id_24E3[var_0] && !level._id_89C2[var_0] )
        return;

    var_6 = undefined;
    var_8 = undefined;
    thread _id_3663( var_0, var_1 );
    level waittill( "fallbacker_trigger" + var_0 );

    if ( getdvar( "fallback", "0" ) == "1" )
    {

    }

    level._id_365F[var_0] = 1;
    var_9 = undefined;
    var_8 = _func_0D9();

    for ( var_7 = 0; var_7 < var_8.size; var_7++ )
    {
        if ( isdefined( var_8[var_7]._id_79C6 ) && var_8[var_7]._id_79C6 == var_0 || isdefined( var_8[var_7]._id_79C7 ) && isdefined( var_1 ) && var_8[var_7]._id_79C7 == var_1 )
            var_9 = common_scripts\utility::_id_07A5( var_9, var_8[var_7] );
    }

    var_8 = undefined;

    if ( !isdefined( var_9 ) )
        return;

    var_10 = var_9.size * 0.4;
    var_10 = _func_0BC( var_10 );
    level notify( "fallback initiated " + var_0 );

    for ( var_7 = 0; var_7 < var_10; var_7++ )
        var_9[var_7] thread _id_3659( var_0, var_2[_func_0B2( var_2.size )] );

    for ( var_7 = 0; var_7 < var_10; var_7++ )
        level waittill( "fallback_reached_goal" + var_0 );

    for ( var_7 = var_10; var_7 < var_9.size; var_7++ )
    {
        if ( _func_1A1( var_9[var_7] ) )
            var_9[var_7] thread _id_3659( var_0, var_2[_func_0B2( var_2.size )] );
    }
}

_id_3663( var_0, var_1 )
{
    level endon( "fallbacker_trigger" + var_0 );

    if ( getdvar( "fallback", "0" ) == "1" )
    {

    }

    for ( var_2 = 0; var_2 < level._id_89C2[var_0]; var_2++ )
    {
        if ( getdvar( "fallback", "0" ) == "1" )
        {

        }

        level waittill( "fallback_firstspawn" + var_0 );
    }

    if ( getdvar( "fallback", "0" ) == "1" )
    {

    }

    var_3 = _func_0D9();

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
    {
        if ( isdefined( var_3[var_2]._id_79C6 ) && var_3[var_2]._id_79C6 == var_0 || isdefined( var_3[var_2]._id_79C7 ) && isdefined( var_1 ) && var_3[var_2]._id_79C7 == var_1 )
            var_3[var_2] thread _id_365A( var_0 );
    }

    var_3 = undefined;
    var_4 = level._id_24E3[var_0];

    for ( var_5 = 0; level._id_24E3[var_0] > var_4 * 0.5; var_5++ )
    {
        if ( getdvar( "fallback", "0" ) == "1" )
        {

        }

        level waittill( "fallbacker_died" + var_0 );
    }

    level notify( "fallbacker_trigger" + var_0 );
}

_id_3662( var_0 )
{
    if ( !isdefined( level._id_3658 ) || !isdefined( level._id_3658[var_0._id_79C6] ) )
        level thread _id_60AD( var_0._id_79C6, var_0._id_79C7 );

    var_0 waittill( "trigger" );
    level notify( "fallbacker_trigger" + var_0._id_79C6 );
    _id_533E( var_0 );
}

_id_0D2A( var_0 )
{
    self waittill( "goal" );

    if ( _id_6123( var_0 ) )
        self._id_01C4 = var_0._id_0351;
    else
        self._id_01C4 = level._id_2780;
}

_id_365C()
{
    self endon( "fallback" );
    self endon( "fallback_clear_goal" );
    self endon( "fallback_clear_death" );

    for (;;)
    {
        if ( isdefined( self._id_22BB ) )
        {

        }

        wait 0.05;
    }
}

_id_3660()
{
    self endon( "fallback_clear_goal" );
    self endon( "fallback_clear_death" );

    for (;;)
    {
        if ( isdefined( self._id_22BB ) )
        {

        }

        wait 0.05;
    }
}

_id_3658()
{
    var_0 = _func_0C3( self._id_04A4, "targetname" );
    self._id_22BB = var_0;
    self _meth_81A9( var_0 );

    if ( isdefined( self._id_7ABF ) )
        thread _id_0D2A( var_0 );
    else if ( _id_6123( var_0 ) )
        self._id_01C4 = var_0._id_0351;
    else
        self._id_01C4 = level._id_2780;

    for (;;)
    {
        self waittill( "fallback" );
        self._id_020C = 20;
        level thread _id_365D( self );

        if ( getdvar( "fallback", "0" ) == "1" )
            thread _id_3660();

        if ( isdefined( var_0._id_04A4 ) )
        {
            var_0 = _func_0C3( var_0._id_04A4, "targetname" );
            self._id_22BB = var_0;
            self _meth_81A9( var_0 );
            thread _id_365E();

            if ( _id_6123( var_0 ) )
                self._id_01C4 = var_0._id_0351;

            continue;
        }

        level notify( "fallback_arrived" + self._id_79C6 );
        return;
    }
}

_id_2819()
{
    wait 0.05;
    self delete();
}

_id_9EAD( var_0, var_1 )
{
    var_2 = var_0[0] - var_1[0];
    var_3 = var_0[1] - var_1[1];
    var_4 = var_0[2] - var_1[2];
    var_2 *= var_2;
    var_3 *= var_3;
    var_4 *= var_4;
    var_5 = var_2 + var_3 + var_4;
    return var_5;
}

_id_8A28( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_3A8E( var_0 )
{
    if ( !isdefined( level._id_3A8F ) )
        thread _id_3A90();

    for (;;)
    {
        var_0 waittill( "trigger" );
        level notify( "friendly_died" );

        if ( var_0._id_04A6 == "friendly_wave" )
            level._id_3A91 = var_0;
        else
            level._id_3A91 = undefined;

        wait 1;
    }
}

_id_7EBC( var_0 )
{
    if ( !isdefined( self._id_04A4 ) )
        return;

    var_1 = getentarray( self._id_04A4, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _id_A5A4::_id_7DF8( var_0 );
}

_id_3A98()
{
    if ( !isdefined( level._id_93F9 ) )
        level._id_93F9 = 0;

    level._id_93F9++;
    self waittill( "death" );
    level notify( "friendly_died" );
    level._id_93F9--;
}

_id_3A90()
{
    level._id_3A8F = 1;
    var_0 = getentarray( "friendly_wave", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::_id_7EBC, 0 );

    if ( !isdefined( level._id_5A3A ) )
        level._id_5A3A = 7;

    var_1 = 1;

    for (;;)
    {
        if ( isdefined( level._id_3A91 ) && isdefined( level._id_3A91._id_04A4 ) )
        {
            var_2 = level._id_3A91;
            var_3 = getentarray( level._id_3A91._id_04A4, "targetname" );

            if ( !var_3.size )
            {
                level waittill( "friendly_died" );
                continue;
            }

            var_4 = 0;
            var_5 = isdefined( level._id_3A91._id_0392 );

            while ( isdefined( level._id_3A91 ) && level._id_93F9 < level._id_5A3A )
            {
                if ( var_2 != level._id_3A91 )
                {
                    var_5 = isdefined( level._id_3A91._id_0392 );
                    var_2 = level._id_3A91;
                    var_3 = getentarray( level._id_3A91._id_04A4, "targetname" );
                }
                else if ( !var_5 )
                    var_4 = _func_0B2( var_3.size );
                else if ( var_4 == var_3.size )
                    var_4 = 0;

                var_3[var_4] _id_A5A4::_id_7DF8( 1 );
                var_6 = isdefined( var_3[var_4]._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );

                if ( isdefined( var_3[var_4]._id_79EB ) )
                    var_7 = var_3[var_4] _meth_8096( var_6 );
                else
                    var_7 = var_3[var_4] _meth_8095( var_6 );

                var_3[var_4] _id_A5A4::_id_7DF8( 0 );

                if ( _id_A5A4::_id_88F1( var_7 ) )
                {
                    wait 0.2;
                    continue;
                }

                if ( isdefined( var_3[var_4]._id_797A ) )
                {
                    if ( var_3[var_4]._id_20A7 == "heat" )
                        var_7 _id_A5A4::_id_30C9();

                    if ( var_3[var_4]._id_20A7 == "cqb" )
                        var_7 _id_A5A4::_id_30B0();
                }

                if ( isdefined( level._id_3ABF ) )
                    level thread [[ level._id_3ABF ]]( var_7 );
                else
                    var_7 _meth_81AB( level._id_0318 );

                if ( var_5 )
                {
                    if ( level._id_3A91._id_0392 == 0 )
                        waitframe;
                    else
                        wait(level._id_3A91._id_0392);

                    var_4++;
                    continue;
                }

                wait(_func_0B3( 5 ));
            }
        }

        level waittill( "friendly_died" );
    }
}

_id_3A70( var_0 )
{
    var_1 = _func_0C3( var_0._id_04A4, "targetname" );
    var_2 = getent( var_1._id_04A4, "targetname" );
    var_2 _meth_8067( "auto_ai" );
    var_2 _meth_810A();
    var_3 = 0;

    for (;;)
    {
        var_0 waittill( "trigger", var_4 );

        if ( !_func_0CF( var_4 ) )
            continue;

        if ( !isdefined( var_4._id_04A7 ) )
            continue;

        if ( var_4._id_04A7 != "allies" )
            continue;

        if ( isdefined( var_4._id_7B0A ) && var_4._id_7B0A == 0 )
            continue;

        if ( var_4 thread _id_3A6E( var_2, var_1 ) )
        {
            var_4 thread _id_3A6D( var_2, var_1 );
            var_2 waittill( "friendly_finished_using_mg42" );

            if ( _func_1A1( var_4 ) )
                var_4._id_999F = gettime() + 10000;
        }

        wait 1;
    }
}

_id_3A69( var_0, var_1 )
{
    var_1 endon( "friendly_finished_using_mg42" );
    var_0 waittill( "death" );
    var_1 notify( "friendly_finished_using_mg42" );
}

_id_3A6F( var_0 )
{
    var_0 endon( "friendly_finished_using_mg42" );
    self._id_04E6 = 1;
    self _meth_80DC( "HINT_NOICON" );
    self _meth_80DD( &"PLATFORM_USEAIONMG42" );
    self waittill( "trigger" );
    self._id_04E6 = 0;
    self _meth_80DD( "" );
    self _meth_818F();
    self notify( "stopped_use_turret" );
    var_0 notify( "friendly_finished_using_mg42" );
}

_id_3A6E( var_0, var_1 )
{
    if ( self._id_04E6 )
        return 0;

    if ( isdefined( self._id_999F ) && gettime() < self._id_999F )
        return 0;

    if ( _func_0EE( level._id_0318._id_02E2, var_1._id_02E2 ) < 100 )
        return 0;

    return 1;
}

_id_3A6B( var_0, var_1 )
{
    var_0 endon( "friendly_finished_using_mg42" );
    self waittill( "trigger" );
    var_0 notify( "friendly_finished_using_mg42" );
}

_id_3A6C()
{
    if ( !isdefined( self._id_3A67 ) )
        return;

    self._id_3A67 notify( "friendly_finished_using_mg42" );
}

_id_6144()
{
    self endon( "death" );
    self waittill( "goal" );
    self._id_01C4 = self._id_63DF;

    if ( self._id_01C4 < 32 )
        self._id_01C4 = 400;
}

_id_3A6D( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "friendly_finished_using_mg42" );
    level thread _id_3A69( self, var_0 );
    self._id_63DF = self._id_01C4;
    self._id_01C4 = 28;
    thread _id_6144();
    self _meth_81A9( var_1 );
    self._id_0201 = 1;
    self waittill( "goal" );
    self._id_01C4 = self._id_63DF;

    if ( self._id_01C4 < 32 )
        self._id_01C4 = 400;

    self._id_0201 = 0;
    self._id_01C4 = self._id_63DF;

    if ( _func_0EE( level._id_0318._id_02E2, var_1._id_02E2 ) < 32 )
    {
        var_0 notify( "friendly_finished_using_mg42" );
        return;
    }

    self._id_3A67 = var_0;
    thread _id_3A6F( var_0 );
    thread _id_3A68( var_0 );
    self _meth_818E( var_0 );

    if ( isdefined( var_0._id_04A4 ) )
    {
        var_2 = getent( var_0._id_04A4, "targetname" );

        if ( isdefined( var_2 ) )
            var_2 thread _id_3A6B( var_0, self );
    }

    for (;;)
    {
        if ( _func_0EE( self._id_02E2, var_1._id_02E2 ) < 32 )
            self _meth_818E( var_0 );
        else
            break;

        wait 1;
    }

    var_0 notify( "friendly_finished_using_mg42" );
}

_id_3A68( var_0 )
{
    self endon( "death" );
    var_0 waittill( "friendly_finished_using_mg42" );
    _id_3A6A();
}

_id_3A6A()
{
    self endon( "death" );
    var_0 = self._id_3A67;
    self._id_3A67 = undefined;
    self _meth_818F();
    self notify( "stopped_use_turret" );
    self._id_04E6 = 0;
    self._id_01C4 = self._id_63DF;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_04A4 ) )
        return;

    var_1 = _func_0C3( var_0._id_04A4, "targetname" );
    var_2 = self._id_01C4;
    self._id_01C4 = 8;
    self _meth_81A9( var_1 );
    wait 2;
    self._id_01C4 = 384;
    return;
    self waittill( "goal" );

    if ( isdefined( self._id_04A4 ) )
    {
        var_1 = _func_0C3( self._id_04A4, "targetname" );

        if ( isdefined( var_1._id_04A4 ) )
            var_1 = _func_0C3( var_1._id_04A4, "targetname" );

        if ( isdefined( var_1 ) )
            self _meth_81A9( var_1 );
    }

    self._id_01C4 = var_2;
}

_id_9193()
{
    if ( isdefined( level._id_616B ) )
        return;

    if ( isdefined( level._id_56E2 ) && !level._id_56E2 )
        return;

    _id_A5A4::_id_0749( ::_id_9194 );
}

_id_9194( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self ) )
        return;

    if ( _func_1A1( self ) )
        return;

    if ( !_func_1A1( var_1 ) )
        return;

    if ( !isdefined( var_1._id_04FF ) )
        return;

    if ( var_1 _id_A5A8::_id_5118() )
        return;

    if ( !isdefined( self._id_6159 ) )
        self _meth_8023();

    if ( !isdefined( self ) )
        return;

    _id_A5A4::_id_733C( ::_id_9194 );
}

_id_667A( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    var_0._id_6678 = var_1;

    if ( isdefined( var_1._id_0392 ) )
        var_0._id_6675 = var_1._id_0392;

    if ( isdefined( var_3 ) && isdefined( var_4 ) )
    {
        var_0._id_6676 = var_3;
        var_0._id_6677 = var_4;
    }
    else
        var_0._id_6679 = var_2;

    var_0 _meth_81AA( var_0._id_02E2 );
    var_0 _meth_81A9( var_1 );
    var_0._id_01C4 = 12;
    var_0 waittill( "goal" );
    var_0._id_01C4 = 28;
    var_0 waittill( "shot_at_target" );
    var_0._id_6676 = undefined;
    var_0._id_6679 = undefined;
    var_0._id_6675 = undefined;
}

_id_852D( var_0, var_1, var_2 )
{
    var_3 = _func_06F( var_0, var_1, var_2 );

    for (;;)
        wait 0.05;
}

_id_8A17()
{
    _id_A5A4::_id_7DF8( 1 );

    if ( isdefined( self._id_79EB ) )
        var_0 = self _meth_8096();
    else
        var_0 = self _meth_8095();

    if ( _id_A5A4::_id_88F1( var_0 ) )
        return;

    if ( isdefined( self._id_797A ) )
    {
        if ( self._id_797A == "heat" )
            var_0 _id_A5A4::_id_30C9();

        if ( self._id_797A == "cqb" )
            var_0 _id_A5A4::_id_30B0();
    }

    var_0._id_3AC0 = 1;
}

_id_A0D5()
{
    self endon( "death" );
    self waittill( "leaveSquad" );
}

_id_3ABC()
{
    common_scripts\utility::_id_0D13( getentarray( self._id_04A4, "targetname" ), ::_id_3ABD, self );

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( _id_071E() && _id_3FA6() == self )
            _id_9A75();

        self waittill( "friendly_wave_start", var_3 );
        _id_7F79( var_3, self );

        if ( !isdefined( var_3._id_04A4 ) )
            continue;

        var_4 = getent( var_3._id_04A4, "targetname" );
        var_4 thread _id_8A16( self );
    }
}

_id_38EA( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( isdefined( self._id_0398 ) && self._id_0398 == "instant_respawn" )
        var_0 = 1;

    level._id_89CE = [];
    var_1 = getentarray( self._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::_id_38ED, var_0 );
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        self waittill( "trigger", var_4 );

        if ( !_id_62FF() )
            continue;

        if ( !var_3 )
        {
            var_3 = 1;
            _id_A5A4::_id_0392();
        }

        if ( self _meth_80AB( level._id_0318 ) )
            var_2 = 1;
        else
        {
            if ( !_func_1A1( var_4 ) )
                continue;

            if ( _func_1AD( var_4 ) )
                var_2 = 1;
            else if ( !isdefined( var_4._id_51B6 ) || !var_4._id_51B6 )
                continue;
        }

        var_1 = getentarray( self._id_04A4, "targetname" );

        if ( isdefined( var_1[0] ) )
        {
            if ( isdefined( var_1[0]._id_7AB4 ) )
                _id_24B6( var_1[0]._id_7AB4 );
        }

        var_1 = getentarray( self._id_04A4, "targetname" );

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            var_1[var_5]._id_6D73 = var_2;
            var_1[var_5] notify( "flood_begin" );
        }

        if ( var_2 )
        {
            wait 5;
            continue;
        }

        wait 0.1;
    }
}

_id_24B7( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_0[var_2]._id_7AB4] = 1;

    var_3 = _func_1D3( var_1 );
    var_4 = common_scripts\utility::_id_710E( var_3 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_7AB4 != var_4 )
            var_0[var_2] delete();
    }
}

_id_38ED( var_0 )
{
    if ( isdefined( self._id_7C07 ) )
        return;

    self._id_7C07 = 1;
    self._id_981E = 1;
    var_1 = self._id_04A4;
    var_2 = self._id_04A6;

    if ( !isdefined( var_1 ) && !isdefined( self._id_7A40 ) )
        waitframe;

    var_3 = [];

    if ( isdefined( var_1 ) )
    {
        var_4 = getentarray( var_1, "targetname" );

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            if ( !_func_120( var_4[var_5].classname, "actor" ) )
                continue;

            var_3[var_3.size] = var_4[var_5];
        }
    }

    var_6 = spawnstruct();
    var_7 = self._id_02E2;
    _id_38EE( var_6, var_3.size > 0, var_0 );

    if ( _func_1A1( var_6._id_08B4 ) )
        var_6._id_08B4 waittill( "death" );

    if ( !isdefined( var_1 ) )
        return;

    var_4 = getentarray( var_1, "targetname" );

    if ( !var_4.size )
        return;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( !_func_120( var_4[var_5].classname, "actor" ) )
            continue;

        var_4[var_5]._id_04A6 = var_2;
        var_8 = var_1;

        if ( isdefined( var_4[var_5]._id_04A4 ) )
        {
            var_9 = getent( var_4[var_5]._id_04A4, "targetname" );

            if ( !isdefined( var_9 ) || !_func_120( var_9.classname, "actor" ) )
                var_8 = var_4[var_5]._id_04A4;
        }

        var_4[var_5]._id_04A4 = var_8;
        var_4[var_5] thread _id_38ED( var_0 );
        var_4[var_5]._id_6D73 = 1;
        var_4[var_5] notify( "flood_begin" );
    }
}

_id_38EE( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = self.count;

    if ( !var_1 )
        var_1 = isdefined( self._id_0398 ) && self._id_0398 == "delete";

    _id_A5A4::_id_7DF8( 2 );

    if ( isdefined( self._id_0392 ) )
        var_4 = self._id_0392;
    else
        var_4 = 0;

    for (;;)
    {
        self waittill( "flood_begin" );

        if ( self._id_6D73 )
            break;

        if ( var_4 )
            continue;

        break;
    }

    var_5 = _func_0EE( level._id_0318._id_02E2, self._id_02E2 );

    while ( var_3 )
    {
        self._id_9887 = var_3;
        _id_A5A4::_id_7DF8( 2 );
        wait(var_4);
        var_6 = isdefined( self._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );

        if ( isdefined( self._id_79EB ) )
            var_7 = self _meth_8096( var_6 );
        else
            var_7 = self _meth_8095( var_6 );

        if ( _id_A5A4::_id_88F1( var_7 ) )
        {
            var_8 = 0;

            if ( var_4 < 2 )
                wait 2;

            continue;
        }
        else
        {
            if ( isdefined( self._id_797A ) )
            {
                if ( self._id_797A == "heat" )
                    var_7 _id_A5A4::_id_30C9();

                if ( self._id_797A == "cqb" )
                    var_7 _id_A5A4::_id_30B0();
            }

            thread _id_0856( var_7 );
            var_7 thread _id_38EB( self );

            if ( isdefined( self._id_792C ) )
                var_7._id_1300 = self._id_792C;

            var_0._id_08B4 = var_7;
            var_0 notify( "got_ai" );
            self waittill( "spawn_died", var_9, var_8 );

            if ( var_4 > 2 )
                var_4 = _func_0B2( 4 ) + 2;
            else
                var_4 = 0.5 + _func_0B3( 0.5 );
        }

        if ( var_9 )
        {
            _id_A0F1( var_5 );
            continue;
        }

        if ( _id_6D8A( var_8 || var_1, var_0._id_08B4 ) )
            var_3--;

        if ( !var_2 )
            _id_A101();
    }

    self delete();
}

_id_A0D7( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
}

_id_0856( var_0 )
{
    var_1 = self._id_04A6;

    if ( !isdefined( level._id_89CE[var_1] ) )
    {
        level._id_89CE[var_1] = spawnstruct();
        level._id_89CE[var_1] _id_A5A4::_id_7DF8( 0 );
        level._id_89CE[var_1]._id_93F3 = 0;
    }

    if ( !isdefined( self._id_07E1 ) )
    {
        self._id_07E1 = 1;
        level._id_89CE[var_1]._id_93F3++;
    }

    level._id_89CE[var_1].count++;
    _id_A0D7( var_0 );
    level._id_89CE[var_1].count--;

    if ( !isdefined( self ) )
        level._id_89CE[var_1]._id_93F3--;

    if ( level._id_89CE[var_1]._id_93F3 )
    {
        if ( level._id_89CE[var_1].count / level._id_89CE[var_1]._id_93F3 < 0.32 )
            level._id_89CE[var_1] notify( "waveReady" );
    }
}

_id_273C( var_0 )
{
    self endon( "debug_stop" );
    self endon( "death" );

    for (;;)
        wait 0.05;
}

_id_A101()
{
    var_0 = self._id_04A6;

    if ( level._id_89CE[var_0].count )
        level._id_89CE[var_0] waittill( "waveReady" );
}

_id_6D8A( var_0, var_1 )
{
    if ( var_0 )
        return 1;

    if ( isdefined( var_1 ) && isdefined( var_1._id_02E2 ) )
        var_2 = var_1._id_02E2;
    else
        var_2 = self._id_02E2;

    if ( _func_0EE( level._id_0318._id_02E2, var_2 ) < 700 )
        return 1;

    return _func_08D( level._id_0318 _meth_80AA(), var_1 _meth_80AA(), 0, undefined );
}

_id_A0F1( var_0 )
{
    self endon( "flood_begin" );
    var_0 *= 0.75;

    while ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) > var_0 )
        wait 1;
}

_id_38EB( var_0 )
{
    thread _id_38EC();
    self waittill( "death", var_1 );
    var_2 = _func_1A1( var_1 ) && _func_1AD( var_1 );

    if ( !var_2 && isdefined( var_1 ) && var_1.classname == "worldspawn" )
        var_2 = 1;

    var_3 = !isdefined( self );
    var_0 notify( "spawn_died", var_3, var_2 );
}

_id_38EC()
{
    if ( isdefined( self._id_7A40 ) )
        return;

    self endon( "death" );
    var_0 = _func_0C3( self._id_04A4, "targetname" );

    if ( isdefined( var_0 ) )
        self _meth_81A9( var_0 );
    else
    {
        var_0 = getent( self._id_04A4, "targetname" );

        if ( isdefined( var_0 ) )
            self _meth_81AA( var_0._id_02E2 );
    }

    if ( isdefined( level._id_36AC ) )
    {
        self._id_02F6 = level._id_36AC;
        self._id_02F7 = level._id_5A30;
    }

    if ( isdefined( var_0._id_0351 ) && var_0._id_0351 >= 0 )
        self._id_01C4 = var_0._id_0351;
    else
        self._id_01C4 = 256;

    self waittill( "goal" );

    while ( isdefined( var_0._id_04A4 ) )
    {
        var_1 = _func_0C3( var_0._id_04A4, "targetname" );

        if ( isdefined( var_1 ) )
            var_0 = var_1;
        else
            break;

        self _meth_81A9( var_0 );

        if ( _id_6123( var_0 ) )
            self._id_01C4 = var_0._id_0351;
        else
            self._id_01C4 = 256;

        self waittill( "goal" );
    }

    if ( isdefined( self._id_0398 ) )
    {
        if ( self._id_0398 == "delete" )
        {
            self _meth_8054();
            return;
        }
    }

    if ( isdefined( var_0._id_04A4 ) )
    {
        var_2 = getent( var_0._id_04A4, "targetname" );

        if ( isdefined( var_2 ) && ( var_2.code_classname == "misc_mgturret" || var_2.code_classname == "misc_turret" ) )
        {
            self _meth_81A9( var_0 );
            self._id_01C4 = 4;
            self waittill( "goal" );

            if ( !isdefined( self._id_79E9 ) )
                self._id_01C4 = level._id_2780;

            _id_9BD0( var_2 );
        }
    }

    if ( isdefined( self._id_0398 ) )
    {
        if ( isdefined( self._id_7A84 ) )
        {
            if ( self._id_7A84 == "furniture_push" )
                thread _id_3B0F();
        }

        if ( self._id_0398 == "hide" )
        {
            thread _id_A5A4::_id_7DDF( 0 );
            return;
        }
    }

    if ( !isdefined( self._id_79E9 ) && !isdefined( self _meth_81AE() ) )
        self._id_01C4 = level._id_2780;
}

_id_3B0F()
{
    var_0 = getent( self._id_04A4, "targetname" )._id_02E2;
    common_scripts\utility::_id_69C2( "furniture_slide", var_0 );
    wait 0.9;

    if ( isdefined( level._id_A303 ) )
        common_scripts\utility::_id_69C2( common_scripts\utility::_id_710E( level._id_A303 ), var_0 );
}

_id_3A93()
{
    waitframe;
    var_0 = getentarray( self._id_04A4, "targetname" );

    if ( !var_0.size )
    {
        var_1 = _func_0C3( self._id_04A4, "targetname" );

        for (;;)
        {
            self waittill( "trigger" );

            if ( isdefined( level._id_55A3 ) && level._id_55A3 == self )
            {
                wait 0.5;
                continue;
            }

            if ( !_id_62FF() )
            {
                wait 0.5;
                continue;
            }

            level notify( "new_friendly_trigger" );
            level._id_55A3 = self;
            var_2 = !isdefined( self._id_7959 ) || self._id_7959 == 0;
            _id_7FBC( var_1, var_2 );
        }
    }

    for (;;)
    {
        self waittill( "trigger" );

        while ( level._id_0318 _meth_80AB( self ) )
            wait 0.05;

        if ( !_id_62FF() )
        {
            wait 0.05;
            continue;
        }

        if ( isdefined( level._id_55A3 ) && level._id_55A3 == self )
            continue;

        level notify( "new_friendly_trigger" );
        level._id_55A3 = self;
        common_scripts\utility::_id_0D13( var_0, ::_id_3ABE );
        wait 0.5;
    }
}

_id_62FF()
{
    var_0 = 1;

    if ( isdefined( self._id_7A8A ) )
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < level._id_071A.size; var_1++ )
        {
            if ( !_func_120( self._id_7A8A, level._id_071A[var_1] ) )
                continue;

            var_0 = 1;
            break;
        }

        if ( !var_0 )
            return 0;
    }

    if ( !isdefined( self._id_7A8B ) )
        return var_0;

    var_2 = 0;

    for ( var_1 = 0; var_1 < level._id_4C12.size; var_1++ )
    {
        if ( !_func_120( self._id_7A8B, level._id_4C12[var_1] ) )
            continue;

        var_2++;
    }

    var_3 = _func_124( self._id_7A8B, " " );
    return var_2 == var_3.size;
}

_id_3ABE( var_0 )
{
    level endon( "new_friendly_trigger" );
    self waittill( "trigger" );
    var_0 = _func_0C3( self._id_04A4, "targetname" );
    var_1 = !isdefined( self._id_7959 ) || self._id_7959 == 0;
    _id_7FBC( var_0, var_1 );
}

_id_A0D4()
{
    self endon( "death" );
    var_0 = self._id_7986;

    while ( self.count )
    {
        self waittill( "spawned", var_1 );
        var_1 thread _id_2655( var_0 );
    }
}

_id_2655( var_0 )
{
    level._id_266B[var_0]++;
    self waittill( "death" );
    level._id_266B[var_0]--;
    level notify( "spawner_expired" + var_0 );
}

_id_2656()
{
    var_0 = self._id_7986;
    level._id_266B[var_0]++;
    var_1 = self._id_02E2;
    _id_A0D4();
    level notify( "spawner dot" + var_1 );
    level._id_266B[var_0]--;
    level notify( "spawner_expired" + var_0 );
}

_id_3A94()
{
    var_0 = getentarray( "friendly_chain_on_death", "targetname" );
    var_1 = _func_0DB();
    level._id_266B = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_1[var_2]._id_7986 ) )
            continue;

        var_3 = var_1[var_2]._id_7986;

        if ( !isdefined( level._id_266B[var_3] ) )
            level._id_266B[var_3] = 0;

        var_1[var_2] thread _id_2656();
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_7986 ) )
            return;

        var_0[var_2] thread _id_3A95();
    }
}

_id_3A95()
{
    while ( level._id_266B[self._id_7986] > 0 )
        level waittill( "spawner_expired" + self._id_7986 );

    level endon( "start_chain" );
    var_0 = _func_0C3( self._id_04A4, "targetname" );

    for (;;)
    {
        self waittill( "trigger" );
        _id_7FBC( var_0, 1 );
        iprintlnbold( "Area secured, move up!" );
        wait 5;
    }
}

_id_7FBC( var_0, var_1 )
{
    level notify( "new_escort_trigger" );
    level notify( "new_escort_debug" );
    level notify( "start_chain", var_1 );
}

_id_3A96()
{
    level._id_3ABA = [];
    level._id_3ABB = [];
    common_scripts\utility::_id_0D13( getentarray( "friendlychain", "targetname" ), ::_id_3A93 );
}

_id_9A75()
{
    var_0 = [];
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_3ABA.size; var_2++ )
    {
        var_0[var_0.size] = level._id_3ABA[var_2];
        var_1[var_1.size] = level._id_3ABB[var_2];
    }

    level._id_3ABA = var_0;
    level._id_3ABB = var_1;

    if ( _id_071E() )
        return;

    common_scripts\utility::_id_3831( "spawning_friendlies" );
}

_id_3FA5()
{
    return level._id_3ABA[level._id_3ABA.size - 1];
}

_id_071E()
{
    return level._id_3ABA.size > 0;
}

_id_3FA6()
{
    return level._id_3ABB[level._id_3ABB.size - 1];
}

_id_7F79( var_0, var_1 )
{
    level._id_3ABA[level._id_3ABA.size] = var_0._id_02E2;
    level._id_3ABB[level._id_3ABB.size] = var_1;
    common_scripts\utility::_id_383F( "spawning_friendlies" );
}

_id_27E5()
{
    self endon( "death" );
    self endon( "leaveSquad" );
    wait 0.5;
    self _meth_81AB( level._id_0318 );
}

_id_8A16( var_0 )
{
    self notify( "stopTrigger" );
    self endon( "stopTrigger" );
    self waittill( "trigger" );

    if ( _id_3FA6() != var_0 )
        return;

    _id_9A75();
}

_id_3ABD( var_0 )
{
    var_1 = getent( self._id_04A4, "targetname" );

    for (;;)
    {
        self waittill( "trigger" );
        var_0 notify( "friendly_wave_start", var_1 );

        if ( !isdefined( var_1._id_04A4 ) )
            continue;
    }
}

_id_4255()
{
    var_0 = getentarray( "info_volume", "classname" );
    level._id_2654 = [];
    level._id_4255 = [];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2._id_7986 ) )
            level._id_2654[var_2._id_7986] = var_2;

        if ( isdefined( var_2._id_7A03 ) )
            level._id_4255[var_2._id_7A03] = var_2;
    }
}

_id_2731( var_0, var_1, var_2 )
{
    if ( 1 )
        return;

    var_3 = self _meth_8097();
    var_4 = 40 * _func_0B6( var_3[0] + var_3[1] ) - 40;
    var_3 = ( var_3[0], var_3[1], var_3[2] + var_4 );
    level endon( var_1 );
    self endon( "new_color" );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0.8, 0.6 );

    var_5 = 0;

    for (;;)
    {
        var_5 += 12;
        var_6 = _func_0B6( var_5 ) * 0.4;

        if ( var_6 < 0 )
            var_6 *= -1;

        var_6 += 1;
        wait 0.05;
    }
}

_id_0956( var_0 )
{
    level._id_054A[var_0] = spawnstruct();
    level._id_054A[var_0]._id_0949 = 0;
    level._id_054A[var_0]._id_89CC = 0;
    level._id_054A[var_0]._id_08B4 = [];
    level._id_054A[var_0]._id_89CD = [];
}

_id_095A( var_0 )
{
    self endon( "death" );
    self._id_2760 = 0;
    var_0._id_89CC++;
    thread _id_0958( var_0 );
    thread _id_0959( var_0 );

    while ( self.count )
    {
        self waittill( "spawned", var_1 );

        if ( _id_A5A4::_id_88F1( var_1 ) )
            continue;

        var_1 thread _id_0957( var_0 );
    }

    waitframe;

    if ( self._id_2760 )
        return;

    self._id_2760 = 1;
    var_0._id_89CC--;
}

_id_0958( var_0 )
{
    self waittill( "death" );

    if ( self._id_2760 )
        return;

    var_0._id_89CC--;
}

_id_0959( var_0 )
{
    self endon( "death" );
    self waittill( "emptied spawner" );
    waitframe;

    if ( self._id_2760 )
        return;

    self._id_2760 = 1;
    var_0._id_89CC--;
}

_id_0957( var_0 )
{
    var_0._id_0949++;
    var_0._id_08B4[var_0._id_08B4.size] = self;

    if ( isdefined( self._id_7988 ) )
        _id_A0D6();
    else
        self waittill( "death" );

    var_0._id_0949--;
}

_id_1A42( var_0 )
{
    var_1 = _func_124( var_0._id_7A26, " " );
    var_2 = [];
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = var_1[var_4];
        var_6 = getent( var_5, "script_linkname" );

        if ( isdefined( var_6 ) )
        {
            var_2 = common_scripts\utility::_id_07A5( var_2, var_6 );
            continue;
        }

        var_7 = _func_0C3( var_5, "script_linkname" );

        if ( !isdefined( var_7 ) )
            continue;

        var_3 = common_scripts\utility::_id_07A5( var_3, var_7 );
    }

    var_0 waittill( "trigger" );
    var_3 = common_scripts\utility::_id_0CF5( var_3 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4]._id_1E1D = 0;

    var_8 = 0;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_9 = var_2[var_4];

        if ( !isdefined( var_9 ) )
            continue;

        if ( isdefined( var_9._id_7ACC ) )
            continue;

        while ( isdefined( var_3[var_8]._id_0398 ) && var_3[var_8]._id_0398 == "dont_spawn" )
            var_8++;

        var_9._id_02E2 = var_3[var_8]._id_02E2;
        var_9.angles = var_3[var_8].angles;
        var_9 _id_A5A4::_id_0798( ::_id_1E1C, var_3[var_8] );
        var_8++;
    }

    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, ::_id_1A40 );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_0798, ::_id_5F41, var_3 );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_88C3 );
}

_id_1A40()
{
    self._id_01C4 = 8;
    self._id_017D = 1;
}

_id_5F41( var_0 )
{
    self endon( "death" );
    var_1 = 0;

    for (;;)
    {
        if ( !_func_1A1( self._id_0142 ) )
        {
            self waittill( "enemy" );
            var_1 = 0;
            continue;
        }

        if ( _func_1AD( self._id_0142 ) )
        {
            if ( self._id_0142 _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) || common_scripts\utility::_id_382E( "player_flashed" ) )
            {
                self._id_017D = 0;

                for (;;)
                {
                    self._id_01C4 = 180;
                    self _meth_81AA( level._id_0318._id_02E2 );
                    wait 1;
                }

                return;
            }
        }

        if ( var_1 )
        {
            if ( self _meth_81C2( self._id_0142 ) )
            {
                wait 0.05;
                continue;
            }

            var_1 = 0;
        }
        else
        {
            if ( self _meth_81C2( self._id_0142 ) )
                var_1 = 1;

            wait 0.05;
            continue;
        }

        if ( _func_0B2( 3 ) > 0 )
        {
            var_2 = _id_3770( var_0 );

            if ( isdefined( var_2 ) )
            {
                _id_1E1C( var_2, self._id_1E1F );
                self waittill( "goal" );
            }
        }
    }
}

_id_1E1C( var_0, var_1 )
{
    self _meth_81A9( var_0 );
    self._id_1E1F = var_0;
    var_0._id_1E1D = 1;

    if ( isdefined( var_1 ) )
        var_1._id_1E1D = 0;
}

_id_3770( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1]._id_1E1D )
        {
            continue;
            continue;
        }

        return var_0[var_1];
    }

    return undefined;
}

_id_38F4( var_0 )
{
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::_id_38F0 );
    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::_id_38F3, var_0 );
}

_id_38F0( var_0 )
{

}

_id_97DB( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    return isdefined( var_0._id_7AB7 );
}

_id_99E5( var_0 )
{
    var_1 = getent( var_0._id_04A4, "targetname" );
    waitframe;
    var_2 = getentarray( var_1._id_04A4, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3]._id_7A40 = 1;
        var_2[var_3] _id_A5A4::_id_0798( ::_id_9FF2, var_1 );
    }

    var_0 waittill( "trigger" );
    var_2 = getentarray( var_1._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_2, _id_A5A4::_id_88C3 );
}

_id_9FF2( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    self._id_01C4 = 8;
    var_0 waittill( "trigger" );
    thread _id_4241();
}

_id_38F3( var_0 )
{
    if ( !isdefined( level._id_893E ) || _func_1A2( self ) )
        self endon( "death" );

    self notify( "stop current floodspawner" );
    self endon( "stop current floodspawner" );

    if ( _id_5072() )
    {
        _id_7070( var_0 );
        return;
    }

    var_1 = _id_97DB( var_0 );
    _id_A5A4::_id_0392();

    if ( isdefined( level._id_893E ) )
    {
        if ( !_func_1A2( self ) )
            self.count = 1;
    }

    while ( self.count > 0 )
    {
        while ( var_1 && !level._id_0318 _meth_80AB( var_0 ) )
            wait 0.5;

        var_2 = isdefined( self._id_7AE1 ) && common_scripts\utility::_id_382E( "_stealth_enabled" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" );
        var_3 = self;

        if ( isdefined( level._id_893E ) )
        {
            if ( !_func_1A2( self ) )
                var_3 = _id_3E68( self, 1 );
        }

        if ( isdefined( self._id_79EB ) )
            var_4 = var_3 _meth_8096( var_2 );
        else
            var_4 = var_3 _meth_8095( var_2 );

        if ( _id_A5A4::_id_88F1( var_4 ) )
        {
            wait 2;
            continue;
        }

        if ( isdefined( self._id_797A ) )
        {
            if ( self._id_797A == "heat" )
                var_4 _id_A5A4::_id_30C9();

            if ( self._id_797A == "cqb" )
                var_4 _id_A5A4::_id_30B0();
        }

        var_4 thread _id_7302( self );
        var_4 thread _id_3517( var_0 );

        if ( isdefined( var_4 ) && !isdefined( var_4._id_04A6 ) )
        {
            if ( isdefined( self._id_04A6 ) )
                var_4._id_04A6 = self._id_04A6 + "_AI";
        }

        var_4 waittill( "death", var_5 );

        if ( !_id_6BF3( var_4, var_5 ) )
            self.count++;
        else if ( isdefined( level._id_06CF ) )
        {
            if ( isdefined( level._id_06D0 ) && var_5 == level._id_06D0 )
            {
                if ( _func_0B2( 2 ) == 0 )
                    self.count++;
            }
        }

        if ( !isdefined( var_4 ) )
            continue;

        if ( !_id_A5A4::_id_7B20() )
            wait(_func_0B5( 5, 9 ));
    }
}

_id_38F2()
{
    self notify( "stop current floodspawner" );
}

_id_6BF3( var_0, var_1 )
{
    if ( isdefined( self._id_79E5 ) )
    {
        if ( self._id_79E5 )
            return 1;
    }

    if ( !isdefined( var_0 ) )
        return 0;

    if ( _func_1A1( var_1 ) )
    {
        if ( _func_1AD( var_1 ) )
            return 1;

        if ( _func_0EE( var_1._id_02E2, level._id_0318._id_02E2 ) < 200 )
            return 1;
    }
    else if ( isdefined( var_1 ) )
    {
        if ( var_1.classname == "worldspawn" )
            return 0;

        if ( _func_0EE( var_1._id_02E2, level._id_0318._id_02E2 ) < 200 )
            return 1;
    }

    if ( _func_0EE( var_0._id_02E2, level._id_0318._id_02E2 ) < 200 )
        return 1;

    return _func_08D( level._id_0318 _meth_80AA(), var_0 _meth_80AA(), 0, undefined );
}

_id_5072()
{
    if ( !isdefined( self._id_04A4 ) )
        return 0;

    var_0 = getentarray( self._id_04A4, "targetname" );

    if ( !var_0.size )
        return 0;

    return _func_120( var_0[0].classname, "actor" );
}

_id_706F( var_0 )
{
    var_0._id_88BD waittill( "death" );
    self notify( "death_report" );
}

_id_7070( var_0 )
{
    self endon( "death" );
    var_1 = _id_97DB( var_0 );
    _id_A5A4::_id_0392();

    if ( var_1 )
    {
        while ( !level._id_0318 _meth_80AB( var_0 ) )
            wait 0.5;
    }

    var_2 = getentarray( self._id_04A4, "targetname" );
    self._id_89CD = 0;
    common_scripts\utility::_id_0D13( var_2, ::_id_7071, self );
    var_4 = _func_0B2( var_2.size );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( self.count <= 0 )
            return;

        var_4++;

        if ( var_4 >= var_2.size )
            var_4 = 0;

        var_5 = var_2[var_4];
        var_5.count = 1;
        var_6 = var_5 _id_A5A4::_id_88C3();

        if ( _id_A5A4::_id_88F1( var_6 ) )
        {
            wait 2;
            continue;
        }

        self.count--;
        var_5._id_88BD = var_6;
        var_6 thread _id_7302( self );
        var_6 thread _id_3517( var_0 );
        thread _id_706F( var_5 );
    }

    var_7 = 0.01;

    while ( self.count > 0 )
    {
        self waittill( "death_report" );
        _id_A5A4::_id_7B20();
        wait(var_7);
        var_7 += 2.5;
        var_4 = _func_0B2( var_2.size );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_2 = common_scripts\utility::_id_0D01( var_2 );

            if ( !var_2.size )
            {
                if ( isdefined( self ) )
                    self delete();

                return;
            }

            var_4++;

            if ( var_4 >= var_2.size )
                var_4 = 0;

            var_5 = var_2[var_4];

            if ( _func_1A1( var_5._id_88BD ) )
                continue;

            if ( isdefined( var_5._id_04A4 ) )
                self._id_04A4 = var_5._id_04A4;
            else
                self._id_04A4 = undefined;

            var_6 = _id_A5A4::_id_88C3();

            if ( _id_A5A4::_id_88F1( var_6 ) )
            {
                wait 2;
                continue;
            }

            var_6 thread _id_7302( self );
            var_6 thread _id_3517( var_0 );
            var_5._id_88BD = var_6;
            thread _id_706F( var_5 );

            if ( self.count <= 0 )
                return;
        }
    }
}

_id_7071( var_0 )
{
    var_0 endon( "death" );
    var_0._id_89CD++;
    self waittill( "death" );
    var_0._id_89CD--;

    if ( !var_0._id_89CD )
        var_0 delete();
}

_id_3517( var_0 )
{
    if ( isdefined( self._id_79E9 ) )
        return;

    var_1 = level._id_2780;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_7AB2 ) )
        {
            if ( var_0._id_7AB2 == -1 )
                return;

            var_1 = var_0._id_7AB2;
        }
    }

    if ( isdefined( self._id_79E9 ) )
        return;

    self endon( "death" );
    self waittill( "goal" );
    self._id_01C4 = var_1;
}

_id_2F43()
{
    self endon( "death" );
    wait 95;
    self notify( "timeout" );
}

_id_2F44()
{
    self endon( "timeout" );
    thread _id_2F43();
    self waittill( "trigger" );
    _id_A5A4::_id_1C72( 1 );
}

_id_949B( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_84C1()
{

}

_id_7118( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );

    if ( !var_1.size )
        return;

    var_2 = common_scripts\utility::_id_710E( var_1 );
    var_1 = [];
    var_1[var_1.size] = var_2;

    if ( isdefined( var_2._id_7A26 ) )
    {
        var_3 = _func_124( var_2._id_7A26, " " );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
            var_1[var_1.size] = getent( var_3[var_4], "script_linkname" );
    }

    waitframe;
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, ::_id_14C1 );
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_88C3 );
}

_id_14C1()
{
    if ( isdefined( self._id_79E9 ) )
        return;

    self endon( "death" );
    self waittill( "reached_path_end" );

    if ( !isdefined( self _meth_81AE() ) )
        self._id_01C4 = level._id_2780;
}

_id_62ED( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();
    common_scripts\utility::_id_383D( var_1 );

    while ( level._id_266B[var_0._id_7986] > 0 )
        level waittill( "spawner_expired" + var_0._id_7986 );

    common_scripts\utility::_id_383F( var_1 );
}

_id_8043()
{
    self endon( "death" );
    waitframe;
    self._id_508A = _func_1AD( self );
    self._id_333B = [];
    self._id_333C = [];

    for ( var_0 = 0; var_0 < level._id_333E; var_0++ )
        self._id_333B[var_0] = 0;
}

_id_08BA()
{
    level._id_08BA[level._id_9A29] = self;
    self waittill( "death" );
    waitframe;
    level._id_08BA[level._id_9A29] = undefined;
}
#using_animtree("generic_human");

_id_89C1( var_0 )
{
    var_1 = var_0 _meth_803F();
    var_1 _meth_8117( #animtree );

    if ( var_1._id_0513 != "none" )
    {
        var_2 = _func_043( var_1._id_0513 );
        var_1 _meth_801D( var_2, "tag_weapon_right" );
        var_1 _id_A5A4::_id_9AEE( var_1._id_0513 );
    }

    var_1._id_03D9 = var_0;
    var_1._id_2E3F = isdefined( var_0._id_0398 ) && var_0._id_0398 == "drone_delete_on_unload";
    var_0 notify( "drone_spawned", var_1 );
    return var_1;
}

_id_89C9( var_0 )
{
    if ( !isdefined( var_0._id_03D9 ) )
    {

    }

    var_0._id_03D9.count += 1;
    var_1 = var_0._id_03D9;
    var_1.count++;
    var_2 = var_1._id_02E2;
    var_3 = var_1.angles;
    var_1._id_02E2 = var_0._id_02E2;
    var_1.angles = var_0.angles;
    var_4 = var_1 _meth_8096();
    var_5 = _id_A5A4::_id_88F1( var_4 );

    if ( var_5 )
    {
        wait 0.05;
        var_4 = var_1 _meth_8096();
    }

    var_4._id_03D9 = var_1;
    var_4 _meth_80B3( var_0._id_029C );
    var_4 codescripts\character::_id_7F88( var_0._id_477D );
    var_4._id_9CE7 = var_0._id_9CE7;
    var_4._id_9D1B = var_0._id_9D1B;
    var_4._id_8B09 = var_0._id_8B09;
    var_4._id_39B0 = var_0._id_39B0;
    var_4 _meth_83BD( var_0 );
    var_1._id_02E2 = var_2;
    var_1.angles = var_3;
    var_0 delete();
    var_6 = var_4._id_02F8;
    return var_4;
}

_id_89C8( var_0 )
{
    var_1 = var_0._id_03D9;
    var_2 = var_1._id_02E2;
    var_3 = var_1.angles;
    var_1._id_02E2 = var_0._id_02E2;
    var_1.angles = var_0.angles;
    var_4 = var_1 _id_A5A4::_id_2F29();

    if ( !isdefined( var_4 ) )
    {

    }

    var_4 _meth_80B3( var_0._id_029C );
    var_4 codescripts\character::_id_7F88( var_0._id_477D );
    var_4._id_9CE7 = var_0._id_9CE7;
    var_4._id_9D1B = var_0._id_9D1B;
    var_4._id_8B09 = var_0._id_8B09;
    var_4._id_39B0 = var_0._id_39B0;
    var_4 _meth_83BD( var_0 );
    var_1._id_02E2 = var_2;
    var_1.angles = var_3;
    var_0 delete();
    var_4 notify( "drone_stop" );
    return var_4;
}

_id_263B()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( !isdefined( self ) )
        return;

    achieve_enemy_killed_by_flash_banged( var_0 );
    thread achieve_carkilled_by_player( var_0 );
    thread achieve_three_of_kind( var_0, var_1 );
    thread achieve_four_of_kind( var_0, var_1 );
}

achieve_three_of_kind( var_0, var_1 )
{
    if ( self._id_04A7 != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 != level._id_0318 )
        return;

    if ( var_1 != "MOD_MELEE" )
        return;

    if ( !isdefined( level.achieve_three_of_kind ) )
        level.achieve_three_of_kind = 1;
    else
        level.achieve_three_of_kind++;

    if ( level.achieve_three_of_kind == 3 )
        _id_A5A4::_id_41DD( "THREE_OF_A_KIND" );

    level notify( "achieve_three_of_kind" );
    level endon( "achieve_three_of_kind" );
    wait 4;
    level.achieve_three_of_kind = undefined;
}

achieve_four_of_kind( var_0, var_1 )
{
    if ( self._id_04A7 != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 != level._id_0318 )
        return;

    if ( var_1 == "MOD_MELEE" || !animscripts\utility::_id_25A6( "head", "neck", "helmet" ) )
    {
        level.achieve_four_of_kind = undefined;
        return;
    }

    if ( !isdefined( level.achieve_four_of_kind ) )
        level.achieve_four_of_kind = 1;
    else
        level.achieve_four_of_kind++;

    if ( level.achieve_four_of_kind == 4 )
        _id_A5A4::_id_41DD( "FOUR_OF_A_KIND" );

    level notify( "achieve_four_of_kind" );
    level endon( "achieve_four_of_kind" );
    wait 12;
    level.achieve_four_of_kind = undefined;
}

achieve_enemy_killed_by_flash_banged( var_0 )
{
    if ( self._id_04A7 != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( level._id_382E["player_flashed"] && var_0 == level._id_0318 )
        _id_A5A4::_id_41DD( "DAREDEVIL" );
}

achieve_carkilled_by_player( var_0 )
{
    if ( self._id_04A7 != "axis" )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.destuctableinfo ) )
        return;

    if ( !isdefined( var_0.attacker ) )
        return;

    if ( var_0.attacker != level._id_0318 )
        return;

    if ( isdefined( level.achieve_car_killed_one ) )
    {
        _id_A5A4::_id_41DD( "ROADKILL" );
        level.achieve_car_killed_one = undefined;
    }
    else
    {
        level.achieve_car_killed_one = 1;
        wait 0.05;
    }
}

_id_263C( var_0 )
{

}

_id_0789()
{
    var_0 = self._id_7AB3;
    var_1 = self._id_7AB4;

    if ( !isdefined( level._id_537C[var_0] ) )
        level._id_537C[var_0] = [];

    if ( !isdefined( level._id_537C[var_0][var_1] ) )
        level._id_537C[var_0][var_1] = [];

    level._id_537C[var_0][var_1][self._id_3584] = self;
}

_id_07B0()
{
    var_0 = self._id_7ACF;
    var_1 = self._id_7AD0;

    if ( !isdefined( level._id_8907[var_0] ) )
        level._id_8907[var_0] = [];

    if ( !isdefined( level._id_8907[var_0][var_1] ) )
        level._id_8907[var_0][var_1] = [];

    level._id_8907[var_0][var_1][self._id_3584] = self;
}

_id_8C18()
{
    self endon( "death" );
    self._id_2B0E = 1;
    wait 3;
    self._id_2B0E = 0;
}

_id_2671()
{
    self endon( "death" );
    wait(self._id_798A);
    wait(_func_0B3( 10 ));
    self _meth_8054();
}

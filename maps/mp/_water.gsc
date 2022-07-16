// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_058F["water_wake"] = loadfx( "vfx/treadfx/body_wake_water" );
    level._id_058F["water_wake_stationary"] = loadfx( "vfx/treadfx/body_wake_water_stationary" );
    level._id_058F["water_splash_emerge"] = loadfx( "vfx/water/body_splash_exit" );
    level._id_058F["water_splash_enter"] = loadfx( "vfx/water/body_splash" );
    precacheshellshock( "underwater" );

    if ( !isdefined( level._id_A29A ) )
        level._id_A29A = [];

    if ( !isdefined( level._id_A29B ) )
        level._id_A29B = 0;

    if ( !isdefined( level._id_83B2 ) )
        _id_8006( "iw5_combatknife_mp" );

    if ( !isdefined( level._id_2764 ) )
        _id_7F45( "iw5_underwater_mp" );

    if ( !isdefined( level._id_0A9D ) )
        level._id_0A9D = 1;

    if ( level._id_2764 == level._id_83B2 )
        level._id_0A9D = 0;

    if ( !isdefined( level._id_9074 ) )
        level._id_9074 = 48;

    var_0 = getentarray( "trigger_underwater", "targetname" );
    level._id_A28D = var_0;

    foreach ( var_2 in var_0 )
    {
        var_2 _id_23A5();
        var_2 thread _id_A24E();
        level thread _id_1F0E( var_2 );
    }

    level thread _id_64CD();
}

_id_6C05( var_0 )
{
    if ( var_0 )
        self._id_4FAD = 1;
    else
        self._id_4FAD = undefined;
}

watchforhostmigration()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "player_migrated" );

        foreach ( var_1 in level._id_A29A )
            self _meth_84E2( var_1._id_0398, var_1 );
    }
}

_id_64CD()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread watchforhostmigration();

        foreach ( var_2 in level._id_A29A )
            var_0 _meth_84E2( var_2._id_0398, var_2 );
    }
}

_id_23A5()
{
    var_0 = common_scripts\utility::_id_40FB( self._id_04A4, "targetname" );
    var_0._id_02E2 += ( 0, 0, level._id_A29B );
    var_1 = var_0 common_scripts\utility::_id_8959();
    var_1 _meth_8055();

    if ( isdefined( self._id_0398 ) )
    {
        var_1._id_0398 = self._id_0398;
        level._id_A29A = common_scripts\utility::_id_0CDA( level._id_A29A, var_1 );
    }
}

_id_1F0E( var_0 )
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_1 );

        if ( !var_1 _meth_80AB( var_0 ) )
        {
            var_1 _id_6C05( 0 );
            var_1._id_9A04 = undefined;
            var_1._id_4EC2 = undefined;
            var_1._id_51C4 = undefined;
            var_1._id_5201 = undefined;
            var_1._id_A27B = undefined;
            var_1._id_519F = undefined;
            var_1 notify( "out_of_water" );
        }
    }
}

_id_A24E()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( level._id_511D ) && level._id_511D && _func_1FF( var_0 ) && isdefined( var_0._id_494C ) && var_0._id_494C == "Quad" && !isdefined( var_0._id_4FAD ) )
            var_0 thread _id_497C( self );

        if ( !_func_1AD( var_0 ) && !_func_0CF( var_0 ) )
            continue;

        if ( !_func_1A1( var_0 ) )
            continue;

        if ( !isdefined( var_0._id_4FAD ) )
        {
            var_0 _id_6C05( 1 );
            var_0 thread _id_6CD1( self );
        }
    }
}

_id_497C( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    _id_6C05( 1 );

    for (;;)
    {
        if ( !_id_4E85( var_0, 40 ) )
        {
            wait 2.5;

            if ( !_id_4E85( var_0, 20 ) )
                self _meth_8053( self._id_01E6, self._id_02E2 );
        }

        waittillframeend;
    }
}

_id_6CD1( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    thread _id_4FAE( var_0 );
    thread _id_6D92();
    self._id_35B3 = 0;
    self._id_35B2 = 0;

    for (;;)
    {
        if ( maps\mp\_utility::_id_51E3() )
        {
            if ( isdefined( self._id_9A04 ) && isdefined( self._id_519F ) )
            {
                self _meth_8188();
                self._id_519F = undefined;
            }
        }
        else if ( isdefined( self._id_9A04 ) && !isdefined( self._id_519F ) )
        {
            self _meth_8186( "underwater", 19, 0, 0 );
            self._id_519F = 1;
        }

        if ( !self _meth_80AB( var_0 ) )
        {
            _id_6C05( 0 );
            self._id_9A04 = undefined;
            self._id_4EC2 = undefined;
            self._id_51C4 = undefined;
            self._id_5F7B = level._id_1317;
            maps\mp\gametypes\_weapons::_id_9B3D();
            self notify( "out_of_water" );
            break;
        }

        if ( isdefined( self._id_4EC2 ) && _id_4E85( var_0, 32 ) )
        {
            self._id_4EC2 = undefined;
            self._id_5F7B = level._id_1317;
            maps\mp\gametypes\_weapons::_id_9B3D();
        }

        if ( _id_4E85( var_0, 32 ) )
        {
            self._id_4EC2 = undefined;

            if ( isdefined( level.watermovescale ) )
                self._id_5F7B = level._id_1317 * level.watermovescale;
            else
                self._id_5F7B = level._id_1317;

            maps\mp\gametypes\_weapons::_id_9B3D();
        }

        if ( !isdefined( self._id_4EC2 ) && !_id_4E85( var_0, 32 ) )
        {
            self._id_4EC2 = 1;
            self._id_5F7B = 0.7 * level._id_1317;
            maps\mp\gametypes\_weapons::_id_9B3D();
        }

        if ( !isdefined( self._id_9A04 ) && !_id_50A5( var_0, 0 ) )
        {
            self._id_9A04 = 1;
            thread _id_6CB9();

            if ( maps\mp\_utility::_id_50C4() )
                _id_2B0F();

            if ( !maps\mp\_utility::_id_51E3() )
            {
                self _meth_8186( "underwater", 19, 0, 0 );
                self._id_519F = 1;
            }

            var_1 = self _meth_830E();

            if ( var_1 != "none" )
            {
                var_2 = _func_1E4( var_1 );

                if ( var_2 == "primary" || var_2 == "altmode" )
                    self._id_A27B = var_1;
                else if ( isdefined( self._id_55C6 ) && self _meth_8311( self._id_55C6 ) )
                    self._id_A27B = self._id_55C6;
            }

            if ( isdefined( level._id_3BF7 ) )
                self [[ level._id_3BF7 ]]( var_0 );

            if ( isdefined( level.hordeonunderwater ) )
                self [[ level.hordeonunderwater ]]( var_0 );
        }

        if ( isdefined( self._id_9A04 ) && ( isdefined( self._id_51C4 ) || !isdefined( self._id_5201 ) ) && ( _id_4E85( var_0, level._id_9074 ) || self _meth_8180() == "prone" || !level._id_0A9D ) )
        {
            self._id_5201 = 1;
            self._id_51C4 = undefined;
            _id_6C8D();

            if ( isdefined( self._id_5131 ) && self._id_5131 == 1 )
            {
                _id_6C9A( "none" );
                self _meth_8133( 0 );
                self _meth_84BB();
            }
            else if ( !isdefined( level.iszombiegame ) || !_func_2E1( self ) )
                _id_6C9A( "shallow" );
        }

        if ( isdefined( self._id_9A04 ) && ( isdefined( self._id_5201 ) || !isdefined( self._id_51C4 ) ) && ( !_id_4E85( var_0, level._id_9074 ) && self _meth_8180() != "prone" && level._id_0A9D ) )
        {
            self._id_51C4 = 1;
            self._id_5201 = undefined;
            _id_6C8D();

            if ( isdefined( self._id_5131 ) && self._id_5131 == 1 )
            {
                _id_6C9A( "none" );
                self _meth_8133( 0 );
                self _meth_84BB();
            }
            else if ( !isdefined( level.iszombiegame ) || !_func_2E1( self ) )
                _id_6C9A( "deep" );
        }

        if ( isdefined( self._id_9A04 ) && _id_50A5( var_0, 0 ) )
        {
            self._id_9A04 = undefined;
            self._id_51C4 = undefined;
            self._id_5201 = undefined;
            self notify( "above_water" );
            var_3 = _func_0EE( self _meth_8336(), ( 0, 0, 0 ) );
            var_4 = ( self._id_02E2[0], self._id_02E2[1], _id_415F( var_0 ) );
            playfx( level._id_058F["water_splash_emerge"], var_4, anglestoforward( ( 0, self.angles[1], 0 ) + ( 270, 180, 0 ) ) );

            if ( !maps\mp\_utility::_id_51E3() )
            {
                self _meth_8188();
                self._id_519F = undefined;
            }

            _id_6C8D();

            if ( maps\mp\_utility::_id_50C4() )
                _id_310E();
        }

        wait 0.05;
    }
}

_id_50A7( var_0 )
{
    if ( isdefined( var_0._id_539D ) )
    {
        var_1 = self._id_0308["killstreaks"][self._id_539D]._id_8F26;

        if ( isdefined( var_1 ) )
        {
            if ( common_scripts\utility::_id_8F55( var_1, "turret" ) > 0 )
                return 1;
        }
    }

    return 0;
}

_id_6D92()
{
    var_0 = common_scripts\utility::_id_A070( "death", "out_of_water" );
    self._id_9A21 = undefined;
    self._id_2D21 = undefined;
    _id_6C05( 0 );
    self._id_9A04 = undefined;
    self._id_4EC2 = undefined;
    self._id_A27B = undefined;
    self._id_5F7B = level._id_1317;
    maps\mp\gametypes\_weapons::_id_9B3D();
}

_id_4FAE( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "out_of_water" );
    var_1 = _func_0EE( self _meth_8336(), ( 0, 0, 0 ) );

    if ( var_1 > 90 )
    {
        var_2 = ( self._id_02E2[0], self._id_02E2[1], _id_415F( var_0 ) );
        playfx( level._id_058F["water_splash_enter"], var_2, anglestoforward( ( 0, self.angles[1], 0 ) + ( 270, 180, 0 ) ) );
    }

    for (;;)
    {
        var_3 = self _meth_8336();
        var_1 = _func_0EE( var_3, ( 0, 0, 0 ) );

        if ( var_1 > 0 )
            wait(_func_0E1( 1 - var_1 / 120, 0.1 ));
        else
            wait 0.3;

        if ( var_1 > 5 )
        {
            var_4 = _func_114( ( var_3[0], var_3[1], 0 ) );
            var_5 = anglestoforward( _func_115( var_4 ) + ( 270, 180, 0 ) );
            var_2 = ( self._id_02E2[0], self._id_02E2[1], _id_415F( var_0 ) ) + var_1 / 4 * var_4;
            playfx( level._id_058F["water_wake"], var_2, var_5 );
            continue;
        }

        var_2 = ( self._id_02E2[0], self._id_02E2[1], _id_415F( var_0 ) );
        playfx( level._id_058F["water_wake_stationary"], var_2, anglestoforward( ( 0, self.angles[1], 0 ) + ( 270, 180, 0 ) ) );
    }
}

_id_6CB9()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stopped_using_remote" );
    self endon( "disconnect" );
    self endon( "above_water" );

    if ( isdefined( level._id_511D ) && level._id_511D )
        self endon( "becameSpectator" );

    thread _id_64D2();
    wait 13;

    for (;;)
    {
        if ( !isdefined( self._id_5131 ) || self._id_5131 == 0 )
            _func_189( self._id_02E2 + anglestoforward( self.angles ) * 5, 1, 20, 20, undefined, "MOD_TRIGGER_HURT" );

        wait 1;
    }
}

_id_64D2()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "above_water" );

    if ( isdefined( level._id_511D ) && level._id_511D )
        common_scripts\utility::_id_A069( "death", "becameSpectator" );
    else
        self waittill( "death" );

    _id_6C05( 0 );
    self._id_9A04 = undefined;
    self._id_4EC2 = undefined;
    self._id_51C4 = undefined;
    self._id_5201 = undefined;
    self._id_A27B = undefined;
    self._id_9A21 = undefined;
    self._id_35B2 = 0;
    self._id_35B3 = 0;
}

_id_4E85( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 32;

    if ( level _id_415F( var_0 ) - self._id_02E2[2] <= var_1 )
        return 1;

    return 0;
}

_id_50A5( var_0, var_1 )
{
    if ( _id_408A() + var_1 >= level _id_415F( var_0 ) )
        return 1;
    else
        return 0;
}

_id_408A()
{
    var_0 = self _meth_80AA();
    self._id_35B2 = var_0[2] - self._id_35B3;
    self._id_35B3 = var_0[2];
    return var_0[2];
}

_id_415F( var_0 )
{
    var_1 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );
    var_2 = var_1._id_02E2[2];
    return var_2;
}

_id_6C9A( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "end_swimming" );

    if ( !isdefined( var_0 ) )
        var_0 = "shallow";

    if ( var_0 == "shallow" && self _meth_8311( level._id_83B2 ) || var_0 == "deep" && self _meth_8311( level._id_2764 ) )
        self._id_2D21 = 1;

    switch ( var_0 )
    {
        case "deep":
            _id_41DA( level._id_2764 );
            self _meth_8313( level._id_2764 );
            self._id_9A21 = "deep";
            break;
        case "shallow":
            _id_41DA( level._id_83B2 );
            self _meth_8313( level._id_83B2 );
            self._id_9A21 = "shallow";
            break;
        case "none":
            self._id_9A21 = "none";
            break;
        default:
            _id_41DA( level._id_83B2 );
            self _meth_8313( level._id_83B2 );
            self._id_9A21 = "shallow";
            break;
    }

    self _meth_82C7();
    common_scripts\utility::_id_0588();
    common_scripts\utility::_id_0585();
}

_id_6C8D()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( self._id_9A21 ) )
    {
        var_0 = self._id_9A21;
        self notify( "end_swimming" );
        self _meth_82C8();
        common_scripts\utility::_id_0596();
        common_scripts\utility::_id_0593();

        if ( isdefined( self._id_5131 ) && self._id_5131 == 1 && isdefined( self._id_479B ) )
        {
            self _meth_8133( 1 );

            if ( !isdefined( self._id_479B._id_4736 ) || self._id_479B._id_4736 == 0 )
                self _meth_831C();

            if ( !isdefined( self._id_479B._id_4742 ) || self._id_479B._id_4742 == 0 )
                self _meth_84BB();
            else
                self _meth_84BC();
        }

        if ( isdefined( level._id_511D ) && _func_1AD( self ) )
            maps\mp\gametypes\_weapons::_id_74B3( "underwater" );
        else if ( isdefined( self._id_A27B ) )
            maps\mp\_utility::_id_907A( self._id_A27B );

        switch ( var_0 )
        {
            case "deep":
                _id_911D( level._id_2764 );
                break;
            case "shallow":
                _id_911D( level._id_83B2 );
                break;
            case "none":
                break;
            default:
                _id_911D( level._id_83B2 );
                break;
        }

        self._id_9A21 = undefined;
        self._id_2D21 = undefined;
    }
}

_id_41DA( var_0 )
{
    if ( !isdefined( self._id_2D21 ) || !self._id_2D21 )
        self _meth_830B( var_0 );
}

_id_911D( var_0 )
{
    if ( !isdefined( self._id_2D21 ) || !self._id_2D21 )
        self _meth_830C( var_0 );
}

_id_310E()
{
    maps\mp\_utility::_id_6C62( 1 );
    maps\mp\_utility::_id_6C63( 1 );
    maps\mp\_utility::_id_6C60( 1 );
    maps\mp\_utility::_id_6C64( 1 );
    maps\mp\_utility::_id_6C61( 1 );
}

_id_2B0F()
{
    maps\mp\_utility::_id_6C62( 0 );
    maps\mp\_utility::_id_6C63( 0 );
    maps\mp\_utility::_id_6C60( 0 );
    maps\mp\_utility::_id_6C64( 0 );
    maps\mp\_utility::_id_6C61( 0 );
}

_id_8006( var_0 )
{
    level._id_83B2 = var_0;
}

_id_7F45( var_0 )
{
    level._id_2764 = var_0;
}

_id_51FB( var_0 )
{
    switch ( var_0 )
    {
        case "iw5_combatknife_mp":
        case "iw5_underwater_mp":
        case "none":
            return 1;
        default:
            return 0;
    }
}

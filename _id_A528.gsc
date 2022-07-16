// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_058F["c4_light_blink"] = loadfx( "vfx/lights/light_c4_blink" );
    level._id_058F["claymore_laser"] = loadfx( "vfx/props/claymore_laser" );

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
        level._id_0323[var_0] thread _id_A232();
}

_id_A232()
{
    level._id_1974 = 0;
    self endon( "death" );
    self._id_196D = [];
    self._id_933E = 0;
    thread _id_A203();
    thread _id_A206();
    thread _id_A20A();
    thread _id_138D();
    thread _id_137B();

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );
        self._id_933E = 1;

        if ( var_0 == "c4" )
        {
            _id_1397();
            continue;
        }

        if ( var_0 == "smoke_grenade_american" )
        {
            _id_13A0();
            continue;
        }

        _id_139C();
    }
}

_id_13A0()
{
    self waittill( "grenade_fire", var_0, var_1 );

    if ( !isdefined( level._id_8684 ) )
        level._id_8684 = 0;

    var_0 thread _id_8681();
}

_id_139B()
{
    self._id_933E = 0;
    var_0 = gettime();
    self waittill( "grenade_fire", var_1, var_2 );

    if ( isdefined( var_1 ) )
    {
        var_3 = gettime();
        var_4 = var_3 - var_0;

        if ( var_4 >= 1250 )
        {
            var_1 waittill( "explode", var_5 );

            if ( _func_1CA( "null" ) )
                thread common_scripts\utility::_id_69C2( "null", var_5 );

            _func_189( var_5, 96, 300, 200, self, "MOD_UNKNOWN", "flash_grenade" );
        }
    }
}

_id_138D()
{
    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "semtex_grenade" )
        {
            thread _id_94B2( var_0 );
            var_0 thread _id_7C7B( self );
        }
    }
}

_id_94B2( var_0 )
{
    self._id_933E = 0;

    if ( !isdefined( level._id_933F ) )
        level._id_933F = 1;
    else
        level._id_933F++;

    var_0 waittill( "death" );
    waitframe;
    level._id_933F--;
}

_id_7C7B( var_0 )
{
    self waittill( "missile_stuck", var_1 );

    if ( !isdefined( var_1 ) )
        return;

    if ( var_1.code_classname != "script_vehicle" )
        return;

    var_1._id_46FD = 1;
    self waittill( "explode" );

    if ( !isdefined( var_1 ) || !_func_1A1( var_1 ) )
        return;

    if ( var_1 _id_A5A8::_id_5031() || var_1 _id_A5AA::_id_0E29( var_0 ) )
    {
        var_1._id_46FD = undefined;
        return;
    }

    var_1 _meth_8054( var_1._id_02E2, var_0 );
}

_id_137B()
{
    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "concussion_grenade" )
            thread _id_94A1( var_0 );
    }
}

_id_94A1( var_0 )
{
    self._id_933E = 0;
    var_0 waittill( "death" );
    _id_A5A4::_id_8643( 0.1 );
    _id_A5A4::_id_8644( 0.25 );
    _id_A5A4::_id_8645( 1 );
    _id_A5A4::_id_8646( 0.25 );
    _id_A5A4::_id_8640();
    setdvar( "noflash", "1" );
    wait 0.05;
    setdvar( "noflash", "0" );
    wait 2.0;
    _id_A5A4::_id_8641();
}

_id_8681()
{
    level._id_8684++;
    wait 50;
    level._id_8684--;
}

_id_139C()
{
    self endon( "death" );
    self waittill( "grenade_fire", var_0, var_1 );

    if ( var_1 == "fraggrenade" )
        var_0 thread _id_A5A4::_id_43E9();
    else if ( var_1 == "ninebang_grenade" )
        self._id_9336 = 1;

    self._id_933E = 0;
}

_id_1397()
{
    self endon( "death" );
    common_scripts\utility::_id_A069( "grenade_fire", "weapon_change" );
    self._id_933E = 0;
}

_id_A203()
{
    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "c4" )
        {
            if ( !self._id_196D.size )
                thread _id_A204();

            self._id_196D[self._id_196D.size] = var_0;
            var_0._id_02E5 = self;
            var_0 thread _id_196E();
            thread _id_196F( var_0 );
            var_0 thread _id_6A35();
        }
    }
}

_id_196F( var_0 )
{
    var_0 waittill( "death" );
    self._id_196D = _id_A5A4::_id_0CFB( self._id_196D, var_0 );
}

_id_A20A()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "claymore" || var_1 == "claymore_mp" )
        {
            var_0._id_02E5 = self;
            var_0 thread _id_196E( 1 );
            var_0 thread _id_1E48();
            var_0 thread _id_6A36();
        }
    }
}

_id_1E49( var_0 )
{
    self endon( "death" );
    wait 1;

    if ( isdefined( level._id_1E4B ) )
    {
        self thread [[ level._id_1E4B ]]( var_0 );
        return;
    }

    self _meth_813B( var_0, 1 );
    self.attackeraccuracy = 2;
    self._id_0275 = 750;
    self._id_04B1 = -1000;
}

_id_1E48()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    var_0 = 192;

    if ( isdefined( self._id_29B3 ) )
        var_0 = self._id_29B3;

    var_1 = spawn( "trigger_radius", self._id_02E2 + ( 0, 0, 0 - var_0 ), 9, var_0, var_0 * 2 );
    thread _id_285A( var_1 );

    if ( !isdefined( level._id_1E4A ) )
        level._id_1E4A = [];

    level._id_1E4A = common_scripts\utility::_id_0CDA( level._id_1E4A, self );

    if ( !_id_A5A4::_id_5083() && level._id_1E4A.size > 15 )
        level._id_1E4A[0] delete();

    for (;;)
    {
        var_1 waittill( "trigger", var_2 );

        if ( isdefined( self._id_02E5 ) && var_2 == self._id_02E5 )
            continue;

        if ( _func_1AD( var_2 ) )
            continue;

        if ( var_2 _meth_81DA( self._id_02E2, self ) > 0 )
        {
            self _meth_809C( "claymore_activated_SP" );
            wait 0.4;

            if ( isdefined( self._id_02E5 ) )
                self _meth_81D9( self._id_02E5 );
            else
                self _meth_81D9( undefined );

            return;
        }
    }
}

_id_285A( var_0 )
{
    self waittill( "death" );
    level._id_1E4A = _id_A5A4::_id_0CFB( level._id_1E4A, self );
    wait 0.05;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_A206()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "detonate" );
        var_0 = self _meth_830E();

        if ( var_0 == "c4" )
        {
            for ( var_1 = 0; var_1 < self._id_196D.size; var_1++ )
            {
                if ( isdefined( self._id_196D[var_1] ) )
                    self._id_196D[var_1] thread _id_A006( 0.1 );
            }

            self._id_196D = [];
        }
    }
}

_id_A205()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "alt_detonate" );
        var_0 = self _meth_830E();

        if ( var_0 != "c4" )
        {
            var_1 = [];

            for ( var_2 = 0; var_2 < self._id_196D.size; var_2++ )
            {
                var_3 = self._id_196D[var_2];

                if ( isdefined( self._id_196D[var_2] ) )
                    var_3 thread _id_A006( 0.1 );
            }

            self._id_196D = var_1;
            self notify( "detonated" );
        }
    }
}

_id_A006( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self _meth_81D9();
}

_id_196E( var_0 )
{
    self._id_01E6 = 100;
    self _meth_82BC( 1 );
    self._id_0271 = 100000;
    self._id_01E6 = self._id_0271;
    var_1 = undefined;

    for (;;)
    {
        self waittill( "damage", var_2, var_1 );
        break;
    }

    self _meth_809C( "claymore_activated_SP" );

    if ( level._id_1974 )
        wait(0.1 + _func_0B3( 0.4 ));
    else
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    level._id_1974 = 1;

    if ( isdefined( var_0 ) && var_0 && _func_1AD( var_1 ) )
        level.claymoreexplodethisframe_byplayer = 1;

    thread _id_7447();

    if ( _func_1AD( var_1 ) )
        self _meth_81D9( var_1 );
    else
        self _meth_81D9();
}

_id_7447()
{
    wait 0.05;
    level._id_1974 = 0;
    level.claymoreexplodethisframe_byplayer = 0;
}

_id_7823( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 60; var_2++ )
        wait 0.05;
}

_id_6A35()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    playfxontag( common_scripts\utility::_id_3FA8( "c4_light_blink" ), self, "tag_fx" );
}

_id_6A36()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    playfxontag( common_scripts\utility::_id_3FA8( "claymore_laser" ), self, "tag_fx" );
}

_id_1EEE( var_0 )
{
    self waittill( "death" );
    var_0 delete();
}

_id_3F48( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    for ( var_5 = 0; var_5 < level._id_0323.size; var_5++ )
    {
        if ( !_func_1A1( level._id_0323[var_5] ) || level._id_0323[var_5]._id_03BC != "playing" )
            continue;

        var_6 = level._id_0323[var_5]._id_02E2 + ( 0, 0, 32 );
        var_7 = _func_0EE( var_0, var_6 );

        if ( var_7 < var_1 && ( !var_2 || _id_A2D6( var_0, var_6, var_3, undefined ) ) )
        {
            var_8 = spawnstruct();
            var_8._id_5175 = 1;
            var_8._id_50A8 = 0;
            var_8._id_0151 = level._id_0323[var_5];
            var_8._id_258F = var_6;
            var_4[var_4.size] = var_8;
        }
    }

    var_9 = getentarray( "grenade", "classname" );

    for ( var_5 = 0; var_5 < var_9.size; var_5++ )
    {
        var_10 = var_9[var_5]._id_02E2;
        var_7 = _func_0EE( var_0, var_10 );

        if ( var_7 < var_1 && ( !var_2 || _id_A2D6( var_0, var_10, var_3, var_9[var_5] ) ) )
        {
            var_8 = spawnstruct();
            var_8._id_5175 = 0;
            var_8._id_50A8 = 0;
            var_8._id_0151 = var_9[var_5];
            var_8._id_258F = var_10;
            var_4[var_4.size] = var_8;
        }
    }

    var_11 = getentarray( "destructable", "targetname" );

    for ( var_5 = 0; var_5 < var_11.size; var_5++ )
    {
        var_10 = var_11[var_5]._id_02E2;
        var_7 = _func_0EE( var_0, var_10 );

        if ( var_7 < var_1 && ( !var_2 || _id_A2D6( var_0, var_10, var_3, var_11[var_5] ) ) )
        {
            var_8 = spawnstruct();
            var_8._id_5175 = 0;
            var_8._id_50A8 = 1;
            var_8._id_0151 = var_11[var_5];
            var_8._id_258F = var_10;
            var_4[var_4.size] = var_8;
        }
    }

    return var_4;
}

_id_A2D6( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = var_1 - var_0;

    if ( _func_0F3( var_5 ) < var_2 * var_2 )
        var_4 = var_1;

    var_6 = _func_114( var_5 );
    var_4 = var_0 + ( var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2 );
    var_7 = _func_06B( var_4, var_1, 0, var_3 );

    if ( getdvarint( "scr_damage_debug" ) != 0 )
    {
        if ( var_7["fraction"] == 1 )
            thread _id_2729( var_4, var_1, ( 1, 1, 1 ) );
        else
        {
            thread _id_2729( var_4, var_7["position"], ( 1, 0.9, 0.8 ) );
            thread _id_2729( var_7["position"], var_1, ( 1, 0.4, 0.3 ) );
        }
    }

    return var_7["fraction"] == 1;
}

_id_259B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( self._id_5175 )
    {
        self._id_25A8 = var_5;
        self._id_0151 thread [[ level._id_19FE ]]( var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0 );
    }
    else
    {
        if ( self._id_50A8 && ( var_4 == "artillery_mp" || var_4 == "claymore_mp" ) )
            return;

        self._id_0151 notify( "damage", var_2, var_1 );
    }
}

_id_2729( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < 600; var_3++ )
        wait 0.05;
}

_id_64FD( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    switch ( var_1 )
    {
        case "concussion_grenade_mp":
            var_4 = 512;
            var_5 = 1 - _func_0EE( self._id_02E2, var_0._id_02E2 ) / var_4;
            var_6 = 1 + 4 * var_5;
            wait 0.05;
            self _meth_8186( "concussion_grenade_mp", var_6 );
            break;
        default:
            break;
    }
}

_id_A204()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "detonated" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( self _meth_8339() )
        {
            var_0 = 0;

            while ( self _meth_8339() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self _meth_8339() && var_0 < 0.5 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            if ( !self._id_196D.size )
                return;

            self notify( "alt_detonate" );
        }

        wait 0.05;
    }
}

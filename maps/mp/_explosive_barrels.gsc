// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = 0;
    precacheitem( "barrel_mp" );
    var_1 = getentarray( "explodable_barrel", "targetname" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        var_0 = 1;

    if ( var_0 )
    {
        level._id_17DD["barrel"]["explode"] = loadfx( "fx/props/barrelExp" );
        level._id_17DD["barrel"]["burn_start"] = loadfx( "vfx/map/mp_citystreets/barrel_ignite_01" );
        level._id_17DD["barrel"]["burn"] = loadfx( "vfx/map/mp_citystreets/barrel_fire_top_01" );
    }

    var_2 = getentarray( "oil_spill", "targetname" );

    if ( isdefined( var_2 ) && var_2.size > 0 )
    {
        level._id_17DD["oilspill"]["burn"] = loadfx( "fx/props/barrel_fire" );
        level._id_17DD["oilspill"]["spark"] = loadfx( "fx/impacts/small_metalhit_1" );
    }

    level._id_12E8 = "h1_redbarrel_exp";
    level.barrelhealth = 150;
    var_3 = 25;
    level.precachemodeltype = [];
    level.barrelexplodingthisframe = 0;
    level.breakables_clip = [];
    var_4 = getentarray( "breakable clip", "targetname" );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        level.breakables_clip[level.breakables_clip.size] = var_4[var_5];

    level._breakable_utility_modelarray = [];
    level._breakable_utility_modelindex = 0;
    level._breakable_utility_maxnum = var_3;
    common_scripts\utility::_id_0D13( getentarray( "explodable_barrel", "targetname" ), ::explodable_barrel_think );
    common_scripts\utility::_id_0D13( getentarray( "oil_spill", "targetname" ), ::oil_spill_think );
}

oil_spill_think()
{
    self._id_311C = _id_40FB( self._id_04A4, "targetname" );
    self._id_8B20 = _id_40FB( self._id_311C._id_04A4, "targetname" );
    self._id_12E4 = getclosestent( self._id_8B20._id_02E2, getentarray( "explodable_barrel", "targetname" ) );
    self.extra = getent( self._id_04A4, "targetname" );
    self _meth_82BC( 1 );

    if ( isdefined( self._id_12E4 ) )
    {
        self._id_12E4.oilspill = 1;
        thread oil_spill_burn_after();
    }

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        self._id_25A9 = var_0;
        playfx( level._id_17DD["oilspill"]["spark"], var_3, var_2 );
        thread oil_spill_burn_section( var_3 );
        thread oil_spill_burn( var_3, self._id_8B20._id_02E2 );
        thread oil_spill_burn( var_3, self._id_311C._id_02E2 );
        break;
    }

    if ( isdefined( self._id_12E4 ) )
        self._id_12E4 waittill( "exploding" );

    self.extra delete();
    self _meth_8056();
    wait 10;
    self delete();
}

getclosestent( var_0, var_1 )
{
    if ( var_1.size < 1 )
        return;

    var_2 = 256;
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = _func_0EE( var_1[var_4] _meth_8097(), var_0 );

        if ( var_5 >= var_2 )
            continue;

        var_2 = var_5;
        var_3 = var_1[var_4];
    }

    return var_3;
}

oil_spill_burn_after()
{
    for (;;)
    {
        self._id_12E4 waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        break;
    }

    self._id_25A9 = var_1;

    if ( !isdefined( self._id_25A9 ) )
        self _meth_81D8( self._id_02E2, 4, 10, 10 );
    else
        self _meth_81D8( self._id_02E2, 4, 10, 10, self._id_25A9 );
}

oil_spill_burn( var_0, var_1 )
{
    var_2 = _func_114( var_1 - var_0 );
    var_3 = _func_0EE( var_0, var_1 );
    var_4 = 8;
    var_5 = var_2 * var_4;
    var_6 = _func_115( var_2 );
    var_7 = anglestoright( var_6 );
    var_8 = getentarray( "explodable_barrel", "targetname" );
    var_9 = 484;
    var_10 = spawn( "script_origin", var_0 );
    var_10 _meth_8056();
    var_11 = 0;

    for (;;)
    {
        var_3 -= var_4;

        if ( var_3 < var_4 * 0.1 )
            break;

        var_0 += ( var_5 + var_7 * _func_0B5( -6, 6 ) );
        thread oil_spill_burn_section( var_0 );
        var_11++;

        if ( var_11 == 4 )
            var_11 = 0;

        var_10._id_02E2 = var_0;
        var_12 = [];
        var_8 = common_scripts\utility::_id_0D01( var_8 );

        for ( var_13 = 0; var_13 < var_8.size; var_13++ )
        {
            var_14 = anglestoup( var_8[var_13].angles );
            var_15 = var_8[var_13]._id_02E2 + var_14 * 22;
            var_16 = _func_08F( var_15, var_15 + ( 0, 0, -64 ) );

            if ( _func_0F0( var_0, var_16 ) < var_9 )
            {
                var_12[var_12.size] = var_8[var_13];
                var_17 = 80 + _func_0B3( 10 );

                if ( !isdefined( self._id_25A9 ) )
                    self _meth_81D8( var_8[var_13]._id_02E2, 4, var_17, var_17 );
                else
                    self _meth_81D8( var_8[var_13]._id_02E2, 4, var_17, var_17, self._id_25A9 );
            }
        }

        for ( var_13 = 0; var_13 < var_12.size; var_13++ )
            var_8 = common_scripts\utility::_id_0CF6( var_8, var_12[var_13] );

        wait 0.1;
    }

    if ( !isdefined( self._id_12E4 ) )
        return;

    if ( _func_0EE( var_0, self._id_8B20._id_02E2 ) < 32 )
    {
        var_17 = 80 + _func_0B3( 10 );

        if ( !isdefined( self._id_25A9 ) )
            self _meth_81D8( self._id_12E4._id_02E2, 4, var_17, var_17 );
        else
            self _meth_81D8( self._id_12E4._id_02E2, 4, var_17, var_17, self._id_25A9 );
    }
}

oil_spill_burn_section( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    playfx( level._id_17DD["oilspill"]["burn"], var_0 );

    while ( var_2 < 5 )
    {
        if ( !isdefined( self._id_25A9 ) )
            self _meth_81D8( var_0, 32, 5, 1 );
        else
            self _meth_81D8( var_0, 32, 5, 1, self._id_25A9 );

        var_2 += 1;
        wait 1;
    }
}

explodable_barrel_think()
{
    if ( self.classname != "script_model" )
        return;

    if ( !isdefined( level.precachemodeltype["com_barrel_benzin"] ) )
    {
        level.precachemodeltype["com_barrel_benzin"] = 1;
        precachemodel( "com_barrel_piece" );
        precachemodel( "com_barrel_piece2" );
    }

    self endon( "exploding" );
    breakable_clip();
    self._id_0101 = 0;
    self _meth_82BC( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        self.damagetype = var_4;
        self._id_25A9 = var_1;

        if ( level.barrelexplodingthisframe )
            wait(_func_0B3( 1 ));

        self._id_0101 += var_0;

        if ( self._id_0101 == var_0 )
            thread explodable_barrel_burn();
    }
}

explodable_barrel_burn()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = anglestoup( self.angles );
    var_3 = anglestoup( ( 0, 90, 0 ) );
    var_4 = _func_0F6( var_2, var_3 );
    var_5 = ( 0, 0, 0 );
    var_6 = var_2 * 44;

    if ( var_4 < 0.5 )
    {
        var_5 = var_2 * 22 - ( 0, 0, 30 );
        var_6 = var_2 * 22 + ( 0, 0, 14 );
    }

    if ( self.damagetype != "MOD_GRENADE_SPLASH" && self.damagetype != "MOD_GRENADE" )
    {
        while ( self._id_0101 < level.barrelhealth )
        {
            if ( !var_1 )
            {
                playfx( level._id_17DD["barrel"]["burn_start"], self._id_02E2 + var_5 );
                var_1 = 1;
            }

            if ( var_0 > 20 )
                var_0 = 0;

            playfx( level._id_17DD["barrel"]["burn"], self._id_02E2 + var_6 );

            if ( var_0 == 0 )
                self._id_0101 += ( 10 + _func_0B3( 10 ) );

            var_0++;
            wait 0.05;
        }
    }

    thread explodable_barrel_explode();
}

explodable_barrel_explode()
{
    self notify( "exploding" );
    self notify( "death" );
    var_0 = anglestoup( self.angles );
    var_1 = anglestoup( ( 0, 90, 0 ) );
    var_2 = _func_0F6( var_0, var_1 );
    var_3 = ( 0, 0, 0 );

    if ( var_2 < 0.5 )
    {
        var_4 = self._id_02E2 + var_0 * 22;
        var_5 = _func_08F( var_4, var_4 + ( 0, 0, -64 ) );
        var_3 = var_5 - self._id_02E2;
    }

    var_3 += ( 0, 0, 4 );
    self _meth_809C( level._id_12E8 );
    playfx( level._id_17DD["barrel"]["explode"], self._id_02E2 + var_3 );
    level.barrelexplodingthisframe = 1;

    if ( isdefined( self.remove ) )
        self.remove delete();

    var_6 = 2;
    var_7 = 1;
    var_8 = 250;
    var_9 = 250;

    if ( isdefined( self._id_0351 ) )
        var_9 = self._id_0351;

    if ( !isdefined( self._id_25A9 ) )
        self _meth_81D8( self._id_02E2 + ( 0, 0, 30 ), var_9, var_8, var_7, undefined, "MOD_EXPLOSIVE", "barrel_mp" );
    else
        self _meth_81D8( self._id_02E2 + ( 0, 0, 30 ), var_9, var_8, var_7, self._id_25A9, "MOD_EXPLOSIVE", "barrel_mp" );

    _func_17E( self._id_02E2 + ( 0, 0, 30 ), var_9, var_9 / 2, var_6 );
    maps\mp\gametypes\_shellshock::_id_12E5();

    if ( _func_0B2( 2 ) == 0 )
        self _meth_80B3( "com_barrel_piece" );
    else
        self _meth_80B3( "com_barrel_piece2" );

    self _meth_82BC( 0 );

    if ( var_2 < 0.5 )
    {
        var_4 = self._id_02E2 + var_0 * 22;
        var_10 = _func_08F( var_4, var_4 + ( 0, 0, -64 ) );
        self._id_02E2 = var_10;
        self.angles += ( 0, 0, 90 );
    }

    wait 0.05;
    level.barrelexplodingthisframe = 0;
}

_id_40FB( var_0, var_1 )
{
    if ( !isdefined( level._id_8F64 ) )
        return undefined;

    var_2 = level._id_8F64[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return undefined;

    if ( var_2.size > 1 )
        return undefined;

    return var_2[0];
}

breakable_clip()
{
    if ( isdefined( self._id_04A4 ) )
    {
        var_0 = getent( self._id_04A4, "targetname" );

        if ( var_0.classname == "script_brushmodel" )
        {
            self.remove = var_0;
            return;
        }
    }

    if ( isdefined( level.breakables_clip ) && level.breakables_clip.size > 0 )
        self.remove = getclosestent( self._id_02E2, level.breakables_clip );

    if ( isdefined( self.remove ) )
        level.breakables_clip = common_scripts\utility::_id_0CF6( level.breakables_clip, self.remove );
}

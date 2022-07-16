// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_293C = 50;
    level._id_293B = [];
    _id_3763();
}

_id_2906( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_0117 ) )
        level._id_0117 = [];

    var_5 = level._id_0117.size;
    var_5 = level._id_0117.size;
    level._id_0117[var_5] = spawnstruct();
    level._id_0117[var_5]._id_9C42["type"] = var_0;
    level._id_0117[var_5]._id_66A7 = [];
    level._id_0117[var_5]._id_66A7[0][0] = spawnstruct();
    level._id_0117[var_5]._id_66A7[0][0]._id_9C42["modelName"] = self._id_029C;
    level._id_0117[var_5]._id_66A7[0][0]._id_9C42["health"] = var_1;
    level._id_0117[var_5]._id_66A7[0][0]._id_9C42["validAttackers"] = var_2;
    level._id_0117[var_5]._id_66A7[0][0]._id_9C42["validDamageZone"] = var_3;
    level._id_0117[var_5]._id_66A7[0][0]._id_9C42["validDamageCause"] = var_4;
    level._id_0117[var_5]._id_66A7[0][0]._id_9C42["godModeAllowed"] = 1;
}

_id_2924( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = level._id_0117.size - 1;
    var_11 = level._id_0117[var_10]._id_66A7.size;
    var_12 = 0;
    _id_291E( var_11, var_12, var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_2931( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = level._id_0117.size - 1;
    var_8 = level._id_0117[var_7]._id_66A7.size - 1;
    var_9 = level._id_0117[var_7]._id_66A7[var_8].size;
    _id_291E( var_8, var_9, var_0, var_1, var_2, var_3, var_4, var_5, undefined, undefined, var_6 );
}

_id_2912( var_0, var_1, var_2 )
{
    var_1 = try_override_destructible_fx( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = level._id_0117.size - 1;
    var_4 = level._id_0117[var_3]._id_66A7.size - 1;
    var_5 = level._id_0117[var_3]._id_66A7[var_4].size - 1;
    level._id_0117[var_3]._id_66A7[var_4][var_5]._id_9C42["fx_filename"] = var_1;
    level._id_0117[var_3]._id_66A7[var_4][var_5]._id_9C42["fx_tag"] = var_0;
    level._id_0117[var_3]._id_66A7[var_4][var_5]._id_9C42["fx_useTagAngles"] = var_2;
}

_id_2920( var_0, var_1, var_2 )
{
    var_1 = try_override_destructible_fx( var_1 );
    var_3 = level._id_0117.size - 1;
    var_4 = level._id_0117[var_3]._id_66A7.size - 1;
    var_5 = level._id_0117[var_3]._id_66A7[var_4].size - 1;
    level._id_0117[var_3]._id_66A7[var_4][var_5]._id_9C42["loopfx_filename"] = var_1;
    level._id_0117[var_3]._id_66A7[var_4][var_5]._id_9C42["loopfx_tag"] = var_0;
    level._id_0117[var_3]._id_66A7[var_4][var_5]._id_9C42["loopfx_rate"] = var_2;
}

try_override_destructible_fx( var_0 )
{
    if ( !isdefined( level.destructible_effect_override ) )
        return var_0;

    var_1 = _func_1D3( level.destructible_effect_override );

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return level.destructible_effect_override[var_3];
    }

    return var_0;
}

_id_291D( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_0117.size - 1;
    var_5 = level._id_0117[var_4]._id_66A7.size - 1;
    var_6 = level._id_0117[var_4]._id_66A7[var_5].size - 1;
    level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["healthdrain_amount"] = var_0;
    level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["healthdrain_interval"] = var_1;
    level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["badplace_radius"] = var_2;
    level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["badplace_team"] = var_3;
}

_id_292A( var_0, var_1 )
{
    var_2 = level._id_0117.size - 1;
    var_3 = level._id_0117[var_2]._id_66A7.size - 1;
    var_4 = level._id_0117[var_2]._id_66A7[var_3].size - 1;

    if ( !isdefined( level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["sound"] ) )
    {
        level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["sound"] = [];
        level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["soundCause"] = [];
    }

    var_5 = level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["sound"].size;
    level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["sound"][var_5] = var_0;
    level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["soundCause"][var_5] = var_1;
}

_id_2921( var_0, var_1 )
{
    var_2 = level._id_0117.size - 1;
    var_3 = level._id_0117[var_2]._id_66A7.size - 1;
    var_4 = level._id_0117[var_2]._id_66A7[var_3].size - 1;

    if ( !isdefined( level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["loopsound"] ) )
    {
        level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["loopsound"] = [];
        level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["loopsoundCause"] = [];
    }

    var_5 = level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["loopsound"].size;
    level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["loopsound"][var_5] = var_0;
    level._id_0117[var_2]._id_66A7[var_3][var_4]._id_9C42["loopsoundCause"][var_5] = var_1;
}

_id_28FA( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_0117.size - 1;
    var_5 = level._id_0117[var_4]._id_66A7.size - 1;
    var_6 = level._id_0117[var_4]._id_66A7[var_5].size - 1;

    if ( !isdefined( var_3 ) )
    {
        level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["anim"] = var_0;
        level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["animTree"] = var_1;
        level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["animType"] = var_2;
    }
    else
    {
        level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["partAnim"] = var_0;
        level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["partAnimTree"] = var_1;
        level._id_0117[var_4]._id_66A7[var_5][var_6]._id_9C42["partAnimType"] = var_2;
    }
}

_id_2926()
{
    var_0 = level._id_0117.size - 1;
    var_1 = level._id_0117[var_0]._id_66A7.size - 1;
    var_2 = level._id_0117[var_0]._id_66A7[var_1].size - 1;
    level._id_0117[var_0]._id_66A7[var_1][var_2]._id_9C42["physics"] = 1;
}

_id_290D( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_0117.size - 1;
    var_6 = level._id_0117[var_5]._id_66A7.size - 1;
    var_7 = level._id_0117[var_5]._id_66A7[var_6].size - 1;
    level._id_0117[var_5]._id_66A7[var_6][var_7]._id_9C42["explode_force_min"] = var_0;
    level._id_0117[var_5]._id_66A7[var_6][var_7]._id_9C42["explode_force_max"] = var_1;
    level._id_0117[var_5]._id_66A7[var_6][var_7]._id_9C42["explode_range"] = var_2;
    level._id_0117[var_5]._id_66A7[var_6][var_7]._id_9C42["explode_mindamage"] = var_3;
    level._id_0117[var_5]._id_66A7[var_6][var_7]._id_9C42["explode_maxdamage"] = var_4;
}

_id_291E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = level._id_0117.size - 1;
    level._id_0117[var_12]._id_66A7[var_0][var_1] = spawnstruct();
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["modelName"] = var_3;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["tagName"] = var_2;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["health"] = var_4;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["validAttackers"] = var_5;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["validDamageZone"] = var_6;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["validDamageCause"] = var_7;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["alsoDamageParent"] = var_8;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["physicsOnExplosion"] = var_9;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["grenadeImpactDeath"] = var_10;
    level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["godModeAllowed"] = 0;

    if ( !isdefined( var_11 ) )
        level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["createEntityForAnimation"] = 0;
    else
        level._id_0117[var_12]._id_66A7[var_0][var_1]._id_9C42["createEntityForAnimation"] = var_11;
}

_id_3763()
{
    common_scripts\utility::_id_0D13( getentarray( "destructible", "targetname" ), ::_id_80B1 );
}

_id_6EBB()
{
    if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7 ) )
    {
        for ( var_0 = 0; var_0 < level._id_0117[self.destuctableinfo]._id_66A7.size; var_0++ )
        {
            for ( var_1 = 0; var_1 < level._id_0117[self.destuctableinfo]._id_66A7[var_0].size; var_1++ )
            {
                if ( level._id_0117[self.destuctableinfo]._id_66A7[var_0].size <= var_1 )
                    continue;

                if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["modelName"] ) )
                    precachemodel( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["modelName"] );

                if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["fx_filename"] ) )
                    level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["fx"] = loadfx( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["fx_filename"] );

                if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["loopfx_filename"] ) )
                    level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["loopfx"] = loadfx( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["loopfx_filename"] );
            }
        }
    }
}

_id_80B1( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = undefined;
    self._id_5D41 = 0;
    _id_074B();
    self.destuctableinfo = common_scripts\_destructible_types::maketype( self._id_0117 );

    if ( !var_0 )
        _id_6EBB();

    if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7 ) )
    {
        self._id_2925 = [];

        for ( var_2 = 0; var_2 < level._id_0117[self.destuctableinfo]._id_66A7.size; var_2++ )
        {
            self._id_2925[var_2] = spawnstruct();
            self._id_2925[var_2]._id_9C42["currentState"] = 0;

            if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_2][0]._id_9C42["health"] ) )
                self._id_2925[var_2]._id_9C42["health"] = level._id_0117[self.destuctableinfo]._id_66A7[var_2][0]._id_9C42["health"];

            if ( var_2 == 0 )
                continue;

            var_3 = level._id_0117[self.destuctableinfo]._id_66A7[var_2][0]._id_9C42["modelName"];
            var_4 = level._id_0117[self.destuctableinfo]._id_66A7[var_2][0]._id_9C42["tagName"];
            self _meth_801D( var_3, var_4 );

            if ( self._id_5D41 )
                self._id_5D40 _meth_801D( var_3, var_4 );
        }
    }

    if ( self.classname != "script_vehicle" )
        self _meth_82BC( 1 );

    thread setup_destructible_entities();
    thread _id_2150();
    thread _id_2932();
}

_id_074B()
{
    self._id_6AC2 = 0;
    self._id_614F = 0;
    self._id_1B69 = 1;
}

_id_2932()
{
    self endon( "stop_taking_damage" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 <= 0 )
            continue;

        var_4 = _id_3F4C( var_4 );

        if ( var_5 == "" )
            var_5 = self._id_029C;

        if ( isdefined( var_6 ) && var_6 == "" )
            var_6 = undefined;

        if ( var_4 == "splash" )
        {
            _id_292C( _func_0BC( var_0 ), var_3, var_2, var_1, var_4 );
            continue;
        }

        thread _id_2936( _func_0BC( var_0 ), var_5, var_6, var_3, var_2, var_1, var_4 );
    }
}

_id_2936( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( self._id_2925 ) )
        return;

    if ( self._id_2925.size == 0 )
        return;

    var_7 = -1;
    var_8 = -1;

    if ( _func_123( var_1 ) == _func_123( self._id_029C ) && !isdefined( var_2 ) )
    {
        var_1 = self._id_029C;
        var_2 = undefined;
        var_7 = 0;
        var_8 = 0;
    }

    for ( var_9 = 0; var_9 < level._id_0117[self.destuctableinfo]._id_66A7.size; var_9++ )
    {
        var_8 = self._id_2925[var_9]._id_9C42["currentState"];

        if ( level._id_0117[self.destuctableinfo]._id_66A7[var_9].size <= var_8 )
            continue;

        if ( !isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_9][var_8]._id_9C42["modelName"] ) )
            continue;

        if ( _func_123( level._id_0117[self.destuctableinfo]._id_66A7[var_9][var_8]._id_9C42["modelName"] ) == _func_123( var_1 ) )
        {
            if ( level._id_0117[self.destuctableinfo]._id_66A7[var_9][var_8]._id_9C42["tagName"] == var_2 )
            {
                var_7 = var_9;
                break;
            }
        }
    }

    if ( var_7 < 0 )
        return;

    var_10 = var_8;
    var_11 = 0;
    var_12 = 0;

    for (;;)
    {
        var_8 = self._id_2925[var_7]._id_9C42["currentState"];

        if ( !isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8] ) )
            break;

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][0]._id_9C42["alsoDamageParent"] ) )
        {
            if ( _id_3F4C( var_6 ) != "splash" )
            {
                var_13 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][0]._id_9C42["alsoDamageParent"];
                var_14 = _func_0BC( var_0 * var_13 );
                thread _id_6229( var_14, var_5, var_4, var_3, var_6, "", "" );
            }
        }

        if ( !isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["health"] ) )
            break;

        if ( !isdefined( self._id_2925[var_7]._id_9C42["health"] ) )
            break;

        if ( var_11 )
            self._id_2925[var_7]._id_9C42["health"] = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["health"];

        var_11 = 0;

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["grenadeImpactDeath"] ) && var_6 == "impact" )
            var_0 = 100000000;

        var_15 = _id_50C1( var_7, var_8, var_5 );

        if ( var_15 )
        {
            var_16 = _id_51E9( var_7, var_8, var_6 );

            if ( var_16 )
            {
                if ( var_5 == level._id_0318 )
                    self._id_6AC2 += var_0;
                else if ( var_5 != self )
                    self._id_614F += var_0;

                self._id_2925[var_7]._id_9C42["health"] -= var_0;
            }
        }

        if ( self._id_2925[var_7]._id_9C42["health"] > 0 )
            return;

        var_0 = _func_0BC( _func_0BE( self._id_2925[var_7]._id_9C42["health"] ) );

        if ( var_0 < 0 )
            return;

        self._id_2925[var_7]._id_9C42["currentState"]++;
        var_8 = self._id_2925[var_7]._id_9C42["currentState"];
        var_17 = var_8 - 1;

        if ( !isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17] ) )
            return;

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["explode_force_min"] ) )
            self._id_353D = 1;

        if ( isdefined( self._id_588C ) && isdefined( self._id_588C[_id_A5A4::_id_8F53( var_7 )] ) )
        {
            for ( var_9 = 0; var_9 < self._id_588C[_id_A5A4::_id_8F53( var_7 )].size; var_9++ )
            {
                self notify( self._id_588C[_id_A5A4::_id_8F53( var_7 )][var_9] );

                if ( self._id_5D41 )
                    self._id_5D40 notify( self._id_588C[_id_A5A4::_id_8F53( var_7 )][var_9] );
            }

            self._id_588C[_id_A5A4::_id_8F53( var_7 )] = undefined;
        }

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8] ) )
        {
            if ( var_7 == 0 )
            {
                var_18 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["modelName"];
                self _meth_80B3( var_18 );

                if ( self._id_5D41 )
                    self._id_5D40 _meth_80B3( var_18 );
            }
            else
            {
                self _meth_802A( var_1, var_2 );

                if ( self._id_5D41 )
                    self._id_5D40 _meth_802A( var_1, var_2 );

                var_1 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["modelName"];
                var_2 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["tagName"];

                if ( isdefined( var_1 ) && isdefined( var_2 ) )
                {
                    if ( self._id_5D41 )
                        self._id_5D40 _meth_801D( var_1, var_2 );

                    self _meth_801D( var_1, var_2 );
                }
            }
        }

        var_19 = _id_3D4B();

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["fx"] ) )
        {
            var_20 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["fx"];

            if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["fx_tag"] ) )
            {
                var_21 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["fx_tag"];
                self notify( "FX_State_Change" + var_7 );

                if ( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["fx_useTagAngles"] )
                {
                    if ( delayvfxonmultipleframes( var_19 ) )
                    {
                        if ( !isdefined( self.playingfxpartscount ) )
                            self.playingfxpartscount = 0;

                        if ( self.playingfxpartscount < 3 )
                            destructible_playfxontag_internal( var_20, var_19, var_21 );
                        else
                        {
                            while ( self.playingfxpartscount >= 3 )
                                wait 0.05;

                            destructible_playfxontag_internal( var_20, var_19, var_21 );
                        }
                    }
                    else
                        playfxontag( var_20, var_19, var_21 );
                }
                else
                {
                    var_22 = var_19 _meth_8184( var_21 );
                    var_23 = var_22 + ( 0, 0, 100 ) - var_22;
                    playfx( var_20, var_22, var_23 );
                }
            }
            else
            {
                var_22 = var_19._id_02E2;
                var_23 = var_22 + ( 0, 0, 100 ) - var_22;
                playfx( var_20, var_22, var_23 );
            }
        }

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["loopfx"] ) )
        {
            var_24 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["loopfx"];
            var_25 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["loopfx_tag"];
            var_26 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["loopfx_rate"];
            self notify( "FX_State_Change" + var_7 );
            thread _id_587D( var_24, var_25, var_26, var_7 );
        }

        if ( !isdefined( self._id_3527 ) )
        {
            if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["anim"] ) )
            {
                var_27 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["anim"];
                var_28 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["animTree"];
                var_19 _meth_8117( var_28 );
                var_29 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["animType"];

                if ( !isdefined( self._id_0C7B ) )
                    self._id_0C7B = [];

                self._id_0C7B[self._id_0C7B.size] = var_27;

                if ( isdefined( self._id_353D ) )
                {
                    if ( isdefined( self._id_0C7B ) )
                    {
                        for ( var_9 = 0; var_9 < self._id_0C7B.size; var_9++ )
                            var_19 _meth_8144( self._id_0C7B[var_9], 0 );
                    }
                }

                if ( var_29 == "setanim" )
                    var_19 _meth_814D( var_27, 1.0, 1.0, 1.0 );
                else if ( var_29 == "setanimknob" )
                    var_19 _meth_8145( var_27, 1.0, 1.0, 1.0 );
                else
                {

                }
            }
        }

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["createEntityForAnimation"] ) && level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["createEntityForAnimation"] && !isdefined( self._id_3527 ) )
        {
            var_30 = createentity( var_7, var_17, self.destuctableinfo );

            if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["partAnim"] ) )
            {
                var_27 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["partAnim"];
                var_28 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["partAnimTree"];
                var_30 _meth_8117( var_28 );
                var_29 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["partAnimType"];

                if ( !isdefined( self._id_0C7B ) )
                    self._id_0C7B = [];

                self._id_0C7B[self._id_0C7B.size] = var_27;

                if ( isdefined( self._id_353D ) && isdefined( self._id_0C7B ) )
                {
                    for ( var_9 = 0; var_9 < self._id_0C7B.size; var_9++ )
                        var_30 _meth_8144( self._id_0C7B[var_9], 0 );
                }

                if ( var_29 == "setanim" )
                    var_30 _meth_814D( var_27, 1.0, 1.0, 1.0 );
                else if ( var_29 == "setanimknob" )
                    var_30 _meth_8145( var_27, 1.0, 1.0, 1.0 );
                else
                {

                }
            }
        }

        if ( !isdefined( self._id_3527 ) )
        {
            if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["sound"] ) )
            {
                for ( var_9 = 0; var_9 < level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["sound"].size; var_9++ )
                {
                    var_31 = _id_51F6( "soundCause", var_7, var_17, var_9, var_6 );

                    if ( var_31 )
                    {
                        var_32 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["sound"][var_9];
                        var_33 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["tagName"];
                        var_19 thread _id_A5A4::_id_69C5( var_32, var_33 );
                    }
                }
            }
        }

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["loopsound"] ) )
        {
            for ( var_9 = 0; var_9 < level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["loopsound"].size; var_9++ )
            {
                var_31 = _id_51F6( "loopsoundCause", var_7, var_17, var_9, var_6 );

                if ( var_31 )
                {
                    var_34 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["loopsound"][var_9];
                    var_35 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["tagName"];
                    thread _id_6974( var_34, var_35 );

                    if ( !isdefined( self._id_588C ) )
                        self._id_588C = [];

                    if ( !isdefined( self._id_588C[_id_A5A4::_id_8F53( var_7 )] ) )
                        self._id_588C[_id_A5A4::_id_8F53( var_7 )] = [];

                    var_36 = self._id_588C[_id_A5A4::_id_8F53( var_7 )].size;
                    self._id_588C[_id_A5A4::_id_8F53( var_7 )][var_36] = "stop sound" + var_34;
                }
            }
        }

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["healthdrain_amount"] ) )
        {
            self notify( "Health_Drain_State_Change" + var_7 );
            var_37 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["healthdrain_amount"];
            var_38 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["healthdrain_interval"];
            var_39 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["modelName"];
            var_40 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["tagName"];
            var_41 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["badplace_radius"];
            var_42 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["badplace_team"];

            if ( var_37 > 0 )
                thread _id_4781( var_37, var_38, var_7, var_39, var_40, var_41, var_42 );
        }

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["explode_force_min"] ) )
        {
            var_12 = 1;
            var_43 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["explode_force_min"];
            var_44 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["explode_force_max"];
            var_45 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["explode_range"];
            var_46 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["explode_mindamage"];
            var_47 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["explode_maxdamage"];

            if ( isdefined( var_5 ) && var_5 != self )
                self.attacker = var_5;

            thread _id_0163( var_7, var_43, var_44, var_45, var_46, var_47 );
        }

        if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_17]._id_9C42["physics"] ) )
        {
            var_48 = var_3;
            var_49 = ( 0, 0, 0 );

            if ( isdefined( var_5 ) )
            {
                var_49 = var_5._id_02E2;

                if ( var_5 == level._id_0318 )
                    var_49 = level._id_0318 _meth_80AA();

                var_48 = _func_114( var_3 - var_49 );
                var_48 = _id_A5A4::vector_multiply( var_48, 200 );
            }

            thread _id_67FD( var_7, var_17, var_3, var_48 );
            return;
        }

        var_11 = 1;
    }
}

delayvfxonmultipleframes( var_0 )
{
    return var_0._id_029C == "vehicle_uaz_hardtop_dsr" && level._id_038E == "icbm";
}

reduceplayingcount( var_0 )
{
    wait(var_0);
    self.playingfxpartscount--;
}

destructible_playfxontag_internal( var_0, var_1, var_2 )
{
    self.playingfxpartscount++;
    playfxontag( var_0, var_1, var_2 );
    thread reduceplayingcount( 0.05 );
}

_id_292C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_0 <= 0 )
        return;

    var_5 = [];
    var_6 = undefined;

    if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7 ) )
    {
        for ( var_7 = 0; var_7 < level._id_0117[self.destuctableinfo]._id_66A7.size; var_7++ )
        {
            for ( var_8 = 0; var_8 < level._id_0117[self.destuctableinfo]._id_66A7[var_7].size; var_8++ )
            {
                if ( level._id_0117[self.destuctableinfo]._id_66A7[var_7].size <= var_8 )
                    continue;

                if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["modelName"] ) )
                {
                    var_9 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["modelName"];

                    if ( var_7 == 0 )
                    {
                        var_10 = _func_0EE( var_1, self._id_02E2 );
                        var_11 = undefined;
                    }
                    else
                    {
                        var_11 = level._id_0117[self.destuctableinfo]._id_66A7[var_7][var_8]._id_9C42["tagName"];
                        var_10 = _func_0EE( var_1, self _meth_8184( var_11 ) );
                    }

                    if ( !isdefined( var_6 ) || var_10 < var_6 )
                        var_6 = var_10;

                    var_12 = var_5.size;
                    var_5[var_12] = spawnstruct();
                    var_5[var_12]._id_9C42["modelName"] = var_9;
                    var_5[var_12]._id_9C42["tagName"] = var_11;
                    var_5[var_12]._id_9C42["distance"] = var_10;
                }
            }
        }
    }

    if ( !isdefined( var_6 ) )
        return;

    if ( var_6 < 0 )
        return;

    if ( var_5.size <= 0 )
        return;

    for ( var_7 = 0; var_7 < var_5.size; var_7++ )
    {
        var_13 = var_5[var_7]._id_9C42["distance"] * 1.4;
        var_14 = var_0 - ( var_13 - var_6 );

        if ( var_14 <= 0 )
            continue;

        thread _id_2936( var_14, var_5[var_7]._id_9C42["modelName"], var_5[var_7]._id_9C42["tagName"], var_1, var_2, var_3, var_4 );
    }
}

_id_51F6( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_0117[self.destuctableinfo]._id_66A7[var_1][var_2]._id_9C42[var_0][var_3];

    if ( !isdefined( var_5 ) )
        return 1;

    if ( var_5 == var_4 )
        return 1;

    return 0;
}

_id_50C1( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_39BE ) )
        return 1;

    if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["explode_force_min"] ) )
    {
        if ( isdefined( self._id_2D2A ) )
            return 0;
    }

    if ( !isdefined( var_2 ) )
        return 1;

    if ( var_2 == self )
        return 1;

    var_3 = level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["validAttackers"];

    if ( !isdefined( var_3 ) )
        return 1;

    if ( var_3 == "no_player" )
    {
        if ( var_2 != level._id_0318 )
            return 1;
    }
    else if ( var_3 == "player_only" )
    {
        if ( var_2 == level._id_0318 )
            return 1;
    }
    else if ( var_3 == "no_ai" )
    {
        if ( !_func_0CF( var_2 ) )
            return 1;
    }
    else if ( var_3 == "ai_only" )
    {
        if ( _func_0CF( var_2 ) )
            return 1;
    }
    else
    {

    }

    return 0;
}

_id_51E9( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        return 1;

    var_3 = level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["godModeAllowed"];

    if ( var_3 && ( isdefined( self._id_4257 ) && self._id_4257 || isdefined( self._id_7965 ) && self._id_7965 && var_2 == "bullet" ) )
        return 0;

    var_4 = level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42["validDamageCause"];

    if ( !isdefined( var_4 ) )
        return 1;

    if ( var_4 == "no_melee" && var_2 == "melee" )
        return 0;

    return 1;
}

_id_3F4C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    var_0 = _func_123( var_0 );

    switch ( var_0 )
    {
        case "melee":
        case "mod_melee":
        case "mod_crush":
            return "melee";
        case "mod_pistol_bullet":
        case "mod_rifle_bullet":
        case "bullet":
            return "bullet";
        case "mod_grenade":
        case "mod_grenade_splash":
        case "mod_projectile":
        case "mod_projectile_splash":
        case "mod_explosive":
        case "splash":
            return "splash";
        case "mod_impact":
            return "impact";
        case "unknown":
            return "unknown";
        default:
            return "unknown";
    }
}

_id_587D( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3D4B();
    self endon( "FX_State_Change" + var_3 );
    self endon( "delete_destructible" );
    level endon( "putout_fires" );

    for (;;)
    {
        var_4 = _id_3D4B();
        playfxontag( var_0, var_4, var_1 );
        wait(var_2);
    }
}

_id_4781( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "Health_Drain_State_Change" + var_2 );
    level endon( "putout_fires" );
    wait(var_1);
    self._id_4788 = 1;
    var_7 = undefined;

    if ( isdefined( var_5 ) && isdefined( var_6 ) )
    {
        var_7 = "" + gettime();

        if ( !isdefined( self._id_2AF5 ) )
        {
            if ( var_6 == "both" )
                badplace_cylinder( var_7, 0, self._id_02E2, var_5, 128, "allies", "axis" );
            else
                badplace_cylinder( var_7, 0, self._id_02E2, var_5, 128, var_6 );
        }
    }

    while ( self._id_2925[var_2]._id_9C42["health"] > 0 )
    {
        self notify( "damage", var_0, self, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_UNKNOWN", var_3, var_4 );
        wait(var_1);
    }

    if ( isdefined( var_5 ) && isdefined( var_6 ) )
        badplace_delete( var_7 );
}

_id_67FD( var_0, var_1, var_2, var_3 )
{
    var_4 = get_model_from_part( var_0, var_1 );
    var_5 = get_last_model_from_part( var_0 );
    var_6 = get_tag_from_part( var_0, var_1 );

    if ( !ismodelattached( var_4, var_6 ) )
        return;

    self _meth_802A( var_4, var_6 );

    if ( self._id_5D41 )
        self._id_5D40 _meth_802A( var_4, var_6 );

    if ( level._id_293B.size >= level._id_293C )
        _id_6800( level._id_293B[0] );

    var_7 = spawn( "script_model", self _meth_8184( var_6 ) );
    var_7.angles = self _meth_8185( var_6 );
    var_7 _meth_80B3( var_5 );
    level._id_293B[level._id_293B.size] = var_7;
    var_7 _meth_82BE( var_2, var_3 );
}

_id_6800( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_293B.size; var_2++ )
    {
        if ( level._id_293B[var_2] == var_0 )
            continue;

        var_1[var_1.size] = level._id_293B[var_2];
    }

    level._id_293B = var_1;
    var_0 delete();
}

createentity( var_0, var_1, var_2 )
{
    var_3 = get_model_from_part( var_0, var_1 );
    var_4 = get_last_model_from_part( var_0 );
    var_5 = get_tag_from_part( var_0, var_1 );

    if ( !ismodelattached( var_3, var_5 ) )
        return;

    self _meth_802A( var_3, var_5 );

    if ( self._id_5D41 )
        self._id_5D40 _meth_802A( var_3, var_5 );

    var_6 = spawn( "script_model", self _meth_8184( var_5 ) );
    var_6.angles = self _meth_8185( var_5 );
    var_6 _meth_80B3( var_4 );
    var_6 _meth_804F( self );

    if ( !isdefined( self.partsspawnedents ) )
        self.partsspawnedents = [];

    self.partsspawnedents[self.partsspawnedents.size] = var_6;
    return var_6;
}

_id_0163( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( self._id_3527 ) )
        return;

    self._id_3527 = 1;

    if ( self.classname == "script_vehicle" || self.code_classname == "script_vehicle" )
        self notify( "death" );

    thread _id_2B3A();
    thread destroy_destructible_entities();
    wait 0.05;
    var_6 = level._id_0117[self.destuctableinfo]._id_66A7[var_0][self._id_2925[var_0]._id_9C42["currentState"]]._id_9C42["tagName"];

    if ( isdefined( var_6 ) )
        var_7 = self _meth_8184( var_6 );
    else
        var_7 = self._id_02E2;

    self notify( "damage", var_5, self, ( 0, 0, 0 ), var_7, "MOD_EXPLOSIVE", "", "" );
    waitframe;

    if ( isdefined( self.partsspawnedents ) )
    {
        foreach ( var_9 in self.partsspawnedents )
            var_9 delete();
    }

    if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7 ) )
    {
        for ( var_11 = level._id_0117[self.destuctableinfo]._id_66A7.size - 1; var_11 >= 0; var_11-- )
        {
            if ( var_11 == var_0 )
                continue;

            var_12 = self._id_2925[var_11]._id_9C42["currentState"];

            if ( var_12 >= level._id_0117[self.destuctableinfo]._id_66A7[var_11].size )
                var_12 = level._id_0117[self.destuctableinfo]._id_66A7[var_11].size - 1;

            var_13 = get_model_from_part( var_11, var_12 );
            var_6 = get_tag_from_part( var_11, var_12 );

            if ( !isdefined( var_13 ) )
                continue;

            if ( !isdefined( var_6 ) )
                continue;

            if ( !ismodelattached( var_13, var_6 ) )
                continue;

            if ( part_has_physics_exposion( var_11 ) )
            {
                apply_physics_explosion_to_part( var_11, var_12, var_6, var_7, var_1, var_2 );
                continue;
            }

            self _meth_802A( var_13, var_6 );

            if ( self._id_5D41 )
                self._id_5D40 _meth_802A( var_13, var_6 );
        }
    }

    self notify( "stop_taking_damage" );
    wait 0.05;
    var_14 = var_7 + ( 0, 0, 80 );

    if ( _func_122( level._id_0117[self.destuctableinfo]._id_9C42["type"], 0, 7 ) == "vehicle" )
    {
        anim._id_5583 = gettime();
        anim._id_5580 = var_14;
        anim._id_5581 = var_7;
        anim._id_5582 = var_3;
    }

    self _meth_81D8( var_14, var_3, var_5, var_4, self );

    if ( arcademode_car_kill() )
        thread maps\_arcademode::arcademode_add_points( self._id_02E2, 1, "explosive", 200 );

    self notify( "destroyed" );
}

arcademode_car_kill()
{
    if ( !_id_A5A4::_id_0CC3() )
        return 0;

    if ( level._id_038E == "ac130" )
        return 0;

    if ( isdefined( level.allcarsdamagedbyplayer ) )
        return 1;

    return _id_A537::_id_6ACA();
}

get_destructible_index( var_0, var_1, var_2 )
{
    if ( var_1 >= 0 )
        return level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_1]._id_9C42[var_2];
    else if ( var_1 == -1 )
    {
        var_3 = undefined;

        for ( var_4 = 0; var_4 < level._id_0117[self.destuctableinfo]._id_66A7[var_0].size; var_4++ )
        {
            if ( isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_4]._id_9C42[var_2] ) )
                var_3 = level._id_0117[self.destuctableinfo]._id_66A7[var_0][var_4]._id_9C42[var_2];
        }

        return var_3;
    }
}

get_tag_from_part( var_0, var_1 )
{
    return get_destructible_index( var_0, var_1, "tagName" );
}

get_model_from_part( var_0, var_1 )
{
    return get_destructible_index( var_0, var_1, "modelName" );
}

get_last_model_from_part( var_0 )
{
    return get_destructible_index( var_0, -1, "modelName" );
}

apply_physics_explosion_to_part( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = level._id_0117[self.destuctableinfo]._id_66A7[var_0][0]._id_9C42["physicsOnExplosion"];
    var_7 = self _meth_8184( var_2 );
    var_8 = _func_114( var_7 - var_3 );
    var_8 = _id_A5A4::vector_multiply( var_8, _func_0B5( var_4, var_5 ) * var_6 );
    thread _id_67FD( var_0, var_1, var_7, var_8 );
}

part_has_physics_exposion( var_0 )
{
    if ( !isdefined( level._id_0117[self.destuctableinfo]._id_66A7[var_0][0]._id_9C42["physicsOnExplosion"] ) )
        return 0;

    return level._id_0117[self.destuctableinfo]._id_66A7[var_0][0]._id_9C42["physicsOnExplosion"] > 0;
}

ismodelattached( var_0, var_1 )
{
    var_2 = 0;
    var_0 = _func_123( var_0 );
    var_1 = _func_123( var_1 );

    if ( !isdefined( var_1 ) )
        return var_2;

    var_3 = self _meth_802C();
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3; var_5++ )
        var_4[var_5] = _func_123( self _meth_802D( var_5 ) );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( var_4[var_5] != var_0 )
            continue;

        var_6 = _func_123( self _meth_802E( var_5 ) );

        if ( var_1 != var_6 )
            continue;

        var_2 = 1;
        break;
    }

    return var_2;
}

_id_6974( var_0, var_1 )
{
    var_2 = _id_3D4B();
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( isdefined( var_1 ) )
        var_3._id_02E2 = var_2 _meth_8184( var_1 );
    else
        var_3._id_02E2 = var_2._id_02E2;

    if ( _func_1CA( var_0 ) )
        var_3 _meth_8077( var_0 );
    else
    {

    }

    var_2 thread _id_39A7( var_0 );
    var_2 waittill( "stop sound" + var_0 );
    var_3 _meth_80AD( var_0 );
    var_3 delete();
}

_id_39A7( var_0 )
{
    self endon( "stop sound" + var_0 );
    level waittill( "putout_fires" );
    self notify( "stop sound" + var_0 );
}

_id_6229( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( level._id_6229 ) )
        return;

    level._id_6229 = 1;
    waitframe;

    if ( isdefined( self._id_3527 ) )
    {
        level._id_6229 = undefined;
        return;
    }

    self notify( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    level._id_6229 = undefined;
}

_id_3D4B()
{
    if ( self._id_5D41 )
        var_0 = self._id_5D40;
    else
        var_0 = self;

    return var_0;
}

_id_2AA1()
{
    self._id_2D2A = 1;
}

_id_3995()
{
    self._id_2D2A = undefined;
    self._id_39BE = 1;
    self notify( "damage", 1000000000, self, self._id_02E2, self._id_02E2, "MOD_EXPLOSIVE", "", "" );
}

_id_3EA1()
{
    if ( !isdefined( self._id_04A4 ) )
        return undefined;

    var_0 = getent( self._id_04A4, "targetname" );

    if ( !isdefined( var_0 ) )
        return undefined;

    if ( !var_0._id_03DA & 1 )
        return undefined;

    return var_0;
}

_id_2150()
{
    var_0 = _id_3EA1();

    if ( !isdefined( var_0 ) )
        return;

    var_0 _meth_805A();
    var_0._id_02E2 -= ( 0, 0, 10000 );
}

_id_2B3A()
{
    var_0 = _id_3EA1();

    if ( !isdefined( var_0 ) )
        return;

    var_0._id_02E2 += ( 0, 0, 10000 );
    var_0 _meth_8059();
    var_0._id_02E2 -= ( 0, 0, 10000 );
}

setup_destructible_entities()
{
    var_0 = common_scripts\utility::_id_3DBD();

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_0398 ) )
            continue;

        switch ( var_2._id_0398 )
        {
            case "destroyed":
                var_2._id_02E2 -= ( 0, 0, 10000 );
                continue;
        }
    }
}

destroy_destructible_entities()
{
    var_0 = common_scripts\utility::_id_3DBD();

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_0398 ) )
            continue;

        switch ( var_2._id_0398 )
        {
            case "destructible":
                var_2 delete();
                continue;
            case "destroyed":
                var_2._id_02E2 += ( 0, 0, 10000 );
                continue;
        }
    }
}

_id_2904()
{

}

_id_2914( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{

}

_id_292D( var_0 )
{

}

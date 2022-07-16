// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    bot_koth_start();
}

bot_koth_start()
{
    setup_bot_koth();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::bot_koth_think;
    level._id_161B["should_start_cautious_approach"] = ::should_start_cautious_approach_koth;
}

setup_bot_koth()
{
    maps\mp\bots\_bots_util::_id_172D();
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.radios.size; var_1++ )
    {
        var_2 = level.radios[var_1];
        var_2._id_0394 = "radio_" + var_1;
        var_2 thread maps\mp\bots\_bots_gametype_common::_id_5E23();
        var_3 = 0;

        if ( isdefined( var_2._id_9754._id_97CC ) && var_2._id_9754._id_97CC )
        {
            var_2._id_9754 common_scripts\utility::_id_97CE();
            var_3 = 1;
        }

        var_4 = 0;

        if ( !var_2._id_9E5A )
        {
            var_2 maps\mp\gametypes\koth::makeradiovisible();
            var_4 = 1;
        }

        var_2._id_6139 = maps\mp\bots\_bots_gametype_common::bot_get_valid_nodes_in_trigger( var_2._id_9754 );

        if ( var_3 )
            var_2._id_9754 common_scripts\utility::_id_97CC();

        if ( var_4 )
            var_2 maps\mp\gametypes\koth::makeradioinvisible();
    }

    level.bot_set_zone_nodes = 1;

    if ( !var_0 )
    {
        var_5 = find_current_radio();

        if ( !isdefined( var_5 ) )
            var_5 = common_scripts\utility::_id_710E( level.radios );

        maps\mp\bots\_bots_gametype_common::bot_cache_entrances_to_zones( [ var_5 ] );
        level.bot_gametype_radios_precached[var_5 _meth_81B5()] = 1;
        level._id_1628 = 1;
        thread bot_cache_entrances_to_other_radios( var_5 );
    }
}

bot_cache_entrances_to_other_radios( var_0 )
{
    for ( var_1 = common_scripts\utility::_id_0CF6( level.radios, var_0 ); var_1.size > 0; var_1 = common_scripts\utility::_id_0CF6( var_1, var_2 ) )
    {
        var_2 = undefined;
        var_3 = find_current_radio();

        if ( isdefined( var_3 ) && common_scripts\utility::_id_0CE4( var_1, var_3 ) )
            var_2 = var_3;
        else
            var_2 = common_scripts\utility::_id_710E( var_1 );

        maps\mp\bots\_bots_gametype_common::bot_cache_entrances_to_zones( [ var_2 ] );
        level.bot_gametype_radios_precached[var_2 _meth_81B5()] = 1;
    }
}

bot_koth_think()
{
    self notify( "bot_koth_think" );
    self endon( "bot_koth_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    self _meth_834F( "separation", 0 );
    self _meth_834F( "grenade_objectives", 1 );

    for (;;)
    {
        wait 0.05;

        if ( self._id_01E6 <= 0 )
            continue;

        var_0 = find_current_radio();

        if ( !isdefined( var_0 ) || !isdefined( level.bot_gametype_radios_precached[var_0 _meth_81B5()] ) )
        {
            bot_clear_koth_zone();
            self [[ self._id_67E1 ]]();
            continue;
        }

        var_1 = level.radioobject maps\mp\gametypes\_gameobjects::_id_4078();

        if ( self._id_04A7 != var_1 )
        {
            if ( !bot_is_capturing_koth_zone( var_0 ) )
                bot_capture_koth_zone( var_0 );

            continue;
        }

        var_2 = common_scripts\utility::_id_3D4F( self._id_04A7 );
        var_3 = level.radioobject._id_940D[var_2].size > 0;

        if ( var_3 )
        {
            if ( !bot_is_capturing_koth_zone( var_0 ) )
                bot_capture_koth_zone( var_0 );

            continue;
        }

        if ( !bot_is_protecting_koth_zone( var_0 ) )
        {
            if ( bot_is_capturing_koth_zone( var_0 ) )
            {
                wait(_func_0B3( 2 ));
                bot_clear_koth_zone();
                continue;
            }

            bot_protect_koth_zone( var_0 );
        }
    }
}

find_current_radio()
{
    foreach ( var_1 in level.radios )
    {
        if ( isdefined( level.radioobject ) && var_1._id_9754 == level.radioobject._id_04C5 )
            return var_1;
    }
}

bot_is_capturing_koth_zone( var_0 )
{
    if ( !maps\mp\bots\_bots_util::_id_165A() )
        return 0;

    return isdefined( self._id_2507 ) && self._id_2507 == var_0;
}

bot_is_protecting_koth_zone( var_0 )
{
    if ( !maps\mp\bots\_bots_util::_id_1662() )
        return 0;

    return isdefined( self._id_2507 ) && self._id_2507 == var_0;
}

bot_capture_koth_zone( var_0 )
{
    self._id_2507 = var_0;
    var_1["entrance_points_index"] = var_0._id_3320;
    var_1["override_origin_node"] = var_0._id_1C10;
    maps\mp\bots\_bots_strategy::_id_15D2( var_0._id_02E2, var_0._id_6139, var_0._id_9754, var_1 );
}

bot_protect_koth_zone( var_0 )
{
    self._id_2507 = var_0;
    var_1 = _func_0F1( var_0._id_A3E0._id_44FB ) * 2;
    var_2["override_origin_node"] = var_0._id_1C10;
    maps\mp\bots\_bots_strategy::_id_16C2( var_0._id_1C10._id_02E2, var_1, var_2 );
}

bot_clear_koth_zone()
{
    if ( maps\mp\bots\_bots_util::_id_165D() )
        maps\mp\bots\_bots_strategy::_id_15EF();

    self._id_2507 = undefined;
}

should_start_cautious_approach_koth( var_0 )
{
    if ( var_0 )
    {
        var_1 = level.radioobject maps\mp\gametypes\_gameobjects::_id_4078();

        if ( var_1 == "neutral" || var_1 == self._id_04A7 )
            return 0;
    }

    return maps\mp\bots\_bots_strategy::_id_847B( var_0 );
}

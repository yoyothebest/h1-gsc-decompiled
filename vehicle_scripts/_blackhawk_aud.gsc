// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

snd_init_blackhawk()
{
    _id_A5E8::_id_870C( "snd_register_vehicle", "blackhawk", ::snd_blackhawk_constructor );
}

snd_start_blackhawk()
{
    if ( isdefined( self._id_86FE ) )
    {
        wait 1.0;
        snd_stop_blackhawk( 1.0 );
    }

    var_0 = spawnstruct();
    var_0._id_6F21 = "blackhawk";
    _id_A5E8::_id_870C( "snd_start_vehicle", var_0 );
}

snd_stop_blackhawk( var_0 )
{
    if ( isdefined( self._id_86FE ) )
    {
        _id_A5E8::_id_870C( "snd_stop_vehicle", var_0 );
        self notify( "snd_stop_vehicle" );
    }
}

snd_blackhawk_constructor()
{
    _id_A5E4::_id_118C( "blackhawk" );
    _id_A5E4::_id_1187();
    _id_A5E4::_id_1188( "h1r_blackhawk_engine_far_lp" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "blackhawk_engine_far_vel2vol" );
    _id_A5E4::_id_1183( "pitch", "blackhawk_engine_far_vel2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "blackhawk_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "h1r_blackhawk_engine_close_lp" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "blackhawk_engine_close_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "blackhawk_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1197();
    _id_A5E4::_id_1189( 0.5 );
    _id_A5E4::_id_118A( "h1r_blackhawk_start_rev", "blackhawk_start_rev_duck" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "blackhawk_start_rev_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_119A();
    _id_A5E4::_id_118A( "h1r_blackhawk_pass_by", "blackhawk_pass_by_duck_envelope" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "pitch", "blackhawk_pass_by_vel2pch" );
    _id_A5E4::_id_1183( "volume", "blackhawk_pass_by_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_119A();
    _id_A5E4::_id_1199();
    _id_A5E4::_id_1185();
    _id_A5E4::_id_1186( "to_state_hover", ::blackhawk_condition_callback_to_hover, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly", ::blackhawk_condition_callback_to_fly, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly_from_hover", ::blackhawk_condition_callback_to_fly, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "h1r_blackhawk_start_rev" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_distant", ::blackhawk_condition_callback_to_distant, [ "distance2d" ] );
    _id_A5E4::_id_1180( "h1r_blackhawk_engine_far_lp" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_flyby", ::blackhawk_condition_callback_to_flyby, [ "speed", "distance2d", "doppler" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "h1r_blackhawk_pass_by" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1195();
    _id_A5E4::_id_118D( 0.25, 0.5 );
    _id_A5E4::_id_118F( "engine_oneshots", "state_fly", "to_state_fly", 50, 1.0 );
    _id_A5E4::_id_118E( "state_hover" );
    _id_A5E4::_id_1184( "state_fly", "to_state_fly_from_hover" );
    _id_A5E4::_id_1184( "state_flyby", "to_state_flyby" );
    _id_A5E4::_id_1184( "state_distant", "to_state_distant" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_118E( "state_distant" );
    _id_A5E4::_id_1184( "state_hover", "to_state_hover" );
    _id_A5E4::_id_1184( "state_fly", "to_state_fly" );
    _id_A5E4::_id_1184( "state_flyby", "to_state_flyby" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_118E( "state_fly" );
    _id_A5E4::_id_1184( "state_hover", "to_state_hover" );
    _id_A5E4::_id_1184( "state_flyby", "to_state_flyby" );
    _id_A5E4::_id_1184( "state_distant", "to_state_distant" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_118E( "state_flyby", 7.0 );
    _id_A5E4::_id_1184( "state_hover", "to_state_hover" );
    _id_A5E4::_id_1184( "state_fly", "to_state_fly" );
    _id_A5E4::_id_1184( "state_distant", "to_state_distant" );
    _id_A5E4::_id_119E();
    _id_A5E4::_id_119F();
    _id_A5E4::_id_119D();
    _id_A5E4::_id_117D( "blackhawk_engine_far_vel2vol", [ [ 0, 1.0 ], [ 10, 1.0 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "blackhawk_engine_close_vel2vol", [ [ 0, 1.0 ], [ 20, 1.0 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "blackhawk_engine_far_vel2pch", [ [ 0, 0.9 ], [ 10, 1.0 ], [ 20, 1.1 ] ] );
    _id_A5E4::_id_117D( "blackhawk_start_rev_duck", [ [ 0.0, 1.0 ], [ 0.25, 1.0 ], [ 0.3, 0.7 ], [ 0.7, 1.0 ], [ 1.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "blackhawk_start_rev_vel2vol", [ [ 0.0, 0.0 ], [ 3.0, 0.3 ], [ 5.0, 0.7 ], [ 8.0, 0.8 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "blackhawk_pass_by_duck_envelope", [ [ 0.0, 1.0 ], [ 0.15, 1.0 ], [ 0.3, 0.5 ], [ 0.5, 0.55 ], [ 0.6, 1.0 ] ] );
    _id_A5E4::_id_117D( "blackhawk_pass_by_vel2vol", [ [ 0.0, 0.0 ], [ 9.06, 0.0 ], [ 15.1, 0.7 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "blackhawk_pass_by_vel2pch", [ [ 0.0, 0.9 ], [ 15.1, 1.0 ], [ 150.0, 1.1 ] ] );
    _id_A5E4::_id_117D( "blackhawk_doppler2pch", [ [ 0.0, 0.0 ], [ 2.0, 2.0 ] ] );
    _id_A5E4::_id_119C();
}

blackhawk_condition_callback_to_hover( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );

    if ( var_2 < 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

blackhawk_condition_callback_to_fly( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );

    if ( var_2 >= 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

blackhawk_condition_callback_to_flyby( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );
    var_5 = var_0["speed"];
    var_6 = var_0["doppler"];

    if ( !isdefined( var_1._id_391D ) )
    {
        var_1._id_391D = spawnstruct();
        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = 0;
    }
    else
    {
        var_7 = var_3 - var_1._id_391D._id_6F39;

        if ( var_7 < 0 && var_5 >= 15.1 && var_4 < 2100 && var_6 >= 1.02 )
            var_2 = 1;

        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = var_7;
    }

    return var_2;
}

blackhawk_condition_callback_to_distant( var_0, var_1 )
{
    var_2 = var_0["distance2d"];
    var_3 = _id_A5E4::_id_2B71( var_2 );

    if ( var_3 >= 3000 )
        return 1;

    return 0;
}

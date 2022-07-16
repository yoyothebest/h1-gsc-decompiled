// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

snd_init_hind()
{
    _id_A5E8::_id_870C( "snd_register_vehicle", "hind", ::snd_hind_constructor );
}

snd_start_hind()
{
    if ( isdefined( self._id_86FE ) )
    {
        wait 1.0;
        snd_stop_hind( 1.0 );
    }

    var_0 = spawnstruct();
    var_0._id_6F21 = "hind";
    _id_A5E8::_id_870C( "snd_start_vehicle", var_0 );
}

snd_stop_hind( var_0 )
{
    if ( isdefined( self._id_86FE ) )
    {
        _id_A5E8::_id_870C( "snd_stop_vehicle", var_0 );
        self notify( "snd_stop_vehicle" );
    }
}

snd_hind_constructor()
{
    _id_A5E4::_id_118C( "hind" );
    _id_A5E4::_id_1187();
    _id_A5E4::_id_1188( "hind_engine_low" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "hind_engine_far_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 1.0, 1.0 );
    _id_A5E4::_id_1183( "pitch", "hind_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "hind_idle_low" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "hind_engine_close_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 1.0, 1.0 );
    _id_A5E4::_id_1183( "pitch", "hind_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1197();
    _id_A5E4::_id_1189( 0.5 );
    _id_A5E4::_id_118A( "h1r_hind_start_rev", "hind_start_rev_duck" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "hind_start_rev_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_119A();
    _id_A5E4::_id_118A( "h1r_hind_pass_by", "hind_pass_by_duck_envelope" );
    _id_A5E4::_id_119A();
    _id_A5E4::_id_1199();
    _id_A5E4::_id_1185();
    _id_A5E4::_id_1186( "to_state_hover", ::hind_condition_callback_to_hover, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly", ::hind_condition_callback_to_fly, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly_from_hover", ::hind_condition_callback_to_fly, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "h1r_hind_start_rev" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_distant", ::hind_condition_callback_to_distant, [ "distance2d" ] );
    _id_A5E4::_id_1180( "hind_engine_low" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_flyby", ::hind_condition_callback_to_flyby, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "h1r_hind_pass_by" );
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
    _id_A5E4::_id_117D( "hind_engine_far_vel2vol", [ [ 0, 1.0 ], [ 10, 1.0 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "hind_engine_close_vel2vol", [ [ 0, 0.5 ], [ 20, 0.8 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "hind_engine_far_vel2pch", [ [ 0, 0.8 ], [ 10, 1.0 ], [ 20, 1.1 ] ] );
    _id_A5E4::_id_117D( "hind_start_rev_duck", [ [ 0.0, 1.0 ], [ 0.25, 1.0 ], [ 0.3, 0.7 ], [ 0.7, 1.0 ], [ 1.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "hind_start_rev_vel2vol", [ [ 0.0, 0.0 ], [ 3.0, 0.3 ], [ 5.0, 0.7 ], [ 8.0, 0.8 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "hind_pass_by_duck_envelope", [ [ 0.0, 1.0 ], [ 0.15, 1.0 ], [ 0.3, 0.5 ], [ 0.5, 0.55 ], [ 0.6, 1.0 ] ] );
    _id_A5E4::_id_117D( "hind_doppler2pch", [ [ 0.0, 0.0 ], [ 2.0, 2.0 ] ] );
    _id_A5E4::_id_119C();
}

hind_condition_callback_to_hover( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );
    return var_2 < 1.1 && var_4 < 3000;
}

hind_condition_callback_to_fly( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );
    return var_2 >= 1.1 && var_4 < 3000;
}

hind_condition_callback_to_flyby( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = var_0["speed"];

    if ( isdefined( level.disablepassby ) && level.disablepassby )
        return 0;

    if ( !isdefined( var_1._id_391D ) )
    {
        var_1._id_391D = spawnstruct();
        var_1._id_391D._id_6F39 = var_3;
    }
    else
    {
        var_5 = var_3 - var_1._id_391D._id_6F39;
        var_6 = var_4 * 63360 / 60 / 60;
        var_7 = var_6 * 1.8;
        var_2 = var_5 < 0 && var_3 <= var_7 && var_4 >= 20.1;
        var_1._id_391D._id_6F39 = var_3;
    }

    return var_2;
}

hind_condition_callback_to_distant( var_0, var_1 )
{
    var_2 = var_0["distance2d"];
    var_3 = _id_A5E4::_id_2B71( var_2 );
    return var_3 >= 3000;
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_86FA()
{
    _id_A5E8::_id_870C( "snd_register_vehicle", "mi17", ::_id_870E );
}

_id_876D()
{
    if ( isdefined( self._id_86FE ) )
    {
        wait 1.0;
        _id_8777( 1.0 );
    }

    var_0 = spawnstruct();
    var_0._id_6F21 = "mi17";
    _id_A5E8::_id_870C( "snd_start_vehicle", var_0 );
}

_id_8777( var_0 )
{
    if ( isdefined( self._id_86FE ) )
    {
        _id_A5E8::_id_870C( "snd_stop_vehicle", var_0 );
        self notify( "snd_stop_vehicle" );
    }
}

_id_870E()
{
    _id_A5E4::_id_118C( "mi17" );
    _id_A5E4::_id_1187();
    _id_A5E4::_id_1188( "mi17_dist_towards_lp" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi17_dist_towards_vel2vol" );
    _id_A5E4::_id_1183( "pitch", "mi17_dist_towards_vel2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "mi17_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1188( "mi17_close_towards_lp" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi17_close_towards_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_118B( "doppler", 0.65, 0.3 );
    _id_A5E4::_id_1183( "pitch", "mi17_doppler2pch" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_1198();
    _id_A5E4::_id_1197();
    _id_A5E4::_id_1189( 0.5 );
    _id_A5E4::_id_118A( "mi17_by_windup", "mi17_windup_duck" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi17_by_windup_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_119A();
    _id_A5E4::_id_118A( "mi17_by_out", "mi17_flyby_duck_envelope" );
    _id_A5E4::_id_118B( "speed" );
    _id_A5E4::_id_1183( "volume", "mi17_flyby_vel2vol" );
    _id_A5E4::_id_119B();
    _id_A5E4::_id_119A();
    _id_A5E4::_id_1199();
    _id_A5E4::_id_1185();
    _id_A5E4::_id_1186( "to_state_hover", ::_id_5BF9, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly", ::_id_5BF7, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_fly_from_hover", ::_id_5BF7, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "mi17_by_windup" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_distant", ::mi17_condition_callback_to_distant, [ "distance2d" ] );
    _id_A5E4::_id_1180( "mi17_dist_towards_lp" );
    _id_A5E4::_id_1196();
    _id_A5E4::_id_1186( "to_state_flyby", ::_id_5BF8, [ "speed", "distance2d" ] );
    _id_A5E4::_id_1180( "ALL" );
    _id_A5E4::_id_1182( "mi17_by_out" );
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
    _id_A5E4::_id_117D( "mi17_dist_towards_vel2vol", [ [ 0, 1.0 ], [ 10, 1.0 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi17_close_towards_vel2vol", [ [ 0, 1.0 ], [ 20, 1.0 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi17_dist_towards_vel2pch", [ [ 0, 0.9 ], [ 10, 1.0 ], [ 20, 1.05 ] ] );
    _id_A5E4::_id_117D( "mi17_windup_duck", [ [ 0.0, 1.0 ], [ 0.25, 1.0 ], [ 0.3, 0.7 ], [ 0.7, 1.0 ], [ 1.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi17_by_windup_vel2vol", [ [ 0.0, 0.0 ], [ 3.0, 0.3 ], [ 5.0, 0.7 ], [ 8.0, 0.8 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi17_flyby_duck_envelope", [ [ 0.0, 1.0 ], [ 0.15, 1.0 ], [ 0.3, 0.5 ], [ 0.5, 0.55 ], [ 0.6, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi17_flyby_vel2vol", [ [ 0.0, 0.0 ], [ 16.08, 0.0 ], [ 20.1, 0.5 ], [ 40.2, 0.8 ], [ 150.0, 1.0 ] ] );
    _id_A5E4::_id_117D( "mi17_doppler2pch", [ [ 0.0, 0.0 ], [ 2.0, 2.0 ] ] );
    _id_A5E4::_id_119C();
}

_id_5BF9( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );

    if ( var_2 < 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

_id_5BF7( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );

    if ( var_2 >= 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

_id_5BF8( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = _id_A5E4::_id_2B71( var_3 );
    var_5 = var_0["speed"];

    if ( !isdefined( var_1._id_391D ) )
    {
        var_1._id_391D = spawnstruct();
        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = 0;
    }
    else
    {
        var_6 = var_3 - var_1._id_391D._id_6F39;

        if ( var_6 < 0 && var_4 < 2500 && var_5 >= 20.1 )
            var_2 = 1;

        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = var_6;
    }

    return var_2;
}

mi17_condition_callback_to_distant( var_0, var_1 )
{
    var_2 = var_0["distance2d"];
    var_3 = _id_A5E4::_id_2B71( var_2 );

    if ( var_3 >= 3000 )
        return 1;

    return 0;
}

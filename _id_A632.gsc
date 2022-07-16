// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "mig29", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_mig29_desert" );
    _id_A5A8::_id_1845( "vehicle_av8b_harrier_jet" );
    buildmig29fx( "afterburner", "fx/fire/jet_afterburner" );
    buildmig29fx( "contrail", "fx/smoke/jet_contrail" );
    buildmig29fx( "contrail_02", "fx/smoke/jet_contrail_02" );
    _id_A5A8::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "explo_metal_rand" );
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_1865( "mig_rumble", 0.1, 0.2, 11300, 0.05, 0.05 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1854();
}

_id_4D10()
{
    thread _id_6A22();
    thread _id_6A38();
}

_id_7EFA( var_0 )
{
    var_1 = "rope_test";
    precachemodel( var_1 );
    return var_0;
}

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 1; var_1++ )
        var_0[var_1] = spawnstruct();

    return var_0;
}

_id_6A22()
{
    playfxontag( level._id_058F["afterburner"], self, "tag_engine_right" );
    playfxontag( level._id_058F["afterburner"], self, "tag_engine_left" );
}

_id_6A38()
{
    playfxontag( level._id_058F["contrail"], self, "tag_right_wingtip" );
    playfxontag( level._id_058F["contrail_02"], self, "tag_left_wingtip" );
}

_id_6CD2( var_0 )
{
    var_1 = _id_6CD3( var_0 );

    if ( var_1 )
        var_2 = 1;
    else
        var_2 = -1;

    var_3 = common_scripts\utility::_id_38C9( var_0._id_02E2 );
    var_4 = var_3 + anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) ) * ( var_2 * 100000 );
    var_5 = _func_0ED( var_3, var_4, level._id_0318._id_02E2 );
    var_6 = _func_0EE( var_3, var_5 );
    var_7 = 3000;

    if ( isdefined( level.mig29_near_distance_override ) )
        var_7 = level.mig29_near_distance_override;

    return var_6 < var_7;
}

_id_6CD3( var_0 )
{
    var_1 = anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) );
    var_2 = _func_114( common_scripts\utility::_id_38C9( level._id_0318._id_02E2 ) - var_0._id_02E2 );
    var_3 = _func_0F6( var_1, var_2 );

    if ( var_3 > 0 )
        return 1;
    else
        return 0;
}

_id_6877()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "death" );
    thread _id_6877();
    var_0 thread common_scripts\utility::_id_6975( "veh_mig29_dist_loop" );
    var_1 = 0;

    if ( isdefined( self._id_7A99 ) && self._id_7A99 == "play_additional_sound" )
        var_1 = 1;

    var_0 thread plane_passby_sfx( var_1 );

    while ( _id_6CD3( var_0 ) )
        wait 0.05;

    wait 0.5;
    var_0 thread common_scripts\utility::_id_69C2( "veh_mig29_sonic_boom" );
    var_0 waittill( "reached_end_node" );
    var_0 _id_8EC9( "veh_mig29_dist_loop" );
    var_0 delete();
}

plane_passby_sfx( var_0 )
{
    self endon( "death" );
    self endon( "reached_end_node" );

    while ( !_id_6CD2( self ) )
        wait 0.05;

    thread _id_A5A4::_id_69C4( "veh_mig29_passby" );

    if ( var_0 )
        thread _id_A5A4::_id_69C4( "veh_mig29_passby_layer" );
}

_id_686F()
{
    buildmig29fx( "plane_bomb_explosion1", "fx/explosions/airlift_explosion_large" );
    buildmig29fx( "plane_bomb_explosion2", "fx/explosions/tanker_explosion" );
    self waittill( "trigger", var_0 );
    var_0 endon( "death" );
    thread _id_686F();
    var_1 = getentarray( self._id_7A26, "script_linkname" );
    var_1 = common_scripts\utility::_id_3CCB( self._id_02E2, var_1, undefined, var_1.size );
    var_2 = 0;
    wait(_func_0B5( 0.3, 0.8 ));

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_2++;

        if ( var_2 == 3 )
            var_2 = 1;

        var_1[var_3] thread _id_A5A4::_id_69C4( "airstrike_explosion" );
        var_4 = "plane_bomb_explosion" + var_2;
        var_5 = level._id_058F[var_4];

        if ( isdefined( level.plane_bomb_explosion_overrides ) && isdefined( level.plane_bomb_explosion_overrides[var_4] ) )
            var_5 = level.plane_bomb_explosion_overrides[var_4];

        playfx( var_5, var_1[var_3]._id_02E2 );
        wait(_func_0B5( 0.3, 1.2 ));
    }
}

_id_686E()
{
    self waittill( "trigger", var_0 );
    var_0 endon( "death" );
    var_1 = var_0;
    var_1 thread _id_686E();
    var_2 = spawn( "script_model", var_1._id_02E2 - ( 0, 0, 100 ) );
    var_2.angles = var_1.angles;
    var_2 _meth_80B3( "projectile_cbu97_clusterbomb" );
    var_3 = anglestoforward( var_1.angles ) * 2;
    var_4 = anglestoup( var_1.angles ) * -0.2;
    var_5 = [];

    for ( var_6 = 0; var_6 < 3; var_6++ )
        var_5[var_6] = ( var_3[var_6] + var_4[var_6] ) / 2;

    var_5 = ( var_5[0], var_5[1], var_5[2] );
    var_5 *= 7000;
    var_2 _meth_82AE( var_5, 2.0 );
    wait 1.2;
    var_7 = spawn( "script_model", var_2._id_02E2 );
    var_7 _meth_80B3( "tag_origin" );
    var_7._id_02E2 = var_2._id_02E2;
    var_7.angles = var_2.angles;
    wait 0.05;
    var_2 delete();
    var_2 = var_7;
    var_8 = var_2._id_02E2;
    var_9 = var_2.angles;
    playfxontag( level._id_099B, var_2, "tag_origin" );
    wait 1.6;
    var_10 = 12;
    var_11 = 5;
    var_12 = 55;
    var_13 = ( var_12 - var_11 ) / var_10;

    for ( var_6 = 0; var_6 < var_10; var_6++ )
    {
        var_14 = anglestoforward( var_9 + ( var_12 - var_13 * var_6, _func_0B2( 10 ) - 5, 0 ) );
        var_15 = var_8 + var_14 * 10000;
        var_16 = _func_06B( var_8, var_15, 0, undefined );
        var_17 = var_16["position"];
        _func_189( var_17 + ( 0, 0, 16 ), 512, 400, 30 );

        if ( var_6 % 3 == 0 )
        {
            thread common_scripts\utility::_id_69C2( "airstrike_explosion", var_17 );
            _func_1C7( "artillery_rumble", var_17 );
            _func_18C( 0.7, 0.75, var_17, 1000 );
        }

        wait(0.75 / var_10);
    }

    wait 1.0;
    var_2 delete();
}

_id_8EC9( var_0 )
{
    self notify( "stop sound" + var_0 );
}

setmig29fxoverride( var_0, var_1 )
{
    if ( !isdefined( level.mig29_fx_override ) )
        level.mig29_fx_override = [];

    level.mig29_fx_override[var_0] = var_1;
}

buildmig29fx( var_0, var_1 )
{
    if ( isdefined( level.mig29_fx_override ) && isdefined( level.mig29_fx_override[var_0] ) )
        var_1 = level.mig29_fx_override[var_0];

    level._id_058F[var_0] = loadfx( var_1 );
}

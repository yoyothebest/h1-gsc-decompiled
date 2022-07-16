// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

carrystart( var_0, var_1, var_2 )
{
    _func_0D6( "cl_NoWeaponBobAmplitudeVertical", 2.5 );
    _func_0D6( "cl_NoWeaponBobAmplitudeHorizontal", 2.5 );
    level.eplayerview _meth_8090();
    level.eplayerview._id_02E2 = level._id_0318._id_02E2;
    level.eplayerview.angles = level._id_0318 _meth_8338();

    if ( isdefined( var_2 ) && var_2 )
    {
        level._id_0318 _id_A510::_id_0BC7( level.eplayerview, "carry_idle" );
        level._id_0318 _id_A510::_id_0BC7( var_0, "carry_idle" );
        wait 0.1;
    }

    level.m_player_rig = level.eplayerview;
    level.m_carried = var_0;
    level.m_carried _meth_80C0( 0 );
    level.m_carried _meth_8090();
    level.m_player_spot = level.m_player_rig common_scripts\utility::_id_8959();
    level.m_player_spot.angles = ( 0, level.m_player_rig.angles[1], 0 );
    level.m_player_spot thread _id_A510::_id_0BE1( level.m_player_rig, "carry_idle" );
    level.m_player_rig thread _id_A510::_id_0BE1( level.m_carried, "carry_idle" );
    level.m_carried _meth_83FF( level._id_0318, "tag_origin", ( 0, 0, -60 ), ( 0, 0, 0 ), 1, 0, 1, 0 );
    level.m_player_rig _meth_83FF( level._id_0318, "tag_origin", ( 0, 0, -60 ), ( 0, 0, 0 ), 1, 0, 1, 0 );
    wait 0.05;
    thread carrymoveloop( var_1 );
}

carrymoveloop( var_0 )
{
    level._id_0318 endon( "death" );
    level.m_player_spot endon( "death" );
    var_1 = 0.05;
    level.m_player_carry_moving = 0;
    level.m_player_carry_ladder = 0;
    var_2 = 0;
    var_3 = 0;

    while ( [[ var_0 ]]() )
    {
        var_2 = level._id_0318 _meth_801A();
        var_4 = level._id_0318 _meth_82F0();
        var_5 = _func_0F1( var_4 );
        var_3 = var_5 > 0;
        carryupdateanimation( var_2, var_3, var_5 );
        wait(var_1);
    }
}

carryupdateanimation( var_0, var_1, var_2 )
{
    var_3 = level.m_player_carry_ladder;
    var_4 = level.m_player_carry_moving;

    if ( var_0 )
    {
        if ( !var_3 )
        {
            level.m_player_spot notify( "stop_loop" );
            level.m_player_rig notify( "stop_loop" );
            level.m_carried _meth_8119( level.m_carried _id_A5A4::_id_3EF5( "ladder_on" ), 0 );
            level.m_player_spot thread _id_A510::_id_0C24( level.m_player_rig, "ladder_on" );
            level.m_player_rig thread _id_A510::_id_0C24( level.m_carried, "ladder_on" );
        }
    }
    else if ( var_3 )
    {
        level.m_player_spot thread _id_A510::_id_0C24( level.m_player_rig, "ladder_off" );
        level.m_player_rig thread _id_A510::_id_0C24( level.m_carried, "ladder_off" );
    }
    else if ( !var_1 && var_4 )
    {
        level.m_player_spot notify( "stop_loop" );
        level.m_player_rig notify( "stop_loop" );
        level.m_player_spot thread _id_A510::_id_0BE1( level.m_player_rig, "carry_idle" );
        level.m_player_rig thread _id_A510::_id_0BE1( level.m_carried, "carry_idle" );
    }
    else if ( var_1 && !var_4 )
    {
        level.m_player_spot notify( "stop_loop" );
        level.m_player_rig notify( "stop_loop" );
        level.m_player_spot thread _id_A510::_id_0BE1( level.m_player_rig, "carry_run" );
        level.m_player_rig thread _id_A510::_id_0BE1( level.m_carried, "carry_run" );
    }

    var_5 = 0;

    if ( var_1 && !var_0 && !var_3 )
    {
        var_6 = level.m_player_rig _meth_8151( level._id_78AC[level.m_player_rig._id_0C72]["carry_run"][0] );
        level.m_carried _meth_8119( level._id_78AC[level.m_carried._id_0C72]["carry_run"][0], var_6 );
        level.m_player_rig _meth_8113( "looping anim", level._id_78AC[level.m_player_rig._id_0C72]["carry_run"][0], 1, 0, var_2 );
        level.m_carried _meth_8113( "looping anim", level._id_78AC[level.m_carried._id_0C72]["carry_run"][0], 1, 0, var_2 );
        var_5 = 1;
    }

    level.m_player_carry_ladder = var_0;
    level.m_player_carry_moving = var_5;
}

carrystop()
{
    _func_0D6( "cl_NoWeaponBobAmplitudeVertical", 0.0 );
    _func_0D6( "cl_NoWeaponBobAmplitudeHorizontal", 0.0 );
    level._id_0318 _meth_8573();
    level._id_0318 _meth_8051();
    level.m_carried _meth_8051();
    level.m_carried = undefined;
    level.m_player_rig = undefined;
    level.m_player_spot delete();
    level.m_player_spot = undefined;
    level._id_0318 _meth_834A( 0 );
}

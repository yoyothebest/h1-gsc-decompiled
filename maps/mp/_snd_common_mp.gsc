// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    _id_870D();
    _id_72DA();
    thread _id_8712();
}

_id_8712()
{
    level._id_065D._id_2FDF = 0;

    if ( isdefined( level._id_0323 ) && level._id_0323.size > 0 )
    {
        foreach ( var_1 in level._id_0323 )
        {
            var_1 _meth_84CF( "mp_init_mix" );
            wait 0.05;
            var_1 _meth_84CF( "mp_pre_event_mix" );
            wait 0.05;
        }
    }
}

_id_8713()
{
    level._id_065D._id_2FDF = 1;

    if ( isdefined( level._id_0323 ) && level._id_0323.size > 0 )
    {
        foreach ( var_1 in level._id_0323 )
        {
            var_1 _meth_84D0( "mp_pre_event_mix" );
            wait 0.05;
            var_1 _meth_84CF( "mp_post_event_mix" );
            wait 0.05;
        }
    }
}

_id_8714()
{
    self _meth_84CF( "mp_init_mix" );

    if ( !isdefined( level._id_065D._id_2FDF ) || !level._id_065D._id_2FDF )
        self _meth_84CF( "mp_pre_event_mix" );
    else
    {
        self _meth_84D0( "mp_pre_event_mix" );
        self _meth_84CF( "mp_post_event_mix" );
    }
}

_id_870D()
{
    if ( !isdefined( level._id_065D ) )
        level._id_065D = spawnstruct();

    if ( !isdefined( level._id_065D._id_5BB9 ) )
        level._id_065D._id_5BB9 = [];
}

_id_874D( var_0, var_1 )
{
    level._id_065D._id_5BB9[var_0] = var_1;
}

_id_8716( var_0, var_1, var_2 )
{
    level notify( "stop_other_music" );
    level endon( "stop_other_music" );

    if ( isdefined( var_2 ) )
        childthread _id_870C( "snd_music_handler", var_0, var_1, var_2 );
    else if ( isdefined( var_1 ) )
        childthread _id_870C( "snd_music_handler", var_0, var_1 );
    else
        childthread _id_870C( "snd_music_handler", var_0 );
}

_id_870C( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_065D._id_5BB9[var_0] ) )
    {
        if ( isdefined( var_3 ) )
            thread [[ level._id_065D._id_5BB9[var_0] ]]( var_1, var_2, var_3 );
        else if ( isdefined( var_2 ) )
            thread [[ level._id_065D._id_5BB9[var_0] ]]( var_1, var_2 );
        else if ( isdefined( var_1 ) )
            thread [[ level._id_065D._id_5BB9[var_0] ]]( var_1 );
        else
            thread [[ level._id_065D._id_5BB9[var_0] ]]();
    }
}

_id_72DA()
{
    _id_874D( "exo_knife_player_impact", ::_id_5FD5 );
}

_id_5FD5()
{
    _func_1A8( self._id_02E2, "wpn_combatknife_stab_npc" );
}

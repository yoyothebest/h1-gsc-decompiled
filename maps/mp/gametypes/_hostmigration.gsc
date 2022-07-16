// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_19EE()
{
    level._id_4A38 = 0;

    if ( level._id_3BDA )
        return;

    var_0 = _func_130( "hostMigrationCount" );
    var_0++;
    _func_12F( "hostMigrationCount", var_0 );

    foreach ( var_2 in level._id_1C8E )
        var_2._id_4A36 = 0;

    level._id_4A39 = 1;
    setdvar( "ui_inhostmigration", 1 );
    level notify( "host_migration_begin" );
    maps\mp\gametypes\_gamelogic::_id_9B8C();

    foreach ( var_2 in level._id_1C8E )
    {
        var_2 thread _id_4A3A();

        if ( _func_1AD( var_2 ) )
            var_2 _meth_82F8( "ui_session_state", var_2._id_03BC );
    }

    setdvar( "ui_game_state", game["state"] );
    level endon( "host_migration_begin" );
    _id_4A3C();
    level._id_4A39 = undefined;
    setdvar( "ui_inhostmigration", 0 );
    level notify( "host_migration_end" );
    maps\mp\gametypes\_gamelogic::_id_9B8C();
    level thread maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_4A3C()
{
    level endon( "game_ended" );
    level._id_4C6D = 25;
    thread maps\mp\gametypes\_gamelogic::_id_59ED( 20.0 );
    _id_4A3D();
    level._id_4C6D = 10;
    thread maps\mp\gametypes\_gamelogic::_id_59ED( 5.0 );
    wait 5;
    level._id_4C6D = 0;
}

_id_4A3D()
{
    level endon( "hostmigration_enoughplayers" );
    wait 15;
}

_id_4A37( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "<removed_ent>";

    var_1 = -1;
    var_2 = "?";

    if ( isdefined( var_0._id_3314 ) )
        var_1 = var_0._id_3314;

    if ( _func_1AD( var_0 ) && isdefined( var_0._id_02A7 ) )
        var_2 = var_0._id_02A7;

    if ( _func_1AD( var_0 ) )
        return "player <" + var_2 + "> (entNum " + var_1 + " )";

    if ( _func_1FF( var_0 ) && maps\mp\_utility::_id_5112( var_0 ) )
        return "participant agent <" + var_1 + ">";

    if ( _func_1FF( var_0 ) )
        return "non-participant agent <" + var_1 + ">";

    return "unknown entity <" + var_1 + ">";
}

_id_4A3B()
{
    level endon( "host_migration_begin" );
    level endon( "host_migration_end" );
    self endon( "disconnect" );
    self._id_4A36 = 1;

    while ( !maps\mp\_utility::_id_5189( self ) )
        self waittill( "spawned" );

    maps\mp\_utility::_id_3A32( 1 );
    self _meth_800D();
    level waittill( "host_migration_end" );
}

_id_4A3A()
{
    level endon( "host_migration_begin" );
    self endon( "disconnect" );

    if ( _func_1FF( self ) )
        self endon( "death" );

    _id_4A3B();

    if ( self._id_4A36 )
    {
        if ( maps\mp\_utility::_id_3BDD( "prematch_done" ) )
        {
            maps\mp\_utility::_id_3A32( 0 );
            self _meth_800C();
        }

        self._id_4A36 = undefined;
    }
}

_id_A0DD()
{
    if ( !isdefined( level._id_4A39 ) )
        return 0;

    var_0 = gettime();
    level waittill( "host_migration_end" );
    return gettime() - var_0;
}

_id_A0DE( var_0 )
{
    if ( isdefined( level._id_4A39 ) )
        return;

    level endon( "host_migration_begin" );
    wait(var_0);
}

_id_A052( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_A0DE( ( var_2 - gettime() ) / 1000 );

        if ( isdefined( level._id_4A39 ) )
        {
            var_3 = _id_A0DD();
            var_2 += var_3;
        }
    }

    _id_A0DD();
    return gettime() - var_1;
}

_id_A0A1( var_0, var_1 )
{
    self endon( var_0 );

    if ( var_1 == 0 )
        return;

    var_2 = gettime();
    var_3 = gettime() + var_1 * 1000;

    while ( gettime() < var_3 )
    {
        _id_A0DE( ( var_3 - gettime() ) / 1000 );

        if ( isdefined( level._id_4A39 ) )
        {
            var_4 = _id_A0DD();
            var_3 += var_4;
        }
    }

    _id_A0DD();
    return gettime() - var_2;
}

_id_A051( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_A0DE( ( var_2 - gettime() ) / 1000 );

        while ( isdefined( level._id_4A39 ) )
        {
            var_2 += 1000;
            _func_142( _func_0BC( var_2 ) );
            wait 1;
        }
    }

    while ( isdefined( level._id_4A39 ) )
    {
        var_2 += 1000;
        _func_142( _func_0BC( var_2 ) );
        wait 1;
    }

    return gettime() - var_1;
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2402()
{
    level._id_3AEE = common_scripts\utility::_id_9F36;
    level._id_3AEF = ::_id_3AEF;
    level._id_3AEB = common_scripts\_fx::_id_5883;
    level._id_3AEC = common_scripts\_fx::_id_64A0;
    level._id_3AE6 = common_scripts\_fx::_id_23CA;
    level._id_3AF1 = common_scripts\_createfx::_id_748A;
    level._id_3AF0 = common_scripts\_createfx::_id_6FEC;
    level._id_3AED = ::_id_3AED;
    level._id_5FAC = 1;
    level._id_1A05 = common_scripts\utility::_id_9F36;
    level._id_19FD = common_scripts\utility::_id_9F36;
    level._id_19FF = common_scripts\utility::_id_9F36;
    level._id_19FE = common_scripts\utility::_id_9F36;
    level._id_1A01 = common_scripts\utility::_id_9F36;
    level._id_19FB = common_scripts\utility::_id_9F36;
    level._id_19FA = common_scripts\utility::_id_9F36;
    level._id_1A02 = common_scripts\utility::_id_9F36;
    level._id_19FD = ::_id_19F0;
    level._id_1A03 = common_scripts\utility::_id_9F36;
    maps\mp\gametypes\_gameobjects::main( [] );
    maps\mp\gametypes\_oldschool::deletepickups();
    thread common_scripts\_createfx::_id_3AE8();
    common_scripts\_createfx::_id_2407();
    level waittill( "eternity" );
}

_id_3AEF( var_0 )
{
    return level._id_0318._id_02E2;
}

_id_19F0()
{
    self waittill( "begin" );

    if ( !isdefined( level._id_0318 ) )
    {
        var_0 = getentarray( "mp_global_intermission", "classname" );
        var_1 = ( var_0[0].angles[0], var_0[0].angles[1], 0.0 );
        self _meth_826B( var_0[0]._id_02E2, var_1 );
        maps\mp\_utility::_id_9B69( "playing" );
        self._id_0271 = 10000000;
        self._id_01E6 = 10000000;
        level._id_0318 = self;
        thread common_scripts\_createfx::_id_241B();
    }
    else
        _func_13F( self _meth_81B5() );
}

_id_3AED()
{
    var_0 = level._id_0575._id_6C19 / 190;
    level._id_0318 _meth_81E4( var_0 );
}

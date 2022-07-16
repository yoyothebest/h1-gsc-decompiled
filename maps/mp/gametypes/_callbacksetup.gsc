// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

codecallback_startgametype()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    if ( !isdefined( level._id_3C03 ) || !level._id_3C03 )
    {
        [[ level._id_1A05 ]]();
        level._id_3C03 = 1;
    }
}

codecallback_playerconnect()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self endon( "disconnect" );
    [[ level._id_19FD ]]();
}

codecallback_playerdisconnect( var_0 )
{
    self notify( "disconnect" );
    [[ level._id_19FF ]]( var_0 );
}

codecallback_playerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );
    [[ level._id_19FE ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

codecallback_playerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level._id_1A01 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playergrenadesuicide( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "disconnect" );
    [[ level._id_1A00 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

codecallback_entityoutofworld()
{
    self endon( "disconnect" );
    [[ level._id_19FB ]]();
}

codecallback_bullethitentity( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( self._id_18AC ) )
        [[ self._id_18AC ]]( var_0, var_1, var_2, var_3, var_4, var_5 );
}

codecallback_vehicledamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self._id_258E ) )
        self [[ self._id_258E ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self _meth_827E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

codecallback_entitydamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self._id_258E ) )
        self [[ self._id_258E ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self _meth_8492( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

codecallback_codeendgame()
{
    self endon( "disconnect" );
    [[ level._id_19FA ]]();
}

codecallback_playerlaststand( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level._id_1A02 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playermigrated()
{
    self endon( "disconnect" );
    [[ level._id_1A03 ]]();
}

codecallback_hostmigration()
{
    [[ level._id_19FC ]]();
}

_id_2000( var_0, var_1 )
{
    if ( _func_1FE( var_0 ) || _func_28E( var_0 ) || var_0._id_04A7 == "spectator" || var_0._id_03BC == "spectator" )
        return;
}

codecallback_givekillstreakmodule( var_0, var_1 )
{
    if ( _func_1FE( var_0 ) || _func_28E( var_0 ) || var_0._id_04A7 == "spectator" || var_0._id_03BC == "spectator" )
        return;
}

codecallback_partymembers( var_0 )
{
    if ( isdefined( level._id_66A9 ) )
        [[ level._id_66A9 ]]( var_0 );
}

_id_830C()
{
    level._id_4B5D = 1;
    level._id_4B57 = 2;
    level._id_4B58 = 4;
    level._id_4B5C = 8;
    level._id_4B61 = 16;
    level._id_4B5E = 32;
    level._id_4B5F = 64;
    level._id_4B60 = 128;
    level._id_4B5A = 256;
    level._id_4B59 = 512;
    level._id_4B5B = 1024;
}

_id_8301()
{
    _id_7F47();
    _id_830C();
}

_id_7F47()
{
    level._id_1A05 = maps\mp\gametypes\_gamelogic::_id_19F9;
    level._id_19FD = maps\mp\gametypes\_playerlogic::_id_19F0;
    level._id_19FF = maps\mp\gametypes\_playerlogic::_id_19F3;
    level._id_19FE = maps\mp\gametypes\_damage::_id_19F1;
    level._id_1A01 = maps\mp\gametypes\_damage::_id_19F5;
    level._id_19FB = maps\mp\gametypes\_damage::_id_19ED;
    level._id_1A00 = maps\mp\gametypes\_damage::_id_19F4;
    level._id_19FA = maps\mp\gametypes\_gamelogic::_id_19EC;
    level._id_1A02 = maps\mp\gametypes\_damage::_id_19F6;
    level._id_1A03 = maps\mp\gametypes\_playerlogic::_id_19F8;
    level._id_19FC = maps\mp\gametypes\_hostmigration::_id_19EE;
}

_id_06BF()
{
    level._id_1A05 = ::_id_1A06;
    level._id_19FD = ::_id_1A06;
    level._id_19FF = ::_id_1A06;
    level._id_19FE = ::_id_1A06;
    level._id_1A01 = ::_id_1A06;
    level._id_19FB = ::_id_1A06;
    level._id_1A00 = ::_id_1A06;
    level._id_19FA = ::_id_1A06;
    level._id_1A02 = ::_id_1A06;
    level._id_1A03 = ::_id_1A06;
    level._id_19FC = ::_id_1A06;
    setdvar( "g_gametype", "dm" );
    _func_16E( 0 );
}

_id_1A06()
{

}

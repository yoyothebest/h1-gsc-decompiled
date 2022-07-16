// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_99F4 = spawnstruct();
    level._id_99F4._id_01F3 = "left";
    level._id_99F4._id_0501 = "top";
    level._id_99F4.alignx = "left";
    level._id_99F4.aligny = "top";
    level._id_99F4._id_0530 = 0;
    level._id_99F4._id_0538 = 0;
    level._id_99F4._id_0524 = 0;
    level._id_99F4._id_01E8 = 0;
    level._id_99F4._id_1D3D = [];
    level._id_397D = 12;
    level._id_4AB3["allies"] = spawnstruct();
    level._id_4AB3["axis"] = spawnstruct();
    level._id_6F8B = -61;
    level._id_6F8A = 0;
    level._id_6F86 = 9;
    level._id_6F89 = 120;
    level._id_6F88 = -75;
    level._id_6F87 = 0;
    level._id_6F85 = 0.6;
    level._id_91FF = 32;
    level._id_91FC = 14;
    level._id_91FE = 192;
    level._id_91FD = 8;
    level._id_91FB = 1.65;
    level._id_58AA = "BOTTOM";
    level._id_58A9 = -90;
    level._id_58A8 = 1.0;
}

_id_397F( var_0 )
{
    self._id_1309 = self._id_0189;

    if ( isdefined( var_0 ) )
        self._id_5A39 = _func_0BF( var_0, 6.3 );
    else
        self._id_5A39 = _func_0BF( self._id_0189 * 2, 6.3 );

    self._id_4C67 = 2;
    self._id_65C4 = 4;
}

_id_397E( var_0 )
{
    self notify( "fontPulse" );
    self endon( "fontPulse" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    self _meth_808D( self._id_4C67 * 0.05 );
    self._id_0189 = self._id_5A39;
    wait(self._id_4C67 * 0.05);
    self _meth_808D( self._id_65C4 * 0.05 );
    self._id_0189 = self._id_1309;
}

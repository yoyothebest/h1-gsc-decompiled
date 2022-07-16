// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( !level._id_91EB )
        return;

    precacheshader( "headicon_dead" );
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_7C76 = [];
    }
}

_id_9B10()
{

}

_id_07DE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !level._id_91EB )
        return;

    if ( isdefined( var_4 ) && _func_1AD( var_4 ) && var_4 maps\mp\_utility::_id_05CB( "specialty_silentkill" ) )
        return;

    var_6 = var_0._id_02E2;
    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );

    if ( !var_5 )
    {
        wait 0.05;
        maps\mp\_utility::_id_A0F4();
    }

    if ( getdvar( "ui_hud_showdeathicons" ) == "0" )
        return;

    if ( level._id_46CA )
        return;

    if ( isdefined( self._id_5592 ) )
        self._id_5592 _meth_808A();

    var_7 = _func_1AB( var_2 );
    var_7._id_0530 = var_6[0];
    var_7._id_0538 = var_6[1];
    var_7._id_053B = var_6[2] + 54;
    var_7.alpha = 0.61;
    var_7.archived = 1;

    if ( level._id_8A7C )
        var_7 _meth_80CE( "headicon_dead", 14, 14 );
    else
        var_7 _meth_80CE( "headicon_dead", 7, 7 );

    var_7 _meth_80DA( 0 );
    self._id_5592 = var_7;
    var_7 thread _id_28F5( var_3 );
}

_id_28F5( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self _meth_8086( 1.0 );
    self.alpha = 0;
    wait 1.0;
    self _meth_808A();
}

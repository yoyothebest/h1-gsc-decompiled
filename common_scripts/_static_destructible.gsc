// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = getentarray( "static_destructible", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::static_destructible_think );
}

static_destructible_think()
{
    self _meth_82BC( 1 );
    self.destroyed_fx_id = loadfx( self._id_7A99 );
    var_0 = common_scripts\utility::_id_8959();
    var_0 _meth_804F( self );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_5 != "MOD_MELEE" && var_5 != "MOD_IMPACT" )
        {
            playfxontag( self.destroyed_fx_id, var_0, "tag_origin" );
            var_6 = getent( self._id_04A4, "targetname" );
            var_6 delete();
            self delete();
            wait 15;
            var_0 delete();
            break;
        }

        wait 0.05;
    }
}

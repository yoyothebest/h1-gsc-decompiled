// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    _id_805D();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::_id_1647;
}

_id_805D()
{

}

bot_gun_pick_personality_from_weapon( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_2 = level._id_1738[var_0];

        if ( isdefined( var_2 ) )
        {
            var_3 = _func_124( var_2, "| " );

            if ( maps\mp\_utility::_id_4167( var_0 ) == "weapon_pistol" )
                var_3 = [ "cqb", "run_and_gun" ];

            if ( var_3.size > 0 )
            {
                var_4 = undefined;

                if ( common_scripts\utility::_id_0CE4( var_3, var_1 ) )
                    var_4 = var_1;
                else
                    var_4 = common_scripts\utility::_id_710E( var_3 );

                maps\mp\bots\_bots_util::_id_16ED( var_4 );
            }
        }
    }
}

_id_1647()
{
    self notify( "bot_gun_think" );
    self endon( "bot_gun_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "owner_disconnect" );
    var_0 = "";
    var_1 = self._id_67DF;
    wait 0.1;

    for (;;)
    {
        var_2 = self _meth_830E();

        if ( var_2 != "none" && !maps\mp\_utility::_id_513D( var_2 ) && var_2 != var_0 )
        {
            var_0 = var_2;

            if ( self _meth_8379( "advancedPersonality" ) && self _meth_8379( "strategyLevel" ) > 0 )
            {
                var_3 = maps\mp\_utility::_id_3F11( var_2 );
                bot_gun_pick_personality_from_weapon( var_3, var_1 );
            }
        }

        self [[ self._id_67E1 ]]();
        wait 0.05;
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    setup_bot_dm();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::bot_dm_think;
}

setup_bot_dm()
{

}

bot_dm_think()
{
    self notify( "bot_dm_think" );
    self endon( "bot_dm_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "owner_disconnect" );

    for (;;)
    {
        self [[ self._id_67E1 ]]();
        wait 0.05;
    }
}

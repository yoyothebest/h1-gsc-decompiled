// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_8072();
    _id_8062();
}

_id_8072()
{
    level._id_161B["gametype_think"] = ::_id_1731;
}

_id_8062()
{

}

_id_1731()
{
    self notify( "bot_war_think" );
    self endon( "bot_war_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "owner_disconnect" );

    if ( isdefined( level.bot_ignore_personality ) )
        return;

    for (;;)
    {
        self [[ self._id_67E1 ]]();
        wait 0.05;
    }
}

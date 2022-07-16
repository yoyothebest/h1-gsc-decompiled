// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_2DD7 = 0;
    game["headicon_allies"] = maps\mp\gametypes\_teams::_id_4116( "allies" );
    game["headicon_axis"] = maps\mp\gametypes\_teams::_id_4116( "axis" );
    level thread _id_64C8();

    for (;;)
    {
        _id_9B1D();
        wait 5;
    }
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
        var_0 thread _id_64D3();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_850D();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "killed_player" );
        self._id_01E3 = "";
    }
}

_id_850D()
{
    if ( level._id_2DD7 )
    {
        if ( self._id_0308["team"] == "allies" )
        {
            self._id_01E3 = game["headicon_allies"];
            self._id_01E4 = "allies";
        }
        else
        {
            self._id_01E3 = game["headicon_axis"];
            self._id_01E4 = "axis";
        }
    }
}

_id_9B1D()
{
    var_0 = maps\mp\_utility::_id_3FDB( "scr_drawfriend", level._id_2DD7 );

    if ( level._id_2DD7 != var_0 )
    {
        level._id_2DD7 = var_0;
        _id_9B1C();
    }
}

_id_9B1C()
{
    var_0 = level._id_0323;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2._id_0308["team"] ) && var_2._id_0308["team"] != "spectator" && var_2._id_03BC == "playing" )
        {
            if ( level._id_2DD7 )
            {
                if ( var_2._id_0308["team"] == "allies" )
                {
                    var_2._id_01E3 = game["headicon_allies"];
                    var_2._id_01E4 = "allies";
                }
                else
                {
                    var_2._id_01E3 = game["headicon_axis"];
                    var_2._id_01E4 = "axis";
                }

                continue;
            }

            var_0 = level._id_0323;

            for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            {
                var_2 = var_0[var_1];

                if ( isdefined( var_2._id_0308["team"] ) && var_2._id_0308["team"] != "spectator" && var_2._id_03BC == "playing" )
                    var_2._id_01E3 = "";
            }
        }
    }
}

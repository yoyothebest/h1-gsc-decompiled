// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_4A3E = getdvar( "sv_hostname" );

    if ( level._id_4A3E == "" )
        level._id_4A3E = "CoDHost";

    setdvar( "sv_hostname", level._id_4A3E );
    level._id_0AB4 = getdvarint( "g_allowvote", 1 );
    setdvar( "g_allowvote", level._id_0AB4 );
    level._id_01A7 = maps\mp\gametypes\_tweakables::_id_4142( "team", "fftype" );
    _id_215B( getdvar( "g_gametype" ) );

    for (;;)
    {
        _id_9B68();
        wait 5;
    }
}

_id_9B68()
{
    var_0 = getdvar( "sv_hostname" );

    if ( level._id_4A3E != var_0 )
        level._id_4A3E = var_0;

    var_1 = getdvarint( "g_allowvote", 1 );

    if ( level._id_0AB4 != var_1 )
        level._id_0AB4 = var_1;

    var_2 = maps\mp\gametypes\_tweakables::_id_4142( "team", "fftype" );

    if ( level._id_01A7 != var_2 )
        level._id_01A7 = var_2;
}

_id_215B( var_0 )
{
    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( var_0 == "dm" )
        {
            if ( isdefined( var_3._id_79F7 ) && var_3._id_79F7 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "tdm" )
        {
            if ( isdefined( var_3._id_79FB ) && var_3._id_79FB != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "ctf" )
        {
            if ( isdefined( var_3._id_79F6 ) && var_3._id_79F6 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "hq" )
        {
            if ( isdefined( var_3._id_79F8 ) && var_3._id_79F8 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "sd" )
        {
            if ( isdefined( var_3._id_79FA ) && var_3._id_79FA != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "koth" )
        {
            if ( isdefined( var_3._id_79F9 ) && var_3._id_79F9 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "atdm" )
        {
            if ( isdefined( var_3._id_79F5 ) && var_3._id_79F5 != "1" )
                var_3 delete();
        }
    }
}

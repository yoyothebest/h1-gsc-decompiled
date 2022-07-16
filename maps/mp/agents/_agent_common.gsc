// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

codecallback_agentadded()
{
    maps\mp\agents\_agent_utility::_id_4D7F();
    var_0 = "axis";

    if ( level._id_628E % 2 == 0 )
        var_0 = "allies";

    level._id_628E++;
    maps\mp\agents\_agent_utility::_id_7DB1( var_0 );
    level._id_08A1[level._id_08A1.size] = self;
}

codecallback_agentdamaged( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_1 = maps\mp\_utility::_id_0683( var_1 );
    self [[ maps\mp\agents\_agent_utility::_id_08A6( "on_damaged" ) ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

codecallback_agentkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_1 = maps\mp\_utility::_id_0683( var_1 );
    self thread [[ maps\mp\agents\_agent_utility::_id_08A6( "on_killed" ) ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

init()
{
    _id_4D7E();
    level thread _id_072F();
}

_id_214C( var_0, var_1, var_2 )
{
    var_3 = maps\mp\agents\_agent_utility::_id_3FA2( var_0 );

    if ( isdefined( var_3 ) )
    {
        var_3._id_214F = gettime();

        if ( isdefined( var_1 ) )
            var_3 maps\mp\agents\_agent_utility::_id_7DB1( var_1 );
        else
            var_3 maps\mp\agents\_agent_utility::_id_7DB1( var_3._id_04A7 );

        if ( isdefined( var_2 ) )
            var_3._id_1E30 = var_2;

        if ( isdefined( level._id_0897[var_0]["onAIConnect"] ) )
            var_3 [[ var_3 maps\mp\agents\_agent_utility::_id_08A6( "onAIConnect" ) ]]();

        var_3 maps\mp\gametypes\_spawnlogic::_id_0848();
    }

    return var_3;
}

_id_4D7E()
{
    level._id_08A1 = [];
    level._id_628E = 0;
}

_id_072F()
{
    level endon( "game_ended" );
    level waittill( "connected", var_0 );
    var_1 = _func_200();

    while ( level._id_08A1.size < var_1 )
    {
        var_2 = _func_170();

        if ( !isdefined( var_2 ) )
        {
            waittillframeend;
            continue;
        }
    }
}

_id_7DB0( var_0 )
{
    self.agenthealth = var_0;
    self._id_01E6 = var_0;
    self._id_0271 = var_0;
}

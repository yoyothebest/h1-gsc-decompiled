// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5CFA()
{
    if ( !isdefined( level._id_055B ) )
        level._id_055B = spawnstruct();

    if ( !isdefined( level._id_055B._id_5CE8 ) )
        level._id_055B._id_5CE8 = spawnstruct();

    level._id_055B._id_5CE8._id_24D1 = undefined;
    level._id_055B._id_5CE8._id_A3F3 = [];
}

_id_5D00( var_0, var_1 )
{
    if ( !isdefined( level._id_055B._id_5CE8._id_24D1 ) || var_0 != level._id_055B._id_5CE8._id_24D1 )
    {
        _func_07A( 0.0 );

        if ( isdefined( var_1 ) )
            _func_078( var_0, var_1 );
        else
            _func_078( var_0 );

        level._id_055B._id_5CE8._id_24D1 = var_0;
    }
}

_id_5D01( var_0 )
{
    foreach ( var_2 in level._id_055B._id_5CE8._id_A3F3 )
    {
        if ( var_0 != var_2 )
        {
            _func_07D( var_2 );
            _func_079( var_2, 1.0 );
            level._id_055B._id_5CE8._id_A3F3[var_2] = undefined;
        }
    }

    _id_5D02( var_0 );
}

_id_5CF9( var_0, var_1 )
{
    var_2 = 1.0;

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    if ( !isdefined( var_0 ) )
    {
        foreach ( var_0 in level._id_055B._id_5CE8._id_A3F3 )
        {
            _func_07D( var_0 );
            _func_079( var_0, var_2 );
            level._id_055B._id_5CE8._id_A3F3[var_0] = undefined;
        }
    }
    else if ( isdefined( level._id_055B._id_5CE8._id_A3F3[var_0] ) )
    {
        _func_07D( var_0 );
        _func_079( var_0, var_2 );
        level._id_055B._id_5CE8._id_A3F3[var_0] = undefined;
    }
}

_id_5CF4( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        if ( var_1 == 0 )
            _id_5CF9( var_0, 0.0 );
        else
        {
            _id_5D02( var_0 );
            _func_07B( var_0, var_1, 0.0 );
        }
    }

    if ( isdefined( var_2 ) && var_2 != "none" )
    {
        if ( var_3 == 0 )
            _id_5CF9( var_2, 0.0 );
        else
        {
            _id_5D02( var_2 );
            _func_07B( var_2, var_3, 0.0 );
        }
    }
}

_id_5CF7( var_0 )
{
    _func_07A( var_0 );
    level._id_055B._id_5CE8._id_24D1 = undefined;
}

_id_5CFB( var_0 )
{
    _func_07C( var_0 );
}

_id_5CFC( var_0 )
{
    _func_07D( var_0 );
}

_id_5CF2( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        _func_078( var_0, var_1 );
    else
        _func_078( var_0 );
}

_id_5CFE( var_0, var_1, var_2 )
{
    var_3 = 0.0;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    _func_078( var_0, var_3, var_1 );
}

_id_5CF3( var_0, var_1, var_2 )
{
    var_1 = _func_0E9( var_1, 0, 1 );
    var_3 = 0.0;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    _func_07B( var_0, var_1, var_3 );
}

_id_5CF6( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        _func_079( var_0, var_1 );
    else
        _func_079( var_0 );

    if ( isdefined( level._id_055B._id_5CE8._id_24D1 ) && level._id_055B._id_5CE8._id_24D1 == var_0 )
        level._id_055B._id_5CE8._id_24D1 = undefined;
}

_id_5CF1( var_0, var_1, var_2 )
{
    var_3 = 0.0;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    _func_078( var_0, var_3, 1.0, var_1 );
}

_id_5CFD( var_0, var_1 )
{
    var_2 = [];

    if ( isstring( var_0 ) )
    {
        var_2[var_2.size] = var_0;
        var_2[var_2.size] = 0.0;
    }
    else
    {
        foreach ( var_4 in var_0 )
        {
            var_2[var_2.size] = var_4;
            var_2[var_2.size] = 0.0;
        }
    }

    _id_5CF1( "mm_mute", var_2, var_1 );
}

_id_5CF8( var_0 )
{
    if ( isdefined( var_0 ) )
        _func_079( "mm_mute", var_0 );
    else
        _func_079( "mm_mute" );
}

_id_5CFF( var_0, var_1 )
{
    var_2 = [];
    var_2[var_2.size] = "set_all";
    var_2[var_2.size] = 0.0;

    if ( isstring( var_0 ) )
    {
        var_2[var_2.size] = var_0;
        var_2[var_2.size] = 1.0;
    }
    else
    {
        foreach ( var_4 in var_0 )
        {
            var_2[var_2.size] = var_4;
            var_2[var_2.size] = 1.0;
        }
    }

    _id_5CF1( "mm_solo", var_2, var_1 );
}

_id_5CF5( var_0 )
{
    if ( isdefined( var_0 ) )
        _func_079( "mm_solo", var_0 );
    else
        _func_079( "mm_solo" );
}

_id_5D02( var_0 )
{
    if ( !isdefined( level._id_055B._id_5CE8._id_A3F3[var_0] ) )
    {
        _func_078( var_0 );
        _func_07C( var_0 );
        level._id_055B._id_5CE8._id_A3F3[var_0] = var_0;
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8653()
{
    level._id_055B._id_8F2F = spawnstruct();
    level._id_055B._id_8F2F._id_5FFB = spawnstruct();
    level._id_055B._id_8F2F._id_5FFB._id_24CA = _id_8698();
    level._id_055B._id_8F2F._id_5FFB._id_6F33 = _id_8698();
    level._id_055B._id_8F2F._id_0B16 = spawnstruct();
    level._id_055B._id_8F2F._id_0B16._id_24CA = _id_8698();
    level._id_055B._id_8F2F._id_0B16._id_6F33 = _id_8698();
}

_id_8656( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_6 = 1.0;

    if ( isdefined( var_1 ) )
        var_6 = _func_0E1( var_1, 0 );

    var_7 = 1.0;

    if ( isdefined( var_4 ) )
        var_7 = _func_0E1( var_4, 0 );

    _id_8699( level._id_055B._id_8F2F._id_0B16._id_6F33, level._id_055B._id_8F2F._id_0B16._id_24CA._id_02A7, level._id_055B._id_8F2F._id_0B16._id_24CA._id_9F37, level._id_055B._id_8F2F._id_0B16._id_24CA._id_35D9 );
    _id_8699( level._id_055B._id_8F2F._id_0B16._id_24CA, var_0, var_7, var_6 );
    _func_126( var_0, var_6, var_7 );
}

_id_8655( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_6 = 1.0;

    if ( isdefined( var_1 ) )
        var_6 = _func_0E1( var_1, 0 );

    var_7 = 1.0;

    if ( isdefined( var_2 ) )
        var_7 = var_2;

    var_8 = 1.0;

    if ( isdefined( var_3 ) )
        var_8 = _func_0E1( var_3, 0 );

    _id_8699( level._id_055B._id_8F2F._id_5FFB._id_6F33, level._id_055B._id_8F2F._id_5FFB._id_24CA._id_02A7, level._id_055B._id_8F2F._id_5FFB._id_24CA._id_9F37, level._id_055B._id_8F2F._id_5FFB._id_24CA._id_35D9 );
    _id_8699( level._id_055B._id_8F2F._id_5FFB._id_24CA, var_0, var_8, var_6 );

    if ( isdefined( var_4 ) )
    {
        _func_076( var_7, var_4 );
        _func_075( var_0, var_6, var_8, 0 );
    }
    else
        _func_075( var_0, var_6, var_8 );
}

_id_8658( var_0, var_1 )
{
    if ( var_0 != "none" )
    {
        if ( !_func_1CA( var_0 ) )
            return;

        var_3 = 1.0;

        if ( isdefined( var_1 ) )
            var_3 = _func_0E1( var_1, 0 );

        if ( level._id_055B._id_8F2F._id_0B16._id_24CA._id_02A7 == var_0 )
        {
            level._id_055B._id_8F2F._id_0B16._id_24CA = level._id_055B._id_8F2F._id_0B16._id_6F33;
            _id_8697( level._id_055B._id_8F2F._id_0B16._id_6F33 );
        }
        else if ( level._id_055B._id_8F2F._id_0B16._id_6F33._id_02A7 == var_0 )
            _id_8697( level._id_055B._id_8F2F._id_0B16._id_6F33 );

        _func_146( var_3, var_0 );
    }
}

_id_865A( var_0, var_1 )
{
    if ( !_func_1CA( var_0 ) )
        return;

    var_3 = 1.0;

    if ( isdefined( var_1 ) )
        var_3 = _func_0E1( var_1, 0 );

    if ( level._id_055B._id_8F2F._id_5FFB._id_24CA._id_02A7 == var_0 )
    {
        level._id_055B._id_8F2F._id_5FFB._id_24CA = level._id_055B._id_8F2F._id_5FFB._id_6F33;
        _id_8697( level._id_055B._id_8F2F._id_5FFB._id_6F33 );
    }
    else if ( level._id_055B._id_8F2F._id_0B16._id_6F33._id_02A7 == var_0 )
        _id_8697( level._id_055B._id_8F2F._id_5FFB._id_6F33 );

    _func_076( var_3, var_0 );
}

_id_8657( var_0 )
{
    var_1 = 1.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _func_146( var_1 );
}

_id_8659( var_0 )
{
    var_1 = 1.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _id_8697( level._id_055B._id_8F2F._id_5FFB._id_24CA );
    _id_8697( level._id_055B._id_8F2F._id_5FFB._id_6F33 );
    _func_076( var_1 );
}

_id_8654( var_0 )
{
    var_1 = 0.009;

    if ( var_0.size == 1 )
        _id_8699( level._id_055B._id_8F2F._id_0B16._id_24CA, var_0[0]._id_09D6, var_0[0]._id_9F37, var_0[0]._id_35D9 );
    else if ( var_0.size == 2 )
    {
        _id_8699( level._id_055B._id_8F2F._id_0B16._id_6F33, var_0[0]._id_09D6, var_0[0]._id_9F37, var_0[0]._id_35D9 );
        _id_8699( level._id_055B._id_8F2F._id_0B16._id_24CA, var_0[1]._id_09D6, var_0[1]._id_9F37, var_0[1]._id_35D9 );
    }

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        var_7 = var_0[var_6]._id_09D6;
        var_8 = _func_0E1( var_0[var_6]._id_9F37, 0 );
        var_9 = _func_0E9( var_0[var_6]._id_35D9, 0, 1 );

        if ( var_7 != "none" )
        {
            if ( !_func_1CA( var_7 ) )
                continue;

            if ( var_8 < var_1 )
            {
                _func_146( var_9, var_7 );
                continue;
            }

            _func_126( var_7, var_9, var_8, 0 );
        }
    }
}

_id_8651()
{
    return level._id_055B._id_8F2F._id_0B16._id_24CA._id_02A7;
}

_id_8652()
{
    return level._id_055B._id_8F2F._id_5FFB._id_24CA._id_02A7;
}

_id_8699( var_0, var_1, var_2, var_3 )
{
    var_0._id_02A7 = var_1;
    var_0._id_9F37 = var_2;
    var_0._id_35D9 = var_3;
}

_id_8698()
{
    var_0 = spawnstruct();
    var_0._id_02A7 = "";
    var_0._id_9F37 = 0.0;
    var_0._id_35D9 = 0.0;
    return var_0;
}

_id_8697( var_0 )
{
    var_0._id_02A7 = "";
    var_0._id_9F37 = 0.0;
    var_0._id_35D9 = 0.0;
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !isdefined( level._id_2C7B ) )
    {
        level._id_2C7B["nearStart"] = 0;
        level._id_2C7B["nearEnd"] = 0;
        level._id_2C7B["farStart"] = 0;
        level._id_2C7B["farEnd"] = 0;
        level._id_2C7B["nearBlur"] = 6;
        level._id_2C7B["farBlur"] = 1.8;
    }
}

_id_810B()
{

}

_id_4E31()
{

}

_id_99E3()
{

}

_id_99E1()
{

}

_id_3A04()
{

}

_id_215C()
{
    if ( !isdefined( level._id_9E6D ) )
        level._id_9E6D = [];

    var_0 = getentarray( "trigger_multiple_visionset", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_03A1 ) )
            _id_215D( var_2._id_03A1 );

        if ( isdefined( var_2._id_7B1F ) )
            _id_215D( var_2._id_7B1F );

        if ( isdefined( var_2._id_7B1E ) )
            _id_215D( var_2._id_7B1E );
    }
}

_id_215D( var_0 )
{
    if ( isdefined( level._id_9E6D[var_0] ) )
        return;

    _id_23AA( var_0 );
    _id_23E0( var_0 );
    iprintlnbold( "new vision: " + var_0 );
}

_id_23E0( var_0 )
{
    if ( !isdefined( level._id_9E73 ) )
        level._id_9E73 = [];

    var_1 = spawnstruct();
    var_1._id_02A7 = var_0;
    level._id_9E73[var_0] = var_1;
    return var_1;
}

_id_07BB()
{

}

_id_07BA( var_0 )
{

}

_id_23AA( var_0 )
{
    var_1 = _id_23DF( var_0 );
    var_1._id_8D08 = 3764.17;
    var_1._id_4500 = 19391;
    var_1._id_7299 = 0.661137;
    var_1._id_43D8 = 0.554261;
    var_1._id_14C5 = 0.454014;
    var_1._id_5A47 = 0.7;
    var_1._id_971C = 0;
    var_1._id_85CD = 0;
    var_1._id_85CF = 0;
    var_1._id_85CE = 0;
    var_1._id_479F = 0;
    var_1._id_479E = 0;
    var_1._id_47A0 = 1000;
}

_id_23DF( var_0 )
{
    if ( !isdefined( level._id_9E6D ) )
        level._id_9E6D = [];

    var_1 = spawnstruct();
    var_1._id_02A7 = var_0;
    var_1._id_85CD = 0;
    var_1._id_85CF = 0;
    var_1._id_85CE = 0;
    var_1._id_479F = 0;
    var_1._id_479E = 0;
    var_1._id_47A0 = 1000;
    level._id_9E6D[_func_123( var_0 )] = var_1;
    return var_1;
}

_id_7E34( var_0, var_1 )
{
    level._id_9E72._id_9E6B = var_0;
    level._id_9E72._id_04B7 = var_1;
    var_2 = _id_3D76( var_0 );

    if ( getdvarint( "scr_art_tweak" ) != 0 )
    {
        _id_9725( var_2 );
        var_1 = 0;
    }

    common_scripts\utility::_id_7E36( var_2, var_1 );
}

_id_9725( var_0 )
{

}

_id_4AC6()
{
    var_0 = 7;
    var_1 = [];
    var_2 = 15;
    var_3 = _func_0BC( var_0 / 2 );
    var_4 = 240 + var_3 * var_2;
    var_5 = 0.5 / var_3;
    var_6 = var_5;

    for ( var_7 = 0; var_7 < var_0; var_7++ )
    {
        var_1[var_7] = _id_05FD();
        var_1[var_7]._id_57F4 = 0;
        var_1[var_7].alignx = "left";
        var_1[var_7].aligny = "middle";
        var_1[var_7]._id_0198 = 1;
        var_1[var_7]._id_0189 = 2;
        var_1[var_7]._id_03D4 = 20;

        if ( var_7 == var_3 )
            var_1[var_7].alpha = 1;
        else
            var_1[var_7].alpha = var_6;

        var_1[var_7]._id_0530 = 20;
        var_1[var_7]._id_0538 = var_4;
        var_1[var_7] _id_0641( "." );

        if ( var_7 == var_3 )
            var_5 *= -1;

        var_6 += var_5;
        var_4 -= var_2;
    }

    level._id_88B7 = var_1;
}

_id_05FD()
{
    if ( !isdefined( level._id_7B36 ) )
        level._id_7B36 = [];

    var_0 = _func_1A9();
    level._id_7B36[level._id_7B36.size] = var_0;
    return var_0;
}

_id_0641( var_0 )
{
    self._id_71EA = var_0;
    self _meth_80CC( "_" );
    thread _id_0567();
    var_1 = 0;

    foreach ( var_3 in level._id_7B36 )
    {
        if ( isdefined( var_3._id_71EA ) )
        {
            var_1 += var_3._id_71EA.size;
            var_3 _meth_80CC( var_3._id_71EA );
        }
    }
}

_id_0567()
{
    if ( getdvar( "netconststrings_enabled" ) != "0" )
        return;

    if ( level._id_0567 )
        return;

    level._id_0567 = 1;
    self _meth_80CD();
    wait 0.05;
    level._id_0567 = 0;
}

_id_7F82()
{
    _id_7426();
    var_0 = undefined;
    var_1 = _func_1D3( level._id_9E6D );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == level._id_9E72._id_9E6B )
        {
            var_0 = var_2 + 1;
            break;
        }
    }

    if ( var_0 == var_1.size )
        return;

    _id_7F44( var_1[var_0] );
}

_id_7F81()
{
    _id_7426();
    var_0 = undefined;
    var_1 = _func_1D3( level._id_9E6D );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == level._id_9E72._id_9E6B )
        {
            var_0 = var_2 - 1;
            break;
        }
    }

    if ( var_0 < 0 )
        return;

    _id_7F44( var_1[var_0] );
}

_id_7426()
{

}

vision_set_fog_changes_mp( var_0, var_1 )
{
    foreach ( var_3 in level._id_0323 )
    {
        var_3 _meth_82D1( var_0, var_1 );
        var_3 _meth_8320( "dev_vision_exec" );
        wait 0.05;
        var_3 _meth_8322( "dev_vision_exec" );
    }

    _id_7E34( var_0, var_1 );
}

_id_7F44( var_0 )
{
    var_1 = _func_1D3( level._id_9E6D );

    if ( level._id_00E3 )
    {
        var_2 = var_0 + "_cg";
        var_3 = common_scripts\utility::_id_0CE8( var_1, var_2 );

        if ( isdefined( var_3 ) )
            var_0 = var_2;
    }

    level._id_88B8 = var_0;
    var_4 = 0;
    var_5 = _func_0BC( level._id_88B7.size / 2 );

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        if ( var_1[var_6] == var_0 )
        {
            var_4 = var_6;
            break;
        }
    }

    level._id_88B7[var_5] _id_0641( var_1[var_4] );

    for ( var_6 = 1; var_6 < level._id_88B7.size - var_5; var_6++ )
    {
        if ( var_4 - var_6 < 0 )
        {
            level._id_88B7[var_5 + var_6] _id_0641( "." );
            continue;
        }

        level._id_88B7[var_5 + var_6] _id_0641( var_1[var_4 - var_6] );
    }

    for ( var_6 = 1; var_6 < level._id_88B7.size - var_5; var_6++ )
    {
        if ( var_4 + var_6 > var_1.size - 1 )
        {
            level._id_88B7[var_5 - var_6] _id_0641( "." );
            continue;
        }

        level._id_88B7[var_5 - var_6] _id_0641( var_1[var_4 + var_6] );
    }

    vision_set_fog_changes_mp( var_1[var_4], 0 );
}

_id_3D76( var_0 )
{
    if ( !isdefined( level._id_9E6D ) )
        level._id_9E6D = [];

    var_1 = level._id_9E6D[var_0];
    return var_1;
}

_id_4CF3()
{
    if ( !isdefined( level._id_3961 ) )
    {
        level._id_3961 = spawnstruct();
        level._id_3961._id_3964 = "";
        level._id_3961._id_04B7 = 0;
    }
}

_id_6CCC()
{
    var_0 = level._id_9E72._id_9E6B;
    level._id_9E72._id_9E6B = "";
    level._id_9E72._id_04B7 = "";
    _id_4CF3();
    level._id_3961._id_3964 = "";
    level._id_3961._id_04B7 = "";
    _id_7F44( var_0 );
}

_id_1949( var_0, var_1 )
{
    var_2 = level._id_0318 _meth_8248( var_0 );

    if ( !var_2 )
        var_2 = level._id_0318 _meth_8248( var_1 );

    if ( !isdefined( level._id_1963[var_0] ) )
        level._id_1963[var_0] = 0;

    if ( gettime() < level._id_1963[var_0] )
        return 0;

    level._id_1963[var_0] = gettime() + 400;
    return var_2;
}

_id_2FC8()
{

}

_id_0D36()
{
    common_scripts\utility::_id_36B9();
}

_id_0D2D()
{
    return common_scripts\utility::_id_36B8( "\\share\\raw\\vision\\" + level._id_038E + ".vision", 1 );
}

_id_0D35()
{
    common_scripts\utility::_id_36B9();
}

_id_0D2C()
{
    return common_scripts\utility::_id_36B8( "\\share\\raw\\maps\\createart\\" + level._id_038E + "_art.gsc", 1 );
}

_id_0D2E()
{
    common_scripts\utility::_id_36B7( "" );
    common_scripts\utility::_id_36B7( "\\t//* Fog section * " );
    common_scripts\utility::_id_36B7( "" );
    common_scripts\utility::_id_36B7( "\\tsetDevDvar( \"scr_fog_disable\", \"" + getdvarint( "scr_fog_disable" ) + "\"" + " );" );
    common_scripts\utility::_id_36B7( "" );
    common_scripts\utility::_id_36B7( "\\t/$" );

    if ( _func_23A() )
        common_scripts\utility::_id_36B7( "\\tlevel._art_fog_setup = maps\\createart\\" + level._id_038E + "_fog_hdr::main;" );
    else
        common_scripts\utility::_id_36B7( "\\tlevel._art_fog_setup = maps\\createart\\" + level._id_038E + "_fog::main;" );

    common_scripts\utility::_id_36B7( "\\t$/" );
}

_id_0D2B()
{

}

_id_23C7( var_0 )
{
    if ( !isdefined( level._id_570B ) )
        level._id_570B = [];

    var_1 = spawnstruct();
    var_1._id_02A7 = var_0;
    level._id_570B[var_0] = var_1;
    return var_1;
}

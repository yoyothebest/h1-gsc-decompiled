// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_86DD()
{
    _id_86F6();
    _id_86F7();
    _id_8705();
    _id_8706();
}

_id_8755( var_0 )
{
    level._id_065D._id_24E4._id_5685 = var_0;
    level._id_0318 _meth_812C( var_0, 0 );
}

_id_86E2()
{
    return level._id_065D._id_24E4._id_5685;
}

_id_86F6()
{
    var_0 = spawnstruct();
    var_0._id_6048 = [];
    var_0._id_6048[0] = "";
    var_0._id_6048[1] = "";
    var_0._id_5685 = 0;
    level._id_065D._id_24E4 = var_0;
}

_id_86E3( var_0 )
{
    return level._id_065D._id_24E4._id_6048[var_0];
}

_id_8751( var_0, var_1 )
{
    level._id_065D._id_24E4._id_6048[var_0] = var_1;
}

_id_86F7()
{
    var_0 = spawnstruct();
    var_0._id_02A7 = "";
    level._id_065D._id_24F2 = var_0;
    _id_8752( "" );
}

_id_86E4()
{
    return level._id_065D._id_24F2._id_02A7;
}

_id_8752( var_0 )
{
    level._id_065D._id_24F2._id_02A7 = var_0;
}

_id_8704()
{
    var_0 = _id_A5E8::_id_871B( "DSP bus", [ "sounddata/dspbuses.csv" ], 2, "name", "name" );

    if ( isdefined( var_0 ) )
        level._id_065D._id_2FAE = var_0;
    else
        level._id_065D._id_2FAE = [];
}

_id_86E6()
{
    var_0 = [];

    foreach ( var_2 in level._id_065D._id_2FAE )
        var_0[var_0.size] = var_2._id_02A7;

    return var_0;
}

_id_86FF( var_0 )
{
    return isdefined( level._id_065D._id_2FAE[var_0] );
}

_id_86E7()
{
    return "sounddata/dspbuses.csv";
}

_id_8705()
{
    level._id_065D._id_36CD = spawnstruct();
    var_0 = [];
    var_0[var_0.size] = "soundtables/sp_defaults.csv";
    var_0[var_0.size] = "soundtables/" + level._id_038E + ".csv";
    level._id_065D._id_36CD._id_6F22 = _id_A5E8::_id_871B( "Filter", var_0, 6, "filter_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );
}

_id_8754( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_0318._id_32D8 ) && isdefined( level._id_0318._id_32D8["player_has_red_flashing_overlay"] ) && level._id_0318 _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
        return;

    var_3 = 0;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    if ( !isdefined( var_0 ) || isdefined( var_0 ) && ( var_0 == "" || var_0 == "none" ) )
    {
        _id_8751( var_3, "" );
        level._id_0318 _meth_812B( var_3 );
        return;
    }

    var_4 = _id_86E8( var_0 );

    if ( !isdefined( var_4 ) )
        return;

    if ( _id_86E3( var_3 ) != var_0 )
    {
        _id_8751( var_3, var_0 );
        thread _id_8756( var_3, var_4 );
    }
}

_id_8799( var_0 )
{
    self endon( "fade_begin" );
    var_1 = 0.0;
    var_2 = 0.05 / var_0;

    while ( var_1 < 1.0 )
    {
        _id_8755( var_1 );
        var_1 += var_2;
        wait 0.05;
    }

    _id_8755( 1.0 );
}

_id_86DB( var_0, var_1 )
{
    self notify( "fade_begin" );
    _id_8755( 0 );
    _id_86C2( 0 );
    _id_86C2( 1 );
    _id_8754( var_0 );
    thread _id_8799( var_1 );
}

_id_879A( var_0 )
{
    self endon( "fade_begin" );
    var_1 = _id_86E2();
    var_2 = var_1 * 0.05 / var_0;

    while ( var_1 > 0.0 )
    {
        _id_8755( var_1 );
        var_1 -= var_2;
        wait 0.05;
    }

    _id_8755( 0.0 );
}

_id_86DC( var_0 )
{
    self notify( "fade_begin" );
    thread _id_879A( var_0 );
}

_id_86E8( var_0 )
{
    if ( isdefined( level._id_065D._id_36CD._id_6F22[var_0] ) )
        return level._id_065D._id_36CD._id_6F22[var_0];

    return undefined;
}

_id_879B( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3._id_2FAD = var_1;
    var_3._id_0204 = var_0;
    var_3._id_04D9 = var_2["type"];
    var_3._id_3BD1 = var_2["gain"];
    var_3._id_3A36 = var_2["freq"];
    var_3._id_7072 = var_2["q"];
    return var_3;
}

_id_8756( var_0, var_1 )
{
    var_2 = _id_A5E8::_id_86EE();
    var_3 = [];

    foreach ( var_5 in var_1._id_8034 )
    {
        var_6 = var_5["dsp_bus_name"];

        if ( var_6 == "all" || var_6 == "set_all" )
        {
            var_7 = _id_86E6();

            foreach ( var_9 in var_7 )
                var_3[var_9] = _id_879B( var_0, var_9, var_5 );

            continue;
        }

        if ( _id_86FF( var_6 ) )
        {
            var_3[var_6] = _id_879B( var_0, var_6, var_5 );
            continue;
        }
    }

    foreach ( var_13 in var_3 )
    {
        level._id_0318 _meth_8129( var_13._id_2FAD, var_13._id_0204, var_13._id_04D9, var_13._id_3BD1, var_13._id_3A36, var_13._id_7072 );
        var_2 _id_A5E8::_id_877A();
    }
}

_id_86C2( var_0 )
{
    var_1 = 0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    _id_8754( undefined, var_1 );
}

_id_8706()
{
    level._id_065D._id_6330 = spawnstruct();
    var_0 = [];
    var_0[var_0.size] = "soundtables/sp_defaults.csv";
    var_0[var_0.size] = "soundtables/" + level._id_038E + ".csv";
    level._id_065D._id_6330._id_6F22 = _id_A5E8::_id_871B( "Filter", var_0, 6, "occlusion_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );
}

_id_8757( var_0 )
{
    if ( isdefined( level._id_0318._id_32D8 ) && isdefined( level._id_0318._id_32D8["player_has_red_flashing_overlay"] ) && level._id_0318 _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
        return;

    if ( !isdefined( var_0 ) )
    {
        _id_8752( "" );
        thread _id_86CC();
        return;
    }

    var_1 = _id_86EA( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    if ( _id_86E4() != var_0 )
    {
        _id_8752( var_0 );
        thread _id_8758( var_1._id_8034 );
    }
}

_id_86EA( var_0 )
{
    if ( isdefined( level._id_065D._id_6330._id_6F22[var_0] ) )
        return level._id_065D._id_6330._id_6F22[var_0];

    return undefined;
}

_id_8758( var_0 )
{
    var_1 = _id_A5E8::_id_86EE();

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3["dsp_bus_name"];

        if ( var_4 == "all" )
        {
            var_5 = _id_86E6();

            foreach ( var_7 in var_5 )
            {
                level._id_0318 _meth_811F( var_7, var_3["freq"], var_3["type"], var_3["gain"], var_3["q"] );
                var_1 _id_A5E8::_id_877A();
            }

            break;
            continue;
        }

        if ( _id_86FF( var_4 ) )
            level._id_0318 _meth_811F( var_4, var_3["freq"], var_3["type"], var_3["gain"], var_3["q"] );
        else
        {

        }

        var_1 _id_A5E8::_id_877A();
    }
}

_id_86D2()
{
    level._id_065D._id_6330._id_501E = 1;
}

_id_86CC()
{
    var_0 = _id_A5E8::_id_86EE();
    var_1 = _id_86E6();

    foreach ( var_3 in var_1 )
    {
        level._id_0318 _meth_8121( var_3 );
        var_0 _id_A5E8::_id_877A();
    }
}

_id_86CB()
{
    level._id_065D._id_6330._id_501E = 0;
    thread _id_86CC();
}

_id_86CF()
{
    level._id_065D._id_A3E1 = undefined;
}

_id_86D4()
{
    level._id_065D._id_A3E1 = 1;
}

_id_86F0()
{
    return isdefined( level._id_065D._id_A3E1 );
}

_id_86D0()
{
    _id_8754( undefined, 0 );
    _id_8754( undefined, 1 );
    _id_86CB();
    _id_86CF();
}

_id_86D5()
{
    var_0 = undefined;
    var_1 = "default";

    if ( isdefined( level._id_055B._id_A3E9._id_2507 ) && isdefined( level._id_055B._id_A3E9._id_A3F6[level._id_055B._id_A3E9._id_2507] ) )
    {
        var_2 = _id_A5E7::_id_121B();
        var_3 = level._id_055B._id_A3E9._id_A3F6[var_2];

        if ( isdefined( var_3["occlusion"] ) && var_3["occlusion"] != "none" )
            var_1 = var_3["occlusion"];

        if ( isdefined( var_3["filter"] ) && var_3["filter"] != "none" )
            var_0 = var_3["filter"];
    }

    if ( _id_86E4() != var_1 )
        var_1 = _id_86E4();

    _id_86D4();
    _id_8754( var_0, 0 );
    _id_8754( undefined, 1 );
    _id_8757( var_1 );
}

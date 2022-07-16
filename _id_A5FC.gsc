// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_877C()
{
    _id_8707();
    _id_8753( "" );
}

_id_8753( var_0 )
{
    level._id_065D._id_937D._id_24F6 = var_0;
}

_id_86E5()
{
    return level._id_065D._id_937D._id_24F6;
}

_id_8707()
{
    level._id_065D._id_937D = spawnstruct();
    var_0 = [];
    var_0[var_0.size] = "soundtables/sp_defaults.csv";
    var_0[var_0.size] = "soundtables/" + level._id_038E + ".csv";
    level._id_065D._id_937D._id_6F22 = _id_A5E8::_id_871B( "Timescale", var_0, 3, "timescale_names", "zone_names;reverb_names;filter_names;occlusion_names;timescale_names;dynamic_ambience_names;components;loop_defs;whizby_preset_names;mix_names;healthfx_params" );
}

_id_875A( var_0 )
{
    var_1 = _id_86EF( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    if ( _id_86E5() != var_0 )
        thread _id_875F( var_1 );
}

_id_86EF( var_0 )
{
    if ( isdefined( level._id_065D._id_937D._id_6F22 ) && isdefined( level._id_065D._id_937D._id_6F22[var_0] ) )
        return level._id_065D._id_937D._id_6F22[var_0];

    return undefined;
}

_id_875F( var_0 )
{
    var_1 = _id_A5E8::_id_86EE();

    foreach ( var_3 in var_0._id_8034 )
    {
        var_4 = var_3["dsp_bus_name"];

        if ( var_4 == "all" )
        {
            var_5 = _id_A5F7::_id_86E6();

            foreach ( var_7 in var_5 )
            {
                _func_07E( var_7, var_3["scalefactor"] );
                var_1 _id_A5E8::_id_877A();
            }

            continue;
        }

        _func_07E( var_4, var_3["scalefactor"] );
    }
}

_id_875B( var_0 )
{
    thread _id_875C( var_0 );
}

_id_875C( var_0 )
{
    var_1 = _id_A5E8::_id_86EE();
    var_2 = _id_A5F7::_id_86E6();

    foreach ( var_4 in var_2 )
    {
        _func_07E( var_4, var_0 );
        var_1 _id_A5E8::_id_877A();
    }
}

_id_875D( var_0, var_1 )
{
    thread _id_875E( var_0, var_1 );
}

_id_875E( var_0, var_1 )
{
    var_2 = _id_A5E8::_id_86EE();

    foreach ( var_4 in var_0 )
    {
        _func_07E( var_4, var_1 );
        var_2 _id_A5E8::_id_877A();
    }
}

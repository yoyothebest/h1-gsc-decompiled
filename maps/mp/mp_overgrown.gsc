// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_overgrown_precache::main();
    maps\mp\mp_overgrown_fx::main();
    maps\createart\mp_overgrown_art::main();
    maps\mp\_load::main();
    maps\mp\_water::init();
    maps\mp\_compass::_id_8324( "compass_map_mp_overgrown_dlc" );
    _func_126( "amb_mp_overgrown_ext" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    setdvar( "compassmaxrange", "2200" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    maps\mp\_utility::hardpointvisualsswap( "hp_zone_1", "patch_hp_zone_1" );
    level thread scriptpatchclip();
}

scriptpatchclip()
{
    wait 1.0;

    if ( !level._id_7137 )
    {
        var_0 = maps\mp\_utility::spawnpatchclip( "patchclip_ai_16_64_64", ( 1218, -4104, -86 ), ( 0, 0, 0 ) );
        var_1 = _func_0C7( ( 1136, -4112, -83 ), 256, 0 )[0];
        var_2 = _func_0C7( ( 1242, -4120, -78 ), 256, 0 )[0];
        _func_216( var_1, var_2 );
        var_1 = _func_0C7( ( 1136, -4112, -83 ), 256, 0 )[0];
        var_2 = _func_0C7( ( 1304, -4096, -83 ), 256, 0 )[0];
        _func_216( var_1, var_2 );
        var_1 = _func_0C7( ( 1136, -4112, -83 ), 256, 0 )[0];
        var_2 = _func_0C7( ( 1392, -4112, -83 ), 256, 0 )[0];
        _func_216( var_1, var_2 );
    }
}

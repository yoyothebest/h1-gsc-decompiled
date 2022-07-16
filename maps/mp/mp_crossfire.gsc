// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_crossfire_precache::main();
    maps\mp\mp_crossfire_fx::main();
    maps\createart\mp_crossfire_art::main();
    maps\createart\mp_crossfire_fog::main();
    maps\createart\mp_crossfire_fog_hdr::main();
    maps\mp\_load::main();
    maps\mp\_compass::_id_8324( "compass_map_mp_crossfire" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setdvar( "r_specularcolorscale", "1" );
    setdvar( "compassmaxrange", "2100" );
    thread misc_rotate_ceilingfans();
    thread knockbadpaintingoffwall();
}

misc_rotate_ceilingfans()
{
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin", "targetname" ), ::ceilingfan_rotate_custom );
    common_scripts\utility::_id_0D13( getentarray( "me_fanceil_spin_slow", "targetname" ), ::ceilingfan_rotate_slow_custom );
}

ceilingfan_rotate_custom()
{
    var_0 = 600;
    var_1 = 20000;

    for (;;)
    {
        self _meth_82B9( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

ceilingfan_rotate_slow_custom()
{
    var_0 = 50;
    var_1 = 20000;

    for (;;)
    {
        self _meth_82B9( ( 0, var_0, 0 ), var_1 );
        wait(var_1);
    }
}

knockbadpaintingoffwall()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( _func_1FE( var_0 ) )
            continue;

        thread delayimpulsepainting();
    }
}

delayimpulsepainting()
{
    level notify( "delayImpulsePainting" );
    level endon( "delayImpulsePainting" );
    wait 1;
    _func_17E( ( 5492, -730, 100 ), 15, 0, 1, 0 );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_backlot_precache::main();
    maps\mp\mp_backlot_fx::main();
    maps\createart\mp_backlot_art::main();
    maps\mp\_load::main();
    maps\mp\_compass::_id_8324( "compass_map_mp_backlot" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setdvar( "compassmaxrange", "1800" );
    thread misc_rotate_ceilingfans();
    thread movehpvisuals();
}

movehpvisuals()
{
    var_0 = getentarray( "hp_zone_1", "targetname" );

    foreach ( var_2 in var_0 )
        var_2._id_02E2 += ( 0, 0, -3 );
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

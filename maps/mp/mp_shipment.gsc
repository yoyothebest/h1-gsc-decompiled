// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_shipment_precache::main();
    maps\mp\mp_shipment_fx::main();
    maps\createart\mp_shipment_art::main();
    maps\mp\_load::main();
    maps\mp\_compass::_id_8324( "compass_map_mp_shipment" );
    _func_126( "amb_mp_shipment_ext" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
    setdvar( "compassmaxrange", "1400" );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_99E2 = 1;
    level._id_0318 = getentarray( "player", "classname" )[0];

    if ( _func_23A() )
        maps\createart\launchfacility_b_fog_hdr::main();
    else
        maps\createart\launchfacility_b_fog::main();
}

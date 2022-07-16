// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_99E2 = 1;

    if ( _func_23A() )
        maps\createart\mp_convoy_fog_hdr::main();
    else
        maps\createart\mp_convoy_fog::main();

    _func_143( "mp_convoy", 0 );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self _meth_80B3( "body_force_mark_woodland" );
    self _meth_801D( "head_force_assault_mark", "", 1 );
    self._id_477D = "head_force_assault_mark";
    self._id_9F32 = "british";
    self _meth_83D9( "vestlight" );
}

_id_032C()
{
    precachemodel( "body_force_mark_woodland" );
    precachemodel( "head_force_assault_mark" );
}

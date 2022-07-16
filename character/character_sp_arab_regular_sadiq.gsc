// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self _meth_80B3( "body_sp_arab_regular_sadiq" );
    self _meth_801D( "head_sp_arab_regular_sadiq", "", 1 );
    self._id_477D = "head_sp_arab_regular_sadiq";
    self._id_475D = "helmet_sp_arab_regular_sadiq";
    self _meth_801D( self._id_475D );
    self._id_9F32 = "arab";
    self _meth_83D9( "vestlight" );
}

_id_032C()
{
    precachemodel( "body_sp_arab_regular_sadiq" );
    precachemodel( "head_sp_arab_regular_sadiq" );
    precachemodel( "helmet_sp_arab_regular_sadiq" );
}

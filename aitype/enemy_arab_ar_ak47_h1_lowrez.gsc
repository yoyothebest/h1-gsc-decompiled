// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_0C8E = "";
    self._id_07ED = "";
    self._id_04A7 = "axis";
    self._id_04D9 = "human";
    self._id_8F7D = "regular";
    self.accuracy = 0.2;
    self._id_01E6 = 150;
    self._id_01D6 = "fraggrenade";
    self._id_01D0 = 0;
    self._id_03B3 = "beretta";
    self._id_855D = "beretta";

    if ( _func_0CF( self ) )
    {
        self _meth_8170( 128.0, 0.0 );
        self _meth_8171( 512.0, 1024.0 );
    }

    self._id_0513 = "ak47";

    switch ( codescripts\character::_id_3E43( 6 ) )
    {
        case 0:
            character\character_sp_arab_regular_asad_lowrez::main();
            break;
        case 1:
            character\character_sp_arab_regular_sadiq_lowrez::main();
            break;
        case 2:
            character\character_sp_arab_regular_ski_mask_low::main();
            break;
        case 3:
            character\character_sp_arab_regular_ski_mask2_lw::main();
            break;
        case 4:
            character\character_sp_arab_regular_suren_lowrez::main();
            break;
        case 5:
            character\character_sp_arab_regular_yasir_lowrez::main();
            break;
    }
}

_id_03D9()
{
    self _meth_8042( "axis" );
}

_id_032C()
{
    character\character_sp_arab_regular_asad_lowrez::_id_032C();
    character\character_sp_arab_regular_sadiq_lowrez::_id_032C();
    character\character_sp_arab_regular_ski_mask_low::_id_032C();
    character\character_sp_arab_regular_ski_mask2_lw::_id_032C();
    character\character_sp_arab_regular_suren_lowrez::_id_032C();
    character\character_sp_arab_regular_yasir_lowrez::_id_032C();
    precacheitem( "ak47" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}

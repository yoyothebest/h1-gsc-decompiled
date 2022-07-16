// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_0C8E = "";
    self._id_07ED = "";
    self._id_04A7 = "allies";
    self._id_04D9 = "human";
    self._id_8F7D = "regular";
    self.accuracy = 0.2;
    self._id_01E6 = 100;
    self._id_01D6 = "";
    self._id_01D0 = 0;
    self._id_03B3 = "beretta";
    self._id_855D = "";

    if ( _func_0CF( self ) )
    {
        self _meth_8170( 256.0, 0.0 );
        self _meth_8171( 768.0, 1024.0 );
    }

    self._id_0513 = "m4_grunt";

    switch ( codescripts\character::_id_3E43( 8 ) )
    {
        case 0:
            character\character_sp_sas_woodland_soldier2_a::main();
            break;
        case 1:
            character\character_sp_sas_woodland_soldier2_b::main();
            break;
        case 2:
            character\character_sp_sas_woodland_soldier2_c::main();
            break;
        case 3:
            character\character_sp_sas_woodland_soldier2_d::main();
            break;
        case 4:
            character\character_sp_sas_woodland_soldier2_e::main();
            break;
        case 5:
            character\character_sp_sas_woodland_soldier2_f::main();
            break;
        case 6:
            character\character_sp_sas_woodland_afro_01::main();
            break;
        case 7:
            character\character_sp_sas_woodland_afro_02::main();
            break;
    }
}

_id_03D9()
{
    self _meth_8042( "allies" );
}

_id_032C()
{
    character\character_sp_sas_woodland_soldier2_a::_id_032C();
    character\character_sp_sas_woodland_soldier2_b::_id_032C();
    character\character_sp_sas_woodland_soldier2_c::_id_032C();
    character\character_sp_sas_woodland_soldier2_d::_id_032C();
    character\character_sp_sas_woodland_soldier2_e::_id_032C();
    character\character_sp_sas_woodland_soldier2_f::_id_032C();
    character\character_sp_sas_woodland_afro_01::_id_032C();
    character\character_sp_sas_woodland_afro_02::_id_032C();
    precacheitem( "m4_grunt" );
    precacheitem( "beretta" );
}

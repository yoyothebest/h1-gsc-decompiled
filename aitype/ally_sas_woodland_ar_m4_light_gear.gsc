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
    self._id_01E6 = 150;
    self._id_01D6 = "fraggrenade";
    self._id_01D0 = 0;
    self._id_03B3 = "usp";
    self._id_855D = "usp";

    if ( _func_0CF( self ) )
    {
        self _meth_8170( 256.0, 0.0 );
        self _meth_8171( 768.0, 1024.0 );
    }

    self._id_0513 = "m16_basic";

    switch ( codescripts\character::_id_3E43( 12 ) )
    {
        case 0:
            character\character_sp_sas_woodland_colon_a::main();
            break;
        case 1:
            character\character_sp_sas_woodland_colon_b::main();
            break;
        case 2:
            character\character_sp_sas_woodland_colon_c::main();
            break;
        case 3:
            character\character_sp_sas_woodland_colon_d::main();
            break;
        case 4:
            character\character_sp_sas_woodland_colon_e::main();
            break;
        case 5:
            character\character_sp_sas_woodland_colon_f::main();
            break;
        case 6:
            character\character_sp_sas_woodland_golden_a::main();
            break;
        case 7:
            character\character_sp_sas_woodland_golden_b::main();
            break;
        case 8:
            character\character_sp_sas_woodland_golden_c::main();
            break;
        case 9:
            character\character_sp_sas_woodland_golden_d::main();
            break;
        case 10:
            character\character_sp_sas_woodland_golden_e::main();
            break;
        case 11:
            character\character_sp_sas_woodland_golden_f::main();
            break;
    }
}

_id_03D9()
{
    self _meth_8042( "allies" );
}

_id_032C()
{
    character\character_sp_sas_woodland_colon_a::_id_032C();
    character\character_sp_sas_woodland_colon_b::_id_032C();
    character\character_sp_sas_woodland_colon_c::_id_032C();
    character\character_sp_sas_woodland_colon_d::_id_032C();
    character\character_sp_sas_woodland_colon_e::_id_032C();
    character\character_sp_sas_woodland_colon_f::_id_032C();
    character\character_sp_sas_woodland_golden_a::_id_032C();
    character\character_sp_sas_woodland_golden_b::_id_032C();
    character\character_sp_sas_woodland_golden_c::_id_032C();
    character\character_sp_sas_woodland_golden_d::_id_032C();
    character\character_sp_sas_woodland_golden_e::_id_032C();
    character\character_sp_sas_woodland_golden_f::_id_032C();
    precacheitem( "m16_basic" );
    precacheitem( "usp" );
    precacheitem( "usp" );
    precacheitem( "fraggrenade" );
}

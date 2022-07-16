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

    self._id_0513 = "m4_grunt";

    switch ( codescripts\character::_id_3E43( 5 ) )
    {
        case 0:
            character\character_sp_sas_woodland_hugh::main();
            break;
        case 1:
            character\character_sp_sas_woodland_zied::main();
            break;
        case 2:
            character\character_sp_sas_woodland_peter::main();
            break;
        case 3:
            character\character_sp_sas_woodland_mac::main();
            break;
        case 4:
            character\character_sp_sas_woodland_todd::main();
            break;
    }
}

_id_03D9()
{
    self _meth_8042( "allies" );
}

_id_032C()
{
    character\character_sp_sas_woodland_hugh::_id_032C();
    character\character_sp_sas_woodland_zied::_id_032C();
    character\character_sp_sas_woodland_peter::_id_032C();
    character\character_sp_sas_woodland_mac::_id_032C();
    character\character_sp_sas_woodland_todd::_id_032C();
    precacheitem( "m4_grunt" );
    precacheitem( "usp" );
    precacheitem( "usp" );
    precacheitem( "fraggrenade" );
}

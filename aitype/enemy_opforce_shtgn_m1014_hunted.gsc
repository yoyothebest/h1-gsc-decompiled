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
        self _meth_8170( 0.0, 0.0 );
        self _meth_8171( 280.0, 400.0 );
    }

    self._id_0513 = "m1014";

    switch ( codescripts\character::_id_3E43( 4 ) )
    {
        case 0:
            character\character_sp_opforce_b::main();
            break;
        case 1:
            character\character_sp_opforce_c::main();
            break;
        case 2:
            character\character_sp_opforce_e::main();
            break;
        case 3:
            character\character_sp_opforce_derik::main();
            break;
    }
}

_id_03D9()
{
    self _meth_8042( "axis" );
}

_id_032C()
{
    character\character_sp_opforce_b::_id_032C();
    character\character_sp_opforce_c::_id_032C();
    character\character_sp_opforce_e::_id_032C();
    character\character_sp_opforce_derik::_id_032C();
    precacheitem( "m1014" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
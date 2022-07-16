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
    self._id_03B3 = "beretta";
    self._id_855D = "beretta";

    if ( _func_0CF( self ) )
    {
        self _meth_8170( 0.0, 0.0 );
        self _meth_8171( 256.0, 512.0 );
    }

    self._id_0513 = "skorpion";

    switch ( codescripts\character::_id_3E43( 3 ) )
    {
        case 0:
            character\character_sp_russian_loyalist_a::main();
            break;
        case 1:
            character\character_sp_russian_loyalist_b::main();
            break;
        case 2:
            character\character_sp_russian_loyalist_c::main();
            break;
    }
}

_id_03D9()
{
    self _meth_8042( "allies" );
}

_id_032C()
{
    character\character_sp_russian_loyalist_a::_id_032C();
    character\character_sp_russian_loyalist_b::_id_032C();
    character\character_sp_russian_loyalist_c::_id_032C();
    precacheitem( "skorpion" );
    precacheitem( "beretta" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}

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
    self._id_01D6 = "fraggrenade";
    self._id_01D0 = 0;
    self._id_03B3 = "usp_silencer";
    self._id_855D = "usp_silencer";

    if ( _func_0CF( self ) )
    {
        self _meth_8170( 256.0, 0.0 );
        self _meth_8171( 768.0, 1024.0 );
    }

    self._id_0513 = "g36c";
    character\character_sp_sas_woodland_gaz::main();
}

_id_03D9()
{
    self _meth_8042( "allies" );
}

_id_032C()
{
    character\character_sp_sas_woodland_gaz::_id_032C();
    precacheitem( "g36c" );
    precacheitem( "usp_silencer" );
    precacheitem( "usp_silencer" );
    precacheitem( "fraggrenade" );
}
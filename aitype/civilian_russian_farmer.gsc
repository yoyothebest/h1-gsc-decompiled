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
    self._id_03B3 = "beretta";
    self._id_855D = "colt45";

    if ( _func_0CF( self ) )
    {
        self _meth_8170( 256.0, 0.0 );
        self _meth_8171( 768.0, 1024.0 );
    }

    self._id_0513 = "ak47";
    character\character_sp_russian_farmer::main();
}

_id_03D9()
{
    self _meth_8042( "allies" );
}

_id_032C()
{
    character\character_sp_russian_farmer::_id_032C();
    precacheitem( "ak47" );
    precacheitem( "beretta" );
    precacheitem( "colt45" );
    precacheitem( "fraggrenade" );
}

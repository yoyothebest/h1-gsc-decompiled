// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_0C8E = "dog.atr";
    self._id_07ED = "";
    self._id_04A7 = "axis";
    self._id_04D9 = "dog";
    self._id_8F7D = "regular";
    self.accuracy = 0.2;
    self._id_01E6 = 200;
    self._id_01D6 = "fraggrenade";
    self._id_01D0 = 0;
    self._id_03B3 = "dog_bite";
    self._id_855D = "";

    if ( _func_0CF( self ) )
    {
        self _meth_8170( 256.0, 0.0 );
        self _meth_8171( 768.0, 1024.0 );
    }

    self._id_0513 = "dog_bite";
    character\character_sp_german_sheperd_dog::main();
}

_id_03D9()
{
    self _meth_8042( "axis" );
}

_id_032C()
{
    character\character_sp_german_sheperd_dog::_id_032C();
    precacheitem( "dog_bite" );
    precacheitem( "dog_bite" );
    precacheitem( "fraggrenade" );
}

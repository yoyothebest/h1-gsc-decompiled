// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

initchickens()
{
    waitframe;
    var_0 = getentarray( "caged_chicken", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::spawnchicken );
}

spawnchicken()
{
    var_0 = _id_A5A4::_id_88D1( "chicken" );
    thread _id_A510::_id_0C24( var_0, "cage_freakout" );
    var_1 = var_0 _id_A5A4::_id_3EF5( "cage_freakout" );
    var_2 = _func_0B5( 0, 1.0 );
    var_0 _meth_8119( var_1, var_2 );

    for (;;)
    {
        var_0 _meth_809C( "animal_chicken_idle", "sounddone" );
        var_0 waittill( "sounddone" );
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    level.cheat_invert_override = "_bright";
    thread _id_80C6();
    thread _id_7E68();
    thread play_flickering_light();
}

play_flickering_light()
{
    thread _id_A54E::_id_5D3A( "flicker_1", 0, 1, 30, undefined, undefined, 0.005, 0.5, 0.005, 0.05, undefined, undefined, 1500 );
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    _id_A5A4::_id_9E6E( "jeepride", 0 );
    level._id_0318 _id_A5A4::set_light_set_player( "jeepride" );
    level._id_0318 _meth_848C( "clut_jeepride", 0.0 );
    _func_0D6( "fx_cast_shadow", 0 );
}

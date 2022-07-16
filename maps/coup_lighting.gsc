// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4D05();
    level.cheat_invert_override = "_bright";
    thread _id_80C6();
    thread _id_7E68();
    _func_0D6( "fx_cast_shadow", 0 );
}

_id_4D05()
{

}

_id_80C6()
{

}

_id_7E68()
{
    if ( _func_23A() )
    {
        _id_A5A4::_id_9E6E( "coup", 0 );
        level._id_0318 _id_A5A4::set_light_set_player( "coup" );
        level._id_0318 _meth_848C( "clut_coup", 1.0 );
    }
}

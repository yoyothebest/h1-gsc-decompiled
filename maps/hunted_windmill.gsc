// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::_id_76B9( "windmill_wheel", ::windmill_wheel_setup );
}

windmill_wheel_setup()
{
    self.rotate_speed = 1.0;
    self _meth_8563( 1 );
    var_0 = getent( self._id_04A4, "targetname" );

    if ( !isdefined( var_0 ) )
    {

    }

    self _meth_804F( var_0 );
    thread windmill_wheel_think();
    var_0 thread windmill_top_setup();
}

windmill_top_setup()
{
    self._id_0280 = 0.1;
    self._id_026F = 1.0;
    thread windmill_top_think();
}

windmill_wheel_think()
{
    self endon( "deleting" );

    for (;;)
    {
        self _meth_8425( ( 30, 0, 0 ), self.rotate_speed );
        wait(self.rotate_speed);
    }
}

windmill_top_think()
{
    self endon( "deleting" );
    var_0 = 1.5;

    for (;;)
    {
        var_1 = _func_0B5( self._id_0280, self._id_026F );
        var_0 *= -1;
        self _meth_82B3( var_0, var_1, var_1 * 0.5, var_1 * 0.5 );
        wait(var_1);
    }
}

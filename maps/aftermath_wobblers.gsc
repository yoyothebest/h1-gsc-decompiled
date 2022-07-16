// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    common_scripts\utility::_id_76BB( "wobbler", ::wobbler_setup );
}

setup_linked_ent()
{
    if ( isdefined( self._id_04A4 ) )
    {
        var_0 = getent( self._id_04A4, "targetname" );

        if ( isdefined( var_0 ) )
            self _meth_804F( var_0 );
        else
        {

        }
    }
}

wobbler_setup()
{
    var_0 = 5;
    var_1 = 3;
    var_2 = 2;
    setup_linked_ent();

    if ( isdefined( self._id_7A30 ) )
        var_0 = self._id_7A30;

    if ( isdefined( self._id_7A2F ) )
        var_1 = self._id_7A2F;

    if ( isdefined( self._id_7B24 ) )
    {
        if ( -1 < self._id_7B24 && self._id_7B24 < 3 )
            var_2 = self._id_7B24;
    }

    self.axis = var_2;

    if ( self _meth_806A() )
    {
        self.max_angles = var_0;
        self.min_angles = var_1;
        self._id_8B31 = 0;
        thread wobbler_linked_think();
    }
    else
    {
        self.max_angles = self.angles[self.axis] + var_0;
        self.min_angles = self.angles[self.axis] - var_1;
        self._id_8B31 = self.angles[self.axis];
        thread wobbler_think();
    }
}

pick_new_target_angle( var_0 )
{
    if ( var_0 > self._id_8B31 )
        return _func_0B5( self.min_angles, self._id_8B31 );
    else
        return _func_0B5( self._id_8B31, self.max_angles );
}

update_angles_vector_from_axis( var_0, var_1, var_2 )
{
    switch ( var_0 )
    {
        case 0:
            return ( var_2, var_1[1], var_1[2] );
        case 1:
            return ( var_1[0], var_2, var_1[2] );
        case 2:
            return ( var_1[0], var_1[1], var_2 );
    }

    return var_1;
}

wobbler_think()
{
    self endon( "deleting" );
    var_0 = pick_new_target_angle( self.angles[self.axis] );

    for (;;)
    {
        var_1 = _func_0B5( 0.75, 2.0 );
        var_0 = pick_new_target_angle( self.angles[self.axis] );
        var_2 = update_angles_vector_from_axis( self.axis, self.angles, var_0 );
        self _meth_82B1( var_2, var_1, var_1 * 0.5, var_1 * 0.5 );
        wait(var_1);
    }
}

local_update_angles_vector_from_axis( var_0, var_1 )
{
    switch ( var_0 )
    {
        case 0:
            return ( var_1, 0, 0 );
        case 1:
            return ( 0, var_1, 0 );
        case 2:
            return ( 0, 0, var_1 );
    }

    return ( 0, 0, 0 );
}

wobbler_linked_think()
{
    var_0 = self.max_angles;

    for (;;)
    {
        var_1 = _func_0B5( 0.125, 0.25 );
        var_2 = local_update_angles_vector_from_axis( self.axis, var_0 );
        self _meth_8425( var_2, var_1, var_1 * 0.5, var_1 * 0.5 );
        wait(var_1);
        var_0 *= -1;
    }
}

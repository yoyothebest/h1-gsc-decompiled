// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );
    self _meth_8144( %root, 0.1 );
    self _meth_8144( %german_shepherd_idle, 0.2 );
    self _meth_8144( %german_shepherd_attackidle_knob, 0.2 );
    thread _id_585C( "attackIdle" );

    for (;;)
    {
        if ( _id_8483() )
        {
            self _meth_8144( %german_shepherd_idle, 0.2 );
            randomattackidle();
        }
        else
        {
            self _meth_8193( "face current" );
            self _meth_8144( %german_shepherd_attackidle_knob, 0.2 );
            self _meth_8115( "dog_idle", %german_shepherd_idle, 1, 0.2, self._id_0C78 );
        }

        animscripts\shared::_id_2D06( "dog_idle" );

        if ( isdefined( self._id_6F7A ) )
        {
            self._id_04CB = self._id_6F7A;
            self._id_6F7A = undefined;
        }
    }
}

isfacingenemy( var_0 )
{
    var_1 = self._id_0142._id_02E2 - self._id_02E2;
    var_2 = _func_0F1( var_1 );

    if ( var_2 < 1 )
        return 1;

    var_3 = anglestoforward( self.angles );
    return ( var_3[0] * var_1[0] + var_3[1] * var_1[1] ) / var_2 > var_0;
}

randomattackidle()
{
    self _meth_8144( %german_shepherd_attackidle_knob, 0.1 );

    if ( isfacingenemy( 0.866 ) )
        self _meth_8193( "face angle", self.angles[1] );
    else
    {
        if ( isdefined( self._id_0142 ) )
        {
            var_0 = _func_116( self._id_0142._id_02E2 - self._id_02E2 );
            var_1 = _func_0EB( var_0 - self.angles[1] );

            if ( _func_0BE( var_1 ) > 10 )
            {
                self _meth_8193( "face enemy" );
                self._id_6F7A = self._id_04CB;
                self._id_04CB = 0.3;

                if ( var_1 > 0 )
                    var_2 = %german_shepherd_rotate_ccw;
                else
                    var_2 = %german_shepherd_rotate_cw;

                self _meth_8115( "dog_turn", var_2, 1, 0.2, 1.0 );
                animscripts\shared::_id_2D06( "dog_turn" );
                self._id_04CB = self._id_6F7A;
                self._id_6F7A = undefined;
                self _meth_8144( %german_shepherd_rotate_cw, 0.2 );
                self _meth_8144( %german_shepherd_rotate_ccw, 0.2 );
            }
        }

        self _meth_8193( "face angle", self.angles[1] );
    }

    if ( _id_846C() )
        self _meth_8115( "dog_idle", %german_shepherd_attackidle_growl, 1, 0.2, 1 );
    else
    {
        var_3 = 33;
        var_4 = 66;

        if ( isdefined( self._id_5D35 ) )
        {
            if ( self._id_5D35 == "growl" )
            {
                var_3 = 15;
                var_4 = 30;
            }
            else if ( self._id_5D35 == "bark" )
            {
                var_3 = 15;
                var_4 = 85;
            }
        }

        var_5 = _func_0B2( 100 );

        if ( var_5 < var_3 )
            self _meth_8115( "dog_idle", %german_shepherd_attackidle_b, 1, 0.2, self._id_0C78 );
        else
        {
            if ( var_5 < var_4 )
            {
                self _meth_8115( "dog_idle", %german_shepherd_attackidle_bark, 1, 0.2, self._id_0C78 );
                return;
            }

            self _meth_8115( "dog_idle", %german_shepherd_attackidle_growl, 1, 0.2, self._id_0C78 );
        }
    }
}

_id_8483()
{
    return isdefined( self._id_0142 ) && _func_1A1( self._id_0142 ) && _func_0F0( self._id_02E2, self._id_0142._id_02E2 ) < 1000000;
}

_id_846C()
{
    if ( isdefined( self._id_7A0B ) )
        return 1;

    if ( !_func_1A1( self._id_0142 ) )
        return 1;

    return !self _meth_81C2( self._id_0142 );
}

_id_585C( var_0 )
{
    self endon( "killanimscript" );
    self endon( "stop tracking" );
    self _meth_8144( %german_shepherd_look_2, 0 );
    self _meth_8144( %german_shepherd_look_4, 0 );
    self _meth_8144( %german_shepherd_look_6, 0 );
    self _meth_8144( %german_shepherd_look_8, 0 );
    self _meth_8177();
    self._id_037C = 90;
    self._id_024D = -90;
    self _meth_814E( anim._id_2CD2[var_0][2], 1, 0 );
    self _meth_814E( anim._id_2CD2[var_0][4], 1, 0 );
    self _meth_814E( anim._id_2CD2[var_0][6], 1, 0 );
    self _meth_814E( anim._id_2CD2[var_0][8], 1, 0 );
    animscripts\track::_id_7F21( 1, 0.2 );
    animscripts\track::_id_9502( %german_shepherd_look_2, %german_shepherd_look_4, %german_shepherd_look_6, %german_shepherd_look_8 );
}

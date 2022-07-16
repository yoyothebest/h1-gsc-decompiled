// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self endon( "death" );
    self endon( "stop_animmode" );
    self notify( "killanimscript" );
    self._id_0670 endon( self._id_0551 );

    if ( isdefined( self._id_0579 ) )
    {
        self thread [[ self._id_0579 ]]();
        self._id_0579 = undefined;
    }

    var_0 = isdefined( self._id_0578 ) && self._id_0578;

    if ( var_0 )
    {
        self endon( "stop_loop" );
        self._id_0578 = undefined;
    }
    else
        thread _id_6216( self._id_0551 );

    var_1 = self._id_0551;
    self._id_0551 = undefined;
    var_2 = 0;

    if ( var_0 || _func_0CE( level._id_78AC[self._id_0553][var_1] ) )
    {
        var_2 = level._id_78AC[self._id_0553][var_1].size;
        var_3 = level._id_78AC[self._id_0553][var_1][_func_0B2( var_2 )];
    }
    else
        var_3 = level._id_78AC[self._id_0553][var_1];

    var_4 = _func_06F( self._id_0670._id_02E2, self._id_0670.angles, var_3 );
    var_5 = _func_070( self._id_0670._id_02E2, self._id_0670.angles, var_3 );
    var_6 = self _meth_813E( var_4 );

    if ( isdefined( var_6 ) )
        var_4 = var_6;
    else
    {

    }

    if ( !isdefined( self._id_6175 ) )
        self _meth_81C9( var_4, var_5 );

    self._id_034C = 0;
    var_7 = 0.3;
    var_8 = 0.2;

    if ( isdefined( self._id_0BAD ) )
    {
        var_7 = self._id_0BAD;
        var_8 = self._id_0BAD;
    }

    self _meth_8192( self._id_0552 );
    self _meth_8144( self._id_75DF, var_7 );
    self _meth_8193( "face angle", var_5[1] );
    var_9 = "custom_animmode";
    self _meth_8115( var_9, var_3, 1, var_8, 1 );
    self._id_0670 thread _id_A510::_id_8C17( self, var_9, var_1, self._id_0553, var_3 );
    self._id_0670 thread _id_A510::_id_0C7E( self, var_9, var_1 );
    var_10 = self._id_0670;
    self._id_0670 = undefined;
    self._id_0552 = undefined;
    self endon( "killanimscript" );
    var_11 = "end";

    if ( !var_0 )
    {
        if ( animhasnotetrack( var_3, "finish" ) )
            var_11 = "finish";
        else if ( animhasnotetrack( var_3, "stop anim" ) )
            var_11 = "stop anim";
    }

    for (;;)
    {
        self waittillmatch( var_9, var_11 );

        if ( var_0 )
        {
            var_3 = level._id_78AC[self._id_0553][var_1][_func_0B2( var_2 )];
            self _meth_8110( var_9, var_3, 1, 0.2, 1 );

            if ( isdefined( var_10 ) )
            {
                var_10 thread _id_A510::_id_8C17( self, var_9, var_1, self._id_0553, var_3 );
                var_10 thread _id_A510::_id_0C7E( self, var_9, var_1 );
            }

            continue;
        }

        break;
    }

    if ( var_11 != "end" )
        self _meth_8193( "face motion" );

    self notify( "finished_custom_animmode" + var_1 );
}

_id_6216( var_0 )
{
    self endon( "death" );
    self endon( "finished_custom_animmode" + var_0 );
    self waittill( "killanimscript" );
    self notify( "finished_custom_animmode" + var_0 );
}

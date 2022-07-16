// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( isdefined( level._id_4DB6 ) )
        return;

    level._id_4DB6 = 1;

    if ( level._id_5FEC )
    {
        foreach ( var_1 in level._id_91F7 )
        {
            var_2 = "entity_headicon_" + var_1;
            game[var_2] = maps\mp\gametypes\_teams::_id_5FDA( var_1 );
            precacheshader( game[var_2] );
        }
    }
    else
    {
        game["entity_headicon_allies"] = maps\mp\gametypes\_teams::_id_4116( "allies" );
        game["entity_headicon_axis"] = maps\mp\gametypes\_teams::_id_4116( "axis" );
        precacheshader( game["entity_headicon_allies"] );
        precacheshader( game["entity_headicon_axis"] );
    }
}

_id_7F86( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( maps\mp\_utility::_id_5112( var_0 ) && !_func_1AD( var_0 ) )
        return;

    if ( !isdefined( self._id_331A ) )
        self._id_331A = [];

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0.05;

    if ( !isdefined( var_7 ) )
        var_7 = 1;

    if ( !isdefined( var_8 ) )
        var_8 = 1;

    if ( !isdefined( var_9 ) )
        var_9 = 0;

    if ( !isdefined( var_10 ) )
        var_10 = 1;

    if ( !isdefined( var_11 ) )
        var_11 = "";

    if ( !_func_1AD( var_0 ) && var_0 == "none" )
    {
        foreach ( var_14, var_13 in self._id_331A )
        {
            if ( isdefined( var_13 ) )
                var_13 _meth_808A();

            self._id_331A[var_14] = undefined;
        }
    }
    else
    {
        if ( _func_1AD( var_0 ) )
        {
            if ( isdefined( self._id_331A[var_0._id_4450] ) )
            {
                self._id_331A[var_0._id_4450] _meth_808A();
                self._id_331A[var_0._id_4450] = undefined;
            }

            if ( var_1 == "" )
                return;

            if ( isdefined( self._id_331A[var_0._id_04A7] ) )
            {
                self._id_331A[var_0._id_04A7] _meth_808A();
                self._id_331A[var_0._id_04A7] = undefined;
            }

            var_13 = _func_1AA( var_0 );
            self._id_331A[var_0._id_4450] = var_13;
        }
        else
        {
            if ( isdefined( self._id_331A[var_0] ) )
            {
                self._id_331A[var_0] _meth_808A();
                self._id_331A[var_0] = undefined;
            }

            if ( var_1 == "" )
                return;

            foreach ( var_14, var_16 in self._id_331A )
            {
                if ( var_14 == "axis" || var_14 == "allies" )
                    continue;

                var_17 = maps\mp\_utility::_id_408B( var_14 );

                if ( var_17._id_04A7 == var_0 )
                {
                    self._id_331A[var_14] _meth_808A();
                    self._id_331A[var_14] = undefined;
                }
            }

            var_13 = _func_1AB( var_0 );
            self._id_331A[var_0] = var_13;
        }

        if ( !isdefined( var_3 ) || !isdefined( var_4 ) )
        {
            var_3 = 10;
            var_4 = 10;
        }

        var_13.archived = var_5;
        var_13.alpha = 0.85;
        var_13 _meth_80CE( var_1, var_3, var_4 );
        var_13 _meth_80DA( var_7, var_8, var_9, var_10 );

        if ( var_11 == "" )
        {
            var_13._id_0530 = self._id_02E2[0] + var_2[0];
            var_13._id_0538 = self._id_02E2[1] + var_2[1];
            var_13._id_053B = self._id_02E2[2] + var_2[2];
            var_13 thread _id_52E0( self, var_2, var_6 );
        }
        else
        {
            var_13._id_0530 = var_2[0];
            var_13._id_0538 = var_2[1];
            var_13._id_053B = var_2[2];
            var_13 _meth_80CF( self, var_11 );
        }

        thread _id_28EE();

        if ( _func_1AD( var_0 ) )
            var_13 thread _id_28F0( var_0 );

        if ( _func_1AD( self ) )
            var_13 thread _id_28F0( self );
    }
}

_id_28F0( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self _meth_808A();
}

_id_28EE()
{
    self notify( "destroyIconsOnDeath" );
    self endon( "destroyIconsOnDeath" );
    self waittill( "death" );

    foreach ( var_2, var_1 in self._id_331A )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _meth_808A();
    }
}

_id_52E0( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_3 = var_0._id_02E2;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( var_3 != var_0._id_02E2 )
        {
            var_3 = var_0._id_02E2;
            self._id_0530 = var_3[0] + var_1[0];
            self._id_0538 = var_3[1] + var_1[1];
            self._id_053B = var_3[2] + var_1[2];
        }

        if ( var_2 > 0.05 )
        {
            self.alpha = 0.85;
            self _meth_8086( var_2 );
            self.alpha = 0;
        }

        wait(var_2);
    }
}

_id_8028( var_0, var_1, var_2, var_3 )
{
    if ( !level._id_91EB )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    if ( !isdefined( self._id_331B ) )
    {
        self._id_331B = "none";
        self._id_3317 = undefined;
    }

    if ( isdefined( var_3 ) && var_3 == 0 )
        var_4 = undefined;

    var_5 = game["entity_headicon_" + var_0];
    self._id_331B = var_0;

    if ( isdefined( var_1 ) )
        self._id_3318 = var_1;
    else
        self._id_3318 = ( 0, 0, 0 );

    self notify( "kill_entity_headicon_thread" );

    if ( var_0 == "none" )
    {
        if ( isdefined( self._id_3317 ) )
            self._id_3317 _meth_808A();

        return;
    }

    var_6 = _func_1AB( var_0 );
    var_6.archived = 1;
    var_6.alpha = 0.8;
    var_6 _meth_80CE( var_5, 10, 10 );
    var_6 _meth_80DA( 0, 0, 0, 1 );
    self._id_3317 = var_6;

    if ( !isdefined( var_3 ) )
    {
        if ( var_2 == "" )
        {
            var_6._id_0530 = self._id_02E2[0] + self._id_3318[0];
            var_6._id_0538 = self._id_02E2[1] + self._id_3318[1];
            var_6._id_053B = self._id_02E2[2] + self._id_3318[2];
            thread _id_52DE();
        }
        else
        {
            var_6._id_0530 = self._id_3318[0];
            var_6._id_0538 = self._id_3318[1];
            var_6._id_053B = self._id_3318[2];
            var_6 _meth_80CF( self, var_2 );
        }
    }
    else
    {
        var_7 = anglestoup( self.angles );
        var_8 = self._id_02E2 + var_7 * 28;

        if ( var_2 == "" )
        {
            var_6._id_0530 = var_8[0];
            var_6._id_0538 = var_8[1];
            var_6._id_053B = var_8[2];
            thread _id_52DE( var_3 );
        }
        else
        {
            var_6._id_0530 = var_8[0];
            var_6._id_0538 = var_8[1];
            var_6._id_053B = var_8[2];
            var_6 _meth_80CF( self, var_2 );
        }
    }

    thread _id_28EC();
}

_id_7FE5( var_0, var_1, var_2 )
{
    if ( level._id_91EB )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    if ( !isdefined( self._id_331B ) )
    {
        self._id_331B = "none";
        self._id_3317 = undefined;
    }

    self notify( "kill_entity_headicon_thread" );

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_3317 ) )
            self._id_3317 _meth_808A();

        return;
    }

    var_3 = var_0._id_04A7;
    self._id_331B = var_3;

    if ( isdefined( var_1 ) )
        self._id_3318 = var_1;
    else
        self._id_3318 = ( 0, 0, 0 );

    var_4 = game["entity_headicon_" + var_3];
    var_5 = _func_1AA( var_0 );
    var_5.archived = 1;
    var_5.alpha = 0.8;
    var_5 _meth_80CE( var_4, 10, 10 );
    var_5 _meth_80DA( 0, 0, 0, 1 );
    self._id_3317 = var_5;

    if ( var_2 == "" )
    {
        var_5._id_0530 = self._id_02E2[0] + self._id_3318[0];
        var_5._id_0538 = self._id_02E2[1] + self._id_3318[1];
        var_5._id_053B = self._id_02E2[2] + self._id_3318[2];
        thread _id_52DE();
    }
    else
    {
        var_5._id_0530 = self._id_3318[0];
        var_5._id_0538 = self._id_3318[1];
        var_5._id_053B = self._id_3318[2];
        var_5 _meth_80CF( self, var_2 );
    }

    thread _id_28EC();
}

_id_52DE( var_0 )
{
    self endon( "kill_entity_headicon_thread" );
    self endon( "death" );
    var_1 = self._id_02E2;

    for (;;)
    {
        if ( var_1 != self._id_02E2 )
        {
            _id_9B24( var_0 );
            var_1 = self._id_02E2;
        }

        wait 0.05;
    }
}

_id_28EC()
{
    self endon( "kill_entity_headicon_thread" );
    self waittill( "death" );

    if ( !isdefined( self._id_3317 ) )
        return;

    self._id_3317 _meth_808A();
}

_id_9B24( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        self._id_3317._id_0530 = self._id_02E2[0] + self._id_3318[0];
        self._id_3317._id_0538 = self._id_02E2[1] + self._id_3318[1];
        self._id_3317._id_053B = self._id_02E2[2] + self._id_3318[2];
    }
    else
    {
        var_1 = anglestoup( self.angles );
        var_2 = self._id_02E2 + var_1 * 28;
        self._id_3317._id_0530 = var_2[0];
        self._id_3317._id_0538 = var_2[1];
        self._id_3317._id_053B = var_2[2];
    }
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0 )
{
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "saw" );

    if ( !isdefined( var_0 ) )
        return;

    self.a._id_8A1A = "saw";

    if ( isdefined( var_0._id_798E ) )
        var_1 = var_0._id_798E;
    else
        var_1 = _id_A558::_id_192C( "delay" );

    if ( isdefined( var_0._id_798D ) )
        var_2 = var_0._id_798D - var_1;
    else
        var_2 = _id_A558::_id_192C( "delay_range" );

    if ( isdefined( var_0._id_7968 ) )
        var_3 = var_0._id_7968;
    else
        var_3 = _id_A558::_id_192C( "burst" );

    if ( isdefined( var_0._id_7967 ) )
        var_4 = var_0._id_7967 - var_3;
    else
        var_4 = _id_A558::_id_192C( "burst_range" );

    var_5 = gettime();
    var_6 = "start";
    animscripts\shared::_id_6869( self._id_0513, "none" );
    var_0 _meth_8055();

    if ( isdefined( var_0._id_098B ) )
    {
        self.a._id_6E8D = ::_id_6E8D;
        self.a._id_9C3C = var_0;
        var_0 notify( "being_used" );
        thread _id_8F09();
    }
    else
        self.a._id_6E8D = ::_id_6F1D;

    var_0._id_2C7E = 0;
    thread _id_37D1( var_0 );
    self _meth_8197( self._id_6F8E );
    self _meth_8147( self._id_6F8E, 1, 0.2, 1 );
    self _meth_8148( self._id_07F5 );
    self _meth_8148( self._id_07F4 );
    var_0 _meth_8148( var_0._id_07F5 );
    var_0 _meth_8148( var_0._id_07F4 );
    var_0 endon( "death" );

    for (;;)
    {
        if ( var_0._id_2C7E )
        {
            thread _id_2D79( var_0 );
            _id_A0FB( _func_0B5( var_3, var_3 + var_4 ), var_0 );
            var_0 notify( "turretstatechange" );

            if ( var_0._id_2C7E )
            {
                thread _id_2BE1( var_0 );
                wait(_func_0B5( var_1, var_1 + var_2 ));
            }

            continue;
        }

        thread _id_2BE1( var_0 );
        var_0 waittill( "turretstatechange" );
    }
}

_id_A0FB( var_0, var_1 )
{
    var_1 endon( "turretstatechange" );
    wait(var_0);
}

_id_37D1( var_0 )
{
    self endon( "killanimscript" );
    var_1 = _func_0B7( 15 );

    for (;;)
    {
        while ( isdefined( self._id_0142 ) )
        {
            var_2 = self._id_0142._id_02E2;
            var_3 = var_0 _meth_8185( "tag_aim" );

            if ( common_scripts\utility::_id_A347( var_0._id_02E2, var_3, var_2, var_1 ) || _func_0F0( var_0._id_02E2, var_2 ) < 40000 )
            {
                if ( !var_0._id_2C7E )
                {
                    var_0._id_2C7E = 1;
                    var_0 notify( "turretstatechange" );
                }
            }
            else if ( var_0._id_2C7E )
            {
                var_0._id_2C7E = 0;
                var_0 notify( "turretstatechange" );
            }

            wait 0.05;
        }

        if ( var_0._id_2C7E )
        {
            var_0._id_2C7E = 0;
            var_0 notify( "turretstatechange" );
        }

        wait 0.05;
    }
}

_id_99C3( var_0, var_1 )
{
    if ( var_0 <= 0 )
        return;

    self endon( "killanimscript" );
    var_1 endon( "turretstatechange" );
    wait(var_0);
    var_1 notify( "turretstatechange" );
}

_id_8F09()
{
    self endon( "killanimscript" );

    for (;;)
    {
        if ( !isdefined( self._id_02BB ) || _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) > 4096 )
            self _meth_818F();

        wait 0.25;
    }
}

_id_6E8D( var_0 )
{
    if ( var_0 == "pain" )
    {
        if ( isdefined( self._id_02BB ) && _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) < 4096 )
        {
            self.a._id_9C3C _meth_8056();
            animscripts\shared::_id_6869( self._id_0513, "right" );
            self.a._id_6E8D = ::_id_6E8B;
            return;
        }
        else
            self _meth_818F();
    }

    if ( var_0 == "saw" )
    {
        var_1 = self _meth_8198();
        return;
    }

    self.a._id_9C3C delete();
    self.a._id_9C3C = undefined;
    animscripts\shared::_id_6869( self._id_0513, "right" );
}

_id_6E8B( var_0 )
{
    if ( !isdefined( self._id_02BB ) || _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) > 4096 )
    {
        self _meth_818F();
        self.a._id_9C3C delete();
        self.a._id_9C3C = undefined;

        if ( isdefined( self._id_0513 ) && self._id_0513 != "none" )
            animscripts\shared::_id_6869( self._id_0513, "right" );
    }
    else if ( var_0 != "saw" )
        self.a._id_9C3C delete();
}

_id_6F1D( var_0 )
{
    animscripts\shared::_id_6869( self._id_0513, "right" );
}
#using_animtree("generic_human");

_id_2D79( var_0 )
{
    self _meth_814D( %additive_saw_idle, 0, 0.1 );
    self _meth_814D( %additive_saw_fire, 1, 0.1 );
    var_0 _id_99B0();
    _id_99AF( var_0 );
}

_id_2BE1( var_0 )
{
    self _meth_814D( %additive_saw_idle, 1, 0.1 );
    self _meth_814D( %additive_saw_fire, 0, 0.1 );
    var_0 _id_99AE();
}

_id_99AF( var_0 )
{
    self endon( "killanimscript" );
    var_0 endon( "turretstatechange" );

    for (;;)
    {
        var_0 _meth_80EC();
        wait 0.1;
    }
}
#using_animtree("mg42");

_id_99B0()
{
    self _meth_814D( %additive_saw_idle, 0, 0.1 );
    self _meth_814D( %additive_saw_fire, 1, 0.1 );
}

_id_99AE()
{
    self _meth_814D( %additive_saw_idle, 1, 0.1 );
    self _meth_814D( %additive_saw_fire, 0, 0.1 );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_86F4()
{
    if ( !isdefined( level._id_065D ) )
    {
        level._id_065D = spawnstruct();
        level._id_065D._id_4450 = 0;
        level._id_065D._id_2791 = 1.0;
        thread _id_86F8();
        _id_86C6();
        _id_A5F9::_id_86F2();
        _id_8759( level._id_038E );
        _id_A5F7::_id_8704();
        _id_A5F7::_id_86DD();
        _id_A5FC::_id_877C();
        _id_A5F8::_id_86E0();
        _id_870D();
        _id_A5E9::_id_86C4();
    }
}

_id_86F8()
{
    level._id_065D._id_5029 = 1;
    waitframe;
    level._id_065D._id_5029 = 0;
}

_id_8700()
{
    return level._id_065D._id_5029;
}

_id_870D()
{
    level._id_065D._id_5BB9 = [];
}

_id_874D( var_0, var_1 )
{
    level._id_065D._id_5BB9[var_0] = var_1;
}

_id_8716( var_0, var_1, var_2 )
{
    level notify( "stop_other_music" );
    level endon( "stop_other_music" );

    if ( isdefined( var_2 ) )
        childthread _id_870C( "snd_music_handler", var_0, var_1, var_2 );
    else if ( isdefined( var_1 ) )
        childthread _id_870C( "snd_music_handler", var_0, var_1 );
    else
        childthread _id_870C( "snd_music_handler", var_0 );
}

_id_870C( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_065D._id_5BB9[var_0] ) )
    {
        if ( isdefined( var_3 ) )
            thread [[ level._id_065D._id_5BB9[var_0] ]]( var_1, var_2, var_3 );
        else if ( isdefined( var_2 ) )
            thread [[ level._id_065D._id_5BB9[var_0] ]]( var_1, var_2 );
        else if ( isdefined( var_1 ) )
            thread [[ level._id_065D._id_5BB9[var_0] ]]( var_1 );
        else
            thread [[ level._id_065D._id_5BB9[var_0] ]]();
    }
}

_id_874B( var_0 )
{

}

_id_874C( var_0 )
{

}

_id_86ED( var_0, var_1 )
{
    var_2 = undefined;

    if ( _func_0CE( var_1 ) )
        var_2 = var_1[var_0];

    return var_2;
}

_id_86EB()
{
    return gettime() * 0.001;
}

_id_8718()
{
    level._id_065D._id_4450++;
    return level._id_065D._id_4450;
}

_id_8708( var_0, var_1 )
{
    return _func_24D( var_0, var_1 );
}

_id_86DF()
{
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "white", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_03D4 = 1;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 1.0;
    var_0._id_0198 = 1;
    wait 0.05;
    var_0 _meth_808A();
}

_id_8760( var_0 )
{

}

_id_877A()
{
    if ( self.count >= self._id_59FA )
        wait 0.05;
    else
        self.count++;

    if ( !self._id_7437 )
        thread _id_877B();
}

_id_877B()
{
    self._id_7437 = 1;
    waitframe;
    self._id_7437 = 0;
    self.count = 0;
}

_id_86EE( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_02A7 = "throttle_waiter";
    var_1.count = 0;
    var_1._id_7437 = 0;
    var_2 = 10;

    if ( isdefined( var_0 ) )
        var_2 = _func_0E1( var_0, 1 );

    var_1._id_59FA = var_2;
    return var_1;
}

_id_8759( var_0 )
{
    level._id_065D._id_88B0 = var_0;
}

_id_86EC()
{
    return level._id_065D._id_88B0;
}

_id_871A( var_0, var_1, var_2 )
{
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        var_5 = _func_1BC( var_0, var_1, var_4 );
        var_3[var_5] = var_4;
    }

    return var_3;
}

_id_871B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        var_7 = var_1[var_6];
        var_8 = 0;
        var_9 = undefined;
        var_10 = 0;
        var_11 = 0;
        var_12 = undefined;
        var_13 = "";
        var_14 = _func_297( var_7, var_3, var_4 );

        if ( isdefined( var_14 ) )
        {
            while ( var_10 < 10 && var_8 + var_14[0] < var_14[1] )
            {
                var_15 = _func_1BC( var_7, var_8 + var_14[0], var_11 );

                if ( var_15 != "" )
                {
                    var_10 = 0;

                    if ( !isdefined( var_9 ) )
                    {
                        var_9 = _id_871A( var_7, var_8 + var_14[0], var_2 );
                        var_11 = var_9[var_3];
                    }
                    else
                    {
                        var_16 = 0;

                        if ( !isdefined( var_12 ) )
                            var_16 = 1;
                        else if ( var_15 != var_13 )
                        {
                            var_5[var_13] = var_12;
                            var_16 = 1;
                        }

                        if ( var_16 )
                        {
                            var_12 = spawnstruct();
                            var_12._id_02A7 = var_15;
                            var_12._id_8034 = [];
                            var_13 = var_15;
                        }

                        var_17 = [];

                        foreach ( var_21, var_19 in var_9 )
                        {
                            var_20 = _func_1BC( var_7, var_8 + var_14[0], var_19 );

                            if ( var_21 == var_3 )
                            {
                                if ( var_20 != var_13 )
                                    break;

                                continue;
                            }

                            if ( _id_A5A4::_id_5086( var_20 ) )
                            {
                                var_17[var_21] = _func_0BD( var_20 );
                                continue;
                            }

                            var_17[var_21] = var_20;
                        }

                        var_12._id_8034[var_12._id_8034.size] = var_17;
                    }
                }
                else
                {
                    if ( isdefined( var_12 ) )
                    {
                        var_5[var_13] = var_12;
                        var_12 = undefined;
                    }

                    var_10++;
                }

                var_8++;
            }

            if ( isdefined( var_12 ) )
            {
                var_5[var_13] = var_12;
                var_12 = undefined;
            }
        }
    }

    return var_5;
}

_id_86C6()
{

}

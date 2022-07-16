// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4CB6()
{
    if ( !isdefined( level._id_10F0 ) )
        level._id_10F0 = spawnstruct();

    _id_4D38();
    _id_4D78();
    level._id_64C9 = ::_id_64C9;
}

_id_64C9()
{
    _id_0CA7( "default" );
    _id_0CA9();
}

_id_4D38()
{
    _id_078C( "default", "generic", 0.15, 0.9, 2 );
}

_id_078C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    _id_5078( var_1 );
    var_5["roomtype"] = var_1;
    var_5["wetlevel"] = var_2;
    var_5["drylevel"] = var_3;
    var_5["fadetime"] = var_4;
    level._id_10F0._id_74F1[var_0] = var_5;
}

_id_5078( var_0 )
{

}

_id_0CA7( var_0 )
{
    if ( !isdefined( level._id_10F0._id_74F1[var_0] ) )
        var_1 = level._id_10F0._id_74F1["default"];
    else
        var_1 = level._id_10F0._id_74F1[var_0];

    self _meth_832B( "snd_enveffectsprio_level", var_1["roomtype"], var_1["drylevel"], var_1["wetlevel"], var_1["fadetime"] );
}

_id_4D78()
{
    level._id_10F0._id_A315 = [];
    _id_7F0A( 15.0, 30.0, 50.0 );
    _id_7F0B( 150.0, 250.0, 350.0 );
}

_id_7F0A( var_0, var_1, var_2 )
{
    level._id_10F0._id_A315["radius"] = [ var_0, var_1, var_2 ];
}

_id_7F0B( var_0, var_1, var_2 )
{
    level._id_10F0._id_A315["spread"] = [ var_0, var_1, var_2 ];
}

_id_0CA9()
{
    var_0 = level._id_10F0._id_A315;
    var_1 = var_0["spread"];
    var_2 = var_0["radius"];
    self _meth_8329( var_1[0], var_1[1], var_1[2] );
    self _meth_832A( var_2[0], var_2[1], var_2[2] );
}

_id_8746( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "null";

    if ( !isdefined( var_1 ) )
        var_1 = "null";

    if ( level._id_91EB )
    {
        foreach ( var_3 in level._id_0323 )
        {
            if ( isdefined( var_3 ) && _func_0D1( var_3 ) && _func_0D1( self ) && var_3._id_04A7 != self._id_04A7 )
            {
                if ( _func_1CA( var_1 ) )
                    var_3 _meth_82F1( var_1 );

                continue;
            }

            if ( isdefined( var_3 ) && _func_0D1( var_3 ) && _func_0D1( self ) && var_3._id_04A7 == self._id_04A7 )
            {
                if ( _func_1CA( var_0 ) )
                    var_3 _meth_82F1( var_0 );
            }
        }
    }
}

_id_8744( var_0, var_1, var_2, var_3 )
{

}

_id_8743( var_0, var_1, var_2 )
{
    self endon( "stop_sequencing_notetracks" );
    self endon( "death" );
    _id_87B7( var_0, var_1, var_2 );
}

_id_87B7( var_0, var_1, var_2 )
{
    for (;;)
    {
        self waittill( var_1, var_3 );

        if ( isdefined( var_3 ) && var_3 != "end" )
        {
            if ( _func_0CE( var_0 ) )
            {
                var_4 = var_0[var_3];

                if ( isdefined( var_4 ) )
                    self _meth_809C( var_4 );

                continue;
            }

            if ( var_1 == var_3 )
                self _meth_809C( var_0 );
        }
    }
}

_id_7B43( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_4 ) )
        level endon( var_4 );

    var_0 _meth_8277( var_1, var_2 );
    thread _id_7B44( var_0, var_2, var_3, var_4, var_5, var_6 );
}

_id_7B44( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_3 ) )
        level endon( var_3 );

    if ( isdefined( var_4 ) )
        var_0 endon( var_4 );

    if ( isdefined( var_5 ) )
        var_0 endon( var_5 );

    var_0 endon( "death" );

    for (;;)
    {
        var_0 waittill( var_1, var_6 );

        if ( isdefined( var_6 ) && var_6 == var_1 )
            var_0 _meth_809C( var_2 );
    }
}

scriptmodelplayanimwithnotify_uniquename( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_5 ) )
        level endon( var_5 );

    var_0 _meth_8277( var_1, var_2 );
    thread scriptmodelplayanimwithnotify_notetracks_uniquename( var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
}

scriptmodelplayanimwithnotify_notetracks_uniquename( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_4 ) )
        level endon( var_4 );

    if ( isdefined( var_5 ) )
        var_0 endon( var_5 );

    if ( isdefined( var_6 ) )
        var_0 endon( var_6 );

    var_0 endon( "death" );

    if ( _func_0CE( var_2 ) )
    {
        var_7 = var_2.size;

        for (;;)
        {
            var_0 waittill( var_1, var_8 );

            if ( isdefined( var_8 ) )
            {
                for ( var_9 = 0; var_9 < var_7; var_9++ )
                {
                    if ( var_8 == var_2[var_9] )
                        var_0 _meth_809C( var_3[var_9] );
                }
            }
        }
    }
    else
    {
        for (;;)
        {
            var_0 waittill( var_1, var_8 );

            if ( isdefined( var_8 ) && var_8 == var_2 )
                var_0 _meth_809C( var_3 );
        }
    }
}

_id_877E( var_0, var_1, var_2 )
{
    var_3 = self;
    var_4 = [ var_0, var_1, var_2 ];
    var_5[0] = spawn( "script_origin", var_3._id_02E2 );
    var_5[0] _meth_8442( var_3 );
    var_5[0] _meth_8077( var_0 );
    var_5[1] = spawn( "script_origin", var_3._id_02E2 );
    var_5[1] _meth_8442( var_3 );
    var_5[1] _meth_8077( var_1 );
    var_5[2] = spawn( "script_origin", var_3._id_02E2 );
    var_5[2] _meth_8442( var_3 );
    var_5[2] _meth_8077( var_2 );
    var_3 waittill( "death" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7 ) )
        {
            wait 0.06;
            var_7 delete();
        }
    }
}

_id_2899( var_0, var_1 )
{
    var_2 = 0.0;
    var_3 = var_1.size;
    var_4 = var_1[0];

    for ( var_5 = 1; var_5 < var_1.size; var_5++ )
    {
        var_6 = var_1[var_5];

        if ( var_0 >= var_4[0] && var_0 <= var_6[0] )
        {
            var_7 = var_4[0];
            var_8 = var_6[0];
            var_9 = var_4[1];
            var_10 = var_6[1];
            var_11 = ( var_0 - var_7 ) / ( var_8 - var_7 );
            var_2 = var_9 + var_11 * ( var_10 - var_9 );
            break;
            continue;
        }

        var_4 = var_6;
    }

    return var_2;
}

_id_8741( var_0, var_1, var_2, var_3 )
{
    var_4 = 0.2;

    if ( isdefined( var_3 ) )
        var_4 = var_3;

    var_5 = spawn( "script_origin", var_1 );
    var_5 _meth_8077( var_0 );
    thread _id_87B6( var_5, var_2, var_4 );
    return var_5;
}

_id_87B6( var_0, var_1, var_2 )
{
    level waittill( var_1 );

    if ( isdefined( var_0 ) )
    {
        var_0 _meth_8071( 0, var_2 );
        wait(var_2 + 0.05);
        var_0 delete();
    }
}

_id_8750( var_0 )
{
    level._id_9376 = 0;

    if ( !isdefined( var_0 ) )
        var_0 = 0.1;

    for (;;)
    {
        iprintln( level._id_9376 );
        wait(var_0);
        level._id_9376 += var_0;
    }
}

_id_8736( var_0, var_1, var_2, var_3 )
{
    var_4 = 9;
    var_5 = 0.75;
    var_6 = spawn( "script_origin", var_1 );
    var_6 _meth_809C( var_0 );
    var_6 thread _id_87B3( var_4, var_5 );
    return var_6;
}

_id_87B3( var_0, var_1 )
{
    var_2 = 9;
    var_3 = 0.05;
    var_4 = self;

    if ( isdefined( var_0 ) )
        var_2 = var_0;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    wait(var_2);

    if ( isdefined( var_4 ) )
    {
        var_4 _meth_8071( 0, var_3 );
        wait(var_3 + 0.05);

        if ( isdefined( var_4 ) )
            var_4 delete();
    }
}

_id_8737( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 9;
    var_6 = 0.75;
    var_7 = spawn( "script_origin", var_1 );
    var_7 thread _id_87B2( var_0, var_2, var_3, var_4 );
    return var_7;
}

_id_87B2( var_0, var_1, var_2, var_3 )
{
    wait(var_1);
    var_4 = 9;
    var_5 = 0.05;
    var_6 = self;
    var_6 _meth_809C( var_0 );

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    wait(var_4);

    if ( isdefined( var_6 ) )
    {
        var_6 _meth_8071( 0, var_5 );
        wait(var_5 + 0.05);

        if ( isdefined( var_6 ) )
            var_6 delete();
    }
}

_id_8738( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_origin", var_1._id_02E2 );
    var_4 _meth_804F( var_1 );
    var_4 thread _id_87B4( var_0, var_1, var_2, var_3 );
    return var_4;
}

_id_87B4( var_0, var_1, var_2, var_3 )
{
    var_4 = 9;
    var_5 = 0.05;
    var_6 = self;
    var_6 _meth_809C( var_0 );

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    wait(var_4);

    if ( isdefined( var_6 ) )
    {
        var_6 _meth_8071( 0, var_5 );
        wait(var_5 + 0.05);
        var_6 delete();
    }
}

_id_873A( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_1._id_02E2 );
    var_3 _meth_804F( var_1 );
    var_3 thread _id_87B5( var_0, var_1, var_2 );
    return var_3;
}

_id_87B5( var_0, var_1, var_2 )
{
    var_3 = 0.05;
    var_4 = self;
    var_4 _meth_8077( var_0 );

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    var_1 waittill( "death" );

    if ( isdefined( var_4 ) )
    {
        var_4 _meth_8071( 0, var_3 );
        wait(var_3 + 0.05);
        var_4 delete();
    }
}

_id_1029( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self ) )
    {
        var_5 = ( 1, 1, 1 );
        var_6 = ( 1, 0, 0 );
        var_7 = ( 0, 1, 0 );
        var_8 = ( 0, 1, 1 );
        var_9 = 5;
        var_10 = var_5;

        if ( isdefined( var_1 ) )
            var_9 = var_1;

        if ( isdefined( var_2 ) )
        {
            var_10 = var_2;

            switch ( var_10 )
            {
                case "red":
                    var_10 = var_6;
                    break;
                case "white":
                    var_10 = var_5;
                    break;
                case "blue":
                    var_10 = var_8;
                    break;
                case "green":
                    var_10 = var_7;
                    break;
                default:
                    var_10 = var_5;
            }
        }

        if ( isdefined( var_4 ) )
            thread _id_1117( var_4 );

        self endon( "death" );
        self endon( "aud_stop_3D_print" );

        while ( isdefined( self ) )
        {
            var_11 = var_0;

            if ( isdefined( var_3 ) )
                var_11 += self [[ var_3 ]]();

            wait 0.05;
        }
    }
}

_id_1117( var_0 )
{
    self endon( "death" );
    wait(var_0);

    if ( isdefined( self ) )
        self notify( "aud_stop_3D_print" );
}

_id_877F()
{

}

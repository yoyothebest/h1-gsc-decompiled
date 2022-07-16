// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_4C13 = 0;
    common_scripts\utility::_id_0CF0( getentarray( "wire", "targetname" ), ::_id_A344 );
    var_0 = getentarray( "shutter_left", "targetname" );
    var_1 = getentarray( "shutter_right_open", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    var_1 = getentarray( "shutter_left_closed", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 _meth_82B1( ( var_3.angles[0], var_3.angles[1] + 180, var_3.angles[2] ), 0.1 );
    }

    wait 0.2;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2]._id_8D4A = var_0[var_2].angles[1];

    var_4 = getentarray( "shutter_right", "targetname" );
    var_1 = getentarray( "shutter_left_open", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_4[var_4.size] = var_1[var_2];

    var_1 = getentarray( "shutter_right_closed", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_4[var_4.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
        var_4[var_2]._id_8D4A = var_4[var_2].angles[1];

    var_1 = undefined;
    var_5 = "left";

    for (;;)
    {
        common_scripts\utility::_id_0CF0( var_0, ::_id_8559, var_5 );
        common_scripts\utility::_id_0CF0( var_4, ::_id_855A, var_5 );
        level waittill( "wind blows", var_5 );
    }
}

_id_A333()
{
    for (;;)
    {
        var_0 = "left";

        if ( _func_0B2( 100 ) > 50 )
            var_0 = "right";

        level notify( "wind blows", var_0 );
        wait(2 + _func_0B3( 10 ));
    }
}

_id_8559( var_0, var_1 )
{
    level._id_4C13++;
    level endon( "wind blows" );
    var_2 = var_0._id_8D4A;

    if ( var_1 == "left" )
        var_2 += 179.9;

    var_3 = 0.2;
    var_0 _meth_82B1( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3 );
    wait(var_3 + 0.1);

    for (;;)
    {
        var_4 = _func_0B2( 80 );

        if ( _func_0B2( 100 ) > 50 )
            var_4 *= -1;

        var_2 = var_0.angles[1] + var_4;
        var_5 = var_0.angles[1] + var_4 * -1;

        if ( var_2 < var_0._id_8D4A || var_2 > var_0._id_8D4A + 179 )
            var_2 = var_5;

        var_6 = _func_0BE( var_0.angles[1] - var_2 );
        var_3 = var_6 * 0.02 + _func_0B3( 2 );

        if ( var_3 < 0.3 )
            var_3 = 0.3;

        var_0 _meth_82B1( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3, var_3 * 0.5, var_3 * 0.5 );
        wait(var_3);
    }
}

_id_855A( var_0, var_1 )
{
    level._id_4C13++;
    level endon( "wind blows" );
    var_2 = var_0._id_8D4A;

    if ( var_1 == "left" )
        var_2 += 179.9;

    var_3 = 0.2;
    var_0 _meth_82B1( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3 );
    wait(var_3 + 0.1);

    for (;;)
    {
        var_4 = _func_0B2( 80 );

        if ( _func_0B2( 100 ) > 50 )
            var_4 *= -1;

        var_2 = var_0.angles[1] + var_4;
        var_5 = var_0.angles[1] + var_4 * -1;

        if ( var_2 < var_0._id_8D4A || var_2 > var_0._id_8D4A + 179 )
            var_2 = var_5;

        var_6 = _func_0BE( var_0.angles[1] - var_2 );
        var_3 = var_6 * 0.02 + _func_0B3( 2 );

        if ( var_3 < 0.3 )
            var_3 = 0.3;

        var_0 _meth_82B1( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3, var_3 * 0.5, var_3 * 0.5 );
        wait(var_3);
    }
}

_id_A344( var_0 )
{
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    var_2 = var_1[0]._id_02E2;
    var_3 = var_1[1]._id_02E2;
    var_4 = _func_115( var_2 - var_3 );
    var_5 = spawn( "script_model", ( 0, 0, 0 ) );
    var_5._id_02E2 = var_2 * 0.5 + var_3 * 0.5;
    var_5.angles = var_4;
    var_0 _meth_804F( var_5 );
    var_6 = 2;
    var_7 = 0.9;
    var_8 = 4 + _func_0B3( 2 );
    var_5 _meth_82B4( var_8 * 0.5, 0.2 );
    wait 0.2;

    for (;;)
    {
        var_9 = var_6 + _func_0B3( var_7 ) - var_7 * 0.5;
        var_5 _meth_82B4( var_8, var_9, var_9 * 0.5, var_9 * 0.5 );
        wait(var_9);
        var_5 _meth_82B4( var_8 * -1, var_9, var_9 * 0.5, var_9 * 0.5 );
        wait(var_9);
    }
}

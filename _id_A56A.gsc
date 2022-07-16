// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_0318 thread _id_6C30();
    thread death_behavior();
    thread death_quote_think();
}

death_behavior()
{
    level._id_0318 waittill( "death", var_0, var_1, var_2, var_3 );
    _id_A5E8::_id_870C( "player_death" );

    if ( isdefined( var_3 ) )
    {
        var_4 = level._id_0318._id_02E2 - level._id_0318 _meth_80AA() + ( 0, 0, 35 );
        var_5 = spawn( "script_model", level._id_0318._id_02E2 + ( 0, 0, var_4[2] ) );
        var_5.angles = ( -10, level._id_0318.angles[2], 30 );
        var_5 _meth_804F( var_3 );

        if ( var_1 != "MOD_CRUSH" )
            level._id_0318 _meth_807E( var_5 );
    }

    level._id_0318 _meth_811C( 1 );
    _id_A580::_id_72DC( var_2, var_1 );
}

_id_6C30()
{
    self endon( "death" );
    self._id_55A6 = 0;

    for (;;)
    {
        while ( !self _meth_812E() )
            wait 0.05;

        self._id_55A6 = gettime();

        while ( self _meth_812E() )
            wait 0.05;
    }
}

death_quote_think()
{
    level endon( "new_quote_string" );
    level._id_0318 waittill( "death", var_0, var_1, var_2 );

    if ( getdvar( "limited_mode" ) == "1" )
        return;

    setdeadquote();
    _id_8A1E( var_0, var_1, var_2 );
}

_id_8A1E( var_0, var_1, var_2 )
{
    if ( _id_A5A4::_id_5083() )
        return;

    if ( level._id_5CDE )
        return;

    if ( var_1 != "MOD_GRENADE" && var_1 != "MOD_GRENADE_SPLASH" && var_1 != "MOD_SUICIDE" && var_1 != "MOD_EXPLOSIVE" )
        return;

    if ( level._id_3BFE >= 2 )
    {
        if ( !_id_A550::_id_5982() )
            return;
    }

    switch ( var_1 )
    {
        case "MOD_SUICIDE":
            if ( level._id_0318._id_55A6 - gettime() > 3500.0 )
                return;

            thread _id_43E5( &"SCRIPT_GRENADE_SUICIDE_LINE1", &"SCRIPT_GRENADE_SUICIDE_LINE2" );
            break;
        case "MOD_EXPLOSIVE":
            if ( level._id_0318 _id_290A( var_0 ) )
                return;

            if ( level._id_0318 _id_9CA1( var_0 ) )
                return;

            if ( level._id_0318 _id_353E( var_0 ) )
                return;

            break;
        case "MOD_GRENADE":
        case "MOD_GRENADE_SPLASH":
            if ( isdefined( var_2 ) && !_func_120( var_2, "grenade" ) )
                return;

            _id_7E03( "@SCRIPT_GRENADE_DEATH" );
            thread _id_43E6();
            break;
        default:
            break;
    }
}

_id_9CA1( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0.code_classname != "script_vehicle" )
        return 0;

    _id_7E03( "@SCRIPT_EXPLODING_VEHICLE_DEATH" );
    thread _id_7E04( "hud_burningcaricon", 50, 50 );
    return 1;
}

_id_290A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_0._id_0117 ) )
        return 0;

    if ( _func_120( var_0._id_0117, "vehicle" ) )
    {
        _id_7E03( "@SCRIPT_EXPLODING_VEHICLE_DEATH" );
        thread _id_7E04( "hud_burningcaricon", 50, 50 );
    }
    else
    {
        _id_7E03( "@SCRIPT_EXPLODING_DESTRUCTIBLE_DEATH" );
        thread _id_7E04( "hud_destructibledeathicon", 96, 96 );
    }

    return 1;
}

_id_353E( var_0 )
{
    if ( isdefined( level._id_55A0 ) )
    {
        if ( gettime() != level._id_55A0["time"] )
            return 0;

        var_1 = _func_0EE( self._id_02E2, level._id_55A0["origin"] );

        if ( var_1 > level._id_55A0["radius"] )
            return 0;

        _id_7E03( "@SCRIPT_EXPLODING_BARREL_DEATH" );
        thread _id_7E04( "hud_burningbarrelicon", 50, 50 );
        return 1;
    }

    return 0;
}

_id_7E03( var_0 )
{
    if ( getdvar( "limited_mode" ) == "1" )
        return;

    setdvar( "ui_deadquote", var_0 );
}

setdeadquote()
{
    if ( !level._id_5CDE )
    {
        var_0 = _func_0BC( _func_1BB( "sp/deathQuoteTable.csv", 1, "size", 0 ) );
        var_1 = _func_0B2( var_0 );

        if ( getdvar( "cycle_deathquotes" ) != "" )
        {
            if ( getdvar( "ui_deadquote_index" ) == "" )
                setdvar( "ui_deadquote_index", "0" );

            var_1 = getdvarint( "ui_deadquote_index" );
            setdvar( "ui_deadquote", _id_5866( var_1 ) );
            var_1++;

            if ( var_1 > var_0 - 1 )
                var_1 = 0;

            setdvar( "ui_deadquote_index", var_1 );
        }
        else
            setdvar( "ui_deadquote", _id_5866( var_1 ) );
    }
}

_id_263A( var_0 )
{
    if ( var_0 == getdvar( "ui_deadquote_v1" ) )
        return 1;

    if ( var_0 == getdvar( "ui_deadquote_v2" ) )
        return 1;

    if ( var_0 == getdvar( "ui_deadquote_v3" ) )
        return 1;

    return 0;
}

_id_5866( var_0 )
{
    var_1 = _func_1BB( "sp/deathQuoteTable.csv", 0, var_0, 1 );

    if ( _func_123( var_1[0] ) != _func_123( "@" ) )
        var_1 = "@" + var_1;

    return var_1;
}

_id_43E5( var_0, var_1 )
{
    level._id_0318._id_3615 = 1;

    if ( getdvar( "limited_mode" ) == "1" )
        return;

    _id_7E03( "" );
    wait 2.5;
    var_2 = _func_1A9();
    var_2._id_3026 = "font";
    var_2._id_0188 = "default";
    var_2._id_0189 = 1;
    var_2._id_0530 = 0;
    var_2._id_0538 = -30;
    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2._id_01F3 = "center";
    var_2._id_0501 = "middle";
    var_2 _meth_80CC( var_0 );
    var_2._id_0198 = 1;
    var_2.alpha = 0;
    var_2 _meth_8086( 2 );
    var_2.alpha = 1;
    var_2._id_01ED = 1;

    if ( isdefined( var_1 ) )
    {
        var_2 = _func_1A9();
        var_2._id_3026 = "font";
        var_2._id_0188 = "default";
        var_2._id_0189 = 1;
        var_2._id_0530 = 0;
        var_2._id_0538 = -25 + level._id_397D * var_2._id_0189;
        var_2.alignx = "center";
        var_2.aligny = "middle";
        var_2._id_01F3 = "center";
        var_2._id_0501 = "middle";
        var_2 _meth_80CC( var_1 );
        var_2._id_0198 = 1;
        var_2.alpha = 0;
        var_2 _meth_8086( 2 );
        var_2.alpha = 1;
        var_2._id_01ED = 1;
    }
}

_id_43E6()
{
    if ( getdvar( "limited_mode" ) == "1" )
        return;

    wait 2.5;
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 20;
    var_0 _meth_80CE( "hud_grenadeicon", 25, 25 );
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0._id_01F3 = "center";
    var_0._id_0501 = "middle";
    var_0._id_0198 = 1;
    var_0.alpha = 0;
    var_0 _meth_8086( 2 );
    var_0.alpha = 1;
    var_0._id_01ED = 1;
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "hud_grenadepointer", 25, 13 );
    var_0.alignx = "center";
    var_0.aligny = "middle";
    var_0._id_01F3 = "center";
    var_0._id_0501 = "middle";
    var_0._id_0198 = 1;
    var_0.alpha = 0;
    var_0 _meth_8086( 2 );
    var_0.alpha = 1;
    var_0._id_01ED = 1;
}

_id_7E04( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 2.5;

    wait(var_3);
    var_4 = _func_1A9();
    var_4._id_0530 = 0;
    var_4._id_0538 = 25;
    var_4 _meth_80CE( var_0, var_1, var_2 );
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4._id_01F3 = "center";
    var_4._id_0501 = "middle";
    var_4._id_0198 = 1;
    var_4.alpha = 0;
    var_4 _meth_8086( 2 );
    var_4.alpha = 1;
    var_4._id_01ED = 1;
}

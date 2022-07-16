// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    animscripts\move::main();
}

_id_1DDA( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0 < -60 && var_0 > -120 )
        var_2 = level._id_78AC[self._id_0C72]["turn_left_90"];

    if ( var_0 > 60 && var_0 < 120 )
        var_2 = level._id_78AC[self._id_0C72]["turn_right_90"];

    if ( isdefined( var_2 ) && animscripts\move::_id_66D4( var_2 ) )
        return var_2;
    else
        return undefined;
}
#using_animtree("generic_human");

_id_1DA5( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0 < -22.5 )
    {
        if ( var_0 > -45 )
            var_2 = %civilian_run_upright_turnl45;
        else if ( var_0 > -112.5 )
            var_2 = %civilian_run_upright_turnl90;
        else if ( var_0 > -157.5 )
            var_2 = %civilian_run_upright_turnl135;
        else
            var_2 = %civilian_run_upright_turn180;
    }
    else if ( var_0 > 22.5 )
    {
        if ( var_0 < 45 )
            var_2 = %civilian_run_upright_turnr45;
        else if ( var_0 < 112.5 )
            var_2 = %civilian_run_upright_turnr90;
        else if ( var_0 < 157.5 )
            var_2 = %civilian_run_upright_turnr135;
        else
            var_2 = %civilian_run_upright_turn180;
    }

    if ( isdefined( var_2 ) && animscripts\move::_id_66D4( var_2 ) )
        return var_2;
    else
        return undefined;
}

_id_1DA4( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    if ( var_0 < -22.5 )
    {
        if ( var_0 > -45 )
            var_2 = %civilian_run_hunched_turnl45;
        else if ( var_0 > -112.5 )
        {
            var_2 = %civilian_run_hunched_turnl90;
            var_3 = animscripts\utility::_id_711E( %civilian_run_hunched_turnl90_slide, %civilian_run_hunched_turnl90_stumble );
        }
        else if ( var_0 > -157.5 )
            var_2 = %civilian_run_upright_turnl135;
        else
            var_2 = %civilian_run_upright_turn180;
    }
    else if ( var_0 > 22.5 )
    {
        if ( var_0 < 45 )
            var_2 = %civilian_run_hunched_turnr45;
        else if ( var_0 < 112.5 )
        {
            var_2 = %civilian_run_hunched_turnr90;
            var_3 = animscripts\utility::_id_711E( %civilian_run_hunched_turnr90_slide, %civilian_run_hunched_turnr90_stumble );
        }
        else if ( var_0 < 157.5 )
            var_2 = %civilian_run_upright_turnr135;
        else
            var_2 = %civilian_run_upright_turn180;
    }

    if ( isdefined( var_3 ) && _func_0B2( 3 ) < 2 && animscripts\move::_id_66D4( var_3 ) )
        return var_3;

    if ( isdefined( var_2 ) && animscripts\move::_id_66D4( var_2 ) )
        return var_2;
    else
        return undefined;
}

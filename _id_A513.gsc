// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_A5A4::_id_7DF3();
    level._id_2C7B["nearStart"] = 1;
    level._id_2C7B["nearEnd"] = 1;
    level._id_2C7B["farStart"] = 500;
    level._id_2C7B["farEnd"] = 500;
    level._id_2C7B["nearBlur"] = 4.5;
    level._id_2C7B["farBlur"] = 0.05;
    level._id_24FC = "default";
    level._id_0567 = 0;
    _id_2C58();
    _id_929B();
    precachemenu( "dev_vision_noloc" );
    precachemenu( "dev_vision_exec" );
    level._id_8A24 = [];
    level._id_1963 = [];

    if ( !isdefined( level._id_9E72 ) )
    {
        level._id_9E72 = spawnstruct();
        level._id_9E72._id_9E6B = "";
        level._id_9E72._id_04B7 = 0;
    }

    if ( !isdefined( level._id_8FCE ) )
        level._id_8FCE = [];

    if ( !isdefined( level._id_9E6D ) )
    {
        level._id_9E6D = [];
        _id_23AA( level._id_038E );
        common_scripts\_artcommon::_id_7F73();
    }

    if ( !isdefined( level._id_038E ) )
        level._id_038E = _func_123( getdvar( "mapname" ) );
}

setdefaultdepthoffield()
{
    self _meth_818A( level._id_2C7B["nearStart"], level._id_2C7B["nearEnd"], level._id_2C7B["farStart"], level._id_2C7B["farEnd"], level._id_2C7B["nearBlur"], level._id_2C7B["farBlur"] );
}

_id_23AA( var_0 )
{
    var_1 = _id_A5A4::_id_23DF( var_0 );
    var_1._id_8D08 = 3764.17;
    var_1._id_4500 = 19391;
    var_1._id_7299 = 0.661137;
    var_1._id_43D8 = 0.554261;
    var_1._id_14C5 = 0.454014;
    var_1._id_5A47 = 0.7;
    var_1._id_971C = 0;
    var_1._id_85CD = 0;
    var_1._id_85CF = 0;
    var_1._id_85CE = 0;
    var_1._id_479F = 0;
    var_1._id_479E = 0;
    var_1._id_47A0 = 1000;
}

_id_3D77()
{
    if ( _func_23A() )
        return "\\share\\raw\\maps\\createart\\" + common_scripts\utility::_id_3E94() + "_fog_hdr.gsc";
    else
        return "\\share\\raw\\maps\\createart\\" + common_scripts\utility::_id_3E94() + "_fog.gsc";
}

_id_2C6E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    level._id_2C3D[var_0][var_1]["nearStart"] = var_2;
    level._id_2C3D[var_0][var_1]["nearEnd"] = var_3;
    level._id_2C3D[var_0][var_1]["nearBlur"] = var_4;
    level._id_2C3D[var_0][var_1]["farStart"] = var_5;
    level._id_2C3D[var_0][var_1]["farEnd"] = var_6;
    level._id_2C3D[var_0][var_1]["farBlur"] = var_7;
    level._id_2C3D[var_0][var_1]["weight"] = var_8;

    if ( isdefined( var_9 ) )
        level._id_2C3D[var_0][var_1]["bias"] = var_9;
}

_id_2C43( var_0 )
{
    if ( level._id_2C3D[var_0]["timeRemaining"] <= 0.0 )
        return;

    var_1 = _func_0BF( 1.0, 0.05 / level._id_2C3D[var_0]["timeRemaining"] );
    level._id_2C3D[var_0]["timeRemaining"] -= 0.05;

    if ( level._id_2C3D[var_0]["timeRemaining"] <= 0.0 )
    {
        level._id_2C3D[var_0]["timeRemaining"] = 0.0;
        level._id_2C3D[var_0]["current"]["nearStart"] = level._id_2C3D[var_0]["goal"]["nearStart"];
        level._id_2C3D[var_0]["current"]["nearEnd"] = level._id_2C3D[var_0]["goal"]["nearEnd"];
        level._id_2C3D[var_0]["current"]["nearBlur"] = level._id_2C3D[var_0]["goal"]["nearBlur"];
        level._id_2C3D[var_0]["current"]["farStart"] = level._id_2C3D[var_0]["goal"]["farStart"];
        level._id_2C3D[var_0]["current"]["farEnd"] = level._id_2C3D[var_0]["goal"]["farEnd"];
        level._id_2C3D[var_0]["current"]["farBlur"] = level._id_2C3D[var_0]["goal"]["farBlur"];
        level._id_2C3D[var_0]["current"]["weight"] = level._id_2C3D[var_0]["goal"]["weight"];
        return;
    }

    level._id_2C3D[var_0]["current"]["nearStart"] += var_1 * ( level._id_2C3D[var_0]["goal"]["nearStart"] - level._id_2C3D[var_0]["current"]["nearStart"] );
    level._id_2C3D[var_0]["current"]["nearEnd"] += var_1 * ( level._id_2C3D[var_0]["goal"]["nearEnd"] - level._id_2C3D[var_0]["current"]["nearEnd"] );
    level._id_2C3D[var_0]["current"]["nearBlur"] += var_1 * ( level._id_2C3D[var_0]["goal"]["nearBlur"] - level._id_2C3D[var_0]["current"]["nearBlur"] );
    level._id_2C3D[var_0]["current"]["farStart"] += var_1 * ( level._id_2C3D[var_0]["goal"]["farStart"] - level._id_2C3D[var_0]["current"]["farStart"] );
    level._id_2C3D[var_0]["current"]["farEnd"] += var_1 * ( level._id_2C3D[var_0]["goal"]["farEnd"] - level._id_2C3D[var_0]["current"]["farEnd"] );
    level._id_2C3D[var_0]["current"]["farBlur"] += var_1 * ( level._id_2C3D[var_0]["goal"]["farBlur"] - level._id_2C3D[var_0]["current"]["farBlur"] );
    level._id_2C3D[var_0]["current"]["weight"] += var_1 * ( level._id_2C3D[var_0]["goal"]["weight"] - level._id_2C3D[var_0]["current"]["weight"] );
}

_id_2C58()
{
    if ( getdvar( "scr_dof_enable" ) == "" )
        _func_0D6( "scr_dof_enable", "1" );

    setdvar( "ads_dof_tracedist", 8192 );
    setdvar( "ads_dof_maxEnemyDist", 10000 );
    setdvar( "ads_dof_playerForgetEnemyTime", 5000 );
    setdvar( "ads_dof_nearStartScale", 0.25 );
    setdvar( "ads_dof_nearEndScale", 0.85 );
    setdvar( "ads_dof_farStartScale", 1.15 );
    setdvar( "ads_dof_farEndScale", 3 );
    setdvar( "ads_dof_nearBlur", 4 );
    setdvar( "ads_dof_farBlur", 1.5 );
    setdvar( "ads_dof_debug", 0 );
    var_0 = 1;
    var_1 = 1;
    var_2 = 4.5;
    var_3 = 500;
    var_4 = 500;
    var_5 = 0.05;
    level._id_2C3D = [];
    level._id_2C3D["base"] = [];
    level._id_2C3D["base"]["current"] = [];
    level._id_2C3D["base"]["goal"] = [];
    level._id_2C3D["base"]["timeRemaining"] = 0.0;
    _id_2C6E( "base", "current", var_0, var_1, var_2, var_3, var_4, var_5, 1.0, 0.5 );
    _id_2C6E( "base", "goal", 0, 0, 0, 0, 0, 0, 0.0, 0.5 );
    level._id_2C3D["script"] = [];
    level._id_2C3D["script"]["current"] = [];
    level._id_2C3D["script"]["goal"] = [];
    level._id_2C3D["script"]["timeRemaining"] = 0.0;
    _id_2C6E( "script", "current", 0, 0, 0, 0, 0, 0, 0.0, 0.5 );
    _id_2C6E( "script", "goal", 0, 0, 0, 0, 0, 0, 0.0, 0.5 );
    level._id_2C3D["ads"] = [];
    level._id_2C3D["ads"]["current"] = [];
    level._id_2C3D["ads"]["goal"] = [];
    _id_2C6E( "ads", "current", 0, 0, 0, 0, 0, 0, 0.0, 0.5 );
    _id_2C6E( "ads", "goal", 0, 0, 0, 0, 0, 0, 0.0, 0.5 );
    level._id_2C3D["results"] = [];
    level._id_2C3D["results"]["current"] = [];
    _id_2C6E( "results", "current", var_0, var_1, var_2, var_3, var_4, var_5, 1.0, 0.5 );

    foreach ( var_7 in level._id_0323 )
        var_7 thread _id_2C77();

    level._id_0318 _id_A5A4::_id_27EF( 1, ::dof_monitor_prone );
}

_id_2C6C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _id_2C6E( "base", "goal", var_0, var_1, var_2, var_3, var_4, var_5, 1.0, var_7 );
    level._id_2C3D["base"]["timeRemaining"] = var_6;

    if ( var_6 <= 0.0 )
        _id_2C6E( "base", "current", var_0, var_1, var_2, var_3, var_4, var_5, 1.0, var_7 );
}

_id_2C4B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _id_2C6E( "script", "goal", var_0, var_1, var_2, var_3, var_4, var_5, 1.0, var_7 );
    level._id_2C3D["script"]["timeRemaining"] = var_6;

    if ( var_6 <= 0.0 )
        _id_2C6E( "script", "current", var_0, var_1, var_2, var_3, var_4, var_5, 1.0, var_7 );
    else if ( level._id_2C3D["script"]["current"]["weight"] <= 0.0 )
        _id_2C6E( "script", "current", var_0, var_1, var_2, var_3, var_4, var_5, 0.0, var_7 );
}

_id_2C47( var_0 )
{
    level._id_2C3D["script"]["goal"]["weight"] = 0.0;
    level._id_2C3D["script"]["timeRemaining"] = var_0;

    if ( var_0 <= 0.0 )
        level._id_2C3D["script"]["current"]["weight"] = 0.0;
}

_id_2C48( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    _id_2C6E( "ads", "goal", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

    if ( level._id_2C3D["ads"]["current"]["weight"] <= 0.0 )
        _id_2C6E( "ads", "current", var_0, var_1, var_2, var_3, var_4, var_5, 0.0, var_7 );
}

_id_2C41( var_0, var_1, var_2, var_3 )
{
    if ( var_0 > var_1 )
    {
        var_4 = ( var_0 - var_1 ) * var_3;

        if ( var_4 > var_2 )
            var_4 = var_2;
        else if ( var_4 < 1 )
            var_4 = 1;

        if ( var_0 - var_4 <= var_1 )
            return var_1;
        else
            return var_0 - var_4;
    }
    else if ( var_0 < var_1 )
    {
        var_4 = ( var_1 - var_0 ) * var_3;

        if ( var_4 > var_2 )
            var_4 = var_2;
        else if ( var_4 < 1 )
            var_4 = 1;

        if ( var_0 + var_4 >= var_1 )
            return var_1;
        else
            return var_0 + var_4;
    }

    return var_0;
}

_id_2C40()
{
    var_0 = level._id_2C3D["ads"]["goal"]["weight"];

    if ( var_0 < 1.0 )
    {
        if ( self _meth_833B() && self _meth_833D() > 0.0 )
            var_0 = _func_0BF( 1, var_0 + 0.7 );
        else
            var_0 = 0;

        level._id_2C3D["ads"]["current"]["nearStart"] = level._id_2C3D["ads"]["goal"]["nearStart"];
        level._id_2C3D["ads"]["current"]["nearEnd"] = level._id_2C3D["ads"]["goal"]["nearEnd"];
        level._id_2C3D["ads"]["current"]["nearBlur"] = level._id_2C3D["ads"]["goal"]["nearBlur"];
        level._id_2C3D["ads"]["current"]["farStart"] = level._id_2C3D["ads"]["goal"]["farStart"];
        level._id_2C3D["ads"]["current"]["farEnd"] = level._id_2C3D["ads"]["goal"]["farEnd"];
        level._id_2C3D["ads"]["current"]["farBlur"] = level._id_2C3D["ads"]["goal"]["farBlur"];
        level._id_2C3D["ads"]["current"]["weight"] = var_0;
        level._id_2C3D["ads"]["current"]["bias"] = level._id_2C3D["ads"]["goal"]["bias"];
        return;
    }

    if ( isdefined( level._id_2C42 ) )
        var_1 = level._id_2C42;
    else
        var_1 = 0.1;

    var_2 = 10;
    var_3 = _func_0E1( var_2, _func_0BE( level._id_2C3D["ads"]["current"]["nearStart"] - level._id_2C3D["ads"]["goal"]["nearStart"] ) * var_1 );
    var_4 = _func_0E1( var_2, _func_0BE( level._id_2C3D["ads"]["current"]["nearEnd"] - level._id_2C3D["ads"]["goal"]["nearEnd"] ) * var_1 );
    var_5 = _func_0E1( var_2, _func_0BE( level._id_2C3D["ads"]["current"]["farStart"] - level._id_2C3D["ads"]["goal"]["farStart"] ) * var_1 );
    var_6 = _func_0E1( var_2, _func_0BE( level._id_2C3D["ads"]["current"]["farEnd"] - level._id_2C3D["ads"]["goal"]["farEnd"] ) * var_1 );
    var_7 = 0.1;
    var_8 = 0.1;
    level._id_2C3D["ads"]["current"]["nearStart"] = _id_2C41( level._id_2C3D["ads"]["current"]["nearStart"], level._id_2C3D["ads"]["goal"]["nearStart"], var_3, 0.33 );
    level._id_2C3D["ads"]["current"]["nearEnd"] = _id_2C41( level._id_2C3D["ads"]["current"]["nearEnd"], level._id_2C3D["ads"]["goal"]["nearEnd"], var_4, 0.33 );
    level._id_2C3D["ads"]["current"]["nearBlur"] = _id_2C41( level._id_2C3D["ads"]["current"]["nearBlur"], level._id_2C3D["ads"]["goal"]["nearBlur"], var_7, 0.33 );
    level._id_2C3D["ads"]["current"]["farStart"] = _id_2C41( level._id_2C3D["ads"]["current"]["farStart"], level._id_2C3D["ads"]["goal"]["farStart"], var_5, 0.33 );
    level._id_2C3D["ads"]["current"]["farEnd"] = _id_2C41( level._id_2C3D["ads"]["current"]["farEnd"], level._id_2C3D["ads"]["goal"]["farEnd"], var_6, 0.33 );
    level._id_2C3D["ads"]["current"]["farBlur"] = _id_2C41( level._id_2C3D["ads"]["current"]["farBlur"], level._id_2C3D["ads"]["goal"]["farBlur"], var_7, 0.33 );
    level._id_2C3D["ads"]["current"]["weight"] = 1.0;
    level._id_2C3D["ads"]["current"]["bias"] = _id_2C41( level._id_2C3D["ads"]["current"]["bias"], level._id_2C3D["ads"]["goal"]["bias"], var_8, 0.33 );
}

_id_2C46()
{
    level._id_2C3D["ads"]["goal"]["weight"] = 0.0;
    level._id_2C3D["ads"]["current"]["weight"] = 0.0;
}

_id_2C3E( var_0 )
{
    var_1 = level._id_2C3D[var_0]["current"]["weight"];
    var_2 = 1.0 - var_1;
    level._id_2C3D["results"]["current"]["nearStart"] = level._id_2C3D["results"]["current"]["nearStart"] * var_2 + level._id_2C3D[var_0]["current"]["nearStart"] * var_1;
    level._id_2C3D["results"]["current"]["nearEnd"] = level._id_2C3D["results"]["current"]["nearEnd"] * var_2 + level._id_2C3D[var_0]["current"]["nearEnd"] * var_1;
    level._id_2C3D["results"]["current"]["nearBlur"] = level._id_2C3D["results"]["current"]["nearBlur"] * var_2 + level._id_2C3D[var_0]["current"]["nearBlur"] * var_1;
    level._id_2C3D["results"]["current"]["farStart"] = level._id_2C3D["results"]["current"]["farStart"] * var_2 + level._id_2C3D[var_0]["current"]["farStart"] * var_1;
    level._id_2C3D["results"]["current"]["farEnd"] = level._id_2C3D["results"]["current"]["farEnd"] * var_2 + level._id_2C3D[var_0]["current"]["farEnd"] * var_1;
    level._id_2C3D["results"]["current"]["farBlur"] = level._id_2C3D["results"]["current"]["farBlur"] * var_2 + level._id_2C3D[var_0]["current"]["farBlur"] * var_1;
    level._id_2C3D["results"]["current"]["bias"] = level._id_2C3D["results"]["current"]["bias"] * var_2 + level._id_2C3D[var_0]["current"]["bias"] * var_1;
}

_id_2C44()
{
    _id_2C43( "base" );
    _id_2C43( "script" );
    _id_2C40();
    _id_2C3E( "base" );
    _id_2C3E( "script" );
    _id_2C3E( "ads" );
    var_0 = level._id_2C3D["results"]["current"]["nearStart"];
    var_1 = level._id_2C3D["results"]["current"]["nearEnd"];
    var_2 = level._id_2C3D["results"]["current"]["nearBlur"];
    var_3 = level._id_2C3D["results"]["current"]["farStart"];
    var_4 = level._id_2C3D["results"]["current"]["farEnd"];
    var_5 = level._id_2C3D["results"]["current"]["farBlur"];
    var_6 = level._id_2C3D["results"]["current"]["bias"];
    var_0 = _func_0E1( 0, var_0 );
    var_1 = _func_0E1( 0, var_1 );
    var_3 = _func_0E1( 0, var_3 );
    var_4 = _func_0E1( 0, var_4 );
    var_2 = _func_0E1( 4, var_2 );
    var_2 = _func_0BF( 10, var_2 );
    var_5 = _func_0E1( 0, var_5 );
    var_5 = _func_0BF( var_2, var_5 );

    if ( var_5 > 0.0 )
        var_3 = _func_0E1( var_1, var_3 );

    var_6 = _func_0E1( 0, var_6 );
    level._id_2C3D["results"]["current"]["nearStart"] = var_0;
    level._id_2C3D["results"]["current"]["nearEnd"] = var_1;
    level._id_2C3D["results"]["current"]["nearBlur"] = var_2;
    level._id_2C3D["results"]["current"]["farStart"] = var_3;
    level._id_2C3D["results"]["current"]["farEnd"] = var_4;
    level._id_2C3D["results"]["current"]["farBlur"] = var_5;
    level._id_2C3D["results"]["current"]["bias"] = var_6;
}

_id_2C67()
{
    var_0 = self _meth_833D();

    if ( var_0 <= 0.0 )
    {
        _id_2C46();
        return;
    }

    if ( isdefined( level._id_2540 ) )
    {
        [[ level._id_2540 ]]();
        return;
    }

    var_1 = getdvarfloat( "ads_dof_tracedist", 4096 );
    var_2 = getdvarfloat( "ads_dof_maxEnemyDist", 0 );
    var_3 = getdvarint( "ads_dof_playerForgetEnemyTime", 5000 );
    var_4 = getdvarfloat( "ads_dof_nearStartScale", 0.25 );
    var_5 = getdvarfloat( "ads_dof_nearEndScale", 0.85 );
    var_6 = getdvarfloat( "ads_dof_farStartScale", 1.15 );
    var_7 = getdvarfloat( "ads_dof_farEndScale", 3 );
    var_8 = getdvarfloat( "ads_dof_nearBlur", 4 );
    var_9 = getdvarfloat( "ads_dof_farBlur", 2.5 );
    var_10 = self _meth_80AA();
    var_11 = self _meth_8338();

    if ( isdefined( self._id_2C69 ) )
        var_12 = _func_11C( self._id_2C69.angles, var_11 );
    else
        var_12 = var_11;

    var_13 = _func_114( anglestoforward( var_12 ) );
    var_14 = _func_06B( var_10, var_10 + var_13 * var_1, 1, self, 0, 0, 0, 0, 0 );
    var_15 = _func_0D9( "axis" );
    var_16 = self _meth_830E();

    if ( isdefined( level._id_8A24[var_16] ) )
    {
        [[ level._id_8A24[var_16] ]]( var_14, var_15, var_10, var_13, var_0 );
        return;
    }

    if ( var_14["fraction"] == 1 )
    {
        var_1 = 2048;
        var_17 = 256;
        var_18 = var_1 * var_6 * 2;
    }
    else
    {
        var_1 = _func_0EE( var_10, var_14["position"] );
        var_17 = var_1 * var_4;
        var_18 = var_1 * var_6;
    }

    foreach ( var_20 in var_15 )
    {
        var_21 = var_20 _meth_840B();
        var_22 = var_20 _meth_840C( var_3 );

        if ( !var_21 && !var_22 )
            continue;

        var_23 = _func_114( var_20._id_02E2 - var_10 );
        var_24 = _func_0F6( var_13, var_23 );

        if ( var_24 < 0.923 )
            continue;

        var_25 = _func_0EE( var_10, var_20._id_02E2 );

        if ( var_25 - 30 < var_17 )
            var_17 = var_25 - 30;

        var_26 = _func_0BF( var_25, var_2 );

        if ( var_26 + 30 > var_18 )
            var_18 = var_26 + 30;
    }

    if ( var_17 > var_18 )
        var_17 = var_18 - 256;

    if ( var_17 > var_1 )
        var_17 = var_1 - 30;

    if ( var_17 < 1 )
        var_17 = 1;

    if ( var_18 < var_1 )
        var_18 = var_1;

    var_28 = var_17 * var_4;
    var_29 = var_18 * var_7;
    _id_2C48( var_28, var_17, var_8, var_18, var_29, var_9, var_0 );
}

_id_2C68( var_0 )
{
    if ( isdefined( level._id_2540 ) )
        return [[ level._id_2540 ]]();

    var_1 = getdvarfloat( "ads_dof_tracedist", 4096 );
    var_2 = getdvarfloat( "ads_dof_maxEnemyDist", 0 );
    var_3 = getdvarint( "ads_dof_playerForgetEnemyTime", 5000 );
    var_4 = self _meth_80AA();
    var_5 = self _meth_8338();

    if ( isdefined( self._id_2C69 ) )
        var_6 = _func_11C( self._id_2C69.angles, var_5 );
    else
        var_6 = var_5;

    var_7 = _func_114( anglestoforward( var_6 ) );
    var_8 = _func_06B( var_4, var_4 + var_7 * var_1, 1, self, 0, 1, 0, 0, 0 );
    var_9 = _func_0D9( "axis" );
    var_10 = self _meth_830E();

    if ( isdefined( level._id_8A24[var_10] ) )
        return [[ level._id_8A24[var_10] ]]( var_8, var_9, var_4, var_7, var_0 );

    var_11["start"] = _func_0EE( var_4, var_8["position"] );
    var_11["end"] = var_11["start"];

    foreach ( var_13 in var_9 )
    {
        var_14 = var_13 _meth_840B();
        var_15 = var_13 _meth_840C( var_3 );

        if ( !var_14 && !var_15 )
            continue;

        var_16 = _func_114( var_13._id_02E2 - var_4 );
        var_17 = _func_0F6( var_7, var_16 );

        if ( var_17 < 0.923 )
            continue;

        var_18 = _func_0EE( var_4, var_13._id_02E2 );

        if ( var_18 < var_11["start"] )
            var_11["start"] = var_18;

        var_19 = _func_0BF( var_18, var_2 );

        if ( var_19 > var_11["end"] )
            var_11["end"] = var_19;
    }

    return var_11;
}

dof_monitor_prone()
{
    if ( !isdefined( level.dof_while_prone_enabled ) || !level.dof_while_prone_enabled )
        return;

    for (;;)
    {
        dof_set_standing();

        while ( self _meth_8180() != "prone" )
            wait 0.05;

        dof_set_prone();

        while ( self _meth_8180() == "prone" )
            wait 0.05;
    }
}

dof_set_standing()
{
    level._id_0318 _meth_84A6();
}

dof_set_prone()
{
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 3.0, 800.0, 20, 20 );
    level._id_0318 _meth_84B8( 12.0, 900.0 );
}

_id_5226( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_4 < 0.88 )
    {
        _id_2C46();
        return;
    }

    var_5 = 10000;
    var_6 = -1;
    var_5 = 2400;
    var_7 = 2400;

    for ( var_8 = 0; var_8 < var_1.size; var_8++ )
    {
        var_9 = _func_114( var_1[var_8]._id_02E2 - var_2 );
        var_10 = _func_0F6( var_3, var_9 );

        if ( var_10 < 0.923 )
            continue;

        var_11 = _func_0EE( var_2, var_1[var_8]._id_02E2 );

        if ( var_11 < 2500 )
            var_11 = 2500;

        if ( var_11 - 30 < var_5 )
            var_5 = var_11 - 30;

        if ( var_11 + 30 > var_6 )
            var_6 = var_11 + 30;
    }

    if ( var_5 > var_6 )
    {
        var_5 = 2400;
        var_6 = 3000;
    }
    else
    {
        if ( var_5 < 50 )
            var_5 = 50;

        if ( var_6 > 2500 )
            var_6 = 2500;
        else if ( var_6 < 1000 )
            var_6 = 1000;
    }

    var_12 = _func_0EE( var_2, var_0["position"] );

    if ( var_12 < 2500 )
        var_12 = 2500;

    if ( var_5 > var_12 )
        var_5 = var_12 - 30;

    if ( var_5 < 1 )
        var_5 = 1;

    if ( var_6 < var_12 )
        var_6 = var_12;

    if ( var_7 >= var_5 )
        var_7 = var_5 - 1;

    var_13 = var_6 * 4;
    var_14 = 4;
    var_15 = 1.8;
    _id_2C48( var_7, var_5, var_14, var_6, var_13, var_15, var_4 );
}

_id_2C77()
{
    for (;;)
    {
        waittillframeend;

        if ( level._id_56D2 )
            continue;

        if ( !getdvarint( "scr_dof_enable" ) )
            continue;

        if ( getdvarint( "r_dof_physical_enable" ) )
        {
            var_0 = self _meth_833D();

            if ( var_0 > 0.0 )
            {
                var_1 = _id_2C68( var_0 );
                self _meth_84A8( var_1["start"], var_1["end"] );
            }

            continue;
        }

        _id_2C67();
        _id_2C44();
        var_2 = level._id_2C3D["results"]["current"]["nearStart"];
        var_3 = level._id_2C3D["results"]["current"]["nearEnd"];
        var_4 = level._id_2C3D["results"]["current"]["farStart"];
        var_5 = level._id_2C3D["results"]["current"]["farEnd"];
        var_6 = level._id_2C3D["results"]["current"]["nearBlur"];
        var_7 = level._id_2C3D["results"]["current"]["farBlur"];
        self _meth_818A( var_2, var_3, var_4, var_5, var_6, var_7 );
    }
}

_id_929B()
{
    var_0 = getdvar( "r_tessellation" );

    if ( var_0 == "" )
        return;

    level._id_929A = spawnstruct();
    level._id_929A._id_256B = getdvarfloat( "r_tessellationCutoffDistance", 960.0 );
    level._id_929A._id_256C = level._id_929A._id_256B;
    level._id_929A._id_256D = getdvarfloat( "r_tessellationCutoffFalloff", 320.0 );
    level._id_929A._id_256E = level._id_929A._id_256D;
    level._id_929A._id_9357 = 0.0;

    foreach ( var_2 in level._id_0323 )
        var_2 thread _id_929D();
}

_id_929C( var_0, var_1, var_2 )
{
    level._id_929A._id_256C = var_0;
    level._id_929A._id_256E = var_1;
    level._id_929A._id_9357 = var_2;
}

_id_929D()
{
    for (;;)
    {
        var_0 = level._id_929A._id_256B;
        var_1 = level._id_929A._id_256D;
        waittillframeend;

        if ( level._id_929A._id_9357 > 0.0 )
        {
            var_2 = level._id_929A._id_9357 * 20;
            var_3 = ( level._id_929A._id_256C - level._id_929A._id_256B ) / var_2;
            var_4 = ( level._id_929A._id_256E - level._id_929A._id_256D ) / var_2;
            level._id_929A._id_256B += var_3;
            level._id_929A._id_256D += var_4;
            level._id_929A._id_9357 -= 0.05;
        }
        else
        {
            level._id_929A._id_256B = level._id_929A._id_256C;
            level._id_929A._id_256D = level._id_929A._id_256E;
        }

        if ( var_0 != level._id_929A._id_256B )
            _func_0D6( "r_tessellationCutoffDistance", level._id_929A._id_256B );

        if ( var_1 != level._id_929A._id_256D )
            _func_0D6( "r_tessellationCutoffFalloff", level._id_929A._id_256D );
    }
}

_id_8FCD( var_0, var_1 )
{
    if ( !isdefined( level._id_8FCE[var_0] ) )
        return;

    self notify( "sunflare_start_adjust" );
    self endon( "sunflare_start_adjust" );
    var_2 = gettime();
    var_3 = var_1 * 1000;
    var_4 = getdvarvector( "r_sunflare_position", ( 0, 0, 0 ) );
    var_5 = gettime() - var_2;
    var_6 = level._id_8FCE[var_0]._id_0329;

    for ( level._id_24FC = var_0; var_5 < var_3; var_5 = gettime() - var_2 )
    {
        var_6 = level._id_8FCE[var_0]._id_0329;
        var_7 = _func_0BF( _func_0BD( var_5 / var_3 ), 1 );
        var_8 = var_4 + ( var_6 - var_4 ) * var_7;
        setdvar( "r_sunflare_position", var_8 );
        _func_106( var_8 );
        wait 0.05;
    }

    setdvar( "r_sunflare_position", level._id_8FCE[var_0]._id_0329 );
    _func_106( var_6 );
}

_id_4CF3()
{
    if ( !isdefined( level._id_3961 ) )
    {
        level._id_3961 = spawnstruct();
        level._id_3961._id_3964 = "";
        level._id_3961._id_04B7 = 0;
    }
}

_id_7E35( var_0 )
{
    if ( isdefined( self._id_8BD0 ) )
    {
        set_fog_progress_preh1( var_0 );
        return;
    }

    var_1 = 1 - var_0;
    var_2 = self._id_8C15 * var_1 + self._id_313B * var_0;
    var_3 = self._id_8BA2 * var_1 + self._id_3130 * var_0;
    var_4 = self._id_8B66 * var_1 + self._id_3124 * var_0;
    _func_182( var_2, var_3, var_4[0], var_4[1], var_4[2], 1, 0.4 );
}

set_fog_progress_preh1( var_0 )
{
    var_1 = 1 - var_0;
    var_2 = self._id_8C15 * var_1 + self._id_313B * var_0;
    var_3 = self._id_8BA2 * var_1 + self._id_3130 * var_0;
    var_4 = self._id_8B66 * var_1 + self._id_3124 * var_0;
    var_5 = self._id_8BD0 * var_1 + self._id_3135 * var_0;
    var_6 = self._id_8C1F;
    var_7 = self._id_313C;
    var_8 = self._id_8C94;
    var_9 = self._id_8C96;
    var_10 = self._id_8C95;
    var_8 = self._id_8C94 * var_1 + self._id_3144 * var_0;
    var_9 = self._id_8C96 * var_1 + self._id_3146 * var_0;
    var_10 = self._id_8C95 * var_1 + self._id_3145 * var_0;

    if ( !isdefined( var_6 ) )
        var_6 = 1;

    if ( !isdefined( var_7 ) )
        var_7 = 1;

    var_11 = var_6 * var_1 + var_7 * var_0;

    if ( self._id_8FD0 )
    {
        var_12 = self._id_8CB2 * var_1 + self._id_314C * var_0;
        var_13 = self._id_8BD1 * var_1 + self._id_3136 * var_0;
        var_14 = self._id_8CB3 * var_1 + self._id_314D * var_0;
        var_15 = self._id_8CB1 * var_1 + self._id_314B * var_0;
        var_16 = self._id_8CB4 * var_1 + self._id_314E * var_0;
        var_17 = self._id_8CB5 * var_1 + self._id_314F * var_0;
        _func_182( var_2, var_3, var_4[0], var_4[1], var_4[2], var_5, var_11, 0.4, var_12[0], var_12[1], var_12[2], var_13, var_14, var_15, var_16, var_17, var_8, var_9, var_10 );
    }
    else
        _func_182( var_2, var_3, var_4[0], var_4[1], var_4[2], var_5, var_11, 0.4, var_8, var_9, var_10 );
}

_id_8ADF( var_0, var_1 )
{
    level notify( "ssao_set_target_over_time_internal" );
    level endon( "ssao_set_target_over_time_internal" );
    _id_A5A4::_id_7DF3();

    if ( !_id_A5A4::_id_502F() )
        return;

    var_2 = getdvarfloat( "r_ssaoScriptScale", 1.0 );

    for ( var_3 = var_1; var_3 > 0.0; var_3 -= 0.05 )
    {
        var_4 = _func_0BF( 1.0, 0.05 / var_3 );
        var_5 = var_2;
        var_2 += var_4 * ( var_0 - var_2 );

        if ( var_5 != var_2 )
            _func_0D6( "r_ssaoScriptScale", var_2 );

        waittillframeend;
    }

    _func_0D6( "r_ssaoScriptScale", var_0 );
}

_id_2AD3( var_0 )
{
    level thread _id_8ADF( 0.0, var_0 );
}

_id_30F2( var_0 )
{
    level thread _id_8ADF( 1.0, var_0 );
}

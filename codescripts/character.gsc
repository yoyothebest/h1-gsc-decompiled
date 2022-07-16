// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7FB0( var_0 )
{
    self _meth_80B3( var_0[_func_0B2( var_0.size )] );
}

_id_6EE1( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        precachemodel( var_0[var_1] );
}

_id_0DFD( var_0, var_1 )
{
    if ( !isdefined( level._id_1C8A ) )
        level._id_1C8A = [];

    if ( !isdefined( level._id_1C8A[var_0] ) )
        level._id_1C8A[var_0] = _func_0B2( var_1.size );

    var_2 = ( level._id_1C8A[var_0] + 1 ) % var_1.size;

    if ( isdefined( self._id_7970 ) )
        var_2 = self._id_7970 % var_1.size;

    level._id_1C8A[var_0] = var_2;
    _id_7F88( var_1[var_2] );
}

_id_7F88( var_0 )
{
    if ( isdefined( self._id_477D ) )
        self _meth_802A( self._id_477D );

    self _meth_801D( var_0, "", 1 );
    self._id_477D = var_0;
}

_id_0DFC( var_0, var_1 )
{
    if ( !isdefined( level._id_1C89 ) )
        level._id_1C89 = [];

    if ( !isdefined( level._id_1C89[var_0] ) )
        level._id_1C89[var_0] = _func_0B2( var_1.size );

    var_2 = ( level._id_1C89[var_0] + 1 ) % var_1.size;
    level._id_1C89[var_0] = var_2;
    self _meth_801D( var_1[var_2] );
    self._id_475D = var_1[var_2];
}

_id_6099()
{
    self _meth_802B();
    var_0 = self._id_0BD4;

    if ( !isdefined( var_0 ) )
        return;

    self._id_0BD4 = "none";
    self [[ anim._id_7067 ]]( var_0 );
}

_id_7802()
{
    var_0["gunHand"] = self._id_0BD4;
    var_0["gunInHand"] = self._id_0BD5;
    var_0["model"] = self._id_029C;
    var_0["hatModel"] = self._id_475D;

    if ( isdefined( self._id_02A7 ) )
        var_0["name"] = self._id_02A7;
    else
    {

    }

    var_1 = self _meth_802C();

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_0["attach"][var_2]["model"] = self _meth_802D( var_2 );
        var_0["attach"][var_2]["tag"] = self _meth_802E( var_2 );
    }

    return var_0;
}

_id_57BD( var_0 )
{
    self _meth_802B();
    self._id_0BD4 = var_0["gunHand"];
    self._id_0BD5 = var_0["gunInHand"];
    self _meth_80B3( var_0["model"] );
    self._id_475D = var_0["hatModel"];

    if ( isdefined( var_0["name"] ) )
        self._id_02A7 = var_0["name"];
    else
    {

    }

    var_1 = var_0["attach"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
        self _meth_801D( var_1[var_3]["model"], var_1[var_3]["tag"] );
}

_id_032C( var_0 )
{
    if ( isdefined( var_0["name"] ) )
    {

    }
    else
    {

    }

    precachemodel( var_0["model"] );
    var_1 = var_0["attach"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
        precachemodel( var_1[var_3]["model"] );
}

_id_3E43( var_0 )
{
    if ( isdefined( self.classname ) )
        var_1 = _func_124( self.classname, "_" );
    else
        var_1 = [];

    if ( !common_scripts\utility::_id_51AE() )
    {
        if ( isdefined( self._id_0308["modelIndex"] ) && self._id_0308["modelIndex"] < var_0 )
            return self._id_0308["modelIndex"];

        var_2 = _func_0B2( var_0 );
        self._id_0308["modelIndex"] = var_2;
        return var_2;
    }
    else if ( var_1.size <= 2 )
        return _func_0B2( var_0 );

    var_3 = "auto";
    var_2 = undefined;
    var_4 = var_1[2];

    if ( isdefined( self._id_7970 ) )
        var_2 = self._id_7970;

    if ( isdefined( self._id_796F ) )
    {
        var_5 = "grouped";
        var_3 = "group_" + self._id_796F;
    }

    if ( !isdefined( level._id_1C8B ) )
        level._id_1C8B = [];

    if ( !isdefined( level._id_1C8B[var_4] ) )
        level._id_1C8B[var_4] = [];

    if ( !isdefined( level._id_1C8B[var_4][var_3] ) )
        _id_4DD8( var_4, var_3, var_0 );

    if ( !isdefined( var_2 ) )
    {
        var_2 = _id_3DB6( var_4, var_3 );

        if ( !isdefined( var_2 ) )
            var_2 = _func_0B2( 5000 );
    }

    while ( var_2 >= var_0 )
        var_2 -= var_0;

    level._id_1C8B[var_4][var_3][var_2]++;
    return var_2;
}

_id_3DB6( var_0, var_1 )
{
    var_2 = [];
    var_3 = level._id_1C8B[var_0][var_1][0];
    var_2[0] = 0;

    for ( var_4 = 1; var_4 < level._id_1C8B[var_0][var_1].size; var_4++ )
    {
        if ( level._id_1C8B[var_0][var_1][var_4] > var_3 )
            continue;

        if ( level._id_1C8B[var_0][var_1][var_4] < var_3 )
        {
            var_2 = [];
            var_3 = level._id_1C8B[var_0][var_1][var_4];
        }

        var_2[var_2.size] = var_4;
    }

    return _id_710E( var_2 );
}

_id_4DD8( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < var_2; var_3++ )
        level._id_1C8B[var_0][var_1][var_3] = 0;
}

_id_3E4B( var_0 )
{
    return _func_0B2( var_0 );
}

_id_710E( var_0 )
{
    return var_0[_func_0B2( var_0.size )];
}

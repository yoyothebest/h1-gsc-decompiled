// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2E58()
{
    _id_0D63();
    self _meth_805D();

    if ( isdefined( self._id_7A41 ) )
        self._id_5F65 = self._id_7A41;
    else
        self._id_5F65 = 1;

    if ( self._id_04A7 == "allies" )
    {
        _id_A55D::_id_3DE2();

        if ( isdefined( self._id_02A7 ) )
            self _meth_8041( self._id_02A7, &"" );
    }

    if ( isdefined( level._id_2EFA ) )
        self thread [[ level._id_2EFA ]]();

    if ( !isdefined( self._id_79ED ) )
        level thread _id_A536::_id_3A59( self );

    if ( !isdefined( level._id_08DD ) )
        _id_9302();
}

_id_9302()
{
    if ( !isdefined( level._id_2F2F ) )
        level._id_2F2F = "all";

    var_0 = 0;

    switch ( level._id_2F2F )
    {
        case "all":
            var_0 = 1;
            break;
        case "axis":
            var_0 = self._id_04A7 == "axis";
            break;
        default:
            break;
    }

    if ( var_0 )
        self _meth_8029();
}

_id_2E62()
{
    if ( !isdefined( self._id_04A4 ) )
        return;

    if ( isdefined( level._id_2E9E[self._id_04A4] ) )
        return;

    level._id_2E9E[self._id_04A4] = 1;
    var_0 = self._id_04A4;
    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = [];
    var_3 = [];
    var_4 = var_1;

    for (;;)
    {
        var_1 = var_4;
        var_5 = 0;

        for (;;)
        {
            if ( !isdefined( var_1._id_04A4 ) )
                break;

            var_6 = common_scripts\utility::_id_40FD( var_1._id_04A4, "targetname" );

            if ( var_6.size )
                break;

            var_7 = undefined;

            foreach ( var_9 in var_6 )
            {
                if ( isdefined( var_3[var_9._id_02E2 + ""] ) )
                    continue;

                var_7 = var_9;
                break;
            }

            if ( !isdefined( var_7 ) )
                break;

            var_3[var_7._id_02E2 + ""] = 1;
            var_2[var_1._id_04A6] = var_7._id_02E2 - var_1._id_02E2;
            var_1.angles = _func_115( var_2[var_1._id_04A6] );
            var_1 = var_7;
            var_5 = 1;
        }

        if ( !var_5 )
            break;
    }

    var_0 = self._id_04A4;
    var_1 = common_scripts\utility::_id_40FB( var_0, "targetname" );
    var_11 = var_1;
    var_3 = [];

    for (;;)
    {
        var_1 = var_4;
        var_5 = 0;

        for (;;)
        {
            if ( !isdefined( var_1._id_04A4 ) )
                return;

            if ( !isdefined( var_2[var_1._id_04A6] ) )
                return;

            var_6 = common_scripts\utility::_id_40FD( var_1._id_04A4, "targetname" );

            if ( var_6.size )
                break;

            var_7 = undefined;

            foreach ( var_9 in var_6 )
            {
                if ( isdefined( var_3[var_9._id_02E2 + ""] ) )
                    continue;

                var_7 = var_9;
                break;
            }

            if ( !isdefined( var_7 ) )
                break;

            if ( isdefined( var_1._id_0351 ) )
            {
                var_14 = var_2[var_11._id_04A6];
                var_15 = var_2[var_1._id_04A6];
                var_16 = ( var_14 + var_15 ) * 0.5;
                var_1.angles = _func_115( var_16 );
            }

            var_5 = 1;
            var_11 = var_1;
            var_1 = var_7;
        }

        if ( !var_5 )
            break;
    }
}

_id_0D63()
{
    if ( isdefined( self._id_04D9 ) )
    {
        if ( self._id_04D9 == "dog" )
            _id_0D60();
        else
            _id_0D65();
    }
}
#using_animtree("generic_human");

_id_0D65()
{
    self _meth_8117( #animtree );
}
#using_animtree("animals");

_id_0D60()
{
    self _meth_8117( #animtree );
}

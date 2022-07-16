// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3F8E( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
        return level._id_241A[var_0];

    var_1 = [];

    foreach ( var_3 in level._id_2417 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3._id_9C42["type"] != "exploder" )
            continue;

        if ( !isdefined( var_3._id_9C42["exploder"] ) )
            continue;

        if ( var_3._id_9C42["exploder"] == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_814F( var_0 )
{
    var_1 = var_0._id_79BF;

    if ( !isdefined( level._id_353C[var_1] ) )
        level._id_353C[var_1] = [];

    var_2 = var_0._id_04A6;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    level._id_353C[var_1][level._id_353C[var_1].size] = var_0;

    if ( _id_3532( var_0 ) )
    {
        var_0 _meth_8056();
        return;
    }

    if ( _id_3531( var_0 ) )
    {
        var_0 _meth_8056();
        var_0 _meth_82BB();

        if ( isdefined( var_0._id_03DA ) && var_0._id_03DA & 1 )
        {
            if ( isdefined( var_0._id_79A0 ) )
                var_0 _meth_805A();
        }

        return;
    }

    if ( _id_3530( var_0 ) )
    {
        var_0 _meth_8056();
        var_0 _meth_82BB();

        if ( isdefined( var_0._id_03DA ) && var_0._id_03DA & 1 )
            var_0 _meth_805A();

        return;
    }

    if ( exploder_model_is_anim_model( var_0 ) && _func_120( var_0._id_04A6, "exploderanimhide" ) )
    {
        var_0 _meth_8056();
        var_0 _meth_82BB();

        if ( isdefined( var_0._id_03DA ) && var_0._id_03DA & 1 )
            var_0 _meth_805A();

        return;
    }
}

_id_8313()
{
    level._id_353C = [];
    var_0 = getentarray( "script_brushmodel", "classname" );
    var_1 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4._id_7AA6 ) )
            var_4._id_79BF = var_4._id_7AA6;

        if ( isdefined( var_4._id_59D6 ) )
            continue;

        if ( isdefined( var_4._id_79BF ) )
            _id_814F( var_4 );
    }

    var_6 = [];
    var_7 = getentarray( "script_brushmodel", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "script_origin", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "item_health", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = level._id_8F60;

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( !isdefined( var_7[var_2] ) )
            continue;

        if ( isdefined( var_7[var_2]._id_7AA6 ) )
            var_7[var_2]._id_79BF = var_7[var_2]._id_7AA6;

        if ( isdefined( var_7[var_2]._id_79BF ) )
        {
            if ( !isdefined( var_7[var_2].angles ) )
                var_7[var_2].angles = ( 0, 0, 0 );

            var_6[var_6.size] = var_7[var_2];
        }
    }

    if ( !isdefined( level._id_2417 ) )
        level._id_2417 = [];

    var_8 = [];
    var_8["exploderchunk visible"] = 1;
    var_8["exploderchunk"] = 1;
    var_8["exploder"] = 1;
    thread _id_8103();

    for ( var_2 = 0; var_2 < var_6.size; var_2++ )
    {
        var_9 = var_6[var_2];
        var_4 = common_scripts\utility::_id_23FE( var_9._id_79F1 );
        var_4._id_9C42 = [];
        var_4._id_9C42["origin"] = var_9._id_02E2;
        var_4._id_9C42["angles"] = var_9.angles;
        var_4._id_9C42["delay"] = var_9._id_0392;
        var_4._id_9C42["delay_post"] = var_9._id_798F;
        var_4._id_9C42["firefx"] = var_9._id_79CB;
        var_4._id_9C42["firefxdelay"] = var_9._id_79CC;
        var_4._id_9C42["firefxsound"] = var_9._id_79CD;
        var_4._id_9C42["firefxtimeout"] = var_9._id_79CE;
        var_4._id_9C42["earthquake"] = var_9._id_79B5;
        var_4._id_9C42["rumble"] = var_9._id_7ABB;
        var_4._id_9C42["damage"] = var_9._id_7981;
        var_4._id_9C42["damage_radius"] = var_9._id_7AB2;
        var_4._id_9C42["soundalias"] = var_9._id_7ACB;
        var_4._id_9C42["repeat"] = var_9._id_7AB6;
        var_4._id_9C42["delay_min"] = var_9._id_798E;
        var_4._id_9C42["delay_max"] = var_9._id_798D;
        var_4._id_9C42["target"] = var_9._id_04A4;
        var_4._id_9C42["ender"] = var_9._id_79B8;
        var_4._id_9C42["physics"] = var_9._id_7AA0;
        var_4._id_9C42["type"] = "exploder";

        if ( !isdefined( var_9._id_79F1 ) )
            var_4._id_9C42["fxid"] = "No FX";
        else
            var_4._id_9C42["fxid"] = var_9._id_79F1;

        var_4._id_9C42["exploder"] = var_9._id_79BF;

        if ( isdefined( level._id_241A ) )
        {
            var_10 = level._id_241A[var_4._id_9C42["exploder"]];

            if ( !isdefined( var_10 ) )
                var_10 = [];

            var_10[var_10.size] = var_4;
            level._id_241A[var_4._id_9C42["exploder"]] = var_10;
        }

        if ( !isdefined( var_4._id_9C42["delay"] ) )
            var_4._id_9C42["delay"] = 0;

        if ( isdefined( var_9._id_04A4 ) )
        {
            var_11 = getentarray( var_4._id_9C42["target"], "targetname" )[0];

            if ( isdefined( var_11 ) )
            {
                var_12 = var_11._id_02E2;
                var_4._id_9C42["angles"] = _func_115( var_12 - var_4._id_9C42["origin"] );
            }
            else
            {
                var_11 = common_scripts\utility::_id_3E89( var_4._id_9C42["target"] );

                if ( isdefined( var_11 ) )
                {
                    var_12 = var_11._id_02E2;
                    var_4._id_9C42["angles"] = _func_115( var_12 - var_4._id_9C42["origin"] );
                }
            }
        }

        if ( !isdefined( var_9.code_classname ) )
        {
            var_4._id_029C = var_9;

            if ( isdefined( var_4._id_029C._id_7A3C ) )
                precachemodel( var_4._id_029C._id_7A3C );
        }
        else if ( var_9.code_classname == "script_brushmodel" || isdefined( var_9._id_029C ) )
        {
            var_4._id_029C = var_9;
            var_4._id_029C._id_2B34 = var_9._id_79A0;
        }

        if ( isdefined( var_9._id_04A6 ) && isdefined( var_8[var_9._id_04A6] ) )
            var_4._id_9C42["exploder_type"] = var_9._id_04A6;
        else if ( isdefined( var_9._id_04A6 ) && _func_120( var_9._id_04A6, "exploderanim" ) )
            var_4._id_9C42["exploder_type"] = "exploderanim";
        else
            var_4._id_9C42["exploder_type"] = "normal";

        if ( isdefined( var_9._id_59D6 ) )
        {
            var_4._id_9C42["masked_exploder"] = var_9._id_029C;
            var_4._id_9C42["masked_exploder_spawnflags"] = var_9._id_03DA;
            var_4._id_9C42["masked_exploder_script_disconnectpaths"] = var_9._id_79A0;
            var_9 delete();
        }

        var_4 common_scripts\_createfx::_id_6E6D();
    }

    if ( level._id_2409 && getdvar( "createfx_exploder_waittime" ) == "" )
        setdvar( "createfx_exploder_waittime", 3 );
}

_id_8103()
{
    waitframe;
    waitframe;
    waitframe;
    var_0 = [];

    foreach ( var_2 in level._id_2417 )
    {
        if ( var_2._id_9C42["type"] != "exploder" )
            continue;

        var_3 = var_2._id_9C42["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == "nil" )
            var_2._id_9C42["flag"] = undefined;

        var_0[var_3] = 1;
    }

    foreach ( var_7, var_6 in var_0 )
        thread _id_352E( var_7 );
}

_id_352E( var_0 )
{
    if ( !common_scripts\utility::_id_3839( var_0 ) )
        common_scripts\utility::_id_383D( var_0 );

    common_scripts\utility::_id_384A( var_0 );

    foreach ( var_2 in level._id_2417 )
    {
        if ( var_2._id_9C42["type"] != "exploder" )
            continue;

        var_3 = var_2._id_9C42["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 != var_0 )
            continue;

        var_2 common_scripts\utility::_id_06FD();
    }
}

_id_3531( var_0 )
{
    return isdefined( var_0._id_04A6 ) && var_0._id_04A6 == "exploder";
}

_id_3532( var_0 )
{
    return var_0._id_029C == "fx" && ( !isdefined( var_0._id_04A6 ) || var_0._id_04A6 != "exploderchunk" );
}

_id_3530( var_0 )
{
    return isdefined( var_0._id_04A6 ) && var_0._id_04A6 == "exploderchunk";
}

exploder_model_is_anim_model( var_0 )
{
    return isdefined( var_0._id_04A6 ) && _func_120( var_0._id_04A6, "exploderanim" );
}

_id_84CF( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !_id_3532( var_3._id_029C ) && !_id_3531( var_3._id_029C ) && !_id_3530( var_3._id_029C ) )
                    var_3._id_029C _meth_8055();

                if ( isdefined( var_3._id_1820 ) )
                    var_3._id_029C _meth_8055();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C42["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C42["exploder"] ) )
                continue;

            if ( var_3._id_9C42["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_029C ) )
            {
                if ( !_id_3532( var_3._id_029C ) && !_id_3531( var_3._id_029C ) && !_id_3530( var_3._id_029C ) )
                    var_3._id_029C _meth_8055();

                if ( isdefined( var_3._id_1820 ) )
                    var_3._id_029C _meth_8055();
            }
        }
    }
}

_id_8E7F( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !isdefined( var_3._id_587B ) )
                    continue;

                var_3._id_587B delete();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C42["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C42["exploder"] ) )
                continue;

            if ( var_3._id_9C42["exploder"] + "" != var_0 )
                continue;

            if ( !isdefined( var_3._id_587B ) )
                continue;

            var_3._id_587B delete();
        }
    }
}

_id_3D60( var_0 )
{
    var_0 += "";
    var_1 = [];

    if ( isdefined( level._id_241A ) )
    {
        var_2 = level._id_241A[var_0];

        if ( isdefined( var_2 ) )
            var_1 = var_2;
    }
    else
    {
        foreach ( var_4 in level._id_2417 )
        {
            if ( var_4._id_9C42["type"] != "exploder" )
                continue;

            if ( !isdefined( var_4._id_9C42["exploder"] ) )
                continue;

            if ( var_4._id_9C42["exploder"] + "" != var_0 )
                continue;

            var_1[var_1.size] = var_4;
        }
    }

    return var_1;
}

_id_4850( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_029C ) )
                    var_3._id_029C _meth_8056();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C42["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C42["exploder"] ) )
                continue;

            if ( var_3._id_9C42["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_029C ) )
                var_3._id_029C _meth_8056();
        }
    }
}

_id_280E( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_029C ) )
                    var_3._id_029C delete();
            }
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C42["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C42["exploder"] ) )
                continue;

            if ( var_3._id_9C42["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_029C ) )
                var_3._id_029C delete();
        }
    }

    level notify( "killexplodertridgers" + var_0 );
}

_id_352B()
{
    if ( isdefined( self._id_9C42["delay"] ) )
        var_0 = self._id_9C42["delay"];
    else
        var_0 = 0;

    if ( isdefined( self._id_9C42["damage_radius"] ) )
        var_1 = self._id_9C42["damage_radius"];
    else
        var_1 = 128;

    var_2 = self._id_9C42["damage"];
    var_3 = self._id_9C42["origin"];
    wait(var_0);

    if ( isdefined( level._id_254E ) )
        [[ level._id_254E ]]( var_3, var_1, var_2 );
    else
        _func_189( var_3, var_1, var_2, var_2 );
}

_id_06FE()
{
    if ( isdefined( self._id_9C42["firefx"] ) )
        thread _id_37AD();

    if ( isdefined( self._id_9C42["fxid"] ) && self._id_9C42["fxid"] != "No FX" )
        thread _id_1AD3();
    else if ( isdefined( self._id_9C42["soundalias"] ) && self._id_9C42["soundalias"] != "nil" )
        thread _id_889C();

    if ( isdefined( self._id_9C42["loopsound"] ) && self._id_9C42["loopsound"] != "nil" )
        thread _id_301C();

    if ( isdefined( self._id_9C42["damage"] ) )
        thread _id_352B();

    if ( isdefined( self._id_9C42["earthquake"] ) )
        thread _id_352D();

    if ( isdefined( self._id_9C42["rumble"] ) )
        thread _id_3536();

    if ( self._id_9C42["exploder_type"] == "exploderanim" )
        thread exploder_anim();
    else if ( self._id_9C42["exploder_type"] == "exploder" )
        thread _id_181F();
    else if ( self._id_9C42["exploder_type"] == "exploderchunk" || self._id_9C42["exploder_type"] == "exploderchunk visible" )
        thread _id_1821();
    else
        thread _id_181E();
}

_id_181E()
{
    var_0 = self._id_9C42["exploder"];

    if ( isdefined( self._id_9C42["delay"] ) && self._id_9C42["delay"] >= 0 )
        wait(self._id_9C42["delay"]);
    else
        wait 0.05;

    if ( !isdefined( self._id_029C ) )
        return;

    if ( isdefined( self._id_029C.classname ) )
    {
        if ( common_scripts\utility::_id_51AE() && self._id_029C._id_03DA & 1 )
            self._id_029C call [[ level._id_214E ]]();
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3527 ) )
            return;

        self._id_3527 = 1;

        if ( isdefined( self._id_029C ) && isdefined( self._id_029C.classname ) )
        {
            self._id_029C _meth_8056();
            self._id_029C _meth_82BB();
        }

        var_1 = getdvarint( "createfx_exploder_waittime", 3 );
        wait(var_1);
        self._id_3527 = undefined;

        if ( isdefined( self._id_029C ) && isdefined( self._id_029C.classname ) )
        {
            self._id_029C _meth_8055();
            self._id_029C _meth_82BA();
        }

        return;
    }

    if ( !isdefined( self._id_9C42["fxid"] ) || self._id_9C42["fxid"] == "No FX" )
        self._id_9C42["exploder"] = undefined;

    waitframe;

    if ( isdefined( self._id_029C ) && isdefined( self._id_029C.classname ) )
        self._id_029C delete();
}

_id_1821()
{
    if ( isdefined( self._id_9C42["delay"] ) )
        wait(self._id_9C42["delay"]);

    var_0 = undefined;

    if ( isdefined( self._id_9C42["target"] ) )
        var_0 = common_scripts\utility::_id_3E89( self._id_9C42["target"] );

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_029C ) )
            self._id_029C delete();

        return;
    }

    self._id_029C _meth_8055();

    if ( isdefined( self._id_9C42["delay_post"] ) )
        wait(self._id_9C42["delay_post"]);

    var_1 = self._id_9C42["origin"];
    var_2 = self._id_9C42["angles"];
    var_3 = var_0._id_02E2;
    var_4 = var_3 - self._id_9C42["origin"];
    var_5 = var_4[0];
    var_6 = var_4[1];
    var_7 = var_4[2];
    var_8 = isdefined( self._id_9C42["physics"] );

    if ( var_8 )
    {
        var_9 = undefined;

        if ( isdefined( var_0._id_04A4 ) )
            var_9 = var_0 common_scripts\utility::_id_3E89();

        if ( !isdefined( var_9 ) )
        {
            var_10 = var_1;
            var_11 = var_0._id_02E2;
        }
        else
        {
            var_10 = var_0._id_02E2;
            var_11 = ( var_9._id_02E2 - var_0._id_02E2 ) * self._id_9C42["physics"];
        }

        self._id_029C _meth_82BE( var_10, var_11 );
        return;
    }
    else
    {
        self._id_029C _meth_82B9( ( var_5, var_6, var_7 ), 12 );
        self._id_029C _meth_82AE( ( var_5, var_6, var_7 ), 12 );
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3527 ) )
            return;

        self._id_3527 = 1;
        var_12 = getdvarint( "createfx_exploder_waittime", 3 );
        wait(var_12);
        self._id_3527 = undefined;
        self._id_9C42["origin"] = var_1;
        self._id_9C42["angles"] = var_2;
        self._id_029C _meth_8056();
        return;
    }

    self._id_9C42["exploder"] = undefined;
    wait 6;

    if ( isdefined( self._id_029C ) )
        self._id_029C delete();
}

_id_181F()
{
    if ( isdefined( self._id_9C42["delay"] ) )
        wait(self._id_9C42["delay"]);

    if ( !isdefined( self._id_029C._id_7A3C ) )
    {
        self._id_029C _meth_8055();
        self._id_029C _meth_82BA();
    }
    else
    {
        var_0 = self._id_029C common_scripts\utility::_id_8959();

        if ( isdefined( self._id_029C._id_0396 ) )
            var_0._id_0396 = self._id_029C._id_0396;

        var_0 _meth_80B3( self._id_029C._id_7A3C );
        var_0 _meth_8055();
    }

    self._id_1820 = 1;

    if ( common_scripts\utility::_id_51AE() && !isdefined( self._id_029C._id_7A3C ) && self._id_029C._id_03DA & 1 )
    {
        if ( !isdefined( self._id_029C._id_2B34 ) )
            self._id_029C call [[ level._id_214E ]]();
        else
            self._id_029C call [[ level._id_2B39 ]]();
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3527 ) )
            return;

        self._id_3527 = 1;
        var_1 = getdvarint( "createfx_exploder_waittime", 3 );
        wait(var_1);
        self._id_3527 = undefined;

        if ( !isdefined( self._id_029C._id_7A3C ) )
        {
            self._id_029C _meth_8056();
            self._id_029C _meth_82BB();
        }
    }
}

exploder_anim()
{
    var_0 = self._id_029C;
    var_0 _meth_8055();
    var_0 _meth_82BA();

    if ( isdefined( var_0._id_03DA ) && var_0._id_03DA & 1 )
        var_0 _meth_805A();

    var_0 notify( "play_exploder_anim" );
}

_id_3536()
{
    if ( !common_scripts\utility::_id_51AE() )
        return;

    _id_352C();
    level._id_0318 _meth_80AF( self._id_9C42["rumble"] );
}

_id_352C()
{
    if ( !isdefined( self._id_9C42["delay"] ) )
        self._id_9C42["delay"] = 0;

    var_0 = self._id_9C42["delay"];
    var_1 = self._id_9C42["delay"] + 0.001;

    if ( isdefined( self._id_9C42["delay_min"] ) )
        var_0 = self._id_9C42["delay_min"];

    if ( isdefined( self._id_9C42["delay_max"] ) )
        var_1 = self._id_9C42["delay_max"];

    if ( var_0 > 0 )
        wait(_func_0B5( var_0, var_1 ));
}

_id_301C()
{
    if ( isdefined( self._id_5891 ) )
        self._id_5891 delete();

    var_0 = self._id_9C42["origin"];
    var_1 = self._id_9C42["loopsound"];
    _id_352C();
    self._id_5891 = common_scripts\utility::_id_697A( var_1, var_0 );
}

_id_889C()
{
    _id_301D();
}

_id_301D()
{
    var_0 = self._id_9C42["origin"];
    var_1 = self._id_9C42["soundalias"];
    _id_352C();
    common_scripts\utility::_id_69C2( var_1, var_0 );
}

_id_352D()
{
    _id_352C();
    common_scripts\utility::_id_2BBD( self._id_9C42["earthquake"], self._id_9C42["origin"] );
}

_id_3535()
{
    if ( !isdefined( self._id_9C42["soundalias"] ) || self._id_9C42["soundalias"] == "nil" )
        return;

    common_scripts\utility::_id_69C2( self._id_9C42["soundalias"], self._id_9C42["origin"] );
}

_id_37AD()
{
    var_0 = self._id_9C42["forward"];
    var_1 = self._id_9C42["up"];
    var_2 = undefined;
    var_3 = self._id_9C42["firefxsound"];
    var_4 = self._id_9C42["origin"];
    var_5 = self._id_9C42["firefx"];
    var_6 = self._id_9C42["ender"];

    if ( !isdefined( var_6 ) )
        var_6 = "createfx_effectStopper";

    var_7 = 0.5;

    if ( isdefined( self._id_9C42["firefxdelay"] ) )
        var_7 = self._id_9C42["firefxdelay"];

    _id_352C();

    if ( isdefined( var_3 ) )
        common_scripts\utility::_id_5874( var_3, var_4, ( 0, 0, 0 ), 1, var_6 );

    playfx( level._id_058F[var_5], self._id_9C42["origin"], var_0, var_1 );
}

_id_1AD3()
{
    if ( isdefined( self._id_9C42["repeat"] ) )
    {
        thread _id_3535();

        for ( var_0 = 0; var_0 < self._id_9C42["repeat"]; var_0++ )
        {
            playfx( level._id_058F[self._id_9C42["fxid"]], self._id_9C42["origin"], self._id_9C42["forward"], self._id_9C42["up"] );
            _id_352C();
        }

        return;
    }

    if ( !isdefined( self._id_9C42["delay"] ) )
        self._id_9C42["delay"] = 0;

    if ( self._id_9C42["delay"] >= 0 )
    {
        _id_352C();
        var_1 = 0;
    }
    else
        var_1 = self._id_9C42["delay"];

    if ( isdefined( self._id_9C42["cannon_spawn_func"] ) )
        self [[ self._id_9C42["cannon_spawn_func"] ]]();
    else
        cannon_spawnfx( var_1 );

    _id_3535();
}

cannon_spawnfx( var_0 )
{
    if ( isdefined( self._id_587B ) )
        self._id_587B delete();

    self._id_587B = spawnfx( common_scripts\utility::_id_3FA8( self._id_9C42["fxid"] ), self._id_9C42["origin"], self._id_9C42["forward"], self._id_9C42["up"] );

    if ( level._id_2409 )
        setfxkillondelete( self._id_587B, 1 );

    if ( self._id_9C42["delay"] >= 0 )
        triggerfx( self._id_587B );
    else
        triggerfx( self._id_587B, var_0 );
}

_id_06F9( var_0, var_1, var_2 )
{
    var_0 += "";
    level notify( "exploding_" + var_0 );
    var_3 = 0;

    if ( isdefined( level._id_241A ) && !level._id_2409 )
    {
        var_4 = level._id_241A[var_0];

        if ( isdefined( var_4 ) )
        {
            foreach ( var_6 in var_4 )
            {
                if ( !var_6 _id_1CB9() )
                    continue;

                var_6 common_scripts\utility::_id_06FD();
                var_3 = 1;
            }
        }
    }
    else
    {
        for ( var_8 = 0; var_8 < level._id_2417.size; var_8++ )
        {
            var_6 = level._id_2417[var_8];

            if ( !isdefined( var_6 ) )
                continue;

            if ( var_6._id_9C42["type"] != "exploder" )
                continue;

            if ( !isdefined( var_6._id_9C42["exploder"] ) )
                continue;

            if ( var_6._id_9C42["exploder"] + "" != var_0 )
                continue;

            if ( !var_6 _id_1CB9() )
                continue;

            var_6 common_scripts\utility::_id_06FD();
            var_3 = 1;
        }
    }

    if ( !_id_84A8() && !var_3 )
        _id_06F5( var_0, var_1, var_2 );
}

_id_3528( var_0, var_1, var_2 )
{
    [[ level._id_05B2._id_3539 ]]( var_0, var_1, var_2 );
}

_id_5309( var_0 )
{
    var_1 = _id_3F8E( var_0 );

    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_587B ) )
                setfxkillondelete( var_3._id_587B, 1 );
        }

        waittillframeend;

        foreach ( var_3 in var_1 )
            var_3 common_scripts\utility::_id_671F();
    }
}

_id_1CB9()
{
    var_0 = self;

    if ( isdefined( var_0._id_9C42["platform"] ) && isdefined( level._id_00E3 ) )
    {
        var_1 = var_0._id_9C42["platform"];

        if ( var_1 == "cg" && !level._id_00E3 || var_1 == "ng" && !level._id_02AF )
            return 0;
    }

    return 1;
}

_id_06F5( var_0, var_1, var_2 )
{
    if ( !_id_509A( var_0 ) )
        return;

    var_3 = _func_0BC( var_0 );
    _func_227( var_3, var_1, var_2 );
}

_id_262B( var_0, var_1, var_2 )
{
    if ( !_id_509A( var_0 ) )
        return;

    var_3 = _func_0BC( var_0 );
    _func_29A( var_3, var_1, var_2 );
}

_id_509A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0;

    if ( isstring( var_0 ) )
    {
        var_1 = _func_0BC( var_0 );

        if ( var_1 == 0 && var_0 != "0" )
            return 0;
    }

    return var_1 >= 0;
}

_id_84A8()
{
    if ( common_scripts\utility::_id_51AE() )
        return 1;

    if ( !isdefined( level._id_2409 ) )
        level._id_2409 = getdvar( "createfx" ) != "";

    if ( level._id_2409 )
        return 1;
    else
        return getdvar( "clientSideEffects" ) != "1";
}

_id_352A( var_0, var_1, var_2 )
{
    waitframe;
    waitframe;
    _id_06F9( var_0, var_1, var_2 );
}

_id_3529( var_0, var_1, var_2 )
{
    _id_06F9( var_0, var_1, var_2 );
}

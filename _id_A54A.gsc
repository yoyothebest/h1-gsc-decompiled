// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !_id_A5A4::is_h1_level() )
        return;

    precachestring( &"SCRIPT_INTELLIGENCE_OF_THIRTY" );
    precacheshader( "h1_hud_ammo_status_glow" );
    precacheshader( "h1_hud_ammo_status_scanlines" );
    level.intel_items_total = 30;
    level._id_4E97 = _id_239B();
    level._id_90AA = _id_239C();
    _id_4DDA();
}

_id_4DDA()
{
    for ( var_0 = 0; var_0 < level._id_4E97.size; var_0++ )
    {
        var_1 = level._id_4E97[var_0];
        var_2 = var_1._id_02E2;
        level._id_4E97[var_0]._id_627D = _id_3DFB( var_2 );

        if ( level._id_4E97[var_0] _id_1CCD() )
        {
            var_1._id_0211 _meth_8056();
            var_1._id_0211 _meth_82BB();
            var_1 common_scripts\utility::_id_97CC();
            level._id_4E97[var_0]._id_39F1 = 1;
            continue;
        }

        level._id_4E97[var_0] thread _id_9FB5();
    }

    remove_found_intel();
}

remove_found_intel()
{
    for (;;)
    {
        for ( var_0 = 0; var_0 < level._id_4E97.size; var_0++ )
        {
            if ( !isdefined( level._id_4E97[var_0]._id_739C ) && level._id_4E97[var_0] _id_1CCD() )
            {
                level._id_4E97[var_0]._id_739C = 1;
                level._id_4E97[var_0]._id_0211 _meth_8056();
                level._id_4E97[var_0]._id_0211 _meth_82BB();
                level._id_4E97[var_0] common_scripts\utility::_id_97CC();
                level._id_4E97[var_0] notify( "end_trigger_thread" );
            }
        }

        wait 0.1;
    }
}

_id_1CCD()
{
    return level._id_0318 _meth_823D( self._id_627D );
}

_id_239B()
{
    var_0 = getentarray( "intelligence_item", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1]._id_0211 = getent( var_0[var_1]._id_04A4, "targetname" );
        var_0[var_1]._id_39F1 = 0;
    }

    return var_0;
}

_id_239C()
{
    var_0 = [];

    for ( var_1 = 1; var_1 <= level.intel_items_total; var_1++ )
    {
        var_2 = _func_1BB( "sp/_intel_items.csv", 0, var_1, 4 );

        if ( isdefined( var_2 ) && var_2 != "undefined" )
        {
            var_3 = _func_124( var_2, "," );

            for ( var_4 = 0; var_4 < var_3.size; var_4++ )
                var_3[var_4] = _func_0BC( var_3[var_4] );

            var_0[var_1] = ( var_3[0], var_3[1], var_3[2] );
            continue;
        }

        var_0[var_1] = undefined;
    }

    return var_0;
}

_id_9FB5()
{
    self _meth_80DD( &"SCRIPT_INTELLIGENCE_PICKUP" );
    self _meth_817F();
    self endon( "end_trigger_thread" );
    self waittill( "trigger" );
    self._id_39F1 = 1;
    common_scripts\utility::_id_97CC();
    save_that_item_is_found();
    updategamerprofile();
    thread _id_4E96();
}

save_that_item_is_found()
{
    level._id_0318 _meth_823E( self._id_627D );
}

_id_3DFB( var_0 )
{
    for ( var_1 = 1; var_1 < level._id_90AA.size + 1; var_1++ )
    {
        if ( !isdefined( level._id_90AA[var_1] ) )
            continue;

        if ( _func_0F0( var_0, level._id_90AA[var_1] ) < 25 )
            return var_1;
    }
}

_id_4E96()
{
    self._id_0211 _meth_8056();
    self._id_0211 _meth_82BB();
    level thread common_scripts\utility::_id_69C2( "intelligence_pickup", self._id_0211._id_02E2 );
    var_0 = 3000;
    var_1 = 700;
    var_2 = _id_A546::_id_2420( "h1_hud_ammo_status_glow", 400, 75 );
    var_2.color = ( 1, 0.95, 0.4 );
    var_2._id_0530 = 0;
    var_2._id_0538 = -65;
    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2._id_01F3 = "center";
    var_2._id_0501 = "middle";
    var_2._id_0198 = 1;
    var_2.alpha = 0.0;
    var_3 = _id_A546::_id_2420( "h1_hud_ammo_status_scanlines", 800, 75 );
    var_3.color = ( 1, 0.85, 0 );
    var_3._id_0530 = 0;
    var_3._id_0538 = -65;
    var_3.alignx = "center";
    var_3.aligny = "middle";
    var_3._id_01F3 = "center";
    var_3._id_0501 = "middle";
    var_3._id_0198 = 1;
    var_3.alpha = 0.0;
    var_4 = _id_A546::_id_2401( "objective", 1.5 );
    var_4 _id_814B();
    var_4 _meth_808B( 19, var_0, var_1 );
    var_4 _meth_80D9( intel_found_total() );
    var_5 = intel_found_total();

    if ( var_5 == 15 || maps\_achievements::platform_tracks_progression() )
        _id_A5A4::_id_41DD( "LOOK_SHARP" );

    if ( var_5 == 30 || maps\_achievements::platform_tracks_progression() )
        _id_A5A4::_id_41DD( "EYES_AND_EARS" );

    wait 0.7;
    var_2.alpha = 0.5;
    wait 0.05;
    var_3.alpha = 0.6;
    var_2 _meth_8086( 0.035 );
    var_2.alpha = 0.0;
    wait 0.05;
    var_3 _meth_8086( 1.0 );
    var_3.alpha = 0.0;
    wait(( var_0 + var_1 ) / 1000);
    var_4 _meth_808A();
    var_2 _meth_808A();
    var_3 _meth_808A();
}

_id_814B()
{
    self._id_0189 = 1.2;
    self._id_01BD = ( 0.96, 0.81, 0 );
    self._id_01BC = 0.2;
    self.color = ( 0.99, 0.97, 0.85 );
    self.alpha = 1;
    self._id_0530 = 0;
    self._id_0538 = -65;
    self.alignx = "center";
    self.aligny = "middle";
    self._id_01F3 = "center";
    self._id_0501 = "middle";
    self._id_0198 = 1;
    self._id_0241 = &"SCRIPT_INTELLIGENCE_OF_THIRTY";
}

intel_found_total()
{
    var_0 = 0;

    for ( var_1 = 1; var_1 <= level.intel_items_total; var_1++ )
    {
        if ( level._id_0318 _meth_823D( var_1 ) )
            var_0++;
    }

    return var_0;
}

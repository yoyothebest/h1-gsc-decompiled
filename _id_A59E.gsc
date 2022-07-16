// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3DCA()
{
    var_0 = [];
    var_0["trigger_multiple_nobloodpool"] = ::_id_97CB;
    var_0["trigger_multiple_flag_set"] = ::_id_978E;
    var_0["trigger_multiple_flag_clear"] = ::_id_978C;
    var_0["trigger_multiple_sun_off"] = ::_id_9802;
    var_0["trigger_multiple_sun_on"] = ::_id_9803;
    var_0["trigger_use_flag_set"] = ::_id_978E;
    var_0["trigger_use_flag_clear"] = ::_id_978C;
    var_0["trigger_multiple_flag_set_touching"] = ::_id_9793;
    var_0["trigger_multiple_flag_lookat"] = ::_id_97B0;
    var_0["trigger_multiple_flag_looking"] = ::_id_97B2;
    var_0["trigger_multiple_no_prone"] = ::_id_97CA;
    var_0["trigger_multiple_no_crouch_or_prone"] = ::_id_97C9;
    var_0["trigger_multiple_compass"] = ::_id_97BE;
    var_0["trigger_multiple_specialops_flag_set"] = ::_id_9791;
    var_0["trigger_multiple_fx_volume"] = ::_id_97C2;
    var_0["trigger_multiple_fx_fxzone"] = ::_id_9793;
    var_0["trigger_multiple_light_sunshadow"] = _id_A54F::_id_8FBC;

    if ( !_id_A5A4::_id_5056() )
    {
        var_0["trigger_multiple_autosave"] = _id_A514::_id_9758;
        var_0["trigger_multiple_spawn"] = _id_A581::_id_97F9;
        var_0["trigger_multiple_spawn_reinforcement"] = _id_A581::_id_97FA;
    }

    var_0["trigger_multiple_slide"] = ::_id_97F6;
    var_0["trigger_multiple_statscheckpoint"] = ::_id_97FF;
    var_0["trigger_multiple_fog"] = ::_id_9799;
    var_0["trigger_multiple_depthoffield"] = ::_id_97BF;
    var_0["trigger_multiple_tessellationcutoff"] = ::_id_97C6;
    var_0["trigger_damage_player_flag_set"] = ::_id_976A;
    var_0["trigger_multiple_visionset"] = ::_id_97C7;
    var_0["trigger_multiple_visionset_touch"] = ::trigger_multiple_visionset_touch;
    var_0["trigger_multiple_sunflare"] = ::_id_97C5;
    var_0["trigger_multiple_glass_break"] = ::_id_97A1;
    var_0["trigger_radius_glass_break"] = ::_id_97A1;
    var_0["trigger_multiple_friendly_respawn"] = ::_id_979C;
    var_0["trigger_multiple_enemy_respawn"] = ::_id_9773;
    var_0["trigger_multiple_friendly_stop_respawn"] = ::_id_979D;
    var_0["trigger_multiple_enemy_stop_respawn"] = ::_id_9774;
    var_0["trigger_multiple_physics"] = ::_id_97D2;
    var_0["trigger_multiple_fx_watersheeting"] = ::_id_97C3;
    var_0["trigger_multiple_fx_wakevolume"] = ::_id_980F;
    var_0["trigger_multiple_fx_fallingwatervolume"] = ::_id_978B;
    var_0["trigger_multiple_interval"] = ::_id_97C4;
    return var_0;
}

_id_97C3( var_0 )
{
    var_1 = 3;

    if ( isdefined( var_0._id_79B4 ) )
        var_1 = var_0._id_79B4;

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( _func_1AD( var_2 ) )
        {
            var_2 _meth_821C( 1, var_1 );
            wait(var_1 * 0.2);
        }
    }
}

_id_3DCB()
{
    var_0 = [];
    var_0["friendly_wave"] = _id_A581::_id_3A8E;
    var_0["friendly_wave_off"] = _id_A581::_id_3A8E;
    var_0["friendly_mgTurret"] = _id_A581::_id_3A70;

    if ( !_id_A5A4::_id_5056() )
    {
        var_0["camper_spawner"] = _id_A581::_id_1A42;
        var_0["flood_spawner"] = _id_A581::_id_38F4;
        var_0["trigger_spawner"] = _id_A581::_id_97F9;
        var_0["trigger_autosave"] = _id_A514::_id_9758;
        var_0["trigger_spawngroup"] = ::_id_97FC;
        var_0["two_stage_spawner"] = _id_A581::_id_99E5;
        var_0["trigger_vehicle_spline_spawn"] = ::_id_980C;
        var_0["trigger_vehicle_spawn"] = ::_id_980B;
        var_0["trigger_vehicle_getin_spawn"] = ::_id_980A;
        var_0["random_spawn"] = _id_A581::_id_7118;
    }

    var_0["autosave_now"] = _id_A514::_id_1150;
    var_0["trigger_autosave_tactical"] = _id_A514::_id_975B;
    var_0["trigger_autosave_stealth"] = _id_A514::_id_975A;
    var_0["trigger_unlock"] = ::_id_9808;
    var_0["trigger_lookat"] = ::_id_97B0;
    var_0["trigger_looking"] = ::_id_97B2;
    var_0["trigger_cansee"] = ::_id_9764;
    var_0["autosave_immediate"] = _id_A514::_id_9759;
    var_0["flag_set"] = ::_id_978E;

    if ( _id_A5A4::_id_500C() )
        var_0["flag_set_coop"] = ::_id_978F;

    var_0["flag_set_player"] = ::_id_9790;
    var_0["flag_unset"] = ::_id_978C;
    var_0["flag_clear"] = ::_id_978C;
    var_0["objective_event"] = _id_A581::_id_62ED;
    var_0["friendly_respawn_trigger"] = ::_id_979C;
    var_0["friendly_respawn_clear"] = ::friendly_respawn_clear;
    var_0["enemy_respawn_trigger"] = ::_id_9773;
    var_0["radio_trigger"] = ::_id_97D8;
    var_0["trigger_ignore"] = ::_id_97AA;
    var_0["trigger_pacifist"] = ::_id_97D1;
    var_0["trigger_delete"] = ::_id_9807;
    var_0["trigger_delete_on_touch"] = ::_id_976D;
    var_0["trigger_off"] = ::_id_9807;
    var_0["trigger_outdoor"] = _id_A581::_id_65BC;
    var_0["trigger_indoor"] = _id_A581::_id_4C45;
    var_0["trigger_hint"] = ::_id_97A6;
    var_0["trigger_grenade_at_player"] = ::_id_9804;
    var_0["flag_on_cleared"] = ::_id_978D;
    var_0["flag_set_touching"] = ::_id_9793;
    var_0["delete_link_chain"] = ::_id_976C;
    var_0["trigger_fog"] = ::_id_9799;
    var_0["trigger_slide"] = ::_id_97F6;
    var_0["trigger_stats"] = ::_id_97FF;
    var_0["trigger_dooropen"] = ::_id_9770;
    var_0["no_crouch_or_prone"] = ::_id_97C9;
    var_0["no_prone"] = ::_id_97CA;
    return var_0;
}

_id_4D53()
{
    var_0 = _id_3DCA();
    var_1 = _id_3DCB();

    foreach ( var_5, var_3 in var_0 )
    {
        var_4 = getentarray( var_5, "classname" );
        common_scripts\utility::_id_0CF0( var_4, var_3 );
    }

    var_6 = getentarray( "trigger_multiple", "classname" );
    var_7 = getentarray( "trigger_radius", "classname" );
    var_4 = _id_A5A4::_id_0CF2( var_6, var_7 );
    var_8 = getentarray( "trigger_disk", "classname" );
    var_4 = _id_A5A4::_id_0CF2( var_4, var_8 );
    var_9 = getentarray( "trigger_once", "classname" );
    var_4 = _id_A5A4::_id_0CF2( var_4, var_9 );

    if ( !_id_A5A4::_id_5056() )
    {
        for ( var_10 = 0; var_10 < var_4.size; var_10++ )
        {
            if ( var_4[var_10]._id_03DA & 32 )
                thread _id_A581::_id_97F9( var_4[var_10] );
        }
    }

    for ( var_11 = 0; var_11 < 7; var_11++ )
    {
        switch ( var_11 )
        {
            case 0:
                var_12 = "trigger_multiple";
                break;
            case 1:
                var_12 = "trigger_once";
                break;
            case 2:
                var_12 = "trigger_use";
                break;
            case 3:
                var_12 = "trigger_radius";
                break;
            case 4:
                var_12 = "trigger_lookat";
                break;
            case 5:
                var_12 = "trigger_disk";
                break;
            default:
                var_12 = "trigger_damage";
                break;
        }

        var_4 = getentarray( var_12, "code_classname" );

        for ( var_10 = 0; var_10 < var_4.size; var_10++ )
        {
            if ( isdefined( var_4[var_10]._id_79D9 ) )
                level thread _id_97E0( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_79D6 ) )
                level thread _id_97DF( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_7952 ) || isdefined( var_4[var_10]._id_7951 ) )
                level thread _id_A514::_id_1166( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_79C6 ) )
                level thread _id_A581::_id_3662( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_7A37 ) )
                level thread _id_A558::_id_5BD6( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_7A1D ) )
                level thread _id_A581::_id_5339( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_7A1C ) )
                level thread _id_A5AA::_id_5340( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_79B6 ) )
                level thread _id_A581::_id_3095( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_7AA6 ) )
                var_4[var_10]._id_79BF = var_4[var_10]._id_7AA6;

            if ( isdefined( var_4[var_10]._id_79BF ) )
                level thread _id_A550::_id_352F( var_4[var_10] );

            if ( isdefined( var_4[var_10].ambient ) )
                var_4[var_10] thread _id_A5DC::_id_97BD( 1 );

            if ( isdefined( var_4[var_10]._id_7950 ) || isdefined( var_4[var_10]._id_7947 ) || isdefined( var_4[var_10]._id_7949 ) || isdefined( var_4[var_10]._id_794D ) || isdefined( var_4[var_10]._id_7946 ) || isdefined( var_4[var_10]._id_7948 ) || isdefined( var_4[var_10]._id_794B ) || isdefined( var_4[var_10]._id_794A ) || isdefined( var_4[var_10]._id_794F ) )
                var_4[var_10] thread _id_A5DC::_id_97BD();

            if ( isdefined( var_4[var_10]._id_7AFC ) )
                level thread _id_97D3( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_795D ) )
                level thread _id_975C( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_7AFB ) )
                var_4[var_10] thread _id_97A2();

            if ( isdefined( var_4[var_10]._id_7AB3 ) )
                level thread _id_A581::_id_7116( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_7A99 ) )
                level thread _id_A51C::init_color_delay_info( var_4[var_10] );

            if ( isdefined( var_4[var_10]._id_04A6 ) )
            {
                var_13 = var_4[var_10]._id_04A6;

                if ( isdefined( var_1[var_13] ) )
                    level thread [[ var_1[var_13] ]]( var_4[var_10] );
            }
        }
    }
}

_id_9769( var_0 )
{
    var_1 = 1;

    if ( var_1 )
        var_0 delete();
}

_id_23E3()
{

}

_id_976A( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( !_func_1A1( var_2 ) )
            continue;

        if ( !_func_1AD( var_2 ) )
            continue;

        var_0 _id_A5A4::_id_0392();
        common_scripts\utility::_id_383F( var_1, var_2 );
    }
}

_id_978C( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    for (;;)
    {
        var_0 waittill( "trigger" );
        var_0 _id_A5A4::_id_0392();
        common_scripts\utility::_id_3831( var_1 );
    }
}

_id_978D( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    for (;;)
    {
        var_0 waittill( "trigger" );
        wait 1;

        if ( var_0 _id_39F5() )
            continue;

        break;
    }

    common_scripts\utility::_id_383F( var_1 );
}

_id_39F5()
{
    var_0 = _func_0D9( "bad_guys" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( !_func_1A1( var_2 ) )
            continue;

        if ( var_2 _meth_80AB( self ) )
            return 1;

        wait 0.1;
    }

    var_0 = _func_0D9( "bad_guys" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( var_2 _meth_80AB( self ) )
            return 1;
    }

    return 0;
}

_id_978E( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );
        var_0 _id_A5A4::_id_0392();
        common_scripts\utility::_id_383F( var_1, var_2 );
    }
}

_id_978F( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    var_2 = [];

    for (;;)
    {
        var_0 waittill( "trigger", var_3 );

        if ( !_func_1AD( var_3 ) )
            continue;

        var_4 = [];
        var_4[var_4.size] = var_3;
        var_2 = _id_A5A4::_id_0CF2( var_2, var_4 );

        if ( var_2.size == level._id_0323.size )
            break;
    }

    var_0 _id_A5A4::_id_0392();
    common_scripts\utility::_id_383F( var_1 );
}

_id_9791( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    var_0._id_6C32 = level._id_0323;
    var_0 thread _id_9792( var_1 );

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );
        var_0._id_6C32 = common_scripts\utility::_id_0CF6( var_0._id_6C32, var_2 );

        if ( var_0._id_6C32.size )
            continue;

        var_0 _id_A5A4::_id_0392();
        common_scripts\utility::_id_383F( var_1, var_2 );
    }
}

_id_9792( var_0 )
{
    for (;;)
    {
        level waittill( var_0 );

        if ( common_scripts\utility::_id_382E( var_0 ) )
        {
            self._id_6C32 = [];
            continue;
        }

        self._id_6C32 = level._id_0323;
    }
}

_id_979C( var_0 )
{
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    var_2 = var_1[0];
    var_1 = undefined;
    var_2 endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level._id_7474 = var_2;
        common_scripts\utility::_id_383F( "respawn_friendlies" );
        wait 0.5;
    }
}

trigger_friendly_respawn_preh1( var_0 )
{
    var_0 endon( "death" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_2 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1._id_02E2;
        var_1 delete();
    }
    else
    {
        var_1 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );
        var_2 = var_1._id_02E2;
    }

    for (;;)
    {
        var_0 waittill( "trigger" );
        level._id_7474 = var_1;
        common_scripts\utility::_id_383F( "respawn_friendlies" );
        wait 0.5;
    }
}

_id_979D( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::_id_3831( "respawn_friendlies" );
    }
}

friendly_respawn_clear( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::_id_3831( "respawn_friendlies" );
        wait 0.5;
    }
}

_id_9773( var_0 )
{
    var_0 endon( "death" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_2 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1._id_02E2;
        var_1 delete();
    }
    else
    {
        var_1 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );
        var_2 = var_1._id_02E2;
    }

    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::_id_383F( "respawn_enemies" );
        wait 0.5;
    }
}

_id_9774( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger" );
        common_scripts\utility::_id_3831( "respawn_enemies" );
    }
}

_id_9793( var_0 )
{
    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );
        var_0 _id_A5A4::_id_0392();

        if ( _func_1A1( var_2 ) && var_2 _meth_80AB( var_0 ) && isdefined( var_0 ) )
            common_scripts\utility::_id_383F( var_1 );

        while ( _func_1A1( var_2 ) && var_2 _meth_80AB( var_0 ) && isdefined( var_0 ) )
            wait 0.25;

        common_scripts\utility::_id_3831( var_1 );
    }
}

_id_97A2()
{
    thread _id_97A3();
    level endon( "trigger_group_" + self._id_7AFB );
    self waittill( "trigger" );
    level notify( "trigger_group_" + self._id_7AFB, self );
}

_id_97A3()
{
    level waittill( "trigger_group_" + self._id_7AFB, var_0 );

    if ( self != var_0 )
        self delete();
}

_id_97CB( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !_func_1A1( var_1 ) )
            continue;

        var_1._id_85B9 = 1;
        var_1 thread _id_7F03();
    }
}

_id_97C4( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 thread trigger_multiple_interval_thread( var_0 );
    }
}

trigger_multiple_interval_thread( var_0 )
{
    if ( !_func_1A1( self ) )
        return;

    self endon( "death" );

    if ( isdefined( self.touching_trigger_multiple_interval ) )
        return;

    self.touching_trigger_multiple_interval = 1;
    var_1 = self._id_020C;
    self._id_020C = _func_0BD( var_0._id_7A99 );

    while ( self _meth_80AB( var_0 ) )
        wait 0.05;

    self._id_020C = var_1;
    self.touching_trigger_multiple_interval = undefined;
}

_id_7F03()
{
    self notify( "notify_wait_then_clear_skipBloodPool" );
    self endon( "notify_wait_then_clear_skipBloodPool" );
    self endon( "death" );
    wait 2;
    self._id_85B9 = undefined;
}

_id_97D2( var_0 )
{
    var_1 = [];
    var_2 = common_scripts\utility::_id_40FD( var_0._id_04A4, "targetname" );
    var_3 = getentarray( var_0._id_04A4, "targetname" );

    foreach ( var_5 in var_3 )
    {
        var_6 = spawnstruct();
        var_6._id_02E2 = var_5._id_02E2;
        var_6._id_7A99 = var_5._id_7A99;
        var_6._id_7981 = var_5._id_7981;
        var_6._id_0351 = var_5._id_0351;
        var_2[var_2.size] = var_6;
        var_5 delete();
    }

    var_0._id_6581 = var_2[0]._id_02E2;
    var_0 waittill( "trigger" );
    var_0 _id_A5A4::_id_0392();

    foreach ( var_6 in var_2 )
    {
        var_9 = var_6._id_0351;
        var_10 = var_6._id_7A99;
        var_11 = var_6._id_7981;

        if ( !isdefined( var_9 ) )
            var_9 = 350;

        if ( !isdefined( var_10 ) )
            var_10 = 0.25;

        setdvar( "tempdvar", var_10 );
        var_10 = getdvarfloat( "tempdvar" );

        if ( isdefined( var_11 ) )
            _func_189( var_6._id_02E2, var_9, var_11, var_11 * 0.5 );

        _func_17E( var_6._id_02E2, var_9, var_9 * 0.5, var_10 );
    }
}

_id_97D3( var_0 )
{
    var_1 = var_0._id_7AFC;
    var_0 waittill( "trigger" );
    var_2 = _func_0D9();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !_func_1A1( var_2[var_3] ) )
            continue;

        if ( isdefined( var_2[var_3]._id_7AFC ) && var_2[var_3]._id_7AFC == var_1 )
        {
            var_2[var_3]._id_01C4 = 800;
            var_2[var_3] _meth_81AB( level._id_0318 );
            level thread _id_A581::_id_27DC( var_2[var_3] );
        }
    }
}

_id_97DF( var_0 )
{
    var_1 = common_scripts\utility::_id_23B2( var_0._id_79D6 );
    var_0 _id_07B2( var_1 );
    var_0 common_scripts\utility::_id_9AE8();
}

_id_97E0( var_0 )
{
    var_1 = common_scripts\utility::_id_23B2( var_0._id_79D9 );
    var_0 _id_07B2( var_1 );
    var_0 common_scripts\utility::_id_9AE8();
}

_id_07B2( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( !isdefined( level._id_9794[var_2] ) )
            level._id_9794[var_2] = [];

        level._id_9794[var_2][level._id_9794[var_2].size] = self;
    }
}

_id_97FC( var_0 )
{
    waitframe;
    var_1 = var_0._id_7ACF;

    if ( !isdefined( level._id_8907[var_1] ) )
        return;

    var_0 waittill( "trigger" );
    var_2 = common_scripts\utility::_id_710E( level._id_8907[var_1] );

    foreach ( var_5, var_4 in var_2 )
        var_4 _id_A5A4::_id_88C3();
}

_id_9802( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( getdvarint( "sm_sunenable" ) == 0 )
            continue;

        _func_0D6( "sm_sunenable", 0 );
    }
}

_id_9803( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( getdvarint( "sm_sunenable" ) == 1 )
            continue;

        _func_0D6( "sm_sunenable", 1 );
    }
}

_id_980A( var_0 )
{
    var_1 = getentarray( var_0._id_04A4, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_4 = getentarray( var_3._id_04A4, "targetname" );

        foreach ( var_6 in var_4 )
        {
            if ( !_func_120( var_6.code_classname, "actor" ) )
                continue;

            if ( !( var_6._id_03DA & 1 ) )
                continue;

            var_6._id_2D1B = 1;
        }
    }

    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_1, _id_A5AB::_id_8976( undefined, 0, 1 ) );
}

_id_980C( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 thread _id_A5AB::_id_8976( 70 );
        wait 0.05;
    }
}

_id_3EA5()
{
    var_0 = [];
    var_1 = undefined;

    if ( isdefined( self._id_04A4 ) )
    {
        var_2 = getentarray( self._id_04A4, "targetname" );
        var_3 = [];

        foreach ( var_5 in var_2 )
        {
            if ( var_5.classname == "script_origin" )
                var_3[var_3.size] = var_5;

            if ( _func_120( var_5.classname, "trigger" ) )
                var_0[var_0.size] = var_5;
        }

        var_2 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );

        foreach ( var_5 in var_2 )
            var_3[var_3.size] = var_5;

        if ( var_3.size == 1 )
        {
            var_9 = var_3[0];
            var_1 = var_9._id_02E2;

            if ( isdefined( var_9.code_classname ) )
                var_9 delete();
        }
    }

    var_10 = [];
    var_10["triggers"] = var_0;
    var_10["target_origin"] = var_1;
    return var_10;
}

_id_97B0( var_0 )
{
    _id_97B1( var_0, 1 );
}

_id_97B2( var_0 )
{
    _id_97B1( var_0, 0 );
}

_id_97B1( var_0, var_1 )
{
    var_2 = 0.78;

    if ( isdefined( var_0._id_79AC ) )
        var_2 = var_0._id_79AC;

    var_3 = var_0 _id_3EA5();
    var_4 = var_3["triggers"];
    var_5 = var_3["target_origin"];
    var_6 = isdefined( var_0._id_79D3 ) || isdefined( var_0._id_0398 );
    var_7 = undefined;

    if ( var_6 )
    {
        var_7 = var_0 _id_A5A4::_id_3EA3();

        if ( !isdefined( level._id_382E[var_7] ) )
            common_scripts\utility::_id_383D( var_7 );
    }
    else if ( !var_4.size )
    {

    }

    if ( var_1 && var_6 )
        level endon( var_7 );

    var_0 endon( "death" );
    var_8 = 1;

    if ( isdefined( var_0._id_7A99 ) )
        var_8 = !_func_120( var_0._id_7A99, "no_sight" );

    for (;;)
    {
        if ( var_6 )
            common_scripts\utility::_id_3831( var_7 );

        var_0 waittill( "trigger", var_9 );
        var_10 = [];

        while ( var_9 _meth_80AB( var_0 ) )
        {
            if ( var_8 && !_func_08E( var_9 _meth_80AA(), var_5, 0, undefined ) )
            {
                if ( var_6 )
                    common_scripts\utility::_id_3831( var_7 );

                wait 0.5;
                continue;
            }

            var_11 = _func_114( var_5 - var_9._id_02E2 );
            var_12 = var_9 _meth_8338();
            var_13 = anglestoforward( var_12 );
            var_14 = _func_0F6( var_13, var_11 );

            if ( var_14 >= var_2 )
            {
                common_scripts\utility::_id_0D13( var_4, _id_A5A4::_id_7C82, "trigger" );

                if ( var_6 )
                    common_scripts\utility::_id_383F( var_7, var_9 );

                if ( var_1 )
                    return;

                wait 2;
            }
            else if ( var_6 )
                common_scripts\utility::_id_3831( var_7 );

            if ( var_8 )
            {
                wait 0.5;
                continue;
            }

            wait 0.05;
        }
    }
}

_id_9764( var_0 )
{
    var_1 = [];
    var_2 = undefined;
    var_3 = var_0 _id_3EA5();
    var_1 = var_3["triggers"];
    var_2 = var_3["target_origin"];
    var_4 = isdefined( var_0._id_79D3 ) || isdefined( var_0._id_0398 );
    var_5 = undefined;

    if ( var_4 )
    {
        var_5 = var_0 _id_A5A4::_id_3EA3();

        if ( !isdefined( level._id_382E[var_5] ) )
            common_scripts\utility::_id_383D( var_5 );
    }
    else if ( !var_1.size )
    {

    }

    var_0 endon( "death" );
    var_6 = 12;
    var_7 = [];
    var_7[var_7.size] = ( 0, 0, 0 );
    var_7[var_7.size] = ( var_6, 0, 0 );
    var_7[var_7.size] = ( var_6 * -1, 0, 0 );
    var_7[var_7.size] = ( 0, var_6, 0 );
    var_7[var_7.size] = ( 0, var_6 * -1, 0 );
    var_7[var_7.size] = ( 0, 0, var_6 );

    for (;;)
    {
        if ( var_4 )
            common_scripts\utility::_id_3831( var_5 );

        var_0 waittill( "trigger", var_8 );

        while ( level._id_0318 _meth_80AB( var_0 ) )
        {
            if ( !var_8 _id_1AF4( var_2, var_7 ) )
            {
                if ( var_4 )
                    common_scripts\utility::_id_3831( var_5 );

                wait 0.1;
                continue;
            }

            if ( var_4 )
                common_scripts\utility::_id_383F( var_5 );

            common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_7C82, "trigger" );
            wait 0.5;
        }
    }
}

_id_1AF4( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _func_08E( self _meth_80AA(), var_0 + var_1[var_2], 1, self ) )
            return 1;
    }

    return 0;
}

_id_9808( var_0 )
{
    var_1 = "not_set";

    if ( isdefined( var_0._id_0398 ) )
        var_1 = var_0._id_0398;

    var_2 = getentarray( var_0._id_04A4, "targetname" );
    var_0 thread _id_9809( var_0._id_04A4 );

    for (;;)
    {
        common_scripts\utility::_id_0D13( var_2, common_scripts\utility::_id_97CC );
        var_0 waittill( "trigger" );
        common_scripts\utility::_id_0D13( var_2, common_scripts\utility::_id_97CE );
        _id_9F87( var_2, var_1 );
        _id_A5A4::_id_0CF4( var_2, "relock" );
    }
}

_id_9809( var_0 )
{
    self waittill( "death" );
    var_1 = getentarray( var_0, "targetname" );
    common_scripts\utility::_id_0D13( var_1, common_scripts\utility::_id_97CC );
}

_id_9F87( var_0, var_1 )
{
    level endon( "unlocked_trigger_hit" + var_1 );
    var_2 = spawnstruct();

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_0[var_3] thread _id_7404( var_2, var_1 );

    var_2 waittill( "trigger" );
    level notify( "unlocked_trigger_hit" + var_1 );
}

_id_7404( var_0, var_1 )
{
    self endon( "relock" );
    level endon( "unlocked_trigger_hit" + var_1 );
    self waittill( "trigger" );
    var_0 notify( "trigger" );
}

_id_975C( var_0 )
{
    var_1 = undefined;

    if ( isdefined( var_0._id_04A4 ) )
    {
        var_2 = getentarray( var_0._id_04A4, "targetname" );

        if ( _func_120( var_2[0].classname, "trigger" ) )
            var_1 = var_2[0];
    }

    if ( isdefined( var_1 ) )
        var_1 waittill( "trigger", var_3 );
    else
        var_0 waittill( "trigger", var_3 );

    var_4 = undefined;

    if ( isdefined( var_1 ) )
    {
        if ( var_3._id_04A7 != level._id_0318._id_04A7 && level._id_0318 _meth_80AB( var_0 ) )
            var_4 = level._id_0318 animscripts\battlechatter::_id_3F38( "custom" );
        else if ( var_3._id_04A7 == level._id_0318._id_04A7 )
        {
            var_5 = "axis";

            if ( level._id_0318._id_04A7 == "axis" )
                var_5 = "allies";

            var_6 = animscripts\battlechatter::_id_40DF( "custom", var_5 );
            var_6 = common_scripts\utility::_id_3CCC( level._id_0318._id_02E2, var_6 );

            foreach ( var_8 in var_6 )
            {
                if ( var_8 _meth_80AB( var_0 ) )
                {
                    var_4 = var_8;

                    if ( _id_1331( var_8._id_02E2 ) )
                        break;
                }
            }
        }
    }
    else if ( _func_1AD( var_3 ) )
        var_4 = var_3 animscripts\battlechatter::_id_3F38( "custom" );
    else
        var_4 = var_3;

    if ( !isdefined( var_4 ) )
        return;

    if ( _id_1331( var_4._id_02E2 ) )
        return;

    var_4 _id_A5A4::_id_2534( var_0._id_795D );
}

_id_1331( var_0 )
{
    return _func_0F0( var_0, level._id_0318 _meth_8097() ) <= 262144;
}

_id_980B( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 thread _id_A5A8::_id_8977();
        wait 0.05;
    }
}

_id_9770( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = getentarray( var_0._id_04A4, "targetname" );
    var_2 = [];
    var_2["left_door"] = -170;
    var_2["right_door"] = 170;

    foreach ( var_4 in var_1 )
    {
        var_5 = var_2[var_4._id_0398];
        var_4 _meth_805A();
        var_4 _meth_82B3( var_5, 1, 0, 0.5 );
    }
}

_id_97A1( var_0 )
{
    var_1 = _func_1D6( var_0._id_04A4 );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    for (;;)
    {
        level waittill( "glass_break", var_2 );

        if ( var_2 _meth_80AB( var_0 ) )
        {
            var_3 = var_2._id_02E2;
            wait 0.05;
            var_4 = var_2._id_02E2;
            var_5 = undefined;

            if ( var_3 != var_4 )
                var_5 = var_4 - var_3;

            if ( isdefined( var_5 ) )
            {
                foreach ( var_7 in var_1 )
                    _func_1D9( var_7, var_5 );

                break;
                continue;
            }

            foreach ( var_7 in var_1 )
                _func_1D9( var_7 );

            break;
        }
    }

    var_0 delete();
}

_id_976C( var_0 )
{
    var_0 waittill( "trigger" );
    var_1 = var_0 _id_3E59();
    common_scripts\utility::_id_0D13( var_1, ::_id_2818 );
}

_id_3E59()
{
    var_0 = [];

    if ( !isdefined( self._id_7A26 ) )
        return var_0;

    var_1 = _func_124( self._id_7A26, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        var_4 = getent( var_3, "script_linkname" );

        if ( isdefined( var_4 ) )
            var_0[var_0.size] = var_4;
    }

    return var_0;
}

_id_2818()
{
    var_0 = _id_3E59();
    common_scripts\utility::_id_0D13( var_0, ::_id_2818 );
    self delete();
}

_id_9804( var_0 )
{
    var_0 endon( "death" );
    var_0 waittill( "trigger" );
    _id_A5A4::_id_933B();
}

_id_97A6( var_0 )
{
    if ( _id_A5A4::_id_5056() )
        return;

    if ( !isdefined( level._id_2B5F ) )
        level._id_2B5F = [];

    waitframe;
    var_1 = var_0._id_7A0F;
    var_0 waittill( "trigger", var_2 );

    if ( isdefined( level._id_2B5F[var_1] ) )
        return;

    level._id_2B5F[var_1] = 1;
    var_2 _id_A5A4::_id_2B4A( var_1 );
}

_id_976D( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_1 ) )
            var_1 delete();
    }
}

_id_9807( var_0 )
{
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::_id_97CC();

    if ( !isdefined( var_0._id_7A26 ) )
        return;

    var_1 = _func_124( var_0._id_7A26, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        common_scripts\utility::_id_0D13( getentarray( var_1[var_2], "script_linkname" ), common_scripts\utility::_id_97CC );
}

_id_97AA( var_0 )
{
    thread _id_97DC( var_0, _id_A5A4::_id_7E5E, _id_A5A4::_id_3DA5 );
}

_id_97D1( var_0 )
{
    thread _id_97DC( var_0, _id_A5A4::_id_7E91, _id_A5A4::_id_3E16 );
}

_id_97DC( var_0, var_1, var_2 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_3 );

        if ( !_func_1A1( var_3 ) )
            continue;

        if ( var_3 [[ var_2 ]]() )
            continue;

        var_3 thread _id_9406( var_0, var_1 );
    }
}

_id_9406( var_0, var_1 )
{
    self endon( "death" );
    self._id_01FF = 1;
    [[ var_1 ]]( 1 );
    self._id_0202 = 1;
    wait 1;
    self._id_0202 = 0;

    while ( self _meth_80AB( var_0 ) )
        wait 1;

    [[ var_1 ]]( 0 );
}

_id_97D8( var_0 )
{
    var_0 waittill( "trigger" );
    _id_A5A4::_id_70BD( var_0._id_0398 );
}

_id_9790( var_0 )
{
    if ( _id_A5A4::_id_500C() )
    {
        thread _id_978F( var_0 );
        return;
    }

    var_1 = var_0 _id_A5A4::_id_3EA3();

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( !_func_1AD( var_2 ) )
            continue;

        var_0 _id_A5A4::_id_0392();
        common_scripts\utility::_id_383F( var_1 );
    }
}

_id_97C5( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 _id_A513::_id_8FCD( var_0._id_03A1, var_0._id_0392 );
        waittillframeend;
    }
}

trigger_multiple_visionset_preh1( var_0 )
{
    var_1 = 0;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;

    if ( isdefined( var_0._id_7B1F ) && isdefined( var_0._id_7B1E ) )
    {
        var_1 = 1;
        var_3 = getent( var_0._id_04A4, "targetname" );

        if ( !isdefined( var_3 ) )
            var_3 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );

        var_4 = getent( var_3._id_04A4, "targetname" );

        if ( !isdefined( var_4 ) )
            var_4 = common_scripts\utility::_id_40FB( var_3._id_04A4, "targetname" );

        var_3 = var_3._id_02E2;
        var_4 = var_4._id_02E2;
        var_2 = _func_0EE( var_3, var_4 );
        var_0 _id_4D75();
    }

    var_5 = -1;

    for (;;)
    {
        var_0 waittill( "trigger", var_6 );

        if ( _func_1AD( var_6 ) )
        {
            if ( var_1 )
            {
                var_7 = 0;

                while ( var_6 _meth_80AB( var_0 ) )
                {
                    var_7 = _id_A5A4::_id_3E3D( var_3, var_4, var_6._id_02E2, var_2 );
                    var_7 = _func_0E9( var_7, 0, 1 );

                    if ( var_7 != var_5 )
                    {
                        var_5 = var_7;
                        var_6 _id_9E6F( var_0, var_7 );
                    }

                    wait 0.05;
                }

                if ( var_7 < 0.5 )
                    var_6 _id_A5A4::_id_9E6E( var_0._id_7B1F, var_0._id_0392 );
                else
                    var_6 _id_A5A4::_id_9E6E( var_0._id_7B1E, var_0._id_0392 );

                continue;
            }

            var_6 _id_A5A4::_id_9E6E( var_0._id_03A1, var_0._id_0392 );
        }
    }
}

_id_97C7( var_0, var_1 )
{
    var_0.visionset_trigger_id = var_0 get_new_visionset_trigger_id();
    var_2 = 0;
    var_3 = 0;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;

    if ( !isdefined( level.default_visionset ) )
        level.default_visionset = level._id_038E;

    if ( !isdefined( level.default_lightset ) )
        level.default_lightset = level._id_038E;

    if ( !isdefined( level.default_clut ) )
        level.default_clut = level._id_038E;

    if ( isdefined( var_0._id_03A1 ) )
    {

    }

    if ( isdefined( var_0._id_0390 ) )
    {

    }

    if ( isdefined( var_0._id_7B1F ) && isdefined( var_0._id_7B1E ) )
    {
        var_3 = 1;
        var_5 = getent( var_0._id_04A4, "targetname" );

        if ( !isdefined( var_5 ) )
            var_5 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );

        var_6 = getent( var_5._id_04A4, "targetname" );

        if ( !isdefined( var_6 ) )
            var_6 = common_scripts\utility::_id_40FB( var_5._id_04A4, "targetname" );

        var_5 = var_5._id_02E2;
        var_6 = var_6._id_02E2;
        var_4 = _func_0EE( var_5, var_6 );
        var_0 _id_4D75();
    }

    for (;;)
    {
        var_0 waittill( "trigger", var_7 );

        if ( var_7 != level._id_0318 )
            continue;

        level._id_0318.current_visionset_trigger_id = var_0.visionset_trigger_id;
        var_8 = -1;

        for (;;)
        {
            if ( level._id_0318 _meth_80AB( var_0 ) )
            {
                if ( !var_2 )
                {
                    var_2 = 1;

                    if ( var_3 )
                    {
                        var_9 = 0;

                        while ( level._id_0318 _meth_80AB( var_0 ) )
                        {
                            var_9 = _id_A5A4::_id_3E3D( var_5, var_6, level._id_0318._id_02E2, var_4 );
                            var_9 = _func_0E9( var_9, 0, 1 );

                            if ( var_9 != var_8 )
                            {
                                var_8 = var_9;
                                level._id_0318 _id_9E6F( var_0, var_9 );
                            }

                            wait 0.05;
                        }
                    }
                    else if ( isdefined( var_0._id_03A1 ) )
                        level._id_0318 _id_A5A4::_id_9E6E( var_0._id_03A1, var_0._id_0392 );

                    if ( isdefined( var_0._id_0395 ) )
                        level._id_0318 _id_A5A4::set_light_set_player( var_0._id_0395 );

                    if ( isdefined( var_0._id_0390 ) )
                        level._id_0318 _meth_848C( var_0._id_0390, var_0._id_0392 );
                }
            }
            else
            {
                if ( var_2 )
                {
                    var_2 = 0;

                    if ( isdefined( var_1 ) && var_1 )
                    {
                        if ( var_3 && can_reset_vision_type( var_0, "visionset" ) )
                        {
                            if ( var_8 < 0.5 )
                                level._id_0318 _id_A5A4::_id_9E6E( var_0._id_7B1F, var_0._id_0392 );
                            else
                                level._id_0318 _id_A5A4::_id_9E6E( var_0._id_7B1E, var_0._id_0392 );
                        }
                        else if ( isdefined( var_0._id_03A1 ) && can_reset_vision_type( var_0, "visionset" ) )
                            level._id_0318 _id_A5A4::_id_9E6E( level.default_visionset, var_0._id_0392 );

                        if ( isdefined( var_0._id_0395 ) && can_reset_vision_type( var_0, "lightset" ) )
                            level._id_0318 _id_A5A4::set_light_set_player( level.default_lightset );

                        if ( isdefined( var_0._id_0390 ) && can_reset_vision_type( var_0, "clut" ) )
                            level._id_0318 _meth_848C( level.default_clut, var_0._id_0392 );
                    }
                }

                break;
            }

            wait 0.05;
        }
    }
}

trigger_multiple_visionset_touch( var_0 )
{
    _id_97C7( var_0, 1 );
}

get_new_visionset_trigger_id()
{
    if ( !isdefined( level.visionset_trigger_count ) )
        level.visionset_trigger_count = 0;

    level.visionset_trigger_count++;
    return level.visionset_trigger_count;
}

get_visionset_trigger( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = getentarray( "trigger_multiple_visionset", "classname" );
    var_1 = common_scripts\utility::_id_0CDD( var_1, getentarray( "trigger_multiple_visionset_touch", "classname" ) );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.visionset_trigger_id ) && var_3.visionset_trigger_id == var_0 )
            return var_3;
    }

    return undefined;
}

can_reset_vision_type( var_0, var_1 )
{
    var_2 = get_visionset_trigger( level._id_0318.current_visionset_trigger_id );

    if ( !isdefined( var_2 ) )
        return 1;

    if ( isdefined( var_2 ) && var_2 == var_0 )
        return 1;

    if ( var_1 == "visionset" )
        return !isdefined( var_2._id_03A1 );
    else if ( var_1 == "lightset" )
        return !isdefined( var_2._id_0395 );
    else if ( var_1 == "clut" )
        return !isdefined( var_2._id_0390 );

    return 0;
}

_id_4D75()
{
    if ( !isdefined( self._id_0392 ) )
        self._id_0392 = 2;

    var_0 = _id_A5A4::_id_3EBF( self._id_7B1F );
    var_1 = _id_A5A4::_id_3EBF( self._id_7B1E );

    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    var_2 = spawnstruct();
    var_2._id_8D08 = var_1._id_8D08 - var_0._id_8D08;
    var_2._id_4500 = var_1._id_4500 - var_0._id_4500;
    var_2._id_7299 = var_1._id_7299 - var_0._id_7299;
    var_2._id_14C5 = var_1._id_14C5 - var_0._id_14C5;
    var_2._id_43D8 = var_1._id_43D8 - var_0._id_43D8;
    var_2._id_4774 = var_1._id_4774 - var_0._id_4774;
    var_2._id_5A47 = var_1._id_5A47 - var_0._id_5A47;
    var_2._id_8FD1 = isdefined( var_0._id_8FD1 ) && var_0._id_8FD1 || isdefined( var_1._id_8FD1 ) && var_1._id_8FD1;
    var_2._id_4776 = var_1._id_4776 - var_0._id_4776;
    var_2._id_85CD = var_1._id_85CD - var_0._id_85CD;
    var_2._id_85CF = var_1._id_85CF - var_0._id_85CF;
    var_2._id_85CE = var_1._id_85CE - var_0._id_85CE;
    var_3 = 0;

    if ( isdefined( var_0._id_8FD9 ) )
        var_3 = var_0._id_8FD9;

    var_4 = 0;

    if ( isdefined( var_1._id_8FD9 ) )
        var_4 = var_1._id_8FD9;

    var_2._id_8FDA = var_3;
    var_2._id_8FD9 = var_4 - var_3;
    var_5 = 0;

    if ( isdefined( var_0._id_8FD2 ) )
        var_5 = var_0._id_8FD2;

    var_6 = 0;

    if ( isdefined( var_1._id_8FD2 ) )
        var_6 = var_1._id_8FD2;

    var_2._id_8FD3 = var_5;
    var_2._id_8FD2 = var_6 - var_5;
    var_7 = 0;

    if ( isdefined( var_0._id_8FBF ) )
        var_7 = var_0._id_8FBF;

    var_8 = 0;

    if ( isdefined( var_1._id_8FBF ) )
        var_8 = var_1._id_8FBF;

    var_2._id_8FC0 = var_7;
    var_2._id_8FBF = var_8 - var_7;
    var_9 = ( 0, 0, 0 );

    if ( isdefined( var_0._id_8FC6 ) )
        var_9 = var_0._id_8FC6;

    var_10 = ( 0, 0, 0 );

    if ( isdefined( var_1._id_8FC6 ) )
        var_10 = var_1._id_8FC6;

    var_2._id_8FC7 = var_9;
    var_2._id_8FC6 = var_10 - var_9;
    var_11 = 0;

    if ( isdefined( var_0._id_8FBD ) )
        var_11 = var_0._id_8FBD;

    var_12 = 0;

    if ( isdefined( var_1._id_8FBD ) )
        var_12 = var_1._id_8FBD;

    var_2._id_8FBE = var_11;
    var_2._id_8FBD = var_12 - var_11;
    var_13 = 0;

    if ( isdefined( var_0._id_8FC9 ) )
        var_13 = var_0._id_8FC9;

    var_14 = 0;

    if ( isdefined( var_1._id_8FC9 ) )
        var_14 = var_1._id_8FC9;

    var_2._id_8FCA = var_13;
    var_2._id_8FC9 = var_14 - var_13;
    var_15 = 0;

    if ( isdefined( var_0._id_615E ) )
        var_15 = var_0._id_615E;

    var_16 = 0;

    if ( isdefined( var_1._id_615E ) )
        var_16 = var_1._id_615E;

    var_2._id_615F = var_15;
    var_2._id_615E = var_16 - var_15;

    if ( isdefined( var_0._id_0DB4 ) && isdefined( var_1._id_0DB4 ) )
    {
        var_2._id_0DB4 = var_0._id_0DB4;
        var_2._id_0DC4 = var_1._id_0DC4 - var_0._id_0DC4;
        var_2._id_0DB7 = var_1._id_0DB7 - var_0._id_0DB7;
        var_2._id_0DB9 = var_1._id_0DB9 - var_0._id_0DB9;
        var_2._id_0DB8 = var_1._id_0DB8 - var_0._id_0DB8;
        var_2._id_0DB5 = var_1._id_0DB5 - var_0._id_0DB5;
        var_2._id_0DBD = var_1._id_0DBD - var_0._id_0DBD;
        var_2._id_0DB6 = var_1._id_0DB6 - var_0._id_0DB6;
        var_2._id_0DC2 = var_1._id_0DC2 - var_0._id_0DC2;
        var_2._id_0DB3 = var_1._id_0DB3 - var_0._id_0DB3;
        var_2._id_0DBF = var_1._id_0DBF - var_0._id_0DBF;
        var_2._id_0DBE = var_1._id_0DBE - var_0._id_0DBE;
        var_2._id_0DC1 = var_1._id_0DC1 - var_0._id_0DC1;
        var_2._id_0DC0 = var_1._id_0DC0 - var_0._id_0DC0;
        var_2._id_0DC3 = var_1._id_0DC3 - var_0._id_0DC3;
        var_2._id_0DBB = var_1._id_0DBB - var_0._id_0DBB;
        var_2._id_0DBA = var_1._id_0DBA - var_0._id_0DBA;
        var_2._id_0DBC = var_1._id_0DBC - var_0._id_0DBC;
    }

    self._id_9E7B = var_2;
}

_id_9E6F( var_0, var_1 )
{
    _id_A5A4::_id_4D57();
    var_0 _id_4D75();

    if ( var_1 < 0.5 )
        self._id_9E72._id_9E6B = var_0._id_7B1F;
    else
        self._id_9E72._id_9E6B = var_0._id_7B1E;

    self._id_9E72._id_04B7 = 0;

    if ( var_0._id_7B1F == var_0._id_7B1E )
        return;

    level._id_58BC = var_0._id_7B1E;

    if ( !level._id_9E5C )
        self _meth_80C6( var_0._id_7B1F, var_0._id_7B1E, var_1 );

    var_2 = _id_A5A4::_id_3EBF( var_0._id_7B1F );
    var_3 = _id_A5A4::_id_3EBF( var_0._id_7B1E );
    var_4 = var_0._id_9E7B;
    var_5 = spawnstruct();
    var_5._id_8D08 = var_2._id_8D08 + var_4._id_8D08 * var_1;
    var_5._id_4500 = var_2._id_4500 + var_4._id_4500 * var_1;
    var_5._id_4500 = _func_0E1( 1, var_5._id_4500 );
    var_5._id_7299 = var_2._id_7299 + var_4._id_7299 * var_1;
    var_5._id_43D8 = var_2._id_43D8 + var_4._id_43D8 * var_1;
    var_5._id_14C5 = var_2._id_14C5 + var_4._id_14C5 * var_1;
    var_5._id_4774 = var_2._id_4774 + var_4._id_4774 * var_1;
    var_5._id_5A47 = var_2._id_5A47 + var_4._id_5A47 * var_1;
    var_5._id_85CD = var_2._id_85CD + var_4._id_85CD * var_1;
    var_5._id_85CF = var_2._id_85CF + var_4._id_85CF * var_1;
    var_5._id_85CE = var_2._id_85CE + var_4._id_85CE * var_1;

    if ( var_4._id_8FD1 )
    {
        var_5._id_8FD1 = 1;
        var_5._id_8FD9 = var_4._id_8FDA + var_4._id_8FD9 * var_1;
        var_5._id_8FD2 = var_4._id_8FD3 + var_4._id_8FD2 * var_1;
        var_5._id_8FBF = var_4._id_8FC0 + var_4._id_8FBF * var_1;
        var_5._id_4776 = var_2._id_4776 + var_4._id_4776 * var_1;
        var_5._id_8FC6 = var_4._id_8FC7 + var_4._id_8FC6 * var_1;
        var_5._id_8FBD = var_4._id_8FBE + var_4._id_8FBD * var_1;
        var_5._id_8FC9 = var_4._id_8FCA + var_4._id_8FC9 * var_1;
        var_5._id_615E = var_4._id_615F + var_4._id_615E * var_1;
    }

    if ( isdefined( var_4._id_0DB4 ) )
    {
        var_5._id_0DB4 = var_4._id_0DB4;
        var_5._id_0DC4 = var_2._id_0DC4 + var_4._id_0DC4 * var_1;
        var_5._id_0DB7 = var_2._id_0DB7 + var_4._id_0DB7 * var_1;
        var_5._id_0DB9 = var_2._id_0DB9 + var_4._id_0DB9 * var_1;
        var_5._id_0DB8 = var_2._id_0DB8 + var_4._id_0DB8 * var_1;
        var_5._id_0DB5 = var_2._id_0DB5 + var_4._id_0DB5 * var_1;
        var_5._id_0DBD = var_2._id_0DBD + var_4._id_0DBD * var_1;
        var_5._id_0DB6 = var_2._id_0DB6 + var_4._id_0DB6 * var_1;
        var_5._id_0DC2 = var_2._id_0DC2 + var_4._id_0DC2 * var_1;
        var_5._id_0DB3 = var_2._id_0DB3 + var_4._id_0DB3 * var_1;
        var_5._id_0DBF = var_2._id_0DBF + var_4._id_0DBF * var_1;
        var_5._id_0DBE = _func_0BC( var_2._id_0DBE + var_4._id_0DBE * var_1 );
        var_5._id_0DC1 = var_2._id_0DC1 + var_4._id_0DC1 * var_1;
        var_5._id_0DC0 = var_2._id_0DC0 + var_4._id_0DC0 * var_1;
        var_5._id_0DC3 = var_2._id_0DC3 + var_4._id_0DC3 * var_1;
        var_5._id_0DBB = _func_0BC( var_2._id_0DBB + var_4._id_0DBB * var_1 );
        var_5._id_0DBA = var_2._id_0DBA + var_4._id_0DBA * var_1;
        var_5._id_0DBC = var_2._id_0DBC + var_4._id_0DBC * var_1;
    }

    common_scripts\utility::_id_7E36( var_5, 0.05 );
}

_id_9799( var_0 )
{
    if ( isdefined( var_0._id_79E1 ) && isdefined( var_0._id_79E0 ) )
    {
        trigger_fog_preh1( var_0 );
        return;
    }

    var_1 = getent( var_0._id_04A4, "targetname" );
    var_2 = var_1._id_02E2;
    var_3 = undefined;

    if ( isdefined( var_1._id_04A4 ) )
    {
        var_4 = getent( var_1._id_04A4, "targetname" );
        var_3 = var_4._id_02E2;
    }
    else
        var_3 = var_2 + common_scripts\utility::vectorscale( var_0._id_02E2 - var_2, 2 );

    var_5 = _func_0EE( var_2, var_3 );

    for (;;)
    {
        var_0 waittill( "trigger", var_6 );
        var_7 = undefined;

        while ( level._id_0318 _meth_80AB( var_0 ) )
        {
            var_7 = _id_A5A4::_id_3E3D( var_2, var_3, level._id_0318._id_02E2, var_5 );

            if ( var_7 < 0 )
                var_7 = 0;

            if ( var_7 > 1 )
                var_7 = 1;

            var_0 _id_A513::_id_7E35( var_7 );
            wait 0.05;
        }

        if ( var_7 > 0.5 )
            var_7 = 1;
        else
            var_7 = 0;

        var_0 _id_A513::_id_7E35( var_7 );
    }
}

trigger_fog_preh1( var_0 )
{
    waitframe;
    var_1 = var_0._id_79E1;
    var_2 = var_0._id_79E0;
    var_0._id_8FD0 = 0;

    if ( isdefined( var_1 ) && isdefined( var_2 ) )
    {
        var_3 = _id_A5A4::_id_3D76( var_1 );
        var_4 = _id_A5A4::_id_3D76( var_2 );
        var_0._id_8FD0 = isdefined( var_3._id_8FD9 ) || isdefined( var_4._id_8FD9 );
        var_0._id_8C15 = var_3._id_8D08;
        var_0._id_8BA2 = var_3._id_4500;
        var_0._id_8B66 = ( var_3._id_7299, var_3._id_43D8, var_3._id_14C5 );
        var_0._id_8BD0 = var_3._id_4774;
        var_0._id_8C1F = var_3._id_5A47;
        var_0._id_8C94 = var_3._id_85CD;
        var_0._id_8C96 = var_3._id_85CF;
        var_0._id_8C95 = var_3._id_85CE;

        if ( isdefined( var_3._id_8FD9 ) )
        {
            var_0._id_8CB2 = ( var_3._id_8FD9, var_3._id_8FD2, var_3._id_8FBF );
            var_0._id_8BD1 = var_3._id_4776;
            var_0._id_8CB3 = var_3._id_8FC6;
            var_0._id_8CB1 = var_3._id_8FBD;
            var_0._id_8CB4 = var_3._id_8FC9;
            var_0._id_8CB5 = var_3._id_615E;
        }
        else if ( var_0._id_8FD0 )
        {
            var_0._id_8CB2 = var_0._id_8B66;
            var_0._id_8BD1 = 1;
            var_0._id_8CB3 = ( 0, 0, 0 );
            var_0._id_8CB1 = 0;
            var_0._id_8CB4 = 90;
            var_0._id_8CB5 = 1;
        }

        var_0._id_313B = var_4._id_8D08;
        var_0._id_3130 = var_4._id_4500;
        var_0._id_3124 = ( var_4._id_7299, var_4._id_43D8, var_4._id_14C5 );
        var_0._id_3135 = var_4._id_4774;
        var_0._id_313C = var_4._id_5A47;
        var_0._id_3144 = var_4._id_85CD;
        var_0._id_3146 = var_4._id_85CF;
        var_0._id_3145 = var_4._id_85CE;

        if ( isdefined( var_4._id_8FD9 ) )
        {
            var_0._id_314C = ( var_4._id_8FD9, var_4._id_8FD2, var_4._id_8FBF );
            var_0._id_3136 = var_4._id_4776;
            var_0._id_314D = var_4._id_8FC6;
            var_0._id_314B = var_4._id_8FBD;
            var_0._id_314E = var_4._id_8FC9;
            var_0._id_314F = var_4._id_615E;
        }
        else if ( var_0._id_8FD0 )
        {
            var_0._id_314C = var_0._id_3124;
            var_0._id_3136 = 1;
            var_0._id_314D = ( 0, 0, 0 );
            var_0._id_314B = 0;
            var_0._id_314E = 90;
            var_0._id_314F = 1;
        }
    }

    var_5 = getent( var_0._id_04A4, "targetname" );
    var_6 = var_5._id_02E2;
    var_7 = undefined;

    if ( isdefined( var_5._id_04A4 ) )
    {
        var_8 = getent( var_5._id_04A4, "targetname" );
        var_7 = var_8._id_02E2;
    }
    else
        var_7 = var_6 + ( var_0._id_02E2 - var_6 ) * 2;

    var_9 = _func_0EE( var_6, var_7 );

    for (;;)
    {
        var_0 waittill( "trigger", var_10 );
        var_11 = 0;

        while ( var_10 _meth_80AB( var_0 ) )
        {
            var_11 = _id_A5A4::_id_3E3D( var_6, var_7, var_10._id_02E2, var_9 );
            var_11 = _func_0E9( var_11, 0, 1 );
            var_0 _id_A513::_id_7E35( var_11 );
            wait 0.05;
        }

        if ( var_11 > 0.5 )
            var_11 = 1;
        else
            var_11 = 0;

        var_0 _id_A513::_id_7E35( var_11 );
    }
}

_id_97BF( var_0 )
{
    waitframe;

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_2 = var_0._id_79A7;
        var_3 = var_0._id_79A6;
        var_4 = var_0._id_79A5;
        var_5 = var_0._id_79A4;
        var_6 = var_0._id_79A3;
        var_7 = var_0._id_79A2;
        var_8 = var_0._id_0392;

        if ( var_2 != level._id_2C3D["base"]["goal"]["nearStart"] || var_3 != level._id_2C3D["base"]["goal"]["nearEnd"] || var_4 != level._id_2C3D["base"]["goal"]["nearBlur"] || var_5 != level._id_2C3D["base"]["goal"]["farStart"] || var_6 != level._id_2C3D["base"]["goal"]["farEnd"] || var_7 != level._id_2C3D["base"]["goal"]["farBlur"] )
        {
            _id_A513::_id_2C6C( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
            wait(var_8);
            continue;
        }

        waittillframeend;
    }
}

_id_97C6( var_0 )
{
    if ( level._id_0532 || level._id_0349 )
        return;

    waitframe;

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_2 = var_0._id_7AF0;
        var_3 = var_0._id_7AF1;
        var_4 = var_0._id_0392;

        if ( var_2 != level._id_929A._id_256C || var_3 != level._id_929A._id_256E )
        {
            var_2 = _func_0E1( 0, var_2 );
            var_2 = _func_0BF( 10000, var_2 );
            var_3 = _func_0E1( 0, var_3 );
            var_3 = _func_0BF( 10000, var_3 );
            _id_A513::_id_929C( var_2, var_3, var_4 );
            continue;
        }

        waittillframeend;
    }
}

_id_97F6( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 thread _id_8627( var_0 );
    }
}

_id_8627( var_0 )
{
    if ( isdefined( self._id_9C7E ) )
        return;

    if ( _id_A5A4::_id_51AA() )
        return;

    if ( isdefined( self._id_6C50 ) )
        return;

    self endon( "death" );

    if ( _func_1CA( "SCN_cliffhanger_player_hillslide" ) )
        self _meth_809C( "SCN_cliffhanger_player_hillslide" );

    var_1 = undefined;

    if ( isdefined( var_0._id_7929 ) )
        var_1 = var_0._id_7929;

    self endon( "cancel_sliding" );
    _id_A5A4::_id_139F( undefined, var_1 );

    for (;;)
    {
        if ( !self _meth_80AB( var_0 ) )
            break;

        wait 0.05;
    }

    if ( isdefined( level._id_3147 ) )
        wait(level._id_3147);

    _id_A5A4::_id_31C7();
}

_id_97FF( var_0 )
{
    var_0 waittill( "trigger", var_1 );
}

_id_97C2( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0._id_3B23 = [];

    foreach ( var_3 in level._id_2417 )
        _id_0D64( var_3, var_0, var_1 );

    var_1 delete();

    if ( !isdefined( var_0._id_04A4 ) )
        return;

    var_5 = getentarray( var_0._id_04A4, "targetname" );
    var_0._id_3B76 = 1;

    foreach ( var_7 in var_5 )
    {
        switch ( var_7.classname )
        {
            case "trigger_multiple_fx_volume_on":
                var_7 thread _id_97C1( var_0 );
                continue;
            case "trigger_multiple_fx_volume_off":
                var_7 thread _id_97C0( var_0 );
                continue;
            default:
                continue;
        }
    }
}

_id_97C1( var_0 )
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( !var_0._id_3B76 )
            common_scripts\utility::_id_0D13( var_0._id_3B23, _id_A5A4::_id_748D );

        wait 1;
    }
}

_id_97C0( var_0 )
{
    for (;;)
    {
        self waittill( "trigger" );

        if ( var_0._id_3B76 )
            common_scripts\utility::_id_0D13( var_0._id_3B23, common_scripts\utility::_id_671F );

        wait 1;
    }
}

_id_0D64( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_9C42["soundalias"] ) && var_0._id_9C42["soundalias"] != "nil" )
    {
        if ( !isdefined( var_0._id_9C42["stopable"] ) || !var_0._id_9C42["stopable"] )
            return;
    }

    var_2._id_02E2 = var_0._id_9C42["origin"];

    if ( var_2 _meth_80AB( var_1 ) )
        var_1._id_3B23[var_1._id_3B23.size] = var_0;
}

_id_97BE( var_0 )
{
    var_1 = var_0._id_7A99;

    if ( !isdefined( level._id_5C73 ) )
        level._id_5C73 = "";

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( level._id_5C73 != var_1 )
            _id_A51D::_id_8324( var_1 );
    }
}

_id_97C9( var_0 )
{
    common_scripts\utility::_id_0D13( level._id_0323, ::_id_60F7, var_0 );
}

_id_60F7( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 != self )
            continue;

        while ( var_1 _meth_80AB( var_0 ) )
        {
            var_1 _meth_811C( 0 );
            var_1 _meth_811B( 0 );
            wait 0.05;
        }

        var_1 _meth_811C( 1 );
        var_1 _meth_811B( 1 );
    }
}

_id_97CA( var_0 )
{
    common_scripts\utility::_id_0D13( level._id_0323, ::_id_610B, var_0 );
}

_id_610B( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 != self )
            continue;

        while ( var_1 _meth_80AB( var_0 ) )
        {
            var_1 _meth_811C( 0 );
            wait 0.05;
        }

        var_1 _meth_811C( 1 );
    }
}

_id_980F( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 _id_A5A4::_id_32DC( "in_wake_volume" ) )
        {

        }
        else
            var_1 _id_A5A4::_id_32DD( "in_wake_volume" );

        if ( _func_0F0( var_1._id_02E2, level._id_0318._id_02E2 ) < 9250000 )
        {
            if ( var_1 _id_A5A4::_id_32D8( "in_wake_volume" ) )
                continue;

            var_1 thread _id_9F40( var_0 );
            var_1 _id_A5A4::_id_32DE( "in_wake_volume" );
        }
    }
}

_id_9F40( var_0 )
{
    self endon( "death" );
    var_1 = 200;

    for (;;)
    {
        if ( self _meth_80AB( var_0 ) )
        {
            if ( var_1 > 0 )
                wait(_func_0E1( 1 - var_1 / 120, 0.1 ));
            else
                wait 0.15;

            var_2 = var_0._id_79F1;
            var_3 = ( 0, 0, 0 );

            if ( _func_1AD( self ) )
                var_3 = self _meth_8336();

            if ( _func_0CF( self ) )
                var_3 = self._id_0500;

            var_1 = _func_0EE( var_3, ( 0, 0, 0 ) );

            if ( var_1 < 5 )
                var_2 = "null";

            if ( var_2 != "null" )
            {
                var_4 = _func_114( ( var_3[0], var_3[1], 0 ) );
                var_5 = anglestoforward( _func_115( var_4 ) + ( 270, 180, 0 ) );
                var_6 = self._id_02E2 + ( 0, 0, 64 );
                var_7 = self._id_02E2 - ( 0, 0, 150 );
                var_8 = _func_06B( var_6, var_7, 0, undefined );

                if ( isdefined( var_0._id_7AEB ) )
                {
                    if ( var_8["surfacetype"] != var_0._id_7AEB )
                        continue;
                }

                var_9 = common_scripts\utility::_id_3FA8( var_2 );
                var_6 = var_8["position"] + var_1 / 4 * var_4;

                if ( isdefined( var_0._id_7B0B ) && var_0._id_7B0B == 1 )
                {
                    var_10 = _func_114( _func_0F7( var_8["normal"], _func_0F7( var_4, var_8["normal"] ) ) );

                    if ( var_8["normal"] != ( 0, 0, 0 ) && var_10 != ( 0, 0, 0 ) )
                        playfx( var_9, var_6, var_8["normal"], var_10 );
                }
                else
                    playfx( var_9, var_6, var_5 );
            }

            continue;
        }

        _id_A5A4::_id_32DA( "in_wake_volume" );
        return;
    }
}

_id_978B( var_0 )
{
    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 _id_A5A4::_id_32DC( "in_fallingwater_volume" ) )
        {

        }
        else
            var_1 _id_A5A4::_id_32DD( "in_fallingwater_volume" );

        if ( _func_0F0( var_1._id_02E2, level._id_0318._id_02E2 ) < 6250000 )
        {
            if ( var_1 _id_A5A4::_id_32D8( "in_fallingwater_volume" ) )
                continue;

            var_1 thread _id_9F3E( var_0 );
            var_1 _id_A5A4::_id_32DE( "in_fallingwater_volume" );
        }
    }
}

_id_9F3E( var_0 )
{
    self endon( "death" );
    var_1 = var_0 _meth_821A( 1, 1, 0 );
    var_2 = var_0 _meth_821A( -1, -1, 0 );
    var_3 = ( var_1[0] - var_2[0] ) * ( var_1[1] - var_2[1] );
    var_4 = 3;

    if ( isdefined( var_0._id_79B4 ) )
        var_4 = var_0._id_79B4;

    var_5 = 1;

    if ( isdefined( var_0._id_79DF ) )
        var_5 = var_0._id_79DF;

    var_6 = _func_0BC( var_5 * var_3 / 50 );
    var_7 = "null";

    if ( isdefined( var_0._id_79F1 ) )
        var_7 = var_0._id_79F1;

    var_8 = "null";

    if ( isdefined( var_0._id_7ABE ) )
        var_8 = var_0._id_7ABE;

    var_9 = -1;

    for (;;)
    {
        if ( self _meth_80AB( var_0 ) )
        {
            if ( _func_0CF( self ) )
            {
                wait 0.05;

                for ( var_10 = 0; var_10 < var_6; var_10++ )
                {
                    if ( var_7 != "null" )
                    {
                        var_11 = var_0 _meth_821A( _func_0B3( 2 ) - 1, _func_0B3( 2 ) - 1, 1 );
                        var_12 = ( var_11[0], var_11[1], self._id_02E2[2] );

                        if ( _func_225( var_12, self._id_02E2 ) < 900 )
                        {
                            var_13 = _func_06B( var_11, var_12, 1, undefined, 0, 1 );

                            if ( isdefined( var_13["entity"] ) && var_13["entity"] == self )
                            {
                                var_14 = common_scripts\utility::_id_3FA8( var_7 );
                                var_11 = var_13["position"];
                                var_15 = _func_115( var_13["normal"] + ( 90, 0, 0 ) );
                                var_16 = anglestoforward( var_15 );
                                var_17 = anglestoup( var_15 );
                                playfx( var_14, var_11, var_17, var_16 );
                            }
                        }
                    }
                }
            }

            if ( _func_1AD( self ) )
            {
                wait 0.05;
                var_9 += 0.05;

                if ( var_9 > var_4 * 0.2 || var_9 < 0 )
                {
                    self _meth_821C( 1, var_4 );
                    var_9 = 0;
                }

                if ( !isdefined( level._id_301F ) )
                {
                    if ( var_8 != "null" )
                        _id_89A8( var_8, ( 500, 0, 0 ), ( 180, 0, 0 ) );
                }
            }

            continue;
        }

        _id_A5A4::_id_32DA( "in_fallingwater_volume" );

        if ( var_8 != "null" )
            _id_8EE3( var_8 );

        return;
    }
}

_id_89A8( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    var_3 = common_scripts\utility::_id_3FA8( var_0 );
    level._id_301F = common_scripts\utility::_id_8959();
    level._id_301F _meth_80A8( level._id_0318, "tag_origin", var_1, var_2, 1 );
    level._id_301E = playfxontag( var_3, level._id_301F, "tag_origin" );
}

_id_8EE3( var_0, var_1 )
{
    if ( isdefined( level._id_301F ) )
    {
        if ( isdefined( level._id_301E ) )
        {
            if ( var_1 )
                killfxontag( common_scripts\utility::_id_3FA8( var_0 ), level._id_301F, "tag_origin" );
            else
                stopfxontag( common_scripts\utility::_id_3FA8( var_0 ), level._id_301F, "tag_origin" );
        }

        level._id_301F delete();
    }
}

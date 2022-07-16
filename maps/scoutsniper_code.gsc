// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

updatefog()
{
    var_0 = getent( "trigger_fogdist3000", "targetname" );
    var_1 = getent( "trigger_fogdist5000", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        _func_182( 0, 3000, 0.33, 0.39, 0.545313, 1, 1 );
        var_1 waittill( "trigger" );
        _func_182( 0, 8000, 0.33, 0.39, 0.545313, 1, 1 );
    }
}

execvehiclestealthdetection()
{
    thread _id_A5A8::_id_5BD2();
    self endon( "death" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "_stealth_spotted" );
        thread vehicle_turret_think();
        common_scripts\utility::_id_3857( "_stealth_spotted" );
        self notify( "nolonger_spotted" );
    }
}

bmp_field_start_running_detection()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "field_start_running" );
    var_0 = 200;

    for (;;)
    {
        switch ( level._id_0318 _meth_8180() )
        {
            case "prone":
                var_0 = 200;
                break;
            case "crouch":
                var_0 = 400;
                break;
            case "stand":
            default:
                var_0 = 600;
                break;
        }

        if ( _func_0F0( self._id_02E2, level._id_0318._id_02E2 ) < var_0 * var_0 )
        {
            common_scripts\utility::_id_383F( "_stealth_spotted" );
            common_scripts\utility::_id_3857( "_stealth_spotted" );
        }

        wait 0.05;
    }
}

_id_8E78()
{
    self endon( "start_dynamic_run_speed" );
    self endon( "death" );
    _id_8E79();
    self._id_5F65 = 1;
    _id_A5A4::_id_1ED1();
    self notify( "stop_loop" );
    _id_A5A4::_id_32DA( "dynamic_run_speed_stopping" );
    _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
}

_id_8E79()
{
    level endon( "_stealth_spotted" );
    self waittill( "stop_dynamic_run_speed" );
}

dynamic_run_speed( var_0, var_1 )
{
    self endon( "death" );
    self notify( "start_dynamic_run_speed" );
    self endon( "start_dynamic_run_speed" );
    self endon( "stop_dynamic_run_speed" );
    level endon( "_stealth_spotted" );
    _id_A5A4::_id_32E4( "_stealth_custom_anim" );

    if ( !isdefined( self._id_32D8["dynamic_run_speed_stopped"] ) )
    {
        _id_A5A4::_id_32DD( "dynamic_run_speed_stopped" );
        _id_A5A4::_id_32DD( "dynamic_run_speed_stopping" );
    }
    else
    {
        _id_A5A4::_id_32DA( "dynamic_run_speed_stopping" );
        _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
    }

    self._id_76B8 = "";
    thread _id_8E78();

    if ( !isdefined( var_0 ) )
        var_0 = 250;

    if ( !isdefined( var_1 ) )
        var_1 = var_0 * 0.5;

    for (;;)
    {
        wait 0.05;
        var_2 = anglestoforward( self.angles );
        var_3 = _func_114( level._id_0318._id_02E2 - self._id_02E2 );
        var_4 = _func_0F6( var_2, var_3 );
        var_5 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );
        var_6 = 0;

        if ( isdefined( self._id_5557 ) )
            var_6 = _id_2FE1( self._id_5557, var_1 );
        else if ( isdefined( self._id_5558 ) )
            var_6 = _id_2FE1( self._id_5558, var_1 );

        if ( isdefined( self._id_22E0 ) && self._id_22E0 )
            self._id_5F65 = 1;

        var_7 = isdefined( self._id_9735 );

        if ( var_7 )
        {
            _id_2FE2( "traverse" );
            continue;
            continue;
        }

        if ( var_5 < var_1 || var_4 > -0.25 || var_6 )
        {
            _id_2FE2( "sprint" );
            continue;
            continue;
        }

        if ( var_5 < var_0 || var_4 > -0.25 )
        {
            _id_2FE2( "run" );
            continue;
            continue;
        }

        if ( var_5 > var_0 * 2 )
        {
            _id_2FE2( "stop" );
            continue;
            continue;
        }

        if ( var_5 > var_0 * 1.25 )
        {
            _id_2FE2( "jog" );
            continue;
        }
    }
}

_id_2FE1( var_0, var_1 )
{
    if ( !isdefined( var_0.classname ) )
        var_2 = ::follow_path_get_node;
    else
        var_2 = ::follow_path_get_ent;

    return wait_for_player( var_0, var_2, var_1 );
}

_id_2FE2( var_0 )
{
    if ( self._id_76B8 == var_0 )
        return;

    self._id_76B8 = var_0;

    switch ( var_0 )
    {
        case "sprint":
            if ( isdefined( self._id_22E0 ) && self._id_22E0 )
            {
                self._id_5F65 = 1;
                _id_A5A4::_id_7E45( "sprint", 1, 0 );
            }
            else
            {
                self._id_5F65 = 0.92;
                _id_A5A4::_id_7E45( "sprint_h1", 1, 0 );
            }

            self notify( "stop_loop" );
            self _meth_8143();
            _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
            break;
        case "run":
            self._id_5F65 = 1;
            _id_A5A4::_id_1ED1();
            self notify( "stop_loop" );
            self _meth_8143();
            _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
            break;
        case "stop":
            thread _id_2FE5();
            break;
        case "jog":
            self._id_5F65 = 1;
            _id_A5A4::_id_7E45( "combat_jog", 1, 0 );
            self notify( "stop_loop" );
            self _meth_8143();
            _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
            break;
        case "traverse":
            self._id_5F65 = 1;
            self notify( "stop_loop" );
            self _meth_8143();
            _id_A5A4::_id_32DA( "dynamic_run_speed_stopped" );
            break;
    }
}

_id_2FE5()
{
    self endon( "death" );

    if ( _id_A5A4::_id_32D8( "dynamic_run_speed_stopped" ) )
        return;

    if ( _id_A5A4::_id_32D8( "dynamic_run_speed_stopping" ) )
        return;

    self endon( "stop_dynamic_run_speed" );
    _id_A5A4::_id_32DE( "dynamic_run_speed_stopping" );
    _id_A5A4::_id_32DE( "dynamic_run_speed_stopped" );
    self endon( "dynamic_run_speed_stopped" );
    _id_A5A4::_id_32E4( "_stealth_stance_handler" );
    var_0 = "run_2_stop";
    _id_A510::_id_0BCA( self, "gravity", var_0 );
    _id_A5A4::_id_32DA( "dynamic_run_speed_stopping" );

    while ( _id_A5A4::_id_32D8( "dynamic_run_speed_stopped" ) )
    {
        _id_A5A4::_id_32E4( "_stealth_stance_handler" );
        var_1 = "combat_idle";
        thread _id_A510::_id_0BCE( self, var_1, undefined, "stop_loop" );
        wait(_func_0B5( 12, 20 ));
        _id_A5A4::_id_32E4( "_stealth_stance_handler" );
        self notify( "stop_loop" );

        if ( !_id_A5A4::_id_32D8( "dynamic_run_speed_stopped" ) )
            return;

        switch ( _func_0B2( 6 ) )
        {
            case 0:
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_letsgo" );
                break;
            case 1:
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_letsgo2" );
                break;
            case 2:
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_moveup" );
                break;
            case 3:
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_moveout" );
                break;
            case 4:
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_followme2" );
                break;
            case 5:
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_onme" );
                break;
        }

        var_2 = "moveup_exposed";
        _id_A510::_id_0BC9( self, var_2 );
    }
}

follow_path_get_node( var_0, var_1 )
{
    return _func_0C4( var_0, var_1 );
}

follow_path_get_ent( var_0, var_1 )
{
    return getentarray( var_0, var_1 );
}

follow_path_set_node( var_0 )
{
    _id_A5A4::_id_7E4B( var_0 );
    self notify( "follow_path_new_goal" );
}

follow_path_set_ent( var_0 )
{
    _id_A5A4::_id_7E47( var_0 );
    self notify( "follow_path_new_goal" );
}

scoutsniper_follow_path( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "stop_path" );
    self notify( "follow_path" );
    self endon( "follow_path" );
    wait 0.1;
    var_3 = var_0;
    var_4 = undefined;
    var_5 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 300;

    if ( !isdefined( var_3.classname ) )
    {
        var_4 = ::follow_path_get_node;
        var_5 = ::follow_path_set_node;
    }
    else
    {
        var_4 = ::follow_path_get_ent;
        var_5 = ::follow_path_set_ent;
    }

    while ( isdefined( var_3 ) )
    {
        if ( isdefined( var_3._id_0351 ) && var_3._id_0351 != 0 )
            self._id_01C4 = var_3._id_0351;

        if ( self._id_01C4 < 16 )
            self._id_01C4 = 16;

        if ( isdefined( var_3._id_01E8 ) && var_3._id_01E8 != 0 )
            self._id_01C2 = var_3._id_01E8;

        self [[ var_5 ]]( var_3 );
        var_6 = self._id_01C4;

        for (;;)
        {
            self waittill( "goal" );

            if ( _func_0EE( var_3._id_02E2, self._id_02E2 ) < var_6 + 10 )
                break;
        }

        if ( isdefined( var_2 ) && var_2 > 0 )
            wait(var_2);

        var_3 notify( "trigger", self );

        if ( isdefined( var_3._id_79D3 ) )
            common_scripts\utility::_id_383F( var_3._id_79D3 );

        if ( isdefined( var_3._id_7AB7 ) )
        {
            while ( _func_1A1( level._id_0318 ) )
            {
                if ( wait_for_player( var_3, var_4, var_1 ) )
                    break;

                wait 0.05;
            }
        }

        if ( !isdefined( var_3._id_04A4 ) )
            break;

        var_3 _id_A5A4::_id_0392();
        var_3 = [[ var_4 ]]( var_3._id_04A4, "targetname" );
        var_3 = var_3[_func_0B2( var_3.size )];
    }

    self notify( "scoutsniper_path_end_reached" );
}

wait_for_player( var_0, var_1, var_2 )
{
    if ( _func_0EE( level._id_0318._id_02E2, var_0._id_02E2 ) < _func_0EE( self._id_02E2, var_0._id_02E2 ) )
        return 1;

    var_3 = undefined;
    var_3 = anglestoforward( self.angles );
    var_4 = _func_114( level._id_0318._id_02E2 - self._id_02E2 );

    if ( isdefined( var_0._id_04A4 ) )
    {
        var_5 = [[ var_1 ]]( var_0._id_04A4, "targetname" );

        if ( var_5.size == 1 )
            var_3 = _func_114( var_5[0]._id_02E2 - var_0._id_02E2 );
        else
            var_3 = anglestoforward( var_0.angles );
    }
    else
        var_3 = anglestoforward( var_0.angles );

    if ( _func_0F6( var_3, var_4 ) > 0 )
        return 1;

    if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) < var_2 )
        return 1;

    return 0;
}

crawl_path( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = var_0;

    if ( !isdefined( var_1 ) )
        var_1 = 300;

    while ( isdefined( var_3 ) )
    {
        var_4 = 48;

        if ( isdefined( var_3._id_0351 ) && var_3._id_0351 != 0 )
            var_4 = var_3._id_0351;

        if ( var_3 == var_0 )
        {
            if ( isdefined( var_2 ) && var_2 == 1 )
            {
                var_5 = var_3._id_02E2 - self._id_02E2;
                var_6 = _func_115( var_5 );
                self.ref_node._id_02E2 = self._id_02E2;
                self.ref_node.angles = var_6;
                self.crawl_ref_node = var_3;
                thread crawl_anim( 1 );

                while ( _func_0EE( self._id_02E2, var_3._id_02E2 ) > var_4 )
                    wait 0.05;
            }
            else
            {
                self _meth_81AA( var_3._id_02E2 );
                self._id_01C4 = 16;
                self waittill( "goal" );
                self _meth_81CE( "prone" );
                var_7 = getent( var_3._id_04A4, "targetname" );
                var_5 = var_7._id_02E2 - self._id_02E2;
                var_6 = _func_115( var_5 );
                self.ref_node._id_02E2 = self._id_02E2;
                self.ref_node.angles = var_6;
                self.ref_node _id_A510::_id_0BC9( self, "stand2prone" );
                self.crawl_ref_node = var_7;
                thread crawl_anim();
            }
        }
        else
        {
            while ( _func_0EE( self._id_02E2, var_3._id_02E2 ) > var_4 )
                wait 0.05;
        }

        var_3 notify( "trigger", self );

        if ( !isdefined( var_3._id_04A4 ) )
            break;

        var_3 = getent( var_3._id_04A4, "targetname" );
        self.crawl_ref_node = var_3;
    }

    self notify( "stop_crawl_anim" );
    self notify( "stop_animmode" );
    self.ref_node notify( "stop_animmode" );
    self _meth_8143();
    self notify( "scoutsniper_path_end_reached" );
    thread _id_A510::_id_0BCE( self, "prone_idle_under_truck", undefined, "stop_loop" );
}

crawl_anim( var_0 )
{
    self notify( "crawl_anim" );
    self endon( "crawl_anim" );
    self endon( "stop_crawl_anim" );
    self endon( "death" );
    thread crawl_anim_stop();
    thread crawl_anim_rotate();
    var_1 = self.crawl_ref_node;
    self.ref_node._id_02E2 = self._id_02E2;

    if ( !isdefined( var_0 ) || var_0 == 0 )
        self.ref_node _id_A510::_id_0BC9( self, "prone2crawl" );

    var_2 = "crawl_loop";

    for (;;)
    {
        var_1 = self.crawl_ref_node;
        self.ref_node._id_02E2 = self._id_02E2;
        self.ref_node _id_A510::_id_0BC9( self, var_2 );
    }
}

crawl_anim_rotate()
{
    self endon( "crawl_anim" );
    self endon( "stop_crawl_anim" );
    self endon( "death" );

    for (;;)
    {
        var_0 = self.crawl_ref_node;
        var_1 = var_0._id_02E2 - self._id_02E2;
        var_2 = _func_115( var_1 );
        self.ref_node _meth_82B1( var_2, 0.25 );
        wait 0.25;
    }
}

crawl_anim_stop()
{
    self endon( "crawl_anim" );
    self waittill( "stop_crawl_anim" );
    self _meth_81AA( self._id_02E2 );
}

node_have_delay()
{
    if ( !isdefined( self._id_04A4 ) )
        return 1;

    if ( isdefined( self._id_0392 ) && self._id_0392 > 0 )
        return 1;

    if ( isdefined( self._id_798D ) && self._id_798D > 0 )
        return 1;

    return 0;
}

disablearrivals_delayed()
{
    self endon( "death" );
    self endon( "goal" );
    wait 0.5;
    self._id_2AF3 = 1;
}

delete_on_unloaded()
{
    self endon( "death" );
    self waittill( "jumpedout" );
    wait 0.5;
    self delete();
}

fly_path( var_0 )
{
    self notify( "stop_path" );
    self endon( "stop_path" );
    self endon( "death" );

    if ( !isdefined( var_0 ) )
        var_0 = common_scripts\utility::_id_40FB( self._id_04A4, "targetname" );

    self _meth_8256( 512 );

    if ( !isdefined( var_0._id_03E2 ) )
        fly_path_set_speed( 30, 1 );

    for (;;)
    {
        fly_to( var_0 );

        if ( !isdefined( var_0._id_04A4 ) )
            break;

        var_0 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );
    }
}

fly_to( var_0 )
{
    fly_path_set_speed( var_0._id_03E2 );

    if ( isdefined( var_0._id_0351 ) )
        self _meth_8256( var_0._id_0351 );
    else
        self _meth_8256( 512 );

    var_1 = 0;

    if ( isdefined( var_0._id_0392 ) || isdefined( var_0._id_798E ) )
        var_1 = 1;

    if ( isdefined( var_0._id_7B06 ) )
    {
        var_1 = 1;
        var_0 = unload_struct_adjustment( var_0 );
        thread unload_helicopter();
    }

    if ( isdefined( var_0.angles ) )
    {
        if ( var_1 )
            self _meth_8258( var_0.angles[1] );
        else
            self _meth_825A( var_0.angles[1] );
    }
    else
        self _meth_825B();

    self _meth_8257( var_0._id_02E2 + ( 0, 0, self._id_65A7 ), var_1 );
    common_scripts\utility::_id_A069( "near_goal", "goal" );
    var_0 notify( "trigger", self );
    common_scripts\utility::_id_3857( "helicopter_unloading" );

    if ( var_1 )
        var_0 _id_A5A4::_id_0392();

    if ( isdefined( var_0._id_0398 ) && var_0._id_0398 == "delete_helicopter" )
        self delete();
}

fly_path_set_speed( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        var_2 = 20;

        if ( var_2 < var_0 / 2.5 )
            var_2 = var_0 / 2.5;

        var_3 = var_2;
        var_4 = self _meth_8282();

        if ( var_4 > var_2 )
            var_3 = var_4;

        if ( isdefined( var_1 ) )
            self _meth_8280( var_0, var_2, var_3 );
        else
            self _meth_827F( var_0, var_2, var_3 );
    }
}

unload_helicopter()
{
    self endon( "stop_path" );
    common_scripts\utility::_id_383F( "helicopter_unloading" );
    self _meth_824F( 0, 0, 0 );
    self waittill( "goal" );
    self notify( "unload", "both" );
    wait 12;
    common_scripts\utility::_id_3831( "helicopter_unloading" );
    self _meth_824F( 128, 10, 3 );
}

unload_struct_adjustment( var_0 )
{
    var_1 = _func_08F( var_0._id_02E2, var_0._id_02E2 + ( 0, 0, -10000 ) );
    var_0._id_02E2 = var_1 + ( 0, 0, self._id_367F );
    return var_0;
}

dialogprint( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) && var_2 > 0 )
        wait(var_2);

    iprintln( var_0 );

    if ( isdefined( var_1 ) && var_1 > 0 )
        wait(var_1);
}

scripted_spawn2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_4 = var_3 _meth_8096( 1 );
    else
        var_4 = var_3 _meth_8095( 1 );

    _id_A5A4::_id_88F1( var_4 );
    var_4 thread alert_on_grenade_body_impact();
    return var_4;
}

alert_on_grenade_body_impact()
{
    self endon( "death" );
    self endon( "event_awareness" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

    if ( var_4 == "MOD_IMPACT" )
        maps\_stealth_logic::_id_31D8( "alerted_again", var_1 );
}

scripted_array_spawn( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_4[var_5] = scripted_spawn2( var_0, var_1, var_2, var_3[var_5] );

    return var_4;
}

vehicle_turret_think()
{
    self endon( "nolonger_spotted" );
    self endon( "death" );
    self endon( "c4_detonation" );
    thread _id_A5A8::_id_5BD2();
    self.turretfiring = 0;
    var_0 = undefined;
    var_1 = [];
    var_1[0] = level._id_6F7C;
    var_2 = undefined;

    for (;;)
    {
        wait 0.05;

        if ( isdefined( var_0 ) && _func_1AD( var_0 ) )
        {
            var_3 = 0;
            var_3 = _func_08E( self._id_02E2, level._id_0318._id_02E2 + ( 0, 0, 150 ), 0, self );

            if ( !var_3 )
                var_0 = vehicle_get_target( var_1 );
        }
        else
            var_0 = vehicle_get_target( var_1 );

        if ( isdefined( var_0 ) && _func_1A1( var_0 ) )
        {
            var_4 = var_0._id_02E2 + ( 0, 0, 32 );
            self _meth_825D( var_4 );

            if ( getdvar( "debug_bmp" ) == "1" )
                thread _id_A5A4::_id_2DBF( self._id_02E2 + ( 0, 0, 32 ), var_4, 1, 0, 0, self, "stop_drawing_line" );

            var_5 = _func_0B5( 1, 1.5 );
            common_scripts\utility::_id_A0A0( "turret_rotate_stopped", var_5 );

            if ( isdefined( var_0 ) && _func_1A1( var_0 ) )
            {
                if ( _func_0F0( var_0._id_02E2, self._id_02E2 ) <= level.bmpmgrangesquared )
                {
                    if ( !self._id_5BD5[0] _meth_80E6() )
                        thread _id_A5A8::_id_5BD3();

                    wait 0.25;

                    if ( !self._id_5BD5[0] _meth_80E6() )
                    {
                        thread _id_A5A8::_id_5BD2();

                        if ( !self.turretfiring )
                            thread vehicle_fire_main_cannon();
                    }
                }
                else
                {
                    thread _id_A5A8::_id_5BD2();

                    if ( !self.turretfiring )
                        thread vehicle_fire_main_cannon();
                }
            }
        }

        if ( getdvar( "debug_bmp" ) == "1" )
            self notify( "stop_drawing_line" );
    }
}

vehicle_get_target( var_0 )
{
    var_1 = _id_A53F::_id_3F7F( level.bmpcannonrange, level._id_2235["180"], 1, 1, 0, 0, var_0 );
    return var_1;
}

vehicle_fire_main_cannon()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    var_0 = _func_1B0( "bmp_turret" );
    var_1 = _func_0B4( 3, 8 );
    self.turretfiring = 1;
    var_2 = 0;

    while ( var_2 < var_1 )
    {
        var_2++;
        wait(var_0);
        self _meth_8264();
    }

    self.turretfiring = 0;
}

scoutsniper_music_loop( var_0, var_1, var_2 )
{
    level notify( "music_loop" );
    _func_076( 1.0 );
    waitframe;

    if ( isdefined( var_0 ) )
        level._id_5FFE = var_0;

    thread music_loop_proc( var_1, var_2 );

    if ( isdefined( var_2 ) )
        thread music_loop_fade( var_2 );
}

music_loop_fade( var_0 )
{
    level endon( "music_loop" );
    common_scripts\utility::_id_384A( var_0 );

    if ( common_scripts\utility::_id_382E( "end_kill_music" ) )
        _func_076( 12 );
    else
        _func_076( 6 );
}

music_loop_proc( var_0, var_1 )
{
    level endon( "music_loop" );

    if ( isdefined( var_1 ) )
    {
        if ( common_scripts\utility::_id_382E( var_1 ) )
            return;

        level endon( var_1 );
    }

    thread music_loop_stop( var_0, var_1 );

    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    for (;;)
    {
        _id_A5A4::_id_6008( level._id_5FFE );
        wait(var_0);
    }
}

music_loop_stop( var_0, var_1 )
{
    level endon( "music_loop" );

    if ( isdefined( var_1 ) )
    {
        if ( common_scripts\utility::_id_382E( var_1 ) )
            return;

        level endon( var_1 );
    }

    common_scripts\utility::_id_384A( "_stealth_spotted" );
    _func_076( 0.5 );
    common_scripts\utility::_id_3857( "_stealth_spotted" );
    wait 1;
    common_scripts\utility::_id_3857( "_stealth_spotted" );
    thread music_loop_proc( var_0 );
}

scoutsniper_music_play( var_0, var_1 )
{
    level notify( "music_loop" );

    if ( isdefined( var_1 ) )
        _id_A5A4::_id_5FFC( var_0, var_1 );
    else
        _id_A5A4::_id_5FFC( var_0, 1.0 );
}

teleport_actor( var_0 )
{
    level._id_0318 _meth_8335( level._id_0318._id_02E2 + ( 0, 0, -34341 ) );
    self _meth_81C9( var_0._id_02E2, var_0.angles );
    self _meth_81AA( var_0._id_02E2 );
}

teleport_player_to_start_point( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_8C36;

    var_1 = getentarray( "start_point", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2]._id_0398 == var_0 )
        {
            level._id_0318 _meth_8335( var_1[var_2]._id_02E2 + ( 0, 0, 4 ) );
            level._id_0318 _meth_8337( var_1[var_2].angles );
            return;
        }
    }
}

clip_nosight_logic()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( self._id_79D3 );
    thread clip_nosight_logic2();
    self _meth_82BC( 1 );
    clip_nosight_wait();
    self delete();
}

clip_nosight_wait()
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self waittill( "damage" );
}

clip_nosight_logic2()
{
    self endon( "death" );
    common_scripts\utility::_id_3852( "_stealth_spotted", "_stealth_found_corpse" );
    self delete();
}

flashbang_from_corner( var_0, var_1, var_2, var_3 )
{
    var_1 thread _id_A510::_id_0BC9( self, var_0 );
    _id_A5A4::_id_27EF( 3.5, ::flashbang_from_corner_nade, var_2, var_3 );
    var_1 waittill( var_0 );
}

flashbang_from_corner_nade( var_0, var_1 )
{
    var_2 = self._id_01D6;
    self._id_01D6 = "flash_grenade";
    self._id_01D0++;
    var_3 = self._id_02E2 + ( 30, 25, 30 );
    var_4 = anglestoforward( var_0 );
    var_4 = _id_A5A4::vector_multiply( var_4, var_1 );
    self _meth_803A( var_3, var_4, 1.1 );
    self._id_01D6 = var_2;
    self._id_01D0 = 0;
}

initdogs()
{
    var_0 = getentarray( "stealth_dogs", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, maps\_stealth_logic::stealth_ai );
}

idle_anim_think()
{
    self endon( "death" );

    if ( !isdefined( self._id_04A4 ) )
        return;

    var_0 = getent( self._id_04A4, "targetname" );

    if ( !isdefined( var_0._id_793C ) )
        return;

    var_1 = undefined;

    switch ( var_0._id_793C )
    {
        case "coffee":
            var_1 = "coffee_";
            break;
        case "sleep":
            var_1 = "sleep_";
            break;
        case "phone":
            var_1 = "cellphone_";
            break;
        case "smoke":
            var_1 = "smoke_";
            break;
        case "lean_smoke":
            var_1 = "lean_smoke_";
            break;
        default:
            return;
    }

    self.allowdeath = 1;
    var_0 = getent( self._id_04A4, "targetname" );
    self.ref_node = var_0;

    if ( var_0._id_793C == "sleep" )
    {
        var_2 = _id_A5A4::_id_88D1( "chair" );
        self._id_46E9 = 1;
        self._id_0BEE = _id_A5A4::_id_590F( var_2 );
        var_0 thread _id_A510::_id_0BC7( var_2, "sleep_react" );
        var_0 maps\_stealth_logic::_id_8D89( self, var_1 + "idle", var_1 + "react" );
    }
    else
        var_0 maps\_stealth_logic::_id_8D8B( self, var_1 + "reach", var_1 + "idle", var_1 + "react" );
}

dash_door_slow( var_0 )
{
    var_1 = getentarray( self._id_04A6, "target" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_804F( self );

    self._id_6394 = self.angles;
    self _meth_82B1( self.angles + ( 0, 70 * var_0, 0 ), 2, 0.5, 0 );
    self _meth_805A();
    self waittill( "rotatedone" );
}

dash_door_super_fast( var_0 )
{
    var_1 = getentarray( self._id_04A6, "target" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_804F( self );

    self _meth_82B1( self.angles + ( 0, 70 * var_0, 0 ), 0.1 * _func_0BE( var_0 ), 0.05 * _func_0BE( var_0 ), 0 );
    self _meth_805A();
    self waittill( "rotatedone" );
}

dash_door_fast( var_0 )
{
    var_1 = getentarray( self._id_04A6, "target" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] _meth_804F( self );

    self _meth_82B1( self.angles + ( 0, 70 * var_0, 0 ), 0.3 * _func_0BE( var_0 ), 0.15 * _func_0BE( var_0 ), 0 );
    self _meth_805A();
    self waittill( "rotatedone" );
}

door_open_slow()
{
    self._id_6394 = self.angles;
    _id_A5A4::_id_4B09();
}

door_open_kick()
{
    wait 0.6;
    self._id_6394 = self.angles;
    self _meth_809C( "wood_door_kick" );
    self _meth_82B1( self.angles + ( 0, 130, 0 ), 0.3, 0, 0.15 );
    self _meth_805A();
    self waittill( "rotatedone" );
}

_id_2D43()
{
    if ( !isdefined( self._id_6394 ) )
        return;

    self _meth_82B1( self._id_6394, 0.2 );
}

church_lookout_stealth_behavior_alert_level_investigate( var_0 )
{
    var_1 = _id_A5A4::_id_3DC5( "church_smoker", "script_noteworthy" );
    var_2 = ( -34245, -1550, 608 );
    self _meth_81AA( var_2 );
    self._id_01C4 = 16;
    maps\_stealth_behavior::_id_327E();
    thread maps\_stealth_behavior::_id_31F7();
    church_lookout_goto_bestpos( var_0._id_02E2 );
    self endon( "death" );

    if ( isdefined( var_1 ) && _func_1A1( var_1 ) )
    {
        if ( !isdefined( var_0._id_0669._id_5836._id_8A93[var_1._id_0908] ) )
            var_0._id_0669._id_5836._id_8A93[var_1._id_0908] = 1;

        self _meth_809C( "RU_0_reaction_casualty_generic" );
        var_1._id_0179 = var_0;
        var_1 endon( "death" );
        var_1 waittill( "enemy" );
        var_1._id_0179 = undefined;
        var_1 waittill( "normal" );
    }
    else
        wait 3;

    thread maps\_stealth_behavior::_id_31F6();
    thread _id_A55F::_id_66FC();
}

church_lookout_goto_bestpos( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 16;

    var_2 = getentarray( "church_lookout_aware", "targetname" );
    var_2 = common_scripts\utility::_id_3CCB( var_0, var_2 );
    self _meth_81AA( var_2[0]._id_02E2 );
    self._id_01C4 = var_1;
    self waittill( "goal" );
}

church_lookout_stealth_behavior_alert_level_attack( var_0 )
{
    thread maps\_stealth_behavior::_id_31F7();
    church_lookout_goto_bestpos( var_0._id_02E2, 80 );
    var_1 = ( -35040, -1632, 224 );
    thread maps\_stealth_behavior::_id_31FA( var_1 );
    thread church_lookout_fire();
}

church_lookout_fire()
{
    self endon( "death" );
    self._id_0179 = level._id_0318;

    if ( getdvarint( "use_old_scoutsniper_church_sentry_behaviour", 0 ) != 0 )
    {
        wait 5;

        for (;;)
        {
            if ( isdefined( self._id_0142 ) )
            {
                var_0 = anglestoforward( self _meth_8185( "tag_flash" ) );
                var_1 = _func_114( self._id_0142._id_02E2 - self._id_02E2 );
                var_2 = _func_0F6( var_0, var_1 );

                if ( var_2 > 0.75 )
                {
                    var_3 = _func_0B4( 5, 25 );

                    for ( var_4 = 0; var_4 < var_3; var_4++ )
                    {
                        self _meth_81EA();
                        wait 0.05;
                    }

                    wait(_func_0B5( 1, 2 ));
                }
                else
                    wait 0.1;

                continue;
            }

            wait 0.1;
        }
    }
    else
    {
        var_5 = getent( "church_tower_sight_blocker", "script_noteworthy" );

        if ( isdefined( var_5 ) )
            var_5 delete();
    }
}

church_lookout_stealth_behavior_saw_corpse()
{
    thread maps\_stealth_behavior::_id_31F7();

    if ( isdefined( level.intro_last_patroller_corpse_name ) )
    {
        var_0 = getent( level.intro_last_patroller_corpse_name, "script_noteworthy" );

        if ( isdefined( var_0 ) )
            level._id_0669._id_5836._id_222C._id_0CD8 = common_scripts\utility::_id_0CF6( level._id_0669._id_5836._id_222C._id_0CD8, var_0 );
    }

    var_0 = self._id_0669._id_5836._id_222C._id_2231;
    _id_A5A4::_id_1ED1();
    church_lookout_goto_bestpos( var_0._id_02E2 );
    wait 1;

    if ( !_id_A5A4::_id_32D8( "_stealth_found_corpse" ) )
        _id_A5A4::_id_32DE( "_stealth_found_corpse" );
    else
        self notify( "_stealth_found_corpse" );

    thread maps\_stealth_logic::_id_320C( var_0 );
}

church_lookout_stealth_behavior_found_corpse()
{
    common_scripts\utility::_id_384A( "_stealth_found_corpse" );
    thread maps\_stealth_behavior::_id_31F5();
}

church_lookout_stealth_behavior_explosion( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );
    self endon( "death" );
    level endon( "_stealth_spotted" );
    var_1 = self._id_0669._id_5836._id_33C0.awareness[var_0];
    thread maps\_stealth_behavior::_id_31FD();
    church_lookout_goto_bestpos( var_1 );
}

graveyard_hind_find_best_perimeter( var_0, var_1 )
{
    self endon( "death" );
    self notify( "graveyard_hind_find_best_perimeter" );
    self endon( "graveyard_hind_find_best_perimeter" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = undefined;
    var_3 = undefined;
    thread _id_A5A4::_id_9CB3();
    var_4 = self._id_251D;

    for (;;)
    {
        var_5 = common_scripts\utility::_id_40FD( var_0, "targetname" );
        var_3 = common_scripts\utility::_id_3CCB( level._id_0318._id_02E2, var_5 )[0];

        if ( !isdefined( var_2 ) || var_2 != var_3 )
        {
            if ( var_1 )
            {
                graveyard_hind_strafe_path( var_3, var_1 );
                break;
            }
            else
                thread graveyard_hind_strafe_path( var_3, var_1, level._id_0318 );
        }

        var_2 = var_3;
        wait 0.05;
    }

    thread _id_A5A4::_id_9CB3();
    self._id_251D = var_4;
    self _meth_827F( 70, 30, 30 );
    thread _id_A5A4::_id_9D1F();
}

graveyard_hind_strafe_path( var_0, var_1, var_2 )
{
    self endon( "death" );
    self notify( "graveyard_hind_strafe_path" );
    self endon( "graveyard_hind_strafe_path" );

    if ( isdefined( var_2 ) )
        self _meth_8261( var_2 );

    var_3 = [];
    var_4 = common_scripts\utility::_id_40FB( var_0._id_04A4, "targetname" );

    while ( isdefined( var_4 ) )
    {
        var_3[var_3.size] = var_4;

        if ( isdefined( var_4._id_04A4 ) )
        {
            var_4 = common_scripts\utility::_id_40FB( var_4._id_04A4, "targetname" );
            continue;
        }

        var_4 = undefined;
    }

    var_0 = common_scripts\utility::_id_3CCB( self._id_02E2, var_3 )[0];
    self _meth_827F( 30, 20, 20 );
    thread _id_A5A4::_id_9CBF( var_0 );

    if ( !var_1 )
        return;

    var_0 waittill( "trigger" );
    var_0 waittill( "trigger" );
}

graveyard_hind_stinger_logic( var_0 )
{
    self endon( "death" );
    common_scripts\utility::_id_3831( "hind_spotted" );
    thread hind_spotted();

    if ( !isdefined( var_0 ) )
    {
        var_1 = spawn( "script_model", self._id_02E2 );
        var_1 _meth_804F( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        _func_09D( var_1, ( 0, 0, -80 ) );
        _func_0A8( var_1, 1 );
        level._id_0318 waittill( "stinger_fired" );
        common_scripts\utility::_id_383F( "hind_spotted" );
        graveyard_hind_stinger_reaction_wait( 3.5 );
        level thread graveyard_hind_stinger_flares_fire_burst( self, 8, 6, 5.0 );
        wait 0.5;
        var_1 _meth_8051();
        var_2 = _id_A53F::_id_3898( self );
        var_1 _meth_82AE( var_2, 8 );
    }

    _func_09D( self, ( 0, 0, -80 ) );
    _func_0A8( self, 1 );
    level._id_0318 waittill( "stinger_fired" );
    common_scripts\utility::_id_383F( "hind_spotted" );
    graveyard_hind_stinger_reaction_wait( 3 );
    graveyard_hind_stinger_flares_fire_burst( self, 8, 1, 5.0 );
}

hind_spotted()
{
    level endon( "_stealth_spotted" );
    common_scripts\utility::_id_384A( "hind_spotted" );
    common_scripts\utility::_id_383F( "_stealth_spotted" );
}

graveyard_hind_stinger_reaction_wait( var_0 )
{
    self endon( "death" );
    var_1 = 1100;
    var_2 = _func_0EE( level._id_0318._id_02E2, self._id_02E2 );
    var_3 = var_2 / var_1 - var_0;

    if ( var_3 > 0 )
        wait(var_3);

    self notify( "restart_avm" );
}

graveyard_hind_stinger_flares_fire_burst( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    common_scripts\utility::_id_383F( "graveyard_hind_flare" );

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        playfx( level._id_3891[var_0._id_04FF], var_0 _meth_8184( "tag_light_belly" ) );

        if ( var_0 == level._id_6D79 )
        {
            level._id_8D77["flares_used"]++;
            level._id_0318 _meth_82F1( "weap_flares_fire" );
        }

        wait 0.25;
    }

    _id_A5A4::_id_27EF( 3, common_scripts\utility::_id_3831, "graveyard_hind_flare" );
}

graveyard_church_breakable_flag()
{
    common_scripts\utility::_id_383F( "graveyard_church_breakable" );
    wait 2;
    common_scripts\utility::_id_3831( "graveyard_church_breakable" );
}

graveyard_church_breakable()
{
    self _meth_82BC( 1 );
    var_0 = self _meth_8097();

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_2.code_classname != "script_vehicle" )
            continue;

        if ( var_5 == "MOD_PROJECTILE" )
            break;
    }

    var_6 = getentarray( "field_church_tower_model", "targetname" );
    var_6 = common_scripts\utility::_id_3CCB( var_0, var_6, undefined, undefined, 512 );

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
        var_6[var_7] delete();

    var_8 = getweaponarray();
    var_8 = common_scripts\utility::_id_3CCB( var_0, var_8, undefined, undefined, 180 );

    for ( var_9 = 0; var_9 < var_8.size; var_9++ )
    {
        if ( isdefined( var_8[var_9] ) )
            var_8[var_9] delete();
    }

    if ( _func_0EE( var_0, level._id_0318._id_02E2 ) < 512 )
    {
        if ( !isdefined( level._id_6C50 ) )
            level._id_0318 _meth_8181( "crouch" );

        level._id_0318 _meth_82EE( ( 0, 1, 0 ) );
        level notify( "church_explosion_player_screen_fx" );
        thread _id_A5A4::_id_69C4( "scn_scoutsniper_church_breaking" );
    }

    if ( !common_scripts\utility::_id_382E( "graveyard_church_breakable" ) )
    {
        var_10 = level._id_058F["church_roof_exp"];

        if ( isdefined( self._id_0398 ) && isdefined( level._id_058F[self._id_0398] ) )
            var_10 = level._id_058F[self._id_0398];

        playfx( var_10, var_0, var_0 + ( 0, 0, -1 ) );
        thread graveyard_church_breakable_flag();
    }

    if ( isdefined( self._id_7A99 ) )
        common_scripts\_exploder::_id_3528( self._id_7A99 );

    self delete();
    clearallcorpses();

    if ( common_scripts\utility::_id_382E( "graveyard_church_ladder" ) )
        return;

    level endon( "graveyard_church_ladder" );
    var_11 = 0;
    var_12 = getentarray( "churchladder", "script_noteworthy" );

    for ( var_7 = 0; var_7 < var_12.size; var_7++ )
    {
        if ( _func_0EE( var_0, var_12[var_7]._id_02E2 ) > 1024 )
            continue;

        var_11 = 1;
        break;
    }

    if ( !var_11 )
        return;

    for ( var_7 = 0; var_7 < var_12.size; var_7++ )
        var_12[var_7] delete();

    var_13 = getent( "church_ladder_entity", "targetname" );
    var_13 delete();
    var_14 = getentarray( "intelligence_item", "targetname" );

    if ( var_14.size )
    {
        var_14 = common_scripts\utility::_id_3CCB( var_0, var_14 );
        var_15 = getent( var_14[0]._id_04A4, "targetname" );
        var_15 _meth_8056();
    }

    common_scripts\utility::_id_383F( "graveyard_church_ladder" );
}

chopper_ai_mode( var_0 )
{
    self endon( "death" );
    level endon( "air_support_over" );
    common_scripts\utility::_id_3831( "heli_gun" );
    common_scripts\utility::_id_3831( "heli_rocket" );

    for (;;)
    {
        common_scripts\utility::_id_3857( "graveyard_hind_flare" );
        wait(_func_0B5( 0.2, 1.0 ));
        common_scripts\utility::_id_383F( "heli_gun" );
        common_scripts\utility::_id_3857( "heli_rocket" );
        self _meth_8263( "hind_turret" );
        var_1 = anglestoforward( self.angles );
        var_2 = _func_114( var_0._id_02E2 - self._id_02E2 );

        if ( _func_0F6( var_1, var_2 ) < 0.25 )
        {
            common_scripts\utility::_id_3831( "heli_gun" );
            continue;
        }

        thread _id_A53F::_id_83F0( var_0 );
        _id_A5A4::_id_61FD( "mg_off", _func_0B5( 2, 4 ) );
        common_scripts\utility::_id_3831( "heli_gun" );
    }
}

chopper_ai_mode_missiles( var_0 )
{
    self endon( "death" );
    level endon( "air_support_over" );
    var_1 = spawn( "script_origin", var_0._id_02E2 );
    var_2 = getent( "graveyard_inside_church_trig", "targetname" );
    common_scripts\utility::_id_3831( "heli_gun" );
    common_scripts\utility::_id_3831( "heli_rocket" );

    for (;;)
    {
        common_scripts\utility::_id_3857( "graveyard_hind_flare" );
        wait(_func_0B5( 1, 3 ));
        common_scripts\utility::_id_383F( "heli_rocket" );
        common_scripts\utility::_id_3857( "heli_gun" );
        var_3 = anglestoforward( self.angles );
        var_4 = _func_114( var_0._id_02E2 - self._id_02E2 );

        if ( _func_0F6( var_3, var_4 ) < 0.85 )
        {
            common_scripts\utility::_id_3831( "heli_rocket" );
            continue;
        }

        var_5 = _func_0B4( 4, 6 );
        var_6 = _func_06B( self._id_02E2 + ( 0, 0, -150 ), var_0._id_02E2, 1, level._id_6F7C );

        if ( !isdefined( var_6["entity"] ) || !_func_1AD( var_6["entity"] ) )
        {
            var_7 = getentarray( "church_breakable", "targetname" );

            if ( isdefined( var_7 ) && var_7.size && var_0 _meth_80AB( var_2 ) )
            {
                var_7 = common_scripts\utility::_id_3CCB( var_0._id_02E2, var_7 );
                var_1._id_02E2 = var_7[0] _meth_8097();
            }
            else
                var_1._id_02E2 = var_0._id_02E2 + ( 0, 0, 128 );
        }
        else
            var_1._id_02E2 = var_0._id_02E2;

        _id_A53F::_id_37BA( "ffar_hind", var_5, var_1, 0.2 );
        common_scripts\utility::_id_3831( "heli_rocket" );
    }
}

clean_previous_ai( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_384A( var_0 );
    common_scripts\utility::_id_3857( "_stealth_spotted" );
    var_3 = undefined;

    if ( !isdefined( var_1 ) )
        var_3 = _func_0DA( "axis", "all" );
    else
        var_3 = _id_A5A4::_id_3DC8( var_1, var_2 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        var_3[var_4] delete();
}

field_bmp_quake()
{
    self endon( "death" );
    self _meth_80B0( "bmp_rumble" );
    var_0 = 0.1;

    for (;;)
    {
        _func_18C( 0.15, var_0, self._id_02E2, 512 );
        wait(var_0);
    }
}

fake_radiation()
{
    for (;;)
    {
        self waittill( "trigger" );

        while ( level._id_0318 _meth_80AB( self ) )
        {
            if ( level._id_0318.radiation.ratepercent < 5 )
                level._id_0318.radiation.ratepercent = 5;
            else
                level._id_0318.radiation.ratepercent = 0;

            wait 0.1;
        }

        level._id_0318.radiation.ratepercent = 0;
    }
}

body_splash( var_0 )
{
    if ( common_scripts\utility::_id_382E( "pond_abort" ) )
        return;

    common_scripts\_exploder::_id_3528( 6 );
}

pond_handle_backup()
{
    common_scripts\utility::_id_384A( "pond_patrol_spawned" );
    pond_handle_backup_wait();
    wait 2;
    var_0 = getent( "pond_door_right", "script_noteworthy" );
    var_1 = getent( var_0._id_04A6, "target" );
    var_1 _meth_804F( var_0 );
    var_2 = getent( "pond_door_left", "script_noteworthy" );
    var_1 = getent( var_2._id_04A6, "target" );
    var_1 _meth_804F( var_2 );
    var_0 _meth_82B3( 130, 0.3, 0, 0.15 );
    var_0 _meth_805A();
    var_2 _meth_82B3( -130, 0.4, 0, 0.2 );
    var_2 _meth_805A();
}

pond_handle_backup_wait()
{
    level endon( "_stealth_spotted" );
    var_0 = undefined;

    for (;;)
    {
        level waittill( "event_awareness", var_0 );

        if ( var_0 == "explode" )
            break;

        if ( var_0 == "heard_scream" )
            break;

        if ( var_0 == "heard_corpse" )
            break;
    }
}

pond_inposition_takeshot( var_0, var_1 )
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::_id_382E( "pond_enemies_dead" ) )
        return;

    level endon( "pond_enemies_dead" );
    self endon( "follow_path_new_goal" );
    self _meth_81CE( "prone", "crouch" );
    _id_A5A4::_id_32DA( "_stealth_stance_handler" );
    self._id_01C4 = 16;
    self waittill( "goal" );
    wait 0.25;

    if ( !isdefined( var_1 ) )
        var_1 = "scoutsniper_mcm_inposition";

    _id_A5A4::_id_30B0();
    var_2 = _id_A5A4::_id_3DC6( "pond_throwers", "script_noteworthy" );
    _id_A5A4::_id_22CF( var_2[0] );

    if ( !common_scripts\utility::_id_382E( "_stealth_event" ) )
        level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, var_1 );

    _id_A5A4::_id_32DE( "pond_in_position" );
}

field_bmp_make_followme()
{
    var_0 = anglestoforward( self.angles );
    var_1 = self._id_02E2 + _id_A5A4::vector_multiply( var_0, -128 );
    var_2 = spawn( "script_origin", var_1 );
    var_2 _meth_804F( self );
    self.followme = var_2;
}

field_creep_player_calc_movement()
{
    var_0 = _func_0F1( self _meth_8336() );
    var_1 = self._id_0669._id_5836._id_8AF2;
    var_2 = var_1 == "prone" && var_0 == 0;
    return var_2;
}

field_handle_special_nodes()
{
    common_scripts\utility::_id_0D13( getentarray( "field_jog", "script_noteworthy" ), ::field_handle_special_nodes_jog );
}

field_handle_special_nodes_jog()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0._id_793C ) && var_0._id_793C == "jog" )
        {
            if ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) )
            {
                var_0 _id_A5A4::_id_7E45( "patrol_jog" );
                var_0 notify( "patrol_walk_twitch_loop" );
                wait 2;

                if ( _func_1A1( var_0 ) && !common_scripts\utility::_id_382E( "_stealth_spotted" ) )
                {
                    var_0 _id_A5A4::_id_7E45( "patrol_walk", 1 );
                    var_0 thread _id_A55F::patrol_walk_twitch_loop();
                }
            }
        }
    }
}

field_enemy_walk_behind_bmp()
{
    self endon( "death" );
    level endon( "_stealth_spotted" );
    level endon( "field_start_running" );

    if ( self._id_3584 == 39 )
        self endon( "end_patrol" );

    if ( !isdefined( self._id_6718 ) )
        _id_A5A4::_id_7E45( "patrol_walk", 1 );
    else
        _id_A5A4::_id_7E45( self._id_6718, 1 );

    self._id_2B0E = 1;
    self._id_2AF3 = 1;
    var_0 = _id_A5A8::get_vehicle_from_targetname( self._id_04A4 );
    self _meth_81AB( var_0.followme );

    for (;;)
    {
        wait 0.5;

        if ( _func_0EE( self._id_02E2, var_0.followme._id_02E2 ) > 60 )
            continue;

        _id_A510::_id_0BCA( self, "gravity", "patrol_stop" );
        self _meth_81AA( self._id_02E2 );
        _id_A510::_id_0BCA( self, "gravity", "patrol_start" );
        self _meth_81AB( var_0.followme );
    }
}

field_enemy_avoid_bmp()
{
    self endon( "death" );
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "field_start_running" );

    for (;;)
    {
        self waittill( "touch", var_0 );
        field_enemy_avoid_bmp_on_collision( var_0 );
    }
}

field_enemy_avoid_bmp_on_collision( var_0 )
{
    if ( !isdefined( var_0.classname ) || !_func_120( var_0.classname, "bmp" ) )
        return;

    var_1 = self._id_01C3;
    _id_A510::_id_0BCA( self, "gravity", "patrol_stop" );
    self _meth_81AA( self._id_02E2 );
    self endon( "goal" );

    while ( _func_0EE( self._id_02E2, var_0._id_02E2 ) <= 300 )
        wait 0.5;

    _id_A510::_id_0BCA( self, "gravity", "patrol_start" );

    if ( isdefined( self._id_5545 ) )
        self _meth_81AB( self._id_5545 );
    else
        self _meth_81AA( var_1 );
}

field_enemy_death()
{
    while ( _func_1A1( self ) )
    {
        self waittill( "damage", var_0, var_1 );

        if ( _func_1AD( var_1 ) )
        {
            thread maps\_stealth_behavior::enemy_announce_spotted_bring_team( level._id_0318._id_02E2 );
            common_scripts\utility::_id_383F( "_stealth_spotted" );
            break;
        }
    }
}

field_enemy_alert_level_1( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "death" );
    thread maps\_stealth_behavior::_id_31F7();
    wait 3.5;
    _id_A5A4::_id_32DA( "_stealth_enemy_alert_level_action" );
    common_scripts\utility::_id_3857( "_stealth_found_corpse" );

    if ( !isdefined( self._id_0669._id_5836._id_222C._id_2231 ) )
        thread maps\_stealth_behavior::_id_31F6();
}

field_enemy_patrol_thread()
{
    self endon( "stop_patrol_thread" );
    self endon( "death" );
    self endon( "attack" );
    thread field_enemy_patrol_thread2();

    for (;;)
    {
        self waittill( "enemy" );
        waitframe;

        if ( !_func_120( self._id_04A4, "bmp" ) && _id_A5A4::_id_32D8( "field_walk" ) )
        {
            if ( isdefined( self._id_5545 ) )
                self._id_04A4 = self._id_5545._id_04A6;

            thread _id_A55F::_id_66FC();
            continue;
        }

        _id_A5A4::_id_7E45( "patrol_walk", 1 );
    }
}

field_enemy_patrol_thread2()
{
    self endon( "death" );
    self endon( "attack" );
    var_0 = 46;
    var_1 = var_0 * var_0;

    while ( _func_0F0( level._id_0318._id_02E2, self._id_02E2 ) > var_1 )
        wait 0.1;

    level._id_0318._id_0669._id_5836._id_8A93[self._id_0908] = 2;
    self._id_0179 = level._id_0318;
}

field_enemy_alert_level_2( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "death" );
    self notify( "stop_patrol_thread" );
    thread maps\_stealth_behavior::_id_31F7();
    common_scripts\utility::_id_383F( "field_stop_bmps" );
    _id_A5A4::_id_1ED1();
    self _meth_81AA( var_0._id_02E2 );
    self._id_01C4 = 80;
    self waittill( "goal" );
    level._id_0318._id_0669._id_5836._id_8A93[self._id_0908] = 2;
    self._id_0179 = var_0;
}

field_enemy_awareness( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "death" );
    self notify( "stop_patrol_thread" );
    common_scripts\utility::_id_383F( "field_stop_bmps" );
    _id_A5A4::_id_1ED1();
    level._id_0318._id_0669._id_5836._id_8A93[self._id_0908] = 2;
    self._id_0179 = level._id_0318;
}

cargo_enemy_attack( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    thread maps\_stealth_behavior::_id_31FA( self._id_02E2 );
    thread maps\_stealth_behavior::_id_3208();
}

cargo_attack2v2( var_0 )
{
    thread cargo_attack2v2_cleanup( var_0 );
    var_0 endon( "death" );
    var_0 endon( "_stealth_stop_stealth_logic" );
    var_0 waittill( "stealth_enemy_endon_alert" );
    self._id_01FB = 0;
    self._id_0179 = var_0;
}

cargo_attack2v2_cleanup( var_0 )
{
    var_0 waittill( "dead" );
    self._id_01FB = 1;
    self._id_0179 = undefined;
}

cargo_sleeper_wait_wakeup()
{
    self endon( "death" );
    thread maps\_stealth_logic::_id_8DCA();
    self endon( "stealth_enemy_endon_alert" );
    var_0 = 32;
    var_1 = var_0 * var_0;

    while ( _func_0F0( self._id_02E2, level._id_0318._id_02E2 ) > var_1 )
        wait 0.1;
}

cargo_handle_patroller()
{
    common_scripts\utility::_id_0D13( getentarray( "cargo_patrol_flag_set", "script_noteworthy" ), ::cargo_handle_patroller_flag, 1 );
    common_scripts\utility::_id_0D13( getentarray( "cargo_patrol_flag_clear", "script_noteworthy" ), ::cargo_handle_patroller_flag, 0 );
    var_0 = getent( "cargo_patrol_kill_flag", "script_noteworthy" );
    var_0 thread cargo_handle_patroller_kill_trig();
}

cargo_handle_patroller_flag( var_0 )
{
    level endon( "dash_start" );

    for (;;)
    {
        self waittill( "trigger" );

        if ( var_0 )
        {
            common_scripts\utility::_id_383F( self._id_79D3 );
            continue;
        }

        common_scripts\utility::_id_3831( self._id_79D3 );
    }
}

cargo_handle_patroller_kill_trig()
{
    common_scripts\utility::_id_97CC();
    common_scripts\utility::_id_384A( "cargo_price_ready_to_kill_patroller" );
    common_scripts\utility::_id_97CE();

    for (;;)
    {
        self waittill( "trigger", var_0 );

        while ( _func_1A1( var_0 ) && var_0 _meth_80AB( self ) )
            wait 0.1;

        wait 0.25;
        common_scripts\utility::_id_3831( "cargo_patrol_kill" );
    }
}

cargo_insane_handle_use()
{
    self endon( "trigger" );
    self endon( "death" );

    for (;;)
    {
        while ( level._id_0318._id_0669._id_5836._id_8AF2 != "prone" )
            wait 0.05;

        common_scripts\utility::_id_97CC();

        while ( level._id_0318._id_0669._id_5836._id_8AF2 == "prone" )
            wait 0.05;

        common_scripts\utility::_id_97CE();
    }
}

cargo_slipby_part1( var_0 )
{
    if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) <= var_0 && !common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
    {
        level _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_holdup" );

        if ( common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_letsgo2" );
        else if ( common_scripts\utility::_id_382E( "cargo_patrol_danger" ) )
        {
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_patrolthisway" );
            cargo_patrol_waitdead_or_flag_open( "cargo_patrol_danger" );

            if ( !common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_waithere2" );
            else
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_letsgo2" );
        }
        else
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_waithere2" );
    }
    else
    {
        cargo_patrol_waitdead_or_flag_open( "cargo_patrol_danger" );
        level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_followme2" );
    }
}

cargo_slipby_part2( var_0 )
{
    common_scripts\utility::_id_383F( "cargo_price_ready_to_kill_patroller" );
    wait 0.1;

    if ( !common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
    {
        if ( !common_scripts\utility::_id_382E( "cargo_patrol_away" ) && !common_scripts\utility::_id_382E( "cargo_patrol_danger" ) )
        {
            if ( !common_scripts\utility::_id_382E( "cargo_patrol_kill" ) )
            {
                if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) <= var_0 )
                    level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_anotherpass" );
            }

            common_scripts\utility::_id_384C( "cargo_patrol_away", "cargo_patrol_danger", "cargo_patrol_dead", "cargo_patrol_kill" );
        }

        if ( common_scripts\utility::_id_382E( "cargo_patrol_danger" ) && !common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
        {
            if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) <= var_0 )
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_patrolthisway" );

            cargo_patrol_waitdead_or_flag_open( "cargo_patrol_danger" );
        }

        if ( common_scripts\utility::_id_382E( "cargo_patrol_kill" ) && !common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
            cargo_slipby_kill_patrol();
    }

    if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) <= var_0 )
    {
        level _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_forwardclear" );
        level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_go" );
        self.ref_node thread _id_A510::_id_0BC9( self, "moveout_cornerR" );
        self.ref_node waittill( "moveout_cornerR" );
    }
    else
        level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_onme" );
}

cargo_slipby_part3( var_0 )
{
    if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) <= var_0 )
    {
        if ( !( !common_scripts\utility::_id_382E( "cargo_patrol_away" ) && !common_scripts\utility::_id_382E( "cargo_patrol_dead" ) ) )
        {
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_shhh" );
            self.ref_node thread _id_A510::_id_0BC9( self, "stop_cqb" );
            self.ref_node waittill( "stop_cqb" );
        }

        if ( !common_scripts\utility::_id_382E( "cargo_patrol_away" ) && !common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
        {
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_patrolthisway" );
            self _meth_81CE( "prone" );
            _id_A510::_id_0BCA( self, "gravity", "stand2prone" );
            self _meth_81AA( self._id_02E2 );
            common_scripts\utility::_id_384C( "cargo_patrol_dead", "cargo_patrol_away", "cargo_patrol_kill" );
            self _meth_81CE( "prone", "crouch", "stand" );
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_moveup" );
        }
        else
        {
            self.ref_node thread _id_A510::_id_0BC9( self, "moveup_cqb" );
            level _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_stayhidden" );
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_moveup" );
        }
    }
}

cargo_slipby_kill_patrol()
{
    if ( common_scripts\utility::_id_382E( "cargo_patrol_kill" ) )
    {
        self._id_01FB = 0;
        self._id_0179 = _id_A5A4::_id_3DC5( "cargo_patrol", "script_noteworthy" );
        cargo_patrol_waitdead_or_flag_open( "cargo_patrol_kill" );
        self._id_01FB = 1;
        self._id_0179 = undefined;
        return 1;
    }

    return 0;
}

cargo_patrol_waitdead_or_flag_set( var_0 )
{
    if ( common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
        return;

    level endon( "cargo_patrol_dead" );
    common_scripts\utility::_id_384A( var_0 );
}

cargo_patrol_waitdead_or_flag_open( var_0 )
{
    if ( common_scripts\utility::_id_382E( "cargo_patrol_dead" ) )
        return;

    level endon( "cargo_patrol_dead" );
    common_scripts\utility::_id_3857( var_0 );
}

dash_ai()
{
    self endon( "death" );
    self._id_01FB = 1;
    common_scripts\utility::_id_384A( "dash_start" );
    self._id_01FB = 0;

    if ( !isdefined( self._id_7A40 ) )
        return;

    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    self endon( "death" );
    self waittill( "jumpedout" );
    var_0 = getent( self._id_04A4, "targetname" );

    if ( isdefined( var_0._id_04A4 ) )
        thread _id_A55F::_id_66FC();
    else
        thread dash_idler();
}

dash_intro_runner()
{
    self endon( "death" );
    thread dash_intro_common();
}

dash_intro_patrol()
{
    self endon( "death" );
    thread dash_intro_common();
    self._id_2B0E = 1;
    _id_A5A4::_id_7E45( "patrol_walk", 1 );
}

dash_intro_common()
{
    self endon( "death" );
    self._id_017D = 0;
    self._id_01C4 = 4;
    common_scripts\utility::_id_384A( "dash_start" );
    var_0 = getent( self._id_04A4, "targetname" );
    thread scoutsniper_follow_path( var_0 );
    thread deleteontruegoal();
}

dash_idler()
{
    self._id_2B0E = 1;
    _id_A5A4::_id_7E45( "patrol_walk", 1 );
    self._id_017D = 0;
    self._id_01C4 = 64;
    var_0 = getent( self._id_04A4, "targetname" );
    thread scoutsniper_follow_path( var_0 );
    var_1 = getent( self._id_04A4, "targetname" );

    for (;;)
    {
        _id_A5A4::_id_7E4D( var_1._id_02E2 );
        waitontruegoal( var_1 );

        if ( !isdefined( var_1._id_04A4 ) )
            break;

        var_1 = getent( var_1._id_04A4, "targetname" );
    }

    self._id_04A4 = var_1._id_04A6;
    thread idle_anim_think();
}

dash_fake_easy_mode()
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );

    if ( common_scripts\utility::_id_382E( "dash_sniper" ) )
        return;

    level endon( "dash_sniper" );
    level._id_0318 endon( "death" );
    level._id_6F7C endon( "death" );
    var_0 = [];
    var_0["stand"] = 0;
    var_0["crouch"] = 0;
    var_0["prone"] = 2;
    var_1 = [];
    var_1["prone"] = 70;
    var_1["crouch"] = 400;
    var_1["stand"] = 600;
    var_2 = [];
    var_2["prone"] = 90;
    var_2["crouch"] = 600;
    var_2["stand"] = 900;
    var_3 = 160;
    var_4 = var_3 * var_3;

    while ( _func_1A1( level._id_0318 ) )
    {
        level._id_0318 maps\_stealth_logic::_id_8DD9( var_0, var_0 );
        maps\_stealth_logic::_id_8DB9( var_1, var_2 );

        while ( _func_0F0( level._id_0318._id_02E2, level._id_6F7C._id_02E2 ) <= var_4 )
            wait 0.1;

        level._id_0318 maps\_stealth_logic::_id_8DD8();
        maps\_stealth_logic::_id_8DB8();

        while ( _func_0F0( level._id_0318._id_02E2, level._id_6F7C._id_02E2 ) > var_4 )
            wait 0.1;
    }
}

dash_run_check()
{
    self waittill( "trigger" );
    common_scripts\utility::_id_383F( self._id_79D3 );
}

dash_handle_price_stop_bullet_shield()
{
    level._id_6F7C endon( "death" );
    level._id_0318 endon( "death" );
    level endon( "dash_reset_stealth_to_default" );
    common_scripts\utility::_id_384A( "dash_spawn" );
    level._id_6F7C _id_A5A4::_id_8EA4();
    level._id_6F7C._id_0271 = 1;
    level._id_6F7C._id_01E6 = 1;
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    wait 6;
    level._id_6F7C _meth_8054();
}

dash_handle_doors_blowopen()
{
    level endon( "dash_door_L_open" );
    common_scripts\utility::_id_384A( "dash_spawn" );
    wait 0.05;
    var_0 = _id_A5A4::_id_3DC6( "dash_intro_runner", "script_noteworthy" );
    var_1 = undefined;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2].classname != "actor_enemy_merc_AT_RPG7" )
            continue;

        var_1 = var_0[var_2];
        break;
    }

    var_3 = var_1._id_02E2 + ( 0, 0, 75 );
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    var_4 = getent( "dash_door_right", "script_noteworthy" );
    var_5 = getent( "dash_door_left", "script_noteworthy" );
    var_6 = var_4 _meth_8097();
    var_7 = _func_114( var_6 - var_3 );
    var_7 = _id_A5A4::vector_multiply( var_7, 48 );
    var_3 += var_7;
    _func_1C2( "rpg", var_3, var_6 );
    wait 0.5;

    if ( !common_scripts\utility::_id_382E( "dash_door_R_open" ) )
        var_4 thread dash_door_super_fast( -0.85 );
    else
        var_4 thread dash_door_super_fast( 0.35 );

    if ( !common_scripts\utility::_id_382E( "dash_door_L_open" ) )
        var_5 thread dash_door_super_fast( 0.95 );
}

dash_handle_nosight_clip()
{
    common_scripts\utility::_id_384A( "dash_spawn" );
    common_scripts\utility::_id_3852( "_stealth_spotted", "dash_start" );

    if ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        common_scripts\utility::_id_3856( "_stealth_spotted", 5 );

    var_0 = getent( "dash_nosight_clip", "targetname" );
    var_0 delete();
}

dash_crawl_patrol()
{
    common_scripts\utility::_id_383F( "dash_crawl_patrol_spawned" );
    var_0 = ( 24281, -4069.5, -330.5 );
    var_1 = spawn( "script_model", ( -21828, 3997, 249 ) + var_0 );
    var_1.angles = ( 0.17992, 214.91, 1.77098 );
    var_1 _meth_80B3( "vehicle_bm21_mobile_cover" );
    var_1 _meth_8056();
    self _meth_804F( var_1, "tag_detach" );
    self.allowdeath = 1;
    var_2 = undefined;

    if ( self._id_7ADC == 9 )
        var_2 = "bm21_unload2";
    else
        var_2 = "bm21_unload1";

    var_1 _id_A510::_id_0BC9( self, var_2, "tag_detach" );
    var_1 delete();
}

dash_state_hidden()
{
    level endon( "_stealth_detection_level_change" );
    self._id_019B = 0.86;
    self._id_0179 = undefined;

    if ( self._id_04D9 == "dog" )
        return;

    self._id_011F = 1;

    if ( !isdefined( self._id_6398 ) )
        self._id_6398 = self._id_1300;

    if ( !isdefined( self._id_6392 ) )
        self._id_6392 = self.accuracy;

    self._id_1300 = self._id_6398;
    self.accuracy = self._id_6392;
    self._id_017D = 1;
    self _meth_816A();
}

dash_sniper_death()
{
    common_scripts\utility::_id_383F( "dash_sniper" );

    if ( dash_sniper_player_weapon_check() )
    {
        self delete();
        common_scripts\utility::_id_383F( "dash_sniper_dead" );
        return;
    }

    _id_A5A4::_id_32DD( "death_anim" );
    thread dash_sniper_anim();
    var_0 = [];
    var_0["prone"] = 1300;
    var_0["crouch"] = 1600;
    var_0["stand"] = 1800;
    maps\_stealth_logic::_id_8DB9( var_0, var_0 );
    var_1 = [];
    var_1["stand"] = 0;
    var_1["crouch"] = 0;
    var_1["prone"] = 2;
    level._id_0318 maps\_stealth_logic::_id_8DD9( var_1, var_1 );
    self._id_01E6 = 10000;
    self waittill( "damage", var_2, var_3 );
    self notify( "_stealth_stop_stealth_logic" );
    var_4 = _func_0C3( self._id_04A4, "targetname" );

    if ( _id_A5A4::_id_32D8( "death_anim" ) )
    {
        var_4 thread _id_A510::_id_0BC9( self, "balcony_death" );
        _id_A5A4::_id_27EF( 1.2, ::rag_doll, self );
    }
    else
        self _meth_8054( var_3._id_02E2 );

    common_scripts\utility::_id_383F( "dash_sniper_dead" );

    if ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) && !common_scripts\utility::_id_382E( "dash_killed_by_price" ) )
    {
        _id_A5A4::_id_70C9();

        if ( common_scripts\utility::_id_382E( "dash_last" ) )
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_beautiful" );
        else
        {
            common_scripts\utility::_id_383F( "dash_work_as_team" );
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_ateam" );
        }
    }
}

dash_sniper_player_weapon_check()
{
    var_0 = level._id_0318 _meth_8308();
    var_1 = [];
    var_1[var_1.size] = "m14_scoped_silencer";
    var_1[var_1.size] = "p90_silencer";

    if ( level._id_3BFE > 0 )
        var_1[var_1.size] = "usp_silencer";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( var_0[var_2] != var_1[var_3] )
                continue;

            var_4 = level._id_0318 _meth_82F6( var_0[var_2] );
            var_4 += level._id_0318 _meth_82F5( var_0[var_2] );

            if ( var_4 <= 0 )
                continue;

            return 0;
        }
    }

    return 1;
}

dash_sniper_anim()
{
    self endon( "death" );
    thread _id_A55F::_id_66FC();
    self waittill( "goal" );
    _id_A5A4::_id_32DE( "death_anim" );
    self waittill( "_stealth_enemy_alert_level_change" );
    _id_A5A4::_id_32DA( "death_anim" );
}

dash_sniper_alert( var_0 )
{
    var_1 = _func_0C3( "dash_sniper_node", "targetname" );
    thread maps\_stealth_behavior::_id_31F7();
    self _meth_81A9( var_1 );
    self._id_01C4 = 32;
}

dash_sniper_attack( var_0 )
{
    var_1 = _func_0C3( "dash_sniper_node", "targetname" );
    thread maps\_stealth_behavior::_id_31FA( var_0._id_02E2 );
    self _meth_81A9( var_1 );
    self._id_01C4 = 32;
}

dash_handle_heli()
{
    thread dash_hind();
    level endon( "_stealth_spotted" );
    var_0 = getent( "dash_heli_land", "script_noteworthy" );
    var_0 waittill( "trigger", var_1 );
    var_1 endon( "death" );
    var_1 thread dash_heli_liftoff();
}

dash_heli_liftoff()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    common_scripts\utility::_id_383F( "dash_heli_agro" );
    _id_A5A4::_id_9CFC( 512 );
}

dash_hind()
{
    _id_A5E8::_id_870C( "aud_start_dash_heli_flyby_sequence" );
    var_0 = getent( "dash_heli_path", "targetname" );
    var_0 waittill( "trigger" );
    var_1 = _id_A5A4::_id_3EB2( "dash_hind", "targetname" );
    maps\_wibble::wibble_add_heli_to_track( var_1 );
    maps\_wibble::setup_wibble_helis( 1 );
    var_1 thread dash_hind_pilots( var_1._id_750A[0], "tag_driver", "pilot_idle" );
    var_1 thread dash_hind_pilots( var_1._id_750A[1], "tag_passenger", "gunner_idle" );
    var_1 _meth_8290( 25, 45 );
    var_1 _meth_824F( 128 );
    var_1 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    level _id_A5A4::_id_075F( common_scripts\utility::_id_383F, "dash_hind_down" );
    level _id_A5A4::_id_075F( common_scripts\utility::_id_3831, "dash_heli_agro" );
    thread _id_A5A4::_id_2BDC();
    level.hind = var_1;
    var_1 endon( "death" );
    var_1 thread maps\scoutsniper::dash_hind_detect_damage();
    var_1 thread dash_hind_distance_logic();
    var_1 thread graveyard_hind_stinger_logic( 1 );
    common_scripts\utility::_id_384A( "_stealth_spotted" );
    var_1 thread dash_hind_attack_enemy();
}

dash_hind_pilots( var_0, var_1, var_2 )
{
    var_0._id_0C72 = "generic";
    var_0 thread codescripts\character::_id_7F88( "head_spetsnaz_assault_geoff" );
    thread _id_A510::_id_0BCE( var_0, var_2, var_1 );
}

dash_hind_distance_logic()
{
    self endon( "death" );
    var_0 = 600;
    var_1 = var_0 * var_0;

    while ( _func_0F0( level._id_0318._id_02E2, self._id_02E2 ) > var_1 )
        wait 0.25;

    common_scripts\utility::_id_383F( "_stealth_spotted" );
}

dash_hind_attack_enemy()
{
    self endon( "death" );
    thread graveyard_hind_find_best_perimeter( "dash_hind_circle_path" );
    wait 10;
    thread chopper_ai_mode( level._id_0318 );
}

dash_stander()
{
    if ( !isdefined( self._id_04A4 ) )
        return;

    var_0 = getent( self._id_04A4, "targetname" );
    self._id_01C4 = 4;
    self _meth_8193( "face angle", var_0.angles[1] + 35 );
}

dash_handle_stealth_unsure()
{
    level endon( "town_no_turning_back" );

    for (;;)
    {
        level common_scripts\utility::_id_A087( "_stealth_enemy_alert_level_change", "dash_heli_agro" );
        common_scripts\utility::_id_383F( "dash_stealth_unsure" );
        wait 10;
        common_scripts\utility::_id_3857( "_stealth_spotted" );
        common_scripts\utility::_id_3857( "dash_heli_agro" );
        common_scripts\utility::_id_3831( "dash_stealth_unsure" );
    }
}

dogs_eater_eat()
{
    self endon( "death" );
    self endon( "dog_mode" );

    if ( self._id_5D35 == "eat" )
        return;

    self._id_5D35 = "eat";
    self.allowdeath = 1;
    self notify( "stop_loop" );
    self.ref_node notify( "stop_loop" );
    self.ref_node.angles = self.angles;
    self _meth_804F( self.ref_node );
    self.ref_node thread _id_A510::_id_0BCE( self, "dog_idle" );
    wait(_func_0B5( 1, 3 ));
    self.ref_node notify( "stop_loop" );
    self.ref_node _meth_82B1( self.ref_angles, 0.4 );

    for (;;)
    {
        self _meth_809C( "anml_dog_eating_body" );
        self.ref_node _id_A510::_id_0BC9( self, "dog_eating_single" );
    }
}

dogs_eater_growl()
{
    self endon( "death" );
    self notify( "dog_mode" );

    if ( self._id_5D35 == "growl" )
        return;

    self._id_5D35 = "growl";
    self.allowdeath = 1;
    self _meth_8051();
    self notify( "stop_loop" );
    self.ref_node notify( "stop_loop" );
    self _meth_8143();
    self _meth_81AA( self _meth_8184( "tag_origin" ) );
    wait 0.05;
    self _meth_8193( "face angle", self.angles[1] );
    self _meth_80AE();
}

dogs_eater_bark()
{
    self endon( "death" );
    self notify( "dog_mode" );

    if ( self._id_5D35 == "bark" )
        return;

    self._id_5D35 = "bark";
    self.allowdeath = 1;
    self _meth_8051();
    self notify( "stop_loop" );
    self.ref_node notify( "stop_loop" );
    self _meth_8143();
    self _meth_80AE();
}

_id_17CF()
{
    wait(_func_0B3( 0.5 ));
    var_0 = self _meth_8097();
    var_1 = ( 0, -1, 0 );
    thread common_scripts\utility::_id_69C2( "veh_glass_break_small", var_0 );
    playfx( level._id_058F["glass_break"], var_0, var_1 );
    self delete();
}

center_heli_quake( var_0 )
{
    level endon( var_0 );
    common_scripts\_exploder::_id_3528( 100 );

    for (;;)
    {
        wait 0.1;
        _func_18C( 0.25, 0.1, self._id_02E2, 2000 );
    }
}

price_death()
{
    level endon( "missionfailed" );
    level._id_0318 endon( "death" );
    self waittill( "death", var_0 );
    _id_A5A4::_id_70C9();
    var_1 = undefined;

    if ( _func_1AD( var_0 ) )
        var_1 = &"SCOUTSNIPER_FRIENDLY_FIRE_WILL_NOT";
    else
        var_1 = &"SCOUTSNIPER_YOUR_ACTIONS_GOT_CPT";

    setdvar( "ui_deadquote", var_1 );
    thread _id_A5A4::_id_5CDF();
}

price_left_behind()
{
    _id_A5A4::_id_70C9();
    var_0 = &"SCOUTSNIPER_LEFT_BEHIND";
    setdvar( "ui_deadquote", var_0 );
    thread _id_A5A4::_id_5CDF();
}

deleteontruegoal()
{
    self endon( "death" );
    var_0 = _func_0C4( self._id_04A4, "targetname" );
    var_1 = undefined;

    if ( var_0.size )
        var_1 = ::follow_path_get_node;
    else
    {
        var_0 = getentarray( self._id_04A4, "targetname" );
        var_1 = ::follow_path_get_ent;
    }

    while ( isdefined( var_0[0]._id_04A4 ) )
        var_0 = [[ var_1 ]]( var_0[0]._id_04A4, "targetname" );

    waitontruegoal( var_0[0] );
    var_2 = "smoke_";

    if ( !isdefined( self._id_7A99 ) )
        self delete();
    else
        maps\_stealth_logic::_id_8D89( self, var_2 + "idle", var_2 + "react" );
}

waitontruegoal( var_0 )
{
    var_1 = 16;

    if ( isdefined( var_0._id_0351 ) && var_0._id_0351 != 0 )
        var_1 = var_0._id_0351;

    for (;;)
    {
        self waittill( "goal" );

        if ( _func_0EE( self._id_02E2, var_0._id_02E2 ) < var_1 + 10 )
            break;
    }
}

field_waittill_player_near_price()
{
    for (;;)
    {
        if ( _func_0EE( level._id_0318._id_02E2, level._id_6F7C._id_02E2 ) < 256 )
            return;

        var_0 = anglestoforward( level._id_6F7C.angles );
        var_1 = _func_114( level._id_0318._id_02E2 - level._id_6F7C._id_02E2 );

        if ( _func_0F6( var_0, var_1 ) > 0.1 )
            return;

        wait 0.1;
    }
}

field_waittill_player_passed_guards()
{
    for (;;)
    {
        var_0 = ( 0, 225, 0 );
        var_1 = anglestoforward( var_0 );
        var_2 = _id_A5A4::_id_3DC6( "field_guard", "script_noteworthy" );
        var_2 = common_scripts\utility::_id_0CDD( var_2, _id_A5A4::_id_3DC6( "field_guard2", "script_noteworthy" ) );
        var_3 = 1;

        for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        {
            var_5 = _func_114( level._id_0318._id_02E2 - var_2[var_4]._id_02E2 );

            if ( _func_0F6( var_5, var_1 ) < 0 )
                continue;

            var_3 = 0;
        }

        if ( var_3 )
            return;

        wait 0.1;
    }
}

kill_self( var_0 )
{
    var_0 endon( "death" );
    wait 0.1;
    var_0.allowdeath = 1;
    var_0 animscripts\shared::_id_2F6C();
    var_0 _meth_8054();
}

melee_kill( var_0 )
{
    var_0 _meth_809C( "melee_swing_large" );
    var_1 = "generic_pain_russian_" + var_0._id_0179._id_0669._id_13A2.sndnum;
    var_0._id_0179 _meth_809C( var_1 );
    var_0._id_0179 _meth_809C( "melee_hit" );
    var_0._id_0179.allowdeath = 0;
    var_0._id_0179 notify( "anim_death" );
    thread kill_self( var_0._id_0179 );
    level _id_A5A4::_id_27EF( 0.75, _id_A5A4::_id_3AF2, _id_A5A4::_id_70BD, "scoutsniper_mcm_howitsdone" );
}

rag_doll_death( var_0 )
{
    var_0 thread killed_by_player( 1 );
}

killed_by_player( var_0 )
{
    self notify( "killed_by_player_func" );
    self endon( "killed_by_player_func" );

    for (;;)
    {
        self waittill( "death", var_1 );

        if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
            break;
    }

    self notify( "killed_by_player" );

    if ( isdefined( var_0 ) )
    {
        animscripts\shared::_id_2F6C();
        self _meth_8023();
    }
}

rag_doll( var_0 )
{
    var_0 _meth_809C( "generic_pain_russian_1" );
    var_0 thread animscripts\shared::_id_2F6C();
    var_0.a._id_612E = 1;
    var_0 _meth_8054( level._id_0318._id_02E2 );
    var_0 _meth_8023();
}

empty_function( var_0 )
{

}

default_corpse_dialogue()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "_stealth_found_corpse" );

        if ( !_func_1A1( level._id_0318 ) )
            return;

        wait(_func_0B5( 0.5, 1 ));

        if ( !common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        {
            var_0 = _func_0DA( "axis", "all" );

            if ( var_0.size < 2 )
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_nooneleft" );
            else
                level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_goloud" );
        }

        common_scripts\utility::_id_3857( "_stealth_found_corpse" );
    }
}

intro_tableguys_event_awareness()
{
    maps\_stealth_behavior::default_event_awareness( ::default_event_awareness_dialogue, "intro_left_area" );
}

church_event_awareness()
{
    maps\_stealth_behavior::default_event_awareness( ::default_event_awareness_dialogue, "intro_left_area", "church_door_open", "church_area_clear" );
}

default_event_awareness_dialogue()
{
    if ( common_scripts\utility::_id_382E( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_found_corpse" );
    wait(_func_0B5( 0.5, 1 ));

    switch ( _func_0B2( 3 ) )
    {
        case 0:
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_letthemmove" );
            break;
        case 1:
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_anythingstupid" );
            break;
        case 2:
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_notontous" );
            break;
    }
}

player_prone_dof()
{
    for (;;)
    {
        setdefaultdepthoffield();

        while ( self._id_0669._id_5836._id_8AF2 != "prone" )
            wait 0.05;

        setpronedepthoffield();

        while ( self._id_0669._id_5836._id_8AF2 == "prone" )
            wait 0.05;
    }
}

initpronedof()
{
    level.dof_while_prone_enabled = 1;
    level.dofprone["nearStart"] = 10;
    level.dofprone["nearEnd"] = 50;
    level.dofprone["nearBlur"] = 6;
    level.dofreg["nearStart"] = level._id_2C7B["nearStart"];
    level.dofreg["nearEnd"] = level._id_2C7B["nearEnd"];
    level.dofreg["nearBlur"] = level._id_2C7B["nearBlur"];
}

setdefaultdepthoffield()
{
    level._id_2C7B["nearStart"] = level.dofreg["nearStart"];
    level._id_2C7B["nearEnd"] = level.dofreg["nearEnd"];
    level._id_2C7B["nearBlur"] = level.dofreg["nearBlur"];
    level._id_0318 _meth_818B( 0, 0 );
    level._id_0318 _id_A513::setdefaultdepthoffield();
}

setpronedepthoffield()
{
    level._id_2C7B["nearStart"] = level.dofprone["nearStart"];
    level._id_2C7B["nearEnd"] = level.dofprone["nearEnd"];
    level._id_2C7B["nearBlur"] = level.dofprone["nearBlur"];
    level._id_0318 _meth_818B( 10, 50 );
    level._id_0318 _id_A513::setdefaultdepthoffield();
}

try_save( var_0 )
{
    thread try_save_proc( var_0 );
}

try_save_proc( var_0 )
{
    level notify( "try_save" );
    level endon( "try_save" );

    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    if ( common_scripts\utility::_id_382E( "_stealth_alert" ) )
        return;

    if ( common_scripts\utility::_id_382E( "_stealth_found_corpse" ) )
        return;

    level endon( "_stealth_spotted" );
    level endon( "_stealth_alert" );
    level endon( "event_awareness" );
    level endon( "_stealth_found_corpse" );
    level endon( "_stealth_saw_corpse" );
    level thread _id_A5A4::_id_61FD( "kill_save", 5 );
    level endon( "kill_save" );

    if ( common_scripts\utility::_id_382E( "player_threw_nade" ) )
    {
        common_scripts\utility::_id_385B( "player_threw_nade", 4 );

        if ( common_scripts\utility::_id_382E( "player_threw_nade" ) )
            return;

        level endon( "player_threw_nade" );
        wait 1;
    }

    level endon( "player_threw_nade" );

    if ( level._id_0318 _id_A5A4::_id_32D8( "_radiation_poisoning" ) )
    {
        level._id_0318 _id_A5A4::ent_flag_waitopen_or_timeout( "_radiation_poisoning", 4 );

        if ( level._id_0318 _id_A5A4::_id_32D8( "_radiation_poisoning" ) )
            return;

        level._id_0318 endon( "_radiation_poisoning" );
        wait 1;
    }

    level._id_0318 endon( "_radiation_poisoning" );
    waitframe;

    while ( _func_120( "stinger", level._id_0318 _meth_830E() ) )
        wait 0.1;

    _id_A5A4::_id_1143( var_0 );
}

_id_6B33()
{
    common_scripts\utility::_id_383D( "player_threw_nade" );
    level._id_6BA9 = 0;
    notifyoncommand( "player_frag", "+frag" );

    for (;;)
    {
        level._id_0318 waittill( "player_frag" );
        common_scripts\utility::_id_383F( "player_threw_nade" );
        level._id_0318 waittill( "grenade_fire", var_0 );
        thread player_grenade_check2( var_0 );
    }
}

player_grenade_check2( var_0 )
{
    level._id_6BA9++;
    var_0 common_scripts\utility::_id_A0A0( "death", 10 );
    level._id_6BA9--;

    if ( !level._id_6BA9 )
        common_scripts\utility::_id_3831( "player_threw_nade" );
}

jumptoactor( var_0 )
{
    self notify( "overtakenow" );
    self _meth_8051();
    self _meth_8143();
    var_1 = spawn( "script_origin", self._id_02E2 );
    self _meth_804F( var_1 );
    var_1 _meth_82AA( var_0, 0.2 );
    wait 0.25;
    self _meth_8051();
    var_1 delete();
    self._id_588F = 0;
    self _meth_81AA( var_0 );
    self._id_01C4 = 16;
    common_scripts\utility::_id_A0A0( "goal", 1.25 );
    wait 0.1;
    self _meth_81AA( var_0 );
    self._id_01C4 = 16;
}

default_spotted_dialogue()
{
    level endon( "dogs_dog_dead" );
    level endon( "h1_kill_default_spotted_dialogue" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "_stealth_spotted" );

        if ( !_func_1A1( level._id_0318 ) )
            return;

        _id_A5A4::_id_70C9();

        if ( common_scripts\utility::_id_382E( "dogs_dog_dead" ) )
            _id_A5A4::_id_70BD( "scoutsniper_mcm_dogsingrass" );
        else
            _id_A5A4::_id_70BD( "scoutsniper_mcm_spotted" );

        common_scripts\utility::_id_3857( "_stealth_spotted" );
    }
}

pond_dump_bodies()
{
    var_0 = getent( "pond_deadguy1", "script_noteworthy" );
    common_scripts\utility::_id_384A( "pond_thrower_spawned" );
    thread pond_create_body_piles();
    common_scripts\utility::_id_383D( "pond_abort" );
    level endon( "pond_abort" );
    var_1 = _id_A5A4::_id_3DC6( "pond_throwers", "script_noteworthy" );
    var_2 = var_1[0];
    var_3 = var_1[1];
    var_2 thread pond_dump_bodies_check_abort();
    var_3 thread pond_dump_bodies_check_abort();
    var_2 endon( "death" );
    var_3 endon( "death" );
    var_3 waittill( "jumpedout" );
    wait 2;
    var_4 = _id_A5A4::_id_3EB2( "pond_truck", "script_noteworthy" );
    var_5 = var_4._id_02E2;
    var_6 = anglestoforward( var_4.angles );
    var_6 = _id_A5A4::vector_multiply( var_6, -1 );
    var_6 = _id_A5A4::vector_multiply( var_6, 330 );
    var_5 += ( var_6 + ( 0, 0, 16 ) );
    var_7 = spawn( "script_origin", var_5 );
    var_7.angles = ( 0, 180, 0 );
    var_8 = 1;
    var_2.allowdeath = 1;
    var_3.allowdeath = 1;

    for (;;)
    {
        var_2 notify( "single anim", "end" );
        var_7 thread _id_A510::_id_0BC9( var_2, "bodydump_guy1" );
        var_7 thread pond_dump_createbody( "deadguy_throw1" );
        var_7 thread pond_dump_2nd( var_2 );
        var_7 _id_A510::_id_0BC9( var_3, "bodydump_guy2" );
    }
}

pond_dump_2nd( var_0 )
{
    var_0 endon( "death" );
    var_0 waittillmatch( "single anim", "start_deadbody" );
    pond_dump_createbody( "deadguy_throw2" );
}

pond_create_body_piles()
{
    var_0 = ( 24281, -4069.5, -330.5 );
    pond_create_body_pile( ( -27269, 3850, 194 ) + var_0 );
    pond_create_body_pile( ( -27210, 3900, 198 ) + var_0, ( 6, 90, -6 ), 1 );
    pond_create_body_pile( ( -27430, 3900, 180 ) + var_0, ( 8, 120, 0 ) );
}
#using_animtree("generic_human");

pond_create_body_pile( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_0 );
    var_3.angles = ( 0, 0, 0 );
    var_4 = pond_create_drone( var_3, var_0, ( 0, 0, 0 ) );
    var_4 _meth_8117( #animtree );
    var_4 _meth_814D( %covercrouch_death_1 );
    var_4 = pond_create_drone( var_3, var_0 + ( -25, 0, 0 ), ( 0, 0, 0 ) );
    var_4 _meth_8117( #animtree );
    var_4 _meth_814D( %covercrouch_death_2 );
    var_4 = pond_create_drone( var_3, var_0 + ( -20, 40, 0 ), ( 0, -135, 0 ) );
    var_4 _meth_8117( #animtree );
    var_4 _meth_814D( %covercrouch_death_3 );

    if ( !isdefined( var_2 ) )
    {
        var_4 = pond_create_drone( var_3, var_0 + ( -45, 20, -5 ), ( 6, 90, 0 ) );
        var_4 _meth_8117( #animtree );
        var_4 _meth_814D( %corner_standr_death_grenade_slump );
    }

    if ( isdefined( var_1 ) )
    {
        var_3 _meth_82B1( var_1, 0.1 );
        wait 0.15;
    }

    var_3 delete();
}

pond_create_drone( var_0, var_1, var_2 )
{
    var_3 = getent( "pond_deadguy1", "script_noteworthy" );
    var_3.count = 1;
    var_4 = _id_A5A4::_id_2F29( var_3 );
    var_4._id_0398 = undefined;
    var_4._id_01FB = 1;
    var_4._id_01FF = 1;
    var_4._id_04A7 = "neutral";
    var_4 _meth_802A( _func_043( "ak47" ), "TAG_WEAPON_RIGHT" );
    var_4._id_02E2 = var_1;
    var_4.angles = var_3.angles + var_2;
    var_4 _meth_804F( var_0 );
    wait 0.05;
    return var_4;
}

pond_dump_bodies_check_abort()
{
    self endon( "death" );
    _id_A5A4::_id_4462();
    thread maps\_stealth_logic::_id_8DCA();
    thread pond_dump_bodies_abort_thrower();
    thread pond_dump_bodies_abort_thrower2();
    self waittill( "stealth_enemy_endon_alert" );
    common_scripts\utility::_id_383F( "pond_abort" );
    _id_A5A4::_id_4461();
}

pond_dump_bodies_abort_thrower2()
{
    level endon( "pond_abort" );
    self waittill( "death" );
    common_scripts\utility::_id_383F( "pond_abort" );
}

pond_dump_bodies_abort_thrower()
{
    self endon( "death" );
    self endon( "stealth_enemy_endon_alert" );
    common_scripts\utility::_id_384A( "pond_abort" );
    self _meth_8143();
    _id_A5A4::_id_4461();
}

pond_dump_bodies_abort()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "pond_abort" );
    thread pond_dump_bodies_abort2();
    self notify( "ragdoll" );
}

pond_dump_bodies_abort2()
{
    self _meth_8054();
    waitframe;
    self _meth_8023();
}

pond_dump_createbody( var_0 )
{
    level endon( "pond_abort" );
    var_1 = self;
    var_2 = pond_dump_createbody2();

    if ( !_func_1A1( var_2 ) )
    {
        if ( isdefined( var_2 ) )
            var_2 delete();

        return;
    }

    var_2 endon( "ragdoll" );
    var_2 thread pond_dump_bodies_abort();
    var_1 _id_A510::_id_0BC9( var_2, var_0 );
    var_2 delete();
}

pond_dump_createbody2()
{
    var_0 = getent( "pond_deadguy1", "script_noteworthy" );
    var_0.count = 1;
    var_1 = var_0 _meth_8096( 1 );
    _id_A5A4::_id_88F1( var_1 );
    var_1._id_0398 = undefined;
    var_1._id_01FB = 1;
    var_1._id_01FF = 1;
    var_1._id_04A7 = "neutral";
    var_1._id_02A7 = "";
    var_1.a._id_612E = 1;
    var_1 _id_A5A4::_id_4462();

    if ( common_scripts\utility::_id_382E( "pond_abort" ) && isdefined( var_1 ) )
    {
        var_1 delete();
        return undefined;
    }

    return var_1;
}

shootenemywrapper_price()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "animscript_shot" );

        if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
            continue;

        if ( _func_1A1( self._id_0142 ) )
            self._id_0142 _meth_8054();
    }
}

shootenemywrapper_ssnotify( var_0 )
{
    self notify( "animscript_shot" );
    animscripts\utility::_id_83F4( var_0 );
}

player_noprone_water()
{
    var_0 = getent( "water_no_prone", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );
        level._id_0318 _meth_811C( 0 );

        while ( level._id_0318 _meth_80AB( var_0 ) )
            wait 0.2;

        level._id_0318 _meth_811C( 1 );
    }
}

town_kill_dash_heli()
{
    common_scripts\utility::_id_384A( "town_no_turning_back" );
    common_scripts\utility::_id_3857( "_stealth_spotted" );
    common_scripts\utility::_id_3857( "dash_heli_agro" );
    var_0 = _id_A5A4::_id_3EB2( "dash_hind", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    waitframe;
    level endon( "_stealth_spotted" );
    level endon( "dash_heli_agro" );
    var_0 _id_A5A8::volume_down( 6 );
    common_scripts\utility::_id_383F( "dash_hind_deleted" );
    wait 0.5;
    var_0 delete();
}

dash_reset_stealth_to_default()
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    common_scripts\utility::_id_383F( "dash_reset_stealth_to_default" );

    if ( _func_1A1( level._id_6F7C ) && !isdefined( level._id_6F7C._id_58D7 ) )
        level._id_6F7C _id_A5A4::_id_27EF( 0.1, _id_A5A4::_id_58D7 );

    var_0 = _func_0DA( "axis", "all" );
    var_1 = [];
    var_1["spotted"] = ::town_state_spotted;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_0[var_2] maps\_stealth_behavior::enemy_default_ai_functions( "state" );
        var_0[var_2] maps\_stealth_behavior::ai_change_ai_functions( "state", var_1 );
        var_0[var_2] maps\_stealth_behavior::enemy_default_ai_functions( "corpse" );
        var_0[var_2] maps\_stealth_behavior::enemy_default_ai_functions( "awareness" );
    }
}

town_state_spotted()
{
    var_0 = "_stealth_spotted";
    var_1 = "_stealth_detection_level_change" + var_0;
    thread maps\_stealth_behavior::state_change_ender( var_0, var_1 );
    level endon( var_1 );
    self endon( "death" );
    self._id_019B = 0.01;
    self._id_01FB = 0;

    if ( self._id_04D9 != "dog" )
    {
        self._id_011F = 0;
        _id_A5A4::_id_1ED1();
        self._id_1300 = 1;
        self.accuracy = 1;
        self._id_017D = 0;
        maps\_stealth_behavior::_id_327E();
    }

    if ( !_func_1A1( self._id_0142 ) )
        common_scripts\utility::_id_A0A0( "enemy", _func_0B5( 1, 3 ) );

    if ( self._id_04D9 == "dog" )
        self._id_0179 = level._id_0318;
}

mission_dialogue_array( var_0, var_1, var_2 )
{
    if ( !var_0.size )
        return;

    if ( !var_1.size )
        return;

    thread mission_dialogue_array_proc( var_0, var_1, var_2 );
}

mission_dialogue_array_proc( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        common_scripts\utility::_id_384A( var_2 );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !_func_1A1( var_0[var_3] ) )
            return;

        if ( var_0[var_3] _id_A5A4::_id_32D8( "mission_dialogue_kill" ) )
            return;

        var_0[var_3] endon( "mission_dialogue_kill" );
        var_0[var_3] endon( "death" );
    }

    var_4 = 0;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_0[var_4] mission_dialogue( var_1[var_3] );
        var_4++;

        if ( var_4 >= var_0.size )
            var_4 = 0;
    }
}

mission_dialogue( var_0 )
{
    if ( !_func_1A1( self ) || _id_A5A4::_id_32D8( "mission_dialogue_kill" ) )
        return;

    thread _id_69C1( var_0 );
    self waittill( "play_sound_done" );
}

mission_dialogue_kill_sound()
{
    _id_A5A4::_id_32E0( "mission_dialogue_kill" );
    self _meth_80AE();
}

mission_dialogue_kill()
{
    self endon( "death" );
    _id_A5A4::_id_32DD( "mission_dialogue_kill" );
    mission_dialogue_kill_wait();
    _id_A5A4::_id_32DE( "mission_dialogue_kill" );
}

mission_dialogue_kill_wait()
{
    self endon( "death" );
    self endon( "event_awareness" );
    self endon( "enemy" );
    level endon( "_stealth_spotted" );
    common_scripts\utility::_id_384C( "_stealth_alert", "_stealth_spotted", "_stealth_found_corpse" );
}

_id_69C1( var_0 )
{
    if ( _id_A5A4::_id_5014() )
        return;

    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 endon( "death" );
    thread _id_A5A4::_id_2826( var_1, "sounddone" );
    var_1._id_02E2 = self._id_02E2;
    var_1.angles = self.angles;
    var_1 _meth_804F( self );
    var_1 _meth_809C( var_0, "sounddone" );
    play_sound_wait( var_1 );

    if ( _func_1A1( self ) )
        self notify( "play_sound_done" );

    var_1 _meth_80AE();
    wait 0.05;
    var_1 delete();
}

play_sound_wait( var_0 )
{
    self endon( "death" );
    self endon( "mission_dialogue_kill" );
    var_0 waittill( "sounddone" );
}

dash_state_spotted()
{
    level endon( "_stealth_detection_level_change" );
    self._id_1300 = self._id_0669._id_13A2.badaccuracy;
    self.accuracy = self._id_0669._id_13A2.badaccuracy;
    self._id_01D0 = self._id_0669._id_13A2._id_63CE;
    self _meth_8143();
    self._id_01FF = 0;
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self _meth_81A7( 0 );
    self _meth_81CE( "prone" );
}

intro_attack_logic( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    self endon( "_stealth_stop_stealth_behavior" );
    thread maps\_stealth_behavior::_id_31FA( self._id_02E2 );
    thread intro_close_in_on_target();
}

intro_close_in_on_target()
{
    var_0 = 2048;
    self._id_01C4 = var_0;

    if ( isdefined( self._id_7AE2 ) )
        return;

    self endon( "death" );
    self endon( "_stealth_stop_stealth_behavior" );

    while ( isdefined( self._id_0142 ) )
    {
        var_1 = self._id_0142._id_02E2;

        if ( self _meth_81C7( var_1 ) )
            self _meth_81AA( var_1 );
        else
        {
            var_2 = maps\_stealth_behavior::enemy_get_closest_pathnodes( 400, var_1 );

            if ( var_2.size )
                self _meth_81AA( var_2[0]._id_02E2 );
        }

        self._id_01C4 = var_0;

        if ( var_0 > 600 )
            var_0 *= 0.75;

        wait 15;
    }
}

clean_corpse( var_0 )
{
    common_scripts\utility::_id_384A( var_0 );

    if ( !level._id_0669._id_5836._id_222C._id_0CD8.size )
        return;

    clearallcorpses();
}

field_handle_cleanup()
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    common_scripts\utility::_id_384A( "field_clean" );
    var_0 = _id_A5A4::_id_3DC6( "field_guard", "script_noteworthy" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3DC6( "field_guard2", "script_noteworthy" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread field_handle_cleanup2();
}

pond_handle_behavior_change()
{
    common_scripts\utility::_id_384A( "field_clean" );
    var_0 = _id_A5A4::_id_3DC6( "pond_patrol", "script_noteworthy" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3DC6( "pond_throwers", "script_noteworthy" ) );
    var_0 = common_scripts\utility::_id_0CDD( var_0, _id_A5A4::_id_3DC6( "pond_backup", "script_noteworthy" ) );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] maps\_stealth_behavior::enemy_default_ai_functions( "corpse" );
        var_0[var_1] maps\_stealth_behavior::enemy_default_ai_functions( "awareness" );
    }
}

field_handle_cleanup2()
{
    self endon( "death" );
    var_0 = 2500;
    var_1 = var_0 * var_0;

    while ( _func_0F0( level._id_0318._id_02E2, self._id_02E2 ) < var_1 || self _meth_81C2( level._id_0318 ) )
        wait 0.5;

    self delete();
}

hint_setup()
{
    _id_A5A4::_id_7DF3();
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "popmenu_bg" );
    precachestring( &"SCOUTSNIPER_HINT_PRONE_STANCE" );
    precachestring( &"SCOUTSNIPER_HINT_PRONE" );
    precachestring( &"SCOUTSNIPER_HINT_PRONE_TOGGLE" );
    precachestring( &"SCOUTSNIPER_HINT_PRONE_HOLD" );
    precachestring( &"SCOUTSNIPER_HINT_PRONE_DOUBLE" );
    level.actionbinds = [];
    registeractionbinding( "prone", "+stance", &"SCOUTSNIPER_HINT_PRONE_STANCE" );
    registeractionbinding( "prone", "goprone", &"SCOUTSNIPER_HINT_PRONE" );
    registeractionbinding( "prone", "toggleprone", &"SCOUTSNIPER_HINT_PRONE_TOGGLE" );
    registeractionbinding( "prone", "+prone", &"SCOUTSNIPER_HINT_PRONE_HOLD" );
    registeractionbinding( "prone", "lowerstance", &"SCOUTSNIPER_HINT_PRONE_DOUBLE" );
    initkeys();
    updatekeysforbindings();
    _id_A5A4::_id_27EF( 1, ::pronehint );
}

pronehint()
{
    level._id_0318 endon( "kill_prone_hint" );
    level._id_0318 endon( "death" );
    thread printhint2( "kill_prone_hint" );
    common_scripts\utility::_id_384A( "prone_hint" );
    thread keyhint( "prone", 8, 1 );
}

printhint2( var_0 )
{
    level._id_0318 endon( "death" );

    while ( level._id_0318._id_0669._id_5836._id_8AF2 != "prone" )
        wait 0.2;

    level._id_0318 notify( var_0 );
}

keyhint( var_0, var_1, var_2 )
{
    if ( getdvar( "chaplincheat" ) == "1" )
        return;

    _id_1EBE();
    level endon( "clearing_hints" );
    var_3 = getactionbind( var_0 );
    _id_A5A4::_id_48B0( var_3._id_48B0 );
    var_4 = "did_action_" + var_0;

    if ( !isdefined( var_2 ) )
    {
        for ( var_5 = 0; var_5 < level.actionbinds[var_0].size; var_5++ )
        {
            var_3 = level.actionbinds[var_0][var_5];
            notifyoncommand( var_4, var_3.binding );
        }
    }
    else
        thread printhint2( var_4 );

    if ( isdefined( var_1 ) )
        level._id_0318 thread notifyontimeout( var_4, var_1 );

    level._id_0318 waittill( var_4 );
    _id_A5A4::_id_48CB( 0.5 );
}

_id_1EBE()
{
    _id_A5A4::_id_48CB( 0 );
    level notify( "clearing_hints" );
}

getactionbind( var_0 )
{
    for ( var_1 = 0; var_1 < level.actionbinds[var_0].size; var_1++ )
    {
        var_2 = level.actionbinds[var_0][var_1];
        var_3 = _func_0E0( var_2.binding );

        if ( !var_3["count"] )
            continue;

        return level.actionbinds[var_0][var_1];
    }

    return level.actionbinds[var_0][0];
}

notifyontimeout( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    self notify( var_0 );
}

registeractionbinding( var_0, var_1, var_2 )
{
    if ( !isdefined( level.actionbinds[var_0] ) )
        level.actionbinds[var_0] = [];

    var_3 = spawnstruct();
    var_3.binding = var_1;
    var_3._id_48B0 = var_2;
    var_3.keytext = undefined;
    var_3.hinttext = undefined;
    precachestring( var_2 );
    level.actionbinds[var_0][level.actionbinds[var_0].size] = var_3;
}

initkeys()
{
    level.kbkeys = "1234567890-=qwertyuiop[]asdfghjkl;'zxcvbnm,./";
    level.specialkeys = [];
    level.specialkeys[level.specialkeys.size] = "TAB";
    level.specialkeys[level.specialkeys.size] = "ENTER";
    level.specialkeys[level.specialkeys.size] = "ESCAPE";
    level.specialkeys[level.specialkeys.size] = "SPACE";
    level.specialkeys[level.specialkeys.size] = "BACKSPACE";
    level.specialkeys[level.specialkeys.size] = "UPARROW";
    level.specialkeys[level.specialkeys.size] = "DOWNARROW";
    level.specialkeys[level.specialkeys.size] = "LEFTARROW";
    level.specialkeys[level.specialkeys.size] = "RIGHTARROW";
    level.specialkeys[level.specialkeys.size] = "ALT";
    level.specialkeys[level.specialkeys.size] = "CTRL";
    level.specialkeys[level.specialkeys.size] = "SHIFT";
    level.specialkeys[level.specialkeys.size] = "CAPSLOCK";
    level.specialkeys[level.specialkeys.size] = "F1";
    level.specialkeys[level.specialkeys.size] = "F2";
    level.specialkeys[level.specialkeys.size] = "F3";
    level.specialkeys[level.specialkeys.size] = "F4";
    level.specialkeys[level.specialkeys.size] = "F5";
    level.specialkeys[level.specialkeys.size] = "F6";
    level.specialkeys[level.specialkeys.size] = "F7";
    level.specialkeys[level.specialkeys.size] = "F8";
    level.specialkeys[level.specialkeys.size] = "F9";
    level.specialkeys[level.specialkeys.size] = "F10";
    level.specialkeys[level.specialkeys.size] = "F11";
    level.specialkeys[level.specialkeys.size] = "F12";
    level.specialkeys[level.specialkeys.size] = "INS";
    level.specialkeys[level.specialkeys.size] = "DEL";
    level.specialkeys[level.specialkeys.size] = "PGDN";
    level.specialkeys[level.specialkeys.size] = "PGUP";
    level.specialkeys[level.specialkeys.size] = "HOME";
    level.specialkeys[level.specialkeys.size] = "END";
    level.specialkeys[level.specialkeys.size] = "MOUSE1";
    level.specialkeys[level.specialkeys.size] = "MOUSE2";
    level.specialkeys[level.specialkeys.size] = "MOUSE3";
    level.specialkeys[level.specialkeys.size] = "MOUSE4";
    level.specialkeys[level.specialkeys.size] = "MOUSE5";
    level.specialkeys[level.specialkeys.size] = "MWHEELUP";
    level.specialkeys[level.specialkeys.size] = "MWHEELDOWN";
    level.specialkeys[level.specialkeys.size] = "AUX1";
    level.specialkeys[level.specialkeys.size] = "AUX2";
    level.specialkeys[level.specialkeys.size] = "AUX3";
    level.specialkeys[level.specialkeys.size] = "AUX4";
    level.specialkeys[level.specialkeys.size] = "AUX5";
    level.specialkeys[level.specialkeys.size] = "AUX6";
    level.specialkeys[level.specialkeys.size] = "AUX7";
    level.specialkeys[level.specialkeys.size] = "AUX8";
    level.specialkeys[level.specialkeys.size] = "AUX9";
    level.specialkeys[level.specialkeys.size] = "AUX10";
    level.specialkeys[level.specialkeys.size] = "AUX11";
    level.specialkeys[level.specialkeys.size] = "AUX12";
    level.specialkeys[level.specialkeys.size] = "AUX13";
    level.specialkeys[level.specialkeys.size] = "AUX14";
    level.specialkeys[level.specialkeys.size] = "AUX15";
    level.specialkeys[level.specialkeys.size] = "AUX16";
    level.specialkeys[level.specialkeys.size] = "KP_HOME";
    level.specialkeys[level.specialkeys.size] = "KP_UPARROW";
    level.specialkeys[level.specialkeys.size] = "KP_PGUP";
    level.specialkeys[level.specialkeys.size] = "KP_LEFTARROW";
    level.specialkeys[level.specialkeys.size] = "KP_5";
    level.specialkeys[level.specialkeys.size] = "KP_RIGHTARROW";
    level.specialkeys[level.specialkeys.size] = "KP_END";
    level.specialkeys[level.specialkeys.size] = "KP_DOWNARROW";
    level.specialkeys[level.specialkeys.size] = "KP_PGDN";
    level.specialkeys[level.specialkeys.size] = "KP_ENTER";
    level.specialkeys[level.specialkeys.size] = "KP_INS";
    level.specialkeys[level.specialkeys.size] = "KP_DEL";
    level.specialkeys[level.specialkeys.size] = "KP_SLASH";
    level.specialkeys[level.specialkeys.size] = "KP_MINUS";
    level.specialkeys[level.specialkeys.size] = "KP_PLUS";
    level.specialkeys[level.specialkeys.size] = "KP_NUMLOCK";
    level.specialkeys[level.specialkeys.size] = "KP_STAR";
    level.specialkeys[level.specialkeys.size] = "KP_EQUALS";
    level.specialkeys[level.specialkeys.size] = "PAUSE";
    level.specialkeys[level.specialkeys.size] = "SEMICOLON";
    level.specialkeys[level.specialkeys.size] = "COMMAND";
    level.specialkeys[level.specialkeys.size] = "181";
    level.specialkeys[level.specialkeys.size] = "191";
    level.specialkeys[level.specialkeys.size] = "223";
    level.specialkeys[level.specialkeys.size] = "224";
    level.specialkeys[level.specialkeys.size] = "225";
    level.specialkeys[level.specialkeys.size] = "228";
    level.specialkeys[level.specialkeys.size] = "229";
    level.specialkeys[level.specialkeys.size] = "230";
    level.specialkeys[level.specialkeys.size] = "231";
    level.specialkeys[level.specialkeys.size] = "232";
    level.specialkeys[level.specialkeys.size] = "233";
    level.specialkeys[level.specialkeys.size] = "236";
    level.specialkeys[level.specialkeys.size] = "241";
    level.specialkeys[level.specialkeys.size] = "242";
    level.specialkeys[level.specialkeys.size] = "243";
    level.specialkeys[level.specialkeys.size] = "246";
    level.specialkeys[level.specialkeys.size] = "248";
    level.specialkeys[level.specialkeys.size] = "249";
    level.specialkeys[level.specialkeys.size] = "250";
    level.specialkeys[level.specialkeys.size] = "252";
}

updatekeysforbindings()
{
    if ( level._id_2153 )
    {
        setkeyforbinding( _func_095( "BUTTON_START" ), "BUTTON_START" );
        setkeyforbinding( _func_095( "BUTTON_A" ), "BUTTON_A" );
        setkeyforbinding( _func_095( "BUTTON_B" ), "BUTTON_B" );
        setkeyforbinding( _func_095( "BUTTON_X" ), "BUTTON_X" );
        setkeyforbinding( _func_095( "BUTTON_Y" ), "BUTTON_Y" );
        setkeyforbinding( _func_095( "BUTTON_LSTICK" ), "BUTTON_LSTICK" );
        setkeyforbinding( _func_095( "BUTTON_RSTICK" ), "BUTTON_RSTICK" );
        setkeyforbinding( _func_095( "BUTTON_LSHLDR" ), "BUTTON_LSHLDR" );
        setkeyforbinding( _func_095( "BUTTON_RSHLDR" ), "BUTTON_RSHLDR" );
        setkeyforbinding( _func_095( "BUTTON_LTRIG" ), "BUTTON_LTRIG" );
        setkeyforbinding( _func_095( "BUTTON_RTRIG" ), "BUTTON_RTRIG" );
    }
    else
    {
        for ( var_0 = 0; var_0 < level.kbkeys.size; var_0++ )
            setkeyforbinding( _func_095( level.kbkeys[var_0] ), level.kbkeys[var_0] );

        for ( var_0 = 0; var_0 < level.specialkeys.size; var_0++ )
            setkeyforbinding( _func_095( level.specialkeys[var_0] ), level.specialkeys[var_0] );
    }
}

setkeyforbinding( var_0, var_1 )
{
    if ( var_0 == "" )
        return;

    var_2 = _func_1D3( level.actionbinds );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = level.actionbinds[var_2[var_3]];

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            if ( var_4[var_5].binding != var_0 )
                continue;

            var_4[var_5].key = var_1;
        }
    }
}

h1_dash_container_door_push1( var_0 )
{
    var_1 = getent( "dash_door_right", "script_noteworthy" );
    var_2 = getent( "dash_door_left", "script_noteworthy" );
    common_scripts\utility::_id_383F( "dash_door_R_open" );
    var_1 _meth_809C( "door_cargo_container_push_open" );
    var_1 dash_door_slow( 1 );
}

h1_dash_container_door_push2( var_0 )
{
    var_1 = getent( "dash_door_right", "script_noteworthy" );
    var_2 = getent( "dash_door_left", "script_noteworthy" );
    common_scripts\utility::_id_383F( "dash_door_L_open" );
    var_1 thread dash_door_fast( 0.35 );
    var_2 thread dash_door_fast( -1.35 );
    var_2 _meth_809C( "door_cargo_container_burst_open" );
    var_3 = getent( "price_intro_path", "targetname" );
    _id_A5A4::_id_27EF( 0.25, ::scoutsniper_music_play, "scoutsniper_dash_music" );
    _id_A5A4::_id_7E45( "sprint_h1", 1, 0 );
    level endon( "_stealth_spotted" );

    if ( getdvarint( "use_old_jeep_cover" ) == 1 )
    {
        var_3 = _func_0C3( "dash_price_node2", "targetname" );
        level._id_6F7C scoutsniper_follow_path( var_3 );
    }
    else
    {
        level.jeep_cover_node = spawn( "script_origin", ( 1927.02, -372.321, -85.683 ) );
        level.jeep_cover_node _id_A510::_id_0BFF( level._id_6F7C, "jeep_cover_run_to_idle" );
    }
}

price_custom_detection( var_0, var_1, var_2 )
{
    self endon( "death" );
    level endon( "price_stop_custom_detection" );
    level endon( "_stealth_spotted" );

    if ( isdefined( var_1 ) )
        level endon( var_1 );

    if ( !isdefined( var_0 ) )
        var_0 = 300;

    for (;;)
    {
        var_3 = _func_0D9( "axis" );

        foreach ( var_5 in var_3 )
        {
            if ( getdvar( "debug_price_custom_detection" ) == "1" )
                thread _id_A5A4::_id_2DA2( var_5._id_02E2, var_0, 1, 0, 0, 0.1 );

            if ( _func_0F0( self._id_02E2, var_5._id_02E2 ) < var_0 * var_0 )
            {
                if ( isdefined( var_2 ) && var_2 )
                {
                    if ( !_func_08E( var_5 _meth_80AA(), self._id_02E2, 0, var_5 ) )
                        continue;
                }

                common_scripts\utility::_id_383F( "_stealth_spotted" );
            }
        }

        wait 0.1;
    }
}

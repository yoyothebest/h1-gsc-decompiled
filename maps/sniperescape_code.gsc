// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

move_in()
{
    level endon( "movein_trigger" + self._id_04A4 );

    if ( !isdefined( level.move_in_trigger_used[self._id_04A4] ) )
    {
        level.move_in_trigger_used[self._id_04A4] = 1;
        var_0 = spawn_guys_from_targetname( self._id_04A4 );
        common_scripts\utility::_id_0D13( var_0, ::stay_put );
        common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_7E5D, 1 );
        level.move_in_trigger_used[self._id_04A4] = var_0;
    }

    self waittill( "trigger" );
    var_0 = level.move_in_trigger_used[self._id_04A4];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !_func_1A1( var_0[var_1] ) )
            continue;

        if ( var_0[var_1] isdog() )
            var_0[var_1] delete();
    }

    var_0 = _id_A5A4::_id_733F( var_0 );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_7E5D, 0 );
    common_scripts\utility::_id_0D13( var_0, ::ai_move_in );
    self notify( "movein_trigger" + self._id_04A4 );
}

spawn_guys_from_targetname( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_4.count = 1;
        var_5 = var_4 _id_A5A4::_id_88C3( 1 );
        _id_A5A4::_id_88F1( var_5 );

        if ( _func_1A1( var_5 ) )
            var_1[var_1.size] = var_5;

        if ( 1 )
            continue;

        var_1[var_1.size] = var_5;
    }

    return var_1;
}

chase_chopper_guys_land()
{
    self endon( "death" );
    self waittill( "jumpedout" );

    if ( common_scripts\utility::_id_382E( "enter_burnt" ) )
    {
        var_0 = _func_0C4( "park_delete_node", "targetname" );
        thread fall_back_and_delete( var_0 );
        return;
    }

    thread ai_move_in();
}

chopper_guys_land()
{
    self endon( "death" );
    self waittill( "jumpedout" );

    if ( common_scripts\utility::_id_382E( "player_defends_heat_area" ) )
    {
        var_0 = _func_0C3( "enemy_flee_node", "targetname" );
        thread flee_heat_area( var_0 );
        return;
    }

    thread ai_move_in();
}

not_move_in_guy()
{
    if ( isdefined( self.dontmovein ) )
        return 1;

    if ( !isdefined( self._id_0398 ) )
        return 0;

    return self._id_0398 == "apartment_hunter";
}

ai_move_in()
{
    if ( !_func_1A1( self ) )
        return;

    if ( not_move_in_guy() )
        return;

    self endon( "death" );
    self endon( "stop_moving_in" );
    self notify( "stop_going_to_node" );

    if ( isdefined( self._id_04A4 ) )
        _id_A581::_id_4241();

    thread reacquire_player_pos();
}

stop_moving_in()
{
    self.dontmovein = 1;
    self notify( "stop_moving_in" );
}

reacquire_player_pos()
{
    self notify( "stop_moving_in" );
    self endon( "stop_moving_in" );
    self endon( "death" );

    for (;;)
    {
        self _meth_81AA( level._id_0318._id_02E2 );
        self._id_01C4 = 1500;
        wait 5;
    }
}

stay_put()
{
    self _meth_81AA( self._id_02E2 );
    self._id_01C4 = 64;
}

debounce_think()
{
    if ( !isdefined( self._id_7A26 ) )
        return;

    var_0 = _func_124( self._id_7A26, " " );
    common_scripts\utility::_id_0CF0( var_0, ::add_trigger_to_debounce_list, self );
    self waittill( "trigger" );
    common_scripts\utility::_id_0CF0( var_0, ::delete_trigger_with_linkname );
    common_scripts\utility::_id_0CF0( var_0, ::turn_off_triggers_from_links, 3 );

    for (;;)
    {
        self waittill( "trigger" );
        common_scripts\utility::_id_0CF0( var_0, ::turn_off_triggers_from_links, 3 );
        wait 1;
    }
}

turn_off_triggers_from_links( var_0, var_1 )
{
    common_scripts\utility::_id_0D13( level.debounce_triggers[var_0], ::turn_off_trigger_for_time, var_1 );
}

turn_off_trigger_for_time( var_0 )
{
    self notify( "new_debouce" );
    self endon( "new_debouce" );
    self endon( "death" );
    common_scripts\utility::_id_97CC();
    wait(var_0);
    common_scripts\utility::_id_97CE();
}

delete_trigger_with_linkname( var_0 )
{
    var_1 = getent( var_0, "script_linkname" );

    if ( !isdefined( var_1 ) )
        return;

    if ( isdefined( var_1._id_7A26 ) )
    {
        var_2 = _func_124( var_1._id_7A26, " " );
        common_scripts\utility::_id_0CF0( var_2, ::remove_trigger_from_debounce_lists, var_1 );
        var_1 common_scripts\utility::_id_97CC();
    }
}

add_trigger_to_debounce_list( var_0, var_1 )
{
    if ( !isdefined( level.debounce_triggers[var_0] ) )
        level.debounce_triggers[var_0] = [];

    level.debounce_triggers[var_0][level.debounce_triggers[var_0].size] = var_1;
}

remove_trigger_from_debounce_lists( var_0, var_1 )
{
    var_2 = _func_1D3( level.debounce_triggers[var_0] );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( level.debounce_triggers[var_0][var_4] != var_1 )
            continue;

        level.debounce_triggers[var_0][var_4] = undefined;
        return;
    }
}

enemy_override()
{
    self.accuracy = 0.2;
    var_0 = self._id_014E;
    var_1 = self._id_014F;
    var_2 = self._id_014C;
    var_3 = self._id_014D;

    if ( isdefined( level.engagement_dist_func[self.classname] ) )
        [[ level.engagement_dist_func[self.classname] ]]();
    else
        return;

    self endon( "death" );
    self waittill( "enemy" );

    for (;;)
    {
        wait(_func_0B3( 5 ));

        if ( !isdefined( self._id_02BB ) )
            continue;

        if ( !isdefined( self._id_0142 ) )
            continue;

        if ( _func_0EE( self._id_02E2, self._id_02BB._id_02E2 ) > 128 )
            continue;

        var_4 = self._id_014E - 150;
        var_5 = self._id_014F - 150;
        var_6 = self._id_014C - 150;
        var_7 = self._id_014D - 150;

        if ( var_4 < var_0 )
            var_4 = var_0;

        if ( var_5 < var_1 )
            var_5 = var_1;

        if ( var_6 < var_2 )
            var_6 = var_2;

        if ( var_7 < var_3 )
            var_7 = var_3;

        self _meth_8170( var_4, var_5 );
        self _meth_8171( var_6, var_7 );
        wait 12;
    }
}

engagement_shotgun()
{
    self _meth_8170( 900, 700 );
    self _meth_8171( 1000, 1200 );
}

engagement_rifle()
{
    self _meth_8170( 1200, 1000 );
    self _meth_8171( 1400, 2000 );
}

engagement_sniper()
{
    self _meth_8170( 1600, 1200 );
    self _meth_8171( 1800, 2000 );
}

engagement_smg()
{
    self _meth_8170( 900, 700 );
    self _meth_8171( 1000, 1200 );
}

engagement_gun()
{
    self _meth_8170( 1600, 1200 );
    self _meth_8171( 1800, 2000 );
}

group1_enemies_think( var_0 )
{
    var_0.count++;
    self waittill( "death" );
    var_0.count--;

    if ( var_0.count <= 1 )
        _id_A5A4::_id_0709( "group2_movein" );
}

increment_count_and_spawn()
{
    self.count = 1;
    _id_A5A4::_id_88C3();
}

heat_spawners_attack( var_0, var_1, var_2 )
{
    level endon( "heat_enemies_back_off" );

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    if ( !isdefined( level._id_382E[var_2] ) )
        common_scripts\utility::_id_383D( var_2 );

    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::chase_friendlies );
    var_3 = 1;

    if ( level._id_3BFE > 1 )
        var_3 = 2;

    for (;;)
    {
        common_scripts\utility::_id_3857( var_2 );
        var_4 = _func_0D9( "axis" ).size;

        if ( var_4 > 14 )
        {
            wait(_func_0B5( 1, 2 ));
            continue;
        }

        common_scripts\utility::_id_384A( var_1 );

        if ( common_scripts\utility::_id_382E( var_2 ) )
            continue;

        var_5 = common_scripts\utility::_id_0CF5( var_0 );
        spawn_limited_number_from_spawners( var_5, var_5, 3, var_3 );
        wait 0.05;
    }
}

leave_one_think()
{
    var_0 = getentarray( self._id_04A4, "targetname" );
    self waittill( "trigger" );
    var_1 = common_scripts\utility::_id_710E( var_0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == var_1 )
            continue;

        var_0[var_2] delete();
    }
}

objective_position_update( var_0 )
{
    level endon( "stop_updating_objective" );
    objective_onentity( var_0, self );

    for (;;)
        wait 0.05;
}

add_engagement_func( var_0, var_1 )
{
    level.engagement_dist_func[var_0] = var_1;
}

enemy_accuracy_assignment()
{
    level.last_callout_direction = "";
    level.next_enemy_call_out = 0;
    level endon( "stop_adjusting_enemy_accuracy" );
    level.callout_near_dist = 250;

    for (;;)
    {
        wait 0.05;
        var_0 = _func_0D9( "axis" );
        var_1 = [];

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            if ( _func_0EE( level._id_0318._id_02E2, var_0[var_2]._id_02E2 ) < 500 )
            {
                var_0[var_2]._id_1300 = 1;
                continue;
            }

            var_1[var_1.size] = var_0[var_2];
        }

        var_3 = level._id_0318 _meth_8338();
        var_4 = anglestoforward( var_3 );

        if ( !var_1.size )
            continue;

        var_0 = var_1;
        var_5 = 1;
        var_6 = 0;
        var_7 = [];
        var_7[var_5] = [];
        var_7[var_6] = [];
        var_8 = [];
        var_9 = 1;
        var_10 = undefined;

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            var_11 = var_0[var_2];
            var_12 = _func_114( var_11._id_02E2 - level._id_0318._id_02E2 );
            var_13 = _func_0F6( var_4, var_12 );
            var_11._id_2D80 = var_13;
            var_14 = var_13 > 0.8;
            var_7[var_14][var_7[var_14].size] = var_11;

            if ( var_13 < var_9 )
            {
                var_9 = var_13;
                var_10 = var_11;
            }
        }

        for ( var_2 = 0; var_2 < var_7[var_5].size; var_2++ )
            var_7[var_5][var_2]._id_1300 = 0.7;

        for ( var_2 = 0; var_2 < var_7[var_6].size; var_2++ )
        {
            var_7[var_6][var_2]._id_1300 = 0.2;
            var_7[var_6][var_2]._id_04B1 = 0;
        }

        if ( isdefined( var_10 ) )
        {

        }
    }
}

ai_is_near_teammates( var_0 )
{
    var_1 = _func_0D9( self._id_04A7 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == self )
            continue;

        if ( _func_0EE( self._id_02E2, var_1[var_2]._id_02E2 ) <= var_0 )
            return 1;
    }

    return 0;
}

new_enemy_callout( var_0 )
{
    if ( !common_scripts\utility::_id_382E( "price_calls_out_enemy_location" ) )
        return;

    if ( gettime() < level.next_enemy_call_out )
        return;

    if ( !_func_1A1( level._id_6F7C ) )
        return;

    var_1 = level.callout_near_dist;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !var_3 _meth_81C2( level._id_0318 ) )
            continue;

        if ( var_3._id_2D80 >= 0.2 )
            continue;

        if ( !var_3 ai_is_near_teammates( var_1 ) )
            continue;

        price_calls_out_guy( var_3 );
        return;
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !var_3 _meth_81C2( level._id_0318 ) )
            continue;

        if ( !var_3 ai_is_near_teammates( var_1 ) )
            continue;

        var_3 = var_0[var_2];
        price_calls_out_guy( var_3 );
        return;
    }
}

price_clears_dialogue()
{
    _id_A5A4::_id_70C9();
    level.price_dialogue_master delete();
    create_price_dialogue_master();
}

create_price_dialogue_master()
{
    level.price_dialogue_master = spawn( "script_origin", ( 0, 0, 0 ) );
    level.price_dialogue_master.last_dialogue_line = -5000;
}

price_line( var_0 )
{
    if ( isdefined( level._id_78BA["price"][var_0] ) )
        level.price_dialogue_master _id_A5A4::_id_3AF2( ::play_sound_on_price, level._id_78BA["price"][var_0] );
    else
        level.price_dialogue_master _id_A5A4::_id_3AF2( ::play_sound_on_player, var_0 );
}

play_sound_on_price( var_0 )
{
    _id_A5A4::_id_9F8C( self.last_dialogue_line, 1 );

    if ( !isdefined( self ) )
        return;

    if ( _func_1A1( level._id_6F7C ) )
        self _meth_804F( level._id_6F7C, "tag_eye", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    else
        self _meth_804F( level._id_0318, "", ( 0, 0, 60 ), ( 0, 0, 0 ) );

    _id_A5A4::_id_69C5( var_0, "", 1 );

    if ( !isdefined( self ) )
        return;

    self.last_dialogue_line = gettime();
}

play_sound_on_player( var_0 )
{
    _id_A5A4::_id_9F8C( self.last_dialogue_line, 1 );

    if ( !isdefined( self ) )
        return;

    _id_A5A4::_id_70BD( var_0 );

    if ( !isdefined( self ) )
        return;

    self.last_dialogue_line = gettime();
}

price_is_talking()
{
    if ( !isdefined( level.price_dialogue_master ) )
        return 0;

    if ( !isdefined( level.price_dialogue_master._id_3AF2 ) )
        return 0;

    return level.price_dialogue_master._id_3AF2.size > 0;
}

price_calls_out_guy( var_0 )
{
    if ( !common_scripts\utility::_id_382E( "price_cuts_to_woods" ) )
        return;

    var_1 = getentarray( "incoming_trigger", "targetname" );
    var_2 = "enemies";

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_0 _meth_80AB( var_1[var_3] ) )
        {
            var_2 = var_1[var_3]._id_793E;
            break;
        }
    }

    var_4 = animscripts\battlechatter::_id_3F5A( level._id_0318._id_02E2, var_0._id_02E2 );

    if ( var_4 == level.last_callout_direction )
        return;

    level.last_callout_direction = var_4;
    level.next_enemy_call_out = gettime() + _func_0B5( 4500, 6500 );
    price_line( var_2 + "_" + var_4 );
}

player_hit_debug()
{
    level._id_0318 endon( "death" );

    for (;;)
    {
        level._id_0318 waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_1 ) )
            continue;
    }
}

delete_living()
{
    if ( _func_1A1( self ) )
        self delete();
}

heli_attacks_start()
{
    var_0 = _id_A5A8::_id_8979( "heli_attacks_start" );
    var_0 _id_A5AA::helipath( var_0._id_04A4, 70, 70 );
}

heli_trigger()
{
    var_0 = [];

    if ( isdefined( self._id_04A4 ) )
    {
        self waittill( "trigger" );
        var_1 = _id_A5A8::_id_8979( self._id_04A4 );
        var_0[var_0.size] = var_1;
    }
    else
    {
        level waittill( "vehiclegroup spawned" + self._id_7B1A, var_2 );
        var_0 = var_2;
    }

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_1 = var_0[var_3];
        var_1 _id_A5AA::helipath( var_1._id_04A4, 30, 30 );
    }
}

block_path()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_0 _meth_805A();
    var_0 _meth_82BB();
    self waittill( "trigger" );
    var_0 _meth_82BA();
    var_0 _meth_8059();
    var_1 = 0.25;

    if ( isdefined( self._id_0392 ) )
        var_1 = self._id_0392;

    wait(var_1);
    var_0 _meth_805A();
    var_0 delete();
}

get_patrol_anims()
{
    var_0 = [];
    var_0[1] = "patrol_look_up_once";
    var_0[2] = "patrol_360_once";
    var_0[3] = "patrol_jog_once";
    var_0[4] = "patrol_orders_once";
    return var_0;
}

get_patrol_run_anims()
{
    var_0 = [];
    var_0[1] = "patrol_look_up";
    var_0[2] = "patrol_360";
    var_0[3] = "patrol_jog";
    var_0[4] = "patrol_orders";
    return var_0;
}

patrol_guy()
{
    self endon( "death" );
    var_0 = get_patrol_anims();
    self.allowdeath = 1;
    _id_A5A4::_id_7E45( "patrol_jog" );
    var_1 = getent( self._id_04A4, "targetname" );
    _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "enemy" );
    level _id_A5A4::_id_075F( common_scripts\utility::_id_383F, "wounding_enemy_detected" );
    thread _id_A5A4::_id_2BDD();
    var_1 _id_A510::_id_0BD0( self, var_0[self._id_7A18] );

    if ( !isdefined( self._id_0142 ) )
    {
        _id_A510::_id_0BCA( self, "gravity", var_0[self._id_7A18] );
        self._id_2AF3 = 1;

        if ( !isdefined( self._id_0142 ) )
        {
            var_2 = getent( var_1._id_04A4, "targetname" );
            thread _id_A581::_id_4248( var_2 );
        }
    }

    while ( !isdefined( self._id_0142 ) )
        wait 0.05;

    self._id_2AF3 = 0;
    delete_wounding_sight_blocker();
    animscripts\init::_id_7DBE();
    _id_A5A4::_id_1ED1();
    self._id_050F = 16;
    self._id_01C4 = 350;

    if ( isdefined( self._id_0396 ) && self._id_0396 == "house_enter_guy" )
    {
        self _meth_81AA( level._id_6F7C._id_02E2 );
        self._id_01C4 = 16;
        self._id_02F6 = 80;
        self._id_02F7 = 80;
        return;
    }

    for (;;)
    {
        if ( _func_1A1( self._id_0142 ) )
            self _meth_81AA( self._id_0142._id_02E2 );

        wait 5;
    }
}

delete_wounding_sight_blocker()
{
    if ( common_scripts\utility::_id_382E( "wounding_sight_blocker_deleted" ) )
        return;

    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 _meth_805A();
    var_0 delete();
    common_scripts\utility::_id_383F( "wounding_sight_blocker_deleted" );
}

player_touches_wounded_blocker()
{
    if ( common_scripts\utility::_id_382E( "wounding_sight_blocker_deleted" ) )
        return;

    level endon( "wounding_sight_blocker_deleted" );
    common_scripts\utility::_id_384A( "player_touches_wounding_clip" );
    delete_wounding_sight_blocker();
}

countdown( var_0 )
{
    var_1 = 1200;

    if ( isdefined( var_0 ) )
        var_1 = var_0 * 60;

    level.evac_fail_time = gettime() + var_1 * 1000;
    thread set_min_time_remaining( 10 );
    var_2 = _id_A546::_id_3D17( undefined, undefined, undefined, undefined, var_1 );
    var_2 _meth_808B( 30, 1200000, 700 );
    var_2._id_92B2._id_0241 = &"SNIPERESCAPE_TIME_REMAINING";
    var_2 _meth_80D4( var_1 );

    if ( !common_scripts\utility::_id_382E( "player_enters_fairgrounds" ) )
    {
        common_scripts\utility::_id_3856( "player_enters_fairgrounds", var_1 );

        if ( !common_scripts\utility::_id_382E( "player_enters_fairgrounds" ) )
        {
            setdvar( "ui_deadquote", &"SNIPERESCAPE_FAILED_TO_EVAC" );
            _id_A5A4::_id_5CDF();
            return;
        }
    }

    _id_A546::destroy_countdown_hud( var_2 );
}

defend_heat_area_until_enemies_leave()
{
    level endon( "heat_area_cleared" );
    var_0 = getent( "price_death_org", "targetname" )._id_02E2;
    var_1 = _func_0C3( "enemy_flee_node", "targetname" );
    var_2 = 1250;

    for (;;)
    {
        common_scripts\utility::_id_383F( "player_defends_heat_area" );
        thread defend_heat_area_until_player_goes_back( var_0, var_1, var_2 );
        common_scripts\utility::_id_3857( "stop_heat_spawners" );
        common_scripts\utility::_id_3831( "player_defends_heat_area" );
        level notify( "player_goes_back_to_heat_area" );
        var_3 = _func_0DA( "axis", "all" );
        common_scripts\utility::_id_0D13( var_3, ::reacquire_player_pos );
        _id_A5A4::_id_9FC0( "heat_enemies_back_off" );
    }
}

defend_heat_area_until_player_goes_back( var_0, var_1, var_2 )
{
    level endon( "heat_area_cleared" );
    level._id_6F7C endon( "death" );

    for (;;)
    {
        var_3 = _func_0DA( "axis", "all" );
        var_3 = common_scripts\utility::_id_3CCB( var_0, var_3 );
        var_4 = 5;

        if ( var_3.size < var_4 )
            var_4 = var_3.size;

        for ( var_5 = 0; var_5 < var_4; var_5++ )
            var_3[var_5] _id_A5A4::_id_27EF( var_5 * 0.25, ::flee_heat_area, var_1 );

        for ( var_5 = var_4; var_5 < var_3.size; var_5++ )
            var_3[var_5] thread flee_heat_area( var_1 );

        wait_until_the_heat_defend_area_is_clear( var_0, var_2 );
    }
}

wait_until_the_heat_defend_area_is_clear( var_0, var_1 )
{
    if ( !_func_1A1( level._id_6F7C ) )
        return;

    level._id_6F7C endon( "death" );

    for (;;)
    {
        wait 1;

        if ( _func_0EE( level._id_6F7C._id_02E2, var_0 ) > 200 )
            continue;

        var_2 = _func_0DA( "axis", "all" );
        var_3 = _id_A5A4::_id_3CFA( var_0, var_2 );

        if ( !_func_1A1( var_3 ) )
        {
            common_scripts\utility::_id_383F( "heat_area_cleared" );
            return;
        }

        if ( _func_0EE( var_3._id_02E2, var_0 ) > var_1 )
        {
            common_scripts\utility::_id_383F( "heat_area_cleared" );
            var_4 = _func_0C3( "enemy_flee_node", "targetname" );
            common_scripts\utility::_id_0D13( var_2, ::flee_heat_area, var_4 );
            return;
        }
    }
}

flee_heat_area( var_0 )
{
    level endon( "player_goes_back_to_heat_area" );
    self notify( "stop_moving_in" );
    self notify( "stop_going_to_node" );
    self _meth_81A9( var_0 );
    self._id_01C4 = 64;
    self endon( "death" );
    self waittill( "goal" );

    if ( _func_0EE( self._id_02E2, var_0._id_02E2 ) <= 70 )
        self delete();
}

kill_shielded_price()
{
    level notify( "stop_updating_objective" );
    level._id_6F7C _id_A5A4::_id_8EA4();
    price_dies();
}

player_too_far_from_macmillan_fail()
{
    setdvar( "ui_deadquote", &"SNIPERESCAPE_TOO_FAR_FROM_MACMILLAN" );
    _id_A5A4::_id_5CDF();
}

price_dies()
{
    if ( _func_1A1( level._id_6F7C ) )
        level._id_6F7C _meth_8054( ( 0, 0, 0 ) );

    setdvar( "ui_deadquote", &"SNIPERESCAPE_CPT_MACMILLAN_DIED" );
    _id_A5A4::_id_5CDF();
}

price_wounding_kill_trigger()
{
    level endon( "price_is_safe_after_wounding" );
    common_scripts\utility::_id_384A( "player_leaves_price_wounding" );
    kill_shielded_price();
}

heli_shoots_rockets_at_ent( var_0 )
{
    var_1 = _func_1A3( var_0, 100000, 60000 );
    _id_A53F::_id_37BA( "mi28_seeker", 3, var_0, 0.75 );
    wait 5;
    _func_1A7( var_1 );
}

kills_enemies_then_wounds_price_then_leaves()
{
    level endon( "price_was_hit_by_heli" );
    level._id_6F7C thread price_heli_hit_detection();
    kill_all_visible_enemies();
    common_scripts\utility::_id_383F( "price_heli_moves_on" );
    self _meth_825E( level._id_6F7C );
    maps\sniperescape_wounding::heli_fires();
}

price_heli_hit_detection()
{
    for (;;)
    {
        level._id_6F7C waittill( "damage", var_0, var_1 );

        if ( isdefined( var_1 ) && var_1 == level.price_heli )
            break;
    }

    common_scripts\utility::_id_383F( "price_was_hit_by_heli" );
}

can_see_from_array( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( _func_08D( self._id_02E2, var_0[var_1]._id_02E2 + ( 0, 0, 64 ), 0, self ) )
            return var_0[var_1];
    }

    return undefined;
}

remove_drivers_from_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_2E18 ) )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

kill_all_enemies()
{
    var_0 = _func_0D9( "axis" );
    common_scripts\utility::_id_0D13( var_0, ::die_soon );
}

kill_all_visible_enemies()
{
    for (;;)
    {
        var_0 = _func_0D9( "axis" );
        var_0 = remove_drivers_from_array( var_0 );
        var_1 = can_see_from_array( var_0 );

        if ( !_func_1A1( var_1 ) )
            return;

        var_1 thread die_soon();

        while ( _func_1A1( var_1 ) )
        {
            self _meth_825E( var_1, common_scripts\utility::_id_712D( 15 ) + ( 0, 0, 16 ) );
            self _meth_8264();
            wait 0.15;
        }
    }
}

kill_all_visible_enemies_forever()
{
    self endon( "stop_killing_enemies" );
    self endon( "death" );

    for (;;)
    {
        kill_all_visible_enemies();
        wait 1;
    }
}

die_soon()
{
    self endon( "death" );
    wait(_func_0B5( 0.5, 2.0 ));
    self _meth_8054( ( 0, 0, 0 ) );
}

array_remove_without_model( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3]._id_029C == var_1 )
            var_2[var_2.size] = var_0[var_3];
    }

    return var_2;
}

price_flees_grenades()
{
    if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
        return;

    var_0 = getentarray( "grenade", "classname" );
    var_0 = array_remove_without_model( var_0, "projectile_m67fraggrenade" );

    if ( !var_0.size )
        return;

    var_1 = common_scripts\utility::_id_3F33( level._id_6F7C._id_02E2, var_0 );
    var_2 = 450;

    if ( _func_0EE( var_1._id_02E2, level._id_6F7C._id_02E2 ) > var_2 )
        return;

    var_3 = ( 0, 0, 0 );

    for (;;)
    {
        var_3 = var_1._id_02E2;
        wait 0.05;

        if ( !isdefined( var_1 ) )
            return;

        if ( _func_0EE( var_1._id_02E2, level._id_6F7C._id_02E2 ) > var_2 )
            return;

        if ( var_1._id_02E2 == var_3 )
            break;

        var_3 = var_1._id_02E2;
    }

    level._id_6F7C notify( "stop_loop" );
    var_4 = 0;

    for (;;)
    {
        if ( !isdefined( var_1 ) )
            break;

        var_5 = anglestoforward( level._id_6F7C.angles );
        var_6 = _func_114( var_1._id_02E2 - level._id_6F7C._id_02E2 );
        var_7 = _func_0F6( var_5, var_6 );

        if ( var_7 > 0.2 )
            break;

        if ( level._id_6F7C should_turn_right( var_1._id_02E2 ) )
            thread price_turns_right();
        else
            thread price_turns_left();

        wait 1;
        var_4 = 1;
    }

    if ( isdefined( var_1 ) )
    {
        for (;;)
        {
            if ( !isdefined( var_1 ) )
                break;

            if ( _func_0EE( var_1._id_02E2, level._id_6F7C._id_02E2 ) > var_2 )
                break;

            var_4 = 1;
            level._id_6F7C _id_A510::_id_0BB5( level._id_6F7C, "gravity", "wounded_crawl" );
            insure_crawler_is_above_ground();
        }
    }

    level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle" );
}

price_teleports_to_player()
{
    var_0 = spawn( "script_origin", level._id_6F7C._id_02E2 );
    level._id_6F7C _meth_804F( var_0 );
    var_0 _meth_82AA( level._id_0318._id_02E2, 1 );
    wait 1;
    var_0 delete();

    if ( 1 )
        return;

    for (;;)
    {
        var_1 = 200;
        var_0 _meth_82AD( 200, var_1 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            if ( _func_08F( level._id_6F7C._id_02E2 + ( 0, 0, 2 ), level._id_6F7C._id_02E2 + ( 0, 0, -10 ) ) != level._id_6F7C._id_02E2 + ( 0, 0, -10 ) )
            {
                var_0 delete();
                return;
            }

            wait 0.05;
        }
    }
}

underground()
{
    return level._id_6F7C._id_02E2[2] < level._id_0318._id_02E2[2] - 1500;
}

price_teleports_to_spot( var_0 )
{
    level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle" );
    price_teleports_to_org( var_0 );
    level._id_6F7C notify( "stop_loop" );
}

price_teleports_to_org( var_0 )
{
    var_1 = spawn( "script_origin", level._id_6F7C._id_02E2 );
    level._id_6F7C _meth_804F( var_1 );
    var_1 _meth_82AA( var_0 + ( 0, 0, 2 ), 2 );
    wait 2;
    var_1 delete();
}

insure_crawler_is_above_ground()
{
    if ( !underground() )
        return;

    level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle" );
    price_teleports_to_player();
    level._id_6F7C notify( "stop_loop" );
    waitframe;
}

price_picks_target()
{
    if ( common_scripts\utility::_id_382E( "fair_hold_fire" ) )
        return 0;

    if ( isdefined( level._id_6F7C.targetorg ) && _func_1A1( level.price_target_guy ) )
    {
        if ( level.price_target_time > gettime() + level.price_sticky_target_time )
            return 1;
    }

    level.callout_near_dist = 50000;
    common_scripts\utility::_id_383F( "price_cuts_to_woods" );
    price_flees_grenades();
    var_0 = anglestoforward( ( 0, level._id_6F7C.angles[1], 0 ) );
    var_1 = _func_0DA( "axis", "all" );
    var_2 = get_array_within_fov( level._id_6F7C._id_02E2, var_0, var_1, 0.707 );
    var_1 = var_2[1];
    var_3 = var_2[0];
    var_1 = level._id_6F7C get_cantrace_array( var_1 );

    if ( !var_1.size )
    {
        if ( var_3.size > 0 )
        {
            level._id_6F7C notify( "stop_loop" );

            foreach ( var_5 in var_3 )
            {
                if ( isdefined( var_5 ) )
                {
                    var_6 = _func_08D( level._id_6F7C _meth_80AA(), var_5 _meth_80AA(), 0, self );

                    if ( var_6 )
                    {
                        thread new_enemy_callout( var_3 );
                        price_turns_towards_guy( var_5 );
                        level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
                        return price_picks_target();
                    }
                }
            }

            level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
        }

        return 0;
    }

    if ( var_3.size > 0 )
        thread new_enemy_callout( var_3 );

    if ( !var_1.size )
        return 0;

    var_5 = common_scripts\utility::_id_3F33( level._id_6F7C._id_02E2, var_1 );

    if ( common_scripts\utility::_id_382E( "fairbattle_high_intensity" ) && _func_0EE( level._id_6F7C._id_02E2, var_5._id_02E2 ) > 650 )
        var_5 = common_scripts\utility::_id_3F91( level._id_6F7C._id_02E2, var_1 );

    thread price_targets_guy( var_5 );
    return 1;
}

price_targets_guy( var_0 )
{
    if ( isdefined( level._id_6F7C.targetorg ) )
        level._id_6F7C.targetorg delete();

    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 _meth_804F( var_0, "TAG_EYE", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    level.price_target_guy = var_0;
    level.price_target_time = gettime();
    level._id_6F7C.targetorg = var_1;
    level._id_6F7C _meth_816B( var_1 );
    var_1 endon( "death" );
    level._id_6F7C waittill( "death" );
    var_1 delete();
}

price_turns_towards_guy( var_0 )
{
    if ( level._id_6F7C should_turn_right( var_0._id_02E2 ) )
        price_turns_right();
    else
        price_turns_left();
}

should_turn_right( var_0 )
{
    var_1 = anglestoright( ( 0, self.angles[1], 0 ) );
    var_2 = _func_114( var_0 - self._id_02E2 );
    return _func_0F6( var_1, var_2 ) > 0;
}

get_not_in_pain( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] isdog() )
        {
            var_1[var_1.size] = var_0[var_2];
            continue;
        }

        if ( var_0[var_2]._id_038E != "pain" )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

greater_dot( var_0, var_1 )
{
    return var_0._id_2D80 > var_1._id_2D80;
}

lesser_dot( var_0, var_1 )
{
    return var_0._id_2D80 < var_1._id_2D80;
}

insert_in_array( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( !var_4 )
        {
            if ( [[ var_2 ]]( var_0[var_5], var_1 ) )
            {
                var_3[var_3.size] = var_1;
                var_4 = 1;
            }
        }

        var_3[var_3.size] = var_0[var_5];
    }

    if ( !var_4 )
        var_3[var_3.size] = var_1;

    return var_3;
}

get_array_within_fov( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[1] = [];
    var_4[0] = [];
    var_5[1] = ::lesser_dot;
    var_5[0] = ::lesser_dot;

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_7 = var_2[var_6];
        var_8 = _func_114( var_7._id_02E2 - var_0 );
        var_9 = _func_0F6( var_1, var_8 );
        var_7._id_2D80 = var_9;
        var_10 = var_9 >= var_3;
        var_4[var_10] = insert_in_array( var_4[var_10], var_7, var_5[var_10] );
    }

    return var_4;
}

line_for_time( var_0, var_1, var_2, var_3 )
{
    var_3 *= 20;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
        wait 0.05;
}

get_cantrace_array( var_0 )
{
    var_1 = [];
    var_2 = self _meth_80AA();

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !_func_08D( var_2, var_0[var_3] _meth_80AA(), 0, undefined ) )
            continue;

        var_1[var_1.size] = var_0[var_3];
    }

    return var_1;
}

get_canshoot_array( var_0 )
{
    var_1 = [];
    var_2 = self _meth_8184( "tag_flash" );
    var_3 = self _meth_8099() - var_2;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( !self _meth_81C0( var_0[var_4], var_3 ) )
            continue;

        var_1[var_1.size] = var_0[var_4];
    }

    return var_1;
}

get_cansee_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !self _meth_81C2( var_0[var_2] ) )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

price_moves_to_sniping_position()
{
    var_0 = getent( "price_gnoll", "targetname" );
    var_1 = var_0._id_02E2;
    var_2 = ( -3039.22, -3567.34, 117.2 );
    level._id_6F7C notify( "stop_loop" );

    for (;;)
    {
        var_3 = anglestoforward( level._id_6F7C.angles );
        var_4 = var_1 - level._id_6F7C._id_02E2;
        var_4 = ( var_4[0], var_4[1], 0 );
        var_5 = _func_114( var_4 );
        var_6 = _func_0F6( var_3, var_5 );
        var_7 = _func_0EE( level._id_6F7C._id_02E2, var_1 );

        if ( var_7 < 16 )
            break;

        if ( var_6 > -0.7 )
        {
            if ( level._id_6F7C should_turn_right( var_1 ) )
                price_turns_left();
            else
                price_turns_right();

            continue;
        }

        if ( var_7 > 32 )
        {
            level._id_6F7C _id_A510::_id_0BB5( level._id_6F7C, "gravity", "wounded_crawl" );
            insure_crawler_is_above_ground();

            if ( _func_0EE( level._id_6F7C._id_02E2, var_1 ) >= var_7 - 5 )
                price_teleports_to_spot( var_1 );

            continue;
        }

        break;
    }

    var_8 = getent( "park_reinforce", "targetname" );
    price_aims_at( var_8._id_02E2 );

    for (;;)
    {
        var_3 = anglestoforward( level._id_6F7C.angles );
        var_5 = _func_114( var_8._id_02E2 - level._id_6F7C._id_02E2 );
        var_6 = _func_0F6( var_3, var_5 );

        if ( var_6 < 0.7 )
        {
            if ( level._id_6F7C should_turn_right( var_8._id_02E2 ) )
                price_turns_right();
            else
                price_turns_left();

            continue;
        }

        break;
    }

    var_3 = anglestoforward( level._id_6F7C.angles );
    var_5 = _func_114( var_8._id_02E2 - level._id_6F7C._id_02E2 );
    var_6 = _func_0F6( var_3, var_5 );
    waitframe;
    level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
    common_scripts\utility::_id_3831( "price_moves_to_position" );
}

price_aims_at( var_0 )
{
    if ( !isdefined( level._id_6F7C.targetorg ) )
    {
        var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
        level._id_6F7C.targetorg = var_1;
    }

    level._id_6F7C.targetorg._id_02E2 = var_0;
}

price_turns_right()
{
    level._id_6F7C _id_A510::_id_0BB5( level._id_6F7C, "gravity", "wounded_turn_right" );
}

price_turns_left()
{
    level._id_6F7C _id_A510::_id_0BB5( level._id_6F7C, "gravity", "wounded_turn_left" );
}

idle_price_aim_at_player()
{
    self endon( "stop_loop" );
    self endon( "death" );
    self endon( "stop_aim_player" );
    self endon( "price_stops_thinking" );

    if ( !isdefined( self.player_head_tracking ) || !self.player_head_tracking )
        thread maps\_headtracking::player_head_tracking();

    for (;;)
    {
        if ( !common_scripts\utility::_id_382E( "price_moves_to_position" ) && self.idlecooldowntime < gettime() + 50 )
            price_aims_at( level._id_0318._id_02E2 );

        wait 0.05;
    }
}

stop_head_tracking()
{
    self waittill( "stop_aim_player" );
    maps\_headtracking::head_tracking_end();
}

idle_until_price_has_target()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C notify( "stop_loop" );
    waitframe;
    level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );

    if ( isdefined( level._id_6F7C.targetorg ) )
        level._id_6F7C.targetorg delete();

    level._id_6F7C.idlecooldowntime = gettime() + 5000;
    level._id_6F7C thread idle_price_aim_at_player();

    for (;;)
    {
        if ( price_picks_target() )
        {
            level._id_6F7C notify( "stop_aim_player" );
            break;
        }

        if ( common_scripts\utility::_id_382E( "price_moves_to_position" ) )
        {
            price_moves_to_sniping_position();
            continue;
        }
        else if ( level._id_6F7C.idlecooldowntime < gettime() )
        {
            var_0 = 1;
            var_1 = 0;

            while ( var_0 )
            {
                var_2 = anglestoforward( level._id_6F7C.angles );
                var_3 = _func_114( level._id_0318._id_02E2 - level._id_6F7C._id_02E2 );
                var_4 = _func_0F6( var_2, var_3 );

                if ( var_4 < 0.5 )
                {
                    var_1 = 1;

                    if ( level._id_6F7C should_turn_right( level._id_0318._id_02E2 ) )
                        price_turns_right();
                    else
                        price_turns_left();

                    continue;
                }

                var_0 = 0;
                break;
            }

            if ( var_1 )
            {
                level._id_6F7C notify( "stop_loop" );
                waitframe;
                level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
                level._id_6F7C thread idle_price_aim_at_player();
            }
        }

        wait 0.1;
    }
}

should_teleport()
{
    var_0 = _func_08F( level._id_6F7C._id_02E2 + ( 0, 0, 2 ), level._id_6F7C._id_02E2 + ( 0, 0, -100 ) );
    return var_0[2] > level._id_6F7C._id_02E2[2] + 60;
}

fight_until_price_has_no_target()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "no_enemies" );

    for (;;)
    {
        thread price_fights_enemies();
        level._id_6F7C waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
        level._id_6F7C notify( "stop_loop" );
        var_5 = gettime();

        if ( _func_1A1( var_1 ) && var_1._id_04A7 == "axis" && var_4 == "MOD_RIFLE_BULLET" )
            price_fends_off_attacker( var_1 );

        level._id_6F7C notify( "stop_loop" );
        waitframe;
        _id_A5A4::_id_9F8C( var_5, 0.05 );
        level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
    }
}

line_to_guy( var_0 )
{
    level._id_6F7C endon( "death" );
    var_0 endon( "death" );

    for (;;)
        wait 0.05;
}

price_fends_off_attacker( var_0 )
{
    if ( !_func_1A1( var_0 ) )
        return;

    var_0 endon( "death" );

    for (;;)
    {
        var_1 = anglestoforward( level._id_6F7C.angles );
        var_2 = _func_114( var_0._id_02E2 - level._id_6F7C._id_02E2 );
        var_3 = _func_0F6( var_1, var_2 );

        if ( var_3 < 0.8 )
        {
            if ( level._id_6F7C should_turn_right( var_0._id_02E2 ) )
                thread price_turns_right();
            else
                thread price_turns_left();

            wait 1.2;
            continue;
        }

        thread price_targets_guy( var_0 );

        if ( !level._id_6F7C.on_target )
        {
            waitframe;
            var_4 = gettime();
            level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
            level._id_6F7C common_scripts\utility::_id_A0A0( "on_target", 0.5 );
            _id_A5A4::_id_9F8C( var_4, 0.05 );
            level._id_6F7C notify( "stop_loop" );
        }

        if ( level._id_6F7C.on_target )
        {
            var_5 = level._id_6F7C _meth_8184( "tag_flash" );
            var_6 = level._id_6F7C _meth_8099() - var_5;

            if ( level._id_6F7C _meth_81C0( level._id_6F7C.targetorg._id_02E2, var_6 ) )
                level._id_6F7C _id_A510::_id_0C24( level._id_6F7C, "wounded_fire" );
            else
            {
                level._id_6F7C _id_A510::_id_0BB5( level._id_6F7C, "gravity", "wounded_crawl" );
                insure_crawler_is_above_ground();
            }
        }
    }
}

price_fights_enemies()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "damage" );
    level._id_6F7C endon( "pickup" );
    level.price_next_shoot_time = 0;

    for (;;)
    {
        if ( gettime() < level.price_next_shoot_time )
            wait(( level.price_next_shoot_time - gettime() ) * 0.001);

        level._id_6F7C common_scripts\utility::_id_A0A0( "on_target", 2 );

        if ( !level._id_6F7C.fastfire )
        {
            var_0 = _func_0EE( level._id_6F7C.targetorg._id_02E2, level._id_6F7C._id_02E2 );
            var_0 -= 400;
            var_0 *= 0.004;

            if ( var_0 < 0.15 )
                var_0 = 0.15;

            wait(_func_0B5( var_0 * 0.75, var_0 ));
        }

        if ( gettime() < level._id_6F7C.first_shot_time )
            wait(( level._id_6F7C.first_shot_time - gettime() ) * 0.001);

        if ( level._id_6F7C.on_target )
        {
            var_1 = level._id_6F7C _meth_8184( "tag_flash" );
            var_2 = level._id_6F7C _meth_8099() - var_1;

            if ( level._id_6F7C _meth_81C0( level._id_6F7C.targetorg._id_02E2, var_2 ) )
            {
                level._id_6F7C notify( "stop_loop" );
                level._id_6F7C _id_A510::_id_0C24( level._id_6F7C, "wounded_fire" );
                level._id_6F7C thread _id_A510::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
            }
        }

        if ( !price_picks_target() )
            break;
    }

    level._id_6F7C notify( "no_enemies" );
}

area_is_clear( var_0, var_1 )
{
    var_2 = 6;
    var_3 = 360 / var_2;

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        var_5 = ( -25, var_4 * var_3, 0 );
        var_6 = anglestoforward( var_5 );
        var_7 = var_0 + var_6 * 25;
        var_8 = _func_08F( var_0, var_7 );

        if ( _func_0EE( var_8, var_7 ) > 0.01 )
            return 0;

        var_8 = _func_08F( var_7 + ( 0, 0, 42 ), var_7 );

        if ( _func_0EE( var_8, var_7 ) > 0.01 )
            return 0;
    }

    return 1;
}

upwards_normal( var_0 )
{
    var_1 = 0.25;

    if ( _func_0BE( var_0[0] ) > var_1 )
        return 0;

    if ( _func_0BE( var_0[1] ) > var_1 )
        return 0;

    return var_0[2] >= 1 - var_1;
}

wait_for_player_to_drop_price( var_0 )
{
    for (;;)
    {
        wait_for_player_to_drop_price_func( var_0 );
        return;
    }
}

wait_for_player_to_drop_price_func( var_0 )
{
    var_0 endon( "trigger" );
    var_1 = getent( "price_gnoll", "targetname" );

    for (;;)
    {
        var_2 = 0;
        var_0._id_02E2 = ( 0, 0, -1500 );
        var_3 = level._id_0318 _meth_80AA();
        var_4 = level._id_0318 _meth_8338();
        var_5 = var_4[0] + 15;

        if ( var_5 > 54 )
            var_5 = 54;

        if ( var_5 < 40 )
            var_5 = 40;

        level._id_6854 = var_5;
        var_4 = ( var_5, var_4[1], 0 );
        var_6 = anglestoforward( var_4 );
        var_7 = anglestoright( var_4 );
        var_8 = 1.3;
        var_9 = var_3 + ( var_6 * 25.65 + var_7 * 31.6933 ) * var_8;
        var_9 += ( 0.0, 0.0, level._id_0318._id_02E2[2] - var_3[2] - 5.0 );
        var_10 = _func_06B( var_3, var_9, 1, level._id_0318 );
        var_11 = _func_08F( var_3, var_9 );
        level.price_trace = var_11;

        if ( var_11 != var_10["position"] )
        {
            wait 0.05;
            continue;
        }

        if ( var_10["position"][2] > level._id_0318._id_02E2[2] + 26 )
        {
            wait 0.05;
            continue;
        }

        if ( _func_0EE( level._id_0318._id_02E2, var_11 ) > 100 )
        {
            wait 0.05;
            continue;
        }

        if ( !upwards_normal( var_10["normal"] ) )
        {
            wait 0.05;
            continue;
        }

        if ( !area_is_clear( var_11, var_2 ) )
        {
            wait 0.05;
            continue;
        }

        level.playerdroppointorg = level._id_0318._id_02E2;
        level.playerdropangles = level._id_0318.angles;
        level.price_drop_point = var_11;
        var_12 = ( 0, 0, 0.2 );
        var_0._id_02E2 = level._id_0318._id_02E2 + var_12;
        wait 0.05;
    }
}

price_wounded_logic()
{
    if ( isdefined( level._id_6F7C._id_58D7 ) )
        level._id_6F7C _id_A5A4::_id_8EA4();

    level._id_6F7C thread wounded_setup();
    level endon( "player_made_it_to_seaknight" );

    for (;;)
    {
        price_defends_his_spot_until_he_is_picked_up();
        player_carries_price_until_he_drops_him();
    }
}

price_updates_objective_pos()
{
    level._id_6F7C endon( "death" );

    if ( !common_scripts\utility::_id_382E( "beacon_ready" ) )
        objective_position( maps\sniperescape_wounding::getobj( "wounded" ), level._id_6F7C._id_02E2 );
}

price_defends_his_spot_until_he_is_picked_up()
{
    thread price_updates_objective_pos();
    thread price_dies_if_player_goes_too_far();
    thread player_loses_if_price_dies();
    thread price_decides_if_he_can_be_picked_up();
    level._id_6F7C thread price_aims_at_his_enemy();
    level._id_6F7C endon( "pickup" );
    level._id_6F7C endon( "death" );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        price_slides_into_proper_putdown_position();

    if ( !common_scripts\utility::_id_382E( "first_pickup" ) )
    {
        var_0 = _func_0C3( "price_wounding_node", "targetname" );
        var_0 _id_A510::_id_0BE1( level._id_6F7C, "crash_idle" );
    }

    for (;;)
    {
        idle_until_price_has_target();
        fight_until_price_has_no_target();
    }
}

price_slides_into_proper_putdown_position()
{
    if ( !isdefined( level.price_drop_point ) )
        return;

    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0._id_02E2 = level._id_6F7C._id_02E2;
    level._id_6F7C _meth_804F( var_0 );
    level._id_6F7C thread _id_A510::_id_0BC7( level._id_6F7C, "wounded_idle_reach" );
    var_0 _meth_82AA( level.price_drop_point, 0.5, 0.2, 0.2 );
    level.price_drop_point = undefined;
    wait 0.5;
    var_0 delete();
    level._id_6F7C notify( "stop_first_frame" );
}

price_decides_if_he_can_be_picked_up()
{
    level._id_6F7C endon( "death" );
    var_0 = 0;

    for (;;)
    {
        level._id_6F7C waittill( "trigger" );
        waittillframeend;

        if ( level._id_0318 _meth_8462() )
            continue;

        if ( isdefined( level._id_0318._id_0E28 ) )
            continue;

        if ( common_scripts\utility::_id_382E( "price_wants_apartment_cleared" ) && !common_scripts\utility::_id_382E( "apartment_cleared" ) )
        {
            if ( gettime() > var_0 )
            {
                var_0 = gettime() + 5000;
                thread price_line( "wait_make_sure" );
            }
        }

        break;
    }

    level._id_0318._id_2CD9 = 1;
    level._id_6F7C notify( "pickup" );
}

price_aims_at_his_enemy()
{
    level endon( "price_picked_up" );
    self endon( "price_stops_thinking" );
    level._id_6F7C endon( "death" );
    var_0 = level._id_6F7C _id_A5A4::_id_3EF5( "wounded_aim_left" );
    var_1 = level._id_6F7C _id_A5A4::_id_3EF5( "wounded_aim_right" );
    var_2 = level._id_6F7C _id_A5A4::_id_3EF5( "wounded_base" );
    self _meth_814D( var_2, 1, 0, 1 );
    level._id_6F7C.on_target = 0;
    var_3 = 0;

    for (;;)
    {
        if ( !isdefined( level._id_6F7C.targetorg ) )
        {
            wait 0.05;
            continue;
        }

        var_4 = level._id_6F7C.targetorg._id_02E2;
        var_5 = animscripts\utility::_id_4177( var_4 );
        var_6 = _func_0EB( var_5 - var_3 );
        level._id_6F7C.on_target = _func_0BE( var_6 ) <= 7;

        if ( level._id_6F7C.on_target )
            level._id_6F7C notify( "on_target" );
        else
            var_6 = common_scripts\utility::_id_856D( var_6 ) * 3;

        var_5 = _func_0EB( var_3 + var_6 );

        if ( var_5 < -45.0 )
            var_5 = -45.0;

        if ( var_5 > 45.0 )
            var_5 = 45.0;

        var_7 = var_5 / 90;
        var_7 += 0.5;
        self _meth_814D( var_0, 1 - var_7, 0.05 );
        self _meth_814D( var_1, var_7, 0.05 );
        var_3 = var_5;
        wait 0.05;
    }
}

price_calls_out_kills()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "pickup" );

    for (;;)
    {
        if ( _func_1A1( level._id_6F7C._id_0142 ) )
        {
            var_0 = level._id_6F7C._id_0142;
            price_waits_for_enemy_death_or_new_enemy();
            price_calls_out_kill_if_he_should( var_0 );
            continue;
        }

        level._id_6F7C waittill( "enemy" );
    }
}

price_waits_for_enemy_death_or_new_enemy()
{
    level._id_6F7C endon( "enemy" );
    level._id_6F7C._id_0142 waittill( "death", var_0, var_1, var_2, var_3 );
    var_4 = 23;
}

price_calls_out_kill_if_he_should( var_0 )
{
    if ( _func_1A1( var_0 ) )
        return;

    if ( price_is_talking() )
        return;

    if ( !isdefined( var_0 ) )
        return;

    price_calls_out_a_kill();
    wait 2;
}

price_calls_out_a_kill()
{
    if ( !_func_1A1( level._id_6F7C ) )
        return;

    if ( level.last_price_kill + 10000 > gettime() )
        return;

    if ( _func_0B2( 100 ) > 80 )
        return;

    var_0 = [];
    var_0[var_0.size] = "got_one";
    var_0[var_0.size] = "tango_down";
    var_0[var_0.size] = "he_is_down";

    if ( level.last_price_kill + 20000 > gettime() )
        var_0[var_0.size] = "got_another";

    var_0[var_0.size] = "target_neutralized";
    var_0[var_0.size] = "got_him";
    var_1 = common_scripts\utility::_id_710E( var_0 );

    if ( isdefined( level.last_price_line ) )
    {
        for (;;)
        {
            if ( var_1 != level.last_price_line )
                break;

            var_1 = common_scripts\utility::_id_710E( var_0 );
        }
    }

    level.last_price_line = var_1;
    level.last_price_kill = gettime();
    thread price_line( var_1 );
}

player_loses_if_price_dies()
{
    level._id_6F7C endon( "pickup" );
    level._id_6F7C waittill( "death" );
    price_dies();
}

price_dies_if_player_goes_too_far()
{
    if ( common_scripts\utility::_id_382E( "price_can_be_left" ) )
        return;

    common_scripts\utility::_id_384A( "first_pickup" );
    level endon( "price_can_be_left" );
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "pickup" );

    for (;;)
    {
        if ( _func_0EE( level._id_0318._id_02E2, level._id_6F7C._id_02E2 ) > 1000 )
            break;

        wait 1;
    }

    price_line( "dont_go_far" );

    for (;;)
    {
        if ( _func_0EE( level._id_0318._id_02E2, level._id_6F7C._id_02E2 ) > 1500 )
        {
            player_too_far_from_macmillan_fail();
            return;
        }

        wait 1;
    }
}

draw_player_viewtag()
{
    for (;;)
    {
        _id_A526::_id_2DD0( level._id_0318._id_02E2, level._id_0318 _meth_8338() );
        wait 0.05;
    }
}

drop_to_floor()
{
    var_0 = _func_06B( self._id_02E2 + ( 0, 0, 32 ), self._id_02E2, 0, undefined );
    self._id_02E2 = var_0["position"];
}
#using_animtree("generic_human");

player_picks_up_price()
{
    level._id_6F7C notify( "price_stops_thinking" );
    level._id_6F7C notify( "stop_loop" );
    level._id_6F7C notify( "head_tracking_end" );
    var_0 = "wounded_pickup";

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
    {
        level.oldnearclip = getdvar( "r_znear" );
        _func_0D6( "r_znear", 1.0 );
    }

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        level.wounded_model = "player_carry";
    else
        level.wounded_model = "wounded_carry";

    if ( !common_scripts\utility::_id_382E( "first_pickup" ) )
    {
        var_1 = _func_0C3( "price_wounding_node", "targetname" );
        common_scripts\utility::_id_383F( "first_pickup" );
        var_0 = "crash_pickup";
        level._id_6F7C _meth_8119( level._id_6F7C _id_A5A4::_id_3EF5( var_0 ), 0 );
        level._id_0318 _meth_831A();
        level._id_0318 thread _id_A5A4::_id_69C4( "wpn_lrg_holster_plr" );
        var_1 = _func_0C3( "price_wounding_node", "targetname" );
        var_2 = _id_A5A4::_id_88D1( "player_carry" );
        var_2 _meth_8056();
        var_1 _id_A510::_id_0BC7( var_2, var_0 );
        wait 0.1;
        thread h1_pricecarry_pickup_dof_initial();
        var_3 = _func_0EE( var_2 _meth_8184( "tag_player" ), level._id_0318._id_02E2 );
        var_4 = var_3 * 0.011;

        if ( getdvarint( "use_old_crash_pickup" ) == 1 )
            var_2 _id_A5A4::_id_5696( "tag_player", var_4, 1.0, 0, 0, 0, 0 );
        else
            var_2 _id_A5A4::_id_5699( level._id_0318, "tag_player", var_4, 1.0, 0, 0, 0, 0 );

        thread maps\sniperescape_wounding::blocking_fence_falls();
        thread price_line( "find_good_spot" );
        var_1 notify( "stop_loop" );
        var_5 = _id_A5A4::_id_590F( var_2, level._id_6F7C );
        var_1 notify( "stop_loop" );
        var_2 _meth_8055();

        if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        {

        }

        var_1 _id_A510::_id_0C18( var_5, var_0 );
        thread price_talks_as_he_is_picked_up();
        level._id_0318 _meth_8051();
        var_2 delete();

        if ( getdvar( "no_heli_protection" ) == "" )
            level._id_0318 _meth_8335( ( 3577, -8420, 0.125 ) );

        if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        {
            var_2 = _id_A5A4::_id_88D1( "wounded_carry" );
            level.eplayerview = var_2;
            var_2 = _id_A5A4::_id_88D1( "carry_price" );
            var_2 _id_A510::_id_7EC3( "carry_idle", level._id_0318._id_02E2, level._id_0318.angles );
            level.price_carried = var_2;
            level.price_carried._id_02A7 = " ";
            maps\_move_with_animation::carrystart( level.price_carried, ::carryloopcondition );
        }

        return;
    }
    else
    {
        thread price_talks_as_he_is_picked_up();
        level._id_0318 thread _id_A5A4::_id_69C4( "wpn_lrg_holster_plr" );
    }

    var_6 = spawn( "script_origin", ( 0, 0, 0 ) );
    level._id_0318 _id_A5A4::_id_5693( level._id_0318._id_02E2, ( 0, _func_116( level._id_6F7C._id_02E2 - level._id_0318._id_02E2 ), level._id_0318.angles[2] ), 0.2, 1, 0, 0, 0, 0 );
    var_6._id_02E2 = level._id_0318._id_02E2;
    var_6.angles = level._id_0318.angles;
    var_6 drop_to_floor();
    level._id_6F7C notify( "stop_loop" );
    var_2 = _id_A5A4::_id_88D1( level.wounded_model );
    var_2 _meth_8056();
    var_6 thread _id_A510::_id_0BE1( level._id_6F7C, "pickup_idle", undefined, "stop_idle" );
    var_6 _id_A510::_id_0BC7( var_2, var_0 );
    wait 0.1;
    thread h1_pricecarry_pickup_dof_generic();
    level._id_6F7C maps\_headtracking::head_tracking_end( 0, 1 );
    level._id_6F7C _meth_8144( %wounded_aim, 0 );
    var_7 = var_2 _meth_8184( "tag_player" );
    var_8 = _func_06B( var_7 + ( 0, 0, 32 ), var_7, 0, undefined );

    if ( var_8["fraction"] < 1 )
    {
        var_6._id_02E2 += var_8["position"] - var_7;
        var_2 _id_A510::_id_7EC3( var_0, var_6._id_02E2, var_6.angles );
    }

    var_2 _id_A5A4::_id_5697( level._id_0318, "tag_player", 0.4, 1.0, 0, 0, 0, 0 );
    var_9 = level._id_0318._id_02E2;
    var_10 = level._id_0318._id_02E2 - var_2 _meth_8184( "tag_player" );
    var_2._id_02E2 += var_10;
    var_6._id_02E2 += var_10;

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        level._id_0318 _meth_807E( var_2, "tag_player", 1.0, 0, 0, 0, 0 );
    else
        level._id_0318 _meth_807F( var_2, "tag_player", 1.0, 0, 0, 0, 0 );

    var_2 _meth_8055();
    var_6 notify( "stop_idle" );
    var_5 = _id_A5A4::_id_590F( var_2, level._id_6F7C );
    var_11 = level.price_carried;

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
    {
        var_11 = _id_A5A4::_id_88D1( "carry_price" );
        var_11 _meth_8056();
        var_11 _id_A510::_id_7EC3( "carry_idle", level._id_0318._id_02E2, level._id_0318.angles );
    }

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        var_6 thread _id_A510::_id_0C18( var_5, var_0 );
        wait 2.0;
    }
    else
        var_6 _id_A510::_id_0C18( var_5, var_0 );

    var_6 notify( var_0 );
    var_8 = _func_06B( level._id_0318._id_02E2 + ( 0, 0, 32 ), level._id_0318._id_02E2, 0, undefined );

    if ( var_8["fraction"] < 1 )
    {
        var_2 _meth_82AA( var_2._id_02E2 + var_8["position"] - level._id_0318._id_02E2, 0.1 );
        wait 0.1;
    }

    level._id_0318 _meth_8051();
    var_6 delete();

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        var_2 delete();
        level._id_0318 _meth_8335( var_9 );
    }
    else
    {
        level.eplayerview = var_2;
        var_11._id_02E2 = level._id_0318._id_02E2;
        var_11.angles = level._id_0318.angles;
        var_11 _meth_8055();
        level.price_carried = var_11;
        level.price_carried._id_02A7 = " ";
        level._id_6F7C delete();
        maps\_move_with_animation::carrystart( level.price_carried, ::carryloopcondition, 0 );
    }
}

player_puts_down_price()
{
    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        maps\_move_with_animation::carrystop();

    thread h1_pricecarry_putdown_dof_generic();
    level._id_6F7C notify( "stop_loop" );
    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    _id_A5A4::_id_5693( level.playerdroppointorg, level.playerdropangles, 0.2, 1.0, 0, 0, 0, 0 );
    var_0._id_02E2 = level._id_0318._id_02E2;
    var_0.angles = level._id_0318.angles;
    var_0 drop_to_floor();
    var_1 = _id_A5A4::_id_88D1( level.wounded_model );
    var_1 _meth_8056();
    var_0 _id_A510::_id_0BC7( var_1, "wounded_putdown" );
    wait 0.1;
    var_2 = var_1 _meth_8184( "tag_player" );
    var_3 = _func_06B( var_2 + ( 0, 0, 32 ), var_2, 0, undefined );

    if ( var_3["fraction"] < 1 )
    {
        var_0._id_02E2 += var_3["position"] - var_2;
        var_1 _id_A510::_id_7EC3( "wounded_putdown", var_0._id_02E2, var_0.angles );
    }

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        level.eplayerview delete();

    var_1 _id_A5A4::_id_5697( level._id_0318, "tag_player", 0.25, 1.0, 0, 0, 0, 0 );
    var_1 _meth_8055();

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        level.price_carried delete();

    var_4 = level._id_0318._id_02E2;
    var_5 = getent( "price_spawner", "targetname" );
    var_5._id_0C72 = "price";
    var_5 _id_A510::_id_7EC3( "wounded_putdown", var_0._id_02E2, var_0.angles );
    var_5.count = 1;
    level._id_6F7C = var_5 _meth_8096();
    _id_A5A4::_id_88F1( level._id_6F7C );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C _meth_80B3( "body_complete_usmc_ghillie_price_damaged" );
    level._id_6F7C thread wounded_setup();
    level._id_6F7C thread maps\sniperescape::monitor_macmellon();
    var_6 = [];
    var_6[var_6.size] = var_1;
    var_6[var_6.size] = level._id_6F7C;
    thread price_talks_as_he_is_picked_up( 1 );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        level._id_0318 _meth_807E( var_1, "tag_player", 0.5, 1.0, 0, 0, 0, 0 );
    else
        level._id_0318 _meth_807F( var_1, "tag_player", 1.0, 0, 0, 0, 0, 0 );

    if ( getdvarint( "use_old_crash_pickup" ) != 1 && isdefined( level.price_drop_point ) )
    {
        var_7 = _func_091( var_4, 15 );
        var_4 = ( var_4[0], var_4[1], var_7[2] );
    }

    var_0 _id_A510::_id_0C18( var_6, "wounded_putdown" );
    level._id_0318 _meth_8051();
    var_0 delete();
    var_1 delete();
    level._id_0318 _meth_811B( 1 );
    level._id_0318 _meth_811C( 1 );
    level._id_0318 _meth_8301( 1 );
    level._id_0318 _meth_82FE( 1 );
    level._id_0318 _meth_811D( 1 );
    level._id_0318 _meth_8335( var_4 );

    if ( common_scripts\utility::_id_382E( "to_the_pool" ) && sufficient_time_remaining() )
        common_scripts\utility::_id_383F( "can_save" );
    else
        common_scripts\utility::_id_3831( "can_save" );

    if ( common_scripts\utility::_id_382E( "enter_burnt" ) && !common_scripts\utility::_id_382E( "to_the_pool" ) )
        level._id_6F7C._id_01FF = 1;

    common_scripts\utility::_id_3831( "price_picked_up" );
    _id_A546::_id_8AF4();
    level notify( "price_dropped" );
    var_8 = _func_091( level.price_drop_point, 15 );
    level._id_6F7C _meth_81CA( var_8, level._id_6F7C.angles, 100 );
    level.price_drop_point = undefined;
    thread price_asks_to_be_picked_up_when_its_safe();

    if ( isdefined( level.oldnearclip ) )
    {
        _func_0D6( "r_znear", level.oldnearclip );
        level.oldnearclip = undefined;
    }
}

h1_pricecarry_pickup_dof_initial()
{
    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        return;

    wait 0.35;
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 10, 18, 1.0, 1.0 );
    wait 1.0;
    level._id_0318 _meth_84A7( 6, 20, 2.5, 2.5 );
    wait 0.85;
    level._id_0318 _meth_84A7( 6, 15, 2.5, 2.5 );
    wait 0.85;
    level._id_0318 _meth_84A7( 10, 110, 1.5, 1.5 );
}

h1_pricecarry_pickup_dof_generic()
{
    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        return;

    wait 0.35;
    level._id_0318 _meth_84A5();
    level._id_0318 _meth_84A7( 10, 18, 1.0, 1.0 );
    wait 1.0;
    level._id_0318 _meth_84A7( 6, 20, 2.5, 2.5 );
    wait 1.0;
    level._id_0318 _meth_84A7( 10, 110, 1.5, 1.5 );
}

h1_pricecarry_putdown_dof_generic()
{
    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        return;

    level._id_0318 _meth_84A5();
    wait 0.5;
    level._id_0318 _meth_84A7( 16, 110, 1.5, 1.5 );
    wait 1.0;
    level._id_0318 _meth_84A6();
}

carryloopcondition()
{
    return 1;
}

gethealthyenemies()
{
    var_0 = _func_0DA( "axis", "all" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_2E18 ) )
            continue;

        if ( !var_0[var_2]._id_01FE )
        {
            var_1[var_1.size] = var_0[var_2];
            break;
        }
    }

    return var_1;
}

price_asks_to_be_picked_up_when_its_safe()
{
    level endon( "price_picked_up" );
    level endon( "price_wants_apartment_cleared" );

    for (;;)
    {
        var_0 = gethealthyenemies();

        if ( var_0.size )
            break;

        wait 1;
    }

    wait 3;

    for (;;)
    {
        var_0 = gethealthyenemies();

        if ( !var_0.size )
            break;

        wait 1;
    }

    wait 2;
    price_asks_to_be_picked_up();
}

price_talks_as_he_is_picked_up( var_0 )
{
    if ( _func_0B2( 100 ) > 10 )
    {
        if ( !isdefined( var_0 ) && _func_0B2( 100 ) > 30 )
            _id_A5A4::_id_27EF( 2.0, ::bonus_price_line, "pickup_breathing" );

        return;
    }

    var_1 = "put_down_" + ( _func_0B2( 3 ) + 1 );
    price_line( var_1 );
}

bonus_price_line( var_0 )
{
    if ( price_is_talking() )
        return;

    price_line( var_0 );
}

price_talks_if_player_takes_damage()
{
    level endon( "price_dropped" );

    for (;;)
    {
        level._id_0318 waittill( "damage" );
        price_line( "put_me_down_quick" );
        wait 4;
    }
}

price_talks_if_enemies_get_near()
{
    level endon( "price_dropped" );

    for (;;)
    {
        var_0 = _func_0DA( "axis", "all" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1];

            if ( !_func_1A1( var_2 ) )
                continue;

            if ( !_func_1A1( var_2._id_0142 ) )
                continue;

            if ( var_2 _meth_81C2( level._id_0318 ) )
                price_asks_to_be_put_down();

            wait 0.05;
        }

        wait 0.05;
    }
}

price_talks_if_enemies_are_near()
{
    level endon( "price_dropped" );

    for (;;)
    {
        level waittill( "an_enemy_shot", var_0 );

        if ( !_func_1A1( var_0 ) )
            continue;

        if ( var_0 _meth_81C2( level._id_0318 ) )
            price_asks_to_be_put_down();
    }
}

price_asks_to_be_put_down()
{
    if ( _func_1A1( level._id_6F7C ) )
        return;

    var_0 = [];
    var_0[var_0.size] = "new_put_me_down_1";
    var_0[var_0.size] = "new_put_me_down_2";
    var_0[var_0.size] = "new_put_me_down_3";
    var_0[var_0.size] = "new_put_me_down_4";

    if ( !isdefined( level.lastputdownline ) )
        level.lastputdownline = 0;

    var_1 = _func_0B2( var_0.size );

    if ( var_1 == level.lastputdownline )
        var_1++;

    if ( var_1 >= var_0.size )
        var_1 = 0;

    level.lastputdownline = var_1;
    price_line( var_0[var_1] );
    wait 6;
}

wounded_combat_trigger()
{
    self waittill( "trigger" );
    var_0 = getentarray( self._id_04A4, "targetname" );

    if ( !var_0.size )
        return;

    wait 1.35;
    price_talks_if_enemies_get_near();
}

player_carries_price_until_he_drops_him()
{
    level._id_6F7C notify( "price_stops_aiming" );
    set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    level._id_0318 _meth_81E4( 0.85 );

    if ( !_func_1A1( level._id_6F7C ) )
        level waittill( "forever and ever" );

    level._id_0318 thread take_weapons();
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_8301( 0 );
    level._id_0318 _meth_82FE( 0 );
    level._id_0318 _meth_811D( 0 );
    player_picks_up_price();
    common_scripts\utility::_id_383F( "price_picked_up" );
    common_scripts\utility::_id_383F( "carry_me_music_resume" );
    _id_A546::_id_8AF5();

    if ( sufficient_time_remaining() )
        common_scripts\utility::_id_383F( "can_save" );

    if ( !common_scripts\utility::_id_382E( "enter_burnt" ) && !common_scripts\utility::_id_382E( "to_the_pool" ) )
        _id_A5A4::_id_1143( "on_the_run" );

    if ( isdefined( level._id_6F7C ) )
        level._id_6F7C delete();

    var_0 = getent( "price_drop_trigger", "targetname" );
    var_0 _meth_80DD( &"SNIPERESCAPE_HOLD_1_TO_PUT_CPT_MACMILLAN" );
    level endon( "player_made_it_to_seaknight" );
    wait_for_player_to_drop_price( var_0 );
    var_0._id_02E2 = ( 0, 0, -1500 );
    player_puts_down_price();

    if ( !_func_1A1( level._id_6F7C ) )
    {
        price_dies();
        level waittill( "foreverevervever" );
    }

    level._id_0318 give_back_weapons();
    level._id_0318 _meth_81E4( 1 );
    level._id_0318._id_2CD9 = undefined;
}

give_back_weapons()
{
    self _meth_831B();

    if ( 1 )
        return;

    level._id_0318 notify( "stop_taking_away_ammo" );
    var_0 = self.heldweapons;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        self _meth_830B( var_2 );
        self _meth_82F3( var_2, self.stored_ammo[var_2] );
    }
}

take_weapons()
{
    self _meth_831A();

    if ( 1 )
        return;

    self endon( "stop_taking_away_ammo" );
    self.heldweapons = self _meth_8308();
    self.stored_ammo = [];

    for ( var_0 = 0; var_0 < self.heldweapons.size; var_0++ )
    {
        var_1 = self.heldweapons[var_0];
        self.stored_ammo[var_1] = self _meth_82F5( var_1 );
    }

    for (;;)
    {
        self _meth_830D();
        wait 0.05;
    }
}

take_away_player_ammo()
{
    self endon( "stop_taking_away_ammo" );

    for (;;)
    {
        var_0 = self _meth_8309();

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            self _meth_82F3( var_0[var_1], 0 );

        wait 0.05;
    }
}

give_back_player_ammo()
{
    var_0 = self _meth_8309();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        self _meth_832E( var_0[var_1] );
}

max_price_health()
{
    var_0 = [];
    var_0[0] = 800;
    var_0[1] = 600;
    var_0[2] = 500;
    var_0[3] = 400;

    if ( common_scripts\utility::_id_382E( "to_the_pool" ) )
        level._id_6F7C._id_01E6 = 50000;
    else
        level._id_6F7C._id_01E6 = var_0[level._id_3BFE] * 4;

    level._id_6F7C._id_01E6 = 50000;
}

wounded_setup()
{
    level.last_callout_direction = "";
    level.next_enemy_call_out = 0;
    level._id_6F7C.allowpain = 0;
    level._id_6F7C._id_38A8 = 1;
    level._id_6F7C _meth_81A7( 1 );
    level._id_6F7C.first_shot_time = gettime() + 2200;
    level._id_6F7C._id_2652 = level._id_6F7C _id_A5A4::_id_3EF5( "wounded_death" );
    level._id_6F7C._id_1300 = 1000;
    level._id_6F7C._id_2D3A = 1;
    max_price_health();
    level._id_6F7C.allowdeath = 1;
    level._id_6F7C thread regen();
    level._id_6F7C.a._id_6E5A = "prone";
    level._id_6F7C _meth_80DD( &"SNIPERESCAPE_HOLD_1_TO_PICK_UP_CPT" );
    level._id_6F7C _meth_817B( "price" );
    level._id_6F7C _meth_81AA( level._id_6F7C._id_02E2 );
    level._id_6F7C.fastfire = 0;
    level._id_6F7C thread deathdetect();

    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        thread fairground_price_adjustment();

    level._id_6F7C endon( "death" );

    for (;;)
    {
        level._id_6F7C._id_04E6 = price_should_be_useable();
        wait 0.05;
    }
}

int_vec_compare( var_0, var_1 )
{
    var_0 = ( _func_0BC( var_0[0] ), _func_0BC( var_0[1] ), _func_0BC( var_0[2] ) );
    var_1 = ( _func_0BC( var_1[0] ), _func_0BC( var_1[1] ), _func_0BC( var_1[2] ) );
    return var_0 == var_1;
}

price_should_be_useable()
{
    if ( level._id_0318 _meth_8462() )
        return 0;

    var_0 = _func_090( level._id_0318._id_02E2 + ( 0, 0, 60 ), level._id_0318._id_02E2 + ( 0, 0, 2 ) );

    if ( !int_vec_compare( var_0, level._id_0318._id_02E2 + ( 0, 0, 2 ) ) )
        return 0;

    return common_scripts\utility::_id_382E( "can_manage_price" );
}

deathdetect()
{
    self waittill( "death", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    var_0 = var_0;
}

fairground_price_adjustment()
{
    level._id_6F7C endon( "death" );

    if ( !isdefined( level._id_6F7C._id_0669 ) )
        level._id_6F7C thread maps\_stealth_logic::friendly_logic();

    common_scripts\utility::_id_384A( "fairbattle_high_intensity" );
    level._id_6F7C._id_04B1 = -15000;
    level._id_6F7C._id_01FF = 0;
}

regen()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage" );
        thread regenner();
    }
}

regenner()
{
    self endon( "death" );
    self endon( "damage" );
    wait 5;
    max_price_health();
}

price_fires( var_0 )
{
    self.a._id_55D7 = gettime();
    self _meth_81EA( 0.25, level._id_6F7C.targetorg._id_02E2 );
    var_1[0] = 400;
    var_1[1] = 400;
    var_1[2] = 0;
    var_1[3] = 0;
    level.price_next_shoot_time = gettime() + _func_0B4( 2250, 2950 ) - var_1[level._id_3BFE];
}

enemy_spawn_zone()
{
    var_0 = _func_124( self._id_7A26, " " );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = getent( var_0[var_2], "script_linkname" );

        if ( isdefined( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    self.zone_spawners = var_1;

    for (;;)
    {
        self waittill( "trigger" );

        if ( isdefined( level.zone_trigger ) )
            continue;

        level.zone_trigger = self;

        while ( level._id_0318 _meth_80AB( self ) )
            wait 0.05;

        level.zone_trigger = undefined;
    }
}

dog_check()
{
    if ( isdog() )
        self _meth_817B( "dog" );
}

chase_friendlies()
{
    if ( isdog() )
        self _meth_817B( "dog" );

    ai_move_in();
}

enemy_zone_spawner()
{
    anim._id_83F3 = animscripts\utility::_id_83F5;
    var_0 = getentarray( "zone_spawner", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_7A07 = 0;

    var_2 = 0;
    _id_A5A4::_id_A089( _id_A5A4::_id_6BA7, 600, _id_A5A4::_id_9373, 15 );

    for (;;)
    {
        common_scripts\utility::_id_3857( "enter_burnt" );
        waitframe;

        if ( _func_0DA( "all", "all" ).size >= 26 )
        {
            wait 1;
            continue;
        }

        if ( !isdefined( level.zone_trigger ) )
        {
            wait 1;
            continue;
        }

        for ( var_1 = 0; var_1 < 2; var_1++ )
        {
            var_0 = common_scripts\utility::_id_0CF5( var_0 );
            var_2--;

            if ( var_2 < 0 || var_2 >= level.zone_trigger.zone_spawners.size )
                var_2 = level.zone_trigger.zone_spawners.size - 1;

            var_3 = level.zone_trigger.zone_spawners[var_2];
            var_4 = getentarray( var_3._id_04A4, "targetname" );
            spawn_limited_number_from_spawners( var_0, var_4, 4, 1 );
        }

        wait_until_its_time_to_spawn_another_wave();
    }
}

price_asks_to_be_picked_up()
{
    var_0 = "lets_get_moving_" + ( _func_0B2( 2 ) + 1 );

    if ( common_scripts\utility::_id_382E( "price_wants_apartment_cleared" ) )
        common_scripts\utility::_id_384A( "apartment_cleared" );

    wait 1.5;

    if ( common_scripts\utility::_id_382E( "fair_snipers_died" ) )
        return;

    price_line( var_0 );
}

wait_until_its_time_to_spawn_another_wave()
{
    level endon( "time_to_spawn_a_new_wave" );
    thread spawn_wave_if_player_moves_far_with_price();
    _id_A5A4::_id_A07F( "axis" );

    if ( _func_1A1( level._id_6F7C ) )
        price_asks_to_be_picked_up();

    wait 14;
}

spawn_wave_if_player_moves_far_with_price()
{
    level endon( "time_to_spawn_a_new_wave" );

    for (;;)
    {
        if ( _func_1A1( level._id_6F7C ) )
        {
            common_scripts\utility::_id_382F( "price_picked_up" );
            common_scripts\utility::_id_384A( "price_picked_up" );
        }

        wait_until_price_is_dropped_or_player_goes_far( level._id_0318._id_02E2 );
    }
}

wait_until_price_is_dropped_or_player_goes_far( var_0 )
{
    level endon( "price_dropped" );

    for (;;)
    {
        if ( _func_0EE( var_0, level._id_0318._id_02E2 ) > 1050 )
        {
            level notify( "time_to_spawn_a_new_wave" );
            return;
        }

        wait 1;
    }
}

isdog()
{
    return self.classname == "actor_enemy_dog";
}

spawn_limited_number_from_spawners( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = _func_0DA( "axis", "dog" ).size;

        if ( var_4 >= var_2 )
            break;

        if ( var_0[var_5] isdog() && var_6 >= var_3 )
            continue;

        var_0[var_5]._id_02E2 = var_1[var_4]._id_02E2;
        var_0[var_5].count = 1;
        var_0[var_5]._id_7A07 = 0;
        var_0[var_5] _meth_8095();
        var_4++;
    }
}

dog_attacks_fence()
{
    var_0 = _func_0C3( "dog_fence_node", "targetname" );
    var_1 = getent( "fence_dog_spawner", "targetname" );
    var_2 = var_1 _meth_8096();

    if ( _id_A5A4::_id_88F1( var_2 ) )
        return;

    var_2._id_0C72 = "dog";
    var_2._id_01E6 = 5;
    var_2.allowdeath = 1;
    var_2 endon( "death" );
    var_2 thread apartment_dog_death();
    var_2._id_01FF = 1;
    var_0 _id_A510::_id_0C24( var_2, "fence_attack" );
    var_2._id_01FF = 0;
    var_2._id_01E6 = 50;
    var_2 ai_move_in();
}

apartment_dog_death()
{
    self waittill( "death" );
    common_scripts\utility::_id_383F( "fence_dog_dies" );
}

price_followup_line()
{
    level endon( "price_picked_up" );
    common_scripts\utility::_id_382F( "price_picked_up" );
    wait 3;

    for (;;)
    {
        while ( level.price_dialogue_master._id_3AF2.size > 0 )
            wait 0.05;

        price_line( "carry_me" );
        common_scripts\utility::_id_383F( "carry_me_music_resume" );
        wait(_func_0B5( 8, 12 ));
    }
}

set_objective_pos_to_extraction_point( var_0 )
{
    var_1 = extraction_point();
    objective_position( var_0, var_1 );
}

extraction_point()
{
    if ( !common_scripts\utility::_id_382E( "player_moves_through_burnt_apartment" ) )
    {
        var_0 = getent( "objective_burnt_babystep", "targetname" );
        return var_0._id_02E2;
    }

    return getent( "enemy_fair_dest", "targetname" )._id_02E2;
}

on_the_run_enemies()
{
    self notify( "stop_old_on_the_run_enemies" );
    self endon( "stop_old_on_the_run_enemies" );
    self endon( "death" );

    if ( isdefined( self._id_750E ) )
        self waittill( "jumpedout" );

    thread ai_move_in();
}

fairground_enemies()
{
    self endon( "death" );

    if ( isdefined( self._id_750E ) )
        self waittill( "jumpedout" );

    thread ai_move_in();
}

tracks_ent( var_0 )
{
    self endon( "stop_tracking_weapon" );
    var_1 = getent( "pool_trigger", "targetname" );

    for (;;)
    {
        if ( level._id_0318 _meth_80AB( var_1 ) || _func_08E( self _meth_8184( "tag_barrel" ), level._id_0318 _meth_80AA(), 0, undefined ) )
            self _meth_825E( level._id_0318, ( 0, 0, 24 ) );
        else
            self _meth_825E( var_0 );

        var_2 = _func_115( var_0._id_02E2 - self._id_02E2 );
        self _meth_8258( var_2[1] );
        wait 0.1;
    }
}

shoot_at_entity_chain( var_0 )
{
    var_1 = spawn( "script_model", var_0._id_02E2 );
    self _meth_825E( var_1 );
    thread maps\sniperescape_wounding::heli_fires();
    thread tracks_ent( var_1 );

    for (;;)
    {
        if ( !isdefined( var_0._id_04A4 ) )
            break;

        var_2 = getent( var_0._id_04A4, "targetname" );
        var_3 = _func_0EE( var_2._id_02E2, var_0._id_02E2 ) * 0.0035;

        if ( var_3 < 0.05 )
            var_3 = 0.05;

        var_1 _meth_82AA( var_2._id_02E2, var_3 );
        wait(var_3);
        var_0 = var_2;
    }

    var_1 delete();
    self notify( "stop_firing_weapon" );
    self notify( "stop_tracking_weapon" );
}

incoming_heli_exists()
{
    var_0 = getentarray( "script_vehicle", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( !_func_120( var_2._id_029C, "mi17" ) )
            continue;

        if ( var_2._id_9A3C == "default" )
            return 1;
    }

    return 0;
}

seaknight_badplace()
{
    var_0 = getent( "seaknight_badplace", "targetname" );

    for (;;)
    {
        if ( _func_0EE( self._id_02E2, var_0._id_02E2 ) < 800 )
            break;

        wait 0.05;
    }

    badplace_cylinder( "seaknight_badplace", 0, var_0._id_02E2, var_0._id_0351, 512, "axis" );
}

player_navigates_burnt_apartment()
{
    var_0 = _func_0C4( "park_delete_node", "targetname" );
    level endon( "to_the_pool" );
    common_scripts\utility::_id_382F( "to_the_pool" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "enter_burnt" );
        common_scripts\utility::_id_3831( "price_calls_out_enemy_location" );
        _id_A5A4::_id_735B( "axis", ::on_the_run_enemies );
        var_1 = _func_0DA( "axis", "all" );
        common_scripts\utility::_id_0D13( var_1, ::fall_back_and_delete, var_0 );
        common_scripts\utility::_id_3857( "enter_burnt" );
        common_scripts\utility::_id_383F( "price_calls_out_enemy_location" );
        _id_A5A4::_id_0761( "axis", ::on_the_run_enemies );
        level notify( "restarting_on_the_run" );
        var_1 = _func_0DA( "axis", "all" );
        common_scripts\utility::_id_0D13( var_1, ::on_the_run_enemies );
    }
}

apartment_hunters()
{
    common_scripts\utility::_id_384A( "apartment_hunters_start" );
    var_0 = getentarray( "apartment_hunter", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::apartment_hunter_think );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_88C3 );
}

apartment_hunter_think()
{
    var_0 = _func_0C3( "apartment_hunter_delete", "targetname" );
    self endon( "death" );
    self _meth_81A9( var_0 );
    self._id_01C4 = 32;
    self._id_020C = 0;
    self._id_01FB = 1;
    self waittill( "goal" );
    self delete();
}

fall_back_and_delete( var_0 )
{
    if ( isdefined( self._id_0398 ) && self._id_0398 == "apartment_hunter" )
        return;

    self endon( "death" );
    level endon( "restarting_on_the_run" );

    if ( isdefined( self._id_750E ) )
        self waittill( "jumpedout" );

    waitframe;
    self notify( "stop_moving_in" );
    var_1 = common_scripts\utility::_id_710E( var_0 );
    self _meth_81A9( var_1 );
    self._id_01C4 = 64;
    self waittill( "goal" );
    self delete();
}

_id_2856()
{
    self delete();
}

curtain( var_0 )
{
    _id_A5A4::_id_0D61( "curtain" );
    self _meth_814D( _id_A5A4::_id_3EF5( var_0 ), 1, 0, 1 );

    for (;;)
    {
        self _meth_814D( _id_A5A4::_id_3EF5( var_0 ), 1, 0, _func_0B3( 0.7 ) );
        wait(_func_0B3( 0.5 ));
    }
}

update_seaknight_objective_pos( var_0 )
{
    var_1 = undefined;

    for (;;)
    {
        if ( !isdefined( var_1 ) || var_1 != level.seaknight )
        {
            var_1 = level.seaknight;
            objective_onentity( var_0, var_1 );
        }

        wait 0.05;
    }
}

spawn_vehicle_from_targetname_and_create_ref( var_0 )
{
    var_1 = _id_A5A8::_id_8979( var_0 );
    level.ending_vehicles[var_0] = var_1;
}

fairground_air_war()
{
    common_scripts\utility::_id_384A( "seaknight_flies_in" );
    level.ending_vehicles = [];
    _id_A5A4::_id_27EF( 0, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_1" );
    _id_A5A4::_id_27EF( 10, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_2" );
    _id_A5A4::_id_27EF( 12, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_3" );
    _id_A5A4::_id_27EF( 16, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_4" );
    _id_A5A4::_id_27EF( 15.5, ::spawn_vehicle_from_targetname_and_create_ref, "ending_good_heli_1" );
    _id_A5A4::_id_27EF( 18, ::spawn_vehicle_from_targetname_and_create_ref, "ending_good_heli_2" );
    wait 20;
    wait 3.5;
    var_0 = level.ending_vehicles["ending_bad_heli_1"];
    var_1 = level.ending_vehicles["ending_bad_heli_2"];
    var_2 = level.ending_vehicles["ending_bad_heli_3"];
    var_3 = level.ending_vehicles["ending_bad_heli_4"];
    var_4 = level.ending_vehicles["ending_good_heli_1"];
    var_5 = level.ending_vehicles["ending_good_heli_2"];
    var_4 _id_A5A8::vehicle_flag_arrived( "ending_good_helis_leave" );
    var_4 notify( "stop_killing_enemies" );
    var_4 shoots_down( var_0 );
    wait 2;
    var_4 thread kill_all_visible_enemies_forever();
    wait 5;
    var_5 _id_A5A8::vehicle_flag_arrived( "ending_good_helis_leave" );
    var_5 notify( "stop_killing_enemies" );
    common_scripts\utility::_id_383F( "ending_bad_heli2_leaves" );
    var_5 shoots_down( var_1 );
    common_scripts\utility::_id_383F( "ending_bad_heli4_leaves" );
    wait 2;
    var_5 thread kill_all_visible_enemies_forever();
    var_4 notify( "stop_killing_enemies" );
    var_4 shoots_down( var_3 );
    common_scripts\utility::_id_383F( "ending_bad_heli3_leaves" );
    wait 2;
    var_4 thread kill_all_visible_enemies_forever();
    wait 1;
    var_5 notify( "stop_killing_enemies" );
    var_5 shoots_down( var_2 );
    wait 2;
    var_5 thread kill_all_visible_enemies_forever();
    wait 1200;
}

shoots_down( var_0, var_1 )
{
    self endon( "death" );
    self endon( "death_spiral" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self _meth_8263( "cobra_seeker" );
    var_2 = ( 0, 0, -50 );
    self _meth_8264( "tag_store_L_2_a", var_0, common_scripts\utility::_id_712D( var_1 ) + var_2 );
    wait 0.2;
    self _meth_8264( "tag_store_L_2_b", var_0, common_scripts\utility::_id_712D( var_1 ) + var_2 );
    wait 0.2;
    self _meth_8264( "tag_store_L_2_c", var_0, common_scripts\utility::_id_712D( var_1 ) + var_2 );
    self _meth_8263( "cobra_20mm" );
}

create_apartment_badplace()
{
    var_0 = getent( "apartment_bad_place", "targetname" );
    badplace_cylinder( "apartment_badplace", 0, var_0._id_02E2, var_0._id_0351, 200, "axis" );
}

delete_apartment_badplace()
{
    badplace_delete( "apartment_badplace" );
}

more_plant_claymores()
{
    common_scripts\utility::_id_384A( "plant_claymore" );
    common_scripts\utility::_id_3831( "plant_claymore" );
    price_line( "place_claymore" );
}

burnt_spawners()
{
    var_0 = getentarray( "burnt_spawner", "targetname" );
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::_id_384A( "deep_inside_burnt" );

        if ( gettime() < var_1 )
            wait(( var_1 - gettime() ) * 0.001);

        common_scripts\utility::_id_0D13( var_0, ::increment_count_and_spawn );
        var_1 = gettime() + 15000;
    }
}

spooky_dog()
{
    var_0 = getent( "spooky_dog_spawner", "targetname" );
    common_scripts\utility::_id_384A( "spawn_spooky_dog" );

    if ( getdvar( "player_hasnt_been_spooked" ) == "" )
    {
        setdvar( "player_hasnt_been_spooked", "1" );
        var_0 thread _id_A5A4::_id_0798( ::spooky_dog_spawns );
    }
    else
    {
        var_1 = getent( "dog_tele", "targetname" );
        var_0._id_02E2 = var_1._id_02E2;
        var_0._id_7A40 = 1;
        var_0 thread _id_A5A4::_id_0798( ::spooky_dog_spawns_hidden );
    }

    var_0 _id_A5A4::_id_88C3();
}

spooky_dog_spawns_hidden()
{
    var_0 = getent( "spooky_dog_trigger", "targetname" );
    self._id_01C4 = 64;
    var_1 = getent( "dog_end_goal", "script_noteworthy" );
    self._id_0179 = level._id_0318;
    thread _id_A581::_id_4248( var_1 );
    var_0 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "trigger" );
    level _id_A5A4::_id_075F( common_scripts\utility::_id_383F, "price_wants_apartment_cleared" );
    thread _id_A5A4::_id_2BDC();
    spooky_deletes_on_trigger( var_0 );
}

spooky_dog_spawns()
{
    self endon( "death" );
    self._id_02F6 = 0;
    self._id_02F7 = 0;
    var_0 = getent( "spooky_dog_trigger", "targetname" );
    common_scripts\utility::_id_384A( "spooky_waits" );
    common_scripts\utility::_id_383F( "price_wants_apartment_cleared" );

    if ( common_scripts\utility::_id_382E( "price_picked_up" ) )
    {
        level common_scripts\utility::_id_A0A0( "price_picked_up", 2.0 );

        if ( !common_scripts\utility::_id_382E( "price_picked_up" ) )
            wait 0.25;

        common_scripts\utility::_id_383F( "spooky_goes" );

        if ( !_func_1A1( level._id_6F7C ) )
            thread price_line( "sweep_the_rooms" );

        self waittill( "reached_path_end" );
        spooky_deletes_on_trigger( var_0 );
        return;
    }

    price_line( "sweep_the_rooms" );
    self notify( "stop_going_to_node" );
    self._id_01C4 = 2048;
    _id_A5A4::_id_7E0B();
}

spooky_deletes_on_trigger( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 5;

    if ( level._id_0318 _meth_80AB( var_0 ) )
    {
        self _meth_81AA( level._id_0318._id_02E2 );
        self._id_01C4 = 1024;
        return;
    }

    var_0 _id_A5A4::_id_9FC8( 5 );
    self delete();
}

spooky_sighting()
{
    var_0 = getent( "spooky_sighting", "targetname" );
    var_0 thread _id_A5A4::_id_0798( ::spooky_dog_is_sighted );
}

spooky_dog_is_sighted()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    self _meth_81AA( self._id_02E2 );
    self._id_01C4 = 32;
    var_0 = getent( "spooky_dog_trigger", "targetname" );
    spooky_deletes_on_trigger( var_0, 0.1 );
}

second_apartment_line()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "lets_go_that_way" );

        if ( _func_1A1( level._id_6F7C ) )
        {
            common_scripts\utility::_id_3857( "lets_go_that_way" );
            continue;
        }

        price_line( "head_for_apartment" );
        return;
    }
}

set_go_line()
{
    self waittill( "trigger", var_0 );

    if ( _func_1A1( var_0 ) )
        var_0._id_0574 = self._id_0398;
}

waittill_noteworthy_dies( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _func_1A1( var_1[var_2] ) )
            var_1[var_2] waittill( "death" );
    }
}

door_opens( var_0 )
{
    var_1 = getent( self._id_04A4, "targetname" );

    if ( isdefined( var_1 ) )
        var_1 _meth_804F( self );

    self _meth_809C( "wood_door_kick" );
    var_2 = -120;

    if ( isdefined( var_0 ) )
        var_2 *= var_0;

    self _meth_82B3( var_2, 0.3, 0, 0.3 );
    self _meth_805A();
}

flee_guy_runs()
{
    self endon( "death" );
    self._id_01FB = 1;
    stop_moving_in();

    for (;;)
    {
        if ( self _meth_81C2( level._id_0318 ) )
            break;

        wait 0.05;
    }

    wait 1.5;
    var_0 = _func_0C3( self._id_7A26, "script_linkname" );
    self _meth_81A9( var_0 );
    self._id_01C4 = 64;
    self waittill( "goal" );
    self._id_01FB = 0;
    self _meth_81AA( level._id_0318._id_02E2 );
    self._id_01C4 = 1024;
}

force_patrol_think()
{
    stop_moving_in();
    self endon( "death" );

    if ( !_func_1A1( level._id_6F7C ) )
    {
        self.allowdeath = 1;
        self._id_2AF3 = 1;
        var_0 = get_patrol_anims();
        var_1 = getent( self._id_04A4, "targetname" );
        var_1 _id_A510::_id_0BD0( self, var_0[self._id_7A18] );
        self.a._id_5F5B = "run";
        _id_A510::_id_0BC9( self, var_0[self._id_7A18] );
        self._id_2AF3 = 0;
    }

    thread reacquire_player_pos();
}

flicker_light()
{
    _id_A54F::_id_1928();
}

price_fair_defendspot()
{
    var_0 = getent( "price_gnoll", "targetname" );
    return var_0._id_02E2;
}

enemy_door_trigger()
{
    self waittill( "trigger" );
    var_0 = getentarray( self._id_04A4, "targetname" );
    var_1 = 1;

    if ( isdefined( self._id_7A26 ) )
    {
        var_2 = getent( self._id_7A26, "script_linkname" );

        if ( isdefined( var_2 ) )
        {
            if ( level._id_0318 _meth_80AB( var_2 ) )
                var_1 = 0.75;
        }
    }

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3]._id_0398 == "enemy_door_right" )
        {
            var_0[var_3] thread door_opens( -1 * var_1 );
            continue;
        }

        var_0[var_3] thread door_opens( var_1 );
    }
}

spawn_classname( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( _func_120( var_6.classname, var_1 ) )
            var_4[var_4.size] = var_6;
    }

    var_3 = isdefined( var_3 ) && level._id_3BFE >= 2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        var_6 = var_4[var_5];

        if ( level._id_3BFE <= 1 )
        {
            level.fair_grenade_guy_countdown--;

            if ( level.fair_grenade_guy_countdown <= 0 )
            {
                level.fair_grenade_guy_countdown = 5;
                self._id_01D0 = 1;
            }
            else
                self._id_01D0 = 0;
        }
        else
            self._id_01D0 = 1;

        if ( var_3 && _func_0B2( 100 ) > 30 )
            var_6._id_79DE = 3;
        else
            var_6._id_79DE = undefined;

        var_6.count = 1;
        var_7 = var_6 _meth_8095();

        if ( _func_1A1( var_7 ) )
            level.fair_battle_guys_spawned++;
    }
}

best_fair_path( var_0 )
{
    var_1 = level.fair_paths;

    if ( var_0 )
        var_1 = level.fair_paths_alt;

    var_2 = var_1[0];

    for ( var_3 = 1; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];

        if ( var_4.uses < var_2.uses )
            var_2 = var_4;
    }

    return var_2;
}

price_opens_fire()
{
    common_scripts\utility::_id_3852( "open_fire", "fairbattle_detected" );

    if ( !common_scripts\utility::_id_382E( "fairbattle_detected" ) )
    {
        price_line( "open_fire" );
        wait 2.0;
    }

    common_scripts\utility::_id_3831( "fair_hold_fire" );
    level._id_6F7C.first_shot_time = gettime();
    level._id_6F7C.fastfire = 1;
}

fair_guy_sets_high_intensity()
{
    fair_guy_waits_for_run_or_death();
    level.fair_runners++;

    if ( level.fair_runners >= 1 )
        common_scripts\utility::_id_383F( "fairbattle_high_intensity" );
}

fair_guy_waits_for_run_or_death()
{
    self endon( "death" );
    self endon( "damage" );
    _id_A5A4::_id_32E0( "reached_run_point" );
}

fairground_force_high_intensity()
{
    level endon( "fairbattle_high_intensity" );
    common_scripts\utility::_id_384A( "fairbattle_detected" );
    wait 18;
    common_scripts\utility::_id_383F( "fairbattle_high_intensity" );
}

stealth_break_detection()
{
    common_scripts\utility::_id_A087( "alerted_once", "alerted_again" );
    common_scripts\utility::_id_383F( "fairbattle_detected" );
}

faiground_stealth_detection()
{
    level waittill( "event_awareness" );
    common_scripts\utility::_id_383F( "fairbattle_gunshot" );
    common_scripts\utility::_id_383F( "fairbattle_detected" );
}

fair_guy_pre_battle_behavior( var_0 )
{
    var_1 = [];
    level endon( "fairbattle_high_intensity" );
    thread patrol_fairgrounds_for_player( var_0 );
    common_scripts\utility::_id_384A( "fairbattle_detected" );
    self._id_2AF3 = 0;
    self._id_0179 = level._id_0318;
}

fair_guy_responds_to_invisible_attack()
{
    if ( _id_A5A4::_id_32D8( "reached_run_point" ) )
        return;

    wait(_func_0B5( 0.1, 0.8 ));
    _id_A510::_id_0BCA( self, "gravity", "prone_dive" );
    thread _id_A510::_id_0BCE( self, "prone_idle", undefined, "stop_loop" );
    self _meth_81CE( "prone" );
    var_0 = _func_0B5( 0.1, 2 );
    _id_A5A4::_id_07BE( _id_A5A4::_id_0694, var_0 );
    _id_A5A4::_id_07BE( ::player_gets_near );
    _id_A5A4::_id_075B( "death" );
    _id_A5A4::_id_2BDD();
    wait 1;
    self notify( "stop_loop" );
    self _meth_8143();
    var_0 = _func_0B5( 3, 4 );
    _id_A5A4::_id_07BE( _id_A5A4::_id_32E0, "reached_run_point" );
    _id_A5A4::_id_07BE( _id_A5A4::_id_0694, var_0 );
    _id_A5A4::_id_2BDD();
    _id_A5A4::_id_32DE( "reached_run_point" );
}

player_gets_near()
{
    wait(_func_0B3( 1 ));

    for (;;)
    {
        if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) < 400 )
            break;

        wait 0.1;
    }
}

fair_stop_path_if_near_player()
{
    self endon( "death" );

    for (;;)
    {
        if ( _func_0EE( self._id_02E2, level._id_0318._id_02E2 ) < 500 )
        {
            self notify( "stop_going_to_node" );
            return;
        }

        wait 1;
    }
}

fair_alt_spawner_think()
{
    fair_guy_moves_in( 1 );
}

fair_spawner_think()
{
    fair_guy_moves_in( 0 );
}

fair_guy_moves_in( var_0 )
{
    if ( isdog() )
    {
        self _meth_817B( "dog" );
        var_1 = best_fair_path( var_0 );
        var_1.uses++;
        thread fair_stop_path_if_near_player();
        self._id_2AF3 = 1;
        _id_A581::_id_4249( var_1 );
        self._id_2AF3 = 0;
        thread reacquire_player_pos();
        return;
    }

    _id_A5A4::_id_32DD( "reached_run_point" );
    thread fairground_guy_modify_attack_based_on_player();
    self endon( "death" );
    self endon( "long_death" );
    self._id_2D3B = 1;
    thread fair_guy_sets_high_intensity();

    if ( level._id_3BFE < 2 )
        self.a.forced_cover = "hide";

    if ( !common_scripts\utility::_id_382E( "fairbattle_detected" ) )
    {
        fair_guy_pre_battle_behavior( var_0 );

        if ( !fairground_should_skip_prone_moment() )
            fair_guy_responds_to_invisible_attack();

        wait(_func_0B5( 0.2, 2 ));
        self notify( "stop_animmode" );
    }
    else
    {
        var_1 = best_fair_path( var_0 );
        var_1.uses++;
        self._id_2AF3 = 1;
        thread _id_A581::_id_4249( var_1 );
        wait_until_near_player_or_run_point();
        self._id_2AF3 = 0;
        var_2 = getent( "park_reinforce", "targetname" );
        self _meth_81AA( var_2._id_02E2 );
    }

    fairground_attack_logic();
}

wait_until_near_player_or_run_point()
{
    self endon( "reached_path_end" );
    self endon( "reached_run_point" );

    for (;;)
    {
        if ( _func_0EE( self._id_02E2, level._id_0318._id_02E2 ) < 1024 )
            return;

        wait 1;
    }
}

found_good_cover_spot()
{
    if ( !isdefined( self._id_01C3 ) )
        return 0;

    if ( !isdefined( self._id_02BB ) )
        return 0;

    if ( !_func_120( self._id_02BB._id_04D9, "over" ) )
        return 0;

    return 1;
}

fairground_should_skip_prone_moment()
{
    return common_scripts\utility::_id_382E( "fairbattle_threat_visible" );
}

fairground_guy_modify_attack_based_on_player()
{
    self endon( "death" );

    for (;;)
    {
        fairguy_cant_fight();
        var_0 = 200;
        var_1 = 256;
        var_2 = 128;

        if ( level._id_0318 _meth_8180() != "prone" )
        {
            var_0 = 750;
            var_1 = 900;
            var_2 = 600;
        }

        var_3 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

        if ( var_3 > var_1 )
        {
            fairguy_cant_fight();
            wait 5;
            continue;
        }

        if ( var_3 < var_2 )
        {
            fairguy_can_fight();
            wait 1;
            continue;
        }

        if ( var_3 < var_0 )
        {
            if ( self _meth_81C2( level._id_0318 ) )
            {
                fairguy_can_fight();
                wait 5;
                continue;
            }
        }

        wait 1;
    }
}

rpgguy()
{
    return _func_120( self.classname, "RPG" );
}

fairguy_cant_fight()
{
    if ( !common_scripts\utility::_id_382E( "player_plays_nice" ) )
    {
        fairguy_can_fight();
        return;
    }

    self.canfight = 0;

    if ( rpgguy() )
        return;

    if ( level._id_3BFE < 2 )
        self.a.forced_cover = "hide";
}

fairguy_can_fight()
{
    self.canfight = 1;
    self.a.forced_cover = "none";
    self._id_2D3B = undefined;
}

fair_zone_orgs_init()
{
    if ( isdefined( self.id_num ) )
        return;

    self.id_num = level.fairground_zone_orgs_all.size;
    level.fairground_zone_orgs_all[self.id_num] = self;
}

fair_zone_trigger()
{
    var_0 = _id_A5A4::_id_3DC0();
    common_scripts\utility::_id_0D13( var_0, ::fair_zone_orgs_init );

    for (;;)
    {
        self waittill( "trigger" );
        level.fair_zone = self;
        level.fairground_zone_orgs = var_0;
        level notify( "fairground_new_zone" );
        common_scripts\utility::_id_97CC();
        level common_scripts\utility::_id_A087( "fairground_new_zone", "fairground_clear_zone" );
        common_scripts\utility::_id_97CE();
    }
}

fair_zone_clear()
{
    level.fair_zone = undefined;
    level notify( "fairground_clear_zone" );
}

fairground_attack_logic()
{
    self notify( "stop_going_to_node" );
    self endon( "death" );
    _id_A5A4::_id_7E45( "sprint" );
    self._id_01FB = 0;
    self _meth_81CE( "stand", "prone", "crouch" );

    if ( rpgguy() )
    {
        self _meth_8170( 500, 500 );
        self _meth_8171( 800, 800 );
    }

    self _meth_8170( 1500, 0 );
    self _meth_8171( 1800, 1800 );
    var_0 = self.classname == "actor_enemy_merc_SNPR_dragunov" || self.classname == "actor_enemy_merc_LMG_rpd";

    if ( level._id_3BFE >= 2 )
        self.fairground_flanker = !var_0;
    else
    {
        self.fairground_flanker = 0;

        if ( !var_0 )
        {
            level.fairground_generic_count--;

            if ( level.fairground_generic_count <= 0 )
            {
                self.fairground_flanker = 1;
                level.fairground_generic_count = level.fairground_generic_skillcount[level._id_3BFE];
            }
        }
    }

    if ( !self.fairground_flanker )
    {
        fairground_generic_attack_behavior();
        return;
    }

    for (;;)
    {
        if ( isdefined( level.fair_zone ) )
            fairground_zone_attack_behavior();
        else
            fairground_generic_attack_behavior();

        wait(_func_0B5( 2, 5 ));
    }
}

fairground_rotate_current_zone()
{
    for (;;)
    {
        if ( isdefined( level.fairground_zone_orgs ) )
        {
            level.fairground_zone_index++;

            if ( level.fairground_zone_index >= level.fairground_zone_orgs.size )
                level.fairground_zone_index = 0;

            level.fairground_current_zone_org = level.fairground_zone_orgs[level.fairground_zone_index];
        }

        wait 6;
    }
}

fairground_zone_attack_behavior()
{
    level endon( "fairground_clear_zone" );

    if ( isdefined( level.engagement_dist_func[self.classname] ) )
        [[ level.engagement_dist_func[self.classname] ]]();
    else
        engagement_gun();

    var_0 = level.fairground_zone_orgs[level.fairground_zone_index];

    if ( isdefined( level.fairground_current_zone_org ) )
        var_0 = level.fairground_current_zone_org;

    wait 0.05;
    self _meth_81AA( var_0._id_02E2 );
    self._id_01C4 = var_0._id_0351;
    self waittill( "goal" );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, level.fairground_zone_orgs_all );
        self _meth_81AA( var_0._id_02E2 );
        var_1 = _func_0EE( self._id_02E2, var_0._id_02E2 );

        if ( var_1 < 700 )
            var_1 = 700;

        self._id_01C4 = var_1;
        wait(_func_0B3( 3 ));
    }
}

fairground_generic_attack_behavior()
{
    if ( self.fairground_flanker )
        level endon( "fairground_new_zone" );

    for (;;)
    {
        var_0 = getent( "enemy_fair_dest", "targetname" );
        self _meth_81AA( var_0._id_02E2 );
        self._id_01C4 = 3000;

        if ( !_func_1A1( self._id_0142 ) )
        {
            while ( !_func_1A1( self._id_0142 ) )
                wait 1;
        }

        var_1 = _func_0EE( self._id_02E2, self._id_0142._id_02E2 );

        if ( !rpgguy() )
        {
            self _meth_8170( var_1 * 0.85, 0 );
            self _meth_8171( var_1 * 0.95, var_1 );
        }

        for (;;)
        {
            if ( !common_scripts\utility::_id_382E( "player_plays_nice" ) && !common_scripts\utility::_id_382E( "seaknight_leaves" ) )
                fairground_kill_mean_player_until_he_plays_nice();

            if ( found_good_cover_spot() )
            {
                if ( _func_0EE( self._id_02BB._id_02E2, self._id_02E2 ) > 128 )
                    break;
            }

            wait 1;
        }

        self _meth_81AA( self._id_02BB._id_02E2 );
        self._id_01C4 = 64;

        if ( common_scripts\utility::_id_382E( "player_plays_nice" ) )
        {
            level common_scripts\utility::_id_A0A0( "player_plays_nice", _func_0B5( 20, 30 ) );
            continue;
        }

        fairground_kill_mean_player_until_he_plays_nice();
    }
}

fairground_kill_mean_player_until_he_plays_nice()
{
    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "player_made_it_to_seaknight" ) )
        {
            wait 1;
            return;
        }

        self _meth_81AA( level._id_0318._id_02E2 );
        self._id_01C4 = 1024;
        wait 5;
    }
}

fairground_detect_activity_and_set_flag()
{
    waittill_stealth_broken();
    common_scripts\utility::_id_383F( "fairbattle_gunshot" );
    common_scripts\utility::_id_383F( "fairbattle_detected" );
}

waittill_stealth_broken()
{
    self endon( "damage" );
    self endon( "death" );
    self endon( "explode" );
    self endon( "projectile_impact" );
    self endon( "explode" );
    self endon( "doFlashBanged" );
    self endon( "bulletwhizby" );
    level waittill( "foreverevere" );
}

fairground_detect_activity_and_set_visible()
{
    self endon( "death" );
    level endon( "fairbattle_detected" );

    if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
        return;

    for (;;)
    {
        self waittill( "enemy" );

        if ( !_func_1A1( self._id_0142 ) )
            continue;

        if ( _func_0EE( self._id_0142._id_02E2, self._id_02E2 ) > self._id_0142._id_0275 )
            continue;

        common_scripts\utility::_id_383F( "fairbattle_threat_visible" );
        common_scripts\utility::_id_383F( "fairbattle_gunshot" );
        common_scripts\utility::_id_383F( "fairbattle_detected" );
    }
}

patrol_fairgrounds_for_player( var_0 )
{
    self endon( "death" );
    thread fairground_detect_activity_and_set_flag();
    thread fairground_detect_activity_and_set_visible();
    var_1 = best_fair_path( var_0 );
    var_1.uses++;
    _id_A5A4::_id_7E45( "patrol_jog" );
    self._id_2AF3 = 1;
    thread _id_A581::_id_4249( var_1, ::do_patrol_anim_at_org );
}

do_patrol_anim_at_org( var_0 )
{
    thread do_patrol_anim_at_org_thread( var_0 );
}

print3d_forever( var_0, var_1, var_2, var_3, var_4 )
{
    for (;;)
        wait 0.05;
}

do_patrol_anim_at_org_thread( var_0 )
{
    if ( isdefined( var_0._id_0398 ) && var_0._id_0398 == "run_point" )
        _id_A5A4::_id_32DE( "reached_run_point" );

    if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
        return;

    if ( !isdefined( var_0._id_04A4 ) )
        return;

    if ( !isdefined( var_0.marker ) )
    {
        var_0.marker = 1;

        if ( !isdefined( level.gmarker ) )
            level.gmarker = 0;

        level.gmarker++;
    }

    self endon( "death" );

    if ( !isdefined( var_0._id_7A18 ) )
        return;

    self.allowdeath = 1;
    self.a._id_5F5B = "run";
    var_1 = get_patrol_anims();
    thread delayed_patrol_anim( var_1[var_0._id_7A18] );
    var_0._id_7A18 = undefined;
}

delayed_patrol_anim( var_0 )
{
    self endon( "stop_animmode" );
    self endon( "death" );
    wait 0.5;
    _id_A510::_id_0BCA( self, "gravity", var_0 );
}

remove_cant_see_player( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( var_3 _meth_81C2( level._id_0318 ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

wait_until_saw_enemy()
{
    for (;;)
    {
        var_0 = _func_0D9( "axis" );
        var_1 = self _meth_80AA();
        var_2 = gettime();

        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            var_4 = var_0[var_3];

            if ( !_func_1A1( var_4 ) )
                continue;

            var_5 = var_4 _meth_80AA();
            var_6 = _func_06B( var_1, var_5, 0, undefined );

            if ( var_6["fraction"] == 1 )
            {
                _id_A5A4::_id_9F8C( var_2, 1 );
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

fairground_price_dialogue()
{
    level endon( "fairbattle_high_intensity" );
    level._id_6F7C _id_A5A4::_id_07BE( ::wait_until_saw_enemy );
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "enemies_in_sight" );
    _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "tangos_in_sight" );
    _id_A5A4::_id_2BDD();
    common_scripts\utility::_id_383F( "enemies_in_sight" );
    price_line( "let_them_get_closer" );
    common_scripts\utility::_id_384A( "get_ready_to_fire" );
    price_line( "standby_to_engage" );
}

fairground_player_visibility()
{
    var_0 = level._id_0318._id_0275;

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
            break;

        if ( level._id_0318 _meth_8180() == "stand" )
            level._id_0318._id_0275 = 1800;

        if ( level._id_0318 _meth_8180() == "crouch" )
            level._id_0318._id_0275 = 700;

        if ( level._id_0318 _meth_8180() == "prone" )
            level._id_0318._id_0275 = 128;

        wait 0.5;
    }

    level._id_0318._id_0275 = var_0;
}

price_warns_player()
{
    var_0 = "watch_out_1";
    var_1 = undefined;

    for (;;)
    {
        var_2 = _func_0DA( "axis", "all" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            wait 0.05;

            if ( !_func_1A1( var_2[var_3] ) )
                continue;

            if ( !_func_1A1( var_2[var_3]._id_0142 ) )
                continue;

            if ( !_func_1AD( var_2[var_3]._id_0142 ) )
                continue;

            if ( _func_1A1( var_1 ) && var_2[var_3] == var_1 )
                continue;

            if ( _func_0EE( var_2[var_3]._id_02E2, level._id_0318._id_02E2 ) > 500 )
                break;

            var_1 = var_2[var_3];
            price_line( var_0 );

            if ( var_0 == "watch_out_1" )
                var_0 = "watch_out_2";
            else
                var_0 = "watch_out_1";

            wait 3;
        }

        wait 0.05;
    }
}

all_guys_drop_grenades()
{
    self waittill( "death" );
    level._id_60CB = -5;
}

fairground_battle()
{
    var_0 = [];
    var_0[0] = 0.5;
    var_0[1] = 0.7;
    var_0[2] = 0.85;
    var_0[3] = 0.85;
    _id_A5A4::_id_0761( "axis", ::all_guys_drop_grenades );
    level.price_sticky_target_time = 1000;
    anim._id_6A64 = var_0[level._id_3BFE];
    level._id_0318.attackeraccuracy = anim._id_6A64;

    if ( level._id_3BFE >= 2 )
    {
        level._id_584F = 2000;
        level._id_0318._id_010A = 750;
    }

    var_1 = [];
    var_1[0] = 1.25;
    var_1[1] = 1.25;
    var_1[2] = 1.15;
    var_1[3] = 1.0;
    _func_0D6( "ai_accuracydistscale", var_1[level._id_3BFE] );
    level.fair_grenade_guy_countdown = 0;
    level.fair_battle_guys_spawned = 0;
    level._id_6F7C._id_0275 = 1400;
    level.fairground_zone_orgs_all = [];
    level.fairground_zone_index = 0;
    thread fairground_rotate_current_zone();
    level.fairground_generic_skillcount[0] = 3;
    level.fairground_generic_skillcount[1] = 2;
    level.fairground_generic_count = 0;
    common_scripts\utility::_id_76BB( "fair_zone_trigger", ::fair_zone_trigger );
    common_scripts\utility::_id_76BB( "fair_zone_clear", ::fair_zone_clear );
    level _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "fairbattle_detected" );
    level _id_A5A4::_id_075F( _id_A5A4::_id_7C82, "_stealth_stop_stealth_logic" );
    thread price_warns_player();
    common_scripts\utility::_id_3831( "open_fire" );

    if ( _func_1A1( level._id_6F7C ) )
    {
        thread fairground_price_adjustment();
        thread price_opens_fire();
    }

    var_2 = _func_0DA( "axis", "all" );
    common_scripts\utility::_id_0D13( var_2, ::die_soon );

    if ( _func_1A1( level._id_6F7C ) )
        level._id_6F7C _meth_816A();

    common_scripts\utility::_id_382F( "fairbattle_high_intensity" );
    _func_0D6( "ai_eventDistGunShot", 4500 );
    thread maps\sniperescape_wounding::fairground_keep_player_out_of_pool();
    thread fairground_price_dialogue();
    thread fairground_player_visibility();
    level._id_0669._id_5836._id_298E["hidden"]["stand"] = 2048;
    common_scripts\utility::_id_383F( "faiground_battle_begins" );
    common_scripts\utility::_id_383F( "aa_seaknight_rescue" );
    _id_A5A4::_id_735B( "axis", ::enemy_override );
    var_3 = getentarray( "secondary_path", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, ::secondary_path_think );
    thread fairground_force_high_intensity();
    level.fair_paths = common_scripts\utility::_id_40FD( "fair_path", "targetname" );
    level.fair_paths_alt = common_scripts\utility::_id_40FD( "fair_path_alt", "targetname" );
    var_4 = getent( "field_ref_spot", "targetname" );
    level.fair_paths = common_scripts\utility::_id_3CCB( var_4._id_02E2, level.fair_paths );
    common_scripts\utility::_id_0D13( level.fair_paths, ::init_fair_paths );
    level.fair_paths_alt = common_scripts\utility::_id_3CCB( var_4._id_02E2, level.fair_paths_alt );
    common_scripts\utility::_id_0D13( level.fair_paths_alt, ::init_fair_paths );
    level.fair_runners = 0;
    var_5 = getentarray( "fair_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_5, _id_A5A4::_id_0798, ::fair_spawner_think );
    var_6 = getentarray( "fair_spawner_alt", "targetname" );
    common_scripts\utility::_id_0D13( var_6, _id_A5A4::_id_0798, ::fair_alt_spawner_think );
    level._id_0318._id_01FF = 1;
    fairground_pre_detection();
    level._id_0318._id_01FF = 0;
    level._id_0318._id_04B1 = 500;
    common_scripts\utility::_id_384A( "fairbattle_detected" );
    common_scripts\utility::_id_384A( "fairbattle_high_intensity" );
    common_scripts\utility::_id_3831( "fair_hold_fire" );
    fairground_post_detection();
}

init_fair_paths()
{
    self.uses = 1;

    if ( isdefined( self._id_0398 ) )
        self.uses = 0;
}

fairground_pre_detection()
{
    level endon( "fairbattle_detected" );
    var_0 = get_fair_spawners();

    if ( level._id_8C36 != "fair_battle2" )
    {
        spawn_classname( var_0, "ak47", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        wait 4;
        var_0 = get_fair_spawners();
        spawn_classname( var_0, "ak47", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        wait 4;
    }
    else
        spawn_classname( var_0, "ak47", 2 );
}

get_fair_spawners()
{
    var_0 = getent( "alt_fair_trigger", "targetname" );

    if ( level._id_0318 _meth_80AB( var_0 ) )
        return getentarray( "fair_spawner_alt", "targetname" );
    else
        return getentarray( "fair_spawner", "targetname" );
}

spawn_intro_wave()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        spawn_classname( var_0, "winc", 1 );
    }
    else if ( level._id_3BFE == 1 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        spawn_classname( var_0, "winc", 1 );
    }
    else if ( level._id_3BFE == 2 )
    {
        spawn_classname( var_0, "winc", 2 );
        spawn_classname( var_0, "g3", 2, 1 );
        spawn_classname( var_0, "drag", 2 );
    }
    else if ( level._id_3BFE == 3 )
    {
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "rpd", 1, 1 );
        spawn_classname( var_0, "drag", 3 );
    }
}

spawn_lowbie_mixed()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
    {
        spawn_classname( var_0, "ak47", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "winc", 2 );
    }
    else if ( level._id_3BFE == 1 )
    {
        spawn_classname( var_0, "winc", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
    }
    else if ( level._id_3BFE == 2 )
    {
        spawn_classname( var_0, "winc", 2, 1 );
        spawn_classname( var_0, "g3", 2, 1 );
        spawn_classname( var_0, "mp5", 2 );
    }
    else if ( level._id_3BFE == 3 )
    {
        spawn_classname( var_0, "ak47", 1, 1 );
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "mp5", 3 );
    }
}

spawn_sniper_mixed()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "mp5", 2 );
        spawn_classname( var_0, "drag", 4 );
    }
    else if ( level._id_3BFE == 1 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "g3", 1 );
        spawn_classname( var_0, "mp5", 1 );
        spawn_classname( var_0, "drag", 3 );
    }
    else if ( level._id_3BFE == 2 )
    {
        spawn_classname( var_0, "ak47", 1, 1 );
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "drag", 4 );
    }
    else if ( level._id_3BFE == 3 )
    {
        spawn_classname( var_0, "RPG", 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "drag", 4 );
    }
}

spawn_saw_support()
{
    var_0 = get_fair_spawners();
    spawn_classname( var_0, "rpd", 3, 1 );

    if ( level._id_3BFE >= 2 )
    {
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "dog", 1 );
    }
    else
    {
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "mp5", 1 );
    }
}

spawn_saw_support_no_dog()
{
    var_0 = get_fair_spawners();
    spawn_classname( var_0, "rpd", 3, 1 );
    spawn_classname( var_0, "g3", 1, 1 );
    spawn_classname( var_0, "winc", 1, 1 );
    spawn_classname( var_0, "mp5", 1 );
}

spawn_rpg_support()
{
    var_0 = get_fair_spawners();
    spawn_classname( var_0, "RPG", 3 );
    spawn_classname( var_0, "g3", 1, 1 );
    spawn_classname( var_0, "winc", 1, 1 );
    spawn_classname( var_0, "mp5", 1 );
}

spawn_dog_support()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
        spawn_classname( var_0, "dog", 2 );
    else if ( level._id_3BFE == 1 )
        spawn_classname( var_0, "dog", 2 );
    else if ( level._id_3BFE == 2 )
        spawn_classname( var_0, "dog", 3 );
    else if ( level._id_3BFE == 3 )
        spawn_classname( var_0, "dog", 3 );
}

player_has_red_flashing_overlay()
{
    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        var_1 = level._id_0323[var_0];

        if ( var_1 _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
            return 1;
    }

    return 0;
}

fairbattle_autosave()
{
    if ( level._id_8C36 == "seaknight" )
        return;

    for ( var_0 = 0; var_0 < 14; var_0++ )
    {
        if ( _func_087() )
            return;

        wait 1;

        if ( _func_087() )
            return;

        if ( player_has_red_flashing_overlay() )
            continue;

        if ( _id_A5A4::_id_6B6F() )
            continue;

        var_1 = _func_0DA( "axis", "all" );
        var_1 = remove_vehicle_riders_from_array( var_1 );
        var_2 = level.fair_battle_guys_spawned - var_1.size;
        var_3 = var_2 / level.fair_battle_guys_spawned;
        level.killed_guys = var_2;
        level.killed_ratio = var_3;

        if ( var_3 < 0.7 )
            continue;

        if ( var_1.size )
        {
            var_4 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_1 );

            if ( _func_0EE( var_4._id_02E2, level._id_0318._id_02E2 ) < 760 )
                continue;
        }

        if ( _id_A5A4::_id_114E() )
            return;
    }
}

remove_vehicle_riders_from_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_750E ) )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

spawn_heli_pod_1()
{
    wait 25;
    _id_A5A8::_id_8979( "fairground_heli1" );
    _id_A5A8::_id_8979( "fairground_heli2" );
    thread chopper_discussion();
    thread fairbattle_autosave();
}

spawn_heli_pod_2()
{
    _id_A5A8::_id_8979( "fairground_heli3" );
    _id_A5A8::_id_8979( "fairground_heli4" );
}

chopper_discussion()
{
    wait 4;
    price_line( "enemy_choppers" );
    wait 7;
    wait 38;
    price_line( "where_are_you" );
    price_line( "be_there_asap" );
}

fairground_post_detection()
{
    _id_A5A4::_id_1333( "axis" );
    var_0 = [];
    var_0["intro_wave"] = ::spawn_intro_wave;
    var_0["lowbie_mixed"] = ::spawn_lowbie_mixed;
    var_0["heli_pod_1"] = ::spawn_heli_pod_1;
    var_0["heli_pod_2"] = ::spawn_heli_pod_2;
    var_0["saw_support"] = ::spawn_saw_support;
    var_0["saw_support_no_dog"] = ::spawn_saw_support_no_dog;
    var_0["rpg_support"] = ::spawn_rpg_support;
    var_0["dog_support"] = ::spawn_dog_support;
    var_0["sniper_mixed"] = ::spawn_sniper_mixed;
    var_1 = [];
    var_1["intro_wave"] = 6;
    var_1["lowbie_mixed"] = 6;
    var_1["heli_pod_1"] = 8;
    var_1["heli_pod_2"] = 8;
    var_1["saw_support"] = 6;
    var_1["saw_support_no_dog"] = 6;
    var_1["rpg_support"] = 6;
    var_1["dog_support"] = 3;
    var_1["sniper_mixed"] = 6;
    var_2 = spawnstruct();
    var_2._id_9373 = gettime();
    var_2.events = [];

    if ( level._id_8C36 != "fair_battle2" )
    {
        var_2 = add_to_schedule( var_2, "intro_wave", 12 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 6 );
        var_2 = add_to_schedule( var_2, "rpg_support", 7 );
        var_2 = add_to_schedule( var_2, "sniper_mixed", 12 );
        var_2 = add_to_schedule( var_2, "saw_support", 5 );
        var_2 = add_to_schedule( var_2, "rpg_support", 4 );
    }

    var_2 = add_to_schedule( var_2, "heli_pod_1", 4 );
    var_2 = add_to_schedule( var_2, "heli_pod_2", 28 );

    if ( level._id_3BFE >= 2 )
    {
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 28 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 2 );
        var_2 = add_to_schedule( var_2, "saw_support", 2 );
    }
    else
    {
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 34 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 2 );
    }

    for ( var_3 = 0; var_3 < 5; var_3++ )
    {
        var_2 = add_to_schedule( var_2, "saw_support_no_dog", 11 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 11 );
        var_2 = add_to_schedule( var_2, "saw_support", 11 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 11 );
        var_2 = add_to_schedule( var_2, "rpg_support", 11 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 11 );
    }

    var_4 = 0;

    for (;;)
    {
        var_5 = var_2.events[var_4];
        var_6 = gettime();

        if ( var_5["timer"] > var_6 )
            wait(( var_5["timer"] - var_6 ) * 0.001);

        wait_until_enough_ai_headroom( var_1[var_5["event"]] );

        if ( _func_0DA( "axis", "all" ).size <= 8 )
        {

        }

        thread [[ var_0[var_5["event"]] ]]();
        var_4++;

        if ( var_4 >= var_2.events.size )
            break;
    }
}

wait_until_enough_ai_headroom( var_0 )
{
    for (;;)
    {
        if ( _func_0DA( "all" ).size + var_0 <= 32 )
            break;

        wait 1;
    }
}

add_to_schedule( var_0, var_1, var_2 )
{
    var_2 *= 1000;
    var_0._id_9373 += var_2;
    var_3 = [];
    var_3["event"] = var_1;
    var_3["timer"] = var_0._id_9373;
    var_0.events[var_0.events.size] = var_3;
    return var_0;
}

fairground_enemy_helis()
{
    level endon( "seaknight_flies_in" );
    common_scripts\utility::_id_382F( "seaknight_flies_in" );
    wait 5;
    var_0 = [];
    var_0[var_0.size] = "fairground_heli1";
    var_0[var_0.size] = "fairground_heli2";
    var_0[var_0.size] = "fairground_heli3";
    var_0[var_0.size] = "fairground_heli4";
    var_0[var_0.size] = "fairground_heli5";
    var_1 = 26;

    for (;;)
    {
        var_0 = common_scripts\utility::_id_0CF5( var_0 );

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            while ( _func_0DA( "all", "all" ).size >= 31 )
                wait 1;

            var_3 = var_0[var_2];
            thread heli_drops_off_guys_at_fairground( var_3 );
            wait(var_1);
            var_1 -= 2;

            if ( var_1 < 8 )
                var_1 = 8;
        }
    }
}

heli_drops_off_guys_at_fairground( var_0 )
{
    common_scripts\utility::_id_383F( "enemy_choppers_incoming" );
    var_1 = _id_A5A8::_id_8979( var_0 );
    var_1 waittill( "unloading" );
    waitframe;
    wait 6;

    if ( !incoming_heli_exists() )
        common_scripts\utility::_id_3831( "enemy_choppers_incoming" );
}

price_says_this_is_fine()
{
    level endon( "price_picked_up" );

    for (;;)
    {
        if ( _func_0EE( level._id_0318._id_02E2, price_fair_defendspot() ) < level.price_gnoll_dist )
        {
            thread price_line( "this_is_fine" );
            common_scripts\utility::_id_383F( "can_manage_price" );
            return;
        }

        wait 0.5;
    }
}

secondary_path_think()
{
    var_0 = getentarray( self._id_04A6, "targetname" );
    var_0 = common_scripts\utility::_id_0CF6( var_0, self );
    var_0[var_0.size] = self;
    level._id_4242[self._id_04A6] = var_0;
}

should_halt()
{
    if ( !_func_1A1( level._id_6F7C._id_0142 ) )
        return 1;

    return _func_0EE( level._id_6F7C._id_0142._id_02E2, level._id_6F7C._id_02E2 ) > 1024;
}

price_kill_check()
{
    self waittill( "death", var_0 );

    if ( !_func_1A1( var_0 ) )
        return;

    if ( !_func_1A1( level._id_6F7C ) )
        return;

    if ( var_0 != level._id_6F7C )
        return;

    wait 1.0;
    price_calls_out_a_kill();
}

heat_progression_summons_kill_heli()
{
    level.kill_heli_progression++;
    self._id_0204 = level.kill_heli_progression;
    level.kill_heli_progression_triggers[self._id_0204] = 0;
    level.kill_heli_progression_warnings[self._id_0204] = 0;
    level endon( "break_for_apartment" );
    waitframe;
    var_0 = [];
    var_1 = getentarray( "heat_progression", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2]._id_7A18 < self._id_7A18 )
            var_0[var_0.size] = var_1[var_2];
    }

    for (;;)
    {
        self waittill( "trigger" );

        if ( self._id_0204 < level.kill_heli_index && gettime() > level.kill_heli_last_warning_refresh_time )
        {
            level.kill_heli_last_warning_time = 0;
            level.kill_heli_last_warning_refresh_time = gettime() + 5000;
        }

        level.kill_heli_index = self._id_0204;
        level.kill_heli_triggers = var_0;
    }
}

_id_5319()
{
    var_0 = 75;
    var_1 = 68;
    var_2 = 1;
    var_3 = [];
    var_3[var_3.size] = 20;
    var_3[var_3.size] = 40;
    var_3[var_3.size] = 60;
    level.kill_heli_last_warning_time = gettime() + 5000;

    for (;;)
    {
        for ( var_4 = 0; var_4 < level.kill_heli_triggers.size; var_4++ )
        {
            var_5 = level.kill_heli_triggers[var_4]._id_0204;

            if ( level.kill_heli_progression_triggers[var_5] < var_1 )
                level.kill_heli_progression_triggers[var_5]++;
        }

        level.kill_heli_progression_triggers[level.kill_heli_index]++;
        wait 1;

        if ( common_scripts\utility::_id_382E( "break_for_apartment" ) )
            return;

        var_6 = level.kill_heli_progression_triggers[level.kill_heli_index];

        if ( common_scripts\utility::_id_382E( "price_calls_out_kills" ) )
        {
            if ( var_6 > var_3[0] )
                common_scripts\utility::_id_3831( "price_calls_out_kills" );
        }
        else if ( var_6 < var_3[0] )
            common_scripts\utility::_id_383F( "price_calls_out_kills" );

        if ( gettime() > level.kill_heli_last_warning_time )
        {
            if ( var_6 > var_3[level.kill_heli_progression_warnings[level.kill_heli_index]] )
            {
                level.kill_heli_progression_warnings[level.kill_heli_index]++;

                if ( level.kill_heli_progression_warnings[level.kill_heli_index] >= var_3.size )
                    level.kill_heli_progression_warnings[level.kill_heli_index] = var_3.size - 1;

                thread price_line( "gotta_go_" + var_2 );
                var_2++;

                if ( var_2 > 10 )
                    var_2 = 1;

                level.kill_heli_last_warning_time = gettime() + 10000;
            }
        }

        if ( var_6 > var_0 )
            break;
    }

    if ( common_scripts\utility::_id_382E( "break_for_apartment" ) )
        return;

    var_7 = _id_A5A8::_id_8979( "kill_heli" );
    var_7 _meth_8263( "hind_turret_penetration" );
    var_7 waittill( "reached_dynamic_path_end" );
    common_scripts\utility::_id_383F( "kill_heli_attacks" );
    var_8 = common_scripts\utility::_id_40FD( "kill_heli_spot", "targetname" );

    for (;;)
    {
        var_9 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_8 );
        var_7 _meth_827F( 40, 10, 10 );
        var_7 _meth_8256( 100 );
        var_7 _meth_8257( var_9._id_02E2, 1 );
        var_7 waittill( "near_goal" );

        if ( common_scripts\utility::_id_382E( "break_for_apartment" ) )
            return;

        for ( var_4 = 0; var_4 < 30; var_4++ )
        {
            var_10 = _func_115( level._id_0318._id_02E2 - var_7._id_02E2 );
            var_7 _meth_8258( var_10[1] );
            var_7 _meth_825E( level._id_0318, common_scripts\utility::_id_712D( 15 ) + ( 0, 0, 16 ) );
            var_7 _meth_8264();
            wait 0.05;
        }

        wait(_func_0B5( 0.8, 1.3 ));
    }
}

sufficient_time_remaining()
{
    if ( common_scripts\utility::_id_382E( "player_enters_fairgrounds" ) )
        return 1;

    return get_seconds_until_no_saving() > 0;
}

get_seconds_until_no_saving()
{
    return ( level.evac_fail_time - level.evac_min_time_remaining * 1000 * 60 - gettime() ) * 0.001;
}

set_min_time_remaining( var_0 )
{
    level.evac_min_time_remaining = var_0;
    common_scripts\utility::_id_382F( "player_enters_fairgrounds" );
    level notify( "new_min_time" );
    level endon( "new_min_time" );
    level endon( "player_enters_fairgrounds" );
    var_1 = get_seconds_until_no_saving();

    if ( var_1 <= 0 )
    {
        common_scripts\utility::_id_3831( "can_save" );
        return;
    }

    wait(var_1);
    common_scripts\utility::_id_3831( "can_save" );
}

price_fights_until_enemies_leave()
{
    for (;;)
    {
        var_0 = _func_0D9( "axis" );

        if ( !var_0.size )
            return;

        var_1 = common_scripts\utility::_id_3F33( level._id_6F7C._id_02E2, var_0 );

        if ( _func_0EE( var_1._id_02E2, level._id_6F7C._id_02E2 ) > 1000 )
            return;

        wait 0.05;
    }
}

should_break_where_is_he()
{
    return common_scripts\utility::_id_382E( "price_picked_up" ) || common_scripts\utility::_id_382E( "seaknight_prepares_to_leave" );
}

set_c4_throw_binding()
{
    var_0 = 0;
    var_1 = getdvar( "gpad_buttonsConfig" );

    if ( isdefined( var_1 ) )
    {
        if ( _func_120( var_1, "_alt" ) )
            var_0 = 1;
    }

    var_2 = _func_0E0( "+toggleads_throw" );

    if ( var_2["count"] )
    {
        _id_A5A4::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_TOGGLE", maps\sniperescape_exchange::should_break_c4_throw );
        return;
    }

    var_2 = _func_0E0( "+speed_throw" );

    if ( var_2["count"] )
    {
        if ( level._id_0532 || var_0 )
            _id_A5A4::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_SPEED_TRIGGER", maps\sniperescape_exchange::should_break_c4_throw );
        else
            _id_A5A4::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_SPEED", maps\sniperescape_exchange::should_break_c4_throw );

        return;
    }

    var_2 = _func_0E0( "+throw" );

    if ( var_2["count"] )
    {
        _id_A5A4::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4", maps\sniperescape_exchange::should_break_c4_throw );
        return;
    }

    _id_A5A4::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_TOGGLE", maps\sniperescape_exchange::should_break_c4_throw );
}

c4_hint()
{
    var_0 = maps\sniperescape_exchange::getplayerc4();

    if ( !var_0 )
        return;

    thread _id_A5A4::_id_2B4A( "c4" );

    while ( !maps\sniperescape_exchange::should_break_c4() )
        wait 1;

    wait 1.5;
    level.new_c4count = maps\sniperescape_exchange::getplayerc4();

    if ( level.new_c4count == var_0 && self _meth_830E() == "c4" )
        thread _id_A5A4::_id_2B4A( "c4_throw" );
}

burnt_blocker()
{
    var_0 = getent( "burnt_retreat_blocker_trigger", "targetname" );
    var_1 = getent( "burnt_retreat_blocker", "targetname" );
    var_1 _meth_82BB();
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "player_moves_through_burnt_apartment" );
    set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );

    if ( 1 )
        return;

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( _func_1A1( level._id_6F7C ) )
            continue;

        break;
    }

    for (;;)
    {
        var_1 _meth_82BA();
        common_scripts\utility::_id_3857( "price_picked_up" );
        var_1 _meth_82BB();
        common_scripts\utility::_id_384A( "price_picked_up" );
    }
}

house_chase_spawner()
{
    self endon( "death" );

    for (;;)
    {
        if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) < 400 )
            break;

        wait 0.05;
    }

    self._id_01C4 = 1024;

    for (;;)
    {
        self _meth_81AA( level._id_0318._id_02E2 );
        wait 0.5;
    }
}

fair_spawner_seeks_player()
{
    self endon( "death" );
    wait 30;
    _id_A5A4::_id_27EF( _func_0B4( 25, 35 ), _id_A5A4::_id_2A51 );
    self._id_01C4 = 512;

    for (;;)
    {
        self _meth_81AA( level._id_0318._id_02E2 );
        wait 5;
    }
}

handle_radiation_warning()
{
    for (;;)
    {
        level waittill( "radiation_warning" );
        price_line( "scoutsniper_mcm_youdaft" );
    }
}

sniper_escape_initial_secondary_weapon_loadout()
{
    level._id_0318 _meth_830B( "claymore" );
    level._id_0318 _meth_830B( "c4" );

    if ( level._id_3BFE >= 2 )
    {
        level._id_0318 _meth_82F3( "claymore", 10 );
        level._id_0318 _meth_82F3( "c4", 6 );
    }
    else
    {
        level._id_0318 _meth_82F3( "claymore", 8 );
        level._id_0318 _meth_82F3( "c4", 3 );
    }

    level._id_0318 _meth_8305( 4, "weapon", "claymore" );
    level._id_0318 _meth_8305( 2, "weapon", "c4" );
    level._id_0318 _meth_830B( "fraggrenade" );
    level._id_0318 _meth_830B( "flash_grenade" );
    level._id_0318 _meth_831D();
    level._id_0318 _meth_8340( "viewhands_marine_sniper" );
}

set_legit_weapons_for_sniper_escape()
{
    level.sniperescape_main_weapon = "m14_scoped_woodland";
    var_0 = [];
    var_0["mp5"] = 1;
    var_0["usp_silencer"] = 1;
    var_0["ak47"] = 1;
    var_0["g3"] = 1;
    var_0["usp"] = 1;
    var_0[level.sniperescape_main_weapon] = 1;
    var_0["dragunov"] = 1;
    var_0["winchester1200"] = 1;
    var_0["beretta"] = 1;
    var_0["rpd"] = 1;
    var_0["rpg"] = 1;
    var_0["m14_scoped_silencer"] = 1;
    var_0["g36c"] = 1;
    var_0["p90_silencer"] = 1;
    level.legit_weapons = var_0;
}

max_ammo_on_legit_sniper_escape_weapon()
{
    var_0 = level._id_0318 _meth_8308();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( !isdefined( level.legit_weapons[var_2] ) )
            continue;

        if ( var_2 == "rpg" )
            continue;

        level._id_0318 _meth_832F( var_2 );
    }
}

force_player_to_use_legit_sniper_escape_weapon()
{
    var_0 = level._id_0318 _meth_8309();
    var_1 = [];
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];
        var_1[var_4] = 1;

        if ( isdefined( level.legit_weapons[var_4] ) )
        {
            var_2++;
            continue;
        }

        level._id_0318 _meth_830C( var_4 );
    }

    if ( var_2 == 2 )
        return;
    else if ( var_2 == 1 )
    {
        if ( player_has_legit_sniper_rifle( var_1 ) )
        {
            level._id_0318 _meth_830B( "ak47" );
            level._id_0318 _meth_8312( "ak47" );
        }
        else
        {
            level._id_0318 _meth_830B( level.sniperescape_main_weapon );
            level._id_0318 _meth_8312( level.sniperescape_main_weapon );
        }
    }
    else if ( var_2 == 0 )
    {
        level._id_0318 _meth_830B( "ak47" );
        level._id_0318 _meth_830B( level.sniperescape_main_weapon );
        level._id_0318 _meth_8312( level.sniperescape_main_weapon );
    }
}

player_has_legit_sniper_rifle( var_0 )
{
    return isdefined( var_0[level.sniperescape_main_weapon] ) || isdefined( var_0["dragunov"] ) || isdefined( var_0["m14_scoped_silencer"] );
}

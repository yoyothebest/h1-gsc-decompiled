// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

bring_out_the_hounds()
{
    level endon( "break_for_apartment" );
    wait 20;
    var_0 = getentarray( "kill_dog_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_0798, ::seek_player );

    for (;;)
    {
        if ( _func_0DA( "all", "all" ).size >= 24 )
        {
            wait 1;
            continue;
        }

        var_1 = common_scripts\utility::_id_3CCB( level._id_0318._id_02E2, var_0 );
        var_2 = 0;

        for ( var_3 = var_1.size - 1; var_3 >= 0; var_3-- )
        {
            var_4 = var_1[var_3];

            if ( _func_08D( level._id_0318._id_02E2 + ( 0, 0, 32 ), var_4._id_02E2 + ( 0, 0, 32 ), 0, level._id_0318 ) )
                continue;

            var_2++;
            var_4.count = 1;
            var_4 _meth_8095();
            wait(_func_0B3( 2 ));

            if ( var_2 >= 8 )
                break;
        }

        wait 3;
    }
}

seek_player()
{
    self endon( "death" );

    for (;;)
    {
        self _meth_81AA( level._id_0318._id_02E2 );
        self._id_01C4 = 512;
        wait 1;
    }
}

pool_dog_think( var_0 )
{
    self._id_04A7 = "allies";
    var_1 = "dog_food";

    if ( !isdefined( level.first_pool_dog ) )
    {
        level.first_pool_dog = 1;
        thread dog_loop_sound();
    }

    self endon( "death" );
    self.allowdeath = 1;
    var_2 = getent( self._id_04A4, "targetname" );
    self._id_60FA = 1;
    var_2 thread _id_A510::_id_0BCE( self, var_1 );
    wait 0.05;
    self _meth_8119( _id_A5A4::_id_3EF7( "dog_food_nonidle" ), _func_0B3( 1 ) );
    self._id_01C2 = 512;
    thread dog_attacks_player_if_he_feels_threatened( var_2 );
    common_scripts\utility::_id_384A( "fairbattle_high_intensity" );

    if ( !common_scripts\utility::_id_382E( "player_looked_in_pool" ) )
        self delete();

    wait 3;
    var_2 notify( "stop_loop" );
    self _meth_8143();
    self._id_01C4 = 20;
    var_3 = getent( "park_reinforce" + ( var_0 + 1 ), "targetname" );
    self _meth_81AA( var_3._id_02E2 );
}

dog_loop_sound()
{
    common_scripts\utility::_id_383D( "dogs_disturbed" );
    self _meth_8077( "anml_dogs_eating_body_loop" );
    level _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "dogs_disturbed" );
    _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    _id_A5A4::_id_2BDD();

    if ( _func_1A1( self ) )
        self _meth_80AD( "anml_dogs_eating_body_loop" );
}

wait_for_angry_dog()
{
    level endon( "dog_attack_trigger" );

    for (;;)
    {
        common_scripts\utility::_id_3857( "price_picked_up" );
        common_scripts\utility::_id_384A( "pool_lookat" );

        if ( !common_scripts\utility::_id_382E( "price_picked_up" ) )
            break;
    }
}

dog_attacks_player_if_he_feels_threatened( var_0 )
{
    self endon( "death" );
    level endon( "fairbattle_high_intensity" );
    wait_for_angry_dog();
    var_0 notify( "stop_loop" );
    self _meth_8143();
    common_scripts\utility::_id_383F( "dogs_disturbed" );
    wait(_func_0B5( 0.2, 0.9 ));
    var_1 = getent( "dog_flee_org", "targetname" );
    self _meth_8143();
    _id_A581::_id_4248( var_1 );
    self delete();
}

go_prone_line_check()
{
    if ( common_scripts\utility::_id_382E( "price_told_player_to_go_prone" ) )
        return;

    var_0 = level._id_0318 _id_A5A4::_id_4088();

    if ( var_0 > 0 )
        return;

    thread maps\sniperescape_code::price_line( "find_spot_go_prone" );
    common_scripts\utility::_id_383F( "price_told_player_to_go_prone" );
}

wait_for_player_to_place_claymores()
{
    var_0 = 0;
    var_1 = level._id_0318 _id_A5A4::_id_4088();

    for ( var_2 = 0; var_2 < 30; var_2++ )
    {
        var_3 = level._id_0318 _id_A5A4::_id_4088();

        if ( var_3 < var_1 )
            var_0 += 3.5;

        var_1 = var_3;

        if ( level._id_0318 _meth_8180() == "prone" && var_3 == 0 )
            return;

        go_prone_line_check();
        wait 1;
    }

    if ( var_0 > 0 )
    {
        for ( var_2 = 0; var_2 < var_0; var_2++ )
        {
            var_3 = level._id_0318 _id_A5A4::_id_4088();

            if ( level._id_0318 _meth_8180() == "prone" && var_3 == 0 )
                return;

            go_prone_line_check();
            wait 1;
        }
    }
}

autosave_on_good_claymore_placement( var_0 )
{
    var_1 = getent( "alt_fair_trigger", "targetname" );

    for ( var_2 = 0; var_2 < 5; var_2++ )
    {
        if ( level._id_0318 _meth_80AB( var_1 ) )
        {
            wait 1;
            continue;
        }

        break;
    }

    if ( level._id_0318 _meth_80AB( var_1 ) )
        return 0;

    var_3 = getentarray( "claymore_spot", "targetname" );

    if ( var_0 <= 0 )
        return 1;

    var_4 = var_0 * 0.4;
    var_4 = _func_0BC( var_4 );
    var_5 = getentarray( "grenade", "classname" );
    var_6 = _id_A5A4::_id_7390( var_5, "claymore" );
    var_7 = 0;

    for ( var_2 = 0; var_2 < var_6.size; var_2++ )
    {
        for ( var_8 = 0; var_8 < var_3.size; var_8++ )
        {
            if ( _func_0EE( var_6[var_2]._id_02E2, var_3[var_8]._id_02E2 ) < var_3[var_8]._id_0351 )
            {
                var_7++;
                break;
            }
        }

        if ( var_7 >= var_4 )
            return 1;
    }

    return 0;
}

_id_60FD()
{
    self._id_01D0 = 0;
}

price_says_a_bit_farther()
{
    level endon( "beacon_placed" );
    common_scripts\utility::_id_382F( "beacon_placed" );
    var_0 = getent( "price_putdown_hint_trigger", "targetname" );
    var_1 = [];
    var_2 = 0;
    var_1[var_1.size] = "a_bit_farther_north_2";
    var_1[var_1.size] = "check_your_compass";

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( common_scripts\utility::_id_382E( "price_picked_up" ) )
        {
            maps\sniperescape_code::price_line( var_1[var_2] );
            var_2++;

            if ( var_2 >= var_1.size )
                var_2 = 0;

            wait(_func_0B5( 10, 12 ));
        }
    }
}

fairground_keep_player_out_of_pool()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "player_goes_to_pool" );
        common_scripts\utility::_id_3831( "can_save" );
        wait(_func_0B3( 4 ));

        if ( !common_scripts\utility::_id_382E( "player_goes_to_pool" ) )
        {
            if ( !common_scripts\utility::_id_382E( "seaknight_lands" ) )
                common_scripts\utility::_id_383F( "can_save" );

            continue;
        }

        maps\sniperescape_code::price_dies();
        common_scripts\utility::_id_3857( "player_goes_to_pool" );
    }
}

player_abandons_seaknight_protection()
{
    common_scripts\utility::_id_384A( "price_picked_up" );
    level waittill( "foawerawer" );
    common_scripts\utility::_id_383F( "seaknight_leaves_prematurely" );
}

wait_for_seaknight_to_take_off()
{
    level endon( "seaknight_leaves_prematurely" );
    common_scripts\utility::_id_384A( "player_made_it_to_seaknight" );
}

player_boards_seaknight( var_0, var_1 )
{
    var_2 = 0;

    for (;;)
    {
        if ( _func_1A1( level._id_6F7C ) )
            objective_position( getobj( "seaknight" ), level._id_6F7C._id_02E2 );
        else
            objective_position( getobj( "seaknight" ), var_1._id_02E2 );

        wait 0.05;

        if ( _func_0EE( level._id_0318._id_02E2, var_1._id_02E2 ) >= var_1._id_0351 )
            continue;

        if ( !_func_1A1( level._id_6F7C ) )
            break;

        if ( !var_2 )
        {
            thread maps\sniperescape_code::price_line( "where_is_he" );
            var_2 = 1;
            level._id_0318 _id_A5A4::_id_27EF( 2, _id_A5A4::_id_2B4A, "where_is_he" );
        }
    }

    if ( common_scripts\utility::_id_382E( "seaknight_leaves" ) )
        return;

    thread player_cant_die();
    common_scripts\utility::_id_383F( "player_made_it_to_seaknight" );
    _id_A546::_id_8AF4();
    level._id_0318 _meth_831A();
    _id_A5A4::enable_scuff_footsteps_sound( 0 );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        var_3 = _id_A5A4::_id_88D1( level.wounded_model );
        var_3 _meth_8056();
    }
    else
    {
        maps\_move_with_animation::carrystop();
        level._id_0318 _meth_807F( level.eplayerview, "tag_player", 1, 0, 0, 0, 0 );
        var_3 = level.eplayerview;
    }

    var_0 _id_A510::_id_0BC7( var_3, "wounded_seaknight_putdown", "tag_detach" );
    var_3 _meth_804F( var_0, "tag_detach" );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        var_3 _id_A5A4::_id_5696( "tag_player", 0.5, 0.9, 35, 35, 45, 0 );

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        level.price_carried delete();

    var_4 = getent( "price_spawner", "targetname" );
    var_4._id_0C72 = "price";
    var_4._id_02E2 = level._id_0318._id_02E2;
    var_4.count = 1;
    level._id_6F7C = var_4 _meth_8096();
    _id_A5A4::_id_88F1( level._id_6F7C );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C _meth_80B3( "body_complete_usmc_ghillie_price_damaged" );
    level._id_6F7C thread maps\sniperescape::monitor_macmellon();
    var_5 = [];
    var_5[var_5.size] = var_3;
    var_5[var_5.size] = level._id_6F7C;
    _id_A5A4::_id_0761( "axis", ::no_accuracy );
    var_6 = _func_0D9( "axis" );
    common_scripts\utility::_id_0D13( var_6, ::no_accuracy );
    _id_A5A4::_id_27EF( 0.5, common_scripts\utility::_id_383F, "player_putting_down_price_seaknight" );
    var_0 _id_A510::_id_0C18( var_5, "wounded_seaknight_putdown", "tag_detach" );
    level._id_6F7C delete();
    level._id_0318 _meth_831B();
    level._id_0318 _meth_807F( var_3, "tag_player", 1, 20, 45, 5, 25 );
}

no_accuracy()
{
    self endon( "death" );
    self._id_1300 = 0;
    level waittill( "stop_having_low_accuracy" );
    self._id_1300 = 1;
}

seaknight_leaving_warning( var_0 )
{
    level endon( "player_made_it_to_seaknight" );
    wait(var_0 - 30);
    thread maps\sniperescape_code::price_line( "heli_got_thirty_seconds" );
    wait 30;
    thread maps\sniperescape_code::price_line( "heli_goodbye" );
}

update_objective_position_for_fairground( var_0 )
{
    level endon( "price_moves_to_position" );
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::_id_3857( "price_picked_up" );
        objective_position( var_0, level._id_6F7C._id_02E2 );
        thread price_complains_until_he_is_picked_up();
        common_scripts\utility::_id_384A( "price_picked_up" );
        objective_position( var_0, maps\sniperescape_code::price_fair_defendspot() );
    }
}

price_complains_until_he_is_picked_up()
{
    level endon( "price_picked_up" );
    level endon( "price_moves_to_position" );
    wait 0.5;
    var_0 = getent( "price_putdown_hint_trigger", "targetname" );

    for (;;)
    {
        if ( level._id_6F7C _meth_80AB( var_0 ) )
            maps\sniperescape_code::price_line( "pick_me_up_and_move_me" );
        else
            maps\sniperescape_code::price_line( "over_there_behind_ferris_wheel" );

        wait(_func_0B3( 7 ));

        if ( level._id_6F7C _meth_80AB( var_0 ) )
            maps\sniperescape_code::price_line( "a_bit_farther_north" );
        else
            maps\sniperescape_code::price_line( "over_to_that_hill" );

        wait(_func_0B3( 6 ));
    }
}

plant_price()
{
    var_0 = _func_08F( level._id_6F7C._id_02E2 + ( 0, 0, 2 ), level._id_6F7C._id_02E2 + ( 0, 0, -100 ), level._id_6F7C );
    level._id_6F7C _meth_81C9( var_0 );
}

player_gets_on_barret()
{
    var_0 = getent( "turret2", "targetname" );
    var_0 _meth_815C( -30 );
    var_0 _meth_815D();

    for (;;)
    {
        if ( isdefined( var_0 _meth_80ED() ) )
            break;

        wait 0.05;
    }

    setomnvar( "ui_barret", 1 );
    common_scripts\utility::_id_383F( "player_on_barret" );
    _id_A5E8::_id_870C( "start_snipe_scoped_in_mix" );
}

get_ent_with_key_from_array( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_1, var_2 );

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        {
            if ( var_3[var_5] == var_0[var_4] )
                return var_3[var_5];
        }
    }
}

go_axis()
{
    self._id_04A7 = "axis";
}

modify_objective_destination_babystep( var_0 )
{
    var_1 = getent( "objective_depth", "targetname" );
    var_2 = getent( var_1._id_04A4, "targetname" );
    var_3 = getent( var_1._id_7A26, "script_linkname" );
    var_4 = getent( var_3._id_04A4, "targetname" );
    objective_position( var_0, var_3._id_02E2 );
    var_5 = var_2._id_02E2;
    var_6 = var_5 + ( var_1._id_02E2 - var_5 ) * 2;
    var_7 = _func_0EE( var_5, var_6 );
    var_8 = common_scripts\utility::_id_8959();
    var_8._id_02E2 = var_3._id_02E2;
    objective_onentity( var_0, var_8 );

    for (;;)
    {
        var_1 waittill( "trigger", var_9 );
        var_10 = undefined;

        while ( level._id_0318 _meth_80AB( var_1 ) )
        {
            var_10 = _id_A5A4::_id_3E3D( var_5, var_6, level._id_0318._id_02E2, var_7 );

            if ( var_10 < 0 )
                var_10 = 0;

            if ( var_10 > 1 )
                var_10 = 1;

            var_1 set_obj_progress( var_0, var_10, var_3._id_02E2, var_4._id_02E2, var_8 );

            if ( var_10 == 1 )
                break;

            wait 0.05;
        }

        var_10 = 0;
        var_1 set_obj_progress( var_0, var_10, var_3._id_02E2, var_4._id_02E2, var_8 );
    }

    var_1 delete();
}

set_obj_progress( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3 * var_1 + var_2 * ( 1 - var_1 );
    var_4._id_02E2 = var_5;
}

rappel_obj_org()
{
    var_0 = _func_0C3( "player_rappel_node", "targetname" );
    return var_0._id_02E2;
}

addobj( var_0 )
{
    level._id_6302[var_0] = level._id_6302.size;
}

getobj( var_0 )
{
    return level._id_6302[var_0];
}

apartment_price_waits_for_dog_death()
{
    level._id_6F7C endon( "death" );
    var_0 = getent( "price_dog_death_trigger", "targetname" );
    var_0 waittill( "trigger" );

    if ( !common_scripts\utility::_id_382E( "fence_dog_dies" ) )
    {
        level._id_6F7C._id_0130 = 1;
        level._id_6F7C _id_A5A4::_id_7E38( "p" );
        common_scripts\utility::_id_384A( "fence_dog_dies" );
        level._id_6F7C _id_A5A4::_id_7E38( "y" );
        level._id_6F7C._id_0130 = 0;
    }
}

pool_have_body()
{
    var_0 = getent( "dog_body", "targetname" );
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1._id_02E2 = var_0._id_02E2;
    var_1.angles = var_0.angles;
    var_1._id_0C72 = "dead_guy";
    var_1 _id_A5A4::_id_0D61();
    var_1 character\character_sp_spetsnaz_derik::main();
    var_1 _meth_855D();
    var_1 _meth_814D( var_1 _id_A5A4::_id_3EF5( "pool_death" ), 1, 0, 1 );
}

heat_helis_transport_guys_in()
{
    common_scripts\utility::_id_384A( "heat_heli_transport" );
    level endon( "heat_enemies_back_off" );

    for (;;)
    {
        _id_A5A8::_id_8979( "heat_transport_1" );
        wait 10;
        _id_A5A8::_id_8979( "heat_transport_2" );
        wait 25;
    }
}

fairground_patrollers()
{
    common_scripts\utility::_id_76B9( "fair_patroller_spawner", _id_A5A4::_id_0798, ::fair_patroller_reset_sight_dist );
    common_scripts\utility::_id_76B9( "fair_patroller_spawner", _id_A5A4::_id_0798, ::fair_patroller_think );
    common_scripts\utility::_id_384A( "pool_heli_attacks" );
    common_scripts\utility::_id_76B9( "fair_patroller_spawner", _id_A5A4::_id_88C3 );
}

fair_patroller_think()
{
    self endon( "death" );
    self._id_0273 = 360000;
    _id_A55F::_id_66FC( self._id_04A4, 1, 1 );
    self notify( "stop_going_to_node" );
    _id_A5A4::_id_1ED1();
    var_0 = _func_0C3( "fair_sniper_node", "targetname" );

    if ( _func_1A1( self._id_0142 ) && self._id_0142.classname == "actor_enemy_dog" )
    {
        self._id_02F6 = 0;
        self._id_02F7 = 0;
        self _meth_81A9( var_0 );
        self._id_01C4 = var_0._id_0351;
        self._id_0142 waittill( "death" );
        _id_A5A4::_id_7E0B();
        return;
    }

    self _meth_81A9( var_0 );
    self._id_01C4 = var_0._id_0351;
}

fair_patroller_reset_sight_dist()
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "player_enters_fairgrounds" );
    self._id_0273 = 640000;
}

seaknight_sound()
{
    var_0 = "sniperescape_seaknight_fly";
    var_1 = "sniperescape_seaknight_idle";
    var_2 = spawn( "sound_blend", ( 0, 0, 0 ) );
    var_2 thread _id_A5A4::_id_5972( self, ( 0, 0, 0 ) );
    var_3 = spawn( "sound_blend", ( 0, 0, 0 ) );
    var_3 thread _id_A5A4::_id_5972( self, ( 0, 0, 64 ) );
    _id_A5E8::_id_870C( "seaknight_rescue_submix_arrival" );
    thread play_extra_seaknight_sound();
    var_2 thread _id_A5A4::_id_5CEC( var_0 );
    common_scripts\utility::_id_384A( "seaknight_lands" );
    _id_A5E8::_id_870C( "seaknight_rescue_submix" );
    var_2 thread _id_A5A4::_id_5CEA( var_0 );
    var_3 thread _id_A5A4::_id_5CEC( var_1 );
    common_scripts\utility::_id_384A( "seaknight_prepares_to_leave" );
    _id_A5E8::_id_870C( "seaknight_rescue_submix_waiting" );
    common_scripts\utility::_id_384A( "seaknight_leaves" );
    var_2 thread _id_A5A4::_id_5CEC( var_0 );
    var_3 thread _id_A5A4::_id_5CEA( var_1 );
    _id_A5E8::_id_870C( "seaknight_rescue_submix_fade_out" );
    level.seaknight _meth_809C( "mi17_by_windup_02" );
}

play_extra_seaknight_sound()
{
    wait 19.5;
    level.seaknight _meth_8077( "seaknight_idle_high" );
}

bus_grenade_think()
{
    var_0 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );

    for (;;)
    {
        self waittill( "trigger" );
        wait 4;

        if ( !common_scripts\utility::_id_382E( "kill_heli_attacks" ) )
            continue;

        for (;;)
        {
            if ( !self _meth_80AB( level._id_0318 ) )
                break;

            var_1 = common_scripts\utility::_id_3CCB( level._id_0318._id_02E2, var_0 );
            var_1 = remove_can_sighttrace( level._id_0318._id_02E2, var_1 );

            if ( !var_1.size )
            {
                wait 0.5;
                continue;
            }

            var_2 = [];

            for ( var_3 = 0; var_3 < 3; var_3++ )
            {
                if ( var_3 > var_1.size )
                    break;

                var_2[var_2.size] = var_1[var_3];
            }

            var_4 = common_scripts\utility::_id_710E( var_2 );
            var_4 spot_launches_grenade();
            wait(_func_0B3( 1.0 ));
        }
    }
}

spot_launches_grenade()
{
    var_0 = common_scripts\utility::_id_40FB( self._id_04A4, "targetname" );
    var_1 = _func_0D9( "axis" );

    if ( !var_1.size )
        return;

    var_1[0]._id_01D6 = "fraggrenade";
    var_1[0] _meth_8039( self._id_02E2, var_0._id_02E2, _func_0B3( 4 ) );
}

remove_can_sighttrace( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( !_func_08E( var_0, var_1[var_3]._id_02E2, 1, undefined ) )
            var_2[var_2.size] = var_1[var_3];
    }

    return var_2;
}

fair_grenade_trigger_think()
{
    var_0 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );
    var_1 = [];
    var_1[0] = 25;
    var_1[1] = 20;
    var_1[2] = 15;
    var_1[3] = 15;
    var_2 = 0;

    for (;;)
    {
        if ( !self _meth_80AB( level._id_0318 ) )
            self waittill( "trigger" );

        var_3 = _func_0D9( "axis" );

        if ( !var_3.size )
        {
            wait 1;
            continue;
        }

        var_4 = common_scripts\utility::_id_3F33( level._id_0318._id_02E2, var_3 );

        if ( _func_0EE( var_4._id_02E2, level._id_0318._id_02E2 ) > 1500 )
        {
            wait 1;
            continue;
        }

        if ( var_2 < var_1[level._id_3BFE] )
        {
            var_2++;
            wait 1;
            continue;
        }

        var_5 = common_scripts\utility::_id_710E( var_0 );
        var_5 spot_launches_grenade();
        wait(_func_0B3( 5.0 ));
    }
}

heli_shoots_targetnamed_rocket( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 _meth_80B3( "tag_origin" );
    var_3 _meth_809C( "weap_lau61c_fire" );
    var_3._id_02E2 = var_2._id_02E2;
    playfx( common_scripts\utility::_id_3FA8( "heli_missile_launch" ), var_3._id_02E2 );
    var_3 _meth_8077( "h1_scn_se_rocket_trail" );
    playfxontag( common_scripts\utility::_id_3FA8( "rocket_geo" ), var_3, "tag_origin" );

    if ( !isdefined( var_1 ) )
        var_3.units_per_second = 2000;
    else
        var_3 thread wall_explosion_rocket_acceleration( var_1 );

    for (;;)
    {
        if ( isdefined( var_2._id_0398 ) && isdefined( _func_0BC( var_2._id_0398 ) ) )
            thread common_scripts\_exploder::_id_3528( _func_0BC( var_2._id_0398 ) );

        if ( !isdefined( var_2._id_04A4 ) )
            break;

        var_4 = getent( var_2._id_04A4, "targetname" );
        var_5 = _func_0EE( var_2._id_02E2, var_4._id_02E2 );
        var_6 = var_5 / var_3.units_per_second;
        var_3 _meth_82AA( var_4._id_02E2, var_6, 0, 0 );
        var_2 = var_4;
        wait(var_6);
    }

    thread common_scripts\utility::_id_69C2( "scn_se_rocket_explode_building", var_3._id_02E2 );
    var_3 delete();
}

wall_explosion_rocket_acceleration( var_0 )
{
    self endon( "death" );
    self.units_per_second = var_0.startspeed;

    while ( isdefined( self ) && self.units_per_second < var_0.finalspeed )
    {
        self.units_per_second += var_0.acceleration * 0.05;

        if ( self.units_per_second >= var_0.finalspeed )
        {
            self.units_per_second = var_0.finalspeed;
            break;
        }

        wait 0.05;
    }
}

linktoblade( var_0 )
{
    self _meth_804F( var_0, self._id_0428, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    self.root = var_0;
}

spawn_blade( var_0 )
{
    var_1 = _id_A5A4::_id_88D1( "blade1" );
    var_2 = _id_A5A4::_id_88D1( "blade2" );
    var_3 = _id_A5A4::_id_88D1( "blade3" );
    var_4 = _id_A5A4::_id_88D1( "blade4" );
    var_5 = _id_A5A4::_id_88D1( "blade5" );
    var_2._id_0428 = "tag_blade1";
    var_3._id_0428 = "tag_blade2";
    var_4._id_0428 = "tag_blade3";
    var_5._id_0428 = "tag_blade4";
    var_6 = [];
    var_6[var_6.size] = var_2;
    var_6[var_6.size] = var_3;
    var_6[var_6.size] = var_4;
    var_6[var_6.size] = var_5;
    var_1.blades = var_6;
    common_scripts\utility::_id_0D13( var_6, ::linktoblade, var_1 );
    var_6[var_6.size] = var_1;
    common_scripts\utility::_id_0D13( var_6, ::get_blade_clip );
    var_1._id_0C72 = var_0;
    return var_1;
}

get_blade_clip()
{
    var_0 = getentarray( "clip_" + self._id_0C72, "targetname" );
    var_1 = var_0[0];
    var_1._id_04A6 = "used";
    var_1._id_02E2 = self._id_02E2;
    var_1.angles = self.angles;
    var_1 _meth_804F( self );
    var_1 thread kill_toucher_until_msg( "blades_stop_killing" );
    common_scripts\utility::_id_384A( "heli_comes_to_rest" );
    var_1 delete();
}

kill_toucher_until_msg( var_0 )
{
    level endon( var_0 );
    kill_player_on_touch( self );
}

kill_player_on_touch( var_0 )
{
    level._id_0318 endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( var_0 _meth_80AB( level._id_0318 ) || level._id_0318._id_02E2[2] < -50 )
        {
            level._id_0318 _meth_8134( 0 );
            level._id_0318 _id_A5A4::_id_2A51();
            level._id_0318 _id_A5A4::_id_2A51();
            level._id_0318 _id_A5A4::_id_2A51();
            level._id_0318 _id_A5A4::_id_2A51();
        }

        wait 0.05;
    }
}

spawn_blades()
{
    var_0 = [];

    for ( var_1 = 1; var_1 <= 5; var_1++ )
        var_0[var_0.size] = spawn_blade( "blade" + var_1 );

    return var_0;
}

remove_blade( var_0 )
{
    var_1 = var_0.blades[var_0.blades.size - 1];
    var_0.blades[var_0.blades.size - 1] = undefined;
    playfx( common_scripts\utility::_id_3FA8( "rotor_smash" ), var_1._id_02E2, var_1.angles );
    var_1 delete();
}

drawpos()
{
    var_0 = self.root _meth_8184( self._id_0428 );
    var_1 = self.root _meth_8185( self._id_0428 );

    for (;;)
    {
        _id_A526::_id_2DD0( var_0, var_1 );
        wait 0.05;
    }
}

rotor_blades( var_0 )
{
    var_1 = spawn_blades();
    var_0._id_02BB thread _id_A510::_id_0C18( var_1, "spin" );
    var_0 _meth_804A( "main_rotor_jnt" );
    var_0 _meth_804A( "tail_rotor_jnt" );
}

rotor_hub( var_0 )
{
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 _meth_80B3( "vehicle_mi28_center_hub" );
    var_1._id_02E2 = var_0 _meth_8184( "main_rotor_jnt" );
    var_1.angles = var_0 _meth_8185( "main_rotor_jnt" );
    var_1 _meth_804F( var_0, "main_rotor_jnt" );
}

add_dirtmodel( var_0, var_1 )
{
    var_2 = spawn( "script_model", ( 90, 0, 0 ) );
    var_2 _meth_80B3( "tag_origin" );
    var_2 _meth_8056();
    var_2 _meth_804F( self, "tag_body", var_0, var_1 );
    return var_2;
}

surprisers_die_soon()
{
    self endon( "death" );
    wait(_func_0B5( 6, 9 ));
    _id_A5A4::_id_2A51();
}

drawatag()
{
    for (;;)
    {
        var_0 = getdvar( "heli_tag" );

        if ( var_0 != "" )
            _id_A526::_id_2DE7( var_0 );

        wait 0.05;
    }
}

final_heli_clip()
{
    self _meth_82BB();
    common_scripts\utility::_id_384A( "heli_comes_to_rest" );
    level.price_heli._id_1F96 delete();
    self _meth_82BA();

    if ( !level._id_0318 _meth_80AB( self ) )
        return;

    for (;;)
    {
        level._id_0318 _meth_8134( 0 );
        level._id_0318 _id_A5A4::_id_2A51();
        level._id_0318 _id_A5A4::_id_2A51();
        level._id_0318 _id_A5A4::_id_2A51();
        level._id_0318 _id_A5A4::_id_2A51();
        wait 0.05;
    }
}

heli_dirt_mesh()
{
    self _meth_82AD( -40, 0.5 );
    self _meth_8056();
    common_scripts\utility::_id_384A( "heli_swap_dirt" );
    self _meth_8055();
    self _meth_82AD( 40, 0.5 );
}

heli_dirt_mesh_hide()
{
    common_scripts\utility::_id_384A( "heli_swap_dirt" );
    self _meth_82AD( -8, 0.5 );
    wait 0.5;
    self _meth_8056();
}

heli_fence_clip_delete()
{
    common_scripts\utility::_id_384A( "heli_swap_dirt" );
    self delete();
}

heli_attacks_price_new()
{
    var_0 = _func_0C3( "price_apartment_destination_node", "targetname" );
    var_1 = _id_A5A8::_id_8979( "heli_price" );
    level.heli_turret = var_1._id_5BD5;
    var_2 = var_1;
    var_1 = var_1 _id_A5A8::_id_9D58();
    var_3 = getent( "death_heli_clip", "targetname" );
    var_3 _meth_804F( var_1, "origin_animate_jnt", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 _meth_8056();
    var_1 thread kill_toucher_until_stop( var_3 );
    var_1._id_1F96 = var_3;
    var_4 = spawn( "script_model", ( 0, 0, 0 ) );
    var_4 _meth_80B3( "tag_origin" );
    var_4 _meth_8056();
    var_4 _meth_804F( var_1, "tail_rotor_jnt", ( 0, 0, 0 ), ( 0, 90, 0 ) );
    var_5 = [];
    var_6 = 1;
    var_7 = 230;
    var_8 = var_7 / var_6;

    for ( var_9 = 0; var_9 < var_6; var_9++ )
        var_5[var_5.size] = var_1 add_dirtmodel( ( -20 + var_8 * var_9, 0, -70 ), ( 0, 90, 0 ) );

    level.price_heli = var_1;
    var_1._id_0C72 = "mi28";
    wait 1;
    level._id_6F7C endon( "death" );
    var_0 = _func_0C3( "price_wounding_node", "targetname" );
    var_1._id_02BB = var_0;
    var_10 = [];
    var_10[var_10.size] = var_1;
    var_10[var_10.size] = level._id_6F7C;
    thread price_death_failure();
    thread price_swap_to_damaged_model();
    level._id_6F7C _id_A5A4::_id_39D0( level._id_6F7C._id_0340, "primary" );
    level._id_6F7C._id_615B = 1;
    level._id_6F7C._id_6109 = 1;
    _id_A5A4::_id_07BE( ::wait_for_surprise_guys );
    _id_A5A4::_id_07BE( _id_A5A4::_id_0694, 20 );
    _id_A5A4::_id_2BDD();
    common_scripts\utility::_id_383F( "crash_heli_shows_up" );
    common_scripts\utility::_id_0D13( level._id_265B["surprise_guys_dead"]["ai"], ::surprisers_die_soon );
    common_scripts\utility::_id_0D13( level._id_265B["patrol_guys_dead"]["ai"], ::surprisers_die_soon );
    _id_A5E8::_id_870C( "havoc_appear_mix" );
    var_11 = getent( "havoc_arrival_sfx", "targetname" );
    var_11 thread common_scripts\utility::_id_69C2( "h1_havoc_appear", var_11._id_02E2 );

    if ( getdvarint( "use_old_point_chopper" ) == 1 )
    {
        _id_A5A4::_id_27EF( 3, maps\sniperescape_code::price_line, "incoming_helicopter" );
        var_0 _id_A510::_id_0C24( var_1, "entrance" );
        var_0 thread _id_A510::_id_0BE1( var_1, "idle", undefined, "heli_loop" );
        var_0 _id_A510::_id_0BFF( level._id_6F7C, "crash" );
        common_scripts\utility::_id_3856( "surprise_guys_dead", 20 );
        var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "precrash_idle", undefined, "price_loop" );
    }
    else
    {
        var_0 thread _id_A510::_id_0C24( var_1, "entrance" );
        var_1 thread heli_to_idle_once_in_place( var_0 );
        level._id_6F7C _meth_81CE( "stand" );
        common_scripts\utility::_id_3856( "surprise_guys_dead", 20 );
        level._id_6F7C._id_01FB = 1;
        level._id_6F7C.a.animreachcustomradius = 10;
        thread _id_A510::_id_0BFC( level._id_6F7C, 3 );
        var_0 _id_A510::_id_0BFF( level._id_6F7C, "crash" );
        level._id_6F7C.a.animreachcustomradius = undefined;
        var_12 = spawn( "script_origin", level._id_6F7C._id_02E2 );
        var_12.angles = ( 0, 35, 0 );
        var_12 _id_A510::_id_0C24( level._id_6F7C, "chopper_point" );
        var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "precrash_idle", undefined, "price_loop" );
        level._id_6F7C._id_01FB = 0;
        level._id_6F7C._id_615B = undefined;
        level._id_6F7C._id_6109 = undefined;
    }

    wait 1;
    var_0 notify( "price_loop" );
    var_0 thread _id_A510::_id_0BE1( level._id_6F7C, "fire_idle" );
    thread heli_shot_down_detection();
    level notify( "start_continues" );
    var_1 thread heli_fires_around_price();
    var_1 thread heli_kills_price();
    price_snipes_heli_until_player_does();
    level._id_6F7C _meth_81CE( "prone", "crouch", "stand" );

    if ( !_func_1A1( level._id_6F7C ) )
        return;

    _id_A5E8::_id_870C( "havoc_explode_mix" );
    wait 1;
    var_0 notify( "stop_loop" );
    var_0 notify( "heli_loop" );
    var_1 thread enginefirefx();
    playfxontag( common_scripts\utility::_id_3FA8( "aerial_explosion_heli" ), var_1, "tag_engine_rear_left" );
    var_1 _meth_809C( "scn_se_rocket_explode_building" );
    level._id_9373 = gettime();
    var_13 = getent( "crash_missile_org", "targetname" );
    var_1 _id_A5A4::_id_27EF( 5.6, ::heli_hits_wall );
    var_1 _id_A5A4::_id_27EF( 5.65, ::heli_shoots_targetnamed_rocket, "rocket_1_org" );
    var_14 = spawnstruct();
    var_14.startspeed = 1100;
    var_14.finalspeed = 2000;
    var_14.acceleration = 300;
    var_1 _id_A5A4::_id_27EF( 5.75, ::heli_shoots_targetnamed_rocket, "rocket_2_org", var_14 );
    var_1 _id_A5A4::_id_27EF( 5.85, ::heli_shoots_targetnamed_rocket, "rocket_3_org" );
    var_1 _id_A5A4::_id_27EF( 9.65, ::heli_hits_ground, var_2 );
    var_1 _id_A5A4::_id_27EF( 9.65, ::enginesmolderfx );
    var_1 _id_A5A4::_id_27EF( 9.7, ::heli_shoots_dirt, var_5 );
    var_1 _id_A5A4::_id_27EF( 9.7, ::heli_rumbles );
    var_1 _id_A5A4::_id_27EF( 9.75, ::crash_dust_fx );
    var_1 _id_A5A4::_id_27EF( 15.0, ::heli_stops_rumbles );
    var_1 _id_A5A4::_id_27EF( 16.0, ::heli_rumbles_at_rest );
    var_1 _id_A5A4::_id_27EF( 10.0, _id_A5A4::_id_7C82, "stop_tail_fx" );
    var_4 _id_A5A4::_id_27EF( 10.0, ::heli_makes_sparks, var_1 );
    var_4 _id_A5A4::_id_27EF( 12.05, _id_A5A4::_id_7C82, "stop" );
    var_2 _id_A5A4::_id_27EF( 11.0, _id_A5A4::_id_7C82, "stop_kicking_up_dust" );
    var_1 _id_A5A4::_id_27EF( 13, common_scripts\_exploder::_id_3528, 456 );
    var_1 _id_A5A4::_id_27EF( 14, common_scripts\_exploder::_id_3528, 457 );
    var_1 _id_A5A4::_id_27EF( 14.5, _id_A5A4::_id_7C82, "kill_dirt" );
    var_1 _id_A5A4::_id_27EF( 15, _id_A5A4::_id_7C82, "stop_crash_dust_fx" );
    _id_A5A4::_id_27EF( 10.4, common_scripts\utility::_id_383F, "throw_modelswing" );
    _id_A5A4::_id_27EF( 10.65, common_scripts\utility::_id_383F, "throw_modelslide" );
    _id_A5A4::_id_27EF( 11.15, common_scripts\utility::_id_383F, "throw_modelmerry_go_round" );
    level _id_A5A4::_id_27EF( 18.5, _id_A5A4::_id_7C82, "blades_stop_killing" );
    _id_A5A4::_id_27EF( 3.5, maps\sniperescape_code::price_line, "goodnight_ya_bastard" );
    _id_A5A4::_id_27EF( 9.2, maps\sniperescape_code::price_line, "ahh_crap" );
    common_scripts\utility::_id_383F( "havoc_hits_ground" );
    _id_A5A4::_id_27EF( 14.0, common_scripts\utility::_id_383F, "heli_swap_dirt" );
    _id_A5A4::_id_27EF( 15.5, common_scripts\utility::_id_383F, "heli_comes_to_rest" );
    var_1 _meth_8077( "havoc_helicopter_dying_loop" );
    var_1 thread dead_heli_pilots();
    var_2._id_86CE = 1;
    var_0 thread _id_A510::_id_0C18( var_10, "crash" );
    wait 18.5;
    var_1 notify( "stop" );
    thread maps\sniperescape::wounded_combat();
    _id_A5E8::_id_870C( "havoc_crashed_mix" );
}

price_swap_to_damaged_model()
{
    level._id_6F7C endon( "death" );
    common_scripts\utility::_id_384A( "heli_comes_to_rest" );
    level._id_6F7C _meth_80B3( "body_complete_usmc_ghillie_price_damaged" );
}

heli_to_idle_once_in_place( var_0 )
{
    var_0 endon( "heli_loop" );
    self waittillmatch( "single anim", "end" );
    var_0 thread _id_A510::_id_0BE1( self, "idle", undefined, "heli_loop" );
}

heli_rumbles()
{
    self.rumbler = spawn( "script_origin", self._id_02E2 );
    self.rumbler _meth_804F( self, "main_rotor_jnt", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    self.rumbler _meth_80B0( "crash_heli_rumble" );
}

heli_rumbles_at_rest()
{
    _func_1C7( "crash_heli_rumble", self _meth_8184( "main_rotor_jnt" ) );
    wait 0.25;
    _func_1C7( "crash_heli_rumble_rest", self _meth_8184( "main_rotor_jnt" ) );
}

heli_stops_rumbles()
{
    self.rumbler _meth_80B1( "crash_heli_rumble" );
    self.rumbler delete();
}

blocking_fence_falls()
{
    var_0 = getent( "blocking_fence", "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_1 _meth_805A();
    var_1 _meth_804F( var_0 );
    var_0 _meth_82B2( 90, 1, 0.2 );
    wait 1;
    var_1 delete();
}

heli_shoots_dirt( var_0 )
{
    common_scripts\utility::_id_0CF0( var_0, ::dirt_model_shoots_dirt );
}

dirt_model_shoots_dirt( var_0 )
{
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 _meth_80B3( "tag_origin" );
    var_1 _meth_8056();
    playfxontag( common_scripts\utility::_id_3FA8( "heli_dirt" ), var_1, "tag_origin" );
    var_1 _meth_804F( level.price_heli, "tag_deathfx", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2 _meth_80B3( "tag_origin" );
    var_2 _meth_8056();
    playfxontag( common_scripts\utility::_id_3FA8( "heli_dirt_rear" ), var_2, "tag_origin" );
    var_2 _meth_804F( level.price_heli, "tag_deathfx", ( -100, 0, 100 ), ( 0, 0, 0 ) );
    self waittill( "kill_dirt" );
    var_1 delete();
    var_2 delete();

    if ( 1 )
        return;

    for (;;)
    {
        var_3 = anglestoforward( var_0.angles );
        var_4 = anglestoup( var_0.angles );
        var_5 = var_3 * 500;
        var_6 = _func_06B( var_0._id_02E2, var_0._id_02E2 + var_5, 1, self );
        var_7 = var_6["position"];

        if ( !isdefined( level.dirtfx_org ) )
        {
            var_8 = spawn( "script_model", var_7 );
            var_8 _meth_80B3( "tag_origin" );
            var_8 _meth_8056();
            playfxontag( common_scripts\utility::_id_3FA8( "heli_dirt" ), var_8, "tag_origin" );
            level.dirtfx_org = var_8;
        }

        level.dirtfx_org.angles = var_0.angles + ( -90, 0, 0 );
        level.dirtfx_org._id_02E2 = var_7;
        wait 0.05;
    }
}

sparkgen()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self.spark ) )
            playfx( common_scripts\utility::_id_3FA8( "helicopter_tail_sparks" ), self._id_02E2 );

        wait 0.05;
    }
}

heli_makes_sparks( var_0 )
{
    self endon( "stop" );
    var_1 = getent( "spark_org", "targetname" );
    var_2 = anglestoforward( var_1.angles );
    var_3 = 0;

    for (;;)
    {
        var_4 = anglestoforward( self.angles );
        var_5 = var_4 * 500;
        var_6 = _func_06B( self._id_02E2, self._id_02E2 + var_5, 1, var_0 );
        var_7 = var_6["position"] + ( 8, 8, 16 );
        playfx( common_scripts\utility::_id_3FA8( "helicopter_tail_sparks" ), var_7, var_2 );
        var_3--;

        if ( var_3 <= 0 )
        {
            playfx( common_scripts\utility::_id_3FA8( "brick_chunk" ), var_7, var_2 );
            var_3 = _func_0B4( 4, 5 );
        }

        wait 0.05;
    }

    if ( 1 )
        return;

    var_8 = spawn( "script_model", ( 0, 0, 0 ) );
    var_8 _meth_80B3( "tag_origin" );
    var_8._id_02E2 = var_1._id_02E2;
    var_8.angles = var_1.angles;
    playfxontag( common_scripts\utility::_id_3FA8( "rocket_geo" ), var_8, "tag_origin" );
    var_9 = spawn( "script_model", ( 0, 0, 0 ) );
    var_9 _meth_804F( var_8, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_10 = 1200;
    var_11 = var_10;
    var_8.spark = 1;
    var_8 thread sparkgen();

    for (;;)
    {
        if ( isdefined( var_1._id_03E2 ) )
            var_10 = var_11 * var_1._id_03E2 * 0.01;

        playfx( common_scripts\utility::_id_3FA8( "brick_chunk" ), var_8._id_02E2 );
        var_12 = getent( var_1._id_04A4, "targetname" );
        var_13 = _func_0EE( var_1._id_02E2, var_12._id_02E2 );
        var_14 = var_13 / var_10;
        var_8 _meth_82AA( var_12._id_02E2, var_14, 0, 0 );
        var_1 = var_12;
        wait(var_14);

        if ( !isdefined( var_1._id_04A4 ) )
            break;
    }

    var_8 delete();
}

heli_hits_wall()
{
    thread common_scripts\_exploder::_id_3528( 66 );
    self _meth_80AD();
    self _meth_809C( "scn_se_havoc_downed" );
    _id_A5A4::_id_27EF( 0.1, _id_A5A4::_id_058E, 0.4, 1.2, self._id_02E2, 6000 );
    thread tailfx();
}

heli_hits_ground( var_0 )
{
    thread common_scripts\_exploder::_id_3528( 67 );
    level._id_0318 _meth_80AF( "damage_heavy" );
    self _meth_8468( "mtl_h1_mi_28_glass", "mtl_h1_mi_28_glass_damaged" );
    self _meth_8468( "mtl_h1_mi_28_body", "mtl_h1_mi_28_body_damaged" );
    self _meth_8468( "mtl_h1_mi_28_details", "mtl_h1_mi_28_details_damaged" );
    _id_A5A4::_id_27EF( 0.1, _id_A5A4::_id_058E, 0.6, 1.2, self._id_02E2, 6000 );
    var_0 thread _id_A5A8::_id_9D01( "running" );
    self notify( "stop_enginefire_fx" );
    wait 0.8;
    level._id_0318 _meth_80B0( "tank_rumble" );
    var_1 = 6;
    _func_18C( 0.3, var_1, self._id_02E2, 2000 );
    level._id_0318 _meth_80B1( "tank_rumble" );
    wait(var_1);
    _func_18C( 0.1, 1, self._id_02E2, 2000 );
}

tailfx()
{
    self endon( "stop_tail_fx" );
    var_0 = [];
    var_0[var_0.size] = "tail_rotor_jnt";
    var_1 = _func_1D3( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self _meth_8184( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "smoke_trail_heli" ), var_4 );
        }

        wait 0.1;
    }
}

enginefirefx()
{
    self endon( "stop_enginefire_fx" );
    var_0 = [];
    var_0[var_0.size] = "tag_engine_rear_left";
    var_1 = _func_1D3( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self _meth_8184( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "fire_trail_heli" ), var_4 );
        }

        wait 0.1;
    }
}

enginesmolderfx()
{
    self endon( "stop_enginesmoke_fx" );
    var_0 = [];
    var_0[var_0.size] = "tag_engine_rear_left";
    var_1 = _func_1D3( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self _meth_8184( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "heli_engine_smolder" ), var_4 );
        }

        wait 0.1;
    }
}

crash_dust_fx()
{
    self endon( "stop_crash_dust_fx" );
    var_0 = [];
    var_0[var_0.size] = "tag_deathfx";
    var_1 = _func_1D3( var_0 );
    var_2 = undefined;

    for (;;)
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            var_4 = self _meth_8184( var_0[var_1[var_3]] );
            playfx( common_scripts\utility::_id_3FA8( "heli_crash_dust" ), var_4 );
            common_scripts\utility::_id_697A( "fire_wood_small", var_4 );
        }

        wait 0.2;
    }
}

clip_setup()
{
    var_0 = getent( self._id_7A26, "script_linkname" );
    var_0._id_02E2 = self._id_02E2;
    var_0.angles = self.angles;
    var_0 _meth_804F( self );
    var_0 _meth_8056();
    common_scripts\utility::_id_384A( "throw_model" + self._id_0398 );
    kill_toucher_until_stop( var_0 );
}

kill_toucher_until_stop( var_0 )
{
    self endon( "stop" );
    kill_player_on_touch( var_0 );
}

script_animator()
{
    common_scripts\utility::_id_383D( "throw_model" + self._id_0398 );

    if ( isdefined( self._id_7A26 ) )
        thread clip_setup();

    var_0 = self;
    var_0 = getent( var_0._id_04A4, "targetname" );

    for (;;)
    {
        var_0._id_02E2 += ( 0, 0, -5000 );
        var_0 _meth_8056();

        if ( !isdefined( var_0._id_04A4 ) )
            break;

        var_0 = getent( var_0._id_04A4, "targetname" );
    }

    self _meth_8055();
    common_scripts\utility::_id_384A( "throw_model" + self._id_0398 );
    var_0 = self;
    var_0 = getent( var_0._id_04A4, "targetname" );

    for (;;)
    {
        var_0._id_02E2 += ( 0, 0, 5000 );

        if ( !isdefined( var_0._id_04A4 ) )
            break;

        var_0 = getent( var_0._id_04A4, "targetname" );
    }

    var_1 = 0.15;
    var_0 = self;

    for (;;)
    {
        if ( !isdefined( var_0._id_04A4 ) )
            break;

        var_0 = getent( var_0._id_04A4, "targetname" );
        self _meth_82AA( var_0._id_02E2, var_1, 0, 0 );
        self _meth_82B1( var_0.angles, var_1, 0, 0 );
        wait(var_1);
    }

    self notify( "stop" );
}

check_for_price()
{
    var_0 = level._id_265B["fair_snipers_died"]["ai"];
    common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_7E0B );

    if ( !_func_1A1( level._id_6F7C ) )
        return;

    setdvar( "ui_deadquote", &"SNIPERESCAPE_YOU_LEFT_YOUR_SPOTTER" );
    _id_A5A4::_id_5CDF();
}

grass_obj()
{
    self _meth_80B3( "h1_sniperescape_grassobjective" );
    var_0 = spawn( "script_model", self._id_02E2 );
    var_0.angles = self.angles;
    var_0 _meth_80B3( "h1_sniperescape_grassobjective_obj" );
    var_0 _meth_8056();
    hide_and_show_glowing_grass( var_0 );
    self _meth_8055();
    var_0 delete();
}

hide_and_show_glowing_grass( var_0 )
{
    level endon( "price_is_put_down_near_wheel" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "put_price_near_wheel" );
        self _meth_8056();
        var_0 _meth_8055();
        level waittill( "foreverever" );
        common_scripts\utility::_id_3857( "price_picked_up" );
        var_0 _meth_8056();
    }
}

ferris_wheel_placement_objective()
{
    var_0 = getentarray( "grass_obj", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 _meth_80B3( "h1_sniperescape_grassobjective" );

    common_scripts\utility::_id_384A( "put_price_near_wheel" );
    thread common_scripts\_exploder::_id_3528( 100 );
    common_scripts\utility::_id_384A( "price_is_put_down_near_wheel" );
    thread common_scripts\_exploder::_id_3528( 101 );
}

player_is_enemy()
{
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( _func_1A1( var_0[var_1]._id_0142 ) )
        {
            if ( level._id_0318 == var_0[var_1]._id_0142 )
                return 1;
        }
    }

    return 0;
}

price_goes_to_window_to_shoot()
{
    if ( common_scripts\utility::_id_382E( "wounding_enemy_detected" ) )
        return;

    level endon( "wounding_enemy_detected" );
    _id_A5A4::_id_1143( "standby" );
    level._id_6F7C _id_A5A4::_id_2A74();
    level._id_6F7C._id_01FB = 1;
    level._id_6F7C _meth_816A();
    level._id_6F7C._id_01FF = 1;
    level._id_6F7C _id_A5A4::_id_27EF( 1.2, _id_A510::_id_0C21, level._id_6F7C, "standby" );
    var_0 = getent( "halt_node", "targetname" );
    var_0 _id_A510::_id_0BFF( level._id_6F7C, "halt" );
    var_0 _id_A510::_id_0C24( level._id_6F7C, "halt" );
    level._id_6F7C _meth_81A7( 1 );
    level._id_6F7C._id_2B0E = 1;
    wait 1;
    var_1 = level._id_0318 _id_A5A4::_id_4088();

    if ( var_1 > 0 )
    {
        thread maps\sniperescape_code::price_line( "plant_claymore_by_door" );
        wait 1;
    }

    level._id_6F7C _id_A5A4::_id_309A();
    _id_A5A4::_id_070A( "price_moves_to_window_trigger" );
    common_scripts\utility::_id_384A( "price_at_wounding_window" );
    wait 0.5;
    level._id_6F7C._id_01FF = 0;
    level._id_6F7C._id_01FB = 0;
    maps\sniperescape_code::delete_wounding_sight_blocker();
    common_scripts\utility::_id_384A( "wounding_enemy_detected" );
}

price_snipes_heli_until_player_does()
{
    level endon( "heli_shot_down" );
    common_scripts\utility::_id_382F( "heli_shot_down" );
    level._id_6F7C endon( "death" );

    for (;;)
    {
        maps\sniperescape_code::price_line( "shoot_the_helicopter" );
        level.price_heli _id_A5A4::_id_07BE( _id_A5A4::_id_A0AC, 0.995, 1.0, 1 );
        var_0 = _func_0B5( 8, 12 );
        _id_A5A4::_id_07BE( _id_A5A4::_id_0694, var_0 );
        _id_A5A4::_id_2BDD();

        if ( _id_A5A4::_id_6B91( level.price_heli._id_02E2, 0.995 ) )
            break;
    }

    maps\sniperescape_code::price_line( "hit_the_rotor" );
    wait 2.0;
    maps\sniperescape_code::price_line( "fire_fire" );
    common_scripts\utility::_id_384A( "heli_shot_down" );
}

heli_fires_around_price()
{
    common_scripts\utility::_id_382F( "heli_shot_down" );
    var_0 = getentarray( "death_heli_target", "targetname" );
    var_1 = common_scripts\utility::_id_710E( var_0 );
    var_2 = var_1;

    for (;;)
    {
        while ( var_2 == var_1 )
            var_1 = common_scripts\utility::_id_710E( var_0 );

        var_2 = var_1;
        wait(_func_0B3( 0.35 ));
        heli_fires( var_1 );

        if ( common_scripts\utility::_id_382E( "heli_shot_down" ) )
            return;
    }
}

heli_fires( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1._id_02E2 = self._id_02E2;
    var_2 = _func_0B3( 1 ) * 10;
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 _meth_80B3( "tag_origin" );

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        var_1 _meth_809C( "h1_wep_air_cannon_cls" );
        var_5 = var_0._id_02E2 + common_scripts\utility::_id_712D( 16 );
        var_6 = self _meth_8184( "tag_flash" );
        var_3._id_02E2 = var_6;
        var_7 = _func_115( var_5 - var_6 );
        var_3.angles = var_7;
        playfxontag( common_scripts\utility::_id_3FA8( "hind_fire" ), var_3, "tag_origin" );
        _func_1C2( "barrett_fake", self _meth_8184( "tag_flash" ), var_5 );
        wait 0.1;
    }

    var_3 delete();
    var_1 delete();
}

heli_kills_price()
{
    level endon( "heli_shot_down" );
    common_scripts\utility::_id_382F( "heli_shot_down" );
    level._id_6F7C endon( "death" );
    wait 25;
    level notify( "heli_kills_price" );
    level._id_6F7C.allowdeath = 1;

    if ( isdefined( level._id_6F7C._id_58D7 ) )
        level._id_6F7C _id_A5A4::_id_8EA4();

    level._id_6F7C._id_01E6 = 150;

    for (;;)
    {
        var_0 = _func_0B5( 1, 2 ) * 10;

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            _func_1C2( "barrett_fake", level.price_heli _meth_8184( "tag_flash" ), level._id_6F7C _meth_80AA() );
            wait 0.1;
        }

        wait(_func_0B5( 0.3, 0.7 ));
    }
}

price_death_failure()
{
    level endon( "heli_comes_to_rest" );
    common_scripts\utility::_id_382F( "heli_comes_to_rest" );
    level._id_6F7C waittill( "death" );
    wait 4;
    setdvar( "ui_deadquote", &"SNIPERESCAPE_CPT_MACMILLAN_DIED" );
    _id_A5A4::_id_5CDF();
}

price_sets_stance()
{
    level._id_6F7C waittill( "goal" );
    level._id_6F7C _meth_81CE( "crouch" );
}

player_becomes_invul_on_pickup()
{
    level endon( "player_made_it_to_seaknight" );
    var_0 = level._id_0318._id_010A;

    for (;;)
    {
        common_scripts\utility::_id_384A( "price_picked_up" );
        level._id_0318._id_010A = 10000;
        common_scripts\utility::_id_3857( "price_picked_up" );
        level._id_0318._id_010A = var_0;
    }
}

heli_shot_down_detection()
{
    level endon( "heli_shot_down" );
    var_0 = 0;

    for (;;)
    {
        if ( _id_A5A4::_id_6B91( level.price_heli._id_02E2, 0.995 ) )
            var_0++;

        if ( var_0 > 35 )
            break;

        wait 0.05;
    }

    common_scripts\utility::_id_383F( "heli_shot_down" );
}

helicopter_broadcast( var_0 )
{
    common_scripts\utility::_id_384A( var_0 );
    var_1 = level.heli_flag[var_0];
    common_scripts\utility::_id_69C2( level._id_78BA["heli"][var_1], level._id_0318._id_02E2 + ( 0, 0, 800 ) );
}

dead_heli_pilots()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_804F( self, "tag_gunner", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_0C72 = "dead_heli_pilot";
    var_0 character\character_sp_spetsnaz_collins::main();
    var_0 _id_A5A4::_id_0D61();
    var_0 _meth_814D( _id_A5A4::_id_3EF7( "dead_gunner" ) );
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_804F( self, "tag_pilot", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_0C72 = "dead_heli_pilot";
    var_0 character\character_sp_spetsnaz_geoff::main();
    var_0 _id_A5A4::_id_0D61();
    var_0 _meth_814D( _id_A5A4::_id_3EF7( "dead_pilot" ) );
}

set_dog_threatbias_group()
{
    self endon( "death" );
    waitframe;

    if ( self._id_04A7 == "allies" )
        self _meth_817B( "dog_allies" );
}

merry_go_round_bottom()
{
    var_0 = getent( "merry_go_round", "script_noteworthy" );
    self _meth_804F( var_0 );
}

merry_grass_delete()
{
    common_scripts\utility::_id_384A( "throw_modelmerry_go_round" );
    wait 1.5;
    self delete();
}

wait_for_surprise_guys()
{
    for (;;)
    {
        if ( level._id_265B["surprise_guys_dead"]["spawners"].size > 0 )
        {
            wait 0.05;
            continue;
        }

        if ( level._id_265B["surprise_guys_dead"]["ai"].size <= 2 )
            break;

        wait 0.05;
    }
}

player_cant_die()
{
    _id_A5A4::_id_0CC5();
    level._id_0318 endon( "death" );

    for (;;)
    {
        level._id_0318._id_010A = 70000;
        level._id_0318 _meth_80F1();
        level._id_0318.attackeraccuracy = 0;
        wait 0.05;
    }
}

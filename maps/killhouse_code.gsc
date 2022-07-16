// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

precachelevelstuff()
{
    precachemodel( "h1_mwr_com_office_chair_black" );
    precachemodel( "com_clipboard_mocap" );
    precachemodel( "characters_accessories_pencil" );
}

new_look_training_setup()
{
    var_0 = getent( "aim_down_target", "targetname" );
    var_1 = getent( "aim_up_target", "targetname" );
    var_0 _meth_82B1( var_0.angles + ( 0, 0, -90 ), 0.25, 0, 0 );
    var_1 _meth_82B1( var_1.angles + ( 0, 0, -90 ), 0.25, 0, 0 );
}

new_look_wait_for_target( var_0, var_1 )
{
    self _meth_82BC( 1 );
    self _meth_82B1( self.angles + ( 0, 0, var_0 ), 0.25, 0, 0 );
    self _meth_809C( "killhouse_target_up" );

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( level._id_0318 _id_A5A4::_id_50A9() )
        {
            break;
            continue;
        }

        if ( level._id_0532 )
        {
            thread keyhint( "ads_360" );
            continue;
        }

        thread keyhint( "ads" );
    }

    self _meth_809C( "killhouse_buzzer" );
    self _meth_809C( "killhouse_target_up" );
    self _meth_82B1( self.angles + ( 0, 0, var_1 ), 0.25, 0, 0 );
}

rope_obj( var_0 )
{
    level endon( "starting_cargoship_obj" );

    if ( var_0 )
    {
        setobjectivestring( "obj_price", &"KILLHOUSE_SLIDE_DOWN_THE_ROPE" );
        setobjectivestate( "obj_price", "current" );
        var_1 = getent( "top_of_rope", "targetname" );
        setobjectivelocation( "obj_price", var_1 );
    }
}

level_scripted_unloadnode()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_0 _id_A5A4::_id_9CB3();
        var_0 _meth_827F( 20, 20 );
        var_0 _id_A5A4::_id_9CF5();
        wait 10;
        var_0 _id_A5A4::_id_9D1F();
    }
}

ambient_trucks()
{
    var_0 = getent( "se_truck_trigger", "targetname" );

    for (;;)
    {
        var_1 = _func_0B2( 8 );
        var_2 = _id_A5A8::_id_23DE( var_1 );

        foreach ( var_4 in var_2 )
            var_4._id_04F7 = "constrained";

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            var_7 = _func_0B4( 30, 50 );
            var_2[var_6] _meth_827F( var_7, 30, 30 );
        }

        wait(_func_0B4( 3, 6 ));
    }
}

delay_objective_after_intro()
{
    registerobjective( "obj_rifle", &"KILLHOUSE_PICK_UP_A_RIFLE_FROM", getent( "obj_rifle_ammo", "targetname" ) );
    wait 3;
    setobjectivestate( "obj_rifle", "current" );
}

waters_think()
{
    level.waters = getent( "waters", "script_noteworthy" );
    level.waters._id_0C72 = "gaz";
    level.waters._id_2AF3 = 1;
    level.waters._id_2B0E = 1;
    level.waters.lastspeaktime = 0;
    level.waters.lastnagtime = 0;
    level.waters.speaking = 0;
    thread maps\killhouse_anim::gaz_face_think( level.waters );
}

newcastle_think()
{
    common_scripts\utility::_id_384A( "spawn_frags" );
    var_0 = getent( "nwc", "script_noteworthy" );
    level.newcastle = var_0 _id_A5A4::_id_88C3();
    level.newcastle._id_0C72 = "nwc";
    level.newcastle._id_2AF3 = 1;
    level.newcastle._id_2B0E = 1;
    level.newcastle.lastspeaktime = 0;
    level.newcastle.lastnagtime = 0;
    level.newcastle.speaking = 0;
    level.newcastle _meth_81A7( 1 );
    level.newcastle _id_A5A4::_id_2A8D();
    level.newcastle _id_A5A4::_id_4462();
    level.newcastle _id_A5A4::_id_7E45( "patrol_unarmed_walk" );
    level.newcastle _id_A5A4::_id_7E44( "patrol_unarmed_idle" );
    level.newcastle._id_01D1 = 0;
    level.newcastle _meth_8202( level._id_0318, 1 );
    level.newcastle specify_head_model( "head_sp_sas_woodland_golden" );
    thread maps\killhouse_anim::newcastle_face_think( level.newcastle );
}

mac_think()
{
    level.mac = getent( "mac", "script_noteworthy" );
    level.mac._id_0C72 = "mac";
    level.mac._id_2AF3 = 1;
    level.mac._id_2B0E = 1;
    level.mac.lastspeaktime = 0;
    level.mac.lastnagtime = 0;
    level.mac.speaking = 0;
    level.mac _meth_81A7( 1 );
}

price_think()
{
    level._id_6F7C = getent( "price", "script_noteworthy" );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C._id_2AF3 = 1;
    level._id_6F7C._id_2B0E = 1;
    level._id_6F7C.lastspeaktime = 0;
    level._id_6F7C.lastnagtime = 0;
    level._id_6F7C.speaking = 0;
    level._id_6F7C _meth_81A7( 1 );
}

clear_hints_on_flag( var_0 )
{
    common_scripts\utility::_id_384A( var_0 );
    _id_1EBE();
}

generic_compass_hint_reminder( var_0, var_1 )
{
    thread clear_hints_on_flag( var_0 );
    level endon( var_0 );
    wait(var_1);
    compass_hint();
    wait 2;
    var_2 = 6;

    for (;;)
    {
        if ( var_2 > 20.0 )
        {
            thread compass_reminder();
            refreshhudcompass();
            var_2 = 0;
        }

        var_2 += 0.05;
        wait 0.05;
    }
}

objective_hints( var_0 )
{
    level endon( "mission failed" );
    level endon( "navigationTraining_end" );
    level endon( "reveal_dialog_starting" );
    compass_hint();
    wait 2;

    if ( level._id_2153 || level._id_0318 _meth_834C() )
        keyhint( "objectives", 6.0 );
    else
        keyhint( "objectives_pc", 6.0 );

    var_1 = 16;
    var_2 = 20;
    var_3 = 0.2;

    for (;;)
    {
        if ( !common_scripts\utility::_id_382E( var_0 ) && var_1 > var_2 )
        {
            thread compass_reminder();
            refreshhudcompass();
            var_1 = 0;
            var_2 += 5;
        }

        if ( common_scripts\utility::_id_382E( "in_explosives_area" ) || common_scripts\utility::_id_382E( "in_obstacle_area" ) || common_scripts\utility::_id_382E( "in_NoReminder_Compass" ) )
            var_1 = 0;
        else
            var_1 += var_3;

        wait(var_3);
    }
}

compass_hint( var_0, var_1 )
{
    _id_1EBE();
    level endon( "clearing_hints" );
    _id_A5A4::_id_48B0( &"KILLHOUSE_HINT_OBJECTIVE_MARKER", undefined, undefined, 1 );
    level._id_4B3E = _id_A546::_id_2420( "objective", 32, 32 );
    level._id_4B3E._id_01ED = 1;
    level._id_4B3E _id_A546::_id_7FEE( "TOP", undefined, 0, 155 );
    wait 5;
    level._id_4B3E _id_A546::_id_7FEE( "TOP", undefined, 0, 425, 1.0 );
    level._id_4B3E _meth_8087( 1, 20, 20 );
    wait 0.85;
    level._id_4B3E _meth_8086( 0.15 );
    level._id_4B3E.alpha = 0;
    _id_A5A4::_id_48CB( 0.5 );
}

compass_reminder()
{
    _id_1EBE();
    level endon( "clearing_hints" );
    _id_A5A4::_id_48B0( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER", undefined, undefined, 1 );
    level._id_4B3E = _id_A546::_id_2420( "objective", 32, 32 );
    level._id_4B3E._id_01ED = 1;
    level._id_4B3E _id_A546::_id_7FEE( "TOP", undefined, 0, 155 );

    for ( var_0 = 0; var_0 < 5; var_0++ )
    {
        wait 1;

        if ( common_scripts\utility::_id_382E( "in_explosives_area" ) || common_scripts\utility::_id_382E( "in_obstacle_area" ) || common_scripts\utility::_id_382E( "in_NoReminder_Compass" ) )
        {
            level._id_4B3E _meth_8086( 0.15 );
            level._id_4B3E.alpha = 0;
            _id_A5A4::_id_48CB( 0.5 );
            wait 0.75;
            _id_1EBE();
            wait 0.25;
            return;
        }
    }

    level._id_4B3E _id_A546::_id_7FEE( "TOP", undefined, 0, 425, 1.0 );
    level._id_4B3E _meth_8087( 1, 20, 20 );
    wait 0.85;
    level._id_4B3E _meth_8086( 0.15 );
    level._id_4B3E.alpha = 0;
    wait 2;
    _id_A5A4::_id_48CB( 0.5 );
}

move_gaz_once_player_past()
{
    common_scripts\utility::_id_384A( "past_gaz" );
    common_scripts\utility::_id_384A( "gaz_intro_done" );
    common_scripts\utility::_id_384A( "rifle_picked_up" );
    var_0 = _func_0C3( "gaz_intro", "targetname" );
    var_0 _id_A510::_id_0C24( level.waters, "h1_killhouse_gaz_walkonstage" );
    var_0 notify( "end_idle" );
    level.waters.ref_node = var_0;
    var_0 thread _id_A510::_id_0BE1( level.waters, "killhouse_gaz_idleB", undefined, "stop_loop" );
    common_scripts\utility::_id_383F( "gaz_in_idle_position" );
}

move_gaz_fake()
{
    var_0 = _func_0C3( "stationone_node", "script_noteworthy" );
    var_1 = spawn( "script_origin", var_0._id_02E2 + ( 0, 12, 0 ) );
    var_1.angles = var_0.angles;
    level.waters.ref_node = var_1;
    level.waters.ref_node thread _id_A510::_id_0BE1( level.waters, "killhouse_gaz_idleB", undefined, "stop_loop" );
    common_scripts\utility::_id_383F( "gaz_in_idle_position" );
}

fail_on_damage()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( _func_1AD( var_1 ) )
            _id_A536::_id_5CDD();
    }
}

fail_if_friendlies_in_line_of_fire()
{
    var_0 = 1;
    var_1 = 1;
    level endon( "okay_if_friendlies_in_line_of_fire" );

    for (;;)
    {
        var_2 = level._id_0318 common_scripts\utility::_id_A070( "weapon_fired", "player_flash", "player_frag" );

        if ( !isdefined( var_2 ) )
            break;

        if ( var_2 == "weapon_fired" )
        {
            var_3 = level._id_0318 _meth_830E();

            if ( var_3 == "c4" )
                continue;
        }

        if ( var_2 == "player_frag" && isdefined( var_0 ) )
        {
            if ( !level._id_0318 _meth_812E() )
                continue;

            wait 1;
        }

        if ( var_2 == "player_flash" && isdefined( var_1 ) )
        {
            if ( !level._id_0318 _meth_812E() )
                continue;

            wait 1;
        }

        var_4 = _func_0D9( "allies" );

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            var_6 = common_scripts\utility::_id_A347( level._id_0318._id_02E2, level._id_0318.angles, var_4[var_5]._id_02E2, _func_0B7( 25 ) );
            var_7 = _func_0EE( level._id_0318._id_02E2, var_4[var_5]._id_02E2 );

            if ( var_6 && var_7 < 1000 )
            {
                level notify( "mission failed" );
                setdvar( "ui_deadquote", &"KILLHOUSE_FIRED_NEAR_FRIENDLY" );
                _id_A5A4::_id_5CDF();
            }
        }
    }
}

setup_player_action_notifies()
{
    wait 1;
    notifyoncommand( "player_frag", "+frag" );
    notifyoncommand( "player_flash", "-smoke" );
}

vision_trigger( var_0 )
{
    for (;;)
    {
        self waittill( "trigger" );
        _id_A5A4::_id_7F00( var_0, 1 );

        while ( level._id_0318 _meth_80AB( self ) )
            wait 0.1;
    }
}

flashed_hud_elem()
{
    for (;;)
    {
        if ( level._id_0318 common_scripts\utility::_id_5108() )
            level notify( "flashed" );
        else
            level notify( "not_flashed" );

        wait 0.2;
    }
}

flashed_debug()
{
    for (;;)
    {
        level waittill( "flashed" );
        var_0 = _id_A546::get_stats_display_hud();
        var_0._id_0538 = 130;
        var_0 _meth_80CC( &"KILLHOUSE_YOUR_TIME" );
        level waittill( "not_flashed" );
        var_0 _meth_808A();
    }
}

flag_when_lowered( var_0 )
{
    level.targets_hit = 0;
    var_1 = gettargetdummies( "rifle" );
    var_2 = var_1.size;

    while ( level.targets_hit < var_2 )
        wait 0.05;

    common_scripts\utility::_id_383F( var_0 );
}

ads_shoot_dialog()
{
    wait 0.4;

    if ( !common_scripts\utility::_id_382E( "ADS_targets_shot" ) )
    {
        if ( level._id_2153 )
            thread keyhint( "attack" );
        else
            thread keyhint( "pc_attack" );

        level.waters execdialog( "shooteachtarget" );
    }

    common_scripts\utility::_id_383F( "ADS_shoot_dialog" );
}

deck_start()
{
    var_0 = getent( "deck_start", "targetname" );
    level._id_0318 _meth_8335( var_0._id_02E2 );
    level._id_0318 _meth_8337( var_0.angles );
    level._id_0318 _meth_830B( "g36c" );
    level._id_0318 _meth_830B( "mp5" );
    level._id_0318 _meth_8312( "mp5" );
    common_scripts\utility::_id_383F( "start_deck" );
}

deck_training()
{
    var_0 = getentarray( "deck_target", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_0, ::cargoship_targets );
    common_scripts\utility::_id_384A( "start_deck" );
    var_1 = getent( "area_two_one", "targetname" );
    var_2 = getent( "area_two_two", "targetname" );
    var_3 = getent( "area_two_three", "targetname" );
    var_4 = getent( "area_two_four", "targetname" );
    var_5 = getent( "area_two_five", "targetname" );
    var_6 = getent( "area_two_finish", "targetname" );
    var_7 = getent( "area_two_quit", "targetname" );
    var_8 = 1;

    for (;;)
    {
        common_scripts\utility::_id_384A( "price_reveal_done" );
        var_1 waittill( "trigger" );
        thread _id_A5A4::_id_1143( "starting_deck_attack" );

        if ( var_8 )
        {
            registerobjective( "obj_deck", &"KILLHOUSE_COMPLETE_THE_DECK_MOCKUP", getent( "area_two_one", "targetname" ) );
            var_8 = 0;
        }

        setobjectivestate( "obj_deck", "current" );
        cqb_timer_setup();
        wait 2;
        level._id_6F7C thread execdialog( "gogogo" );
        thread accuracy_bonus();
        thread starttimer( 60 );

        if ( isdefined( level.iw_best ) )
            level.iw_best _meth_808A();

        var_7 thread check_deck_training_quit();
        var_1 pop_up_and_wait();
        level._id_6F7C thread execdialog( "position2" );
        setobjectivelocation( "obj_deck", var_2 );
        var_2 pop_up_and_wait();
        level._id_6F7C thread execdialog( "position3" );
        setobjectivelocation( "obj_deck", var_3 );
        var_3 pop_up_and_wait();
        level._id_6F7C thread execdialog( "position4" );
        setobjectivelocation( "obj_deck", var_4 );
        var_4 pop_up_and_wait();
        level._id_6F7C thread execdialog( "5go" );
        setobjectivelocation( "obj_deck", var_5 );
        var_5 pop_up_and_wait();
        level._id_6F7C thread execdialog( "finalgo" );
        setobjectivelocation( "obj_deck", var_6 );
        var_6 waittill( "trigger" );
        level notify( "test_cleared" );
        setobjectivestate( "obj_deck", "done" );
        thread _id_A5A4::_id_1143( "completed_deck_attack" );
        _id_53B1( 15.85, 1 );
    }
}

check_deck_training_quit()
{
    level endon( "test_cleared" );
    self waittill( "trigger" );
    level notify( "mission failed" );
    setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_MUST_CLEAR_DECK_MOCK_UP" );
    _id_A5A4::_id_5CDF();
}

get_randomized_targets()
{
    var_0 = _func_124( self._id_7A26, " " );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_4 = getent( var_3, "script_linkname" );

        if ( isdefined( var_4 ) )
        {
            var_1 = common_scripts\utility::_id_07A5( var_1, var_4 );
            continue;
        }
    }

    var_1 = common_scripts\utility::_id_0CF5( var_1 );
    return var_1;
}

pop_up_and_wait()
{
    self waittill( "trigger" );
    var_0 = get_randomized_targets();
    var_1 = 0;
    level.targets_hit = 0;
    var_2 = [];
    var_3 = 0;

    for ( var_4 = 0; var_1 < 3; var_4++ )
    {
        wait(_func_0B5( 0.25, 0.4 ));
        var_0[var_4] notify( "pop_up" );

        if ( var_0[var_4]._id_04A6 == "hostile" )
        {
            var_1++;
            continue;
        }

        var_2[var_3] = var_0[var_4];
        var_3++;
    }

    while ( level.targets_hit != var_1 )
        wait 0.05;

    if ( var_2.size > 0 )
    {
        for ( var_5 = 0; var_5 < var_2.size; var_5++ )
            var_2[var_5] notify( "pop_down" );
    }
}

jumpoff_monitor()
{
    level endon( "starting_rope" );
    self waittill( "trigger" );
    var_0 = getent( "top_of_rope_trigger", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    level.jumpoff = 1;
    level notify( "mission failed" );

    if ( common_scripts\utility::_id_382E( "activate_rope" ) )
        setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_JUMPED_OFF" );
    else
        setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_JUMPED_TOO_EARLY" );

    _id_A5A4::_id_5CDF();
}

flashbang_ammo_monitor( var_0 )
{
    level endon( "test_cleared" );
    level.volumes_flashed = 0;

    for (;;)
    {
        level._id_0318 waittill( "grenade_fire", var_1, var_2 );
        var_1 waittill( "death" );
        waitframe;
        var_3 = var_0.size - level.volumes_flashed;

        if ( level._id_0318 _meth_82F6( "flash_grenade" ) < var_3 )
        {
            level notify( "mission failed" );
            setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_OUT_OF_FLASH" );
            _id_A5A4::_id_5CDF();
        }
    }
}

check_if_in_volume( var_0, var_1 )
{
    self waittill( "death" );

    if ( var_0 _meth_80AB( var_1 ) )
    {
        var_1 notify( "flashed" );
        level.volumes_flashed++;
    }
}

track_grenade_origin( var_0, var_1 )
{
    self endon( "death" );
    var_1 endon( "flashed" );

    for (;;)
    {
        var_0._id_02E2 = self._id_02E2;
        wait 0.05;
    }
}

flash_dialog_three( var_0 )
{
    level endon( "clear_course" );
    var_0 endon( "flashed" );
    self waittill( "trigger" );
    var_1 = 1;

    for (;;)
    {
        if ( !level._id_0318 _meth_80AB( self ) )
        {
            if ( var_1 )
            {
                level._id_6F7C thread execdialog( "3" );
                level._id_6F7C thread execdialog( "goback" );
                var_1 = 0;
            }
            else
            {
                level._id_6F7C thread execdialog( "position3" );
                var_1 = 1;
            }
        }
        else
        {
            level._id_6F7C thread execdialog( "flashthrudoor" );
            thread keyhint( "flash" );
        }

        wait 5;
    }
}

flash_dialog_six( var_0 )
{
    level endon( "clear_course" );
    var_0 endon( "flashed" );
    self waittill( "trigger" );
    var_1 = 1;

    for (;;)
    {
        if ( !level._id_0318 _meth_80AB( self ) )
        {
            if ( var_1 )
            {
                level._id_6F7C thread execdialog( "goback" );
                var_1 = 0;
            }
            else
            {
                level._id_6F7C thread execdialog( "6go" );
                var_1 = 1;
            }
        }
        else
        {
            level._id_6F7C thread execdialog( "flashthrudoor" );
            thread keyhint( "flash" );
        }

        wait 5;
    }
}

wait_till_flashed( var_0 )
{
    var_0 endon( "flashed" );

    for (;;)
    {
        level._id_0318 waittill( "grenade_fire", var_1, var_2 );

        if ( var_2 == "flash_grenade" )
        {
            var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
            var_1 thread track_grenade_origin( var_3, var_0 );
            var_1 thread check_if_in_volume( var_3, var_0 );
        }
    }
}

wait_till_pos_cleared( var_0 )
{
    level endon( "clear_course" );

    if ( !isdefined( var_0 ) )
        self waittill( "trigger" );

    level.targets_hit = 0;

    if ( isdefined( self._id_04A4 ) )
    {
        var_1 = getentarray( self._id_04A4, "targetname" );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            var_1[var_2] notify( "pop_up" );

        level._id_6F7C thread execdialog( "hittargets" );
        var_3 = 0;

        while ( level.targets_hit != var_1.size )
        {
            if ( var_3 > 5 )
            {
                if ( !level._id_0318 _meth_80AB( self ) )
                {
                    var_4 = [];
                    var_4[0] = "missgoback";
                    var_4[1] = "passgoback";
                    var_4[2] = "goback";
                    var_5 = var_4[_func_0B2( var_4.size )];
                    level._id_6F7C thread execdialog( var_5 );
                    var_3 = 0;
                }
                else
                {
                    if ( level.targets_hit > 0 )
                    {
                        var_6 = [];
                        var_6[0] = "shoottarget";
                        var_6[1] = "remainingtarg";
                        var_6[2] = "hitother";
                        var_5 = var_6[_func_0B2( var_6.size )];
                        level._id_6F7C thread execdialog( var_5 );
                    }
                    else
                        level._id_6F7C thread execdialog( "hittargets" );

                    var_3 = 0;
                }
            }

            var_3 += 0.05;
            wait 0.05;
        }
    }

    return;
}

rope_triggercheck_playerisinvalidstate()
{
    level endon( "starting_rope" );
    var_0 = getent( "top_of_rope_trigger", "targetname" );

    for (;;)
    {
        if ( level._id_0318 _meth_833E() && !level._id_0318 _meth_8462() )
            var_0 common_scripts\utility::_id_97CE();
        else
            var_0 common_scripts\utility::_id_97CC();

        waittillframeend;
    }
}

_id_75E0()
{
    var_0 = getent( "top_of_rope_trigger", "targetname" );
    var_0 common_scripts\utility::_id_97CC();
    var_0 _meth_817F();
    var_1 = getent( "top_of_rope", "targetname" );
    var_2 = getent( "bottom_of_rope", "targetname" );
    level.jumpoff = 0;

    for (;;)
    {
        common_scripts\utility::_id_384A( "activate_rope" );
        thread rope_triggercheck_playerisinvalidstate();
        var_0 _meth_80DD( &"KILLHOUSE_USE_ROPE" );

        for (;;)
        {
            var_0 waittill( "trigger" );
            waittillframeend;

            if ( !level._id_0318 _meth_8462() )
                break;
        }

        level notify( "starting_rope" );
        level._id_0318 _meth_831A();
        level._id_0318 _meth_811B( 0 );
        level._id_0318 _meth_811C( 0 );
        level._id_0318 _meth_811D( 0 );

        if ( level.jumpoff == 1 )
            return;

        level._id_0318 thread _id_A5A4::_id_69C4( "scn_killhouse_rope_slide" );
        var_3 = _id_A5A4::_id_88D1( "view_body" );
        var_3 _meth_8056();
        var_4 = getent( "training_rope_node", "targetname" );
        var_4 thread _id_A510::_id_0BC7( var_3, "training_rope" );
        var_4 thread _id_A510::_id_0C24( var_3, "training_rope" );
        var_5 = getanimlength( level._id_78AC[var_3._id_0C72]["training_rope"] );
        var_6 = var_5 - 1.7;
        thread _id_A5A4::_id_3840( "start_timer", var_6 );
        level._id_0318 _meth_855E( var_3, "tag_player", 1, 0.3, 0, 0.1, 40, 40, 55, 55, 1 );
        wait 0.35;
        var_3 _meth_8055();
        var_4 waittill( "training_rope" );
        var_3 delete();
        level._id_0318 _meth_831B();
        level._id_0318 _meth_811B( 1 );
        level._id_0318 _meth_811C( 1 );
        level._id_0318 _meth_811D( 1 );
        var_0 common_scripts\utility::_id_97CC();
    }
}

fail_if_damage_waiter()
{
    self endon( "pop_down" );
    self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
    setdvar( "ui_deadquote", &"KILLHOUSE_HIT_FRIENDLY" );
    _id_A5A4::_id_5CDF();
}

timer_think()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "start_timer" );
        var_0 = 60;

        if ( getdvarint( "killhouse_too_slow" ) >= 1 )
            var_0 = 90;

        thread starttimer( var_0 );
        common_scripts\utility::_id_3831( "start_timer" );
    }
}

starttimer( var_0 )
{
    clear_timer_elems();
    level endon( "kill_timer" );
    level._id_4AFE = 20;
    thread cqb_timer_think();
    level.updated_timer = _id_A546::_id_3D17();
    level.updated_timer._id_92B2._id_0241 = &"KILLHOUSE_YOUR_TIME";
    level.updated_timer _meth_80D5( 0.05 );
    wait(var_0);
    _id_A546::destroy_countdown_hud( level.updated_timer );
    level thread mission_failed_out_of_time();
}

cqb_timer_setup()
{
    level.digit_array_tenths = cqb_timer_get_planes( "tenths_plane" );
    level.digit_array_seconds = cqb_timer_get_planes( "seconds_plane" );
    level.digit_array_tens_of_seconds = cqb_timer_get_planes( "tens_of_seconds_plane" );
    cqb_digit_reset( level.digit_array_seconds );
    cqb_digit_reset( level.digit_array_tenths );
    cqb_digit_reset( level.digit_array_tens_of_seconds );
}

cqb_timer_get_planes( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 <= 9; var_2++ )
        var_1[var_2] = getent( var_0 + "_" + common_scripts\utility::_id_93F2( var_2 ), "targetname" );

    return var_1;
}

cqb_digit_reset( var_0 )
{
    for ( var_1 = 1; var_1 <= 9; var_1++ )
        var_0[var_1] _meth_8056();

    var_0[0] _meth_8055();
}

cqb_timer_think()
{
    level endon( "kill_timer" );
    wait 0.1;
    level._id_8CC5 = gettime();
    cqb_digit_reset( level.digit_array_seconds );
    cqb_digit_reset( level.digit_array_tenths );
    cqb_digit_reset( level.digit_array_tens_of_seconds );
    var_0 = 9;
    var_1 = 9;
    var_2 = 9;

    for (;;)
    {
        var_3 = ( gettime() - level._id_8CC5 ) * 0.001;
        var_4 = _func_0E2( var_3 );
        var_5 = _func_0BC( ( var_3 - var_4 ) * 10 );
        var_6 = _func_0BC( common_scripts\utility::_id_0287( var_4, 10 ) );
        var_7 = _func_0BC( _func_0E2( var_4 * 0.1 ) );

        if ( var_5 != var_0 )
        {
            var_0 = var_5;
            cqb_timer_change_digit( var_5, level.digit_array_tenths );
        }

        if ( var_6 != var_1 )
        {
            var_1 = var_6;
            cqb_timer_change_digit( var_6, level.digit_array_seconds );
        }

        if ( var_7 != var_2 )
        {
            var_2 = var_7;
            cqb_timer_change_digit( var_7, level.digit_array_tens_of_seconds );
        }

        wait 0.05;
    }
}

cqb_timer_change_digit( var_0, var_1 )
{
    switch ( var_0 )
    {
        case 0:
            var_1[9] _meth_8056();
            var_1[0] _meth_8055();
            break;
        case 1:
            var_1[0] _meth_8056();
            var_1[1] _meth_8055();
            break;
        case 2:
            var_1[1] _meth_8056();
            var_1[2] _meth_8055();
            break;
        case 3:
            var_1[2] _meth_8056();
            var_1[3] _meth_8055();
            break;
        case 4:
            var_1[3] _meth_8056();
            var_1[4] _meth_8055();
            break;
        case 5:
            var_1[4] _meth_8056();
            var_1[5] _meth_8055();
            break;
        case 6:
            var_1[5] _meth_8056();
            var_1[6] _meth_8055();
            break;
        case 7:
            var_1[6] _meth_8056();
            var_1[7] _meth_8055();
            break;
        case 8:
            var_1[7] _meth_8056();
            var_1[8] _meth_8055();
            break;
        case 9:
            var_1[8] _meth_8056();
            var_1[9] _meth_8055();
            break;
    }
}

dialog_sprint_reminders()
{
    level endon( "sprinted" );

    for (;;)
    {
        wait 8;
        level._id_6F7C thread execdialog( "sprint" );
    }
}

mission_failed_out_of_time()
{
    level._id_0318 endon( "death" );
    level endon( "kill_timer" );
    var_0 = [];
    var_0[0] = "startover";
    var_0[1] = "doitagain";
    var_0[2] = "tooslow";
    var_1 = var_0[_func_0B2( var_0.size )];
    level._id_6F7C thread execdialog( var_1 );
    var_2 = getdvarint( "killhouse_too_slow" );
    setdvar( "killhouse_too_slow", var_2 + 1 );
    level notify( "mission failed" );

    if ( !common_scripts\utility::_id_382E( "at_finish" ) )
        setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_TOO_SLOW" );
    else
        setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_DIDNT_SPRINT" );

    _id_A5A4::_id_5CDF();
}

mission_failed_quit_training()
{
    while ( common_scripts\utility::_id_382E( "cargoshipTrainingOn" ) )
    {
        if ( common_scripts\utility::_id_382E( "in_quit_cargoship_tutorial" ) )
        {
            level._id_0318 endon( "death" );
            level endon( "kill_timer" );
            level notify( "mission failed" );
            setdvar( "ui_deadquote", &"KILLHOUSE_SHIP_MUST_CLEAR_DECK_MOCK_UP" );
            _id_A5A4::_id_5CDF();
        }

        wait 1;
    }
}

clear_timer_elems()
{
    if ( isdefined( level.updated_timer ) )
        _id_A546::destroy_countdown_hud( level.updated_timer );

    if ( isdefined( level._id_04B7 ) )
        level._id_04B7 _meth_808A();

    if ( isdefined( level.final_time ) )
        level.final_time _meth_808A();

    if ( isdefined( level.bonus ) )
        level.bonus _meth_808A();

    if ( isdefined( level._id_0241 ) )
        level._id_0241 _meth_808A();

    if ( isdefined( level.iw_best ) )
        level.iw_best _meth_808A();

    if ( isdefined( level.recommended_label ) )
        level.recommended_label _meth_808A();

    if ( isdefined( level.recommended_label2 ) )
        level.recommended_label2 _meth_808A();

    if ( isdefined( level.recommended ) )
        level.recommended _meth_808A();

    if ( isdefined( level.bonus_text ) )
        level.bonus_text _meth_808A();

    if ( isdefined( level.time_text ) )
        level.time_text _meth_808A();

    if ( isdefined( level.final_time_text ) )
        level.final_time_text _meth_808A();

    if ( isdefined( level.iw_best_text ) )
        level.iw_best_text _meth_808A();

    if ( isdefined( level.backers ) )
    {
        for ( var_0 = 0; var_0 < level.backers.size; var_0++ )
            level.backers[var_0] _meth_808A();

        level.backers = undefined;
    }
}

clearhud_after10sec()
{
    wait 10;

    if ( !common_scripts\utility::_id_382E( "cargoshipTrainingOn" ) )
        clear_timer_elems();
}

getstatbackers( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[0] = _func_1A9();
    var_4[0]._id_0530 = var_0;
    var_4[0]._id_0538 = var_1;
    var_4[0] _meth_80CE( "h1_hud_fng_results_blur", var_2, var_3 );
    var_4[0].alignx = "right";
    var_4[0].aligny = "top";
    var_4[0]._id_03D4 = 1;
    var_4[0]._id_0198 = 0;
    var_4[0]._id_01F3 = "right";
    var_4[0]._id_0501 = "top";
    var_4[0].alpha = 0.9;
    var_4[0]._id_01ED = 1;
    var_4[0]._id_01EB = 1;
    var_4[1] = _func_1A9();
    var_4[1]._id_0530 = var_0;
    var_4[1]._id_0538 = var_1;
    var_4[1] _meth_80CE( "h1_hud_fng_results_border", var_2, var_3 );
    var_4[1].alignx = "right";
    var_4[1].aligny = "top";
    var_4[1]._id_03D4 = 2;
    var_4[1]._id_0198 = 0;
    var_4[1]._id_01F3 = "right";
    var_4[1]._id_0501 = "top";
    var_4[1].alpha = 0.33;
    var_4[1]._id_01ED = 1;
    var_4[1]._id_01EB = 1;
    return var_4;
}

_id_53B1( var_0, var_1 )
{
    level notify( "kill_timer" );
    clear_timer_elems();
    thread maps\killhouse_aud::aud_timer_end();
    var_2 = 227;
    var_3 = 227;
    var_4 = 2;
    var_5 = 20;
    var_6 = -30;
    var_7 = -232;
    var_8 = -50;
    var_9 = -143;
    level.backers = getstatbackers( var_6, var_5, var_2, var_3 );
    var_10 = ( gettime() - level._id_8CC5 ) / 1000;

    if ( getdvarint( "loc_language", 0 ) == 12 )
    {
        level._id_04B7 = _id_A546::get_stats_display_hud( var_7, 82, undefined, undefined, 1 );
        level.time_text = _id_A546::get_stats_display_hud( var_8, 82, undefined, undefined, 1, &"KILLHOUSE_YOUR_TIME" );
        level.time_text.alignx = "right";
    }
    else
    {
        level._id_04B7 = _id_A546::get_stats_display_hud( var_8, 82, undefined, undefined, 1 );
        level._id_04B7.alignx = "right";
        level.time_text = _id_A546::get_stats_display_hud( var_7, 82, undefined, undefined, 1, &"KILLHOUSE_YOUR_TIME" );
    }

    level._id_04B7 _meth_80D9( var_10 );
    level waittill( "accuracy_bonus" );
    var_11 = var_10 - level.bonus_time;
    level.final_time = _id_A546::get_stats_display_hud( var_9, 146, undefined, undefined, 1.6 );
    level.final_time_text = _id_A546::get_stats_display_hud( var_9, 126, undefined, undefined, 1, &"KILLHOUSE_YOUR_FINAL_TIME" );
    level.final_time_text.alignx = "center";
    level.final_time.alignx = "center";
    level.final_time _meth_80D9( var_11 );

    if ( getdvarint( "loc_language", 0 ) == 12 )
    {
        level.iw_best = _id_A546::get_stats_display_hud( var_7, 68, undefined, undefined, 1 );

        if ( var_1 )
            level.iw_best_text = _id_A546::get_stats_display_hud( var_8, 68, undefined, undefined, 1, &"KILLHOUSE_IW_DECK_TIME" );
        else
            level.iw_best_text = _id_A546::get_stats_display_hud( var_8, 68, undefined, undefined, 1, &"KILLHOUSE_IW_BEST_TIME" );

        level.iw_best_text.alignx = "right";
    }
    else
    {
        level.iw_best = _id_A546::get_stats_display_hud( var_8, 68, undefined, undefined, 1 );
        level.iw_best.alignx = "right";

        if ( var_1 )
            level.iw_best_text = _id_A546::get_stats_display_hud( var_7, 68, undefined, undefined, 1, &"KILLHOUSE_IW_DECK_TIME" );
        else
            level.iw_best_text = _id_A546::get_stats_display_hud( var_7, 68, undefined, undefined, 1, &"KILLHOUSE_IW_BEST_TIME" );
    }

    level.iw_best _meth_80D9( var_0 );

    if ( var_1 )
    {
        wait 5;
        clear_timer_elems();
    }
    else
    {
        level.recommended_label = _id_A546::get_stats_display_hud( var_9, 174, undefined, undefined, 1, &"KILLHOUSE_RECOMMENDED_LABEL" );
        level.recommended_label.alignx = "center";
        thread clearhud_after10sec();

        if ( var_11 > 40 )
        {
            setdvar( "recommended_gameskill", "0" );
            level.recommended = _id_A546::get_stats_display_hud( var_9, 192, undefined, undefined, 1.6, &"KILLHOUSE_RECOMMENDED_EASY" );
        }
        else if ( var_11 > 26 )
        {
            setdvar( "recommended_gameskill", "1" );
            level.recommended = _id_A546::get_stats_display_hud( var_9, 192, undefined, undefined, 1.6, &"KILLHOUSE_RECOMMENDED_NORMAL" );
        }
        else if ( var_11 > 20 )
        {
            setdvar( "recommended_gameskill", "2" );
            level.recommended = _id_A546::get_stats_display_hud( var_9, 192, undefined, undefined, 1.6, &"KILLHOUSE_RECOMMENDED_HARD" );
        }
        else
        {
            setdvar( "recommended_gameskill", "3" );
            level.recommended = _id_A546::get_stats_display_hud( var_9, 192, undefined, undefined, 1.6, &"KILLHOUSE_RECOMMENDED_VETERAN" );
        }

        level.recommended.alignx = "center";

        if ( var_11 < 19.0 )
        {
            _id_A5A4::_id_41DD( "NEW_SQUADRON_RECORD" );

            if ( var_11 < 15.1 )
                _id_A5A4::_id_41DD( "BEST_OF_THE_BEST" );
        }
    }
}

accuracy_bonus()
{
    var_0 = level._id_0318 _meth_8309();
    var_1 = level._id_0318 _meth_82F6( var_0[0] );
    var_2 = level._id_0318 _meth_82F6( var_0[1] );
    var_3 = level._id_0318 _meth_82F5( var_0[0] );
    var_4 = level._id_0318 _meth_82F5( var_0[1] );
    var_5 = var_1 + var_2 + var_3 + var_4;
    level waittill( "test_cleared" );
    var_1 = level._id_0318 _meth_82F6( var_0[0] );
    var_2 = level._id_0318 _meth_82F6( var_0[1] );
    var_3 = level._id_0318 _meth_82F5( var_0[0] );
    var_4 = level._id_0318 _meth_82F5( var_0[1] );
    var_6 = var_1 + var_2 + var_3 + var_4;
    var_7 = var_5 - var_6;
    var_8 = 20;

    if ( var_7 > var_8 )
        var_9 = var_7 - var_8;
    else
        var_9 = 0;

    level.bonus_time = ( 15 - var_9 ) * 0.2;
    level.bonus_time = common_scripts\utility::_id_9294( level.bonus_time > 0, level.bonus_time, 0 );

    if ( getdvarint( "loc_language", 0 ) == 12 )
    {
        level.bonus_text = _id_A546::get_stats_display_hud( -50, 97, undefined, undefined, 1, &"KILLHOUSE_ACCURACY_BONUS" );
        level.bonus = _id_A546::get_stats_display_hud( -232, 97, undefined, undefined, 1 );
        level.bonus.alignx = "left";
        level.bonus_text.alignx = "right";
    }
    else
    {
        level.bonus_text = _id_A546::get_stats_display_hud( -232, 97, undefined, undefined, 1, &"KILLHOUSE_ACCURACY_BONUS" );
        level.bonus = _id_A546::get_stats_display_hud( -50, 97, undefined, undefined, 1 );
        level.bonus.alignx = "right";
    }

    level.bonus _meth_80D9( level.bonus_time * -1 );
    level notify( "accuracy_bonus" );
}

nagplayer( var_0, var_1 )
{
    if ( self.speaking )
        return 0;

    var_2 = gettime();

    if ( var_2 - self.lastspeaktime < 1.0 )
        return 0;

    if ( var_2 - self.lastnagtime < var_1 * 1000 )
        return 0;

    execdialog( var_0 );
    self.lastnagtime = self.lastspeaktime;
    return 1;
}

scoldplayer( var_0 )
{
    if ( self.speaking )
        return 0;

    execdialog( var_0 );
    return 1;
}

execdialog( var_0, var_1 )
{
    self.speaking = 1;
    _id_A510::_id_0C21( self, var_0 );
    self.speaking = 0;
    self.lastspeaktime = gettime();

    if ( isdefined( var_1 ) && var_1 == 1 )
        thread maps\killhouse_anim::play_idle_facial_anim();
}

actionnodethink( var_0 )
{
    switch ( var_0._id_0398 )
    {
        case "ammo_node":
            wait 2.0;
            break;
    }
}

getfreeactionnode( var_0 )
{
    for ( var_1 = undefined; isdefined( var_0._id_04A4 ); var_0 = var_2 )
    {
        var_2 = _func_0C3( var_0._id_04A4, "targetname" );

        if ( isdefined( var_2._id_0398 ) )
        {
            if ( var_2._id_020D )
            {
                if ( !isdefined( var_1 ) )
                    return var_0;
                else
                    return var_1;
            }

            var_1 = var_2;
        }
    }

    return var_1;
}

initactionchain( var_0 )
{
    while ( isdefined( var_0._id_04A4 ) )
    {
        var_0._id_020D = 0;
        var_0 = _func_0C3( var_0._id_04A4, "targetname" );
    }
}

actionchainthink( var_0 )
{
    self _meth_81A9( var_0 );
    self waittill( "goal" );
    var_1 = var_0;
    var_2 = undefined;

    while ( !isdefined( var_2 ) )
    {
        var_2 = getfreeactionnode( var_1 );
        wait 0.05;
    }

    while ( isdefined( var_2 ) )
    {
        var_2._id_020D = 1;

        while ( var_1 != var_2 )
        {
            var_1 = _func_0C3( var_1._id_04A4, "targetname" );
            self _meth_81A9( var_1 );
            self waittill( "goal" );
        }

        actionnodethink( var_2 );

        while ( isdefined( var_2 ) && var_1 == var_2 )
        {
            var_2 = getfreeactionnode( var_1 );
            wait(_func_0B5( 0.1, 0.5 ));
        }

        var_1._id_020D = 0;
    }

    while ( isdefined( var_1._id_04A4 ) )
    {
        var_1 = _func_0C3( var_1._id_04A4, "targetname" );
        self _meth_81A9( var_1 );
        self waittill( "goal" );
    }
}

raiseplywoodwalls()
{
    var_0 = getentarray( "plywood", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] _meth_82B4( 90, 0.25, 0.1, 0.1 );
        var_0[var_1] _meth_809C( "killhouse_target_up_wood" );
    }
}

silently_lowerplywoodwalls()
{
    var_0 = getentarray( "plywood", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_82B4( -90, 0.25, 0.1, 0.1 );
}

lowerplywoodwalls()
{
    var_0 = getentarray( "plywood", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] _meth_82B4( -90, 0.25, 0.1, 0.1 );
        var_0[var_1] _meth_809C( "killhouse_target_up_wood" );
    }
}

raisetargetdummies( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0 + "_target_dummy", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_2 ) && var_5.dummyid != var_2 )
            continue;

        if ( isdefined( var_1 ) && var_5.laneid != var_1 )
            continue;

        if ( var_5.raised )
            continue;

        var_3[var_4] thread movetargetdummy( "raise" );
    }
}

raisetargetdummies_noassist( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0 + "_target_dummy", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_2 ) && var_5.dummyid != var_2 )
            continue;

        if ( isdefined( var_1 ) && var_5.laneid != var_1 )
            continue;

        if ( var_5.raised )
            continue;

        var_3[var_4] thread movetargetdummy( "raiseNoAssist" );
    }
}

movetargetdummy( var_0 )
{
    self _meth_82BC( 0 );

    while ( self._id_5F9E )
        wait 0.05;

    switch ( var_0 )
    {
        case "raise":
            if ( !self.raised )
            {
                self notify( "want_newMelon" );
                self.aim_assist_target _meth_81B9();
                var_1 = 0.25;
                self _meth_809C( "killhouse_target_up_metal" );
                playfxontag( level._id_058F["dust_poof_radial_dummy_fng"], self, "tag_origin" );
                self.orgent _meth_82B2( 90, var_1, 0.1, 0.1 );
                wait 0.25;
                self.raised = 1;
                self _meth_82BC( 1 );
            }

            break;
        case "raiseNoAssist":
            if ( !self.raised )
            {
                self notify( "want_newMelon" );
                var_1 = 0.25;
                self _meth_809C( "killhouse_target_up_metal" );
                playfxontag( level._id_058F["dust_poof_radial_dummy_fng"], self, "tag_origin" );
                self.orgent _meth_82B2( 90, var_1, 0.1, 0.1 );
                wait 0.25;
                self.raised = 1;
                self _meth_82BC( 1 );
            }

            break;
        case "lower":
            if ( self.raised )
            {
                var_1 = 0.75;
                self.orgent _meth_82B2( -90, var_1, 0.25, 0.25 );
                wait 0.75;
                self.raised = 0;
                self _meth_809C( "killhouse_target_up" );
                playfxontag( level._id_058F["dust_poof_radial_dummy_fng"], self, "tag_origin" );
                self.aim_assist_target _meth_81D7();
            }

            break;
    }
}

lowertargetdummies( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0 + "_target_dummy", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_2 ) && var_5.dummyid != var_2 )
            continue;

        if ( isdefined( var_1 ) && var_5.laneid != var_1 )
            continue;

        if ( !var_5.raised )
            continue;

        var_3[var_4] thread movetargetdummy( "lower" );
    }
}

training_targetdummies( var_0 )
{
    var_1 = gettargetdummies( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] thread targetdummythink();
}

targetdummythink()
{
    self.orgent = getent( self._id_04A4, "targetname" );
    self _meth_804F( self.orgent );
    self.dummyid = _func_0BC( self._id_0394 );
    self.laneid = _func_0BC( self._id_04A6[4] );
    self.aim_assist_target = getent( self.orgent._id_04A4, "targetname" );
    self.aim_assist_target._id_01E6 = 10;
    self.aim_assist_target _meth_8056();
    self.aim_assist_target _meth_82BB();
    self.orgent _meth_82B2( -90, 0.25 );
    self.raised = 0;
    self._id_5F9E = 0;
    var_0 = getent( "rifleTraining_stall", "targetname" );
    level.waters_speaking = 0;
    level.waters_last_line = 0;

    for (;;)
    {
        for (;;)
        {
            self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

            if ( !level._id_0318 _meth_80AB( var_0 ) )
            {
                target_down();

                if ( level.waters_speaking != 1 )
                {
                    var_6 = [];
                    var_6[0] = "gotostation1";
                    var_6[1] = "heygo";
                    var_6[2] = "getback";
                    var_7 = var_6[_func_0B2( var_6.size )];
                    level.waters_speaking = 1;
                    level.waters execdialog( var_7 );
                    level.waters_speaking = 0;
                }

                movetargetdummy( "raise" );
                continue;
            }

            var_8 = 1;

            if ( level.hip_fire_required )
            {
                if ( level._id_0318 _id_A5A4::_id_50A9() )
                {
                    thread keyhint( "stop_ads", 2, var_8 );
                    target_down();

                    if ( level.waters_speaking != 1 )
                    {
                        level.waters_speaking = 1;
                        var_6 = [];
                        var_6[0] = "stopaiming";
                        var_6[1] = "seeyoufire";

                        if ( level.waters_last_line == 0 )
                        {
                            level.waters execdialog( "stopaiming" );
                            level.waters_last_line = 1;
                        }
                        else
                        {
                            level.waters execdialog( "seeyoufire" );
                            level.waters_last_line = 0;
                        }

                        level.waters_speaking = 0;
                    }

                    movetargetdummy( "raise" );
                    continue;
                }
            }

            break;
        }

        self notify( "hit" );
        level.targets_hit++;
        self _meth_809C( "killhouse_buzzer" );
        target_down();
    }
}

target_down()
{
    self._id_01E6 = 10;
    self _meth_809C( "killhouse_target_up" );
    self._id_5F9E = 1;
    self.aim_assist_target _meth_81D7();
    self _meth_82BC( 0 );
    self.orgent _meth_82B2( -90, 0.25 );
    wait 0.5;
    self.raised = 0;
    self._id_5F9E = 0;
}

cargoship_targets()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = var_0 common_scripts\utility::_id_8959();
    var_2 = anglestoforward( var_1.angles );

    if ( !isdefined( var_0._id_0398 ) )
        var_0._id_0398 = "standard";

    if ( var_0._id_0398 == "reverse" )
    {
        var_0 _meth_82B2( 90, 0.25 );
        var_1._id_02E2 += anglestoforward( var_1.angles ) * 65;
    }
    else
    {
        var_0 _meth_82B2( -90, 0.25 );
        var_1._id_02E2 -= anglestoforward( var_1.angles ) * 65;
    }

    self _meth_804F( var_0 );
    var_3 = getent( var_0._id_04A4, "targetname" );
    var_3._id_01E6 = 10;
    var_3 _meth_8056();
    var_3 _meth_82BB();

    for (;;)
    {
        self waittill( "pop_up" );
        wait(_func_0B5( 0, 0.2 ));
        self _meth_82BA();
        self _meth_809C( "killhouse_target_up_metal" );
        playfxontag( level._id_058F["dust_poof_radial_dummy_fng"], var_1, "tag_origin" );
        self _meth_82BC( 1 );

        if ( self._id_04A6 != "friendly" )
            var_3 _meth_81B9();

        if ( var_0._id_0398 == "reverse" )
            var_0 _meth_82B2( -90, 0.2 );
        else
            var_0 _meth_82B2( 90, 0.2 );

        wait 0.25;

        if ( self._id_04A6 == "friendly" )
            fail_if_damage_waiter();
        else
        {
            for (;;)
            {
                self waittill( "damage", var_4, var_5, var_6, var_7, var_8 );

                if ( var_8 == "MOD_IMPACT" )
                {
                    continue;
                    continue;
                }

                break;
            }

            self notify( "hit" );
            self._id_01E6 = 10;
            level.targets_hit++;
            self _meth_809C( "killhouse_buzzer" );
            self _meth_809C( "killhouse_target_up" );
            playfxontag( level._id_058F["dust_puff_radial_dummy_down_fng"], var_1, "tag_origin" );
            var_3 _meth_81D7();
        }

        self _meth_82BB();

        if ( var_0._id_0398 == "reverse" )
            var_0 _meth_82B2( 90, 0.25 );
        else
            var_0 _meth_82B2( -90, 0.25 );

        self _meth_82BC( 0 );
        wait 0.25;
    }

    var_1 delete();
}

gettargetdummies( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0 + "_target_dummy", "script_noteworthy" );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        var_6 = var_3[var_5];

        if ( isdefined( var_2 ) && var_6.dummyid != var_2 )
            continue;

        if ( isdefined( var_1 ) && var_6.laneid != var_1 )
            continue;

        var_4[var_4.size] = var_6;
    }

    if ( isdefined( var_1 ) && isdefined( var_2 ) )
    {

    }

    return var_4;
}

set_ammo()
{
    if ( self.classname == "weapon_fraggrenade" || self.classname == "weapon_flash_grenade" )
        self _meth_8182( 1, 0 );
    else
        self _meth_8182( 999, 999 );
}

ammorespawnthink( var_0, var_1, var_2 )
{
    wait 0.2;
    var_3 = self;
    var_4 = var_3.classname;
    var_5 = var_3._id_02E2 + ( 0, 0, 8 );
    var_6 = var_3.angles;
    var_3 set_ammo();
    var_7 = undefined;

    if ( isdefined( var_3._id_04A4 ) )
    {
        var_7 = getent( var_3._id_04A4, "targetname" );
        var_7._id_02E2 = var_3._id_02E2;
        var_7.angles = var_3.angles;
    }

    if ( var_1 == "flash_grenade" )
        var_8 = 1;
    else
        var_8 = 0.2;

    if ( isdefined( var_0 ) )
    {
        self._id_02E2 += ( 0, 0, -10000 );

        if ( isdefined( var_7 ) )
            var_7 _meth_8056();

        common_scripts\utility::_id_384A( var_0 );

        if ( isdefined( var_7 ) )
            var_7 _meth_8055();

        self._id_02E2 += ( 0, 0, 10000 );
        var_3 set_ammo();
    }

    if ( isdefined( var_7 ) && isdefined( var_2 ) )
        var_7 thread delete_if_obj_complete( var_2 );

    if ( var_1 == "alt_m16_grenadier" )
    {
        while ( !level._id_0318 _meth_8311( "m16_grenadier" ) )
            wait 0.05;
    }
    else
        var_3 waittill( "trigger" );

    if ( isdefined( var_7 ) )
        var_7 delete();

    if ( var_1 == "alt_m16_grenadier" )
        return;

    for (;;)
    {
        wait 1;

        if ( level._id_0318 _meth_8331( var_1 ) < var_8 )
        {
            while ( _func_0EE( level._id_0318._id_02E2, var_5 ) < 160 )
                wait 1;

            var_3 = spawn( var_4, var_5, 1 );

            if ( var_1 == "alt_m16_grenadier" )
                var_3 _meth_80B3( "weapon_m16gr_sp" );

            var_3.angles = var_6;
            var_3 set_ammo();
            wait 0.2;
            var_3._id_02E2 = var_5 + ( 0, 0, -8 );

            while ( isdefined( var_3 ) )
                wait 1;
        }
    }
}

delete_if_obj_complete( var_0 )
{
    self endon( "death" );
    common_scripts\utility::_id_384A( var_0 );
    self delete();
}

test2( var_0 )
{
    for (;;)
        wait 1;
}

_id_6E26( var_0 )
{
    var_1 = anglestoforward( self.angles );
    return _func_0F6( var_1, var_0 - self._id_02E2 ) > 0.766;
}

registerobjective( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_383D( var_0 );
    var_3 = level._id_6302.size;
    var_4 = spawnstruct();
    var_4._id_02A7 = var_0;
    var_4._id_4B53 = var_3;
    var_4._id_8D56 = "invisible";
    var_4._id_92B2 = var_1;
    var_4._id_0151 = var_2;
    var_4.added = 0;
    level._id_6302[var_0] = var_4;
    return var_4;
}

setobjectivestate( var_0, var_1 )
{
    var_2 = level._id_6302[var_0];
    var_2._id_8D56 = var_1;

    if ( !var_2.added )
    {
        objective_add( var_2._id_4B53, var_2._id_8D56, var_2._id_92B2, var_2._id_0151._id_02E2 );
        var_2.added = 1;
    }
    else
        objective_state( var_2._id_4B53, var_2._id_8D56 );

    if ( var_2._id_8D56 == "done" )
        common_scripts\utility::_id_383F( var_0 );
}

setobjectivestate_nomessage( var_0, var_1 )
{
    var_2 = level._id_6302[var_0];
    var_2._id_8D56 = var_1;

    if ( !var_2.added )
    {
        objective_add( var_2._id_4B53, var_2._id_8D56, var_2._id_92B2, var_2._id_0151._id_02E2 );
        var_2.added = 1;
    }
    else
        _func_10F( var_2._id_4B53, var_2._id_8D56 );

    if ( var_2._id_8D56 == "done" )
        common_scripts\utility::_id_383F( var_0 );
}

setassubobjective( var_0, var_1 )
{
    var_2 = level._id_6302[var_0];
    _func_1E1( var_2._id_4B53, var_1 );
}

setobjectivestring( var_0, var_1 )
{
    var_2 = level._id_6302[var_0];
    var_2._id_92B2 = var_1;
    _func_110( var_2._id_4B53, var_1 );
}

setobjectivelocation( var_0, var_1 )
{
    var_2 = level._id_6302[var_0];
    var_2.loc = var_1;
    objective_position( var_2._id_4B53, var_2.loc._id_02E2 );
}

setobjectiveremaining( var_0, var_1, var_2 )
{
    var_3 = level._id_6302[var_0];

    if ( !var_2 )
        _func_110( var_3._id_4B53, var_1 );
    else
        _func_110( var_3._id_4B53, var_1, var_2 );
}

_id_6FA9( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    if ( !isdefined( var_3 ) )
        var_3 = ( 1, 0, 0 );

    for ( var_4 = 0; var_4 < var_1 * 20; var_4++ )
    {
        if ( !_func_1A1( self ) )
            return;

        var_5 = self _meth_8099() + ( 0, 0, 10 ) + var_2;
        wait 0.05;
    }
}

killhouse_guy_exitconditionoverride( var_0 )
{
    return 0;
}

firearmdepot_guy_think()
{
    level endon( "DespawnGuysHangar1" );
    var_0 = getent( "firearmDepotGuy", "targetname" );
    var_0 _id_A5A4::_id_7E60( 1 );
    var_1 = [];
    var_1[0] = _func_0C3( "firearmDepotNode_0", "targetname" );
    var_1[1] = _func_0C3( "firearmDepotNode_1", "targetname" );
    var_1[2] = _func_0C3( "firearmDepotNode_2", "targetname" );
    var_1[3] = _func_0C3( "firearmDepotNode_3", "targetname" );
    var_2 = 3;
    var_3 = 0;
    var_4 = 0;
    var_0._id_2AF3 = 1;
    var_0.exitconditioncheckfunc = ::killhouse_guy_exitconditionoverride;
    var_0 _id_A5A4::_id_7E45( "patrol_walk_unarmed" );
    var_0 _id_A5A4::_id_7E44( "patrol_unarmed_idle" );
    var_0 _id_A5A4::_id_4462();
    common_scripts\utility::_id_384A( "lootz_intro_start" );
    var_0 thread common_scripts\utility::_id_6975( "npc_firearmdepot_guy_lp" );
    var_0 _id_A5A4::_id_7E4B( var_1[3] );
    wait 7;

    for (;;)
    {
        var_5 = _func_0B4( 0, var_1.size );

        if ( var_5 == 0 && var_2 == 2 )
            continue;
        else if ( var_5 == 2 && var_2 == 0 )
            continue;
        else if ( var_5 == 1 && var_2 == 3 )
            continue;
        else if ( var_5 == 3 && var_2 == 1 )
            continue;

        if ( var_5 != var_2 )
        {
            var_0 _id_A5A4::_id_7E4B( var_1[var_5] );
            var_2 = var_5;
            var_3 = var_4;

            if ( var_4 != 0 )
                var_4 = 0;
            else
            {
                while ( var_4 == var_3 )
                    var_4 = _func_0B4( 1, var_1.size );
            }

            switch ( var_4 )
            {
                case 0:
                    var_0 _id_A5A4::_id_7E45( "patrol_walk_unarmed" );
                    var_0 _id_A5A4::_id_4462();
                    break;
                case 1:
                    var_0 _id_A5A4::_id_7E45( "fast_walk" );
                    var_0 _id_A5A4::_id_39D0( "g36c", "primary" );
                    break;
                case 2:
                    var_0 _id_A5A4::_id_7E45( "fast_walk" );
                    var_0 _id_A5A4::_id_39D0( "m16_grenadier", "primary" );
                    break;
                case 3:
                    var_0 _id_A5A4::_id_7E45( "fast_walk" );
                    var_0 _id_A5A4::_id_39D0( "mp5", "primary" );
                    break;
            }

            wait(_func_0B5( 7, 14 ));
        }
    }
}

inventory_guy_setup()
{
    level endon( "DespawnGuysHangar1" );
    var_0 = getent( "inventory_guy", "targetname" );
    var_0._id_0C72 = "generic";
    var_0 _id_A5A4::_id_4462();
    var_0 _meth_801D( "com_clipboard_mocap", "tag_inhand" );
    var_0 _meth_801D( "characters_accessories_pencil", "tag_weapon_right" );
    var_1 = getentarray( "inventoryNode", "targetname" );
    var_2 = _func_0B4( 0, var_1.size );
    var_3 = var_1[var_2];
    var_3 thread _id_A510::_id_0BE1( var_0, "guy_inventory_idle01", undefined, "1stPosDone" );
    common_scripts\utility::_id_384A( "inventoryNewPos" );
    var_3 notify( "1stPosDone" );
    var_3 _id_A5A4::_id_0C3D();

    for ( var_4 = var_2; var_2 == var_4; var_2 = _func_0B4( 0, var_1.size ) )
    {

    }

    var_3 = var_1[var_2];
    var_3 thread _id_A510::_id_0BE1( var_0, "guy_inventory_idle01", undefined, "2ndPosDone" );
}

chair_guy_setup()
{
    var_0 = getent( "chair_guy", "script_noteworthy" );
    var_1 = getent( "chair_guy_origin", "script_noteworthy" );
    var_0._id_0C72 = "generic";
    var_0 _id_A5A4::_id_4462();
    var_0 _meth_81C9( var_1._id_02E2 );
    var_0 specify_head_model( "head_sp_sas_woodland_colon" );
    var_1 thread chair_guy_think( var_0 );
}

chair_guy_think( var_0 )
{
    var_1 = self;
    var_2 = getent( "in_front_of_armory", "targetname" );
    var_2 thread check_in_front_of_armory();
    var_3 = 0;
    var_4 = getent( "chair_guy_origin", "script_noteworthy" );
    var_5 = _id_A5A4::_id_88D1( "chair", var_4._id_02E2 );
    var_4 thread _id_A510::_id_0C24( var_5, "chair_counting" );

    while ( !common_scripts\utility::_id_382E( "lootz_intro_start" ) )
        var_1 _id_A510::_id_0C24( var_0, "guy_chair_counting" );

    var_4 thread _id_A510::_id_0C24( var_5, "chair_turnaround" );
    var_1 _id_A510::_id_0C24( var_0, "guy_chair_turnaround" );
    var_4 thread _id_A510::_id_0C24( var_5, "chair_idle" );

    for (;;)
    {
        var_6 = "chair_typing";

        if ( common_scripts\utility::_id_382E( "play_nod_01" ) )
        {
            var_6 = "chair_nod_01";
            common_scripts\utility::_id_3831( "play_nod_01" );
        }
        else if ( common_scripts\utility::_id_382E( "play_nod_02" ) )
        {
            var_6 = "chair_nod_02";
            common_scripts\utility::_id_3831( "play_nod_02" );
        }
        else if ( var_3 > 4 )
        {
            var_7 = _func_0B2( 100 );

            if ( var_7 < 20 )
                var_6 = "chair_typing_variation";
            else if ( var_7 < 40 )
                var_6 = "chair_typing_pause";
        }

        if ( var_6 == "chair_typing_variation" || var_6 == "chair_typing_pause" )
            var_3 = 0;
        else
            var_3++;

        var_1 _id_A510::_id_0C24( var_0, var_6 );
    }
}

check_in_front_of_armory()
{
    common_scripts\utility::_id_383D( "play_nod_01" );
    common_scripts\utility::_id_383D( "play_nod_02" );
    self endon( "play_nod_02_called" );
    var_0 = 0;

    for (;;)
    {
        if ( level._id_0318 _meth_80AB( self ) )
        {
            if ( !var_0 )
            {
                common_scripts\utility::_id_383F( "play_nod_01" );
                var_0 = 1;
            }
            else if ( common_scripts\utility::_id_382E( "aa_sidearm_melee" ) )
            {
                common_scripts\utility::_id_383F( "play_nod_02" );
                self notify( "play_nod_02_called" );
            }
        }

        wait 0.1;
    }
}

glowing_rope()
{
    var_0 = getent( "glowing_rope", "targetname" );
    var_0 _meth_8056();

    for (;;)
    {
        level waittill( "show_glowing_rope" );
        var_0 _meth_8055();
        level waittill( "hide_glowing_rope" );
        var_0 _meth_8056();
    }
}

registeractions()
{
    level.actionbinds = [];
    registeractionbinding( "objectives", "pause", &"KILLHOUSE_HINT_CHECK_OBJECTIVES_PAUSED" );
    registeractionbinding( "objectives_pc", "+scores", &"KILLHOUSE_HINT_CHECK_OBJECTIVES_SCORES" );
    registeractionbinding( "pc_attack", "+attack", &"KILLHOUSE_HINT_ATTACK_PC" );
    registeractionbinding( "pc_attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC" );
    registeractionbinding( "pc_hip_attack", "+attack", &"KILLHOUSE_HINT_HIP_ATTACK_PC" );
    registeractionbinding( "pc_hip_attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC" );
    registeractionbinding( "hip_attack", "+attack", &"KILLHOUSE_HINT_HIP_ATTACK" );
    registeractionbinding( "hip_attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC" );
    registeractionbinding( "attack", "+attack", &"KILLHOUSE_HINT_ATTACK" );
    registeractionbinding( "attack", "+attack_akimbo_accessible", &"TRAINER_HINT_HIP_ATTACK_PC" );
    registeractionbinding( "stop_ads", "+speed_throw", &"KILLHOUSE_HINT_STOP_ADS_THROW" );
    registeractionbinding( "stop_ads", "+speed", &"KILLHOUSE_HINT_STOP_ADS" );
    registeractionbinding( "stop_ads", "+toggleads_throw", &"KILLHOUSE_HINT_STOP_ADS_TOGGLE_THROW" );
    registeractionbinding( "stop_ads", "toggleads", &"KILLHOUSE_HINT_STOP_ADS_TOGGLE" );
    registeractionbinding( "ads_360", "+speed_throw", &"KILLHOUSE_HINT_ADS_THROW_360" );
    registeractionbinding( "ads_360", "+speed", &"KILLHOUSE_HINT_ADS_360" );
    registeractionbinding( "ads", "+speed_throw", &"KILLHOUSE_HINT_ADS_THROW" );
    registeractionbinding( "ads", "+speed", &"KILLHOUSE_HINT_ADS" );
    registeractionbinding( "ads", "+toggleads_throw", &"KILLHOUSE_HINT_ADS_TOGGLE_THROW" );
    registeractionbinding( "ads", "toggleads", &"KILLHOUSE_HINT_ADS_TOGGLE" );
    registeractionbinding( "ads_switch", "+speed_throw", &"KILLHOUSE_HINT_ADS_SWITCH_THROW" );
    registeractionbinding( "ads_switch", "+speed", &"KILLHOUSE_HINT_ADS_SWITCH" );
    registeractionbinding( "ads_switch_shoulder", "+speed_throw", &"KILLHOUSE_HINT_ADS_SWITCH_THROW_SHOULDER" );
    registeractionbinding( "ads_switch_shoulder", "+speed", &"KILLHOUSE_HINT_ADS_SWITCH_SHOULDER" );
    registeractionbinding( "breath", "+melee_breath", &"KILLHOUSE_HINT_BREATH_MELEE" );
    registeractionbinding( "breath", "+breath_sprint", &"KILLHOUSE_HINT_BREATH_SPRINT" );
    registeractionbinding( "breath", "+holdbreath", &"KILLHOUSE_HINT_BREATH" );
    registeractionbinding( "melee", "+melee", &"KILLHOUSE_HINT_MELEE" );
    registeractionbinding( "melee", "+melee_breath", &"KILLHOUSE_HINT_MELEE" );
    registeractionbinding( "melee", "+melee_zoom", &"KILLHOUSE_HINT_MELEE" );
    registeractionbinding( "prone", "goprone", &"KILLHOUSE_HINT_PRONE" );
    registeractionbinding( "prone", "+stance", &"KILLHOUSE_HINT_PRONE_STANCE" );
    registeractionbinding( "prone", "toggleprone", &"KILLHOUSE_HINT_PRONE_TOGGLE" );
    registeractionbinding( "prone", "+prone", &"KILLHOUSE_HINT_PRONE_HOLD" );
    registeractionbinding( "prone", "lowerstance", &"KILLHOUSE_HINT_PRONE_DOUBLE" );
    registeractionbinding( "crouch", "gocrouch", &"KILLHOUSE_HINT_CROUCH" );
    registeractionbinding( "crouch", "+stance", &"KILLHOUSE_HINT_CROUCH_STANCE" );

    if ( !level._id_2153 )
    {
        registeractionbinding( "crouch", "+togglecrouch", &"PLATFORM_HINT_CROUCH_TOGGLE_PC" );
        registeractionbinding( "crouch", "+movedown", &"PLATFORM_HINT_HOLD_CROUCH" );
    }

    registeractionbinding( "crouch", "togglecrouch", &"KILLHOUSE_HINT_CROUCH_TOGGLE" );
    registeractionbinding( "stand", "+gostand", &"KILLHOUSE_HINT_STAND" );
    registeractionbinding( "stand", "+stance", &"KILLHOUSE_HINT_STAND_STANCE" );
    registeractionbinding( "jump", "+gostand", &"KILLHOUSE_HINT_JUMP_STAND" );
    registeractionbinding( "jump", "+moveup", &"KILLHOUSE_HINT_JUMP" );
    registeractionbinding( "sprint", "+breath_sprint", &"KILLHOUSE_HINT_SPRINT" );
    registeractionbinding( "sprint", "+sprint", &"KILLHOUSE_HINT_SPRINT" );
    registeractionbinding( "sprint", "+sprint_zoom", &"KILLHOUSE_HINT_SPRINT" );
    registeractionbinding( "sprint_pc", "+breath_sprint", &"KILLHOUSE_HINT_SPRINT_PC" );
    registeractionbinding( "sprint_pc", "+sprint", &"KILLHOUSE_HINT_SPRINT_PC" );
    registeractionbinding( "sprint_pc", "+sprint_zoom", &"KILLHOUSE_HINT_SPRINT_PC" );
    registeractionbinding( "sprint2", "+breath_sprint", &"KILLHOUSE_HINT_HOLDING_SPRINT" );
    registeractionbinding( "sprint2", "+sprint", &"KILLHOUSE_HINT_HOLDING_SPRINT" );
    registeractionbinding( "sprint2", "+sprint_zoom", &"KILLHOUSE_HINT_HOLDING_SPRINT" );
    registeractionbinding( "reload", "+reload", &"KILLHOUSE_HINT_RELOAD" );
    registeractionbinding( "reload", "+usereload", &"KILLHOUSE_HINT_RELOAD_USE" );
    registeractionbinding( "mantle", "+gostand", &"KILLHOUSE_HINT_MANTLE" );
    registeractionbinding( "sidearm", "weapnext", &"KILLHOUSE_HINT_SIDEARM_SWAP" );
    registeractionbinding( "primary", "weapnext", &"KILLHOUSE_HINT_PRIMARY_SWAP" );
    registeractionbinding( "frag", "+frag", &"KILLHOUSE_HINT_FRAG" );
    registeractionbinding( "flash", "+smoke", &"KILLHOUSE_HINT_FLASH" );
    registeractionbinding( "swap_launcher", "+activate", &"KILLHOUSE_HINT_SWAP" );
    registeractionbinding( "swap_launcher", "+usereload", &"KILLHOUSE_HINT_SWAP_RELOAD" );
    registeractionbinding( "firemode", "+actionslot 2", &"KILLHOUSE_HINT_FIREMODE" );
    registeractionbinding( "attack_launcher", "+attack", &"KILLHOUSE_HINT_LAUNCHER_ATTACK" );
    registeractionbinding( "pc_attack_launcher", "+attack", &"KILLHOUSE_HINT_LAUNCHER_ATTACK_PC" );
    registeractionbinding( "swap_explosives", "+activate", &"KILLHOUSE_HINT_EXPLOSIVES" );
    registeractionbinding( "swap_explosives", "+usereload", &"KILLHOUSE_HINT_EXPLOSIVES_RELOAD" );
    registeractionbinding( "plant_explosives", "+activate", &"KILLHOUSE_HINT_EXPLOSIVES_PLANT" );
    registeractionbinding( "plant_explosives", "+usereload", &"KILLHOUSE_HINT_EXPLOSIVES_PLANT" );
    registeractionbinding( "equip_C4", "+actionslot 4", &"KILLHOUSE_HINT_EQUIP_C4" );
    registeractionbinding( "throw_C4", "+toggleads_throw", &"KILLHOUSE_HINT_THROW_C4_TOGGLE" );
    registeractionbinding( "throw_C4", "+speed_throw", &"KILLHOUSE_HINT_THROW_C4_SPEED" );
    registeractionbinding( "throw_C4", "+throw", &"KILLHOUSE_HINT_THROW_C4" );
    registeractionbinding( "detonate_C4", "+attack", &"KILLHOUSE_DETONATE_C4" );
    initkeys();
    updatekeysforbindings();
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

getactionforbinding( var_0 )
{
    var_1 = _func_1D3( level.actionbinds );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = level.actionbinds[var_1[var_2]];

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_3[var_4].binding != var_0 )
                continue;

            return var_1[var_2];
        }
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

killhouse_hint( var_0, var_1, var_2 )
{
    _id_1EBE();
    level endon( "clearing_hints" );
    _id_A5A4::_id_48B0( var_0, undefined, undefined, var_2 );

    if ( var_0 == &"KILLHOUSE_HINT_LADDER" )
        var_1 = 5;

    if ( isdefined( var_1 ) )
        wait(var_1);
    else
        return;

    _id_A5A4::_id_48CB( 0.5 );
}

_id_1EBE()
{
    _id_A5A4::_id_48CB( 0 );

    if ( isdefined( level._id_4B3E ) )
        level._id_4B3E _id_A546::_id_28E9();

    if ( isdefined( level._id_4B3F ) )
        level._id_4B3F _id_A546::_id_28E9();

    if ( isdefined( level._id_4B40 ) )
        level._id_4B40 _id_A546::_id_28E9();

    level notify( "clearing_hints" );
}

keyhint( var_0, var_1, var_2 )
{
    _id_1EBE();
    level endon( "clearing_hints" );
    var_3 = getactionbind( var_0 );

    if ( var_0 == "melee" && level._id_0532 && var_3.key == "BUTTON_RSTICK" )
        _id_A5A4::_id_48B0( &"KILLHOUSE_HINT_MELEE_CLICK" );
    else
        _id_A5A4::_id_48B0( var_3._id_48B0, undefined, undefined, var_2 );

    var_4 = "did_action_" + var_0;

    for ( var_5 = 0; var_5 < level.actionbinds[var_0].size; var_5++ )
    {
        var_3 = level.actionbinds[var_0][var_5];
        notifyoncommand( var_4, var_3.binding );
    }

    if ( isdefined( var_1 ) )
        level._id_0318 thread notifyontimeout( var_4, var_1 );

    level._id_0318 waittill( var_4 );
    _id_A5A4::_id_48CB( 0.5 );
}

keyhintmantle( var_0, var_1 )
{
    _id_1EBE();
    level endon( "clearing_hints" );
    var_2 = getactionbind( "mantle" );
    _id_A5A4::_id_48B0( var_2._id_48B0, undefined, undefined, var_1 );
    var_3 = 0.0;

    while ( !level._id_0318 _meth_82DD() && var_3 < var_0 )
    {
        var_3 += 0.05;
        wait 0.05;
    }

    _id_A5A4::_id_48CB( 0.5 );
}

keyhintprone( var_0, var_1 )
{
    _id_1EBE();
    level endon( "clearing_hints" );
    var_2 = getactionbind( "prone" );
    _id_A5A4::_id_48B0( var_2._id_48B0, undefined, undefined, var_1 );
    var_3 = 0.0;

    while ( level._id_0318 _meth_8180() != "prone" && var_3 < var_0 )
    {
        var_3 += 0.05;
        wait 0.05;
    }

    _id_A5A4::_id_48CB( 0.5 );
}

second_sprint_hint()
{
    level endon( "kill_sprint_hint" );
    wait 0.5;
    var_0 = getactionbind( "sprint2" );
    killhouse_hint( var_0._id_48B0, 5 );
}

notifyontimeout( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    self notify( var_0 );
}

training_stalltriggers( var_0, var_1 )
{
    var_2 = getentarray( var_0 + "_stall_trigger", "script_noteworthy" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] thread stalltriggerthink( var_0 );

    thread wrongstallnag( var_1 );
}

wrongstallnag( var_0 )
{
    level endon( var_0 );

    for (;;)
    {
        level waittill( "player_wrong_stall", var_1 );
        level.marine2 _id_A510::_id_0C24( level.marine2, "gotofour" );
        wait 10.0;
    }
}

stalltriggerthink( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !_func_1AD( var_1 ) )
            continue;

        if ( self._id_04A6 != "stall4" )
        {
            level notify( "player_wrong_stall", self._id_04A6 );
            continue;
        }

        common_scripts\utility::_id_383F( var_0 + "_player_at_stall" );
    }
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

turn_off_frag_lights()
{
    var_0 = getentarray( "frag_lights", "script_noteworthy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _meth_81E2( 0 );
}

blink_primary_lights()
{
    var_0 = getentarray( "frag_lights", "script_noteworthy" );

    for (;;)
    {
        wait 1;

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] _meth_81E2( 1 );

        wait 1;

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] _meth_81E2( 0 );
    }
}

melon_think()
{
    var_0 = getent( "scr_watermelon", "targetname" );
    var_1 = getent( var_0._id_04A4, "targetname" );
    var_1 _meth_8056();
    var_1 _meth_82BB();
    level waittill( "show_melon" );
    var_1 _meth_8055();
    var_1 _meth_82BA();
    var_0 waittill( "trigger" );
    maps\_cheat::slowmomoderesume();
    var_0 _meth_809C( "melee_knife_hit_watermelon" );
    common_scripts\utility::_id_383F( "melee_complete" );
    playfx( level._id_058F["watermelon"], var_1._id_02E2 );
    var_1 _meth_8056();
    var_1 _meth_82BB();
}

_id_929E()
{
    for (;;)
        wait 1;
}

clear_hints_on_stand()
{
    while ( level._id_0318 _meth_8180() != "stand" )
        wait 0.05;

    _id_1EBE();
}

move_mac()
{
    self waittill( "trigger" );
    level.mac _id_A5A4::_id_7E45( "jog" );
    level.mac _meth_81A9( _func_0C3( self._id_04A4, "targetname" ) );
}

loop_obstacle()
{
    for ( var_0 = 0; var_0 < level.buddies.size; var_0++ )
    {
        level.mac _id_A5A4::_id_7E45( "jog" );
        level.buddies[var_0] thread obstacletrainingcoursethink( level.buddies[var_0].startnode, level.buddies[var_0].waittime );
    }

    level.mac _id_A5A4::_id_7E45( "walk", 1 );
    level.mac _meth_81A9( _func_0C3( "mac_start_node", "targetname" ) );
    level.mac waittill( "goal" );
}

obstacletraining_buddies()
{
    buddiesinit();

    for ( var_0 = 0; var_0 < level.buddies.size; var_0++ )
    {
        var_1 = level.buddies[var_0];
        var_1.startnode = _func_0C3( "obstacle_lane_node" + var_1.buddyid, "targetname" );
        level.buddies[var_0] thread obstacletrainingcoursethink( var_1.startnode );
    }
}

buddiesinit()
{
    level.buddies = getentarray( "buddy", "script_noteworthy" );
    level.buddiesbyid = [];

    for ( var_0 = 0; var_0 < level.buddies.size; var_0++ )
    {
        level.buddies[var_0].buddyid = _func_0BC( level.buddies[var_0]._id_04A6[5] );
        level.buddiesbyid[level.buddies[var_0].buddyid] = level.buddies[var_0];

        switch ( level.buddies[var_0].buddyid )
        {
            case 1:
                level.buddies[var_0].waittime = 1.0;
                continue;
            case 2:
                level.buddies[var_0].waittime = 4.0;
                continue;
            case 3:
                level.buddies[var_0].waittime = 3.0;
                continue;
        }
    }
}

obstacletrainingcoursethink( var_0, var_1 )
{
    level endon( "obstacleTraining_end" );
    self._id_01C4 = 32;

    if ( isdefined( var_1 ) )
        wait(var_1);

    self _meth_81A9( var_0 );
    self waittill( "goal" );
    common_scripts\utility::_id_384A( "start_course" );
    var_2["prone"] = ::set_allowed_stances_prone;
    var_2["stand"] = ::set_allowed_stances_all;
    var_2["stand_from_prone"] = ::set_allowed_stances_all_from_prone;
    var_2["sprint"] = ::set_sprint;
    var_2["finishNode"] = ::set_idle_after_course;
    self._id_2AF3 = 1;

    while ( isdefined( var_0._id_04A4 ) )
    {
        var_0 = _func_0C3( var_0._id_04A4, "targetname" );
        self _meth_81A9( var_0 );
        self waittill( "goal" );

        if ( !isdefined( var_0._id_0398 ) )
            continue;

        [[ var_2[var_0._id_0398] ]]();
    }

    self._id_2AF3 = 0;
}

set_allowed_stances_prone()
{
    self _meth_81CE( "prone" );
}

set_allowed_stances_all()
{
    self _meth_81CE( "prone", "stand", "crouch" );
}

set_allowed_stances_all_from_prone()
{
    self _meth_81CE( "prone", "stand", "crouch" );
    _id_A510::_id_0BC9( self, "prone_to_stand" );
    self._id_8B09 = 1;
}

set_sprint()
{
    self._id_8AA8 = 1;
}

set_idle_after_course()
{
    self._id_01C4 = 100;
    self notify( "goal" );
    _id_A5A4::_id_7E4D( self._id_02E2 );
}

frag_trigger_think( var_0, var_1, var_2 )
{
    common_scripts\utility::_id_383D( var_0 );
    var_1 _meth_81B7();

    if ( isdefined( var_1._id_04A4 ) )
        var_1._id_0251 = getent( var_1._id_04A4, "targetname" );

    if ( isdefined( var_1._id_0251 ) )
        var_1._id_0251 thread flicker_on();

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    for (;;)
    {
        var_1 waittill( "trigger" );

        if ( !common_scripts\utility::_id_382E( "in_safety_pit" ) )
            continue;

        common_scripts\utility::_id_383F( var_0 );
        level._id_0318 _meth_809C( "killhouse_buzzer" );

        if ( isdefined( var_1._id_0251 ) )
            var_1._id_0251 thread flicker_off();

        return var_1;
    }
}

light_off()
{
    self _meth_81E2( 0 );
}

light_on()
{
    self _meth_81E2( 1 );
}

flicker_off()
{
    wait(_func_0B5( 0.2, 0.5 ));
    self _meth_81E2( 0 );
    wait(_func_0B5( 0.05, 0.1 ));
    self _meth_81E2( 0.7 );
    wait(_func_0B5( 0.1, 0.2 ));
    self _meth_81E2( 0 );
    wait(_func_0B5( 0.05, 0.4 ));
    self _meth_81E2( 0.5 );
    wait(_func_0B5( 0.1, 0.5 ));
    self _meth_81E2( 0 );
}

flicker_on()
{
    wait(_func_0B5( 0.2, 0.5 ));
    self _meth_81E2( 0.4 );
    wait(_func_0B5( 0.2, 0.4 ));
    self _meth_81E2( 0 );
    wait(_func_0B5( 0.2, 0.5 ));
    self _meth_81E2( 0.6 );
    wait(_func_0B5( 0.05, 0.2 ));
    self _meth_81E2( 0 );
    wait(_func_0B5( 0.05, 0.1 ));
    self _meth_81E2( 1 );
}

in_pit()
{
    var_0 = getent( "safety_pit", "targetname" );

    if ( !level._id_0318 _meth_80AB( var_0 ) )
        return 0;

    return 1;
}

frag_too_low_hint()
{
    level endon( "fragTraining_end" );
    self _meth_81B7();

    for (;;)
    {
        self waittill( "trigger" );
        _id_1EBE();
        level.currentkeyhintactionname = "";
        killhouse_hint( &"KILLHOUSE_HINT_GRENADE_TOO_LOW", 6 );
    }
}

walk_to( var_0 )
{
    _id_A5A4::_id_7E45( "patrol_unarmed_walk" );
    self._id_0C78 = 1.25;
    self._id_01C4 = 16;
    self _meth_81A9( var_0 );
    self waittill( "goal" );
    self._id_0C78 = 1;
}

jog_to( var_0 )
{
    level.newcastle _meth_8202();
    _id_A5A4::_id_7E45( "RunNoGun_1" );
    self._id_01C4 = 16;
    self _meth_81A9( var_0 );
    self waittill( "goal" );
    level.newcastle _meth_8202( level._id_0318, 1 );
}

walk_to_debrief( var_0 )
{
    level.mocaporiginhangar3 notify( "end_idle" );
    var_1 = [];
    var_1[0] = level.sas_blackkits[0];
    var_1[1] = level.sas_blackkits[1];
    var_1[2] = level.sas_blackkits[2];
    var_1[3] = level._id_6F7C;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] _id_A5A4::_id_7E45( "jog", 1 );
        var_1[var_2] _id_A5A4::_id_08EB();
        var_1[var_2] _id_A5A4::_id_0C3D();
        var_0 thread _id_A510::_id_0BF7( var_1[var_2], "debrief_idle_s" + ( var_2 + 1 ) + "_b", "debrief_idle_s" + ( var_2 + 1 ) + "_b", "stop_loop" );
        wait 1;
    }

    if ( common_scripts\utility::_id_382E( "price_reveal_done" ) )
        price_mask_up_gun_spawn();
}

price_mask_up_gun_spawn()
{
    level._id_6F7C _meth_814E( level._id_78AC["price"]["price_mask_up"], 1 );
    level._id_6F7C _meth_814E( level._id_78AC["price"]["price_mask_outloop"], 1 );
    level._id_6F7C animscripts\shared::_id_6869( level._id_6F7C._id_0513, "right" );
}

dialog_nag_till_in_pit()
{
    level endon( "in_pit_nag_finish" );

    for (;;)
    {
        while ( !common_scripts\utility::_id_382E( "in_pit_with_frags" ) && common_scripts\utility::_id_382E( "in_explosives_area" ) )
        {
            level.newcastle execdialog( "getinsafety" );
            wait 9;
        }

        wait 1;
    }
}

pause_anim()
{
    self _meth_8113( "single anim", _id_A5A4::_id_3EF5( "reveal" ), 1, 0, 0 );
}

unpause_anim()
{
    self _meth_8113( "single anim", _id_A5A4::_id_3EF5( "reveal" ), 1, 0, 1 );
}

m203_icon_hint()
{
    _id_1EBE();
    level waittill( "clearing_hints" );
    wait 0.7;
    _id_A5A4::_id_48CB( 0.5 );
}

c4_icon_hint()
{
    _id_1EBE();
    level endon( "clearing_hints" );
    level waittill( "c4_equiped" );
    level.currentkeyhintactionname = "";
    wait 0.85;
    _id_A5A4::_id_48CB( 0.5 );
}

auto_aim()
{
    if ( level._id_2153 )
    {
        if ( isdefined( getdvar( "input_autoaim" ) ) )
        {
            if ( getdvar( "input_autoaim" ) == "1" )
                return 1;
        }
    }

    return 0;
}

is_ps3_flipped()
{
    var_0 = 0;
    var_1 = getdvar( "gpad_buttonsConfig" );

    if ( isdefined( var_1 ) )
    {
        if ( _func_120( var_1, "_alt" ) )
            var_0 = 1;
    }

    return var_0;
}

gaz_animation( var_0, var_1, var_2, var_3 )
{
    level.waters _meth_8202();

    if ( isdefined( var_1 ) )
        wait(var_1);

    if ( !common_scripts\utility::_id_382E( "gaz_in_idle_position" ) )
        return;

    level.waters notify( "gaz_animation" );
    level.waters endon( "gaz_animation" );
    level.waters.ref_node notify( "stop_loop" );
    level.waters _meth_8143();
    level.waters.ref_node _id_A510::_id_0C24( level.waters, var_0 );

    if ( isdefined( var_2 ) )
    {
        if ( var_3 == 1 )
        {
            level.waters.ref_node notify( "stop_loop" );
            level.waters.ref_node thread _id_A510::_id_0BE1( level.waters, var_2, undefined, "stop_loop" );
            return;
        }
        else
            level.waters.ref_node _id_A510::_id_0C24( level.waters, var_2 );
    }

    level.waters.ref_node notify( "stop_loop" );
    level.waters.ref_node thread _id_A510::_id_0BE1( level.waters, "killhouse_gaz_idleB", undefined, "stop_loop" );
    level.waters _meth_8202( level._id_0318, 1 );
}

nwc_talk_animation( var_0 )
{
    execdialog( var_0 );
}

melontargetdummies()
{
    var_0 = getentarray( "rifle_target_dummy", "script_noteworthy" );
    var_1 = getentarray( "aim_target", "targetname" );
    var_2 = getentarray( "aim_target_right", "targetname" );
    var_3 = getentarray( "cargoship_target", "script_noteworthy" );
    var_4 = common_scripts\utility::_id_0CDD( var_0, var_1 );
    var_4 = common_scripts\utility::_id_0CDD( var_4, var_2 );
    var_4 = common_scripts\utility::_id_0CDD( var_4, var_3 );

    foreach ( var_6 in var_4 )
        var_6 thread melonhead_monitor_targetdummy();
}

melonhead_infinite_melons()
{
    self endon( "melonhead_infinite_disabled" );

    for (;;)
    {
        self waittill( "want_newMelon" );

        if ( !level.melonhead_mode_enabled )
            self notify( "melonhead_infinite_disabled" );

        maps\_cheat::melonhead_add_melon();
    }
}

melonhead_monitor_targetdummy()
{
    self notify( "melonhead_monitor" );
    self endon( "melonhead_monitor" );
    waittillframeend;

    if ( isdefined( self.melonhead_ignore ) && self.melonhead_ignore )
        return;

    for (;;)
    {
        if ( level.melonhead_mode_enabled )
        {
            maps\_cheat::melonhead_add_melon();
            thread melonhead_infinite_melons();
        }
        else
        {
            maps\_cheat::melonhead_remove_melon();
            self notify( "melonhead_infinite_disabled" );
        }

        level waittill( "melonhead_mode_updated" );
    }
}

specify_head_model( var_0 )
{
    self _meth_802A( self._id_477D );
    self _meth_801D( var_0, "", 1 );
    self._id_477D = var_0;
}

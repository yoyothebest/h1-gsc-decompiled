// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_60FB = 1;

    if ( !isdefined( level.min_time_between_uav_launches ) )
        level.min_time_between_uav_launches = 12000;

    if ( !isdefined( level.remote_missile_targets ) )
        level.remote_missile_targets = [];

    level.last_uav_launch_time = 0 - level.min_time_between_uav_launches;
    level.uav_radio_offline_called = 0;
    precacheitem( "remote_missile_detonator" );

    if ( isdefined( level.uav_missile_override ) )
        precacheitem( level.uav_missile_override );
    else
        precacheitem( "remote_missile" );

    precacheshader( "veh_hud_target" );
    precacheshader( "veh_hud_target_offscreen" );
    precacheshader( "veh_hud_missile_flash" );
    precacheshader( "ac130_overlay_grain" );
    precacheshader( "remotemissile_infantry_target" );
    precacheshader( "remotemissile_infantry_target_2plr" );
    precacheshader( "hud_fofbox_self_sp" );
    precacheshader( "dpad_killstreak_hellfire_missile_inactive" );
    precachestring( &"HELLFIRE_DRONE_VIEW" );
    precachestring( &"HELLFIRE_MISSILE_VIEW" );
    precachestring( &"HELLFIRE_FIRE" );
    level.uav_struct = spawnstruct();
    level.uav_struct.view_cone = 4;
    common_scripts\utility::_id_383D( "predator_missile_launch_allowed" );
    common_scripts\utility::_id_383F( "predator_missile_launch_allowed" );
    _id_A5A4::_id_0764( "hint_predator_drone_destroyed", &"HELLFIRE_DESTROYED", ::should_break_destroyed );
    _id_A5A4::_id_0764( "hint_predator_drone_4", &"HELLFIRE_USE_DRONE", ::should_break_use_drone );
    _id_A5A4::_id_0764( "hint_predator_drone_2", &"HELLFIRE_USE_DRONE_2", ::should_break_use_drone );
    _id_A5A4::_id_0764( "hint_predator_drone_not_available", &"HELLFIRE_DRONE_NOT_AVAILABLE", ::should_break_available );

    if ( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal )
        _func_145( "missilecam" );
    else if ( !isdefined( level.vision_uav ) )
        _func_145( "missilecam" );
    else
        _func_145( level.vision_uav );

    _func_0D6( "missileRemoteSpeedUp", "1000" );
    _func_0D6( "missileRemoteSpeedTargetRange", "6000 12000" );
    _id_A5A4::_id_0761( "axis", ::missile_kill_ai );
    common_scripts\utility::_id_383D( "uav_reloading" );
    common_scripts\utility::_id_383D( "uav_collecting_stats" );
    common_scripts\utility::_id_383D( "uav_enabled" );
    common_scripts\utility::_id_383F( "uav_enabled" );

    foreach ( var_1 in level._id_0323 )
        var_1 _id_A5A4::_id_32DD( "controlling_UAV" );
}

should_break_use_drone()
{
    var_0 = 0;

    if ( isdefined( level.uav_is_destroyed ) )
        var_0 = 1;

    var_1 = get_uav();

    if ( !_func_1A1( var_1 ) )
        var_0 = 1;

    if ( isdefined( self.is_flying_missile ) )
        var_0 = 1;

    if ( common_scripts\utility::_id_3839( "wave_wiped_out" ) && common_scripts\utility::_id_382E( "wave_wiped_out" ) )
        var_0 = 1;

    if ( _id_A5A4::_id_32DC( "laststand_downed" ) && _id_A5A4::_id_32D8( "laststand_downed" ) )
        var_0 = 1;

    if ( self _meth_830E() == "remote_missile_detonator" )
        var_0 = 1;

    if ( common_scripts\utility::_id_3839( "no_default_uav_hint" ) && common_scripts\utility::_id_382E( "no_default_uav_hint" ) )
        var_0 = 1;

    return var_0;
}

init_radio_dialogue()
{
    if ( !isdefined( level._id_78B9 ) )
        level._id_78B9 = [];

    level.uav_radio_initialized = 1;
    level._id_78B9["uav_reloading"] = "cont_cmt_rearmhellfires";
    level._id_78B9["uav_offline"] = "cont_cmt_hellfiresoffline";
    level._id_78B9["uav_online"] = "cont_cmt_hellfireonline";
    level._id_78B9["uav_online_repeat"] = "cont_cmt_repeatonline";
    level._id_78B9["uav_down"] = "cont_cmt_uavdown";
    level._id_78B9["uav_multi_kill"] = "cont_cmt_mutlipleconfirmed";
    level._id_78B9["uav_multi_kill2"] = "cont_cmt_fivepluskias";
    level._id_78B9["uav_few_kills"] = "cont_cmt_theyredown";
    level._id_78B9["uav_3_kills"] = "cont_cmt_3kills";
    level._id_78B9["uav_1_kill"] = "cont_cmt_hesdown";
    level._id_78B9["uav_btr_kill"] = "cont_cmt_mutlipleconfirmed";
    level._id_78B9["uav_few_kills"] = "cont_cmt_theyredown";
    level._id_78B9["uav_3_kills"] = "cont_cmt_3kills";
    level._id_78B9["uav_1_kill"] = "cont_cmt_hesdown";
    level._id_78B9["uav_multi_vehicle_kill"] = "cont_cmt_goodhitvehicles";
    level._id_78B9["uav_multi_vehicle_kill2"] = "cont_cmt_goodeffectkia";
    level._id_78B9["uav_helo_kill"] = "cont_cmt_directhitshelo";
    level._id_78B9["uav_btr_kill"] = "cont_cmt_btrdestroyed";
    level._id_78B9["uav_truck_kill"] = "cont_cmt_goodkilltruck";
    level._id_78B9["uav_jeep_kill"] = "cont_cmt_directhitjeep";
    level._id_78B9["uav_direct_hit"] = "cont_cmt_directhit";
}

is_radio_defined( var_0 )
{
    return isdefined( level._id_78B9[var_0] ) || isdefined( level._id_78B9[var_0 + "_variant"] );
}

should_break_available()
{
    if ( isdefined( level.uav_is_not_available ) )
        return 0;
    else
        return 1;
}

should_break_destroyed()
{
    if ( isdefined( level.uav_is_destroyed ) )
        return 0;
    else
        return 1;
}

enable_uav( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( !common_scripts\utility::_id_382E( "uav_enabled" ) )
    {
        common_scripts\utility::_id_383F( "uav_enabled" );

        if ( !common_scripts\utility::_id_382E( "uav_reloading" ) && var_0 )
            thread remotemissile_radio( "uav_online" );
    }

    if ( isdefined( var_1 ) )
        restore_uav_weapon( var_1 );
}

disable_uav( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( common_scripts\utility::_id_382E( "uav_enabled" ) )
    {
        common_scripts\utility::_id_3831( "uav_enabled" );

        if ( !common_scripts\utility::_id_382E( "uav_reloading" ) && var_0 )
            thread remotemissile_radio( "uav_offline" );
    }

    if ( isdefined( var_1 ) && var_1 )
        remove_uav_weapon();
    else
        disable_uav_weapon();
}

restore_uav_weapon( var_0 )
{
    if ( isdefined( level.uav_is_destroyed ) )
        return;

    if ( isstring( var_0 ) )
        var_1 = var_0;
    else if ( isdefined( self.uav_weaponname ) )
        var_1 = self.uav_weaponname;
    else
        return;

    if ( !self _meth_8311( var_1 ) )
        return;

    self _meth_821F( "actionslot" + get_remotemissile_actionslot(), "none" );
    self _meth_8305( get_remotemissile_actionslot(), "weapon", var_1 );
}

remove_uav_weapon()
{
    self _meth_821F( "actionslot" + get_remotemissile_actionslot(), "" );
    self _meth_8305( get_remotemissile_actionslot(), "" );
}

disable_uav_weapon()
{
    self _meth_821F( "actionslot" + get_remotemissile_actionslot(), "dpad_killstreak_hellfire_missile_inactive" );
    self _meth_8305( get_remotemissile_actionslot(), "" );
}

is_remote_missile_weapon( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "remote_missile_detonator" )
        return 1;

    if ( var_0 == "remote_missile_detonator_finite" )
        return 1;

    return 0;
}

give_remotemissile_weapon( var_0 )
{
    set_remotemissile_actionslot();
    self _meth_8305( get_remotemissile_actionslot(), "weapon", var_0 );
    self _meth_830B( var_0 );
    thread maps\_remotemissile_utility::remotemissile_with_autoreloading();
}

set_remotemissile_actionslot()
{
    if ( !self _meth_8311( "claymore" ) )
        self._id_7325 = 4;
    else
        self._id_7325 = 2;
}

get_remotemissile_actionslot()
{
    return self._id_7325;
}

has_uav_rigs()
{
    if ( !isdefined( self.uav_rigs ) )
        return 0;

    return self.uav_rigs.size > 1;
}

remotemissile_weapon_change( var_0 )
{
    self._id_9C29 = 0;

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( is_remote_missile_weapon( var_1 ) )
        {
            self._id_9C29 = 1;

            if ( isdefined( level.uav_is_destroyed ) )
            {
                thread remotemissile_offline( 0, "uav_down" );
                self _meth_8312( self.last_weapon );
                self._id_9C29 = 0;
                continue;
            }

            if ( _id_A5A4::_id_32DC( "laststand_downed" ) && _id_A5A4::_id_32D8( "laststand_downed" ) )
            {
                switchbacktomainweapon();
                self._id_9C29 = 0;
                continue;
            }

            if ( _id_A5A4::_id_32DC( "player_has_red_flashing_overlay" ) && _id_A5A4::_id_32D8( "player_has_red_flashing_overlay" ) )
            {
                switchbacktomainweapon();
                self._id_9C29 = 0;
                continue;
            }

            if ( _id_A5A4::_id_5087() && isdefined( level.uav_user ) && level.uav_user != self )
            {
                thread _id_A5A4::_id_70BD( "so_hq_uav_busy" );
                switchbacktomainweapon();
                self._id_9C29 = 0;
                continue;
            }

            self.uav_weaponname = var_1;
            thread cancel_on_player_damage();

            if ( isdefined( level.remote_missile_hide_stuff_func ) )
                [[ level.remote_missile_hide_stuff_func ]]();

            _id_A5DC::_id_28A2( "player_UAV_use" );
            level.uav_user = self;
            level.uav_killstats = [];
            uavremotelaunchersequence( self, var_1 );
            level.uav_user = undefined;
            self._id_9C29 = 0;

            if ( isdefined( level.remotemissile_global_post_launch_func ) )
                [[ level.remotemissile_global_post_launch_func ]]();

            if ( isdefined( var_0 ) )
                thread [[ var_0 ]]();
        }
    }
}

remotemissile_track_current_weapon()
{
    self endon( "death" );
    self.last_weapon = self _meth_830E();

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( !is_remote_missile_weapon( var_0 ) )
            self.last_weapon = var_0;
    }
}

remotemissile_player_input( var_0 )
{
    self _meth_82DA( "switch_to_remotemissile", "+actionslot " + get_remotemissile_actionslot() );
    thread remotemissile_weapon_change( var_0 );
    thread remotemissile_track_current_weapon();

    for (;;)
    {
        self waittill( "switch_to_remotemissile" );

        if ( self._id_9C29 )
            continue;

        if ( !is_remote_missile_weapon( self _meth_830E() ) )
            self.last_weapon = self _meth_830E();

        if ( isdefined( level.uav_is_destroyed ) )
        {
            thread remotemissile_offline( 0, "uav_down" );
            continue;
        }

        if ( common_scripts\utility::_id_382E( "uav_reloading" ) || !common_scripts\utility::_id_382E( "uav_enabled" ) )
            thread remotemissile_offline( 1 );
    }
}

remotemissile_offline( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "uav_offline";

    var_2 = gettime();

    if ( var_0 && level.last_uav_launch_time + level.min_time_between_uav_launches - var_2 < 2000 || level.min_time_between_uav_launches < 5000 )
    {
        if ( !isdefined( level.uav_is_destroyed ) && ( isdefined( self.uav_weaponname ) && self _meth_82F5( self.uav_weaponname ) > 0 ) )
            return;
    }

    if ( common_scripts\utility::_id_382E( "uav_reloading" ) )
    {
        if ( isdefined( level._id_78B9["uav_reloading"] ) )
            var_1 = "uav_reloading";
    }

    if ( !common_scripts\utility::_id_382E( "uav_collecting_stats" ) && !level.uav_radio_offline_called )
    {
        level.uav_radio_offline_called = 1;
        remotemissile_radio( var_1 );
        level.uav_radio_offline_called = 0;
    }
}

remotemissile_radio_reminder()
{
    level notify( "stop_remotemissile_radio_reminder" );
    level endon( "special_op_terminated" );
    level endon( "starting_predator_drone_control" );
    level endon( "stop_remotemissile_radio_reminder" );

    for (;;)
    {
        wait(7 + _func_0B2( 4 ));

        if ( common_scripts\utility::_id_3839( "special_op_terminated" ) && common_scripts\utility::_id_382E( "special_op_terminated" ) )
            return;

        if ( isdefined( level.uav_is_destroyed ) )
            return;

        if ( common_scripts\utility::_id_382E( "uav_reloading" ) )
            return;

        if ( !common_scripts\utility::_id_382E( "uav_enabled" ) )
            return;

        remotemissile_radio( "uav_online_repeat" );
        wait(15 + _func_0B2( 10 ));

        if ( common_scripts\utility::_id_3839( "special_op_terminated" ) && common_scripts\utility::_id_382E( "special_op_terminated" ) )
            return;

        if ( isdefined( level.uav_is_destroyed ) )
            return;

        if ( isdefined( level.no_remote_missile_reminders ) )
            return;

        remotemissile_radio( "uav_online" );
        thread _id_A5A4::_id_2B4F( "hint_predator_drone_" + get_remotemissile_actionslot(), 6 );
    }
}

play_kills_dialogue()
{
    if ( isdefined( level.dont_use_global_uav_kill_dialog ) )
        return;

    if ( !isdefined( level.uav_radio_initialized ) )
        return;

    var_0 = undefined;
    var_1 = 0;

    if ( isdefined( level.uav_killstats["ai"] ) )
        var_1 = level.uav_killstats["ai"];

    if ( var_1 > 5 )
    {
        var_0 = "uav_multi_kill";

        if ( is_radio_defined( "uav_multi_kill2" ) && common_scripts\utility::_id_2006() )
            var_0 = "uav_multi_kill2";
    }
    else if ( var_1 >= 3 )
        var_0 = "uav_3_kills";
    else if ( var_1 > 1 )
        var_0 = "uav_few_kills";
    else if ( var_1 > 0 )
        var_0 = "uav_1_kill";

    var_2 = undefined;
    var_3 = 0;
    var_4 = 0;
    var_3 = 0;
    var_5 = 0;
    var_6 = 0;
    var_7 = 0;

    foreach ( var_10, var_9 in level.uav_killstats )
    {
        if ( var_10 == "ai" )
            continue;

        if ( var_9 > 0 )
        {
            var_4 += var_9;

            if ( var_10 == "btr" )
            {
                var_3 = var_9;
                continue;
            }

            if ( var_10 == "helo" )
            {
                var_5 = var_9;
                continue;
            }

            if ( var_10 == "jeep" )
            {
                var_6 = var_9;
                continue;
            }

            if ( var_10 == "truck" )
                var_7 = var_9;
        }
    }

    var_11 = var_0;

    if ( var_3 > 0 )
        var_11 = "uav_btr_kill";
    else if ( var_5 > 0 )
        var_11 = "uav_helo_kill";
    else if ( var_4 > 1 )
    {
        var_11 = "uav_multi_vehicle_kill";

        if ( is_radio_defined( "uav_multi_vehicle_kill2" ) && common_scripts\utility::_id_2006() )
            var_11 = "uav_multi_vehicle_kill2";
    }
    else if ( var_6 > 0 )
    {
        var_11 = "uav_jeep_kill";

        if ( var_1 > 2 && var_1 <= 5 && is_radio_defined( "uav_direct_hit" ) && common_scripts\utility::_id_2006() )
            var_11 = "uav_direct_hit";
    }
    else if ( var_7 > 0 )
    {
        var_11 = "uav_truck_kill";

        if ( var_1 > 2 && var_1 <= 5 && is_radio_defined( "uav_direct_hit" ) && common_scripts\utility::_id_2006() )
            var_11 = "uav_direct_hit";
    }

    if ( !isdefined( var_11 ) )
        return;

    if ( common_scripts\utility::_id_3839( "special_op_terminated" ) && common_scripts\utility::_id_382E( "special_op_terminated" ) )
        return;

    remotemissile_radio( var_11 );
    level notify( "remote_missile_kill_dialogue" );
}

set_variant_remotemissile_radio( var_0 )
{
    if ( isdefined( level._id_78B9[var_0 + "_variant"] ) && _func_0CE( level._id_78B9[var_0 + "_variant"] ) )
        level._id_78B9[var_0] = level._id_78B9[var_0 + "_variant"][_func_0B2( level._id_78B9[var_0 + "_variant"].size )];
}

remotemissile_radio( var_0 )
{
    if ( !isdefined( level.uav_radio_initialized ) )
        return;

    if ( isdefined( level.uav_radio_disabled ) && level.uav_radio_disabled )
        return;

    if ( !is_radio_defined( var_0 ) )
        return;

    if ( common_scripts\utility::_id_3839( "special_op_terminated" ) && common_scripts\utility::_id_382E( "special_op_terminated" ) )
        return;

    set_variant_remotemissile_radio( var_0 );
    _id_A5A4::_id_70BD( var_0 );
}

cancel_on_player_damage()
{
    self endon( "exiting_uav_control" );
    self.took_damage = 0;

    if ( _id_A5A4::_id_5087() )
        common_scripts\utility::_id_A069( "player_has_red_flashing_overlay", "player_downed", "dtest", "force_out_of_uav" );
    else
        common_scripts\utility::_id_A069( "damage", "dtest", "force_out_of_uav" );

    self.took_damage = 1;
    _id_A5DC::_id_28A2( "abort_UAV_control" );
}

text_titlecreate()
{
    level.text1 = _id_A546::_id_23ED( "objective", 2.0 );
    var_0 = -175;

    if ( _id_A5A4::_id_5087() )
    {
        var_0 = -150;

        if ( _func_140() )
            var_0 = -110;
    }

    level.text1 _id_A546::_id_7FEE( "CENTER", undefined, 0, var_0 );
}

text_titlesettext( var_0 )
{
    level.text1 _meth_80CC( var_0 );
}

text_titlefadeout()
{
    level.text1 _meth_8086( 0.25 );
    level.text1.alpha = 0;
}

text_titledestroy()
{
    if ( !isdefined( level.text1 ) )
        return;

    level.text1 _meth_808A();
    level.text1 = undefined;
}

display_wait_to_fire( var_0 )
{
    text_noticedestroy();
    text_labelcreate( &"HELLFIRE_RELOADING_WITH_TIME", var_0 );
    wait 1;
    text_noticedestroy();
}

text_labelcreate( var_0, var_1 )
{
    level.text2 = _id_A546::_id_23ED( "objective", 1.85 );
    level.text2 _id_A546::_id_7FEE( "CENTER", undefined, 0, -120 );
    level.text2._id_0241 = var_0;
    level.text2 _meth_80D9( var_1 );
    level.text2.color = ( 0.85, 0.85, 0.85 );
    level.text2.alpha = 0.75;
}

text_noticecreate( var_0 )
{
    level.text2 = _id_A546::_id_23ED( "objective", 1.85 );
    level.text2 _id_A546::_id_7FEE( "CENTER", undefined, 0, -120 );
    level.text2 _meth_80CC( var_0 );
    level.text2.color = ( 0.85, 0.85, 0.85 );
    level.text2.alpha = 0.75;
}

text_noticefadeout()
{
    if ( !isdefined( level.text2 ) )
        return;

    level.text2 _meth_8086( 0.25 );
    level.text2.alpha = 0;
}

text_noticedestroy()
{
    if ( !isdefined( level.text2 ) )
        return;

    level.text2 _meth_808A();
    level.text2 = undefined;
}

waitwithabortondamage( var_0 )
{
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        if ( self.took_damage )
            return 0;

        if ( isdefined( level.uav_is_destroyed ) )
            return 0;

        if ( self _meth_8339() )
            return 0;

        if ( !common_scripts\utility::_id_382E( "uav_enabled" ) )
            return 0;

        wait 0.05;
    }

    return 1;
}

notifyonmissiledeath( var_0, var_1 )
{
    var_2 = gettime();
    level.remotemissilefiretime = var_2;

    if ( isdefined( var_0 ) )
    {
        level.remotemissile = var_0;
        var_0 waittill( "death" );
    }

    var_1 _id_A5A4::_id_27EF( 0.1, ::holdstancechange, 1 );
    var_1.active_uav_missile = undefined;

    if ( isdefined( level.remotemissilefiretime ) && level.remotemissilefiretime == var_2 )
    {
        level notify( "remote_missile_exploded" );
        var_1 notify( "remote_missile_exploded" );
        level.remotemissile = undefined;
    }

    level _id_A5A4::_id_27EF( 0.2, _id_A5A4::_id_7C82, "delayed_remote_missile_exploded" );
}

abortlaptopswitch( var_0 )
{
    var_0 _id_A5A4::_id_32DA( "controlling_UAV" );
    var_0 notify( "exiting_uav_control" );
    _id_A5DC::_id_28A2( "abort_UAV_control" );
    var_0 _meth_82D1( level._id_58BC, 0.5 );

    if ( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal )
        var_0 _meth_82D4( level._id_9E7D, 0.5 );
    else if ( isdefined( _id_A5A4::_id_3EBF( level._id_58BC ) ) )
        var_0 _id_A5A4::_id_395E( level._id_58BC, 0.5 );

    var_0 switchbacktomainweapon();
    var_0 _meth_8326( 0 );

    if ( !_id_A5A4::_id_5062( var_0 ) )
        var_0 _meth_831D();

    var_0 _id_A5A4::_id_27EF( 0.1, ::holdstancechange, 1 );
    level.uavtargetent = undefined;
    wait 0.1;
    huditemsshow();
}

holdstancechange( var_0 )
{
    if ( !var_0 )
    {
        var_1 = self _meth_8180();

        if ( var_1 != "prone" )
            self _meth_811C( var_0 );

        if ( var_1 != "crouch" )
            self _meth_811B( var_0 );

        if ( var_1 != "stand" )
        {
            self _meth_811A( var_0 );
            return;
        }
    }
    else
    {
        self _meth_811C( var_0 );
        self _meth_811B( var_0 );
        self _meth_811A( var_0 );
    }
}

uavremotelaunchersequence( var_0, var_1 )
{
    if ( var_1 == "remote_missile_detonator" )
        var_0 _meth_832F( var_1 );

    level notify( "starting_predator_drone_control" );
    var_0 notify( "starting_predator_drone_control" );
    var_2 = 0;
    var_3 = 0;
    level.vision_black = "black_bw";

    if ( !isdefined( level.vision_uav ) )
        level.vision_uav = "ac130";

    level.vision_missile = "missilecam";
    var_0 _meth_831C();
    var_0 _meth_8326( 1 );
    var_0 holdstancechange( 0 );
    var_0 _id_A5A4::_id_32DE( "controlling_UAV" );
    var_4 = var_0 waitwithabortondamage( 1.0 );

    if ( !var_4 )
        abortlaptopswitch( var_0 );
    else
    {
        var_5 = 0.25;
        var_0 _meth_82D1( level.vision_black, var_5 );

        if ( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal )
            var_0 _meth_82D4( level.vision_black, var_5 );

        huditemshide();
        var_4 = waitwithabortondamage( var_5 );

        if ( !var_4 )
        {
            abortlaptopswitch( var_0 );
            return;
        }

        var_0._id_500B = 1;
        level notify( "player_is_controlling_UAV" );
        var_0 notify( "player_is_controlling_UAV" );
        var_6 = var_0 get_uav();

        if ( isdefined( var_6 ) )
        {
            if ( _id_A5A4::_id_5083() )
                var_6 _meth_8058( self );
            else
                var_6 _meth_8056();
        }

        var_7 = maps\_remotemissile_utility::player_uav_rig();

        if ( !maps\_remotemissile_utility::remotemissile_move_player() )
        {
            var_0 _meth_8080( var_7, "tag_player", 1.0, level.uav_struct.view_cone, level.uav_struct.view_cone, level.uav_struct.view_cone, level.uav_struct.view_cone );
            var_8 = var_7 _meth_8185( "tag_origin" );
            var_0 _meth_8337( var_8 );
        }
        else
        {
            var_0._id_63B1 = var_0._id_02E2;
            var_0._id_6394 = var_0 _meth_8338();
            var_0 _meth_807F( maps\_remotemissile_utility::player_uav_rig(), "tag_player", 1.0, level.uav_struct.view_cone, level.uav_struct.view_cone, level.uav_struct.view_cone, level.uav_struct.view_cone );
            var_0 _meth_807F( maps\_remotemissile_utility::player_uav_rig(), "tag_player", 1.0, 0, 0, 0, 0 );
            var_0 _id_A5A4::_id_27EF( 0.1, ::open_view_cone );
        }

        var_0 _meth_8326( 0 );
        var_0 _meth_847E();
        wait 0.05;

        if ( isdefined( level.activate_uav_hud_cb ) )
            var_0 [[ level.activate_uav_hud_cb ]]();
        else
        {
            var_0 text_titlecreate();
            text_titlesettext( &"HELLFIRE_DRONE_VIEW" );
        }

        if ( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal )
        {
            _id_A550::_id_92FF();
            var_0 _meth_80B8();
            var_0 _meth_82D4( level.vision_uav, 0.25 );
            var_0 _meth_82D1( level._id_58BC, 0.25 );
        }
        else
        {
            if ( isdefined( _id_A5A4::_id_3EBF( level.vision_uav ) ) )
                var_0 _id_A5A4::_id_395E( level.vision_uav, 0.25 );

            var_0 _meth_82D1( level.vision_uav, 0.25 );
        }

        thread drawtargetsstart();
        wait 0.2;
        var_9 = waitforattackcommand( var_0 );

        if ( !var_9 )
        {
            exitfromcamera_uav( var_0, var_0.took_damage );
            return;
        }

        level.last_uav_launch_time = gettime();
        thread uav_reload();
        level notify( "player_fired_remote_missile" );
        var_0 notify( "player_fired_remote_missile" );
        var_10 = firemissilefromuavplayer( var_0 );
        var_10 thread do_physics_impact_on_explosion( var_0 );
        var_10 thread flash_for_explosion_early( var_0 );

        if ( var_2 )
        {
            var_0 text_noticecreate( &"HELLFIRE_FIRE" );
            var_4 = waitwithabortondamage( 1.2 );

            if ( !var_4 )
            {
                exitfromcamera_uav( var_0, 1 );
                return;
            }

            text_noticefadeout();
            drawtargetsend();
            wait 0.25;
        }

        var_0.is_flying_missile = 1;

        if ( isdefined( level.firemissile_uav_hud_cb ) )
            var_0 [[ level.firemissile_uav_hud_cb ]]( 0 );
        else
        {
            text_titlesettext( &"HELLFIRE_MISSILE_VIEW" );
            text_noticedestroy();
        }

        switchbacktomainweaponfast();
        var_0 _meth_8214();
        var_0 _meth_8051();
        var_0 _meth_831A();

        if ( isdefined( level.uav_missile_tag_for_camera ) )
            var_0 _meth_81E5( var_10, level.uav_missile_tag_for_camera );
        else
            var_0 _meth_81E5( var_10, "tag_origin" );

        var_0 _meth_8204( var_10 );
        var_4 = waitwithabortondamage( 0.2 );

        if ( !var_4 )
        {
            exitfromcamera_missile( var_0, 1 );
            return;
        }

        if ( isdefined( level.remote_missile_steering_cb ) )
            var_0 [[ level.remote_missile_steering_cb ]]( var_10 );

        thread drawtargetsstart();

        while ( isdefined( level.remotemissile ) )
        {
            wait 0.05;

            if ( isdefined( level.uav_is_destroyed ) )
            {
                exitfromcamera_missile( var_0, 1 );
                return;
            }

            if ( var_0.took_damage )
            {
                exitfromcamera_missile( var_0, 1 );
                return;
            }

            if ( !common_scripts\utility::_id_382E( "uav_enabled" ) )
            {
                exitfromcamera_missile( var_0, 1 );
                return;
            }
        }

        if ( !isdefined( var_6 ) )
        {
            exitfromcamera_missile( var_0, 0 );
            return;
        }

        if ( var_3 )
        {
            _func_0D6( "cg_fov", 26 );
            var_0.fov_is_altered = 1;
            var_0.is_flying_missile = undefined;
            var_0 _meth_8205();
            var_0 _meth_81E6();
            var_0 _meth_8215();
            var_0 _meth_8080( maps\_remotemissile_utility::player_uav_rig(), "tag_player", 1.0, level.uav_struct.view_cone, level.uav_struct.view_cone, level.uav_struct.view_cone, level.uav_struct.view_cone );
            var_0 _meth_8337( maps\_remotemissile_utility::player_uav_rig() _meth_8185( "tag_origin" ) );
            var_4 = waitwithabortondamage( 2 );

            if ( !var_4 )
            {
                exitfromcamera_uav( var_0, var_0.took_damage );
                return;
            }

            exitfromcamera_uav( var_0, 0 );
            return;
        }

        exitfromcamera_missile( var_0, 0 );
    }
}

uav_reload()
{
    level endon( "stop_uav_reload" );
    common_scripts\utility::_id_383F( "uav_reloading" );
    wait(level.min_time_between_uav_launches * 0.001);
    common_scripts\utility::_id_3831( "uav_reloading" );
}

flash_for_explosion_early( var_0 )
{
    var_0 waittill( "predicted_projectile_impact", var_1, var_2 );
    var_0 _meth_82D1( "coup_sunblind", 0 );
}

do_physics_impact_on_explosion( var_0 )
{
    var_0.fired_hellfire_missile = 1;
    var_0 waittill( "projectile_impact", var_1, var_2, var_3 );
    level thread missile_kills( var_0 );
    level.uavtargetpos = var_2;
    var_4 = 1000;
    var_5 = 6.0;
    _func_18C( 0.3, 1.4, var_2, 8000 );
    _id_A5DC::_id_28A2( "remote_missle_impact", var_2 );
    wait 0.1;
    _func_17E( var_2, var_4, var_4 / 2, var_5 );
    wait 2;
    level.uavtargetpos = undefined;
    var_0.fired_hellfire_missile = undefined;
}

missile_kills( var_0 )
{
    common_scripts\utility::_id_383F( "uav_collecting_stats" );
    var_1 = _id_A5A4::_id_4153();

    foreach ( var_3 in var_1 )
        var_3 thread missile_kill_vehicle( var_0 );

    wait 1;
    common_scripts\utility::_id_3831( "uav_collecting_stats" );
}

missile_kill_ai( var_0 )
{
    if ( !isdefined( level.uav_radio_initialized ) )
        return;

    self waittill( "death", var_0, var_1 );

    if ( !isdefined( level.uav_user ) )
        return;

    if ( !isdefined( level.uav_killstats["ai"] ) )
        level.uav_killstats["ai"] = 0;

    if ( isdefined( var_0 ) && isdefined( level.uav_user ) )
    {
        if ( var_0 == level.uav_user || isdefined( var_0.attacker ) && var_0.attacker == level.uav_user )
            level.uav_killstats["ai"]++;
    }
}

missile_kill_vehicle( var_0 )
{
    if ( !isdefined( level.uav_radio_initialized ) )
        return;

    level endon( "delayed_remote_missile_exploded" );
    var_1 = undefined;

    switch ( self._id_04FF )
    {
        case "btr80":
        case "btr80_physics":
            var_1 = "btr";
            break;
        case "mi17":
        case "hind":
        case "ucav":
        case "mi17_noai":
        case "mi17_bulletdamage":
            var_1 = "helo";
            break;
        case "uaz":
        case "uaz_physics":
            var_1 = "jeep";
            break;
        case "bm21_troops":
        case "bm21":
        case "bm21_drivable":
            var_1 = "truck";
            break;
        default:
            var_1 = "vehicle";
            break;
    }

    if ( !isdefined( level.uav_killstats[var_1] ) )
        level.uav_killstats[var_1] = 0;

    self waittill( "death", var_2, var_3 );

    if ( var_1 == "helo" || var_1 == "btr" || isdefined( self._id_750A ) && self._id_750A.size > 0 )
    {
        if ( isdefined( var_2 ) && var_2 == var_0 )
            level.uav_killstats[var_1]++;
    }
}

get_current_uav_rig()
{
    var_0 = self.uav_rigs[self.current_uav_index];
    return var_0;
}

get_uav()
{
    if ( !isdefined( self.uav_rigs ) )
        return level.uav;

    if ( !isdefined( self.current_uav_index ) )
        self.current_uav_index = 0;

    var_0 = get_current_uav_rig();
    return var_0.uav;
}

exitfromcamera_missile( var_0, var_1 )
{
    var_0.is_flying_missile = undefined;

    if ( isdefined( level.firemissile_uav_hud_cb ) )
        var_0 [[ level.firemissile_uav_hud_cb ]]( 1 );
    else
        text_titledestroy();

    drawtargetsend();

    if ( isdefined( level.uav_is_destroyed ) )
        thread staticeffect( 0.5 );

    var_0 _meth_8205();
    var_0 _meth_81E6();

    if ( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal )
    {
        _id_A550::_id_92FE();
        var_0 _meth_80B9();
        var_0 _meth_82D4( level._id_9E7D, 0 );
    }

    var_0 _meth_8215();
    var_2 = var_0 get_uav();

    if ( isdefined( var_2 ) )
    {
        if ( _id_A5A4::_id_5083() )
            var_2 _meth_8057( self );
        else
            var_2 _meth_8055();
    }

    if ( var_1 )
    {
        var_0 _meth_82D1( level.vision_black, 0 );
        wait 0.05;
        var_0 _meth_82D1( level._id_58BC, 0.4 );

        if ( !( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal ) )
        {
            if ( isdefined( _id_A5A4::_id_3EBF( level._id_58BC ) ) )
                var_0 _id_A5A4::_id_395E( level._id_58BC, 0.4 );
        }

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831B();

        var_0 _meth_8326( 0 );
        var_0 _meth_847D();
        wait 0.2;
        huditemsshow();

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831D();
    }
    else
    {
        var_0 _meth_82D1( "coup_sunblind", 0 );
        var_0 _meth_8326( 1 );
        wait 0.05;
        var_0 _meth_82D1( level._id_58BC, 1.0 );

        if ( !( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal ) )
        {
            if ( isdefined( _id_A5A4::_id_3EBF( level._id_58BC ) ) )
                var_0 _id_A5A4::_id_395E( level._id_58BC, 1.0 );
        }

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831B();

        var_0 _meth_847D();
        wait 0.5;
        huditemsshow();

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831D();

        var_0 _meth_8326( 0 );
    }

    var_0 notify( "exiting_uav_control" );
    var_0._id_500B = undefined;
    level.uavtargetent = undefined;
}

exitfromcamera_uav( var_0, var_1 )
{
    _id_A5DC::_id_28A2( "abort_UAV_control" );
    drawtargetsend();

    if ( isdefined( level.deactivate_uav_hud_cb ) )
        var_0 [[ level.deactivate_uav_hud_cb ]]( 0 );
    else
    {
        text_titlefadeout();
        text_noticefadeout();
    }

    var_0 _meth_82D1( level.vision_black, 0.25 );

    if ( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal )
        var_0 _meth_82D4( level.vision_black, 0.25 );

    if ( isdefined( level.uav_is_destroyed ) )
        var_0 thread staticeffect( 0.5 );

    wait 0.15;
    wait 0.35;

    if ( isdefined( level.deactivate_uav_hud_cb ) )
        var_0 [[ level.deactivate_uav_hud_cb ]]( 1 );
    else
    {
        text_titledestroy();
        text_noticedestroy();
    }

    var_0 _meth_8051();

    if ( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal )
    {
        var_0 _meth_82D4( level._id_9E7D, 0 );
        _id_A550::_id_92FE();
        var_0 _meth_80B9();
    }

    if ( isdefined( var_0.fov_is_altered ) )
        _func_0D6( "cg_fov", 65 );

    var_2 = var_0 get_uav();

    if ( isdefined( var_2 ) )
    {
        if ( _id_A5A4::_id_5083() )
            var_2 _meth_8057( self );
        else
            var_2 _meth_8055();
    }

    if ( var_1 )
    {
        var_0 switchbacktomainweaponfast();
        var_0 _meth_8326( 1 );
        wait 0.15;
        var_0 _meth_82D1( level._id_58BC, 0.4 );

        if ( !( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal ) )
        {
            if ( isdefined( _id_A5A4::_id_3EBF( level._id_58BC ) ) )
                var_0 _id_A5A4::_id_395E( level._id_58BC, 0.4 );
        }

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831B();

        var_0 _meth_847D();
        wait 0.1;
        huditemsshow();

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831D();

        var_0 _meth_8326( 0 );
    }
    else
    {
        var_0 _meth_8326( 1 );
        wait 0.05;
        var_0 _meth_82D1( level._id_58BC, 0.75 );

        if ( !( isdefined( level.remotemissile_usethermal ) && level.remotemissile_usethermal ) )
        {
            if ( isdefined( _id_A5A4::_id_3EBF( level._id_58BC ) ) )
                var_0 _id_A5A4::_id_395E( level._id_58BC, 0.75 );
        }

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831B();

        var_0 _meth_847D();
        wait 0.5;
        huditemsshow();
        var_0 switchbacktomainweapon();

        if ( !_id_A5A4::_id_5062( var_0 ) )
            var_0 _meth_831D();

        var_0 _meth_8326( 0 );
    }

    var_0 _id_A5A4::_id_27EF( 0.1, ::holdstancechange, 1 );
    var_0 notify( "exiting_uav_control" );
    var_0._id_500B = undefined;
    level.uavtargetent = undefined;
    return;
}

waitforattackcommand( var_0 )
{
    var_0 _meth_82DA( "abort_remote_missile", "weapnext" );
    var_0 _meth_82DA( "abort_remote_missile", "+stance" );

    if ( !level._id_2153 )
    {
        var_0 _meth_82DA( "abort_remote_missile", "+gostand" );
        var_0 _meth_82DA( "abort_remote_missile", "togglecrouch" );
        var_0 _meth_82DA( "abort_remote_missile", "toggleprone" );
    }

    var_0 _meth_82DA( "launch_remote_missile", "+attack" );
    var_0 _meth_82DA( "launch_remote_missile", "+attack_akimbo_accessible" );
    var_0 thread wait_for_other();
    var_0 thread wait_for_command_thread( "abort_remote_missile", "abort" );

    if ( common_scripts\utility::_id_382E( "predator_missile_launch_allowed" ) )
        var_0 thread wait_for_command_thread( "launch_remote_missile", "launch" );

    var_0 waittill( "remote_missile_attack", var_1 );
    var_0 _id_A5A4::_id_32DA( "controlling_UAV" );

    if ( var_1 == "launch" )
        return 1;
    else
        return 0;
}

wait_for_command_thread( var_0, var_1 )
{
    self endon( "remote_missile_attack" );
    self waittill( var_0 );
    self notify( "remote_missile_attack", var_1 );
}

wait_for_other()
{
    self endon( "remote_missile_attack" );

    for (;;)
    {
        wait 0.05;

        if ( self.took_damage )
            break;

        if ( !common_scripts\utility::_id_382E( "uav_enabled" ) )
            break;

        if ( isdefined( level.uav_is_destroyed ) )
            break;
    }

    self notify( "remote_missile_attack", "abort" );
}

huditemshide()
{
    if ( level._id_0323.size > 0 )
    {
        for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
        {
            if ( isdefined( level._id_0323[var_0]._id_9C29 ) && level._id_0323[var_0]._id_9C29 )
                setdvar( "ui_remotemissile_playernum", var_0 + 1 );
        }
    }
    else
    {
        _func_0D6( "compass", "0" );
        _func_0D6( "ammoCounterHide", "1" );
        _func_0D6( "actionSlotsHide", "1" );
    }
}

huditemsshow()
{
    if ( level._id_0323.size > 0 )
        setdvar( "ui_remotemissile_playernum", 0 );
    else
    {
        _func_0D6( "compass", "1" );
        _func_0D6( "ammoCounterHide", "0" );
        _func_0D6( "actionSlotsHide", "0" );
    }
}

firemissilefromuavplayer( var_0 )
{
    _func_18C( 0.25, 0.5, maps\_remotemissile_utility::player_uav_rig()._id_02E2, 5000 );
    var_1 = maps\_remotemissile_utility::player_uav_rig()._id_02E2;
    var_2 = var_0 _meth_8338();
    var_3 = anglestoforward( var_2 );
    var_4 = anglestoright( var_2 );

    if ( !isdefined( level.uav_missle_start_forward_distance ) )
        level.uav_missle_start_forward_distance = -300.0;

    if ( !isdefined( level.uav_missle_start_right_distance ) )
        level.uav_missle_start_right_distance = 700.0;

    var_5 = var_1 + var_4 * level.uav_missle_start_right_distance + var_3 * level.uav_missle_start_forward_distance;
    var_6 = var_5 + var_3 * 10.0;

    if ( isdefined( level.uav_missile_override ) )
        var_7 = _func_1C2( level.uav_missile_override, var_5, var_6, var_0 );
    else if ( isdefined( level.remote_missile_snow ) )
        var_7 = _func_1C2( "remote_missile_snow", var_5, var_6, var_0 );
    else if ( isdefined( level.remote_missile_invasion ) )
        var_7 = _func_1C2( "remote_missile_invasion", var_5, var_6, var_0 );
    else
        var_7 = _func_1C2( "remote_missile", var_5, var_6, var_0 );

    var_0.active_uav_missile = var_7;
    thread notifyonmissiledeath( var_7, var_0 );
    return var_7;
}

drawtargetsstart()
{
    level.uav_struct.draw_red_boxes = 1;
    level endon( "uav_destroyed" );
    level endon( "draw_target_end" );
    level notify( "stop_prv_draw_targets" );
    level endon( "stop_prv_draw_targets" );
    wait 0.05;
    var_0 = 4;
    var_1 = 0;
    var_2 = 0.05;

    foreach ( var_4 in level.remote_missile_targets )
    {
        if ( !_func_1A1( var_4 ) )
            continue;

        var_4 draw_target();
        var_1++;

        if ( var_1 >= var_0 )
        {
            var_1 = 0;
            wait(var_2);
        }
    }
}

draw_target()
{
    self.has_target_shader = 1;

    if ( isdefined( self._id_4811 ) )
        _func_09D( self, ( 0, 0, -96 ) );
    else
        _func_09D( self, ( 0, 0, 64 ) );

    if ( _func_0CF( self ) )
    {
        if ( _func_140() )
            _func_09F( self, "remotemissile_infantry_target_2plr" );
        else
            _func_09F( self, "remotemissile_infantry_target" );
    }
    else if ( _func_1AD( self ) )
    {
        if ( isdefined( self._id_500B ) && self._id_500B )
            _func_09F( self, "hud_fofbox_self_sp" );
        else
        {

        }
    }
    else
        _func_09F( self, "veh_hud_target" );

    var_0 = undefined;
    var_1 = undefined;

    foreach ( var_3 in level._id_0323 )
    {
        if ( isdefined( var_3._id_500B ) && var_3._id_500B )
        {
            _func_0AA( self, var_3 );
            continue;
        }

        _func_0A9( self, var_3 );
    }
}

drawtargetsend()
{
    level notify( "draw_target_end" );
    level.uav_struct.draw_red_boxes = undefined;
    waitframe;

    foreach ( var_1 in level.remote_missile_targets )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( isdefined( var_1.has_target_shader ) )
        {
            var_1.has_target_shader = undefined;
            _func_09E( var_1 );
        }
    }
}

switchbacktomainweapon()
{
    return switchbacktomainweapon_internal( ::_switcher );
}

switchbacktomainweaponfast()
{
    return switchbacktomainweapon_internal( ::_switchernow );
}

_switcher( var_0 )
{
    self _meth_8312( var_0 );
}

_switchernow( var_0 )
{
    self _meth_8313( var_0 );
}

switchbacktomainweapon_internal( var_0 )
{
    if ( _id_A5A4::_id_32DC( "laststand_downed" ) && _id_A5A4::_id_32D8( "laststand_downed" ) )
        return;

    var_1 = self _meth_82CE( "primary", "altmode" );

    foreach ( var_3 in var_1 )
    {
        if ( self.last_weapon == var_3 )
        {
            self [[ var_0 ]]( self.last_weapon );
            return;
        }
    }

    if ( var_1.size > 0 )
        self [[ var_0 ]]( var_1[0] );
}

staticeffect( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 1 ) );
    var_1._id_02E2 = self._id_02E2;
    var_1 _meth_809C( "predator_drone_static", "sounddone" );
    var_2 = _func_1AA( self );
    var_2._id_01F3 = "fullscreen";
    var_2._id_0501 = "fullscreen";
    var_2 _meth_80CE( "ac130_overlay_grain", 640, 480 );
    wait(var_0);
    var_2 _meth_808A();
    wait 3;
    var_1 _meth_80AE();
    wait 1;
    var_1 delete();
}

player_can_cycle_uav_rigs()
{
    self endon( "controlling_UAV" );
    var_0 = self _meth_833A();

    for (;;)
    {
        var_1 = self _meth_833A();

        if ( !var_0 && var_1 )
        {
            self.current_uav_index++;
            self.current_uav_index %= self.uav_rigs.size;
            var_2 = maps\_remotemissile_utility::player_uav_rig();
            self _meth_8051();
            var_3 = level.uav_struct.view_cone;
            self _meth_8080( var_2, "tag_player", 1, var_3, var_3, var_3, var_3, 1 );
            var_4 = var_2 _meth_8185( "tag_origin" );
            self _meth_8337( var_4 );
        }

        var_0 = var_1;
        wait 0.05;
    }
}

cycle_uav_rigs()
{
    if ( self.uav_rigs.size <= 1 )
        return;

    if ( isdefined( self.cycling_rigs ) )
        return;

    self.cycling_rigs = 1;

    for (;;)
    {
        _id_A5A4::_id_32E0( "controlling_UAV" );
        player_can_cycle_uav_rigs();
    }
}

run_rig_function_when_player_uses_uav( var_0, var_1 )
{
    var_2 = [];
    var_2["player0"] = "cg_playerFovScale0";
    var_2["player1"] = "cg_playerFovScale1";
    var_3 = var_2[var_1._id_9A29];

    for (;;)
    {
        var_1 _id_A5A4::_id_32E0( "controlling_UAV" );
        thread [[ var_0 ]]( var_1 );
        var_1 _id_A5A4::_id_32E4( "controlling_UAV" );
        _func_0D6( var_3, 1 );
    }
}

open_view_cone()
{
    self _meth_80A4( 0, 0, 0, level.uav_struct.view_cone, level.uav_struct.view_cone, level.uav_struct.view_cone * 0.25, level.uav_struct.view_cone );
}

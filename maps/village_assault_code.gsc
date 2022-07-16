// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

precachelevelstuff()
{
    precachestring( &"VILLAGE_ASSAULT_OBJECTIVE_LOCATE_ALASAD" );
    precachestring( &"SCRIPT_ARMOR_DAMAGE" );
    precachestring( &"SCRIPT_LEARN_CHOPPER_AIR_SUPPORT1" );
    precachestring( &"SCRIPT_LEARN_CHOPPER_AIR_SUPPORT1_PC" );
    precachestring( &"VILLAGE_ASSAULT_YOU_KILLED_ALASAD" );
    precacheshader( "black" );
    precacheshader( "hud_icon_cobra" );
    precacheshader( "popmenu_bg" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precacheshader( "hud_dpad" );
    precacheshader( "hud_arrow_right" );
    precachemodel( "sundirection_arrow" );
    precachemodel( "com_folding_chair" );
    precachemodel( "com_flashlight_off" );
    precachemodel( "com_flashlight_on" );
    precachemodel( "h1_choke_rope" );
    precachemodel( "h1_alasad_rope" );
    precacheitem( "mi28_ffar_village_assault" );
    precacheitem( "flash_grenade" );
    precacheitem( "colt45_alasad_killer" );
    precachemodel( "weapon_c4" );
    precachemodel( "weapon_c4_obj" );
    precachemodel( "h1_ch_interior_door_02" );
    common_scripts\utility::_id_383D( "gave_air_support_hint" );
    common_scripts\utility::_id_383D( "alasad_sequence_started" );
    common_scripts\utility::_id_383D( "air_support_refueling" );
    common_scripts\utility::_id_383D( "delete_attack_coord_hint" );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_ak47_clip";
    level.weaponclipmodels[1] = "weapon_mp5_clip";
    level.weaponclipmodels[2] = "weapon_m16_clip";
    level.weaponclipmodels[3] = "weapon_g36_clip";
    level.weaponclipmodels[4] = "weapon_dragunov_clip";
    level.weaponclipmodels[5] = "weapon_g3_clip";
    maps\air_support_shared::air_support_precache();
}

setleveldvars()
{
    if ( getdvar( "village_assault_debug_marker" ) == "" )
        setdvar( "village_assault_debug_marker", "0" );

    level.seekersusingcolors = 0;
    level.bmp_safety_distance = 262144;
    level.goodfriendlydistancefromplayersquared = 262144;
    level.choppersupportcallnextaudio = 0;
    level.buildingclearnextaudio = 0;
    level.air_support_hint_print_dialog_next = 0;
    level.choppersupporthoverlocations = [];
    var_0 = getentarray( "chopper_location", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        level.choppersupporthoverlocations[level.choppersupporthoverlocations.size] = var_0[var_1]._id_02E2;
        var_0[var_1] delete();
    }

    level._id_2235["25"] = _func_0B7( 25 );
    level._id_2235["45"] = _func_0B7( 45 );
    level._id_2235["55"] = _func_0B7( 55 );
    level._id_2235["60"] = _func_0B7( 60 );
    level._id_2235["70"] = _func_0B7( 70 );
    level.alasad_possible_objective_locations = [];
    level.alasad_possible_objective_locations_remaining[0] = "2";
    level.alasad_possible_objective_locations_remaining[1] = "6";
    level.next_genocide_audio = 0;
    level.genocide_audio[0] = "assault_killing_distance1";
    level.genocide_audio[1] = "assault_killing_interior1";
    level.genocide_audio[2] = "assault_killing_interior2";
    level.genocide_audio[3] = "assault_killing_interior3";
    level.timedautosavenumber = 0;
    level.timedautosavetime = undefined;
    var_2 = _id_A5A4::_id_3F58();

    switch ( var_2 )
    {
        case "gimp":
        case "easy":
            level.timedautosavetime = 60;
            common_scripts\utility::_id_0D13( getentarray( "bmp_spawn_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CC );
            break;
        case "medium":
            level.timedautosavetime = 120;
            break;
        case "difficult":
        case "hard":
            level.timedautosavetime = 180;
            break;
        case "fu":
            level.timedautosavetime = 0;
            break;
    }
}

scriptcalls()
{
    maps\village_assault_anim::main();
    level thread maps\village_assault_amb::main();
    _id_A51D::_id_8324( "compass_map_village_assault" );
    common_scripts\utility::_id_0D13( getentarray( "seek_player", "script_noteworthy" ), _id_A5A4::_id_0798, ::seek_player );
    common_scripts\utility::_id_0D13( getentarray( "indoor_enemy", "script_noteworthy" ), _id_A5A4::_id_0798, ::indoor_enemy );
    common_scripts\utility::_id_0D13( getentarray( "seek_player_smart", "script_noteworthy" ), _id_A5A4::_id_0798, ::seek_player_smart );
    common_scripts\utility::_id_0D13( getentarray( "dog", "script_noteworthy" ), _id_A5A4::_id_0798, ::seek_player_dog );
    common_scripts\utility::_id_0D13( getentarray( "enemy_color_hint_trigger", "targetname" ), ::enemy_color_hint_trigger_think );
    common_scripts\utility::_id_0D13( getentarray( "genocide_audio_trigger", "targetname" ), ::genocide_audio_trigger );
    common_scripts\utility::_id_0D13( getentarray( "dead_civilian", "targetname" ), ::dead_civilian );
    common_scripts\utility::_id_0D13( getentarray( "trigger_upstairs_guys", "targetname" ), ::trigger_upstairs_guys );
    common_scripts\utility::_id_0D13( getentarray( "alasad_barn_deletable", "script_noteworthy" ), ::alasad_deletable_hide );
    common_scripts\utility::_id_0D13( getentarray( "alasad_house_deletable", "script_noteworthy" ), ::alasad_deletable_hide );
    _id_A5A4::_id_0764( "call_air_support2", &"SCRIPT_PLATFORM_LEARN_CHOPPER_AIR_SUPPORT2", ::should_delete_attack_coord_hint );
    thread chopper_air_support();
    thread vehicle_patrol_init();
    thread roaming_bmp();
    thread timedautosaves();

    if ( getdvar( "village_assault_disable_gameplay" ) == "1" )
        thread disable_gameplay();

    wait 6.5;
    objective_add( 0, "current", &"VILLAGE_ASSAULT_OBJECTIVE_LOCATE_ALASAD", ( 0, 0, 0 ) );
}

disable_gameplay()
{
    common_scripts\utility::_id_0D13( getentarray( "trigger_multiple", "classname" ), ::disable_gameplay_trigger );
    common_scripts\utility::_id_0D13( getentarray( "trigger_radius", "classname" ), ::disable_gameplay_trigger );
}

moveplayertolocation( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( ( 0, var_1.angles[1], 0 ) );
}

disable_gameplay_trigger()
{
    var_0 = 0;

    if ( self._id_03DA & 32 )
        var_0 = 1;

    if ( isdefined( self._id_04A6 ) )
    {
        if ( self._id_04A6 == "flood_and_secure" )
            var_0 = 1;
        else if ( self._id_04A6 == "flood_spawner" )
            var_0 = 1;
    }

    if ( var_0 )
        thread common_scripts\utility::_id_97CC();
}

spawn_starting_friendlies( var_0 )
{
    level.friendlies = [];
    var_1 = getentarray( var_0, "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2] _meth_8096();

        if ( _id_A5A4::_id_88F1( var_3 ) )
        {

        }

        var_3._id_01C4 = 32;
        var_3._id_020C = 128;
        var_3._id_017D = 0;
        var_3._id_A7E8 = 0;

        if ( _func_120( var_3.classname, "price" ) )
            level._id_6F7C = var_3;
        else if ( _func_120( var_3.classname, "gaz" ) )
            level._id_3C61 = var_3;
        else if ( _func_120( var_3.classname, "russian" ) )
        {
            level.opening_guy = var_3;
            level.opening_guy._id_0C72 = "opening_guy";
        }

        if ( var_3 ishero() )
            var_3 thread _id_A5A4::_id_58D7( undefined, undefined, 5.0 );

        level.friendlies[level.friendlies.size] = var_3;
        var_3 thread friendly_adjust_movement_speed();
        var_3 thread friendly_bmp_damage_ignore_timer();
    }

    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C _id_A5A4::_id_5926();
    level._id_3C61._id_0C72 = "gaz";
    level._id_3C61 _id_A5A4::_id_5926();
}

friendly_bmp_damage_ignore_timer()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_1.classname ) )
            continue;

        if ( var_1.classname != "script_vehicle" )
            continue;

        self.ignored_by_tank_cannon = 1;
        wait(_func_0B5( 4.0, 6.0 ));
        self.ignored_by_tank_cannon = undefined;
    }
}

friendly_adjust_movement_speed()
{
    self endon( "death" );

    for (;;)
    {
        wait(_func_0B5( 1.0, 3.0 ));

        while ( friendly_should_speed_up() )
        {
            self._id_5F65 = 2.0;
            wait 0.05;
        }

        self._id_5F65 = 1.0;
    }
}

friendly_should_speed_up()
{
    if ( !isdefined( self._id_01C3 ) )
        return 0;

    if ( _func_0F0( self._id_02E2, self._id_01C3 ) <= level.goodfriendlydistancefromplayersquared )
        return 0;

    if ( common_scripts\utility::_id_A347( level._id_0318._id_02E2, level._id_0318 _meth_8338(), self._id_02E2, level._id_2235["60"] ) )
        return 0;

    return 1;
}

ishero()
{
    if ( !isdefined( self ) )
        return 0;

    if ( !isdefined( self._id_0398 ) )
        return 0;

    if ( self._id_0398 == "hero" )
        return 1;

    return 0;
}

friendly_sight_distance( var_0 )
{
    var_1 = var_0 * var_0;

    for ( var_2 = 0; var_2 < level.friendlies.size; var_2++ )
        level.friendlies[var_2]._id_0273 = var_1;
}

friendly_movement_speed( var_0 )
{
    for ( var_1 = 0; var_1 < level.friendlies.size; var_1++ )
        level.friendlies[var_1]._id_5F65 = var_0;
}

friendly_stance( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level.friendlies.size; var_3++ )
    {
        if ( isdefined( var_2 ) )
        {
            level.friendlies[var_3] _meth_81CE( var_0, var_1, var_2 );
            continue;
        }

        if ( isdefined( var_1 ) )
        {
            level.friendlies[var_3] _meth_81CE( var_0, var_1 );
            continue;
        }

        level.friendlies[var_3] _meth_81CE( var_0 );
    }
}

distracted_guys_spawn()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = spawnstruct();
    var_2 = getentarray( var_0._id_04A4, "targetname" );
    var_1.alert_triggers = [];
    var_1._id_89CD = [];

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( _func_120( var_2[var_3].classname, "trigger" ) )
        {
            var_1.alert_triggers[var_1.alert_triggers.size] = var_2[var_3];
            continue;
        }

        if ( _func_1A2( var_2[var_3] ) )
            var_1._id_89CD[var_1._id_89CD.size] = var_2[var_3];
    }

    var_1._id_6139 = [];

    for ( var_3 = 0; var_3 < var_1._id_89CD.size; var_3++ )
    {
        var_4 = _func_0C3( var_1._id_89CD[var_3]._id_04A4, "targetname" );
        var_1._id_6139[var_1._id_6139.size] = var_4;
    }

    self waittill( "trigger" );
    var_1._id_44CE = [];

    for ( var_3 = 0; var_3 < var_1._id_89CD.size; var_3++ )
    {
        var_5 = var_1._id_89CD[var_3] _meth_8096();

        if ( _id_A5A4::_id_88F1( var_5 ) )
            return;

        var_1._id_44CE[var_1._id_44CE.size] = var_5;
    }

    thread distractedguys_animate( var_1 );
}

distractedguys_animate( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.alert_triggers.size; var_1++ )
        var_0.alert_triggers[var_1] thread distractedguys_alert_trigger( var_0 );

    for ( var_1 = 0; var_1 < var_0._id_44CE.size; var_1++ )
    {
        var_0._id_44CE[var_1].distracted = 1;
        var_0._id_44CE[var_1] thread alert_event_notify( var_0 );
        var_0._id_44CE[var_1]._id_0C72 = var_0._id_44CE[var_1]._id_793C;
        var_0._id_6139[var_1] thread _id_A510::_id_0BE1( var_0._id_44CE[var_1], "idle", undefined, "stop_idle" );
        var_0._id_44CE[var_1].allowdeath = 1;

        if ( isdefined( level._id_78AC[var_0._id_44CE[var_1]._id_0C72]["death"] ) )
            var_0._id_44CE[var_1]._id_2652 = level._id_78AC[var_0._id_44CE[var_1]._id_0C72]["death"];
    }

    thread distractedguys_alert( var_0 );
}

distractedguys_alert_trigger( var_0 )
{
    self waittill( self._id_0398 );
    var_0 notify( "alerted" );
}

distractedguys_alert( var_0 )
{
    switch ( var_0._id_44CE.size )
    {
        case 1:
            level common_scripts\utility::_id_A06A( var_0, "alerted", var_0._id_44CE[0], "alerted", var_0._id_44CE[0], "death", var_0._id_44CE[0], "damage" );
            break;
        case 2:
            level common_scripts\utility::_id_A06A( var_0, "alerted", var_0._id_44CE[0], "alerted", var_0._id_44CE[0], "death", var_0._id_44CE[0], "damage", var_0._id_44CE[1], "alerted", var_0._id_44CE[1], "death", var_0._id_44CE[1], "damage" );
            break;
    }

    var_0 notify( "alerted" );
    wait(_func_0B5( 0, 1.3 ));

    for ( var_1 = 0; var_1 < var_0._id_44CE.size; var_1++ )
    {
        if ( !_func_1A1( var_0._id_44CE[var_1] ) )
            continue;

        var_0._id_44CE[var_1].distracted = undefined;
        var_0._id_44CE[var_1] notify( "alerted" );
        var_0._id_44CE[var_1] notify( "stop_idle" );
        var_0._id_44CE[var_1]._id_2652 = undefined;

        if ( isdefined( level._id_78AC[var_0._id_44CE[var_1]._id_0C72]["react"] ) )
        {
            var_0._id_6139[var_1] thread _id_A510::_id_0C24( var_0._id_44CE[var_1], "react" );
            continue;
        }

        var_0._id_44CE[var_1] _meth_8143();
    }
}

assasination()
{
    var_0 = getentarray( self._id_04A4, "targetname" );
    var_1 = undefined;
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3].classname == "script_origin" )
            var_1 = var_0[var_3];

        if ( _func_120( var_0[var_3].classname, "trigger" ) )
            var_2 = var_0[var_3];
    }

    var_4 = spawnstruct();

    if ( isdefined( var_2 ) )
        var_4.assasinate_trigger = var_2;

    var_0 = getentarray( var_1._id_04A4, "targetname" );
    var_4.assasination_triggers = [];
    var_4._id_89CD = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( _func_120( var_0[var_3].classname, "trigger" ) )
        {
            var_4.assasination_triggers[var_4.assasination_triggers.size] = var_0[var_3];
            continue;
        }

        if ( _func_1A2( var_0[var_3] ) )
            var_4._id_89CD[var_4._id_89CD.size] = var_0[var_3];
    }

    for ( var_3 = 0; var_3 < var_4._id_89CD.size; var_3++ )
    {
        var_5 = _func_0C3( var_4._id_89CD[var_3]._id_04A4, "targetname" );
        var_4._id_89CD[var_3]._id_0C73 = var_5;
    }

    self waittill( "trigger" );
    var_4._id_44CE = [];

    for ( var_3 = 0; var_3 < var_4._id_89CD.size; var_3++ )
    {
        var_6 = var_4._id_89CD[var_3] _meth_8096();

        if ( _id_A5A4::_id_88F1( var_6 ) )
            return;

        var_6._id_0C73 = var_4._id_89CD[var_3]._id_0C73;
        var_4._id_44CE[var_4._id_44CE.size] = var_6;
    }

    var_4.executioners = [];
    var_7 = var_4._id_44CE;

    for ( var_3 = 0; var_3 < var_7.size; var_3++ )
    {
        if ( var_7[var_3]._id_04A7 != "axis" )
            continue;

        var_4.executioners[var_4.executioners.size] = var_7[var_3];
        var_4._id_44CE = common_scripts\utility::_id_0CF6( var_4._id_44CE, var_7[var_3] );
    }

    thread assasination_think( var_4 );
}

assasination_think( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.executioners.size; var_1++ )
        var_0.executioners[var_1] endon( "death" );

    for ( var_1 = 0; var_1 < var_0._id_44CE.size; var_1++ )
        thread assasination_assasinated_idle( var_0, var_1 );

    for ( var_1 = 0; var_1 < var_0.executioners.size; var_1++ )
        thread assasination_executioner_idle( var_0, var_1 );

    thread assasination_alert( var_0 );
    var_0 common_scripts\utility::_id_A069( "alerted", "assasinate" );
    createthreatbiasgroup( "executioner" );
    createthreatbiasgroup( "assasinated" );
    setthreatbias( "assasinated", "executioner", 100000 );

    for ( var_1 = 0; var_1 < var_0.executioners.size; var_1++ )
    {
        var_0.executioners[var_1] _meth_817B( "executioner" );
        var_0.executioners[var_1] notify( "stop_idle" );
        var_0.executioners[var_1] _meth_8143();
        var_0.executioners[var_1]._id_01C4 = 16;
        var_0.executioners[var_1] _meth_81A9( var_0.executioners[var_1]._id_0C73 );
        var_0.executioners[var_1]._id_6398 = var_0.executioners[var_1]._id_1300;
        var_0.executioners[var_1]._id_1300 = 1000;
    }

    for ( var_1 = 0; var_1 < var_0._id_44CE.size; var_1++ )
    {
        var_0._id_44CE[var_1] _meth_817B( "assasinated" );
        var_0._id_44CE[var_1]._id_2652 = level._id_78AC["assasinated"]["knees_fall"];
        var_0._id_44CE[var_1] thread assasination_ragdoll_death();
        var_0._id_44CE[var_1].allowdeath = 1;
    }

    switch ( var_0._id_44CE.size )
    {
        case 1:
            var_0._id_44CE[0] waittill( "death" );
            break;
        case 2:
            common_scripts\utility::_id_A09B( var_0._id_44CE[0], "death", var_0._id_44CE[1], "death" );
            break;
        case 3:
            common_scripts\utility::_id_A09B( var_0._id_44CE[0], "death", var_0._id_44CE[1], "death", var_0._id_44CE[2], "death" );
            break;
        case 4:
            common_scripts\utility::_id_A09B( var_0._id_44CE[0], "death", var_0._id_44CE[1], "death", var_0._id_44CE[2], "death", var_0._id_44CE[3], "death" );
            break;
    }

    for ( var_1 = 0; var_1 < var_0.executioners.size; var_1++ )
    {
        var_0.executioners[var_1]._id_1300 = var_0.executioners[var_1]._id_6398;
        var_0.executioners[var_1]._id_6398 = undefined;
    }
}

assasination_alert( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.assasination_triggers.size; var_1++ )
        var_0.assasination_triggers[var_1] thread assasination_kill_trigger( var_0 );

    for ( var_1 = 0; var_1 < var_0.executioners.size; var_1++ )
    {
        var_0.executioners[var_1] thread alert_event_notify( var_0 );
        thread assasination_alert_thread( var_0.executioners[var_1], var_0 );
    }
}

assasination_alert_thread( var_0, var_1 )
{
    level common_scripts\utility::_id_A06A( var_1, "alerted", var_0, "alerted", var_0, "death", var_0, "damage" );
    var_1 notify( "assasinate" );
}

assasination_ragdoll_death()
{
    self waittill( "death" );
    wait 0.5;

    if ( isdefined( self ) )
        self _meth_8023();
}

assasination_assasinated_idle( var_0, var_1 )
{
    var_0._id_44CE[var_1] thread _id_A5A4::_id_4462();
    var_0._id_44CE[var_1]._id_0C72 = "assasinated";

    if ( _func_0B2( 3 ) == 0 )
    {
        if ( _func_0B2( 3 ) == 0 )
            var_0._id_44CE[var_1]._id_0C73 _id_A510::_id_0C24( var_0._id_44CE[var_1], "stand_idle2" );

        var_0._id_44CE[var_1]._id_0C73 _id_A510::_id_0C24( var_0._id_44CE[var_1], "stand_fall" );
    }

    var_0._id_44CE[var_1]._id_0C73 thread _id_A510::_id_0BE1( var_0._id_44CE[var_1], "knees_idle", undefined, "stop_idle" );
}

assasination_executioner_idle( var_0, var_1 )
{
    var_0.executioners[var_1].allowdeath = 1;
    var_0.executioners[var_1]._id_0C72 = "executioner";
    var_0.executioners[var_1]._id_0C73 thread _id_A510::_id_0BE1( var_0.executioners[var_1], "idle", undefined, "stop_idle" );
}

assasination_kill_trigger( var_0 )
{
    self waittill( self._id_0398 );
    var_0 notify( "assasinate" );
}

alert_event_notify( var_0 )
{
    var_0 endon( "alerted" );
    self endon( "death" );
    thread add_event_listener( "grenade danger" );
    thread add_event_listener( "gunshot" );
    thread add_event_listener( "silenced_shot" );
    thread add_event_listener( "bulletwhizby" );
    thread add_event_listener( "projectile_impact" );
    self waittill( "event_notify" );
    var_0 notify( "alerted" );
}

add_event_listener( var_0 )
{
    self endon( "death" );
    self endon( "event_notify" );
    self _meth_8043( var_0 );

    for (;;)
    {
        self waittill( "ai_event", var_1 );

        if ( var_1 == var_0 )
        {
            self _meth_8044( var_0 );
            self notify( "event_notify" );
            return;
        }
    }
}

seek_player()
{
    self endon( "death" );

    if ( isdefined( self.distracted ) && self.distracted == 1 )
        self waittill( "alerted" );

    self._id_01C4 = 600;
    self _meth_81AB( level._id_0318 );
}

enemy_color_hint_trigger_think()
{
    for (;;)
    {
        self waittill( "trigger" );
        getent( self._id_04A4, "targetname" ) notify( "trigger" );
        level.seekersusingcolors = 1;

        while ( level._id_0318 _meth_80AB( self ) )
            wait 0.1;

        level.seekersusingcolors = 0;
        level notify( "seekers_chase_player" );
    }
}

seek_player_smart()
{
    self endon( "death" );

    if ( isdefined( self.distracted ) && self.distracted == 1 )
        self waittill( "alerted" );

    _id_A5A4::_id_7E38( "r" );

    for (;;)
    {
        if ( !level.seekersusingcolors )
        {
            self._id_01C4 = 2000;
            self._id_02F6 = 1500;
            self _meth_8170( 1300, 1000 );
            self _meth_81AB( level._id_0318 );
        }

        level waittill( "seekers_chase_player" );
    }
}

seek_player_dog()
{
    self._id_01C4 = 1000;
    self _meth_81AB( level._id_0318 );
}

indoor_enemy()
{

}

waittill_ai_in_volume_dead( var_0 )
{
    var_1 = getent( var_0, "targetname" );
    var_2 = _func_0D9( "axis" );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( !var_2[var_4] _meth_80AB( var_1 ) )
            continue;

        var_3[var_3.size] = var_2[var_4];
    }

    if ( var_3.size > 0 )
        _id_A5A4::_id_A07E( var_3 );
}

add_objective_building( var_0 )
{
    if ( !isdefined( level._id_054A ) )
        return;

    if ( !isdefined( level._id_054A[var_0] ) )
        return;

    if ( !isdefined( level.buildings_remaining ) )
        level.buildings_remaining = 0;

    level.buildings_remaining++;

    if ( !isdefined( level.suggested_objective_order ) )
        level.suggested_objective_order = [];

    var_1 = getentarray( "objective_location", "targetname" );
    var_2 = undefined;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_1[var_3]._id_792E != var_0 )
            continue;

        var_2 = var_1[var_3]._id_02E2;
        break;
    }

    var_4 = level.suggested_objective_order.size;
    level.suggested_objective_order[var_4] = spawnstruct();
    level.suggested_objective_order[var_4].aigroupnum = var_0;
    level.suggested_objective_order[var_4].completed = 0;
    level.suggested_objective_order[var_4].additionalpositionindex = level.buildings_remaining;
    level.suggested_objective_order[var_4]._id_57F4 = var_2;
    _id_A5A4::_id_A066( var_0 );
    wait(_func_0B5( 1.5, 3.0 ));
    _id_A5A4::arcademode_checkpoint( 4, "building_" + var_0 );

    if ( isdefined( level.alasad_objective_location ) && var_0 == level.alasad_objective_location )
        return;

    level.buildings_remaining--;
    level.suggested_objective_order[var_4].completed = 1;
    thread objective_updatenextwaypoints();

    if ( !common_scripts\utility::_id_382E( "alasad_sequence_started" ) )
    {
        if ( level.buildingclearnextaudio == 0 )
        {
            level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "nosign" );
            _id_A5E8::_id_870C( "increase_ambient" );
        }
        else if ( level.buildingclearnextaudio == 1 )
            level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "nextone" );
        else if ( level.buildingclearnextaudio == 2 )
            level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "checkother" );
        else if ( level.buildingclearnextaudio == 3 )
        {
            level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "checknext" );
            _id_A5E8::_id_870C( "settle_ambient" );
        }
        else if ( level.buildingclearnextaudio == 4 )
            level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "nosign" );

        level.buildingclearnextaudio++;
    }

    thread doautosave( "building_" + var_0 + "_cleared" );
    level.alasad_possible_objective_locations_remaining = common_scripts\utility::_id_0CF6( level.alasad_possible_objective_locations_remaining, var_0 );

    if ( level.alasad_possible_objective_locations_remaining.size > 1 )
        return;

    if ( isdefined( level.alasad_sequence_init ) )
        return;

    if ( level.alasad_possible_objective_locations_remaining[0] == "2" )
        thread do_alasad( "house" );
    else if ( level.alasad_possible_objective_locations_remaining[0] == "6" )
        thread do_alasad( "barn" );
}

objective_updatenextwaypoints()
{
    var_0 = 2;
    var_1 = 0;

    for ( var_2 = 0; var_2 < level.suggested_objective_order.size; var_2++ )
        _func_112( 0, var_2, ( 0, 0, 0 ) );

    for ( var_3 = 0; var_3 < level.suggested_objective_order.size; var_3++ )
    {
        if ( level.suggested_objective_order[var_3].completed )
            continue;

        var_4 = level.suggested_objective_order[var_3].additionalpositionindex;
        var_5 = level.suggested_objective_order[var_3]._id_57F4;
        _func_112( 0, var_1 + 1, var_5 );
        var_1++;

        if ( var_1 == var_0 )
            return;
    }
}

chopper_air_support_arcade_mode()
{
    self waittill( "death", var_0, var_1 );

    if ( isdefined( var_0 ) && isdefined( level._id_1D48 ) && var_0 == level._id_1D48 )
        _id_A5A4::arcademode_kill( self._id_02E2, var_1, 30 );
}

chopper_air_support()
{
    var_0 = 0;
    level._id_560A = undefined;
    level.fake_chopper_ammo = 1;
    common_scripts\utility::_id_383D( "ammo_cheat_for_chopper" );
    _id_A5A4::_id_0761( "axis", ::chopper_air_support_arcade_mode );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::chopper_air_support_arcade_mode );

    for (;;)
    {
        while ( level._id_0318 _meth_830E() != "cobra_air_support" )
        {
            level._id_560A = level._id_0318 _meth_830E();
            wait 0.05;
        }

        if ( getdvar( "player_sustainAmmo" ) == "0" && !common_scripts\utility::_id_382E( "ammo_cheat_for_chopper" ) )
            var_1 = level._id_0318 _meth_8183( "cobra_air_support" );
        else
        {
            common_scripts\utility::_id_383F( "ammo_cheat_for_chopper" );
            var_1 = level.fake_chopper_ammo;
        }

        if ( !isdefined( var_1 ) || var_1 <= 0 )
        {
            chopper_air_support_givebackweapon();

            if ( common_scripts\utility::_id_382E( "air_support_refueling" ) )
            {
                if ( var_0 == 0 )
                {
                    thread _id_A5A4::_id_70C8( "refueling" );
                    var_0 = 1;
                }
                else
                {
                    thread _id_A5A4::_id_70C8( "rearming" );
                    var_0 = 0;
                }
            }

            while ( level._id_0318 _meth_830E() == "cobra_air_support" )
                wait 0.05;

            continue;
        }

        thread _id_1D53();

        while ( level._id_0318 _meth_830E() == "cobra_air_support" )
            wait 0.05;

        level notify( "air_support_canceled" );
        thread chopper_air_support_deactive();
    }
}

chopper_air_support_removefunctionality()
{
    level._id_0318 _meth_830C( "cobra_air_support" );
    level notify( "air_support_canceled" );
    level notify( "air_support_deleted" );
    thread chopper_air_support_deactive();

    if ( isdefined( level._id_1D48 ) )
    {
        level._id_1D48._id_2825 = 1;
        level._id_1D48 notify( "death" );
    }

    if ( isdefined( level.airsupportmarker ) )
        level.airsupportmarker delete();
}

_id_1D53()
{
    level endon( "air_support_canceled" );
    level endon( "air_support_called" );
    level notify( "air_support_activated" );
    thread chopper_air_support_paint_target();
    thread air_support_hint_print_call();
    level._id_1D5D = maps\air_support_shared::air_support_create_arrow_ent();
    level._id_6C5C = 1;
    maps\air_support_shared::air_support_update_arrow_coords( level._id_1D5D, "village_assault_debug_marker" );
}

chopper_air_support_deactive()
{
    level endon( "air_support_activated" );
    thread delete_attack_coord_hint();
    wait 0.05;

    if ( isdefined( level._id_1D5D ) )
        level._id_1D5D delete();
}

chopper_air_support_givebackweapon()
{
    if ( isdefined( level._id_560A ) && level._id_0318 _meth_8311( level._id_560A ) )
        level._id_0318 _meth_8312( level._id_560A );
    else
    {
        var_0 = level._id_0318 _meth_8309();

        if ( isdefined( var_0[0] ) )
            level._id_0318 _meth_8312( var_0[0] );
    }
}

chopper_air_support_paint_target()
{
    level endon( "air_support_canceled" );
    level._id_0318 waittill( "weapon_fired" );
    level.fake_chopper_ammo = 0;
    level.playercalledairsupport = 1;
    thread chopper_air_support_mark();
    chopper_air_support_givebackweapon();
    thread chopper_air_support_call_chopper( level._id_1D5D._id_02E2 );
    level notify( "air_support_called" );
    chopper_air_support_deactive();

    if ( level.choppersupportcallnextaudio == 0 )
        thread _id_A5A4::_id_70C4( "ontheway" );
    else if ( level.choppersupportcallnextaudio == 1 )
        thread _id_A5A4::_id_70C4( "helicopteronway" );
    else if ( level.choppersupportcallnextaudio == 2 )
        thread _id_A5A4::_id_70C4( "wehavetarget" );

    level.choppersupportcallnextaudio++;

    if ( level.choppersupportcallnextaudio > 2 )
        level.choppersupportcallnextaudio = 0;
}

chopper_dialog()
{

}

chopper_air_support_mark()
{
    var_0 = level._id_1D5D._id_02E2;
    var_1 = level._id_1D5D.angles;
    wait 0.1;
    level.airsupportmarker = maps\air_support_shared::air_support_create_selection_ent( var_0, var_1 );
    level waittill( "airsupport_inbound" );
    level.airsupportmarker delete();
}

chopper_air_support_friendlyfire()
{
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( !_func_1AD( var_2 ) )
            continue;

        if ( isdefined( var_5 ) && !_func_120( _func_123( var_5 ), "bullet" ) )
            break;

        if ( isdefined( var_1 ) && var_1 > 0 )
            var_0 += var_1;

        if ( var_0 >= 500 )
            break;
    }

    thread _id_A536::_id_5CDD();
}

chopper_air_support_call_chopper( var_0 )
{
    var_1 = findbestchopperwaypoint( var_0, 45 );

    if ( var_1 <= -1 )
    {
        wait 0.05;
        var_1 = findbestchopperwaypoint( var_0, 70 );

        if ( var_1 <= -1 )
        {
            wait 0.05;
            var_1 = findbestchopperwaypoint( var_0, 70, 1 );
        }
    }

    if ( getdvar( "debug_chopper_air_support" ) == "1" )
    {

    }

    level._id_1D48 = _id_A5A8::_id_8978( "chopper" );
    level._id_1D48 endon( "death" );
    var_2 = getent( "chopper_pilot", "targetname" );
    var_3 = getent( "chopper_gunner", "targetname" );
    level._id_1D48._id_6820 = var_2 _id_A5A4::_id_88C3();
    level._id_1D48._id_4473 = var_3 _id_A5A4::_id_88C3();
    level._id_1D48 thread chopper_air_support_friendlyfire();
    var_4 = level._id_1D48._id_02E2;
    var_5 = spawn( "script_origin", var_0 );
    level._id_1D48 _meth_8261( var_5 );
    level._id_1D48 _meth_827F( 65, 10, 20 );
    level._id_1D48 _meth_824F( 250, 60, 35 );
    var_6 = _func_115( var_0 - level.choppersupporthoverlocations[var_1] );
    level._id_1D48 _meth_8258( var_6[1] );
    level._id_1D48 _meth_8257( level.choppersupporthoverlocations[var_1], 1 );
    level._id_1D48 _meth_8256( 4000 );
    level._id_1D48 waittill( "near_goal" );
    level notify( "airsupport_inbound" );
    _id_A5E8::_id_870C( "start_air_support_mix" );
    level._id_1D48 thread chopper_ai_mode( var_5 );
    level._id_1D48 _meth_825A( var_6[1] );
    level._id_1D48 waittill( "goal" );
    var_7 = getentarray( "helicopter_force_kill_spawn", "targetname" );

    for ( var_8 = 0; var_8 < var_7.size; var_8++ )
    {
        if ( var_5 _meth_80AB( var_7[var_8] ) )
        {
            var_9 = getentarray( var_7[var_8]._id_04A4, "targetname" );

            for ( var_10 = 0; var_10 < var_9.size; var_10++ )
                var_9[var_10] notify( "trigger" );
        }
    }

    level._id_1D48 thread chopper_ai_mode_missiles( var_5 );
    badplace_cylinder( "air_support_AOE", 30.0, var_5._id_02E2, 1050, 10000, "allies" );
    thread chopper_air_support_end( var_4 );
}

player_activated_air_support()
{
    return isdefined( level._id_6C5C );
}

player_called_air_support()
{
    return isdefined( level.playercalledairsupport );
}

delete_hint_print_activated_air_support()
{
    if ( isdefined( level.air_support_hint_delete ) )
    {
        level.air_support_hint_delete = undefined;
        return 1;
    }

    return isdefined( level._id_6C5C );
}

delete_attack_coord_hint()
{
    common_scripts\utility::_id_383F( "delete_attack_coord_hint" );
    level waittill( "checked_should_delete_hint" );
    common_scripts\utility::_id_3831( "delete_attack_coord_hint" );
}

should_delete_attack_coord_hint()
{
    var_0 = common_scripts\utility::_id_382E( "delete_attack_coord_hint" );
    level notify( "checked_should_delete_hint" );
    return var_0;
}

findbestchopperwaypoint( var_0, var_1, var_2 )
{
    if ( getdvar( "debug_chopper_air_support" ) == "1" )
        iprintln( "chopper deciding which location to fly to" );

    var_3 = level._id_0318._id_02E2;
    var_4 = level._id_0318 _meth_8338();
    var_5 = var_4 + ( 0, 180, 0 );
    var_6 = _func_0B7( var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_7 = -1;
    var_8 = 1000000000;
    var_9 = 202500;

    for ( var_10 = 0; var_10 < level.choppersupporthoverlocations.size; var_10++ )
    {
        var_11 = level.choppersupporthoverlocations[var_10];

        if ( !var_2 )
        {
            if ( !common_scripts\utility::_id_A347( common_scripts\utility::_id_38C9( var_0 ), common_scripts\utility::_id_38C8( var_5 ), common_scripts\utility::_id_38C9( var_11 ), var_6 ) )
                continue;
        }

        var_12 = _func_0ED( var_0, var_3, var_11 );
        var_13 = _func_0F0( var_12, var_11 );

        if ( !var_2 )
        {
            if ( var_13 < var_9 )
                continue;
        }

        if ( var_13 < var_8 )
        {
            var_7 = var_10;
            var_8 = var_13;
        }

        if ( getdvar( "debug_chopper_air_support" ) == "1" )
        {

        }
    }

    return var_7;
}

chopper_air_support_end( var_0 )
{
    level endon( "air_support_deleted" );
    common_scripts\utility::_id_3831( "air_support_refueling" );
    wait 30;
    common_scripts\utility::_id_383F( "air_support_refueling" );
    thread _id_A5A4::_id_70C4( "refuelandrearm" );
    _id_A5E8::_id_870C( "stop_air_support_mix" );
    level notify( "air_support_over" );
    var_1 = _func_115( var_0 - level._id_1D48._id_02E2 );

    if ( !isdefined( level._id_1D48 ) )
        return;

    level._id_1D48 _meth_8262();
    level._id_1D48 _meth_825A( var_1[1] );
    level._id_1D48 _meth_8257( var_0 );
    level._id_1D48 waittill( "goal" );
    level._id_1D48._id_6820 delete();
    level._id_1D48._id_4473 delete();
    level._id_1D48 delete();
    level._id_1D48 = undefined;
    wait 20;
    common_scripts\utility::_id_3831( "air_support_refueling" );
    thread _id_A5A4::_id_70C4( "readytoattack" );
    level._id_0318 _meth_832E( "cobra_air_support" );
    level.fake_chopper_ammo = 1;
}

chopper_ai_mode( var_0 )
{
    thread chopper_ai_mode_aim_turret( var_0 );
    thread chopper_ai_mode_shoot_turret();
    thread chopper_ai_mode_flares();
}

chopper_ai_mode_aim_turret( var_0 )
{
    self endon( "death" );
    level endon( "air_support_over" );
    var_1 = var_0;

    for (;;)
    {
        var_0 = _id_A53F::_id_3F7F( 6000, level._id_2235["45"], 1, 1, 1, 1 );

        if ( !isdefined( var_0 ) )
            var_0 = var_1;

        var_2 = ( 0, 0, 0 );

        if ( isdefined( var_0._id_7AED ) )
            var_2 += ( 0, 0, var_0._id_7AED );
        else if ( _func_0D1( var_0 ) )
            var_2 = ( 0, 0, 32 );

        self _meth_825E( var_0, var_2 );
        wait(_func_0B5( 0.2, 1.0 ));
    }
}

chopper_ai_mode_shoot_turret()
{
    self endon( "death" );
    level endon( "air_support_over" );

    for (;;)
    {
        var_0 = _func_0B4( 30, 60 );
        self _meth_8263( "hind_turret" );

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            self _meth_8264( "tag_flash" );
            wait 0.05;
        }

        wait(_func_0B5( 1.0, 1.75 ));
    }
}

chopper_ai_mode_flares()
{
    self endon( "death" );
    level endon( "air_support_over" );

    for (;;)
    {
        var_0 = _func_0B4( 2, 8 );
        thread _id_A53F::_id_3897( self, var_0, 1, 5.0 );
        wait(_func_0B5( 4.0, 8.0 ));
    }
}

chopper_ai_mode_missiles( var_0 )
{
    var_1 = var_0;
    self endon( "death" );
    level endon( "air_support_over" );

    for (;;)
    {
        var_2 = _func_0B4( 1, 5 );
        var_0 = _id_A53F::_id_3F7F( 6000, level._id_2235["25"], 1, 1, 1, 1 );

        if ( isdefined( var_0 ) && isdefined( var_0._id_02E2 ) )
            _id_A53F::_id_37BA( "ffar_mi28_village_assault", var_2, var_0 );
        else
            _id_A53F::_id_37BA( "ffar_mi28_village_assault", var_2, var_1 );

        wait(_func_0B5( 3.5, 6.0 ));
    }
}

getclosestinfov( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_0B7( var_2 );
    var_5 = undefined;
    var_6 = undefined;
    var_7 = 1000000000;

    for ( var_8 = 0; var_8 < var_1.size; var_8++ )
    {
        var_9 = _func_0F0( var_0, var_1[var_8]._id_02E2 );

        if ( var_9 < var_3 )
            continue;

        if ( var_9 < var_7 )
        {
            var_6 = var_5;
            var_5 = var_1[var_8];
            var_7 = var_9;
        }
    }

    var_10 = [];
    var_10[0] = var_5;
    var_10[1] = var_6;
    return var_10;
}

vehicle_c4_think()
{
    var_0 = self _meth_81B5();
    var_1 = ( 0, -33, 10 );
    var_2 = ( 0, 90, -90 );
    var_3 = ( 129, 0, 35 );
    var_4 = ( 0, 90, 144 );
    level.vehicle_c4_models = [];
    level.vehicle_c4_models[0] = maps\_c4::c4_location( "rear_hatch_open_jnt_left", var_1, var_2 );
    level.vehicle_c4_models[1] = maps\_c4::c4_location( "tag_origin", var_3, var_4 );
    self.rearc4location = spawn( "script_origin", self._id_02E2 );
    self.frontc4location = spawn( "script_origin", self._id_02E2 );
    self.rearc4location _meth_804F( self, "rear_hatch_open_jnt_left", var_1, var_2 );
    self.frontc4location _meth_804F( self, "tag_origin", var_3, var_4 );
    self waittill( "c4_detonation" );
    self.frontc4location delete();
    self.rearc4location delete();
    thread _id_9CA1( var_0 );
}

_id_9CA1( var_0 )
{
    self notify( "clear_c4" );
    _func_18A( 1 );
    _func_18C( 0.6, 2, self._id_02E2, 2000 );
    self notify( "death" );
    thread common_scripts\utility::_id_69C2( "exp_armor_vehicle", self _meth_8184( "tag_turret" ) );
    var_1 = _id_3CB9( 1024, self._id_02E2, "axis" );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        common_scripts\utility::_id_0D13( var_1, ::_id_0926, 0.85 );

    _func_189( self._id_02E2, 256, 200, 100 );

    if ( _func_0F0( self._id_02E2, level._id_0318._id_02E2 ) <= 65536 )
        level._id_0318 _meth_8053( level._id_0318._id_01E6 / 3, ( 0, 0, 0 ) );
}

_id_0926( var_0 )
{
    self endon( "death" );

    if ( isdefined( self ) && _func_1A1( self ) && _id_A5A4::_id_38A9() )
        _id_A5A4::_id_38AB( var_0 );
}

_id_3CB9( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = _func_0D9( var_2 );
    else
        var_3 = _func_0D9();

    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        if ( _func_0EE( var_1, self._id_02E2 ) <= var_0 )
            common_scripts\utility::_id_0CDA( var_4, var_3[var_5] );
    }

    return var_4;
}

roaming_bmp()
{
    var_0 = _id_A5A8::waittill_vehiclespawn( "roaming_bmp" );
    _func_09D( var_0, ( 0, 0, 32 ) );
    _func_0A8( var_0, 1 );
    var_0 thread vehicle_patrol_think();
    var_0 thread vehicle_turret_think();
    var_0 thread vehicle_c4_think();
    var_0 thread _id_A5AA::_id_2581();
    var_0 thread bmp_autosave_on_death();
    var_0 thread vehicle_death_think();
}

_id_3F4C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    var_0 = _func_123( var_0 );

    switch ( var_0 )
    {
        case "mod_explosive":
        case "mod_explosive_splash":
            return "c4";
        case "mod_projectile":
        case "mod_projectile_splash":
            return "rocket";
        case "mod_grenade":
        case "mod_grenade_splash":
            return "grenade";
        case "unknown":
            return "unknown";
        default:
            return "unknown";
    }
}

vehicle_death_think()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( !_func_1AD( var_1 ) )
            continue;

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 <= 0 )
            continue;

        var_4 = _id_3F4C( var_4 );

        if ( var_4 == "rocket" && var_0 >= 300 || var_4 == "c4" && var_0 >= 250 )
        {
            if ( isdefined( level.vehicle_c4_models[0] ) )
                level.vehicle_c4_models[0] delete();

            if ( isdefined( level.vehicle_c4_models[1] ) )
                level.vehicle_c4_models[1] delete();

            break;
        }
    }

    self notify( "c4_detonation" );
}

vehicle_patrol_init()
{
    level.avehiclenodes = [];
    var_0 = _func_1ED( "go_forward", "script_noteworthy" );
    var_1 = _func_1ED( "go_backward", "script_noteworthy" );
    level.avehiclenodes = _id_A5A4::_id_0CF2( var_0, var_1 );
}

vehicle_patrol_think()
{
    level endon( "alasad_sequence_started" );
    self endon( "death" );
    var_0 = self._id_0DF6;
    self waittill( "reached_end_node" );

    for (;;)
    {
        var_1 = [];
        var_2 = undefined;
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_2 = var_0 _id_A5A4::_id_3DB1( "vehiclenode" );
        var_1 = level.avehiclenodes;
        var_1 = common_scripts\utility::_id_0CF6( var_1, var_2 );
        var_7 = level.avehiclenodes;
        var_8 = var_2._id_7B18;

        for ( var_9 = 0; var_9 < var_7.size; var_9++ )
        {
            if ( var_7[var_9]._id_7B18 != var_8 )
                var_1 = common_scripts\utility::_id_0CF6( var_1, var_7[var_9] );
        }

        for ( var_9 = 0; var_9 < var_1.size; var_9++ )
        {
            if ( isdefined( var_1[var_9]._id_0398 ) && var_1[var_9]._id_0398 == "go_backward" )
            {
                var_3 = var_1[var_9];
                var_3._id_311C = undefined;
                continue;
            }

            if ( isdefined( var_1[var_9]._id_0398 ) && var_1[var_9]._id_0398 == "go_forward" )
            {
                var_4 = var_1[var_9];
                var_4._id_311C = undefined;
            }
        }

        if ( isdefined( var_3 ) )
            var_3._id_311C = var_3 _id_A5A4::_id_3DB1( "vehiclenode" );

        if ( isdefined( var_4 ) )
            var_4._id_311C = var_4 _id_A5A4::_id_3DB1( "vehiclenode" );

        var_6 = getclosestinfov( level._id_0318._id_02E2, level.avehiclenodes, 55, level.bmp_safety_distance );

        if ( isdefined( var_6[1] ) )
        {
            if ( var_6[1]._id_7B18 < var_6[0]._id_7B18 )
            {
                var_10 = var_6[0];
                var_6[0] = var_6[1];
                var_6[1] = var_10;
            }
        }

        if ( var_6[0] == var_2 )
            var_5 = undefined;
        else if ( isdefined( var_4 ) && var_6[0]._id_7B18 >= var_4._id_311C._id_7B18 )
            var_5 = var_4;
        else if ( isdefined( var_3 ) && var_6[0]._id_7B18 <= var_3._id_311C._id_7B18 )
            var_5 = var_3;

        if ( isdefined( var_5 ) )
        {
            self _meth_8279( var_5 );

            if ( isdefined( var_5._id_7B24 ) )
                thread _id_A5AA::_id_A2FF( var_5._id_7B24 );

            var_0 = var_5;
            wait(_func_0B5( 0.2, 1.2 ));
            self _meth_828D( 100 );
            self waittill( "reached_end_node" );
            continue;
        }

        wait(_func_0B5( 3, 6 ));
    }
}

vehicle_turret_think()
{
    level endon( "alasad_sequence_started" );
    self endon( "death" );
    var_0 = undefined;

    for (;;)
    {
        var_0 = _id_A53F::_id_3F7F( 3000, undefined, 1, 1, 0, 1 );

        if ( isdefined( var_0 ) )
        {
            self _meth_825E( var_0, ( 0, 0, 32 ) );
            common_scripts\utility::_id_A0A0( "turret_rotate_stopped", _func_0B5( 2.0, 3.0 ) );
            var_1 = _func_1B0( "bmp_turret" );
            var_2 = _func_0B4( 3, 8 );

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                self _meth_8264();
                wait(var_1);
            }
        }

        wait(_func_0B3( 3.0 ));
    }
}

doautosave( var_0 )
{
    thread _id_A5A4::_id_1143( var_0 );
    thread timedautosaves();
}

bmp_autosave_on_death()
{
    self waittill( "death" );

    if ( isdefined( self ) )
        _func_09E( self );

    thread doautosave( "bmp_destroyed" );
}

timedautosaves()
{
    level endon( "alasad_sequence_started" );
    level notify( "timedAutosaveThread" );
    level endon( "timedAutosaveThread" );

    if ( level.timedautosavetime == 0 )
        return;

    for (;;)
    {
        wait(level.timedautosavetime);
        level.timedautosavenumber++;
        thread doautosave( "timed_autosave" + level.timedautosavenumber );
    }
}

genocide_audio_trigger()
{
    var_0 = getent( self._id_04A4, "targetname" );
    self waittill( "trigger" );

    if ( isdefined( self._id_0392 ) )
        wait(self._id_0392);

    var_0 _meth_809C( level.genocide_audio[level.next_genocide_audio] );
    level.next_genocide_audio++;
}

dead_civilian()
{
    wait(_func_0B5( 0.05, 0.2 ));
    var_0 = _id_A5A4::_id_2F29( self );
    var_0 _meth_80C0( 0 );
    var_0 _meth_8023();
}

air_support_hint_print_activate()
{
    level endon( "alasad_sequence_started" );

    while ( !player_activated_air_support() )
    {
        if ( level.air_support_hint_print_dialog_next == 0 )
            level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "airsupport" );
        else if ( level.air_support_hint_print_dialog_next == 1 )
            level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "softenup" );
        else
            thread _id_A5A4::_id_70C4( "readytoattack" );

        level.air_support_hint_print_dialog_next++;

        if ( !common_scripts\utility::_id_382E( "gave_air_support_hint" ) )
        {
            common_scripts\utility::_id_383F( "gave_air_support_hint" );
            thread display_air_support_hint_pc();
        }

        wait 5;
        level.air_support_hint_delete = 1;
        wait 60;
    }
}

display_air_support_hint_console()
{
    level endon( "clearing_hints" );
    _id_A5A4::_id_48B0( &"SCRIPT_LEARN_CHOPPER_AIR_SUPPORT1" );
    level.iconelem1 = _id_A546::_id_2420( "hud_dpad", 32, 32 );
    level.iconelem1 _id_A546::_id_7FEE( "TOP", undefined, -32, 165 );
    level._id_4B40 = _id_A546::_id_2420( "hud_arrow_right", 24, 24 );
    level._id_4B40 _id_A546::_id_7FEE( "TOP", undefined, -31.5, 170 );
    level._id_4B40._id_03D4 = 1;
    level._id_4B40.color = ( 1, 1, 0 );
    level._id_4B40.alpha = 0.7;
    level._id_4B3F = _id_A546::_id_2420( "hud_icon_cobra", 64, 32 );
    level._id_4B3F _id_A546::_id_7FEE( "TOP", undefined, 16, 165 );
    wait 4;
    level.iconelem1 _id_A546::_id_7FEE( "CENTER", "BOTTOM", -320, -20, 1.0 );
    level._id_4B3F _id_A546::_id_7FEE( "CENTER", "BOTTOM", -320, -20, 1.0 );
    level._id_4B40 _id_A546::_id_7FEE( "CENTER", "BOTTOM", -320, -20, 1.0 );
    level.iconelem1 _meth_8087( 1, 20, 20 );
    level._id_4B3F _meth_8087( 1, 20, 20 );
    level._id_4B40 _meth_8087( 1, 20, 20 );
    wait 0.7;
    level.iconelem1 _meth_8086( 0.15 );
    level.iconelem1.alpha = 0;
    level._id_4B3F _meth_8086( 0.15 );
    level._id_4B3F.alpha = 0;
    level._id_4B40 _meth_8086( 0.15 );
    level._id_4B40.alpha = 0;
    _id_A5A4::_id_48CB( 0.15 );
}

display_air_support_hint_pc()
{
    level endon( "clearing_hints" );
    _id_A5A4::_id_48B0( &"SCRIPT_LEARN_CHOPPER_AIR_SUPPORT1_PC" );
    setomnvar( "ui_display_hud_for_equipment_motion", 1 );
    level._id_4B3F = _id_A546::_id_2420( "hud_icon_cobra", 48, 48 );
    level._id_4B3F _id_A546::_id_7FEE( "TOP", undefined, 0, 140 );
    wait 4;
    level._id_4B3F _id_A546::_id_7FEE( "TOP", undefined, -320, 460, 1.0 );
    level._id_4B3F _meth_8087( 1, 20, 20 );
    wait 0.7;
    level._id_4B3F _meth_8086( 0.15 );
    level._id_4B3F.alpha = 0;
    setomnvar( "ui_display_hud_for_equipment_motion", 0 );
    _id_A5A4::_id_48CB( 0.15 );
}

_id_1EBE()
{
    _id_A5A4::_id_48CB( 0 );
    level notify( "clearing_hints" );

    if ( isdefined( level.iconelem1 ) )
        level.iconelem1 _meth_808A();

    if ( isdefined( level._id_4B3F ) )
        level._id_4B3F _meth_808A();

    if ( isdefined( level._id_4B40 ) )
        level._id_4B40 _meth_808A();
}

air_support_hint_print_call()
{
    if ( player_called_air_support() )
        return;

    level endon( "alasad_sequence_started" );
    thread _id_1EBE();
    level._id_0318 thread _id_A5A4::_id_2B4A( "call_air_support2" );
    wait 5;
    level.air_support_hint_delete = 1;
}

trigger_upstairs_guys()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = _func_0C3( var_0._id_04A4, "targetname" );
    self waittill( "trigger" );
    wait(_func_0B5( 5.0, 10.0 ));
    var_2 = _func_0D9( "axis" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !var_2[var_3] _meth_80AB( var_0 ) )
            continue;

        var_2[var_3]._id_01C4 = var_1._id_0351;
        var_2[var_3] _meth_81A9( var_1 );
    }
}

delete_dropped_weapons()
{
    var_0 = [];
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_ak47" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_beretta" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_g36c" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m14" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m16" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m203" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_rpg" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_saw" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m4" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m40a3" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_mp5" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_mp5sd" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_usp" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_at4" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_dragunov" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_g3" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_uzi" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = getentarray( var_0[var_1], "classname" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( isdefined( var_2[var_3]._id_04A6 ) )
                continue;

            var_2[var_3] delete();
        }
    }
}

alasad_deletable_hide()
{
    if ( isdefined( self._id_03DA ) && self._id_03DA & 1 )
        self _meth_805A();

    self._id_02E2 -= ( 0, 0, 5000 );
}

alasad_deletable_show()
{
    self._id_02E2 += ( 0, 0, 5000 );

    if ( isdefined( self._id_03DA ) && self._id_03DA & 1 )
        self _meth_8059();
}

spawn_ai_and_make_dumb( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );

    if ( isdefined( var_2._id_79AD ) )
        var_3 = _id_A5A4::_id_2F29( var_2 );
    else
    {
        var_3 = var_2 _meth_8096();
        _id_A5A4::_id_88F1( var_3 );
        var_3._id_0273 = 0;
        var_3._id_01FF = 1;
        var_3._id_01FB = 1;
        var_3 thread _id_A5A4::_id_4BB0( 1 );
    }

    var_3._id_01E6 = 100000;

    if ( isdefined( var_1 ) )
    {
        var_4 = spawn( "script_origin", var_2._id_02E2 );
        var_3 _meth_804F( var_4 );
    }

    return var_3;
}

headshot( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !_func_1A1( var_0 ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        playfx( common_scripts\utility::_id_3FA8( "headshot" ), var_0 _meth_8184( "tag_eye" ) );
    else
        playfx( level._id_058F["va_headshot"], var_0 _meth_8184( "j_head" ), anglestoforward( var_0 _meth_8185( "j_head" ) ) );

    if ( var_1 )
        var_0 _meth_8054( var_0 _meth_8184( "tag_eye" ) );
}

do_alasad( var_0 )
{
    level.alasad_sequence_init = 1;
    var_1 = spawnstruct();

    if ( var_0 == "barn" )
    {
        var_1.nodetargetname1 = "alasad_barn_node";
        var_1.nodetargetname2 = "alasad_barn_node2";
        var_1.deletablenoteworthy = "alasad_barn_deletable";
        var_1.brushdoortargetname = "alasad_barn_door";
        var_1.spawnerstodeletekillspawner = 12;
        var_1.friendlycolortriggertargetname1 = "alasad_barn_friendly_color_trigger";
        var_1.friendlycolortriggertargetname2 = "alasad_barn_last_friendly_trigger";
        var_1.alasadspawnertargetname = "alasad_spawner_barn";
        var_1.alasadfirstshotspawnertargetname = "alasad_barn_first_shot_spawner";
        var_1.alasadsecondshotspawnertargetname = "alasad_barn_second_shot_spawner";
        var_1.startsequencetriggertargetname = "alasad_barn_trigger";
        var_1.playerlocationscenebtargetname = "alasad_barn_playerlocation";
        var_1.setupareainteriortriggertargetname = "alasad_barn_area_interior";
        var_1.setupareaexteriortriggertargetname = "alasad_barn_area_exterior";
        var_1.aitodeleteareatargetname = "area_barn";
        var_1.door_offset_origin = ( -3, 0, 0 );
        var_1.door_offset_angle = ( 0, -10, 0 );
        level.alasad_flashbang_location = getent( "alasad_barn_flash_location", "targetname" )._id_02E2;
        level.alasad_objective_location = "6";
    }
    else if ( var_0 == "house" )
    {
        var_1.nodetargetname1 = "alasad_house_node";
        var_1.nodetargetname2 = "alasad_house_node2";
        var_1.deletablenoteworthy = "alasad_house_deletable";
        var_1.brushdoortargetname = "alasad_house_door";
        var_1.spawnerstodeletekillspawner = 2;
        var_1.friendlycolortriggertargetname1 = "alasad_house_friendly_color_trigger";
        var_1.friendlycolortriggertargetname2 = "alasad_house_last_friendly_trigger";
        var_1.alasadspawnertargetname = "alasad_spawner_house";
        var_1.alasadfirstshotspawnertargetname = "alasad_house_first_shot_spawner";
        var_1.alasadsecondshotspawnertargetname = "alasad_house_second_shot_spawner";
        var_1.startsequencetriggertargetname = "alasad_house_trigger";
        var_1.playerlocationscenebtargetname = "alasad_house_playerlocation";
        var_1.setupareainteriortriggertargetname = "alasad_house_area_interior";
        var_1.setupareaexteriortriggertargetname = "alasad_house_area_exterior";
        var_1.aitodeleteareatargetname = "area_grandmas_house";
        var_1.door_offset_origin = ( 0, -2, 2 );
        var_1.door_offset_angle = ( 0, -8, 0 );
        level.alasad_flashbang_location = getent( "alasad_house_flash_location", "targetname" )._id_02E2;
        level.alasad_objective_location = "2";
    }

    alasad_sequence_init( var_1 );
}

alasad_sequence_init( var_0 )
{
    var_0.alasad_area_exterior = getent( var_0.setupareaexteriortriggertargetname, "targetname" );
    var_0.alasad_area_interior = getent( var_0.setupareainteriortriggertargetname, "targetname" );

    while ( level._id_0318 _meth_80AB( var_0.alasad_area_interior ) )
        wait 0.05;

    common_scripts\utility::_id_0D13( getentarray( var_0.deletablenoteworthy, "script_noteworthy" ), ::alasad_deletable_show );
    var_0._id_02BB = _func_0C3( var_0.nodetargetname1, "targetname" );
    var_0._id_2D40 = _id_A5A4::_id_88D1( "door" );
    var_0._id_02BB thread _id_A510::_id_0BC7( var_0._id_2D40, "interrogationA" );
    var_0.brushmodel_door = getent( var_0.brushdoortargetname, "targetname" );
    var_0.brushmodel_door _meth_804F( var_0._id_2D40, "door_hinge_jnt" );
    var_0._id_2D40 _meth_8056();
    var_0.brushmodel_door _meth_8056();
    var_1 = spawn( "script_model", var_0.brushmodel_door._id_02E2 );
    var_1 _meth_80B3( "h1_ch_interior_door_02" );
    var_1 _meth_804F( var_0.brushmodel_door, "", var_0.door_offset_origin, var_0.door_offset_angle );

    if ( isdefined( var_0.spawnerstodeletekillspawner ) )
        thread _id_A581::_id_533A( var_0.spawnerstodeletekillspawner );

    if ( isdefined( var_0.aitodeleteareatargetname ) )
    {
        var_2 = getent( var_0.aitodeleteareatargetname, "targetname" );
        var_3 = _func_0D9( "axis" );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( !var_3[var_4] _meth_80AB( var_2 ) )
                continue;

            var_3[var_4]._id_011F = 1;
            var_3[var_4] _meth_8054();
        }
    }

    alasad_sequence_wait( var_0 );
}

alasad_sequence_wait( var_0 )
{
    level endon( "alasad_sequence_started" );
    common_scripts\utility::_id_383D( "price_ready_for_interrogation" );
    var_0.color_trigger = getent( var_0.friendlycolortriggertargetname1, "targetname" );

    for (;;)
    {
        if ( level._id_0318 _meth_80AB( var_0.alasad_area_interior ) )
        {
            common_scripts\utility::_id_0D13( _func_0D9( "allies" ), _id_A5A4::_id_7E38, "o" );
            var_0.color_trigger notify( "trigger" );
            thread alasad_sequence_ready( var_0 );

            while ( level._id_0318 _meth_80AB( var_0.alasad_area_exterior ) )
                wait 0.05;

            continue;
        }

        level notify( "alasad_sequence_canceled" );
        common_scripts\utility::_id_3831( "price_ready_for_interrogation" );
        var_0._id_02BB notify( "stop_loop" );
        common_scripts\utility::_id_0D13( _func_0D9( "allies" ), _id_A5A4::_id_7E38, "r" );

        while ( !level._id_0318 _meth_80AB( var_0.alasad_area_interior ) )
            wait 0.05;
    }
}

alasad_sequence_ready( var_0 )
{
    level endon( "alasad_sequence_canceled" );
    var_0._id_02BB thread h1_do_price_reach_interrogation();
    getent( var_0.startsequencetriggertargetname, "targetname" ) waittill( "trigger" );
    common_scripts\utility::_id_384A( "price_ready_for_interrogation" );
    alasad_sequence_start( var_0 );
}

h1_do_price_reach_interrogation()
{
    level endon( "alasad_sequence_canceled" );
    _id_A510::_id_0BFF( level._id_6F7C, "interrogationA_run_in" );
    _id_A510::_id_0C24( level._id_6F7C, "interrogationA_run_in" );
    thread _id_A510::_id_0BE1( level._id_6F7C, "interrogationA_idle" );
    common_scripts\utility::_id_383F( "price_ready_for_interrogation" );
}

alasad_damage_monitor()
{
    level endon( "fade_from_black" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_1 ) && var_1 == level._id_0318 )
        {
            _id_A56A::_id_7E03( &"VILLAGE_ASSAULT_YOU_KILLED_ALASAD" );
            _id_A5A4::_id_5CDF();
            return;
        }
    }
}

alasad_sequence_start( var_0 )
{
    level notify( "alasad_sequence_started" );
    level.air_support_hint_delete = 1;
    removeweaponfromplayer( "fraggrenade" );
    removeweaponfromplayer( "smoke_grenade_american" );
    removeweaponfromplayer( "c4" );
    removeweaponfromplayer( "flash_grenade" );
    level._id_0318 _id_A5A4::_id_6C65( 0, "alasad_interrogation" );
    level._id_0318 _meth_8305( 1, "" );
    thread _id_A5A4::_id_1332( "allies" );
    thread _id_A5A4::_id_1332( "axis" );
    thread doautosave( "capturing_al_asad" );
    level.alasad = spawn_ai_and_make_dumb( var_0.alasadspawnertargetname );
    level.alasad thread removeweapon();
    level.alasad._id_0C72 = "alasad";
    level.alasad.tracksuit_ignore = 1;
    level.alasad thread _id_A5A4::_id_58D7();
    level.alasad thread alasad_damage_monitor();
    waitframe;
    var_0._id_02BB thread _id_A510::_id_0C43( level.alasad, "interrogationA" );
    level.alasad_guard1 = spawn_ai_and_make_dumb( var_0.alasadfirstshotspawnertargetname, 1 );
    level.alasad_guard2 = spawn_ai_and_make_dumb( var_0.alasadsecondshotspawnertargetname, 1 );
    var_1 = _id_A5A4::_id_88D1( "phone" );
    var_0._id_02BB thread _id_A510::_id_0BC7( var_1, "interrogationA" );
    var_2 = undefined;

    if ( getdvarint( "use_old_interrogation" ) != 1 )
    {
        var_2 = _id_A5A4::_id_88D1( "rope" );
        var_0._id_02BB thread _id_A510::_id_0BC7( var_2, "interrogationA" );
    }

    var_0._id_44CE = [];
    var_0._id_44CE[var_0._id_44CE.size] = level._id_6F7C;
    var_0._id_44CE[var_0._id_44CE.size] = level.alasad;
    level._id_6F7C animscripts\init::_id_4E32( "colt45_alasad_killer" );
    level._id_6F7C._id_855D = "colt45_alasad_killer";
    level._id_6F7C _id_A5A4::_id_A0AC( level._id_2235["60"] );
    var_0._id_02BB notify( "stop_loop" );
    common_scripts\utility::_id_383F( "alasad_sequence_started" );
    _id_A5E8::_id_870C( "start_interrogation_mix" );

    if ( getdvarint( "use_old_interrogation" ) == 1 )
        level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "nogooddead" );

    _id_A5A4::_id_27EF( 5.9, _id_A5A4::_id_070A, var_0.friendlycolortriggertargetname2 );
    _id_A5A4::_id_27EF( 6.0, ::disconnectpathswrapper, var_0.brushmodel_door );
    var_0._id_44CE[var_0._id_44CE.size] = var_0._id_2D40;
    var_0._id_44CE[var_0._id_44CE.size] = var_1;

    if ( getdvarint( "use_old_interrogation" ) != 1 )
        var_0._id_44CE[var_0._id_44CE.size] = var_2;

    var_0._id_02BB _id_A510::_id_0C18( var_0._id_44CE, "interrogationA" );
    thread chopper_air_support_removefunctionality();
    thread maps\village_assault_lighting::goblack( 18.0, 0.0, 0.5 );
    _id_A5E8::_id_870C( "start_interrogationA_black_screen_mix" );

    foreach ( var_4 in _func_0D9( "allies" ) )
    {
        if ( _func_0EE( var_4._id_02E2, var_4._id_01C3 ) > var_4._id_01C4 )
            var_4 _meth_81CA( var_4._id_01C3 );
    }

    thread blackscreen1_dialog();
    thread alasad_kill_axis();
    level._id_0318 _meth_80F0();
    objective_state( 0, "done" );
    var_0._id_02BB = _func_0C3( var_0.nodetargetname2, "targetname" );
    level._id_6F7C.a._id_A2E2["chest"] = "none";
    var_6 = _id_A5A4::_id_88D1( "chair" );
    var_7 = undefined;

    if ( getdvarint( "use_old_interrogation" ) != 1 )
    {
        var_7 = _id_A5A4::_id_88D1( "handrope" );
        var_0._id_02BB thread _id_A510::_id_0BC7( var_7, "interrogationB" );
    }

    var_0._id_44CE = [];
    var_0._id_44CE[var_0._id_44CE.size] = level._id_6F7C;
    var_0._id_44CE[var_0._id_44CE.size] = level._id_3C61;
    var_0._id_44CE[var_0._id_44CE.size] = level.alasad;
    var_0._id_44CE[var_0._id_44CE.size] = var_6;
    var_0._id_44CE[var_0._id_44CE.size] = var_1;

    if ( getdvarint( "use_old_interrogation" ) != 1 )
    {
        var_0._id_44CE[var_0._id_44CE.size] = var_2;
        var_0._id_44CE[var_0._id_44CE.size] = var_7;
    }

    var_0._id_02BB thread _id_A510::_id_0BC5( var_0._id_44CE, "interrogationB" );
    level._id_0318 _meth_8326( 1 );
    delete_dropped_weapons();
    level._id_0318 _meth_830D();
    _func_0D6( "compass", 0 );
    moveplayertolocation( var_0.playerlocationscenebtargetname );
    _func_0C3( var_0.nodetargetname1, "targetname" ) thread _id_A510::_id_0BC7( var_0._id_2D40, "interrogationA" );
    level waittill( "fade_from_black" );
    _id_A5E8::_id_870C( "start_interrogationA_mix" );
    level._id_6F7C _id_A5A4::_id_4462();
    level._id_0318 _meth_8326( 0 );
    level._id_6F7C thread alasad_execution_notes();
    level._id_6F7C thread alasad_cell_phone_sounds( var_1 );
    level._id_3C61 thread _id_A5A4::_id_69C4( "scn_assault_interogation_pickup" );
    var_0._id_02BB _id_A510::_id_0C18( var_0._id_44CE, "interrogationB" );
    level._id_6F7C._id_051D["m4_silencer"]._id_0329 = "none";
}

blackscreen1_dialog()
{
    level._id_0318 thread _id_A5A4::_id_69C4( "h1_scn_safehouse_punch_out" );
    wait 2;
    var_0 = _func_0DC();

    foreach ( var_2 in var_0 )
        var_2 delete();

    level._id_0318 thread _id_A5A4::_id_69C4( "scn_assault_interogation_black" );
    level._id_6F7C thread _id_A5A4::_id_27EF( 0.0, _id_A510::_id_0C24, level._id_6F7C, "whydyoudoit" );
    level.alasad thread _id_A5A4::_id_27EF( 3.05, _id_A510::_id_0C24, level.alasad, "wasntme1" );
    level._id_6F7C thread _id_A5A4::_id_27EF( 5.3, _id_A510::_id_0C24, level._id_6F7C, "whothen" );
    level.alasad thread _id_A5A4::_id_27EF( 8.3, _id_A510::_id_0C24, level.alasad, "wasntme2" );
    level._id_6F7C thread _id_A5A4::_id_27EF( 10.85, _id_A510::_id_0C24, level._id_6F7C, "givemeaname" );
    level._id_6F7C thread _id_A5A4::_id_27EF( 13.65, _id_A510::_id_0C24, level._id_6F7C, "aname" );
    wait 16;
}

blackscreen2_dialog()
{
    wait 1;
    level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "whowasthat" );
    wait 2;
    level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "zakhaev" );
    wait 2;
    level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "imran" );
    _id_A5A4::_id_6005( 4 );
}

alasad_execution_notes()
{
    level._id_6F7C waittillmatch( "single anim", "pistol_pickup" );
    wait 0.2;
    level._id_6F7C waittillmatch( "single anim", "fire" );
    level.alasad maps\_cheat::melonhead_remove_melon( 1, 1 );
    wait 3.5;
    level._id_0318 _meth_8326( 1 );
    _id_A5E8::_id_870C( "start_interrogationB_black_screen_mix" );
    setomnvar( "ui_go_black", 1.0 );
    thread blackscreen2_dialog();
    wait 7;
    _id_A5A4::_id_60D6();
}

alasad_cell_phone_sounds( var_0 )
{
    wait 2;
    thread alasad_cell_phone_ring( var_0 );
    wait 7;
    var_0 notify( "stop ringing" );
    wait 1;

    if ( getdvarint( "use_old_interrogation" ) == 1 )
        level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "cellphone" );

    _id_A5A4::_id_6008( "h1_interrogation_tension_music" );
}

alasad_cell_phone_ring( var_0 )
{
    var_0 endon( "stop ringing" );

    for (;;)
    {
        level._id_3C61 thread _id_A5A4::_id_69C4( "scn_assault_mobile_ring" );
        wait 2;
    }
}

alasad_notetracks( var_0 )
{
    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        var_1 = "J_Mid_RI_3";
        var_0 _meth_801D( "projectile_m84_flashbang_grenade", var_1 );
        wait 2.0;
        var_0 _meth_802A( "projectile_m84_flashbang_grenade", var_1 );
        thread alasad_flashbang( 1.0 );
        var_0 waittillmatch( "single anim", "pistol_pickup" );
        var_0 waittillmatch( "single anim", "pistol_drop" );
        var_0 _id_A5A4::_id_4462();
        var_0 waittillmatch( "single anim", "fire" );
        headshot( level.alasad, 0 );
    }
    else
    {
        var_1 = "TAG_INHAND";
        var_0 _meth_801D( "projectile_m84_flashbang_grenade", var_1 );
        var_0 waittillmatch( "single anim", "grenade_throw" );
        var_0 _meth_802A( "projectile_m84_flashbang_grenade", var_1 );
        thread alasad_flashbang( 1.0 );
        var_0 waittillmatch( "single anim", "pistol_pickup" );
        level._id_6F7C _meth_804A( "J_Leg_Weapon_RI", "body_sas_woodland_assault_a" );
        var_0 waittillmatch( "single anim", "fire" );
        headshot( level.alasad_guard1 );
        var_0 waittillmatch( "single anim", "fire" );
        headshot( level.alasad_guard2 );
        var_0 waittillmatch( "single anim", "pistol_drop" );
        var_0 _id_A5A4::_id_4462();
        level._id_6F7C _meth_804D( "J_Leg_Weapon_RI", "body_sas_woodland_assault_a" );
        var_0 waittillmatch( "single anim", "pistol_pickup" );
        level._id_6F7C _meth_804A( "J_Leg_Weapon_RI", "body_sas_woodland_assault_a" );
        var_0 waittillmatch( "single anim", "fire" );
        var_0 _meth_809C( "h1_interrogation_gunshot_enhanced" );
        headshot( level.alasad, 0, 1 );
    }
}

alasad_flashbang( var_0 )
{
    wait(var_0);
    playfx( common_scripts\utility::_id_3FA8( "alasad_flash" ), level.alasad_flashbang_location );
    thread common_scripts\utility::_id_69C2( "flashbang_explode_default", level.alasad_flashbang_location );

    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        wait 1.0;
        headshot( level.alasad_guard1 );
        wait 0.5;
        headshot( level.alasad_guard2 );
    }
}

alasad_kill_axis()
{
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !_func_1A1( var_0[var_1] ) )
            continue;

        if ( var_0[var_1] == level.alasad )
            continue;

        if ( var_0[var_1] == level.alasad_guard1 )
            continue;

        if ( var_0[var_1] == level.alasad_guard2 )
            continue;

        var_0[var_1]._id_011F = 1;
        var_0[var_1] _meth_8054();
    }
}

disconnectpathswrapper( var_0 )
{
    var_0 _meth_805A();
}

opening_sequence()
{
    var_0 = _func_0C3( "opening_sequence_node", "targetname" );

    if ( getdvarint( "use_old_intro" ) != 1 )
    {
        var_0 = spawn( "script_origin", ( 1376, -3520, -594.729 ) );
        var_0.angles = ( 0, 180, 0 );
    }

    thread opening_head_tracking();
    thread opening_price_avoid_stutter();
    var_1 = [];
    var_1[0] = level._id_6F7C;
    var_1[1] = level.opening_guy;
    var_0 _id_A510::_id_0BC5( var_1, "opening" );
    wait 4.0;
    thread opening_sequence_notetracks( level.opening_guy );
    thread opening_sequence_dialog( level.opening_guy );
    var_0 _id_A510::_id_0C18( var_1, "opening" );
}

opening_head_tracking()
{
    var_0 = _func_0D9( "allies" );
    var_0 = common_scripts\utility::_id_0CF6( var_0, level._id_6F7C );
    var_0 = common_scripts\utility::_id_0CF6( var_0, level.opening_guy );
    common_scripts\utility::_id_0D13( var_0, maps\_headtracking::player_head_tracking );
    getent( "pushplayer_off", "targetname" ) waittill( "trigger" );
    common_scripts\utility::_id_0D13( var_0, maps\_headtracking::head_tracking_end );
}

opening_price_avoid_stutter()
{
    level._id_6F7C._id_020C = 60;
    level._id_6F7C waittillmatch( "single anim", "finish" );
    wait 0.25;
    level._id_6F7C._id_020C = 128;
}

opening_sequence_notetracks( var_0 )
{
    var_0 _meth_801D( "com_flashlight_off", "tag_inhand" );
    var_0 waittillmatch( "single anim", "flash" );
    thread opening_sequence_flashlight( var_0 );
    var_0 waittillmatch( "single anim", "flash" );
    thread opening_sequence_flashlight( var_0 );
    var_0 waittillmatch( "single anim", "flash" );
    thread opening_sequence_flashlight( var_0 );
    var_0 waittillmatch( "single anim", "detach flashlight" );
    var_0 _meth_802A( "com_flashlight_off", "tag_inhand" );
}

opening_sequence_flashlight( var_0 )
{
    var_1 = "tag_inhand";
    var_2 = "com_flashlight_on";
    var_3 = "com_flashlight_off";

    if ( var_0 ismodelattached( var_3, var_1 ) )
        var_0 _meth_802A( var_3, var_1 );

    var_0 _meth_801D( var_2, var_1 );
    var_0 thread flashlight_light( 1 );
    wait 0.1;

    if ( var_0 ismodelattached( var_2, var_1 ) )
        var_0 _meth_802A( var_2, var_1 );

    var_0 _meth_801D( var_3, var_1 );
    var_0 thread flashlight_light( 0 );
}

opening_sequence_dialog( var_0 )
{
    if ( getdvarint( "use_old_intro" ) == 1 )
    {
        wait 3;
        level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "kamarovsman" );
        wait 5;
        var_0 thread _id_A510::_id_0C24( var_0, "asadinvillage" );
        wait 4.5;
        level._id_6F7C thread _id_A510::_id_0C24( level._id_6F7C, "perfect" );
    }
    else
        wait 15;

    wait 10;
    level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "whatsgoingon" );
    wait 2.5;
    var_0 thread _id_A510::_id_0C24( var_0, "killingvillagers" );
    wait 3.5;
    level._id_3C61 thread _id_A510::_id_0C24( level._id_3C61, "notforlong" );
}

ismodelattached( var_0, var_1 )
{
    var_2 = 0;
    var_0 = _func_123( var_0 );
    var_1 = _func_123( var_1 );

    if ( !isdefined( var_1 ) )
        return var_2;

    var_3 = self _meth_802C();
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3; var_5++ )
        var_4[var_5] = _func_123( self _meth_802D( var_5 ) );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( var_4[var_5] != var_0 )
            continue;

        var_6 = _func_123( self _meth_802E( var_5 ) );

        if ( var_1 != var_6 )
            continue;

        var_2 = 1;
        break;
    }

    return var_2;
}

flashlight_light( var_0 )
{
    var_1 = "tag_light";

    if ( var_0 )
    {
        var_2 = spawn( "script_model", ( 0, 0, 0 ) );
        var_2 _meth_80B3( "tag_origin" );
        var_2 _meth_8056();
        var_2 _meth_804F( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        thread flashlight_light_death( var_2 );
        playfxontag( level._id_058F["flashlight"], var_2, "tag_origin" );
    }
    else
        self notify( "flashlight_off" );
}

flashlight_light_death( var_0 )
{
    common_scripts\utility::_id_A087( "death", "flashlight_off" );
    var_0 delete();
}

removeweaponfromplayer( var_0 )
{
    if ( level._id_0318 _meth_8311( var_0 ) )
        level._id_0318 _meth_830C( var_0 );
}

removeweapon( var_0 )
{
    if ( _func_0CF( self ) )
        _id_A5A4::_id_4462();
    else
    {
        var_1 = self _meth_802C();

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            var_3 = self _meth_802D( var_2 );
            var_4 = self _meth_802E( var_2 );

            if ( isdefined( var_0 ) )
            {
                if ( var_3 == var_0 )
                    self _meth_802A( var_3, var_4 );

                continue;
            }

            if ( _func_120( _func_123( var_3 ), "weapon_" ) )
                self _meth_802A( var_3, var_4 );
        }
    }
}

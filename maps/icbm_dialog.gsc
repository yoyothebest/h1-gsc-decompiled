// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dialog_intro()
{
    common_scripts\utility::_id_384A( "landed" );
    wait 1;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "regrouponme" );
    wait 6;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "wheresgriggs" );
    wait 0.5;
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "noidea" );
    wait 1;
    level._id_0318 _meth_809C( "icbm_hqr_gettingabortcodes" );
    wait 6;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "wereonourway" );
    common_scripts\utility::_id_383F( "intro_dialog_done" );
}

dialog_intro_h1()
{
    var_0[0] = level._id_6F7C;
    var_0[1] = level._id_3C61;

    if ( isdefined( level.soldier ) )
        var_0[2] = level.soldier;

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
            var_2._id_0232 = 1;
    }

    var_4 = spawn( "script_origin", ( 9037.58, -21616.8, -683.706 ) );
    var_4.angles = ( 0, -104.433, 0 );
    common_scripts\utility::_id_384A( "landed" );
    var_4 thread _id_A510::_id_0BC5( var_0, "intro_briefing" );
    wait 1.9;
    var_4 thread _id_A510::_id_0C18( var_0, "intro_briefing" );
    level._id_6F7C waittillmatch( "single anim", "dialog" );
    level._id_6F7C waittillmatch( "single anim", "dialog" );
    level._id_3C61 waittillmatch( "single anim", "dialog" );
    level.soldier waittillmatch( "single anim", "radio_guy" );
    level._id_0318 _meth_809C( "icbm_hqr_gettingabortcodes" );
    level._id_6F7C waittillmatch( "single anim", "dialog" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) )
            var_2._id_0232 = 0;
    }

    common_scripts\utility::_id_383F( "intro_dialog_done" );
}

dialog_price_finds_griggs()
{
    level.griggs _id_A510::_id_0C21( level.griggs, "leavemebehind" );
    wait 0.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "firstthought" );
}

dialog_griggs_is_good()
{
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "youallright" );
    level.griggs _id_A510::_id_0C21( level.griggs, "goodtogo" );
    wait 1;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "gotgriggs" );
}

dialog_check_houses()
{
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "griggsinhouses" );
    wait 1;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "keepitquiet" );
    common_scripts\utility::_id_383F( "music_endon_start_rescue" );
    thread maps\icbm_code::music_tension_loop( "music_endon_tower_collapse", "icbm_launch_tension_music", 103 );
    level._id_0B47["amb_day_intensity0"] = "ambient_icbm_ext0";
}

dialog_ambush_finished()
{
    var_0 = maps\icbm_code::get_a_generic_friendly();
    var_0 _id_A510::_id_0C21( var_0, "tangodown" );
    wait 1;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "move" );
}

dialog_post_knife_kill()
{
    _id_A5A4::_id_980D( "gaz_floor_clear", "targetname" );

    if ( !common_scripts\utility::_id_382E( "house1_cleared" ) )
        level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "roomclear" );

    wait 2;

    if ( !common_scripts\utility::_id_382E( "house1_cleared" ) )
        level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "floorsclear" );
}

dialog_proceed_upstairs()
{
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "proceedupstairs" );
}

dialog_rescue_breach()
{
    level._id_0318 _meth_809C( "icbm_pri_thisisplace" );
    wait 3;
    level._id_0318 _meth_809C( "icbm_pri_readytobreach" );
}

tower_nag()
{
    level endon( "tower_destroyed" );

    if ( common_scripts\utility::_id_382E( "tower_destroyed" ) )
        return;

    for (;;)
    {
        wait 30;
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "doit" );
    }
}

fence1_nag()
{
    level endon( "cut_fence1" );

    for (;;)
    {
        wait 50;
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "jacksonregroup" );
    }
}

dialog_rescue()
{
    wait 2;

    if ( getdvarint( "use_old_griggs_rescue" ) == 1 )
    {
        level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "allclear" );
        wait 1;
        level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "cutloose" );
        wait 1;
        _func_110( 2, &"ICBM_UNTIE_GRIGGS" );
        wait 3;
        dialog_price_finds_griggs();
        wait 1;
        common_scripts\utility::_id_384A( "griggs_loose" );
        dialog_griggs_is_good();
    }
    else
    {
        maps\icbm_code::price_rescue_anims();
        wait 0.5;
        _func_110( 2, &"ICBM_UNTIE_GRIGGS" );
    }
}

griggs_say_leavemebehind( var_0 )
{
    level.griggs _id_A510::_id_0C21( level.griggs, "leavemebehind" );
}

dialog_grigs_guys_jibjab()
{
    level endon( "breach_started" );
    level endon( "player_shooting_interogators" );
    level.ru1 _id_A510::_id_0C21( level.ru1, "whereothers" );
    wait 1;
    level.griggs _id_A510::_id_0C21( level.griggs, "grg_678452056" );
    wait 1;
    level.ru1 _id_A510::_id_0C21( level.ru1, "tovarisch" );
    wait 1;
    level.ru1 _id_A510::_id_0C21( level.ru1, "howmany" );
    wait 1;
    level.griggs _id_A510::_id_0C21( level.griggs, "grg_678" );
    level.ru1 _id_A510::_id_0C21( level.ru1, "whoisofficer" );
    common_scripts\utility::_id_383F( "get_yer_ass" );
    level.griggs _id_A510::_id_0C21( level.griggs, "blowme" );
    wait 2;
    level.ru1 _id_A510::_id_0C21( level.ru1, "whereshacksaw" );
    wait 1;
    level.ru1 _id_A510::_id_0C21( level.ru1, "youhadit" );
    wait 0.5;
    level.ru1 _id_A510::_id_0C21( level.ru1, "ifihad" );
}

dialog_enemy_vehicle()
{
    self waittill( "trigger" );
    wait 3;
    common_scripts\utility::_id_384A( "intro_dialog_done" );

    if ( !common_scripts\utility::_id_382E( "truckguys dead" ) )
        level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "enemyvehicle" );

    common_scripts\utility::_id_383F( "truck_spotted" );
}

dialog_blow_up_tower()
{
    var_0 = getent( "tower_dialog", "targetname" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "trigger" );

    wait 0.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "blowuptower" );
}

dialog_contacts_in_the_woods()
{
    while ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) > 2000 )
    {
        wait 1;

        if ( !_func_1A1( self ) )
            break;
    }

    if ( common_scripts\utility::_id_382E( "contacts_in_the_woods" ) )
        return;

    common_scripts\utility::_id_383F( "contacts_in_the_woods" );
    var_0 = maps\icbm_code::get_a_generic_friendly();

    if ( _func_1A1( var_0 ) )
        var_0 _id_A510::_id_0C21( var_0, "insight" );
}

dialog_jackson_do_it()
{
    level endon( "tower_destroyed" );
    var_0 = getent( "tower", "targetname" );
    var_1 = _func_0D9( "allies" );
    var_1[var_1.size] = level._id_0318;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !_func_1A1( var_1[var_2] ) )
            continue;

        while ( _func_0EE( var_1[var_2]._id_02E2, var_0._id_02E2 ) < 460 )
            wait 0.5;
    }

    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "doit" );
    level thread tower_nag();
}

dialog_tango_down()
{
    self waittill( "death", var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( _func_1AD( var_0 ) )
        return;

    if ( !isdefined( var_0._id_0C72 ) )
        return;

    if ( level.tango_down_dialog )
    {
        if ( _func_0B2( 2 ) > 0 )
            return;
    }

    dialog_enemy_kills( var_0 );
    level.tango_down_dialog = 1;
}

dialog_enemy_kills( var_0 )
{
    var_1["price"] = "UK_pri_inform_killfirm_generic_s";
    var_1["generic"] = "UK_0_inform_killfirm_generic_s";
    var_1["gaz"] = "UK_2_inform_killfirm_generic_s";
    var_0 _meth_809C( var_1[var_0._id_0C72] );
}

dialog_get_fence_open()
{
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "getfenceopen" );
    _func_076( 10 );
}

dialog_enemy_helicopters()
{
    var_0 = getent( "move_to_oldbase01", "targetname" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::_id_97CC();
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "enemyhelicopters" );
    wait 1;
    level.griggs _id_A510::_id_0C21( level.griggs, "getbusy2" );
}

dialog_trucks_with_shooters()
{
    var_0 = getent( "move_to_oldbase02", "targetname" );
    var_0 waittill( "trigger" );
    var_0 common_scripts\utility::_id_97CC();
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "truckswithshooters" );
    wait 0.5;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "approachingbase" );
}

dialog_rpgs_on_rooftops()
{
    _id_A5A4::_id_980D( "rpgs_on_roof_top", "targetname" );
    wait 4;
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "rpgsonrooftop" );
}

dialog_rpgs_on_rooftops2()
{
    _id_A5A4::_id_980D( "rpgs_on_roof_top2", "targetname" );
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "rpgsonrooftop2" );
}

dialog_choppers_dropping()
{
    _id_A5A4::_id_980D( "chopper_dialog1", "targetname" );
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "choppersinbound" );
    wait 6;
    level._id_6F7C _id_A510::_id_0C21( level._id_6F7C, "droppingin" );
}

dialog_first_fight_clear_and_move()
{
    level endon( "second_fight_started" );
    common_scripts\utility::_id_384A( "first_fight_clear" );
    wait 2;
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "allclear" );
    wait 0.3;
    _id_A5A4::_id_070A( "first_fight_clear_nodes" );
    _id_A5A4::_id_1143( "all_clear" );
}

dialog_second_fight_clear_and_move()
{
    level endon( "third_fight_started" );
    common_scripts\utility::_id_384A( "second_fight_cleared" );
    wait 2;
    level._id_3C61 _id_A510::_id_0C21( level._id_3C61, "allclear" );
    wait 0.3;
    _id_A5A4::_id_070A( "second_fight_friendly_nodes" );
    _id_A5A4::_id_1143( "all_clear" );
}

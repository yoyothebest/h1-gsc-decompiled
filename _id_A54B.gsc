// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level._id_244D ) )
        return 0;

    introscreen_init();

    if ( !introscreen_should_activate() )
    {
        simple_intro();
        return;
    }

    initialize_strings();
    activate_intro();
}

introscreen_init()
{
    common_scripts\utility::_id_383D( "pullup_weapon" );
    common_scripts\utility::_id_383D( "introscreen_activate" );
    common_scripts\utility::_id_383D( "introscreen_remove_submix" );
    common_scripts\utility::_id_383D( "introscreen_complete" );
    common_scripts\utility::_id_383D( "safe_for_objectives" );
    _id_A5A4::_id_27EF( 10, common_scripts\utility::_id_383F, "safe_for_objectives" );
    level.linefeed_delay = 16;
    level.background_sort = 1000;
    level.intro_text_sort = 1001;
    precacheshader( "black" );
    precacheshader( "white" );

    if ( getdvar( "introscreen" ) == "" )
        setdvar( "introscreen", "1" );

    waitframe;
    waitframe;
}

introscreen_should_activate()
{
    if ( !introscreen_is_enabled() )
        return 0;

    if ( !_id_A5A4::is_h1_level() )
        return 0;

    return 1;
}

introscreen_is_enabled()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
        return 0;

    return 1;
}

activate_intro()
{
    if ( should_revive_ammo_counter() )
        thread revive_ammo_counter();

    common_scripts\utility::_id_383F( "introscreen_activate" );

    switch ( level._id_038E )
    {
        case "ac130":
            ac130_intro();
            break;
        case "aftermath":
            aftermath_intro();
            break;
        case "airlift":
            airlift_intro();
            break;
        case "ambush":
            ambush_intro();
            break;
        case "armada":
            armada_intro();
            break;
        case "cargoship":
            cargoship_intro();
            break;
        case "hunted":
            hunted_intro();
            break;
        case "jeepride":
            jeepride_intro();
            break;
        case "launchfacility_b":
            launchfacility_b_intro();
            break;
        case "scoutsniper":
            scoutsniper_intro();
            break;
        case "village_defend":
            village_defend_intro();
            break;
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "icbm":
        case "killhouse":
        case "launchfacility_a":
        case "village_assault":
            flying_intro();
            break;
        case "airplane":
        case "coup":
        case "sniperescape":
        case "simplecredits":
            simple_intro();
            break;
    }
}

simple_intro()
{
    waitframe;
    waitframe;
    waitframe;
    waitframe;
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    common_scripts\utility::_id_383F( "introscreen_complete" );
}

flying_intro_dvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", 1 );
    _func_0D6( "hud_showstance", 0 );
    _func_0D6( "actionSlotsHide", 1 );
}

flying_intro()
{
    thread flying_intro_dvars();
    thread weapon_pullout();
    level._id_0318 _meth_8326( 1 );
    var_0 = 16000;
    var_1 = 1;
    var_2 = 0;
    var_3 = 0;

    if ( var_1 )
    {
        switch ( level._id_038E )
        {
            case "bog_a":
                _func_05A( "bog_a_fade" );
                break;
            case "bog_b":
                var_2 = 2.0;
                var_0 = 6500;
                _func_05A( "bog_b_fade" );
                break;
            case "blackout":
                var_0 = 4000;
                _func_05A( "blackout_fade" );
                break;
            case "killhouse":
                var_0 = 0;
                var_3 = 1;
                _func_05A( "killhouse_fade" );
                break;
            case "icbm":
                var_2 = 0.6;
                _func_05A( "icbm_fade" );
                break;
            case "launchfacility_a":
                _func_05A( "launchfacility_a_fade" );
                break;
            case "village_assault":
                _func_05A( "village_assault_fade" );
                break;
        }

        _id_4F90( level.introscreen_lines );
    }

    thread flying_intro_force_streaming_center( level._id_0318._id_02E2 );
    var_4 = level._id_0318._id_02E2;
    level._id_0318._id_02E2 = var_4 + ( 0, 0, var_0 );
    var_5 = spawn( "script_model", ( 69, 69, 69 ) );
    var_5._id_02E2 = level._id_0318._id_02E2;
    var_5 _meth_80B3( "tag_origin" );
    var_5.angles = level._id_0318.angles;
    level._id_0318 _meth_8081( var_5 );
    var_5.angles = ( var_5.angles[0] + 89, var_5.angles[1], 0 );
    wait(var_2);
    var_5 _meth_82AA( var_4 + ( 0, 0, 0 ), 2, 0, 2 );
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    wait 1.2;
    wait 0.3;
    var_5 _meth_82B1( ( var_5.angles[0] - 89, var_5.angles[1], 0 ), 0.5, 0.3, 0.2 );

    if ( !var_3 )
        _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );

    wait 0.5;
    common_scripts\utility::_id_383F( "pullup_weapon" );
    wait 0.2;
    level._id_0318 _meth_8051();
    level._id_0318 _meth_8326( 0 );
    thread common_scripts\utility::_id_69C2( "ui_screen_trans_in", level._id_0318._id_02E2 );
    wait 0.2;
    thread common_scripts\utility::_id_69C2( "ui_screen_trans_out", level._id_0318._id_02E2 );
    wait 0.2;
    common_scripts\utility::_id_383F( "introscreen_complete" );
    wait 2;
    var_5 delete();
}

flying_intro_force_streaming_center( var_0 )
{
    self endon( "introscreen_complete" );

    for (;;)
    {
        level._id_0318 _meth_8237( var_0 );
        wait 0.01;
    }
}

cargoship_intro_dvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", "1" );
    _func_0D6( "hud_showStance", 0 );
    _func_0D6( "hud_drawhud", "0" );
}

cargoship_intro()
{
    thread cargoship_intro_dvars();
    level._id_0318 _meth_8326( 1 );
    _func_05A( "cargoship_fade" );
    wait 0.4;
    level notify( "intro_movie_done" );
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    introscreen_generic_white_fade_in( 1.75 );
    _id_4F90( level.introscreen_lines );
    wait 1;
    level._id_0318 _meth_8326( 0 );
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
}

jeepride_intro()
{
    level._id_0318 _meth_8326( 1 );
    _func_05A( "jeepride_fade" );
    _id_4F90( level.introscreen_lines );
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
}

airlift_intro_dvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", "1" );
}

airlift_intro()
{
    thread airlift_intro_dvars();
    level._id_0318 _meth_8326( 1 );
    _func_05A( "airlift_fade" );
    _id_4F90( level.introscreen_lines );
    wait 2;
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    level notify( "introscreen_black" );
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0._id_0198 = 1;
    var_0._id_03D4 = level.background_sort;
    var_0 _meth_80CE( "white", 640, 480 );
    wait 1;
    var_0 _meth_8086( 1.5 );
    var_0.alpha = 0;
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    wait 1;
    common_scripts\utility::_id_383F( "introscreen_complete" );
    thread _id_A5A4::_id_114E( 1 );
    level._id_0318 _meth_8326( 0 );
}

village_defend_intro_dvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", "1" );
}

village_defend_intro()
{
    thread village_defend_intro_dvars();
    level._id_0318 _meth_8326( 1 );
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0._id_0198 = 1;
    var_0._id_03D4 = level.background_sort;
    var_0 _meth_80CE( "black", 640, 480 );
    wait 0.25;
    var_1 = _func_1A9();
    var_1._id_0530 = 0;
    var_1._id_0538 = 0;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1._id_01F3 = "center";
    var_1._id_0501 = "middle";
    var_1._id_03D4 = level.intro_text_sort;
    var_1._id_0198 = 1;
    var_1 _meth_80CC( &"VILLAGE_DEFEND_PRESENT_DAY" );
    var_1._id_0189 = 1.6;
    var_1.color = ( 0.8, 1, 0.8 );
    var_1._id_0188 = "objective";
    var_1._id_01BD = ( 0.26, 0.65, 0.32 );
    var_1._id_01BC = 0.2;
    var_1 _meth_808B( 30, 8000, 700 );
    wait 8.8;
    _id_4F90( level.introscreen_lines );
    wait 10;
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    var_0 _meth_8086( 1.5 );
    var_0.alpha = 0;
    wait 1;
    level._id_0318 _meth_8326( 0 );
    _func_0D6( "compass", 1 );
    _func_0D6( "ammoCounterHide", "0" );
    _func_0D6( "hud_showStance", 1 );
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
}

scoutsniper_intro()
{
    thread scoutsniperintrodvars();
    thread scoutsniperintroplayer();
    _func_05A( "scoutsniper_fade" );
    wait 4;
    _id_A5A4::_id_7F00( "grayscale" );
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0._id_0198 = 1;
    var_0._id_03D4 = level.background_sort;
    var_0 _meth_80CE( "black", 640, 480 );
    wait 0.25;
    var_1 = _func_1A9();
    var_1._id_0530 = 0;
    var_1._id_0538 = 0;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1._id_01F3 = "center";
    var_1._id_0501 = "middle";
    var_1._id_03D4 = level.intro_text_sort;
    var_1._id_0198 = 1;
    var_1 _meth_80CC( &"SCOUTSNIPER_15_YEARS_AGO" );
    var_1._id_0189 = 1.6;
    var_1.color = ( 0.8, 1, 0.8 );
    var_1._id_0188 = "objective";
    var_1._id_01BD = ( 0.26, 0.65, 0.32 );
    var_1._id_01BC = 0.2;
    var_1 _meth_808B( 30, 2000, 700 );
    wait 2;
    _id_4F90( level.introscreen_lines );
    wait 1;
    var_0 _meth_8086( 1.5 );
    var_0.alpha = 0;
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    wait 4.5;
    _id_A5A4::_id_7F00( "scoutsniper_start", 1 );
    wait 8.0;
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
    wait 0.5;
    _func_0D6( "compass", 1 );
    _func_0D6( "ammoCounterHide", "0" );
    _func_0D6( "hud_showStance", 1 );
}

scoutsniperintroplayer()
{
    var_0 = level._id_0318 _meth_8338();
    wait 1;
    level._id_0318 _meth_8181( "crouch" );
    level._id_0318 _meth_8326( 1 );
    level._id_0318 _meth_8337( var_0 );
}

scoutsniperintrodvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", "1" );
    _func_0D6( "hud_showStance", 0 );
}

ac130_intro()
{
    level._id_0318 _meth_8326( 1 );
    _id_4F90( level.introscreen_lines );
    level notify( "introscreen_black" );
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0._id_0198 = 1;
    var_0._id_03D4 = level.background_sort;
    var_0 _meth_80CE( "black", 640, 480 );
    wait 4.0;
    level notify( "introscreen_almost_complete" );
    wait 1.5;
    level notify( "introscreen_fading_out" );
    var_0 _meth_8086( 1.5 );
    var_0.alpha = 0;
    wait 1;
    level._id_0318 _meth_8326( 0 );
    _func_0D6( "hud_showStance", 0 );
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
}

aftermath_intro()
{
    _func_05A( "black" );
    common_scripts\utility::_id_383F( "introscreen_complete" );
}

hunted_intro_dvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", "1" );
}

hunted_intro()
{
    thread hunted_intro_dvars();
    level._id_0318 _meth_8326( 1 );
    _id_4F90( level.introscreen_lines );
    _func_05A( "hunted_fade" );
    wait 1;
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    introscreen_generic_white_fade_in( 2 );
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    wait 1;
    level._id_0318 _meth_8326( 0 );
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
}

launchfacility_b_intro_dvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", "1" );
    _func_0D6( "actionSlotsHide", "1" );
    _func_0D6( "hud_showstance", "0" );
    thread revive_ammo_counter();
}

launchfacility_b_intro()
{
    thread launchfacility_b_intro_dvars();
    level._id_0318 _meth_8326( 1 );
    _id_4F90( level.introscreen_lines );
    introscreen_generic_white_fade_in( 1 );
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    wait 1;
    level._id_0318 _meth_8326( 0 );
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
}

ambush_intro_dvars()
{
    wait 0.05;
    _func_0D6( "compass", 0 );
    _func_0D6( "ammoCounterHide", "1" );
}

ambush_intro()
{
    thread ambush_intro_dvars();
    level._id_0318 _meth_8326( 1 );
    _id_4F90( level.introscreen_lines );
    _func_05A( "ambush_fade" );
    wait 2;
    _func_085( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", 1 );
    introscreen_generic_white_fade_in( 2 );
    common_scripts\utility::_id_383F( "introscreen_remove_submix" );
    thread _id_A5A4::_id_114E( 1 );
    _func_0D6( "compass", 1 );
    _func_0D6( "ammoCounterHide", "0" );
    _func_0D6( "hud_showStance", 1 );
    wait 1;
    level._id_0318 _meth_8326( 0 );
    common_scripts\utility::_id_383F( "introscreen_complete" );
    level._id_0318 _meth_8326( 0 );
}

armada_intro()
{
    _func_0D6( "hud_drawhud", "0" );
    level._id_0318 _meth_831A();
    _id_4F91( 0.2, 0.2 );
    _id_4F90( level.introscreen_lines );
    wait 3;
    level._id_0318 _meth_8326( 0 );
    wait 2;
    common_scripts\utility::_id_383F( "introscreen_complete" );
    wait 2;
    _id_A5A4::_id_1143( "levelstart" );
    wait 4;
    level._id_0318 _meth_831B();
}

_id_4F90( var_0 )
{
    var_1 = _func_1D3( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        var_4 = 1;
        var_5 = var_2 * var_4 + 1;
        _id_A5A4::_id_27EF( var_5, ::_id_4F8E, var_0[var_3], var_0.size - var_2 - 1, var_4, var_3 );
    }
}

_id_4F91( var_0, var_1 )
{
    _id_4F92( "black", var_0, var_1 );
}

introscreen_generic_white_fade_in( var_0, var_1 )
{
    _id_4F92( "white", var_0, var_1 );
}

_id_4F92( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1.5;

    var_3 = _func_1A9();
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3._id_01F3 = "fullscreen";
    var_3._id_0501 = "fullscreen";
    var_3._id_0198 = 1;
    var_3._id_03D4 = level.background_sort;
    var_3 _meth_80CE( var_0, 640, 480 );
    wait(var_1);
    var_3 _meth_8086( 1.5 );
    var_3.alpha = 0;
}

introscreen_create_line( var_0 )
{
    var_1 = level.introstring.size;
    var_2 = var_1 * 30;

    if ( level._id_2153 )
        var_2 -= 60;

    var_3 = _func_1A9();
    var_3._id_0530 = 0;
    var_3._id_0538 = var_2;
    var_3.alignx = "center";
    var_3.aligny = "middle";
    var_3._id_01F3 = "center";
    var_3._id_0501 = "middle";
    var_3._id_03D4 = level.intro_text_sort;
    var_3._id_0198 = 1;
    var_3._id_0189 = 1.75;
    var_3 _meth_80CC( var_0 );
    var_3.alpha = 0;
    var_3 _meth_8086( 1.2 );
    var_3.alpha = 1;
    common_scripts\utility::_id_0CED( level.introstring, var_3, 0 );
}

introscreen_fadeouttext()
{
    for ( var_0 = 0; var_0 < level.introstring.size; var_0++ )
    {
        level.introstring[var_0] _meth_8086( 1.5 );
        level.introstring[var_0].alpha = 0;
    }

    wait 1.5;

    for ( var_0 = 0; var_0 < level.introstring.size; var_0++ )
        level.introstring[var_0] _meth_808A();
}

_cornerlinethread( var_0, var_1, var_2, var_3 )
{
    level notify( "new_introscreen_element" );

    if ( !isdefined( level._id_4F4E ) )
        level._id_4F4E = 0;
    else
        level._id_4F4E++;

    var_4 = _cornerlinethread_height();
    var_5 = _func_1A9();
    var_5._id_0530 = 30.7;
    var_5._id_0538 = var_4 - 8.7;
    var_5.alignx = "left";
    var_5.aligny = "bottom";
    var_5._id_01F3 = "left_adjustable";
    var_5._id_0501 = "bottom_adjustable";
    var_5._id_03D4 = level.intro_text_sort;
    var_5._id_0198 = 1;
    var_5 _meth_80CC( var_0 );
    var_5.alpha = 0;
    var_5 _meth_8086( 0.2 );
    var_5.alpha = 1;
    var_5._id_01ED = 1;
    var_5._id_0189 = 1.25;
    var_5.color = ( 0.8, 1, 0.8 );
    var_5._id_0188 = "objective";
    var_5._id_01BD = ( 0.26, 0.65, 0.32 );
    var_5._id_01BC = 0.2;
    var_6 = _func_0BC( var_1 * var_2 * 1000 + 4000 );
    var_5 _meth_808B( 30, var_6, 700 );
    thread _id_4AE2( var_5 );

    if ( !isdefined( var_3 ) )
        return;

    if ( !isstring( var_3 ) )
        return;

    if ( var_3 != "date" )
        return;
}

_cornerlinethread_height()
{
    return level._id_4F4E * 18 - 82;
}

_id_4F8E( var_0, var_1, var_2, var_3 )
{
    thread _cornerlinethread( var_0, var_1, var_2, var_3 );
}

_id_4AE2( var_0 )
{
    wait(level.linefeed_delay);
    var_0 notify( "destroying" );
    level._id_4F4E = undefined;
    var_1 = 0.5;
    var_0 _meth_8086( var_1 );
    var_0.alpha = 0;
    wait(var_1);
    var_0 notify( "destroy" );
    var_0 _meth_808A();
}

weapon_pullout()
{
    var_0 = level._id_0318 _meth_8308()[0];
    level._id_0318 _meth_831A();
    common_scripts\utility::_id_384A( "pullup_weapon" );
    level._id_0318 _meth_831B();
}

revive_ammo_counter()
{
    common_scripts\utility::_id_384A( "safe_for_objectives" );

    if ( !isdefined( level.nocompass ) )
        _func_0D6( "compass", 1 );

    _func_0D6( "ammoCounterHide", "0" );
    _func_0D6( "actionSlotsHide", "0" );
    _func_0D6( "hud_showstance", "1" );
}

introscreen_add_line( var_0 )
{
    if ( !isdefined( level.introscreen_lines ) )
        level.introscreen_lines = [];

    precachestring( var_0 );
    level.introscreen_lines[level.introscreen_lines.size] = var_0;
}

should_revive_ammo_counter()
{
    switch ( level._id_038E )
    {
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "coup":
        case "sniperescape":
        case "simplecredits":
            return 0;
    }

    return 1;
}

initialize_strings()
{
    switch ( level._id_038E )
    {
        case "ac130":
            introscreen_add_line( &"AC130_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"AC130_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"AC130_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"AC130_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"AC130_INTROSCREEN_LINE_5" );
            break;
        case "airlift":
            introscreen_add_line( &"AIRLIFT_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"AIRLIFT_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"AIRLIFT_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"AIRLIFT_INTROSCREEN_LINE_4" );
            break;
        case "ambush":
            introscreen_add_line( &"AMBUSH_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"AMBUSH_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"AMBUSH_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"AMBUSH_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"AMBUSH_INTROSCREEN_LINE_5" );
            break;
        case "armada":
            introscreen_add_line( &"ARMADA_INTRO" );
            introscreen_add_line( &"ARMADA_DATE" );
            introscreen_add_line( &"ARMADA_PLACE" );
            introscreen_add_line( &"ARMADA_INFO" );
            break;
        case "blackout":
            introscreen_add_line( &"BLACKOUT_INTRO_1" );
            introscreen_add_line( &"BLACKOUT_INTRO_2" );
            introscreen_add_line( &"BLACKOUT_INTRO_3" );
            introscreen_add_line( &"BLACKOUT_INTRO_4" );
            introscreen_add_line( &"BLACKOUT_INTRO_5" );
            break;
        case "bog_a":
            introscreen_add_line( &"BOG_A_INTRO_1" );
            introscreen_add_line( &"BOG_A_INTRO_2" );
            introscreen_add_line( &"BOG_A_SGT_PAUL_JACKSON" );
            introscreen_add_line( &"BOG_A_1ST_FORCE_RECON_CO_USMC" );
            break;
        case "bog_b":
            introscreen_add_line( &"BOG_B_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"BOG_B_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"BOG_B_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"BOG_B_INTROSCREEN_LINE_4" );
            break;
        case "cargoship":
            introscreen_add_line( &"CARGOSHIP_LINE1" );
            introscreen_add_line( &"CARGOSHIP_LINE2" );
            introscreen_add_line( &"CARGOSHIP_LINE3" );
            introscreen_add_line( &"CARGOSHIP_LINE4" );
            introscreen_add_line( &"CARGOSHIP_LINE5" );
            break;
        case "hunted":
            introscreen_add_line( &"HUNTED_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"HUNTED_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"HUNTED_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"HUNTED_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"HUNTED_INTROSCREEN_LINE_5" );
            break;
        case "icbm":
            introscreen_add_line( &"ICBM_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"ICBM_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"ICBM_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"ICBM_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"ICBM_INTROSCREEN_LINE_5" );
            break;
        case "jeepride":
            introscreen_add_line( &"JEEPRIDE_INTROSCREEN_LINE1" );
            introscreen_add_line( &"JEEPRIDE_INTROSCREEN_LINE2" );
            introscreen_add_line( &"JEEPRIDE_INTROSCREEN_LINE3" );
            introscreen_add_line( &"JEEPRIDE_INTROSCREEN_LINE4" );
            introscreen_add_line( &"JEEPRIDE_INTROSCREEN_LINE5" );
            break;
        case "killhouse":
            introscreen_add_line( &"KILLHOUSE_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"KILLHOUSE_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"KILLHOUSE_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"KILLHOUSE_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"KILLHOUSE_INTROSCREEN_LINE_5" );
            break;
        case "launchfacility_a":
            introscreen_add_line( &"LAUNCHFACILITY_A_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"LAUNCHFACILITY_A_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"LAUNCHFACILITY_A_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"LAUNCHFACILITY_A_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"LAUNCHFACILITY_A_INTROSCREEN_LINE_5" );
            break;
        case "launchfacility_b":
            introscreen_add_line( &"LAUNCHFACILITY_B_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"LAUNCHFACILITY_B_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"LAUNCHFACILITY_B_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"LAUNCHFACILITY_B_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"LAUNCHFACILITY_B_INTROSCREEN_LINE_5" );
            break;
        case "scoutsniper":
            introscreen_add_line( &"SCOUTSNIPER_INTRO_1" );
            introscreen_add_line( &"SCOUTSNIPER_INTRO_2" );
            introscreen_add_line( &"SCOUTSNIPER_INTRO_3" );
            introscreen_add_line( &"SCOUTSNIPER_INTRO_4" );
            precachestring( &"SCOUTSNIPER_15_YEARS_AGO" );
            break;
        case "village_assault":
            introscreen_add_line( &"VILLAGE_ASSAULT_INTROSCREEN_LINE_1" );
            introscreen_add_line( &"VILLAGE_ASSAULT_INTROSCREEN_LINE_2" );
            introscreen_add_line( &"VILLAGE_ASSAULT_INTROSCREEN_LINE_3" );
            introscreen_add_line( &"VILLAGE_ASSAULT_INTROSCREEN_LINE_4" );
            introscreen_add_line( &"VILLAGE_ASSAULT_INTROSCREEN_LINE_5" );
            break;
        case "village_defend":
            introscreen_add_line( &"VILLAGE_DEFEND_INTRO_1" );
            introscreen_add_line( &"VILLAGE_DEFEND_INTRO_2" );
            introscreen_add_line( &"VILLAGE_DEFEND_INTRO_3" );
            introscreen_add_line( &"VILLAGE_DEFEND_INTRO_4" );
            introscreen_add_line( &"VILLAGE_DEFEND_INTRO_5" );
            precachestring( &"VILLAGE_DEFEND_PRESENT_DAY" );
            break;
    }
}

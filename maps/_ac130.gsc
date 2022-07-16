// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    _func_0D6( "scr_dof_enable", "0" );
    _func_0D6( "con_subtitleExtraDark", 1 );
    level._id_06CE = spawn( "script_model", level._id_0318 _meth_8097() );
    level._id_06CE _meth_80B3( "c130_zoomrig" );
    level._id_06CE.angles = ( 0, 115, 0 );
    level._id_06CE _meth_8056();

    if ( getdvar( "ac130_enabled" ) == "" )
        setdvar( "ac130_enabled", "1" );

    if ( getdvar( "ac130_post_effects_enabled" ) == "" )
        setdvar( "ac130_post_effects_enabled", "1" );

    if ( getdvar( "ac130_debug_weapons" ) == "" )
        setdvar( "ac130_debug_weapons", "0" );

    if ( getdvar( "ac130_debug_context_sensative_dialog" ) == "" )
        setdvar( "ac130_debug_context_sensative_dialog", "0" );

    if ( getdvar( "ac130_debug_friendly_count" ) == "" )
        setdvar( "ac130_debug_friendly_count", "0" );

    if ( getdvar( "ac130_hud_text_misc" ) == "" )
        setdvar( "ac130_hud_text_misc", "1" );

    if ( getdvar( "ac130_hud_text_thermal" ) == "" )
        setdvar( "ac130_hud_text_thermal", "1" );

    if ( getdvar( "ac130_hud_text_weapons" ) == "" )
        setdvar( "ac130_hud_text_weapons", "1" );

    if ( getdvar( "ac130_target_markers" ) == "" )
        setdvar( "ac130_target_markers", "0" );

    if ( getdvar( "ac130_pre_engagement_mode" ) == "" )
        setdvar( "ac130_pre_engagement_mode", "2" );

    if ( getdvar( "ac130_alternate_controls" ) == "" )
        setdvar( "ac130_alternate_controls", "0" );

    if ( getdvar( "ac130_ragdoll_deaths" ) == "" )
        setdvar( "ac130_ragdoll_deaths", "1" );

    precacheshader( "ac130_overlay_25mm" );
    precacheshader( "ac130_overlay_40mm" );
    precacheshader( "ac130_overlay_105mm" );
    precacheshader( "ac130_overlay_grain" );
    precacheshader( "h1_ac130_screen_overlay" );
    precacheshader( "h1_ac130_distort" );
    precacheshader( "ac130_hud_target" );
    precacheshader( "ac130_hud_target_flash" );
    precacheshader( "ac130_hud_target_offscreen" );
    precacheshader( "ac130_friendly_fire_icon" );
    precacheshader( "black" );
    precacheshader( "h1_ac130_blur_40mm" );
    precacheshader( "h1_ac130_blur_25mm" );
    precacheshader( "h1_ac130_blur_105mm" );
    precachestring( &"AC130_HUD_TOP_BAR" );
    precachestring( &"AC130_HUD_LEFT_BLOCK" );
    precachestring( &"AC130_HUD_RIGHT_BLOCK" );
    precachestring( &"AC130_HUD_BOTTOM_BLOCK" );
    precachestring( &"AC130_HUD_THERMAL_WHOT" );
    precachestring( &"AC130_HUD_THERMAL_BHOT" );
    precachestring( &"AC130_HUD_WEAPON_105MM" );
    precachestring( &"AC130_HUD_WEAPON_40MM" );
    precachestring( &"AC130_HUD_WEAPON_25MM" );
    precachestring( &"AC130_HUD_AGL" );
    precacherumble( "ac130_25mm_fire" );

    if ( getdvar( "ac130_alternate_controls" ) == "0" )
    {
        precacheitem( "ac130_25mm" );
        precacheitem( "ac130_40mm" );
        precacheitem( "ac130_105mm" );
    }
    else
    {
        precacheitem( "ac130_25mm_alt" );
        precacheitem( "ac130_40mm_alt" );
        precacheitem( "ac130_105mm_alt" );
    }

    precacheshellshock( "ac130" );
    level._id_058F["cloud"] = loadfx( "fx/misc/ac130_cloud" );
    level._id_058F["beacon"] = loadfx( "fx/misc/ir_beacon" );
    level._id_2543 = "@AC130_FRIENDLY_FIRE";
    level._id_2544 = "ac130_friendly_fire_icon";
    level._id_89CB = ::spawn_callback_thread;
    level._id_9D7D = ::context_sensative_dialog_vehiclespawn;
    level.enemieskilledintimewindow = 0;
    level.radioforcedtransmissionqueue = [];
    level.lastradiotransmission = gettime();
    level.color["white"] = ( 1, 1, 1 );
    level.color["red"] = ( 1, 0, 0 );
    level.color["blue"] = ( 0.1, 0.3, 1 );
    level._id_2235 = [];
    level._id_2235["45"] = _func_0B7( 45 );
    level._id_2235["5"] = _func_0B7( 5 );
    _id_A5A4::enable_scuff_footsteps_sound( 0 );
    level._id_0318 _meth_830D();
    level._id_0318._id_01FF = 1;
    level.textimagealpha = 0.55;
    level.badplaceradius["ac130_25mm"] = 800;
    level.badplaceradius["ac130_40mm"] = 1000;
    level.badplaceradius["ac130_105mm"] = 1600;
    level.badplaceradius["ac130_25mm_alt"] = level.badplaceradius["ac130_25mm"];
    level.badplaceradius["ac130_40mm_alt"] = level.badplaceradius["ac130_40mm"];
    level.badplaceradius["ac130_105mm_alt"] = level.badplaceradius["ac130_105mm"];
    level.badplaceduration["ac130_25mm"] = 2.0;
    level.badplaceduration["ac130_40mm"] = 9.0;
    level.badplaceduration["ac130_105mm"] = 12.0;
    level.badplaceduration["ac130_25mm_alt"] = level.badplaceduration["ac130_25mm"];
    level.badplaceduration["ac130_40mm_alt"] = level.badplaceduration["ac130_40mm"];
    level.badplaceduration["ac130_105mm_alt"] = level.badplaceduration["ac130_105mm"];
    level._id_6804["ac130_25mm"] = 60;
    level._id_6804["ac130_40mm"] = 600;
    level._id_6804["ac130_105mm"] = 1000;
    level._id_6804["ac130_25mm_alt"] = level._id_6804["ac130_25mm"];
    level._id_6804["ac130_40mm_alt"] = level._id_6804["ac130_40mm"];
    level._id_6804["ac130_105mm_alt"] = level._id_6804["ac130_105mm"];
    level._id_6803["ac130_25mm"] = 0;
    level._id_6803["ac130_40mm"] = 3.0;
    level._id_6803["ac130_105mm"] = 6.0;
    level._id_6803["ac130_25mm_alt"] = level._id_6803["ac130_25mm"];
    level._id_6803["ac130_40mm_alt"] = level._id_6803["ac130_40mm"];
    level._id_6803["ac130_105mm_alt"] = level._id_6803["ac130_105mm"];
    level.weaponreloadtime["ac130_25mm"] = 0.05;
    level.weaponreloadtime["ac130_40mm"] = 0.5;
    level.weaponreloadtime["ac130_105mm"] = 6.0;
    level.weaponreloadtime["ac130_25mm_alt"] = level.weaponreloadtime["ac130_25mm"];
    level.weaponreloadtime["ac130_40mm_alt"] = level.weaponreloadtime["ac130_40mm"];
    level.weaponreloadtime["ac130_105mm_alt"] = level.weaponreloadtime["ac130_105mm"];
    level.weaponfriendlyclosedistance["ac130_25mm"] = 150;
    level.weaponfriendlyclosedistance["ac130_40mm"] = 500;
    level.weaponfriendlyclosedistance["ac130_105mm"] = 1000;
    level.weaponfriendlyclosedistance["ac130_25mm_alt"] = level.weaponfriendlyclosedistance["ac130_25mm"];
    level.weaponfriendlyclosedistance["ac130_40mm_alt"] = level.weaponfriendlyclosedistance["ac130_40mm"];
    level.weaponfriendlyclosedistance["ac130_105mm_alt"] = level.weaponfriendlyclosedistance["ac130_105mm"];
    level.weaponreadytofire["ac130_25mm"] = 1;
    level.weaponreadytofire["ac130_40mm"] = 1;
    level.weaponreadytofire["ac130_105mm"] = 1;
    level.weaponreadytofire["ac130_25mm_alt"] = level.weaponreadytofire["ac130_25mm"];
    level.weaponreadytofire["ac130_40mm_alt"] = level.weaponreadytofire["ac130_40mm"];
    level.weaponreadytofire["ac130_105mm_alt"] = level.weaponreadytofire["ac130_105mm"];
    level.ac130_speed["move"] = 250;
    level.ac130_speed["rotate"] = 70;
    level.enemieskilledbyplayer = 0;
    common_scripts\utility::_id_383D( "allow_context_sensative_dialog" );
    common_scripts\utility::_id_383D( "clear_to_engage" );
    common_scripts\utility::_id_383D( "player_changed_weapons" );
    common_scripts\utility::_id_383D( "player_changed_thermal" );
    common_scripts\utility::_id_383D( "player_changed_thermal_back" );
    common_scripts\utility::_id_383D( "player_changed_weapons_back" );
    level._id_0318 _meth_830D();

    if ( getdvar( "ac130_alternate_controls" ) == "0" )
    {
        level._id_0318 _meth_830B( "ac130_105mm" );
        level._id_0318 _meth_8312( "ac130_105mm" );
    }
    else
    {
        level._id_0318 _meth_830B( "ac130_105mm_alt" );
        level._id_0318 _meth_8312( "ac130_105mm_alt" );
    }

    setammo();
    var_0 = 1;
    var_1 = 15;
    var_2 = getdvarint( "loc_language", 0 );
    level.whot_shader = "ac130_overlay_whot_txt";
    level.bhot_shader = "ac130_overlay_bhot_txt";
    level.agl_shader = "ac130_overlay_agl_txt";
    level.bottom_shader = "ac130_overlay_bottom_center_txt";

    if ( var_2 == var_0 )
    {
        level.whot_shader += "_frn";
        level.bhot_shader += "_frn";
    }
    else if ( var_2 == var_1 )
    {
        level.whot_shader += "_krn";
        level.bhot_shader += "_krn";
        level.agl_shader += "_krn";
        level.bottom_shader += "_krn";
    }

    if ( getdvar( "ac130_enabled" ) == "1" )
    {
        thread _id_65F6();
        thread huditemsoff();
        thread attachplayer();
        thread _id_1C85();
        thread weaponfiredthread();
        thread ac130_25mm_loop_fire_sound();
        thread ac130_25mm_loop_rumble();
        thread invertthermal();

        if ( getdvar( "ac130_pre_engagement_mode" ) == "1" )
            thread failmissionforengaging();

        if ( getdvar( "ac130_pre_engagement_mode" ) == "2" )
            thread nofirecrosshair();

        thread context_sensative_dialog();
        thread _id_843F();
        thread _id_1FEE();
        thread maps\_ac130_amb::main();
        thread _id_7603( "on" );
        thread hud_target_blink_timer();
    }
}

delay_overlay()
{
    if ( getdvar( "start" ) != "default" )
        return;

    if ( getdvar( "credits_active" ) == "1" )
        return;

    level waittill( "introscreen_fading_out" );
}

_id_65F6()
{
    wait 0.05;
    _func_0D6( "g_friendlynamedist", 0 );
    _func_0D6( "compass", 0 );
    delay_overlay();
    level._id_4AEC = [];
    level._id_4AEC["crosshairs"] = _func_1A9();
    level._id_4AEC["crosshairs"]._id_0530 = 0;
    level._id_4AEC["crosshairs"]._id_0538 = 0;
    level._id_4AEC["crosshairs"].alignx = "center";
    level._id_4AEC["crosshairs"].aligny = "middle";
    level._id_4AEC["crosshairs"]._id_01F3 = "center";
    level._id_4AEC["crosshairs"]._id_0501 = "middle";
    level._id_4AEC["crosshairs"] _meth_80CE( "ac130_overlay_105mm", 640, 480 );
    level._id_4AEC["crosshairs"]._id_03D4 = -2;

    if ( getdvar( "ac130_hud_text_misc" ) == "1" && !isdefined( level._id_244D ) )
    {
        level._id_4AEC["hud_text_top"] = _func_1A9();
        level._id_4AEC["hud_text_top"]._id_0530 = _1080tovirtualcoords( 54 );
        level._id_4AEC["hud_text_top"]._id_0538 = _1080tovirtualcoords( 123 );
        level._id_4AEC["hud_text_top"].alignx = "left";
        level._id_4AEC["hud_text_top"].aligny = "top";
        level._id_4AEC["hud_text_top"]._id_01F3 = "left_adjustable";
        level._id_4AEC["hud_text_top"]._id_0501 = "top_adjustable";
        level._id_4AEC["hud_text_top"] _meth_80CE( "ac130_overlay_top_left_txt", _1080tovirtualcoords( 672 ), _1080tovirtualcoords( 64 ) );
        level._id_4AEC["hud_text_top"].alpha = level.textimagealpha;
        level._id_4AEC["hud_text_left"] = _func_1A9();
        level._id_4AEC["hud_text_left"]._id_0530 = _1080tovirtualcoords( 64 );
        level._id_4AEC["hud_text_left"]._id_0538 = _1080tovirtualcoords( 183 );
        level._id_4AEC["hud_text_left"].alignx = "left";
        level._id_4AEC["hud_text_left"].aligny = "top";
        level._id_4AEC["hud_text_left"]._id_01F3 = "left_adjustable";
        level._id_4AEC["hud_text_left"]._id_0501 = "top_adjustable";
        level._id_4AEC["hud_text_left"] _meth_80CE( "ac130_overlay_left_side_txt", _1080tovirtualcoords( 180 ), _1080tovirtualcoords( 360 ) );
        level._id_4AEC["hud_text_left"].alpha = level.textimagealpha;
        level._id_4AEC["hud_text_right"] = _func_1A9();
        level._id_4AEC["hud_text_right"]._id_0530 = _1080tovirtualcoords( -57 );
        level._id_4AEC["hud_text_right"]._id_0538 = _1080tovirtualcoords( 186 );
        level._id_4AEC["hud_text_right"].alignx = "right";
        level._id_4AEC["hud_text_right"].aligny = "top";
        level._id_4AEC["hud_text_right"]._id_01F3 = "right_adjustable";
        level._id_4AEC["hud_text_right"]._id_0501 = "top_adjustable";
        level._id_4AEC["hud_text_right"] _meth_80CE( "ac130_overlay_right_side_txt", _1080tovirtualcoords( 64 ), _1080tovirtualcoords( 748 ) );
        level._id_4AEC["hud_text_right"].alpha = level.textimagealpha;
        level._id_4AEC["hud_text_bottom"] = _func_1A9();
        level._id_4AEC["hud_text_bottom"]._id_0530 = -13;
        level._id_4AEC["hud_text_bottom"]._id_0538 = _1080tovirtualcoords( -21 );
        level._id_4AEC["hud_text_bottom"].alignx = "center";
        level._id_4AEC["hud_text_bottom"].aligny = "bottom";
        level._id_4AEC["hud_text_bottom"]._id_01F3 = "center_adjustable";
        level._id_4AEC["hud_text_bottom"]._id_0501 = "bottom_adjustable";
        level._id_4AEC["hud_text_bottom"] _meth_80CE( level.bottom_shader, _1080tovirtualcoords( 328 ), _1080tovirtualcoords( 64 ) );
        level._id_4AEC["hud_text_bottom"].alpha = level.textimagealpha;
    }

    if ( getdvar( "ac130_hud_text_thermal" ) == "1" && !isdefined( level._id_244D ) )
    {
        level._id_4AEC["thermal_mode"] = _func_1A9();
        level._id_4AEC["thermal_mode"]._id_0530 = _1080tovirtualcoords( -250 );
        level._id_4AEC["thermal_mode"]._id_0538 = _1080tovirtualcoords( 178 );
        level._id_4AEC["thermal_mode"].alignx = "right";
        level._id_4AEC["thermal_mode"].aligny = "top";
        level._id_4AEC["thermal_mode"]._id_01F3 = "right_adjustable";
        level._id_4AEC["thermal_mode"]._id_0501 = "top_adjustable";
        level._id_4AEC["thermal_mode"] _meth_80CE( level.whot_shader, _1080tovirtualcoords( 188 ), _1080tovirtualcoords( 64 ) );
        level._id_4AEC["thermal_mode"].alpha = level.textimagealpha;
    }

    if ( getdvar( "ac130_hud_text_weapons" ) == "1" && !isdefined( level._id_244D ) )
    {
        level._id_4AEC["weapon_text"][0] = _func_1A9();
        level._id_4AEC["weapon_text"][0]._id_0530 = _1080tovirtualcoords( 60 );
        level._id_4AEC["weapon_text"][0]._id_0538 = _1080tovirtualcoords( -83 );
        level._id_4AEC["weapon_text"][0].alignx = "left";
        level._id_4AEC["weapon_text"][0].aligny = "bottom";
        level._id_4AEC["weapon_text"][0]._id_01F3 = "left_adjustable";
        level._id_4AEC["weapon_text"][0]._id_0501 = "bottom_adjustable";
        level._id_4AEC["weapon_text"][0] _meth_80CE( "ac130_overlay_105mm_txt", _1080tovirtualcoords( 240 ), _1080tovirtualcoords( 64 ) );
        level._id_4AEC["weapon_text"][1] = _func_1A9();
        level._id_4AEC["weapon_text"][1]._id_0530 = _1080tovirtualcoords( 45 );
        level._id_4AEC["weapon_text"][1]._id_0538 = _1080tovirtualcoords( -145 );
        level._id_4AEC["weapon_text"][1].alignx = "left";
        level._id_4AEC["weapon_text"][1].aligny = "bottom";
        level._id_4AEC["weapon_text"][1]._id_01F3 = "left_adjustable";
        level._id_4AEC["weapon_text"][1]._id_0501 = "bottom_adjustable";
        level._id_4AEC["weapon_text"][1] _meth_80CE( "ac130_overlay_40mm_txt", _1080tovirtualcoords( 240 ), _1080tovirtualcoords( 64 ) );
        level._id_4AEC["weapon_text"][2] = _func_1A9();
        level._id_4AEC["weapon_text"][2]._id_0530 = _1080tovirtualcoords( 46 );
        level._id_4AEC["weapon_text"][2]._id_0538 = _1080tovirtualcoords( -207 );
        level._id_4AEC["weapon_text"][2].alignx = "left";
        level._id_4AEC["weapon_text"][2].aligny = "bottom";
        level._id_4AEC["weapon_text"][2]._id_01F3 = "left_adjustable";
        level._id_4AEC["weapon_text"][2]._id_0501 = "bottom_adjustable";
        level._id_4AEC["weapon_text"][2] _meth_80CE( "ac130_overlay_25mm_txt", _1080tovirtualcoords( 240 ), _1080tovirtualcoords( 64 ) );
    }

    thread hud_timer();
    thread overlay_coords();
    thread blink_hud_elem( 0 );
    level._id_4AEC["grain"] = _func_1A9();
    level._id_4AEC["grain"]._id_0530 = 0;
    level._id_4AEC["grain"]._id_0538 = 0;
    level._id_4AEC["grain"].alignx = "left";
    level._id_4AEC["grain"].aligny = "top";
    level._id_4AEC["grain"]._id_01F3 = "fullscreen";
    level._id_4AEC["grain"]._id_0501 = "fullscreen";
    level._id_4AEC["grain"] _meth_80CE( "ac130_overlay_grain", 640, 480 );
    level._id_4AEC["grain"].alpha = 0.4;
    level._id_4AEC["grain"]._id_03D4 = -3;
    level._id_4AEC["zoom_blur"] = _func_1A9();
    level._id_4AEC["zoom_blur"]._id_0530 = 0;
    level._id_4AEC["zoom_blur"]._id_0538 = 0;
    level._id_4AEC["zoom_blur"].alignx = "left";
    level._id_4AEC["zoom_blur"].aligny = "top";
    level._id_4AEC["zoom_blur"]._id_01F3 = "fullscreen";
    level._id_4AEC["zoom_blur"]._id_0501 = "fullscreen";
    level._id_4AEC["zoom_blur"].alpha = 0.0;
    level._id_4AEC["zoom_blur"]._id_03D4 = 6;
    level._id_4AEC["screen_overlay"] = _func_1A9();
    level._id_4AEC["screen_overlay"]._id_0530 = 0;
    level._id_4AEC["screen_overlay"]._id_0538 = 0;
    level._id_4AEC["screen_overlay"].alignx = "left";
    level._id_4AEC["screen_overlay"].aligny = "top";
    level._id_4AEC["screen_overlay"]._id_01F3 = "fullscreen";
    level._id_4AEC["screen_overlay"]._id_0501 = "fullscreen";
    level._id_4AEC["screen_overlay"] _meth_80CE( "h1_ac130_screen_overlay", 640, 480 );
    level._id_4AEC["screen_overlay"].alpha = 1.0;
    level._id_4AEC["screen_overlay"]._id_03D4 = -2;
    level._id_4AEC["screen_distort"] = _func_1A9();
    level._id_4AEC["screen_distort"]._id_0530 = 0;
    level._id_4AEC["screen_distort"]._id_0538 = 0;
    level._id_4AEC["screen_distort"].alignx = "left";
    level._id_4AEC["screen_distort"].aligny = "top";
    level._id_4AEC["screen_distort"]._id_01F3 = "fullscreen";
    level._id_4AEC["screen_distort"]._id_0501 = "fullscreen";
    level._id_4AEC["screen_distort"] _meth_80CE( "h1_ac130_distort", 640, 480 );
    level._id_4AEC["screen_distort"].alpha = 1.0;
    level._id_4AEC["screen_distort"]._id_03D4 = 5;
    thread ac130shellshock();
    thread blur_thread();
}

check_disable_screen_fx()
{
    if ( getdvarint( "ac130_no_screenfx" ) )
    {
        setdvar( "ac130_post_effects_enabled", 0 );
        return 1;
    }

    return 0;
}

blur_thread()
{
    if ( check_disable_screen_fx() )
        return;

    setdvar( "ac130_blur_set", 0 );
    thread reset_blur_flag();
    level endon( "missionfailed" );

    for (;;)
    {
        if ( !getdvarint( "ac130_blur_set" ) )
        {
            _func_074( 1.1, 0 );
            setdvar( "ac130_blur_set", 1 );
        }

        waittillframeend;
    }
}

reset_blur_flag()
{
    level waittill( "missionfailed" );
    setdvar( "ac130_blur_set", 0 );
}

huditemsoff()
{
    for (;;)
    {
        if ( getdvarint( "ac130_post_effects_enabled" ) == 0 )
            break;

        wait 1.0;
    }

    level notify( "post_effects_disabled" );
    _func_074( 0, 0 );
    var_0 = [];
    var_0[var_0.size] = "hud_text_top";
    var_0[var_0.size] = "hud_text_left";
    var_0[var_0.size] = "hud_text_right";
    var_0[var_0.size] = "hud_text_bottom";
    var_0[var_0.size] = "thermal_mode";
    var_0[var_0.size] = "grain";
    var_0[var_0.size] = "timer";
    var_0[var_0.size] = "coordinate_long";
    var_0[var_0.size] = "coordinate_lat";
    var_0[var_0.size] = "coordinate_agl";
    var_0[var_0.size] = "screen_overlay";
    var_0[var_0.size] = "screen_distort";

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( level._id_4AEC[var_0[var_1]] ) )
        {
            if ( !_func_0CE( level._id_4AEC[var_0[var_1]] ) )
            {
                level._id_4AEC[var_0[var_1]] _meth_808A();
                continue;
            }

            foreach ( var_3 in level._id_4AEC[var_0[var_1]] )
                var_3 _meth_808A();
        }
    }
}

hud_timer()
{
    if ( getdvar( "ac130_hud_text_misc" ) == "0" )
        return;

    if ( isdefined( level._id_244D ) )
        return;

    level endon( "post_effects_disabled" );
    level._id_4AEC["timer"] = [];
    var_0 = [];
    var_0[0] = _1080tovirtualcoords( 288 );
    var_0[1] = _1080tovirtualcoords( 330 );
    var_0[2] = _1080tovirtualcoords( 400 );
    var_0[3] = _1080tovirtualcoords( 442 );
    var_0[4] = _1080tovirtualcoords( 366 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        level._id_4AEC["timer"][var_1] = _func_1A9();
        level._id_4AEC["timer"][var_1]._id_0530 = var_0[var_1] * -1;
        level._id_4AEC["timer"][var_1]._id_0538 = _1080tovirtualcoords( 87 ) * -1;
        level._id_4AEC["timer"][var_1].alignx = "right";
        level._id_4AEC["timer"][var_1].aligny = "bottom";
        level._id_4AEC["timer"][var_1]._id_01F3 = "right_adjustable";
        level._id_4AEC["timer"][var_1]._id_0501 = "bottom_adjustable";
        level._id_4AEC["timer"][var_1].alpha = level.textimagealpha;
    }

    level._id_4AEC["timer"][4]._id_0538 = _1080tovirtualcoords( 80 ) * -1;
    level waittill( "start_clock" );
    var_2 = gettime();
    level._id_4AEC["timer"][4] _meth_80CE( "ac130_overlay_timer_txt", _1080tovirtualcoords( 42 ), _1080tovirtualcoords( 64 ) );

    for (;;)
    {
        var_3 = gettime() - var_2;
        var_4 = millisecondstoshaders( var_3 );

        for ( var_1 = 0; var_1 < 4; var_1++ )
            level._id_4AEC["timer"][var_1] _meth_80CE( var_4[var_1], _1080tovirtualcoords( 42 ), _1080tovirtualcoords( 55 ) );

        wait 1;
    }
}

millisecondstoshaders( var_0 )
{
    var_0 = _func_0BF( var_0, 5999000 );
    var_1 = _func_0BC( _func_0E2( var_0 / 60000 ) );
    var_0 -= var_1 * 60000;
    var_2 = _func_0BC( _func_0E2( var_0 / 1000 ) );
    var_3 = _func_0BC( _func_0E2( var_1 / 10 ) );
    var_4 = var_1 - var_3 * 10;
    var_5 = _func_0BC( _func_0E2( var_2 / 10 ) );
    var_6 = var_2 - var_5 * 10;
    var_7[3] = "ac130_overlay_" + var_3 + "_number";
    var_7[2] = "ac130_overlay_" + var_4 + "_number";
    var_7[1] = "ac130_overlay_" + var_5 + "_number";
    var_7[0] = "ac130_overlay_" + var_6 + "_number";
    return var_7;
}

numbertoshaders( var_0 )
{
    var_1 = [];
    var_2 = 0;

    for ( var_0 = _func_0BC( _func_0E2( var_0 ) ); var_0 > 0; var_2 += 1 )
    {
        var_1[var_2] = "ac130_overlay_" + var_0 % 10 + "_number";
        var_0 = _func_0BC( _func_0E2( var_0 / 10 ) );
    }

    return var_1;
}

_1080tovirtualcoords( var_0 )
{
    return _func_0BC( _func_0E2( var_0 * 480 / 1080 ) );
}

overlay_coords()
{
    if ( getdvar( "ac130_hud_text_misc" ) == "0" )
        return;

    if ( isdefined( level._id_244D ) )
        return;

    level._id_4AEC["coordinate_long"] = [];
    level._id_4AEC["coordinate_lat"] = [];
    level._id_4AEC["coordinate_agl_txt"] = [];
    var_0 = 5;
    var_1 = 6;

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        level._id_4AEC["coordinate_long"][var_2] = _func_1A9();
        level._id_4AEC["coordinate_long"][var_2]._id_0530 = _1080tovirtualcoords( 340 + var_2 * 40 ) * -1;
        level._id_4AEC["coordinate_long"][var_2]._id_0538 = _1080tovirtualcoords( 80 );
        level._id_4AEC["coordinate_long"][var_2].alignx = "right";
        level._id_4AEC["coordinate_long"][var_2].aligny = "top";
        level._id_4AEC["coordinate_long"][var_2]._id_01F3 = "right_adjustable";
        level._id_4AEC["coordinate_long"][var_2]._id_0501 = "top_adjustable";
        level._id_4AEC["coordinate_lat"][var_2] = _func_1A9();
        level._id_4AEC["coordinate_lat"][var_2]._id_0530 = _1080tovirtualcoords( 70 + var_2 * 40 ) * -1;
        level._id_4AEC["coordinate_lat"][var_2]._id_0538 = _1080tovirtualcoords( 80 );
        level._id_4AEC["coordinate_lat"][var_2].alignx = "right";
        level._id_4AEC["coordinate_lat"][var_2].aligny = "top";
        level._id_4AEC["coordinate_lat"][var_2]._id_01F3 = "right_adjustable";
        level._id_4AEC["coordinate_lat"][var_2]._id_0501 = "top_adjustable";
    }

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        level._id_4AEC["coordinate_agl_txt"][var_2] = _func_1A9();
        level._id_4AEC["coordinate_agl_txt"][var_2]._id_0530 = _1080tovirtualcoords( 220 + var_2 * 40 ) * -1;
        level._id_4AEC["coordinate_agl_txt"][var_2]._id_0538 = _1080tovirtualcoords( 134 );
        level._id_4AEC["coordinate_agl_txt"][var_2].alignx = "right";
        level._id_4AEC["coordinate_agl_txt"][var_2].aligny = "top";
        level._id_4AEC["coordinate_agl_txt"][var_2]._id_01F3 = "right_adjustable";
        level._id_4AEC["coordinate_agl_txt"][var_2]._id_0501 = "top_adjustable";
    }

    level._id_4AEC["coordinate_agl"] = _func_1A9();
    level._id_4AEC["coordinate_agl"]._id_0530 = _1080tovirtualcoords( -58 );
    level._id_4AEC["coordinate_agl"]._id_0538 = _1080tovirtualcoords( 124 );
    level._id_4AEC["coordinate_agl"].alignx = "right";
    level._id_4AEC["coordinate_agl"].aligny = "top";
    level._id_4AEC["coordinate_agl"]._id_01F3 = "right_adjustable";
    level._id_4AEC["coordinate_agl"]._id_0501 = "top_adjustable";
    level._id_4AEC["coordinate_agl"] _meth_80CE( level.agl_shader, _1080tovirtualcoords( 144 ), _1080tovirtualcoords( 64 ) );
    level._id_4AEC["coordinate_agl"].alpha = level.textimagealpha;
    level endon( "post_effects_disabled" );
    wait 0.05;

    for (;;)
    {
        var_3 = numbertoshaders( _func_0BE( level._id_0318._id_02E2[0] ) );
        var_4 = numbertoshaders( _func_0BE( level._id_0318._id_02E2[1] ) );

        for ( var_2 = 0; var_2 < var_0; var_2++ )
        {
            if ( isdefined( var_3[var_2] ) )
            {
                level._id_4AEC["coordinate_long"][var_2] _meth_80CE( var_3[var_2], _1080tovirtualcoords( 42 ), _1080tovirtualcoords( 55 ) );
                level._id_4AEC["coordinate_long"][var_2].alpha = level.textimagealpha;
            }
            else
                level._id_4AEC["coordinate_long"][var_2].alpha = 0;

            if ( isdefined( var_4[var_2] ) )
            {
                level._id_4AEC["coordinate_lat"][var_2] _meth_80CE( var_4[var_2], _1080tovirtualcoords( 42 ), _1080tovirtualcoords( 55 ) );
                level._id_4AEC["coordinate_lat"][var_2].alpha = level.textimagealpha;
                continue;
            }

            level._id_4AEC["coordinate_lat"][var_2].alpha = 0;
        }

        var_5 = _func_08F( level._id_0318._id_02E2, level._id_0318._id_02E2 - ( 0, 0, 100000 ) );

        if ( isdefined( var_5 ) && isdefined( var_5[2] ) )
        {
            var_6 = ( level._id_0318._id_02E2[2] - var_5[2] ) * 1.5;
            var_7 = numbertoshaders( var_6 );

            for ( var_2 = 0; var_2 < var_1; var_2++ )
            {
                if ( isdefined( var_7[var_2] ) )
                {
                    level._id_4AEC["coordinate_agl_txt"][var_2] _meth_80CE( var_7[var_2], _1080tovirtualcoords( 40 ), _1080tovirtualcoords( 55 ) );
                    level._id_4AEC["coordinate_agl_txt"][var_2].alpha = level.textimagealpha;
                    continue;
                }

                level._id_4AEC["coordinate_agl_txt"][var_2].alpha = 0;
            }
        }

        wait(0.75 + _func_0B3( 2 ));
    }
}

ac130shellshock()
{
    if ( check_disable_screen_fx() )
        return;

    level endon( "post_effects_disabled" );
    var_0 = 5;

    for (;;)
    {
        level._id_0318 _meth_8186( "ac130", var_0 );
        wait(var_0);
    }
}

_id_7603( var_0 )
{
    level notify( "stop_rotatePlane_thread" );
    level endon( "stop_rotatePlane_thread" );

    if ( var_0 == "on" )
    {
        var_1 = 10;
        var_2 = level.ac130_speed["rotate"] / 360 * var_1;
        level._id_06CE _meth_82B3( level._id_06CE.angles[2] + var_1, var_2, var_2, 0 );

        for (;;)
        {
            level._id_06CE _meth_82B3( 360, level.ac130_speed["rotate"] );
            wait(level.ac130_speed["rotate"]);
        }
    }
    else if ( var_0 == "off" )
    {
        var_3 = 10;
        var_2 = level.ac130_speed["rotate"] / 360 * var_3;
        level._id_06CE _meth_82B3( level._id_06CE.angles[2] + var_3, var_2, 0, var_2 );
    }
}

attachplayer()
{
    level._id_0318 _meth_807F( level._id_06CE, "tag_player", 1.0, 65, 65, 40, 40 );
    wait 0.05;
    level._id_0318 _meth_811C( 0 );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_8337( level._id_06CE _meth_8185( "tag_player" ) );
    _func_0D6( "ammoCounterHide", "1" );
    _func_0D6( "hud_showStance", 0 );
}

getrealac130angles()
{
    for ( var_0 = level._id_06CE.angles[1]; var_0 >= 360; var_0 -= 360 )
    {

    }

    while ( var_0 < 0 )
        var_0 += 360;

    return var_0;
}

getflyingac130anglestopoint( var_0 )
{
    var_1 = _func_115( level._id_06CE._id_02E2 - var_0 );

    for ( var_1 = var_1[1] + 90; var_1 >= 360; var_1 -= 360 )
    {

    }

    while ( var_1 < 0 )
        var_1 += 360;

    return var_1;
}

moveplanetowaypoint( var_0, var_1 )
{
    var_2 = getent( var_0, "targetname" );
    moveplanetopoint( var_2._id_02E2, var_1 );
}

moveplanetopoint( var_0, var_1 )
{
    level notify( "ac130_reposition" );
    level endon( "ac130_reposition" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = _func_0EE( level._id_06CE._id_02E2, var_0 );
    var_3 = var_2 / level.ac130_speed["move"];

    if ( var_3 <= 0 )
        return;

    var_4 = var_3 / 2;
    var_5 = var_3 / 2;

    if ( var_1 )
    {
        thread _id_7603( "off" );
        var_6 = getflyingac130anglestopoint( var_0 ) - getrealac130angles();

        if ( var_6 < 0 )
            var_6 = 360 - _func_0BE( var_6 );

        var_7 = 0;
        var_8 = 20;

        if ( var_6 > 0 && var_6 <= var_8 )
            var_7 = 1;

        if ( var_6 > 360 - var_8 && var_6 < 360 )
            var_7 = 1;

        if ( !var_7 )
        {
            var_9 = level.ac130_speed["rotate"] / 360 * var_6;
            var_10 = 0;

            if ( var_9 > 3.0 )
                var_10 = 3.0;

            level._id_06CE _meth_82B3( var_6, var_9, 0, var_10 );
            wait(var_9 - var_10);
            thread ac130_move_out();
        }
    }

    level._id_06CE _meth_82AA( var_0, var_3, var_4, var_5 );

    if ( var_3 > 2.0 )
    {
        wait(var_3 - 2.0);
        level notify( "ac130_almost_at_destination" );

        if ( var_1 )
            thread _id_7603( "on" );

        wait 2.0;
    }
    else
    {
        wait(var_3);

        if ( var_1 )
            thread _id_7603( "on" );
    }
}
#using_animtree("ac130");

ac130_move_in()
{
    if ( isdefined( level.ac130_moving_in ) )
        return;

    level.ac130_moving_in = 1;
    level.ac130_moving_out = undefined;
    thread context_sensative_dialog_play_random_group_sound( "plane", "rolling_in", 1 );
    level._id_06CE _meth_8117( #animtree );
    level._id_06CE _meth_8113( "ac130_move_in", %ac130_move_in, 1.0, 0.2, 0.1 );
    level._id_06CE waittillmatch( "ac130_move_in", "end" );
    level.ac130_moving_in = undefined;
}

ac130_move_out()
{
    if ( isdefined( level.ac130_moving_out ) )
        return;

    level.ac130_moving_out = 1;
    level.ac130_moving_in = undefined;
    level._id_06CE _meth_8117( #animtree );
    level._id_06CE _meth_8113( "ac130_move_out", %ac130_move_out, 1.0, 0.2, 0.3 );
    level._id_06CE waittillmatch( "ac130_move_out", "end" );
    level.ac130_moving_out = undefined;
}

_id_1C85()
{
    level.ac130_weapon = [];
    level.ac130_weapon[0] = spawnstruct();
    level.ac130_weapon[0]._id_65F6 = "ac130_overlay_105mm";
    level.ac130_weapon[0]._id_019A = "55";
    level.ac130_weapon[0]._id_02A7 = "105mm";
    level.ac130_weapon[0]._id_8F53 = &"AC130_HUD_WEAPON_105MM";
    level.ac130_weapon[0]._id_4AE7 = -20;
    level.ac130_weapon[0].blur = "h1_ac130_blur_105mm";
    level.ac130_weapon[1] = spawnstruct();
    level.ac130_weapon[1]._id_65F6 = "ac130_overlay_40mm";
    level.ac130_weapon[1]._id_019A = "25";
    level.ac130_weapon[1]._id_02A7 = "40mm";
    level.ac130_weapon[1]._id_8F53 = &"AC130_HUD_WEAPON_40MM";
    level.ac130_weapon[1]._id_4AE7 = -40;
    level.ac130_weapon[1].blur = "h1_ac130_blur_40mm";
    level.ac130_weapon[2] = spawnstruct();
    level.ac130_weapon[2]._id_65F6 = "ac130_overlay_25mm";
    level.ac130_weapon[2]._id_019A = "10";
    level.ac130_weapon[2]._id_02A7 = "25mm";
    level.ac130_weapon[2]._id_8F53 = &"AC130_HUD_WEAPON_25MM";
    level.ac130_weapon[2]._id_4AE7 = -60;
    level.ac130_weapon[2].blur = "h1_ac130_blur_25mm";

    if ( getdvar( "ac130_alternate_controls" ) == "0" )
    {
        level.ac130_weapon[0]._id_0513 = "ac130_105mm";
        level.ac130_weapon[1]._id_0513 = "ac130_40mm";
        level.ac130_weapon[2]._id_0513 = "ac130_25mm";
    }
    else
    {
        level.ac130_weapon[0]._id_0513 = "ac130_105mm_alt";
        level.ac130_weapon[1]._id_0513 = "ac130_40mm_alt";
        level.ac130_weapon[2]._id_0513 = "ac130_25mm_alt";
    }

    var_0 = 0;
    level._id_252D = level.ac130_weapon[var_0]._id_02A7;
    thread fire_screenshake();

    if ( isdefined( level._id_244D ) )
        return;

    notifyoncommand( "switch_ac130_weapons", "weapnext" );

    for (;;)
    {
        level._id_0318 waittill( "switch_ac130_weapons" );

        if ( isdefined( level.doing_cinematic ) )
        {
            wait 0.05;
            continue;
        }

        level._id_0318 notify( "shot weapon" );
        var_0++;

        if ( var_0 >= level.ac130_weapon.size )
            var_0 = 0;

        level._id_252D = level.ac130_weapon[var_0]._id_02A7;

        if ( isdefined( level.ac130_weapon[var_0].blur ) )
        {
            level._id_4AEC["zoom_blur"] _meth_80CE( level.ac130_weapon[var_0].blur, 640, 480 );
            level._id_4AEC["zoom_blur"].alpha = 1.0;
        }
        else
            level._id_4AEC["zoom_blur"].alpha = 0.0;

        level._id_4AEC["crosshairs"] _meth_80CE( level.ac130_weapon[var_0]._id_65F6, 640, 480 );
        thread blink_crosshairs( level.ac130_weapon[var_0]._id_0513 );
        thread blink_hud_elem( var_0 );

        if ( getdvar( "ac130_alternate_controls" ) == "0" )
            _func_0D6( "cg_fov", level.ac130_weapon[var_0]._id_019A );

        level._id_0318 _meth_830D();
        level._id_0318 _meth_830B( level.ac130_weapon[var_0]._id_0513 );
        level._id_6D93 = level.ac130_weapon[var_0]._id_0513;
        level._id_0318 _meth_8312( level.ac130_weapon[var_0]._id_0513 );
        setammo();
        level._id_0318 thread _id_A5A4::_id_69C4( "ac130_weapon_switch" );

        if ( var_0 == 0 )
            common_scripts\utility::_id_383F( "player_changed_weapons_back" );

        common_scripts\utility::_id_383F( "player_changed_weapons" );
    }
}

blink_hud_elem( var_0 )
{
    level notify( "blinking_weapon_name_hud_elem" );
    level endon( "blinking_weapon_name_hud_elem" );

    if ( !isdefined( level._id_4AEC["weapon_text"] ) )
        return;

    for ( var_1 = 0; var_1 < level._id_4AEC["weapon_text"].size; var_1++ )
        level._id_4AEC["weapon_text"][var_1].alpha = 0.5;

    level._id_4AEC["weapon_text"][var_0].alpha = 1;

    for (;;)
    {
        level._id_4AEC["weapon_text"][var_0] _meth_8086( 0.2 );
        level._id_4AEC["weapon_text"][var_0].alpha = 0;
        wait 0.2;
        level._id_4AEC["weapon_text"][var_0] _meth_8086( 0.2 );
        level._id_4AEC["weapon_text"][var_0].alpha = 1;
        wait 0.2;
    }
}

blink_crosshairs( var_0 )
{
    level notify( "stop_blinking_crosshairs" );
    level endon( "stop_blinking_crosshairs" );
    level._id_4AEC["crosshairs"].alpha = 1;

    if ( !_func_120( _func_123( var_0 ), "105" ) )
        return;

    waitframe;

    if ( level.weaponreadytofire[var_0] )
        return;

    for (;;)
    {
        level._id_4AEC["crosshairs"] _meth_8086( 0.3 );
        level._id_4AEC["crosshairs"].alpha = 0;
        wait 0.3;
        level._id_4AEC["crosshairs"] _meth_8086( 0.3 );
        level._id_4AEC["crosshairs"].alpha = 1;
        wait 0.3;
    }
}

blink_crosshairs_stop()
{
    level notify( "stop_blinking_crosshairs" );
    level._id_4AEC["crosshairs"].alpha = 1;
}

weaponfiredthread()
{
    for (;;)
    {
        level._id_0318 waittill( "weapon_fired" );
        var_0 = level._id_0318 _meth_8309();

        if ( !level.weaponreadytofire[var_0[0]] )
            continue;

        if ( var_0[0] == "ac130_105mm" )
            level._id_0318 _meth_809C( "ac130_105mm_fire" );
        else if ( var_0[0] == "ac130_40mm" )
            level._id_0318 _meth_809C( "ac130_40mm_fire" );

        thread blink_crosshairs( var_0[0] );
        thread weaponreload( var_0[0] );
    }
}

ac130_25mm_loop_fire_sound()
{
    var_0 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_0 _meth_804F( level._id_0318 );

    for (;;)
    {
        var_1 = level._id_0318 _meth_8309();

        if ( level._id_0318 _meth_812F() && var_1[0] == "ac130_25mm" && !level._id_0318 _meth_8130() )
        {
            var_0 _meth_8077( "ac130_25mm_fire" );

            while ( level._id_0318 _meth_812F() )
                wait 0.05;

            var_0 _meth_80AD();
            var_0 _meth_809C( "ac130_25mm_tail_cn" );
        }

        wait 0.05;
    }
}

ac130_25mm_loop_rumble()
{
    var_0 = spawn( "script_origin", level._id_0318._id_02E2 );
    var_0 _meth_804F( level._id_0318 );
    var_1 = 0;

    for (;;)
    {
        var_2 = level._id_0318 _meth_8309();
        var_3 = level._id_0318 _meth_812F() && var_2[0] == "ac130_25mm";

        if ( !var_1 && var_3 )
            var_0 _meth_80B0( "ac130_25mm_fire" );
        else if ( var_1 && !var_3 )
            var_0 _meth_80B1( "ac130_25mm_fire" );

        var_1 = var_3;
        wait 0.05;
    }
}

weaponreload( var_0 )
{
    level.weaponreadytofire[var_0] = 0;
    wait(level.weaponreloadtime[var_0] - 0.05);
    level.weaponreadytofire[var_0] = 1;
    setammo();
}

invertthermal()
{
    if ( check_disable_screen_fx() )
        return;

    level._id_0318 endon( "death" );
    _id_A5A4::_id_7F00( "ac130", 0 );
    var_0 = "0";

    if ( isdefined( level._id_244D ) )
        return;

    notifyoncommand( "switch thermal", "+usereload" );
    notifyoncommand( "switch thermal", "+activate" );

    for (;;)
    {
        level._id_0318 waittill( "switch thermal" );

        if ( isdefined( level.doing_cinematic ) )
        {
            wait 0.05;
            continue;
        }

        if ( var_0 == "0" )
        {
            _id_A5A4::_id_7F00( "ac130_inverted", 0 );

            if ( isdefined( level._id_4AEC["thermal_mode"] ) )
                level._id_4AEC["thermal_mode"] _meth_80CE( level.bhot_shader, _1080tovirtualcoords( 188 ), _1080tovirtualcoords( 64 ) );

            var_0 = "1";
        }
        else
        {
            _id_A5A4::_id_7F00( "ac130", 0 );

            if ( isdefined( level._id_4AEC["thermal_mode"] ) )
                level._id_4AEC["thermal_mode"] _meth_80CE( level.whot_shader, _1080tovirtualcoords( 188 ), _1080tovirtualcoords( 64 ) );

            var_0 = "0";
        }

        if ( common_scripts\utility::_id_382E( "player_changed_thermal" ) )
            common_scripts\utility::_id_383F( "player_changed_thermal_back" );

        common_scripts\utility::_id_383F( "player_changed_thermal" );
    }
}

setammo()
{
    level notify( "setting_ammo" );
    level endon( "setting_ammo" );

    if ( common_scripts\utility::_id_382E( "clear_to_engage" ) )
        var_0 = 1;
    else
        var_0 = 0;

    var_1 = level._id_0318 _meth_8309();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( level.weaponreadytofire[var_1[var_2]] )
            level._id_0318 _meth_82F3( var_1[var_2], var_0 );
    }
}

failmissionforengaging()
{
    level endon( "clear_to_engage" );
    level._id_0318 waittill( "weapon_fired" );
    wait 2;

    if ( !common_scripts\utility::_id_382E( "mission_failed" ) )
    {
        common_scripts\utility::_id_383F( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_DO_NOT_ENGAGE" );
        _id_A5A4::_id_5CDF();
    }
}

nofirecrosshair()
{
    level endon( "clear_to_engage" );

    if ( common_scripts\utility::_id_382E( "clear_to_engage" ) )
        return;

    thread nofirecrosshair_remove();

    for (;;)
    {
        while ( level._id_0318 _meth_833A() )
        {
            if ( isdefined( level.doing_cinematic ) )
            {
                wait 0.05;
                break;
            }

            level._id_4AEC["crosshairs"] _meth_8086( 0.3 );
            level._id_4AEC["crosshairs"].alpha = 0;
            wait 0.3;
            level._id_4AEC["crosshairs"] _meth_8086( 0.3 );
            level._id_4AEC["crosshairs"].alpha = 1;
            wait 0.3;
        }

        wait 0.05;
    }
}

nofirecrosshair_remove()
{
    level waittill( "clear_to_engage" );
    thread setammo();
}

fire_screenshake()
{
    for (;;)
    {
        level._id_0318 waittill( "weapon_fired" );

        if ( level._id_252D == "105mm" )
        {
            if ( getdvar( "ac130_pre_engagement_mode" ) == "2" && !common_scripts\utility::_id_382E( "clear_to_engage" ) )
                continue;

            thread gun_fired_and_ready_105mm();
            _func_18C( 0.2, 1, level._id_0318._id_02E2, 1000 );
        }
        else if ( level._id_252D == "40mm" )
        {
            if ( getdvar( "ac130_pre_engagement_mode" ) == "2" && !common_scripts\utility::_id_382E( "clear_to_engage" ) )
                continue;

            _func_18C( 0.1, 0.5, level._id_0318._id_02E2, 1000 );
        }

        wait 0.05;
    }
}

_id_1FEE()
{
    level endon( "stop_clounds" );
    wait 6;
    _id_1FEF();

    for (;;)
    {
        wait(_func_0B5( 40, 80 ));
        _id_1FEF();
    }
}

_id_1FEF()
{
    if ( isdefined( level._id_6D93 ) && _func_120( _func_123( level._id_6D93 ), "25" ) )
        return;

    playfxontag( level._id_058F["cloud"], level._id_06CE, "tag_player" );
}

gun_fired_and_ready_105mm()
{
    level notify( "gun_fired_and_ready_105mm" );
    level endon( "gun_fired_and_ready_105mm" );
    wait 0.5;

    if ( _func_0B2( 2 ) == 0 )
        thread context_sensative_dialog_play_random_group_sound( "weapons", "105mm_fired" );

    wait 5.0;
    thread blink_crosshairs_stop();
    thread context_sensative_dialog_play_random_group_sound( "weapons", "105mm_ready" );
}

getfriendlyscenter()
{
    var_0 = undefined;
    var_1 = _func_0D9( "allies" );

    if ( !isdefined( var_1 ) )
        return ( 0, 0, 0 );

    if ( var_1.size <= 0 )
        return ( 0, 0, 0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( var_0 ) )
        {
            var_0 = var_1[var_2]._id_02E2;
            continue;
        }

        var_0 += var_1[var_2]._id_02E2;
    }

    var_0 = ( var_0[0] / var_1.size, var_0[1] / var_1.size, var_0[2] / var_1.size );
    return var_0;
}

_id_843F()
{
    for (;;)
    {
        level._id_0318 waittill( "projectile_impact", var_0, var_1, var_2 );
        thread shotfiredfriendlyproximity( var_0, var_1 );

        if ( _func_120( _func_123( var_0 ), "105" ) )
            thread shotfireddarkscreenoverlay();

        thread shotfiredbadplace( var_1, var_0 );

        if ( getdvar( "ac130_ragdoll_deaths" ) == "1" )
            thread _id_8440( var_1, var_0 );

        wait 0.05;
    }
}

shotfiredfriendlyproximity( var_0, var_1 )
{
    if ( !isdefined( level.weaponfriendlyclosedistance[var_0] ) )
        return;

    var_2 = var_1 - ( 0, 0, 50 );
    var_3 = level.weaponfriendlyclosedistance[var_0];
    var_4 = 300;
    var_5 = 10;
    var_6 = 1.0;
    var_7 = spawn( "trigger_radius", var_2, var_5, var_3, var_4 );
    level thread shotfiredfriendlyproximity_trigger( var_7, var_6 );

    if ( getdvar( "ac130_debug_weapons" ) == "1" )
    {
        thread _id_2682( var_2, var_3, var_6, level.color["white"], undefined, 1 );
        thread _id_2682( var_2 + ( 0, 0, var_4 ), var_3, var_6, level.color["white"], undefined, 1 );
    }
}

shotfiredfriendlyproximity_trigger( var_0, var_1 )
{
    var_0 endon( "timeout" );
    level thread shotfiredfriendlyproximity_trigger_timeout( var_0, var_1 );
    var_0 waittill( "trigger" );

    if ( isdefined( level.lastfriendlyproximitywarningplayed ) && gettime() - level.lastfriendlyproximitywarningplayed < 7000 )
        return;

    level.lastfriendlyproximitywarningplayed = gettime();
    thread playsoundoverradio( level._id_78BA["fco"]["ac130_fco_firingtoclose"], 1, 5.0 );
}

shotfiredfriendlyproximity_trigger_timeout( var_0, var_1 )
{
    wait(var_1);
    var_0 notify( "timeout" );
    var_0 delete();
}

shotfiredbadplace( var_0, var_1 )
{
    badplace_cylinder( "", level.badplaceduration[var_1], var_0, level.badplaceradius[var_1], level.badplaceradius[var_1], "axis" );

    if ( getdvar( "ac130_debug_weapons" ) == "1" )
        thread _id_2682( var_0, level.badplaceradius[var_1], level.badplaceduration[var_1], level.color["blue"], undefined, 1 );
}

_id_8440( var_0, var_1 )
{
    wait 0.1;
    _func_17E( var_0, level._id_6804[var_1], level._id_6804[var_1] / 2, level._id_6803[var_1] );
}

shotfireddarkscreenoverlay()
{
    level notify( "darkScreenOverlay" );
    level endon( "darkScreenOverlay" );

    if ( !isdefined( level._id_25F4 ) )
    {
        level._id_25F4 = _func_1A9();
        level._id_25F4._id_0530 = 0;
        level._id_25F4._id_0538 = 0;
        level._id_25F4.alignx = "left";
        level._id_25F4.aligny = "top";
        level._id_25F4._id_01F3 = "fullscreen";
        level._id_25F4._id_0501 = "fullscreen";
        level._id_25F4 _meth_80CE( "black", 640, 480 );
        level._id_25F4._id_03D4 = -10;
        level._id_25F4.alpha = 0.0;
    }

    level._id_25F4.alpha = 0.0;
    level._id_25F4 _meth_8086( 0.2 );
    level._id_25F4.alpha = 0.6;
    wait 0.4;
    level._id_25F4 _meth_8086( 0.8 );
    level._id_25F4.alpha = 0.0;
}

add_beacon_effect( var_0, var_1 )
{
    self endon( "death" );

    if ( isdefined( var_0 ) )
        level endon( var_0 );

    var_2 = 0.75;
    wait(_func_0B3( 3.0 ));

    for (;;)
    {
        if ( isdefined( var_1 ) && var_1 && isdefined( self.angles ) && isdefined( level._id_0318 ) )
        {
            var_3 = self.angles;
            var_4 = level._id_0318.angles;
            var_5 = _func_11B( var_4, var_3 );

            if ( var_5 < 30.0 || var_5 > 90.0 )
            {
                wait(var_2);
                continue;
            }
        }

        playfxontag( level._id_058F["beacon"], self, "j_spine4" );
        wait(var_2);
    }
}

vehicle_thermal_models()
{
    if ( !isdefined( self._id_029C ) )
        return;

    if ( self._id_029C == "vehicle_pickup_roobars" )
    {

    }

    if ( self._id_029C == "vehicle_ch46e_opened_door" )
        self _meth_80B3( "vehicle_ch46e_opened_door_ac130" );
}

spawn_callback_thread( var_0 )
{
    if ( isdefined( level.levelspecificspawnercallbackthread ) )
        thread [[ level.levelspecificspawnercallbackthread ]]( var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_04A7 ) )
        return;

    if ( var_0._id_04A7 == "axis" )
        thread enemy_killed_thread( var_0 );

    if ( getdvar( "ac130_target_markers" ) == "1" )
    {
        _func_09D( var_0, ( 0, 0, 32 ) );
        thread hud_target_blink( var_0 );
    }
}

hud_target_blink( var_0 )
{
    var_0 endon( "death" );

    while ( isdefined( var_0 ) )
    {
        _func_09F( var_0, "ac130_hud_target" );
        _func_0A0( var_0, "ac130_hud_target_offscreen" );
        level waittill( "hud_target_blink_off" );
        _func_09F( var_0, "ac130_hud_target_flash" );
        _func_0A0( var_0, "ac130_hud_target_flash" );
        level waittill( "hud_target_blink_on" );
    }
}

hud_target_blink_timer()
{
    for (;;)
    {
        level notify( "hud_target_blink_on" );
        wait 0.5;
        level notify( "hud_target_blink_off" );
        wait 0.2;
    }
}

enemy_killed_thread( var_0 )
{
    if ( var_0._id_04A7 != "axis" )
        return;

    if ( getdvar( "ac130_ragdoll_deaths" ) == "1" )
        var_0._id_85BA = 1;

    var_0 waittill( "death", var_1 );

    if ( isdefined( var_1 ) && var_1 == level._id_0318 )
        level.enemieskilledbyplayer++;

    if ( getdvar( "ac130_ragdoll_deaths" ) == "1" )
    {
        if ( isdefined( var_0._id_0102 ) && _func_120( var_0._id_0102, "25mm" ) )
            var_0._id_85BA = undefined;
    }

    thread context_sensative_dialog_kill( var_0, var_1 );
}

context_sensative_dialog()
{
    thread context_sensative_dialog_guy_in_sight();
    thread context_sensative_dialog_guy_crawling();
    thread context_sensative_dialog_guy_pain();
    thread context_sensative_dialog_guy_pain_falling();
    thread context_sensative_dialog_secondary_explosion_vehicle();
    thread context_sensative_dialog_kill_thread();
    thread context_sensative_dialog_locations();
    thread context_sensative_dialog_filler();
}

context_sensative_dialog_guy_in_sight()
{
    for (;;)
    {
        if ( context_sensative_dialog_guy_in_sight_check() )
            thread context_sensative_dialog_play_random_group_sound( "ai", "in_sight" );

        wait(_func_0B5( 1, 3 ));
    }
}

context_sensative_dialog_guy_in_sight_check()
{
    var_0 = _func_0D9( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isdefined( var_0[var_1] ) )
            continue;

        if ( !_func_1A1( var_0[var_1] ) )
            continue;

        if ( common_scripts\utility::_id_A347( level._id_0318 _meth_80AA(), level._id_0318 _meth_8338(), var_0[var_1]._id_02E2, level._id_2235["5"] ) )
            return 1;

        wait 0.05;
    }

    return 0;
}

context_sensative_dialog_guy_crawling()
{
    for (;;)
    {
        level waittill( "ai_crawling", var_0 );

        if ( isdefined( var_0 ) && isdefined( var_0._id_02E2 ) )
        {
            if ( getdvar( "ac130_debug_context_sensative_dialog" ) == "1" )
                thread _id_26AB( level._id_0318._id_02E2, var_0._id_02E2, 5.0, ( 0, 1, 0 ) );
        }

        thread context_sensative_dialog_play_random_group_sound( "ai", "wounded_crawl" );
    }
}

context_sensative_dialog_guy_pain_falling()
{
    for (;;)
    {
        level waittill( "ai_pain_falling", var_0 );

        if ( isdefined( var_0 ) && isdefined( var_0._id_02E2 ) )
        {
            if ( getdvar( "ac130_debug_context_sensative_dialog" ) == "1" )
                thread _id_26AB( level._id_0318._id_02E2, var_0._id_02E2, 5.0, ( 1, 0, 0 ) );
        }

        thread context_sensative_dialog_play_random_group_sound( "ai", "wounded_pain" );
    }
}

context_sensative_dialog_guy_pain()
{
    for (;;)
    {
        level waittill( "ai_pain", var_0 );

        if ( isdefined( var_0 ) && isdefined( var_0._id_02E2 ) )
        {
            if ( getdvar( "ac130_debug_context_sensative_dialog" ) == "1" )
                thread _id_26AB( level._id_0318._id_02E2, var_0._id_02E2, 5.0, ( 1, 0, 0 ) );
        }

        thread context_sensative_dialog_play_random_group_sound( "ai", "wounded_pain" );
    }
}

context_sensative_dialog_secondary_explosion_vehicle()
{
    for (;;)
    {
        level waittill( "vehicle_explosion", var_0 );
        wait 1;

        if ( isdefined( var_0 ) )
        {
            if ( getdvar( "ac130_debug_context_sensative_dialog" ) == "1" )
                thread _id_26AB( level._id_0318._id_02E2, var_0, 5.0, ( 0, 0, 1 ) );
        }

        thread context_sensative_dialog_play_random_group_sound( "explosion", "secondary" );
    }
}

context_sensative_dialog_kill( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( var_1 != level._id_0318 )
        return;

    level.enemieskilledintimewindow++;
    level notify( "enemy_killed" );

    if ( isdefined( var_0 ) && isdefined( var_0._id_02E2 ) )
    {
        if ( getdvar( "ac130_debug_context_sensative_dialog" ) == "1" )
            thread _id_26AB( level._id_0318._id_02E2, var_0._id_02E2, 5.0, ( 1, 1, 0 ) );
    }
}

context_sensative_dialog_kill_thread()
{
    var_0 = 1;

    for (;;)
    {
        level waittill( "enemy_killed" );
        wait(var_0);
        var_1 = "kill";
        var_2 = undefined;

        if ( level.enemieskilledintimewindow >= 5 )
            _id_A5A4::_id_41DD( "STRAIGHT_FLUSH" );

        if ( level.enemieskilledintimewindow >= 3 )
            var_2 = "large_group";
        else if ( level.enemieskilledintimewindow == 2 )
            var_2 = "small_group";
        else
        {
            var_2 = "single";

            if ( _func_0B2( 3 ) != 1 )
            {
                level.enemieskilledintimewindow = 0;
                continue;
            }
        }

        level.enemieskilledintimewindow = 0;
        thread context_sensative_dialog_play_random_group_sound( var_1, var_2, 1 );
    }
}

context_sensative_dialog_locations()
{
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_car", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "car" );
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_truck", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "truck" );
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_building", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "building" );
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_wall", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "wall" );
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_field", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "field" );
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_road", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "road" );
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_church", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "church" );
    common_scripts\utility::_id_0D13( getentarray( "context_dialog_ditch", "targetname" ), ::context_sensative_dialog_locations_add_notify_event, "ditch" );
    thread context_sensative_dialog_locations_thread();
}

context_sensative_dialog_locations_thread()
{
    for (;;)
    {
        level waittill( "context_location", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( !common_scripts\utility::_id_382E( "allow_context_sensative_dialog" ) )
            continue;

        thread context_sensative_dialog_play_random_group_sound( "location", var_0 );
        wait(5 + _func_0B3( 10 ));
    }
}

context_sensative_dialog_locations_add_notify_event( var_0 )
{
    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_1._id_04A7 ) || var_1._id_04A7 != "axis" )
            continue;

        level notify( "context_location", var_0 );
        wait 5;
    }
}

context_sensative_dialog_vehiclespawn( var_0 )
{
    if ( var_0._id_7AEF != "axis" )
        return;

    thread context_sensative_dialog_vehicledeath( var_0 );
    var_0 endon( "death" );

    while ( !common_scripts\utility::_id_A347( level._id_0318 _meth_80AA(), level._id_0318 _meth_8338(), var_0._id_02E2, level._id_2235["45"] ) )
        wait 0.5;

    context_sensative_dialog_play_random_group_sound( "vehicle", "incoming" );
}

context_sensative_dialog_vehicledeath( var_0 )
{
    var_0 waittill( "death" );
    thread context_sensative_dialog_play_random_group_sound( "vehicle", "death" );
}

context_sensative_dialog_filler()
{
    for (;;)
    {
        if ( isdefined( level.radio_in_use ) && level.radio_in_use == 1 )
            level waittill( "radio_not_in_use" );

        var_0 = gettime();

        if ( var_0 - level.lastradiotransmission >= 3000 )
        {
            level.lastradiotransmission = var_0;
            thread context_sensative_dialog_play_random_group_sound( "misc", "action" );
        }

        wait 0.25;
    }
}

context_sensative_dialog_play_random_group_sound( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !common_scripts\utility::_id_382E( "allow_context_sensative_dialog" ) )
    {
        if ( var_2 )
            common_scripts\utility::_id_384A( "allow_context_sensative_dialog" );
        else
            return;
    }

    var_3 = undefined;
    var_4 = _func_0B2( level._id_78BA[var_0][var_1].size );

    if ( level._id_78BA[var_0][var_1][var_4].played == 1 )
    {
        for ( var_5 = 0; var_5 < level._id_78BA[var_0][var_1].size; var_5++ )
        {
            var_4++;

            if ( var_4 >= level._id_78BA[var_0][var_1].size )
                var_4 = 0;

            if ( level._id_78BA[var_0][var_1][var_4].played == 1 )
                continue;

            var_3 = var_4;
            break;
        }

        if ( !isdefined( var_3 ) )
        {
            for ( var_5 = 0; var_5 < level._id_78BA[var_0][var_1].size; var_5++ )
                level._id_78BA[var_0][var_1][var_5].played = 0;

            var_3 = _func_0B2( level._id_78BA[var_0][var_1].size );
        }
    }
    else
        var_3 = var_4;

    if ( context_sensative_dialog_timedout( var_0, var_1, var_3 ) )
        return;

    level._id_78BA[var_0][var_1][var_3].played = 1;
    var_6 = _func_0B2( level._id_78BA[var_0][var_1][var_3].size );
    playsoundoverradio( level._id_78BA[var_0][var_1][var_3].sounds[var_6], var_2 );
}

context_sensative_dialog_timedout( var_0, var_1, var_2 )
{
    if ( !isdefined( level.context_sensative_dialog_timeouts ) )
        return 0;

    if ( !isdefined( level.context_sensative_dialog_timeouts[var_0] ) )
        return 0;

    if ( !isdefined( level.context_sensative_dialog_timeouts[var_0][var_1] ) )
        return 0;

    if ( isdefined( level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E ) && isdefined( level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E[_id_A5A4::_id_8F53( var_2 )] ) )
    {
        var_3 = gettime();

        if ( var_3 - level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E[_id_A5A4::_id_8F53( var_2 )]._id_9C42["lastPlayed"] < level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E[_id_A5A4::_id_8F53( var_2 )]._id_9C42["timeoutDuration"] )
            return 1;

        level.context_sensative_dialog_timeouts[var_0][var_1]._id_443E[_id_A5A4::_id_8F53( var_2 )]._id_9C42["lastPlayed"] = var_3;
    }
    else if ( isdefined( level.context_sensative_dialog_timeouts[var_0][var_1]._id_9C42 ) )
    {
        var_3 = gettime();

        if ( var_3 - level.context_sensative_dialog_timeouts[var_0][var_1]._id_9C42["lastPlayed"] < level.context_sensative_dialog_timeouts[var_0][var_1]._id_9C42["timeoutDuration"] )
            return 1;

        level.context_sensative_dialog_timeouts[var_0][var_1]._id_9C42["lastPlayed"] = var_3;
    }

    return 0;
}

playsoundoverradio( var_0, var_1, var_2 )
{
    if ( !isdefined( level.radio_in_use ) )
        level.radio_in_use = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_2 *= 1000;
    var_3 = gettime();
    var_4 = 0;
    var_4 = playaliasoverradio( var_0 );

    if ( var_4 )
        return;

    if ( !var_1 )
        return;

    level.radioforcedtransmissionqueue[level.radioforcedtransmissionqueue.size] = var_0;

    while ( !var_4 )
    {
        if ( level.radio_in_use )
            level waittill( "radio_not_in_use" );

        if ( var_2 > 0 && gettime() - var_3 > var_2 )
            break;

        var_4 = playaliasoverradio( level.radioforcedtransmissionqueue[0] );

        if ( !level.radio_in_use && !var_4 )
        {

        }
    }

    level.radioforcedtransmissionqueue = _id_A5A4::_id_0CFA( level.radioforcedtransmissionqueue, 0 );
}

playaliasoverradio( var_0 )
{
    if ( level.radio_in_use )
        return 0;

    level.radio_in_use = 1;
    level._id_0318 _meth_82F1( var_0, "playSoundOverRadio_done" );
    level._id_0318 waittill( "playSoundOverRadio_done" );
    level.radio_in_use = 0;
    level.lastradiotransmission = gettime();
    level notify( "radio_not_in_use" );
    return 1;
}

mission_fail_casualties()
{
    level endon( "stop_casualty_tracking" );

    if ( !isdefined( level.friendlycount ) )
        level.friendlycount = 0;

    level.friendlycount++;
    self waittill( "death" );
    level.friendlycount--;

    if ( level.friendlycount < level.minimumfriendlycount )
    {
        common_scripts\utility::_id_383F( "mission_failed" );
        setdvar( "ui_deadquote", "@AC130_FRIENDLIES_DEAD" );
        _id_A5A4::_id_5CDF();
    }
}

debug_friendly_count()
{
    while ( getdvar( "ac130_debug_friendly_count" ) != "1" )
        wait 1;

    if ( !isdefined( level.friendlycounthudelem ) )
    {
        level.friendlycounthudelem = _func_1A9();
        level.friendlycounthudelem._id_0530 = 0;
        level.friendlycounthudelem._id_0538 = 0;
        level.friendlycounthudelem._id_0189 = 2.5;
        level.friendlycounthudelem.alignx = "left";
        level.friendlycounthudelem.aligny = "bottom";
        level.friendlycounthudelem._id_01F3 = "left";
        level.friendlycounthudelem._id_0501 = "bottom";
        level.friendlycounthudelem._id_0241 = &"AC130_DEBUG_FRIENDLY_COUNT";
        level.friendlycounthudelem.alpha = 1;
    }

    level.friendlycounthudelem _meth_80D9( level.friendlycount );
    self waittill( "death" );
    level.friendlycounthudelem _meth_8086( 0.3 );
    level.friendlycounthudelem.alpha = 0;
    waitframe;
    level.friendlycounthudelem _meth_80D9( level.friendlycount );
    level.friendlycounthudelem _meth_8086( 0.3 );
    level.friendlycounthudelem.alpha = 1;
}

_id_2682( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 16;
    var_7 = 360 / var_6;
    var_8 = [];

    for ( var_9 = 0; var_9 < var_6; var_9++ )
    {
        var_10 = var_7 * var_9;
        var_11 = _func_0B7( var_10 ) * var_1;
        var_12 = _func_0B6( var_10 ) * var_1;
        var_13 = var_0[0] + var_11;
        var_14 = var_0[1] + var_12;
        var_15 = var_0[2];
        var_8[var_8.size] = ( var_13, var_14, var_15 );
    }

    if ( isdefined( var_4 ) )
        wait(var_4);

    thread _id_2683( var_8, var_2, var_3, var_5, var_0 );
}

_id_2683( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_3 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( var_5 + 1 >= var_0.size )
            var_7 = var_0[0];
        else
            var_7 = var_0[var_5 + 1];

        thread _id_26AB( var_6, var_7, var_1, var_2 );

        if ( var_3 )
            thread _id_26AB( var_4, var_6, var_1, var_2 );
    }
}

_id_26AB( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 1, 1, 1 );

    for ( var_4 = 0; var_4 < var_2 * 20; var_4++ )
        wait 0.05;
}

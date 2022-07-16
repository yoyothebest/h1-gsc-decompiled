// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !isdefined( level._id_3AE4 ) )
        level._id_3AE4 = [];

    level._id_3AE4["setsaveddvar"] = ::_func_0D6;
    level._id_3AE4["useanimtree"] = ::_meth_8117;
    level._id_3AE4["setanim"] = ::_meth_814D;
    level._id_3AE4["setanimknob"] = ::_meth_8145;
    level._id_3AE4["setflaggedanimknob"] = ::_meth_8154;
    level._id_3AE4["setflaggedanimknobrestart"] = ::_meth_810F;
    level._id_3AE4["setanimlimited"] = ::_meth_814E;
    level._id_3AE4["setanimtime"] = ::_meth_8119;
    level._id_3AE4["getanimtime"] = ::_meth_8151;
    level._id_3AE4["getanimlength"] = ::getanimlength;
    level._id_3AE4["clearanim"] = ::_meth_8144;
    level._id_3AE4["kill"] = ::_meth_8054;
    level._id_3AE4["magicgrenade"] = ::_func_072;
    _id_7E18();
    _id_A5A4::_id_7DF3();
    level._id_4224 = [];
    level._id_4224["_autosave_stealthcheck"] = ::_id_422C;
    level._id_4224["_patrol_endon_spotted_flag"] = ::_id_422C;
    level._id_4224["_spawner_stealth_default"] = ::_id_422C;
    level._id_4224["_idle_call_idle_func"] = ::_id_422C;
    common_scripts\utility::_id_383D( "_cloaked_stealth_enabled" );

    if ( !isdefined( level._id_9E7D ) )
        level._id_9E7D = "default";

    _func_0F9( level._id_9E7D );
    _func_0FA( "near_death" );
    level._id_3AE4["damagefeedback"] = _id_A524::_id_9B0C;
    common_scripts\utility::_id_0D13( getentarray( "script_model_pickup_claymore", "classname" ), ::_id_1E42 );
    common_scripts\utility::_id_0D13( getentarray( "ammo_cache", "targetname" ), ::_id_0B6F );
    _id_A5A4::_id_0CE5( getentarray( "trigger_multiple_softlanding", "classname" ) );

    if ( getdvar( "debug" ) == "" )
        setdvar( "debug", "0" );

    if ( getdvar( "fallback" ) == "" )
        setdvar( "fallback", "0" );

    if ( getdvar( "angles" ) == "" )
        setdvar( "angles", "0" );

    if ( getdvar( "noai" ) == "" )
        setdvar( "noai", "off" );

    if ( getdvar( "scr_RequiredMapAspectratio" ) == "" )
        setdvar( "scr_RequiredMapAspectratio", "1" );

    if ( getdvar( "music_enable" ) == "" )
        setdvar( "music_enable", "1" );

    setdvar( "ac130_player_num", -1 );
    setdvar( "ui_remotemissile_playernum", 0 );
    setdvar( "ui_pmc_won", 0 );
    setdvar( "ui_actionSlot_1_forceActive", "off" );
    setdvar( "ui_actionSlot_2_forceActive", "off" );
    setdvar( "ui_actionSlot_3_forceActive", "off" );
    setdvar( "ui_actionSlot_4_forceActive", "off" );
    setdvar( "ui_dog_grenade", 0 );
    setdvar( "ui_securing", "" );
    setdvar( "ui_securing_progress", 0.0 );
    setdvar( "hud_showObjectives", 1 );
    setdvar( "hud_showIntel", 1 );
    setdvar( "minimap_sp", 0 );
    setdvar( "minimap_full_sp", 0 );

    if ( !isdefined( anim._id_61E5 ) )
    {
        anim._id_61E5 = [];
        animscripts\notetracks::_id_72F3();
    }

    common_scripts\utility::_id_383D( "introscreen_complete" );
    _id_A5A4::_id_079C( "no_game", ::_id_8C16 );
    _id_0779();
    level._id_05E5 = 1;
    level._id_380E = 1;
    level._id_56D2 = 0;
    thread _id_7367();
    level._id_9F83 = [];
    level._id_76AB = [];
    level._id_76A7 = [];
    level._id_76AD = [];
    level._id_2BDE = [];
    level._id_06BD = [];

    if ( !isdefined( level._id_038E ) )
        level._id_038E = _func_123( getdvar( "mapname" ) );

    set_dynent_playerwakeupradius();
    precacheshader( "black" );
    precacheshader( "white" );
    precacheshader( "overlay_low_health_alt" );
    precacheshader( "overlay_low_health" );
    precacheshader( "overlay_low_health_compass" );
    precachestring( &"GAME_GET_TO_COVER" );
    level._id_0908 = 0;

    if ( !isdefined( level._id_382E ) )
        common_scripts\utility::_id_4CF0();
    else
    {
        var_0 = _func_1D3( level._id_382E );
        common_scripts\utility::_id_0CF0( var_0, ::_id_1CBC );
    }

    _id_4D06();

    if ( _func_140() )
        _func_0D6( "cg_fovScale", "0.75" );
    else
        _func_0D6( "cg_fovScale", "1" );

    level._id_70B8 = 0;
    common_scripts\utility::_id_383D( "respawn_friendlies" );
    common_scripts\utility::_id_383D( "missionfailed" );
    common_scripts\utility::_id_383D( "auto_adjust_initialized" );
    level._id_0318 _id_A5A4::_id_32DD( "_radiation_poisoning" );
    common_scripts\utility::_id_383D( "gameskill_selected" );
    common_scripts\utility::_id_383D( "battlechatter_on_thread_waiting" );
    common_scripts\utility::_id_383D( "start_is_set" );
    thread _id_A537::_id_06AA();
    thread _id_6AC7();
    level._id_278A = 190;
    _func_0D6( "g_speed", level._id_278A );

    if ( _id_A5A4::_id_5083() )
        _func_0D6( "sv_saveOnStartMap", 0 );
    else if ( isdefined( level._id_244D ) )
        _func_0D6( "sv_saveOnStartMap", 0 );
    else
        _func_0D6( "sv_saveOnStartMap", 1 );

    common_scripts\utility::_id_23C8( "mg42_drones" );
    common_scripts\utility::_id_23C8( "mg42_drones_target_trace" );
    level._id_2F30 = [];

    foreach ( var_3, var_2 in level._id_8F60 )
    {
        if ( !isdefined( var_2._id_04A6 ) )
            continue;

        if ( var_2._id_04A6 == "delete_on_load" )
            level._id_8F60[var_3] = undefined;
    }

    common_scripts\utility::_id_8F63();
    common_scripts\utility::_id_383D( "player_flashed" );
    level._id_214E = ::_meth_805A;
    level._id_2B39 = ::_meth_8059;
    level._id_1262 = ::badplace_cylinder;
    level._id_1263 = ::badplace_delete;
    level._id_50AC = ::_func_0CF;
    level._id_23EE = _id_A546::_id_23ED;
    level._id_4AFD = _id_A546::_id_7FEE;
    level._id_5940 = ::_meth_813B;
    level._id_3A26 = ::_meth_813C;
    level._id_54FC = ::_meth_80B4;
    level._id_54F9 = ::_meth_80B5;
    level._id_8D4F = _id_A56F::_id_72DF;
    level._id_8D4E = _id_A56F::_id_72E7;
    level._id_2D70 = 1;
    level._id_115E = 1;
    level._id_404C = ::_func_0C3;
    level._id_4047 = ::_func_0C4;
    level._id_07C6 = ::_meth_8043;

    if ( !isdefined( level._id_0601 ) )
        level._id_0601 = [];

    foreach ( var_5 in level._id_0323 )
    {
        var_5._id_0271 = level._id_0318._id_01E6;
        var_5._id_83BD = 0;
        var_5._id_4FAD = 0;
        var_5 thread _id_A263();
    }

    level._id_5541 = -5000;
    level._id_483A = [];
    thread _id_6ECE();

    for ( var_7 = 0; var_7 < level._id_0323.size; var_7++ )
    {
        var_5 = level._id_0323[var_7];
        var_5 thread _id_A5A4::_id_38C1();
        var_5 thread _id_A5A4::_id_83D0();
        var_5 thread _id_A5A4::_id_6092();
    }

    precachemodel( "fx" );
    precachemodel( "tag_origin" );
    precachemodel( "tag_ik_target" );
    precacheshellshock( "default" );
    precacheshellshock( "flashbang" );
    precacheshellshock( "dog_bite" );
    precacheshellshock( "dog_bite_hit_shield" );
    precacherumble( "damage_heavy" );
    precacherumble( "damage_light" );
    precacherumble( "grenade_rumble" );
    precacherumble( "artillery_rumble" );
    precacherumble( "slide_start" );
    precacherumble( "slide_loop" );
    precachestring( &"GAME_GET_TO_COVER" );
    precachestring( &"GAME_LAST_STAND_GET_BACK_UP" );
    precachestring( &"SCRIPT_GRENADE_DEATH" );
    precachestring( &"SCRIPT_GRENADE_SUICIDE_LINE1" );
    precachestring( &"SCRIPT_GRENADE_SUICIDE_LINE2" );
    precachestring( &"SCRIPT_EXPLODING_VEHICLE_DEATH" );
    precachestring( &"SCRIPT_EXPLODING_DESTRUCTIBLE_DEATH" );
    precachestring( &"SCRIPT_EXPLODING_BARREL_DEATH" );
    precacheshader( "hud_grenadeicon" );
    precacheshader( "hud_grenadepointer" );
    precacheshader( "hud_burningcaricon" );
    precacheshader( "death_juggernaut" );
    precacheshader( "hud_destructibledeathicon" );
    precacheshader( "hud_burningbarrelicon" );
    precacheshader( "waypoint_ammo" );
    precachestring( &"init_hud" );
    precachestring( &"close_hud" );
    _func_258( "nvg_laser" );
    level._id_058F["deathfx_bloodpool_generic"] = loadfx( "vfx/weaponimpact/deathfx_bloodpool_generic" );
    animscripts\pain::_id_4DF7();
    animscripts\melee::_id_5B61();
    animscripts\death::init_headshot_helmet();
    level._id_2409 = getdvar( "createfx" ) != "";
    level.navigatemodels_enabled = 0;
    _id_864A();
    level._id_88FE = [];
    level._id_88FE["allies"] = [];
    level._id_88FE["axis"] = [];
    level._id_88FE["team3"] = [];
    level._id_88FE["neutral"] = [];
    maps\_cheat::init();
    _id_A558::main();
    common_scripts\_exploder::_id_8313();
    maps\_exploderanim::main();
    _id_A513::main();
    _id_A537::_id_8010();
    _id_A510::init();
    thread common_scripts\_fx::_id_4DBF();

    if ( level._id_2409 )
    {

    }

    _id_A539::init();
    _id_A538::main();
    _id_A538::create_custom_global_fx();
    _id_277C();
    _id_A528::init();
    _id_A54E::_id_5705();
    _id_A54F::_id_4D7B();
    _id_A55D::_id_8241();

    if ( isdefined( level._id_4618 ) )
        thread [[ level._id_4618 ]]();
    else
        thread _id_4617();

    if ( getdvar( "functional_test_starts" ) == "1" )
        thread _id_3AFB();

    if ( !isdefined( level._id_9794 ) )
        common_scripts\utility::_id_4D6D();

    level._id_537C = [];
    _id_A5DC::_id_0F91();
    _id_A5E8::_id_86F4();
    _id_A59E::_id_4D53();
    _func_0D6( "ufoHitsTriggers", "0" );
    _id_A545::init();
    _id_2BC7();

    if ( getdvar( "g_connectpaths" ) == "2" )
        level waittill( "eternity" );

    _id_A514::main();
    thread _id_A580::init();

    if ( !isdefined( level._id_0C8A ) )
        thread _id_4CB2();

    _id_A510::init();

    if ( isdefined( level._id_110D ) )
        _id_A5DC::_id_7EC8( level._id_110D );

    anim._id_9BFF = 0;

    if ( !isdefined( level._id_5CDE ) )
        level._id_5CDE = 0;

    if ( !_id_A5A4::_id_5083() )
    {
        _id_A551::_id_4D0F();
        _func_0D6( "ui_campaign", level._id_1A3D );
    }

    common_scripts\_static_destructible::main();
    common_scripts\_destructible::init();
    thread _id_A5A8::_id_4D73();
    thread _id_A54B::main();
    thread _id_A530::main();
    thread _id_A524::init();
    _id_A536::main();
    common_scripts\utility::_id_0CF0( getentarray( "badplace", "targetname" ), ::_id_1266 );
    common_scripts\utility::_id_0CF0( getentarray( "delete_on_load", "targetname" ), _id_A5A4::_id_284E );
    common_scripts\utility::_id_0D13( _func_0C4( "traverse", "targetname" ), ::_id_9741 );
    common_scripts\utility::_id_0D13( getentarray( "piano_key", "targetname" ), ::_id_6807 );
    common_scripts\utility::_id_0D13( getentarray( "piano_damage", "targetname" ), ::_id_6806 );
    common_scripts\utility::_id_0D13( getentarray( "water", "targetname" ), ::_id_A29C );
    common_scripts\utility::_id_0D13( getentarray( "kill_all_players", "targetname" ), ::_id_52F8 );
    common_scripts\utility::_id_383D( "allow_ammo_pickups" );
    common_scripts\utility::_id_383F( "allow_ammo_pickups" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_grenade_launcher", "targetname" ), ::_id_0B76, "grenade_launcher" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_rpg", "targetname" ), ::_id_0B76, "rpg" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_c4", "targetname" ), ::_id_0B76, "c4" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_claymore", "targetname" ), ::_id_0B76, "claymore" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_556", "targetname" ), ::_id_0B76, "556" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_762", "targetname" ), ::_id_0B76, "762" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_45", "targetname" ), ::_id_0B76, "45" );
    common_scripts\utility::_id_0D13( getentarray( "ammo_pickup_pistol", "targetname" ), ::_id_0B76, "pistol" );
    thread maps\_interactive_objects::main();
    thread _id_A54A::main();

    for ( var_7 = 0; var_7 < level._id_0323.size; var_7++ )
    {
        var_5 = level._id_0323[var_7];

        if ( !( getdvarint( "disable_player_regen" ) == 1 ) )
            var_5 thread _id_A537::_id_6CC4();

        var_5 thread _id_6C83();
    }

    thread _id_A56A::main();
    thread _id_59D7();
    common_scripts\utility::_id_383D( "spawning_friendlies" );
    common_scripts\utility::_id_383D( "friendly_wave_spawn_enabled" );
    common_scripts\utility::_id_3831( "spawning_friendlies" );
    level._id_3A7F["rifleguy"] = getentarray( "rifle_spawner", "script_noteworthy" );
    level._id_3A7F["smgguy"] = getentarray( "smg_spawner", "script_noteworthy" );
    thread _id_A581::_id_4255();
    thread _id_A581::_id_3A96();
    thread _id_A581::_id_3A94();
    common_scripts\utility::_id_0D13( getentarray( "friendly_spawn", "targetname" ), _id_A581::_id_3ABC );
    common_scripts\utility::_id_0D13( getentarray( "flood_and_secure", "targetname" ), _id_A581::_id_38EA );
    common_scripts\utility::_id_0D13( getentarray( "window_poster", "targetname" ), ::_id_A337 );

    if ( !isdefined( level._id_97A8 ) )
    {
        level._id_97A8 = [];
        level._id_97A7 = [];
        level.trigger_hint_doubleline = [];
    }

    level._id_83B3 = [];
    level._id_8907 = [];
    _id_A581::main();
    common_scripts\utility::_id_0D13( getentarray( "background_block", "targetname" ), ::_id_1250 );
    thread _id_57C3();
    thread _id_A511::main();
    thread maps\_cagedchickens::initchickens();
    thread _id_A2B6();

    foreach ( var_10, var_9 in level._id_5CE0._id_56E5 )
    {
        if ( var_9._id_02A7 == level._id_038E )
        {
            _func_0D6( "ui_currentLevelIndex", var_10 );
            break;
        }
    }

    if ( level._id_038E == level._id_5CE0._id_56E5[0]._id_02A7 && !level._id_0318 _meth_8212( "hasEverPlayed_SP" ) )
        _id_A5A4::_id_27EF( 0.1, ::_id_9AC0 );

    var_11 = level._id_0318 _meth_8211( "gameskill" );
    var_12 = level._id_2A63[_func_0BC( var_11 )];
    _func_2AB( "start_difficulty", var_12 );
    _func_2AB( "final_difficulty", var_12 );
    level thread maps\_achievements::achievements_init();
    thread maps\_dragunov_lightset::dragunov_scope_init();
    level thread _id_A5A4::_id_8C0F();
    level notify( "load_finished" );
    _id_76B4();
    level._id_0318 thread _id_A5A4::_id_5820();
}

_id_9AC0()
{
    level._id_0318 _meth_8213( "hasEverPlayed_SP", 1 );
    updategamerprofile();
}

_id_76B4()
{
    if ( isdefined( level._id_6E7A ) )
    {
        foreach ( var_1 in level._id_6E7A )
            [[ var_1 ]]();
    }
}

set_dynent_playerwakeupradius()
{
    switch ( level._id_038E )
    {
        case "armada":
        case "airlift":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            _func_0D6( "dynEnt_playerWakeUpRadius", 1000 );
            break;
    }
}

_id_7E18()
{
    level._id_3004 = [];
    level._id_3004["killhouse"] = 1;
    level._id_3004["cargoship"] = 1;
    level._id_3004["coup"] = 1;
    level._id_3004["blackout"] = 1;
    level._id_3004["armada"] = 1;
    level._id_3004["bog_a"] = 0;
    level._id_3004["hunted"] = 0;
    level._id_3004["ac130"] = 0;
    level._id_3004["bog_b"] = 0;
    level._id_3004["airlift"] = 0;
    level._id_3004["aftermath"] = 0;
    level._id_3004["village_assault"] = 0;
    level._id_3004["ca_village_assault"] = 0;
    level._id_3004["scoutsniper"] = 0;
    level._id_3004["sniperescape"] = 0;
    level._id_3004["village_defend"] = 0;
    level._id_3004["ambush"] = 0;
    level._id_3004["icbm"] = 0;
    level._id_3004["launchfacility_a"] = 0;
    level._id_3004["launchfacility_b"] = 0;
    level._id_3004["jeepride"] = 0;
    level._id_3004["airplane"] = 0;
}

_id_A2B6()
{
    var_0 = getentarray();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].classname ) && _func_122( var_0[var_1].classname, 0, 7 ) == "weapon_" )
        {
            var_2 = var_0[var_1];
            var_3 = _func_122( var_2.classname, 7 );

            if ( isdefined( var_2._id_7939 ) )
            {
                var_4 = _func_1B1( var_3 );
                var_5 = _func_1E6( var_3 );
                var_2 _meth_8182( var_4, var_5, var_4, 0 );
                var_6 = _func_1E7( var_3 );

                if ( var_6 != "none" )
                {
                    var_7 = _func_1B1( var_6 );
                    var_8 = _func_1E6( var_6 );
                    var_2 _meth_8182( var_7, var_8, var_7, 1 );
                }

                continue;
            }

            var_9 = 0;
            var_4 = undefined;
            var_10 = undefined;
            var_11 = 0;
            var_12 = undefined;
            var_13 = undefined;

            if ( isdefined( var_2._id_7937 ) )
            {
                var_4 = var_2._id_7937;
                var_9 = 1;
            }

            if ( isdefined( var_2._id_7938 ) )
            {
                var_10 = var_2._id_7938;
                var_9 = 1;
            }

            if ( isdefined( var_2._id_7935 ) )
            {
                var_12 = var_2._id_7935;
                var_11 = 1;
            }

            if ( isdefined( var_2._id_7936 ) )
            {
                var_13 = var_2._id_7936;
                var_11 = 1;
            }

            if ( var_9 )
            {
                if ( !isdefined( var_4 ) )
                {

                }

                if ( !isdefined( var_10 ) )
                {

                }

                var_2 _meth_8182( var_4, var_10 );
            }

            if ( var_11 )
            {
                if ( !isdefined( var_12 ) )
                {

                }

                if ( !isdefined( var_13 ) )
                {

                }

                var_2 _meth_8182( var_12, var_13, 0, 1 );
            }
        }
    }
}

_id_352F( var_0 )
{
    level endon( "killexplodertridgers" + var_0._id_79BF );
    var_0 waittill( "trigger" );

    if ( isdefined( var_0._id_796E ) && _func_0B3( 1 ) > var_0._id_796E )
    {
        if ( !var_0 _id_A5A4::_id_0392() )
            wait 4;

        level thread _id_352F( var_0 );
        return;
    }

    if ( !var_0 _id_A5A4::_id_0392() && isdefined( var_0._id_79C0 ) )
        wait(var_0._id_79C0);

    common_scripts\_exploder::_id_3528( var_0._id_79BF );
    level notify( "killexplodertridgers" + var_0._id_79BF );
}

_id_1266( var_0 )
{
    if ( !isdefined( level._id_126A ) )
        level._id_126A = 0;

    level._id_126A++;
    badplace_cylinder( "badplace" + level._id_126A, -1, var_0._id_02E2, var_0._id_0351, 1024 );
}

_id_6C83()
{
    for (;;)
    {
        self waittill( "damage", var_0 );

        if ( isdefined( self._id_8A2A ) )
            continue;

        self _meth_80AF( "damage_heavy" );
    }
}

_id_5982()
{
    if ( isdefined( level._id_3004[level._id_038E] ) )
        return level._id_3004[level._id_038E];
    else
        return 0;
}

_id_9741()
{
    var_0 = getent( self._id_04A4, "targetname" );
    self._id_972A = var_0._id_02E2[2];
    self._id_972B = var_0._id_02E2[2] - self._id_02E2[2];
    var_0 delete();
}

_id_6806()
{
    var_0 = self _meth_8097();
    var_1[0] = "large";
    var_1[1] = "small";

    for (;;)
    {
        self waittill( "trigger" );
        thread common_scripts\utility::_id_69C2( "bullet_" + common_scripts\utility::_id_710E( var_1 ) + "_piano", var_0 );
    }
}

_id_6807()
{
    var_0 = self _meth_8097();
    var_1 = "piano_" + self._id_0398;
    self _meth_80DD( &"SCRIPT_PLATFORM_PIANO" );

    for (;;)
    {
        self waittill( "trigger" );
        thread common_scripts\utility::_id_69C2( var_1, var_0 );
    }
}

_id_A29C()
{
    var_0 = getent( self._id_04A4, "targetname" );
    var_1 = var_0._id_02E2[2];
    var_0 = undefined;
    level._id_28AC = 8;
    level._id_28AB = 33;
    level._id_28AD = 50;
    var_2 = 0;

    for (;;)
    {
        wait 0.05;

        if ( !level._id_0318._id_4FAD && var_2 )
        {
            var_2 = 0;
            level._id_0318 _meth_811C( 1 );
            level._id_0318 _meth_811B( 1 );
            level._id_0318 _meth_811A( 1 );
            thread _id_A29D( level._id_278A );
        }

        self waittill( "trigger" );
        level._id_0318._id_4FAD = 1;
        var_2 = 1;

        while ( level._id_0318 _meth_80AB( self ) )
        {
            level._id_0318._id_4FAD = 1;
            var_3 = level._id_0318 _meth_8097();
            var_4 = var_3[2] - var_1;

            if ( var_4 > 0 )
                break;

            var_5 = _func_0BC( level._id_278A - _func_0BE( var_4 * 5 ) );

            if ( var_5 < 50 )
                var_5 = 50;

            thread _id_A29D( var_5 );

            if ( _func_0BE( var_4 ) > level._id_28AB )
                level._id_0318 _meth_811B( 0 );
            else
                level._id_0318 _meth_811B( 1 );

            if ( _func_0BE( var_4 ) > level._id_28AC )
                level._id_0318 _meth_811C( 0 );
            else
                level._id_0318 _meth_811C( 1 );

            wait 0.5;
        }

        level._id_0318._id_4FAD = 0;
        wait 0.05;
    }
}

_id_A29D( var_0 )
{
    level notify( "ramping_water_movement_speed" );
    level endon( "ramping_water_movement_speed" );
    var_1 = 0.5;
    var_2 = _func_0BC( var_1 * 20 );
    var_3 = getdvarint( "g_speed" );
    var_4 = 0;

    if ( var_0 < var_3 )
        var_4 = 1;

    var_5 = _func_0BC( _func_0BE( var_3 - var_0 ) );
    var_6 = _func_0BC( var_5 / var_2 );

    for ( var_7 = 0; var_7 < var_2; var_7++ )
    {
        var_3 = getdvarint( "g_speed" );

        if ( var_4 )
            _func_0D6( "g_speed", var_3 - var_6 );
        else
            _func_0D6( "g_speed", var_3 + var_6 );

        wait 0.05;
    }

    _func_0D6( "g_speed", var_0 );
}

_id_59D7()
{
    var_0 = _func_0C5();
    thread _id_A558::_id_1126( var_0 );
    thread _id_A558::_id_7820( var_0 );
    thread _id_A51C::_id_4CCA( var_0 );
}

_id_4C43( var_0 )
{
    var_1 = _func_1A9();
    var_1.alignx = "left";
    var_1.aligny = "middle";
    var_1._id_0530 = 10;
    var_1._id_0538 = 400;
    var_1 _meth_80CC( var_0 );
    var_1.alpha = 0;
    var_1._id_0189 = 3;
    wait 1;
    var_1 _meth_8086( 1 );
    var_1.alpha = 1;
    wait 5;
    var_1 _meth_8086( 1 );
    var_1.alpha = 0;
    wait 1;
    var_1 _meth_808A();
}

_id_4617()
{
    level._id_8CB0 = spawnstruct();
    common_scripts\utility::_id_23AE( "start", "" );

    if ( getdvar( "scr_generateClipModels" ) != "" && getdvar( "scr_generateClipModels" ) != "0" )
        return;

    if ( !isdefined( level._id_8BB5 ) )
        level._id_8BB5 = [];

    var_0 = _func_123( getdvar( "start" ) );
    var_1 = _id_3E70();

    if ( isdefined( level._id_8C36 ) )
        var_0 = level._id_8C36;

    var_2 = 0;

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_0 == var_1[var_3] )
        {
            var_2 = var_3;
            level._id_8C36 = var_1[var_3];
            break;
        }
    }

    if ( isdefined( level._id_278C ) && !isdefined( level._id_8C36 ) )
    {
        foreach ( var_6, var_5 in var_1 )
        {
            if ( level._id_278C == var_5 )
            {
                var_2 = var_6;
                level._id_8C36 = var_5;
                break;
            }
        }
    }

    if ( !isdefined( level._id_8C36 ) )
    {
        if ( isdefined( level._id_278B ) )
            level._id_8C36 = "default";
        else if ( _id_A5A4::_id_56C2() )
            level._id_8C36 = level._id_8BB5[0]["name"];
        else
            level._id_8C36 = "default";
    }

    var_7 = getdvarint( "sv_loadingsavegame", 0 );

    if ( var_7 != 0 )
    {
        var_8 = getdvar( "sv_savegametransients", "" );

        if ( var_8 == "" )
            _func_224( "" );
        else
        {
            var_9 = _func_124( var_8, "," );
            _func_224( var_9 );
        }
    }
    else if ( level._id_8C36 != "default" )
    {
        var_10 = level._id_8B34[level._id_8C36];

        if ( isdefined( var_10["transients_to_load"] ) )
        {
            var_11 = var_10["transients_to_load"];

            if ( var_11.size > 0 )
                _func_224( var_11 );
            else
                _func_224( "" );
        }
    }

    waitframe;
    common_scripts\utility::_id_383F( "start_is_set" );
    thread _id_8C0A();

    if ( level._id_8C36 == "default" )
    {
        if ( isdefined( level._id_278B ) )
            level thread [[ level._id_278B ]]();
    }
    else
    {
        var_10 = level._id_8B34[level._id_8C36];
        thread [[ var_10["start_func"] ]]();
    }

    if ( _id_A5A4::_id_5016() )
    {
        var_12 = _id_3E7A( var_1 );
        setdvar( "start", var_12 );
    }

    waitframe;

    if ( var_7 != 0 )
        wait 0.1;

    var_13 = [];

    if ( !_id_A5A4::_id_5016() && level._id_8C36 != "no_game" )
    {
        var_14 = gettime();

        for ( var_3 = 0; var_3 < level._id_8BB5.size; var_3++ )
        {
            var_10 = level._id_8BB5[var_3];

            if ( var_10["name"] == level._id_8C36 )
                break;

            if ( !isdefined( var_10["catchup_function"] ) )
                continue;

            [[ var_10["catchup_function"] ]]();
        }
    }

    for ( var_3 = var_2; var_3 < level._id_8BB5.size; var_3++ )
    {
        var_10 = level._id_8BB5[var_3];

        if ( !isdefined( var_10["logic_func"] ) )
            continue;

        if ( _id_0AFD( var_10["logic_func"], var_13 ) )
            continue;

        level._id_8CB0 [[ var_10["logic_func"] ]]();
        var_13[var_13.size] = var_10["logic_func"];
    }
}

_id_0AFD( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return 1;
    }

    return 0;
}

_id_3E7A( var_0 )
{
    var_1 = " ** No starts have been set up for this map with maps_utility::add_start().";

    if ( var_0.size )
    {
        var_1 = " ** ";

        for ( var_2 = var_0.size - 1; var_2 >= 0; var_2-- )
            var_1 = var_1 + var_0[var_2] + " ";
    }

    setdvar( "start", var_1 );
    return var_1;
}

_id_23D9( var_0, var_1 )
{
    var_2 = 1;
    var_3 = ( 0.9, 0.9, 0.9 );

    if ( var_1 != -1 )
    {
        var_4 = 5;

        if ( var_1 != var_4 )
            var_2 = 1 - _func_0BE( var_4 - var_1 ) / var_4;
        else
            var_3 = ( 1, 1, 0 );
    }

    if ( var_2 == 0 )
        var_2 = 0.05;

    var_5 = _func_1A9();
    var_5.alignx = "left";
    var_5.aligny = "middle";
    var_5._id_0530 = 80;
    var_5._id_0538 = 80 + var_1 * 18;
    var_5 _meth_80CC( var_0 );
    var_5.alpha = 0;
    var_5._id_0198 = 1;
    var_5.color = var_3;
    var_5._id_0189 = 1.75;
    var_5 _meth_8086( 0.5 );
    var_5.alpha = var_2;
    return var_5;
}

_id_8C0A()
{

}

_id_8C16()
{
    common_scripts\utility::_id_0CDB( _func_0D9(), ::delete );
    common_scripts\utility::_id_0CDB( _func_0DB(), ::delete );
}

_id_3E70()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_8BB5.size; var_1++ )
        var_0[var_0.size] = level._id_8BB5[var_1]["name"];

    return var_0;
}

_id_2B56()
{
    level._id_2B57 = 1;

    if ( level._id_8BB5.size <= 0 )
        return;

    var_0 = _id_3E70();
    var_0[var_0.size] = "default";
    var_0[var_0.size] = "cancel";
    var_1 = _id_8BF8();
    var_2 = _id_23D9( "Selected Start:", -1 );
    var_2.color = ( 1, 1, 1 );
    var_3 = [];

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4];
        var_6 = "[" + var_0[var_4] + "]";

        if ( var_5 != "cancel" && var_5 != "default" )
        {
            if ( isdefined( level._id_8B34[var_5]["start_loc_string"] ) )
            {
                var_6 += " -> ";
                var_6 += level._id_8B34[var_5]["start_loc_string"];
            }
        }

        var_3[var_3.size] = var_6;
    }

    var_7 = var_0.size - 1;
    var_8 = 0;
    var_9 = 0;

    for ( var_10 = 0; var_7 > 0; var_7-- )
    {
        if ( var_0[var_7] == level._id_8C36 )
        {
            var_10 = 1;
            break;
        }
    }

    if ( !var_10 )
        var_7 = var_0.size - 1;

    _id_8BF9( var_1, var_3, var_7 );
    var_11 = var_7;

    for (;;)
    {
        if ( !level._id_0318 _meth_8248( "F10" ) )
            level._id_2B57 = 0;

        if ( var_11 != var_7 )
        {
            _id_8BF9( var_1, var_3, var_7 );
            var_11 = var_7;
        }

        if ( !var_8 )
        {
            if ( level._id_0318 _meth_8248( "UPARROW" ) || level._id_0318 _meth_8248( "DPAD_UP" ) || level._id_0318 _meth_8248( "APAD_UP" ) )
            {
                var_8 = 1;
                var_7--;
            }
        }
        else if ( !level._id_0318 _meth_8248( "UPARROW" ) && !level._id_0318 _meth_8248( "DPAD_UP" ) && !level._id_0318 _meth_8248( "APAD_UP" ) )
            var_8 = 0;

        if ( !var_9 )
        {
            if ( level._id_0318 _meth_8248( "DOWNARROW" ) || level._id_0318 _meth_8248( "DPAD_DOWN" ) || level._id_0318 _meth_8248( "APAD_DOWN" ) )
            {
                var_9 = 1;
                var_7++;
            }
        }
        else if ( !level._id_0318 _meth_8248( "DOWNARROW" ) && !level._id_0318 _meth_8248( "DPAD_DOWN" ) && !level._id_0318 _meth_8248( "APAD_DOWN" ) )
            var_9 = 0;

        if ( var_7 < 0 )
            var_7 = var_0.size - 1;

        if ( var_7 >= var_0.size )
            var_7 = 0;

        if ( level._id_0318 _meth_8248( "BUTTON_B" ) )
        {
            _id_8B87( var_1, var_2 );
            break;
        }

        if ( level._id_0318 _meth_8248( "kp_enter" ) || level._id_0318 _meth_8248( "BUTTON_A" ) || level._id_0318 _meth_8248( "enter" ) )
        {
            if ( var_0[var_7] == "cancel" )
            {
                _id_8B87( var_1, var_2 );
                break;
            }

            setdvar( "start", var_0[var_7] );
        }

        wait 0.05;
    }
}

_id_8BF8()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 11; var_1++ )
    {
        var_2 = _id_23D9( "", var_1 );
        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_8BF9( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_3 + var_2 - 5;

        if ( isdefined( var_1[var_4] ) )
            var_5 = var_1[var_4];
        else
            var_5 = "";

        var_0[var_3] _meth_80CC( var_5 );
    }
}

_id_8B87( var_0, var_1 )
{
    var_1 _meth_808A();

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] _meth_808A();
}

_id_1250()
{
    self._id_02E2 -= self._id_795E;
}

_id_7E9E( var_0 )
{
    level._id_6C51 = var_0;
    precachemodel( level._id_6C51 );
}

_id_0B76( var_0 )
{
    var_1 = [];

    if ( var_0 == "grenade_launcher" )
    {
        var_1[var_1.size] = "alt_m4_grenadier";
        var_1[var_1.size] = "alt_m4m203_acog";
        var_1[var_1.size] = "alt_m4m203_acog_payback";
        var_1[var_1.size] = "alt_m4m203_eotech";
        var_1[var_1.size] = "alt_m4m203_motion_tracker";
        var_1[var_1.size] = "alt_m4m203_reflex";
        var_1[var_1.size] = "alt_m4m203_reflex_arctic";
        var_1[var_1.size] = "alt_m4m203_silencer";
        var_1[var_1.size] = "alt_m4m203_silencer_reflex";
        var_1[var_1.size] = "alt_m16_grenadier";
        var_1[var_1.size] = "alt_ak47_grenadier";
        var_1[var_1.size] = "alt_ak47_desert_grenadier";
        var_1[var_1.size] = "alt_ak47_digital_grenadier";
        var_1[var_1.size] = "alt_ak47_fall_grenadier";
        var_1[var_1.size] = "alt_ak47_woodland_grenadier";
    }
    else if ( var_0 == "rpg" )
    {
        var_1[var_1.size] = "rpg";
        var_1[var_1.size] = "rpg_player";
        var_1[var_1.size] = "rpg_straight";
    }
    else if ( var_0 == "c4" )
        var_1[var_1.size] = "c4";
    else if ( var_0 == "claymore" )
        var_1[var_1.size] = "claymore";
    else if ( var_0 == "556" )
    {
        var_1[var_1.size] = "m4_grenadier";
        var_1[var_1.size] = "m4_grunt";
        var_1[var_1.size] = "m4_sd_cloth";
        var_1[var_1.size] = "m4_shotgun";
        var_1[var_1.size] = "m4_silencer";
        var_1[var_1.size] = "m4_silencer_acog";
        var_1[var_1.size] = "m4m203_acog";
        var_1[var_1.size] = "m4m203_acog_payback";
        var_1[var_1.size] = "m4m203_eotech";
        var_1[var_1.size] = "m4m203_motion_tracker";
        var_1[var_1.size] = "m4m203_reflex";
        var_1[var_1.size] = "m4m203_reflex_arctic";
        var_1[var_1.size] = "m4m203_silencer";
        var_1[var_1.size] = "m4m203_silencer_reflex";
        var_1[var_1.size] = "m4m203_silencer";
    }
    else if ( var_0 == "762" )
    {
        var_1[var_1.size] = "ak47";
        var_1[var_1.size] = "ak47_acog";
        var_1[var_1.size] = "ak47_eotech";
        var_1[var_1.size] = "ak47_grenadier";
        var_1[var_1.size] = "ak47_reflex";
        var_1[var_1.size] = "ak47_shotgun";
        var_1[var_1.size] = "ak47_silencer";
        var_1[var_1.size] = "ak47_thermal";
        var_1[var_1.size] = "ak47_desert";
        var_1[var_1.size] = "ak47_desert_acog";
        var_1[var_1.size] = "ak47_desert_eotech";
        var_1[var_1.size] = "ak47_desert_grenadier";
        var_1[var_1.size] = "ak47_desert_reflex";
        var_1[var_1.size] = "ak47_digital";
        var_1[var_1.size] = "ak47_digital_acog";
        var_1[var_1.size] = "ak47_digital_eotech";
        var_1[var_1.size] = "ak47_digital_grenadier";
        var_1[var_1.size] = "ak47_digital_reflex";
        var_1[var_1.size] = "ak47_fall";
        var_1[var_1.size] = "ak47_fall_acog";
        var_1[var_1.size] = "ak47_fall_eotech";
        var_1[var_1.size] = "ak47_fall_grenadier";
        var_1[var_1.size] = "ak47_fall_reflex";
        var_1[var_1.size] = "ak47_woodland";
        var_1[var_1.size] = "ak47_woodland_acog";
        var_1[var_1.size] = "ak47_woodland_eotech";
        var_1[var_1.size] = "ak47_woodland_grenadier";
        var_1[var_1.size] = "ak47_woodland_reflex";
    }
    else if ( var_0 == "45" )
    {
        var_1[var_1.size] = "ump45";
        var_1[var_1.size] = "ump45_acog";
        var_1[var_1.size] = "ump45_eotech";
        var_1[var_1.size] = "ump45_reflex";
        var_1[var_1.size] = "ump45_silencer";
        var_1[var_1.size] = "ump45_arctic";
        var_1[var_1.size] = "ump45_arctic_acog";
        var_1[var_1.size] = "ump45_arctic_eotech";
        var_1[var_1.size] = "ump45_arctic_reflex";
        var_1[var_1.size] = "ump45_digital";
        var_1[var_1.size] = "ump45_digital_acog";
        var_1[var_1.size] = "ump45_digital_eotech";
        var_1[var_1.size] = "ump45_digital_reflex";
    }
    else if ( var_0 == "pistol" )
    {
        var_1[var_1.size] = "beretta";
        var_1[var_1.size] = "beretta393";
        var_1[var_1.size] = "usp";
        var_1[var_1.size] = "usp_scripted";
        var_1[var_1.size] = "usp_silencer";
        var_1[var_1.size] = "glock";
    }

    var_2 = spawn( "trigger_radius", self._id_02E2, 0, 25, 32 );

    for (;;)
    {
        common_scripts\utility::_id_384A( "allow_ammo_pickups" );
        var_2 waittill( "trigger", var_3 );

        if ( !common_scripts\utility::_id_382E( "allow_ammo_pickups" ) )
            continue;

        if ( !isdefined( var_3 ) )
            continue;

        if ( !_func_1AD( var_3 ) )
            continue;

        var_4 = undefined;
        var_5 = undefined;
        var_6 = var_3 _meth_8308();

        for ( var_7 = 0; var_7 < var_6.size; var_7++ )
        {
            for ( var_8 = 0; var_8 < var_1.size; var_8++ )
            {
                if ( var_6[var_7] == var_1[var_8] )
                    var_4 = var_6[var_7];
            }
        }

        if ( !isdefined( var_4 ) && var_0 == "claymore" )
        {
            var_5 = 1;
            var_4 = "claymore";
            break;
        }

        if ( !isdefined( var_4 ) && var_0 == "c4" )
        {
            var_5 = 1;
            var_4 = "c4";
            break;
        }

        if ( !isdefined( var_4 ) )
            continue;

        if ( var_3 _meth_8331( var_4 ) >= 1 )
            continue;

        break;
    }

    if ( isdefined( var_5 ) )
        var_3 _meth_830B( var_4 );
    else
    {
        var_9 = 1;

        if ( var_0 == "556" || var_0 == "762" )
            var_9 = 30;
        else if ( var_0 == "45" )
            var_9 = 25;
        else if ( var_0 == "pistol" )
            var_9 = 15;

        var_3 _meth_82F4( var_4, var_3 _meth_82F6( var_4 ) + var_9 );
    }

    var_3 _meth_82F1( "grenade_pickup" );
    var_2 delete();

    if ( isdefined( self ) )
        self delete();
}

_id_7367()
{
    wait 0.05;
    level._id_380E = -1;
}

_id_57C3()
{
    if ( isdefined( game["total characters"] ) )
        var_0 = game["total characters"];
    else
        return;

    var_1 = _func_0D9( "allies" );
    var_2 = var_1.size;
    var_3 = 0;
    var_4 = _func_0DD( "allies" );
    var_5 = var_4.size;
    var_6 = 0;

    for (;;)
    {
        if ( var_2 <= 0 && var_5 <= 0 || var_0 <= 0 )
            return;

        if ( var_2 > 0 )
        {
            if ( isdefined( var_1[var_3]._id_79EE ) )
            {
                var_2--;
                var_3++;
                continue;
            }

            var_1[var_3] codescripts\character::_id_6099();
            var_1[var_3] thread codescripts\character::_id_57BD( game["character" + var_0 - 1] );
            var_2--;
            var_3++;
            var_0--;
            continue;
        }

        if ( var_5 > 0 )
        {
            if ( isdefined( var_4[var_6]._id_79EE ) )
            {
                var_5--;
                var_6++;
                continue;
            }

            var_7 = game["character" + var_0 - 1];
            _id_A5A4::_id_032C( var_7["model"] );
            _id_A5A4::_id_032C( var_7["model"] );
            var_4[var_6] thread _id_A5A4::_id_894D( game["character" + var_0 - 1] );
            var_5--;
            var_6++;
            var_0--;
            continue;
        }
    }
}

_id_1CBC( var_0 )
{
    if ( !common_scripts\utility::_id_51C1( var_0, "aa_" ) )
        return;

    [[ level._id_88B2 ]]( var_0 );
}

_id_6ECE()
{
    waitframe;

    if ( !isdefined( level._id_78B5 ) )
        return;

    var_0 = _func_1D3( level._id_78B5 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( _func_0CE( level._id_78B5[var_0[var_1]] ) )
        {
            for ( var_2 = 0; var_2 < level._id_78B5[var_0[var_1]].size; var_2++ )
                precachemodel( level._id_78B5[var_0[var_1]][var_2] );

            continue;
        }

        precachemodel( level._id_78B5[var_0[var_1]] );
    }
}

_id_6AC7()
{
    setdvar( "player_died_recently", "0" );
    thread _id_6ACC();
    level _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "missionfailed" );
    level._id_0318 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    _id_A5A4::_id_2BDD();
    var_0 = [];
    var_0[0] = 70;
    var_0[1] = 30;
    var_0[2] = 0;
    var_0[3] = 0;
    setdvar( "player_died_recently", var_0[level._id_3BFE] );
}

_id_6ACC()
{
    for (;;)
    {
        var_0 = getdvarint( "player_died_recently", 0 );

        if ( var_0 > 0 )
        {
            var_0 -= 5;
            setdvar( "player_died_recently", var_0 );
        }

        wait 5;
    }
}

_id_7271()
{
    self notify( "new_recon_player" );
    self endon( "new_recon_player" );
    self waittill( "death", var_0, var_1, var_2 );

    if ( !isdefined( var_2 ) )
        var_2 = "script_kill";

    var_3 = 0;
    var_4 = "none";
    var_5 = ( 0, 0, 0 );

    if ( isdefined( var_0 ) )
    {
        var_4 = var_0.classname;
        var_5 = var_0._id_02E2;
        var_6 = _func_114( var_5 - self._id_02E2 );
        var_7 = anglestoforward( self _meth_8338() );
        var_3 = _func_0F6( var_6, var_7 );
    }

    _func_105( self._id_02E2, "script_player_death: playerid %s, enemy %s, enemyposition %v, enemydotproduct %f, cause %s, weapon %s", self._id_9A29, var_4, var_5, var_3, var_1, var_2 );

    if ( isdefined( var_0 ) )
        _func_105( var_0._id_02E2, "script_player_killer: playerid %s, enemy %s, playerposition %v, enemydotproduct %f, cause %s, weapon %s", self._id_9A29, var_4, self._id_02E2, var_3, var_1, var_2 );
}

_id_7272()
{
    self notify( "new_player_downed_recon" );
    self endon( "new_player_downed_recon" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "player_downed" );
        var_0 = _func_101() * 0.05;
        var_1 = var_0;

        if ( isdefined( self._id_551C ) )
            var_0 = var_1 - self._id_551C;

        self._id_551C = var_1;
        _func_105( self._id_02E2, "script_player_downed: playerid %s, leveltime %d, deltatime %d", self._id_9A29, var_1, var_0 );
    }
}

_id_4D06()
{
    level._id_0323 = getentarray( "player", "classname" );

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
        level._id_0323[var_0]._id_9A29 = "player" + var_0;

    level._id_0318 = level._id_0323[0];

    if ( level._id_0323.size > 1 )
        level._id_6C5B = level._id_0323[1];

    level notify( "level.players initialized" );

    foreach ( var_2 in level._id_0323 )
    {
        var_2 thread _id_7271();

        if ( _id_A5A4::_id_5083() )
            var_2 thread _id_7272();
    }
}

_id_52F8()
{
    self waittill( "trigger", var_0 );
    var_0 _id_A5A4::_id_5346();
}

_id_A263()
{
    if ( !isdefined( level._id_3A8C ) )
        level._id_3A8C = loadfx( "vfx/unique/thermal_beacon_inverted" );

    self endon( "death" );
    var_0 = self _meth_830E();

    if ( _id_A2B2( var_0 ) )
        thread _id_9300();
    else if ( _id_A2B3( var_0 ) )
        thread _id_3060();
    else if ( _id_A2B4( var_0 ) )
        thread _id_4772();
    else if ( _id_6B47() )
        thread _id_48AC();

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( _id_A2B2( var_1 ) )
            thread _id_9300();
        else
            self notify( "acogThermalTracker" );

        if ( _id_A2B3( var_1 ) )
            thread _id_3060();

        if ( _id_A2B4( var_1 ) )
            thread _id_4772();

        if ( _id_6B47() )
            thread _id_48AC();
    }
}

_id_3061()
{
    common_scripts\utility::_id_A069( "death", "weapon_change", "em1_heat_meter" );
    setomnvar( "ui_em1", 0 );
    setomnvar( "ui_em1_heat", 0 );
}

_id_3060()
{
    self endon( "death" );
    self endon( "weapon_change" );
    self notify( "em1_heat_meter" );
    self endon( "em1_heat_meter" );
    thread _id_3061();
    setomnvar( "ui_em1", 1 );
    setomnvar( "ui_em1_heat", 0 );

    for (;;)
    {
        var_0 = self _meth_830E();
        var_1 = self _meth_83B7( var_0 );
        setomnvar( "ui_em1_heat", var_1 );
        wait 0.05;
    }
}

_id_A2B3( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( _func_1B8( var_0 ) == "beam" && _func_120( var_0, "_em1" ) )
        return 1;

    return 0;
}

_id_4773()
{
    common_scripts\utility::_id_A069( "death", "weapon_change", "hbra3_signature" );
    setomnvar( "ui_hbra3", 0 );
}

_id_4772()
{
    self endon( "death" );
    self endon( "weapon_change" );
    self notify( "hbra3_signature" );
    self endon( "hbra3_signature" );
    thread _id_4773();
    setomnvar( "ui_hbra3", 1 );
}

_id_A2B4( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( _func_1B8( var_0 ) == "rifle" && _func_120( var_0, "_hbra3" ) )
        return 1;

    return 0;
}

_id_48AC()
{
    self endon( "death" );
    self endon( "himar_print_ammo_stop" );

    if ( isdefined( self._id_48AD ) && self._id_48AD )
        return;

    self._id_48AD = 1;
    self notify( "himar_print_ammo" );
    self endon( "himar_print_ammo" );
    setomnvar( "ui_himar", 1 );
    setomnvar( "ui_himar_printing", 0 );
    var_0 = undefined;

    foreach ( var_2 in self _meth_8309() )
    {
        if ( _func_120( var_2, "himar" ) )
        {
            var_0 = var_2;
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        return;

    for (;;)
    {
        var_4 = self _meth_8331( var_0 );
        setomnvar( "ui_himar_printing", var_4 );

        if ( var_4 < 1.0 )
        {
            thread _id_48AE( var_0 );
            common_scripts\utility::_id_A0A0( "himar_ammo_full", 30 );
            self notify( "stop_himar_printing_ammo_full_check" );
            var_5 = self _meth_82F6( var_0 );
            var_6 = _func_1E6( var_0 );
            var_7 = var_5 + _func_1B1( var_0 );

            if ( var_7 > var_6 )
                var_7 = var_6;

            self _meth_82F4( var_0, var_7 );
            continue;
        }

        wait 1;
    }
}

_id_48AE( var_0 )
{
    self endon( "stop_himar_printing_ammo_full_check" );

    while ( self _meth_8331( var_0 ) != 1 )
        wait 0.5;

    self notify( "himar_ammo_full" );
}

_id_A2B5( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( _func_1B8( var_0 ) == "rifle" && _func_120( var_0, "_himar" ) )
        return 1;

    return 0;
}

_id_6B47()
{
    foreach ( var_1 in self _meth_8309() )
    {
        if ( _func_120( var_1, "iw5_himar_sp" ) && _func_120( var_1, "himarscope" ) )
            return 1;
    }

    self._id_48AD = undefined;
    self notify( "himar_print_ammo_stop" );
    setomnvar( "ui_himar", 0 );
    setomnvar( "ui_himar_printing", 0 );
    return 0;
}

_id_A2B2( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    if ( _func_1EB( var_0 ) )
        return 1;

    return 0;
}

_id_9300()
{
    self endon( "death" );
    self notify( "acogThermalTracker" );
    self endon( "acogThermalTracker" );
    var_0 = 0;

    for (;;)
    {
        var_1 = var_0;
        var_0 = self _meth_833D();

        if ( _id_992A( var_0, var_1 ) )
            _id_92FF();
        else if ( _id_9929( var_0, var_1 ) )
            _id_92FE();

        wait 0.05;
    }
}

_id_992A( var_0, var_1 )
{
    if ( var_0 <= var_1 )
        return 0;

    if ( var_0 <= 0.65 )
        return 0;

    return !isdefined( self._id_503F );
}

_id_9929( var_0, var_1 )
{
    if ( var_0 >= var_1 )
        return 0;

    if ( var_0 >= 0.8 )
        return 0;

    return isdefined( self._id_503F );
}

_id_92FF()
{
    self._id_503F = 1;
    var_0 = _func_0D9( "allies" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_4702 ) )
            continue;

        var_2._id_4702 = 1;
        var_2 thread _id_586F( self._id_9A29 );
    }

    if ( _id_A5A4::_id_500C() )
    {
        var_4 = _id_A5A4::_id_3E07( self );

        if ( !isdefined( var_4._id_4702 ) )
        {
            var_4._id_4702 = 1;
            var_4 thread _id_586F( self._id_9A29, self );
        }
    }
}

_id_92FE()
{
    self._id_503F = undefined;
    level notify( "thermal_fx_off" + self._id_9A29 );
    var_0 = _func_0D9( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_4702 = undefined;

    if ( _id_A5A4::_id_500C() )
    {
        var_2 = _id_A5A4::_id_3E07( self );
        var_2._id_4702 = undefined;
    }
}

_id_586F( var_0, var_1 )
{
    if ( !isdefined( self.has_ir ) )
        return;

    level endon( "thermal_fx_off" + var_0 );
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( var_1 ) )
            playfxontagforclients( level._id_3A8C, self, "J_Spine4", var_1 );
        else
            playfxontag( level._id_3A8C, self, "J_Spine4" );

        wait 0.2;
    }
}

_id_1E42()
{
    precacheitem( "claymore" );
    self endon( "deleted" );
    self _meth_80DC( "HINT_NOICON" );
    self _meth_80DD( &"WEAPON_CLAYMORE_PICKUP" );
    self _meth_80C1();
    var_0 = _func_1E6( "claymore" ) + _func_1B1( "claymore" );

    if ( isdefined( self._id_7937 ) )
        var_0 = self._id_7937;

    while ( var_0 > 0 )
    {
        self waittill( "trigger", var_1 );
        var_1 _meth_809C( "null" );
        var_2 = 0;

        if ( !var_1 _meth_8311( "claymore" ) )
            var_1 _meth_830B( "claymore" );
        else
            var_2 = var_1 _meth_8183( "claymore" );

        if ( isdefined( var_0 ) && var_0 > 0 )
        {
            var_0 = var_2 + var_0;
            var_3 = _func_1E6( "claymore" );
            var_4 = _func_1B1( "claymore" );

            if ( var_0 >= var_4 )
            {
                var_0 -= var_4;
                var_1 _meth_82F3( "claymore", var_4 );
            }

            if ( var_0 >= var_3 )
            {
                var_0 -= var_3;
                var_1 _meth_82F4( "claymore", var_3 );
            }
            else if ( var_0 > 0 )
            {
                var_1 _meth_82F4( "claymore", var_0 );
                var_0 = 0;
            }
        }
        else
            var_1 _meth_832F( "claymore" );

        var_5 = 4;

        if ( isdefined( var_1._id_7325 ) && var_1._id_7325 == 4 )
            var_5 = 2;

        var_1 _meth_8305( var_5, "weapon", "claymore" );
        var_1 _meth_8312( "claymore" );
    }

    if ( isdefined( self._id_04A4 ) )
    {
        var_6 = getentarray( self._id_04A4, "targetname" );

        foreach ( var_8 in var_6 )
            var_8 delete();
    }

    self _meth_80C2();
    self delete();
}

_id_0B6F( var_0 )
{
    self endon( "remove_ammo_cache" );
    self._id_9BEB = spawn( "script_model", self._id_02E2 + ( 0, 0, 28 ) );
    self._id_9BEB _meth_80B3( "tag_origin" );
    self._id_9BEB _meth_80C1();
    self._id_9BEB _meth_80DC( "HINT_NOICON" );
    var_1 = &"WEAPON_CACHE_USE_HINT";

    if ( getdvar( "consoleGame" ) == "true" )
        var_1 = &"WEAPON_CACHE_USE_CONTROLLER_HINT";

    self._id_9BEB _meth_80DD( var_1 );

    if ( !isdefined( var_0 ) || isdefined( var_0 ) && var_0 )
        thread _id_0B73();

    for (;;)
    {
        self._id_9BEB waittill( "trigger", var_2 );

        if ( isdefined( var_2._id_2D17 ) )
            continue;

        var_2._id_9C1F = 1;
        self notify( "used_ammo_cache" );
        self._id_9BEB _meth_80C2();
        var_2 _meth_809C( "player_refill_all_ammo" );
        var_2 _meth_831A();
        wait 0.1;
        var_3 = var_2 _meth_8308();

        foreach ( var_5 in var_3 )
        {
            if ( var_5 == "claymore" )
                continue;

            if ( var_5 == "c4" )
                continue;

            var_2 _meth_832F( var_5 );
            var_6 = _func_1B1( var_5 );

            if ( isdefined( var_6 ) )
            {
                if ( var_2 _meth_82F5( var_5 ) < var_6 )
                    var_2 _meth_82F3( var_5, var_6 );
            }
        }

        wait 1.4;
        var_2 _meth_831B();
        self._id_9BEB _meth_80C1();
        var_2._id_9C1F = undefined;
    }
}

_id_0B73()
{
    self endon( "remove_ammo_cache" );
    var_0 = spawn( "trigger_radius", self._id_02E2, 0, 320, 72 );
    var_1 = _func_1A9();
    var_1 _meth_80CE( "waypoint_ammo", 1, 1 );
    var_1.alpha = 0;
    var_1.color = ( 1, 1, 1 );
    var_1._id_0530 = self._id_02E2[0];
    var_1._id_0538 = self._id_02E2[1];
    var_1._id_053B = self._id_02E2[2] + 16;
    var_1 _meth_80DA( 1, 1 );
    self._id_0B70 = var_1;
    self._id_0B74 = var_0;

    if ( isdefined( self._id_4B29 ) && self._id_4B29 )
    {
        _id_0B71( var_1 );
        return;
    }

    wait 0.05;

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( !_func_1AD( var_2 ) )
            continue;

        while ( var_2 _meth_80AB( var_0 ) )
        {
            var_3 = 1;
            var_4 = var_2 _meth_830E();

            if ( var_4 == "none" )
                var_3 = 0;
            else if ( var_2 _meth_8331( var_4 ) > 0.9 )
                var_3 = 0;

            if ( _id_A5A4::_id_6B91( self._id_02E2, 0.8, 1 ) && var_3 )
                _id_0B71( var_1 );
            else
                _id_0B72( var_1 );

            wait 0.25;
        }

        _id_0B72( var_1 );
    }
}

_id_0B71( var_0 )
{
    if ( var_0.alpha != 0 )
        return;

    var_0 _meth_8086( 0.2 );
    var_0.alpha = 0.3;
    wait 0.2;
}

_id_0B72( var_0 )
{
    if ( var_0.alpha == 0 )
        return;

    var_0 _meth_8086( 0.2 );
    var_0.alpha = 0;
    wait 0.2;
}

_id_A337()
{
    var_0 = _func_1D5( self._id_04A4 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( self._id_0398 ) )
    {
        if ( self._id_0398 == "ondamage" || self._id_0398 == "ondamage_appear" )
        {
            if ( self._id_0398 == "ondamage_appear" )
                self _meth_8056();

            level waittillmatch( "glass_damaged", var_0 );

            if ( self._id_0398 == "ondamage_appear" )
            {
                self _meth_8055();
                level waittillmatch( "glass_destroyed", var_0 );
            }

            self delete();
        }
        else
        {
            level waittillmatch( "glass_destroyed", var_0 );
            self delete();
        }
    }
    else
    {
        level waittillmatch( "glass_destroyed", var_0 );
        self delete();
    }
}

_id_422C( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_A2C5()
{
    common_scripts\utility::_id_23AE( "weaponlist", "0" );

    if ( !getdvarint( "weaponlist" ) )
        return;

    var_0 = getentarray();
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3.code_classname ) )
            continue;

        if ( _func_120( var_3.code_classname, "weapon" ) )
            var_1[var_3.classname] = 1;
    }

    foreach ( var_7, var_6 in var_1 )
    {

    }

    var_8 = _func_0DB();
    var_9 = [];

    foreach ( var_11 in var_8 )
        var_9[var_11.code_classname] = 1;

    foreach ( var_14, var_6 in var_9 )
    {

    }
}

_id_864A()
{
    level._id_8637 = spawnstruct();
    _id_8649();
    notifyoncommand( "_cheat_player_press_slowmo", "+melee" );
    notifyoncommand( "_cheat_player_press_slowmo", "+melee_breath" );
    notifyoncommand( "_cheat_player_press_slowmo", "+melee_zoom" );
}

_id_8649()
{
    level._id_8637._id_56A9 = 0.0;
    level._id_8637._id_56AA = 0.25;
    level._id_8637._id_8A56 = 0.4;
    level._id_8637._id_8A53 = 1.0;
}

_id_0779()
{
    var_0 = getentarray( "script_origin_start_nogame", "classname" );

    if ( !var_0.size )
        return;

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_7ADD ) )
            continue;

        _id_A5A4::_id_079C( "no_game_" + var_2._id_7ADD, ::_id_8C16 );
    }
}

_id_2BC7()
{
    if ( !_id_A5A4::_id_5056() )
        return;

    _func_0D6( "ufoHitsTriggers", "1" );
    level._id_8E9E = 1;

    if ( isdefined( level._id_254C ) )
        level [[ level._id_254C ]]();

    _id_A551::_id_4D0F();
    _id_A5DC::_id_0F91();
    _id_A5E8::_id_86F4();
    _id_A538::main();
    thread _id_A580::init();
    _id_2BC8();
    common_scripts\utility::_id_0CDB( getentarray( "truckjunk", "targetname" ), ::delete );
    common_scripts\utility::_id_0CDB( getentarray( "truckjunk", "script_noteworthy" ), ::delete );
    level waittill( "eternity" );
}

_id_2BC8()
{
    var_0 = getentarray( "script_origin_start_nogame", "classname" );

    if ( !var_0.size )
        return;

    var_0 = _func_1BA( var_0, level._id_0318._id_02E2 );

    if ( level._id_8C36 == "no_game" )
    {
        level._id_0318 _id_A5A4::_id_923E( var_0[0] );
        return;
    }

    var_1 = _func_122( level._id_8C36, 8 );
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4._id_7ADD ) )
            continue;

        if ( var_1 != var_4._id_7ADD )
            continue;

        if ( isdefined( var_4._id_03A1 ) )
            _id_A5A4::_id_9E6E( var_4._id_03A1, 0 );

        level._id_0318 _id_A5A4::_id_923E( var_4 );
        var_2 = 1;
        break;
    }

    if ( !var_2 )
        level._id_0318 _id_A5A4::_id_923E( var_0[0] );
}

_id_4CB2()
{
    level._id_0C8A = [];
    level._id_0C82 = [];
    waitframe;
    waitframe;
    var_0 = _func_1D3( level._id_78B6 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        _id_4D21( var_0[var_1] );

    var_0 = _func_1D3( level._id_78B0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        _id_4CB3( var_0[var_1] );
}

_id_4CB3( var_0 )
{
    var_1 = _func_1D3( level._id_78B0[var_0] );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        var_4 = level._id_78B0[var_0][var_3];
        level._id_0C82[var_0][var_3]["#" + var_3]["soundalias"] = var_4;
        level._id_0C82[var_0][var_3]["#" + var_3]["created_by_animSound"] = 1;
    }
}

_id_4D21( var_0 )
{
    foreach ( var_10, var_2 in level._id_78B6[var_0] )
    {
        foreach ( var_9, var_4 in var_2 )
        {
            foreach ( var_6 in var_4 )
            {
                var_7 = var_6["sound"];

                if ( !isdefined( var_7 ) )
                    continue;

                level._id_0C82[var_0][var_10][var_9]["soundalias"] = var_7;

                if ( isdefined( var_6["created_by_animSound"] ) )
                    level._id_0C82[var_0][var_10][var_9]["created_by_animSound"] = 1;
            }
        }
    }
}

_id_277C()
{
    animscripts\utility::_id_7F74( "default", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "asphalt", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "cushion", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "vfx/treadfx/footstep_dust" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "gravel", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "vfx/treadfx/footstep_mud" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "water_waist", loadfx( "vfx/treadfx/footstep_water" ) );
    animscripts\utility::_id_7F74( "water_ankle", loadfx( "vfx/treadfx/footstep_water" ) );
    animscripts\utility::_id_7F74( "water_knee", loadfx( "vfx/treadfx/footstep_water" ) );
    animscripts\utility::_id_7F74( "snow", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F74( "ice", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "default", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "asphalt", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "brick", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "carpet", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "cloth", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "concrete", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "cushion", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "dirt", loadfx( "vfx/treadfx/footstep_dust" ) );
    animscripts\utility::_id_7F75( "foliage", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "grass", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "gravel", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "mud", loadfx( "vfx/treadfx/footstep_mud" ) );
    animscripts\utility::_id_7F75( "rock", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "sand", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "wood", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "water_waist", loadfx( "vfx/treadfx/footstep_water" ) );
    animscripts\utility::_id_7F75( "water_ankle", loadfx( "vfx/treadfx/footstep_water" ) );
    animscripts\utility::_id_7F75( "water_knee", loadfx( "vfx/treadfx/footstep_water" ) );
    animscripts\utility::_id_7F75( "snow", loadfx( "vfx/unique/no_fx" ) );
    animscripts\utility::_id_7F75( "ice", loadfx( "vfx/unique/no_fx" ) );
    var_0 = "bodyfall small";
    var_1 = "J_SpineLower";
    var_2 = "bodyfall_";
    var_3 = "_small";
    animscripts\utility::_id_7FBF( var_0, var_1, "dirt", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );
    animscripts\utility::_id_7FBF( var_0, var_1, "concrete", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );
    animscripts\utility::_id_7FBF( var_0, var_1, "asphalt", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );
    animscripts\utility::_id_7FBF( var_0, var_1, "rock", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );
    var_4 = [ "brick", "carpet", "foliage", "grass", "gravel", "ice", "metal", "painted metal", "mud", "plaster", "sand", "snow", "slush", "water", "wood", "ceramic" ];

    foreach ( var_6 in var_4 )
        animscripts\utility::_id_7FC0( var_0, var_6, var_2, var_3 );

    var_0 = "bodyfall small";
    var_1 = "J_SpineLower";
    var_2 = "bodyfall_";
    var_3 = "_large";
    animscripts\utility::_id_7FBF( var_0, var_1, "dirt", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );
    animscripts\utility::_id_7FBF( var_0, var_1, "concrete", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );
    animscripts\utility::_id_7FBF( var_0, var_1, "asphalt", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );
    animscripts\utility::_id_7FBF( var_0, var_1, "rock", loadfx( "vfx/treadfx/bodyfall_default_runner" ), var_2, var_3 );

    foreach ( var_6 in var_4 )
        animscripts\utility::_id_7FC0( var_0, var_6, var_2, var_3 );
}

_id_3AFB()
{
    wait 3;

    if ( level._id_8BB5.size <= 0 )
        return;

    var_0 = _id_3E70();

    if ( !isdefined( var_0 ) || !isdefined( level._id_8C36 ) )
        return;

    var_1 = 0;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] == level._id_8C36 )
        {
            var_1++;
            break;
        }
    }

    if ( var_1 >= var_0.size )
        return;

    setdvar( "start", var_0[var_1] );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachestring( &"SCRIPT_PLATFORM_CHEAT_USETOSLOWMO" );
    precacheshellshock( "chaplincheat" );
    precachemodel( "com_junktire" );
    level.random_tire_model = "com_junktire";
    level._id_9E5C = 0;
    _func_0D6( "using_vision_cheat", 0 );
    level.tire_explosion = 0;
    level.cheatstates = [];
    level.cheatfuncs = [];
    level.cheatdvars = [];
    level.cheatbobamporiginal = getdvar( "bg_bobAmplitudeStanding" );
    level.cheatshowslowmohint = 0;
    level.cheattires = [];
    level.cheattires_max = 90;
    level.cheat_super_ragdoll = 0;
    thread melonhead_mode_init();
    thread lemonade_mode_init();
    thread tracksuit_mode_init();
    thread tire_explosionmode_init();

    if ( !isdefined( level._id_058F ) )
        level._id_058F = [];

    level._id_058F["grain_test"] = loadfx( "fx/misc/grain_test" );
    common_scripts\utility::_id_383D( "has_cheated" );
    level.visionsets["bw"] = 0;
    level.visionsets["invert"] = 0;
    level.visionsets["contrast"] = 0;
    level.visionsets["chaplin"] = 0;
    _id_864A();
    thread death_monitor();
    common_scripts\utility::_id_383D( "disable_slowmo_cheat" );

    if ( getdvar( "credits_active" ) == "1" )
        return;

    level._id_0318 thread specialfeaturesmenu();
}

death_monitor()
{
    setdvars_based_on_varibles();

    for (;;)
    {
        if ( _func_087() )
            setdvars_based_on_varibles();

        wait 0.1;
    }
}

setdvars_based_on_varibles()
{
    for ( var_0 = 0; var_0 < level.cheatdvars.size; var_0++ )
        setdvar( level.cheatdvars[var_0], level.cheatstates[level.cheatdvars[var_0]] );

    if ( !isdefined( level._id_244D ) || !level._id_244D )
    {
        setdvar( "credits_active", "0" );
        setdvar( "credits_load", "0" );
    }
}

getcheatvalue( var_0 )
{
    var_1 = getdvarint( var_0, 0 ) && getdvar( "arcademode" ) != "1";
    return var_1;
}

addcheat( var_0, var_1 )
{
    setdvarifuninitialized( var_0, 0 );
    level.cheatstates[var_0] = getcheatvalue( var_0 );
    level.cheatfuncs[var_0] = var_1;

    if ( level.cheatstates[var_0] )
        [[ var_1 ]]( level.cheatstates[var_0] );
}

checkcheatchanged( var_0 )
{
    var_1 = getcheatvalue( var_0 );

    if ( level.cheatstates[var_0] == var_1 )
        return;

    if ( var_1 )
        common_scripts\utility::_id_383F( "has_cheated" );

    level.cheatstates[var_0] = var_1;
    [[ level.cheatfuncs[var_0] ]]( var_1 );
}

specialfeaturesmenu()
{
    level waittill( "load_finished" );
    addcheat( "sf_use_contrast", ::contrastmode );
    addcheat( "sf_use_bw", ::bwmode );
    addcheat( "sf_use_invert", ::invertmode );
    addcheat( "sf_use_slowmo", ::slowmomode );
    addcheat( "sf_use_chaplin", ::chaplinmode );
    addcheat( "sf_use_ignoreammo", ::ignore_ammomode );
    addcheat( "sf_use_clustergrenade", ::clustergrenademode );
    addcheat( "sf_use_tire_explosion", ::tire_explosionmode );
    addcheat( "sf_use_melon_mode", ::melonhead_mode_update );
    addcheat( "sf_use_ragdoll_mode", ::ragdoll_mode );
    addcheat( "sf_use_lemonade_mode", ::lemonade_mode_update );
    addcheat( "sf_use_tracksuit_mode", ::tracksuit_mode_update );
    level.cheatdvars = _func_1D3( level.cheatstates );

    if ( is_cheating() )
        common_scripts\utility::_id_383F( "has_cheated" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level.cheatdvars.size; var_0++ )
            checkcheatchanged( level.cheatdvars[var_0] );

        wait 0.05;
    }
}

tire_explosionmode_init()
{
    _id_A5A4::_id_0761( "axis", ::tirecheat_dogs_enemy_spawned );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::tirecheat_dogs_enemy_spawned );
}

tirecheat_dogs_enemy_spawned()
{
    if ( !isdefined( self.classname ) )
        return;

    if ( self.classname != "actor_enemy_dog" )
        return;

    self waittill( "death" );

    if ( _func_29C( self ) )
        return;

    if ( level.tire_explosion )
    {
        var_0 = self._id_02E2;
        var_1 = self _meth_80AA();
        waitframe;

        for ( var_2 = 0; var_2 < 15; var_2++ )
            thread _id_A581::random_tire( var_0, var_1 );

        if ( isdefined( self ) && !_func_29C( self ) )
            self delete();
    }
}

tire_explosionmode( var_0 )
{
    if ( var_0 )
        level.tire_explosion = 1;
    else
        level.tire_explosion = 0;
}

clustergrenademode( var_0 )
{
    if ( var_0 )
        level._id_0318 thread wait_for_grenades();
    else
        level notify( "end_cluster_grenades" );
}

wait_for_grenades()
{
    level endon( "end_cluster_grenades" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( isdefined( var_0.cluster_grenade ) && var_0.cluster_grenade )
            continue;

        if ( var_1 == "fraggrenade" || var_1 == level.cheat_lemonade_weaponname )
            var_0 thread create_clustergrenade( "fraggrenade" );
    }
}

create_clustergrenade( var_0 )
{
    var_1 = self._id_02E2;

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        var_1 = self._id_02E2;
        wait 0.1;
    }

    var_1 += ( 0, 0, 5 );
    var_2 = 8;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = getclustergrenadevelocity();
        var_5 = 1.5 + var_3 / 6 + _func_0B3( 0.1 );
        var_6 = _func_073( var_0, var_1, var_4, var_5, level._id_0318 );
        var_6.cluster_grenade = 1;
    }
}

getclustergrenadevelocity()
{
    var_0 = _func_0B3( 360 );
    var_1 = _func_0B5( 65, 85 );
    var_2 = _func_0B6( var_1 );
    var_3 = _func_0B7( var_1 );
    var_4 = _func_0B7( var_0 ) * var_3;
    var_5 = _func_0B6( var_0 ) * var_3;
    var_6 = _func_0B5( 400, 600 );
    var_7 = ( var_4, var_5, var_2 ) * var_6;
    return var_7;
}

ignore_ammomode( var_0 )
{
    if ( level._id_038E == "ac130" )
        return;

    if ( var_0 )
        _func_0D6( "player_sustainAmmo", 1 );
    else
        _func_0D6( "player_sustainAmmo", 0 );
}

contrastmode( var_0 )
{
    if ( var_0 )
        level.visionsets["contrast"] = 1;
    else
        level.visionsets["contrast"] = 0;

    applyvisionsets();
}

bwmode( var_0 )
{
    if ( var_0 )
        level.visionsets["bw"] = 1;
    else
        level.visionsets["bw"] = 0;

    applyvisionsets();
}

invertmode( var_0 )
{
    if ( var_0 )
        level.visionsets["invert"] = 1;
    else
        level.visionsets["invert"] = 0;

    applyvisionsets();
}

applyvisionsets()
{
    if ( level._id_038E == "ac130" )
        return;

    var_0 = 0;
    var_1 = "";

    if ( level.visionsets["bw"] )
        var_1 += "_bw";

    if ( level.visionsets["invert"] )
    {
        var_1 += "_invert";

        if ( isdefined( level.cheat_invert_override ) )
            var_1 += level.cheat_invert_override;
    }

    if ( level.visionsets["contrast"] )
    {
        var_1 += "_contrast";

        if ( isdefined( level.cheat_highcontrast_override ) )
            var_1 += level.cheat_highcontrast_override;
    }

    if ( level.visionsets["chaplin"] )
    {
        level._id_9E5C = 1;
        _func_0D6( "using_vision_cheat", 1 );
        _func_143( "sepia", var_0 );
    }
    else if ( var_1 != "" )
    {
        level._id_9E5C = 1;
        _func_0D6( "using_vision_cheat", 1 );
        _func_143( "cheat" + var_1, var_0 );
    }
    else
    {
        level._id_9E5C = 0;
        _func_0D6( "using_vision_cheat", 0 );
        _id_A5A4::_id_7F00( level._id_58BC, var_0 );
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

slowmo_check_system()
{
    return 1;
}

slowmo_hintprint()
{
    common_scripts\utility::_id_384A( "introscreen_complete" );

    if ( level.cheatshowslowmohint != 0 )
    {
        level.cheatshowslowmohint = 0;
        return;
    }

    if ( level._id_2153 )
        var_0 = 5;
    else
        var_0 = 6;

    level.cheatshowslowmohint = 1;
    var_1 = 180;
    var_2 = _id_A546::_id_2420( "h1_hud_tutorial_blur", 400, 25 );
    var_3 = _id_A546::_id_2420( "h1_hud_tutorial_border", 400, 1 );
    var_4 = _id_A546::_id_2420( "h1_hud_tutorial_border", 400, 1 );
    var_2 _id_A546::_id_7FEE( "TOP", undefined, 0, var_1 );
    var_2._id_03D4 = 1;
    var_2._id_01ED = 1;
    var_2._id_01EB = 1;
    var_2.alpha = 0.9;
    var_3 _id_A546::_id_7FEE( "TOP", undefined, 0, var_1 );
    var_3._id_03D4 = 1;
    var_3._id_01ED = 1;
    var_3._id_01EB = 1;
    var_3.alpha = 0.05;
    var_4 _id_A546::_id_7FEE( "TOP", undefined, 0, var_1 + 24 );
    var_4._id_03D4 = 1;
    var_4._id_01ED = 1;
    var_4._id_01EB = 1;
    var_4.alpha = 0.05;
    var_5 = _id_A546::_id_2401( "timer", 0.5 );
    var_5._id_01ED = 1;
    var_5 _id_A546::_id_7FEE( "TOP", undefined, 0, var_1 + var_0 );
    var_5._id_03D4 = 0.5;
    var_5 _meth_80CC( &"SCRIPT_PLATFORM_CHEAT_USETOSLOWMO" );

    for ( var_6 = 0; var_6 < 100; var_6++ )
    {
        if ( level.cheatshowslowmohint != 1 )
            break;

        wait 0.1;
    }

    level.cheatshowslowmohint = 0;
    var_2 _meth_8086( 0.5 );
    var_2.alpha = 0;
    var_3 _meth_8086( 0.5 );
    var_3.alpha = 0;
    var_4 _meth_8086( 0.5 );
    var_4.alpha = 0;
    var_5 _meth_8086( 0.5 );
    var_5.alpha = 0;
    wait 0.5;
    var_2 _meth_808A();
    var_3 _meth_808A();
    var_4 _meth_808A();
    var_5 _meth_808A();
}

slowmomode( var_0 )
{
    level.slowmo_mode_enabled = common_scripts\utility::_id_9294( var_0, 1, 0 );

    if ( level.slowmo_mode_enabled )
    {
        level._id_8637 thread gamespeed_proc();
        level._id_0318 _meth_8132( 0 );
        thread slowmo_hintprint();
    }
    else
    {
        level notify( "disable_slowmo" );
        level._id_0318 _meth_8132( 1 );
        level._id_8637 thread gamespeed_reset();
        level.cheatshowslowmohint = 0;
    }
}

gamespeed_proc()
{
    level endon( "disable_slowmo" );
    thread gamespeed_reset_on_death();

    for (;;)
    {
        level._id_0318 waittill( "_cheat_player_press_slowmo" );
        level.cheatshowslowmohint = 0;
        _id_8649();

        if ( !common_scripts\utility::_id_382E( "disable_slowmo_cheat" ) )
        {
            if ( gettimescale() < level._id_8637._id_8A53 )
                thread gamespeed_reset();
            else
                thread gamespeed_slowmo();
        }

        waitframe;
    }
}

gamespeed_reset_on_death()
{
    level notify( "gamespeed_reset_on_death" );
    level endon( "gamespeed_reset_on_death" );
    level._id_0318 waittill( "death" );
    thread gamespeed_reset();
}

gamespeed_slowmo()
{
    level._id_0318 thread common_scripts\utility::_id_6975( "h1_slowmo_cheat_heartbeat" );
    _func_0B1( self._id_8A53, self._id_8A56, self._id_56A9 );
}

gamespeed_reset()
{
    level._id_0318 thread common_scripts\utility::_id_8EA1( "h1_slowmo_cheat_heartbeat" );

    if ( !common_scripts\utility::_id_382E( "disable_slowmo_cheat" ) )
        _func_0B1( self._id_8A56, self._id_8A53, self._id_56AA );
}

slowmomodesuspend()
{
    level endon( "slowmo_resume" );

    if ( gettimescale() < level._id_8637._id_8A53 )
        level.sloweddown = 1;

    for (;;)
    {
        if ( isdefined( level.slowmo_mode_enabled ) && level.slowmo_mode_enabled )
        {
            level notify( "disable_slowmo" );
            level._id_8637 thread gamespeed_reset();
            level._id_0318 _meth_8132( 1 );
        }

        wait 0.05;
    }
}

slowmomoderesume()
{
    if ( isdefined( level.slowmo_mode_enabled ) && level.slowmo_mode_enabled )
    {
        level notify( "slowmo_resume" );

        if ( isdefined( level.sloweddown ) )
            level._id_8637 thread gamespeed_slowmo();

        level._id_8637 thread gamespeed_proc();
        level._id_0318 _meth_8132( 0 );
        level.sloweddown = undefined;
    }
}

chaplinmode( var_0 )
{
    if ( level._id_038E == "ac130" )
        return;

    if ( var_0 )
    {
        _func_0D6( "chaplincheat", "1" );
        level.cheatbobamporiginal = getdvar( "bg_weaponBobAmplitudeStanding" );
        _func_0D6( "bg_weaponBobAmplitudeStanding", "0.08 0.04" );
        setomnvar( "ui_ragtimewarefare_overlay", 1 );
        level.visionsets["chaplin"] = 1;
        _func_144( "cheat_chaplinnight" );
        chaplin_grain_start();
        thread chaplin_proc();
    }
    else
    {
        level notify( "disable_chaplin" );
        level notify( "disable_chaplin_grain" );
        chaplin_grain_end();
        level._id_0318 _meth_8188();
        _func_144( "default_night" );
        setomnvar( "ui_ragtimewarefare_overlay", 0 );
        level.visionsets["chaplin"] = 0;
        _id_A5E8::_id_870C( "aud_stop_ragtime_warfare" );
        _func_0D6( "bg_weaponBobAmplitudeStanding", level.cheatbobamporiginal );
        _func_0D6( "chaplincheat", "0" );

        if ( !common_scripts\utility::_id_382E( "disable_slowmo_cheat" ) )
            settimescale( 1.0 );
    }

    applyvisionsets();
}

chaplin_titlecard_create_background()
{
    var_0 = _func_1A9();
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 1;
    var_0._id_0198 = 1;
    var_0._id_03D4 = 0;
    return var_0;
}

chaplin_titlecard_create_text( var_0 )
{
    var_1 = _func_1A9();
    var_1._id_0530 = 0;
    var_1._id_0538 = -40;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1._id_01F3 = "center";
    var_1._id_0501 = "middle";
    var_1._id_0198 = 1;
    var_1 _meth_80CC( var_0 );
    var_1._id_0189 = 3;
    var_1.alpha = 1;
    var_1._id_03D4 = 1;
    var_1.color = ( 0.976, 0.796, 0.412 );
    return var_1;
}

chaplin_titlecard( var_0 )
{
    if ( getdvar( "chaplincheat" ) != "1" )
        return;

    if ( getdvar( "cheat_chaplin_titlecardshowing" ) == "1" )
        return;

    if ( common_scripts\utility::_id_382E( "disable_slowmo_cheat" ) )
        return;

    setdvar( "cheat_chaplin_titlecardshowing", 1 );
    var_1 = chaplin_titlecard_create_background();
    var_2 = chaplin_titlecard_create_text( var_0 );
    settimescale( 0.05 );
    wait 0.15;
    settimescale( 1 );
    var_1 _meth_808A();
    var_2 _meth_808A();
    setdvar( "cheat_chaplin_titlecardshowing", 0 );
}

chaplin_proc()
{
    level endon( "disable_chaplin" );
    _id_A5E8::_id_870C( "aud_start_ragtime_warfare" );

    for (;;)
    {
        level._id_0318 _meth_8186( "chaplincheat", 60, 1 );
        wait 0.5;

        if ( !common_scripts\utility::_id_382E( "disable_slowmo_cheat" ) )
        {
            if ( getdvar( "cheat_chaplin_titlecardshowing" ) == "1" )
            {
                settimescale( 0.05 );
                continue;
            }

            settimescale( 1.7 );
        }
    }
}

chaplin_grain_start()
{
    level.cheatgrainlooper = spawn( "script_model", level._id_0318 _meth_80AA() );
    level.cheatgrainlooper _meth_80B3( "tag_origin" );
    level.cheatgrainlooper _meth_8056();
    playfxontag( level._id_058F["grain_test"], level.cheatgrainlooper, "tag_origin" );
    thread chaplin_grain_proc();
}

chaplin_grain_end()
{
    if ( !isdefined( level.cheatgrainlooper ) )
        return;

    level.cheatgrainlooper delete();
}

chaplin_grain_proc()
{
    level endon( "disable_chaplin_grain" );

    for (;;)
    {
        level.cheatgrainlooper._id_02E2 = level._id_0318 _meth_80AA() + 50 * anglestoforward( level._id_0318 _meth_8338() );
        wait 0.01;
    }
}

is_cheating()
{
    for ( var_0 = 0; var_0 < level.cheatdvars.size; var_0++ )
    {
        if ( level.cheatstates[level.cheatdvars[var_0]] )
            return 1;
    }

    return 0;
}

ragdoll_mode( var_0 )
{
    level.cheat_super_ragdoll = common_scripts\utility::_id_9294( var_0, 1, 0 );
}

melonhead_mode_init()
{
    level.melonhead_mode_enabled = 0;
    level.melonhead_mode_fx = loadfx( "fx/props/watermelon" );
    level.melonhead_mode_attachtag = "j_head";
    level.melonhead_mode_model = "me_fruit_watermelon_oblong";
    precachemodel( level.melonhead_mode_model );
    _id_A5A4::_id_0761( "axis", ::melonhead_monitor );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::melonhead_monitor );
}

melonhead_mode_update( var_0 )
{
    level.melonhead_mode_enabled = common_scripts\utility::_id_9294( var_0, 1, 0 );
    level notify( "melonhead_mode_updated" );
}

melonhead_monitor()
{
    self endon( "death" );
    self notify( "melonhead_monitor" );
    self endon( "melonhead_monitor" );
    waittillframeend;

    if ( isdefined( self.melonhead_ignore ) && self.melonhead_ignore )
        return;

    for (;;)
    {
        if ( level.melonhead_mode_enabled )
            melonhead_add_melon();
        else
            melonhead_remove_melon();

        level waittill( "melonhead_mode_updated" );
    }
}

melonhead_add_melon()
{
    if ( _func_29C( self ) )
        return;

    if ( isdefined( self.melonhead_disabled ) && self.melonhead_disabled )
        return;

    if ( isdefined( self.melonhead_attached ) )
        return;

    self _meth_801D( level.melonhead_mode_model, level.melonhead_mode_attachtag, 1 );
    self.melonhead_attached = 1;
    thread melonhead_detect_death();
    thread melonhead_detect_hit();
}

melonhead_remove_melon( var_0, var_1 )
{
    if ( _func_29C( self ) )
        return;

    if ( isdefined( var_1 ) && var_1 )
        self.melonhead_disabled = 1;

    if ( !isdefined( self.melonhead_attached ) )
        return;

    self _meth_802A( level.melonhead_mode_model, level.melonhead_mode_attachtag );
    self.melonhead_attached = undefined;

    if ( isdefined( var_0 ) && var_0 )
    {
        playfx( level.melonhead_mode_fx, self _meth_8184( level.melonhead_mode_attachtag ), anglestoforward( self.angles ) );
        thread common_scripts\utility::_id_69C2( "h1_hit_watermelon", self _meth_8184( level.melonhead_mode_attachtag ) );
    }

    self notify( "melonhead_removed" );
}

melonhead_detect_death()
{
    self endon( "melonhead_removed" );
    self waittill( "death" );
    melonhead_remove_melon( 1 );
}

melonhead_detect_hit()
{
    self endon( "melonhead_removed" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isdefined( self._id_00FD ) )
            continue;

        if ( ( self._id_00FD == "head" || self._id_00FD == "helmet" ) && var_4 != "MOD_IMPACT" )
        {
            melonhead_remove_melon( 1 );
            break;
        }
    }
}

handgun_mode_init()
{
    level.cheat_handgun = 0;
    level.cheat_handgun_weaponname = "h1_cheathandgun";
    level.cheat_handgun_currentweapon = undefined;
    precacheitem( level.cheat_handgun_weaponname );
    level waittill( "load_finished" );
}

handgun_mode_update( var_0 )
{
    if ( level._id_038E == "ac130" )
        return;

    level.cheat_handgun = common_scripts\utility::_id_9294( var_0, 1, 0 );
    level notify( "handgun_mode_updated" );

    if ( level.cheat_handgun )
        givehandgun();
    else
        takehandgun();
}

handgun_monitor()
{
    self endon( "handgun_removed" );
    self endon( "death" );

    for (;;)
    {
        if ( level._id_0318 _meth_82C9() == 1 && level._id_0318 _meth_830E() == level.cheat_handgun_weaponname )
            level._id_0318 _id_A5A4::_id_6C65( 0, "cheat_handgun" );
        else if ( level._id_0318 _meth_82C9() == 0 && level._id_0318 _meth_830E() != level.cheat_handgun_weaponname )
            level._id_0318 _id_A5A4::_id_6C65( 1, "cheat_handgun" );

        wait 0.05;
    }
}

handgun_monitor_reload()
{
    self endon( "handgun_removed" );
    self endon( "death" );

    for (;;)
    {
        if ( level._id_0318 _meth_8333() )
        {
            level._id_0318 _meth_832F( level.cheat_handgun_weaponname );
            level._id_0318 _meth_82F3( level.cheat_handgun_weaponname, _func_1B1( level.cheat_handgun_weaponname ) );
        }

        wait 0.05;
    }
}

givehandgun()
{
    level.cheat_handgun_currentweapon = level._id_0318 _meth_830E();
    level._id_0318 _meth_830B( level.cheat_handgun_weaponname );
    level._id_0318 _meth_832F( level.cheat_handgun_weaponname );
    level._id_0318 _meth_8313( level.cheat_handgun_weaponname );
    thread handgun_monitor();
    thread handgun_monitor_reload();
}

takehandgun()
{
    if ( level._id_0318 _meth_82C9() == 0 )
        level._id_0318 _id_A5A4::_id_6C65( 1, "cheat_handgun" );

    var_0 = level._id_0318 _meth_830E();
    var_1 = 0;

    if ( var_0 == level.cheat_handgun_weaponname && level.cheat_handgun_currentweapon != "none" )
    {
        var_2 = level._id_0318 _meth_8308();

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == level.cheat_handgun_currentweapon )
            {
                level._id_0318 _meth_8313( var_4 );
                var_1 = 1;
                break;
            }
        }

        if ( !var_1 && var_2.size > 0 )
            level._id_0318 _meth_8313( var_2[0] );
    }

    level._id_0318 _meth_830C( level.cheat_handgun_weaponname );
    self notify( "handgun_removed" );
}

lemonade_mode_init()
{
    level.cheat_lemonade = 0;
    level.cheat_lemonade_weaponname = "h1_cheatlemonade";
    level.cheat_lemonade_currentlethal = undefined;
    precacheitem( level.cheat_lemonade_weaponname );
    level waittill( "load_finished" );
}

lemonade_mode_update( var_0 )
{
    level.cheat_lemonade = common_scripts\utility::_id_9294( var_0, 1, 0 );

    if ( level.cheat_lemonade )
        givelemonade();
    else
        takelemonade();
}

givelemonade()
{
    level.cheat_lemonade_currentlethal = level._id_0318 _meth_8342();

    if ( isdefined( level.cheat_lemonade_currentlethal ) && level.cheat_lemonade_currentlethal != "none" )
    {
        var_0 = level._id_0318 _meth_82F5( level.cheat_lemonade_currentlethal );
        level._id_0318 _meth_830C( level.cheat_lemonade_currentlethal );
        level._id_0318 _meth_8341( level.cheat_lemonade_weaponname );
        level._id_0318 _meth_830B( level.cheat_lemonade_weaponname );
        level._id_0318 _meth_82F3( level.cheat_lemonade_weaponname, var_0 );
    }
}

takelemonade()
{
    var_0 = level._id_0318 _meth_82F5( level.cheat_lemonade_weaponname );
    level._id_0318 _meth_830C( level.cheat_lemonade_weaponname );

    if ( isdefined( level.cheat_lemonade_currentlethal ) )
    {
        level._id_0318 _meth_8341( level.cheat_lemonade_currentlethal );
        level._id_0318 _meth_830B( level.cheat_lemonade_currentlethal );
        level._id_0318 _meth_82F3( level.cheat_lemonade_currentlethal, var_0 );
    }
}

tracksuit_mode_init()
{
    level.tracksuit_mode_enabled = 0;

    if ( level._id_038E == "ac130" )
    {
        level.tracksuit_mode_model = "body_zakhaev_viktor_collar_ac130";
        level.tracksuit_mode_head = "head_zakhaev_viktor_ac130";
    }
    else
    {
        level.tracksuit_mode_model = "body_zakhaev_viktor_collar";
        level.tracksuit_mode_head = "head_zakhaev_viktor";
    }

    level.tracksuit_mode_weapon = "rpg";
    precachemodel( level.tracksuit_mode_model );
    precachemodel( level.tracksuit_mode_head );
    precacheitem( level.tracksuit_mode_weapon );
    precacheitem( "rpg_player" );
    _id_A5A4::_id_0761( "axis", ::tracksuit_monitor );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::tracksuit_monitor );
}

tracksuit_mode_update( var_0 )
{
    level.tracksuit_mode_enabled = common_scripts\utility::_id_9294( var_0, 1, 0 );
    level notify( "tracksuit_mode_updated" );
}

tracksuit_monitor()
{
    self endon( "death" );
    waittillframeend;

    if ( isdefined( self.tracksuit_ignore ) && self.tracksuit_ignore )
        return;

    if ( isdefined( self._id_0C8E ) && self._id_0C8E == "dog.atr" )
        return;

    for (;;)
    {
        if ( level.tracksuit_mode_enabled )
            add_tracksuit();
        else
            remove_tracksuit();

        level waittill( "tracksuit_mode_updated" );
    }
}

add_tracksuit()
{
    if ( _func_29C( self ) )
        return;

    self.tracksuitmode = 1;

    if ( isdefined( self._id_0513 ) && !isdefined( self.ignoreweaponintracksuitmode ) && self.classname != "script_model" )
    {
        if ( isdefined( self.a ) && isdefined( self.a._id_0979 ) )
            animscripts\combat_utility::_id_315E();

        self.tracksuitmode_previousprimary = animscripts\utility::_id_3EE5();
        var_0 = tracksuit_should_equipweapon();
        _id_A5A4::_id_39D0( level.tracksuit_mode_weapon, "primary" );

        if ( !var_0 )
            _id_A5A4::_id_4462();

        self.tracksuitmode_previousneverlean = self.a._id_6096;
        self.a._id_6096 = 1;
        self.tracksuitmode_previousrocketvisible = self.a._id_7597;
        self.a._id_7597 = 1;
        thread animscripts\shared::_id_766B();
        self._id_0340 = level.tracksuit_mode_weapon;
        self._id_0513 = level.tracksuit_mode_weapon;
        self._id_560F = level.tracksuit_mode_weapon;
        self.tracksuitmode_previoussecondary = self._id_03B3;
        self._id_03B3 = "none";
    }

    if ( self._id_029C == level.tracksuit_mode_model || self._id_029C == "body_zakhaev_viktor" )
        return;

    if ( isdefined( self._id_475D ) )
    {
        self.tracksuitmode_previoushatmodel = self._id_475D;
        self _meth_802A( self._id_475D );
        self._id_475D = undefined;
    }

    if ( isdefined( self._id_477D ) )
    {
        self.tracksuitmode_previousheadmodel = self._id_477D;
        self _meth_802A( self._id_477D );
    }

    self.tracksuitmode_previousmodel = self._id_029C;
    self _meth_80B3( level.tracksuit_mode_model );
    self _meth_801D( level.tracksuit_mode_head );
    self._id_477D = level.tracksuit_mode_head;
}

remove_tracksuit()
{
    if ( _func_29C( self ) )
        return;

    if ( !isdefined( self.tracksuitmode ) )
        return;

    if ( isdefined( self.tracksuitmode_previousmodel ) )
    {
        self _meth_802A( self._id_477D );
        self._id_477D = undefined;
        self _meth_80B3( self.tracksuitmode_previousmodel );
        self.tracksuitmode_previousmodel = undefined;
    }

    if ( isdefined( self.tracksuitmode_previousheadmodel ) )
    {
        self _meth_801D( self.tracksuitmode_previousheadmodel );
        self._id_477D = self.tracksuitmode_previousheadmodel;
        self.tracksuitmode_previousheadmodel = undefined;
    }

    if ( isdefined( self.tracksuitmode_previoushatmodel ) )
    {
        self _meth_801D( self.tracksuitmode_previoushatmodel );
        self._id_475D = self.tracksuitmode_previoushatmodel;
        self.tracksuitmode_previoushatmodel = undefined;
    }

    if ( isdefined( self.tracksuitmode_previousprimary ) && !isdefined( self.ignoreweaponintracksuitmode ) )
    {
        if ( isdefined( self.a ) && isdefined( self.a._id_0979 ) )
            animscripts\combat_utility::_id_315E();

        if ( tracksuit_should_equipweapon() )
            _id_A5A4::_id_39D0( self.tracksuitmode_previousprimary, "primary" );

        self._id_03B3 = self.tracksuitmode_previoussecondary;
        self.a._id_6096 = self.tracksuitmode_previousneverlean;
        self.a._id_7597 = self.tracksuitmode_previousrocketvisible;
    }

    self.tracksuitmode = 0;
    self notify( "tracksuit_removed" );
}

tracksuit_should_equipweapon()
{
    foreach ( var_1 in self._id_051D )
    {
        if ( var_1._id_0329 != "none" )
            return 1;
    }

    return 0;
}

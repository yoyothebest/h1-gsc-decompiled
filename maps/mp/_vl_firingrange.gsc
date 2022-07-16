// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4CEF()
{
    var_0 = spawnstruct();
    var_0.lanespawns = getlanespawnarray();
    var_0.firingrange_start = getent( "firingrange_start", "targetname" );
    var_0.round_triggers = getentarray( "firing_range_round_trigger", "targetname" );
    var_0.aim_up_targets = gettargetarray( "aim_up_target" );
    var_0.aim_left_targets = gettargetarray( "aim_left_target" );
    var_0.aim_right_targets = gettargetarray( "aim_right_target" );
    var_0.aim_targets = gettargetarray( "aim_target", ( 0, 0, -90 ) );
    var_0.aim_move_targets = gettargetarray( "aim_move_target", undefined, 0, 1 );
    var_0.plywood_blockers = gettargetarray( "plywood" );
    var_0.target_clips = gettargetarray( "target_clip", undefined, 1 );
    common_scripts\utility::_id_0D13( var_0.round_triggers, ::_id_97EB );
    var_0.lanelogic = [];
    var_0.lanelogic[0] = ::lane1logic;
    var_0.lanelogic[1] = ::lane2logic;
    var_0.lanelogic[2] = ::lane3logic;
    var_0.lanelogic[3] = ::lane4logic;
    var_0.lanelogic[4] = ::lane5logic;
    var_0.lanelogic[5] = ::lane6logic;
    var_0.laneclass = [];
    var_0.laneclass[0] = "spread";
    var_0.laneclass[1] = "smg";
    var_0.laneclass[2] = "rifle";
    var_0.laneclass[3] = "mg";
    var_0.laneclass[4] = "sniper";
    var_0.laneclass[5] = "none";
    var_0.lanelights = [];
    var_0.lanelightsgreen = [];
    var_0.lanelamps = [];
    var_0.lanelightshellpositions = [];
    var_0.lanelightexploders = [];
    var_1 = 100;

    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        var_0.lanelights[var_2] = getent( "light_0" + ( var_2 + 1 ), "targetname" );
        var_0.lanelights[var_2] _meth_81E2( 0 );
        var_0.lanelightsgreen[var_2] = getentarray( "green_light_0" + ( var_2 + 1 ), "targetname" );

        foreach ( var_4 in var_0.lanelightsgreen[var_2] )
            var_4 _meth_81E2( 0 );

        var_0.lanelamps[var_2] = getent( "lane_lamp_" + ( var_2 + 1 ), "targetname" );
        var_0.lanelamps[var_2] _meth_80B3( "h1_fng_industrial_lamp_off_sml" );
        var_0.lanelightshellpositions[var_2] = common_scripts\utility::_id_40FB( "lamp_green_light_" + ( var_2 + 1 ), "targetname" );
        var_0.lanelightexploders[var_2] = var_1 + var_2;
    }

    var_0.lanelightshellfront = spawn( "script_model", var_0.lanelightshellpositions[0]._id_02E2 );
    var_0.lanelightshellfront _meth_80B3( "h1_fng_light_green_02_glow_front" );
    var_0.lanelightshellrear = spawn( "script_model", var_0.lanelightshellpositions[1]._id_02E2 );
    var_0.lanelightshellrear _meth_80B3( "h1_fng_light_green_02_glow_rear" );
    level._id_3806 = var_0;
}

getlanespawnarray()
{
    var_0 = common_scripts\utility::_id_40FD( "firingrange_start_lane", "targetname" );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = _func_0BC( var_3._id_0398 );
        var_1[var_4] = var_3;
    }

    return var_1;
}

gettargetarray( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( var_0, "targetname" );
    var_5 = [];

    foreach ( var_7 in var_4 )
    {
        var_8 = _func_0BC( var_7._id_0398 );

        if ( maps\mp\_utility::_id_5092( var_2 ) )
        {
            var_9 = var_7;
            var_7 = getent( var_9._id_04A4, "targetname" );
            var_7._id_5F68 = var_9;
            var_9._id_8D38 = var_9._id_02E2;
            var_10 = common_scripts\utility::_id_40FB( var_9._id_04A4, "targetname" );
            var_9._id_31BC = var_10._id_02E2;
        }
        else if ( maps\mp\_utility::_id_5092( var_3 ) )
        {
            var_7._id_8D38 = var_7._id_02E2;
            var_10 = common_scripts\utility::_id_40FB( var_7._id_04A4, "targetname" );
            var_7._id_31BC = var_10._id_02E2;
            var_7._id_2B6C = _func_0EE( var_7._id_8D38, var_7._id_31BC );
        }

        var_7._id_0308["team"] = "axis";
        var_7._id_04A7 = "axis";

        if ( isdefined( var_1 ) )
            var_7.angles = var_1;

        var_5[var_8] = var_7;
    }

    return var_5;
}

_id_2630()
{
    level notify( "shutdown_targets" );
}

_id_32F0( var_0 )
{
    level._id_4C03 = 1;
    maps\mp\_vl_base::vlprintln( "FIRINGRANGE: Entering firing range with class lobby" + ( var_0._id_2522 + 1 ) );
    thread _id_9FE2( var_0 );
}

_id_9FE2( var_0 )
{
    var_0 endon( "enter_lobby" );

    while ( isdefined( var_0._id_57D6 ) )
        waittillframeend;

    var_0 _meth_82F8( "ui_vlobby_round_state", 0 );
    var_0 _meth_82F8( "ui_vlobby_round_timer", 0 );
    var_0 _meth_82F8( "ui_vlobby_round_damage", 0 );
    var_0 _meth_82F8( "ui_vlobby_round_hits", 0 );
    var_0 _meth_82F8( "ui_vlobby_round_fired", 0 );
    var_0 _meth_82F8( "ui_vlobby_round_accuracy", 0 );
    var_0.firingrangeready = 1;
    var_0 _meth_8051();
    var_0 _meth_81E6();
    var_1 = var_0 playergetspawnposbylane();
    var_2 = _func_091( var_1._id_02E2, 20, 512, 120 );
    var_0 _meth_8094();
    var_0 _meth_8335( var_2 );
    var_0 _meth_8337( var_1.angles );
    var_0 maps\mp\_vl_base::playersetfovscale( 1.0 );
    var_0 thread playermonitorweaponforlane();
    var_0 _meth_84A6();
    level._id_3806._id_51A6 = 0;
    var_0 thread maps\mp\_vl_base::_id_9E55( 0, level.caccontroller, "lobby" + var_0._id_2522, 1 );
    maps\mp\_utility::_id_9B69( "playing" );
    var_0 thread maps\mp\_vl_base::_id_30E5();
    thread monitorweaponammo( var_0 );
    thread watermelonthink();
}

monitorweaponammo( var_0 )
{
    var_0 endon( "enter_vlobby" );

    for (;;)
    {
        var_1 = var_0 _meth_8308();

        foreach ( var_3 in var_1 )
        {
            var_4 = maps\mp\_utility::_id_3F11( var_3 );
            var_5 = var_4 + "_mp";

            if ( maps\mp\gametypes\_class::_id_51EA( var_5 ) || maps\mp\gametypes\_class::_id_51F2( var_5 ) || maps\mp\gametypes\_class::isperkequipment( var_5 ) )
            {
                var_0 thread _id_5DAB( var_3 );
                continue;
            }

            if ( maps\mp\gametypes\_class::_id_51F3( var_4 ) || maps\mp\gametypes\_class::_id_51F5( var_4 ) || maps\mp\gametypes\_class::isperkprimary( var_5 ) )
            {
                var_0 thread _id_5E1D( var_3 );
                continue;
            }

            if ( !maps\mp\gametypes\_class::isvalidmeleeweapon( var_4 ) )
            {

            }
        }

        var_0 waittill( "applyLoadout" );
    }
}

playergetspawnposbylane()
{
    var_0 = 5;
    var_1 = _func_1B8( self._id_0340 );

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( level._id_3806.laneclass[var_2] == var_1 )
            return level._id_3806.lanespawns[var_2];
    }
}

playergetprimarynotpistol()
{
    var_0 = self _meth_8309();

    foreach ( var_2 in var_0 )
    {
        var_3 = _func_1B8( var_2 );

        if ( var_3 != "pistol" )
            return var_2;
    }
}

playermonitorweaponforlane()
{
    self endon( "enter_lobby" );
    var_0 = 5;
    var_1 = "none";

    for (;;)
    {
        var_2 = self _meth_830F();
        var_3 = _func_1B8( var_2 );

        if ( var_3 == "pistol" )
        {
            var_2 = playergetprimarynotpistol();
            var_3 = _func_1B8( var_2 );
        }

        if ( var_3 != "grenade" && var_2 != var_1 )
        {
            for ( var_4 = 0; var_4 < var_0; var_4++ )
            {
                if ( level._id_3806.laneclass[var_4] == var_3 )
                {
                    if ( isdefined( level._id_3806._id_7658 ) )
                        thread _id_8550( level._id_3806._id_7658, self );

                    turnonlightsforlane( var_4 );
                    break;
                }
            }

            var_1 = var_2;
        }

        self waittill( "weapon_change" );
    }
}

turnonlightsforlane( var_0 )
{
    var_1 = 6;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = level._id_3806.lanelights[var_2];
        var_4 = level._id_3806.lanelightsgreen[var_2];
        var_5 = level._id_3806.lanelamps[var_2];
        var_6 = level._id_3806.lanelightexploders[var_2];

        if ( var_2 == var_0 )
        {
            if ( var_3 _meth_81E1() == 0 )
            {
                var_5 _meth_80B3( "h1_fng_industrial_lamp_off_sml_on" );
                var_3 _meth_81E2( 10000 );

                foreach ( var_8 in var_4 )
                    var_8 _meth_81E2( 200 );

                _func_227( var_6 );
                var_10 = level._id_3806.lanelightshellpositions[var_2];
                var_11 = level._id_3806.lanelightshellpositions[var_2 + 1];
                level._id_3806.lanelightshellfront._id_02E2 = var_10._id_02E2;
                level._id_3806.lanelightshellfront _meth_8094();
                level._id_3806.lanelightshellrear._id_02E2 = var_11._id_02E2;
                level._id_3806.lanelightshellrear _meth_8094();
            }

            continue;
        }

        if ( var_3 _meth_81E1() != 0 )
        {
            var_5 _meth_80B3( "h1_fng_industrial_lamp_off_sml" );
            var_3 _meth_81E2( 0 );

            foreach ( var_8 in var_4 )
                var_8 _meth_81E2( 0 );

            _func_29A( var_6 );
        }
    }
}

initlane()
{
    var_0 = spawnstruct();
    var_0.targetsup = 0;
    return var_0;
}

lane1logic( var_0 )
{
    var_1 = initlane();
    var_1 popupaimtarget( 1 );
    var_1 popupaimtarget( 2 );
    var_1 popupaimtarget( 3 );
    var_1 popupaimtarget( 4 );
    var_1 thread popupaimuptarget( 1 );
    var_1 thread popupaimuptarget( 2 );
    var_1 thread popupaimlefttarget( 1 );
    var_1 waittilltargetsdown();
    var_1 popuptargetclip( 1 );
    var_1 thread popupplywood( 1 );
    var_1 popupaimtarget( 4 );
    var_1 popdownplywood( 1 );
    var_1 popuptargetclip( 2 );
    var_1 thread popupaimtarget( 1 );
    var_1 thread popupaimtarget( 2 );
    var_1 thread popupaimtarget( 3 );
    var_1 waittilltargetsdown();
    var_1 popupaimtarget( 3 );
    var_1 popupaimtarget( 2 );
    var_1 popupaimtarget( 1 );
    var_1 popupaimtarget( 4 );
    var_1 stoplane();
}

lane2logic( var_0 )
{
    var_1 = initlane();
    var_1 popupaimtarget( 4 );
    var_1 popupaimtarget( 5 );
    var_1 popupaimmovetarget( 3 );
    var_1 popuptargetclip( 2 );
    var_1 thread popupaimlefttarget( 2 );
    var_1 thread popupaimuptarget( 2 );
    var_1 thread popuptargetclip( 3 );
    var_1 waittilltargetsdown();
    var_1 thread popupplywood( 1 );
    var_1 thread popupplywood( 2 );
    var_1 thread popupaimtarget( 4 );
    var_1 thread popupaimtarget( 5 );
    var_1 waittilltargetsdown();
    var_1 popdownplywood( 1 );
    var_1 popdownplywood( 2 );
    var_1 thread popupaimtarget( 8 );
    var_1 thread popupaimtarget( 2 );
    var_1 thread popupaimtarget( 7 );
    var_1 waittilltargetsdown();
    var_1 thread popupaimuptarget( 1 );
    var_1 thread popupaimuptarget( 2 );
    var_1 thread popupaimuptarget( 3 );
    var_1 waittilltargetsdown();
    var_1 popupaimtarget( 2 );
    var_1 popupaimuptarget( 2 );
    var_1 popupaimtarget( 5 );
    var_1 popupaimlefttarget( 2 );
    var_1 popupaimtarget( 5 );
    var_1 popupaimtarget( 8 );
    var_1 stoplane();
}

lane3logic( var_0 )
{
    var_1 = initlane();
    var_1 popupaimtarget( 5 );
    var_1 popupaimtarget( 10 );
    var_1 popuptargetclip( 3 );
    var_1 popupaimtarget( 8 );
    var_1 thread popupaimtarget( 4 );
    var_1 thread popupaimtarget( 12 );
    var_1 thread popupaimtarget( 13 );
    var_1 thread popupaimtarget( 9 );
    var_1 waittilltargetsdown();
    var_1 popupaimmovetarget( 1 );
    var_1 popupaimlefttarget( 3 );
    var_1 popupaimrighttarget( 1 );
    var_1 thread popupplywood( 2 );
    var_1 popupaimtarget( 5 );
    var_1 popdownplywood( 2 );
    var_1 popupaimtarget( 15 );
    var_1 thread popuptargetclip( 2 );
    var_1 thread popuptargetclip( 3 );
    var_1 thread popuptargetclip( 4 );
    var_1 waittilltargetsdown();
    var_1 thread popupaimlefttarget( 4 );
    var_1 thread popupaimlefttarget( 3 );
    var_1 thread popupaimrighttarget( 1 );
    var_1 waittilltargetsdown();
    var_1 popupaimtarget( 4 );
    var_1 popupaimmovetarget( 2 );
    var_1 popupaimtarget( 10 );
    var_1 popupaimuptarget( 3 );
    var_1 popupaimtarget( 15 );
    var_1 stoplane();
}

lane4logic( var_0 )
{
    var_1 = initlane();
    var_1 thread popupaimtarget( 8 );
    var_1 thread popupaimtarget( 12 );
    var_1 thread popupaimtarget( 5 );
    var_1 waittilltargetsdown();
    var_1 thread popupaimuptarget( 3 );
    var_1 thread popupaimuptarget( 6 );
    var_1 thread popupaimlefttarget( 4 );
    var_1 thread popuptargetclip( 4 );
    var_1 waittilltargetsdown();
    var_1 thread popupplywood( 2 );
    var_1 thread popupplywood( 3 );
    var_1 thread popupaimtarget( 5 );
    var_1 thread popupaimtarget( 6 );
    var_1 thread popupaimtarget( 9 );
    var_1 thread popupaimtarget( 10 );
    var_1 waittilltargetsdown();
    var_1 popdownplywood( 2 );
    var_1 popdownplywood( 3 );
    var_1 popuptargetclip( 5 );
    var_1 popuptargetclip( 3 );
    var_1 popupaimtarget( 11 );
    var_1 popupaimlefttarget( 4 );
    var_1 popupaimrighttarget( 1 );
    var_1 popupaimtarget( 13 );
    var_1 thread popupaimtarget( 8 );
    var_1 thread popupaimtarget( 12 );
    var_1 thread popupaimtarget( 5 );
    var_1 thread popupaimtarget( 9 );
    var_1 thread popupaimtarget( 10 );
    var_1 thread popupaimtarget( 11 );
    var_1 thread popupaimtarget( 6 );
    var_1 waittilltargetsdown();
    var_1 stoplane();
}

lane5logic( var_0 )
{
    var_1 = initlane();
    var_1 popupaimtarget( 6 );
    var_1 popupaimtarget( 16 );
    var_1 popupaimtarget( 17 );
    var_1 popupaimtarget( 11 );
    var_1 popupaimtarget( 14 );
    var_1 popupaimtarget( 18 );
    var_1 popupaimlefttarget( 4 );
    var_1 popupaimtarget( 9 );
    var_1 popupaimmovetarget( 5 );
    var_1 thread popuptargetclip( 6 );
    var_1 thread popupaimuptarget( 7 );
    var_1 thread popupaimuptarget( 9 );
    var_1 thread popupaimuptarget( 8 );
    var_1 thread popupaimuptarget( 10 );
    var_1 waittilltargetsdown();
    var_1 popupaimmovetarget( 1 );
    var_1 popupaimmovetarget( 4 );
    var_1 popupaimtarget( 13 );
    var_1 popupaimtarget( 15 );
    var_1 popupaimtarget( 18 );
    var_1 stoplane();
}

lane6logic( var_0 )
{
    var_1 = initlane();
    var_1 doalltargets( var_1 );
    var_1 stoplane();
}

doalltargets( var_0 )
{
    var_0 thread popupplywood( 1 );
    var_0 thread popupplywood( 2 );
    var_0 thread popupplywood( 3 );
    var_0 thread popupaimuptarget( 1 );
    var_0 thread popupaimuptarget( 2 );
    var_0 thread popupaimuptarget( 3 );
    var_0 thread popupaimuptarget( 4 );
    var_0 thread popupaimuptarget( 5 );
    var_0 thread popupaimuptarget( 6 );
    var_0 thread popupaimuptarget( 7 );
    var_0 thread popupaimuptarget( 8 );
    var_0 thread popupaimuptarget( 9 );
    var_0 thread popupaimuptarget( 10 );
    var_0 thread popupaimtarget( 1 );
    var_0 thread popupaimtarget( 2 );
    var_0 thread popupaimtarget( 3 );
    var_0 thread popupaimtarget( 4 );
    var_0 thread popupaimtarget( 5 );
    var_0 thread popupaimtarget( 6 );
    var_0 thread popupaimtarget( 7 );
    var_0 thread popupaimtarget( 8 );
    var_0 thread popupaimtarget( 9 );
    var_0 thread popupaimtarget( 10 );
    var_0 thread popupaimtarget( 11 );
    var_0 thread popupaimtarget( 12 );
    var_0 thread popupaimtarget( 13 );
    var_0 thread popupaimtarget( 14 );
    var_0 thread popupaimtarget( 15 );
    var_0 thread popupaimtarget( 16 );
    var_0 thread popupaimtarget( 17 );
    var_0 thread popupaimtarget( 18 );
    var_0 thread popupaimlefttarget( 1 );
    var_0 thread popupaimlefttarget( 2 );
    var_0 thread popupaimlefttarget( 3 );
    var_0 thread popupaimlefttarget( 4 );
    var_0 thread popupaimrighttarget( 1 );
    var_0 thread popuptargetclip( 1 );
    var_0 thread popuptargetclip( 2 );
    var_0 thread popuptargetclip( 3 );
    var_0 thread popuptargetclip( 4 );
    var_0 thread popuptargetclip( 5 );
    var_0 thread popuptargetclip( 6 );
    var_0 thread popupaimmovetarget( 1 );
    var_0 thread popupaimmovetarget( 2 );
    var_0 thread popupaimmovetarget( 3 );
    var_0 thread popupaimmovetarget( 4 );
    var_0 thread popupaimmovetarget( 5 );
    var_0 waittilltargetsdown();
    var_0 popdownplywood( 1 );
    var_0 popdownplywood( 2 );
    var_0 popdownplywood( 3 );
}

waittilltargetsdown()
{
    while ( self.targetsup > 0 )
        waittillframeend;
}

popupaimtarget( var_0, var_1 )
{
    var_2 = level._id_3806.aim_targets[var_0];
    var_2._id_04D9 = "human";
    self.targetsup++;
    var_2 thread targetpopup( ( 0, 0, 0 ), ( 0, 0, -90 ), 0.4, 0.2, var_1 );
    var_2 waittill( "down" );
    self.targetsup--;
}

popupaimuptarget( var_0, var_1 )
{
    var_2 = level._id_3806.aim_up_targets[var_0];
    var_2._id_04D9 = "target";
    self.targetsup++;
    var_2 thread targetpopup( ( 0, 180, 179 ), ( 0, 180, 0 ), 0.4, 0.2, var_1 );
    var_2 waittill( "down" );
    self.targetsup--;
}

popupaimlefttarget( var_0, var_1 )
{
    var_2 = level._id_3806.aim_left_targets[var_0];
    var_2._id_04D9 = "target";
    self.targetsup++;
    var_2 thread targetpopup( ( 90, 0, -1 ), ( 90, 0, -180 ), 0.4, 0.2, var_1 );
    var_2 waittill( "down" );
    self.targetsup--;
}

popupaimrighttarget( var_0, var_1 )
{
    var_2 = level._id_3806.aim_right_targets[var_0];
    var_2._id_04D9 = "target";
    self.targetsup++;
    var_2 thread targetpopup( ( 270, 180, 179 ), ( 270, 180, 0 ), 0.4, 0.2, var_1 );
    var_2 waittill( "down" );
    self.targetsup--;
}

popuptargetclip( var_0, var_1 )
{
    var_2 = level._id_3806.target_clips[var_0];
    var_2._id_04D9 = "target";
    self.targetsup++;
    var_2 thread targetpopup( ( 0, 180, 179 ), ( 0, 180, 90 ), 0.2, 0.1, var_1, 1 );
    var_2 waittill( "down" );
    self.targetsup--;
}

popupaimmovetarget( var_0, var_1 )
{
    var_2 = level._id_3806.aim_move_targets[var_0];
    var_2._id_04D9 = "human";
    self.targetsup++;
    var_2 thread targetpopup( ( 0, 0, 0 ), ( 0, 90, 0 ), 0.4, 0.2, var_1, 0, 1 );
    var_2 waittill( "down" );
    self.targetsup--;
}

targetpopup( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self.active = 1;
    var_7 = 0;

    if ( var_7 && self._id_04D9 == "human" )
    {
        self._id_01E6 = 100;
        self._id_0271 = 100;
    }
    else
    {
        self._id_01E6 = 1;
        self._id_0271 = 1;
    }

    self._id_0306 = [];

    if ( maps\mp\_utility::_id_5092( var_4 ) )
        self._id_0306["specialty_armorvest"] = 1;

    self _meth_82BC( 1 );
    self _meth_8491( 1 );
    self._id_258E = ::targetdamagecallback;
    self _meth_8029();
    self _meth_8051();
    self _meth_82B1( var_0, 0.4 );
    self _meth_809C( "killhouse_target_up" );

    if ( maps\mp\_utility::_id_5092( var_5 ) )
        thread targetattachedmoveonce();
    else if ( maps\mp\_utility::_id_5092( var_6 ) )
        thread targetmoveloop();

    thread targethandlestop();

    if ( isdefined( self._id_0973 ) )
    {
        self._id_0973 _meth_81B9();
        self._id_0973._id_01E6 = 9999;
        self._id_0973._id_0271 = 9999;
        self._id_0973 _meth_8055();
        self._id_0973 _meth_82BA();
    }

    common_scripts\utility::_id_A087( "death", "reset" );
    self.active = undefined;
    self._id_0306 = undefined;
    self _meth_8000();
    targetdamageoff();
    self _meth_8051();
    self _meth_82B1( var_1, 0.2 );
    self _meth_809C( "killhouse_target_up" );

    if ( maps\mp\_utility::_id_5092( var_5 ) )
        thread targetattachedmoveback();
    else if ( maps\mp\_utility::_id_5092( var_6 ) )
        thread targetmoveback();

    if ( isdefined( self._id_0973 ) )
    {
        self._id_0973 _meth_81D7();
        self._id_0973 _meth_8056();
        self._id_0973 _meth_82BB();
    }

    self notify( "down" );
}

targetdamageoff()
{
    self _meth_82BC( 0 );
    self _meth_8491( 0 );
    self._id_258E = undefined;
}

targetattachedmoveonce()
{
    self endon( "death" );
    self endon( "reset" );
    self._id_5F68 _meth_82AA( self._id_5F68._id_02E2, 0.1 );
    self waittill( "rotatedone" );

    if ( !maps\mp\_utility::_id_5092( self.active ) )
        return;

    self _meth_8442( self._id_5F68 );
    var_0 = _func_0EE( self._id_5F68._id_31BC, self._id_5F68._id_02E2 );
    var_1 = var_0 / 100;
    var_2 = 0.5;
    var_3 = 0.5;

    if ( var_1 < 1.0 )
    {
        var_2 = 0.0;
        var_3 = 0.0;
    }

    self._id_5F68 _meth_8077( "target_move_lp" );
    self._id_5F68 _meth_82AA( self._id_5F68._id_31BC, var_1, var_2, var_3 );
    self._id_5F68 waittill( "movedone" );
    self._id_5F68 _meth_80AD();
    self._id_5F68 _meth_809C( "target_stop" );
}

targetattachedmoveback()
{
    self endon( "death" );
    self endon( "reset" );
    self._id_5F68 _meth_82AA( self._id_5F68._id_02E2, 0.1 );
    self waittill( "rotatedone" );

    if ( maps\mp\_utility::_id_5092( self.active ) )
        return;

    self _meth_8442( self._id_5F68 );
    var_0 = _func_0EE( self._id_5F68._id_8D38, self._id_5F68._id_02E2 );
    var_1 = var_0 / 300;

    if ( var_1 <= 0 )
        var_1 = 0.1;

    var_2 = 0.5;
    var_3 = 0.5;

    if ( var_1 < 1.0 )
    {
        var_2 = 0.0;
        var_3 = 0.0;
    }

    self._id_5F68 _meth_8077( "target_move_lp" );
    self._id_5F68 _meth_82AA( self._id_5F68._id_8D38, var_1, var_2, var_3 );
    self._id_5F68 waittill( "movedone" );
    self._id_5F68 _meth_80AD();
    self._id_5F68 _meth_809C( "target_stop" );
}

targetmoveloop()
{
    self endon( "death" );
    self endon( "reset" );
    var_0 = self._id_2B6C / 50;
    var_1 = 0.3;
    var_2 = 0.3;

    if ( var_0 < 0.6 )
    {
        var_1 = 0.0;
        var_2 = 0.0;
    }

    self _meth_8077( "target_move_lp" );

    for (;;)
    {
        self _meth_82AA( self._id_31BC, var_0, var_1, var_2 );
        self waittill( "movedone" );
        self _meth_82AA( self._id_8D38, var_0, var_1, var_2 );
        self waittill( "movedone" );
    }
}

targetmoveback()
{
    var_0 = _func_0EE( self._id_02E2, self._id_8D38 );
    var_1 = var_0 / 300;

    if ( var_1 <= 0 )
        var_1 = 0.1;

    var_2 = 0.3;
    var_3 = 0.3;

    if ( var_1 < 0.6 )
    {
        var_2 = 0.0;
        var_3 = 0.0;
    }

    self _meth_82AA( self._id_8D38, var_1, var_2, var_3 );
    self waittill( "movedone" );
    self _meth_80AD();
}

targetdamagecallback( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( self._id_01E6 <= 0 )
        return;

    var_12 = _id_4028( var_5, var_11, var_1 );
    var_13 = _func_0BD( var_2 ) * var_12;
    var_13 = _func_0BC( var_13 );
    var_13 = maps\mp\perks\_perks::_id_198D( self, var_1, var_13, var_4, var_5, var_6, var_7, var_8, var_0 );
    var_14 = self._id_01E6 - var_13;
    var_14 = maps\mp\_utility::_id_7651( var_14, 0 );

    if ( isdefined( var_1 ) )
    {
        if ( var_14 <= 0 )
        {
            if ( isdefined( var_11 ) )
                var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( "mp_hit_kill" );

            targetdamageoff();
        }
        else if ( maps\mp\_utility::_id_05CB( "specialty_armorvest" ) )
            var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( "hitmorehealth" );
        else
            var_1 maps\mp\gametypes\_damagefeedback::_id_9B0C( "standard" );
    }

    if ( var_13 > 999 )
        level._id_3806._id_2598 = 999;
    else if ( var_13 < 0 )
        level._id_3806._id_2598 = 0;
    else
        level._id_3806._id_2598 = var_13;

    if ( !isdefined( self._id_55DA ) || self._id_55DA != gettime() )
    {
        var_15 = level._id_3806._id_844C + 1;

        if ( var_15 > 9999 )
            level._id_3806._id_844C = 0;
        else if ( var_15 < 0 )
            level._id_3806._id_844C = 0;
        else
            level._id_3806._id_844C = var_15;

        if ( isdefined( var_1 ) )
            var_1 _meth_82F8( "ui_vlobby_round_hits", level._id_3806._id_844C );
    }

    if ( isdefined( var_1 ) )
        var_1 _meth_82F8( "ui_vlobby_round_damage", level._id_3806._id_2598 );

    self._id_55DA = gettime();
    self _meth_8492( var_0, var_1, var_13, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

popupplywood( var_0 )
{
    var_1 = level._id_3806.plywood_blockers[var_0];
    var_1.active = 1;
    var_1 _meth_82B1( ( 0, 180, 0 ), 0.4 );
    var_1 _meth_809C( "killhouse_target_up_wood" );
    thread targethandlestop();
    common_scripts\utility::_id_A087( "plywood_" + var_0 + "_down", "reset" );
    var_1.active = undefined;
    var_1 _meth_82B1( ( 0, 180, 90 ), 0.2 );
}

popdownplywood( var_0 )
{
    self notify( "plywood_" + var_0 + "_down" );
}

stoplane()
{
    self notify( "complete" );
}

targethandlestop()
{
    self endon( "death" );
    level waittill( "shutdown_targets" );
    self notify( "reset" );
}

_id_97EB()
{
    var_0 = self;
    var_0 thread common_scripts\_dynamic_world::_id_981C( ::_id_6AEA, ::_id_6B86 );
}

_id_6AEA( var_0 )
{
    level endon( "shutdown_targets" );

    while ( level._id_3806._id_51A6 )
        wait 0.1;

    var_1 = self;

    if ( !isdefined( var_0._id_7A18 ) )
        return;

    var_2 = _func_0BC( var_0._id_7A18 );
    level._id_3806._id_7658 = var_2;

    if ( level._id_3806.laneclass[var_2] != "any" )
    {
        for (;;)
        {
            var_3 = var_1 _meth_830F();
            var_4 = _func_1B8( var_3 );

            if ( var_4 == "pistol" )
            {
                var_3 = var_1 playergetprimarynotpistol();
                var_4 = _func_1B8( var_3 );
            }

            if ( level._id_3806.laneclass[var_2] == var_4 )
                break;

            waittillframeend;
        }
    }

    var_1 thread _id_8D3C( var_2 );
}

_id_6B86( var_0 )
{
    var_1 = self;

    if ( !isdefined( var_0._id_7A18 ) )
        return;

    var_2 = _func_0BC( var_0._id_7A18 );
    level._id_3806._id_7658 = var_2;
    thread _id_8550( var_2, var_1 );
}

_id_4028( var_0, var_1, var_2 )
{
    var_3 = "none";
    var_4 = 1;
    var_5 = _func_124( var_0, "_" );
    var_6 = var_5[0] + "_" + var_5[1];

    if ( var_0 != "specialty_null" && var_0 != "none" && var_0 != "iw5_combatknife_mp" )
    {
        if ( maps\mp\gametypes\_class::_id_51F3( var_6 ) || maps\mp\gametypes\_class::_id_51F5( var_6 ) )
        {
            if ( var_1 == "j_head" )
                var_3 = "head";
            else if ( var_1 == "tag_chest" )
                var_3 = "torso_upper";
            else if ( var_1 == "tag_arms" )
                var_3 = "right_arm_upper";
            else if ( var_1 == "tag_legs" )
                var_3 = "torso_lower";
            else
                var_3 = "none";

            var_4 = var_2 _meth_8501( var_6 + "_mp", var_3 );
            return var_4;
        }
        else
            return var_4;
    }
    else
        return var_4;
}

_id_5EC1( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "shutdown_targets" );

    for (;;)
    {
        var_0 common_scripts\utility::_id_A069( "weapon_fired", "grenade_fire" );
        var_1 = level._id_3806._id_844B + 1;

        if ( var_1 > 9999 )
        {
            level._id_3806._id_844B = 0;
            level._id_3806._id_844C = 0;
            level._id_3806._id_67C5 = 0;
            var_0 _meth_82F8( "ui_vlobby_round_hits", level._id_3806._id_844C );
            var_0 _meth_82F8( "ui_vlobby_round_fired", level._id_3806._id_844B );
            var_0 _meth_82F8( "ui_vlobby_round_accuracy", level._id_3806._id_67C5 );
            continue;
        }

        if ( var_1 < 0 )
        {
            level._id_3806._id_844B = 0;
            level._id_3806._id_844C = 0;
            level._id_3806._id_67C5 = 0;
            var_0 _meth_82F8( "ui_vlobby_round_hits", level._id_3806._id_844C );
            var_0 _meth_82F8( "ui_vlobby_round_fired", level._id_3806._id_844B );
            var_0 _meth_82F8( "ui_vlobby_round_accuracy", level._id_3806._id_67C5 );
            continue;
        }

        level._id_3806._id_844B = var_1;
        var_0 _meth_82F8( "ui_vlobby_round_fired", level._id_3806._id_844B );
    }
}

_id_5E6F( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "shutdown_targets" );

    for (;;)
    {
        if ( level._id_3806._id_844B > 0 )
        {
            var_1 = level._id_3806._id_844C / level._id_3806._id_844B * 100;
            var_1 = maps\mp\_utility::_id_7651( var_1, 0 );

            if ( var_1 != level._id_3806._id_67C5 )
            {
                if ( var_1 > 999 )
                    var_1 = 999;
                else if ( var_1 < 0 )
                    var_1 = 0;

                level._id_3806._id_67C5 = _func_0BC( var_1 );
                var_0 _meth_82F8( "ui_vlobby_round_accuracy", level._id_3806._id_67C5 );
            }
        }

        waittillframeend;
    }
}

_id_8D3C( var_0 )
{
    level endon( "shutdown_targets" );
    level notify( "start_round" );
    level._id_3806._id_2598 = 0;
    level._id_3806._id_04B7 = 0;
    level._id_3806._id_844C = 0;
    level._id_3806._id_844B = 0;
    level._id_3806._id_67C5 = 0;
    level._id_3806._id_764F = 1;
    self _meth_82F8( "ui_vlobby_round_damage", level._id_3806._id_2598 );
    self _meth_82F8( "ui_vlobby_round_hits", level._id_3806._id_844C );
    self _meth_82F8( "ui_vlobby_round_fired", level._id_3806._id_844B );
    self _meth_82F8( "ui_vlobby_round_accuracy", level._id_3806._id_67C5 );
    wait 0.5;
    self _meth_82F8( "ui_vlobby_round_state", 1 );
    thread _id_0705( var_0 );
}

_id_8550( var_0, var_1 )
{
    level notify( "shutdown_targets" );
    level._id_3806._id_51A6 = 1;
    var_1 _meth_82F8( "ui_vlobby_round_state", 0 );
    var_1 _meth_82F8( "ui_vlobby_round_timer", 0 );
    var_1 _meth_82F8( "ui_vlobby_round_damage", 0 );
    var_1 _meth_82F8( "ui_vlobby_round_hits", 0 );
    var_1 _meth_82F8( "ui_vlobby_round_fired", 0 );
    var_1 _meth_82F8( "ui_vlobby_round_accuracy", 0 );
    var_1 thread _id_43FA( 1 );
    level._id_3806._id_7658 = undefined;
    level._id_3806._id_5C85 = undefined;
    level._id_3806._id_5A4E = undefined;
    level._id_3806._id_5C86 = undefined;
    level._id_3806._id_6F24 = 0;
    level._id_3806._id_6F25 = 0;
    level._id_3806._id_2598 = 0;
    level._id_3806._id_844B = 0;
    level._id_3806._id_844C = 0;
    level._id_3806._id_67C5 = 0;
    level._id_3806._id_764F = 0;
    var_1 _meth_82F8( "ui_vlobby_round_damage", level._id_3806._id_2598 );
    var_1 _meth_82F8( "ui_vlobby_round_hits", level._id_3806._id_844C );
    var_1 _meth_82F8( "ui_vlobby_round_fired", level._id_3806._id_844B );
    var_1 _meth_82F8( "ui_vlobby_round_accuracy", level._id_3806._id_67C5 );
    level._id_3806._id_51A6 = 0;
}

_id_7834()
{
    level notify( "ScaleSoundsOnExit" );
    level endon( "ScaleSoundsOnExit" );

    if ( isdefined( level._id_4C03 ) )
    {
        for (;;)
        {
            wait 0.05;

            if ( level._id_4C03 == 1 || getdvarint( "virtualLobbyInFiringRange", 0 ) == 1 )
            {
                continue;
                continue;
            }

            level._id_3806._id_88AB = common_scripts\utility::_id_0CF9( level._id_3806._id_88AB );

            foreach ( var_1 in level._id_3806._id_88AB )
                var_1 _meth_8071( 0, 0.5 );
        }
    }
}

_id_0705( var_0 )
{
    level endon( "shutdown_targets" );
    var_1 = self;
    thread _id_5ED7( var_1 );
    thread _id_5EC1( var_1 );
    thread _id_5E6F( var_1 );
    var_1 _meth_809C( "killhouse_buzzer" );
    [[ level._id_3806.lanelogic[var_0] ]]( var_1 );
    var_1 _meth_809C( "killhouse_buzzer" );
    level notify( "round_done" );
    level._id_3806._id_764F = 0;
    var_1 _meth_82F8( "ui_vlobby_round_state", 2 );
}

_id_5ED7( var_0 )
{
    level endon( "shutdown_targets" );
    level endon( "round_done" );
    var_1 = maps\mp\_utility::_id_412C();

    for (;;)
    {
        var_2 = maps\mp\_utility::_id_412C();
        var_3 = var_2 - var_1;
        var_4 = maps\mp\_utility::_id_7651( var_3 / 1000, 1 );

        if ( var_4 > 9999.9 )
        {
            level._id_3806._id_04B7 = 0;
            var_0 _meth_82F8( "ui_vlobby_round_timer", level._id_3806._id_04B7 );
            var_0 _meth_82F8( "ui_vlobby_round_state", 0 );
            thread _id_8550( level._id_3806._id_7658, var_0 );
            return;
        }
        else if ( var_4 < 0 )
        {
            level._id_3806._id_04B7 = 0;
            var_0 _meth_82F8( "ui_vlobby_round_timer", level._id_3806._id_04B7 );
            var_0 _meth_82F8( "ui_vlobby_round_state", 0 );
            thread _id_8550( level._id_3806._id_7658, var_0 );
            return;
        }
        else
        {
            level._id_3806._id_04B7 = var_4;
            var_0 _meth_82F8( "ui_vlobby_round_timer", level._id_3806._id_04B7 );
        }

        waittillframeend;
    }
}

_id_5E1D( var_0 )
{
    self endon( "enter_lobby" );
    self endon( "applyLoadout" );

    while ( level._id_4C03 )
    {
        var_1 = self _meth_8331( var_0 );

        if ( var_1 <= 0.25 )
        {
            self _meth_832F( var_0 );
            continue;
        }

        wait 0.5;
    }
}

_id_43FA( var_0 )
{
    if ( isdefined( level._id_4407 ) && _func_0CE( level._id_4407 ) )
    {
        foreach ( var_2 in level._id_4407 )
        {
            if ( isdefined( var_2 ) && !_func_29C( var_2 ) )
            {
                if ( !isdefined( self ) || !isdefined( var_2._id_02E5 ) || _func_29C( var_2._id_02E5 ) )
                {
                    if ( !isdefined( var_2._id_A2DF ) )
                        continue;
                    else
                    {
                        var_2 notify( "death" );
                        var_2 thread _id_27D3();
                    }

                    continue;
                }

                if ( var_2._id_02E5 == self )
                {
                    if ( !isdefined( var_2._id_A2DF ) )
                    {
                        continue;
                        continue;
                    }

                    var_2 notify( "death" );
                    var_2 thread _id_27D3();
                }
            }
        }
    }
}

_id_27D3()
{
    wait 0.05;

    if ( isdefined( self ) && !_func_29C( self ) )
        self delete();
}

_id_5DAB( var_0 )
{
    self endon( "enter_lobby" );
    self endon( "applyLoadout" );

    while ( level._id_4C03 )
    {
        self waittill( "grenade_pullback" );
        common_scripts\utility::_id_A0A0( "grenade_fire", 6 );
        var_1 = self _meth_8183( var_0 );

        if ( var_1 == 0 )
        {
            self _meth_830B( var_0 );
            continue;
        }

        waittillframeend;
    }
}

_id_3807()
{
    var_0 = self;
    var_0 _id_43FA();
    var_1 = var_0 _meth_82CB();

    foreach ( var_3 in var_1 )
        var_0 maps\mp\gametypes\_class::_id_912F( var_3 );
}

watermelonthink()
{
    level notify( "watermelonThink" );
    level endon( "watermelonThink" );
    var_0 = getent( "scr_watermelon", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = getent( var_0._id_04A4, "targetname" );
    var_1 _meth_8055();
    var_1 _meth_82BA();
    var_2 = getent( var_1._id_04A4, "targetname" );
    var_2 _meth_81B9();

    if ( !isdefined( var_2._id_8D33 ) )
        var_2._id_8D33 = var_2._id_02E2;
    else
        var_2._id_02E2 = var_2._id_8D33;

    var_0 waittill( "trigger" );
    var_0 _meth_809C( "melee_knife_hit_watermelon" );
    playfx( level._id_058F["watermelon"], var_1._id_02E2 );
    var_1 _meth_8056();
    var_1 _meth_82BB();
    var_2 _meth_81D7();
    var_2._id_02E2 += ( 0, 0, -100 );
}

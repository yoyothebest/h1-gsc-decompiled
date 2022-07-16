// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precachestring( &"SCRIPT_COLON" );
    precachestring( &"SCRIPT_TIME_REMAINING" );
    precachestring( &"SCRIPT_TOTAL_SCORE" );
    precachestring( &"SCRIPT_EXTRA_LIFE" );
    precachestring( &"SCRIPT_CHECKPOINT" );
    precachestring( &"SCRIPT_MISSION_SCORE" );
    precachestring( &"SCRIPT_ZERO_DEATHS" );
    precachestring( &"SCRIPT_PLUS" );
    precachestring( &"SCRIPT_TIME_UP" );
    precachestring( &"SCRIPT_1UP" );
    precachestring( &"SCRIPT_GAME_OVER" );
    precachestring( &"SCRIPT_DIFFICULTY_BONUS_ONEANDAHALF" );
    precachestring( &"SCRIPT_DIFFICULTY_BONUS_THREE" );
    precachestring( &"SCRIPT_DIFFICULTY_BONUS_FOUR" );
    precachestring( &"SCRIPT_MISSION_COMPLETE" );
    precachestring( &"SCRIPT_NEW_HIGH_SCORE" );
    precachestring( &"SCRIPT_STREAK_BONUS_LOST" );
    precachestring( &"SCRIPT_STREAK_COMPLETE" );
    precachestring( &"SCRIPT_X" );
    precacheshader( "arcademode_life" );
    precacheshader( "arcademode_life_empty" );
    precacheshader( "h1_arcademode_scanelines_border" );
    precacheshader( "h1_arcademode_scanelines_border_cap" );
    precacheshader( "h1_arcademode_scanelines_border_end_title" );
    precacheshader( "h1_arcademode_numberstreak_circles" );
    precacheshader( "h1_arcademode_numberstreak_glow" );
    precacheshader( "h1_arcademode_livesmessage_border" );
    precacheshader( "h1_arcademode_checkpoint_flare" );
    precacheshader( "h1_arcademode_lives_earned_flare" );
    precacheshader( "h1_arcademode_lives_message_flare" );
    precacheshader( "h1_arcademode_number_streak_flare" );
    level.color_cool_green = ( 0.8, 2, 0.8 );
    level.color_cool_green_glow = ( 0.3, 0.6, 0.3 );
    level.arcademode_ending_hud = [];
    arcademode_init_kill_streak_colors();
    level.arcademode_checkpoint_dvars = [];
    level.arcademode_checkpoint_max = 10;
    level.arcademode_kills_hud = [];
    level.arcademode_kill_streak_ends = 0;
    level.arcademode_last_streak_time = 0;
    level.arcademode_ramping_score = 0;
    level.arcademode_new_kill_streak_allowed = 1;
    common_scripts\utility::_id_383D( "arcadeMode_multiplier_maxed" );
    setdvar( "arcademode_lives_changed", 0 );
    level.arcademode_kill_streak_current_multiplier = 1;
    level.arcademode_kill_streak_multiplier_count = 3;
    arcademode_reset_kill_streak();

    for ( var_0 = 0; var_0 < level.arcademode_checkpoint_max; var_0++ )
        setdvar( "arcademode_checkpoint_" + var_0, "" );

    level.arcademode_last_multi_kill_sound = 0;
    level.arcademode_success = 0;
    arcademode_define_damage_multipliers();
    common_scripts\utility::_id_383D( "arcademode_complete" );
    common_scripts\utility::_id_383D( "arcademode_ending_complete" );
    waitframe;

    if ( getdvar( "arcademode_full" ) == "1" )
        precacheleaderboards( "LB_AM_FULLCHALLENGE" );
    else
        precacheleaderboards( "LB_AM_" + level._id_038E );

    level._id_422E = ::player_kill;
    level._id_4226 = ::player_damage_ads;
    level._id_4225 = ::_id_6AC2;
    level.arcademode_hud_sort = 50;
    level.arcademode_maxlives = 10;
    level.arcademode_rewarded_lives = 0;

    if ( getdvar( "arcademode_lives" ) == "" || getdvar( "arcademode_full" ) != "1" || level._id_038E == "cargoship" )
    {
        setdvar( "arcademode_lives", 2 );
        level.arcademode_rewarded_lives = 2;
    }

    if ( getdvar( "arcademode_full" ) == "1" && level._id_038E == "cargoship" )
    {
        setdvar( "arcademode_lives", 5 );
        level.arcademode_rewarded_lives = 5;
    }

    var_1 = getdvarint( "arcademode_lives" );
    setdvar( "arcademode_earned_lives", var_1 );
    level.arcademode_playthrough = getdvarint( "arcademode_playthrough_count" );
    level.arcademode_playthrough++;
    setdvar( "arcademode_playthrough_count", level.arcademode_playthrough );
    setdvar( "arcademode_died", 0 );
    setdvar( "arcademode_score", 0 );

    if ( getdvar( "arcademode_combined_score" ) == "" || getdvar( "arcademode_full" ) == "1" && level._id_038E == "cargoship" )
        setdvar( "arcademode_combined_score", 0 );

    var_2 = arcademode_get_level_time();
    var_2 *= 60;
    level.arcdemode_starttime = gettime();
    level.arcademode_time = var_2;
    level.arcademode_killbase = 50;
    level.arcademode_damagebase = 5;
    level.arcademode_multikills = [];
    var_3 = _func_1D3( level.arcademode_weaponmultiplier );

    for ( var_0 = 0; var_0 < var_3.size; var_0++ )
        level.arcademode_multikills[var_3[var_0]] = [];

    var_4 = level.arcademode_multikills;
    thread arcademode_update_lives();
    thread arcademode_update_score();
    thread arcademode_update_timer();
    thread arcademode_death_detection();
    arcademode_redraw_lives( var_1 );

    for (;;)
    {
        wait 0.05;
        waitframe;
        waitframe;
        var_3 = _func_1D3( level.arcademode_multikills );
        common_scripts\utility::_id_0CF0( var_3, ::arcademode_add_points_for_mod );
        level.arcademode_multikills = var_4;
    }
}

arcademode_complete()
{
    if ( getdvar( "arcademode" ) != "1" )
        return 0;

    return common_scripts\utility::_id_382E( "arcademode_complete" );
}

arcademode_get_level_time()
{
    var_0 = 20;
    var_1 = [];
    var_1["cargoship"] = 11;
    var_1["armada"] = 15;
    var_1["bog_a"] = 13;
    var_1["hunted"] = 17;
    var_1["ac130"] = 13;
    var_1["bog_b"] = 15;
    var_1["airlift"] = 14;
    var_1["village_assault"] = 17;
    var_1["scoutsniper"] = 18;
    var_1["ambush"] = 12;
    var_1["sniperescape"] = 20;
    var_1["village_defend"] = 15;
    var_1["icbm"] = 16;
    var_1["launchfacility_a"] = 11;
    var_1["launchfacility_b"] = 14;
    var_1["jeepride"] = 9;
    var_1["airplane"] = 4;
    var_2 = 1;

    if ( isdefined( var_1[level._id_038E] ) )
        var_0 = var_1[level._id_038E];

    level.arcademode_difficultytimerscale = var_2;
    return var_0;
}

arcademode_death_detection()
{
    level endon( "arcademode_complete" );
    level _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "missionfailed" );
    level._id_0318 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    _id_A5A4::_id_2BDD();
    setdvar( "arcademode_died", 1 );
    var_0 = getdvarint( "arcademode_lives" );
    var_1 = getdvarint( "arcademode_earned_lives" );

    if ( var_0 > var_1 )
        var_0 = var_1;

    var_0 -= 1;
    setdvar( "arcademode_lives", var_0 );
    setdvar( "arcademode_lives_changed", -1 );
    arcademode_redraw_lives( var_0 + 1 );
    level.arcademode_redraw_score = 1;
    updatescoreelemsonce();

    if ( var_0 < 0 )
    {
        wait 1.5;
        level.arcademode_failurestring = &"SCRIPT_GAME_OVER";
        thread arcademode_ends();
        return;
    }

    if ( _func_1A1( level._id_0318 ) )
        _func_057();
}

arcademode_update_timer()
{
    level._id_0318 endon( "death" );
    var_0 = _func_1A9();
    var_0._id_0198 = 1;
    var_0.alignx = "right";
    var_0.aligny = "top";
    var_0._id_01F3 = "right";
    var_0._id_0501 = "top";
    var_0._id_0530 = -21.6667;
    var_0._id_0538 = 38.9778;
    var_0._id_03D4 = level.arcademode_hud_sort;
    var_0._id_0189 = 1.5;
    var_0.color = ( 1, 1, 1 );
    var_0._id_0188 = "objective";
    var_0 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_0._id_01ED = 1;
    level._id_0CC4 = var_0;
    level endon( "arcadeMode_remove_timer" );
    var_1 = level.arcademode_time;
    var_0 _meth_80D1( var_1 - 0.1 );
    wait(var_1);
    level.arcademode_failurestring = &"SCRIPT_TIME_UP";
    thread arcademode_ends();
    _id_A5E8::_id_870C( "player_death" );
}

arcademode_update_lives()
{
    level._id_0318 endon( "death" );
    level endon( "missionfailed" );
    level.arcademode_lives_hud = [];

    for ( var_0 = 0; var_0 < level.arcademode_maxlives; var_0++ )
        arcademode_add_life( var_0, -28.6667, 68.6667, -14, 64, level.arcademode_hud_sort );

    for (;;)
    {
        var_1 = getdvarint( "arcademode_lives_changed" );

        if ( var_1 != 0 )
        {
            var_2 = getdvarint( "arcademode_lives" );

            if ( var_2 < 0 )
            {
                level.arcademode_failurestring = &"SCRIPT_GAME_OVER";
                thread arcademode_ends();
                return;
            }

            if ( var_1 == -1 )
            {
                level notify( "lost_streak" );
                level.arcademode_kill_streak_ends = gettime();
                thread arcademode_add_kill_streak_time( 0 );
                level.arcademode_new_kill_streak_allowed = 0;
                var_3 = getdvarint( "arcademode_earned_lives" );
                var_3--;
                var_2 = var_3;
                setdvar( "arcademode_earned_lives", var_3 );
                setdvar( "arcademode_lives", var_3 );
                level._id_0318 thread common_scripts\utility::_id_69C2( "h1_arcademode_life_lost", level._id_0318 _meth_80AA() );
            }

            arcademode_redraw_lives( var_2 );
            level.arcademode_redraw_score = 1;
            setdvar( "arcademode_lives_changed", 0 );
        }

        wait 0.05;
    }
}

arcademode_convert_extra_lives()
{
    var_0 = getdvarint( "arcademode_lives" );
    var_1 = getdvarint( "arcademode_earned_lives" );

    if ( var_0 > var_1 )
        thread extra_lives_display( var_0 - var_1 );

    setdvar( "arcademode_earned_lives", var_0 );
    thread arcademode_redraw_lives( var_0 );
    return var_0 > var_1;
}

arcademode_checkpoint_print()
{
    if ( !_id_A5A4::_id_0CC3() )
        return;

    arcademode_convert_extra_lives();
    var_0 = 800;
    var_1 = 0.8;
    level._id_0318 thread common_scripts\utility::_id_69C2( "arcademode_checkpoint", level._id_0318 _meth_80AA() );
    thread draw_checkpoint( 0, var_1, 1 );
    thread draw_checkpoint_scanlines( 0, var_1, 1 );
    thread draw_checkpoint_flare();
}

draw_lives_earned_flare( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_1A9();
    var_4._id_0198 = 1;
    var_4._id_0530 = var_1 + var_0 * var_3 - 10;
    var_4._id_0538 = var_2 + 10;
    var_4 _meth_80CE( "h1_arcademode_lives_earned_flare", 26, 26 );
    var_4.alignx = "center";
    var_4.aligny = "middle";
    var_4._id_01F3 = "right";
    var_4._id_0501 = "top";
    var_4._id_03D4 = level.arcademode_hud_sort + 10 - 1;
    var_4.alpha = 0;
    var_4._id_01ED = 1;
    var_4 _meth_8086( 0.05 );
    var_4.alpha = 0.4;
    wait 0.05;
    var_4 _meth_8087( 0.15, 52, 52 );
    wait 0.15;
    var_4 _meth_808A();
}

arcademode_redraw_life( var_0, var_1 )
{
    if ( var_0 >= var_1 )
    {
        self _meth_80CE( "arcademode_life_empty", 20, 20 );
        self._id_0138 = 1;
    }
    else
    {
        if ( isdefined( self._id_0138 ) && self._id_0138 )
            thread draw_lives_earned_flare( var_0, -18.6667, 58.6667, -14 );

        self _meth_80CE( "arcademode_life", 20, 20 );
        self._id_0138 = 0;
    }

    self _meth_8086( 1 );
    self.alpha = 1;
    self.color = ( 1, 1, 1 );
}

arcademode_remove_life( var_0 )
{
    if ( self.alpha <= 0 )
        return;

    self _meth_8086( 1 );
    self.alpha = 0;
    self.color = ( 1, 0, 0 );
    self._id_01BC = 0;
    self._id_0138 = 0;
}

arcademode_remove_life_ending( var_0 )
{
    if ( self.alpha <= 0 )
        return;

    self _meth_8086( 0.15 );
    self.alpha = 0;
    self _meth_8087( 0.15, 40, 40 );
}

arcademode_redraw_lives( var_0 )
{
    if ( var_0 > 10 )
        var_0 = 10;

    var_1 = getdvarint( "arcademode_earned_lives" );

    for ( var_2 = 0; var_2 < var_0; var_2++ )
        level.arcademode_lives_hud[var_2] arcademode_redraw_life( var_2, var_1 );

    for ( var_2 = var_0; var_2 < level.arcademode_maxlives; var_2++ )
    {
        if ( var_2 < 0 )
            continue;

        if ( var_2 >= 10 )
            continue;

        if ( level.arcademode_success )
        {
            level.arcademode_lives_hud[var_2] arcademode_remove_life_ending( var_2 );
            continue;
        }

        level.arcademode_lives_hud[var_2] arcademode_remove_life( var_2 );
    }
}

arcademode_update_streak_progress()
{
    for (;;)
    {
        level common_scripts\utility::_id_A087( "arcademode_decrement_kill_streak", "arcademode_new_kill" );
        waitframe;
        arcademode_redraw_streak_progress();
    }
}

arcademode_redraw_streak_progress()
{
    for ( var_0 = 0; var_0 < level.arcademode_kill_streak_current_count; var_0++ )
    {
        if ( var_0 >= level.arcademode_kills_hud.size )
            return;

        level.arcademode_kills_hud[var_0].color = level.arcademode_streak_color[level.arcademode_kill_streak_current_multiplier - 1];
        level.arcademode_kills_hud[var_0]._id_01BD = level.arcademode_streak_glow[level.arcademode_kill_streak_current_multiplier - 1];
    }

    var_1 = 0;

    for (;;)
    {
        var_2 = level.arcademode_kill_streak_current_multiplier + var_1;

        if ( var_2 >= level.arcademode_streak_color.size )
            var_2 = level.arcademode_streak_color.size - 1;

        for ( var_0 = level.arcademode_kill_streak_current_count + var_1 * level.arcademode_kill_streak_multiplier_count; var_0 < level.arcademode_kill_streak_current_count + ( var_1 + 1 ) * level.arcademode_kill_streak_multiplier_count; var_0++ )
        {
            if ( var_0 >= level.arcademode_kills_hud.size )
                return;

            level.arcademode_kills_hud[var_0].color = level.arcademode_streak_color[var_2];
            level.arcademode_kills_hud[var_0]._id_01BD = level.arcademode_streak_glow[var_2];
        }

        var_1++;
    }
}

arcademode_add_kill( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( "arcademode_stop_kill_streak_art" );
    var_6 = _func_1A9();
    var_6._id_0198 = 1;
    var_6._id_0530 = var_1 + var_0 * var_3;

    if ( level.arcademode_kills_hud.size == 0 )
        level.arcademode_kill_zero_x_location = var_6._id_0530;

    var_6._id_0538 = var_2;
    var_6 _meth_80CE( "arcademode_kill", var_4, var_4 );
    var_6.alignx = "right";
    var_6.aligny = "top";
    var_6._id_01F3 = "right";
    var_6._id_0501 = "top";
    var_6._id_03D4 = var_5;
    var_6.color = level.color_cool_green;
    var_6._id_01BD = level.color_cool_green_glow;
    var_6._id_01BC = 1;
    var_6._id_01ED = 1;
    var_7 = 0;
    level.arcademode_kills_hud[level.arcademode_kills_hud.size] = var_6;

    if ( level.arcademode_kills_hud.size == 10 )
    {
        var_7 = 1;
        var_6.alpha = 0;
    }
    else
        var_6.alpha = 1;

    for (;;)
    {
        if ( var_6._id_0530 == level.arcademode_kill_zero_x_location )
        {
            var_8 = 4;

            if ( level.arcademode_kills_hud.size == 1 )
                wait 3;

            var_6 _meth_8086( var_8 );
            var_6.color = ( 1, 0, 0 );
            var_6.alpha = 0;
            wait(var_8);
            level notify( "arcademode_decrement_kill_streak" );
            var_6 _meth_808A();

            for ( var_9 = 0; var_9 < level.arcademode_kills_hud.size - 1; var_9++ )
                level.arcademode_kills_hud[var_9] = level.arcademode_kills_hud[var_9 + 1];

            level.arcademode_kills_hud[level.arcademode_kills_hud.size - 1] = undefined;

            if ( !level.arcademode_kills_hud.size )
                thread arcademode_reset_kill_streak();

            return;
        }

        level waittill( "arcademode_decrement_kill_streak" );
        wait 0.05;
        var_6 _meth_8088( 0.5 );
        var_6._id_0530 -= var_3;

        if ( var_7 )
        {
            var_6 _meth_8086( 0.5 );
            var_6.alpha = 1;
            var_7 = 0;
        }
    }
}

get_streak_hud( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_1A9();
    var_4._id_0198 = 1;
    var_4._id_0530 = var_0 + -4;
    var_4._id_0538 = var_1 + 14;
    var_4.alignx = "right";
    var_4.aligny = "top";
    var_4._id_01F3 = "right";
    var_4._id_0501 = "top";
    var_4.color = level.color_cool_green;
    var_4._id_03D4 = level.arcademode_hud_sort - 1;
    var_4.alpha = 0;
    var_4._id_01BD = level.color_cool_green_glow;
    var_4._id_01BC = 0;
    var_4._id_01ED = 1;
    var_4 _meth_80CE( "white", var_2, var_3 );
    return var_4;
}

arcademode_add_kill_streak_time( var_0 )
{
    if ( !level.arcademode_new_kill_streak_allowed )
        return;

    level notify( "arcademode_new_kill_streak_time" );
    level endon( "arcademode_new_kill_streak_time" );

    if ( level.arcademode_kill_streak_ends < gettime() )
        level.arcademode_kill_streak_ends = gettime() + var_0 * 1000;
    else
        level.arcademode_kill_streak_ends += var_0 * 1000;

    waitframe;

    if ( isdefined( level.arcademode_hud_streak ) )
    {
        level.arcademode_hud_streak _meth_8086( 0.05 );
        level.arcademode_hud_streak.alpha = 1;
    }

    var_1 = 26;
    var_2 = 12;
    var_3 = 90;
    var_4 = level.arcademode_streak_hud;
    var_5 = level.arcademode_streak_hud_shadow;
    var_6 = level.arcademode_kill_streak_ends - gettime();
    var_6 *= 0.001;

    if ( var_6 > var_3 )
        var_6 = var_3;

    var_6 *= var_2;
    var_6 = _func_0BC( var_6 );

    if ( var_6 > 980 )
        var_6 = 980;

    if ( !isdefined( var_4 ) )
    {
        var_4 = get_streak_hud( 0, 0, var_6, var_1 );
        var_5 = get_streak_hud( 3, 3, var_6, var_1 );
        var_5._id_03D4 -= 1;
        var_5.alpha = 0.0;
        var_5.color = ( 0, 0, 0 );
    }
    else
    {
        var_4 _meth_8087( 1, var_6, var_1 );
        var_5 _meth_8087( 1, var_6, var_1 );
        wait 1;
    }

    level.arcademode_streak_hud = var_4;
    level.arcademode_streak_hud_shadow = var_5;
    var_4 endon( "death" );
    var_0 = level.arcademode_kill_streak_ends - gettime();
    var_0 *= 0.001;
    var_7 = _func_0BC( var_0 );

    if ( var_7 > var_3 )
    {
        var_7 = var_3;
        wait(var_0 - var_7);
    }

    for (;;)
    {
        var_6 = level.arcademode_kill_streak_ends - gettime();
        var_6 *= 0.001;
        var_8 = var_6;

        if ( isdefined( level.arcademode_hud_streak ) )
        {
            level.arcademode_hud_streak _meth_8086( 1 );
            level.arcademode_hud_streak.alpha = ( var_8 - 1 ) / 5;
        }

        var_6 *= var_2;
        var_6 = _func_0BC( var_6 );

        if ( var_6 <= 0 )
            var_6 = 1;

        if ( var_6 > 980 )
            var_6 = 980;

        if ( isdefined( var_4 ) )
            var_4 _meth_8087( 1, var_6, var_1 );

        if ( isdefined( var_5 ) )
            var_5 _meth_8087( 1, var_6, var_1 );

        wait 1;

        if ( var_6 == 1 )
            break;
    }

    thread arcademode_reset_kill_streak();
}

arcademode_add_kill_streak()
{
    if ( common_scripts\utility::_id_382E( "arcadeMode_multiplier_maxed" ) )
        return;

    level endon( "arcadeMode_multiplier_maxed" );
    level endon( "arcademode_stop_kill_streak" );
    level.arcademode_kill_streak_current_count--;
    var_0 = gettime();

    if ( level.arcademode_kill_streak_current_count <= 0 && var_0 > level.arcademode_last_streak_time )
    {
        level.arcademode_last_streak_time = var_0;
        var_1 = level.arcademode_kill_streak_current_multiplier;
        level.arcademode_kill_streak_current_multiplier++;

        if ( level.arcademode_kill_streak_current_multiplier >= level.arcademode_streak_color.size )
        {
            level.arcademode_kill_streak_current_multiplier = level.arcademode_streak_color.size;
            thread arcademode_multiplier_maxed();
        }

        if ( var_1 != level.arcademode_kill_streak_current_multiplier )
        {
            level notify( "arcademode_new_kill_streak" );
            level._id_0318 _meth_809C( "arcademode_" + level.arcademode_kill_streak_current_multiplier + "x" );
            thread arcademode_draw_multiplier();
        }

        level.arcademode_kill_streak_current_count = level.arcademode_kill_streak_multiplier_count;
    }

    level notify( "arcademode_new_kill" );

    for (;;)
    {
        if ( level.arcademode_kills_hud.size < 10 )
        {
            arcademode_add_kill_streak_time( 5 );
            return;
        }

        level waittill( "arcademode_decrement_kill_streak" );
    }
}

streak_timer_color_pulse()
{
    waitframe;
    waitframe;
    level.arcademode_streak_hud endon( "death" );

    for (;;)
    {
        var_0 = _func_0B5( 0.1, 1.0 );
        level.arcademode_streak_hud _meth_8086( var_0 );
        level.arcademode_streak_hud.color = ( _func_0B3( 1 ), _func_0B3( 1 ), _func_0B3( 1 ) );
        wait(var_0);
    }
}

arcademode_multiplier_maxed()
{
    waitframe;

    if ( common_scripts\utility::_id_382E( "arcadeMode_multiplier_maxed" ) )
        return;

    common_scripts\utility::_id_383F( "arcadeMode_multiplier_maxed" );
    var_0 = 20;
    level.arcademode_kill_streak_ends = gettime() + var_0 * 1000;
    thread arcademode_add_kill_streak_time( 0 );
    thread streak_timer_color_pulse();
    _func_076();
    wait 0.05;
    _func_075( "airplane_alt_maximum_music" );
    level _id_A5A4::_id_07BE( _id_A5A4::_id_0694, var_0 + 1 );
    level _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "lost_streak" );
    _id_A5A4::_id_2BDD();
    thread arcademode_reset_kill_streak();
    _func_076();

    if ( isdefined( level._id_555B ) )
    {
        wait 0.05;
        _func_075( level._id_555B );
    }
}

get_score_backer( var_0, var_1, var_2 )
{
    var_3 = new_ending_hud( "right", 0.1, -5.16667, 3.22222 );
    var_3 _meth_80CE( "h1_arcademode_scanelines_border", 50, 50 );
    var_3.alignx = "right";
    var_3.aligny = "top";
    var_3._id_01F3 = "right";
    var_3._id_0501 = "top";
    var_3._id_03D4 = -100;
    var_3.alpha = 1.0;
    return var_3;
}

get_hud_score()
{
    var_0 = _func_1A9();
    var_0._id_0198 = 1;
    var_0._id_0530 = 0;
    var_0._id_0538 = 10.2222;
    var_0.alignx = "right";
    var_0.aligny = "top";
    var_0._id_01F3 = "right";
    var_0._id_0501 = "top";
    var_0._id_038D = 0;
    var_0._id_0188 = "objective";
    var_0._id_0189 = 2.8;
    var_0._id_03D4 = level.arcademode_hud_sort;
    var_0 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_0._id_01ED = 1;
    return var_0;
}

arcademode_update_score()
{
    level._id_0318 endon( "death" );
    level.arcademode_hud_digits = 10;
    level.arcademode_hud_scores = [];

    for ( var_0 = 0; var_0 < level.arcademode_hud_digits; var_0++ )
    {
        level.arcademode_hud_scores[level.arcademode_hud_scores.size] = get_hud_score();
        level.arcademode_hud_scores[level.arcademode_hud_scores.size - 1]._id_0530 = var_0 * -17 + -21.6667;
    }

    level.arcademode_hud_score_backer = get_score_backer();

    if ( getdvarint( "arcademode_full" ) )
        var_1 = getdvarint( "arcademode_combined_score" );
    else
        var_1 = getdvarint( "arcademode_score" );

    hud_draw_score( var_1 );
    level.arcademode_redraw_score = 0;

    for (;;)
    {
        wait 0.05;
        updatescoreelemsonce();

        if ( level.arcademode_redraw_score )
            level.arcademode_redraw_score = 0;
    }
}

updatescoreelemsonce()
{
    if ( getdvarint( "arcademode_full" ) )
        hud_update_score( "arcadeMode_combined_score" );
    else
        hud_update_score( "arcademode_score" );
}

hud_update_score( var_0 )
{
    var_1 = getdvarint( var_0 );

    if ( level.arcademode_redraw_score )
    {
        level.arcademode_ramping_score = var_1;
        hud_draw_score( var_1 );
        return;
    }

    if ( level.arcademode_ramping_score >= var_1 )
        return;

    var_2 = var_1 - level.arcademode_ramping_score;
    var_3 = var_2 * 0.2 + 1;

    if ( var_2 <= 15 )
        var_3 = 1;

    level.arcademode_ramping_score += var_3;

    if ( level.arcademode_ramping_score > var_1 )
        level.arcademode_ramping_score = var_1;

    hud_draw_score( _func_0BC( level.arcademode_ramping_score ) );
}

get_digits_from_score( var_0 )
{
    var_1 = [];
    var_0 = _func_0BC( var_0 );

    for (;;)
    {
        var_1[var_1.size] = var_0 % 10;
        var_0 = _func_0BC( var_0 * 0.1 );

        if ( var_0 <= 0 )
            break;
    }

    return var_1;
}

hud_draw_score( var_0 )
{
    hud_draw_score_for_elements( var_0, level.arcademode_hud_scores );
}

hud_draw_score_for_elements( var_0, var_1 )
{
    var_2 = get_digits_from_score( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_3 >= var_1.size - 1 )
            break;

        var_1[var_3] _meth_80D9( var_2[var_3] );
        var_1[var_3].alpha = 1;
    }

    for ( var_3 = var_2.size; var_3 < var_1.size; var_3++ )
        var_1[var_3].alpha = 0;

    if ( var_0 == 0 )
    {
        var_1[0].alpha = 1;
        var_1[0] _meth_80D9( 0 );
    }

    level.arcademode_hud_score_backer _meth_80CE( "h1_arcademode_scanelines_border", 50 + ( var_2.size - 1 ) * 22, 50 );
    level.arcademode_hud_score_backer._id_0530 = -5.16667 + ( var_2.size - 1 ) * 2.4;

    if ( !common_scripts\utility::_id_382E( "arcademode_complete" ) )
        level._id_0318 thread common_scripts\utility::_id_69C2( "h1_arcademode_add_counter_pt", level._id_0318 _meth_80AA() );
}

hud_draw_score_for_elements_align_left( var_0, var_1 )
{
    var_2 = get_digits_from_score( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_3 >= var_1.size - 1 )
            break;

        var_1[var_1.size - var_2.size + var_3] _meth_80D9( var_2[var_3] );
        var_1[var_1.size - var_2.size + var_3].alpha = 1;
    }

    for ( var_3 = var_1.size - var_2.size - 1; var_3 >= 0; var_3-- )
        var_1[var_3].alpha = 0;

    if ( var_0 == 0 )
    {
        var_1[var_1.size - 1].alpha = 1;
        var_1[var_1.size - 1] _meth_80D9( 0 );
    }
}

arcademode_add_life( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _func_1A9();
    var_6._id_0198 = 1;
    var_6._id_0530 = var_1 + var_0 * var_3;
    var_6._id_0538 = var_2;
    var_6 _meth_80CE( "arcademode_life", var_4, var_4 );
    var_6.alignx = "center";
    var_6.aligny = "middle";
    var_6._id_01F3 = "right";
    var_6._id_0501 = "top";
    var_6._id_03D4 = var_5;
    var_6.color = ( 1, 1, 1 );
    var_6._id_01BC = 0;
    var_6.alpha = 0;
    var_6._id_01ED = 1;
    level.arcademode_lives_hud[level.arcademode_lives_hud.size] = var_6;
}

arcademode_define_damage_multipliers()
{
    var_0["MOD_MELEE"] = 20;
    var_0["MOD_PISTOL_BULLET"] = 20;
    var_0["MOD_RIFLE_BULLET"] = 10;
    var_0["MOD_PROJECTILE"] = 2;
    var_0["MOD_PROJECTILE_SPLASH"] = 2;
    var_0["MOD_EXPLOSIVE"] = 2;
    var_0["MOD_GRENADE"] = 2;
    var_0["MOD_GRENADE_SPLASH"] = 2;
    var_0 = [];
    var_0["melee"] = 1;
    var_0["pistol"] = 1;
    var_0["rifle"] = 0.5;
    var_0["explosive"] = 0.3;
    level.arcademode_weaponmultiplier = var_0;
    var_1 = [];
    var_1["melee"] = 80;
    var_1["pistol"] = 0;
    var_1["rifle"] = 0;
    var_1["explosive"] = 0;
    level.arcademode_weaponbonus = var_1;
    var_2 = [];
    var_2["MOD_MELEE"] = "melee";
    var_2["MOD_PISTOL_BULLET"] = "pistol";
    var_2["MOD_RIFLE_BULLET"] = "rifle";
    var_2["MOD_PROJECTILE"] = "explosive";
    var_2["MOD_PROJECTILE_SPLASH"] = "explosive";
    var_2["MOD_EXPLOSIVE"] = "explosive";
    var_2["MOD_GRENADE"] = "explosive";
    var_2["MOD_GRENADE_SPLASH"] = "explosive";
    level.arcademode_deathtypes = var_2;
    var_3 = [];
    var_3["melee"] = ( 1, 0, 1 );
    var_3["pistol"] = ( 0, 1, 0 );
    var_3["rifle"] = ( 1, 1, 0 );
    var_3["explosive"] = ( 0, 1, 1 );
    level.arcademode_killcolors = var_3;
    var_4 = [];
    var_4["head"] = 50;
    var_4["helmet"] = 50;
    var_4["neck"] = 20;
    var_4["torso_upper"] = 10;
    var_4["torso_lower"] = 10;
    var_4["right_arm_upper"] = 0;
    var_4["left_arm_lower"] = 0;
    var_4["right_leg_lower"] = 0;
    var_4["left_leg_upper"] = 0;
    var_4["right_leg_upper"] = 0;
    var_4["left_leg_lower"] = 0;
    var_4["left_foot"] = 0;
    var_4["right_foot"] = 0;
    var_4["left_hand"] = 0;
    var_4["left_arm_upper"] = 0;
    var_4["right_hand"] = 0;
    var_4["right_arm_lower"] = 0;
    var_4["gun"] = 0;
    var_4["none"] = 0;
    level.arcademode_locationkillbonus = var_4;
    var_5 = [];
    var_5[0] = 1;
    var_5[1] = 1.5;
    var_5[2] = 3;
    var_5[3] = 4;
    level.arcademode_skillmultiplier = var_5;
    var_6 = [];
    var_6[0] = 9000;
    var_6[1] = 9000;
    var_6[2] = 7000;
    var_6[3] = 6000;
    var_6[0] = 40;
    var_6[1] = 30;
    var_6[2] = 25;
    var_6[3] = 20;
    level.arcademode_kills_until_next_extra_life = 10;
    level.arcademode_extra_lives_range = var_6;
    var_7 = [];

    for ( var_8 = 0; var_8 < 4; var_8++ )
        var_7[var_8] = var_6[var_8] * 0.15;

    level.arcademode_extra_lives_base = var_7;
}

set_next_extra_life( var_0 )
{

}

new_ending_hud( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_1A9();
    var_4._id_0198 = 1;
    var_4._id_0530 = var_2;
    var_4._id_0538 = var_3;
    var_4.alignx = var_0;
    var_4.aligny = "middle";
    var_4._id_01F3 = var_0;
    var_4._id_0501 = "middle";
    var_4._id_0189 = 3;

    if ( getdvar( "widescreen" ) == "1" )
        var_4._id_0189 = 5;

    var_4.color = ( 0.8, 1, 0.8 );
    var_4._id_0188 = "objective";
    var_4._id_01BD = ( 0.3, 0.6, 0.3 );
    var_4._id_01BC = 1;
    var_4.alpha = 0;
    var_4 _meth_8086( var_1 );
    var_4.alpha = 1;
    var_4._id_01ED = 1;
    var_4._id_03D4 = level.arcademode_hud_sort + 10;
    level.arcademode_ending_hud[level.arcademode_ending_hud.size] = var_4;
    return var_4;
}

extra_lives_display_border()
{
    var_0 = new_ending_hud( "center", 0.001, 0, 97.7778 );
    var_0 _meth_80CE( "h1_arcademode_livesmessage_border", 210, 112 );
    var_0._id_03D4 = level.arcademode_hud_sort + 10 - 1;
    var_0._id_0501 = "top_adjustable";
    var_0.alpha = 0;
    var_0 _meth_8086( 0.15 );
    var_0.alpha = 1;
    wait 0.15;
    var_0 _meth_8086( 0.1 );
    var_0.alpha = 0;
    wait 0.1;
    var_0 _meth_8086( 0.1 );
    var_0.alpha = 1;
    wait 0.1;
    wait 1.2;
    var_0 _meth_8086( 0.1 );
    var_0.alpha = 0;
    wait 0.1;
    var_0 _meth_808A();
}

extra_lives_display_flare()
{
    var_0 = new_ending_hud( "center", 0.001, 0, 97.7778 );
    var_0 _meth_80CE( "h1_arcademode_lives_message_flare", 145, 26 );
    var_0._id_03D4 = level.arcademode_hud_sort + 10 + 1;
    var_0._id_0501 = "top_adjustable";
    var_0.alpha = 0;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 1;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 0;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 1;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 0;
    wait 0.05;
    wait 0.1;
    var_0 _meth_8086( 0.15 );
    var_0.alpha = 1;
    wait 0.15;
    var_0 _meth_8086( 0.1 );
    var_0.alpha = 0;
    wait 0.1;
    wait 2.1;
    var_0 _meth_808A();
}

extra_lives_display( var_0 )
{
    wait 0.5;
    level._id_0318 thread common_scripts\utility::_id_69C2( "arcademode_extralife", level._id_0318 _meth_80AA() );
    var_1 = new_ending_hud( "center", 0.001, 0, 97.7778 );
    var_1._id_0189 = 1.7;
    var_1._id_0501 = "top_adjustable";
    var_1 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.5, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_1._id_0241 = &"SCRIPT_EXTRA_LIFE";
    var_1 _meth_80D9( var_0 );
    thread extra_lives_display_border();
    thread extra_lives_display_flare();
    var_1.alpha = 0;
    wait 0.4;
    var_1 _meth_8086( 0.15 );
    var_1.alpha = 1;
    wait 0.15;
    wait 1.0;
    var_1 _meth_8086( 0.1 );
    var_1.alpha = 0;
    wait 0.1;
    var_1 _meth_808A();
}

_id_35E3( var_0 )
{
    self _meth_8086( var_0 );
    self.alpha = 0;
    wait(var_0);
    self _meth_808A();
}

extra_lives_sizzle()
{
    var_0 = new_ending_hud( "center", 0.2, 0, -100 );
    var_0.alpha = _func_0B5( 0.1, 0.45 );
    var_0._id_03D4 -= 1;
    var_0 _meth_80CC( &"SCRIPT_EXTRA_LIFE" );
    var_0 _id_A5A4::_id_27EF( 3, ::_id_35E3, 1 );
    var_0 endon( "death" );
    var_1 = var_0._id_0530;
    var_2 = var_0._id_0538;
    var_3 = 20;

    for (;;)
    {
        var_4 = _func_0B5( 0.1, 0.2 );
        var_0 _meth_8088( var_4 );
        var_0._id_0530 = var_1 + _func_0B5( var_3 * -1, var_3 );
        var_0._id_0538 = var_2 + _func_0B5( var_3 * -1, var_3 );
        wait(var_4);
    }
}

round_up_to_five( var_0 )
{
    var_1 = var_0 - var_0 % 5;

    if ( var_1 < var_0 )
        var_1 += 5;

    return var_1;
}

arcademode_add_points( var_0, var_1, var_2, var_3 )
{
    if ( var_3 <= 0 )
        return;

    if ( isdefined( level.arcademode_deathtypes[var_2] ) )
        var_2 = level.arcademode_deathtypes[var_2];

    var_3 = _func_0BC( var_3 );
    var_3 = round_up_to_five( var_3 );
    var_3 *= level.arcademode_kill_streak_current_multiplier;
    var_4 = getdvarint( "arcademode_score" );
    var_4 += var_3;
    var_5 = getdvarint( "arcademode_combined_score" );
    var_5 += var_3;
    setdvar( "arcademode_combined_score", var_5 );
    setdvar( "arcademode_score", var_4 );
    var_6 = 60;
    var_7 = 1.5;
    var_8 = 0.9 + ( var_3 - 10 ) * 0.01;

    if ( var_8 > 1.4 )
        var_8 = 1.4;

    var_9 = ( 0.75, 0, 0 );

    if ( var_1 )
    {
        thread arcademode_add_kill_streak();
        thread arcademode_add_point_towards_extra_life();
        var_9 = level.arcademode_killcolors[var_2];
    }

    level._id_0318 pointpulse( var_3 );
}

arcademode_add_point_towards_extra_life()
{
    level.arcademode_kills_until_next_extra_life -= 1;

    if ( level.arcademode_kills_until_next_extra_life > 0 )
        return;

    level.arcademode_rewarded_lives++;
    var_0 = getdvarint( "arcademode_lives" );
    var_0++;

    if ( var_0 >= level.arcademode_maxlives )
        var_0 = level.arcademode_maxlives;
    else
    {
        setdvar( "arcademode_lives", var_0 );
        setdvar( "arcademode_lives_changed", 1 );
    }

    level.arcademode_kills_until_next_extra_life = level.arcademode_extra_lives_range[level._id_3BFE];
}

arcademode_set_origin_in_radius()
{
    var_0 = 60;
    var_1 = 90;

    if ( level._id_0318.pointpulseindex > 0 )
    {
        if ( level._id_0318.pointpulseindex == 1 )
        {
            var_2 = _func_0B2( 1 );
            level._id_0318.thirdpointpulseside = 1 - var_2;

            if ( var_2 )
                var_1 = 45;
            else
                var_1 = 135;
        }
        else if ( level._id_0318.pointpulseindex == 2 )
        {
            var_2 = level._id_0318.thirdpointpulseside;

            if ( var_2 )
                var_1 = 45;
            else
                var_1 = 135;
        }
        else if ( level._id_0318.pointpulseindex <= 4 )
        {
            var_1 = _func_0B5( 0, 180 );
            var_0 = _func_0B5( 60, 120 );
        }
        else if ( level._id_0318.pointpulseindex <= 8 )
        {
            var_1 = _func_0B5( 0, 180 );
            var_0 = _func_0B5( 60, 160 );
        }
        else
        {
            var_1 = _func_0B5( -30, 210 );
            var_0 = _func_0B5( 60, 200 );
        }
    }

    self._id_0530 = var_0 * _func_0B7( var_1 );
    self._id_0538 = 0 - var_0 * _func_0B6( var_1 );
}

pointpulse( var_0 )
{
    if ( var_0 == 0 )
        return;

    if ( !isdefined( level._id_0318.pointpulsecount ) )
    {
        level._id_0318.pointpulsecount = 0;
        level._id_0318.pointpulseindex = 0;
    }

    if ( !common_scripts\utility::_id_382E( "arcademode_complete" ) )
        level._id_0318 thread common_scripts\utility::_id_69C2( "h1_arcademode_pulse_score", level._id_0318 _meth_80AA() );

    var_1 = _func_1A9();
    var_1._id_01F3 = "center";
    var_1._id_0501 = "middle";
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1 arcademode_set_origin_in_radius();
    var_1._id_0188 = "objective";
    var_1._id_0189 = 1.5;
    var_1.archived = 0;
    var_1.color = ( 1, 1, 1 );
    var_1._id_03D4 = 4;
    var_2 = level.arcademode_kill_streak_current_multiplier;
    level._id_0318.pointpulsecount++;
    level._id_0318.pointpulseindex++;
    wait 0.05;

    if ( var_0 <= 0 )
    {
        var_1._id_0241 = &"";
        var_1.color = ( 1, 0, 0 );
        var_1._id_01BD = ( 0, 0, 0 );
        var_1._id_01BC = 0;
    }
    else
    {
        var_1._id_0241 = &"SCRIPT_PLUS";
        var_1.color = ( 1, 1, 1 );
        var_1 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    }

    var_1 _meth_80D9( var_0 );
    var_1.alpha = 1;
    var_3 = 4.0;
    var_4 = 0.025;
    var_5 = 1.5;
    var_6 = 0.2;
    var_1 _meth_808D( var_4 );
    var_1._id_0189 = var_3;
    wait 0.05;
    var_1 _meth_8088( 1.75 );
    var_1._id_0538 -= 20;
    var_1 _meth_808D( var_6 );
    var_1._id_0189 = var_5;
    wait(var_6);
    var_1 _meth_8086( 1.0 );
    var_1.alpha = 0;
    wait 1.0;
    level._id_0318.pointpulsecount--;

    if ( level._id_0318.pointpulsecount == 0 )
        level._id_0318.pointpulseindex = 0;

    var_1 _meth_808A();
}

set_circular_origin()
{
    var_0 = 50;

    for (;;)
    {
        var_1 = _func_0B2( var_0 );
        var_2 = _func_0B2( var_0 );

        if ( _func_0EE( ( 0, 0, 0 ), ( var_1, var_2, 0 ) ) < var_0 )
            break;
    }

    if ( common_scripts\utility::_id_2006() )
        var_1 *= -1;

    if ( common_scripts\utility::_id_2006() )
        var_2 *= -1;

    self._id_0530 = var_1;
    self._id_0538 = var_2;
}

arcademode_add_points_for_mod( var_0 )
{
    for ( var_1 = 0; var_1 < level.arcademode_multikills[var_0].size; var_1++ )
        arcademode_add_points_for_individual_kill( level.arcademode_multikills[var_0][var_1], var_0, level.arcademode_multikills[var_0].size );
}

arcademode_add_points_for_individual_kill( var_0, var_1, var_2 )
{
    if ( var_0["type"] != "melee" )
        var_3 = level.arcademode_killbase + level.arcademode_locationkillbonus[var_0["damage_location"]] + level.arcademode_weaponbonus[var_0["type"]];
    else
        var_3 = level.arcademode_killbase + level.arcademode_weaponbonus[var_0["type"]];

    thread arcademode_add_points( var_0["origin"], 1, var_1, var_3 );
}

player_kill( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "none";

    var_3 = level.arcademode_deathtypes[var_0];

    if ( !isdefined( var_3 ) )
    {
        var_4 = level.arcademode_killbase;
        thread arcademode_add_points( var_2, 1, "melee", var_4 );
        return;
    }

    var_5["damage_location"] = var_1;
    var_5["type"] = var_3;
    var_5["origin"] = var_2;

    if ( var_3 == "explosive" )
        var_5["origin"] = self._id_02E2;

    level.arcademode_multikills[var_3][level.arcademode_multikills[var_3].size] = var_5;
}

_id_6AC2( var_0, var_1, var_2 )
{
    thread arcademode_add_points( var_2, 0, var_0, level.arcademode_damagebase );
}

player_damage_ads( var_0, var_1, var_2 )
{
    thread arcademode_add_points( var_2, 0, var_0, level.arcademode_damagebase * 1.25 );
}

ending_screen_mission_complete_flourish( var_0 )
{
    var_1 = new_ending_hud( "center", 0.05, 0, var_0 );
    var_1._id_0189 = 3;
    var_1.color = ( 1, 1, 1 );
    var_1 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_1 _meth_80CC( &"SCRIPT_MISSION_COMPLETE" );
    var_2 = new_ending_hud( "center", 0.15, 0, var_0 );
    var_2._id_0189 = 4.5;
    var_2.color = ( 1, 1, 1 );
    var_2 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_2 _meth_80CC( &"SCRIPT_MISSION_COMPLETE" );
    var_1 _meth_808D( 0.15 );
    var_1._id_0189 = 4.5;
    var_2 _meth_808D( 0.15 );
    var_2._id_0189 = 3;
    wait 0.05;
    var_1 _meth_8086( 0.15 );
    var_1.alpha = 0;
    wait 0.15;
    var_1 _meth_808A();
    var_2 _meth_808A();
}

end_mission()
{
    _func_0D6( "ui_nextMission", "0" );

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        var_1 = level._id_0323[var_0];
        var_1._id_0271 = 0;
        var_1._id_01E6 = 1;
    }

    _func_055( "" );
}

create_total_score_hud( var_0, var_1 )
{
    level.arcademode_hud_total_scores = [];

    for ( var_2 = 0; var_2 < level.arcademode_hud_digits; var_2++ )
    {
        var_3 = get_hud_score();
        level.arcademode_hud_total_scores[level.arcademode_hud_total_scores.size] = var_3;
        level.arcademode_ending_hud[level.arcademode_ending_hud.size] = var_3;
        var_3._id_0530 = 0;
        var_3._id_0538 = var_1;
        var_3._id_03D4 = level.arcademode_hud_sort + 10;
        var_3.alignx = "left";
        var_3.aligny = "middle";
        var_3._id_01F3 = "fullscreen";
        var_3._id_0501 = "middle";
        var_3._id_0189 = 1.875;
        var_3.alpha = 0;
        var_3 _meth_8086( 1.0 );
        var_3.alpha = 1;
    }
}

set_total_score_hud( var_0 )
{
    hud_draw_score_for_elements_align_left( var_0, level.arcademode_hud_total_scores );
}

rescale_ending_huds_thread( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    for (;;)
    {
        var_6 = _func_041();
        var_7 = _func_042();

        if ( var_6 != level.screen_width || var_7 != level.screen_height )
        {
            level.screen_width = var_6;
            level.screen_height = var_7;

            if ( level.screen_height == 0 )
                level.screen_height = 1;

            if ( level.screen_width == 0 )
                level.screen_width = 1;

            rescale_ending_huds( var_0, var_1, var_2, var_3, var_4, var_5 );
        }

        wait 0.1;
    }
}

rescale_ending_huds( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = 1920.0 / level.screen_width * level.screen_height / 1080.0;
    var_7 = 37 * var_6;
    var_8 = 11.6667 + 9 * var_6 * 9 + var_7;

    for ( var_9 = 0; var_9 < level.arcademode_hud_digits; var_9++ )
    {
        level.arcademode_hud_mission_scores[var_9]._id_0530 = 320 + var_9 * ( -9 * var_6 ) + var_8;

        if ( isdefined( level.arcademode_hud_total_scores ) )
            level.arcademode_hud_total_scores[var_9]._id_0530 = 320 + var_9 * ( -9 * var_6 ) + var_8;
    }

    var_10 = 11.6667 + var_7;
    level._id_0CC4[0]._id_0530 = 320 + var_10 + 0 * var_6;
    level._id_0CC4[1]._id_0530 = 320 + var_10 + 8.3 * var_6;
    level._id_0CC4[2]._id_0530 = 320 + var_10 + 16.6 * var_6;
    level._id_0CC4[3]._id_0530 = 320 + var_10 + 21 * var_6;
    level._id_0CC4[4]._id_0530 = 320 + var_10 + 29.6 * var_6;
    var_11 = 58.5;
    var_12 = var_11 - ( 10 - var_3 ) * 13 * 0.5;

    for ( var_9 = 0; var_9 < level.arcademode_maxlives; var_9++ )
        level.arcademode_lives_hud[var_9]._id_0530 = ( var_9 * -13 + var_12 ) * var_6;

    if ( isdefined( var_0 ) )
        var_0._id_0530 = 320 + var_7;

    var_1._id_0530 = 320 + var_7;
    var_2._id_0530 = 320 + var_7;

    if ( level.arcademode_success )
        var_4 _meth_80CE( "h1_arcademode_scanelines_border", _func_0BC( 344 * var_6 ), 65 );
    else
        var_4 _meth_80CE( "h1_arcademode_scanelines_border", _func_0BC( 216 * var_6 ), 65 );

    var_5 _meth_80CE( "h1_arcademode_scanelines_border_end_title", _func_0BC( 291 * var_6 ), 4 );
}

arcademode_ends()
{
    if ( common_scripts\utility::_id_382E( "arcademode_complete" ) )
        return;

    common_scripts\utility::_id_383F( "arcademode_complete" );
    _id_A5A4::_id_8644( 0.05 );
    _id_A5A4::_id_8641();
    _id_A5A4::_id_863E();

    if ( level.arcademode_success )
    {
        if ( arcademode_convert_extra_lives() )
            wait 2;
    }

    var_0 = 0;

    if ( isdefined( level._id_0CC6 ) )
    {
        var_0 = gettime() - level._id_0CC6;
        var_0 *= 0.001;
    }

    var_1 = gettime() - level.arcdemode_starttime;
    var_1 *= 0.001;
    var_1 -= var_0;
    var_2 = level.arcademode_time - var_1;
    var_2 = _func_0BC( var_2 );

    if ( level.arcademode_success )
    {
        if ( var_2 == 0 )
            var_2++;
    }

    var_3 = 0.5;
    level.mission_failed_disabled = 1;
    thread player_invul_forever();
    thread black_background( var_3 );
    wait(var_3 + 0.25);
    level._id_0318 _meth_8326( 1 );
    var_4 = 1;
    var_5 = 0;

    if ( getdvar( "arcademode_full" ) == "1" )
        var_5 = 27.5556;

    var_6 = -111.111;
    var_7 = -72.0;
    var_8 = var_7;
    var_9 = -72.0 + var_5;
    var_10 = var_9;
    var_11 = -44.4444 + var_5;
    var_12 = var_11;
    var_13 = 35.5556 + var_5;
    var_14 = -20.4444 + var_5;
    var_15 = new_ending_hud( "center", 0.1, 0, var_6 );
    var_15._id_0189 = 3;
    var_16 = new_ending_hud( "center", 0.1, 320, var_6 + 5 );
    var_16._id_01F3 = "fullscreen";
    var_16._id_03D4 = var_15._id_03D4 - 1;
    var_16.alpha = 1;
    level.screen_width = _func_041();
    level.screen_height = _func_042();
    var_17 = 1920.0 / level.screen_width * level.screen_height / 1080.0;

    if ( level.arcademode_success )
    {
        var_15.color = ( 1, 1, 1 );
        var_15 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
        var_16 _meth_80CE( "h1_arcademode_scanelines_border", _func_0BC( 344 * var_17 ), 65 );
        var_15 _meth_80CC( &"SCRIPT_MISSION_COMPLETE" );
        level._id_0318 _meth_809C( "h1_arcademode_mission_success" );
        thread ending_screen_mission_complete_flourish( var_6 );
    }
    else
    {
        var_15.color = ( 1, 0.15, 0.16 );
        var_15 _meth_8347( -0.6, 0, 0, 0, ( 0.5, 0.1, 0.1 ), 0.3, 0, 0, ( 0, 0, 0 ), 0 );
        var_15 _meth_80CC( level.arcademode_failurestring );
        var_16 _meth_80CE( "h1_arcademode_scanelines_border", _func_0BC( 216 * var_17 ), 65 );
        var_16.color = ( 1, 0.15, 0.16 );
        level._id_0318 _meth_809C( "h1_arcademode_mission_fail" );
    }

    var_18 = new_ending_hud( "center", 0.1, 0, var_6 + 20 );
    var_18 _meth_80CE( "h1_arcademode_scanelines_border_end_title", _func_0BC( 291 * var_17 ), 4 );
    var_18._id_03D4 = var_15._id_03D4 - 1;
    var_18.alpha = 1;
    wait 1.0;
    var_19 = getdvarint( "arcademode_lives" );
    var_20 = level.arcademode_rewarded_lives;

    if ( var_19 > var_20 )
        var_19 = var_20;

    for ( var_21 = 0; var_21 < level.arcademode_maxlives; var_21++ )
        level.arcademode_lives_hud[var_21] _meth_808A();

    level.arcademode_lives_hud = [];

    for ( var_21 = 0; var_21 < level.arcademode_maxlives; var_21++ )
    {
        arcademode_add_life( var_21, 0, var_14, 0, 64, level.arcademode_hud_sort + 10 );
        level.arcademode_lives_hud[var_21]._id_01F3 = "center";
        level.arcademode_lives_hud[var_21]._id_0501 = "middle";
    }

    arcademode_redraw_lives( var_19 );
    var_22 = 0;
    var_23 = undefined;

    if ( getdvar( "arcademode_full" ) == "1" )
    {
        var_23 = new_ending_hud( "center", var_4, 0, var_7 );
        var_23.alignx = "right";
        var_23._id_01F3 = "fullscreen";
        var_23._id_0189 = 1.875;
        var_23.color = ( 1, 1, 1 );
        var_23 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
        var_23 _meth_80CC( &"SCRIPT_TOTAL_SCORE" );
        create_total_score_hud( 0, var_8 );
        var_22 = getdvarint( "arcademode_combined_score" );
        set_total_score_hud( var_22 );
    }

    var_24 = new_ending_hud( "center", var_4, 0, var_9 );
    var_24.alignx = "right";
    var_24._id_01F3 = "fullscreen";
    var_24._id_0189 = 1.875;
    var_24.color = ( 1, 1, 1 );
    var_24 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_24 _meth_80CC( &"SCRIPT_MISSION_SCORE" );
    level.arcademode_hud_mission_scores = [];

    for ( var_21 = 0; var_21 < level.arcademode_hud_digits; var_21++ )
    {
        var_25 = get_hud_score();
        level.arcademode_hud_mission_scores[level.arcademode_hud_mission_scores.size] = var_25;
        level.arcademode_ending_hud[level.arcademode_ending_hud.size] = var_25;
        var_25._id_0530 = 0;
        var_25._id_0538 = var_10;
        var_25._id_03D4 = level.arcademode_hud_sort + 10;
        var_25.alignx = "left";
        var_25.aligny = "middle";
        var_25._id_01F3 = "fullscreen";
        var_25._id_0501 = "middle";
        var_25._id_0189 = 1.875;
        var_25.alpha = 0;
        var_25 _meth_8086( var_4 );
        var_25.alpha = 1;
    }

    hud_draw_score_for_elements_align_left( 0, level.arcademode_hud_mission_scores );
    var_26 = 0;

    for ( var_27 = 0; var_2 >= 60; var_2 -= 60 )
        var_26++;

    var_27 = var_2;
    var_28 = new_ending_hud( "center", var_4, 0, var_12 );
    var_28.alignx = "right";
    var_28._id_01F3 = "fullscreen";
    var_28._id_0189 = 1.7;
    var_28.color = ( 1, 1, 1 );
    var_28 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_28 _meth_80CC( &"SCRIPT_TIME_REMAINING" );
    level._id_0CC4 = [];
    level._id_0CC4[0] = new_ending_hud( "center", var_4, 0, var_11 );
    level._id_0CC4[1] = new_ending_hud( "center", var_4, 0, var_11 );
    level._id_0CC4[2] = new_ending_hud( "center", var_4, 0, var_11 );
    level._id_0CC4[2] _meth_80CC( &"SCRIPT_COLON" );
    level._id_0CC4[3] = new_ending_hud( "center", var_4, 0, var_11 );
    level._id_0CC4[4] = new_ending_hud( "center", var_4, 0, var_11 );

    for ( var_21 = 0; var_21 < 5; var_21++ )
    {
        level._id_0CC4[var_21].alignx = "left";
        level._id_0CC4[var_21]._id_01F3 = "fullscreen";
        level._id_0CC4[var_21]._id_0501 = "middle";
        level._id_0CC4[var_21]._id_0189 = 1.7;
        level._id_0CC4[var_21]._id_0189 = 1.7;
        level._id_0CC4[var_21].color = ( 1, 1, 1 );
        level._id_0CC4[var_21] _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.3, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    }

    ending_set_time( var_26, var_27 );
    level.screen_width = _func_041();
    level.screen_height = _func_042();
    var_17 = 1920.0 / level.screen_width * level.screen_height / 1080.0;
    rescale_ending_huds( var_23, var_24, var_28, var_19, var_16, var_18 );
    thread rescale_ending_huds_thread( var_23, var_24, var_28, var_19, var_16, var_18 );
    wait(var_4);
    wait 1;
    var_29 = getdvarint( "arcadeMode_score" );
    var_30 = 0;
    var_31 = var_22;
    var_32 = 0;

    for (;;)
    {
        var_33 = var_29 - var_30;
        var_34 = var_33 * 0.2 + 1;

        if ( var_33 <= 15 )
            var_34 = 1;

        var_34 = _func_0BC( var_34 );
        var_30 += var_34;

        if ( var_30 > var_29 )
            var_30 = var_29;

        hud_draw_score_for_elements_align_left( var_30, level.arcademode_hud_mission_scores );

        if ( var_30 == var_29 )
            break;

        var_32--;

        if ( var_32 <= 0 )
        {
            level._id_0318 _meth_809C( "h1_arcademode_ending_mission_pts" );
            var_32 = 3;
        }

        wait 0.05;
    }

    wait 1;
    var_35 = 0;
    var_36 = undefined;

    if ( level.arcademode_success )
    {
        var_37 = 5;
        var_38 = var_26 * 60 + var_27;
        var_39 = _func_0E3( var_38 / 15 );
        var_40 = _func_0E3( var_38 * var_37 );
        var_41 = _func_0E3( var_40 / level.arcademode_difficultytimerscale );
        var_42 = var_30;
        var_43 = var_30 + var_41;
        var_44 = var_22;
        var_45 = var_22 + var_41;

        for ( var_21 = 1; var_21 <= var_39; var_21++ )
        {
            var_46 = var_21 * 1.0 / var_39;

            if ( var_21 == var_39 )
                var_46 = 1;

            var_30 = _func_0BC( var_42 * ( 1 - var_46 ) + var_43 * var_46 );

            if ( getdvar( "arcademode_full" ) == "1" )
            {
                var_22 = _func_0BC( var_44 * ( 1 - var_46 ) + var_45 * var_46 );
                set_total_score_hud( var_22 );
            }

            hud_draw_score_for_elements_align_left( var_30, level.arcademode_hud_mission_scores );
            var_47 = _func_0BC( var_38 * ( 1 - var_46 ) );
            ending_set_time( _func_0E2( var_47 / 60 ), var_47 % 60 );
            var_32--;

            if ( var_32 <= 0 )
            {
                level._id_0318 _meth_809C( "h1_arcademode_ending_time_pts" );
                var_32 = 3;
            }

            wait 0.05;
        }

        ending_set_time( 0, 0 );
        wait 1;

        for (;;)
        {
            var_48 = 1;

            if ( var_19 > 10 )
            {
                var_49 = var_19 % 10;

                if ( var_19 - var_49 >= 10 )
                    var_48 = 10;
                else
                    var_48 = var_49;

                if ( var_19 < 20 )
                    var_48 = var_49;
            }

            var_19 -= var_48;

            if ( var_19 < 0 )
                break;

            var_50 = 1000;
            var_50 *= var_48;
            var_34 = _func_0BC( var_50 );

            if ( getdvar( "arcademode_full" ) == "1" )
            {
                var_22 += var_34;
                set_total_score_hud( var_22 );
            }

            var_30 += var_34;
            level._id_0318 _meth_809C( "h1_arcademode_ending_lives_pts" );
            hud_draw_score_for_elements_align_left( _func_0BC( var_30 ), level.arcademode_hud_mission_scores );
            arcademode_redraw_lives( var_19 );
            wait 0.6;
        }

        wait 1;

        if ( getdvarint( "arcademode_died" ) != 1 && level._id_3BFE >= 2 )
        {
            var_34 = _func_0BC( var_30 );
            arcademode_end_boost( var_30, var_22, var_34, &"SCRIPT_ZERO_DEATHS", "arcademode_zerodeaths", var_13, var_4, var_17 );
            var_30 += var_34;
            var_22 += var_34;
        }
    }
    else
    {
        for ( var_21 = 0; var_21 < 5; var_21++ )
            level._id_0CC4[var_21] _meth_808B( 0, 0, 1000 );

        var_28 _meth_808B( 0, 0, 1000 );
        arcademode_redraw_lives( 0 );
        wait 2;
    }

    var_51 = level.arcademode_skillmultiplier[level._id_3BFE];

    if ( var_51 > 1 )
    {
        if ( var_51 == 1.5 )
            var_52 = &"SCRIPT_DIFFICULTY_BONUS_ONEANDAHALF";
        else if ( var_51 == 3 )
            var_52 = &"SCRIPT_DIFFICULTY_BONUS_THREE";
        else
            var_52 = &"SCRIPT_DIFFICULTY_BONUS_FOUR";

        var_34 = _func_0BC( _func_0E3( var_30 * var_51 ) - var_30 );
        arcademode_end_boost( var_30, var_22, var_34, var_52, "h1_arcademode_ending_diff_pts", var_13, var_4, var_17 );
        var_30 += var_34;
        var_22 += var_34;
    }

    var_53 = 0;

    if ( getdvar( "arcademode_full" ) == "1" )
    {
        var_54 = "s18";
        var_55 = getdvarint( var_54 );

        if ( var_22 > var_55 )
        {
            var_56 = get_digits_from_score( var_22 );
            var_57 = get_score_string_from_digits( var_56 );
            setdvar( var_54, var_57 );
            var_58 = 0;

            if ( !level.arcademode_success )
                var_58 = 1;

            if ( level._id_038E == "airplane" )
                var_58 = 1;

            if ( var_58 )
                var_53 = 1;
        }

        var_59 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "fullChallengeScore" );

        if ( var_22 > var_59 )
            level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "fullChallengeScore", var_22 );

        level._id_0318 _meth_80F8( "LB_AM_FULLCHALLENGE", getdvarint( var_54 ) );
    }
    else
    {
        var_60 = [];
        var_60["cargoship"] = 0;
        var_60["blackout"] = 1;
        var_60["armada"] = 2;
        var_60["bog_a"] = 3;
        var_60["hunted"] = 4;
        var_60["ac130"] = 5;
        var_60["bog_b"] = 6;
        var_60["airlift"] = 7;
        var_60["village_assault"] = 8;
        var_60["scoutsniper"] = 9;
        var_60["sniperescape"] = 10;
        var_60["village_defend"] = 11;
        var_60["ambush"] = 12;
        var_60["icbm"] = 13;
        var_60["launchfacility_a"] = 14;
        var_60["launchfacility_b"] = 15;
        var_60["jeepride"] = 16;
        var_60["airplane"] = 17;
        var_61 = var_60[level._id_038E];

        if ( isdefined( var_61 ) )
        {
            var_59 = level._id_0318 _meth_8226( common_scripts\utility::getstatsgroup_sp(), "arcadeScore", level._id_038E );

            if ( var_30 > var_59 )
            {
                var_53 = 1;
                level._id_0318 _meth_8243( common_scripts\utility::getstatsgroup_sp(), "arcadeScore", level._id_038E, var_30 );
            }

            level._id_0318 _meth_80F8( "LB_AM_" + level._id_038E, var_30 );
        }
    }

    if ( var_53 )
    {
        if ( !level.arcademode_success )
            updategamerprofile();

        wait 1;
        var_62 = new_ending_hud( "center", var_4, 0, var_13 );
        var_62._id_0189 = 2.25;
        var_62 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.5, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
        var_62 _meth_80CC( &"SCRIPT_NEW_HIGH_SCORE" );
        var_62 _meth_8086( 0.05 );
        var_62.alpha = 1;
        var_62 _meth_808B( 30, 3000, 1000 );
        var_63 = new_ending_hud( "center", var_4, 0, var_13 + 0.5 );
        var_63 _meth_80CE( "h1_arcademode_livesmessage_border", _func_0BC( 313 * var_17 ), 135 );
        var_63._id_03D4 = var_62._id_03D4 - 1;
        var_63 _meth_8086( 0.05 );
        var_63.alpha = 1;
        wait 3.0;
        var_63 _meth_8086( 1.0 );
        var_63.alpha = 0;
        wait 0.5;
    }

    wait 2;
    var_15 _meth_808B( 0, 0, 1000 );
    wait 0.5;
    var_24 _meth_808B( 0, 0, 1000 );

    for ( var_21 = 0; var_21 < level.arcademode_hud_digits; var_21++ )
    {
        var_25 = level.arcademode_hud_mission_scores[var_21];
        var_25 _meth_808B( 0, 0, 1000 );
    }

    if ( getdvar( "arcademode_full" ) == "1" )
    {
        var_23 _meth_808B( 0, 0, 1000 );

        for ( var_21 = 0; var_21 < level.arcademode_hud_digits; var_21++ )
        {
            var_25 = level.arcademode_hud_total_scores[var_21];
            var_25 _meth_808B( 0, 0, 1000 );
        }
    }

    if ( level.arcademode_success )
    {
        wait 0.5;

        for ( var_21 = 0; var_21 < 5; var_21++ )
            level._id_0CC4[var_21] _meth_808B( 0, 0, 1000 );

        var_28 _meth_808B( 0, 0, 1000 );
    }

    wait 1;

    if ( getdvar( "arcademode_full" ) == "1" )
        logstring( "ArcadeMode Score: " + var_30 + ", mission: " + level._id_038E + ", gameskill: " + level._id_3BFE + ", total: " + var_22 );
    else
        logstring( "ArcadeMode Score: " + var_30 + ", mission: " + level._id_038E + ", gameskill: " + level._id_3BFE );

    setdvar( "arcademode_combined_score", var_22 );

    if ( var_22 >= 400000 )
        _id_A5A4::_id_41DD( "ARCADE_ADDICT" );

    if ( !level.arcademode_success )
    {
        setdvar( "ui_arcade_lost", 1 );
        end_mission();
    }
    else
        setdvar( "ui_arcade_lost", 0 );

    for ( var_21 = 0; var_21 < level.arcademode_ending_hud.size; var_21++ )
    {
        if ( isdefined( level.arcademode_ending_hud[var_21] ) )
            level.arcademode_ending_hud[var_21].alpha = 0;
    }

    common_scripts\utility::_id_383F( "arcademode_ending_complete" );
}

arcademode_end_boost( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = new_ending_hud( "center", var_6, 0, var_5 );
    var_8._id_0189 = 2.25;
    var_8 _meth_8347( -0.6, 0, 0, 0, ( 0.247, 0.439, 0.094 ), 0.5, -0.1, 0, ( 0.302, 0.588, 0.047 ), 0.75 );
    var_8 _meth_80CC( var_3 );
    var_8 _meth_8086( 0.05 );
    var_8.alpha = 1;
    var_8 _meth_808B( 30, 10000, 1000 );
    var_9 = new_ending_hud( "center", 0.15, 320, var_5 + 0.5 );
    var_9 _meth_80CE( "h1_arcademode_livesmessage_border", _func_0BC( 330 * var_7 ), 135 );
    var_9._id_01F3 = "fullscreen";
    var_9._id_03D4 = var_8._id_03D4 - 1;
    var_9 _meth_8086( 0.05 );
    var_9.alpha = 1;
    wait 0.05;
    wait 1.0;
    var_10 = 0;
    var_11 = var_0 + var_2;
    var_12 = var_1 + var_2;

    for (;;)
    {
        var_13 = var_11 - var_0;
        var_2 = var_13 * 0.2 + 1;

        if ( var_13 <= 15 )
            var_2 = 1;

        var_2 = _func_0BC( var_2 );
        var_0 += var_2;

        if ( var_0 > var_11 )
            var_0 = var_11;

        hud_draw_score_for_elements_align_left( var_0, level.arcademode_hud_mission_scores );

        if ( getdvar( "arcademode_full" ) == "1" )
        {
            var_1 += var_2;

            if ( var_1 > var_12 )
                var_1 = var_12;

            set_total_score_hud( var_1 );
        }

        if ( var_0 == var_11 )
            break;

        var_10--;

        if ( var_10 <= 0 )
        {
            level._id_0318 _meth_809C( var_4 );
            var_10 = 3;
        }

        wait 0.05;
    }

    wait 0.5;
    var_8 _meth_808B( 0, 10, 1000 );
    var_9 _meth_8086( 1.0 );
    var_9.alpha = 0;
    wait 1.0;
}

black_background( var_0 )
{
    var_1 = _func_1A9();
    var_1._id_0198 = 1;
    var_1._id_0530 = 0;
    var_1._id_0538 = 0;
    var_1 _meth_80CE( "black", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1._id_01F3 = "fullscreen";
    var_1._id_0501 = "fullscreen";
    var_1._id_03D4 = level.arcademode_hud_sort + 5;
    var_1.alpha = 0;

    if ( var_0 > 0 )
        var_1 _meth_8086( var_0 );

    var_1.alpha = 1;
}

player_invul_forever()
{
    for (;;)
    {
        level._id_0318 _meth_80F1();
        level._id_0318._id_010A = 70000;
        level._id_0318._id_01FF = 1;
        var_0 = _func_0DA( "all", "all" );
        common_scripts\utility::_id_0D13( var_0, _id_A5A4::_id_7E5E, 1 );
        wait 0.05;
    }
}

ending_set_time( var_0, var_1 )
{
    var_2 = 0;

    for ( var_3 = 0; var_0 >= 10; var_0 -= 10 )
        var_2++;

    while ( var_1 >= 10 )
    {
        var_3++;
        var_1 -= 10;
    }

    level._id_0CC4[4] _meth_80D9( var_1 );
    level._id_0CC4[3] _meth_80D9( var_3 );
    level._id_0CC4[1] _meth_80D9( var_0 );
    level._id_0CC4[0] _meth_80D9( var_2 );
}

draw_checkpoint( var_0, var_1, var_2 )
{
    var_0 *= var_2;
    var_3 = new_ending_hud( "center", 0.001, var_0, 73.3333 );
    var_3._id_0501 = "top_adjustable";
    var_3._id_0189 = 2.5;
    var_3.color = ( 1, 1, 1 );
    var_3._id_0188 = "objective";
    var_3 _meth_8347( -0.1, 0, 0, -0.001, ( 0, 0, 0 ), 0.2, -0.1, 0, ( 0, 0, 0 ), 0.5 );
    var_3 _meth_80CC( &"SCRIPT_CHECKPOINT" );
    var_3.alpha = 0;
    wait 0.15;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3._id_0189 = 3.5;
    wait 0.05;
    var_3._id_0189 = 2.5;
    wait 0.05;
    wait 1.0;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_808A();
}

draw_checkpoint_scanlines( var_0, var_1, var_2 )
{
    var_0 *= var_2;
    var_3 = new_ending_hud( "center", 0.1, var_0, 73.3333 );
    var_3._id_0501 = "top_adjustable";
    var_3 _meth_80CE( "h1_arcademode_scanelines_border", 384, 48 );
    var_3._id_03D4 -= 2;
    var_3.alpha = 0.25;
    var_3.alpha = 0;
    wait 0.15;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    wait 0.05;
    wait 0.05;
    wait 1.0;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 1;
    wait 0.05;
    var_3 _meth_8086( 0.05 );
    var_3.alpha = 0;
    wait 0.05;
    var_3 _meth_808A();
}

draw_checkpoint_flare()
{
    var_0 = new_ending_hud( "center", 0.001, 0, 73.3333 );
    var_0._id_0501 = "top_adjustable";
    var_0 _meth_80CE( "h1_arcademode_checkpoint_flare", 326, 23 );
    var_0._id_03D4 = level.arcademode_hud_sort + 10 - 1;
    var_0.alpha = 0;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 1;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 0;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 1;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 0;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 1;
    wait 0.05;
    var_0 _meth_8086( 0.05 );
    var_0.alpha = 0;
    wait 0.05;
    var_0 _meth_808A();
}

arcademode_checkpoint_getid( var_0 )
{
    for ( var_1 = 0; var_1 < level.arcademode_checkpoint_dvars.size; var_1++ )
    {
        if ( level.arcademode_checkpoint_dvars[var_1] == var_0 )
            return var_1;
    }

    return undefined;
}

arcademode_init_kill_streak_colors()
{
    level.arcademode_streak_color = [];
    level.arcademode_streak_glow = [];
    level.arcademode_streak_color[level.arcademode_streak_color.size] = level.color_cool_green;
    level.arcademode_streak_color[level.arcademode_streak_color.size] = ( 0.678431, 0.976471, 0.768627 );
    level.arcademode_streak_color[level.arcademode_streak_color.size] = ( 0.658824, 0.964706, 0.619608 );
    level.arcademode_streak_color[level.arcademode_streak_color.size] = ( 1, 0.976471, 0.317647 );
    level.arcademode_streak_color[level.arcademode_streak_color.size] = ( 0.988235, 0.866667, 0.301961 );
    level.arcademode_streak_color[level.arcademode_streak_color.size] = ( 0.988235, 0.831373, 0.376471 );
    level.arcademode_streak_color[level.arcademode_streak_color.size] = ( 0.988235, 0.792157, 0.223529 );
    level.arcademode_streak_color[level.arcademode_streak_color.size] = ( 0.984314, 0.72549, 0.152941 );

    for ( var_0 = 0; var_0 < level.arcademode_streak_color.size; var_0++ )
        level.arcademode_streak_glow[var_0] = ( level.arcademode_streak_color[var_0][0] * 0.35, level.arcademode_streak_color[var_0][1] * 0.35, level.arcademode_streak_color[var_0][2] * 0.35 );

    level.arcademode_streak_color[0] = level.color_cool_green_glow;
}

arcademode_killstreak_complete_display()
{
    if ( level.arcademode_kill_streak_current_multiplier == 1 )
        return;

    if ( common_scripts\utility::_id_382E( "arcademode_complete" ) )
        return;

    var_0 = new_ending_hud( "right", 0.2, -21.6667, 80.0 );
    var_0.aligny = "top";
    var_0._id_0501 = "top";
    var_0._id_01BC = 0;
    var_0 _meth_808B( 5, 3000, 1000 );
    var_0._id_0189 = 0.75;
    var_1 = level.arcademode_kill_streak_current_multiplier - 1;
    var_1 = _func_0BC( _func_0E9( var_1, 1, 7 ) );
    var_0.color = level.arcademode_streak_color[var_1];

    if ( level.arcademode_kill_streak_current_multiplier >= 8 )
    {
        level._id_0318 thread common_scripts\utility::_id_69C2( "arcademode_kill_streak_won", level._id_0318 _meth_80AA() );
        var_0 _meth_80CC( &"SCRIPT_STREAK_COMPLETE" );
    }
    else
    {
        level._id_0318 thread common_scripts\utility::_id_69C2( "arcademode_kill_streak_lost", level._id_0318 _meth_80AA() );
        var_0 _meth_80CC( &"SCRIPT_STREAK_BONUS_LOST" );
    }

    wait 5;
    var_0 _meth_808A();
}

arcademode_reset_kill_streak_art()
{
    if ( isdefined( level.arcademode_streak_hud ) )
    {
        level.arcademode_streak_hud _meth_808A();
        level.arcademode_streak_hud = undefined;
        level.arcademode_streak_hud_shadow _meth_808A();
    }

    level notify( "arcademode_stop_kill_streak_art" );

    for ( var_0 = 0; var_0 < level.arcademode_kills_hud.size; var_0++ )
        level.arcademode_kills_hud[var_0] _meth_808A();

    level.arcademode_kills_hud = [];
}

arcademode_reset_kill_streak()
{
    level.arcademode_new_kill_streak_allowed = 1;
    thread arcademode_killstreak_complete_display();
    level notify( "arcademode_stop_kill_streak" );
    arcademode_reset_kill_streak_art();
    common_scripts\utility::_id_3831( "arcadeMode_multiplier_maxed" );
    level.arcademode_kill_streak_current_count = level.arcademode_kill_streak_multiplier_count;
    level.arcademode_kill_streak_current_multiplier = 1;
}

get_hud_multi()
{
    var_0 = 0.1;
    var_1 = _func_1A9();
    var_1.alignx = "right";
    var_1.aligny = "top";
    var_1._id_01F3 = "right";
    var_1._id_0501 = "top";
    var_1 thread arcademode_draw_multiplier_kill();
    var_1._id_0530 = 0;
    var_1._id_0538 = 76.3333;
    var_1._id_0188 = "objective";
    var_1._id_0189 = 2.25;
    var_1.archived = 0;
    var_1._id_0198 = 1;
    var_1._id_01ED = 1;
    var_1.color = level.arcademode_streak_color[level.arcademode_kill_streak_current_multiplier - 1];
    var_1 _meth_8347( -0.1, 0, 0, -0.001, ( 0, 0, 0 ), 0.5, -0.1, 0, ( 0, 0, 0 ), 0.75 );
    var_1._id_03D4 = level.arcademode_hud_sort;
    var_1._id_0241 = &"SCRIPT_X";
    var_1 _meth_80D9( level.arcademode_kill_streak_current_multiplier );
    var_1 _meth_8088( var_0 );
    var_1._id_0530 = -21.6667;
    var_1.alpha = 0.25;
    var_1 _meth_8086( var_0 );
    var_1.alpha = 1.0;
    return var_1;
}

get_hud_multi_emphasis()
{
    var_0 = _func_1A9();
    var_0.alignx = "right";
    var_0.aligny = "middle";
    var_0._id_01F3 = "right";
    var_0._id_0501 = "top";
    var_0._id_0530 = -21.6667;
    var_0._id_0538 = 89.3333;
    var_0._id_0188 = "objective";
    var_0._id_0189 = 2.25;
    var_0.archived = 0;
    var_0._id_0198 = 1;
    var_0._id_01ED = 1;
    var_0.color = level.arcademode_streak_color[level.arcademode_kill_streak_current_multiplier - 1];
    var_0 _meth_8347( -0.6, 0, 0, 0, ( 0, 0, 0 ), 0.0, -0.6, 0, var_0.color, 1.0 );
    var_0._id_03D4 = level.arcademode_hud_sort;
    var_0._id_0241 = &"SCRIPT_X";
    var_0 _meth_80D9( level.arcademode_kill_streak_current_multiplier );
    var_0.alpha = 0.0;
    var_1 = 2;
    var_2 = _func_1A9();
    var_2.alignx = "right";
    var_2.aligny = "top";
    var_2._id_01F3 = "right";
    var_2._id_0501 = "top";
    var_2 thread arcademode_draw_multiplier_kill();
    var_2 _meth_80CE( "h1_arcademode_numberstreak_circles", 22 * var_1, 27 * var_1 );
    var_2._id_0530 = 38;
    var_2._id_0538 = 72.3333;
    var_2.archived = 0;
    var_2._id_0198 = 1;
    var_2._id_01ED = 1;
    var_2.color = level.arcademode_streak_color[level.arcademode_kill_streak_current_multiplier - 1];
    var_2._id_03D4 = level.arcademode_hud_sort - 1;
    var_3 = _func_1A9();
    var_3.alignx = "right";
    var_3.aligny = "top";
    var_3._id_01F3 = "right";
    var_3._id_0501 = "top";
    var_3 thread arcademode_draw_multiplier_kill();
    var_3 _meth_80CE( "h1_arcademode_numberstreak_glow", 64, 64 );
    var_3._id_0530 = 0.833332;
    var_3._id_0538 = 60.3333;
    var_3.archived = 0;
    var_3._id_0198 = 1;
    var_3._id_01ED = 1;
    var_3.color = level.arcademode_streak_color[level.arcademode_kill_streak_current_multiplier - 1];
    var_3._id_03D4 = level.arcademode_hud_sort - 1;
    var_4 = 0.2;
    var_2.alpha = 1;
    var_2 _meth_8087( 0.4, 27 * var_1, 27 * var_1 );
    var_3.alpha = 0;
    var_3 _meth_8086( 0.4 );
    var_5 = 0.1;
    var_2 _meth_8088( var_5 );
    var_2._id_0530 = -20.6667;
    wait(var_5);

    if ( isdefined( var_0 ) )
    {
        var_6 = 0.4;
        var_7 = 10.0;
        var_0 _meth_808D( var_6 );
        var_0._id_0189 = var_7;
        wait 0.05;
        var_8 = 0.35;
        var_0.alpha = var_8;
        wait 0.05;
        var_0 _meth_8086( var_6 );
        var_0.alpha = 0;
    }

    if ( isdefined( var_2 ) )
    {
        var_2 _meth_8086( 0.2 );
        var_2.alpha = 0;
        var_9 = 0.15;
        wait(var_9);
        var_2 _meth_8087( 0.2, 32 * var_1, 27 * var_1 );
        wait(0.35 - var_9);
    }

    if ( isdefined( var_3 ) )
    {
        var_3 _meth_8086( 0.2 );
        var_3.alpha = 0;
    }

    wait 0.4;

    if ( isdefined( var_0 ) )
        var_0 _meth_808A();

    if ( isdefined( var_2 ) )
        var_2 _meth_808A();

    if ( isdefined( var_3 ) )
        var_3 _meth_808A();
}

arcademode_draw_multiplier()
{
    level endon( "arcademode_new_kill_streak" );
    var_0 = get_hud_multi();
    thread get_hud_multi_emphasis();
    level.arcademode_hud_streak = var_0;
    level waittill( "arcademode_stop_kill_streak" );
    var_0 _meth_808B( 0, 0, 1000 );
    wait 1;
    var_0 _meth_808A();
    level.arcademode_hud_streak = undefined;
}

arcademode_draw_mult_sizzle()
{
    level endon( "arcademode_new_kill_streak" );
    wait 0.05;
    var_0 = 500;
    self _meth_8088( 2 );
    self._id_0530 += _func_0B4( var_0 * -1, var_0 );
    self._id_0538 += _func_0B4( var_0 * -1, var_0 );
    wait 0.5;
    self _meth_8086( 1 );
    self.alpha = 0;
    wait 1;
    self _meth_808A();
}

arcademode_draw_multiplier_kill()
{
    self endon( "death" );
    level waittill( "arcademode_new_kill_streak" );
    self _meth_808A();
}

get_score_string_from_digits( var_0 )
{
    var_1 = "";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1 = var_0[var_2] + var_1;

    return var_1;
}

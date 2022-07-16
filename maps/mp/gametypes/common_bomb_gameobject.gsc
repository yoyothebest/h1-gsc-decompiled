// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_64DA()
{
    game["bomb_grabbed_sound"] = "mp_suitcase_pickup";
    game["bomb_dropped_sound"] = "h1_mp_war_objective_lost";
    game["bomb_dropped_enemy_sound"] = "h1_mp_war_objective_taken";
    game["bomb_recovered_sound"] = "h1_mp_war_objective_taken";
    game["bomb_planted_sound"] = "mp_obj_notify_pos_med";
    game["bomb_planted_enemy_sound"] = "mp_obj_notify_neg_med";
    game["bomb_disarm_sound"] = "mp_obj_notify_pos_lrg";
    game["bomb_disarm_enemy_sound"] = "mp_obj_notify_neg_lrg";
}

loadbombfx()
{
    level._id_058F["bomb_explosion"] = loadfx( "vfx/explosion/mp_gametype_bomb" );
}

getcarrybombvisuals( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
    {
        var_1 _meth_80B3( "wpn_h1_briefcase_bomb_npc" );
        return [ var_1 ];
    }

    return undefined;
}

createbombcarryobject( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\mp\gametypes\_gameobjects::_id_23E9( var_0, var_2, var_3, ( 0, 0, 32 ) );
    var_4 maps\mp\gametypes\_gameobjects::_id_0AA1( var_1 );
    var_4 maps\mp\gametypes\_gameobjects::_id_8352( var_1 );

    if ( var_1 == "friendly" || var_1 == "any" )
    {
        var_4 maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", "waypoint_bomb" );
        var_4 maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", "waypoint_bomb" );
    }

    if ( var_1 == "enemy" || var_1 == "any" )
    {
        var_4 maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", "waypoint_bomb" );
        var_4 maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", "waypoint_bomb" );
    }

    var_4._id_0AB5 = 1;
    var_4._id_1AFB = ::canusebomb;

    foreach ( var_6 in var_3 )
        var_6 _meth_82BB();

    return var_4;
}

canusebomb( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 maps\mp\_utility::_id_5131() )
        return 0;

    return 1;
}

oncarrybombpickup( var_0, var_1 )
{
    level notify( "bomb_picked_up" );
    var_0._id_50C8 = 1;

    if ( _func_1AD( var_0 ) )
    {
        var_0 thread maps\mp\_matchdata::_id_5827( "pickup", var_0._id_02E2 );
        var_0 _meth_82F8( "ui_carrying_bomb", 1 );
    }

    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", "waypoint_escort" );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", "waypoint_escort" );

    if ( isdefined( var_1 ) )
        maps\mp\_utility::_id_6DDD( game["bomb_recovered_sound"], var_1 );
    else
        maps\mp\_utility::_id_6DDD( game["bomb_recovered_sound"] );

    var_0 _meth_82F1( game["bomb_grabbed_sound"] );
}

oncarrybombdrop( var_0, var_1 )
{
    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", "waypoint_bomb" );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", "waypoint_bomb" );
    maps\mp\_utility::_id_6DDD( game["bomb_dropped_sound"], var_0 );
}

createbombzoneobject( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = getentarray( var_3._id_04A4, "targetname" );
    var_7 = maps\mp\gametypes\_gameobjects::_id_244C( var_0, var_3, var_6, ( 0, 0, 64 ) );
    var_7._id_0241 = var_7 maps\mp\gametypes\_gameobjects::_id_3FFA();
    var_7 resetbombzone( var_4, var_1, var_2, var_5 );
    var_7._id_6242 = 1;
    var_7._id_4B53 = "bombZone";

    for ( var_8 = 0; var_8 < var_6.size; var_8++ )
    {
        if ( isdefined( var_6[var_8]._id_79BF ) )
        {
            var_7._id_353B = var_6[var_8]._id_79BF;
            var_6[var_8] thread _id_831E( var_7 );
            break;
        }
    }

    return var_7;
}

resetbombzone( var_0, var_1, var_2, var_3 )
{
    maps\mp\gametypes\_gameobjects::_id_0AB2( var_1 );
    maps\mp\gametypes\_gameobjects::_id_8352( var_2 );
    maps\mp\gametypes\_gameobjects::_id_834C( level._id_688D );
    maps\mp\gametypes\_gameobjects::_id_834A( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::_id_7F99( var_0 );
    var_4 = "waypoint_defend";
    var_5 = "waypoint_target";

    if ( var_1 == "any" )
    {
        var_4 = "waypoint_target";
        var_5 = "waypoint_target";
    }

    if ( var_3 )
    {
        var_4 += self._id_0241;
        var_5 += self._id_0241;
    }

    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", var_4 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", var_4 );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", var_5 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", var_5 );
    self._id_9C1C = "briefcase_bomb_mp";
    self.cantuseweapon = "briefcase_bomb_defuse_mp";
    self.bombplantedon = 0;
}

_id_831E( var_0 )
{
    var_1 = spawn( "script_origin", self._id_02E2 );
    var_1.angles = self.angles;
    var_1 _meth_82B3( -45, 0.05 );
    wait 0.05;
    var_2 = self._id_02E2 + ( 0, 0, 5 );
    var_3 = self._id_02E2 + anglestoforward( var_1.angles ) * 100 + ( 0, 0, 128 );
    var_4 = _func_06B( var_2, var_3, 0, self );
    self._id_534D = spawn( "script_model", var_4["position"] );
    self._id_534D _meth_834B( "explosive" );
    var_0._id_534E = self._id_534D _meth_81B5();
    var_1 delete();
}

setupzonefordefusing( var_0 )
{
    var_1 = "waypoint_defuse";
    var_2 = "waypoint_defend";

    if ( var_0 )
    {
        var_1 += self._id_0241;
        var_2 += self._id_0241;
    }

    maps\mp\gametypes\_gameobjects::_id_0AB2( "friendly" );
    maps\mp\gametypes\_gameobjects::_id_834C( level._id_27BF );
    maps\mp\gametypes\_gameobjects::_id_834A( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    maps\mp\gametypes\_gameobjects::_id_7F99( undefined );
    maps\mp\gametypes\_gameobjects::_id_7F12( "friendly", var_1 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "friendly", var_1 );
    maps\mp\gametypes\_gameobjects::_id_7F12( "enemy", var_2 );
    maps\mp\gametypes\_gameobjects::_id_7F13( "enemy", var_2 );
    maps\mp\gametypes\_gameobjects::_id_8352( "any" );
    self._id_9C1C = "briefcase_bomb_defuse_mp";
    self.cantuseweapon = "briefcase_bomb_mp";
}

onbeginplantbomb( var_0 )
{
    var_0 _meth_8132( 0 );

    if ( !level._id_8572 )
    {
        var_0 maps\mp\_utility::_id_6205( "plant" );
        var_0 _meth_809C( "mp_snd_bomb_arming" );
        level thread _id_6979( var_0 );
    }

    var_0._id_5174 = 1;
}

onbegindefusebomb( var_0, var_1 )
{
    var_0 _meth_8132( 0 );

    if ( !level._id_8572 )
    {
        var_0 maps\mp\_utility::_id_6205( "defuse" );
        var_0 _meth_809C( "mp_snd_bomb_disarming" );
        level thread _id_6979( var_0 );
    }

    var_0._id_50EF = 1;

    if ( isdefined( var_1 ) )
    {
        var_1 _meth_8056();
        self.hiddenmodel = var_1;
    }
}

_id_6979( var_0 )
{
    var_1 = common_scripts\utility::_id_0CF6( level._id_0323, var_0 );

    if ( var_1.size )
        var_0 maps\mp\_utility::_id_6DC5( "snd_bomb_button_press_lp", undefined, var_1 );
}

_id_8EA2( var_0 )
{
    var_0 common_scripts\utility::_id_8EA1( "snd_bomb_button_press_lp" );
}

onendusebomb( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0 _meth_8132( 1 );

    if ( _func_1A1( var_0 ) )
    {
        var_0._id_50EF = 0;
        var_0._id_5174 = 0;
    }

    level thread _id_8EA2( var_0 );
    var_0 _meth_854D( "weap_suitcase_raise_plr" );

    if ( var_1 && isdefined( self.hiddenmodel ) )
    {
        self.hiddenmodel _meth_8055();
        self.hiddenmodel = undefined;
    }
}

onplayerplantbomb( var_0, var_1, var_2 )
{
    self notify( "bomb_planted" );
    thread maps\mp\_events::_id_1548();
    self._id_1547 = gettime();

    if ( _func_1AD( self ) && var_0 )
    {
        self._id_50C8 = 0;
        self _meth_82F8( "ui_carrying_bomb", 0 );
    }

    self _meth_809C( "mp_bomb_plant" );
    maps\mp\_utility::_id_6DDD( game["bomb_planted_sound"], var_1 );
    maps\mp\_utility::_id_6DDD( game["bomb_planted_enemy_sound"], var_2 );
    maps\mp\_utility::_id_564B( "bomb_planted" );
    level._id_1544 = self;
}

onbombplanted( var_0 )
{
    level notify( "bomb_planted", self );
    self.bombplantedon = 1;
    level._id_9366 = 1;
    maps\mp\gametypes\_gamelogic::_id_6727();
    level.timepausestart = gettime();
    maps\mp\_utility::_id_6DDC( "mp_snd_bomb_planted", var_0 );
    self._id_9345 = self._id_9E9C[0];
    self._id_9345 thread _id_6DE5();
}

_id_6DE5()
{
    self endon( "death" );
    self endon( "stop_ticking" );
    level endon( "game_ended" );
    var_0 = level._id_1551;

    for (;;)
    {
        self _meth_809C( "ui_mp_suitcasebomb_timer" );

        if ( var_0 > 10 )
        {
            var_0 -= 1;
            wait 1;
        }
        else if ( var_0 > 4 )
        {
            var_0 -= 0.5;
            wait 0.5;
        }
        else if ( var_0 > 1 )
        {
            var_0 -= 0.4;
            wait 0.4;
        }
        else
        {
            var_0 -= 0.3;
            wait 0.3;
        }

        maps\mp\gametypes\_hostmigration::_id_A0DD();
    }
}

_id_8F06()
{
    self notify( "stop_ticking" );
}

onplayerdefusebomb( var_0, var_1, var_2 )
{
    self notify( "bomb_defused" );
    thread maps\mp\_events::_id_1537( var_0 );
    maps\mp\_utility::_id_6DDD( game["bomb_disarm_sound"], var_1 );
    maps\mp\_utility::_id_6DDD( game["bomb_disarm_enemy_sound"], var_2 );
    maps\mp\_utility::_id_564B( "bomb_defused" );
    level._id_1544 = undefined;
}

onbombexploded( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
    {
        self._id_9E9C[0] _meth_81D8( var_0, 512, var_1, 20, var_2, "MOD_EXPLOSIVE", "bomb_site_mp" );
        var_2 thread maps\mp\_events::_id_1539();
    }
    else
        self._id_9E9C[0] _meth_81D8( var_0, 512, var_1, 20, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );

    var_3 = "bomb_explosion";

    if ( isdefined( self._id_04C5._id_3018 ) )
        var_3 = self._id_04C5._id_3018;

    var_4 = _func_0B3( 360 );
    var_5 = var_0 + ( 0, 0, 50 );
    var_6 = spawnfx( level._id_058F[var_3], var_5 + ( 0, 0, 50 ), ( 0, 0, 1 ), ( _func_0B7( var_4 ), _func_0B6( var_4 ), 0 ) );
    triggerfx( var_6 );
    _func_17E( var_5, 200, 100, 3 );
    _func_1C7( "grenade_rumble", var_0 );
    _func_18C( 0.75, 2.0, var_0, 2000 );
    thread maps\mp\_utility::_id_6DDC( "h1_briefcase_exp_mid", var_0 );

    if ( isdefined( self._id_353B ) )
        common_scripts\_exploder::_id_3528( self._id_353B );
}

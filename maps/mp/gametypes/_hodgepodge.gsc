// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    setdvarifuninitialized( "scr_game_hodgepodgeMode", 0 );
    setdvarifuninitialized( "scr_game_pumpking", 0 );

    if ( maps\mp\_utility::_id_4FA6() )
    {
        level.hodgepodgemode = 0;
        return;
    }

    level.hodgepodgemode = getdvarint( "scr_game_hodgepodgeMode", 0 );
    level.madpropsmode = getdvarint( "scr_game_madprops", 0 );

    if ( level.hodgepodgemode == 0 )
        return;

    if ( level.hodgepodgemode == 2 || level.hodgepodgemode == 6 || level.hodgepodgemode == 7 )
        level.oldschool = 0;

    if ( level.hodgepodgemode == 9 )
    {
        level.oldschool = 0;
        level._id_64EC = ::_id_148E;
    }

    level.hodgepodgeonstartgametype = level._id_64EC;
    level._id_64EC = ::hodgepodgeonstartgametype;
    level thread hodgepodgeonconnect();
}

_id_148E()
{

}

hodgepodgeonstartgametype()
{
    [[ level.hodgepodgeonstartgametype ]]();

    if ( level.hodgepodgemode == 2 )
        initmmmode();
    else if ( level.hodgepodgemode == 4 )
        initsnipersonly();
    else if ( level.hodgepodgemode == 6 )
    {
        level.rpgonlyreload = 1;
        initrpgonly();
    }
    else if ( level.hodgepodgemode == 7 )
    {
        level.rpgonlyreload = 0;
        initrpgonly();
    }
    else if ( level.hodgepodgemode == 9 )
        initprophunt();
}

hodgepodgeonconnect()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( level.hodgepodgemode == 9 )
            var_0 thread maps\mp\gametypes\_hodgepodge_ph::onconnect();

        if ( level.hodgepodgemode == 3 )
            var_0 thread watchapplyloadout( ::giveprimaryonly );

        if ( level.hodgepodgemode == 4 )
        {
            var_0 thread watchapplyloadout( ::giveprimaryonlynomelee );
            var_0 thread killrangeindicator();
        }
    }
}

initmmmode()
{
    level._id_6466 = ::_id_6466;
    level._id_19FE = ::mmcallbackplayerdamage;
    level._id_64D3 = ::onmmplayerkilled;
    level._id_64E9 = ::onmmspawnplayer;
    level._id_112A = ::mmautoassign;
    level._id_1969 = ::mmclass;
    level._id_40D2 = ::getmmspawnpoint;
    level._id_64C0 = ::mmononeleftevent;
    level._id_2D73 = 1;
    level._id_2B11 = 1;
    level._id_14B5 = 1;
    level.bot_ignore_personality = 1;
    level.mm_allowsuicide = 0;
    level.mm_choseslasher = 0;
    level.mm_choosingslasher = 0;
    level.mm_countdowninprogress = 0;
    common_scripts\utility::_id_383D( "slasher_chosen" );
    level.mm_teamscores["axis"] = 0;
    level.mm_teamscores["allies"] = 0;
    _id_9B85();
    level._id_8A4A["allies"]._id_0AA7 = 1;
    level._id_0AAB = 0;
    setupdvarsmm();
    _id_8018();
    _func_161( "auto_change" );
    var_0 = &"OBJECTIVES_MM";
    maps\mp\_utility::_id_7FC5( "allies", var_0 );
    maps\mp\_utility::_id_7FC5( "axis", var_0 );

    if ( level._id_8A7C )
    {
        maps\mp\_utility::_id_7FC4( "allies", var_0 );
        maps\mp\_utility::_id_7FC4( "axis", var_0 );
    }
    else
    {
        maps\mp\_utility::_id_7FC4( "allies", var_0 );
        maps\mp\_utility::_id_7FC4( "axis", var_0 );
    }

    maps\mp\_utility::_id_7FC3( "allies", &"OBJECTIVES_INFECT_HINT" );
    maps\mp\_utility::_id_7FC3( "axis", &"OBJECTIVES_INFECT_HINT" );
    level thread mmawardxp();
    level thread watchhostmigrationmm();
}

setupdvarsmm()
{
    setdynamicdvar( "scr_game_hardpoints", 0 );
    setdynamicdvar( "scr_war_timelimit", 10 );
    setdynamicdvar( "scr_war_numLives", 1 );
    setdynamicdvar( "g_oldschool", 1 );
    setdynamicdvar( "scr_game_mmUavTime", 30 );
}

watchhostmigrationmm()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_begin" );
        setupdvarsmm();
        level waittill( "host_migration_end" );
        setupdvarsmm();
    }
}

_id_6466( var_0 )
{
    return;
}

mmautoassign()
{
    thread maps\mp\gametypes\_menus::_id_8027( "allies" );
    self.slasher_team = "allies";
}

_id_64F0()
{
    level._id_374D = "allies";
    level thread maps\mp\gametypes\_gamelogic::_id_315F( "allies", game["end_reason"]["time_limit_reached"] );
}

mmawardxp()
{
    level endon( "game_ended" );
    level._id_A3A5["kill"]["value"] = 300;
    common_scripts\utility::_id_384A( "slasher_chosen" );

    for (;;)
    {
        maps\mp\gametypes\_hostmigration::_id_A052( 10 );

        foreach ( var_1 in level._id_0323 )
        {
            if ( maps\mp\_utility::_id_5092( var_1.isslasher ) )
                continue;

            if ( !maps\mp\_utility::_id_5189( var_1 ) )
                continue;

            level thread maps\mp\gametypes\_rank::_id_1208( "still_alive", var_1 );
        }
    }
}

onmmspawnplayer()
{
    self _meth_8132( 0 );

    if ( _func_0CF( self ) )
        self _meth_8133( 0 );

    thread switchtostartweapon( self._id_04A7 );
    self _meth_8243( common_scripts\utility::getstatsgroup_common(), "hasEverVisitedDepot", 0 );

    if ( !maps\mp\_utility::_id_5092( level.mm_choseslasher ) )
        maps\mp\_utility::_id_41F8( "specialty_radarimmune", 0 );

    level.mm_teamscores["allies"]++;
    _id_9B85();

    if ( !level.mm_choosingslasher )
    {
        level.mm_choosingslasher = 1;
        level thread chooseslasher();
    }

    thread monitordisconnectmm();

    if ( level.mm_choseslasher )
    {
        if ( level.mm_teamscores["axis"] && level.mm_teamscores["allies"] )
        {
            if ( level.mm_teamscores["allies"] == 1 )
                thread onfinalsurvivordelayed();
        }
    }

    var_0 = self _meth_82CB();

    foreach ( var_2 in var_0 )
        self _meth_82F3( var_2, 0 );

    if ( _func_0CF( self ) )
        thread botmmlogic();
}

onfinalsurvivordelayed()
{
    self endon( "disconnect" );
    waittillframeend;
    _id_64AC();
}

chooseslasher()
{
    level endon( "game_ended" );
    level endon( "mm_stopCountdown" );
    level.mm_allowsuicide = 0;
    maps\mp\_utility::_id_3BE1( "prematch_done" );
    level.mm_countdowninprogress = 1;
    maps\mp\gametypes\_hostmigration::_id_A052( 1.0 );
    var_0 = 15;
    setomnvar( "ui_match_countdown_title", 4 );
    setomnvar( "ui_match_countdown_toggle", 1 );

    while ( var_0 > 0 && !level._id_3BDA )
    {
        var_0--;
        setomnvar( "ui_match_countdown", var_0 + 1 );
        maps\mp\gametypes\_hostmigration::_id_A052( 1.0 );
    }

    setomnvar( "ui_match_countdown", 1 );
    setomnvar( "ui_match_countdown_title", 0 );
    setomnvar( "ui_match_countdown_toggle", 0 );
    level.mm_countdowninprogress = 0;
    var_1 = [];
    var_2 = undefined;

    foreach ( var_4 in level._id_0323 )
    {
        if ( maps\mp\_utility::_id_59E3() && level._id_0323.size > 1 && var_4 _meth_8298() )
        {
            var_2 = var_4;
            continue;
        }

        if ( !maps\mp\_utility::_id_5189( var_4 ) )
            continue;

        if ( var_4._id_04A7 == "axis" )
            continue;

        if ( !var_4._id_4745 )
            continue;

        var_1[var_1.size] = var_4;
    }

    if ( !var_1.size && isdefined( var_2 ) )
        var_1[var_1.size] = var_2;

    level.slasher = var_1[_func_0B2( var_1.size )];
    level.slasher setasslasher();

    foreach ( var_4 in level._id_0323 )
    {
        if ( maps\mp\_utility::_id_5092( var_4.isslasher ) )
            continue;

        var_4.issurvivor = 1;
        var_4.isslasher = 0;
        var_4 maps\mp\_utility::_id_056B();
    }

    level._id_3BE2 = 1;
    common_scripts\utility::_id_383F( "slasher_chosen" );
    _func_268( 1 );
    var_9 = getaliveplayersonteam( "allies" );

    if ( var_9.size <= 0 )
        level thread maps\mp\gametypes\_gamelogic::_id_315F( "axis", game["end_reason"]["allies_eliminated"] );

    if ( level.mm_teamscores["axis"] && level.mm_teamscores["allies"] )
    {
        if ( level.mm_teamscores["allies"] == 1 )
            thread onfinalsurvivordelayed();
    }
}

switchtostartweapon( var_0 )
{
    var_1 = maps\mp\gametypes\_class::_id_188C( "h1_meleeshovel" );

    if ( var_0 == "allies" )
        var_1 = maps\mp\gametypes\_class::_id_188C( "h1_colt45" );

    waitframe;
    self _meth_830D();
    self _meth_830B( var_1 );
    self _meth_824B( var_1 );
    self _meth_8312( var_1 );
    self _meth_82F4( var_1, 0 );
    self _meth_82F3( var_1, 8 );
}

setasslasher()
{
    self endon( "disconnect" );
    _id_6F1B();
    self.mm_isbeingchosen = 1;
    maps\mp\gametypes\_menus::_id_0851( "axis", undefined, 1 );
    self.slasher_team = "axis";
    level.mm_choseslasher = 1;
    self.mm_isbeingchosen = undefined;
    level notify( "update_game_time" );
    level.mm_teamscores["axis"] = 1;
    level.mm_teamscores["allies"]--;
    _id_9B85();
    level.mm_allowsuicide = 1;
    slashersettings();
    thread slashermovespeedscale();
}

slashersettings()
{
    self.isslasher = 1;
    self.issurvivor = 0;
    self notify( "faux_spawn" );
    self._id_0308["gamemodeLoadout"] = level.mm_loadouts["axis"];
    maps\mp\gametypes\_class::_id_41E0( "axis", "gamemode" );
    thread switchtostartweapon( "axis" );
    self _meth_8132( 1 );

    if ( _func_0CF( self ) )
        self _meth_8133( 1 );

    thread slashermovespeedscale();
}

onslasherdamage( var_0 )
{
    self.slowmovetime = _func_0E9( self.slowmovetime + 2500, gettime() + 2500, gettime() + 8000 );
}

slashermovespeedscale()
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = 1.1;
    var_1 = 0.25;
    self.slowmovetime = 0;

    for (;;)
    {
        if ( self.slowmovetime > gettime() )
        {
            self.slashermovespeedscale = var_1;
            self _meth_8301( 0 );
        }
        else
        {
            self.slashermovespeedscale = var_0;
            self _meth_8301( 1 );
        }

        self _meth_81E4( self.slashermovespeedscale );
        waittillframeend;
    }
}

slasherdouav()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "slasherDoUav" );
    level endon( "slasherDoUav" );
    level.radarviewtime = 4;
    var_0 = getdvarfloat( "scr_game_mmUavTime", 30 );

    for (;;)
    {
        maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
        maps\mp\gametypes\_hardpoints::useradaritem();
    }
}

_id_6F1B()
{
    while ( !maps\mp\_utility::_id_5189( self ) || maps\mp\_utility::_id_51E3() )
        wait 0.05;

    if ( isdefined( self._id_50DA ) && self._id_50DA == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self _meth_8130() )
        wait 0.05;

    while ( self _meth_82DD() )
        wait 0.05;

    while ( !self _meth_833E() && !self _meth_801A() )
        wait 0.05;

    if ( maps\mp\_utility::_id_5131() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    wait 0.05;

    while ( !maps\mp\_utility::_id_5189( self ) )
        wait 0.05;
}

getaliveplayersonteam( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_0323 )
    {
        if ( isdefined( var_3 ) && _func_1A1( var_3 ) && ( !isdefined( var_3._id_03BC ) || var_3._id_03BC == "playing" ) )
        {
            if ( !isdefined( var_0 ) || var_3._id_04A7 == var_0 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

monitordisconnectmm()
{
    level endon( "game_ended" );
    self endon( "eliminated" );
    self notify( "mm_monitor_disconnect" );
    self endon( "mm_monitor_disconnect" );
    self waittill( "disconnect" );
    var_0 = self.slasher_team;
    var_1 = getaliveplayersonteam( var_0 );
    level.mm_teamscores[var_0] = var_1.size;
    _id_9B85();

    if ( isdefined( self.mm_isbeingchosen ) || level.mm_choseslasher )
    {
        if ( level.mm_teamscores["axis"] && level.mm_teamscores["allies"] )
        {
            if ( var_0 == "allies" && level.mm_teamscores["allies"] == 1 )
                _id_64AC();
            else if ( var_0 == "axis" && level.mm_teamscores["axis"] == 1 )
            {
                foreach ( var_3 in level._id_0323 )
                {
                    if ( var_3 != self && var_3._id_04A7 == "axis" )
                        var_3 setasslasher();
                }
            }
        }
        else if ( level.mm_teamscores["allies"] == 0 )
            _id_64EE();
        else if ( level.mm_teamscores["axis"] == 0 )
        {
            if ( level.mm_teamscores["allies"] == 1 )
                onslashereliminated();
            else if ( level.mm_teamscores["allies"] > 1 )
            {
                level.mm_choseslasher = 0;
                level thread chooseslasher();
            }
        }
    }
    else if ( level.mm_countdowninprogress && level.mm_teamscores["allies"] == 0 && level.mm_teamscores["axis"] == 0 )
    {
        level notify( "mm_stopCountdown" );
        level.mm_choosingslasher = 0;
        setomnvar( "ui_match_start_countdown", 0 );
    }
}

_id_64EE()
{
    level._id_374D = "axis";
    level thread maps\mp\gametypes\_gamelogic::_id_315F( "axis", game["end_reason"]["allies_eliminated"] );
}

onslashereliminated()
{
    level._id_374D = "allies";
    level thread maps\mp\gametypes\_gamelogic::_id_315F( "allies", game["end_reason"]["axis_eliminated"] );
}

_id_64AC()
{
    foreach ( var_1 in level._id_0323 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1._id_04A7 != "allies" )
            continue;

        if ( !maps\mp\_utility::_id_5189( var_1 ) )
            continue;

        var_1 slashersettings();
        break;
    }
}

_id_9B85()
{
    game["teamScores"]["allies"] = level.mm_teamscores["allies"];
    _func_160( "allies", level.mm_teamscores["allies"] );
    game["teamScores"]["axis"] = level.mm_teamscores["axis"];
    _func_160( "axis", level.mm_teamscores["axis"] );
}

slasherreducesprint()
{
    self notify( "slasherReduceSprint" );
    self endon( "slasherReduceSprint" );
    self _meth_8301( 0 );
    maps\mp\gametypes\_hostmigration::_id_A052( 3 );
    self _meth_8301( 1 );
}

mmcallbackplayerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( maps\mp\_utility::_id_5092( self.isslasher ) )
    {
        if ( isdefined( var_1 ) && maps\mp\_utility::_id_50CD( var_4 ) )
            thread onslasherdamage( var_2 );

        if ( !isdefined( var_1 ) || level.mm_teamscores["allies"] > 1 )
            return;
    }

    maps\mp\gametypes\_damage::_id_19F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

onmmplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_10 = var_1 == self || !_func_1AD( var_1 );

    if ( var_10 && !level.mm_allowsuicide )
        return;

    level notify( "update_game_time" );
    level.mm_teamscores[self._id_04A7]--;
    _id_9B85();

    if ( self._id_04A7 == "allies" )
    {
        maps\mp\_utility::_id_6DDD( "mp_enemy_obj_captured", "allies" );
        maps\mp\_utility::_id_6DDD( "mp_war_objective_taken", "axis" );
    }

    level thread maps\mp\_utility::_id_91FA( "callout_eliminated", self, self._id_04A7 );

    if ( level.mm_teamscores["allies"] == 0 )
    {
        _id_64EE();
        return;
    }

    if ( level.mm_teamscores["axis"] == 0 )
    {
        onslashereliminated();
        return;
    }

    if ( level.mm_teamscores["allies"] == 1 )
    {
        _id_64AC();
        return;
    }
}

getmmspawnpoint()
{
    if ( level._id_4C6D )
        var_0 = maps\mp\gametypes\_spawnlogic::getstartspawnffa( self._id_04A7 );
    else
    {
        var_1 = maps\mp\gametypes\_spawnlogic::_id_411F( self._id_04A7 );
        var_0 = maps\mp\gametypes\_spawnscoring::_id_40D5( var_1 );
    }

    maps\mp\gametypes\_spawnlogic::_id_7273( var_0 );
    return var_0;
}

mmclass()
{
    self._id_0308["class"] = "gamemode";
    self._id_0308["lastClass"] = "";
    self._id_0308["gamemodeLoadout"] = level.mm_loadouts[self._id_0308["team"]];
    self._id_1E2E = self._id_0308["class"];
    self._id_5589 = self._id_0308["lastClass"];
}

_id_8018()
{
    level.mm_loadouts["allies"] = maps\mp\gametypes\_class::_id_3F7B();
    level.mm_loadouts["allies"]["loadoutSecondary"] = "h1_colt45";
    level.mm_loadouts["allies"]["loadoutPrimary"] = "h1_ak47";
    level.mm_loadouts["allies"]["loadoutEquipment"] = "h1_fraggrenade_mp";
    level.mm_loadouts["allies"]["loadoutOffhand"] = "h1_smokegrenade_mp";
    level.mm_loadouts["axis"] = maps\mp\gametypes\_class::_id_3F7B();
    level.mm_loadouts["axis"]["loadoutMelee"] = "h1_meleeshovel";
    level.mm_loadouts["axis"]["loadoutPrimary"] = "h1_ak47";
    level.mm_loadouts["axis"]["loadoutEquipment"] = "h1_fraggrenade_mp";
    level.mm_loadouts["axis"]["loadoutOffhand"] = "h1_smokegrenade_mp";
}

mmononeleftevent( var_0 )
{
    if ( var_0 == "axis" )
        return;

    var_1 = maps\mp\_utility::_id_3FFC( var_0 );
    var_1 thread _id_41F0();
}

_id_41F0()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    maps\mp\_utility::_id_A0ED( 3 );
    level thread maps\mp\_utility::_id_91FA( "callout_lastteammemberalive", self, self._id_0308["team"] );
    level notify( "last_alive", self );
}

botslasheristargetingme()
{
    if ( isdefined( level.slasher ) )
    {
        if ( _func_0CF( level.slasher ) )
            return isdefined( level.slasher._id_0142 ) && level.slasher._id_0142 == self && level.slasher _meth_836D( self );
        else
            return common_scripts\utility::_id_A347( level.slasher _meth_80AA(), level.slasher _meth_8338(), self _meth_80AA(), 0.422618 ) && _func_08E( level.slasher _meth_80AA(), self _meth_80AA(), 0, self );
    }

    return 0;
}

botmmlogic()
{
    self notify( "botMMLogic" );
    self endon( "botMMLogic" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.next_hide_time = 0;
    self.next_bad_place_time = 0;
    var_0 = 1;
    var_1 = 300;
    var_2 = 1000;
    var_3 = 30000;

    for (;;)
    {
        wait 0.05;

        if ( self._id_01E6 <= 0 )
            continue;

        if ( maps\mp\_utility::_id_5092( self.isslasher ) || level.mm_teamscores["allies"] == 1 )
        {
            if ( self _meth_835B() == "critical" )
                self _meth_8354();

            continue;
        }

        if ( botslasheristargetingme() )
        {
            if ( self _meth_8363() )
                self _meth_8354();

            self._id_01FB = 1;

            if ( gettime() > self.next_bad_place_time )
            {
                badplace_cylinder( "slasher", var_2 / 1000, level.slasher._id_02E2, var_1, 75, "allies" );
                self.next_bad_place_time = gettime() + var_2;
            }

            continue;
        }

        if ( gettime() > self.next_hide_time )
        {
            self._id_01FB = 0;
            var_4 = _func_0C6( self._id_02E2, 900, 0, 300 );
            var_5 = self _meth_8362( var_4, var_4.size * 0.15, "node_hide_anywhere" );

            if ( !isdefined( var_5 ) )
                var_5 = self _meth_8385();

            if ( isdefined( var_5 ) )
            {
                var_6 = self _meth_8353( var_5, "critical" );

                if ( var_6 )
                    self.next_hide_time = gettime() + var_3;
            }
        }
    }
}

watchapplyloadout( var_0 )
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "applyLoadout" );
        self thread [[ var_0 ]]();
    }
}

giveprimaryweapon( var_0, var_1, var_2 )
{
    var_3 = self._id_0340;

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    var_4 = self._id_03B3;
    var_5 = maps\mp\_utility::_id_5092( var_1 ) && maps\mp\_utility::_id_05CB( "specialty_twoprimaries" ) && var_4 != "none";

    if ( maps\mp\_utility::_id_5092( var_0 ) )
        self _meth_8132( 0 );

    self _meth_830D();
    self _meth_830B( var_3 );
    self _meth_824B( var_3 );
    self _meth_8312( var_3 );

    if ( var_5 )
        self _meth_830B( var_4 );

    if ( maps\mp\_utility::_id_05CB( "specialty_extraammo" ) )
    {
        self _meth_832F( var_3 );

        if ( var_5 )
            self _meth_832F( var_4 );
    }
}

giveprimaryonly()
{
    giveprimaryweapon( 0, 1 );
}

giveprimaryonlynomelee()
{
    giveprimaryweapon( 1, 1 );
}

initrpgonly()
{
    level._id_64E9 = ::onrpgspawnplayer;
    level._id_1969 = ::rpgonlyclass;
    level._id_5D51 = ::rpgonlymodifyplayerdamage;
    level.rpg_loadout = maps\mp\gametypes\_class::_id_3F7B();
    level.rpg_loadout["loadoutSecondary"] = "h1_rpg";
    level.rpg_loadout["loadoutEquipment"] = "h1_fraggrenade_mp";
    level.rpg_loadout["loadoutOffhand"] = "h1_smokegrenade_mp";
    setupdvarsrpg();
    level thread watchhostmigrationrpg();
}

setupdvarsrpg()
{
    setdynamicdvar( "g_oldschool", 1 );
}

watchhostmigrationrpg()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_begin" );
        setupdvarsrpg();
        level waittill( "host_migration_end" );
        setupdvarsrpg();
    }
}

rpgonlyclass()
{
    self._id_0308["class"] = "gamemode";
    self._id_0308["lastClass"] = "";
    self._id_0308["gamemodeLoadout"] = level.rpg_loadout;
    self._id_1E2E = self._id_0308["class"];
    self._id_5589 = self._id_0308["lastClass"];
}

onrpgspawnplayer()
{
    thread refillrpgammo();
    thread onrpgspawnplayerwait();
}

onrpgspawnplayerwait()
{
    self endon( "disconnect" );
    waitframe;
    giverpgperks();
    giveprimaryweapon( 0, 0, "h1_rpg_mp" );
}

giverpgperks()
{
    maps\mp\_utility::_id_41F8( "specialty_fastreload", 0 );
}

refillrpgammo()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "refillRPGAmmo" );
    self endon( "refillRPGAmmo" );

    if ( level.rpgonlyreload )
    {
        for (;;)
        {
            self _meth_82F4( "h1_rpg_mp", 2 );
            self waittill( "reload" );
        }
    }
    else
    {
        for (;;)
        {
            self waittill( "weapon_fired", var_0 );

            if ( var_0 == "h1_rpg_mp" )
                self _meth_82F3( "h1_rpg_mp", 1 );
        }
    }
}

rpgonlymodifyplayerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( var_4 == "h1_rpg_mp" && isdefined( var_0 ) )
    {
        var_8 = 50;
        var_9 = 200;
        var_10 = 500;
        var_11 = 100;
        var_12 = _func_0F1( var_6 );
        var_13 = 1.0 - _func_0E9( ( var_12 - var_8 ) / ( var_9 - var_8 ), 0.0, 1.0 );
        var_14 = ( var_10 - var_11 ) * var_13 + var_11;

        if ( var_6[2] < 0.0 )
            var_6 = ( var_6[0], var_6[1], 0.0 );

        var_15 = _func_114( var_6 );
        var_16 = var_0 _meth_8336();
        var_0 _meth_82EE( var_16 + var_15 * var_14 );

        if ( isdefined( var_1 ) && var_1 == var_0 )
        {
            var_17 = 50;
            var_18 = 300;
            var_19 = 100;
            var_20 = 0;
            var_13 = 1.0 - _func_0E9( ( var_12 - var_17 ) / ( var_18 - var_17 ), 0.0, 1.0 );
            var_21 = ( var_19 - var_20 ) * var_13 + var_20;
            var_2 = _func_0BC( var_21 );
        }
    }

    return var_2;
}

initprophunt()
{
    level.bot_ignore_personality = 1;
    maps\mp\gametypes\_hodgepodge_ph::ph_init();
}

flashkillindicator()
{
    self notify( "newKillIndicator" );
    self endon( "newKillIndicator" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.killindicator.alpha = 1;
    self.killindicator _meth_8086( 3 );
    self.killindicator.alpha = 0;
}

updatekillindicator( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = var_0;

    if ( var_0 >= 150 )
        self.killindicator.color = ( 0, 1, 0 );
    else
    {
        var_1 = 0.01 * ( 100 - 0.67 * var_1 );
        self.killindicator.color = ( var_1, 1, var_1 );
    }

    self.killindicator _meth_80D9( var_0 );

    if ( !isdefined( self.maxkillrange ) || self.maxkillrange < var_0 )
    {
        self.maxkillrange = var_0;
        self.maxkillindicator.color = ( var_1, 1, var_1 );
        self.maxkillindicator _meth_80D9( self.maxkillrange );
        self.maxkillindicator.alpha = 1;

        if ( var_0 >= 150 )
        {
            self.maxkillindicator.color = ( 0, 1, 0 );
            self.maxkillindicator._id_01BC = 0.5;
        }

        if ( !isdefined( level.maxmatchrange ) || level.maxmatchrange < var_0 )
        {
            level.maxmatchrange = var_0;
            level.maxmatchindicator.color = ( var_1, 1, var_1 );
            level.maxmatchindicator _meth_80D9( level.maxmatchrange );
            level.maxmatchindicator.alpha = 1;

            if ( var_0 >= 150 )
            {
                level.maxmatchindicator.color = ( 0, 1, 0 );
                level.maxmatchindicator._id_01BC = 0.5;
            }
        }
    }

    thread flashkillindicator();
}

hidekillindicator()
{
    self endon( "disconnect" );

    for (;;)
    {
        level waittill( "game_ended" );
        self.killindicator.alpha = 0;
        self.maxkillindicator.alpha = 0;
    }
}

killrangeindicator()
{
    self endon( "disconnect" );
    self.killindicator = maps\mp\gametypes\_hud_util::_id_2401( "objective", 1 );
    self.killindicator._id_0241 = &"MP_RANGE_KILL_INDICATOR";
    self.killindicator _meth_80D9( 0 );
    self.killindicator._id_0530 = 0;
    self.killindicator._id_0538 = 20;
    self.killindicator.alignx = "center";
    self.killindicator.aligny = "middle";
    self.killindicator._id_01F3 = "center_adjustable";
    self.killindicator._id_0501 = "middle";
    self.killindicator.archived = 1;
    self.killindicator._id_0189 = 1;
    self.killindicator.alpha = 0;
    self.killindicator._id_01BC = 0.5;
    self.killindicator._id_01ED = 0;
    self.maxkillindicator = maps\mp\gametypes\_hud_util::_id_2401( "objective", 1 );
    self.maxkillindicator._id_0530 = -6;
    self.maxkillindicator._id_0538 = 2;
    self.maxkillindicator.alignx = "right";
    self.maxkillindicator.aligny = "top";
    self.maxkillindicator._id_01F3 = "right_adjustable";
    self.maxkillindicator._id_0501 = "top_adjustable";
    self.maxkillindicator._id_0241 = &"MP_MAX_KILL_INDICATOR";
    self.maxkillindicator _meth_80D9( 0 );
    self.maxkillindicator.alpha = 0;
    self.maxkillindicator.archived = 0;
    self.maxkillindicator._id_01ED = 1;
    thread hidekillindicator();
}

onsniperonlyplayerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = self;

    if ( !isdefined( var_1 ) )
        return;

    var_11 = var_1 == self || !_func_1AD( var_1 );

    if ( var_11 )
        return;

    if ( isdefined( var_1 ) && isdefined( var_10 ) && isdefined( var_1._id_02E2 ) && isdefined( var_10._id_02E2 ) )
    {
        var_12 = _func_0BC( _func_0E4( _func_0EE( var_1._id_02E2, var_10._id_02E2 ) * 0.0254 ) );

        if ( var_12 <= 0 )
            var_12 = 1;
    }
    else
        return;

    var_1 thread updatekillindicator( var_12 );
}

matchbestkillrangeindicator()
{
    level.maxmatchindicator = maps\mp\gametypes\_hud_util::_id_243D( "objective", 1 );
    level.maxmatchindicator._id_0530 = -6;
    level.maxmatchindicator._id_0538 = 14;
    level.maxmatchindicator.alignx = "right";
    level.maxmatchindicator.aligny = "top";
    level.maxmatchindicator._id_01F3 = "right_adjustable";
    level.maxmatchindicator._id_0501 = "top_adjustable";
    level.maxmatchindicator._id_0241 = &"MP_MAX_MATCH_INDICATOR";
    level.maxmatchindicator _meth_80D9( 0 );
    level.maxmatchindicator.alpha = 0;
    level.maxmatchindicator.archived = 0;
    level.maxmatchindicator._id_01ED = 1;
}

initsnipersonly()
{
    level._id_64D3 = ::onsniperonlyplayerkilled;
    level matchbestkillrangeindicator();
}

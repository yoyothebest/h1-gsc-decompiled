// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( game["gamestarted"] ) )
    {
        game["menu_team"] = "team_marinesopfor";

        if ( level._id_5FEC )
            game["menu_team"] = "team_mt_options";

        game["menu_class"] = "class";
        game["menu_class_allies"] = "class_marines";
        game["menu_class_axis"] = "class_opfor";
        game["menu_changeclass_allies"] = "changeclass_marines";
        game["menu_changeclass_axis"] = "changeclass_opfor";

        if ( level._id_5FEC )
        {
            for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
            {
                var_1 = "menu_class_" + level._id_91F7[var_0];
                var_2 = "menu_changeclass_" + level._id_91F7[var_0];
                game[var_1] = game["menu_class_allies"];
                game[var_2] = "changeclass_marines";
            }
        }

        game["menu_changeclass"] = "changeclass";

        if ( level._id_2153 )
        {
            game["menu_controls"] = "ingame_controls";

            if ( level._id_8A7C )
            {
                if ( level._id_5FEC )
                {
                    for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
                    {
                        var_1 = "menu_class_" + level._id_91F7[var_0];
                        var_2 = "menu_changeclass_" + level._id_91F7[var_0];
                        game[var_1] += "_splitscreen";
                        game[var_2] += "_splitscreen";
                    }
                }

                game["menu_team"] += "_splitscreen";
                game["menu_class_allies"] += "_splitscreen";
                game["menu_class_axis"] += "_splitscreen";
                game["menu_changeclass_allies"] += "_splitscreen";
                game["menu_changeclass_axis"] += "_splitscreen";
                game["menu_controls"] += "_splitscreen";
                game["menu_changeclass_defaults_splitscreen"] = "changeclass_splitscreen_defaults";
                game["menu_changeclass_custom_splitscreen"] = "changeclass_splitscreen_custom";
            }
        }

        precachestring( &"MP_HOST_ENDED_GAME" );
        precachestring( &"MP_HOST_ENDGAME_RESPONSE" );
    }

    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_A21E();
        var_0 thread watchforopenteamselectmenu();
        var_0 thread _id_A22B();
        var_0 thread _id_A226();
        var_0 thread _id_2149();
        var_0 maps\mp\gametypes\_class::cac_setlastenvironment( _func_0FD( "environment" ) );
    }
}

_id_2149()
{

}

_id_3F31( var_0 )
{
    if ( var_0 <= 100 )
        var_0 = "custom" + var_0;
    else if ( var_0 <= 200 )
    {
        var_0 -= 101;
        var_0 = "class" + var_0;
    }
    else if ( var_0 <= 206 )
    {
        var_0 -= 200;
        var_0 = "axis_recipe" + var_0;
    }
    else
    {
        var_0 -= 206;
        var_0 = "allies_recipe" + var_0;
    }

    return var_0;
}

_id_A21E()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "class_select" )
            continue;

        if ( maps\mp\_utility::_id_5155() && self _meth_842D() && !maps\mp\_utility::_id_4FA6() )
        {
            self _meth_82F8( "ui_options_menu", 0 );
            continue;
        }

        if ( !_func_28E( self ) && !_func_0CF( self ) )
        {
            if ( "" + var_1 != "callback" )
                self _meth_82F8( "ui_loadout_selected", var_1 );
        }

        if ( isdefined( self._id_A04C ) && self._id_A04C )
            continue;

        if ( !maps\mp\_utility::_id_0AA2() )
            continue;

        self _meth_82F8( "ui_options_menu", 0 );

        if ( "" + var_1 != "callback" )
        {
            if ( _func_1FE( self ) || _func_28E( self ) )
            {
                self._id_0308["class"] = var_1;
                self._id_1E2E = var_1;
                maps\mp\gametypes\_class::_id_1EE7();
            }
            else
            {
                var_2 = var_1 + 1;
                var_2 = _id_3F31( var_2 );

                if ( !isdefined( self._id_0308["class"] ) || var_2 == self._id_0308["class"] )
                    continue;

                self._id_0308["class"] = var_2;
                self._id_1E2E = var_2;
                maps\mp\gametypes\_class::_id_1EE7();
                maps\mp\gametypes\_class::cac_setlastclassindex( var_1 + 1 );
                maps\mp\gametypes\_class::cac_setlastgrouplocation( getdvarint( "xblive_privatematch" ) );
                thread _id_5BB2( 0 );
            }

            continue;
        }

        _id_5BB1( "callback" );
    }
}

_id_A226()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "end_game" )
            continue;

        level thread maps\mp\gametypes\_gamelogic::_id_39BC();
    }
}

teamchangeisfactionchange()
{
    return self._id_03BC == "playing" && level._id_01B3 == "dm";
}

watchforopenteamselectmenu()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0 );

        if ( var_0 != "open_team_select_menu" )
            continue;

        var_1 = maps\mp\gametypes\_tweakables::_id_4142( "game", "spectatetype" );

        if ( var_1 > 0 )
            maps\mp\_utility::streamnextspectatorweaponsifnecessary( 0 );
    }
}

_id_A22B()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "team_select" )
            continue;

        if ( maps\mp\_utility::_id_59E3() && !getdvarint( "force_ranking" ) && !self _meth_8586() )
            continue;

        if ( var_1 != 3 && !teamchangeisfactionchange() && maps\mp\_utility::_id_0AA2() )
            thread _id_851C();

        if ( var_1 == 3 )
        {
            self _meth_82F8( "ui_options_menu", 0 );
            self _meth_82F8( "ui_spectator_selected", 1 );
            self _meth_82F8( "ui_loadout_selected", -1 );
            self._id_8A4B = 1;

            if ( maps\mp\_utility::_id_5155() )
            {
                self _meth_84FD( 1 );
                self _meth_82F8( "ui_use_mlg_hud", 1 );
                thread maps\mp\gametypes\_spectating::_id_8019();
            }

            if ( teamchangeisfactionchange() && isdefined( self._id_0851 ) )
                self._id_0851 = undefined;
        }
        else
        {
            self _meth_82F8( "ui_spectator_selected", -1 );
            self._id_8A4B = 0;

            if ( maps\mp\_utility::_id_5155() )
            {
                self _meth_84FD( 0 );
                self _meth_82F8( "ui_use_mlg_hud", 0 );
            }

            if ( teamchangeisfactionchange() || !maps\mp\_utility::_id_0AA2() )
                thread maps\mp\gametypes\_playerlogic::_id_803C( -1 );
        }

        if ( var_1 == 0 )
            var_1 = "axis";
        else if ( var_1 == 1 )
            var_1 = "allies";
        else if ( var_1 == 2 )
            var_1 = "random";
        else
            var_1 = "spectator";

        if ( isdefined( self._id_0308["team"] ) && var_1 == self._id_0308["team"] )
        {
            if ( teamchangeisfactionchange() && isdefined( self._id_0851 ) )
                self._id_0851 = undefined;

            self notify( "selected_same_team" );
            continue;
        }

        if ( getdvarint( "scr_lua_splashes" ) )
            self _meth_8561( &"clear_notification_queue", 0 );

        self _meth_82F8( "ui_loadout_selected", -1 );

        if ( var_1 == "axis" )
        {
            thread _id_8027( "axis" );
            continue;
        }

        if ( var_1 == "allies" )
        {
            thread _id_8027( "allies" );
            continue;
        }

        if ( var_1 == "random" )
        {
            self thread [[ level._id_112A ]]();
            continue;
        }

        if ( var_1 == "spectator" )
            thread _id_801A();
    }
}

_id_851C()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    common_scripts\utility::_id_A069( "joined_team", "selected_same_team" );

    if ( maps\mp\_utility::ishodgepodgeph() && !maps\mp\_utility::_id_0AA2() )
        return;

    self _meth_82F8( "ui_options_menu", 2 );
}

_id_112A()
{
    if ( maps\mp\_utility::iscoop() )
    {
        thread _id_8027( "allies" );
        self._id_03BD = "allies";
    }
    else if ( self _meth_842D() && !maps\mp\_utility::_id_4FA6() )
        thread _id_801A();
    else
    {
        var_0 = isdefined( self._id_04A7 ) && self._id_04A7 == "axis";
        var_1 = isdefined( self._id_04A7 ) && self._id_04A7 == "allies";

        if ( level._id_91ED["axis"] < level._id_91ED["allies"] && !var_0 )
        {
            thread _id_8027( "axis" );
            return;
        }

        if ( level._id_91ED["allies"] < level._id_91ED["axis"] && !var_1 )
        {
            thread _id_8027( "allies" );
            return;
        }

        if ( level._id_91ED["allies"] == level._id_91ED["axis"] )
        {
            if ( !var_0 && !var_1 )
            {
                var_2 = _func_15F( "allies" );
                var_3 = _func_15F( "axis" );

                if ( var_2 > var_3 && !var_0 )
                    thread _id_8027( "axis" );
                else if ( var_3 > var_2 && !var_1 )
                    thread _id_8027( "allies" );
                else
                    thread _id_8027( common_scripts\utility::_id_710E( [ "allies", "axis" ] ) );
            }
        }
    }
}

_id_8027( var_0 )
{
    self endon( "disconnect" );

    if ( !_func_0CF( self ) && level._id_91EB && !maps\mp\gametypes\_teams::_id_3FDD( var_0 ) )
        return;

    var_1 = level._id_4C6D && !self._id_4729;

    if ( teamchangeisfactionchange() )
    {
        if ( var_1 )
        {
            _id_0851( var_0, 0, 1 );
            maps\mp\gametypes\_class::cac_setlastteam( var_0 );
        }
        else
            self._id_0851 = var_0;

        thread _id_5BB2( 1 );
    }
    else
    {
        if ( var_1 )
            self._id_4745 = 0;

        if ( self._id_03BC == "playing" )
        {
            self._id_907E = 1;
            self._id_528C = var_0;
            self._id_566D = self._id_0308["team"];
        }

        _id_0851( var_0 );
        maps\mp\gametypes\_class::cac_setlastteam( var_0 );

        if ( self._id_03BC == "playing" )
            self _meth_8267();

        _id_A018();
        _id_31BF();
    }

    if ( self._id_03BC == "spectator" )
    {
        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
        {
            if ( isdefined( self._id_A04E ) && self._id_A04E )
                return;

            maps\mp\gametypes\_playerlogic::_id_8998();
        }

        thread maps\mp\gametypes\_spectating::_id_8019();
    }
}

_id_801A()
{
    if ( isdefined( self._id_0308["team"] ) && self._id_0308["team"] == "spectator" )
        return;

    if ( _func_1A1( self ) )
    {
        self._id_907E = 1;
        self._id_528C = "spectator";
        self._id_566D = self._id_0308["team"];
        self _meth_8267();
    }

    self notify( "becameSpectator" );
    _id_0851( "spectator" );
    self._id_0308["class"] = undefined;
    self._id_1E2E = undefined;
    thread maps\mp\gametypes\_playerlogic::_id_8A0E();
}

_id_A018()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_A04C = 1;

    if ( maps\mp\_utility::_id_0AA2() )
    {
        for (;;)
        {
            self waittill( "luinotifyserver", var_0, var_1 );

            if ( var_0 == "class_select" )
                break;
        }

        if ( "" + var_1 != "callback" )
        {
            if ( _func_1FE( self ) || _func_28E( self ) )
            {
                self._id_0308["class"] = var_1;
                self._id_1E2E = var_1;
                maps\mp\gametypes\_class::_id_1EE7();
            }
            else
            {
                var_1 += 1;
                self._id_0308["class"] = _id_3F31( var_1 );
                self._id_1E2E = _id_3F31( var_1 );
                maps\mp\gametypes\_class::_id_1EE7();
                maps\mp\gametypes\_class::cac_setlastclassindex( var_1 );
                maps\mp\gametypes\_class::cac_setlastgrouplocation( getdvarint( "xblive_privatematch" ) );
            }

            self notify( "notWaitingToSelectClass" );
            self._id_A04C = 0;
            return;
        }

        self notify( "notWaitingToSelectClass" );
        self._id_A04C = 0;
        _id_5BB1( "callback" );
        return;
    }
    else
    {
        if ( !_func_0CF( self ) && maps\mp\_utility::_id_8510() && ( self _meth_8443( "ui_options_menu" ) == 0 || maps\mp\_utility::ishodgepodgeph() ) )
        {
            thread maps\mp\gametypes\_playerlogic::_id_803C( 3 );

            for (;;)
            {
                self waittill( "luinotifyserver", var_0, var_1 );

                if ( var_0 == "class_select" )
                    break;
            }
        }

        self notify( "notWaitingToSelectClass" );
        self._id_A04C = 0;
        _id_1968();
    }
}

_id_1398( var_0 )
{
    var_1 = self._id_0308["team"];

    if ( maps\mp\_utility::_id_0AA2() )
    {
        thread maps\mp\gametypes\_playerlogic::_id_803C( 2 );

        if ( !self _meth_842D() || maps\mp\_utility::_id_4FA6() )
            _id_A018();

        _id_31BF();

        if ( self._id_03BC == "spectator" )
        {
            if ( game["state"] == "postgame" )
                return;

            if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
            {
                if ( isdefined( self._id_A04E ) && self._id_A04E )
                    return;

                thread maps\mp\gametypes\_playerlogic::_id_8998();
            }

            thread maps\mp\gametypes\_spectating::_id_8019();
        }

        self._id_214F = gettime();
    }
    else
    {
        thread _id_1968();

        if ( self._id_03BC == "spectator" && maps\mp\_utility::ishodgepodgeph() )
        {
            if ( game["state"] == "postgame" )
                return;

            if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
            {
                if ( isdefined( self._id_A04E ) && self._id_A04E )
                    return;

                thread maps\mp\gametypes\_playerlogic::_id_8998();
            }

            thread maps\mp\gametypes\_spectating::_id_8019();
        }
    }
}

_id_1968()
{
    maps\mp\gametypes\_class::_id_1EE7();
    self._id_7C68 = 1;
    self._id_1E2E = "class0";

    if ( isdefined( level._id_1969 ) )
        self [[ level._id_1969 ]]();
}

_id_13A1()
{
    thread maps\mp\gametypes\_playerlogic::_id_803C( 1 );
}

_id_851D()
{
    var_0 = self._id_0308["team"];
    self _meth_8320( game["menu_class_" + var_0] );
}

_id_5BB5()
{
    if ( isdefined( self._id_0308["team"] ) && self._id_0308["team"] == "spectator" )
        return;

    if ( _func_1A1( self ) )
    {
        self._id_907E = 1;
        self._id_528C = "spectator";
        self._id_566D = self._id_0308["team"];
        self _meth_8267();
    }

    _id_0851( "spectator" );
    self._id_0308["class"] = undefined;
    self._id_1E2E = undefined;
    maps\mp\gametypes\_class::_id_1EE7();
    thread maps\mp\gametypes\_playerlogic::_id_8A0E();
}

_id_A233( var_0 )
{
    if ( !self._id_4729 )
    {
        self endon( "death" );
        self endon( "disconnect" );
        self endon( "streamClassComplete" );
        level endon( "game_ended" );
        self waittill( "hasDoneCombat" );
        self notify( "endStreamClass" );

        if ( var_0 )
            self _meth_826A( game["strings"]["change_team_cancel"] );
        else
            self _meth_826A( game["strings"]["change_class_cancel"] );

        wait 2.0;

        if ( var_0 )
            self _meth_826A( game["strings"]["change_team"] );
        else
            self _meth_826A( game["strings"]["change_class"] );
    }
}

_id_5BB2( var_0 )
{
    if ( level._id_4C6D && !self._id_4729 )
    {
        thread maps\mp\gametypes\_playerlogic::streamclass( 1 );

        if ( self._id_1E41 )
        {
            self endon( "death" );
            self endon( "disconnect" );
            level endon( "game_ended" );
            self endon( "endStreamClass" );
            thread _id_A233( var_0 );

            if ( var_0 )
                self _meth_826A( game["strings"]["change_team_wait"] );
            else
                self _meth_826A( game["strings"]["change_class_wait"] );

            self waittill( "streamClassComplete" );
            self _meth_826A( "" );
            self _meth_852B( 0 );
        }

        maps\mp\gametypes\_class::_id_7F3B( self._id_0308["class"] );
        self._id_048B = undefined;
        self._id_90D3 = undefined;
        maps\mp\gametypes\_class::_id_41F1( self._id_0308["team"], self._id_0308["class"] );

        if ( !isdefined( self.spawnplayergivingloadout ) )
        {
            maps\mp\gametypes\_class::_id_0CAE();
            maps\mp\gametypes\_hardpoints::giveownedhardpointitem();
        }

        if ( maps\mp\_utility::_id_05CB( "specialty_moreminimap" ) )
            setomnvar( "ui_minimap_extend_grace_period", 1 );
        else
            setomnvar( "ui_minimap_extend_grace_period", 0 );

        self _meth_82F8( "ui_class_changed_grace_period", 1 );
    }
    else
    {
        maps\mp\gametypes\_playerlogic::streamclass();

        if ( var_0 )
            self _meth_826A( game["strings"]["change_team"] );
        else
            self _meth_826A( game["strings"]["change_class"] );
    }
}

_id_5BB1( var_0 )
{
    var_1 = self._id_0308["team"];
    var_2 = maps\mp\gametypes\_class::_id_3F31( var_0 );
    var_3 = maps\mp\gametypes\_class::_id_4166( var_0 );

    if ( var_2 == "restricted" )
    {
        _id_1398();
        return;
    }

    if ( isdefined( self._id_0308["class"] ) && self._id_0308["class"] == var_2 && ( isdefined( self._id_0308["primary"] ) && self._id_0308["primary"] == var_3 ) )
        return;

    if ( maps\mp\_utility::ishodgepodgeph() && game["roundsPlayed"] > 0 )
        return;

    if ( self._id_03BC == "playing" )
    {
        if ( isdefined( self._id_0308["lastClass"] ) && isdefined( self._id_0308["class"] ) )
        {
            self._id_0308["lastClass"] = self._id_0308["class"];
            self._id_5589 = self._id_0308["lastClass"];
        }

        self._id_0308["class"] = var_2;
        self._id_1E2E = var_2;
        maps\mp\gametypes\_class::_id_1EE7();
        self._id_0308["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        thread _id_5BB2( 0 );
    }
    else
    {
        if ( isdefined( self._id_0308["lastClass"] ) && isdefined( self._id_0308["class"] ) )
        {
            self._id_0308["lastClass"] = self._id_0308["class"];
            self._id_5589 = self._id_0308["lastClass"];
        }

        self._id_0308["class"] = var_2;
        self._id_1E2E = var_2;
        maps\mp\gametypes\_class::_id_1EE7();
        self._id_0308["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
            thread maps\mp\gametypes\_playerlogic::_id_8998();
    }

    thread maps\mp\gametypes\_spectating::_id_8019();
}

getuiteamindex( var_0 )
{
    if ( var_0 == "allies" )
        return 2;
    else if ( var_0 == "axis" )
        return 1;
}

_id_0851( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_04A7 ) )
    {
        maps\mp\gametypes\_playerlogic::_id_73AF();

        if ( isdefined( var_2 ) && var_2 )
            maps\mp\gametypes\_playerlogic::_id_275E( self._id_04A7 );
    }

    self._id_0308["team"] = var_0;
    self._id_04A7 = var_0;

    if ( var_0 == "allies" )
    {
        self.lastgameteamchosen = "allies";
        self _meth_82F8( "ui_team_selected", getuiteamindex( "allies" ) );
    }
    else if ( var_0 == "axis" )
    {
        self.lastgameteamchosen = "axis";
        self _meth_82F8( "ui_team_selected", getuiteamindex( "axis" ) );
    }

    if ( !getdvarint( "party_playersCoop", 0 ) && ( !maps\mp\_utility::_id_59E3() || _func_1FE( self ) || _func_28E( self ) || !maps\mp\_utility::_id_0AB0() || getdvarint( "force_ranking" ) ) )
    {
        if ( level._id_91EB )
            self._id_03BD = var_0;
        else if ( var_0 == "spectator" )
            self._id_03BD = "spectator";
        else
            self._id_03BD = "none";
    }

    if ( game["state"] != "postgame" )
    {
        maps\mp\gametypes\_playerlogic::_id_0852();

        if ( isdefined( var_2 ) && var_2 )
            maps\mp\gametypes\_playerlogic::_id_4C3C( self._id_04A7 );
    }

    maps\mp\_utility::_id_9B42();

    if ( isdefined( var_1 ) && var_1 )
        waitframe;

    maps\mp\_utility::_id_9B33();

    if ( var_0 == "spectator" )
    {
        self notify( "joined_spectators" );
        level notify( "joined_team", self );
    }
    else
    {
        self notify( "joined_team" );
        level notify( "joined_team", self );
    }
}

_id_31BF()
{
    self._id_A04D = 0;
    self notify( "end_respawn" );
}

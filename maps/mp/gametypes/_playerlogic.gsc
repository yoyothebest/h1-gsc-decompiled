// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_9383( var_0 )
{
    if ( !self._id_4745 )
        return 0;

    var_1 = gettime() + var_0 * 1000;
    var_2 = level._id_560E[self._id_0308["team"]];
    var_3 = level._id_A2AB[self._id_0308["team"]] * 1000;
    var_4 = ( var_1 - var_2 ) / var_3;
    var_5 = _func_0E3( var_4 );
    var_6 = var_2 + var_5 * var_3;

    if ( isdefined( self._id_747A ) )
    {
        var_7 = ( gettime() - self._id_747A ) / 1000.0;

        if ( self._id_747A < var_2 )
            return 0;
    }

    if ( isdefined( self._id_A2AF ) )
        var_6 += 50 * self._id_A2AF;

    return ( var_6 - gettime() ) / 1000;
}

_id_91F2()
{
    var_0 = self._id_0308["teamkills"];

    if ( var_0 <= level._id_5A22 )
        return 0;

    var_1 = var_0 - level._id_5A22;
    return maps\mp\gametypes\_tweakables::_id_4142( "team", "teamkillspawndelay" ) * var_1;
}

getrespawndelay()
{
    var_0 = self [[ level._id_64E2 ]]();

    if ( isdefined( var_0 ) )
        return var_0;
    else
        return getdvarint( "scr_" + level._id_01B3 + "_playerrespawndelay" );
}

_id_9382( var_0 )
{
    if ( level._id_4C6D && !self._id_4745 || level._id_3BDA )
        return 0;

    var_1 = 0;

    if ( self._id_4745 )
    {
        var_1 = getrespawndelay();

        if ( var_0 )
        {
            if ( isdefined( self._id_0308["teamKillPunish"] ) && self._id_0308["teamKillPunish"] )
                var_1 += _id_91F2();

            if ( isdefined( self._id_0308["suicideSpawnDelay"] ) )
                var_1 += self._id_0308["suicideSpawnDelay"];
        }

        if ( isdefined( self._id_747A ) )
        {
            var_2 = ( gettime() - self._id_747A ) / 1000.0;
            var_1 -= var_2;

            if ( var_1 < 0 )
                var_1 = 0;
        }

        if ( isdefined( self._id_8015 ) )
            var_1 += level._id_9386;
    }

    var_3 = getdvarfloat( "scr_" + level._id_01B3 + "_waverespawndelay" ) > 0;

    if ( var_3 )
        return _id_9383( var_1 );

    return var_1;
}

_id_5A62( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( isdefined( level.gamemodemayspawn ) )
        return [[ level.gamemodemayspawn ]]( var_0 );

    if ( maps\mp\_utility::_id_3FAA() || isdefined( level._id_2B28 ) )
    {
        if ( isdefined( level._id_2B28 ) && level._id_2B28 )
            return 0;

        if ( var_0 && isdefined( self._id_0308["teamKillPunish"] ) && self._id_0308["teamKillPunish"] )
            return 0;

        if ( !self._id_0308["lives"] && maps\mp\_utility::_id_3BE2() )
            return 0;
        else if ( maps\mp\_utility::_id_3BE2() )
        {
            if ( !level._id_4C6D && !self._id_4745 && ( isdefined( level._id_0AAB ) && !level._id_0AAB ) )
                return 0;
        }

        if ( isdefined( level.disablespawningforplayerfunc ) && [[ level.disablespawningforplayerfunc ]]( self ) )
            return 0;
    }

    return 1;
}

_id_8998()
{
    self endon( "becameSpectator" );

    if ( isdefined( self._id_1F0F ) )
    {

    }
    else
    {

    }

    if ( isdefined( self._id_A04C ) && self._id_A04C )
        self waittill( "notWaitingToSelectClass" );

    if ( isdefined( self._id_0851 ) )
    {
        maps\mp\gametypes\_menus::_id_0851( self._id_0851 );
        maps\mp\gametypes\_class::cac_setlastteam( self._id_0851 );
        self._id_0851 = undefined;
    }

    if ( !_id_5A62( 0 ) )
    {
        wait 0.05;
        self notify( "attempted_spawn" );

        if ( maps\mp\_utility::_id_5194() && !maps\mp\_utility::_id_5141() )
        {
            if ( isdefined( self._id_90DF ) && self._id_90DF )
                maps\mp\_utility::_id_7FA5( "spawn_info", game["strings"]["spawn_tag_wait"] );
            else
                maps\mp\_utility::_id_7FA5( "spawn_info", game["strings"]["spawn_next_round"] );

            thread _id_73DE( 3.0 );
        }

        thread _id_8A0E();
        return;
    }

    if ( self._id_A04D )
        return;

    self._id_A04D = 1;
    _id_A008();

    if ( isdefined( self ) )
        self._id_A04D = 0;
}

_id_8F31()
{
    if ( _func_0CF( self ) || _func_28E( self ) )
        return;

    if ( maps\mp\_utility::_id_0AA2() )
    {
        var_0 = [];
        var_1 = [];
        var_2 = [ "custom1", "custom2", "custom3", "custom4", "custom5", "class0", "class1", "class2", "class3", "class4" ];
        var_3 = self._id_04A7;

        if ( !isdefined( var_3 ) || var_3 != "allies" && var_3 != "axis" )
            var_3 = "allies";

        foreach ( var_5 in var_2 )
        {
            var_6 = maps\mp\gametypes\_class::_id_4009( self._id_04A7, var_5 );
            var_0[var_0.size] = var_6._id_6F84;
            var_7 = _func_1B8( var_6._id_6F84 );

            if ( var_7 != "none" && !isdefined( var_1[var_7] ) )
            {
                var_8 = spawnstruct();
                var_8._id_04A7 = var_3;
                var_8._id_0513 = var_6._id_6F84;
                var_1[var_7] = var_8;
            }
        }

        self _meth_8420( var_1, var_0 );
    }
    else if ( isdefined( level.streamprimariesfunc ) )
        self [[ level.streamprimariesfunc ]]();
}

_id_3C60( var_0, var_1 )
{
    var_2 = [];

    if ( !isdefined( self._id_1E2E ) || self._id_1E2E == "" )
        return var_2;

    if ( !isdefined( var_1 ) )
        var_1 = maps\mp\gametypes\_class::_id_4009( self._id_04A7, self._id_1E2E, undefined, undefined, 1 );

    var_2[var_2.size] = var_1._id_6F84;

    if ( !isdefined( var_0 ) || !var_0 )
    {
        var_2[var_2.size] = var_1._id_7BFA;
        var_2[var_2.size] = var_1.meleeweaponname;
    }

    return var_2;
}

getstreaminfo( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_04A7 = common_scripts\utility::_id_9294( isdefined( self._id_0851 ), self._id_0851, self._id_04A7 );
    var_1._id_0513 = var_0._id_6F84;
    return var_1;
}

getloadoutforclass( var_0, var_1 )
{
    var_2 = var_0;

    if ( !maps\mp\_utility::_id_51E8( var_2 ) )
        var_2 = self._id_1E2E;

    var_3 = maps\mp\gametypes\_class::_id_4009( self._id_04A7, var_2, undefined, undefined, var_1 );
    return var_3;
}

streamclass( var_0, var_1, var_2 )
{
    self._id_1E41 = 0;
    self notify( "endStreamClass" );
    self endon( "endStreamClass" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( _func_0CF( self ) || !isdefined( var_0 ) )
        var_0 = 0;

    while ( isdefined( self.loadingplayerweapons ) && self.loadingplayerweapons )
        wait 0.05;

    var_3 = getloadoutforclass( var_2, 1 );
    var_4 = getstreaminfo( var_3 );
    var_5 = _id_3C60( 0, var_3 );
    var_0 = !self _meth_8420( var_4, var_5 ) && var_0;
    self _meth_852B( 1 );

    for ( self._id_1E41 = var_0; var_0; var_0 = !self _meth_8420( var_4, var_5 ) )
        waittillframeend;

    self _meth_852B( 0 );
    self._id_1E41 = 0;
    self notify( "streamClassComplete" );
}

_id_A008()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );
    level endon( "game_ended" );
    self notify( "attempted_spawn" );

    if ( isdefined( self._id_1F0F ) )
    {

    }
    else
    {

    }

    var_0 = 0;
    var_1 = getentarray( "mp_global_intermission", "classname" );
    var_2 = var_1[_func_0B2( var_1.size )];
    var_3 = self._id_0308["teamKillPunish"];

    if ( isdefined( var_3 ) && var_3 )
    {
        var_4 = _id_91F2();

        if ( var_4 > 0 )
        {
            maps\mp\_utility::_id_7FA5( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT", var_4, 1, 1 );
            thread _id_746D( var_2._id_02E2, var_2.angles );
            var_0 = 1;
            wait(var_4);
            maps\mp\_utility::_id_1EF5( "friendly_fire" );
            self._id_747A = gettime();
        }

        self._id_0308["teamKillPunish"] = 0;
    }
    else if ( _id_91F2() )
        self._id_0308["teamkills"] = _func_0E1( self._id_0308["teamkills"] - 1, 0 );

    var_5 = self._id_0308["suicideSpawnDelay"];

    if ( isdefined( var_5 ) && var_5 > 0 )
    {
        maps\mp\_utility::_id_7FA5( "suicidePenalty", &"MP_SUICIDE_PUNISHED", var_5, 1, 1 );

        if ( !var_0 )
            thread _id_746D( var_2._id_02E2, var_2.angles );

        var_0 = 1;
        wait(var_5);
        maps\mp\_utility::_id_1EF5( "suicidePenalty" );
        self._id_747A = gettime();
        self._id_0308["suicideSpawnDelay"] = 0;
    }

    if ( maps\mp\_utility::_id_51E3() )
    {
        self._id_89E5 = 1;
        self._id_2664 = self._id_02E2;
        self waittill( "stopped_using_remote" );
    }

    if ( !isdefined( self._id_A2AF ) && isdefined( level._id_A2AD[self._id_04A7] ) )
    {
        self._id_A2AF = level._id_A2AD[self._id_04A7];
        level._id_A2AD[self._id_04A7]++;
    }

    var_6 = _id_9382( 0 );

    if ( var_6 > 0 )
    {
        self _meth_82F8( "ui_killcam_time_until_spawn", gettime() + var_6 * 1000 );

        if ( !var_0 )
            thread _id_746D( var_2._id_02E2, var_2.angles );

        var_0 = 1;
        maps\mp\_utility::_id_A03E( var_6, "force_spawn" );
        self notify( "stop_wait_safe_spawn_button" );
    }

    if ( _id_6081() )
    {
        maps\mp\_utility::_id_7FA5( "spawn_info", game["strings"]["press_to_spawn"], undefined, undefined, undefined, undefined, undefined, undefined, 1 );

        if ( !var_0 )
            thread _id_746D( var_2._id_02E2, var_2.angles );

        var_0 = 1;
        _id_A055();
    }

    self._id_A04D = 0;
    maps\mp\_utility::_id_1EF5( "spawn_info" );
    self._id_A2AF = undefined;
    thread _id_89FB();
}

_id_6081()
{
    if ( maps\mp\gametypes\_tweakables::_id_4142( "player", "forcerespawn" ) != 0 )
        return 0;

    if ( !self._id_4745 )
        return 0;

    var_0 = getdvarfloat( "scr_" + level._id_01B3 + "_waverespawndelay" ) > 0;

    if ( var_0 )
        return 0;

    if ( self._id_A152 )
        return 0;

    return 1;
}

_id_A055()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );

    for (;;)
    {
        if ( self _meth_8339() )
            break;

        wait 0.05;
    }
}

_id_73DE( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    waitframe;
    self endon( "end_respawn" );
    wait(var_0);
    maps\mp\_utility::_id_1EF5( "spawn_info" );
}

_id_55ED()
{
    self _meth_82C3();

    if ( maps\mp\_utility::_id_05CB( "specialty_finalstand" ) && !level._id_2A55 )
        maps\mp\_utility::_id_067B( "specialty_finalstand" );

    if ( level._id_2A55 )
        self._id_01E3 = "";

    self _meth_8181( "crouch" );
    self._id_74FD = 1;
    self notify( "revive" );

    if ( isdefined( self._id_8B04 ) )
        self._id_0271 = self._id_8B04;

    self._id_01E6 = self._id_0271;
    common_scripts\utility::_id_0594();

    if ( game["state"] == "postgame" )
        maps\mp\gametypes\_gamelogic::_id_3A35();
}

_id_3F4E()
{
    var_0 = spawn( "script_origin", self._id_02E2 );
    var_0 _meth_8056();
    var_0.angles = self.angles;
    return var_0;
}

_id_852C()
{

}

_id_40D1( var_0 )
{
    if ( !_func_167( var_0._id_02E2 ) )
        return var_0._id_02E2;

    if ( !isdefined( var_0._id_0B03 ) )
        return var_0._id_02E2;

    foreach ( var_2 in var_0._id_0B03 )
    {
        if ( !_func_167( var_2 ) )
            return var_2;
    }

    return var_0._id_02E2;
}

_id_89E6()
{
    self notify( "spawningClientThisFrameReset" );
    self endon( "spawningClientThisFrameReset" );
    wait 0.05;
    level._id_62AC--;
}

_id_803C( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );

    while ( self _meth_842D() && !maps\mp\_utility::_id_4FA6() )
        waittillframeend;

    self _meth_82F8( "ui_options_menu", var_0 );
}

gather_spawn_weapons()
{
    var_0 = [];

    if ( isdefined( self._id_57D6 ) )
    {
        var_0[var_0.size] = maps\mp\_utility::_id_3E67( self._id_57D6 );

        if ( isdefined( self._id_57D6._id_7BFA ) && self._id_57D6._id_7BFA != "none" )
            var_0[var_0.size] = self._id_57D6._id_7BFA;
    }
    else
    {
        if ( isdefined( self._id_0340 ) && self._id_0340 != "none" )
            var_0[var_0.size] = self._id_0340;

        if ( isdefined( self._id_03B3 ) && self._id_03B3 != "none" )
            var_0[var_0.size] = self._id_03B3;
    }

    return var_0;
}

_id_89FB( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "started_spawnPlayer" );

    if ( isdefined( self._id_1F0F ) )
    {

    }
    else
    {

    }

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
    {
        if ( maps\mp\_utility::_id_4FA6() )
            var_1 = 0;
        else
            var_1 = 1;
    }

    if ( var_1 )
    {
        self.spawnplayergivingloadout = 1;
        thread monitordelayedspawnloadouts();
    }

    self._id_56F7 = maps\mp\_utility::_id_403F();
    self._id_93FB = 0;
    var_2 = undefined;
    self._id_9344 = 0;

    if ( self _meth_8443( "ui_options_menu" ) > 0 )
        thread _id_803C( 0 );

    self _meth_82F8( "ui_hud_shake", 0 );
    self _meth_84AF( 0 );
    self _meth_8526();

    if ( !level._id_4C6D && !self._id_4729 )
    {
        level._id_62AC++;

        if ( level._id_62AC > 1 )
        {
            self._id_A04E = 1;
            wait(0.05 * ( level._id_62AC - 1 ));
        }

        thread _id_89E6();
        self._id_A04E = 0;
    }

    if ( var_1 )
    {
        var_3 = undefined;

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
            var_3 = 0;

        maps\mp\gametypes\_class::_id_41F1( self._id_04A7, self._id_1E2E, undefined, var_3 );
        var_4 = gather_spawn_weapons();
        self.loadingplayerweapons = 1;

        if ( !isdefined( self._id_2236 ) )
        {
            if ( _func_1AD( self ) )
                self._id_2236 = maps\mp\gametypes\_class::_id_1B0C();
            else if ( _func_1FF( self ) && self._id_08A0 == "player" )
                self._id_2236 = maps\mp\gametypes\_teams::_id_3F4F();
        }

        maps\mp\gametypes\_teams::applycostume( self._id_57D6._id_6F84, self._id_04A7 );
        var_5 = maps\mp\gametypes\_class::cao_getcharactercamoindex();
        self _meth_857C( var_5 );

        if ( !self _meth_8420( var_4 ) )
        {
            self._id_A04E = 1;
            self _meth_852B( 1 );
            var_6 = gettime() + 3000;

            while ( gettime() < var_6 )
            {
                waittillframeend;
                var_4 = gather_spawn_weapons();

                if ( self _meth_8420( var_4 ) )
                    break;
            }

            self _meth_852B( 0 );

            if ( gettime() >= var_6 )
            {

            }
            else
            {

            }

            self._id_A04E = 0;
        }

        self.loadingplayerweapons = 0;
    }

    if ( isdefined( self._id_39CA ) )
    {
        var_7 = self._id_39CA;
        self._id_39CA = undefined;

        if ( isdefined( self._id_39C9 ) )
        {
            var_8 = self._id_39C9;
            self._id_39C9 = undefined;
        }
        else
            var_8 = ( 0, _func_0B5( 0, 360 ), 0 );
    }
    else if ( isdefined( self._id_8015 ) && isdefined( self._id_8015._id_623E ) )
    {
        var_2 = self._id_8015;

        if ( !isdefined( self._id_8015._id_623E ) )
        {
            self._id_9344 = 1;
            self _meth_82F1( "tactical_spawn" );

            if ( level._id_5FEC )
            {
                foreach ( var_10 in level._id_91F7 )
                {
                    if ( var_10 != self._id_04A7 )
                        self _meth_8003( "tactical_spawn", var_10 );
                }
            }
            else if ( level._id_91EB )
                self _meth_8003( "tactical_spawn", level._id_65B3[self._id_04A7] );
            else
                self _meth_809C( "tactical_spawn" );
        }

        var_7 = self._id_8015._id_6D5D;
        var_8 = self._id_8015.angles;

        if ( isdefined( self._id_8015._id_32C7 ) )
            self._id_8015._id_32C7 delete();

        self._id_8015 delete();
        var_2 = undefined;
    }
    else if ( isdefined( self._id_4817 ) && ( !isdefined( self._id_3821 ) || isdefined( self._id_3821 ) && self._id_3821 ) && level._id_6F09 > 0 && self._id_04A7 == "allies" )
    {
        while ( !isdefined( level._id_0A7E ) )
            wait 0.1;

        var_7 = level._id_0A7E._id_02E2;
        var_8 = level._id_0A7E.angles;
        self._id_3821 = 0;
    }
    else if ( isdefined( self._id_4817 ) && ( !isdefined( self._id_3821 ) || isdefined( self._id_3821 ) && self._id_3821 ) && level._id_6F09 > 0 && self._id_04A7 == "axis" )
    {
        while ( !isdefined( level._id_1217 ) )
            wait 0.1;

        var_7 = level._id_1217._id_02E2;
        var_8 = level._id_1217.angles;
        self._id_3821 = 0;
    }
    else
    {
        var_2 = self [[ level._id_40D2 ]]();
        var_7 = var_2._id_02E2;
        var_8 = var_2.angles;
    }

    _id_8016();
    var_12 = self._id_4745;
    self._id_3693 = undefined;

    if ( !var_0 )
    {
        self._id_5380 = [];
        maps\mp\_utility::_id_9B69( "playing" );
        maps\mp\_utility::_id_1EF2();
        self._id_1AB3 = undefined;
        self._id_0271 = maps\mp\gametypes\_tweakables::_id_4142( "player", "maxhealth" );
        self._id_01E6 = self._id_0271;
        self._id_3A97 = undefined;
        self._id_4745 = 1;
        self._id_03DC = gettime();
        self._id_8A12 = maps\mp\_utility::_id_412E();
        self._id_A1D2 = !isdefined( var_2 );
        self._id_0891 = 0;
        self._id_259A = [];
        self._id_53A5 = 1;
        self._id_6303 = 1;
        self._id_1E24 = undefined;
        self._id_83C6 = 0;
        self._id_83C5 = 0;
        self._id_32AE = [];
        self._id_2515 = 0;

        if ( !_func_0CF( self ) )
            thread maps\mp\gametypes\_damage::_id_1EED();

        self._id_7898 = self._id_0308["score"];

        if ( isdefined( self._id_0308["summary"] ) && isdefined( self._id_0308["summary"]["xp"] ) )
            self._id_A3A4 = self._id_0308["summary"]["xp"];
    }

    self._id_5F7B = level._id_1317;
    self._id_4E3C = 0;
    self._id_0249 = undefined;
    self._id_4C5A = undefined;
    self._id_2B0B = 0;
    self._id_2B0C = 0;
    self._id_2B05 = 0;
    common_scripts\utility::_id_7466();
    self._id_6C8A = [];

    if ( !var_0 )
    {
        self._id_11FC = 5.0;
        var_13 = self._id_0308["lives"];

        if ( var_13 == maps\mp\_utility::_id_3FAA() )
            _id_084D();

        if ( var_13 )
            self._id_0308["lives"]--;

        _id_0844();

        if ( !var_12 || maps\mp\_utility::_id_3BE2() || maps\mp\_utility::_id_3BE2() && level._id_4C6D && self._id_4729 )
            _id_73AB();

        if ( !self._id_A1BE )
        {
            var_14 = 20;

            if ( maps\mp\_utility::_id_412B() > 0 && var_14 < maps\mp\_utility::_id_412B() * 60 / 4 )
                var_14 = maps\mp\_utility::_id_412B() * 60 / 4;

            if ( level._id_4C6D || maps\mp\_utility::_id_412C() < var_14 * 1000 )
                self._id_A1BE = 1;
        }
    }

    if ( level._id_2153 )
        self _meth_82F9( "cg_fov", "65" );

    _id_7464();

    if ( isdefined( var_2 ) )
    {
        maps\mp\gametypes\_spawnlogic::_id_373D( var_2 );
        var_7 = _id_40D1( var_2 );
        var_8 = var_2.angles;
    }
    else
        self._id_55DF = gettime();

    self._id_03DB = var_7;
    self _meth_826B( var_7, var_8 );
    maps\mp\_utility::_id_7F54( level._id_2C7B );

    if ( self._id_04A7 == "allies" )
    {
        self.lastgameteamchosen = "allies";
        self _meth_82F8( "ui_team_selected", maps\mp\gametypes\_menus::getuiteamindex( "allies" ) );
    }
    else if ( self._id_04A7 == "axis" )
    {
        self.lastgameteamchosen = "axis";
        self _meth_82F8( "ui_team_selected", maps\mp\gametypes\_menus::getuiteamindex( "axis" ) );
    }

    if ( isdefined( self._id_0308["cur_kill_count"] ) )
    {
        self _meth_82F8( "ks_count1", self._id_0308["cur_kill_count"] );
        self._id_0308["cur_kill_count"] = undefined;
    }

    if ( var_0 && isdefined( self._id_3692 ) )
    {
        self _meth_8181( self._id_3692 );
        self._id_3692 = undefined;
    }

    [[ level._id_64E9 ]]();

    if ( !var_0 )
    {
        maps\mp\gametypes\_misions::_id_6D5C();

        if ( _func_0CF( self ) && isdefined( level._id_161B ) && isdefined( level._id_161B["player_spawned"] ) )
            self [[ level._id_161B["player_spawned"] ]]();
    }

    maps\mp\gametypes\_class::_id_7F3B( self._id_1E2E );

    if ( isdefined( level._id_2546 ) )
        self [[ level._id_2546 ]]( var_0 );
    else if ( var_1 )
    {
        maps\mp\gametypes\_class::_id_0CAE();
        self notify( "spawnplayer_giveloadout" );
    }

    if ( getdvarint( "camera_thirdPerson" ) )
        maps\mp\_utility::_id_8031( 1 );

    if ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
    {
        maps\mp\_utility::_id_3A32( 1 );
        self _meth_800D();
    }
    else
    {
        maps\mp\_utility::_id_3A32( 0 );
        self _meth_800C();
    }

    self _meth_8301( !getdvarint( "scr_game_disablesprint", 0 ) );

    if ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) || !var_12 && game["state"] == "playing" )
    {
        var_15 = self._id_0308["team"];

        if ( maps\mp\_utility::_id_4E3F() )
            thread maps\mp\gametypes\_hud_message::_id_63DB( game["strings"]["overtime"], game["strings"]["overtime_hint"], undefined, ( 1, 0, 0 ), "mp_last_stand" );

        thread _id_852C();
    }

    if ( maps\mp\_utility::_id_3FDB( "scr_showperksonspawn", 1 ) == 1 && game["state"] != "postgame" )
    {

    }

    waitframe;
    self._id_89E5 = undefined;
    self notify( "spawned_player" );
    level notify( "player_spawned", self );
    thread maps\mp\gametypes\_hardpoints::hardpointitemwaiter();

    if ( game["state"] == "postgame" )
        maps\mp\gametypes\_gamelogic::_id_3A35();

    if ( isdefined( level._id_59EA ) && level._id_59EA )
        self _meth_82F8( "ui_disable_team_change", 1 );
}

monitordelayedspawnloadouts()
{
    common_scripts\utility::_id_A069( "disconnected", "joined_spectators", "spawnplayer_giveloadout" );
    self.spawnplayergivingloadout = undefined;
}

_id_8A0E( var_0, var_1 )
{
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "joined_spectators" );
    _id_4C0D( var_0, var_1 );
}

_id_746D( var_0, var_1 )
{
    _id_4C0D( var_0, var_1 );
}

_id_4C0D( var_0, var_1 )
{
    _id_8016();
    var_2 = self._id_0308["team"];

    if ( isdefined( var_2 ) && var_2 == "spectator" && !level._id_3BDA )
        maps\mp\_utility::_id_1EF5( "spawn_info" );

    maps\mp\_utility::_id_9B69( "spectator" );
    maps\mp\_utility::_id_1EF2();
    self._id_3A97 = undefined;
    self.loadingplayerweapons = undefined;
    _id_7465();
    maps\mp\gametypes\_spectating::_id_8019();
    _id_64EA( var_0, var_1 );

    if ( level._id_91EB && !level._id_8A7C && !self _meth_82CA() )
        self _meth_818A( 0, 128, 512, 4000, 6, 1.8 );
}

_id_408C( var_0 )
{
    if ( var_0 < 0 )
        return undefined;

    for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
    {
        if ( level._id_0323[var_1] _meth_81B5() == var_0 )
            return level._id_0323[var_1];
    }

    return undefined;
}

_id_40A7()
{
    var_0 = "mp_global_intermission";
    var_1 = getentarray( var_0, "classname" );
    var_2 = maps\mp\gametypes\_spawnlogic::_id_40D8( var_1 );
    return var_2;
}

_id_64EA( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        self _meth_82C5( var_0, var_1 );
        self _meth_826B( var_0, var_1 );
        return;
    }

    var_2 = _id_40A7();
    self _meth_82C5( var_2._id_02E2, var_2.angles );
    self _meth_826B( var_2._id_02E2, var_2.angles );
}

_id_89E9()
{
    self endon( "disconnect" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_8016();
    maps\mp\_utility::_id_1EF6();
    maps\mp\_utility::_id_3A32( 1 );
    self _meth_800D();
    self _meth_82F9( "cg_everyoneHearsEveryone", 1 );
    var_0 = self._id_0308["postGameChallenges"];

    if ( level._id_7137 && ( self._id_6E8A || isdefined( var_0 ) && var_0 ) )
    {
        if ( self._id_6E8A )
            self _meth_82F1( "mp_level_up" );
        else if ( isdefined( var_0 ) )
            self _meth_82F1( "mp_challenge_complete" );

        if ( self._id_6E8A > level._id_6E89 )
            level._id_6E89 = 1;

        if ( isdefined( var_0 ) && var_0 > level._id_6E89 )
            level._id_6E89 = var_0;

        var_1 = 7.0;

        if ( isdefined( var_0 ) )
            var_1 = 4.0 + _func_0BF( var_0, 3 );

        while ( var_1 )
        {
            wait 0.25;
            var_1 -= 0.25;
        }
    }

    maps\mp\_utility::_id_9B69( "intermission" );
    maps\mp\_utility::_id_1EF2();
    self._id_3A97 = undefined;
    var_2 = getentarray( "mp_global_intermission", "classname" );
    var_3 = var_2[0];
    self _meth_826B( var_3._id_02E2, var_3.angles );
    self _meth_818A( 0, 128, 512, 4000, 6, 1.8 );
}

_id_89B6()
{
    if ( 1 )
    {
        maps\mp\_utility::_id_3A32( 1 );
        self _meth_800D();
        _id_8A0E();
        maps\mp\_utility::_id_3A32( 1 );
        self _meth_800D();
        return;
    }

    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_8016();
    maps\mp\_utility::_id_1EF6();
    self _meth_82F9( "cg_everyoneHearsEveryone", 1 );
    maps\mp\_utility::_id_9B69( "dead" );
    maps\mp\_utility::_id_1EF2();
    self._id_3A97 = undefined;
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_1 = maps\mp\gametypes\_spawnlogic::_id_40D8( var_0 );
    self _meth_826B( var_1._id_02E2, var_1.angles );
    var_1 _meth_80B3( "tag_origin" );
    self _meth_807E( var_1 );
    self _meth_8005();
    maps\mp\_utility::_id_3A32( 1 );
    self _meth_800D();
    self _meth_818A( 0, 128, 512, 4000, 6, 1.8 );
}

_id_8016()
{
    self _meth_8188();
    self _meth_80B1( "damage_heavy" );
    self._id_2664 = undefined;
}

_id_6226()
{
    waitframe;

    if ( isdefined( self ) )
        level notify( "connecting", self );
}

_id_5848()
{
    if ( isdefined( self._id_0308["totalKillcamsSkipped"] ) )
        _func_12F( "players", self._id_1F0F, "totalKillcamsSkipped", maps\mp\_utility::_id_1E28( self._id_0308["totalKillcamsSkipped"] ) );

    if ( isdefined( self._id_0308["weaponPickupsCount"] ) )
        _func_12F( "players", self._id_1F0F, "weaponPickupsCount", maps\mp\_utility::_id_1E28( self._id_0308["weaponPickupsCount"] ) );

    if ( isdefined( self._id_0308["suicides"] ) )
        _func_12F( "players", self._id_1F0F, "suicidesTotal", maps\mp\_utility::_id_1E28( self._id_0308["suicides"] ) );

    if ( isdefined( self._id_0308["headshots"] ) )
        _func_12F( "players", self._id_1F0F, "headshotsTotal", maps\mp\_utility::_id_1E29( self._id_0308["headshots"] ) );

    if ( isdefined( self._id_0308["pingAccumulation"] ) && isdefined( self._id_0308["pingSampleCount"] ) )
    {
        if ( self._id_0308["pingSampleCount"] > 0 )
        {
            var_0 = maps\mp\_utility::_id_1E28( self._id_0308["pingAccumulation"] / self._id_0308["pingSampleCount"] );
            _func_12F( "players", self._id_1F0F, "averagePing", var_0 );
        }
    }

    if ( maps\mp\_utility::_id_7139() )
    {
        var_1 = 3;
        var_2 = 0;

        for ( var_3 = 0; var_3 < var_1; var_3++ )
        {
            var_4 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "xpMultiplier", var_3 );

            if ( isdefined( var_4 ) && var_4 > var_2 )
                var_2 = var_4;
        }

        if ( var_2 > 0 )
            _func_12F( "players", self._id_1F0F, "xpMultiplier", var_2 );
    }

    if ( isdefined( self._id_0308["summary"] ) && isdefined( self._id_0308["summary"]["clanWarsXP"] ) )
        _func_12F( "players", self._id_1F0F, "clanWarsXp", self._id_0308["summary"]["clanWarsXP"] );

    if ( isdefined( level._id_511D ) && level._id_511D )
        [[ level.hordeupdatetimestats ]]( self );
}

_id_19F3( var_0 )
{
    if ( !isdefined( self._id_2148 ) )
        return;

    maps\mp\gametypes\_damage::handlelaststanddisconnect();
    _func_12F( "players", self._id_1F0F, "disconnectTimeUTC", _func_13C() );
    _func_12F( "players", self._id_1F0F, "disconnectReason", var_0 );

    if ( maps\mp\_utility::_id_7139() )
        maps\mp\_matchdata::_id_5825();

    if ( isdefined( self._id_0308["confirmed"] ) )
        maps\mp\_matchdata::_id_5839();

    if ( isdefined( self._id_0308["denied"] ) )
        maps\mp\_matchdata::_id_583A();

    _id_5848();

    if ( maps\mp\_utility::_id_5194() )
    {
        var_1 = game["roundsPlayed"] + 1;
        _func_12F( "players", self._id_1F0F, "playerQuitRoundNumber", var_1 );

        if ( isdefined( self._id_04A7 ) && ( self._id_04A7 == "allies" || self._id_04A7 == "axis" ) )
        {
            if ( self._id_04A7 == "allies" )
            {
                _func_12F( "players", self._id_1F0F, "playerQuitTeamScore", game["roundsWon"]["allies"] );
                _func_12F( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["roundsWon"]["axis"] );
            }
            else
            {
                _func_12F( "players", self._id_1F0F, "playerQuitTeamScore", game["roundsWon"]["axis"] );
                _func_12F( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["roundsWon"]["allies"] );
            }
        }
    }
    else if ( isdefined( self._id_04A7 ) && ( self._id_04A7 == "allies" || self._id_04A7 == "axis" ) && level._id_91EB )
    {
        if ( self._id_04A7 == "allies" )
        {
            _func_12F( "players", self._id_1F0F, "playerQuitTeamScore", game["teamScores"]["allies"] );
            _func_12F( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["teamScores"]["axis"] );
        }
        else
        {
            _func_12F( "players", self._id_1F0F, "playerQuitTeamScore", game["teamScores"]["axis"] );
            _func_12F( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["teamScores"]["allies"] );
        }
    }

    maps\mp\_skill::processplayer();
    _id_73D2();
    maps\mp\gametypes\_spawnlogic::_id_73AC();
    maps\mp\gametypes\_spawnlogic::_id_73A7();
    var_2 = self _meth_81B5();

    if ( !level._id_91EB )
        game["roundsWon"][self._id_4450] = undefined;

    if ( !level._id_3BDA )
        maps\mp\_utility::_id_584D();

    if ( level._id_8A7C )
    {
        var_3 = level._id_0323;

        if ( var_3.size <= 1 )
            level thread maps\mp\gametypes\_gamelogic::_id_39BC();
    }

    maps\mp\gametypes\_gamelogic::setplayerrank( self );
    _func_104( "script_mp_playerquit: player_name %s, player %d, gameTime %d", self._id_02A7, self._id_1F0F, gettime() );
    var_4 = self _meth_81B5();
    var_5 = self._id_4450;
    _func_164( "Q;" + var_5 + ";" + var_4 + ";" + self._id_02A7 + "\\n" );
    thread maps\mp\_events::_id_2B36();

    if ( level._id_3BDA )
        maps\mp\gametypes\_gamescores::_id_739E();

    if ( isdefined( self._id_04A7 ) )
        _id_73AF();

    if ( self._id_03BC == "playing" && !( isdefined( self._id_3693 ) && self._id_3693 ) )
        _id_73A4( 1 );
    else if ( self._id_03BC == "spectator" || self._id_03BC == "dead" )
        level thread maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_73D2()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
    {
        if ( level._id_0323[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_0323.size - 1; var_1++ )
                level._id_0323[var_1] = level._id_0323[var_1 + 1];

            level._id_0323[var_1] = undefined;
            level notify( "playerCountChanged" );
            break;
        }
    }
}

_id_4D99()
{
    if ( level._id_8A7C || self _meth_82CA() )
        self _meth_82FA( "cg_hudGrenadeIconHeight", "37.5", "cg_hudGrenadeIconWidth", "37.5", "cg_hudGrenadeIconOffset", "75", "cg_hudGrenadePointerHeight", "18", "cg_hudGrenadePointerWidth", "37.5", "cg_hudGrenadePointerPivot", "18 40.5", "cg_fovscale", "0.75" );
    else
        self _meth_82FA( "cg_hudGrenadeIconHeight", "25", "cg_hudGrenadeIconWidth", "25", "cg_hudGrenadeIconOffset", "50", "cg_hudGrenadePointerHeight", "12", "cg_hudGrenadePointerWidth", "25", "cg_hudGrenadePointerPivot", "12 27", "cg_fovscale", "1" );
}

_id_4D98()
{
    setdvar( "cg_drawTalk", 1 );
    setdvar( "cg_drawCrosshair", 1 );
    setdvar( "cg_drawCrosshairNames", 1 );
    setdvar( "cg_hudGrenadeIconMaxRangeFrag", 250 );

    if ( level._id_46CA )
    {
        setdvar( "cg_drawTalk", 3 );
        setdvar( "cg_drawCrosshair", 0 );
        setdvar( "cg_drawCrosshairNames", 1 );
        setdvar( "cg_hudGrenadeIconMaxRangeFrag", 0 );
    }

    if ( isdefined( level._id_0B0A ) && level._id_0B0A )
        setdvar( "cg_drawFriendlyNamesAlways", 1 );
    else
        setdvar( "cg_drawFriendlyNamesAlways", 0 );

    _id_4D99();

    if ( maps\mp\_utility::_id_3FAA() )
        self _meth_82FA( "cg_deadChatWithDead", 1, "cg_deadChatWithTeam", 0, "cg_deadHearTeamLiving", 0, "cg_deadHearAllLiving", 0 );
    else
        self _meth_82FA( "cg_deadChatWithDead", 0, "cg_deadChatWithTeam", 1, "cg_deadHearTeamLiving", 1, "cg_deadHearAllLiving", 0 );

    if ( level._id_91EB )
        self _meth_82FA( "cg_everyonehearseveryone", 0 );

    if ( getdvarint( "scr_hitloc_debug" ) )
    {
        for ( var_0 = 0; var_0 < 6; var_0++ )
            self _meth_82F9( "ui_hitloc_" + var_0, "" );

        self._id_4924 = 1;
    }
}

_id_4012()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < 30; var_1++ )
    {
        foreach ( var_3 in level._id_0323 )
        {
            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_1F0F == var_1 )
            {
                var_0 = 1;
                break;
            }

            var_0 = 0;
        }

        if ( !var_0 )
            return var_1;
    }
}

_id_833B()
{
    self._id_7811 = [];

    for ( var_0 = 1; var_0 <= 4; var_0++ )
    {
        self._id_7811[var_0] = spawnstruct();
        self._id_7811[var_0]._id_04D9 = "";
        self._id_7811[var_0]._id_0211 = undefined;
    }

    if ( !level._id_2153 )
    {
        for ( var_0 = 5; var_0 <= 8; var_0++ )
        {
            self._id_7811[var_0] = spawnstruct();
            self._id_7811[var_0]._id_04D9 = "";
            self._id_7811[var_0]._id_0211 = undefined;
        }
    }
}

_id_5842()
{
    var_0 = _func_2D6();
    var_1 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "consoleIDChunkLow", var_0 );
    var_2 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "consoleIDChunkHigh", var_0 );

    if ( isdefined( var_1 ) && var_1 != 0 )
        _func_12F( "players", self._id_1F0F, "consoleIDChunkLow", var_1 );

    if ( isdefined( var_2 ) && var_2 != 0 )
        _func_12F( "players", self._id_1F0F, "consoleIDChunkHigh", var_2 );

    var_3 = 3;
    var_4 = -1;

    if ( isdefined( var_2 ) && var_2 != 0 && isdefined( var_1 ) && var_1 != 0 )
    {
        for ( var_5 = 0; var_5 < var_3; var_5++ )
        {
            var_6 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_5, "device_id_high" );
            var_7 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_5, "device_id_low" );

            if ( var_6 == var_2 && var_7 == var_1 )
            {
                var_4 = var_5;
                break;
            }
        }
    }

    if ( var_4 == -1 )
    {
        var_8 = 0;

        for ( var_5 = 0; var_5 < var_3; var_5++ )
        {
            var_9 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_5, "deviceUseFrequency" );

            if ( var_9 > var_8 )
            {
                var_8 = var_9;
                var_4 = var_5;
            }
        }
    }

    if ( var_4 == -1 )
        var_4 = 0;

    var_10 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "deviceConnectionHistory", var_4, "onWifi" );

    if ( var_10 )
        _func_12F( "players", self._id_1F0F, "playingOnWifi", 1 );
}

truncateplayername( var_0 )
{
    if ( level._id_0531 && var_0.size > 18 )
    {
        var_1 = common_scripts\utility::_id_8F55( var_0, "]" );

        if ( var_1 >= 0 && common_scripts\utility::_id_8F57( var_0, "[" ) )
            var_0 = _func_122( var_0, var_1 + 1 );
    }

    return var_0;
}

extractplayername( var_0 )
{
    var_1 = common_scripts\utility::_id_8F55( var_0, "]" );

    if ( var_1 >= 0 && common_scripts\utility::_id_8F57( var_0, "[" ) )
        var_0 = _func_122( var_0, var_1 + 1 );

    return var_0;
}

extractclantag( var_0 )
{
    var_1 = common_scripts\utility::_id_8F55( var_0, "]" );
    var_2 = common_scripts\utility::_id_8F55( var_0, "[" );

    if ( var_1 >= 0 && var_2 >= 0 )
    {
        var_0 = _func_122( var_0, var_2 + 1, var_1 );
        return var_0;
    }

    return "";
}

_id_19F0()
{
    var_0 = _id_40A7();
    self _meth_82C5( var_0._id_02E2, var_0.angles );
    thread _id_6226();
    self waittill( "begin" );
    self._id_214F = gettime();
    level notify( "connected", self );
    self._id_2148 = 1;

    if ( self _meth_8298() )
        level._id_0318 = self;

    self._id_9C30 = self _meth_8017();
    _id_4D98();
    _id_4E01();

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self._id_4450 = self _meth_8271();
    self._id_0537 = self _meth_8293();
    self._id_93FB = 0;
    var_1 = 0;

    if ( !isdefined( self._id_0308["clientid"] ) )
    {
        if ( game["clientid"] >= 30 )
            self._id_0308["clientid"] = _id_4012();
        else
            self._id_0308["clientid"] = game["clientid"];

        if ( game["clientid"] < 30 )
            game["clientid"]++;

        var_1 = 1;
    }

    if ( var_1 )
        _id_8F31();

    self._id_1F0F = self._id_0308["clientid"];
    self._id_0308["teamKillPunish"] = 0;
    self._id_0308["suicideSpawnDelay"] = 0;

    if ( var_1 )
        _func_104( "script_mp_playerjoin: player_name %s, player %d, gameTime %d", self._id_02A7, self._id_1F0F, gettime() );

    _func_164( "J;" + self._id_4450 + ";" + self _meth_81B5() + ";" + self._id_02A7 + "\\n" );

    if ( game["clientid"] <= 30 && game["clientid"] != _func_130( "playerCount" ) )
    {
        var_2 = 0;
        var_3 = 0;

        if ( !_func_0CF( self ) && maps\mp\_utility::_id_59E3() )
            self _meth_82A6( self._id_1F0F );

        _func_12F( "playerCount", game["clientid"] );
        _func_12F( "players", self._id_1F0F, "playerID", "xuid", self _meth_8293() );
        _func_12F( "players", self._id_1F0F, "playerID", "ucdIDHigh", self _meth_8294() );
        _func_12F( "players", self._id_1F0F, "playerID", "ucdIDLow", self _meth_8295() );
        _func_12F( "players", self._id_1F0F, "playerID", "clanIDHigh", self _meth_8296() );
        _func_12F( "players", self._id_1F0F, "playerID", "clanIDLow", self _meth_8297() );
        _func_12F( "players", self._id_1F0F, "gamertag", truncateplayername( self._id_02A7 ) );
        _func_12F( "players", self._id_1F0F, "isBot", _func_0CF( self ) );
        var_4 = self _meth_81B5();
        _func_12F( "players", self._id_1F0F, "codeClientNum", maps\mp\_utility::_id_1E28( var_4 ) );
        var_5 = _func_2D6();
        var_3 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "connectionIDChunkLow", var_5 );
        var_2 = self _meth_8226( common_scripts\utility::getstatsgroup_common(), "connectionIDChunkHigh", var_5 );
        _func_12F( "players", self._id_1F0F, "connectionIDChunkLow", var_3 );
        _func_12F( "players", self._id_1F0F, "connectionIDChunkHigh", var_2 );
        _func_134( self, self._id_1F0F );
        _func_12F( "players", self._id_1F0F, "joinType", self _meth_84CB() );
        _func_12F( "players", self._id_1F0F, "connectTimeUTC", _func_13C() );
        _func_12F( "players", self._id_1F0F, "isSplitscreen", _func_140() );
        _id_5842();

        if ( self _meth_8298() )
            _func_12F( "players", self._id_1F0F, "wasAHost", 1 );

        if ( maps\mp\_utility::_id_7139() )
            maps\mp\_matchdata::_id_5837();

        if ( _func_28E( self ) || _func_0CF( self ) )
            var_6 = 1;
        else
            var_6 = 0;

        if ( maps\mp\_utility::_id_59E3() && maps\mp\_utility::_id_0AB0() && !var_6 )
            _func_12F( "players", self._id_1F0F, "team", self._id_03BD );

        if ( maps\mp\_utility::_id_50B1( self ) )
        {
            if ( !isdefined( level._id_59E0 ) )
                level._id_59E0 = [];

            if ( !isdefined( level._id_59E0["botJoinCount"] ) )
                level._id_59E0["botJoinCount"] = 1;
            else
                level._id_59E0["botJoinCount"]++;
        }
    }

    if ( !level._id_91EB )
        game["roundsWon"][self._id_4450] = 0;

    self._id_5659 = [];
    self._id_5654 = [];
    self._id_564F = "";
    self._id_5652 = [];
    self._id_5651 = "";

    if ( !isdefined( self._id_0308["cur_kill_streak"] ) )
    {
        self._id_0308["cur_kill_streak"] = 0;
        self._id_023B = 0;
        self _meth_82F8( "ks_count1", 0 );
    }

    if ( !isdefined( self._id_0308["cur_death_streak"] ) )
        self._id_0308["cur_death_streak"] = 0;

    if ( !isdefined( self._id_0308["cur_kill_streak_for_nuke"] ) )
        self._id_0308["cur_kill_streak_for_nuke"] = 0;

    if ( maps\mp\_utility::_id_7139() )
        self._id_533C = maps\mp\gametypes\_persistence::_id_8D68( "killStreak" );

    self._id_55A5 = -1;
    self._id_91F3 = 0;
    self._id_4745 = 0;
    self._id_A04D = 0;
    self._id_A152 = 0;
    self._id_A1BE = 0;
    self._id_5F7B = level._id_1317;
    self._id_53A5 = 1;
    self._id_6303 = 1;
    self._id_51AB = 0;
    _id_833B();
    level thread _id_5EA7( self );
    thread maps\mp\_flashgrenades::_id_5E5E();
    _id_7462();
    maps\mp\_snd_common_mp::_id_8714();
    waitframe;
    level._id_0323[level._id_0323.size] = self;
    level notify( "playerCountChanged" );
    maps\mp\gametypes\_spawnlogic::_id_084E();
    maps\mp\gametypes\_spawnlogic::_id_0848();

    if ( level._id_91EB )
        self _meth_829B();

    if ( !isdefined( self._id_0308["absoluteJoinTime"] ) )
        self._id_0308["absoluteJoinTime"] = _func_13C();

    if ( game["state"] == "postgame" )
    {
        self._id_214A = 1;
        _id_89E9();
    }
    else
    {
        if ( _func_0CF( self ) && isdefined( level._id_161B ) && isdefined( level._id_161B["think"] ) )
            self thread [[ level._id_161B["think"] ]]();

        level endon( "game_ended" );

        if ( isdefined( level._id_4A39 ) )
        {
            if ( !isdefined( self._id_4A36 ) || self._id_4A36 == 0 )
            {
                self._id_4A36 = 0;
                thread maps\mp\gametypes\_hostmigration::_id_4A3A();
            }
        }

        if ( isdefined( level._id_64C9 ) )
            [[ level._id_64C9 ]]();

        if ( !isdefined( self._id_0308["team"] ) )
        {
            if ( maps\mp\_utility::_id_59E3() && self._id_03BD != "none" )
            {
                thread _id_8A0E();

                if ( isdefined( level._id_A048 ) && level._id_A048 )
                    maps\mp\_utility::_id_3A32( 1 );

                thread maps\mp\gametypes\_menus::_id_8027( self._id_03BD );

                if ( maps\mp\_utility::_id_0AA2() )
                    thread _id_803C( 2 );

                thread _id_52EF();
                return;
            }
            else if ( !maps\mp\_utility::_id_59E3() && !maps\mp\_utility::forceautoassign() && maps\mp\_utility::_id_0AB0() )
            {
                maps\mp\gametypes\_menus::_id_5BB5();
                thread _id_803C( 1 );

                if ( self _meth_842D() )
                    maps\mp\_utility::_id_3A32( 1 );
            }
            else
            {
                thread _id_8A0E();
                self [[ level._id_112A ]]();

                if ( maps\mp\_utility::_id_0AA2() )
                    thread _id_803C( 2 );

                if ( maps\mp\_utility::_id_59E3() )
                    thread _id_52EF();

                return;
            }
        }
        else
        {
            maps\mp\gametypes\_menus::_id_0851( self._id_0308["team"], 1 );

            if ( maps\mp\_utility::_id_51E8( self._id_0308["class"] ) && !maps\mp\_utility::ishodgepodgeph() )
            {
                thread _id_8998();
                return;
            }

            thread _id_8A0E();

            if ( self._id_0308["team"] == "spectator" )
            {
                if ( maps\mp\_utility::_id_0AB0() )
                {
                    maps\mp\gametypes\_menus::_id_13A1();
                    return;
                }

                self [[ level._id_112A ]]();
                return;
                return;
            }

            maps\mp\gametypes\_menus::_id_1398();
        }
    }
}

_id_19F8()
{
    if ( isdefined( self._id_2148 ) && self._id_2148 )
    {
        maps\mp\_utility::_id_9B42();
        maps\mp\_utility::_id_9B33();

        if ( level._id_91EB )
            self _meth_829B();
    }

    if ( self _meth_8298() )
    {
        _id_4D99();
        _func_12F( "players", self._id_1F0F, "wasAHost", 1 );
    }

    var_0 = 0;

    foreach ( var_2 in level._id_0323 )
    {
        if ( !_func_1FE( var_2 ) && !_func_28E( var_2 ) )
            var_0++;
    }

    if ( !_func_1FE( self ) && !_func_28E( self ) )
    {
        level._id_4A38++;

        if ( level._id_4A38 >= var_0 * 2 / 3 )
            level notify( "hostmigration_enoughplayers" );

        self notify( "player_migrated" );
    }
}

_id_39C8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    wait 60.0;

    if ( self._id_4745 )
        return;

    if ( self._id_0308["team"] == "spectator" )
        return;

    if ( !maps\mp\_utility::_id_51E8( self._id_0308["class"] ) )
    {
        self._id_0308["class"] = "CLASS_CUSTOM1";
        self._id_1E2E = self._id_0308["class"];
        maps\mp\gametypes\_class::_id_1EE7();
    }

    thread _id_8998();
}

_id_52EF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "attempted_spawn" );
    var_0 = getdvarfloat( "scr_kick_time", 90 );
    var_1 = getdvarfloat( "scr_kick_mintime", 45 );
    var_2 = gettime();

    if ( self _meth_8298() )
        _id_52F3( 120 );
    else
        _id_52F3( var_0 );

    var_3 = ( gettime() - var_2 ) / 1000;

    if ( var_3 < var_0 - 0.1 && var_3 < var_1 )
        return;

    if ( self._id_4745 )
        return;

    if ( self._id_0308["team"] == "spectator" )
        return;

    _func_13F( self _meth_81B5(), "EXE_PLAYERKICKED_INACTIVE" );
    level thread maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_52F3( var_0 )
{
    level endon( "game_ended" );
    maps\mp\gametypes\_hostmigration::_id_A052( var_0 );
}

_id_4E01()
{
    maps\mp\gametypes\_persistence::_id_4D95();
    self._id_0308["lives"] = maps\mp\_utility::_id_3FAA();

    if ( !isdefined( self._id_0308["deaths"] ) )
    {
        maps\mp\_utility::_id_4DF9( "deaths" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "deaths", 0 );
    }

    self._id_010D = maps\mp\_utility::_id_4081( "deaths" );

    if ( !isdefined( self._id_0308["score"] ) )
    {
        maps\mp\_utility::_id_4DF9( "score" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "score", 0 );
        maps\mp\gametypes\_persistence::_id_8D7B( "round", "timePlayed", 0 );
    }

    self._id_038D = _func_0BC( _func_0BF( maps\mp\_utility::_id_4081( "score" ), 65535 ) );
    self._id_9372["total"] = maps\mp\gametypes\_persistence::_id_8D6B( "round", "timePlayed" );

    if ( !isdefined( self._id_0308["suicides"] ) )
        maps\mp\_utility::_id_4DF9( "suicides" );

    self._id_8FAF = maps\mp\_utility::_id_4081( "suicides" );

    if ( !isdefined( self._id_0308["kills"] ) )
    {
        maps\mp\_utility::_id_4DF9( "kills" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "kills", 0 );
    }

    self._id_0239 = maps\mp\_utility::_id_4081( "kills" );

    if ( !isdefined( self._id_0308["headshots"] ) )
    {
        maps\mp\_utility::_id_4DF9( "headshots" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "headshots", 0 );
    }

    self._id_01E5 = maps\mp\_utility::_id_4081( "headshots" );

    if ( !isdefined( self._id_0308["assists"] ) )
    {
        maps\mp\_utility::_id_4DF9( "assists" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "assists", 0 );
    }

    self.assists = maps\mp\_utility::_id_4081( "assists" );

    if ( !isdefined( self._id_0308["captures"] ) )
    {
        maps\mp\_utility::_id_4DF9( "captures" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "captures", 0 );
    }

    if ( !isdefined( self._id_0308["returns"] ) )
    {
        maps\mp\_utility::_id_4DF9( "returns" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "returns", 0 );
    }

    self._id_74E0 = maps\mp\_utility::_id_4081( "returns" );

    if ( !isdefined( self._id_0308["defends"] ) )
    {
        maps\mp\_utility::_id_4DF9( "defends" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "defends", 0 );
    }

    if ( !isdefined( self._id_0308["plants"] ) )
    {
        maps\mp\_utility::_id_4DF9( "plants" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "plants", 0 );
    }

    if ( !isdefined( self._id_0308["defuses"] ) )
    {
        maps\mp\_utility::_id_4DF9( "defuses" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "defuses", 0 );
    }

    if ( !isdefined( self._id_0308["destructions"] ) )
    {
        maps\mp\_utility::_id_4DF9( "destructions" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "destructions", 0 );
    }

    if ( !isdefined( self._id_0308["confirmed"] ) )
    {
        maps\mp\_utility::_id_4DF9( "confirmed" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "confirmed", 0 );
    }

    if ( !isdefined( self._id_0308["denied"] ) )
    {
        maps\mp\_utility::_id_4DF9( "denied" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "denied", 0 );
    }

    if ( !isdefined( self._id_0308["setbacks"] ) )
    {
        maps\mp\_utility::_id_4DF9( "setbacks" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "setbacks", 0 );
    }

    if ( !isdefined( self._id_0308["humiliations"] ) )
    {
        maps\mp\_utility::_id_4DF9( "humiliations" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "humiliations", 0 );
    }

    if ( !isdefined( self._id_0308["rescues"] ) )
    {
        maps\mp\_utility::_id_4DF9( "rescues" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "rescues", 0 );
    }

    if ( !isdefined( self._id_0308["captureTime"] ) )
    {
        maps\mp\_utility::_id_4DF9( "captureTime" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "captureTime", 0 );
    }

    if ( !isdefined( self._id_0308["banked"] ) )
    {
        maps\mp\_utility::_id_4DF9( "banked" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "banked", 0 );
    }

    if ( !isdefined( self._id_0308["muggings"] ) )
    {
        maps\mp\_utility::_id_4DF9( "muggings" );
        maps\mp\gametypes\_persistence::_id_8D7A( "round", "muggings", 0 );
    }

    if ( !isdefined( self._id_0308["teamkills"] ) )
        maps\mp\_utility::_id_4DF9( "teamkills" );

    if ( !isdefined( self._id_0308["totalTeamKills"] ) )
        maps\mp\_utility::_id_4DF9( "totalTeamKills" );

    if ( !isdefined( self._id_0308["extrascore0"] ) )
        maps\mp\_utility::_id_4DF9( "extrascore0" );

    if ( !isdefined( self._id_0308["extrascore1"] ) )
        maps\mp\_utility::_id_4DF9( "extrascore1" );

    if ( !isdefined( self._id_0308["teamKillPunish"] ) )
        self._id_0308["teamKillPunish"] = 0;

    if ( !isdefined( self._id_0308["suicideSpawnDelay"] ) )
        self._id_0308["suicideSpawnDelay"] = 0;

    maps\mp\_utility::_id_4DF9( "longestStreak" );
    self._id_0308["lives"] = maps\mp\_utility::_id_3FAA();
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "killStreak", 0 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "loss", 0 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "win", 0 );
    maps\mp\gametypes\_persistence::_id_8D7A( "round", "scoreboardType", "none" );

    if ( maps\mp\_utility::_id_7139() )
    {
        if ( !isdefined( self._id_0308["previous_shots"] ) )
            self._id_0308["previous_shots"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "totalShots" );

        if ( !isdefined( self._id_0308["previous_hits"] ) )
            self._id_0308["previous_hits"] = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "hits" );
    }

    if ( !isdefined( self._id_0308["mpWeaponStats"] ) )
        self._id_0308["mpWeaponStats"] = [];

    if ( !isdefined( self._id_0308["totalKillcamsSkipped"] ) )
        self._id_0308["totalKillcamsSkipped"] = 0;

    if ( !isdefined( self._id_0308["weaponPickupsCount"] ) )
        self._id_0308["weaponPickupsCount"] = 0;

    if ( !isdefined( self._id_0308["pingAccumulation"] ) )
        self._id_0308["pingAccumulation"] = 0;

    if ( !isdefined( self._id_0308["pingSampleCount"] ) )
        self._id_0308["pingSampleCount"] = 0;

    if ( !isdefined( self._id_0308["minPing"] ) )
        self._id_0308["minPing"] = 32767;

    if ( !isdefined( self._id_0308["maxPing"] ) )
        self._id_0308["maxPing"] = 0;

    if ( !isdefined( self._id_0308["validationInfractions"] ) )
        self._id_0308["validationInfractions"] = 0;

    if ( !isdefined( self._id_0308["killed_players"] ) )
        self._id_0308["killed_players"] = [];

    if ( !isdefined( self._id_0308["killed_by"] ) )
        self._id_0308["killed_by"] = [];

    if ( !isdefined( self._id_0308["nemesis_tracking"] ) )
        self._id_0308["nemesis_tracking"] = [];

    if ( !isdefined( self._id_0308["nemesis_guid"] ) )
        self._id_0308["nemesis_guid"] = "";

    if ( !isdefined( self._id_0308["prey_guid"] ) )
        self._id_0308["prey_guid"] = "";
}

_id_0852()
{
    level._id_91ED[self._id_04A7]++;

    if ( !isdefined( level._id_91F5 ) )
        level._id_91F5 = [];

    if ( !isdefined( level._id_91F5[self._id_04A7] ) )
        level._id_91F5[self._id_04A7] = [];

    level._id_91F5[self._id_04A7][level._id_91F5[self._id_04A7].size] = self;
    maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_73AF()
{
    level._id_91ED[self._id_04A7]--;

    if ( isdefined( level._id_91F5 ) && isdefined( level._id_91F5[self._id_04A7] ) )
    {
        var_0 = [];

        foreach ( var_2 in level._id_91F5[self._id_04A7] )
        {
            if ( !isdefined( var_2 ) || var_2 == self )
                continue;

            var_0[var_0.size] = var_2;
        }

        level._id_91F5[self._id_04A7] = var_0;
    }
}

_id_0844()
{
    var_0 = self._id_04A7;

    if ( !( isdefined( self._id_0B00 ) && self._id_0B00 ) )
    {
        level._id_4745[var_0]++;
        _id_4C3C( var_0 );
    }

    self._id_0B00 = undefined;

    if ( level._id_09DD["allies"] + level._id_09DD["axis"] > level._id_5A4D )
        level._id_5A4D = level._id_09DD["allies"] + level._id_09DD["axis"];
}

_id_4C3C( var_0 )
{
    level._id_09DD[var_0]++;
}

_id_73A4( var_0 )
{
    var_1 = self._id_04A7;

    if ( isdefined( self._id_907E ) && self._id_907E && isdefined( self._id_528C ) && self._id_528C == self._id_04A7 )
        var_1 = self._id_566D;

    if ( isdefined( var_0 ) )
        _id_7395();

    _id_275E( var_1 );
    return maps\mp\gametypes\_gamelogic::_id_9B1F();
}

_id_275E( var_0 )
{
    level._id_09DD[var_0]--;
}

_id_084D()
{
    level._id_57B9[self._id_04A7] += self._id_0308["lives"];
}

_id_73AB()
{
    level._id_57B9[self._id_04A7]--;
    level._id_57B9[self._id_04A7] = _func_0BC( _func_0E1( 0, level._id_57B9[self._id_04A7] ) );
}

_id_7395()
{
    level._id_57B9[self._id_04A7] -= self._id_0308["lives"];
    level._id_57B9[self._id_04A7] = _func_0BC( _func_0E1( 0, level._id_57B9[self._id_04A7] ) );
}

_id_7464()
{
    self _meth_82F8( "ui_carrying_bomb", 0 );
    self _meth_82F8( "ui_capture_icon", 0 );
    self _meth_82F8( "ui_killcam_end_milliseconds", 0 );
    self _meth_82F8( "ui_killcam_time_until_spawn", 0 );
}

_id_7462()
{
    self _meth_82F8( "ui_carrying_bomb", 0 );
    self _meth_82F8( "ui_capture_icon", 0 );
    self _meth_82F8( "ui_killcam_end_milliseconds", 0 );
}

_id_7465()
{
    self _meth_82F8( "ui_carrying_bomb", 0 );
    self _meth_82F8( "ui_capture_icon", 0 );
    self _meth_82F8( "ui_killcam_end_milliseconds", 0 );
}

_id_7463()
{

}

_id_5EA7( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    _id_2433( var_0 );

    for (;;)
    {
        var_0 waittill( "spawned_player" );
        _id_728A( var_0 );
    }
}

_id_2433( var_0 )
{
    if ( !isdefined( var_0._id_0308["segments"] ) )
        var_0._id_0308["segments"] = [];

    var_0._id_7C58 = var_0._id_0308["segments"];

    if ( !var_0._id_7C58.size )
    {
        var_0._id_7C58["distanceTotal"] = 0;
        var_0._id_7C58["movingTotal"] = 0;
        var_0._id_7C58["movementUpdateCount"] = 0;
        var_0._id_7C58["killDistanceTotal"] = 0;
        var_0._id_7C58["killDistanceCount"] = 0;
    }
}

_id_728A( var_0 )
{
    var_0 endon( "death" );

    while ( !maps\mp\_utility::_id_3BDD( "prematch_done" ) )
        wait 0.5;

    wait 4;
    var_0._id_781B = var_0._id_02E2;
    var_0._id_6E62 = var_0._id_02E2;

    for (;;)
    {
        wait 1;

        if ( var_0 maps\mp\_utility::_id_51E3() )
        {
            var_0 waittill( "stopped_using_remote" );
            var_0._id_781B = var_0._id_02E2;
            var_0._id_6E62 = var_0._id_02E2;
            continue;
        }

        var_0._id_7C58["movementUpdateCount"]++;
        var_0._id_7C58["distanceTotal"] += _func_0EF( var_0._id_781B, var_0._id_02E2 );
        var_0._id_781B = var_0._id_02E2;

        if ( var_0._id_7C58["movementUpdateCount"] % 5 == 0 )
        {
            var_1 = _func_0EF( var_0._id_6E62, var_0._id_02E2 );
            var_0._id_6E62 = var_0._id_02E2;

            if ( var_1 > 16 )
                var_0._id_7C58["movingTotal"]++;
        }
    }
}

_id_A361( var_0 )
{
    if ( level._id_0323.size < 2 )
        return;

    var_0 endon( "disconnect" );

    if ( var_0._id_7C58["movementUpdateCount"] < 30 || var_0._id_7C58["killDistanceCount"] < 1 )
        return;

    var_1 = var_0._id_7C58["movingTotal"] / _func_0BC( var_0._id_7C58["movementUpdateCount"] / 5 ) * 100;
    var_2 = var_0._id_7C58["distanceTotal"] / var_0._id_7C58["movementUpdateCount"];
    var_3 = var_0._id_7C58["killDistanceTotal"] / var_0._id_7C58["killDistanceCount"];
    var_1 = _func_0BF( var_1, _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "MAX", 3 ) ) );
    var_2 = _func_0BF( var_2, _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "MAX", 2 ) ) );
    var_3 = _func_0BF( var_3, _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "MAX", 4 ) ) );
    var_4 = _id_19E1( var_1, var_2, var_3 );
    _func_12F( "players", var_0._id_1F0F, "averageSpeedDuringMatch", var_2 );
    _func_12F( "players", var_0._id_1F0F, "percentageOfTimeMoving", var_1 );
    _func_12F( "players", var_0._id_1F0F, "averageKillDistance", var_3 );
    _func_12F( "players", var_0._id_1F0F, "totalDistanceTravelled", var_0._id_7C58["distanceTotal"] );
    _func_12F( "players", var_0._id_1F0F, "playstyle", maps\mp\_utility::_id_1E28( var_4 ) );

    if ( _func_0CF( var_0 ) )
        return;

    _func_104( "script_PlayerSegments: percentTimeMoving %f, averageSpeed %f, averageKillDistance %f, playStyle %d, name %s", var_1, var_2, var_3, var_4, var_0._id_02A7 );

    if ( !var_0 maps\mp\_utility::_id_7139() )
        return;

    var_5 = 50;
    var_6 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "numPlayStyleTrends" );
    var_6++;

    if ( var_6 > var_5 )
    {
        var_6 = var_5;

        if ( var_5 > 1 )
        {
            for ( var_7 = 0; var_7 < var_5 - 1; var_7++ )
            {
                var_8 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyleTimeStamp", var_7 + 1 );
                var_9 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyle", var_7 + 1 );
                var_0 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyleTimeStamp", var_7, var_8 );
                var_0 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyle", var_7, var_9 );
            }
        }
    }

    var_8 = maps\mp\_utility::gettimeutc_for_stat_recording();
    var_0 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyleTimeStamp", var_6 - 1, var_8 );
    var_0 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "playStyle", var_6 - 1, var_4 );
    var_0 _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "combatRecord", "numPlayStyleTrends", var_6 );
}

_id_19E1( var_0, var_1, var_2 )
{
    var_0 = _id_6162( var_0, _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "Mean", 3 ) ), _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "SD", 3 ) ) );
    var_1 = _id_6162( var_1, _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "Mean", 2 ) ), _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "SD", 2 ) ) );
    var_2 = _id_6162( var_2, _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "Mean", 4 ) ), _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, "SD", 4 ) ) );
    var_3 = ( var_0, var_1, var_2 );
    var_4 = [ "Camper", "Mobile", "Run", "Sniper", "TacCQ" ];
    var_5 = "Camper";
    var_6 = 1000;

    foreach ( var_8 in var_4 )
    {
        var_9 = _id_3F28( var_3, var_8 );

        if ( var_9 < var_6 )
        {
            var_5 = var_8;
            var_6 = var_9;
        }
    }

    return _func_0BC( _func_1BB( "mp/playerSegments.csv", 0, var_5, 1 ) );
}

_id_6162( var_0, var_1, var_2 )
{
    return ( var_0 - var_1 ) / var_2;
}

_id_3F28( var_0, var_1 )
{
    var_2 = ( _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, var_1, 3 ) ), _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, var_1, 2 ) ), _func_0BD( _func_1BB( "mp/playerSegments.csv", 0, var_1, 4 ) ) );
    return _func_0EE( var_0, var_2 );
}

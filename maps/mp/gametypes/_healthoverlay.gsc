// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.mw1_health_regen = 1;
    level._id_478D = 0.55;
    var_0 = 5;
    var_0 = maps\mp\gametypes\_tweakables::_id_4142( "player", "healthregentime" );
    level._id_6CC3 = var_0 * 1000;
    level._id_478E = level._id_6CC3 <= 0;
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D6();
    }
}

_id_64D6()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_6CC4();
    }
}

_id_6CC4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "goliath_equipped" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( self._id_01E6 <= 0 )
        return;

    var_0 = 0;
    var_1 = 0;
    thread _id_6D22();

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( self._id_01E6 <= 0 )
            return;

        var_1 = gettime();
        var_7 = self._id_01E6 / self._id_0271;

        if ( !isdefined( self._id_4792 ) )
            self._id_72D4 = 1;
        else if ( self._id_4792 == 0.33 )
            self._id_72D4 = 0.75;
        else if ( self._id_4792 == 0.66 )
            self._id_72D4 = 0.5;
        else if ( self._id_4792 == 0.99 )
            self._id_72D4 = 0.3;
        else
            self._id_72D4 = 1;

        if ( var_7 <= level._id_478D )
            self._id_0D82 = 1;

        thread _id_4790( var_1, var_7 );
        thread _id_17E5( var_1, var_7, var_2, var_6 );
    }
}

_id_17E5( var_0, var_1, var_2, var_3 )
{
    self notify( "breathingManager" );
    self endon( "breathingManager" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( maps\mp\_utility::_id_51E3() || maps\mp\_utility::_id_512B() )
        return;

    if ( !_func_1AD( self ) )
        return;

    if ( isdefined( var_3 ) && var_3 != "MOD_FALLING" || isdefined( var_2 ) && var_2 > 1 )
        _id_6A3C( var_0 );

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( isdefined( level.playerdobreathing ) && !self [[ level.playerdobreathing ]]() )
        return;

    if ( level.mw1_health_regen )
    {
        self._id_17E6 = var_0 + 6000 * self._id_72D4;
        return;
    }

    self._id_17E6 = var_0 + 3000 * self._id_72D4;
    wait(7 * self._id_72D4);

    if ( !level._id_3BDA && isdefined( self._id_0D82 ) && self._id_0D82 == 1 )
    {
        if ( self _meth_8435() )
            self _meth_82F1( "deaths_door_exit_female" );
        else
            self _meth_82F1( "deaths_door_exit" );

        self._id_0D82 = 0;
    }
}

_id_6A3C( var_0 )
{
    if ( isdefined( level.customplaydamagesound ) )
        self thread [[ level.customplaydamagesound ]]( var_0 );
    else
    {
        if ( isdefined( self._id_258B ) && self._id_258B + 5000 > var_0 )
            return;

        self._id_258B = var_0;
        var_1 = _func_0B4( 1, 8 );

        if ( self._id_04A7 == "axis" )
        {
            if ( self _meth_8435() )
                self _meth_809C( "generic_pain_enemy_fm_" + var_1 );
            else
                self _meth_809C( "generic_pain_enemy_" + var_1 );
        }
        else
        {
            if ( self _meth_8435() )
            {
                self _meth_809C( "generic_pain_friendly_fm_" + var_1 );
                return;
            }

            self _meth_809C( "generic_pain_friendly_" + var_1 );
        }
    }
}

_id_4790( var_0, var_1 )
{
    self notify( "healthRegeneration" );
    self endon( "healthRegeneration" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "goliath_equipped" );
    level endon( "game_ended" );

    if ( level._id_478E )
        return;

    if ( !isdefined( self._id_4BB9 ) )
        self._id_4BB9 = 0;

    if ( self._id_4BB9 == 0 )
        wait(level._id_6CC3 / 1000 * self._id_72D4);
    else
        self._id_4BB9 = 0;

    if ( var_1 < 0.55 )
        var_2 = 1;
    else
        var_2 = 0;

    for (;;)
    {
        if ( level.mw1_health_regen && !var_2 )
        {
            if ( level.mw1_health_regen )
                wait 0.05;

            self._id_01E6 = self._id_0271;
            break;
        }
        else if ( self._id_72D4 == 0.75 )
        {
            wait 0.2;

            if ( self._id_01E6 < self._id_0271 )
                self._id_01E6 += 5;
            else
                break;
        }
        else if ( self._id_72D4 == 0.5 )
        {
            wait 0.05;

            if ( self._id_01E6 < self._id_0271 )
                self._id_01E6 += 2;
            else
                break;
        }
        else if ( self._id_72D4 == 0.3 )
        {
            wait 0.15;

            if ( self._id_01E6 < self._id_0271 )
                self._id_01E6 += 40;
            else
                break;
        }
        else if ( !isdefined( self._id_72D4 ) || self._id_72D4 == 1 )
        {
            if ( !level.mw1_health_regen )
                wait 0.05;

            if ( self._id_01E6 < self._id_0271 )
            {
                if ( level.mw1_health_regen )
                {
                    self._id_01E6 += 10;

                    if ( self._id_01E6 > self._id_0271 )
                        self._id_01E6 = self._id_0271;

                    wait 0.05;
                }
                else
                    self._id_01E6 += 1;
            }
            else
                break;
        }

        if ( self._id_01E6 > self._id_0271 )
            self._id_01E6 = self._id_0271;
    }

    maps\mp\gametypes\_damage::_id_7445();
    maps\mp\gametypes\_misions::_id_478F();
}

_id_9FB2()
{
    self notify( "waiting_to_stop_remote" );
    self endon( "waiting_to_stop_remote" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "stopped_using_remote" );
    maps\mp\_utility::_id_74FA( 0 );
}

_id_6D22()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( getdvarint( "virtuallobbyactive", 0 ) )
        return;

    if ( !_func_1AD( self ) )
        return;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    wait 3;

    for (;;)
    {
        wait 0.2;

        if ( self._id_01E6 <= 0 )
            return;

        if ( self._id_01E6 >= self._id_0271 * 0.55 )
            continue;

        if ( level._id_478E && gettime() > self._id_17E6 )
            continue;

        if ( maps\mp\_utility::_id_51E3() || maps\mp\_utility::_id_512B() )
            continue;

        if ( self _meth_8435() )
            self _meth_82F1( "deaths_door_mp_female" );
        else
            self _meth_82F1( "deaths_door_mp_male" );

        wait 1.284;
        wait(0.1 + _func_0B3( 0.8 ));
    }
}

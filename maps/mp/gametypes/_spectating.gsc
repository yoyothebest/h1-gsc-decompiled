// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level._id_8A4A["allies"] = spawnstruct();
    level._id_8A4A["axis"] = spawnstruct();
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64B4();
        var_0 thread _id_64B3();
        var_0 thread _id_64EB();
    }
}

_id_64B4()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_8019();
    }
}

_id_64B3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        _id_8019();

        if ( !maps\mp\_utility::_id_4FA6() && ( self _meth_842D() || isdefined( self._id_0308["mlgSpectator"] ) && self._id_0308["mlgSpectator"] ) )
        {
            self _meth_84FD( 1 );

            if ( game["roundsPlayed"] > 0 )
                self _meth_82F8( "ui_use_mlg_hud", 1 );
        }
    }
}

updatemlgicons()
{
    self endon( "disconnect" );

    if ( self _meth_842D() )
    {
        for (;;)
        {
            level waittill( "player_spawned", var_0 );
            var_1 = var_0._id_8A4C;

            if ( isdefined( var_1 ) )
            {
                if ( isdefined( var_1._id_0336 ) )
                    self _meth_852C( var_1._id_0336 );

                if ( isdefined( var_1._id_03AA ) )
                    self _meth_852C( var_1._id_03AA );
            }
        }
    }
}

_id_64EB()
{
    self endon( "disconnect" );
    thread updatemlgicons();

    for (;;)
    {
        self waittill( "spectating_cycle" );
        var_0 = self _meth_8299();

        if ( isdefined( var_0 ) )
        {
            self _meth_82C1( var_0, 6 );

            if ( self _meth_842D() )
                _id_9B70( var_0 );
        }
    }
}

allowallyteamspectating()
{
    while ( !isdefined( level._id_8A4A ) )
        wait 0.05;

    level._id_8A4A["allies"].allowallyspectate = 1;
    level._id_8A4A["axis"].allowallyspectate = 1;
    _id_9B72();
}

_id_9B72()
{
    level endon( "game_ended" );

    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
        level._id_0323[var_0] _id_8019();
}

_id_8019()
{
    if ( level._id_3BDA && gettime() - level._id_3BDC >= 2000 )
    {
        if ( level._id_5FEC )
        {
            for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
                self _meth_826F( level._id_91F7[var_0], 0 );
        }
        else
        {
            self _meth_826F( "allies", 0 );
            self _meth_826F( "axis", 0 );
        }

        self _meth_826F( "freelook", 0 );
        self _meth_826F( "none", 1 );
        return;
    }

    var_1 = maps\mp\gametypes\_tweakables::_id_4142( "game", "spectatetype" );
    var_2 = maps\mp\gametypes\_tweakables::_id_4142( "game", "lockspectatepov" );
    var_3 = self._id_03BD;

    if ( var_1 == 1 )
    {
        var_4 = self.lastgameteamchosen;

        if ( isdefined( var_4 ) )
            var_3 = var_4;
    }

    if ( self _meth_842D() && !maps\mp\_utility::_id_4FA6() )
        var_1 = 2;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        var_1 = 1;

    switch ( var_1 )
    {
        case 0:
            if ( level._id_5FEC )
            {
                for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
                    self _meth_826F( level._id_91F7[var_0], 0 );
            }
            else
            {
                self _meth_826F( "allies", 0 );
                self _meth_826F( "axis", 0 );
            }

            self _meth_826F( "freelook", 0 );
            self _meth_826F( "none", 0 );
            break;
        case 1:
            if ( !level._id_91EB )
            {
                self _meth_826F( "allies", 1 );
                self _meth_826F( "axis", 1 );
                self _meth_826F( "none", 1 );
                self _meth_826F( "freelook", 0 );
            }
            else if ( isdefined( var_3 ) && ( var_3 == "allies" || var_3 == "axis" ) && !level._id_5FEC )
            {
                self _meth_826F( var_3, 1 );
                self _meth_826F( maps\mp\_utility::_id_4067( var_3 ), 0 );
                self _meth_826F( "freelook", 0 );
                self _meth_826F( "none", 0 );
            }
            else if ( isdefined( var_3 ) && _func_120( var_3, "team_" ) && level._id_5FEC )
            {
                for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
                {
                    if ( var_3 == level._id_91F7[var_0] )
                    {
                        self _meth_826F( level._id_91F7[var_0], 1 );
                        continue;
                    }

                    self _meth_826F( level._id_91F7[var_0], 0 );
                }

                self _meth_826F( "freelook", 0 );
                self _meth_826F( "none", 0 );
            }
            else
            {
                if ( level._id_5FEC )
                {
                    for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
                        self _meth_826F( level._id_91F7[var_0], 0 );
                }
                else
                {
                    self _meth_826F( "allies", 0 );
                    self _meth_826F( "axis", 0 );
                }

                self _meth_826F( "freelook", 0 );
                self _meth_826F( "none", 0 );
            }

            break;
        case 2:
            if ( level._id_5FEC )
            {
                for ( var_0 = 0; var_0 < level._id_91F7.size; var_0++ )
                    self _meth_826F( level._id_91F7[var_0], 1 );
            }
            else
            {
                self _meth_826F( "allies", 1 );
                self _meth_826F( "axis", 1 );
            }

            self _meth_826F( "freelook", 1 );
            self _meth_826F( "none", 1 );
            break;
    }

    var_5 = self _meth_8293();

    if ( !self _meth_842D() )
    {
        switch ( var_2 )
        {
            case 0:
                self _meth_8270( var_5, "freelook" );
                break;
            case 1:
                if ( level._id_91EB )
                    self _meth_826F( "none", 0 );

                self _meth_826F( "freelook", 0 );
                self _meth_8270( var_5, "first_person" );
                break;
            case 2:
                if ( level._id_91EB )
                    self _meth_826F( "none", 0 );

                self _meth_826F( "freelook", 0 );
                self _meth_8270( var_5, "third_person" );
                break;
        }
    }

    if ( isdefined( var_3 ) && ( var_3 == "axis" || var_3 == "allies" ) )
    {
        if ( maps\mp\_utility::_id_5092( level._id_8A4A[var_3]._id_0AA9 ) )
            self _meth_826F( "freelook", 1 );

        if ( maps\mp\_utility::_id_5092( level._id_8A4A[var_3].allowallyspectate ) )
            self _meth_826F( var_3, 1 );

        if ( maps\mp\_utility::_id_5092( level._id_8A4A[var_3]._id_0AA7 ) )
            self _meth_826F( maps\mp\_utility::_id_4067( var_3 ), 1 );
    }
}

_id_9B71( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_1 ) )
    {
        var_1 = maps\mp\_utility::_id_8F5C( var_1, "_mp" );
        var_1 = _func_1BF( "mp/statsTable.csv", 4, var_1 );
    }

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self _meth_82F8( var_0 + "weapon", var_1 );

    if ( var_3 != "none" )
    {
        var_5 = maps\mp\gametypes\_class::attachkitnametoid( var_3 );
        self _meth_82F8( var_0 + "attachkit", var_5 );
    }
    else
    {
        self _meth_82F8( var_0 + "attachkit", 0 );

        for ( var_6 = 0; var_6 < var_2.size; var_6++ )
        {
            var_7 = undefined;

            if ( isdefined( var_2[var_6] ) )
            {
                var_7 = maps\mp\_utility::_id_0E02( var_2[var_6] );
                var_7 = _func_1BF( "mp/attachmentTable.csv", 3, var_7 );
            }

            if ( !isdefined( var_7 ) )
                var_7 = 0;

            self _meth_82F8( var_0 + "attachment_" + var_6, var_7 );
        }
    }

    if ( var_4 != "none" && var_4 != "base" )
    {
        var_8 = maps\mp\gametypes\_class::furniturekitnametoid( var_4 );
        self _meth_82F8( var_0 + "furniturekit", var_8 );
    }
    else
        self _meth_82F8( var_0 + "furniturekit", 0 );
}

_id_9B70( var_0 )
{
    var_1 = var_0._id_8A4C;
    _id_9B71( "ui_mlg_loadout_primary_", var_1._id_0336, [ var_1._id_6F82, var_1._id_0338, var_1._id_0339 ], var_1._id_033B, var_1._id_033D );
    _id_9B71( "ui_mlg_loadout_secondary_", var_1._id_03AA, [ var_1._id_7BF7, var_1._id_03AC ], var_1._id_03AE, var_1._id_03B0 );
    var_2 = var_1._id_02D6;

    if ( isdefined( var_2 ) )
        var_2 = _func_1BF( "mp/perkTable.csv", 1, var_2 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self _meth_82F8( "ui_mlg_loadout_equipment_0", var_2 );
    var_3 = var_1._id_0155;

    if ( isdefined( var_3 ) )
        var_3 = _func_1BF( "mp/perkTable.csv", 1, var_3 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self _meth_82F8( "ui_mlg_loadout_equipment_1", var_3 );
    self _meth_82F8( "ui_mlg_loadout_equipment_2", -1 );

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        var_5 = var_1._id_0306[var_4];

        if ( isdefined( var_5 ) )
            var_5 = _func_1BF( "mp/perkTable.csv", 1, var_5 );

        if ( !isdefined( var_5 ) )
            var_5 = 0;

        self _meth_82F8( "ui_mlg_loadout_perk_" + var_4, var_5 );
    }
}

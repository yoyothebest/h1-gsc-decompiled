// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2865( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level._id_0323 )
    {
        if ( isdefined( var_2 ) )
            var_2._id_4E40 = undefined;
    }

    var_0 notify( "death" );
    var_0 delete();
}

_id_5EB2()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_6E4E = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "portabl_radar" || var_1 == "portable_radar_mp" )
        {
            if ( !_func_1A1( self ) )
            {
                var_0 delete();
                continue;
            }

            self._id_6E4E = common_scripts\utility::_id_0D01( self._id_6E4E );

            if ( self._id_6E4E.size >= level._id_5A4A )
                _id_2865( self._id_6E4E[0] );

            var_0 waittill( "missile_stuck" );
            var_2 = var_0._id_02E2;

            if ( isdefined( var_0 ) )
                var_0 delete();

            var_3 = spawn( "script_model", var_2 );
            var_3._id_01E6 = 100;
            var_3._id_04A7 = self._id_04A7;
            var_3._id_02E5 = self;
            var_3 _meth_82BC( 1 );
            var_3 _meth_800F( self );
            var_3 _id_6E52( self );
            var_3 thread maps\mp\gametypes\_weapons::_id_23E6( "weapon_radar_bombsquad", "tag_origin", self );
            var_3 thread _id_6E51();
            thread _id_6E54( var_3 );
            self._id_6E4E[self._id_6E4E.size] = var_3;
        }
    }
}

_id_6E52( var_0 )
{
    self _meth_80B3( "weapon_radar" );

    if ( level._id_91EB )
        maps\mp\_entityheadicons::_id_8028( self._id_04A7, ( 0, 0, 20 ) );
    else
        maps\mp\_entityheadicons::_id_7FE5( var_0, ( 0, 0, 20 ) );

    thread _id_6E50( var_0 );
    thread _id_6E53( var_0 );
    thread _id_6E4F();
    thread maps\mp\_utility::_id_6240( var_0 );
}

_id_6E54( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    common_scripts\utility::_id_A069( "disconnect", "joined_team", "joined_spectators", "spawned_player" );
    level thread _id_2865( var_0 );
}

_id_6E4F()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 2.0;
        self _meth_809C( "sentry_gun_beep" );
    }
}

_id_6E50( var_0 )
{
    self endon( "death" );
    self._id_01E6 = 999999;
    self._id_0271 = 100;
    self._id_0101 = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !maps\mp\gametypes\_weapons::_id_3AA6( self._id_02E5, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
            var_11 = maps\mp\_utility::_id_8F5C( var_10, "_lefthand" );
        else
            var_11 = undefined;

        if ( isdefined( var_11 ) )
        {
            switch ( var_11 )
            {
                case "concussion_grenade_mp":
                case "flash_grenade_mp":
                case "smoke_grenade_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( maps\mp\_utility::_id_5150( var_5 ) )
            self._id_0101 += self._id_0271;

        if ( isdefined( var_9 ) && var_9 & level._id_4B5C )
            self._id_A1C5 = 1;

        self._id_A1C3 = 1;
        self._id_0101 += var_1;

        if ( _func_1AD( var_2 ) )
            var_2 maps\mp\gametypes\_damagefeedback::_id_9B0C( "portable_radar" );

        if ( self._id_0101 >= self._id_0271 )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
                var_2 notify( "destroyed_explosive" );

            self _meth_809C( "sentry_explode" );
            self._id_265A = playfx( common_scripts\utility::_id_3FA8( "equipment_explode" ), self._id_02E2 );
            self _meth_813C();
            var_2 thread _id_2865( self );
        }
    }
}

_id_6E53( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self _meth_80DC( "HINT_NOICON" );
    self _meth_80DD( &"MP_PATCH_PICKUP_PORTABLE_RADAR" );
    maps\mp\_utility::_id_8005( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = var_0 _meth_82F6( "portable_radar_mp" );

        if ( var_1 < _func_1E6( "portable_radar_mp" ) )
        {
            var_0 _meth_82F1( "scavenger_pack_pickup" );
            var_0 _meth_82F4( "portable_radar_mp", var_1 + 1 );
            var_0 thread _id_2865( self );
        }
    }
}

_id_6E51()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 512;

    for (;;)
    {
        foreach ( var_2 in level._id_0323 )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( level._id_91EB && var_2._id_04A7 == self._id_04A7 )
                continue;

            if ( var_2 maps\mp\_utility::_id_05CB( "specialty_class_lowprofile" ) )
                continue;

            var_3 = _func_0F0( self._id_02E2, var_2._id_02E2 );

            if ( _func_0F0( var_2._id_02E2, self._id_02E2 ) < var_0 * var_0 )
            {
                var_2._id_4E40 = self._id_02E5;
                continue;
            }

            var_2._id_4E40 = undefined;
        }

        wait 0.05;
    }
}

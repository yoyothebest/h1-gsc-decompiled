// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    if ( level._id_5FEC )
    {
        foreach ( var_1 in level._id_91F7 )
        {
            level._id_51D0[var_1] = 0;
            level._id_8A19[var_1] = [];
        }
    }
    else
    {
        level._id_51D0["allies"] = 0;
        level._id_51D0["axis"] = 0;
        level._id_8A19["allies"] = [];
        level._id_8A19["axis"] = [];
    }

    level._id_1358 = [];
    level._id_1358["reload"] = "inform_reloading_generic";
    level._id_1358["frag_out"] = "inform_attack_grenade";
    level._id_1358["flash_out"] = "inform_attack_flashbang";
    level._id_1358["smoke_out"] = "inform_attack_smoke";
    level._id_1358["conc_out"] = "inform_attack_stun";
    level._id_1358["c4_plant"] = "inform_attack_thwc4";
    level._id_1358["claymore_plant"] = "inform_plant_claymore";
    level._id_1358["kill"] = "inform_killfirm_infantry";
    level._id_133F = [];

    foreach ( var_5, var_4 in level._id_8A19 )
    {
        level._id_9F33[var_5]["m"] = 0;
        level._id_9F33[var_5]["fe"] = 0;
    }

    var_6 = getdvar( "g_gametype" );
    level._id_51C7 = 1;

    if ( var_6 == "war" || var_6 == "conf" || var_6 == "dom" )
        level._id_51C7 = 0;

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

        if ( maps\mp\_utility::_id_5092( level._id_9E56 ) )
            continue;

        self._id_133F = [];
        var_0 = maps\mp\gametypes\_teams::_id_4120( self._id_04A7 );

        if ( !isdefined( self._id_0308["voiceIndex"] ) )
        {
            var_1 = 4;
            var_2 = 4;
            var_3 = "m";

            if ( !_func_1FF( self ) && self _meth_8435() )
                var_3 = "fe";

            self._id_0308["voiceNum"] = level._id_9F33[self._id_04A7][var_3] + 1;

            if ( var_3 == "fe" )
                level._id_9F33[self._id_04A7][var_3] = ( level._id_9F33[self._id_04A7][var_3] + 1 ) % var_2;
            else
                level._id_9F33[self._id_04A7][var_3] = ( level._id_9F33[self._id_04A7][var_3] + 1 ) % var_1;

            self._id_0308["voicePrefix"] = var_0 + self._id_0308["voiceNum"] + var_3 + "_";
        }

        if ( level._id_8A7C )
            continue;

        if ( !level._id_91EB )
            continue;

        thread _id_731E();
        thread _id_440E();
        thread claymoretracking();
    }
}

_id_731E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload_start" );
        level thread _id_7826( self, "reload", 0 );
    }
}

_id_440E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "h1_fraggrenade_mp" )
        {
            level thread _id_7826( self, "frag_out", 0 );
            continue;
        }

        if ( var_1 == "h1_flashgrenade_mp" )
        {
            level thread _id_7826( self, "flash_out", 0 );
            continue;
        }

        if ( var_1 == "h1_concussiongrenade_mp" )
        {
            level thread _id_7826( self, "conc_out", 0 );
            continue;
        }

        if ( var_1 == "h1_smokegrenade_mp" )
        {
            level thread _id_7826( self, "smoke_out", 0 );
            continue;
        }

        if ( var_1 == "h1_c4_mp" )
            level thread _id_7826( self, "c4_plant", 0 );
    }
}

claymoretracking()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "begin_firing" );
        var_0 = self _meth_830E();

        if ( var_0 == "h1_claymore_mp" )
            level thread _id_7826( self, "claymore_plant", 0 );
    }
}

_id_7827( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    wait(var_2);

    if ( !isdefined( var_3 ) && isdefined( 0 ) )
        var_3 = 0;

    _id_7826( var_0, var_1, var_3, var_4 );
}

_id_7826( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( isdefined( level._id_1CA7 ) && level._id_1CA7 )
        return;

    if ( isdefined( var_0._id_133C ) && var_0._id_133C == 1 )
        return;

    if ( _id_51B2( var_0 ) )
        return;

    if ( var_0._id_04A7 != "spectator" )
    {
        var_4 = var_0._id_0308["voicePrefix"];

        if ( isdefined( level._id_1358[var_1] ) )
        {
            var_5 = var_4 + level._id_1358[var_1];

            switch ( var_1 )
            {
                case "callout_sniper":
                case "callout_hover":
                case "callout_shield":
                case "callout_cloak":
                case "callout_overclock":
                    var_1 = "callout_generic";
                    break;
            }
        }
        else
        {
            _id_57F5( var_1 );
            var_5 = var_4 + "co_loc_" + var_1;
            var_0 thread _id_2D82( var_5, var_1 );
            var_1 = "callout_location";
        }

        var_0 _id_9AFF( var_1 );
        var_0 thread _id_2D7C( var_5, var_2, var_3 );
    }
}

_id_2D7C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = self._id_0308["team"];
    level _id_0830( self, var_3 );

    if ( var_2 && ( !level._id_51C7 || !maps\mp\_utility::_id_05CB( "specialty_coldblooded" ) && ( _func_1FF( self ) || self _meth_82E7() ) ) )
    {
        if ( _func_1FF( self ) || level._id_09DD[var_3] > 3 )
            thread _id_2D7D( var_0, var_3 );
    }

    if ( !_func_1CA( var_0 ) )
    {
        level _id_73DF( self, var_3 );
        return;
    }

    if ( _func_1FF( self ) || isdefined( var_1 ) && var_1 )
        self _meth_8003( var_0, var_3 );
    else
        self _meth_8003( var_0, var_3, self );

    thread _id_9363( var_0 );
    common_scripts\utility::_id_A069( var_0, "death", "disconnect" );
    level _id_73DF( self, var_3 );
}

_id_2D7D( var_0, var_1 )
{
    if ( _func_1CA( var_0 ) )
    {
        foreach ( var_3 in level._id_91F7 )
        {
            if ( var_3 != var_1 )
                self _meth_8003( var_0, var_3 );
        }
    }
}

_id_2D82( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_A070( var_0, "death", "disconnect" );

    if ( var_2 == var_0 )
    {
        var_3 = self._id_04A7;

        if ( !_func_1FF( self ) )
            var_4 = self _meth_8435();
        else
            var_4 = 0;

        var_5 = self._id_0308["voiceNum"];
        var_6 = self._id_02E2;
        wait 0.5;

        foreach ( var_8 in level._id_669D )
        {
            if ( !isdefined( var_8 ) )
                continue;

            if ( var_8 == self )
                continue;

            if ( !maps\mp\_utility::_id_5189( var_8 ) )
                continue;

            if ( var_8._id_04A7 != var_3 )
                continue;

            if ( !_func_1FF( var_8 ) )
                var_9 = var_8 _meth_8435();
            else
                var_9 = 0;

            if ( ( var_5 != var_8._id_0308["voiceNum"] || var_4 != var_9 ) && _func_0F0( var_6, var_8._id_02E2 ) <= 262144 && !_id_51B2( var_8 ) )
            {
                var_10 = var_8._id_0308["voicePrefix"];
                var_11 = var_10 + "co_loc_" + var_1 + "_echo";

                if ( common_scripts\utility::_id_2006() && _func_1CA( var_11 ) )
                    var_12 = var_11;
                else
                    var_12 = var_10 + level._id_1358["callout_response_generic"];

                var_8 thread _id_2D7C( var_12, 0, 0 );
                break;
            }
        }
    }
}

_id_9363( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 2.0;
    self notify( var_0 );
}

_id_51B2( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( !isdefined( var_1 ) )
        var_1 = 1000;

    var_2 = var_1 * var_1;

    if ( isdefined( var_0 ) && isdefined( var_0._id_04A7 ) && var_0._id_04A7 != "spectator" )
    {
        for ( var_3 = 0; var_3 < level._id_8A19[var_0._id_04A7].size; var_3++ )
        {
            var_4 = level._id_8A19[var_0._id_04A7][var_3];

            if ( var_4 == var_0 )
                return 1;

            if ( !isdefined( var_4 ) )
                continue;

            if ( _func_0F0( var_4._id_02E2, var_0._id_02E2 ) < var_2 )
                return 1;
        }
    }

    return 0;
}

_id_0830( var_0, var_1 )
{
    level._id_8A19[var_1][level._id_8A19[var_1].size] = var_0;
}

_id_73DF( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_8A19[var_1].size; var_3++ )
    {
        if ( level._id_8A19[var_1][var_3] == var_0 )
            continue;

        var_2[var_2.size] = level._id_8A19[var_1][var_3];
    }

    level._id_8A19[var_1] = var_2;
}

_id_2AF6( var_0 )
{
    var_0._id_133C = 1;
}

_id_3109( var_0 )
{
    var_0._id_133C = undefined;
}

_id_9AFF( var_0 )
{
    var_1 = self._id_0308["team"];
    self._id_133F["last_say_time"][var_0] = gettime();
    level._id_133F["last_say_time"][var_1][var_0] = gettime();
    level._id_133F["last_say_pos"][var_1][var_0] = self._id_02E2;
}

_id_400A()
{
    var_0 = _id_3CBF();
    var_0 = common_scripts\utility::_id_0CF5( var_0 );

    if ( var_0.size )
    {
        foreach ( var_2 in var_0 )
        {
            if ( !_id_57F7( var_2 ) )
                return var_2;
        }

        foreach ( var_2 in var_0 )
        {
            if ( !_id_57F8( var_2 ) )
                return var_2;
        }
    }

    return undefined;
}

_id_414B( var_0 )
{
    var_1 = _id_3CBF();
    var_1 = common_scripts\utility::_id_0CF5( var_1 );

    if ( var_1.size )
    {
        foreach ( var_3 in var_1 )
        {
            if ( !_id_57F7( var_3 ) && var_0 _id_1AB0( var_3 ) )
                return var_3;
        }

        foreach ( var_3 in var_1 )
        {
            if ( !_id_57F8( var_3 ) && var_0 _id_1AB0( var_3 ) )
                return var_3;
        }
    }

    return undefined;
}

_id_3CBF()
{
    var_0 = anim._id_134A;
    var_1 = self _meth_80AC( var_0 );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4._id_57FB ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_9AA2()
{
    if ( isdefined( anim._id_134A ) )
        anim._id_134A = common_scripts\utility::_id_0D01( anim._id_134A );
}

_id_503C()
{
    var_0 = _id_3CBF();

    foreach ( var_2 in var_0 )
    {
        if ( !_id_57F8( var_2 ) )
            return 1;
    }

    return 0;
}

_id_57F7( var_0 )
{
    var_1 = _id_57FA( var_0._id_57FB[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    return 1;
}

_id_57F8( var_0 )
{
    var_1 = _id_57FA( var_0._id_57FB[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = var_1 + 25000;

    if ( gettime() < var_2 )
        return 1;

    return 0;
}

_id_57F5( var_0 )
{
    anim._id_57FC[var_0] = gettime();
}

_id_57FA( var_0 )
{
    if ( isdefined( anim._id_57FC[var_0] ) )
        return anim._id_57FC[var_0];

    return undefined;
}

_id_1AB0( var_0 )
{
    foreach ( var_2 in var_0._id_57FB )
    {
        var_3 = _id_400B( "co_loc_" + var_2 );
        var_4 = _id_409F( var_2, 0 );
        var_5 = _id_400B( "concat_loc_" + var_2 );
        var_6 = _func_1CA( var_3 ) || _func_1CA( var_4 ) || _func_1CA( var_5 );

        if ( var_6 )
            return var_6;
    }

    return 0;
}

_id_1AC2( var_0 )
{
    var_1 = var_0._id_57FB;

    foreach ( var_3 in var_1 )
    {
        if ( _id_50D3( var_3, self ) )
            return 1;
    }

    return 0;
}

_id_3F24( var_0 )
{
    var_1 = undefined;
    var_2 = self._id_57FB;

    foreach ( var_4 in var_2 )
    {
        if ( _id_50D4( var_4, var_0 ) && !isdefined( self._id_7073 ) )
        {
            var_1 = var_4;
            break;
        }

        if ( _id_50D5( var_4 ) )
            var_1 = var_4;
    }

    return var_1;
}

_id_50D5( var_0 )
{
    return _func_120( var_0, "_report" );
}

_id_50D3( var_0, var_1 )
{
    var_2 = var_1 _id_400B( "concat_loc_" + var_0 );

    if ( _func_1CA( var_2 ) )
        return 1;

    return 0;
}

_id_50D4( var_0, var_1 )
{
    if ( _func_120( var_0, "_qa" ) && _func_1CA( var_0 ) )
        return 1;

    var_2 = var_1 _id_409F( var_0, 0 );

    if ( _func_1CA( var_2 ) )
        return 1;

    return 0;
}

_id_400B( var_0 )
{
    var_1 = self._id_0308["voicePrefix"] + var_0;
    return var_1;
}

_id_409F( var_0, var_1 )
{
    var_2 = _id_400B( var_0 );
    var_2 += ( "_qa" + var_1 );
    return var_2;
}

_id_132E()
{
    return 0;
}

_id_132F()
{
    return 0;
}

_id_1335( var_0 )
{

}

_id_1336( var_0 )
{

}

_id_1330( var_0 )
{

}

_id_3EE9( var_0 )
{

}

_id_1337( var_0, var_1, var_2 )
{

}

_id_3A71( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 262144;

    foreach ( var_2 in level._id_0323 )
    {
        if ( var_2._id_04A7 == self._id_0308["team"] )
        {
            if ( var_2 != self && _func_0F0( var_2._id_02E2, self._id_02E2 ) <= var_0 )
                return 1;
        }
    }

    return 0;
}

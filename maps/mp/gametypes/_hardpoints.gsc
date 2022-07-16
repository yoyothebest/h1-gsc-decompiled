// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheitem( "radar_mp" );
    precacheitem( "airstrike_mp" );
    precacheitem( "helicopter_mp" );
    precacheitem( "artillery_mp" );
    level.killstreaksenabled = 1;
    level.hardpointitems = [];
    level.hardpointitems["radar_mp"] = getdvarint( "scr_killstreak_kills_uav", 3 );
    level.hardpointitems["airstrike_mp"] = getdvarint( "scr_killstreak_kills_airstrike", 5 );
    level.hardpointitems["helicopter_mp"] = getdvarint( "scr_killstreak_kills_heli", 7 );
    level.maxkillstreakforaward = 0;

    foreach ( var_2, var_1 in level.hardpointitems )
    {
        if ( level.maxkillstreakforaward < var_1 )
            level.maxkillstreakforaward = var_1;
    }

    level.hardpointhints["radar_mp"] = &"MP_EARNED_RADAR";
    level.hardpointhints["airstrike_mp"] = &"MP_EARNED_AIRSTRIKE";
    level.hardpointhints["helicopter_mp"] = &"MP_EARNED_HELICOPTER";
    level.hardpointhints["radar_mp_not_available"] = &"MP_RADAR_NOT_AVAILABLE";
    level.hardpointhints["airstrike_mp_not_available"] = &"MP_AIRSTRIKE_NOT_AVAILABLE";
    level.hardpointhints["helicopter_mp_not_available"] = &"MP_HELICOPTER_NOT_AVAILABLE";
    level.hardpointinforms["radar_mp"] = "mp_killstreak_radar";
    level.hardpointinforms["airstrike_mp"] = "mp_killstreak_jet";
    level.hardpointinforms["helicopter_mp"] = "mp_killstreak_heli";
    precachestring( level.hardpointhints["radar_mp"] );
    precachestring( level.hardpointhints["airstrike_mp"] );
    precachestring( level.hardpointhints["helicopter_mp"] );
    precachestring( level.hardpointhints["radar_mp_not_available"] );
    precachestring( level.hardpointhints["airstrike_mp_not_available"] );
    precachestring( level.hardpointhints["helicopter_mp_not_available"] );
    precachestring( &"MP_KILLSTREAK_N" );
    precachelocationselector( "map_artillery_selector" );

    if ( !isdefined( level._id_099B ) )
        level._id_099B = loadfx( "fx/explosions/clusterbomb_mp" );

    if ( !isdefined( level.airstrike_close_sound ) )
        level.airstrike_close_sound = "h1_ks_veh_mig29_close_loop";

    level.fx_airstrike_harrier_jet = loadfx( "fx/fire/jet_afterburner_harrier" );
    level.fx_airstrike_afterburner = loadfx( "fx/fire/jet_afterburner" );
    level.fx_airstrike_contrail = loadfx( "fx/smoke/jet_contrail" );
    level.fx_heli_dust = loadfx( "vfx/treadfx/heli_dust_default" );
    level.fx_heli_water = loadfx( "vfx/treadfx/heli_water_default" );
    game["dialog"]["uav_online"] = "ouruavonline";
    game["dialog"]["uav_offline"] = "";
    game["dialog"]["enemy_uav_online"] = "enemyuavair";
    game["dialog"]["enemy_uav_offline"] = "";
    game["dialog"]["airstrike_inbound"] = "friendlyair";
    game["dialog"]["enemy_airstrike_inbound"] = "enemyair";
    game["dialog"]["helicopter_inbound"] = "friendlyheli";
    game["dialog"]["enemy_helicopter_inbound"] = "enemyheli";
    game["dialog"]["radar_mp"] = "uavrecon";
    game["dialog"]["airstrike_mp"] = "airstrike";
    game["dialog"]["helicopter_mp"] = "helisupport";

    if ( getdvar( "scr_heli_hardpoint_interval" ) != "" )
        level.helicopterinterval = getdvarfloat( "scr_heli_hardpoint_interval" );
    else
    {
        setdvar( "scr_heli_hardpoint_interval", 180 );
        level.helicopterinterval = 180;
    }

    level.artillerydangermaxradius = 550;
    level.artillerydangerminradius = 300;
    level.artillerydangerforwardpush = 1.5;
    level.artillerydangerovalscale = 6.0;
    level.artillerymaprange = level.artillerydangerminradius * 0.3 + level.artillerydangermaxradius * 0.7;
    level.artillerydangermaxradiussq = level.artillerydangermaxradius * level.artillerydangermaxradius;
    level._id_0D33 = [];
    level.radarviewtime = 30;
    level.numhardpointreservedobjectives = 0;
    maps\mp\_helicopter::init();
    maps\mp\gametypes\_rank::_id_72FF( "radar_mp_earned", 100 );
    maps\mp\gametypes\_rank::_id_72FF( "airstrike_mp_earned", 100 );
    maps\mp\gametypes\_rank::_id_72FF( "helicopter_mp_earned", 100 );
    level._id_53AF["artillery_mp"] = "airstrike_mp";
    level._id_53AF["cobra_ffar_mp"] = "helicopter_mp";
    level._id_53AF["hind_ffar_mp"] = "helicopter_mp";
    level._id_53AF["cobra_20mm_mp"] = "helicopter_mp";
    level._id_539B = [];
    level._id_539B["radar_mp"] = ::_id_148E;
    level._id_539B["airstrike_mp"] = ::_id_148E;
    level._id_539B["helicopter_mp"] = ::_id_148E;

    if ( level._id_91EB )
    {
        level._id_0725["allies"] = 0;
        level._id_0725["axis"] = 0;
        level._id_99E9["allies"] = [];
        level._id_99E9["axis"] = [];
    }
    else
    {
        level._id_0725 = [];
        level._id_99E9 = [];
    }

    level._id_53A2 = maps\mp\_utility::_id_3FDB( "scr_game_killstreakdelay", 0 );
    level.killcountpersistsoverrounds = maps\mp\_utility::_id_3FDB( "scr_killcount_persists", 1 );
    level thread _id_64C8();
}

_id_148E()
{

}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !level._id_91EB )
            level._id_0725[var_0._id_4450] = 0;
    }
}

_id_0858()
{
    if ( level._id_91EB )
        level._id_99E9[self._id_04A7][level._id_99E9[self._id_04A7].size] = self;
    else
        level._id_99E9[self._id_02E5._id_4450 + "_" + gettime()] = self;
}

_id_73E6()
{
    var_0 = [];

    if ( level._id_91EB )
    {
        var_1 = self._id_04A7;

        foreach ( var_3 in level._id_99E9[var_1] )
        {
            if ( !isdefined( var_3 ) || var_3 == self )
                continue;

            var_0[var_0.size] = var_3;
        }

        level._id_99E9[var_1] = var_0;
    }
    else
    {
        foreach ( var_3 in level._id_99E9 )
        {
            if ( !isdefined( var_3 ) || var_3 == self )
                continue;

            var_0[var_0.size] = var_3;
        }

        level._id_99E9 = var_0;
    }
}

_id_07C5()
{
    self._id_99ED = "standard";

    if ( level._id_91EB )
        level._id_0725[self._id_04A7]++;
    else
        level._id_0725[self._id_02E5._id_4450]++;
}

_id_7394()
{
    if ( level._id_91EB )
        level._id_0725[self._id_04A7]--;
    else if ( isdefined( self._id_02E5 ) )
        level._id_0725[self._id_02E5._id_4450]--;
}

doartillery( var_0, var_1, var_2 )
{
    level._id_099C = 1;
    var_3 = _func_06B( var_0, var_0 + ( 0, 0, -100000 ), 0, undefined, 0, 0, 0, 0, 0, 1 );
    var_4 = var_3["position"];
    var_5 = level._id_5986[2] - var_4[2];

    if ( _func_0BE( var_5 ) > 2000 )
        var_4 = ( var_4[0], var_4[1], level._id_5986[2] );

    var_6 = getbestplanedirection( var_4 );

    if ( level._id_91EB )
    {
        var_7 = level._id_0323;

        if ( !level._id_46CA )
        {
            for ( var_8 = 0; var_8 < var_7.size; var_8++ )
            {
                if ( _func_1A1( var_7[var_8] ) && isdefined( var_7[var_8]._id_0308["team"] ) && var_7[var_8]._id_0308["team"] == var_2 )
                {
                    if ( _id_6E27( var_7[var_8]._id_02E2, var_4, var_6 ) )
                        var_7[var_8] _meth_826A( &"MP_WAR_AIRSTRIKE_INBOUND_NEAR_YOUR_POSITION" );
                }
            }
        }

        maps\mp\_utility::_id_564B( "airstrike_inbound", var_2 );

        for ( var_8 = 0; var_8 < level._id_0323.size; var_8++ )
        {
            var_9 = level._id_0323[var_8];
            var_10 = var_9._id_0308["team"];

            if ( isdefined( var_10 ) )
            {
                if ( var_10 == var_2 )
                    var_9 _meth_8269( &"MP_WAR_AIRSTRIKE_INBOUND", var_1 );
            }
        }
    }
    else
    {
        var_1 maps\mp\_utility::_id_5655( "airstrike_inbound" );

        if ( !level._id_46CA )
        {
            if ( _id_6E27( var_1._id_02E2, var_4, var_6 ) )
                var_1 _meth_826A( &"MP_WAR_AIRSTRIKE_INBOUND_NEAR_YOUR_POSITION" );
        }
    }

    maps\mp\gametypes\_hostmigration::_id_A052( 2 );

    if ( !isdefined( var_1 ) )
    {
        level._id_099C = undefined;
        return;
    }

    var_1 notify( "begin_airstrike" );
    var_11 = spawnstruct();
    var_11._id_02E2 = var_4;
    var_11._id_0199 = anglestoforward( ( 0, var_6, 0 ) );
    var_11._id_02E5 = var_1;
    var_11._id_04A7 = var_1._id_04A7;
    level._id_0D33[level._id_0D33.size] = var_11;
    _id_1A0B( var_1, var_4, var_6 );
    maps\mp\gametypes\_hostmigration::_id_A052( 8.5 );
    var_12 = 0;
    var_13 = [];

    for ( var_8 = 0; var_8 < level._id_0D33.size; var_8++ )
    {
        if ( !var_12 && level._id_0D33[var_8]._id_02E2 == var_4 )
        {
            var_12 = 1;
            continue;
        }

        var_13[var_13.size] = level._id_0D33[var_8];
    }

    level._id_0D33 = var_13;
    level._id_099C = undefined;
}

_id_3EE6( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_0D33.size; var_2++ )
    {
        var_3 = level._id_0D33[var_2]._id_02E2;
        var_4 = level._id_0D33[var_2]._id_0199;
        var_1 += _id_40CA( var_0, var_3, var_4 );
    }

    return var_1;
}

_id_40CA( var_0, var_1, var_2 )
{
    var_3 = var_1 + level.artillerydangerforwardpush * level.artillerydangermaxradius * var_2;
    var_4 = var_0 - var_3;
    var_4 = ( var_4[0], var_4[1], 0 );
    var_5 = _func_0F6( var_4, var_2 ) * var_2;
    var_6 = var_4 - var_5;
    var_7 = var_6 + var_5 / level.artillerydangerovalscale;
    var_8 = _func_0F3( var_7 );

    if ( var_8 > level.artillerydangermaxradius * level.artillerydangermaxradius )
        return 0;

    if ( var_8 < level.artillerydangerminradius * level.artillerydangerminradius )
        return 1;

    var_9 = _func_0E7( var_8 );
    var_10 = ( var_9 - level.artillerydangerminradius ) / ( level.artillerydangermaxradius - level.artillerydangerminradius );
    return 1 - var_10;
}

_id_6E27( var_0, var_1, var_2 )
{
    return _func_0EF( var_0, var_1 ) <= level.artillerydangermaxradius * 1.25;
}

losradiusdamage( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = maps\mp\gametypes\_weapons::_id_3F48( var_0, var_1, 1 );

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( var_6[var_7]._id_0151 == self )
            continue;

        var_8 = _func_0EE( var_0, var_6[var_7]._id_258F );

        if ( var_6[var_7]._id_5175 )
        {
            var_9 = !maps\mp\gametypes\_weapons::_id_A2D6( var_6[var_7]._id_0151._id_02E2, var_6[var_7]._id_0151._id_02E2 + ( 0, 0, 130 ), 0, undefined );

            if ( !var_9 )
            {
                var_9 = !maps\mp\gametypes\_weapons::_id_A2D6( var_6[var_7]._id_0151._id_02E2 + ( 0, 0, 130 ), var_0 + ( 0, 0, 114 ), 0, undefined );

                if ( var_9 )
                {
                    var_8 *= 4;

                    if ( var_8 > var_1 )
                        continue;
                }
            }
        }

        var_6[var_7]._id_00FA = _func_0BC( var_2 + ( var_3 - var_2 ) * var_8 / var_1 );
        var_6[var_7]._id_6E57 = var_0;
        var_6[var_7]._id_25A9 = var_4;
        var_6[var_7]._id_3020 = var_5;
        level.airstrikedamagedents[level.airstrikedamagedentscount] = var_6[var_7];
        level.airstrikedamagedentscount++;
    }

    thread airstrikedamageentsthread();
}

airstrikedamageentsthread()
{
    self notify( "airstrikeDamageEntsThread" );
    self endon( "airstrikeDamageEntsThread" );

    while ( level.airstrikedamagedentsindex < level.airstrikedamagedentscount )
    {
        if ( !isdefined( level.airstrikedamagedents[level.airstrikedamagedentsindex] ) )
        {

        }
        else
        {
            var_0 = level.airstrikedamagedents[level.airstrikedamagedentsindex];

            if ( !isdefined( var_0._id_0151 ) )
            {

            }
            else if ( !var_0._id_5175 || _func_1A1( var_0._id_0151 ) )
            {
                var_0 maps\mp\gametypes\_weapons::_id_259B( var_0._id_3020, var_0._id_25A9, var_0._id_00FA, "MOD_PROJECTILE_SPLASH", "artillery_mp", var_0._id_6E57, _func_114( var_0._id_258F - var_0._id_6E57 ) );
                level.airstrikedamagedents[level.airstrikedamagedentsindex] = undefined;

                if ( var_0._id_5175 )
                    wait 0.05;
            }
            else
                level.airstrikedamagedents[level.airstrikedamagedentsindex] = undefined;
        }

        level.airstrikedamagedentsindex++;
    }
}

_id_70D6( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_0323;

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        if ( !_func_1A1( var_4[var_5] ) )
            continue;

        var_6 = var_4[var_5]._id_02E2 + ( 0, 0, 32 );
        var_7 = _func_0EE( var_0, var_6 );

        if ( var_7 < var_1 )
        {
            var_8 = _func_0BC( var_2 + ( var_3 - var_2 ) * var_7 / var_1 );
            var_4[var_5] thread _id_0D34( "default", var_8 );
        }
    }
}

_id_0D34( var_0, var_1 )
{
    if ( isdefined( self._id_13A9 ) && self._id_13A9 )
        return;

    self._id_13A9 = 1;
    self _meth_8186( var_0, var_1 );
    wait(var_1 + 1);
    self._id_13A9 = 0;
}

doplanestrike( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_8 = 100;
    var_9 = 150;
    var_10 = var_3 + ( ( _func_0B3( 2 ) - 1 ) * var_8, ( _func_0B3( 2 ) - 1 ) * var_8, 0 );
    var_11 = var_4 + ( ( _func_0B3( 2 ) - 1 ) * var_9, ( _func_0B3( 2 ) - 1 ) * var_9, 0 );
    var_12 = spawnplane( var_0, "script_model", var_10, "compass_objpoint_airstrike_friendly", "compass_objpoint_airstrike_busy" );
    var_13 = var_0._id_0308["team"];

    if ( var_13 == "allies" )
    {
        var_14 = "h1_vehicle_av8b_harrier";

        if ( isdefined( level.airstrike_model_allies_override ) )
            var_14 = level.airstrike_model_allies_override;

        var_12 _meth_80B3( var_14 );
    }
    else
    {
        var_14 = "h1_vehicle_mig29";

        if ( isdefined( level.airstrike_model_axis_override ) )
            var_14 = level.airstrike_model_axis_override;

        var_12 _meth_80B3( var_14 );
    }

    var_12.angles = var_7;
    var_15 = anglestoforward( var_7 );

    if ( isdefined( level.airstrike_plane_fx_func ) )
        var_12 thread [[ level.airstrike_plane_fx_func ]]( var_13 );
    else
        var_12 thread playplanefx( var_13 );

    var_12 _meth_82AA( var_11, var_6, 0, 0 );
    thread callstrike_planesound( var_12, var_2 );
    thread callstrike_bombeffect( var_12, var_11, var_6, var_5 - 1.0, var_0, var_1 );
    wait(var_6);
    var_12 notify( "delete" );
    var_12 delete();
}

callstrike_bombeffect( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    wait(var_3);
    var_0 thread common_scripts\utility::_id_69C2( "h1_ks_airstrike_jet_by" );
    var_6 = anglestoforward( var_0.angles );
    var_7 = spawnbomb( var_0._id_02E2, var_0.angles );
    var_7 _meth_82AE( common_scripts\utility::vectorscale( anglestoforward( var_0.angles ), 4666.67 ), 3.0 );
    var_7.ownerrequireddeathcount = var_5;
    var_8 = spawn( "script_model", var_0._id_02E2 + ( 0, 0, 100 ) - var_6 * 200 );
    var_7._id_534D = var_8;
    var_8._id_8D41 = gettime();
    var_8 thread _id_2845( 15.0 );
    var_8.angles = var_6;
    var_8 _meth_82AA( var_1 + ( 0, 0, 100 ), var_2, 0, 0 );
    wait 0.4;
    var_8 _meth_82AA( var_8._id_02E2 + var_6 * 4000, 1, 0, 0 );
    wait 0.45;
    var_8 _meth_82AA( var_8._id_02E2 + ( var_6 + ( 0, 0, -0.2 ) ) * 3500, 2, 0, 0 );
    wait 0.15;
    var_9 = spawn( "script_model", var_7._id_02E2 );
    var_9 _meth_80B3( "tag_origin" );
    var_9._id_02E2 = var_7._id_02E2;
    var_9.angles = var_7.angles;
    var_7 _meth_80B3( "tag_origin" );
    wait 0.1;
    var_10 = var_9._id_02E2;
    var_11 = var_9.angles;
    playfxontag( level._id_099B, var_9, "tag_origin" );
    wait 0.05;
    var_8 _meth_82AA( var_8._id_02E2 + ( var_6 + ( 0, 0, -0.25 ) ) * 2500, 2, 0, 0 );
    wait 0.25;
    var_8 _meth_82AA( var_8._id_02E2 + ( var_6 + ( 0, 0, -0.35 ) ) * 2000, 2, 0, 0 );
    wait 0.2;
    var_8 _meth_82AA( var_8._id_02E2 + ( var_6 + ( 0, 0, -0.45 ) ) * 1500, 2, 0, 0 );
    var_12 = 12;
    var_13 = 5;
    var_14 = 55;
    var_15 = ( var_14 - var_13 ) / var_12;
    var_16 = ( 0, 0, 0 );

    for ( var_17 = 0; var_17 < var_12; var_17++ )
    {
        var_18 = anglestoforward( var_11 + ( var_14 - var_15 * var_17, _func_0B2( 10 ) - 5, 0 ) );
        var_19 = var_10 + common_scripts\utility::vectorscale( var_18, 10000 );
        var_20 = _func_06B( var_10, var_19, 0, undefined );
        var_21 = var_20["position"];
        var_16 += var_21;
        thread losradiusdamage( var_21 + ( 0, 0, 16 ), 512, 200, 30, var_4, var_7 );

        if ( var_17 % 3 == 0 )
        {
            thread maps\mp\_utility::_id_6DDC( "h1_ks_airstrike_exp", var_21 );
            _func_1C7( "artillery_rumble", var_21 );
            _func_18C( 0.7, 0.75, var_21, 1000 );
        }

        wait 0.05;
    }

    var_16 = var_16 / var_12 + ( 0, 0, 128 );
    var_8 _meth_82AA( var_7._id_534D._id_02E2 * 0.35 + var_16 * 0.65, 1.5, 0, 0.5 );
    wait 5.0;
    var_9 delete();
    var_7 delete();
}

spawnbomb( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 _meth_80B3( "projectile_cbu97_clusterbomb" );
    return var_2;
}

_id_2845( var_0 )
{
    self endon( "death" );
    wait 10.0;
    self delete();
}

playplanefx( var_0 )
{
    self endon( "death" );

    if ( var_0 == "allies" )
    {
        playfxontag( level.fx_airstrike_harrier_jet, self, "tag_engine_right" );
        playfxontag( level.fx_airstrike_harrier_jet, self, "tag_engine_right2" );
        playfxontag( level.fx_airstrike_harrier_jet, self, "tag_engine_left" );
        playfxontag( level.fx_airstrike_harrier_jet, self, "tag_engine_left2" );
        wait 1.0;
    }
    else
    {
        playfxontag( level.fx_airstrike_afterburner, self, "tag_engine_right" );
        playfxontag( level.fx_airstrike_afterburner, self, "tag_engine_left" );
    }

    playfxontag( level.fx_airstrike_contrail, self, "tag_right_wingtip" );
    playfxontag( level.fx_airstrike_contrail, self, "tag_left_wingtip" );
}

getbestplanedirection( var_0 )
{
    if ( getdvarint( "scr_airstrikebestangle" ) != 1 )
        return _func_0B3( 360 );

    var_1 = -25;
    var_2 = 15;
    var_3 = var_0 + ( 0, 0, 64 );
    var_4 = _func_0B3( 360 );
    var_5 = 0;
    var_6 = [];

    for ( var_7 = 0; var_7 < var_2; var_7++ )
    {
        var_8 = ( var_7 * 1.0 + _func_0B3( 1 ) ) / var_2 * 360.0;
        var_9 = ( var_1, var_8 + 180, 0 );
        var_10 = anglestoforward( var_9 );
        var_11 = var_3 + var_10 * 1500;
        var_12 = _func_06B( var_3, var_11, 0, undefined );

        if ( var_12["fraction"] > var_5 )
        {
            var_5 = var_12["fraction"];
            var_4 = var_8;

            if ( var_12["fraction"] >= 1 )
                var_6[var_6.size] = var_8;
        }

        if ( var_7 % 3 == 0 )
            wait 0.05;
    }

    if ( var_6.size > 0 )
        return var_6[_func_0B2( var_6.size )];

    return var_4;
}

_id_1A0B( var_0, var_1, var_2 )
{
    var_3 = ( 0, var_2, 0 );
    var_4 = 24000;
    var_5 = 1500;
    var_6 = 850;
    var_7 = 7000;

    if ( isdefined( level.airstrikeheightscale ) )
        var_6 *= level.airstrikeheightscale;

    var_8 = var_1 + common_scripts\utility::vectorscale( anglestoforward( var_3 ), -1 * var_4 );
    var_8 += ( 0, 0, var_6 );
    var_9 = var_1 + common_scripts\utility::vectorscale( anglestoforward( var_3 ), var_4 );
    var_9 += ( 0, 0, var_6 );
    var_10 = _func_0F1( var_8 - var_9 );
    var_11 = var_10 / var_7;
    var_10 = _func_0BE( var_10 / 2 + var_5 );
    var_12 = var_10 / var_7;
    var_0 endon( "disconnect" );
    var_13 = var_0._id_010D;
    level.airstrikedamagedents = [];
    level.airstrikedamagedentscount = 0;
    level.airstrikedamagedentsindex = 0;
    level thread doplanestrike( var_0, var_13, var_1, var_8 + ( 0, 0, _func_0B2( 500 ) ), var_9 + ( 0, 0, _func_0B2( 500 ) ), var_12, var_11, var_3 );
    var_14 = _func_0B5( 1.5, 2.5 );
    maps\mp\gametypes\_hostmigration::_id_A052( var_14 );
    level thread doplanestrike( var_0, var_13, var_1, var_8 + ( 0, 0, _func_0B2( 200 ) ), var_9 + ( 0, 0, _func_0B2( 200 ) ), var_12, var_11, var_3 );
    var_14 = _func_0B5( 1.5, 2.5 );
    maps\mp\gametypes\_hostmigration::_id_A052( var_14 );
    level thread doplanestrike( var_0, var_13, var_1, var_8 + ( 0, 0, _func_0B2( 200 ) ), var_9 + ( 0, 0, _func_0B2( 200 ) ), var_12, var_11, var_3 );
}

_id_91D1( var_0, var_1 )
{
    var_2 = _id_91D2( var_0, var_1 );

    if ( var_2 )
        var_3 = 1;
    else
        var_3 = -1;

    var_4 = common_scripts\utility::_id_38C9( var_0._id_02E2 );
    var_5 = var_4 + common_scripts\utility::vectorscale( anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) ), var_3 * 100000 );
    var_6 = _func_0ED( var_4, var_5, var_1 );
    var_7 = _func_0EE( var_4, var_6 );

    if ( var_7 < 3000 )
        return 1;
    else
        return 0;
}

_id_91D2( var_0, var_1 )
{
    var_2 = anglestoforward( common_scripts\utility::_id_38C8( var_0.angles ) );
    var_3 = _func_114( common_scripts\utility::_id_38C9( var_1 ) - var_0._id_02E2 );
    var_4 = _func_0F6( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

callstrike_planesound( var_0, var_1 )
{
    var_0 thread common_scripts\utility::_id_6975( "h1_ks_veh_mig29_dist_loop" );

    while ( !_id_91D1( var_0, var_1 ) )
        wait 0.05;

    var_0 notify( "stop soundh1_ks_veh_mig29_dist_loop" );
    var_0 thread common_scripts\utility::_id_6975( level.airstrike_close_sound );

    while ( _id_91D2( var_0, var_1 ) )
        wait 0.05;

    wait 0.5;

    while ( _id_91D1( var_0, var_1 ) )
        wait 0.05;

    var_0 notify( "stop sound" + level.airstrike_close_sound );
    var_0 thread common_scripts\utility::_id_6975( "h1_ks_veh_mig29_dist_loop" );
    var_0 waittill( "delete" );
    var_0 notify( "stop soundh1_ks_veh_mig29_dist_loop" );
}

givehardpointitemforstreak()
{
    var_0 = self._id_0308["cur_kill_streak"];

    foreach ( var_3, var_2 in level.hardpointitems )
    {
        if ( getdvarint( "scr_game_forceuav" ) && var_3 == "radar_mp" )
            continue;

        if ( var_0 == var_2 )
        {
            thread givehardpoint( var_3, var_2 );
            break;
        }
    }
}

waittilldoneusingkillstreak()
{
    for ( var_0 = self _meth_830F(); maps\mp\_utility::_id_513D( var_0 ) || maps\mp\_utility::_id_5092( self._id_7C6F ); var_0 = self _meth_830F() )
        waittillframeend;
}

givehardpoint( var_0, var_1 )
{
    self notify( "giveHardpoint" );
    self endon( "giveHardpoint" );
    self endon( "disconnect" );
    self endon( "death" );
    waittilldoneusingkillstreak();

    if ( givehardpointitem( var_0 ) )
        thread hardpointnotify( var_0, var_1 );
}

hardpointnotify( var_0, var_1 )
{
    thread maps\mp\_events::_id_300B( var_0, var_1 );
    maps\mp\_utility::_id_5655( var_0, "killstreak_earned", 1 );
}

_id_539A( var_0 )
{
    if ( var_0 == "radar_mp" )
        self._id_381F = gettime();
    else if ( isdefined( self._id_381F ) && var_0 == "helicopter_mp" )
    {
        if ( gettime() - self._id_381F < 20000 )
            thread maps\mp\gametypes\_misions::_id_3CAA( "wargasm" );
    }
}

removekillstreakweapons()
{
    var_0 = self _meth_8308();

    foreach ( var_2 in var_0 )
    {
        if ( maps\mp\_utility::_id_513D( var_2 ) )
            self _meth_830C( var_2 );
    }
}

givehardpointitem( var_0 )
{
    if ( level._id_3BDA && level._id_3BDC != gettime() )
        return 0;

    if ( !maps\mp\_utility::_id_5092( level.killstreaksenabled ) )
        return 0;

    if ( getdvar( "scr_game_hardpoints" ) != "" && getdvarint( "scr_game_hardpoints" ) == 0 )
        return 0;

    if ( isdefined( self._id_7C6F ) )
        return 0;

    var_1 = self _meth_830F();

    if ( maps\mp\_utility::_id_513D( var_1 ) )
        return 0;

    if ( !isdefined( level.hardpointitems[var_0] ) || !level.hardpointitems[var_0] )
        return 0;

    if ( ( !isdefined( level.heli_paths ) || !level.heli_paths.size ) && var_0 == "helicopter_mp" )
        return 0;

    if ( isdefined( self._id_0308["hardPointItem"] ) )
    {
        if ( level.hardpointitems[var_0] < level.hardpointitems[self._id_0308["hardPointItem"]] )
            return 0;
    }

    removekillstreakweapons();
    self _meth_830B( var_0 );
    self _meth_832F( var_0 );
    self _meth_8305( 4, "weapon", var_0 );
    self._id_0308["hardPointItem"] = var_0;
    var_2 = maps\mp\_utility::_id_3FEE( var_0 );
    self _meth_82F8( "ks_icon0", var_2 );
    return 1;
}

giveownedhardpointitem()
{
    if ( isdefined( self._id_0308["hardPointItem"] ) )
        givehardpointitem( self._id_0308["hardPointItem"] );
}

hardpointitemwaiter()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( maps\mp\_utility::_id_5092( level._id_3BDA ) )
        return;

    var_0 = self _meth_830E();
    giveownedhardpointitem();

    for (;;)
    {
        self waittill( "weapon_change" );
        var_1 = self _meth_830E();

        switch ( var_1 )
        {
            case "radar_mp":
            case "airstrike_mp":
            case "helicopter_mp":
                if ( triggerhardpoint( var_1 ) )
                {
                    logstring( "hardpoint: " + var_1 );
                    thread maps\mp\gametypes\_misions::_id_9C01( self._id_0308["hardPointItem"] );
                    self thread [[ level._id_64FE ]]( "hardpoint" );
                    thread playertakehardpointweapon( var_0, var_1 );
                    self _meth_8305( 4, "" );
                    self._id_0308["hardPointItem"] = undefined;
                    self _meth_82F8( "ks_icon0", 0 );
                }
                else if ( var_0 != "none" )
                {
                    playerwaitforweapontoanimate( var_1 );
                    self _meth_8312( var_0 );
                }

                continue;
            case "none":
                continue;
            default:
                if ( !maps\mp\gametypes\_class::isperkequipment( var_1 ) )
                    var_0 = var_1;

                continue;
        }
    }
}

playerwaitforweapontoanimate( var_0 )
{
    if ( var_0 == "radar_mp" || var_0 == "helicopter_mp" )
    {
        common_scripts\utility::_id_0588();
        var_1 = common_scripts\utility::_id_A0A2( "weapon_change", 0.75 );
        common_scripts\utility::_id_0596();

        if ( !isdefined( var_1 ) && !self _meth_801A() && !self _meth_833F() )
            return 0;
    }

    return 1;
}

playertakehardpointweapon( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( var_0 != "none" )
    {
        var_2 = playerwaitforweapontoanimate( var_1 );

        if ( var_2 )
        {
            self _meth_8312( var_0 );
            common_scripts\utility::_id_0588();
            self waittill( "weapon_change" );
            common_scripts\utility::_id_0596();
        }
    }

    self _meth_830C( var_1 );
}

triggerhardpoint( var_0 )
{
    if ( level._id_53A2 )
    {
        var_1 = 0;

        if ( isdefined( level._id_6F07 ) )
            var_1 = ( gettime() - level._id_6F07 ) / 1000;

        if ( var_1 < level._id_53A2 )
        {
            var_2 = _func_0BC( level._id_53A2 - var_1 + 0.5 );

            if ( !var_2 )
                var_2 = 1;

            self _meth_826A( &"MP_UNAVAILABLE_FOR_N", var_2 );
            return 0;
        }
    }

    if ( var_0 == "radar_mp" )
    {
        maps\mp\_matchdata::_id_583B( var_0, self._id_02E2 );
        thread useradaritem();
    }
    else if ( var_0 == "airstrike_mp" )
    {
        if ( isdefined( level._id_099C ) )
        {
            self _meth_854D( "h1_ks_airstrike_activate_start_plr" );
            self _meth_826A( level.hardpointhints[var_0 + "_not_available"] );
            return 0;
        }

        var_3 = _id_7C61( var_0 );

        if ( !isdefined( var_3 ) || !var_3 )
            return 0;
    }
    else if ( var_0 == "helicopter_mp" )
    {
        if ( isdefined( level._id_1D48 ) )
        {
            self _meth_826A( level.hardpointhints[var_0 + "_not_available"] );
            return 0;
        }

        var_4 = 0;
        var_5 = _func_0B2( level.heli_paths[var_4].size );
        var_6 = level.heli_paths[var_4][var_5];
        var_7 = self._id_0308["team"];
        var_8 = level._id_65B3[var_7];

        if ( level._id_91EB )
        {
            maps\mp\_utility::_id_564B( "helicopter_inbound", var_7 );
            maps\mp\_utility::_id_564B( "enemy_helicopter_inbound", var_8 );

            for ( var_9 = 0; var_9 < level._id_0323.size; var_9++ )
            {
                var_10 = level._id_0323[var_9];
                var_11 = var_10._id_0308["team"];

                if ( isdefined( var_11 ) )
                {
                    if ( var_11 == var_7 )
                        var_10 _meth_8269( &"MP_HELICOPTER_INBOUND", self );
                }
            }
        }
        else
        {
            maps\mp\_utility::_id_5655( "helicopter_inbound" );
            var_12 = [];
            var_12[0] = self;
            maps\mp\_utility::_id_564B( "enemy_helicopter_inbound", undefined, undefined, var_12 );
        }

        maps\mp\_matchdata::_id_583B( var_0, self._id_02E2 );
        thread maps\mp\_helicopter::heli_think( self, var_6, self._id_0308["team"] );
    }

    return 1;
}

uavacquiredprintandsound( var_0, var_1, var_2, var_3 )
{
    var_4 = game["voice"][var_0] + game["dialog"]["uav_online"];
    var_5 = game["voice"][var_1] + game["dialog"]["enemy_uav_online"];

    if ( level._id_8A7C )
    {
        for ( var_6 = 0; var_6 < level._id_0323.size; var_6++ )
        {
            var_7 = level._id_0323[var_6];
            var_8 = var_7._id_0308["team"];

            if ( isdefined( var_8 ) )
            {
                if ( var_8 == var_0 )
                {
                    var_7 _meth_8269( &"MP_WAR_RADAR_ACQUIRED", var_2, var_3 );
                    continue;
                }

                if ( var_8 == var_1 )
                    var_7 _meth_8269( &"MP_WAR_RADAR_ACQUIRED_ENEMY", var_3 );
            }
        }

        level._id_0323[0] _meth_82F1( var_4 );
    }
    else
    {
        maps\mp\_utility::_id_564B( "uav_online", var_0 );
        maps\mp\_utility::_id_564B( "enemy_uav_online", var_1 );

        for ( var_6 = 0; var_6 < level._id_0323.size; var_6++ )
        {
            var_7 = level._id_0323[var_6];
            var_8 = var_7._id_0308["team"];

            if ( isdefined( var_8 ) )
            {
                if ( var_8 == var_0 )
                {
                    var_7 _meth_8269( &"MP_WAR_RADAR_ACQUIRED", var_2, var_3 );
                    continue;
                }

                if ( var_8 == var_1 )
                    var_7 _meth_8269( &"MP_WAR_RADAR_ACQUIRED_ENEMY", var_3 );
            }
        }
    }
}

useradaritem()
{
    var_0 = self._id_0308["team"];
    var_1 = "axis";

    if ( var_0 == "axis" )
        var_1 = "allies";

    if ( level._id_91EB )
    {
        uavacquiredprintandsound( var_0, var_1, self, level.radarviewtime );
        level notify( "radar_timer_kill_" + var_0 );
        thread useteamuav( var_0, var_1 );
    }
    else
    {
        maps\mp\_utility::_id_5655( "uav_online" );
        self _meth_8269( &"MP_WAR_RADAR_ACQUIRED", self, level.radarviewtime );
        self notify( "radar_timer_kill" );
        thread useplayeruav();
    }
}

waitforradartoexpireorinterrupt( var_0 )
{
    self endon( var_0 );
    self endon( "disconnect" );
    maps\mp\gametypes\_hostmigration::_id_A052( level.radarviewtime );
    return "expire";
}

useteamuav( var_0, var_1 )
{
    level endon( "game_ended" );
    _id_802C( var_0, 1 );
    var_2 = spawnstruct();
    var_2._id_04A7 = var_0;
    var_2._id_02E5 = self;
    var_2._id_99ED = "standard";
    var_2._id_02E2 = ( 0, 0, 0 );
    var_2 _id_0858();
    var_2 _id_07C5();
    var_3 = level waitforradartoexpireorinterrupt( "radar_timer_kill_" + var_0 );

    if ( isdefined( var_3 ) && var_3 == "expire" )
    {
        _id_802C( var_0, 0 );
        maps\mp\_utility::_id_6FAA( var_0, var_1, &"MP_WAR_RADAR_EXPIRED", &"MP_WAR_RADAR_EXPIRED_ENEMY", undefined, undefined, "" );
    }

    var_2 _id_7394();
    var_2 _id_73E6();
    var_2 = undefined;
}

useplayeruav( var_0, var_1 )
{
    level endon( "game_ended" );
    self._id_01E0 = 1;
    var_2 = spawnstruct();
    var_2._id_04A7 = var_0;
    var_2._id_02E5 = self;
    var_2._id_99ED = "standard";
    var_2._id_02E2 = ( 0, 0, 0 );
    var_2 _id_0858();
    var_2 _id_07C5();
    var_3 = waitforradartoexpireorinterrupt( "radar_timer_kill" );

    if ( isdefined( var_3 ) && var_3 == "expire" )
    {
        self._id_01E0 = 0;
        self _meth_8269( &"MP_WAR_RADAR_EXPIRED" );
    }

    var_2 _id_7394();
    var_2 _id_73E6();
    var_2 = undefined;
}

_id_802C( var_0, var_1 )
{
    _func_179( var_0, var_1 );
    var_2 = 0;

    if ( var_1 )
        var_2 = 1;

    level notify( "radar_status_change", var_0 );
}

_id_A010()
{
    self endon( "location_selection_complete" );
    self endon( "disconnect" );
    self waittill( "stop_location_selection" );

    if ( maps\mp\gametypes\_hostmigration::_id_A0DD() > 0 )
        self _meth_8312( common_scripts\utility::_id_3FFD() );
}

_id_7C61( var_0 )
{
    if ( !isdefined( level._id_5990 ) )
        level._id_5990 = 1024;

    var_1 = level._id_5990 / 6.46875;

    if ( level._id_8A7C )
        var_1 *= 1.5;

    maps\mp\_utility::_id_0560( var_0, "map_artillery_selector", 0, var_1 );
    thread _id_A010();
    self endon( "stop_location_selection" );
    self endon( "disconnect" );
    self waittill( "confirm_location", var_2 );

    if ( isdefined( level._id_099C ) )
    {
        self _meth_826A( level.hardpointhints["airstrike_mp_not_available"] );
        thread maps\mp\_utility::_id_8EF6( 0, "cancel_location" );
        return 0;
    }

    maps\mp\_matchdata::_id_583B( var_0, var_2 );
    thread _id_3793( var_2, ::useairstrike );
    return 1;
}

_id_3793( var_0, var_1 )
{
    self notify( "used" );
    self thread [[ var_1 ]]( var_0 );
    return 1;
}

useairstrike( var_0 )
{
    if ( !isdefined( level.airstrikeheight ) )
    {
        var_1 = _func_06B( level._id_5986 + ( 0, 0, 100000 ), level._id_5986, 0, undefined );
        level.airstrikeheight = var_1["position"][2] - 514;
    }

    var_0 = ( var_0[0], var_0[1], level.airstrikeheight );
    thread doartillery( var_0, self, self._id_0308["team"] );
}

_id_539C( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) && _func_1AD( var_0 ) && isdefined( var_2._id_02E5 ) && isdefined( var_2._id_02E5._id_04A7 ) )
    {
        if ( ( level._id_91EB && var_2._id_02E5._id_04A7 != var_0._id_04A7 || !level._id_91EB ) && var_0 != var_2._id_02E5 )
        {
            if ( maps\mp\_utility::_id_513D( var_1 ) )
                return;

            if ( !isdefined( var_0._id_55AB[var_1] ) )
                var_0._id_55AB[var_1] = 0;

            if ( var_0._id_55AB[var_1] == gettime() )
                return;

            var_0._id_55AB[var_1] = gettime();
            var_0 thread maps\mp\gametypes\_gamelogic::_id_9315( var_1, 1, "hits" );
            var_3 = var_0 maps\mp\gametypes\_persistence::_id_8D69( "totalShots" );
            var_4 = var_0 maps\mp\gametypes\_persistence::_id_8D69( "hits" ) + 1;

            if ( var_4 <= var_3 )
            {
                var_0 maps\mp\gametypes\_persistence::_id_8D79( "hits", var_4 );
                var_0 maps\mp\gametypes\_persistence::_id_8D79( "misses", _func_0BC( var_3 - var_4 ) );
                var_5 = _func_0E9( _func_0BD( var_4 ) / _func_0BD( var_3 ), 0.0, 1.0 ) * 10000.0;
                var_0 maps\mp\gametypes\_persistence::_id_8D79( "accuracy", _func_0BC( var_5 ) );
            }
        }
    }
}

playerhasuavactive()
{
    if ( level._id_91EB )
    {
        if ( level._id_0725[self._id_04A7] > 0 )
            return 1;
    }
    else if ( level._id_0725[self._id_4450] > 0 )
        return 1;

    return 0;
}

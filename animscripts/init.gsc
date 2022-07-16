// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4E32( var_0 )
{
    self._id_051D[var_0] = spawnstruct();
    self._id_051D[var_0]._id_0329 = "none";
    self._id_051D[var_0]._id_4723 = 1;

    if ( _func_0DE( var_0 ) != "" )
        self._id_051D[var_0]._id_9BF2 = 1;
    else
        self._id_051D[var_0]._id_9BF2 = 0;
}

_id_5208( var_0 )
{
    return isdefined( self._id_051D[var_0] );
}

_id_7F7C()
{
    anim._id_22A1 = 55;
    anim._id_0985 = 10;
    anim._id_0983 = 4096;
    anim._id_0984 = 45;
    anim._id_097B = 20;
    anim.aimpitchdiffclosedistsq = 6400;
    anim.aimpitchdiffclosetolerance = 30;
    anim._id_6663 = 25;
    anim._id_6661 = anim._id_0983;
    anim._id_6662 = anim._id_0984;
    anim._id_665B = 30;
    anim._id_5A26 = 65;
    anim._id_5A25 = 65;
}

_id_33DF()
{
    if ( animscripts\utility::_id_51A3( self._id_03B3 ) )
        return 1;

    if ( _func_1B8( self._id_0340 ) == "rocketlauncher" )
        return 1;

    return 0;
}
#using_animtree("generic_human");

main()
{
    self.a = spawnstruct();
    self.a._id_54FB = 0;
    self._id_0340 = self._id_0513;
    _id_381E();

    if ( !isdefined( self._id_0340 ) || self._id_0340 == "" )
        self._id_0340 = "none";

    if ( self._id_03B3 == "" )
        self._id_03B3 = "none";

    if ( self._id_855D == "" )
        self._id_855D = "none";

    _id_4E32( self._id_0340 );
    _id_4E32( self._id_03B3 );
    _id_4E32( self._id_855D );
    self _meth_8177();
    self.a._id_A2E2["left"] = "none";
    self.a._id_A2E2["right"] = "none";
    self.a._id_A2E2["chest"] = "none";
    self.a._id_A2E2["back"] = "none";
    self.a._id_A2E3["left"] = "none";
    self.a._id_A2E3["right"] = "none";
    self.a._id_A2E3["chest"] = "none";
    self.a._id_A2E3["back"] = "none";
    self._id_560F = self._id_0513;
    self._id_75DF = %animscript_root;
    thread _id_139C();
    var_0 = animscripts\utility::_id_9C36();
    self.a._id_6096 = var_0;

    if ( var_0 )
        thread animscripts\shared::_id_766B();

    self.a._id_7594 = 3;
    self.a._id_7597 = 1;
    self.a._id_6E5A = "stand";
    self.a._id_440C = "stand";
    self.a._id_5F5B = "stop";
    self.a._id_8D56 = "stop";
    self.a._id_8A1A = "none";
    self.a._id_4471 = "none";
    self.a._id_6F73 = -1;
    self._id_0135 = 1;
    self._id_5C65 = 850;
    animscripts\shared::_id_6869( self._id_0340, "right" );

    if ( animscripts\utility::_id_51A3( self._id_03B3 ) )
        animscripts\shared::_id_6869( self._id_03B3, "back" );

    self.a._id_6084 = 0;
    self.a._id_20AA = gettime();
    self.a._id_559E = gettime();
    self.a._id_8FE8 = 0;
    self.a._id_2B18 = !self _meth_813F();
    self.a._id_5856 = 0;
    self.a._id_665F = 0;
    self.a._id_55D7 = 0;
    self.a._id_60CC = 0;
    self.a._id_71D0 = undefined;
    setdvarifuninitialized( "ai_reactToBulletChance", 0.8 );
    setdvarifuninitialized( "ai_reactToBulletCooldown", 5000 );

    if ( self._id_04A7 == "allies" && !_func_120( self.classname, "russian" ) && allies_with_ir() )
        self.has_ir = 1;

    self.a._id_6E8D = undefined;
    self.a._id_8AF2 = "stand";
    self._id_1D46 = animscripts\utility::_id_1D45;
    self._id_0550 = 0;
    self._id_05DB = 0;
    thread _id_32B6();
    self._id_1300 = 1;
    self.a._id_5CE3 = 0;
    self.a._id_612E = 0;
    self.a._id_5CE3 = 0;
    self.a._id_5CE5 = 0;
    self.a._id_2B20 = 0;
    self._id_06DC = 1;
    self._id_1CA5 = 0;
    self._id_8569 = 0;
    self._id_8568 = 1;
    self._id_607D = 1;
    self._id_27A0 = 55;
    self.a._id_60DD = 0;

    if ( !isdefined( self._id_79EA ) )
        self._id_79EA = 0;

    _id_8340();
    animscripts\weaponlist::_id_72B1();
    self._id_559D = 0;
    self._id_20B5 = 0;
    self._id_8FE4 = 0;
    self._id_8FE7 = 0;

    if ( self._id_04A7 == "allies" )
        self._id_8FEC = 0.75;
    else
        self._id_8FEC = 0.5;

    if ( self._id_04A7 == "allies" )
        self._id_7120 = 0;
    else
        self._id_7120 = 128;

    self._id_0B77 = 8000;
    self._id_0B78 = 0;
    animscripts\animset::_id_8283();
    self._id_33E5 = [];
    self._id_33E5["corner"] = 1;
    self._id_33E5["cover_crouch"] = 1;
    self._id_33E5["stop"] = 1;
    self._id_33E5["stop_immediate"] = 1;
    self._id_33E5["move"] = 1;
    self._id_33E5["exposed"] = 1;
    self._id_33E5["corner_normal"] = 1;
    var_1 = _func_1D3( self._id_33E5 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        common_scripts\utility::_id_1EB7( var_1[var_2] );

    self._id_7177 = 0;
    thread _id_7FBA();
    self._id_8489 = 0;

    if ( isdefined( level.h1_bullet_whizby_enabled ) && level.h1_bullet_whizby_enabled )
    {
        self._id_2AF7 = undefined;
        self._id_2A93 = 1;
    }
    else
        self._id_2AF7 = 1;

    self._id_6165 = 1;

    if ( isdefined( level.h1_team_run_twitch_enabled ) )
    {
        if ( isdefined( level.h1_team_run_twitch_enabled[self._id_04A7] ) )
            self._id_6165 = !level.h1_team_run_twitch_enabled[self._id_04A7];
    }

    self.proneaimlimits = spawnstruct();
    self.proneaimlimits._id_037C = 45;
    self.proneaimlimits._id_024D = -45;
    self.proneaimlimits._id_04E1 = 35;
    self.proneaimlimits._id_0133 = -35;
    self.animaimlimit = spawnstruct();
    self.animaimlimit._id_037C = 45;
    self.animaimlimit._id_024D = -45;
    self.doaimidlethread = 1;

    if ( !isdefined( level._id_2B1C ) )
        thread animscripts\combat_utility::_id_5E5E();

    thread _id_6467();
    thread handleikevent();
}

handleikevent()
{
    self endon( "death" );
    var_0 = -30;
    self _meth_814E( %actor_ik_move_root, 0 );
    self _meth_814E( %stand_exposed_ik_add, 1 );
    var_1 = 0;

    for (;;)
    {
        self waittill( "actorik", var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( var_2 <= 0.01 )
        {
            if ( var_1 == 0 )
            {
                self _meth_814E( %actor_ik_move_root, 0 );
                var_1 = 1;
            }

            continue;
        }

        var_5 *= -1;
        var_9 = var_0;

        if ( _func_0F4( self._id_0500 ) > 0.01 )
            var_9 = -10;

        var_10 = 0;
        var_11 = 8;
        var_12 = 8;

        if ( var_3 )
            var_12 = 5;

        if ( var_4 )
            var_11 = 5;

        var_13[0] = var_8;
        var_13[1] = var_8 + var_7 * var_11;
        var_13[2] = var_6;
        var_13[3] = var_6 + var_5 * var_12;
        var_14[0] = 1;
        var_14[1] = 1;
        var_14[2] = 1;
        var_14[3] = 1;
        var_15[0] = _func_0BF( var_13[0][2], var_13[1][2] );
        var_15[1] = _func_0BF( var_13[2][2], var_13[3][2] );
        var_16[0] = 0;
        var_16[1] = 0;

        if ( _func_0BE( var_15[0] - var_15[1] ) < 1 )
        {
            var_16[0] = 1;
            var_16[1] = 1;
        }
        else if ( var_15[0] < var_15[1] )
            var_16[0] = 1;
        else
            var_16[1] = 1;

        var_17[0] = 0;
        var_17[1] = 0;
        var_17[2] = 0;
        var_17[3] = 0;

        for ( var_18 = 0; var_18 < 4; var_18++ )
        {
            var_19 = var_13[var_18] + ( 0, 0, 30 );
            var_20 = var_13[var_18] - ( 0, 0, 30 );
            var_21 = self _meth_83E3( var_19, var_20, 1.5, 3, 1, 1, 0, 1, 1, 1 );
            var_22 = var_19 + 2 * var_21["fraction"] * ( 0, 0, -30 );
            var_17[var_18] = var_22[2] - self._id_02E2[2];

            if ( var_21["fraction"] == 1 )
                var_14[var_18] = 0;
        }

        if ( var_14[0] || var_14[1] )
            var_23 = _func_0E1( var_17[0], var_17[1] );
        else
            var_23 = 0;

        if ( var_14[2] || var_14[3] )
            var_24 = _func_0E1( var_17[2], var_17[3] );
        else
            var_24 = 0;

        if ( var_16[0] == 1 && var_16[1] == 1 )
            var_10 = _func_0BF( var_23, var_24 );
        else if ( var_16[0] == 1 )
            var_10 = var_23;
        else
            var_10 = var_24;

        var_10 = _func_0E9( var_10, var_9, 0 );

        if ( var_10 < 0 )
        {
            var_25 = var_10 / var_0;
            self _meth_814E( %actor_ik_move_root, var_25 * var_2 );
            var_1 = 0;
        }
        else if ( var_1 == 0 )
        {
            self _meth_814E( %actor_ik_move_root, 0 );
            var_1 = 1;
        }
    }
}

allies_with_ir()
{
    if ( !isdefined( self._id_79EE ) )
        return 1;

    var_0[0] = "Griggs";
    var_0[1] = "Nikolai";

    foreach ( var_2 in var_0 )
    {
        if ( _func_120( self._id_79EE, var_2 ) )
            return 0;
    }

    return 1;
}

_id_A2E7( var_0 )
{
    var_1[0] = "m4_grenadier";
    var_1[1] = "m4_grunt";
    var_1[2] = "m4_silencer";
    var_1[3] = "m4m203";

    if ( !isdefined( var_0 ) )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _func_120( var_0, var_1[var_2] ) )
            return 1;
    }

    return 0;
}

_id_7FBA()
{
    self endon( "death" );

    if ( !isdefined( level._id_57DA ) )
        level waittill( "loadout complete" );

    _id_A55D::_id_3DE2();
    thread animscripts\squadmanager::_id_084F();
}

_id_6E2E()
{
    for (;;)
    {
        if ( self _meth_81CF( "stand" ) )
        {
            var_0[0] = "stand allowed";
            var_1[0] = ( 0, 1, 0 );
        }
        else
        {
            var_0[0] = "stand not allowed";
            var_1[0] = ( 1, 0, 0 );
        }

        if ( self _meth_81CF( "crouch" ) )
        {
            var_0[1] = "crouch allowed";
            var_1[1] = ( 0, 1, 0 );
        }
        else
        {
            var_0[1] = "crouch not allowed";
            var_1[1] = ( 1, 0, 0 );
        }

        if ( self _meth_81CF( "prone" ) )
        {
            var_0[2] = "prone allowed";
            var_1[2] = ( 0, 1, 0 );
        }
        else
        {
            var_0[2] = "prone not allowed";
            var_1[2] = ( 1, 0, 0 );
        }

        var_2 = self _meth_8099() + ( 0, 0, 30 );
        var_3 = ( 0, 0, -10 );

        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
            var_5 = ( var_2[0] + var_3[0] * var_4, var_2[1] + var_3[1] * var_4, var_2[2] + var_3[2] * var_4 );

        wait 0.05;
    }
}

_id_8340()
{
    if ( !isdefined( self._id_0C78 ) || !isdefined( self._id_5F65 ) )
        _id_7DBE();
}

_id_7DBE()
{
    self._id_0C78 = 0.9 + _func_0B3( 0.2 );
    self._id_5F97 = 0.9 + _func_0B3( 0.2 );
    self._id_5F65 = 1;
    self._id_855F = 1.35;
}

_id_4C5B( var_0, var_1, var_2, var_3 )
{
    anim waittill( "new exceptions" );
}

_id_0138( var_0, var_1, var_2, var_3 )
{

}

_id_32B6()
{
    self endon( "death" );

    if ( 1 )
        return;

    for (;;)
    {
        self waittill( "enemy" );

        if ( !_func_1A1( self._id_0142 ) )
            continue;

        while ( _func_1AD( self._id_0142 ) )
        {
            if ( animscripts\utility::_id_472C() )
                level._id_55CC = gettime();

            wait 2;
        }
    }
}

_id_4E33()
{
    level._id_A338[0] = -36.8552;
    level._id_A338[1] = -27.0095;
    level._id_A338[2] = -15.5981;
    level._id_A338[3] = -4.37769;
    level._id_A338[4] = 17.7776;
    level._id_A338[5] = 59.8499;
    level._id_A338[6] = 104.808;
    level._id_A338[7] = 152.325;
    level._id_A338[8] = 201.052;
    level._id_A338[9] = 250.244;
    level._id_A338[10] = 298.971;
    level._id_A338[11] = 330.681;
}

_id_381E()
{
    if ( isdefined( anim._id_61F8 ) )
        return;

    anim._id_61F8 = 1;
    animscripts\animset::_id_4C76();
    anim._id_9BFF = 0;
    _id_A550::_id_4D06();
    level._id_0318._id_4FA7 = 0;
    level._id_60CB = _func_0B2( 3 );
    level._id_55CC = 100;
    anim._id_2796 = ::_id_0138;
    _id_4DA9();
    setdvar( "scr_expDeathMayMoveCheck", "on" );
    _id_A55D::_id_8241();
    anim._id_0C6E = 0;
    animscripts\init_move_transitions::_id_4DF3();
    anim._id_20AE = 10000;
    anim._id_20AF = 6000;
    _id_4DC2();
    _id_4D7D();

    if ( !isdefined( anim._id_6548 ) )
    {
        anim._id_654A = animscripts\notetracks::_id_6DA1;
        anim._id_6548 = animscripts\notetracks::_id_6DA0;
    }

    if ( !isdefined( anim._id_6549 ) )
        anim._id_6549 = [];

    if ( !isdefined( anim._id_654B ) )
        anim._id_654B = [];

    if ( !isdefined( anim._id_83F3 ) )
        anim._id_83F3 = animscripts\utility::_id_83F5;

    if ( !isdefined( anim._id_8413 ) )
        anim._id_8413 = animscripts\utility::_id_8412;

    anim._id_37BF["scripted"] = animscripts\notetracks::_id_37C7;
    anim._id_37BF["cover_right"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["cover_left"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["cover_crouch"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["cover_stand"] = animscripts\notetracks::_id_840D;
    anim._id_37BF["move"] = animscripts\notetracks::_id_840D;
    animscripts\notetracks::_id_72F3();

    if ( !isdefined( level._id_382E ) )
        common_scripts\utility::_id_4CF0();

    _id_A537::_id_8010();
    level._id_6650 = undefined;
    animscripts\setposemovement::_id_4E02();
    animscripts\face::_id_4DEF();
    anim._id_1931 = animscripts\utility::_id_0CD8( 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 5 );
    anim._id_3674 = animscripts\utility::_id_0CD8( 2, 3, 3, 3, 4, 4, 4, 5, 5 );
    anim._id_7C7A = animscripts\utility::_id_0CD8( 1, 2, 2, 3, 3, 4, 4, 4, 4, 5, 5, 5 );
    anim._id_126A = [];
    anim._id_1267 = 0;
    anim._id_0318 = getentarray( "player", "classname" )[0];
    _id_4D8C();
    _id_4E33();
    animscripts\cqb::_id_8308();
    _id_4DA7();
    _id_7F7C();
    anim._id_5583 = -100000;
    _id_8335();
    level._id_0318 thread animscripts\combat_utility::_id_A250();
    thread _id_09A7();
}

_id_4DA9()
{

}

_id_4D8C()
{
    animscripts\squadmanager::_id_4D5F();
    anim._id_0318 thread animscripts\squadmanager::_id_081E();
    animscripts\battlechatter::_id_4CB8();
    anim._id_0318 thread animscripts\battlechatter_ai::_id_0850();
    anim thread animscripts\battlechatter::_id_1356();
}

_id_4DA7()
{
    anim._id_629A = _func_0B4( 0, 15 );
    anim._id_6299 = _func_0B4( 0, 10 );
    anim._id_60C7 = gettime() + _func_0B4( 0, 20000 );
    anim._id_60C8 = gettime() + _func_0B4( 0, 10000 );
    anim._id_60C6 = gettime() + _func_0B4( 0, 15000 );
}

_id_4DC2()
{
    for ( var_0 = 0; var_0 < level._id_0323.size; var_0++ )
    {
        var_1 = level._id_0323[var_0];
        var_1._id_440D["fraggrenade"] = _func_0B4( 1000, 20000 );
        var_1._id_440D["flash_grenade"] = _func_0B4( 1000, 20000 );
        var_1._id_440D["double_grenade"] = _func_0B4( 1000, 60000 );
        var_1._id_440D["microwave_grenade"] = _func_0B4( 1000, 20000 );
        var_1._id_62A3 = 0;
        var_1._id_55A4 = -1000000;
        var_1._id_55A2 = -1000000;
        var_1 thread _id_7FBE();
    }

    anim._id_440D["AI_fraggrenade"] = _func_0B4( 0, 20000 );
    anim._id_440D["AI_flash_grenade"] = _func_0B4( 0, 20000 );
    anim._id_440D["AI_smoke_grenade_american"] = _func_0B4( 0, 20000 );
    anim._id_440D["AI_microwave_grenade"] = _func_0B4( 0, 20000 );
    animscripts\combat_utility::_id_4DC3();
}

_id_4D7D()
{
    level._id_5574 = [];
    level._id_5574["axis"] = 0;
    level._id_5574["allies"] = 0;
    level._id_5574["team3"] = 0;
    level._id_5574["neutral"] = 0;
    level._id_5572 = [];
    level._id_5572["axis"] = ( 0, 0, 0 );
    level._id_5572["allies"] = ( 0, 0, 0 );
    level._id_5572["team3"] = ( 0, 0, 0 );
    level._id_5572["neutral"] = ( 0, 0, 0 );
    level._id_5573 = [];
    level._id_5573["axis"] = ( 0, 0, 0 );
    level._id_5573["allies"] = ( 0, 0, 0 );
    level._id_5573["team3"] = ( 0, 0, 0 );
    level._id_5573["neutral"] = ( 0, 0, 0 );
    level._id_5571 = [];
    level._id_0883 = [];
    level._id_0883["axis"] = 0;
    level._id_0883["allies"] = 0;
    level._id_0883["team3"] = 0;
    level._id_0883["neutral"] = 0;
    level._id_0885 = 30000;
    level._id_0884 = 3;
}

_id_09A7()
{
    var_0 = 0;
    var_1 = 3;

    for (;;)
    {
        var_2 = _func_0D9();

        if ( var_2.size == 0 )
        {
            wait 0.05;
            var_0 = 0;
            continue;
        }

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( !isdefined( var_2[var_3] ) )
                continue;

            var_2[var_3] notify( "do_slow_things" );
            var_0++;

            if ( var_0 == var_1 )
            {
                wait 0.05;
                var_0 = 0;
            }
        }
    }
}

_id_7FBE()
{
    waitframe;

    if ( isdefined( self._id_4441._id_6CB4 ) )
    {
        var_0 = _func_0BC( self._id_4441._id_6CB4 * 0.7 );

        if ( var_0 < 1 )
            var_0 = 1;

        self._id_440D["fraggrenade"] = _func_0B4( 0, var_0 );
        self._id_440D["flash_grenade"] = _func_0B4( 0, var_0 );
        self._id_440D["microwave_grenade"] = _func_0B4( 0, var_0 );
    }

    if ( isdefined( self._id_4441._id_6C95 ) )
    {
        var_0 = _func_0BC( self._id_4441._id_6C95 );
        var_1 = _func_0BC( var_0 / 2 );

        if ( var_0 <= var_1 )
            var_0 = var_1 + 1;

        self._id_440D["double_grenade"] = _func_0B4( var_1, var_0 );
    }
}

_id_139C()
{
    if ( isdefined( level._id_2B15 ) )
        return;

    self endon( "death" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_0 thread _id_A5A4::_id_43E9();
    }
}

_id_8335()
{
    anim._id_7125 = 60;
    anim._id_7124 = [];

    for ( var_0 = 0; var_0 < anim._id_7125; var_0++ )
        anim._id_7124[var_0] = var_0;

    for ( var_0 = 0; var_0 < anim._id_7125; var_0++ )
    {
        var_1 = _func_0B2( anim._id_7125 );
        var_2 = anim._id_7124[var_0];
        anim._id_7124[var_0] = anim._id_7124[var_1];
        anim._id_7124[var_1] = var_2;
    }
}

_id_6467()
{
    if ( isdefined( level._id_2B2B ) )
        return;

    self waittill( "death" );

    if ( !isdefined( self ) )
    {
        if ( isdefined( self.a._id_9C3C ) )
            self.a._id_9C3C delete();
    }
}

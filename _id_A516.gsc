// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_058F["_breach_doorbreach_detpack"] = loadfx( "fx/explosions/exp_pack_doorbreach" );
    level._id_058F["_breach_doorbreach_kick"] = loadfx( "fx/dust/door_kick" );
    level._id_78BA["_breach_doorbreach_detpack"] = "detpack_explo_main";
    level._id_78BA["breach_wooden_door"] = "";
    level._id_78BA["breach_wood_door_kick"] = "wood_door_kick";
    common_scripts\utility::_id_0CDB( getentarray( "breached_door", "script_noteworthy" ), ::_meth_8056 );
    common_scripts\utility::_id_0CDB( getentarray( "breached_door", "script_noteworthy" ), ::_meth_82BB );
    common_scripts\utility::_id_383D( "begin_the_breach" );
}

_id_17AD( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "breach_abort" );

    if ( isdefined( var_5 ) && var_5 == 0 )
        anim._id_37BF["scripted"] = ::_id_1783;

    self._id_38C7 = 0;
    self._id_1FE1 = undefined;
    self._id_0C6D = undefined;
    self._id_17B6 = 0;
    self._id_17BB = 0;
    self._id_17BC = 0;
    self._id_858F = 0;
    self._id_71E3 = 0;
    self._id_0941 = 0;
    self._id_06C3 = 0;
    self._id_1EE9 = 0;
    self._id_472A = 1;
    self._id_472E = 0;
    self._id_4A35 = 0;
    var_6 = getentarray( self._id_04A6, "targetname" );
    var_7 = self._id_04A6;
    self._id_7829 = "badplace_" + var_7;
    self._id_1261 = getent( "badplace_" + var_7, "targetname" );

    if ( isdefined( self._id_1261 ) )
    {

    }

    self._id_17C8 = getent( "trigger_" + var_7, "targetname" );

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( isdefined( self._id_17C8 ) )
    {
        switch ( self._id_17C8.classname )
        {
            case "trigger_use":
                self._id_9812 = var_2;
                break;
            case "trigger_use_touch":
                self._id_9812 = var_2;
                break;
            case "trigger_radius":
                break;
            case "trigger_multiple":
                break;
            default:
                break;
        }
    }

    switch ( var_1 )
    {
        case "explosive_breach_left":
            break;
        case "shotgunhinges_breach_left":
            break;
        case "flash_breach_no_door_right":
            self._id_472A = 0;
            self._id_472E = 1;
            break;
        default:
            break;
    }

    if ( self._id_472A == 1 )
    {
        var_8 = undefined;

        if ( isdefined( self._id_04A4 ) )
            var_8 = getent( self._id_04A4, "targetname" );

        if ( isdefined( var_8 ) && isdefined( var_8._id_0398 ) && var_8._id_0398 == "breach_anim_ent" )
            self._id_0C6D = var_8;

        self._id_3015 = getent( self._id_7A26, "script_linkname" );

        if ( self._id_3015.classname == "script_model" )
        {
            self.edoorpivot = spawn( "script_origin", self._id_3015._id_02E2 );
            self.edoorpivot.angles = self._id_3015.angles;
        }
        else if ( self._id_3015.classname == "script_brushmodel" && !isdefined( self._id_0C6D ) )
        {
            self.edoorpivot = getent( self._id_3015._id_04A4, "targetname" );
            self._id_3015._id_9C6F = anglestoforward( self.edoorpivot.angles );
        }

        if ( !isdefined( self._id_0C6D ) )
            self._id_0C6D = self.edoorpivot;

        self._id_0C6D._id_04D9 = "Cover Right";
        self._id_3017 = getent( self._id_3015._id_7A26, "script_linkname" );
        self._id_4B9A = self._id_3017._id_79BF;

        if ( isdefined( self._id_3017._id_7A26 ) )
        {
            var_9 = getent( self._id_3017._id_7A26, "script_linkname" );

            if ( isdefined( var_9 ) && isdefined( var_9._id_0398 ) && var_9._id_0398 == "breached_door" )
                self.ebreacheddoor = var_9;
        }
    }
    else if ( self._id_472A == 0 )
        self._id_0C6D = getent( self._id_7A26, "script_linkname" );

    if ( self._id_472E == 1 )
    {
        self._id_4404 = getent( "flashthrow_" + var_7, "targetname" );
        self._id_43FE = getent( self._id_4404._id_04A4, "targetname" );
    }

    thread _id_1767( var_0 );
    thread _id_1770( var_0 );
    thread _id_17A0( var_1, var_4 );
    var_10 = 0;

    for ( var_11 = 0; var_11 < var_0.size; var_11++ )
    {
        if ( isdefined( var_0[var_11]._id_3817 ) )
        {
            var_10++;
            self._id_1FE1 = var_0[var_11];
        }
    }

    if ( var_10 > 0 )
    {

    }
    else
        self._id_1FE1 = common_scripts\utility::_id_3F33( self.edoorpivot._id_02E2, var_0 );

    if ( var_0.size == 1 )
        self._id_858F = 1;

    for ( var_11 = 0; var_11 < var_0.size; var_11++ )
        var_0[var_11] thread _id_17BA( self, var_1, var_5 );

    while ( self._id_17BB < var_0.size )
        wait 0.05;

    self notify( "ready_to_breach" );
    self._id_71E3 = 1;

    if ( isdefined( self._id_17C8 ) )
    {
        self._id_17C8 thread _id_17B1( self );
        self waittill( "execute_the_breach" );
    }
    else
        self notify( "execute_the_breach" );

    common_scripts\utility::_id_383F( "begin_the_breach" );
    self._id_06C3 = 1;

    if ( isdefined( var_3 ) && var_3 == 1 )
    {
        var_12 = getentarray( "hostiles_" + var_7, "targetname" );
        self waittill( "spawn_hostiles" );
        _id_8994( var_12 );
        self._id_4A35 = 1;
    }

    if ( isdefined( self._id_1261 ) )
        badplace_cylinder( self._id_7829, -1, self._id_1261._id_02E2, self._id_1261._id_0351, 200, "bad_guys" );

    var_13 = _func_0D9( "bad_guys" );
    var_14 = [];

    for ( var_11 = 0; var_11 < var_13.size; var_11++ )
    {
        if ( var_13[var_11] _meth_80AB( self ) )
            var_14[var_14.size] = var_13[var_11];
    }

    if ( var_14.size > 0 )
        common_scripts\utility::_id_0D13( var_14, ::_id_1776, self );

    while ( !self._id_0941 )
        wait 0.05;

    self notify( "breach_complete" );

    if ( !var_14.size )
        return;

    while ( !self._id_1EE9 )
    {
        wait 0.05;

        for ( var_11 = 0; var_11 < var_14.size; var_11++ )
        {
            if ( !_func_1A1( var_14[var_11] ) )
                var_14 = common_scripts\utility::_id_0CF6( var_14, var_14[var_11] );

            if ( var_14.size == 0 )
                self._id_1EE9 = 1;
        }
    }
}

_id_1774()
{
    while ( self._id_17C3 == 1 )
    {
        self waittillmatch( "single anim", "fire" );
        self.a._id_55D7 = gettime();
    }
}

_id_17BA( var_0, var_1, var_2 )
{
    self._id_17C3 = 1;
    self._id_17B5 = undefined;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    self _meth_81A7( 1 );
    thread _id_41C7();
    var_0 endon( "breach_abort" );
    self._id_315B = "stop_idle_" + self _meth_81B5();
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;

    if ( self == var_0._id_1FE1 )
        var_3 = "01";
    else
        var_3 = "02";

    if ( var_0._id_858F == 1 && var_1 == "explosive_breach_left" )
        var_3 = "02";

    switch ( var_1 )
    {
        case "explosive_breach_left":
            if ( isdefined( self._id_9BF0 ) && self._id_9BF0 == 0 )
                var_4 = "detcord_stack_left_start_no_approach_" + var_3;
            else
                var_4 = "detcord_stack_left_start_" + var_3;

            var_5 = "detcord_stack_leftidle_" + var_3;
            var_6 = "detcord_stack_leftbreach_" + var_3;
            break;
        case "shotgunhinges_breach_left":
            var_4 = "shotgunhinges_breach_left_stack_start_" + var_3;
            var_5 = "shotgunhinges_breach_left_stack_idle_" + var_3;
            var_6 = "shotgunhinges_breach_left_stack_breach_" + var_3;
            break;
        case "flash_breach_no_door_right":
            if ( var_0._id_858F == 1 )
            {
                var_4 = "flash_stack_right_start_single";
                var_5 = "flash_stack_right_idle_single";
                var_6 = "flash_stack_right_breach_single";
                var_7 = "flash_stack_right_flash_single";
            }
            else
            {
                var_4 = "flash_stack_right_start_" + var_3;
                var_5 = "flash_stack_right_idle_" + var_3;
                var_6 = "flash_stack_right_breach_" + var_3;
                var_7 = "flash_stack_right_flash_" + var_3;
            }

            break;
        default:
            break;
    }

    _id_17A7( 64 );

    if ( !isdefined( self._id_9BF0 ) || self._id_9BF0 )
        var_0._id_0C6D _id_A510::_id_0BD0( self, var_4 );
    else
    {
        self._id_03A8 = var_0._id_0C6D;
        var_0._id_0C6D _id_A510::_id_0BD1( self, var_4 );
    }

    var_0._id_0C6D _id_A510::_id_0BC9( self, var_4 );
    var_0._id_0C6D thread _id_A510::_id_0BCE( self, var_5, self._id_315B );
    self._id_7F7E = self._id_02E2;
    var_0._id_17BB++;
    self._id_03A8 = undefined;
    var_0 waittill( "execute_the_breach" );

    if ( !var_0._id_38C7 && isdefined( var_7 ) )
    {
        var_0._id_0C6D notify( self._id_315B );
        var_0._id_0C6D thread _id_A510::_id_0BC9( self, var_7 );
        wait 1;

        if ( var_3 == "02" || var_0._id_858F == 1 )
        {
            var_8 = "J_Mid_LE_1";
            self _meth_801D( "projectile_m84_flashbang_grenade", var_8 );
            var_9 = self._id_01D6;
            self._id_01D6 = "flash_grenade";
            self._id_01D0++;

            if ( var_3 == "02" )
                self waittillmatch( "single anim", "grenade_throw" );

            if ( var_0._id_858F == 1 && var_3 == "01" )
                self waittillmatch( "single anim", "fire" );

            self _meth_8039( var_0._id_4404._id_02E2, var_0._id_43FE._id_02E2, level._id_4B9D );
            self _meth_802A( "projectile_m84_flashbang_grenade", var_8 );
            self._id_01D6 = var_9;
            self._id_01D0 = 0;
        }

        self waittillmatch( "single anim", "end" );
        var_0._id_0C6D thread _id_A510::_id_0BCE( self, var_5, self._id_315B );
        wait 0.1;
    }

    var_0._id_0C6D notify( self._id_315B );

    if ( var_2 == 0 )
        self._id_17B5 = 1;

    var_0._id_0C6D thread _id_A510::_id_0BC9( self, var_6 );

    if ( var_1 == "explosive_breach_left" )
    {
        if ( var_3 == "02" )
        {
            var_0._id_3015 thread door_animation( "explosive", var_0 );
            thread _id_2986( var_0 );
            self waittillmatch( "single anim", "pull fuse" );
            wait 1;
            var_0 notify( "spawn_hostiles" );
            var_0 notify( "detpack_about_to_blow" );
            self waittillmatch( "single anim", "explosion" );
            var_0 notify( "detpack_detonated" );
            var_0._id_17B6 = 1;
            var_0._id_3015 thread _id_2D4C( "explosive", var_0 );
            var_0 notify( "play_breach_fx" );
        }
    }
    else if ( var_1 == "shotgunhinges_breach_left" )
    {
        if ( var_3 == "01" )
        {
            var_0._id_3015 thread door_animation( "shotgun", var_0 );
            var_0 notify( "spawn_hostiles" );
            self waittillmatch( "single anim", "kick" );
            var_0._id_3015 thread _id_2D4C( "shotgun", var_0 );
            var_0 notify( "play_breach_fx" );
        }
    }
    else if ( var_1 == "flash_breach_no_door_right" )
    {

    }

    self waittillmatch( "single anim", "end" );
    self notify( "breach_complete" );

    if ( var_2 == 0 )
        self._id_17B5 = undefined;

    if ( isdefined( level._id_3A44 ) )
        self thread [[ level._id_3A44 ]]( var_0 );

    var_0._id_0941 = 1;
    self _meth_81A7( 0 );
    _id_17A3();

    while ( !var_0._id_1EE9 )
        wait 0.05;

    self._id_17C3 = 0;
}

_id_1783()
{
    if ( isdefined( self._id_17B5 ) )
        return;

    animscripts\notetracks::_id_37C7();
}

_id_2986( var_0 )
{
    thread _id_889D( var_0 );
    self waittillmatch( "single anim", "attach prop right" );
    var_1 = "TAG_INHAND";
    self _meth_801D( "weapon_detcord", var_1 );
    self waittillmatch( "single anim", "detach prop right" );
    var_2 = self _meth_8184( var_1 );
    var_3 = self _meth_8185( var_1 );
    self _meth_802A( "weapon_detcord", var_1 );
    var_4 = spawn( "script_model", var_2 );
    var_4 _meth_80B3( "weapon_detcord" );
    var_4.angles = var_3;
    var_0 waittill( "detpack_detonated" );
    _func_189( var_4._id_02E2, 64, 50, 25 );
    var_4 delete();
}

_id_889D( var_0 )
{
    self waittillmatch( "single anim", "sound effect" );
    thread common_scripts\utility::_id_69C2( "detpack_plant_arming", var_0.edoorpivot._id_02E2 );
}

_id_1776( var_0 )
{
    self endon( "death" );
    var_0 endon( "breach_aborted" );
    var_0 waittill( "detpack_detonated" );

    if ( _func_0EE( self._id_02E2, var_0.edoorpivot._id_02E2 ) <= level._id_29B8 )
    {
        level._id_8F75++;

        if ( level._id_8F75 > 2 )
            level._id_8F75 = 1;

        var_1 = "exposed_flashbang_v" + level._id_8F75;
        self.allowdeath = 1;
        _id_A510::_id_0BCA( self, "gravity", var_1 );
        _id_17A3();
    }
}

_id_17B1( var_0 )
{
    var_0 endon( "execute_the_breach" );
    var_0 endon( "breach_aborted" );
    thread _id_17B0( var_0 );
    self waittill( "trigger" );
    var_0 notify( "execute_the_breach" );
}

_id_17B0( var_0 )
{
    var_0 waittill( "execute_the_breach" );
    common_scripts\utility::_id_97CC();

    if ( isdefined( var_0._id_3012 ) )
        var_0._id_3012 delete();
}

_id_1767( var_0 )
{
    self endon( "breach_complete" );
    self waittill( "breach_abort" );
    self._id_1EE9 = 1;
    thread _id_1770( var_0 );
}

_id_1770( var_0 )
{
    while ( !self._id_1EE9 )
        wait 0.05;

    if ( isdefined( self._id_1261 ) )
        badplace_delete( self._id_7829 );

    while ( !self._id_1EE9 )
        wait 0.05;

    common_scripts\utility::_id_0D13( var_0, ::_id_1768, self );
}

_id_1768( var_0 )
{
    self endon( "death" );
    _id_17A3();
    _id_17A4();
    var_0._id_0C6D notify( self._id_315B );
    self notify( "stop_infinite_ammo" );
    self _meth_81A7( 0 );
}

_id_17A0( var_0, var_1 )
{
    self endon( "breach_aborted" );
    self endon( "breach_complete" );

    switch ( var_0 )
    {
        case "explosive_breach_left":
            self waittill( "play_breach_fx" );
            common_scripts\_exploder::_id_3528( self._id_4B9A );
            thread common_scripts\utility::_id_69C2( level._id_78BA["breach_wooden_door"], self._id_3017._id_02E2 );
            thread common_scripts\utility::_id_69C2( level._id_78BA["_breach_doorbreach_detpack"], self._id_3017._id_02E2 );

            if ( var_1 )
                playfx( level._id_058F["_breach_doorbreach_detpack"], self._id_3017._id_02E2, anglestoforward( self._id_3017.angles ) );

            break;
        case "shotgunhinges_breach_left":
            self waittill( "play_breach_fx" );
            common_scripts\_exploder::_id_3528( self._id_4B9A );

            if ( var_1 )
                playfx( level._id_058F["_breach_doorbreach_kick"], self._id_3017._id_02E2, anglestoforward( self._id_3017.angles ) );

            break;
        case "flash_breach_no_door_right":
            break;
        default:
            break;
    }
}

_id_89E3( var_0 )
{
    var_1 = var_0 _meth_8095();
    _id_A5A4::_id_88F1( var_1 );
    return var_1;
}

_id_8994( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = _id_89E3( var_0[var_2] );
        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_41C7()
{
    self endon( "death" );
    self endon( "stop_infinite_ammo" );

    while ( isdefined( self._id_0513 ) )
    {
        if ( isdefined( self._id_0513 ) && self._id_0513 == "none" )
            break;

        self._id_18B0 = _func_1B1( self._id_0513 );
        wait 0.5;
    }
}

door_animation( var_0, var_1 )
{
    var_2 = "breach_door";

    if ( !isdefined( level._id_78AC[var_2] ) )
        return;

    var_3 = undefined;

    switch ( var_0 )
    {
        case "explosive":
            var_3 = "explosive_breach_left_door";
            break;
        case "shotgun":
            var_3 = "shotgunhinges_breach_left_door";
            break;
    }

    if ( !isdefined( var_3 ) )
        return;

    if ( !isdefined( level._id_78AC[var_2][var_3] ) )
        return;

    var_4 = common_scripts\utility::_id_9294( isdefined( var_1.ebreacheddoor ), var_1.ebreacheddoor, self );
    var_4 _id_A5A4::_id_0D61( var_2 );
    var_4 thread _id_A510::_id_0C24( var_4, var_3 );
    var_1.isdooranimated = 1;
}

_id_2D4C( var_0, var_1, var_2 )
{
    var_3 = self;

    if ( isdefined( var_1.ebreacheddoor ) )
    {
        self _meth_8056();
        self _meth_82BB();
        var_1.ebreacheddoor _meth_8055();
        var_1.ebreacheddoor _meth_82BA();
        var_3 = var_1.ebreacheddoor;
    }

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_2 == 1 )
        self _meth_809C( level._id_78BA["breach_wood_door_kick"] );

    switch ( var_0 )
    {
        case "explosive":
            if ( !isdefined( var_1.isdooranimated ) || !var_1.isdooranimated )
                var_3 thread _id_2D45( var_1.edoorpivot );

            _id_2D44();
            self _meth_809C( level._id_78BA["breach_wooden_door"] );
            _func_18C( 0.4, 1, self._id_02E2, 1000 );
            _func_189( self._id_02E2, 56, level._id_5A2E, level._id_5C43 );
            break;
        case "shotgun":
            if ( !isdefined( var_1.isdooranimated ) || !var_1.isdooranimated )
                var_3 thread _id_2D45( var_1.edoorpivot );

            _id_2D44();
            self _meth_809C( level._id_78BA["breach_wooden_door"] );
            break;
    }
}

_id_2D44()
{
    if ( self.classname == "script_brushmodel" )
        self _meth_805A();
    else
    {
        var_0 = getent( self._id_04A4, "targetname" );
        var_0 _meth_8056();
        var_0 _meth_82BB();
        var_0 _meth_805A();
    }
}

_id_2D45( var_0 )
{
    var_1 = undefined;

    if ( self.classname == "script_model" )
        var_1 = anglestoforward( self.angles );
    else if ( self.classname == "script_brushmodel" )
        var_1 = self._id_9C6F;
    else
    {

    }

    var_2 = ( var_1[0] * 20, var_1[1] * 20, var_1[2] * 20 );
    self _meth_82AA( self._id_02E2 + var_2, 0.5, 0, 0.5 );
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3.angles = var_0.angles;
    var_3._id_02E2 = ( self._id_02E2[0], self._id_02E2[1], var_0._id_02E2[2] );
    self _meth_804F( var_3 );
    var_3 _meth_82B2( 90, 0.45, 0.4 );
    wait 0.45;
    var_3 _meth_82B2( -4, 0.2, 0, 0.2 );
    wait 0.2;
    var_3 _meth_82B2( 4, 0.15, 0.15 );
    wait 0.15;
    self _meth_8051();
    var_3 delete();
}

_id_17A7( var_0 )
{
    if ( !isdefined( self._id_63A3 ) )
        self._id_63A3 = self._id_01C4;

    self._id_01C4 = var_0;
}

_id_17A4()
{
    if ( isdefined( self._id_63A3 ) )
        self._id_01C4 = self._id_63A3;

    self._id_63A3 = undefined;
}

_id_17A6( var_0 )
{
    if ( !isdefined( self._id_6395 ) )
        self._id_6395 = self._id_0C72;

    self._id_0C72 = var_0;
}

_id_17A3()
{
    if ( isdefined( self._id_6395 ) )
        self._id_0C72 = self._id_6395;

    self._id_6395 = undefined;
}

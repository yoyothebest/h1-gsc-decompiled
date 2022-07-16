// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    level._id_78AC["dead_guy"]["death1"] = %exposed_death_nerve;
    level._id_78AC["dead_guy"]["death2"] = %exposed_death_falltoknees;
    level._id_78AC["dead_guy"]["death3"] = %exposed_death_headtwist;
    level._id_78AC["dead_guy"]["death4"] = %exposed_crouch_death_twist;
    level._id_78AC["dead_guy"]["death5"] = %exposed_crouch_death_fetal;
    level._id_78AC["dead_guy"]["death6"] = %death_sitting_pose_v1;
    level._id_78AC["dead_guy"]["death7"] = %death_sitting_pose_v2;
    level._id_78AC["dead_guy"]["death8"] = %death_pose_on_desk;
    level._id_78AC["dead_guy"]["death9"] = %death_pose_on_window;
    level._id_78AC["dead_guy"]["death6_aftermath"] = %death_sitting_pose_v1_alt_aftermath;
    level._id_78B1["dead_guy"] = #animtree;
    level.dead_body_count = 1;
    var_0 = getdvarint( "ragdoll_max_simulating" ) - 6;

    if ( var_0 > 0 )
        level.max_number_of_dead_bodies = var_0;
    else
        level.max_number_of_dead_bodies = 0;

    var_1 = spawnstruct();
    var_1.bodies = [];
    common_scripts\utility::_id_76BB( "trigger_body", ::trigger_body, var_1 );
    common_scripts\utility::_id_76BB( "dead_body", ::spawn_dead_body, var_1 );
}

trigger_body( var_0 )
{
    self waittill( "trigger" );
    var_1 = getentarray( self._id_04A4, "targetname" );
    common_scripts\utility::_id_0D13( var_1, ::spawn_dead_body, var_0 );
}

spawn_dead_body( var_0 )
{
    set_deadbody_info();

    if ( !h1_ragdollspecialcase( self ) && !getdvarint( "ragdoll_enable" ) && isdefined( self.require_ragdoll ) && self.require_ragdoll )
        return;

    if ( !h1_ragdollspecialcase( self ) && level.max_number_of_dead_bodies == 0 )
        return;

    var_1 = undefined;

    if ( isdefined( self._id_7A18 ) )
        var_1 = self._id_7A18;
    else
    {
        level.dead_body_count++;

        if ( level.dead_body_count > 3 )
            level.dead_body_count = 1;

        var_1 = level.dead_body_count;
    }

    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2._id_02E2 = self._id_02E2;
    var_2.angles = self.angles;
    var_2._id_0C72 = "dead_guy";
    var_2 _id_A5A4::_id_0D61();

    if ( _id_A5A4::is_h1_level() )
        var_2 _meth_855D();

    if ( !h1_ragdollspecialcase( self ) )
        var_0 que_body( var_2 );

    if ( isdefined( self.custom_deadbody ) )
    {
        precache_custom_deadbody();
        custom_deadbody( var_2 );
    }
    else
        var_2 [[ level.scr_deadbody[var_1] ]]();

    if ( !isdefined( self._id_7AF8 ) )
    {
        var_3 = _func_06B( var_2._id_02E2 + ( 0, 0, 5 ), var_2._id_02E2 + ( 0, 0, -64 ), 0, undefined );
        var_2._id_02E2 = var_3["position"];
    }

    if ( isdefined( self.custom_death_anim ) )
    {
        if ( isdefined( self.link_corpse_clip ) )
        {
            var_4 = getent( "corpse_clip_" + self._id_0398, "targetname" );

            if ( isdefined( var_4 ) )
            {
                var_4._id_02E2 = var_2._id_02E2;
                var_4 _meth_804F( var_2, "tag_origin" );
            }
        }

        var_2 thread lookat_custom_death_anim( self._id_0398 );
    }
    else
    {
        var_2 _meth_8113( "flag", var_2 _id_A5A4::_id_3EF5( self._id_0398 ), 1, 0, 1 );
        var_2 waittillmatch( "flag", "end" );

        if ( !isdefined( self._id_7ADA ) )
            var_2 _meth_8023();
    }
}

que_body( var_0 )
{
    self.bodies[self.bodies.size] = var_0;

    if ( self.bodies.size <= level.max_number_of_dead_bodies )
        return;

    self.bodies[0] delete();
    self.bodies = common_scripts\utility::_id_0D01( self.bodies );
}

lookat_custom_death_anim( var_0 )
{
    _id_A510::_id_0BC7( self, var_0 );
    wait 0.5;
    var_1 = _func_0B7( 45 );
    var_2 = 0;

    for (;;)
    {
        if ( _func_0F0( level._id_0318._id_02E2, self._id_02E2 ) > 5000 && ( !checksighttrace( self ) || !common_scripts\utility::_id_A347( level._id_0318 _meth_80AA(), level._id_0318 _meth_8338(), self._id_02E2 + ( 0, 0, 12 ), var_1 ) ) )
            var_2 = 0;
        else
            var_2++;

        if ( var_2 > 5 )
            break;

        waittillframeend;
    }

    _id_A510::_id_0C24( self, var_0 );
}

checksighttrace( var_0 )
{
    var_1 = var_0 _meth_8184( "J_Ankle_LE" ) + ( 0, 0, 3 );
    var_2 = var_0 _meth_8184( "J_Hip_RI" );
    var_3 = var_0 _meth_8184( "J_HEAD" );
    return _func_08E( level._id_0318 _meth_80AA(), var_1, 0, level._id_0318, self ) || _func_08E( level._id_0318 _meth_80AA(), var_2, 0, level._id_0318, self ) || _func_08E( level._id_0318 _meth_80AA(), var_3, 0, level._id_0318, self );
}

set_deadbody_info()
{
    if ( !isdefined( self._id_7A99 ) )
        return;

    var_0 = _func_124( self._id_7A99, "|" );

    foreach ( var_2 in var_0 )
    {
        if ( _func_120( var_2, "custom_deadbody" ) )
        {
            self.custom_deadbody = get_custom_deadbody( var_2 );
            continue;
        }

        if ( _func_120( var_2, "custom_death_anim" ) )
        {
            self.custom_death_anim = 1;
            continue;
        }

        if ( _func_120( var_2, "require_ragdoll" ) )
        {
            self.require_ragdoll = 1;
            continue;
        }

        if ( _func_120( var_2, "link_corpse_clip" ) )
            self.link_corpse_clip = 1;
    }
}

get_custom_deadbody( var_0 )
{
    var_1 = _func_124( var_0, ":, " );
    var_1 = common_scripts\utility::_id_0CF6( var_1, var_1[0] );
    var_2 = spawnstruct();
    var_2.body = var_1[0];
    var_2._id_01E2 = var_1[1];
    var_2._id_9F32 = var_1[2];
    var_2.clothtype = var_1[3];
    return var_2;
}

precache_custom_deadbody()
{
    precachemodel( self.custom_deadbody.body );
    precachemodel( self.custom_deadbody._id_01E2 );
}

custom_deadbody( var_0 )
{
    var_0 _meth_80B3( self.custom_deadbody.body );
    var_0 _meth_801D( self.custom_deadbody._id_01E2, "", 1 );
    var_0._id_477D = self.custom_deadbody._id_01E2;
    var_0._id_9F32 = self.custom_deadbody._id_9F32;
    var_0 _meth_83D9( self.custom_deadbody.clothtype );
}

h1_ragdollspecialcase( var_0 )
{
    return isdefined( level.dead_bodies_ignore_ragdoll_settings ) || isdefined( var_0.custom_death_anim );
}

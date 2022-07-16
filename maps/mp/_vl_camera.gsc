// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init_camera()
{
    level._id_2C76 = spawnstruct();
    level._id_2C76._id_3ADD = 0.25;
    level._id_2C76._id_7833 = -0.3;
    level._id_2C76._id_3ADC = 3;
}

_id_8073()
{
    var_0 = spawnstruct();
    var_0._id_2C74 = 12;
    var_0.gamelobbygroup_camera_normalz = 507;
    var_0.gamelobbygroup_camera_normaldistance = 96.8;
    var_0._id_705F = [];
    var_1 = getdvarint( "virtualLobbyMode", 0 );

    if ( var_1 == 0 )
        setdvar( "virtualLobbyReady", "0" );

    level._id_1A3E = var_0;
}

spawncamera( var_0 )
{
    var_1 = ( -70.7675, -691.293, 507.472 );
    var_2 = ( 0, 87, 0 );
    var_3 = common_scripts\utility::_id_40FB( "camera", "targetname" );

    if ( isdefined( var_3 ) )
    {
        var_1 = var_3._id_02E2;
        var_2 = var_3.angles;
    }

    var_4 = spawn( "script_model", var_1 );
    var_4 _meth_80B3( "tag_player" );
    var_4.angles = var_2;
    var_4._id_8D33 = var_1;
    var_4._id_8CFF = var_2;
    var_4._id_256A = 1;
    var_4._id_3796 = 1;
    var_0._id_1A13 = var_4;
    return var_4;
}

cameralink( var_0, var_1 )
{
    var_1 _meth_8335( var_0._id_02E2 );
    var_1 _meth_807E( var_0, "tag_player" );
    var_1 _meth_81E5( var_0, "tag_player" );
}

playerupdatecamera()
{
    self notify( "stopCamera" );
    var_0 = self;
    var_1 = level._id_1A3E;
    var_2 = level._id_1A3E._id_1A13;

    if ( level._id_4C03 )
        return;

    _id_382D();

    if ( var_1._id_60B3 != var_1._id_5D35 )
    {
        if ( var_1._id_60B3 == "cac" )
        {
            if ( var_1._id_5D35 == "cac_weap" )
                var_2._id_256A = 1;
        }
        else if ( var_1._id_60B3 == "game_lobby" )
        {
            var_3 = 0;

            foreach ( var_6, var_5 in level._id_9EAB )
            {
                var_3 = var_6;
                break;
            }

            if ( var_1._id_5D35 == "cao" || var_1._id_5D35 == "cac" )
                var_2._id_3796 = 1;

            if ( isdefined( level._id_9EAB ) && isdefined( level._id_9EA2 ) && isdefined( level._id_9EAB[level._id_9EA2] ) )
                var_0 maps\mp\_vl_base::_id_6F0F( level._id_9EAB[level._id_9EA2], level._id_9EAB[level._id_9EA2].angles );

            var_2._id_256A = 1;
            level._id_9EA2 = var_3;
            var_7 = level._id_9EAB[var_3];
            var_2._id_117A = var_7._id_117A;
        }

        var_1._id_5D35 = var_1._id_60B3;
    }

    if ( var_1._id_5D35 == "cac" )
    {
        var_7 = level._id_9EAB[level._id_9EA2];
        maps\mp\_vl_avatar::showavataronly( var_7, 0 );
        updatecameracac( var_2, var_1, var_7, 10 );
        thread set_avatar_dof_delayed();
    }
    else if ( var_1._id_5D35 == "cao" )
    {
        var_7 = level._id_9EAB[level._id_9EA2];
        maps\mp\_vl_avatar::showavataronly( var_7, 0 );
        updatecameracao( var_2, var_1, var_7, 0 );
    }
    else if ( var_1._id_5D35 == "collections" )
    {
        var_7 = level._id_9EAB[level._id_9EA2];
        updatecameracollections( var_2, var_1, var_7, 0 );
    }
    else if ( var_1._id_5D35 == "armory" )
    {
        var_7 = level._id_9EAB[level._id_9EA2];
        maps\mp\_vl_avatar::showavataronly( var_7, 0 );
        updatecameraarmory( var_2, var_1, var_7, 0 );
    }
    else if ( var_1._id_5D35 == "cac_weap" )
        updatecameracacweap( var_2, var_1 );
    else if ( var_1._id_5D35 == "equip" )
    {
        var_7 = level._id_9EAB[level._id_9EA2];
        maps\mp\_vl_avatar::showavataronly( var_7, 0 );
        updatecameraequip( var_2, var_1, var_7, 10 );
        thread set_avatar_dof_delayed();
    }
    else if ( var_1._id_5D35 == "depot" )
        updatecameradepot( var_2, var_1 );
    else
    {
        var_7 = level._id_9EAB[level._id_9EA2];
        maps\mp\_vl_avatar::showavataronly( var_7, 1 );
        maps\mp\_vl_avatar::playerteleportavatartoweaponroom( var_7, var_2, 1 );
        updatecameralobby( var_2, var_1, var_7 );
        thread setavatarweaponroomdofdelayed( var_7 );
    }
}

_id_9EA7()
{
    var_0 = self;
    var_0 _meth_84A5();
}

setavatarweaponroomdofdelayed( var_0 )
{
    self endon( "playerVlSetPhysicalDepthOfField" );
    level.weapon_room_dof = undefined;
    var_1 = _func_1B8( var_0._id_0340 );
    waittillframeend;
    var_2 = 1;
    var_3 = 120;

    switch ( var_1 )
    {
        case "sniper":
            var_2 = 2.7;
            var_3 = 99;
            break;
        case "rifle":
            var_2 = 4;
            var_3 = 96;
            break;
        case "smg":
            var_2 = 2.5;
            var_3 = 111;
            break;
        case "spread":
            var_2 = 2.8;
            var_3 = 114;
            break;
        case "mg":
            var_2 = 3;
            var_3 = 118;
            break;
        default:
            break;
    }

    playervlsetphysicaldepthoffield( var_2, var_3 );
}

set_avatar_dof_delayed()
{
    self endon( "playerVlSetPhysicalDepthOfField" );
    waittillframeend;
    _id_7DDB();
}

_id_7DDB( var_0 )
{
    var_1 = 4;
    var_2 = 100;
    playervlsetphysicaldepthoffield( var_1, var_2 );
}

fstop_clamp( var_0 )
{
    if ( var_0 < 0.125 )
        var_0 = 0.125;
    else if ( var_0 > 128 )
        var_0 = 128;

    return var_0;
}

vl_dof_based_on_focus_weap_cac( var_0 )
{
    var_1 = 0;

    if ( maps\mp\_vl_cao::iscollectionsmenuactive() )
        var_1 = -0.0740886 * var_0 + 9.45422;
    else
        var_1 = -0.200097 * var_0 + 19.836;

    var_1 = fstop_clamp( var_1 );
    playervlsetphysicaldepthoffield( var_1, var_0 );
}

playervlsetphysicaldepthoffield( var_0, var_1 )
{
    var_2 = level._id_1A3E._id_2C74;
    self _meth_84A7( var_0, var_1, var_2, var_2 * 2 );
    self notify( "playerVlSetPhysicalDepthOfField" );
}

_id_382D()
{
    if ( !isdefined( level._id_9EAB[level._id_9EA2] ) )
    {
        foreach ( var_2, var_1 in level._id_9EAB )
        {
            level._id_9EA2 = var_2;
            break;
        }
    }
}

_id_1A30( var_0, var_1, var_2, var_3 )
{
    self _meth_8051();

    if ( isdefined( self._id_256A ) )
        self._id_02E2 = var_0;
    else
        self _meth_82AA( var_0, var_1, var_2, var_3 );
}

_id_1A44( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_256A ) )
        self.angles = var_0;
    else
        self _meth_82B1( var_0, var_1, var_2, var_3 );
}

_id_1CF6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 2;

    var_3 = _func_0EE( var_1, var_0._id_02E2 );

    if ( var_3 >= var_2 )
        return 1;
    else
        return 0;
}

updatecamerafinish( var_0 )
{
    if ( isdefined( var_0._id_256A ) )
    {
        var_0 _meth_8094();
        var_0._id_256A = undefined;
    }

    if ( getdvarint( "virtualLobbyReady", 0 ) == 0 )
    {
        wait 1.0;
        setdvar( "virtualLobbyReady", "1" );
        thread maps\mp\_vl_base::_id_8351();
    }
}

updatecameracacweap( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_40FB( "cameraWeapon", "targetname" );
    var_0._id_256A = 1;
    var_0 _id_1A30( var_2._id_02E2 );
    var_0 _id_1A44( var_2.angles );
    updatecamerafinish( var_0 );
}

updatecameracac( var_0, var_1, var_2, var_3 )
{
    var_4 = var_2._id_117A._id_02E2 + anglestoforward( var_2._id_117A.angles ) * var_1.gamelobbygroup_camera_normaldistance;
    var_5 = ( var_4[0], var_4[1], var_1.gamelobbygroup_camera_normalz );
    var_6 = ( 0, var_2._id_117A.angles[1] + 180 + var_3, 0 );
    var_0._id_256A = 1;
    var_0 _id_1A30( var_5 );
    var_0 _id_1A44( var_6 );
    var_0._id_57F4 = "cac";
    updatecamerafinish( var_0 );
}

updatecameracao( var_0, var_1, var_2, var_3 )
{
    var_4 = common_scripts\utility::_id_40FB( "cameraWeapon", "targetname" );
    var_0._id_256A = 1;
    var_0 _id_1A30( var_4._id_02E2 );
    var_0 _id_1A44( var_4.angles );
    var_0._id_57F4 = "cao";
    updatecamerafinish( var_0 );
}

updatecameracollections( var_0, var_1, var_2, var_3 )
{
    var_4 = common_scripts\utility::_id_40FB( "cameraWeapon", "targetname" );
    var_0._id_256A = 1;
    var_0 _id_1A30( var_4._id_02E2 );
    var_0 _id_1A44( var_4.angles );
    var_0._id_57F4 = "collections";
    updatecamerafinish( var_0 );
}

updatecameraarmory( var_0, var_1, var_2, var_3 )
{
    var_4 = common_scripts\utility::_id_40FB( "cameraWeapon", "targetname" );
    var_0._id_256A = 1;
    var_0 _id_1A30( var_4._id_02E2 );
    var_0 _id_1A44( var_4.angles );
    var_0._id_57F4 = "armory";
    updatecamerafinish( var_0 );
}

updatecameraequip( var_0, var_1, var_2, var_3 )
{
    var_4 = var_2._id_117A._id_02E2 + anglestoforward( var_2._id_117A.angles ) * var_1.gamelobbygroup_camera_normaldistance;
    var_5 = ( var_4[0], var_4[1], var_1.gamelobbygroup_camera_normalz );
    var_6 = ( 0, var_2._id_117A.angles[1] + 180 + var_3, 0 );
    var_0._id_256A = 1;
    var_0 _id_1A30( var_5 );
    var_0 _id_1A44( var_6 );
    var_0._id_57F4 = "equip";
    updatecamerafinish( var_0 );
}

updatecameralobby( var_0, var_1, var_2 )
{
    var_3 = maps\mp\_vl_base::getweaponroomstring( var_2._id_0340 );
    var_4 = "camera" + var_3;
    var_5 = common_scripts\utility::_id_40FB( var_4, "targetname" );

    if ( !isdefined( var_5.angles ) )
    {
        var_6 = common_scripts\utility::_id_40FB( var_5._id_04A4, "targetname" );
        var_7 = var_6._id_02E2 - var_5._id_02E2;
        var_5.angles = _func_115( var_7 );
    }

    var_0._id_256A = 1;
    maps\mp\_vl_avatar::cameralinktoscenenode( var_0, var_0.scenenode, "j_prop_2" );
    var_0._id_57F4 = "lobby";
    updatecamerafinish( var_0 );
}

updatecameradepot( var_0, var_1 )
{
    var_2 = common_scripts\utility::_id_40FB( "characterBM", "targetname" );
    var_0._id_256A = 1;
    maps\mp\_vl_avatar::cameralinktoscenenode( var_0, var_0.depotsceneent, "tag_origin_animated" );
    var_0._id_57F4 = "depot";
    updatecamerafinish( var_0 );
}

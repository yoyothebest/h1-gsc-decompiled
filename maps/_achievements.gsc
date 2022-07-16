// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

achievements_init()
{
    level thread master_ninja_init();
    level thread retro_shooter_init();
    level thread weapon_master_init();
    level thread i_hate_dogs_init();
}

master_ninja_init()
{
    common_scripts\utility::_id_383D( "master_ninja_melee_kill" );
    common_scripts\utility::_id_383D( "master_ninja_illegal_kill" );
    _id_A5A4::_id_0761( "axis", ::master_ninja_enemy_spawned );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::master_ninja_enemy_spawned );
    level thread master_ninja_mission_complete();
}

master_ninja_mission_complete()
{
    level endon( "master_ninja_illegal_kill" );
    level waittill( "achievements_level_complete" );

    if ( common_scripts\utility::_id_382E( "master_ninja_melee_kill" ) && !common_scripts\utility::_id_382E( "master_ninja_illegal_kill" ) )
        _id_A5A4::_id_41DD( "MASTER_NINJA" );
}

master_ninja_enemy_spawned()
{
    level endon( "master_ninja_illegal_kill" );
    self waittill( "death", var_0, var_1 );

    if ( isdefined( var_0 ) && var_0 == level._id_0318 )
    {
        if ( var_1 == "MOD_MELEE" )
            common_scripts\utility::_id_383F( "master_ninja_melee_kill" );
        else
            common_scripts\utility::_id_383F( "master_ninja_illegal_kill" );
    }
}

retro_shooter_init()
{
    switch ( level._id_038E )
    {
        case "ac130":
        case "aftermath":
        case "coup":
        case "simplecredits":
            return;
        default:
            break;
    }

    level endon( "retro_shooter_player_reloaded" );
    level thread retro_shooter_mission_complete();

    for (;;)
    {
        level._id_0318 waittill( "reload" );
        level notify( "retro_shooter_player_reloaded" );
    }
}

retro_shooter_mission_complete()
{
    level endon( "retro_shooter_player_reloaded" );
    level waittill( "achievements_level_complete" );
    _id_A5A4::_id_41DD( "RETRO_SHOOTER" );
}

weapon_master_init()
{
    var_0 = get_base_weapon_list();
    _id_A5A4::_id_0761( "axis", ::weapon_master_enemy_spawned );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::weapon_master_enemy_spawned );
    var_1 = _id_A5AA::_id_05BE();
    common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, ::weapon_master_vehicle_spawned );
    common_scripts\utility::_id_0D13( _func_1F2(), ::weapon_master_vehicle_spawned );
    thread weapon_master_barrett();
}

weapon_master_barrett()
{
    if ( level._id_038E == "sniperescape" )
    {
        common_scripts\utility::_id_A069( "weapon_master_barrett_kill", "makarov_killed" );
        weapon_master_register_kill( "barrett" );
    }
}

get_base_weapon_list()
{
    var_0 = [ "ak47", "ak74u", "barrett", "beretta", "c4", "claymore", "colt45", "deserteagle", "dragunov", "frag", "g36c", "g3", "javelin", "m1014", "m14", "m16", "m4", "m60e4", "mp5", "p90", "remington700", "rpd", "rpg", "saw", "skorpion", "stinger", "usp", "uzi", "winchester1200" ];
    return var_0;
}

parse_weapon_name( var_0 )
{
    var_1 = _func_123( var_0 );
    var_2 = get_base_weapon_list();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( _func_120( var_1, var_2[var_3] ) )
            return var_2[var_3];
    }

    return var_1;
}

weapon_master_enemy_spawned()
{
    self waittill( "death", var_0, var_1, var_2 );

    if ( isdefined( var_0 ) && var_0 == level._id_0318 && isdefined( var_2 ) && var_1 != "MOD_MELEE" )
        weapon_master_register_kill( var_2 );
}

weapon_master_vehicle_damaged()
{
    level.weapon_master_explosive = "unknown";
    level.weapon_master_timestamp = 0;
    level.weapon_master_vehicle_id = "unknown";

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
        var_7 = "unknown";
        var_4 = _func_123( var_4 );

        if ( var_4 == "mod_explosive" || var_4 == "mod_explosive_splash" )
        {
            if ( var_0 != 100 )
                var_7 = "c4";
        }
        else if ( var_4 == "mod_projectile" || var_4 == "mod_projectile_splash" )
        {
            if ( var_0 >= 900 )
                var_7 = "javelin";
            else if ( var_0 >= 300 )
            {
                if ( var_1 == level._id_0318 )
                    var_7 = "rpg";
            }
        }

        if ( var_7 != "unknown" )
        {
            level.weapon_master_explosive = var_7;
            level.weapon_master_timestamp = gettime();
            level.weapon_master_vehicle_id = self;
        }
    }
}

weapon_master_vehicle_spawned()
{
    var_0 = self;
    thread weapon_master_vehicle_damaged();
    self waittill( "death", var_1, var_2, var_3 );

    if ( isdefined( var_1 ) && var_1 == level._id_0318 && isdefined( var_3 ) && var_2 != "MOD_MELEE" )
        weapon_master_register_kill( var_3 );
    else
    {
        wait 0.25;

        if ( level.weapon_master_explosive == "unknown" || level.weapon_master_vehicle_id != var_0 )
            return;

        if ( _func_0BE( gettime() - level.weapon_master_timestamp ) <= 1000 )
            weapon_master_register_kill( level.weapon_master_explosive );
    }
}

weapon_master_register_kill( var_0 )
{
    var_0 = parse_weapon_name( var_0 );
    var_1 = common_scripts\utility::_id_0CE8( get_base_weapon_list(), var_0 );

    if ( !isdefined( var_1 ) )
        return;

    if ( common_scripts\utility::_id_382E( "has_cheated" ) || maps\_cheat::is_cheating() )
        return;

    if ( level._id_0318 _meth_8212( "sp_weaponMaster", var_1 ) != "1" )
    {
        level._id_0318 _meth_8213( "sp_weaponMaster", var_1, 1 );
        updategamerprofileall();
        weapon_master_check_success();
    }
}

weapon_master_check_success()
{
    var_0 = get_base_weapon_list();
    var_1 = [];
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = level._id_0318 _meth_8212( "sp_weaponMaster", var_3 );
        var_1[var_0[var_3]] = var_4;

        if ( var_4 == "1" )
            var_2++;
    }

    if ( var_2 == var_0.size || platform_tracks_progression() )
        _id_A5A4::_id_41DD( "WEAPON_MASTER" );
}

i_hate_dogs_init()
{
    _id_A5A4::_id_0761( "axis", ::i_hate_dogs_enemy_spawned );
    common_scripts\utility::_id_0D13( _func_0D9( "axis" ), ::i_hate_dogs_enemy_spawned );
}

i_hate_dogs_enemy_spawned()
{
    if ( !isdefined( self.classname ) )
        return;

    if ( self.classname != "actor_enemy_dog" )
        return;

    self waittill( "death", var_0, var_1 );

    if ( isdefined( var_0 ) && var_0 == level._id_0318 && var_1 == "MOD_MELEE" )
    {
        if ( common_scripts\utility::_id_382E( "has_cheated" ) || maps\_cheat::is_cheating() )
            return;

        var_2 = level._id_0318 _meth_8212( "sp_iHateDogs" );
        var_3 = 20;

        if ( var_2 < var_3 )
        {
            var_2++;
            level._id_0318 _meth_8213( "sp_iHateDogs", var_2 );
            updategamerprofileall();

            if ( var_2 >= var_3 || platform_tracks_progression() )
                _id_A5A4::_id_41DD( "DOGS_I_HATE_DOGS" );
        }
    }
}

platform_tracks_progression()
{
    return level._id_0531 || level._id_02FB;
}

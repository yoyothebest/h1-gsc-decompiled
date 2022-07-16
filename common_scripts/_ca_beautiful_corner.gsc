// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4DD7()
{
    if ( getdvar( "beautiful_corner" ) != "1" )
    {
        _id_1E5F();
        return 0;
    }

    level.beautiful_views = [];
    level.beautiful_visions = [];
    level.beautiful_lightsets = [];
    level.beautiful_cluts = [];
    level.beautiful_dof = [];
    level.beautiful_view_static = 1;
    level.beautiful_view_index = 0;
    level.beautiful_weapon = undefined;
    return 1;
}

activate()
{
    thread beautiful_player();
    thread beautiful_guys();
    thread beautiful_views();
}

_id_1E5F()
{
    var_0 = getentarray( "beautiful_guy", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();
}

beautiful_player()
{
    level._id_0318 _meth_830D();
    level._id_0318 _meth_831C();

    if ( isdefined( level.beautiful_weapon ) )
    {
        level._id_0318 _meth_830B( level.beautiful_weapon );
        level._id_0318 _meth_8312( level.beautiful_weapon );
    }

    level._id_0318 thread beautiful_player_ammo();
    level._id_3AA7 = 1;
    level._id_0318 _meth_80F1();
}

beautiful_player_ammo()
{
    var_0 = self _meth_8308();
    self.maintain_stock = [];

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( self.maintain_stock[var_2] ) )
            self.maintain_stock[var_2] = self _meth_82F6( var_2 );
    }

    for (;;)
    {
        foreach ( var_2 in var_0 )
            self _meth_82F4( var_2, self.maintain_stock[var_2] );

        wait 1;
    }
}

beautiful_guys()
{
    var_0 = getentarray( "beautiful_guy", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2 _id_A579::_id_072C();

        if ( !isdefined( var_3 ) )
            return;

        var_3 _id_A5A4::_id_5926();
        var_3 _id_A5A4::_id_08EB();
        var_3 _id_A5A4::_id_58D7();
        var_3._id_79EE = "none";

        if ( isdefined( level.beautiful_weapon ) )
            var_3 _id_A5A4::_id_39D0( level.beautiful_weapon, "primary" );

        if ( isdefined( var_2._id_0398 ) )
        {
            var_3._id_0C72 = "beautiful_guy";
            var_3 thread _id_A510::_id_0BE1( var_3, var_2._id_0398, undefined, "stop_idle" );
        }
    }
}

beautiful_views()
{
    beautiful_view_origin_offsets();
    beautiful_view_init();
    thread beautiful_view_move_request();
    thread beautiful_view_state_request();
}

beautiful_view_origin_offsets()
{
    var_0 = [ 0.0, 0.0, -60.0 ];

    foreach ( var_2 in level.beautiful_views )
    {
        var_3 = getent( var_2, "targetname" );
        beautiful_offset_view_origin( var_3, var_0 );
        var_4 = getent( var_2 + "_static", "targetname" );
        beautiful_offset_view_origin( var_4, var_0 );
    }
}

beautiful_offset_view_origin( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_0398 ) )
        return;

    if ( var_0._id_0398 != "view_pos" )
        return;

    var_2 = spawnstruct();
    var_2._id_0151 = var_0;
    var_2._id_0199 = var_1[0];
    var_2._id_037B = var_1[1];
    var_2._id_04E0 = var_1[2];
    var_2 _id_A5A4::_id_9723();
}

beautiful_view_init()
{
    if ( level.beautiful_views.size <= 0 )
        return;

    common_scripts\utility::_id_383D( "beautiful_view_transitioning" );
    common_scripts\utility::_id_3831( "beautiful_view_transitioning" );
    level._id_148A = _id_A546::_id_23A2( "black", 1 );
    level._id_148A._id_03D4 = 1000;
    level._id_0318 _meth_830C( "beretta" );
    level._id_0318 _meth_830C( "fraggrenade" );
    level._id_0318 _meth_830C( "flash_grenade" );
    beautiful_view_position( level.beautiful_views[level.beautiful_view_index] );
    wait 0.05;
    _func_0D6( "compass", "0" );
    _func_0D6( "ammoCounterHide", "1" );
    _func_0D6( "hud_showStance", "0" );
    _func_0D6( "actionSlotsHide", "1" );
    wait 0.5;
    level._id_0318 _meth_831A();
    level._id_0318 _meth_8326( 1 );
    wait 1.0;
    beautiful_view_fade_in();
}

beautiful_view_move_request()
{
    for (;;)
    {
        while ( !( level._id_0318 _meth_8248( "DPAD_UP" ) || level._id_0318 _meth_8248( "HOME" ) ) )
            wait 0.05;

        if ( !common_scripts\utility::_id_382E( "beautiful_view_transitioning" ) )
        {
            beautiful_view_get_next_position();
            beautiful_view_update( level.beautiful_views[level.beautiful_view_index] );
        }

        wait 0.05;
    }
}

beautiful_view_get_next_position()
{
    for ( var_0 = undefined; !isdefined( var_0 ); var_0 = getent( var_1, "targetname" ) )
    {
        level.beautiful_view_index++;

        if ( level.beautiful_view_index >= level.beautiful_views.size )
            level.beautiful_view_index = 0;

        var_1 = level.beautiful_views[level.beautiful_view_index];

        if ( level.beautiful_view_static )
            var_1 += "_static";
    }
}

beautiful_view_state_request()
{
    for (;;)
    {
        while ( !( level._id_0318 _meth_8248( "DPAD_DOWN" ) || level._id_0318 _meth_8248( "END" ) ) )
            wait 0.05;

        if ( !common_scripts\utility::_id_382E( "beautiful_view_transitioning" ) )
        {
            level.beautiful_view_static = !level.beautiful_view_static;
            beautiful_view_update( level.beautiful_views[level.beautiful_view_index] );
        }

        wait 0.05;
    }
}

beautiful_view_update( var_0 )
{
    common_scripts\utility::_id_383F( "beautiful_view_transitioning" );
    beautiful_view_fade_out();
    beautiful_view_position( var_0 );
    wait 0.25;
    beautiful_view_fade_in();
    wait 0.25;
    common_scripts\utility::_id_3831( "beautiful_view_transitioning" );
}

beautiful_view_fade_in()
{
    wait 0.1;
    level._id_148A _meth_8086( 0.3 );
    level._id_148A.alpha = 0;

    if ( !level.beautiful_view_static )
        level._id_0318 _meth_831B();

    wait 0.3;

    if ( !level.beautiful_view_static )
        level._id_0318 _meth_8326( 0 );

    level._id_0318 _meth_80FC();
}

beautiful_view_fade_out()
{
    level._id_0318 _meth_80FD();
    level._id_0318 _meth_8181( "stand" );
    level._id_148A _meth_8086( 0.3 );
    level._id_148A.alpha = 1;
    level._id_0318 _meth_831A();
    wait 0.3;
    level._id_0318 _meth_8326( 1 );
    wait 0.1;
}

beautiful_view_position( var_0 )
{
    if ( level.beautiful_visions[var_0] != "" )
        _id_A5A4::_id_9E6E( level.beautiful_visions[var_0], 0 );

    if ( level.beautiful_lightsets[var_0] != "" )
        level._id_0318 _meth_83BE( level.beautiful_lightsets[var_0] );

    if ( level.beautiful_cluts[var_0] != "" )
        level._id_0318 _meth_848C( level.beautiful_cluts[var_0], 0 );

    if ( level.beautiful_view_static && isdefined( level.beautiful_dof[var_0] ) )
    {
        var_1 = level.beautiful_dof[var_0];
        level._id_0318 _meth_84A5();
        level._id_0318 _meth_84A7( var_1["fstop"], var_1["focus_distance"], var_1["focus_speed"], var_1["aperture_speed"] );
    }
    else
        level._id_0318 _meth_84A6();

    level._id_0318 _meth_8181( "stand" );

    if ( level.beautiful_view_static )
        beautiful_view_position_static( var_0 + "_static" );
    else
        beautiful_view_position_dynamic( var_0 );
}

beautiful_view_position_dynamic( var_0 )
{
    level._id_0318 _meth_8051();
    var_1 = getent( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    level._id_0318 _meth_8335( var_1._id_02E2 );
    level._id_0318 _meth_8337( var_1.angles );
}

beautiful_view_position_static( var_0 )
{
    level._id_0318 _meth_8051();
    var_1 = getent( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( level.beautiful_view_ent ) )
        level.beautiful_view_ent = common_scripts\utility::_id_8959();

    level.beautiful_view_ent._id_02E2 = var_1._id_02E2;
    level.beautiful_view_ent.angles = var_1.angles;
    level._id_0318 _meth_8335( level.beautiful_view_ent._id_02E2 );
    level._id_0318 _meth_8337( level.beautiful_view_ent.angles );
    level._id_0318 _meth_8081( level.beautiful_view_ent, "tag_origin" );
}

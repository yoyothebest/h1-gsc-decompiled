// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_0323;

    if ( !isdefined( level.nightvisionlightset ) )
        level.nightvisionlightset = "nightvision";

    thread _id_4C75( var_0, var_1 );
}

_id_4C75( var_0, var_1 )
{
    var_1 = common_scripts\utility::_id_9294( isdefined( var_1 ), var_1, 1 );
    _func_081();
    precacheshellshock( "nightvision" );
    level._id_60E4 = loadfx( "fx/misc/NV_dlight" );
    level._id_60E9 = loadfx( "fx/misc/ir_tapeReflect" );
    level.nightvision_distortion_effect = loadfx( "vfx/distortion/distortion_nightvision" );
    level.nightvision_phosphor_effect = loadfx( "vfx/ui/nvg_phosphor" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 _id_A5A4::_id_32DD( "nightvision_enabled" );
        var_3 _id_A5A4::_id_32DD( "nightvision_on" );
        var_3 _id_A5A4::_id_32DE( "nightvision_enabled" );
        var_3 _id_A5A4::_id_32DD( "nightvision_dlight_enabled" );
        var_3 _id_A5A4::_id_32DE( "nightvision_dlight_enabled" );
        var_3 _meth_8305( var_1, "nightvision" );
    }

    _func_144( "default_night" );
    thread monitor_blowouts();
    waitframe;
    wait 0.05;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 thread _id_60EB();
    }
}

_id_60EB()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "night_vision_on" );
        _id_60E8();
        var_0 = spawnfx( level.nightvision_distortion_effect, level._id_0318._id_02E2 );
        var_1 = spawnfx( level.nightvision_phosphor_effect, level._id_0318._id_02E2 );
        triggerfx( var_0 );
        triggerfx( var_1 );
        setomnvar( "ui_nightvision", 1 );
        self waittill( "night_vision_off" );
        _id_60E7();
        setomnvar( "ui_nightvision", 0 );
        var_0 delete();
        var_1 delete();
        wait 0.05;
    }
}

_id_60E2( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_0318;

    return isdefined( var_0._id_60E6 );
}

_id_60E8()
{
    level._id_0318 _meth_848D( "disabled", 0 );
    self._id_60EA = 1;
    _id_A5A4::_id_32DE( "nightvision_on" );
    self._id_60E6 = 1;
    thread h1_view_weapon_laser_update();
    level._id_0318 _meth_83BF( level.nightvisionlightset, 0 );

    if ( _id_A5A4::_id_32D8( "nightvision_dlight_enabled" ) )
    {
        level._id_60E3 = spawnfx( level._id_60E4, level._id_0318._id_02E2 );
        triggerfx( level._id_60E3 );
    }

    var_0 = _func_0D9( "allies" );
    common_scripts\utility::_id_0D13( var_0, ::_id_30CD );

    if ( !_id_A5A4::_id_3416( "allies", ::_id_30CD ) )
        _id_A5A4::_id_0761( "allies", ::_id_30CD );
}

has_laser_sight_nightvision( var_0 )
{
    return _func_120( var_0, "m4m203_acog" ) || _func_120( var_0, "m4m203_silencer" ) || _func_120( var_0, "m4_grenadier" ) || _func_120( var_0, "m4_grunt" ) || _func_120( var_0, "m4_silencer" ) || _func_120( var_0, "m4m203_silencer_reflex" );
}

h1_view_weapon_laser_update()
{
    level endon( "night_vision_off" );
    self endon( "death" );

    for (;;)
    {
        if ( self _meth_830E() == "none" )
        {
            waittillframeend;
            continue;
        }

        if ( has_laser_sight_nightvision( self _meth_830E() ) )
            self _meth_80B4();
        else
            self _meth_80B5();

        common_scripts\utility::_id_A069( "weapon_switch_started", "weapon_taken" );
        self _meth_80B5();
        common_scripts\utility::_id_A069( "grenade_fire", "weapon_change" );
    }
}

_id_30CD()
{
    if ( !_func_0CF( self ) )
        return;

    if ( !isdefined( self.has_ir ) )
        return;

    animscripts\shared::_id_9B2D();
    thread _id_588E();
}

_id_588E()
{
    level endon( "night_vision_off" );
    self endon( "death" );

    for (;;)
    {
        if ( self _meth_843E( "tag_reflector_arm_le" ) != -1 )
            playfxontag( level._id_60E9, self, "tag_reflector_arm_le" );

        if ( self _meth_843E( "tag_reflector_arm_ri" ) != -1 )
            playfxontag( level._id_60E9, self, "tag_reflector_arm_ri" );

        wait 0.1;
    }
}

_id_8EB3()
{
    if ( !isdefined( self.has_ir ) )
        return;

    stopfxontag( level._id_60E9, self, "tag_reflector_arm_le" );
    stopfxontag( level._id_60E9, self, "tag_reflector_arm_ri" );
}

_id_60E7()
{
    self._id_60EA = undefined;
    self _meth_80B5();
    level notify( "night_vision_off" );

    if ( isdefined( level._id_60E3 ) )
        level._id_60E3 delete();

    self notify( "nightvision_shellshock_off" );
    _id_A5A4::_id_32DA( "nightvision_on" );
    self._id_60E6 = undefined;
    level._id_0318 _meth_83C0();
    level._id_0318 _meth_848E( 0 );
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_0323.size; var_1++ )
    {
        if ( _id_60E2( level._id_0323[var_1] ) )
            var_0 = 1;
    }

    if ( !var_0 )
        _id_A5A4::_id_735B( "allies", ::_id_30CD );

    thread _id_60E5();
}

_id_60E5()
{
    var_0 = _func_0D9( "allies" );

    foreach ( var_2 in var_0 )
    {
        var_2._id_9C2F = undefined;
        var_2 animscripts\shared::_id_9B2D();
        var_2 _id_8EB3();
    }
}

_id_8487()
{
    if ( isdefined( self._id_60EA ) )
        return 1;

    return isdefined( self.end_nightvision_hint );
}

_id_8451()
{
    if ( !isdefined( self._id_60EA ) )
        return 1;

    return isdefined( self.end_nightvision_disable_hint );
}

force_remove_nightvision()
{
    level._id_0318 _meth_80F5( level._id_0318 _meth_830E(), "nvg_up" );
    wait 0.5;
    _func_0D6( "nightVisionDisableEffects", 1 );
    wait 0.5;
    level._id_0318 _meth_80F0();
    wait 1;
    _func_0D6( "nightVisionDisableEffects", 0 );
}

monitor_blowouts()
{
    level.r_ssrblendscale_default_value = getdvarfloat( "r_ssrBlendScale" );
    level.r_ssrblendscale_nvg_value = monitor_blowouts_getvalue( level.r_ssrblendscale_default_value );

    for (;;)
    {
        level._id_0318 _id_A5A4::_id_32E0( "nightvision_on" );
        thread _id_A5A4::_id_569C( "r_ssrBlendScale", level.r_ssrblendscale_nvg_value, 0.25 );
        level._id_0318 _id_A5A4::_id_32E4( "nightvision_on" );
        thread _id_A5A4::_id_569C( "r_ssrBlendScale", level.r_ssrblendscale_default_value, 0.25 );
    }
}

monitor_blowouts_getvalue( var_0 )
{
    switch ( level._id_038E )
    {
        case "blackout":
            return 0.1;
        case "bog_a":
            return 0.25;
    }

    return var_0;
}

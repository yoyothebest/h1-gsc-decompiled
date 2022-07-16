// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "weapon_c4";

    if ( !isdefined( var_2 ) )
        var_2 = "weapon_c4_obj";

    if ( !isdefined( var_0 ) )
        level._id_196C = "c4";
    else
        level._id_196C = var_0;

    precachemodel( var_1 );
    precachemodel( var_2 );
    precacheitem( level._id_196C );

    if ( isdefined( level.c4_explosion_fx_override ) )
        level._id_058F["c4_explosion"] = level.c4_explosion_fx_override;
    else
        level._id_058F["c4_explosion"] = loadfx( "fx/explosions/grenadeExp_metal" );
}

c4_location( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    if ( !isdefined( var_4 ) )
        var_4 = "weapon_c4";

    if ( !isdefined( var_5 ) )
        var_5 = "weapon_c4_obj";

    if ( isdefined( var_0 ) )
        var_6 = self _meth_8184( var_0 );
    else if ( isdefined( var_3 ) )
        var_6 = var_3;
    else
    {

    }

    var_7 = spawn( "script_model", var_6 + var_1 );
    var_7 _meth_80B3( var_5 );

    if ( isdefined( var_0 ) )
        var_7 _meth_804F( self, var_0, var_1, var_2 );
    else
        var_7.angles = self.angles;

    var_7._id_04C5 = get_use_trigger();

    if ( isdefined( level.c4_hintstring ) )
        var_7._id_04C5 _meth_80DD( level.c4_hintstring );
    else
        var_7._id_04C5 _meth_80DD( &"SCRIPT_PLATFORM_HINT_PLANTEXPLOSIVES" );

    if ( isdefined( var_0 ) )
    {
        var_7._id_04C5 _meth_804F( self, var_0, var_1, var_2 );
        var_7._id_04C5.islinked = 1;
    }
    else
        var_7._id_04C5._id_02E2 = var_7._id_02E2;

    var_7 thread handle_use( self, var_4 );

    if ( !isdefined( self.multiple_c4 ) )
        var_7 thread handle_delete( self );

    var_7 thread handle_clear_c4( self );
    return var_7;
}

_id_6A35()
{
    self endon( "death" );
    wait 0.1;
    playfxontag( common_scripts\utility::_id_3FA8( "c4_light_blink" ), self, "tag_fx" );
}

handle_use( var_0, var_1 )
{
    var_0 endon( "clear_c4" );

    if ( !isdefined( var_1 ) )
        var_1 = "weapon_c4";

    if ( !isdefined( var_0.multiple_c4 ) )
        var_0 endon( "c4_planted" );

    if ( !isdefined( var_0.c4_count ) )
        var_0.c4_count = 0;

    var_0.c4_count++;
    self._id_04C5 _meth_817F();
    self._id_04C5 waittill( "trigger", var_2 );
    level notify( "c4_in_place", self );
    self._id_04C5 _meth_8051();
    self._id_04C5 release_use_trigger();
    self _meth_809C( "c4_bounce_default" );
    self _meth_80B3( var_1 );
    thread _id_6A35();
    var_0.c4_count--;

    if ( !isdefined( var_0.multiple_c4 ) || !var_0.c4_count )
        var_2 switch_to_detonator();

    thread handle_detonation( var_0, var_2 );
    var_0 notify( "c4_planted", self );
}

handle_delete( var_0 )
{
    var_0 endon( "clear_c4" );
    self._id_04C5 endon( "trigger" );
    var_0 waittill( "c4_planted", var_1 );
    self._id_04C5 _meth_8051();
    self._id_04C5 release_use_trigger();
    self delete();
}

handle_detonation( var_0, var_1 )
{
    var_0 endon( "clear_c4" );
    var_1 waittill( "detonate" );
    playfx( level._id_058F["c4_explosion"], self._id_02E2 );
    var_2 = spawn( "script_origin", self._id_02E2 );

    if ( isdefined( level.c4_sound_override ) )
        var_2 _meth_809C( "detpack_explo_main", "sound_done" );

    self _meth_81D8( self._id_02E2, 256, 200, 50 );
    _func_18C( 0.4, 1, self._id_02E2, 1000 );

    if ( isdefined( self ) )
        self delete();

    var_1 thread remove_detonator();
    var_0 notify( "c4_detonation" );
    var_2 waittill( "sound_done" );
    var_2 delete();
}

handle_clear_c4( var_0 )
{
    var_0 endon( "c4_detonation" );
    var_0 waittill( "clear_c4" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_04C5._id_020D ) && self._id_04C5._id_020D )
        self._id_04C5 release_use_trigger();

    if ( isdefined( self ) )
        self delete();

    level._id_0318 thread remove_detonator();
}

remove_detonator()
{
    level endon( "c4_in_place" );
    wait 1;
    var_0 = 0;

    if ( level._id_196C == self _meth_830E() && isdefined( self._id_63C1 ) )
    {
        if ( self._id_63C1 == "none" )
        {
            var_0 = 1;
            self _meth_8312( self _meth_8309()[0] );
        }
        else if ( self _meth_8311( self._id_63C1 ) && self._id_63C1 != level._id_196C )
            self _meth_8312( self._id_63C1 );
        else
            self _meth_8312( self _meth_8309()[0] );
    }

    self._id_63C1 = undefined;

    if ( 0 != self _meth_8183( level._id_196C ) )
        return;

    self waittill( "weapon_change" );
    self _meth_830C( level._id_196C );
}

switch_to_detonator()
{
    var_0 = undefined;

    if ( !isdefined( self._id_63C1 ) )
        self._id_63C1 = self _meth_830E();

    var_1 = self _meth_8308();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] != level._id_196C )
            continue;

        var_0 = var_1[var_2];
    }

    if ( !isdefined( var_0 ) )
    {
        self _meth_830B( level._id_196C );
        self _meth_82F3( level._id_196C, 0 );
        self _meth_8305( 2, "weapon", level._id_196C );
    }

    self _meth_8312( level._id_196C );
}

get_use_trigger()
{
    var_0 = getentarray( "generic_use_trigger", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_020D ) && var_0[var_1]._id_020D )
            continue;

        if ( !isdefined( var_0[var_1]._id_020D ) )
            var_0[var_1] _meth_806B();

        var_0[var_1]._id_020D = 1;
        var_0[var_1]._id_63DC = var_0[var_1]._id_02E2;
        return var_0[var_1];
    }
}

release_use_trigger()
{
    if ( isdefined( self.islinked ) )
        self _meth_8051();

    self.islinked = undefined;
    self._id_02E2 = self._id_63DC;
    self._id_020D = 0;
}

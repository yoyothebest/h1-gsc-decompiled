// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_66FC( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_0142 ) )
        return;

    self endon( "death" );
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    thread _id_A078();
    thread _id_A083();
    self endon( "enemy" );
    self._id_01C4 = 32;
    self _meth_81CE( "stand" );
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self.allowdeath = 1;
    self._id_7A9C = 1;
    var_3 = "patrol_walk";

    if ( isdefined( self._id_6718 ) )
        var_3 = self._id_6718;

    var_4 = isdefined( self.canpatrolturn ) && self.canpatrolturn;
    _id_A5A4::_id_7E45( var_3, 1, !var_4 );
    thread patrol_walk_twitch_loop();
    var_5[1][1] = ::_id_3E8A;
    var_5[1][0] = common_scripts\utility::_id_3DBD;
    var_5[0][1] = ::_id_3E8C;
    var_5[0][0] = ::_id_3DBE;
    var_6[1] = _id_A5A4::_id_7E47;
    var_6[0] = _id_A5A4::_id_7E4B;

    if ( isdefined( var_0 ) )
        self._id_04A4 = var_0;

    if ( isdefined( self._id_04A4 ) )
    {
        var_7 = 1;
        var_8 = _id_3E8A();
        var_9 = _id_3E8C();

        if ( var_8.size )
        {
            var_10 = common_scripts\utility::_id_710E( var_8 );
            var_11 = 1;
        }
        else
        {
            var_10 = common_scripts\utility::_id_710E( var_9 );
            var_11 = 0;
        }
    }
    else
    {
        var_7 = 0;
        var_8 = common_scripts\utility::_id_3DBD();
        var_9 = _id_3DBE();

        if ( var_8.size )
        {
            var_10 = common_scripts\utility::_id_710E( var_8 );
            var_11 = 1;
        }
        else
        {
            var_10 = common_scripts\utility::_id_710E( var_9 );
            var_11 = 0;
        }
    }

    var_12 = var_10;

    for (;;)
    {
        while ( isdefined( var_12._id_6707 ) )
            wait 0.05;

        var_10._id_6707 = undefined;
        var_10 = var_12;
        self notify( "release_node" );
        var_10._id_6707 = 1;
        self._id_5545 = var_10;
        [[ var_6[var_11] ]]( var_10 );

        if ( isdefined( var_10._id_0351 ) && var_10._id_0351 > 0 )
            self._id_01C4 = var_10._id_0351;
        else
            self._id_01C4 = 32;

        self waittill( "goal" );
        var_10 notify( "trigger", self );

        if ( isdefined( var_10._id_793C ) )
        {
            if ( !isdefined( var_2 ) || var_2 == 0 )
            {
                var_13 = "patrol_stop";
                _id_A510::_id_0BCA( self, "gravity", var_13 );
            }

            switch ( var_10._id_793C )
            {
                case "pause":
                    var_14 = "patrol_idle_" + _func_0B4( 1, 6 );

                    if ( var_14 == "patrol_idle_2" && !can_smoke() )
                        var_14 = "patrol_idle_" + _func_0B4( 3, 6 );

                    _id_A510::_id_0BC9( self, var_14 );
                    var_15 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_15 );
                    break;
                case "turn180":
                    var_16 = "patrol_turn180";
                    _id_A510::_id_0BCA( self, "gravity", var_16 );
                    break;
                case "smoke":
                    var_17 = "patrol_idle_smoke";

                    if ( !can_smoke() )
                        var_17 = "patrol_idle_" + _func_0B4( 3, 6 );

                    _id_A510::_id_0BC9( self, var_17 );
                    var_15 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_15 );
                    break;
                case "stretch":
                    var_17 = "patrol_idle_stretch";
                    _id_A510::_id_0BC9( self, var_17 );
                    var_15 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_15 );
                    break;
                case "checkphone":
                    var_17 = "patrol_idle_checkphone";
                    _id_A510::_id_0BC9( self, var_17 );
                    var_15 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_15 );
                    break;
                case "phone":
                    var_17 = "patrol_idle_phone";
                    _id_A510::_id_0BC9( self, var_17 );
                    var_15 = "patrol_start";
                    _id_A510::_id_0BCA( self, "gravity", var_15 );
                    break;
            }
        }

        if ( isdefined( var_1 ) && var_1 == 1 )
            self _meth_8192( "none" );

        var_18 = var_10 [[ var_5[var_11][var_7] ]]();

        if ( !var_18.size )
        {
            self notify( "reached_path_end" );
            break;
        }

        var_12 = common_scripts\utility::_id_710E( var_18 );
    }
}

add_to_patrol_animation_list( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        level._id_6706[var_0] = var_1;
}

init_patrol_animation_list()
{
    add_to_patrol_animation_list( "patrol_walk", level._id_78AC["generic"]["patrol_walk"] );
    add_to_patrol_animation_list( "patrol_walk_twitch", level._id_78AC["generic"]["patrol_walk_twitch"] );
    add_to_patrol_animation_list( "patrol_stop", level._id_78AC["generic"]["patrol_stop"] );
    add_to_patrol_animation_list( "patrol_start", level._id_78AC["generic"]["patrol_start"] );
    add_to_patrol_animation_list( "patrol_turn180", level._id_78AC["generic"]["patrol_turn180"] );
    add_to_patrol_animation_list( "patrol_idle_1", level._id_78AC["generic"]["patrol_idle_1"] );
    add_to_patrol_animation_list( "patrol_idle_2", level._id_78AC["generic"]["patrol_idle_2"] );
    add_to_patrol_animation_list( "patrol_idle_3", level._id_78AC["generic"]["patrol_idle_3"] );
    add_to_patrol_animation_list( "patrol_idle_4", level._id_78AC["generic"]["patrol_idle_4"] );
    add_to_patrol_animation_list( "patrol_idle_5", level._id_78AC["generic"]["patrol_idle_5"] );
    add_to_patrol_animation_list( "patrol_idle_6", level._id_78AC["generic"]["patrol_idle_6"] );
    add_to_patrol_animation_list( "patrol_idle_smoke", level._id_78AC["generic"]["patrol_idle_smoke"] );
    add_to_patrol_animation_list( "patrol_idle_checkphone", level._id_78AC["generic"]["patrol_idle_checkphone"] );
    add_to_patrol_animation_list( "patrol_idle_stretch", level._id_78AC["generic"]["patrol_idle_stretch"] );
    add_to_patrol_animation_list( "patrol_idle_phone", level._id_78AC["generic"]["patrol_idle_phone"] );
    add_to_patrol_animation_list( "patrol_turn_l45_rfoot", level._id_78AC["generic"]["patrol_turn_l45_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l45_lfoot", level._id_78AC["generic"]["patrol_turn_l45_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l90_rfoot", level._id_78AC["generic"]["patrol_turn_l90_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l90_lfoot", level._id_78AC["generic"]["patrol_turn_l90_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l135_rfoot", level._id_78AC["generic"]["patrol_turn_l135_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_l135_lfoot", level._id_78AC["generic"]["patrol_turn_l135_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r45_rfoot", level._id_78AC["generic"]["patrol_turn_r45_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r45_lfoot", level._id_78AC["generic"]["patrol_turn_r45_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r90_rfoot", level._id_78AC["generic"]["patrol_turn_r90_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r90_lfoot", level._id_78AC["generic"]["patrol_turn_r90_lfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r135_rfoot", level._id_78AC["generic"]["patrol_turn_r135_rfoot"] );
    add_to_patrol_animation_list( "patrol_turn_r135_lfoot", level._id_78AC["generic"]["patrol_turn_r135_lfoot"] );
    add_to_patrol_animation_list( "patrol_walk_in_lfoot", level._id_78AC["generic"]["patrol_walk_in_lfoot"] );
    add_to_patrol_animation_list( "patrol_walk_out_lfoot", level._id_78AC["generic"]["patrol_walk_out_lfoot"] );
    add_to_patrol_animation_list( "patrol_walk_in_rfoot", level._id_78AC["generic"]["patrol_walk_in_rfoot"] );
    add_to_patrol_animation_list( "patrol_walk_out_rfoot", level._id_78AC["generic"]["patrol_walk_out_rfoot"] );
}

is_patrolling()
{
    foreach ( var_1 in level._id_6706 )
    {
        if ( isdefined( var_1 ) && self _meth_8152( var_1 ) != 0.0 )
        {
            self._id_04EB = 1;
            self._id_02F9 = 70.0;
            self._id_0274 = 19.0;
            self._id_03BE = 0.94;
            return 1;
        }
    }

    self._id_04EB = 0;
    return 0;
}

enable_patrol_turn()
{
    self.canpatrolturn = 1;
}

disable_patrol_turn()
{
    self.canpatrolturn = undefined;
}

can_smoke()
{
    if ( !isdefined( self._id_477D ) )
        return 0;

    switch ( self._id_477D )
    {
        case "head_sp_opforce_ski_mask_body_a":
        case "head_sp_opforce_fullwrap_body_d":
        case "head_sp_opforce_gas_mask_body_f":
        case "head_spetsnaz_assault_demetry":
        case "head_spetsnaz_assault_demetry_lob":
            return 0;
    }

    return 1;
}

patrol_walk_twitch_loop()
{
    self endon( "death" );
    self endon( "enemy" );
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    self notify( "patrol_walk_twitch_loop" );
    self endon( "patrol_walk_twitch_loop" );

    if ( isdefined( self._id_6718 ) && !isdefined( self._id_6719 ) )
        return;

    for (;;)
    {
        wait(_func_0B5( 8, 20 ));
        var_0 = "patrol_walk_twitch";

        if ( isdefined( self._id_6719 ) )
            var_0 = self._id_6719;

        var_1 = isdefined( self.canpatrolturn ) && self.canpatrolturn;
        _id_A5A4::_id_7E45( var_0, 1, !var_1 );
        var_2 = getanimlength( _id_A5A4::_id_3EF7( var_0 ) );
        wait(var_2);
        var_0 = "patrol_walk";

        if ( isdefined( self._id_6718 ) )
            var_0 = self._id_6718;

        _id_A5A4::_id_7E45( var_0, 1, !var_1 );
    }
}

_id_A079()
{
    self endon( "end_patrol" );
    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    self waittill( "enemy" );
}

_id_A083()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self notify( "release_node" );

    if ( !isdefined( self._id_5545 ) )
        return;

    self._id_5545._id_6707 = undefined;
}

_id_A078()
{
    self endon( "death" );
    _id_A079();

    if ( !isdefined( self._id_0669 ) )
    {
        _id_A5A4::_id_1ED1();
        self _meth_81CE( "stand", "crouch", "prone" );
        self._id_2AF3 = 0;
        self._id_2B0E = 0;
        self _meth_8143();
        self notify( "stop_animmode" );
    }

    self.allowdeath = 0;

    if ( !isdefined( self ) )
        return;

    self notify( "release_node" );

    if ( !isdefined( self._id_5545 ) )
        return;

    self._id_5545._id_6707 = undefined;
}

_id_3E8A()
{
    var_0 = [];

    if ( isdefined( self._id_04A4 ) )
        var_0 = getentarray( self._id_04A4, "targetname" );

    return var_0;
}

_id_3E8C()
{
    var_0 = [];

    if ( isdefined( self._id_04A4 ) )
        var_0 = _func_0C4( self._id_04A4, "targetname" );

    return var_0;
}

_id_3DBE()
{
    var_0 = [];

    if ( isdefined( self._id_7A26 ) )
    {
        var_1 = _func_124( self._id_7A26, " " );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = _func_0C3( var_1[var_2], "script_linkname" );

            if ( isdefined( var_3 ) )
                var_0[var_0.size] = var_3;
        }
    }

    return var_0;
}

_id_8502( var_0 )
{
    self endon( "release_node" );
}

_id_6712()
{

}

_id_67E7()
{

}

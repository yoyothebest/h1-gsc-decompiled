// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level.fastrope_globals = spawnstruct();
    level.fastrope_globals.helicopters = [];
    level.fastrope_globals.animload = [];
    level.fastrope_globals.animload["blackhawk"] = 0;
    level.fastrope_globals.heli_inflight = 0;
    level.fastrope_globals.basename = "fastrope_vehicle";
    var_0 = _func_0DB();
    fastrope_precache();
    common_scripts\utility::_id_0D13( var_0, ::fastrope_setup );
}

fastrope_override( var_0, var_1, var_2, var_3 )
{
    var_4 = fastrope_animname( self._id_04D9, var_0 );
    level._id_78AC[var_4]["custom_all" + self._id_04A6] = var_1;
    level._id_78AC[var_4]["custom_ride" + self._id_04A6] = var_2;
    level._id_78AC[var_4]["custom_unload" + self._id_04A6] = var_3;
    _id_A510::_id_0807( var_4, "start", ::play_fastrope_start_sfx, "custom_unload" + self._id_04A6 );
    _id_A510::_id_0807( var_4, "fastrope_end_sfx", ::play_fastrope_end_sfx, "custom_unload" + self._id_04A6 );
    _id_A510::_id_0807( var_4, "custom_land", ::play_fastrope_land_sfx, "custom_unload" + self._id_04A6 );
}

fastrope_override_vehicle( var_0, var_1 )
{
    level._id_78AC[self._id_0C72]["pathanim"] = var_0;
    self.pathnode = var_1;
}

play_fastrope_start_sfx( var_0 )
{
    var_0 thread _id_A5A4::_id_69C4( "fastrope_start_npc" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_npc" );
}

play_fastrope_end_sfx( var_0 )
{
    var_0 notify( "stop soundfastrope_loop_npc" );
    var_0 thread _id_A5A4::_id_69C4( "fastrope_end_npc" );
}

play_fastrope_land_sfx( var_0 )
{
    var_0 thread _id_A5A4::_id_69C4( "step_land_hv_concrete_wet" );
}

fastrope_spawner_think()
{
    self endon( "death" );

    if ( isdefined( self._id_7A99 ) )
    {
        var_0 = _func_124( self._id_7A99, ":;, " );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( _func_123( var_0[var_1] ) == "fastrope_seat" )
            {
                var_1++;
                self.fastrope_seat = _func_0BC( var_0[var_1] );
            }

            if ( _func_123( var_0[var_1] ) == "nounload" )
                self.nounload = 1;
        }
    }

    for (;;)
    {
        self waittill( "spawned", var_2 );

        if ( _id_A5A4::_id_88F1( var_2 ) )
            continue;

        var_2._id_03D9 = self;
        var_2 thread fastrope_ai_think( self );
    }
}

fastrope_ai_think_hack( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0.2;

    wait(var_0 - var_1);
    self _meth_8143();
    self notify( "single_anim_done" );
}

fastrope_ai_think( var_0 )
{
    self endon( "death" );
    self endon( "overtakenow" );
    var_1 = spawn( "script_origin", self._id_02E2 );
    var_1.angles = self.angles;
    self _meth_804F( var_1 );
    var_1._id_08B4 = self;
    var_1._id_08B4 _meth_8056();
    var_0 fastrope_wait_que( var_1 );

    if ( isdefined( var_0.nounload ) && var_0.nounload == 1 )
    {
        if ( var_1._id_08B4.seat_pos < 9 )
        {
            var_0 fastrope_post_unload( var_1 );
            var_0._id_47A3 waittill( "unload_rest" );
            var_0._id_47A3.que[var_0._id_47A3.que.size] = var_0;
        }
        else
        {
            var_0 fastrope_post_unload( var_1 );

            if ( var_1._id_08B4.seat_pos == 10 )
            {
                common_scripts\utility::_id_384A( "heli_shoot_deck_windows" );
                self._id_03D9._id_47A3._id_029C notify( "stop_" + var_1._id_08B4.seat_index );
                self._id_03D9._id_47A3._id_029C thread _id_A510::_id_0BE1( self, "minigun", "tag_detach" );
            }

            var_0._id_47A3._id_9C7E waittill( "reached_end_node" );
            var_1 delete();
            self delete();
            return;
        }
    }

    var_0._id_47A3 notify( "unload_" + var_1._id_08B4.side );
    var_0 fastrope_pre_unload( var_1 );
    var_2 = "custom_unload" + var_0._id_47A3._id_04A6;
    var_3 = "custom_all" + var_0._id_47A3._id_04A6;

    if ( isdefined( level._id_78AC[var_1._id_08B4._id_0C72][var_3] ) )
    {
        self waittillmatch( "single anim", "start" );
        thread _id_A5A4::_id_69C4( "fastrope_start_npc" );
        var_1 thread common_scripts\utility::_id_6975( "fastrope_loop_npc" );
        fastrope_calc( var_1 );
        var_0 thread fastrope_post_unload( var_1 );
        self waittillmatch( "single_anim_done" );
        var_1 notify( "stop soundfastrope_loop_npc" );
        thread _id_A5A4::_id_69C4( "fastrope_end_npc" );
        self _meth_8051();
    }
    else if ( isdefined( level._id_78AC[var_1._id_08B4._id_0C72][var_2] ) )
    {
        thread fastrope_ai_think_hack( getanimlength( level._id_78AC[var_1._id_08B4._id_0C72][var_2] ) );
        var_0._id_47A3._id_029C thread _id_A510::_id_0C24( self, var_2, "tag_detach" );
        self waittillmatch( "single anim", "start" );
        fastrope_calc( var_1 );
        var_0 thread fastrope_post_unload( var_1 );
        self waittillmatch( "single_anim_done" );
        self _meth_8051();
    }
    else
    {
        var_4 = 45 * var_1._id_08B4._id_0204 + 90;
        var_5 = 360 * var_1._id_08B4.spin;

        if ( var_1._id_08B4.side == "right" )
            var_4 += 180;

        self _meth_8051();
        var_1._id_02E2 = self._id_02E2;
        var_1.angles = self.angles;
        var_1 _meth_804F( self );
        var_0._id_47A3 thread fastrope_ropethink( self );
        var_0._id_47A3._id_029C thread _id_A510::_id_0C24( self, "grab", "tag_detach" );
        wait 2.5;
        fastrope_calc( var_1 );
        self waittillmatch( "single anim", "end" );
        var_1 _meth_8051();
        self _meth_804F( var_1 );
        fastrope_calc( var_1 );
        var_0 thread fastrope_post_unload( var_1 );
        var_1 thread _id_A510::_id_0BE1( self, "loop", undefined, "stopanimscripted" );
        thread _id_A5A4::_id_69C4( "fastrope_start_npc" );
        var_1 thread common_scripts\utility::_id_6975( "fastrope_loop_npc" );
        var_1 _meth_82AD( var_1._id_7131 * -1, var_1._id_04B7 );
        var_6 = var_4 - var_5;
        var_1 _meth_82B3( var_6, var_1._id_04B7 );
        wait(var_1._id_04B7);
        var_1 notify( "stopanimscripted" );
        var_1.angles = self.angles;
        var_1 _id_A510::_id_0C24( self, "land" );
        var_1 notify( "stop soundfastrope_loop_npc" );
        thread _id_A5A4::_id_69C4( "fastrope_end_npc" );
        self _meth_8051();
    }

    var_1 delete();
    wait 3;
    self _meth_81A7( 0 );
}

fastrope_wait_que( var_0 )
{
    var_0._id_08B4 endon( "death" );
    fastrope_waiton_helicopter( var_0 );

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_unload" + self._id_47A3._id_04A6] ) )
        return;

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3._id_04A6] ) )
        return;

    if ( var_0._id_08B4.side == "left" )
        wait 0.5;
}
#using_animtree("generic_human");

fastrope_ropethink( var_0 )
{
    var_1 = var_0.side;
    var_2 = "ropeidle" + var_1;
    var_3 = "ropeall" + var_1;

    if ( !isdefined( level._id_78AC[self._id_04A6] ) )
        return;

    if ( !( isdefined( level._id_78AC[self._id_04A6][var_2] ) || isdefined( level._id_78AC[self._id_04A6][var_3] ) ) )
        return;

    if ( isdefined( self.rope_dropped[var_1] ) && self.rope_dropped[var_1] == 1 )
        return;

    self.rope_dropped[var_1] = 1;
    var_4 = undefined;

    switch ( self._id_04D9 )
    {
        case "blackhawk":
            switch ( var_1 )
            {
                case "left":
                    var_4 = "TAG_FastRope_LE";
                    break;
                case "right":
                    var_4 = "TAG_FastRope_RI";
                    break;
            }

            break;
    }

    var_5 = spawn( "script_model", self._id_029C _meth_8184( var_4 ) );
    var_5.angles = self._id_029C _meth_8185( var_4 );
    var_5 _meth_80B3( level._id_5D45["heli"]["rope"][var_1] );
    var_5._id_0C72 = self._id_0C72;
    var_5 _meth_8117( #animtree );
    var_5 _meth_804F( self._id_029C, var_4 );

    if ( isdefined( level._id_78AC[self._id_04A6][var_3] ) )
    {
        var_6 = getanimlength( level._id_78AC[self._id_04A6][var_3] );
        self._id_029C thread _id_A510::_id_0C24( var_5, var_3, var_4 );
        wait(var_6 - 1.5);
    }
    else
    {
        self._id_029C thread _id_A510::_id_0BE1( var_5, var_2, var_4, "stop_" + var_2 );
        self waittill( "unload_" + var_1 );
        self._id_029C notify( "stop_" + var_2 );
        var_2 = "ropedrop" + var_1;
        self._id_029C thread _id_A510::_id_0C24( var_5, var_2, var_4 );

        while ( self.que.size )
            self waittill( "check_fastrope_que" );

        wait(self._id_5605);
    }

    var_5 _meth_8051();
    self waittill( "returnflight" );
    self.rope_dropped[var_1] = 0;
}

fastrope_pre_unload( var_0 )
{
    fastrope_free_seat( var_0 );
}

fastrope_post_unload( var_0 )
{
    self._id_47A3._id_5605 = var_0._id_04B7;
    wait 0.1;
    self._id_47A3.que = common_scripts\utility::_id_0CF6( self._id_47A3.que, self );
    self._id_47A3 thread fastrope_que_check();
}

fastrope_que_check()
{
    wait(self.unloadwait);
    self notify( "check_fastrope_que" );
}

fastrope_waiton_helicopter( var_0 )
{
    var_0._id_08B4 endon( "death" );
    thread fastrope_attach_helicopter( var_0 );

    if ( !self._id_47A3.inflight )
        self._id_47A3 thread fastrope_heli_fly();

    self._id_47A3 endon( "overtakenow" );

    if ( !self._id_47A3._id_71D4 )
        self._id_47A3 waittill( "ready" );
}

fastrope_attach_helicopter( var_0 )
{
    var_0._id_08B4 endon( "death" );
    var_0._id_08B4 endon( "overtakenow" );

    for (;;)
    {
        if ( !self._id_47A3.inflight )
            self._id_47A3 waittill( "inflight" );

        fastrope_find_seat( var_0._id_08B4 );

        if ( !isdefined( var_0._id_08B4.seat_index ) )
        {
            self._id_47A3 waittill( "seat_open" );
            continue;
            continue;
        }

        break;
    }

    self._id_47A3._id_029C endon( "death" );
    var_1 = var_0._id_08B4.seat_index;
    var_0._id_08B4._id_0C72 = self._id_47A3.seats[var_1]._id_0C72;
    var_0._id_08B4._id_0204 = self._id_47A3.seats[var_1]._id_0204;
    var_0._id_08B4.side = self._id_47A3.seats[var_1].side;
    var_0._id_08B4.spin = self._id_47A3.seats[var_1].spin;
    self._id_47A3.que[self._id_47A3.que.size] = self;
    var_0 _meth_82AA( self._id_47A3._id_029C _meth_8184( "tag_detach" ), 0.05 );
    wait 0.1;
    var_0.angles = self._id_47A3._id_029C _meth_8185( "tag_detach" );
    var_0 _meth_804F( self._id_47A3._id_029C, "tag_detach" );
    var_0._id_08B4 _meth_8055();
    var_0._id_08B4 _meth_804F( self._id_47A3._id_029C, "tag_detach" );
    self._id_47A3 thread fastrope_ropethink( var_0._id_08B4 );
    self._id_47A3._id_029C endon( "stop_" + var_1 );

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3._id_04A6] ) )
    {
        var_0._id_08B4 _meth_804F( self._id_47A3._id_029C, "tag_detach" );
        var_0._id_08B4 _meth_81A7( 1 );
        var_0 _meth_804F( var_0._id_08B4 );
        self._id_47A3._id_029C thread _id_A510::_id_0C24( var_0._id_08B4, "custom_all" + self._id_47A3._id_04A6, "tag_detach" );
        var_0 notify( "custom_all" );
        var_0._id_08B4 thread fastrope_ai_think_hack( getanimlength( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3._id_04A6] ), 0.25 );
        return;
    }

    if ( isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_ride" + self._id_47A3._id_04A6] ) )
    {
        var_0._id_08B4 _meth_804F( self._id_47A3._id_029C, "tag_detach" );
        var_0._id_08B4 _meth_81A7( 1 );
        var_0 _meth_804F( var_0._id_08B4 );
        self._id_47A3._id_029C _id_A510::_id_0C24( var_0._id_08B4, "custom_ride" + self._id_47A3._id_04A6, "tag_detach" );

        if ( self._id_47A3._id_71D4 )
            return;
    }

    self._id_47A3._id_029C thread _id_A510::_id_0BE1( var_0._id_08B4, "idle", "tag_detach", "stop_" + var_1 );
}

fastrope_free_seat( var_0 )
{
    if ( !isdefined( level._id_78AC[var_0._id_08B4._id_0C72]["custom_all" + self._id_47A3._id_04A6] ) )
    {
        self._id_47A3._id_029C notify( "stop_" + var_0._id_08B4.seat_index );
        var_0._id_08B4 _meth_8143();
        var_0._id_02E2 = var_0._id_08B4._id_02E2;
        var_0.angles = var_0._id_08B4.angles;
    }

    self._id_47A3.seats[var_0._id_08B4.seat_index].taken = undefined;
    self._id_47A3 notify( "seat_open" );
}

fastrope_find_seat( var_0 )
{
    var_0.seat_index = undefined;

    if ( isdefined( self.fastrope_seat ) )
    {
        for ( var_1 = 0; var_1 < self._id_47A3.seats.size; var_1++ )
        {
            if ( self._id_47A3.seats[var_1]._id_6E57 != self.fastrope_seat )
                continue;

            if ( isdefined( self._id_47A3.seats[var_1].taken ) )
                self._id_47A3.seats[var_1].taken._id_03D9 fastrope_find_seat( self._id_47A3.seats[var_1].taken );

            self._id_47A3.seats[var_1].taken = var_0;
            var_0.seat_index = var_1;
            var_0.seat_pos = self._id_47A3.seats[var_1]._id_6E57;
            return;
        }
    }

    for ( var_1 = 0; var_1 < self._id_47A3.seats.size; var_1++ )
    {
        if ( isdefined( self._id_47A3.seats[var_1].taken ) )
            continue;

        self._id_47A3.seats[var_1].taken = var_0;
        var_0.seat_index = var_1;
        var_0.seat_pos = self._id_47A3.seats[var_1]._id_6E57;
        break;
    }
}

fastrope_player_think()
{
    maps\mo_tools::playerweapontake();
    var_0 = fastrope_player_attach();
    level._id_0318.cgocamera = var_0;
    self._id_029C thread fastrope_player_quake();
    self endon( "overtakenow" );
    wait 0.1;
    var_1 = 0;

    for ( var_2 = 0; var_2 < self.seats.size; var_2++ )
    {
        if ( isdefined( self.seats[var_2].taken ) )
        {
            if ( self.seats[var_2].taken != level._id_0318 )
            {
                var_1++;
                continue;
            }

            break;
        }
    }

    self.que = common_scripts\utility::_id_0CED( self.que, level._id_0318, var_1 );
    wait 2;
    level._id_0318 _meth_8337( ( 15, 70, 0 ) );
    self._id_9C7E waittill( "reached_wait_node" );
    wait 2.5;

    if ( getdvar( "fastropeunlock" ) == "" )
        setdvar( "fastropeunlock", "0" );

    if ( !isdefined( getdvar( "fastropeunlock" ) ) )
        setdvar( "fastropeunlock", "0" );

    fastrope_player_viewshift();
    fastrope_player_unload();
}

play_fast_rope_fx()
{
    var_0 = spawn( "script_model", level._id_0318._id_02E2 );
    var_0 _meth_80B3( "tag_origin" );
    var_0 _meth_804F( level._id_0318 );
    playfxontag( level._id_058F["rain_drops_fastrope"], var_0, "tag_origin" );
    wait 3;
    var_0 delete();
}

fastrope_player_viewshift()
{
    var_0 = _func_0BC( getdvar( "fastropeunlock" ) );

    if ( !var_0 )
        fastrope_player_viewshift_lock();
    else
        fastrope_player_viewshift_nolock();
}

fastrope_player_unload()
{
    var_0 = _func_0BC( getdvar( "fastropeunlock" ) );

    if ( !var_0 )
        fastrope_player_unload_lock();
    else
        fastrope_player_unload_nolock();
}

fastrope_player_viewshift_nolock()
{
    var_0 = level._id_0318.cgocamera;
    wait 1;
    level._id_0318 _meth_807F( var_0, "tag_player", 1, 100, 100, 30, 80 );
    var_0 waittillmatch( "single anim", "end" );
}

fastrope_player_unload_nolock()
{
    var_0 = level._id_0318.cgocamera;
    var_1 = spawn( "script_origin", var_0._id_02E2 );
    var_1.angles = var_0.angles;
    var_0 _meth_804F( var_1 );
    var_2 = 1;
    var_3 = anglestoforward( ( 0, 233, 0 ) );
    var_3 = _id_A5A4::vector_multiply( var_3, 30 );
    self.que = common_scripts\utility::_id_0CF6( self.que, level._id_0318 );
    thread fastrope_que_check();
    fastrope_calc( level._id_0318 );
    level._id_0318._id_04B7 += 1;
    self._id_5605 = level._id_0318._id_04B7;
    var_4 = ( level._id_0318._id_7131 + 100 ) * -1;
    var_1 _meth_82AA( ( 3220, 255, 435 ), level._id_0318._id_04B7 );
    var_1 thread _id_A510::_id_0BE1( var_0, "loop", undefined, "stopanimscripted" );
    var_0 thread _id_A5A4::_id_69C4( "fastrope_start_plr" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_plr" );
    wait(level._id_0318._id_04B7);
    var_0 notify( "stop soundfastrope_loop_plr" );
    var_0 thread _id_A5A4::_id_69C4( "fastrope_end_plr" );
    var_1 notify( "stopanimscripted" );
    maps\mo_tools::playerweapongive();
    _func_0D6( "compass", 1 );
    _func_0D6( "ammoCounterHide", "0" );
    _func_0D6( "hud_showStance", 1 );
    _func_0D6( "hud_drawhud", "1" );
    level._id_0318 _meth_8051();
    level._id_0318 _meth_811D( 1 );
    level._id_0318 _meth_811B( 1 );
    level._id_0318 _meth_811C( 1 );
    var_1 delete();
    var_0 delete();
}

fastrope_player_viewshift_nolock2()
{
    var_0 = level._id_0318.cgocamera;
    wait 1;
    level._id_0318 _meth_807F( var_0, "tag_player", 1, 100, 100, 30, 80 );
    var_0 waittillmatch( "single anim", "end" );
}

fastrope_player_unload_nolock2()
{
    var_0 = level._id_0318.cgocamera;
    var_1 = spawn( "script_origin", var_0._id_02E2 );
    var_1.angles = var_0.angles;
    var_0 _meth_804F( var_1 );
    var_2 = 1;
    var_3 = anglestoforward( ( 0, 233, 0 ) );
    var_3 = _id_A5A4::vector_multiply( var_3, 30 );
    self.que = common_scripts\utility::_id_0CF6( self.que, level._id_0318 );
    thread fastrope_que_check();
    fastrope_calc( level._id_0318 );
    level._id_0318._id_04B7 += 1;
    self._id_5605 = level._id_0318._id_04B7;
    var_4 = ( level._id_0318._id_7131 + 100 ) * -1;
    var_1 _meth_82AA( ( 3220, 300, 400 ), level._id_0318._id_04B7 );
    var_1 thread _id_A510::_id_0BE1( var_0, "loop", undefined, "stopanimscripted" );
    var_0 thread _id_A5A4::_id_69C4( "fastrope_start_plr" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_plr" );
    var_5 = 0.5;
    wait(level._id_0318._id_04B7 - var_5);
    var_1 _meth_82B1( ( -60, 225, 0 ), var_5, var_5 * 0.5, var_5 * 0.5 );
    wait(var_5);
    var_0 notify( "stop soundfastrope_loop_plr" );
    var_0 thread _id_A5A4::_id_69C4( "fastrope_end_plr" );
    var_1 notify( "stopanimscripted" );
    maps\mo_tools::playerweapongive();
    _func_0D6( "compass", 1 );
    _func_0D6( "ammoCounterHide", "0" );
    _func_0D6( "hud_showStance", 1 );
    _func_0D6( "hud_drawhud", "1" );
    level._id_0318 _meth_8051();
    level._id_0318 _meth_811D( 1 );
    level._id_0318 _meth_811B( 1 );
    level._id_0318 _meth_811C( 1 );
    var_1 delete();
    var_0 delete();
}

fastrope_player_viewshift_lock()
{
    var_0 = level._id_0318.cgocamera;

    if ( isdefined( level._id_0318.ropecamera ) )
    {
        level._id_0318 _meth_80A4( 1, 0.1, 0.1, 0, 0, 0, 0 );
        wait 1;
        level._id_0318 _meth_807F( level._id_0318.ropecamera, "tag_player", 1, 0, 0, 0, 0, 1 );
        wait 0.1;
    }
    else
    {
        var_1 = spawn( "script_origin", var_0._id_02E2 );
        var_1.angles = level._id_0318 _meth_8338();
        var_2 = 1;
        var_3 = var_0 _meth_8185( "tag_player" );
        var_1 _meth_82B1( var_3, var_2, var_2 * 0.5, var_2 * 0.5 );
        var_4 = _func_0BC( var_2 * 20 );
        var_5 = var_4;
        level._id_0318 _meth_8326( 1 );

        while ( var_4 )
        {
            var_4--;
            level._id_0318 _meth_8337( ( var_1.angles[0], var_1.angles[1], level._id_0318 _meth_8338()[2] ) );
            wait 0.05;

            if ( var_4 > var_5 * 0.5 )
                continue;

            if ( var_4 % 2 )
                continue;

            if ( !var_4 )
                break;

            var_3 = var_0 _meth_8185( "tag_player" );
            var_1 _meth_82B1( var_3, var_2 * var_4 / var_5 );
        }

        level._id_0318 _meth_8337( ( var_1.angles[0], var_1.angles[1], level._id_0318 _meth_8338()[2] ) );
        level._id_0318 _meth_807F( var_0, "tag_player", 1, 15, 15, 5, 5 );
        wait 0.1;
        level._id_0318 _meth_8326( 0 );
        var_1 delete();
    }

    var_0 waittillmatch( "single anim", "end" );
}

fastrope_player_unload_lock()
{
    var_0 = level._id_0318.cgocamera;
    var_1 = spawn( "script_origin", var_0._id_02E2 );
    var_1.angles = var_0.angles;
    var_0 _meth_804F( var_1 );
    var_2 = 1;
    var_3 = anglestoforward( ( 0, 233, 0 ) );
    var_3 = _id_A5A4::vector_multiply( var_3, -50 );
    self.que = common_scripts\utility::_id_0CF6( self.que, level._id_0318 );
    thread fastrope_que_check();
    fastrope_calc( level._id_0318 );
    level._id_0318._id_04B7 += 0.5;
    self._id_5605 = level._id_0318._id_04B7;
    var_4 = ( level._id_0318._id_7131 + 100 ) * -1;
    var_5 = var_2 / ( level._id_0318._id_04B7 + 0.5 );
    var_6 = var_4 * var_5;
    var_7 = var_1._id_02E2 + var_3 + ( 0, 0, var_6 );
    var_1 _meth_82B1( ( 80, 233, 0 ), var_2, var_2 * 0.5, var_2 * 0.5 );
    var_1 _meth_82AA( var_7, var_2 );
    var_1 thread _id_A510::_id_0BE1( var_0, "loop", undefined, "stopanimscripted" );
    var_0 thread _id_A5A4::_id_69C4( "fastrope_start_plr" );
    var_0 thread common_scripts\utility::_id_6975( "fastrope_loop_plr" );
    thread play_fast_rope_fx();
    wait(var_2);
    var_8 = 0.5;
    var_9 = level._id_0318._id_04B7 - var_2 + 0.5 - var_8;
    var_6 = var_4 - var_6;
    var_5 = ( level._id_0318._id_04B7 + 0.5 ) * var_6 / var_4;
    var_3 = _id_A5A4::vector_multiply( var_3, -1 );
    var_7 = var_1._id_02E2 + var_3 + ( 0, 0, var_6 );
    var_1 _meth_82AA( var_7, level._id_0318._id_04B7 + 0.5 - var_2 );
    wait(var_9);
    var_1 _meth_82B1( ( 10, 233, 0 ), var_8, var_8 * 0.5, var_8 * 0.5 );
    wait(var_8 - 0.25);
    var_0 notify( "stop soundfastrope_loop_plr" );
    var_0 thread _id_A5A4::_id_69C4( "fastrope_end_plr" );
    var_1 _meth_82AA( ( 3200, 225, 337 ), 0.5 );
    var_1 notify( "stopanimscripted" );
    maps\mo_tools::playerweapongive();
    _func_0D6( "compass", 1 );
    _func_0D6( "ammoCounterHide", "0" );
    _func_0D6( "hud_showStance", 1 );
    _func_0D6( "hud_drawhud", "1" );
    wait 0.4;
    level._id_0318 _meth_8051();
    level._id_0318 _meth_811D( 1 );
    level._id_0318 _meth_811B( 1 );
    level._id_0318 _meth_811C( 1 );
    var_1 delete();
    var_0 delete();

    if ( isdefined( level._id_0318.ropecamera ) )
    {
        level._id_0318.ropecamera delete();
        level._id_0318.ropecamera = undefined;
    }
}
#using_animtree("fastrope");

fastrope_player_attach()
{
    var_0 = spawn( "script_model", self._id_029C _meth_8184( "tag_detach" ) );
    var_0 _meth_80B3( level._id_5D45["player"]["fastrope"] );
    var_0 _meth_804F( self._id_029C, "tag_detach", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_0C72 = fastrope_animname( self._id_04D9, "player" );
    var_0 _meth_8117( #animtree );
    var_0 _meth_8056();
    level._id_0318 _meth_807F( var_0, "tag_player", 1, 100, 100, 30, 60 );
    self._id_029C thread _id_A510::_id_0C24( var_0, "ride", "tag_detach", self._id_029C );
    level._id_0318 _meth_811D( 0 );
    level._id_0318 _meth_811B( 0 );
    level._id_0318 _meth_811C( 0 );

    if ( isdefined( level._id_78B5["fastrope_intro"] ) )
    {
        var_1 = _id_A5A4::_id_88D1( "fastrope_intro" );
        var_1 _meth_804F( self._id_029C, "tag_detach" );
        self._id_029C thread _id_A510::_id_0C24( var_1, "opening", "tag_detach", self._id_029C );
        level._id_0318 _meth_807F( var_1, "tag_player", 1, 65, 74, 30, 35, 1 );
        level._id_0318.ropecamera = var_1;

        if ( isdefined( level.scr_gun["fastrope_intro"] ) )
            var_1 _meth_801D( level.scr_gun["fastrope_intro"], "tag_weapon" );
    }

    return var_0;
}

fastrope_player_quake()
{
    self endon( "death" );
    self endon( "stopquake" );

    for (;;)
    {
        wait 0.1;
        _func_18C( 0.2, 0.1, self._id_02E2, 256 );
    }
}
#using_animtree("vehicles");

fastrope_heli_fly()
{
    self.inflight = 1;

    if ( self._id_71D4 )
        return;

    if ( self.returnflight )
        self waittill( "returnflight" );

    if ( isdefined( self.pathnode ) )
    {
        var_0 = _func_06F( self.pathnode._id_02E2, self.pathnode.angles, level._id_78AC[self._id_0C72]["pathanim"] );
        var_1 = _func_070( self.pathnode._id_02E2, self.pathnode.angles, level._id_78AC[self._id_0C72]["pathanim"] );
        self._id_9C7E = spawn( "script_model", var_0 );
        self._id_9C7E.angles = var_1;
    }
    else if ( isdefined( self.startnode ) )
        self._id_9C7E = _func_1F1( self.modelname, self._id_04A6, self._id_04D9, self.startnode._id_02E2, self.startnode.angles );
    else
        return;

    self._id_9C7E _meth_80B3( self.modelname );
    self._id_029C = self._id_9C7E;

    if ( isdefined( level._sea_org ) )
    {
        self._id_029C = spawn( "script_model", self._id_9C7E._id_02E2 );
        self._id_029C _meth_80B3( self.modelname );
        self._id_029C.angles = self._id_9C7E.angles;
        self._id_029C thread fastrope_heli_fly_sea( self._id_9C7E );
        self._id_9C7E _meth_8056();
        self._id_9C7E _meth_80C0( 0 );
    }

    self._id_029C _meth_804F( self._id_9C7E, "tag_detach" );
    self._id_029C _meth_8117( #animtree );
    self._id_029C _meth_814D( level._id_78AC[fastrope_animname( self._id_04D9, "heli" )]["loop"][0] );
    self._id_029C._id_04FF = self._id_04D9;
    self._id_029C thread _id_A5AA::_id_0995();
    self notify( "inflight" );

    if ( self._id_0318 )
        thread fastrope_player_think();

    self endon( "overtakenow" );
    wait 0.1;
    level.fastrope_globals.heli_inflight = 1;
    fastrope_heli_waittill_unload();
    self._id_9C7E notify( "reached_wait_node" );
    self.inflight = 0;
    level.fastrope_globals.heli_inflight = 0;
    self.returnflight = 1;
    self._id_71D4 = 1;
    self notify( "ready" );
    self._id_71D4 = 0;

    while ( self.que.size )
        self waittill( "check_fastrope_que" );

    wait(self._id_5605);
    self._id_9C7E notify( "going_home" );

    if ( isdefined( self.overtake ) )
    {
        self notify( "overtake" );
        return;
    }

    if ( isdefined( self.pathnode ) )
    {
        self._id_9C7E waittillmatch( "single anim", "end" );
        self._id_9C7E notify( "reached_end_node" );
    }
    else
    {
        self._id_9C7E _meth_828D( 10 );
        self._id_9C7E waittill( "reached_end_node" );
    }

    fastrope_heli_cleanup();
}

fastrope_heli_waittill_unload()
{
    if ( isdefined( self.pathnode ) )
    {
        self._id_9C7E endon( "fake_wait_node" );
        wait 0.1;
        self._id_029C thread common_scripts\utility::_id_6975( self.enginesnd );
        self._id_9C7E._id_0C72 = self._id_0C72;
        self._id_9C7E _meth_8117( #animtree );
        wait 1.15;
        self.pathnode thread _id_A510::_id_0C24( self._id_9C7E, "pathanim" );
        self._id_9C7E waittillmatch( "single anim", "stop" );
    }
    else
    {
        self._id_9C7E _meth_8279( self.startnode );
        self._id_9C7E _meth_827B();
        wait 0.1;
        self._id_029C thread common_scripts\utility::_id_6975( self.enginesnd );
        self._id_9C7E _meth_80C7( self.stopnode );
        self._id_9C7E waittill( "reached_wait_node" );
        self notify( "almost_ready" );
        self._id_9C7E _meth_827F( 0, 25 );

        while ( self._id_9C7E _meth_8282() > 0 )
            wait 0.1;
    }
}

fastrope_heli_cleanup()
{
    self._id_029C notify( "stop_anim_loop" );
    self._id_029C notify( "stop sound" + self.enginesnd );
    self._id_9C7E delete();
    self._id_9C7E = undefined;

    if ( isdefined( self._id_029C ) )
    {
        self._id_029C delete();
        self._id_029C = undefined;
    }

    self.returnflight = 0;
    self notify( "returnflight" );
}

fastrope_heli_overtake()
{
    self.overtake = 1;
    self waittill( "overtake" );
    self._id_029C notify( "overtake" );
    var_0 = self._id_029C.angles;
    var_1 = self._id_9C7E._id_02E2;
    self._id_9C7E delete();
    self._id_9C7E = undefined;
    self._id_9C7E = _func_1F1( self.modelname, self._id_04A6, self._id_04D9, var_1, var_0 );
    self._id_9C7E._id_04FF = "blackhawk";
    self._id_9C7E._id_01E6 = 100000;
    self._id_9C7E _meth_8056();
    self._id_9C7E _meth_80C0( 0 );
    self._id_029C _meth_804F( self._id_9C7E, "tag_detach" );
    self._id_029C thread fastrope_heli_fly_sea( self._id_9C7E );
}

fastrope_heli_overtake_now()
{
    self.overtake = 1;
    self notify( "overtakenow" );
    self._id_029C notify( "overtake" );
    var_0 = self._id_9C7E.angles;
    var_1 = self._id_9C7E._id_02E2;
    self._id_9C7E delete();
    self._id_9C7E = undefined;
    self._id_9C7E = _func_1F1( self.modelname, self._id_04A6, self._id_04D9, var_1, var_0 );
    self._id_9C7E._id_04FF = "blackhawk";
    self._id_9C7E._id_01E6 = 100000;
    self._id_9C7E _meth_8056();
    self._id_9C7E _meth_80C0( 0 );
    self._id_029C thread fastrope_heli_fly_sea( self._id_9C7E );
}

fastrope_heli_playexteriorlightfx()
{
    playfxontag( level._id_058F["aircraft_light_wingtip_red"], self, "tag_light_L_wing" );
    playfxontag( level._id_058F["aircraft_light_wingtip_green"], self, "tag_light_R_wing" );
    playfxontag( level._id_058F["aircraft_light_white_blink"], self, "tag_light_belly" );
    wait 0.25;
    playfxontag( level._id_058F["aircraft_light_white_blink"], self, "tag_light_tail" );
}

fastrope_heli_playinteriorlightfx()
{
    playfxontag( level._id_058F["aircraft_light_cockpit_blue"], self, "tag_light_cockpit01" );
}

fastrope_heli_playinteriorlightfx2()
{
    playfxontag( level._id_058F["aircraft_light_cockpit_red"], self, "tag_light_cargo01" );
}

fastrope_heli_playinteriorlightgreenfx( var_0 )
{
    var_1 = common_scripts\utility::_id_8959();
    var_1 _meth_804F( self, "tag_light_cargo01", ( 0, 0, 0 ), ( 0, -90, 0 ) );

    if ( var_0 == 1 )
        playfxontag( level._id_058F["aircraft_light_cockpit_green"], var_1, "tag_origin" );
}

fastrope_heli_fly_sea( var_0 )
{
    self endon( "death" );
    self endon( "overtake" );

    for (;;)
    {
        var_1 = level._sea_link _meth_81B4( var_0._id_02E2 );
        var_2 = _func_11C( level._sea_link.angles, var_0 _meth_8185( "tag_detach" ) );
        self _meth_82AA( var_1 + level._sea_link._id_6379, 0.1 );
        self _meth_82B1( var_2, 0.1 );
        wait 0.1;
    }
}

fastrope_calc( var_0 )
{
    var_1 = var_0._id_02E2;
    var_2 = _func_08F( var_1, var_1 + ( 0, 0, -10000 ) );
    var_3 = _func_0EE( var_1, var_2 ) + 1;
    var_4 = 400;
    var_5 = _func_0BC( var_3 - 128 );
    var_6 = _func_0BC( var_5 / var_4 );
    var_7 = var_5 - var_4 * var_6;
    var_8 = var_7 / var_4;
    var_9 = ( var_6 + var_8 ) * 1.6;
    var_10 = var_8 * -360;
    var_11 = var_0.angles + ( 0, var_10, 0 );
    var_0._id_7131 = var_5;
    var_0._id_04B7 = var_9;
    var_0.startangle = var_11;
}

fastrope_setup()
{
    if ( !( isdefined( self._id_0398 ) && self._id_0398 == "fastrope_friendlies" ) )
        return;

    self._id_47A3 = fastrope_heli_setup( self._id_04A6 );
    fastrope_animload( self._id_47A3 );
    thread fastrope_spawner_think();
}

fastrope_heli_setup( var_0 )
{
    var_1 = undefined;
    var_1 = level.fastrope_globals.helicopters[fastrope_heliname( var_0 )];

    if ( isdefined( var_1 ) )
        return var_1;

    var_2 = common_scripts\utility::_id_40FB( var_0, "target" );
    var_1 = spawnstruct();
    var_1._id_9C7E = undefined;
    var_1._id_04A6 = fastrope_heliname( var_0 );
    var_1._id_0C72 = var_1._id_04A6;
    var_1.startnode = _func_1EC( var_0, "targetname" );
    var_1.stopnode = undefined;
    var_1._id_5605 = undefined;
    var_1._id_71D4 = 0;
    var_1.inflight = 0;
    var_1.returnflight = 0;
    var_1.que = [];
    var_1.rope_dropped = [];
    var_1.modelname = "vehicle_blackhawk_hero_sas_night";
    var_1._id_04D9 = "blackhawk";
    var_1.enginesnd = "blackhawk_engine_high";
    var_1._id_0318 = 0;
    var_1.unload = "both";
    var_1.unloadwait = 1;

    if ( isdefined( var_2._id_7A99 ) )
    {
        var_3 = _func_124( var_2._id_7A99, ":;,= " );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( _func_123( var_3[var_4] ) == "model" )
            {
                var_4++;

                switch ( var_3[var_4] )
                {
                    case "blackhawk":
                        var_1.modelname = "vehicle_blackhawk_hero_sas_night";
                        var_1._id_04D9 = "blackhawk";
                        var_1.enginesnd = "blackhawk_engine_high";
                        break;
                }

                continue;
            }

            if ( _func_123( var_3[var_4] ) == "player" )
            {
                var_4++;

                if ( _func_123( var_3[var_4] ) == "true" )
                    var_1._id_0318 = 1;

                continue;
            }

            if ( _func_123( var_3[var_4] ) == "unload" )
            {
                var_4++;

                if ( var_3[var_4] == "both" || var_3[var_4] == "left" || var_3[var_4] == "right" )
                    var_1.unload = var_3[var_4];
            }
        }
    }

    fastrope_heli_setup_seats( var_1 );

    if ( isdefined( var_1.startnode ) )
    {
        var_5 = var_1.startnode;

        while ( isdefined( var_5._id_04A4 ) )
        {
            var_5 = _func_1EC( var_5._id_04A4, "targetname" );

            if ( isdefined( var_5._id_0398 ) && var_5._id_0398 == "stop" )
            {
                var_1.stopnode = var_5;
                break;
            }
        }

        if ( !isdefined( var_1.stopnode ) )
        {

        }
    }

    level.fastrope_globals.helicopters[var_1._id_04A6] = var_1;
    return var_1;
}

fastrope_heli_setup_seats( var_0 )
{
    var_0.seats = [];

    switch ( var_0._id_04D9 )
    {
        case "blackhawk":
            switch ( var_0.unload )
            {
                case "both":
                    var_0.seats[0] = fastrope_createseat( var_0._id_04D9, 1 );
                    var_0.seats[1] = fastrope_createseat( var_0._id_04D9, 2 );
                    var_0.seats[2] = fastrope_createseat( var_0._id_04D9, 5 );
                    var_0.seats[3] = fastrope_createseat( var_0._id_04D9, 4 );
                    var_0.seats[4] = fastrope_createseat( var_0._id_04D9, 8 );
                    var_0.seats[5] = fastrope_createseat( var_0._id_04D9, 6 );
                    var_0.seats[6] = fastrope_createseat( var_0._id_04D9, 7 );
                    var_0.seats[7] = fastrope_createseat( var_0._id_04D9, 3 );
                    var_0.seats[8] = fastrope_createseat( var_0._id_04D9, 9 );
                    var_0.seats[9] = fastrope_createseat( var_0._id_04D9, 10 );

                    if ( var_0._id_0318 )
                    {
                        level._id_0318.side = "right";
                        var_0.seats[4].taken = level._id_0318;
                    }

                    break;
                case "right":
                    var_0.seats[0] = fastrope_createseat( var_0._id_04D9, 1 );
                    var_0.seats[1] = fastrope_createseat( var_0._id_04D9, 2 );
                    var_0.seats[2] = fastrope_createseat( var_0._id_04D9, 8 );
                    var_0.seats[3] = fastrope_createseat( var_0._id_04D9, 7 );
                    var_0.seats[4] = fastrope_createseat( var_0._id_04D9, 9 );
                    var_0.seats[5] = fastrope_createseat( var_0._id_04D9, 10 );

                    if ( var_0._id_0318 )
                    {
                        level._id_0318.side = "right";
                        var_0.seats[2].taken = level._id_0318;
                    }

                    break;
                case "left":
                    var_0.seats[0] = fastrope_createseat( var_0._id_04D9, 5 );
                    var_0.seats[1] = fastrope_createseat( var_0._id_04D9, 4 );
                    var_0.seats[2] = fastrope_createseat( var_0._id_04D9, 6 );
                    var_0.seats[3] = fastrope_createseat( var_0._id_04D9, 3 );
                    var_0.seats[4] = fastrope_createseat( var_0._id_04D9, 9 );
                    var_0.seats[5] = fastrope_createseat( var_0._id_04D9, 10 );

                    if ( var_0._id_0318 )
                        level._id_0318.side = "right";

                    break;
            }

            break;
    }
}

fastrope_precache()
{
    level._id_5D45["player"]["fastrope"] = "fastrope_arms";
    level._id_5D45["heli"]["rope"]["right"] = "rope_test_ri";
    level._id_5D45["heli"]["rope"]["left"] = "rope_test";
    precachemodel( level._id_5D45["player"]["fastrope"] );
    precachemodel( level._id_5D45["heli"]["rope"]["right"] );
    precachemodel( level._id_5D45["heli"]["rope"]["left"] );
}

fastrope_ropeanimload( var_0, var_1, var_2, var_3 )
{
    level._id_78AC[self._id_04A6]["ropeall" + var_2] = var_3;
    level._id_78AC[self._id_04A6]["ropeidle" + var_2][0] = var_0;
    level._id_78AC[self._id_04A6]["ropedrop" + var_2] = var_1;
}
#using_animtree("generic_human");

fastrope_animload( var_0 )
{
    var_1 = var_0._id_04D9;

    if ( level.fastrope_globals.animload[var_1] )
        return;

    level.fastrope_globals.animload[var_1] = 1;
    fastrope_animload_heli( var_1 );
    fastrope_animload_player( var_1 );

    switch ( var_1 )
    {
        case "blackhawk":
            var_2 = fastrope_animname( var_1, 1 );
            level._id_78AC[var_2]["idle"][0] = %bh_1_idle;
            level._id_78AC[var_2]["grab"] = %bh_1_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 2 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 3 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 4 );
            level._id_78AC[var_2]["idle"][0] = %bh_4_idle;
            level._id_78AC[var_2]["grab"] = %bh_4_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 5 );
            level._id_78AC[var_2]["idle"][0] = %bh_5_idle;
            level._id_78AC[var_2]["grab"] = %bh_5_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 6 );
            level._id_78AC[var_2]["idle"][0] = %bh_6_idle;
            level._id_78AC[var_2]["grab"] = %bh_6_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 7 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 8 );
            level._id_78AC[var_2]["idle"][0] = %bh_2_idle;
            level._id_78AC[var_2]["grab"] = %bh_2_begining;
            level._id_78AC[var_2]["loop"][0] = %bh_fastrope_loop;
            level._id_78AC[var_2]["land"] = %bh_fastrope_land;
            var_2 = fastrope_animname( var_1, 9 );
            level._id_78AC[var_2]["idle"][0] = %bh_pilot_idle;
            var_2 = fastrope_animname( var_1, 10 );
            level._id_78AC[var_2]["idle"][0] = %bh_copilot_idle;
            level._id_78AC[var_2]["minigun"][0] = %h1_cargoship_blackhawk_copilote_minigun;
            break;
    }
}

fastrope_createseat( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.taken = undefined;
    var_2._id_0C72 = fastrope_animname( var_0, var_1 );
    var_2.side = fastrope_getside( var_0, var_1 );
    var_2._id_0204 = fastrope_getindex( var_0, var_1 );
    var_2.spin = fastrope_getspin( var_0, var_1 );
    var_2._id_6E57 = var_1;
    return var_2;
}

fastrope_heliname( var_0 )
{
    return level.fastrope_globals.basename + var_0;
}

fastrope_animname( var_0, var_1 )
{
    return "fastrope_" + var_0 + "_" + var_1;
}

fastrope_get_heli( var_0 )
{
    return level.fastrope_globals.helicopters[level.fastrope_globals.basename + var_0];
}

fastrope_getspin( var_0, var_1 )
{
    var_2 = [];

    switch ( var_0 )
    {
        case "blackhawk":
            var_2[1] = 0;
            var_2[2] = 0;
            var_2[8] = 0;
            var_2[7] = 0;
            var_2[5] = 0;
            var_2[4] = 1;
            var_2[6] = 1;
            var_2[3] = 1;
            var_2[9] = undefined;
            var_2[10] = undefined;
    }

    return var_2[var_1];
}

fastrope_getindex( var_0, var_1 )
{
    var_2 = [];

    switch ( var_0 )
    {
        case "blackhawk":
            var_2[1] = 0;
            var_2[2] = 0.25;
            var_2[8] = -1.5;
            var_2[7] = 1;
            var_2[5] = 0;
            var_2[4] = 0.25;
            var_2[6] = -1.5;
            var_2[3] = 1;
            var_2[9] = undefined;
            var_2[10] = undefined;
    }

    return var_2[var_1];
}

fastrope_getside( var_0, var_1 )
{
    var_2 = [];

    switch ( var_0 )
    {
        case "blackhawk":
            var_2[1] = "right";
            var_2[2] = "right";
            var_2[3] = "left";
            var_2[4] = "left";
            var_2[5] = "left";
            var_2[6] = "left";
            var_2[7] = "right";
            var_2[8] = "right";
            var_2[9] = "right";
            var_2[10] = "right";
    }

    return var_2[var_1];
}
#using_animtree("fastrope");

fastrope_animload_player( var_0 )
{
    switch ( var_0 )
    {
        case "blackhawk":
            var_1 = fastrope_animname( var_0, "player" );
            level._id_78AC[var_1]["idle"][0] = %cs_bh_player_idle;
            level._id_78AC[var_1]["ride"] = %bh_player_rope_start;
            level._id_78AC[var_1]["loop"][0] = %bh_player_rope_middle;
            level._id_78AC[var_1]["land"] = %bh_player_rope_end;
            break;
    }
}
#using_animtree("vehicles");

fastrope_animload_heli( var_0 )
{
    switch ( var_0 )
    {
        case "blackhawk":
            var_1 = fastrope_animname( var_0, "heli" );
            level._id_78AC[var_1]["loop"][0] = %bh_rotors;
            break;
    }
}

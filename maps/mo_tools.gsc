// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

wait_timeout( var_0, var_1 )
{
    self endon( "wait timed out" );
    thread wait_timeout2( var_0, var_1 );
    self waittill( "msg" );
}

wait_timeout2( var_0, var_1 )
{
    self endon( "msg" );
    wait(var_1);
    self notify( "wait timed out" );
}

get_ai( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "allies";

    if ( !isdefined( var_2 ) )
        var_2 = "targetname";

    var_3 = _func_0D9( var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        switch ( var_2 )
        {
            case "targetname":
                if ( isdefined( var_3[var_5]._id_04A6 ) && var_3[var_5]._id_04A6 == var_0 )
                    var_4[var_4.size] = var_3[var_5];

                continue;
            case "script_noteworthy":
                if ( isdefined( var_3[var_5]._id_0398 ) && var_3[var_5]._id_0398 == var_0 )
                    var_4[var_4.size] = var_3[var_5];

                continue;
            case "script_forcecolor":
                if ( var_3[var_5] _id_A5A4::_id_1CC0( var_0 ) )
                    var_4[var_4.size] = var_3[var_5];

                continue;
        }
    }

    return var_4;
}

get_closest( var_0, var_1, var_2 )
{
    if ( var_1.size < 1 )
        return;

    var_3 = _func_0F0( var_1[0]._id_02E2, var_0 );
    var_4 = var_1[0];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = _func_0F0( var_1[var_5]._id_02E2, var_0 );

        if ( var_6 >= var_3 )
            continue;

        var_3 = var_6;
        var_4 = var_1[var_5];
    }

    if ( isdefined( var_2 ) && _func_0EE( var_0, var_4._id_02E2 ) > var_2 )
        var_4 = undefined;

    return var_4;
}

get_closest_fx( var_0, var_1, var_2 )
{

}

get_closest_ent( var_0, var_1, var_2 )
{
    if ( var_1.size < 1 )
        return;

    var_3 = _func_0F0( var_1[0] _meth_8097(), var_0 );
    var_4 = var_1[0];

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = _func_0F0( var_1[var_5] _meth_8097(), var_0 );

        if ( var_6 >= var_3 )
            continue;

        var_3 = var_6;
        var_4 = var_1[var_5];
    }

    if ( isdefined( var_2 ) && _func_0EE( var_0, var_4 _meth_8097() ) > var_2 )
        var_4 = undefined;

    return var_4;
}

get_ents_within_dist( var_0, var_1, var_2 )
{
    if ( var_1.size < 1 )
        return;

    var_3 = [];

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        var_5 = _func_0EE( var_1[var_4] _meth_8097(), var_0 );

        if ( var_5 > var_2 )
            continue;

        var_3[var_3.size] = var_1[var_4];
    }

    return var_3;
}

_id_2D41( var_0, var_1, var_2, var_3 )
{
    var_1._id_01FF = 1;
    var_1._id_63DF = var_1._id_01C4;
    var_1._id_01C4 = 16;
    var_4 = 0;
    var_5 = 0;

    if ( isdefined( var_1._id_7E3E ) )
        var_4 = 1;

    if ( isdefined( var_1._id_58D7 ) )
        var_5 = 1;

    if ( !var_4 )
        var_1 _id_A5A4::_id_7E3F();

    if ( !var_5 )
        var_1 thread _id_A5A4::_id_58D7();

    if ( var_3 == "kick" )
    {
        var_6 = anglestoforward( var_0.angles );
        var_6 = _id_A5A4::vector_multiply( var_6, 20 );
        var_7 = spawn( "script_origin", var_0._id_02E2 + var_6 );
        var_7.angles = var_0.angles;
        var_0 = var_7;
    }

    var_1._id_63C4 = var_1._id_0C72;
    var_1._id_0C72 = "guy";

    if ( var_3 == "kick" )
        var_0 _id_A510::_id_0BFF( var_1, var_3 );
    else
    {
        var_1 _meth_81A9( var_0 );
        var_1 waittill( "goal" );
    }

    var_0 thread _id_A510::_id_0C24( var_1, var_3 );
    var_1 waittillmatch( "single anim", "kick" );
    common_scripts\utility::_id_0D13( var_2, ::door_breach_door );

    if ( var_3 == "kick" )
    {
        wait 0.2;
        var_1 _meth_8143();
    }
    else
        var_1 waittillmatch( "single anim", "end" );

    var_1._id_0C72 = var_1._id_63C4;
    var_1._id_01C4 = var_1._id_63DF;
    var_1._id_01FF = 0;

    if ( !var_4 )
        var_1 _id_A5A4::_id_9A61();

    if ( !var_5 )
        var_1 _id_A5A4::_id_8EA4();
}

door_breach_door()
{
    self _meth_82BB();

    if ( self._id_03DA & 1 )
        self _meth_805A();

    var_0 = 0;
    var_1 = 0;
    var_2 = 0;

    switch ( self._id_7A99 )
    {
        case "left":
            var_1 = _func_0B5( 88, 92 );
            break;
        case "right":
            var_1 = -1 * _func_0B5( 88, 92 );
            break;
        case "xleft":
            var_2 = 90;
            break;
        case "xright":
            var_2 = -90;
            break;
        case "yleft":
            var_0 = 90;
            break;
        case "yright":
            var_0 = -90;
            break;
    }

    var_3 = 0.4;
    var_4 = self.angles + ( var_0, var_1, var_2 );
    self _meth_82B1( var_4, var_3, 0.05, 0.05 );
    wait(var_3);
    self _meth_82BA();
    self _meth_8059();
}

floodspawner_switch( var_0, var_1 )
{
    var_2 = var_0.size;

    if ( var_0.size > var_1.size )
        var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
        var_0[var_3] thread spawner_switch_think( var_1[var_3] );

    if ( var_3 < var_1.size )
    {
        for ( var_4 = var_3; var_4 < var_1.size; var_4++ )
            var_1[var_4] thread spawner_switch_think2();
    }
}

spawner_switch_think( var_0 )
{
    var_0 endon( "death" );
    var_0.floodspawncount--;
    self waittill( "death" );
    var_0 thread spawner_switch_think2();
}

spawner_switch_think2()
{
    self endon( "death" );
    self.count = 1;

    if ( !_id_A5A4::_id_7B20() )
        wait(_func_0B5( 2, 4 ));

    for (;;)
    {
        var_0 = self _meth_8095();

        if ( !_id_A5A4::_id_88F1( var_0 ) )
            break;

        wait 0.2;
    }
}
#using_animtree("fastrope");

player_fastrope_go( var_0 )
{
    var_1 = spawn( "script_model", var_0._id_02E2 );
    var_1 _meth_80B3( "fastrope_arms" );
    var_1.angles = var_0.angles;
    var_2 = spawn( "script_origin", var_0._id_02E2 );
    var_2.angles = level._id_0318.angles;
    var_1 _meth_804F( var_2 );
    var_1._id_0C72 = "playerfastrope";
    var_1 _meth_8117( #animtree );
    level._id_0318 _meth_811D( 0 );
    level._id_0318 _meth_8326( 1 );
    level._id_0318 _meth_8081( var_1, "tag_player" );
    playerweapontake();
    var_2 _id_A510::_id_0C24( var_1, "fastrope_on" );
    var_2 _meth_82AD( ( var_0._id_7131 + 96 ) * -1, var_0._id_04B7 + 0.5 );
    var_2 thread _id_A510::_id_0BE1( var_1, "fastrope_loop", undefined, "stopanimscripted" );
    wait(var_0._id_04B7);
    var_2 notify( "stopanimscripted" );
    level._id_0318 _id_A510::_id_0C24( var_1, "fastrope_off" );
    playerweapongive();
    level._id_0318 _meth_8051();
    level._id_0318 _meth_8326( 0 );
    level._id_0318 _meth_811D( 1 );
    var_2 delete();
    var_1 delete();
}

ai_clear_dialog( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level.ai_clear_dialog_last ) )
        level.ai_clear_dialog_last = 0;

    var_5 = _func_0D9( "axis" );
    ai_clear_dialog_logic( var_5, var_0, var_1, var_2, var_3, var_4 );
}

ai_clear_dialog_logic_guy( var_0 )
{
    self waittill( "death" );
    var_0.count--;
    var_0 notify( "ai_death" );
}

ai_clear_dialog_logic_check()
{
    self endon( "death" );
    self._id_71D4 = 0;

    while ( self.count )
        self waittill( "ai_death" );

    self._id_71D4 = 1;
    self notify( "ready" );
}

ai_clear_dialog_logic( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_2 ) )
        var_2 endon( var_3 );

    var_6 = spawnstruct();
    var_6._id_71D4 = 1;

    if ( isdefined( var_1 ) )
    {
        var_6.count = var_1.size;
        var_6 thread ai_clear_dialog_logic_check();
        common_scripts\utility::_id_0D13( var_1, _id_A5A4::_id_0798, ::ai_clear_dialog_logic_guy, var_6 );
    }

    _id_A5A4::_id_A07E( var_0 );

    if ( !var_6._id_71D4 )
        var_6 waittill( "ready" );

    var_6 notify( "death" );

    if ( isdefined( var_4 ) )
    {
        wait 0.5;

        if ( var_4 == level._id_0318 )
            thread radio_msg_stack( var_5 );
        else
            var_4 thread _id_A5A4::_id_69C4( var_5 );
    }
    else
    {
        var_7 = _func_0D9( "allies" );
        var_8 = [];
        var_9 = _id_A5A4::_id_3CFA( level._id_0318._id_02E2, var_7, 1024 );

        if ( !isdefined( var_9 ) )
        {
            level notify( "ai_clear_dialog_done" );
            return;
        }

        var_10 = 2;

        for ( var_11 = level.ai_clear_dialog_last; var_11 == level.ai_clear_dialog_last; var_11 = _func_0B2( var_10 ) )
        {

        }

        level.ai_clear_dialog_last = var_11;
        wait 0.5;

        switch ( var_11 )
        {
            case 0:
                var_9 thread _id_A5A4::_id_69C4( level.level_name + "_gm2_clear" );
                break;
            case 1:
                var_9 thread _id_A5A4::_id_69C4( level.level_name + "_gm3_clear" );
                break;
        }
    }

    level notify( "ai_clear_dialog_done" );
}

playerweapongive()
{
    level._id_0318 notify( "restore_player_weapons" );
}

playerweapontake()
{
    thread playerweapontakelogic();
}

playerweapontakelogic()
{
    if ( isdefined( level._id_0318.weaponstaken ) )
        return;

    level._id_0318.weaponstaken = 1;
    level._id_0318 _meth_831A();
    level._id_0318 waittill( "restore_player_weapons" );
    level._id_0318 _meth_831B();
    level._id_0318.weaponstaken = undefined;
}

anim_single_stack( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2 thread anim_single_stack_proc( var_0, var_1 );
    var_2 waittill( "anim_single_done" );
}

anim_single_stack_proc( var_0, var_1 )
{
    if ( !isdefined( level.anim_stack ) )
        level.anim_stack = [];

    var_2 = "" + var_0._id_0908 + var_1;
    level.anim_stack[level.anim_stack.size] = var_2;

    while ( level.anim_stack[0] != var_2 )
        level waittill( "level_anim_stack_ready" );

    _id_A510::_id_0C24( var_0, var_1 );
    level.anim_stack = common_scripts\utility::_id_0CF6( level.anim_stack, var_2 );
    level notify( "level_anim_stack_ready" );
    self notify( "anim_single_done" );
}

radio_msg_stack( var_0 )
{
    var_1 = spawnstruct();
    var_1 thread radio_msg_stack_proc( var_0 );
    var_1 waittill( "radio_dialogue_done" );
}

radio_msg_stack_proc( var_0 )
{
    if ( !isdefined( level.radio_stack ) )
        level.radio_stack = [];

    level.radio_stack[level.radio_stack.size] = var_0;

    while ( level.radio_stack[0] != var_0 )
        level waittill( "level_radio_stack_ready" );

    _id_A5A4::_id_70BD( var_0 );
    level.radio_stack = common_scripts\utility::_id_0CF6( level.radio_stack, var_0 );
    level notify( "level_radio_stack_ready" );
    self notify( "radio_dialogue_done" );
}

disable_cqbwalk_ign_demo_wrapper()
{
    _id_A5A4::_id_2A8D();

    if ( !isdefined( self.a.cqbchangedontmodifyinterval ) || !self.a.cqbchangedontmodifyinterval )
        self._id_020C = 96;
}

enable_cqbwalk_ign_demo_wrapper()
{
    _id_A5A4::_id_30B0();

    if ( !isdefined( self.a.cqbchangedontmodifyinterval ) || !self.a.cqbchangedontmodifyinterval )
        self._id_020C = 50;
}
